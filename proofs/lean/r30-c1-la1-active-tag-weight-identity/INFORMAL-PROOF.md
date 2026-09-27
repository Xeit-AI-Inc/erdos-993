# INFORMAL PROOF — C1-LA1 (WID), `E993Transport.activeWeightAggregateIdentity`

Run: `erdos-993-math-dre-20260926-r30-weighted-transport` (r30), Cycle 1, Stage 7, award group `C1-LA1`.
Lean run root: `runs/lean-2026-09-26-c1-la1-active-tag-weight-identity`. Producer: `c1-la1-formalizer-opus-20260926`
(chartered Claude Opus 5.5, effort high; runtime-reported model id `claude-opus-5-5[1m]`).
Key: `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (WID). This document is statement-level; it makes no grade claim.
The key moves OPEN → VERIFIED `formally_verified` only on this award's governed close (informal audit, kernel receipt and
fidelity receipt all passing). Companion lemmas carry no certificate of their own (R29-N-12).

## 0. Provenance of this proof

- The mathematics is r30 F2's statement-level proof of (WID) (Claude Sonnet 5), adjudicated by the T, F and U adjudicators
  (Claude Opus 5.5) and recorded in the synthesis (`## Exact established results`, P1). The proof of record is the one
  SEMANTIC-CONTRACT §1.2 states (the bijection `B ↦ B ∖ {v}`, summed over `F`).
- The Lean proofs are r30 U2's (Claude Sonnet 5), carried from the frozen `sources/c1-stage7-sources/U2-Main.lean`
  (SHA-256 `110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743`). Every step below names the Lean declaration
  that realises it. Nothing in this document is new mathematics by the formalizer.
- The active-tag weight, the transport mechanism and its corrections: Codex (GPT-6 Astra/Sol/Luna), lower-region run.
- Definitions of record (first-interior entries 1–18 and 42): the first-interior run (Codex), on the r24/r25/r26 definition
  layers (`C4LA1`, `C5LA1`).
- Companions and fidelity findings: C-U2-T, C-U2-F, C-F2-T, C-F2-U (Claude Opus 5.5). The seven `*_draftText` /
  `*_draftBinders` companions on this face are C-U2-T's `CriticContract.lean` equivalences, re-derived by the formalizer as
  named lemmas (critic-attributed: C-U2-T).
- Reconciliation: the T/F/U adjudicators and the Cycle 1 synthesis (Claude Opus 5.5).

## 1. Setting and definitions (all on the ORIGINAL graph)

Hypotheses of the setting, named where they enter below:
- **(Fin)** `V` is a finite type with decidable equality: `[Fintype V] [DecidableEq V]`. Every family below is a finite
  `Finset`, every count a natural number.
- **(Dec)** `G : SimpleGraph V` with `[DecidableRel G.Adj]` (needed for `G.neighborFinset` and the independence filters).
- **(hp)** `p : ℕ` with `1 ≤ p` (kept on the terminal face as in SOLUTION-CONTRACT §2; see §5).

Definitions of record (carried byte-identically; Lean text in `THEOREM-CONTRACT.yaml`):
- `C4LA1.IsGraphLeaf G v := ∃! u, G.Adj v u` (an original degree-one vertex).
- `C5LA1.support G v` (`s_v`): the unique neighbour of a leaf `v` (a `Classical.choose`; unconstrained off leaves).
- `C5LA1.leafSet G`: the original leaves. `C4LA1.IsFavorableAt G v p := Δ_p(G − v) < 0` (strict, at the ORIGINAL rank `p`).
- `C5LA1.H G v := {v, s_v}` (deletion set of `H_v = G − {v, s_v}`); `C5LA1.R G v := insert s_v (N_G(s_v))` (deletion set of
  `R_v = G − N_G[s_v]`).
- `C5LA1.indepSetsAvoiding G D k`, `C5LA1.indepSetCount G D k = i_k(G − D)`,
  `C5LA1.forwardDifferenceDel G D k = (i_{k+1}(G − D) : ℤ) − i_k(G − D)` (= `Δ_k(G − D)`).
- `C5LA1.aggregate G p = Σ_{v ∈ F_p(G)} (Δ_{p−1}(G − H_v) − Δ_{p−1}(G − R_v))` in ℤ, `F_p(G)` = the leaves favorable at `p`
  (`open Classical in` decidability), `p − 1` the ℕ subtraction.
