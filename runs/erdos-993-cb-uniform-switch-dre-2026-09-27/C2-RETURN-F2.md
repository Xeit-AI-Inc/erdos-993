# Return — Route F2, Cycle 2, r31 (Erdős #993: a parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank)

Route ID: `C2-F-02`. Mechanism token: `ELIG-AND-CERTIFICATE-RANGE-ADVERSARY`. Orientation: F (falsify).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading EXACTLY
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and nothing else in
VerityOS. Subsystems loaded: the constitution and the startup protocol only. I did not follow the startup protocol's own
task-type map into memory, conversations, modules, skills, logs or decisions, per the dispatch and the worker common brief
(the controller has booted for the run). The harness placed the project `CLAUDE.md` and the user's auto-memory index into my
context without a fetch on my part; I used neither, and I performed no conversation logging. This route wrote only its
scratch directories and this file.

**IMPORT LIST** (standard library only, every script in this return): `math`, `json`, `sys`, `fractions.Fraction`, `hashlib`.
No network. No package installs. `python3 -B` throughout.

**Model disclosure (two-part):** chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported
model id: claude-sonnet-5.

## 1. Seal and digest verification

- **Stage 2 packet manifest** `control/C2-STAGE2-PACKET-MANIFEST.json`: recomputed SHA-256 of the canonical JSON of the
  manifest without `seal_sha256` (`sort_keys=True`, `separators=(",", ":")`, no trailing newline, `ensure_ascii` default):
  **`ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`**. This equals the recorded `seal_sha256` and the value
  in my dispatch (SHA-256 `f8d363a4788402e9fec3215148be07d6a46c9d76cf2c4f9aa9fc7a83c76613b0` of the dispatch file itself,
  also verified with `shasum -a 256` before reading it). **Seal: MATCH.**
- **Dispatch file** `control/dispatch/c2-stage3/DISPATCH-F2.md`: verified by `shasum -a 256` against the digest given in my
  instructions before reading it. **MATCH.**
- **`sources/c1-results/second-reads/SR-4/SECOND-READ.md`** (the isolated second read this route's load-bearing obligation
  attacks): verified against `sources/c1-results/SOURCE-DIGESTS.json` entry
  `sha256 = 112164b81ea03b3f8a40f2c79010940229dc40a55c57b17cf31460f4f7f39bf1`, `bytes = 46450`, before reading. **MATCH.**
