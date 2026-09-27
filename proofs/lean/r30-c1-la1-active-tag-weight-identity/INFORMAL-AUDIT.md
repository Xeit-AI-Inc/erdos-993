---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la1-formalizer-opus-20260926
critic_id: c1-la1-fable-informal-20260926
attestation_id: c1-la1-informal-pass-20260926
claim_sha256: c4381641d250e9b954b27670b79175ea296114833570de5dbd5074c892f8be5b
---

# Informal Proof Integrity Audit

Run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30), Cycle 1, Stage 7, award group `C1-LA1`. The Lean run root is
`runs/lean-2026-09-26-c1-la1-active-tag-weight-identity`. The seat is the independent informal proof-integrity reviewer; I am
not the artifact producer. I edited nothing in the Lean run, the contract, the informal proof or any receipt. I wrote only
under `scratchpad/c1-s7-informal-LA1/`.

**VerityOS boot.** I operated within VerityOS. I loaded `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md`. The subsystem in use is `experiments/`, limited to this run root and the brief's read
boundary. Scale mode: single problem. The proof was audited at statement-level granularity with one prover/critic cycle.

**Model disclosure (two-part).**
- Chartered model, on dispatch-record authority: Claude Opus 5.5, effort high.
- Runtime-reported model id, verbatim: `claude-opus-5-5[1m]`.

The reviewer id `c1-la1-fable-informal-20260926` is the controller's assigned seat id and does not name the model. No child
delegation was used. **Family note:** the producer (formalizer) was also chartered as Claude Opus 5.5. The informal
mathematics is r30 F2's (Claude Sonnet 5) and the Lean proofs are U2's (Claude Sonnet 5). This audit is therefore
independent by seat, not by model family.

**Read boundary kept.** I read only the following:
- In the Lean run: `THEOREM-CONTRACT.yaml`, `INFORMAL-PROOF.md`, `CAPSULE-VERIFICATION.json`, `EVIDENCE/THEOREM-CONTRACT.md`,
  `FORMALIZER-REPORT.md` and `LeanProject/LeanProof/Main.lean`. I also ran directory listings of `EVIDENCE/` and `RECEIPTS/`.
- The sealed capsule manifest and these members: `SYNTHESIS.md` (`## Exact established results`, `## Lean awards`), the U
  adjudication's `## Lean readiness`, the U2 return's headings, and both U2 critiques (C-U2-T, C-U2-F).
- `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`.
- The frozen first-interior `Main.lean`, its `Snippets/` and its `FORMALIZATION-STATE.json`.
- The frozen carry files under `sources/c1-stage7-sources/`.

I did not open `DRAFTS/`, other returns, other runs, the network or any package installs. No `lake` or `lean` was invoked.

**Input digests (recomputed).**

| input | expected SHA-256 | recomputed |
|---|---|---|
| `THEOREM-CONTRACT.yaml` | `539bee23…ec3c9` | `539bee231e266a57c312e8efa24fab8bf3000fb2dc090bd0756ca167d21ec3c9` match |
| `INFORMAL-PROOF.md` | `60453a01…30386` | `60453a019dee1f59f6e130e009d25c3837975577c40d07b689a136cd9b830386` match |
| `LeanProject/LeanProof/Main.lean` | `86b59c6c…e0cb` | `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` match |
| capsule seal (compact key-sorted JSON minus `seal_sha256`, no trailing newline) | `ac21ccbf…f660` | `ac21ccbf72afde0f7d364c4360381a22f267a78f67ef8d829e5fdbefb1a9f660` match; all 347 members match byte count and SHA-256 |
| first-interior `Main.lean` | `8d864da2…a7d9` | match |
| carry files, against `sources/c1-stage7-sources/SOURCE-DIGESTS.json` | — | all 11 match |

## Intended Claim

The claim is the contract's `theorem.informal_statement`. Collapsed to single spaces, its SHA-256 recomputes to
`c4381641d250e9b954b27670b79175ea296114833570de5dbd5074c892f8be5b`, which equals the brief's value. Its mathematical content:

