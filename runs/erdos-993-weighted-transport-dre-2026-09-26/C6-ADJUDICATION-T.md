# Orientation Adjudication

Isolated Stage 5 adjudicator, orientation T (prove), Cycle 6 (the sixth and last cycle) of r30
(`erdos-993-math-dre-20260926-r30-weighted-transport`), 2026-09-27. The portfolio is the returns of `T1`
(`C6-T-01 CB-TOP-DEFICIENT-RANK-UNIFORM-SWITCH-HALL`) and `T2` (`C6-T-02 CB-BAND-ROW-CERTIFICATES`) and their four
cross-orientation critiques (`C-T1-F`, `C-T1-U`, `C-T2-F`, `C-T2-U`).

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in that order. I loaded no other VerityOS subsystem. The subsystem in use
is `experiments/`, confined to this run root and my sealed capsule.

**Model disclosure (two parts).** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Summary.**
- (HALL) stays OPEN at full scope. Nothing in the T portfolio is decisive.
- **T1.** Its one graded advance, `(ELIG-top)` at `proved_informal` for `m ≥ 246`, is **struck**. It rests on a false lemma: that
  every forest has a real-rooted independence polynomial. `K_{1,3}` refutes it, and so do the return's own polynomials. Both
  critics found this, and I replayed it with their instruments and with my own. What survives from T1 is the closed forms, which
  are correct, and a bounded record. That record now runs to `m = 2395` on the critics' exact sweeps.
- **C-T1-F's block lemma** replaces T1's argument for the favorability half. I verified it on the face and checked it numerically
  at new rows. It is `proved_informal` modulo Darroch and Newton, which it applies only to products of linear factors. It is
  critic-attributed, STATED, and needs a second read.
- **T2.** Its four whole-row certificates are **retained** at `computer_assisted`: `CB(8,95)/508`, `CB(7,109)/510`, `CB(8,98)/524`
  and `CB(7,112)/524`. The literal laboratory and the exact all-`q` E1 check behind them were critic-supplied. Several
  certification literals are struck.
- **Six more rows**, certified by the critics, are critic-attributed at the same grade: `CB(8,101)/540`, `CB(7,115)/538`,
  `CB(8,104)/556`, `CB(7,118)/552`, `CB(7,121)/566` and `CB(8,107)/572`.
- **No award group of this orientation is Lean contract-ready.**

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Dispatch `control/dispatch/c6-stage5/DISPATCH-ADJ-T.md` | `ca8afff336f1ffe325f42b807445d6da16efd053ed0d2d7e66cce85068dbd766` | `shasum -a 256`, before following it | **match** |
| Capsule `control/c6-adjudicator-capsules/T-PACKET-MANIFEST.json`, inner seal | `a6a4d411c003c490fefa3217e07cdafd08c3cc9e84e3d58f0d71188a34e5cfc9` | canonical JSON without `seal_sha256` (sort_keys, `(",",":")`, no trailing newline) | **match** |
| Capsule members | 21 files (SHA-256 and bytes) | each recomputed (`scratchpad/c6-adj-T/seal_check.py`) | **21/21 match** |
| Stage 2 packet manifest, inner seal | `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611` | canonical recompute; 2011/2011 member digests match | **match** |
| Stage 3 packet manifest, inner seal | `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd` | canonical recompute; 65/65 member digests match | **match** |
| Stage 4 packet manifest, inner seal | `0e5fc7b47a1c90fb8ac25b800585321a8ef7f2d8a52e40654f85c3a45b70be5c` (file digest `ad04a2be…`, as in the capsule) | canonical recompute; 85/85 member digests match | **match** |
| T1 `RETURN.md` / T2 `RETURN.md` | `761857cd…10c97` / `5aeb0784…84a2` | capsule, Stage 3 admission, Stage 3 manifest | match |
| The four critiques | `a7057189…`, `294f859f…`, `9b288408…`, `d0ac4743…` | capsule, Stage 4 admission | match |
| Frozen source `sources/c5-stage7-sources/ADJ-T/adj_t1_e1allq.py` (the E1(i) cleared form) | `bee863bc…07de` | matches `sources/c5-stage7-sources/SOURCE-DIGESTS.json` (`98f4561a…`, itself a Stage 2 member) | match |
| Inventoried scratch copied out (`c6-crit-T1-F`, `c6-crit-T1-U`, `c6-crit-T2-F`, `c6-crit-T2-U/own`, `c6-T2`) | as each critique's or return's inventory | `shasum -a 256` after copy-out | every listed digest matches |

Admissions: Stage 3 admitted 6/6 returns and Stage 4 admitted 12/12 critiques, with no findings and no exceptions. Stage 3 bound
its admission to the Stage 2 seal `29a3aeb7…`. All four T-portfolio critiques carry verdict `retained_narrowed` and a
headline flag of `no`.

**Read-boundary and process disclosures (mine).**
1. **Digest loop.** My seal script hashed the BYTES of every member of the Stage 2, 3 and 4 manifests. That includes other
   orientations' returns and critiques. The script displayed only match counts, and no content of a non-capsule file was displayed
   or used. This is the same kind of item as C-F1-U's Stage 4 flag.
2. **Stray copy.** I briefly wrote one stray copy of the T2 return into the session's own temporary scratchpad, outside this run.
   I deleted it at once, unread; I read the return directly from its sealed path.
3. **Frozen source.** I read one frozen source under `sources/`, `c5-stage7-sources/ADJ-T/adj_t1_e1allq.py`, which is authorized.
   I read it for the E1(i) cleared form and checked its digest first.
4. **Listings.** I ran one non-recursive `ls -la` of the T-portfolio seat and critic scratch directories, and one `find`, rooted
   inside my own scratch, for bytecode. The `find` returned nothing.
5. **Not read.** No other orientation's returns, critiques or adjudications, no registry, no syntheses, no other roots, and no
   network. There were no installs and no Lean.
6. **Background jobs.** I ran one background job, PID `90703` (`adj_T_instr.py`). I confirmed it had exited (`kill -0` fails)
   before this write. Everything else ran in the foreground with `python3 -B`, and there is no bytecode. I ran no process listing
   and no pattern kill.
