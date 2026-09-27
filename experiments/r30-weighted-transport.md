# r30 — The Weighted Transport Mechanism for the Lower-Region Aggregate

Chartered by Ashton on 2026-09-26 from a Codex (GPT-6) prompt. The lower-region favorable-leaf aggregate — `S(T,p) ≤ 0` for every
finite tree at every eligible rank `x + 2 ≤ p`, `3p < 2α + 1` — is the last open region of the Erdős #993 favorable-leaf programme. The
Codex lower-region run had proposed a mechanism: a transport network whose sources are the independent `(p+1)`-sets, whose targets are
the independent `p`-sets, whose arcs are a single deletion or a two-for-one switch (insert a vertex with exactly two neighbours in the
set and remove both), and whose weights count the ACTIVE tags — a leaf `v` in the set counts only if another neighbour of its support
is also in the set. A saturating flow is a weighted Hall condition (HALL), and (HALL) implies the aggregate's sign. Two earlier
attempts had used the wrong weight; r30's first task was fidelity.

Internal run `erdos-993-weighted-transport-dre-2026-09-26`: 6 routes / 12 cross-orientation critics / 3 isolated adjudicators / 1 neutral
synthesis / governed Lean awards / isolated second reads before every registration (routes Claude Sonnet 5 xhigh; critics Claude
Opus 5.5 medium; adjudicators, synthesis, formalizers, reviewers and readers Claude Opus 5.5 high; controller Claude Fable 5.1), six
cycles — the ceiling, reached. neither decisive event occurred — (HALL) is neither formally verified at full scope nor refuted by a confirmed cut; no plateau (new proved_informal lemmas and new adversarial findings in the last cycle); the run ended at the charter's six-cycle ceiling with a successor run recommended Terminal manifest `7156daeb97eeb9b81c6b28838bb52cbace3f420093f8ce9127300f51ddeea844`; controller review
[`CONTROLLER-REVIEW-R30.md`](../runs/erdos-993-weighted-transport-dre-2026-09-26/CONTROLLER-REVIEW-R30.md).

## Outcome

7 governed Lean packages closed `formally_verified`: `r30-c1-la1-active-tag-weight-identity` (`E993Transport.activeWeightAggregateIdentity` — E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY (new; VERIFIED formally_verified)); `r30-c1-la2-weighted-hall-implies-nonpositive-aggregate` (`E993Transport.aggregate_nonpos_of_weightedHall` — E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (new; VERIFIED formally_verified)); `r30-c2-la1-invariant-positive-deficient-family` (`E993Transport.exists_aut_invariant_deficient_of_not_weightedHall` — E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY (new; VERIFIED formally_verified)); `r30-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall` (`E993Transport.weightedHall_iff_autOrbitQuotientHall` — E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR (new; VERIFIED formally_verified)); `r30-c4-la1-gk-deletion-saturating-flow-every-rank` (`E993Transport.gk_deletionSaturatingFlow_of_rank_ge` — E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET (new; VERIFIED formally_verified)); `r30-c5-la1-gk-weighted-hall-every-eligible-rank` (`E993Transport.gk_lowerRegionWeightedHall_everyEligibleRank` — E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK (new; VERIFIED formally_verified)); `r30-c6-la2-spider-tree-weighted-hall-rank-k-plus-3` (`E993Transport.spiderOneTwoThrees_treeWeightedHall_kPlus3` — E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-TREE-WEIGHTED-HALL-AT-RANK-K-PLUS-3-FOR-K-AT-LEAST-5 (new; VERIFIED formally_verified)).

**The weight identity is a theorem.** On every finite simple graph, total supply minus total capacity of the network equals the
favorable-leaf aggregate `S(G,p)` with the original strict selector. Everything downstream is fidelity-exact because of it.

