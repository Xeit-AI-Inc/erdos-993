# Theorem Contract: C2-LA1 (r31): (ELIG-top)(a) on the literal tree CB(8,m) and conjuncts 1-3 of the terminal, at p* = (16m+4)/3, for every m >= 107 with m % 3 = 2

- Contract ID: `erdos-993-r31-c2-la1-cb8-parent-descent-and-eligibility-on-the-tree-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `2158db77f8b21a86164fddb26f9e6f2f135e4bcdc02d5297f3dce29bcc1e587d`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Canonical run id erdos-993-math-dre-20260927-r31-cb-uniform-switch; award C2-LA1 (r31 Cycle 2; (ELIG-top)(a) on the literal tree and conjuncts 1-3 of the terminal; the U adjudicator's group U-A plus the synthesis's added descent conjunct); governed run lean-2026-09-28-c2-la1-cb8-parent-descent-and-eligibility-on-the-tree; key on closure: none new — the synthesis ## Registrations names the scope update this award enables (the ELIG key to formally_verified at its exact scope; the controller applies it after the award closes and the matching isolated second read SR-C2-4 passes). OBJECT: for every natural m with 107 <= m and m % 3 = 2, at the one rank p* = (16m+4)/3: (1) cbGraph m is a tree; (2) the literal parent descent C5LA1.indepSetCount (cbGraph m) ∅ (p*−1) < C5LA1.indepSetCount (cbGraph m) ∅ (p*−2); (3) conjunct 2, C5LA1.crossingIndex (cbGraph m) + 2 <= p*; (4) conjunct 3, the low window 3p* < 2·indepNum + 1. FACE COMPANIONS (ungraded; no grade is asserted for any companion): CriticU1T.cb8_elig_top_a ((cb8I m).coeff (p*−1) < (cb8I m).coeff (p*−2)); the ℕ closed form critU3T_cb_indepPoly_closedForm (I(cbGraph m) = (1+2X)·G^m + X·((1+X)(1+2X)^(8m)) over ℕ) with critU3T_cb_indepSetCount_eq_coeff (count = coefficient); AdjU.cb8_topRank_of_flow (the SOLUTION-CONTRACT §2 terminal from conjunct 4 alone, via carried C1-LA2 entry 78). FENCES: one rank p*; the class only; (H) not claimed; conjunct 4 not claimed; no FLOW => SIGN; no aggregate or (HALL) status; not a new E993-R31- identity (it formalizes the registered ELIG key and the r30 closed-form node). EXCLUDED CONCLUSIONS: (H); conjunct 4; favorability; (HALL) at any scope; S(T_m, p*) <= 0; any rank other than p*; m < 107; m ≢ 2 (mod 3); d ≠ 8. REPAIRS CARRIED: U1's "(E)" wording narrowed; U3's import edit (P4) replaced by a clean import (single source, import Mathlib only); the extra descent conjunct added. CARRIES: C1-LA3 entries 1-21 (Main.lean c0605e12…3011) and C1-LA2 entries 1-78 (Main.lean a906ec17…5f3f), merged into one Main.lean with re-keyed entry markers, bound to each origin's kernel receipt (CAPSULE-VERIFICATION.json); 97 byte-identical; the two origin TERMINALS (C1-LA3 21, C1-LA2 78) carried keyword-rekeyed (theorem -> lemma only; reverse substitution reproduces the origin digest) because the registrar and R7 admit exactly one theorem — recorded for controller ruling. All other declarations are DRAFT text re-authored under attribution (origin named on each). ATTRIBUTION: U1 (Sonnet 5, seat C2-U-01); C-U1-T (Opus 5.5, critic; node 2); U3 (C2-U-03; Node 0); C-U3-T (critic; closed-form link); the U adjudicator (composition, cast bridge); C-U1-F (independent symbolic derivation of N_5, not in the DAG); SR-4 (the certificate method of record); C1-LA2 and C1-LA3 (r31 C1 formalizers); r30 (closed forms, T1 of r30 Cycle 6; network definitions, named seats); Codex GPT-6's lower-region run (mechanism, weight, relation, (HALL)); Codex's heterogeneous-closure run as C1-LA3's face cites it (C1-LA3 face line: "Codex's heterogeneous-closure binomial-block mechanisms are cited as templates only, not as carried fragments (none was opened as a Lean source in this run)."); plus the formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.cb8_topRank_parentDescent_and_conjuncts_1_2_3`
- Statement SHA-256: `c8809d8e499c3c210c138f3119dcaaa70570c6cffa0ae694230fb8bae3de5b7c`

