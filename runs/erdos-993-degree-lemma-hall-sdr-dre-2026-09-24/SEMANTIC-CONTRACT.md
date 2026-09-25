# Semantic Contract — r28 (the Hall/SDR route to the forest degree lemma)

Fixes the meaning of every symbol used in this run. Narrows, and does not alter, the r27 contract
(`sources/r27/records/R27-SEMANTIC-CONTRACT.md`) and the G1 definitions of record carried by the r25 award
`E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (`sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean`,
entries 1–3) and by the r27 award C1-LA1 (`sources/r27/c1-la1-forest-degree-extension/LeanProject/LeanProof/Main.lean`,
the formal (DL) of record). Where prose and that Lean source disagree, the Lean source governs.

## 1. Carrier and definitions of record

- `X` a finite type (`[Fintype X] [DecidableEq X]`, `[DecidableRel G.Adj]` where a `Finset` computation needs
  it); `G : SimpleGraph X`. A **finite tree** is `G` with `G.IsTree` (Mathlib: connected and acyclic; hence
  nonempty). A **finite forest** is `G` with `G.IsAcyclic`. `n := Fintype.card X`. `deg(v) := G.degree v`.
- `I_k(G)` := the independent `k`-subsets, `G.indepSetFinset k` (Mathlib); `i_k(G)` := `Erdos993G1.indepCount G k`
  (= `(G.indepSetFinset k).card` in ℤ; r25 entry 1, byte-identical).
- **Occupancy count** `c_v(k)` := `#{J ∈ I_k(G) : v ∈ J}` — the number of independent `k`-sets containing `v`. To
  be defined in-run (e.g. `occ G v k := ((G.indepSetFinset k).filter (fun J => v ∈ J)).card`). Facts of record:
  `Σ_v c_v(k) = k·i_k`; `c_v(1) = 1`; `c_v(0) = 0`; `c_v(k) = i_{k−1}(G − N[v])` for `k ≥ 1`.
- **Leaves** `L(G)` := `{v : deg v = 1}`; **branch vertices** `Br(G)` := `{v : deg v ≥ 3}`; a branch vertex `v`
  carries `deg(v) − 2` **slots** (a natural number since `deg v ≥ 3`). For a tree of order `n ≥ 2`,
  `Σ_{v∈Br} (deg v − 2) = |L| − 2` (the r27 slot count, `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`).
- **Incident degree sum** `D_k(G)` := `Σ_{J∈I_k} Σ_{v∈J} deg(v)` = `Σ_v deg(v)·c_v(k)` (r27 `indepDegreeSum`).
- **Threshold counts.** For a tree, `k` and `t ∈ ℕ`: `slots_{≥t}(k)` := `Σ_{v∈Br : c_v(k) ≥ t} (deg v − 2)`;
  `leaves_{≥t}(k)` := `#{ℓ ∈ L : c_ℓ(k) ≥ t}`.
- **Threshold bipartite graph** `H_k(T)`: left side the multiset of slots (slot copies of each branch vertex
  `v`, `deg v − 2` of them), right side `L`, slot-of-`v` ~ `ℓ` iff `c_ℓ(k) ≥ c_v(k)`. Its neighbourhoods are
  nested (a slot with smaller `c_v` is adjacent to a superset of leaves), so Hall's condition for a left-saturating
  matching reduces to the threshold form of §2.

## 2. The statements of this run

- **(HS) Leaf/slot dominance — threshold form (the Tier 1 target).** For every finite tree `T`, every `k ∈ ℕ`
  and every `t ∈ ℕ` with `t ≥ 1`: `slots_{≥t}(k) ≤ leaves_{≥t}(k)`. (At `t = 0` the inequality reads
  `|L| − 2 ≤ |L|` for `n ≥ 2` and `0 ≤ 0` at `n = 1`; it is included harmlessly in a universally quantified
  statement — a formalizer may quantify over all `t`.)
