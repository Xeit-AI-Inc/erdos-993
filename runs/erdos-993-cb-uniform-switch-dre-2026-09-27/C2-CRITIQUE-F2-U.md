# Critique

Critic `C-F2-U` (cross-orientation U, formal/structural) of route `C2-F-02 ELIG-AND-CERTIFICATE-RANGE-ADVERSARY` (seat F2,
orientation F), r31 Cycle 2 Stage 4.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Subsystems loaded: the constitution and the startup protocol only.
I read no other VerityOS file (see the read-boundary disclosures under `## Artifact inventory`). I did no conversation logging; the
controller owns that for the run.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model
id: claude-opus-5-5.

## Identity and seal audit

- **Dispatch** `control/dispatch/c2-stage4/DISPATCH-C-F2-U.md`: `shasum -a 256` gives
  `1875cad6e53cb31e7b2845c144a212e55d0a74c7d44f1dc9076ab0b8fb48845c`. This MATCHES the digest in my instructions, and I checked it before reading the file.
- **Capsule seal** `control/c2-critic-capsules/F2-PACKET-MANIFEST.json`: I recomputed the SHA-256 of the canonical JSON without `seal_sha256`
  (sort_keys, separators `(",", ":")`, no trailing newline). It gives **`0ff00fe93e0d8566b8f3108d241454242c2907b18b4d234bf345b887890b3873`**, which
  MATCHES. All 14 listed files match their recorded SHA-256 and byte counts.
- **Stage 2 seal**: `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`, recomputed, MATCH. **Stage 3 seal**:
  `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5`, recomputed, MATCH. **Stage 4 dispatch seal**:
  `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb`, recomputed, MATCH.
- **Every digest the return lists:**
  - The return quotes the Stage 2 seal. It matches.
  - The F2 dispatch digest `f8d363a4…13b0` equals the Stage 3 manifest entry for `control/dispatch/c2-stage3/DISPATCH-F2.md`. It matches.
  - The SR-4 second read (`112164b8…9bf1`, 46450 bytes) equals the `sources/c1-results/SOURCE-DIGESTS.json` entry, and I recomputed it. It matches.
  - All nine inventoried artifacts under `scratchpad/c2-F2/` match the return's §15 table byte for byte.
