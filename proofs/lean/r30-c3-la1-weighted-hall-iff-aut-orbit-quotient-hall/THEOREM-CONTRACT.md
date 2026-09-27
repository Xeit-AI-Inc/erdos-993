# Theorem Contract: C3-LA1: weighted Hall for the fixed selector iff Hall on the full-Aut(G) orbit quotient (E993Transport.weightedHall_iff_autOrbitQuotientHall)

- Contract ID: `erdos-993-r30-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `6dd62fb3b551a484b1351912bd7c880ac1beb9c012280f9420df902c51ee460b`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

C3-LA1 terminal theorem of record, E993Transport.weightedHall_iff_autOrbitQuotientHall (C-U1-T's crit_weightedHall_iff_orbitQuotientHall, frozen sources/c3-stage7-sources/C-U1-T-CritAdv.lean 8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b, with the name changed and nothing else). SCOPE: for every finite vertex type V ([Fintype V], [DecidableEq V]), every simple graph G on V with [DecidableRel G.Adj], and every p : ℕ, with Γ = all of G ≃g G and the tag set favorableLeaves G p, weighted Hall for the fixed selector (WeightedHall G (favorableLeaves G p) p: every X ⊆ I_{p+1} supplies at most the active-tag weight of its (D) ∪ (S) targets in I_p) holds iff Hall holds on the Aut(G)-orbit quotient with orbit-total supplies and capacities, an orbit arc O → O' existing iff some member pair B ∈ O, A ∈ O' satisfies transportRel G B A. No IsTree, no eligibility, no p ≥ 1. KEY: E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL (registered proved_informal) upgrades to formally_verified at this statement's scope only if the isolated second read SR-C3-1 finds the registered text no wider; otherwise the award registers as E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR with a scope note on (INV). The controller decides; this contract asserts no grade. EXCLUDED CONCLUSIONS: no quotient feasibility; not (HALL) at any scope; not (LIFT) and not its feasibility; nothing for a proper subgroup of Aut(G), another tag set or another weight; no flow is constructed or implied; no tree, eligibility or aggregate-sign content; nothing about the size or enumerability of orbit spaces; C2-LA1's terminal content is not re-certified. Companions on the face are lemmas registering proved_informal only (R29-N-12). ATTRIBUTION: definitions of record — C1-LA1 (entries 1–13: the r24/r25/r26 definition layers C4LA1/C5LA1 and E993Interior.taggedFamily, carried from the first-interior award (Codex); entries 14–21: the E993Transport layer authored in r30 Cycle 1) and C2-LA1 (the supermodularity / canonMin apparatus; the invariant-family statement critic-derived by C-U1-T in Cycle 2); r30 Cycle 3: U1 (Claude Sonnet 5) for the orbit block; C-U1-T (Claude Opus 5.5) for the partition, the class-union identity and the terminal theorem; C-U1-F (Claude Opus 5.5) for the independent equivalent formalization; the U adjudicator for the kernel equivalence check adj_two_quotient_forms_agree; Codex (GPT-6) for the transport mechanism, the lower-region run and (LIFT)'s orbit-quotient conventions; r29 for the high tail that closes the complementary region (not used by this proof). REPAIRS ON THE FACE: U1's 'remaining gap' wording struck; the axiom count is ten / seven; the carry description as corrected (C2-LA1 carries C1-LA1 entries 1–21 plus 24 only). Canonical run id erdos-993-math-dre-20260926-r30-weighted-transport; workflow run lean-2026-09-27-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall; producer c3-la1-formalizer-opus-20260927.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.weightedHall_iff_autOrbitQuotientHall`
- Statement SHA-256: `3c5b2226c71307eb66bd7833efe6f68ad2bbc4192b253cf9d8683238568e3052`

```lean
theorem weightedHall_iff_autOrbitQuotientHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) :
    WeightedHall G (favorableLeaves G p) p ↔
      ∀ 𝒮 ⊆ (indepFamily G (p + 1)).image (orbitOf G (p + 1)),
        ∑ O ∈ 𝒮, supply G (favorableLeaves G p) O ≤
          ∑ O' ∈ ((indepFamily G p).image (orbitOf G p)).filter
              (fun O' => ∃ O ∈ 𝒮, ∃ B ∈ O, ∃ A ∈ O', transportRel G B A),
            supply G (favorableLeaves G p) O'
```

## Quantifiers

- `forall V` over `dom-vertex-type`
- `forall G` over `dom-graph`
- `forall p` over `dom-rank`
- `forall 𝒮` over `dom-source-orbit-families`

