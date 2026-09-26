#!/usr/bin/env python3
"""Initialize, resume, audit, and close a governed Lean proof run."""

from __future__ import annotations

import argparse
import importlib.util
import json
import os
import subprocess
import re
import sys
from datetime import date
from pathlib import Path
from typing import Any

from workflow_common import (
    atomic_write,
    canonical_json_bytes,
    ensure_real_directory,
    read_json_object,
    relative_posix,
    resolved_child,
    sha256_bytes,
    sha256_file,
    utc_now,
    validate_json_schema,
    write_canonical_json,
)

SCHEMA_VERSION = "verityos.lean-proof-workflow.v1"
RUN_RE = re.compile(r"^lean-\d{4}-\d{2}-\d{2}(?:-[a-z0-9][a-z0-9-]*)?$")
SLUG_RE = re.compile(r"^[a-z0-9]+(?:-[a-z0-9]+)*$")
HASH_RE = re.compile(r"^[0-9a-f]{64}$")
VERITY_ROOT = Path(__file__).resolve().parents[3]
DEFAULT_EXPERIMENTS_ROOT = VERITY_ROOT / "experiments"

RECEIPT_SCHEMAS = {
    "informal-audit": Path(__file__).resolve().parents[1] / "schemas" / "informal-audit-receipt.schema.json",
    "reviewer-assignment": Path(__file__).resolve().parents[1] / "schemas" / "reviewer-assignment.schema.json",
    "theorem-contract": Path(__file__).resolve().parents[2] / "theorem-contract" / "schemas" / "theorem-contract-receipt.schema.json",
    "formalization": Path(__file__).resolve().parents[2] / "lean-formalization" / "schemas" / "formalization-receipt.schema.json",
    "dependency-authority": Path(__file__).resolve().parents[1] / "schemas" / "dependency-authority.schema.json",
    "kernel-verification": Path(__file__).resolve().parents[2] / "lean-kernel-verification" / "schemas" / "kernel-verification-receipt.schema.json",
    "fidelity-audit": Path(__file__).resolve().parents[2] / "formalization-fidelity-audit" / "schemas" / "fidelity-audit-receipt.schema.json",
}

REQUIRED_LAYOUT = (
    "THEOREM-CONTRACT.yaml",
    "DEPENDENCIES.yaml",
    "LeanProject",
    "EVIDENCE",
    "RECEIPTS",
    "FIDELITY-REVIEW.md",
    "LOOP-STATE.md",
    "LOOP-STATE.json",
    "VERIFICATION-REPORT.md",
)

RECEIPT_RULES: dict[str, dict[str, Any]] = {
    "reviewer-assignment": {
        "path": "RECEIPTS/reviewer-assignment.json",
        "schema": "verityos.lean-reviewer-assignment.v1",
        "verdict_path": ("verdict",),
        "accepted": {"assigned"},
    },
    "informal-audit": {
        "path": "RECEIPTS/informal-audit.json",
        "schema": "verityos.lean-informal-audit-receipt.v1",
        "verdict_path": ("verdict",),
        "accepted": {"passed"},
    },
    "theorem-contract": {
        "path": "RECEIPTS/theorem-contract.json",
        "schema": "theorem-contract-receipt/v1",
        "verdict_path": ("verdict",),
        "accepted": {"valid_for_formalization"},
    },
    "formalization": {
        "path": "RECEIPTS/formalization.json",
        "schema": "verityos.lean-formalization-receipt.v1",
        "verdict_path": ("verdict",),
        "accepted": {"FORMALIZATION_PREPARED_NOT_KERNEL_VERIFIED"},
    },
    "dependency-authority": {
        "path": "RECEIPTS/dependency-authority.json",
        "schema": "verityos.lean-shared-package-authority.v1",
        "verdict_path": ("verdict",),
        "accepted": {"bound_read_only"},
    },
    "kernel-verification": {
        "path": "RECEIPTS/kernel-verification.json",
        "schema": "verityos.lean-kernel-verification.receipt.v1",
        "verdict_path": ("verdict", "code"),
        "accepted": {"verified"},
    },
    "fidelity-audit": {
        "path": "RECEIPTS/fidelity-audit.json",
        "schema": "formalization-fidelity-audit-receipt.v1",
        "verdict_path": ("verdict",),
        "accepted": {"passed"},
    },
}


def _approved_experiments_root() -> Path:
    configured = os.environ.get("VERITYOS_EXPERIMENTS_ROOT")
    return Path(configured).expanduser().resolve() if configured else DEFAULT_EXPERIMENTS_ROOT.resolve()


def _configured_experiments_root() -> Path:
    configured = os.environ.get("VERITYOS_EXPERIMENTS_ROOT")
    return (Path(configured).expanduser() if configured else DEFAULT_EXPERIMENTS_ROOT).absolute()


def _assert_run_root(path: Path) -> Path:
    raw = path.expanduser().absolute()
    configured_root = _configured_experiments_root()
    try:
        raw_relative = raw.relative_to(configured_root)
    except ValueError as exc:
        raise ValueError(f"run directory must be under the governed experiments root: {configured_root}") from exc
    cursor = configured_root
    for part in raw_relative.parts:
        cursor = cursor / part
        if cursor.is_symlink():
            raise ValueError(f"run path contains a symlink: {cursor}")
    path = raw.resolve()
    experiments_root = _approved_experiments_root()
    if not RUN_RE.fullmatch(path.name):
        raise ValueError("run directory must be named lean-YYYY-MM-DD or lean-YYYY-MM-DD-<suffix>")
    if path.parent.name != "runs":
        raise ValueError("run directory must be a direct child of a runs/ directory")
    try:
        relative = path.relative_to(experiments_root)
    except ValueError as exc:
        raise ValueError(f"run directory must be under the governed experiments root: {experiments_root}") from exc
    if len(relative.parts) != 3 or relative.parts[1] != "runs":
        raise ValueError("run layout must be experiments/<theorem>/runs/lean-YYYY-MM-DD[-suffix]")
    if not SLUG_RE.fullmatch(relative.parts[0]):
        raise ValueError("theorem experiment directory must be a lowercase slug")
    if path.exists():
        for governed in (path / "EVIDENCE", path / "RECEIPTS"):
            if governed.is_symlink():
                raise ValueError(f"governed workflow directory may not be a symlink: {governed}")
    return path


def _state_markdown(state: dict[str, Any]) -> bytes:
    phases = "\n".join(
        f"- `{name}`: `{value}`" for name, value in state["phases"].items()
    )
    body = f"""---
title: Lean Proof Workflow Loop State
type: lean-proof-loop-state
status: {state['status']}
schema_version: {state['schema_version']}
run_id: {state['run_id']}
updated_at: {state['updated_at']}
---

# Loop State

- Theorem: `{state['theorem_slug']}`
- Run: `{state['run_id']}`
- Repair attempts used: `{state['repair_attempts_used']}` / `{state['repair_attempt_limit']}`

## Phases

{phases}

This Markdown view is generated from `LOOP-STATE.json`; the JSON receipt is the
canonical controller state.
"""
    return body.encode("utf-8")


def _write_state(run_root: Path, state: dict[str, Any]) -> None:
    _validate_state(state, run_root)
    state["updated_at"] = utc_now()
    write_canonical_json(run_root / "LOOP-STATE.json", state, root=run_root)
    atomic_write(run_root / "LOOP-STATE.md", _state_markdown(state), root=run_root)


