# RETURN — Seat T3, Cycle 1, r31 (Erdős #993: parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank)

Route ID: `C1-T-03`. Mechanism token: `ELIG-TOP-BLOCK-MIXTURE-PARENT-DESCENT`. Orientation: T (prove). Load-bearing obligation:
`R31-OBL-ELIG-TOP` (OBLIGATIONS.csv, digest verified below) — (ELIG-top)(a): `i_{p*-1}(CB(8,m)) < i_{p*-2}(CB(8,m))` for
every `m ≥ 107`, `m ≡ 2 (mod 3)`.

## Boot acknowledgment

VerityOS booted for this seat by reading EXACTLY the two authorized files and nothing else: `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Per `DISPATCH-T3.md` and `C1-WORKER-COMMON-BRIEF.md`, the startup
protocol's own map into memory, conversations, modules, skills, logs and decisions was NOT followed (the controller has booted for
the run). No other VerityOS file outside the two boot reads and the granted experiment root was opened — see
`## Read-boundary disclosure` below for the one caveat (dispatch-digest verification).

Dispatch verified: `control/dispatch/c1-stage3/DISPATCH-T3.md` SHA-256 = `a3e678b7aabb8d67271dbcff403ce4b32fe24cc4b7368a7f5d73262fa9ca25ff`
(matches the value given in the task instruction; recomputed with `shasum -a 256`).

## Stage 2 seal

Recomputed SHA-256 over the canonical JSON of `control/C1-STAGE2-PACKET-MANIFEST.json` with the `seal_sha256` field removed
(`sort_keys=True`, `separators=(",", ":")`, no trailing newline, `python3 -B`):

```
e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc
```

This equals both the manifest's own recorded `seal_sha256` and the value named in `DISPATCH-T3.md`. **Seal: MATCH.**

Digests of every source file this route reads were independently recomputed and checked against
`control/C1-STAGE2-PACKET-MANIFEST.json` / `sources/SOURCE-DIGESTS.json`, all MATCH:

| File | SHA-256 |
|---|---|
| `control/C1-WORKER-COMMON-BRIEF.md` | `89a93d95c8290ee4bfaacdee4a733267362b4a17a327a729e9a6caaf66552b00` |
| `SEMANTIC-CONTRACT.md` | `7cc0bf434d6ea8f8fa2d812caf4e45787c1c06a9dfc6846b6b4d54cb60cf226e` |
| `SOLUTION-CONTRACT.md` | `480ba2ddda557be50b2d8249feb733be7e3c947d2e0a9dd4e7fee1427a7ef719` |
| `control/C1-ALLOCATION.md` | `497beb925ad150d1ee783fe9d842e397fa5a03f8393e4b581254def648e062a1` |
| `control/C1-STAGE1-GATE.md` | `84365a8e85ee2368c3f839721a49941e4e109d5c50799013357f14113665d3c6` |
| `OBLIGATIONS.csv` | `8d8cd5116fd8c5a95a588804a1f6352bc9a060133306c9d7b1fb8253eca02880` |
| `sources/authority/CLAIM-IDENTITY.json` | `b4a339eff1e2cdc04ceedcdd55fdd53697574bf64ed7e26631c50d84d56e470b` |
| `control/CLAIM-IDENTITY.run-local.json` | `b4a339eff1e2cdc04ceedcdd55fdd53697574bf64ed7e26631c50d84d56e470b` (byte-identical copy, as prescribed) |

