---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c2-la1-formalizer-opus-20260926
critic_id: c2-la1-fable-informal-20260926
attestation_id: c2-la1-informal-pass-20260926
claim_sha256: 7bb53e287a30ac85f30a4d3da44807f44df2b1b0a361bf26fe20f3cbe9e472da
---

# Informal Proof Integrity Audit

**Boot acknowledgment.** I operated within VerityOS. Under the brief's §0, the boot loaded exactly three files:
`/Users/ashtonsperry/VerityOS/verity.md`, `identity/startup-protocol.md` and `skills/proof-integrity-audit/skill.md`. The
skill's "Load First" modules (`modules/project-regimes/…`, `modules/integrity/…`) were not loaded, because the brief's §1 read
boundary does not admit them. The brief governs. The harness put the root `CLAUDE.md` and the user auto-memory index into my
context at session start. I did not open either as a source, and nothing below relies on them. No conversation log was
written, because the brief's §3 restricts writes to this file and my scratch.

**Model disclosure (two parts).** Chartered on dispatch-record authority: Claude Opus 5.5, effort high. The model id my runtime
reports for itself, verbatim: `claude-opus-5-5[1m]`. There was no child delegation. The assigned reviewer id is
`c2-la1-fable-informal-20260926`, used as given.

**Seat.** I am the independent informal proof-integrity auditor for award group `C2-LA1` (Cycle 2 Stage 7, run
`erdos-993-math-dre-20260926-r30-weighted-transport`). I am not the artifact producer. I edited no contract, source, proof or
receipt. I wrote only under `scratchpad/c2-s7-informal-LA1/`.

**Integrity gates, recomputed before reading.**

| Object | Expected | Recomputed | Result |
|---|---|---|---|
| `THEOREM-CONTRACT.yaml` | `f0f50c2a…3e0d` | `f0f50c2a7b920bfe9f566e8ce0bb9177f048d104a9e213daa133c47565aa3e0d` | match |
| `INFORMAL-PROOF.md` | `0166e0fa…fe74` | `0166e0fa9dbdb26f6b18f89b54b9358b4417e4a323d53e4f2cb3cf593c3cfe74` | match |
| `LeanProject/LeanProof/Main.lean` | `a9cf3b81…7fc4` | `a9cf3b815832b6fa25e43e07e628db4ce01a7a496b084cac0cd3768e877c7fc4` | match |
| Capsule seal `C2-LA1-PACKET-MANIFEST.json` | `920048e7…a1dd` | `920048e72b5cbd85caa5bfa2f0eefb33e63e564ccde4d576e908157086a0a1dd`, the SHA-256 of the compact key-sorted JSON of the manifest minus `seal_sha256` | match |
| Capsule members | 389 | 389 re-hashed, with byte counts | 0 mismatches |
| `claim_sha256`, `" ".join(s.split())` of `theorem.informal_statement` | `7bb53e28…72da` | `7bb53e287a30ac85f30a4d3da44807f44df2b1b0a361bf26fe20f3cbe9e472da` | match |
| `lean_binding.expected_statement` | `34ba6dcc…824c` | `34ba6dccf54495a248b18447a5821ef879c2d14c6c97b2e65ae5126bbaff824c`; equals the `Main.lean` text from `theorem` up to `:=` | match |
| C1-LA1 `Main.lean` | `86b59c6c…e0cb` | `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` | match |
| C1-LA1 receipt | `9e733491…` | `9e7334914b8ea5a4532d89d2f039aacc13b3be92a98b09685d8a7f1cb5c5d00a` | match |
| Frozen carry files | `sources/c2-stage7-sources/SOURCE-DIGESTS.json` | all 6, digest and bytes | match |

The C1-LA1 receipt's `source_sha256_before` and `source_sha256_after` are both `86b59c6c…`, and its verdict is `verified`.

## Intended Claim

The claim is the contract's `theorem.informal_statement`, quoted verbatim below. Its hash is recomputed above.

> Canonical run id erdos-993-math-dre-20260926-r30-weighted-transport. For every finite type V with decidable equality, every simple graph G on V with decidable adjacency, and every p in N, let F = favorableLeaves G p (the fixed strict selector F_p(G)). If WeightedHall G F p fails, then there is a family X of independent (p+1)-sets (X a subset of I_(p+1)(G)) such that (i) famMap G gamma X = X for every graph automorphism gamma : G ≃g G, where famMap G gamma X is the image under gamma of each member set of X; (ii) every member B of X has active weight activeWeight G F B > 0 (active tags: v in F intersect B with (B minus {v}) meeting W_v); and (iii) the total active weight of the targets N(X) = {A in I_p(G) : some B in X has transportRel G B A}, under exactly (D) union (S), is strictly less than the total active weight of X. The witness is X_min, the least maximizer of phi = supply - cov. Graph-generic; hypotheses are finiteness and decidability only (no IsTree, no eligibility, no p >= 1). Companions on the face (weightedHall_iff_invariant, weightedHall_iff_phi_nonpos, favorableLeaves_map_aut, activeWeight_map_aut, transportRel_map_aut, phi_supermodular, canonMin_isMaximizer, canonMin_famMap, canonMin_pos, filter_eq_covered) are lemmas with no certificate of their own.

