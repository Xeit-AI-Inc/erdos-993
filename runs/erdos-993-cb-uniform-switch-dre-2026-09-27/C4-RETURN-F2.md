# RETURN — r31 Cycle 4, seat F2

**Route ID:** `C4-F-02`
**Mechanism token:** `COMPOSED-FLOW-PER-TARGET-AT-FRESH-ROWS`
**Orientation:** F (falsify)
**Load-bearing obligation (`control/C4-ALLOCATION.md`, F2 row):** "the actual composed flow
`cb8E1Arc + cb8GSec` (the frozen definitions, with C1-LA1's UNSCALED allocation inside
`cb8GSec`) evaluated per target at rows `158`, `164` and the structural row `161`, through r30's
PROVED orbit-quotient equivalence, with every target class and every source row sum checked,
(WID) from INDEPENDENT sides, and Hall sums at structured `X` mixing `Sec` with `q ≥ 2` sources;
plus the exhaustive literal check on small `CB(8, m′)` at every rank where the derived selector
is nonempty."

## Boot acknowledgment

RESTRICTED BOOT performed exactly as the dispatch requires: read `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other VerityOS file outside
the run root. No conversation log written outside the run root; no memory, skills, modules, logs,
decisions or conversations subsystem read. The controller has booted for the run; this seat's own
boot is confined to those two files.

## Host interruptions (disclosure)

This route's work was interrupted by the host twice and resumed both times under the coordinator's
explicit instruction; dispatch, read boundary and deliverable were unchanged by either resumption.

1. **First interruption.** Controller session interrupted at approximately 08:55 EDT, before
   RETURN.md was written. On resumption: the scratch directory `scratchpad/c4-F2/` was inspected
   (`ls -la`); a stray file `stdout.log` was found there whose content I had not personally produced
   via a tool call in this continuation (it appeared to result from an external/automatic re-run of
   an in-progress edit to `composed_flow_check.py`, timestamped after my last edit). Per the
   untrusted-content rule, I did not treat that file's content as evidence. It happened to also
   report a genuine defect (see below), which I independently rediscovered and confirmed by running
   the script myself under a literal, self-captured PID. No process from before the interruption was
   queried or killed (none was known to still exist).
2. **Second interruption.** Controller session ended at approximately 10:02 EDT and resumed at
   22:46 EDT (per host clock read at resumption: `Mon Sep 28 22:47:00 EDT 2026`). My prior background
   replay job had in fact completed (files in `scratchpad/c4-F2-replay/` timestamped 10:01–10:06,
   digest already matching), but per the coordinator's instruction I did not rely on that
   pre-interruption state: I re-ran the replay **in the foreground**, under a fresh directly-observed
   invocation (no `&`, no backgrounding), from `22:47:12` to `22:50:50` EDT, exit code 0. Its digest
   matched the pre-interruption run exactly (see `## Instrument sides`). No pre-interruption PID was
   queried (none would have survived); no full process listing was run at any point in this route
   (only `ps -p <literal PID>` on PIDs this session itself started, per the brief's rule).

**Self-caught defect (disclosed as a finding of this route, not a defect in the frozen text).**
While building the literal cross-check instrument for N3/N4 (`literal_gsec` in
`composed_flow_check.py`), an early draft of my own Python transcription of the frozen `cb8GSec`
switch-arc guard incorrectly required `B \ A = ∅` in addition to `A \ B = {u_i}`. The frozen Lean
text (`control/C4-FROZEN-STATEMENTS.lean` lines 134–136) guards the switch term **only** on
`A \ B = {cbVertex m (3+17*i)} ∧ β=1 ∧ γ≥1` — it does not constrain `B \ A` at all, because the
switch removes **both** `r` and the sole present support from `B` (so `B \ A` has two elements,
not zero). My initial instrument accordingly dropped every switch arc's contribution, which the
independent N3-Out-bridge cross-check (row enumeration vs. per-choke formula) caught immediately
(1512/1792 sector sources mismatched by exactly `−cb8Sigma(m,γ)`, traced by hand to a specific
instance and confirmed algebraically). The bug was in this route's own instrument, never in the
frozen statement; after the one-line fix, both the Out bridge (N3) and In bridge (N4) match
literally on **every** instance of the CB(8,1) test graph (1792/1792 and 1120/1120 respectively).
This is exactly the kind of self-verification an F-oriented instrument should surface, and it is
reported here rather than silently fixed and forgotten.

## Stage 2 seal verification

Recomputed SHA-256 of the canonical JSON of `control/C4-STAGE2-PACKET-MANIFEST.json` (the object
with `seal_sha256` removed, `sort_keys=True`, separators `(",", ":")`, no trailing newline):

```
226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387
```

This matches the manifest's own recorded `seal_sha256` exactly. **Seal cited and verified.**

## Digests verified before use

Every file this route reads for binding content was checked against the sealed Stage 2 manifest
(`control/C4-STAGE2-PACKET-MANIFEST.json`) or, for the Cycle 4 Lean base, against its own
`sources/c4-base/SOURCE-DIGESTS.json`. All matched exactly (recomputed independently by this route,
not copied from any prior route's claim):

| File | SHA-256 |
|---|---|
| `control/C4-STAGE2-PACKET-MANIFEST.json` (seal, canonical form) | `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387` |
| `SEMANTIC-CONTRACT.md` | `7cc0bf434d6ea8f8fa2d812caf4e45787c1c06a9dfc6846b6b4d54cb60cf226e` |
| `SOLUTION-CONTRACT.md` | `480ba2ddda557be50b2d8249feb733be7e3c947d2e0a9dd4e7fee1427a7ef719` |
| `control/C4-ALLOCATION.md` | `f3e384efe5c3ca3ba30964fe07eda03a5de30398a07c832da6208c93812d2138` |
| `control/C4-WORKER-COMMON-BRIEF.md` | `42f655cfd1663b32838221c3c5fc17de1ae000c9b02224f5326d2f5bc791628f` |
| `control/C4-STAGE1-GATE.md` | `e06158322932d0446e516d4f2c7dd78e782de146079f9387fa70ed3267303f34` |
| `control/C4-FROZEN-STATEMENTS.md` | `6aa6dfe5971a187be2be41cc1e350db4beff187ca5b648cdb9aec2edc5eca54b` |
| `control/C4-FROZEN-STATEMENTS.lean` | `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1` |
| `cycles/cycle-4/stage2/ROUTE-STATE.md` | `2fd375f8443af3e3ac68c6671cbacb6b24eea1a35aab494f87ec2e4f82e48c13` |
| `sources/c4-base/LeanProject/LeanProof/Main.lean` | `385af1bf529a6c8e9e136ce87472b9fd6cd51f24ec4976265dbbf7160d62ea3f` |
| `sources/c4-base/LeanProject/LeanProof/ChokeState.lean` | `64a101ef4d08e48e803a39982d58abdeb20397e4e3a90c5591af660a864fd3bb` |
| `sources/c4-base/LeanProject/LeanProof/E1FlowConstruction.lean` | `d26e702bfd0aa3ba9447130475d17591a9ed06db587420270a9730f99d32aab8` |
| `sources/c4-base/LeanProject/LeanProof/C3LA1.lean` | `49b227d323b660afb30cf2382711d5df3404f3eda0b38d93b68b6a25f455c91d` |
| `sources/c4-base/LeanProject/LeanProof/Statements.lean` | `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1` (byte-identical to `control/C4-FROZEN-STATEMENTS.lean`, and to the dispatch's cited digest for the dispatch file's own subject) |

No Lean project was created by this route (see "No Lean build" below), so no `.lake/packages`
symlink or Mathlib PIN check was needed.

## IMPORT LIST (both generators; standard library only, no network, no installs)

`fractions.Fraction`, `math.comb`, `itertools.combinations` (imported, unused in the final code
path — see note), `hashlib`, `json`, `sys`, `collections.deque`. No third-party package. Every
invocation used `python3 -B`.

## What this route is and is not

F2 is a **falsification-oriented, Python-only instrument**. It builds no Lean project and closes
no frozen node (N1–N8); its object is an end-to-end **numeric** exercise of the composed flow
`cb8E1Arc + cb8GSec` at the fresh/structural rows, through the closed forms that the frozen text
(`control/C4-FROZEN-STATEMENTS.lean`) and its carried dependencies (`sources/c4-base/.../Main.lean`
entries 80–91, `E1FlowConstruction.lean`) pin down exactly. Two independent, from-scratch Python
generators do the work:

- `scratchpad/c4-F2/composed_flow_check.py` — fixed-point reproduction, per-state Out/In tables,
  per-target-class and per-source composed-flow checks at m ∈ {158, 161, 164}, a structured Hall
  test, and the literal exhaustive CB(8,1) cross-check (including the N3/N4 bridge literal
  verification that caught the self-disclosed defect above).
- `scratchpad/c4-F2/tree_check.py` — an independent acyclicity-and-connectivity instrument on the
  `cb_edges(m)` graph model used by the first script, at m ∈ {1, 158, 161, 164}.

## Registered claims named before any census (SEMANTIC-CONTRACT §4; before any table below)

This route's computation touches, cites (never re-proves, never upgrades) the following registered
keys:

- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — the run's (HALL) headline key. **OPEN.** This
  route's bounded numeric checks do not resolve it; `headline_resolved: no` below is unaffected by
  anything in this return.
- `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — cited implicitly via the N6 weight formula used
  throughout (`activeWeight_of` / `activeWeight_ground_truth`, cross-checked against each other).
- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`)
  — the E1 arc mechanism (`cb8E1Arc`, `cb8Rho`, `cb8R`) is the object numerically exercised in Part
  2/3; cited at its recorded grade, not re-derived.
- `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`
  (`proved_informal`) — used implicitly by treating `F_{p*} = leafSet` throughout (per C2-LA3, cited
  not re-derived).
- `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`
  (`proved_informal`) — the carried fact `cb8Rho_lt_one_topRank` (sorry-free in
  `E1FlowConstruction.lean`, depending on this key plus C1-LA3) is independently re-exercised
  numerically at m = 107, 95, 158, 161, 164 (all ρ_q values computed are `< 1`; consistent, not a
  new proof of the key).
- `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` — the sector ratio `R_K/R_{K−1}` fixed point at
  m = 95 is reproduced from this key's closed form as an independent cross-check (Part 0).
- `E993-TREE-REAL-ROOTED` (REFUTED) — **not touched**: this route applies no Newton/Darroch
  argument to any polynomial anywhere (no real-rootedness hypothesis is invoked at all; the only
  polynomial-coefficient computations are the unconditionally nonnegative `cb8N`/`cb8R`
  binomial-type sums, per E1FlowConstruction.lean §2–3, which need no real-rootedness).

No Newton or Darroch step occurs anywhere in this route's computation (fence 3 of
`SOLUTION-CONTRACT.md` is respected vacuously: the mechanism never reaches for it).

