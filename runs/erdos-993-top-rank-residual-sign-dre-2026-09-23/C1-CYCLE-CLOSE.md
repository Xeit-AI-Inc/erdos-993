# Cycle 1 Close — r26 (validate and formalize the r24 top-rank residual sign) — RUN TERMINAL

Controller: Claude Fable 5.1, 2026-09-24. Cycle 1 is the run's only cycle: the decisive event of
`SOLUTION-CONTRACT.md` §5(a) occurred at Stage 7 (`(RC)` formally verified), so the run ends at this close
(`AUTHORIZATION.md`). The controller checkpoint chartered "after the third cycle" is moot; the final
analysis is `control/CONTROLLER-REVIEW-R26.md`.

## Stage record

| Stage | Seal | Content |
|---|---|---|
| 2 | `c97e121561a7b63cef93312f22f60cfa2097b916f264bfb8ebff52cb68ee9de3` | packet: contracts, gate, allocation, brief, 79 frozen source files, registry (363) |
| 3 dispatch | `af8acf7ae6897d7aa37c4bda1810bf0aba3214263e6d458930274c3351d77a48` | 9 route dispatches |
| 3 | `86571d275c1b158757f81106d929450b052d819891899b2d6991e7e93df68a40` | 9 returns admitted 9/9 (Sonnet 5 xhigh) |
| 4 dispatch | `92d35e159340b48952b057de353ab0a487658f07bb8f1292958c604a0e72db53` | 9 critic capsules |
| 4 | `7169114907fdb1f2ab3845ba07183ffa808114d588add7ccc05d15eadf92ab2c` | 18 critiques admitted 18/18, all `retained_narrowed` (Opus 5 medium) |
| 5 | `ec0de29154d709c8ac35e84118d080f98a555eb5799fad8e533ad8823c4dd43e` | 3 adjudications: T `proved`, F `still_open`, U `still_open` (each at its own grade), all `material_progress: yes` (Opus 5 high) |
| 6 dispatch | `d52e8fe4bc72f2507fa20994459c333381b0617a5c118ba3da91dec8c0c16f4e` | synthesis capsule |
| 6 | `dec961b2de6933fdee2e0bc13c7445e8d34224f9d1ce7aec2b3669829532f22c` | synthesis: `headline_resolved: no`, `material_progress: yes`, `plateau: no`, `continue: yes`; §5(c) met; three award groups funded |
| 7 | capsules `da278eb6…`, `75ebcffb…`, `c5fcd348…` | C1-LA1, C1-LA2, C1-LA3 all `formally_verified` (`cycles/cycle-1/stage7/LEAN-GATE-CLOSEOUT.md`) |
| second reads | `ea1c49ad…`, `9b782a7e…`, `bb3b7208…` | SR-B3 confirmed_with_repairs; SR-STRICT 2 confirmed + 2 confirmed_with_repairs; SR-REC 4 confirmed_with_repairs |

## Mathematical state at the close

- **`(RC)` — `E993-R26-TOP-RANK-RESIDUAL-SIGN` — VERIFIED, `formally_verified`** (award C1-LA1,
  `runs/lean-2026-09-24-c1-la1-top-rank-residual-sign`): for every finite tree `G` with `2 ≤ α`,
  `x + 2 ≤ α − 1` and every leaf in every maximum independent set, `S(G, α−1) ≤ 0`; composed with the r24
  identity (RI). r24 terminal debt TD-6 (the eligible top-rank residual class with `D ≠ ∅`, ~98% of the
  class) is closed. The proof: the `(★)`-free gate `α = ℓ + a`; forced neighbour; the exact budget identity;
  four arithmetic shapes pruned to three families; `W_I = ℓ(ℓ−1)M`, `W_II = (ℓ−4)N₂`; the family-(III)
  fibres signed by the deletion injection; `S ≤ −ℓ(ℓ−2)M − (ℓ−4)N₂` with `N₂ ≤ k₂M`; finishes at
  `ℓ ≥ 4`, `ℓ = 3`, `ℓ = 2` (`C₂ = ∅` under eligibility). `hEligible` is consumed only through `α ≥ 3`.
