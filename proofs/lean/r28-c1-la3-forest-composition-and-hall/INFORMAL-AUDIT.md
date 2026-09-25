---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la3-formalizer-opus-20260925
critic_id: c1-la3-fable-informal-20260925
attestation_id: c1-la3-informal-pass-20260925
claim_sha256: 34f5f58887b2e9e90eaa1ca1eba7f34079681dacacc77f4496d145f5b496d267
---

# Informal Proof Integrity Audit

**Boot acknowledgment.** I am operating within VerityOS. Loaded: `verity.md`, `identity/startup-protocol.md`,
`skills/proof-integrity-audit/skill.md`. Subsystems: `experiments/` (this run only) and `skills/` (the audit
skill). The brief limits writes to this file and scratch under `scratchpad/c1-s7-informal-LA3/`, so I wrote no
`conversations/` record and nothing else outside that directory.

**Model disclosure.** The runtime reports this model as **Claude Opus 5.5 (1M context)**, model id
`claude-opus-5-5[1m]`. The dispatch record charters the seat as Claude Opus 5 at high effort. The seat cannot
inspect its own reasoning effort, so the effort level rests on the dispatch record. The reviewer id
`c1-la3-fable-informal-20260925` was assigned by the controller. No child agents were used.

**Seat.** Independent informal proof-integrity reviewer (kind
`independent-mathematical-proof-integrity-reviewer`) for award C1-LA3, r28 Cycle 1 Stage 7. I did not produce
this artifact, and I edited no run artifact.

## Intended Claim

The claim is the contract's `theorem.informal_statement`
(`THEOREM-CONTRACT.yaml`, SHA-256 `b66b680ac9463a25b133d61d1c6eb2531f187e4fec91995933743877f3f394a4`, as
expected). I recomputed `claim_sha256` = SHA-256(`" ".join(s.split())`) =
`34f5f58887b2e9e90eaa1ca1eba7f34079681dacacc77f4496d145f5b496d267`, which equals the brief's value.

In substance the claim has two keys.

1. **(FC), corrected (erratum R28-E-c), key `E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES`: the terminal `theorem`
   `Erdos993G1.forest_degree_lemma_of_tree_degree_lemma`.** Take a finite type `X : Type u`, an acyclic
   `G : SimpleGraph X` and `k : ℕ`. Suppose that for every tree `T` on any finite carrier `Y : Type u` and every
   `a ≤ k`, `(D_a(T) : ℤ) ≤ 2a·i_a(T)`. Then `(D_k(G) : ℤ) ≤ 2k·i_k(G)`. Here `i = Erdos993G1.indepCount` (r25
   entry 1) and `D = Erdos993G1.indepDegreeSum` (r27 entry 7).
2. **Companion `lemma` `Erdos993G1.sdr_iff_threshold_pos_of_tree`, key `E993-R28-SDR-THRESHOLD-EQUIVALENCE`.**
   It registers independently. On a finite tree, for each `k`: an injection `R28U2.Slot G → X` landing on leaves
   with `occ(v) ≤ occ(f s)` exists iff `∀ t ≥ 1, slotsAtLeast G k t ≤ leavesAtLeast G k t`.

The claim also carries its scope declarations, fences and attribution.

Artifacts audited, with their digests verified before use:
- `INFORMAL-PROOF.md`: `d558726424fa2a657feb41cdb8805d52c9eda20a1251ac24b47446debc3a13b1`.
- `LeanProject/LeanProof/Main.lean`: `ede8142b23676d868564ca45c718d16154f1e2a93db14d206ca8b4cb6ef8668a`.
- Capsule `C1-LA3-PACKET-MANIFEST.json`: I recomputed the seal (compact key-sorted JSON minus `seal_sha256`) as
  `cd0793879058dda81e8c7f688d601ae20565aed6d58875b9a87002fd832fe7b9`, which matches. All 44 members match
  their bytes and digests.
- `sources/c1-stage7-sources/SOURCE-DIGESTS.json`: all 7 entries match.
- The run-local `SOURCES/` copies are byte-equal to their capsule originals.