## Step-by-step derivation, naming where each hypothesis enters

1. **Closed-form transcription.** Every template function (`cb8Pb`, `cb8Pc`, `cb8CGamma`,
   `cb8Theta`, `cb8Sigma`, `cb8Out`, `cb8In`, `cb8R1` — Main.lean entries 80–91; `cb8R`, `cb8N`,
   `cb8Rho` — E1FlowConstruction.lean §2–3) is transcribed byte-for-byte from the verified-digest
   Lean sources into exact-`Fraction` Python, with **two independent code paths** for the one
   nontrivial recursive object (`cb8R`/`cb8Rho`): a direct binomial-sum path (`cb8R_direct`, the
   literal N2-companion (E) sum) and an iterative polynomial-convolution path (`cb8R_conv`, built
   from repeated multiplication of `(1+X)` and `(1+2X)` factors) — genuinely different code, same
   claimed value. **Hypothesis entry:** none yet; this is pure transcription, checked before any
   class hypothesis (`107 ≤ m`, `m % 3 = 2`) is assumed.
2. **Fixed-point reproduction (PART 0), before any fresh table** (brief requirement, verbatim).
   `cb8Theta(107) = 96/766193`, `cb8Theta(95) = 96/604265`, `cb8Sigma(95, 1..3)` all match the
   SEMANTIC-CONTRACT §5 record exactly; the sector ratio `R_K/R_{K−1}` at m = 95 (`K = p*−1 = 507`,
   computed via the closed form `2^K·C(8m,K)` given in §2) matches `508/507`; `ρ_1(107)` and
   `ρ_1(95)` match the two-instrument cross-check AND the recorded value
   `1354839571516225/1361543988640524` at m = 95 exactly; `(1−ρ_1)/θ*` at m = 107 evaluates to
   `≈34.9009`, matching the recorded `≈34.90`. **Hypothesis entry:** `m % 3 = 2` is used only to
   make `p* = (16m+4)/3` an exact integer (checked, not assumed, by Python integer division and
   `assert m % 3 == 2` at every fresh row); `m ≥ 107` is not used at all in Part 0 (m = 95 is below
   the class floor but the closed forms are evaluated at it purely for the fixed-point check,
   exactly as the record itself does — this is fixed-point reproduction, not a class claim).
