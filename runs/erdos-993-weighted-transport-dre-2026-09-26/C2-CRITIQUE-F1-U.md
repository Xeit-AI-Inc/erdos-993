# Critique

Critic `C-F1-U` (orientation U, formal/structural) on the return of seat `F1`, route `C2-F-01 SWITCH-NECESSARY-REGIME-CUT-SEARCH`
(orientation F), Cycle 2, r30 (Erdős #993, weighted mixed-boundary transport). Critic: Claude, VerityOS DRE critic seat.

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I read no other VerityOS file outside this run root. The
read-boundary items are listed under `## Identity and seal audit`.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Dispatch.** `control/dispatch/c2-stage4/DISPATCH-C-F1-U.md`: `shasum -a 256` gave
  `d17048bd6f2087279d891d8a5135e8982a4ce3efae1121c136b5f58849aa5c59`, which matches the wrapper. I checked it before reading. The Stage 4
  dispatch manifest lists 12 control files and no per-seat dispatch files, so the wrapper value is the only reference for this digest.
- **Capsule seal.** `control/c2-critic-capsules/F1-PACKET-MANIFEST.json`. I recomputed it canonically (SHA-256 of the key-sorted JSON
  with separators `(",", ":")`, `seal_sha256` removed, no trailing newline) and got
  `f2bd5105977eb29d6bbebe6320982f34620772606cf2c8b62d6eafcc922c739a`, which matches the stored seal. All 13 members match on bytes and SHA-256.
- **Nested seals, all recomputed canonically:**
  - Stage 2 `C2-STAGE2-PACKET-MANIFEST.json`: `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`. This matches both the
    stored seal and the protocol value.
  - Stage 3 `C2-STAGE3-PACKET-MANIFEST.json`: `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d`. Matches.
  - Stage 4 dispatch `C2-STAGE4-DISPATCH-MANIFEST.json`: `a361cd175e7c3968cdf2a8d14f92e9b2b5883b018bd72e837f54f26ce38da383`. Matches.
  - The return's `RETURN.md` digest (`fdc74dd1…`) appears in both the capsule and the Stage 3 manifest.
  - F1's reported dispatch digest `18f85237…` equals the Stage 3 manifest entry for `DISPATCH-F1.md`.
  - `PATH-CHECK-F1.json`: 0 findings.
- **Return-listed digests.** I checked every digest the return cites (13 files under `scratchpad/c2-F1-replay/`) against both
  `scratchpad/c2-F1/` and `c2-F1-replay/`. All 13 match exactly and each pair has parity. F1 does not cite digests for
  `cb_closed_form.py` (`18f314b2…`) or `flow_instrument.py` (`e80d1eab…`); these also have parity across the two directories.
- **Replay parity of outputs.** I copied all artifacts into `scratchpad/c2-crit-F1-U/replay/` before running anything, then re-ran all
  eight generators there.
  - `grid_search_results.json`, `deletion_only_check.json` and `pendant_pair_sweep.json` came out byte-identical. The internal payload
    digest `cae37805…` reproduced.
  - `caterpillar_sweep.json` and `heterogeneous_cb_sweep.json` are content-identical once the wall-clock `elapsed_s` and self-digest
    fields are excluded. The `[4,4,4,4]` flow timeout reproduced.
  - `validate_fixed_points.py`, `cb_closed_form.py` and `pendant_pair_caterpillar.py` pass.
- **Read-boundary disclosures (mine):**
  1. I read `control/C2-WORKER-COMMON-BRIEF.md`: one `grep` for fixed-point text, then lines 60–75. It is a Stage 2 member, and I verified
     its digest against the Stage 2 manifest first. The capsule does not list it, but the capsule's `C2-CRITIC-COMMON-BRIEF.md` names it as
     readable. I read it only to trace where F1's cited fixed points come from.
  2. I ran non-recursive `ls` on `scratchpad/c2-F1/` and `scratchpad/c2-F1-replay/`, and hashed the files in both. The attack brief
     directs this parity check.
  3. I ran one non-recursive `ls` on my own output parent `cycles/cycle-2/stage4/critics/F1/`, which did not exist yet.
  4. I ran `grep` on single named capsule files only. The one `find` I ran was rooted in my own scratch directory.
  5. The harness saved the Read-tool output of `RETURN.md` to its own tool-results file outside the run. I wrote nothing there myself.

  I did not read any other return, critique, adjudication, Cycle 1 record, `sources/` file, live root or external source. I used no
  network and installed nothing. No background job was started, and none is running.
- **Process findings on F1** (the attack brief asks for these to be recorded):
  - F1 discloses two prohibited full process listings (`ps aux | grep …`), one of which exposed sibling seats' PIDs and command lines.
    It also discloses two non-recursive `ls` calls in `cycles/cycle-1/stage4/critics/`. Nothing in the return's evidence depends on
    either.
  - F1's scratch `c2-F1/` holds a `__pycache__/` that is not in the inventory (harmless).

## Independent re-derivation

**Instrument.** My instrument is `scratchpad/c2-crit-F1-U/own/core.py`, written only from SEMANTIC-CONTRACT §1.2, with bitmask sets.
It covers:
- a forest independence-polynomial DP;
- `x` scanned through rank `α`, including `Δ_α = −i_α`;
- `F_p` computed from `Δ_p(T − v)` on the original tree;
- the active weight `v ∈ F ∩ B` with `(B ∖ {v}) ∩ W_v ≠ ∅`, where `W_v = N(s_v) ∖ {v}`;
- the literal relation (D) ∪ (S), with a lookup that raises an error on any non-independent or wrong-size target instead of dropping it;
- an array-based Dinic max-flow;
- `S` computed directly from `H_v` and `R_v`, with `supply − capacity = S` asserted on every instance.

**Fixed points** (`own/fixed_points.json`). All reproduce exactly:

| Instance | Values reproduced |
|---|---|
| `K_{1,12}`/8 | 1980/3960/−1980; no switch arcs; deletion-only flow saturates |
| path-star `(2,3,4)`/7 | 1483/2701/−1218; flow 1483; 2025 arcs |
| path-star `(2,2,4,3)`/8 | 8033/13467/−5434; flow 8033; 11691 arcs |
| double broom/6 | 255/516/−261 |
| `CB(1,7)`/10 | 29190/58002/−28812; saturating (F1 checked only `n, α, x` for this one) |
| `P_3 ⊔ K_{6,3,3,3}`/4 | 46/48/−2; flow 36; Hall fails. This validates the deficit side of my flow code |
| `CB(8,86)`/460 (`own/cb_rows.json`) | `n = 1465`, `α = 775`, `x = 458`, eligible `[460, 516]`, sector ratio `460/459` |
| `CB(8,92)`/492 | `n = 1567`, `α = 829`, `x = 490`, all 737 leaves favorable, `S < 0` (exact value in JSON), ratio `492/491` |

- Sector weight one: I brute-checked on `CB(2,3)` that all 729 root-plus-arm members have weight 1.
- `T_m` is not reached by F1's mechanism, and its structure is not defined in my capsule text, so I did not reproduce it.

**CB closed form and sweep** (`own/cb_sweep.py`). I derived the CB polynomial independently by the recursion at `r`:
`I = (1+2x)·[(1+2x)^d + x(1+x)^d]^m + x(1+x)(1+2x)^{dm}`. It agrees with the generic DP on 8 explicit trees.

I re-derived the sector criterion myself. With `r, v ∈ B`:
- no choke and no `s` can be in `B`;
- the arm tag `v` is active through `r`;
- every private tag `c_ij` is inactive, because its only witness `u_i` is absent.

So every member has weight 1. The members are `{r, v} ∪ Y` with `Y` a choice of `p − 1` nonzero coordinates in `{0,1,2}^{dm}`, so there
are `|R_{p−1}| = 2^{p−1}C(dm, p−1)` of them. Deleting `r` or `v` gives a weight-0 target; deleting a pair vertex gives an `R_{p−2}` member of
weight 1. The sector is therefore deletion-deficient iff `2(dm − p + 2)/(p − 1) > 1`, that is, iff **`3p < 2dm + 5`**. This matches F1's
screen.

Sweeping every `(d, m)` with `n = 3 + m(2d+1) ≤ 1600` at every eligible `p` gives 4974 configurations (4482 of them with `n < 1465`, which
equals F1's `configs_tested`). There are **zero hits with `n < 1465`**. The hits up to 1600 are exactly `CB(8,86)`/460, `CB(8,89)`/476 and
`CB(8,92)`/492, each at a single `p`. This agrees with the allocation's "three sector-deficient CB rows with `n ≤ 1600`" and with the
digit-identical `CB(2,2)` polynomial.

**F1's caterpillar table** (`own/bare_cat.json`). My brute-force instrument reproduces all 9 rows, every field (supply, capacity, `S`,
saturation, deletion-only saturation), exactly.

**Pendant-pair caterpillar `PPC(L,k)`** (`own/ppc_scan.py`). This is my own transfer form along the spine; it agrees with the generic DP
on 8 explicit trees.
- The smallest eligible instance over **all** `L ≥ 1`, `k ≥ 1` is `(L,k) = (7,2)`: `n = 35`, `α = 18`, `x = 10`, unique eligible
  `p = 12`, `|F| = 14`, `i_13 = 3,070,508`. F1's count of 3,070,508 is therefore reproduced.
- On F1's stated domain (`2 ≤ L < 60`, `1 ≤ k < 20`, `n ≤ 300`) there are 298 eligible pairs (1115 rows). Excluding `(7,2)` leaves 297,
  which reproduces F1's "297".

## Attacks and findings

**A1. Fidelity: passes.** F1's `flow_instrument.py` does all of the following:
- counts active tags literally;
- builds switches only for `u ∉ B` with `|N(u) ∩ B| = 2`;
- fixes `F` from `Δ_p(T − v)` on the original tree;
- scans `x` through `α` with zero extension;
- asserts `supply − capacity = S` against an independent `S` in every script that reports a flow row.

My instrument agrees with it on every shared row. I found no fidelity failure, so no number is struck for fidelity.

**A2. The CB sweep is exhaustive over rows for one sector shape only. This is the main narrowing.** `grid_search.py` tests only
`3p < 2dm + 5`. That is the root-plus-arm sector criterion (P8), and it says nothing about subfamilies outside `X_sec = {r, v ∈ B}`. So
"no deletion-deficient CB row with `n < 1465`" is not established. What is established is: *no eligible CB row with `n < 1465` has a
deletion-deficient root-plus-arm sector*.

A deficit from another sector (for example `s ∈ B`, or chokes present with private tags active) is untested for
`114 < n < 1465`. Below `n ≤ 114` the only coverage is the Cycle 1 orbit-quotient rows at their recorded grade. The return's "no
deletion-deficient row smaller than `CB(8,86)` was found anywhere searched" has to be read with this scope.

**A3. The general-tree gap is unchanged.** F1's mandate was the smallest tree of any shape. Its evidence covers:
- CB(d,m), under the one-sector screen;
- one caterpillar family at `n ≤ 24`, only at the smallest eligible `p`;
- no completed PPC row;
- no eligible heterogeneous-choke row.

The interval from order 20 to 1464 remains open for general trees. F1's `bounded_evidence` verdict must not be read as "no tree of order
20–1464 is deletion-deficient". F1's own final paragraph says as much, but its Part (b) sentence ("anywhere searched") should be read
the same way.

**A4. The "heterogeneous choke" family has zero eligible heterogeneous rows.** Of F1's 14 degree lists, 8 are uniform, which makes them
ordinary `CB(d, m)` trees:
- `[8]`, `[12]`, `[20]`, `[30]`
- `[4,4]`, `[8,8]`, `[4,4,4]`, `[4,4,4,4]`

The only eligible configuration, `[4,4,4,4]` (`n = 39`, `p = 14`), is `CB(4,4)`. The exhaustive CB screen already covers it, and it lies
inside the Cycle 1 CB orbit-quotient range `n ≤ 114`. All 6 genuinely heterogeneous lists (`[8,4]`, `[12,4]`, `[16,2]`, `[8,4,2]`,
`[6,6,2]`, `[8,2,2,2]`) are non-eligible; my DP reproduces F1's `α` and `x` for each. So the family contributed no heterogeneous test.

**A5. The caterpillar rows are tested at the smallest eligible `p` only, and 5 of the 9 repeat already-saturating rows.**
`adversarial_sweep.py` sets `p = elig[0]`. Four of the nine trees have a second eligible rank that F1 never tested:
- `n = 18` `(3,5)`, `p = 10`
- `n = 21` `(3,6)`, `p = 12`
- `n = 20` `(5,3)`, `p = 10`
- `n = 24` `(6,3)`, `p = 12`

I tested all four (below).

Rows of order `≤ 19` (`n = 12, 15, 16, 18, 18`) lie inside the Cycle 1 exhaustive census of free trees, orders 11–19, whose rows all
saturate with deletion arcs alone. Under ruling 13 a repeated census of already-saturating rows is not evidence. F1's "extends … from
`n = 12` to `n = 24`" is new only for `n = 20, 21, 24`, and only at `p = elig[0]`.

**A6. Fixed-point provenance is mis-cited.**
- The return says the double broom is "the fourth fixed point of SEMANTIC-CONTRACT.md's list".
- `validate_fixed_points.py` and `cb_closed_form.py` say the double broom and `CB(1,7)` are "quoted verbatim in SEMANTIC-CONTRACT.md
  Sec 1.2".

The sealed `SEMANTIC-CONTRACT.md` (`ee7ca2e2…`) contains neither: `grep` for `broom`, `CB(1` and `order-11` finds nothing. Both come from
`control/C2-WORKER-COMMON-BRIEF.md` (line 67, "Cycle 1 added"). The values are correct; only the citation is wrong.

That same brief line lists fixed points F1's mechanism reaches but F1 did not reproduce:
- `CB(1,7)` at `p = 10` (supply/capacity/`S`/saturation);
- `CB(8,86)` (`α = 775`, `x = 458`, ratio `460/459`) — F1's own sweep boundary;
- `CB(8,92)`'s `S < 0`, 737 favorable leaves, sector weight one and `492/491`.

I reproduced all of these (see `## Independent re-derivation`). The gap is closed by the critic, not by the return.

**A7. The grade of P8 is cited inconsistently.**
- The return calls the criterion a Cycle 1 critic finding A3, "STATED, needs an isolated second read".
- `grid_search.py`'s docstring says "STATED + second read SR-8..10".
- The allocation's standing state (a capsule member) records it in `R30-CB-RECORD` (criterion P8, P9) at the Cycle 1 close.

The allocation governs, so the return's "second read pending" is stale. Nothing downstream depends on this, because I re-derived P8
above.

**A8. The PPC "no eligible instance below `n = 35`" claim is true, but the cited artifact does not back it.**
`pendant_pair_sweep.json` covers only `3 ≤ L ≤ 9` at `n ≤ 32`. It omits `L = 1`, `L = 2` (for example `(2,8)`, `n = 34`) and `(10,1)`,
`n = 30`. My full scan confirms the claim. The "closed-form eligibility scan over `L ∈ [2,60)`, `k ∈ [1,20)`" and the "3,070,508 sets in
10.2 s" enumeration have no shipped script or output.

The words "found every eligible `(L,k)`" with `n ≤ 300` are false for that domain. Over all `L, k` there are **352** eligible pairs (1530
rows) with `n ≤ 300`; F1's truncation at `L < 60` (and `k < 20`, `L ≥ 2`) misses 54 of them.

**A9. Quantifier and direction checks: pass.**
- "Deletion-only saturating ⇒ mixed saturating" holds, because the arc set only grows.
- No deletion-only result is reported as a (CUT), consistent with ruling 15.
- F1 claims no cut and no universal statement.
- Eligibility is checked in ℕ without subtraction.
- `d ≤ 730` is exactly the `m = 1` bound for `n < 1465`.

## Mechanism-equivalence and fence check

- F1 proposes no mechanism. It runs a search whose screen is deletion-only Hall under the **active** weight. It separates this from
  `E993-R23-LITERAL-DELETE-ONLY-HALL` by relation (it also tests (D) ∪ (S)) and by weight (literal `w_F`, stated in its preamble). That is
  adequate under ruling 15, though the sector object is not named on the face.
- No refuted key is revived.
- No closed region is re-proved.
- No census value enters a proof.
- No RTree wording is used.
- No live root is read.
- Imports: (WID) is used as an assertion (`formally_verified`, C1-LA1). The return cites no non-existent award label; "C1-LA1" is the only
  one it cites.
- Fence §3.4, repeated census: finding A5 applies.
- My own advance (below) uses (LIFT) `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` (VERIFIED, `proved_informal`), which is (INV)'s
  `(⇐)` direction. It applies to both the deletion-only network and the (D) ∪ (S) network:
  - `G = (S_k)^L` permutes the pendant units at each spine vertex. These are tree automorphisms.
  - `F` is `G`-invariant. I asserted per slot that the favorable status of every leaf at a spine vertex is identical, and that it
    equals `favorable()`.
  - Automorphisms preserve supports, witnesses, (D) and (S).
  - Supplies and capacities are orbit totals.
  - An orbit arc exists iff some arc joins the two orbits. I validated this exactly, as described under the advance.

  (LIFT) is used only to lift a *saturating* quotient flow. It is never used to supply quotient feasibility, which is computed.

## Certification audit

| Literal in the return | Status |
|---|---|
| 13 artifact digests; replay parity | **Backed.** Recomputed; parity holds; outputs replay (byte- or content-identical). |
| "All FOUR quoted fixed points reproduced exactly" | **Backed** as to values. "quoted in SEMANTIC-CONTRACT.md" is **struck** (A6). |
| "reproduced by a Cycle-2 F1 instrument for the first time (Cycle 1 F1 validated only three)" | **Struck.** Nothing in the shipped evidence backs it, and the Cycle 1 record is outside my boundary. |
| CB closed form; `CB(2,2)` polynomial; `CB(1,7)` and `CB(8,92)` `n/α/x` | **Backed** (replayed; independently re-derived). |
| "compared term-by-term: identical, just written in a different grouping" (vs the Cycle 1 critic's formula) | **Struck** as unbacked. No comparison artifact exists. |
| `configs_tested=4482`; "zero hits"; "exhaustive … ENTIRE CB(d,m) parameter space" | **Backed, narrowed:** exhaustive over rows for the root-plus-arm sector criterion only (A2). |
| "`CB(8,86)` … unique smallest `(d,m,p)` meeting this" | **Backed** under the P8 screen. |
| "WID … never once failed (checked on 4 fixed points + 23 own-instrument rows)" | **"23" struck.** The shipped scripts assert WID on 4 + 9 = 13 rows; `deletion_only_check.py` asserts no WID. The 13 hold. |
| "All 9 completed rows saturate"; "all 9 also saturate on deletion arcs alone" | **Backed** (replayed and independently reproduced); scope per A5. |
| "found **every** eligible `(L,k)`"; "further 297 eligible instances" | **"every" struck** (352 pairs over all `L, k` at `n ≤ 300`). "297" has no shipped artifact but is **reproduced by me** on F1's domain. |
| "smallest is `L=7, k=2, n=35, α=18, x=10, p=12`"; `|F|=14`; "3,070,508" | **Reproduced by me.** The return ships no artifact for them. "10.2s" and "<2ms" are unbacked timings with no bearing. |
| "confirming the family has no eligible instance below `n=35`" (citing `pendant_pair_sweep.json`) | **Artifact does not back it** (A8). **True** by my full scan. |
| "Of 14 configurations tried, 11 … no eligible `p` … 1 (`[4,4,4,4]`) timed out" | **Backed.** Relabelled: 8 of 14 are uniform CB, and the eligible one is `CB(4,4)` (A4). |
| "No deletion-deficient row smaller than `CB(8,86)`/1465 was found anywhere searched" | **Backed** as a report of the searched set; scope per A2 and A3. |

## Verdict

verdict: retained_narrowed

headline_resolved: no

F1's route verdict `bounded_evidence` stands. Every computed number in its return that I could replay is correct, and the instrument is
faithful to the contract. The narrowing:

1. The CB sweep screens one sector shape per row (A2).
2. The order 20–1464 gap for general trees is unchanged (A3).
3. The "heterogeneous" sample contains no eligible heterogeneous tree (A4).
4. The caterpillar rows use the first eligible `p` only, and five of them repeat the order-≤19 census (A5).
5. The fixed-point citations and four literals are struck or corrected (A6, A8, and the certification audit).

**Critic-derived advance (attributed to C-F1-U; `bounded_computation`; single validated instrument; not a registration candidate).**
These results take the step F1 left open.

- **`PPC(7,2)` at `p = 12` (`n = 35`, `α = 18`, `x = 10`, `|F| = 14`).** The exact orbit quotient under `(S_2)^7` has 249,153 source
  orbits and 394,553 target orbits (|I_13| = 3,070,508, |I_12| = 5,669,905). Its values are supply 7,801,728, capacity 11,469,576 and
  `S = −3,667,848`, with WID asserted against the independently computed `S`.
  - With **deletion arcs alone** (2,388,855 orbit arcs), the quotient max-flow is 7,801,728, so it saturates.
  - With (D) ∪ (S) (3,181,944 orbit arcs) it also saturates.
  - By (LIFT) a saturating integral flow of the original network exists using deletion arcs only. So the smallest pendant-pair
    caterpillar row is **neither deletion-deficient nor switch-necessary**, and it gives no (CUT).
  - Validation, on small `PPC` instances at every rank (non-eligible, used as validation only, with no Hall claim):
    - the quotient's orbit-arc sets equal the orbit image of the full relation in 88 of 88 cases;
    - quotient flow, supply and capacity equal brute-force full-network values in 48 of 48 cases, including 12 deficient ones.
- **Bare-pendant caterpillars.**
  - The 4 untested eligible ranks from A5 all saturate by brute force with deletion arcs alone.
  - An `(S_t)^L` orbit quotient, validated by the same two tests (78 cases), gives 53 more eligible rows in 16 `(L,t)` shapes up to
    `n = 42`, **every eligible `p`**. This includes F1's five timed-out shapes `(4,5), (5,4), (4,6), (5,5), (6,4)`. All saturate with
    deletion arcs alone.
- **Scope.** None of this is evidence toward (HALL) as a universal statement. The switch-necessary regime still has no computed
  instance below `CB(8,86)`.

## Remaining obligation

Stated exactly, for the successor. None of these items is the headline.

1. **Smallest deletion-deficient tree.** Find the smallest eligible `(T, p)`, of any shape, with a subfamily
   `X ⊆ I_{p+1}` such that `Σ_X w_F > Σ_{N_D(X)} w_F`, where `N_D` is the deletion neighbourhood only. It is open between orders 20 and
   1464. For CB rows with `114 < n < 1465`, sectors other than root-plus-arm are **untested**. A full-network deletion-only test is needed
   there (U2's equitable quotient, once proved, or an `S_d ≀ S_m` orbit quotient on mid-size rows).
2. **Next pendant-pair rows.** In quotient-size order these are `PPC(5,6)`/22 (3.66M source orbits), `PPC(6,4)`/18 (4.61M) and
   `PPC(9,2)`/15 (16.9M). They need a coarser proved lift or a compiled solver; they are out of reach for pure Python.
3. **Genuinely heterogeneous choke trees.** A heterogeneous choke family (unequal `d_i`) with eligible rows has not been exhibited. F1's
   sample has none.
4. **Switch-necessary row.** Mandate item (c), the first brute-force-checkable eligible row whose saturation needs (S) arcs, remains
   undelivered by both F1 and this critique.
5. **Registration.** P8 is already in `R30-CB-RECORD` at the Cycle 1 close, so F1's remaining obligation 4 (reconcile P8 into a
   registered record) is moot. The one-sector scope from A2 should travel with it.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-crit-F1-U/`.
Standard library only. Every job ran in the foreground; none is running. Digests are full SHA-256, computed by script at write time.

**Own instrument (`own/`), scripts:**

| File | Purpose | SHA-256 |
|---|---|---|
| `core.py` | the instrument | `e7fd10d6c89e0cfcc15ab1aee00218667b4dfc18438a3dba044feaa2d6fffd95` |
| `fixed_points.py` | fixed-point reproduction | `4560c69756475832a3f68b4f2032fc713e17718d152635d54f3b404745482343` |
| `cb_sweep.py` | CB closed form and sweep | `3ad4a6d6d1b7127ef870ce23b6f8a37bdc6b43d82b58706bf19398b65b8886fd` |
| `cb_rows.py` | `CB(8,86)` and `CB(8,92)` rows | `8203533497641f2ad298ff25cbf5276ae7a35a8d818e3f3ba2913f2bbd7b408d` |
| `bare_cat.py` | brute-force caterpillar rows | `8100c4636995e262ca4d34e4c243501d80e04bb92930dfe42561fb772ab55d21` |
| `cat_quot.py` | caterpillar orbit quotient | `01e487c58a8aa7973b0a45ea3369d1fd6c49c7321e345bc095cca028913e86f8` |
| `ppc_scan.py` | PPC eligibility scan | `1640534a54ba0906e136a14315bfbf1cdef6ddf3b1771a1fe638242f4747cf5d` |
| `ppc_quot.py` | PPC orbit quotient | `e5e1602a6dd1a31901b240ed5df51b1078fda2c1a3bf278aceeca81f363a8d5a` |
| `ppc_validate.py` | PPC flow validation | `890b87b3f527983ec7b4244290542e6bd0a99721969f7ba4de7612d3100b4679` |
| `ppc_arcs_check.py` | PPC orbit-arc validation | `afb15f42f06310fd926a23fe288b5ea0865bb766f825721e261708db4e3d12a3` |
| `ppc_n35.py` | the `n = 35` row | `45401c87e810dd41d3dda5bcdf9c4fa7bd00806d7732b8dee4c307e068e91318` |

**Own instrument (`own/`), outputs:**

| File | SHA-256 |
|---|---|
| `fixed_points.json` | `7131586e40411fdde6dadb0908e35336e1bd17c9e3f5dfa5b8d829b21d9db722` |
| `cb_sweep.json` | `9f0bfe2283b58786d22290a76bb0ca3e9d774543f6f824a65ac8cb28b3c43144` |
| `cb_rows.json` | `82b80f66e1f50b2410690f263c6f86b70a650259a7b0eafb0bad1426bda69318` |
| `bare_cat.json` | `26d10aab4dbed75da62876cbb8b55364eeb9e13606d0d7644148e9c3ccad293a` |
| `cat_quot.json` | `a943246827812e61ea1b849cac1b5d95464237b5ca476e24de8604961a957a7b` |
| `ppc_scan.json` | `441ab84f808d2ea4c16f59be929f9e4c3ebe404a4cb5b3e72a0daec668f0e9dc` |
| `ppc_validate.json` | `4f8dd66f36aa4bffe5960514152b86316d269fa16421466b027a5811a1d6f608` |
| `ppc_n35.json` | `d3ee49f90d63e7257515ce1104ba493fc54a07f94403270b95b97a2095b055d2` |

**Replay (`replay/`), F1's 9 scripts copied out first.** Digests equal F1's:

| File | SHA-256 |
|---|---|
| `adversarial_sweep.py` | `c7226b852d8f09ce470ba8db692879c5d7379a5640ddc749d1ca312f9e19f2f5` |
| `cb_closed_form.py` | `18f314b2226714d9455de118dd8d890c5c99d2a012a170838023fdf5e7cae7cb` |
| `deletion_only_check.py` | `03208015476271fa1869561d494cb20b934c2a28d0e7d0ebb96fc297f6e7909f` |
| `flow_instrument.py` | `e80d1eab22d9ba4f7f53238dd8544583d8c5c3bb3f68ff93a18888e53fbf0e0c` |
| `grid_search.py` | `cf6fde603ce6ca7ca6415164cb8f1a07e7fcb81275d4859f849eac51b6952590` |
| `heterogeneous_cb_sweep.py` | `acb267857caddc867b54014472a417c65cd0403bce5f16fea8c6840ab05a694d` |
| `pendant_pair_caterpillar.py` | `2114b905ea93b462801ffcdb54846bf38548978bc4d1d41c807c8194d519fb5b` |
| `pendant_pair_sweep.py` | `dad1bdf58aee76ce581a39a3d730e9e4eaac64487844e5562b06c2fad8329518` |
| `validate_fixed_points.py` | `03a921fb31cb3540afc3a43902415e375596a49430ab34a6136a4f1c1efa7ce5` |

**Replay (`replay/`), re-generated outputs:**

| File | Relation to shipped | SHA-256 |
|---|---|---|
| `caterpillar_sweep.json` | content-identical (timing and digest fields excluded) | `8516ddd986670b84d5fe1f3f63c7ea58048e7f80d6966435f18538e124a01e35` |
| `deletion_only_check.json` | byte-identical | `39e1dc08d24615e396978676e6516b7ff4c2b8df9110402ba0d12d6299c828c0` |
| `grid_search_results.json` | byte-identical | `3b87f17b972ff8816d37a19e0bbf63433f15c6c09eadc6528e60169cba1e456f` |
| `heterogeneous_cb_sweep.json` | content-identical (timing and digest fields excluded) | `a7e8ccf715f324da32b0e5386689adccdc255ad27d4aa1991641be8e0f188cb4` |
| `pendant_pair_sweep.json` | byte-identical | `6c9b25a8425570c57315912c1da4d28921c8d08f2a9e15980e39ced5dc230394` |

- `replay/shipped/` holds F1's original JSON outputs, kept for comparison.
- Housekeeping: a stray `cb_sweep.json` (a duplicate of my own output, written when an import accidentally re-ran my sweep in
  `replay/`) was removed. `__pycache__` directories in my scratch were removed.
