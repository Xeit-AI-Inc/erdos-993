# Theorem Contract: (XR) descent restriction for finite forests, with (LB) and (R5) as award faces

- Contract ID: `e993-r27-c1-la4-descent-order-bounds-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `a5d964540c9cc3aa05deb276256eacd28ab893612ce99abe9e50ea12ad2fbee8`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Let G be a finite forest and x(G) the least k with Delta_k(G) < 0. (LB) For every natural k, Delta_k(G) < 0 implies n <= 4k. (R5) If n >= 21 then Delta_5(G) >= 0. (XR) For every natural r, x(G) < r implies n <= 4r - 4. Here n = Nat.card X and Delta_k is the G1 definition of record. The terminal declaration of this award is (XR); (LB) and (R5) are the other two award faces, registered as lemmas in the same project. All three are unconditional: the degree lemma (DL) is supplied by the carried, kernel-verified Erdos993G1.forest_degree_lemma of award C1-LA1, so no DlHyp hypothesis appears on any face.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.forest_descent_restriction`
- Statement SHA-256: `443de70788bc0250ae0bc52d1d4d9614b58858744c1e0a754a6363685f7e9d92`

```lean
theorem forest_descent_restriction {X : Type u} [Finite X] (G : SimpleGraph X) (hG : G.IsAcyclic)
    (r : ℕ) (hx : firstDescent G < r) : Nat.card X ≤ 4 * r - 4
```

## Quantifiers

- `forall X` over `domain-vertex-type`
- `forall G` over `domain-graph`
- `forall r` over `domain-rank-r`

## Hypotheses

- `hyp-finiteness`: [Finite X] : the vertex carrier is finite. Verbatim binder on the face: `{X : Type u} [Finite X]`. Used EVERYWHERE; it is what makes Nat.card X, the finsets and the cardinalities meaningful. The crossing to [Fintype X] is made classically inside the proofs by Fintype.ofFinite and is used only through Nat.card_eq_fintype_card.
- `hyp-acyclicity`: hG : G.IsAcyclic : the graph is a finite forest (possibly disconnected, possibly empty). Verbatim binder on the face: `(hG : G.IsAcyclic)`. Consumed EXACTLY ONCE mathematically, through (DL), inside C1-LA1's rooting API at Erdos993G1.rootPath_unique; everything downstream of (DL) is unconditional on acyclicity and merely transports hG to that one use.
- `hyp-first-descent-before-r`: hx : firstDescent G < r : the first strict descent of the independence sequence occurs strictly before r. Verbatim binder on the face: `(hx : firstDescent G < r)`. It is this hypothesis, and not arithmetic, that makes the truncated subtraction 4 * r - 4 sound: it forces 1 <= r, so 4 * r - 4 = 4 * (r - 1); at r = 0 it is unsatisfiable, so that instance is vacuous-hypothesis-sound.

## Conclusion

- `conclusion`: For every type X that is finite, every simple graph G on X that is acyclic, and every natural r: if firstDescent G < r then Nat.card X <= 4 * r - 4, where the subtraction is natural-number truncated subtraction. This is (XR), the descent restriction, the terminal declaration Erdos993G1.forest_descent_restriction of award C1-LA4, stated UNCONDITIONALLY (there is no DlHyp binder). It is an ORDER BOUND whose contrapositive has sign Delta_k >= 0: it is NOT a no-recovery statement, it transfers status to none of E993-R25-UNR-FOREST-WIDE, E993-G1WIDE-NO-SIZE-CAP, NR1, FOREST, TREE, TRANSFER, the aggregates or Erdos #993, it asserts nothing asymptotic, it asserts no sharpness, it says nothing about non-forests, and it is NOT a uniform bound on d (read at n = 2r + d it says d <= 2r - 4, a bound growing with r). The r25 award E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP is unchanged and stays registered at its own statement.

## Dependencies