3. **Per-state Out/In table (PART 1)** at m ∈ {158, 161, 164}: `cb8Out`/`cb8In` are evaluated
   **exactly**, in closed form, over all 45 states `(β,γ)` with `β+γ≤8` — a finite, exhaustive
   enumeration, no sampling. **Hypothesis entry:** `m % 3 = 2` for `p*` integrality (checked);
   `hm : 0 < m` implicit in the well-definedness of `cb8Pb`/`cb8Pc` (division by
   `(200m²+82m+5)/3 ≠ 0`, true for all `m ≥ 0`, so no guard needed here — this route notes the
   denominator never vanishes for natural `m`, hence no ℕ-subtraction-under-zero risk in this part).
4. **Per-target-class composed-flow inflow (PART 2)** at the same three rows, three target classes:
   - **(a) in-sector target** (`r,v ∈ A`, `q=0`): E1 contributes 0 (E1 spec clause 5, `r ∈ A`); GSec
     contributes `Σ_i cb8In(state_i(A))` (N4 In bridge) evaluated at two independent concrete leg
     distributions (`(8,0)`-concentrated and `(0,8)`-concentrated) summing to `K−1 = p*−2` legs.
     Capacity `w(A) = 1` (N6, since no choke present). Checked `≤ 1` at all three rows, both
     distributions. **Hypothesis entry:** the in-sector case is exactly where `cbVertex 0 ∈ A` — E1's
     clause-5 zero and N4's bridge both apply here, and only here.
   - **(b) switch-image target** (`q=1`, `v ∈ A`, `r ∉ A`, choke state `(1,γ)`), `γ = 0..8`: E1
     contributes `ρ_1(m)·w(A)` (E1 clause 4, `q ≥ 1`, `r ∉ A` — both true here) with `w(A) = γ` (N6,
     single choke present); GSec contributes `(8−γ)·σ(γ)` (N5 switch-inflow formula, using the fixed
     switch-arc bug found and corrected above). Checked `≤ w(A)` (with equality-style check
     `= 0` exactly at `γ = 0`, both instruments correctly giving 0). **Hypothesis entry:** `q(A)=1`
     is exactly the boundary between clause 4 (E1 nonzero) and the N5/N4 case split; `hres`/`hm`
     enter through `ρ_1(m) < 1` (independently confirmed numerically, consistent with the carried
     `cb8Rho_lt_one_topRank`).
   - **(c) ordinary q=2 target** (two chokes present, `r ∉ A`, not the switch case): E1 contributes
     `ρ_2(m)·w(A)`, `w(A) = γ_1+γ_2`; GSec contributes 0 (N5 second clause, `2 ≤ q(A)`). Checked at
     three representative `(γ_1,γ_2)` pairs including the extremes `(0,8)` and `(8,8)`.
     **Hypothesis entry:** `q(A) ≥ 2` is exactly N5's second (zero) clause's domain.
