# Cycle 1 Route Allocation — r28 (the Hall/SDR route to the forest degree lemma)

Controller: Claude Fable 5.1, 2026-09-24. Topology 6 routes / 12 critics / 3 adjudicators / 1 synthesis;
routes Claude Sonnet 5 xhigh, critics Claude Opus 5 medium, adjudicators/synthesis/Stage 7 Claude Opus 5
high (`AUTHORIZATION.md`). The object: the leaf/slot dominance condition (HS) of `SEMANTIC-CONTRACT.md` §2 —
for every finite tree, every `k` and every threshold `t ≥ 1`, the branch slots with `c_v(k) ≥ t` are at most
the leaves with `c_ℓ(k) ≥ t` — with its reduction (LC) to the degree lemma and the forest composition (FC)
(`SOLUTION-CONTRACT.md` §1–2). (DL) itself is formally verified (r27) and is an INPUT, never a target.

| Seat | Route | Object |
|---|---|---|
| `T1` | `C1-T-01 DOMINANCE-LEAF-SUPPORT-INDUCTION-PROOF` | prove (HS) by a leaf/pendant-path induction built on local dominance lemmas (leaf ≥ support; pendant paths) |
| `T2` | `C1-T-02 DOMINANCE-NEAREST-BRANCH-ASSIGNMENT-PROOF` | prove (HS) by an explicit slot→leaf assignment (nearest branch vertex / pendant directions) or a different global mechanism |
| `F1` | `C1-F-01 DOMINANCE-FALSIFICATION-CENSUS` | falsify (HS) beyond order 18 and on adversarial families; characterize tight instances |
| `F2` | `C1-F-02 DOMINANCE-LOCAL-LEMMA-OBSTRUCTIONS` | refute or confirm every local lemma a proof would need; fence the hypothesis (non-trees; relaxations) |
| `U1` | `C1-U-01 LEAN-DEFINITIONS-AND-LAYER-CAKE` | definitions of record; (LC) `dominance_implies_degree_lemma` sorry-free incl. the leaf/branch reformulation |
| `U2` | `C1-U-02 LEAN-FOREST-COMPOSITION-AND-HALL` | (FC) `forest_degree_lemma_of_components` and the Hall/threshold equivalence sorry-free; an (HS) skeleton |

## Standing state entering Cycle 1

