#!/usr/bin/env python3
"""Disclosed run-local registration-name compatibility adapter, version 1.

Only the candidate declaration predicate is replaced. Canonical registration,
managed-source generation, transaction handling, hashes and receipts are reused.
This adapter is a proposal; controller adoption and hash binding are separate.
"""
import sys

sys.dont_write_bytecode = True

import argparse
import ast
import copy
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import stat

V = Path("/Users/ashtonsperry/VerityOS")
R = V / "experiments/erdos-993-first-interior-aggregate-dre-2026-09-24"
LF_PATH = V / "skills/lean-formalization/scripts/prepare_lean_formalization.py"
LF_SHA256 = "f19e8a58d6d25fe8a8eae1a87d243575946c4e1ab55c7d244860877f6fad0982"
KERNEL_PATH = V / "skills/lean-kernel-verification/scripts/verify_lean_kernel.py"
KERNEL_SHA256 = "37482a2dd78ed5646c54c38b480f350a1656d17b6088bd357a6a6f8f9723d4b5"
ADAPTER_VERSION = "e993.interior.lean-registration-name-compat.v1"


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_pinned(name, path, expected):
    require(sha256(path) == expected, "canonical helper hash differs: " + str(path))
    spec = importlib.util.spec_from_file_location(name, path)
    require(spec is not None and spec.loader is not None, "cannot load canonical helper")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    require(sha256(path) == expected, "canonical helper changed during import")
    return module


def load_canonical():
    lf = load_pinned("e993_register_compat_original", LF_PATH, LF_SHA256)
    kernel = load_pinned("e993_register_compat_masker", KERNEL_PATH, KERNEL_SHA256)
    return lf, kernel


def declaration_matches(kind, name, text, mask):
    """Match an exact supported declaration spelling, not comments or strings.

    Preserve the original leaf-name form; additionally admit the exact requested
    qualified name and noncomputable on definition forms. Namespace semantics
    remain the responsibility of kernel verification and independent fidelity.
    """
    prefixes = {
        "definition": r"(?:def|abbrev|structure|inductive|class)",
        "lemma": r"lemma",
        "theorem": r"theorem",
    }
    names = "(?:" + "|".join(re.escape(value) for value in
                            sorted({name, name.split(".")[-1]}, key=len, reverse=True)) + ")"
    modifier = r"(?:noncomputable\s+)?" if kind == "definition" else ""
    pattern = rf"(?m)^\s*{modifier}{prefixes[kind]}\s+{names}(?![A-Za-z0-9_'.])"
    return re.search(pattern, mask(text)) is not None


