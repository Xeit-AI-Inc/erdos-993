# Critique

Critic `C-T1-F` (orientation F, falsify) of the Cycle 6 route return of seat `T1` (`C6-T-01 CB-TOP-DEFICIENT-RANK-UNIFORM-SWITCH-HALL`,
orientation T), run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30), 2026-09-27.

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other VerityOS file. Subsystem in use: `experiments/` (this run
root only, within the capsule grant). The dispatch `control/dispatch/c6-stage4/DISPATCH-C-T1-F.md` was digest-verified
(`f3a4aebf7860865a3cd9740aaf572a9a78c30e76bb11d19044fa3174380fb3cb`, `shasum -a 256`, match) before I followed it.

**Model disclosure (two parts).** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Summary of the critique.** The return's one graded new result, Claim 1 `(ELIG-top)` at `proved_informal` for `m ≥ 246`,
rests on a false lemma. The return claims that "the independence polynomial of any finite forest has only real roots".
`K_{1,3}` (`1 + 4x + 3x² + x³`, one real root) refutes it. So does every polynomial the return applies it to: `I(CB(8,m))`,
`I(CB(8,m) − v)` and `I(CB(8,m) − c)` for `m = 1..4`, and the choke gadget `G_8`, all have non-real roots. The Darroch tail proof
is struck, and the `[239, 245]` "covered by both" overlap is covered by neither. The return's obligation (ii) "scoping finding"
also misreads the family: the registered E1 threshold equals `p*` exactly for every `m ≢ 1 (mod 3)`, which is all of `𝒞_8`.
What survives is a bounded exact record. I replayed it, and I extended the exact range with my own instrument to `m ≤ 2395`.

Critic-derived advance: expanding `G^m` binomially writes both deleted-tree polynomials as nonnegative sums of products of
linear factors, so Darroch applies legitimately to each summand. This proves (modulo Darroch/Newton) the favorability half of
`(ELIG-top)`: every leaf is favorable at `p*`, uniformly for every `d ≥ 6`, every `m` with `dm ≢ 2 (mod 3)`, and hence on all of
`𝒞_8` and its `d = 7` analogue. The eligibility descent (a) stays bounded.

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Dispatch `DISPATCH-C-T1-F.md` | `f3a4aebf7860865a3cd9740aaf572a9a78c30e76bb11d19044fa3174380fb3cb` | `shasum -a 256` | match |
| Capsule `c6-critic-capsules/T1-PACKET-MANIFEST.json` inner seal | `bba67d9c0168cbc3d163ac1fa7e2df6aba5cdf115dfe5bdf041d4fc7d22ae5cf` | canonical JSON minus `seal_sha256` (sort_keys, `(",",":")`, no newline) | **match** |
| Capsule members (14) | per manifest | SHA-256 and byte count of each | 14/14 match |
| Stage 2 manifest seal | `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611` | canonical recompute | match |
| Stage 3 manifest seal | `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd` | canonical recompute | match |
| Stage 4 dispatch manifest seal | `74be1845f4005d6846c10eacdebf5049b6d7d971a53b445c1dcab3b3637ddf50` | canonical recompute | match |
| Return `cycles/cycle-6/stage3/returns/T1/RETURN.md` | `761857cd61f59d21daf4b803810429b3c701fca2a16e9ce55ca78e8168c10c97` (capsule and Stage 3 manifest) | SHA-256 | match (41010 bytes) |
| Return-listed: `DISPATCH-T1.md` | `2c28b211bbfc18fcc676185f87518534b2e0c3a1d00d0ccdd06228b322a42be6` | bound by the Stage 3 manifest entry (file not a capsule member, not opened) | consistent |
| Return-listed: evaluator `sources/lower-region/inputs/ordinary_tree_checked.py` | `a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d` | `shasum` + `SOURCE-DIGESTS.json` entry (16710 bytes) | match |
| Return-listed: `alias_check.py` | `b95f06049e4dc1951390b3802eb0597856870a711fbae953085c99266167fef6` | `shasum` of the seat copy | match |
| Return-listed: `ALIAS_CHECK_DIGEST_SHA256` `93cb41bd6762da476b48d36ac51ecf582206e2da01f7bcc5430d6e4241c94b7a` | seat's `alias_check_output.log` prints this literal and `total_hits: 66` | **not replayed** (the script reads `control/CLAIM-IDENTITY.run-local.json`, not a capsule member) | self-report only |
| Return-listed: `RESULT_DIGEST_SHA256` `bc0a316c42ca6eb0df7e977c73d2f89de9a0657a0a090b8094d142ce64e7356e` | copy-out replay of `t1_main.py` (`306a8344c2f60987e9863a4f62168772cbd52d03264acc762dea94323f731fe2`) in my scratch | reproduced; replay log byte-identical to the seat's `t1_main_run.log` (`4e6a2fda857397ddaa377b74c438c98239421808d99fd9d618c56fb022cf141d`) | match |

