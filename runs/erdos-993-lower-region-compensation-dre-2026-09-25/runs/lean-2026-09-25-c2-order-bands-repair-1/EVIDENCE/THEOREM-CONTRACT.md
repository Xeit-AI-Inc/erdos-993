# Theorem Contract: Marked-isolate and ordinary-leaf order bands

- Contract ID: `e993-c2-order-band-pair-v3`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `open`
- Contract SHA-256: `2ce40be51ec0024f796cbd8bcc190fc0e577b2137cadced4512ed6d65620656b`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite simple graph G with m vertices, every vertex subset W containing all isolated vertices of G, and every natural k>=2 with m<=2k+1, the number of independent (k+1)-sets meeting W is at most the number of independent k-sets meeting W. Also, for every finite ordinary tree T, every original degree-one leaf v with its unique original support s, and every natural p>=3 with |V(T)|<=2p+1, Delta_(p-1)(T-{v,s})-Delta_(p-1)(T-N_T[s])<=0. Counts are zero outside supported natural ranks, and Delta_j(G)=i_(j+1)(G)-i_j(G) is an integer difference. All neighborhoods and leaf identities are those of the original tree.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993OrderBand.markedIsolateAndOrdinaryLeafOrderBand`
- Statement SHA-256: `18d27d657dd127d9c377529d9c626e68f1020e22b336b8e4cf0d378c11a44325`

```lean
theorem markedIsolateAndOrdinaryLeafOrderBand :
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (G : SimpleGraph V) [DecidableRel G.Adj]
      (W : Finset V) (k : ℕ),
      E993OrderBand.IsolateCovered G W →
      2 ≤ k →
      Fintype.card V ≤ 2 * k + 1 →
      E993OrderBand.markedCount G W (k + 1) ≤
        E993OrderBand.markedCount G W k) ∧
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (T : SimpleGraph V) [DecidableRel T.Adj]
      (v : V) (p : ℕ),
      T.IsTree →
      C4LA1.IsGraphLeaf T v →
      3 ≤ p →
      Fintype.card V ≤ 2 * p + 1 →
      C5LA1.forwardDifferenceDel T (C5LA1.H T v) (p - 1) -
        C5LA1.forwardDifferenceDel T (C5LA1.R T v) (p - 1) ≤ 0)
```

## Quantifiers

- `forall G` over `domain-graph`
- `forall T` over `domain-graph`
- `forall W` over `domain-marks`
- `forall k` over `domain-rank`
- `forall p` over `domain-rank`
- `forall v` over `domain-vertex`

## Hypotheses

- `hyp-generic`: Generic conjunct: W contains all graph isolates, 2<=k and Fintype.card V<=2*k+1. No bipartite, tree, alpha, selector or first-descent hypothesis.
- `hyp-leaf`: Ordinary conjunct: T is a tree, v is an original degree-one leaf, 3<=p and Fintype.card V<=2*p+1. No favorability, alpha or first-descent hypothesis.

## Conclusion

- `conclusion`: The conjunction of markedCount G W (k+1)<=markedCount G W k under the generic hypotheses and forwardDifferenceDel T (H T v) (p-1)-forwardDifferenceDel T (R T v) (p-1)<=0 under the ordinary-leaf hypotheses.

## Dependencies

- `def-leaf` -> `def-support`
- `def-support` -> `def-h`
- `def-support` -> `def-r`
- `domain-graph` -> `domain-marks`
- `domain-graph` -> `domain-vertex`
- `domain-graph` -> `hyp-generic`
- `domain-marks` -> `hyp-generic`
- `domain-rank` -> `hyp-generic`
- `def-isolates` -> `hyp-generic`
- `domain-graph` -> `hyp-leaf`
- `domain-vertex` -> `hyp-leaf`
- `domain-rank` -> `hyp-leaf`
- `def-leaf` -> `hyp-leaf`
- `hyp-generic` -> `conclusion`
- `hyp-leaf` -> `conclusion`
- `def-marked` -> `conclusion`
- `def-h` -> `conclusion`
- `def-r` -> `conclusion`
- `def-delta` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `Classical.choice`, `Quot.sound`, `propext`

## Source Evidence

- `source-0`: `SOURCE/FirstInteriorMain.lean` (match)
- `source-1`: `SOURCE/BASE-PIN.json` (match)
- `source-2`: `SOURCE/INTENDED-PROOF.md` (match)
- `source-3`: `SOURCE/PRIOR-AUDIT.md` (match)
- `source-4`: `SOURCE/FORMAL-PLAN.md` (match)
- `source-5`: `SOURCE/DEFINITIONS.lean.fragment` (match)

## Validation Notes

- Errors: none
- Warnings: `formulation_truth_unverified`
