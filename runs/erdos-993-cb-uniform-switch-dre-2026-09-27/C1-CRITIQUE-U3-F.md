# Critique

Critic `C-U3-F` (orientation F, falsify) of the route return of seat `U3` (`C1-U-03`, mechanism `ELIG-TOP-INTEGER-DESCENT-FORMAL-ROUTE`, orientation U), Cycle 1, r31, 2026-09-27.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other VerityOS file. The harness also placed the project `CLAUDE.md` and the user's auto-memory index into my context. I did not fetch or use them.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Scratch:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-U3-F/` only. It contains `replay/` for the copy-out replays, `own/` for my own instruments and `LeanProject/` for the Lean rebuild.

## Identity and seal audit

- Dispatch `control/dispatch/c1-stage4/DISPATCH-C-U3-F.md`: SHA-256 `821e760d6eafd017bfdf67dad8ba1de53e44d716f9321a00cae0d3ba11fe3243`. I checked it before any other action, and it matches.
- **Capsule seal** (`control/c1-critic-capsules/U3-PACKET-MANIFEST.json`, stage `cycle-1-stage4-U3-critic-capsule`). I recomputed SHA-256 over the canonical JSON without `seal_sha256` (sort_keys, `(",",":")`, no trailing newline) and got `9ee2cd0dbc6e5a7ce1cf15588b935ed3b47f777d9bcca403f8d22cc6d7fe9802`. It matches. All 14 member files match on bytes and SHA-256.
- **Stage 4 dispatch seal** (`control/C1-STAGE4-DISPATCH-MANIFEST.json`): recomputed `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b`. It matches its own field.
- **Stage 3 seal** (`control/C1-STAGE3-PACKET-MANIFEST.json`, 37 files): recomputed `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37`. It matches its own field. The manifest lists `cycles/cycle-1/stage3/returns/U3/RETURN.md` at `5d7c62e4…c2f71d` (31 625 bytes), which matches the file, and `DISPATCH-U3.md` at `6f8a8f65…054100`, which is the value the return cites.
- **Stage 2 seal** (`control/C1-STAGE2-PACKET-MANIFEST.json`): recomputed `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`. It matches the protocol value.
- **Every digest the return lists:**
  - The 24 source and control digests in return §3 are all present in the Stage 2 manifest. The 14 that live under `sources/` (plus the run-local registry copy) I recomputed from disk, and all match.
  - The 7 script SHA-256s in return §6 match the files in `scratchpad/c1-U3/`. The return's table says `c1-U3-replay/`. That is a path-label slip only, because the bytes are identical.
  - The Lean file `Smoke/Basic.lean` matches `ff133398…27d246`.
  - Output digests I reproduced on replay: `verify_direct` `9abda58a…3c9251`, `verify_all_q` `989da573…cc876e`, `verify_elig_top` `8e1c3196…08eebb`.
  - `poly_explore.py` prints no digest. Its own docstring calls it "Exploratory (non-authoritative) … not the digested generator", yet it carries the load-bearing sign step. See the Certification audit.
- Route identity: `C1-U-03` and `ELIG-TOP-INTEGER-DESCENT-FORMAL-ROUTE` both appear verbatim. The return discloses its chartered model as Sonnet 5, high. The Stage 3 disclosures record lists U3 as "none beyond the scoped boot". The files the return lists as read (charter, AUTHORIZATION, OBLIGATIONS, ROUTE-STATE, worker brief, run-local registry) are all Stage 2 members, so I find no boundary breach in its read list.
- **My read-boundary disclosures:**
  1. I printed `control/C1-CRITIC-ATTACK-BRIEFS.md` in full with `cat`, so I saw every seat's section and not only U3's. I used nothing from the other sections. My block-sign finding below comes from my own computation.
  2. I ran a names-only `ls` of `cycles/cycle-1/stage4/critics/` and of `…/critics/U3/`. I saw the sibling seat folder names and a `T` orientation folder under U3. I read nothing in them.
  3. I ran one `pgrep -f "crit_q_poly.py 63 1"` to find my own job's PIDs. This is a host process-table query filtered to my own command string. It returned only two PIDs (my shell wrapper and the Python process) and no other command lines. I killed nothing with it.
  4. I read `sources/authority/CLAIM-IDENTITY.json` for the alias check. It is authorized under `sources/`.
  5. I listed the pinned shared Lean project directory and hashed its three configuration files so I could bind by symlink. That root is allowed by `PATH-CHECK-U3.json`.
  6. My first two boot commands used an `echo =====` separator that zsh rejects. No content outside the grant was read because of it.
  7. No network was used and no packages were installed.

