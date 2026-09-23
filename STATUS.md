# Research Status

Last updated: 2026-09-22 (r25 uniform residual no-recovery DRE: six cycles, terminal close; twelve Lean packages; master registry 360 identities)

## Headline Problems

| Target | Status | Resolution needed |
|---|---|---|
| Every finite tree has a weakly unimodal independent-set sequence | Open | Universal proof or one independently verified finite counterexample |
| Every finite forest has a weakly unimodal independent-set sequence | Open | Universal proof or one independently verified disconnected counterexample |
| A noncircular convolution-closed transfer class carries the tree result to forests | Open | A realizability-aware class satisfying all required closure and implication properties |

No formal-independence candidate has been identified.

The consolidated orientation document — the conjecture, the full proof path
with per-step status, the claim/fence/obligation tables, strategy verdicts,
and next-phase priorities — is the
[master proof ledger (2026-09-04)](docs/master-proof-ledger-2026-09-04.md).

## r25 uniform residual no-recovery, 2026-09-22

Six cycles closed with twelve governed Lean packages (see [the experiment](experiments/r25-uniform-residual-no-recovery.md) and [verification](evidence/verification-2026-09-22-r25.md)). The `d = 5` diagnostic band is closed informally for every `r` on three formal inputs; the cover diagonal is refuted at every `d ≥ 6`; Corollary F is sharp at `d ≤ 11`; the matching branch is formal at rank `r = d` and informal at `r ≥ K(d)`, with the band between them bounded computation to `d ≤ 400`. Tier 1, Tier 2 and every Tier 3 schema remain open. The master now contains 360 identities (205 VERIFIED, 88 REFUTED, 26 CONDITIONAL, 41 OPEN); all 288 prior objects preserved, one moved OPEN → VERIFIED at `proved_informal` on Ashton's ruling (the `d = 5` band closure); statuses are registry grades, not a theorem count.

## G1 residual-sign progress, 2026-09-20

Three completed formal contracts establish the ordinary `p<=5` case, the first wide band `|U|=2p-2`, and the third wide band `|U|=2p`. C3 proves the underlying order-`2r+4` forest crossing theorem at every natural rank `r>=1`. This is the residual G1wide argument, not the older `OB-G1` strict-endpoint obligation. The second band remains informal; the combined remaining-region exclusion has mixed grades.

Unrestricted ordinary G1, its governed-RTree counterpart, and every headline target remain open. The master now contains 288 identities (143 VERIFIED, 84 REFUTED, 24 CONDITIONAL, 37 OPEN), preserving all 81 prior master objects. Six newly registered formal consequence identities come from this three-contract lineage; the number is not the entire program's formal asset count. See [the experiment](experiments/g1-large-residual-dre-2026-09-13.md), [verification](evidence/verification-2026-09-20-g1.md), and [assessment](docs/assessment-2026-09-20.md).

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

## Decisive Event (2026-09-06): the (β) condition is refuted

The program's (β) target — for every leaf `v` with support `s` and rank
`p` with `k_A ≥ 2` and `a_v(p) < 0`, the condition `b_v(p) ≤
Bgen_s(p−1)` — is **refuted at universal scope** by an exact order-243
counterexample (a star-60 tree at `p = 90`, `K_A = 3`), found by the r17
run, neutrally adjudicated at exact reproducible-counterexample scope,
and independently verified end-to-end by the r18 controller. The
chartered composition (α) ∧ (β) ⟹ (A) can therefore no longer deliver
the headline theorem; the [master proof
ledger](docs/master-proof-ledger-2026-09-04.md) records the re-drawn
path. The headline targets themselves (tree/forest unimodality) are
untouched — the witness's independence sequence is not at issue, only
the (β) proof strategy. The witness is now KERNEL-VERIFIED against its frozen Lean
contract and awarded `governed` under the full gate ladder (independent
hostile fidelity review PASS-WITH-NOTES; the D9 model-to-ordinary-trees
bridge remains open and its caveat rides on ordinary-tree phrasings) —
see [the package](proofs/lean/r17-order243-beta-counterexample/README.md). See
[r17](experiments/r17-beta-remainder.md).

## Current Lanes

