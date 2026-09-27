# Orientation Adjudication

Run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30), Cycle 5, Stage 5. Isolated adjudicator of orientation T
(prove). Portfolio: returns `T1` (`C5-T-01 CB-CLASS-UNIFORM-SWITCH-HALL`) and `T2` (`C5-T-02 HETEROGENEOUS-SWITCH-NECESSARY-ROW-CLOSURE`),
with critiques `C-T1-F`, `C-T1-U`, `C-T2-F` and `C-T2-U`. Date 2026-09-27.

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full and in that order, before any other VerityOS file. I loaded
no other VerityOS subsystem (no memory, knowledge, conversations, decisions, logs, modules or skills). The host put the project
`CLAUDE.md` and the user's auto-memory index into my context. I did not open either file or act on it, and I kept no
conversation log, because the dispatch restricts my writes to this file and my scratch.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Dispatch.** `control/dispatch/c5-stage5/DISPATCH-ADJ-T.md`. I recomputed its SHA-256 as
`622490ce18739178728c201759c3e1b4d2ce8680212218869951d7f2829b2a53`, which matches, before following it. Every Python run was
`python3 -B`, in the foreground, using the standard library and exact `int`/`Fraction` arithmetic. There was no network, no
install and no Lean/lake. **No background job was started, so there was nothing to kill.** No bytecode exists under my scratch
(checked with `find`, scoped to my own directory only), and none exists under `sources/lower-region/inputs/` after the T1 replay.

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Capsule `control/c5-adjudicator-capsules/T-PACKET-MANIFEST.json` inner seal (canonical JSON without `seal_sha256`: sort_keys, `(",",":")`, no trailing newline) | `ca02804aaec9e09bd95a15176c97d6aaacbf536209ce6dfcf9a05eceb1c2d298` | same | **match** |
| Capsule members (21: bytes and SHA-256) | as listed | recomputed | **21/21 match** |
| Stage 2 packet manifest inner seal | `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289` | same | match |
| Stage 3 packet manifest inner seal | `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58` | same | match |
| Stage 4 packet manifest inner seal | `b7b0bcedfb6117021fe99bdf065b24d5a45509f10bdf5dbe1bd48cd0feb47169` | same | match |
| `PATH-CHECK-T.json` | 20 files scanned | read | 0 findings |
| Stage 3 / Stage 4 admissions | 6/6 returns, 12/12 critiques admitted | read | T1 `7ab9c9bf…a6da`, T2 `91113a42…f943` and the four T critiques are at the digests the capsule lists |
| T2 inventoried scratch (`scratchpad/c5-T2/`, 13 files) | the return's table | copied out, then digested | **13/13 match** |
| T1 generator / output (`scratchpad/c5-T1/`) | `f969a378…63a136` / `55ddca3e…80f9` | copied out, then digested | as both T1 critics recorded |

**Replays (copy-out-first into `scratchpad/c5-adj-T/`).**
- T1's `t1_generator.py` reproduces `T1-GENERATOR-OUTPUT.json` **byte-identically** (76 s). The embedded result digest is `e6ccfd94…e65a`.
- T2's `rowdata.py`, `rho.py`, `window_check.py` and `hetero_certify.py` reproduce their shipped outputs **byte-identically**.

**Record discrepancies found at this stage. None changes a mathematical conclusion.**
1. R30-E-j is confirmed as a controller erratum. `C5-CRITIC-PROTOCOL.md` duty 1 quotes a stale Stage 2 seal (`f0b5a2a1…`). All
   four T critics resolved it by recomputing `2e8e3d44…`, and I recomputed the same value. The protocol itself is not in my
   capsule, so I rely on the four critics and CF-1 for the literal.
2. Controller fact CF-T1 says the adjudicator "verifies against the registry member in its capsule". But
   `control/CLAIM-IDENTITY.run-local.json` is **not** a member of the T capsule. I could therefore check E1-R's load clause only
   against CF-T1's verbatim quotation, which counts as one more instrument and not as authority. This remains an obligation
   (see *Next-route allocation*).
3. CF-2 names the Stage 3 disclosures addendum as a separate file. That file is not a T-capsule member. Its content is embedded
   verbatim in `C5-STAGE4-READ-BOUNDARY-DISCLOSURES.json` (a member), and I weighed that copy.

**My read-boundary disclosures.**
- I read the two boot files, the dispatch, the 21 capsule members, and the returns' inventoried scratch (copied out before any run).
- I made non-recursive `ls` listings of `scratchpad/c5-T1/`, `scratchpad/c5-T2/` and `sources/lower-region/inputs/`. The first two
  are the inventoried scratch; the third is within the `sources/` grant.
- The T1 replay imports `sources/lower-region/inputs/ordinary_tree_checked.py` read-only.
- The T2 return was displayed to me through a harness-saved copy of the capsule member. That copy is the same content; it was
  not a separate file read.
- I used no `find`, `grep` or `rg` above my grant. The only `grep` I ran was on copied-out files inside my own scratch.
- I read no other orientation's material, adjudication, synthesis, root, or network resource.

**Seats' and critics' disclosures, weighed.**
- T1: a names-only `ls` of `scratchpad/`, and one read-before-digest ordering (the digests matched).
- T2: names-only listings above its grant.
- C-T1-U, C-T2-F: one `grep` over control-file globs each to trace R30-E-j.
- C-T1-F: the digest of a non-member dispatch, computed without reading it.
- C-T2-F: its alias replay read the run-local registry.

None of these bears on the mathematics. No penalty applies.

## Route-by-route decisions

### T1 — `C5-T-01 CB-CLASS-UNIFORM-SWITCH-HALL`: route verdict `bounded_evidence` confirmed; critics concordant (`retained_narrowed`, both)

T1 attempted neither (L-i) nor (L-S). It produced an instantiation of the registered `CBstar` deficit at `t = 1`, a
cross-check of the five certified rows, and a census.

**Paired-critic resolution, claim by claim.** Where the critics differ I say so and rule.

