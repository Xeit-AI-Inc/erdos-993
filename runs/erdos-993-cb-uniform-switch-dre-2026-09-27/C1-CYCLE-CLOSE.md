# Cycle 1 Close — r31 (CB(8,m), m ≥ 107, m ≡ 2 (mod 3), rank p* = (16m+4)/3)

Controller: Claude Opus 5.5, 2026-09-28 01:10 EDT (by the clock). Canonical run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`.
Topology 9/18/3/1 + governed Stage 7 + isolated second reads; routes chartered Sonnet 5 high, critics Opus 5.5 medium, adjudicators /
synthesis / Stage 7 / second reads Opus 5.5 high (per-seat effort not settable on this platform; chartered efforts recorded; every seat
reported runtime model id `claude-opus-5-5` or its Sonnet equivalent as recorded in the agents files).

## Seals

| Stage | Seal |
|---|---|
| Stage 2 | `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc` |
| Stage 3 dispatch / packet | `44928104…` / `e6cb6647…` |
| Stage 4 dispatch / packet | `86453c5c…` / `40f2e216…` |
| Stage 5 | `ea1b0346…` |
| Stage 6 dispatch / packet | `b9cdc875…` / `69f7dd42c5e137417b3b84e852cb0c6fe0b31c2595f6d8f1bf68dd512e9dc643` |
| Stage 7 capsules | LA1 `b5b37332…`, LA2 `7f13a1b9…`, LA3 `f51ec356…` |
| Second-read capsules | SR-1 `5e4642ab…`, SR-2 `df3a9219…`, SR-3 `232931c1…`, SR-4 `9016a163…`, SR-5 `ce8c702c…`, SR-6 `9c53291a…` |
| Second-reads packet | `9096aaee90b2f598dc573c1d07d9d9dc28f982a8095d2b021ba2503fcf49a70a` |

## Outcome

- **Flags (synthesis):** `headline_resolved: no`, `material_progress: yes`, `plateau: no`, `continue: yes`.
- **Three formal awards, all `formally_verified`** (`cycles/cycle-1/stage7/LEAN-GATE-CLOSEOUT.md`):
  - **C1-LA1** — (L-S)_top at template level on the whole class (allocation of record; Out over every assignment at `K = p*−1`, In at
    `K−1`, Switch, Residual `θ ≤ 1 − ρ_1`). Registered as the R-1 key at `formally_verified`.
  - **C1-LA3** — the block-descent node (BD) for `5 ≤ j ≤ m`, Newton/Darroch-free; companions (G) and (E1i) compiled, ungraded.
  - **C1-LA2** — the CB(8,m) layer and the reduction of the terminal to conjuncts 2 and 4 (hypotheses only). Ledger record, no key.
- **Six isolated second reads, all concordant** (no statement rejected): SR-1 (allocation + Residual), SR-2 (Lemma A; scope notes),
  SR-3 (composition), SR-4 (parent descent and eligibility), SR-5 (Tier 1 assembly), SR-6 (template failure).

## Registrations (run-local registry 491 → 497; ledger 3 → 22 rows; lint clean on the run-local registry and on the frozen master)

| Key | Grade | Via |
|---|---|---|
| `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107` | `formally_verified` (template scope) | C1-LA1 + SR-1 |
| `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-BLOCK-PRODUCT-1-PLUS-X-TO-8J-TIMES-1-PLUS-2X-TO-8M-MINUS-8J-PLUS-1-COEFFICIENTS-STRICTLY-DESCEND-AT-INDEX-16M-MINUS-2-OVER-3-MINUS-J-FOR-5-LE-J-LE-M` | `formally_verified` | C1-LA3 |
| `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107` | `proved_informal` | SR-3 (renamed) |
| `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE` | `computer_assisted` | SR-4 (renamed; R31-N-8) |
| `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL` (**Tier 1**) | `computer_assisted`; (H) alone `proved_informal` modulo Darroch/Newton through the favorability key only | SR-5 (renamed) |
| `E993-R31-CB-8-TOP-RANK-SECTOR-ALLOCATION-WITH-RATES-DEPENDING-ONLY-ON-LEG-TYPE-AND-CHOKE-LEG-COUNT-IS-INFEASIBLE-ON-THE-RESIDUE-2-CLASS-FROM-107` | `proved_informal` | SR-6 |

Plus scope notes (criterion and threshold keys — SR-2; favorability key — SR-4; r30 row key — SR-1; deletion-deficit key — SR-6),
distinction rows, bounded records, explicit-rank aliases on the R-1 and R-6 keys (SR-5), the carry-source caution (R-8) and the C1-LA2
record. Full log: `control/C1-CLOSE-REGISTRATION-LOG.txt`. Pre/post snapshots under `control/snapshots/`.

## Where Tier 1 stands

Tier 1 ((E) ∧ (H) on the whole class) is registered at **`computer_assisted`** — NOT decisive (SOLUTION-CONTRACT §5: decisive event (a)
needs the §2 terminal formally verified). Its non-formal inputs: (1) the fixed degree-50 `S_5` certificate (eligibility); (2) favorability
of every leaf at `p*` (the r30 key, `proved_informal` modulo Darroch/Newton); (3) the composition (`proved_informal`); (4) the criterion
flow at `p*` (r30 keys with SR-2/CD-2 scope notes). (HALL) at full scope, TREE, FOREST, TRANSFER, governed beta and Erdős #993 stay OPEN.

## Errata and controller rulings this cycle

R31-E-a (digest-file path in cloned messages; fixed before launch), R31-E-b (synthesis dispatch asked for "6 routes"; fixed in
`r31_tool_c3.py`), R31-E-c (SR-2 brief's gap identity off by 2; statement of record unaffected); R31-N-6 (SR-6: Farkas certificates
certify F-3, not F-2; `θ_budget` has an exact form), R31-N-7 (SR-1: 90 per-state checks, not 45), R31-N-8 (eligibility graded
`computer_assisted`), R31-N-9 (SR-3 facts), R31-N-10 (concurrent master 494; frozen for alias checks; all r31 keys clear against it).

## Stop gate and continuation

The stop gate is armed from the Cycle 2 close (SOLUTION-CONTRACT §5). No decisive event. **Cycle 2 runs** (ceiling 6), weighted to the
formal chain: U1 (eligibility in Lean, first priority), U2 (composition in Lean), U3 (closed forms linked to `cbGraph`), T1/T2
(favorability without Darroch/Newton), T3 (the criterion flow explicit), F1–F3 (fresh-row and range adversaries).
`control/C2-ALLOCATION.md`. The Claude Fable 5.1 checkpoint analysis follows the Cycle 3 close.
