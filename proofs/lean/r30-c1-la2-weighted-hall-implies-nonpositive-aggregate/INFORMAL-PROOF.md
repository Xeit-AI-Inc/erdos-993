# Informal proof — C1-LA2: weighted Hall at the fixed selector implies a nonpositive aggregate

- Award group: `C1-LA2` (Cycle 1 Stage 7, r30; canonical run id `erdos-993-math-dre-20260926-r30-weighted-transport`).
- Lean run: `lean-2026-09-26-c1-la2-weighted-hall-implies-nonpositive-aggregate`.
- Proposed key: `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (predicate form). **STATED** (first
  compiled as one declaration by critic C-U2-T). It registers `formally_verified` only after an isolated second read AND this
  award's governed close. Nothing in this file is a grade.
- Author of this write-up: the Stage 7 formalizer, producer id `c1-la2-formalizer-opus-20260926`. Model: Claude Opus 5.5
  (chartered, dispatch-record authority); runtime-reported model id `claude-opus-5-5[1m]`.

## 1. The statement

Lean (namespace `E993Transport`, under `variable {V : Type*} [Fintype V] [DecidableEq V]`, `open scoped Classical`):

```lean
theorem aggregate_nonpos_of_weightedHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (hp : 1 ≤ p) (h : WeightedHall G (favorableLeaves G p) p) :
    C5LA1.aggregate G p ≤ 0
```

Prose. Let `G` be a finite simple graph on a finite vertex type `V` and let `p ≥ 1`. Let `F = F_p(G)` be the fixed original
strict selector (the original leaves `v` with `Δ_p(G − v) < 0`). If the weighted Hall condition (HALL-COND) holds for the
network at rank `p` with tag set `F` — for **every** subfamily `X ⊆ I_{p+1}(G)`,
`Σ_{B ∈ X} w_F(B) ≤ Σ_{A ∈ N(X)} w_F(A)` — then the aggregate `S(G, p) = C5LA1.aggregate G p` is `≤ 0`.

Scope: every finite simple graph. No `IsTree`, no eligibility hypothesis, no connectivity.

## 2. Definitions (prose ↔ Lean)

Definitions of record (carried byte-identically, first-interior entries 1–6, 8–13, 18; Lean governs):
- `C4LA1.IsGraphLeaf G v := ∃! u, G.Adj v u` — an original degree-one vertex.
- `C5LA1.support G v` — its unique neighbour `s_v` (by `Classical.choose`; unconstrained off the leaf set).
- `C5LA1.leafSet G` — the original leaves; `C4LA1.IsFavorableAt G v p := Δ_p(G − v) < 0` (strict, at the original rank `p`),
  through `C4LA1.vertexDeletionIndepSetCount` / `C4LA1.vertexDeletionForwardDifference`.
- `C5LA1.H G v = {v, s_v}`, `C5LA1.R G v = insert s_v (N(s_v))`; `C5LA1.indepSetsAvoiding G D k`, `C5LA1.indepSetCount G D k`
  (`i_k(G − D)` on the original carrier), `C5LA1.forwardDifferenceDel G D k = i_{k+1}(G − D) − i_k(G − D)` in `ℤ`.
- `C5LA1.aggregate G p = Σ_{v ∈ leafSet, IsFavorableAt G v p} (Δ_{p−1}(G − H_v) − Δ_{p−1}(G − R_v))` (ℤ; `p − 1` in ℕ).
- `E993Interior.taggedFamily G U W k` — the `k`-subsets of `U`, independent in `G`, meeting `W` (proof-only dependency).

New transport definitions (`E993Transport`, the frozen text of the brief §2, identical to U2's compiled text):
- `indepFamily G j` = `I_j(G)`, the independent `j`-subsets of `V`.
- `tagWitnesses G v` = `W_v = N(s_v) ∖ {v}`.
- `activeWeight G F B` = `w_F(B) = #{v ∈ F ∩ B : (B ∖ {v}) ∩ W_v ≠ ∅}` — counts ACTIVE tags only, never `|F ∩ B|`. (Erratum
  R30-E-b: the informal reading is "`B` contains another neighbour of `s_v`", never the always-true `B ∩ N(s_v) ≠ ∅`.)
