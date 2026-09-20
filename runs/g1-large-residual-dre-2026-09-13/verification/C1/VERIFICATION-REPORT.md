---
title: Lean Formal Verification Report
type: lean-verification-report
status: formally_verified
schema_version: verityos.lean-verification-report.v1
run_id: lean-2026-09-13
generated_at: 2026-09-14T03:57:08Z
---

# Verification Report

## Verdict

`formally_verified`

Formal verification requires all three authorities: the existing informal
proof-integrity audit, a successful Lean kernel receipt, and an independent
formalization-fidelity audit. Compilation alone is not theorem fidelity.

## Checks

- `reviewer-assignment`: `assigned`
- `informal-audit`: `passed`
- `theorem-contract`: `valid_for_formalization`
- `formalization`: `FORMALIZATION_PREPARED_NOT_KERNEL_VERIFIED`
- `dependency-authority`: `bound_read_only`
- `kernel-verification`: `verified`
- `fidelity-audit`: `passed`

## Blocking Findings

- None

The canonical machine receipt is `VERIFICATION-REPORT.json`. This Markdown file
is a deterministic view of that receipt.