## Hypotheses

- `hyp-typeclass-binders`: Verbatim binders: variable {V : Type*} [Fintype V] [DecidableEq V]; (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ). These are the only hypotheses: no IsTree, no eligibility, no p ≥ 1.
- `hyp-full-automorphism-group`: Γ = all of G ≃g G. This is not a hypothesis of the declaration; it is built into orbitOf, which quantifies over every automorphism. No proper subgroup is treated.
- `hyp-tag-set-fixed-selector`: The tag set is exactly favorableLeaves G p (the fixed original strict selector) and the weight is exactly activeWeight; no other tag set or weight is treated.

## Conclusion

- `conclusion`: WeightedHall G (favorableLeaves G p) p holds iff, for every set 𝒮 of source Aut(G)-orbits of I_{p+1}, the sum of the orbit totals supply G (favorableLeaves G p) O over O ∈ 𝒮 is at most the sum of the orbit totals over the target orbits O' of I_p that are joined to 𝒮, where O' is joined to 𝒮 iff some B in some O ∈ 𝒮 and some A ∈ O' satisfy transportRel G B A. Exact Lean statement: theorem weightedHall_iff_autOrbitQuotientHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) :
    WeightedHall G (favorableLeaves G p) p ↔
      ∀ 𝒮 ⊆ (indepFamily G (p + 1)).image (orbitOf G (p + 1)),
        ∑ O ∈ 𝒮, supply G (favorableLeaves G p) O ≤
          ∑ O' ∈ ((indepFamily G p).image (orbitOf G p)).filter
              (fun O' => ∃ O ∈ 𝒮, ∃ B ∈ O, ∃ A ∈ O', transportRel G B A),
            supply G (favorableLeaves G p) O'

## Dependencies