## Independent re-derivation

**E1 condition (i) at q = 1, the return's theorem.** My own instrument, `own/crit_q_poly.py`, uses integer polynomials only. It normalizes by `G_0` with the full denominator `∏_{k=0}^{a} D_k`, not by the return's `G_4` with a split denominator. The setup is:

- `m = 3n+2`, `a = 8q−1`, `b = 24n+17−8q`, `t = p*−q−1 = 16n+11−q`, `s_0 = 16n+12−9q`.
- `G_k = 2^{s_0+k}C(b, s_0+k)`, with `D_k G_{k+1} = N_k G_k`, where `N_k = 16n+10+2q−2k` and `D_k = 16n+13−9q+k`. This holds in ℤ for every `s ≥ 0`, because both sides vanish past `b`.
- `E_q(n) = (r_q(t+1) − r_q(t))·∏D_k / G_0 = Σ_k (C(a,k−1) − C(a,k)) ∏_{i<k}N_i ∏_{i≥k}D_i`.

At `q = 1` this gives `−E_1(n) = 1040054400 + 13872986880 n + … + 85899345920 n^7`. That is exactly the return's `Diff(n)`, coefficient for coefficient, as it must be: `E_1 = −Diff`, because `G_4/G_0 = N_0⋯N_3/(D_0⋯D_3)`. The return's "degree-8 coefficient 0" is only an artifact of padding.

I checked the identity `E_q(n)·G_0 = Δ·∏D_k` against a direct binomial sum at `n = 35, 36, 37, 100`, which is `m = 107, 110, 113, 302`. It holds exactly.

The return's reduction (§5.2) also checks out by hand:

- The convolution coefficients `C(7,k−1) − C(7,k)` are `(−1,−6,−14,−14,0,14,14,6,1)`.
- The ratio `2(b_1−s)/(s+1) = (16n+12−2j)/(16n+4+j)` is correct.
- The denominators `N_0..N_3` and `D_4..D_7` are positive for every `n ≥ 0`.
- `G_4 > 0`, since `s_0 + 4 ≤ b_1`.

**The q = 1 fact is therefore proved, uniformly in `m`, with no Darroch or Newton, and I confirm it.** The hypothesis `m ≡ 2 (mod 3)` enters exactly where the return says: it makes `p* = 16n+12` an integer, and it makes `t`, `s_0` and `b_1` integer-linear in `n`. No asymptotic step is involved, so there is no `M_0`.

**Replays** (copy-out-first into `replay/`):

- `crosscheck_symbolic`, `poly_explore`, `verify_direct`, `verify_all_q`, `margin_trend` and `verify_elig_top` reproduce every printed value and digest.
- `verify_fixed_points` reproduces `n = 1822`, `α = 964`, `x = 570` at `m = 107`.

**Own literal-tree instrument** (`own/crit_blocks.py`). It builds `I(CB(8,m))` by the leaf/support/choke/root tree DP as coefficient lists, which is independent of the return's binomial double sum.

| m | n | α | p* | x (through α) | p* − x | parent descent | eligible |
|---|---|---|---|---|---|---|---|
| 107 | 1822 | 964 | 572 | 570 | 2 | true | true |
| 110 | 1873 | 991 | 588 | 586 | 2 | true | true |
| 113 | 1924 | 1018 | 604 | 602 | 2 | true | true |

- At all three rows, `x + 2 = p*` holds with equality: the parent descent is the first descent.
- The block decomposition of `SEMANTIC-CONTRACT.md` §2 equals the DP polynomial exactly at all three rows.
- E1(i) holds strictly for every `q ∈ [1,m]` at all three rows, computed by explicit convolution.
- The relative margin `(r_q(t) − r_q(t+1))/r_q(t)` is minimal at `q = 1` (0.004373, 0.004254 and 0.004141) and strictly increasing in `q` over all `q` at all three rows. The return itself only sampled nine values of `q` at `m = 107`.
- Digest: `97bcb7b6…812b70`.

## Attacks and findings

