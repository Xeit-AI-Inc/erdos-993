# Theorem Contract: C1-LA3 - the degree lemma implies the extension inequality, the linear descent-order bound, the rank-5 ceiling 20 and the descent restriction

- Contract ID: `erdos-993-r27-c1-la3-degree-lemma-implies-extension-chain-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `open`
- Contract SHA-256: `28f56fc6e2f346fd4085d125ae0337dfe31020d668bd574bcfaecaee939df09d`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Assume (DL): for every finite forest G on a finite vertex type X (quantified over the Fintype/DecidableEq/DecidableRel instances) and every natural k, the incident degree sum D_k(G) is at most 2k i_k(G). Then (EX) n i_k <= (k+1) i_{k+1} + 3k i_k for every finite forest and every k; (LB) Delta_k(G) < 0 implies n <= 4k for every finite forest and every k; (R5) 21 <= n implies 0 <= Delta_5(G) for every finite forest; and (XR) x(G) < r implies n <= 4r - 4 for every finite forest and every r. Each of the five statements is the corresponding frozen SOLUTION-CONTRACT.md section 2 declaration, taken definitionally. The award is the IMPLICATION: none of (DL), (EX), (LB), (R5), (XR) is asserted.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.degree_lemma_implies_chain`
- Statement SHA-256: `750393942ec05d16f2f40d6a733368f7ff6d0cfbe72eaf5ca00e4c3115527f96`

```lean
theorem degree_lemma_implies_chain :
    DlHyp.{u} → ExHyp.{u} ∧ LbHyp.{u} ∧ R5Hyp.{u} ∧ XrHyp.{u}
```

## Quantifiers

- `forall X` over `domain-carrier`
- `forall G` over `domain-graph`
- `forall k` over `domain-rank`
- `forall r` over `domain-rank`

## Hypotheses

