# Cycle 1 Close — r30 (controller record, 2026-09-26)

Run `erdos-993-math-dre-20260926-r30-weighted-transport` (correctly weighted mixed-boundary transport for the remaining
ordinary-tree favorable-leaf aggregate). Controller: Claude Fable 5.1. This record closes Cycle 1. Every grade below is the grade
of record as fixed by the sealed synthesis (`cycles/cycle-1/stage6/SYNTHESIS.md`), the governed Stage 7 close
(`cycles/cycle-1/stage7/LEAN-GATE-CLOSEOUT.md`) and the five isolated second reads (`second-reads/SR-*/SECOND-READ.md`).
Nothing here upgrades a grade; where a second read repaired a statement, the repaired text is the text of record.

## 1. Headline

- **(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: OPEN, unchanged.** Not proved at any scope; not refuted (no deficient
  cut of the mixed relation with the active-tag weight exists at any instrument count). Smallest unproved lemma: a
  switch-capacity statement covering the deletion deficit of every source family where deletion-only Hall fails; first concrete
  instance (HALL-COND) at `CB(8, 86)`, `p = 460`, for every `X ⊆ I_461` not inside the root-plus-arm sector.
- **(WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: OPEN → VERIFIED `formally_verified`** (award C1-LA1). Graph-generic; no
  sign content.
- **Outcome A (uniform theorem): not reached. Outcome B: several lemmas (below). Outcome C (exact deficient cut): did not occur.**
- The primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` is untouched (scope note only).

## 2. Seals of record

| Stage | Seal (SHA-256) | Members |
|---|---|---|
| Stage 2 packet | `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92` | 1006 |
| Stage 3 dispatch | `2b114a276cd925fc50d521cfcce6c65068344b527aac88b3fd030bdc1b3bdd40` | 7 |
| Stage 3 packet | `da784de8567703935e95ea3e452acc151fdbc15a7e20ffd86634ecb87e4f92ac` | — |
| Stage 4 dispatch | `f62b5c6a639104c155f2acebb4b40b5f6379134f490c90edc1601a0b764ac2cc` | — |
| Stage 4 packet | `94bd9f138c1bd3290bdeda9ab4edb2b4e95f704756f3ef21a300d910a83017bf` | — |
| Stage 5 packet | `3e2b73b64f3de6abbd0629013c6181d0c1afca2bf68fb6660aeede19953352e4` | 41 |
| Stage 6 dispatch | `6ab566af95c1c0464fad55bd90e2be8fbc62c192d9a5401db5c2e47f44923e2a` | 12 |
| Stage 6 packet | `7bcc4b878cb93d370b43f498633ee0b2aea3f59de2eec287c79afd094391a7bd` | — |
| Stage 7 packet | `fd5d7ed2…` (see `control/C1-STAGE7-PACKET-MANIFEST.json`) | 322 |
| Award capsule C1-LA1 | `ac21ccbf72afde0f7d364c4360381a22f267a78f67ef8d829e5fdbefb1a9f660` | — |
| Award capsule C1-LA2 | `dfc6884914127b3f38d3656ab5b7c2840754f8b20ee2e4d464353f6a79157121` | — |
| Second-read capsules | SR-NET `ee4802e8…`, SR-INV `33cb99e7…`, SR-SECTOR `a24d39b9…`, SR-REACH `56a07fc3…`, SR-BUDGET `f3fe58dc…` (`control/c1-second-read/SEALS.json`) | — |
| Second-reads packet | `93430b78d6e5feb3ee65e0a7d9674c7a1439116453ace4b881bb8a104c26a0e4` | 22 |

Stage verdicts: Stage 3 6/6 admitted (two cosmetic exceptions for U1: `control/C1-STAGE3-ADMISSION-EXCEPTIONS.json`); Stage 4
12/12 admitted, every critique `retained_narrowed`; Stage 5 T/F/U each `still_open` / material progress `yes` / plateau `no`;
Stage 6 `headline_resolved: no`, `material_progress: yes`, `plateau: no`, `continue: yes`.

## 3. Lean awards (governed `lean-proof-workflow`; both `formally_verified`)

| Award | Terminal theorem | `Main.lean` | Contract | Verification report |
|---|---|---|---|---|
| C1-LA1 `runs/lean-2026-09-26-c1-la1-active-tag-weight-identity` | `E993Transport.activeWeightAggregateIdentity` | `86b59c6c…` | `539bee23…` | `d1db0c76…` |
| C1-LA2 `runs/lean-2026-09-26-c1-la2-weighted-hall-implies-nonpositive-aggregate` | `E993Transport.aggregate_nonpos_of_weightedHall` | `7c279f4b…` | `c9c16b09…` | `fefa7eb7…` |

Axioms exactly `propext`, `Classical.choice`, `Quot.sound` in both. Carried definitions of record: first-interior entries 1–6,
8–13, 18, 42, byte-identical. The eight new `E993Transport` definitions are frozen at C1-LA1's text (ruling R30-N-8: C1-LA2's
text differs only by the classical-decidability wrapper and docstrings; registration is at the meaning level, and every later award
carries C1-LA1's text). Companions on the faces carry no certificate (R29-N-12): FLOW⇒SIGN, HALL⇒FLOW, the converse and the iff,
`transportRel_mem_indepFamily`, `layerWeight_sub_eq_sum`, `card_active_eq_tagged`, `layerWeight_eq_sum_card`.

## 4. Registrations applied (run-local registry only; master untouched until the terminal close)

Applied by `control/register_c1_close.py` and `control/register_c1_close_srreach.py` (idempotent); lint
`control/CLAIM-STATUS-LINT-c1-close.json`: 434 identity claims, 0 findings, 0 warnings. Run-local registry now 438 claims;
`OBLIGATIONS.csv` 327 rows.

| Key | Change | Grade | Source |
|---|---|---|---|
| `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` | OPEN → VERIFIED | `formally_verified` | C1-LA1; SR-4 |
| `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` | new, VERIFIED | `formally_verified` | C1-LA2; SR-2 |
| `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` (INV) | new, VERIFIED | `proved_informal` | U1; C-U1-T/F; U adjudicator; SR-5 |
| `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (NM) | new, VERIFIED | `proved_informal` | T1 (corrected hypothesis); C-T1-T/F; T adjudicator; SR-7 |
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | scope note | OPEN unchanged | SR-14 (repaired text) |
| `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION` | scope note | REFUTED unchanged | SR-15 (order-11 literal failures; witness minimality never asserted) |
| `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` | scope note (relation to INV) | unchanged | SR-5/SR-6 |
| `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | scope note (hierarchy D+C ≥ (2α+1−3p)Q ⟺ Q_p ≤ Q_{p−1} ⟺ S ≤ 0) | OPEN unchanged | SR-16 |
| `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY` | scope note | unchanged | SR-16 |
| three OPEN budget keys (`…EARLY-MARKED-OCCUPANCY-TRANSFER` chain) | instance-wise implication notes | OPEN unchanged | SR-17 |
| `CLAIM-DISTINCTIONS.json` | rows R30-INV, R30-DEG2, R30-DELONLY, R30-T22-NAMING | — | SR-18, SR-19 |
| `OBLIGATIONS.csv` | rows R30-WID, R30-HALL-SIGN, R30-INV, R30-NM, R30-CB-RECORD, R30-SR-STATED | — | — |

Not registered (by ruling): the `Q_j` monotone / log-concave lead (SR-20: not registrable, a lead only); the `G_k` and `T(m, k)`
unreachable-target families (route records inside the (HALL) scope note until uniform eligibility and favorability are proved);
P10 and P12 as their own keys (components of the (HALL) scope note; predicate keys named in SR-REACH for a later cycle).

## 5. Isolated second reads (five Opus 5.5 high seats; 20 statements)

| Read | Statements | Verdicts |
|---|---|---|
| SR-NET | SR-1 FLOW⇒SIGN; SR-2 HALL⇒S≤0 and the C1-LA2 key; SR-3 literal-weight identity; SR-4 (WID) scope note + R30-E-b | 4 × confirmed_with_repairs |
| SR-INV | SR-5 INV reduction theorem and key; SR-6 support-move lemma (route record) | 2 × confirmed_with_repairs |
| SR-SECTOR | SR-7 NM key; SR-8 switch-image weight; SR-9 sector criterion and composition; SR-10 Lemma C and the CB record text | SR-7 confirmed; SR-8..10 confirmed_with_repairs |
| SR-REACH | SR-11 reachability lemma P10; SR-12 unreachable-target families and census; SR-13 P12; SR-14 (HALL) scope note; SR-15 D8 scope note | SR-11 confirmed; SR-12..15 confirmed_with_repairs |
| SR-BUDGET | SR-16 hierarchy; SR-17 chain among OPEN keys; SR-18 `deg(s_v) = 2` collapse; SR-19 distinction rows; SR-20 `Q_j` lead | SR-18 confirmed; SR-16, 17, 19, 20 confirmed_with_repairs |

Zero rejections, zero unresolved. Strongest repairs: SR-14(b) (switch necessity is proved only within the `CB(d, m)` family; trees
of other shapes at orders 20–1464 are untested); SR-13 (acyclicity, not bipartiteness alone, carries the Hall step); SR-5 (the
`(⇐)` direction of INV is (LIFT) in Hall form and must cite it); SR-9 (P8's hypothesis `v ∈ F_p`, `2 ≤ p ≤ dm + 1` is
load-bearing); SR-4 (the `p ≥ 1` guard is load-bearing for the general-`F` form only).

## 6. Standing facts of record entering Cycle 2

- Every eligible row of free trees at orders 11–19 (195,683 rows; order 19 by one critic only) saturates with DELETION ARCS ALONE;
  no census row exercises a switch arc (`bounded_computation`).
- In the `CB(d, m)` family the root-plus-arm sector is deletion-deficient iff `3p < 2dm + 5` (P8, `proved_informal`, STATED and
  second-read); first such row `CB(8, 86)`, `p = 460` (`n = 1465`); with `n ≤ 1600` exactly three: `CB(8, 86)`/460,
  `CB(8, 89)`/476, `CB(8, 92)`/492; whole-sector switch exits exceed the deficit by 6,128.8×, 6,563.1×, 7,012.3× (T1's Cycle 1
  figure 76 missed the factor `m`).
- `CB(8, 92)` record: `n = 1567`, `α = 829`, `x = 490`, eligible window `[492, 552]`, 737 favorable leaves, sector weight one,
  sector ratio `492/491`, deletion-only shortfall `|R_490|/491`; Lemma C (sector Hall at every eligible `p`): `proved_informal`
  for `p ≥ 493`, `computer_assisted` at 492 with the spectral node (n1) cited, not proved.
- On every computed eligible row `F_p(T)` is the whole leaf set (the fixed selector has never bound).
- Eligible trees with a positive-weight arc-unreachable target exist from order 14 (11 of 313 rows; also 24 at order 17, 43 at
  order 18); (HALL) at `X = I_{p+1}` is strictly stronger than `S ≤ 0` there and still saturates; no separating instance on trees;
  one on the non-tree `P_3 ⊔ K_{6,3,3,3}` at `p = 4` (`S = −2`; supply 46, capacity 48, max flow 36).
- Budget hierarchy: `D + C ≥ (2α + 1 − 3p)·Q ⟺ Q_p ≤ Q_{p−1} ⟺ S ≤ 0` on eligible rows (SR-16); the `Q_j` monotone /
  log-concave lead is a lead, not a claim.
- Refuted or narrowed this cycle: T1's vacuous `Aut(T)` hypothesis for NM (the symmetry is the abstract `S_N ≀ (ℤ/2)^N`); T2's
  non-falsifiable balancing checks (struck); F1's "closed band skip" (the order-band theorems close the SIGN, not the flows) and
  its 515/1043/3806 reconciliation claim; U1's compression claim (reversed).

## 7. Errata, incidents and process record

- **R30-E-a** (SEMANTIC-CONTRACT §1.1): smallest eligible tree order is 11, not 13 (five trees; `α = 9`, `x = 4`, `p = 6`).
- **R30-E-b** (SEMANTIC-CONTRACT §1.2; found by critic C-U2-F): the active-tag test is `B ∩ W_v ≠ ∅`; the prose shortcut
  `(B ∖ {v}) ∩ W_v = B ∩ N(s_v)` and the paraphrase `B ∩ N_T(s_v) ≠ ∅` are wrong as written. Every instrument used the correct test.
- **R30-I-1**: Stage 4 sealed while C-U1-F was still writing; sealed bytes restored from the transcript; late version preserved
  unsealed; U adjudicator notified (R30-N-5). Lesson: a stage seal waits for every seat's completion notification.
- **R30-I-2**: the controller's cycle-close registration rewrote `control/CLAIM-IDENTITY.run-local.json`, a member of all five
  second-read capsules, while the readers were active (detected by SR-REACH). The sealed bytes are preserved as
  `control/snapshots/CLAIM-IDENTITY.run-local.c1-stage2.json` and every reader verified them at start; no read is invalidated; the
  drift is declared expected and recorded. Lesson: never rewrite a capsule member before that stage's packet is sealed.
- Orphaned critic wrappers killed by literal PID after the Stage 4 seal (R30-N-4). Seat deviations recorded in the adjudications
  and the synthesis (F1 `ps aux` listings; F2 `__pycache__` under `sources/`; non-recursive listings above grant).
- Both formalizers wrote their own fidelity-audit input despite step 8; superseded by the canonical controller regeneration.
- Path-literal quotation records: `control/C1-STAGE{2,5,7}-PATH-LITERAL-QUOTATION-RECORD.json`.

## 8. Stop gate and continuation

SOLUTION-CONTRACT §5: recorded, not armed in Cycle 1 (unarmed-early rule). No decisive event occurred: (HALL) is neither
`proved_informal` at full scope nor REFUTED. Material progress `yes`, plateau `no`, `continue: yes` (synthesis, concurred by all
three adjudicators and the controller). **The stop gate is ARMED from this close.** Cycle 2 proceeds under
`control/C2-ALLOCATION.md`; the six-cycle ceiling stands; a controller checkpoint follows Cycle 3.

## 9. Cycle 2 portfolio (binding text in `control/C2-ALLOCATION.md`)

| Seat | Route |
|---|---|
| T1 | `C2-T-01 CB-FAMILY-FULL-NETWORK-HALL` |
| T2 | `C2-T-02 WEIGHTED-SECTOR-LYM-BEYOND-PAIRS` |
| F1 | `C2-F-01 SWITCH-NECESSARY-REGIME-CUT-SEARCH` |
| F2 | `C2-F-02 SELECTOR-BINDING-AND-UNREACHABLE-CAPACITY` |
| U1 | `C2-U-01 LEAN-INV-AND-SECTOR-FORMALIZATION` |
| U2 | `C2-U-02 EQUITABLE-PARTITION-LIFT-AND-CB-SWITCH-NETWORK` |