**The claim matches the terminal declaration one-for-one.** That declaration is
`E993Transport.exists_aut_invariant_deficient_of_not_weightedHall` (`Main.lean` entry 77).

- **Binders.** `{V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
  (h : ¬ WeightedHall G (favorableLeaves G p) p)`. There is no `IsTree`, no connectivity, no acyclicity, no eligibility and no
  `p ≥ 1`.
- **Conclusion.** `∃ X ⊆ indepFamily G (p+1)`, together with:
  - (i) `∀ γ : G ≃g G, famMap G γ X = X`;
  - (ii) `∀ B ∈ X, 0 < activeWeight G (favorableLeaves G p) B`;
  - (iii) `Σ_{A ∈ (indepFamily G p).filter (∃ B ∈ X, transportRel G B A)} w < Σ_{B ∈ X} w`.
- **Same text in every source.** The statement text is byte-identical across four places, once the Markdown list indent is
  removed: `Main.lean`, the contract's `expected_statement`, the formalizer brief §2, and the synthesis `## Lean awards` block.
  The U adjudication's U-A block is also identical.
- **The witness.** "The witness is X_min" describes the proof. The Lean conclusion is existential, and the proof instantiates it
  with `canonMin`.

## Claim Ledger

Verdict key:
- **V**: verified, with reproduced evidence (mathematical re-derivation, plus computation where it is finite).
- **V-txt**: verified textually against the Lean source.
- **O**: an observation; not a defect.

"Evidence" gives the files under `scratchpad/c2-s7-informal-LA1/`. The DAG of record is the synthesis's (a)–(e).

### Definitions (checked literally against `Main.lean`)

| # | Item | Literal content checked | Evidence | Verdict |
|---|---|---|---|---|
| D1 | `indepFamily G j` (C1-LA1 entry 14) | `(univ.powersetCard j).filter (IsIndepSet)`: the independent `j`-sets | `carry_check.json`: byte-identical to C1-LA1 fragment 0014 | V-txt |
| D2 | `IsGraphLeaf`, `leafSet` (entries 4, 6) | `∃! u, G.Adj v u`; `univ.filter IsGraphLeaf` | byte-identical to fragments 0004 and 0006 | V-txt |
| D3 | `support` (entry 5) | `Classical.choose` of `IsGraphLeaf G v → Adj v u ∧ ∀ w, Adj v w → w = u`. It is the unique neighbour on leaves and **unconstrained off leaves**. | byte-identical to 0005 | V-txt |
| D4 | `tagWitnesses` (entry 15) | `(neighborFinset (support G v)).erase v` = `N(s_v) ∖ {v}` | byte-identical to 0015 | V-txt |
| D5 | `activeWeight` (entry 16) | `((F ∩ B).filter (¬ Disjoint (B.erase v) (tagWitnesses G v))).card`: it counts ACTIVE tags, never `\|F ∩ B\|` | byte-identical to 0016 | V-txt |
| D6 | `vertexDeletionIndepSetCount`, `vertexDeletionForwardDifference`, `IsFavorableAt`, `favorableLeaves` (entries 1–3, 18) | `i_k(G−v)` counts the independent `k`-subsets of `univ.erase v`. `Δ_p = (i_{p+1} : ℤ) − i_p` in ℤ, with no ℕ truncation. `F_p = leafSet.filter (Δ_p < 0)`. | byte-identical to 0001–0003 and 0018 | V-txt |
| D7 | `transportRel` (entry 19) | `(∃ q ∈ B, A = B.erase q) ∨ (∃ u, u ∉ B ∧ \|N(u) ∩ B\| = 2 ∧ A = insert u (B \ N(u)))`: exactly (D) ∪ (S) | byte-identical to 0019 | V-txt |
| D8 | `WeightedHall` (entry 21) | `∀ X ⊆ I_{p+1}, Σ_X w ≤ Σ_{I_p.filter(∃ B ∈ X, B→A)} w`, under `open Classical in` | byte-identical to 0021 | V-txt |
| D9 | `famMap` (entry 22, NEW) | `X.map ⟨fun s => s.map γ.toEquiv.toEmbedding, Finset.map_injective _⟩`. By Mathlib `Finset.mem_map` (`b ∈ s.map f ↔ ∃ a ∈ s, f a = b`) and `RelIso.coe_fn_toEquiv`, this is exactly `{γ(B) : B ∈ X}` with `γ(B) = {γ v : v ∈ B}`. There is no filter, closure or extra binder, so nothing is wider. It is definitionally C-U1-T's `X.map (setEmb G γ)` with `setEmb` inlined (same function, same injectivity proof). | `carry_check.json` diff (entry 22); Mathlib `Data/Finset/Image.lean:69`, `Order/RelIso/Basic.lean:609` | V-txt |
| D10 | `covered`, `cov`, `supply`, `phi` (entries 23–26) | `covered` is the same filter as D8. `cov` and `supply` are ℕ sums. `phi = (supply : ℤ) − (cov : ℤ)`, the only subtraction in the new text. | whitespace-only diffs against `U1-INV.lean` 227–243 | V-txt |
| D11 | `domain`, `maxPhi`, `maximizers`, `canonMin` (entries 27–30) | `domain = (I_{p+1}).powerset`. `maxPhi = sup'` of `phi` over it. `maximizers` is its argmax set. `canonMin = maximizers.inf' id`, i.e. `⋂` of all maximizers. | 27 is exact. 29 is whitespace-only. 28 and 30 inline their nonemptiness proofs (diff inspected); they are Prop proof terms, so by proof irrelevance the values are unchanged. | V-txt |