- **Return** `cycles/cycle-2/stage3/returns/F2/RETURN.md`: `ce9954e4…a562`, as in the capsule.
- **Claim identity.** The return touches the following keys:
  - `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`
    (SR-4's key; VERIFIED in the C1-close snapshot `sources/c1-results/control/snapshots/CLAIM-IDENTITY.run-local.c1-close.json`, 497 claims, which agrees
    with the return's count).
  - The r30 favorability key `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`.
  - `E993-TREE-REAL-ROOTED` (REFUTED; not revived).
  - The headline keys, which stay OPEN.

  The return proposes no `E993-R31-` key. That is correct: F2-R1/R2/R3 are bounded observations. The return's lexical scan read the live run-local
  registry, which is outside my grant; I did not re-check its "S-5 hit" remark, and nothing rests on it.

## Independent re-derivation

My instrument is my own code, standard library only, exact `Fraction`/integer arithmetic. I used F2's scripts only as replays.

1. **Pooled certificate, own construction** (`crit_cert.py`). With `m = 3t+2`, `B = 24t+17`, `L = 16t+10`, `M = 8t+7` and
   `R = C(B,L)2^L`:
   - Every term is `2^{-q}C(p,i)·C(B−p, L−q)/C(B,L)`. It equals `(L)_q(M)_{p−q}/(B)_p` for `0 ≤ q ≤ p`, equals `(L)_q/((B)_p(M+1)…(M+q−p))` for `q > p`, and equals
     `(M)_{p+1}/((L+1)(B)_p)` for `q = −1`.
   - I placed every term over the natural denominator `D_J = Π_{s<8J}(B−s)·Π_{k=1}^{J}(M+k)·(L+1)`.
   - **J = 5:** `deg N_5 = 50` and `deg D_5 = 46`. The a-priori degree bound is `46 + 5 = 51`, because each term's numerator has degree `≤ 46` and `C(m,5)` adds 5.
   - **Implementation check:** at 63 points `t = 4..66`, `N_5(t)` equals `S_5(t)·D_5(t)/R(t)` computed by a **direct big-integer evaluator** with no ratios
     (`Σ_i C(p,i)2^{l−i}C(B−p,l−i)`). Since 63 > 52, the constructed `N_5` is the true numerator identically.
   - **Concordance with the object of record:** the SHA-256 of my primitive integer `N_5` (the default `json.dumps` list, low to high) is
     `893a21b6fdd0f7c2ac7e151db10873351c164c949ee12582812fc3452db651f7`. That is SR-4's recorded `893a21b6…51f7`. The shift-35 coefficients hash to
     `b551b6ae…b9dd`, also SR-4's. All 51 are positive, the smallest has 56 digits, and `S_5/R(35) = 0.014383…`. These agree with SR-4 on every recorded
     value.
2. **Shift, roots, sign** (own Sturm sequence with primitive-integer remainders, own Taylor shift):
   - **Smallest all-positive integer shift of `N_5` is `t = 33`.** At `s = 32`, exactly one coefficient is negative: the constant `N_5(32) < 0`. At
     `s = 28, 29, 30, 31` there are 7, 5, 4 and 2 negative coefficients.
   - Sturm on `N_5`: exactly **one** real root in `(32, 33]` and **zero** in `(33, ∞)`. The count on `(33, ∞)` is taken at `+∞` exactly, not at a finite
     cutoff.
   - The bisected root is `t* = 32.148492986193666…`, the same as F2's bracket.
   - `S_5 < 0` at `t = 28..32` and `> 0` from `t = 33`.
3. **Reconciliation of degree 90 with degree 50** (`crit_reconcile.py`; F2's own functions imported from my copy-out replay).
   - Exactly, `N_total = N_5·Π_{k=6}^{45}(8t+7+k)` and `D_master = D_5·Π_{k=6}^{45}(8t+7+k)`, and `N_total·D_5 = N_5·D_master` as polynomials.
   - F2's degree 90 is therefore the same rational function as SR-4's, with a **degree-40 common factor left uncancelled**. The factor comes from writing
     `(L)_q/(M+q)_q · (M+q)_p/(B)_p` instead of `(L)_q(M)_{p−q}/(B)_p`.
   - The extra factors have their roots at `t < 0`, so every count on `t > 0` is unchanged. `N_total(33+u)` is also all-positive, and `N_total(32+u)` is not.
4. **The `S_4` window** (J = 4). `deg N_4 = 40` and `deg D_4 = 37`. The identity is checked at 53 points.
   - Sturm: zero roots in `(28, 44]`, exactly one in `(44, 45]` at `t = 44.0316…`, and **zero in `(45, ∞)`**.
   - `N_4(45+u)` has **all 41 coefficients positive**. `N_4(44+u)` fails only at its constant term.
   - Hence `S_4 < 0` exactly at the class rows `t = 35..44` (`m = 107..134`) and **`S_4 > 0` for every real `t ≥ 45`**.
   - At `t = 35`, the piece signs are `g_0, g_1, g_2 < 0`, `g_3, g_4, g_5 > 0` and `τ < 0`.
5. **Tail sign** (by hand). `τ/(2^{L−2}C(8m,L−2)) = 1 − 4(8m−L+2)(8m−L+1)/(L(L−1))`, with `8m − L = (8m+2)/3`. Clearing denominators gives
   `4(8m+8)(8m+5) − (16m−2)(16m−5) = (256m²+416m+160) − (256m²−112m+10) = 528m + 150 > 0`. So `τ < 0`. Every step checks.
6. **Literal rows** (`crit_rows.py`; own labelling, own rooted DP). Tree-ness is asserted from the edge count `n − 1` and connectivity.

| `m` | `n` | `α` | `x` | `p*` | `Δ_L<0` | `x+2≤p*` | `3p*<2α+1` | `v` fav. at `p*` | `c` fav. at `p*` | closed forms = literal (`I`, `I−v`, `I−c`) |
|---|---|---|---|---|---|---|---|---|---|---|
| 107 | 1822 | 964 | 570 | 572 | yes | yes | yes | yes | yes | yes, yes, yes |
| 110 | 1873 | 991 | 586 | 588 | yes | yes | yes | yes | yes | yes, yes, yes |
| 113 | 1924 | 1018 | 602 | 604 | yes | yes | yes | yes | yes | yes, yes, yes |
| **116** | 1975 | 1045 | 618 | 620 | yes | yes | yes | yes | yes | yes, yes, yes |
| **119** | 2026 | 1072 | 634 | 636 | yes | yes | yes | yes | yes | yes, yes, yes |
| 137 | 2332 | 1234 | 730 | 732 | yes | yes | yes | yes | yes | yes, yes, yes |

   `x` is computed through `α`, with zero above `α`. The 107 row reproduces the SEMANTIC-CONTRACT §5 fixed point. At every row `x = p* − 2` exactly, so
   eligibility is tight there. `F_{p*}` is **derived** on the literal tree: `v` and `c_{11}` are tested, and every `c_{ij}` is an automorphic image of
   `c_{11}`, so `F_{p*} = leafSet` at these rows. These rows are bounded evidence only.
7. **Replay.** I copied F2's four scripts out into `scratchpad/c2-crit-F2-U/replay/` and ran them. All four exit 0, and all four `_out.json` files are
   **byte-identical** to F2's recorded digests.

## Attacks and findings

- **A1 (independence of the "third method"; narrowed).** F2 says its construction is a "different decomposition" and "a stronger form of
  independence".
  - Mathematically it is the **same identity** SR-4 uses. `(L)_q/(M+q)_q · (M+q)_p/(B)_p = (L)_q(M)_{p−q}/(B)_p`, written unreduced, and §3 of my
    re-derivation proves this exactly.
  - It is an independent **implementation** (own code, own Sturm), not an independent method.
  - The degree question in the brief is resolved: 90 = 50 + 40, and the 40 extra factors are `8t+7+k` for `k = 6..45`, all of them positive for
    `t > 0`.
  - F2's disclosed concordance gap (SR-4's "160× C-T3-F") is moot for my purposes, because my `N_5` matches SR-4's digest directly.
- **A2 (invalid inference; struck).** §4 says leading-coefficient sign "guarantees positivity for every larger t, since a degree-90 polynomial has only
  finitely many real roots and none are found beyond 32.1485 in a search six orders of magnitude past the class endpoint". This is **not a valid argument**:
  finitely many roots can lie beyond `10^{12}`. The conclusion is still true, for two reasons:
  - F2's own shift-33 all-positive certificate implies it.
  - My Sturm count to `+∞` (zero roots on `(33, ∞)`) implies it.

  F2's Sturm table also omits the interval `(33, 35]`. The shift-33 certificate covers it, and my count is zero there. The inference is struck; the
  finding survives on the certificate.
- **A3 (shift 33; confirmed and transferred to the object of record).** F2 checked the shift on its own `N_total`. Because `N_total = N_5·(positive
  factors)`, positivity of `N_5(33+u)` would imply positivity of `N_total(33+u)`, but not conversely. So F2 had not established the claim for SR-4's
  `N_5`.
  - **I checked `N_5` directly.** Every coefficient of `N_5(33+u)` is positive, and `N_5(32+u)` has a negative constant.
  - F2's claim, "the actual form of proof SR-4 ships already holds at shift t = 33", is therefore **true**, but only on my check.
  - "New, sharper fact": SR-4 already recorded that `S_5` is positive at the values `t = 33, 34`. The new content is that the Taylor-shift certificate
    itself is all-positive at 33.
  - The remark that the certificate "would already certify positivity from `m = 101`" is **outside the class**. It is not a claim of record at
    `m ∈ {101, 104}` (fence 1).
- **A4 (tail-sign scope; narrowed).** The claims "for every integer `m ≥ 1`" and "no class restriction" are overstated. `L = (16m−2)/3` is an integer
  only when `m ≡ 2 (mod 3)`, so `τ` is undefined for the other residues. The correct scope is every `m ≡ 2 (mod 3)`, `m ≥ 2`. The algebra itself is
  right.
- **A5 (`S_4` window; confirmed, and the tail made universal by me).** `S_4 < 0` exactly at `m = 107..134` is exact. F2's "positive from `t = 45` on" was
  bounded (checked to `m = 9008`); my shift-45 certificate makes it universal (§4 of my re-derivation). **Does it matter?**
  - Not for the class theorem: `S_5` covers `m ≥ 107` in one certificate.
  - A two-piece proof (the `N_4` certificate for `m ≥ 137` plus ten finite rows) replaces one degree-50 certificate with a degree-40 certificate and ten
    rows. That is no simplification for a formal target.
  - The window does show that the pool with `j ≤ 4` fails exactly on the first ten class rows.
- **A6 (F2-R3; superseded and under-graded).**
  - The gap formulas are exact affine identities in `(m, j)` (`crit_fav.py`):
    - `Q_j` (`T−v`): `2j+5`.
    - `T−v` tail: `2`.
    - `E1_j`: `2j+7`.
    - `E0_k`: `2k+5`.
  - The tool's side conditions hold symbolically: `a + b − t = 8m/3 + j − 1/3 ≥ 0` and `t = (16m+4)/3 − j ≥ 1` for `j ≤ m`.
  - Grading them `computer_assisted` "only at tested rows" undersells them. They are identities, not census facts.
  - The paired-block identity `E0_0 + tail = (1+x)(1+2x)^{8m−1}(1+3x+x²)` holds for **every** `m`, because both sides factor. "Checked for m up to 107"
    is unnecessary.
  - F2's statement that the paired block "is not of the two-binomial form" and needs a separate argument is **superseded**. Since `1+3x+x² = (1+x)² + x`,
    the pair splits as `(1+x)^3(1+2x)^{8m−1} + x(1+x)(1+2x)^{8m−1}`. These are two two-binomial blocks with gap **3** and gap **3** at `t = p*` and
    `t = p*−1`, both inside tool (G)'s range.
  - The advance this yields is recorded under `## Mechanism-equivalence and fence check`.
- **A7 (fresh rows; process finding).** F2's row table (§8) uses `m = 95, 107, 110, 113`, computed from the closed form. Gate ruling 9 makes `116` and
  `119` the fresh rows. F2's `S_4` sweep covers `t = 38, 39`, but its `x`/`Δ_L` table omits them. I computed both, plus 137, on the **literal tree**
  (§6 of my re-derivation). There is no discrepancy.
- **A8 (fidelity).** F2 is a coefficient route and has no network instrument, so (WID) `supply − capacity = S` does not apply. F2 said so; this is not a
  defect. `x` is computed through `α` at the reported rows. The closed forms were validated literally only at `m ≤ 11`. I validated them literally at
  `m = 107..137` (the rows above).
- **A9 (no cut, no revival).**
  - There is no deficient cut in scope. The route has no flow computation, so no template failure could be mislabelled as a cut.
  - Newton and Darroch are not used anywhere in the return.
  - The remark that the paired block is real-rooted is correct, since `1+3x+x²` has roots `(−3±√5)/2`. It is moot: see A6.
  - `E993-TREE-REAL-ROOTED` is not revived.
- **Checks that passed.** Side condition `1 ≤ L−j ≤ 8m+1`: correct. Gap of `P_j` = `2j−8`: correct. Block pattern `−,−,−,+,+,+` for `j ≤ 5`: correct at
  the tested rows. `m = 95` row: correct.

## Mechanism-equivalence and fence check

- **Critic-derived advance (C-F2-U; FAV at `p*`, Darroch/Newton-free, on the whole class).** For every `m ≡ 2 (mod 3)`, and in particular on the class
  `m ≥ 107`, every leaf of `CB(8,m)` is favorable at `p* = (16m+4)/3`. The proof uses only:
  - the closed forms of record for `I(CB−v)` and `I(CB−c)` (a `proved_informal` node; literally re-checked by me at six rows);
  - the carried two-binomial tool `E993Transport.twoBinom_coeff_strictAnti_of_gap` (C1-LA3 entry 17, kernel-checked, no Newton, no Darroch).

  The proof, block by block:
  - **`T−v`:** `(1+x)G^m = Σ_j C(m,j)x^j(1+x)^{8j+1}(1+2x)^{8(m−j)}` has gap `2j+5`, and the tail `x(1+2x)^{8m}` has gap `2`. Every block strictly
    descends from `p*` to `p*+1`, and the multipliers are nonnegative.
  - **`T−c`:** `(1+2x)G_cG^{m−1} = Σ_k C(m−1,k)[E0_k + E1_{k+1}]`. The blocks `E1` (gap `2j+7`) and `E0_k` for `k ≥ 1` (gap `2k+5`) descend. `E0_0` plus
    the tail regroups as `(1+x)^3(1+2x)^{8m−1} + x(1+x)(1+2x)^{8m−1}`, with gaps 3 and 3.

  **Compiled scratch** (no grade; not an award):
  - File: `scratchpad/c2-crit-F2-U/lean/LeanProject/LeanProof/CritFav.lean`, SHA-256 `1cf34606…65d0`.
  - Theorems: `E993Transport.CritF2U.armLeaf_favorable_topRank` and `…privateLeaf_favorable_topRank`. Each is stated as a coefficient inequality on the
    closed-form polynomial over `ℤ[X]`, with only `m % 3 = 2` as hypothesis.
  - Build: Lean v4.32.2 and the pinned Mathlib `905b9581…`, bound by manual symlink.
  - The carried `Main.lean` is byte-identical to C1-LA3's (`c0605e12…3011`, as in its `RECEIPTS/kernel-verification.json`).
  - It is sorry-free. `#print axioms` gives `[propext, Classical.choice, Quot.sound]` for both theorems. There is no `native_decide`, `decide` or enumeration.

  **Scope and grade.**
  - As a statement, this is the **restriction** of the r30 favorability key to `d = 8`, `m ≡ 2 (mod 3)` (`8m ≡ 1 (mod 3)`, so `⌊(2dm+4)/3⌋ = p*`). It is
    not a new theorem: it is a **Darroch/Newton-free proof** of that restriction.
  - That makes it a Tier 3 dependency reduction on the gate line `FAV_darroch_free`, not Tier 2 progress.
  - Proposed grade: `proved_informal`. It is STATED at a review stage, so it needs an isolated second read. Its weakest input is the closed-form node,
    which is `proved_informal`.
  - The link from the closed-form polynomials to the graph's independent-set counts (a formal `I(CB−leaf)` identity over `cbGraph`) is the remaining
    formal step. That is U-seat work.
  - The Lean statements carry no lower bound on `m`. Only the class is claimed (fence 1).
  - T1 and T2 may hold the same argument; I have not read their returns.
- **Fences.**
  1. One rank and the class only: F2 respects this, apart from the out-of-class remark about `m = 101` (A3), which I have struck as a remark.
  2. Fidelity: F2 respects this (A8).
  3. Darroch/Newton: neither is used, by F2 or by me.
  4. Template vs network: not applicable.
  5. Explicit `M_0`: there are no asymptotics anywhere, and the `S_5` certificate starts exactly at `t = 35`.
  6. No refuted mechanism is revived.
  7. Census discipline: F2 grades its sweeps `bounded_computation`. Its one universal inference drawn from a search is struck (A2).
  8. No sealed root was edited, by F2 or by me.
  9. Attribution: F2's is complete.

## Certification audit

- **"Exactly one real root in (32,33)"**: backed (my Sturm count). **"0 further real roots in (35, 10^12]"**: backed, but it is the wrong statement to
  certify, because it leaves `(33, 35]` and `(10^{12}, ∞)` open. My count on `(33, ∞)` is zero.
- **"Leading-coefficient sign guarantees positivity for every larger `t`"**: **struck** as reasoning (A2).
- **"Smallest all-positive shift `s = 33`"**: backed for `N_total` (F2) and for `N_5` (me). **"Shift 32 fails"**: backed; the constant term is negative.
- **"Third method… stronger form of independence"**: **narrowed** to an independent implementation of the same identity (A1).
- **"Degree 90" / "D_master degree 86"**: backed, and reconciled exactly (§3 of my re-derivation).
- **"`τ < 0` for every integer `m ≥ 1`… no class restriction"**: **narrowed** to `m ≡ 2 (mod 3)` (A4).
- **"`S_4 < 0` for exactly t = 35..44"**: backed. **"Positive from t = 45 onward"**: F2 backed it only as bounded; it is now universal on my certificate
  (A5).
- **"All 17 checks pass", "all assertions passed", the §15 digests**: backed by my replay (byte-identical outputs).
- **F2-R3 "computer_assisted… only at tested rows"**: under-graded and superseded (A6).
- **"The paired block… not two-binomial, needs a separate argument"**: **superseded** (A6).
- **§8 row values**: backed, and extended to the fresh rows on the literal tree (A7).
- **Gate lines of the return** (`FAV_darroch_free: advanced`): backed only as a pointer, because F2 proved nothing universal there. The advance on that
  line is the critic-derived statement above.
- The return uses no "formally verified" literal. Its "exact" literals are all backed.

## Verdict

verdict: retained_narrowed
headline_resolved: no

ELIG_formal: not_advanced
HALL_formal: not_advanced
FAV_darroch_free: advanced
cut_candidate: none

**Retained, narrowed.** F2's numerical findings on the `S_5` certificate reproduce exactly, from my own construction that matches SR-4's digests: the single
root at `t* ≈ 32.1485`, the all-positive shift from `t = 33`, the `S_4` window `m = 107..134`, the tail sign, and the row values. Three things are
narrowed:
- the independence claim;
- the struck finite-roots inference;
- the tail-sign scope.

F2-R3 is superseded by the critic-derived statement that every leaf is favorable at `p*`, Darroch/Newton-free, on the whole class. That statement is
compiled in scratch and graded `proved_informal` pending an isolated second read. Nothing in the return bears on (HALL). There is no cut. SR-4's key
stays `computer_assisted`.

## Remaining obligation

- **Eligibility, (ELIG-top)(a):**
  - The fixed degree-50 `S_5` certificate is still the only non-structural input.
  - A formal target for U1 is the exact identity `S_5/R = N_5/D_5` for `t ≥ 4`, plus the positivity of the 51 shifted coefficients at `t = 35`. Shift 33
    also works, but 35 matches the class hypothesis.
  - `N_5` is pinned by the digest `893a21b6…51f7` (json list, low to high, primitive, positive leading coefficient).
  - No route yet removes the fixed certificate.
- **Favorability:** the critic-derived statement needs:
  - an isolated second read;
  - the formal link from the closed-form polynomials to `C5LA1.indepSetCount` of `cbGraph m` minus a leaf (U3's vertex-split recursion).

  With both in hand, `F_{p*} = leafSet` would stand on the class without Darroch or Newton.
- **(HALL), full scope:** OPEN. (L-S)_top remains formally verified at template level, and the composition remains `proved_informal`. This route touches
  neither.
- The `S_4` shift-45 certificate is recorded at `computer_assisted` as a finding only. It is not needed for Tier 1.

## Artifact inventory

All my scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-F2-U/`. Each script is
deterministic: a rerun reproduced every `_out.json` byte for byte.

| File | SHA-256 | Role |
|---|---|---|
| `crit_lib.py` | `e75639d6d2e6245b4666e1ea5cec35cfbc494bf8aa82a8f9eb791bc6ffd5d16f` | own polynomial, Taylor-shift and Sturm library |
| `crit_cert.py` | `907d875d474bdb05d2cb0ff5b3db63ce22d472d7b1616acdce6ff37d5f77abce` | `N_4`, `N_5` over natural `D_J`; direct-evaluator identity check; shifts; Sturm |
| `crit_cert_out.json` | `79d36f78d6645119e1445ceac857586d76ac7c2c6b78ed4124087ea21b55baa6` | its output |
| `N5.json` / `D5.json` | `c8c8aed8…2fc2bb` / `8c0fdec8…519324` | `N_5`, `D_5` (Fraction strings, low to high) |
| `N4.json` / `D4.json` | `91a8a95a…a6bf2` / `cb8c6146…3b927` | `N_4`, `D_4` |
| `crit_reconcile.py` | `f2f48f3312db1ba5da805c7da3b7780ea2f83ee2f99ff31f9673a99f43a75e67` | `N_total = N_5·Π(8t+7+k)`, exact |
| `crit_reconcile_out.json` | `f1427d646207ed28ced675f9f68ae477759203273ef8ae0481aa53218f21b291` | its output |
| `crit_rows.py` | `9202b06caf8b8cc0e2ae2ff0419f5f2075a23582157c364e7cd40c0706ff2035` | literal-tree DP rows 107, 110, 113, 116, 119, 137 |
| `crit_rows_out.json` | `c61e9ab88255b0884561f3a806e76b1ac54cbf471401dc5bf14520643dd06ec3` | its output |
| `crit_fav.py` | `265f416e3b78fab1fd580ae89dd6bd717d3cee06e335f13a1faae09826715bcd` | symbolic gap identities, side conditions, regrouping |
| `crit_fav_out.json` | `ec70b556fc0556681ebf4625ac83fd6ec9d152625a096e440c83ec0c85c2109c` | its output |
| `lean/LeanProject/LeanProof/CritFav.lean` | `1cf346061b7ecd6083612e33b2c5d3792b7202302a1afc6d9e2e39d2fe6765d0` | compiled scratch: arm-leaf and private-leaf favorability at `p*` |
| `lean/critfav-axioms.txt` | `b4bf0d1187838605ec3c5a0b6f8d404e7a5bd4aa9fcafec7c2fea244918f23a5` | `#print axioms` output |
| `replay/` | outputs identical to F2's §15 digests | copy-out-first replay of F2's four scripts |

**Lean project.**
- `lean/LeanProject/` is a copy of C1-LA3's `LeanProject`.
- `.lake/packages` is a manual symlink to `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages`. Its package revs are
  identical to the C1-LA3 manifest.
- I ran `lake build` and `lake env lean` only from inside the project, and never ran `lake update` or `lake clean`.

**Replay commands.**
- Python: `cd <scratch> && python3 -B crit_cert.py && python3 -B crit_rows.py && python3 -B crit_fav.py && python3 -B crit_reconcile.py`.
- Lean: `cd <scratch>/lean/LeanProject && lake env lean LeanProof/CritFav.lean`.

**Read-boundary disclosures.**
1. The harness injected the project `CLAUDE.md`, the user memory index and the user email into my context without a fetch. I did not use them, and I did
   no conversation logging.
2. I read these files under `sources/`, which is authorized:
   - SR-4's `SECOND-READ.md`, verified against its digest first;
   - C1-LA3's `THEOREM-CONTRACT.yaml`, `FORMALIZATION-STATE.json`, `EVIDENCE/axioms.txt`, `RECEIPTS/kernel-verification.json` (digest grep) and
     `LeanProject/`;
   - `sources/c1-results/SOURCE-DIGESTS.json`;
   - the C1-close registry snapshot.
3. I ran non-recursive `ls` inside `sources/` and on F2's granted `scratchpad/c2-F2/` inventory directory, and one `grep -rl` rooted at `sources/`. All
   of these are within the grant.
4. I listed and read the manifest of the shared Lean root `/Users/ashtonsperry/.local/share/verityos/lean/` (an allowed external root per
   `PATH-CHECK-F2.json`) in order to bind packages.
5. **Path-hygiene slip.** One shell command redirected a digest line into `/tmp/dummy`, which is outside my scratch. The content was the SHA-256 of my
   own `crit_cert_out.json`. I deleted the file at once, and nothing else was written outside scratch and this file.
6. I ran no background job. Every command ran in the foreground, and no process of mine is running at the final write.
