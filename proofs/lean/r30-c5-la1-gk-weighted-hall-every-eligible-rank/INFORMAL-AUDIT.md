---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c5-la1-formalizer-opus-20260927
critic_id: c5-la1-fable-informal-20260927
attestation_id: c5-la1-informal-pass-20260927
claim_sha256: e8642e7d1e5f5f979a214bd30002c0bb89496e11838838aeb1fa810f8eaec637
---

# Informal Proof Integrity Audit

**Boot acknowledgment.** I am operating within VerityOS. Before substantive work I read `verity.md`,
`identity/startup-protocol.md` and `skills/proof-integrity-audit/skill.md`. The subsystems loaded were `experiments/` (this
run, within the brief's read boundary) and `skills/` (the proof-integrity-audit skill). The skill's "Load First" modules
(`modules/project-regimes/mathematical-reasoning.md`, `modules/integrity/*`) were **not** loaded, because the brief's read
boundary does not list them. The brief `control/C5-STAGE7-INFORMAL-AUDITOR-BRIEF-LA1.md` was verified at SHA-256
`d5800929906334bad2f8868cbdbe83dcbbfc723b24281ee5e2f42078eeeb3605` before I followed it.

**Model disclosure (two parts).** Chartered model, on dispatch-record authority: Claude Opus 5.5, effort high. Runtime-reported
model id: `claude-opus-5-5[1m]`. The token "fable" in the assigned reviewer id is a name only. Child delegation: none.

**Role.** Independent informal proof-integrity reviewer (`independent-mathematical-proof-integrity-reviewer`). I am not the
artifact producer. I edited no contract, Lean source, informal proof or receipt.

## Intended Claim

The claim is the contract's `theorem.informal_statement` (`THEOREM-CONTRACT.yaml`, SHA-256
`3acc3c906fb4f078bffeb269ba1299207aa39a163875487ae84cc48f22010930`, matching the brief). I recomputed
`sha256(" ".join(s.split()))` = `e8642e7d1e5f5f979a214bd30002c0bb89496e11838838aeb1fa810f8eaec637`. It equals the brief's value.

In mathematical content: for every `k : ℕ`, the graph `G_k = gkGraph k` on `Fin (3k+5)` is a tree (Mathlib's
`SimpleGraph.IsTree`). And for every `p` with `crossingIndex(G_k) + 2 ≤ p` and `3p < 2·indepNum(G_k) + 1`, there is `f` with
`IsSaturatingFlow (gkGraph k) (favorableLeaves (gkGraph k) p) p f`. `hLow` is carried and unused.

The Lean face is `E993Transport.gk_lowerRegionWeightedHall_everyEligibleRank`. Its source text from `theorem` up to but excluding
` :=` equals the contract's `lean_binding.expected_statement` byte for byte (SHA-256 `2effae84…`, recomputed). It is also the
frozen statement of the synthesis's `## Lean awards` "C5-LA1" and of ADJ-U's G-U-A draft. It is SOLUTION-CONTRACT §2's
`lowerRegionTwoForOneWeightedHall` instantiated at `T = gkGraph k`, with `hT` moved into the conclusion as the tree face.

Input digests I verified:
- `INFORMAL-PROOF.md` `ad566fbc…`.
- `Main.lean` `e24ba9dd…`.
- Kernel receipt `RECEIPTS/kernel-verification.json` `6fe8cea0…`: receipt id `71526dadb19c…`, verdict `verified`, source hash
  unchanged before and after. Its `axioms_log_sha256` `27bcad8e…` equals `EVIDENCE/axioms.txt`, and its build log `348d566b…`
  matches.
- `CAPSULE-VERIFICATION.json` `b7eb2b60…`, which equals the contract's `source_materials` digest.
- Capsule seal `1801bdc7…`. I recomputed it as the SHA-256 of the key-sorted compact JSON of the manifest without
  `seal_sha256`. All 647 members match on SHA-256.
- The formalizer brief `2510b890…`.
- Frozen instruments: U1 6/6, C-U1-F 11/11, C-U1-T 14/14 and ADJ-U 46/46 files match `SOURCE-DIGESTS.json`.

## Claim Ledger

Columns: id · node · statement · hypotheses and where they enter · evidence · verdict. "Kernel" means the statement is a
declaration inside the verified `Main.lean`. It never replaces the informal check, which is the column before it.

**N0 — carried layer**

- **L0.1 · N0 · `gkEdge`/`gkGraph` (entries 22–23).** `G_k` has root `0`, leaf `1`, support `2` with leaves `3, 4`, and arms
  `0–(5+3i)–(6+3i)–(7+3i)` for `i < k`, via `SimpleGraph.fromRel`, so loops are removed and adjacency is symmetrised.
  - Hypotheses: none.
  - Evidence: the fragment is byte-identical to C4-LA1 entries 22–23. For `k ≤ 12` I evaluated the predicate literally against
    the constructive edge list and they agree.
  - Verdict: **verified**.
