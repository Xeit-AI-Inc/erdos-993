# Semantic Contract — r29 (certify the uniform high-tail mechanism and its non-residual top-rank consequence)

Fixes the meaning of every symbol used in this run. Narrows, and does not alter, the first-interior experiment's
semantic contract (`sources/first-interior/records/SEMANTIC-CONTRACT.md`) and the definitions of record carried in the
verified first-interior Lean source (`sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean`, SHA-256
`8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9`, 45 registrar entries). Where prose and that Lean
source disagree, the Lean source governs.

## 1. Carrier and definitions of record

- `V` a finite type (`[Fintype V] [DecidableEq V]`; `[DecidableRel G.Adj]` where a `Finset` computation needs it);
  `G : SimpleGraph V`. A **finite tree** is `G.IsTree` (Mathlib: connected and acyclic; hence `V` nonempty). A **finite
  bipartite graph** is `G.IsBipartite` (Mathlib: a 2-colouring exists; disconnected graphs and isolated vertices are
  included; the empty graph on any `V` is bipartite). `n := Fintype.card V`; `α(G) := G.indepNum` (Mathlib).
- **Counts** (entries 10–12 of the source, namespace `C5LA1`): `indepSetsAvoiding G D k` := the independent `k`-subsets of
  `V` disjoint from the deletion set `D : Finset V`; `indepSetCount G D k` := its cardinality — this is `i_k(G − D)` on
  the ORIGINAL carrier (vertex deletion is realised as avoidance, never by changing the vertex type); it is `0` above
  capacity (integer zero extension is automatic: counts are naturals, differences are integers).
  `forwardDifferenceDel G D k := (indepSetCount G D (k+1) : ℤ) − indepSetCount G D k` — this is `Δ_k(G − D)`.
  The full-graph quantities are `D = ∅`: `i_k(G) = indepSetCount G ∅ k`, `Δ_k(G) = forwardDifferenceDel G ∅ k`.
- **Leaves and supports** (entries 4–9): `C4LA1.IsGraphLeaf G v := ∃! u, G.Adj v u` (an ORIGINAL degree-one vertex;
  isolates are not leaves); `C5LA1.support G v` := the unique neighbour of a leaf (arbitrary off the leaf set);
  `C5LA1.leafSet G` := the leaves; `C5LA1.H G v := {v, support G v}` (the deletion set realising `H_v = G − {v, s_v}`);
  `C5LA1.R G v := insert (support G v) (G.neighborFinset (support G v))` (realising `R_v = G − N_G[s_v]`).
  `W_v := N_G(s_v) ∖ {v}` (prose only; in Lean the tag set is any `W : Finset V`, and for a leaf the relevant choice is
  `R G v` itself viewed inside `univ ∖ H G v` — see `tagged_count_split`).
- **Favorable selector** (entries 1–3, namespace `C4LA1`): `vertexDeletionIndepSetCount G v k` (= `i_k(G − v)`),
  `vertexDeletionForwardDifference G v p` (= `Δ_p(G − v)`), `IsFavorableAt G v p := Δ_p(G − v) < 0` — the STRICT selector
  at the ORIGINAL rank `p`. `F_p(G) := {v ∈ leafSet G : IsFavorableAt G v p}`.
- **Aggregate** (entry 13): `C5LA1.aggregate G p := Σ_{v ∈ F_p(G)} (forwardDifferenceDel G (H G v) (p − 1) −
  forwardDifferenceDel G (R G v) (p − 1))` — `S(G, p)`; every original leaf is a distinct tag (leaves sharing a support
  are separate summands); the empty sum is `0`. The natural-number `p − 1` is `0` at `p = 0` (never used: every statement
  has `p ≥ 1`).
- **First strict descent** (entry 14): `C5LA1.crossingIndex G := Nat.find (fun k => forwardDifferenceDel G ∅ k < 0)`
  — `x(G)`, the least `k` with `Δ_k(G) < 0`; exists because `Δ_α(G) = −i_α(G) < 0`. A plateau (`Δ_k = 0`) is NOT a
  descent. Facts of record: `Δ_k(G) ≥ 0` for every `k < x(G)`; `Δ_{x}(G) < 0`.
