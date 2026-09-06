# R15/R16 Lean Package Assembly — Receipts

Assembly of three public Lean packages from two sealed runs:

- `erdos-993-math-dre-20260905-r15-beta-condition` (closed 2026-09-06;
  `CLOSING-RECORD.md` authority: Ashton, terminal decision
  `AUTHORITY_CEILING_OPEN`, nine of nine authorized cycles complete) — source
  for `r15-beta-descent`.
- `erdos-993-identification-constructor-dre-2026-09-05` (cycles 2–4;
  `RUN-STATE.json`/`SOLUTION-CONTRACT.md` authority) — source for
  `r16-constructor` (cycle 3, route `R16C3-T`) and `r16-integration`
  (cycle 4, route `R16C4-T`).

Toolchain pin: Lean `4.32.2` (`f3b06c70`), Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`. Sole build input the READ-ONLY
cache at
`.../erdos-993-2026-08-26-continuation/cycles/cycle-3/lean/c3-gate/LeanProject/.lake`,
reached via a `.lake/packages` symlink (same method as `R12-ASSEMBLY-RECEIPTS.md`
and `R14-ASSEMBLY-RECEIPTS.md`). Cache-manifest pin verified before and after
every build in every package:

```
52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c
```

No drift was observed anywhere: every BEFORE/AFTER check below (including a
final cold rebuild of all three packages, `.lake/build` removed and rebuilt
from the read-only packages cache) reproduces this identical digest.

Template source: `proofs/lean/r12-composition/` (`lakefile.toml`,
`lean-toolchain`, `lake-manifest.json`), copied into each new package
directory and adjusted only for library/package names. `lean-toolchain` and
`lake-manifest.json` in all three packages are byte-identical (`cmp`) to the
template's own copies (sha256 `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273`
and `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
respectively).

**Import-glue repairs used: 1 of the allowed 2, in `r15-beta-descent` only.**
`r16-constructor` and `r16-integration` built clean on the first cold
attempt with zero repairs.

`lean --version` in every package (via its own `.lake/packages` symlink and
`lean-toolchain`): `Lean (version 4.32.2, arm64-apple-darwin24.6.0, commit
f3b06c705e6c85f5314019d5d3baab0fec5b580c, Release)` — matched.

---

## Cross-package note: extensive byte-identical reuse of already-published r12/r14 modules

