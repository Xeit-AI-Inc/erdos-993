# C6 tail formalization proposal

**Status:** Complete development candidate compiled. This is a proposal, not a governed formal award.

## Scope and exactness

- The exact terminal `e993_guarded_tip_surplus_tail` compiles with all six exact `SOURCE/ENCODING-SPEC.lean` definitions. Its statement bytes match `THEOREM-CONTRACT.yaml` and SHA-256 `4dd33af0ac00b5ff9b9421bf9910116355b29019fa3652755c220c0e6da2cd82`.
- All 18 mathematical input files in local `manifests/C6-TAIL-FORMALIZER-INPUTS.json` matched their remote SHA-256 values. The contract hash is `01cdacd246c3f41d099eba4e7b88ecd72c8442ca20f1cf7ff4940a0f0771699d`.
- The candidate proves the low band by real center subset expansion, explicit support crossing and binomial log concavity. It proves the high band by direct finite block Jensen specialization, exact singleton excess, both parity endpoints, real derivative coefficient ratio, exponential growth, and strict real denominator clearing.
- No C2 or C3 declaration was copied. Their relevant short operator and center results were reproved over `Polynomial ℝ`.

## Reused source provenance

- 42 needed declarations were copied from `SOURCE/JENSEN-VERIFIED-SOURCE.lean`, original SHA-256 `a0f07019b366cb194ddd031df0f9f963f2a051f548354349e016aceab6d23e3`.
- Their declaration statements and proof bodies match the source byte for byte, except the keyword of `e993_finite_block_coefficient_jensen` changed from `theorem` to `lemma`. This keyword change changes neither its mathematical statement nor its proof and reserves the sole terminal theorem slot for `e993_guarded_tip_surplus_tail`.
- Three unused copied Jensen declarations were omitted: `e993FiberEquiv`, `e993_fiber_rebuild`, and `e993_countvec_sum`.

## Development check

- Remote proposal order: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/ORDER.json`.
- Remote complete candidate: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/EVIDENCE/development/Candidate-proposed.lean` (SHA-256 `67da0170b3f939f387667a47b8b9aaec8bc214a9408ff690edcb76c048d6f182`).
- The candidate has 138 declarations: 22 definitions, 115 lemmas, and one terminal theorem, in registrar order. Every proposal fragment is listed with its exact path below. No fragment imports Mathlib. `noncomputable` precedes each applicable `def` on its own line.
- The complete candidate compiled with exit code 0. Diagnostics, including warnings, are retained in `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/EVIDENCE/development/diagnostic-055.log`. Earlier failed diagnostic snapshots are retained as `diagnostic-001.log` through `diagnostic-054.log` where produced.
- The axiom check in `/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/EVIDENCE/development/axioms-001.log` printed `[propext, Classical.choice, Quot.sound]`. No `sorry`, `admit`, `native_decide`, or custom axiom occurs in the proposal fragments.

Reproduce on `mini-away` from the pinned project:

```bash
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/LeanProject
PATH=/Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin:/usr/bin:/bin lake env lean ../EVIDENCE/development/Candidate-proposed.lean
```

## Limitations and handoff

Development `lake env lean` is not governed registration or kernel verification. The controller must register the exact proposal fragments in `ORDER.json`, perform its governed kernel and axiom checks, and request the assigned fresh fidelity review. No controller assignment, registration, kernel, fidelity, or close command was invoked here. No formal award is claimed.

## Exact remote fragment paths

