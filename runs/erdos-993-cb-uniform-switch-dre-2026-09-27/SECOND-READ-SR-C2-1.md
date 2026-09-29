# Second Read

Isolated second read `SR-C2-1`, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`), Cycle 2: favorability of every leaf of
`CB(8,m)` at `p*` without Darroch or Newton (synthesis items X-4, X-5, X-6, X-7 and registration G-3). Written 2026-09-28, about
03:30–03:55 EDT by the clock. Reader: Claude Opus 5.5, chartered effort high.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `verity.md` and `identity/startup-protocol.md` (the constitution
and the startup protocol). Those two files are the only subsystems I loaded. I did not follow the task-type map into memory, logs, skills,
decisions, operations or conversations, because the protocol confines this read to its capsule. The controller owns conversation logging
for this run, and I wrote no conversation log.

## Identity and seal audit

| Object | Recomputed | Status |
|---|---|---|
| Protocol `control/C2-SECOND-READ-PROTOCOL.md` (file SHA-256) | `563877beef7a57b1fd71ef95f518998ec7598fc9f9328e28270f3405e85d9e82` | MATCH (verified before reading) |
| Brief `control/C2-SECOND-READ-BRIEF-SR-C2-1.md` (file SHA-256) | `e60233a01acba24b611c76c216ca4f3509c664567c80da3693917d59783ecf96` | MATCH (verified before reading) |
| **Capsule seal** `control/c2-second-read/SR-C2-1-PACKET-MANIFEST.json`: SHA-256 of compact key-sorted JSON of the manifest minus `seal_sha256`, `(",", ":")`, no trailing newline | **`91dd791c6edc205be52cbc6eb68e029a4a91759ede527085af92a26852cb6b5d`** | MATCH (the same with `ensure_ascii` on or off) |
| Manifest file SHA-256 | `f88f1751f3656ef6afe2c67666c9d257ba91b79bf5206b6a418088a97421d47b` | recorded; not the seal |
| All 448 listed members (SHA-256) | each equals its entry | MATCH ×448, 0 missing, 0 mismatched |
| Capsule members under `sources/c2-stage7-sources/`, against that directory's `SOURCE-DIGESTS.json` | 258 matched | 0 bad |
| Capsule members under `sources/c1-results/`, against its `SOURCE-DIGESTS.json` | 91 matched | 0 bad |
| Capsule members under `sources/`, against `sources/SOURCE-DIGESTS.json` | 65 matched | 0 bad |
| `sources/concurrent/master-494-2026-09-28/CLAIM-IDENTITY.json`, against `sources/concurrent/SOURCE-DIGESTS.json` | 1 matched | 0 bad |
| C1-LA3 `Main.lean` | `c0605e12b91375ede9fb72cb9af428a96d9b6a7d678b856b0131f9c7b10f3011` | equals `FORMALIZATION-STATE.json` and the kernel receipt (`source_sha256_before/after`, verdict `verified`, axioms `propext, Classical.choice, Quot.sound`) |
| C1-LA3 entry 17 (`twoBinom_coeff_strictAnti_of_gap`) and entry 4 (`twoBinomCoeff_recurrence`) | `b39cd787…589c`, `d60b2141…b891` | equal the `FORMALIZATION-STATE.json` entries |

**Read-boundary disclosures.**
1. Before my first tool call, the harness put the project `CLAUDE.md`, the user memory index and the user's e-mail address into my
   context. I did not open or use any of them beyond the two boot files.
2. My first shell call printed a cosmetic zsh `====` error. When I then displayed the brief and the manifest together, the output was too
   large, and the harness saved it to its own tool-output cache outside the run root. I never opened that copy. I read the brief directly
   with the file reader, and I parsed the manifest with Python.
3. **Background job.** One foreground run of my supplementary script (`sr_supp.py`, first version: a polynomial-convolution sweep to
   `m = 3002`) exceeded the 600 s tool limit. The harness moved it to the background automatically (task `bvknetqxp`). As soon as the
   notice appeared, I stopped it by that task ID with the harness's stop tool. I killed nothing by pattern, and I used none of its
   output. I then rewrote the sweep to use binomials only and reran it in the foreground (19 s). No background job is running at the
   final write.
4. I listed only my own scratch directory. I ran no `find`, `rg` or `ls -R`. Every `grep` targeted a single named capsule member.
   I created the directories `scratchpad/c2-sr-SR-C2-1/` and `second-reads/SR-C2-1/`.
5. I used no network, installed nothing, ran no `lake` or `lean`, and started no child agents. Everything ran under Python 3 standard
   library with `python3 -B`, exact integers and `Fraction`.

## Statements read

Contracts: `SOLUTION-CONTRACT.md` (§1 targets, §3 fences, §4 grades) and `SEMANTIC-CONTRACT.md` (§1–§5). Statement of record:
`cycles/cycle-2/stage6/SYNTHESIS.md`, specifically `## Reconciliation` R-1, R-2 and R-6; `## Exact established results` X-4..X-7 and correction 5;
`## Refuted or narrowed mechanisms`; `## Lean awards` C2-LA2/C2-LA3; `## Registrations` G-3; and the SR-C2-1 funding line. Controller facts,
read as facts and never as authority: `control/C2-STAGE6-CONTROLLER-FACTS.json` and `control/C2-STAGE5-CONTROLLER-FACTS-{T,F}.json`.
Origins, read in their favorability sections:
- T1's return (Steps 3–6);
- C-F2-U (A6, the critic-derived advance);
- C-F2-T (the critic-derived statement);
- C-T2-F (the critic-derived advance, steps 1–4);
- C-T2-U (F-4 and the assembly);
- T2's return §5, read only for (G′);
- the T adjudication (T1/T2 rulings, E-1..E-3, Groups A/B).

