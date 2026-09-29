# Theorem Contract: C2-LA3 (r31): graph-level favorability - favorableLeaves (cbGraph m) p* = leafSet (cbGraph m) at p* = (16m+4)/3 on the literal tree CB(8,m), for the class m >= 107, m = 2 (mod 3)

- Contract ID: `erdos-993-r31-c2-la3-cb8-favorable-leaves-eq-leaf-set-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `f19bebf2b4689bd567a36db6df71fcf9edf485fe474f01eef7a2c41ae7a960da`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Canonical run id erdos-993-math-dre-20260927-r31-cb-uniform-switch; award C2-LA3 (graph-level favorability); Lean run lean-2026-09-28-c2-la3-cb8-favorable-leaves-eq-leaf-set; producer c2-la3-formalizer-opus-20260928. Terminal: for every natural number m with 107 <= m and m % 3 = 2, on the literal tree CB(8,m) = cbGraph m (vertices Fin (17m+3); r = 0, s = 1, v = 2, u_i = 3+17i, b_ij = u_i+1+2j, c_ij = u_i+2+2j), the fixed original strict selector favorableLeaves (cbGraph m) p* at p* = (16m+4)/3 (natural-number floor division, exact on the class) equals the whole leaf set C5LA1.leafSet (cbGraph m); i.e. every original leaf w satisfies Delta_p*(CB - w) = i_(p*+1)(CB - w) - i_p*(CB - w) < 0 (counts over N, difference over Z; C4LA1.IsFavorableAt). Proof DAG (synthesis ### C2-LA3; INFORMAL-PROOF.md): (N1) for every private leaf c_ij (i < m, j < 8), per (i, j) directly, C4LA1.vertexDeletionIndepSetCount (cbGraph m) c_ij k equals the k-th coefficient of (1+2X) G_c G^(m-1) + X(1+X)^2(1+2X)^(8m-1) over N, G = (1+2X)^8 + X(1+X)^8, G_c = (1+2X)^7(1+X) + X(1+X)^7 (synthesis correction 5: G_c, not G'), by the vertex split at r and the branch product with one damaged branch (E993Transport.cb8_indepPoly_isolated_factor, cb8_damagedGadget, cb8_pairs_erase, cb8_privateLeaf_minus_closedNbhd_root, cb8_privateLeaf_minus_root, cb8_privateLeaf_indepPoly_closedForm, cb8_vertexDeletion_privateLeaf_eq_coeff); (N2) the arm leaf v: I(CB - v) = (1+X)G^m + X(1+2X)^(8m) and its count = coefficient (critU3T_cb_gadgets, critU3T_cb_minus_v_closedForm, critU3T_cb_vertexDeletion_v_eq_coeff, re-authored from C-U3-T's draft); (N3) the leaf classification (carried C1-LA2 entries 60 mem_leafSet_cbGraph_iff and 72 cb_leafSet_eq_image); (N4) favorability of each leaf from C2-LA2's two closed-form inequalities (carried C2-LA2 terminal cb8_leafDeletion_closedForms_descent_topRank, rekeyed theorem -> lemma, ruling R31-N-15) through the N -> Z cast of the forward difference (carried C1-LA2 entry 2) (cb8_armLeaf_isFavorableAt_topRank, cb8_privateLeaf_isFavorableAt_topRank), then carried C1-LA2 entry 74 favorableLeaves_eq_leafSet_of_all. Carried fragments (byte-identical, keyed by (origin award, entry, digest), bound to each origin kernel receipt with verdict verified): C1-LA2 Main.lean a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f (30 entries), C2-LA2 Main.lean e75c66b2eee237d04354da33ab9fb941c5fb77be98cf8db42720a681361bfaae (28 entries, entry 28 rekeyed), C2-LA1 Main.lean 986b525702a5a0d03f205da6ffbe6faf675ef4841473a498b33ef27e70190c9d (19 entries: the vertex split, the m-ary product and C-U3-T's closed-form machinery). Statement plumbing change recorded (EVIDENCE/terminal-statement-check.json): the frozen fully qualified name is written namespace-relative inside namespace E993Transport, and the Markdown list indentation is removed; binders, hypotheses, types and conclusion are byte-identical. Fences on the face: one rank p* = (16m+4)/3; d = 8; the r31 class m >= 107, m = 2 (mod 3) only; a statement about the literal cbGraph m. Excluded conclusions (not claimed, not implied): (H); conjunct 4 of the terminal; (HALL) at any scope; any aggregate; any TREE, FOREST or TRANSFER status; Erdos #993; any rank other than p*; m < 107; m not = 2 (mod 3); d != 8. No grade is asserted for any companion (every non-terminal declaration, carried or new, is a kernel-checked companion with no grade of its own). On closure the controller registers the formal clause of the r30 favorability key's scope note (d = 8, the r31 class, rank (16m+4)/3); no new key. Attribution (exactly the synthesis ### C2-LA3 list, "as C2-LA2, plus C-U3-T and U3 for the link machinery", with the brief's additions): T1 (seat, arm leaf); C-T1-F, C-T1-U (arm-leaf Lean); C-F2-U (both leaves, regrouping, Lean); C-F2-T, C-T2-F, C-T2-U (independent private-leaf proofs); r30 (closed forms, pairing, favorability key); C1-LA3 (G); C-U3-T (critic; closed-form link) and U3 (seat C2-U-03; Node 0) for the link machinery; C2-LA1 and C2-LA2 (r31 Cycle 2 formalizers); plus the formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5; chartered effort high, session-applied; runtime-reported model id claude-opus-5-5). Carry provenance (binding, not an attribution addition): the definition layer and entries 60, 72, 74 are C1-LA2's (r31 C1 formalizer); each carried fragment keeps its origin header.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.cb8_favorableLeaves_eq_leafSet_topRank`
- Statement SHA-256: `fcfbc54b0faf6b34a905cb3c5a31975502441694cb38a4aba828d92ae0799b27`