The terminal's source text, from `theorem` up to but excluding ` :=`, is byte-equal to
`lean_binding.expected_statement`: SHA-256 `0ed31930…b2b0`, recomputed. It is also byte-equal to the formalizer
brief's §2 code block. The SDR face's statement text hashes to `2c793ddf…b338`, as the report states.

## Claim Ledger

Each row gives the claim, the hypotheses it uses and where they enter, the evidence, and the verdict.
"Recomputed" means my own instrument (next section). "Lean text" means I read the exact declaration in `Main.lean`.

| # | Claim (INFORMAL-PROOF §) | Hypotheses and where they enter | Evidence | Verdict |
|---|---|---|---|---|
| D1 | `indepCount` = ℤ-cast `Nat.card` of `IsNIndepSet k` finsets (G1 entry 1) | none | Byte-for-byte equal to r25 entry 1. The entry digest `5484fc21…` is reproduced from the body. | verified |
| D2 | `indepDegreeSum k = Σ_{J∈I_k} Σ_{v∈J} deg v` (ℕ; r27 entry 7) | section variables | Byte-for-byte equal to r27 entry 7 (`a1ed32eb…`). Semantically identical to U2's retyped copy, which is not transported. | verified |
| D3 | `indepCount_eq_card_indepSetFinset` (r25 entry 4) | `Fintype`, `DecidableEq`, `DecidableRel` | Byte-for-byte equal to r25 entry 4 (`4463e7ee…`). Registered as entry 14, which the controller ruling (2) accepts. | verified |
| D4 | `occ`, `slotsAtLeast`, `leavesAtLeast` in the §2 text, one namespace | `deg v − 2` inside `slotsAtLeast` | Lean text equals SOLUTION-CONTRACT §2 up to U2's type ascription `(Finset.univ : Finset X)`. The ℕ subtraction is guarded by the filter `3 ≤ deg v`, so truncation never occurs. | verified |
| D5 | `Branch`, `LeafT`, `Slot := Σ v : Branch G, Fin (deg v.1 − 2)` | `3 ≤ deg v` via the subtype | `Slot` unfolds to the synthesis's `Σ v : {v // 3 ≤ deg v}, Fin (deg v − 2)`. `deg v − 2 ≥ 1` on `Branch`, so there is no truncation. | verified |
| D6 | `indepFinsetOn`, `indepCountOn`, `indepDegreeSumOn` are Finset-relative with the AMBIENT degree; `splitPair`, `joinPair` | none | Lean text read. The recomputation implements the same definitions. | verified |
| FC-1 | `i_k(S∪T) = Σ_{a≤k} i_a(S) i_{k−a}(T)` and `D_k(S∪T) = Σ_{a≤k}[D_a(S) i_{k−a}(T) + i_a(S) D_{k−a}(T)]` (`indepCountOn_union`, `indepDegreeSumOn_union`) | `hsep` enters only in `joinPair_mem`, via `isIndepSet_union_iff`. `hdisj` enters in `splitPair_mem` (size split), `joinPair_mem`, `splitPair_joinPair`, and the sum split in `indepDegreeSumOn_union_filter_sum`. `k − a` is guarded by `a ∈ range (k+1)`. No acyclicity, no connectivity. | Recomputed. 9,267 component splits of all 638 forests to order 10: 0 failures. 18,225 arbitrary (non-closed) separated disjoint pairs in forests: 0 failures. 6,340 random pairs in general graphs, cycles included: 0 failures. | verified; see note N1 |
| FC-1n | Both `hsep` and `hdisj` are necessary | — | Recomputed. Without `hsep`, splitting `K_2` into its two vertices gives `i_2`: 0 vs 1, and `D_2`: 0 vs 2. Without `hdisj`, `S = T = {v}` in `K_1` gives `i_1`: 1 vs 2, and `hsep` holds vacuously there. The `D` identity also fails without `hdisj`: `S = T = {0}` in `K_2` gives `D_1`: 1 vs 2, with `hsep` holding. | verified |
| FC-2 | Two-piece inequality `degree_lemma_on_union` (C-U2-T); independently `dl_union` (C-U2-F) | Bound at EVERY `a ≤ k` on both pieces (`hS a ha'`, `hT (k−a) (sub_le)`); `hsep`, `hdisj` through FC-1 | Lean text read. The termwise identity `2a·i_a i_c + i_a·2c·i_c = 2(a+c) i_a i_c` holds, and I checked the termwise inequality as an integer statement on a grid. Casts: none; everything is in ℕ, with `k = a + c` substituted or `2k = 2a + 2(k−a)` under `a ≤ k`. | verified |
| FC-3 | `bridge`: on an adjacency-closed `s`, `D_k(G.induce s)` and `\|I_k(G.induce s)\|` equal the Finset-relative ambient counts | Closure enters in `degree_induce_of_neighborSet_subset` (Mathlib `Finite.lean:647`: induced degree = degree when `N(v) ⊆ s`) | Recomputed. 94,705 checks on closed sets of forests plus every component of 1,500 random graphs: 0 failures. Closure is necessary: in 1,161 of 1,161 non-closed sets (one neighbour removed), the `D` values differ. | verified |
| FC-4 | `supp_closed`: a component's support is adjacency-closed, for any graph | none | Mathlib `mem_supp_congr_adj` (`Connected.lean:572`), read. | verified |
| FC-5 | `degree_lemma_of_components`: for ANY finite graph, `∀ C, ∀ a ≤ k, D_a(G[C]) ≤ 2a·i_a(G[C])` ⇒ `D_k(G) ≤ 2k·i_k(G)` | The component hypothesis is used at `b ≤ a ≤ k` (`hC C b (hb.trans ha)`). The base case uses `sum_empty_on`. The union of all supports is `univ`. The ℤ face comes via `indepCount_eq_card_indepSetFinset` and `exact_mod_cast`, with no subtraction. No acyclicity. | Recomputed on 1,500 random general graphs (cycles allowed): 5,695 instances with the hypothesis true, 0 failures of the conclusion. 486 of those are non-trivial: some component fails (DL) at a larger size. | verified |
| FC-5s | The single-`k` hypothesis (SOLUTION-CONTRACT §2) does not compose | — | Recomputed. `K_4 ⊔ K_4`, `k = 2`: each `K_4` has `i_2 = D_2 = 0`, so the single-`k` hypothesis holds, but the union has `D_2 = 96 > 64 = 2·2·16` with `i_2 = 16`. The every-`a` hypothesis fails at `a = 1` (`D_1(K_4) = 12 > 8`). Random general graphs give 4 more instances where the single-`k` hypothesis holds and the conclusion fails. | verified |
| FC-6 | `forest_degree_lemma_of_components_allk`: `_hG` on the face, unused | — | Lean text: the body is `degree_lemma_of_components G k hcomp`. | verified |
| FC-7 | `induce_supp_isTree`: components of an acyclic graph, induced, are trees | `hG` consumed here, via `IsAcyclic.induce` (`Acyclic.lean:96`). Connectivity comes from `maximal_connected_induce_supp` (`Connected.lean:691`). | Lean text and the Mathlib statements read. | verified |
| FC-8 | Terminal: apply FC-5 with `fun C a ha => htree (G.induce C.supp) (induce_supp_isTree G hG C) a ha` | `htree` is consumed at every `a ≤ k` on the carrier `↥C.supp : Type u`, which is the same universe, so the `{Y : Type u}` binder covers it. `hG` is consumed only through FC-7. There is no `k ≥ 1` and no `n ≥ 2` hypothesis. At `k = 0` both sides are 0. | Lean text read. The hypotheses match the claim one-for-one (acyclic `G`; trees in universe `u`; every `a ≤ k`; ℤ form). Recomputed: at `k = 0`, `i_0 = 1` and `D_0 = 0` on all 638 forests. The hypothesis is genuinely consumed; r27's `forest_degree_lemma` does not occur in the code (see Scope). | verified |
| S-1 | `nested_hall_iff_threshold`: Hall's condition for `f a ≤ g b` over all `A` ⟺ `∀ t, #{f ≥ t} ≤ #{g ≥ t}` | None. The direction (⇐) uses a minimiser of `f` on `A` and nestedness. | Recomputed on 10,225 `(f, g)` instances: exhaustive for sizes ≤ 3 with values in 0..3, plus 3,000 random instances of size ≤ 6. 0 mismatches. | verified |
| S-2 | `sdr_iff_threshold_abstract`: S-1 plus Mathlib Hall | — | Mathlib `Fintype.all_card_le_filter_rel_iff_exists_injective` at `Hall/Basic.lean:196`, read at the pin (`905b9581…`). Recomputed against literal injection search on the same 10,225 instances: 0 mismatches. | verified; see note N3 |
| S-3 | `sdr_iff_threshold`: any finite graph, all `t : ℕ` including `t = 0` | No tree hypothesis. Uses the counting bridges `card_filter_slot_eq` and `card_filter_leaf_eq`. | Recomputed. Every forest to order 10 at every `k ≤ n+1` (7,018 instances) and 1,500 random general graphs (10,731 instances): SDR ⟺ all-`t`, 0 mismatches. The matcher was cross-checked against literal injection search on 1,328 small instances. | verified |
| S-3n | The `t ≥ 1` form is insufficient off trees | — | Recomputed. At `K_4`, `k = 2`: rows are `t = 0: 4 > 0` and `t = 1: 0 ≤ 0`, so the `t ≥ 1` form holds while SDR is false (matcher and brute force agree; 4 slots, 0 leaves). Random general graphs give 3,113 instances where `t ≥ 1` holds and SDR fails. | verified |
| S-4 | `tree_slots_zero_le`: on a tree, `slotsAtLeast k 0 ≤ leavesAtLeast k 0` | `hT` supplies connectivity (`card_isolated_le_one`) and `IsTree.card_edgeFinset` (`\|E\|+1 = n`, `Acyclic.lean:296`). The handshake is `sum_degrees_eq_twice_card_edges`. The computation is in ℤ, and the ℕ subtraction `deg − 2` is cast only under `3 ≤ deg`. | Recomputed. The per-vertex identity `[d≥3](d∸2) − [d=1] = (d−2) + 2[d=0]` holds in ℤ for `d = 0..50`. On all 2,211 tree instances, leaves − slots is 2 for `n ≥ 2` and 0 for `n = 1`. | verified |
| S-5 | `R28CritU2F.sdr_iff_threshold_pos_of_tree`: on a tree, all `t` ⟺ `t ≥ 1` | `hT` is used only through S-4 | Lean text read. Recomputed: tree SDR ⟺ `t ≥ 1` on all 2,211 instances, 0 mismatches. | verified |
| S-6 | Award face: codomain `X` with `deg = 1` ⟺ codomain `LeafT G` | — | Lean text: `Subtype.val` / `Subtype.ext` transfer, a correct equivalence. | verified |
| C1 | The two keys are independent; the SDR face is not a dependency of the terminal | — | Textual closure over `Main.lean`. The terminal's closure has 27 entries; the SDR face's has 16; their intersection is empty. The SDR face uses no G1 entry and no FC declaration. No `R28CritU2F.*` declaration lies in the terminal's closure. | verified; see note N2 |
| C2 | Cast audit (§5) | — | Every item checked above. The only ℕ subtractions are `deg − 2` (guarded) and `k − a` (guarded). No casts of subtractions occur. | verified |
| C3 | Carry table (§7): 46 carried = 12 byte-identical + 19 N1 + 15 N2; 2 in-run; G1 entries byte-identical | — | Independent check (`check_transport.py`). For all 46, stripping the wrapper and undoing N1/N2 recovers a whole-line block of the frozen carry file at exactly the cited lines, and each span is complete. The kind and line range of every row agree with `DRAFTS/carry-table.json`. The entry counts (13 definitions, 37 lemmas, 1 theorem) are reproduced, as are the carry file byte sizes (24,884 / 10,299 / 9,008) and the excluded span at U2 lines 463–479. | verified (controller ruling (1)) |

