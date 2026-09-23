# r25 Uniform Residual No-Recovery: Six-Cycle DRE, Terminal Close

The mathematics agent's lane after [G1](g1-large-residual-dre-2026-09-13.md): extend the
G1 matching/vertex-cover method toward a uniform-in-`d` residual no-recovery argument. For a
finite forest `F` with independence numbers `i_k(F)`, differences `Δ_k = i_{k+1} − i_k`
(integer zero extension) and first strict descent `x(F)`, the targets were

- **Tier 1** `E993-R25-UNR-FOREST-WIDE`: `|V(F)| ≥ 2r+2` and `x(F) < r` imply `Δ_r(F) ≤ 0`;
- **Tier 2** `E993-G1WIDE-NO-SIZE-CAP`: the ordinary G1 residual sign uniformly in `|U|`;
- **Tier 3** uniform matching-branch and cover-branch theorems with thresholds
  `m(d) = ⌈3d/2⌉−1`, `c(d) = min(d,5)` (`d = |V| − 2r` the excess) and the window reduction;
- the **diagnostic band** `d = 5`.

Internal run `erdos-993-uniform-residual-no-recovery-dre-2026-09-20`: six cycles under
Claude Fable 5.1 as controller at 12 routes / 24 cross-orientation critics / 3 isolated
adjudicators / 1 neutral synthesis per cycle (route seats Claude Sonnet 5 from Cycle 4 on by
Ashton's ruling; critics, adjudicators, synthesis, reviewers Claude Opus 5), governed Lean
gates after every cycle, every stage sealed by canonical-JSON SHA-256 manifests, terminal
manifest `6bc912aecd177802c0c07b1990158afd27dc65131ed4dc8fb234ec1f8effdb44`, closed 2026-09-22 with the chartered controller review
([`CONTROLLER-REVIEW-C6.md`](../runs/r25-uniform-residual-no-recovery-dre-2026-09-20/CONTROLLER-REVIEW-C6.md)).

## Outcome

**Every headline face is unchanged.** Tier 1, Tier 2, every Tier 3 schema, FOREST, TREE,
TRANSFER and Erdős #993 end OPEN. No recovering forest exists anywhere in six cycles of
evidence — every census, every family, every rank, every instrument. The admitted terminal
synthesis's ruling on the charter's four outcomes, adopted by the controller: **another
fixed-band result, together with refutations that fence the method; not a uniform advance in
the charter's sense; not a proved structural reduction of the remaining class.** Closing G1
alone does not solve Erdős #993.

**The fixed-band result.** The diagnostic band `d = 5` — for every finite forest `F` and
`r ≥ 1`, `|V(F)| = 2r+5` and `x(F) < r` imply `Δ_r(F) ≤ 0` — is closed informally for every
`r` (`proved_informal`, graded at its weakest link) on eight inputs, three of them formally
verified (the matching half; the cover-fiber/Hall carry step; the five `τ ≤ 5` small-rank
cells at their top rank). A count of formal inputs is not a grade.

**The refutations** (never reopen): the cover diagonal `c(d) = d` at every `d ≥ 6` with nine
explicit witnesses; Corollary F's extension to `d = 12` (so `d ≤ 11` is a proved SHARP
ceiling); single-hub extremality at three exhaustive cells; the false `D_unimodal_peak`
contract, caught before any formalizer saw it.

**Where the method stops.** The one uniform-in-`d` theorem is at the bottom rank `r = d`
alone. The matching band `d < r < K(d)` is bounded computation to `d ≤ 400` with Region I
proved, the `d = 3` top-cell theorem a grade change (not a closure of the live cell `(3,4)`),
and 1,146,505 open steps whose margin binds at the band top and decays like `0.3/d`. The
cover branch's threshold caps at `c(d) = min(d,5)` while the window widens with `d`.

## Formally verified (twelve governed awards; internal grade `formally_verified`, published `verified`)