```lean
theorem cb8_topRank_parentDescent_and_conjuncts_1_2_3 (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    (cbGraph m).IsTree ∧
    C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 1) <
      C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 2) ∧
    C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
    3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1
```

## Quantifiers

- `forall m` over `domain-m`

## Hypotheses

- `hyp-m-ge-107`: hm : 107 ≤ m (verbatim). Used by the S_5 certificate (m = 3u+107), by the cast bridge / conjunct-2 link (p* ≥ 2), and through 0 < m for cb_lowWindow.
- `hyp-residue`: hmod : m % 3 = 2 (verbatim). Used: p* = (16m+4)/3 is exact and m = 3u+107 with u : ℕ.

## Conclusion

- `conclusion`: (cbGraph m).IsTree ∧ C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 1) < C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 2) ∧ C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧ 3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1 -- the synthesis's frozen C2-LA1 terminal body verbatim: tree; the literal parent descent i_(p*-1) < i_(p*-2) of the independent-set counts of cbGraph m; conjunct 2 (crossing index + 2 ≤ p*); conjunct 3 (low window). ALL FOUR ASSERTED, for every m in the class. Conjunct 4 (the flow) is NOT part of this statement.

## Dependencies

- `def-vdel-count` -> `def-vdel-fwd`
- `def-vdel-fwd` -> `def-is-favorable`
- `def-is-graph-leaf` -> `def-support`
- `def-is-graph-leaf` -> `def-leaf-set`
- `def-support` -> `def-h`
- `def-support` -> `def-r`
- `def-indep-avoiding` -> `def-indep-count`
- `def-indep-count` -> `def-fwd-del`
- `def-leaf-set` -> `def-aggregate`
- `def-is-favorable` -> `def-aggregate`
- `def-h` -> `def-aggregate`
- `def-r` -> `def-aggregate`
- `def-fwd-del` -> `def-aggregate`
- `def-support` -> `def-tag-witnesses`
- `def-tag-witnesses` -> `def-active-weight`
- `def-indep-family` -> `def-layer-weight`
- `def-active-weight` -> `def-layer-weight`
- `def-leaf-set` -> `def-favorable-leaves`
- `def-is-favorable` -> `def-favorable-leaves`
- `def-indep-family` -> `def-saturating-flow`
- `def-transport-rel` -> `def-saturating-flow`
- `def-active-weight` -> `def-saturating-flow`
- `def-indep-family` -> `def-weighted-hall`
- `def-transport-rel` -> `def-weighted-hall`
- `def-active-weight` -> `def-weighted-hall`
- `def-fwd-del` -> `def-crossing-index`
- `def-indep-avoiding` -> `def-crossing-index`
- `def-indep-count` -> `def-crossing-index`
- `def-cb-edge` -> `def-cb-graph`
- `def-cb-graph` -> `def-cb-decadj`
- `def-cb-edge` -> `def-cb-decadj`
- `def-cb-vertex` -> `def-cb-parent`
- `def-cb-parent-val` -> `def-cb-parent`
- `def-cb-parent` -> `def-cb-child-edge`
- `def-cb-vertex` -> `def-cb-lower-witness`
- `def-polynomial-int` -> `def-indeterminate-x`
- `def-polynomial-int` -> `def-coeff`
- `def-coeff` -> `def-poly-coeff-z`
- `def-polynomial-int` -> `def-cb8-g`
- `def-indeterminate-x` -> `def-cb8-g`
- `def-cb8-g` -> `def-cb8-i`
- `def-polynomial-int` -> `def-cb8-p`
- `def-indeterminate-x` -> `def-cb8-p`
- `def-cb8-p` -> `def-cb8-s5`
- `def-coeff` -> `def-cb8-s5`
- `def-indep-count` -> `def-indep-poly`
- `def-polynomial-nat` -> `def-indep-poly`
- `domain-m` -> `hyp-m-ge-107`
- `domain-m` -> `hyp-residue`
- `hyp-m-ge-107` -> `conclusion`
- `hyp-residue` -> `conclusion`
- `def-is-tree` -> `conclusion`
- `def-indep-num` -> `conclusion`
- `def-cb-graph` -> `conclusion`
- `def-cb-decadj` -> `conclusion`
- `def-indep-count` -> `conclusion`
- `def-crossing-index` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-brief`: `SOURCE/governing/C2-STAGE7-FORMALIZER-BRIEF-LA1.md` (match)
- `src-c1-la2-kernel-receipt`: `SOURCE/origin-records/c1-la2-kernel-verification.json` (match)
- `src-c1-la2-main`: `SOURCE/origin-records/c1-la2-Main.lean` (match)
- `src-c1-la2-state`: `SOURCE/origin-records/c1-la2-FORMALIZATION-STATE.json` (match)
- `src-c1-la3-kernel-receipt`: `SOURCE/origin-records/c1-la3-kernel-verification.json` (match)
- `src-c1-la3-main`: `SOURCE/origin-records/c1-la3-Main.lean` (match)
- `src-c1-la3-state`: `SOURCE/origin-records/c1-la3-FORMALIZATION-STATE.json` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carry-c1-la2-0001`: `SOURCE/carried-c1-la2/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `src-carry-c1-la2-0002`: `SOURCE/carried-c1-la2/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `src-carry-c1-la2-0003`: `SOURCE/carried-c1-la2/0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `src-carry-c1-la2-0004`: `SOURCE/carried-c1-la2/0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `src-carry-c1-la2-0005`: `SOURCE/carried-c1-la2/0005-definition-C5LA1-support.lean.fragment` (match)
- `src-carry-c1-la2-0006`: `SOURCE/carried-c1-la2/0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `src-carry-c1-la2-0007`: `SOURCE/carried-c1-la2/0007-definition-C5LA1-H.lean.fragment` (match)
- `src-carry-c1-la2-0008`: `SOURCE/carried-c1-la2/0008-definition-C5LA1-R.lean.fragment` (match)
- `src-carry-c1-la2-0009`: `SOURCE/carried-c1-la2/0009-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `src-carry-c1-la2-0010`: `SOURCE/carried-c1-la2/0010-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `src-carry-c1-la2-0011`: `SOURCE/carried-c1-la2/0011-definition-C5LA1-forwardDifferenceDel.lean.fragment` (match)
- `src-carry-c1-la2-0012`: `SOURCE/carried-c1-la2/0012-definition-C5LA1-aggregate.lean.fragment` (match)
- `src-carry-c1-la2-0013`: `SOURCE/carried-c1-la2/0013-definition-E993Interior-taggedFamily.lean.fragment` (match)
- `src-carry-c1-la2-0014`: `SOURCE/carried-c1-la2/0014-definition-E993Transport-indepFamily.lean.fragment` (match)
- `src-carry-c1-la2-0015`: `SOURCE/carried-c1-la2/0015-definition-E993Transport-tagWitnesses.lean.fragment` (match)
- `src-carry-c1-la2-0016`: `SOURCE/carried-c1-la2/0016-definition-E993Transport-activeWeight.lean.fragment` (match)
- `src-carry-c1-la2-0017`: `SOURCE/carried-c1-la2/0017-definition-E993Transport-layerWeight.lean.fragment` (match)
- `src-carry-c1-la2-0018`: `SOURCE/carried-c1-la2/0018-definition-E993Transport-favorableLeaves.lean.fragment` (match)
- `src-carry-c1-la2-0019`: `SOURCE/carried-c1-la2/0019-definition-E993Transport-transportRel.lean.fragment` (match)
- `src-carry-c1-la2-0020`: `SOURCE/carried-c1-la2/0020-definition-E993Transport-IsSaturatingFlow.lean.fragment` (match)
- `src-carry-c1-la2-0021`: `SOURCE/carried-c1-la2/0021-definition-E993Transport-WeightedHall.lean.fragment` (match)
- `src-carry-c1-la2-0022`: `SOURCE/carried-c1-la2/0022-definition-C5LA1-crossingIndex.lean.fragment` (match)
- `src-carry-c1-la2-0023`: `SOURCE/carried-c1-la2/0023-definition-E993Transport-cbEdge.lean.fragment` (match)
- `src-carry-c1-la2-0024`: `SOURCE/carried-c1-la2/0024-definition-E993Transport-cbGraph.lean.fragment` (match)
- `src-carry-c1-la2-0025`: `SOURCE/carried-c1-la2/0025-definition-E993Transport-cbGraph_decAdj.lean.fragment` (match)
- `src-carry-c1-la2-0026`: `SOURCE/carried-c1-la2/0026-definition-E993Transport-cbVertex.lean.fragment` (match)
- `src-carry-c1-la2-0027`: `SOURCE/carried-c1-la2/0027-definition-E993Transport-cbParentVal.lean.fragment` (match)
- `src-carry-c1-la2-0028`: `SOURCE/carried-c1-la2/0028-definition-E993Transport-cbParent.lean.fragment` (match)
- `src-carry-c1-la2-0029`: `SOURCE/carried-c1-la2/0029-definition-E993Transport-cbChildEdge.lean.fragment` (match)
- `src-carry-c1-la2-0030`: `SOURCE/carried-c1-la2/0030-definition-E993Transport-cbLowerWitness.lean.fragment` (match)
- `src-carry-c1-la2-0031`: `SOURCE/carried-c1-la2/0031-lemma-E993Transport-support_eq_of_isGraphLeaf_of_adj.lean.fragment` (match)
- `src-carry-c1-la2-0032`: `SOURCE/carried-c1-la2/0032-lemma-E993Transport-mem_tagWitnesses_iff_of_adj.lean.fragment` (match)
- `src-carry-c1-la2-0033`: `SOURCE/carried-c1-la2/0033-lemma-E993Transport-cbVertex_val.lean.fragment` (match)
- `src-carry-c1-la2-0034`: `SOURCE/carried-c1-la2/0034-lemma-E993Transport-eq_cbVertex_iff.lean.fragment` (match)
- `src-carry-c1-la2-0035`: `SOURCE/carried-c1-la2/0035-lemma-E993Transport-cbGraph_adj_iff.lean.fragment` (match)
- `src-carry-c1-la2-0036`: `SOURCE/carried-c1-la2/0036-lemma-E993Transport-cbGraph_adj_iff_val.lean.fragment` (match)
- `src-carry-c1-la2-0037`: `SOURCE/carried-c1-la2/0037-lemma-E993Transport-cbGraph_adj_of_val.lean.fragment` (match)
- `src-carry-c1-la2-0038`: `SOURCE/carried-c1-la2/0038-lemma-E993Transport-cbGraph_adj_r_s.lean.fragment` (match)
- `src-carry-c1-la2-0039`: `SOURCE/carried-c1-la2/0039-lemma-E993Transport-cbGraph_adj_s_v.lean.fragment` (match)
- `src-carry-c1-la2-0040`: `SOURCE/carried-c1-la2/0040-lemma-E993Transport-cbGraph_adj_r_choke.lean.fragment` (match)
- `src-carry-c1-la2-0041`: `SOURCE/carried-c1-la2/0041-lemma-E993Transport-cbGraph_adj_choke_support.lean.fragment` (match)
- `src-carry-c1-la2-0042`: `SOURCE/carried-c1-la2/0042-lemma-E993Transport-cbGraph_adj_support_leaf.lean.fragment` (match)
- `src-carry-c1-la2-0043`: `SOURCE/carried-c1-la2/0043-lemma-E993Transport-cbGraph_reachable_zero.lean.fragment` (match)
- `src-carry-c1-la2-0044`: `SOURCE/carried-c1-la2/0044-lemma-E993Transport-cbGraph_connected.lean.fragment` (match)
- `src-carry-c1-la2-0045`: `SOURCE/carried-c1-la2/0045-lemma-E993Transport-cbParentVal_lt.lean.fragment` (match)
- `src-carry-c1-la2-0046`: `SOURCE/carried-c1-la2/0046-lemma-E993Transport-cbParentVal_le.lean.fragment` (match)
- `src-carry-c1-la2-0047`: `SOURCE/carried-c1-la2/0047-lemma-E993Transport-cbParentVal_at_s.lean.fragment` (match)
- `src-carry-c1-la2-0048`: `SOURCE/carried-c1-la2/0048-lemma-E993Transport-cbParentVal_at_v.lean.fragment` (match)
- `src-carry-c1-la2-0049`: `SOURCE/carried-c1-la2/0049-lemma-E993Transport-cbParentVal_at_choke.lean.fragment` (match)
- `src-carry-c1-la2-0050`: `SOURCE/carried-c1-la2/0050-lemma-E993Transport-cbParentVal_at_support.lean.fragment` (match)
- `src-carry-c1-la2-0051`: `SOURCE/carried-c1-la2/0051-lemma-E993Transport-cbParentVal_at_leaf.lean.fragment` (match)
- `src-carry-c1-la2-0052`: `SOURCE/carried-c1-la2/0052-lemma-E993Transport-cbGraph_adj_parent.lean.fragment` (match)
- `src-carry-c1-la2-0053`: `SOURCE/carried-c1-la2/0053-lemma-E993Transport-cbChildEdge_injective.lean.fragment` (match)
- `src-carry-c1-la2-0054`: `SOURCE/carried-c1-la2/0054-lemma-E993Transport-cbChildEdge_range.lean.fragment` (match)
- `src-carry-c1-la2-0055`: `SOURCE/carried-c1-la2/0055-lemma-E993Transport-cbGraph_card_nonroot.lean.fragment` (match)
- `src-carry-c1-la2-0056`: `SOURCE/carried-c1-la2/0056-lemma-E993Transport-cbGraph_isTree.lean.fragment` (match)
- `src-carry-c1-la2-0057`: `SOURCE/carried-c1-la2/0057-lemma-E993Transport-cb_val_cases.lean.fragment` (match)
- `src-carry-c1-la2-0058`: `SOURCE/carried-c1-la2/0058-lemma-E993Transport-cb_leaf_cases.lean.fragment` (match)
- `src-carry-c1-la2-0059`: `SOURCE/carried-c1-la2/0059-lemma-E993Transport-cb_isGraphLeaf_of_cases.lean.fragment` (match)
- `src-carry-c1-la2-0060`: `SOURCE/carried-c1-la2/0060-lemma-E993Transport-mem_leafSet_cbGraph_iff.lean.fragment` (match)
- `src-carry-c1-la2-0061`: `SOURCE/carried-c1-la2/0061-lemma-E993Transport-mem_cbLowerWitness_iff.lean.fragment` (match)
- `src-carry-c1-la2-0062`: `SOURCE/carried-c1-la2/0062-lemma-E993Transport-cbLowerWitness_card.lean.fragment` (match)
- `src-carry-c1-la2-0063`: `SOURCE/carried-c1-la2/0063-lemma-E993Transport-cbLowerWitness_isIndepSet.lean.fragment` (match)
- `src-carry-c1-la2-0064`: `SOURCE/carried-c1-la2/0064-lemma-E993Transport-cbGraph_indepNum_ge.lean.fragment` (match)
- `src-carry-c1-la2-0065`: `SOURCE/carried-c1-la2/0065-lemma-E993Transport-cbGraph_indepNum_le.lean.fragment` (match)
- `src-carry-c1-la2-0066`: `SOURCE/carried-c1-la2/0066-lemma-E993Transport-cbGraph_indepNum_eq.lean.fragment` (match)
- `src-carry-c1-la2-0067`: `SOURCE/carried-c1-la2/0067-lemma-E993Transport-cb_isGraphLeaf_v.lean.fragment` (match)
- `src-carry-c1-la2-0068`: `SOURCE/carried-c1-la2/0068-lemma-E993Transport-cb_isGraphLeaf_leaf.lean.fragment` (match)
- `src-carry-c1-la2-0069`: `SOURCE/carried-c1-la2/0069-lemma-E993Transport-mem_cb_tagWitnesses_v_iff.lean.fragment` (match)
- `src-carry-c1-la2-0070`: `SOURCE/carried-c1-la2/0070-lemma-E993Transport-mem_cb_tagWitnesses_leaf_iff.lean.fragment` (match)
- `src-carry-c1-la2-0071`: `SOURCE/carried-c1-la2/0071-lemma-E993Transport-cb_lowWindow.lean.fragment` (match)
- `src-carry-c1-la2-0072`: `SOURCE/carried-c1-la2/0072-lemma-E993Transport-cb_leafSet_eq_image.lean.fragment` (match)
- `src-carry-c1-la2-0073`: `SOURCE/carried-c1-la2/0073-lemma-E993Transport-cb_leafSet_card.lean.fragment` (match)
- `src-carry-c1-la2-0074`: `SOURCE/carried-c1-la2/0074-lemma-E993Transport-favorableLeaves_eq_leafSet_of_all.lean.fragment` (match)
- `src-carry-c1-la2-0075`: `SOURCE/carried-c1-la2/0075-lemma-E993Transport-mem_neighborFinset_choke_iff.lean.fragment` (match)
- `src-carry-c1-la2-0076`: `SOURCE/carried-c1-la2/0076-lemma-E993Transport-mem_neighborFinset_root_iff.lean.fragment` (match)
- `src-carry-c1-la2-0077`: `SOURCE/carried-c1-la2/0077-lemma-E993Transport-choke_degree.lean.fragment` (match)
- `src-carry-c1-la2-0078`: `SOURCE/carried-c1-la2/0078-theorem-E993Transport-cb8_topRank_of_descent_and_flow.lean.fragment` (match)
- `src-carry-c1-la3-0001`: `SOURCE/carried-c1-la3/0001-definition-E993Transport-polyCoeffZ.lean.fragment` (match)
- `src-carry-c1-la3-0002`: `SOURCE/carried-c1-la3/0002-lemma-E993Transport-descent_of_recurrence_logconcave.lean.fragment` (match)
- `src-carry-c1-la3-0003`: `SOURCE/carried-c1-la3/0003-lemma-E993Transport-twoBinom_derivative_identity.lean.fragment` (match)
- `src-carry-c1-la3-0004`: `SOURCE/carried-c1-la3/0004-lemma-E993Transport-twoBinomCoeff_recurrence.lean.fragment` (match)
- `src-carry-c1-la3-0005`: `SOURCE/carried-c1-la3/0005-lemma-E993Transport-polyCoeffZ_natCast.lean.fragment` (match)
- `src-carry-c1-la3-0006`: `SOURCE/carried-c1-la3/0006-lemma-E993Transport-polyCoeffZ_of_neg.lean.fragment` (match)
- `src-carry-c1-la3-0007`: `SOURCE/carried-c1-la3/0007-lemma-E993Transport-polyCoeffZ_one.lean.fragment` (match)
- `src-carry-c1-la3-0008`: `SOURCE/carried-c1-la3/0008-lemma-E993Transport-polyCoeffZ_linear_mul.lean.fragment` (match)
- `src-carry-c1-la3-0009`: `SOURCE/carried-c1-la3/0009-lemma-E993Transport-strongLC_linear_step.lean.fragment` (match)
- `src-carry-c1-la3-0010`: `SOURCE/carried-c1-la3/0010-lemma-E993Transport-twoBinom_succ_left.lean.fragment` (match)
- `src-carry-c1-la3-0011`: `SOURCE/carried-c1-la3/0011-lemma-E993Transport-twoBinom_succ_right.lean.fragment` (match)
- `src-carry-c1-la3-0012`: `SOURCE/carried-c1-la3/0012-lemma-E993Transport-polyCoeffZ_linear_mul_nonneg_pos.lean.fragment` (match)
- `src-carry-c1-la3-0013`: `SOURCE/carried-c1-la3/0013-lemma-E993Transport-twoBinomCoeffZ_nonneg_pos.lean.fragment` (match)
- `src-carry-c1-la3-0014`: `SOURCE/carried-c1-la3/0014-lemma-E993Transport-twoBinomCoeff_pos.lean.fragment` (match)
- `src-carry-c1-la3-0015`: `SOURCE/carried-c1-la3/0015-lemma-E993Transport-twoBinomCoeffZ_strongLC.lean.fragment` (match)
- `src-carry-c1-la3-0016`: `SOURCE/carried-c1-la3/0016-lemma-E993Transport-twoBinomCoeff_logConcave.lean.fragment` (match)
- `src-carry-c1-la3-0017`: `SOURCE/carried-c1-la3/0017-lemma-E993Transport-twoBinom_coeff_strictAnti_of_gap.lean.fragment` (match)
- `src-carry-c1-la3-0018`: `SOURCE/carried-c1-la3/0018-lemma-E993Transport-cb8_gap_E1_conditionI.lean.fragment` (match)
- `src-carry-c1-la3-0019`: `SOURCE/carried-c1-la3/0019-lemma-E993Transport-cb8_gap_block_descent.lean.fragment` (match)
- `src-carry-c1-la3-0020`: `SOURCE/carried-c1-la3/0020-lemma-E993Transport-cb8_E1_conditionI_topRank.lean.fragment` (match)
- `src-carry-c1-la3-0021`: `SOURCE/carried-c1-la3/0021-theorem-E993Transport-cb8_block_descent_topRank.lean.fragment` (match)
- `src-fragment-builder`: `DRAFTS/make_fragments.py` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-registration-plan`: `DRAFTS/REGISTRATION-PLAN.json` (match)
- `src-rekeyed-0057`: `DRAFTS/fragments/0057-lemma-E993Transport-cb8_block_descent_topRank.lean` (match)
- `src-rekeyed-0105`: `DRAFTS/fragments/0105-lemma-E993Transport-cb8_topRank_of_descent_and_flow.lean` (match)
- `src-s5-assertion`: `EVIDENCE/s5-generator/assertion.json` (match)
- `src-s5-assertion-script`: `EVIDENCE/s5-generator/assert_s5_generator.py` (match)
- `src-s5-generator-shipped`: `EVIDENCE/s5-generator/gen_lean_s5.py` (match)
- `src-s5-poly`: `EVIDENCE/s5-generator/crit_u1t_Poly_u.json` (match)
- `src-seed-adjcompose`: `SOURCE/draft-seeds/AdjCompose.lean` (match)
- `src-seed-crit-u1t-poly-u`: `SOURCE/draft-seeds/crit_u1t_Poly_u.json` (match)
- `src-seed-critics5`: `SOURCE/draft-seeds/CriticS5.lean` (match)
- `src-seed-criticu3t`: `SOURCE/draft-seeds/CriticU3T.lean` (match)
- `src-seed-criticu3t2`: `SOURCE/draft-seeds/CriticU3T2.lean` (match)
- `src-seed-gen-lean-s5`: `SOURCE/draft-seeds/gen_lean_s5.py` (match)
- `src-seed-u1-main`: `SOURCE/draft-seeds/U1-Main.lean` (match)
- `src-seed-u3`: `SOURCE/draft-seeds/U3.lean` (match)
- `src-semantic-contract`: `SOURCE/governing/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCE/governing/SOLUTION-CONTRACT.md` (match)
- `src-synthesis`: `SOURCE/governing/SYNTHESIS.md` (match)
- `src-u-adjudication`: `SOURCE/governing/ADJUDICATION-U.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