- **(HS-SDR) Matching form (equivalent by Hall).** For every finite tree and every `k` there is an injection
  from the slots to `L` sending each slot of `v` to a leaf `ℓ` with `c_ℓ(k) ≥ c_v(k)`. (HS) ⟺ (HS-SDR) for each
  fixed `(T, k)` by Hall's marriage theorem on `H_k(T)` (Mathlib `Finset.all_card_le_biUnion_card_iff_exists_injective`
  or the `Fintype` variant), the nested-neighbourhood reduction giving the threshold form.
- **(LC) Layer-cake reduction (proved in-run as a lemma; to be formalized).** For any tree,
  `Σ_{v∈Br} (deg v − 2)·c_v(k) = Σ_{t≥1} slots_{≥t}(k)` and `Σ_{ℓ∈L} c_ℓ(k) = Σ_{t≥1} leaves_{≥t}(k)` (finite sums:
  every `c ≤ i_k`). Hence (HS) ⇒ `Σ_{Br}(deg v − 2)·c_v(k) ≤ Σ_L c_ℓ(k)` ⇒ (by the r27 reformulation, for `n ≥ 2`;
  trivially at `n = 1`) `D_k(T) ≤ 2k·i_k(T)` — (DL) for trees.
- **(FC) Forest composition (r27, `E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION`, proved_informal; a Tier 2
  Lean target here).** `D_k(A ⊔ B) = Σ_{a+b=k} [D_a(A)·i_b(B) + i_a(A)·D_b(B)]` and `i_k(A ⊔ B) = Σ_{a+b=k} i_a(A)·i_b(B)`
  for separated `A`, `B`; hence (DL) on components ⇒ (DL) on the forest.
- **(PW) Pointwise form — REFUTED (r27 `C-T2-U` Step D):** "`c_v(k) ≤ c_ℓ(k)` for every branch `v` and every
  leaf `ℓ`" fails at order 5 (`edges 0–1, 0–2, 0–3, 1–4`, `k = 3`: `c_2(3) = 2 > c_4(3) = 1`, both leaves). It is
  not a target, not a premise, and the matching cannot be replaced by a maximum.
- **Fixed points (controller-checked, `control/controller-prerun/`):** (HS) holds on every free tree to order 18
  (2,204,379 `(T, k)` instances over 204,813 trees of orders 2–18, threshold form; the controller's own instrument
  `control/controller-prerun/hs_check.py`) and, per `C-T2-U`, on 987 trees
  to order 12 (12,977 instances, matching form). These are priors, never evidence. `P_n`: `Br = ∅`, (HS)
  trivial. `K_{1,3}`: one branch vertex with one slot, `c_0(k)` vs three leaves — at `k = 1` all `c = 1`; at
  `k = 2`, `c_0 = 0`, `c_ℓ = 2`. The spider `S(2,1,1)` (order 5 above): at `k = 3`, `c_0(3) = 0`, `c_1(3) = 1`,
  leaves `c_2 = c_3 = 2`, `c_4 = 1`; slot of `0` (one slot) needs a leaf with `c ≥ 0` — fine.

## 3. Conventions

- Every count is a natural number; inequalities between counts are stated in ℕ without subtraction except
  `deg v − 2`, which is guarded by `deg v ≥ 3` (or cast to ℤ). `t` ranges over ℕ; `c ≤ i_k ≤ 2^n`.
- `x`, `Δ_k` and the aggregate `S(T,p)` do not occur in this run's targets; if a seat mentions them it says
  which convention it uses (r27 §1).
- Attribution: the mechanism (leaf/branch reformulation, the SDR condition, the pointwise refutation) is r27
  critic `C-T2-U` (Claude Opus 5 medium, Stage 4, on T2's return); the `2 ≤ n` correction is the r27 T
  adjudicator; the reformulation's second read is SR-JOIN (JN-3). The degree lemma itself is
  Fang–Lu–Nevo–Yao–Zheng 2026 §8 (formally verified in r27 by a different mechanism). Hall's theorem is
  classical (Mathlib).
