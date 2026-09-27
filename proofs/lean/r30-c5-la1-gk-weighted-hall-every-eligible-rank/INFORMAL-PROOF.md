# Informal Proof — `C5-LA1`: (HALL) at every eligible rank of `G_k`

Canonical run id `erdos-993-math-dre-20260926-r30-weighted-transport`; Lean run `lean-2026-09-27-c5-la1-gk-weighted-hall-every-eligible-rank`;
producer `c5-la1-formalizer-opus-20260927` (the chartered Claude Opus 5.5 formalizer seat; runtime-reported model id `claude-opus-5-5[1m]`).
Governing text: `cycles/cycle-5/stage6/SYNTHESIS.md` `## Lean awards` "C5-LA1"; brief `control/C5-STAGE7-FORMALIZER-BRIEF-LA1.md`
(`2510b890…`). This document is at statement-level granularity and follows the Lean DAG N0–N4 and the assembly. It is
not an award, not a grade and not a verification; the Lean kernel and the two independent reviews are the gates.

## 1. The statement

`G_k` is C4-LA1's `gkGraph k` on `Fin (3k+5)`: root `0`; leaf `1`; cherry centre `2` with leaves `3, 4`; arms
`0 – a_i – b_i – c_i` with `a_i = 5+3i`, `b_i = 6+3i`, `c_i = 7+3i` for `i < k`. With `i_j = indepSetCount (gkGraph k) ∅ j`
(the number of independent `j`-sets), `Δ_j = forwardDifferenceDel (gkGraph k) ∅ j = i_{j+1} − i_j ∈ ℤ`, and
`x(G_k) = crossingIndex (gkGraph k) = min { j : Δ_j < 0 }` (first-interior entry 14, `Nat.find`):

> **Theorem** (`E993Transport.gk_lowerRegionWeightedHall_everyEligibleRank`). For every `k : ℕ`, `G_k` is a tree
> (Mathlib's `SimpleGraph.IsTree`), and for every `p` with `x(G_k) + 2 ≤ p` and `3p < 2·α(G_k) + 1` there is a flow `f`
> with `IsSaturatingFlow (gkGraph k) (favorableLeaves (gkGraph k) p) p f` — (HALL)'s flow form at `T = G_k`, every
> eligible rank, tag set `F_p(G_k)`.

**Hypotheses consumed.** Only `x(G_k) + 2 ≤ p` (a ℕ inequality; no subtraction guard needed). **`hLow` is unused**: the
upper-eligibility condition `3p < 2α + 1` is carried only so that the statement is literally SOLUTION-CONTRACT §2's
(HALL) signature instantiated at `T = G_k`. It is unused because the flow of C4-LA1 exists at *every* rank `p ≥ k+3`,
eligible or not, for every leaf-tag set; the only thing the eligibility window contributes is the lower end
`p ≥ x + 2 ≥ k + 3`. The eligible set is nonempty iff `k ≥ 3` (companion fact on the face, informal, SR-C4-8, using
`α(G_k) = 2k+3`; not part of the theorem; the optional companion `indepNum (gkGraph k) = 2k+3` was **not** authored).

## 2. DAG and proof

**N0 (carried, byte-identical).** C4-LA1 entries 1–112 (every entry before its terminal theorem 113), and first-interior
entry 14 `C5LA1.crossingIndex`; see the carry table in §6. The flow comes from C4-LA1's LEMMA entry 110
`gk_exists_deletionSupported_saturatingFlow` (every `p ≥ k+3`, every `F ⊆ leafSet`, deletion-supported), never from the
carried terminal theorem 113 (not carried: the registrar admits no entry after a terminal theorem).

**N1 `gkGraph_isTree` (U1, Claude Sonnet 5; re-authored as `lemma`s).** Connectivity: every vertex is joined to `0` by
an explicit walk of length `≤ 3` (case split on the label, `omega` from `v < 3k+5`). Edge count: the child→parent map
`v ↦ s(v, parent v)` on non-root vertices (`gkParentVal`: `1,2 ↦ 0`, `3,4 ↦ 2`, `a_i ↦ 0`, `b_i ↦ a_i`, `c_i ↦ b_i`) is
injective because `gkParentVal` strictly decreases the label, and its range is exactly the edge set (case analysis over
the seven label patterns of `gkGraph_adj_iff_val`). So `|E| = 3k+4 = |V| − 1` and `isTree_iff_connected_and_card` gives
the tree. Uniform in `k`; no enumeration; every ℕ subtraction (`n − 1`, `(n−5)/3`, `(n−5) % 3`) sits under a branch guard.
Axioms (re-probed): 3 of U1's 26 declarations use all three permitted axioms (`gkChildEdge_range`,
`gkGraph_card_nonroot`, `gkGraph_isTree`), the rest a strict subset — the repaired literal.