- **Aggregated (β′)** (r23 closed after one full cycle on a decisive
  literal-Hall refutation; aggregate claim remains open): on the very
  order-243 witness that
  refuted (β), the leaf-aggregated form survives by three orders of
  magnitude — the pointwise violation drowns in sibling slack. The
  candidate `E993-BETA-AGG` (favorable-leaf aggregate nonpositive) is
  still OPEN after r19 and the r21/r22 continuation; its
  per-support-fibre variant is refuted by an exact order-91 witness. The run
  lineage has formally verified 25 r19 auxiliaries, nine r21/r22 workflow
  artifacts, and one r23 closed arithmetic certificate. r23 reconstructed the
  literal ordinary-tree relation and found an exact T22 cut with Hall deficit
  `14226520737620288370`; the same row's complete aggregate is negative. The
  sharpest surviving route is therefore direct full demand or aggregate
  cancellation, not universal all-cut Hall. The same-byte governed-RTree
  bridge remains independently open. No headline target moved. See
  [r19](experiments/r19-beta-aggregate.md) and
  [r22](experiments/r22-o14-multibase-hall-continuation.md), and
  [r23](experiments/r23-delete-retag-actual-tree.md).
- **Direct favorable-leaf aggregate (r24, closed 2026-09-18 at the six-cycle
  ceiling):** the literal aggregate `S(T,p) ≤ 0` on `x(T)+2 ≤ p < α(T)`
  remains OPEN with no positive complete eligible row anywhere (orders ≤ 16
  exhaustive; the top-rank residual class to order 17; every designed family).
  Verified: the top-rank selector collapse and the top-rank residual identity
  `(RI)` (two Lean packages, published `verified`). `(RC)`, the top-rank case,
  is proved on the flat residual subclass and on the whole `T_m` family
  (`S(T_m,α−1) = −9m²−6m+1`), otherwise exactly as open as before; the
  non-strict per-support sign is proved on the `K₂`/exceptional-`P₃`
  PSC-terminal strata (critic-attributed). Transport untouched. See
  [r24](experiments/r24-direct-favorable-leaf-aggregate.md) and the
  35-item terminal debt register.
- **Unimodality certificates** (closed, one day): the fixed-window
  certificate strategy is dead **by proof** — any sound scheme's window
  grows at least like |α − 2·mode|, linear on paths. The surviving
  graded conjecture (slope ≤ 1/5) holds exhaustively through order 22
  but saturates there; the run's residue seeds the mode-synchronization
  pair-invariant program. See
  [the summary](experiments/unimodal-certificates-2026-09-07.md).

## Verified Progress

- The r23 actual-tree experiment completed one full 30-route/60-critic cycle
  and stopped correctly on a decisive exact-scope refutation. It established
  the tagged coefficient/cardinality identity and Hall-to-aggregate implication
  at independently criticized informal-proof tier. The literal ordinary-tree
  relation fails Hall on eligible `T_22,p=34`, while the complete aggregate is
  negative. Lean formally verifies only the closed arithmetic comparison of
  the two cut-size formulas. The governed-RTree Hall claim and complete
  aggregate remain open. See [r23](experiments/r23-delete-retag-actual-tree.md)
  and its [verification record](evidence/verification-2026-09-13-r23.md).

- The combined r21/r22 O14 lineage completed all nine semantic cycles under
  the 21-route/42-critic topology. It formally verified nine Stage 7 artifacts
  at exact auxiliary scope. The new structure includes exact multibase
  collision decomposition, deletion monotonicity at fixed data, pair-collision
  capacity, a strengthened minimal-deficient-core theorem, a universal
  tree-incidence obstruction family, and four-fibre Möbius-weight uniqueness.
  The last two results exclude tree-shape-only contradiction and unaugmented
  termwise-nonnegative payment routes. They are not governed Delete/Retag
  counterexamples and do not prove Hall or aggregated beta. The serial gap is
  an authenticated source-complete governed binding of the target relation.
  See [r21](experiments/r21-o14-multibase-hall.md),
  [r22](experiments/r22-o14-multibase-hall-continuation.md), and the
  [receipt index](evidence/verification-2026-09-12-r21-r22.md).

