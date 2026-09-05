# R12 Lean Package Assembly — Receipts

Assembly act for four public Lean packages under `proofs/lean/`, built from
sealed, gated sources in the run directory. Sole build input: the READ-ONLY
cache at `/Users/ashtonsperry/VerityOS/experiments/erdos-993-2026-08-26-continuation/cycles/cycle-3/lean/c3-gate/LeanProject/.lake`.
Cache manifest sha256 required/observed (before and after **every** package
build, no exceptions): `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
— matched every time, unchanged throughout.

Pin: Lean `4.32.2` (commit `f3b06c705e6c85f5314019d5d3baab0fec5b580c`, confirmed
via `lean --version` inside each package directory, elan resolving from that
package's own `lean-toolchain`); Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`
(`lakefile.toml` in every package).

Build-environment method (mirrors the sealed run's own verification, e.g.
`cycles/cycle-5/lean/R12C5-CORR-1/LeanProject`): `mkdir -p <pkg>/.lake` then
`ln -s <cache>/.lake/packages <pkg>/.lake/packages` — a fresh symlink to the
read-only cache's built package tree (mathlib + deps, prebuilt), leaving
`.lake/build` and `.lake/config` to be produced locally by `lake build`. No
file under the cache was read for writing, moved, or modified. `.lake/` is
already `.gitignore`d in this repo (`proofs/lean/.gitignore`'s parent
`.gitignore`) and every other package directory under `proofs/lean/` already
carries its own local `.lake/`, so the symlink + local build products were
left in place rather than torn down, matching existing repo convention.

Overall result: **4/4 packages PASS.** Every build succeeded on the first
attempt (0 of the 2-repair cap used, in every package). Every checked
declaration across all four packages reports axioms exactly
`[propext, Classical.choice, Quot.sound]`. Every `sorry` grep hit is inside a
doc-comment containing the string "sorry-free" (checked in context; not a
live tactic). No source file required a repair beyond the one disclosed,
deliberate import-line change in Package 3 (below).

---

## Package 1 — `r12-p1-convolution`

**Sources** (from `cycles/cycle-2/lean/R12C2-P/LeanProject/`, excluding
`Scratch/`): `R12C2P.lean`, `R12C2P/P1.lean`, `Erdos993C8U1Base.lean`, plus
`lean-toolchain`, `lakefile.toml`, `lake-manifest.json` copied unedited from
the same source directory (its own `lake-manifest.json` already matches the
cache's digest).

**Headline declaration**: `P1_NNSeq` (top-level, no enclosing namespace —
the file only `open`s `Erdos993C8U1`), plus every other public theorem in
`P1.lean`. The exact 21-declaration axiom-check list below is the same list
the sealed run's own `receipts/axioms.log` already used (the four `witnessA_*`
helper equation lemmas — `witnessA_coeff`, `witnessA_coeff0`,
`witnessA_coeff1`, `witnessA_coeff3` — are computational stepping-stones, not
independently reported; the three `witnessA_*` corroboration *results*
(`witnessA_not_PIS`, `witnessA_ne_zero`, `witnessA_not_TRS2`) are).

### Source-file digest table (gated original vs copy)

| File | Gated original sha256 | Copy sha256 | Match |
|---|---|---|---|
| `R12C2P.lean` | `abe0f9cbf92470dc79d48e90d40f657fb54fb1d36a20688caaf15e65f0ac471b` | same | YES |
| `R12C2P/P1.lean` | `0ccfe84dac871116c7b49d31be7a8a47bb485dbf9df03958bf4c8e9ad68c55d1` | same | YES |
| `Erdos993C8U1Base.lean` | `a45c61b8acc15e4ba6fbedbcc42274659c9cac864f23c586e34101728647c0da` | same | YES |
| `lean-toolchain` | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` | same | YES |
| `lake-manifest.json` | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` | same | YES |

**Import-line adjustments**: none.

### Build

Invocation: `cd r12-p1-convolution && lake build`.