def _initial_contract(theorem_slug: str) -> bytes:
    template = Path(__file__).resolve().parents[2] / "theorem-contract" / "templates" / "THEOREM-CONTRACT.yaml"
    contract = json.loads(template.read_text(encoding="utf-8"))
    contract["contract_id"] = f"{theorem_slug}-v1"
    contract["theorem"]["title"] = "REPLACE WITH PRECISE THEOREM TITLE"
    contract["theorem"]["informal_statement"] = "REPLACE WITH EXACT INTENDED STATEMENT"
    return json.dumps(contract, indent=2, ensure_ascii=False).encode("utf-8") + b"\n"


def _validate_state(state: dict[str, Any], run_root: Path) -> None:
    required = {
        "schema_version", "run_id", "theorem_slug", "status", "created_at",
        "updated_at", "repair_attempt_limit", "repair_attempts_used", "phases",
    }
    allowed = required | {"verification_report_sha256", "repair_history"}
    if set(state) - allowed or not required.issubset(state):
        raise ValueError("loop state has unexpected or missing fields")
    if state["schema_version"] != SCHEMA_VERSION or state["run_id"] != run_root.name:
        raise ValueError("loop state schema or run lineage mismatch")
    if state["theorem_slug"] != run_root.parent.parent.name:
        raise ValueError("loop state theorem slug does not match its experiment path")
    limit = state["repair_attempt_limit"]
    used = state["repair_attempts_used"]
    if not isinstance(limit, int) or not isinstance(used, int) or limit < 0 or used < 0 or used > limit:
        raise ValueError("loop state repair budget is invalid or exhausted")
    expected_phases = {
        "intake", "informal_audit", "theorem_contract", "formalization",
        "kernel_verification", "fidelity_audit", "bounded_repair", "closeout",
    }
    phases = state["phases"]
    if not isinstance(phases, dict) or set(phases) != expected_phases:
        raise ValueError("loop state phases are malformed")
    valid_phase_states = {"ready", "pending", "passed", "failed", "blocked", "in_progress", "not_entered"}
    if any(value not in valid_phase_states for value in phases.values()):
        raise ValueError("loop state has an unsupported phase status")
    history = state.get("repair_history", [])
    if not isinstance(history, list) or len(history) != used:
        raise ValueError("loop state repair history does not match its attempt count")


def initialize(args: argparse.Namespace) -> int:
    if not SLUG_RE.fullmatch(args.theorem):
        raise ValueError("theorem slug must contain lowercase letters, numbers, and single hyphens")
    day = args.date or date.today().isoformat()
    run_name = f"lean-{day}" + (f"-{args.suffix}" if args.suffix else "")
    run_root = _assert_run_root(Path(args.experiments_root) / args.theorem / "runs" / run_name)
    for directory in ("EVIDENCE", "RECEIPTS"):
        (run_root / directory).mkdir(parents=True, exist_ok=True)
        ensure_real_directory(run_root / directory, root=run_root)
    initial_files = {
        "THEOREM-CONTRACT.yaml": _initial_contract(args.theorem),
        "FIDELITY-REVIEW.md": b"# Fidelity Review\n\nPending independent fidelity audit.\n",
        "VERIFICATION-REPORT.md": b"# Verification Report\n\nPending governed closeout.\n",
    }
    for rel, data in initial_files.items():
        target = run_root / rel
        if not target.exists():
            atomic_write(target, data, root=run_root)
    state_path = run_root / "LOOP-STATE.json"
    if state_path.exists():
        state = read_json_object(state_path)
    else:
        state = {
            "schema_version": SCHEMA_VERSION,
            "run_id": run_name,
            "theorem_slug": args.theorem,
            "status": "initialized",
            "created_at": utc_now(),
            "updated_at": utc_now(),
            "repair_attempt_limit": args.repair_limit,
            "repair_attempts_used": 0,
            "repair_history": [],
            "phases": {
                "intake": "ready",
                "informal_audit": "pending",
                "theorem_contract": "pending",
                "formalization": "pending",
                "kernel_verification": "pending",
                "fidelity_audit": "pending",
                "bounded_repair": "not_entered",
                "closeout": "pending",
            },
        }
    _write_state(run_root, state)
    print(run_root)
    return 0


def _assignment_id(receipt: dict[str, Any]) -> str:
    unsigned = dict(receipt)
    unsigned["assignment_id"] = "0" * 64
    return sha256_bytes(canonical_json_bytes(unsigned))


def _validate_assignment(receipt: dict[str, Any], run_root: Path) -> None:
    schema = read_json_object(RECEIPT_SCHEMAS["reviewer-assignment"])
    validate_json_schema(receipt, schema)
    if receipt["assignment_id"] != _assignment_id(receipt):
        raise ValueError("reviewer assignment self-hash mismatch")
    if receipt["run_id"] != run_root.name or receipt["theorem_slug"] != run_root.parent.parent.name:
        raise ValueError("reviewer assignment run lineage mismatch")
    identities = {
        receipt["artifact_producer_id"],
        receipt["informal_reviewer"]["reviewer_id"],
        receipt["fidelity_reviewer"]["reviewer_id"],
    }
    if len(identities) != 3:
        raise ValueError("producer, informal reviewer, and fidelity reviewer must be distinct")


def assign_reviewers(args: argparse.Namespace) -> int:
    run_root = _assert_run_root(Path(args.run_root))
    receipt = {
        "schema_version": "verityos.lean-reviewer-assignment.v1",
        "assignment_id": "0" * 64,
        "verdict": "assigned",
        "run_id": run_root.name,
        "theorem_slug": run_root.parent.parent.name,
        "issued_at": utc_now(),
        "controller_authority": "skills/lean-proof-workflow/skill.md",
        "artifact_producer_id": args.artifact_producer_id,
        "informal_reviewer": {
            "reviewer_id": args.informal_reviewer_id,
            "reviewer_kind": args.informal_reviewer_kind,
        },
        "fidelity_reviewer": {
            "reviewer_id": args.fidelity_reviewer_id,
            "reviewer_kind": args.fidelity_reviewer_kind,
        },
    }
    receipt["assignment_id"] = _assignment_id(receipt)
    _validate_assignment(receipt, run_root)
    path = run_root / "RECEIPTS" / "reviewer-assignment.json"
    if path.is_file():
        previous = read_json_object(path)
        if previous != receipt:
            raise ValueError("reviewer assignment already exists and is immutable")
    write_canonical_json(path, receipt, root=run_root)
    print(json.dumps(receipt, sort_keys=True))
    return 0


def _frontmatter_value(text: str, key: str) -> str | None:
    if not text.startswith("---\n"):
        return None
    end = text.find("\n---\n", 4)
    if end < 0:
        return None
    match = re.search(rf"(?m)^{re.escape(key)}:\s*(.+?)\s*$", text[4:end])
    return match.group(1).strip('"\'') if match else None