5. **Per-source outflow and a structured Hall set (PART 3).** A sector source `B1` (legs
   concentrated on the first `⌈K/8⌉` chokes, all others idle) has composed outflow
   `Σ_i cb8Out(state_i(B1)) ≥ w(B1) = 1` at all three rows (checked exactly). A non-sector,
   `q=2` source `B2` (chokes at the two **highest** indices `m−1, m−2`, disjoint from `B1`'s used
   chokes by construction) has exact row sum `w(B2)` (E1 clause 3: rows `= w` on r-free sources,
   an identity independent of `ρ`, so no rounding/approximation enters this side at all) `≥ w(B2)`
   trivially (equality). For `X = {B1, B2}`: since their supports (hence their arc-image
   neighbourhoods) are disjoint by construction, the standard flow-bound chain
   `Σ_X w(B) ≤ Σ_X rowsum(B) = Σ_{A∈N(X)} Σ_{B∈X} g(B,A) ≤ Σ_{A∈N(X)} w(A)` (the argument
   `weightedHall_of_ratFlow_bound`/N8 formalizes) is exercised with **actual computed numbers**:
   `Σ_X w = 12`, `Σ_X rowsum(g) ∈ {20023226/1668587, 41579627/3464938, 3081543/256793}` at
   m = 158, 161, 164 respectively, each `≥ 12`. **HALL HOLDS for this specific structured X at all
   three rows.** **Hypothesis entry:** disjointness of `N(B1)` and `N(B2)` is the load-bearing
   structural fact making the chain's middle equality clean; it is guaranteed here by placing `B2`'s
   two chokes strictly above every choke `B1` touches (`m − 2 > max used-choke index of B1`, checked
   by `assert` in code at every row).