- Cache manifest sha256 BEFORE: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
- `lean --version` (in-package): `Lean (version 4.32.2, arm64-apple-darwin24.6.0, commit f3b06c705e6c85f5314019d5d3baab0fec5b580c, Release)`
- Exit code: `0`. Transcript tail:
  ```
  ⚠ [8655/8659] Built Erdos993C8U1Base (27s)
  ℹ [8657/8659] Built R12C2P.P1 (4.2s)
  ✔ [8658/8659] Built R12C2P (3.1s)
  Build completed successfully (8659 jobs).
  ```
  (Warnings: pre-existing deprecation/linter notices in `Erdos993C8U1Base.lean`,
  not errors, not this act's content.)
- Cache manifest sha256 AFTER: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` — unchanged.
- Repairs used: 0 of 2.

### Axiom check — `lake env lean AxiomCheck.lean` (exit 0), raw output

```
'conv_coeff' depends on axioms: [propext, Classical.choice, Quot.sound]
'conv_coeff_swap' depends on axioms: [propext, Classical.choice, Quot.sound]
'conv_coeff_swap_ext' depends on axioms: [propext, Classical.choice, Quot.sound]
'shiftBack_coeff' depends on axioms: [propext, Classical.choice, Quot.sound]
'succ_via_shift' depends on axioms: [propext, Classical.choice, Quot.sound]
'conv_coeff_pair' depends on axioms: [propext, Classical.choice, Quot.sound]
'Unimodal.zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'sub_Kset' depends on axioms: [propext, Classical.choice, Quot.sound]
'sub_Kset'' depends on axioms: [propext, Classical.choice, Quot.sound]
'dn_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
'Uw_nonneg' depends on axioms: [propext, Classical.choice, Quot.sound]
'Vw_nonneg' depends on axioms: [propext, Classical.choice, Quot.sound]
'UV_cross' depends on axioms: [propext, Classical.choice, Quot.sound]
'no_down_up' depends on axioms: [propext, Classical.choice, Quot.sound]
'step_chain' depends on axioms: [propext, Classical.choice, Quot.sound]
'step_chain'' depends on axioms: [propext, Classical.choice, Quot.sound]
'unimodal_of_no_down_up' depends on axioms: [propext, Classical.choice, Quot.sound]
'P1_NNSeq' depends on axioms: [propext, Classical.choice, Quot.sound]
'witnessA_not_PIS' depends on axioms: [propext, Classical.choice, Quot.sound]
'witnessA_ne_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'witnessA_not_TRS2' depends on axioms: [propext, Classical.choice, Quot.sound]
```

21/21 exactly `[propext, Classical.choice, Quot.sound]`.

`lake env lean KernelCheck.lean`: exit 0, all 21 `#check`s elaborate.

### sorry grep

`grep -c sorry` across all sources: `0` (no hits at all in this package).

**Verdict: PASS.**

---

## Package 2 — `r12-reduction-identities`

**Sources** (from `cycles/cycle-3/lean/R12C3L-corrected/LeanProject/`, the
top-level directory — NOT `build-leg-A/` or `build-leg-B/`): `R12C3L.lean`,
`R12C3L/CorridorIngredients.lean`, `R12C3L/CorridorReduction.lean`,
`lean-toolchain`, `lakefile.toml` (all from the top-level `LeanProject/`).
The top-level `LeanProject/` has no `lake-manifest.json` of its own (only its
`build-leg-A/` and `build-leg-B/` siblings do); `build-leg-A`'s copy was used
since both legs' manifests are byte-identical to each other and to the cache's.

**Headlines**: `RTree.a_support_eq_a_add_b_sub_Bgen` (T1, the combined
identity) and `RTree.a_support_neg_of_favorable_and_bBound` (T2, the
witnessed-leaf corollary) — both in `namespace RTree` in `CorridorReduction.lean`.

### Source-file digest table

| File | Gated original sha256 | Copy sha256 | Match |
|---|---|---|---|
| `R12C3L.lean` | `1beb031460f1879ac18d45e69ea851c2e65520fb6766cc6b7b4cecfeb3d763a5` | same | YES |
| `R12C3L/CorridorIngredients.lean` | `d846b17d32252c447b09197cf2b051b24be5153220da760935a44b95897ffd8a` | same | YES |
| `R12C3L/CorridorReduction.lean` | `d578bdacfa33466012c5e074a2716b10e9ea8f81caaffb54f1fc1b318aa6da7a` | same | YES |
| `lean-toolchain` | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` | same | YES |
| `lake-manifest.json` (from `build-leg-A/LeanProject/`) | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` | same | YES |

**Import-line adjustments**: none.

### Build

Invocation: `cd r12-reduction-identities && lake build`.

- Cache manifest sha256 BEFORE: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
- `lean --version` (in-package): `4.32.2`, commit `f3b06c70…`, matched.
- Exit code: `0`. Transcript tail:
  ```
  ⚠ [1461/1464] Built R12C3L.CorridorIngredients (2.4s)   (4 pre-existing unusedVariables linter warnings)
  ✔ [1462/1464] Built R12C3L.CorridorReduction (1.1s)
  ✔ [1463/1464] Built R12C3L (1.1s)
  Build completed successfully (1464 jobs).
  ```
- Cache manifest sha256 AFTER: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` — unchanged.
- Repairs used: 0 of 2.

### Axiom check — `lake env lean AxiomCheck.lean` (exit 0), raw output

```
'RTree.a_support_eq_a_add_b_sub_Bgen' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.a_support_neg_of_favorable_and_bBound' depends on axioms: [propext, Classical.choice, Quot.sound]
```

2/2 exactly `[propext, Classical.choice, Quot.sound]`.

`lake env lean KernelCheck.lean`: exit 0, both `#check`s elaborate.

### sorry grep

`grep -c sorry` across all sources: `0`.

**Verdict: PASS.**

---

## Package 3 — `r12-composition`

**Sources**: `cycles/cycle-4/lean/R12C4-T/LeanProject/{R12C4T.lean,
R12C4T/CorridorIngredients.lean, R12C4T/BrFact1.lean,
R12C4T/CorridorReduction.lean, R12C4T/Targets.lean}` (top-level `LeanProject/`,
NOT `build-leg-B/`, NOT `Scratch/` — there is none in this route) PLUS
`cycles/cycle-5/lean/R12C5-CORR-1/LeanProject/R12C5CORR1/AdjCorr.lean`.

**Design decision (two lib targets, single copy of the RTree chain)**: the
gated `AdjCorr.lean` imports `R12C5CORR1.Targets`, i.e. C5's *own* duplicate
copy of the Targets/CorridorReduction/CorridorIngredients chain (verified
byte-identical to C4's copy except for that one import-namespace prefix —
`CorridorIngredients.lean` is *literally* byte-identical, sha256
`d846b17d…`, between C4 and C5; `CorridorReduction.lean` and `Targets.lean`
differ from their C4 counterparts by only the same one-line import-prefix
change). Duplicating that ~2500-line chain a second time under an
`R12C5CORR1/` subtree in this package was judged higher-risk (two modules
both declaring `namespace RTree` with identical theorem names, e.g.
`RTree.alphaCounterexample_iff`, would collide if a downstream file ever
imported both roots) for zero benefit, since the chain is provably identical
content. Instead: `AdjCorr.lean` was placed at `R12C4T/AdjCorr.lean` (i.e.
inside the *existing* `R12C4T` module tree) with **the one import line
changed** to point at the already-present `R12C4T.Targets`, and a new,
minimal, one-line root file `R12C4TAdj.lean` (`import R12C4T.AdjCorr`) was
authored as pure lakefile glue so the file is reachable from a `lean_lib`
target's default root-import closure (Lake's default glob only builds a
target's named root module and its transitive imports; nothing in the
original `R12C4T.lean` imports `AdjCorr`, so a bare copy would sit unbuilt).
`lakefile.toml` declares two `[[lean_lib]]` targets, `R12C4T` and
`R12C4TAdj`, both in `defaultTargets` — this is the "two lib targets" option
the assembly spec named as acceptable. No theorem-bearing file content was
touched beyond the one disclosed import line; `R12C4T.lean` itself (the
original 3-line root) is untouched and byte-identical.