**N4a — the count bridge** (formalizer-authored in-run; explicit binomial form of the U adjudicator, root split of
C-U1-F / C-U1-T). Define (Lean `gkHalfCount k m`)

`u_m = Σ_{i=0}^{m} C(k+1, i)·C(2(k+1−i), m−i) + Σ_{l=0}^{m−1} C(k, l)·C(k−l+1, m−l−1)`,

the coefficient of `y^m` in `U = (1+3y+y²)^{k+1} + y(1+y)(1+2y)^k`. Claim: `i_0 = u_0` and `i_{j+1} = u_{j+1} + u_j` for all
`j` (so `I(G_k; y) = (1+y)U`). Proof, by the root split:

1. *Vertex-cover fibre count (generic, `card_indep_powersetCard_union_eq_sum_choose`).* Let a ground set be `K ∪ E` with
   `K`, `E` disjoint and each independent, every `w ∈ K` adjacent to exactly `d` vertices of `E`, and no vertex of `E`
   adjacent to two vertices of `K`. Fibre the independent `j`-sets `S ⊆ K ∪ E` by `M = S ∩ K`. For fixed `M` (with
   `|M| ≤ j`, else the fibre is empty), `S ↦ S \ M` is a bijection onto the `(j−|M|)`-subsets of
   `Fr(M) = { v ∈ E : v adjacent to no vertex of M }` (inverse `T ↦ M ∪ T`); `|Fr(M)| = |E| − d|M|` because the sets
   `N(w) ∩ E`, `w ∈ M`, are pairwise disjoint of size `d`. Grouping the subsets `M ⊆ K` by size
   (`Finset.sum_powerset_apply_card`) gives `#{S} = Σ_{i ≤ j} C(|K|, i)·C(|E| − d·i, j − i)`.
   This is the "block-state bijection": a middle chosen or not in each `P_3` block, and a free choice among the
   surviving block ends. **Deviation recorded:** it is realised by this fibre decomposition over the set of chosen
   middles, not by C4-LA1's chain-factor block layer (entries 39–41, 81–86), which encodes tag-dependent chains for the
   flow and is not needed for counting. The DAG node and its statement are unchanged.
2. *`0 ∉ S`* (`gk_card_indep_rootFree_eq_sum`). Ground set `V − 0 = K ∪ E` with `K = {2, b_0, …, b_{k−1}}` (the `k+1`
   middles, `gkMiddles`) and `E = {1, 3, 4, a_i, c_i}` (`2k+3` ends). Every edge of `G_k` meets `0` or a middle, so `E` is
   independent; the middles are pairwise non-adjacent; `2` has ends `3, 4`, `b_i` has ends `a_i, c_i` (`d = 2`), and no
   end has two middle neighbours. Hence `#{S : 0 ∉ S, |S| = j} = Σ_{i≤j} C(k+1, i)·C(2k+3−2i, j−i)`.
3. *`0 ∈ S`* (`card_indep_powersetCard_succ_mem_eq_card_indep_nonNeighbors`, `gk_card_indep_rootMem_eq_sum`). Erasing `0`
   is a bijection onto the independent `j`-sets of the non-neighbours of `0` (`1, 2, a_i` excluded), which are the `k` arm
   middles `b_i` and the `k+2` far leaves `3, 4, c_i` (`gkFarLeaves`); each `b_i` has the single far-leaf neighbour `c_i`
   (`d = 1`). Hence `#{S ∋ 0 : |S| = j+1} = Σ_{l≤j} C(k, l)·C(k+2−l, j−l)`.
