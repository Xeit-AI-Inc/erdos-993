---
title: Lean Formalization
type: skill
subsystem: skills
domain: mathematical-verification
status: active
version: 1.1
last_updated: 2026-09-05
machine: Mac Mini
owner: Ashton T. Sperry
---

# Lean Formalization

## Purpose

Prepare or reuse a pinned Lean 4 + Mathlib Lake project and register definitions,
lemmas, and one target theorem incrementally. This skill prepares formal source;
it does not claim that Lean accepted the source. Kernel acceptance belongs to
`skills/lean-kernel-verification/`.

Use this skill after the theorem contract and informal
`skills/proof-integrity-audit/` pass identify the intended statement. It is an
additive formalization boundary and does not alter the Generic DRE architecture.

## Authority Boundary

- VerityOS owns the run state, source registry, hashes, and receipts.
- A model or host agent may propose Lean snippets, but deterministic code
  registers them and assigns authoritative paths and hashes.
- `.lean` source is the proof authority. JSON state and receipts describe that
  source; they do not substitute for it.
- A `prepared_not_verified` receipt is not evidence of theorem truth or kernel
  verification.

## Canonical Run Placement

Invoke the helper against an absolute run root such as:

```text
experiments/<theorem>/runs/lean-YYYY-MM-DD/
```

This skill creates only its formalization-owned artifacts there:

```text
DEPENDENCIES.yaml
FORMALIZATION-STATE.json
RECEIPTS/formalization.json
LeanProject/
  lean-toolchain
  lakefile.toml
  LeanProof.lean
  LeanProof/Main.lean
  LeanProof/Snippets/*.lean.fragment
```

The larger workflow owns `THEOREM-CONTRACT.yaml`, `EVIDENCE/`,
`FIDELITY-REVIEW.md`, `LOOP-STATE.md`, and `VERIFICATION-REPORT.md`.

## Initialize

Use an exact installed Lean toolchain pin and an exact 40-character Mathlib
commit. The default dependency mode writes a pinned Git dependency but never
fetches it:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/lean-formalization/scripts/prepare_lean_formalization.py init \
  --run-root /absolute/path/to/experiments/theorem/runs/lean-2026-08-01 \
  --run-id theorem-lean-2026-08-01 \
  --toolchain leanprover/lean4:v4.32.2 \
  --mathlib-revision 0123456789abcdef0123456789abcdef01234567
```

For a previously installed local Mathlib checkout, add
`--mathlib-source /absolute/path/to/mathlib4`. The helper reads its Git HEAD
without invoking Git and requires it to match `--mathlib-revision`. It does not
modify the checkout.

For the canonical shared-package route, initialize in manifest-only mode (omit
`--mathlib-source`), then use `lean-proof-workflow bind-shared-packages`. That
controller command copies and normalizes the approved stable seed manifest and
creates the one authorized `.lake/packages` symlink. This skill never copies the
multi-gigabyte package cache and never invokes `lake update`.

Enforcement (2026-09-05): every managed-state validation, `init` reuse,
`register`, `resume`, `rebind-run-id`, and `validate-receipt` first checks
`LeanProject/.lake/packages`. A real directory there fails closed with
`FormalizationError` ("copied directory, not the approved shared-package
symlink"); a symlink or an absent path is accepted.

## Register Source

Register explicit UTF-8 files in dependency order:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/lean-formalization/scripts/prepare_lean_formalization.py register \
  --run-root /absolute/path/to/run \
  --kind definition \
  --name double \
  --source-file /absolute/path/to/double.lean
```

Allowed kinds are `definition`, `lemma`, and `theorem`. Definitions precede
lemmas, and exactly one theorem is terminal. A repeated registration with the
same name and bytes is a no-op. Reusing a name with different bytes, changing a
pin, adding a lower-order declaration after a higher-order one, or registering
after the theorem fails closed.

## Resume And Validate

Ordinary reuse is idempotent. If an interruption occurs after managed source and
state were written but before the receipt was finalized, use the explicit
`resume` command. It recreates a receipt only when every managed file can be
rederived and matches its recorded hash:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/lean-formalization/scripts/prepare_lean_formalization.py resume \
  --run-root /absolute/path/to/run
```

Validate an existing receipt without writing:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/lean-formalization/scripts/prepare_lean_formalization.py \
  validate-receipt --run-root /absolute/path/to/run
```

## Toolchain And Network Safety

- Prefer the exact installed binary directory under
  `$HOME/.elan/toolchains/<pin>/bin` so Elan shims cannot perform update checks.
- `VERITY_LEAN_TOOLCHAIN_BIN` may name an explicit absolute binary directory.
- `$HOME/.elan/bin` and `PATH` are inspected only as discovery evidence; shims
  are not executed when the exact pinned toolchain directory is absent.
- The helper never runs `elan`, `lake update`, `lake build`, `git`, a package
  installer, or a network client.
- Existing unmanaged projects, symlinked managed paths, drifted files, missing
  pins, and malformed state fail closed rather than being overwritten.

## Receipt Contract

`schemas/formalization-receipt.schema.json` is the canonical machine grammar.
The standard-library validator enforces its critical shape and recomputes the
self-hash, project hash, state hash, and managed-file inventory without PyYAML
or `jsonschema`.

Every receipt has verdict
`FORMALIZATION_PREPARED_NOT_KERNEL_VERIFIED`, status
`prepared_not_verified`, and `network.used: false`. Only the separate kernel
verification skill may produce a Lean-verified verdict.

## Validation

```bash
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover \
  -s skills/lean-formalization/tests -p 'test_*.py'
```

The tests cover initial creation, byte-stable idempotent reuse, conflicting
pins, path traversal, incremental source registration, and a false formulation
that remains explicitly prepared but unverified.