| T1 claim / literal | C-T1-F | C-T1-U | Ruling (with adjudicator replay) |
|---|---|---|---|
| Claim 0: sector count `C(dm,p−1)2^{p−1}`, 5 brute rows | backed | backed | **Retained**, `bounded_computation`. It is a check of arithmetic, on laboratories. |
| Claim 1: `α(CB(d,m)) = 1 + m(d+1)` | true; proved by a partition into two-vertex edges plus the star `{r,u_1..u_m}` | true; proved by a clique cover; T1's "uniform proof" literal **struck** | **Statement proved** (`proved_informal`), **critic-attributed** to two independent critic proofs, and STATED (needs a second read). T1's own text has only the lower-bound construction, so the literal "the argument is in fact a uniform proof" is **struck**. The two critics do not disagree: F rules on the statement, U on the literal. My instrument asserts the formula on every CB row it built (`d ≤ 10`, `m ≤ 330`). |
| Claim 2: five rows — `α`, `x = p − 2` | backed | backed | **Retained** (independent content). My census reproduces all five. |
| Claim 2: ratio "matches quoted record" | **struck as evidence** (formula compared with formula) | "backed" (values reproduce) | **Struck as evidence**, on F's reading. U confirms the *values*, but F's point is that no independent quantity is compared, and that stands under ruling 17. The values themselves are correct. |
| Claim 3: 59 hits in the rectangle (`d ≤ 8, m ≤ 150`; `9 ≤ d ≤ 16, m ≤ 89`) | backed (own census) | backed (own closed-form census) | **Retained**, `bounded_computation`, now on **four** instruments. My own closed-form instrument (`adj_t1_cb.py`) returns a hit set in `(d, m, x, p)` equal to T1's (`out_adj_t1_rect.txt`): 17 with `d = 7` and 42 with `d = 8`. |
| "cross-checked against the independently-computed `x`" | — | **struck** (the same DP supplies both) | **Struck.** The census's two-instrument status comes from the critics and me, not from T1. |
| "`F_p` derived on every row via `favorable_leaves()`"; "every eligible row reports `|F|`" | **struck** | **struck** | **Struck.** I confirmed by `grep` on the copied-out generator that `favorable_leaves` and `aggregate_S_independent_side` appear only as a definition and in the docstring; they are never called. The fact itself (`F_p` = all leaves, so the sector has weight 1) is re-established by C-T1-F, by C-T1-U, and by me: the arm leaf and a private leaf are favorable at every first-rank hit, `d ∈ {7, 8}`, `m ≤ 330/300`. |
| "most likely `d ∈ {7, 8}` rather than `d ≥ 6`" | **struck** (hits for every `d ∈ [7, 16]`) | **refuted** (hits for `d ∈ [7, 12]`) | **Struck.** My instrument reproduces the first hits `CB(9,112)/673` (`n = 2131`) and `CB(10,106)/708` (`n = 2229`). T1's `d ≥ 9` ceiling `m ≤ 89` cut off just below them. |
| "five registered rows … its own five smallest entries" | **struck** | **struck** | **Struck.** `CB(8,95)/508` (`n = 1618`) and `CB(7,109)/510` precede the certified `CB(8,108)` and `CB(7,144)`. |
| Step 2: defect-Hall deduction (deletion saturates the in-sector layer; unmatched count `C(dm,p−2)2^{p−2}(2dm−3p+5)/(p−1)`) | backed at inherited grade; lab-confirmed on 4 rows | backed as a **count, not a set**; lab 11/11 | **Retained** at the inherited `proved_informal` grade of `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`. It needs `v ∈ F_p`, which T1 did not check. It identifies no unmatched sources, so it is not an (L-S) input. |
| Remaining obligation 1: prove E1(i) "at every switch-necessary eligible `p`" on `d ∈ {7, 8}` | **not exact: the statement is false** (F-4) | **false** (A4) | **Struck as an obligation.** See the strongest correction below. |

**The strongest correction in this portfolio.** It is critic-derived (C-T1-F F-4 and C-T1-U A4) and replayed by me. The
allocation's step (L-i) asks for E1 condition (i), in cleared form `r_q(p−q) ≤ r_q(p−q−1)`, at every eligible rank of
`CB(8,m)`, `m ≥ m_0`. That is **false** at first eligible ranks:
- It fails at `q = 1` at `CB(8,161)/859`, the first failure.
- It fails at every switch-necessary `CB(8,m)` first rank past `m = 211`.
- For `d = 7`, the last first rank where it holds is `m = 287`.

My replay (`out_adj_t1_d8.txt`, `out_adj_t1_d7.txt`, `out_adj_t1_band.txt`):
- `d = 8`, `m ≤ 300`: 192 first-rank switch-necessary rows. E1 at `q = 1` fails at 114 of them, the first at `m = 161`. The last
  `m` whose first rank satisfies E1 is 211.
- `d = 7`, `m ≤ 330`: 187 rows, 78 failures, last holding `m` = 287.
- Exact all-`q` checks, by incremental multiplication with no use of Darroch (`out_adj_t1_e1allq.txt`):
  - `CB(8,161)` fails at 859 (`q = 1` only) and holds at 860.
  - `CB(8,242)/1290` fails at `q = 1..4`.
  - All `q` hold at `CB(8,86)/460`, `CB(8,200)/1068`, `CB(8,300)/1601`, `CB(7,144)/673` and `CB(7,300)/1401`.
- All of these match C-T1-U's threshold lemma (below) and CF-0's classification (52 rows / 79 gap-rank rows / 61 rows).

The route verdict `bounded_evidence` is correct: T1 produced checked, reusable material and no proof of its object. **T1
supplies none of (a′)–(d′).**

### T2 — `C5-T-02 HETEROGENEOUS-SWITCH-NECESSARY-ROW-CLOSURE`: mathematics retained; route verdict re-typed to the grade `computer_assisted`, STATED; critics concordant (`retained_narrowed`, both)