def register_audit(args: argparse.Namespace) -> int:
    run_root = _assert_run_root(Path(args.run_root))
    assignment_path = run_root / "RECEIPTS" / "reviewer-assignment.json"
    assignment = read_json_object(assignment_path)
    _validate_assignment(assignment, run_root)
    expected_reviewer = assignment["informal_reviewer"]
    if args.artifact_producer_id != assignment["artifact_producer_id"]:
        raise ValueError("informal audit producer differs from controller assignment")
    if args.reviewer_id != expected_reviewer["reviewer_id"]:
        raise ValueError("informal audit reviewer differs from controller assignment")
    source = Path(args.audit).resolve()
    if not source.is_file():
        raise ValueError(f"audit artifact is not a file: {source}")
    target = run_root / "EVIDENCE" / "INFORMAL-AUDIT.md"
    data = source.read_bytes()
    text = data.decode("utf-8", errors="strict")
    required_headings = (
        "# Informal Proof Integrity Audit", "## Intended Claim",
        "## Reproduced Mathematical Evidence", "## Independent Critic Pass", "## Verdict",
    )
    if any(heading not in text for heading in required_headings):
        raise ValueError("informal audit is missing required proof-integrity sections")
    if (
        _frontmatter_value(text, "type") != "proof-integrity-audit-evidence"
        or _frontmatter_value(text, "status") != "passed"
        or _frontmatter_value(text, "authority") != "skills/proof-integrity-audit/skill.md"
        or _frontmatter_value(text, "producer_id") != args.artifact_producer_id
        or _frontmatter_value(text, "critic_id") != args.reviewer_id
        or _frontmatter_value(text, "attestation_id") != args.attestation_id
    ):
        raise ValueError("informal audit frontmatter does not match its assigned authorities")
    contract = read_json_object(run_root / "THEOREM-CONTRACT.yaml")
    claim = contract.get("theorem", {}).get("informal_statement")
    if not isinstance(claim, str) or not claim.strip():
        raise ValueError("the theorem contract has no exact informal statement")
    normalized_claim = " ".join(claim.split())
    claim_sha = sha256_bytes(normalized_claim.encode("utf-8"))
    if _frontmatter_value(text, "claim_sha256") != claim_sha:
        raise ValueError("informal audit does not bind the theorem contract's claim")
    atomic_write(target, data, root=run_root)
    receipt = {
        "schema_version": "verityos.lean-informal-audit-receipt.v1",
        "receipt_id": "0" * 64,
        "verdict": "passed",
        "run_id": run_root.name,
        "theorem_slug": run_root.parent.parent.name,
        "claim": normalized_claim,
        "claim_sha256": claim_sha,
        "artifact": relative_posix(run_root, target),
        "artifact_sha256": sha256_bytes(data),
        "registered_at": utc_now(),
        "authority": "skills/proof-integrity-audit/skill.md",
        "assignment_sha256": sha256_file(assignment_path),
        "artifact_producer_id": args.artifact_producer_id,
        "reviewer_id": args.reviewer_id,
        "reviewer_kind": expected_reviewer["reviewer_kind"],
        "attestation_id": args.attestation_id,
    }
    unsigned = dict(receipt)
    unsigned["receipt_id"] = "0" * 64
    receipt["receipt_id"] = sha256_bytes(canonical_json_bytes(unsigned))
    validate_json_schema(receipt, read_json_object(RECEIPT_SCHEMAS["informal-audit"]))
    write_canonical_json(run_root / "RECEIPTS" / "informal-audit.json", receipt, root=run_root)
    state = read_json_object(run_root / "LOOP-STATE.json")
    state["phases"]["informal_audit"] = "passed"
    state["status"] = "in_progress"
    _write_state(run_root, state)
    return 0


def _nested_string(receipt: dict[str, Any], path: tuple[str, ...]) -> str:
    value: Any = receipt
    for key in path:
        if not isinstance(value, dict):
            return "malformed"
        value = value.get(key)
    return value if isinstance(value, str) else "malformed"


def _formalization_canonical_bytes(value: Any) -> bytes:
    """Match the formalization component's documented receipt canonicalizer."""
    return (json.dumps(value, sort_keys=True, indent=2, ensure_ascii=True) + "\n").encode("utf-8")


