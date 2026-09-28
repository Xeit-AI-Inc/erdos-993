# C4 Jensen formalizer report

## Result

Completed a development compilation of the full exact theorem `e993_finite_block_coefficient_jensen`, including the actual labeled-subset coefficient equality, guarded Jensen exponent bound, and every nonnegative Taylor floor. The first six definitions are byte-identical to their declarations in `SOURCE/ENCODING-SPEC.lean`; the theorem header SHA-256 is `c044c8911cc997346d0295442122d98ae5a222aa0a50a6800214f62d51a3f396`, matching the contract.

All 16 remote mathematical input files matched the local manifest, including `THEOREM-CONTRACT.yaml` SHA-256 `8a2b91971f0ca4348b7155b6b5d99a5d6a2147e5cbd18f39ec60250169aa0ff9`. The registered informal audit receipt says `passed`.

## Proposal paths

ORDER: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/ORDER.json`

Fragments, in registration order:

1. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0001-def-e993BlockProduct.lean` (definition: `e993BlockProduct`)
2. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0002-def-e993BlockMass.lean` (definition: `e993BlockMass`)
3. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0003-def-e993BlockCount.lean` (definition: `e993BlockCount`)
4. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0004-def-e993SubsetAverage.lean` (definition: `e993SubsetAverage`)
5. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0005-def-e993BlockExponent.lean` (definition: `e993BlockExponent`)
6. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0006-def-e993ExpTaylor.lean` (definition: `e993ExpTaylor`)
7. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0007-def-e993Fiber.lean` (definition: `e993Fiber`)
8. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0008-def-e993FiberEquiv.lean` (definition: `e993FiberEquiv`)
9. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0009-def-e993CountVec.lean` (definition: `e993CountVec`)
10. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0010-def-e993CountFiberEquiv.lean` (definition: `e993CountFiberEquiv`)
11. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0011-def-e993BlockSet.lean` (definition: `e993BlockSet`)
12. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0012-lemma-e993_card_ambient.lean` (lemma: `e993_card_ambient`)
13. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0013-lemma-e993_card_subsets.lean` (lemma: `e993_card_subsets`)
14. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0014-lemma-e993_mass_pos.lean` (lemma: `e993_mass_pos`)
15. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0015-lemma-e993_taylor_le.lean` (lemma: `e993_taylor_le`)
16. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0016-lemma-e993_scalar_log.lean` (lemma: `e993_scalar_log`)
17. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0017-lemma-e993_exponent_nonneg.lean` (lemma: `e993_exponent_nonneg`)
18. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0018-lemma-e993_rebuild_fibers.lean` (lemma: `e993_rebuild_fibers`)
19. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0019-lemma-e993_fiber_rebuild.lean` (lemma: `e993_fiber_rebuild`)
20. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0020-lemma-e993_count_eq_fiber_card.lean` (lemma: `e993_count_eq_fiber_card`)
21. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0021-lemma-e993_sum_counts.lean` (lemma: `e993_sum_counts`)
22. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0022-lemma-e993_count_le.lean` (lemma: `e993_count_le`)
23. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0023-lemma-e993_prod_monomial.lean` (lemma: `e993_prod_monomial`)
24. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0024-lemma-e993_coeff_expansion.lean` (lemma: `e993_coeff_expansion`)
25. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0025-lemma-e993_countvec_sum.lean` (lemma: `e993_countvec_sum`)
26. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0026-lemma-e993_finite_jensen.lean` (lemma: `e993_finite_jensen`)
27. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0027-lemma-e993_weight_ge_one.lean` (lemma: `e993_weight_ge_one`)
28. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0028-lemma-e993_exp_log_product.lean` (lemma: `e993_exp_log_product`)
29. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0029-lemma-e993_pointwise_log.lean` (lemma: `e993_pointwise_log`)
30. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0030-lemma-e993_card_block_fiber.lean` (lemma: `e993_card_block_fiber`)
31. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0031-lemma-e993_card_joint_fiber.lean` (lemma: `e993_card_joint_fiber`)
32. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0032-lemma-e993_card_rank_fiber.lean` (lemma: `e993_card_rank_fiber`)
33. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0033-lemma-e993_countvec_eq_iff.lean` (lemma: `e993_countvec_eq_iff`)
34. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0034-lemma-e993_prod_choose_mul_weight.lean` (lemma: `e993_prod_choose_mul_weight`)
35. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0035-lemma-e993_actual_sum_eq_count_sum.lean` (lemma: `e993_actual_sum_eq_count_sum`)
36. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0036-lemma-e993_coeff_actual.lean` (lemma: `e993_coeff_actual`)
37. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0037-lemma-e993_coefficient_average.lean` (lemma: `e993_coefficient_average`)
38. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0038-lemma-e993_card_inter_fiber.lean` (lemma: `e993_card_inter_fiber`)
39. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0039-lemma-e993_blockset_card.lean` (lemma: `e993_blockset_card`)
40. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0040-lemma-e993_fiber_image.lean` (lemma: `e993_fiber_image`)
41. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0041-lemma-e993_count_inter.lean` (lemma: `e993_count_inter`)
42. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0042-lemma-e993_marginal_count.lean` (lemma: `e993_marginal_count`)
43. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0043-lemma-e993_marginal_sum.lean` (lemma: `e993_marginal_sum`)
44. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0044-lemma-e993_exponent_eq_average.lean` (lemma: `e993_exponent_eq_average`)
45. `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/PROPOSALS/0045-theorem-e993_finite_block_coefficient_jensen.lean` (theorem: `e993_finite_block_coefficient_jensen`)

## Development verification

Complete candidate assembled from the remote proposals: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/EVIDENCE/development/CandidateAssembledAxioms.lean`.
Compiler and axiom log: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/EVIDENCE/development/check-043-assembled-axioms.log`.

Reproduction from the remote project:

```sh
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c4-jensen/LeanProject
PATH=/Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin:/usr/bin:/bin /Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake env lean ../EVIDENCE/development/CandidateAssembledAxioms.lean
```

That check exited 0. `#print axioms` reported exactly `[propext, Classical.choice, Quot.sound]`. The assembled source contains no `sorry`, `admit`, `native_decide`, or custom axiom. One harmless Lean warning reports that the exact contracted `hr` binder is unused; the binder remains in the byte-exact theorem header. Earlier diagnostic logs remain under `EVIDENCE/development/check-*.log`.

## Limitations

These are proposal and development-check artifacts. The controller has not registered the snippets or run governed kernel verification and fresh fidelity review. No formal award is claimed in this report.