- `E993Interior.taggedFamily G U W k`: the `k`-subsets `A ⊆ U` independent in `G` and meeting `W`.

New definitions (namespace `E993Transport`; U2's compiled text, frozen once for C1-LA1 and C1-LA2):
- `indepFamily G j` = `I_j(G)`, the independent `j`-subsets of `V`.
- `tagWitnesses G v` = `W_v = N_G(s_v) ∖ {v}` (Lean: `(G.neighborFinset (C5LA1.support G v)).erase v`).
- `activeWeight G F B` = `w_F(B) = #{v ∈ F ∩ B : (B ∖ {v}) ∩ W_v ≠ ∅}` (Lean: the filter of `F ∩ B` by
  `¬ Disjoint (B.erase v) (tagWitnesses G v)`). **It counts ACTIVE tags — a tag `v ∈ F ∩ B` counts iff `B` contains ANOTHER
  neighbour of `v`'s original support `s_v` — and never `|F ∩ B|`** (erratum R30-E-b: the informal wording is "another
  neighbour of `s_v`", i.e. `(B ∖ {v}) ∩ W_v ≠ ∅`, never `B ∩ N(s_v)` read as including `v`).
- `layerWeight G F j = Σ_{B ∈ I_j(G)} w_F(B)`.
- `favorableLeaves G p` = `F_p(G)`, the filter of `leafSet G` by `IsFavorableAt G · p` (FIXED at rank `p`).
- `transportRel G B A` = (D) `∃ q ∈ B, A = B.erase q` ∨ (S) `∃ u, u ∉ B ∧ |N(u) ∩ B| = 2 ∧ A = insert u (B ∖ N(u))` —
  literally (D) ∪ (S), exactly two neighbours, `u ∉ B`, neither wider nor narrower. `IsSaturatingFlow` and `WeightedHall`
  are the network definitions of SOLUTION-CONTRACT §2. **These three are frozen in this award's file only so that they freeze
  once (C1-LA2 consumes the same text); they occur in NO statement of this award and nothing here asserts anything about
  them.**
- Notation: for a leaf `v` and `k : ℕ`, `q_v(k) := |taggedFamily G (univ ∖ H_v) R_v k|` = the independent `k`-sets of `H_v`
  meeting `W_v` (since `R_v ∖ H_v = W_v`).

## 2. Carried leaf facts (first-interior entry 42, private `E993Interior.Leaf.*` helpers; byte-identical)

For a leaf `v` (`IsGraphLeaf G v`):
- **L1 `support_adj`**: `G.Adj v s_v`. **L2 `support_unique`**: every neighbour of `v` is `s_v`. (From `support_spec`, the
  `Classical.choose_spec` of entry 5.)
- **L3 `H_subset_R`**: `H_v ⊆ R_v` (`s_v ∈ R_v`; `v ∈ N(s_v) ⊆ R_v` by L1 and symmetry).
- **L4 `leaf_insert_indep`**: if `A` is independent and disjoint from `H_v`, then `insert v A` is independent (`v`'s only
  neighbour `s_v` is not in `A`, by L2; `v ∉ A`).
- **L5 `tagged_count_split`** (no leaf hypothesis): for `D ⊆ E` and every `k`, `i_k(G − D) = |taggedFamily G (univ ∖ D) E k| +
  i_k(G − E)` (split the independent `k`-sets avoiding `D` by whether they meet `E`).
The entry-42 fragment also carries the first-interior lemma `E993Interior.highTailAggregateFromShadow` (a conditional
statement of the first-interior run, with its own hypotheses `hShadow`, `2 ≤ p`, `2α + 1 ≤ 3p`). It is carried WHOLE only
because its private helpers L1–L5 travel inside it; it is NOT part of this award's DAG, no statement of this award uses it,
and this award asserts nothing about the sign of `S`.

## 3. The proof

**Step N1 — `indepFamily_eq_indepSetsAvoiding`.** `I_j(G) = indepSetsAvoiding G ∅ j`, since `univ ∖ ∅ = univ`. Uses (Fin), (Dec)
only. (Companion; records that `I_j` is the full-graph instance of the definitions of record.)

**Step N2 — `isGraphLeaf_of_mem_favorableLeaves`.** `v ∈ F_p(G)` ⇒ `IsGraphLeaf G v`: `F_p(G)` is a filter of `leafSet G`, which is
a filter of `univ` by `IsGraphLeaf G`. This is where the degree-one hypothesis of the general form is discharged for the
favorable selector.

**Step N3 — `tagWitnesses_subset_R`.** `W_v = N(s_v).erase v ⊆ N(s_v) ⊆ insert s_v N(s_v) = R_v`. No hypothesis.

**Step N4 — `card_active_eq_tagged` (the tagging bijection).** Hypotheses: `IsGraphLeaf G v` (degree one), `hj : 1 ≤ j`.
Claim: `|{B ∈ I_j(G) : v ∈ B ∧ (B ∖ {v}) ∩ W_v ≠ ∅}| = q_v(j − 1)` (`j − 1` in ℕ). The map `B ↦ B ∖ {v}` with inverse
`A ↦ A ∪ {v}` (`Finset.card_nbij'`):
- *Forward.* Let `B` be independent, `|B| = j`, `v ∈ B`, active. Then `s_v ∉ B` (L1: `v ~ s_v`, and `v ≠ s_v` because the
  adjacency is irreflexive — the unique support of a degree-one tag is outside every independent set containing the tag).
  `|B ∖ {v}| = |B| − 1 = j − 1` (exact, since `v ∈ B`). `B ∖ {v}` avoids `v` and `s_v`, so lies in `univ ∖ H_v`; it is
  independent (subset of `B`); it meets `W_v ⊆ R_v` (N3), hence meets `R_v`. So `B ∖ {v} ∈ taggedFamily (univ ∖ H_v) R_v (j−1)`.
- *Backward.* Let `A ⊆ univ ∖ H_v`, `|A| = j − 1`, independent, meeting `R_v` at `w`. Then `v ∉ A`, `s_v ∉ A`, `A` is disjoint
  from `H_v`, and `A ∪ {v}` is independent (L4). `|A ∪ {v}| = (j − 1) + 1 = j` — **this is where `hj : 1 ≤ j` enters** (ℕ:
  `(j − 1) + 1 = j` needs `j ≥ 1`; `omega`). `(A ∪ {v}) ∖ {v} = A` meets `W_v`: `w ≠ s_v` (as `s_v ∉ A`), so
  `w ∈ N(s_v)` from `w ∈ R_v = {s_v} ∪ N(s_v)`; and `w ≠ v` (as `v ∉ A`); so `w ∈ W_v`. Hence `A ∪ {v}` is active at `v`.
- *Inverses.* `(B ∖ {v}) ∪ {v} = B` as `v ∈ B`; `(A ∪ {v}) ∖ {v} = A` as `v ∉ A`.

**Step N5 — `layerWeight_eq_sum_card` (double counting).** For every `F` and `j` (no hypothesis):
`layerWeight G F j = Σ_{v ∈ F} |{B ∈ I_j : v ∈ B ∧ (B ∖ {v}) ∩ W_v ≠ ∅}|`. Write `w_F(B) = Σ_{v ∈ F} [v ∈ B ∧ v active in B]`
(the filter of `F ∩ B` equals the filter of `F` by the conjunction) and exchange the two finite sums (`Finset.sum_comm`).

**Step N6 — `layerWeight_sub_eq_sum` (general (WID), companion `lemma`).** Hypotheses: `hF : ∀ v ∈ F, IsGraphLeaf G v`,
`hp : 1 ≤ p`. Explicit `G` binder (the frozen phrasing, synthesis repair 5; the §2 draft's implicit `{G}` is discharged by
the companion `layerWeight_sub_eq_sum_draftBinders`). Claim (in ℤ):
`(layerWeight G F (p+1) : ℤ) − layerWeight G F p = Σ_{v ∈ F} (Δ_{p−1}(G − H_v) − Δ_{p−1}(G − R_v))`.
- For `j ≥ 1`, N5 and N4 (with `hF v`) give `layerWeight G F j = Σ_{v ∈ F} q_v(j − 1)`. Apply at `j = p + 1` (always `≥ 1`) and
  at `j = p` — **the second application is where `hp` enters**. `(p + 1) − 1 = p` in ℕ holds unconditionally (simp).
- So the left side is `Σ_{v∈F} (q_v(p) − q_v(p − 1))` in ℤ (`push_cast`, `Finset.sum_sub_distrib`).
- For each `v ∈ F`: `H_v ⊆ R_v` (L3, uses `hF v`), so L5 at `k = p − 1` and at `k = p` gives
  `i_k(G − H_v) = q_v(k) + i_k(G − R_v)`. With `(p − 1) + 1 = p` — **the second place `hp` enters** (`hpk`, `omega`):
  `Δ_{p−1}(G − H_v) − Δ_{p−1}(G − R_v) = [i_p(H) − i_{p−1}(H)] − [i_p(R) − i_{p−1}(R)] = q_v(p) − q_v(p − 1)` (`ring`).
- `hp` is load-bearing here: at `p = 0`, for `G = K_{1,3}` and `F` its three leaves, the left side is `0 − 0 = 0`
  (a singleton `{v}` is never active, `{v} ∖ {v} = ∅`), while the right side (ℕ `0 − 1 = 0`) is
  `Σ_v (Δ_0(G − H_v) − Δ_0(G − R_v)) = 3·(1 − (−1)) = 6` (replayed by F, U and the synthesis).

**Step N7 — `activeWeightAggregateIdentity` (TERMINAL THEOREM).** Hypotheses: (Fin), (Dec), `hp : 1 ≤ p`. With
`F = favorableLeaves G p`, every member is a leaf (N2), so N6 applies:
`(layerWeight G F_p (p+1) : ℤ) − layerWeight G F_p p = Σ_{v ∈ F_p(G)} (Δ_{p−1}(G − H_v) − Δ_{p−1}(G − R_v))`.
- **Node N8 (closing step).** After unfolding `C5LA1.aggregate` and `favorableLeaves`, the right side IS the aggregate's body:
  the same filter `(leafSet G).filter (IsFavorableAt G · p)` with the same decidability instance (`Classical.propDecidable`,
  from `open Classical in` in both entry 13 and the `favorableLeaves` fragment; the elaborated `favorableLeaves` term is
  identical to U2's under `set_option pp.all true`), and the same summand. The closing `rfl` is kernel-accepted, so no
  filter-congruence step is needed (synthesis repair 4: "else the kernel-accepted `rfl`").
- **`hp` on the terminal face.** `hp : 1 ≤ p` is kept as in SOLUTION-CONTRACT §2, but it is NOT needed for this specialized
  form: since `F_0 = ∅` (for a leaf `v`, `G − v` has `n − 1 ≥ 1` vertices, so `Δ_0(G − v) = i_1(G − v) − i_0(G − v) =
  (n − 1) − 1 ≥ 0` and no leaf is favorable at rank 0), both sides vanish at `p = 0`. (C-U2-F compiled this unguarded form as
  `activeWeightAggregateIdentity_unguarded`; it is optional and is NOT carried here, because its source file is not an R2
  carry file.) The guard is load-bearing only for the general-`F` companion N6.

## 4. ℕ/ℤ cast audit

- All counts (`i_k`, `q_v`, `w_F`, `layerWeight`) are natural numbers; the identity is stated in ℤ with explicit casts on the
  left (`(layerWeight … : ℤ) − layerWeight …`), so no truncated subtraction occurs on the left.
- `forwardDifferenceDel` casts both counts to ℤ before subtracting (entry 12), so `Δ` is the true integer difference.
- The ONLY ℕ subtractions are ranks: `p − 1` (in `C5LA1.aggregate` and N6) and `j − 1` (N4). Under `hp` (resp. `hj`),
  `p − 1` (resp. `j − 1`) is the integer `p − 1` and `(p − 1) + 1 = p`; every use is guarded (N4: `hj`; N6: `hp`, twice).
  `(p + 1) − 1 = p` needs no guard. In the terminal theorem at `p = 0` the ℕ value `0 − 1 = 0` would be harmless (`F_0 = ∅`).
- `|B ∖ {v}| = |B| − 1` in ℕ is exact because `v ∈ B` (`Finset.card_erase_of_mem`).

## 5. Hypotheses: where each enters

| hypothesis | enters at |
|---|---|
| finiteness `[Fintype V] [DecidableEq V]` | every `Finset` family (`univ`, `powersetCard`, filters), N4's `card_nbij'`, N5's sum exchange |
| `[DecidableRel G.Adj]` | `neighborFinset` (`W_v`, `R_v`, (S)), the independence filters |
| degree one (`IsGraphLeaf`) of every tag | N4 (L1, L2, L4: `s_v ∉ B`, `A ∪ {v}` independent); N6 (L3: `H_v ⊆ R_v`); discharged for `F_p(G)` by N2 |
| unique support of a degree-one tag | L1/L2 (`C5LA1.support` via `Classical.choose_spec`, entry 5) |
| `hj : 1 ≤ j` | N4, `|A ∪ {v}| = (j − 1) + 1 = j` |
| `hp : 1 ≤ p` | N6 (N4 applied at `j = p`; `(p − 1) + 1 = p`); kept on the terminal face, not needed there (`F_0 = ∅`) |
| `IsTree` | does NOT enter: the statement is graph-generic (no tree, no eligibility, no crossing index) |
| the relation cases (D), (S) | do NOT enter: `transportRel` occurs in no statement of this award (frozen only) |

## 6. Fences and excluded conclusions (on the face)

- Graph-generic: no `IsTree`, no eligibility. `activeWeight` tests `B.erase v` against `tagWitnesses G v = N(s_v).erase v`,
  never `|F ∩ B|`. `F` is fixed at rank `p`. `transportRel` is (D) ∪ (S) literally. No RTree wording. No census value.
- Excluded: any statement about (HALL) or (HALL-COND) on trees or any graph; the sign of `S` (this identity has no sign
  content: it neither implies nor refutes `S ≤ 0`); `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`; any tree-only
  statement; TREE, FOREST, TRANSFER, `E993-BETA-AGG`, Erdős #993.
- The carried first-interior lemma `E993Interior.highTailAggregateFromShadow` (entry 42) is a first-interior companion with
  its own hypotheses; it is carried only for its private helpers and is not certified, re-graded or used by this award.

## 7. Carry table (this run's registrar entries; full fragment SHA-256)

Frozen carry sources (digests verified against `sources/c1-stage7-sources/SOURCE-DIGESTS.json` and the sealed capsule):
`U2-Main.lean` `110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743`;
`U2-e993transport_part1.lean` `e32e4cbc7cfd8b920ecec80b5e281ca0ebef7722ab186eee25f224e9a6cfa496`;
`U2-e993transport_part2.lean` `74827559d034fb5548f06ad631364991321fde3b4623c87cba62ef3c0bca7a09`;
`U2-e993transport_part3.lean` `ad6e083e307ea2548a02d1834c3d0ea38f593c329f4ca81c135be95e1273f068`
(each U2 declaration carried is also byte-identical inside the part file named in `CAPSULE-VERIFICATION.json`);
`C-U2-T-CriticContract.lean` `a6b20f8dc0b545677e439401cf36559dd2d46c4253f74c594c6c77af6599ce82`;
`C-U2-F-ContractVerbatim.lean` `2dc9faaef500863446aff3894930d25b089f00e8af53a0e853742b21eae104b9` (the non-compiling §2 verbatim
probe; cited as the reason for `noncomputable` / classical decidability; nothing carried from it);
`U2-THEOREM-CONTRACT-draft-WID.json` `3d47a0e6059236c8c2d99d63bdb60bebab1ba0981142f8a277aebcdc7b778f44` (not award-ready; the
contract was rebuilt from scratch; nothing carried from it);
first-interior `Main.lean` `8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9`.

Wrappers (namespace / `open` / `variable` lines and `--` provenance comments) are not bodies. Definition fragments use
`open SimpleGraph` without `open scoped Classical`, plus `open Classical in` on `favorableLeaves` and `WeightedHall` only
(synthesis repair 3, mirroring entry 13); all eight definitions elaborate to terms identical to U2's under
`set_option pp.all true` (evidence `DRAFTS/defs-pp-all.log`). Lemma/theorem fragments keep U2's wrapper
(`open SimpleGraph`, `open scoped Classical`) exactly as compiled.

| this-run entry | kind | declaration | provenance | fragment SHA-256 |
|---|---|---|---|---|
| 1 | definition | `C4LA1.vertexDeletionIndepSetCount` | first-interior entry 1, byte-identical fragment (Codex, first-interior run) | `7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48` |
| 2 | definition | `C4LA1.vertexDeletionForwardDifference` | first-interior entry 2, byte-identical fragment (Codex, first-interior run) | `c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880` |
| 3 | definition | `C4LA1.IsFavorableAt` | first-interior entry 3, byte-identical fragment (Codex, first-interior run) | `25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db` |
| 4 | definition | `C4LA1.IsGraphLeaf` | first-interior entry 4, byte-identical fragment (Codex, first-interior run) | `65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5` |
| 5 | definition | `C5LA1.support` | first-interior entry 5, byte-identical fragment (Codex, first-interior run) | `8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4` |
| 6 | definition | `C5LA1.leafSet` | first-interior entry 6, byte-identical fragment (Codex, first-interior run) | `78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697` |
| 7 | definition | `C5LA1.H` | first-interior entry 8, byte-identical fragment (Codex, first-interior run) | `55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d` |
| 8 | definition | `C5LA1.R` | first-interior entry 9, byte-identical fragment (Codex, first-interior run) | `a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8` |
| 9 | definition | `C5LA1.indepSetsAvoiding` | first-interior entry 10, byte-identical fragment (Codex, first-interior run) | `ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368` |
| 10 | definition | `C5LA1.indepSetCount` | first-interior entry 11, byte-identical fragment (Codex, first-interior run) | `e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71` |
| 11 | definition | `C5LA1.forwardDifferenceDel` | first-interior entry 12, byte-identical fragment (Codex, first-interior run) | `60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f` |
| 12 | definition | `C5LA1.aggregate` | first-interior entry 13, byte-identical fragment (Codex, first-interior run) | `d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b` |
| 13 | definition | `E993Interior.taggedFamily` | first-interior entry 18, byte-identical fragment (Codex, first-interior run) | `cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e` |
| 14 | definition | `E993Transport.indepFamily` | U2-Main.lean lines 1504-1506, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `73df20a8511ea67885d45631688cf693e58cebe9cfd5413ee67e782c1030ef9e` |
| 15 | definition | `E993Transport.tagWitnesses` | U2-Main.lean lines 1513-1516, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `113d952167528dfc045eb79961e8fbff0326da8f04277799436d6c8962022025` |
| 16 | definition | `E993Transport.activeWeight` | U2-Main.lean lines 1518-1522, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `074ed034729850d34722d0b1ceeb96d8362beaebf3b7a409cb3fab28a9850b93` |
| 17 | definition | `E993Transport.layerWeight` | U2-Main.lean lines 1524-1527, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `5ca5792309be23276583ac42cef294618e2471c97d3f58e67f0ab7980a3a83c3` |
| 18 | definition | `E993Transport.favorableLeaves` | U2-Main.lean lines 1529-1532, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `16b0c7672ed66c4cb53ba24d853764df160d6694f63b231346a2eb71c390ec77` |
| 19 | definition | `E993Transport.transportRel` | U2-Main.lean lines 1539-1542, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `b1b9ac6c8de56fa740a37e5bac0fa628f1d817c2e33625ca34dcab33a1100d95` |
| 20 | definition | `E993Transport.IsSaturatingFlow` | U2-Main.lean lines 1544-1549, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `a9d81c260914024d38f46ff5b564749d34f640674f9e9116685b4e7c631a48ac` |
| 21 | definition | `E993Transport.WeightedHall` | U2-Main.lean lines 1551-1555, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `63534ffbfcc4bb1297228e598da165dcf98732939cd51a5d7fda3e62bc518478` |
| 22 | lemma | `E993Interior.highTailAggregateFromShadow` | first-interior entry 42, byte-identical fragment (Codex, first-interior run) | `972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d` |
| 23 | lemma | `E993Transport.indepFamily_eq_indepSetsAvoiding` | U2-Main.lean lines 1508-1511, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `45d1a93e12e0f50a58b9efb7fe25fab2fcd0c2e31eff6b3ac74795bf6a27cfe8` |
| 24 | lemma | `E993Transport.isGraphLeaf_of_mem_favorableLeaves` | U2-Main.lean lines 1534-1537, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `8977fb83111a46cace690984e23e2ffd54e2ea5233712bfeeca579f1debf75c8` |
| 25 | lemma | `E993Transport.tagWitnesses_subset_R` | U2-Main.lean lines 1566-1569, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `7a8528a04b10243adfa0e8488d21206bd9cfed44e18910e7ed810b7b8517baad` |
| 26 | lemma | `E993Transport.card_active_eq_tagged` | U2-Main.lean lines 1571-1645, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `8823a71dad443ec51fdf34fc541c2c66aab7792d9520f8ef76665729ece12616` |
| 27 | lemma | `E993Transport.layerWeight_eq_sum_card` | U2-Main.lean lines 1655-1677, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `6adece46210475286f5574371270d1f0cba414876eec5e7dd058ab2fa1993c8f` |
| 28 | lemma | `E993Transport.layerWeight_sub_eq_sum` | U2-Main.lean lines 1679-1706, carried WITH repairs 1-2 (keyword theorem->lemma; unused hpk2 removed) (r30 U2, Claude Sonnet 5) | `56e71a87c92f3d8435c1f8fb3b3e906cb037d78027b5bdfdf26b824a1fa8cc33` |
| 29 | lemma | `E993Transport.indepFamily_eq_draftText` | RE-DERIVED from C-U2-T CriticContract.lean (critic-attributed: C-U2-T, Claude Opus 5.5) | `859fd215281757ab00eab0256dc5848db081bacc88c352f33b0f12aa0447b5d2` |
| 30 | lemma | `E993Transport.tagWitnesses_eq_draftText` | RE-DERIVED from C-U2-T CriticContract.lean (critic-attributed: C-U2-T, Claude Opus 5.5) | `27e7de2bcde3d487dc59a91bef86c04dff61d379bf2d91d7d4153015d9b145cc` |
| 31 | lemma | `E993Transport.activeWeight_eq_draftText` | RE-DERIVED from C-U2-T CriticContract.lean (critic-attributed: C-U2-T, Claude Opus 5.5) | `638604a63e8db6171c23dd971ab56adbba9cdfeea2349d299271f4688358c5f9` |
| 32 | lemma | `E993Transport.layerWeight_eq_draftText` | RE-DERIVED from C-U2-T CriticContract.lean (critic-attributed: C-U2-T, Claude Opus 5.5) | `4234555560234fa34d51ad4025e76d925f45845a836badbf43b3898e797af720` |
| 33 | lemma | `E993Transport.favorableLeaves_eq_draftText` | RE-DERIVED from C-U2-T CriticContract.lean (critic-attributed: C-U2-T, Claude Opus 5.5) | `dc0b9bda7a584aca9e69c4494bb275ee820f1f05550726aef41836e0e169aab9` |
| 34 | lemma | `E993Transport.transportRel_iff_draftText` | RE-DERIVED from C-U2-T CriticContract.lean (critic-attributed: C-U2-T, Claude Opus 5.5) | `206411b8c4fcea9b5ce9700f41d5ed30d7d09258e2f6c10c70f9a35808bcb986` |
| 35 | lemma | `E993Transport.layerWeight_sub_eq_sum_draftBinders` | RE-DERIVED from C-U2-T CriticContract.lean (critic-attributed: C-U2-T, Claude Opus 5.5) | `3fb02d6f1afd985d1166f4d5e7a649695b5f8fb705513675af2f4fa355edd7d5` |
| 36 | theorem | `E993Transport.activeWeightAggregateIdentity` | U2-Main.lean lines 1708-1718, declaration text byte-identical (r30 U2, Claude Sonnet 5) | `939231f2cd9efcc41d345c3391fc8a6730ff5e8071fba0f7a5ee89d91dc743e0` |

Registrar ordering: the registrar forbids a definition after a lemma, so the carried definition entries come first (in
index order), then the eight new definitions, then carried entry 42 (a lemma fragment), then the new lemmas, then the single
terminal `theorem`. Not carried: first-interior entries 7, 14, 15–17, 19–41, 43–45; U2's `aggregate_nonpos_of_saturatingFlow`,
`card_sigma_fiber_filter`, `exists_saturatingFlow_of_weightedHall` (C1-LA2 / sign content, excluded here); U2's
`Main.lean.bak1` and `Check.lean` (never carried); every declaration of `C-U2-F-Critic.lean` and `C-U2-T-CriticAdvance.lean`.
