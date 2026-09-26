---
title: Lean Kernel Verification
type: skill
subsystem: skills
domain: mathematical-verification
status: active
version: 1.0
last_updated: 2026-08-01
machine: Mac Mini
owner: Ashton T. Sperry
---

# Lean Kernel Verification

## Purpose

Use this skill after a theorem contract and Lean formalization exist in a pinned
Lean 4 + Mathlib Lake project. It runs deterministic project and single-file
checks, records kernel axiom evidence, rejects incomplete proofs and unapproved
axioms, and writes a typed canonical JSON receipt.

This skill is a kernel gate, not an informal proof audit and not a semantic
fidelity review. A successful informal audit never substitutes for a successful
receipt from this skill. The separate `proof-integrity-audit` and
`formalization-fidelity-audit` skills remain required at their workflow stages.

## Required Run Layout

The run root must be under the governing experiment and contain a pinned Lake
project beneath it. The verifier writes logs under `EVIDENCE/` and its
canonical machine receipt under `RECEIPTS/`:

```text
experiments/<theorem>/runs/lean-YYYY-MM-DD/
  LeanProject/
    lean-toolchain
    lakefile.toml or lakefile.lean
    lake-manifest.json
    <source>.lean
  EVIDENCE/
    build.log
    axioms.txt
  RECEIPTS/
    kernel-verification.json
```

The Lake manifest must identify a pinned Git revision for Mathlib, and the
resolved Mathlib package must already exist locally. This skill never runs
`lake update`, installs a toolchain, downloads packages, or uses the network.

## Invocation

```bash
PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/lean-kernel-verification/scripts/verify_lean_kernel.py \
  --run-root experiments/example/runs/lean-2026-08-01 \
  --project-root LeanProject \
  --source LeanProof/Main.lean \
  --theorem-name Example.main
```

Pass each intentionally permitted axiom explicitly:

```bash
  --allowed-axiom Classical.choice \
  --allowed-axiom Quot.sound \
  --allowed-axiom propext
```

For the canonical shared Mathlib cache, also pass the exact authority recorded
by `lean-proof-workflow bind-shared-packages`:

```bash
  --shared-packages-root \
  /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages
```

The verifier accepts only `LeanProject/.lake/packages` as this explicit,
receipt-bound exception. It verifies the symlink target, normalized project
manifest hash, and Mathlib Git HEAD. Every other project or source escape still
fails closed.

Tool discovery prefers `$HOME/.elan/bin/lean` and
`$HOME/.elan/bin/lake`, then falls back to executable discovery on `PATH`.
Explicit `--lean-bin` and `--lake-bin` values are supported for controlled
environments and tests.

## Verification Contract

The verifier performs these checks in order:

1. Resolve the run, project, source, evidence, and receipt paths and reject any
   traversal or symlink escape.
2. Require `lean-toolchain`, a Lake file, `lake-manifest.json`, a pinned Mathlib
   Git revision, and an already-present local Mathlib package.
3. Hash the Lean source and project pin files before execution.
4. Lexically inspect executable Lean text and reject `sorry` or `admit` tokens
   outside comments and strings before invoking Lean.
5. Record explicit Lean and Lake versions and verify that the selected Lean
   version agrees with `lean-toolchain` when the version is encoded there.
6. Run `lake build` and an explicit `lake env <lean> <source>` check.
7. Run a transient copy of the source with `#print axioms <declaration>` and
   preserve the exact output in `EVIDENCE/axioms.txt`.
8. Fail closed if axiom output is malformed, contains `sorryAx`, or contains an
   axiom not named in the invocation's allowlist.
9. Rehash the source and reject any mutation.
10. Atomically write `RECEIPTS/kernel-verification.json` conforming to
    `schemas/kernel-verification-receipt.schema.json`.

The terminal `verified` verdict means only that the selected declaration passed
these kernel, project, source-integrity, and axiom-policy checks. It does not
mean that the Lean statement faithfully represents the intended theorem.

## Typed Verdicts

- `verified`
- `blocked_invalid_path`
- `blocked_invalid_project`
- `blocked_toolchain`
- `rejected_incomplete_proof`
- `rejected_build`
- `rejected_single_file`
- `rejected_axiom_probe`
- `rejected_axiom_evidence`
- `rejected_axioms`
- `rejected_source_mutation`
- `internal_error`

Every ordinary blocked or rejected run writes a receipt plus bounded evidence.
If the `EVIDENCE/` or `RECEIPTS/` path is unsafe, the CLI fails without writing rather
than writing outside the authorized run.

## Safety Boundaries

- Do not install or update Lean, Lake, Mathlib, or project dependencies.
- Do not execute shell strings; subprocesses receive argument arrays.
- Do not accept paths outside the run/project containment boundaries.
- Do not approve classical or other axioms implicitly.
- Do not treat a build-only pass, an informal audit, or an unparsed axiom output
  as kernel verification.
- Do not edit the source theorem or project pins.
- Preserve `build.log`, `axioms.txt`, and the receipt for workflow closeout.
