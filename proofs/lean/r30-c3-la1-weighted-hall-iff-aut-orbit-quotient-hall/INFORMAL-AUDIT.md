---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c3-la1-formalizer-opus-20260927
critic_id: c3-la1-fable-informal-20260927
attestation_id: c3-la1-informal-pass-20260927
claim_sha256: b6079f881b55c05a0d43403f2772beea8642eb95b3c7e267fa2d0b51d4fc6d4c
---

# Informal Proof Integrity Audit

I am operating within VerityOS. Boot, as authorized by brief §0: I read `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md`. I loaded no other subsystem. The skill's "Load First" modules
(`modules/project-regimes/mathematical-reasoning.md`, `modules/integrity/*`) are outside the brief's read boundary, so I did not
load them. The brief governs this seat.

Seat: independent informal proof-integrity reviewer for award C3-LA1 (run `erdos-993-math-dre-20260926-r30-weighted-transport`,
workflow run `lean-2026-09-27-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall`). Reviewer id `c3-la1-fable-informal-20260927`.
Brief `control/C3-STAGE7-INFORMAL-AUDITOR-BRIEF-LA1.md`, SHA-256
`ae7ef98df4872aa502d40a22f9fa8714f79b5a4aab3b123962eef12e56fd22bd`. I am not the producer. I edited no contract, Lean source,
informal proof or receipt. I wrote only under `scratchpad/c3-s7-informal-LA1/`.

**Input identity (all recomputed by me).**