## Reproduced Mathematical Evidence

All instruments were written from scratch for this audit under
`scratchpad/c1-s7-informal-LA3/` (run root). They use only the standard library, work in exact integers, use
fixed seeds, contain no wall-clock fields, and import no prior evaluator. Runs were in the foreground with
`PYTHONDONTWRITEBYTECODE=1`.

- `replay.py` (`9f3fc084ada21004df786870dba459f109e4491c8840daac0ae63d5d2b772784`; imports `itertools`,
  `json`, `random`, `sys`). Output is `replay-output.json`
  (`fa8687c57fe9848c03066b30c7062fa9d6fc7a313e952e376f802b84d52372af`). A second run produced a byte-identical
  output.
  - **Grid.** All unlabeled forests of order 0–10: 638, matching A005195 (1, 1, 2, 3, 6, 10, 20, 37, 76, 153, 329).
    They are built from all unlabeled trees to order 10, which match A000055 (1, 1, 1, 2, 3, 6, 11, 23, 47, 106).
    Also 1,500 random general graphs of order 1–9 with edge density 0.15–0.7, seed 20260925.
  - **Results.** All results are zero-failure unless a count is shown:
    - convolution identities (both), on component splits, arbitrary separated pairs and general graphs;
    - `bridge` on closed sets, with closure shown necessary;
    - the graph-general peel (FC-5), including 486 non-trivial instances;
    - the single-`k` defect: `K_4 ⊔ K_4` plus 4 random witnesses;
    - SDR ⟺ all-`t` (graph-general);
    - tree SDR ⟺ `t ≥ 1`;
    - the tree `t = 0` row, with leaves − slots exactly 2 (or 0 at `n = 1`);
    - abstract nested Hall, against both the Hall condition and literal injections;
    - the `K_4`, `k = 2` failure of the `t ≥ 1` form (as the addendum requires);
    - the necessity witnesses for `hsep` and `hdisj`;
    - the (FC-2) termwise inequality on an integer grid;
    - the (S-4) per-vertex identity;
    - the `k = 0` row.
  - **Fence sentence** ("`T22`'s threshold failure is exactly a matching failure"). Replayed on the synthesis's
    `T22`:
    - `IsTree`; `α = 13`; branch vertices `{0,1,8,15}`; leaves `{4,7,11,14,18,21}`.
    - At `k = 12`: the only failing row is `t = 18` (`1 > 0`); `c_0(12) = 18`, every leaf count is 17; the maximum
      matching is 3 of 4; `D_12 = 372 ≤ 456`.
    - At `k = 11`: rows `t = 137..141` fail (`1 > 0`); the maximum matching is 3 of 4; `D_11 = 3099 ≤ 3762`.
    - The tree equivalence has 0 mismatches for `k = 0..14`.
    - These figures agree with synthesis item 1.