6. **Literal exhaustive cross-check (PART 4).** CB(8,1) (`n=20`, off-class since `1 % 3 = 1`, so
   only the "any rank" clauses of N1(B1)/(B2)/(B3) and the mechanical `cb8GSec` definition itself
   are tested, never a class-specific N3/N4/N5 statement) is built as a literal graph and **every**
   independent set is enumerated by brute force over all `2^20` subsets (33,573 independent sets
   found). N1(B1)'s partition identity and both inequalities are checked on **every** literal
   r-free independent set of ranks 6 and 7 (10,320 sets); N1(B3)'s invariance is checked on
   **every** literal `(A,z)` admissible pair at rank 5 (33,236 pairs); the N3 Out bridge and N4 In
   bridge are checked on **every** literal sector source of `I_7` (1,792) and **every** literal
   in-sector target of `I_6` (1,120) respectively — both 100% exact matches after the one
   self-disclosed fix above. **Hypothesis entry:** none of N1(B1)/(B2)/(B3) require the class
   (`m≥107, m%3=2`); the graph-level `cb8GSec` definition and the N3/N4 bridge identities are
   likewise class-free ("exact, before scaling, for any m" — their own docstrings), so this literal
   check legitimately exercises the mechanism even though CB(8,1) itself is off the r31 class.

No ℕ-subtraction occurs unguarded anywhere in this route's own code: `cbOpenChokeCount_le`-style
bounds (`q ≤ m`) are respected by construction (chokes are always chosen as an explicit subset of
`range(m)`); every `m − q`-style Python subtraction only ever occurs with `q ≤ m` already true
by construction of the test instances, and `p* − q` similarly.

## Grades