**(HALL) implies the sign, and reduces to orbits.** A saturating flow gives `S ≤ 0` (Lean). If weighted Hall fails, an automorphism-
invariant all-positive deficient family exists, and weighted Hall is equivalent to Hall on the automorphism-orbit quotient at the fixed
selector (Lean) — the reduction every certificate below uses.

**(HALL) holds on two infinite tree families.** On `G_k` (a root with one pendant leaf, a cherry and `k` pendant paths of length
three), a deletion-only saturating flow exists at every rank `p ≥ k+3` for every tag set (Lean), and — because the independence counts
of `G_k` are nondecreasing through rank `k+1` — at EVERY eligible rank (Lean). On the spider `S(1,2,3^k)` the same holds for every
`p ≥ k+2`, hence at every eligible rank for `k ≥ 5` (`proved_informal`; the chain-partition construction is written out, not cited).

**(HALL) holds at every known switch-necessary instance.** The switch arcs are genuinely needed: on the choke-broom trees `CB(d,m)`
(a path `r–s–v`, `m` chokes on `r`, `d` supports per choke, one private leaf per support) the root-plus-arm sector is short of deletion
capacity at its first eligible rank for 223 trees with `d ≤ 13` — and only there. Exact choke-local sector certificates composed with a
registered non-sector deletion flow close the five smallest CB trees at every eligible rank, the heterogeneous `G(8^82,7^2)` (1427
vertices) at all 56 eligible ranks, and — Cycle 6 — ten further CB trees at their first eligible ranks (`CB(8,m)` for `m = 95, 98, 101, 104, 107` and `CB(7,m)` for `m = 109, 112, 115, 118, 121`, one rank each; 208 of the 223 known switch-necessary rows remain uncertified). All are finite certificates, `computer_assisted`.

**What is refuted.** The conjecture "on trees `S ≤ 0` implies saturation" fails at non-eligible rows (`CB(7,1)/6`, `CB(11,2)/16`). The
per-tag (symmetric chain) method is strictly weaker than (HALL): it fails at the eligible `T_22/34` where (HALL) holds. A per-choke
threshold reduction and a compression lemma over sector families are false. The Cycle 6 refutations (the compression lemma; the maximizer characterization at `m = 1`; the forest real-rootedness assumption behind a struck uniform proof) narrow the mechanism's remaining unknowns without touching the mechanism key.

**What stays open.** (HALL) at full scope, and with it the aggregate on the lower region. No deficient cut is known at any eligible
row: every free tree of order at most 23 saturates with deletion arcs alone, and the switch-necessary CB rows have sector surplus at
least 4401 times their deficit. The frontier is exact: a closed-form sector certificate at the top sector-deficient rank of `CB(8,m)`,
where the registered E1 criterion holds for `m ≢ 1 (mod 3)`; the certificate margins of record fit `θ*_8(m) = 288/(200m² + 82m + 5)` (a
conjecture, one out-of-sample confirmation), so any uniform certificate must carry a `1/m²` margin. (HALL) stays OPEN at full scope: the smallest uniform object is `(L-S)_top`, a closed-form choke-local sector certificate at the top sector-deficient rank of `CB(8,m)`, `m ≡ 2 (mod 3)`, whose margin decays like `1/m²`; no deficient cut exists at any eligible row on record.

## Records

Run records under [`runs/erdos-993-weighted-transport-dre-2026-09-26/`](../runs/erdos-993-weighted-transport-dre-2026-09-26/): the
charter prompt, both contracts, the six allocations and gates, the six syntheses, the six cycle closes, the adjudications, the Lean gate
closeouts, the second reads, the controller notes and review, the terminal manifest and the integrity sweep. Lean packages under
`proofs/lean/r30-*`. Verification record: [`evidence/verification-2026-09-27-r30.md`](../evidence/verification-2026-09-27-r30.md). The master
registry has 491 identities after this close (CONDITIONAL 26, OPEN 58, REFUTED 98, VERIFIED 309); mixed evidence grades, not a theorem count.