Tools: C1-LA3 snippets 0001, 0004, 0009, 0014, 0016, 0017 and 0020, its `VERIFICATION-REPORT.md` and its kernel receipt. C-F2-U's
`CritFav.lean` statements and axiom logs (theorem heads only, to confirm the index they carry). Registries:
- the favorability key's full record in all three registries (the run-local snapshot, 497 claims; the frozen master, 491; the concurrent
  master, 494);
- every `E993-R31-` key in the snapshot;
- the Codex key `E993-ZERO-EXTENDED-BINOMIAL-BLOCK-RISE-FALL-STRICT-RISE`;
- the last row of `control/CLAIM-DISTINCTIONS.json`, for the row format.

**The four statements read (the brief's ids):**
- **SR-C2-1a (X-4):** for every class `m`, `i_{p*+1}(CB(8,m) − v) < i_{p*}(CB(8,m) − v)`.
- **SR-C2-1b (X-5, X-6):** the same at every private leaf `c_ij`, with the paired-block lemma and its two closing steps.
- **SR-C2-1c (X-7):** `F_{p*}(CB(8,m)) = leafSet` on the class, Darroch/Newton-free, graded by its weakest input.
- **SR-C2-1d (G-3):** the scope-note text on the r30 favorability key, and the record of T2's tool (G′) as refuted.

Class throughout: `m ≥ 107`, `m ≡ 2 (mod 3)`, `p* = (16m+4)/3`, `3p* = 16m+4`, `n = 17m+3`, `α = 9m+1`. Index of record:
`Δ_p(P) := [x^{p+1}]P − [x^p]P`, favorable iff `< 0`. This is the favorability key's own text (`Δ_k(T − w) := i_{k+1}(T − w) − i_k(T − w)`)
and C1-LA2's `vertexDeletionForwardDifference`. `r_{a,b}(k) := [x^k](1+x)^a(1+2x)^b`.

## Independent re-derivation

Everything below is mine. The instruments are my own. Seat and critic scripts were not run, and the controller's replays and census
tables were not cited.

**0. The tool (G) and its proof.** The tool (G) is C1-LA3 entry 17: for `1 ≤ t ≤ a+b` and `3a+4b+2 ≤ 6t`, `r(t+1) < r(t)`. I re-derived
its mathematics so that I do not rely on the receipt alone.
- The recurrence (R), entry 4, is `(k+1)r(k+1) = (a+2b−3k)r(k) + 2(a+b−k+1)r(k−1)`.
- Log-concavity (LC), entry 16, is proved by factor induction (entry 9, `strongLC_linear_step`: the 2×2-minor inequality is preserved by
  `f ↦ f + c·f(·−1)`, `c ≥ 0`). Neither Newton nor Darroch appears.
- Suppose `r(t+1) ≥ r(t)`. LC with `r(t+1) > 0` gives `r(t−1) ≤ r(t)²/r(t+1) ≤ r(t)`.
- Then (R), with `a+b−t+1 ≥ 1`, gives `(t+1)r(t+1) ≤ (3a+4b+2−5t)r(t) ≤ t·r(t) < (t+1)r(t)`, which contradicts the assumption.

Define **margin** `:= 6t − (3a+4b+2)`. (G) applies exactly when the margin is `≥ 0` and `1 ≤ t ≤ a+b`. An exhaustive check over
`a, b ≤ 30` gives 12,255 hypothesis-satisfying instances and 0 failures (`sr_small_out.json`); this is a sanity check only.

**1. Closed forms, by hand (the r30 node, re-derived).** One pendant path `b–c` contributes `1+2x`, or `1+x` if `b` is excluded. A choke
branch `u + 8` paths contributes `G = (1+2x)^8 + x(1+x)^8` in total, or `(1+2x)^8` with `u` excluded.
- Splitting on `r` gives `I(T) = (1+2x)G^m + x(1+x)(1+2x)^{8m}` and `I(T−v) = (1+x)G^m + x(1+2x)^{8m}`.
- Delete `c_ij`. That leg becomes a single pendant `b`, so branch `i` contributes `G_c = (1+2x)^7(1+x) + x(1+x)^7`, or `(1+2x)^7(1+x)` with
  `u_i` excluded. Hence **`I(T−c_ij) = (1+2x)G_cG^{m−1} + x(1+x)^2(1+2x)^{8m−1}`**.
- The derivation does not depend on `(i, j)`. It is a per-leaf derivation, so no automorphism argument is needed.
- Correction 5 is confirmed and does not affect this: `G − G_c = x·G'` with `G' = (1+2x)^7 + x(1+x)^7`, and `I(CB − {c_ij, b_ij})` uses `G'`.
  The literal tree agrees with `G'`, and not with `G_c`, at `m = 1, 2, 3, 5` (`sr_supp_out.json`).
- Literal-tree DP, using my own iterative forest DP on the labelling of record (`0 = r`, `1 = s`, `2 = v`, `u_i = 3+17i`, `b_ij = u_i+1+2j`,
  `c_ij = u_i+2+2j`):
  - `I`, `I(T−v)` and `I(T−c)` equal the closed forms at `m = 1, 2, 3, 4, 5, 8`, for **every** private leaf;
  - at `m = 107` (`n = 1822`, `α = 964`, 857 leaves) and `m = 110` (`n = 1873`, `α = 991`, 881 leaves), they agree for `I`, `I(T−v)` and three
    private leaves each (first, middle, last);
  - the literal leaf set is exactly `{v} ∪ {c_ij}` at both rows;
  - evidence grade: `bounded_computation`.

**2. SR-C2-1a — arm leaf.** `G^m = Σ_j C(m,j) x^j(1+x)^{8j}(1+2x)^{8(m−j)}`, so
`I(T−v) = Σ_{j=0}^{m} C(m,j)·V_j + R`, with `V_j = x^j(1+x)^{8j+1}(1+2x)^{8(m−j)}` and `R = x(1+2x)^{8m}`. Then
`Δ_{p*}(x^s·r_{a,b}) = r(t+1) − r(t)` with `t = p* − s`. Using `6p* = 32m+8`:

| Block | `(a, b, t)` | `3a+4b+2` | `6t` | margin |
|---|---|---|---|---|
| `V_j`, `0 ≤ j ≤ m` | `(8j+1, 8(m−j), p*−j)` | `32m−8j+5` | `32m+8−6j` | **`2j+3`** |
| `R` | `(0, 8m, p*−1)` | `32m+2` | `32m+2` | **`0`** (equality case, allowed) |

Side conditions:
- For `V_j`, `t = p*−j ≥ p*−m = (13m+4)/3 ≥ 1`, and `t ≤ p* ≤ 8m+1 = a+b` because `16m+4 ≤ 24m+3`.
- For `R`, `1 ≤ p*−1 ≤ 8m`.
- Positivity at both indices: `t+1 ≤ a+b` in every case (`p*−j+1 ≤ 8m+1` and `p* ≤ 8m`), so `r(t) > 0` and `r(t+1) > 0`.
- The weights `C(m,j)` are positive for `0 ≤ j ≤ m`.

Every term is strictly negative, so **`Δ_{p*}(T−v) < 0`**. The sign is `<` at the index `p*` (not `p*−1`), and no block is exceptional.

My instrument at `m = 107, 110` confirms:
- the block sum equals the closed form, and the sum of block differences equals the literal difference;
- every block satisfies its side conditions, has margin exactly `2j+3` (or 0 for `R`), descends, and is positive at both indices;
- `Δ_{p*}(T−v)` is `−11637931475…` (107) and `−35891379270…` (110).

`sr_pi_sweep.py` checks the margin identities symbolically in `j` on 965 class rows `m ∈ [107, 3000]`. The identities are exact algebra
and the sweep only corroborates them.

**3. SR-C2-1b — private leaves.** First, `(1+2x)G_c = (1+x)(1+2x)^8 + x(1+x)^7(1+2x)`. Hence
`I(T−c) = Σ_{j=0}^{m−1} C(m−1,j)[E0_j + E1_j] + tail`, where:
- `E0_j = x^j(1+x)^{8j+1}(1+2x)^{8(m−j)}`;
- `E1_j = x^{j+1}(1+x)^{8j+7}(1+2x)^{8(m−1−j)+1}`;
- `tail = x(1+x)^2(1+2x)^{8m−1}`.

| Block | `(a, b, t)` | margin | range used |
|---|---|---|---|
| `E0_j` | `(8j+1, 8m−8j, p*−j)` | **`2j+3`** | `1 ≤ j ≤ m−1` (and 3 at `j = 0`) |
| `E1_j` | `(8j+7, 8(m−1−j)+1, p*−j−1)` | **`2j+7`** | `0 ≤ j ≤ m−1` |
| tail | `(2, 8m−1, p*−1)` | `−2` | (G) does not apply |

Side conditions and ℕ-subtractions:
- For `E1_j`, `t = p*−j−1 ≥ p*−m ≥ 1`, `t ≤ 8m = a+b`, and `8(m−1−j)+1 ≥ 1` for `j ≤ m−1`.
- `m−1` and `8m−1` are exact because `m ≥ 2`.
- The weights `C(m−1, j)` are positive.

Pairing: `E0_0 + tail = (1+x)(1+2x)^{8m−1}[(1+2x) + x(1+x)] = (1+x)(1+3x+x²)(1+2x)^{8m−1} =: Π`, an identity for every `m`. I checked it
by hand and by instrument.

*Closing step (a), C-F2-U's regrouping.* `1+3x+x² = (1+x)² + x`, so `Π = (1+x)^3(1+2x)^{8m−1} + x(1+x)(1+2x)^{8m−1}`.
- The first term has `(a, b, t) = (3, 8m−1, p*)`: `3a+4b+2 = 32m+7`, `6t = 32m+8`, **margin 1**, and `p* ≤ 8m+2`.
- The second has `(1, 8m−1, p*−1)`: `3a+4b+2 = 32m+1`, `6t = 32m+2`, **margin 1**, and `p*−1 ≤ 8m`.
- Both are instances of (G), so `Δ_{p*}(Π) < 0`. In C-F2-U's convention, `6t − (3a+4b) = 3` for each.

*Closing step (b), C-T2-F's identity.* Let `q = r_{1,N}` with `N = 8m−1`. Then `Δ_{p*}(Π) = q(p+1) + 2q(p) − 2q(p−1) − q(p−2)` (write `p = p*`).
- In (R) with `a = 1`, `b = N`: `1+2N = 16m−1 = 3p−5` and `2(N+2−k) = 3p−2−2k`. Both are integers because `3p* = 16m+4`; this is where the
  residue class enters.
- At `k = p`: `(p+1)q(p+1) = −5q(p) + (p−2)q(p−1)`.
- At `k = p−1`: `p·q(p) = −2q(p−1) + p·q(p−2)`.
- Eliminating `q(p+1)` and `q(p−2)` gives `p(p+1)Δ = q(p)[p(p+1) − 5p] + q(p−1)[p(p−2) − 2p(p+1) − 2(p+1)]`, that is,
  **`p*(p*+1)Δ(Π) = p*(p*−4)q(p*) − (p*²+6p*+2)q(p*−1)`**. I derived this by hand.
- (G) at `(1, 8m−1, p*−1)` has margin 1, so `0 < q(p*) < q(p*−1)`.
- Since `0 < p*(p*−4) < p*²+6p*+2`, the right side is `< −(10p*+2)q(p*−1) < 0`. Here `p*−4` is exact because `p* ≥ 572`.

*C-T2-U's closed form, checked exactly.* Write `B(k) = C(N,k)2^k` and `N = (3p−6)/2`. Then `B(p)/B(p−1) = (p−4)/p` and
`B(p−2)/B(p−1) = (p−1)/(p−2)`. So `q(p) = B(p−1)(2p−4)/p` and `q(p−1) = B(p−1)(2p−3)/(p−2)`. Substituting into (b):
- `(p−4)(2p−4)(p−2) − (p²+6p+2)(2p−3) = (2p³−16p²+40p−32) − (2p³+9p²−14p−6) = −(25p²−54p+26)`;
- hence **`Δ(Π) = −C(8m−1,p*−1)·2^{p*−1}(25p*²−54p*+26)/((p*−2)p*(p*+1))`**, exactly as C-T2-U states;
- `N = (3p−6)/2` is an integer because `p* = 16k+12` is even (`m = 3k+2`);
- the quadratic has roots of about 0.72 and 1.44, so it is positive at `p* ≥ 12`.

*A third closing step (C-F2-T, the tail alone).* Write `f_k = C(N,k)2^k` and `u = 16m`. Then `Δ_{p*}(tail) = f_p + f_{p−1} − f_{p−2} − f_{p−3}`.
- The ratios are `f_{p−3} = f_{p−2}(u−2)/(u+4)`, `f_{p−1} = f_{p−2}(u−2)/(u+1)` and `f_p = f_{p−2}(u−2)(u−8)/((u+1)(u+4))`.
- The numerator is `(u−2)(u−8) + (u−2)(u+4) − (u+1)(u+4) − (u−2)(u+1) = −12u + 6`, so `Δ(tail) = −6(32m−1)f_{p*−2}/((16m+1)(16m+4)) < 0`.
- `E0_0` then has margin 3, so the pairing is not needed.
- I checked this by hand, and by binomials on 1,001 residue-2 rows `m ∈ [2, 3002]`, with polynomial convolution at `m = 2, 107, 110`.

*Instrument, at `m = 107, 110`:*
- the block sum equals the closed form, and the sum of block differences equals the literal difference;
- `E0_j` (`j ≥ 1`) and `E1_j` have exact margins `2j+3` and `2j+7`, and both are positive at both indices;
- `E0_0` has margin 3 and the tail has margin −2;
- `Π` equals the regrouped form, and both regrouped blocks have margin 1;
- the C-T2-F identity, the negativity chain, the C-T2-U closed form, and both (R) instances are exact;
- `Δ_{p*}(T−c)` is `−11548817847…` (107) and `−35618458109…` (110).

`sr_pi_sweep.py` finds every closing-step identity exact on all 965 class rows `m ∈ [107, 3000]`.

*Transfer to every private leaf.* The closed form holds for each `(i, j)` by the derivation in §1, which is per-leaf. The literal tree
confirms it at every leaf for `m ≤ 8` and at the sampled leaves at 107 and 110. The `S_8 ≀ S_m` automorphism route of the key's text is
equally valid, but it is not needed.

**4. SR-C2-1c — the leaf set of record.**
- **Leaf set.** For `m ≥ 1`, `deg r = m+1`, `deg s = 2`, `deg u_i = 9`, `deg b_ij = 2`, `deg c_ij = deg v = 1`. So `leafSet = {v} ∪ {c_ij}`
  (`8m+1` leaves).
- **Favorability.** By 2 and 3, `Δ_{p*}(T−w) < 0` for every leaf, so `F_{p*}(CB(8,m)) = leafSet`.
- **Polynomials fed to (G):**
  - `V_j` for `0 ≤ j ≤ m`, `R`, `E0_j` for `1 ≤ j ≤ m−1`, `E1_j` for `0 ≤ j ≤ m−1`;
  - `(1+x)^3(1+2x)^{8m−1}` at `p*`, and `x(1+x)(1+2x)^{8m−1}` at `p*−1`;
  - in route (b), `(1+x)(1+2x)^{8m−1}` at `p*−1`, which in route (b) is also fed to (R) at `k = p*−1, p*`.
- **Why none needs Newton or Darroch.** Every one of these is a monomial times `(1+x)^a(1+2x)^b`. (G) itself is proved from (R) and LC by
  factor induction. `I(T)`, `I(T−w)`, `G`, `G_c`, `G^m` and `1+3x+x²` are fed to nothing: `1+3x+x²` enters only through exact
  convolution or regrouping. Newton and Darroch appear nowhere, and no refuted mechanism is revived. In particular, nothing asserts
  real-rootedness of any polynomial here, and `E993-TREE-REAL-ROOTED` stays REFUTED.
- **Weakest input.** The closed-form node of the r30 key is `proved_informal`. (G) and (R) are kernel-checked companions with no grade
  of their own, and exact algebra carries the rest. The grade is therefore **`proved_informal`**. `m ≥ 107` is unused (the argument holds
  for every `m ≡ 2 (mod 3)`, `m ≥ 2`). The statement is registered on the class only (fence 1).

**5. SR-C2-1d — (G′).** T2's tool reads: `1 ≤ k ≤ a+b`, `6k ≤ 3a+4b` ⇒ `r(k) < r(k+1)`.
- **The smallest counterexample I verify, `(a, b, k) = (2, 0, 1)`:** `(1+x)^2 = 1 + 2x + x²`. The hypotheses `1 ≤ 1 ≤ 2` and `6 ≤ 6` hold,
  but `r(1) = 2 ≮ r(2) = 1`.
- Ordering by `(a+b, k, b)`, the degree-2 failures are `(2,0,1)`, `(1,1,1)` (3 vs 2) and `(0,2,1)` (4 = 4). No instance exists with
  `a+b ≤ 1`, because `6 ≤ 3a+4b` fails there. So degree 2 is minimal.
- The listed instances reproduce: `(0,3,2)` 12 vs 8, `(0,9,6)` 5376 vs 4608, `(0,8,5)` 1792 = 1792. My own grid gives 499 failures in
  16,425 instances on `a, b ≤ 30`.
- The defect in T2's proof: LC bounds `r(k−1)` above by `r(k)²/r(k+1)`, not below as the proof uses.

## Findings and repairs

1. **Confirmed mathematics.** Every hypothesis, margin, side condition, ℕ-subtraction, residue use and endpoint in X-4, X-5, X-6 and X-7
   holds as stated. The index is `p*`, and the sign is `<`. The endpoint `m = 107` is unused, and the class restriction is a fence, not a
   proof need. The class enters in one place: `3p* = 16m+4`, which makes the margins exact and makes the (R) coefficients integral in step (b).
2. **Repair: the convention for (G) margins.** Three conventions appear on the origin faces for the same numbers:
   - margin `6t−(3a+4b+2)`: T1 and the synthesis, `2j+3` / `0` / `2j+7`;
   - gap `6t−(3a+4b)`: C-F2-U and C-F2-T, `2j+5` / `2` / `2j+9`;
   - signed `(3a+4b+2)−6t`: the T adjudication and C-T2-F, `−2j−3` / `−2j−7`.

   In addition, C-F2-U and C-F2-T index the `E1` family by `j' = j+1` (their "gap `2j'+7`" is margin `2j+7` in the weight index `j`).
   The four faces agree once the convention is fixed. The registration text defines the margin explicitly.
3. **Repair (G-3): the formal clauses are not registered now.** The G-3 row includes the clauses "after C2-LA2 … `formally_verified`;
   after C2-LA3 … `formally_verified`". A scope note cannot pre-register the grade of an award that has not closed. The note below
   registers the informal clause only. Each formal clause is a separate note on that award's close (as the synthesis's C2-LA2 and C2-LA3
   sections already say).