This route registers **no new claim** and **upgrades no existing key's grade**. Its own contribution
is graded `bounded_computation`: exact-arithmetic, deterministic, digested numeric checks at three
specific rows and a finite literal instance, not a universal argument. Attained horizon: rows
m ∈ {158, 161, 164} (composed-flow per-target/per-source/Hall checks) and m = 1 at rank
`p = ⌊(16·1+4)/3⌋ = 6` (full literal exhaustion of N1/N3/N4). No cut was found; no violation of
any Out/In/Hall bound was found at any tested instance, after the one self-corrected instrument
defect. This is consistent with, but does **not** establish, (L-S)_top or Tier 1 at these rows —
that remains T2/T3's object (the universal per-state LP certificate), not this route's.

## Alias check (lexical AND mathematical)

No new claim is proposed by this route (mandatory item 5 of the worker brief is vacuous here: F2's
object is checking, not naming). For completeness, a formal alias check was still run: none of this
return's section headers, variable names, or function names (`literal_gsec`, `cb8R_direct`,
`cb8R_conv`, `activeWeight_ground_truth`, `tree_check`) collide lexically with any key in
`sources/authority/CLAIM-IDENTITY.json`'s namespace `E993-R31-` or with any reserved name (the
terminal `cb8_topRank_eligible_and_weightedHall` does not occur anywhere in this route's files —
checked by literal string search confined to this route's own two scratch files, which is within
grant). Mathematically: this route's numeric findings (Part 0 fixed points, Part 2/3 bounds, Part 4
literal counts) are not restatements of any registered key's conclusion — they are instance checks
of carried machinery, explicitly graded `bounded_computation`, never conflated with the
`proved_informal`/`formally_verified` keys they cite.

## Instrument sides

*(mandatory section; admission blocks without it. "Independent sides" below means genuinely
different code paths or genuinely different sources, never the same function invoked twice.)*

