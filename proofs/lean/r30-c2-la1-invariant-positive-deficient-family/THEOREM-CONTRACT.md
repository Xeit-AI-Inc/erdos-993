# Theorem Contract: E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY (r30 C2-LA1): failure of weighted Hall for the fixed selector yields an Aut(G)-invariant, positive-weight, deficient source family (X_min)

- Contract ID: `erdos-993-r30-c2-la1-aut-invariant-positive-deficient-family-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `f0f50c2a7b920bfe9f566e8ce0bb9177f048d104a9e213daa133c47565aa3e0d`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Canonical run id erdos-993-math-dre-20260926-r30-weighted-transport. For every finite type V with decidable equality, every simple graph G on V with decidable adjacency, and every p in N, let F = favorableLeaves G p (the fixed strict selector F_p(G)). If WeightedHall G F p fails, then there is a family X of independent (p+1)-sets (X a subset of I_(p+1)(G)) such that (i) famMap G gamma X = X for every graph automorphism gamma : G ≃g G, where famMap G gamma X is the image under gamma of each member set of X; (ii) every member B of X has active weight activeWeight G F B > 0 (active tags: v in F intersect B with (B minus {v}) meeting W_v); and (iii) the total active weight of the targets N(X) = {A in I_p(G) : some B in X has transportRel G B A}, under exactly (D) union (S), is strictly less than the total active weight of X. The witness is X_min, the least maximizer of phi = supply - cov. Graph-generic; hypotheses are finiteness and decidability only (no IsTree, no eligibility, no p >= 1). Companions on the face (weightedHall_iff_invariant, weightedHall_iff_phi_nonpos, favorableLeaves_map_aut, activeWeight_map_aut, transportRel_map_aut, phi_supermodular, canonMin_isMaximizer, canonMin_famMap, canonMin_pos, filter_eq_covered) are lemmas with no certificate of their own.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.exists_aut_invariant_deficient_of_not_weightedHall`
- Statement SHA-256: `34ba6dccf54495a248b18447a5821ef879c2d14c6c97b2e65ae5126bbaff824c`

```lean
theorem exists_aut_invariant_deficient_of_not_weightedHall {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (h : ¬ WeightedHall G (favorableLeaves G p) p) :
    ∃ X ⊆ indepFamily G (p + 1),
      (∀ γ : G ≃g G, famMap G γ X = X) ∧
      (∀ B ∈ X, 0 < activeWeight G (favorableLeaves G p) B) ∧
      ∑ A ∈ (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A),
          activeWeight G (favorableLeaves G p) A <
        ∑ B ∈ X, activeWeight G (favorableLeaves G p) B
```

## Quantifiers

- `forall V` over `dom-vertex-type`
- `forall G` over `dom-graph`
- `forall p` over `dom-rank`
- `exists X` over `dom-source-family`
- `forall γ` over `dom-automorphism`
- `forall B` over `dom-vertex-set`

## Hypotheses

- `hyp-finite-vertex-type`: [Fintype V] [DecidableEq V]
- `hyp-decidable-adjacency`: [DecidableRel G.Adj]
- `hyp-not-weighted-hall`: (h : ¬ WeightedHall G (favorableLeaves G p) p)

## Conclusion

- `conclusion`: ∃ X ⊆ indepFamily G (p + 1),
      (∀ γ : G ≃g G, famMap G γ X = X) ∧
      (∀ B ∈ X, 0 < activeWeight G (favorableLeaves G p) B) ∧
      ∑ A ∈ (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A),
          activeWeight G (favorableLeaves G p) A <
        ∑ B ∈ X, activeWeight G (favorableLeaves G p) B

## Dependencies