Registry keys touched: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (HALL, OPEN, untouched);
`E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN, untouched);
`E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (cited; its applicability is corrected below);
`E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS` (a registered Darroch-dependent claim
about `x(CB(d,m))`, relevant to the alias distinction); the candidate `E993-R30-CB-EIGHT-TOP-RANK-COEFFICIENT-DESCENT-AND-LEAF-FAVORABILITY`
(STATED by T1; assessed under Mechanism-equivalence).

**My read-boundary and process disclosures.**
- I opened the boot pair, the dispatch, the capsule and its 14 members (for the attack briefs, only the preamble and the T1
  section), the seat's inventoried scratch `scratchpad/c6-T1/` (a non-recursive `ls`, `t1_main.py`, `t1_main_run.log`,
  `alias_check.py`, and a `grep`/`tail` of `alias_check_output.log`), and the authorized evaluator, which I hashed; its code
  executed only inside the replay.
- Every `grep` I ran was a non-recursive search of a named capsule member or inventoried file (`SEMANTIC-CONTRACT.md`,
  `C6-ALLOCATION.md`, `SOURCE-DIGESTS.json`, the attack briefs, the alias log). There was no `find`, no `rg`, no recursive
  listing, no search rooted above the grant, no network and no installs. I ran no `lake` or `lean`.
- The attack brief calls CF-REPLAY-c6d "a capsule member", but it is not in my capsule. I did not read it or any other
  controller fact, and every comparison the brief routes through a CF replay I made against my own instrument instead. The
  brief's statement about capsule contents is itself an erratum candidate under ruling 50.
- `alias_check.py` was copied to my scratch but not executed, because it reads a non-capsule file.
- The host-injected CLAUDE.md asks for conversation logging, and memory context was present. Neither was acted on: the
  dispatch's read and write boundary governs this seat.
- I started two background jobs, each by `nohup … & echo $!`:
  - PID `73466`, the copy-out replay of `t1_main.py`. It exited on completion, confirmed with `kill -0`.
  - PID `76274`, my exact sweep `own_sweep.py 5000`. I stopped it with `kill 76274` at horizon `m = 2395` and confirmed it
    had stopped before this write.
- I ran no pattern kill and no process listing. Every Python run used `python3 -B`, and no bytecode is present.

## Independent re-derivation

**Instrument.** `own_poly.py` is my own code, stdlib only. It contains a generic rooted-tree independence-polynomial DP, my
own `CB(d,m)` builder, and an acyclicity-and-connectivity test. Negative controls pass: a triangle plus an isolate and two
isolates are both rejected. It also has exact Sturm-sequence real-root counting in `Fraction` arithmetic. The Sturm counter
is sanity-checked on real-rooted controls: `P_5`, `P_10` and `P_17` (claw-free, so real-rooted), `(1+x)³(1+2x)²` and
`x(1+x)(1+2x)^40`, which all report all distinct roots real.

**Closed forms.** I derived T1's three closed forms by hand, splitting on `r ∈ B` and on each choke's `u_i ∈ B`:
`I_T = (1+2x)G^m + x(1+x)(1+2x)^{dm}`, `I_{T−v} = (1+x)G^m + x(1+2x)^{dm}`,
`I_{T−c} = (1+2x)G_cG^{m−1} + x(1+x)²(1+2x)^{dm−1}`, where `G = (1+2x)^d + x(1+x)^d` and
`G_c = (1+2x)^{d−1}(1+x) + x(1+x)^{d−1}`. These agree with T1's. My literal-tree DP confirms them on
`d ∈ {1,…,8}, m ∈ {1,2,3}`: **72 checks, 0 mismatches**. That is a wider range than T1's `d ≤ 3`, and T1 never DP-validated
the `d = 8` forms it relies on. `α = m(d+1)+1` also checks out.

**Fixed points reproduced (polynomial-level; this instrument builds no network, so the supply, capacity and `S` fixed points
are out of its scope):**
- `K_{1,12}`: `n = 13`, `α = 12`, `x = 6`, and 12 of 12 leaves favorable at `p = 8`.
- `CB(8,92)` by literal-tree DP: `n = 1567`, `α = 829`, `x = 490` (through `α`), eligible range `[492, 552]`. The arm leaf and
  the first and last private leaves are favorable at 492. The rest follow by the transitive `S_8 ≀ S_92` action on private
  leaves, giving 737/737.
- `CB(8,95)`: `x = 506`, `p* = 508`. `CB(9,112)`: `x = 671`, `p* = 673`. Both by literal DP, and both match T1's newly computed
  values.

**Exact sweep (my instrument).** `own_sweep.py` builds `G^m` incrementally, one multiplication by `G` per `m`. That is a
different algorithm from T1's truncated repeated squaring. At `p* = ⌊(16m+4)/3⌋` it checks four conditions in exact integers:
- (a) `i_{p*−1}(T) < i_{p*−2}(T)`
- (b) `Δ_{p*}(T − v) < 0`
- (c) `Δ_{p*}(T − c) < 0`
- (e) `3p* < 2α + 1`

