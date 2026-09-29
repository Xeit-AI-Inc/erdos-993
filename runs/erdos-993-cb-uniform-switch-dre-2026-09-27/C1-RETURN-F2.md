# RETURN — Route F2, Cycle 1, r31 (erdos-993-cb-uniform-switch-dre-2026-09-27)

**Route ID:** `C1-F-02`  **Mechanism token:** `LS-TOP-ASYMPTOTIC-AND-ENDPOINT-STRESS`
**Orientation:** F (falsify)  **Charter:** Claude Sonnet 5, high.

## Boot acknowledgment

VerityOS booted for this seat by reading EXACTLY the two authorized files, in order:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`.
No other VerityOS file (memory, conversations, modules, skills, logs, decisions, or the
startup-protocol's own task-type map) was read — the controller booted for the run, per
`DISPATCH-F2.md` and `C1-WORKER-COMMON-BRIEF.md`.

## Stage 2 seal and source-digest verification

Recomputed SHA-256 of the canonical JSON of `control/C1-STAGE2-PACKET-MANIFEST.json` (the object
with `seal_sha256` removed, `sort_keys=True`, separators `(",", ":")`, no trailing newline):

```
e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc
```

This matches the recorded `seal_sha256` exactly (byte-for-byte hex match, 64 chars). The manifest
lists 1403 files; I spot-verified the SHA-256 and byte length of every control/contract file this
route reads (`AUTHORIZATION.md`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`,
`control/C1-ALLOCATION.md`, `control/C1-STAGE1-GATE.md`, `control/C1-WORKER-COMMON-BRIEF.md`,
`control/R31-CHARTER-PROMPT.md`, `cycles/cycle-1/stage2/ROUTE-STATE.md`,
`sources/SOURCE-DIGESTS.json`, `control/CLAIM-IDENTITY.run-local.json`, `OBLIGATIONS.csv`) against
the manifest — all matched. I additionally verified, against `sources/SOURCE-DIGESTS.json`, the
SHA-256 of every `sources/` file I read for reference: `sources/r30/instruments/c6/T2/inherited/{localflow,certify,sector,rowdata,simplex,fixedpoints}.py`,
`sources/r30/instruments/c6/C-T2-U/own/CERT-TABLES.json`,
`sources/r30/instruments/c6/C-T2-F/{crit_cert_tables,crit_extend_a,crit_extend_b}.json`,
`sources/authority/CLAIM-IDENTITY.json` — all matched (script: ad hoc, not retained; the
verification method is exactly `DISPATCH-F2.md`'s prescribed canonical-JSON-minus-seal recomputation,
applied per-file via stored `sha256`/`bytes` fields). Read order followed `C1-WORKER-COMMON-BRIEF.md`
exactly: brief → manifest+seal → `SEMANTIC-CONTRACT.md`/`SOLUTION-CONTRACT.md` → `C1-ALLOCATION.md`
→ `C1-STAGE1-GATE.md` → `ROUTE-STATE.md` → the Stage 2 `sources/` members this route needs.

## Target recap (frozen; not this route's to restate authoritatively, cited for scope)

For every `m ≥ 107`, `m ≡ 2 (mod 3)`, `T = CB(8,m)` (`n = 17m+3`, `α = 9m+1`), `p* = (16m+4)/3`:
(E) `p*` eligible with the actual first descent; (H) the literal active-tag weighted network at
`F = F_{p*}(T)` satisfies (HALL) at `p*`. This route's load-bearing obligation
(`control/C1-ALLOCATION.md`, F2 section) is to **stress the (L-S)_top choke-local sector-LP
template across the class**: exact template LPs at sampled `m` as far as exact arithmetic allows in
the foreground; `θ*(m)` against the conjectured `288/(200m²+82m+5)`; the margin `(1−ρ₁)/θ*` and its
growth; which constraints are tight and how the tight set moves with `m`; endpoint states
(`γ∈{0,1,7,8}`, `β∈{0,1}`, `β+γ=8`); whether the affine separation ever becomes infeasible while the
exact min-plus/max-plus system stays feasible; and the `m≡0,1 (mod 3)` residue-class note.

## Registered claims named before any computation is reported as evidence

(`sources/authority/CLAIM-IDENTITY.json` / `control/CLAIM-IDENTITY.run-local.json`,
`SEMANTIC-CONTRACT.md` §4, `OBLIGATIONS.csv`)

- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — OPEN — the ultimate (HALL) key this run serves;
  **not resolved or touched substantively by this route.**
- `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — OPEN — cited for scope only, untouched.
- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` — `proved_informal`
  (E1) — CARRIED, not re-derived; I independently **recompute** the coefficient ratio `ρ₁(m)` that
  is internal to its scope (cross-checked against the frozen fixed point, §"Independent
  verification" below), but do not re-prove the criterion itself.
- The favorability key and the E1-threshold key of `SEMANTIC-CONTRACT.md` §2 (both
  `proved_informal` modulo Darroch/Newton on products of linear factors) — CARRIED, not re-derived;
  I use `F = leafSet` as given.
- `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`
  — `computer_assisted` per `SEMANTIC-CONTRACT.md` §3 (registry status field: VERIFIED) — the finite
  record whose last row (`m=107`) this route's sweep starts from and extends past, in both
  directions (down to `m=5..80`, out to `m=200..10001`).
- `E993-TREE-REAL-ROOTED` — REFUTED — **not used**: this route never invokes Newton's inequalities
  or Darroch's theorem anywhere (the sector LP and its DP certification are pure linear-programming
  / combinatorial-optimization objects; no real-rootedness hypothesis enters).
- `R31-OBL-LS-TOP` (`OBLIGATIONS.csv`) — open — the obligation this route stress-tests.
- `θ*_8(m) = 288/(200m²+82m+5)` (`SEMANTIC-CONTRACT.md` §2, "a CONJECTURE of r30: a law of one LP
  optimum, not an instance fact") — has no separate `claim_key` in the registry; cited by its text,
  tested (not assumed) at every row below.

## Step-by-step derivation, with hypothesis entry points

1. **Object.** The (L-S)_top choke-local sector LP is built directly from `SEMANTIC-CONTRACT.md`
   §2's frozen definitions — `Out(β,γ) = β·pb(β,γ)+γ·pc(β,γ)+𝟙[β=1,γ≥1]·σ(γ)`,
   `In(β,γ) = (d−n)·(pb(β+1,γ)+pc(β,γ+1))` for `n=β+γ<d` else 0, the affine separation
   `Out≥a+λn`, `In≤a2+λ2n`, the aggregate rows `ma+λK≥1`, `ma2+λ2(K−1)≤1`, the Switch row
   `(d−γ)σ(γ)≤θγ` — in `scratchpad/c1-F2/model.py`, independently of
   `sources/r30/instruments/c6/T2/inherited/localflow.py` (read only for orientation). **Eligibility**
   enters only through the fixed parameters `p*=(16m+4)/3`, `K=p*−1` (asserted, not re-derived, except
   at the four rows where I independently reproduce `x`, `α` from scratch — see below). **The fixed
   selector** `F=F_{p*}(T)=leafSet` enters as a CARRIED fact (favorability key), not re-derived.
   **The literal relation** (deletion ∪ two-for-one switch) enters via the `Out`/`In` definitions
   themselves and is cross-checked, at small scale only, against a from-scratch literal tree/edge
   construction (`literal_check.py`) — full-scale literal fidelity at `m≥107` is route F1's
   obligation (`C1-F-01`), not re-derived here.
2. **Solver.** `scratchpad/c1-F2/ratsimplex.py` is an independently written exact two-phase
   rational simplex (Bland's rule, `fractions.Fraction` throughout, no floats). Self-checked against
   three hand-solved LPs (one bounded via a `>=` pair, one with an equality row, one deliberately
   infeasible) before use.
3. **First draft had a sign error, caught and fixed.** My first `model.py` encoded the Out-affine
   row as `Out(β,γ) ≤ a+λn` (backwards — the frozen requirement is `Out(β,γ) ≥ a+λn`). This bug made
   `θ*=0` (no switch) look feasible, which is FALSE (see the exact non-LP proof below that θ=0 is
   always infeasible) — i.e., an undetected sign error would have produced a spurious falsification
   of "switches are load-bearing." I caught it by cross-checking against the five recorded θ* values
   (all came back `0` instead of matching); fixing the row direction to
   `−Out(β,γ)+a+λn ≤ 0` made all five match exactly (§"Independent verification"). This is reported
   as a disclosure, not buried: it is exactly the kind of failure mode an adversarial route exists to
   catch, here caught in my own instrument before it reached a table.
4. **Independent verification against the frozen record, BEFORE any new table (`SEMANTIC-CONTRACT.md`
   §5).** `model.solve(8,95,508)`, `(8,98,524)`, `(8,101,540)`, `(8,104,556)`, `(8,107,572)` reproduce
   `θ*` = `96/604265`, `96/642947`, `96/682829`, `96/723911`, `96/766193` **exactly**, matching
   `C-T2-U/own/CERT-TABLES.json` and `C-T2-F/crit_extend_b.json` digit-for-digit. `rho1.py`
   independently reproduces `ρ₁(95,508) = 1354839571516225/1361543988640524` exactly
   (`SEMANTIC-CONTRACT.md` §5's fixed point). `eligibility_check.py` (an independent generic
   post-order tree-DP on the ORIGINAL carrier, not `rowdata.py`) reproduces `n=1618, α=856, x=506`
   at `m=95` and `n=1822, α=964, x=570` at `m=107` exactly. All of this is asserted from **independent
   code paths** (my own LP/DP/tree-DP, not the frozen instruments), matching WORKER-COMMON-BRIEF's
   shared-rule 2 in spirit for the objects this route actually touches.
5. **ℕ-subtraction / casts.** Every subtraction used is checked nonnegative in context: `K=p*−1` with
   `p*≥12` on every tested row (`p*≥2` is the only requirement; verified per row); `d−n` for `n≤d`;
   `K−1` for `K≥1`; `x−1` guarded (`Dxm1` only computed when `x≥1`). No ℕ-truncation bugs found.
6. **Newton/Darroch.** Not invoked anywhere in this route's code or argument (stated explicitly per
   hygiene rule 3 — this route's objects, the sector LP and its DP certification, never touch a
   forest-independence polynomial's real-rootedness).

## Numeric results — IMPORT LIST, generator, digest, replay

**IMPORT LIST (standard library only, used across this route's scratch):** `fractions.Fraction`,
`math.comb`, `itertools`, `json`, `hashlib`, `sys`.

All code lives under `scratchpad/c1-F2/` (working copy) and is byte-identical to
`scratchpad/c1-F2-replay/` (verified copy, digest reproduced there independently — see below).
Every invocation used `python3 -B`. Every long computation ran to completion in the foreground on a
literal, polled PID (two instances of the harness's own 120s default auto-backgrounding were
resolved by locating the literal child PID via `pgrep -P <parent>` and either polling it to
completion — `generate_results.py`'s full run, PID resolved and confirmed exited before reading
output — or killing it by that literal PID when it was a superseded exploratory probe — see
Disclosures). No full process listing was ever run; `pgrep` was always given a specific pattern.
All background jobs are confirmed killed/exited; `scratchpad/c1-F2/` contains no live process.

**Canonical digest (generator: `scratchpad/c1-F2/generate_results.py`, output `RESULTS.json`,
canonicalized `sort_keys=True, separators=(",",":")`, no wall-clock/PID/host fields):**

```
SHA256: 9d600d6069c84e6640ade18e58b0829a33360d7312cf0411c8fd9a60e920d85f
BYTES: 16286
```

**Copy-out-first replay command** (from a clean shell; reproduces the identical digest — confirmed
during this run):

```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-F2/{ratsimplex,model,rho1,certifier,certifier_fast,deletion_only_bound,literal_check,eligibility_check,generate_results}.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-F2-replay/
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-F2-replay
python3 -B generate_results.py
```

### What the digested run contains

**Row-reporting convention for this route:** every row below is identified by `(m, p*, K=p*-1)`,
never by a bare index, so `k`/`K` is unambiguous on every line. `x` and the difference index
`Δ_k=i_{k+1}-i_k` are this route's object only at the four rows under "Eligibility fixed points"
below (`m=95,107,110,113`), reproduced there explicitly with the sign of `Δ_x` and `Δ_{x-1}`; the
sector-LP rows (`θ*`, margin, tight sets) do not carry an independently-recomputed `x` from this
route by design — eligibility/`x` is T3/F3/U3's load-bearing obligation, not F2's, and this route
does not want to imply a claim about `x` at rows where it only cites `p*` from the frozen formula.

- **Fixed points reproduced** (§ above): `m=95,107`, LP+DP both `min_out=1, max_in=1` exactly.
- **Fresh rows first (gate ruling 2).** `m=110` (`p*=588`): `θ*=96/809675`, exact match to
  `288/(200m²+82m+5)`. `m=113` (`p*=604`): `θ*=96/854357`, exact match. Both independently exact-DP
  certified: `min_out=1`, `max_in=1` (no slack), `switch_ok=True`, `nonneg=True`. `m=98,101,104`
  (the remaining recorded residue-2 rows) also reproduced exactly, DP-certified.
- **Horizon extension (own solver + own exact DP, no relaxation).** `m=200` (`θ*=96/2672135`),
  `m=500` (`θ*=96/16680335`), `m=1001` (`θ*=96/66827429`) — **exact formula match at every row**,
  `min_out=1, max_in=1` exactly at every row. DP runtime scales ≈ quadratically in `m` (the LP itself
  is `m`-independent in cost, ≈1.5–1.6s regardless of `m`, since its variable/row count depends only
  on `d=8`); the exact-DP horizon reached in the foreground for THIS route, within the time available,
  is **`m=1001`** (DP ≈62s at that row; `m=2000` was estimated at ≈4 minutes and not run to keep the
  full battery inside one foreground session — reported as the honest reachable horizon, not
  attempted-and-hidden).
- **Below-class endpoint stress (`m<107`, outside Tier 1's stated class — reported as regime-map
  context, not a claim about the class).** `m=2`: **LP infeasible** (too small; `p*=12`). `m=5,8,11,
  14,17,20,26,35,50,65,80`: LP **feasible**, `θ*` matches `288/(200m²+82m+5)` exactly at every one,
  and `θ*(m) ≤ 1−ρ₁(m)` holds at every one (residual capacity never fails in this sampled range).
  `m=14` additionally DP-certified exactly (`min_out=1,max_in=1`). **This is new bounded evidence,
  not previously in the frozen record, that the (L-S)_top sector-LP template's feasibility and its
  conjectured closed form are not obstructed anywhere I sampled below `m=107`** — consistent with
  the reading that the charter's `m≥107` threshold is inherited from r30's finite-table provenance
  (its certified rows end at `m=107`) rather than from a hard failure of this particular sub-check;
  I did **not** check favorability, E1(i), or eligibility at these sub-107 rows (out of this route's
  scope — T3/F3/U3's territory), so this is not a claim that Tier 1 extends below `m=107`, only that
  this one necessary ingredient does not visibly break there.
- **Large-`m` LP+ρ₁ extension (no DP; both are cheap at this scale).** `m=10001` (`p*=53340`):
  `θ*=96/6668273429`, **exact match** to the closed form; `ρ₁`, margin computed exactly (a
  105-digit/103-digit fraction — reported in `RESULTS.json`, not reproduced in this prose).
- **Margin growth.** `(1−ρ₁(m))/θ*(m)` at `m=107,110,113,200,500,1001,10001`: `34.90, 35.88, 36.85,
  65.17, 162.83, 325.92, 3255.60` (floats, exact fractions in `RESULTS.json`). `margin/m` is
  `0.32618, 0.32616, 0.32614, 0.32587, 0.32566, 0.32559, 0.32556` — **monotonically decreasing and
  converging to ≈0.3256, not to `1/3≈0.3333`.** This REFINES `cycles/cycle-1/stage2/ROUTE-STATE.md`'s
  informal "margin growth ≈ m/3": the true asymptotic slope, to the precision sampled, is **about
  2.3% below `m/3`**, not equal to it. I have **not** derived a closed-form proof of this asymptotic
  constant (no explicit `M_0`/remainder is claimed — per fence 5, "≈" is reported only as an observed
  numerical trend across seven exact data points spanning `m=107..10001`, not asserted as a theorem).
- **Which constraints are tight, and how the tight set moves with `m` (this route's specific
  obligation).** At every one of `m=98,101,104,107,110,113,200,500,1001,10001` (10 rows spanning four
  orders of magnitude in `m`), the LP-optimal solution is tight (`Out(β,γ)=a+λn` exactly) at **40 of
  the 45 states**, failing only at `(β,γ)∈{(0,0),(0,2),(0,3),(0,4),(0,5)}`; and tight
  (`In(β,γ)=a2+λ2n` exactly) at **36 of 45**, failing only at the nine full states
  `{(0,8),(1,7),(2,6),(3,5),(4,4),(5,3),(6,2),(7,1),(8,0)}` (every `β+γ=8` state). **The non-tight set
  is IDENTICAL, state-for-state, at every sampled `m` — it does not move.** At `m=107` the exact
  slack values are tiny and structural: `Out(0,0)=0` vs affine `−7/1532386` (slack `7/1532386`); the
  nine `n=8` states all have the STRUCTURALLY forced `In=0` (since `d−n=0` there — no affine choice
  can change this) vs affine `4/766193` (uniform slack `4/766193` at every one). **This is an exact,
  quantified instance of the affine relaxation being measurably (if very slightly) conservative at
  the boundary states** — yet the certifying exact DP still returns `min_out=1, max_in=1` exactly
  (no aggregate slack), because the worst compositions found never concentrate mass on the
  affine-slack states enough to matter. I read this as evidence (not proof) that the affine LP's
  optimum already equals the true combinatorial optimum for this template, even though the affine
  bound is not everywhere individually tight.
- **Endpoint states (`γ∈{0,1,7,8}`, `β∈{0,1}`, `β+γ=8`).** At `n=d=8` (`β+γ=8`, e.g. `(0,8),(8,0),
  (1,7),(7,1),(4,4)`): `In(β,γ)=0` always (structural — no room, `d−n=0`); `Out(β,γ)` is CONSTANT
  across every `n=8` state at a given `m` (they are all affine-tight to the same line, hence forced
  equal) — e.g. at `m=107`, `Out=21473/1532386` at every `n=8` state; `σ(7)` (the only defined switch
  share touching a `β=1` endpoint, `(1,7)`) is `336/766193` at `m=107`. At `β=0,γ=1` (state `(0,1)`,
  the smallest nonzero leg count) and its mirror `(1,0)`: `Out=1339/766193`, `In=37493/1532386` at
  `m=107` — `In` here is the LARGEST `In` value among the sampled states I printed (states with small
  `n` have the most "room," `d−n` large, so they receive the most from the affine-tight deletion
  arcs above them). `σ` is only defined for `γ=1..7` (`d−1=7`; `γ=0` and `γ=8` are structurally outside
  its domain — a state can only "switch" through a support that is present, `β=1`, with at least one
  active private tag, `γ≥1`, and `γ=d` would require `β=0` which is never a switch state).
- **Does the affine separation ever become infeasible while the exact system stays feasible?**
  Attempted directly via `scratchpad/c1-F2/exact_cutplane.py`, an independently coded delayed
  constraint-generation (Kelley cutting-plane) solver that minimizes `θ` subject ONLY to the true
  combinatorial min-plus/max-plus requirement (no affine variables at all), adding one exact linear
  cut per iteration for the worst composition found by the DP. **Result: inconclusive within the
  tested budget.** At full scale (`m=107`) and at a deliberately small, fast, but still genuinely
  feasible toy analog (`d=3, m=10..40`, chosen because the affine model IS feasible there — `θ*=2/55`
  at `d=3,m=10`), the cutting-plane loop repeatedly patched ONE state's deletion probability per
  iteration without ever being forced to raise `σ`/`θ`, because each single-composition cut can
  always be satisfied by a single untouched `(b,g)` pair sharing the same leg-count `n`; it did not
  converge in 60 iterations (`d=8,m=107`) nor in the time budget available at the toy scale either
  (a genuine, not artificially truncated, limitation — this specific technique needs either many more
  cuts/iterations or a smarter aggregation than one-worst-composition-at-a-time, which is beyond
  this route's remaining budget). This experiment is kept in `scratchpad/c1-F2/` for a successor but
  is **not** part of the digested `RESULTS.json` (it never reached a determinate output, so nothing
  from it is shipped as a numeric claim). What IS shipped and exact: the SEPARATE, closed-form,
  non-LP proof that `θ=0` (no switch at all) is always infeasible (next item) — a clean special case
  of "does the exact system need switches," fully resolved, independent of any relaxation.
- **`θ=0` (deletion-only) is exactly infeasible — independent, non-LP proof
  (`deletion_only_bound.py`).** With `θ=0` the Switch row forces every `σ(γ)=0`, so all outflow from
  the `R_K=2^K·C(dm,K)` sector sources must land on the `R_{K−1}=2^{K-1}·C(dm,K-1)` in-sector
  targets; deletion arcs conserve total weight, so feasibility needs `R_K≤R_{K-1}`. I re-derive (from
  scratch, via `math.comb`, not by importing `sector.py`) that `R_K/R_{K-1}=p*/(p*-1)` EXACTLY, and
  `p*/(p*-1)>1` for every `p*>1` — checked exactly at ten rows (`m=95,98,101,104,107,110,113,14,200,
  500`) — so **switches are provably load-bearing at every one of these rows**, independent of the
  LP, the affine relaxation, or any specific allocation. This directly confirms
  `SEMANTIC-CONTRACT.md` §2's stated fact ("deletion arcs alone cannot serve the sector") from first
  principles rather than citing it.
- **Literal small-scale fidelity laboratory (`literal_check.py`).** Built CB(d,m) as an explicit
  vertex/edge list (own code); checked it is a tree by TWO INDEPENDENT methods — BFS reachability
  (connectivity) and a from-scratch union-find over the edge list (acyclicity, a different algorithm
  from parent-tracking DFS, so the two checks share no failure mode) — at `(d,m)∈{(2,2),(2,3),(3,2),
  (3,3),(4,2)}`: **all confirmed trees** (`edges=n−1`, connected, acyclic). Then literally enumerated
  root-plus-arm sector sources/targets at `(d,m,K)∈{(2,3,3),(3,2,3),(3,3,4),(2,5,4)}` and confirmed
  `|src|=R_K`, `|tgt|=R_{K-1}` and their ratio match the closed forms EXACTLY — a small-scale,
  independent-sides fidelity check in the spirit of shared rule 2, at laboratory scale (full-scale
  literal fidelity at `m≥107` remains route F1's `C1-F-01` obligation, not duplicated here).
- **Eligibility fixed points (peripheral to this route; reported because this route's tables touch
  them).** Own generic tree-DP (`eligibility_check.py`, independent of `rowdata.py`) reproduces,
  EXACTLY: `m=95`: `n=1618,α=856,x=506` (matches `SEMANTIC-CONTRACT.md` §5). `m=107`:
  `n=1822,α=964,x=570` (matches). `m=110`: `n=1873,α=991,x=586` (`n` matches the charter's cited
  "fresh test row," `n=1873`). `m=113`: `n=1924,α=1018,x=602` (`n` matches, `1924`). At all four,
  `p*−x=2` exactly (the sufficient-condition margin is at its tightest possible value, `x=p*−2`, not
  yet "interior" — `p*−x` only grows visibly at larger `m`: independently checked `p*−x=3` at `m=200`
  and `p*−x=7` at `m=500`, against the charter's own claimed asymptotic `256m/20451` giving `2.50` and
  `6.26` respectively — consistent to within integer rounding). `Δ_x=i_{x+1}-i_x<0` and
  `Δ_{x-1}=i_x-i_{x-1}≥0` confirmed (exact big integers) at every one of the four rows, i.e. `x` is
  genuinely the first strict descent, not merely asserted. **(ELIG-top)(a) itself is F3/T3/U3's
  obligation, not advanced here beyond this fixed-point reproduction.**
- **Residue-class note (`m≡0,1 (mod 3)`, record only — no proof obligation attaches).**
  `16m ≡ m (mod 3)` (since `16≡1`), so `16m+4 ≡ m+1 (mod 3)`. For `m≡2`: `m+1≡0`, `p*` exact (the r31
  class). For `m≡0`: `m+1≡1`, `⌊(16m+4)/3⌋ = (16m+3)/3`, i.e. `p*` would sit `1/3` below the next
  integer. For `m≡1`: `m+1≡2`, `⌊(16m+4)/3⌋=(16m+2)/3`, `p*` sits `2/3` below. Verified exactly for
  `m=100..111` (`RESULTS.json` does not carry this — pure modular arithmetic, checked inline, not
  worth a digest). This is why only `m≡2 (mod 3)` gives the EXACT top sector-deficient rank the
  charter freezes; it is not a claim about eligibility or Hall at the other two residues.

## Alias check (lexical and mathematical) and candidate claims

Searched `control/CLAIM-IDENTITY.run-local.json`'s 491 claims (by `claim_key` substring and by
JSON-blob keyword) for `CB`+`SECTOR`/`THETA`/`SWITCH`/`RESIDUAL`/`TEMPLATE`/`R31`, and separately for
`288`/`200*m`/"law of one LP" — **no existing key asserts or contradicts** either finding below, so
both are proposed as NEW `E993-R31-` candidates (lexical check: no alias/claim_key substring match;
mathematical check: no existing claim states a scope overlapping these two specific, narrowly-scoped
observations). I do not register these myself (registration is the controller/synthesis's authority,
not a route's); I name them here as candidates for the synthesis to alias-check again independently.

1. **Candidate `E993-R31-CB8-TOP-SECTOR-TEMPLATE-BOUNDED-BELOW-M107`.** Statement: "For `d=8` and
   `p*=⌊(16m+4)/3⌋`, the (L-S)_top choke-local sector-LP template of `SEMANTIC-CONTRACT.md` §2 is
   feasible with `θ*(m)=288/(200m²+82m+5)` exactly and `θ*(m)≤1−ρ₁(m)`, at every sampled
   `m∈{5,8,11,14,17,20,26,35,50,65,80}` (all `m<107`, outside the r31 class), and infeasible at
   `m=2`." Grade: `bounded_computation` (a finite sampled sweep, own exact LP+formula check; no
   universal claim). Scope: the sector-LP template ONLY — favorability, E1(i), and eligibility at
   these sub-107 rows are NOT checked and NOT claimed.
2. **Candidate `E993-R31-CB8-SECTOR-AFFINE-TIGHT-SET-INVARIANT-IN-M`.** Statement: "For `d=8`, at the
   LP-optimum of the (L-S)_top template, the set of `(β,γ)` states where the Out-affine (resp.
   In-affine) bound is NOT exactly tight is `{(0,0),(0,2),(0,3),(0,4),(0,5)}` (resp. every state with
   `β+γ=8`), identically at every sampled `m∈{98,101,104,107,110,113,200,500,1001,10001}` — the
   non-tight set does not move with `m` over four orders of magnitude." Grade: `bounded_computation`.

## Grades (never upgraded by use; this route's own contributions only)

- The five recorded θ* reproductions and the two required fresh rows (`m=110,113`): `bounded_computation`
  (exact, own solver, matches the frozen/conjectured values; not a proof of universality).
- The `m=200,500,1001` horizon extension and `m=10001` LP+ρ₁ extension: `bounded_computation`.
- The below-class sweep (`m=5..80`) and the `m=2` infeasibility: `bounded_computation` (new; not
  previously in the frozen record at these specific `m`).
- The `θ=0` deletion-only infeasibility proof (`p*/(p*-1)>1`): this is an exact identity checked at
  finitely many rows plus a one-line universal argument (`p*>1 ⟹ p*/(p*-1)>1`) — I grade it
  `proved` **for the identity `R_K/R_{K-1}=p*/(p*-1)` at the checked rows** and note the `p*>1`
  inequality is a trivial universal fact, but I do NOT claim a new registered theorem from this (it
  restates, independently, what `SEMANTIC-CONTRACT.md` §2 already asserts in prose).
- The tight-constraint/endpoint characterization and the margin-growth refinement (`≈0.3256·m`, not
  `m/3`): `bounded_computation` (exact fractions at seven points; no asymptotic theorem claimed).
- The literal small-scale fidelity laboratory: `bounded_computation` (laboratory scale only).
- The eligibility fixed-point reproduction: `bounded_computation` (own code, exact, matches frozen
  record; peripheral to this route).
- The cutting-plane affine-vs-exact experiment: **no grade** — it did not converge to a determinate
  result (neither `proved` nor `refuted` nor a usable `bounded_computation`; reported as a disclosed
  negative/inconclusive methodological attempt only).
- Carried inputs (favorability, E1, the CB row key, real-rootedness refutation): cited at their
  existing grades, never upgraded.

## Disclosures

- **Sign-error self-correction** (derivation step 3, above): a first-draft bug in this route's own
  LP construction, caught by cross-checking against the frozen record before any table was reported,
  not by an external critic. Fixed and re-verified.
- **Two harness auto-backgrounding events**, both resolved by literal-PID handling, never left
  detached: (1) an early exploratory `rho1` full-polynomial-convolution timing probe at `m=1001` that
  proved too slow (superseded by the O(1)-term closed form in `rho1.py`) — killed by its literal PID
  (`47183`, parent `47181`) once located via `pgrep -P`. (2) a second exploratory probe at
  `m=100001/1000001` for the same reason — killed by its literal PID (`48455`, parent `48453`).
  Neither superseded probe's output is used anywhere in `RESULTS.json`. (3) `generate_results.py`'s
  actual digested run was ALSO auto-backgrounded by the harness's 120s default; this one was NOT
  killed — I located its literal child PID, polled it in a bounded loop (`kill -0` every 5s) until it
  exited on its own (exit code 0, confirmed via the task-completion notification), then read its
  output. This is the run whose digest is reported above.
- **Read-boundary note (process listing, not a file read).** Locating the above PIDs with
  `pgrep -fl "python3 -B -c"` (before I narrowed the pattern) incidentally printed command-line text
  from two OTHER seats' concurrently running processes (`c1-F3`, `c1-T3` — their script names and
  inline Python source, visible only because they happened to be running at that moment). I did not
  open, read, or use any file belonging to those seats, and no content from their commands appears
  anywhere in this return or in `RESULTS.json`; I immediately narrowed subsequent lookups to
  `pgrep -fl "c1-F2"` / `pgrep -P <own-pid>`. Recorded here for transparency even though this is a
  process-table glimpse, not a `sources`/experiment-root file read, and so not itself a violation of
  the file-read grant.
- No other VerityOS file outside the two authorized boot files was read. No file was written outside
  `scratchpad/c1-F2/`, `scratchpad/c1-F2-replay/`, and this `RETURN.md`.

## Gate lines (`C1-STAGE1-GATE.md` ruling 6)

`LS_top: advanced`
`ELIG_top: not_advanced`
`cut_candidate: none`

## Route verdict

`bounded_evidence` — this route gathered new, exact, reproducible computational evidence (own
solver, own DP, own tree-DP, own literal laboratory) supporting (L-S)_top's plausibility across a
much wider range than previously recorded (down to `m=5`, out to `m=10001`, with zero exceptions
found), sharpened the informal margin-growth claim, exactly characterized which constraints bind and
showed the binding set is invariant in `m`, and rigorously proved (independent of any LP) that
switches are load-bearing at every tested row. It did **not** prove the universal theorem (not this
route's job) and found **no cut, no counterexample, and no template failure** anywhere sampled.

`headline_resolved: no`

## Remaining obligation (successor inheritance)

1. **(L-S)_top is still open.** This route's evidence is consistent with, but does not prove,
   feasibility for all `m≥107`, `m≡2 (mod 3)` — nor does it prove the conjectured closed form
   `θ*_8(m)=288/(200m²+82m+5)` is exact for all such `m` (only checked exactly at 13 in-class rows:
   `95,98,101,104,107,110,113,200,500,1001,10001`, plus 11 below-class rows as context). T1's route
   owns closing this with a proof; this route's exact match at every sampled row (spanning four
   orders of magnitude) is strong but non-exhaustive support.
2. **Whether the affine relaxation is ever strictly conservative is UNRESOLVED.** The cutting-plane
   experiment (`exact_cutplane.py`) did not converge; a successor with either (a) a smarter cut
   aggregation (e.g., grouping by leg-count `n` rather than one worst composition at a time — since
   the tight-set is `n`-structured, this is a promising, concrete next step I did not have budget to
   implement) or (b) an analytic argument for why the observed tight/non-tight state partition is
   forced (it did not move across 10 sampled `m` spanning 98 to 10001 — a strong hint it is a fixed
   structural fact, not a per-instance LP artifact) could close this cleanly. Closing it in either
   direction would tell T1/T2 whether their affine-derived `θ*(m)` is already optimal (strengthening
   confidence in the closed-form conjecture) or whether a smaller, non-affine `θ(m)` exists (which
   would not break Tier 1 — any feasible `θ` proves (L-S)_top — but would falsify the conjectured
   formula's claim to being the LP's true optimum, if T1 asserts optimality anywhere).
3. **The margin asymptotic constant (`≈0.3256`, not `m/3`) has no closed-form derivation here.** A
   successor could derive `lim_{m→∞} m·(1-ρ₁(m))` exactly from the binomial closed form in `rho1.py`
   (only `a=7` terms; tractable) and combine with the exact `θ*` formula's leading term
   (`288/(200m²)=1.44/m²`) to get a clean closed-form asymptotic slope, with an explicit `M_0` and
   remainder — I have not done this (only sampled seven exact points).
4. **Below-`m=107` behavior of the OTHER three ingredients (favorability, E1(i), eligibility) was not
   checked by this route** — only the sector-LP template was tested there. A full account of why the
   charter's class starts at `m=107` (provenance vs. genuine obstruction) needs those three checked
   too, at the same small `m` this route used (`5..80`).

## Model disclosure

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model
id: `claude-sonnet-5`.
