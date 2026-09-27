# Second Read

Read `SR-C5-4`, r30 Cycle 5, run `erdos-993-math-dre-20260926-r30-weighted-transport`. Date 2026-09-27. Registration only;
**non-decisive for ruling 39.**

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full, and no other VerityOS file. The host injected the project
`CLAUDE.md` and a memory index into my context. I did not open either file or act on it. I made no conversation log, because the
protocol limits my writes to this file and my scratch.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Protocol `control/C5-SECOND-READ-PROTOCOL.md` | `78bc4897…c7c` (capsule) | same | match; read first |
| Brief `control/C5-SECOND-READ-BRIEF-SR-C5-4.md` | `6dc56f8d5ea2a5505b6f9abdfa79171c45df7f15e818c704455dde0f65a67834` (dispatch) | same (`shasum -a 256`), checked before I followed it | **match** |
| Capsule `control/c5-second-read/SR-C5-4-PACKET-MANIFEST.json` inner seal (canonical JSON minus `seal_sha256`, `sort_keys`, `(",",":")`, no trailing newline) | `e3d414ce3e40be246650278fac5ff3910a83af898b0b60f0b8da6ac0cb96ebf0` | same | **match** |
| Capsule members (bytes and SHA-256) | 137 listed | 137 recomputed | **137/137 match** |
| `sources/c5-stage7-sources/` members against that directory's `SOURCE-DIGESTS.json` | 107 capsule members | 107 recomputed before any was read | **107/107 match**, 0 missing |

**Read boundary.** I read only capsule members, the two boot files, and my own scratch and output. Deviations and notes:
1. I ran one non-recursive `ls` of `second-reads/` to create my output folder. It printed folder names only. I opened nothing in it.
2. The harness saved two long tool outputs (the brief plus manifest, and four registry entries printed from the capsule snapshot)
   to its own tool-results files under `~/.claude/projects/…`. I read those files back. They contain only capsule text.
3. I did not open `cycles/cycle-4/CYCLE-CLOSE.md`, `control/C5-ALLOCATION.md`, `control/C5-STAGE1-GATE.md`,
   `control/C5-STAGE6-PACKET-MANIFEST.json`, `control/snapshots/OBLIGATIONS.c5-stage2.csv` or `control/SOURCE-DIGESTS.json`
   (digest-checked only). From the other members I read the sections relevant to SR-C5-4.
4. I opened no Mathlib or Lean source and ran no `lake`/`lean`, no network, no installs and no background jobs. Every run used
   `python3 -B` in the foreground under `timeout`. I killed nothing. There is no `__pycache__` in my scratch.

## Statements read

Statement of record: `cycles/cycle-5/stage6/SYNTHESIS.md` (`## Exact established results` items 6, 8, 12, 13;
`## Progress and stop-gate ruling` → SR-C5-4; `## Registrations` new key 6 and the E1 and CBstar scope notes). Origins:
C-T1-U A4/A5 and Claim 1 proof; C-T1-F Claim 1 proof and F-4; T1 `RETURN.md` Claims 1 and 3; ADJ-T Established 3–4,
reconciliation items 1–2, and next-route allocation.

- **SR-C5-4a (the rank-threshold lemma).** For `d ≥ 6`, `m ≥ 1`, `μ_1 = (4dm − d + 1)/6`, on `CB(d,m)`, condition (i) of the E1 key in
  cleared form holds for every `q ∈ [1, m]` at every `p ≥ ⌈μ_1⌉ + 2`. It fails at `q = 1` at every `2 ≤ p ≤ ⌊μ_1⌋ + 1`. The rank
  `⌈μ_1⌉ + 1` (`μ_1 ∉ ℤ`) is undecided. Grade: `proved_informal` modulo Darroch (1964).
- **SR-C5-4b (consequences as records).** (i) The first-rank failure frontier on `CB(8,m)` and `CB(7,m)`. (ii) The E1 band and its
  width, and for `d = 8` the identity with the top sector-deficient rank when `m ≢ 1 (mod 3)`, plus the family `𝒞_8`.
- **SR-C5-4c.** `α(CB(d,m)) = 1 + m(d+1)`, `m ≥ 1`, with two proofs (C-T1-U clique cover; C-T1-F edge-plus-star partition).
- **SR-C5-4d (the key and its name).** `E993-R30-CB-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`.

Definitions used: `SEMANTIC-CONTRACT.md` §1 (the CB family, `w_F`, (REL), eligibility `x + 2 ≤ p ≤ ⌊2α/3⌋`, `x` through rank `α`).
The E1 key's registered text in the frozen run-local snapshot fixes the cleared form: `r_q(k) = [y^k](1+y)^{qd−1}(1+2y)^{d(m−q)+1}`,
`r_q(k) = 0` for `k < 0`, `j = p − q` in the integers, and condition (i) `r_q(j) ≤ r_q(j − 1)`. Its CD-2 scope note says condition (ii)
holds identically. The CBstar key at `t = 1` fixes the sector-deficiency criterion `3p < 2dm + 5`.

## Independent re-derivation

**Own instrument** (`scratchpad/c5-sr-SR-C5-4/`, standard library and exact integers only; it imports no seat, critic, adjudicator or
controller code):
- `sr4_core.py`: a literal CB tree with an `IsTree` test (edge count plus connectivity), a generic rooted independence DP, a
  brute-force enumerator, my closed forms, and `x` through rank `α`.
- `r_q` coefficients come from a holonomic recurrence that I derived from `(1+y)(1+2y)f′ = (a(1+2y) + 2b(1+y))f`:
  `(k+1)c_{k+1} = (a + 2b − 3k)c_k + (2a + 2b − 2k + 2)c_{k−1}`, with exact division asserted. This uses neither Darroch nor any
  mode theory, and it equals direct convolution on all 625 pairs `a, b ≤ 24`.

**Closed forms (mine, by conditioning on `r`).**
- `I_T = y(1+y)(1+2y)^{dm} + (1+2y)g^m`, with `g = y(1+y)^d + (1+2y)^d`.
- `I_{T−v} = y(1+2y)^{dm} + (1+y)g^m`.
- `I_{T−c} = y(1+y)^2(1+2y)^{dm−1} + (1+2y)g^{m−1}g_c`, with `g_c = y(1+y)^{d−1} + (1+y)(1+2y)^{d−1}`.

When `r` is in the set, `s` and every choke are excluded, `v` is free, and each support–leaf edge contributes `1 + 2y`. When `r` is
out, the arm contributes `1 + 2y`, and each choke contributes `y(1+y)^d` (in) or `(1+2y)^d` (out).