- **L0.2 · N0 · `gkGraph_decAdj` (entry 24).** A `DecidableRel` built by `decidable_of_iff` on `fromRel_adj`, using no
  classical choice.
  - Evidence: byte-identical carry. All counts in N4a use this instance path. The semantic value of a count does not depend
    on the choice of `Decidable` instance.
  - Verdict: **verified**.
- **L0.3 · N0 · `indepSetsAvoiding`/`indepSetCount`/`forwardDifferenceDel` (entries 9–11).** `Δ_j(G − D) = (i_{j+1} : ℤ) − i_j`,
  so it is **ℤ-valued** and no truncated ℕ subtraction is possible.
  - Evidence: byte-identical to C4-LA1, C1-LA1, C1-LA2 and the first-interior entries 10–12.
  - Verdict: **verified**.
- **L0.4 · N0 · `C5LA1.crossingIndex` (entry 45 = first-interior 14, `378868ab…`).**
  - What it computes: `Nat.find` of `fun j => forwardDifferenceDel G ∅ j < 0`, the least `j ∈ ℕ` with
    `i_{j+1}(G) − i_j(G) < 0`.
  - Zero extension: counts at sizes above `α` are `0`, because the `powersetCard` filter is empty.
  - The terminal difference `Δ_α = 0 − i_α` **is included**.
  - The existence side is **supplied inside the definition of record**, with witness `j = G.indepNum`:
    - `indepSetCount G ∅ (α+1) = 0` by `IsIndepSet.card_le_indepNum`;
    - `indepSetCount G ∅ α > 0` by `exists_isNIndepSet_indepNum`;
    - so `Δ_α < 0` by `omega` in ℤ.

    No award proof has to supply existence. `Nat.le_find_iff` holds for any witness.
  - Evidence:
    - The fragment bytes equal the first-interior fragment (`378868ab…`) and that run's `FORMALIZATION-STATE.json`.
    - I checked the Mathlib meanings at the pinned revision: `Nat.le_find_iff : n ≤ Nat.find h ↔ ∀ m < n, ¬p m`.
    - My evaluator computes `x` this way for `k ≤ 60` and checks `x ≤ α` and `Δ_α = −i_α < 0`.
  - Verdict: **verified**.
- **L0.5 · N0 · `leafSet`, `favorableLeaves`, `IsFavorableAt`, `indepFamily`, `tagWitnesses`, `activeWeight`, `transportRel`,
  `IsSaturatingFlow`.** These are exactly SOLUTION-CONTRACT §2's texts. The only differences are C1-LA1's recorded
  `open Classical in` wrapper repair and added comments, carried through C4-LA1.
  - Verdict: **verified** as carried.
- **L0.6 · N0 · entry 110 `gk_exists_deletionSupported_saturatingFlow`.** Statement: for `k + 3 ≤ p` and
  `F ⊆ leafSet (gkGraph k)`, there is `f` with `IsSaturatingFlow (gkGraph k) F p f ∧ ∀ B A, 0 < f B A → ∃ q ∈ B, A = B.erase q`.
  - Hypotheses: `hp : k+3 ≤ p` and `hF`.
  - Evidence: byte-identical to C4-LA1 entry 110 (`d0892d58…`), whose kernel receipt is `dd9c21f7…`. I recomputed its composition
    numerically (see L3.x).
  - Verdict: **verified** as a carried formally verified lemma.
- **L0.7 · N0 · carry integrity.**
  - Registered 1–44 are byte-identical to C4-LA1 1–44, and registered 53–120 to C4-LA1 45–112, with identical file names. All
    112 also match C4-LA1's `FORMALIZATION-STATE.json` `source_sha256`.
  - Registered 45 matches first-interior 14.
  - Cross-checks:
    - C1-LA1 entries 1–28 are byte-identical to registered 1–21 and 53–59.
    - C1-LA1's terminal theorem 36 differs from registered 60 in one line only: `theorem` → `lemma`, which is C4-LA1's own
      conversion.
    - C1-LA2 entries 1–13, 22, 29 and 33 are byte-identical to registered 1–13, 53, 61 and 62.
    - C1-LA2's own 14–21 and 23–28 differ, because they are C1-LA2's pre-repair texts. C4-LA1 took those entries from C1-LA1,
      as the carry table says.
    - First-interior entries 1–6, 8–14, 18 and 42 are byte-identical to registered 1–6, 7–12, 45, 13 and 53.
  - `Main.lean` is exactly `import Mathlib`, a header comment and the 183 snippets in order, separated only by registrar
    `BEGIN`/`END` markers whose embedded digests match each snippet. There is no other text.
  - There are 183 entries: 52 definitions, 130 lemmas and exactly one `theorem`. C4-LA1's terminal 113
    (`gk_deletionSaturatingFlow_of_rank_ge`) does not occur in `Main.lean`.
  - Verdict: **verified**.

**N1 — tree face**