**F-1 (load-bearing; strike). The §5.6 "local threshold" is false.**
- **What the return claims.** Block `j` is past its peak (descending at `p*−2−j`) "exactly for `j ≥ 4`", and blocks `j ∈ {0,1,2,3}` are ascending.
- **Why the argument cannot give that.** It is a mean-position argument: `(p*−2−j) − μ_j = (j−4)/3`. Being on one side of the mean does not decide the sign of a single difference. At `j = 3` the point sits 1/3 below the mean, and the mode could be on either side.
- **What the exact values show.** At every class `m` in `[107, 2000]` (632 rows; `own/crit_blocksign_scan.py`, digest `66c7e0d9…6cbb61`):
  - the block signs for `j = 0..8` are `(+,+,+,−,−,−,−,−,−)`;
  - the tail `x(1+x)(1+2x)^{8m}` ascends.
  - So block 3 **descends**. The ascending set among `j ≤ 8` is `{0, 1, 2}` plus the tail. The return does not mention the tail at all.
- **Proved for every class m** (critic-derived, see F-6). The return's statement "`{0,1,2,3}` ascend, `j ≥ 4` descend" is refuted at `j = 3`. The return's ELIG-top gate line (value `advanced`) rested on this statement and falls with it.

**F-2 (strike). The mass picture in §5.6 is wrong.**
- **What the return claims.** An ascending set of weight `O(m^3)` sits against a descending "bulk of `Θ(2^m)` binomial mass".
- **Why that is wrong.** The binomial weight `C(m,j)` is not the relevant mass. The block values `p_j(p*−2−j)` fall steeply as `j` grows.
- **What the exact values show.** On the literal instrument:

| m | largest block share of `i_{p*−2}` | share of blocks `j ≤ 3` | ascending / descending mass in `Δ_{p*−2}` |
|---|---|---|---|
| 107 | at `j = 4` | 0.426 | 0.2886 |
| 110 | at `j = 4` | 0.404 | 0.2493 |
| 113 | at `j = 4` | 0.383 | 0.2158 |

  - The mass sits at small `j`, and the ascending contributions are a constant fraction of the descending ones, not an exponentially small one.
  - The domination argument T3 needs is therefore a comparison of neighbouring small-`j` blocks, not "polynomial vs `2^m`". I strike the "concentration observation".

**F-3 (strike, narrow). "Immediate for any fixed `q = Q_0`" and "a free corollary" are false as stated.**
- **What the exact values show.** In the unshifted variable `n`, the sign polynomial `−E_q(n)` has negative coefficients for **every `q` from 3 to 63**. At `q = 3` they sit at degrees 3, 4, 8, 9, 10, …; at `q = 4`, at degrees 1, 3, 6, 8, 9, …. Only `q = 1, 2` have all coefficients nonnegative.
- **Consequence.** The reduction does carry over to any fixed `q`, but the sign step does not. It needs a further certificate. The one that works, a Taylor shift to `n = 35 + n'`, is my advance, not a corollary.

**F-4 (fence strike).** The theorem and the candidate are stated "for every `m ≥ 2`". `SOLUTION-CONTRACT.md` §3.1 and gate ruling 5 strike anything beyond the class. The mathematics is also valid at `n ≥ 0`, but the claim is narrowed to `m ≥ 107`, `m ≡ 2 (mod 3)`.

**F-5 (overstatement).** §5.5 says `q = 1` is the binding case "confirmed (both analytically and computationally)".
- The "analytic" part is only the mean gap `t_q − μ_q = (2q+1)/6` growing with `q`. That is a heuristic, not a proof that the margin is monotone or that `q = 1` binds.
- The computational part covers `m = 107`, sampled. My all-`q` check extends it to `m = 107, 110, 113`.
- Nothing in E1 uses "binding". E1's criterion needs condition (i) at **every** `q`, and the return covers only `q = 1`. The return does say this in §5.5 and §9, but its §5.4 title "E1(i) … q = 1" must never be read as E1(i).