- `def-vertex-deletion-indep-set-count` -> `def-vertex-deletion-forward-difference`
- `def-vertex-deletion-forward-difference` -> `def-is-favorable-at`
- `def-is-graph-leaf` -> `def-support`
- `def-is-graph-leaf` -> `def-leaf-set`
- `def-support` -> `def-tag-witnesses`
- `def-tag-witnesses` -> `def-active-weight`
- `def-leaf-set` -> `def-favorable-leaves`
- `def-is-favorable-at` -> `def-favorable-leaves`
- `def-indep-family` -> `def-weighted-hall`
- `def-active-weight` -> `def-weighted-hall`
- `def-transport-rel` -> `def-weighted-hall`
- `dom-vertex-type` -> `dom-graph`
- `dom-vertex-type` -> `dom-source-family`
- `dom-graph` -> `dom-automorphism`
- `dom-vertex-type` -> `dom-vertex-set`
- `dom-vertex-type` -> `hyp-finite-vertex-type`
- `dom-graph` -> `hyp-decidable-adjacency`
- `def-weighted-hall` -> `hyp-not-weighted-hall`
- `def-favorable-leaves` -> `hyp-not-weighted-hall`
- `dom-graph` -> `hyp-not-weighted-hall`
- `dom-rank` -> `hyp-not-weighted-hall`
- `hyp-finite-vertex-type` -> `conclusion`
- `hyp-decidable-adjacency` -> `conclusion`
- `hyp-not-weighted-hall` -> `conclusion`
- `def-indep-family` -> `conclusion`
- `def-fam-map` -> `conclusion`
- `def-active-weight` -> `conclusion`
- `def-favorable-leaves` -> `conclusion`
- `def-transport-rel` -> `conclusion`
- `dom-source-family` -> `conclusion`
- `dom-automorphism` -> `conclusion`
- `dom-vertex-set` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `c1la1-axioms`: `SOURCE/c1la1/axioms.txt` (match)
- `c1la1-formalization-state`: `SOURCE/c1la1/FORMALIZATION-STATE.json` (match)
- `c1la1-fragment-0001`: `SOURCE/c1la1-fragments/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `c1la1-fragment-0002`: `SOURCE/c1la1-fragments/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `c1la1-fragment-0003`: `SOURCE/c1la1-fragments/0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `c1la1-fragment-0004`: `SOURCE/c1la1-fragments/0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `c1la1-fragment-0005`: `SOURCE/c1la1-fragments/0005-definition-C5LA1-support.lean.fragment` (match)
- `c1la1-fragment-0006`: `SOURCE/c1la1-fragments/0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `c1la1-fragment-0007`: `SOURCE/c1la1-fragments/0007-definition-C5LA1-H.lean.fragment` (match)
- `c1la1-fragment-0008`: `SOURCE/c1la1-fragments/0008-definition-C5LA1-R.lean.fragment` (match)
- `c1la1-fragment-0009`: `SOURCE/c1la1-fragments/0009-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `c1la1-fragment-0010`: `SOURCE/c1la1-fragments/0010-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `c1la1-fragment-0011`: `SOURCE/c1la1-fragments/0011-definition-C5LA1-forwardDifferenceDel.lean.fragment` (match)
- `c1la1-fragment-0012`: `SOURCE/c1la1-fragments/0012-definition-C5LA1-aggregate.lean.fragment` (match)
- `c1la1-fragment-0013`: `SOURCE/c1la1-fragments/0013-definition-E993Interior-taggedFamily.lean.fragment` (match)
- `c1la1-fragment-0014`: `SOURCE/c1la1-fragments/0014-definition-E993Transport-indepFamily.lean.fragment` (match)
- `c1la1-fragment-0015`: `SOURCE/c1la1-fragments/0015-definition-E993Transport-tagWitnesses.lean.fragment` (match)
- `c1la1-fragment-0016`: `SOURCE/c1la1-fragments/0016-definition-E993Transport-activeWeight.lean.fragment` (match)
- `c1la1-fragment-0017`: `SOURCE/c1la1-fragments/0017-definition-E993Transport-layerWeight.lean.fragment` (match)
- `c1la1-fragment-0018`: `SOURCE/c1la1-fragments/0018-definition-E993Transport-favorableLeaves.lean.fragment` (match)
- `c1la1-fragment-0019`: `SOURCE/c1la1-fragments/0019-definition-E993Transport-transportRel.lean.fragment` (match)
- `c1la1-fragment-0020`: `SOURCE/c1la1-fragments/0020-definition-E993Transport-IsSaturatingFlow.lean.fragment` (match)
- `c1la1-fragment-0021`: `SOURCE/c1la1-fragments/0021-definition-E993Transport-WeightedHall.lean.fragment` (match)
- `c1la1-fragment-0024`: `SOURCE/c1la1-fragments/0024-lemma-E993Transport-isGraphLeaf_of_mem_favorableLeaves.lean.fragment` (match)
- `c1la1-kernel-receipt`: `SOURCE/c1la1/kernel-verification.json` (match)
- `c1la1-main-lean`: `SOURCE/c1la1/Main.lean` (match)
- `c1la1-verification-report`: `SOURCE/c1la1/VERIFICATION-REPORT.json` (match)
- `capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `carry-c-u1-t-critaxioms`: `SOURCE/carry/C-U1-T-CritAxioms.lean` (match)
- `carry-c-u1-t-critinv`: `SOURCE/carry/C-U1-T-CritINV.lean` (match)
- `carry-source-digests`: `SOURCE/carry/SOURCE-DIGESTS.json` (match)
- `carry-u1-axiomcheck`: `SOURCE/carry/U1-AxiomCheck.lean` (match)
- `carry-u1-inv`: `SOURCE/carry/U1-INV.lean` (match)
- `formalizer-brief-la1`: `SOURCE/C2-STAGE7-FORMALIZER-BRIEF-LA1.md` (match)
- `informal-proof`: `INFORMAL-PROOF.md` (match)
- `semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `solution-contract`: `SOURCE/SOLUTION-CONTRACT.md` (match)
- `stage7-protocol`: `SOURCE/C2-STAGE7-PROTOCOL.md` (match)
- `synthesis-lean-awards-c2-la1`: `SOURCE/SYNTHESIS.md` (match)
- `u-adjudication`: `SOURCE/U-ADJUDICATION.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