- `domain-vertex-type` -> `domain-graph`
- `domain-vertex-type` -> `def-indepcount`
- `domain-graph` -> `def-indepcount`
- `domain-rank-k` -> `def-indepcount`
- `def-indepcount` -> `def-coeff`
- `def-coeff` -> `def-delta`
- `domain-graph` -> `def-closednbhdfinset`
- `def-closednbhdfinset` -> `def-extensionfinset`
- `def-extensionfinset` -> `def-extensioncount`
- `domain-graph` -> `def-indepdegreesum`
- `domain-rank-k` -> `def-indepdegreesum`
- `domain-graph` -> `def-rootrep`
- `def-rootrep` -> `def-rootpath`
- `def-rootpath` -> `def-par`
- `def-rootpath` -> `def-rk`
- `def-par` -> `def-childrenfinset`
- `def-par` -> `def-uppairs`
- `domain-rank-k` -> `def-uppairs`
- `def-par` -> `def-downpairs`
- `domain-rank-k` -> `def-downpairs`
- `def-par` -> `def-rootpairs`
- `domain-rank-k` -> `def-rootpairs`
- `def-par` -> `def-swapmap`
- `def-indepdegreesum` -> `def-dlhyp`
- `def-indepcount` -> `def-dlhyp`
- `def-indepcount` -> `def-exhyp`
- `def-delta` -> `def-lbhyp`
- `def-delta` -> `def-r5hyp`
- `def-delta` -> `def-firstdescent`
- `def-firstdescent` -> `def-xrhyp`
- `domain-vertex-type` -> `hyp-finiteness`
- `domain-graph` -> `hyp-acyclicity`
- `domain-graph` -> `hyp-first-descent-before-r`
- `domain-rank-r` -> `hyp-first-descent-before-r`
- `def-firstdescent` -> `hyp-first-descent-before-r`
- `hyp-finiteness` -> `conclusion`
- `hyp-acyclicity` -> `conclusion`
- `hyp-first-descent-before-r` -> `conclusion`
- `def-firstdescent` -> `conclusion`
- `def-xrhyp` -> `conclusion`
- `def-lbhyp` -> `conclusion`
- `def-exhyp` -> `conclusion`
- `def-delta` -> `conclusion`
- `def-indepcount` -> `conclusion`
- `def-indepdegreesum` -> `conclusion`
- `def-extensioncount` -> `conclusion`
- `def-uppairs` -> `conclusion`
- `def-downpairs` -> `conclusion`
- `def-rootpairs` -> `conclusion`
- `def-swapmap` -> `conclusion`
- `def-childrenfinset` -> `conclusion`
- `def-rk` -> `conclusion`
- `domain-rank-r` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-c1-la1-lean`: `EVIDENCE/carried-sources/C1-LA1-Main.lean` (match)
- `source-c1-la3-lean-pinned`: `EVIDENCE/carried-sources/C1-LA3-Main.lean.pinned-cae93961` (match)
- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-fragment-0001`: `LeanProject/LeanProof/Snippets/0001-definition-Erdos993G1-indepCount.lean.fragment` (match)
- `source-fragment-0002`: `LeanProject/LeanProof/Snippets/0002-definition-Erdos993G1-coeff.lean.fragment` (match)
- `source-fragment-0003`: `LeanProject/LeanProof/Snippets/0003-definition-Erdos993G1-delta.lean.fragment` (match)
- `source-fragment-0004`: `LeanProject/LeanProof/Snippets/0004-definition-Erdos993G1-closedNbhdFinset.lean.fragment` (match)
- `source-fragment-0005`: `LeanProject/LeanProof/Snippets/0005-definition-Erdos993G1-extensionFinset.lean.fragment` (match)
- `source-fragment-0006`: `LeanProject/LeanProof/Snippets/0006-definition-Erdos993G1-e.lean.fragment` (match)
- `source-fragment-0007`: `LeanProject/LeanProof/Snippets/0007-definition-Erdos993G1-indepDegreeSum.lean.fragment` (match)
- `source-fragment-0008`: `LeanProject/LeanProof/Snippets/0008-definition-Erdos993G1-rootRep.lean.fragment` (match)
- `source-fragment-0009`: `LeanProject/LeanProof/Snippets/0009-definition-Erdos993G1-rootPath.lean.fragment` (match)
- `source-fragment-0010`: `LeanProject/LeanProof/Snippets/0010-definition-Erdos993G1-par.lean.fragment` (match)
- `source-fragment-0011`: `LeanProject/LeanProof/Snippets/0011-definition-Erdos993G1-rk.lean.fragment` (match)
- `source-fragment-0012`: `LeanProject/LeanProof/Snippets/0012-definition-Erdos993G1-childrenFinset.lean.fragment` (match)
- `source-fragment-0013`: `LeanProject/LeanProof/Snippets/0013-definition-Erdos993G1-upPairs.lean.fragment` (match)
- `source-fragment-0014`: `LeanProject/LeanProof/Snippets/0014-definition-Erdos993G1-downPairs.lean.fragment` (match)
- `source-fragment-0015`: `LeanProject/LeanProof/Snippets/0015-definition-Erdos993G1-rootPairs.lean.fragment` (match)
- `source-fragment-0016`: `LeanProject/LeanProof/Snippets/0016-definition-Erdos993G1-swapMap.lean.fragment` (match)
- `source-fragment-0017`: `LeanProject/LeanProof/Snippets/0017-definition-Erdos993G1-DlHyp.lean.fragment` (match)
- `source-fragment-0018`: `LeanProject/LeanProof/Snippets/0018-definition-Erdos993G1-ExHyp.lean.fragment` (match)
- `source-fragment-0019`: `LeanProject/LeanProof/Snippets/0019-definition-Erdos993G1-LbHyp.lean.fragment` (match)
- `source-fragment-0020`: `LeanProject/LeanProof/Snippets/0020-definition-Erdos993G1-R5Hyp.lean.fragment` (match)
- `source-fragment-0021`: `LeanProject/LeanProof/Snippets/0021-definition-Erdos993G1-XrHyp.lean.fragment` (match)
- `source-fragment-0022`: `LeanProject/LeanProof/Snippets/0022-lemma-Erdos993G1-indepCount_eq_card_indepSetFinset.lean.fragment` (match)
- `source-fragment-0023`: `LeanProject/LeanProof/Snippets/0023-lemma-Erdos993G1-mem_extensionFinset_iff.lean.fragment` (match)
- `source-fragment-0024`: `LeanProject/LeanProof/Snippets/0024-lemma-Erdos993G1-isNIndepSet_insert_of_mem_extensionFinset.lean.fragment` (match)
- `source-fragment-0025`: `LeanProject/LeanProof/Snippets/0025-lemma-Erdos993G1-isNIndepSet_erase_and_mem_extensionFinset.lean.fragment` (match)
- `source-fragment-0026`: `LeanProject/LeanProof/Snippets/0026-lemma-Erdos993G1-sigma_card_double_count.lean.fragment` (match)
- `source-fragment-0027`: `LeanProject/LeanProof/Snippets/0027-lemma-Erdos993G1-sum_card_indepSetFinset_succ.lean.fragment` (match)
- `source-fragment-0028`: `LeanProject/LeanProof/Snippets/0028-lemma-Erdos993G1-sum_e_eq_succ_mul_card.lean.fragment` (match)
- `source-fragment-0029`: `LeanProject/LeanProof/Snippets/0029-lemma-Erdos993G1-double_count.lean.fragment` (match)
- `source-fragment-0030`: `LeanProject/LeanProof/Snippets/0030-lemma-Erdos993G1-card_closedNbhdFinset_le.lean.fragment` (match)
- `source-fragment-0031`: `LeanProject/LeanProof/Snippets/0031-lemma-Erdos993G1-e_add_card_add_degreeSum_ge.lean.fragment` (match)
- `source-fragment-0032`: `LeanProject/LeanProof/Snippets/0032-lemma-Erdos993G1-e_ge_sub.lean.fragment` (match)
- `source-fragment-0033`: `LeanProject/LeanProof/Snippets/0033-lemma-Erdos993G1-rootPath_isPath.lean.fragment` (match)
- `source-fragment-0034`: `LeanProject/LeanProof/Snippets/0034-lemma-Erdos993G1-rootRep_eq_of_adj.lean.fragment` (match)
- `source-fragment-0035`: `LeanProject/LeanProof/Snippets/0035-lemma-Erdos993G1-par_eq_self_of_nil.lean.fragment` (match)
- `source-fragment-0036`: `LeanProject/LeanProof/Snippets/0036-lemma-Erdos993G1-not_nil_rootPath_of_par_ne.lean.fragment` (match)
- `source-fragment-0037`: `LeanProject/LeanProof/Snippets/0037-lemma-Erdos993G1-adj_par.lean.fragment` (match)
- `source-fragment-0038`: `LeanProject/LeanProof/Snippets/0038-lemma-Erdos993G1-rootPath_unique.lean.fragment` (match)
- `source-fragment-0039`: `LeanProject/LeanProof/Snippets/0039-lemma-Erdos993G1-par_or.lean.fragment` (match)
- `source-fragment-0040`: `LeanProject/LeanProof/Snippets/0040-lemma-Erdos993G1-rk_par_lt.lean.fragment` (match)
- `source-fragment-0041`: `LeanProject/LeanProof/Snippets/0041-lemma-Erdos993G1-par_par_ne.lean.fragment` (match)
- `source-fragment-0042`: `LeanProject/LeanProof/Snippets/0042-lemma-Erdos993G1-not_adj_of_indep.lean.fragment` (match)
- `source-fragment-0043`: `LeanProject/LeanProof/Snippets/0043-lemma-Erdos993G1-notMem_of_par_mem.lean.fragment` (match)
- `source-fragment-0044`: `LeanProject/LeanProof/Snippets/0044-lemma-Erdos993G1-mem_childrenFinset.lean.fragment` (match)
- `source-fragment-0045`: `LeanProject/LeanProof/Snippets/0045-lemma-Erdos993G1-neighborFinset_eq_of_root.lean.fragment` (match)
- `source-fragment-0046`: `LeanProject/LeanProof/Snippets/0046-lemma-Erdos993G1-par_notMem_childrenFinset.lean.fragment` (match)
- `source-fragment-0047`: `LeanProject/LeanProof/Snippets/0047-lemma-Erdos993G1-neighborFinset_eq_of_nonroot.lean.fragment` (match)
- `source-fragment-0048`: `LeanProject/LeanProof/Snippets/0048-lemma-Erdos993G1-degree_eq_card_childrenFinset_add.lean.fragment` (match)
- `source-fragment-0049`: `LeanProject/LeanProof/Snippets/0049-lemma-Erdos993G1-sum_card_childrenFinset.lean.fragment` (match)
- `source-fragment-0050`: `LeanProject/LeanProof/Snippets/0050-lemma-Erdos993G1-card_downPairs_add_card_upPairs.lean.fragment` (match)
- `source-fragment-0051`: `LeanProject/LeanProof/Snippets/0051-lemma-Erdos993G1-card_upPairs_add_card_rootPairs.lean.fragment` (match)
- `source-fragment-0052`: `LeanProject/LeanProof/Snippets/0052-lemma-Erdos993G1-swapMap_mem_upPairs.lean.fragment` (match)
- `source-fragment-0053`: `LeanProject/LeanProof/Snippets/0053-lemma-Erdos993G1-swapMap_grandparent_pos.lean.fragment` (match)
- `source-fragment-0054`: `LeanProject/LeanProof/Snippets/0054-lemma-Erdos993G1-swapMap_grandparent_neg.lean.fragment` (match)
- `source-fragment-0055`: `LeanProject/LeanProof/Snippets/0055-lemma-Erdos993G1-swapMap_injOn.lean.fragment` (match)
- `source-fragment-0056`: `LeanProject/LeanProof/Snippets/0056-lemma-Erdos993G1-card_downPairs_le_card_upPairs.lean.fragment` (match)
- `source-fragment-0057`: `LeanProject/LeanProof/Snippets/0057-lemma-Erdos993G1-forest_root_corrected_degree_bound.lean.fragment` (match)
- `source-fragment-0058`: `LeanProject/LeanProof/Snippets/0058-lemma-Erdos993G1-forest_degree_lemma_nat.lean.fragment` (match)
- `source-fragment-0059`: `LeanProject/LeanProof/Snippets/0059-lemma-Erdos993G1-forest_degree_lemma.lean.fragment` (match)
- `source-fragment-0060`: `LeanProject/LeanProof/Snippets/0060-lemma-Erdos993G1-forest_extension_inequality.lean.fragment` (match)
- `source-fragment-0061`: `LeanProject/LeanProof/Snippets/0061-lemma-Erdos993G1-coeff_nat.lean.fragment` (match)
- `source-fragment-0062`: `LeanProject/LeanProof/Snippets/0062-lemma-Erdos993G1-delta_nat.lean.fragment` (match)
- `source-fragment-0063`: `LeanProject/LeanProof/Snippets/0063-lemma-Erdos993G1-pos_indepCount_of_delta_neg.lean.fragment` (match)
- `source-fragment-0064`: `LeanProject/LeanProof/Snippets/0064-lemma-Erdos993G1-dl_holds.lean.fragment` (match)
- `source-fragment-0065`: `LeanProject/LeanProof/Snippets/0065-lemma-Erdos993G1-lb_of_ex.lean.fragment` (match)
- `source-fragment-0066`: `LeanProject/LeanProof/Snippets/0066-lemma-Erdos993G1-r5_of_lb.lean.fragment` (match)
- `source-fragment-0067`: `LeanProject/LeanProof/Snippets/0067-lemma-Erdos993G1-xr_of_lb.lean.fragment` (match)
- `source-fragment-0068`: `LeanProject/LeanProof/Snippets/0068-lemma-Erdos993G1-lb_holds.lean.fragment` (match)
- `source-fragment-0069`: `LeanProject/LeanProof/Snippets/0069-lemma-Erdos993G1-forest_descent_linear_bound.lean.fragment` (match)
- `source-fragment-0070`: `LeanProject/LeanProof/Snippets/0070-lemma-Erdos993G1-forest_rank5_ceiling_20.lean.fragment` (match)
- `source-fragment-0071`: `LeanProject/LeanProof/Snippets/0071-theorem-Erdos993G1-forest_descent_restriction.lean.fragment` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-r25-award-lean`: `EVIDENCE/carried-sources/r25-c4-forest-descent-order-bound-Main.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