On a failure of (a) it scans the true `x` from `k = 0`. The result for **`d = 8`, every `m ∈ [106, 2395]`** (contiguous, 2290
rows, summary digest `58c7ee449c70eb6eda5f7d8c97a86f384a163dcc12843c76fc7d9bbaa279cebb`):
- (b), (c) and (e) hold on every row.
- (a) fails **exactly** at `m ∈ {106, 109, 112, 115, 118, 121, 124, 127, 130, 133}`, where `x = p* − 1`.
- No other `m ≡ 1 (mod 3)` fails in `[134, 2395]`, and no `m ≢ 1 (mod 3)` fails anywhere.

This confirms T1's ten exceptions and its `[106, 238]` record with a second instrument, and extends the exact range. The
attack brief asked for `[134, 5000]`. I stopped at the horizon `2395` because the sweep's cost grows quadratically. The rows
in `(2395, 5000]` are **unchecked** by me (ruling 42: horizon stated).

**Literal-tree spot rows** (no closed form): `m = 106, 107, 108, 133, 238, 239, 242, 245, 246`. Eligibility, `x` through `α`,
arm and private favorability all agree with the sweep.

**A structural fact T1 does not state (bounded).** `p*` is the first eligible rank only for small `m`. The gap `p* − x` over
`m ∈ [86, 400]` reaches 3 from `m = 161`, 4 from `m = 242` and 5 from `m = 320`. It grows roughly linearly, matching the mean
drift `256m/20451`. So for large `m`, `𝒞_8`'s rank is an interior eligible rank, and the first eligible ranks `x + 2 < p*`
(where E1 fails from `m = 161`, per the record) are separate rows that any uniform result on `𝒞_8` leaves untouched.

**Obligation (ii) algebra (proved on the face; checked on `m ∈ [106, 5000]`).** For `d = 8`,
`μ_1 = (32m − 7)/6 = (16m+4)/3 − 5/2` exactly. Write `p* = (16m+4−ε)/3` with `ε ≡ m+1 (mod 3)`. The key's threshold
`⌈μ_1⌉ + 2` then equals:
- `p*` when `m ≡ 0` (`ε = 1`);
- `p*` when `m ≡ 2` (`ε = 0`);
- `p* + 1` when `m ≡ 1` (`ε = 2`).

My script confirms 3263 rows equal `p*` and 1632 rows equal `p* + 1`. T1's "1632 of 4895 failures" are exactly the class
`m ≡ 1 (mod 3)`, which `𝒞_8` excludes.

## Attacks and findings