| T2 claim / literal | C-T2-F | C-T2-U | Ruling (with adjudicator replay) |
|---|---|---|---|
| `n = 1427`, `α = 755`, `x = 446` (through `α`), window `[448, 503]`, 56 ranks, 671 leaves | backed | backed | **Backed.** My own closed forms, validated by literal brute force on 7 small heterogeneous analogues, give the same values (`out_adj_t2_row.txt`). |
| `F_p` = all 671 leaves at all 56 ranks, derived | backed (orbit representatives plus second members) | backed (six representatives) | **Backed.** I checked the three orbits at all 56 ranks, using `I(T−v)` and `I(T−c_d)` closed forms validated against brute force on 5 profiles (`out_adj_t2_delcheck.txt`). |
| "`supply − capacity == S` … two routes … independent" (§4) | **struck** (one computation rearranged; non-falsifiable) | **struck** (`rowdata.py` lines 324–328) | **Struck.** I read lines 315–329 of the copied-out `rowdata.py`: "supply" is `Σ_v q_v(448)`, never `Σ_B w_F(B)`. The **fact** is re-established on three independent instruments: C-T2-F's structural `W(y)`, C-T2-U's weight generating function, and my own `W(y)` validated against literal `Σ w_F` on 7 profiles. All three give supply − capacity = `Σ_v[q_v(p) − q_v(p−1)]` at all 56 ranks, with `S < 0` everywhere. My `S(T,448)` appears verbatim in T2's output. |
| `ρ_(1,7) = 5327002801984/5350924042653`, `ρ_(1,8) = 588641648396200/591947103906771` | backed | backed | **Backed** by a third method (incremental coefficient build). |
| The reduced-capacity certificate (`θ*_7 = 0`, `θ*_8 = 384/1832557`; min outflow 1; max inflow 1) | backed (own DP over the literal multiset; 155-value dump) | backed (convolution powers) | **Backed** by my replay (`out_adj_t2_cert.txt`, `out_adj_t2_r8.txt`, `out_adj_t2_lab.txt`); see the list after this table. |
| "two independent exact instruments" / "each with two instruments where the allocation asks for two" | narrowed / struck (the literal laboratory of 2(d) is missing) | narrowed (one model, two checks) | **Narrowed.** The literal-network validation of item 2(d) is **critic-supplied**: by C-T2-F on the actual row (0 mismatches), by C-T2-U on small profiles, and by me on the actual row. |
| "every in-sector target's up-degree is exactly 448" | **struck** (plus `C(z,2)` `r`-switch preimages; 3,486 at the argmax) | — (U confirms the `r`-switch preimages exist) | **Struck** as stated; it holds for sector preimages only. It is harmless, because E1-R is deletion-only. It matters for any successor whose non-sector flow uses `r`-switch arcs. |
| Obstruction R8 "respected" | critic-quantified: tight at 1 | critic-quantified: tight at 1 | **Backed.** My convolution with the full characterization (every choke state in `{(0,0), (0,d)} ∪ {β ≥ 2}`) gives a maximum inflow of exactly 1. A one-hop, state-dependent rule clears R8 at equality; the allocation's "two-hop" was a sufficient remedy, not a requirement. |
| Composition at 448 (§8) | holds per class, conditional on E1-R's load statement | sound per class | **Retained**, conditional on E1-R's registered load clause. See the note after this table. |
| 449–503 via CD-1 (constant `q_i = 2`, `M = 670`) plus E1-R | carried by registered statements | carried by registered statements | **Retained.** My ratio check gives 448 as the **unique** sector-deletion-deficient rank. The E1-R criterion holds at 248 types × 56 ranks with 0 failures; the maximum `ρ` is `5327002801984/5350924042653` at `(a, b, p) = (0, 1, 448)`. That makes four instruments with the Cycle 4 record. |
| "9 shared tokens of 9" | **struck** (9 of **11**) | — | **Struck.** T2's own `out_alias_check.txt` shows the pattern "CB rows deletion-arc weighted Hall above the first eligible rank" (11 tokens) sharing 9. That is a lexical alias hit at T2's own threshold. |
| Key names "MIXED-DEGREE-CHOKE-TREE-…" | rename to name the tree | rename to name the tree | **Rename required** (ruling 33); see *Established results*. |
| "`θ_7* = 0` … a genuine fact about this instance" | narrowed (a property of the LP optimum) | — | **Narrowed.** |
| "retires the entire known instance frontier" | awaits a second read | backed only as scoped | **Narrowed.** It retires the one uncertified switch-necessary eligible row **on record entering Cycle 5**. C-T1-F, controller facts CF-0/CF-6 (which cite critic C-F1-U, whose critique is outside this capsule), and my census show the class frontier is far wider: 54 uncertified rows in T1's rectangle alone (the smallest is `CB(8,95)/508`). |
| Route verdict `proved_conditional` | acceptable only as the grade line reads it | "adds nothing" beyond the grade | **Re-typed.** The grade of record is `computer_assisted`, STATED: a finite certificate composed with two registered `proved_informal` keys and a finite criterion check. It is not a conditional theorem in the §4 sense. |

**My replay of the certificate.** The LP was used only to generate candidate values.
- (i) Affine-separation proof path. Every per-state constraint `Out_d ≥ a_d + λn` and `In_d ≤ a2_d + λ2·n` holds. The global
  sums are **exactly** `82a_8 + 2a_7 + 447λ = 1` and `82a2_8 + 2a2_7 + 446λ2 = 1`.
- (ii) Per-leg-count reduction followed by min-plus / max-plus convolution powers with the literal multiplicities. The minimum
  outflow over all 447-leg sources is **1**, and the maximum inflow over all 446-leg targets is **1**. The certificate therefore
  has **zero slack**, and any re-verification must be exact.
- (iii) `(d−γ)σ_d(γ) ≤ θ_d·γ` holds for all `d, γ`. `θ*_8` is 3.75% of `1 − ρ_(1,8)`. All 141 per-state values are
  nonnegative, 135 of them nonzero; with the 14 scalars that makes the critics' "155".
- (iv) A literal-network laboratory on the actual `G(8^82, 7^2)` at 448, seed `20260927`. Of 30 sampled sector sources, 30 have
  literal (D) ∪ (S) outflow under the rule equal to the `Out` formula. Of 30 sampled in-sector targets, 30 have literal sector
  inflow (every deletion and switch preimage enumerated) equal to the `In` formula. Every positive-flow arc lands on a
  positive-weight target, and there are 0 mismatches.

My dump of the values is `t2_cert_values_adj.json` (`2c421fcc…`), a serialization different from the critics' `7a6f4c66…`.

