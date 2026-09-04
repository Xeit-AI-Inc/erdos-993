# Research Status

Last updated: 2026-09-03 (universal-tree-TRS2 erratum)

## Headline Problems

| Target | Status | Resolution needed |
|---|---|---|
| Every finite tree has a weakly unimodal independent-set sequence | Open | Universal proof or one independently verified finite counterexample |
| Every finite forest has a weakly unimodal independent-set sequence | Open | Universal proof or one independently verified disconnected counterexample |
| A noncircular convolution-closed transfer class carries the tree result to forests | Open | A realizability-aware class satisfying all required closure and implication properties |

No formal-independence candidate has been identified.

## Erratum of Record (2026-09-03)

Earlier versions of this file and of several companion documents called
universal tree TRS2 an open question and recommended a structural proof of
it. That status was wrong: tree TRS2 is exactly log-concavity of the raw
independence sequence (by this repository's own kernel-checked equivalence
theorem), and universal tree log-concavity is refuted at order 26 by
Kadrawi–Levit — reference 4 of this repository's bibliography. The witnesses
are unimodal, so no headline status changes. See the
[erratum](docs/erratum-2026-09-03-universal-tree-trs2.md) and the replayable
[witness evidence](evidence/kl-order26-trs2-witness/README.md).

## Verified Progress

- The decreasing terminal band for finite forests is formalized in the included
  Lean dependency chain.
- A non-unimodal independence vector can be localized to a plateau-safe
  internal bottom with a positive residual witness in the larger governed
  corpus.
- For every finite nonempty simple tree of order at least 27,
  `i_4(T)^2 > i_3(T) i_5(T)` is Lean-verified and included here.
- The minimum-order first-recovery capacity gap has been reduced exactly to
  the neighborhood-shadow inequality `a|X| <= b|N(X)|` at the selected
  threshold. That inequality remains open.
- Two auxiliary interface theorems are Lean-verified and included here; neither
  is a tree or forest theorem.
- The marked-extension one-mark, unordered two-mark, and aggregate charge
  identities are Lean-verified for the explicitly defined residual `R_spec`.
- Code's completed r6 corpus is governed at computation grade under its own
  rubric and is explicitly not `formally_verified`; it supplies no public
  headline theorem or Lean package in this release.
- The completed r7 joint-shadow-incidence run has twelve exact
  kernel-checked, axiom-checked, fidelity-reviewed auxiliary or conditional
  candidates. Its public packages preserve their narrow scopes; none is a
  TREE, FOREST, TRANSFER, counterexample, or Erdős #993 theorem.
- r7 verifies no plateau-safe first recovery beginning at rank one; excludes
  first recovery in the proper labelled families `D_(1,m)` and `D_(2,m)`;
  and preserves exact rooted-attachment, two-leaf, containment, boundary, and
  fixed-component identities. Its endpoint, coupling, and context results
  retain their stated antecedents.
- The completed r8 extension-profile and same-leaf experiment has eight
  kernel-checked, axiom-checked, fidelity-reviewed auxiliary declarations in
  seven public Lean packages. They establish exact bridges, state
  obstructions, symmetry, legality, and abstract sequence results only; none
  proves a headline target or a tree-membership premise for an abstract class.
- An independently audited informal theorem confines any
  `Delta_4<0<Delta_5` tree of order at least 12 to orders 13 through 32.
- No descent-recovery witness was found among all 522,959 nonisomorphic trees
  through order 19.
- Complete, independently checked certificates find no recovery among all
  823,065 trees of order 20 or all 2,144,505 trees of order 21.
- No non-unimodal witness was found among all 310,782 disconnected forest
  isomorphism types through order 18.
- The 2026-09-02 order-20 census scanned all 823,065 order-20 trees (and the
  full ladder of 1,343,736 classes at orders 14 through 20) under a frozen,
  published byte protocol with dual enumeration, dual coefficient
  derivation, and a byte-identical fresh-process replay: zero
  first-recovery, B4, leaf-profile Split/Cross/Obstruction, and
  negative-total-adjacent-minor hits. Orders 14 through 17 reproduce the
  prior sealed census streams byte-exactly, making orders 14 through 20 one
  authenticated contiguous exclusion frontier. Any literal first-recovery
  counterexample has order at least 21, at bounded computational tier.
