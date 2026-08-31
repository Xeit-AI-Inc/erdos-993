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
