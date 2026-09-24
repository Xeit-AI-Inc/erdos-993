# Theorem Contract: (EX) Forest extension inequality, with (DL) the forest degree lemma

- Contract ID: `e993-r27-c1-la1-forest-extension-inequality-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `58e4d0a8e5b473c06b5ca2d8693ad3f58bf5fa964cb2451a251837273b306997`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

(DL) For every finite forest G and every natural k, the total incident degree over the independent k-sets satisfies (indepDegreeSum G k : Int) <= 2 * k * indepCount G k. (EX) Consequently, for every finite forest G and every natural k, (Fintype.card X : Int) * indepCount G k <= (k + 1) * indepCount G (k + 1) + 3 * k * indepCount G k. Hypotheses: acyclicity and finiteness only. (DL) is an average over the independent k-sets and bounds no individual set. Mathematics: Fang-Lu-Nevo-Yao-Zheng 2026, section 8 (Lemma 8.1 with consequence (8.3); the displayed step of Proposition 8.2). Injection derivation of the root-corrected lemma: critic C-F1-T, sustained by the F adjudication. Compiled (EX) step: U3, re-derived by C-U1-T.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.forest_extension_inequality`
- Statement SHA-256: `47809abc5c4e94d89aa1859886dbd44cc040d742d3ed0b214aae7adcc240fe18`

```lean
theorem forest_extension_inequality {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    (Fintype.card X : ℤ) * Erdos993G1.indepCount G k
      ≤ (k + 1) * Erdos993G1.indepCount G (k + 1) + 3 * k * Erdos993G1.indepCount G k
```

## Quantifiers

- `forall X` over `domain-vertex-type`
- `forall G` over `domain-graph`
- `forall k` over `domain-rank`

## Hypotheses

- `hyp-finiteness`: [Fintype X] [DecidableEq X] : the vertex carrier is finite with decidable equality. Used everywhere; it is what makes the finsets and cardinalities meaningful.
- `hyp-decidable-adjacency`: [DecidableRel G.Adj] : adjacency is decidable. Bookkeeping instance for G.indepSetFinset, G.degree and the filters.
- `hyp-acyclicity`: hG : G.IsAcyclic : the graph is a finite forest (possibly disconnected, possibly empty). Consumed exactly once mathematically, inside the rooting API at Erdos993G1.rootPath_unique, and propagated from there. There is NO alpha/indepNum side condition and no other hypothesis.

## Conclusion

- `conclusion`: For every finite type X with decidable equality, every simple graph G on X with decidable adjacency that is acyclic, and every natural k: (Fintype.card X : Int) * Erdos993G1.indepCount G k <= (k + 1) * Erdos993G1.indepCount G (k + 1) + 3 * k * Erdos993G1.indepCount G k. This is (EX), the forest extension inequality, stated subtraction-free in the integers. It is an average statement over the independent k-sets; no pointwise degree claim and no order bound is asserted.

## Dependencies

