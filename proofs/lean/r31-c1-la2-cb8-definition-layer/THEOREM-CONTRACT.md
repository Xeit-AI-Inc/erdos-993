# Theorem Contract: C1-LA2 (r31): the CB(8,m) definition layer; the SOLUTION-CONTRACT section 2 terminal reduced to its conjuncts 2 and 4 (tree and low window discharged)

- Contract ID: `erdos-993-r31-c1-la2-cb8-definition-layer-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `2ccf0c3b6dede75d6b36321e472cb0723f3d972d04b8480879e96645318408cf`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Canonical run id erdos-993-math-dre-20260927-r31-cb-uniform-switch; award C1-LA2 (r31 Cycle 1; the U adjudicator's AG-U-A); governed run lean-2026-09-28-c1-la2-cb8-definition-layer; key on closure: named by the synthesis ## Registrations (the controller registers it after the award closes and the matching second read passes). OBJECT: the CB(8,m) structural layer over the carried definitions of record: cbGraph m : SimpleGraph (Fin (17*m+3)) = SimpleGraph.fromRel (cbEdge m) with the FROZEN labelling 0 = r, 1 = s, 2 = v, u_i = 3+17i, b_ij = u_i+1+2j, c_ij = u_i+2+2j (i < m, j < 8; edges r-s, s-v, r-u_i, u_i-b_ij, b_ij-c_ij), with the computable instance cbGraph_decAdj. STRUCTURAL FACTS (lemmas on the face, companions with no certificate of their own): cbGraph_isTree (every m); cbGraph_indepNum_eq (0 < m): indepNum = 9m+1; mem_leafSet_cbGraph_iff (0 < m): leafSet = {v} u {c_ij}; cb_leafSet_card (0 < m): card = 8m+1; mem_cb_tagWitnesses_v_iff: W_v = {r} (the unused hm dropped); mem_cb_tagWitnesses_leaf_iff: W_{c_ij} = {u_i}; cb_lowWindow (0 < m): 3*((16m+4)/3) < 2*indepNum+1; favorableLeaves_eq_leafSet_of_all (graph-generic, conditional on its all-favorable hypothesis); mem_neighborFinset_choke_iff: N(u_i) = {r} u {b_ij}; mem_neighborFinset_root_iff: N(r) = {s} u {u_i}; choke_degree: deg u_i = 9. TERMINAL (the one theorem): for every natural m with 107 <= m and m % 3 = 2, IF (hE) C5LA1.crossingIndex (cbGraph m) + 2 <= (16m+4)/3 AND (hH) there is a saturating flow of the transport network of cbGraph m at rank (16m+4)/3 with the derived selector favorableLeaves (cbGraph m) ((16m+4)/3), THEN the SOLUTION-CONTRACT section 2 terminal body holds: IsTree AND the descent conjunct AND the low window AND the flow conjunct. That is, the section 2 terminal reduces to its conjuncts 2 and 4: conjunct 1 (tree) and conjunct 3 (low window) are discharged; conjuncts 2 and 4 are HYPOTHESES and are NOT asserted. hres is carried for the class shape and is not used. FENCES: structural facts only; no rank claim beyond the low window; no (HALL); no favorability; no descent; the terminal asserts neither conjunct 2 nor conjunct 4. EXCLUDED CONCLUSIONS: everything beyond the listed structural facts, in particular Tier 1, (HALL) at any scope, the favorability key, E1, (ELIG-top)(a), any aggregate, TREE, FOREST, TRANSFER and Erdos #993. INFRASTRUCTURE, NOT Tier 2 progress. No grade is asserted for any companion lemma; a compiled declaration has no grade until the governed award closes. Carried definitions of record: r30 C6-LA2 Snippets entries 1-21 (identical to r30 C1-LA1), 0035 C5LA1.crossingIndex, 0123 support_eq_of_isGraphLeaf_of_adj, 0124 mem_tagWitnesses_iff_of_adj, byte-identical and bound to the C6-LA2 kernel receipt (CAPSULE-VERIFICATION.json); never r30 C1-LA2 0014-0021 (pre-freeze bytes, synthesis R-8); never U1's own file. Attribution (the synthesis section's list, verbatim, plus the formalizer): structural content: r30's CB record (R30-CB-RECORD) and its seats; Lean layer: r31 U1; leaf-card and terminal reduction: C-U1-T; interface lemmas: C-U1-F; the integration check: the U adjudicator; the network definitions: r30 awards; Lean text of record, assembly, registration and verification: the formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5; chartered Claude Opus 5.5 effort high on dispatch-record authority; runtime-reported model id claude-opus-5-5).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.cb8_topRank_of_descent_and_flow`
- Statement SHA-256: `daf8342302bc281a91de21368a7cf01fb028d383fcdce9ee489258496f70a538`

