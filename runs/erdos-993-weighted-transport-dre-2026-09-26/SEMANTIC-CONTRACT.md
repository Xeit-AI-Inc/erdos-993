# Semantic Contract — r30 (correctly weighted mixed-boundary transport for the remaining ordinary-tree favorable-leaf aggregate)

Fixes the meaning of every symbol used in this run. Narrows, and does not alter, the lower-region experiment's contract
(`sources/lower-region/records/SOLUTION-CONTRACT.md`, `NEUTRAL-HANDOFF.md`) and r29's semantic contract
(`sources/r29/records/SEMANTIC-CONTRACT.md`), and reuses the definitions of record carried in the verified first-interior
Lean source (`sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean`, SHA-256
`8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9`, 45 registrar entries; entries 1–18 are the definition
layer). Where prose and that Lean source disagree, the Lean source governs. The transport network's definitions are NEW in
this run (§1.2); their Lean form is authored in-run in namespace `E993Transport` (`SOLUTION-CONTRACT.md` §2).

## 1. Carrier and definitions of record

### 1.1 Inherited (byte-identical carry; r29 §1 wording)

- `V` a finite type (`[Fintype V] [DecidableEq V]`; `[DecidableRel G.Adj]` where a `Finset` computation needs it);
  `G : SimpleGraph V`. A **finite ordinary tree** is `G.IsTree` (Mathlib: connected and acyclic; `V` nonempty). `n := Fintype.card V`;
  `α(G) := G.indepNum`.
- **Counts** (`C5LA1`, entries 10–12 of the source): `indepSetsAvoiding G D k` := the independent `k`-subsets of `V` disjoint
  from `D`; `indepSetCount G D k` := its cardinality — `i_k(G − D)` on the ORIGINAL carrier; `forwardDifferenceDel G D k :=
  (indepSetCount G D (k+1) : ℤ) − indepSetCount G D k` — `Δ_k(G − D)`. Full-graph quantities have `D = ∅`. Integer zero
  extension is automatic (counts are naturals, differences integers; counts vanish above capacity).
- **Leaves and supports** (`C4LA1.IsGraphLeaf G v := ∃! u, G.Adj v u`, an ORIGINAL degree-one vertex; `C5LA1.support G v`
  its unique neighbour; `C5LA1.leafSet G`; `C5LA1.H G v := {v, support G v}`; `C5LA1.R G v := insert (support G v)
  (G.neighborFinset (support G v))` — the deletion sets realising `H_v = G − {v, s_v}` and `R_v = G − N_G[s_v]`).
  **`W_v := N_G(s_v) ∖ {v}`** (prose); in Lean `(G.neighborFinset (support G v)).erase v` (§1.2).
- **Favorable selector** (`C4LA1.vertexDeletionIndepSetCount/vertexDeletionForwardDifference/IsFavorableAt G v p :=
  Δ_p(G − v) < 0`) — STRICT, at the ORIGINAL rank `p`. `F_p(G) := {v ∈ leafSet G : IsFavorableAt G v p}`. `F` is FIXED at rank
  `p` for the whole comparison (never recomputed at `p + 1` or `p − 1`).
- **Aggregate** (`C5LA1.aggregate G p := Σ_{v ∈ F_p(G)} (forwardDifferenceDel G (H G v) (p − 1) − forwardDifferenceDel G (R G v) (p − 1))`)
  — `S(G, p)`; every original leaf is a distinct tag (leaves sharing a support are separate summands); the empty sum is `0`.
