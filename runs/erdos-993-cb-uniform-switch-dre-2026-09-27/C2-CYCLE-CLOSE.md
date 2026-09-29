# Cycle 2 Close — r31 (CB(8,m), m ≥ 107, m ≡ 2 (mod 3), rank p* = (16m+4)/3)

Controller: Claude Opus 5.5, 2026-09-28 05:26 EDT (by the clock). Canonical run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`.
Topology 9/18/3/1 + governed Stage 7 + isolated second reads (routes Sonnet 5 high; critics Opus 5.5 medium; adjudicators, synthesis,
Stage 7 and second reads Opus 5.5 high; per-seat effort not settable — chartered efforts recorded).

## Seals

| Stage | Seal |
|---|---|
| Stage 2 | `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4` |
| Stage 3 dispatch / packet | `b7799ab0…` / `1cffc789…` |
| Stage 4 dispatch / packet | `af5d1351…` / `297f51b2…` |
| Stage 5 | `f8a1a827…` |
| Stage 6 dispatch / packet | `042af41d…` / `9896ce581444474fa84b5aa0b3f39f7107ca2468572a1847b09cea454eda6a93` |
| Stage 7 capsules | LA1 `f2de53fe…`, LA2 `34db3011…`, LA3 `414eb681…` |
| Second-read capsules | SR-C2-1 `91dd791c…`, SR-C2-2 `792851ee…`, SR-C2-3 `2b9ce6f6…`, SR-C2-4 `36277743…`, SR-C2-5 `e45c5811…`, SR-C2-6 `949cb5c6…` |
| Second-reads packet | `4fc0e8d36f4405f0667f1184aa7285516dd5d27fb69d0edd1db291ef0247994a` |

## Outcome

- **Flags (synthesis):** `headline_resolved: no`, `material_progress: yes`, `plateau: no`, `continue: yes`. Stop gate armed; not a
  plateau cycle (two gate objects advanced in the portfolio; three formal awards closed).
- **Routes and reviews:** nine routes; eighteen critiques (1 retained, 16 retained_narrowed, 1 rejected — T2, which proved favorability
  one rank low and relied on a false tool); three adjudications; the synthesis. The decisive advances came from critics
  (formal eligibility, Darroch/Newton-free favorability of every leaf, four independent private-leaf proofs).
- **Three formal awards, all `formally_verified`** (`cycles/cycle-2/stage7/LEAN-GATE-CLOSEOUT.md`): C2-LA1 (E) on the literal tree;
  C2-LA2 closed-form favorability for both leaf classes; C2-LA3 `favorableLeaves (cbGraph m) p* = leafSet (cbGraph m)`.
- **Six isolated second reads, all concordant** (no statement rejected).

## Registrations (run-local registry: 497 claims, no new key; ledger 22 → 31 rows; lint 0 findings, 1 accepted warning R31-N-17)

| Key | Change | Via |
|---|---|---|
| `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE` | `computer_assisted` → **`formally_verified`** (exact scope; block-sign companion clause fenced out) | C2-LA1; SR-C2-4; SR-C2-5 |
| `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL` (**Tier 1**) | `computer_assisted` → **`proved_informal`**, Darroch/Newton-free; NOT decisive | SR-C2-5 |
| r30 favorability key | scope notes: Darroch/Newton-free proof on the r31 class (SR-C2-1); formal closed-form clause (C2-LA2); formal graph clause (C2-LA3); superseding note (SR-C2-5) | as stated |
| homogeneous criterion key | scope note: explicit arc values at `(8, m, p*)`, (ii-1)/(ii-2) proofs; condition (i) `proved_informal` with an ungraded companion | SR-C2-2 |
| composition key | scope note: the sector-arc table and in-sector tightness | SR-C2-3 |
| eligibility key | scope note: certificate facts (shift 33; pool floor; eligibility fails at residue-2 `m ≤ 83`) | SR-C2-4 |
| R-1 allocation key | scope note: the switch-image margin bound (`computer_assisted`, implied by the key's own bound) | SR-C2-6 |
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | superseding note (the class's Tier 1 grade) | SR-C2-5 |

Plus ledger rows R31-C2-LA1..LA3, the refuted mechanism (G′), bounded records of the reads, and a distinction row. Full log:
`control/C2-CLOSE-REGISTRATION-LOG.txt`; snapshots under `control/snapshots/`.

## Where Tier 1 stands

Tier 1 on the class is **`proved_informal`, Darroch/Newton-free — not decisive**. Formal: (E) on the literal tree (C2-LA1); every leaf
favorable on the literal tree (C2-LA3); (L-S)_top at template level (C1-LA1); the CB layer and the terminal's reduction to conjuncts 2
and 4 (C1-LA2). **Conjunct 4 — the saturating flow on `cbGraph m` at `p*` — is the only formal obligation left.** Its informal inputs:
the composition key, the explicit criterion flow (SR-C2-2), the sector-arc table (SR-C2-3). (HALL) at full scope, TREE, FOREST, TRANSFER,
governed beta and Erdős #993 stay OPEN.

## Errata, rulings, lessons this cycle

R31-E-d (the allocation swapped `G`'s factors; relayed mid-route), R31-E-e (reviewer-brief carry text), R31-E-f (a second-read brief
header), R31-N-11/12 (the favorability index lapse; `Δ_p` undefined in the contract — clarified by the Cycle 3 gate, ruling 16),
R31-N-13..17 (formal eligibility; the carry rulings; the lint warning). Controller-side inconsistency: the Cycle 2 allocation's T texts
named 110/113 as test rows where the gate named 116/119 (every critic and adjudicator ran 116/119).

## Continuation

Cycle 3 runs (ceiling 6), weighted to conjunct 4 (`control/C3-ALLOCATION.md`; gate `control/C3-STAGE1-GATE.md`). The Claude Fable 5.1
(high) checkpoint analysis follows the Cycle 3 close.
