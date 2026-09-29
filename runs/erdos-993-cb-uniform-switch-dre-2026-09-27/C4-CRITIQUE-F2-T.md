# Critique

**Critic:** `C-F2-T`, a cross-orientation critic of orientation T (prove), Cycle 4 Stage 4 of r31.
**Assigned return:** seat `F2`, route `C4-F-02`, mechanism token `COMPOSED-FLOW-PER-TARGET-AT-FRESH-ROWS`, orientation F (falsify),
`cycles/cycle-4/stage3/returns/F2/RETURN.md` (SHA-256 `61c3a1586c01b13eeb36746d1d98c231aeeea397020a938d6c3c63d8c5caaea2`).
**Date:** 2026-09-29 (host clock at close, EDT).

**Boot.** I am operating within VerityOS under the RESTRICTED BOOT. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch
`control/dispatch/c4-stage4/DISPATCH-C-F2-T.md`. Its SHA-256 `ec6e9509a22a96e0263ff3b257e89db84bca6301a2eec226edd11832486ec383`
matched before I followed it. I read no other VerityOS file outside the run root, and I wrote no conversation log, memory, log or
decision. The two-part model disclosure line is under `## Verdict`.

## Identity and seal audit

- **Capsule seal.** `control/c4-critic-capsules/F2-PACKET-MANIFEST.json`. I recomputed SHA-256 over the canonical JSON without
  `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline) and got
  **`6871ecf22481ac91e656861a06bad69c77f5ff949bb6c5b6655b608043be9401`**, which equals the recorded value. All 16 members match
  their recorded bytes and SHA-256.
- **Nested seals.** I recomputed each one the same way, and each equals its recorded value:
  - Stage 4 dispatch manifest: `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023`.
  - Stage 3 packet manifest: `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e`.
  - Stage 2 packet manifest: `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`. This is also the digest the return cites.
- **Return identity.** The route ID `C4-F-02` and the mechanism token appear verbatim. The return's SHA-256 equals the capsule
  entry and the Stage 3 admission entry.
- **Every digest the return lists** (its table, 14 rows).
  - I recomputed 13 of them and all match. They cover the contracts, the allocation, the Stage 1 gate, the worker brief,
    `C4-FROZEN-STATEMENTS.md`/`.lean`, and the five `sources/c4-base/LeanProject/LeanProof/*.lean` files.
  - I checked `cycles/cycle-4/stage2/ROUTE-STATE.md` (`2fd375f8…c13`) against its Stage 2 manifest record without reading the file,
    because it is outside my grant. It matches.
  - `Statements.lean` is byte-identical to `control/C4-FROZEN-STATEMENTS.lean` (both `0fc723d7…`).
- **Generator digests and replay.** I replayed copy-out-first into `scratchpad/c4-crit-F2-T/replay-run/`, never `/tmp`.
  - `composed_flow_check.py`: `e239be38…f634c`, which matches the return.
  - `tree_check.py`: `b95ad75e…63167`, which matches the return.
  - The replay of `composed_flow_check.py` exited 0. Its `stdout.log` is byte-identical to the shipped
    `scratchpad/c4-F2/stdout.log`, and its `results_summary.json` is byte-identical (`eb77aa9d…8775`).
  - The replay of `tree_check.py` exited 0 and its stdout is byte-identical.
  - **Digest-literal semantics.** The return's stdout digests are hashes of stdout with the trailing newline removed, not of the log
    files.
    - `ee18355736e2…7cc`: the file hash of `stdout.log` is `c4eb1d3e…b4c0`; stripping the final newline reproduces `ee183557…`.
    - `eb30e121…862f`: the file hash is `369718e3…e3`; stripping the final newline reproduces `eb30e121…`.
    - Both literals are therefore backed. The convention is not stated on the return's face; I record it here.
- **Interruption consistency.**
  - The shipped scratch has `composed_flow_check.py` at 09:55, its outputs at 10:01, and `tree_check*` at 22:51 (2026-09-28).
    It agrees with RETURN.md and with my replay. Every number printed in Parts 0–3 comes from the post-fix script.
  - The switch-guard bug the return discloses lived only in `literal_gsec` (Part 4). Parts 0–3 never call it, so **no reported
    number predates the fix** (this answers the attack brief's question).
  - I did not treat the stray pre-interruption `stdout.log` the return mentions as evidence, and I did not need to. The file now
    shipped equals my replay.
- **Admission defect for F2** (`FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`). There is one occurrence, at line 258:
  "`proved_informal`/`formally_verified` keys they cite". It describes the grades of cited keys. It does not label F2's own scratch.
  **Allowed citation; nothing struck on this ground.** No other admission defect is listed for F2.
- **My read boundary.**
  - Content I read:
    - the capsule's members;
    - `sources/c4-base/LeanProject/LeanProof/{Main.lean (entries 14–20, 23–27, 79–94), ChokeState.lean, E1FlowConstruction.lean §1–4, Statements.lean}`;
    - `sources/r30/records/SEMANTIC-CONTRACT.md` §1.1–1.2;
    - a key scan of `sources/authority/CLAIM-IDENTITY.json`.
    All of these are under `sources/`, which the dispatch authorizes.
  - I read copies of the F2 artifacts in my own scratch. I made one non-recursive `ls -la` of `scratchpad/c4-F2/`, which is the
    granted artifact directory.
  - **Disclosure:** I hashed, without reading their content, three files in `control/`: `C4-WORKER-COMMON-BRIEF.md`,
    `C4-FROZEN-STATEMENTS.md` and `C4-FROZEN-STATEMENTS.lean`. The purpose was to verify the return's digest literals. The protocol
    names them as Stage 2 members a critic may read, but the dispatch's file list does not include them.
  - I ran no search rooted above my grant. I used no network and installed nothing. I read no other return, critique or
    adjudication.

## Independent re-derivation

**Instrument.** `scratchpad/c4-crit-F2-T/crit_f2t.py` (SHA-256 `6ba35369ee65e8702f5138ca7d716fa01e8ba2809569bdf5c957ae30b716814a`)
uses the standard library only, with exact integers and `Fraction`.
- I built it from SEMANTIC-CONTRACT, r30 SEMANTIC-CONTRACT §1.1–1.2 and the Lean text of the definitions of record. It never
  imports or calls F2's code.
- It builds the literal graph from the `cbEdge` labels. Independence polynomials come from a generic rooted tree DP on the literal
  edge list, with deletion sets.
- The E1 layer (`cb8N`, `cb8R`, `cb8Rho`, `cb8E1G`, `cb8H`, `cb8E1Val`, `cb8E1Arc`) is transcribed from `E1FlowConstruction.lean` with
  Lean's conventions: `x/0 = 0`, integer `j`, and natural-number truncation. `cb8R` uses two paths (binomial sum and prefix sums of
  `cb8N`), which I asserted equal.
- The frozen `cb8GSec` is evaluated literally, following its guards: `IsSectorSource`, layer membership, `transportRel`, and the
  set-difference labels with `chokeState` read from the source.
- The run is `scratchpad/c4-crit-F2-T/run2/`. It exited 0. `stdout.log` has SHA-256 `72010eb7…820d`, and the in-text digest is
  `16fca9d2194495d294872e4e8725ec4459341f8188276d387129efe1ee546ef6`. `crit_summary.json` has SHA-256 `d2d0a291…42eb3`.
- A supplement, `adv_literal.py` (`52d8046c…13d6`), was run in `scratchpad/c4-crit-F2-T/adv/`. It exited 0, with stdout
  `8f5ebc56…14202` and in-text digest `f7542939…7762`.

**P0: fixed points, reproduced before any fresh row.** My own tree DP gives:
- `CB(8,107)`: `n = 1822`, `α = 964`, `x = 570`, `p* = 572`.
- `CB(8,95)`: `n = 1618`, `α = 856`, `x = 506`.
- `x` is the least `k` with `i_{k+1}(T) < i_k(T)`, zero-extended through `α`.
- `θ(107) = 96/766193`, `θ(95) = 96/604265` and `σ(95, 1..3)` match the record.
- `ρ_1(95) = 1354839571516225/1361543988640524` from both `cb8R` paths.
- `R_K/R_{K−1}(95) = 508/507`.
- `(1 − ρ_1(107))/θ*(107) ≈ 34.9009`.

All agree with SEMANTIC-CONTRACT §5.

**P1: eligibility, selector and (WID) at the fresh and structural rows.** Every value is exact. Difference indices are written
textually:
- `x = min{k : i_{k+1}(T) − i_k(T) < 0}`;
- the selector test is `Δ_{p*}(T − ℓ) = i_{p*+1}(T − ℓ) − i_{p*}(T − ℓ) < 0`;
- the parent descent is `i_{p*−1}(T) − i_{p*−2}(T) < 0`.

| m | n | α | p* | x | `x` vs `p*−2` | eligible | parent descent | `F_{p*}` derived | (WID): side A = side B | `S(T,p*)` |
|---|---|---|---|---|---|---|---|---|---|---|
| 158 | 2689 | 1423 | 844 | 842 | `x = p*−2` | yes | yes | leafSet (1265 tags) | equal | < 0; 605 digits, SHA-256 of decimal `ebda3c7e…d6ee` |
| 161 | 2740 | 1450 | 860 | 857 | `x < p*−2` (structural) | yes | yes | leafSet (1289 tags) | equal | < 0; 617 digits, `0a853501…c001` |
| 164 | 2791 | 1477 | 876 | 873 | `x < p*−2` | yes | yes | leafSet (1313 tags) | equal | < 0; 628 digits, `a5133e02…d6c0` |

- **Selector.** The selector is derived, not cited. `Δ_{p*}(T − v) < 0`, and `Δ_{p*}(T − c)` is negative and identical at three
  private leaves (`c(0,0)`, `c(m−1,7)`, `c(⌊m/2⌋,3)`). The `8m` private leaves form one automorphism orbit.
- **(WID) side A.** Supply minus capacity is the coefficient difference `[y^{p*+1}] − [y^{p*}]` of the weight generating function
  `W(y) = y²(1+2y)^{8m} + 8m·y²(1+y)^7(1+2y)·G(y)^{m−1}`, with `G = y(1+y)^8 + (1+2y)^8`. I derived `W` from the literal active-tag
  rule: a sector set carries tag `v` active through `r`, and an open choke `u_i` activates its present private leaves.
- **(WID) side B.** `S = Σ_{ℓ∈F} [q_ℓ(p*) − q_ℓ(p*−1)]`, with `q_ℓ(j) = i_j(T − {ℓ, s_ℓ}) − i_j(T − N[s_ℓ])`. Each term comes from
  tree DP on the literal deleted forests.
- **Literal check of both sides.** They also agree literally on `CB(8,1)` at every rank 1–9 and on `CB(8,2)` at ranks 2–4, with
  exhaustive enumeration and the selector derived at each rank.

**P2: E1, `cb8E1Arc` evaluated through its definition over every r-free class** (this is the object F2 did not evaluate; see
finding F-2).
- **Class reduction.** For an r-free set, the arc value depends only on:
  - `q`, its open-choke count;
  - `w`, its active weight, which is the number of present private leaves at open chokes;
  - whether the deleted vertex is an active tag (the Boolean branch) or a non-choke, non-active element (the ternary branch).

  So a source class `(q, w_B)` with `t_B = p*+1−q−w_B` ternary elements has row `w_B·G/N + t_B·w_B·H/(t_B·N)`.
- **Target column.** A target `(q, w)` with `t = p*−q−w` receives from:
  - `8q − w` Boolean insertions (a private leaf at an empty open leg), each with source class `(q, w+1)`;
  - `2(8(m−q)+1−t)` ternary insertions (`b` or `c` at an empty closed leg, or `s`/`v` in an empty arm slot), each with source class
    `(q, w)`.

  Choke insertions carry 0 by the definition's guard, and `r` cannot be inserted.
- **Coverage.** At every feasible class (`0 ≤ w ≤ 8q`, `0 ≤ t ≤ 8(m−q)+1`, `1 ≤ q ≤ m`), exact integer arithmetic was used:

| m | source classes | negative arc values | row ≠ `w` | target classes (q ≥ 1) | column ≠ `ρ_q·w` | max `ρ_q`, q ∈ [1, m] |
|---|---|---|---|---|---|---|
| 158 | 47,844 | 0 | 0 | 47,937 | 0 | 0.997036870 |
| 161 | 49,675 | 0 | 0 | 49,770 | 0 | 0.997092017 |
| 164 | 51,541 | 0 | 0 | 51,638 | 0 | 0.997145149 |

- **Boundary `t_B = 0`.** The source consists only of chokes and active leaves, which requires `q ≥ (p*+1)/9`. There the ternary
  term is absent, so the row equals `w` only if `H(α) = 0`. That holds because `j = α` forces
  `H = r_q(j) − ρ_q·r_q(j−1) = 0`, and the census confirms it.
- **Cross-checks.** The fast integer path equals the generic Lean-convention path at 9 classes per row. `R_q(j)` and `R_q(j−1)`
  from `cb8N` sums equal the convolution coefficients at `q ∈ {1, 2, ⌊m/2⌋, m}`.

**P3: sector, `cb8GSec`, exact over ALL leg distributions.**
- **Method.** Per leg count `ℓ = β + γ`, I took the extreme state value. Then an exact min-plus DP runs over `m` chokes for the `K`
  source legs, and a max-plus DP for the `K − 1` target legs. All 45 template states have nonnegative `pb`, `pc` and `σ` at every
  row.

| m | min over sector sources of `Σ_i Out(state_i)` | minimizer (leg-count: #chokes @ state) | max over in-sector targets of `Σ_i In(state_i)` | maximizer |
|---|---|---|---|---|
| 158 | **exactly 1** | 1: 60 @ (0,1); 7: 1 @ (0,7); 8: 97 @ (0,8) | **exactly 1** | 0: 37 @ (0,0); 2: 1 @ (0,2); 7: 120 @ (0,7) |
| 161 | **exactly 1** | 1: 61 @ (0,1); 6: 1 @ (0,6); 8: 99 @ (0,8) | **exactly 1** | 0: 38 @ (0,0); 4: 1 @ (0,4); 7: 122 @ (0,7) |
| 164 | **exactly 1** | 1: 62 @ (0,1); 5: 1 @ (1,4); 8: 101 @ (0,8) | **exactly 1** | 0: 39 @ (0,0); 6: 1 @ (0,6); 7: 124 @ (0,7) |

- **Literal check at the extremizers.** I built the extremal sets literally (`|B| = p*+1`, `|A| = p*`, both independent) and
  evaluated the frozen `cb8GSec` and `cb8E1Arc`.
  - The source row is `gsec = 1`, `e1 = 0`.
  - The target column is `gsec = 1`, `e1 = 0`.
  - This holds at all three rows. The bounds are met with **zero slack on both sides**.
- **Switch images** (`q = 1`, `v ∈ A`, choke state `(0, γ)` after the switch). The E1 load comes from P2, from the definition and not
  the spec. `load(1, γ) + (8−γ)σ(γ) ≤ γ` holds for `γ = 0..8`. The minimum slack is `≈ 2.906e−3` (158), `2.853e−3` (161) and
  `2.801e−3` (164). At `γ = 8` there is no switch preimage, and the load is `8ρ_1 < 8`.

**P4: literal validation of the class reductions.** The frozen definitions are evaluated literally throughout.
- **`CB(8,1)`, exhaustive, ranks 1–9.**
  - E1 literal rows match my class formula on all 20,431 r-free sources, and literal columns match on all 766 r-free `q ≥ 1`
    targets.
  - At `p = 6`, the literal `cb8GSec` Out bridge holds on 1792 of 1792 sector sources, and the In bridge on 1120 of 1120 in-sector
    targets. This reproduces F2's counts with my own code.
- **`CB(8,2)`, exhaustive, ranks 2–4.** E1 literal rows match the class formula on 272,910 sources, and columns on 5,623 targets.
- **Off-class boundary.** The E1 row differs from `w` at 8 sources of `CB(8,1)` and 16 of `CB(8,2)`. All sit at `p − q = 0`, where
  `R_q(−1) = 0` and Lean's `ρ = x/0 = 0`. This cannot occur in the class, because `p* − q − 1 ≥ p* − m − 1 > 0` and P2 asserts
  `R_q(j−1) > 0` at every `q`. It is recorded as evidence that N2's clause 3 must stay pinned to the class, which it is.
- **Class rows 158, 161 and 164, sampled and adversarial.** Every preimage and image set was enumerated literally. Per row:
  - 4 sector sources;
  - 4 in-sector targets, including F2's class-(a) target shape;
  - 8 switch images (`γ = 1..8`);
  - 26 r-free targets over `q ∈ {1, 2, 3, 8, ⌊m/3⌋, ⌊m/2⌋, ⌊(p*+1)/9⌋+1, m−1, m}` with boundary weights, including `w = 0`,
    `t = 0` and `t = 8(m−q)+1`;
  - 18 r-free sources.

  Every literal row and column equals the class formula (E1: equal to `ρ_q·w`; sector: equal to `Σ Out` or `Σ In`) and respects the
  bound. There were 0 failures.

**Critic-derived advance (mine, `C-F2-T`; STATED here, needs an isolated second read; grade `bounded_computation`, not registered).**
- At `m = 158, 161, 164` and rank `p*`, the composed function `f = cb8E1Arc + cb8GSec`, with the frozen definitions and C1-LA1's
  unscaled allocation, is a nonnegative rational flow supported on literal (D) ∪ (S) arcs.
- Every source's row is at least its weight:
  - sector sources have rows `≥ 1 = w`;
  - r-free sources have rows exactly `w`;
  - every other source has weight 0.
- Every target's column is at most its weight:
  - in-sector targets receive `≤ 1 = w`;
  - switch images receive `≤ γ = w`;
  - other r-free `q ≥ 1` targets receive exactly `ρ_q·w < w` when `w ≥ 1`;
  - every weight-zero target receives 0.
- Hence (HALL-COND) holds for **every** `X ⊆ I_{p*+1}` at these three rows, and a saturating integral flow exists there (max-flow
  integrality).
- The certificate rests on:
  - the E1 class-count reduction written above, validated literally;
  - the N3/N4/N5 bridges, validated literally (exhaustive at `m = 1`, sampled and adversarial at the rows);
  - the `F_{p*}` and (WID) derivations of P1.
- It is a three-row bounded confirmation of the composition that N7 and N8 formalize, and of the frozen N2 clauses 3–4 values at every
  class. It is **not** a universal statement, and it closes no frozen node.

## Attacks and findings

**F-1 (instrument error; strikes a printed number).** Part 2 class (a) omits the idle chokes.
- **What the code does.** It builds `in_states = [(8,0)]*full + [(rem,0)]` and sums `cb8In` over those states only. The printed
  target line itself says "(+ 52 idle chokes)". Each idle choke `(0,0)` contributes `In(0,0) = 8(25m+3)/D`, the largest per-choke
  In.
- **Printed versus true values.**

  | m | printed "GSec inflow" (= `In(2,0)`, the partial choke only) | true inflow of that exact target |
  |---|---|---|
  | 158 | `23719/1668587` | `1668167/1668587` |
  | 161 | `24169/1732469` | `1732041/1732469` |
  | 164 | `3517/256793` | `1797115/1797551` |

  The true values were confirmed by closed form and by literal frozen-definition evaluation.
- **The "alt instrument, all-gamma legs"** has the same omission and prints the same number. It is not a second instrument.
- **Consequence.** The printed values are struck. The omission hid the near-tight direction. The true worst case is **exactly 1**
  (P3, reproduced literally), and F2's representative sits 420/D below it.

**F-2 (scope; the E1 half of the composed flow was never evaluated).**
- Part 2 classes (b) and (c) and Part 3's `B2` substitute the conclusions of frozen N2 for the function they are about.
  - Clause 4 is used as `e1_inflow = rho1 * w_A` and `rho2 * w_A`.
  - Clause 3 is used as `out_B2 = w_B2  # by N2 clause 3`.
- So the verdict's "end-to-end numeric exercise of the composed flow `cb8E1Arc + cb8GSec`" is not true of its E1 half. What F2 tested
  at classes (b) and (c) is C1-LA1's Switch/Residual arithmetic and `ρ_q < 1`, at a handful of `γ` and three `(γ_1, γ_2)` pairs. Both
  are already carried formally: C1-LA1, and `cb8Rho_lt_one_topRank` through C1-LA3.
- F2's printed numbers are arithmetically right. I reproduce `ρ_1γ`, `ρ_2`, `(8−γ)σ(γ)` and `Out(B1)` exactly. They are evidence about
  the spec's right-hand side, not about `cb8E1Arc`.
- My P2 closes this gap at every class.

**F-3 (the structured Hall test is unbacked as a Hall verification).**
- Part 3 concludes `Σ_{N(X)} w(A) ≥ Σ_X rowsum` "by the flow-bound chain". That chain needs every column of `N(X)` to be at most its
  capacity.
- F2 computed no column of `N(B1)`, which contains every in-sector target reachable from `B1`, including idle-choke targets of the
  kind F-1 mis-evaluates. It computed no column of `N(B2)` either.
- The disjointness assertion is true but carries no weight.
- "HALL HOLDS for this X" is struck as evidence. Hall at these rows now stands on my P2 and P3, for every `X`.

**F-4 (scope versus the allocation's mandatory object).** Against the F2 row of `control/C4-ALLOCATION.md`:
- The orbit quotient was not used. r30's PROVED orbit-quotient equivalence is never invoked.
- Coverage is representative instances, not "every target class and every source row sum". Missing: all sector sources (only one),
  all in-sector targets (one shape, mis-evaluated), all r-free `(q, w)` classes (three `q = 2` points), and the E1 rows.
- No (WID) was asserted on any instance (see F-5).
- The selector was cited from C2-LA3, not derived at the rows. The citation of a governed award is legitimate, but it is not the
  requested derivation.
- `x` and eligibility were never computed at 158, 161 or 164. Row 161 was treated like the others, not structurally.
- **The small-CB check** covers one rank (`p = 6`) of `CB(8,1)`, plus N1 lemmas at ranks 5–7. The allocation asked for every rank
  with a nonempty derived selector, which is `p = 6..9` for `CB(8,1)`. Moreover `CB(8,1)` (`x = 6`, `⌊2α/3⌋ = 6`) and `CB(8,2)`
  (`x = 12`, `⌊2α/3⌋ = 12`) have **no eligible rank**. So no literal check on these trees can test (HALL) at all, and the return does
  not say so. "Off-class" is disclosed; "non-eligible" is not.
- The route's own remaining-obligation item 3 names the `CB(8,2)` gap. I covered it for E1 (exhaustive at ranks 2–4) and for the
  sector bridges (sampled and adversarial at the rows).

**F-5 (fidelity).**
- The return never asserts `supply − capacity = S(T, p*)` from independent sides on any instance. SOLUTION-CONTRACT fence 2 and
  SEMANTIC-CONTRACT §1 require this before any computation is interpreted.
- Under protocol duty 2, this strikes F2's network-level conclusions at the rows: "no violation of any Out/In/Hall bound was found at
  any tested instance", taken as evidence about the literal network.
- The template-arithmetic values survive, because I re-derived them independently and supplied (WID) from two sides at all three
  rows (P1).

**F-6 (misstatement of the record in `## Remaining obligation`).**
- Item 1 says "the universal per-state LP certificate remains unformalized and unverified at scale… that remains T2/T3's object (the
  affine separation LP)". This is false. C1-LA1, a governed `formally_verified` award, is exactly the template-level Out/In/Switch/
  Residual certificate for every class `m`, with the affine separation. The base carries entries 92–94
  (`cb8_state_out_const`, `cb8_state_in_const`, …).
- T2/T3's objects are the template-to-network bridges N3–N5.
- Item 1 is struck as stated. My P3 does the adversarial search it proposes, exactly, over every distribution.
- A smaller misstatement: line 139 says `cb8Rho_lt_one_topRank` depends on the E1 threshold key. It rests on C1-LA3's formal
  `cb8_E1_conditionI_topRank`, and it sits in the base's ungraded scratch copy `E1FlowConstruction.lean`, not in an award.

**F-7 (tightness: a new adversarial fact, mine).**
- At all three rows the template is met with equality at both ends. The minimum sector Out is 1, so no source has spare supply. The
  maximum in-sector In is 1, so some in-sector targets are loaded to capacity.
- Both hold literally on the frozen definitions.
- **Consequences for the formal route:**
  - Any successor change that adds load to in-sector targets breaks conjunct 4 at these rows. Examples are a nonzero E1 contribution
    into targets containing `r`, a rounding or scaling of `cb8GSec` upward, or a different state reading.
  - N4's `In ≤ 1` has no slack to absorb an error.
  - N7's proof must use the exact bounds, not strict inequalities.
- F2's instances (Out `1668769/1668587`; the mis-evaluated In) missed both extremes.

**F-8 (checks that pass).**
- **Bug timing.** The self-disclosed switch-guard defect predates every reported number (Identity and seal audit).
- **Bridges.** The CB(8,1) bridge counts, 1792 of 1792 and 1120 of 1120, are reproduced by my own literal `cb8GSec`.
- **Arithmetic.** Every Part 0–3 value F2 printed, other than F-1, is reproduced exactly: the fixed points, the single-state
  min/max, `ρ_1γ`, `ρ_2`, `(8−γ)σ(γ)`, `Out(B1)` and the Hall-row sums.
- **Newton/Darroch.** F2 makes no Newton or Darroch step, and neither do I.
- **Natural-number subtraction.** F2 has no unguarded case. At the class rows `q ≤ m < p*`, so `m − q`, `p* − q` and `p* − q − 1`
  are safe.
- **Residue class.** F2 asserts `m % 3 = 2` at every row. `m = 107` is not claimed.
- **Gate ruling 29.** F2 writes its difference index textually ("none"). Its row claims do not rest on a `Δ` except through the cited
  C2-LA3. Not triggered.
- **Gate ruling 16.** Favorability at the index of record is derived at the rows in my P1, with the Δ index written.

**F-9 (a minor overclaim).** Line 157 says the closed forms are "transcribed byte-for-byte" into Python. A transcription into another
language cannot be byte-for-byte. The values agree with my independent transcription at every point checked, so this is downgraded
to "transcribed", not struck.

## Mechanism-equivalence and fence check

- **Mechanism.**
  - F2's mechanism is the carried C1-LA1 per-state template plus the E1 clone construction. It is not a refuted mechanism: this is the
    `m`-dependent affine-separation certificate, not the refuted `m`-independent per-choke certificate, and it is not the struck
    compression lemma.
  - My re-derivation uses the same objects, the frozen `cb8E1Arc` and `cb8GSec`, and no new mechanism.
- **Fence 1** (one rank per tree; the class only). F2 and I work only at `p*`, at class rows 158, 161 and 164, plus fixed points 95
  and 107. `CB(8,1)` and `CB(8,2)` are used only as off-class, non-eligible mechanics tests, with no claim drawn. There is no status
  transfer to (HALL), to the primary aggregate, or to any aggregate key. The negative `S(T_m, p*)` at the three rows is a row fact,
  not an aggregate claim.
- **Fence 2** (fidelity). F2 fails the (WID) requirement (F-5). My instrument satisfies all of it: the selector is derived, `x` is
  computed through `α`, and the weight is literal.
- **Fence 4** (template versus network).
  - The template-to-network passage is the N3/N4/N5 bridges plus my E1 class count. Both are validated literally, and both are
    informal here.
  - The affine separation is not needed for my DP, which is exact over every distribution.
  - `θ*` is used only as the definition `cb8Theta` of record, never as the conjectured optimality law.
- **Fence 7** (census). Every row statement here is `bounded_computation`. None is offered toward the universal Tier 1.
- **Claim identity.**
  - F2 registers nothing and proposes no `E993-R31-` key.
  - Keys touched: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN), `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`, the E1
    criterion, threshold and favorability keys of SEMANTIC-CONTRACT §2 at their grades, `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`,
    and `E993-TREE-REAL-ROOTED` (REFUTED, untouched).
  - **Alias check of my advance.** A scan of `CLAIM-IDENTITY.json` finds no key at rows 158, 161 or 164. The nearest keys are the
    r30 row keys `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-…` and `…-M-101-104-107-…`, which are `computer_assisted` at
    `m ≤ 107`.
    - Lexically, my rows would be a sibling of those keys over disjoint rows.
    - Mathematically, they are three instances of Tier 1 (H). They are neither the family theorem nor an alias of it.
    - They are not proposed for registration by a critic.

## Certification audit

| Literal on the return's face | Status |
|---|---|
| Stage 2 seal `226555ee…` "verified" | **backed** (recomputed) |
| 14 digest-table rows | **backed**: 13 recomputed, ROUTE-STATE by manifest record |
| generator file digests `e239be38…`, `b95ad75e…` | **backed** |
| stdout digests `ee183557…`, `eb30e121…` | **backed** under the unstated convention "stdout minus trailing newline"; replay byte-identical |
| Part 0 fixed points "exact match" | **backed** (my own P0) |
| two `ρ` instruments "exact match at every call" | **backed** (replay; my two paths agree) |
| Part 1 per-state table values | **backed**, as single-state extremes only; not an aggregate claim |
| Part 2 class (a) values `23719/1668587`, `24169/1732469`, `3517/256793` and "ok(≤1)" | **struck** (F-1); true values in F-1 |
| Part 2 class (b)/(c) "E1=…" as evaluations of `cb8E1Arc` | **struck as evaluations** (F-2): they are spec values `ρ_q·w`. As numbers, correct, and now confirmed equal to the definition by my P2 |
| Part 3 `Out(B1)` values, `row-sum (N2 clause 3, exact)=11` | Out **backed**; the "row-sum" **struck** as a computation (it is the spec); the value 11 is correct by my P2 |
| "HALL HOLDS for this X" | **struck** (F-3) |
| CB(8,1) counts 33,573 / 8,484 / 8,332 / 1792/1792 / 1120/1120 | **backed** (replay; my own literal code reproduces the bridge counts) |
| "exact match on every literal B … 10,320+33,236 instances" (N6 weight formula) | **backed by replay** only; not independently re-derived by me beyond the weight rule used in P4 |
| "`cb8Rho_lt_one_topRank` (sorry-free in `E1FlowConstruction.lean`)" | textually sorry-free in the base's ungraded scratch copy; the base built with 0 errors per gate ruling 25. **Backed as a scratch fact; not an award** (F-6) |
| "transcribed byte-for-byte" | **downgraded** to "transcribed" (F-9) |
| route verdict `bounded_evidence`; grade `bounded_computation` | grade **appropriate** for what survives; scope narrowed below |
| `FORMALLY_VERIFIED_TOKEN` admission defect | adjudicated **allowed citation** (Identity and seal audit) |

## Verdict

verdict: retained_narrowed
headline_resolved: no

COND4_formal: no
E1_formal: no
TERMINAL_integration: no
cut_candidate: no
FROZEN_NODES_CLOSED: none

Neither F2 nor this critique compiles a frozen node. No deficient cut, and no template failure, occurs at any instance examined by F2
or by me.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Retained, narrowed to:**
1. The Part 0 fixed points.
2. The two-path `ρ` agreement at the named rows.
3. The exact values `ρ_1(m)γ + (8−γ)σ(γ) ≤ γ` for `γ = 0..8`, and `ρ_2(m)·w ≤ w` at three pairs, at `m = 158, 161, 164`. These are
   spec-level arithmetic, not evaluations of `cb8E1Arc`.
4. `Out(B1) ≥ 1` for one sector source per row.
5. The exhaustive CB(8,1) literal bridges at the off-class, **non-eligible** rank 6, plus the N1 lemma checks at ranks 5–7.
6. "No cut" on those instances.

**Struck:**
- the class-(a) values (F-1);
- the claim that the composed flow's E1 half was evaluated (F-2);
- the Hall test as Hall evidence (F-3);
- the network-level "no violation" conclusion, for lack of (WID) (F-5);
- remaining-obligation item 1 as stated (F-6).

**Not delivered** from the mandatory object (F-4): the orbit quotient, every class and row, (WID), the derived selector, `x`, the
structural treatment of row 161, and small-CB checks at every selector-nonempty rank.

**Supplied by this critic, attributed to `C-F2-T`.** Everything F-4 lists as not delivered is supplied except the orbit quotient;
I substitute a class reduction for it, and that reduction still needs a second read. On that basis the composed-flow confirmation
at the three rows holds for every source, every target and every `X` (the critic-derived advance above; `bounded_computation`;
STATED; needs an isolated second read). The confirmation is tight at both sector bounds.

## Remaining obligation

1. **An isolated second read of my critic-derived advance.**
   - The E1 class-count reduction (Boolean `8q − w`, ternary `2(8(m−q)+1−t)`, choke insertions zero, `r` not insertable), which lets
     the P2 census stand for every r-free target and source.
   - The claim that the per-state DP over leg counts covers every sector source and in-sector target through the N3/N4 bridges.
   - Until then, the three-row (HALL) confirmation is STATED, not registered.
2. **Formal closure of conjunct 4**, which is unchanged. Neither this route nor this critique moves any frozen node N1–N8. The E1
   census values at the rows are consistent with N1–N2 as frozen, including the `t_B = 0` boundary, where the row identity needs
   `H(α) = 0` at `j = α`; a proof of N2 clause 3 must treat that case explicitly. The exact tightness (F-7) means N4 and N7 must
   carry `≤` and `≥` exactly, with no strict margin.
3. **r30's PROVED orbit-quotient route.** The allocation named it, and neither F2 nor I used it. If the panel wants the row
   confirmation on a PROVED quotient rather than on my informal class reduction, a successor must redo P2 and P3 through that
   equivalence.
4. **Literal (HALL) is impossible on `CB(8,1)` and `CB(8,2)`.** `CB(8,1)` and `CB(8,2)` have empty eligible windows (`x + 2 > ⌊2α/3⌋`).
   My own tree DP puts the smallest `CB(8, m′)` with a nonempty eligible window at `m′ = 4` (`n = 71`, `α = 37`, `x = 22`). This
   came from a one-off scan with `crit_f2t` functions in `run2/`; the scan was not saved as an artifact, and it is reproduced by
   scanning `m′ = 1, 2, …` with `first_strict_descent` and the window `x + 2 ≤ p ≤ ⌊2α/3⌋`. That tree's
   window is the single rank 24. That is not `⌊(16·4+4)/3⌋ = 22`, and brute-force literal enumeration of `I_24` and `I_25` at
   `n = 71` is out of reach. A meaningful small-row Hall check therefore needs a structured max-flow at `CB(8,4)`, rank 24. It is not
   attempted here, and in any case it lies off the class.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-F2-T/`.

| Path | SHA-256 | Role |
|---|---|---|
| `crit_f2t.py` (and identical copy `run2/crit_f2t.py`) | `6ba35369ee65e8702f5138ca7d716fa01e8ba2809569bdf5c957ae30b716814a` | critic instrument P0–P4 |
| `run2/stdout.log` | `72010eb75a66f6136aa4b4f35415f4b39750c889760bd4c65784dcd5c102820d` (in-text digest `16fca9d2194495d294872e4e8725ec4459341f8188276d387129efe1ee546ef6`) | run output, exit 0 |
| `run2/crit_summary.json` | `d2d0a291017522745d4f9e25ed51db7da42bf45fdb93d6de14f4a0ade7842eb3` | exact row values (supply, capacity, `S`, class counts, extrema) |
| `adv_literal.py` (copy in `adv/`) | `52d8046c0f452d1d8078351787b6de6b0864d1e7e10b91a6249228133eeb13d6` | literal check at the DP extremizers |
| `adv/stdout.log` | `8f5ebc56c23e89be536ce61410afc1b51ae846c48f1899695f8a98ae37814202` (in-text `f7542939ad4d8991a980bdcca68097a76878fe05f15412a8c29c73d636957762`) | exit 0 |
| `replay/` | copies of `scratchpad/c4-F2/*` (`composed_flow_check.py` `e239be38…`, `tree_check.py` `b95ad75e…`, logs) | copy-out source |
| `replay-run/` | `stdout.log` `c4eb1d3e…b4c0` (byte-identical to shipped), `results_summary.json` `eb77aa9d…8775`, `tree_stdout.log` `369718e3…e3` | F2 replay, exit 0 |

**Replay command:**

```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-F2-T/run2 && python3 -B crit_f2t.py
```

It takes about 5 minutes. It writes `crit_summary.json` into its working directory and exits nonzero on any failed assertion.

**Background jobs.** Three were started, each identified by its literal PID: 9742 (the F2 replay), 19572 (the first critic run,
aborted at its final JSON write, output discarded, directory removed) and 23614 (`run2`). All had exited before this write;
`ps -p 9742,19572,23614` returned no process. I ran no full process listing.
