# Theorem Contract: First-shell original-leaf pointwise sign and favorable aggregate

- Contract ID: `e993-c3-first-shell-pair-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `open`
- Contract SHA-256: `1cf37db1ec45656b89d7b0fece737ec60cfc3f5f081707ae2d6c2c4d8fc8e122`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite ordinary tree T and natural p>=3 with |V(T)|=2p+2 and x(T)+2<=p, every original degree-one leaf v with unique original support s has Delta_(p-1)(T-{v,s})-Delta_(p-1)(T-N_T[s])<=0. Also, for every finite ordinary tree T and natural p with |V(T)|=2p+2, x(T)+2<=p and 3p<2alpha(T)+1, the complete sum of that same term over the original degree-one leaves v satisfying Delta_p(T-v)<0 is nonpositive. Here x is the first STRICT descent of the zero-extended independence counts, Delta_j=i_(j+1)-i_j is an integer difference, all supports and neighborhoods belong to the original tree, and distinct leaves remain separate summands even with common support. The first conjunct has no alpha or favorability hypothesis.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993FirstShell.firstShellPointwiseAndAggregate`
- Statement SHA-256: `4546fe679579b0f8cafc43d01be9c42a35cafd162ebf4a84ab55773aa7a10286`

```lean
theorem firstShellPointwiseAndAggregate :
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (T : SimpleGraph V) [DecidableRel T.Adj]
      (v : V) (p : ℕ),
      T.IsTree → C4LA1.IsGraphLeaf T v → 3 ≤ p →
      Fintype.card V = 2 * p + 2 →
      C5LA1.crossingIndex T + 2 ≤ p →
      C5LA1.forwardDifferenceDel T (C5LA1.H T v) (p - 1) -
        C5LA1.forwardDifferenceDel T (C5LA1.R T v) (p - 1) ≤ 0) ∧
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (T : SimpleGraph V) [DecidableRel T.Adj] (p : ℕ),
      T.IsTree → Fintype.card V = 2 * p + 2 →
      C5LA1.crossingIndex T + 2 ≤ p →
      3 * p < 2 * T.indepNum + 1 → C5LA1.aggregate T p ≤ 0)
```

## Quantifiers

- `forall T` over `domain-graph`
- `forall v` over `domain-vertex`
- `forall p` over `domain-rank`

## Hypotheses

- `hyp-pointwise`: First conjunct: T.IsTree, original leaf v, p>=3, |V|=2p+2, crossingIndex T+2<=p. No alpha or favorable-selector assumption.
- `hyp-aggregate`: Second conjunct: T.IsTree, |V|=2p+2, crossingIndex T+2<=p and STRICT 3p<2*indepNum(T)+1. No extra selected-leaf premise.

## Conclusion

- `conclusion`: Conjunction of the original-leaf integer H/R term being nonpositive under hyp-pointwise and the exact fixed-selector aggregate being nonpositive under hyp-aggregate.

## Dependencies

- `def-leaf` -> `def-support`
- `def-support` -> `def-h`
- `def-support` -> `def-r`
- `def-delta` -> `def-crossing`
- `def-leaf` -> `def-aggregate`
- `def-selector` -> `def-aggregate`
- `def-h` -> `def-aggregate`
- `def-r` -> `def-aggregate`
- `def-delta` -> `def-aggregate`
- `domain-graph` -> `domain-vertex`
- `domain-graph` -> `hyp-pointwise`
- `domain-rank` -> `hyp-pointwise`
- `domain-vertex` -> `hyp-pointwise`
- `def-leaf` -> `hyp-pointwise`
- `def-crossing` -> `hyp-pointwise`
- `domain-graph` -> `hyp-aggregate`
- `domain-rank` -> `hyp-aggregate`
- `def-crossing` -> `hyp-aggregate`
- `def-alpha` -> `hyp-aggregate`
- `hyp-pointwise` -> `conclusion`
- `hyp-aggregate` -> `conclusion`
- `def-h` -> `conclusion`
- `def-r` -> `conclusion`
- `def-delta` -> `conclusion`
- `def-aggregate` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `Classical.choice`, `Quot.sound`, `propext`

## Source Evidence

- `source-0`: `SOURCE/FORMAL-INTAKE.md` (match)
- `source-1`: `SOURCE/FirstInteriorMain.lean` (match)
- `source-2`: `SOURCE/G1FirstWideMain.lean` (match)
- `source-3`: `SOURCE/INTENDED-PROOF.md` (match)
- `source-4`: `SOURCE/OrderBandMain.lean` (match)
- `source-5`: `SOURCE/R25Card5Main.lean` (match)
- `source-6`: `SOURCE/REGISTRATION-ORDER.md` (match)

## Validation Notes

- Errors: none
- Warnings: `formulation_truth_unverified`