### Inference steps

(a) Equivariance.

| # | Statement (INFORMAL-PROOF §3) | Hypotheses and where they enter | Evidence | Verdict |
|---|---|---|---|---|
| a1 | `γS` is independent ⇔ `S` is (`isIndepSet_map_aut`) | `γ` injective; `γ.map_rel_iff` | re-derived; Aut enumeration on 11 instances, 0 violations | V |
| a2 | `γN(u) = N(γu)` | `map_rel_iff`, surjectivity via `γ.symm` | re-derived | V |
| a3 | `γv` is a leaf ⇔ `v` is | as a2 | re-derived; `F` invariant under every automorphism in every instance | V |
| a4 | for a leaf `v`: `s_{γv} = γ s_v` (`support_spec`, `support_map_aut`) | **`hv` (leaf)**. It enters because `support_spec` is only available for a leaf; off the leaves `support` is an unconstrained choice (D3). | re-derived | V |
| a5 | for a leaf `v`: `γW_v = W_{γv}` | `hv`, through a4 and a2 and `map_erase` | re-derived | V |
| a6–a8 | `i_k(G−γv) = i_k(G−v)`; `Δ_p` and favorability invariant | a1; `γ` bijects the `k`-subsets of `V∖{v}` onto those of `V∖{γv}` | re-derived; deltas recomputed (below) | V |
| a9 | `γF_p = F_p` for **every** `γ` | a3, a6–a8; no leaf guard needed | re-derived; `F_invariant_under_all_aut = true` on all 11 instances | V |
| a10 | `activeWeight_map_aut`: **if every member of `F` is a leaf (`hF`)**, then `w_{γF}(γB) = w_F(B)` for every `Finset B` | **`hF` is load-bearing.** In the body, `hvleaf := hF v (mem_inter.mp hv).1` (`Main.lean` l.898) feeds `tagWitnesses_map_aut G γ v hvleaf` (l.905) at each `v ∈ F ∩ B`. | re-derived. Leaf-guard demo: with non-leaf tags and an admissible off-leaf `support` value, the identity fails. On `P_4` (0-1-2-3) with reversal `g`, `F = {1,2}` and support "smallest neighbour": `w_F({0,2}) = 1` but `w_{gF}({1,3}) = 0`. | V |
| a11 | `γB → γA` ⇔ `B → A` | (D) through `map_erase`. (S): `γu ∉ γB` by injectivity; `\|N(γu) ∩ γB\| = \|γ(N(u) ∩ B)\| = 2` (`map_inter`, `card_map`); `γA = {γu} ∪ (γB ∖ N(γu))`. The converse applies the same to `γ⁻¹`. | re-derived. The literal relation was checked against constructive generation on every source (assert). `N(gX) = gN(X)` on 3,654 sampled (automorphism, family) pairs: 0 violations. | V |
| a12 | `γB ∈ I_j` ⇔ `B ∈ I_j` | cardinality preserved by `card_map`; a1 | re-derived; checked on every sampled automorphism | V |
| a13 | `N(γX) = γN(X)` (`covered_famMap`) | a11, a12, `γ⁻¹` round trip | computed, as a11 | V |
| a14 | `hF ∧ γF = F ⇒ w_F(γB) = w_F(B)` | a10, rewritten by `γF = F` | computed on every source and target, for every sampled automorphism: 0 violations | V |
| a15 | `hF ∧ γF = F ⇒ φ(γX) = φ(X)` | `Finset.sum_map` with a14 (supply), and with a13 + a14 (cov) | computed: `phi(gX) = phi(X)` on every sample | V |
| a16–a18 | `γX ∈ domain`; `γ` maps maximizers to maximizers; `\|γX\| = \|X\|` | a12; a15 + a16; `card_map` | re-derived | V |

(b) Supermodularity and the maximizer lattice.

| # | Statement | Hypotheses and where they enter | Evidence | Verdict |
|---|---|---|---|---|
| b1 | `N(X ∪ Y) = N(X) ∪ N(Y)` | an identity (∃ distributes over ∨) | 1,500 random pairs × 11 instances: 0 violations | V |
| b2 | `N(X ∩ Y) ⊆ N(X) ∩ N(Y)` | only an inclusion (correctly stated as one) | as b1 | V |
| b3 | `cov(X∪Y) + cov(X∩Y) ≤ cov X + cov Y` | b1 with `Finset.sum_union_inter` (an identity; the additive form of Mathlib `prod_union_inter`), plus b2 with `w ≥ 0` (a subset sum in ℕ) | re-derived | V |
| b4 | `supply(X∪Y) + supply(X∩Y) = supply X + supply Y` | `sum_union_inter`, an exact identity | checked on random pairs: 0 violations | V |
| b5 | `φX + φY ≤ φ(X∪Y) + φ(X∩Y)` | b3 and b4 cast to ℤ (`exact_mod_cast`, monotone `Nat.cast`), then linear arithmetic | 0 supermodularity violations | V |
| b6 | if `φX = φY = M` and `φ(X∪Y), φ(X∩Y) ≤ M`, then both equal `M` | b5: `2M ≤ φ(∪) + φ(∩) ≤ 2M`; `omega` over ℤ | re-derived; lattice closure checked on up to 60×60 maximizer pairs | V |
| b7 | the domain is nonempty (`∅`) and closed under `∪`/`∩`; `φ ≤ maxPhi` on it | powerset closure; `le_sup'` | re-derived | V |
| b8 | maximizers are closed under `∩` | b6, b7 | as b6 | V |
| b9 | `X_min := inf' maximizers` is a maximizer, and `X_min ⊆ Y` for every maximizer `Y` | `inf'_induction` (the dual of `sup'_induction`, `Data/Finset/Lattice/Fold.lean:579`) with b8; `inf'_le` (the dual of `le_sup'`, l.546–547) | Two independent instruments agree on `X_min`: exhaustive enumeration and the min-cut minimal source side. | V |