- `def-is-graph-leaf` -> `def-support`
- `def-is-graph-leaf` -> `def-leaf-set`
- `def-vertex-deletion-count` -> `def-vertex-deletion-difference`
- `def-vertex-deletion-difference` -> `def-is-favorable-at`
- `def-leaf-set` -> `def-favorable-leaves`
- `def-is-favorable-at` -> `def-favorable-leaves`
- `def-support` -> `def-tag-witnesses`
- `def-tag-witnesses` -> `def-active-weight`
- `def-indep-family` -> `def-weighted-hall`
- `def-active-weight` -> `def-weighted-hall`
- `def-transport-rel` -> `def-weighted-hall`
- `def-active-weight` -> `def-supply`
- `def-indep-family` -> `def-orbit-of`
- `dom-vertex-type` -> `dom-graph`
- `dom-graph` -> `dom-source-orbit-families`
- `dom-rank` -> `dom-source-orbit-families`
- `def-indep-family` -> `dom-source-orbit-families`
- `def-orbit-of` -> `dom-source-orbit-families`
- `dom-vertex-type` -> `hyp-typeclass-binders`
- `dom-graph` -> `hyp-typeclass-binders`
- `dom-rank` -> `hyp-typeclass-binders`
- `def-orbit-of` -> `hyp-full-automorphism-group`
- `def-favorable-leaves` -> `hyp-tag-set-fixed-selector`
- `def-active-weight` -> `hyp-tag-set-fixed-selector`
- `hyp-typeclass-binders` -> `conclusion`
- `hyp-full-automorphism-group` -> `conclusion`
- `hyp-tag-set-fixed-selector` -> `conclusion`
- `def-weighted-hall` -> `conclusion`
- `def-supply` -> `conclusion`
- `def-transport-rel` -> `conclusion`
- `dom-source-orbit-families` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `c3-synthesis-frozen-statement`: `SOURCE/C3-SYNTHESIS.md` (match)
- `capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `carry-c-u1-t-critadv`: `SOURCE/C-U1-T-CritAdv.lean` (match)
- `carry-u1-main`: `SOURCE/U1-Main.lean` (match)
- `fragment-c1-la1-01`: `LeanProject/LeanProof/Snippets/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `fragment-c1-la1-02`: `LeanProject/LeanProof/Snippets/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `fragment-c1-la1-03`: `LeanProject/LeanProof/Snippets/0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `fragment-c1-la1-04`: `LeanProject/LeanProof/Snippets/0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `fragment-c1-la1-05`: `LeanProject/LeanProof/Snippets/0005-definition-C5LA1-support.lean.fragment` (match)
- `fragment-c1-la1-06`: `LeanProject/LeanProof/Snippets/0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `fragment-c1-la1-07`: `LeanProject/LeanProof/Snippets/0007-definition-C5LA1-H.lean.fragment` (match)
- `fragment-c1-la1-08`: `LeanProject/LeanProof/Snippets/0008-definition-C5LA1-R.lean.fragment` (match)
- `fragment-c1-la1-09`: `LeanProject/LeanProof/Snippets/0009-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `fragment-c1-la1-10`: `LeanProject/LeanProof/Snippets/0010-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `fragment-c1-la1-11`: `LeanProject/LeanProof/Snippets/0011-definition-C5LA1-forwardDifferenceDel.lean.fragment` (match)
- `fragment-c1-la1-12`: `LeanProject/LeanProof/Snippets/0012-definition-C5LA1-aggregate.lean.fragment` (match)
- `fragment-c1-la1-13`: `LeanProject/LeanProof/Snippets/0013-definition-E993Interior-taggedFamily.lean.fragment` (match)
- `fragment-c1-la1-14`: `LeanProject/LeanProof/Snippets/0014-definition-E993Transport-indepFamily.lean.fragment` (match)
- `fragment-c1-la1-15`: `LeanProject/LeanProof/Snippets/0015-definition-E993Transport-tagWitnesses.lean.fragment` (match)
- `fragment-c1-la1-16`: `LeanProject/LeanProof/Snippets/0016-definition-E993Transport-activeWeight.lean.fragment` (match)
- `fragment-c1-la1-17`: `LeanProject/LeanProof/Snippets/0017-definition-E993Transport-layerWeight.lean.fragment` (match)
- `fragment-c1-la1-18`: `LeanProject/LeanProof/Snippets/0018-definition-E993Transport-favorableLeaves.lean.fragment` (match)
- `fragment-c1-la1-19`: `LeanProject/LeanProof/Snippets/0019-definition-E993Transport-transportRel.lean.fragment` (match)
- `fragment-c1-la1-20`: `LeanProject/LeanProof/Snippets/0020-definition-E993Transport-IsSaturatingFlow.lean.fragment` (match)
- `fragment-c1-la1-21`: `LeanProject/LeanProof/Snippets/0021-definition-E993Transport-WeightedHall.lean.fragment` (match)
- `fragment-c1-la1-24`: `LeanProject/LeanProof/Snippets/0032-lemma-E993Transport-isGraphLeaf_of_mem_favorableLeaves.lean.fragment` (match)
- `fragment-c2-la1-22`: `LeanProject/LeanProof/Snippets/0022-definition-E993Transport-famMap.lean.fragment` (match)
- `fragment-c2-la1-23`: `LeanProject/LeanProof/Snippets/0023-definition-E993Transport-covered.lean.fragment` (match)
- `fragment-c2-la1-24`: `LeanProject/LeanProof/Snippets/0024-definition-E993Transport-cov.lean.fragment` (match)
- `fragment-c2-la1-25`: `LeanProject/LeanProof/Snippets/0025-definition-E993Transport-supply.lean.fragment` (match)
- `fragment-c2-la1-26`: `LeanProject/LeanProof/Snippets/0026-definition-E993Transport-phi.lean.fragment` (match)
- `fragment-c2-la1-27`: `LeanProject/LeanProof/Snippets/0027-definition-E993Transport-domain.lean.fragment` (match)
- `fragment-c2-la1-28`: `LeanProject/LeanProof/Snippets/0028-definition-E993Transport-maxPhi.lean.fragment` (match)
- `fragment-c2-la1-29`: `LeanProject/LeanProof/Snippets/0029-definition-E993Transport-maximizers.lean.fragment` (match)
- `fragment-c2-la1-30`: `LeanProject/LeanProof/Snippets/0030-definition-E993Transport-canonMin.lean.fragment` (match)
- `fragment-c2-la1-32`: `LeanProject/LeanProof/Snippets/0033-lemma-E993Transport-isIndepSet_map_aut.lean.fragment` (match)
- `fragment-c2-la1-33`: `LeanProject/LeanProof/Snippets/0034-lemma-E993Transport-neighborFinset_map_aut.lean.fragment` (match)
- `fragment-c2-la1-34`: `LeanProject/LeanProof/Snippets/0035-lemma-E993Transport-isGraphLeaf_map_aut.lean.fragment` (match)
- `fragment-c2-la1-35`: `LeanProject/LeanProof/Snippets/0036-lemma-E993Transport-support_spec.lean.fragment` (match)
- `fragment-c2-la1-36`: `LeanProject/LeanProof/Snippets/0037-lemma-E993Transport-support_map_aut.lean.fragment` (match)
- `fragment-c2-la1-37`: `LeanProject/LeanProof/Snippets/0038-lemma-E993Transport-tagWitnesses_map_aut.lean.fragment` (match)
- `fragment-c2-la1-38`: `LeanProject/LeanProof/Snippets/0039-lemma-E993Transport-mem_leafSet_iff.lean.fragment` (match)
- `fragment-c2-la1-39`: `LeanProject/LeanProof/Snippets/0040-lemma-E993Transport-vertexDeletionIndepSetCount_map_aut.lean.fragment` (match)
- `fragment-c2-la1-40`: `LeanProject/LeanProof/Snippets/0041-lemma-E993Transport-isFavorableAt_map_aut.lean.fragment` (match)
- `fragment-c2-la1-41`: `LeanProject/LeanProof/Snippets/0042-lemma-E993Transport-favorableLeaves_map_aut.lean.fragment` (match)
- `fragment-c2-la1-42`: `LeanProject/LeanProof/Snippets/0043-lemma-E993Transport-activeWeight_map_aut.lean.fragment` (match)
- `fragment-c2-la1-43`: `LeanProject/LeanProof/Snippets/0044-lemma-E993Transport-map_map_symm_self.lean.fragment` (match)
- `fragment-c2-la1-44`: `LeanProject/LeanProof/Snippets/0045-lemma-E993Transport-transportRel_map_aut_mp.lean.fragment` (match)
- `fragment-c2-la1-45`: `LeanProject/LeanProof/Snippets/0046-lemma-E993Transport-transportRel_map_aut.lean.fragment` (match)
- `fragment-c2-la1-46`: `LeanProject/LeanProof/Snippets/0047-lemma-E993Transport-covered_union.lean.fragment` (match)
- `fragment-c2-la1-47`: `LeanProject/LeanProof/Snippets/0048-lemma-E993Transport-covered_inter_subset.lean.fragment` (match)
- `fragment-c2-la1-48`: `LeanProject/LeanProof/Snippets/0049-lemma-E993Transport-cov_submodular.lean.fragment` (match)
- `fragment-c2-la1-49`: `LeanProject/LeanProof/Snippets/0050-lemma-E993Transport-supply_modular.lean.fragment` (match)
- `fragment-c2-la1-50`: `LeanProject/LeanProof/Snippets/0051-lemma-E993Transport-phi_supermodular.lean.fragment` (match)
- `fragment-c2-la1-51`: `LeanProject/LeanProof/Snippets/0052-lemma-E993Transport-isMaximizer_union_inter.lean.fragment` (match)
- `fragment-c2-la1-52`: `LeanProject/LeanProof/Snippets/0053-lemma-E993Transport-domain_nonempty.lean.fragment` (match)
- `fragment-c2-la1-53`: `LeanProject/LeanProof/Snippets/0054-lemma-E993Transport-maximizers_nonempty.lean.fragment` (match)
- `fragment-c2-la1-54`: `LeanProject/LeanProof/Snippets/0055-lemma-E993Transport-le_maxPhi_of_mem_domain.lean.fragment` (match)
- `fragment-c2-la1-55`: `LeanProject/LeanProof/Snippets/0056-lemma-E993Transport-mem_domain_union.lean.fragment` (match)
- `fragment-c2-la1-56`: `LeanProject/LeanProof/Snippets/0057-lemma-E993Transport-mem_domain_inter.lean.fragment` (match)
- `fragment-c2-la1-57`: `LeanProject/LeanProof/Snippets/0058-lemma-E993Transport-isMaximizer_inter.lean.fragment` (match)
- `fragment-c2-la1-58`: `LeanProject/LeanProof/Snippets/0059-lemma-E993Transport-canonMin_isMaximizer.lean.fragment` (match)
- `fragment-c2-la1-59`: `LeanProject/LeanProof/Snippets/0060-lemma-E993Transport-mem_famMap.lean.fragment` (match)
- `fragment-c2-la1-60`: `LeanProject/LeanProof/Snippets/0061-lemma-E993Transport-map_symm_map_self.lean.fragment` (match)
- `fragment-c2-la1-61`: `LeanProject/LeanProof/Snippets/0062-lemma-E993Transport-mem_indepFamily_map.lean.fragment` (match)
- `fragment-c2-la1-62`: `LeanProject/LeanProof/Snippets/0063-lemma-E993Transport-covered_famMap.lean.fragment` (match)
- `fragment-c2-la1-63`: `LeanProject/LeanProof/Snippets/0064-lemma-E993Transport-activeWeight_map_of_invariant.lean.fragment` (match)
- `fragment-c2-la1-64`: `LeanProject/LeanProof/Snippets/0065-lemma-E993Transport-supply_famMap.lean.fragment` (match)
- `fragment-c2-la1-65`: `LeanProject/LeanProof/Snippets/0066-lemma-E993Transport-cov_famMap.lean.fragment` (match)
- `fragment-c2-la1-66`: `LeanProject/LeanProof/Snippets/0067-lemma-E993Transport-phi_famMap.lean.fragment` (match)
- `fragment-c2-la1-67`: `LeanProject/LeanProof/Snippets/0068-lemma-E993Transport-famMap_mem_domain.lean.fragment` (match)
- `fragment-c2-la1-68`: `LeanProject/LeanProof/Snippets/0069-lemma-E993Transport-famMap_mem_maximizers.lean.fragment` (match)
- `fragment-c2-la1-69`: `LeanProject/LeanProof/Snippets/0070-lemma-E993Transport-card_famMap.lean.fragment` (match)
- `fragment-c2-la1-70`: `LeanProject/LeanProof/Snippets/0071-lemma-E993Transport-canonMin_famMap.lean.fragment` (match)
- `fragment-c2-la1-71`: `LeanProject/LeanProof/Snippets/0072-lemma-E993Transport-covered_mono.lean.fragment` (match)
- `fragment-c2-la1-72`: `LeanProject/LeanProof/Snippets/0073-lemma-E993Transport-canonMin_pos.lean.fragment` (match)
- `fragment-c2-la1-73`: `LeanProject/LeanProof/Snippets/0074-lemma-E993Transport-filter_eq_covered.lean.fragment` (match)
- `fragment-c2-la1-74`: `LeanProject/LeanProof/Snippets/0075-lemma-E993Transport-weightedHall_iff_phi_nonpos.lean.fragment` (match)
- `fragment-c2-la1-75`: `LeanProject/LeanProof/Snippets/0076-lemma-E993Transport-favorableLeaves_leaf.lean.fragment` (match)
- `fragment-c2-la1-76`: `LeanProject/LeanProof/Snippets/0077-lemma-E993Transport-weightedHall_iff_invariant.lean.fragment` (match)
- `fragment-new-31`: `LeanProject/LeanProof/Snippets/0031-definition-E993Transport-orbitOf.lean.fragment` (match)
- `fragment-new-78`: `LeanProject/LeanProof/Snippets/0078-lemma-E993Transport-mem_orbitOf_self.lean.fragment` (match)
- `fragment-new-79`: `LeanProject/LeanProof/Snippets/0079-lemma-E993Transport-orbitOf_subset_of_mem_invariant.lean.fragment` (match)
- `fragment-new-80`: `LeanProject/LeanProof/Snippets/0080-lemma-E993Transport-invariant_iff_orbitOf_subset.lean.fragment` (match)
- `fragment-new-81`: `LeanProject/LeanProof/Snippets/0081-lemma-E993Transport-covered_orbitUnion.lean.fragment` (match)
- `fragment-new-82`: `LeanProject/LeanProof/Snippets/0082-lemma-E993Transport-crit_map_map_aut.lean.fragment` (match)
- `fragment-new-83`: `LeanProject/LeanProof/Snippets/0083-lemma-E993Transport-crit_orbitOf_eq_of_mem.lean.fragment` (match)
- `fragment-new-84`: `LeanProject/LeanProof/Snippets/0084-lemma-E993Transport-crit_orbitOf_subset.lean.fragment` (match)
- `fragment-new-85`: `LeanProject/LeanProof/Snippets/0085-lemma-E993Transport-crit_orbits_pairwiseDisjoint.lean.fragment` (match)
- `fragment-new-86`: `LeanProject/LeanProof/Snippets/0086-lemma-E993Transport-crit_biUnion_orbits.lean.fragment` (match)
- `fragment-new-87`: `LeanProject/LeanProof/Snippets/0087-lemma-E993Transport-crit_supply_eq_sum_orbits.lean.fragment` (match)
- `fragment-new-88`: `LeanProject/LeanProof/Snippets/0088-lemma-E993Transport-crit_sum_biUnion_orbits.lean.fragment` (match)
- `fragment-new-89`: `LeanProject/LeanProof/Snippets/0089-theorem-E993Transport-weightedHall_iff_autOrbitQuotientHall.lean.fragment` (match)
- `informal-proof`: `INFORMAL-PROOF.md` (match)
- `semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