- `check_transport.py` (`55411c84ffde4b438579db5370dea13de3de407b68336d603f63ee7d932b1120`; imports `hashlib`,
  `re`, `sys`, `pathlib`). Output is `transport-check-output.txt`
  (`cac8f828bacc73acd9becc4a2a34b258e5b897fe4737a4e6a3482d0f7cd97512`).
  - All 46 transports recover the original bytes, so the sample the addendum asks for is here the whole population.
  - Code-level hits (comments stripped) are 0 for each of: `slot_leaf_sdr_exists`, `tree_leaf_slot_dominance`,
    `Erdos993G1.forest_degree_lemma`, `sorry`, `admit`, `native_decide`, `decide`, `axiom`.
- `dep_closure.py` (`4a56967d096d8d798b9a0f249f91b4ba00054696390ce796855d1bd57cd98d6b`; imports `re`, `sys`).
  Output is `dep-closure-output.txt` (`c1728a15f9d31ef24b907983b3d739558a98df3055a2453035be6d98aaaff9b9`).
  - It gives the closures in row C1.
  - `IsAcyclic` occurs only in the terminal, `induce_supp_isTree`, and the two carried faces that pass `hG`
    through.
  - `hsep` and `hdisj` occur where FC-1 states.
  - The closure is textual; the kernel is the authority on the true dependency graph.