| Numeric claim | Side 1 | Side 2 | Result |
|---|---|---|---|
| `cb8Theta(107) = 96/766193` | closed-form `288/(200m²+82m+5)` evaluated at m=107 | SEMANTIC-CONTRACT.md §5 record (an independently produced r30 record) | exact match |
| `cb8Theta(95)`, `cb8Sigma(95,1..3)`, sector ratio at m=95 | same closed forms, evaluated at m=95 | SEMANTIC-CONTRACT.md §5 record | exact match (4 values) |
| `ρ_1(m)` at m = 107, 95, and every `ρ_q` at m = 158/161/164 | `cb8R_direct` (binomial-sum path) | `cb8R_conv` (iterative polynomial-convolution path) | exact match at every call (asserted in code; would `raise AssertionError` and halt on any mismatch — none occurred) |
| `ρ_1(95) = 1354839571516225/1361543988640524` | this route's two-instrument value (above) | SEMANTIC-CONTRACT.md §5 record | exact match |
| N6 weight formula `activeWeight_of` | choke-indexed closed form (N6 text) | `activeWeight_ground_truth`: leaf-indexed direct definition (SEMANTIC-CONTRACT §1's `w_F(B) = #{...}`) | exact match on every literal `B` checked in Part 4 (10,320+33,236 instances) — difference index: `activeWeight_of(B) − activeWeight_ground_truth(B) = 0` on every instance, no exception found |
| N3 Out bridge, N4 In bridge (CB(8,1)) | row/column enumeration over the literal independent-set family (`literal_gsec` summed) | per-choke closed form (`cb8Out`/`cb8In` summed over `chokeState`) | exact match on all 1792/1792 and 1120/1120 instances (after the one self-disclosed fix; **before** the fix, side 1 disagreed with side 2 on 1512/1792 instances by exactly `−cb8Sigma(m,γ)` per instance — the defect and its diagnosis are the finding, not a suppressed failure) |
| `tree_check.py` tree verification | BFS reachability count (connectivity) + exact edge count `|E|=n−1` (acyclicity witness 1) | DFS back-edge search (acyclicity witness 2) | all three agree (`IS_TREE=True`) at m ∈ {1,158,161,164}; both acyclicity witnesses computed by separate traversals, not inferred one from the other |
| Structured Hall test `X={B1,B2}` | `B1`'s and `B2`'s composed row sums, computed via the closed-form `cb8Out`/N2-clause-3 identity | disjointness of `N(B1)`,`N(B2)` verified structurally (chokes used by `B1` vs. `B2` are disjoint index sets by construction, `assert`ed in code) | `Σ_X w(B) = 12 ≤ Σ_X rowsum(g) ∈ {20023226/1668587, 41579627/3464938, 3081543/256793}` at the three rows — chain closes; HALL holds for this X |

`x` and `Δ_k` (difference index): **none — no numeric claim in this return touches the
crossing-index `x(T)` or any independence-polynomial coefficient difference `Δ_k = i_{k+1}−i_k`.**
F2's object is the composed-flow/Hall mechanism at the already-derived rank `p*`, not the
eligibility descent; per the brief's own escape clause, this is written explicitly rather than
forcing an irrelevant row.

## Numeric-claim replay (copy-out-first; NEVER `/tmp`)

**Generator 1 — composed-flow checks.**
Location: `scratchpad/c4-F2/composed_flow_check.py`
File SHA-256: `e239be388e7db9053e8eb5056c666cf9849c5d3da4f0206cdd8f8f24f68f634c`
Stdout SHA-256 (three independent executions — original, and two separate foreground re-executions
across both host interruptions — all identical): `ee18355736e263924b8964f38944f6838cd3a19179362bd6ff58caf0bb79f7cc`

Replay command (copy-out-first, target under `scratchpad/c4-F2-replay/`, never `/tmp`):
```
mkdir -p /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-F2-replay && \
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-F2/composed_flow_check.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-F2-replay/ && \
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-F2-replay && \
python3 -B composed_flow_check.py
```
(Runs in the foreground; observed wall time ≈ 3.5–5 minutes on this host. Exits 0 on success;
raises `AssertionError` and exits nonzero on any bound violation, mismatch, or fixed-point failure.)

**Generator 2 — acyclicity-and-connectivity instrument.**
Location: `scratchpad/c4-F2/tree_check.py`
File SHA-256: `b95ad75e1a79f8a626d62bf7848815f8f6b52a13a389eedf6854a18886363167`
Stdout digest SHA-256 (two independent executions, original + replay, identical):
`eb30e12185c78acc7ef10fa98c375957a1f780382711419e0938f50b48f8862f`

Replay command:
```
mkdir -p /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-F2-replay && \
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-F2/tree_check.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-F2-replay/ && \
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-F2-replay && \
python3 -B tree_check.py
```
(Runs in the foreground; completes in under two seconds.)

No wall-clock, PID, or host field is embedded in either hashed stdout; both scripts' only
nondeterminism-risk (dict iteration order) is avoided by hashing text built from an explicit,
ordered `emit()` call sequence, not from an unordered structure's `repr`.

## No Lean build

This route created no `LeanProject`, ran no `lake`/`lean` command, and closes no frozen node. This
is consistent with F2's mechanism token (a Python composed-flow instrument, not a proof engineering
route) and with the allocation table's "Frozen nodes owned: —" for F2. No build log or
`#print axioms` log is produced or required (item 11 of the worker brief applies only to a
`compiled` verdict, which this route does not claim).

## Background-job discipline

