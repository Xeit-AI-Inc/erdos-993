# Verification record: r26 release, 2026-09-24

The source experiment is `erdos-993-top-rank-residual-sign-dre-2026-09-23` (r26: validate and formalize the r24
top-rank residual sign). Terminal manifest `4f835552b5b8b417c616a7395f9d623de50fcc89aef290ccea9f867317481765`. Every stage was sealed by a canonical-JSON SHA-256
manifest; the controller's integrity sweep at the close recomputed 36 manifests and 2,581 members with zero
unexpected mismatches (twenty expected drifts: living files by design — agents records sealed after their
stage, the controller toolkit patched between stages, a disclosures record completed before the next seal, the
registry/ledger at registration, the controller notes frozen at the close). Three governed Lean contracts closed
through independent informal proof-integrity audit, canonical formal registration, pinned kernel/axiom
verification, independent statement-fidelity attestation and workflow close. Only the exact contract statements
receive the formal grade.

| Award | Terminal declaration | Registry claim | Main source SHA-256 | Fidelity receipt |
|---|---|---|---|---|
| `C1-LA1` | `R26LA1.topRankResidualSign` | `E993-R26-TOP-RANK-RESIDUAL-SIGN` | `aff08ce72f9a5f1a93c9b8cb34c0f26ceeddc105cc5a94a4a132d5b6f6367dbc` | `052fd81b79302f0d…` |
| `C1-LA2` | `R26LA2.fibreInequalitySharp` | `E993-R26-DELETION-INJECTION-FIBRE-BOUND` | `6e5650ff79eae0da423754bea2b1e1a6dad6782a6e7f774d390c9e8cab488114` | `2fa7bbe5503cd56a…` |
| `C1-LA3` | `R26LA3.leafDegree_two_indepNum_eq_two` | `E993-R26-TREE-STRUCTURAL-CORE` | `28c765ec8846d0fc561e3098bc1b992f856dad7817daa58abab7700ebfb2b054` | `8bdf3c4716022480…` |

All three packages pin Lean `v4.32.2` and Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`. Their only
reported transitive axioms are `propext`, `Classical.choice`, `Quot.sound`. No admitted declaration, native
decision axiom or additional assumption is introduced. Every Main file and project configuration file is
byte-identical to the sealed internal run. Verification reports: C1-LA1 `16d2420bf9f5a77a…`,
C1-LA2 `e55d3e58509b30a8…`, C1-LA3 `891cdb7112f0418e…`.

**What the packages prove.** C1-LA1: the r24 top-rank residual sign `(RC)` — for every finite tree `G` with
`2 ≤ α(G)`, `x(G) + 2 ≤ α(G) − 1` and every leaf in every maximum independent set,
`S(G, α−1) ≤ 0`, composed with the r24 identity `C5LA1.topRankResidualIdentity` (its 31 registrar entries
carried byte-identically; 148 declarations in the package). C1-LA2: for every finite graph and vertex set `U`,
`2·Σ_{A∈I(U)}|A| ≤ |U|·|I(U)|` and `(ℓ − |U|)·|I(U)| ≤ Σ_{A∈I(U)}(ℓ − 2|A|)` — the occupancy bound of
Andriantiana–Razanajatovo Misanantenaina–Wagner (2020) re-proved in-run. C1-LA3: the tree-structural core
(30 declarations; terminal the `P₃` lemma). Nothing about the all-rank aggregate, `E993-BETA-AGG`, transport,
TREE, FOREST or Erdős #993 is asserted.

**Second reads.** Three isolated Opus reads (SR-B3, SR-STRICT, SR-REC) before registration, each
`confirmed_with_repairs` on at least one statement; their reports are mirrored under
`runs/erdos-993-top-rank-residual-sign-dre-2026-09-23/`. Their repairs sharpened the strict form
(`S ≤ −4` at `ℓ = 2`), fixed TD-6's two-disjunct wording in the correction record, and gave the census
reconciliation as exact multisets; none changed a theorem.

**Registry.** The master registry moves from 363 to 370 identities (214 VERIFIED,
89 REFUTED, 26 CONDITIONAL, 41 OPEN); all 363 prior objects preserved
with statuses unchanged; one scope note on `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (status OPEN unchanged).
Registry pin after publication `47697cba1e11d5898000d66c4d3d4502278af59e380ef0e952da3197d13e7fa2`; ledger
`739ed7ceecaa11e356c5c914db1b3550f9144230aaf94ff5588c6a361d083e85`. Statuses are registry grades at their explicit evidence, not a count of theorems;
no claim bears on Erdős #993.