- G1 entry comparison (inline script). Run entries 1, 14 and 2 are byte-equal, body and digest, to r25 entries 1
  and 4 and r27 entry 7. All 51 entry digests equal the SHA-256 of their bodies.
- The Mathlib statements were read at the pin (`905b95818eb32af7874a58b427f50c1711a5e96c`):
  - `Fintype.all_card_le_filter_rel_iff_exists_injective` (`Hall/Basic.lean:196`);
  - `Fintype.prod_equiv`/`sum_equiv` (`BigOperators/Group/Finset/Defs.lean:722`, inside `namespace Fintype`
    686–737), which confirms the repair literal;
  - `IsTree.card_edgeFinset`, `IsAcyclic.induce`, `degree_induce_of_neighborSet_subset`, `mem_supp_congr_adj`,
    `maximal_connected_induce_supp`, `sum_degrees_eq_twice_card_edges`.
- `EVIDENCE/axioms.txt` and `EVIDENCE/axioms-all-declarations.txt`: 51 declarations; 48 use exactly
  `[propext, Classical.choice, Quot.sound]` and 3 use the subset `[propext, Quot.sound]`.

Not reproducible within my read boundary: the SR-JOIN counts "841" and "5,625" (SR-JOIN is not a capsule member).
The repair "841 → 5,625 for the convolution" is a citation literal. The capsule's U adjudication (lines 178–179)
and C-U2-F's critique (lines 291–293) agree on it independently, and U2's own return quotes 5,625 for the
convolution at line 214. It carries no mathematical weight in the proof.