**Headlines**: `RTree.stmtA_leafWitnessed_of_alpha_beta`,
`RTree.adj_TheoremA_of_alpha_beta`, `RTree.adjQ_iff_TheoremA_unconditional`,
`RTree.alphaTarget_iff_stmtA_leafWitnessed_kA_eq_one` — all confirmed present
under `namespace RTree` by grep and by the `KernelCheck.lean` elaboration
below.

### Source-file digest table (gated original vs copy)

| File | Gated original sha256 | Copy sha256 | Match |
|---|---|---|---|
| `R12C4T.lean` | `325eed2495b23c7e1471b600eaff2ea112085abf74c1ea8b2ed6dc8c81cc4519` | same | YES |
| `R12C4T/CorridorIngredients.lean` | `d846b17d32252c447b09197cf2b051b24be5153220da760935a44b95897ffd8a` | same | YES |
| `R12C4T/BrFact1.lean` | `8348650f5a585fb2609ac689b26b64de8eb6b2b8e01a1466cf1b11e0ffbf1a81` | same | YES |
| `R12C4T/CorridorReduction.lean` | `26cdae06d33293f690bd0e15ef32d707639492cce8fb9d99e515eb7183873464` | same | YES |
| `R12C4T/Targets.lean` | `046bc5ca3cefc09c5f7ede5d1f5a714bf3888d5848cf831838915f5151adc6c0` | same | YES |
| `lean-toolchain` | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` | same | YES |
| `lake-manifest.json` | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` | same | YES |
| `R12C4T/AdjCorr.lean` (gated original: `R12C5CORR1/AdjCorr.lean`, sha256 `03ef698d28524a5ab515ae894a4118d0a21ed26adb2e997898ef8cd21bcabc69`) | n/a — see import-line adjustment below | `d7bd07e0d5f0da6d40d9a5230d9d5f8a7f43da7bb3c4ab149f41806118cbc204` | diff = import line only |