- **L1.1 · N1 · `gkParentVal` (46).** The parent labels are: `1, 2 ↦ 0`; `3, 4 ↦ 2`; `n ≥ 5` with `(n−5) % 3 = 0` (that is
  `a_i`) `↦ 0`; otherwise `n − 1` (`b_i ↦ a_i`, `c_i ↦ b_i`).
  - ℕ subtractions: `n − 5` and `n − 1` are reached only after the guards `n ∉ {1, 2, 3, 4}`.
  - Evidence: for `k ≤ 30`, `gkParentVal v < v` and `v ~ gkParentVal v` for every `v ≠ 0`.
  - Verdict: **verified**.
- **L1.2 · N1 · connectivity (`gkGraph_reachable_zero`, `gkGraph_connected`).** Every vertex is reachable from `0` by an
  explicit walk of length `≤ 3`.
  - Verdict: **verified**, both informally and in the evaluator's BFS for `k ≤ 60`.
- **L1.3 · N1 · `gkChildEdge_injective`, `gkChildEdge_range`, `gkGraph_card_nonroot`.**
  - The child→parent `Sym2` map on non-root vertices is injective, because the parent value strictly decreases.
  - Its range is exactly `edgeSet`, by the seven label patterns.
  - There are `|V| − 1` non-root vertices.
  - Evidence: the evaluator checks, for `k ≤ 30`, that the child edges are pairwise distinct and that their set equals the edge
    set.
  - Verdict: **verified**.
- **L1.4 · N1 · `gkGraph_isTree`.** This follows from `isTree_iff_connected_and_card`. At the pinned Mathlib that lemma reads
  `G.IsTree ↔ G.Connected ∧ Nat.card G.edgeSet + 1 = Nat.card V`.
  - Evidence:
    - Every normalised N1 declaration body (entries 46–48 and 121–143, with comments, docstrings and `theorem`→`lemma`
      normalised) occurs verbatim in U1's frozen scratch lines 2957–3229 (`05c24dda…`).
    - That scratch's first 2956 lines hash to `66db6c73…`.
    - The axiom literal is repaired: 3 of 26 declarations use all three axioms (`gkChildEdge_range`, `gkGraph_card_nonroot`,
      `gkGraph_isTree`), recounted from `axioms-all-declarations.txt`.
  - Verdict: **verified**.

**N4a — count bridge**

- **L2.1 · N4a · `gkHalfCount k m`** is `Σ_{i<m+1} C(k+1,i)·C(2(k+1−i), m−i) + Σ_{l<m} C(k,l)·C((k−l)+1, (m−l)−1)` with ℕ
  semantics.
  - Guards:
    - `m − i` is exact because `i ≤ m`.
    - `(m − l) − 1` is exact because `l + 1 ≤ m`.
    - `k + 1 − i` truncates only when `i > k+1`, and then `C(k+1,i) = 0`.
    - `k − l` truncates only when `l > k`, and then `C(k,l) = 0`.
  - Evidence: I implemented the literal ℕ semantics (truncated subtraction, `choose = 0` above the top). For every `k ≤ 40` and
    every `m ≤ 2k+11`:
    - it equals `[y^m]U` with `U = (1+3y+y²)^{k+1} + y(1+y)(1+2y)^k`;
    - it equals SR-C5-3's guarded form (`range(k+2)`/`range(k+1)`, filtered by `i ≤ m`/`l+1 ≤ m`), in 2132 cases each.
  - Verdict: **verified**. This judges the guarded form on its own terms, as the brief directs.
- **L2.2 · N4a · generic fibre count (144).**
  - Hypotheses:
    - `K`, `E` disjoint;
    - `K` independent and `E` independent;
    - every `w ∈ K` has exactly `d` neighbours in `E`;
    - no `v ∈ E` is adjacent to two distinct members of `K`.
  - Conclusion: `#{indep j-subsets of K ∪ E} = Σ_{i<j+1} C(|K|,i)·C(|E| − d·i, j − i)`.
  - Proof: fibre over `M = S ∩ K`. `S ↦ S \ M` is a bijection onto the `(j−|M|)`-subsets of
    `Fr(M) = {v ∈ E : no w ∈ M adjacent to v}`. `|Fr(M)| = |E| − d|M|`, because the sets `N(w) ∩ E` are pairwise disjoint and
    lie inside `E`. Fibres with `|M| > j` are empty. Then `Finset.sum_powerset_apply_card` finishes.
  - Every hypothesis enters: independence is used in the inverse map, `hd` and `hdisj` in `|Fr(M)|`, and disjointness in the
    `S ∩ K` computation.
  - ℕ: `|E| − d·i` is exact whenever `C(|K|,i) ≠ 0`, because `d·i ≤ |E|` for `i ≤ |K|`.
  - Verdict: **verified**. The argument is correct at statement level and the Lean text realises it.
- **L2.3 · N4a · erase-root bijection (145) and root-free rewrite (146).** Independent `(j+1)`-sets containing `v` correspond to
  independent `j`-sets of `{u ≠ v, ¬ v ~ u}`.
  - Verdict: **verified**.
