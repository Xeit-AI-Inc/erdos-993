# Public G1 run records

Start with [the report](REPORT.md), [the current obligations](OBLIGATIONS-C3-FINAL.csv), and [the publication reconciliation](FINAL-RECONCILIATION.md). The source experiment completed three cycles and is closed. This public directory is a curated mathematical/verification subset, not the full private operational lineage.

The three proof projects live in `proofs/lean/g1-c1-low-rank`, `g1-c2-first-wide`, and `g1-c3-third-wide`. Original contract and receipt snapshots are under `verification/C1`, `verification/C2`, and `verification/C3`; their absolute paths and source-manifest references identify the immutable internal run. The standalone public projects are reproducible using their pinned configuration.

`CLAIM-IDENTITY.run-local.json`, the terminal ledger, obligations, and run-state snapshots preserve the source run's exact records. The root public `CLAIM-IDENTITY.json` is the merged master: it preserves all 81 existing master objects and adds 207 G1-lineage identities. The distinctions are explained in the reconciliation. Historical references in the source report to old root state files describe the internal archive; the published current snapshot is `RUN-STATE-C3-FINAL.json`.

`SOURCE-HASHES.json` records byte identity or the explicit link-only adaptation for every copied artifact. The original final manifest remains available as `SOURCE-FINAL-MANIFEST.json`; it references further internal evidence that is not mirrored here. Public reproduction checks are summarized in `PUBLICATION-VERIFICATION.json`.