- **`E993-R26-DELETION-INJECTION-FIBRE-BOUND` — VERIFIED, `formally_verified`** (C1-LA2; ARMW 2020 re-proved).
- **`E993-R26-TREE-STRUCTURAL-CORE` — VERIFIED, `formally_verified`** (C1-LA3; 30 declarations; the `P₃` lemma).
- **`E993-R26-FORCED-NEIGHBOUR-FAMILY-I-EMPTY` — VERIFIED**, kernel-verified component of C1-LA1.
- **`E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` — VERIFIED, `proved_informal`** (after SR-STRICT): `S ≤ −2` on the
  eligible class (`ℓ ≥ 4`: `≤ −8`; `ℓ = 3`: `≤ −2M`; `ℓ = 2`: `≤ −4`); `S(P_{2α−1}) = 3α − α²`; among
  residual trees with `α ≥ 2`, `S = 0 ⟺ P₅`, `S > 0 ⟺ P₃`, both ineligible.
- **`E993-R26-C6-B3-FAMILY-I-REALIZATION-CORRECTION` — VERIFIED record** (after SR-B3): the r24 C6
  "realized by 1,420 trees" statement is false as a realization statement (structurally impossible under
  `(★)`); 1,420 is reproduced exactly by predicate P_b; B3's identity is exact; the sign-flipping is family
  (III)'s; provenance gap at the C6 T adjudication's inventory items 5 and 6; origin in r24 critic `C-T1-U`'s
  sentence; neither TD-6 prescription is needed.
- **`E993-R26-TOP-RANK-N2-LE-M` — REFUTED** (order-9 witness; `N₂ ≤ k₂M` is the true bound).
- Records: 16,424 eligible residual trees to order 17 = 290 flat + 16,134 non-flat (TD-6's figure
  reconciled); 16,442 = 16,424 + 18 ineligible residual trees (orders 3,4,5,5,6,6,6,7,7,8×5,9×3,11).
- **Unchanged by construction:** `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` OPEN (scope note added:
  its top-rank residual sub-case is closed); `E993-BETA-AGG` OPEN (transport never attempted); the
  common-leaf condition, TREE, FOREST, TRANSFER, Erdős #993 untouched; every REFUTED claim REFUTED.

## Registry and ledger

Run-local registry 363 → 370 identities (7 added: 3 formal awards, 1 kernel-verified component, 1 informal
theorem, 1 record, 1 REFUTED); every prior status preserved; lint 0 findings / 0 warnings against the
run-local registry (`control/CLAIM-STATUS-LINT-r26-runlocal.json`). Obligations ledger 280 → 287 rows.

## Process record

Errata: R26-E-a (bind command for scratch roots), R26-E-b (`P₇` mislabelled eligible), R26-E-c (the
contract's Tier 1′ row weaker than proved). Incident R26-I-1 (a critic's pattern `pkill`; no lost result).
Disclosures: `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json`, `control/C1-STAGE4-READ-BOUNDARY-DISCLOSURES.json`
(none exposed sealed content). Notes and errata: `control/CONTROLLER-NOTES.json`. Expected seal drifts at
the terminal sweep are named in `control/build_r26_close.py` (living files by design: agents records,
the toolkit, the Stage 4 disclosures record completed after the F adjudication, the registry and ledger at
registration); the sweep report is `control/R26-INTEGRITY-SWEEP.json`.

## What remains before the full aggregate (successor inheritance)

`(RC)` closes the TOP RANK on the RESIDUAL class. The all-rank literal aggregate
`E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` still needs: (i) the top rank on the NON-residual class
(no positive complete eligible aggregate is known there; (RI) fails, so a different identity is
required — the F critics showed (RI) tracks `(★)` exactly); (ii) every interior rank `x(T)+2 ≤ p < α−1`
(never searched below the top rank in r24; the only region with positive mechanism values); (iii) the
ordinary-to-RTree transport for `E993-BETA-AGG`. None of these is advanced by this run.