- **L2.4 · N4a · `G_k` layer (151–173).**
  - `gkGraph_adj_iff_val_mod` holds.
  - Middles `{2} ∪ {b_i}` and ends `{1, 3, 4, a_i, c_i}`: there are `k+1` middles and `2k+3` ends, both sets independent. Each
    middle has exactly 2 end-neighbours, and no end sees two middles.
  - The non-neighbours of `0` are `{b_i} ∪ {3, 4, c_i}`, with `k` arm middles and `k+2` far leaves, both independent. Each arm
    middle has exactly 1 far-leaf neighbour, and no far leaf sees two arm middles.
  - Evidence: the evaluator checks each fact literally for `k ≤ 30`.
  - Verdict: **verified**.
- **L2.5 · N4a · root split (174, 175).**
  - `#{S ∌ 0, |S| = j} = Σ_{i≤j} C(k+1,i)·C(2k+3−2i, j−i)`.
  - `#{S ∋ 0, |S| = j+1} = Σ_{l≤j} C(k,l)·C(k+2−l, j−l)`.
  - ℕ: `2k+3−2i` truncates only when `i ≥ k+2`, where `C(k+1,i) = 0`. `k+2−l` truncates only when `C(k,l) = 0`.
  - Evidence: against the generic tree DP's root-out and root-in polynomials, for all `k ≤ 60` and `j ≤ α+3` (4087 cases each).
  - Verdict: **verified**.
- **L2.6 · N4a · Pascal assemblies (176, 177).** The root-free count at `j+1` is `A_{j+1} + A_j`, and the root-in count at size
  `j+1` is `B_{j+1} + B_j`, with `u = A + B`.
  - Evidence: literal ℕ semantics, `k ≤ 40`, `j ≤ 2k+9` (2050 cases each).
  - Verdict: **verified**.
- **L2.7 · N4a · the bridge (178, 179).** `i_{j+1} = u_{j+1} + u_j` for all `j`, and `i_0 = u_0 = 1`.
  - This is stated at `j+1` and at `0`, so no `j − 1` occurs.
  - Evidence:
    - literal ℕ `gkHalfCount` against the DP independence sequence, `k ≤ 40`, `j ≤ 2k+9` (2050 cases), which includes every
      `j` past `α`, where both sides are 0;
    - DP = closed form `(1+y)[(1+3y+y²)^{k+1} + y(1+y)(1+2y)^k]` for `k ≤ 60`;
    - DP = brute-force enumeration for `k ≤ 6`.
  - Verdict: **verified**.

**N4b — the inequality**

- **L2.8 · N4b · `mul_choose_le_choose_add_succ` (147).** `t·C(N,r) ≤ C(N+t, r+1)`, by induction on `t` with Pascal and
  `C(N+t,r) ≥ C(N,r)`.
  - Evidence: exact check for `N, r, t ≤ 60` (226,981 cases).
  - Verdict: **verified**.
- **L2.9 · N4b · closing step (148).** For `s + 3 ≤ N`, `C(2N,s+1) + C(N,s) ≤ C(2N,s+3)`.
  - Identity 1: `(s+3)(s+2)·C(2N,s+3) = (2N−s−1)(2N−s−2)·C(2N,s+1)`, from `C(n,t+1)(t+1) = C(n,t)(n−t)` applied twice.
  - Identity 2: with `a = 2N−s−2 ≥ s+4`, `(a+1)a − (s+3)(s+2) = (a−s−2)(a+s+3)`. Since `a−s−2 ≥ 2` and `a+s+3 = 2N+1`, this is
    `≥ 2(2N+1)`.
  - With `N·C(N,s) ≤ C(2N,s+1)` (L2.8 at `t = N`) and `(s+3)(s+2) ≤ N² ≤ 2N(2N+1)`, the chain closes.
  - Evidence: both identities and the inequality hold exactly for `N ≤ 160` and every `s ≤ N−3` (12,561 cases each). I also
    re-derived both identities by hand.
  - Verdict: **verified**.
- **L2.10 · N4b · `gkHalfCount_eq_sum_range` (149).** `u_m = Σ_{l≤m} T_l(m)`, with `T_l(m) = C(k+1,l)·C(2(k+1−l), m−l) +
  [l<m]·C(k,l)·C(k−l+1, m−l−1)`.
  - Evidence: `k ≤ 40`, all `m` (2132 cases).
  - Verdict: **verified**.