> For every finite vertex type `V` with decidable equality, every simple graph `G` on `V` with decidable adjacency, and every
> natural `p` with `1 ≤ p`, let `F = F_p(G)` be the original leaves of `G` that are strictly favorable at rank `p` (fixed at
> `p`). For an independent set `B`, let `w_F(B) = #{v ∈ F ∩ B : (B ∖ {v}) ∩ W_v ≠ ∅}`, where `W_v = N(s_v) ∖ {v}`. Then, in ℤ,
> `Σ_{B ∈ I_{p+1}(G)} w_F(B) − Σ_{A ∈ I_p(G)} w_F(A) = C5LA1.aggregate G p`.

The terminal declaration is `E993Transport.activeWeightAggregateIdentity`. Its source text, from `theorem` up to but excluding
` :=`, is byte-equal to `lean_binding.expected_statement`, with SHA-256
`661470f6c5b1e6daed31e57287f7d7f7f64ef17b8b9d0369d197e89f51212323`. That text is also identical to the synthesis's
`## Lean awards` C1-LA1 block and to the SOLUTION-CONTRACT §2 draft signature.

Its hypotheses match the claim one-for-one:

| claim | Lean |
|---|---|
| finite `V` with decidable equality | section `variable {V : Type*} [Fintype V] [DecidableEq V]` |
| simple graph with decidable adjacency | `(G : SimpleGraph V) [DecidableRel G.Adj]` |
| natural `p` | `(p : ℕ)` |
| `1 ≤ p` | `(hp : 1 ≤ p)` |

No hypothesis is added: no `IsTree`, no eligibility, no crossing index. None is dropped. The conclusion is the ℤ-cast
difference of `layerWeight` at `favorableLeaves G p`, at ranks `p + 1` and `p`, equal to `C5LA1.aggregate G p`.

## Claim Ledger

Notation: `s_v = C5LA1.support G v`, `H_v = {v, s_v}`, `R_v = insert s_v N(s_v)`, `W_v = N(s_v).erase v`,
`q_v(k) = |taggedFamily G (univ ∖ H_v) R_v k|`, and `i_k(G − D) = C5LA1.indepSetCount G D k`. The verdict "V-R" means
verified, with reproduced evidence from my own evaluator (see the next section).

### Definitions

The Lean text of each definition was read literally and matched against the prose.

| id | item | check | verdict |
|---|---|---|---|
| D1 | `C4LA1.IsGraphLeaf G v := ∃! u, G.Adj v u` | literal; a degree-one vertex | V |
| D2 | `C5LA1.support` | `Classical.choose` of `IsGraphLeaf G v → Adj v u ∧ ∀ w, Adj v w → w = u`. On a leaf it is forced to the unique neighbour; off leaves it is unconstrained. Only leaves' supports enter the claim, because `F ⊆ leafSet`. | V |
| D3 | `C4LA1.IsFavorableAt G v p := vertexDeletionForwardDifference G v p < 0`, with `vertexDeletionForwardDifference = (i_{p+1}(G−v) : ℤ) − i_p(G−v)`, counting subsets of `univ.erase v` | strict inequality, original graph, rank `p` | V |
| D4 | `leafSet = univ.filter IsGraphLeaf`; `favorableLeaves G p = leafSet.filter (IsFavorableAt G · p)` | a single rank `p`, so `F` is fixed | V |
| D5 | `C5LA1.H = {v, s_v}`; `C5LA1.R = insert s_v (N(s_v))` | literal | V |
| D6 | `indepSetsAvoiding`, `indepSetCount`, `forwardDifferenceDel` | `forwardDifferenceDel` casts both counts to ℤ before subtracting, so there is no truncation | V |
| D7 | `C5LA1.aggregate G p = Σ_{v ∈ leafSet.filter (IsFavorableAt · p)} (fdd(H_v, p−1) − fdd(R_v, p−1))` | ℤ-valued; `p − 1` is the ℕ subtraction | V |
| D8 | `taggedFamily G U W k` | the `k`-subsets of `U`, independent, with `¬Disjoint A W` | V |
| D9 | `indepFamily G j` | `powersetCard j` of `univ`, filtered by independence, i.e. `I_j(G)` | V |
| D10 | `tagWitnesses G v = (N(s_v)).erase v` | equals `W_v` | V |
| D11 | `activeWeight G F B = ((F ∩ B).filter (¬ Disjoint (B.erase v) (tagWitnesses G v))).card` | exactly `#{v ∈ F ∩ B : (B∖{v}) ∩ W_v ≠ ∅}`; not `|F ∩ B|` | V |
| D12 | `layerWeight G F j = Σ_{B ∈ I_j} activeWeight G F B` | literal | V |
| D13 | `transportRel`, `IsSaturatingFlow`, `WeightedHall` | These are frozen definitions only. `transportRel` is literally (D) ∪ (S): `u ∉ B`, `card = 2`, `insert u (B ∖ N(u))`. None is a dependency of the terminal theorem (see F-1). | V |