7. **Host context.** The host injected `CLAUDE.md` and a memory index. I did not act on either, and kept no conversation log,
   because the dispatch confines my writes.

**Registry keys touched:**
- (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN).
- The primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN; untouched).
- (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (`formally_verified`; cited only).
- E1-R `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`).
- The E1 threshold key `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (`proved_informal`
  modulo Darroch).
- `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` (checked for disjointness only).
- `E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS` (flagged; see Cross-route
  reconciliation).

The registry is not a capsule member. Every alias check below is therefore owed by the second read.

## Route-by-route decisions

### T1 — `C6-T-01 CB-TOP-DEFICIENT-RANK-UNIFORM-SWITCH-HALL` (verdict `bounded_evidence`)

**Claim by claim:**

1. **The closed forms are RETAINED.** They are:
   - `I_T = (1+2x)G^m + x(1+x)(1+2x)^{dm}`
   - `I_{T−v} = (1+x)G^m + x(1+2x)^{dm}`
   - `I_{T−c} = (1+2x)G_cG^{m−1} + x(1+x)²(1+2x)^{dm−1}`

   Here `G = (1+2x)^d + x(1+x)^d` and `G_c = (1+x)(1+2x)^{d−1} + x(1+x)^{d−1}`. The derivation is elementary and uniform: split on
   whether `r` is in the set, then on each hub `u_i`. Four instruments agree:
   - T1: 36 checks at `d ≤ 3`, replayed by both critics;
   - C-T1-F: 72/0 for `d ≤ 8`, `m ≤ 3`;
   - C-T1-U: 27/0;
   - mine: 108/0 for `d ≤ 9`, `m ≤ 3`, against my own tree DP. My DP includes a second private-leaf representative, and my tree
     test (BFS connectivity plus union-find acyclicity) passes both negative controls.

   **Grade:** `proved_informal` as an elementary lemma, T1-attributed. T1 graded it `bounded_computation`, and I raise the grade
   on the face because the argument is uniform and checked. It is a node of the C-T1-F lemma below, not a key.
2. **Claim 1's `(ELIG-top)` at `proved_informal` for `m ≥ 246` is STRUCK.** The critics are concordant (C-T1-F F1 and C-T1-U A1),
   and I replayed it:
   - Step 5 cites "the independence polynomial of any finite forest has only real roots". That is false.
   - `K_{1,3}` gives `1 + 4x + 3x² + x³`. Its derivative `3x² + 6x + 4` has discriminant `−12`, so the cubic is strictly increasing
     and has exactly one real root.
   - Replayed with C-T1-F's `realroot_test.py`, whose log is byte-identical, and with my own Sturm code (`adj_T_instr.py` part B),
     the distinct real roots are:

     | Polynomial | Real roots / degree |
     |---|---|
     | `K_{1,3}` | 1/3 |
     | `G_8` | 3/9 |
     | `I(CB(8,1))`, `I(CB(8,1)−v)`, `I(CB(8,1)−c)` | 4, 2, 4 of 10 |
     | `I(CB(8,2))`, `I(CB(8,2)−v)`, `I(CB(8,2)−c)` | 5, 3, 6 of 19, 19, 18 |

   - No polynomial T1 fed to Darroch is real-rooted.
   - A lemma of that kind would also make tree unimodality, Erdős #993 itself, a corollary of Newton's inequality.

   The mean-margin arithmetic (slope `256/20451`; `m₀ = 246/172/162`) is correct arithmetic about MEANS. It certifies nothing
   about coefficients.
3. **"Strictness subtlety … the one gap" (Remaining obligation 1(b)) is STRUCK as a misdiagnosis.** Both critics agree. For a
   real-rooted polynomial with positive coefficients, Newton's inequality is strict. The gap is real-rootedness itself.
4. **"`[239,245]` covered by both" is STRUCK.** In the return it was covered by neither. It is now covered exactly by both critics'
   sweeps (below).
5. **"Strict `Δ_{p*−2}<0` directly confirmed by exact coefficient computation … up to `m = 2000`" is STRUCK.** C-T1-F F3 and C-T1-U
   agree: Part 4 evaluates only `I(1)` and `I'(1)`. The return's exact coefficient horizon is 238. "3000 further consecutive
   integers" is corrected to the `range(m₀, 3000)` actually run, again of mean margins only (C-T1-F).
6. **The bounded record of (a), (b) and (c) at `p* = ⌊(16m+4)/3⌋`, `d = 8`, is RETAINED and extended.** Three instruments:
   - T1's truncated convolution on `[106, 238]`, replayed by both critics with byte-identical digest `bc0a316c…`;
   - C-T1-U's trapped-exact Kronecker/decimal sweep on `[106, 500]`;
   - C-T1-F's incremental `G^m` sweep on `[106, 2395]`.

   I recomputed C-T1-F's summary from its shipped per-row data, and it is byte-identical (`SUMMARY_DIGEST 58c7ee44…`). I summarized
   C-T1-U's shipped rows with my own code: contiguous on `[106, 500]`, with the same failures. Findings:
   - (a) fails EXACTLY at the ten values `{106, 109, …, 133}`, where `x = p* − 1`;
   - (b), (c) and `3p* < 2α + 1` hold on every row.

   **Grade:** `bounded_computation`, exact, two instruments on `[106, 500]` and one on `(500, 2395]`. The record gets a scope note
   under `R30-CB-RECORD`, not a key.
7. **Obligation (ii)'s "genuine scoping finding" is STRUCK.** Concordant: C-T1-F F4, C-T1-U A3 and CF-REPLAY-c6d. With
   `μ_1 = (32m − 7)/6`, direct algebra gives `⌈μ_1⌉ + 2`:
   - `= p*` for `m ≡ 0` (`m = 3t`: `16t + 1`);
   - `= p*` for `m ≡ 2` (`16t + 12`);
   - `= p* + 1` for `m ≡ 1` (threshold `16t + 7` against `p* = 16t + 6`).

   The critic script, replayed byte-identically, gives 3263 and 1632 rows on `[106, 5000]`. So E1(i) at every `q` at `p*` holds **on
   all of `𝒞_8` by citation** of the threshold key, and Darroch is legitimate there because `r_1` is a product of linear factors.
   The "discharged only for `m ∈ [134,400]`" and "`O(1)` margin" conclusions are struck. The citation of SR-C5-4 to
   "`SEMANTIC-CONTRACT.md` §2" is a citation erratum; it is in `control/C6-ALLOCATION.md`.