- `control/C2-WORKER-COMMON-BRIEF.md`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C2-ALLOCATION.md`,
  `control/C2-STAGE1-GATE.md`, `cycles/cycle-2/stage2/ROUTE-STATE.md` were read as named by the dispatch and the common
  brief (the manifest and allocation are the sealed capsule and its route table; these smaller control files are read
  directly, as the dispatch instructs, not re-verified against a separate per-file digest list beyond the manifest's own
  seal, which covers the packet as a whole).
- I did **not** read the raw per-seat critique instruments `C-T3-F`, `C-T3-U`, `C-F3-T`, `C-F3-U` under
  `sources/c1-stage7-sources/` (40 seats, 924 files) that SR-4 cites for its own concordance check. My load-bearing
  obligation names a **third, independent** method for re-deriving the S_5 certificate; I built that from the closed forms
  and SR-4's prose statement of the construction (never its code), and cross-checked it against my own from-scratch direct
  big-integer computation (§3 below), not against those seats' files. This is a **read-boundary disclosure by omission**,
  named for the record: SR-4's own concordance ("my shifted S_5 numerator is exactly 160× C-T3-F's frozen `N_shifted`") is
  therefore not independently re-checked by me against those specific frozen files; it is checked instead against a
  different, self-contained, from-scratch derivation (§3), which is a stronger form of independence for the purpose this
  route was chartered for (attacking whether S_5 is *right*, not whether two prior seats agree with each other).

## 2. Registered claims touched (named before any computation is reported as evidence)

- `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`
  (SR-4's registered key; grade `computer_assisted`) — this route's primary object of attack/re-derivation.
- `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` (favorability key;
  `proved_informal` modulo Darroch/Newton) — touched by this route's favorability stress test (§5), never re-proved.
- `E993-TREE-REAL-ROOTED` (REFUTED) — cited, not revived; relevant to a finding in §5.
- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` — cited for context only (T3's object, not
  touched by this route's computation).
- Headline objects, both OPEN, untouched: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`,
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`.
- No new `E993-R31-` key is proposed by this route (see §6 for why the findings below are recorded, not registered).

## 3. Side conditions and the gap formula (own instrument, `f2_gap_analysis.py`, `f2_validate_closed_forms.py`)

**Fidelity first.** The three closed forms cited from `SEMANTIC-CONTRACT.md` §2 — `I(CB(d,m))`, `I(CB(d,m)-v)`,
`I(CB(d,m)-c)` — are registered results, used here as inputs, not re-proved as a contribution. I validated them (own
instrument, `f2_validate_closed_forms.py`) three ways before using them: (A) a literal rooted independence-polynomial DP
over an **explicitly built** adjacency-list graph from the SEMANTIC-CONTRACT §2 labelling (own code, no reference to any
other seat's tree builder); (B) brute-force independent-set subset enumeration on the same graph for tiny `(d,m)` —
`(1,1),(2,1),(2,2),(3,1)` — checked against (A); (C) the closed-form polynomials themselves, via explicit binomial-coefficient
convolution. (A) matches (C) exactly (full polynomial, coefficient for coefficient, including `alpha = deg I`) for `d=8`,
`m ∈ {1,2,3,4,5,8,11}`, for all three objects `I`, `I-v`, `I-c`. The tree in (A) is checked to be a tree at every instance
(`n-1` edges and a BFS/DFS visiting all `n` vertices from the root — both conditions checked explicitly in code, not
assumed; see also §7's connectivity/acyclicity table). All 17 checks pass; `python3 -B f2_validate_closed_forms.py` →
`{"all_ok": true, "n_checks": 17}`.

**Side condition `1 <= l_j <= a_j + b_j` for every `0 <= j <= m`.** With `l_j = L - j`, `a_j = 8j`, `b_j = 8(m-j)+1`, so
`a_j + b_j = 8m + 1` for every `j`. Algebraically: `L - j >= L - m = (16m-2)/3 - m = (13m-2)/3 >= 1` for every `m >= 1`
(hypothesis enters here: only `m >= 1` is needed, not the class restriction), and `L - j <= L = (16m-2)/3 <= 8m+1`
`<=>` `16m - 2 <= 24m + 3`, true for every `m >= 0`. **Both bounds hold for every `m >= 1` and every `0 <= j <= m`, with
slack**, confirmed both symbolically and by direct evaluation at `j ∈ {0,1,2,⌊m/2⌋,m-1,m}` for `m ∈ {8,11,14,107,110,113,3002}`
(`f2_gap_analysis.py`, `side_condition` block). No off-by-one at either endpoint. SR-4's claim here is confirmed; the
side condition is in fact far from tight (it fails only outside `m >= 1` entirely, never inside the class).

**Gap formula.** For a two-binomial block `r(k) = [y^k](1+y)^a(1+2y)^b`, `gap(a,b,t) := 6t - (3a+4b)`; the tool (G)'s closing
step gives strict descent (`r(t+1) < r(t)`) whenever `gap >= 2`, its mirror step gives strict ascent whenever `gap <= -6`,
and `gap ∈ (-6,2)` is a blind spot needing a direct certificate. For `P_j = (1+x)^{8j}(1+2x)^{8(m-j)+1}` at `t = L-j`:
`gap(P_j) = 2j - 8` (re-derived independently from the defining recurrence, matching SR-4's own key). I confirmed this
**both** symbolically and by **direct big-integer coefficient computation** (not the tool, not a certificate — the actual
signed difference `a_j(L-j) - a_j(L-j+1)`, computed via `[x^l](1+x)^a(1+2x)^b = Σ_i C(a,i) C(b,l-i) 2^{l-i}`, own instrument,
`coeff_binom_product`) at `m ∈ {8,11,14,107,110,113,3002}`, `j = 0..9`: **ascends exactly at `j ∈ {0,1,2}`, descends at every
`j >= 3`**, matching SR-4b's stated pattern exactly, at every tested row including `m = 3002` (`t≈1000`, far outside any
previously reported row). `python3 -B f2_gap_analysis.py` → `{"n_class_rows": 7, "all_assertions_passed": true}`.

**Tail sign, by a clean elementary argument (no computation needed).** `τ = 2^{L-2}C(8m,L-2) - 2^L C(8m,L)`. Write
`τ / [2^{L-2}C(8m,L-2)] = 1 - 4·C(8m,L)/C(8m,L-2) = 1 - 4·(8m-L+2)(8m-L+1)/[L(L-1)]`. With `8m - L = (8m+2)/3` (from
`L=(16m-2)/3`), `8m-L+2 = (8m+8)/3`, `8m-L+1=(8m+5)/3`. So `τ<0 ⟺ 4(8m+8)(8m+5) > (16m-2)(16m-5)` (both sides ×9). Expanding:
LHS `= 256m² + 416m + 160`, RHS `= 256m² - 112m + 10`; LHS − RHS `= 528m + 150 > 0` for every `m > 0`. **`τ < 0` for every
integer `m >= 1`**, no computation, no class restriction, no `M_0` — strictly stronger than needed and Darroch/Newton-free.
Confirmed numerically at every tested row (`tail_sign_proof_check`, all `tau_negative: true`).

## 4. Third-method re-derivation of the S_5 certificate (own instrument, `f2_certificate_thirdmethod.py`)

**Method.** SR-4's own construction expresses each term of `S_5 = Σ_{j=0}^{5} C(m,j) g_j + τ` as a ratio to a reference
`R := C(B,L)·2^L` (`B = 8m+1 = 24t+17`, `L = 16t+10`, `m = 3t+2`) via a single combined shift of both the upper and lower
binomial index. This route's obligation is a **third** method, by **direct symbolic expansion, not interpolation**. I
derived, from the elementary binomial-coefficient identities `C(N,K-q)/C(N,K) = (K)_q/(N-K+1)_q` and
`C(N-p,K)/C(N,K) = (N-K)_p/(N)_p` (falling factorials, re-derived here from the factorial definitions, not quoted from any
source), a **sequential two-step** decomposition of `C(B-p,l-i)/C(B,L)` (first shift `K=L` to `K'=l-i` at fixed `N=B`; then
shift `N=B` down to `B-p` at fixed `K'`), giving, with `q := L-l+i`, `M := B-L = 8t+7`:

```
[x^l](1+x)^p(1+2x)^{B-p} / R  =  Σ_{i=0}^{p} C(p,i)·2^{-q}·ratio_L(q)·(M+q)_p/(B)_p
  ratio_L(q) = (L)_q / (M+q)_q          if q >= 0
  ratio_L(q) = (M)_{-q} / (L-q)_{-q}    if q <  0   (the only q<0 case in this run: j=0, i=0, one occurrence)
```

Every falling factorial here has **bounded length** (`p <= 40`, `|q| <= 45` for `j = 0..5`), which is what makes the whole
thing a fixed-degree polynomial in `t` at all — this boundedness, not any feature special to SR-4's formula, is the actual
reason a shift certificate is possible. I built all of `g_0,...,g_5` and `τ` this way (own polynomial-arithmetic code,
`fractions.Fraction`-coefficient polynomials, `f2_lib.py`), summed over one explicit **master common denominator**
`D_master(t)` (all `B, B-1, ..., B-39`, all `M+1, ..., M+45`, and `L+1` — 86 linear factors, degree 86; **not** claimed
minimal — SR-4's single combined shift gives the smaller degree-46 denominator they report; this two-step route is simpler
to verify by hand at the cost of a larger denominator). The resulting numerator `N_total(t)` has **degree 90**, with
`sign(S_5(t)) = sign(N_total(t))` for every `t >= 1` (D_master is a product of manifestly positive affine factors there).

**Guards (used only to check the symbolic construction, never as the derivation).** Exact-value match of
`N_total(t)/D_master(t)` against `S_5(t)/R(t)` computed completely independently — direct big-integer summation via
`coeff_binom_product`, no falling factorials, no reference ratio — at `t ∈ {4,10,20,35,40,55}`: **all 6 exact matches**
(`Fraction` equality, not floating point). Sign-only match (exact integers, both sides) at 22 further `t` values from 25 up
to 1000: **all match**. (An earlier hand-verification draft of mine used the WRONG falling-factorial anchor point
[`(M+1)_q` instead of the correct `(M+q)_q`] and disagreed with ground truth at `q >= 2`; this was caught precisely by
these guards before anything was reported, fixed, and re-verified — recorded here as the adversarial process working as
intended, not as a finding about SR-4's key.)

**Results, from `N_total(t)` (degree 90) via my own from-scratch Sturm-sequence implementation (`f2_lib.sturm_sequence`,
with primitive-integer normalization at each Euclidean step — the standard fix for coefficient blow-up in the naive
algorithm over ℚ, needed here to make the degree-90 sequence terminate in seconds rather than hang):**

| Check | Result |
|---|---|
| Sturm-counted distinct real roots in `(35, 10^6]` | **0** |
| Sturm-counted distinct real roots in `(10^6, 10^12]` | **0** |
| Sturm-counted distinct real roots in `(28, 32]` | **0** |
| Sturm-counted distinct real roots in `(32, 33]` | **1** |
| Leading coefficient of `N_total` | positive (degree 90) |
| `N_total(32)` sign | `-` |
| `N_total(33)` sign | `+` |
| Bisected root (100 iterations, exact `Fraction` bracket) | `t* ∈ (32.148492986193666\ldots)`, bracket width `< 2^{-97}` |
| Smallest integer shift `s` with **every** coefficient of `N_total(s+u)` `> 0` | **`s = 33`** (checked `s=28..39`; `s=32` fails — `N_total(32)<0` so the constant term alone is negative) |

This **confirms SR-4's report exactly**: negative at `t=28..32`, one real root strictly between 32 and 33 (at
`t* ≈ 32.1485`), positive from `t=33` on with no further real root found up to `10^{12}` (and leading-coefficient sign
guarantees positivity for every larger `t`, since a degree-90 polynomial has only finitely many real roots and none are
found beyond `32.1485` in a search six orders of magnitude past the class endpoint). **New, sharper fact found here**:
the all-coefficients-positive Taylor-shift certificate — the actual form of proof SR-4 ships — already holds at shift
`t=33`, **two less** than the `t=35` (`= m=107`, the class floor) SR-4 uses. `m=107` remains the correct, contract-fixed
floor for the Tier-1 family (fixed by the class definition and by other inputs, not by this one lemma alone), but **the
S_5 certificate by itself does not need the class floor to make its own positivity argument work**: it would already
certify positivity from `m=101` (`t=33`, and `101 ≡ 2 (mod 3)`) if nothing else required `m >= 107`. This is a genuine
sharpening opportunity for a successor, not a defect (§6).

`python3 -B f2_certificate_thirdmethod.py` → `{"D_master_degree": 86, "N_total_degree": 90, "N_total_int_all_positive":
false, "sturm_roots_in_35_to_1e6": 0, "sturm_roots_in_1e6_to_1e12": 0, "sturm_roots_in_32_33": 1,
"smallest_all_positive_integer_shift_found": 33, "shift_35_all_positive": true, "shift_34_all_positive": true,
"shift_33_all_positive": true, "all_exact_guards_ok": true, "all_sign_guards_ok": true}` (`N_total_int_all_positive: false`
refers to the *unshifted* polynomial's raw coefficients, which is expected and immaterial — only the *shifted* coefficient
list needs to be all-positive, and it is, from `s=33`).

## 5. Pooling: why `j<=4` fails and `j<=5` works — the exact deficit (own instrument, ground-truth sweep)

`S_4 := Σ_{j=0}^{4} C(m,j) g_j + τ` and `S_5 = S_4 + C(m,5) g_5`. Direct big-integer evaluation (own instrument, no
certificate, exact) gives:

| `t` | `m` | `S_4` sign |
|---|---|---|
| 35..44 | 107..134 | `-` (10 consecutive rows) |
| **45** | **137** | **`+` (first positive row)** |
| 46..54 | 140..164 | `+` |
| 100, 500, 3002 | 302, 1502, 9008 | `+` |

**The deficit is exact and narrow**: `S_4(t) < 0` for `t = 35..44` **only** (ten rows, `m = 107` to `134`), and `S_4(t) > 0`
from `t=45` (`m=137`) onward through every value checked up to `m=9008`. Pooling `j<=5` is therefore not "generically"
necessary — the un-pooled `j<=4` sum would already certify positivity for `m >= 137` on its own; it is needed **only** to
bridge the ten-row gap `m ∈ {107,110,...,134}` at the start of the class, which `C(m,5) g_5 > 0` (`g_5>0` for every
`j>=5` by the tool (G), gap `2j-8=2>0` at `j=5`) supplies in every case checked. `m=137` is F1's named "one larger row";
this sharpens why it was a natural test point.

## 6. Favorability stress test: which blocks ascend at `p*` for `T-v` and `T-c`, and by how much (own instrument)

Applying the same gap tool to the block families of `I(CB(8,m)-v)` and `I(CB(8,m)-c)` (closed forms cited from
`SEMANTIC-CONTRACT.md` §2, re-derived independently by hand from the rooted DP in §3 and confirmed to match exactly for
`d=8`, `m=1..11`):

- **`T-v`.** Blocks `Q_j := (1+x)^{8j+1}(1+2x)^{8(m-j)}` (prefactor `x^j`), target index `t=p*-j`:
  `gap(Q_j) = 2j+5 >= 5` for **every** `j >= 0`. Tail `x(1+2x)^{8m}` (`a=0,b=8m`, `t=p*-1`): `gap = 2` exactly (the boundary
  of the tool's closing step, still `>=2`). **Every block of `T-v`, including the tail, descends via tool (G) alone** — no
  ascending block, no blind spot, no fixed certificate of any kind needed. Confirmed by direct coefficient computation
  (not just the gap formula) at `m ∈ {8,11,14,107,110,113,3002}`, `j=0..6`. This is a **materially easier task than the
  `P_j` family's own three blind-spot blocks (`j=2,3,4`)** that SR-4/T1's route must handle for `I(CB(8,m))` itself: T1's
  `C2-T-01` obligation for the arm leaf appears, on this evidence, resolvable **entirely Darroch/Newton-free with zero
  fixed certificates**, stronger than what the route's own brief anticipated ("an EXPLICIT treatment of the finitely many
  blocks where (G)'s gap condition fails").
- **`T-c`.** Two block families from `(1+2x)G_c G^{m-1}`: `E1_j := (1+x)^{8j-1}(1+2x)^{8(m-j)+1}` (`j=1..m`, prefactor
  `x^j`): `gap(E1_j) = 2j+7 >= 9`, always descends. `E0_j` (`j=0..m-1`, same shape as `Q_j`): `gap = 2j+5`, descends for
  `j>=1` (`>=7`). The `j=0` term of `E0` and the tail `x(1+x)^2(1+2x)^{8m-1}` are **not** independently two-binomial
  (`gap(tail alone, a=2,b=8m-1) = 0`, the exact center of the blind spot) — but I found, and checked as an **exact
  polynomial identity for `m` up to 107** (`f2_validate_closed_forms.py`, `paired-block-identity` check), that
  `E0_0 + tail = (1+x)(1+2x)^{8m-1}(1+3x+x^2)` **exactly**, matching T2's route description of "the paired block" precisely
  (this identity is a genuine, checkable confirmation that T2's own planned decomposition is the correct one, done here
  independently before T2's own return was read — this route reads no sibling return). **Every other block of `T-c`
  descends via tool (G) alone; only this one paired block needs a separate argument.**
- **The paired block is, in fact, real-rooted** (worth recording precisely, since it clarifies *why* a direct argument is
  needed rather than implying the fence is at risk): `1+3x+x^2` has discriminant `9-4=5>0`, roots `(-3±√5)/2`, both real and
  negative. So `(1+x)(1+2x)^{8m-1}(1+3x+x^2)` **is** a real-rooted polynomial with nonnegative coefficients (product of
  three real-rooted factors), and Newton/Darroch would **not** violate SOLUTION-CONTRACT fence 3 if applied to it. The
  reason T2's route still wants "a direct integer argument... not the two-binomial form" is **T1/T2's own stated goal of a
  Darroch/Newton-*free* proof** (route brief: "WITHOUT Darroch and WITHOUT Newton"), not a fence requirement — the
  quadratic's irrational roots make establishing its real-rootedness itself an extra (avoidable) step, and Darroch's mode
  bound would need to be re-derived for a factor outside the `(1+x)^a(1+2x)^b` family in any case. `E993-TREE-REAL-ROOTED`
  stays REFUTED (that key is about `I(CB)`/`G`/`G^m`/forest polynomials in general, never about this one bounded factor;
  nothing here revives it).

## 7. Connectivity/acyclicity certificate (own instrument, `f2_final_rows.py`)

For every tree instance used above (`d=8`, `m ∈ {8,11,95,107,110,113}`): `edges = n-1` **and** a from-scratch BFS visits
all `n` vertices from the root (independent of the DP's own internal traversal) — both checked explicitly in code, not
assumed, which together certify a connected, acyclic graph (a tree). All pass:
`{"connected": true, "is_tree": true}` at every row (`f2_final_rows_out.json`, `tree_checks`).

## 8. Row table: `x` and `Δ_k`, difference index on every row

`Δ_k := i_{k+1}(T) - i_k(T)` (contract convention: `Δ_k < 0` is a descent at `k`). `L := p*-2`; `(ELIG-top)(a)` is
`Δ_L(T) < 0`. `x` is `C5LA1.crossingIndex`, computed here through `α` by direct closed-form coefficient sweep (own
instrument, not the bounded-record shortcut):

| `m` | `n` | `α` | `x` | `p*` | `L=p*-2` | `Δ_L` | `x+2<=p*` | `3p*<2α+1` |
|---|---|---|---|---|---|---|---|---|
| 95 | 1618 | 856 | 506 | 508 | 506 | `< 0` | yes | yes |
| 107 | 1822 | 964 | 570 | 572 | 570 | `< 0` | yes | yes |
| 110 | 1873 | 991 | 586 | 588 | 586 | `< 0` | yes | yes |
| 113 | 1924 | 1018 | 602 | 604 | 602 | `< 0` | yes | yes |

Every value matches the SEMANTIC-CONTRACT §5 fixed points (`CB(8,107)/572`, `CB(8,95)/508`) and SR-4's fresh-row values
(`m=110,113`) exactly, reproduced here by an independent, from-scratch full-coefficient sweep through `α` (not a shortcut),
before anything in this return was reported as evidence.

## 9. Findings, recorded (no new `E993-R31-` key; see alias check below)

```text
RECORD: F2-R1
CLAIM: The S_5(t) pooled certificate (SR-4c/S5, m=3t+2) has exactly one real root in (32,33), at t* ≈ 32.148492986193666,
bracketed exactly to width < 2^-97 by bisection on F2's own degree-90 numerator polynomial N_total(t) (sign(S_5)=sign(N_total)
for t>=1); Sturm-counted 0 further real roots in (35, 10^12]. The all-coefficients-positive Taylor-shift certificate F2 built
already holds from the integer shift t=33 (checked t=28..39; fails only at t<=32, consistent with N_total(32)<0), two less
than the t=35 (m=107) shift SR-4 uses (which is fixed by the class floor, not by this lemma alone).
STATUS: bounded_computation
PROVENANCE: route F2 (Claude Sonnet 5; r31 Cycle 2), own third-method symbolic construction independent of SR-4's code,
cross-checked exactly against an independent direct big-integer computation at 6 points and by sign at 22 more.
```

```text
RECORD: F2-R2
CLAIM: S_4(t) := S_5(t) - C(m,5)g_5(t) is negative for exactly t=35..44 (m=107..134, ten rows) and positive for every
t=45..54 (m=137..164) and at the spot-checked larger rows t=100,500,3002 (m=302,1502,9008); the j<=5 pool is therefore load-
bearing only to bridge this ten-row initial gap, not "generically" (j<=4 alone would already certify the tail of the class).
STATUS: bounded_computation
PROVENANCE: route F2, direct big-integer evaluation (own instrument), no certificate/interpolation involved.
```

```text
RECORD: F2-R3
CLAIM: Every block of I(CB(8,m)-v)'s closed form (T1's object) descends at p* via the two-binomial tool (G) alone, with no
ascending block and no blind-spot block (gap(Q_j)=2j+5>=5 for all j>=0; tail gap=2 exactly). For I(CB(8,m)-c) (T2's object),
every block descends via tool (G) alone except the single paired block E0_0+tail = (1+x)(1+2x)^{8m-1}(1+3x+x^2) (an exact
polynomial identity, checked for m up to 107), which is real-rooted (1+3x+x^2 has real negative roots (-3+-sqrt5)/2) but is
not of the two-binomial form.
STATUS: computer_assisted (the identity is exact/hand-checkable; the gap-formula-implied signs are confirmed only at the
tested rows m in {8,11,14,107,110,113,3002}, not proved for the whole class here -- that remains T1/T2's obligation)
PROVENANCE: route F2, own derivation and own instrument (f2_gap_analysis.py, f2_validate_closed_forms.py).
```

**Alias check (lexical and mathematical), before recording.** Lexical: loaded `control/CLAIM-IDENTITY.run-local.json`
(497 claims) and scanned every `claim_key`, `aliases`, and `alias_patterns` string for the tokens `SHIFT`, `ROOT`,
`MINIMAL`, `THRESHOLD`, `SIGN-CHANGE`, `S5`, `S-5`, `REAL-ROOT`, `EXACT-ROOT`, `CERTIFICATE-SHIFT`, `POOL`. Hits on `ROOT`
are all about a tree's root **vertex** or forest **real-rootedness** (`E993-TREE-REAL-ROOTED` and 19 others, all
graph/polynomial-real-rootedness senses, none about a specific certificate polynomial's numeric root location); the one
`S-5` hit is `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-...`
(the sector allocation LP, an unrelated object — not the coefficient-difference `S_5`); no hits on `SHIFT`, `SIGN-CHANGE`,
`EXACT-ROOT`, `CERTIFICATE-SHIFT`, `POOL`. Mathematical: F2-R1/R2/R3 are statements about the numeric behaviour of specific
polynomials this route itself constructs (`N_total`, `S_4`, the block families of `T-v`/`T-c`) — no existing key states or
implies any of them; none is a registrable theorem-level claim in its own right (each is a bounded/computer_assisted
observation attached to SR-4's or the favorability key's existing scope), so **no new `E993-R31-` key is proposed**; these
three are recorded as bounded findings only, exactly as SR-4 recorded its own R1–R3.

## 10. Grades (never upgraded by use)

- SR-4's key (re-confirmed, not re-proved): `computer_assisted`, unchanged.
- F2-R1 (root location, smallest shift): `bounded_computation`.
- F2-R2 (S_4 threshold): `bounded_computation`.
- F2-R3 (favorability block census for `T-v`/`T-c`): `computer_assisted` (identity hand-checkable; gap-implied signs
  confirmed only at tested rows, not proved for the whole class).
- The tail-sign elementary proof (§3) needs no grade beyond ordinary hand-checkable algebra (no computation, no class
  restriction) — it is a clean sub-argument, not a registrable claim.
- Composition rule applied throughout (SOLUTION-CONTRACT §4): nothing here is claimed above `computer_assisted`/
  `bounded_computation`; `E993-TREE-REAL-ROOTED` stays REFUTED and is not revived (fence 6).

## 11. Fences (SOLUTION-CONTRACT §3)

1. One rank (`p*`), the class only (`m>=107`, `m≡2 mod 3`); the favorability stress test names `T-v`/`T-c` at `p*` only.
2. Fidelity: closed forms validated three ways (§3) before use; `x` computed through `α` (§8); no network instrument here
   (this route is a coefficient/certificate route, not a HALL-flow route — fence 2's independent-sides requirement is
   F1/F3's object).
3. Darroch/Newton hygiene: none used anywhere in this return; the tool (G) rests on an exact 3-term recurrence and an
   elementary log-concavity induction, reproduced independently in §3's citations of SR-4b's own proof, never on `I(CB)`,
   `G`, `G^m`, or any forest polynomial.
4. No asymptotics claimed; every statement is either exact algebra (τ<0, side condition) or a stated, checked finite/
   bounded range (Sturm bounds to `10^{12}`, sweeps to `m=9008`).
5. Template vs. network: not applicable (no sector-allocation template used by this route).
6. Refuted mechanisms stay refuted: `E993-TREE-REAL-ROOTED` not revived (§6).
7. Census discipline: every sweep (`m` up to 9008, `t` up to `10^{12}`) is `bounded_computation`/a guard, never evidence of
   a universal statement on its own.
8. No sealed member edited; only this file and this route's own scratch directories were written.
9. Attribution: see below.

## 12. Gate lines (ruling 14)

`ELIG_formal: not_advanced`
`HALL_formal: not_advanced`
`FAV_darroch_free: advanced`
`cut_candidate: none`

`headline_resolved: no`

**Route verdict: `bounded_evidence`.**

## Remaining obligation

(Written as what a successor inherits.)

- **U1** (formal `(ELIG-top)(a)`): should formalize SR-4/C-T3-F's own **degree-50, single-combined-shift** certificate at
  shift `t=35` — **not** this route's degree-90, two-step-shift `N_total`, which exists only as an independent verification
  device and was never intended to be the Lean target (it is larger, uses a different intermediate structure, and adds no
  mathematical content beyond confirming the existing certificate). U1 may cite F2-R1 as extra confidence that the
  shift-35 all-positive-coefficients certificate is correct and not merely "barely" true (the real root is at `t≈32.15`,
  giving the shift-35 certificate a full 2.85-unit margin, not a knife-edge).
- **T1** (`C2-T-01`, arm-leaf favorability): F2-R3 suggests `T-v`'s task may be **fully resolvable via tool (G) alone**,
  with no fixed certificates at all — T1 should check this directly against its own route rather than assume the parent
  problem's blind-spot structure (`j=2,3,4`) recurs; if T1 confirms, T1's proof simplifies materially and should say so on
  its own face (this route's finding is not itself a proof for the whole class — only tested at 7 rows).
- **T2** (`C2-T-02`, private-leaf favorability): F2-R3 confirms T2's own planned "paired block" decomposition
  (`E0_0` + tail `= (1+x)(1+2x)^{8m-1}(1+3x+x^2)`) is exactly correct, as a checked polynomial identity, and that this is
  the **only** block in `T-c`'s family needing a non-tool argument; T2 should still supply the identity's own proof on its
  face (elementary algebra, reproduced independently here but not registered by this falsify-oriented route) and the
  direct integer argument for the quadratic factor (which, per §6, may exploit its real-rootedness if that proves
  convenient, without reviving `E993-TREE-REAL-ROOTED`, which is about different objects).
- **A successor cycle** could consider whether recording F2-R2 (the exact `S_4` threshold at `m=137`) motivates a
  two-piece proof (`j<=4` for `m>=137`, `j<=5` pooled only for `m=107..134`) as an alternative to a single uniform `j<=5`
  pool — not attempted here (out of this route's scope, and the current uniform pool already works for the whole class).
- No deficient cut was found anywhere in this route's scope; nothing here narrows or threatens the Tier 1 target.

## 14. Read-boundary disclosures

1. The harness placed the project `CLAUDE.md` and the user's auto-memory index into context without a fetch; neither was
   used, and no conversation logging occurred (as required by the dispatch and worker brief for a run seat).
2. This route ran `ls` (non-recursive) on `sources/c1-results/` and two of its subdirectories to locate `SR-4`'s file —
   entirely within the granted `sources/` subtree, not above it, so not itself a boundary violation, but named here for
   completeness since another second read in this run treated a comparable listing as disclosure-worthy.
3. Did not read the raw `C-T3-F`/`C-T3-U`/`C-F3-T`/`C-F3-U` critique instruments under `sources/c1-stage7-sources/`
   (already noted in §1) — a deliberate scope choice, not an oversight, given the "third independent method" charge.
4. **Process discipline note.** An early draft of `f2_gap_analysis.py` (before the coefficient-extraction optimization
   described in §3) was launched in the foreground, exceeded the tool's 120-second window, and was moved to a background
   task automatically by the harness. It was killed immediately by its **literal PID** (`kill -9 9238`, confirmed dead
   before continuing) rather than left running or awaited; no process listing was run to find it (the PID was read
   directly from the harness's own background-task report). The script was then rewritten to compute only the needed
   coefficients (bounded-length convolutions) instead of full polynomials of degree `~8m`, and every subsequent run
   (including the full copy-out-first replay in §15) completed in the foreground, well inside the time budget. No
   background job is running now.

## 15. Artifact inventory and replay

All scratch under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-F2/`;
replayed once, copy-out-first, under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-F2-replay/` (exit 0,
every script's own internal assertions passed — see §16 for the exact commands). No wall-clock, PID or host field is
included in any hashed output.

| File | SHA-256 | Role |
|---|---|---|
| `f2_lib.py` | `e590b5629155da9ff414af35c2f1a5ec11b8f40031e054a9f1d90d7d671c57d4` | shared polynomial/Fraction/Sturm utilities (own code) |
| `f2_validate_closed_forms.py` | `5b6b4f5037474e7e60444b39f6263336f2452862b552030b21ca01cd8c3b5aa3` | literal tree DP, brute force, closed forms, paired-block identity |
| `f2_validate_closed_forms_out.json` | `3944a537f661545ec16af848827bd71adb9273f8364ecad6544617b2f83272a4` | its output (17/17 checks pass) |
| `f2_gap_analysis.py` | `56124bdb25c244bfa32cce74d0dced56532547ffeedeceaf6d24522bb91df10c` | gap formula, side condition, tail sign, T-v/T-c favorability census |
| `f2_gap_analysis_out.json` | `63fd7f3d69f822a03eaf0237b11f8844fdab59b914d90d4d8e6e5ad571b1bf2f` | its output |
| `f2_certificate_thirdmethod.py` | `eb9f2d4627dd8c4c145789e6ac146b87880d362c1eee4372b8bdab4ec0cf78cb` | the third-method S_5 re-derivation, Sturm root census, shift search |
| `f2_certificate_thirdmethod_out.json` | `a0a6189dd07b784c6d41399d6f0589208945e8d4620a7d3bed65c10670e6d812` | its output |
| `f2_final_rows.py` | `33400dae12e478d80fc4b24f83eb2192cf0b3f37ee43f0abd73c2761e499e568` | x/Δ_L row table, connectivity/acyclicity certificate |
| `f2_final_rows_out.json` | `06e412a63fa01637438aae2d8e9e40ac972a8525e1724f4d0ba4ce4507e1ee94` | its output |

## 16. Replay (copy-out-first; the target is a fresh scratch folder, never `/tmp`)

```
S=/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-F2
R=/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-F2-replay
rm -rf "$R" && mkdir -p "$R" && cp "$S"/*.py "$R"/ && cd "$R"
python3 -B f2_validate_closed_forms.py
python3 -B f2_gap_analysis.py
python3 -B f2_certificate_thirdmethod.py
python3 -B f2_final_rows.py
```

Already run once as part of this return (§1/§15); exit 0, all internal assertions passed, no background job left running.

## 17. Attribution (fence 9)

The mechanism, weight, relation and (HALL): Codex GPT-6's lower-region run. The CB family, the network, the closed forms,
the criterion/threshold/favorability keys, and the two-binomial descent tool (G): r30 (named seats, as registered) and
r31 Cycle 1 (T3's block identity; C-U3-T's tool; the r31 Cycle 1 synthesis's composition). The S_5 certificate of record and
its registration: isolated second read SR-4 (Claude Opus 5.5; r31 Cycle 1). Everything new in this return (the third-method
symbolic construction, its Sturm-based root census, the exact `S_4` threshold, the `T-v`/`T-c` block census, the tail-sign
elementary proof, the paired-block identity's independent confirmation): route F2, Claude Sonnet 5, r31 Cycle 2.