### Carried leaf facts

These are the private helpers inside first-interior entry 42, carried byte-identically.

| id | item | hypotheses | verdict |
|---|---|---|---|
| L1, L2 | `support_adj` gives `Adj v s_v`; `support_unique` says every neighbour of `v` is `s_v` | `IsGraphLeaf G v` | V (`Classical.choose_spec`) |
| L3 | `H_subset_R`: `H_v ⊆ R_v` | leaf (for `v ∈ N(s_v)`) | V |
| L4 | `leaf_insert_indep`: if `A` is independent and `A ∩ H_v = ∅`, then `insert v A` is independent | leaf | V |
| L5 | `tagged_count_split`: if `D ⊆ E`, then `i_k(G−D) = |taggedFamily (univ∖D) E k| + i_k(G−E)` for every `k` | `D ⊆ E` only | V-R (297,950 checks, 0 failures) |

### Proof steps

| id | step | hypotheses and where they enter | recomputation | verdict |
|---|---|---|---|---|
| N1 | `I_j = indepSetsAvoiding G ∅ j` | none | `univ ∖ ∅ = univ` | V |
| N2 | `v ∈ F_p(G)` implies `IsGraphLeaf G v` | none | a filter of a filter | V |
| N3 | `W_v ⊆ R_v` | none | 0 failures on the grid; also `R_v ∖ H_v = W_v` for leaves, 0 failures | V-R |
| N4 | For `j ≥ 1` and leaf `v`: `B ↦ B∖{v}` is a bijection from `{B ∈ I_j : v ∈ B, v active}` onto `taggedFamily (univ∖H_v) R_v (j−1)`, with inverse `A ↦ A ∪ {v}` | Leaf enters through L1 (`s_v ∉ B`, since `v ≠ s_v` by irreflexivity) and L4 (the inverse is independent). `hj` enters at `(j−1)+1 = j`. `|B∖{v}| = |B|−1` is exact because `v ∈ B`. The forward witness moves into `R_v` by N3. The backward witness `w ∈ R_v` has `w ≠ s_v` and `w ≠ v`, so `w ∈ W_v`. | Checked as an equality of families, forward image and backward image: 262,060 `(G, v, j ≥ 1)` checks, 0 failures | V-R |
| N5 | `layerWeight G F j = Σ_{v ∈ F} #{B ∈ I_j : v ∈ B ∧ v active}` | none | double counting; the filter of `F ∩ B` equals the filter of `F` by the conjunction | V (an identity; implied by the terminal and general-form checks) |
| N6 | General (WID), for `F` a set of leaves and `p ≥ 1`: `(lw(p+1) : ℤ) − lw(p) = Σ_{v ∈ F} (Δ_{p−1}(G−H_v) − Δ_{p−1}(G−R_v))` | `hF` enters at N4 and L3. `hp` enters where N4 is applied at `j = p`, and at `(p−1)+1 = p`. `(p+1)−1 = p` holds unconditionally. The term-wise identity is `Δ_{p−1}(H) − Δ_{p−1}(R) = q(p) − q(p−1)` by L5 at `k = p−1, p`. | 990,882 `(G, F, p ≥ 1)` checks, 0 failures; term-wise 262,060 checks, 0 failures | V-R |
| N7 | Terminal theorem: N6 with `F = favorableLeaves G p`, using N2 | (Fin), (Dec), `hp` | 244,876 `(G, p ≥ 1)` checks, 0 failures; 44,916 rows with `F ≠ ∅` and 36,137 with `S ≠ 0` | V-R |
| N8 | Closing step: the right side of N6 at `F_p` is literally the body of `C5LA1.aggregate` | Same filter and same summand. A `Finset.filter` is independent of the `Decidable` instance, since `Decidable` is a subsingleton. So the step is mathematically an identity, and the choice between `rfl` and a congruence step is a kernel matter. | the terminal checks | V |
| N9 | `hp` is not needed for the terminal form: `F_0 = ∅`, because `Δ_0(G−v) = (n−1)−1 ≥ 0` for a leaf (`n ≥ 2`) | integer statement | `Δ_0(G−v) = n−2` on every leaf of the grid (0 failures); `F_0 ≠ ∅` on 0 of 34,767 graphs; terminal at `p = 0` gives both sides 0 on 34,767 of 34,767 | V-R |
| N10 | `hp` is load-bearing for general-`F` N6: `K_{1,3}` at `p = 0` gives 0 against 6, with per-leaf `Δ_0(G−H_v) = 1` and `Δ_0(G−R_v) = −1` | ℕ `0 − 1 = 0` | reproduced exactly (`lhs 0`, `rhs 6`, per-leaf `(1, −1)`). Over the grid, general form at `p = 0` fails on 78,751 of 139,209 instances. On every instance the defect equals `Σ_{v ∈ F} |W_v|` (0 exceptions), which matches C-U2-T's derivation. | V-R |

