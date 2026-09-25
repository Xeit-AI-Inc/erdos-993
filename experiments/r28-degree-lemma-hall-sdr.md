# r28 — The Hall/SDR Route to the Degree Lemma: a Refutation

Chartered by Ashton on 2026-09-24 as the successor the r27 close recommended. An r27 critic had reformulated the
forest degree lemma for trees as a comparison between two profiles — the branch-vertex "slots" (`deg − 2` per branch
vertex) and the leaves, weighted by how many independent `k`-sets each vertex lies in (`c_v(k)`) — and proposed a
stronger, structural sufficient condition: for every threshold `t`, the slots with `c_v(k) ≥ t` are at most the leaves
with `c_ℓ(k) ≥ t`; by Hall's theorem, exactly the existence of an injection from slots to leaves respecting
`c_ℓ ≥ c_v`. It held on every tree to order 18. A proof would have been a second, matching-type proof of the degree
lemma, closer to the program's matching/cover technology than r27's injection.

Internal run `erdos-993-degree-lemma-hall-sdr-dre-2026-09-24`: 6 routes / 12 cross-orientation critics / 3 isolated
adjudicators / 1 neutral synthesis / governed Lean awards / three isolated second reads (routes Claude Sonnet 5
xhigh; critics Claude Opus 5 medium; adjudicators, synthesis, formalizers, reviewers and readers Claude Opus 5 high),
up to six cycles with early stop. **The counterexample stop rule fired in Cycle 1**; the run closed after one cycle.
Terminal manifest `54e71f419a69d815989bc8b26f4dadd5cf7fd4f536470d3b1ba0b3984e3607e2`; controller review
[`CONTROLLER-REVIEW-R28.md`](../runs/erdos-993-degree-lemma-hall-sdr-dre-2026-09-24/CONTROLLER-REVIEW-R28.md).

## Outcome

**The condition is false.** Take a root joined to three hubs and give each hub two pendant paths of three edges — 22
vertices, branch tree `K_{1,3}`. Among its 19 independent 12-sets the root lies in 18 and every leaf in 17, so the
root's single slot has no leaf at threshold 18. Two critics found this tree independently; all three adjudicators
and the controller reproduced it; the isolated second read confirmed it by brute force over all 2²² vertex subsets, a
rerooting DP and a deletion recursion, proved the infinite family (`d ≥ 3` hubs, legs of `2r + 1` edges; the root beats
every leaf by `r`, the shortfall `d − 2` grows without bound), and enumerated every tree of order ≤ 22: none fails
below 22 and this is the only failure at 22. The degree lemma holds on the tree, as it must; it is untouched.

**What survives.** Six critics independently proved that a leaf dominates every vertex on its own pendant path
(`c_{u_i}(k) ≤ c_ℓ(k)`, on any finite graph) — the lemma every route had left open. With the exact surplus identity
`|own(v)| − (deg v − 2) = 2 − b(v)` it gives Theorem BTP: the condition **does** hold on every tree whose branch tree is a
path (all caterpillars, spiders and brooms), by serving each branch vertex from its own pendant leaves — and the
counterexample shows this class is sharp for every branch-degree bound. Composed with the layer-cake reduction
`(HS) ⇒ (DL)` (kernel-checked, graph-general), that is a second, matching-type proof of the degree lemma on that
class only. Also registered: the SDR ⟺ threshold equivalence, five refuted local mechanisms with minimal witnesses,
and the census. 4 governed Lean package(s) closed `formally_verified`: `r28-c1-la2-layer-cake-reduction` (`Erdos993G1.dominance_implies_degree_lemma` — E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA (with the r27 reformulation formal upgrade)); `r28-c1-la3-forest-composition-and-hall` (`Erdos993G1.forest_degree_lemma_of_tree_degree_lemma` — E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES (with E993-R28-SDR-THRESHOLD-EQUIVALENCE)); `r28-c1-la4-pendant-path-leaf-dominance` (`Erdos993G1.pendant_path_leaf_dominance` — E993-R28-PENDANT-PATH-LEAF-DOMINANCE); `r28-c1-la5-btp-second-proof-on-class` (`Erdos993G1.forest_degree_lemma_on_pathlike_branch_trees` — E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2 (Theorem BTP composed into a second proof of (DL) on the class; a scope note on E993-R27-FOREST-DEGREE-LEMMA)).

**What is NOT closed.** Nothing here is a no-recovery statement. The forest-wide no-recovery claim, NR1, FOREST,
TREE, TRANSFER and Erdős #993 are untouched. Whether any matching-type strengthening of the degree lemma holds on
all trees is open; every candidate the cycle produced fails on the same order-22 tree, where the root's occupancy is
the strict maximum over all vertices.

## Process

Every stage sealed by canonical-JSON SHA-256 manifests; per-seat sealed capsules; the second reads run concurrently
with adjudication and Stage 7; a residue check of cloned control files before the first seal (an r27 lesson);
integrity sweep at the close. One incident (R28-I-1: a stray `lake env lean` outside the pinned project let `elan`
install a toolchain; no build depends on it) and errata R28-E-a…f are on the record. Master registry 405 identities
after publication. Verification record:
[`evidence/verification-2026-09-25-r28.md`](../evidence/verification-2026-09-25-r28.md).
