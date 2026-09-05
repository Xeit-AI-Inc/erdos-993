# Proof Artifacts

The `lean/` directory contains curated Lean projects whose sources and theorem
boundaries have passed the research line's formal verification process.

An included proof may establish an auxiliary or restricted theorem without
solving Erdős #993. Read each package's README and the repository status before
citing it.

Current packages:

- [`gap-bridge`](lean/gap-bridge/README.md): the large-order rank-four tree
  theorem and dependencies.
- [`rooted-residual-profile`](lean/rooted-residual-profile/README.md): two
  auxiliary no-recovery and occurrence-interface theorems.
- [`marked-extension-charge`](lean/marked-extension-charge/README.md): exact
  one-mark, two-mark, and aggregate residual-charge identities.
- Twelve r7 auxiliary/conditional projects: rank-one first-recovery exclusion,
  `D_(1,m)` and `D_(2,m)` exclusions, rooted attachment, endpoint sign,
  finite coupling, contextual attachment, rooted-signature
  countercertificate, two-leaf four-class, containment/stub, boundary
  factorization, and fixed-component selector characterization. See
  [`r7-first-recovery-rank-one`](lean/r7-first-recovery-rank-one/README.md)
  and the [provenance record](../evidence/verification-2026-08-31-r6-r7.md).
- Seven r8 projects covering eight verified auxiliary declarations: extension
  splitting, extension-profile specialization, an exact decoder obstruction,
  abstract SCP convolution closure, two-leaf deletion symmetry, a
  positive-rank boundary, and the two TRS2 declarations. See
  [`r8-extension-set-bridge`](lean/r8-extension-set-bridge/README.md),
  [`r8-extension-profile-specialization`](lean/r8-extension-profile-specialization/README.md),
  [`r8-rbag-decoder-obstruction`](lean/r8-rbag-decoder-obstruction/README.md),
  [`r8-scp-convolution`](lean/r8-scp-convolution/README.md),
  [`r8-two-leaf-deletion`](lean/r8-two-leaf-deletion/README.md),
  [`r8-positive-rank-boundary`](lean/r8-positive-rank-boundary/README.md),
  and [`r8-trs2`](lean/r8-trs2/README.md).

## r9 packages (2026-09-02)

Six standalone packages export the r9 quotient-decoder formalization run's
governed closures, each with kernel and axiom check drivers and sealed-source
digests in its README:

- `r9-fresh-root-sectors` — graph-level treehood and degree classification of
  the fresh-root attachment graph.
- `r9-rooted-star-cross-term` — the center-rooted K_{1,3} linked-cross-term
  certificate with the minor-rank interval identity.
- `r9-quotient-decoder` — representative independence, recursion congruence,
  and decoder/attachment descent (severance caveat in its README binds).
- `r9-e3-double-count` — the repaired double-count module (governed as a
  module, not severable below it).
- `r9-fidelity-narrowed` — the eight-constituent narrowed fidelity
  sub-statement (the full row does NOT close; residues named).
- `r9-m3-narrowed` — the support-marker transport half (residues named;
  the registered hypothesis is sufficient, not necessary).

None of these proves a headline target. Grades are the source run's rubric
grades (`governed`), not `formally_verified`.

## r10 packages (2026-09-03)

Four packages exporting the r10 TRS2 B_T-closure run's governed chain, each
with kernel and axiom check drivers and sealed-source digests in its README:

- `r10-extension-profile-recurrences` — the three-state extension-profile
  recurrences, proved against an independent ground-truth model.
- `r10-nnseq-admission` — a tree's independence sequence as an abstract
  `NNSeq` term, with the TRS2 characterization discharged for it (neither
  side asserted).
- `r10-coefficient-correspondence` — the kernel-level identification
  joining the admission term to the recurrence polynomial.
- `r10-transfer-to-forest` — **the conditional transfer theorem: if every
  component tree's sequence is TRS2, the forest's is.** The universal form
  of the hypothesis is refuted at order 26 (see
  [the erratum](../docs/erratum-2026-09-03-universal-tree-trs2.md)); the
  theorem's correct use is per-forest with the premise verified per
  component. The package closes no headline problem.

Grades are the source run's rubric grades (`governed`), not
`formally_verified`.

## r11 packages (2026-09-03)

Four packages exporting the r11 corridor-transport run's governed chain —
nested snapshots of one growing module, each byte-identical to its gate's
awarded source:

- `r11-corridor-interface` — the corridor ingredient vocabulary over the
  ground-truth model.
- `r11-corridor-interface-extended` — 24 exact identities incl. the
  generalized vertex-deletion identity.
- `r11-bridge-predicate` — the empirically live bridge predicate, made
  statable in the kernel (defined, not proved).
- `r11-ingredient-reductions` — **kernel-checked Iff reductions of the two
  ingredient conjectures to one named missing lemma.** Neither conjecture
  is proved, refuted, or asserted.

Grades are the source run's rubric grades (`governed`), not
`formally_verified`.

## r12 packages (2026-09-05)

Four packages exporting the r12 Δ-comparison run's governed slate, each
with kernel and axiom check drivers; assembly receipts with per-file
digest tables at [`lean/R12-ASSEMBLY-RECEIPTS.md`](lean/R12-ASSEMBLY-RECEIPTS.md):

- `r12-p1-convolution` — **`P1_NNSeq`: Toeplitz2 ∗ unimodal = unimodal** (abstract NNSeq scope; K–G attribution, primary text unconfirmed).
- `r12-reduction-identities` — the corrected combined identity and its witnessed-leaf conditional corollary (hypothesis fails on 26,082 enumerated instances; disclosed on its face).
- `r12-composition` — **(α) ∧ (β) ⟹ THEOREM (A) in full**; the hypotheses are unproved proof targets; BR-FACT-1 root stratum included.
- `r12-deg2-reduction` — (α) at `deg(s)=2` ⟺ `AmbientTargetDeg2` (open); the award is for the reduction.

None of these proves a headline target; `AlphaTarget`/`BetaTarget` are
unproved hypotheses wherever they appear. Grades are the source run's
rubric grades (`governed`), not `formally_verified`.