### Cast audit

| id | item | verdict |
|---|---|---|
| C1 | All counts are ℕ; the claim is stated in ℤ with the left side cast termwise. `Δ` casts before subtracting. The only ℕ subtractions are `p − 1` (in the aggregate and N6) and `j − 1` (N4), guarded by `hp` and `hj`. `(p + 1) − 1` is exact. `|B ∖ {v}| = |B| − 1` is exact since `v ∈ B`. No other truncation occurs, and I found no hidden cast. | V |
| C2 | The informal proof's hypothesis table (§5) agrees with the Lean proof terms. `IsTree` does not enter anywhere. The relation cases do not enter the proof. | V (with F-1) |

## Reproduced Mathematical Evidence

All code is my own, written from the Lean definitions of record. It uses exact integers and the standard library only, imports
no prior evaluator, and records no wall-clock fields. Everything lives under
`scratchpad/c1-s7-informal-LA1/`.

| file | SHA-256 | imports |
|---|---|---|
| `wid_audit.py` | `4dc7f26bde3ef3ed68c728ed0b85457792ae74d2ef60ac9d00e77011c9db8681` | `itertools, random, json, hashlib, sys` |
| `wid_audit_results.json` | `b44694a3b07304cdf7cb0247855ecead1118e69bed148129d3a065d8fb401948` | output |
| `hf_necessity.py` | `67105a745f9ba8a8c33198a3483c81d27105f64fc88c0989890811c1c16ff1ac` | `itertools, json, sys` (execs the class definitions of `wid_audit.py`) |
| `hf_necessity_result.json` | `29921c6afd6f60fd717959e17bf15bd439cb013cf78bf23e255d2b877c1bab92` | output |
| `check_carry.py` / `check_carry_output.txt` | `943359b9…bed0` / `03cd307d…d1f9` | `hashlib, json, re, sys` |
| `check_u2_carry.py` / `check_u2_carry_output.txt` | `f89d7f0e…cb95` / `8d9eb180…5fcc` | `re, difflib` |

**Grid.** The grid had four parts:
- Every labelled simple graph on `n = 1…5` vertices, with every subset of the leaves as `F`.
- Every labelled graph on `n = 6` (32,768 graphs), with each singleton leaf set, the full leaf set and two random subsets
  as `F`.
- 600 random non-tree graphs on `n = 7…10`, each with 1–4 forced pendant vertices.
- 300 random trees on `n = 7…13`.

The RNG seed is fixed at 993030. Every `p` from 0 to `n + 1` was tested, for 34,767 graphs in total. The graphs include
disconnected graphs, isolated vertices, `K_2` components (where `v` and `s_v` are both leaves and `W_v = ∅`), dense graphs and
triangles.

Results (the cumulative counts are in the JSON):