def make_compatible_reader(lf, kernel):
    """Copy the pinned canonical function AST and replace only its predicate."""
    require(sha256(LF_PATH) == LF_SHA256 and sha256(KERNEL_PATH) == KERNEL_SHA256,
            "canonical source pin changed")
    tree = ast.parse(LF_PATH.read_text(encoding="utf-8"))
    functions = [node for node in tree.body
                 if isinstance(node, ast.FunctionDef) and node.name == "validate_source"]
    require(len(functions) == 1, "unexpected canonical validate_source definition")
    original = functions[0]
    updated = copy.deepcopy(original)
    matches = [
        node for node in ast.walk(updated)
        if isinstance(node, ast.If) and isinstance(node.test, ast.UnaryOp)
        and isinstance(node.test.op, ast.Not) and isinstance(node.test.operand, ast.Call)
        and isinstance(node.test.operand.func, ast.Attribute)
        and isinstance(node.test.operand.func.value, ast.Name)
        and node.test.operand.func.value.id == "re"
        and node.test.operand.func.attr == "search"
    ]
    require(len(matches) == 1, "unexpected canonical declaration predicate")
    old_test = copy.deepcopy(matches[0].test)
    matches[0].test = ast.parse(
        "not _e993_compat_matches(kind, name, text)", mode="eval").body
    # Prove that every other node, including all original input guards, is intact.
    restored = copy.deepcopy(updated)
    replacements = [
        node for node in ast.walk(restored)
        if isinstance(node, ast.If) and isinstance(node.test, ast.UnaryOp)
        and isinstance(node.test.operand, ast.Call)
        and isinstance(node.test.operand.func, ast.Name)
        and node.test.operand.func.id == "_e993_compat_matches"
    ]
    require(len(replacements) == 1, "unexpected compatibility AST")
    replacements[0].test = old_test
    require(ast.dump(restored, include_attributes=False) == ast.dump(original, include_attributes=False),
            "compatibility change extends beyond the declaration predicate")
    futures = [copy.deepcopy(node) for node in tree.body
               if isinstance(node, ast.ImportFrom) and node.module == "__future__"]
    module_ast = ast.fix_missing_locations(ast.Module(body=futures + [updated], type_ignores=[]))
    namespace = dict(vars(lf))
    namespace["_e993_compat_matches"] = lambda kind, name, text: declaration_matches(
        kind, name, text, kernel.strip_lean_comments_and_strings)
    exec(compile(module_ast, str(LF_PATH) + " [name-compat-v1]", "exec"), namespace)
    reader = namespace["validate_source"]
    reader.compatibility_version = ADAPTER_VERSION
    reader.original_guards_preserved = True
    return reader


def real_path(path, directory):
    supplied = Path(path).expanduser()
    require(supplied.is_absolute() and ".." not in supplied.parts,
            "path must be absolute without '..'")
    supplied = Path(os.path.abspath(supplied))
    cursor = Path(supplied.anchor)
    for part in supplied.parts[1:-1]:
        cursor /= part
        require(stat.S_ISDIR(cursor.lstat().st_mode), "non-real ancestor: " + str(cursor))
    mode = supplied.lstat().st_mode
    require(stat.S_ISDIR(mode) if directory else stat.S_ISREG(mode),
            "path must be real: " + str(supplied))
    return supplied


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)
    register = sub.add_parser("register", help="canonical register with disclosed name predicate compatibility")
    register.add_argument("--run-root", required=True)
    register.add_argument("--kind", choices=("definition", "lemma", "theorem"), required=True)
    register.add_argument("--name", required=True)
    register.add_argument("--source-file", required=True)
    args = parser.parse_args(argv)
    try:
        run_root = real_path(args.run_root, directory=True)
        require(run_root.parent == R / "runs"
                and re.fullmatch(r"lean-\d{4}-\d{2}-\d{2}(?:-[a-z0-9][a-z0-9-]*)?", run_root.name),
                "run is outside this experiment")
        source = real_path(args.source_file, directory=False)
        require(source.is_relative_to(run_root), "candidate must be inside its authorized run")
        lf, kernel = load_canonical()
        original_reader = lf.validate_source
        compatible_reader = make_compatible_reader(lf, kernel)
        disclosure = {
            "schema": ADAPTER_VERSION, "operation": "disclosed_compatibility_registration",
            "adapter_sha256": sha256(Path(__file__).resolve()),
            "original_formalization_sha256": LF_SHA256,
            "canonical_masker_sha256": KERNEL_SHA256,
            "only_changed_predicate": "validate_source declaration spelling",
            "source_bytes_rewritten": False,
            "registration_predicate_modified": True,
            "canonical_state_and_receipt_machinery_unmodified": True,
        }
        print(json.dumps(disclosure, sort_keys=True), file=sys.stderr)
        lf.validate_source = compatible_reader
        try:
            return lf.main(["register", "--run-root", str(run_root), "--kind", args.kind,
                            "--name", args.name, "--source-file", str(source)])
        finally:
            lf.validate_source = original_reader
    except (ValueError, OSError) as exc:
        print(json.dumps({"schema": ADAPTER_VERSION, "status": "failed_closed",
                          "error": str(exc), "network_used": False}, sort_keys=True), file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
