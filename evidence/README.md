# Public Evidence

This directory contains public, machine-readable status and verification
evidence. It deliberately excludes internal paths, credentials, proprietary
source packets, raw model transcripts, and noncanonical duplicate returns.

- [`obligations.csv`](obligations.csv) records the public open/closed boundary.
- [`verification-2026-08-29.md`](verification-2026-08-29.md) records the fresh
  Lean build, kernel, and axiom checks for the initial publication.
- [`verification-2026-08-29-rooted-residual-profile.md`](verification-2026-08-29-rooted-residual-profile.md)
  records the fresh verification of the added auxiliary package.
- [`verification-2026-08-30-proof-gap-completion.md`](verification-2026-08-30-proof-gap-completion.md)
  records the marked-extension kernel check and order-20/21 replay.
- [`verification-2026-08-31-r6-r7.md`](verification-2026-08-31-r6-r7.md)
  binds the r6/r7 update to terminal source artifacts and the twelve r7
  package sources.
- [`verification-2026-09-01-r8.md`](verification-2026-09-01-r8.md) binds the
  terminal r8 record to its seven public Lean packages and eight auxiliary
  declarations.
- [`order-20-21-search`](order-20-21-search/README.md) contains the exact
  generator, independent checker, and machine-readable bounded result.
- [`source-hashes.sha256`](source-hashes.sha256) binds the published Lean
  packages, computation sources, and toolchain metadata.
