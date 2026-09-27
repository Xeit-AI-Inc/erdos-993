# Critique

Critic `C-T1-U` (orientation U, formal / structural) of Cycle 6 Stage 3 return `T1`
(`C6-T-01 CB-TOP-DEFICIENT-RANK-UNIFORM-SWITCH-HALL`, orientation T), run
`erdos-993-math-dre-20260926-r30-weighted-transport` (r30), 2026-09-27.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. The host injected the root
`CLAUDE.md` and a memory index into my context. I did not open or act on either.

**Model disclosure (two parts).** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Dispatch.** `control/dispatch/c6-stage4/DISPATCH-C-T1-U.md`: `shasum -a 256` gives
`bba4cf7a6cb1df53c43cd315ba5a58971e576607831615ac08db1568c89ae7da`, which matches. I followed the dispatch only after this check.

## Identity and seal audit

| Object | Stated | Recomputed | Result |
|---|---|---|---|
| Capsule `control/c6-critic-capsules/T1-PACKET-MANIFEST.json`, inner seal | `bba67d9c0168cbc3d163ac1fa7e2df6aba5cdf115dfe5bdf041d4fc7d22ae5cf` | same (canonical JSON without `seal_sha256`, `sort_keys`, `(",",":")`, no newline) | **match** |
| Capsule members (14 files) | per-file SHA-256 and bytes | all 14 recomputed | **all match** |
| Stage 2 manifest seal | `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611` | same | **match** |
| Stage 3 manifest seal (capsule member) | `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd` | same | **match** |
| Stage 4 dispatch manifest seal | `74be1845f4005d6846c10eacdebf5049b6d7d971a53b445c1dcab3b3637ddf50` | same | **match** |
| `RETURN.md` (capsule member) | `761857cd…10c97` | same | **match** |
| Evaluator `sources/lower-region/inputs/ordinary_tree_checked.py` | `a012bb78…f498f533d` (return; `SOURCE-DIGESTS.json` line 616–619) | same | **match** |
| `scratchpad/c6-T1/alias_check.py` | `b95f0604…fef6` | same | **match** |
| `t1_main.py` result digest | `bc0a316c…e7356e` | my copy-out replay (below) | **match** |
| `t1_main.py` file itself | **not stated in the return** | `306a8344c2f60987e9863a4f62168772cbd52d03264acc762dea94323f731fe2` | recorded here. The return gives no file digest for its generator of record. |

**Read boundary (mine).** I read only the capsule's 14 members, T1's inventoried scratch (`scratchpad/c6-T1/`: one
non-recursive `ls`, `t1_main.py`, `t1_main_run.log`), and one `grep -n` / `sed -n` inside the capsule member
`control/SOURCE-DIGESTS.json` to find the evaluator's entry. I read no file under `sources/` except by digest, and the replay
imported the authorized evaluator as T1's script does. The attack brief cites controller replays `CF-REPLAY-c5a/c5b/c5d/c6d` as capsule members,
but they are **not** in my capsule, so I did not read them. Every fact that the brief attributes to them is re-derived below with my own instrument.
I copied `alias_check.py` out but **did not run it**, because it reads `control/CLAIM-IDENTITY.run-local.json`, which is not a capsule
member. For the same reason I did not read the registry, and my alias remarks below are lexical against capsule text only. I read
no other return, critique, adjudication, experiment root, or external source. I ran no `find`, no recursive search, no network access and no
installs. I ran two background jobs, both by literal PID and both confirmed exited before this write: the exact sweep (PID `77343`) and the replay of
`t1_main.py` (PID `78059`). The harness waiter tasks and monitors I armed ended on their own, and I did not kill anything. I never ran a process
listing.