8. **Obligations (iii) and (iv) were NOT attempted.** T1's object, a uniform switch-arc (HALL) on `𝒞_8`, is **not established**. The
   "`m`-independent per-choke certificate" is a plan, not a lemma, and as stated it cannot work: the budget `1 − ρ_(1,8)(p*) ≈ 0.468/m
   → 0` (both critics).
9. **The candidate key `E993-R30-CB-EIGHT-TOP-RANK-COEFFICIENT-DESCENT-AND-LEAF-FAVORABILITY` is WITHDRAWN.** Its uniform statement
   is struck. It also fails ruling 48 in two ways: "CB-EIGHT" is a token, and the name omits the rank and the range. Its alias
   ground ("no registered claim uses a mode-location theorem on `CB(d,m)`") is struck, because the `d ≤ 6` sector key and the E1
   key are both Darroch-dependent CB claims (C-T1-F F6).
10. **Process.** The return's summary says "three background jobs" where its disclosure section lists five. The disclosure list
    governs (C-T1-U A8). The return also ships no file digest for its generator; the critics recorded `306a8344…`. The delayed
    digest check and the path-only `grep -rl` hits are as transcribed in the Stage 3 record. No penalty.

**The paired-critic disagreement, resolved.** C-T1-U says no statement's mathematics is complete "beyond item 1", the closed
forms. C-T1-F supplies a complete favorability lemma. These are not in conflict, because C-T1-U never attempted the favorability
half. **I rule for C-T1-F on the favorability half, after my own check.** Both critics agree that condition (a) is unproved beyond
the exact horizon.

**The critic-derived lemma (C-T1-F), graded here.** *Statement.* Fix `d ≥ 6`, `m ≥ 1`, `T = CB(d,m)` and
`p* = ⌊(2dm+4)/3⌋`. Then:
- (i) `Δ_{p*}(T − v) < 0`, so the arm leaf is favorable at `p*`;
- (ii) if `dm ≢ 2 (mod 3)`, then `Δ_{p*}(T − c) < 0` for every private leaf `c`.

Hence every leaf is favorable at `p*` when `dm ≢ 2 (mod 3)`. This covers all of `𝒞_8` (`d = 8`, `m ≢ 1`) and the `d = 7` analogue
(`m ≢ 2`) for every `m`.

*My on-face check of the proof.*
- **Tool (D).** Let `P = x^s∏(1+a_i x)`, `a_i > 0`, and let `k ≥ μ(P)` be an integer with `P_k > 0`. Then `P_{k+1} < P_k`.
  Newton's inequality is strict on the support, so the sequence is strictly log-concave. Darroch gives every mode `M` with
  `|M − μ| < 1`, so two tied modes straddle `μ`, and the last mode is `≤ ⌈μ⌉ ≤ k`. The sequence strictly decreases after its last
  mode. The tool is correct.
- **The blocks of (i).** `V_j = x^j(1+x)^{dj+1}(1+2x)^{d(m−j)}` has mean `2dm/3 + 1/2 − j(d−6)/6 < (2dm+2)/3 ≤ p*`, and its support
  `[j, dm+j+1]` contains `p*`. For `R = x(1+2x)^{dm}`, `R_{k+1}/R_k = 2(dm−k+1)/k ≤ 1` iff `3k ≥ 2dm+2`, which holds at `k = p*`.
- **The blocks of (ii).**
  - `E0_j` has the same form as `V_j`.
  - `E1_j = x^{j+1}(1+x)^{dj+d−1}(1+2x)^{d(m−1−j)+1}` has mean `2dm/3 − j(d−6)/6 + (7−d)/6 ≤ 2dm/3 + 1/6`.
  - The pairing `(1+x)(1+2x)^{dm} + x(1+x)²(1+2x)^{dm−1} = (1+x)(1+2x)^{dm−1}(1+3x+x²)` holds. The factor `1+3x+x²` has
    discriminant 5, so both roots are real and negative.
  - The paired block has mean `2dm/3 + 5/6`, and `p* − μ = (3−2ε)/6` with `ε = (2dm+4) mod 3`. This is positive iff `dm ≢ 2 (mod 3)`.
- **Transfer.** `S_d ≀ S_m` is transitive on the private leaves.

*Replays and new rows.*
- C-T1-F's `block_proof_check.py` (320 rows for (i), 253 rows for (ii), `d ≤ 13`, `m ≤ 40`) replays byte-identically.
- My own independent check (`adj_T_instr.py` part C) uses exact two-coefficient block formulas, with the mean identities asserted
  as exact `Fraction` equalities. It covers rows OUTSIDE the critic's range: `d ∈ 6..13`, `m ∈ 41..70`, plus `(7,150)`, `(8,150)`,
  `(7,300)` and `(8,300)`. That is 244 rows for (i) and 194 rows for (ii), with **0 violations**. A full-polynomial cross-check at
  four rows agrees.
- *Bounded side observation (adjudicator, not part of the lemma).* Private favorability also holds on all 50 tested rows with
  `dm ≡ 2 (mod 3)`, so the restriction is the proof's, not necessarily the truth's.

**Grade:** `proved_informal` modulo Darroch and Newton, applied only to products of linear factors. It is **critic-attributed
(C-T1-F)**, first STATED at a review stage, and needs an isolated second read and a full registry alias check. C-T1-F's proposed
name, `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`, is a predicate naming its
parameter range. The arm-leaf clause for every `m` belongs on the face.

**What the lemma does not give.** It does not give condition (a), `x ≤ p* − 2`. In the block decomposition of `I_T`, the blocks
`j < 4 + ε` (at `d = 8`) and the term `x(1+x)(1+2x)^{8m}` have means above `p* − 2`. Both critics agree. Condition (a) remains
`bounded_computation` on `[106, 2395]`.