- **L2.11 · N4b · `gkHalfCount_le_gkHalfCount_add_two` (150).** `j + 2 ≤ k+1 → u_j ≤ u_{j+2}`.
  - Termwise, for `l ≤ j`, put `r = j − l` and `N = k+1−l`. Then `r + 2 ≤ N`, and `l ≤ k−1` gives `k−l+1 = N` exactly.
    - `r = 0`: `T_l(j) = C(k+1,l) ≤ C(k+1,l)·C(2N,2)`, since `N ≥ 2`.
    - `r ≥ 1`: `T_l(j) ≤ C(k+1,l)·[C(2N,r) + C(N,r−1)] ≤ C(k+1,l)·C(2N,r+2) ≤ T_l(j+2)`. This uses `C(k,l) ≤ C(k+1,l)` and L2.9
      at `s = r−1`, which is admissible because `s+3 = r+2 ≤ N`.
  - The terms `l = j+1, j+2` of `u_{j+2}` are `≥ 0`.
  - The chain covers **every** `j` with `0 ≤ j ≤ k−1`, including both ends. At `j = k−1`, `l = 0` gives `r+2 = N = k+1`, the
    equality case of the guard, which is admissible. At `j = 0` only the `r = 0` branch occurs.
  - Evidence: `u_j ≤ u_{j+2}` for `k ≤ 40` and every admissible `j` (820 cases). The termwise inequality with the Lean pairing:
    11,480 cases.
  - Verdict: **verified**.
