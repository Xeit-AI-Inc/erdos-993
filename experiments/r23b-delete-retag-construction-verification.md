# r23b Actual-Tree Delete/Retag: Construction, Correspondence, Verification

Sibling of [r23](r23-delete-retag-actual-tree.md). Where r23 (one cycle, the
mathematics agent's lane) found the decisive order-91 all-cut refutation, r23b
owned the construction and semantic-correspondence debt behind O14
(`E993-BETA-AGG`) and `E993-R19-FIXED-GAMMA-HALL` and ran all six authorized
cycles (2026-09-13 → 2026-09-17).

## Charter And Outcome

Five obligations: recover the literal fixed Delete/Retag relation; build an
independent exact evaluator; instantiate it on actual rows; prove the
coefficient correspondence; state exactly what the mechanism implies. All five
are discharged at exact scopes with **one named residual**:

- **Correspondence.** The six relation-family transport lemmas (C, P, N via
  `Graph.induce` and the `ofSimpleGraph` realization equivalence) are sorry-free
  at Lean 4.32.2 / Mathlib `905b9581…`; the three `_actual` bridge theorems are
  repaired by abstract corollaries; the induce-side P/N transport, the activity
  filter `A ∩ W_v ≠ ∅`, and the abstract-side relation family are proved. The
  residual is O16: lifting the adjacency-level `induce_ofSimpleGraph` transport
  to full graph-object form (a `Finset`→`Fin` bijection) — Lean bookkeeping of
  known shape, precisely isolated.
- **The bridge, fully mapped.** Every cut-based strengthening of the aggregate
  is refuted by an exact witness with `S<0` on the same row: all-cut Hall
  (order 91, F16, r23), Delete-only universal Hall (a fortiori), and now
  tag-closed-cut Hall (**order 1567, F17**: `CB(8,92)`, the tag-closed singleton
  arm cut deficient by `≥ C(736,491)·2^491 − C(736,490)·2^490 > 0`, 347 digits,
  while `S(T*,492) < 0` at 351 digits). `E993-R23-TAG-CLOSED-CUT-HALL` is
  registered REFUTED. The surviving open object at literal scope is the O14
  per-row demand `|P| ≤ |N|` itself. Mechanism kills, never target
  counterexamples; O14 stays OPEN.
- **Structure on the surviving demand.** The path family is CLOSED at governed
  scope (`S(P_n,p) ≤ 0`, proved via closed-form `x(P_n)` monotonicity); stars
  characterized (`g_v ≤ 0 ⇔ p ≥ ⌈m/2⌉`); THEOREM TYPE-2-DIRECT
  (`g_v = Δ_{p−2}(K_v)` at `deg(s_v)=2`) unconditional, cut-free; LEMMA F3-1
  (hot ⇒ `E ≥ p`) sharp; the CB-arm criterion `g_arm>0 ⇔ 2(jk−p+2)>p−1` proved in
  Lean from Pascal (a charter drafting slip, `jk−p+1`, was caught by an
  adversarial seat and independently avoided by the Lean seat); the C4 identity
  family (`def(full-cut)=S+Σμ`, `def(G)=Σ_G(g_v+μ_v)−export(G)`, `R⊆D`) sustained
  under a 715-row hostile census; branch-point peels reduce to the open
  question itself.
- **Controls closed.** The §6 mandatory battery — the order-26 Kadrawi–Levit
  non-LC trees (TRS2 refuted at order 26, rank 13, with no LC/size gate),
  the order-243 T60 witness, coefficient tails, order-91, P30, the `K_{1,3}`
  rank-two regression — passes on falsifiable instruments with two independent
  evaluators, digit-exact.

## Claim Status

See `../runs/r23b-delete-retag-actual-dre-2026-09-13/`. 208 adjudicated rows
(`R23B-*`, 13/50/37/19/49/40 across C1–C6), zero collisions, explicit
supersession chains. The program-schema projection registers 150 claims of
record: 31 `verified` (kernel-checked, sorry-free, clean axioms — this run
never grades `formally_verified`), 26 `proved_informal`, 5
`refuted_mechanism`, 58 `verified_bounded_computation`, 30 `partial`; 18
adjudication-rejected and 40 process-tier rows are excluded from the
projection and retained in the rich ledger.

**Object of record (Ashton, 2026-09-17): Horn B.** The r23 ordinary-tree object
is the definition of record for O14; the governed-RTree rows
`E993-R19-FIXED-GAMMA-HALL` and `E993-R19-R2-HALL-UNIVERSAL` stay OPEN on their
own terms, and the universal transfer `RTree.semanticAdequacyTarget` is
registered as O15 — now markedly more tractable, since the transport lemmas
above are most of that bridge and O16 is its last piece.

## Formal Scope

`../proofs/lean/r23b-terminal-consolidation/`: one merged project, 370
non-internal constants, `sorryAx` on exactly the two disclosed open fixture
lemmas, `native_decide` on exactly the two sealed CB(1,2) lemmas (a
kernel-`decide` restatement added), an 18-family honest fidelity-label table.
Nothing here certifies O14, universal `S ≤ 0`, or any headline target.

## Next Entry Point

O16 (close the induce coherence step), then O15 (the universal transfer). For
the mathematics agent: the handoff document names the established identities,
the weakest remaining compensation inequality (`|P| ≤ |N|`, the O14 row via
BRIDGE-2), and the structural obstructions (the refuted cut lattice; the hot-arm
design law `E ≤ n−p−1`; the branch-point reduction).
