# Theorem Contract: E993-R28-PENDANT-PATH-LEAF-DOMINANCE — pendant-path leaf dominance, graph-general (r28 C1-LA4)

- Contract ID: `erdos-993-degree-lemma-hall-sdr-dre-2026-09-24-c1-la4-pendant-path-leaf-dominance-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `0c3a4027ab11954ee725f6ec1c9e4766ae994aa97bf9a871cd06c70ffbad23c3`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Let G be any finite simple graph (no tree hypothesis) and u_0 - u_1 - ... - u_{m+1} a path of distinct vertices (u : Fin (m+2) -> X injective, consecutive vertices adjacent) whose interior vertices u_1, ..., u_m have degree 2 and whose end l = u_{m+1} is a leaf (degree 1); the degree of u_0 is arbitrary. Then for every k in N and every position i in {0, ..., m+1}, c_{u_i}(k) <= c_l(k), where c_v(k) = occ G v k is the number of independent k-sets of G containing v. Index note: SR-PP writes the path u_0..u_M = l with M >= 1; M = m + 1 (SR-PP's M = 1 is Lean m = 0, the leaf/support case, registered E993-PAIR-R-LE-G-POINTWISE clause (i), cited as corroboration only). Binder choices recorded on the face: relative to the T adjudicator's forall-form, the typeclass binders follow Lean order ({X} [Fintype X] [DecidableEq X] (G) [DecidableRel G.Adj]), the hypotheses are named (hinj, hadj, hdeg2, hleaf), and the final universally quantified binders are ordered (k : N) (i : Fin (m+2)) as in the brief's declaration (the T form reads forall (i) (k)); these are logically equivalent. Fences: not (PW) (no comparison of a branch vertex with an arbitrary leaf); stepwise monotonicity along the path is REFUTED (S(3,1,1), k = 3) and is not claimed; not (HS) (FALSE, T22); no status transfer; (DL) is an input, neither re-proved nor edited. Attribution: C-T1-U (two-step shift), C-T1-F and C-T2-U (induced-subgraph isomorphism; polynomial identity at u_0), C-T2-F, C-F2-T, C-F2-U (exact difference formulas) — six independent derivations, one proof (SR-PP); T1 and F2 for the leaf/support case; Lean text re-derived in-run by c1-la4-formalizer-opus-20260925.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.pendant_path_leaf_dominance`
- Statement SHA-256: `3087849e6ad2918f5afe15994f891231be627e1d5585065abb4c36179127f383`

```lean
theorem pendant_path_leaf_dominance {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (m : ℕ) (u : Fin (m + 2) → X) (hinj : Function.Injective u)
    (hadj : ∀ i : Fin (m + 1), G.Adj (u i.castSucc) (u i.succ))
    (hdeg2 : ∀ i : Fin (m + 2), 0 < i.val → i.val < m + 1 → G.degree (u i) = 2)
    (hleaf : G.degree (u (Fin.last (m + 1))) = 1) (k : ℕ) (i : Fin (m + 2)) :
    occ G (u i) k ≤ occ G (u (Fin.last (m + 1))) k
```

## Quantifiers

- `forall X` over `dom-x`
- `forall G` over `dom-g`
- `forall m` over `dom-m`
- `forall u` over `dom-u`
- `forall k` over `dom-k`
- `forall i` over `dom-i`

## Hypotheses

- `hyp-inj`: (hinj : Function.Injective u) — the path vertices are distinct.
- `hyp-adj`: (hadj : ∀ i : Fin (m + 1), G.Adj (u i.castSucc) (u i.succ)) — consecutive path vertices are adjacent.
- `hyp-deg2`: (hdeg2 : ∀ i : Fin (m + 2), 0 < i.val → i.val < m + 1 → G.degree (u i) = 2) — the interior vertices u 1, ..., u m have degree 2; u 0 is unconstrained.
- `hyp-leaf`: (hleaf : G.degree (u (Fin.last (m + 1))) = 1) — the end u (m + 1) is a leaf.

## Conclusion

- `conclusion`: occ G (u i) k ≤ occ G (u (Fin.last (m + 1))) k — for every k and every position i, the number of independent k-sets containing u i is at most the number containing the leaf u (m + 1). Not (PW); not stepwise monotonicity (REFUTED, S(3,1,1), k = 3); no status transfer.