- **First strict descent** (`C5LA1.crossingIndex G := Nat.find (fun k => Δ_k(G) < 0)`) — `x(G)`, including the terminal
  difference `Δ_α = −i_α < 0`; a plateau is not a descent. (The authorized Python evaluator
  `sources/lower-region/inputs/ordinary_tree_checked.py` has a `first_strict_descent` that scans only stored coefficients —
  it omits the terminal zero-extension difference when the polynomial's last coefficient is at rank `α`; compute `x` through
  rank `α` independently, as the predecessor's handoff requires.)
- **Tagged family / `q`** (`E993Interior.taggedFamily G U W k` := the `k`-subsets `A ⊆ U` independent in `G` and meeting
  `W`; identity of record `tagged_count_split`: for `D ⊆ E`, `indepSetCount G D k = (taggedFamily G (univ ∖ D) E k).card +
  indepSetCount G E k`). For a leaf `v`: **`q_v(j) := i_j(H_v) − i_j(R_v)`** = the independent `j`-sets of `H_v` meeting `W_v`
  = `(taggedFamily G (univ ∖ H G v) (R G v) j).card` (since `R G v ∖ H G v = W_v`). The summand of `S` is `q_v(p) − q_v(p − 1)`.
- **Eligibility (the lower region):** natural `p` with `x(G) + 2 ≤ p` and `3p < 2α(G) + 1`; equivalently
  `x + 2 ≤ p ≤ ⌊2α/3⌋`. Nonempty eligibility is REQUIRED of every instance reported by any instrument. On trees the smallest
  eligible instances have order 13 (`K_{1,12}`, `α = 12`, `x = 6`, `p = 8`); the labelled census through order 8 has zero
  eligible rows (predecessor C6-U6) and tests no sign instance.

### 1.2 New in this run: the transport network (prose; Lean in `SOLUTION-CONTRACT.md` §2)

- **Independent layers.** `I_j(G)` := the independent `j`-subsets of `V` (`indepSetsAvoiding G ∅ j`). Sources are `I_{p+1}(G)`,
  targets are `I_p(G)`.
- **Active-tag weight.** For a finite set `F` of degree-one vertices (the fixed selector `F_p(G)` in every target statement)
  and an independent set `B`: **`w_F(B) := #{v ∈ F ∩ B : (B ∖ {v}) ∩ W_v ≠ ∅}`** — a tag `v ∈ F ∩ B` is ACTIVE in `B` iff `B`
  contains another neighbour of `v`'s original support. Since `v ∈ B` and `s_v ~ v`, `s_v ∉ B`, so `(B ∖ {v}) ∩ W_v = B ∩ N(s_v)`.
  A favorable leaf merely PRESENT in `B` is not counted unless active (the predecessor's C6-F5/C6-U5 error was to count
  `|F ∩ B|`, or `1 + #private leaves present`; both are struck on sight).
- **Weight–aggregate identity (WID).** For every finite simple graph `G`, every finite set `F` of degree-one vertices and every
  `p ≥ 1`: `Σ_{B ∈ I_{p+1}} w_F(B) − Σ_{A ∈ I_p} w_F(A) = Σ_{v ∈ F} [q_v(p) − q_v(p − 1)]`. Proof of record (to be carried on the
  award's face): for fixed `v ∈ F` and `j ≥ 1`, `B ↦ B ∖ {v}` is a bijection from `{B ∈ I_j(G) : v ∈ B, (B ∖ {v}) ∩ W_v ≠ ∅}`
  onto `{A ∈ I_{j−1}(H_v) : A ∩ W_v ≠ ∅}` — `A` avoids `v` and `s_v` (`s_v ∉ B` because `v ∈ B`), and conversely `A ∪ {v}` is
  independent because `N(v) = {s_v}` and `s_v ∉ A`; summing over `v ∈ F` gives `Σ_{B ∈ I_j} w_F(B) = Σ_{v ∈ F} q_v(j − 1)`. With
  `F = F_p(G)`: **total source supply − total target capacity = `S(G, p)`** (`C5LA1.aggregate G p`). Every instrument asserts
  this equality on every instance before reporting anything else.
- **Relation (REL).** `B ∈ I_{p+1}` is joined to `A ∈ I_p` iff (D) `A = B ∖ {q}` for some `q ∈ B` (deletion), or (S) there is
  `u ∉ B` with `|N_G(u) ∩ B| = 2` and `A = (B ∖ N_G(u)) ∪ {u}` (two-for-one switch). In case (S) `A` is independent (the
  neighbours of `u` in `B` were removed; `u ∉ B`) and `|A| = p`. Arcs carry no capacity of their own. Deletion of the tag `v`
  itself, or of the witness that made it active, may lower the weight; a switch may activate or deactivate tags — the weights
  of `B` and `A` are each computed literally, never inferred.
- **Network and flow.** Supplies `w_F(B)` on sources, capacities `w_F(A)` on targets, uncapacitated arcs of (REL). A
  **saturating integral flow** is `f : I_{p+1} × I_p → ℕ`, positive only on arcs of (REL), with `Σ_A f(B, A) = w_F(B)` for every
  source and `Σ_B f(B, A) ≤ w_F(A)` for every target. **Weighted Hall (HALL-COND):** for every `X ⊆ I_{p+1}`,
  `Σ_{B ∈ X} w_F(B) ≤ Σ_{A ∈ N(X)} w_F(A)`, `N(X)` the set of targets joined to some member of `X`. By max-flow/min-cut (or
  Hall's theorem on the clone-expanded bipartite graph) a saturating integral flow exists iff (HALL-COND) holds.
- **(HALL) — the registered mechanism key** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN): for every finite ordinary tree
  `T` and eligible `p`, with `F = F_p(T)`, a saturating integral flow exists. **Consequence (FLOW⇒SIGN):** for ANY finite simple
  graph, a saturating flow gives `Σ_B w_F(B) = Σ f ≤ Σ_{A ∈ N(I_{p+1})} w_F(A) ≤ Σ_{A ∈ I_p} w_F(A)`, so by (WID) `S(G, p) ≤ 0`.
  Note that this consequence uses (HALL-COND) only at `X = I_{p+1}`; the sufficient mechanism is stronger than the scalar
  target exactly because a FLOW must serve every subfamily. A deficient cut (`Σ_X w > Σ_{N(X)} w`) refutes (HALL) at that
  `(T, p, X)`; it says nothing about `S(T, p)` unless `X = I_{p+1}` and every positive-weight target is reachable.
- **Deficient cut (CUT) — outcome C's object.** A tuple `(T, p, X)` with `T` a finite ordinary tree passing an
  acyclicity-and-connectivity test, `p` eligible with `x` computed through rank `α`, `F = F_p(T)` computed from `Δ_p(T − v)` on
  the ORIGINAL tree, `w_F` literal, (REL) literal, `X ⊆ I_{p+1}` explicit (or defined by a checkable predicate with its members
  enumerated or counted exactly), `N(X)` computed from (REL), and `Σ_X w_F − Σ_{N(X)} w_F > 0` in exact integers; two independent
  instruments and an isolated second read before the key closes REFUTED.
- **Imported informal results (used at their exact grades).** (LIFT) `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` (VERIFIED,
  `proved_informal`): a finite group preserving the relation and the (invariant, nonnegative integer) supplies/capacities;
  orbit-total supplies/capacities; an orbit arc iff some edge joins the orbits; a saturating quotient flow lifts to a
  saturating original flow. It does NOT prove quotient feasibility. Its CONVERSE direction is elementary and may be used
  once stated: a saturating original flow sums to a saturating quotient flow, so a quotient DEFICIT proves an original
  deficient cut exists (and, by the supermodular-maximizer argument of its proof, an INVARIANT deficient cut exists).
  (DCB) `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY` (VERIFIED, `proved_informal`): `k·q_{k+1} + C = 2(h − k)·q_k − D` on a
  bipartite `H` with tags `W`, `h ≥ α(H)`, `1 ≤ k ≤ h`; summed over `F` with `h = α − 1`, `k = p − 1`: `kS = (2α + 1 − 3p)Q − D − C`,
  `Q = Σ_F q_v(k)`, `D, C ≥ 0` — the parallel route; the missing statement is the BUDGET `D + C ≥ (2α + 1 − 3p)Q`, and
  `D, C ≥ 0` alone never supplies it. (TSB) `E993-BIPARTITE-TAGGED-SHADOW-BOUND` (VERIFIED, `formally_verified`, r29):
  `k·q_{k+1} ≤ 2(a − k)·q_k` — available as a proved inequality on bipartite graphs, but it signs a term only in the high tail.
- **Fixed points (controller-checked, `control/controller-prerun/wt_check.py`; priors, never evidence).**
  `K_{1,12}` at `p = 8`: `n = 13`, `α = 12`, `x = 6`, all 12 leaves favorable (`Δ_8(K_{1,11}) = 55 − 165 < 0`); every source
  (a 9-set of leaves) has weight 9 (all tags active — the centre's other leaves are `W_v`), every target (an 8-set of leaves)
  weight 8; supply `9·C(12, 9) = 1980`, capacity `8·C(12, 8) = 3960`, `S = −1980`; no switch exists (the centre has 9
  neighbours in every source); deletion-only Hall holds (LYM: `|∂X| ≥ |X|·495/220`). The predecessor's two heterogeneous
  path-star trees (path `0–1–2`, centres attached to `0`, private tips): profile `(2, 3, 4)` (`n = 15`, `α = 11`, `x = 5`,
  `p = 7`, all 10 leaves favorable): supply `1483`, capacity `2701`, saturating flow `1483`, `S = −1218`, 2025 arcs; profile
  `(2, 2, 4, 3)` (`n = 18`, `α = 13`, `x = 6`, `p = 8`, all 12 leaves favorable): `8033 / 13467 / 8033`, `S = −5434`, 11691 arcs
  (C6-F5 root correction, verified by C6-AF; `bounded_computation`). `CB(8, 92)`: path `r–s–v` (`0–1–2`), 92 chokes `u_i ~ r`,
  8 supports `b_{ij} ~ u_i`, one private leaf `c_{ij} ~ b_{ij}`; `n = 1567`, `α = 829`, `x = 490`, eligible `p ∈ [492, 552]`, the
  record row `p = 492`; all 737 original leaves favorable; complete aggregate negative (exact value in the frozen
  `cb-switch-cut/RESULTS.json`); in the root-plus-arm sector (`r, v ∈ B`, hence no choke) every member has active weight
  exactly ONE (the arm tag `v` is active through `r`; every private tag is inactive because its choke is absent); the
  residual layers are `|R_j| = 2^j·C(736, j)`, `|R_491| / |R_490| = 492/491`, deletion-only shortfall `|R_490|/491`; the
  earlier `493/491` used the wrong weight. Controller prior: the switch-free source family `X'` (root-plus-arm members in
  which no branch has exactly one support) has `Σ_{X'} w = |X'|` and a positive-weight deletion shadow about 18 times larger
  (exact counts in `wt_report.json`) — NOT a deficient cut. `T_m` orbit flows (`sources/lower-region/instruments/orbit-flow-twoforone/`):
  `(m, p) = (22, 34), (60, 90), (66, 98)` saturate in the quotient (`bounded_computation`); supply/capacity for `(22, 34)`
  `6533318342644086823410 / 7032072523191088241946`, `S = −498754180547001418536`.

## 2. The statements of this run (prose; Lean statements of record in `SOLUTION-CONTRACT.md` §2)

- **(HALL) — Tier 1 (the registered OPEN key).** Every finite ordinary tree `T`, every eligible `p`, `F = F_p(T)`: the network of
  §1.2 has a saturating integral flow. Outcome A proves it (informally at statement level, then a governed award at its
  exact scope, or at a proved restricted scope registered as a separate key); outcome C refutes it by (CUT).
- **(WID) — Tier 1′ (run-local key `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`).** The identity of §1.2 on every finite
  simple graph, every finite set of degree-one tags, every `p ≥ 1`; with `F = F_p(G)` it reads `supply − capacity = S(G, p)`.
  The run's prerequisite Lean target: it binds every instrument's fidelity assertion to a kernel-checked statement.
- **(FLOW⇒SIGN) — companion.** On any finite simple graph, a saturating flow implies `S(G, p) ≤ 0` (uses (WID) and (HALL-COND) at
  `X = I_{p+1}` only).
- **(HALL⇒FLOW) — companion.** (HALL-COND) for every `X` implies a saturating integral flow (finite max-flow/min-cut, or Hall's
  marriage theorem on the clone expansion: `w_F(B)` clones of each source, `w_F(A)` clones of each target).
- **Outcome-B lemma templates (each a separate `E993-R30-…` key when the synthesis registers it):** (NMP) a normalized-matching /
  LYM inequality for the DELETION shadow under the active weight on a stated class of trees or sectors (e.g. the pair-poset
  sector of `CB(d, m)`: `Σ_X w ≤ (492/491)·Σ_{∂X} w`-type statements); (SW) a switch-capacity lemma: an exact lower bound on the
  weight of the two-for-one image `N_S(X) ∖ N_D(X)` of a stated source family, with overlap and competition controlled; (INV)
  an invariant-cut reduction: if a deficient cut exists then an `Aut(T)`-invariant one does (from the supermodularity of
  `X ↦ Σ_X w − Σ_{N(X)} w`), reducing (HALL) on a family to a quotient statement; (REC) a rooted recurrence for `w_F`-weighted
  layer sums that retains the fixed selector and the active-tag witnesses; (BUD) a direct compensation inequality implying
  `D + C ≥ (2α + 1 − 3p)Q` on a stated class. A template is not a claim; a route names the exact statement it proves.
- **(CUT) — outcome C's object,** §1.2; the mechanism key REFUTED at `(T, p, X)`; the primary aggregate untouched.
- **The region and its fences.** The high tail `3p ≥ 2α + 1` is CLOSED (r29: every leaf term `≤ 0`, `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE`
  VERIFIED `proved_informal`; TSB/HTP formal) and is not re-proved; the lower region is the ONLY open region; the order bands
  `n ≤ 2p + 2` are CLOSED formally (`E993-ORDINARY-LEAF-ORDER-BAND`, `E993-LOWER-REGION-FIRST-ORDER-SHELL`,
  `E993-FIRST-ORDER-SHELL-POINTWISE-EARLY-DESCENT`, `E993-MARKED-ISOLATE-ORDER-BAND`), so an unresolved row has
  `2p + 3 ≤ n ≤ 4p − 8` (`p ≥ 6`; the forest ceiling `n ≤ 4x`, r27); `T_m` (all `m`), the equal-length-three spiders (all `m`),
  the path-star arities 2–4 at `m ≥ 2000` and 2–12 at `m ≥ 10^8` are VERIFIED at computer-assisted/analytic grades — none is
  re-proved, and repeated checks of them are not evidence (charter). Every registered REFUTED mechanism stays refuted at its
  exact scope (`SOLUTION-CONTRACT.md` §3).

## 3. Conventions

- Every count is a natural number; differences are integers via casts; `p − 1`, `α − 1`, `a − k` in ℕ are guarded by the
  hypotheses that make them equal to the integer values (`p ≥ 1`; `k ≤ a`) — every such guard is named where it enters, and
  the fidelity review checks each.
- "Original" always refers to the undeleted tree `T`: leaves, supports, closed neighbourhoods, `W_v`, the selector `F_p(T)`
  and the active-tag witnesses are evaluated in `T`, never in a deleted graph and never at another rank.
- "Active tag" means `v ∈ F ∩ B` with `B ∩ N_T(s_v) ≠ ∅`; "favorable leaf present" means only `v ∈ F ∩ B`. The two are never
  conflated; a table reports which one it counts.
- `x`, `Δ_k`, `i_k`, `α`, `p`, `|F|`, `Σ supply`, `Σ capacity`, `S` and the graph appear on every reported row; a plateau is not
  a descent; `x` is computed through rank `α`.
- Attribution on every face: Codex (GPT-6 Astra/Sol/Luna) for the mechanism, the lower-region run, its corrections
  (active-tag weight; `492/491`), the orbit-flow lift and the incidence identity; r29 (Claude, Fable-controlled) for the
  high-tail certificates and the sharp boundary; r26/r24/r25 for the definition layers; the first-interior run (Codex) for
  entries 1–18; r30 seats and critics for their derivations.