- `hyp-finiteness`: Finiteness of the carrier. It is present in every statement of the chain and is the only structural assumption the unconditional counting steps use.
- `hyp-instances`: `[Fintype X]`, `[DecidableEq X]` and `[DecidableRel G.Adj]` are quantified INSTANCE binders inside `DlHyp`/`ExHyp`, not fixed instances (critic `C-U3-F`'s caveat): a (DL) proved at one fixed `Fintype` instance would not compose with this chain.
- `hyp-acyclic`: `G.IsAcyclic`. It enters the proof EXACTLY ONCE, as the argument handed to the (DL) hypothesis; every counting step used here (double count, `e(J)` bound) is graph-general and carries no acyclicity binder.
- `hyp-degree-lemma`: THE hypothesis of the award: `DlHyp`, i.e. the degree lemma (DL) stated exactly as `SOLUTION-CONTRACT.md` §2 `forest_degree_lemma`, universally in the carrier, the instances, the forest and the rank. It is ASSUMED, never proved here; it is the object of award `C1-LA1`.

## Conclusion

- `conclusion`: `DlHyp → ExHyp ∧ LbHyp ∧ R5Hyp ∧ XrHyp`, at one shared universe parameter: the degree lemma implies the extension inequality, the linear descent-order bound, the rank-5 ceiling 20 and the descent restriction `4r − 4`, each stated exactly as its own frozen §2 declaration. THE IMPLICATION IS THE CLAIM; none of the four consequents is asserted, and all four stay `conditional` until an unconditional (DL) lands (`C1-LA1`). ATTRIBUTION, on every face (`SOLUTION-CONTRACT.md` §3.7): Fang–Lu–Nevo–Yao–Zheng 2026, §8 (Lemma 8.1 with (8.3), and Proposition 8.2's displayed step) for the mathematics of (DL) and (EX); the literature map (FRESH-LEAD, lane 11) for the conditional deductions (LB), (R5) and (XR); r27 seat U3 and critics `C-U1-T`, `C-U3-T`, `C-U3-F` and `C-U1-F` for the derivations carried and used here — carry-list rows 10–16 are critic-attributed and rows 17–19 adjudicator-attributed, never seat work; the U adjudicator for the `firstDescent` reconciliation by `rfl` (carry row 19). No external Lean text is carried or published (Gate ruling 3). FENCES, on every face: (1) NO NO-RECOVERY READING — (LB), (R5) and (XR) are ORDER BOUNDS whose contrapositives have sign `Δ_k ≥ 0`, and no status transfers to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, `E993-BETA-AGG` or Erdős #993; (2) (XR) IS NOT A UNIFORM BOUND ON `d`, and its `r = 0` truncation of `4 * r - 4` is vacuous-hypothesis-sound, not correct arithmetic; (3) the implication is the award and the targets are not; (4) (DL) is an average over `I_k`, so no pointwise degree statement is registrable; (5) nothing asymptotic is asserted; (6) the r25 award `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` stays registered at its own statement, and `4k ≤ (k+1)²` is a comparison, not a supersession.

## Dependencies

- `def-indepcount` -> `def-coeff`
- `def-coeff` -> `def-delta`
- `def-closednbhdfinset` -> `def-extensionfinset`
- `def-extensionfinset` -> `def-extension-count`
- `def-delta` -> `def-firstdescent`
- `def-indepdegreesum` -> `def-dlhyp`
- `def-indepcount` -> `def-dlhyp`
- `def-indepcount` -> `def-exhyp`
- `def-delta` -> `def-lbhyp`
- `def-delta` -> `def-r5hyp`
- `def-firstdescent` -> `def-xrhyp`
- `domain-carrier` -> `domain-graph`
- `domain-carrier` -> `hyp-finiteness`
- `domain-carrier` -> `hyp-instances`
- `domain-graph` -> `hyp-instances`
- `domain-graph` -> `hyp-acyclic`
- `def-dlhyp` -> `hyp-degree-lemma`
- `hyp-acyclic` -> `hyp-degree-lemma`
- `hyp-finiteness` -> `hyp-degree-lemma`
- `hyp-instances` -> `hyp-degree-lemma`
- `domain-rank` -> `hyp-degree-lemma`
- `hyp-degree-lemma` -> `conclusion`
- `def-exhyp` -> `conclusion`
- `def-lbhyp` -> `conclusion`
- `def-r5hyp` -> `conclusion`
- `def-xrhyp` -> `conclusion`

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
- `source-fragment-0005`: `LeanProject/LeanProof/Snippets/0005-definition-Erdos993G1-DlHyp.lean.fragment` (match)
- `source-fragment-0006`: `LeanProject/LeanProof/Snippets/0006-definition-Erdos993G1-ExHyp.lean.fragment` (match)
- `source-fragment-0007`: `LeanProject/LeanProof/Snippets/0007-definition-Erdos993G1-LbHyp.lean.fragment` (match)
- `source-fragment-0008`: `LeanProject/LeanProof/Snippets/0008-definition-Erdos993G1-R5Hyp.lean.fragment` (match)
- `source-fragment-0009`: `LeanProject/LeanProof/Snippets/0009-definition-Erdos993G1-XrHyp.lean.fragment` (match)
- `source-fragment-0010`: `LeanProject/LeanProof/Snippets/0010-lemma-Erdos993G1-indepCount_eq_card_indepSetFinset.lean.fragment` (match)
- `source-fragment-0011`: `LeanProject/LeanProof/Snippets/0011-lemma-Erdos993G1-coeff_nat.lean.fragment` (match)
- `source-fragment-0012`: `LeanProject/LeanProof/Snippets/0012-lemma-Erdos993G1-delta_nat.lean.fragment` (match)
- `source-fragment-0013`: `LeanProject/LeanProof/Snippets/0013-lemma-Erdos993G1-mem_extensionFinset_iff.lean.fragment` (match)
- `source-fragment-0014`: `LeanProject/LeanProof/Snippets/0014-lemma-Erdos993G1-pos_indepCount_of_delta_neg.lean.fragment` (match)
- `source-fragment-0015`: `LeanProject/LeanProof/Snippets/0015-lemma-Erdos993G1-ex_of_dl.lean.fragment` (match)
- `source-fragment-0016`: `LeanProject/LeanProof/Snippets/0016-lemma-Erdos993G1-lb_of_ex.lean.fragment` (match)
- `source-fragment-0017`: `LeanProject/LeanProof/Snippets/0017-lemma-Erdos993G1-r5_of_lb.lean.fragment` (match)
- `source-fragment-0018`: `LeanProject/LeanProof/Snippets/0018-lemma-Erdos993G1-xr_of_lb.lean.fragment` (match)
- `source-fragment-0019`: `LeanProject/LeanProof/Snippets/0019-theorem-Erdos993G1-degree_lemma_implies_chain.lean.fragment` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-r25-award-main`: `SOURCES/r25-c4-forest-descent-order-bound-Main.lean` (match)
- `source-row09-u3-extension`: `SOURCES/row09-U3-Extension.lean` (match)
- `source-row10-critic-u1-t`: `SOURCES/row10-C-U1-T-CriticAdvances.lean` (match)

## Validation Notes

- Errors: none
- Warnings: `formulation_truth_unverified`