**Composition at 448: what it relies on.**
- In-sector targets receive at most 1 from the sector flow and 0 from E1-R.
- Single-choke switch images `(q, D_Q) = (1, d_i)` receive at most `(ρ_(1,d_i) + θ*_(d_i))·w ≤ w`.
- Every other `r`-free target receives `ρ_Q·w ≤ w`.
- Targets that contain `r` but not `v` weigh 0 and receive 0.
- Positive-weight non-sector sources are all `r`-free.
- Hence a fractional saturating flow exists, which gives (HALL-COND) for every `X ⊆ I_449`, which gives an integral flow by
  (HALL⇒FLOW).

The one inherited input no T-portfolio instrument can audit is E1-R's registered **load clause**. That is exactly the load
`ρ_{Q(A)}·w_F(A)` on every `r`-free target with `Q(A)` nonempty, including the one-choke targets containing `v` in which the arm
is a `K(2)` coordinate. CF-T1 quotes that clause verbatim, and its text covers this case. I weigh that as one controller
instrument, not authority, because the registry is not in my capsule.

**Decision.** Whole-row (HALL) at `G(8^82, 7^2)/448`, with load-bearing switch arcs, and deletion-only (HALL) at 449–503 are
**retained at `computer_assisted`, STATED**, pending an isolated second read. **T2 supplies half of (b′).**

## Cross-route reconciliation