### Import-line adjustment (verbatim, only change in the file)

```diff
- import R12C5CORR1.Targets
+ import R12C4T.Targets
```

Confirmed by `diff` against the gated original: this is the **only** line
that differs; every other byte (the `AdjQ` definition, and the statements
and proofs of `adj_KA_ge_one_iff`, `adjQ_iff_TheoremA_unconditional`,
`adj_TheoremA_of_alpha_beta`) is untouched.

**New files (lakefile glue, not copied sources)**: `R12C4TAdj.lean` (one
line: `import R12C4T.AdjCorr`), `lakefile.toml` (two `[[lean_lib]]` targets),
`AxiomCheck.lean`, `KernelCheck.lean`.

### Build

Invocation: `cd r12-composition && lake build`.

- Cache manifest sha256 BEFORE: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
- `lean --version` (in-package): `4.32.2`, commit `f3b06c70…`, matched.
- Exit code: `0`. Transcript tail:
  ```
  ⚠ [1461/1469] Built R12C4T.CorridorIngredients (2.3s)   (4 pre-existing unusedVariables linter warnings)
  ✔ [1462/1469] Built R12C4T.CorridorReduction (1.1s)
  ✔ [1463/1469] Built R12C4T.Targets (1.2s)
  ✔ [1464/1469] Built R12C4T.AdjCorr (1.2s)
  ✔ [1465/1469] Built R12C4T.BrFact1 (1.3s)
  ✔ [1466/1469] Built R12C4TAdj (1.2s)
  ✔ [1468/1469] Built R12C4T (1.2s)
  Build completed successfully (1469 jobs).
  ```
- Cache manifest sha256 AFTER: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` — unchanged.
- Repairs used: 0 of 2 (first cold-build attempt succeeded).

### Axiom check — `lake env lean AxiomCheck.lean` (exit 0), raw output

```
'RTree.a_support_eq_a_add_b_sub_Bgen' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.a_support_neg_of_favorable_and_bBound' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.alphaCounterexample_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.alphaTarget_iff_stmtA_leafWitnessed_kA_eq_one' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.betaCounterexample_iff_not' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.stmtA_leafWitnessed_of_beta_kA_ge_two' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.stmtA_leafWitnessed_of_alpha_beta' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.toPieces_subset_of_subset_fromPieces' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.fromPieces_mono' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.indepPolyOn_fromPieces_eq_prod' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.vertices_sdiff_closedNbhd_root_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.indepPolyOn_Bgen_root_eq_prod' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.indepCountOn_Bgen_root_eq_coeff' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.AdjQ' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.adj_KA_ge_one_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.adjQ_iff_TheoremA_unconditional' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.adj_TheoremA_of_alpha_beta' depends on axioms: [propext, Classical.choice, Quot.sound]
```

17/17 exactly `[propext, Classical.choice, Quot.sound]` — including all four
named headlines.

`lake env lean KernelCheck.lean` (exit 0), raw output:

```
stmtA_leafWitnessed_of_alpha_beta : AlphaTarget →
  BetaTarget → ∀ (t : RTree) (v : List ℕ) (p : ℕ), v ∈ t.leaves → 1 ≤ t.K_A p → t.a v p < 0 → t.a (t.support v) p < 0
adj_TheoremA_of_alpha_beta : AlphaTarget → BetaTarget → TheoremA
adjQ_iff_TheoremA_unconditional : AdjQ ↔ TheoremA_unconditional
alphaTarget_iff_stmtA_leafWitnessed_kA_eq_one : AlphaTarget ↔
  ∀ (t : RTree) (v : List ℕ) (p : ℕ), v ∈ t.leaves → t.K_A p = 1 → t.a v p < 0 → t.a (t.support v) p < 0