4. **Repair (G-3): attribution.**
   - The G-3 row omits the source of the descent lemma and the recurrence, which is r31 Cycle 1's formal award (named by its key).
   - Seat names collide across runs: r30 Cycle 6's C-T1-F (the paired-block factorization) and r31 Cycle 2's C-T1-F (compiled arm-leaf
     scratch) are different seats. The text qualifies every seat by run and cycle.
   - C-F2-T's closing step (the tail alone) is named as a third, independent closing step.
   - The r31 Cycle 1 key's own fences exclude favorability, so it is cited only as the source of the ungraded companion lemma, never as
     covering this statement.
5. **Working labels.** "(G)", "(R)", "Π", "X-4" and similar are working labels, so the registry text uses the Lean declaration names and
   explicit polynomials instead.
6. **The transfer.** The per-leaf derivation suffices, and I confirmed it on the literal tree. The r30 key's automorphism transfer is not
   needed for this note.
7. **Correction 5 is confirmed** (§1). It concerns `I(CB − {c_ij, b_ij})` only. The per-leaf closed form of record uses `G_c` correctly.
8. **Struck material stays struck.** T2's object (index `p*−1`) and every `Δ_{p*−1}` table carry no weight here. My instrument's
   `arm_delta_pm1_sign` field is a sanity field and is not cited. T2's return was read only for (G′).