1. **Every certificate of record sits at the top sector-deficient rank.** Adjudicator observation; exact arithmetic.
   - `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, `CB(8,108)/577`, `CB(7,144)/673` and T2's `G(8^82,7^2)/448` all have
     `p = ⌊(2D + 4)/3⌋`, where `D` is the total number of legs. So `3p ∈ {2D+3, 2D+4}`, and the sector ratio is `(p+1)/(p−1)` or
     `p/(p−1)`: the smallest sector deficit among the deficient ranks.
   - C-T1-U's rank-threshold lemma says E1 holds for every `q` at every rank from `⌈μ_1⌉ + 2` on, where `μ_1 = (4dm − d + 1)/6`.
   - For `d = 8`: `⌈μ_1⌉ + 2 = ⌊(16m + 4)/3⌋` when `m ≢ 1 (mod 3)`, and it exceeds the top deficient rank when `m ≡ 1`.
   - For `d = 7`: the band is the top deficient rank when `m ≢ 2 (mod 3)`.
   - So the "E1 band" of C-T1-U **is** the top sector-deficient rank. All five homogeneous certified rows lie in it, and
     `G(8^82,7^2)/448` is its heterogeneous analogue: the top deficient rank, with the E1-R criterion verified there.

2. **C-T1-F's "cannot be a fixed-`d` class" holds only for FIRST eligible ranks.** My census (`out_adj_t1_band.txt`) finds that
   the band rank `p* = ⌊(16m+4)/3⌋`, for every `m ∈ [106, 300]` with `m ≢ 1 (mod 3)`, is simultaneously:
   - eligible (`x + 2 ≤ p*`, `3p* < 2α + 1`);
   - sector-deletion-deficient (switch arcs load-bearing);
   - favorable for all leaves (the arm leaf and a private leaf, derived);
   - E1-exact at `q = 1` (and at every `q` by the lemma, as checked exactly at `m = 200` and `m = 300`).

   The `d = 7` analogue holds for every `m ∈ [142, 330]` with `m ≢ 2 (mod 3)`. So a **fixed-`d` infinite switch-necessary family
   on which E1 holds** is available at non-first eligible ranks: the top-deficient rank of `CB(8,m)`. C-T1-U's remaining
   obligation (its alternative in item 1) anticipated this.

   Grades: the residue arithmetic is elementary and proved; eligibility and favorability are `bounded_computation` through
   `m ≤ 300` (`d = 8`) and `m ≤ 330` (`d = 7`); the observation is adjudicator-derived and STATED.

   This dissolves the diagonal-class concern and makes the T-orientation (a′) target concrete.

3. **T2's heterogeneous certificate is the LP method T1's (L-S) needs.** The shared-`λ` affine separation generalizes C-T1-U's
   Cycle 4 homogeneous LP to mixed degrees, and it certifies at `θ*_8 ≈ 0.0375·(1 − ρ_(1,8))`.
   - All 54 uncertified rows in T1's rectangle satisfy E1 at `q = 1` at their first rank.
   - At 49 of them the first rank **is** the band rank, so E1 holds at all `q` there by the lemma.
   - The smallest are `CB(8,95)/508`, `CB(7,109)/510`, `CB(8,98)/524` and `CB(7,112)/524` (`out_adj_t1_frontier.txt`).
   - T2's method therefore applies directly to those 49 rows.

4. **No conflict between the orientations' routes.** T1's census and T2's row use the same sector model: `w_F ≡ 1` on
   `{r, v ∈ B}`, which needs `v ∈ F_p` and was derived on every row reported here. C-T1-F notes that non-sector sources send
   `r`-switch arcs into sector targets, and C-T2-F independently finds the same `C(z,2)` preimages. Both are harmless for
   compositions whose non-sector part is deletion-only (E1, E1-R). Any (L-S) proof must state that it uses E1/E1-R and not a
   switch-using non-sector flow.

## Established results

Grades are those of `SOLUTION-CONTRACT.md` §4. "STATED" means first stated at Stage 3 or Stage 4; each STATED item needs an
isolated second read before registration. Attribution follows SEMANTIC-CONTRACT §3.

1. **(HALL) at `G(8^82, 7^2)`, rank 448, switch arcs load-bearing.**
   - Grade: `computer_assisted`, STATED. Derived by T2; the literal-network validation is critic-supplied (C-T2-F, C-T2-U) and was
     replayed by the adjudicator.
   - Hypotheses consumed:
     - the literal tree, with connectivity and acyclicity checked separately by T2, both critics and my builder;
     - `p = 448` eligible, with `x` taken through `α`;
     - `F = F_448` derived (all 671 leaves);
     - `w_F` literal, and (D) ∪ (S) literal;
     - no quotient step.
   - Inputs: E1-R (`E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`, `proved_informal`),
     including its load clause, plus the finite E1-R criterion check (four instruments). (HALL⇒FLOW) is the classical integrality
     step.
   - Suggested key (C-T2-F's rename, screened by it against the master 434):
     `E993-R30-CHOKE-TREE-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`.
2. **Deletion-only (HALL) at `G(8^82, 7^2)`, ranks 449–503.**
   - Grade: `computer_assisted`, STATED (T2; critic-confirmed).
   - Inputs: CD-1 (`E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`, constant `q_i = 2`, `M = 670`) and E1-R, plus finite
     checks: the ratio `e_{k−1} ≥ e_k`, and the E1-R criterion at 248 types × 55 ranks.
   - Suggested key: `E993-R30-CHOKE-TREE-8POW82-7POW2-RANKS-449-TO-503-DELETION-ONLY-WEIGHTED-HALL`.
   - The whole-row conjunction ("(HALL) at every eligible rank of `G(8^82, 7^2)`") is a **scope note**, not a key.
   - The registrar must lint both names against the run-local registry, which is not in my capsule.
3. **`α(CB(d,m)) = 1 + m(d+1)`, `m ≥ 1`.** `proved_informal` if a second read confirms it; critic-attributed (C-T1-F, C-T1-U).
   The proof is one paragraph: a clique cover or edge-plus-star partition for the upper bound, and `{v} ∪ {u_i} ∪ {c_ij}` for the
   lower bound. It is a companion fact; it needs a key only if a CB-class theorem cites it.
4. **E1 rank-threshold lemma on `CB(d,m)`, `d ≥ 6`, `m ≥ 1`** (C-T1-U A5; critic-attributed; STATED).
   - Statement: with `μ_1 = (4dm − d + 1)/6`, E1(i) in cleared form holds for every `q ∈ [1, m]` at every `p ≥ ⌈μ_1⌉ + 2`, and fails
     at `q = 1` at every `2 ≤ p ≤ ⌊μ_1⌋ + 1`. The one rank `⌈μ_1⌉ + 1` (when `μ_1 ∉ ℤ`) is undecided by the lemma.
   - I verified the proof step by step:
     - `r_q` is real-rooted with mean `μ_q = (qd−1)/2 + 2(d(m−q)+1)/3`;
     - `μ_q + q = (4dm + 1 + q(6−d))/6` is nonincreasing in `q` for `d ≥ 6`;
     - `⌈μ_q⌉ + q ≤ ⌈μ_1⌉ + 1`;
     - Darroch places every mode in `{⌊μ⌋, ⌈μ⌉}`;
     - the converse follows from `p − 2 < ⌊μ_1⌋ ≤` the first mode of `r_1`.
   - Grade: `proved_informal` **modulo Darroch (1964)**, a classical theorem not under `sources/`, named on the face as an
     undischarged dependency.
   - Exact checks agree at 8 rows.
   - Naming: C-T1-U proposed `…-HOLDS-EXACTLY-ABOVE-RANK-THRESHOLD`, but "EXACTLY" overstates a lemma with a one-rank gap. Suggested:
     `E993-R30-CB-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`, with the failure half on its face.
5. **For `d ≤ 6`, the sector of `CB(d,m)` is deletion-sufficient at every eligible rank** (C-T1-F F-3; critic-attributed; STATED).
   - Statement: `3x(CB(d,m)) ≥ 2dm`, hence `3p ≥ 2dm + 6` at every eligible `p`, hence no deficiency by `CBstar` at `t = 1`.
   - I verified the proof: the binomial split `I = Σ_q C(m,q)T_q + E`; the means `2dm/3 + 2/3 + q(1 − d/6)` and `2dm/3 + 3/2`; each
     summand is nondecreasing up to its first mode `≥ ⌊mean⌋`. My census gives `min(3x − 2dm) ∈ {2, 3}` for `d ∈ {2, 4, 5, 6}`,
     `m ≤ 120/150`, and 0 first-rank hits.
   - Grade: `proved_informal` modulo Darroch, and at `CBstar`'s grade. Suggested key (C-T1-F):
     `E993-R30-CB-CHOKE-DEGREE-AT-MOST-SIX-SECTOR-DELETION-SUFFICIENT-AT-EVERY-ELIGIBLE-RANK`.
6. **Mean identity** `2d/3 − μ(d) = 2^d(d−6)/(6(2^d + 3^d))`, with `μ(d) = f_d′(1)/f_d(1)`. Proved (elementary; I re-derived
   it); critic-attributed to both T1 critics. It explains the `d ≥ 7` onset heuristically; the step "`x` ≈ mean" is unproved.
7. **Bounded records** (`bounded_computation`; never evidence in a proof):
   - the 59-hit rectangle census (four instruments);
   - switch-necessary first-rank rows for every `d ∈ [7, 16]` (C-T1-F; C-T1-U to `d = 12`; my first hits at `d = 9, 10`);
   - the E1 first-rank failure frontier (`CB(8,161)/859` first; `m_1(8) = 211`, `m_1(7) = 287`; my replay);
   - the top-deficient-rank band family (reconciliation item 2);
   - the WID fidelity at `G(8^82, 7^2)` at all 56 ranks (three independent instruments; the identity is the formally verified
     (WID), so this is a fidelity check, not a new result).
8. **T1 Step 2** (the `t = 1` defect count) is retained at the inherited `proved_informal` grade of `CBstar`. It is a count, not
   a set.

## Rejected and narrowed mechanisms

- **Rejected:** the allocation's (L-i) in its "every eligible `p` of `CB(8,m)`, `m ≥ m_0`" form. It is false on two critic
  instruments and on the adjudicator's replay. Any uniform switch-arc (HALL) through E1 must live at ranks `≥ ⌈μ_1⌉ + 2`, or must
  replace E1 by a non-E1 non-sector certificate below them.
- **Narrowed:** C-T1-F's "only a `d`-growing diagonal class" is narrowed to "only a diagonal class **at first eligible ranks**".
  At the top-deficient rank a fixed-`d` family exists (bounded; reconciliation item 2).
- **Struck literals (T1):**
  - the `F_p` derivation and `|F|` reporting;
  - the "independent `x`";
  - "`d ∈ {7, 8}` most likely";
  - "five smallest";
  - the Claim 2 ratio "match" as evidence;
  - "the argument is in fact a uniform proof".
- **Struck literals (T2):**
  - the two-sided `supply − capacity = S` (non-falsifiable);
  - "each with two instruments";
  - "up-degree exactly 448";
  - "9 shared tokens of 9".
- **Narrowed (T2):**
  - "two independent exact instruments" becomes one model with two checks, validated literally by critics and by me;
  - "`θ*_7 = 0` a fact of the instance";
  - "retires the entire known instance frontier";
  - `proved_conditional` is re-typed to `computer_assisted`, STATED.
- **No refuted mechanism is revived.**
  - T2 at 448 is not deletion-only Hall (the sector deficit is `R_447 − R_446 > 0`).
  - T2 at 449–503 is a finite restricted-scope deletion flow on one tree under registered keys, not
    `E993-R23-LITERAL-DELETE-ONLY-HALL` (a different weight and scope).
  - Capacities are literal `w_F`, never own-support unit capacity (C6-F4).
  - There is no per-leaf injection, occupancy, signed cross-tag or covariance step, and `|F ∩ B|` is never counted.
  - T1 proposes no mechanism.
- **No closed region re-proved.**
  - `G(8^82, 7^2)` has `n = 1427 ≤ 4p − 8` across its window and is in the lower region.
  - The `T_m`, spider and path-star families, the high tail and the order bands are untouched.
- **Other fences.** No census value enters a proof. There is no RTree wording. (LIFT) and (DCB) are unused. The controller's
  priors are cited as instruments only.

## Lean readiness

No seat in orientation T wrote Lean this cycle, so there are no `#print axioms` outputs or build logs to confirm. The
protocol's criteria (a) complete informal proof with a closed DAG, (b) compiled sorry-free fragments, and (c) named open nodes
give these rulings:

- **(WID)** at `SOLUTION-CONTRACT.md` §2 is already `formally_verified`: `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`, with
  `Main.lean` `86b59c6c…` receipt-bound. There is nothing to do in this orientation.
- **(HALL)** at full scope is **not ready**. There is no informal proof, and its open node is the whole theorem.
- **G(8^82, 7^2) keys (Established 1–2): NOT contract-ready.**
  - They are bounded, finite-instance certificates ("a bounded result never qualifies").
  - A Lean proof would further need E1-R and CD-1 formalized (both `proved_informal`), a Lean definition of heterogeneous CB trees,
    and a kernel-checkable exact certificate over a 1427-vertex instance, without `decide` over an enumeration.
  - (a) no: the proof is a finite certificate; (b) no fragments; (c) open nodes: formal E1-R, formal CD-1, a CB definition layer.
- **`α(CB(d,m)) = 1 + m(d+1)`:**
  - (a) yes, a two-node DAG (a clique-cover upper bound and an explicit independent set);
  - (b) no fragments; no CB graph definition of record exists (C4-LA1's `gkGraph` is `G_k`, not CB);
  - (c) the open node is the definition layer `E993Transport.cbGraph d m`.
  - Draft companion statement: `lemma cbGraph_indepNum (d m : ℕ) (hm : 1 ≤ m) : (cbGraph d m).indepNum = 1 + m * (d + 1)`.
  - Ready as a **companion** once a CB-class award exists. It is **not** an award group by itself: it has no (HALL) role and no
    registered key.
- **E1 rank-threshold lemma (Established 4) and the `d ≤ 6` lemma (Established 5): not ready.** The open node is Darroch's mode
  theorem for Poisson-binomial laws. It is not under `sources/`, and I did not search Mathlib for it, so I name it as open. The
  `d ≤ 6` lemma also consumes `CBstar` (`proved_informal`).
- **Contract-ready award groups in orientation T: none.**
- **Smallest unproved lemma for the T object (a′), `(L-S)_top`:**
  - Setting: `T = CB(8,m)`, `m ≥ 106`, `m ≢ 1 (mod 3)`, `p* = ⌊(16m+4)/3⌋`.
  - Claim: there exist nonnegative choke-local flows `pb(β,γ)`, `pc(β,γ)`, `σ(γ)` (`β + γ ≤ 8`), in closed form in `m`, such that
    - every sector source (`p* − 1` legs) has `Σ_i Out(state_i) ≥ 1`;
    - every in-sector target (`p* − 2` legs) has `Σ_i In(state_i) ≤ 1`;
    - `(8 − γ)σ(γ) ≤ θ·γ` with `θ ≤ 1 − ρ_(1,8)(p*)`, where `ρ_(1,8)(p*) = r_1(p*−1)/r_1(p*−2)` and
      `r_1 = (1+y)^7(1+2y)^{8(m−1)+1}`.
  - Companion lemma `(ELIG-top)`: `x(CB(8,m)) ≤ p* − 2`, and the arm and private leaves are favorable at `p*`, for the same `m`.
    This is bounded through `m = 300`; each of its three parts is a single-rank coefficient inequality.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

**Material progress.**
- T2: (HALL) at every eligible rank of the one open switch-necessary eligible row on record entering Cycle 5, and the first
  non-CB tree with a switch-arc certificate (`computer_assisted`, STATED, replayed on four instruments).
- Critic-derived, at `proved_informal` pending second reads (the Darroch dependency named):
  - the E1 rank-threshold lemma;
  - the `d ≤ 6` sector-sufficiency lemma;
  - the `α(CB)` formula.
- The adversarial-structural finding that the allocated (L-i) is false at first eligible ranks.
- The adjudicator's identification of the top-deficient-rank family. It turns (a′) from a mis-posed object into a concrete one.

The contract's plateau conditions (no material progress on (HALL), no new `proved_informal` lemma, no new adversarial finding)
are therefore not met. No decisive event occurred in T: no (HALL) award, and no confirmed (CUT).

**Ruling 39, letter by letter, on T evidence only.**
- **(a′) not supplied.**
  - Decisive instruments: T1's return (it attempted neither (L-i) nor (L-S)); C-T1-F F-4 and C-T1-U A4/A5 with my replay, which
    show the allocated form false at first ranks. No closed-form (L-S) exists at any grade.
- **(b′) half supplied.**
  - Whole-row (HALL) at `G(8^82,7^2)/448`, `computer_assisted`.
  - Decisive instruments: T2's exact LP output verified by C-T2-F's DP plus its literal laboratory on the actual row, by
    C-T2-U's convolution powers plus small literal labs, and by my affine path plus convolution plus 30/30 + 30/30 literal lab
    on the actual row.
  - Conditional on E1-R's load clause, as quoted in CF-T1.
  - An isolated second read is required.
  - The other half (a second infinite eligible family) is not in the T portfolio.
- **(c′) not supplied.** C-T2-F's falsification attempt at `G/448` found no deficient cut, and given E1-R the exact certificate
  excludes every `X ⊆ I_449`.
- **(d′) not supplied.** There is no Lean in T.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at orientation T's evidence grade:
- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: `still_open` at full scope. No complete informal proof exists, and no
  deficient cut has been replayed. It holds at the named restricted scope of `G(8^82, 7^2)`, all 56 eligible ranks, at
  `computer_assisted` STATED. This is a finite scope and never universal.
- **(WID)**: `formally_verified` from Cycle 1. It is not re-adjudicated here. Its fidelity at `G(8^82,7^2)` is re-checked by
  three independent instruments.
- **Outcome-B candidates in T.** None proves a part of (HALL) at `proved_informal`. The E1 rank-threshold lemma and the `d ≤ 6`
  lemma are scope lemmas on where E1 and the sector deficit apply, not Hall statements. `(L-S)_top` is unproved.
- **The primary aggregate** `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`: OPEN and untouched.

## Next-route allocation

**Exact remaining obligation for orientation T.** Prove a parameter-uniform (HALL) with load-bearing switch arcs on an infinite
switch-necessary class. The concrete class is `𝒞_8 = {(CB(8,m), ⌊(16m+4)/3⌋) : m ≥ 106, m ≢ 1 (mod 3)}` (or its `d = 7`
analogue, `m ≥ 142`, `m ≢ 2 (mod 3)`). It needs four pieces:
1. `(ELIG-top)`: eligibility and all-leaf favorability at `p*`.
2. E1 at every `q` at `p*`: this is C-T1-U's rank-threshold lemma, after its second read, with Darroch named.
3. `(L-S)_top`: a closed-form sector certificate.
4. Composition by B7 with the registered E1 key `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`.

Every step must keep `w_F` literal, (D) ∪ (S) literal, and `F_p` derived.

Also required before registration:
- isolated second reads of Established 1–2 (the 448 certificate, including its per-state table as data) and of Established 3–5;
- a registry-side confirmation that E1-R's load clause covers the one-choke switch-image targets containing `v`;
- a registrar lint of every proposed name.

**Route T-A (Cycle 6, if ruling 39 lets it run): `CB-TOP-DEFICIENT-RANK-UNIFORM-SWITCH-HALL`.**
- (i) Prove `(ELIG-top)`, a single-rank descent `i_{p*−1} < i_{p*−2}` plus two deleted-tree descents. Candidate route: the
  binomial split of C-T1-F F-3 at `d = 8` (summand means `2dm/3 + 2/3 − q/3`). But an upper bound on `x` needs a
  descent, which Darroch's mode bound alone does not supply, so this is the open step.
- (ii) Fit the five homogeneous certificates and the new per-state tables (T2's LP method, specialized to `d = 8`) as closed
  forms in `m` on each residue class. The data are: `θ*` values `96/495419`, `96/530501`, `96/566783` (`m ≡ 2`) and `16/65097`
  (`m ≡ 0`); the band rows `CB(8,95)/508`, `CB(8,98)/524`, `CB(8,110)`, `CB(8,111)`. Then prove the fitted affine separation
  uniformly.
- (iii) Compose.
- Validate every closed form against literal max-flow laboratories and the registered certificates **before** any uniform
  claim.
- Could close: (a′), a first parameter-uniform switch-arc restricted (HALL), at `proved_informal` (modulo Darroch), as a
  separate key.

**Route T-B: `CB-BAND-ROW-CERTIFICATES`** (fallback, and data for T-A).
- Apply T2's exact LP plus DP plus literal-lab method to the 49 uncertified rectangle rows whose first eligible rank is the band
  rank. The smallest are `CB(8,95)/508`, `CB(7,109)/510`, `CB(8,98)/524` and `CB(7,112)/524`. At the other 5 rows (first rank
  not the band rank), an exact all-`q` E1 check is needed first; E1 holds there at `q = 1`.
- Could close: `computer_assisted` restricted (HALL) at dozens of new switch-necessary rows, and the fitting data T-A needs. It
  cannot by itself supply (a′).

Rows below the band (first ranks with `p ≤ ⌈μ_1⌉ + 1`, such as `CB(8,161)/859`) need a non-E1 non-sector certificate. No T
route is proposed for them this cycle.

## Artifact inventory

**Deliverable:** this file only,
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/cycles/cycle-5/stage5/adjudicators/T/ADJUDICATION.md`.

**Scratch:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-adj-T/`. All
scripts use exact arithmetic, run under `python3 -B`, and ran in the foreground. There is no bytecode and no background job.

| File | SHA-256 | Role |
|---|---|---|
| `verify_capsule.py` | `6d4fc7fcc273155565269d169472b4461e035a61f0481e4d3884697eaa75e0ad` | capsule seal, 21 member digests, Stage 2/3/4 seals |
| `out_verify_capsule.txt` | `fe6332dcf8cf73ae9828e28478ed73ef20e92580d62a576ebefb0127bb7ae367` | its output |
| `adj_t2_cert.py` | `2a8bbed10461e413b6a64a66be2e3525814aaed93ce7c3690bd583fd57d2e8fd` | T2 certificate: affine path, convolution powers, switch caps, `ρ` (third method), nonnegativity |
| `out_adj_t2_cert.txt` | `af9424f13798cc332b57b8ab59fd9f7ce5315d4206e35cefa805126c68746852` | its output (`CERT_ADJ_OK True`) |
| `t2_cert_values_adj.json` | `2c421fccf52dae12e39fe8cbc73820ab19ed1e57d202295f6ae556e503378996` | the 141 per-state values (adjudicator serialization) |
| `adj_t2_r8.py` | `8d41089303e92a66e425cfa4fae471364913fd03f99eac4e7f22bbe6bb094551` | R8-dead maximum inflow (full characterization) |
| `out_adj_t2_r8.txt` | `686dd06e02d01b93a3811d47af921598bfae8a3fedaab9031394539556d3a65b` | its output (= 1) |
| `adj_t2_lab.py` | `9f6023d1ff6a49ae231a931c38fc29a40093aa1046d7356a6f09639f267cafa4` | literal (D) ∪ (S) laboratory on the actual row at 448 |
| `out_adj_t2_lab.txt` | `5bd808aa1f2896e228345aeabc1d2ed41ef1a05430494cf4890fd14f468cf121` | its output (30/30 + 30/30, 0 mismatches) |
| `adj_t2_row.py` | `396908b42443ee30530a9ee187fb6fecf8c398cdd19c85dc257a8e7f475f3f1f` | own closed forms; brute-force validation; `n`, `α`, `x`, window; `F_p` ×56; independent-sides WID ×56; unique deficient rank; E1-R criterion 248 × 56 |
| `out_adj_t2_row.txt` | `63e7f261b7014d1e24e47f8b60039d3fffd3a38448537d17b978e9dd7aee9b80` | its output |
| `adj_t2_delcheck.py` | `f79cfe4e730f78654f18b25b78ab0aeed4aa35782dee57474108b3b87b86c042` | `I(T−v)`, `I(T−c_d)` closed forms against brute force |
| `out_adj_t2_delcheck.txt` | `48ecd7bad36415201bd7e396a2af7148f7fe1f92f73e76f792d156a8b347105b` | its output |
| `S448_adj.txt` | `e33c509f97e4cb090b1b15aa9795b1767125dd029196d9de3323d7ba00f31e33` | `S(G(8^82,7^2), 448)`, equal to T2's value |
| `adj_t1_cb.py` | `3d7eac1e778e9ccfddf6b757a9e5438a7c02b77f2972e4a387beafab4ebceeb4` | CB census instrument (closed forms validated against a literal tree DP; `x` through `α`; `F_p`; E1 at `q = 1`; band rank) |
| `cb_d2_1_120.json` | `dc656964c98255193a10c1225dbb039a5d562d93d85e8f745fc666314bb5b35b` | `d = 2` rows |
| `cb_d4_1_120.json` | `c2c0425109ca488c2ddb73c9e401fb20bc3bd5c2d99bba828b0103342f6fb514` | `d = 4` rows |
| `cb_d5_1_120.json` | `1be287a7e455e962da9e0232008b1fd880207e7d3f1dcb7e266045bfe1084b10` | `d = 5` rows |
| `cb_d6_1_150.json` | `55b39b787849d036972e6c34bf522b396739c229156c5d63d78688e65acaf90d` | `d = 6` rows |
| `out_adj_t1_low.txt` | `ec08cfeb3c46ae040b04324008bb90ee28e4cdb6d2800eec7bd357e0496b321b` | `d ≤ 6`: 0 hits; `min(3x − 2dm) ∈ {2, 3}` |
| `cb_d8_1_300.json` | `adba1f07acfaa470782bfe77d730842cc2166832a8dea10da385a1f4b4987b23` | `d = 8`, `m ≤ 300` rows |
| `out_adj_t1_d8.txt` | `5c663d075a20a62e122de66de56813fdf82e64faba34d8b6e375950b6aa905b6` | its summary |
| `cb_d7_1_330.json` | `5512aae81d0387b11a8f9334605ca521c3d1612381ae990ed51a723d4c9a1565` | `d = 7`, `m ≤ 330` rows |
| `out_adj_t1_d7.txt` | `054f055f522b54429cf6e26e301d3e9955bacf53ddd016774e32ff6fe3dde090` | its summary |
| `cb_d9_105_115.json` | `7a50a6d27e5fa83226962fd21cfb4d1e5e7d70eb213316a5c18b602c0bb61a55` | `d = 9` rows |
| `cb_d10_100_108.json` | `3c346e5d5fee2524f7736966d7537f6b3b4cb973dcc6596f750866b781f694d1` | `d = 10` rows |
| `out_adj_t1_d9_10.txt` | `2bbbcaff5fd44cc178adfc92932d4e21161f13e28844799b1347fa0336a3765d` | first hits `CB(9,112)/673`, `CB(10,106)/708` |
| `out_adj_t1_band.txt` | `8e719bbc5fd34c8699835fabe3a0c58e16b098689dbb8fbbe0da26f12e6b4020` | top-deficient-rank band family (`d = 8`: `m ≥ 106`, `m ≢ 1`; `d = 7`: `m ≥ 142`, `m ≢ 2`) |
| `adj_t1_e1allq.py` | `bee863bc9cdd3ef39c364025bbe32986038501c8ec90ba075e39cfe79c5207de` | exact all-`q` E1 at 8 rows against the threshold lemma |
| `out_adj_t1_e1allq.txt` | `d6b8edaee8a20f9a6d68004ba42ac950bcfa570ff6a9c3b299af15903781b176` | its output |
| `out_adj_t1_rect.txt` | `75e5293c9eae2c27900390df13b6bd24fb17d2e2a54844946c857a3e714782d6` | T1's 59-hit set equals the adjudicator's |
| `out_adj_t1_frontier.txt` | `95548b6c0eafb1e5ca1d5b84abfed1469bcdffc7c9d0b5da0c36909b4cc21a4e` | 54 uncertified rectangle rows; 49 at the band rank; smallest rows |
| `t1copy/` | `t1_generator.py` `f969a378ed7459fdfd37b2c064ba5c5fbe91e4d5a5e483cab01d0f8cf863a136`; `REPLAY-OUTPUT.json` = `T1-GENERATOR-OUTPUT.json` `55ddca3ef3fb371e9678ca2a80a785a4de2b2bc06da1e972e004228fb3e980f9` | T1 replay, byte-identical |
| `t2copy/` | 13 inventoried files (13/13 digests match the return); `re_out_*.txt` byte-identical to the shipped outputs | T2 replay |

Replay: `cd` into the scratch directory and run `python3 -B <script>`. `adj_t1_cb.py` takes `d m_lo m_hi` as arguments.
`adj_t2_cert.py` imports T2's LP from `t2copy/` only to generate candidate values.
