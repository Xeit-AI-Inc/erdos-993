# Lean infrastructure preflight — proposal only

**Disposition:** The pinned Lean/Mathlib infrastructure on `mini-away` is present and internally consistent. The new lower-region experiment has no Lean run, theorem contract, reviewer assignment, proof source, or receipts yet. This preflight awards no mathematical, formalization, kernel, or fidelity status.

## Read-only observations

- Approved shared project: `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project`. Its `lean-toolchain` and the Mathlib checkout's `lean-toolchain` both say `leanprover/lean4:v4.32.2`.
- Installed direct binaries: `/Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean` reports `Lean (version 4.32.2, arm64-apple-darwin24.6.0, commit f3b06c705e6c85f5314019d5d3baab0fec5b580c, Release)`; the adjacent `lake` reports `Lake version 5.0.0-src+f3b06c7 (Lean version 4.32.2)`. The Elan shims exist, but these direct binaries avoid an implicit toolchain fetch.
- Shared seed manifest pins Mathlib at `905b95818eb32af7874a58b427f50c1711a5e96c`; `git rev-parse HEAD` on `.lake/packages/mathlib` returned the same revision. All nine manifest-listed Git packages exist and their checked-out HEADs match their manifest revisions. `Mathlib.olean` is present. The shared `.lake/packages` and Mathlib build directories have no write access under the workflow's protection check.
- Seed-file SHA-256: `lean-toolchain` `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273`; `lakefile.toml` `ca1c03383fc8a9f117d09fa97527f4f1f84cadb11e53d64115737c7540de9a5a`; `lake-manifest.json` `5061b76dea7adff45cac844810dd202a44e5fe5b1f39fe5c3a04825bdd464ac0`.
- The current remote experiment root `/Users/ashtonsperry/VerityOS/experiments/erdos-993-lower-region-compensation-dre-2026-09-25` contains only `control/`; no current Lean package was audited or executed.
- A narrowly selected predecessor run, `experiments/erdos-993-g1-large-residual-dre-2026-09-13/runs/lean-2026-09-20-c3`, has the intended `.lake/packages` symlink, contract, three distinct-role assignment, informal audit, contract, formalization, dependency-authority, kernel, and fidelity receipts, plus `build.log` and `axioms.txt`. Running the current controller's read-only `verify-layout` and `verify-shared-binding` against it returned `ok: true`, `write_protected: true`, no warnings, and no failures. This confirms the command path, not any claim in the new experiment.

The seed project itself is not a Git repository with a resolvable `HEAD`; the relevant revision is the Mathlib package checkout under `.lake/packages/mathlib`.

## Required future gate, without a proposed award

The controller must open an isolated run under the new experiment and assign an artifact producer, a **different** informal proof-integrity reviewer, and a **different** formalization-fidelity reviewer. The controller enforces three distinct identities in `RECEIPTS/reviewer-assignment.json`. The informal reviewer audits the exact intended statement and proof; registration creates `EVIDENCE/INFORMAL-AUDIT.md` and `RECEIPTS/informal-audit.json` without changing that audit artifact.

Before source formalization, `THEOREM-CONTRACT.yaml` must bind the exact informal theorem, definitions, domains, quantifiers, hypotheses, conclusion, dependency DAG, allowed axioms, constructivity, source hashes, and planned Lean declaration name, statement text, and statement SHA-256. The theorem-contract validator must issue `valid_for_formalization`; that is a structural gate only. Formalization then uses the exact installed pin `leanprover/lean4:v4.32.2` and Mathlib revision `905b95818eb32af7874a58b427f50c1711a5e96c` in manifest-only mode.

The controller's `bind-shared-packages` command normalizes the seed manifest into the run, verifies all package HEADs and marker hashes, creates only `LeanProject/.lake/packages` as a symlink to the approved shared packages root, and writes `RECEIPTS/dependency-authority.json`. The run must pass `verify-shared-binding`; a copied packages directory is rejected. The shared tree is protected, and no `lake update`, `lake clean`, installation, or shared-cache mutation is authorized.

The later kernel gate is **not read-only**: `verify_lean_kernel.py` writes run-local evidence and a receipt and invokes `lake build`. In its no-network sandbox it checks the full project and single source, rejects `sorry` and `admit` (and unsafe execution surfaces), runs `#print axioms` for the exact declaration, checks every axiom against the contract's explicit allowlist, hashes the source before and after, and retains `EVIDENCE/build.log`, `EVIDENCE/axioms.txt`, `EVIDENCE/lean-verifier.sb`, and `RECEIPTS/kernel-verification.json`. A `verified` kernel receipt certifies only that declaration. A fresh, distinct fidelity reviewer must then attest the exact contract/declaration binding and kernel evidence; only a `passed` `RECEIPTS/fidelity-audit.json` can supply the semantic key. Controller `close` must reject any missing, stale, failed, or malformed receipt.

## Exact read-only invocation for an existing future run

Run this **on `mini-away` after the controller has created and bound the isolated run**. Set `RUN_ROOT` to that run's actual absolute directory; the example name below is illustrative. These two controller subcommands only inspect files and print JSON, as confirmed from the implementation and the predecessor invocation.

```sh
RUN_ROOT=/Users/ashtonsperry/VerityOS/experiments/erdos-993-lower-region-compensation-dre-2026-09-25/runs/lean-2026-09-25-CLAIM-ID
PYTHONDONTWRITEBYTECODE=1 python3 -B /Users/ashtonsperry/VerityOS/skills/lean-proof-workflow/scripts/run_workflow.py verify-layout --run-root "$RUN_ROOT"
PYTHONDONTWRITEBYTECODE=1 python3 -B /Users/ashtonsperry/VerityOS/skills/lean-proof-workflow/scripts/run_workflow.py verify-shared-binding --run-root "$RUN_ROOT"
```

Both must exit zero with `ok: true`; `verify-shared-binding` must report `is_symlink: true`, `is_copied_directory: false`, the exact shared packages target, pin `leanprover/lean4:v4.32.2`, Mathlib revision `905b95818eb32af7874a58b427f50c1711a5e96c`, and `write_protected: true`. `verify-layout` alone accepts an as-yet unbound package, so the binding check is essential. A source typecheck or the full kernel audit is a later, explicitly assigned gate with run-local writes; neither was attempted here.

## Sources inspected

`B/governance/lean-proof-workflow-SKILL.md`, `B/EXECUTION-POLICY.md`, the remote workflow, theorem-contract, formalization, kernel, fidelity, and proof-integrity skill files, the workflow and verifier scripts, the approved shared seed files and Git metadata, and only the receipt names/verdicts plus binding metadata of the specified predecessor run. All remote inspection used the scoped `work/g1-dre-preparation/remote.py` helper; no remote files were changed.
