# C3-LA1-PRODUCER — partial formalization proposal

**Status:** compiled partial source; the exact first-shell theorem is **not proved**. This report and every registration entry are proposals to the controller. No source, registry, award, or managed project was changed.

## Proven and checked

I read the frozen theorem contract, the registered independent informal audit, the integration addendum, and the listed inherited sources needed for the proof. SHA-256 verification matched all **206** files in the worker brief (`SOURCE-HASH-VERIFICATION.json`). The inherited `Base.lean` contains 32 definitions and 150 lemmas. I added 27 genuine named lemmas in `new-fragments/`, assembled them after the inherited prefix in `Candidate.lean`, and compiled that exact assembly through bridge request **`c3p019`**, whose reply reports `ok: true`, **compiler `exit_code: 0`**, and source SHA-256 `f168a3b057d2bdd3bc64698bda29cc0e5a1e0c36cc9a45449b26cce49ebea22a`. Earlier compile attempts and their errors are itemized in `RESULTS.json`; the final assembly has no errors. No new definition or theorem was introduced.

The proved chain covers a substantial part of the audited route:

1. `Erdos993G1.ThirdWide.cover_catalan_bound_three` adapts the inherited cover partition and shifted Catalan floor to a cover of cardinality three. `catalan_gap_three_pos` proves the required positive margin, including ranks 0 and 1; `cover_three_early_pos` propagates it to every `r ≤ p-2` by the inherited binomial-difference monotonicity.
2. `E993FirstShell.indepSetCount_empty_eq` and `empty_forwardDifference_eq_delta` identify the contract's zero-deletion difference with `Erdos993G1.delta`. `crossingIndex_negative` uses `Nat.find_spec`. `no_three_cover_of_early_crossing` then rules out any cover of at most three vertices under the shell order and strict-descent hypotheses. `three_le_of_early_crossing` derives `3 ≤ p` for the aggregate hypotheses.
3. `leaf_retained_cover_transfer` proves that a cover of the graph retained after deleting `{v,s_v}` extends by `s_v` to a cover of the original graph. Hence `no_two_cover_retained` rules out retained covers of size at most two; `retained_has_edge` follows. `leaf_retained_card_firstWide` checks the exact order `2*(p-1)+2` for the later first-wide application.
4. `leaf_term_eq_tagged_delta` proves the exact integer H/R term equals the difference of the two marked-family cardinalities. `leaf_term_nonpos_of_marked_shadow` and `aggregate_nonpos_of_marked_shadows` reduce both requested conclusions to the single marked-shadow bound, while keeping the original leaf filter and separate summands. These are conditional reduction lemmas; they do **not** establish the shadow bound.

The proof uses only `import Mathlib` and the pinned inherited declarations. It contains no `sorry`, `admit`, custom axiom, runtime evaluation, unsafe/meta shortcut, or dummy declaration. `PROPOSED-REGISTRATION.json` lists the 182 inherited entries and then the 27 new lemma fragments in order. All listed fragment hashes were recomputed and match. The existing inherited fragments remain byte-identical; the new fragments have separate hashes.

## Exact unresolved obligation

For the first conjunct, the missing Lean result can be stated as follows (a goal specification, **not** a declaration in `Candidate.lean`):

```lean
lemma leaf_marked_shadow_of_shell {V : Type u} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj] (v : V) (p : ℕ)
    (hT : T.IsTree) (hv : C4LA1.IsGraphLeaf T v)
    (hp : 3 ≤ p) (horder : Fintype.card V = 2*p+2)
    (hcross : C5LA1.crossingIndex T + 2 ≤ p) :
    (E993Interior.taggedFamily T (Finset.univ \ C5LA1.H T v)
      (C5LA1.R T v \ C5LA1.H T v) p).card ≤
    (E993Interior.taggedFamily T (Finset.univ \ C5LA1.H T v)
      (C5LA1.R T v \ C5LA1.H T v) (p-1)).card
```

The audited informal argument requires (i) extracting a nonisolated mark in the retained graph from tree connectivity, (ii) a first-mark partition of the tagged family, (iii) an ordinary independent-set shadow bound for small deletion fibers, and (iv) a bridge from the equality-size fiber to the inherited `Erdos993G1.firstWide_nonpos_of_two_edges`. I did not finish or compile these statements. In particular, `retained_has_edge` alone does not show that a retained edge is incident to a mark. The exact two-conjunct terminal `E993FirstShell.firstShellPointwiseAndAggregate` is absent; no terminal proof or kernel/axiom/fidelity award is claimed. The alpha guard remains in the frozen target and would be preserved on assembly, although the audited pointwise route does not need it.

The last compiler request returned exit 0 because it checked the **partial source only**. It must not be read as verification of the contract theorem. The controller can reuse the checked fragments, finish the missing marked-shadow and terminal steps, then perform independent registration, governed kernel/axiom verification, and fresh fidelity review.