```

### sorry grep

```
R12C4T/BrFact1.lean:275:therefore offered as a genuine, complete, sorry-free partial result, not
R12C4T/Targets.lean:34:   sorry-free and machine-checked, independent of whether the two inputs are
```

Both hits are inside doc-comment prose containing the string "sorry-free";
checked in context — neither is a live `sorry` tactic. Live-tactic
`sorry`/`admit`/`native_decide` count: `0`.

**Verdict: PASS.**

---

## Package 4 — `r12-deg2-reduction`

**Sources**: all non-`check`, non-`Scratch` `.lean` files under
`cycles/cycle-6/lean/R12C6-T/LeanProject/`: `R12C6T.lean`,
`R12C6T/CorridorIngredients.lean`, `R12C6T/CorridorReduction.lean`,
`R12C6T/Targets.lean`, `R12C6T/AdjCorr.lean`, `R12C6T/Deg2Reduction.lean`,
plus `lean-toolchain`, `lakefile.toml`, `lake-manifest.json`. (There is no
`check/` subdirectory in this route's `LeanProject/`; the sealed root file
`R12C6T.lean` itself already embeds twelve `#print axioms` lines as part of
its own gated content — preserved byte-identically below, in addition to the
new, separate `AxiomCheck.lean`/`KernelCheck.lean` this assembly authored per
spec.)

**Headlines**: `RTree.alphaCounterexampleDeg2_iff` and the `AmbientTargetDeg2`
reduction theorems `RTree.alphaTargetDeg2_iff` and
`RTree.alphaTargetDeg2_iff_ambientTargetDeg2` (the latter is the direct
`AlphaTargetDeg2 ↔ AmbientTargetDeg2` reduction).

### Source-file digest table

| File | Gated original sha256 | Copy sha256 | Match |
|---|---|---|---|
| `R12C6T.lean` | `78d486de3a0bef21a12b84698aa31dd957a1486a429bdec43aba0796bf5bbf3c` | same | YES |
| `R12C6T/CorridorIngredients.lean` | `d846b17d32252c447b09197cf2b051b24be5153220da760935a44b95897ffd8a` | same | YES |
| `R12C6T/AdjCorr.lean` | `694ab54547006092cba3be850537ee298476f47c8d78fe5f84e3763cd2638c0b` | same | YES |
| `R12C6T/Deg2Reduction.lean` | `6c03350085324a85e7d580abf37149639fe68c125d1c2750a9513e955a644f3f` | same | YES |
| `R12C6T/CorridorReduction.lean` | `46d0605c1c4813fcf81646ec01456f411c1ecf49446cb05607d6bdced2075d2a` | same | YES |
| `R12C6T/Targets.lean` | `2e30f2114d62a7963fdb69836ab8117c4a852014fcf083b49dc6a7a6716f7357` | same | YES |
| `lean-toolchain` | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` | same | YES |
| `lake-manifest.json` | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` | same | YES |

**Import-line adjustments**: none.

### Build

Invocation: `cd r12-deg2-reduction && lake build`.

- Cache manifest sha256 BEFORE: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
- `lean --version` (in-package): `4.32.2`, commit `f3b06c70…`, matched.
- Exit code: `0`. Transcript tail:
  ```
  ⚠ [1461/1466] Built R12C6T.CorridorIngredients (2.3s)   (4 pre-existing unusedVariables linter warnings)
  ✔ [1462/1466] Built R12C6T.CorridorReduction (1.1s)
  ✔ [1463/1466] Built R12C6T.Targets (1.1s)
  ✔ [1464/1466] Built R12C6T.Deg2Reduction (1.3s)
  ℹ [1465/1466] Built R12C6T (1.1s)
  info: R12C6T.lean:7:0: 'RTree.indepCountOn_succ_on' depends on axioms: [propext, Classical.choice, Quot.sound]
  info: R12C6T.lean:8:0: 'RTree.DeltaOn_eq_add_Bgen_on' depends on axioms: [propext, Classical.choice, Quot.sound]
  info: R12C6T.lean:9:0: 'RTree.a_eq_Bgen_add_Bgen_support' depends on axioms: [propext, Classical.choice, Quot.sound]
  info: R12C6T.lean:10:0: 'RTree.a_support_lt_zero_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
  info: R12C6T.lean:11:0: 'RTree.exists_unique_otherNbr' depends on axioms: [propext, Classical.choice, Quot.sound]
  info: R12C6T.lean:12:0: 'RTree.closedNbhd_eq_of_deg2' depends on axioms: [propext, Classical.choice, Quot.sound]
  info: R12C6T.lean:13:0: 'RTree.vertices_sdiff_closedNbhd_support_eq_of_deg2' depends on axioms: [propext, Classical.choice, Quot.sound]
  info: R12C6T.lean:14:0: 'RTree.a_eq_deltaOn_of_deg2' depends on axioms: [propext, Classical.choice, Quot.sound]
  info: R12C6T.lean:15:0: 'RTree.alphaCounterexampleDeg2_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
  info: R12C6T.lean:16:0: 'RTree.alphaCounterexampleDeg2_imp_alphaCounterexample' depends on axioms: [propext, Classical.choice, Quot.sound]
  info: R12C6T.lean:17:0: 'RTree.alphaTargetDeg2_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
  info: R12C6T.lean:18:0: 'RTree.alphaTargetDeg2_iff_ambientTargetDeg2' depends on axioms: [propext, Classical.choice, Quot.sound]
  Build completed successfully (1466 jobs).
  ```
  (This inline output is the gated root file's own embedded `#print axioms`
  commands firing during compilation — already 12/12 exactly
  `[propext, Classical.choice, Quot.sound]` at build time, before the
  dedicated check files below were even run.)