9. **No cut and no template failure** is in scope. This read concerns coefficient statements only.

## Registration text

```text
SCOPE NOTE ON: E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3
TEXT: [r31 C2; SR-C2-1] On CB(8,m) with m ≥ 107 and m ≡ 2 (mod 3), at the single rank p* = (16m+4)/3 (equal to ⌊(2dm+4)/3⌋ at d = 8, since 8m ≡ 1 (mod 3)), this key's conclusions (i) and (ii), namely Δ_{p*}(T − w) = i_{p*+1}(T − w) − i_{p*}(T − w) < 0 for the arm leaf w = v and for every private leaf w = c_ij, hence F_{p*}(CB(8,m)) = leafSet(CB(8,m)) (the 8m + 1 leaves v and c_ij), have a second proof that uses neither Darroch's theorem nor Newton's inequalities, no finite certificate and no cutoff. Inputs: (1) this key's closed-form node for I(T − v) and I(T − c) (proved_informal); the formula for I(T − c_ij) is derived for each (i, j) directly and is the same polynomial for every private leaf, so no automorphism argument is needed; (2) the two-binomial descent lemma E993Transport.twoBinom_coeff_strictAnti_of_gap: for natural a, b, t with 1 ≤ t ≤ a + b and 3a + 4b + 2 ≤ 6t, [x^{t+1}](1+x)^a(1+2x)^b < [x^t](1+x)^a(1+2x)^b. It and the three-term recurrence E993Transport.twoBinomCoeff_recurrence are kernel-checked companion lemmas, with no grade of their own, in the formal proof of E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-BLOCK-PRODUCT-1-PLUS-X-TO-8J-TIMES-1-PLUS-2X-TO-8M-MINUS-8J-PLUS-1-COEFFICIENTS-STRICTLY-DESCEND-AT-INDEX-16M-MINUS-2-OVER-3-MINUS-J-FOR-5-LE-J-LE-M; the lemma is proved there from that recurrence and log-concavity by induction on linear factors; that key's own statement and fences (which exclude favorability) are unchanged. Write margin := 6t − (3a + 4b + 2). Arm leaf: I(T − v) = Σ_{j=0}^{m} C(m,j)·x^j(1+x)^{8j+1}(1+2x)^{8(m−j)} + x(1+2x)^{8m}; at t = p* − j the j-th block has margin 2j + 3, and the last term (a = 0, b = 8m, t = p* − 1) has margin 0; 1 ≤ t and t + 1 ≤ a + b hold in every case because p* − m = (13m+4)/3 ≥ 1 and p* ≤ 8m; every weight C(m,j) is positive, so Δ_{p*}(T − v) < 0. Private leaf: I(T − c_ij) = Σ_{j=0}^{m−1} C(m−1,j)·[x^j(1+x)^{8j+1}(1+2x)^{8(m−j)} + x^{j+1}(1+x)^{8j+7}(1+2x)^{8(m−1−j)+1}] + x(1+x)^2(1+2x)^{8m−1}; the first family has margin 2j + 3 at t = p* − j (used for 1 ≤ j ≤ m − 1) and the second margin 2j + 7 at t = p* − j − 1 (0 ≤ j ≤ m − 1). The j = 0 member of the first family plus the last term is the paired block (1+x)(1+3x+x^2)(1+2x)^{8m−1}, whose forward difference at p* is negative by either of two independent closing steps: (a) since 1 + 3x + x^2 = (1+x)^2 + x, the paired block equals (1+x)^3(1+2x)^{8m−1} + x(1+x)(1+2x)^{8m−1}, two instances of the lemma with margin 1 each (t = p* and t = p* − 1); (b) with q(k) := [x^k](1+x)(1+2x)^{8m−1}, the recurrence at k = p* − 1 and k = p* (integer coefficients because 3p* = 16m + 4) gives p*(p* + 1)·Δ_{p*} = p*(p* − 4)·q(p*) − (p*^2 + 6p* + 2)·q(p* − 1), and the lemma at (a, b, t) = (1, 8m − 1, p* − 1) (margin 1) gives 0 < q(p*) < q(p* − 1), so the right side is below −(10p* + 2)·q(p* − 1) < 0; in closed form this forward difference equals −C(8m−1, p*−1)·2^{p*−1}·(25p*^2 − 54p* + 26)/((p* − 2)·p*·(p* + 1)). A third closing step treats the last term alone: its forward difference at p* equals −6(32m − 1)·2^{p*−2}·C(8m−1, p*−2)/((16m + 1)(16m + 4)) < 0, while the j = 0 member of the first family has margin 3. Every polynomial fed to the lemma or to the recurrence is a monomial times (1+x)^a(1+2x)^b; I(T), I(T − w), G, G_c and G^m are fed to neither, and no real-rootedness of any polynomial is used. Grade of this note: proved_informal (weakest input: the closed-form node); the hypothesis m ≥ 107 is not used by the argument and is kept as the class fence. Bounded support (never evidence): isolated second read SR-C2-1 matched a literal-tree dynamic program to the closed forms at m = 1..5 and 8 (every leaf) and at m = 107 and 110 (the arm leaf and three private leaves each), checked every block, margin, side condition and closing step exactly at m = 107 and 110, and checked the closing-step identities on 965 class rows m ∈ [107, 3000]. Fences: d = 8, the class m ≥ 107, m ≡ 2 (mod 3), rank p* only; an informal statement about the literal tree through the closed-form node; no formal clause is registered by this note (formal notes follow the closure of their governed awards, each at its exact scope). This key's statement, grade at full scope (proved_informal modulo Darroch and Newton) and fences are unchanged; nothing transfers to other ranks, residues, values of d, heterogeneous CB patterns, E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER or Erdős #993, all of which stay as registered. Attribution: arm leaf, r31 Cycle 2 route T1 (Claude Sonnet 5); private leaf, r31 Cycle 2 critics C-F2-U (closing step (a)), C-T2-F (closing step (b)), C-T2-U (the closed form) and C-F2-T (the last-term step), all Claude Opus 5.5; compiled closed-form scratch without grade, r31 Cycle 2 critics C-T1-F, C-T1-U and C-F2-U (Claude Opus 5.5); the closed forms, the block decomposition and the paired-block factorization, r30 as registered on this key (r30 Cycle 6 route T1 and r30 Cycle 6 critic C-T1-F); the descent lemma and the recurrence, the r31 Cycle 1 formal proof of the key named above; the family CB(d,m), the favorable selector and the network in which it is used, Codex (GPT-6), the lower-region run; isolated second read SR-C2-1 (Claude Opus 5.5).
```

