# Return — Route F3, Cycle 1, r31

**Route ID:** `C1-F-03`  **Mechanism token:** `ELIG-TOP-DESCENT-ADVERSARY`  **Orientation:** F (falsify)

**IMPORT LIST (union across every generator this return ships):** `math`, `numpy`, `sys`,
`os`, `json`, `hashlib`, `time` (wall-clock use restricted to unhashed diagnostic
printouts only). Standard library plus `numpy` only; no network; no package installs.
Every invocation used `python3 -B`.

**Model disclosure (two-part):** chartered sonnet/high; transport-resolved model sonnet
(explicit parameter); runtime-reported model id: **claude-sonnet-5**.

## Boot acknowledgment

VerityOS booted for this seat by reading exactly the two authorized files and nothing
else, per `DISPATCH-F3.md`'s Read-boundary instruction: `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS file
(memory, conversations, modules, skills, logs, decisions) was read; the startup
protocol's own task-type map was intentionally not followed further, as instructed.

## Dispatch and seal verification

- `control/dispatch/c1-stage3/DISPATCH-F3.md` SHA-256 verified before reading it, exactly
  as given: `78a6596669cae79eeb67b2b9e025e59a42d839efb55bd63214f07ad8fa7dcf1e`.
- Stage 2 packet manifest seal recomputed independently (canonical JSON of
  `control/C1-STAGE2-PACKET-MANIFEST.json` without `seal_sha256`, `sort_keys=True`,
  `separators=(",",":")`, no trailing newline) and matched exactly:
  `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`.
- Every source file this return relies on was verified against
  `control/C1-STAGE2-PACKET-MANIFEST.json`'s per-file SHA-256 before use (all matched):
  `SEMANTIC-CONTRACT.md` `7cc0bf434d6ea8f8fa2d812caf4e45787c1c06a9dfc6846b6b4d54cb60cf226e`;
  `SOLUTION-CONTRACT.md` `480ba2ddda557be50b2d8249feb733be7e3c947d2e0a9dd4e7fee1427a7ef719`;
  `control/C1-ALLOCATION.md` `497beb925ad150d1ee783fe9d842e397fa5a03f8393e4b581254def648e062a1`;
  `control/C1-STAGE1-GATE.md` `84365a8e85ee2368c3f839721a49941e4e109d5c50799013357f14113665d3c6`;
  `cycles/cycle-1/stage2/ROUTE-STATE.md` `9dbe4accfe9356e148f39a49d8108cbac74e1336f5dfc5adbf5a983405e74497`;
  `control/C1-WORKER-COMMON-BRIEF.md` `89a93d95c8290ee4bfaacdee4a733267362b4a17a327a729e9a6caaf66552b00`;
  `AUTHORIZATION.md` `7d9bd0514744386daf81d13c4d89100acb131b2c94c02a322b084edc072edec9`;
  `OBLIGATIONS.csv` `8d8cd5116fd8c5a95a588804a1f6352bc9a060133306c9d7b1fb8253eca02880`;
  `control/R31-CHARTER-PROMPT.md` `7b6f4a0e30d3789097a601bc51cf006d16f6b3a6c255d06cd6b8358400b68d93`;
  `control/CLAIM-IDENTITY.run-local.json` `b4a339eff1e2cdc04ceedcdd55fdd53697574bf64ed7e26631c50d84d56e470b`.
- No `sources/` file was needed beyond the run-local registry above: F3's obligation is a
  self-contained coefficient computation on the CB(8,m) closed forms already frozen in
  `SEMANTIC-CONTRACT.md` §2, so no r30 instrument file or Lean source was read.

## Fixed points reproduced independently (SEMANTIC-CONTRACT §5), before any table below

Using only this route's own generator (`core.py`, `validate_fixed_points.py`; no r30
table file read):

