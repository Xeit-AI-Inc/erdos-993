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