(c), (d), (e): invariance, positivity and deficiency.

| # | Statement | Hypotheses and where they enter | Evidence | Verdict |
|---|---|---|---|---|
| c | `γX_min = X_min` for every `γ : G ≃g G` | `hF` (from `favorableLeaves_leaf`, which is carried C1-LA1 entry 24) and `γF = F` (a9). a17 and b9 put `γX_min` among the maximizers; leastness gives `X_min ⊆ γX_min`; a18 and `eq_of_subset_of_card_le` then give equality. | **All 1,866,240 automorphisms** of `P_3 ⊔ K_{6,3,3,3}` were enumerated, and `X_min` is invariant under each. Every automorphism was also checked on the other 10 instances. | V |
| d | every member of `X_min` has `w_F > 0` | No hypothesis on `F`, and no use of `maxPhi > 0`. If `w(B) = 0`, then `Y = X_min ∖ {B}` has the same supply (`sum_erase`, removed term 0) and `N(Y) ⊆ N(X_min)`, so `cov Y ≤ cov X_min`. Hence `φY ≥ maxPhi`, so `Y` is a maximizer; leastness then gives `X_min ⊆ Y`, which contradicts `B ∉ Y`. | `X_min_all_positive = true` on every instance. Deleting a weight-0 member never lowered `φ` in 2,000 random trials per instance. | V |
| e1 | `WeightedHall G F p ⇔ ∀ X ∈ domain, φX ≤ 0` | `X ∈ domain ⇔ X ⊆ I_{p+1}` (`mem_powerset`); `filter_eq_covered`; exact `Nat.cast` monotonicity in both directions | Computed: `weighted_hall_holds` equals `maxphi ≤ 0` by construction; no random family ever exceeded `maxPhi` (3,000 trials per instance). | V |
| e2 | `filter_eq_covered`: the displayed filter equals `covered`, for any `DecidablePred` instance | extensionality through `mem_filter`, which does not depend on the instance (repair 4) | V-txt: stated with an explicit instance argument (l.1682–1685) and used by `rw` wherever `WeightedHall`, the terminal statement or the iff elaborated a filter | V |
| e3 | terminal theorem | `h`, through e1: some `X₀` has `φX₀ > 0`, so `maxPhi > 0`. Take `X := X_min`: `⊆ I_{p+1}` from the domain; (i) is c; (ii) is d; (iii) follows from `φ(X_min) = maxPhi > 0`, e2 and a strict `Nat.cast` (`exact_mod_cast`). | Every Hall-failing instance: `X_min` strictly deficient. | V |
| e4 | companion `weightedHall_iff_invariant` (the `(⇐)` proof is re-derived) | `(⇒)` is restriction. `(⇐)`: if Hall failed, then `maxPhi > 0`, `X_min` is invariant (c), and Hall at `X_min` would give `φ(X_min) ≤ 0 < maxPhi = φ(X_min)`. | re-derived; the statement is C-U1-T's text with only `theorem`→`lemma` changed (diff) | V |

### Casts and ℕ subtraction

| # | Statement | Evidence | Verdict |
|---|---|---|---|
| N1 | The new text contains no ℕ subtraction. The only `-` outside comments is `phi`'s ℤ subtraction. `Δ_p` is ℤ. The ℕ `p - 1` inside `C5LA1.aggregate` is outside the cone. | grep of entries 22–77 (`new_entries.lean.txt`); a grep for `aggregate` in 22–77 returns 0 | V-txt |
| N2 | Every ℕ↔ℤ passage is a monotone cast of `≤`/`<`/`=` between ℕ sums. `omega` runs on ℕ (`¬0<w ⇒ w=0`) or on ℤ-linear facts. `linarith` runs on ℤ only. | read l.1116–1120, 1635–1657, 1717–1726, 1805–1808, 1851–1853 | V |

## Reproduced Mathematical Evidence

**The instrument is my own and imports no prior evaluator.** `evaluator.py` (`65b9add1…a27c`) uses the standard library only.
Its explicit import list is `array, collections, hashlib, itertools, json, random, sys`. It is deterministic: seeded
`random.Random(0)` is used for sampling only, and there are no wall-clock fields. Two runs gave identical output. The output is
`evaluator-output.json` (`65b62c1fb1a370cd03c2733b1044db53537518ae4c02aad72a6208630c3cf5bc`), and the stdout summary is
`evaluator-stdout.txt` (`bcda5358…b4c9`).