```lean
theorem cb8_topRank_of_descent_and_flow (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2)
    (hE : C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3)
    (hH : ∃ f, IsSaturatingFlow (cbGraph m)
      (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f) :
    (cbGraph m).IsTree ∧
    C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
    3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1 ∧
    ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f
```

## Quantifiers

- `forall m` over `domain-m`
- `exists f` over `domain-flow`

## Hypotheses

- `hyp-m-ge-107`: hm : 107 ≤ m (verbatim). Used only through its consequence 0 < m (for cb_lowWindow).
- `hyp-residue`: hres : m % 3 = 2 (verbatim). Carried for the class shape of the SOLUTION-CONTRACT section 2 terminal; not used by the proof.
- `hyp-descent`: hE : C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 (verbatim; terminal conjunct 2 as a HYPOTHESIS, not asserted).
- `hyp-flow`: hH : ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f (verbatim; terminal conjunct 4 as a HYPOTHESIS, not asserted; the selector is derived, never hard-coded).

## Conclusion

- `conclusion`: (cbGraph m).IsTree ∧ C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧ 3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1 ∧ ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f -- the SOLUTION-CONTRACT section 2 terminal body verbatim; conjuncts 1 and 3 discharged by cbGraph_isTree and cb_lowWindow, conjuncts 2 and 4 returned from hE and hH.

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
- `domain-m` -> `domain-flow`
- `domain-m` -> `hyp-m-ge-107`
- `domain-m` -> `hyp-residue`
- `domain-m` -> `hyp-descent`
- `def-crossing-index` -> `hyp-descent`
- `def-cb-graph` -> `hyp-descent`
- `def-cb-decadj` -> `hyp-descent`
- `domain-m` -> `hyp-flow`
- `domain-flow` -> `hyp-flow`
- `def-saturating-flow` -> `hyp-flow`
- `def-favorable-leaves` -> `hyp-flow`
- `def-cb-graph` -> `hyp-flow`
- `def-cb-decadj` -> `hyp-flow`
- `hyp-m-ge-107` -> `conclusion`
- `hyp-residue` -> `conclusion`
- `hyp-descent` -> `conclusion`
- `hyp-flow` -> `conclusion`
- `def-is-tree` -> `conclusion`
- `def-indep-num` -> `conclusion`
- `def-cb-graph` -> `conclusion`
- `def-cb-decadj` -> `conclusion`
- `def-crossing-index` -> `conclusion`
- `def-saturating-flow` -> `conclusion`
- `def-favorable-leaves` -> `conclusion`
- `domain-flow` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-brief`: `SOURCE/C1-STAGE7-FORMALIZER-BRIEF-LA2.md` (match)
- `src-c-u1-f-audit-out`: `SOURCE/C-U1-F-audit_out.txt` (match)
- `src-c-u1-f-critique`: `SOURCE/cycle-1-C-U1-F-CRITIQUE.md` (match)
- `src-c-u1-t-assemble`: `SOURCE/C-U1-T-assemble.py` (match)
- `src-c-u1-t-axioms`: `SOURCE/C-U1-T-axioms.txt` (match)
- `src-c-u1-t-build`: `SOURCE/C-U1-T-critic_advance_build.txt` (match)
- `src-c-u1-t-carry-check`: `SOURCE/C-U1-T-carry_check.out.txt` (match)
- `src-c-u1-t-critique`: `SOURCE/cycle-1-C-U1-T-CRITIQUE.md` (match)
- `src-c1-source-digests`: `SOURCE/c1-stage7-sources-SOURCE-DIGESTS.json` (match)
- `src-c1la1-kernel-receipt`: `SOURCE/r30-C1-LA1-kernel-verification.json` (match)
- `src-c1la1-main`: `SOURCE/r30-C1-LA1-Main.lean` (match)
- `src-c1la1-state`: `SOURCE/r30-C1-LA1-FORMALIZATION-STATE.json` (match)
- `src-c6la2-axioms`: `SOURCE/r30-C6-LA2-axioms.txt` (match)
- `src-c6la2-contract`: `SOURCE/r30-C6-LA2-THEOREM-CONTRACT.yaml` (match)
- `src-c6la2-kernel-receipt`: `SOURCE/r30-C6-LA2-kernel-verification.json` (match)
- `src-c6la2-main`: `SOURCE/r30-C6-LA2-Main.lean` (match)
- `src-c6la2-report`: `SOURCE/r30-C6-LA2-VERIFICATION-REPORT.json` (match)
- `src-c6la2-state`: `SOURCE/r30-C6-LA2-FORMALIZATION-STATE.json` (match)
- `src-capsule-manifest`: `SOURCE/C1-LA2-PACKET-MANIFEST.json` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carry-c6la2-0001`: `SOURCE/carried-c6-la2/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `src-carry-c6la2-0002`: `SOURCE/carried-c6-la2/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `src-carry-c6la2-0003`: `SOURCE/carried-c6-la2/0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `src-carry-c6la2-0004`: `SOURCE/carried-c6-la2/0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `src-carry-c6la2-0005`: `SOURCE/carried-c6-la2/0005-definition-C5LA1-support.lean.fragment` (match)
- `src-carry-c6la2-0006`: `SOURCE/carried-c6-la2/0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `src-carry-c6la2-0007`: `SOURCE/carried-c6-la2/0007-definition-C5LA1-H.lean.fragment` (match)
- `src-carry-c6la2-0008`: `SOURCE/carried-c6-la2/0008-definition-C5LA1-R.lean.fragment` (match)
- `src-carry-c6la2-0009`: `SOURCE/carried-c6-la2/0009-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `src-carry-c6la2-0010`: `SOURCE/carried-c6-la2/0010-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `src-carry-c6la2-0011`: `SOURCE/carried-c6-la2/0011-definition-C5LA1-forwardDifferenceDel.lean.fragment` (match)
- `src-carry-c6la2-0012`: `SOURCE/carried-c6-la2/0012-definition-C5LA1-aggregate.lean.fragment` (match)
- `src-carry-c6la2-0013`: `SOURCE/carried-c6-la2/0013-definition-E993Interior-taggedFamily.lean.fragment` (match)
- `src-carry-c6la2-0014`: `SOURCE/carried-c6-la2/0014-definition-E993Transport-indepFamily.lean.fragment` (match)
- `src-carry-c6la2-0015`: `SOURCE/carried-c6-la2/0015-definition-E993Transport-tagWitnesses.lean.fragment` (match)
- `src-carry-c6la2-0016`: `SOURCE/carried-c6-la2/0016-definition-E993Transport-activeWeight.lean.fragment` (match)
- `src-carry-c6la2-0017`: `SOURCE/carried-c6-la2/0017-definition-E993Transport-layerWeight.lean.fragment` (match)
- `src-carry-c6la2-0018`: `SOURCE/carried-c6-la2/0018-definition-E993Transport-favorableLeaves.lean.fragment` (match)
- `src-carry-c6la2-0019`: `SOURCE/carried-c6-la2/0019-definition-E993Transport-transportRel.lean.fragment` (match)
- `src-carry-c6la2-0020`: `SOURCE/carried-c6-la2/0020-definition-E993Transport-IsSaturatingFlow.lean.fragment` (match)
- `src-carry-c6la2-0021`: `SOURCE/carried-c6-la2/0021-definition-E993Transport-WeightedHall.lean.fragment` (match)
- `src-carry-c6la2-0035`: `SOURCE/carried-c6-la2/0035-definition-C5LA1-crossingIndex.lean.fragment` (match)
- `src-carry-c6la2-0123`: `SOURCE/carried-c6-la2/0123-lemma-E993Transport-support_eq_of_isGraphLeaf_of_adj.lean.fragment` (match)
- `src-carry-c6la2-0124`: `SOURCE/carried-c6-la2/0124-lemma-E993Transport-mem_tagWitnesses_iff_of_adj.lean.fragment` (match)
- `src-first-interior-0014`: `SOURCE/first-interior-0014-definition-C5LA1-crossingIndex.lean.fragment` (match)
- `src-fragment-generator`: `DRAFTS/make_fragments.py` (match)
- `src-fragment-plan`: `DRAFTS/new-plan.json` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-path-check`: `SOURCE/PATH-CHECK-C1-LA2.json` (match)
- `src-seed-audit`: `SOURCE/C-U1-F-Audit.lean` (match)
- `src-seed-criticadvance`: `SOURCE/C-U1-T-CriticAdvance.lean` (match)
- `src-semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCE/SOLUTION-CONTRACT.md` (match)
- `src-source-digests`: `SOURCE/sources-SOURCE-DIGESTS.json` (match)
- `src-stage7-protocol`: `SOURCE/C1-STAGE7-PROTOCOL.md` (match)
- `src-synthesis`: `SOURCE/cycle-1-SYNTHESIS.md` (match)
- `src-u-adjudication`: `SOURCE/cycle-1-U-ADJUDICATION.md` (match)
- `src-u1-return`: `SOURCE/cycle-1-U1-RETURN.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