| Cycle | Award | Terminal declaration | Main source SHA-256 | Fidelity receipt |
|---|---|---|---|---|
| C1 | `C1-LA1` | `Erdos993G1.FourthWideMatching.sevenMatching_delta_nonpos` | `c1061ca67ff78acd477769e56e94a054646e7d7f18b207cf5c0a0b8e6c56b5dc` | `00b1804fe0f0a1a2…` |
| C1 | `C1-LA2` | `Erdos993G1.C1LA2.perfectMatching_delta_nonpos` | `15c8f7f19e9754f71cf96d7b92935e78b8768db54646798d9552dd1eec81ffd0` | `0b1628660ff47987…` |
| C3 | `C3-LA1` | `Erdos993G1.U3.catalanGap_monotone_ratio_award` | `f1243faf4e0d92753a5c90ed056a5885ed44a9c5f10568eac31f9423baff9031` | `22ac149c6fb07f9c…` |
| C4 | `C4-LA1` | `Erdos993G1.UniformMatching.bottomRank_delta_nonpos` | `827a0c45190bde25bef16cd5362a6963a3995836c68eb940d78548fa18917cb6` | `50f23e5dd6a899a1…` |
| C4 | `C4-LA2` | `Erdos993G1.ForestOrderBound.forest_descent_order_bound` | `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0` | `742a0f3593812fda…` |
| C5 | `C5-LA1` | `ErdosR25.E1ArithmeticCore.matchingDual_scalarCore_award` | `55d57358e046e0159a8e890bc1725b11fd4aba12e405453ad2eda41cc6c974e3` | `69d25554ecdb5245…` |
| C6 | `C6-LA1` | `Erdos993G1.ForestDelta2.forest_delta_two_pos_ge_nine` | `de002193e6322583122fd3855a64df53a2599187cb91dd1c18971128bc76faf0` | `690c9041adefce6c…` |
| C6 | `C6-LA2` | `ErdosR25BandCarryStep.bandCarryStepHall` | `8770a6c5d0198fbe743246cff3e2cf2d0eab0eb292e391759556c3296911efd0` | `610dfbb77e7ce894…` |
| C6 | `C6-LA3` | `ErdosR25.E1CoeffWise.Nj_nonneg_all_index` | `6e23d5e7aec5959d699a765d6023e4d89e057a11dd4332c127a0efebff08b30a` | `a892b30e75fc1f7f…` |
| C6 | `C6-LA4` | `ErdosR25C6U2.bdStepSign_interiorPeak_award` | `9be947ce127b21982fe553c7a8fef07567dc8331d200bede2ac3759dfbd5c88c` | `9397700fcc16ec8d…` |
| C6 | `C6-LA5` | `Erdos993G1.ThirdWide.card5_cells_and_cover_catalan_award` | `f47ef6b4fcad06580bb97206950c604927753c2c30cd369dbe6a76d4f0409a2d` | `20e9336a6a6f5886…` |
| C6 | `C6-LA6` | `ErdosR25T2.candidateD_argmin` | `eacfd4ce67289a651db7fda05e16ad870ebfdcf0e6e4cbcf719604b849b02245` | `6f22db69242e9630…` |