- `layerWeight G F j = Σ_{B ∈ I_j} w_F(B)`.
- `favorableLeaves G p` = `F_p(G)`, the same filter as inside `C5LA1.aggregate` (the terms agree definitionally).
- `transportRel G B A` = (D) `∃ q ∈ B, A = B ∖ {q}` ∨ (S) `∃ u, u ∉ B ∧ |N(u) ∩ B| = 2 ∧ A = (B ∖ N(u)) ∪ {u}` — literally
  (D) ∪ (S), exactly two neighbours, `u ∉ B`; neither wider nor narrower.
- `IsSaturatingFlow G F p f`: `f : Finset V → Finset V → ℕ` is positive only on `(B, A)` with `B ∈ I_{p+1}`, `A ∈ I_p`,
  `transportRel G B A`; every source row sums to `w_F(B)`; every target column sums to `≤ w_F(A)`.
- `WeightedHall G F p`: for every `X ⊆ I_{p+1}`, `Σ_X w_F ≤ Σ_{A ∈ I_p, ∃ B ∈ X, transportRel G B A} w_F(A)`.

## 3. Proof (statement-level steps; every hypothesis named where it enters)

**Step 1 — the tagging bijection (`card_active_eq_tagged`).** Fix `v` with `IsGraphLeaf G v` (degree one) and `j ≥ 1`. The map
`B ↦ B ∖ {v}` is a bijection from `{B ∈ I_j : v ∈ B, (B ∖ {v}) ∩ W_v ≠ ∅}` onto `taggedFamily G (V ∖ H_v) R_v (j − 1)`, with
inverse `A ↦ A ∪ {v}`.
- Forward: `v ∈ B` and `s_v ~ v` (the unique support, `Leaf.support_adj`, which uses `IsGraphLeaf G v`) force `s_v ∉ B`; so
  `B ∖ {v}` avoids `H_v`, is independent, has `j − 1` elements (`|B| = j`, `v ∈ B`), and meets `R_v` because it meets
  `W_v ⊆ R_v` (`tagWitnesses_subset_R`).
- Backward: `A` avoids `H_v`, so `v, s_v ∉ A`; `A ∪ {v}` is independent because `N(v) = {s_v}` (degree one; carried
  `Leaf.leaf_insert_indep`) and has `j` elements because `v ∉ A` and `(j − 1) + 1 = j` — **this is where `j ≥ 1` enters**. It is
  active: `A` meets `R_v` at some `w ≠ v, s_v` (both excluded from `A`), and `R_v ∖ {s_v} ⊆ N(s_v)`, so `w ∈ W_v`.

**Step 2 — double counting (`layerWeight_eq_sum_card`).** `w_F(B) = Σ_{v ∈ F} [v ∈ B ∧ v active in B]`; exchange the two
finite sums (finiteness `[Fintype V]`). No hypothesis on `F`.

**Step 3 — (WID) general form (`layerWeight_sub_eq_sum`).** For `F` consisting of degree-one vertices (`hF`) and `p ≥ 1`
(`hp`): by Steps 1–2 at `j = p + 1` and `j = p` (the latter needs `hp`), `layerWeight(p+1) − layerWeight(p) =
Σ_{v ∈ F} (q_v(p) − q_v(p − 1))` with `q_v(k) = |taggedFamily G (V ∖ H_v) R_v k|`. The carried identity of record
`Leaf.tagged_count_split` (for `H_v ⊆ R_v`, `Leaf.H_subset_R`, which uses degree one) gives
`i_k(G − H_v) = q_v(k) + i_k(G − R_v)`, so `q_v(p) − q_v(p − 1) = Δ_{p−1}(G − H_v) − Δ_{p−1}(G − R_v)` once
`(p − 1) + 1 = p` — **the second place `hp` enters** (ℕ subtraction). At `j = p + 1`, `(p + 1) − 1 = p` holds for every `p`.
`hp` is load-bearing for this general form: `K_{1,3}`, `p = 0`, gives `0` against `6` (synthesis R2).