The three closed forms match the generic DP on all 16 trees with `d, m ≤ 4`, and brute force on the 11 of them with `n ≤ 21`. They
also match the generic DP on 135 larger trees with `n ≤ 400` (`T1-VALIDATE.json`).

### 4a — the lemma, step by step

Write `a = qd − 1 ≥ 0` (`q, d ≥ 1`) and `b = d(m − q) + 1 ≥ 1` (`q ≤ m`). The degree is `a + b = dm`, and every coefficient on `0..dm` is
positive.

1. **Real-rooted, Poisson-binomial.** `r_q` has roots `−1` and `−1/2` only. `r_q(y)/r_q(1) = ((1+y)/2)^a((1+2y)/3)^b` is the
   generating function of a sum of `a` Bernoulli(1/2) and `b` Bernoulli(2/3) variables, with mean
   `μ_q = a/2 + 2b/3 = (qd−1)/2 + 2(d(m−q)+1)/3`. At `q = 1` this is `(3d − 3 + 4dm − 4d + 4)/6 = (4dm − d + 1)/6 = μ_1`. **Checked.**
2. **Log-concavity and the first-mode criterion.** Real roots give log-concavity (Newton's inequalities, classical), and there are no
   internal zeros. Let `M_q` be the first mode.
   - For `k ≤ M_q`, the ratios `r(k)/r(k−1)` are nonincreasing and exceed 1 at `k = M_q`, so they exceed 1 throughout.
   - After `M_q` the ratios are at most 1.

   Hence, **for integers `j ≥ 0`**, `r_q(j) ≤ r_q(j−1) ⇔ j − 1 ≥ M_q`. Strict log-concavity is not needed; weak log-concavity
   without internal zeros suffices. For `j < 0` both sides vanish and the inequality holds, so the "iff" is false there. The lemma
   never uses such `j`: see the ℕ guards below. **Checked with a precision repair.**
3. **Darroch (1964).** Every mode of a Poisson-binomial law lies in `{⌊μ⌋, ⌈μ⌉}`, so `⌊μ_q⌋ ≤ M_q ≤ ⌈μ_q⌉`. This is J. N. Darroch, "On
   the distribution of the number of successes in independent trials", *Ann. Math. Statist.* 35 (1964). It is classical, not under
   `sources/`, and undischarged. My exact data agree on all 460 `(d, m)` rows, every `q` (`darroch_mode_failures: []`). That is data,
   not proof.
4. **Monotonicity.** `μ_q + q = (3qd − 3 + 4dm − 4dq + 4 + 6q)/6 = (4dm + 1 + q(6 − d))/6`, which is nonincreasing in `q` exactly when
   `d ≥ 6`. Since `q ∈ ℤ`, `⌈μ_q⌉ + q = ⌈μ_q + q⌉ ≤ ⌈μ_1 + 1⌉ = ⌈μ_1⌉ + 1`. **Checked.** This is the only place `d ≥ 6` enters.
5. **Hold half.** Take `p ≥ ⌈μ_1⌉ + 2` and any `q`. Then `j − 1 = p − q − 1 ≥ ⌈μ_q⌉ ≥ M_q`, so `r_q(j) ≤ r_q(j−1)`. **Checked.**
6. **Failure half.** Take `q = 1` and `2 ≤ p ≤ ⌊μ_1⌋ + 1`. Then `j = p − 1 ≥ 1` and `j − 1 = p − 2 ≤ ⌊μ_1⌋ − 1 < ⌊μ_1⌋ ≤ M_1`, so
   `r_1(p−1) > r_1(p−2)`. **Checked.** This half uses neither step 4 nor `d ≥ 6`, so it holds for every `d ≥ 1`. I confirmed that
   exactly on 200 rows, `d ≤ 5`, `m ≤ 40`, with 0 violations (`T2B-LOWD.json`).

**ℕ guards.**
- `j = p − q` is an integer rank throughout.
- Hold half: `μ_q > 0` gives `⌈μ_q⌉ ≥ 1`, so `p ≥ q + 2`, `j ≥ 2` and `j − 1 ≥ 1`. No truncated subtraction can pass falsely.
- Failure half: `p ≥ 2` gives `j − 1 ≥ 0`.
- `a_q ≥ 0` needs `q, d ≥ 1`, and `b_q ≥ 1` needs `q ≤ m`.
- The threshold `⌈μ_1⌉ + 2 ≥ m + 1` for `d ≥ 6`, which is consistent with the E1 key's "forces `p ≥ m + 1`".

**`d ≥ 6` is necessary for the hold half.** At `p = ⌈μ_1⌉ + 2` the exact criterion fails at:
- `CB(1,3)/4` (`q = 2, 3`);
- `CB(2,3)/6` (`q = 2, 3`);
- `CB(3,3)/8` (`q = 3`);
- `CB(4,5)/15` (`q = 3, 4, 5`);
- `CB(5,5)/18` (`q = 4, 5`).

These come from `T2B-LOWD.json` and bear on the key name (4d).

**Numeric check (brief's requirement).** For `d = 6..10`, `m ≤ 60` (plus `d = 11..14`, `m ≤ 40`; 460 `(d,m)` rows), I computed exact
`r_q` for every `q` and classified every rank `p ∈ [0, dm + m + 3]`. The lemma agrees with exact arithmetic wherever it decides:
**0 disagreements** (`T2-LEMMA-CHECK.json`). Log-concavity and the first-mode criterion for `j ≥ 0` hold on every row, as data.
- **Gap rank.** Of the 460 rows, 46 have `μ_1 ∈ ℤ` (no gap). At the other 414 the gap rank **holds at 200 and fails at 214**, so the
  gap is genuine and cannot be closed by the lemma's inputs.
  - `d = 6`: the gap holds at every sampled `m`.
  - `d = 9`: it fails at every sampled `m`.
  - `d = 7, 8, 10, 11, 13, 14`: it alternates.
- **Named rows** (`T3-ROWS.json`, exact all-`q`, no Darroch). All agree with the lemma, and every gap outcome is recorded:

| Row | Lemma | Exact failing `q` |
|---|---|---|
| `CB(8,86)/459` | gap | {1} |
| `CB(8,86)/460` | holds | ∅ |
| `CB(8,92)/491` | gap | {1} |
| `CB(8,92)/492` | holds | ∅ |
| `CB(7,144)/672` | fails (`μ_1 = 671 ∈ ℤ`) | {1..4} |
| `CB(7,144)/673` | holds | ∅ |
| `CB(8,161)/858` | fails | {1..4} |
| `CB(8,161)/859` | gap | {1} |
| `CB(8,161)/860` | holds | ∅ |
| `CB(8,242)/1290` | fails | {1..4} |
| `CB(8,242)/1291` | gap | {1} |
| `CB(8,242)/1292` | holds | ∅ |
| `CB(8,160)/854` | gap | **∅ (holds)** |
| `CB(8,200)/1067` | gap | {1} |
| `CB(7,217)/1013` | gap | {1,2} |
| `CB(9,186)/1116` | gap | {1} |
| `CB(10,106)/707` | gap | ∅ (holds) |
| `CB(6,100)/401` | gap | ∅ (holds) |
| `CB(12,50)/400` | gap | ∅ (holds) |

This reproduces C-T1-U's statements (`CB(8,161)/859` fails exactly in the gap; `CB(8,86)/460`, `CB(8,92)/492` and `CB(7,144)/673` sit
at the threshold and hold). It also agrees with ADJ-T's `out_adj_t1_e1allq.txt` and C-T1-U's `E1-EXACT-ALLQ.json` on every shared row.

**Elementary replacement for Darroch.** I found none. What I tried:
- Log-concavity alone does not locate the mode relative to the mean (log-concave laws can have mean–mode gap at least 1).
- The Bernoulli-sum identities `(k+1)P_{k+1} = Σ_i p_i P(X_{−i} = k)` and `(N−k)P_k = Σ_i (1−p_i)P(X_{−i} = k)` reduce, for the two
  types here, to a comparison of the two leave-one-out laws that still needs a mean–mode argument.

Darroch stays the named dependency, with Newton's inequalities as the named source of log-concavity.

### 4b — consequences (own instrument `t4_frontier.py`, `t5_band.py`, `t6_top_all_residues.py`)

On `CB(8,m)` and `CB(7,m)`, `m ≤ 400`, I computed, from the closed forms:
- `x` through `α`, the eligible window, and the first eligible rank `p_1 = x + 2`;
- sector deficiency `3p < 2dm + 5`, and favorability of `v` and of a private leaf `c` at the rank on the original tree, by
  `Δ_p(T − v) < 0` and `Δ_p(T − c) < 0` (all `c` are equivalent under `Aut`);
- exact all-`q` condition (i).

(i) **First-rank frontier.**
- `d = 8`:
  - 292 switch-necessary first ranks with `m ≤ 400`: eligible, deficient, and `v, c ∈ F_{p_1}`, so `F_{p_1} = leafSet`.
  - Condition (i) holds exactly at 78 of them; the last is `m = 211`.
  - It fails at 214. The first failure is `CB(8,161)/859`, at `q = 1` only, at the gap rank.
  - Every switch-necessary first rank with `212 ≤ m ≤ 400` fails.
  - Restricted to `m ≤ 300` this is 192/114/78, equal to ADJ-T. The `m ≤ 400` counts equal C-T1-F's 214/292.
- `d = 7`: 257 rows. Condition (i) holds at 109 (last `m = 287`) and fails at 148 (first `m = 217`). This equals C-T1-F (148/257) and,
  for `m ≤ 330`, ADJ-T (187/78).
- No lemma disagreement occurred at any first rank. No sector-deficient first rank had a non-favorable leaf.
- **Repair.** "E1 at every eligible rank is FALSE for large `m`" is **not proved**. A proof would need an upper bound
  `x(CB(d,m)) ≤ ⌊μ_1⌋ − 1`, and no party has one; C-T1-U A3 and ADJ-T both say the "`x` ≈ mean" step is unproved. C-T1-F's asymptotic
  argument is a STATED sketch. The row is a `bounded_computation` record on the stated range only, and the "large `m`" wording goes.

(ii) **The band.**
- **Proved from 4a and the CBstar key at `t = 1`.** At every rank of `B(d,m) := [⌈μ_1⌉ + 2, ⌊(2dm+4)/3⌋]`, both condition (i) (every
  `q`) and sector-deletion deficiency hold. At every `2 ≤ p ≤ ⌊μ_1⌋ + 1`, condition (i) fails.
- **Repair.** C-T1-U's wording "E1 and sector deficiency hold together **only when** `p ∈ B(d,m)`" is false. The gap rank can carry
  both: `CB(8,160)/854` is eligible, sector-deficient, all-leaves-favorable, and satisfies condition (i) exactly, yet `854 < 855` is
  the threshold. The exact statement is `B(d,m) ⊆ {E1(i) ∧ deficient} ⊆ B(d,m) ∪ {⌈μ_1⌉ + 1}`.
- **Consequence for ADJ-T.** Its "rows below the band … need a non-E1 non-sector certificate" is too strong at gap ranks.
  - For `d = 8`, `m ≤ 400`: 26 of the 79 gap-rank first ranks satisfy condition (i) exactly (`m = 136, 139, …, 211`).
  - For `d = 7`: 36 of 72.
- **Width** (repair of "about `(d − 3)/6`").
  - Exact width: `|B(d,m)| = max(0, ⌊(2dm+4)/3⌋ − ⌈μ_1⌉ − 1)`.
  - Bounds: `⌈(d−8)/6⌉ ≤ |B| ≤ ⌊(d+1)/6⌋` whenever the width is nonnegative, since `⌊z⌋ ≥ z − 2/3` for `z ∈ ℤ/3` and `⌈w⌉ ≤ w + 5/6`
    for `w ∈ ℤ/6`.
  - Exact minima, maxima and means over `m ≤ 600` for `d = 6..24` are in `T5-BAND.json`. For example, `d = 8` has min 0, max 1,
    mean 2/3; `d = 12` has 1, 1, 1.
  - "About `(d − 3)/6`" is a loose average and is replaced by the exact formula.
- **Residue arithmetic** (proved by hand; asserted for every `m ≤ 400` in `t4_frontier.py`).
  - `d = 8`, `μ_1 = (32m − 7)/6`, which is never an integer.
    - `m = 3t`: `⌈μ_1⌉ = 16t − 1`, and `B = {16t + 1} = {⌊(16m+4)/3⌋}`.
    - `m = 3t + 2`: `⌈μ_1⌉ = 16t + 10`, and `B = {16t + 12} = {⌊(16m+4)/3⌋}`.
    - `m = 3t + 1`: `⌈μ_1⌉ = 16t + 5`, so `B = ∅`, and **the top deficient rank `⌊(16m+4)/3⌋ = 16t + 6` is exactly the undecided rank
      `⌈μ_1⌉ + 1`**.
  - `d = 7`, `μ_1 = (14m − 3)/3`: `B = {⌊(14m+4)/3⌋}` for `m ≢ 2 (mod 3)`. When `m ≡ 2` the band is empty and the top deficient rank is
    the undecided rank.
  - `d = 6`: `B = ∅` for every `m`, since `⌈μ_1⌉ = 4m` and the top deficient rank `4m + 1` is the undecided rank.
  - ADJ-T's observation (the band is the top sector-deficient rank for `d = 8`, `m ≢ 1`) is **confirmed**.
- **`𝒞_8`** (ADJ-T; STATED; `bounded_computation`). I extended it to `m ≤ 400`.
  - For every `m ∈ [106, 400]`, `m ≢ 1 (mod 3)`, the rank `p* = ⌊(16m+4)/3⌋` of `CB(8,m)` is eligible and sector-deficient, has
    `v, c ∈ F_{p*}`, and satisfies condition (i) exactly at every `q`.
  - `106` is the least `m_0` from which this holds for every such `m` to 400.
  - The same holds at `m = 86, 89, …, 104` (`≡ 2`), which lie outside the family as stated.
  - The `d = 7` analogue: `m ∈ [142, 400]`, `m ≢ 2`, plus `m = 109, …, 139` (`≡ 1`).
- **New finding (SR-C5-4; `bounded_computation`): the excluded residue class.**
  - `d = 8`, `m ≡ 1 (mod 3)`: condition (i) holds exactly at the top deficient rank (the undecided rank) at **all 134 such
    `m ≤ 400`**. That rank is also eligible and all-leaves-favorable for every `m ≡ 1` in `[136, 400]`.
  - So the top-deficient-rank properties of `𝒞_8` hold at **every** `m ∈ [134, 400]`.
  - `d = 7`, `m ≡ 2`: all 133 such `m ≤ 400` hold; every `m ∈ [180, 400]` qualifies.
  - Darroch does not decide this rank. Proving it would need a sharper mode location, for example first mode of `r_1` equal to
    `⌊μ_1⌋` when the fractional part of `μ_1` is `1/6` (`d = 8`) or `2/3` (`d = 7`).

### 4c — `α(CB(d,m)) = 1 + m(d+1)`

- **C-T1-U, clique cover.** The cover is `{s,v}`, `{r,u_1}`, `{u_i}` for `i ≥ 2`, and the `dm` edges `{b_ij, c_ij}`. It partitions `V`
  (`3 + m + 2dm` vertices) into `1 + 1 + (m−1) + dm = 1 + m(d+1)` cliques, which needs `m ≥ 1`. An independent set meets each clique
  at most once.
- **C-T1-F, edge-plus-star partition.** The parts are `{s,v}`, the `dm` edges, and the star `{r, u_1..u_m}`. An independent set takes
  at most `max(1, m) = m` vertices from the star, since it takes either the centre alone or a set of leaves.
- **Lower bound (both).** `{v} ∪ {u_i} ∪ {c_ij}` is independent: `v ~ s` only, `u_i ~ r, b_ij`, and `c_ij ~ b_ij`.
- **My instrument.**
  - I built both partitions and the independent set literally and asserted every clique and the adjacency (42 trees, `d ≤ 6`,
    `m ≤ 6`).
  - `deg I_T = 1 + m(d+1)` on 720 rows (`d ≤ 12`, `m ≤ 60`). This is a third proof: the degree of `(1+2y)g^m` is `1 + m(d+1)`, which
    is at least `2 + dm`, the degree of the `r`-in term, exactly when `m ≥ 1`.
- **CF-REPLAY-c5a/c5b fixed points.** `n`, `α`, `x` and the window reproduce exactly at all 9 rows: `CB(7,144)`, `CB(8,108)`,
  `CB(8,86)`, `CB(8,89)`, `CB(8,92)`, `CB(7,109)`, `CB(8,95)`, `CB(8,98)`, `CB(9,112)`.
- `m ≥ 1` is necessary: `CB(d,0)` is the path `r–s–v`, with `α = 2 ≠ 1`.
- A useful corollary, proved: `2α + 1 = 2dm + 2m + 3 ≥ 2dm + 5`, so every sector-deficient rank satisfies the upper eligibility bound
  `3p < 2α + 1`. C-T1-F noted this.

### 4d — the key and its name

- **Predicate test (ruling 33).** `E993-R30-CB-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` names no choke-degree
  domain. Read as a predicate it says that on `CB` (any `d`), condition (i) holds at every rank from `⌈μ_1⌉ + 2`. That is **false for
  every `d ≤ 5`** (the five rows under 4a). The name asserts more than the statement, so it is **repaired** to
  `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`. The new name is satisfied by the
  statement, and the failure half is on the face.
- **Alias screen** (`t7_alias.py`). The method mirrors the controller's: exact key, `alias_patterns` regex, alias equality, and token
  overlap `≥ 85%` of the registered key's tokens with at least 4 shared, excluding `E993` and the run tag. I screened both names
  against the frozen 453 run-local snapshot and the frozen 434 master.
  - Result: **no hit** on any test for either name. The top overlaps are all `≤ 0.33`, for example `E993-R28-SDR-THRESHOLD-EQUIVALENCE`
    at 1 of 3 and `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST` at 2 of 6.
  - Against the other Stage 6 proposed names, the repaired name shares 4 of 12 tokens with
    `E993-R30-CB-CHOKE-DEGREE-AT-MOST-SIX-SECTOR-DELETION-SUFFICIENT-AT-EVERY-ELIGIBLE-RANK` (SR-C5-5). That is not a hit.
  - A "CHOKE-DEGREE-AT-LEAST-SIX" variant would share 7 of 12, so I chose "D-AT-LEAST-6".
- **Distinctions.**
  - From the E1 key: WHERE condition (i) holds on `CB(d,m)`, not WHAT it implies.
  - From the heterogeneous E1 key: a uniform pattern with a proved rank domain, not a criterion over every choke set `Q` of a
    heterogeneous pattern.
  - From `E993-R28-SDR-THRESHOLD-EQUIVALENCE`: a lexical neighbour only. That key is a Hall/SDR threshold equivalence on slots and
    leaves; this is a coefficient-inequality rank threshold.
- **Attribution checked against the origins.**
  - C-T1-U (Claude Opus 5.5): the lemma and proof (A5), the clique-cover proof of `α`, the first-rank failures (A4).
  - T adjudicator (Claude Opus 5.5): the name, the step check, the band = top-deficient-rank observation, `𝒞_8`, and the frontier
    replay.
  - C-T1-F (Claude Opus 5.5): the partition proof of `α`, and the finite-window census F-4.
  - T1 (Claude Sonnet 5): the census rectangle and the `α` statement at `bounded_computation`.
  - Darroch (1964) and Newton's inequalities: the classical dependencies.
  - SR-C5-4 (Claude Opus 5.5): the name repair and the exact validation.

## Findings and repairs

1. **(4d, required) The key name overstates.** Without the domain `d ≥ 6`, the predicate is false. Five exact counterexamples at the
   threshold rank: `CB(1,3)/4`, `CB(2,3)/6`, `CB(3,3)/8`, `CB(4,5)/15`, `CB(5,5)/18`. Repaired name:
   `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`. No alias hit. The Stage 6 name
   becomes an alias.
2. **(4a, dependency) Log-concavity is a second classical input.** Step 2's "real-rooted, hence log-concave" is Newton's inequalities.
   Name it beside Darroch on the face. Strictness is unnecessary.
3. **(4a, precision)** "`r_q(j) ≤ r_q(j−1)` iff `j − 1 ≥` first mode" holds for `j ≥ 0` only. The lemma uses only `j ≥ 1`, so the
   statement is unaffected.
4. **(4a, remark)** The failure half holds for every `d ≥ 1`. The hold half genuinely needs `d ≥ 6`.
5. **(4a) No elementary replacement for Darroch was found.** The grade stays `proved_informal` modulo Darroch.
6. **(4b(i)) "For large `m`" is unproved.** It needs an upper bound on `x`. The frontier is a `bounded_computation` record on
   `m ≤ 400`.
7. **(4b(ii)) The band characterization is wrong at the gap rank.** "Only when `p ∈ B`" is false: `CB(8,160)/854` carries both. The
   exact statement is `B ⊆ {E1(i) ∧ deficient} ⊆ B ∪ {⌈μ_1⌉+1}`. ADJ-T's "below the band needs a non-E1 certificate" is too strong at
   gap ranks (26/79 for `d = 8`, 36/72 for `d = 7`, `m ≤ 400`).
8. **(4b(ii)) Width.** "About `(d−3)/6`" is replaced by the exact formula and bounds. For `d = 6` the band is always empty.
9. **(4b, strongest new finding; `bounded_computation`) The excluded residue class also qualifies.** For `d = 8`, `m ≡ 1 (mod 3)`, the
   top deficient rank is the undecided rank. There condition (i) holds exactly at all 134 `m ≤ 400`, and the full top-rank property
   set holds at every `m ∈ [134, 400]`. The same is true for `d = 7` on `m ∈ [180, 400]`. A Cycle 6 top-rank route could therefore aim
   at all residues, if a sharper mode location closes the undecided rank.
10. **(4c) Confirmed as stated**, with a third (degree) proof and the corollary that every sector-deficient rank satisfies the upper
    eligibility bound.

## Registration text

Where a block has several `ALIASES:` lines, each line carries one name.

```text
KEY: E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD
STATUS: VERIFIED
GRADE: proved_informal (modulo Darroch 1964, a classical theorem not under sources/, named here as an undischarged dependency; log-concavity by Newton's inequalities, classical)
STATEMENT: Let d >= 6, m >= 1 and T = CB(d,m) (the path r - s - v, m chokes u_1..u_m adjacent to r, d supports b_{i1..id} adjacent to each u_i, one private leaf c_{ij} adjacent to each b_{ij}). For 1 <= q <= m let r_q(k) := [y^k](1 + y)^{qd − 1}(1 + 2y)^{d(m − q) + 1}, with r_q(k) = 0 for k < 0 or k > dm, and let condition (i) at (d, m, p) be the cleared condition (i) of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL: r_q(p − q) <= r_q(p − q − 1) for every q ∈ [1, m], with p − q computed in the integers. Put μ_1 := (4dm − d + 1)/6. (a) For every integer p >= ⌈μ_1⌉ + 2, condition (i) holds at every q ∈ [1, m]; since condition (ii) of that key holds identically (its CD-2 scope note), the whole criterion of that key holds at these ranks. (b) For every integer p with 2 <= p <= ⌊μ_1⌋ + 1, condition (i) fails at q = 1: r_1(p − 1) > r_1(p − 2). (c) If μ_1 is not an integer, the single rank ⌈μ_1⌉ + 1 is decided by neither (a) nor (b); both outcomes occur (it holds at CB(8,160)/854 and fails at CB(8,161)/859, exact). Proof of record (C-T1-U): (1) r_q = (1 + y)^a(1 + 2y)^b with a = qd − 1 >= 0 and b = d(m − q) + 1 >= 1 has positive coefficients on 0..dm and only the real roots −1 and −1/2; normalized, it is the law of a sum of a Bernoulli(1/2) and b Bernoulli(2/3) variables with mean μ_q = (qd − 1)/2 + 2(d(m − q) + 1)/3 (μ_1 as above). (2) By Newton's inequalities it is log-concave without internal zeros, so with M_q its first mode, for every integer j >= 0: r_q(j) <= r_q(j − 1) iff j − 1 >= M_q. (3) By Darroch's theorem every mode lies in {⌊μ_q⌋, ⌈μ_q⌉}, so ⌊μ_q⌋ <= M_q <= ⌈μ_q⌉. (4) μ_q + q = (4dm + 1 + q(6 − d))/6 is nonincreasing in q for d >= 6, so ⌈μ_q⌉ + q <= ⌈μ_1⌉ + 1. (5) If p >= ⌈μ_1⌉ + 2 then p − q − 1 >= ⌈μ_q⌉ >= M_q for every q, which gives (a). (6) If 2 <= p <= ⌊μ_1⌋ + 1 then p − 1 >= 1 and p − 2 < ⌊μ_1⌋ <= M_1, which gives (b). ℕ guards: in (a), ⌈μ_q⌉ >= 1 gives p >= q + 2, so both ranks p − q and p − q − 1 are positive integers; in (b), p >= 2; a truncated ℕ subtraction is never used.
SCOPE: One tree family CB(d,m) with d >= 6, and one statement about WHERE condition (i) of the E1 key holds; it asserts nothing about what that criterion implies. d >= 6 enters only step (4), and the hold half (a) is false for every d <= 5 (exact, at p = ⌈μ_1⌉ + 2: CB(1,3)/4, CB(2,3)/6, CB(3,3)/8, CB(4,5)/15, CB(5,5)/18); the failure half (b) holds for every d >= 1 by the same proof (recorded here, not part of the key's statement). No eligibility, selector or invariance hypothesis enters. A rank covered by (a) need not be eligible, and the key asserts no eligibility; to use (a) at a (HALL) row one must separately establish x(T) + 2 <= p and derive F_p(T) ⊇ C. The rank ⌈μ_1⌉ + 1 is decided only by exact arithmetic, row by row. Validation (bounded_computation, never proof): exact r_q by an independent holonomic recurrence at every q and every rank p ∈ [0, dm + m + 3] on 460 (d, m) rows (d = 6..10 with m <= 60; d = 11..14 with m <= 40), 0 disagreements with (a) or (b); at the undecided rank 200 hold and 214 fail (46 rows have integer μ_1); exact all-q checks at CB(8,86)/460, CB(8,92)/492 and CB(7,144)/673 (at the threshold; hold), CB(8,161)/859 (in the gap; fails at q = 1 only) and CB(8,242)/1290 (fails at q = 1..4). No elementary replacement for Darroch's theorem was found.
ATTRIBUTION: C-T1-U (Claude Opus 5.5; the lemma and its proof, r30 Cycle 5 critique A5); the r30 Cycle 5 T adjudicator (Claude Opus 5.5; the step-by-step check, exact checks at 8 rows, and the name without the d >= 6 qualifier); C-T1-F (Claude Opus 5.5; the finite-window census F-4); T1 (Claude Sonnet 5; the census rectangle); isolated second read SR-C5-4 (Claude Opus 5.5; the d >= 6 name repair, the Newton dependency, the j >= 0 precision, exact validation); J. N. Darroch, On the distribution of the number of successes in independent trials, Ann. Math. Statist. 35 (1964) (classical dependency); Newton's inequalities (classical); the E1 key's origin and the CB family, the active-tag weight and the transport network: see E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL (Codex GPT-6 Astra/Sol/Luna for the mechanism, the lower-region run and its corrections).
FENCES: Not (HALL) and not a restricted-scope (HALL) theorem; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. Nothing about switch arcs or sector families. Not an alias of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL or of E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL (distinction rows below); no status transfers to either. The primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched, as are E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG and Erdős #993. No RTree or governed-model assertion. No census value enters the proof. No refuted mechanism is revived. A composition with the E1 key takes this key's grade (modulo Darroch) at best.
ALIASES: E993-R30-CB-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD
ALIASES: E993-R30-CB-MARK-CLONE-CONDITION-I-HOLDS-EXACTLY-ABOVE-RANK-THRESHOLD
ALIASES: C-T1-U A5 rank-threshold lemma
```

```text
SCOPE NOTE ON: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: [r30 C5; SR-C5-4] Rank-threshold domain on CB(d,m), d >= 6 (proved_informal modulo Darroch 1964; key E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD). With μ_1 = (4dm − d + 1)/6, this key's criterion (condition (i), condition (ii) being identical by CD-2) holds at every rank p >= ⌈μ_1⌉ + 2 and fails, at q = 1, at every rank 2 <= p <= ⌊μ_1⌋ + 1; the rank ⌈μ_1⌉ + 1 (μ_1 not an integer) is decided only row by row in exact integers, and both outcomes occur. Hence this key's conclusion (the non-sector deletion-arc flow and the Hall inequality for every non-sector family) is available at every rank p >= ⌈μ_1⌉ + 2 of CB(d,m), d >= 6, for every leaf set F ⊇ C, at the grade proved_informal modulo Darroch, and is unavailable through this key at every rank 2 <= p <= ⌊μ_1⌋ + 1 (the key is sufficient, not necessary, so that says nothing about (HALL) there). The threshold statement is false for d <= 5 (CB(1,3)/4, CB(2,3)/6, CB(3,3)/8, CB(4,5)/15, CB(5,5)/18), so no domain note is made for d <= 5. Eligibility of a rank and F_p(T) ⊇ C are separate obligations. This note changes neither this key's statement, grade nor fences. Attribution: C-T1-U (Claude Opus 5.5; the lemma); the r30 Cycle 5 T adjudicator; SR-C5-4 (Claude Opus 5.5).
```

```text
SCOPE NOTE ON: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: [r30 C5; SR-C5-4] Independence number at t = 1 (proved_informal; a companion fact, not a key). For every d >= 1 and m >= 1, α(CB(d,m)) = α(CBstar(d,m,1)) = 1 + m(d + 1). Lower bound: {v} ∪ {u_1..u_m} ∪ {c_ij} is independent. Upper bound, two proofs: (C-T1-U) V is partitioned into the 1 + m(d + 1) cliques {s, v}, {r, u_1}, {u_i} (i >= 2) and the dm edges {b_ij, c_ij}; (C-T1-F) V is partitioned into {s, v}, the dm edges {b_ij, c_ij} and the star {r, u_1..u_m}, from which an independent set takes at most max(1, m) = m vertices. m >= 1 is necessary (CB(d,0) is the path r – s – v, α = 2). Consequence: 2α + 1 = 2dm + 2m + 3 >= 2dm + 5, so every rank with 3p < 2dm + 5 (this key's t = 1 deficiency criterion) satisfies 3p < 2α + 1; only the lower eligibility bound x + 2 <= p remains to be checked at such a rank. Checks (bounded_computation): deg I(CB(d,m)) = 1 + m(d + 1) on 720 rows (d <= 12, m <= 60) from the root-conditioned closed form I = y(1 + y)(1 + 2y)^{dm} + (1 + 2y)(y(1 + y)^d + (1 + 2y)^d)^m, which equals the generic tree DP (135 rows, n <= 400) and brute force (11 rows); both covers verified literally on 42 trees. This note changes neither this key's statement, grade nor fences. Attribution: C-T1-U and C-T1-F (Claude Opus 5.5; the two proofs); T1 (Claude Sonnet 5; the statement at bounded_computation); the r30 Cycle 5 T adjudicator; SR-C5-4 (Claude Opus 5.5).
```

```text
RECORD: R30-C5-CB-CONDITION-I-FIRST-RANK-FAILURE-FRONTIER
CLAIM: On CB(8,m), 1 <= m <= 400, exactly 292 values of m have a switch-necessary first eligible rank p_1 = x + 2 (eligible, 3p_1 < 2dm + 5, and the arm leaf and a private leaf both favorable at p_1 on the original tree, so F_{p_1} = leafSet). The E1 key's criterion (condition (i), exact at every q) holds at p_1 for 78 of them, the last at m = 211, and fails for 214, the first at CB(8,161)/859 (n = 2740, α = 1450, x = 857; failing q = {1} only; 859 is the rank ⌈μ_1⌉ + 1 undecided by the rank-threshold key). It fails at every switch-necessary first rank with 212 <= m <= 400. On CB(7,m), m <= 400: 257 such rows; it holds at 109 (last m = 287) and fails at 148 (first m = 217). The statement that it fails at the first eligible rank for every sufficiently large m is NOT proved: it needs an upper bound x(CB(d,m)) <= ⌊μ_1⌋ − 1, which no party has. C-T1-F's asymptotic argument is a STATED sketch and is not registered. A failure of the criterion is not a cut and says nothing about (HALL).
STATUS: bounded_computation
PROVENANCE: C-T1-F F-4 (m <= 400); C-T1-U A4; T adjudicator replay (d = 8 to m = 300, d = 7 to m = 330: 192/114 and 187/78, equal on the overlap); CF-REPLAY-c5c (third instrument, d = 8, m <= 300); SR-C5-4 own instrument (t4_frontier.py; exact all-q recurrence; m <= 400, both d). Attribution: C-T1-F, C-T1-U, the T adjudicator (Claude Opus 5.5); SR-C5-4 (Claude Opus 5.5).
```

```text
RECORD: R30-C5-CB-CONDITION-I-AND-SECTOR-DEFICIENCY-BAND
CLAIM: For d >= 6, m >= 1, μ_1 = (4dm − d + 1)/6 and B(d,m) := {p : ⌈μ_1⌉ + 2 <= p <= ⌊(2dm + 4)/3⌋}: at every p ∈ B(d,m) both the E1 key's criterion and root-plus-arm sector deletion deficiency (3p < 2dm + 5, E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT at t = 1) hold; the criterion fails at every 2 <= p <= ⌊μ_1⌋ + 1; so the ranks where both hold form a set between B(d,m) and B(d,m) ∪ {⌈μ_1⌉ + 1}, and the extra rank does occur (CB(8,160)/854: eligible, sector-deficient, all leaves favorable, criterion exact, below the threshold 855). |B(d,m)| = max(0, ⌊(2dm + 4)/3⌋ − ⌈μ_1⌉ − 1), between ⌈(d − 8)/6⌉ and ⌊(d + 1)/6⌋. d = 8: B = {⌊(16m + 4)/3⌋}, the top sector-deficient rank, when m ≢ 1 (mod 3), and B is empty when m ≡ 1, where the top sector-deficient rank equals ⌈μ_1⌉ + 1. d = 7: B = {⌊(14m + 4)/3⌋} when m ≢ 2 (mod 3), empty when m ≡ 2 (top rank = ⌈μ_1⌉ + 1). d = 6: B is empty for every m. B(d,m) says nothing about the lower eligibility bound x + 2 <= p, which is census-only. At undecided first ranks the criterion can hold exactly (d = 8: 26 of 79, m <= 400; d = 7: 36 of 72), so a first rank below the threshold does not always need a certificate other than the E1 key.
STATUS: proved_informal (modulo Darroch 1964, through E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD) for the band, width and residue statements; bounded_computation for the named rows and counts
PROVENANCE: C-T1-U A5 (the band); the T adjudicator (the band is the top sector-deficient rank for d = 8, m ≢ 1, and d = 7, m ≢ 2); SR-C5-4 (the gap-rank correction, the exact width and bounds, the d = 6 emptiness, the residue arithmetic asserted to m = 400; t4_frontier.py, t5_band.py). Attribution: C-T1-U, the T adjudicator, SR-C5-4 (Claude Opus 5.5).
```

```text
RECORD: R30-C5-CB8-TOP-SECTOR-DEFICIENT-RANK-FAMILY
CLAIM: 𝒞_8 = {(CB(8,m), p* = ⌊(16m + 4)/3⌋) : m >= 106, m ≢ 1 (mod 3)}. For every m ∈ [106, 400] with m ≢ 1 (mod 3), p* is eligible (x + 2 <= p*, 3p* < 2α + 1), sector-deletion-deficient, has the arm leaf and a private leaf favorable (F_{p*} = leafSet), and satisfies the E1 key's criterion exactly at every q; the criterion there also follows from the rank-threshold key, since p* = ⌈μ_1⌉ + 2. The same holds at m = 86, 89, …, 104 (m ≡ 2), outside the family as stated. The d = 7 analogue holds for m ∈ [142, 400], m ≢ 2 (mod 3), and at m = 109, …, 139 (m ≡ 1). Excluded residue class (SR-C5-4): for d = 8 and every m ≡ 1 (mod 3) with m <= 400 (134 values) the criterion holds exactly at the top sector-deficient rank ⌊(16m + 4)/3⌋ = ⌈μ_1⌉ + 1, and that rank is eligible with all leaves favorable for every such m ∈ [136, 400]; so the top-rank properties hold at every m ∈ [134, 400]; for d = 7, m ≡ 2, the criterion holds at all 133 values m <= 400 and the properties hold at every m ∈ [180, 400]. The excluded-class statement is not proved; Darroch's theorem does not decide that rank.
STATUS: bounded_computation
PROVENANCE: the T adjudicator (STATED; checked to m = 300 for d = 8, 330 for d = 7); CF-REPLAY-c5d (third instrument); SR-C5-4 own instrument to m = 400 (t4_frontier.py, t5_band.py, t6_top_all_residues.py). Attribution: the T adjudicator (Claude Opus 5.5; the family); SR-C5-4 (Claude Opus 5.5; the extension to m = 400 and the excluded residue class).
```

```text
DISTINCTION ROW: R30-C5-CONDITION-I-THRESHOLD-VS-E1
KEY: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: Not an alias. The E1 key is an implication: if its criterion holds at (d, m, p), a non-sector deletion-arc flow exists and (HALL-COND) holds for every non-sector family; it asserts nothing about WHERE the criterion holds. E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD is a statement about the polynomials r_q alone: WHERE condition (i) holds on CB(d,m), d >= 6 (every p >= ⌈μ_1⌉ + 2) and where it fails (2 <= p <= ⌊μ_1⌋ + 1); it contains no flow, weight, selector or Hall content, and its grade carries Darroch's theorem as a dependency the E1 key does not have. Their composition is a scope note on the E1 key, not a new key; no status transfers in either direction.
```

```text
DISTINCTION ROW: R30-C5-CONDITION-I-THRESHOLD-VS-HETEROGENEOUS-E1
KEY: E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: Not an alias. The heterogeneous key is an implication on every heterogeneous CB pattern, with a criterion over every nonempty choke set Q indexed by (q, D_Q). The rank-threshold key concerns only the uniform family CB(d,m), d >= 6, and proves where the uniform criterion holds; it says nothing about any heterogeneous pattern (there μ_Q + q depends on D_Q, and step (4) of its proof does not apply as stated). No status transfers.
```

```text
DISTINCTION ROW: R30-C5-CONDITION-I-THRESHOLD-VS-R28-SDR-THRESHOLD-EQUIVALENCE
KEY: E993-R28-SDR-THRESHOLD-EQUIVALENCE
TEXT: Lexical neighbour only (the shared token THRESHOLD). The r28 key is a formally verified equivalence between an injection of branch slots into leaves and a family of threshold counting inequalities (Hall on nested neighbourhoods); the rank-threshold key is a mode-location statement for the coefficient sequences (1 + y)^{qd − 1}(1 + 2y)^{d(m − q) + 1} on one tree family. No shared object, hypothesis or conclusion; no status transfers.
```

## Verdicts

verdict[SR-C5-4a]: confirmed_with_repairs
verdict[SR-C5-4b]: confirmed_with_repairs
verdict[SR-C5-4c]: confirmed
verdict[SR-C5-4d]: confirmed_with_repairs

**4a: the lemma's mathematics is confirmed.** Repairs:
- Newton's inequalities are named beside Darroch.
- The first-mode "iff" is limited to `j ≥ 0`.
- The failure half is recorded as holding for all `d ≥ 1`.
- No elementary replacement for Darroch was found.
- Grade: `proved_informal` modulo Darroch, on the face.

**4b: confirmed as records, with repairs:**
- "For large `m`" is unproved, so (i) is bounded only.
- "Only when" is replaced by `B ⊆ … ⊆ B ∪ {⌈μ_1⌉+1}`.
- The exact width replaces "about `(d−3)/6`".
- ADJ-T's "below the band needs a non-E1 certificate" is corrected at gap ranks.
- New `bounded_computation` finding: the excluded residue class also qualifies.

**4c:** confirmed, both proofs.

**4d:** the key is confirmed with a **name repair** to
`E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`. The Stage 6 name is not a predicate the
statement satisfies, because it omits `d ≥ 6`. Attribution and alias screen are as above.

This read is non-decisive for ruling 39. It touches neither (HALL) nor the primary aggregate.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Artifact inventory

All scratch files are under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-sr-SR-C5-4/` (SHA-256). Every run
used `python3 -B` in the foreground under `timeout`. There is no `__pycache__`.

**Code:**

| File | SHA-256 | Purpose |
|---|---|---|
| `verify_seal.py` | `3bf4f83174355b993817351253241ac576d2e7c8f3921422cc4d8d57f2ee3e59` | Capsule seal, 137 members, 107 stage-7 source digests |
| `sr4_core.py` | `f03adfd9e75703efad817938f67cd81215d5f371b15393a3977992815b3e2b54` | Literal CB tree, `IsTree`, generic DP, brute force, closed forms, `x` through `α`, `r_q` recurrence, exact condition (i) |
| `t1_validate.py` | `c80a3f13965a6e58cac46d21c75b85b96960b7ca4e51821a60ed8bc60c7fd3e4` | Closed forms vs DP vs brute force; `α` formula; both `α` covers literally; recurrence vs convolution; CF-REPLAY fixed points |
| `t2_lemma.py` | `577cce9221503cbfb76283cbba639a1e6754b9358ee77696e148b261159819dd` | Lemma vs exact at every rank, 460 `(d,m)` rows; gap outcomes; Darroch and first-mode data |
| `t2b_lowd.py` | `33422b7ec79b05fbfc64b6e18acfc3d3f7a017e017cabfc99a7011cba42418e7` | `d ≤ 5`: hold-half counterexamples; failure half |
| `t3_rows.py` | `c14733f1c9123317cd95f17ab44d8de71fc4bbce3062a8c055587f856f5cddce` | Exact all-`q` at the named and gap rows |
| `t4_frontier.py` | `0d6d237ac7f50e57334cd488f987dc9154e1d5462f31d780d358f42106544df7` | `d = 7, 8`, `m ≤ 400`: first-rank frontier, `F_p` derived, band family |
| `t5_band.py` | `4e6ed04f1b1c6e6a1757d8c74bc96a24a22290e743ad3a4ca2f7fea695ec1498` | Exact band widths (`d = 6..24`, `m ≤ 600`); the top rank on the excluded class |
| `t6_top_all_residues.py` | `6be168351d1bbe2de067752aa95bae149992578e2ecc1a2b21bbd8d0b8b0f49e` | Eligibility and favorability at the top rank on the excluded class |
| `t7_alias.py` | `63567ec5a0a2220af0986d6eb4ec2c1beebe4759e72ff90cbb8fc092845ff9db` | Alias screen against 453 + 434 and the Stage 6 names |

**Outputs:**

| File | SHA-256 |
|---|---|
| `T1-VALIDATE.json` | `a8ed86f5a34954097682a8477820c3657442b1eb3acd19337750c6aacf5a452c` |
| `T2-LEMMA-CHECK.json` | `8d9f4f47668e4accddd790454e7f008636cb17d9e3d40216346244b3c7225f97` |
| `T2B-LOWD.json` | `ea0bb8134003b5e7c919b34c2f85823e96b5a0ffa6c457cef9fea1a3b2d3b165` |
| `T3-ROWS.json` | `f8e7352d890832d26684941896e4e4dcade38da1d5613eb4088a6af3fb253b0e` |
| `T4-FRONTIER.json` | `cc20d5de6238d20783993d3566bb9b16596b1d69937ee8384a9c5a91c92dc5d9` |
| `T5-BAND.json` | `b1ae96afd6a87096141536dbf409c406e78aadf8b9d086fcef82460efe3fa66c` |
| `T6-TOP-ALL-RESIDUES.json` | `da45302816963afccd97c1bcfd51c824cb9d80f9412526b88bfa4e5ccd4e9ad3` |
| `T7-ALIAS.json` | `8d23d1ba59db2faeaf2c616540b2e527b4c17123338f1b9b3d3a1e2a6cbbad98` |

**Output of record:** `second-reads/SR-C5-4/SECOND-READ.md` (this file).

**Sealed members:** read only; none was edited. The seat, critic, adjudicator and controller instruments were read as data and were
not executed.