```lean
theorem cb8_favorableLeaves_eq_leafSet_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    favorableLeaves (cbGraph m) ((16 * m + 4) / 3) = C5LA1.leafSet (cbGraph m)
```

## Quantifiers

- `forall m` over `domain-m`

## Hypotheses

- `hyp-m-ge-107`: hm : 107 ≤ m (verbatim). Used for 0 < m (carried entry 72) and passed to the carried C2-LA2 terminal (where it is unused).
- `hyp-m-mod-3`: hmod : m % 3 = 2 (verbatim). Passed to the carried C2-LA2 terminal; makes (16 * m + 4) / 3 = p* exact.

## Conclusion

- `conclusion`: favorableLeaves (cbGraph m) ((16 * m + 4) / 3) = C5LA1.leafSet (cbGraph m) - every original leaf of the literal tree CB(8,m) is strictly favorable at the single rank p* (graph level). Fences on the face: one rank p* = (16m+4)/3; d = 8; the r31 class m >= 107, m = 2 (mod 3) only; a statement about the literal cbGraph m. Excluded conclusions (not claimed, not implied): (H); conjunct 4 of the terminal; (HALL) at any scope; any aggregate; any TREE, FOREST or TRANSFER status; Erdos #993; any rank other than p*; m < 107; m not = 2 (mod 3); d != 8. No grade is asserted for any companion (every non-terminal declaration, carried or new, is a kernel-checked companion with no grade of its own). On closure the controller registers the formal clause of the r30 favorability key's scope note (d = 8, the r31 class, rank (16m+4)/3); no new key.

## Dependencies