def _load_script_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise ValueError(f"cannot load component validator: {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def _validate_component_receipt(name: str, receipt: dict[str, Any], run_root: Path) -> list[str]:
    failures: list[str] = []
    if name == "reviewer-assignment":
        try:
            _validate_assignment(receipt, run_root)
        except ValueError as exc:
            failures.append(str(exc))
    elif name == "informal-audit":
        artifact = run_root / "EVIDENCE" / "INFORMAL-AUDIT.md"
        assignment_path = run_root / "RECEIPTS" / "reviewer-assignment.json"
        if not artifact.is_file() or receipt.get("artifact_sha256") != sha256_file(artifact):
            failures.append("informal audit receipt does not bind the current artifact")
        if not assignment_path.is_file() or receipt.get("assignment_sha256") != sha256_file(assignment_path):
            failures.append("informal audit receipt does not bind the reviewer assignment")
        unsigned = dict(receipt)
        receipt_id = unsigned.get("receipt_id")
        unsigned["receipt_id"] = "0" * 64
        if receipt_id != sha256_bytes(canonical_json_bytes(unsigned)):
            failures.append("informal audit receipt self-hash mismatch")
    elif name == "theorem-contract":
        if receipt.get("passed") is not True:
            failures.append("theorem-contract passed flag is not true")
        contract = run_root / "THEOREM-CONTRACT.yaml"
        if receipt.get("contract_sha256") != sha256_file(contract):
            failures.append("theorem-contract receipt does not bind current contract bytes")
        try:
            module = _load_script_module(
                "verityos_theorem_contract_validator",
                Path(__file__).resolve().parents[2] / "theorem-contract" / "scripts" / "validate_theorem_contract.py",
            )
            _, expected_receipt = module.validate_contract(run_root, "THEOREM-CONTRACT.yaml")
        except Exception as exc:
            failures.append(f"theorem-contract validator failed: {type(exc).__name__}: {exc}")
        else:
            if expected_receipt != receipt:
                failures.append("theorem-contract receipt differs from deterministic revalidation")
    elif name == "formalization":
        if receipt.get("status") != "prepared_not_verified":
            failures.append("formalization status must be prepared_not_verified")
        if receipt.get("network") != {"allowed": False, "used": False}:
            failures.append("formalization receipt violates the no-network contract")
        files = receipt.get("files")
        if not isinstance(files, list):
            failures.append("formalization file inventory is missing")
        else:
            for item in files:
                if not isinstance(item, dict) or not isinstance(item.get("path"), str):
                    failures.append("formalization file inventory is malformed")
                    break
                try:
                    target = resolved_child(run_root, run_root / item["path"])
                except ValueError:
                    failures.append("formalization inventory path escapes the run")
                    break
                if not target.is_file() or item.get("sha256") != sha256_file(target):
                    failures.append(f"formalization inventory drift: {item['path']}")
                    break
        unsigned = dict(receipt)
        self_hash = unsigned.pop("receipt_sha256", None)
        if not isinstance(self_hash, str) or self_hash != sha256_bytes(
            _formalization_canonical_bytes(unsigned)
        ):
            failures.append("formalization receipt self-hash mismatch")
    elif name == "dependency-authority":
        project = run_root / "LeanProject"
        link = project / ".lake" / "packages"
        raw_shared_root = receipt.get("shared_packages_root")
        raw_shared_project = receipt.get("shared_project_root")
        try:
            shared_root = Path(str(raw_shared_root)).resolve(strict=True)
            shared_project = Path(str(raw_shared_project)).resolve(strict=True)
        except OSError:
            shared_root = Path("/")
            shared_project = Path("/")
            failures.append("shared-package authority roots are unavailable")
        if not link.is_symlink():
            failures.append("shared-package authority exists without the packages symlink")
        elif str(link.resolve()) != str(shared_root):
            failures.append("shared-package symlink target differs from authority receipt")
        manifest = project / "lake-manifest.json"
        if not manifest.is_file() or receipt.get("project_manifest_sha256") != sha256_file(manifest):
            failures.append("shared-package authority does not bind the project manifest")
        key_hashes = receipt.get("key_file_sha256")
        if not isinstance(key_hashes, dict) or not key_hashes:
            failures.append("shared-package authority has no key-file inventory")
        else:
            for raw_path, expected_hash in sorted(key_hashes.items()):
                marker = Path(raw_path)
                resolved_marker = marker.resolve(strict=False)
                if not (
                    resolved_marker == shared_project
                    or shared_project in resolved_marker.parents
                    or resolved_marker == shared_root
                    or shared_root in resolved_marker.parents
                ):
                    failures.append(f"shared-package authority marker escapes approved roots: {raw_path}")
                    break
                if not marker.is_file() or expected_hash != sha256_file(marker):
                    failures.append(f"shared-package authority marker drift: {raw_path}")
                    break
        package_identities = receipt.get("package_identities")
        if not isinstance(package_identities, list) or not package_identities:
            failures.append("shared-package authority has no transitive package identities")
        else:
            for identity in package_identities:
                try:
                    checkout = resolved_child(shared_root, shared_root / str(identity["name"]))
                    head = _read_git_head(checkout)
                except (KeyError, OSError, ValueError) as exc:
                    failures.append(f"shared-package identity cannot be reread: {exc}")
                    break
                if head != identity.get("revision") or head != identity.get("git_head"):
                    failures.append(f"shared-package revision drift: {identity.get('name')}")
                    break
                for raw_path, expected_hash in sorted(identity.get("marker_sha256", {}).items()):
                    marker = Path(raw_path)
                    if not marker.is_file() or sha256_file(marker) != expected_hash:
                        failures.append(f"shared-package marker drift: {raw_path}")
                        break
        kernel_path = run_root / "RECEIPTS" / "kernel-verification.json"
        if kernel_path.is_file():
            try:
                kernel = read_json_object(kernel_path)
                kernel_mathlib = kernel["project"]["mathlib"]
            except (OSError, KeyError, TypeError, ValueError, json.JSONDecodeError):
                failures.append("shared-package authority cannot be cross-bound to kernel evidence")
            else:
                if (
                    kernel_mathlib.get("shared_packages_root") != str(shared_root)
                    or kernel_mathlib.get("revision") != receipt.get("mathlib_revision")
                    or kernel_mathlib.get("git_head") != receipt.get("mathlib_revision")
                ):
                    failures.append("shared-package authority differs from kernel-verified dependency identity")
    elif name == "kernel-verification":
        verdict = receipt.get("verdict")
        if not isinstance(verdict, dict) or verdict.get("verified") is not True:
            failures.append("kernel receipt verified flag is not true")
        artifacts = receipt.get("artifacts")
        if not isinstance(artifacts, dict):
            failures.append("kernel receipt artifacts are missing")
        else:
            for path_key, hash_key in (("build_log", "build_log_sha256"), ("axioms_log", "axioms_log_sha256")):
                try:
                    target = resolved_child(run_root, Path(str(artifacts.get(path_key, ""))))
                except ValueError:
                    failures.append(f"kernel {path_key} escapes the run")
                    continue
                if not target.is_file() or artifacts.get(hash_key) != sha256_file(target):
                    failures.append(f"kernel {path_key} hash mismatch")
        unsigned = dict(receipt)
        receipt_id = unsigned.get("receipt_id")
        unsigned["receipt_id"] = "0" * 64
        if not isinstance(receipt_id, str) or receipt_id != sha256_bytes(canonical_json_bytes(unsigned)):
            failures.append("kernel receipt self-hash mismatch")
    elif name == "fidelity-audit":
        if receipt.get("fail_closed") is not False:
            failures.append("fidelity receipt remains fail-closed")
        if receipt.get("deterministic_status") != "passed" or receipt.get("semantic_review_status") != "passed":
            failures.append("fidelity deterministic and independent semantic gates must both pass")
        kernel_path = run_root / "RECEIPTS" / "kernel-verification.json"
        if receipt.get("kernel_receipt_sha256") != sha256_file(kernel_path):
            failures.append("fidelity receipt does not bind the current kernel receipt")
        input_path = run_root / "EVIDENCE" / "fidelity-audit-input.json"
        if not input_path.is_file():
            failures.append("fidelity audit input is missing")
        else:
            try:
                audit_input = read_json_object(input_path)
            except (OSError, ValueError, json.JSONDecodeError):
                failures.append("fidelity audit input is malformed")
            else:
                if receipt.get("input_sha256") != sha256_bytes(canonical_json_bytes(audit_input)):
                    failures.append("fidelity receipt does not bind the current audit input")
                binding = audit_input.get("lean_binding")
                source_rel = binding.get("declaration_source_path") if isinstance(binding, dict) else None
                if not isinstance(source_rel, str):
                    failures.append("fidelity audit input has no Lean source path")
                else:
                    try:
                        source = resolved_child(run_root, run_root / source_rel)
                    except ValueError:
                        failures.append("fidelity Lean source path escapes the run")
                    else:
                        if not source.is_file() or receipt.get("lean_source_sha256") != sha256_file(source):
                            failures.append("fidelity receipt does not bind the current Lean source")
                try:
                    module = _load_script_module(
                        "verityos_fidelity_validator",
                        Path(__file__).resolve().parents[2]
                        / "formalization-fidelity-audit"
                        / "scripts"
                        / "audit_fidelity.py",
                    )
                    expected_receipt = module.build_receipt(audit_input)
                except Exception as exc:
                    failures.append(f"fidelity deterministic revalidation failed: {type(exc).__name__}: {exc}")
                else:
                    if expected_receipt != receipt:
                        failures.append("fidelity receipt differs from deterministic revalidation")
    return failures


def _validate_common_lineage(run_root: Path, receipts: dict[str, dict[str, Any]]) -> list[str]:
    failures: list[str] = []
    try:
        state = read_json_object(run_root / "LOOP-STATE.json")
        _validate_state(state, run_root)
        contract = read_json_object(run_root / "THEOREM-CONTRACT.yaml")
    except (OSError, ValueError, json.JSONDecodeError) as exc:
        return [f"common run lineage is unavailable: {exc}"]
    run_id = run_root.name
    theorem_slug = run_root.parent.parent.name
    binding = contract.get("lean_binding")
    theorem = contract.get("theorem")
    if not isinstance(binding, dict) or not isinstance(theorem, dict):
        return ["theorem contract lacks canonical theorem or Lean binding data"]
    expected_name = binding.get("declaration_name")
    expected_source_rel = binding.get("source_relpath")
    expected_statement = binding.get("expected_statement")
    informal_statement = theorem.get("informal_statement")
    if not all(isinstance(item, str) and item for item in (expected_name, expected_source_rel, expected_statement, informal_statement)):
        return ["theorem contract lineage fields are malformed"]
    expected_source = (run_root / expected_source_rel).resolve()
    if expected_source != resolved_child(run_root, expected_source) or not expected_source.is_file():
        failures.append("theorem contract Lean source path is missing or unsafe")
        return failures
    source_text = expected_source.read_text(encoding="utf-8")
    normalized_source = " ".join(source_text.split())
    normalized_statement = " ".join(expected_statement.split())
    if f"{normalized_statement} :=" not in normalized_source:
        failures.append("current Lean source does not contain the exact contracted declaration statement")

    domains_by_id = {
        item.get("id"): item for item in contract.get("domains", []) if isinstance(item, dict)
    }
    expected_contract_semantics = {
        "contract_id": contract.get("contract_id"),
        "contract_sha256": sha256_file(run_root / "THEOREM-CONTRACT.yaml"),
        "theorem_name": expected_name,
        "definitions": [
            {"name": item.get("id"), "canonical": item.get("description")}
            for item in contract.get("definitions", []) if isinstance(item, dict)
        ],
        "domains": [
            {
                "variable": item.get("binder"),
                "lean_type": domains_by_id.get(item.get("domain_id"), {}).get("lean_type"),
                "forbidden_narrowings": [],
            }
            for item in contract.get("quantifiers", []) if isinstance(item, dict)
        ],
        "quantifiers": [
            {
                "variable": item.get("binder"),
                "kind": "exists" if item.get("kind") == "exists_unique" else item.get("kind"),
                "domain": domains_by_id.get(item.get("domain_id"), {}).get("lean_type"),
            }
            for item in contract.get("quantifiers", []) if isinstance(item, dict)
        ],
        "hypotheses": [
            {"id": item.get("id"), "canonical": item.get("statement")}
            for item in contract.get("hypotheses", []) if isinstance(item, dict)
        ],
        "conclusion": {
            "canonical": contract.get("conclusion", {}).get("statement"),
            "clauses": [contract.get("conclusion", {}).get("statement")],
        },
        "lean_statement": expected_statement,
        "permitted_axioms": sorted(contract.get("permitted_axioms", [])),
        "constructivity_requirement": (
            "constructive" if contract.get("constructivity", {}).get("required") is True
            else "classical_allowed"
        ),
    }

    assignment = receipts.get("reviewer-assignment")
    informal = receipts.get("informal-audit")
    if assignment and informal:
        claim = " ".join(informal_statement.split())
        if (
            informal.get("run_id") != run_id
            or informal.get("theorem_slug") != theorem_slug
            or informal.get("claim") != claim
            or informal.get("claim_sha256") != sha256_bytes(claim.encode("utf-8"))
            or informal.get("artifact_producer_id") != assignment.get("artifact_producer_id")
            or informal.get("reviewer_id") != assignment.get("informal_reviewer", {}).get("reviewer_id")
        ):
            failures.append("informal audit lineage differs from contract or reviewer assignment")

    formalization = receipts.get("formalization")
    if formalization:
        theorem_entries = [entry for entry in formalization.get("entries", []) if entry.get("kind") == "theorem"]
        if (
            formalization.get("run_id") != run_id
            or Path(str(formalization.get("run_root"))).resolve() != run_root
            or Path(str(formalization.get("project_root"))).resolve() != run_root / "LeanProject"
            or len(theorem_entries) != 1
            or theorem_entries[0].get("name") != expected_name
        ):
            failures.append("formalization receipt does not share canonical run/declaration lineage")

    dependency = receipts.get("dependency-authority")
    if dependency and dependency.get("run_id") != run_id:
        failures.append("dependency authority run id differs from controller run id")

    kernel = receipts.get("kernel-verification")
    if kernel:
        inputs = kernel.get("inputs", {})
        artifacts = kernel.get("artifacts", {})
        if (
            Path(str(inputs.get("run_root"))).resolve() != run_root
            or Path(str(inputs.get("project_root"))).resolve() != run_root / "LeanProject"
            or Path(str(inputs.get("source"))).resolve() != expected_source
            or inputs.get("theorem_name") != expected_name
            or set(inputs.get("allowed_axioms", [])) != set(contract.get("permitted_axioms", []))
            or artifacts.get("source_sha256_before") != sha256_file(expected_source)
            or artifacts.get("source_sha256_after") != sha256_file(expected_source)
        ):
            failures.append("kernel receipt does not share canonical contract/source lineage")

    fidelity = receipts.get("fidelity-audit")
    input_path = run_root / "EVIDENCE" / "fidelity-audit-input.json"
    if fidelity and assignment and input_path.is_file():
        audit_input = read_json_object(input_path)
        contract_projection = audit_input.get("theorem_contract", {})
        lean_projection = audit_input.get("lean_binding", {})
        kernel_projection = audit_input.get("kernel_evidence", {})
        review = audit_input.get("independent_review", {})
        kernel_path = run_root / "RECEIPTS" / "kernel-verification.json"
        actual_contract_semantics = {
            key: contract_projection.get(key) for key in expected_contract_semantics
        }
        projected_dependencies = contract_projection.get("dependencies")
        if (
            audit_input.get("run_id") != run_id
            or audit_input.get("artifact_producer_id") != assignment.get("artifact_producer_id")
            or contract_projection.get("contract_sha256") != sha256_file(run_root / "THEOREM-CONTRACT.yaml")
            or contract_projection.get("theorem_name") != expected_name
            or actual_contract_semantics != expected_contract_semantics
            or projected_dependencies != kernel_projection.get("dependencies")
            or lean_projection.get("dependencies") != kernel_projection.get("dependencies")
            or " ".join(str(contract_projection.get("lean_statement", "")).split()) != normalized_statement
            or lean_projection.get("declaration_name") != expected_name
            or lean_projection.get("declaration_source_path") != expected_source_rel
            or lean_projection.get("declaration_source_sha256") != sha256_file(expected_source)
            or " ".join(str(lean_projection.get("lean_statement", "")).split()) != normalized_statement
            or kernel_projection.get("receipt_sha256") != sha256_file(kernel_path)
            or kernel_projection.get("verdict") != "verified"
            or review.get("reviewer_id") != assignment.get("fidelity_reviewer", {}).get("reviewer_id")
            or review.get("reviewer_kind") != assignment.get("fidelity_reviewer", {}).get("reviewer_kind")
        ):
            failures.append("fidelity package does not share canonical contract/source/reviewer lineage")
    return failures


def _evaluate(run_root: Path) -> tuple[dict[str, Any], list[str]]:
    results: dict[str, Any] = {}
    failures: list[str] = []
    receipts: dict[str, dict[str, Any]] = {}
    for name, rule in RECEIPT_RULES.items():
        rel = str(rule["path"])
        accepted = set(rule["accepted"])
        path = run_root / rel
        if not path.is_file():
            results[name] = {"present": False, "verdict": "missing"}
            failures.append(f"missing {rel}")
            continue
        try:
            receipt = read_json_object(path)
        except (OSError, ValueError, json.JSONDecodeError) as exc:
            results[name] = {"present": True, "verdict": "malformed"}
            failures.append(f"malformed {rel}: {exc}")
            continue
        if receipt.get("schema_version") != rule["schema"]:
            results[name] = {"present": True, "verdict": "schema_mismatch"}
            failures.append(f"{name} schema mismatch")
            continue
        try:
            validate_json_schema(receipt, read_json_object(RECEIPT_SCHEMAS[name]))
        except (OSError, ValueError, json.JSONDecodeError) as exc:
            results[name] = {"present": True, "verdict": "schema_invalid"}
            failures.append(f"{name} schema validation failed: {exc}")
            continue
        receipts[name] = receipt
        verdict = _nested_string(receipt, tuple(rule["verdict_path"]))
        digest = sha256_file(path)
        results[name] = {"present": True, "verdict": verdict, "sha256": digest}
        if verdict not in accepted:
            failures.append(f"{name} verdict {verdict!r} is not accepted")
        failures.extend(_validate_component_receipt(name, receipt, run_root))
    failures.extend(_validate_common_lineage(run_root, receipts))
    return results, failures


def _read_git_head(repo: Path) -> str:
    marker = repo / ".git"
    if marker.is_file():
        text = marker.read_text(encoding="utf-8").strip()
        if not text.startswith("gitdir: "):
            raise ValueError("unsupported Mathlib .git file")
        git_dir = (repo / text.removeprefix("gitdir: ")).resolve()
    elif marker.is_dir():
        git_dir = marker.resolve()
    else:
        raise ValueError("Mathlib checkout has no readable Git metadata")
    head = (git_dir / "HEAD").read_text(encoding="utf-8").strip()
    if re.fullmatch(r"[0-9a-f]{40}", head):
        return head
    if not head.startswith("ref: "):
        raise ValueError("Mathlib Git HEAD is malformed")
    ref = head.removeprefix("ref: ")
    ref_file = git_dir / ref
    if ref_file.is_file():
        revision = ref_file.read_text(encoding="utf-8").strip()
        if re.fullmatch(r"[0-9a-f]{40}", revision):
            return revision
    packed = git_dir / "packed-refs"
    if packed.is_file():
        for line in packed.read_text(encoding="utf-8").splitlines():
            if line.startswith(("#", "^")) or " " not in line:
                continue
            revision, name = line.split(" ", 1)
            if name == ref and re.fullmatch(r"[0-9a-f]{40}", revision):
                return revision
    raise ValueError("unable to resolve Mathlib Git HEAD")


def _lakefile_identity(lakefile: Path) -> tuple[str, str, str]:
    text = lakefile.read_text(encoding="utf-8")
    name = re.search(r'^name\s*=\s*"([A-Za-z][A-Za-z0-9_]*)"\s*$', text, re.MULTILINE)
    require = re.search(
        r'\[\[require\]\]\s*\nname\s*=\s*"mathlib"\s*\ngit\s*=\s*"([^"]+)"\s*\nrev\s*=\s*"([0-9a-f]{40})"',
        text,
        re.MULTILINE,
    )
    if name is None or require is None:
        raise ValueError("LeanProject lakefile is not pinned in the expected deterministic form")
    return name.group(1), require.group(1), require.group(2)


def _shared_binding_status(run_root: Path) -> dict[str, Any]:
    """Describe LeanProject/.lake/packages without following anything it should not."""
    project = run_root / "LeanProject"
    link = project / ".lake" / "packages"
    status: dict[str, Any] = {
        "present": link.exists() or link.is_symlink(),
        "is_symlink": link.is_symlink(),
        "is_copied_directory": (not link.is_symlink()) and link.is_dir(),
        "target": None,
        "resolves_to_mathlib": False,
        "toolchain_pin": None,
        "mathlib_revision": None,
        "shared_packages_root": None,
        "write_protected": None,
    }
    if link.is_symlink():
        try:
            target = link.resolve(strict=True)
            status["target"] = str(target)
            status["resolves_to_mathlib"] = (target / "mathlib" / "Mathlib.lean").is_file()
            status["write_protected"] = _packages_write_protected(target)
        except OSError:
            status["target"] = os.readlink(link)
    toolchain = project / "lean-toolchain"
    if toolchain.is_file():
        status["toolchain_pin"] = toolchain.read_text(encoding="utf-8").strip()
    authority = run_root / "RECEIPTS" / "dependency-authority.json"
    if authority.is_file():
        try:
            receipt = read_json_object(authority)
            status["mathlib_revision"] = receipt.get("mathlib_revision")
            status["shared_packages_root"] = receipt.get("shared_packages_root")
        except (OSError, ValueError, json.JSONDecodeError):
            pass
    return status


def _shared_binding_failures(run_root: Path, *, require_bound: bool) -> list[str]:
    status = _shared_binding_status(run_root)
    failures: list[str] = []
    if status["is_copied_directory"]:
        failures.append(
            "shared-binding: LeanProject/.lake/packages is a copied directory, not the approved symlink; "
            "remove the copy and run bind-shared-packages"
        )
    elif require_bound:
        if not status["is_symlink"]:
            failures.append("shared-binding: LeanProject/.lake/packages symlink is absent; run bind-shared-packages")
        elif not status["resolves_to_mathlib"]:
            failures.append("shared-binding: packages symlink does not resolve to a Mathlib checkout")
        elif status["shared_packages_root"] and status["target"] != str(Path(status["shared_packages_root"]).resolve()):
            failures.append("shared-binding: packages symlink target differs from the dependency-authority receipt")
    return failures


def _packages_write_protected(packages_root: Path) -> bool:
    """True when the shared packages tree refuses writes at the places `lake clean` deletes.

    `lake clean` inside a run bound by symlink removes every workspace package's
    `.lake/build`, i.e. the SHARED Mathlib cache (it happened on 2026-09-21).
    A read-only tree turns that into a permission error. Normal governed builds
    never write there: the kernel verifier's sandbox already denies it.
    """
    probes = [packages_root, packages_root / "mathlib" / ".lake" / "build"]
    return all((not probe.exists()) or (not os.access(probe, os.W_OK)) for probe in probes)


def _resolve_shared_packages(shared_project: str) -> Path:
    project = Path(shared_project).expanduser().resolve(strict=True)
    packages = (project / ".lake" / "packages").resolve(strict=True)
    if not (packages / "mathlib" / "Mathlib.lean").is_file():
        raise ValueError("shared project has no .lake/packages/mathlib checkout")
    return packages


def _chmod_tree(packages: Path, mode: str) -> None:
    # chmod -R does not follow symbolic links; the tree is large, so use the system tool.
    subprocess.run(["chmod", "-R", mode, str(packages)], check=True)


def protect_shared_packages(args: argparse.Namespace) -> int:
    packages = _resolve_shared_packages(args.shared_project)
    _chmod_tree(packages, "a-w")
    print(json.dumps({"ok": _packages_write_protected(packages), "shared_packages_root": str(packages),
                      "write_protected": _packages_write_protected(packages)}, sort_keys=True))
    return 0 if _packages_write_protected(packages) else 2


def unprotect_shared_packages(args: argparse.Namespace) -> int:
    """For a deliberate rebuild or upgrade of the shared project only; re-protect afterwards."""
    packages = _resolve_shared_packages(args.shared_project)
    _chmod_tree(packages, "u+w")
    print(json.dumps({"ok": True, "shared_packages_root": str(packages),
                      "write_protected": _packages_write_protected(packages)}, sort_keys=True))
    return 0


def verify_shared_binding(args: argparse.Namespace) -> int:
    run_root = _assert_run_root(Path(args.run_root))
    status = _shared_binding_status(run_root)
    failures = _shared_binding_failures(run_root, require_bound=True)
    warnings: list[str] = []
    if status.get("write_protected") is False:
        warnings.append(
            "shared-binding: the shared packages tree is writable, so `lake clean` in any bound run would delete "
            "the shared Mathlib cache; run protect-shared-packages --shared-project <shared project>"
        )
    print(json.dumps({"ok": not failures, "failures": failures, "warnings": warnings, "shared_binding": status}, sort_keys=True))
    return 0 if not failures else 2


def bind_shared_packages(args: argparse.Namespace) -> int:
    run_root = _assert_run_root(Path(args.run_root))
    project = resolved_child(run_root, run_root / "LeanProject")
    if not project.is_dir():
        raise ValueError("LeanProject is missing")
    shared_project = Path(args.shared_project).expanduser().resolve(strict=True)
    shared_packages = (shared_project / ".lake" / "packages").resolve(strict=True)
    if not shared_packages.is_dir():
        raise ValueError("approved shared Lake packages root is missing")
    mathlib = (shared_packages / "mathlib").resolve(strict=True)
    if shared_packages not in mathlib.parents or not (mathlib / "Mathlib.lean").is_file():
        raise ValueError("approved shared packages root has no complete Mathlib checkout")
    package_name, url, revision = _lakefile_identity(project / "lakefile.toml")
    if _read_git_head(mathlib) != revision:
        raise ValueError("shared Mathlib Git HEAD does not match the LeanProject pin")
    seed_manifest = shared_project / "lake-manifest.json"
    seed = read_json_object(seed_manifest)
    packages = seed.get("packages")
    if not isinstance(packages, list):
        raise ValueError("shared seed manifest has no packages list")
    mathlib_entries = [item for item in packages if isinstance(item, dict) and item.get("name") == "mathlib"]
    if len(mathlib_entries) != 1:
        raise ValueError("shared seed manifest must contain exactly one Mathlib package")
    mathlib_entry = mathlib_entries[0]
    mathlib_entry["url"] = url
    mathlib_entry["inputRev"] = revision
    mathlib_entry["rev"] = revision
    seed["packagesDir"] = ".lake/packages"
    seed["name"] = package_name
    manifest = project / "lake-manifest.json"
    normalized = json.dumps(seed, indent=2, sort_keys=True).encode("utf-8") + b"\n"
    if manifest.exists() and manifest.read_bytes() != normalized:
        raise ValueError("existing LeanProject lake-manifest.json differs from the normalized authority")
    atomic_write(manifest, normalized, root=run_root)
    lake_dir = project / ".lake"
    lake_dir.mkdir(parents=True, exist_ok=True)
    link = lake_dir / "packages"
    if link.is_symlink():
        if link.resolve() != shared_packages:
            raise ValueError("existing shared-package symlink targets a different root")
    elif link.exists():
        raise ValueError("LeanProject .lake/packages exists and is not the approved symlink")
    else:
        temporary = lake_dir / f".packages.{os.getpid()}.tmp"
        os.symlink(shared_packages, temporary)
        os.replace(temporary, link)
    package_identities: list[dict[str, Any]] = []
    seen_names: set[str] = set()
    for item in sorted(seed["packages"], key=lambda value: str(value.get("name", ""))):
        if not isinstance(item, dict) or item.get("type") != "git":
            raise ValueError("shared manifest contains a non-Git or malformed package")
        name = item.get("name")
        package_revision = item.get("rev")
        if (
            not isinstance(name, str) or not name or name in seen_names
            or not isinstance(package_revision, str) or re.fullmatch(r"[0-9a-f]{40}", package_revision) is None
        ):
            raise ValueError("shared manifest package names/revisions are not exact and unique")
        seen_names.add(name)
        checkout = (shared_packages / name).resolve(strict=True)
        if shared_packages not in checkout.parents or not checkout.is_dir():
            raise ValueError(f"shared package checkout is missing or escapes authority: {name}")
        head = _read_git_head(checkout)
        if head != package_revision:
            raise ValueError(f"shared package Git HEAD differs from manifest: {name}")
        marker_candidates = [checkout / str(item.get("configFile", "")), checkout / "lean-toolchain"]
        if name == "mathlib":
            marker_candidates.append(checkout / "Mathlib.lean")
        markers = {
            str(path): sha256_file(path) for path in marker_candidates if path.is_file()
        }
        if not markers:
            raise ValueError(f"shared package has no hashable authority marker: {name}")
        package_identities.append(
            {"name": name, "revision": package_revision, "git_head": head, "marker_sha256": markers}
        )
    key_files = [seed_manifest]
    for identity in package_identities:
        key_files.extend(Path(path) for path in identity["marker_sha256"])
    key_hashes = {str(path): sha256_file(path) for path in key_files if path.is_file()}
    receipt = {
        "schema_version": "verityos.lean-shared-package-authority.v1",
        "verdict": "bound_read_only",
        "bound_at": utc_now(),
        "run_id": run_root.name,
        "shared_project_root": str(shared_project),
        "shared_packages_root": str(shared_packages),
        "mathlib_checkout": str(mathlib),
        "mathlib_revision": revision,
        "mathlib_url": url,
        "seed_manifest_sha256": sha256_file(seed_manifest),
        "project_manifest_sha256": sha256_file(manifest),
        "key_file_sha256": key_hashes,
        "package_identities": package_identities,
        "network_used": False,
        "copied_package_bytes": False,
    }
    receipt_path = run_root / "RECEIPTS" / "dependency-authority.json"
    if receipt_path.is_file():
        prior = read_json_object(receipt_path)
        comparable_prior = {key: value for key, value in prior.items() if key != "bound_at"}
        comparable_current = {key: value for key, value in receipt.items() if key != "bound_at"}
        if comparable_prior == comparable_current and isinstance(prior.get("bound_at"), str):
            receipt["bound_at"] = prior["bound_at"]
    write_canonical_json(receipt_path, receipt, root=run_root)
    print(json.dumps(receipt, sort_keys=True))
    return 0


def _report_markdown(report: dict[str, Any]) -> bytes:
    checks = "\n".join(
        f"- `{name}`: `{item['verdict']}`" for name, item in report["checks"].items()
    )
    failures = "\n".join(f"- {item}" for item in report["failures"]) or "- None"
    body = f"""---
title: Lean Formal Verification Report
type: lean-verification-report
status: {report['status']}
schema_version: {report['schema_version']}
run_id: {report['run_id']}
generated_at: {report['generated_at']}
---

# Verification Report

## Verdict

`{report['status']}`

Formal verification requires all three authorities: the existing informal
proof-integrity audit, a successful Lean kernel receipt, and an independent
formalization-fidelity audit. Compilation alone is not theorem fidelity.

## Checks

{checks}

## Blocking Findings

{failures}

The canonical machine receipt is `VERIFICATION-REPORT.json`. This Markdown file
is a deterministic view of that receipt.
"""
    return body.encode("utf-8")


def close(args: argparse.Namespace) -> int:
    run_root = _assert_run_root(Path(args.run_root))
    checks, failures = _evaluate(run_root)
    failures.extend(_shared_binding_failures(run_root, require_bound=True))
    shared = _shared_binding_status(run_root)
    status = "formally_verified" if not failures else "blocked"
    report = {
        "schema_version": "verityos.lean-verification-report.v1",
        "run_id": run_root.name,
        "status": status,
        "generated_at": utc_now(),
        "checks": checks,
        "failures": failures,
        "shared_dependencies": {
            "packages_symlink_target": shared["target"],
            "shared_packages_root": shared["shared_packages_root"],
            "mathlib_revision": shared["mathlib_revision"],
            "toolchain_pin": shared["toolchain_pin"],
            "copied_package_tree": shared["is_copied_directory"],
        },
        "claim_boundary": (
            "Lean kernel validity plus independent statement fidelity; no broader truth, novelty, "
            "publication, or informal-proof completeness claim"
        ),
    }
    canonical = canonical_json_bytes(report)
    write_canonical_json(run_root / "VERIFICATION-REPORT.json", report, root=run_root)
    atomic_write(run_root / "VERIFICATION-REPORT.md", _report_markdown(report), root=run_root)
    state = read_json_object(run_root / "LOOP-STATE.json")
    state["status"] = status
    state["phases"]["intake"] = "passed"
    for receipt_name, phase_name in (
        ("theorem-contract", "theorem_contract"),
        ("formalization", "formalization"),
        ("kernel-verification", "kernel_verification"),
        ("fidelity-audit", "fidelity_audit"),
    ):
        result = checks.get(receipt_name, {})
        state["phases"][phase_name] = (
            "passed" if result.get("present") is True and receipt_name not in {
                failure.split(" ", 1)[0] for failure in failures
            } else "blocked"
        )
    state["phases"]["closeout"] = "passed" if status == "formally_verified" else "blocked"
    state["verification_report_sha256"] = sha256_bytes(canonical)
    _write_state(run_root, state)
    print(status)
    return 0 if status == "formally_verified" else 2


def resume_workflow(args: argparse.Namespace) -> int:
    run_root = _assert_run_root(Path(args.run_root))
    state = read_json_object(run_root / "LOOP-STATE.json")
    _validate_state(state, run_root)
    missing = [rel for rel in REQUIRED_LAYOUT if not (run_root / rel).exists()]
    if missing:
        raise ValueError("workflow cannot resume with missing canonical artifacts: " + ", ".join(missing))
    checks, failures = _evaluate(run_root)
    payload = {
        "run_id": run_root.name,
        "status": state["status"],
        "repair_attempts_used": state["repair_attempts_used"],
        "repair_attempt_limit": state["repair_attempt_limit"],
        "checks": checks,
        "failures": failures,
        "resumable": state["repair_attempts_used"] < state["repair_attempt_limit"],
    }
    print(json.dumps(payload, sort_keys=True))
    return 0 if not failures else 2


def begin_repair(args: argparse.Namespace) -> int:
    run_root = _assert_run_root(Path(args.run_root))
    state = read_json_object(run_root / "LOOP-STATE.json")
    _validate_state(state, run_root)
    if state["status"] != "blocked":
        raise ValueError("bounded repair begins only from a blocked terminal closeout")
    if state["repair_attempts_used"] >= state["repair_attempt_limit"]:
        raise ValueError("bounded repair budget is exhausted")
    attempt = state["repair_attempts_used"] + 1
    child = run_root.parent / f"{run_root.name}-repair-{attempt}"
    _assert_run_root(child)
    if child.exists():
        raise ValueError("repair child run already exists")
    # the child run id is exactly `<parent run id>-repair-<n>`: keep the parent's own suffix
    # (a bare "repair-<n>" suffix created a sibling `lean-<date>-repair-<n>` and then failed to
    # find `child`; fixed 2026-09-22, v1.3)
    parent_suffix = run_root.name[16:] if len(run_root.name) > 16 else ""
    child_args = argparse.Namespace(
        theorem=run_root.parent.parent.name,
        date=run_root.name[5:15],
        suffix=(f"{parent_suffix}-repair-{attempt}" if parent_suffix else f"repair-{attempt}"),
        experiments_root=str(_approved_experiments_root()),
        repair_limit=max(state["repair_attempt_limit"] - attempt, 0),
    )
    initialize(child_args)
    for relative in ("THEOREM-CONTRACT.yaml",):
        atomic_write(child / relative, (run_root / relative).read_bytes(), root=child)
    state["repair_attempts_used"] = attempt
    state.setdefault("repair_history", []).append(
        {
            "attempt": attempt,
            "started_at": utc_now(),
            "reason": args.reason,
            "child_run": child.relative_to(_approved_experiments_root()).as_posix(),
        }
    )
    state["phases"]["bounded_repair"] = "in_progress"
    _write_state(run_root, state)
    print(json.dumps({"attempt": attempt, "child_run": str(child)}, sort_keys=True))
    return 0


def verify_layout(args: argparse.Namespace) -> int:
    run_root = _assert_run_root(Path(args.run_root))
    missing = [rel for rel in REQUIRED_LAYOUT if not (run_root / rel).exists()]
    if missing:
        print(json.dumps({"ok": False, "missing": missing}, sort_keys=True))
        return 2
    state = read_json_object(run_root / "LOOP-STATE.json")
    if state.get("schema_version") != SCHEMA_VERSION:
        print(json.dumps({"ok": False, "error": "loop-state schema mismatch"}, sort_keys=True))
        return 2
    shared = _shared_binding_status(run_root)
    copied = _shared_binding_failures(run_root, require_bound=False)
    if copied:
        print(json.dumps({"ok": False, "error": copied[0], "shared_binding": shared}, sort_keys=True))
        return 2
    print(json.dumps({"ok": True, "run_root": str(run_root), "shared_binding": shared}, sort_keys=True))
    return 0


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)
    init = sub.add_parser("init")
    init.add_argument("--experiments-root", required=True)
    init.add_argument("--theorem", required=True)
    init.add_argument("--date")
    init.add_argument("--suffix")
    init.add_argument("--repair-limit", type=int, default=2)
    init.set_defaults(func=initialize)
    reviewers = sub.add_parser("assign-reviewers")
    reviewers.add_argument("--run-root", required=True)
    reviewers.add_argument("--artifact-producer-id", required=True)
    reviewers.add_argument("--informal-reviewer-id", required=True)
    reviewers.add_argument("--informal-reviewer-kind", required=True)
    reviewers.add_argument("--fidelity-reviewer-id", required=True)
    reviewers.add_argument("--fidelity-reviewer-kind", required=True)
    reviewers.set_defaults(func=assign_reviewers)
    audit = sub.add_parser("register-audit")
    audit.add_argument("--run-root", required=True)
    audit.add_argument("--audit", required=True)
    audit.add_argument("--artifact-producer-id", required=True)
    audit.add_argument("--reviewer-id", required=True)
    audit.add_argument("--attestation-id", required=True)
    audit.set_defaults(func=register_audit)
    bind = sub.add_parser("bind-shared-packages")
    bind.add_argument("--run-root", required=True)
    bind.add_argument("--shared-project", required=True)
    bind.set_defaults(func=bind_shared_packages)
    close_cmd = sub.add_parser("close")
    close_cmd.add_argument("--run-root", required=True)
    close_cmd.set_defaults(func=close)
    resume = sub.add_parser("resume")
    resume.add_argument("--run-root", required=True)
    resume.set_defaults(func=resume_workflow)
    repair = sub.add_parser("begin-repair")
    repair.add_argument("--run-root", required=True)
    repair.add_argument("--reason", required=True)
    repair.set_defaults(func=begin_repair)
    verify = sub.add_parser("verify-layout")
    verify.add_argument("--run-root", required=True)
    verify.set_defaults(func=verify_layout)
    binding = sub.add_parser("verify-shared-binding")
    binding.add_argument("--run-root", required=True)
    binding.set_defaults(func=verify_shared_binding)
    protect = sub.add_parser("protect-shared-packages")
    protect.add_argument("--shared-project", required=True)
    protect.set_defaults(func=protect_shared_packages)
    unprotect = sub.add_parser("unprotect-shared-packages")
    unprotect.add_argument("--shared-project", required=True)
    unprotect.set_defaults(func=unprotect_shared_packages)
    return parser


def main() -> int:
    parser = build_parser()
    try:
        args = parser.parse_args()
        return int(args.func(args))
    except (OSError, ValueError, json.JSONDecodeError, subprocess.CalledProcessError) as exc:
        print(f"lean-proof-workflow: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
