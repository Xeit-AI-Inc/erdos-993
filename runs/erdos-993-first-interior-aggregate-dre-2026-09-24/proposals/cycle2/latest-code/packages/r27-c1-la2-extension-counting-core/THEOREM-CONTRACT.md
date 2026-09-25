# Theorem Contract: C1-LA2 - the unconditional counting core: the independent-set extension double count and the extension lower bound

- Contract ID: `e993-r27-c1-la2-extension-counting-core-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `eb4dcdf58415ea2ee82868e18a54fc747e14b45a6969a05c5497a2ef36fb7c0c`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Two graph-general statements about an arbitrary finite simple graph G on a finite vertex type X, with n = Fintype.card X, i_k(G) = Erdos993G1.indepCount G k, I_k(G) = G.indepSetFinset k, and e(J) = Erdos993G1.e G J = |V \ N[J]| the number of vertices extending J to an independent set. (1) THE DOUBLE COUNT (registered as the lemma Erdos993G1.double_count, the award's first face): ((k : ℤ) + 1) * Erdos993G1.indepCount G (k + 1) = ∑ J ∈ G.indepSetFinset k, (Erdos993G1.e G J : ℤ), for every k : ℕ. (2) THE EXTENSION LOWER BOUND (registered as the terminal theorem Erdos993G1.e_ge_sub, the award's second face and the declaration this contract binds): (Erdos993G1.e G J : ℤ) ≥ (Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ) for every k : ℕ and every J with hJ : G.IsNIndepSet k J. Hypotheses are exactly [Fintype X], [DecidableEq X], [DecidableRel G.Adj] and, for (2), hJ. THERE IS NO ACYCLICITY HYPOTHESIS on either statement, no (★) hypothesis and no hyp-alpha; a stray G.IsAcyclic binder on either is struck at fidelity review. Mathematics: Fang-Lu-Nevo-Yao-Zheng 2026, arXiv:2609.20961v1, §8 (Lemma 8.1 / (8.1) and the displayed step of Proposition 8.2); the double count is classical (the extension method). Derivation in run r27: seat U3 (compiled), critic C-U1-T (independent re-derivation), U adjudicator (replay). These are graph-general facts: they are not forest statements, they transfer no status, and they are not evidence for (DL) or (EX).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.e_ge_sub`
- Statement SHA-256: `cd7190f59b1ba5ef1e99c70604a7f1fb9247d125def309294bec703b13e2139e`

```lean
theorem e_ge_sub {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) {J : Finset X} (hJ : G.IsNIndepSet k J) :
    (Erdos993G1.e G J : ℤ) ≥ (Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ)
```

## Quantifiers

- `forall X` over `dom-vertex-type`
- `forall G` over `dom-graph`
- `forall k` over `dom-rank`
- `forall J` over `dom-indep-set`

## Hypotheses

- `hyp-fintype`: `[Fintype X]`: the vertex type carries a `Fintype` instance. Enters everywhere (`Finset.univ`, `Fintype.card X`, `G.indepSetFinset`, `G.neighborFinset`).
- `hyp-decidable-eq`: `[DecidableEq X]`: decidable equality on vertices. Enters everywhere (`Finset` union, set difference, `insert`, `erase`, `biUnion`).
- `hyp-decidable-adj`: `[DecidableRel G.Adj]`: decidable adjacency. Enters everywhere (`G.neighborFinset`, `G.degree`, `G.indepSetFinset`).
- `hyp-indep-k-set`: `hJ : G.IsNIndepSet k J`: `J` is an independent set of cardinality `k`. Enters exactly once, in the terminal declaration, and is used there only through `hJ.card_eq : J.card = k`. NO acyclicity hypothesis, NO `(★)` hypothesis, NO `hyp-alpha`, and no `α(G)` side condition occurs in this contract.

## Conclusion

- `conclusion`: For every finite simple graph `G` on `X`, every `k : ℕ` and every independent `k`-set `J`, the number of extensions of `J` satisfies `e(J) ≥ n - k - ∑_{v ∈ J} deg(v)` in `ℤ`, where `n = Fintype.card X`. Stated in `ℤ`; no natural-number subtraction occurs at any point of the development. Excluded: this is a graph-general fact, not a forest statement; it transfers no status to any r25/r26/r27 forest key, NR1, FOREST, TREE, TRANSFER or Erdős #993; and it is not evidence for (DL) or (EX).

## Dependencies

