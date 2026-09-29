# Cycle 3 Close — r31 (CB(8,m), m ≥ 107, m ≡ 2 (mod 3), rank p* = (16m+4)/3)

Controller: Claude Opus 5.5, 2026-09-28 07:54 EDT (by the clock). Canonical run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`.
Topology 9/18/3/1 + governed Stage 7 + isolated second reads (routes Sonnet 5 high; critics Opus 5.5 medium; adjudicators, synthesis,
Stage 7 and second reads Opus 5.5 high; per-seat effort not settable — chartered efforts recorded).

## Seals

| Stage | Seal |
|---|---|
| Stage 2 | `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3` |
| Stage 3 dispatch / packet | `5ebe648e…` / `c40d4a97…` |
| Stage 4 dispatch / packet | `cc9683b5…` / `a940eb85…` |
| Stage 5 | `216d797d…` |
| Stage 6 dispatch / packet | `976abb90…` / `51df154fac539f4709ed42842ce929e5a126feb93f06f5c27af033e39baf6b22` |
| Stage 7 capsule / packet | LA1 `c24b760a…` / `98ab42a26ecd26ab198af1fb66f13b622e452ea18080e8a8e7822bb928de4589` |
| Second-read capsules | SR-C3-1 `0068a939…`, SR-C3-2 `b8f19b40…`, SR-C3-3 `66027245…`, SR-C3-4 `8de2fea1…` |
| Second-reads packet | `f843f05323256317d65355d62efdcacca7cda3dc21d998c7ae9971dde7460ff0` |

## Outcome

- **Flags (synthesis):** `headline_resolved: no`, `material_progress: yes` (narrow), `plateau: no`, `continue: yes`. Gate lines
  (ruling 21): `COND4_formal: advanced` (critic-attributed only), `E1_formal: advanced`, `TERMINAL_integration: advanced`,
  `cut_candidate: none` cycle-wide.
- **Routes and reviews:** nine routes; eighteen critiques, all `retained_narrowed`; three adjudications (all `still_open`); the
  synthesis. As in Cycle 2 most formal advances came from critics; seats produced two alias results, one kernel-refuted Lean statement
  (T1's `clone_fiber_card`, truncated ℕ subtraction, witness `(1,0,0,1)`) and one invented digest literal (U1; R-11), alongside genuine
  seat nodes (T1, T2, U2, U3's six-award merge).
- **One formal award, `formally_verified`** (`cycles/cycle-3/stage7/LEAN-GATE-CLOSEOUT.md`): **C3-LA1**, the clone-level E1 transport at
  `p*` for every `q ∈ [1, m]` (`E993Transport.cb8_E1_cloneTransport_topRank`; 53 declarations, 20 carried; report `b3f358ab…`).
  Clone level only — not the literal up-cover counts, not the literal E1 flow, not conjunct 4.
- **Four isolated second reads, all `confirmed_with_repairs`** (SR-C3-3b `confirmed`); no statement rejected.

## Registrations (run-local registry: 497 claims, no new key, no grade change; ledger 31 → 44 rows; lint 0 findings, 2 accepted warnings)

| Key | Change | Via |
|---|---|---|
| `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` | formal clause (restricted scope: d = 8, the class, `p*`, clone level) — `formally_verified` at that scope; key grade unchanged | C3-LA1; SR-C3-1 (G-1) |
| same key | informal notes: exact domain `j ≥ 1`, degenerate columns and `β = 0`; fidelity of the literal Lean arc function `cb8E1Arc` | SR-C3-1; SR-C3-3 (G-2) |
| composition key | notes: `g_sec` on literal pairs, exact Out/In identities, switch preimages, split zero classes; the exact active-tag weight | SR-C3-2; SR-C3-3 (G-3) |
| **Tier 1** key | notes: the formal status map (conjunct 4 the only open formal node; the rational-flow interfaces equivalent to it, not reductions); criterion-free sector Hall surplus + one-choke check (HX); grade unchanged (`proved_informal`) | SR-C3-3; SR-C3-4 (G-4) |
| R-1 allocation key | note: sector switch-capacity floor (`proved_informal`) and bounded ratio to m = 1100 | SR-C3-4 (G-5) |

Plus ledger rows R31-C3-LA1, the REFUTED formal statement `clone_fiber_card`, the U1 certification defect, the reserved-name freeze hazard,
F2's retitled nine-row record, the load-bearing `hj` on C1-LA3, the record corrections 1–11, B-1 bounded records, the second reads'
bounded records, and two distinction rows (SR-C3-4-D1, -D2). U3's proposed keys: not registered (G-6). Full log:
`control/C3-CLOSE-REGISTRATION-LOG.txt`; snapshots `control/snapshots/*.c3-pre-close.*` and `*.c3-close.*`.

## Where Tier 1 stands

Tier 1 on the class stays **`proved_informal`, Darroch/Newton-free — not decisive**. Formal: (E) on the literal tree (C2-LA1); every
leaf favorable (C2-LA3 over C2-LA2); (L-S)_top template (C1-LA1); CB layer and reduction to conjuncts 2 and 4 (C1-LA2); block descent
(C1-LA3); now the clone-level E1 transport (C3-LA1). **Conjunct 4 is the only formal obligation left.** Its smallest missing nodes: the
per-set neighbourhood-count bridge on `cbGraph m` (R31-N-21; the E1 graph lift), the frozen sector flow `g_sec` with its Out/In bridges,
and the per-class capacity composition. The terminal name `cb8_topRank_eligible_and_weightedHall` stays reserved (R31-N-22, R-10).
(HALL) at full scope, TREE, FOREST, TRANSFER and Erdős #993 stay OPEN.

## Errata, rulings, lessons this cycle

R31-E-g (the gate text said one plateau cycle ends the run; the contract's rule — two consecutive plateau cycles — governs). R31-E-h
(a mid-attempt relay reopened the C3-LA1 formalizer after its first return; the first review pair was stopped before writing and
relaunched; lesson: wait for a Stage 7 seat's final stop before the review gate, never relay after it returns). Gate rulings 16–22
(Δ_p defined; instrument hygiene; carries; (G′) refuted; gate lines; stop gate). R31-N-20 (R-11 digest rule), R31-N-21 (bridge owner),
R31-N-22 (reserved name). Binding for Cycle 4: every ℕ subtraction in a count or index guarded or proved safe on the face.

## Continuation

Not a plateau cycle; ceiling 6. The Claude Fable 5.1 (high) checkpoint analysis reads the sealed record next and advises the Cycle 4
gate. Cycle 4 portfolio (synthesis): T1 up-cover counts (the bridge); T2 `g_sec` images and Out bridge; T3 In bridge and switch-image
inflow; F1 freeze-fidelity sign-off; F2 composed-flow per-target adversary; F3 literal Lean-function semantics; U1 E1 spec discharge;
U2 conjunct-4 per-class composition; U3 terminal freeze readiness. Fresh rows 137, 146, 152; frozen `g_sec` text before Stage 2.
