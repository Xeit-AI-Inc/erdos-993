# Lane B Lean Gate Closeout (r25 ADDENDUM) — the `Bd` tail

Controller: Claude (Fable 5.1), 2026-09-22. Protocol: `control/lane-b/LANE-B-STAGE7-PROTOCOL.md`.
Capsule seal `c64e6393c628a330cfb7b142297fbdc004587d5fe3b3ff26c916e71cfd8425bd`.

| Award | Run | Terminal declaration | Status |
|---|---|---|---|
| `B-LA1` U-AWARD-BD-TAIL-NEGATIVE | `runs/lean-2026-09-22-b-bd-tail-negative/` | `ErdosR25AddBdTail.bdTailNegative_award : ∀ r : ℕ, 6 ≤ r → BdRR r < 0` | **formally_verified** |

- Formalizer: Claude Sonnet 5 xhigh (`b-la1-formalizer-sonnet-20260922`); `compiled-candidate`; zero bounded
  repairs; one recorded pre-review correction (the contract's `expected_statement` carried the docstring and
  proof body; corrected to the statement text alone; contract and kernel receipts regenerated; source unchanged
  `2791103a…`).
- Kernel: `verified`; axioms `propext, Classical.choice, Quot.sound` on the terminal declaration and on all 96
  registered declarations; no `sorry`/`admit`/`native_decide`; single import `Mathlib`; shared Mathlib bound by
  symlink.
- Independent informal proof-integrity audit (`b-la1-fable-informal-20260922`, Claude Opus 5 high): `passed`;
  ALSO the gate-ruling-8 isolated reader — composition ruled sound on ONE frame (C-U2-F's integer-rank
  `MaR`/`BdRR` of record), acyclic DAG, every import used inside its registered scope, the `[6,14]` layer
  kept separate and necessarily so. Audit `dd856e57…`; receipt `1453f405e9d1dcb7…`.
- Independent statement-fidelity review (`b-la1-fable-fidelity-20260922`, Claude Opus 5 high): `match` /
  `passed` (14 checks); fixed points `BdRR 4 = 48`, `5 = 33`, `6 = −16`, `10 = −14406` proved; sharpness half
  not asserted; `D_unimodal_peak` occurs only inside a byte-identical LA4 fragment's docstring fence sentence
  (no declaration of that shape). Receipt `60ff0ed31814a39b…`.
- Verification report `837dff729058741b378e3ebb869c8cbb562b00c2d4f73ce591e7bfd2b33fd10c`.

## Registry effect (applied at the addendum close)

`E993-R25-BD-TAIL-NEGATIVE`: `proved_informal` → `formally_verified` for the `r ≥ 6` half (the statement's
parenthetical sharpness half stays informal and is said so on the scope face). Consequence for
`E993-R25-FOURTH-BAND-CLOSE-ALL-R`: input 7 of eight is now formal; with SR-S2's corrected ledger the band
has THREE formally verified inputs (3, 6, 7); grade unchanged, `proved_informal` at the weakest link. NOT a
closure of the band; NOT a tier statement; binomial-integer arithmetic only.

## Errata surfaced by the reviews

A1-E-c: the r25 S-U-1 count "19 failures at `r ≤ 14`" for `M_a(r) ≤ Cat_{r−1−a}` does not reproduce (14, of
which 13 inside the layer); the mathematical point stands. Non-blocking observations O2–O6 are recorded in
`control/LANE-B-AGENTS.json`.