**Step 4 — (WID) at the fixed selector (`activeWeightAggregateIdentity`).** Take `F = F_p(G)`; every member is an original
leaf (`isGraphLeaf_of_mem_favorableLeaves`, from `favorableLeaves ⊆ leafSet`). The right side of Step 3 is then literally
`C5LA1.aggregate G p`: after unfolding, both are the same sum over the same filter with the same (classical) decidability
instance, closed by the kernel-accepted `rfl` (node N8; no filter-congruence step was needed). So
`supply − capacity = layerWeight(p+1) − layerWeight(p) = S(G, p)`.

**Step 5 — FLOW⇒SIGN (`aggregate_nonpos_of_saturatingFlow`).** Given a saturating flow `f` at `F = F_p(G)`:
`layerWeight(p+1) = Σ_{B ∈ I_{p+1}} Σ_{A ∈ I_p} f(B, A)` (saturation, row sums) `= Σ_{A ∈ I_p} Σ_B f(B, A)` (exchange of
finite sums) `≤ Σ_{A ∈ I_p} w_F(A) = layerWeight(p)` (capacities). Cast to ℤ (monotone) and apply Step 4 (uses `hp`):
`S(G, p) = layerWeight(p+1) − layerWeight(p) ≤ 0`. The relation `transportRel` is never used here (the support clause of the
flow is discarded).

**Step 6 — clone counting (`card_sigma_fiber_filter`).** For `w : ι → ℕ` on a finite type and `S ⊆ ι`, the clones
`Σ i, Fin (w i)` with base in `S` number `Σ_{i ∈ S} w i` (`Finset.card_sigma`).

**Step 7 — HALL⇒FLOW (`exists_saturatingFlow_of_weightedHall`).** For ANY `F` and `p`. Put `wSrc(B) = w_F(B)` if
`B ∈ I_{p+1}` else `0`; `wTgt(A) = w_F(A)` if `A ∈ I_p` else `0`. Clone sets `α = Σ B, Fin (wSrc B)`,
`β = Σ A, Fin (wTgt A)` (finite: `[Fintype V]`); relate clones iff their bases satisfy `transportRel`. For a finite set `A'` of
source clones with base set `X ⊆ I_{p+1}` (positive clone count forces membership):
`|A'| ≤ Σ_X wSrc = Σ_X w_F ≤ Σ_{N(X)} w_F` (**(HALL-COND) at this `X`**) `= #{target clones related to some member of A'}`
(Step 6; positive clone count forces `A ∈ I_p`). Hall's marriage theorem
(`Fintype.all_card_le_filter_rel_iff_exists_injective`, pinned `Mathlib/Combinatorics/Hall/Basic.lean:196`) gives an injection
`φ : α → β` with every clone related to its image. Define `f(B, A) = #{x ∈ α : base x = B, base (φ x) = A}`. Then: positive
`f(B, A)` exhibits a clone, so `B ∈ I_{p+1}`, `A ∈ I_p`, `transportRel G B A`; row sums are the fibre decomposition of the
`wSrc(B) = w_F(B)` clones of `B`; column sums are at most the `wTgt(A) = w_F(A)` clones of `A` by injectivity of `φ`. The flow is
integral by construction.

**Step 8 — the terminal theorem (`aggregate_nonpos_of_weightedHall`).** Step 7 at `F = F_p(G)` gives a saturating flow;
Step 5 (with `hp`) gives `S(G, p) ≤ 0`. (Composition; body carried from C-U2-T.)