## Dependencies

- `def-indep-set-finset` -> `def-occ`
- `def-occ` -> `def-slots-at-least`
- `def-degree` -> `def-slots-at-least`
- `def-occ` -> `def-leaves-at-least`
- `def-degree` -> `def-leaves-at-least`
- `def-indep-set-finset` -> `def-indep-degree-sum`
- `def-degree` -> `def-indep-degree-sum`
- `dom-x` -> `dom-g`
- `dom-x` -> `dom-u`
- `dom-m` -> `dom-u`
- `dom-m` -> `dom-i`
- `dom-u` -> `hyp-inj`
- `dom-g` -> `hyp-adj`
- `dom-u` -> `hyp-adj`
- `def-degree` -> `hyp-deg2`
- `dom-g` -> `hyp-deg2`
- `dom-u` -> `hyp-deg2`
- `def-degree` -> `hyp-leaf`
- `dom-g` -> `hyp-leaf`
- `dom-u` -> `hyp-leaf`
- `def-occ` -> `conclusion`
- `dom-k` -> `conclusion`
- `dom-i` -> `conclusion`
- `hyp-inj` -> `conclusion`
- `hyp-adj` -> `conclusion`
- `hyp-deg2` -> `conclusion`
- `hyp-leaf` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-capsule-manifest`: `SOURCES/C1-LA4-PACKET-MANIFEST.json` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carry-digests`: `SOURCES/c1-stage7-SOURCE-DIGESTS.json` (match)
- `src-entry-01`: `LeanProject/LeanProof/Snippets/0001-definition-Erdos993G1-indepCount.lean.fragment` (match)
- `src-entry-02`: `LeanProject/LeanProof/Snippets/0002-definition-Erdos993G1-indepDegreeSum.lean.fragment` (match)
- `src-entry-03`: `LeanProject/LeanProof/Snippets/0003-definition-Erdos993G1-occ.lean.fragment` (match)
- `src-entry-04`: `LeanProject/LeanProof/Snippets/0004-definition-Erdos993G1-slotsAtLeast.lean.fragment` (match)
- `src-entry-05`: `LeanProject/LeanProof/Snippets/0005-definition-Erdos993G1-leavesAtLeast.lean.fragment` (match)
- `src-entry-06`: `LeanProject/LeanProof/Snippets/0006-lemma-Erdos993G1-indepCount_eq_card_indepSetFinset.lean.fragment` (match)
- `src-entry-07`: `LeanProject/LeanProof/Snippets/0007-lemma-Erdos993G1-pendant_path_adj_of_pos.lean.fragment` (match)
- `src-entry-08`: `LeanProject/LeanProof/Snippets/0008-lemma-Erdos993G1-pendant_path_adj_consec.lean.fragment` (match)
- `src-entry-09`: `LeanProject/LeanProof/Snippets/0009-lemma-Erdos993G1-pendant_path_adj_mem_range.lean.fragment` (match)
- `src-entry-10`: `LeanProject/LeanProof/Snippets/0010-lemma-Erdos993G1-exists_pendant_shift_perm.lean.fragment` (match)
- `src-entry-11`: `LeanProject/LeanProof/Snippets/0011-lemma-Erdos993G1-pendant_path_occ_le_of_lt.lean.fragment` (match)
- `src-entry-12`: `LeanProject/LeanProof/Snippets/0012-theorem-Erdos993G1-pendant_path_leaf_dominance.lean.fragment` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-r25-award-main`: `SOURCES/r25-c4-Main.lean` (match)
- `src-r27-award-main`: `SOURCES/r27-c1-la1-Main.lean` (match)
- `src-semantic-contract`: `SOURCES/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCES/SOLUTION-CONTRACT.md` (match)
- `src-sr-pp`: `SOURCES/SR-PP-SECOND-READ.md` (match)
- `src-synthesis`: `SOURCES/SYNTHESIS.md` (match)
- `src-t-adjudication`: `SOURCES/T-ADJUDICATION.md` (match)
- `src-u1-main`: `SOURCES/U1-Main.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