- **Definitions.** Every definition is implemented literally from the Lean text (D1–D11). `transportRel` is evaluated literally
  over every (source, target) pair and asserted equal to the constructive (D) ∪ (S) generation.
- **Two independent maximizers of `φ`.**
  - (M1) Exact integer max-weight closure by Edmonds–Karp min cut over all families. `X_min` is the set of sources reachable
    from `s` in the residual graph (the minimal min cut). `X_max` is the set of sources that cannot reach `t` (the maximal min
    cut).
  - (M2) Exhaustive bitmask enumeration over **all** `2^{|I_{p+1}|}` families when `|I_{p+1}| ≤ 20`. Otherwise, over all
    `2^{|Pos|}` subsets of the positive-weight sources when `|Pos| ≤ 24`.
- **Automorphisms.** `Aut(G)` is enumerated completely by backtracking. The counts equal the structural orders: `P_7`: 2;
  `K_{1,5}`: 120; `DB(5;3,3)`: 72 = 3!·3!·2; `DB(3;4,4)`: 1152 = 4!·4!·2; `P_3 ⊔ K_{4,2}`: 96 = 2·4!·2!;
  `P_3 ⊔ K_{6,3,3,3}`: 1,866,240 = 2·6!·(3!)³·3!.

`DB(s;a,b)` is the double broom: a spine path on `s` vertices, with `a` pendant leaves on one end and `b` on the other. Both
order-11 variants were run at `p = 6`.

| Instance | `p` | `F` (Δ_p of leaves) | `\|I_{p+1}\|` / pos | layer supply / capacity | Hall | maxφ (M1 = M2) | `X_min`: size, weights, supply/cov | `X_max`: size (weight-0 members) | `\|Aut\|`; `X_min` invariant |
|---|---|---|---|---|---|---|---|---|---|
| path `P_7` | 2 | {0,6} (−6, −6) | 10 / 6 | 6 / 2 | **fails** | 4 = 4 (all 1,024 families) | 6, all w=1, 6/2 (strict) | 10 (4) | 2; yes |
| path `P_7` | 1 | ∅ (+4, +4) | 15 / 0 | 0 / 0 | holds | 0 = 0 | ∅ | 15 (15) | 2; yes |
| path `P_7` | 0 | ∅ | 7 / 0 | 0 / 0 | holds | 0 = 0 | ∅ | 7 (7) | 2; yes |
| star `K_{1,5}` | 3 | {1..5} (−3 each) | 5 / 5 | 20 / 30 | holds | 0 = 0 | ∅ | 0 | 120; yes |
| star `K_{1,5}` | 2 | {1..5} (−2 each) | 10 / 10 | 30 / 20 | **fails** | 10 = 10 | 10, all w=3, 30/20 (strict) | 10 (0) | 120; yes |
| `K_{1,5} ⊔ K_1` (isolated vertex) | 2 | {1..5} | 20 / 20 | 50 / 20 | **fails** | 30 = 30 (all 2^20 families) | 20, w ∈ {3,2}, 50/20 (strict) | 20 (0) | 120; yes |
| double broom `DB(5;3,3)`, n = 11 | 6 | 6 leaves (−7 each) | 9 / 9 | 48 / 156 | holds | 0 = 0 | ∅ | 0 | 72; yes |
| double broom `DB(3;4,4)`, n = 11 | 6 | 8 leaves (−20 each) | 36 / 36 | 224 / 448 | holds | 0 (M1 only) | ∅ | 0 | 1152; yes |
| `P_3 ⊔ K_{4,2}` | 0 | ∅ | 9 / 0 | 0 / 0 | holds | 0 = 0 | ∅ | 9 (9) | 96; yes |
| `P_3 ⊔ K_{4,2}` (non-tree) | 3 | {0,2} (−9, −9) | 20 / 7 | 14 / 12 | **fails** | 2 = 2 (all 1,048,576 families) | 7, all w=2, 14/12 (strict) | 20 (13) | 96; yes |
| **`P_3 ⊔ K_{6,3,3,3}` (non-tree)** | 4 | **{0,2} (−25, −25)** | 74 / 23 | **46 / 48** | **fails** | **10 = 10** (M1; M2 over all 8,388,608 positive subsets); max flow 36 | **20, all w=2, 40/30 (strict)** | **71 (51)** | **1,866,240; yes** |

**On the required failing instance `P_3 ⊔ K_{6,3,3,3}` at `p = 4`,** with `P_3` = 0-1-2 and the 6-part = {3..8}:
- **`F = {0,2}`.** I also derived this by hand: `I(K_{6,3,3,3}) = (1+x)^6 + 3(1+x)^3 − 3`, and
  `I(G−0) = (1+2x)·I(K)`, so `i_5 = 6 + 2·15 = 36`, `i_4 = 15 + 2·23 = 61`, and `Δ_4 = −25 < 0`.
- **The members of `X_min`.** They are exactly the `C(6,3) = 20` sets `{0,2} ∪ S` with `S` a 3-subset of the 6-part.
- **What holds on this instance:**
  - `X_min` is `Aut`-invariant under every one of the 1,866,240 automorphisms;
  - every member of `X_min` has weight 2 > 0;
  - `Σ_{N(X_min)} w = 30 < 40 = Σ_{X_min} w`;
  - `φ(X_min) = φ(X_max) = maxPhi = 10`;
  - `X_max` has 71 members, 51 of weight 0. That is every weight-0 source, and it contains all 21 tag-free sources.