**F-6 (critic-derived advances; attributed to critic `C-U3-F`).**
- **(a) E1 condition (i), Darroch-free, for every `q ∈ [1, 63]` and every class `m ≥ 107`.**
  - For each such `q`, the polynomial `−E_q(35 + n')` has all coefficients strictly positive. This covers degrees up to 503 at `q = 63`.
  - The identity `E_q·G_0 = Δ·∏D_k` holds for every `n ≥ 35`. Its side conditions hold throughout: `s_0 = 16n+12−9q ≥ 0`, `G_0 > 0`, and `D_k ≥ 16·35+13−9·63 = 6 > 0`.
  - Hence `r_q(p*−q) < r_q(p*−q−1)` for all `m ≥ 107`, `m ≡ 2 (mod 3)`, and `1 ≤ q ≤ 63`.
  - Instrument `own/crit_q_poly.py 63 1`. Output `own/crit_q_poly_1_63.full`, file SHA-256 `35a279bc…6e254`, result digest `7dad10f5…37fc9c`. The identity was cross-checked against direct sums at `n = 35, 36, 37, 100` for every `q`.
  - Grade: an exact symbolic certificate per fixed `q`. I state it here. It needs an isolated second read and is `computer_assisted` at most until then.
  - **Still open:** `q ∈ [64, m]`, a range that grows with `m`. That range still rests on the registered key, modulo Darroch/Newton.
- **(b) Local block signs, Darroch-free, for every class `m ≥ 107`.**
  - The same certificate applied to block `j` has `a = 8j`, `b = 24n+17−8j`, `t = 16n+10−j`.
  - It proves that blocks `j = 0, 1, 2` and the tail **ascend**, and blocks `j = 3, …, 8` **descend**, at `p*−2`. For each case, `±E(35 + n')` has uniformly signed coefficients and the identity is checked.
  - Instrument `own/crit_block_poly.py 8`, digest `29bab6fb…86a26`.
  - This is the corrected local fact that T3's domination argument would consume. It is not a proof of (ELIG-top)(a).

**F-7 (checked, no defect).**
- The Lean ℕ-subtraction `b − s` is guarded by `h : s ≤ b`, and `zify [h]` casts it soundly.
- Every generator guards `k < 0`.
- `x` is computed through `α`, with the terminal difference counted.
- There is no circularity: the `q = 1` proof uses only Pascal's rule and the sign of a polynomial with positive coefficients.

**No cut and no template claim.** The return makes no network or flow claim, so the fidelity-first items (WID, derived `F_{p*}`, target classes) do not apply to it. I say so explicitly rather than skipping them.

## Mechanism-equivalence and fence check

- **Claim identity.** The return's candidate `E993-R31-CB-D8-M-CONGRUENT-2-MOD-3-CONDITION-I-AT-Q-1-AND-RANK-PSTAR-PROVED-BY-ELEMENTARY-PASCAL-RATIO-INTEGER-ARGUMENT-WITHOUT-DARROCH-OR-NEWTON` fails on two counts.
  - **Lexically:** registry keys must name predicates, and this one names a proof method (`PROVED-BY-…-WITHOUT-…`).
  - **Mathematically:** its statement is an instance of the registered key `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`, part (a), at `d = 8` and `q = 1`, with `p = p* = ⌈μ_1⌉+2`. I read that key's face in `sources/authority/CLAIM-IDENTITY.json`.
  - **What is new** is the removal of a dependency, not a new claim. Recommendation: record it as a Darroch-free proof of that key's `q ≤ 63` instances on the class (subsuming `q = 1`; see F-6(a)), or as a predicate-named `E993-R31-` key whose scope is exactly `d = 8`, `m ≥ 107`, `m ≡ 2 (mod 3)`, `p = p*`, `q ≤ Q`. Either way it needs an isolated second read first.
- **Fences.**
  - One rank per tree: respected.
  - The class only: violated by "m ≥ 2" (F-4, struck).
  - Darroch/Newton: the return uses neither. It correctly names the registered key's dependency and does not claim to discharge it at all `q`.
  - No refuted mechanism is revived.
  - No status is transferred to (HALL), the aggregates or E1.
  - Census values are never used as proof: the sweeps in §6 are confirmations, and the universal content rests on the polynomial.
  - The `θ*` law is not touched.

## Certification audit

