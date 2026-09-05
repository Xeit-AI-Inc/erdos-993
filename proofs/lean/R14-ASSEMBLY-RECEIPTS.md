# R14 Lean Package Assembly — Receipts

Assembly of three public Lean packages from the sealed, gated r14
`erdos-993-math-dre-20260905-r14-ambient-target` run (closed 2026-09-05;
`RUN-STATE.json` authority: Ashton, six cycles, C6 terminal). Toolchain pin:
Lean `4.32.2` (`f3b06c70`), Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`. Sole build input the READ-ONLY
cache at
`.../erdos-993-2026-08-26-continuation/cycles/cycle-3/lean/c3-gate/LeanProject/.lake`,
reached via a `.lake/packages` symlink per the run's own `CONTROLLER-LEG` /
`AWARD-REBUILD-A` method. Cache-manifest pin verified before and after every
build:

```
52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c
```

This is the corrected 64-hex-character pin (superseding the truncated value
in the initial task statement) and matches: (a) the run's own
`RUN-STATE.json` → `lean_pin.cache_manifest_sha256`; (b) the sealed
`AWARD-REBUILD-A/lake-manifest.json` on disk; and (c) the already-published
`r12-composition` / `r12-deg2-reduction` template packages' own
`lake-manifest.json` in this repo. No drift was observed: every BEFORE/AFTER
check below reproduces this identical digest.

Template source: `proofs/lean/r12-composition/` (`lakefile.toml`,
`lean-toolchain`, `lake-manifest.json`), copied into each new package
directory and adjusted only for library/package names.

**Import-glue repairs used, all three packages: 0 of the allowed 2.** Every
package built clean on the first cold attempt.

---

## Cross-package note: the vendored r12/r14 dependency chain

Both `r14-ambient-band` and `r14-reduction-perimeter` are scoped by the
assembly instructions to a small headline source set
(`R14C4T`/`Check` for the first, `R14C3T` for the second). In the sealed
run, `R14C4T/ShadowBand.lean` imports only `R14C3T.G2Slack`, and
`R14C3T/G2Slack.lean` imports only `R14C2T.StratumG`, which imports only
`R14C1F.AmbientStrata`, which imports only `R12C6T.Deg2Reduction` (which in
turn needs `R12C6T.{Targets,CorridorReduction,CorridorIngredients}`). The
sealed run's own `AWARD-REBUILD-A/lakefile.toml` already declares this exact
chain as four extra `[[lean_lib]]` targets with **absolute, private
filesystem `srcDir` paths** (one of them reaching a *different* experiment
root, `erdos-993-delta-comparison-dre-2026-09-04`, not otherwise part of
this run's citation). Absolute private paths cannot appear in a public
package (VerityOS decision record `2026-08-29-erdos-993-public-repository.md`),
and `lakefile`/`Check` of that tree were explicitly excluded from copy per
the assembly instructions, so a fresh `lakefile.toml` was written for each
package.

To make the two packages buildable and self-contained, the four upstream
modules were **vendored** (byte-copied from their own gated originals, not
re-derived) into each package under their original namespace directories
(`R12C6T/`, `R14C1F/`, `R14C2T/`, `R14C3T/`), mirroring exactly how the
existing `r12-composition` package already vendors `R12C5CORR1/AdjCorr.lean`
under a local namespace. **Cross-check:** the four `R12C6T/*.lean` files are
also byte-identical (`cmp`, zero diff) to the already-published
`proofs/lean/r12-deg2-reduction/R12C6T/*.lean` package files in this repo —
i.e., no new content enters the public surface; the same governed r12
module is reused verbatim in three sibling packages
(`r12-deg2-reduction`, `r14-ambient-band`, `r14-reduction-perimeter`), the
established convention (`R12C4T/CorridorIngredients.lean` is likewise
duplicated between `r12-composition` and `r12-deg2-reduction` already).
`R12C6T/AdjCorr.lean` was deliberately **not** vendored into either r14
package: it is not on the import path of `Deg2Reduction` and is unrelated
to either package's headline declarations.

No import lines were changed in any vendored or headline file for either
package — the original relative module names (`R14C3T.G2Slack`,
`R14C2T.StratumG`, `R14C1F.AmbientStrata`, `R12C6T.Deg2Reduction`) resolve
unmodified once the files are copied into matching local namespace
directories declared as sibling `[[lean_lib]]` targets. This is packaging
(lakefile structure), not a source-content repair, so it is not counted
against the two-repair cap.

`r14-forest-dichotomy`'s source tree (`R14C3-P/LeanProject/`) is fully
self-contained (all imports resolve to files already inside that same
tree, or to Mathlib) and required no vendoring and no lakefile changes
beyond the package name.

---

## Package 1 — `r14-ambient-band`

**Sources** (gated originals, `cycles/cycle-5/lean/AWARD-REBUILD-A/`,
excluding `RECEIPTS-A.md`, `legA-rebuild-raw.log`, `rebuild-a.sh`, `.lake/`,
and the tree's own `lakefile.toml`/`lean-toolchain`/`lake-manifest.json`
which came from the template instead): `R14C4T.lean`,
`R14C4T/ShadowBand.lean`, `Check.lean`, `Check/Axioms.lean`. PLUS the
vendored dependency chain described above: `R12C6T.lean`,
`R12C6T/{CorridorIngredients,CorridorReduction,Targets,Deg2Reduction}.lean`
(gated originals in `erdos-993-delta-comparison-dre-2026-09-04/cycles/cycle-6/lean/R12C6-T/LeanProject/`),
`R14C1F.lean`, `R14C1F/AmbientStrata.lean` (cycle-1), `R14C2T.lean`,
`R14C2T/StratumG.lean` (cycle-2), `R14C3T.lean`, `R14C3T/G2Slack.lean`
(cycle-3).

**Headlines**: all 13 declarations in the gated `Check/Axioms.lean`
(`RTree.residual_nonpos_of_card_le_band`,
`RTree.ambientTargetDeg2_of_G1wide_G2wide`,
`RTree.ambientInstance_of_order_le_two_mul`, and 10 more) — reused verbatim
as the basis for this package's `AxiomCheck.lean`.

### Source-file digest table (gated original vs copy)

| File | sha256 | Match |
|---|---|---|
| `R14C4T.lean` | `5860d997d4da97961e4bb7ad166a91f9276edb5ba787c1b60b3f15c9d26c3341` | YES (`cmp`) |
| `R14C4T/ShadowBand.lean` | `86ed073fce05ac699efc62923ac4b868dd794a8500fd9f1fdac0f2f42d04911c` | YES |
| `Check.lean` | `f75bf9f676bb439ab06fcbf52755cbaf15aedf0eb8dc05c36347561bdc1ae54d` | YES |
| `Check/Axioms.lean` | `269cc934e60d02becb2ab1c0b3f7fb9583581d913ace99872fe708925c042534` | YES |
| `R12C6T.lean` (vendored, gated orig. in delta-comparison cycle-6) | `78d486de3a0bef21a12b84698aa31dd957a1486a429bdec43aba0796bf5bbf3c` | YES |
| `R12C6T/CorridorIngredients.lean` (vendored) | `d846b17d32252c447b09197cf2b051b24be5153220da760935a44b95897ffd8a` | YES |
| `R12C6T/CorridorReduction.lean` (vendored) | `46d0605c1c4813fcf81646ec01456f411c1ecf49446cb05607d6bdced2075d2a` | YES |
| `R12C6T/Targets.lean` (vendored) | `2e30f2114d62a7963fdb69836ab8117c4a852014fcf083b49dc6a7a6716f7357` | YES |
| `R12C6T/Deg2Reduction.lean` (vendored) | `6c03350085324a85e7d580abf37149639fe68c125d1c2750a9513e955a644f3f` | YES |
| `R14C1F.lean` (vendored, gated orig. cycle-1) | `7c62e6923d1de1a907d043a717d46870916a4f6ea0a2d29b1d6754dcdd123b32` | YES |
| `R14C1F/AmbientStrata.lean` (vendored) | `3689d59d7ceebce7ba160e2015ad4ebad3241879853572e517d6c226fe9e3689` | YES |
| `R14C2T.lean` (vendored, gated orig. cycle-2) | `2771bf7e30fa0b2693f499487caf30e87e09078716dbf1ba839ae2e0cb7b715c` | YES |
| `R14C2T/StratumG.lean` (vendored) | `846d11e1dfac138885dbcdf111d5bf89a3d18a4bf6b1168ab005b03abe88a36d` | YES |
| `R14C3T.lean` (vendored, gated orig. cycle-3) | `733e5919c720674d8906b86056bb27ee219d829795f444a9cea8401b740dba7e` | YES |
| `R14C3T/G2Slack.lean` (vendored) | `a90445f076600bf2b42961ab9837168e683e6552a11a7211746efea7762fd8c5` | YES |
| `lean-toolchain` (from template) | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` | YES |
| `lake-manifest.json` (from template) | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` | YES |

All 15 `.lean` files confirmed byte-identical to their gated originals by
`cmp` (silent = identical; every comparison above passed). These digests
also match the ones recorded independently in the sealed run's own
`legA-rebuild-raw.log`. **Import-line adjustments: none.**

**New files (lakefile glue, not copied sources)**: `lakefile.toml` (six
`[[lean_lib]]` targets: `R12C6T`, `R14C1F`, `R14C2T`, `R14C3T`, `R14C4T`,
`Check`), `AxiomCheck.lean`, `KernelCheck.lean`.

### Build

Invocation: `cd r14-ambient-band && lake build`.

- Cache manifest sha256 BEFORE: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
- `lean --version` (in-package, via `.lake/packages` symlink + `lean-toolchain`): `4.32.2`, commit `f3b06c70…` — matched.
- Exit code: `0`. Transcript tail:
  ```
  ✔ [1462/1481] Built R12C6T.CorridorReduction (1.1s)
  ✔ [1463/1481] Built R12C6T.Targets (1.2s)
  ✔ [1464/1481] Built R12C6T.Deg2Reduction (1.3s)
  ℹ [1465/1481] Built R12C6T (1.3s)
  ⚠ [1467/1481] Built R14C1F.AmbientStrata (1.5s)   (1 pre-existing push_neg-deprecation warning)
  ℹ [1468/1481] Built R14C1F (1.2s)
  ✔ [1470/1481] Built R14C2T.StratumG (1.5s)
  ✔ [1471/1481] Built R14C2T (1.2s)
  ⚠ [1473/1481] Built R14C3T.G2Slack (1.5s)   (4 pre-existing push_neg-deprecation warnings)
  ✔ [1474/1481] Built R14C3T (1.2s)
  ✔ [1476/1481] Built R14C4T.ShadowBand (1.5s)
  ✔ [1477/1481] Built R14C4T (1.2s)
  ℹ [1479/1481] Built Check.Axioms (1.2s)
  ✔ [1480/1481] Built Check (1.1s)
  Build completed successfully (1481 jobs).
  ```
  (`lake build` also raw-prints `#print axioms` for `R12C6T`'s and
  `R14C1F`'s own bodies as part of their gated root files' content — all
  report `[propext, Classical.choice, Quot.sound]`; omitted here for
  brevity, reproduced in full for the package's own headlines below.)
- Cache manifest sha256 AFTER: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` — unchanged.
- Repairs used: 0 of 2 (first cold-build attempt succeeded).

### Axiom check — `lake env lean AxiomCheck.lean` (exit 0), raw output

```
'RTree.indepSet_subset' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.succ_mul_indepCountOn_le' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.DeltaOn_nonpos_of_card_le_two_mul' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.residual_nonpos_of_card_le_band' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.ambientInstance_of_card_le_band' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.residual_eq_zero_of_card_le_band_on_G2' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.not_lymViolation' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.not_bandPositive' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.one_le_degree_of_otherNbr' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.ambientInstance_of_order_le_two_mul' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.ambientTargetDeg2_of_G1wide_G2wide' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.wideHG1_of_HG1' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.wideHG2_of_sharpHG2' depends on axioms: [propext, Classical.choice, Quot.sound]
```

13/13 exactly `[propext, Classical.choice, Quot.sound]`. `lake env lean
KernelCheck.lean` also exits `0` and elaborates all 13 signatures under
`namespace RTree` (full type signatures reproduced in
`KernelCheck.lean`).

### sorry grep

```
grep -nE 'sorry|admit|native_decide' over all 15 .lean files
```

Six hits, all inside doc-comment prose (`"sorry-free"`, `"#eval, decide,
native_decide, ... not used"` boilerplate disclosure headers already
present in the gated originals) — zero live `sorry`/`admit` tactics, zero
live `native_decide`.

**Verdict: PASS.**

---

## Package 2 — `r14-reduction-perimeter`

**Sources** (gated originals, `cycles/cycle-3/lean/R14C3-T/LeanProject/`,
all non-check, non-Scratch `.lean`): `R14C3T.lean`, `R14C3T/G2Slack.lean` —
the completed R-5 reduction and premise-free perimeter over `G2`. PLUS the
same vendored dependency chain as Package 1 (`R12C6T.lean` + 4 module
files, `R14C1F.lean`/`AmbientStrata.lean`, `R14C2T.lean`/`StratumG.lean`),
for the reasons given in the cross-package note above.

**Headlines** (fully-qualified names grepped directly from
`R14C3T/G2Slack.lean`; 16 theorems): `RTree.one_le_indepCountOn_of_le_crossingIndexOn`,
`RTree.crossingIndexOn_le_card`, `RTree.residual_card_ge_of_G2`,
`RTree.indepSet_of_full_indepCount`, `RTree.indepCountOn_card_le_one`,
`RTree.card_le_indepCountOn_pred_of_indepSet`,
`RTree.residual_nonpos_of_card_eq_on_G2`,
`RTree.ambientInstance_of_card_eq_on_G2`, `RTree.not_s5Violation`,
`RTree.ambient_split_p`, `RTree.ambientInstance_iff_pair`,
`RTree.deficit_location`, `RTree.not_dlViolation`,
`RTree.ambientTargetDeg2_of_G1restricted_G2`,
`RTree.ambientTargetDeg2_of_G1restricted_G2sharp`,
`RTree.sharpHG2_of_HG2`.

### Source-file digest table

| File | sha256 | Match |
|---|---|---|
| `R14C3T.lean` | `733e5919c720674d8906b86056bb27ee219d829795f444a9cea8401b740dba7e` | YES |
| `R14C3T/G2Slack.lean` | `a90445f076600bf2b42961ab9837168e683e6552a11a7211746efea7762fd8c5` | YES |
| `R12C6T.lean` (vendored) | `78d486de3a0bef21a12b84698aa31dd957a1486a429bdec43aba0796bf5bbf3c` | YES |
| `R12C6T/CorridorIngredients.lean` (vendored) | `d846b17d32252c447b09197cf2b051b24be5153220da760935a44b95897ffd8a` | YES |
| `R12C6T/CorridorReduction.lean` (vendored) | `46d0605c1c4813fcf81646ec01456f411c1ecf49446cb05607d6bdced2075d2a` | YES |
| `R12C6T/Targets.lean` (vendored) | `2e30f2114d62a7963fdb69836ab8117c4a852014fcf083b49dc6a7a6716f7357` | YES |
| `R12C6T/Deg2Reduction.lean` (vendored) | `6c03350085324a85e7d580abf37149639fe68c125d1c2750a9513e955a644f3f` | YES |
| `R14C1F.lean` (vendored) | `7c62e6923d1de1a907d043a717d46870916a4f6ea0a2d29b1d6754dcdd123b32` | YES |
| `R14C1F/AmbientStrata.lean` (vendored) | `3689d59d7ceebce7ba160e2015ad4ebad3241879853572e517d6c226fe9e3689` | YES |
| `R14C2T.lean` (vendored) | `2771bf7e30fa0b2693f499487caf30e87e09078716dbf1ba839ae2e0cb7b715c` | YES |
| `R14C2T/StratumG.lean` (vendored) | `846d11e1dfac138885dbcdf111d5bf89a3d18a4bf6b1168ab005b03abe88a36d` | YES |
| `lean-toolchain` (from template) | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` | YES |
| `lake-manifest.json` (from template) | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` | YES |

All 11 `.lean` files confirmed byte-identical by `cmp`. **Import-line
adjustments: none.**

**New files**: `lakefile.toml` (four `[[lean_lib]]` targets: `R12C6T`,
`R14C1F`, `R14C2T`, `R14C3T`), `AxiomCheck.lean`, `KernelCheck.lean`.

### Build

Invocation: `cd r14-reduction-perimeter && lake build`.

- Cache manifest sha256 BEFORE: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
- `lean --version`: `4.32.2`, commit `f3b06c70…` — matched.
- Exit code: `0`. Transcript tail:
  ```
  ℹ [1465/1475] Built R12C6T (1.3s)
  ⚠ [1467/1475] Built R14C1F.AmbientStrata (1.5s)
  ℹ [1468/1475] Built R14C1F (1.2s)
  ✔ [1470/1475] Built R14C2T.StratumG (1.5s)
  ✔ [1471/1475] Built R14C2T (1.2s)
  ⚠ [1473/1475] Built R14C3T.G2Slack (1.5s)   (4 pre-existing push_neg-deprecation warnings)
  ✔ [1474/1475] Built R14C3T (1.1s)
  Build completed successfully (1475 jobs).
  ```
- Cache manifest sha256 AFTER: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` — unchanged.
- Repairs used: 0 of 2.

### Axiom check — `lake env lean AxiomCheck.lean` (exit 0), raw output

```
'RTree.one_le_indepCountOn_of_le_crossingIndexOn' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.crossingIndexOn_le_card' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.residual_card_ge_of_G2' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.indepSet_of_full_indepCount' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.indepCountOn_card_le_one' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.card_le_indepCountOn_pred_of_indepSet' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.residual_nonpos_of_card_eq_on_G2' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.ambientInstance_of_card_eq_on_G2' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.not_s5Violation' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.ambient_split_p' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.ambientInstance_iff_pair' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.deficit_location' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.not_dlViolation' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.ambientTargetDeg2_of_G1restricted_G2' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.ambientTargetDeg2_of_G1restricted_G2sharp' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.sharpHG2_of_HG2' depends on axioms: [propext, Classical.choice, Quot.sound]
```

16/16 exactly `[propext, Classical.choice, Quot.sound]`. `lake env lean
KernelCheck.lean` exits `0` and elaborates all 16 signatures.

### sorry grep

Five hits over the 11 source files, all inside doc-comment prose
(`"sorry-free"`, `#eval`/`decide`/`native_decide` disclosure-boilerplate
headers). Zero live `sorry`/`admit`/`native_decide`.

**Verdict: PASS.**

---

## Package 3 — `r14-forest-dichotomy`

**Sources** (gated originals, `cycles/cycle-3/lean/R14C3-P/LeanProject/`
— **not** the sibling `R14C3-P/bridge/LeanProject/` tree, which the
assembly instructions do not cite — all non-check, non-Scratch `.lean`;
this tree has no `Scratch.lean`/`Scratch/`): `Erdos993C8U1Base.lean`,
`Convolution.lean`, `ExtensionProfile.lean`, `NNSeqAdmission.lean`,
`Forest.lean`, `R12C2P.lean`, `R12C2P/P1.lean`, `R14C1P.lean`,
`R14C1P/ForestCorollaries.lean`, `R14C2P.lean`,
`R14C2P/TreeInstantiation.lean` — the forest-corollary dichotomy chain,
including `dichotomy_premise_free`. This tree is fully self-contained (no
external absolute-path dependencies); `R12C2P/P1.lean` is itself a
consumed copy of the r12 `P1_NNSeq` module, already carrying its own
`R12C2P` namespace in the gated source (no renaming needed).

**Headlines**: `dichotomy_premise_free` (both the free-index-set form
`R14C2P.dichotomy_premise_free` and the forest form
`R14C2P.RForest.dichotomy_premise_free`), plus
`RForest.unimodal_of_at_most_one_nonTRS2`, `RForest.dichotomy`,
`transfer_to_forest`, `reshaped_transfer_sharp` — checked in
`KernelCheck.lean`. Full 46-declaration axiom check grepped from the gated
`check/Axioms.lean` and the source files' own theorem/def names.

### Source-file digest table

| File | sha256 | Match |
|---|---|---|
| `Erdos993C8U1Base.lean` | `a45c61b8acc15e4ba6fbedbcc42274659c9cac864f23c586e34101728647c0da` | YES |
| `Convolution.lean` | `4795a9263dc76870ab79d320b1e27509270ea9e2e64f942e8979230dedb5d7a4` | YES |
| `ExtensionProfile.lean` | `740370914fae08e77197edd5f8fa7216d0e02110a7b2facd78ceb0a4181534aa` | YES |
| `NNSeqAdmission.lean` | `185fc06da631f8ffed247b804d48826c518206738aa9824f131617eba99c249f` | YES |
| `Forest.lean` | `828b2e68e622294a930ba434d6e5d80c3833c26046054f9633becc775a2dfc4c` | YES |
| `R12C2P.lean` | `abe0f9cbf92470dc79d48e90d40f657fb54fb1d36a20688caaf15e65f0ac471b` | YES |
| `R12C2P/P1.lean` | `0ccfe84dac871116c7b49d31be7a8a47bb485dbf9df03958bf4c8e9ad68c55d1` | YES |
| `R14C1P.lean` | `8ca7e08e30afd675bfed610ea8fb3b8c4f6edeb7e7cd704c6db76d2d325ad124` | YES |
| `R14C1P/ForestCorollaries.lean` | `f62d36fdf08917a7682d73b68b93e084964dbf6f8431660368eb2efed6aacc15` | YES |
| `R14C2P.lean` | `9b916c5e2aeba8e6c0851af07e879d4239d162c8ff57ba7b895a8ab79f64e7e0` | YES |
| `R14C2P/TreeInstantiation.lean` | `737d97f3b9b62197da4d2ef86ecc54764196f7a02d2f15efa4f580d5169eaf3c` | YES |
| `lean-toolchain` (from template) | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` | YES |
| `lake-manifest.json` (from template) | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` | YES |

All 11 `.lean` files confirmed byte-identical by `cmp`. **Import-line
adjustments: none.**

**New files**: `lakefile.toml` (eight `[[lean_lib]]` targets, reusing the
gated tree's own target list verbatim — that tree's `lakefile.toml` had no
external absolute paths, only the top-level `name` field changed from
`R14C2P` to `R14ForestDichotomy`), `AxiomCheck.lean`, `KernelCheck.lean`.

### Build

Invocation: `cd r14-forest-dichotomy && lake build`.

- Cache manifest sha256 BEFORE: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
- `lean --version`: `4.32.2`, commit `f3b06c70…` — matched.
- Exit code: `0`. Transcript tail:
  ```
  ⚠ [8655/8673] Built ExtensionProfile (1.9s)
  ⚠ [8657/8673] Built Erdos993C8U1Base (21s)
  ✔ [8659/8673] Built NNSeqAdmission (4.6s)
  ⚠ [8661/8673] Built Convolution (5.1s)
  ℹ [8663/8673] Built R12C2P.P1 (5.4s)
  ✔ [8664/8673] Built Forest (4.0s)
  ✔ [8666/8673] Built R12C2P (3.8s)
  ✔ [8668/8673] Built R14C1P.ForestCorollaries (4.1s)
  ✔ [8669/8673] Built R14C1P (3.5s)
  ✔ [8671/8673] Built R14C2P.TreeInstantiation (3.0s)
  ✔ [8672/8673] Built R14C2P (3.1s)
  Build completed successfully (8673 jobs).
  ```
  (Warnings are pre-existing linter/deprecation notes in the gated
  sources — `mul_le_mul_left'`/`mul_le_mul_right'` deprecations, an
  unused-`simpa`-argument hint, unused-variable hints — none touch proof
  content.)
- Cache manifest sha256 AFTER: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` — unchanged.
- Repairs used: 0 of 2.

### Axiom check — `lake env lean AxiomCheck.lean` (exit 0), raw output

```
'R14C2P.fseq' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.ford' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.prod_fseq' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.sum_ford' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.order_pos' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.hKL_transport' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.indepNNSeq_nil' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.indepNNSeq_cons' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.unimodal_nil' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.split' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.coreList' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.mem_coreList' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.trs2_logConcavePart' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.unimodal_of_at_most_one_nonTRS2' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.core_reduction' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.forest_of_core' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.dichotomy' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.order_ge_52' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.order_ge_52_of_disjunct_b' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.core_order_ge_26k' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.dichotomy_premise_free' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.dichotomy_premise_free' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.dichotomy_LC' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.dichotomy_LC' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.core_order_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.core_prod_singleton' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.core_order_sum_ge' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.core_empty_of_small' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.unimodal_of_order_le_25' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.order_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.order_ge_27' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.reshaped_transfer' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.reshaped_transfer_sharp' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C2P.RForest.reshaped_transfer_sharp' depends on axioms: [propext, Classical.choice, Quot.sound]
'P1_NNSeq' depends on axioms: [propext, Classical.choice, Quot.sound]
'RForest.indepNNSeq_eq_prod' depends on axioms: [propext, Classical.choice, Quot.sound]
'transfer_to_forest' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.TRS2_iff_adjacentLogConcave' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.indepNNSeq_ne_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.indepNNSeq_positiveIntervalSupport' depends on axioms: [propext, Classical.choice, Quot.sound]
'card_fromPieces' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C1P.core_reduction' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C1P.transfer_reshaped' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C1P.forest_counterexample_dichotomy' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C1P.forest_counterexample_order_ge_52' depends on axioms: [propext, Classical.choice, Quot.sound]
'R14C1P.forest_unimodal_of_at_most_one_nonTRS2' depends on axioms: [propext, Classical.choice, Quot.sound]
```

46/46 exactly `[propext, Classical.choice, Quot.sound]`. `lake env lean
KernelCheck.lean` (exit 0) elaborates the six named headlines, e.g.:

```
R14C2P.RForest.dichotomy_premise_free : ∀ (cs : List RTree),
  ¬Unimodal (RForest.indepNNSeq cs) →
    (∃ i, ¬Unimodal (cs.get i).indepNNSeq) ∨
      ∃ i₁ i₂, i₁ ≠ i₂ ∧ ¬Erdos993C8U1.TRS2 (cs.get i₁).indepNNSeq ∧
        ¬Erdos993C8U1.TRS2 (cs.get i₂).indepNNSeq
transfer_to_forest : ∀ (cs : List RTree),
  (∀ (i : Fin cs.length), Erdos993C8U1.TRS2 (cs.get i).indepNNSeq) →
    Erdos993C8U1.TRS2 (RForest.indepNNSeq cs)
```

### sorry grep

`0 occurrences` — no hits at all (not even doc-comment prose) over all 11
source files.

**Verdict: PASS.**

---

## Summary

| Package | Sources (headline / vendored) | Digest match | Import adjustments | Build | Axiom check | sorry | Repairs | Verdict |
|---|---|---|---|---|---|---|---|---|
| `r14-ambient-band` | 4 / 11 | 15/15 | 0 | exit 0 | 13/13 clean | 0 live | 0/2 | **PASS** |
| `r14-reduction-perimeter` | 2 / 9 | 11/11 | 0 | exit 0 | 16/16 clean | 0 live | 0/2 | **PASS** |
| `r14-forest-dichotomy` | 11 / 0 | 11/11 | 0 | exit 0 | 46/46 clean | 0 | 0/2 | **PASS** |

All three packages: cache-manifest pin
`52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` verified
unchanged before and after every build; toolchain resolved to Lean `4.32.2`
(`f3b06c70…`) in every package via its own `lean-toolchain` file; zero
import-glue repairs consumed against the 2-per-package cap; zero live
`sorry`/`admit`/`native_decide`; every checked declaration (75 total across
the three packages, some shared module premises counted once per package)
reports axioms exactly `[propext, Classical.choice, Quot.sound]`.

**Grade under the source run's rubric: `governed`. Not `formally_verified`.**
As stated on the sealed run's own face (`SOLUTION-CONTRACT.md` §2): TREE /
FOREST / TRANSFER / COUNTEREXAMPLE remain open before and after this
assembly; nothing in these three packages proves, asserts, or is offered as
evidence toward any of the four headline targets. `r14-ambient-band` +
`r14-reduction-perimeter` package the band-theorem / G2-perimeter reduction
route (open residues: `HG2 = G2` and `|U| ≥ 2p−2`, per the run's own C4
headline); `r14-forest-dichotomy` packages the forest-corollary dichotomy
chain resting on the cited, disclosed, non-kernel Kadrawi–Levit ≤25
computation (never imported as a Lean premise; the computational premise
stays a premise, disclosed on its face per `dichotomy_LC` and its
antecedents).

No README.md was written for any of the three packages (per instructions).
No `git add`/`git commit` was performed.
