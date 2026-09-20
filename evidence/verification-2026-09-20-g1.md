# Verification record: G1 three-cycle release, 2026-09-20

The completed source experiment is `erdos-993-g1-large-residual-dre-2026-09-13`. Its final manifest is `b4b7fdbf03f64940398034668099bea5a062192e35366fea730db9c92baece77`. All 5,931 files in the final transitive seal graph were freshly rehashed before publication. Three contracts closed through independent informal audit, canonical formal registration, pinned kernel/axiom verification, fresh independent statement-fidelity audit and workflow close. Only the exact contract statements receive the formal grade.

| Cycle | Terminal declaration | Main source SHA-256 |
|---|---|---|
| C1 | `Erdos993G1.lowRankForestClassificationAndG1` | `32ac508e828f7bccd484acec90b3cb7ea75a0449bd9ee4ff20e8b535566bee85` |
| C2 | `Erdos993G1.firstWideClassificationHistoryAndG1` | `beabf73950968ea22e71fb7b02a946eb849b7cdce3a0541fa80a59f7bc485d89` |
| C3 | `Erdos993G1.thirdWideForestAndG1` | `aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4` |

All packages pin Lean `v4.32.2` and Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`. Their only reported transitive axioms are `propext`, `Classical.choice`, `Quot.sound`. No admitted declaration, native decision axiom or additional assumption is introduced. The Main files and all five project source/configuration files per package are byte-identical to the internal copies.

Fresh public-package validation ran `lake build LeanProof`, the kernel driver, and the axiom driver for each package. All nine commands passed; the exact axiom sets were checked. Packages used the approved shared dependency tree without copying package bytes or downloading dependencies. Each dependency revision was checked against its manifest, and Main hashes remained unchanged. This is release reproduction validation, not a new theorem award.

C3's contract hash is `4bc0bea5fa8e1e22e4c5ae16de395f66c4a8671ccd75483ca611a433827ec5df`; its kernel receipt is `14e70b56dedb0fa2839f79a8d4c8b99a889a65f3021b405a39447ea9c23f0dfa`; its fresh fidelity receipt is `27b880f94c12e837a3e8a5d1f5961490fd8b885c69fd0e04c81a441f5ea20c05`; its workflow report is `3f945529c506812fd523e6dbbe104fd952dc87c300ec010b8195292d22017ec0`. The fidelity audit passed with no failures or warnings, and the workflow used zero governed repair attempts. Development and administrative failures remain preserved in the source run; the full report explains them.

The master merge preserves all 81 prior claim objects and imports 207 additional G1-lineage identities. Canonical lint passes with zero findings and zero warnings against both the complete old master and source-run terminal views. The totals are 143 VERIFIED, 84 REFUTED, 24 CONDITIONAL and 37 OPEN. These are registry statuses at their explicit evidence grades, not 143 formal theorems.

See the [source-hash inventory](../runs/g1-large-residual-dre-2026-09-13/SOURCE-HASHES.json), [public verification record](../runs/g1-large-residual-dre-2026-09-13/PUBLICATION-VERIFICATION.json), [experiment summary](../experiments/g1-large-residual-dre-2026-09-13.md) and [report](../runs/g1-large-residual-dre-2026-09-13/REPORT.md). Original contracts and receipts are under `runs/g1-large-residual-dre-2026-09-13/verification/C1`, `C2` and `C3`. The source records retain their original internal paths and are not a complete portable replay of the private operational lineage.

No result here proves unrestricted ordinary G1, governed G1, the full favorable-leaf aggregate, TREE, FOREST, TRANSFER or Erdős #993. In particular, G1wide residual sign is not the old master-ledger `OB-G1` endpoint statement. The second wide band and the combined necessary-region claim keep their informal and mixed grades.

The sealed Main sources retain their original terminal blank lines and the existing C3 trailing space. The CSV records retain CRLF line endings. Exact-path `.gitattributes` rules preserve those bytes and narrowly accommodate their whitespace in Git checks; source files were not normalized.