- The completed r19 run executed all nine authorized cycles. It found no
  positive complete aggregate in the authorized exact batteries and no
  universal proof. Its strongest advance is an exact fixed Delete/Retag Hall
  reduction whose remaining core is a uniform arbitrary multi-base
  compensation inequality or a governed deficient cut with complete same-row
  aggregate data. Cycles 1–8 formally verified 25 narrow auxiliary Lean
  declarations; Cycle 9 correctly made no award. Three universal mechanisms
  are now fenced: literal-leaf-preserving strict-prune totality, support-locked
  literal-label corridor advance, and exact support-preserving unit transport.
  These are mechanism refutations, not counterexamples to aggregated β′ or
  Erdős #993. See [the receipt index](evidence/verification-2026-09-09-r19.md).

- The completed r18 run (five cycles, honest stop by pre-committed
  stop-test) left `HG2` — the surviving obligation on
  `G2 ∧ |U| ≥ 2p−2` — open and unmoved, and banked: the `HG2Faithful`
  transcription at RG (definitional by `rfl`, kernel-checked
  interchangeability; `proofs/lean/r18-hg2-faithful`), the Exchange
  Lemma (tree-level verified; abstract counting form at RG with scope
  caveats; `proofs/lean/r18-exchange-lemma-seq`), the proved Catalan
  base `D(p,0) = Cat(p−1)` of the deepening obstruction, the exact
  non-universality of the (★L)-sufficiency mechanism (firing criterion
  `2H ≥ (p+2)·D + 2`), the `H/D` landscape to order 17,603, and the
  vocabulary-insufficiency theorems. See
  [r18](experiments/r18-hg2.md).

- The completed r16 run delivered the **identification constructor** at
  general scope (not a shim, under a written criterion) and its
  integration: the r14 `G1wide` conclusion now rests on premise set
  exactly {Premise K, K-SCOPE}. The completed r15 run normalized (β) to a
  guarded coefficient-descent theorem, closed support-degree 1 by equality
  and degree 2 through `p ≤ 6`, and proved `i_4 > i_3` (order ≥ 12)
  informally. The order-22 census extends the authenticated frontier to
  orders 14–22 with byte-identical replay and zero decisive events — all
  literal witnesses now have order ≥ 23. See
  [r16](experiments/r16-identification-constructor.md),
  [r15](experiments/r15-beta-condition.md), and
  [the census record](evidence/order22-census-2026-09-06.md).

- The completed r14 run did not prove its target (`AmbientTargetDeg2`) and
  exported three governed packages that narrow it strictly: **the band
  theorem** `2 ≤ p ∧ |U| ≤ 2p−3 ⟹ D ≤ 0` (premise-free, seven
  elaborations across four parties), the adopted `G2wide` surface pinning
  the open obligation to exactly `G2 ∧ |U| ≥ 2p−2`, the completed
  reduction/perimeter chain, and the forest-corollary dichotomy with
  premise-labelled floors 26/27/52. See
  [the experiment summary](experiments/r14-ambient-target.md).

- The completed r13 strict-endpoint run (six cycles, hard ceiling stop)
  proved neither endpoint sign and exports no Lean packages; its
  contribution is a refinement of record: the p-side obstruction fails
  first at substantive history-definedness, the q-side at
  proof-independent selected-occurrence identity, each with retained exact
  support lemmas and one new mechanism-scope refutation. It also
  established that no qualifying order-30/31/32 verification receipts
  exist in the program's corpus. See
  [the experiment summary](experiments/r13-g1-g2-strict-endpoint.md).

- The completed r12 Δ-comparison run exported four governed packages: the
  `P1_NNSeq` convolution lemma (Toeplitz2 ∗ unimodal = unimodal, stronger
  than its classical attribution requires); the corrected reduction
  identities; the composition slate — **if the two named inequality
  targets (α), (β) hold then THEOREM (A) holds in full** (the targets are
  unproved hypotheses); and the reduction of (α) at `deg(s)=2` to the
  single open statement `AmbientTargetDeg2`. Zero counterexamples to the
  targets across all trees through order 21, adversarial families, and the
  Kadrawi–Levit fixtures — bounded evidence, never universal. See
  [the experiment summary](experiments/r12-delta-comparison.md) and
  [the master ledger](docs/master-proof-ledger-2026-09-04.md).

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
- a generic finite-relation Hall identity, minimal-deficiency theorem, or
  incidence obstruction without a source-complete binding to the actual
  governed Delete/Retag construction.
- a signed exact subset representation whose negative coefficients have not
  been controlled by correction terms or global cancellation.

The public status must be updated before any claim is described as current.
