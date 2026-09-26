---
title: Lean Formal Verification Report
type: lean-verification-report
status: blocked
schema_version: verityos.lean-verification-report.v1
run_id: lean-2026-09-25-c3-first-shell
generated_at: 2026-09-26T03:52:59Z
---

# Verification Report

## Verdict

`blocked`

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

- fidelity receipt does not bind the current audit input
- fidelity receipt differs from deterministic revalidation
- formalization receipt does not share canonical run/declaration lineage
- fidelity package does not share canonical contract/source/reviewer lineage

The canonical machine receipt is `VERIFICATION-REPORT.json`. This Markdown file
is a deterministic view of that receipt.