- **L2.12 · N4b · disclosed deviation (iii).** The formalizer pairs the second-sum row `l` with the first-sum row `l`, where
  C-U1-F uses `l+1`, and closes with the integer inequality instead of `(3/2)^{M/2}`.
  - I judge it to be a **different but valid proof** of the node's unchanged statement. ADJ-U's allowance ("an integer
    induction replaces that step") covers it.
  - The binomial-row decomposition `Q^{k+1} = Σ C(k+1,i) y^i (1+y)^{2(k+1−i)}` and `y(1+y)(1+2y)^k = Σ C(k,l) y^{l+1}(1+y)^{k−l+1}`
    is C-U1-F's.
  - It changes no statement, no definition of record and no step's validity.
  - Verdict: **not a defect**.

**N4 — GK-MONO in Lean**

- **L2.13 · N4 · `gk_forwardDifference_nonneg` (180).** For `j ≤ k`, `0 ≤ Δ_j(G_k)` in ℤ.
  - `j = 0`: `Δ_0 = (u_1 + u_0) − u_0 = u_1 ≥ 0`.
  - `j = j'+1 ≤ k`: `Δ_j = (u_{j+1} + u_j) − (u_j + u_{j−1}) = u_{j+1} − u_{j−1} ≥ 0`, by L2.11 at `j' = j−1`, where
    `j'+2 = j+1 ≤ k+1`.
  - The ℕ identities are cast into ℤ (`push_cast`) before subtracting. The only subtraction is the ℤ one inside
    `forwardDifferenceDel`, so **no truncated ℕ subtraction enters the sign**.
  - Evidence:
    - `Δ_j ≥ 0` for `j ≤ k`, `k ≤ 60` (DP);
    - the bridge form of `Δ_j` equals the DP value, `k ≤ 40` (861 cases);
    - `8·Δ_{k+1} = −2^k(k²+3k−8)` for `k ≤ 60`.

    The last is a companion, not used and not formalized.
  - Verdict: **verified**. N4 is GK-MONO's lower half (`i_0 ≤ … ≤ i_{k+1}`) as a Lean lemma, as disclosure (iv) says.

**N2, N3 and the assembly**

- **L2.14 · N2 · `gk_crossing_lower_iff` (181).** `k+1 ≤ crossingIndex (gkGraph k) ↔ ∀ j ≤ k, ¬ Δ_j < 0`.
  - Proof: `Nat.le_find_iff` with `m < k+1 ↔ m ≤ k` by `omega`. Existence is the definition's own witness (L0.4).
  - The normalised body is byte-identical to C-U1-F's frozen `Corollary.lean`, with `theorem`→`lemma`.
  - Verdict: **verified**.
- **L2.15 · N3 · `gk_weightedHall_flow_of_crossing_lower` (182).** From `hx : k+1 ≤ x` and `hElig : x+2 ≤ p`, `omega` gives
  `k+3 ≤ p`. Then **carried lemma entry 110** is applied at `F = favorableLeaves (gkGraph k) p`, and the support conjunct is
  dropped.
  - `hF` is proved as `favorableLeaves ⊆ leafSet` by unfolding the filter (`Finset.mem_filter`, `hv.1`). This is C-U1-F's own
    `hsub` text. It is equivalent to `Finset.filter_subset`, but not literally that term.
  - The hypothesis `hLow` of C-U1-F's draft is dropped here, and the draft's call to the carried terminal theorem 113 is
    replaced by entry 110 (disclosure (v)).
  - Verdict: **verified**.
- **L2.16 · assembly (183).** The proof term is `refine ⟨gkGraph_isTree k, fun p hElig _hLow => ?_⟩` followed by
  `gk_weightedHall_flow_of_crossing_lower k p ((gk_crossing_lower_iff k).mpr fun j hj => not_lt.mpr
  (gk_forwardDifference_nonneg k j hj)) hElig`.
  - This is exactly `⟨N1, N3 (N2.mpr N4) hElig⟩`, as disclosure (vi) and the report state.
  - Hypotheses consumed: only `hElig`.
  - `hLow` is bound as `_hLow` and unused. The docstring, the contract (`hyp-low`: "UNUSED by the proof") and
    `INFORMAL-PROOF.md` §1 all say so.
  - The tree face is in the conclusion. Nothing else is asserted. The support conjunct is omitted, which the brief permits,
    and the omission is recorded.
  - Verdict: **verified**.
- **L2.17 · axioms and hygiene.**
  - The terminal theorem uses `[propext, Classical.choice, Quot.sound]`.
  - All 183 per-declaration lines use a subset of these three.
  - `Main.lean` has no `sorry`, no `native_decide`, no `axiom` line, no `set_option` command, no `decide` token, and no
    `unsafe`/`extern`/`implemented_by`. The two "admit" hits are the English word inside comments.
  - The new fragments reference no block-layer or chain entry (39–41, 81–86), no `highTailAggregateFromShadow` (carried,
    referenced nowhere), no terminal 113 and no `Polynomial` (the word occurs only in comments).
  - Verdict: **verified**.

## Reproduced Mathematical Evidence

I wrote my own evaluator from scratch and imported no prior evaluator. It is
`scratchpad/c5-s7-informal-LA1/evaluator.py` (SHA-256 `4e1a343911d68f6426cd738bda8ad92fccdfdb83cc597b7a1723355933c18cfe`).
- Standard library only; explicit imports `json`, `math`, `sys`, `collections.deque`.
- Exact integers; no wall-clock fields.
- Run with `python3 -B evaluator.py` in the foreground (about 2 s).
- Output `results.json` (SHA-256 `a1a23705831d83857f9befe32599cdee37e11cbd08cdb38e19deb1448fa1d2f2`). It is byte-identical on
  re-run.
- **`ALL_OK True`, 0 failures** over every check listed in `results.json` `check_counts`.

**Part A (`k ≤ 60`).**
- The literal `gkEdge` agrees with the constructive list (`k ≤ 12`). Every `G_k` is a tree.
- The generic tree DP equals the closed form `(1+y)[(1+3y+y²)^{k+1} + y(1+y)(1+2y)^k]`, and `α = 2k+3`.
- `x(G_k)` is the least `j` with `Δ_j < 0`, with zero extension and the terminal difference `Δ_α` included:
  - `x = k+1` for `k ≥ 2`, `x(G_1) = 3`, `x(G_0) = 2`;
  - `8·Δ_{k+1} = −2^k(k²+3k−8)`;
  - `Δ_j ≥ 0` for `j ≤ k`.
- Eligible window `{p : x+2 ≤ p, 3p < 2α+1}`: nonempty iff `k ≥ 3`, and then equal to `[k+3, ⌊2α/3⌋]`.
- For `k ≤ 40`: the literal `gkHalfCount` equals the bridge's `u_m` and SR-C5-3's form for every `m`. The bridge
  `i_{j+1} = u_{j+1} + u_j` and `i_0 = u_0` holds for every `j`, and so do both Pascal assemblies.
- The root-split sums agree with the DP's root-in and root-out polynomials (`k ≤ 60`).
- N4b holds, including termwise with the Lean pairing.

**Part B.** The two binomial identities and the closing inequality hold for `N ≤ 160`, together with `N·C(N,s) ≤ C(2N,s+1)` and
`t·C(N,r) ≤ C(N+t,r+1)` for `N, r, t ≤ 60`. For information only, the closing inequality fails just outside its guard, for
example at `N = 2, s = 0`: `C(4,1) + C(2,0) = 5 > C(4,3) = 4`. So the guard `s + 3 ≤ N` is load-bearing, and L2.11 respects it.

**Part C (composition).**
- For `k = 3, 4, 5, 6` and every eligible `p`, I built the literal deletion-only network at `F = F_p(G_k)`:
  - `F_p` is derived from `IsFavorableAt`, i.e. `i_{p+1}(G−v) − i_p(G−v) < 0` by brute force.
  - Weights are `activeWeight`, counting `v ∈ F ∩ B` with `(B \ {v}) ∩ W_v ≠ ∅`.
  - Arcs are `B → B \ {q}`.
- I ran my own Dinic max-flow. `S` is computed from two independent sides: `supply − capacity`, and the literal
  `C5LA1.aggregate` formula `Σ_{v∈F} [Δ_{p−1}(G−H_v) − Δ_{p−1}(G−R_v)]`.

| k | n | p | F_p | supply | capacity | max-flow (deletion only) | S (both sides) |
|---|---|---|---|---|---|---|---|
| 3 | 14 | 6 | all 6 leaves | 253 | 527 | 253 | −274 |
| 4 | 17 | 7 | all 7 | 1542 | 2735 | 1542 | −1193 |
| 5 | 20 | 8 | all 8 | 8875 | 14196 | 8875 | −5321 |
| 6 | 23 | 9 | all 9 | 49422 | 73573 | 49422 | −24151 |
| 6 | 23 | 10 | all 9 | 23001 | 49422 | 23001 | −26421 |

- Every network saturates.
- The rows at `p = k+3` equal `CF-REPLAY-c4c.json` (253/527/−274, 1542/2735/−1193, 8875/14196/−5321), and so do the source and
  target counts (70/210, 425/1031, 2400/5060).
- Extra, beyond the brief: for `k = 3, 4` and every `p ∈ [k+3, α]`, which is entry 110's rank scope, the deletion-only network
  saturates too.
- These computations corroborate the proof. They do not replace it.

## Independent Critic Pass

I ran a separate adversarial pass over the ledger, attacking each closed row with the question "what would make this false as
stated?"

1. **Vacuity.**
   - For `k ≤ 2` the second conjunct is vacuous: the eligible set is empty, with `x = 2, 3, 3` and `α = 3, 5, 7`. The tree face
     is not vacuous.
   - For `k ≥ 3` the eligible window is nonempty (Part A). The face says this informally (SR-C4-8) and does not claim it in
     Lean.
   - The theorem therefore neither overstates nor hides vacuity. **Holds.**
2. **Existence side of `Nat.find`.** An award proof could smuggle in an unproved existence claim, but here the witness is
   inside the carried definition of record (L0.4). N2 uses `Nat.le_find_iff`, which is witness-independent. **Holds.**
   Observation O-1 below.
3. **ℕ truncation anywhere in the sign.** I traced every subtraction:
   - in `gkHalfCount`, 174, 175, 176, 177, 144, 150 and 148 (`a` is introduced by `obtain` with an `omega` witness);
   - in `gkParentVal`;
   - in the `crossingIndex` witness proof (ℤ).

   Each one is either guarded by a range or a branch, or sits where the other factor is `0`. The sign of `Δ_j` is taken in ℤ
   after casting. **Holds.**
4. **The ends of N4b's range.** `j = k−1` reaches the equality case `r + 2 = N` of the closing guard, which is admissible.
   `j = 0` needs only `r = 0`, and `N ≥ 2` holds there. `m = 1` (`Δ_0`) is handled separately as `u_1 ≥ 0`. **Holds.**
5. **N3 calls a re-proof or the carried terminal theorem.** It does neither. It calls entry 110, byte-identical to C4-LA1's
   kernel-verified lemma. Entry 113 is absent from `Main.lean`. **Holds.**
6. **Hidden hypothesis or shadowed name.** `Main.lean` defines no local `IsTree` or `indepNum`. The contract binds
   `SimpleGraph.IsTree` and `SimpleGraph.indepNum` at the pinned Mathlib (`IsTree` is the structure `connected`/`isAcyclic`).
   The terminal binders are exactly `k`, `p`, `hElig`, `hLow`. **Holds.**
7. **Scope creep in the conclusion.** The conclusion asserts only a saturating flow on the charter network with
   `transportRel = (D) ∪ (S)`. It asserts no support conjunct and nothing about switch arcs. The "deletion-supported flows"
   fence describes the flow of provenance (entry 110), not a claimed conjunct. **Holds.**
8. **Deviation (i): fibre count instead of the block layer.** This is a disclosed change of *proof route* only. The node
   statement and definitions are unchanged, and my check (L2.2–L2.7) confirms the route. **Not a defect.**
9. **Deviation (iii).** See L2.12. **Not a defect.**
10. **A count mismatch that the prose could mask.** I recomputed everything (Parts A–C) independently of the formalizer's
    `DRAFTS/check_halfcount.py`, which I did not run or import. **Holds.**

**Observations (non-blocking; they change no statement, definition or step).**
- **O-1.** `INFORMAL-PROOF.md` §1 and N2 cite `crossingIndex` as `Nat.find` but do not say where the existence proof comes
  from. It is the definition's embedded witness `j = α`. A one-line sentence would complete the statement-level record.
- **O-2.** The formalizer brief says `hF = Finset.filter_subset`. The Lean proof proves the same subset by unfolding the filter
  (C-U1-F's `hsub`). This is equivalent and immaterial.
- **O-3.** The brief's numbering lists "144–179 N4a, 147–150 N4b", so the ranges overlap. The report's split (N4a = 144–146 and
  151–179; N4b = 147–150) is the accurate one. `INFORMAL-PROOF.md` §6 groups 144–182 together. This is cosmetic.
- **O-4.** `INFORMAL-PROOF.md` §3 says `check_halfcount.py` covers "all `j`"; the report says `j ≤ α+2`. This concerns a check,
  not the proof.

## Scope and Fence Check

The fences and excluded conclusions of the synthesis's C5-LA1 and the brief §2 were checked against the contract's
`informal_statement` and `conclusion`, the terminal docstring and comment, and `INFORMAL-PROOF.md` §§1, 2 and 5:
- **`G_k` only.** The only graph is `gkGraph k`.
- **Deletion-supported flows.** The flow is C4-LA1's entry 110. The support conjunct is omitted from the conclusion, and that
  omission is recorded.
- **Not (HALL) at full scope; not "every tree"; not an RTree statement.** Stated on the face. No universally quantified graph
  appears.
- **Nothing on the primary aggregate beyond `G_k`.** None is asserted. `aggregate` appears only in carried lemmas.
- **Not the strict GK-SIGN.** Stated. The award asserts only `Δ_j ≥ 0`, as a companion.
- **Not a second family for ruling 39.** Stated, consistent with CF6-6.
- **The `k = 3` row.** `n = 14`, `p = 6` lies in the closed band `n ≤ 2p+2`. The face says it is covered without re-proving that
  band.
- **Switch arcs and status changes.** No statement about switch arcs or cuts. No status change of (HALL), the primary aggregate
  or any refuted key.
- **GK-MONO.** It is a companion. The contract "asserts no grade for any companion". `INFORMAL-PROOF.md` §4 records the synthesis
  instruction that GK-MONO registers `proved_informal` unless the controller rules otherwise, and it asserts no grade itself.
  N4 is identified as GK-MONO in Lean. **The award's claim is the terminal theorem alone.**
- **Companions stated, not claimed.** `x(G_k) = k+1`, `8Δ_{k+1} = −2^k(k²+3k−8)` and `indepNum = 2k+3` are named as not
  formalized.

**Attribution.** The brief §2 attribution travels on both `INFORMAL-PROOF.md` §5 and the contract's scope text:
- GK-MONO → `C-U1-T` and `C-U1-F`;
- the reduction → `C-U1-F`;
- `gkGraph_isTree` → U1 (Claude Sonnet 5);
- the composition and DAG → the Cycle 5 U adjudicator;
- the flow → C4-LA1 (CT-1 by `C-F2-T`, R2′ by the Cycle 4 F adjudicator);
- the definitions → the first-interior run (Codex; entries 1–18 incl. entry 14) and C1-LA1/C1-LA2;
- the mechanism → Codex GPT-6;
- r29 high tail: not used.

The formalizer's own contributions (fibre count, re-pairing, integer closing step, assembly) are attributed to the formalizer.
`INFORMAL-PROOF.md` §4 states C-U1-T's Newton proof faithfully to the frozen critique, and states that Lean follows C-U1-F's
route. **Pass.**

**Disclosures (this audit).**
- *Read boundary.*
  - I read only authorized items: the run files listed in the brief §1, the capsule manifest and the named members, the
    formalizer brief, SOLUTION-CONTRACT §2, CF-REPLAY-c4c, CF6-6, and the frozen U1 `Main.lean` and C-U1-F `Corollary.lean`.
  - Above the literal grant, names only:
    - `ls` of the Lean run root showed the names `SOURCE/`, `FIDELITY-REVIEW.md`, `VERIFICATION-REPORT.md`,
      `LOOP-STATE.*` and `.sandbox-*`, none opened;
    - `ls` of `sources/c5-stage7-sources/` showed other seats' folder names;
    - `ls` of `scratchpad/` showed other scratch folder names;
    - hashing the four authorized seats' `SOURCE-DIGESTS.json` entries printed one other seat's path (`T2/alias_check.py`)
      as metadata.
  - **One content read beyond the literal grant:** to cross-check the carry table, my script byte-compared the 15 first-interior
    `Snippets/` fragments whose names match registered entries (the grant names only fragment 0014 and that run's state). Only
    equality booleans were printed.
  - I did not open `SEMANTIC-CONTRACT.md`, the origins' `VERIFICATION-REPORT.json`, or any second read, other return, critique
    or adjudication beyond the named sections.
- *Hygiene.*
  - No Lean build, no `lake`/`lean`/`elan` command, no network, no installs, no background jobs.
  - `python3 -B` everywhere.
  - Writes only under `scratchpad/c5-s7-informal-LA1/`: `evaluator.py`, `results.json` and this file.
  - Mathlib was read with `grep` inside the pinned package directory only.
- *Host context.* The project `CLAUDE.md` and the user memory index were host-injected. Following the brief's write boundary,
  no conversation log was written.

## Verdict

passed

Every node N0–N4 and the assembly of `INFORMAL-PROOF.md` is a correct proof of the contract's `informal_statement` at
statement-level granularity:
- The count bridge holds as stated in ℕ with the guarded ranges.
- The N4b chain and its integer closing step are valid over the full range, including both ends.
- The sign is taken in ℤ.
- N2 rests on the definition's own `Nat.find` witness.
- N3 calls carried lemma entry 110.
- The terminal term consumes only `hElig`, and `hLow` is unused as stated.
- Carried entries are byte-identical by origin award.
- The claim asserts nothing fenced.

Observations O-1 to O-4 are non-blocking. No defective step was found.

Model disclosure: chartered Claude Opus 5.5 (effort high, dispatch-record authority); runtime-reported model id
`claude-opus-5-5[1m]`.