| Literal on the return | Backing | Ruling |
|---|---|---|
| "Every coefficient of degrees 0–7 is strictly positive" / `Diff(n) > 0` ∀`n ≥ 0` | reproduced exactly by my independent normalization | **backed** |
| "Theorem … for every `m ≥ 2`" | mathematics fine; fence | **narrowed** to `m ≥ 107`, `m ≡ 2 (mod 3)` |
| "verified exactly … bit-for-bit" (§5.2–5.3) | replay plus my own identity checks | backed |
| "proved_informal" (proposed grade, `q = 1`) | the proof is complete and elementary | backed as a proposal; needs an isolated second read |
| "q = 1 … extremal … confirmed analytically" | a mean-gap heuristic | **struck** ("analytically"); the computational part is backed at `m = 107, 110, 113` (all `q`) |
| "monotonically increasing through `q = 107`" | the script sampled nine values of `q` | now backed at three rows by my all-`q` check; not universal |
| "immediate … works verbatim for any constant `q = Q_0`" / "free corollary" | false: unshifted negative coefficients for every `q` from 3 to 63 | **struck** (F-3) |
| "block `j` … descending exactly for `j ≥ 4` … ascending for `j ∈ {0,1,2,3}`" | refuted at `j = 3` | **struck** (F-1) |
| "`O(m^3)` … vs a bulk of `Θ(2^m)`" | contradicted by the exact shares | **struck** (F-2) |
| the return's ELIG-top gate value `advanced` | rests on the struck §5.6 | **struck**; for the return it reads `not_advanced` |
| "sorry-free", axioms `[propext]` and `[propext, Classical.choice, Quot.sound]` | my rebuild reproduces both exactly | backed; scratch, no grade |
| `poly_explore.py` as the sign instrument | self-described "non-authoritative", no digest | now backed by my instrument (identical coefficients) |
| Script and output digests | all replayed | backed (path label `c1-U3-replay/` → `c1-U3/`) |

**Lean audit.** I copied the project out, bound Mathlib by manual symlink to the pinned shared project's `.lake/packages`, and ran from inside the project. `lake build Smoke` completed with `Build completed successfully (8657 jobs)`.
- `#print axioms`: `doubledCoeff_succ_mul` depends on `[propext]`; `doubledCoeff_diff_sign` depends on `[propext, Classical.choice, Quot.sound]`.
- There is no `sorry`, `admit` or `native_decide`.
- The statements say what the return says.
- They are parameter-free Pascal facts about `2^s C(b,s)`. Neither encodes a conclusion, and neither touches CB. The composition, which is the sign of the fixed 9-term sum, is not formalized.
- No carried Snippet entries are involved, so there was nothing to byte-compare.

## Verdict

The return's main content is a Darroch-free, uniform-in-`m` proof that E1's condition (i) holds strictly at `q = 1` and rank `p*` on the class. It is correct: I re-derived it by a different normalization, found identical coefficients, and replayed every generator. In my judgment its mathematics is complete at grade `proved_informal`, narrowed to the class and subject to an isolated second read.

Four other parts of the return are wrong or overstated and are struck:
- the §5.6 ELIG-top "threshold": block `j = 3` descends, as does every block `j ≥ 3` I tested, and the tail ascends;
- the `Θ(2^m)` mass picture;
- the "immediate" extension to any fixed `q`;
- the "for every `m ≥ 2`" scope.

My own advances, which are critic-derived and need a second read, are:
- condition (i), Darroch-free, for every `q ≤ 63` on the whole class;
- the local sign pattern of blocks `j ≤ 8` and of the tail, Darroch-free, on the whole class.

verdict: retained_narrowed
headline_resolved: no

`LS_top: not_advanced`
`ELIG_top: advanced`
`cut_candidate: none`