**Where the Hall hypothesis is used.** The hypothesis is (HALL-COND) for EVERY `X ⊆ I_{p+1}`. The conclusion depends on it
only at `X = I_{p+1}`: that instance reads `layerWeight(p+1) ≤ Σ_{N(I_{p+1})} w_F ≤ layerWeight(p)` (weights are ℕ, `N(I_{p+1})
⊆ I_p`), and Step 4 finishes. The Lean proof of record follows the award's architecture (compose HALL⇒FLOW, which consumes
every `X` inside Hall's theorem, with FLOW⇒SIGN, which uses only the saturated totals); the mathematical dependence on
(HALL-COND) is through the whole-layer instance alone. The converse `S(G, p) ≤ 0 ⇒ WeightedHall G (F_p G) p` is false as a
statement and is NOT asserted: (HALL-COND) is strictly stronger as a statement than `S ≤ 0` (synthesis R5 — the subfamily
quantifier, and unreachable positive-weight capacity at the whole-layer cut on exhibited eligible rows); no instance separating
them in truth value is known, and this award asserts or refutes no instance of either side.

## 4. Companions on the face (each a `lemma`; no certificate of its own, R29-N-12)

- C1-LA1 chain: `isGraphLeaf_of_mem_favorableLeaves`, `tagWitnesses_subset_R`, `card_active_eq_tagged`,
  `layerWeight_eq_sum_card`, `layerWeight_sub_eq_sum`, `activeWeightAggregateIdentity` (C1-LA1's terminal statement, restated
  here as a `lemma`).
- `aggregate_nonpos_of_saturatingFlow` (FLOW⇒SIGN), `card_sigma_fiber_filter`, `exists_saturatingFlow_of_weightedHall`
  (HALL⇒FLOW).