- Cache manifest sha256 AFTER: `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` — unchanged.
- Repairs used: 0 of 2.

### Axiom check — `lake env lean AxiomCheck.lean` (exit 0), raw output

```
'RTree.indepCountOn_succ_on' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.DeltaOn_eq_add_Bgen_on' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.a_eq_Bgen_add_Bgen_support' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.a_support_lt_zero_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.exists_unique_otherNbr' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.closedNbhd_eq_of_deg2' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.vertices_sdiff_closedNbhd_support_eq_of_deg2' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.a_eq_deltaOn_of_deg2' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.alphaCounterexampleDeg2_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.alphaCounterexampleDeg2_imp_alphaCounterexample' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.alphaTargetDeg2_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'RTree.alphaTargetDeg2_iff_ambientTargetDeg2' depends on axioms: [propext, Classical.choice, Quot.sound]
```

12/12 exactly `[propext, Classical.choice, Quot.sound]`.

`lake env lean KernelCheck.lean` (exit 0), raw output:

```
alphaCounterexampleDeg2_iff : ∀ (t : RTree) {v : List ℕ},
  v ∈ t.leaves →
    t.degree (t.support v) = 2 →
      ∀ {p : ℕ}, t.K_A p = 1 → t.a v p < 0 → (t.AlphaCounterexampleDeg2 v p ↔ ¬t.a (t.support v) p < 0)
alphaTargetDeg2_iff : AlphaTargetDeg2 ↔
  ∀ (t : RTree) (v : List ℕ) (p : ℕ),
    v ∈ t.leaves → t.degree (t.support v) = 2 → t.K_A p = 1 → t.a v p < 0 → t.a (t.support v) p < 0
alphaTargetDeg2_iff_ambientTargetDeg2 : AlphaTargetDeg2 ↔ AmbientTargetDeg2
```

### sorry grep

```
R12C6T/Targets.lean:34:   sorry-free and machine-checked, independent of whether the two inputs are
```

Single hit, inside a doc-comment containing "sorry-free"; checked in
context — not a live `sorry` tactic. Live-tactic `sorry`/`admit`/
`native_decide` count: `0`.

**Verdict: PASS.**

---

## Summary

| Package | Build | Axiom check | sorry (live) | Verdict |
|---|---|---|---|---|
| `r12-p1-convolution` | exit 0, 0 repairs | 21/21 clean | 0 | **PASS** |
| `r12-reduction-identities` | exit 0, 0 repairs | 2/2 clean | 0 | **PASS** |
| `r12-composition` | exit 0, 0 repairs | 17/17 clean | 0 | **PASS** |
| `r12-deg2-reduction` | exit 0, 0 repairs | 12/12 clean | 0 | **PASS** |

Cache manifest sha256 `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
verified matching before and after every one of the four builds (eight
checks total). No cache file was modified. No repository content outside
`proofs/lean/r12-p1-convolution/`, `proofs/lean/r12-reduction-identities/`,
`proofs/lean/r12-composition/`, `proofs/lean/r12-deg2-reduction/`, and this
receipts file was touched. No `git add`/`commit` performed. No package
`README.md` was written (left for the controller).

**Only one import-line deviation from byte-identical sources across all four
packages**: `r12-composition/R12C4T/AdjCorr.lean`, line 1,
`import R12C5CORR1.Targets` → `import R12C4T.Targets` (full diff and
rationale in Package 3's section above).