- `dom-vertex-type` -> `def-fintype-card`
- `dom-graph` -> `def-neighbor-finset`
- `def-neighbor-finset` -> `def-degree`
- `dom-graph` -> `def-is-n-indep-set`
- `dom-rank` -> `def-is-n-indep-set`
- `dom-indep-set` -> `def-is-n-indep-set`
- `def-is-n-indep-set` -> `def-indep-set-finset`
- `def-is-n-indep-set` -> `def-indep-count`
- `def-indep-count` -> `def-coeff`
- `def-coeff` -> `def-delta`
- `def-neighbor-finset` -> `def-closed-nbhd-finset`
- `dom-indep-set` -> `def-closed-nbhd-finset`
- `def-closed-nbhd-finset` -> `def-extension-finset`
- `def-extension-finset` -> `def-extension-count`
- `def-indep-set-finset` -> `def-indep-degree-sum`
- `def-degree` -> `def-indep-degree-sum`
- `def-delta` -> `def-first-descent`
- `dom-vertex-type` -> `dom-graph`
- `dom-vertex-type` -> `dom-indep-set`
- `dom-vertex-type` -> `hyp-fintype`
- `dom-vertex-type` -> `hyp-decidable-eq`
- `dom-graph` -> `hyp-decidable-adj`
- `def-is-n-indep-set` -> `hyp-indep-k-set`
- `dom-rank` -> `hyp-indep-k-set`
- `dom-indep-set` -> `hyp-indep-k-set`
- `def-extension-count` -> `conclusion`
- `def-fintype-card` -> `conclusion`
- `def-degree` -> `conclusion`
- `hyp-fintype` -> `conclusion`
- `hyp-decidable-eq` -> `conclusion`
- `hyp-decidable-adj` -> `conclusion`
- `hyp-indep-k-set` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-cu1t-rederivation`: `SOURCES/C-U1-T-CriticAdvances.lean` (match)
- `source-entry-01-indepcount`: `LeanProject/LeanProof/Snippets/0001-definition-Erdos993G1-indepCount.lean.fragment` (match)
- `source-entry-02-coeff`: `LeanProject/LeanProof/Snippets/0002-definition-Erdos993G1-coeff.lean.fragment` (match)
- `source-entry-03-delta`: `LeanProject/LeanProof/Snippets/0003-definition-Erdos993G1-delta.lean.fragment` (match)
- `source-entry-04-closednbhdfinset`: `LeanProject/LeanProof/Snippets/0004-definition-Erdos993G1-closedNbhdFinset.lean.fragment` (match)
- `source-entry-05-extensionfinset`: `LeanProject/LeanProof/Snippets/0005-definition-Erdos993G1-extensionFinset.lean.fragment` (match)
- `source-entry-06-e`: `LeanProject/LeanProof/Snippets/0006-definition-Erdos993G1-e.lean.fragment` (match)
- `source-entry-07-indepdegreesum`: `LeanProject/LeanProof/Snippets/0007-definition-Erdos993G1-indepDegreeSum.lean.fragment` (match)
- `source-entry-08-firstdescent`: `LeanProject/LeanProof/Snippets/0008-definition-Erdos993G1-firstDescent.lean.fragment` (match)
- `source-entry-09-indepcount-eq-card-indepsetfinset`: `LeanProject/LeanProof/Snippets/0009-lemma-Erdos993G1-indepCount_eq_card_indepSetFinset.lean.fragment` (match)
- `source-entry-10-mem-extensionfinset-iff`: `LeanProject/LeanProof/Snippets/0010-lemma-Erdos993G1-mem_extensionFinset_iff.lean.fragment` (match)
- `source-entry-11-isnindepset-insert-of-mem-extensionfinset`: `LeanProject/LeanProof/Snippets/0011-lemma-Erdos993G1-isNIndepSet_insert_of_mem_extensionFinset.lean.fragment` (match)
- `source-entry-12-isnindepset-erase-and-mem-extensionfinset`: `LeanProject/LeanProof/Snippets/0012-lemma-Erdos993G1-isNIndepSet_erase_and_mem_extensionFinset.lean.fragment` (match)
- `source-entry-13-sigma-card-double-count`: `LeanProject/LeanProof/Snippets/0013-lemma-Erdos993G1-sigma_card_double_count.lean.fragment` (match)
- `source-entry-14-sum-card-indepsetfinset-succ`: `LeanProject/LeanProof/Snippets/0014-lemma-Erdos993G1-sum_card_indepSetFinset_succ.lean.fragment` (match)
- `source-entry-15-sum-e-eq-succ-mul-card`: `LeanProject/LeanProof/Snippets/0015-lemma-Erdos993G1-sum_e_eq_succ_mul_card.lean.fragment` (match)
- `source-entry-16-double-count`: `LeanProject/LeanProof/Snippets/0016-lemma-Erdos993G1-double_count.lean.fragment` (match)
- `source-entry-17-card-closednbhdfinset-le`: `LeanProject/LeanProof/Snippets/0017-lemma-Erdos993G1-card_closedNbhdFinset_le.lean.fragment` (match)
- `source-entry-18-e-add-card-add-degreesum-ge`: `LeanProject/LeanProof/Snippets/0018-lemma-Erdos993G1-e_add_card_add_degreeSum_ge.lean.fragment` (match)
- `source-entry-19-e-ge-sub`: `LeanProject/LeanProof/Snippets/0019-theorem-Erdos993G1-e_ge_sub.lean.fragment` (match)
- `source-formalizer-brief`: `SOURCES/C1-STAGE7-FORMALIZER-BRIEF-LA2.md` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-r25-award-lean`: `SOURCES/r25-c4-forest-descent-order-bound-Main.lean` (match)
- `source-semantic-contract`: `SOURCES/SEMANTIC-CONTRACT.md` (match)
- `source-solution-contract`: `SOURCES/SOLUTION-CONTRACT.md` (match)
- `source-stage7-protocol`: `SOURCES/C1-STAGE7-PROTOCOL.md` (match)
- `source-synthesis`: `SOURCES/SYNTHESIS.md` (match)
- `source-u3-extension-carry`: `SOURCES/U3-Extension.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
