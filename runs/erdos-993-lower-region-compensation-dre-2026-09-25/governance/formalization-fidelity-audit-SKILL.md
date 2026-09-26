---
title: Formalization Fidelity Audit
name: formalization-fidelity-audit
description: Independently compare a theorem contract with a Lean declaration and kernel evidence, fail closed on structural drift or missing semantic review, and render a typed fidelity report from canonical JSON.
type: skill
subsystem: skills
domain: mathematical-verification
status: active
version: 1.0
last_updated: 2026-08-01
machine: Mac Mini
owner: Ashton T. Sperry
---

# Formalization Fidelity Audit

## Purpose

Use this skill after Lean formalization and kernel verification. It checks that
the declaration Lean proved is the theorem Ashton intended to prove.

This skill is additive to `proof-integrity-audit`: that skill audits the
informal mathematics, while this skill audits the boundary between the approved
theorem contract and the Lean declaration. A clean Lean build is necessary but
not sufficient for fidelity.

## Inputs

Provide a schema-valid JSON artifact matching
`schemas/fidelity-audit-input.schema.json`. The upstream theorem-contract skill
owns the human-authored YAML and exports the canonical contract projection used
here. This skill does not parse YAML and does not maintain a competing theorem
statement.

The input binds:

- the theorem-contract projection and its source hash;
- the Lean declaration, normalized statement facets, and source hash;
- the kernel-verification receipt, observed dependencies, and axioms;
- the artifact producer;
- an independent semantic-review attestation bound to exact contract and
  binding projection hashes.

Use `fingerprints` before independent review to obtain the two hashes the
reviewer must attest.

## Procedure

1. Confirm the kernel receipt says `verified`.
2. Run deterministic comparison over declaration name, definitions, domains,
   quantifiers, hypotheses, conclusion clauses, statement text, dependencies,
   axioms, and constructivity.
3. Require a reviewer other than the artifact producer when the policy requires
   independent semantic review.
4. Confirm the reviewer attestation names the exact current contract and
   binding projection hashes.
5. Treat reviewer `mismatch`, reviewer `uncertain`, or error-severity semantic
   findings as non-passing.
6. Write canonical JSON first, reread it, then render `FIDELITY-REVIEW.md` from
   that receipt. Markdown is a view, not the source of truth.

```bash
PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/formalization-fidelity-audit/scripts/audit_fidelity.py fingerprints \
  --run-root /absolute/path/to/run \
  --input EVIDENCE/fidelity-audit-input.json

PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/formalization-fidelity-audit/scripts/audit_fidelity.py audit \
  --run-root /absolute/path/to/run \
  --input EVIDENCE/fidelity-audit-input.json
```

Default outputs are:

- `RECEIPTS/fidelity-audit.json`
- `FIDELITY-REVIEW.md`

## Verdicts

- `passed`
- `rejected_deterministic_mismatch`
- `rejected_semantic_mismatch`
- `blocked_missing_independent_review`
- `blocked_stale_independent_review`
- `blocked_non_independent_reviewer`
- `blocked_reviewer_uncertain`
- `invalid_input`

Only `passed` is a fidelity success. Every other verdict is fail closed.

## Boundaries

- Do not infer semantic equivalence from normalized text alone.
- Do not let the formalizer attest its own semantic fidelity.
- Do not accept an attestation bound to an older contract or Lean binding.
- Do not treat an informal proof audit as kernel evidence.
- Do not change the theorem contract, Lean source, dependencies, or kernel
  receipt during this audit.
- Do not resolve a mismatch by weakening the intended theorem.
- Preserve source paths as run-relative paths and reject path traversal or
  symlink escape.

## Closeout

Report the typed verdict, deterministic and semantic statuses, exact findings,
input/contract/binding hashes, receipt path, and Markdown report path. A repair
must produce a new source hash and a new independently bound attestation before
rerunning this skill.