**Claim identity.** These keys are touched: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (HALL, OPEN; untouched by the return),
`E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN; untouched), `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (cited only),
and `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (the E1 threshold key; the return misreads its
scope, see A3). The return also proposes a candidate, `E993-R30-CB-EIGHT-TOP-RANK-COEFFICIENT-DESCENT-AND-LEAF-FAVORABILITY` (see A6).

## Independent re-derivation

**Instruments (mine, standard library, `python3 -B`, scratch `scratchpad/c6-crit-T1-U/`):**

1. `rr_check.py` is my own rooted tree DP for forest independence polynomials. It builds `CB(d,m)` literally and checks it with an
   edge-count test plus a connectivity test. It also has an exact Sturm-sequence real-root counter over ℚ and a square-free-degree check.
2. `kron_sweep.py` computes exact coefficients of `I(T)`, `I(T−v)` and `I(T−c)` for `T = CB(d,m)` by Kronecker substitution `X = 10^s`
   in libmpdec decimal arithmetic. The `Inexact`, `Rounded`, `Overflow` and `InvalidOperation` signals are **trapped**, so any loss of
   exactness raises an error. The method is incremental in `m`. Its code and arithmetic path are independent of T1's truncated convolution.
3. `theta_fit.py` computes the E1 threshold algebra and the exact `θ*` fit (see A5).
4. `k112_fixed.py` is a brute-force `K_{1,12}` check.

**Closed forms.** I derived them myself by splitting on whether the root `r` is in the set. One choke gadget (hub plus `d` legs of length 2) has
polynomial `G = (1+2x)^d + x(1+x)^d`. The arm `r–s–v` gives `(1+2x)` when `r` is out and `x(1+x)` when `r` is in, and every hub is
excluded when `r` is in. This gives `I_T = (1+2x)G^m + x(1+x)(1+2x)^{dm}`, `I_{T−v} = (1+x)G^m + x(1+2x)^{dm}`, and
`I_{T−c} = (1+2x)G'G^{m−1} + x(1+x)^2(1+2x)^{dm−1}` with `G' = (1+x)(1+2x)^{d−1} + x(1+x)^{d−1}`. These agree with T1's Step 2. The
derivation is uniform and elementary. `selftest()` checks all three against my own DP, coefficient for coefficient, on
`(d,m) ∈ {(1,1),(1,3),(2,2),(3,1),(3,4),(5,3),(8,1),(8,2),(8,3)}` (27 comparisons, 0 mismatches). It also checks `α = m(d+1)+1`.

**Fixed points reproduced by my instruments:**

- `K_{1,12}`, `p = 8`: `n = 13`, `α = 12`, `x = 6`, `|F| = 12` (derived), supply `1980`, capacity `3960`, `S = −1980`.
  Supply minus capacity equals `S`, with `S` computed independently from `q_v` by brute-force counts.
- `CB(8,92)`: `n = 1567`, `α = 829`, `x = 490` (first strict descent, scanned from `k = 0`), `p* = 492`. The arm leaf and a private leaf are
  favorable at 492. By transitivity of `S_8 ≀ S_92` on the private leaves, all `1 + 736 = 737` leaves are favorable.
- `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,95)/508`: `x = 458, 474, 506`. `CB(9,112)/673`: `n = 2131`, `α = 1121`, `x = 671`.
  In every case `p* = x + 2` and `3p* < 2α + 1`.

These agree with T1's Part 1 rows. The path-star and `T_m` fixed points belong to the network rather than to this coefficient route, so I did
not re-run them. My instrument asserts no `S` on a CB row, because the return reports none.

**Replay (copy-out first).** I copied `t1_main.py` to `scratchpad/c6-crit-T1-U/replay/` and ran `python3 -B` there (PID 78059). It
reproduced `RESULT_DIGEST_SHA256 bc0a316c…e7356e`, and its log is **byte-identical** (`diff`) to `scratchpad/c6-T1/t1_main_run.log`.

**Exact ground truth, my instrument, `d = 8`, every `m` in `106 ≤ m ≤ 500` (395 rows).** Output file `sweep_106_500.json`, SHA-256
`d27eaaa2fc8fadf880afbb514734621f4ece7282c67111dec86d02468a764c54`.

- (a) `i_{p*−1}(T) < i_{p*−2}(T)` fails at **exactly** `{106, 109, 112, 115, 118, 121, 124, 127, 130, 133}`. At each of these,
  `x = p* − 1` (`565, 581, …, 709`), so the rank is genuinely ineligible, as T1 says. At every other row, `x ≤ p* − 2`.
  The gap `p* − x` grows from 2 to 7 across the range.
- (b) the arm leaf is favorable at `p*` and (c) a private leaf is favorable at `p*` on **all 395 rows**. The weakest relative descents are
  `−7.53·10⁻³` for (b) and `−7.54·10⁻³` for (c).
- `3p* < 2α + 1` holds on every row. T1 does not state this half of eligibility, although it is trivial (`p* ≤ 6m` for `m ≥ 2`).
- The thinnest (a) margins are in the `m ≡ 0` class at the start of the range: relative descent `−1.47·10⁻⁶` at `m = 108`, then
  `−2.0·10⁻⁴` at 111. In the `m ≡ 1` class, the relative (a) difference rises monotonically from `+1.89·10⁻³` at 106 to its first negative
  value at 136 (`−1.28·10⁻⁴`). In each residue class the trend is monotone to 500.

This **confirms T1's exact claims on `106 ≤ m ≤ 238`** with an independent instrument and **extends them to 500**. Rows `239–245` are covered
here by exact computation, and I found **no `m ≡ 1 (mod 3)` failure in `[134, 500]`**. I did not reach 5000 exactly: the
cost grows roughly as `m³`, and I state 500 as my horizon (ruling 42).

## Attacks and findings

**A1 (fatal to the uniform part of Claim 1): the cited "classical real-rootedness of a forest's independence polynomial" is false.**
Step 5's `proved_informal` tail for `m ≥ 246` rests on this chain: real-rootedness, then Newton log-concavity, then Darroch's mode within
distance 1 of the mean, then a descent past `μ + 1`. The first link is false for trees. `K_{1,3}` has `I = 1 + 4x + 3x² + x³`, which has
**one** real root (exact Sturm count). The same failure holds for the exact polynomials Step 5 uses:

| polynomial | degree | distinct real roots (Sturm, exact) | square-free |
|---|---|---|---|
| gadget `G_8 = (1+2x)^8 + x(1+x)^8` (spider `S(2^8)`) | 9 | 3 | yes |
| `I(CB(8,1))`, `I(CB(8,1)−v)`, `I(CB(8,1)−c)` | 10, 10, 10 | 4, 2, 4 | yes |
| `I(CB(8,2))`, `−v`, `−c` | 19, 19, 18 | 5, 3, 6 | yes |
| `I(CB(8,3))`, `−v`, `−c` | 28, 28, 27 | 4, 2, 5 | yes |

So neither `I_T` nor its factor `G^m` is real-rooted, and Darroch's theorem does not apply to any of the three. There is a deeper reason the
citation cannot be right: if every forest had a real-rooted independence polynomial, tree unimodality, the question this whole program
exists to attack, would follow from Newton's inequality at once.

The mean-margin computations themselves are correct. I re-derived the (a) bound: dropping `2·3^{8m}` from `I(1)` gives
`μ_T ≤ 2/3 + mg + (9+32m)r^m/9`, so the margin is at least `m·256/20451 − 3 − tail`. But a positive mean margin says nothing about where
the mode is without real-rootedness, or without an equivalent mode–mean theorem for these sequences. **Result:** the grade
`proved_informal` for `m ≥ 246` is **struck**. The uniform (ELIG-top) statement is **unproved** beyond the exact horizon, which is 500 after this
critique. The return's own Remaining-obligation item 1(b) misdiagnoses the gap as "repeated roots / non-strict Newton". For a genuinely
real-rooted positive polynomial of degree ≥ 2, Newton's inequality is already strict, so that gap does not exist. The actual gap is that the
polynomials are not real-rooted.

**A2 (coverage of `[239, 245]`).** The return says this range is "covered by both". It is not. The exact sweep stopped at 238 and the
analytic tail starts at 246. The rows in between were covered only by exact mean margins fed into the (invalid) Darroch inference. After A1
they were covered by nothing in the return. My exact sweep covers them: (a), (b) and (c) all hold there, and the relative (a) descent is
about `−4.7·10⁻³`.

**A3 (obligation (ii): T1's "genuine scoping finding" misreads the family).** With `d = 8`, `μ₁ = (32m − 7)/6 = p*_real − 5/2`, where
`p*_real = (16m+4)/3`. I checked `p* − (⌈μ₁⌉ + 2)` for every `m ∈ [106, 5000]` (`theta_fit.py`). It is `0` for **every** `m ≡ 0` and every
`m ≡ 2 (mod 3)`, and `−1` for **every** `m ≡ 1 (mod 3)`. So the 1632 failures are **exactly** the `m ≡ 1` class, which `𝒞_8` as allocated
excludes. On `𝒞_8` proper the threshold equals `p*`, and the registered E1 threshold key gives E1(i) at `p*` for every `m ≥ 106` at the key's
grade (`proved_informal`, modulo Darroch). Darroch **is** legitimate there, because the threshold key's mean `μ₁` is the mean of
`r_1 = (1+y)^{d−1}(1+2y)^{d(m−1)+1}`, a product of linear factors. T1 therefore cited Darroch where it is invalid (forests) and missed it
where it applies. T1's Step 6 conclusion, "discharged only for `m ∈ [134, 400]`, open for `m > 400`", is **struck for `𝒞_8`**.
Obligation (ii) is **closed on `𝒞_8` by citation**. It is open only for the `m ≡ 1` extension: at those rows `p* = ⌈μ₁⌉ + 1`, which is the key's one
undecided rank per `m`, and SR-C5-4's exact check covers it only to 400 (by record; I did not read SR-C5-4).

**A4 (what (ELIG-top) contributes beyond the record).** The allocation records that SR-C5-4 extended the checked range of `𝒞_8` to
`m ≤ 400`. On `𝒞_8` proper, T1's exact range `106–238` therefore adds nothing new. What is new: the closed forms, which are correct, uniform and
elementary; the explicit ten-point exceptional set with `x = p* − 1`; and exact (a), (b), (c) on the `m ≡ 1` rows `136–238`. After this
critique, the exact bounded record runs to 500 for all residues. T1's wording "a strengthening of `𝒞_8`'s own stated scope" is admissible
only at `bounded_computation` on `[106, 500]`. Widening `𝒞_8` to `m ≡ 1` would also need E1 at the undecided rank (A3), which is recorded only to
400.

**A5 (obligation (iii): the "`m`-independent per-choke certificate" shortcut conflicts with the charter's own constraint).** T1 writes
that "the per-choke local constraints do not involve `m` at all". But the allocation's constraint `θ ≤ 1 − ρ_(1,8)(p*)`, with
`ρ = r_1(p*−1)/r_1(p*−2)`, depends on `m`, and `1 − ρ ≈ 0.468/m → 0`. So `(8 − γ)σ(γ) ≤ θγ` becomes `m`-dependent. T1's step (iii) is a
**plan, not a lemma**. I attempted the fit the allocation asks for (critic-derived, see "Critic-derived advance" below).

**A6 (the candidate key).** `E993-R30-CB-EIGHT-TOP-RANK-COEFFICIENT-DESCENT-AND-LEAF-FAVORABILITY` fails ruling 48 for several reasons:

- "CB-EIGHT" is a token, not a parameter, and T1 itself found that the token "EIGHT" collides lexically with "WEIGHTED".
- The name omits the rank `⌊(16m+4)/3⌋` and the range.
- The uniform statement it would name is unproved (A1).

What survives is a **bounded record**, best filed as a scope note under `R30-CB-RECORD` and not as a key. If the synthesis registers
it anyway, an exact predicate is
`E993-R30-CB-8-M-RANK-FLOOR-16M-PLUS-4-OVER-3-ELIGIBLE-WITH-EVERY-LEAF-FAVORABLE-FOR-M-106-TO-500-EXCEPT-TEN-M-1-MOD-3-BELOW-134`,
at `bounded_computation`. I could not alias-check it against the registry, because the registry is not in my capsule. The adjudicator must do that.
T1's report of 66 lexical hits against 460 keys is not replayed here for the same reason.

**A7 (fidelity).** The return builds no network: no `w_F`, no (REL), no `S`. Its gate-31 statement that no `supply − capacity = S` is owed
is therefore correct. On the coefficient checks:

- `x` is scanned from `k = 0` through the needed rank, and a plateau is never counted as a descent (the log confirms this).
- `F_p` is derived from `Δ_p(T − v)` on the original tree at the fixed `p*`.
- The orbit transfer to all private leaves is valid, because `Aut(CB(8,m))` is transitive on the `c_{ij}` and these are all the leaves apart from `v`.
- `IsTree` is tested in code by edge count plus DFS.

I found no fidelity failure.

**A8 (process).** T1 disclosed the following: a delayed digest check (read before verification; it matched), a `grep -rl` rooted at
`sources/` that returned two path-only hits under `sources/heterogeneous-closure/`, PIDs obtained via `$!`, one job stopped through
the harness channel, and no process listing. These agree with `control/C6-STAGE3-READ-BOUNDARY-DISCLOSURES.json`. The return is
internally inconsistent in two places. Its 10-line summary says "three background jobs", but the disclosure section lists five. It lists two
superseded PIDs (62780, 63494). It also gives no file digest for its generator of record (recorded above).

## Mechanism-equivalence and fence check

The return proposes no transport rule, injection, capacity rule or flow, so it revives none of the ten refuted mechanisms (§3.2), and its
coefficient/favorability content is not a mechanism. It re-proves no closed region: the `CB` rows are in the open lower region, and the
order band `n ≤ 2p + 2` is irrelevant because `n ≈ 17m ≫ 2p* ≈ 10.7m`. It uses no census value as a proof step and no RTree wording. It does
not treat (LIFT) or `D, C ≥ 0` as supplying anything. The fence problem is a different one: **an undischarged classical dependency was cited
outside its hypotheses.** Real-rootedness is false for trees (A1). The run's convention of naming Darroch and Newton as undischarged
dependencies allows them only where their hypotheses hold, as they do for the E1 threshold key's product polynomial.

## Certification audit

| Literal in the return | Status |
|---|---|
| "36 checks, 0 mismatches"; "120 checks, 0 mismatches"; "156 exact checks" | **backed**: replay reproduces them, `36 + 120 = 156` |
| `(n, α, p*, x)` at the five rows; "`p* = x + 2` exactly at all five" | **backed**: replay, and my own instrument agrees |
| 133-row sweep, ten exceptions, `x = p* − 1` at the ten | **backed**: replay, and my own instrument agrees (extended to 500) |
| "RESULT_DIGEST … reproduced", "identical digest" | **backed**: my replay gives the same digest and a byte-identical log |
| "slope `256/20451` (exact)"; `m₀ = 246 / 172 / 162`, "positive for 3000 further integers" | **backed as arithmetic about means**; irrelevant to descent after A1 |
| "**`proved_informal`** for `m ≥ 246`"; "for all `m` to infinity"; "essentially closed"; "it does close" | **struck** (A1) |
| "`[239, 245]` covered by both" | **struck** (A2); now covered by my exact sweep only |
| "1632 of 4895 fail" | **backed** as a count; its reading ("genuine scoping finding"; "open for `m > 400`" on `𝒞_8`) is **struck** (A3) |
| "classical real-rootedness of forest independence polynomials" | **struck**: false (`K_{1,3}`; the table in A1) |
| "every exact check found strict decrease with no plateau … up to `m = 2000`" | **struck** as worded: Part 4 checks exact **mean margins** to 2000, not coefficients. Exact coefficients reach 238 (T1) and 500 (mine) |
| "three background jobs" (summary) versus five (disclosures) | internally inconsistent; the disclosure list governs |

## Verdict

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

The return is narrowed to the following:

1. The closed forms for `I(CB(d,m))`, `I(CB(d,m) − v)` and `I(CB(d,m) − c)`. They are correct. The derivation is elementary, and I would grade
   it `proved_informal` if it is stated on the face.
2. `(ELIG-top)` for `CB(8,m)` at `p* = ⌊(16m+4)/3⌋`, meaning `x ≤ p* − 2` and every leaf favorable, **exactly** for `106 ≤ m ≤ 500`, with the ten
   genuine exceptions `m ∈ {106, 109, …, 133}` where `x = p* − 1`. Grade: `bounded_computation`, confirmed by two instruments to 238 and by mine
   alone on `239–500`.
3. **Nothing uniform.** The `proved_informal` tail is struck.

Obligation (ii) is closed on `𝒞_8` by citation of the E1 threshold key (A3, contrary to the return). Obligations (iii) and (iv) were not
attempted, so **T1's uniform switch-arc (HALL) is NOT established.** Standing letters and the Cycle 6 brief's three categories: the return
reaches **no** `proved_informal`-or-better restricted (HALL), **no** (CUT) candidate, and **no** Lean-ready statement. (The letter text of
ruling 30 is outside my capsule, so I mapped to the brief's categories.) I do not believe any statement's mathematics is complete beyond item 1.

**Critic-derived advance (C-T1-U; `conjecture`, supported by bounded data).** I fitted `1/θ*` to the three registered values
`96/495419`, `96/530501`, `96/566783`. I attributed them, **by my own inference**, to `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`;
the capsule does not state the row attribution. The fit is exactly

    θ*_8(m) = 288 / (200m² + 82m + 5)

It then **predicts** `θ*_8(95) = 96/604265` exactly, which is the first of T2's Cycle 6 values, cited as data through the attack brief. That
is one out-of-sample exact match (`theta_fit.py`, digest `5cc6c1df…2883a`). All four rows are `m ≡ 2 (mod 3)`. Consequences for the successor:

- `θ*` decays like `1.4334/m²`, so an **affine** fit of `θ*` in `m` is implausible, while `1/θ*` is quadratic.
- The available room `1 − ρ_(1,8)(p*)` decays only like `≈ 0.468/m`. The ratio `(1 − ρ)/θ*` is `28.06`, `29.04`, `30.02`, `30.99` at
  `m = 86, 89, 92, 95`, and grows by about `m/3`.

If the per-choke LP's optimum really is `θ*_8(m)`, the choke-local slack widens with `m` on this residue class. That is the quantitative shape a
uniform `(L-S)_top` proof on `m ≡ 2` should aim for. This is a pointer, not a lemma.

**Critic-derived structural handle for repairing (ELIG-top).** `I(CB(8,m)) = Σ_j C(m,j) R_j + x(1+x)(1+2x)^{8m}`, where
`R_j = x^j (1+x)^{8j} (1+2x)^{8(m−j)+1}`. Every summand is a product of linear factors, so each **is** real-rooted, and `R_j` has mean
`16m/3 + 2/3 − j/3`. Coefficientwise, the tree's sequence is a positive mixture of Poisson-binomial sequences with Binomial(`m`, `256/6817`)
mixing weights. Darroch applies to each summand. A uniform proof needs a quantitative comparison: the negative descents of the summands with
`j ≳ 7` must outweigh the positive differences of the few low-`j` summands. The low-`j` weights are exponentially small in `m`, while the
descents are only polynomially small. I did not complete this proof.

## Remaining obligation

1. **(ELIG-top) uniform in `m`** (for `𝒞_8`, and for `m ≡ 1`, `m ≥ 134`): OPEN. It is exact for `106 ≤ m ≤ 500` only. The route to a proof is
   the quantitative mixture comparison above, or any valid mode–mean theorem for these specific non-real-rooted sequences. Real-rootedness of
   `I(CB(8,m))` is false, so it cannot be cited.
2. **E1 at `p*`**: closed on `𝒞_8` by the registered threshold key (modulo Darroch, which applies legitimately there). It is open only at the
   undecided rank `p* = ⌈μ₁⌉ + 1` of the `m ≡ 1` class beyond `m = 400`.
3. **`(L-S)_top` and the B7 composition**: untouched by the return. The successor inherits the conjectural closed form
   `θ*_8(m) = 288/(200m² + 82m + 5)` on `m ≡ 2 (mod 3)` and the widening room ratio. That closed form must be validated against a per-choke LP
   at a further `m ≡ 2` row, for example `m = 98` (predicted `θ* = 288/1928841`), and then against literal laboratories, before any uniform claim.
   The `m ≡ 0` class needs its own fit.
4. Nothing here is evidence for (HALL) at any scope or for the primary aggregate.

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-crit-T1-U/`
(`python3 -B` throughout, standard library only):