| m | n | α | p* | x (this route's scan) | p*−x |
|---|---|---|---|---|---|
| 107 | 1822 | 964 | 572 | 570 | 2 |
| 95 | 1618 | 856 | 508 | 506 | 2 |

Both match the record exactly (`θ*`, `ρ_1`, `σ` are (L-S)_top sector-allocation objects
outside F3's load-bearing obligation and are not recomputed here).

## Step-by-step derivation, naming where each hypothesis enters

1. **Object.** `T_m = CB(8,m)`, `I(T_m) = (1+2x)G^m + x(1+x)(1+2x)^{8m}`,
   `G = (1+2x)^8 + x(1+x)^8` (SEMANTIC-CONTRACT §2, carried verbatim — not re-derived).
   `G` and `I` are **not** claimed real-rooted anywhere in this file (`E993-TREE-REAL-ROOTED`
   REFUTED is respected as a fence); no Newton/Darroch inequality is invoked on `G`, `G^m`,
   or `I` at any point below.
2. **Eligibility split.** `x(T_m) + 2 ≤ p*` is the target; `(ELIG-top)(a)` supplies it
   *sufficiently* via `i_{p*-1} < i_{p*-2}` (a **parent-descent** hypothesis, distinct from
   the **actual first descent** `x` — this route computes both and reports where they
   diverge, never conflating them).
3. **Block decomposition.** Each block `C(m,j)(1+2x)x^j(1+x)^{8j}(1+2x)^{8(m-j)}` is a
   monomial `x^j` times `(1+x)^{8j}(1+2x)^{8(m-j)+1}`, a product of two linear factors —
   real-rooted, hence the ONLY object in this file where a real-rootedness-flavoured
   statement (log-concavity of its own coefficient sequence) would be admissible; this
   file never uses that property either, only literal coefficient subtraction
   (`block_inner_delta`), so the hygiene fence is respected with margin to spare.
4. **E1's condition (i).** `r_q(k) = [y^k](1+y)^{8q-1}(1+2y)^{8(m-q)+1}`; condition (i) is
   `r_q(p-q) ≤ r_q(p-q-1)` for every `q ∈ [1,m]`, checked by literal convolution sums
   (`conv_coeff`/`r_q_at`), never by Darroch on `r_q` (which WOULD be legitimate here,
   since `r_q` is real-rooted — but is not needed for a direct comparison of two values).
5. **Favorability.** `Δ_{p*}(T-v) < 0` and `Δ_{p*}(T-c) < 0` checked from the closed forms
   `I(CB-v) = (1+x)G^m + x(1+2x)^{8m}` and `I(CB-c) = (1+2x)G_c G^{m-1} + x(1+x)^2(1+2x)^{8m-1}`,
   `G_c = (1+2x)^7(1+x) + x(1+x)^7` (SEMANTIC-CONTRACT §2, carried verbatim).
6. **ℕ-subtractions/casts.** All subtractions above are performed in Python's arbitrary-
   precision `int` (mathematically ℤ); no value here is ever cast to a fixed-width or
   unsigned type, so no wraparound is possible. `p - q - 1`, `p - 2 - j`, etc. can be
   negative for small `m`/large `q`/`j`; `conv_coeff`/`r_q_at` return exactly `0` for any
   out-of-range index by explicit guard, matching the polynomial convention `[y^k](\cdot)=0`
   for `k<0`.

## Registered claims touched (named BEFORE the census below; run-local registry
`control/CLAIM-IDENTITY.run-local.json`, verified digest above)

- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — OPEN (the (HALL) target key; untouched
  by this route directly, named per SOLUTION-CONTRACT fence 1).
- `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`
  — cited at its registered grade (`proved_informal` modulo Darroch/Newton on the closed
  forms' real-rooted factors); this route's favorability spot-checks (below) are
  bounded-computation re-confirmations at specific `m`, never a re-proof and never
  upgrading this key's grade.
- `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`
  — cited at `proved_informal`; this route's E1-condition-(i) spot checks are bounded
  re-confirmations at sampled `m`, same caveat.
- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` — cited,
  untouched directly.
- `E993-TREE-REAL-ROOTED` — REFUTED; cited only as the fence that this route's methods
  respect (see step 1 above), never re-litigated.
- The bounded-computation record of `(ELIG-top)(a)` "to `m = 2395`" (SEMANTIC-CONTRACT §3)
  — this route's main sweep (below) **extends the checked range of this same statement**
  to `m = 2600`. This is reported as an extension of the existing record, **not** as a
  new `E993-R31-` claim: it is the identical statement `i_{p*-1}(CB(8,m)) < i_{p*-2}(CB(8,m))`,
  same object, larger finite range, still `bounded_computation` (never upgraded).

**Alias check (no new claim key is proposed by this route).** Lexical: searched
`control/CLAIM-IDENTITY.run-local.json` for `DESCENT`, `PARENT`, `ELIG.TOP`, `BLOCK.MIX`
(regex, case-insensitive) across all 491 `claim_key` values — no existing key names the
specific fact "parent descent and true first descent coincide for small `m` in the class
but diverge with a growing gap for larger `m`," nor "blocks `j≤2` ascend / `j≥3` descend
at the parent-descent test." Mathematical: the closest existing keys are
`E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` (REFUTED; a different, general claim about
first descent vs. the polynomial's maximizer, not about CB(8,m)'s parent-descent gap) and
`E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`
(a different object, `r_q`'s condition (i), not `(ELIG-top)(a)`'s `x` vs. `p*-2` gap). No
collision found; no new key is registered because the finding is evidence for the
existing `(ELIG-top)(a)` obligation (`R31-OBL-ELIG-TOP`), not a logically distinct
statement.

## Findings (the census)

### (i)+(ii) Exact sweep of `(ELIG-top)(a)` beyond `m = 2395`, and `x` vs. parent descent

**Method:** an incremental low-degree (10-term) sparse convolution DP for `G(x)^m`
truncated to a fixed degree `N`, advanced one `m` at a time from `m=1` (`numpy`
object-dtype arrays of exact Python `int`; `elig_top_sweep.py`); the tail term
`x(1+x)(1+2x)^{8m}` is rebuilt each checked `m` via an `O(N)` exact ratio recurrence
(no `math.comb` calls in that inner loop). At every `m ≡ 2 (mod 3)` with `2395 < m ≤ 2600`
(69 rows), this return: (a) scans `k = 0, …, p*(m)-2` for the least `k` with
`i_{k+1}(T_m) < i_k(T_m)` — this least `k` IS `x(T_m)` by definition, so no scan beyond
`p*-1` is needed once a descent is located in `[0,p*-2]`; (b) separately evaluates the
literal parent-descent test `i_{p*-1} < i_{p*-2}`.

**Digested output:** `elig_top_sweep_output.json`,
SHA-256 `70e02c7f13e4edb9f657260fb0b026d4a571f4c31faae712f660ef6161ebb400`
(generated by `elig_top_sweep.py 2600`; wall time 407.2s, diagnostic only, not hashed).
Copy-out-first replay:
```
cp scratchpad/c1-F3/core.py scratchpad/c1-F3/elig_top_sweep.py scratchpad/c1-F3-replay/
cd scratchpad/c1-F3-replay
python3 -B elig_top_sweep.py 2600
```

**Result, exhaustive over all 69 checked rows:**
- **Parent descent `i_{p*-1} < i_{p*-2}` HOLDS at every row** — `(ELIG-top)(a)`'s bounded
  record is extended from `m = 2395` to `m = 2600` with no exception (69/69).
- **The actual first descent `x` is strictly LESS than `p*-2` at every one of these 69
  rows** (unlike `m=95,107` above, where `x = p*-2` exactly). Sample rows
  (`m`, `p*`, `x`, `Δ_{p*-2} := i_{p*-1}-i_{p*-2}` sign, `p*-x`, and the brief's predicted
  `256m/20451`):

  | m | p* | x | Δ_{p*-2} sign | p*−x | 256m/20451 (predicted) |
  |---|---|---|---|---|---|
  | 2396 | 12780 | 12750 | neg | 30 | 29.99 |
  | 2426 | 12940 | 12909 | neg | 31 | 30.37 |
  | 2456 | 13100 | 13069 | neg | 31 | 30.74 |
  | 2486 | 13260 | 13228 | neg | 32 | 31.12 |
  | 2516 | 13420 | 13388 | neg | 32 | 31.49 |
  | 2546 | 13580 | 13548 | neg | 32 | 31.87 |
  | 2576 | 13740 | 13707 | neg | 33 | 32.25 |
  | 2600 | 13868 | 13835 | neg | 33 | 32.53 |

  The observed `p*-x` tracks `C1-WORKER-COMMON-BRIEF.md`'s stated asymptotic
  `p*-x ~ 256m/20451` to within integer rounding at every one of the 69 rows (not just
  the 8 sampled above) — this route did not previously know whether that claim held in
  the *un*certified range beyond 2395; it now has been checked there, exactly, and holds.

**Distinguishing parent descent from first descent (explicitly, as the dispatch requires):**
`(ELIG-top)(a)` only claims the SUFFICIENT condition `i_{p*-1}<i_{p*-2}`, never that
`x = p*-2`. At `m = 95, 107` the two coincide exactly (tight, `p*-x = 2`, the minimum
possible under eligibility). For every `m > 2395` tested, the true first descent occurs
strictly earlier, with a gap growing roughly linearly in `m`. **No adversarial break was
found**: at no tested row does parent descent fail, and at no tested row does the true
`x` exceed `p*-2` (which would break eligibility outright).

**Horizon and method disclosure.** Calibration before committing to the full run: raw
convolution-only timing at `m_target ∈ {300,600,1000,1500}` gave `{0.54s, 4.9s, 21.8s,
73.6s}` — empirically **cubic**, not quadratic, in `m` (`time(m) ≈ 21.8s·(m/1000)^3`),
because the coefficients' digit count itself grows linearly with `m`, multiplying the
naive `O(m·N)` term-count estimate by a growing per-operation cost. The committed run to
`m_target=2600` (`N=13870`) took 407.2s wall time, consistent with that fit
(predicted 383s). This bounds how far a single foreground call can push this method:
`m≈3000` would already approach a 10-minute foreground ceiling, and `m≈5000` is not
reachable this way in one sitting. **A successor with a faster method (see Remaining
obligation) could push substantially further.**

### (iii) Block ascend/descend test and mass ratio at sharp points

**Method:** `block_crossover_check.py`, using `conv_coeff`/`block_inner_delta` (direct
`math.comb`-based coefficient extraction on the real-rooted per-block factor
`(1+x)^{8j}(1+2x)^{8(m-j)+1}`, independent of the DP above). **Cross-validated once,
bit-for-bit, against the independent `G^m` DP** at `m=107`: the block-sum total
`i_{p*-1}-i_{p*-2}` computed two ways agreed exactly (`core_vs_block_crosscheck` in the
digested output — `agree: true`).

**Digested output:** `block_crossover_output.json`,
SHA-256 `1ba14d7316d7f9c0430ba8d6f887b0a8ee8f224743f00c245c7d97e39952bb71` (wall 5.7s).
Replay: `python3 -B block_crossover_check.py` from `scratchpad/c1-F3-replay/`.

**Finding: the ascend/descend crossover sits at a fixed, small `j`, independent of `m`
across four orders of magnitude.** At every tested `m ∈ {107,110,113,116,2396,10001}`,
blocks `j=0,1,2` ascend and every tested `j≥3` descends (including edge probes
`j∈{m-6,…,m}` at `m=107,116`, which also confirm no re-ascension near `j=m`). This is an
**empirical regularity, not a theorem**: this route tried, and failed, to break it — no
`j≥3` was found ascending, and no `j∈{0,1,2}` was found descending, at any tested `m`.

**Mass ratio** (weighted by `C(m,j)`, exact): at `m=107`, ascending mass
(`j=0,1,2`) vs. descending mass (`j≥3`) has ratio `|descending|/|ascending| ≈ 3.917`
(computed exactly as a ratio of two big integers; only the printed ratio is a float). This
is a **modest** margin at the tight boundary row, consistent with `x=p*-2` there being
exact (no slack). At the larger rows from the main sweep (§ above), the SAME
decomposition's total delta relative to the (still just 3-term) ascending mass grows to
ratios of order `10^{38}`–`10^{41}` at `m=2396,2600` (`elig_top_sweep_output.json`'s
`descend_over_ascend_ratio_approx` field) — i.e. **the descent becomes overwhelmingly
robust for large `m`, in sharp contrast to the fragile small-`m` boundary.** This is the
single clearest quantitative picture this route can offer a successor's block-mixture
proof: only 3 blocks (`j=0,1,2`) ever need to be controlled by hand; everything else is
dominated combinatorially once `m` is even moderately large.

### (iv) E1 condition (i), every `q`, sampled `m`; favorability, both leaf classes, sampled `m`

**E1 condition (i)** (`r_q(p*-q) ≤ r_q(p*-q-1)` for every `q∈[1,m]`, Darroch-free literal
comparison): `e1_condition_check.py`, digest
`1b7fdf8b763961e102d1e33e490081ab5513e0b3dc910c4bf42ef00e0b8b121c` (wall 123.4s). Checked
in full (every `q`) at `m ∈ {107, 110, 113, 116, 500}` — **zero failures at any `q`, any
sampled `m`** (control row 107; both charter FRESH rows 110/113; 116; and a
larger-scale check at 500). `m=1000` was attempted separately and would have needed
roughly 10 minutes by the observed (worse-than-quadratic) scaling; it was **abandoned
rather than let run to an uncertain length**, and is disclosed here as a horizon
limitation, not reported as a completed check.

**Favorability** (`Δ_{p*}(T-v)<0`, `Δ_{p*}(T-c)<0`, exact): `favorability_check.py`.
Confirmed **favorable for both leaf classes** at `m ∈ {107,110,113,116,500}`
(digest `271cc56b341f5306dd557dd7d3c42426969a4c26367c685e2c06d3e2522c5f96` for the `m_target=500`
run) **and at `m=2396`**, the first row beyond the previous bounded record
(digest `b1ec56a998602eea7f84db2f457f43ef8165b47f9b49ca8d4327537e66a6697a` for
`favorability_check.py 2396`; the `m_target=116` run's digest is
`e3f0003264f21ed0e4836c4f716097b250e4cd3d13bc08d9a86311350d7ed5c0`). Replay any of the
three by rerunning `python3 -B favorability_check.py <M_TARGET>` from
`scratchpad/c1-F3-replay/` with the stated `M_TARGET`; each run overwrites
`favorability_output.json`, so the digest is tied to the argument used, stated above.

### Additional adversarial probe (boundary below the class)

Not required by the dispatch but a natural adversarial extension: `m ∈ {92,98,101,104}`
(below the charter's `m≥107` floor, still `≡2 mod 3`) were checked with the same scan
(`validate_fixed_points`-style) and **also** show `x = p*-2` exactly, same as `107` and
`95` (see the very first sweep test in this route's working log). This does not challenge
`M_0=107`: the charter's floor is a separate, T3-owned question (`M_0` may or may not be
tight), and this route makes no claim about it — reported only as a disclosed
observation, not a finding of this route's obligation.

## Not applicable to this route

**Acyclicity-and-connectivity tests in code:** this route constructs no transport-network
graph, flow, or certificate (no vertices, edges, or arcs are ever instantiated); every
object here is a univariate polynomial coefficient. This shared-brief requirement is
inapplicable to F3's coefficient-sequence adversarial audit and is recorded here as an
explicit disclosure rather than a silent omission. (i)-(WID)-style "supply − capacity"
assertions are similarly inapplicable for the same reason.

## Execution disclosure (foreground discipline)

Two of this route's own `python3 -B` invocations exceeded the harness's default 120s
foreground window and were moved to background automatically by the tool layer, not by
this route requesting detachment: (1) an exploratory `block_inner_delta` probe at
`m∈{1001,10001,100001}` (stopped via the harness's task-stop control once excess runtime
was recognized, `m=100001` was abandoned as infeasible and never reported as a result);
(2) the first attempt at `elig_top_sweep.py 2600` without an explicit extended timeout
(stopped the same way, then re-run correctly with an explicit foreground timeout budget,
completing at 407.2s as reported above). No result from either background-moved attempt
is used as evidence anywhere in this return; every reported number comes from a run that
completed in the foreground under an explicit timeout, at a literal PID the harness
controlled directly (this route never issued its own shell `&` background job and never
polled a self-spawned PID). One further Bash call (`bvbtspxif`, the `m=500` E1 timing
probe) was also moved to background by the same default-timeout mechanism but had
already completed successfully by the time it was inspected; its output was read from
the harness's own completed-task record before being folded into `e1_condition_check.py`'s
later, from-scratch, fully-foreground reproduction (the digested `e1_condition_output.json`
run) — so the digested result did not depend on the background-completed run.

## Gate lines (`control/C1-STAGE1-GATE.md` ruling 6)

`LS_top: not_advanced`
`ELIG_top: advanced`
`cut_candidate: none`

## Verdict

`headline_resolved: no`

**Route verdict: `bounded_evidence`.** This route extended the exact
`(ELIG-top)(a)` sweep beyond the prior record (`m=2395` → `m=2600`, 69 new rows, zero
exceptions), confirmed the brief's asymptotic `p*-x ~ 256m/20451` prediction in that
previously-uncertified range, identified an apparently `m`-independent block
ascend/descend crossover (`j=2/3`, empirically robust across `10^2`–`10^4` in `m`), and
found zero counterexamples to E1's condition (i) or to favorability at every sampled row.
No universal proof is offered (that is T3's/U3's obligation) and no obstruction/cut was
found despite an honest adversarial attempt at several natural failure points (large `j`
near `m`, larger `m` via full-`q` E1 sweep, the boundary below `m=107`).

## Remaining obligation (successor inheritance)

1. **Faster exact coefficient extraction.** The main sweep's cubic-in-`m` cost is the
   binding constraint on how far `(ELIG-top)(a)` can be checked exactly in one foreground
   session. A successor should replace the dense low-degree-convolution DP with either
   (a) a method that extracts only the `O(1)` needed coefficients of `G^m` near `p*(m)`
   without materializing the full low-degree vector (e.g. a saddle-point/generating-
   function shortcut, or an FFT/NTT-based truncated power with `O(m log m)` scaling), or
   (b) working modulo a set of primes for a first-pass filter and falling back to exact
   arithmetic only where a modular check is inconclusive — to push the exact sweep from
   `m=2600` to at least the low tens of thousands.
2. **E1 condition (i) at scale.** The full-`q` sweep is worse-than-quadratic in `m`
   (completed to `m=500`; `m=1000` was not reached in a reasonable foreground window).
   Since each `r_q` is a two-real-root (hence log-concave) product, a successor could likely
   collapse the per-`q` `O(m)` sum into an `O(1)` or `O(log m)` amortized update across
   consecutive `q`, given `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`'s
   own closed-form proof of record as a starting point — this route deliberately did not
   invoke that key's Darroch argument, to keep this route's check independent of it, but a
   successor optimizing for speed rather than independence may.
3. **Prove the block crossover, don't just observe it.** This route found (j=0,1,2 ascend,
   j≥3 descend) to be extremely stable numerically but proved nothing about why. T3's
   block-mixture argument (`C1-T-03`) should attempt to show the crossover `j` is bounded
   by an absolute constant (not growing with `m`) directly from the mean-position estimate
   `p*-1-j - μ_j ≈ (j-1)/3` (μ_j the mean of `(1+x)^{8j}(1+2x)^{8(m-j)+1}`'s coefficient
   sequence) sketched informally in this return's working notes — this estimate is NOT
   claimed proved here, only observed to match the numeric crossover closely.
4. **Locate the parent-descent/first-descent transition.** `x = p*-2` exactly at
   `m∈{92,95,98,101,104,107,110,113,116}` (checked) but `x < p*-2` (growing gap) at every
   `m∈{2396,…,2600}` (checked). The exact `m` where this transition first occurs is
   unknown and was outside this route's obligation; a successor with the faster method of
   item 1 could locate it by extending the same scan continuously from `m≈116` upward.