4. *Pascal's rule* (`gk_rootFree_sum_eq_pascal`, `gk_rootMem_sum_eq_pascal`). `C(2(k+1−i)+1, t+1) = C(2(k+1−i), t) +
   C(2(k+1−i), t+1)` (the leaf `1` is the factor `1+y`) and `C(k−l+2, t+1) = C(k−l+1, t) + C(k−l+1, t+1)` (the leaf `4`
   is the factor `1+y`) turn the two counts at `j+1` into `A_{j+1} + A_j` and `B_{j+1} + B_j`, where `u = A + B` splits
   `gkHalfCount` into its two sums. Adding: `i_{j+1} = u_{j+1} + u_j`. The empty set gives `i_0 = 1 = u_0`.

**N4b — the inequality `u_{m−2} ≤ u_m` for `2 ≤ m ≤ k+1`** (`gkHalfCount_le_gkHalfCount_add_two`, stated as
`u_j ≤ u_{j+2}` for `j + 2 ≤ k + 1`; the case `m = 1` of the synthesis's `1 ≤ m ≤ k+1` is `u_1 ≥ u_{−1} = 0`, used
directly in N4). This is C-U1-F's elementary binomial-row chain in integer form; Newton's route is not used.
Write `u_m = Σ_{l=0}^{m} T_l(m)` with the paired rows `T_l(m) = C(k+1,l)·C(2N_l, m−l) + [l<m]·C(k,l)·C(N_l, m−l−1)`,
`N_l = k+1−l` (the row `y^l(1+y)^{2N_l}` of `Q^{k+1}`, `Q = (1+y)² + y`, paired with the row `y^{l+1}(1+y)^{N_l}` of
`y(1+y)(1+2y)^k`, `1+2y = (1+y) + y`). For `l ≤ m−2` put `r = m−2−l` (so `r + 2 ≤ N_l` because `m ≤ k+1`); termwise
`T_l(m−2) ≤ T_l(m)`, and the extra terms `l = m−1, m` of `u_m` are `≥ 0`:
- `r = 0`: `T_l(m−2) = C(k+1,l) ≤ C(k+1,l)·C(2N_l, 2)`.
- `r ≥ 1`: `T_l(m−2) = C(k+1,l)·C(2N,r) + C(k,l)·C(N,r−1) ≤ C(k+1,l)·[C(2N,r) + C(N,r−1)] ≤ C(k+1,l)·C(2N,r+2)`, using
  `C(k,l) ≤ C(k+1,l)` and the **integer closing step** (`choose_two_mul_succ_add_choose_le_choose_two_mul_add_three`):
  for `s + 3 ≤ N`, `C(2N, s+1) + C(N, s) ≤ C(2N, s+3)`. Proof: two applications of `C(n, t+1)(t+1) = C(n,t)(n−t)` give
  `(s+3)(s+2)·C(2N,s+3) = (a+1)a·C(2N,s+1)` with `a = 2N−s−2 ≥ s+4`; `(a+1)a − (s+3)(s+2) = (a−s−2)(a+s+3) ≥ 2(2N+1)`;
  `C(2N, s+1) ≥ N·C(N, s)` (Pascal induction `t·C(N,s) ≤ C(N+t, s+1)`, at `t = N`); and `(s+3)(s+2) ≤ N² ≤ 2N(2N+1)`. So
  `(s+3)(s+2)(C(2N,s+1) + C(N,s)) ≤ (a+1)a·C(2N,s+1)`; divide by `(s+3)(s+2) > 0`.

**Deviation recorded (N4b):** C-U1-F pairs the second-sum row `l` with the first-sum row `l+1` and closes with
`h(M,t) ≥ 0` via `(2M/(M+1))^{t−2} ≥ (3/2)^{M/2}`; the formalizer pairs it with row `l` (whose `(1+y)^{2N}` row is centred
one step higher, giving the margin `2(2N+1)`) and closes with the integer inequality above. This is within the U
adjudicator's allowance ("if `(3/2)^{M/2}` is awkward in Lean, an integer induction replaces that step"); the
decomposition into binomial rows, the `E(2N, ·) ≥ 0`-type row step and the domination `C(k+1,·) ≥ C(k,·)` are C-U1-F's.
The mathematics is checked by the kernel, not by this document.

**N4 `gk_forwardDifference_nonneg` — GK-MONO in Lean.** For `j ≤ k`, `Δ_j ≥ 0` in ℤ: `Δ_0 = i_1 − i_0 = u_1 ≥ 0`; for
`j ≥ 1`, `Δ_j = (u_{j+1} + u_j) − (u_j + u_{j−1}) = u_{j+1} − u_{j−1} ≥ 0` by N4b at `m = j+1 ≤ k+1`. **N4 is GK-MONO
(`i_0 ≤ … ≤ i_{k+1}`) as a Lean lemma.** The closed form `8Δ_{k+1} = −2^k(k²+3k−8)` and `x(G_k) = k+1` (the upper bound)
are not formalized and not needed.

**N2 `gk_crossing_lower_iff` (C-U1-F).** `k + 1 ≤ x(G_k) ↔ ∀ j ≤ k, ¬ Δ_j < 0`, by `Nat.le_find_iff` on the definition of
record of `crossingIndex`.

**N3 `gk_weightedHall_flow_of_crossing_lower` (C-U1-F's reduction).** From `k+1 ≤ x` and `x + 2 ≤ p`, `p ≥ k+3`;
`favorableLeaves (gkGraph k) p ⊆ leafSet (gkGraph k)` (it is a filter of `leafSet`); C4-LA1's lemma entry 110 then gives a
deletion-supported saturating flow, and its first component is the conclusion. The unused `hLow` binder of C-U1-F's
scratch is dropped from N3 (the terminal theorem carries it).

**Assembly.** Terminal theorem `= ⟨N1, fun p hElig _hLow => N3 (N2.mpr (N4)) hElig⟩`. The support conjunct of C4-LA1
(`∀ B A, 0 < f B A → ∃ q ∈ B, A = B.erase q`) is **omitted** from the conclusion (the brief permits either; the frozen
`expected_statement` omits it). Deletion support holds for the flow constructed but is not asserted.

## 3. Finiteness, decidability, ℤ/ℕ audit

- Finiteness: `Fin (3k+5)` is a `Fintype`; all counts are `Finset.card`s of filters of `powersetCard`s.
- Decidability: adjacency uses the carried instance `gkGraph_decAdj` (entry 24, no classical choice); the `IsIndepSet`
  filters use the same instance paths as the carried definitions `indepSetsAvoiding`/`indepSetCount`; `crossingIndex`
  and `favorableLeaves` are carried with their own `open Classical in`. No `decide` over an enumeration, no
  `native_decide`, no `sorry`/`admit`/`axiom`; every universal step is uniform in the variables `k, j, m, p, l, r, N`.
- ℤ/ℕ: `forwardDifferenceDel` is ℤ-valued by its definition of record, so `Δ_j` has no truncated subtraction; N4 casts
  the ℕ identities of N4a into ℤ (`push_cast`) and concludes with linear arithmetic. In `gkHalfCount` every subtraction
  is guarded: `m − i` by `i ∈ range (m+1)`, `m − l − 1` by `l ∈ range m`; `k + 1 − i` and `k − l` truncate only where the
  factor `C(k+1, i)` resp. `C(k, l)` is already `0`. This is the guarded form the SR-C5-3 second read asked for; it is
  equivalent to that read's form (ranges `range (k+2)`/`range (k+1)` filtered by `i ≤ m`/`l+1 ≤ m`) because the extra or
  missing terms have a zero factor; the index `j − 1` never appears (N4a is stated at `j + 1` and at `0`). In the counts,
  `|E| − d·i` is exact since `d·|M| ≤ |E|`, `j − |M|` is used only when `|M| ≤ j`, and Pascal rewrites use `omega`-proved
  equalities under explicit guards (`i ≤ k+1`, `l ≤ k`, `l < j`), with `C(·,·) = 0` above the top otherwise.
- Exact-integer check (not proof): `DRAFTS/check_halfcount.py` confirms the literal ℕ semantics of `gkHalfCount`
  against the reader's form, a tree DP (`k ≤ 60`, all `j`), brute force (`k ≤ 3`), N4b and `Δ_j ≥ 0` (`ALL_OK True`).

## 4. GK-MONO: the two informal proofs of record

- **C-U1-T (Claude Opus 5.5), Newton's inequalities.** `C = (1+3y+y²)^{k+1}` is real-rooted, palindromic, so
  `c_{j+1} − c_j ≥ c_j/(k+1) ≥ r_j` for `j ≤ k` (with `C ≥ (k+1)R`, `R = y(1+y)(1+2y)^k`), hence `U = C + R` is
  nondecreasing through `k+1` and so is `(1+y)U`. **Not the Lean route.**
- **C-U1-F (Claude Opus 5.5), elementary binomial rows — the proof of record for Lean.** `I = (1+y)U`, rows of
  `Q^{k+1}` and of `y(1+y)(1+2y)^k`, `E(N,t) = C(N,t) − C(N,t−2)`, pairing and `h(M,t) ≥ 0`. **Lean follows C-U1-F's
  binomial-row chain**, with the re-pairing and integer closing step recorded in §2 N4b.
- The U adjudicator compared both step by step; the isolated second read SR-C5-3 confirmed GK-MONO and the composition at
  `proved_informal` (controller message, 2026-09-27). GK-MONO registers `proved_informal` as a companion on the face
  (key `E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE`); N4 is its Lean form, and the
  controller decides the companion's grade after the kernel receipt. This document asserts no grade.

## 5. Fences, excluded conclusions, attribution

**Fences (on the face).** `G_k` only; deletion-supported flows (C4-LA1's); not (HALL) at full scope; not "every tree";
nothing about the primary aggregate beyond `G_k`; not an RTree statement; not the strict GK-SIGN; `G_k` is not a second
family for gate ruling 39; the `k = 3` row (`n = 14`, `p = 6`) lies in the formally closed band `n ≤ 2p + 2` and is
covered without re-proving that band; no statement about switch arcs; no status change of (HALL), the primary aggregate
or any refuted key; (HALL) is asserted at no scope other than this theorem's own family.

**Excluded conclusions.** Any statement about trees other than `gkGraph k`; any statement about switch arcs or cuts;
`formally_verified` for GK-MONO as a key (companion, `proved_informal`, controller's ruling).

**Attribution.** Mechanism and the lower-region run: Codex GPT-6. Definition layers: first-interior (Codex) entries 1–18
incl. `C5LA1.crossingIndex` (entry 14), the r26/r24/r25 carried layers; C1-LA1/C1-LA2 (r30). The `G_k` flow: C4-LA1 (r30
Cycle 4; CT-1 by critic `C-F2-T`, R2′ by the Cycle 4 F adjudicator). `gkGraph_isTree`: U1 (Claude Sonnet 5). GK-MONO:
`C-U1-T` and `C-U1-F` (Claude Opus 5.5). The Lean reduction (N2, N3): `C-U1-F`. The composition and DAG: the Cycle 5 U
adjudicator (Claude Opus 5.5). N4a's fibre count, N4b's re-pairing and integer closing step, and the Lean assembly: the
C5-LA1 formalizer (Claude Opus 5.5). r29 high tail: not used.

## 6. Carry table by origin award

| Registered entries | Origin award | Origin entries | Digest check |
|---|---|---|---|
| 1–44 (definitions) | C4-LA1 (`Main.lean` `66db6c73…`, receipt `dd9c21f7…`) | 1–44 | fragment SHA-256 = C4-LA1 `FORMALIZATION-STATE.json` `source_sha256`, all 44 |
| 45 `C5LA1.crossingIndex` | first-interior c2-primary-v2 (`Main.lean` `8d864da2…`) | 14 | `378868ab…` = state = `control/SOURCE-DIGESTS.json` |
| 46–52 (new definitions) | C5-LA1 (U1 for 46–48) | — | — |
| 53–120 (lemmas) | C4-LA1 | 45–112 | all 68 match |
| 121–143 (N1 lemmas) | C5-LA1 (U1, re-authored) | — | — |
| 144–182 (N4a, N4b, N4, N2, N3) | C5-LA1 | — | — |
| 183 (terminal theorem) | C5-LA1 | — | — |

Within C4-LA1's carry: entries 1–13 and 45 are byte-identical to C1-LA1's, C1-LA2's and first-interior's fragments;
14–21 and 46–51 to C1-LA1's; 53–54 to C1-LA2's; entry 52 is C1-LA1's terminal theorem with `theorem → lemma` (C4-LA1's
conversion). No carried entry in 1–112 is of kind `theorem`, so no conversion was made here. Full per-entry digests:
`CAPSULE-VERIFICATION.json`.