```text
RECORD: R31-C2-REFUTED-MECHANISM-TWO-BINOMIAL-ASCENT-AT-6K-LE-3A-PLUS-4B
CLAIM: For natural a, b, k with 1 ≤ k ≤ a + b and 6k ≤ 3a + 4b, [x^k](1+x)^a(1+2x)^b < [x^{k+1}](1+x)^a(1+2x)^b (proposed as an ascent tool, mirroring E993Transport.twoBinom_coeff_strictAnti_of_gap, in r31 Cycle 2 route T2's return).
STATUS: REFUTED
PROVENANCE: Smallest counterexample (a, b, k) = (2, 0, 1): (1+x)^2 = 1 + 2x + x^2, hypotheses 1 ≤ 1 ≤ 2 and 6 ≤ 6 hold, coefficients 2 then 1. The other degree-2 failures are (1, 1, 1) (3 then 2) and (0, 2, 1) (4 = 4, strictness fails); no instance exists with a + b ≤ 1. Further instances: (0, 3, 2) 12 vs 8; (0, 9, 6) 5376 vs 4608; (0, 8, 5) 1792 = 1792; 499 failures among the 16,425 hypothesis-satisfying instances with a, b ≤ 30. Defect of the proposed proof: log-concavity bounds [x^{k−1}] above by [x^k]^2/[x^{k+1}], not below. Found by r31 Cycle 2 critics C-T2-F and C-T2-U and the T adjudicator (Claude Opus 5.5); confirmed with its own instrument by isolated second read SR-C2-1 (Claude Opus 5.5). Added to the refuted-mechanism list of SOLUTION-CONTRACT §3.6. A ledger row, not a key; never carried, formalized or registered; it is load-bearing for no retained result.
```