`cycles/cycle-1/stage2/ROUTE-STATE.md` was also read (route status `open`, inherits "the closed forms; the block decomposition; the
struck real-rootedness argument (never reuse)" for T3) but is a cycle-state record outside the sealed Stage 2 packet, so no digest
is asserted for it against the manifest.

## IMPORT LIST (every generator; standard library only, no network, no third-party packages)

`math`, `hashlib`, `json`, `sys`, `time`. Every invocation below is `python3 -B`.

## Fixed points reproduced before any table (SEMANTIC-CONTRACT §5)

Reproduced from the closed forms alone, independently of the r30 instruments, by the generator's own exact solver
(`scratchpad/c1-T3/gen_eligtop.py`, `full_independence_coeffs` + `first_strict_descent`):

| m | n | α | x (computed) | x (record) | match |
|---|---|---|---|---|---|
| 107 | 1822 | 964 | 570 | 570 | yes |
| 95 | 1618 | 856 | 506 | 506 | yes |

Both rows also satisfy the derived consequence `x ≤ p* − 2` (`p*=572` and `508` respectively). These are asserted in the generator
as `assert` statements that abort the run on any mismatch (they did not abort). This is the mandated "reproduce fixed points before
reporting" step; the θ*, ρ_1, σ fixed points of §5 belong to (L-S)_top, not to this route's obligation, and are not re-derived here.

## Registered claims this route touches (named before any census, per SEMANTIC-CONTRACT §4 / brief item 3)

- `R31-OBL-ELIG-TOP` (this route's obligation; OBLIGATIONS.csv) — re-confirmed at every census row below, in the sense of
  extending its `bounded_computation` record with an independently written generator, and touched by the new partial structural
  result below.
- `E993-TREE-REAL-ROOTED` (REFUTED, witness order 4) — cited only as the reason Newton/Darroch are NEVER applied to `I(CB(d,m))`,
  `G(x)` or `G(x)^m` in this route; every real-rootedness-dependent step below is applied strictly to the block factors
  `(1+x)^A(1+2x)^B`, which are real-rooted (all roots `−1`, `−1/2`), never to `I`, `G` or `G^m`.
  `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-…` and the E1 threshold key are NOT touched by this route (they concern favorability
  and the deletion flow at `p*`, not (ELIG-top)(a)); named here only to record they are NOT re-confirmed or re-used by this return.
- No claim is registered as PROVED by this return (see Route verdict). A **candidate** key is named in `## Remaining obligation`
  for a successor, not registered now.

**Alias check (lexical AND mathematical), before any of the above is treated as new:**
- *Lexical:* `grep -o '"E993-[A-Z0-9-]*"' control/CLAIM-IDENTITY.run-local.json` restricted to `ELIG-TOP|BLOCK-MIXTURE|PARENT-DESCENT|
  DESCENT` returns 18 hits, none of which name CB(8,m), the top sector-deficient rank, or a block-mixture argument (they are r25/r27
  forest-descent and path-star keys, and `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER`, a different general fact about the crossing
  index, not this family). `grep` against `sources/authority/CLAIM-IDENTITY.json` for `ELIG-TOP|BLOCK-MIXTURE|PARENT-DESCENT|CB-8`
  returns exactly one hit, `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`,
  which is the (H)/HALL row key for `m ∈ [95,107]`, not an (ELIG-top)(a) statement. No lexical collision.
- *Mathematical:* no registered key states or implies `i_{p*-1}(CB(8,m)) < i_{p*-2}(CB(8,m))` for the general class, nor the
  block-decomposition reduction or the per-block threshold identity derived below; `E993-R30-CB-D-AT-LEAST-6-…-FLOOR-2DM-PLUS-4-OVER-3-
  WHEN-DM-NOT-2-MOD-3` is about favorability of leaves at `p*`, a different object. No mathematical collision.

## Derivation, step by step (hypotheses named at every entry point)

**1. Exact reduction to a mixture over blocks.** From the carried closed forms (SEMANTIC-CONTRACT §2, not re-derived): with
`d=8`, `G(x) = (1+2x)^8 + x(1+x)^8` and `I(x) := I(CB(8,m))(x) = (1+2x)G(x)^m + x(1+x)(1+2x)^{8m}`. Writing `G = A + B` with
`A=(1+2x)^8`, `B=x(1+x)^8`, the binomial theorem (no real-rootedness hypothesis needed here — this step is pure algebra) gives
`G^m = Σ_{j=0}^m C(m,j) x^j (1+x)^{8j} (1+2x)^{8(m-j)}`, hence
`I(x) = Σ_{j=0}^m C(m,j) x^j P_j(x) + x(1+x)(1+2x)^{8m}`, where **`P_j(x) := (1+x)^{8j}(1+2x)^{8(m-j)+1}`, degree `8m+1` for every
`j`** (the `x^j` shift, not a degree change in `P_j`, is what spreads the blocks over degrees `8m+1 .. 9m+1 = α`). Writing
`a_j(l) := [x^l]P_j(x)` and `t_k := [x^k]{x(1+x)(1+2x)^{8m}} = C(8m,k-1)2^{k-1} + C(8m,k-2)2^{k-2}` (ℤ-valued, `C(n,r):=0` for `r<0`
or `r>n` — the only ℕ-subtraction/cast points in this identity, both made explicit here), **`i_k = Σ_{j=0}^m C(m,j) a_j(k-j) + t_k`**.
This identity was checked against the generator's independent closed-form evaluation of `i_k` at `m=107` (`identity_check_pass: true`,
`scratchpad/c1-T3/block_check_107.json`) — see Computation, item (b).

**2. Real-rootedness is invoked only here, and only on `P_j`.** `P_j(x) = (1+x)^{8j}(1+2x)^{8(m-j)+1}` is a product of two
real-rooted polynomials with positive coefficients (roots `−1`, multiplicity `8j`, and `−1/2`, multiplicity `8(m-j)+1`), hence
real-rooted itself, hence (Newton's inequalities; a standard corollary, stated and used ONLY for this real-rooted, positive-coefficient
polynomial, never for `I`, `G` or `G^m`) its coefficient sequence `a_j(·)` is log-concave: `a_j(l)^2 ≥ a_j(l-1)a_j(l+1)`. A positive
log-concave sequence has non-increasing ratio `a_j(l+1)/a_j(l)`, so `g_j(l) := a_j(l) − a_j(l+1)` changes sign **at most once**, from
`≤0` to `≥0`, as `l` increases (this is the only use of "Darroch/Newton-type" reasoning in this route, and it is used only in this
weak, fully elementary form — the single-crossing property — never as a cited numerical mode formula).

**3. Reduction of (ELIG-top)(a) to a sign-of-mixture statement.** `i_{p*-2} − i_{p*-1} = Σ_{j=0}^m C(m,j) g_j(p*-2-j) + (t_{p*-2}-t_{p*-1})`.
Writing `l_j := p*-2-j`, (ELIG-top)(a) at `m` is exactly `Σ_j C(m,j) g_j(l_j) + (t_{p*-2}-t_{p*-1}) > 0`.

**4. The exact mean/threshold identity (elementary, no external theorem cited).** Treat `P_j` as the (unnormalized) generating
function of a sum of `8j` independent `{0,1}`-variables with `P(=1)=1/2` (from `(1+x)`) and `8(m-j)+1` independent `{0,1}`-variables
with `P(=1)=2/3` (from `(1+2x)`); mean `μ_j = 4j + (2/3)(8(m-j)+1)`. A direct algebraic computation (elementary arithmetic, no
theorem needed) gives the exact identity
```
l_j − μ_j = (j − 4)/3      for every j = 0,…,m and every m in the class.
```
This says the "which side of the mean is `l_j` on" question depends on `j` alone, not on `m` — a genuinely useful reduction. It was
verified to hold EXACTLY (`l_minus_mu_formula_verified: true`, to `<1e-9` in floating comparison of exact-rational quantities) for
every `j=0..m` at `m ∈ {107,110,113,116,200,500}` (`scratchpad/c1-T3/block_check_107.json`, `block_check_multi.json`).

**5. An exact, fully elementary, general-`m` proof for `j=0`.** For `j=0`, `A=0`, `B=8m+1`, `a_0(l) = C(B,l)2^l` exactly (a pure
binomial, no mixture — the special case with no `(1+x)` factor at all). The ratio `a_0(l)/a_0(l-1) = 2(B-l+1)/l` is `≥1` iff
`l ≤ (2B+2)/3`, so (elementary, exact, no asymptotics) `g_0(l) ≥ 0` iff `l ≥ (2B-1)/3`. Here `l_0 = p*-2 = (16m-2)/3` and
`(2B-1)/3 = (16m+1)/3 = l_0 + 1`. Hence **`l_0` is exactly one unit below the threshold, for every `m` in the class**, so
`g_0(l_0) < 0` strictly, for every `m ≥ 107`, `m ≡ 2 (mod 3)` — a fully general, proved (not merely tested) fact, with no explicit
`M_0` needed because it is an identity, not an asymptotic.

**6. An exact recursive reduction for general `j` (new, not in the r30/heterogeneous sources; derived here).** Expanding
`a_j(l) = Σ_i C(8j,i) C(B_j, l-i) 2^{l-i}` with `B_j := 8(m-j)+1` and comparing `a_j(l+1)-a_j(l)` term by term shows
```
g_j(l_j) = Σ_{i=0}^{8j} C(8j,i) · g_0^{(B_j)}(l_j − i)
```
where `g_0^{(B)}(k) := C(B,k)2^k − C(B,k+1)2^{k+1}` is exactly the `j=0` object of step 5 (a pure-binomial difference), and
`g_0^{(B_j)}(k) ≥ 0 ⟺ k ≥ (2B_j-1)/3` (step 5's threshold, now with `B_j` in place of `B`). Substituting `τ_j := (2B_j-1)/3` and
computing `l_j − i − τ_j = (13j-3)/3 − i` (elementary algebra) shows: `g_j(l_j)` is a `C(8j,·)`-weighted sum of `9`·(for `j=1`)…
`8j+1`-many pure-binomial differences, with the "positive/negative" split at `i* = (13j-3)/3`, an explicit threshold **independent
of `m`**. Since `C(8j,i)` is symmetric and unimodal about `i=4j`, and `i* − 4j = (j-3)/3` grows linearly in `j` while the spread of
`C(8j,·)` grows only like `√j`, this identity explains (without yet fully proving, for lack of a completed magnitude bound — see
Remaining obligation) why only finitely many small `j` can have `g_j(l_j) < 0`: `j=0` is proved above; `j=1,2` land the crossover
`i*` close to the peak of `C(8j,·)` (`i*=10/3` vs peak `4` for `j=1`; `i*=23/3≈7.67` vs peak `8` for `j=2`) and are exceptional at
every tested `m`; from `j=3` on, `i*` is already just past the peak (`i*=12` = the exact center of `C(24,·)`, inclusive on the
"good" side) and empirically resolves non-negative at every tested `m`.

**7. What is NOT claimed.** No asymptotic step here uses an unstated `M_0`: item 5 is an exact identity for all `m`; item 6 is an
exact identity, with the magnitude comparison across `j` (needed to close the full mixture sum in step 3) explicitly UNRESOLVED — it
is not asserted, asymptotically or otherwise, and is named in `## Remaining obligation`. This route never applies Newton or Darroch
to `I`, `G` or `G^m` (fence 3), never treats the LP/θ* material (out of scope — (L-S)_top is T1/T2's obligation), and makes no claim
beyond `(CB(8,m), p*)`, `m ≥ 107`, `m ≡ 2 (mod 3)` (fence 5).

## Computation (every numeric claim: generator, digest, replay)

**(a) Fixed points + extended exact census of (ELIG-top)(a).** Generator `scratchpad/c1-T3/gen_eligtop.py` (SHA-256
`589d9e6f486c162cf6f29b9b41f0a3c6a408a79c37d27a13b55699d1df22d833`) computes `i_k` via the closed form directly (truncated sparse
polynomial power of `G`, cap `= p*`, plus the exact binomial tail formula — no graph object, no floating point, no FFT). It (i)
reproduces the two fixed points above with `assert`-enforced matching (aborts on mismatch — did not abort); (ii) sweeps
`m = 107, 110, 113, …` computing `p*, i_{p*-2}, i_{p*-1}, Δ_{p*-1} := i_{p*-2} - i_{p*-1}` exactly, under a wall-clock budget (not a
correctness parameter — purely how far the exact sweep got in the foreground before this return was due).

Result: **`census_m_attained_max = 584`, `census_row_count = 160`, `census_all_hold = true`** — (ELIG-top)(a) holds, exactly, for
every `m ≡ 2 (mod 3)` in `[107, 584]` (160 rows; this OVERLAPS but does not exceed the r30 record's `bounded_computation` to
`m=2395` — it is an independent re-derivation from a freshly written generator over part of that range, not an extension of it;
the horizon actually attained in this session's foreground budget is `584`, reported honestly rather than assumed).
`report_sha256 = dd1e4d45350500fbeead46700b37a0f8696221310096c959a1b8a251e0789b8f`;
`rows_sha256 = 853e320181d910a0a937ff7bc36d2c0946f196a37807965098ec9b06132d7613` (full row table:
`scratchpad/c1-T3/eligtop_rows.json`, byte-verified against this digest). Sample rows (`m`, `p*`, `Δ_{p*-1}` = `i_{p*-2}-i_{p*-1}`,
digit count of `Δ` as a scale indicator):

| m | p* | Δ_{p*-1} (digits) | eligtop_a_holds |
|---|---|---|---|
| 107 | 572 | 407 | true |
| 110 | 588 | 418 | true |
| 113 | 604 | 430 | true |
| 578 | 3084 | 2213 | true |
| 581 | 3100 | 2224 | true |
| 584 | 3116 | 2236 | true |

Replay (copy-out-first, target under scratch, never `/tmp`):
```
mkdir -p /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T3-replay
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T3-replay/gen_eligtop.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T3-replay/gen_eligtop_replay.py
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T3-replay
python3 -B gen_eligtop_replay.py 584 250
```

**(b) Block-mixture identity and exceptional-set check.** Generator `scratchpad/c1-T3/block_mixture_check.py` (SHA-256
`19c2d45d49917105706e0f47227454c35579efff02e42176816793301595b58d`) computes, for each `j=0..m`, `a_j(l_j)`, `a_j(l_j+1)`,
`g_j(l_j)`, `μ_j`, and checks (i) the exact identity `l_j - μ_j = (j-4)/3` and (ii) that
`Σ_j C(m,j)g_j(l_j) = [x^{p*-2}]{(1+2x)G^m} - [x^{p*-1}]{(1+2x)G^m}` (the block decomposition of step 1, verified against a direct
closed-form evaluation — NOT the same code path as (a), an independent cross-check).

At `m ∈ {107, 110, 113, 116, 200, 500}` (six rows spanning most of the census range in (a)): `identity_check_pass = true` and
`l_minus_mu_formula_verified = true` at every row; **exceptional_j_values = [0, 1, 2]** at every one of the six rows (no other `j`
ever showed `g_j(l_j) < 0`, and no row showed a boundary tie `g_j(l_j)=0`). SHA-256 of the six-row output:
`31c74b7c477e1b41a5f905954e2c25c0f707d4f8e5189f16c4980247f1e9e9b1` (`m=110,113,116,200,500`) and
`48bfbf4d1218b5464dce37a0995b63269395991aa8bc1d44e704a9f1c0ce9903` (`m=107` alone); files
`scratchpad/c1-T3/block_check_107.json`, `block_check_multi.json`. This is evidence toward, but not a proof of, "the exceptional
set is `{0,1,2}` for every `m` in the class" (see Remaining obligation).

Replay:
```
mkdir -p /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T3-replay
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T3-replay/block_mixture_check.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T3-replay/block_mixture_check_replay.py
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-T3-replay
python3 -B block_mixture_check_replay.py 107
python3 -B block_mixture_check_replay.py 110 113 116 200 500
```
No wall-clock, PID or host value is hashed in `rows_sha256` or in `block_mixture_check.py`'s output digests — those are the digests
cited above as evidence for the mathematical content, and they are exactly reproducible by rerunning the commands below.
**Disclosure:** `gen_eligtop.py`'s top-level `report_sha256` DOES additionally fold in `wall_seconds` (a timing artifact, not a
mathematical claim), which is a generator hygiene defect — `report_sha256` itself is therefore not run-to-run reproducible and is
NOT cited above as evidence for anything; only `rows_sha256` (timing-independent, over the row table alone) is cited. Flagged here
rather than silently corrected after the fact.

## Acyclicity/connectivity — not applicable, disclosed

No literal graph (vertex/edge set) is constructed anywhere in this route's instruments; both generators operate purely on the
algebraic closed forms carried from SEMANTIC-CONTRACT §2. The brief's acyclicity-and-connectivity check applies to routes that
build the literal CB(8,m) network (F1, U1, U2); this route has nothing to check and none is fabricated.

## Process discipline disclosure

Two invocations of `block_mixture_check.py` (batch argument lists spanning up to `m=2000`) exceeded this tool environment's default
foreground timeout and were moved to background by the harness, not by this seat. In both cases the seat located the literal PID by
name-targeted `pgrep -f block_mixture_check.py` (never a full process listing), and: the first (m-values including 2000, judged too
expensive after benchmarking) was killed by literal PID before completion; the second (the `m ∈ {110,113,116,200,500}` batch actually
reported above) was polled by rereading its output file and confirmed to have exited on its own (exit code 0) with no PID remaining.
No job was left running; none was awaited via a detached-and-ignored pattern — each was checked and either killed or confirmed
finished before this return was written.

## Grades (never upgraded by use)

- Step 1 (exact block decomposition, `i_k` identity): elementary algebra, `proved` (verified computationally at `m=107`, not merely
  asserted).
- Step 2 (log-concavity of each `P_j`): `proved`, standard corollary of real-rootedness, hypothesis stated and satisfied.
- Step 4 (`l_j - μ_j = (j-4)/3`): `proved` (exact identity, elementary arithmetic; computationally spot-checked, not merely
  computed once).
- Step 5 (`j=0` always exceptional, `g_0(l_0)<0` for every `m` in the class): `proved`.
- Step 6 (recursive identity `g_j(l_j) = Σ_i C(8j,i) g_0^{(B_j)}(l_j-i)`): `proved` (exact algebraic identity); the qualitative
  account of why `j≥3` resolves positive is informal commentary on the identity, not a proof, and is not graded above `conjecture`.
- "Exceptional set = `{0,1,2}` for every `m ≥ 107`, `m≡2(mod3)`": `bounded_computation` (six rows, `m∈{107,110,113,116,200,500}`),
  NOT `proved_informal` — no argument closes it for arbitrary `m` yet.
- (ELIG-top)(a) itself on `m ∈ [107,584]` (`m≡2 mod3`): `bounded_computation` (this route's own independent generator), consistent
  with and inside the r30 `bounded_computation` record to `m=2395`.
- (ELIG-top)(a) on the full class `m ≥ 107`: **not proved by this return**; carries the same status it entered Cycle 1 with, plus
  the new structural reduction above as an unregistered candidate lemma for a successor.
- Carried inputs (favorability, E1(i), the closed forms themselves): cited at their registered grades (`proved_informal` modulo
  Darroch/Newton on real-rooted factors, `proved_informal` respectively); not re-proved, not touched by this route's obligation.

## Gate lines (ruling 6)

`LS_top: not_advanced`
`ELIG_top: advanced`
`cut_candidate: none`

## headline_resolved

`headline_resolved: no`

## Route verdict

`bounded_evidence`

Rationale: a genuine new exact structural reduction (steps 1–6) was derived and independently verified computationally, and a
sub-case (`j=0`) was proved for the entire class with no `M_0` needed; but the full mixture-dominance inequality that would upgrade
this to `proved_conditional` or `proved` is not established, and (ELIG-top)(a) itself was only checked over a finite range
(`[107,584]`), not proved uniformly. No obstruction or deficient cut was found anywhere in the tested range, so `refuted` does not
apply; the structural work is more than `compiled` scratch; `blocked` would understate the real progress made.

## Remaining obligation

Successor inherits, in order of leverage:

1. **Close the magnitude comparison, not just the sign comparison, across `j`.** Step 6 shows `g_j(l_j)` is a `C(8j,i)`-weighted
   sum of pure-binomial differences `g_0^{(B_j)}(l_j-i)` with a threshold index `i* = (13j-3)/3` that sits `(j-3)/3` above the
   `C(8j,·)` weighting's center `4j`. A Hoeffding-type bound (`P(X ≥ n/2+t) ≤ exp(-2t²/n)` for `X~Binomial(n,1/2)`, standard,
   not yet invoked here) applied to this offset, COMBINED with an explicit bound on `|g_0^{(B)}(k)|` itself (not derived in this
   return — `g_0` is smallest near its own crossing point and this needs its own explicit magnitude bound, not just the sign fact
   of step 5), is the natural route to an `m`-independent constant `J_0` such that `g_j(l_j) ≥ 0` for all `j > J_0`, reducing the
   whole family to a FINITE check over `j ≤ J_0` — but this magnitude step was not completed here and is genuinely the crux.
2. **Prove (or refute) "exceptional set = `{0,1,2}` for every `m ≥ 107`, `m ≡ 2 (mod 3)`"** — currently `bounded_computation` at 6
   rows only. If item 1 yields an explicit `J_0` (even if larger than 2), this becomes a finite, closed check.
3. **Close the weighted sum `Σ_j C(m,j) g_j(l_j) + (t_{p*-2}-t_{p*-1}) > 0`** given items 1–2: bound the total weight
   `C(m,0)|g_0(l_0)| + C(m,1)|g_1(l_1)| + C(m,2)|g_2(l_2)|` (three explicit, closed-form-in-`m` terms once items 1–2 are settled)
   against the combined positive contribution from `j ≥ 3` (or `j > J_0`), with an explicit `M_0` if the argument is asymptotic in
   `m`, and exact certificates below `M_0`.
4. **Extend the exact computational census past `m=584`** if a faster (e.g. modular/CRT sign-only, or FFT-free but sub-cubic exact)
   generator is written — this route's generator is exact but scales roughly cubically in `m` (empirically: `m=800` single row
   ≈12.5s; observed exponent ≈2.9 over `m∈[500,800]`) and could not be pushed past `m≈584` inside one session's foreground budget
   while also completing the derivation above; the r30 record already reaches `m=2395` by other (unread, per this route's grant)
   means, so this item is lower priority than 1–3.

No candidate `E993-R31-` key is registered by this return (nothing here rises to a citable lemma on its own face yet); a successor
completing item 1 should register the reduction of step 6 together with an explicit `J_0` and the resulting finite-check theorem as
a single `E993-R31-` predicate, alias-checked against the (now larger) run-local registry at that time.

## Model disclosure

Chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id: claude-sonnet-5.