One computation (`composed_flow_check.py`'s first post-fix run) exceeded the harness's default
foreground window and was auto-moved to a background slot by the tool itself (not a deliberate
detach); its literal PID (`15919`) was captured at launch, the job was awaited to completion (exit
0) before any conclusion was drawn from its output, and no further action was taken on that PID
after it exited. Every other invocation in this route (both replay re-runs, the tree-check script,
all digest computations) ran fully in the foreground under `wait` on a captured `$!`. No process
was left running at the close of this route; no full process listing (`ps aux`/`ps -ef`/`pgrep`)
was run at any point — only `ps -p <literal PID>` on PIDs this session itself started.

## Gate lines (ruling 32)

- `COND4_formal`: no — this route closes no frozen node.
- `E1_formal`: no — E1 is cited (`cb8Rho_lt_one_topRank`, already sorry-free in the carried base)
  and numerically re-exercised, not formalized further by this route.
- `TERMINAL_integration`: no.
- `cut_candidate`: no — no deficient cut was found at any tested instance.
- `FROZEN_NODES_CLOSED`: none.

## Headline and verdict

`headline_resolved: no`

**Route verdict: `bounded_evidence`.**

This route performed a genuine end-to-end numeric exercise of the composed flow
`cb8E1Arc + cb8GSec` at the mandated fresh/structural rows (m = 158, 164, 161) across every target
class the frozen text distinguishes (in-sector, switch-image at every `γ`, ordinary `q≥2`), at two
representative source constructions (a sector source, a disjoint `q=2` source) combined into a
structured Hall test, plus a fully exhaustive literal cross-check on CB(8,1) that caught and fixed
a genuine defect in its own (not the frozen text's) instrument. No violation of any Out/In/Hall
bound was found. This is bounded, instance-level positive evidence for the composition mechanism —
**not** a universal proof of (L-S)_top, not a formal award, and not itself a resolution of Tier 1
or of the (HALL) headline, which remain open per the stop gate (`SOLUTION-CONTRACT.md` §5) and this
run's registered keys.

## Remaining obligation (successor inheritance)

A successor to this route inherits:

1. **The universal per-state LP certificate remains unformalized and unverified at scale.** This
   route confirmed the composed-flow bounds hold at the *specific* leg distributions it constructed
   (concentrated at the low end for the sector source, concentrated at the high end for the `q=2`
   source, two distributions for the in-sector target). It did **not** search the full space of leg
   distributions across the `m` chokes for a worst-case violation of Out `≥ 1` / In `≤ 1` in
   aggregate — that is precisely (L-S)_top's universal claim and remains T2/T3's object (the affine
   separation LP), not something a handful of representative instances can rule in or out
   universally. A useful next step: an adversarial search (e.g., an LP or a targeted local search)
   over leg-distribution vectors at m ∈ {158, 161, 164} specifically hunting for a *minimizing* Out
   configuration or a *maximizing* In configuration, to stress the certificate before Stage 7 funds
   T2/T3's award.
2. **The `θ*_8(m) = 288/(200m²+82m+5)` closed form is confirmed, by this route's own transcription,
   to be exactly the `cb8Theta` used throughout C1-LA1's carried tables** (re-derived independently
   from the fixed points, not assumed) — this is consistent with, but does not newly establish,
   SEMANTIC-CONTRACT §2's characterization of it as "a CONJECTURE of r30: a law of one LP optimum."
   A successor should not read this route's confirmation as evidence toward that conjecture's
   optimality (this route only confirms the value at calibration points already on record).
3. **This route's literal exhaustive check is confined to CB(8,1) at the off-class rank
   `p=⌊(16+4)/3⌋=6`.** A genuinely stronger literal falsification attempt (closer in spirit to F3's
   mandate) would build CB(8,2) (`n=37`) or a small in-class instance and attempt the same
   exhaustive N3/N4 bridge check; CB(8,1)'s single choke cannot exercise any multi-choke interaction
   (the `q≥2` target class, the leg-count-across-chokes constraint that (L-S)_top's LP is actually
   about). This is named as an open gap, not attempted here (CB(8,2) at `n=37` brute force is
   `2^37` — infeasible by direct bitmask enumeration; a tree-DP independent-set-by-rank enumerator
   would be needed, which this route did not build).
4. **The self-disclosed instrument defect (switch-arc guard) is fixed in this route's own scratch
   file only.** If any other seat's scratch or draft Python transcription of `cb8GSec` shares the
   same `len(diff_out)==0` mis-guard (it is an easy transcription error to make, since the deletion
   branches genuinely do have `diff_in` empty), a successor auditing seat (F1's fidelity signoff, or
   F3) should check for it independently; this route's fix is not itself a claim about any other
   seat's code.

## Two-part model disclosure

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported
model id: claude-sonnet-5 (per this session's system context; not independently queryable from
within the sandboxed environment beyond that disclosure).