- **Why the award uses `X_min`.** `X_max` contains weight-0 members here, so it cannot serve as the positive witness.
- **Agreement with the adjudication.** These values reproduce the U adjudication's replay data independently:
  `F = {0,2}`, 46/48, flow 36, maxφ 10, `|X_min| = 20` with 0 of weight 0, and `|X_max| = 71` with 51 of weight 0.

**Equivariance and supermodularity checks (all instances):**
- **Equivariance.** 0 violations of `I_j` equivariance, `w_F(γB) = w_F(B)`, `N(γX) = γN(X)` and `φ(γX) = φ(X)`. These ran over
  every automorphism on the 10 smaller instances, and over every 997th automorphism (1,872 of them) on the large one.
- **Supermodularity and modularity.** 0 violations of b1, b2, b4 and b5.
- **Lattice closure.** Every sampled pair of maximizers gave `∩`/`∪` maximizers.
- **Two instruments.** They agree on maxφ everywhere, and on `X_min` everywhere. They agree on `X_max` wherever the exhaustive
  method ran.
- **Scope of the tree rows.** The Hall failures on the tree rows `P_7`/2 and `K_{1,5}`/2 are bounded computations at ranks
  whose eligibility I did not evaluate. They are reported only as data for the graph-generic lemma, and are not evidence about
  (HALL).

**Carry checks.** `carry_check.py` (`368e72ab…ef57`) writes `carry_check.json` (`97e7ed21…5787`).
- **The 21 carried definitions and carried lemma #24.** C2-LA1 fragments 0001–0021 and 0031 are byte-identical to C1-LA1
  `Snippets/` 0001–0021 and 0024, 22/22. Their digests equal C1-LA1 `FORMALIZATION-STATE.json`.
- **`Main.lean`.** Its 77 entry blocks equal the 77 registered fragments, and their header digests equal the C2 state digests.
- **The new declarations against their cited origin lines:**
  - 36 are exact;
  - 9 differ in `theorem`→`lemma` only: 41, 42, 45, 50, 51, 58, 70, 72 and 74;
  - 5 differ by a whitespace/line break only: 23, 24, 25, 26 and 29;
  - 5 are re-derived: 22 `famMap`, 28 `maxPhi`, 30 `canonMin`, 76 (the `(⇐)` proof) and 77 (binders made explicit; proof body
    identical).
- **Pruned and uncarried names are absent.** `canonMax`, `isMaximizer_union`, `leafSet_map_aut`, `setEmb` (comment only) and
  every C1-LA1 entry 22, 23 and 25–36 name have no occurrence in `Main.lean`.
- **No new entry references an out-of-cone definition.** Entries 22–77 never mention `H`, `R`, `indepSetsAvoiding`,
  `indepSetCount`, `forwardDifferenceDel`, `aggregate`, `taggedFamily`, `layerWeight`, `IsSaturatingFlow`, `IsTree`,
  `crossingIndex`, `indepNum` or eligibility. So nothing marked "NOT a dependency" is one.

## Independent Critic Pass

I re-attacked the ledger above as a separate pass, assuming each closed row might be wrong.

1. **Vacuity.** Could the conclusion be met degenerately? `X = ∅` satisfies (i) and (ii) but not (iii), because `0 < 0` is
   false. The proof's witness is nonempty, since `φ(X_min) = maxPhi > 0 = φ(∅)`. The hypothesis is also satisfiable: 5 of 11
   instances fail Hall, 3 of them not trees (2 of those contain cycles). **Closed.**
2. **Is `γF = F` really available for every `γ`?** Yes. `F_p` is built only from the leaf predicate and from `i_k(G−v)`, and
   both are `Aut`-invariant (a3, a6–a8). It was checked under every automorphism. **Closed.**
3. **Is the leaf guard genuinely needed, or decorative?** It is genuine. Off the leaves `support` is a free choice, and the
   `P_4` demo shows that an admissible choice breaks a10 once `F` contains non-leaves. `F_p ⊆ leafSet` (entry 24) is exactly
   what discharges it. **Closed.**
4. **Does (d) secretly need (e)?** No. `canonMin_pos` holds for arbitrary `F` and uses neither `h` nor `maxPhi > 0`. It fails
   only if `X_min` is not least, and b9 gives leastness. **Closed.**
5. **Cardinality step in (c).** `card_famMap` needs the family map to be injective. It is `Finset.map` along a genuine
   embedding: `Finset.map_injective` of the vertex embedding. The equality then follows from `X_min ⊆ γX_min` and
   `|γX_min| ≤ |X_min|` (Mathlib `eq_of_subset_of_card_le`). **Closed.**
6. **Classical instances.** Could the terminal statement's filter use an instance different from `covered`'s and break (iii)?
   `filter_eq_covered` takes the instance as an explicit arbitrary argument, and its proof is membership extensionality.
   **Closed.**
7. **`p = 0` and disconnected graphs.** The informal proof claims no `p ≥ 1` and no connectivity. `p = 0` ran on two graphs, and
   disconnected graphs (`K_{1,5} ⊔ K_1`, `P_3 ⊔ K_…`) ran with Hall failing. Nothing breaks. **Closed.**