```text
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/001-e993TailB.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/002-e993TailN.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/003-e993TailH.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/004-e993TailC.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/005-e993TailU.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/006-e993TailE.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/007-e993TailNN.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/008-e993TailD.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/009-e993TailLE.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/010-e993BlockProduct.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/011-e993BlockMass.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/012-e993BlockCount.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/013-e993SubsetAverage.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/014-e993BlockExponent.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/015-e993ExpTaylor.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/016-e993Fiber.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/017-e993CountVec.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/018-e993CountFiberEquiv.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/019-e993BlockSet.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/020-e993TailBlockSize.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/021-e993TailG.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/022-e993TailQ.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/023-e993_tail_arity_lower.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/024-e993_tail_arity_upper.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/025-e993_tail_order_lower.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/026-e993_tail_E_coeff.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/027-e993_tail_E_coeff_succ.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/028-e993_tail_NN_add.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/029-e993_tail_NN_mul.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/030-e993_tail_NN_one.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/031-e993_tail_NN_X.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/032-e993_tail_NN_nat.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/033-e993_tail_NN_pow.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/034-e993_tail_D_mul.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/035-e993_tail_D_one.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/036-e993_tail_NN_zero.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/037-e993_tail_NN_L.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/038-e993_tail_NN_B.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/039-e993_tail_C2.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/040-e993_tail_C3.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/041-e993_tail_C4.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/042-e993_tail_D_B1.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/043-e993_tail_D_B2.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/044-e993_tail_D_B3.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/045-e993_tail_D_B4.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/046-e993_tail_NN_DB.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/047-e993_tail_NN_prod.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/048-e993_tail_NN_Dprod.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/049-e993_tail_NN_DC.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/050-e993_tail_coeff_X_derivative.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/051-e993_tail_D_coeff.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/052-e993_tail_C_ratio_succ.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/053-e993_tail_C_ratio.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/054-e993_tail_LE_mul.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/055-e993_tail_LE_B.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/056-e993_tail_LE_prod.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/057-e993_tail_LE_C.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/058-e993_tail_LE_U.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/059-e993_tail_C_coeff_floor.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/060-e993_tail_U_coeff_floor.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/061-e993_card_ambient.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/062-e993_card_subsets.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/063-e993_mass_pos.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/064-e993_taylor_le.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/065-e993_scalar_log.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/066-e993_exponent_nonneg.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/067-e993_rebuild_fibers.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/068-e993_count_eq_fiber_card.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/069-e993_sum_counts.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/070-e993_count_le.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/071-e993_prod_monomial.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/072-e993_coeff_expansion.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/073-e993_finite_jensen.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/074-e993_weight_ge_one.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/075-e993_exp_log_product.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/076-e993_pointwise_log.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/077-e993_card_block_fiber.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/078-e993_card_joint_fiber.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/079-e993_card_rank_fiber.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/080-e993_countvec_eq_iff.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/081-e993_prod_choose_mul_weight.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/082-e993_actual_sum_eq_count_sum.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/083-e993_coeff_actual.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/084-e993_coefficient_average.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/085-e993_card_inter_fiber.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/086-e993_blockset_card.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/087-e993_fiber_image.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/088-e993_count_inter.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/089-e993_marginal_count.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/090-e993_marginal_sum.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/091-e993_exponent_eq_average.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/092-e993_finite_block_coefficient_jensen.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/093-e993_tail_B_degree.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/094-e993_tail_B_sum_monomial.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/095-e993_tail_block_pos.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/096-e993_tail_block_sum.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/097-e993_tail_block_product.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/098-e993_tail_block_floor.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/099-e993_tail_jensen_raw.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/100-e993_tail_exp_base.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/101-e993_tail_exp_growth.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/102-e993_tail_guard_le_N.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/103-e993_tail_choose_adjacent.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/104-e993_tail_C_coeff_pos.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/105-e993_tail_U_coeff_pos.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/106-e993_tail_minor_half.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/107-e993_tail_numeric_payment.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/108-e993_tail_payment_from_U.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/109-e993_tail_B_coeff.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/110-e993_tail_singleton_exponent.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/111-e993_tail_exponent_sum.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/112-e993_tail_choose_k_step.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/113-e993_tail_choose_n_step.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/114-e993_tail_choose_four.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/115-e993_tail_G4_formula.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/116-e993_tail_G4_step.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/117-e993_tail_G4_ge_of_poly.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/118-e993_tail_G4_even_endpoint.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/119-e993_tail_G4_odd_endpoint.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/120-e993_tail_G4_band.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/121-e993_tail_G3_ge_G4.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/122-e993_tail_G2_ge_G3.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/123-e993_tail_G_all.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/124-e993_tail_G_nonneg.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/125-e993_tail_exponent_lower.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/126-e993_tail_U_high_lower.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/127-e993_tail_center_expansion.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/128-e993_tail_center_coeff.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/129-e993_tail_Q_coeff.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/130-e993_tail_subset_cross.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/131-e993_tail_Q_normalized_rise.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/132-e993_tail_choose_logconcave.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/133-e993_tail_Q_predecessor_bracket.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/134-e993_tail_C_eq_Q.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/135-e993_tail_C_coeff_succ.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/136-e993_tail_C_coeff_zero.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/137-e993_tail_E_minor_low.lean
/Users/ashtonsperry/VerityOS/experiments/erdos-993-absolute-compensation-dre-2026-09-27/runs/lean-2026-09-28-c6-surplus-tail/PROPOSALS/138-e993_guarded_tip_surplus_tail.lean

```