## Independent Critic Pass

I re-read my own ledger as an adversary. Six challenges, and how each resolves:

1. **Is the (FC) hypothesis genuinely consumed, or could (DL) be imported from r27?**
   - r27's `forest_degree_lemma` is absent from the code.
   - The terminal's closure contains no (DL) proof.
   - `htree` is the only source of component bounds, and it is applied at every `a ≤ k` inside the peel.
   - The conclusion does not follow from `htree` by instantiating it at `T := G`, since `G` need not be a tree.
     The forests with ≥ 2 components and the empty carrier show this.
   - So the composition is load-bearing.
2. **Universe and quantifier.** `htree` binds `{Y : Type u}`, the universe of `X`. `↥C.supp : Type u`. The
   binder is `∀ a ≤ k`, not `∀ a`. Per erratum R28-E-c this weakens the hypothesis relative to C-U2-T's compiled
   model, so the terminal is the stronger statement, and the informal proof says so correctly.
3. **Is acyclicity consumed elsewhere?**
   - The terminal body uses `hG` only in `induce_supp_isTree G hG C`.
   - `degree_lemma_of_components` has no acyclicity.
   - The recomputation confirms the peel on cyclic graphs.
4. **Could the Hall equivalence smuggle in (HS)?** No.
   - The SDR face is an iff. It is proved from a graph-general `∀ t` equivalence and the tree `t = 0` row, which is
     a consequence of `|E| = n − 1` and not of (HS).
   - `T22` witnesses both sides failing together.
   - The informal proof claims neither side.
5. **Are the "necessary" claims actually sharp?** Yes. Minimal witnesses exhibit failure for each hypothesis, and
   for the `D` identity as well as the `i` identity.