**F1 (fatal to Claim 1's uniform grade). The real-rootedness lemma of Step 5 is false.** Step 5 cites, as a "classical fact",
that every forest's independence polynomial is real-rooted, and it applies Newton and Darroch to `I_T`, `I_{T−v}` and
`I_{T−c}`.
- Counterexample on the face: `K_{1,3}` has `I = 1 + 4x + 3x² + x³`. Its derivative `3x² + 6x + 4` has discriminant
  `36 − 48 < 0`, so `I` is strictly increasing on ℝ and has exactly one real root. Sturm agrees (1 of 3). `K_{1,4}` has 2 of 4
  roots real, and `K_{1,12}` has 2 of 12.
- The theorem fails on the return's own objects. `G_8 = 1 + 17x + 120x² + … + 264x⁸ + x⁹` has 3 of 9 roots real. For
  `m = 1..4`, `I(CB(8,m))` has 4, 5, 4, 5 real roots out of degree 10, 19, 28, 37. `I(CB(8,m) − v)` has 2, 3, 2, 3 real roots,
  and `I(CB(8,m) − c)` has 4, 6, 5, 6. None of them is real-rooted.
- Sanity: if the lemma held, independence sequences of all trees would be log-concave and hence unimodal. That is the
  program's own open object, Erdős #993, which this run's registry carries as OPEN. The lemma would have trivialized the run.

Consequences:
- Darroch's mode bound does not apply to these polynomials, so the "mean-margin" computations of Part 4 certify nothing about
  coefficients.
- The closed-form tail bound (`slope 256/20451`, `m₀ = 246/172/162`) is a correct statement about **means** but no longer
  implies `Δ < 0`.
- Claim 1 at `proved_informal` for `m ≥ 246` is **struck**. The "strictness subtlety" named in Remaining obligation 1(b) is a
  misdiagnosis. For a genuinely real-rooted polynomial with positive coefficients, Newton's inequality is strict. The actual
  gap is real-rootedness itself.
- Evidence: `realroot_test.py` / `.log` and `sturm_sanity.py` / `.log`.

**F2. "[239,245] covered by both" is covered by neither in the return.** The exact coefficient sweep stops at 238, and the
Darroch tail starts at 246 and is invalid anyway (F1). Rows 239–245 had only mean margins, which rest on the false lemma. My
exact sweep now covers them (bounded).

**F3. The Remaining-obligation claim "strict `Δ_{p*−2} < 0` … directly confirmed by exact coefficient computation … up to
`m = 2000` (Part 4's exact-`Fraction` margin check)" is false as a description of the code.** `part4()` evaluates `μ(m)` from
`I(1)` and `I'(1)` and never forms a coefficient. Struck. The exact coefficient horizon of the return is 238. Mine is 2395.

**F4. Obligation (ii) "scoping finding" is a misreading of the family (confirmed and corrected).** On `𝒞_8`
(`m ≢ 1 (mod 3)`), the registered threshold key's condition `p ≥ ⌈μ_1⌉ + 2` holds **with equality** at `p*` for every `m`.
So E1(i) at every `q` at `p*` follows by citation for every `m ∈ 𝒞_8`, at the key's own grade (`proved_informal`, modulo
Darroch). Darroch is legitimately applicable there, because the key's generating functions are products of linear factors.

The return's statements are struck:
- "discharged only for `m ∈ [134, 400]`";
- "`𝒞_8`'s own top rank is, generically, not covered";
- "the citation's margin is `O(1)` … does not eventually dominate".

True status of obligation (ii): **closed on `𝒞_8` by citation**. It is open only on the `m ≡ 1 (mod 3)` extension beyond
`m = 400`, the SR-C5-4 range recorded in `control/C6-ALLOCATION.md`. The return cites SR-C5-4 to "`SEMANTIC-CONTRACT.md` §2",
but the string occurs zero times in that file (citation erratum).

The return's suggested route for E1 at `m ≡ 1` ("adapt this route's Darroch technique") inherits F1. The legitimate tool for
E1 at `q = 1` is Darroch on the product `(1+y)^{qd−1}(1+2y)^{d(m−q)+1}`, which is what the key already uses. At `m ≡ 1` the
key's threshold is `p* + 1`, so E1 there needs an exact check or a sharper argument, not the key.

**F5. Obligations (iii)–(iv) are not attempted; T1's uniform switch-arc (HALL) is not established.** T1's proposed next step,
"a single, `m`-independent feasible point of the per-choke LP … the per-choke local constraints do not involve `m` at all", is
a plan, not a lemma. As stated, it cannot work:
- The constraint `(8−γ)σ(γ) ≤ θγ` carries `θ ≤ 1 − ρ_(1,8)(p*)`, and that budget decays like `0.468/m`. I computed
  `m(1 − ρ) = 0.4677, 0.4677, 0.4678, 0.4678` at `m = 86, 89, 92, 95`.
- So no fixed `θ > 0` survives all `m`, and a uniform certificate must scale with `m`.

Data test (bounded, critic-derived, an inference about row labels):
- The three registered `d = 8` values fit `θ*(m) = 288/(200m² + 82m + 5)` exactly: `96/495419`, `96/530501`, `96/566783`,
  which I take to be at `m = 86, 89, 92` in the allocation's order. Three points always fit a quadratic, so this fit alone
  tests nothing.
- The **out-of-sample** fourth value is T2's Cycle 6 `96/604265` from the attack brief. It equals the fit's prediction at
  `m = 95` exactly. I infer the row `CB(8,95)/508` because it is T2's first allocated row; my capsule does not label T2's
  values.
- So `θ*` is not affine in `m`: `1/θ*` is quadratic, with second difference `25/2` at step 3. `m²θ* → 1.44`.
- The separation ratio `(1 − ρ)/θ*` grows as roughly `m/3`: 28.06, 29.04, 30.02, 30.99 at `m = 86, 89, 92, 95`. That is
  consistent with a uniform affine separation on the `m ≡ 2` class, with certificates scaling like `1/m²`.

T2's other three values (`32/120853`, `288/604265`, `336/604265`) could not be placed without row labels.

**F6. Alias ground misstated.** The return argues that no registered claim uses "a cited classical mode-location theorem" on
the independence polynomial of `CB(d,m)` or concerns its crossing index. That ground is false. The registered `d ≤ 6` sector
key states `x(CB(d,m)) ≥ ⌊(2dm+2)/3⌋` "modulo Darroch" (allocation text), and the E1 threshold key is Darroch-dependent on
`CB(d,m)`. The candidate is still mathematically distinct: the sector key is a lower bound for `d ≤ 6`, while the candidate is
an upper bound on `x` and favorability at `d = 8`. The distinction must be restated on the right ground.

Hygiene flag for the second read (not a finding against that key): because F1 shows how easily Darroch gets misapplied to
tree independence polynomials, the `d ≤ 6` key's proof should be checked to apply Darroch only to genuinely real-rooted
factors. I cannot read that proof from my capsule. Its stated inequality holds on all 900 rows `d ∈ {1..6}, m ∈ {1..150}`
(`d_le6_x_check.py` / `.log`, bounded).

**F7. Fidelity (duty 2).**
- The return builds no network, so the weight and the relation (D) ∪ (S) are not exercised, and no `S` is claimed. It makes
  no `supply − capacity = S` assertion and needs none.
- `F_p` is derived at the original rank from `Δ_p(T − v)` on the original tree. The deleted-tree polynomials are those of
  `T − v` and `T − c`, and orbit transfer is valid under `S_d ≀ S_m`. It is not recomputed at `p ± 1`.
- `x` is computed through `α` in the fixed-point rows and the exceptional rows (scan from `k = 0`, including the terminal
  difference). Condition (a) is a single-rank test that proves `x ≤ p* − 2`, which is correct as used.
- There is no fidelity failure.

**Critic-derived advance: a real-rooted block decomposition that proves the favorability half of `(ELIG-top)` uniformly.**
The lemma is attributed to `C-T1-F`, STATED at a review stage, `proved_informal` on the face modulo Darroch and Newton. It
needs an isolated second read.

Lemma (C-T1-F). Fix `d ≥ 6`, `m ≥ 1`, and `p* = ⌊(2dm+4)/3⌋` in `CB(d,m)`. Then:
- (i) `Δ_{p*}(T − v) < 0`, so the arm leaf is favorable at `p*`;
- (ii) if `dm ≢ 2 (mod 3)`, then `Δ_{p*}(T − c) < 0` for every private leaf `c`.

Hence, when `dm ≢ 2 (mod 3)`, every leaf of `CB(d,m)` is favorable at `p*`. This holds for `d = 8` with `m ≢ 1 (mod 3)`
(all of `𝒞_8`) and for `d = 7` with `m ≢ 2 (mod 3)` (the allocation's analogue), for every `m`.

*Tool (D).* Let `P = x^s ∏(1 + a_i x)` with `a_i > 0`, mean `μ = P'(1)/P(1)`, and let `k ≥ μ` be an integer with `P_k > 0`.
Then `P_{k+1} < P_k`.

Proof of (D):
1. Newton gives strict log-concavity on the support.
2. Darroch places every mode `M` at `|M − μ| < 1`, with `M = μ` if `μ` is an integer. So every mode is `≤ ⌈μ⌉ ≤ k`.
3. A strictly log-concave sequence strictly decreases after its last mode.

*Proof of (i).* Since `G^m = Σ_j C(m,j) x^j (1+x)^{dj} (1+2x)^{d(m−j)}`, we can write
`I_{T−v} = Σ_j C(m,j) V_j + x(1+2x)^{dm}`, with `V_j = x^j (1+x)^{dj+1} (1+2x)^{d(m−j)}`.
1. `μ(V_j) = 2dm/3 + 1/2 − j(d−6)/6 ≤ 2dm/3 + 1/2 < (2dm+2)/3 ≤ p*`.
2. `p*` lies in the support `[j, dm+j+1]` of every `V_j`. So (D) gives `ΔV_j(p*) < 0` for every `j`.
3. For `R = x(1+2x)^{dm}`, `R_{k+1}/R_k = 2(dm − k + 1)/k ≤ 1` iff `3k ≥ 2dm + 2`, which holds at `k = p*`. So `ΔR(p*) ≤ 0`.
4. The sum has nonnegative weights and at least one strict term, so `Δ_{p*}(T − v) < 0`.

*Proof of (ii).* Expand `(1+2x)G_c G^{m−1} = Σ_{j<m} C(m−1,j)(E0_j + E1_j)`, with:
- `E0_j = x^j(1+x)^{dj+1}(1+2x)^{d(m−j)}`, of mean `≤ 2dm/3 + 1/2`;
- `E1_j = x^{j+1}(1+x)^{dj+d−1}(1+2x)^{d(m−1−j)+1}`, of mean `2dm/3 − j(d−6)/6 + (7−d)/6 ≤ 2dm/3 + 1/6`.

Pair `E0_0` with the leftover `x(1+x)²(1+2x)^{dm−1}`: `(1+x)(1+2x)^{dm}+x(1+x)²(1+2x)^{dm−1} = (1+x)(1+2x)^{dm−1}(1+3x+x²)`.
1. `1 + 3x + x² = (1 + ax)(1 + bx)` with `a, b = (3 ± √5)/2 > 0`, so the paired block is a product of linear factors.
2. The paired block has mean `2dm/3 + 5/6`. Writing `p* = (2dm + 4 − ε)/3`, we get `p* − μ = (3 − 2ε)/6 > 0` iff `ε ≤ 1` iff
   `dm ≢ 2 (mod 3)`.
3. All the other blocks have mean below `p*`, and every block's support contains `p*`.
4. Apply (D) blockwise and sum. Transitivity of `S_d ≀ S_m` on the private leaves gives every `c`. ∎

Mechanical check of the proof itself, not just its conclusion (`block_proof_check.py` / `.log`):
- Every block sum equals the closed form, and the closed forms equal my literal DP for `m ≤ 3`.
- Every block mean `< p*` and every block `Δ ≤ 0`, with some block `< 0`.
- Coverage: `d ∈ {6..13}`, `m ∈ {1..40}`. That is 320 rows for (i) and 253 rows with `dm ≢ 2` for (ii), with 0 violations.
- At `d = 8`, the paired block's mean minus `p*` is `+1/6` at `m = 106` (the excluded class), `−1/2` at 107 and `−1/6` at 108,
  exactly as the proof predicts.

What the lemma does **not** give: condition (a), `x ≤ p* − 2`. For `I_T`, the blocks `(1+2x)·x^j(1+x)^{dj}(1+2x)^{d(m−j)}`
have mean `(16m + 2 − j)/3` at `d = 8`. So blocks with `j ≤ 3 + ε`, together with `x(1+x)(1+2x)^{8m}`, **increase** at
`p* − 2`. A proof of (a) needs a quantitative estimate: the negative mass of the `j ≥ 4 + ε` blocks must dominate those few
increasing blocks. That is the exact remaining step, and it is bounded-verified to `m = 2395`.

**Letters and inheritance (one line).** The return supplies no restricted (HALL), no (CUT) candidate and no Lean-ready
statement, and nothing toward (HALL) at any scope (the text of the standing letters (a)–(d) of gate ruling 30 is not in my
capsule). With this critique, `(ELIG-top)` on `𝒞_8` reduces to condition (a) alone. The successor inherits:
- favorability, uniform (C-T1-F lemma, pending a second read);
- E1 at `p*`, by citation, uniform on `𝒞_8`;
- eligibility, exact to `m = 2395`;
- `(L-S)_top` untouched, with the `θ* ~ 1.44/m²` data law as the target to prove.

## Mechanism-equivalence and fence check

- **No transport mechanism is proposed**, so none of the ten refuted keys is revived. The return's content is
  coefficient-level (eligibility and favorability), and so is mine.
- **No closed region is re-proved.** `p*` is in the lower region: `3p* ≤ 2dm+4 < 2α+1 = 2dm+2m+3` for `m ≥ 1`. Nothing in the
  return or in my lemma touches the high tail or the order bands. At `CB(8,m)` rows, `n = 17m + 3 ≤ 4p* − 8` holds for
  `m ≥ 106`.
- **No census value is used in a proof.** The return's exact range is correctly graded bounded. Its uniform claim used a false
  lemma, not a census. My lemma uses no census; the block check is a check of the argument.
- **No RTree wording.** (LIFT), (DCB), `D, C ≥ 0` and the controller prior are not used.
- **Classical dependencies.** Darroch and Newton are named, undischarged dependencies (ruling 45). They are valid only for
  real-rooted inputs, which is the point of F1.
- **Candidate key `E993-R30-CB-EIGHT-TOP-RANK-COEFFICIENT-DESCENT-AND-LEAF-FAVORABILITY`: not registrable as proposed.**
  "CB-EIGHT" is a token, not a parameter. The name omits the rank `⌊(16m+4)/3⌋` and the range or exceptional set (ruling 48).
  Its uniform statement is struck (F1), and its alias ground is misstated (F6).
- **Proposed exact names, both STATED:**
  - For my lemma: `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`, with a
    companion clause "arm leaf favorable at that rank for every `m`" on the face.
  - T1's surviving content is a Tier-3 bounded record: `CB(8,m)` at `⌊(16m+4)/3⌋` is eligible for every
    `m ∈ [106, 2395]` except the ten listed values. It does not need a key.
  - My lexical check covers only the key names visible in my capsule. The run-local registry is not a capsule member, so the
    full lexical and mathematical alias check against the registry is owed by the second read. The nearest visible names are
    the E1 threshold key and the `d ≤ 6` sector key. Both are mathematically distinct: one concerns mark-clone condition (i),
    the other a lower bound on `x` for `d ≤ 6`.

## Certification audit

| Return literal | Status |
|---|---|
| Closed forms "36 checks, 0 mismatches" (12 instances, `d ≤ 3`) | backed (replayed). Note: T1 never DP-validated `d = 8`; I did (72/0). |
| "120 checks, 0 mismatches" (means vs direct summation) | backed (replayed). The "direct summation" is over the closed-form polynomial, not the DP. |
| "156 exact checks" | backed (36 + 120) |
| `(n, α, p*, x)` at five rows; `p* = x + 2` at all five | backed (replayed, and by my literal DP at `CB(8,92)`, `(8,95)` and `(9,112)`) |
| Part 3: 133 rows; (b) and (c) at every row; (a) at 88/88 `m ≢ 1` and 35/45 `m ≡ 1`; ten exceptions with `x = p* − 1` | backed (replayed; independently reproduced by my sweep) |
| Claim 1 "`proved_informal` for `m ≥ 246`" | **STRUCK**: false real-rootedness lemma (F1) |
| "`[239,245]` covered by both" | **STRUCK**: covered by neither in the return (F2). Now covered by my exact sweep (bounded). |
| "confirmed to stay positive for 3000 further consecutive integers past `m₀`" | **STRUCK/corrected**: the code checks `range(m₀, 3000)`, i.e. 2754, 2828 and 2838 integers for (a), (b) and (c). It checks mean margins only. |
| "eventually strictly decreasing (for `m ≥ 27`, shown by its derivative's sign)" | **unbacked** in shipped code (not computed), and moot after F1 |
| "strict `Δ_{p*−2} < 0` directly confirmed by exact coefficient computation up to `m = 2000`" | **STRUCK** (F3): Part 4 computes no coefficients |
| "1632 of 4895" threshold failures | numerically backed; the **interpretation is struck** (F4): they are exactly `m ≡ 1 (mod 3)` |
| "Obligation (ii) discharged only for `m ∈ [134,400]`" | **STRUCK** (F4): closed on `𝒞_8` by citation for every `m` |
| SR-C5-4 located at "`SEMANTIC-CONTRACT.md` §2" | citation erratum (0 occurrences; it is `C6-ALLOCATION.md`) |
| "no registered claim uses either device on `CB(d,m)`" (alias ground) | **STRUCK** (F6) |
| Remaining obligation 1(b): the strictness subtlety is "the one gap" | **STRUCK** (misdiagnosis; F1) |
| `RESULT_DIGEST_SHA256 bc0a316c…` and the replay "identical digest" | backed (my copy-out replay reproduces it; log byte-identical) |
| Alias "66 claims hit", `ALIAS_CHECK_DIGEST 93cb41bd…`, "460 claims" | self-report only (not replayable within my capsule); the seat's log carries the same literals |
| Process: PIDs 61212, 62780→65141, 63494→65586; harness task ids | self-report, consistent with the Stage 3 disclosures record (T1 items). No full process listing is claimed. |
| Grades table: Parts 1–3 `bounded_computation` | backed |

## Verdict

verdict: retained_narrowed
headline_resolved: no

The return is narrowed to four things:
- the correct closed forms for `I(CB(d,m))`, `I(CB(d,m) − v)` and `I(CB(d,m) − c)`;
- the exact bounded record at `p* = ⌊(16m+4)/3⌋` for `d = 8` (conditions (a), (b) and (c) with the ten `m ≡ 1` exceptions),
  replayed and extended by a second instrument from `[106, 238]` to `[106, 2395]`;
- the ten exceptions confirmed genuine (`x = p* − 1`);
- the correct arithmetic count 1632, correctly reinterpreted.

Struck: Claim 1's `proved_informal` grade, which rests on a false lemma; the `[239,245]` overlap; the Part 4 "exact coefficient"
description; the obligation (ii) scoping conclusion; and the alias ground.

In prose, and not through the flag: the critic-derived lemma above has, in my judgment, complete mathematics at
`proved_informal`, modulo Darroch and Newton applied only to products of linear factors. It is STATED at this review stage and
needs an isolated second read before registration.

The return does not reach a `proved_informal`-or-better restricted (HALL), a (CUT) candidate, or a Lean-ready statement.

## Remaining obligation

1. **(ELIG-top)(a), uniformly.** Prove `i_{p*−1}(CB(8,m)) < i_{p*−2}(CB(8,m))` for every `m ≥ 2396` with `m ≢ 1 (mod 3)`
   (for the `𝒞_8` object), or with the exceptions for `m ≡ 1`. Exact route:
   - In the block decomposition `I_T = Σ_j C(m,j)(1+2x)x^j(1+x)^{8j}(1+2x)^{8(m−j)} + x(1+x)(1+2x)^{8m}`, only the blocks
     `j ≤ 3 + ε` and the last term can increase at `p* − 2`. Every block `j ≥ 4 + ε` strictly decreases there by (D).
   - Needed: an explicit lower bound on the decrease of the `j ≥ 4 + ε` blocks that dominates the increase of the others.
     Their binomial weight `C(m,j)·256^j·6561^{m−j}` concentrates at `j ≈ 0.0376m`.
   - Until then, (a) is `bounded_computation` on `[106, 2395]`.
2. **E1 at `p*` for `m ≡ 1 (mod 3)`, `m > 400`** (only if the family is widened beyond `𝒞_8`). The registered key's threshold
   there is `p* + 1`, so it needs an exact check or a sharper argument. On `𝒞_8` itself, E1 at `p*` is closed by citation.
3. **`(L-S)_top` and the B7 composition: untouched.** A uniform certificate must scale with `m`, because the budget
   `1 − ρ_(1,8)(p*) ≈ 0.468/m → 0`. The data law `θ*(m) = 288/(200m² + 82m + 5)` on `m ≡ 2 (mod 3)` is bounded and inferred
   (four values; the fourth out-of-sample under the row assignment `CB(8,95)/508`). It is the natural target: prove
   feasibility of the per-choke LP with `θ = θ*(m)` and `σ` scaled accordingly. The working label "B7" and its referent are
   not verified in my capsule.
4. **Registration hygiene.**
   - The C-T1-F lemma needs an isolated second read and a full registry alias check.
   - T1's candidate key is withdrawn as proposed.
   - Every registered "modulo Darroch" key should be checked to apply Darroch only to genuinely real-rooted polynomials (F6
     flag).

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-crit-T1-F/`
(SHA-256):

| File | SHA-256 | Role |
|---|---|---|
| `seal_check.py` | `16f14bf80fd82979b8eca972ead78e99ac6860b9a34ba742ff04b04204ab78c3` | capsule, member and manifest seals |
| `own_poly.py` | `b3b7871e38457dfdad96cc278e71048102f8bafcb0c4609df09c286e3dbdcc94` | own instrument (tree DP, CB builder, tree test, Sturm) |
| `realroot_test.py` / `.log` | `151fa59479e93fb15d7a03cb7b2ac8d30d3a9b82682390e4e21cf3eafe57804f` / `c142b321d84dcc098d6f7a19d82cdaf598c392e97addb889f318e03c2b2d7591` | F1 counterexamples |
| `sturm_sanity.py` / `.log` | `407b992bf6dafe77b709cd8df4ee38420e7591b54a316a2779b0c6bfbcf57af2` / `870cc5571c8cc969f4d47aaf3e694e9f64781d789a4ce573b53edc2a0576ba04` | Sturm controls |
| `closed_form_validate.py` / `.log` | `855dab2b3e30d652103e9db12ce6c2c053565398a527ea7674a56cd95f63a649` / `f43667f10bd18339d8dce4f1e0e9de2cb8de3cf9de2c291e02eee0633dd897ed` | 72/0 closed forms; `K_{1,12}` |
| `literal_rows.py` / `.log` | `569393008b86e8adfbb40eb90616488bf1a554ad5f13b6e733c6da2ec3ff2dc3` / `cdd5afde9bb7420938607d57e41fe30b24ffb63803ecbd9719184d026a553590` | literal-tree spot rows |
| `own_sweep.py` | `948b706da4a657913dafc78da0f30cf3dd58df5dffcf99a3d29c22c94e61ec9c` | exact incremental sweep |
| `sweep240.jsonl` | `b3fec5e1e101c814284c90ac562458bcc35b897b638c39b665f0d182512f28dc` | first sweep test, `m ≤ 240` (run-output digest `bd15d52fff1b813cf57d9cb17587dae3f3c7e7288dc9745601980aed74eb41fe`) |
| `sweep5000.jsonl` | `556b785cb6b2be150dca6f4257291443d4f7179a0d773f5d3fa54f58e400fbe6` | per-row output, `m ∈ [106, 2395]` (stopped by PID 76274) |
| `summarize_sweep.py` / `sweep_summary.log` | `c36ac5ea15e357ee4796a8810db69c0248123896db40f187c748291436489ab4` / `faa4a75efb1a0294bf89d0727c21b4231d47cb0d544dc41d5fc06a8a152166f4` | horizon summary (`SUMMARY_DIGEST 58c7ee449c70eb6eda5f7d8c97a86f384a163dcc12843c76fc7d9bbaa279cebb`) |
| `block_proof_check.py` / `.log` | `0463fc0f46f407ded10f1527afcb17571e8f2e2595c5e2c32cebeb74eabc79fb` / `a87fd67c751d47edbddb741c502714beabdb9cd7d7d6eff7fa6938494bcec2d2` | mechanical check of the C-T1-F lemma |
| `e1_threshold_and_theta.py` / `.log` | `b542274fa6dac93eafd7535c4e5d952026a0c3aa1d0084f9c42812f7bf5d1217` / `355b77d3cac72e50fb969bcbf942f1e669e997721fad6c5ff2302e85db843018` | F4 algebra; F5 `θ*` data |
| `first_rank_gap.py` / `.log` | `22afa089bf28a90918dd1dbeeacfacc3697503761f26431c8d810f41fc5c97da` / `f574d821e79101bca609c7bf1704f4d04d3e98357c407fab459da5f1dc1b4d31` | `p* − x` growth; `CB(8,95)`, `CB(9,112)` |
| `d_le6_x_check.py` / `.log` | `74ed2be6ec2d11eb3242524cf596c981660d639aaaedc396e4c4ad8e89e3c9cb` / `79669282836df30f927f368690a80c8c418d81ee65cea2b9d2a601333023b1d3` | F6 hygiene check (bounded) |
| `replay/t1_main.py` / `replay/t1_main_replay.log` | `306a8344c2f60987e9863a4f62168772cbd52d03264acc762dea94323f731fe2` / `4e6a2fda857397ddaa377b74c438c98239421808d99fd9d618c56fb022cf141d` | copy-out replay (PID 73466), byte-identical log |
| `replay/alias_check.py` | `b95f06049e4dc1951390b3802eb0597856870a711fbae953085c99266167fef6` | copied, not executed (reads non-capsule registry) |

Replay commands: `cd <scratch> && python3 -B realroot_test.py`, `python3 -B closed_form_validate.py`,
`python3 -B block_proof_check.py`, `python3 -B own_sweep.py 2395 out.jsonl` (reproduces the horizon; long-running, not timed as a single run), and
`python3 -B e1_threshold_and_theta.py`.