- `def-simplegraph` -> `def-vertexdeletionindepsetcount`
- `def-vertexdeletionindepsetcount` -> `def-vertexdeletionforwarddifference`
- `def-vertexdeletionforwarddifference` -> `def-isfavorableat`
- `def-simplegraph` -> `def-isgraphleaf`
- `def-isgraphleaf` -> `def-leafset`
- `def-simplegraph` -> `def-indepsetsavoiding`
- `def-indepsetsavoiding` -> `def-indepsetcount`
- `def-leafset` -> `def-favorableleaves`
- `def-isfavorableat` -> `def-favorableleaves`
- `def-fin` -> `def-cbedge`
- `def-cbedge` -> `def-cbgraph`
- `def-simplegraph` -> `def-cbgraph`
- `def-cbgraph` -> `def-cbgraph-decadj`
- `def-fin` -> `def-cbvertex`
- `def-indepsetcount` -> `def-critu3t-indeppoly`
- `def-fin` -> `def-critu3t-cbpart`
- `domain-m` -> `hyp-m-ge-107`
- `domain-m` -> `hyp-m-mod-3`
- `hyp-m-ge-107` -> `conclusion`
- `hyp-m-mod-3` -> `conclusion`
- `def-nat-div` -> `conclusion`
- `def-fin` -> `conclusion`
- `def-simplegraph` -> `conclusion`
- `def-leafset` -> `conclusion`
- `def-favorableleaves` -> `conclusion`
- `def-cbgraph` -> `conclusion`
- `def-cbgraph-decadj` -> `conclusion`
- `def-isfavorableat` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-brief`: `SOURCE/control-C2-STAGE7-FORMALIZER-BRIEF-LA3.md` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carried-c1-la2-0001-definition-c4la1-vertexdeletionindepsetcount-lean-fragment`: `SOURCE/carried-c1-la2-0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `src-carried-c1-la2-0002-definition-c4la1-vertexdeletionforwarddifference-lean-fragment`: `SOURCE/carried-c1-la2-0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `src-carried-c1-la2-0003-definition-c4la1-isfavorableat-lean-fragment`: `SOURCE/carried-c1-la2-0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `src-carried-c1-la2-0004-definition-c4la1-isgraphleaf-lean-fragment`: `SOURCE/carried-c1-la2-0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `src-carried-c1-la2-0006-definition-c5la1-leafset-lean-fragment`: `SOURCE/carried-c1-la2-0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `src-carried-c1-la2-0009-definition-c5la1-indepsetsavoiding-lean-fragment`: `SOURCE/carried-c1-la2-0009-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `src-carried-c1-la2-0010-definition-c5la1-indepsetcount-lean-fragment`: `SOURCE/carried-c1-la2-0010-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `src-carried-c1-la2-0018-definition-e993transport-favorableleaves-lean-fragment`: `SOURCE/carried-c1-la2-0018-definition-E993Transport-favorableLeaves.lean.fragment` (match)
- `src-carried-c1-la2-0023-definition-e993transport-cbedge-lean-fragment`: `SOURCE/carried-c1-la2-0023-definition-E993Transport-cbEdge.lean.fragment` (match)
- `src-carried-c1-la2-0024-definition-e993transport-cbgraph-lean-fragment`: `SOURCE/carried-c1-la2-0024-definition-E993Transport-cbGraph.lean.fragment` (match)
- `src-carried-c1-la2-0025-definition-e993transport-cbgraph-decadj-lean-fragment`: `SOURCE/carried-c1-la2-0025-definition-E993Transport-cbGraph_decAdj.lean.fragment` (match)
- `src-carried-c1-la2-0026-definition-e993transport-cbvertex-lean-fragment`: `SOURCE/carried-c1-la2-0026-definition-E993Transport-cbVertex.lean.fragment` (match)
- `src-carried-c1-la2-0033-lemma-e993transport-cbvertex-val-lean-fragment`: `SOURCE/carried-c1-la2-0033-lemma-E993Transport-cbVertex_val.lean.fragment` (match)
- `src-carried-c1-la2-0034-lemma-e993transport-eq-cbvertex-iff-lean-fragment`: `SOURCE/carried-c1-la2-0034-lemma-E993Transport-eq_cbVertex_iff.lean.fragment` (match)
- `src-carried-c1-la2-0035-lemma-e993transport-cbgraph-adj-iff-lean-fragment`: `SOURCE/carried-c1-la2-0035-lemma-E993Transport-cbGraph_adj_iff.lean.fragment` (match)
- `src-carried-c1-la2-0036-lemma-e993transport-cbgraph-adj-iff-val-lean-fragment`: `SOURCE/carried-c1-la2-0036-lemma-E993Transport-cbGraph_adj_iff_val.lean.fragment` (match)
- `src-carried-c1-la2-0037-lemma-e993transport-cbgraph-adj-of-val-lean-fragment`: `SOURCE/carried-c1-la2-0037-lemma-E993Transport-cbGraph_adj_of_val.lean.fragment` (match)
- `src-carried-c1-la2-0038-lemma-e993transport-cbgraph-adj-r-s-lean-fragment`: `SOURCE/carried-c1-la2-0038-lemma-E993Transport-cbGraph_adj_r_s.lean.fragment` (match)
- `src-carried-c1-la2-0039-lemma-e993transport-cbgraph-adj-s-v-lean-fragment`: `SOURCE/carried-c1-la2-0039-lemma-E993Transport-cbGraph_adj_s_v.lean.fragment` (match)
- `src-carried-c1-la2-0040-lemma-e993transport-cbgraph-adj-r-choke-lean-fragment`: `SOURCE/carried-c1-la2-0040-lemma-E993Transport-cbGraph_adj_r_choke.lean.fragment` (match)
- `src-carried-c1-la2-0041-lemma-e993transport-cbgraph-adj-choke-support-lean-fragment`: `SOURCE/carried-c1-la2-0041-lemma-E993Transport-cbGraph_adj_choke_support.lean.fragment` (match)
- `src-carried-c1-la2-0042-lemma-e993transport-cbgraph-adj-support-leaf-lean-fragment`: `SOURCE/carried-c1-la2-0042-lemma-E993Transport-cbGraph_adj_support_leaf.lean.fragment` (match)
- `src-carried-c1-la2-0057-lemma-e993transport-cb-val-cases-lean-fragment`: `SOURCE/carried-c1-la2-0057-lemma-E993Transport-cb_val_cases.lean.fragment` (match)
- `src-carried-c1-la2-0058-lemma-e993transport-cb-leaf-cases-lean-fragment`: `SOURCE/carried-c1-la2-0058-lemma-E993Transport-cb_leaf_cases.lean.fragment` (match)
- `src-carried-c1-la2-0059-lemma-e993transport-cb-isgraphleaf-of-cases-lean-fragment`: `SOURCE/carried-c1-la2-0059-lemma-E993Transport-cb_isGraphLeaf_of_cases.lean.fragment` (match)
- `src-carried-c1-la2-0060-lemma-e993transport-mem-leafset-cbgraph-iff-lean-fragment`: `SOURCE/carried-c1-la2-0060-lemma-E993Transport-mem_leafSet_cbGraph_iff.lean.fragment` (match)
- `src-carried-c1-la2-0072-lemma-e993transport-cb-leafset-eq-image-lean-fragment`: `SOURCE/carried-c1-la2-0072-lemma-E993Transport-cb_leafSet_eq_image.lean.fragment` (match)
- `src-carried-c1-la2-0074-lemma-e993transport-favorableleaves-eq-leafset-of-all-lean-fragment`: `SOURCE/carried-c1-la2-0074-lemma-E993Transport-favorableLeaves_eq_leafSet_of_all.lean.fragment` (match)
- `src-carried-c1-la2-0075-lemma-e993transport-mem-neighborfinset-choke-iff-lean-fragment`: `SOURCE/carried-c1-la2-0075-lemma-E993Transport-mem_neighborFinset_choke_iff.lean.fragment` (match)
- `src-carried-c1-la2-0076-lemma-e993transport-mem-neighborfinset-root-iff-lean-fragment`: `SOURCE/carried-c1-la2-0076-lemma-E993Transport-mem_neighborFinset_root_iff.lean.fragment` (match)
- `src-carried-c2-la1-0036-definition-e993transport-critu3t-indeppoly-lean-fragment`: `SOURCE/carried-c2-la1-0036-definition-E993Transport-critU3T_indepPoly.lean.fragment` (match)
- `src-carried-c2-la1-0037-definition-e993transport-critu3t-cbpart-lean-fragment`: `SOURCE/carried-c2-la1-0037-definition-E993Transport-critU3T_cbPart.lean.fragment` (match)
- `src-carried-c2-la1-0521-lemma-e993transport-indepsetcount-succ-split-lean-fragment`: `SOURCE/carried-c2-la1-0521-lemma-E993Transport-indepSetCount_succ_split.lean.fragment` (match)
- `src-carried-c2-la1-0522-lemma-e993transport-critu3t-mem-indepsetsavoiding-lean-fragment`: `SOURCE/carried-c2-la1-0522-lemma-E993Transport-critU3T_mem_indepSetsAvoiding.lean.fragment` (match)
- `src-carried-c2-la1-0523-lemma-e993transport-critu3t-indepsetcount-disjoint-split-lean-fragme`: `SOURCE/carried-c2-la1-0523-lemma-E993Transport-critU3T_indepSetCount_disjoint_split.lean.fragment` (match)
- `src-carried-c2-la1-0524-lemma-e993transport-critu3t-indepsetcount-eq-zero-lean-fragment`: `SOURCE/carried-c2-la1-0524-lemma-E993Transport-critU3T_indepSetCount_eq_zero.lean.fragment` (match)
- `src-carried-c2-la1-0525-lemma-e993transport-critu3t-coeff-indeppoly-lean-fragment`: `SOURCE/carried-c2-la1-0525-lemma-E993Transport-critU3T_coeff_indepPoly.lean.fragment` (match)
- `src-carried-c2-la1-0526-lemma-e993transport-critu3t-indeppoly-disjoint-mul-lean-fragment`: `SOURCE/carried-c2-la1-0526-lemma-E993Transport-critU3T_indepPoly_disjoint_mul.lean.fragment` (match)
- `src-carried-c2-la1-0527-lemma-e993transport-critu3t-indeppoly-congr-lean-fragment`: `SOURCE/carried-c2-la1-0527-lemma-E993Transport-critU3T_indepPoly_congr.lean.fragment` (match)
- `src-carried-c2-la1-0528-lemma-e993transport-critu3t-indeppoly-univ-lean-fragment`: `SOURCE/carried-c2-la1-0528-lemma-E993Transport-critU3T_indepPoly_univ.lean.fragment` (match)
- `src-carried-c2-la1-0529-lemma-e993transport-critu3t-indeppoly-eq-prod-lean-fragment`: `SOURCE/carried-c2-la1-0529-lemma-E993Transport-critU3T_indepPoly_eq_prod.lean.fragment` (match)
- `src-carried-c2-la1-0530-lemma-e993transport-critu3t-mem-cbpart-lean-fragment`: `SOURCE/carried-c2-la1-0530-lemma-E993Transport-critU3T_mem_cbPart.lean.fragment` (match)
- `src-carried-c2-la1-0532-lemma-e993transport-critu3t-indeppoly-vertex-split-lean-fragment`: `SOURCE/carried-c2-la1-0532-lemma-E993Transport-critU3T_indepPoly_vertex_split.lean.fragment` (match)
- `src-carried-c2-la1-0533-lemma-e993transport-critu3t-indeppoly-eq-one-lean-fragment`: `SOURCE/carried-c2-la1-0533-lemma-E993Transport-critU3T_indepPoly_eq_one.lean.fragment` (match)
- `src-carried-c2-la1-0534-lemma-e993transport-critu3t-indeppoly-single-lean-fragment`: `SOURCE/carried-c2-la1-0534-lemma-E993Transport-critU3T_indepPoly_single.lean.fragment` (match)
- `src-carried-c2-la1-0535-lemma-e993transport-critu3t-indeppoly-edge-lean-fragment`: `SOURCE/carried-c2-la1-0535-lemma-E993Transport-critU3T_indepPoly_edge.lean.fragment` (match)
- `src-carried-c2-la1-0536-lemma-e993transport-critu3t-cb-pendant-lean-fragment`: `SOURCE/carried-c2-la1-0536-lemma-E993Transport-critU3T_cb_pendant.lean.fragment` (match)
- `src-carried-c2-la1-0537-lemma-e993transport-critu3t-cb-gadget-lean-fragment`: `SOURCE/carried-c2-la1-0537-lemma-E993Transport-critU3T_cb_gadget.lean.fragment` (match)
- `src-carried-c2-la1-0538-lemma-e993transport-critu3t-cb-pairs-lean-fragment`: `SOURCE/carried-c2-la1-0538-lemma-E993Transport-critU3T_cb_pairs.lean.fragment` (match)
- `src-carried-c2-la2-0001-definition-e993transport-polycoeffz-lean-fragment`: `SOURCE/carried-c2-la2-0001-definition-E993Transport-polyCoeffZ.lean.fragment` (match)
- `src-carried-c2-la2-0002-lemma-e993transport-descent-of-recurrence-logconcave-lean-fragment`: `SOURCE/carried-c2-la2-0002-lemma-E993Transport-descent_of_recurrence_logconcave.lean.fragment` (match)
- `src-carried-c2-la2-0003-lemma-e993transport-twobinom-derivative-identity-lean-fragment`: `SOURCE/carried-c2-la2-0003-lemma-E993Transport-twoBinom_derivative_identity.lean.fragment` (match)
- `src-carried-c2-la2-0004-lemma-e993transport-twobinomcoeff-recurrence-lean-fragment`: `SOURCE/carried-c2-la2-0004-lemma-E993Transport-twoBinomCoeff_recurrence.lean.fragment` (match)
- `src-carried-c2-la2-0005-lemma-e993transport-polycoeffz-natcast-lean-fragment`: `SOURCE/carried-c2-la2-0005-lemma-E993Transport-polyCoeffZ_natCast.lean.fragment` (match)
- `src-carried-c2-la2-0006-lemma-e993transport-polycoeffz-of-neg-lean-fragment`: `SOURCE/carried-c2-la2-0006-lemma-E993Transport-polyCoeffZ_of_neg.lean.fragment` (match)
- `src-carried-c2-la2-0007-lemma-e993transport-polycoeffz-one-lean-fragment`: `SOURCE/carried-c2-la2-0007-lemma-E993Transport-polyCoeffZ_one.lean.fragment` (match)
- `src-carried-c2-la2-0008-lemma-e993transport-polycoeffz-linear-mul-lean-fragment`: `SOURCE/carried-c2-la2-0008-lemma-E993Transport-polyCoeffZ_linear_mul.lean.fragment` (match)
- `src-carried-c2-la2-0009-lemma-e993transport-stronglc-linear-step-lean-fragment`: `SOURCE/carried-c2-la2-0009-lemma-E993Transport-strongLC_linear_step.lean.fragment` (match)
- `src-carried-c2-la2-0010-lemma-e993transport-twobinom-succ-left-lean-fragment`: `SOURCE/carried-c2-la2-0010-lemma-E993Transport-twoBinom_succ_left.lean.fragment` (match)
- `src-carried-c2-la2-0011-lemma-e993transport-twobinom-succ-right-lean-fragment`: `SOURCE/carried-c2-la2-0011-lemma-E993Transport-twoBinom_succ_right.lean.fragment` (match)
- `src-carried-c2-la2-0012-lemma-e993transport-polycoeffz-linear-mul-nonneg-pos-lean-fragment`: `SOURCE/carried-c2-la2-0012-lemma-E993Transport-polyCoeffZ_linear_mul_nonneg_pos.lean.fragment` (match)
- `src-carried-c2-la2-0013-lemma-e993transport-twobinomcoeffz-nonneg-pos-lean-fragment`: `SOURCE/carried-c2-la2-0013-lemma-E993Transport-twoBinomCoeffZ_nonneg_pos.lean.fragment` (match)
- `src-carried-c2-la2-0014-lemma-e993transport-twobinomcoeff-pos-lean-fragment`: `SOURCE/carried-c2-la2-0014-lemma-E993Transport-twoBinomCoeff_pos.lean.fragment` (match)
- `src-carried-c2-la2-0015-lemma-e993transport-twobinomcoeffz-stronglc-lean-fragment`: `SOURCE/carried-c2-la2-0015-lemma-E993Transport-twoBinomCoeffZ_strongLC.lean.fragment` (match)
- `src-carried-c2-la2-0016-lemma-e993transport-twobinomcoeff-logconcave-lean-fragment`: `SOURCE/carried-c2-la2-0016-lemma-E993Transport-twoBinomCoeff_logConcave.lean.fragment` (match)
- `src-carried-c2-la2-0017-lemma-e993transport-twobinom-coeff-strictanti-of-gap-lean-fragment`: `SOURCE/carried-c2-la2-0017-lemma-E993Transport-twoBinom_coeff_strictAnti_of_gap.lean.fragment` (match)
- `src-carried-c2-la2-0018-lemma-e993transport-cb8-armleaf-blockexpansion-lean-fragment`: `SOURCE/carried-c2-la2-0018-lemma-E993Transport-cb8_armLeaf_blockExpansion.lean.fragment` (match)
- `src-carried-c2-la2-0019-lemma-e993transport-cb8-armleaf-block-descent-lean-fragment`: `SOURCE/carried-c2-la2-0019-lemma-E993Transport-cb8_armLeaf_block_descent.lean.fragment` (match)
- `src-carried-c2-la2-0020-lemma-e993transport-cb8-armleaf-remainder-descent-lean-fragment`: `SOURCE/carried-c2-la2-0020-lemma-E993Transport-cb8_armLeaf_remainder_descent.lean.fragment` (match)
- `src-carried-c2-la2-0021-lemma-e993transport-cb8-armleaf-closedform-descent-toprank-lean-frag`: `SOURCE/carried-c2-la2-0021-lemma-E993Transport-cb8_armLeaf_closedForm_descent_topRank.lean.fragment` (match)
- `src-carried-c2-la2-0022-lemma-e993transport-cb8-privateleaf-blockexpansion-lean-fragment`: `SOURCE/carried-c2-la2-0022-lemma-E993Transport-cb8_privateLeaf_blockExpansion.lean.fragment` (match)
- `src-carried-c2-la2-0023-lemma-e993transport-cb8-privateleaf-regroup-lean-fragment`: `SOURCE/carried-c2-la2-0023-lemma-E993Transport-cb8_privateLeaf_regroup.lean.fragment` (match)
- `src-carried-c2-la2-0024-lemma-e993transport-cb8-privateleaf-e0-block-descent-lean-fragment`: `SOURCE/carried-c2-la2-0024-lemma-E993Transport-cb8_privateLeaf_E0_block_descent.lean.fragment` (match)
- `src-carried-c2-la2-0025-lemma-e993transport-cb8-privateleaf-e1-block-descent-lean-fragment`: `SOURCE/carried-c2-la2-0025-lemma-E993Transport-cb8_privateLeaf_E1_block_descent.lean.fragment` (match)
- `src-carried-c2-la2-0026-lemma-e993transport-cb8-privateleaf-regrouped-descent-lean-fragment`: `SOURCE/carried-c2-la2-0026-lemma-E993Transport-cb8_privateLeaf_regrouped_descent.lean.fragment` (match)
- `src-carried-c2-la2-0027-lemma-e993transport-cb8-privateleaf-closedform-descent-toprank-lean-`: `SOURCE/carried-c2-la2-0027-lemma-E993Transport-cb8_privateLeaf_closedForm_descent_topRank.lean.fragment` (match)
- `src-carried-c2-la2-0028-theorem-e993transport-cb8-leafdeletion-closedforms-descent-toprank-l`: `SOURCE/carried-c2-la2-0028-theorem-E993Transport-cb8_leafDeletion_closedForms_descent_topRank.lean.fragment` (match)
- `src-carry-plan`: `DRAFTS/CARRY-PLAN.json` (match)
- `src-draft-crit-u3-t-criticu3t-lean`: `SOURCE/draft-crit-U3-T-CriticU3T.lean` (match)
- `src-draft-crit-u3-t-criticu3t2-lean`: `SOURCE/draft-crit-U3-T-CriticU3T2.lean` (match)
- `src-draft-crit-u3-t-u3-lean`: `SOURCE/draft-crit-U3-T-U3.lean` (match)
- `src-drafts-assemble-py`: `DRAFTS/assemble.py` (match)
- `src-drafts-capsule-verification-py`: `DRAFTS/capsule_verification.py` (match)
- `src-drafts-closure-py`: `DRAFTS/closure.py` (match)
- `src-drafts-make-carries-py`: `DRAFTS/make_carries.py` (match)
- `src-drafts-make-contract-py`: `DRAFTS/make_contract.py` (match)
- `src-drafts-make-reauthored-py`: `DRAFTS/make_reauthored.py` (match)
- `src-drafts-new-01-critu3t-cb-gadgets-lean`: `DRAFTS/new/01-critU3T_cb_gadgets.lean` (match)
- `src-drafts-new-02-critu3t-cb-minus-v-closedform-lean`: `DRAFTS/new/02-critU3T_cb_minus_v_closedForm.lean` (match)
- `src-drafts-new-03-critu3t-cb-vertexdeletion-v-eq-coeff-lean`: `DRAFTS/new/03-critU3T_cb_vertexDeletion_v_eq_coeff.lean` (match)
- `src-drafts-new-04-cb8-indeppoly-isolated-factor-lean`: `DRAFTS/new/04-cb8_indepPoly_isolated_factor.lean` (match)
- `src-drafts-new-05-cb8-damagedgadget-lean`: `DRAFTS/new/05-cb8_damagedGadget.lean` (match)
- `src-drafts-new-06-cb8-pairs-erase-lean`: `DRAFTS/new/06-cb8_pairs_erase.lean` (match)
- `src-drafts-new-07-cb8-privateleaf-minus-closednbhd-root-lean`: `DRAFTS/new/07-cb8_privateLeaf_minus_closedNbhd_root.lean` (match)
- `src-drafts-new-08-cb8-privateleaf-minus-root-lean`: `DRAFTS/new/08-cb8_privateLeaf_minus_root.lean` (match)
- `src-drafts-new-09-cb8-privateleaf-indeppoly-closedform-lean`: `DRAFTS/new/09-cb8_privateLeaf_indepPoly_closedForm.lean` (match)
- `src-drafts-new-10-cb8-vertexdeletion-privateleaf-eq-coeff-lean`: `DRAFTS/new/10-cb8_vertexDeletion_privateLeaf_eq_coeff.lean` (match)
- `src-drafts-new-11-cb8-armleaf-isfavorableat-toprank-lean`: `DRAFTS/new/11-cb8_armLeaf_isFavorableAt_topRank.lean` (match)
- `src-drafts-new-12-cb8-privateleaf-isfavorableat-toprank-lean`: `DRAFTS/new/12-cb8_privateLeaf_isFavorableAt_topRank.lean` (match)
- `src-drafts-new-13-cb8-favorableleaves-eq-leafset-toprank-lean`: `DRAFTS/new/13-cb8_favorableLeaves_eq_leafSet_topRank.lean` (match)
- `src-drafts-register-all-py`: `DRAFTS/register_all.py` (match)
- `src-drafts-rekeyed-0028-lemma-e993transport-cb8-leafdeletion-closedforms-descent-toprank-lea`: `DRAFTS/rekeyed/0028-lemma-E993Transport-cb8_leafDeletion_closedForms_descent_topRank.lean.fragment` (match)
- `src-drafts-terminal-check-py`: `DRAFTS/terminal_check.py` (match)
- `src-drafts-token-scan-py`: `DRAFTS/token_scan.py` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-origin-c1la2-formalization-state-json`: `SOURCE/origin-c1la2-FORMALIZATION-STATE.json` (match)
- `src-origin-c1la2-kernel-verification-json`: `SOURCE/origin-c1la2-kernel-verification.json` (match)
- `src-origin-c1la2-main-lean`: `SOURCE/origin-c1la2-Main.lean` (match)
- `src-origin-c2la1-formalization-state-json`: `SOURCE/origin-c2la1-FORMALIZATION-STATE.json` (match)
- `src-origin-c2la1-formalizer-report-md`: `SOURCE/origin-c2la1-FORMALIZER-REPORT.md` (match)
- `src-origin-c2la1-kernel-verification-json`: `SOURCE/origin-c2la1-kernel-verification.json` (match)
- `src-origin-c2la1-main-lean`: `SOURCE/origin-c2la1-Main.lean` (match)
- `src-origin-c2la2-capsule-verification-json`: `SOURCE/origin-c2la2-CAPSULE-VERIFICATION.json` (match)
- `src-origin-c2la2-formalization-state-json`: `SOURCE/origin-c2la2-FORMALIZATION-STATE.json` (match)
- `src-origin-c2la2-formalizer-report-md`: `SOURCE/origin-c2la2-FORMALIZER-REPORT.md` (match)
- `src-origin-c2la2-kernel-verification-json`: `SOURCE/origin-c2la2-kernel-verification.json` (match)
- `src-origin-c2la2-main-lean`: `SOURCE/origin-c2la2-Main.lean` (match)
- `src-protocol`: `SOURCE/control-C2-STAGE7-PROTOCOL.md` (match)
- `src-registration-order`: `DRAFTS/REGISTRATION-ORDER.json` (match)
- `src-second-read-sr-c2-1-md`: `SOURCE/second-read-SR-C2-1.md` (match)
- `src-semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `src-synthesis`: `SOURCE/cycle-2-stage6-SYNTHESIS.md` (match)
- `src-terminal-check`: `EVIDENCE/terminal-statement-check.json` (match)

## Validation Notes

- Errors: none
- Warnings: none
