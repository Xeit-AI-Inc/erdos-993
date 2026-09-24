# Verification record: r27 release, 2026-09-24

The source experiment is `erdos-993-forest-degree-extension-dre-2026-09-24` (r27: audit and formalize the finite
forest degree/extension inequality of Fang–Lu–Nevo–Yao–Zheng 2026 §8). Terminal manifest `017ddb693bdb678625efa3ead71aa34eb09af2d8ab53ff7b4b71fc25fb22b569`. Every
stage was sealed by a canonical-JSON SHA-256 manifest; the controller's integrity sweep at the close recomputed
38 manifests and 3,698 members with zero unexpected mismatches (36 expected drifts: living files by design —
agents records sealed after their stage, the controller toolkit patched between stages, the registry/ledger at
registration, the controller notes frozen at the close, and the C1-LA4 capsule's sibling award runs, frozen
mid-lifecycle and changed by their own closes). Four governed Lean contracts closed through independent informal
proof-integrity audit, canonical formal registration, pinned kernel/axiom verification, independent
statement-fidelity attestation and workflow close (C1-LA3 after one bounded repair round on record defects,
with comment-stripped sources byte-identical across rounds). Only the exact contract statements receive the
formal grade.

| Award | Terminal declaration | Registry effect | Main source SHA-256 | Fidelity receipt |
|---|---|---|---|---|
| `C1-LA1` | `Erdos993G1.forest_extension_inequality` | `E993-R27-FOREST-EXTENSION-INEQUALITY (with E993-R27-FOREST-DEGREE-LEMMA)` | `b49ea82a33edc55f8185379c3abd44e13a17914b7f8b9ab0bf5e2aaac5aafc5a` | `7f19fa3e6a90a98d…` |
| `C1-LA2` | `Erdos993G1.e_ge_sub` | `E993-R27-EXTENSION-LOWER-BOUND (with E993-R27-INDEP-EXTENSION-DOUBLE-COUNT)` | `24e8764fbf99bca80a12a3e5f96449e1a5ae0517846ea8808ead5d399f327b19` | `fc12cd1d309537d4…` |
| `C1-LA3` | `Erdos993G1.degree_lemma_implies_chain` | `E993-R27-DEGREE-LEMMA-IMPLIES-EXTENSION-CHAIN` | `23d9a1633c9d8f849be992f5f2f1cbe9b270092109903e98e51c903591017851` | `154d8b63e29e1e2f…` |
| `C1-LA4` | `Erdos993G1.forest_descent_restriction` | `E993-R27-DESCENT-RESTRICTION-4R-MINUS-4 (with E993-R27-FOREST-DESCENT-LINEAR-BOUND, E993-R27-RANK5-CEILING-20)` | `dcecb681d019a29c625dcea1a2385de920fffa6b8f185e79372f31ae547c1936` | `6f7bb4e32fc409ea…` |

All four packages pin Lean `v4.32.2` and Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`. Their only reported
transitive axioms are `propext`, `Classical.choice`, `Quot.sound`. No admitted declaration, native decision
axiom or additional assumption is introduced. Every Main file and project configuration file is byte-identical
to the sealed internal run. Verification reports: C1-LA1 `28bc7d1aa0536790…`; C1-LA2 `73d21e93f64ae8ec…`; C1-LA3 `163d64e288b31273…`; C1-LA4 `8ee1e413587a694f…`.

**What the packages prove.** C1-LA1: for every finite forest `G` (a finite simple graph with `IsAcyclic`) and
every natural `k`, the degree lemma `Σ_{J∈I_k} Σ_{v∈J} deg(v) ≤ 2k·i_k(G)` and the extension inequality
`n·i_k ≤ (k+1)·i_{k+1} + 3k·i_k`, on the program's G1 definitions of record (`Erdos993G1.indepCount`, carried
byte-identically from the r25 award; 55 declarations). The proof is an in-run injection argument for the
root-corrected lemma, not the paper's polynomial induction. C1-LA2: for every finite simple graph, the double
count `(k+1)·i_{k+1} = Σ_{J∈I_k} e(J)` and `e(J) ≥ n − k − Σ_{v∈J} deg(v)` — no acyclicity. C1-LA3: the
implication `DlHyp → ExHyp ∧ LbHyp ∧ R5Hyp ∧ XrHyp`, each hypothesis definitionally the contract statement.
C1-LA4: unconditionally, `Δ_k < 0 ⇒ n ≤ 4k`, `21 ≤ n ⇒ 0 ≤ Δ_5`, and `firstDescent G < r ⇒ n ≤ 4r − 4` (81
declarations composing C1-LA1 byte-identically). These are order bounds whose contrapositives have sign
`Δ_k ≥ 0`; nothing about no-recovery, the forest-wide no-recovery claim, NR1, FOREST, TREE, TRANSFER or Erdős
#993 is asserted.

**Attribution and license.** The mathematics of the degree lemma and extension inequality is Fang–Lu–Nevo–Yao–
Zheng, *Unimodality of Independence Polynomials for Sufficiently Large Forests* (2026), arXiv:2609.20961v1 §8.
The authors' Lean development was read for audit only: its audit copy carries no LICENSE, so no line of it
enters these packages; every declaration here is authored in-run and the proof of C1-LA1 differs from theirs.

**Second reads.** Four isolated Opus reads (SR-RC, SR-JOIN, SR-EXX, SR-REC) before registration, 17 statements,
all confirmed (16 with repairs, 0 rejected); their reports are mirrored under
`runs/erdos-993-forest-degree-extension-dre-2026-09-24/`. SR-RC found a latent third use of acyclicity in
the injection proof (`p(p(u)) ≠ u`), which the formalizer had independently supplied as a named lemma; SR-EXX
ran an exhaustive forest census to order 20 (free trees A000055, forests A005195 matched at every order),
which no r27 seat had reached; SR-JOIN showed acyclicity is not a hypothesis of the two-potential
recurrences; SR-REC found a false warrant in three records and replaced it. None changed a theorem.

**Registry.** The master registry moves from 370 to 392 identities (235 VERIFIED, 89 REFUTED, 26 CONDITIONAL,
42 OPEN); all 370 prior objects preserved with statuses unchanged; scope notes on seven r25 claims and one
refuted claim. Registry pin after publication `b6bb42caf5afdf3c927bc408e25df751d5cf9dbe6444acc2793769ed6e1d8b78`; ledger `01086533647def7dd99afe8ba02517055c07f6ca02b28ed7463628c5a989cc44`. Statuses are registry grades at
their explicit evidence, not a count of theorems; no claim bears on Erdős #993.
