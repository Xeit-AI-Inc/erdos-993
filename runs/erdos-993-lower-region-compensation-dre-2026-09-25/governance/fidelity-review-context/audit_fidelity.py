#!/usr/bin/env python3
"""Fail-closed theorem-contract to Lean-binding fidelity audit."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sys
import tempfile
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence


INPUT_VERSION = "formalization-fidelity-audit-input.v1"
RECEIPT_VERSION = "formalization-fidelity-audit-receipt.v1"
SHA256_RE = re.compile(r"^[0-9a-f]{64}$")
CLASSICAL_AXIOMS = {
    "Classical.choice",
    "Classical.em",
    "propext",
    "Quot.sound",
}
VERDICTS = {
    "passed",
    "rejected_deterministic_mismatch",
    "rejected_semantic_mismatch",
    "blocked_missing_independent_review",
    "blocked_stale_independent_review",
    "blocked_non_independent_reviewer",
    "blocked_reviewer_uncertain",
    "invalid_input",
}
SEVERITY_ORDER = {"error": 0, "warning": 1, "note": 2}
SKILL_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_TEMPLATE = SKILL_ROOT / "templates" / "FIDELITY-REVIEW.md"


class AuditInputError(ValueError):
    """Raised when an input cannot be audited safely."""


def canonical_bytes(value: Any) -> bytes:
    return (json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":")) + "\n").encode("utf-8")


def sha256_value(value: Any) -> str:
    return hashlib.sha256(canonical_bytes(value)).hexdigest()


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def normalize_text(value: str) -> str:
    return " ".join(value.split())


def safe_path(run_root: Path, relative: str, *, must_exist: bool = False) -> Path:
    if not relative or Path(relative).is_absolute():
        raise AuditInputError(f"path must be nonempty and run-relative: {relative!r}")
    root = run_root.resolve(strict=True)
    candidate = (root / relative).resolve(strict=must_exist)
    if candidate != root and root not in candidate.parents:
        raise AuditInputError(f"path escapes run root: {relative}")
    return candidate


def atomic_write(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, temp_name = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
    try:
        with os.fdopen(fd, "wb") as handle:
            handle.write(data)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temp_name, path)
    except BaseException:
        try:
            os.unlink(temp_name)
        except FileNotFoundError:
            pass
        raise


def _require_mapping(value: Any, path: str) -> Mapping[str, Any]:
    if not isinstance(value, dict):
        raise AuditInputError(f"{path} must be an object")
    return value


def _require_list(value: Any, path: str) -> list[Any]:
    if not isinstance(value, list):
        raise AuditInputError(f"{path} must be an array")
    return value


def _require_string(value: Any, path: str) -> str:
    if not isinstance(value, str) or not value:
        raise AuditInputError(f"{path} must be a nonempty string")
    return value


def _require_sha(value: Any, path: str) -> str:
    text = _require_string(value, path)
    if not SHA256_RE.fullmatch(text):
        raise AuditInputError(f"{path} must be a lowercase SHA-256")
    return text


def _require_keys(value: Mapping[str, Any], keys: Iterable[str], path: str) -> None:
    missing = sorted(set(keys) - set(value))
    if missing:
        raise AuditInputError(f"{path} is missing required keys: {', '.join(missing)}")


def validate_input(data: Any) -> Mapping[str, Any]:
    root = _require_mapping(data, "input")
    _require_keys(
        root,
        (
            "schema_version",
            "run_id",
            "artifact_producer_id",
            "theorem_contract",
            "lean_binding",
            "kernel_evidence",
            "audit_policy",
        ),
        "input",
    )
    if root["schema_version"] != INPUT_VERSION:
        raise AuditInputError(f"unsupported schema_version: {root['schema_version']!r}")
    _require_string(root["run_id"], "run_id")
    _require_string(root["artifact_producer_id"], "artifact_producer_id")

    contract = _require_mapping(root["theorem_contract"], "theorem_contract")
    _require_keys(
        contract,
        (
            "contract_id",
            "contract_sha256",
            "theorem_name",
            "definitions",
            "domains",
            "quantifiers",
            "hypotheses",
            "conclusion",
            "lean_statement",
            "dependencies",
            "permitted_axioms",
            "constructivity_requirement",
        ),
        "theorem_contract",
    )
    _require_string(contract["contract_id"], "theorem_contract.contract_id")
    _require_sha(contract["contract_sha256"], "theorem_contract.contract_sha256")
    _require_string(contract["theorem_name"], "theorem_contract.theorem_name")
    _validate_statement_facets(contract, "theorem_contract", contract_domains=True)
    _validate_dependencies(contract["dependencies"], "theorem_contract.dependencies")
    for index, axiom in enumerate(_require_list(contract["permitted_axioms"], "theorem_contract.permitted_axioms")):
        _require_string(axiom, f"theorem_contract.permitted_axioms[{index}]")
    if contract["constructivity_requirement"] not in {"constructive", "classical_allowed", "unspecified"}:
        raise AuditInputError("theorem_contract.constructivity_requirement is invalid")

    binding = _require_mapping(root["lean_binding"], "lean_binding")
    _require_keys(
        binding,
        (
            "declaration_name",
            "declaration_source_path",
            "declaration_source_sha256",
            "definitions",
            "domains",
            "quantifiers",
            "hypotheses",
            "conclusion",
            "lean_statement",
            "dependencies",
            "declared_axioms",
        ),
        "lean_binding",
    )
    _require_string(binding["declaration_name"], "lean_binding.declaration_name")
    source_path = _require_string(binding["declaration_source_path"], "lean_binding.declaration_source_path")
    if Path(source_path).is_absolute() or ".." in Path(source_path).parts:
        raise AuditInputError("lean_binding.declaration_source_path must be run-relative without '..'")
    _require_sha(binding["declaration_source_sha256"], "lean_binding.declaration_source_sha256")
    _validate_statement_facets(binding, "lean_binding", contract_domains=False)
    _validate_dependencies(binding["dependencies"], "lean_binding.dependencies")
    for index, axiom in enumerate(_require_list(binding["declared_axioms"], "lean_binding.declared_axioms")):
        _require_string(axiom, f"lean_binding.declared_axioms[{index}]")

    kernel = _require_mapping(root["kernel_evidence"], "kernel_evidence")
    _require_keys(kernel, ("receipt_sha256", "verdict", "reported_axioms", "dependencies"), "kernel_evidence")
    _require_sha(kernel["receipt_sha256"], "kernel_evidence.receipt_sha256")
    _require_string(kernel["verdict"], "kernel_evidence.verdict")
    for index, axiom in enumerate(_require_list(kernel["reported_axioms"], "kernel_evidence.reported_axioms")):
        _require_string(axiom, f"kernel_evidence.reported_axioms[{index}]")
    _validate_dependencies(kernel["dependencies"], "kernel_evidence.dependencies")

    policy = _require_mapping(root["audit_policy"], "audit_policy")
    _require_keys(policy, ("require_independent_review",), "audit_policy")
    if not isinstance(policy["require_independent_review"], bool):
        raise AuditInputError("audit_policy.require_independent_review must be boolean")

    review = root.get("independent_review")
    if review is not None:
        _validate_review(review)
    return root


def _validate_statement_facets(value: Mapping[str, Any], path: str, *, contract_domains: bool) -> None:
    for key in ("definitions", "domains", "quantifiers", "hypotheses"):
        _require_list(value[key], f"{path}.{key}")
    for index, item in enumerate(value["definitions"]):
        entry = _require_mapping(item, f"{path}.definitions[{index}]")
        _require_keys(entry, ("name", "canonical"), f"{path}.definitions[{index}]")
        _require_string(entry["name"], f"{path}.definitions[{index}].name")
        _require_string(entry["canonical"], f"{path}.definitions[{index}].canonical")
    for index, item in enumerate(value["domains"]):
        entry = _require_mapping(item, f"{path}.domains[{index}]")
        keys = ("variable", "lean_type", "forbidden_narrowings") if contract_domains else ("variable", "lean_type")
        _require_keys(entry, keys, f"{path}.domains[{index}]")
        _require_string(entry["variable"], f"{path}.domains[{index}].variable")
        _require_string(entry["lean_type"], f"{path}.domains[{index}].lean_type")
        if contract_domains:
            for offset, narrowing in enumerate(_require_list(entry["forbidden_narrowings"], f"{path}.domains[{index}].forbidden_narrowings")):
                _require_string(narrowing, f"{path}.domains[{index}].forbidden_narrowings[{offset}]")
    for index, item in enumerate(value["quantifiers"]):
        entry = _require_mapping(item, f"{path}.quantifiers[{index}]")
        _require_keys(entry, ("variable", "kind", "domain"), f"{path}.quantifiers[{index}]")
        _require_string(entry["variable"], f"{path}.quantifiers[{index}].variable")
        if entry["kind"] not in {"forall", "exists", "implicit"}:
            raise AuditInputError(f"{path}.quantifiers[{index}].kind is invalid")
        _require_string(entry["domain"], f"{path}.quantifiers[{index}].domain")
    for index, item in enumerate(value["hypotheses"]):
        entry = _require_mapping(item, f"{path}.hypotheses[{index}]")
        _require_keys(entry, ("id", "canonical"), f"{path}.hypotheses[{index}]")
        _require_string(entry["id"], f"{path}.hypotheses[{index}].id")
        _require_string(entry["canonical"], f"{path}.hypotheses[{index}].canonical")
    conclusion = _require_mapping(value["conclusion"], f"{path}.conclusion")
    _require_keys(conclusion, ("canonical", "clauses"), f"{path}.conclusion")
    _require_string(conclusion["canonical"], f"{path}.conclusion.canonical")
    clauses = _require_list(conclusion["clauses"], f"{path}.conclusion.clauses")
    if not clauses:
        raise AuditInputError(f"{path}.conclusion.clauses must not be empty")
    for index, clause in enumerate(clauses):
        _require_string(clause, f"{path}.conclusion.clauses[{index}]")
    _require_string(value["lean_statement"], f"{path}.lean_statement")


def _validate_dependencies(value: Any, path: str) -> None:
    for index, item in enumerate(_require_list(value, path)):
        entry = _require_mapping(item, f"{path}[{index}]")
        _require_keys(entry, ("name", "version", "content_hash"), f"{path}[{index}]")
        _require_string(entry["name"], f"{path}[{index}].name")
        _require_string(entry["version"], f"{path}[{index}].version")
        _require_sha(entry["content_hash"], f"{path}[{index}].content_hash")


def _validate_review(value: Any) -> None:
    review = _require_mapping(value, "independent_review")
    _require_keys(
        review,
        (
            "reviewer_id",
            "reviewer_kind",
            "attestation_id",
            "completed_at",
            "contract_projection_sha256",
            "binding_projection_sha256",
            "verdict",
            "findings",
        ),
        "independent_review",
    )
    for key in ("reviewer_id", "reviewer_kind", "attestation_id", "completed_at"):
        _require_string(review[key], f"independent_review.{key}")
    _require_sha(review["contract_projection_sha256"], "independent_review.contract_projection_sha256")
    _require_sha(review["binding_projection_sha256"], "independent_review.binding_projection_sha256")
    if review["verdict"] not in {"match", "mismatch", "uncertain"}:
        raise AuditInputError("independent_review.verdict is invalid")
    for index, item in enumerate(_require_list(review["findings"], "independent_review.findings")):
        finding = _require_mapping(item, f"independent_review.findings[{index}]")
        _require_keys(finding, ("category", "severity", "message"), f"independent_review.findings[{index}]")
        _require_string(finding["category"], f"independent_review.findings[{index}].category")
        if finding["severity"] not in {"error", "warning", "note"}:
            raise AuditInputError(f"independent_review.findings[{index}].severity is invalid")
        _require_string(finding["message"], f"independent_review.findings[{index}].message")


def contract_projection(data: Mapping[str, Any]) -> Mapping[str, Any]:
    return data["theorem_contract"]


def binding_projection(data: Mapping[str, Any]) -> Mapping[str, Any]:
    return {"lean_binding": data["lean_binding"], "kernel_evidence": data["kernel_evidence"]}


def projection_fingerprints(data: Mapping[str, Any]) -> dict[str, str]:
    validated = validate_input(data)
    return {
        "contract_projection_sha256": sha256_value(contract_projection(validated)),
        "binding_projection_sha256": sha256_value(binding_projection(validated)),
    }


def _indexed(items: Sequence[Mapping[str, Any]], key: str) -> dict[str, Mapping[str, Any]]:
    result: dict[str, Mapping[str, Any]] = {}
    for item in items:
        result[str(item[key])] = item
    return result


def _finding(
    category: str,
    severity: str,
    scope: str,
    expected: Any,
    observed: Any,
    message: str,
    *,
    source: str = "deterministic",
) -> dict[str, Any]:
    core = {
        "source": source,
        "category": category,
        "severity": severity,
        "scope": scope,
        "expected": expected,
        "observed": observed,
        "message": message,
    }
    return {"finding_id": sha256_value(core)[:16], **core}


def _compare_named(
    findings: list[dict[str, Any]],
    expected_items: Sequence[Mapping[str, Any]],
    observed_items: Sequence[Mapping[str, Any]],
    *,
    key: str,
    value: str,
    missing_category: str,
    altered_category: str,
    extra_category: str,
    label: str,
) -> None:
    expected = _indexed(expected_items, key)
    observed = _indexed(observed_items, key)
    for name in sorted(expected.keys() - observed.keys()):
        findings.append(_finding(missing_category, "error", f"{label}:{name}", expected[name], None, f"Required {label} is missing from the Lean binding."))
    for name in sorted(observed.keys() - expected.keys()):
        findings.append(_finding(extra_category, "error", f"{label}:{name}", None, observed[name], f"Lean binding contains an additional {label}."))
    for name in sorted(expected.keys() & observed.keys()):
        if normalize_text(str(expected[name][value])) != normalize_text(str(observed[name][value])):
            findings.append(_finding(altered_category, "error", f"{label}:{name}", expected[name][value], observed[name][value], f"{label.capitalize()} differs from the theorem contract."))


def deterministic_findings(data: Mapping[str, Any]) -> tuple[list[dict[str, Any]], int]:
    contract = data["theorem_contract"]
    binding = data["lean_binding"]
    kernel = data["kernel_evidence"]
    findings: list[dict[str, Any]] = []
    checks = 0

    checks += 1
    if kernel["verdict"] != "verified":
        findings.append(_finding("kernel_not_verified", "error", "kernel_evidence.verdict", "verified", kernel["verdict"], "Fidelity cannot pass without a verified kernel receipt."))

    checks += 1
    if contract["theorem_name"] != binding["declaration_name"]:
        findings.append(_finding("declaration_name_mismatch", "error", "declaration_name", contract["theorem_name"], binding["declaration_name"], "Lean declaration name differs from the theorem contract."))

    checks += 1
    if normalize_text(contract["lean_statement"]) != normalize_text(binding["lean_statement"]):
        findings.append(_finding("statement_text_mismatch", "error", "lean_statement", contract["lean_statement"], binding["lean_statement"], "Normalized Lean statement differs from the contract binding."))

    _compare_named(
        findings,
        contract["definitions"],
        binding["definitions"],
        key="name",
        value="canonical",
        missing_category="missing_definition",
        altered_category="altered_definition",
        extra_category="undeclared_definition",
        label="definition",
    )
    checks += max(len(contract["definitions"]), len(binding["definitions"]), 1)

    expected_domains = _indexed(contract["domains"], "variable")
    observed_domains = _indexed(binding["domains"], "variable")
    for variable in sorted(expected_domains.keys() | observed_domains.keys()):
        checks += 1
        expected = expected_domains.get(variable)
        observed = observed_domains.get(variable)
        if expected is None:
            findings.append(_finding("undeclared_domain", "error", f"domain:{variable}", None, observed, "Lean binding introduces an undeclared domain."))
        elif observed is None:
            findings.append(_finding("missing_domain", "error", f"domain:{variable}", expected, None, "Lean binding omits a contract domain."))
        elif normalize_text(expected["lean_type"]) != normalize_text(observed["lean_type"]):
            if normalize_text(observed["lean_type"]) in {normalize_text(item) for item in expected["forbidden_narrowings"]}:
                findings.append(_finding("narrowed_domain", "error", f"domain:{variable}", expected["lean_type"], observed["lean_type"], "Lean binding uses a predeclared forbidden narrowing of the intended domain."))
            else:
                findings.append(_finding("domain_mismatch", "error", f"domain:{variable}", expected["lean_type"], observed["lean_type"], "Lean binding domain differs from the theorem contract; semantic direction requires independent review."))

    expected_quantifiers = _indexed(contract["quantifiers"], "variable")
    observed_quantifiers = _indexed(binding["quantifiers"], "variable")
    for variable in sorted(expected_quantifiers.keys() | observed_quantifiers.keys()):
        checks += 1
        expected = expected_quantifiers.get(variable)
        observed = observed_quantifiers.get(variable)
        if expected != observed:
            findings.append(_finding("quantifier_mismatch", "error", f"quantifier:{variable}", expected, observed, "Quantifier kind or domain differs from the theorem contract."))

    expected_hypotheses = _indexed(contract["hypotheses"], "id")
    observed_hypotheses = _indexed(binding["hypotheses"], "id")
    for hypothesis_id in sorted(expected_hypotheses.keys() | observed_hypotheses.keys()):
        checks += 1
        expected = expected_hypotheses.get(hypothesis_id)
        observed = observed_hypotheses.get(hypothesis_id)
        if expected is None:
            findings.append(_finding("strengthened_hypothesis", "error", f"hypothesis:{hypothesis_id}", None, observed, "Lean declaration adds a hypothesis not authorized by the theorem contract."))
        elif observed is None:
            findings.append(_finding("missing_contract_hypothesis", "error", f"hypothesis:{hypothesis_id}", expected, None, "Lean declaration omits a contract hypothesis; fidelity requires review rather than silent reinterpretation."))
        elif normalize_text(expected["canonical"]) != normalize_text(observed["canonical"]):
            findings.append(_finding("altered_hypothesis", "error", f"hypothesis:{hypothesis_id}", expected["canonical"], observed["canonical"], "Lean hypothesis differs from the theorem contract."))

    checks += 1
    expected_conclusion = contract["conclusion"]
    observed_conclusion = binding["conclusion"]
    expected_clauses = {normalize_text(item): item for item in expected_conclusion["clauses"]}
    observed_clauses = {normalize_text(item): item for item in observed_conclusion["clauses"]}
    for clause in sorted(expected_clauses.keys() - observed_clauses.keys()):
        findings.append(_finding("weakened_conclusion", "error", "conclusion", expected_clauses[clause], None, "Lean conclusion omits a required conclusion clause."))
    for clause in sorted(observed_clauses.keys() - expected_clauses.keys()):
        findings.append(_finding("altered_conclusion", "error", "conclusion", None, observed_clauses[clause], "Lean conclusion introduces a clause absent from the theorem contract."))
    if normalize_text(expected_conclusion["canonical"]) != normalize_text(observed_conclusion["canonical"]):
        findings.append(_finding("conclusion_text_mismatch", "error", "conclusion", expected_conclusion["canonical"], observed_conclusion["canonical"], "Canonical conclusion text differs from the theorem contract."))

    expected_dependencies = _indexed(contract["dependencies"], "name")
    observed_dependencies = _indexed(kernel["dependencies"], "name")
    binding_dependencies = _indexed(binding["dependencies"], "name")
    for name in sorted(expected_dependencies.keys() | observed_dependencies.keys() | binding_dependencies.keys()):
        checks += 1
        expected = expected_dependencies.get(name)
        observed = observed_dependencies.get(name)
        declared = binding_dependencies.get(name)
        if expected != observed or expected != declared:
            findings.append(_finding("dependency_drift", "error", f"dependency:{name}", expected, {"lean_binding": declared, "kernel_evidence": observed}, "Declared or observed dependency identity differs from the theorem contract."))

    permitted_axioms = set(contract["permitted_axioms"])
    declared_axioms = set(binding["declared_axioms"])
    reported_axioms = set(kernel["reported_axioms"])
    checks += max(len(permitted_axioms | declared_axioms | reported_axioms), 1)
    for axiom in sorted(reported_axioms - declared_axioms):
        findings.append(_finding("hidden_axiom", "error", f"axiom:{axiom}", "declared in Lean binding", axiom, "Kernel evidence reports an axiom omitted from the Lean binding."))
    for axiom in sorted((declared_axioms | reported_axioms) - permitted_axioms):
        findings.append(_finding("undeclared_axiom", "error", f"axiom:{axiom}", sorted(permitted_axioms), axiom, "Lean proof depends on an axiom not permitted by the theorem contract."))
    if contract["constructivity_requirement"] == "constructive":
        for axiom in sorted(reported_axioms & CLASSICAL_AXIOMS):
            findings.append(_finding("constructivity_violation", "error", f"axiom:{axiom}", "constructive proof", axiom, "Kernel evidence contains a classical axiom for a constructive contract."))

    # Keep deterministic output stable even when one defect is detected by two checks.
    unique = {item["finding_id"]: item for item in findings}
    ordered = sorted(unique.values(), key=lambda item: (SEVERITY_ORDER[item["severity"]], item["category"], item["scope"], item["finding_id"]))
    return ordered, checks


def build_receipt(data: Mapping[str, Any]) -> dict[str, Any]:
    validated = validate_input(data)
    fingerprints = projection_fingerprints(validated)
    findings, deterministic_checks = deterministic_findings(validated)
    deterministic_failed = any(item["severity"] == "error" for item in findings)
    deterministic_status = "failed" if deterministic_failed else "passed"

    policy_requires_review = validated["audit_policy"]["require_independent_review"]
    review = validated.get("independent_review")
    semantic_status = "not_required"
    verdict = "rejected_deterministic_mismatch" if deterministic_failed else "passed"

    if policy_requires_review:
        semantic_status = "blocked"
        if review is None:
            verdict = "blocked_missing_independent_review"
        elif review["reviewer_id"] == validated["artifact_producer_id"]:
            verdict = "blocked_non_independent_reviewer"
        elif (
            review["contract_projection_sha256"] != fingerprints["contract_projection_sha256"]
            or review["binding_projection_sha256"] != fingerprints["binding_projection_sha256"]
        ):
            verdict = "blocked_stale_independent_review"
        elif review["verdict"] == "uncertain":
            verdict = "blocked_reviewer_uncertain"
        elif review["verdict"] == "mismatch" or any(item["severity"] == "error" for item in review["findings"]):
            semantic_status = "failed"
            verdict = "rejected_semantic_mismatch"
        else:
            semantic_status = "passed"
            if deterministic_failed:
                verdict = "rejected_deterministic_mismatch"
            else:
                verdict = "passed"

    if review is not None:
        for item in review["findings"]:
            findings.append(
                _finding(
                    item["category"],
                    item["severity"],
                    "independent_review",
                    "semantic fidelity",
                    item["verdict"] if "verdict" in item else review["verdict"],
                    item["message"],
                    source="independent_reviewer",
                )
            )
    findings = sorted(findings, key=lambda item: (SEVERITY_ORDER[item["severity"]], item["source"], item["category"], item["scope"], item["finding_id"]))
    error_count = sum(item["severity"] == "error" for item in findings)
    warning_count = sum(item["severity"] == "warning" for item in findings)
    passed_count = max(deterministic_checks - sum(item["source"] == "deterministic" and item["severity"] == "error" for item in findings), 0)

    attestation = None
    if review is not None:
        attestation = {key: review[key] for key in ("reviewer_id", "reviewer_kind", "attestation_id", "completed_at", "verdict")}
    receipt = {
        "schema_version": RECEIPT_VERSION,
        "run_id": validated["run_id"],
        "verdict": verdict,
        "fail_closed": verdict != "passed",
        "deterministic_status": deterministic_status,
        "semantic_review_status": semantic_status,
        "input_sha256": sha256_value(validated),
        **fingerprints,
        "contract_source_sha256": validated["theorem_contract"]["contract_sha256"],
        "lean_source_sha256": validated["lean_binding"]["declaration_source_sha256"],
        "kernel_receipt_sha256": validated["kernel_evidence"]["receipt_sha256"],
        "check_counts": {"passed": passed_count, "failed": error_count, "warnings": warning_count},
        "findings": findings,
        "review_attestation": attestation,
    }
    validate_receipt(receipt)
    return receipt


def validate_receipt(receipt: Any) -> Mapping[str, Any]:
    root = _require_mapping(receipt, "receipt")
    _require_keys(
        root,
        (
            "schema_version",
            "run_id",
            "verdict",
            "fail_closed",
            "deterministic_status",
            "semantic_review_status",
            "input_sha256",
            "contract_projection_sha256",
            "binding_projection_sha256",
            "contract_source_sha256",
            "lean_source_sha256",
            "kernel_receipt_sha256",
            "check_counts",
            "findings",
            "review_attestation",
        ),
        "receipt",
    )
    if root["schema_version"] != RECEIPT_VERSION:
        raise AuditInputError("unsupported receipt schema_version")
    if root["verdict"] not in VERDICTS:
        raise AuditInputError("receipt verdict is invalid")
    if root["fail_closed"] != (root["verdict"] != "passed"):
        raise AuditInputError("receipt fail_closed is inconsistent with verdict")
    for key in (
        "input_sha256",
        "contract_projection_sha256",
        "binding_projection_sha256",
        "contract_source_sha256",
        "lean_source_sha256",
        "kernel_receipt_sha256",
    ):
        _require_sha(root[key], f"receipt.{key}")
    _require_list(root["findings"], "receipt.findings")
    return root


def render_report(receipt: Mapping[str, Any], template_text: str) -> str:
    validated = validate_receipt(receipt)
    counts = validated["check_counts"]
    check_counts = f"- Passed checks: {counts['passed']}\n- Failed findings: {counts['failed']}\n- Warnings: {counts['warnings']}"
    if validated["findings"]:
        finding_lines = []
        for item in validated["findings"]:
            finding_lines.append(
                f"- `{item['severity']}` `{item['category']}` `{item['scope']}` "
                f"({item['source']}, `{item['finding_id']}`): {item['message']} "
                f"Expected `{json.dumps(item['expected'], ensure_ascii=False, sort_keys=True)}`; "
                f"observed `{json.dumps(item['observed'], ensure_ascii=False, sort_keys=True)}`."
            )
        findings = "\n".join(finding_lines)
    else:
        findings = "No fidelity findings."
    review = validated["review_attestation"]
    if review is None:
        review_text = "No independent semantic-review attestation is bound to this receipt."
    else:
        review_text = (
            f"- Reviewer: `{review['reviewer_id']}` ({review['reviewer_kind']})\n"
            f"- Attestation: `{review['attestation_id']}`\n"
            f"- Completed: `{review['completed_at']}`\n"
            f"- Verdict: `{review['verdict']}`"
        )
    replacements = {
        "{{RUN_ID}}": validated["run_id"],
        "{{VERDICT}}": validated["verdict"],
        "{{FAIL_CLOSED}}": str(validated["fail_closed"]).lower(),
        "{{DETERMINISTIC_STATUS}}": validated["deterministic_status"],
        "{{SEMANTIC_STATUS}}": validated["semantic_review_status"],
        "{{INPUT_SHA256}}": validated["input_sha256"],
        "{{CONTRACT_PROJECTION_SHA256}}": validated["contract_projection_sha256"],
        "{{BINDING_PROJECTION_SHA256}}": validated["binding_projection_sha256"],
        "{{CONTRACT_SOURCE_SHA256}}": validated["contract_source_sha256"],
        "{{LEAN_SOURCE_SHA256}}": validated["lean_source_sha256"],
        "{{KERNEL_RECEIPT_SHA256}}": validated["kernel_receipt_sha256"],
        "{{CHECK_COUNTS}}": check_counts,
        "{{FINDINGS}}": findings,
        "{{REVIEW_ATTESTATION}}": review_text,
    }
    rendered = template_text
    for marker, value in replacements.items():
        rendered = rendered.replace(marker, value)
    unresolved = re.findall(r"\{\{[A-Z0-9_]+\}\}", rendered)
    if unresolved:
        raise AuditInputError(f"unresolved report template markers: {', '.join(sorted(set(unresolved)))}")
    return rendered.rstrip() + "\n"


def _load_json(path: Path) -> Any:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise AuditInputError(f"cannot read canonical JSON {path}: {exc}") from exc


def run_audit(run_root: Path, input_relative: str, receipt_relative: str, report_relative: str) -> dict[str, Any]:
    input_path = safe_path(run_root, input_relative, must_exist=True)
    receipt_path = safe_path(run_root, receipt_relative)
    report_path = safe_path(run_root, report_relative)
    data = _load_json(input_path)
    binding = _require_mapping(data.get("lean_binding"), "lean_binding")
    source_path = safe_path(
        run_root,
        _require_string(binding.get("declaration_source_path"), "lean_binding.declaration_source_path"),
        must_exist=True,
    )
    protected = {
        input_path,
        source_path,
        safe_path(run_root, "THEOREM-CONTRACT.yaml", must_exist=True),
        safe_path(run_root, "RECEIPTS/kernel-verification.json", must_exist=True),
    }
    if receipt_path == report_path or receipt_path in protected or report_path in protected:
        raise AuditInputError("fidelity outputs must be distinct from each other and all authoritative inputs")
    receipt = build_receipt(data)
    atomic_write(receipt_path, canonical_bytes(receipt))
    reread_receipt = validate_receipt(_load_json(receipt_path))
    template_text = DEFAULT_TEMPLATE.read_text(encoding="utf-8")
    report = render_report(reread_receipt, template_text)
    atomic_write(report_path, report.encode("utf-8"))
    if report_path.read_text(encoding="utf-8") != report:
        raise AuditInputError("report readback differs from rendered receipt view")
    return dict(reread_receipt)


def run_render(run_root: Path, receipt_relative: str, report_relative: str) -> dict[str, Any]:
    receipt_path = safe_path(run_root, receipt_relative, must_exist=True)
    report_path = safe_path(run_root, report_relative)
    if receipt_path == report_path:
        raise AuditInputError("rendered report may not overwrite its canonical receipt")
    receipt = validate_receipt(_load_json(receipt_path))
    report = render_report(receipt, DEFAULT_TEMPLATE.read_text(encoding="utf-8"))
    atomic_write(report_path, report.encode("utf-8"))
    return dict(receipt)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)
    for name in ("fingerprints", "audit"):
        command = subparsers.add_parser(name)
        command.add_argument("--run-root", required=True, type=Path)
        command.add_argument("--input", default="EVIDENCE/fidelity-audit-input.json")
        if name == "audit":
            command.add_argument("--receipt", default="RECEIPTS/fidelity-audit.json")
            command.add_argument("--report", default="FIDELITY-REVIEW.md")
    render = subparsers.add_parser("render")
    render.add_argument("--run-root", required=True, type=Path)
    render.add_argument("--receipt", default="RECEIPTS/fidelity-audit.json")
    render.add_argument("--report", default="FIDELITY-REVIEW.md")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    try:
        if args.command == "fingerprints":
            input_path = safe_path(args.run_root, args.input, must_exist=True)
            values = projection_fingerprints(_load_json(input_path))
            sys.stdout.buffer.write(canonical_bytes(values))
            return 0
        if args.command == "render":
            receipt = run_render(args.run_root, args.receipt, args.report)
        else:
            receipt = run_audit(args.run_root, args.input, args.receipt, args.report)
        sys.stdout.buffer.write(canonical_bytes(receipt))
        return 0 if receipt["verdict"] == "passed" else 2
    except (AuditInputError, OSError) as exc:
        print(f"formalization-fidelity-audit: {exc}", file=sys.stderr)
        return 3


if __name__ == "__main__":
    raise SystemExit(main())