**T1 route verdict: `bounded_evidence`, narrowed.** T1 retains the closed forms and the bounded record. Its one uniform claim is
struck, and it gives no restricted (HALL).

### T2 — `C6-T-02 CB-BAND-ROW-CERTIFICATES` (verdict `proved_conditional`)

**Claim by claim** (C-T2-F and C-T2-U are concordant on every numerical point):

1. **Row data is RETAINED.** Four instruments agree digit for digit:
   - T2's Instrument A/B;
   - C-T2-F's structure-blind G1/G2, which derives `F_p` per leaf;
   - C-T2-U's generic active-tag DP, which derives `F_p` literally for all 761 leaves at `CB(8,95)/508`;
   - my closed-form recomputation (part E).

   | Row | `n` | `α` | `x` (through `α`) | `p = x + 2` | Window |
   |---|---|---|---|---|---|
   | `CB(8,95)/508` | 1618 | 856 | 506 | 508 | `[508,570]` |
   | `CB(7,109)/510` | 1638 | 873 | 508 | 510 | `[510,582]` |
   | `CB(8,98)/524` | 1669 | 883 | 522 | 524 | `[524,588]` |
   | `CB(7,112)/524` | 1683 | 897 | 522 | 524 | `[524,598]` |

   At every row, `p = ⌊(2dm+4)/3⌋`, `3p < 2α + 1`, and every leaf (arm and private) is favorable. `|F_p|` equals the leaf count
   (761, 764, 785, 785). `S < 0`.
2. **`supply − capacity = S`: the equality is RETAINED; the independence claim is STRUCK.**
   - The equality is now backed from genuinely independent sides: C-T2-F's G2 and C-T2-U's generic DP, each validated against
     literal enumeration on 60 and 44 random or CB trees respectively, against the `q_v` route.
   - The return's "structurally unrelated / genuinely independent" wording is STRUCK (C-T2-F finding 4). After the product rule,
     `network_dual` is the (WID) bijection written as a factor `x`: the arm term `x²(1+2x)^{dm}` against `q_v = [y^j]y(1+2y)^{dm}`.
   - "Equals `S` … verified" is STRUCK as a shipped-code claim (C-T2-U). No shipped script compares `S_network` with `S`, and
     `myrows_basic.py` still asserts the Cycle 5-struck same-source identity.
   - The fixed points `K_{1,12}/8`, `(2,3,4)/7` and `(2,2,4,3)/8` are reproduced by both critics.
3. **E1(i) at every `q` is RETAINED, now exact.** The return cites the threshold key: `p = ⌈μ₁⌉ + 2` holds with equality at all
   four rows, with `μ₁ = 1011/2, 1523/3, 1043/2, 1565/3`, which I confirmed. Both critics then checked the cleared form
   `r_q(p−q) ≤ r_q(p−q−1)` for every `q = 1..m`, exactly and without Darroch, with no failing `q`. I replayed both scripts
   (byte-identical) and ran my own binomial-sum check (part D), again with no failing `q`. **The Darroch qualifier is discharged at
   these rows.** The composition now rests on E1-R (`proved_informal`, with its CD-1 dependency) and the finite certificate.
4. **The sector certificate is RETAINED.** The values are `θ* = 96/604265, 32/317857, 96/642947, 8/83889`. Min source outflow is
   exactly 1, max in-sector inflow is exactly 1, `(d−γ)σ(γ) ≤ θ*γ` for `γ = 1..d−1`, and `θ* ≤ 1 − ρ_(1,d)`. Evidence:
   - both critics' verifiers, which I replayed; C-T2-U's `cert_verify.py` output is byte-identical;
   - my own exact sequential min-plus/max-plus verifier (`adj_cert_verify.py`), coded from the model statement, reading both
     critics' tables as data: **CERTIFIED** at all four rows;
   - the two critics' tables are identical entry for entry at every shared row;
   - the σ-table for `CB(8,95)` equals T2's shipped print.

   Struck or narrowed:
   - **"Margins ≥ 31×" is STRUCK.** At `CB(8,95)/508` the exact margin is `4051244613614535235/130708222909490304 ≈ 30.9946`. It is
     also a property of the LP optimum chosen, not of the instance.
   - "LP + DP = two instruments" is **narrowed** to one local model checked two ways (the Cycle 5 lesson).
   - "`ρ_(1,d)` by two independent formulas" is **narrowed** to two codings.
   - "Per-state tables shipped as data" is **STRUCK as stated**: only σ was shipped. The full `pb`/`pc`/`σ`/`θ*` tables are
     critic-supplied: `crit_cert_tables.json` `9c41343c…` and `CERT-TABLES.json` `37b450e6…`.
5. **The literal laboratory (ruling 49) is ABSENT from the return and critic-supplied, concordantly:**
   - C-T2-F ran all four actual rows, covering every `γ`.
   - C-T2-U ran `CB(8,95)/508` in depth (43 sources, 22,531 literal arcs, 15 targets, 24 switch images) and the other seven rows at
     smaller size.

   Both laboratories are sampled. C-T2-U's structural argument shows that the certificate's Out, In and switch-load functions are
   exactly the literal network's restricted to the sector:
   - in a sector source every hub and `s` are absent;
   - the only switches insert `s` (landing on a weight-0 target) or insert `u_i` at a choke with exactly one `b`, which removes
     `r` and that `b` and lands on weight `γ`;
   - in-sector targets have exactly one `b`-addition and one `c`-addition preimage per empty leg;
   - a switch image has exactly `d − γ` sector preimages.

   I checked this argument against SEMANTIC-CONTRACT §1.2, and it holds. So the certificate is exact over every sector source and
   target, not merely sampled.
