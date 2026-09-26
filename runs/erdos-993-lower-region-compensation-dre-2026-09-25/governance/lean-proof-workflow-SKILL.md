---
title: Lean Proof Workflow
type: skill
subsystem: skills
domain: mathematical-verification
status: active
version: 1.2
last_updated: 2026-09-05
machine: Mac Mini
owner: Ashton T. Sperry
---

# Lean Proof Workflow

## Purpose

Orchestrate a resumable two-key formal-proof workflow: exact theorem intake,
existing informal proof-integrity audit, theorem contract, incremental Lean
formalization, kernel verification, independent fidelity audit, bounded repair,
and fail-closed closeout.

Lean certifies only the exact formal declaration. VerityOS may call a theorem
`formally_verified` only when the existing `proof-integrity-audit`, the Lean
kernel receipt, and the independent formalization-fidelity receipt all pass.

## Invocation

Use this skill explicitly when Ashton asks to formalize, kernel-check, certify,
or continue a theorem proof in Lean. It does not route automatically and does
not modify the accepted Generic DRE architecture.

## Authority

- VerityOS/controller owns run state, paths, IDs, hashes, receipts, repair
  budget, and terminal verdict.
- The Mathematics Agent or another authorized host worker supplies mathematical
  interpretation, proof strategy, and formalization candidates.
- Lean's kernel supplies formal type-checking evidence.
- `formalization-fidelity-audit` supplies the independent meaning-preservation
  key.
- Model output never writes authoritative hashes or promotes its own verdict.

## Canonical Run

```text
experiments/<theorem>/runs/lean-YYYY-MM-DD/
|-- THEOREM-CONTRACT.yaml
|-- DEPENDENCIES.yaml
|-- LeanProject/
|   `-- LeanProof/
|       `-- Main.lean
|-- EVIDENCE/
|   |-- INFORMAL-AUDIT.md
|   |-- build.log
|   |-- axioms.txt
|   `-- lean-verifier.sb
|-- RECEIPTS/
|   |-- reviewer-assignment.json
|   |-- informal-audit.json
|   |-- theorem-contract.json
|   |-- formalization.json
|   |-- dependency-authority.json
|   |-- kernel-verification.json
|   `-- fidelity-audit.json
|-- FIDELITY-REVIEW.md
|-- LOOP-STATE.json
|-- LOOP-STATE.md
|-- VERIFICATION-REPORT.json
`-- VERIFICATION-REPORT.md
```

JSON receipts are canonical deterministic state. Markdown is a generated human
view. `.lean` is proof authority. YAML is the human contract/configuration
surface.

## Procedure

1. Initialize the run with `scripts/run_workflow.py init`.
2. Have the controller bind distinct informal and fidelity reviewers with
   `assign-reviewers`. The artifact producer cannot assign itself either
   independent review role.
3. Run `skills/proof-integrity-audit/skill.md` on the exact intended theorem and
   proof. Register its unchanged artifact with `register-audit`.
4. Use `theorem-contract` to make definitions, domains, quantifiers,
   hypotheses, conclusion, dependency graph, permitted axioms,
   constructivity, declaration binding, and success criteria explicit.
5. Use `lean-formalization` to create or reuse a pinned Lean 4 + Mathlib Lake
   project. Formalize definitions and lemmas incrementally.
6. Bind the approved read-only shared Mathlib packages with
   `bind-shared-packages`. The controller normalizes the seeded Lake manifest,
   verifies the exact Mathlib revision, records key-file hashes, and creates
   only `LeanProject/.lake/packages` as an external symlink.
6a. Run `verify-shared-binding`. It fails closed if `LeanProject/.lake/packages`
   is a copied directory, is absent, or does not resolve to the approved
   shared Mathlib checkout. `verify-layout` and `close` run the same check;
   `close` records the symlink target, shared packages root, Mathlib
   revision, and toolchain pin in `VERIFICATION-REPORT.json` under
   `shared_dependencies`, so seals bind the revision, never copied bytes.
7. Use `lean-kernel-verification`. It must run the single-file and project
   checks, reject incomplete proofs and unapproved axioms, and write hash-bound
   logs/receipts.
8. Use the controller-assigned fresh reviewer with
   `formalization-fidelity-audit`. Deterministic
   checks do not replace semantic attestation.
9. If either key fails, enter at most the run's repair limit. Never change the
   intended theorem merely to obtain compilation. Re-run both affected gates.
10. Run `close`. A missing, malformed, stale, failed, or unrecognized receipt
   yields `blocked`, never success.

## Commands

```bash
PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/lean-proof-workflow/scripts/run_workflow.py init \
  --experiments-root experiments --theorem sample-theorem --date 2026-08-01

PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/lean-proof-workflow/scripts/run_workflow.py assign-reviewers \
  --run-root experiments/sample-theorem/runs/lean-2026-08-01 \
  --artifact-producer-id mathematics-agent \
  --informal-reviewer-id independent-informal-reviewer \
  --informal-reviewer-kind independent-mathematical-proof-integrity-reviewer \
  --fidelity-reviewer-id independent-fidelity-reviewer \
  --fidelity-reviewer-kind independent-mathematical-formalization-fidelity-reviewer

PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/lean-proof-workflow/scripts/run_workflow.py verify-layout \
  --run-root experiments/sample-theorem/runs/lean-2026-08-01

PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/lean-proof-workflow/scripts/run_workflow.py bind-shared-packages \
  --run-root experiments/sample-theorem/runs/lean-2026-08-01 \
  --shared-project \
  /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project

PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/lean-proof-workflow/scripts/run_workflow.py verify-shared-binding \
  --run-root experiments/sample-theorem/runs/lean-2026-08-01

PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/lean-proof-workflow/scripts/run_workflow.py close \
  --run-root experiments/sample-theorem/runs/lean-2026-08-01

# Read-only audit of every Lean project under experiments/ (exit 3 if any
# copied package tree exists); suitable for the weekly ecosystem audit.
PYTHONDONTWRITEBYTECODE=1 python3 \
  skills/lean-proof-workflow/scripts/audit_copied_packages.py
```

## Receipt Import Boundary

Each component writes its own canonical receipt directly to `RECEIPTS/`.
Closeout normalizes the component's documented verdict field, validates its
schema version, checks component self-hashes where defined, and rehashes the
current reviewer assignment, contract, source, logs, manifest, shared
dependency markers, and fidelity input. The fidelity receipt must also bind the
controller-generated review input and assigned reviewer identity. Receipts must
never be copied into place by hand to satisfy the workflow.

## Safety And Stop Conditions

- Use `$HOME/.elan/bin` or verified PATH discovery. Never install or update Lean
  or Mathlib implicitly.
- Network and dependency acquisition are off by default.
- Never run `lake update` in a durable proof run and never copy the shared
  multi-gigabyte Mathlib package tree into VerityOS. Since 2026-09-05 this is
  enforced: `verify-layout`, `verify-shared-binding`, and `close` fail closed
  on a copied `.lake/packages` directory, `lean-formalization` refuses to
  operate on one, and `scripts/audit_copied_packages.py` lists any that exist
  under `experiments/`. Background: 38 copied trees (about 63 GB real) were
  found and replaced on 2026-09-05; see
  `decisions/records/2026-09-05-mathlib-duplicate-cleanup.md`.
- Never run `lake clean` in a durable proof run. Through the symlinked binding
  it removes every workspace package's `.lake/build`, which is the SHARED
  Mathlib cache for every consumer on the machine (it happened on 2026-09-21; a
  40-minute rebuild). Since 2026-09-21 the shared packages tree is kept
  WRITE-PROTECTED, so `lake clean` and `lake update` fail with a permission
  error instead: `run_workflow.py protect-shared-packages --shared-project
  <shared project>` applies it, `verify-shared-binding` reports
  `shared_binding.write_protected` and warns when the tree is writable, and
  `unprotect-shared-packages` exists only for a deliberate rebuild or upgrade of
  the shared project (re-protect afterwards). Normal governed builds never write
  there — the kernel verifier's sandbox already denies it. If a build looks
  stale, delete only the run's own `LeanProject/.lake/build`. A space-free APFS
  clone of the packages tree is kept beside the shared project as a restore
  point (`<shared project>.packages-restore-point`; restore with `cp -Rc`). See
  `decisions/records/2026-09-21-shared-lean-packages-write-protection.md`.
- Source paths must stay inside the authorized run root.
- Never use `sorry`, `admit`, unapproved axioms, or a stronger hypothesis to
  make a proof appear complete.
- Stop on missing toolchain, dependency mismatch, malformed receipt, fidelity
  disagreement, resource limit, or author-choice ambiguity.
- Do not claim mathematical truth, novelty, publication readiness, or proof of
  the informal statement beyond the exact audited contract.

## Integration

This skill is additive to the accepted Generic DRE. Generic DRE may help surface
arguments and objections; it does not own Lean state or kernel verdicts. The
formal proof route remains explicit and is normally coordinated through the
canonical Mathematics Agent.
