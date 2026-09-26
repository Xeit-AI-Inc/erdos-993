# Frozen forest census through order 24

**Result (bounded exhaustive computation).** Across all 146,271,594 unlabeled forest classes of orders 0–24, including the empty graph, the maximum order with \(\Delta_6=i_7-i_6<0\) is **\(M(6)=22\)**. There are **zero** failures of \(x(G+K_1)\le x(G)+1\) among the **2,176,760** classes with first strict descent \(x(G)\le6\). The formal r27 implication \(\Delta_k<0\Rightarrow n\le4k\) makes the order-24 scan complete for these two targets. This is computational evidence under the stated finite bound; no new formal theorem or award is claimed by the scan.

The admitted source and protocol hashes are in `../control/CENSUS-ADMISSION-SEAL.json`. The order-20 baseline ran first under the same bytes. The reports are `baseline20.json` and `production24.json`; the canonical production report SHA-256 is `d3d7d05542c61bdfc0ac45fc9fbea4296a80a91f76c839e2bfc30f315718d17e`. Timing and source hashes are separate in the `.execution.json` receipts. The full per-order rooted, free-tree, forest, strict-descent, negative-difference, and direct-closure tables are in `production24.json`.

| \(k\) | \(M(k)\) | Extremal witness |
|---:|---:|---|
| 0 | 0 | Empty graph |
| 1 | 4 | `P4` |
| 2 | 8 | `P8` |
| 3 | 11 | `P11` |
| 4 | 15 | `P15` |
| 5 | 18 | `P18` |
| 6 | **22** | **`P22`** |

For the extremal `P22`, the replayable report code is `B:((((((((((()))))))))))|((((((((((()))))))))))`. Its coefficients through degree eight are `[1,22,210,1140,3876,8568,12376,11440,6435]`; hence \(\Delta_6=-936\), \(x(P_{22})=6\), and the direct \(K_1\) computation gives \(x(P_{22}+K_1)=7\). There are 4,764 order-22 classes with negative \(\Delta_6\), and none at orders 23–24. Witness polynomials were reconstructed as actual centroid-coded forests and recomputed by a separate vertex-deletion recurrence.

| Order | Free-tree classes | Forest classes | Classes with \(\Delta_6<0\) |
|---:|---:|---:|---:|
| 21 | 2,144,505 | 5,086,638 | 392,675 |
| 22 | 5,623,756 | 13,184,156 | 4,764 |
| 23 | 14,828,074 | 34,402,932 | 0 |
| 24 | 39,299,897 | 90,328,674 | 0 |

The direct closure transitions, weighted by distinct forest classes, are:

| \(x(G)\) | \(x(G+K_1)=x(G)\) | \(x(G+K_1)=x(G)+1\) | Failures |
|---:|---:|---:|---:|
| 0 | 0 | 1 | 0 |
| 1 | 2 | 5 | 0 |
| 2 | 14 | 34 | 0 |
| 3 | 119 | 378 | 0 |
| 4 | 1,356 | 5,098 | 0 |
| 5 | 21,049 | 86,394 | 0 |
| 6 | 379,677 | 1,682,633 | 0 |

The scan explicitly finds the least **strict** descent, skipping equal adjacent coefficients. It computes the first strict descent after adding an isolate from \(\Delta_j(G+K_1)=i_{j+1}(G)-i_{j-1}(G)\) through \(j=7\). A missing descent through seven would count as a failure. The empty forest and all isolate multiplicities are included.

Validation passed: the baseline order-20 rows are identical to production rows for orders 0–20 despite the different small-component cutoffs; the independent Prüfer-code and vertex-subset comparator matches every stratum through order 7 (80 forest classes); the fixed-point/plateau/synthetic-failure/\(K_1\)/path fixtures pass; all admitted source bytes still match their seal; rooted/tree/forest count controls and a separate Euler-transform forest-count check pass. A fresh process reran only order 12 and reproduced its canonical report byte-for-byte (SHA-256 `0595597adc73bf21439447190c3a10f114c470e56e90dcabe3a4db3a19f2a17a`); this is a serialization check, not a second full census. The baseline used 6.759 seconds; the order-24 production used 242.135 seconds, each as one foreground Python process. The machine-readable check receipt is `PHASE-B-VALIDATION.json`.