Master registry 392 identities (`sources/authority/`; `control/CLAIM-IDENTITY.run-local.json` identical at
Stage 2); public `main` `8f15733`. The (DL) of record is `E993-R27-FOREST-DEGREE-LEMMA` (formally verified,
award r27 C1-LA1, `sources/r27/c1-la1-forest-degree-extension/`, injection route); the G1 definitions of
record are r25 entries 1–3 (`sources/r25/c4-forest-descent-order-bound/`). The mechanism of this run is r27
critic `C-T2-U`'s Finding 6 (`sources/r27/records/C1-CRITIQUE-T2-U.md`; instrument
`sources/r27/c-t2-u-instruments/`): Step A the leaf/branch reformulation (registered
`E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`, second-read SR-JOIN JN-3 with the `2 ≤ n` correction);
Step B the forest step by convolution (`E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION`); Step C the SDR
condition (OPEN — this run's target); Step D the pointwise refutation (order 5, `k = 3`). Related registered
facts: (DL) is never tight at `k ≥ 1` with `i_k > 0` (`E993-R27-FOREST-DEGREE-LEMMA-EQUALITY-CLASSIFICATION`);
`c`-facts of record in `SEMANTIC-CONTRACT.md` §1. The controller's pre-run instrument
(`control/controller-prerun/`) found no failure of the threshold form on 204,813 free trees to order 18 —
a prior, not evidence. A sibling Codex run on the interior aggregate is active and out of scope (fence §3.7).

## Mechanism fingerprints and load-bearing obligations

1. **T1 `DOMINANCE-LEAF-SUPPORT-INDUCTION-PROOF`.** Establish the local dominance facts and build (HS) from
   them. Candidates to prove or refute exactly: (i) for a leaf `ℓ` with support `s`, `c_ℓ(k) ≥ c_s(k)` for
   every `k` (via `c_ℓ(k) = i_{k−1}(T − ℓ − s)` and `c_s(k) = i_{k−1}(T − N[s])` with `T − N[s] ⊆ T − {ℓ, s}`);
   (ii) along a pendant path `v = u_0 – u_1 – … – u_m = ℓ` (all `u_1..u_{m−1}` of degree 2, `v` a branch
   vertex), how `c_{u_i}(k)` compares with `c_v(k)` and with `c_ℓ(k)`; (iii) whether each branch vertex `v`
   can be served by leaves in its own pendant directions, and what happens at branch vertices with fewer than
   `deg(v) − 2` pendant directions (the interior of the branch tree). Then an induction: remove a pendant
   path (or a leaf) and track `c_v(k)` for the remaining vertices exactly (the recurrence
   `c_v^{T}(k) = c_v^{T−ℓ}(k) + [v ∉ N[ℓ]]·c_v^{T−N[ℓ]}(k−1)` or its correct form — derive it). Deliver a
   statement-level proof of (HS) or the exact step where the induction fails, with the smallest tree and `(k, t)`.
2. **T2 `DOMINANCE-NEAREST-BRANCH-ASSIGNMENT-PROOF`.** Attempt (HS-SDR) by an EXPLICIT assignment: partition
   the leaves by the branch vertex at the end of their pendant path; count pendant directions per branch
   vertex (an extremal branch vertex — a leaf of the branch tree — has ≥ `deg(v) − 1` pendant directions,
   an internal one may have 0); serve interior branch vertices by leaves of extremal ones via a threshold
   argument on `c`. Or a different global mechanism (a weight-transfer / flow along the tree; a
   majorization induction on the leaf profile). If the explicit assignment cannot be made to respect
   `c_ℓ ≥ c_v`, give the smallest tree where the natural assignment fails and what Hall's condition says
   there. Also examine whether (HS) holds at every `t` with the threshold family nested — i.e. verify the
   reduction (HS-SDR) ⟺ (HS) explicitly (Hall on a nested-neighbourhood bipartite graph) as a proved lemma.
3. **F1 `DOMINANCE-FALSIFICATION-CENSUS`.** Attack (HS) computationally: every free tree to order ≥ 20 by
   canonical form (the controller's threshold-form instrument reached 18; do not copy it — write your own,
   with an independent canonical form and an independent `c_v(k)` computation, and reconcile counts with
   A000055), adversarial families to large orders (spiders `S(a_1,…,a_m)`, caterpillars, lobsters, brooms and
   double brooms, complete `d`-ary trees, "branch-heavy" trees with many interior branch vertices and few
   leaves per branch vertex, trees maximizing `Σ(deg−2)` for their leaf count), and random trees to order
   ~60 (Prüfer sequences; seeded; exact integers). Report every failure with exact `c` values, or the
   attained horizons. Characterize the TIGHT instances (equality at some `t ≥ 1`): which trees, which `k`,
   which `t`; is the slack ever exactly 0 at `t = min c_v`? Both the threshold and the matching form, on two
   independent instruments, reconciled.
4. **F2 `DOMINANCE-LOCAL-LEMMA-OBSTRUCTIONS`.** For each local lemma a proof might use — leaf ≥ support;
   monotonicity of `c` along pendant paths; "a branch vertex is dominated by a leaf in each of its pendant
   directions"; "nearest-branch assignment respects `c`"; "`c_v(k) ≤ c_w(k)` when `w` is a leaf of the
   branch tree and `v` interior"; the leaf-removal recurrence for `c` — find the smallest counterexample or
   confirm it to a stated horizon. Fence the hypothesis: does (HS) hold on unicyclic graphs, on bipartite
   graphs, on graphs with `|E| ≤ n`? (Define slots/leaves the same way; report failures.) Test relaxations:
   the fractional/weighted form (which is (DL) itself after layer-cake — say so exactly), (HS) restricted to
   `k ≤ 2`, `k ≥ α − 1`, `t ≤ 2`. Deliver the map of which local statements are true — the successor's
   inheritance either way.
5. **U1 `LEAN-DEFINITIONS-AND-LAYER-CAKE`.** In a scratch project pinned at the run's toolchain (manual
   symlink): the definition layer of record (`occ`, `slotsAtLeast`, `leavesAtLeast`, leaf/branch finsets;
   `Erdos993G1.indepCount` and `indepDegreeSum` byte-identical from the r25/r27 sources), the layer-cake
   identities `Σ_{v∈Br}(deg v − 2)·c_v(k) = Σ_{t=1}^{i_k} slotsAtLeast k t` and `Σ_L c_ℓ(k) = Σ_t leavesAtLeast k t`,
   the leaf/branch reformulation for trees (`2k·i_k − D_k = Σ_L c_ℓ − Σ_{Br}(deg−2)c_v`, needing
   `Σ_v (2 − deg v) = 2` on a tree: Mathlib `SimpleGraph.IsTree.card_edgeFinset` and the handshake
   `sum_degrees_eq_twice_card_edges`), and the composed `dominance_implies_degree_lemma` — sorry-free as far
   as it goes; a draft `THEOREM-CONTRACT.yaml` for the Tier 1′ target; the exact Lean text of every
   definition. Report every `sorry` by name.
6. **U2 `LEAN-FOREST-COMPOSITION-AND-HALL`.** (a) `forest_degree_lemma_of_components`: the separated-union
   convolution for `indepCount` and `indepDegreeSum` in Lean (two-piece form; then components via
   `ConnectedComponent.supp`, or an induction on the number of components), sorry-free as far as it goes;
   (b) `sdr_iff_threshold`: Hall's theorem (Mathlib `Finset.all_card_le_biUnion_card_iff_exists_injective`)
   specialized to the nested-neighbourhood bipartite graph `H_k(T)` — the equivalence of (HS-SDR) and the
   threshold form; (c) a skeleton for `tree_leaf_slot_dominance` with the induction structure of whichever
   mechanism you judge most formalizable, its open nodes as named `sorry`s. Report the `sorry` list and the
   Mathlib API the proof needs (with pinned file:line).

## Shared rules (binding on every route)

- Statement-level derivations; every hypothesis (`IsTree`, finiteness, `n ≥ 2`, `k ≥ 1`) named where it enters;
  every `ℕ`-subtraction (`deg v − 2`) guarded or cast.
- (PW) is REFUTED: no route compares a branch vertex with an arbitrary leaf pointwise.
- Every numeric claim: own instrument, standard library, exact integers, digest, copy-out-first replay under
  `scratchpad/c1-<seat>-replay/`; trees pass an acyclicity-and-connectivity test; counts up to isomorphism by
  a canonical form named as such.
- (DL) is never re-proved as a target; it may be cited by key as an input.
- `headline_resolved: no` this cycle (the headline is (HS) FORMALLY VERIFIED or REFUTED with a second read,
  which no route produces alone); one typed route verdict.