| check | instances | failures |
|---|---|---|
| terminal theorem, `p ≥ 1` (N7) | 244,876 | 0 |
| terminal theorem, `p = 0` (unguarded form; N9) | 34,767 | 0 (`F_0 = ∅` every time) |
| general form, `p ≥ 1` (N6) | 990,882 | 0 |
| general form, `p = 0` (N10; outside `hp`) | 139,209 | 78,751 failures; the defect equals `Σ_F |W_v|` on every failure |
| tagging bijection as a family equality, `j ≥ 1` (N4) | 262,060 | 0 |
| L5 split | 297,950 | 0 |
| term-wise `Δ_{p−1}(H) − Δ_{p−1}(R) = q(p) − q(p−1)` | 262,060 | 0 |
| `s_v ∉ B` whenever `v ∈ B` independent | all | 0 |
| `R_v ∖ H_v = W_v`, `W_v ⊆ R_v`, `Δ_0(G − v) = n − 2` | all leaves | 0 |

Fixed points:
- **`K_{1,3}`, `p = 0`, `F` = the three leaves.** Left side 0, right side 6, per-leaf `(Δ_0(H_v), Δ_0(R_v)) = (1, −1)`, and
  `F_0 = ∅`. The terminal form at `p = 0` gives `0 = 0`. This confirms the proof's "0 vs 6" and "3·(1 − (−1))".
- **`K_{1,12}`, `p = 8`** (a SEMANTIC-CONTRACT fixed point, used only to check the instrument): `|F| = 12`, supply 1980,
  capacity 3960, `S = −1980`, `Δ_8(K_{1,11}) = −110`, which is `55 − 165`. All values match the record.

**Hypothesis sharpness, exhibited outside the stated hypotheses:**
- **`hp` for the general form.** `K_{1,3}` at `p = 0` gives 0 against 6. More generally the defect is `Σ_F |W_v|`.
- **`hF` for the general form.** The search found the triangle `K_3` with the degree-2 vertex `v = 0` at `p = 1`. For every
  possible value of the unconstrained support `s ∈ {0, 1, 2}`, the left side is 0 and the right side is 2, 1, 1. So the leaf
  hypothesis cannot be dropped for any choice of `s_v`. A `P_3` probe in the results JSON fails only for `s = v`, and I give it
  no weight.
- **Fence contrast, active versus present.** The presence weight `|F ∩ B|` gives a supply − capacity different from `S` on
  37,152 of the 44,916 rows with `F ≠ ∅`. On every row it equals `Σ_F Δ_{p−1}(G − H_v)`, which is synthesis P13 (0 failures).
  The literal-prose test `B ∩ N(s_v) ≠ ∅` coincides with the presence weight on every row, as erratum R30-E-b says. The
  award's `activeWeight` and the informal statement both use the corrected `(B ∖ {v}) ∩ W_v` test.

**Literal definition and carry checks:**
- `check_carry.py`: all 14 carried first-interior fragments pass four checks. Entries 1–6, 8–13, 18 and 42 each have a body
  under this run's `Main.lean` marker equal to the body under the frozen first-interior `Main.lean` marker, and equal to the
  frozen `Snippets/` file. Each has a digest equal to `FORMALIZATION-STATE.json` and equal to the marker digest.
- `check_u2_carry.py`: 14 U2 declarations are byte-identical substrings of `U2-Main.lean`. For `favorableLeaves` and
  `WeightedHall` this holds after removing the single added `open Classical in` line, which is freeze repair 3.
  `layerWeight_sub_eq_sum` differs from U2 by exactly two things: `theorem` becomes `lemma` (repair 1), and the `hpk2` `have`
  line and its simp argument are removed (repair 2).
- Each of the 21 contract definitions carries its exact `lean_name`, and its Lean declaration text appears in its
  description (21/21).
- `Main.lean`, excluding comments, contains no `sorry`, `admit`, `native_decide`, `axiom` or `decide` token. It has exactly
  one `theorem` and no primed names.

## Independent Critic Pass

I ran a separate adversarial pass over my own ledger, leaving the claims unchanged.

1. **Is the evaluator faithful to Lean?** The support is the unique neighbour on leaves, and the claim touches no non-leaf
   support. `vertexDeletionIndepSetCount` counts subsets of `univ.erase v`, which my `i(1<<v, k)` reproduces. The aggregate
   uses ℕ-truncated `p − 1` and the strict `< 0` favorability. The same `F_p` is used at both layers. Result: faithful.