```text
DISTINCTION ROW: SR-C2-1-D1
KEY: E993-ZERO-EXTENDED-BINOMIAL-BLOCK-RISE-FALL-STRICT-RISE
TEXT: The refuted ascent row R31-C2-REFUTED-MECHANISM-TWO-BINOMIAL-ASCENT-AT-6K-LE-3A-PLUS-4B concerns the coefficients of (1+x)^a(1+2x)^b under the hypothesis 6k ≤ 3a + 4b. The registered key concerns x^t(1+2x)(1+x)^u (the case b = 1, shifted) with a non-strict rise for j ≤ t + ⌊u/2⌋ and a strict rise only at t = 0, 0 ≤ j ≤ ⌊u/2⌋. No failure of the refuted row lies in the registered key's range: for example, (a, b, k) = (1, 1, 1) has k = 1 > ⌊1/2⌋. The refutation changes nothing about the registered key, and the key does not support the refuted row.
```

## Verdicts

verdict[SR-C2-1a]: confirmed_with_repairs
verdict[SR-C2-1b]: confirmed_with_repairs
verdict[SR-C2-1c]: confirmed_with_repairs
verdict[SR-C2-1d]: confirmed_with_repairs

What each verdict covers and repairs:
- **1a:** the mathematics of X-4 is exact as stated. The repair defines the margin convention on the face and names the inputs by
  declaration and key.