8. **Is my own instrument's `X_min` the least maximizer?** It is:
   - the min-cut `X_min` matched exhaustive enumeration over all `2^20` families on two Hall-failing instances
     (`P_3 ⊔ K_{4,2}` and `K_{1,5} ⊔ K_1`);
   - on the big instance, it matched exhaustive enumeration over all `2^23` positive subsets, which found a unique maximizer
     within `Pos`.

   **Closed.**
9. **Prose overstatement about `X_max` (O1; not a defect of the proof).** INFORMAL-PROOF §3(d) says "`X_max` would fail it:
   it contains every tag-free source (S12), and those have weight 0". The synthesis's S12 says "`X_max` is never the positive
   witness".
   - **Read universally, both are false.** On `K_{1,5}` at `p = 2` and on `K_{1,5} ⊔ K_1` at `p = 2`, Hall fails, there are no
     tag-free sources, and `X_max = X_min` has only positive members.
   - **The correct reading.** `X_max` contains every tag-free source, so positivity fails for `X_max` whenever a tag-free
     `(p+1)`-set exists. Hence positivity is not provable for `X_max` in general.
   - **Why this is not load-bearing.** The sentence is explanatory. The claim, the Lean statement and the proof assert
     nothing about `X_max`.
   - **Recorded as imprecise but true under the charitable reading.** The controller may want to soften "never" in any
     S12-derived text.
10. **Hypothesis ledger (O2; minor).** INFORMAL-PROOF §6 says `[DecidableRel G.Adj]` enters at `neighborFinset`. It also enters,
    with `[DecidableEq V]`, at the decidability of the `IsIndepSet` filter in `indepFamily` and `vertexDeletionIndepSetCount`
    (Mathlib `Combinatorics/SimpleGraph/Clique.lean:862`). The hypothesis list itself is complete and correct; only the "where
    it enters" enumeration is incomplete. **Not a defect.**
11. **Fidelity item 2 (O3).** §1's sentence identifies the Cycle 1 draft's `X.image (fun B => B.map γ.toEmbedding)` with
    `famMap` by reading `γ.toEmbedding` as the vertex embedding.
    - The set identity `famMap G γ X = {γ(B) : B ∈ X} = X.image (B ↦ B.map γ.toEquiv.toEmbedding)` is correct (`map_eq_image`).
    - The draft text itself is outside my read boundary, as it is outside the producer's, and the synthesis's `famMap` form
      governs.
    - **Not a defect.**
12. **Attribution range (O4).** The synthesis and brief credit the first-interior run with "definition entries 1–18". The
    informal proof says "entries 1–13 as carried by C1-LA1".
    - Per C-U1-T's critique, the carried definitions are first-interior snippets 0001–0006, 0008–0013 and 0018. That is range
      "1–18" in first-interior numbering, which becomes C1-LA1 entries 1–13.
    - The two statements are consistent; the informal proof uses C1-LA1 numbering, as the synthesis requires.
    - I did not open the first-interior source, which is outside my boundary. The producer's `CAPSULE-VERIFICATION.json`
      records 13/13 verbatim.
13. **Deviations of brief §2.5.** None of them touches the mathematics:
    - carried #24 is registered at index 31, text byte-identical;
    - there are nine `theorem`→`lemma` changes and five line-break-only edits, all verified above;
    - `famMap` is `setEmb` inlined (same function);
    - `maxPhi` and `canonMin` inline their Prop nonemptiness witnesses, so the values are unchanged by proof irrelevance;
    - the re-derived `(⇐)` of `weightedHall_iff_invariant` is the same `X_min` argument and is mathematically correct (e4).
14. **Attribution on the contract face (E1; non-mathematical escalation, not a proof defect).**
    - `INFORMAL-PROOF.md` §7 carries every item the synthesis requires: Codex GPT-6; r30 Cycle 1 (INV) and C1-LA1; the
      first-interior run; r26/r24/r25; U1 (Claude Sonnet 5) for (a) and (b); C-U1-T and C-U1-F (Claude Opus 5.5) for the
      closing theorem, independently; the U adjudicator.
    - The contract's own text carries only part of it. Its `informal_statement` has no attribution. `formulation_status` names
      U1 `INV.lean`, C-U1-T `CritINV.lean`, "both critics and the U adjudicator", r30 Cycle 1 and the `X_min` ruling. The
      definition descriptions name C1-LA1 and "first-interior text".
    - The contract does **not** name Codex GPT-6, C-U1-F, or the Sonnet 5 / Opus 5.5 model attributions.
    - `theorem-contract/v1` has no free-text scope field. The `informal_statement` is claim-hash-frozen (the `claim_sha256` the
      brief supplies). The contract digest-binds `INFORMAL-PROOF.md` as a source material.
    - I therefore record this as an item for the controller: carry §7's full attribution into the certificate, key statement
      and scope note at registration. It does not change the claim or any proof step.
15. **Outside my boundary, noted only.** The producer's D8 reports a synthesis-internal wording conflict: a `## Headline
    verdicts` scope note versus `## Lean awards` on the iff's grade. I did not read that section. The award face consistently
    registers `weightedHall_iff_invariant` as a companion `lemma` at `proved_informal`, with no certificate, as the brief
    requires.