Every package pins Lean `v4.32.2` and Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`;
axioms exactly `propext`, `Classical.choice`, `Quot.sound`; no `sorry`/`admit`/`native_decide`;
frozen contract, independent informal audit, kernel receipt, independent fidelity attestation
(`match`), canonical close. Scopes are exact and narrow — see each package's README; none is
a uniform-in-`d` no-recovery statement. Four of the six Cycle 6 awards are critic-attributed
in whole or in their load-bearing step, and the run records for the seventh consecutive
cycle that its grade-moving advances were critic- or adjudicator-derived.

- [`r25-c1-fourth-band-seven-edge-matching-sign`](../proofs/lean/r25-c1-fourth-band-seven-edge-matching-sign/README.md) — `Erdos993G1.FourthWideMatching.sevenMatching_delta_nonpos`
- [`r25-c1-perfect-matching-even-excess-sign`](../proofs/lean/r25-c1-perfect-matching-even-excess-sign/README.md) — `Erdos993G1.C1LA2.perfectMatching_delta_nonpos`
- [`r25-c3-catalan-gap-monotone-ratio`](../proofs/lean/r25-c3-catalan-gap-monotone-ratio/README.md) — `Erdos993G1.U3.catalanGap_monotone_ratio_award`
- [`r25-c4-matching-bottom-rank-uniform-sign`](../proofs/lean/r25-c4-matching-bottom-rank-uniform-sign/README.md) — `Erdos993G1.UniformMatching.bottomRank_delta_nonpos`
- [`r25-c4-forest-descent-order-bound-sharp`](../proofs/lean/r25-c4-forest-descent-order-bound-sharp/README.md) — `Erdos993G1.ForestOrderBound.forest_descent_order_bound`
- [`r25-c5-matching-dual-scalar-core`](../proofs/lean/r25-c5-matching-dual-scalar-core/README.md) — `ErdosR25.E1ArithmeticCore.matchingDual_scalarCore_award`
- [`r25-c6-forest-delta2-pos-order-9`](../proofs/lean/r25-c6-forest-delta2-pos-order-9/README.md) — `Erdos993G1.ForestDelta2.forest_delta_two_pos_ge_nine`
- [`r25-c6-band-carry-step-hall`](../proofs/lean/r25-c6-band-carry-step-hall/README.md) — `ErdosR25BandCarryStep.bandCarryStepHall`
- [`r25-c6-matching-all-index-coefficientwise-nonneg`](../proofs/lean/r25-c6-matching-all-index-coefficientwise-nonneg/README.md) — `ErdosR25.E1CoeffWise.Nj_nonneg_all_index`
- [`r25-c6-bd-step-sign-and-interior-peak`](../proofs/lean/r25-c6-bd-step-sign-and-interior-peak/README.md) — `ErdosR25C6U2.bdStepSign_interiorPeak_award`
- [`r25-c6-card5-cells-and-cover-catalan-bound`](../proofs/lean/r25-c6-card5-cells-and-cover-catalan-bound/README.md) — `Erdos993G1.ThirdWide.card5_cells_and_cover_catalan_award`
- [`r25-c6-sharpened-order-bound-argmin`](../proofs/lean/r25-c6-sharpened-order-bound-argmin/README.md) — `ErdosR25T2.candidateD_argmin`

## Informal results of record

With grade and attribution on every registry face (`CLAIM-IDENTITY.json`, 72 identities
registered by r25): `c(d) = min(d,5)` for forests (FALSE for graphs); Corollary F at
`d = 2..11`, sharp; the matching branch at `r ≥ K(d)`; Hunter's spanning-tree inequality
proved in-run; the `K₁`-addition target closed unconditionally at `x ≤ 4`, its `x = 5`
residue exactly forests of order 22–25 with at least three branch vertices; the `k = 5`
order ceiling 25; the `Δ₃` forest threshold at order 12 (sharp at 11); thin trees `τ ≤ 9`
(unconditional) and `τ ≤ 11` (conditional) free of log-concavity failures, `τ = 12` open at
three strata of order 26; the `(7,7,15)` full-census minimum complete; the pendant cap
`Σp ≤ 40` over all 1,082 classes; the Tier 2 residue exactly every `d' ≥ 6` plus the cell
`(3,6)`; two synthesis compositions and two registration candidates stated and NOT
registered pending an isolated second read.

## Records

Cycle syntheses, cycle closes, Lean-gate closeouts, both controller reviews, the charter,
the solution and semantic contracts and the terminal manifest are mirrored under
[`runs/r25-uniform-residual-no-recovery-dre-2026-09-20/`](../runs/r25-uniform-residual-no-recovery-dre-2026-09-20/).
The internal run root (seat returns, critiques, adjudications, scratch, receipts) stays
sealed and private; a vendored third-party paper used as a fixture source inside the run is
excluded from publication. Verification record:
[`evidence/verification-2026-09-22-r25.md`](../evidence/verification-2026-09-22-r25.md).