- **Tagged family** (entry 18, namespace `E993Interior`): `taggedFamily G U W k` := the `k`-subsets `A ⊆ U` that are
  independent in `G` and meet `W` (`¬ Disjoint A W`). **`q_j(H, W)`** := `(taggedFamily H Finset.univ W j).card` — the
  independent `j`-sets of `H` meeting `W` (registry wording); identity of record (`tagged_count_split`, entry 42's
  namespace): for `D ⊆ E`, `indepSetCount G D k = (taggedFamily G (univ ∖ D) E k).card + indepSetCount G E k`, i.e.
  `q_k = i_k(H) − i_k(H − W)` with `H = G − D`, `W = E ∖ D`.
- **G1 definitions** (entries 15–17, namespace `Erdos993G1`, byte-identical from the r25 award): `indepCount`, `coeff`
  (integer coefficient, zero-extended), `delta`. Used by the guard's counting lemmas (entries 19–40).
- **Existing internal declarations of the mechanism** (compiled, kernel-checked inside the first-interior award, NOT
  separately awarded; each is one registrar fragment whose `private` helpers travel with it):
  - entry 41 `E993Interior.taggedShadowBound (G) (hBip : G.IsBipartite) (U W : Finset V) (a k : ℕ) (hcap : ∀ A ⊆ U,
    G.IsIndepSet A → A.card ≤ a) (hk : 1 ≤ k) : k * (taggedFamily G U W (k+1)).card ≤ 2 * (a − k) * (taggedFamily G U W k).card`
    (ℕ, truncated `a − k`; helpers `Core.indep_union_color`, `card_extension_le`, `tagged_deletions_lower`,
    `tagged_extensions_upper`);
  - entry 42 `E993Interior.highTailAggregateFromShadow (G) (hShadow : …) (p) (hp : 2 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p)
    : C5LA1.aggregate G p ≤ 0` (helpers in `E993Interior.Leaf`: `support_spec/adj/unique`, `H_subset_R`,
    `leaf_insert_indep`, `leaf_indep_cap` (`A ⊆ univ ∖ H G v` independent ⇒ `A.card ≤ α − 1`), `tagged_count_split`,
    `tagged_zero_above_leaf_cap`, `leaf_tagged_monotone`, `leaf_term_nonpos` — the POINTWISE sign at `p ≥ 2`);
  - entry 43 `E993Interior.eligibleAlphaGeSeven (G) (hT : G.IsTree) (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum − 2)
    : 7 ≤ G.indepNum` (helpers in `E993Interior.Guard`: `count_bridge`, `delta_bridge`, `indep_count_zero/one`,
    `order_ge_alpha_succ`, `edge_cover_subset`, `cover_degree_one/two`, `delta_zero_nonneg`, `delta_one_nonneg`,
    `delta_two_nonneg_large/seven/eight`, the `choose` lemmas, `crossing_negative`);
  - entry 44 `E993Interior.bipartiteHighTailAggregate (G) (hBip) (p) (hp : 2 ≤ p) (hTail) : C5LA1.aggregate G p ≤ 0`;
  - entry 45 `theorem E993Interior.firstInteriorAggregate (G) (hT : G.IsTree) (hInterior : crossingIndex G + 2 ≤ indepNum − 2)
    : aggregate G (indepNum − 2) ≤ 0` — the awarded primary (`E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`, VERIFIED).