**Critic pass outcome.** No closed ledger row reopened. There are four observations (O1–O4) and one governance escalation (E1).
None is a defect in the proof of the claim.

## Scope and Fence Check

**The claim asserts nothing fenced.** Each excluded conclusion was checked against the contract `informal_statement`, the
terminal Lean statement and `INFORMAL-PROOF.md`:

| Excluded / fenced item (synthesis `## Lean awards` C2-LA1; formalizer brief §2) | Asserted? | Where checked |
|---|---|---|
| (INV)'s quotient clause ("⇔ quotient Hall"; (LIFT)/S11) | No. "quotient" appears only in exclusion text (§8, §6 "not used"). The contract has no quotient text. | proof §§1, 6, 8; contract |
| Any `X_max` positivity claim | No. The contract says "X_min, not X_max". The proof says "never `X_max`" and gives a negative remark (see O1). | contract `formulation_status`; proof §§1, 3(d) |
| Any tree- or eligibility-specific strengthening | No. "Graph-generic; … no IsTree, no eligibility, no p >= 1." The Lean binders contain none. | statement; `Main.lean` l.1828–1836 |
| Any Hall, flow or cut conclusion | No. The terminal theorem is conditional on `¬ WeightedHall` and produces a deficient family; it asserts no Hall, flow or cut existence. The iff companion is `proved_informal`, with no certificate. | statement; proof §§3(e), 8 |
| Any claim that the full (INV) key is `formally_verified` | No. "It never closes the full (INV) key." The only occurrence of `formally_verified` in the proof is inside the exclusion list. | proof header, §8 |
| Sign content, (HALL), the primary aggregate, Erdős #993 | No. These appear only in fence text. `aggregate` is carried as a definition and is unused. | proof §8; grep |
| Attribution on the face | Complete in `INFORMAL-PROOF.md` §7. Partial in the contract's own text (E1). | see critic item 14 |

## Verdict

passed

The informal proof in `INFORMAL-PROOF.md` proves the contract's `informal_statement` (claim
`7bb53e287a30ac85f30a4d3da44807f44df2b1b0a361bf26fe20f3cbe9e472da`) at statement-level granularity.

- **The DAG is closed and correct.** Every step of (a)–(e) is a valid inference, and every equality used is an identity.
- **Casts are sound.** All ℕ/ℤ passages are monotone casts, and `φ` lives in ℤ.
- **The leaf guard is load-bearing exactly where claimed.** It sits in `activeWeight_map_aut`, discharged by C1-LA1 entry 24.
- **The definitions match the Lean source literally.** The 21 carried definitions and lemma #24 are byte-identical to
  C1-LA1's fragments. `famMap` is exactly the image of each member set.
- **The hypotheses match one-for-one:** finiteness and decidability only.
- **Nothing fenced is asserted.**
- **Independent exact recomputation agrees on 11 instances.** On the required Hall-failing non-tree
  `P_3 ⊔ K_{6,3,3,3}` at `p = 4`, it confirms `X_min` (20 members) is invariant under all 1,866,240
  automorphisms, all-positive, and strictly deficient (30 < 40), while `X_max` contains 51 weight-0 members.

Observations O1–O4 are non-load-bearing, and escalation E1 is for the controller.

Model disclosure: chartered Claude Opus 5.5 / high (dispatch-record authority); runtime-reported model id `claude-opus-5-5[1m]`.

**Read-boundary statement.**
- **What I read.** The brief-authorized files: the three boot files, the C2-LA1 run files named in §1, the capsule manifest and
  its members, the formalizer brief, the C1-LA1 files named, and Mathlib sources, grepped inside the Mathlib package directory
  only.
- **Over-reads, disclosed.**
  - Reading the synthesis, I listed all its heading lines to locate the two granted sections.
  - In the U adjudication, I read cross-route items 1–3, `## Established results` E1–E4 and the whole `## Lean readiness`
    section, including the NOT-READY groups. That is slightly beyond "U-A and the `X_min` ruling". Nothing outside U-A and
    item 1 is relied on.
  - Creating my scratch directory, a plain `ls` of `scratchpad/` showed sibling seat directory names. I opened none.
- **What I did not do.** No network, no installs, no `lake`/`lean`/`elan`. No `find`/`grep` rooted above the permitted paths.
  Every Python run was `python3 -B`.

**Scratch artifacts** (`scratchpad/c2-s7-informal-LA1/`):

| File | SHA-256 |
|---|---|
| `evaluator.py` | `65b9add1304646424d3a2d8256d5c5a98b1501f21ed145ef5127127a7430a27c` |
| `evaluator-output.json` | `65b62c1fb1a370cd03c2733b1044db53537518ae4c02aad72a6208630c3cf5bc` |
| `evaluator-stdout.txt` | `bcda53588b873a5c958643283ff685623b4e8a472ffcead088658cb2707bb4c9` |
| `carry_check.py` | `368e72ab64f3fcafae475f5e7b3bb7386457577e3b3d2ca7bfd8d1d8c4c9ef57` |
| `carry_check.json` | `97e7ed21f0d50c82017cd4ed4ecd90212e5e7d8619bbdc18f3a4c4e921425787` |
| `new_entries.lean.txt` (a copy of `Main.lean` entries 22–77, for grep) | `17a7599d828afabb18cf39b2920cd540027caa5b7c3c9bee9a248e7faf2dd47c` |
