# Verification Record: r23b Actual-Tree Delete/Retag Construction & Verification (2026-09-17)

## Terminal Binding
Internal run `erdos-993-delete-retag-actual-dre-2026-09-13`, six cycles, terminal
seal `control/TERMINAL-SEAL.json` = `de715137ca084a184e0514fbf1850648329fa5459d735ab5a028ea81b81ea7ef`
(17 members, byte-exact at close). Every stage of every cycle sealed by
canonical-JSON SHA-256 manifests; every face independently recomputed its seals;
zero unexplained drift across all 31 faces of the terminal cycle.

## Exact Witness Evidence
- `CB(8,92)` (n=1567, x=490, p=492): tag-closed singleton cut deficient by
  `≥ C(736,491)·2^491 − C(736,490)·2^490 > 0` (347 digits); `S(T*,492)` negative
  (351 digits, fingerprint `−748810430710227858618987…557120`); `g_u` = 349
  digits negative via `S = g_arm + 736·g_u` (registrar receipt). Reproduced
  digit-exact by more than seven structurally distinct instruments.
- Order 91 (`T_22`, p=34): `S = −498754180547001418536`, 67 favorable.
- Order 26 Kadrawi–Levit: TRS2 refuted at rank 13 (deficit 378); order 243
  T60: `S(T,90) = −1058142362147652597702654588268394677176033202323316960380`.
- Entry point `replay_all.py`: 45/45 pinned values from sealed evidence, planted
  mutation fires, non-circular (tampering a pin turns the run red).

## Lean Binding
Lean 4.32.2 / Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`. Terminal
consolidation: 370 constants; `sorryAx` exactly on `indepOn_card`,
`indepOn_insert_card`; extra axioms exactly on the two CB(1,2) `native_decide`
lemmas (kernel-`decide` restatement added). Transport lemmas, abstract bridge
corollaries and the R-3/R-4/R-5 content: `[propext, Classical.choice, Quot.sound]`
only. Published as `verified`, never `formally_verified`.
Source: `proofs/lean/r23b-terminal-consolidation/source/` (21 .lean files).

## Scope Ceiling
TREE / FOREST / TRANSFER / COUNTEREXAMPLE open; candidate invariants are
mechanisms — mechanism kills are never target counterexamples; computation is
evidence, never proof; no bounded zero is evidence of anything; nothing is ever
formally_verified. O14 remains OPEN. Object of record: Horn B (see LEDGER.md).