- **r26's top-rank residual theorem** (`sources/r26/c1-la1-top-rank-residual-sign/`): `R26LA1.topRankResidualSign (G)
  (hTree) (hAlpha : 2 ≤ indepNum) (hEligible : crossingIndex G + 2 ≤ indepNum − 1) (hResidual : every leaf lies in every
  maximum independent set) : aggregate G (indepNum − 1) ≤ 0` — `E993-R26-TOP-RANK-RESIDUAL-SIGN`, VERIFIED. Its
  definition layer (entries 1–14) is byte-identical to the first-interior source's.

## 2. The statements of this run (prose; Lean statements of record in `SOLUTION-CONTRACT.md` §2)

- **(TSB) Tagged-shadow bound — Target 1.** For every finite bipartite simple graph `H`, every `W ⊆ V(H)`, `a = α(H)` and
  every natural `k` with `1 ≤ k ≤ a`: `k·q_{k+1}(H, W) ≤ 2(a − k)·q_k(H, W)` over the integers. Disconnected graphs,
  isolates, `W = ∅` (both sides `0`), `k = a` (`q_{a+1} = 0`) and terminal layers are inside the statement. Mechanism:
  every tagged `(k+1)`-set has at least `k` tag-preserving deletions; every independent `k`-set has at most `2(a − k)`
  addable vertices (its addable set induces a bipartite graph each of whose colour classes can be adjoined, so each has
  at most `a − k` vertices); double count the containment relation.
- **(HTP) Pointwise high-tail sign — Target 2.** For every finite bipartite simple graph `G`, every original degree-one
  vertex `v` with support `s`, and every integer `p ≥ 1` with `3p ≥ 2α(G) + 1`: `Δ_{p−1}(G − {v, s}) − Δ_{p−1}(G − N_G[s]) ≤ 0`.
  Derivation for `p ≥ 2`: with `k = p − 1 ≥ 1`, `H = G − {v, s}`, `W = N_G(s) ∖ {v}`, the term equals `q_p − q_{p−1}`
  (`tagged_count_split`); `α(H) ≤ α(G) − 1` because `v` extends every independent set of `H` (`leaf_indep_cap`); the
  guard gives `2(α(G) − 1 − k) ≤ k`, so (TSB) with `a = α(G) − 1` yields `q_{k+1} ≤ q_k`; for `k > α(G) − 1` both
  counts vanish. **Endpoint `p = 1`** (NOT covered by the internal helper): the guard reads `2α(G) + 1 ≤ 3`, so
  `α(G) ≤ 1`; a leaf exists, so `α(G) = 1`; a bipartite graph with `α = 1` has at most two vertices (two vertices of one
  colour class are non-adjacent), so `V = {v, s}` and `G = K_2`; then `Δ_0(G − D) = (n − |D|) − 1` gives the term
  `|R_v| − |H_v| = deg(s) − 1 = 0`. (On a general bipartite `G` at `p = 1` the term is `deg(s) − 1 ≥ 0` — the endpoint is
  true only because the guard forces `K_2`; this is why `p = 1` is a separate base case.)
- **(HTA) High-tail aggregate corollary — Target 2's corollary.** For every finite bipartite simple graph `G` and every
  `p ≥ 1` with `3p ≥ 2α(G) + 1`: `S(G, p) = C5LA1.aggregate G p ≤ 0`, with the original strict selector `Δ_p(G − v) < 0`
  and one tag per original leaf. No eligibility, residual or connectivity hypothesis (every summand is `≤ 0` by (HTP)).
- **(ELIG) Eligibility guard — Target 3.** For every finite ordinary tree `T` with integer `p = α(T) − 2`:
  `x(T) + 2 ≤ p ⇒ α(T) ≥ 7`. Proof of record (entry 43): the ℕ hypothesis forces `α ≥ 4`; `α = 4` would force `x = 0`,
  but `Δ_0(T) = n − 1 ≥ 0` for `n ≥ 2` (`order_ge_alpha_succ`: `n ≥ α + 1`); `α = 5` forces `x ≤ 1`, but
  `Δ_1(T) = i_2 − i_1 = C(n−1, 2) − n ≥ 0` for `n ≥ 6` (trees: `i_2 = C(n, 2) − (n − 1)`); `α = 6` forces `x ≤ 2`, but
  `Δ_2(T) ≥ 0`: for `n ≥ 9` by the inclusion–exclusion formula `Δ_2 = (n−1)(n−2)(n−9)/6 + Σ_u C(deg u, 2)`, and for
  `n ∈ {7, 8}` by the one-/two-vertex cover complementary to a maximum independent 6-set (degree-binomial sums `≥ 15`,
  `≥ 9`). The Lean hypothesis is in ℕ: `crossingIndex G + 2 ≤ G.indepNum − 2` — false when `α < 2` (right side `0`), and
  equal to the integer statement when `α ≥ 2`; so it is exactly the registry's integer hypothesis.
- **(TRN) Non-residual top-rank corollary — Target 4.** For every finite ordinary tree `T` with `p = α(T) − 1`: if
  `x(T) + 2 ≤ p` then `S(T, p) ≤ 0`. Derivation: eligibility in ℕ forces `α ≥ 3`; `α = 3` forces `x = 0`, impossible since
  `Δ_0(T) = n − 1 ≥ 0` (`n ≥ α + 1 ≥ 4`); so `α ≥ 4`, `p = α − 1 ≥ 3 ≥ 2`, and `3p = 3α − 3 ≥ 2α + 1 ⟺ α ≥ 4` — the
  rank lies inside the high-tail region, and (HTA) (or the internal `bipartiteHighTailAggregate` at `p ≥ 2`) applies
  with `hT.isBipartite`. Compared with r26's `topRankResidualSign`: same conclusion, the hypotheses `2 ≤ α` and the
  residual condition (★) are DROPPED (eligibility alone). A different mechanism (tagged shadow, not the (RI)/(RC)
  budget); r26's award remains the proof of record on the residual class and is not widened.
- **The region and its fence.** For a tree, `3p ≥ 2α + 1` with `p = α − d` reads `α ≥ 3d + 1`: `d = 1` (top rank)
  needs `α ≥ 4`, `d = 2` needs `α ≥ 7` (Target 3's guard is exactly this), `d = 3` needs `α ≥ 10`, … The complementary
  eligible region `3p < 2α + 1` is OUT OF SCOPE (Astra's parallel experiment). Whether the boundary is SHARP (a bipartite
  graph / a tree and a leaf with a POSITIVE term at `3p = 2α`) is a legitimate F-route question about the statement's
  precision — a witness there refutes nothing in this run and is recorded as a boundary record.
- **Fixed points (controller-checked, `control/controller-prerun/ht_check.py`; priors, never evidence).** `K_2`
  (`v`–`s`): `α = 1`; at `p = 1` each leaf's term is `0` (`H_v = R_v = ∅` as vertex sets: `Δ_0` of the empty graph is
  `0 − 1 = −1` on both sides); both leaves are favorable at `p = 1` (`K_2 − v` is a single vertex: `i_1 = 1`, `i_2 = 0`,
  `Δ_1 = −1 < 0`), so `S(K_2, 1) = 0 + 0 = 0`. Pre-run counts (priors): all 5,604 bipartite labelled graphs of orders
  1–6 with every `W` and every `1 ≤ k ≤ a` satisfy (TSB); every leaf/`p ≥ 1` under the guard satisfies (HTP) and (HTA);
  every tree of order ≤ 12 (976 classes; A000055 matched) satisfies (ELIG) and (TRN) on its eligible set (361 trees
  eligible at `p = α − 2`, 846 at `p = α − 1`); positive terms at `3p = 2α` exist from order 5 (`P_3 ⊔ K_2`, `α = 3`,
  `p = 2`, term `+1`) — the guard's precision is F1's question. `P_3` (`v`–`s`–`w`): `α = 2`, guard needs `p ≥ 2`; at `p = 2`,
  `H_v = {w}`, `R_v = ∅`: `Δ_1(H_v) = 0 − 1 = −1`, `Δ_1(R_v) = 0 − 0 = 0`, term `−1 ≤ 0`. Star `K_{1,m}` (`m ≥ 2`):
  `α = m`; for a leaf `v`, `H_v = K_{1,m} − {v, c}` = `m − 1` isolates, `R_v = ∅`: term at `p` is
  `[C(m−1, p) − C(m−1, p−1)] − 0`, nonpositive iff `p ≥ m/2`, so the guard `3p ≥ 2m + 1` is comfortably sufficient and
  the sign first fails at `p = ⌈m/2⌉ − 1` — the star shows the boundary is not tight on stars. Eligibility examples for
  (TRN) and (ELIG) are recorded in `control/controller-prerun/ht_report.json` (`t4_eligible_examples`).

## 3. Conventions

- Every count is a natural number; differences are integers via casts; `p − 1`, `α − 1`, `α − 2`, `a − k` in ℕ are guarded
  by the hypotheses that make them equal to the integer values (`p ≥ 1`; `α ≥ 2`; `k ≤ a`) — every such guard is named
  where it enters, and the fidelity review checks each.
- "Original" always refers to the undeleted graph `G`: leaves, supports, closed neighbourhoods and the favorable
  selector are evaluated in `G`, never in a deleted graph.
- `x`, `Δ_k`, `i_k`, `α` carry the difference index and the graph on every reported row; a plateau is not a descent.
- Attribution on every face: Codex (GPT-6 Luna/Sol/Astra) for the mechanism, the C2 candidate proof, the compiled
  internal lemmas and the proposed statements (first-interior run; `FINAL-ANALYSIS.md`; `control/C2-SCOPE-AUDIT.md`);
  r26 (Claude, Fable-controlled) for the residual top-rank theorem and the `C5LA1` definition layer of record; r24 C4-LA1
  for the `C4LA1` selector definitions; r25 for the G1 definitions; r29 seats and critics for their derivations, the
  `p = 1` endpoint and the top-rank corollary's proof.