- `domain-vertex-type` -> `def-indepcount`
- `domain-graph` -> `def-indepcount`
- `domain-rank` -> `def-indepcount`
- `def-indepcount` -> `def-coeff`
- `def-coeff` -> `def-delta`
- `domain-vertex-type` -> `def-closednbhdfinset`
- `domain-graph` -> `def-closednbhdfinset`
- `def-closednbhdfinset` -> `def-extensionfinset`
- `def-extensionfinset` -> `def-extensioncount`
- `domain-graph` -> `def-indepdegreesum`
- `domain-rank` -> `def-indepdegreesum`
- `domain-graph` -> `def-rootrep`
- `def-rootrep` -> `def-rootpath`
- `def-rootpath` -> `def-par`
- `def-rootpath` -> `def-rk`
- `def-par` -> `def-childrenfinset`
- `def-par` -> `def-uppairs`
- `domain-rank` -> `def-uppairs`
- `def-par` -> `def-downpairs`
- `domain-rank` -> `def-downpairs`
- `def-par` -> `def-rootpairs`
- `domain-rank` -> `def-rootpairs`
- `def-par` -> `def-swapmap`
- `domain-vertex-type` -> `domain-graph`
- `domain-vertex-type` -> `hyp-finiteness`
- `domain-graph` -> `hyp-decidable-adjacency`
- `domain-graph` -> `hyp-acyclicity`
- `hyp-finiteness` -> `conclusion`
- `hyp-decidable-adjacency` -> `conclusion`
- `hyp-acyclicity` -> `conclusion`
- `def-indepcount` -> `conclusion`
- `def-indepdegreesum` -> `conclusion`
- `def-extensioncount` -> `conclusion`
- `def-uppairs` -> `conclusion`
- `def-downpairs` -> `conclusion`
- `def-rootpairs` -> `conclusion`
- `def-swapmap` -> `conclusion`
- `def-childrenfinset` -> `conclusion`
- `def-rk` -> `conclusion`
- `domain-rank` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-fragment-0001`: `LeanProject/LeanProof/Snippets/0001-definition-Erdos993G1-indepCount.lean.fragment` (match)
- `source-fragment-0002`: `LeanProject/LeanProof/Snippets/0002-definition-Erdos993G1-coeff.lean.fragment` (match)
- `source-fragment-0003`: `LeanProject/LeanProof/Snippets/0003-definition-Erdos993G1-delta.lean.fragment` (match)
- `source-fragment-0004`: `LeanProject/LeanProof/Snippets/0004-definition-Erdos993G1-closedNbhdFinset.lean.fragment` (match)
- `source-fragment-0005`: `LeanProject/LeanProof/Snippets/0005-definition-Erdos993G1-extensionFinset.lean.fragment` (match)
- `source-fragment-0006`: `LeanProject/LeanProof/Snippets/0006-definition-Erdos993G1-e.lean.fragment` (match)
- `source-fragment-0007`: `LeanProject/LeanProof/Snippets/0007-definition-Erdos993G1-indepDegreeSum.lean.fragment` (match)
- `source-fragment-0017`: `LeanProject/LeanProof/Snippets/0017-lemma-Erdos993G1-indepCount_eq_card_indepSetFinset.lean.fragment` (match)
- `source-fragment-0018`: `LeanProject/LeanProof/Snippets/0018-lemma-Erdos993G1-mem_extensionFinset_iff.lean.fragment` (match)
- `source-fragment-0019`: `LeanProject/LeanProof/Snippets/0019-lemma-Erdos993G1-isNIndepSet_insert_of_mem_extensionFinset.lean.fragment` (match)
- `source-fragment-0020`: `LeanProject/LeanProof/Snippets/0020-lemma-Erdos993G1-isNIndepSet_erase_and_mem_extensionFinset.lean.fragment` (match)
- `source-fragment-0021`: `LeanProject/LeanProof/Snippets/0021-lemma-Erdos993G1-sigma_card_double_count.lean.fragment` (match)
- `source-fragment-0022`: `LeanProject/LeanProof/Snippets/0022-lemma-Erdos993G1-sum_card_indepSetFinset_succ.lean.fragment` (match)
- `source-fragment-0023`: `LeanProject/LeanProof/Snippets/0023-lemma-Erdos993G1-sum_e_eq_succ_mul_card.lean.fragment` (match)
- `source-fragment-0024`: `LeanProject/LeanProof/Snippets/0024-lemma-Erdos993G1-double_count.lean.fragment` (match)
- `source-fragment-0025`: `LeanProject/LeanProof/Snippets/0025-lemma-Erdos993G1-card_closedNbhdFinset_le.lean.fragment` (match)
- `source-fragment-0026`: `LeanProject/LeanProof/Snippets/0026-lemma-Erdos993G1-e_add_card_add_degreeSum_ge.lean.fragment` (match)
- `source-fragment-0027`: `LeanProject/LeanProof/Snippets/0027-lemma-Erdos993G1-e_ge_sub.lean.fragment` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-r25-award-lean`: `EVIDENCE/carried-sources/r25-c4-forest-descent-order-bound-Main.lean` (match)
- `source-u3-extension-lean`: `EVIDENCE/carried-sources/U3-Extension.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