- Critic-derived (register only `proved_informal`): `transportRel_mem_indepFamily` (both arc types of (D) ∪ (S) land in `I_p`:
  a deletion drops one element; a switch removes the exactly two neighbours of `u ∉ B` in `B` and adds `u`, giving
  `(p + 1) − 2 + 1 = p` elements, independent because `u`'s neighbours were removed), `weightedHall_of_saturatingFlow`
  (FLOW⇒HALL: for `X`, `Σ_X w_F = Σ_X Σ_{N(X)} f ≤ Σ_{N(X)} Σ_{I_{p+1}} f ≤ Σ_{N(X)} w_F`, using the support clause),
  `weightedHall_iff_exists_saturatingFlow` (the iff). Attribution: C-U2-T and C-U2-F (both compiled equivalent versions; the
  C-U2-T text is the one carried).

Documented equivalence (repair 9). C-U2-T's `CriticContract.lean` (SOLUTION-CONTRACT §2 draft definitions transcribed verbatim
under `noncomputable section`, plus the draft's implicit-`{G}` binder for `layerWeight_sub_eq_sum`) was re-compiled against this
run's declarations unchanged (`EVIDENCE/contract-equivalence-check.log`, exit 0): `indepFamily`, `tagWitnesses`,
`activeWeight`, `layerWeight`, `favorableLeaves`, `transportRel` agree with the draft (by `rfl`, `Iff.rfl` or `congr`), and the
draft binder texts of `layerWeight_sub_eq_sum`, `activeWeightAggregateIdentity`, `aggregate_nonpos_of_saturatingFlow` and
`exists_saturatingFlow_of_weightedHall` are discharged by this run's declarations. The explicit `G` binder of
`layerWeight_sub_eq_sum` is the frozen phrasing (repair 5).

## 5. Hypotheses audit

- Finiteness: `[Fintype V]` (every `Finset.univ`, `powersetCard`, the clone types). `[DecidableEq V]`, `[DecidableRel G.Adj]`
  for the `Finset` computations; other decidability is classical (`open scoped Classical`), as compiled.
- `hp : 1 ≤ p`: enters in Step 3 (`j = p` in Step 1 needs `j ≥ 1`; `(p − 1) + 1 = p`) and through Step 4 into Step 5 and the
  terminal theorem. For the terminal statement itself it is mathematically dispensable (`F_0(G) = ∅`, so `S(G, 0) = 0`; compiled
  by C-U2-F as `activeWeightAggregateIdentity_unguarded`, not carried); it is kept as frozen.
- Degree-one tags and their unique supports: Steps 1, 3, 4 (`IsGraphLeaf`; `Leaf.support_adj`, `Leaf.leaf_insert_indep`,
  `Leaf.H_subset_R`). Every member of `F_p(G)` is an original leaf.
- `IsTree`: does not enter anywhere.
- The literal relation cases: (D) and (S) enter only `transportRel_mem_indepFamily` (case analysis). Steps 5, 7, 8 treat
  `transportRel` as an abstract relation.

## 6. ℕ/ℤ cast audit

- `layerWeight`, `activeWeight`, flows and Hall sums are ℕ; (HALL-COND) and the flow conditions are ℕ inequalities without
  subtraction.
- `C5LA1.aggregate` and `forwardDifferenceDel` are ℤ; the layer weights enter as `(layerWeight … : ℤ)`; Step 5 casts
  `layerWeight(p+1) ≤ layerWeight(p)` with `Nat.cast_le`.
- ℕ subtraction: `p − 1` (inside `aggregate`, guarded by `hp`: for `p ≥ 1` it is the integer `p − 1`); `j − 1` in Step 1
  (guarded by `j ≥ 1`); `(p + 1) − 1 = p` holds in ℕ for every `p`. No other truncated subtraction occurs.

## 7. Fences and excluded conclusions

- Graph-generic; `F` fixed at rank `p`; `activeWeight` counts active tags via `B.erase v` against `tagWitnesses G v`, never
  `|F ∩ B|`; `transportRel` is (D) ∪ (S) literally.
- Excluded: (HALL) itself; any tree or eligible-row instance of (HALL-COND); the primary aggregate
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`; the sign of `S` beyond this implication; any census value; any
  statement in the governed-model (rooted-tree) wording; the TREE, FOREST and TRANSFER programme keys and the parent problem.
  The aggregate key moves only if a future (HALL) award composes with this implication.

## 8. Attribution

The active-tag weight, the mechanism and its corrections: Codex (GPT-6 Astra/Sol/Luna), lower-region run. Definitions of record
entries 1–18 and 42: the first-interior run (Codex), on the r24/r25/r26 definition layers (`C4LA1`, `C5LA1`). The informal
proof: r30 F2 (Claude Sonnet 5). The Lean proofs: r30 U2 (Claude Sonnet 5). Companions and fidelity findings: C-U2-T, C-U2-F,
C-F2-T, C-F2-U (Claude Opus 5.5); C-U2-T and C-U2-F for the converse, the iff and the layer closure; the terminal composition
first compiled by C-U2-T. Reconciliation: the T/F/U adjudicators and the synthesis (Claude Opus 5.5). Stage 7 transport and
repairs: this formalizer.

## 9. Carry table (provenance of every declaration; nothing re-derived)

Carry files verified against `sources/c1-stage7-sources/SOURCE-DIGESTS.json` before transport:
`U2-Main.lean` `110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743`;
`C-U2-T-CriticAdvance.lean` `85725e398df69ed33a255e7d5fda30d8768c6fab6d5d71ee3aa280673656506a`;
`C-U2-T-CriticContract.lean` `a6b20f8dc0b545677e439401cf36559dd2d46c4253f74c594c6c77af6599ce82` (equivalence check only).
"Decl sha" is the SHA-256 of the declaration text (docstring through proof) in the carry file; "edit" lists the only change.

| run entry | declaration | origin (lines) | decl sha (source) | edit |
|---|---|---|---|---|
| 1–13 | `C4LA1.*`, `C5LA1.*`, `E993Interior.taggedFamily` (first-interior 1–6, 8–13, 18) | frozen first-interior fragments | see `CAPSULE-VERIFICATION.json` | none (byte-identical) |
| 14–21 | `E993Transport.indepFamily` … `WeightedHall` | brief §2 frozen text = U2 `Main.lean` 1505–1555 compiled text | — | docstrings omitted; `noncomputable` on its own line (U2 layout) |
| 22 | `E993Interior.highTailAggregateFromShadow` (with private `Leaf.*`) | first-interior entry 42 | `972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d` | none |
| 23 | `isGraphLeaf_of_mem_favorableLeaves` | U2-Main 1534–1537 | `1c4f089b131d7ebe20a5d31d10a75983025f8a9bf4aacf3955b81eeb8a943aac` | none |
| 24 | `tagWitnesses_subset_R` | U2-Main 1566–1569 | `5103db65ec0e466f7695581eb3b3fe12ce5b7c87317e48774e40f7139746d953` | none |
| 25 | `card_active_eq_tagged` | U2-Main 1571–1645 | `11e521650950c52bb4dc4f173e5d5e8c5ed706ee60d153903ea77373478c6ef8` | none |
| 26 | `layerWeight_eq_sum_card` | U2-Main 1655–1677 | `7cfd168db4d3ed95364f4c8e450291821984110190f67ccb93a843ab7d947525` | none |
| 27 | `layerWeight_sub_eq_sum` | U2-Main 1679–1706 | `0cd2d3e4ebe608888f0ef3454abaf2ba42cfca70c8691561881572510732bb21` | `theorem`→`lemma`; unused `hpk2` (`have` and simp argument) removed |
| 28 | `activeWeightAggregateIdentity` | U2-Main 1708–1718 | `058e09af4e48185ef22c0cb309d3541caa5b68a844e42d4686303fd8e6d5d186` | `theorem`→`lemma` |
| 29 | `aggregate_nonpos_of_saturatingFlow` | U2-Main 1720–1744 | `f6a113465f7ad8b621d43958c6cd51dcd423fe77de58865f2269aa1b5c0087ee` | none |
| 30 | `card_sigma_fiber_filter` | U2-Main 1753–1766 | `c71c2d17e42b10a4a2e5837e0dcddfe12ffa2c777c7cd2c88a5b0a0c8e6bbd74` | none |
| 31 | `exists_saturatingFlow_of_weightedHall` | U2-Main 1775–1900 | `0f8e2b81a4132dacb8058de852ee3e4b8ebd57f51d179c9086f42598c7d7da69` | `theorem`→`lemma` |
| 32 | `transportRel_mem_indepFamily` (critic) | C-U2-T-CriticAdvance 7–31 | `98b54add073fdfd79e7844562490db61d0a124a74996f9a802ef64b4499eb0e7` | none |
| 33 | `weightedHall_of_saturatingFlow` (critic) | C-U2-T-CriticAdvance 33–54 | `0f81957363d95a54826b4868272a5920fb7c773be3b52ea5d51d8dd635d3f014` | none |
| 34 | `weightedHall_iff_exists_saturatingFlow` (critic) | C-U2-T-CriticAdvance 56–60 | `d0140ac048a906a14a64548da0d56d7d07110b574735e738c9fa258999469d9a` | `theorem`→`lemma` |
| 35 | `aggregate_nonpos_of_weightedHall` (terminal; critic-first) | C-U2-T-CriticAdvance 62–66 | `cfa5d84ae8b17d960370fbd6dc942faa62fdc2ce8a80df498e90689552c71dfe` | `lemma`→`theorem`; statement line-broken to the brief §2 layout |

Namespace wrappers, `open` lines and `variable` lines mirror the carry-file block each declaration came from; they are not bodies.
Registrar fragment digests of every entry are in `FORMALIZATION-STATE.json` and `FORMALIZER-REPORT.md`.