- No tree through order 20 has a non-log-concave independence sequence
  (zero negative total adjacent minors), superseding the earlier
  single-implementation scan through order 18 at a stronger evidence tier.
  This bounded zero is fully consistent with the known refutation: the first
  non-log-concave trees have order 26 (Kadrawi–Levit; see the
  [erratum](docs/erratum-2026-09-03-universal-tree-trs2.md)), so the census
  horizon ended six vertices below the first witness. Universal tree TRS2 is
  refuted, not open, and is retired as a search target.
- The completed r9 PAIR-G4/endpoint-strictness experiment (16 cycles,
  authority stop) verified a governed closest-corridor theorem: under
  endpoint guards, support-fibre constancy, and zero diagonal mass, a
  minimum counterexample carries a distinct closest p-/q-favorable support
  pair on a unique positive-length path with endpoint sign restrictions and
  internal nonfavorability. Nineteen governed auxiliary declarations were
  added; eight unguarded inference mechanisms are excluded at exact scope
  with certificates. The endpoint and diagonal obligations remain open.
- The completed r11 corridor-transport run exported four governed Lean
  packages (nested snapshots of one module): the corridor ingredient
  vocabulary, the generalized vertex-deletion identity layer, the bridge
  predicate (defined, not proved), and kernel-checked Iff reductions of
  two exact ingredient conjectures — a favorable support above the
  crossing boundary forces a negative whole-vertex deletion effect, and
  leaf deletion drops the crossing index by at most one — to a single
  named missing lemma each; the two residuals are the same missing tool
  (a tree-vs-derived-forest Delta-sequence comparison at
  crossing-index-positioned ranks). Neither conjecture is proved or
  refuted; exhaustive search through order 18 found no counterexample and
  that bounded zero is cited as nothing. The prior program's transport
  lemma carries an adjudicated disjunct-level negative: two of its three
  defining phrases were never operationalized in the sealed corpus, and
  the third is cut against by exhaustive measurement (leaf crossing
  indices never spread by 2 or more through order 20). None of this is a
  headline theorem and none is `formally_verified`.
- The completed r10 TRS2 run exported four governed Lean packages forming
  one kernel-checked chain: the extension-profile recurrences (proved
  against an independent ground-truth model), the admission of a tree's
  independence sequence as an abstract nonnegative sequence term, the
  coefficient correspondence joining the two, and a CONDITIONAL
  transfer-to-forest theorem — if every component tree's sequence is TRS2
  then the forest's is — via the r8 convolution closure. The theorem asserts
  the implication, never its antecedent — and the antecedent's universal
  form is REFUTED at order 26 (see the
  [erratum](docs/erratum-2026-09-03-universal-tree-trs2.md)): the theorem's
  correct use is per-forest with the premise verified per component, which
  yields the bounded corollary that every forest whose components all have
  at most 25 vertices is unimodal.
  The run also closed its own search program by measurement: closure
  candidates weaker than TRS2 are unfalsifiable through order 20, every
  measured stronger candidate failed on 34-98% of trees, and the
  linked-cross-term counterexample trail carries a strictly positive
  compensation margin on all firing instances at orders <= 17. None of
  this is a headline theorem and none is `formally_verified`.
- The completed r9 quotient-decoder formalization run gated the dependent
  quotient decoder core, a narrowed encoder-decoder fidelity sub-statement,
  and a narrowed marker-transport half at `governed` under its rubric
  (Lean 4.32.2 kernel, pinned Mathlib, independent fidelity review), with
  the marker recurrence and representation-sufficiency questions closed at
  `proved_informal` with named residues. Two frozen contract rows were
  kernel-refuted and repaired inside the run. None of this is
  `formally_verified` and none is a headline theorem.

## Claim Boundary

The following do not count as a solution:

- finite searches with no counterexample;
- auxiliary identities or inequalities;
- a theorem restricted to one coefficient rank;
- log-concavity or unimodality of a proper family;
- generic sequence-convolution arguments that ignore graph realizability;
- an LLM-generated proof without independent mathematical and formal review.
- a conditional formal theorem whose load-bearing inequality is a hypothesis.
- an exact aggregate charge identity without a bridge to the run residual or
  a theorem controlling the sign of its local charges.
- a computation-grade corpus that its governing rubric classifies as not
  `formally_verified`.
- an abstract convolution theorem without a realizability-aware proof that
  tree independence sequences satisfy its hypotheses.

The public status must be updated before any claim is described as current.
