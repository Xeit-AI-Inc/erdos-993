# Verification record: r25 ADDENDUM release, 2026-09-23

The source experiment is `erdos-993-uniform-residual-no-recovery-addendum-dre-2026-09-22`, the addendum to
the terminal r25 run (a sibling root; the r25 root stays sealed). Terminal manifest `94b9845701b9963c3052478bd387f97d1422a03377e7332510a3baa8dac44271`. Every stage was
sealed by a canonical-JSON SHA-256 manifest; the controller's integrity sweep at the close recomputed
24 manifests and 770 members with zero unexpected mismatches (five expected drifts: the living registry, ledger and
run-state files snapshotted at each seal, and two dispatch records edited after their seals — erratum A1-E-d,
status strings only). Two governed Lean contracts closed through independent informal proof-integrity audit,
canonical formal registration, pinned kernel/axiom verification, independent statement-fidelity attestation and
workflow close. Only the exact contract statements receive the formal grade, and each proves the stated HALF of
its registry statement.

| Lane / cycle | Award | Terminal declaration | Main source SHA-256 | Fidelity receipt |
|---|---|---|---|---|
| lane B | `B-LA1` | `ErdosR25AddBdTail.bdTailNegative_award` | `2791103a374f6737787d405903aaf3ea241e114864367668c1908f3883627da9` | `60ff0ed31814a39b…` |
| Cycle A1 | `A1-LA1` | `Erdos993G1.ForestDelta3.forest_delta_three_pos_ge_twelve` | `00891d6a0e33039f26555609b5a4ab25a6e95186e9851c1804caf7fdd05ef110` | `1cc77cb246a471a4…` |

Both packages pin Lean `v4.32.2` and Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`. Their only reported
transitive axioms are `propext`, `Classical.choice`, `Quot.sound`. No admitted declaration, native decision
axiom or additional assumption is introduced. Every Main file and project configuration file is byte-identical
to the sealed internal run. Verification reports: B-LA1 `837dff729058741b…`, A1-LA1 `edaaf42bb79b822c…`.

**What the packages prove.** B-LA1: `∀ r ≥ 6, Bd(r,r) < 0` on the ranged integer-rank object of record (the
`d = 5` band's arithmetic tail; fixed points `Bd(4,4) = 48`, `Bd(5,5) = 33`, `Bd(6,6) = −16`, `Bd(10,10) = −14406`
proved inside the project); the sharpness half (`Bd(r,r) ≥ 0` exactly at `r ∈ {2,3,4,5}`) is not asserted.
A1-LA1: `Δ₃(F) > 0` for every forest of order ≥ 12, in the frozen G1 definitions, with no enumeration over
graphs, trees, forests or isomorphism classes at any order and no `native_decide`; the sharpness half (order 11)
is not asserted.

**Second reads.** Six isolated Opus reads (four from lane C, two from Cycle A1), all `confirmed_with_repairs`;
their reports are mirrored under `runs/erdos-993-uniform-residual-no-recovery-addendum-dre-2026-09-22/`. The
repairs corrected the r25 record in four places (see the experiment page's addendum section and the errata
list); none changed a theorem.

**Registry.** The master registry moves from 360 to 363 identities (208 VERIFIED, 88 REFUTED, 26 CONDITIONAL,
41 OPEN); all 360 prior objects preserved with statuses unchanged; three imported, five r25-owned identities
updated on their faces (two grade changes to `formally_verified` on their stated halves). Registry pin after
publication `0a0608f2af194a58a6ff8beb33e47112976f0eae902e5c8f76d78cf0cd4943d8`; ledger `ac6de5a31c980159e5c74653f166f2bc50e882a6d85f1a8185e4984d0241016a`. Statuses are registry grades at
their explicit evidence, not a count of theorems; no claim bears on Erdős #993.
