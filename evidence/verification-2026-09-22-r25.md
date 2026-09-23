# Verification record: r25 terminal release, 2026-09-22

The completed source experiment is `erdos-993-uniform-residual-no-recovery-dre-2026-09-20`
(six cycles; terminal manifest `6bc912aecd177802c0c07b1990158afd27dc65131ed4dc8fb234ec1f8effdb44`). Every stage of every cycle was sealed by a
canonical-JSON SHA-256 manifest; the controller's integrity sweep at the close recomputed
all 36 Cycle 6 manifests and all six terminal manifests with zero seal mismatches (living
files drift by design). Twelve governed Lean contracts closed through independent informal
proof-integrity audit, canonical formal registration, pinned kernel/axiom verification,
independent statement-fidelity attestation and workflow close. Only the exact contract
statements receive the formal grade.

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

All packages pin Lean `v4.32.2` and Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`.
Their only reported transitive axioms are `propext`, `Classical.choice`, `Quot.sound`. No
admitted declaration, native decision axiom or additional assumption is introduced. Every
Main file and every project configuration file is byte-identical to the sealed internal
copy (the card-5 package retains the frozen G1 source's trailing space at one line and the
`.gitattributes` rule accommodates it; no file was normalized). Two Cycle 6 awards closed in
governed bounded-repair children (repair 1 of 2 each) after their first fidelity review or
close found a textual or registrational defect — an unrestored transcription byte with false
prose about it, and bare registration names — with the mathematics unchanged; the published
packages are the children. Each package's `receipts/RECEIPT-SUMMARY.json` carries the
contract, source, kernel, audit, fidelity and report digests; full receipts stay in the
sealed internal run. This record is the release's digest inventory, not a new theorem award,
and no public rebuild was run at release (the internal kernel receipts bind the shipped
sources byte-exactly).

The master merge preserves all 288 prior claim objects (one status change on Ashton's explicit ruling:
`E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` OPEN → VERIFIED at `proved_informal`, the r25
band closure being its statement of record) and imports 72 r25 identities at their accepted statuses and grades. Canonical lint
passes with zero findings and zero warnings against the run's obligations ledger. The
totals are 205 VERIFIED, 88 REFUTED, 26 CONDITIONAL and 41 OPEN — registry statuses at
their explicit evidence grades, not a count of theorems; thirteen r25 identities carry the
internal `formally_verified` grade.

No result here proves Tier 1, Tier 2, any Tier 3 schema, unrestricted G1, TREE, FOREST,
TRANSFER or Erdős #993. The published records retain their original internal paths; the
private operational lineage (returns, critiques, adjudications, scratch) is not part of the
release, and a vendored third-party paper used as a fixture source is excluded.