6. **Weak points found. None is a defect of the proof.**
   - **N1.** FC-1's prose says `hdisj` "enters in `splitPair_joinPair` / `joinPair_mem`". It also enters in
     `splitPair_mem` (the size split) and the degree-sum split. The list is incomplete but not false.
   - **N2.** The §8 DAG prose "G1 entries → run-local definitions (`occ`, …)" and "`degree_lemma_on_union` /
     `dl_union` → … terminal" are presentation orderings. `occ` does not depend on the G1 entries, and C-U2-F's
     `dl_union` core is carried as independent corroboration, outside the terminal's closure; §3 of the proof says
     so. §1's "disjoint apart from the G1 entries" is true: the closures are in fact fully disjoint.
   - **N3.** §4 (S-2) says Mathlib's Hall theorem is "built on
     `Finset.all_card_le_biUnion_card_iff_existsInjective'`". It directly applies the unprimed
     `Finset.all_card_le_biUnion_card_iff_exists_injective`, which Mathlib bootstraps from the primed one
     (`Hall/Basic.lean:113–116`). This is transitive, and accurate.
   - **N4 (advisory, attribution completeness).** INFORMAL-PROOF §6 carries the full attribution, both the group
     list and the common list: r27 `C-T2-U`, the r27 T adjudicator (`2 ≤ n`), SR-JOIN JN-3/JN-2, FLNYZ 2026 §8, and
     Hall. The contract's `informal_statement` carries the formalizer brief §2's group attribution verbatim, SR-PP
     (PP-3) included, but not the common items `C-T2-U`, the r27 T adjudicator and FLNYZ. The synthesis ("common to
     every face") and SOLUTION-CONTRACT §3.6 require the common list. It is present on the award's informal-proof
     face, which the contract digests as `theorem_intent`. This is a presentation matter for the controller and
     fidelity review, not a proof-integrity defect.

Having re-read every ledger row against the Lean text and the recomputation, I find no row that changes verdict.

## Scope and Fence Check

- **Nothing fenced is asserted.**
  - (FC) is never composed with r27's `forest_degree_lemma`. That declaration is not carried, has 0 code-level
    occurrences, and is named only in fence prose.
  - (FC) is presented as the formal consequence clause of `E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION`,
    with the §2 single-`k` defect recorded with witness `K_4 ⊔ K_4`, `k = 2`, which I recomputed.
  - The SDR equivalence is stated per `(G, k)` and "never evidence for either side".
  - There is no status transfer (SOLUTION-CONTRACT §3.1).
  - No claim of (DL), (HS), (HS-SDR) or any no-recovery statement is made.
  - No grade outside SOLUTION-CONTRACT §4 is used: no `formally_verified_conditional` and no `compiled`.
- **Excluded declarations.**
  - `R28U2.slot_leaf_sdr_exists`: 0 occurrences anywhere in `Main.lean`.
  - `R28U2.tree_leaf_slot_dominance`: exactly one occurrence, at `Main.lean` line 1039. It sits inside the `/-- … -/`
    docstring of the carried `R28CritU2T.forest_degree_lemma_of_tree_degree_lemma` and is prose only, with 0
    code-level occurrences. This confirms the addendum item.
  - Neither is in any closure.
- **Addendum checks.**
  - (FC) quantifies over trees on `Y : Type u` at every `a ≤ k`, and the hypothesis is consumed: verified.
  - Acyclicity is consumed only in `induce_supp_isTree`: verified.
  - Both convolutions consume both `hsep` and `hdisj`, and each is necessary: verified.
  - `sdr_iff_threshold_pos_of_tree` uses `t ≥ 1` together with the tree `t = 0` lemma: verified.
  - The graph-general `sdr_iff_threshold` quantifies over all `t : ℕ`: verified.
  - Replays cover all forests to order 10 and random general graphs, and `K_4`, `k = 2` fails the `t ≥ 1` form as
    required: verified.
- **Controller rulings.**
  - (1) I verified the 34 N1/N2 transports as keyword- or whitespace-only; all of them, not a sample, reverse to
    the original bytes.
  - (2) Entry-4 ordering: noted.
  - (3) Run-id practice: noted.
- **Attribution.**
  - The formalizer brief §2 attribution travels verbatim on both INFORMAL-PROOF §6 and the contract scope text.
  - Critic-authored bodies are critic-attributed on the informal-proof face and in the carry table (C-U2-T,
    C-U2-F). The contract carries them in its (FC)/SDR attribution.
  - For common attribution, see advisory N4.
- **Read-boundary disclosure.** Beyond the listed files I took directory listings only (run, capsule and
  scratchpad names). I printed the `verdict` field of `RECEIPTS/kernel-verification.json`, which is not on my
  read list; nothing in this audit relies on it. I audit the mathematics, not the kernel. I ran no `lake`,
  `lean`, `elan` or install, started no background jobs, and ran no `find` or `grep` rooted above the permitted
  paths.

## Verdict

passed

The informal proof establishes the contract's intended claim at statement-level granularity:
- every definition matches the Lean text and the G1 entries of record byte-for-byte;
- every hypothesis is named where it enters and matches the terminal declaration one-for-one;
- every ℕ subtraction is guarded;
- every identity used is recomputed exactly;
- the sharpness witnesses fail exactly where the record says;
- nothing fenced is asserted.

Notes N1–N3 are imprecisions in prose that do not affect any step. N4 is an advisory on the placement of the
common attribution, for the controller and fidelity review.

Model disclosure: runtime-reported model Claude Opus 5.5 (1M context), id `claude-opus-5-5[1m]`; chartered as
Claude Opus 5 at high effort on dispatch-record authority; the seat cannot inspect its own effort; no child agents.