2. **Is the grid adequate?** It covers every labelled graph to order 6 plus random non-trees and trees to order 13. The
   identity is additive in `F`, and singletons are checked, so the per-tag identity is covered on every leaf of every graph.
   Degenerate cases (`n ≤ 2`, `K_2`, isolated vertices, `W_v = ∅`) are included. Grid evidence is bounded computation, not
   proof. The proof itself is checked step by step above and has no gap.
3. **Does an unstated hypothesis hide in N4 or N6?**
   - N4's statement is also true at `j = 0`, where both sides are 0 (35,890 checks, 0 failures). So `hj` is a proof-internal
     guard for the backward cardinality, `(j−1)+1 = j`, not a hypothesis the statement needs.
   - It follows that in N6 the load-bearing use of `hp` is the index step `(p−1)+1 = p`, as the `K_{1,3}` defect `Σ|W_v|` shows.
   - The informal proof names both places `hp` is consumed. That is accurate for the proof as written, and nothing is
     overstated about what is load-bearing. **No defect.**
4. **Could decidability instances change the statement?** Filters and cardinalities do not depend on the `Decidable`
   instance, so the claim's value does not either. The terminal statement's `open scoped Classical` wrapper cannot change
   the mathematics, and the kernel accepted `rfl`. Instance elaboration is the fidelity review's remit. **No mathematical
   defect.**
5. **Is anything marked "not a dependency" actually a dependency?**
   - `highTailAggregateFromShadow` (entry 42) is referenced by no declaration of the award. Only its private helpers
     `support_adj`, `leaf_insert_indep`, `H_subset_R` and `tagged_count_split` are used, and `support_unique` and
     `support_spec` are used transitively.
   - `IsSaturatingFlow` and `WeightedHall` occur only in their own definitions.
   - `transportRel` occurs in `IsSaturatingFlow`, in `WeightedHall` and in the companion `transportRel_iff_draftText`. It is
     not a dependency of the terminal theorem or of any WID companion. See finding F-1 for the prose.
6. **Did the audit certify what it re-derived?** The ledger verdicts rest on my own recomputation plus a line-by-line read of
   the proof. U2, C-U2-T and C-U2-F agree with them, but their evaluators were not used.

The critic pass sustains every ledger verdict. It raises one non-blocking prose finding and two administrative notes.