(For the return itself, the `ELIG_top` line is corrected to `not_advanced` (F-1). The `advanced` above records this critique's F-6(b) block-sign result only.)

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

1. **E1 condition (i) at `p*`, Darroch-free, for `q ∈ [64, m]`.** This range grows with `m`. The fixed-`q` certificate cannot reach it uniformly. Two exact routes are open:
   - **Bernoulli-split identity.** `r(k+1) ≤ r(k)` holds iff `a(N−2k−1)A(k) + b(2N−3k−1)B(k) ≤ 0`, where `N = a+b`. Here `A(k) = C(k) + 2C(k−1)`, `B(k) = C(k) + C(k−1)`, and `C` is the coefficient sequence of `(1+y)^{a−1}(1+2y)^{b−1}`. Iterating this reduces the one-point sign to a ratio bound deeper past the mean.
   - **Transfer of 8.** Use the step `(a_q, b_q) → (a_q+8, b_q−8)`.

   Until one of these closes, condition (i) at `q ≥ 64` rests on the registered key, modulo Darroch/Newton.
2. **(ELIG-top)(a).** This needs a cross-block domination argument using the corrected local pattern:
   - blocks `{0, 1, 2}` and the tail ascend; blocks `3..8` descend (proved here);
   - the sign for `j ≥ 9` is unproved;
   - the ascending-to-descending mass ratio is about 0.29, 0.25 and 0.22 at `m = 107, 110, 113`, with mass concentrated near `j = 4`.

   It is T3's obligation. The return's §5.6 must not be used as an input.
3. **Isolated second reads** of the `q = 1` theorem (narrowed) and of this critique's F-6(a) and F-6(b) certificates before any registration. A predicate-named key is needed; the method must not appear in the key.
4. **A Lean composition of the fixed-`q` sign argument.** A natural small award: a Pascal-ratio chain plus a polynomial with positive coefficients. The return compiled only its two atomic lemmas.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-U3-F/`.

**Replays** (`replay/`): copies of the seven U3 scripts, SHA-identical to the return's §6 table, and `Basic.lean.orig` (`ff133398…27d246`). `replay/fixed_points.out` reproduces `x = 570`.

**Own instruments and outputs** (`own/`):

| File | SHA-256 | Notes |
|---|---|---|
| `crit_q_poly.py` | `60cc10eba3c80e3b94ac05ac1ab5a67c016a238a918ecb75a21161ec8f4ec408` | |
| `crit_q_poly_lib.py` | `14d46211b15489199c83200c4340173b8ff6c5eda4c4a9abe8a303eaf4bd3916` | |
| `crit_q_poly_1_63.full` | `35a279bcd64853290c42af514570b4f1dbf7e696826ac74254a92b1d2f26e254` | authoritative output; result digest `7dad10f57467dd785b133d8c7f82d7f3853c7e09fbfc73b48e626209f537fc9c` |
| `crit_q_poly.out`, `crit_q_poly_24.out`, `crit_q_poly_63.full` | | superseded earlier runs; `_63.full` stopped at `q = 41` on an over-strict guard, later relaxed to `s_0 ≥ 0`; not evidence |
| `crit_blocks.py` | `3e0d1d5fabd7323ac1ec340874296e5005645114c58b5c29d143d89f3493e1fb` | |
| `crit_blocks.out` | `2b38e13ba741d3700ae1bc049613953d23e27644c3cb1fe4083c7d2eee6e0d1f` | digest `97bcb7b67b43799d8b4bcc82d6ce73589359a05a2a9c0dd0075bb1ec38812b70` |
| `crit_blocksign_scan.py` | `fcdd2f1dcdb50e9a49cd36862791420f45874bed7e4448f09465fff3d36266aa` | |
| `crit_blocksign_scan.out` | `92cc5bf8ebb895bc86e2ce4c6629e6f1b8afa9b88573243f59c4436eec6c9882` | digest `66c7e0d91120fd580b2cb2e55084960ee1463ab4d6b1b40e660b198b2d0cbb61` |
| `crit_block_poly.py` | `37507c37137e9b77c2ec88573c19d4655725447e4118815779e3f47cce3e7b9a` | |
| `crit_block_poly.out` | `eed4c663a5b69320762e729321999d51825dda5bb5cac5d557cc73bd1b5bec15` | digest `29bab6fbe0d5a99727aa68441c6fc7b6caf4a75c24f95abb171ba7dc4db86a26` |

**Lean** (`LeanProject/`): configuration byte-copied, identical to the pinned shared project (`lakefile.toml` `ca1c0338…`, `lake-manifest.json` `5061b76d…`, `lean-toolchain` `2bdc48ad…`). `.lake/packages` is a symlink to the shared packages. `Smoke/Basic.lean` is identical to U3's. No `lake update` and no `lake clean` were run.

**Background jobs.**
- PID 59610 (fixed-point replay) and PID 62387 (the guarded `q ≤ 63` run) were started by me and both exited on their own.
- One foreground run (`crit_q_poly.py 63 1`, PIDs 69657 and 69658) was moved to the background by the harness timeout. It completed with exit 0.
- No job of mine is running at the final write.