6. **The composition is RETAINED, with its text corrected.**
   - The direction is: fractional flow (E1-R's deletion-only flow on `r`-free sources, plus the sector certificate, with outflow
     scaled from `≥ 1` down to `= w_F(B) = 1`) ⇒ (HALL-COND) for every `X` by summation (B7) ⇒ an integral saturating flow by
     (HALL⇒FLOW). The return stated this backwards (C-T2-U 2).
   - "In-sector targets get 0 from (i)" holds only because E1-R is deletion-only. In-sector targets DO have positive-weight
     `r`-free switch preimages (C-T2-F: 4234 at the argmax; C-T2-U: 13,474).
   - Coverage by source and target class is complete (C-T2-F attack 1).
7. **Scope is rows, not trees** (C-T2-U 4). Each certificate is (HALL) at the first eligible rank only. The ranks `p+1 … ⌊2α/3⌋`
   (62, 72, 64 and 74 further ranks) are open, and none of these four trees is CLOSED.
8. **Minor strikes.**
   - "Which is why they are the smallest members …" is an unbacked gloss (C-T2-F 9).
   - The brute-force size labels are cosmetic (C-T2-F 10).
   - `F_p` is derived per class representative in T2's code and hard-coded in `network_dual.py`. This is harmless: the critics
     derive it per leaf.
9. **The name `E993-R30-FOUR-CB-FIRST-ELIGIBLE-RANKS-…` is WITHDRAWN** (ruling 48: it does not name its object, and it is a 13/14-token
   near-alias of the registered FIVE-CB key). The critics differ slightly. C-T2-F says a separate key and no edit of FIVE-CB;
   C-T2-U says a scope note or an exact key. **Resolution:** a sealed registered statement is never edited, so the rows go under a
   NEW key whose name enumerates the `(d, m, p)` triples, or into the `R30-CB-RECORD` scope note. The registry is not in my capsule,
   so the synthesis makes that decision after an alias check.

**The critic-derived advance: six more rows.** For each of the six rows below, the table gives `θ*`, the exact margin, the
grade, and whether my own recomputation (part E) confirms the row data, E1 at every `q`, and the certificate.

| Row | `θ*` | margin | C-T2-F | C-T2-U | mine (row data, E1 all `q`, certificate) |
|---|---|---|---|---|---|
| `CB(8,101)/540` | `96/682829` | 32.95 | certified + lab | certified + lab | yes |
| `CB(7,115)/538` | `64/707469` | 41.14 | certified + lab | certified + lab | yes |
| `CB(8,104)/556` | `96/723911` | 33.92 | certified + lab | certified + lab | yes |
| `CB(7,118)/552` | `64/744785` | 42.21 | certified + lab | certified + lab | yes |
| `CB(7,121)/566` | `16/195765` | 43.28 | certified + lab | — | yes |
| `CB(8,107)/572` | `96/766193` | 34.90 | certified + lab | — | yes |

In each row: `p = x + 2 = ⌊(2dm+4)/3⌋ = ⌈μ₁⌉ + 2`, the sector ratio is exactly `p/(p−1)` (switch-necessary), and every leaf is
favorable. My part E gives `n` and `α` as 1720/910, 1728/921, 1771/937, 1773/945, 1818/969 and 1822/964.

- The first four rows have two concordant critic pipelines, which share the LP tables but have independent verifiers and
  laboratories, and my third verifier.
- The last two rows have C-T2-F's pipeline plus my verifier.
- C-T2-U took all six from the census pointer. Its "smallest next `CB(7,121)/566`, `CB(8,107)/572`" confirms that the last two are
  census members too.

**Grade:** `computer_assisted`, STATED, **critic-attributed**; each row needs an isolated second read. If they are confirmed, the
uncertified count goes 218 → 208, at the census of record.

**T2 route verdict:** `proved_conditional` is **retained** as `computer_assisted` whole-row (HALL) at four `(T,p)` instances. The
condition is E1-R at its registered `proved_informal` grade. The threshold-key and Darroch dependency is discharged at these rows
by the exact check.

## Cross-route reconciliation

- **T2's data feeds T1's object.** Across 13 distinct rows (the three registered `d = 8` values, T2's four and the critics' six),
  the per-state tables are the fitting data T1 asked for. **An adjudicator-derived bounded observation (`conjecture`), from
  `adj_T_instr.py` part F:**
  - Every `d = 8` value of record, `m ∈ {86, 89, 92, 95, 98, 101, 104, 107}` (all `m ≡ 2 (mod 3)`), equals
    **`θ*_8(m) = 288/(200m² + 82m + 5)`** exactly. The quadratic `1/θ*` fitted on 86, 89 and 92 predicts all five out-of-sample
    values. Both T1 critics found the same law from four points, and I extend the out-of-sample check to five.
  - The `d = 7` rows `m ∈ {109, 112, 115, 118, 121}` (all `m ≡ 1 (mod 3)`) fit **`θ*_7(m) = 1152/(959m² + 449m + 32)`**. This is
    fitted on 109, 112 and 115, and exact at 118 and 121.
  - These are laws of the LP optimum, the minimal `θ` of one affine-relaxed local model. They are not instance facts and are not
    evidence.