- **F-1: imprecision, non-blocking, true under a charitable reading.** `INFORMAL-PROOF.md` §1 says the three network
  definitions "occur in NO statement of this award and nothing here asserts anything about them". §5 says "`transportRel`
  occurs in no statement of this award (frozen only)". `FORMALIZER-REPORT.md` says "no statement of this award mentions
  them".
  - Literally, the companion `E993Transport.transportRel_iff_draftText` (this run's entry 34, critic-attributed to C-U2-T)
    states `transportRel G B A ↔ (literal (D) ∪ (S) draft text)`, proved by `Iff.rfl`.
  - This is the synthesis-required repair 9 equivalence. It asserts only definitional unfolding, supports the fence
    "`transportRel` is (D) ∪ (S) literally", is no dependency of the terminal theorem, and states nothing fenced: nothing about
    (HALL), (HALL-COND), the sign of `S`, trees or the aggregate key.
  - Intended reading: no mathematical statement of the WID award, meaning the terminal theorem or the WID companions,
    involves the network definitions. Under that reading the sentence is true.
  - Recommended erratum wording: "…occur in no statement of this award other than the definitional draft-text equivalence
    `transportRel_iff_draftText`". This does not affect the proof or the verdict.
- **A-1: administrative, not mathematical.** Synthesis repair 7 reads "mint entries 46+". This run's registrar numbers from 1,
  and the new declarations are its entries 14–21 and 23–36. `FORMALIZER-REPORT.md` explains that "46+" refers to the
  first-interior index space. Every new declaration went through the registrar, which is the substance of the repair.
- **A-2: administrative.** Entry 42 is carried whole, which the synthesis and the U adjudication permit. Its public lemma is a
  conditional first-interior statement about the sign of `S` under `hShadow`, `2 ≤ p` and `3p ≥ 2α + 1`. The award's face
  correctly says it is not used, certified or re-graded.

## Scope and Fence Check

**Fences, per synthesis `## Lean awards` C1-LA1 and formalizer brief §2.** Each is checked against the contract's
`informal_statement` and `INFORMAL-PROOF.md` §1, §3, §6:

| fence | status |
|---|---|
| graph-generic: no `IsTree`, no eligibility | holds; no such hypothesis is in the statement or used in the proof |
| `activeWeight` tests `B.erase v` against `tagWitnesses = N(s_v).erase v`, never `|F ∩ B|`; the erratum R30-E-b wording | holds; the informal statement uses `(B ∖ {v}) ∩ W_v` and "another neighbour" |
| `F` fixed at rank `p` | holds; one `favorableLeaves G p` at both layers |
| `transportRel` is (D) ∪ (S) literally, neither wider nor narrower | holds (D13); it appears in no WID statement (see F-1) |
| no RTree wording; no census value | holds |
| no statement on (HALL) or (HALL-COND), `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, the sign of `S`, tree-only statements, TREE/FOREST/TRANSFER/`E993-BETA-AGG`/Erdős #993 | holds; the claim is an identity with no sign content, and all of these are listed as excluded on the face |
| `hp` note stated: not needed for the terminal form (`F_0 = ∅`), load-bearing for `layerWeight_sub_eq_sum` (`K_{1,3}`, `p = 0`) | holds, and both halves are reproduced (N9, N10) |
| exactly one terminal `theorem`; companions are `lemma`s with no certificate (R29-N-12) | holds |

The synthesis attribution list travels on the face in both `INFORMAL-PROOF.md` §0 and the contract's scope text. Every item
is present:
- Codex (GPT-6 Astra/Sol/Luna), lower-region run: the active-tag weight, the mechanism and its corrections.
- The first-interior run (Codex), on the r24/r25/r26 layers: definitions of record entries 1–18 and 42.
- r30 F2 (Claude Sonnet 5): the informal proof.
- r30 U2 (Claude Sonnet 5): the Lean proofs.
- C-U2-T, C-U2-F, C-F2-T, C-F2-U (Claude Opus 5.5): companions and fidelity findings. The seven `*_draftText` and
  `*_draftBinders` companions are attributed to C-U2-T.
- The T/F/U adjudicators and the synthesis (Claude Opus 5.5): reconciliation.

The r29 high-tail certificates are "context only; not on this face" in the synthesis, and they correctly do not appear. The
provenance of every re-derived declaration is stated: entries 29–35 are re-derived from C-U2-T's `CriticContract.lean`, and
entry 28 carries repairs 1–2.

**Formalizer brief §3 conditions,** audited as far as they bear on the mathematics and the carry:
- R1: carried entries are byte-identical, and digests reproduce `FORMALIZATION-STATE.json`.
- R2: carry-file digests verified; U2 bodies are byte-identical apart from the declared repairs; origins and full SHA-256
  values are cited in both `FORMALIZER-REPORT.md` and `INFORMAL-PROOF.md` §7.
- R3: `expected_statement` is exact; definitions are listed by `lean_name` with their Lean text; the ℕ/ℤ `hp` text is
  present; exactly three axioms are permitted; grades come only from the contract's list.
- R5: the informal proof names every hypothesis where it enters.
- R7: exactly one `theorem`.
- R4 (axioms, kernel receipt) is outside this informal audit and was not assessed beyond the source token scan.

## Verdict

passed

`INFORMAL-PROOF.md` is a complete and correct statement-level proof of the contract's `informal_statement`. The contract's
informal statement has claim SHA-256 `c4381641d250e9b954b27670b79175ea296114833570de5dbd5074c892f8be5b`, and the proved claim
is `E993Transport.activeWeightAggregateIdentity`.

Grounds for the verdict:
- Every definition, lemma and inference step N1–N8 was checked against the literal Lean text.
- Every equality was recomputed as an exact-integer identity on the grid with 0 failures.
- Every ℕ subtraction is guarded or exact.
- The terminal hypotheses match the claim one-for-one.
- The `hp` statements are reproduced in both directions: not needed for the terminal form, load-bearing for the general form
  at `K_{1,3}`, `p = 0`, 0 against 6.
- The carried definitions are byte-identical to the frozen first-interior source.
- No fenced conclusion is asserted, and the synthesis attribution travels on the face.

One non-blocking prose imprecision (F-1) and two administrative notes (A-1, A-2) are recorded above. None is a defective
step. This informal pass certifies nothing about the kernel receipt or statement fidelity; those remain separate gates.