All three packages sit downstream of dependency chains that the already-published
`r12-composition`, `r14-ambient-band`, and `r14-forest-dichotomy` packages in
this repo already vendor. Rather than re-deriving these modules from their
(read-only, absolute-path) sealed sources a second time, this assembly
**cross-verified** the sealed originals against the already-published package
bytes (`cmp`, zero diff, every case below) and copied from the published
package, per the assembly instructions ("vendor ... byte-identically,
cross-verifying against already-published package bytes where the same files
exist"):

| Module | Already-published source | Consumed by |
|---|---|---|
| `R12C4T/{CorridorIngredients,CorridorReduction,Targets}.lean` | `r12-composition` | `r15-beta-descent` (beta-gap, C13 deletion-graph, C5 acyclicity chain) |
| `R12C6T/{CorridorIngredients,CorridorReduction,Targets}.lean` | `r14-ambient-band` | `r15-beta-descent` (cycle-6 support-degree-two gap reduction) |
| `R12C6T/{CorridorIngredients,CorridorReduction,Targets,Deg2Reduction}.lean`, `R14C1F.lean`+`R14C1F/AmbientStrata.lean`, `R14C2T.lean`+`R14C2T/StratumG.lean` | `r14-ambient-band` | `r16-constructor`, `r16-integration` (T-lineage) |
| `R14C3T.lean`+`R14C3T/G2Slack.lean`, `R14C4T.lean`+`R14C4T/ShadowBand.lean` | `r14-ambient-band` | `r16-integration` (ADOPTED r14 surface being wired) |
| `Erdos993C8U1Base.lean`, `Convolution.lean`, `R12C2P.lean`+`R12C2P/P1.lean`, `R14C1P.lean`+`R14C1P/ForestCorollaries.lean`, `ExtensionProfile.lean`, `NNSeqAdmission.lean`, `Forest.lean` | `r14-forest-dichotomy` | `r16-constructor`, `r16-integration` (world-neutral base + P-lineage) |

Every row above was cross-checked with `cmp` against **both** (a) the sealed
original at its absolute read-only path in the r16 lakefiles' own `srcDir`
declarations, and (b) the already-published package copy; all three-way
comparisons are byte-identical (full digest table below). This mirrors the
established convention already used across `r12-deg2-reduction`,
`r14-ambient-band`, and `r14-reduction-perimeter` (the same `R12C6T` module
reused verbatim in three-plus sibling packages).

Two modules are vendored **fresh** here for the first time (not previously
published anywhere in this repo), both gated originals reached via absolute
`srcDir` paths in the r16 lakefiles that a public package cannot carry
forward (VerityOS decision record `2026-08-29-erdos-993-public-repository.md`,
same constraint documented in `R14-ASSEMBLY-RECEIPTS.md`):

- `R14C3P/AmbientBridge.lean` (T-lineage bridge; gated original at
  `erdos-993-ambient-target-dre-2026-09-05/cycles/cycle-3/lean/R14C3-P/bridge/LeanProject/R14C3P/AmbientBridge.lean`)
  — used by `r16-constructor` and `r16-integration`. Its own project also
  vendors `Erdos993C8U1Base.lean`/`Convolution.lean`/`R12C2P.lean`/`R12C2P/P1.lean`/`R14C1P.lean`/`R14C1P/ForestCorollaries.lean`
  copies, cross-checked byte-identical to the already-published copies used
  here (not separately re-vendored).
- `R16C2Base.lean`, `R16C2T.lean`, `R16C2P.lean` (r16 cycle-2 sealed
  keystone modules) and `R16C3N.lean`, `R16C3T.lean`, `R16C3P.lean`,
  `CheckT3.lean`, `CheckP3.lean` (r16 cycle-3 sealed constructor modules,
  the `R16C3-T` route) — used by `r16-constructor` and `r16-integration`.
  `R16C4T.lean`, `CheckT4.lean`, `CheckP4.lean` (r16 cycle-4, the `R16C4-T`
  integration route) — used by `r16-integration` only.

No file's content was altered in any of this vendoring; only new *root/glue*
files (thin one-line `import` wrappers required by `lake`'s `lean_lib`
convention, and this assembly's own `AxiomCheck*`/`KernelCheck*` files) were
authored fresh, exactly as `R12C4TAdj.lean` (`import R12C4T.AdjCorr`) already
does in the published `r12-composition` template.

## Cross-package note: the "two worlds" clash forces split Check files

Both `r16-constructor` and `r16-integration` build a T-world lineage (via
`R12C6T`) and a P-world lineage (via `ExtensionProfile`/`NNSeqAdmission`/`Forest`)
that the sealed run's own `CheckT3`/`CheckP3` (and `CheckT4`/`CheckP4`) keep
in separate files by design ("no module may see both"). `r15-beta-descent`
hits an analogous but distinct constraint: it vendors **two independently
namespaced but byte-identical copies** of the same r12 corridor module
(`R12C4T` from `r12-composition`, `R12C6T` from `r14-ambient-band`), both
declaring the same names inside `namespace RTree`. A single file importing
both fails to elaborate:

```
error: import R12C6T.CorridorIngredients failed, environment already
contains 'RTree.indepCountOn_coeff.match_1_1' from R12C4T.CorridorIngredients
```

This is a structural consequence of vendoring two copies of the same
namespace, not a defect in any vendored file, and is **not** counted against
the two-repair cap. `r15-beta-descent` therefore ships `AxiomCheck.lean` +
`KernelCheck.lean` (R12C4T lineage: beta-gap, C13, C5 acyclicity,
Erdos993BetaC8) and a second pair `AxiomCheckC6.lean` + `KernelCheckC6.lean`
(R12C6T lineage: the cycle-6 support-degree-two reduction). `r16-constructor`
and `r16-integration` keep the sealed run's own `CheckT3.lean`/`CheckP3.lean`
(and `CheckT4.lean`/`CheckP4.lean`) as the axiom-check artifacts of record
(they are already comprehensive, gated, byte-identical originals) and add
only new `KernelCheckT.lean`/`KernelCheckP.lean` (`r16-constructor`) or a
single `KernelCheck.lean` (`r16-integration`, both headlines are T-side only)
for the r12-pattern `#check` signatures.

---

## Package 1 — `r15-beta-descent`

**Sources**: the six governed declarations of the sealed
`erdos-993-math-dre-20260905-r15-beta-condition` run and their in-run
dependencies, located by cross-referencing `FINAL-RECONCILIATION.md`'s
"Governed Lean Inventory" against each cycle's `stage7/LEAN-GATE.md`:

| Declaration | Cycle | Gated original |
|---|---|---|
| `RTree.beta_gap_eq_of_guard`, `RTree.beta_bound_iff_gap_le_of_guard` | 2→3 (unchanged Cycle-2 source, re-verified at Cycle 3) | `cycles/cycle-2/stage3/C2-L-BETA-GAP/lean/C2BetaGap/BetaGap.lean` |
| `RTree.c13DeletionGraph_indep_count_eq` | 4 | `cycles/cycle-4/stage3/C4-L-INDUCED-DELETION-FOREST-REALIZATION/lean/C4LForestBridge.lean` (the gate's own final workflow lineage lives in the sibling experiment `erdos-993-beta-condition-c4-l-correspondence/runs/lean-2026-09-05-repair-2/`, which reuses this same file's byte-identical mathematical content under a mechanical single-import repackaging — the repackaged `Main.lean` is not vendored; the true modular original is) |
| `RTree.c5_vertex_scoped_deletion_acyclicity` | 5 | `cycles/cycle-5/stage3/C5-L-DELETION-ACYCLICITY/C5LDeletionAcyclicity.lean` |
| `RTree.supportDegreeTwoGapReduction` | 6 | `cycles/cycle-6/stage7/candidate/CANDIDATE.lean` |
| `Erdos993BetaC8.componentExtension_delta_nonpos_bounds` | 8 | sibling experiment `erdos-993-beta-condition-c8-component-count/runs/lean-2026-09-06-repair-1/LeanProject/LeanProof/Main.lean` — self-contained (`import Mathlib` only), so this **is** the gated original (its sha256 matches the `LEAN-GATE.md` "Lean source SHA-256" of record exactly) |

Plus the r12/r14 corridor dependency chains each of these five files needs
(see the cross-package note above): `R12C4T.{CorridorIngredients,
CorridorReduction, Targets}` (from `r12-composition`) for the beta-gap/C13/C5
chain, and `R12C6T.{CorridorIngredients, CorridorReduction, Targets}` (from
`r14-ambient-band`) for the cycle-6 candidate.

### Source-file digest table

| File | sha256 | Byte-identical to gated original |
|---|---|---|
| `R12C4T/CorridorIngredients.lean` | `d846b17d32252c447b09197cf2b051b24be5153220da760935a44b95897ffd8a` | YES (`cmp` vs. `r12-composition`) |
| `R12C4T/CorridorReduction.lean` | `26cdae06d33293f690bd0e15ef32d707639492cce8fb9d99e515eb7183873464` | YES |
| `R12C4T/Targets.lean` | `046bc5ca3cefc09c5f7ede5d1f5a714bf3888d5848cf831838915f5151adc6c0` | YES |
| `R12C6T/CorridorIngredients.lean` | `d846b17d32252c447b09197cf2b051b24be5153220da760935a44b95897ffd8a` | YES (`cmp` vs. `r14-ambient-band`; note identical bytes to the `R12C4T` copy above — same governed module, two namespace copies, see the "two worlds" note) |
| `R12C6T/CorridorReduction.lean` | `46d0605c1c4813fcf81646ec01456f411c1ecf49446cb05607d6bdced2075d2a` | YES |
| `R12C6T/Targets.lean` | `2e30f2114d62a7963fdb69836ab8117c4a852014fcf083b49dc6a7a6716f7357` | YES |
| `C2BetaGap/BetaGap.lean` | `381797adcbb208f772d36efeb95eff4e669873d50e4f526fd09d13c9182ad762` | YES (`cmp` vs. cycle-2 stage3 original) |
| `C4LForestBridge.lean` | `e59eff95a5a703330b56d91080c29534d2b9e7d1d7828485eaf36aa4d873276c` | YES (`cmp` vs. cycle-4 stage3 original) |
| `C5LDeletionAcyclicity.lean` | gated original `16e289e61fb5e26d9a3a4410dd87ed0f7a6da490c08b4af8ed5075ee9a76913a`; package copy (post-repair) `1bebc658c7fa14e9166246986bc926cd3218720cac8d2e0f673799371a9ff792` | ONE LINE CHANGED (disclosed below); `diff` confirms it is the only change |
| `C6SD2GapReduction/CANDIDATE.lean` | `44f4d0f104bb0518f43ea746f7a12d25d14ef486e5ad69de13c876534b752ef5` | YES (`cmp` vs. cycle-6 `stage7/candidate/CANDIDATE.lean`) |
| `Erdos993BetaC8.lean` | `750bc5ce2678d7404b8624fd5c5c70bb124cac499dde6e0122a0de2e95d08c9e` | YES (`cmp` vs. the c8 sibling experiment's kernel-verified `LeanProof/Main.lean`; matches `LEAN-GATE.md`'s recorded "Lean source SHA-256" exactly) |
| `lean-toolchain` (from template) | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` | YES |
| `lake-manifest.json` (from template) | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` | YES |

**Import-glue repair (1 of 2 allowed), disclosed verbatim.**
`C5LDeletionAcyclicity.lean`'s gated original imports the bare umbrella
`R12C4T` (which, in the sealed run's own single-import-repackaged build,
resolved to a project-local bundle that inlined `R12C4T.CorridorIngredients`
**and** `C4LForestBridge.lean`'s content together under that name — verified
by inspecting the sealed run's own packaged `R12C4T/Main.lean`, which is
byte-identical to `C4-l-correspondence`'s own `Main.lean` and contains both
blocks under `BEGIN INLINED RTree MODEL` / `BEGIN C4 L CORRESPONDENCE
CANDIDATE` markers). In this package's ordinary multi-file layout, the
umbrella `R12C4T.lean` provides only the corridor chain (`CorridorIngredients`
→ `CorridorReduction` → `Targets`), not `C4LForestBridge`'s `c13DeletionGraph`
definitions the proof needs. The fix is the one-line import repointing:

```diff
- import R12C4T
+ import C4LForestBridge
```

(`C4LForestBridge.lean` itself already imports `R12C4T.CorridorIngredients`,
so every name the proof body uses remains in scope.) No other line of
`C5LDeletionAcyclicity.lean` was touched; `diff` confirms a single changed
line.

**New files (lakefile glue, not copied sources)**: `lakefile.toml` (seven
`[[lean_lib]]` targets), thin one-line umbrella roots `R12C4T.lean`
(`import R12C4T.Targets`), `R12C6T.lean` (`import R12C6T.Targets`),
`C2BetaGap.lean` (`import C2BetaGap.BetaGap`), `C6SD2GapReduction.lean`
(`import C6SD2GapReduction.CANDIDATE`), plus `AxiomCheck.lean` +
`KernelCheck.lean` (R12C4T lineage) and `AxiomCheckC6.lean` +
`KernelCheckC6.lean` (R12C6T lineage — see the "two worlds" note above).

### Build

Invocation: `cd r15-beta-descent && lake build` (verified both warm and on a
fresh cold rebuild with `.lake/build` removed).

- Cache manifest sha256 BEFORE: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
- `lean --version`: `4.32.2`, commit `f3b06c70…` — matched.
- Exit code: `0`. Transcript tail (cold rebuild, 8676 jobs):
  ```
  ✔ [8670/8676] Built C6SD2GapReduction.CANDIDATE (1.9s)
  ✔ [8671/8676] Built C2BetaGap (1.2s)
  ✔ [8673/8676] Built C6SD2GapReduction (1.2s)
  ℹ [8675/8676] Built Erdos993BetaC8 (23s)
  Build completed successfully (8676 jobs).
  ```
  One pre-existing informational "Try this: ring_nf" hint appears inside
  `Erdos993BetaC8.lean` (line 658, gated original content, unchanged) — a
  linter suggestion, not an error; exit code and the subsequent axiom check
  both confirm the proof is complete.
- Cache manifest sha256 AFTER: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` — unchanged.
- Repairs used: 1 of 2 (the `C5LDeletionAcyclicity.lean` import repointing above).

### Axiom check — `lake env lean AxiomCheck.lean` (exit 0), raw output

```
'RTree.beta_gap_eq_of_guard' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.beta_bound_iff_gap_le_of_guard' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.c13DeletionGraph_adj_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.c13DeletionGraph_isAcyclic_of_ambient' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.c13AddressFinset_card' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.c13AddressFinset_subset' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.c13DeletionGraph_indep_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.c13FinsetCarrierEquiv_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.c13FinsetCarrierEquiv_card' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.c13DeletionGraph_indep_count_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.c5_vertex_scoped_deletion_acyclicity' depends on axioms: [propext, Classical.choice, Quot.sound]
```

Plus all 40 of `Erdos993BetaC8.lean`'s own lemmas/theorems (its full
supporting set, culminating in the headline), each reporting a subset of
`[propext, Classical.choice, Quot.sound]` (several need only `propext`, or
`propext`+`Quot.sound`, since they don't use choice) — zero exceptions:

```
'Erdos993BetaC8.extensionAdj_symm' depends on axioms: [propext]
'Erdos993BetaC8.extensionAdj_irrefl' depends on axioms: [propext]
'Erdos993BetaC8.isIndependent_iff_isIndepSet' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.isIndependent_oldPart' depends on axioms: [propext, Quot.sound]
'Erdos993BetaC8.isIndependent_rootFreePart' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.root_not_mem_of_y' depends on axioms: [propext, Quot.sound]
'Erdos993BetaC8.s_not_mem_of_y' depends on axioms: [propext, Quot.sound]
'Erdos993BetaC8.v_not_mem_of_s' depends on axioms: [propext, Quot.sound]
'Erdos993BetaC8.old_reconstruct' depends on axioms: [propext, Quot.sound]
'Erdos993BetaC8.rootFree_reconstruct' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.isIndependent_oldLift' depends on axioms: [propext, Quot.sound]
'Erdos993BetaC8.isIndependent_rootFreeLift' depends on axioms: [propext, Quot.sound]
'Erdos993BetaC8.isIndependent_insert' depends on axioms: [propext, Quot.sound]
'Erdos993BetaC8.codeFinset_independent' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.codeFinset_card' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.codeToIndep_surjective' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.codeToIndep_injective' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.iCoeff_componentExtension' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.delta_componentExtension' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.rootSet_isIndependent' depends on axioms: [propext, Quot.sound]
'Erdos993BetaC8.rootChoiceMap_injective' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.root_choose_le_coeffNat' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.root_not_mem_of_untouched' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.oneIncidenceMap_injective' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.card_untouched' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.oneSource_card_lower' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.pointedCoeff_card' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.one_root_count' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.rootSet_disjoint_rootFreeUnderlying' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.rootFreeUnderlying_isIndependent' depends on axioms: [propext, Quot.sound]
'Erdos993BetaC8.isIndependent_union' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.threeRootMap_injective' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.card_rootFreeUntouched' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.threeSource_card_lower' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.three_root_strict_of_pos' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.iCoeff_neg' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.iCoeff_nonneg' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.delta_componentExtension_zero_pos' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.delta_componentExtension_one_pos' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos993BetaC8.componentExtension_delta_nonpos_bounds' depends on axioms: [propext, Classical.choice, Quot.sound]
```

51/51 declarations checked, all within `[propext, Classical.choice,
Quot.sound]`. `lake env lean KernelCheck.lean` (exit 0) elaborates all five
of this file's headline signatures.

### Axiom check — `lake env lean AxiomCheckC6.lean` (exit 0), raw output

```
'RTree.stage7_indepCountOn_succ_within' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.stage7_exists_unique_otherNeighbor' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.stage7_closedNbhd_eq_of_degree_two' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.supportDegreeTwoGapReduction' depends on axioms: [propext, Classical.choice, Quot.sound]
```

4/4 declarations checked, all exactly `[propext, Classical.choice,
Quot.sound]`. `lake env lean KernelCheckC6.lean` (exit 0) elaborates the
sixth headline signature.

**55/55 declarations checked across the two axiom-check files, zero
exceptions to `[propext, Classical.choice, Quot.sound]`.**

### sorry grep

`grep -nE 'sorry|admit|native_decide'` over all 18 `.lean` source files: two
hits, both inside pre-existing doc-comment prose (`"sorry-free ..."`
boilerplate in the two vendored `Targets.lean` corridor files) — zero live
`sorry`/`admit`/`native_decide`.

**Verdict: PASS.**

---

## Package 2 — `r16-constructor`

**Sources**: `cycles/cycle-3/lean/R16C3-T/LeanProject/` of the
`erdos-993-identification-constructor-dre-2026-09-05` run — all non-check,
non-Scratch `.lean` files reachable from the route's own lakefile, plus its
declared T-lineage/P-lineage/cycle-2 dependencies (see the cross-package
note). **Headlines**: `R16C3.packGeneral_lawful` (T-world), and
`R16C3.lawIVPrime_components` (P-world), plus the full `CheckT3`/`CheckP3`
declaration lists (88 declarations total, see below).

### Source-file digest table

| File | sha256 | Byte-identical to gated original |
|---|---|---|
| `Erdos993C8U1Base.lean` | `a45c61b8acc15e4ba6fbedbcc42274659c9cac864f23c586e34101728647c0da` | YES (`cmp` vs. `r14-forest-dichotomy` and vs. the sealed R16C3-T tree's own copy) |
| `Convolution.lean` | `4795a9263dc76870ab79d320b1e27509270ea9e2e64f942e8979230dedb5d7a4` | YES |
| `R12C2P.lean` | `abe0f9cbf92470dc79d48e90d40f657fb54fb1d36a20688caaf15e65f0ac471b` | YES |
| `R12C2P/P1.lean` | `0ccfe84dac871116c7b49d31be7a8a47bb485dbf9df03958bf4c8e9ad68c55d1` | YES |
| `R14C1P.lean` | `8ca7e08e30afd675bfed610ea8fb3b8c4f6edeb7e7cd704c6db76d2d325ad124` | YES |
| `R14C1P/ForestCorollaries.lean` | `f62d36fdf08917a7682d73b68b93e084964dbf6f8431660368eb2efed6aacc15` | YES |
| `R12C6T/CorridorIngredients.lean` | `d846b17d32252c447b09197cf2b051b24be5153220da760935a44b95897ffd8a` | YES (`cmp` vs. `r14-ambient-band`) |
| `R12C6T/CorridorReduction.lean` | `46d0605c1c4813fcf81646ec01456f411c1ecf49446cb05607d6bdced2075d2a` | YES |
| `R12C6T/Targets.lean` | `2e30f2114d62a7963fdb69836ab8117c4a852014fcf083b49dc6a7a6716f7357` | YES |
| `R12C6T/Deg2Reduction.lean` | `6c03350085324a85e7d580abf37149639fe68c125d1c2750a9513e955a644f3f` | YES |
| `R14C1F.lean` | `7c62e6923d1de1a907d043a717d46870916a4f6ea0a2d29b1d6754dcdd123b32` | YES |
| `R14C1F/AmbientStrata.lean` | `3689d59d7ceebce7ba160e2015ad4ebad3241879853572e517d6c226fe9e3689` | YES |
| `R14C2T.lean` | `2771bf7e30fa0b2693f499487caf30e87e09078716dbf1ba839ae2e0cb7b715c` | YES |
| `R14C2T/StratumG.lean` | `846d11e1dfac138885dbcdf111d5bf89a3d18a4bf6b1168ab005b03abe88a36d` | YES |
| `R14C3P/AmbientBridge.lean` (vendored fresh) | `003172e59a7d3e6954fecba6e29646477183bc45e56f4ce3046be45767ba66ee` | YES (`cmp` vs. the sealed `.../ambient-target-dre-2026-09-05/cycles/cycle-3/lean/R14C3-P/bridge/LeanProject/R14C3P/AmbientBridge.lean`) |
| `ExtensionProfile.lean` | `740370914fae08e77197edd5f8fa7216d0e02110a7b2facd78ceb0a4181534aa` | YES (`cmp` vs. `r14-forest-dichotomy`) |
| `NNSeqAdmission.lean` | `185fc06da631f8ffed247b804d48826c518206738aa9824f131617eba99c249f` | YES |
| `Forest.lean` | `828b2e68e622294a930ba434d6e5d80c3833c26046054f9633becc775a2dfc4c` | YES |
| `R16C2Base.lean` (vendored fresh) | `2d88609d11a98d037907cf202cf5174ad229d527cf7119c447b6ffaeecd721c0` | YES (`cmp` vs. sealed cycle-2 `R16C2-T/LeanProject/R16C2Base.lean`) |
| `R16C2T.lean` (vendored fresh) | `bb18af87f7877cdd4b9f284179bc355280d1da2339c9d7568ea0ec684fc708c6` | YES |
| `R16C2P.lean` (vendored fresh) | `27c263e822b53ef03960f013363b2d5155373bb84e2d28734dae27564d85d12c` | YES |
| `R16C3N.lean` (vendored fresh) | `0bd9491c4ce6bf286165472cc4900a3136f468bb5b8b64b4a27f81ac74bc5cb7` | YES (`cmp` vs. sealed cycle-3 `R16C3-T/LeanProject/R16C3N.lean`) |
| `R16C3T.lean` (vendored fresh) | `64710ac6a312741d3ea5bd9b103b030a6ec479324f3718c8e50c06858c2f3b74` | YES |
| `R16C3P.lean` (vendored fresh) | `e1cd57220120a23b45a14b433a2fdbff6f33b54b2677389c6d5573650dc290f3` | YES |
| `CheckT3.lean` (vendored fresh) | `1d6c204a2f156878543b414d2d74af55474dc8aa632bf57db98533cf9da9c116` | YES |
| `CheckP3.lean` (vendored fresh) | `215ec340c85852afbcca20ac68b044edd54fec77d48f69b4527ddfde7ae7fb1f` | YES |
| `lean-toolchain` (from template) | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` | YES |
| `lake-manifest.json` (from template) | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` | YES |

All 26 `.lean` files confirmed byte-identical by `cmp`. **Import-line
adjustments: none.** No absolute (`/Users/...`) paths appear anywhere in any
vendored `.lean` file's content (`grep` over the full package, zero hits
outside `.lake/`).

**New files (lakefile glue, not copied sources)**: `lakefile.toml` (19
`[[lean_lib]]` targets), thin one-line umbrella roots `R12C6T.lean`
(`import R12C6T.Deg2Reduction`) and `R14C3P.lean` (`import
R14C3P.AmbientBridge`; coincidentally byte-identical to the sealed bridge
tree's own one-line root of the same name), plus `KernelCheckT.lean` and
`KernelCheckP.lean` (see the "two worlds" note above for why the axiom-check
role is fulfilled by the vendored `CheckT3.lean`/`CheckP3.lean` instead of a
new `AxiomCheck.lean`).

### Build

Invocation: `cd r16-constructor && lake build` (verified both warm and on a
fresh cold rebuild with `.lake/build` removed).

- Cache manifest sha256 BEFORE: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
- `lean --version`: `4.32.2`, commit `f3b06c70…` — matched.
- Exit code: `0`. Transcript tail (cold rebuild, 8701 jobs):
  ```
  info: CheckT3.lean:109:0: 'R16C2.lawfulT_mk' depends on axioms: [propext, Classical.choice, Quot.sound]
  info: CheckT3.lean:110:0: 'R16C2.G1_closure_of_lawful' depends on axioms: [propext, Classical.choice, Quot.sound]
  Build completed successfully (8701 jobs).
  ```
- Cache manifest sha256 AFTER: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` — unchanged.
- Repairs used: 0 of 2 (first cold-build attempt succeeded).

### Axiom check — `CheckT3.lean` + `CheckP3.lean` (both built as part of `lake build`, exit 0), raw output

```
'R16C3.addrP_iff_nb' does not depend on any axioms
'R16C3.indepNNSeq_eq_nbSeqOn' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.exists_tree_of_downclosed' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.exists_realizer' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.lawIVPrime_of_treeBlocks' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.lawIVPrime_components' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.lawIVPrime_sigma4' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.sigma4_realizer' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C2.LawIVPrime' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C2.indepNNSeq_coeff_one' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.indepNNSeq_coeff' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbAdjacent' does not depend on any axioms
'R16C3.nbAdjacent_comm' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbAdjacent_irrefl' depends on axioms: [propext, Quot.sound]
'R16C3.nbAdjacent_nil_iff' depends on axioms: [propext, Quot.sound]
'R16C3.nbAdjacent_cons_cons' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.not_nbAdjacent_cons_cons_of_ne' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbAdjacent_append_left' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.dropLast_eq_take'' depends on axioms: [propext]
'R16C3.drop_dropLast_comm' depends on axioms: [propext]
'R16C3.take_mem_of_downclosed' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.singleton_headI_of_length_one' depends on axioms: [propext, Quot.sound]
'R16C3.nbIndepFamily' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.mem_nbIndepFamily' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbSeqOn' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbSeqOn_coeff' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbSeqOn_image' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbRel' depends on axioms: [propext, Quot.sound]
'R16C3.nbRel_symm' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbReach' depends on axioms: [propext, Quot.sound]
'R16C3.nbReach_symm' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbReach_trans' depends on axioms: [propext, Quot.sound]
'R16C3.nbBlockOf' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbComponents' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.mem_nbBlockOf' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbBlockOf_subset' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.self_mem_nbBlockOf' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbBlockOf_eq_of_reach' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbBlockOf_eq_of_mem_inter' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.mem_of_mem_nbComponents' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbComponents_sup' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbComponents_disjoint' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.empty_notMem_nbComponents' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbComponents_nonempty' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbComponents_no_cross' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.reach_within' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbComponents_connected' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.IsNbTreeBlock' depends on axioms: [propext, Quot.sound]
'R16C3.nbComponents_isTreeBlock' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.treeBlock_root' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.treeBlock_edge_count' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.treeBlock_normalize' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.append_left_injOn' does not depend on any axioms
'R16C3.sSigma4block' depends on axioms: [propext, Quot.sound]
'R16C3.sSigma4' depends on axioms: [propext, Quot.sound]
'R16C3.threePathSeq' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.threePathSeq_coeff' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.a4' does not depend on any axioms
'R16C3.b4' does not depend on any axioms
'R16C3.c4' does not depend on any axioms
'R16C3.sigma4_adj_ab' does not depend on any axioms
'R16C3.sigma4_adj_bc' does not depend on any axioms
'R16C3.sigma4_nadj_ac' depends on axioms: [propext]
'R16C3.subset_triple_cases' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.sigma4_isTreeBlock' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbComponents_sigma4' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbIndepFamily_sigma4' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.nbSeqOn_sigma4' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.addr_iff_nb' does not depend on any axioms
'R16C3.seqOn_eq_nbSeqOn' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.lawL1_components' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.lawL2_components' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.lawL3_components' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.lawL3'_components' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.hf_components' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.packGeneral' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.packGeneral_lawful' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.tPath5' does not depend on any axioms
'R16C3.vertices_p5' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.residual_tPath5' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.packG4_data' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.packG4_lawful' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.anchor_path5_rank1' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.anchor_path5_rank2' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.anchor_path5_rank3' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.G1_closure_general' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C2.lawfulT_mk' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C2.G1_closure_of_lawful' depends on axioms: [propext, Classical.choice, Quot.sound]
```

88/88 declarations checked (11 `CheckP3` + 77 `CheckT3`), all within
`[propext, Classical.choice, Quot.sound]`. `lake env lean KernelCheckT.lean`
and `lake env lean KernelCheckP.lean` (both exit 0) elaborate
`R16C3.packGeneral_lawful` and `R16C3.lawIVPrime_components` respectively:

```
packGeneral_lawful : ∀ (t : RTree) (v g : List ℕ), R16C2.LawfulT t v g (packGeneral t v g)
lawIVPrime_components : ∀ (U : Finset (List ℕ)), R16C2.LawIVPrime (nbComponents U) nbSeqOn R16C2.ordCard
```

### sorry grep

`grep -nE 'sorry|admit|native_decide'` over all 26 `.lean` source files:
hits only inside pre-existing doc-comment prose (disclosure boilerplate
already present in the gated originals, e.g. "No computation, `#eval`,
`decide`, `native_decide`, search, or sampling") — zero live
`sorry`/`admit`/`native_decide`.

**Verdict: PASS.**

---

## Package 3 — `r16-integration`

**Sources**: `cycles/cycle-4/lean/` of the same run (the `R16C4-T/LeanProject`
integration module tree) — all non-check, non-Scratch `.lean` files, plus
the full `r16-constructor` dependency chain it extends (cycle-3's route is a
declared dependency of cycle-4's own lakefile) and the further T-lineage
extension `R14C3T`/`R14C4T` (already-published in `r14-ambient-band` — the
ADOPTED r14 surface this route wires). **Headline**: the integrated theorem
with premise set exactly `{Premise K, K-SCOPE}` —
`R16C4.G1wide_closure_of_constructed_identification` (grepped verbatim from
`R16C4T.lean`'s own doc comment, "premise set exactly {Premise K,
K-SCOPE}"), plus its adopted-surface composition
`R16C4.ambientTargetDeg2_of_KL_KSCOPE_HG2wide`.

### Source-file digest table

All 26 files from `r16-constructor`'s table above, byte-identical
(same sha256 values; re-verified with a fresh `cmp` pass), plus:

| File | sha256 | Byte-identical to gated original |
|---|---|---|
| `R14C3T.lean` | `733e5919c720674d8906b86056bb27ee219d829795f444a9cea8401b740dba7e` | YES (`cmp` vs. `r14-ambient-band`) |
| `R14C3T/G2Slack.lean` | `a90445f076600bf2b42961ab9837168e683e6552a11a7211746efea7762fd8c5` | YES |
| `R14C4T.lean` | `5860d997d4da97961e4bb7ad166a91f9276edb5ba787c1b60b3f15c9d26c3341` | YES |
| `R14C4T/ShadowBand.lean` | `86ed073fce05ac699efc62923ac4b868dd794a8500fd9f1fdac0f2f42d04911c` | YES |
| `R16C4T.lean` (vendored fresh) | `3f104d2ab98272c723bd057c7b43e69c96ad3bcf7c2c49da0bccda52845d4cac` | YES (`cmp` vs. sealed cycle-4 `R16C4-T/LeanProject/R16C4T.lean`) |
| `CheckT4.lean` (vendored fresh) | `930e017bb7965cd209785266699bedf21891c3270e1b212fe8ad865d4a8b1029` | YES |
| `CheckP4.lean` (vendored fresh) | `284e13698d67d590a02267f2b3d66e28633278d3ff3dbe8c532ab89cb0de359a` | YES |

All 33 `.lean` files confirmed byte-identical by `cmp`. **Import-line
adjustments: none.** No absolute paths anywhere (grep, zero hits outside
`.lake/`).

**New files (lakefile glue, not copied sources)**: `lakefile.toml` (23
`[[lean_lib]]` targets), the same two thin umbrella roots as
`r16-constructor` (`R12C6T.lean`, `R14C3P.lean`; `R14C3T.lean`/`R14C4T.lean`
are themselves already the correct umbrella content, carried byte-identical
from `r14-ambient-band`), plus a single `KernelCheck.lean` (both headlines
live in `R16C4T.lean` under namespace `R16C4`, which imports only the
T-world lineage, so — unlike the cycle-3 constructor pair — no world-split
is needed for the kernel check here).

### Build

Invocation: `cd r16-integration && lake build` (verified both warm and on a
fresh cold rebuild with `.lake/build` removed).

- Cache manifest sha256 BEFORE: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
- `lean --version`: `4.32.2`, commit `f3b06c70…` — matched.
- Exit code: `0`. Transcript tail (cold rebuild, 8713 jobs):
  ```
  ⚠ [8710/8713] Built R16C4T (3.7s)
  warning: R16C4T.lean:125:12: Variable name `p` is not explicitly referenced.
  ℹ [8712/8713] Built CheckT4 (3.1s)
  info: CheckT4.lean:24:0: 'RTree.ambientTargetDeg2_of_G1wide_G2wide' depends on axioms: [propext, Classical.choice, Quot.sound]
  info: CheckT4.lean:25:0: 'RTree.two_le_of_K_A_eq_one' depends on axioms: [propext, Classical.choice, Quot.sound]
  Build completed successfully (8713 jobs).
  ```
  The one warning is a pre-existing unused-variable linter note in the gated
  `R16C4T.lean` (an implicit binder named `p` in one theorem's proof term),
  not an error.
- Cache manifest sha256 AFTER: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` — unchanged.
- Repairs used: 0 of 2 (first cold-build attempt succeeded).

### Axiom check — `CheckT3.lean`/`CheckP3.lean` (identical 88-line output to `r16-constructor`, reproduced there) plus `CheckT4.lean`/`CheckP4.lean` (new, this cycle), raw output

```
'R16C3.lawIVPrime_components' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C4.G1wide_closure_of_constructed_identification' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C4.ambientTargetDeg2_of_KL_KSCOPE_HG2wide' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.packGeneral' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.packGeneral_lawful' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C3.G1_closure_general' depends on axioms: [propext, Classical.choice, Quot.sound]
'R16C2.G1_closure_of_lawful' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C3P.G1_closure_of_identification' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.AmbientTargetDeg2' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.ambientTargetDeg2_of_G1wide_G2wide' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.two_le_of_K_A_eq_one' depends on axioms: [propext, Classical.choice, Quot.sound]
```

99/99 declarations checked total (88 carried forward + 11 new), all within
`[propext, Classical.choice, Quot.sound]`. `lake env lean KernelCheck.lean`
(exit 0) elaborates both headline signatures:

```
G1wide_closure_of_constructed_identification :
  (∀ (t : RTree) (v g : List ℕ), ∀ C ∈ R16C3.nbComponents (t.ResidualAmbient v g),
      R16C2.ordCard C ≤ 25 → Erdos993C8U1.AdjacentLogConcave (R16C3.nbSeqOn C)) →
  (∀ (t : RTree) (v g : List ℕ), ∀ C ∈ R16C3.nbComponents (t.ResidualAmbient v g), R16C2.ordCard C ≤ 25) →
    ∀ (t : RTree) (v g : List ℕ) (p : ℕ), v ∈ t.leaves → t.degree (t.support v) = 2 →
      t.OtherNbr (t.support v) v g → t.K_A p = 1 →
        t.Bgen v ↑p + t.DeltaOnZ ((t.vertices \ t.closedNbhd v).erase g) (↑p - 1) < 0 →
          2 * p - 3 < (t.ResidualAmbient v g).card →
            t.crossingIndexOn (t.ResidualAmbient v g) < p - 2 →
              t.DeltaOnZ (t.ResidualAmbient v g) (↑p - 2) ≤ 0
ambientTargetDeg2_of_KL_KSCOPE_HG2wide : ... → RTree.AmbientTargetDeg2
```

(full signature reproduced in `KernelCheck.lean`'s own raw output; both
premises `hKL`/`hKSCOPE` and, for the second theorem, `HG2w`, remain live
binders — exactly the disclosed premise set `{Premise K, K-SCOPE}` plus the
still-open `HG2` antecedent for the composed adopted-surface form.)

### sorry grep

`grep -nE 'sorry|admit|native_decide'` over all 33 `.lean` source files:
hits only inside pre-existing doc-comment prose — zero live
`sorry`/`admit`/`native_decide`.

**Verdict: PASS.**

---

## Summary

| Package | Sources (headline files vendored fresh / corridor-chain files reused from already-published packages) | Digest match | Import adjustments | Build | Axiom check | sorry | Repairs | Verdict |
|---|---|---|---|---|---|---|---|---|
| `r15-beta-descent` | 5 / 6 | 18/18 (17 unmodified + 1 with the disclosed one-line diff) | 1 (disclosed) | exit 0 | 55/55 clean | 0 live | 1/2 | **PASS** |
| `r16-constructor` | 9 / 17 | 26/26 | 0 | exit 0 | 88/88 clean | 0 live | 0/2 | **PASS** |
| `r16-integration` | 12 / 21 | 33/33 | 0 | exit 0 | 99/99 clean | 0 live | 0/2 | **PASS** |

All three packages: cache-manifest pin
`52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` verified
unchanged before and after every build, including a final cold rebuild of
all three with `.lake/build` removed; toolchain resolved to Lean `4.32.2`
(`f3b06c70…`) in every package via its own `lean-toolchain` file and its own
`.lake/packages` symlink to the read-only cache; total import-glue repairs
consumed: 1 of the 6 allowed (2 per package × 3 packages); zero live
`sorry`/`admit`/`native_decide` anywhere; every one of the 242 checked
declarations across the three packages (55 + 88 + 99) reports axioms that
are a subset of exactly `[propext, Classical.choice, Quot.sound]`.

**Grade under the source runs' rubric: `governed`. Not `formally_verified`.**
As stated on both sealed runs' own face: `r15-beta-descent` packages six
auxiliary declarations from a run whose terminal decision is
`AUTHORITY_CEILING_OPEN` — `BetaTarget`, its negation, and any literal
`BetaCounterexample` remain open, and none of the six declarations is the
headline beta theorem (`FINAL-RECONCILIATION.md`: "None of the six
declarations is the headline beta theorem"). `r16-constructor` packages the
GATE-R16-CONSTRUCTOR pair (`packGeneral_lawful`, `lawIVPrime_components`) —
prototype-grade route deliverables (`RG` at best per their own doc-comment
ceiling), not governed theorems about any tree or forest. `r16-integration`
packages the GATE-R16-KEYSTONE-consuming wiring theorem that discharges the
old *identification* premise by construction while keeping `{Premise K,
K-SCOPE}` (and, for the composed form, the open `HG2` antecedent) live and
undischarged on every theorem's face; `AmbientTargetDeg2`, (α), (β), (A),
(B) are never asserted by anything in these three packages. TREE / FOREST /
TRANSFER / COUNTEREXAMPLE remain open before and after this assembly.

No README.md was written for any of the three packages (per instructions).
No `git add`/`git commit` was performed. Nothing outside
`proofs/lean/r15-beta-descent/`, `proofs/lean/r16-constructor/`,
`proofs/lean/r16-integration/`, and this receipts file was touched.