- **Scoping fact for `𝒞_8`.** This is bounded, and the two exact sweeps are concordant (C-T1-F `first_rank_gap`; my summary of
  C-T1-U's rows): `p* − x` equals 2 at `m = 136`, 3 from `m = 161`, 4 from 242, 5 from 320 and 7 by 500. So for large `m`, `p*` is
  an interior eligible rank, and the first eligible ranks `x + 2 < p*` are separate rows. At those rows E1 fails from `m = 161`
  (the record), and the sector is still deletion-deficient, since the ratio `2(dm−K+1)/K` only grows as `K` decreases. A uniform
  theorem on `𝒞_8` would therefore certify ONE rank per tree. It closes no tree and does not touch the first-rank frontier beyond
  `m ≈ 160`.
- **Darroch hygiene flag** (C-T1-F F6; endorsed as a flag, not a ruling). The registered `d ≤ 6` sector key states
  `x(CB(d,m)) ≥ ⌊(2dm+2)/3⌋` "modulo Darroch". If its proof applies Darroch to `I(CB(d,m))`, or to any non-product tree polynomial,
  that step is invalid by the finding above. Its statement is bounded-true on 900 rows (C-T1-F, `d ≤ 6`, `m ≤ 150`). The proof is
  outside my capsule. **The synthesis should route it to a second read**, which should check that every "modulo Darroch" key
  applies Darroch only to real-rooted inputs. The E1 threshold key passes this test: its `r_q` are products of linear factors.
- **Controller-facts corrections** (weighed as one more replay):
  - **CF-T2's `θ*` list `96/604265, 32/120853, 288/604265, 336/604265` is wrong.** It is `σ(4..7)` of `CB(8,95)/508`, which I checked
    against T2's print and both tables. The four `θ*` are `96/604265, 32/317857, 96/642947, 8/83889`. Both T2 critics found the same
    error in the attack brief. CF-T2 also repeats "margins ≥ 31×", which is struck.
  - **CF-T1 grades Claim 1 `proved_informal` for `m ≥ 246` without flagging the false lemma.** That grade is struck. CF-T1's
    "the adjudicator checks the gap 239–245 row by row" is discharged by two exact critic sweeps.
  - CF-0 and CF-REPLAY-c6d on the E1 threshold identity are concordant with my algebra and the critics'.
- **No refuted mechanism is revived.** T1 proposes no mechanism. T2's mechanism is the registered homogeneous sector certificate
  plus E1-R on literal (D) ∪ (S) with active weights, and the sector is deletion-deficient by exactly `p/(p−1)`, so the certificate
  is not deletion-only Hall. No closed region is re-proved (the lower region; `n` well above `2p+2`). No census value enters a
  proof. There is no RTree wording.

## Established results

The grade is stated for each. "STATED" means first stated at a review stage and awaiting a second read.

1. **T1-attributed.** Closed forms for `I(CB(d,m))`, `I(CB(d,m) − v)` and `I(CB(d,m) − c)`: `proved_informal`, elementary, four
   instruments. `α(CB(d,m)) = m(d+1) + 1`.
2. **T1, extended by critics.** Bounded record at `d = 8`, `p* = ⌊(16m+4)/3⌋`, `m ∈ [106, 2395]`, contiguous: `x ≤ p* − 2` except
   exactly at `m ∈ {106, 109, …, 133}`, where `x = p* − 1`. The arm leaf and every private leaf are favorable at `p*`, and
   `3p* < 2α + 1`. **Grade:** `bounded_computation`, exact; two instruments to 500, one beyond.
3. **C-T1-F lemma** (critic-attributed; STATED; `proved_informal` modulo Darroch/Newton on products of linear factors). Every leaf of
   `CB(d,m)`, `d ≥ 6`, is favorable at `⌊(2dm+4)/3⌋` when `dm ≢ 2 (mod 3)`, and the arm leaf is favorable for every `m`.
   - The hypotheses consumed are `d ≥ 6`, `m ≥ 1` and the literal `CB(d,m)`. `IsTree` is not needed: the lemma is a statement about
     the explicit polynomials. Finiteness is automatic. The invariance used is `S_d ≀ S_m` transitivity on private leaves.
   - With the E1 threshold key, which gives E1(i) at `p*` on `𝒞_8` by citation, and with the bounded (a), this gives
     (ELIG-top) + E1 on `𝒞_8` for `m ≤ 2395`. Beyond 2395 it gives favorability and E1 but not eligibility.
4. **E1(i) at `p*` on all of `𝒞_8`, and on the `d = 7` analogue by the same algebra, by citation** of the registered threshold key.
   The citation is exact (threshold = `p*` for `m ≢ 1 (mod 3)`). **Grade:** `proved_informal` modulo Darroch, the key's own grade.
   It is a citation, not a new result.
5. **T2.** Whole-row (HALL), with switch arcs load-bearing, at `CB(8,95)/508`, `CB(7,109)/510`, `CB(8,98)/524` and `CB(7,112)/524`,
   each at its first eligible rank. **Grade:** `computer_assisted`, STATED. It is conditional on E1-R (`proved_informal`, CD-1).
   E1(i) is exact at the rows (Darroch-free). The literal laboratory and the structural fidelity argument are critic-supplied.
6. **Critic-attributed rows** (C-T2-F, with C-T2-U on the first four): whole-row (HALL) at `CB(8,101)/540`, `CB(7,115)/538`,
   `CB(8,104)/556`, `CB(7,118)/552`, `CB(7,121)/566` and `CB(8,107)/572`, at the same grade and conditions. STATED.
7. **Data** (not evidence): the full per-state tables for ten rows (`CERT-TABLES.json` `37b450e6…`; `crit_cert_tables.json`
   `9c41343c…`; `crit_extend_{a,b}.json` `4b1b7c70…`, `a22aa73b…`), and the `θ*` laws of Cross-route reconciliation (`conjecture`).
8. **No compiled declaration** exists in the T portfolio. No `#print axioms` output was shipped, so none is to be confirmed.

## Rejected and narrowed mechanisms

- **Struck:**
  - T1's forest real-rootedness citation and every conclusion drawn from it. That includes Claim 1 at `proved_informal` for
    `m ≥ 246`, "for all `m` to infinity", "essentially closed" and "it does close".
  - The "strictness subtlety" diagnosis.
  - "`[239,245]` covered by both".
  - "exact coefficients to `m = 2000`" and "3000 further integers".
  - The obligation (ii) scoping finding and "open for `m > 400`" on `𝒞_8`.
  - The alias ground and the candidate key `…-CB-EIGHT-…`.
  - T2's "margins ≥ 31×".
  - "structurally unrelated / genuinely independent" (§3).
  - "per-state tables shipped as DATA", as stated.
  - "which is why they are the smallest members".
  - The §7 inference direction (corrected above).
  - CF-T2's `θ*` literals.
- **Narrowed:**
  - T2's "two instruments" (LP/DP) to one local model checked two ways, now joined by a critic literal laboratory and three
    independent verifiers.
  - T2's "`ρ_(1,d)` by two independent formulas" to two codings.
  - T2's "whole-row" to "one rank per tree".
  - T1's `bounded_evidence` to closed forms plus a bounded record.
- **Plans, not lemmas:** T1's "single `m`-independent per-choke certificate". It is refuted as stated, because the budget
  `1 − ρ_(1,8)(p*) ≍ 0.468/m → 0` forces `θ` to shrink with `m`, and the data law has `θ* ≍ 1.44/m²`.
- **Refuted mechanism keys:** none revived. No mechanism here is new.

## Lean readiness

- **(WID)** at the exact statement of `SOLUTION-CONTRACT.md` §2 is already `formally_verified` (`activeWeightAggregateIdentity`;
  Main `86b59c6c…` per gate ruling 47). It is not part of this cycle's T portfolio and is not re-proved. No action.
- **Restricted-scope (HALL) in this portfolio.** There are ten single `(T, p)` rows. All are `computer_assisted`, finite, and depend
  on the LP tables. **A bounded result never qualifies. NOT contract-ready.** A Lean route would need a kernel check of each
  row's certificate on a network with more than `10^{360}` sources. That is out of scope, and a `decide` over an enumeration is
  forbidden for universal steps.
- **The C-T1-F favorability lemma.**
  - (a) *Informal proof:* complete at statement level, with a closed DAG:
    - N1: the closed forms (elementary);
    - N2: binomial expansion into blocks (elementary);
    - N3: block means (elementary);
    - N4: Tool (D) (Newton strict log-concavity plus Darroch's mode–mean theorem, both classical and NOT under `sources/`);
    - N5: the `R`-term ratio (elementary);
    - N6: the paired-block factorization (elementary);
    - N7: orbit transfer (elementary).
  - (b) *Compiled fragments:* none.
  - (c) *Open nodes:* N4. It is informally closed only modulo two undischarged classical dependencies, and no carried fragment
    supplies either.
  - It is also not a (HALL) scope. It is one of three premises of T1's composition. **NOT contract-ready** for the terminal
    Stage 7.
- **T1's object** (uniform switch-arc (HALL) on `𝒞_8`): no informal proof exists. NOT ready.

**Award groups of orientation T that are contract-ready: NONE.**

**Smallest unproved lemmas**, in order of how close they are to closing:
1. `(ELIG-top)(a)` uniformly: `i_{p*−1}(CB(8,m)) < i_{p*−2}(CB(8,m))` for every `m ≥ 2396`, `m ≢ 1 (mod 3)`.
2. `(L-S)_top` uniformly on the `d = 8`, `m ≡ 2 (mod 3)` class: feasibility of the per-choke LP at `θ = θ*_8(m)` with closed-form
   `pb`, `pc` and `σ` in `m`.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

Material progress this cycle, at its grades:
- Ten new first-eligible-rank whole-row (HALL) certificates on switch-necessary CB rows, all `computer_assisted` and STATED: four
  from T2 and six critic-attributed. Each is Darroch-free at the row, and each has a literal laboratory. Together they would take
  218 uncertified rows to 208, subject to second reads.
- One new lemma at `proved_informal`, pending its second read: the C-T1-F favorability lemma, uniform in `m` and in `d ≥ 6`.
- A substantive record correction: a false classical citation struck before it could enter any key.
- Exact bounded extensions: (ELIG-top) to `m = 2395`, and the `θ*` laws.

This is non-decisive progress under `SOLUTION-CONTRACT.md` §5. There is no decisive event from orientation T: (HALL) is not
formally verified, and no deficient cut has been produced. The plateau conditions are not met, because there is a new lemma at
`proved_informal` (pending) and there are new restricted rows. The stop gate needs nothing from T. This is the terminal cycle, and
the run proceeds to its terminal close regardless.

## Headline assessment

headline_resolved: no
status: still_open

By statement, at orientation T's evidence grade:
- **(HALL)** is `still_open` at full scope. Orientation T supplies ten more finite restricted rows (`computer_assisted`) and no
  deficient cut. The restricted scopes of record (the `G_k` family, the spider family, the six closed trees) are untouched by this
  portfolio.
- **(WID)** is `proved`, and in fact `formally_verified` by its prior award. Nothing here bears on it.
- **Outcome-B candidates in this portfolio:**
  - the C-T1-F favorability lemma: `proved_informal` modulo Darroch/Newton, STATED, second read owed;
  - `(ELIG-top)(a)`: open, bounded to 2395;
  - `(L-S)_top`: open, with no informal proof and only a `conjecture`-grade `θ*` law;
  - T1's `(ELIG-top)` "uniform" claim: struck.
- The primary aggregate is untouched.

## Next-route allocation

**Exact remaining obligation for orientation T.** A parameter-uniform (HALL) with switch arcs load-bearing on an infinite CB class
at `p* = ⌊(2dm+4)/3⌋`. It needs three premises plus composition:
- `(ELIG-top)`: favorability, which is now informally proved (C-T1-F lemma, pending second read); and eligibility `(a)`, which is
  OPEN beyond `m = 2395`;
- E1 at `p*`, which is closed on `𝒞_8` by citation;
- `(L-S)_top`, which is OPEN;
- composition by B7 with E1-R.

This is a successor-run inheritance, since there is no Cycle 7. Two routes:

1. **`T-SUCC-1` uniform eligibility descent by block mixture.**
   - Write `I(CB(8,m)) = Σ_j C(m,j)(1+2x)x^j(1+x)^{8j}(1+2x)^{8(m−j)} + x(1+x)(1+2x)^{8m}`.
   - Blocks with `j ≥ 4 + ε` strictly decrease at `p* − 2` by Tool (D). Prove an explicit quantitative domination of the few
     increasing low-`j` blocks and the last term. Their binomial weight `C(m,j)·256^j·6561^{m−j}` is exponentially small relative
     to the bulk near `j ≈ 0.0376m`, while per-block relative descents are bounded below. A Newton-type ratio bound
     `P_{k+1}/P_k ≤ 1 − c/√m` for blocks with mean `≤ k − Ω(m)` would suffice.
   - **Could close in one cycle:** `(ELIG-top)` on `𝒞_8` and its `d = 7` analogue for every `m`, at `proved_informal` modulo
     Darroch/Newton. Composed with the C-T1-F lemma and the E1 key, this closes two of T1's three premises uniformly.
2. **`T-SUCC-2` closed-form sector certificate on one residue class.**
   - Target: `d = 8`, `m ≡ 2 (mod 3)`, where `p* = (16m+4)/3` exactly and the sector ratio is `p/(p−1)`.
   - Fit closed forms in `m` for `pb(β,γ)`, `pc(β,γ)` and `σ(γ)` at `θ = θ*_8(m) = 288/(200m²+82m+5)`, from the eight `d = 8`
     rows of record, all in this class. Five of them (`m = 95, 98, 101, 104, 107`) have full per-state tables shipped by the
     critics; the three registered rows (`m = 86, 89, 92`) contribute only their `θ*` values here. Validate the forms at a fresh row (for example
     `m = 110` or `113`) with the literal laboratory BEFORE any uniform claim.
   - Then prove uniformly: `Out ≥ 1` (per-size minima and a knapsack convexity argument), `In ≤ 1`,
     `(8−γ)σ(γ) ≤ θ*_8(m)γ`, and `θ*_8(m) ≤ 1 − ρ_(1,8)(p*)`. The last holds with a margin that grows like `m/3` in the data.
   - Compose by B7 with E1-R and the E1 key.
   - **Could close in one cycle:** with route 1, a `proved_informal` restricted (HALL) at one rank per tree on an infinite
     switch-necessary family `{(CB(8,m), (16m+4)/3) : m ≡ 2 (mod 3), m ≥ m₀}`, under a separate key that names the family and the
     rank.
   - **Scope, stated on the face:** one rank per tree. The first eligible ranks below `p*` for `m ≳ 160` stay open.

**Fallback (record work, not a route).** Run the same four-part per-row pipeline (structure-blind row data with `F_p` per leaf;
LP table verified exactly and shipped; literal laboratory; exact all-`q` E1) down the 208 remaining rows, smallest first. This is
bounded, never uniform.

**Second reads owed from orientation T:** the C-T1-F lemma, with a full registry alias check; T2's four rows; the critics' six rows;
the naming decision for the rows (a new exact key or the `R30-CB-RECORD` note, never an edit of the FIVE-CB statement); and the
Darroch hygiene check of the `d ≤ 6` sector key's proof.

## Artifact inventory

**Deliverable:** this file only,
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/cycles/cycle-6/stage5/adjudicators/T/ADJUDICATION.md`.
I created the empty `adjudicators/T/` directory for it.

**Scratch:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-adj-T/`. Everything
was run with `python3 -B`, using the standard library and exact `int`/`Fraction`, and no bytecode is present.

| File | SHA-256 | Role |
|---|---|---|
| `seal_check.py` | `b2b9486518c2403cb92f3429ae27cd760cc4301ef1d351bec4df658238f71f3f` | capsule inner seal; 21 member digests |
| `seals2.py` | `8f3e8e5aa2338edbd2958ce4a2a55ed6a441e054d05aba44e8a89be050f25905` | Stage 2/3/4 manifest seals and member digests (digest-only reads; disclosure 1) |
| `adj_T_instr.py` | `46a1a252122c7d164371d4ceb9e93ab3d9f92c0ea902ac52161a766c6ce7d808` | own instrument: A closed forms against own DP (108/0; tree negative controls); B own Sturm; C block lemma at new rows (244/194, 0 violations); D exact all-`q` E1 at ten rows; E row data at ten rows; F `θ*` laws |
| `adj_T_instr.log` | `a38452942a44e2241e4ec34133b0e7c99bcf33edf18b1520be3d36c05cc84c76` | its output; `RESULT_DIGEST_SHA256 91d89a50b684b8540d929f3b3cd4ffe000ae8d6c0285e996e685d4f61e9a9d4b` (ran as PID 90703, exited) |
| `adj_cert_verify.py` | `9e7e2fff8923c3d9d80889d5765408a0f42fba2a9bdbe2cedd73a167bc3f8003` | own exact sector-certificate verifier over both critics' tables; cross-compares the tables |
| `adj_cert_verify.log` | `9ab511a4b4a8a9878e235c1cb076d7df55274032f27ce3a926bdd56efb8bf054` | CERTIFIED at all ten rows; tables identical; `RESULT_DIGEST_SHA256 1b5f9e9d26eef8222615373b1d6ca98abd24b78f221a6676d6896adea5bdf9cf` |
| `c1u_sweep_check.log` | `27b08ad8c646a7e2464c0cb7ad489bb9a14378ce0ddfd9aeb2769892c09798a7` | my summary of C-T1-U's shipped `[106,500]` rows: contiguous, ten (a) failures, `p* − x` growth |
| `rp-T1F/` | copies (digests as C-T1-F's inventory) | replays `re_realroot_test.log`, `re_closed_form_validate.log`, `re_e1_threshold_and_theta.log`, `re_block_proof_check.log`, `re_sweep_summary.log`: byte-identical to the shipped logs; `re_sturm_sanity.log` `870cc557…`, matching the critique's listed digest |
| `rp-T1U/` | copies | `sweep_106_500.json` `d27eaaa2…` (data only); `rr_check.py` and `theta_fit.py` copied, not run |
| `rp-T2F/` | copies | `re_crit_e1allq.txt`: byte-identical |
| `rp-T2U/own/` | copies | `re_cert_verify.txt`, `re_e1_allq.txt`: byte-identical |
| `rp-T2/` | copies of T2's scripts, outputs and `inherited/` (all digests as T2's inventory) | not re-run: both critics replayed them byte-identically, and my verifier re-derives the certificates |

**Replay:**

```
cd scratchpad/c6-adj-T
python3 -B seal_check.py
python3 -B adj_T_instr.py
python3 -B adj_cert_verify.py
cd rp-T1F
python3 -B block_proof_check.py
python3 -B realroot_test.py
python3 -B summarize_sweep.py sweep5000.jsonl
```

`adj_T_instr.py` takes about 3 minutes, and `adj_cert_verify.py` about 1 minute. No background job is running: PID 90703 was
confirmed exited before this write.