- **1b:** X-5 and X-6 are exact. Both required closing steps are confirmed independently: C-F2-U's regrouping and C-T2-F's identity
  via the recurrence and the descent lemma. C-T2-U's closed form is confirmed exactly, and C-F2-T's last-term step as a third route. The
  transfer is per-leaf. The repairs are the convention and indexing notes of Finding 2.
- **1c:** the grade is `proved_informal` by its weakest input. Every polynomial fed to the tool is named. The repair puts the leaf-set
  identification and the input names on the face.
- **1d:** the G-3 note is confirmed in the text above. The repairs remove the pre-registered formal clauses, complete the attribution and
  qualify seats by run. (G′) is recorded REFUTED with the smallest counterexample `(2, 0, 1)`.

## Artifact inventory

Scratch root: `scratchpad/c2-sr-SR-C2-1/` (under the run root). Python 3 standard library only, `python3 -B`, exact integers and
`Fraction`, foreground runs.

| Path | SHA-256 | Role |
|---|---|---|
| `scratchpad/c2-sr-SR-C2-1/verify_seal.py` | `6cb66c8a0cabe44e7511ad874973a503a30a2e52875c4f14b7fc4ac3425afe2a` | capsule seal and 448 member digests |
| `scratchpad/c2-sr-SR-C2-1/verify_sources.py` | `91fd88899d1e4c56070372cfbf73c98fbeba943242330d1e597c56bb04273e31` | capsule members against each `SOURCE-DIGESTS.json` |
| `scratchpad/c2-sr-SR-C2-1/sr_fav.py` | `ff113c1cfb906d7031ad95e1aea3bb52ce134c15ea1f35f5b985b88a21485d90` | own instrument: literal forest DP vs closed forms; block expansions; (G) data per block; both closing steps; C-T2-U form; (G′) grid; (G) sanity grid |
| `scratchpad/c2-sr-SR-C2-1/sr_small_out.json` | `132761c0db74f28af39f51fcb82f1d4a3daa582a2e176faa00857417d2fcc20c` | `m = 1..5, 8` literal checks; (G′) 499/16,425; (G) 0/12,255 |
| `scratchpad/c2-sr-SR-C2-1/sr_rows_out.jsonl` | `8604e529cc46abe376b68aaba1d53442152f3206615b0c026643215617f8abf7` | class rows 107 and 110 (187 s) |
| `scratchpad/c2-sr-SR-C2-1/sr_pi_sweep.py` | `3591861d384ea327d22c9024abf6b7e200045031ce4cb1a4c07362d1447ff3ab` | binomial-level sweep of the margin identities and closing steps |
| `scratchpad/c2-sr-SR-C2-1/sr_pi_sweep_out.json` | `b59547da2836b8385d7051cc6535ab5f90f6ed0c02964d0657cf89daaa60df29` | 965 class rows `m ∈ [107, 3000]`, 0 bad |
| `scratchpad/c2-sr-SR-C2-1/sr_supp.py` | `dcac698e3daab7b7ea957c0959714caa9e365692c097108cb9be5bea965e4d18` | C-F2-T last-term identity; correction 5; (G′) ordering (second, binomial-only version) |
| `scratchpad/c2-sr-SR-C2-1/sr_supp_out.json` | `169713358c963576151197d1d362ce19af94a8ebd0e14f06df3b7f232ba961a1` | 1,001 rows 0 bad; `G − G_c = xG'`; literal `G'` true / `G_c` false at `m = 1, 2, 3, 5`; first failures of (G′) |
| `scratchpad/c2-sr-SR-C2-1/reg_lookup.py`, `reg_lookup2.py` | `4cf70ea6…6e6`, `1edf8ac1…e7f` | favorability key's record in the three registries |
| `scratchpad/c2-sr-SR-C2-1/alias_check.py` | `a02ceb8ba7e73294e75647cf561b1823722775cabede2977cd2523600501b7d7` | presence of every cited key and a lexical sweep |
| `second-reads/SR-C2-1/SECOND-READ.md` | (this file) | the deliverable |

**Alias results.**
- Every key named in the registration text is present in the run-local snapshot.
- The r30 favorability key, `E993-TREE-REAL-ROOTED`, the (HALL) key and the aggregate key are also present in both masters. The `E993-R31-`
  keys are absent from both masters, as expected: they are run-local until the terminal close.
- No new key is proposed.
- The ledger row id and the distinction row id are not key names. A lexical sweep of all three registries (`FAVORAB`, `PAIRED`, `ASCENT`,
  `TWO-BINOMIAL`, `BINOMIAL-BLOCK`, `DARROCH`, `NEWTON`, `ARM-LEAF`, `PRIVATE-LEAF`) finds no identity that states the paired-block lemma or
  the ascent tool.
- The favorability key's record is textually identical in the two masters (record digest `271d48b2…`). The run-local copy differs only by
  the two r31 Cycle 1 scope notes.

Background jobs: none running at the final write. The one auto-backgrounded run was stopped by its task ID (disclosure 3). This file was
reread before close.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