| Input | Expected | Recomputed |
|---|---|---|
| `THEOREM-CONTRACT.yaml` | `6dd62fb3…e460b` | `6dd62fb3b551a484b1351912bd7c880ac1beb9c012280f9420df902c51ee460b` (match) |
| `INFORMAL-PROOF.md` | `264d5d45…30d45` | `264d5d45b7ad7478b1d73497f8d74e8f1868ceda799937d5a95ad10cf4230d45` (match; also equals the contract's `informal-proof` source digest) |
| `LeanProject/LeanProof/Main.lean` | `22e3f81c…04a45` | `22e3f81c487697912e3e94741eeb27e580324fd1bf3e06f52afaebc667e04a45` (match) |
| Capsule seal `C3-LA1-PACKET-MANIFEST.json` | `35ab7998…00f88` | recomputed over compact key-sorted JSON without `seal_sha256`: `35ab7998bbbf5bf58226cc79f7a5020b1bd884f3a62df6995e5d93487d400f88` (match); 472/472 members match bytes and digests |
| `claim_sha256` | `b6079f88…d6c4c` | `" ".join(s.split())` of the contract's `informal_statement`, SHA-256 `b6079f881b55c05a0d43403f2772beea8642eb95b3c7e267fa2d0b51d4fc6d4c` (match) |
| `expected_statement_sha256` | `3c5b2226…e3052` | `3c5b2226c71307eb66bd7833efe6f68ad2bbc4192b253cf9d8683238568e3052` (match); the text equals `Main.lean` from `theorem` up to ` :=`, byte for byte |
| C1-LA1 `Main.lean` / kernel receipt | `86b59c6c…e0cb` / `9e733491…c5d00a` | match / match; `VERIFICATION-REPORT.json` status `formally_verified` |
| C2-LA1 `Main.lean` / kernel receipt | `a9cf3b81…7fc4` / `2313f959…a71c` | match / match; `VERIFICATION-REPORT.json` status `formally_verified` |
| Frozen carry files | `sources/c3-stage7-sources/SOURCE-DIGESTS.json` | 10/10 match; `U1-Main.lean` `f3b21020…b180` (131,881 B), `C-U1-T-CritAdv.lean` `8de15f02…b59b` (8,371 B) |

## Intended Claim

The claim is the contract's `theorem.informal_statement`, and nothing wider. It is the terminal theorem
`E993Transport.weightedHall_iff_autOrbitQuotientHall`:

```lean
theorem weightedHall_iff_autOrbitQuotientHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) :
    WeightedHall G (favorableLeaves G p) p ↔
      ∀ 𝒮 ⊆ (indepFamily G (p + 1)).image (orbitOf G (p + 1)),
        ∑ O ∈ 𝒮, supply G (favorableLeaves G p) O ≤
          ∑ O' ∈ ((indepFamily G p).image (orbitOf G p)).filter
              (fun O' => ∃ O ∈ 𝒮, ∃ B ∈ O, ∃ A ∈ O', transportRel G B A),
            supply G (favorableLeaves G p) O'
```

The setting is `namespace E993Transport`, `open SimpleGraph`, `open scoped Classical`, `variable {V : Type*} [Fintype V]
[DecidableEq V]`. Put in words: take any finite simple graph with decidable adjacency and any `p : ℕ` (including `p = 0`), with
`Γ` equal to all of `G ≃g G` and the tag set equal to `favorableLeaves G p`. Then weighted Hall for the fixed selector holds iff
Hall holds on the `Aut(G)`-orbit quotient. The quotient has orbit-total supplies and capacities, and an orbit arc `O → O'` exists
iff some member pair `B ∈ O`, `A ∈ O'` satisfies `transportRel G B A`. The theorem is an equivalence of two Hall conditions. It
asserts neither side.

I audited `INFORMAL-PROOF.md` as the proof of exactly this statement. It follows the DAG frozen by the synthesis:
L0 → L1–L4 → L5–L11 → §4.

## Claim Ledger

Each row names the claim, where its hypotheses enter, the Lean declaration it corresponds to (`Main.lean` registrar index), and
the independent evidence I used. Entry numbers written "C2-LA1 n" are origin-award numbers. The run index is n+1 for C2-LA1
32–76 and equals n for C2-LA1 22–30.

**Definitions (checked literally against `Main.lean` and, for the carried ones, byte-for-byte against the origin `Snippets/`).**

| # | Claim | Lean (run index) | Evidence | Verdict |
|---|---|---|---|---|
| D1 | `I_j` = independent `j`-subsets of `V` | `indepFamily` (14; C1-LA1 14) | text read; my evaluator builds it literally | verified |
| D2 | `F = favorableLeaves G p` = graph leaves `v` with `i_{p+1}(G−v) − i_p(G−v) < 0`, the difference taken in ℤ | `favorableLeaves` (18), `leafSet` (6), `IsGraphLeaf` (4), `IsFavorableAt` (3), `vertexDeletionForwardDifference` (2, `Int` subtraction), `vertexDeletionIndepSetCount` (1) | text read; no ℕ truncation (the difference is `(… : Int) - …`); recomputed in exact integers | verified |
| D3 | `W_v = N_G(s_v) ∖ {v}`, where `s_v` is the unique neighbour of a leaf | `tagWitnesses` (15), `support` (5) | text read; `support` is `Classical.choose` and is constrained on leaves only, and every tag is a leaf (D2) | verified |
| D4 | `w(B)` counts only ACTIVE tags `v ∈ F ∩ B` with `(B ∖ {v}) ∩ W_v ≠ ∅` | `activeWeight` (16) | text: `((F ∩ B).filter fun v => ¬ Disjoint (B.erase v) (tagWitnesses G v)).card`; not `|F ∩ B|` | verified |
| D5 | `transportRel` is exactly (D) ∪ (S) | `transportRel` (19) | text: `(∃ q ∈ B, A = B.erase q) ∨ (∃ u, u ∉ B ∧ (N(u) ∩ B).card = 2 ∧ A = insert u (B \ N(u)))`; nothing wider | verified |
| D6 | `WeightedHall G F p`: for every `X ⊆ I_{p+1}`, `Σ_X w ≤ Σ_{N(X)} w` with `N(X) = {A ∈ I_p : ∃ B ∈ X, B → A}` | `WeightedHall` (21) | text read | verified |
| D7 | `supply G F O = Σ_{B∈O} w(B)`, ℕ-valued; `p` is not a parameter | `supply` (25; C2-LA1 25) | text read; the statement applies it to source and target orbits | verified |
| D8 | `covered G p X = N(X)` (the same filter as in D6, so they agree definitionally) | `covered` (23; C2-LA1 23) | text read; the terminal proof closes `Σ_{N(X)}` against `covered` by definitional unfolding (kernel-accepted) | verified |
| D9 | `famMap G γ X` = the image of each member set under `γ` | `famMap` (22; C2-LA1 22) | text read | verified |
| D10 | `orbitOf G j B` = members of `I_j` equal to `γ(B)` for some `γ : G ≃g G`. It is empty off the layer. No `Fintype (G ≃g G)` is used | `orbitOf` (31, new; U1) | text read. The filter predicate is a `Prop`, decided by `Classical.propDecidable`, and no enumeration of `G ≃g G` occurs anywhere in `Main.lean` (grep: no `Fintype (G ≃g G)`, and no `univ` over automorphisms). It is byte-identical to `U1-Main.lean` lines 2717–2721 | verified |

**Carried companion taken as given (brief §2.1).**

| # | Claim | Hypotheses and where they enter | Lean | Verdict |
|---|---|---|---|---|
| L0 | `WeightedHall G F p ⇔` the Hall inequality for every `Aut`-invariant `X ⊆ I_{p+1}` | (⇒) is a specialisation. (⇐) is C2-LA1's least-maximizer argument, and `canonMin_famMap` consumes BOTH `favorableLeaves_map_aut` (C2-LA1 41: `Aut`-invariance of `F`, unconditional) and `favorableLeaves_leaf` (C2-LA1 75: every tag is a leaf). The ℤ quantity `phi` lives only here | `weightedHall_iff_invariant` (77; C2-LA1 76), byte-identical to origin | taken as given (`formally_verified` in C2-LA1); statement re-read and it matches the informal L0 |

**Orbit lemmas (new; statements read in `Main.lean` and matched to the informal L1–L11).**

| # | Claim | Hypotheses and where they enter | Lean (index) | Evidence | Verdict |
|---|---|---|---|---|---|
| L1 | `B ∈ I_j ⇒ B ∈ orbitOf G j B` | `hB` (layer membership); the identity automorphism | `mem_orbitOf_self` (78) | text; recomputed on every instance (partition check) | verified |
| L2 | `X` invariant, `B ∈ X` ⇒ `orbitOf G j B ⊆ X` | invariance at the witnessing `γ` via `mem_famMap`. `hXsub` is unused (fence 4) | `orbitOf_subset_of_mem_invariant` (79) | text; 60 random families per instance | verified |
| L3 | For `X ⊆ I_j`: invariant ⇔ orbit-closed | (⇐) uses `hXsub` (to put `γ(B)` in the layer) and finiteness, via `card_famMap` and `Finset.eq_of_subset_of_card_le` (Mathlib `Data/Finset/Card.lean:277`, `s ⊆ t → #t ≤ #s → s = t`) | `invariant_iff_orbitOf_subset` (80) | text; recomputed ⇔ on 60 random families and orbit unions per instance, every instance | verified |
| L4 | `X ⊆ I_{p+1}` invariant ⇒ `covered G p X` invariant | `covered_famMap` (C2-LA1 62, which uses `transportRel_map_aut`, C2-LA1 45). `hXsub` is unused | `covered_orbitUnion` (81) | text; consequence recomputed as the equality in E1 below | verified |
| L5 | `δ(γ(s)) = (γ.trans δ)(s)` | none | `crit_map_map_aut` (82) | `Finset.map_map` (Mathlib `Data/Finset/Image.lean:121`) | verified |
| L6 | `B' ∈ orbitOf G j B ⇒ orbitOf G j B' = orbitOf G j B` | full group: `γ.trans δ` and `γ.symm.trans δ` (`map_map_symm_self`, C2-LA1 43); layer membership sits in both filters | `crit_orbitOf_eq_of_mem` (83) | text; recomputed on every instance | verified |
| L7 | `orbitOf G j B ⊆ I_j` | none | `crit_orbitOf_subset` (84) | `Finset.filter_subset` | verified |
| L8 | The distinct orbits in `Y.image (orbitOf G j)` are pairwise disjoint, for any `Y` | L6 | `crit_orbits_pairwiseDisjoint` (85) | text; recomputed (the orbits exactly partition each layer, every instance) | verified |
| L9 | `Y ⊆ I_j` orbit-closed ⇒ the union of `Y`'s orbits is `Y` | closure (⊆) and L1 (⊇) | `crit_biUnion_orbits` (86) | text; recomputed | verified |
| L10 | Class-union identity: for `Y ⊆ I_j` orbit-closed and ANY `F`, `supply F Y = Σ_{O ∈ Y.image orbitOf} supply F O` | L8, L9, `Finset.sum_biUnion` (Mathlib `prod_biUnion`, which needs pairwise disjointness). No constancy of `w` on orbits is used | `crit_supply_eq_sum_orbits` (87) | recomputed on every orbit set in every brute-forced instance | verified |
| L11 | `𝒮 ⊆ Y.image orbitOf ⇒ Σ_{B ∈ ⋃𝒮} w = Σ_{O ∈ 𝒮} supply O` | L8 restricted to `𝒮` | `crit_sum_biUnion_orbits` (88) | recomputed (source and target sides) | verified |

**Terminal proof (§4), both directions checked separately.**

| # | Step | Hypotheses and where they enter | Verdict |
|---|---|---|---|
| F1 | (⇒) Let `𝒮 ⊆ 𝒪_{p+1}` and `X = ⋃𝒮`. Then `X ⊆ I_{p+1}` | L7 and `h𝒮` | verified |
| F2 | (⇒) `N(X) ⊆ ⋃T(𝒮)`: for `A ∈ N(X)` with `B ∈ X`, `B → A`, `B ∈ O ∈ 𝒮`, the orbit `orbitOf G p A ∈ 𝒪_p` contains `A` (L1), and `(B, A)` witnesses it in `T(𝒮)` | L1; `A ∈ I_p` from the filter | verified |
| F3 | (⇒) `Σ_𝒮 supply = Σ_X w ≤ Σ_{N(X)} w ≤ Σ_{⋃T(𝒮)} w = Σ_{T(𝒮)} supply` | WeightedHall at `X`; L11 at `j = p+1` and `j = p` (`T(𝒮) ⊆ 𝒪_p` by `filter_subset`); `Finset.sum_le_sum_of_subset` (ℕ, canonically ordered: Mathlib `Algebra/Order/BigOperators/Group/Finset.lean:418`). No invariance and no L0 | verified |
| B1 | (⇐) By L0, it suffices to take `X ⊆ I_{p+1}` invariant | L0 (the only place where `Aut`-invariance and leafness of `F` enter) | verified |
| B2 | (⇐) `X` is orbit-closed. Put `𝒮 = X.image (orbitOf G (p+1)) ⊆ 𝒪_{p+1}`. The hypothesis gives `Σ_𝒮 supply ≤ Σ_{T(𝒮)} supply` | L3 (⇒ direction), `Finset.image_subset_image hXsub` | verified |
| B3 | (⇐) Left side: `Σ_X w = Σ_𝒮 supply` | L10 at `j = p+1` | verified |
| B4 | (⇐) `⋃T(𝒮) ⊆ N(X)`. Take `A' ∈ O' ∈ T(𝒮)` with witness `O = orbitOf B₀`, `B₀ ∈ X`, `B ∈ O`, `A ∈ O'`, `B → A`. Then `B ∈ X` (orbit-closed), `A ∈ I_p` (L7), so `A ∈ N(X)`. `N(X)` is invariant (L4) and hence orbit-closed (L3 at rank `p`, with `N(X) ⊆ I_p`). `O' = orbitOf A` (L6), so `A' ∈ orbitOf A ⊆ N(X)` | L4, L3, L6, L7 | verified |
| B5 | (⇐) Right side: `Σ_{T(𝒮)} supply = Σ_{⋃T(𝒮)} w ≤ Σ_{N(X)} w` | L11 at `j = p`; ℕ monotonicity with B4 | verified |
| B6 | (⇐) Chaining B3, B2 and B5 gives `Σ_X w ≤ Σ_{N(X)} w` | — | verified |
| E1 | Remark (§4, closing parenthesis): for invariant `X`, `⋃T(𝒮) = N(X)`. The proof uses only the two inclusions: F2 (⊇, valid for every `𝒮`) and B4 (⊆, which needs L4) | not load-bearing as an equality | verified; recomputed as an exact equality on every enumerated `𝒮` (below) |

**§5–§8 claims.**

| # | Claim | Verdict |
|---|---|---|
| S1 | Finiteness: `Fintype V` makes each layer a `Finset`. The only argumentative use is L3's cardinality step. No `Fintype (G ≃g G)` | verified (text and grep) for the award's own steps; see O5 for the carried L0 |
| S2 | Fence 5: the `DecidablePred` instances for `orbitOf`'s filter and the statement's filter come from `Classical.propDecidable`, and they do not change the set. Membership is `a ∈ s ∧ P a` for any instance (`Finset.mem_filter`, `Data/Finset/Filter.lean:127`), and `Finset.filter_congr_decidable` (`:144`) equates filters under different instances | verified (Mathlib read) |
| S3 | `Aut`-invariance of `F` enters only through L0's (⇐); L1–L11 hold for any `F` | verified. The L1–L11 statements carry a free `F`, or none. The probe below confirms (⇒) never needs invariance (observation O2 notes leafness) |
| S4 | ℕ/ℤ audit: `activeWeight` and `supply` are ℕ; the statement has no subtraction; the only ℤ quantities in the proof chain are `phi` (inside L0) and the favorability difference (D2) | verified. The only ℕ subtraction in all of `Main.lean` is `p - 1` in carried `C5LA1.aggregate` (entry 12), which no lemma and not the terminal theorem references |
| S5 | Edge cases: `p = 0` is included; `𝒮 = ∅` is trivial; `orbitOf` is empty off the layer but only appears on layer members | verified (every sweep includes `p = 0`) |
| S6 | Count "12 other new declarations: `lemma` (11) or `def` (1)" (the post-kernel correction) | verified: 13 new = 1 `def` + 11 `lemma` + 1 `theorem` |
| S7 | Carry table: 76 carried fragments byte-identical, keyed by (origin award, origin entry, digest). 13 new declarations transported by exact line range, with only the recorded changes | verified by my own `carry_check.py` (below) |

## Reproduced Mathematical Evidence

All code is mine, written for this audit under `scratchpad/c3-s7-informal-LA1/`. It uses only the standard library (import lists
are in each file's docstring) and exact integers throughout. No prior evaluator was imported. No wall-clock field appears in any
hashed output. Every Python run used `python3 -B`.

| File | SHA-256 |
|---|---|
| `carry_check.py` | `6aaff7f6611eebb5b8bbd3518e48f54997f16f9121d69bf83081c1436d258796` |
| `carry_check.out` | `2bae1b8b85b00af24c0cb65933ce352818c3edb539352ed3279a63039d29af37` |
| `quotient_eval.py` | `81ade995b1ecf4681a63ace5f16ba3ba89a7ec2bc222ad2c2f157d53c94bcac4` |
| `quotient_eval.out` | `01af1c12f4b620459a89de7f337a936425644bcf3d0b0f66df7eb3f741051f71` |
| `quotient_eval_results.json` | `12c1c469ce527cf91ac09706230192704f9bf175f8fac06ed2add89597a408fa` |
| `critic_probe.py` | `4fed57d40c015cb7a202364c3519860ae9b4614fdd1854b1686cb59cffc23613` |
| `critic_probe.out` | `22cd6e78b3e8c40052ec314a570b348c699b3ce8bbe6ac8c291af380ca1e9b68` |
| `critic_probe_results.json` | `8223556ed37863d42c6ea1fc8c7481d259417b2a1a5097e8d629c9424f6df367` |

**1. Carry and transport check (`carry_check.py`, imports `hashlib, json, os, re, sys`).**
- All 89 registrar blocks of `Main.lean` hash to their header digests.
- The 76 carried entries are each byte-identical to the origin award's `Snippets/` file, keyed by origin award, and each digest
  appears in that award's `FORMALIZATION-STATE.json` (76/76). The keying: C1-LA1 1–21 → run 1–21; C1-LA1 24 → run 32; C2-LA1
  22–30 → run 22–30; C2-LA1 32–76 → run 33–77.
- The entry-number collision is real: C1-LA1 and C2-LA1 entries 22–36 name different declarations in 15 of 15 cases. C2-LA1 1–21
  equal C1-LA1 1–21 byte for byte, and C2-LA1 31 equals C1-LA1 24.
- The 13 new declarations each contain the origin line range verbatim: `U1-Main.lean` 2717–2721, 2723–2729, 2731–2740, 2742–2758,
  2760–2767; `C-U1-T-CritAdv.lean` 13–16, 18–29, 31–32, 34–44, 46–56, 58–66, 68–75, 77–139. The only differences are the recorded
  ones: `theorem`→`lemma` on the four U1 lemmas, and on entry 89 the rename
  `crit_weightedHall_iff_orbitQuotientHall`→`weightedHall_iff_autOrbitQuotientHall`. Undoing each change reproduces the origin
  text exactly. Origin-text digests match `INFORMAL-PROOF.md` §8 (for example `5e692d95…` for `orbitOf` and `fa33769f…` for the
  terminal theorem).
- Exactly one `theorem` exists (the terminal one). There is no `sorry`, `admit`, `native_decide`, `axiom` declaration or `decide`
  token.
- Items marked NOT a dependency are absent from `Main.lean` (separate greps): `supply_orbitOf`, `crit_supply_orbit_eq_card_mul`,
  `exists_transportRel_iff`, `regular_bipartite_shadow_bound`, C-U1-F's `weightedHall_iff_quotientHall`/`orbitArc`, C2-LA1's
  terminal `exists_aut_invariant_deficient_of_not_weightedHall`, C1-LA1's `activeWeightAggregateIdentity`, and every r29 name
  (0 occurrences each). `Main.lean` imports only `Mathlib`.
- `EVIDENCE/axioms-all-declarations.txt` (read directly): 89/89 declarations print a subset of `[propext, Classical.choice, Quot.sound]` (81 all
  three, 7 `[propext, Quot.sound]`, 1 none). The terminal theorem prints all three.

**2. The equivalence itself (`quotient_eval.py`, imports `itertools, json, random, sys, collections.deque`).**

For each `(G, p)` the evaluator builds the network from the definitions of record (D1–D10):
- It computes `Aut(G)` by backtracking, as a full enumeration when `|Aut| ≤ 200,000`. Otherwise it uses a stabilizer-chain
  transversal generating set, with `|Aut|` equal to the product of transversal sizes.
- It asserts that `F` is `Aut`-invariant.
- It computes `orbitOf` as "layer members that are images", checks the orbits partition each layer, and computes orbit totals and
  the orbit-arc relation. A sample of arcs is cross-checked against the literal existential `∃ B ∈ O, ∃ A ∈ O', transportRel`.

It decides BOTH sides with explicit certificates:
- **WeightedHall.** Either a saturating integral flow (extracted and re-verified arc by arc: positive only on (D) ∪ (S) arcs,
  exact source sums, target loads within capacity), or an explicit `X` with `Σ_X w > Σ_{N(X)} w` recomputed directly. When
  `|I_{p+1}| ≤ 16`, it also brute-forces over every `X`.
- **Quotient Hall.** The same, on the orbit network. When there are at most 14 source orbits, it also brute-forces over every
  `𝒮`. On each brute-forced `𝒮` it asserts three things: `⋃T(𝒮) = N(⋃𝒮)` exactly (the E1 equality), and the class-union identity
  on both sides.

Named instances (66 `(G, p)` rows, every `p` with `p + 1 ≤ α` unless stated). There were **0 disagreements**. `X`-brute force ran
on 46 rows and `𝒮`-brute force on 63 rows.

| Graph | `|Aut|` | `p` | Outcome (WeightedHall / quotient Hall) |
|---|---:|---|---|
| star `K_{1,3}`, `K_{1,4}`, `K_{1,5}`, `K_{1,6}` | 6, 24, 120, 720 | all | both fail at `K_{1,3}`/1, `K_{1,4}`/1 and `K_{1,5}`/2; both hold elsewhere (for example `K_{1,6}`/3, with `F` = all 6 leaves) |
| path `P_5`–`P_8` | 2 | all | both fail at `P_5`/1, `P_6`/2, `P_7`/2, `P_8`/2; both hold elsewhere |
| **double broom of order 11** (all 12 shapes: spine `ℓ ∈ [2,7]`, `a ≥ b ≥ 2` leaves on the two spine ends, `ℓ + a + b = 11`) | 8 to 10,080 | **6** | **both hold on all 12**. For example, spine 3 with 4+4 leaves: `|Aut| = 1152`, 8 favorable leaves, supply 224, capacity 448, verified saturating flow on both networks; brute force over every orbit set gives maximum deficiency 0 |
| **`P_3 ⊔ K_{6,3,3,3}`** | 1,866,240 (= 2·6!·(3!)³·3!) | **4** | **both FAIL**. `F = {a, c}` (the `P_3` ends). The explicit deficient family is `X` = the 20 sources `{a, c} ∪ T` with `T` a 3-subset of the 6-part. `X` is one orbit, with supply 40 against `w(N(X)) = 30`, so the maximum deficiency is 10 (the whole layer is 46 ≤ 48). The quotient violator is that single source orbit, orbit total 40 against 30 on its joined target orbits, and its union is the original deficient family |
| `P_3 ⊔ K_{6,3,3,3}` | 1,866,240 | 0, 1, 2, 3, 5 | both fail at `p = 3` (deficiency 18; orbit set 48 vs 30); both hold at 0, 1, 2, 5 |
| spiders (2,2,2) and (1,2,2,3); `C_6`; `C_4` with a pendant at each vertex | 6, 2, 12, 8 | all | agree at every `p` (fail/fail at (2,2,2)/2, (1,2,2,3)/3, `C_4`-pendant/2; hold/hold elsewhere) |

The instances with nontrivial `Aut` where Hall holds include all 12 double brooms at `p = 6`, `K_{1,6}` at `p = 3`,
`P_3 ⊔ K_{6,3,3,3}` at `p = 5`, and 54 named rows in total.

Sweeps:
- **Every graph on `n ≤ 6` vertices up to isomorphism** (208 graphs = 1 + 2 + 4 + 11 + 34 + 156), every `p` with `p + 1 ≤ α`:
  603 instances. Hall holds on 519 and fails on 84. 578 instances have a nontrivial `Aut`, and 78 of those are failing instances.
  **Disagreements: 0.**
- **150 random graphs on `n ∈ {7, 8}`** (seed 993): 645 instances, 115 failing, 505 with a nontrivial `Aut`. **Disagreements: 0.**

On every instance: the orbits exactly partition each layer; `F` is `Aut`-invariant; invariance ⇔ orbit-closure (L3) held on 60
random families; and wherever orbit sets were enumerated, `⋃T(𝒮) = N(⋃𝒮)` held exactly. On the failing instances, the
quotient-deficient `𝒮` always has an originally deficient union.

About the double broom: the brief does not define it. I therefore covered every double broom of order 11 with at least two leaves
at each spine end, which includes each common reading.

## Independent Critic Pass

This is a separate adversarial pass over my own ledger, attacking each closed row.

1. **Direction of the load-bearing inclusion (brief §2.1).** The brief asks whether the direction "quotient inequality ⇒ Hall on
   invariant families" uses that `N(X)` is EXACTLY the union of the joined target orbits, and where that equality is proved. The
   chain in B3–B6 needs only `⋃T(𝒮) ⊆ N(X)` (B4). With only the reverse inclusion the inequality would run the wrong way, so B4 is
   the load-bearing step. B4 is exactly where `covered_orbitUnion` (L4) and L3 at rank `p` enter: `N(X)` must be orbit-closed to
   absorb the whole target orbit `O'` from one joined member `A`. The equality is never stated as a lemma of this award. It is the
   conjunction of F2 (proved inside (⇒), for every `𝒮`) and B4 (inside (⇐)), with L9 identifying `X = ⋃𝒮` when `X` is invariant.
   The informal proof says this correctly in its closing parenthesis to §4. The U adjudication (DAG step 5) says the same: the
   equality comes from "the two inclusions in the terminal proof", and C-U1-F's `covered_biUnion` is not carried. My computation
   confirms the equality on every enumerated `𝒮`. **No defect.**
2. **Does (⇒) silently need invariance?** It does not: the probe below replaced `F` by 700 arbitrary leaf subsets (610
   non-invariant), and (⇒) never failed. F1–F3 use only L1, L7 and L11, whose statements carry a free `F`.
3. **Is invariance claimed to be necessary?** It is not. In the same probe (⇐) also never failed, even for non-invariant `F`. The
   informal proof claims only that its route uses invariance, through L0. It claims no necessity, so no statement is over- or
   under-claimed. (`critic_probe.py`, seed 4242: 700 instances, 0 forward failures, 0 backward failures.)
4. **Double counting on the target side.** Could a target be counted in two joined orbits? No: target orbits are pairwise
   disjoint (L8), and the statement's sum ranges over a `Finset` of orbits, so each orbit appears once. `∅` is never an orbit in
   `𝒪_j`, because every image point `orbitOf G j B` has `B ∈ I_j` and so contains `B` (L1).
5. **Arc convention.** "Some member pair joined" (not "every member") is the contract's and the synthesis's convention, and it is
   what `T(𝒮)` encodes. Under the full group, the "some" and "every source member has an arc into `O'`" readings agree anyway. My
   evaluator used the literal "some pair" form and cross-checked it against the existential.
6. **ℕ hazards.** All sums in the statement and in F3/B5 are ℕ. Monotonicity over subsets holds because ℕ is canonically ordered
   (Mathlib lemma located). No subtraction appears in the statement, L1–L11 or §4.
7. **Binders.** The terminal declaration's section has only `{V : Type*} [Fintype V] [DecidableEq V]`. The explicit binders are
   `(G) [DecidableRel G.Adj] (p : ℕ)`. There is no `IsTree`, eligibility or `p ≥ 1`. `Γ` is built into `orbitOf` as all of
   `G ≃g G`. The tag set is `favorableLeaves G p` on both sides. These match the claim one for one.
8. **Critic self-check of the evaluator.** Both decisions are certified independently of the solver: flows are re-verified, and
   deficient families are recomputed directly. On small instances brute force confirms both. Group orders were checked against
   full enumeration (all groups up to 200,000) and against the closed form 1,866,240 for `P_3 ⊔ K_{6,3,3,3}`. The graph count 208
   for `n ≤ 6` matches the known number of isomorphism classes. The failing instance's deficiency (40 vs 30) matches a hand
   derivation. The three sources whose `K`-part is a whole 3-part are not deficient (weight 6 against 18). The twenty 3-subsets of the 6-part are
   deficient (weight 40 against the fifteen 2-subsets' weight 30). Switches contribute only weight-0 targets there, because
   `u = b` removes both tags.

**Observations (none is a defect; none changes the verdict).**
- O1. See critic item 1: the "EXACTLY" equality holds but is not needed for (⇐); the load-bearing inclusion is identified.
- O2. Besides `Aut`-invariance, L0's (⇐) also consumes leafness of the tags (`favorableLeaves_leaf`, C2-LA1 75). §5 of the
  informal proof lists invariance, not leafness, among the ingredients. Leafness holds by the definition of `favorableLeaves`
  (a filter of `leafSet`) and lives inside the carried L0, so nothing is hidden or missing.
- O3. §6's parenthetical "(≈ 3·10^37 per layer at the `CB(8,·)` rows)" is a numeric remark inside the excluded-conclusion
  sentence, copied verbatim from the synthesis's C3-LA1 text. It is not part of the claim, and I did not verify it; it lies
  outside this audit's boundary.
- O4. The informal proof cites C2-LA1 lemmas by origin entry number (for example 59, 62, 69, 70), while `Main.lean` indices are
  shifted by one from C2-LA1 32 onward. The carry table in §8 makes the correspondence explicit, and every citation I followed
  resolves to the named lemma.
- O5. §5 says L3's cardinality step is "the one place where finiteness is used as an argument". That is true of this award's own
  steps (L1–L11, §4). The carried L0, taken as given, also uses finiteness inside its own proof: its maximizer ranges over the
  finite domain `(indepFamily G (p+1)).powerset`, and `canonMin_famMap` uses `card_famMap`. The informal proof says L0's proof
  "is C2-LA1's and is not redone here", so this is a scoping imprecision in wording, not a gap.

**Formalizer deviations (brief §2.5), judged for mathematical effect.**
- Registration order (`orbitOf` at index 31, after the carried definitions; C1-LA1 24 at 32). No fragment byte changed. `orbitOf`
  depends only on `indepFamily` (14), and every dependency precedes its use. **No effect on the mathematics.**
- The two unused `hXsub` binders (L2, L4) are kept byte-identical. They only add a hypothesis to companion lemmas, and at every
  call site in the terminal proof that hypothesis is available (`X ⊆ I_{p+1}`). The terminal statement is untouched. **No
  effect.**
- The post-kernel count correction in `INFORMAL-PROOF.md` ("12 other … `lemma` (11) or `def` (1)") is correct (S6). The
  current file's digest equals the contract's re-validated `informal-proof` digest, and neither file is receipt-bound. **No
  effect.**

## Scope and Fence Check

- **Claim asserts nothing fenced.** The informal statement and the proof assert exactly the iff. I checked each exclusion:
  - no quotient feasibility, and neither side of the iff is asserted;
  - not (HALL) at any scope, since my own evaluator shows both sides failing on `P_3 ⊔ K_{6,3,3,3}`/4 and on trees such as
    `P_6`/2, and nothing in the award implies either side;
  - not (LIFT) and not its feasibility;
  - nothing for a proper subgroup (`orbitOf` quantifies over all of `G ≃g G`), another tag set (only `favorableLeaves G p`) or
    another weight (only `activeWeight`);
  - no flow constructed or implied;
  - no tree, eligibility or aggregate-sign content (no such hypothesis or conclusion, and `C5LA1.aggregate` is carried but
    unreferenced);
  - nothing about orbit-space sizes, apart from the verbatim synthesis parenthetical of O3, which sits inside the exclusion
    sentence;
  - C2-LA1's terminal theorem (its entry 77) is not carried, and entry 76 is a companion taken as given.
- **Fence 1 (SR-C3-1).** Neither file asserts a key or grade. The contract says "this contract asserts no grade".
- **Fence 2.** One terminal `theorem`. The 11 new companions are `lemma`, register `proved_informal` only, and say so in their
  headers.
- **Fence 3.** Registrar keyed by (origin award, entry, digest): verified 76/76.
- **Fence 4.** `hXsub` byte-identical: verified.
- **Fence 5.** The classical `DecidablePred` does not change the filtered sets (S2).
- **Fence 6.** Axioms exactly `propext`, `Classical.choice`, `Quot.sound` (per-declaration list read). No forbidden token.
- **Attribution on the face.** `INFORMAL-PROOF.md` §7 and the contract's `informal_statement` both carry the full §2 attribution:
  C1-LA1 entries 1–13 from the first-interior award (Codex) and 14–21 from r30 Cycle 1; C2-LA1's apparatus, with the
  invariant-family statement critic-derived by C-U1-T; U1 (Claude Sonnet 5) for the orbit block; C-U1-T (Claude Opus 5.5) for
  the partition, class-union identity and terminal theorem; C-U1-F (Claude Opus 5.5) for the equivalent formalization; the U
  adjudicator for `adj_two_quotient_forms_agree`; Codex (GPT-6) for the transport mechanism, the lower-region run and (LIFT)'s
  conventions; r29 for the high tail, not used. I checked these phrases programmatically in the contract, and they also appear
  in `EVIDENCE/THEOREM-CONTRACT.md`. The critic-derived bodies are marked "critic-derived" in their fragment headers.
- **Repairs on the face.** "Remaining gap" struck; "ten / seven"; carry description "C2-LA1 carries C1-LA1 entries 1–21 plus 24
  only". All three are present in `INFORMAL-PROOF.md` §6 and in the contract's scope text, and they agree with the U adjudication
  (rows 1, 3, 6) and synthesis R7.

## Verdict

**passed**

`INFORMAL-PROOF.md` is a complete and correct statement-level proof of exactly the contract's `informal_statement`. Every
ledger row closed as verified, with independent evidence and a separate critic pass. Both directions of the iff were checked
separately, and the load-bearing inclusion `⋃T(𝒮) ⊆ N(X)` was located at B4 (L4 + L3 + L6). The definitions match the Lean
source literally. The carried fragments are byte-identical by origin award. The terminal hypotheses match the claim one for one,
and no fenced conclusion is asserted. My own exact-integer evaluator found WeightedHall ⇔ quotient Hall on every instance: 66
named rows, including both-fail at `P_3 ⊔ K_{6,3,3,3}`/4 and both-hold on every double broom of order 11 at `p = 6`; 603
exhaustive instances on `n ≤ 6`; and 645 random instances on `n ∈ {7, 8}`. There were 0 disagreements. No defect was found.
Attestation id on this pass: `c3-la1-informal-pass-20260927`.

**Model disclosure (two-part).** Chartered (dispatch-record authority): Claude Opus 5.5, effort high. Runtime-reported model id,
verbatim: `claude-opus-5-5[1m]`.

**Read-boundary deviations (all disclosed; none supplied content to this audit).**
1. An `awk` extraction of `## Exact established results` in the Cycle 3 synthesis printed more than A1 and A3: rows A2, A4,
   B1–B12, C, D1–D3, E-a–E-h, F and the "Imported results" paragraph. I used nothing from those rows.
2. To locate R7, I printed the first ~60 characters of each R-item heading (R1–R12) of the synthesis's `## Reconciliation`, then
   read R7 only.
3. Directory listings (names only, no file contents): the C3-LA1 run root (which shows `.sandbox-home/`, `.sandbox-tmp/`,
   `DRAFTS/`, `RECEIPTS/`, `SOURCE/`, `FIDELITY-REVIEW.md`, `LOOP-STATE.*`, `DEPENDENCIES.yaml`, `VERIFICATION-REPORT.md`,
   `FORMALIZATION-STATE.json`); `LeanProject/` top level (`.lake`, `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`,
   `LeanProof.lean`, whose one import line I printed); `DRAFTS/` (one `ls`); `runs/` (which shows the name of
   `lean-2026-09-26-c1-la2-…`); and `EVIDENCE/superseded-fidelity-input-1/` (empty).
4. The capsule gate hashed the bytes of all 472 manifest members, including members outside §1's list (`control/*` records,
   `sources/first-interior/`, `sources/lower-region/`, `sources/r29/`). I hashed them without inspecting them.
5. From the origin awards, `carry_check.py` also parsed the registrar blocks of both origin `Main.lean` files (listed) and scanned
   `FORMALIZATION-STATE.json` for digests (listed). It hashed `RECEIPTS/kernel-verification.json` (listed) and read the `status`
   of `VERIFICATION-REPORT.json` (listed). No other origin-award file was opened.
6. The harness saved one oversized tool output (a verbatim copy of `INFORMAL-PROOF.md`) under
   `/Users/ashtonsperry/.claude/projects/…/tool-results/`, and I read the proof from that copy. The copy is the harness's
   automatic write, not mine. Its content is the file whose digest I verified.
7. The host injected the project `CLAUDE.md` and the user auto-memory index into context at session start. I did not open either
   file and relied on neither. The brief confines writes to this scratch directory, so no conversation log was written.
8. Mathlib: `grep` inside the pinned shared project's `.lake/packages/mathlib/Mathlib` only, for seven lemma names plus the
   `to_additive` source of `sum_le_sum_of_subset`.