- `rr_check.py` (`d5cd28dd…098a`): my own tree DP and the exact Sturm counts. Run it with `python3 -B rr_check.py`. Output digest
  `a22e43422e03a6f049e26cea748f2489aa29691876b7136db10f4b1d437402e0`.
- `kron_sweep.py` (`b632013a…dc44`): exact Kronecker/decimal coefficients, with a self-test against `rr_check.forest_poly`. Run it with
  `python3 -B kron_sweep.py 8 106 500 sweep_106_500.json`. Output file `sweep_106_500.json`, digest `d27eaaa2…4c54`
  (about 1065 s; ran as PID 77343). Fixed-point runs: `fp_rows.json` (`d = 8`, `m = 86..95`) and `fp_rows9.json` (`CB(9,112)`).
- `theta_fit.py` (`232c347e…c6d9`): E1 threshold residues on `[106, 5000]` and the exact `θ*` fit. Output digest `5cc6c1df2f702bc540f726051b897d52f8820a467f3e7e84cb8cd3b71fe2883a`.
- `k112_fixed.py` (`85cd3a01…1f32`): the `K_{1,12}` brute force.
- `kron_timing.py`: a timing probe only, cited for nothing.
- `replay/t1_main.py`: a copy of T1's generator (`306a8344…e2`). `replay/REPLAY.log` is byte-identical to T1's log (PID 78059).
  `replay/alias_check.py` was copied and **not run** (it reads an unauthorized file).
- `pid_sweep1.txt` and `pid_replay.txt` hold the literal PIDs. Both processes had exited before this write.
