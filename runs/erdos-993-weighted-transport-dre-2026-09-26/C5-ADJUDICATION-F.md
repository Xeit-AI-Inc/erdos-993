# Orientation Adjudication

Adjudicator: `ADJ-F`, the isolated Stage 5 adjudicator of orientation F (falsify), Cycle 5 of r30 (Erdős #993: correctly weighted
mixed-boundary transport for the remaining ordinary-tree favorable-leaf aggregate). Portfolio: returns `F1` (`C5-F-01
CB-SMALL-SWITCH-CAPACITY-SECTOR-CUT-SEARCH`) and `F2` (`C5-F-02 PER-TAG-INJECTION-FRONTIER`), and their critiques `C-F1-T`, `C-F1-U`,
`C-F2-T`, `C-F2-U`. Date 2026-09-27.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The tool display cut the middle of `verity.md` on the first read, so I
printed that middle section of the same file once more. I loaded no other VerityOS subsystem. The host injected the project
`CLAUDE.md` and the auto-memory index into context. I did not act on either. The dispatch confines my writes to this file and my
scratch, so I kept no conversation log.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

**Dispatch.** `control/dispatch/c5-stage5/DISPATCH-ADJ-F.md` has SHA-256
`d35d09fb5b47e26f756a394a81fb76f31042c628574c55dce2d3953d2fc2eee1`. I hashed it before reading it, and it matches.

**Capsule seal.** `control/c5-adjudicator-capsules/F-PACKET-MANIFEST.json` has inner seal
**`a75ea8f8819d32f821830af63087e5f8ef3eafb094a51d5a87f20060fe4e0553`**. I recomputed it from the canonical JSON without `seal_sha256`
(sort_keys, separators `(",", ":")`, no trailing newline), and it matches. All 21 listed members match on byte count and SHA-256:
- the protocol and both contracts;
- `C5-ALLOCATION.md` and `C5-STAGE1-GATE.md`;
- the Stage 2, 3 and 4 packet manifests;
- the Stage 3 and Stage 4 admissions and read-boundary disclosures;
- the controller facts record (`4db754c9…`) and `PATH-CHECK-F.json`;
- the two returns (`0f4dac9d…`, `c3c15b48…`) and the four critiques (`51559bb5…`, `8f9b04e3…`, `0b19344d…`, `e1953d19…`).

**Recomputed seals.**

| Manifest | Recomputed seal | Result |
|---|---|---|
| Stage 2 (`C5-STAGE2-PACKET-MANIFEST.json`, 1,400 members) | `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289` | equal |
| Stage 3 (63 members) | `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58` | equal |
| Stage 4 packet (83 members) | `b7b0bcedfb6117021fe99bdf065b24d5a45509f10bdf5dbe1bd48cd0feb47169` | equal |

The Stage 3 manifest lists both F returns at the capsule digests. The Stage 4 manifest lists all four F critiques at the capsule
digests. Both admissions record `admit` with zero findings. (The critics' `8987ae61…` is the Stage 4 **dispatch** manifest, not a
member of my capsule. The difference is not a discrepancy.)

**Frozen sources.** `control/SOURCE-DIGESTS.json` lists 981 files under `sources/`, and all 981 match with none missing. Within those
I checked the three used here directly:
- `ordinary_tree_checked.py` `a012bb78…`;
- `cb-switch-cut/RESULTS.json` `873cf922…`;
- `authority/CLAIM-IDENTITY.json` `eba20be3…`.

**Errata carried.** R30-E-j (CF-1) is confirmed. All four F critics report that `C5-CRITIC-PROTOCOL.md` duty 1 quotes a stale Stage 2
seal `f0b5a2a1…`, and each resolved it by recomputation. None of this affects any F number.

**Artifact audit (seat inventories).** I copied out and replayed from the critics' inventoried scratch, and each critic's report of
its own replay of F1 and F2 stands. My replays of the critics' own instruments are listed under `## Artifact inventory`.

**Seat and critic disclosures weighed** (from the two disclosure records):
- F1's self-disclosed `ps aux`: a full process listing, a rule violation, with no content used.
- F2's failed absolute temp redirect, which wrote nothing.
- Four F critics ran a seal-string `grep` over `control/*` while tracing R30-E-j. This is the controller's erratum, and the search
  was above their grant.
- C-F1-U and C-F2-U each ran a `grep -rl` rooted at `sources/`, which listed file names in the fenced `sources/heterogeneous-closure/`.
  Neither opened anything there.
- C-F1-T ran `head -40` on the attack briefs.

None of these items carries mathematical content into any finding. I weigh them as process flags only.

## Route-by-route decisions

### F1 — `C5-F-01 CB-SMALL-SWITCH-CAPACITY-SECTOR-CUT-SEARCH` (seat verdict `bounded_evidence`)

**Fidelity first.**
- The weight is `w_F` with active tags. The arm tag `v` is active through `r`, and a private tag `c_ij` through its choke `u_i`.
- The relation is (D) ∪ (S), used literally.
- `F_p` is derived per orbit from `Δ_p(T − v) < 0` on the original tree.
- `x` is computed through rank `α`.

What fails is the S-assertion. `supply − capacity = S` is two-sided only on five **non-eligible** laboratories, and `F_p = ∅` on three
of them. At the five certificate rows and on the 1,278 grid rows, `S` is one-sided or absent. Both critics state this, and I confirm
it from the shipped `row_table.py` logic as the critics describe it.

**Claim-by-claim resolution.** C-F1-T is the T critic and C-F1-U the U critic. Neither critic contradicts the other on any claim.
Where one is silent, I decide by my own replay.

| # | F1 claim | C-F1-T | C-F1-U | Replay evidence | Ruling |
|---|---|---|---|---|---|
| 1 | Full-sector and `X′` closed forms (with the corrected `C(d,ℓ)` switch-target collapse) | re-derived; 11/11 shipped brute-force points | re-derived state by state | My literal sector network (`cb_adj.py small`, 8 points, `F` = all leaves) matches the closed form exactly, including `(4,2,4)` 448/200 and `(2,2,4)` 32/40. My 16/16 closed forms equal a generic DP on the explicit trees. | **RETAINED** as an exact counting record. This is the sector-level instance of registered facts, not a key. |
| 2 | No deficient row on the 1,278-row grid `d ∈ [2,25]`, `m ∈ [2,15]` | vacuous: 0 of 1,278 rows are sector-deletion-deficient | vacuous: same | My scan finds no sector-deletion-deficient eligible row for any `d ≤ 14` at `m ≤ 85`. The criterion `3p < 2dm + 5` fails on the grid. | **NARROWED** to "no sector-deletion-deficient eligible row exists in the grid; switch capacity was never tested." |
| 3 | `CB(25,14)/236` is the row minimising switch capacity relative to deficit; the trend | struck (deletion slack `3/232` plus switch 0.0063) | struck (not the allocation's metric) | none needed | **STRUCK** |
| 4 | "17 small instances", "all 17" | struck to 11 | struck to 11 | — | **STRUCK** to 11 shipped points. The one restricted point `(4,2,4)` 136/96 is critic-confirmed. |
| 5 | "5/5 WID including two with `F_p` empty" | three are empty | three are empty; all five non-eligible | — | **CORRECTED** to three empty. None of the five is eligible. |
| 6 | §7 table magnitudes (`×10^332` …) | struck | struck | Mine: `5.860e326`/`8.393e327`, `1.627e338`/`2.405e339`, `4.520e349`/`6.893e350`, `4.919e410`/`8.717e411`, `2.311e479`/`6.942e480`. The ratio column (13.3213 … 29.0341) is correct. | **STRUCK** (magnitudes). Margin column **RETAINED**. |
| 7 | "352-digit" `S` reproduced bit-for-bit | 351 digits; match true | 351 digits; no shipped script makes the comparison | `cb_rows.py`: my `S` at `CB(8,92)/492` equals the frozen `aggregate`, and my `P` equals the frozen `P`. `S` has 351 digits. | Fact **RETAINED**, literal **CORRECTED**. It is backed by the critics and by me, not by F1's code. |
| 8 | "`(4,2,4)` … non-deficient in both" | silent | false (448 > 200) | literal network: 448 vs 200 at `F` = all leaves (`F_p = ∅` there) | **STRUCK** |
| 9 | `Aut` is "`S_m` × `S_d`"; it may enlarge at `d = m` | silent | false: `Aut = S_d ≀ S_m`; no enlargement for `d = m ≥ 2` | Checked by hand. `r` is the only vertex with exactly one degree-2 neighbour. Each choke has `d ≥ 2` of them, so `r`, `s` and `v` are fixed. | **STRUCK**, corrected to `S_d ≀ S_m` |
| 10 | Gate-31 line: every `S` assertion is two-sided from independent sides | overbroad | overbroad | — | **STRUCK** as overbroad |
| 11 | `\|F\|` in `ROW-TABLE.json` | hard-coded, value right | hard-coded, value right | My scan derives `F_p` = all leaves on all 223 deficient rows and at my four explicit rows. | value **RETAINED**, literal flagged (ruling 42) |
| 12 | "the graph … in `ROW-TABLE.json`" | silent | false | Fields are `d, m, p, n, alpha, x, Fsize, supply_X, neighbor_X, margin, ratio_num, ratio_den, deficient, S`; there is no graph field. | **STRUCK** |
| 13 | "window 25" | 26 ranks scanned | silent | — | trivial correction |

**Obligation audit.**
- **(a)** The closed-form enumeration of sector-deletion-deficient eligible ranks was **not delivered**. **(b)** was **not delivered**,
  since F1's metric is not the allocation's.
- **(c)** was decided for two invariant families at rows where the switch is not needed.
- **(d)** was not engaged because there was no deficit.

**Verdict.** F1 is **retained narrowed** at `bounded_computation`. What survives is the literal sector closed forms and their
brute-force validation. No (CUT) candidate.

**Critic-derived advances on F1's object (critic-attributed; `bounded_computation`).**
- **A.** C-F1-U A3 gives the enumeration F1 did not produce: **223 sector-deletion-deficient eligible CB rows** (`d ≤ 11` with
  `m ≤ 160`; `d = 12, 13` with `m ≤ 260`). By `d = 7 … 13` the counts are 24, 52, 49, 30, 9, 49 and 10. Every row sits at the first
  eligible rank `p = x + 2`, and every row has `F_p` = all leaves.
  - C-F1-T A2 independently gives the `d ≤ 11` part: 164 of 103,835 eligible rows for `d ≤ 14`, `m ≤ 160`. It also finds the first
    `d = 12` row, `CB(12,212)/1697`.
  - Controller replay CF-REPLAY-c5b is one more instrument.
  - **My own scan reproduces every count.** It gives 103,835 eligible rows for `d ≤ 14`, `m ≤ 160`, of which 164 are
    switch-necessary, plus 49 and 10 for `d = 12, 13` at `m ∈ [161, 260]`. The `d = 8` list matches (`86, 89, 92, 95, 98, 101, 104,
    107, 108, 110, …`). There are none for `d ≤ 6` and none for `d ∈ {12, 13, 14}` at `m ≤ 160`.
  - So four instruments agree. Only five of these rows carry a certificate (the five-row key).
- **B.** C-F1-U A4: **full-sector Hall holds on all 223 rows**. The switch weight over the deletion deficit is at least
  **4401.4666**, with the minimum at `CB(9,112)/673`. Per-`d` minima from my scan:
  - `d = 7`: 9785.48 at `CB(7,144)/673`;
  - `d = 8`: 4833.89 at `CB(8,108)/577`;
  - `d = 10`: 4813.96 at `CB(10,158)/1054`;
  - `d = 11`: 8372.61 at `CB(11,134)/984`;
  - `d = 12`: 8318.17 at `CB(12,212)/1697`;
  - `d = 13`: 15577.09 at `CB(13,232)/2012`.

  C-F1-T's "about 3,000" lower end is imprecise. Its own table gives about 4,397 at `CB(9,112)/673`, and the exact value 4401.4666
  replaces it. The asymptotic `(dm)²(2/3)^d / (3(1 + j))` given by both critics is a **conjecture**.
- **C.** **Family tests at switch-necessary rows. None is deficient.**
  - C-F1-T: choke-count families `{N_β ≤, =, ≥ k}` over five type-sets, 1,209–1,865 per row. I replayed them **byte-identically**
    at six rows: `CB(8,86)/460`, `CB(8,92)/492`, `CB(7,109)/510`, `CB(9,112)/673`, `CB(10,106)/708` and `CB(11,134)/984`. The
    minimum slack is 0.994–0.998 (in family `a = 0, = m`). C-F1-T also ran total-support families (not replayed by me) and a seventh
    row, `CB(12,212)/1697` (not replayed).
  - C-F1-U: 40 and 45 named product families at `CB(8,86)/460` and `CB(9,112)/673`. I replayed them, and the output equals the
    original except for the wall-clock `secs` field. The worst family is `b ≤ 1`, with relative margin 0.799 and 0.765.
- **D.** Two instruments at uncertified rows (`cb_rows.py`: closed forms against a generic DP on the explicit tree):

  | Row | `n` | `α` | `x` | eligible | `F_p` | `S` | sector supply / deletion | switch / deficit |
  |---|---|---|---|---|---|---|---|---|
  | `CB(8,95)/508` | 1618 | 856 | 506 | yes | 761 of 761 | `< 0`, 363 digits | `508/507` | 7476.32 |
  | `CB(7,109)/510` | 1638 | 873 | 508 | yes | 764 of 764 | `< 0`, 366 digits | `510/509` | 11215.79 |
  | `CB(9,112)/673` | 2131 | 1121 | 671 | yes | 1009 of 1009 | `< 0`, 481 digits | `337/336` | 4401.47 |

  At `CB(8,92)/492`, `S` and `P` equal the frozen record.

**Letters (ruling 39) from F1:** none. There is no (CUT) candidate, so (c′) is **not supplied**.

### F2 — `C5-F-02 PER-TAG-INJECTION-FRONTIER` (seat verdict `bounded_evidence`)

**Fidelity.** Both critics read F2's instrument against the contract, and my replay agrees. The weight is literal `w_F` (not
`|F ∩ B|`). The relation is literal (D) ∪ (S). `F_p` is derived, and `x` is computed through `α`. WID is asserted two-sided on all
56 rows, from literal enumeration against the DP aggregate. Fidelity passes.

**Claim-by-claim resolution.** The two critics are concordant on every claim.

| # | F2 claim | C-F2-T | C-F2-U | Replay evidence | Ruling |
|---|---|---|---|---|---|
| 1 | 56 eligible rows, WID on all, no per-tag failure, joint deletion-only and full flows saturate | backed: byte-identical replay; its own instrument agrees at 3 rows; 124 trees, 56 rows; cap never binds | backed: byte-identical; identical row multiset; 2 literal rows | `a7_check.py` reproduces `G_5`/cherry = 1/`p = 8`: 3125/6100/−2975, summands `[−945, −406×5, 0]` | **RETAINED** at `bounded_computation` |
| 2 | "every per-leaf summand strictly negative" | false on 3 rows | false on 3 rows (cherry tag vacuous) | My `k = 5, 6, 7` rows each carry one 0 summand (the cherry leaf) | **STRUCK** |
| 3 | "`n` up to 30" | largest completed `n = 26` | largest `T(8,2)` `n = 26` | — | **STRUCK** to 26 |
| 4 | "exhaustive census over a STATED order range" | not an order census (ruling 42) | struck as worded | — | **NARROWED** to a family-parameter range; obligation (b) was not executed as chartered |
| 5 | "validated against CT-1's own construction"; "CT-1's operational reach … further than the heuristic predicted" | narrowed to one recorded row | the census tests matching existence, not the symmetric-chain construction | — | **NARROWED** to "per-tag deletion injections exist on those 56 rows" |
| 6 | "none of the ten refuted keys concerns a per-tag deletion-injection test" | substantive; asks the adjudicator to byte-compare | inaccurate; F2's graph is exactly the support graph of `d_p` | See below | **CORRECTED** |
| 7 | lexical alias check: "0 matches" for `DELETION-INJECTION` | silent | struck as unbacked | The frozen master (`sources/authority/CLAIM-IDENTITY.json`) contains `E993-R26-DELETION-INJECTION-FIBRE-BOUND` with alias `"deletion injection"` and alias pattern `deletion.injection`. The gate says the run-local registry carries the master in full, so the literal is contradicted. | **STRUCK**. The working vocabulary "deletion injection" must never appear in an r30 key or alias. |
| 8 | the sufficiency argument (per-tag injections for every `τ ∈ F` give a deletion-only saturating flow for any `F`) | correct; `proved_informal`-level | correct | My `a7_check.py` assembles exactly this flow and checks out-flow = `w_F(B)` and in-flow ≤ `w_F(A)` literally | **RETAINED** (F2's statement, verified three times). Elementary. |
| 9 | `MANIFEST.json` byte-identical in `c5-F2-replay/` | outside grant | outside grant | outside my grant too | unverified; immaterial, because every shipped output replays byte-identically |

**Row 6 in detail: the refuted-key distinction, byte-compared.** The registered statement of `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`
(REFUTED; witness order 91) asserts that the rational linear map `d_p` on marked independent `p`-sets of `H_v` is injective. Each
set is sent to the sum of its one-vertex deletions that still meet `W_v`. Under `B ↦ B ∖ {τ}`, F2's per-tag bipartite graph is
exactly the support graph of `d_p`. Injectivity gives a nonzero maximal minor and hence a saturating matching, so F2's criterion
is the strictly weaker combinatorial shadow of the refuted statement. F2 makes no universal claim, so **nothing is revived**. The
universal per-tag statement is itself **refuted by counting** at `T_22/34` (C-F2-U A5, replayed below), the same order-91 family
as the registered witness. The return's paragraph is replaced by this one.

**Obligation audit.**
- **(a)** was delivered at bounded scope on hand-picked families.
- **(b)**, the all-trees order census, was not delivered by the seat. The critics supplied it.

**Verdict.** F2 is **retained narrowed** at `bounded_computation`. No key comes from the seat.

**Critic-derived advances on F2's object (critic-attributed).**
- **E. Exhaustive order census** (`bounded_computation`).
  - **C-F2-T** covers every free tree of orders 13–18: 51,123 eligible rows. **C-F2-U** covers orders 13–19: 195,644 eligible rows.
    Their per-order counts agree on the overlap: 163, 313, 528, 2,763, 10,061 and 37,295, plus 144,521 at order 19.
  - **My independent instrument** (`f2_adj.py`) uses my own free-tree generator, whose counts are asserted equal to A000055, and my
    own augmenting-path matching on every tag with no orbit reduction. On orders 13–17 it finds 13,828 eligible rows with the same
    per-order counts. On every row `F_p` = all leaves, WID holds two-sided, and there is **no per-tag failure and no positive
    summand**.
  - The maximum `S` is −192 at order 15, matching C-F2-T. Rows with a zero summand number 0, 1, 10, 68 and 271 at orders 13–17.
  - I also replayed both critics' instruments copy-out-first. C-F2-T `census_all.py 15 13` reproduced its 1,004 rows identically.
    C-F2-U `elig_scan.py 13 18` was byte-identical, and `ptag_census.py 13 16` matched its summaries.
  - Consequence (bounded): with the sufficiency argument, (HALL) holds with deletion arcs alone at every eligible row of every tree
    of order ≤ 19. A row where every summand is ≤ 0 but some per-tag injection fails would have order ≥ 20. So would the first
    eligible row with a positive leaf summand.
- **F. Laboratory per-tag failures** (C-F2-T; non-eligible ranks, orders 8, 10 and 13). I replayed the hand-checkable order-10
  violator: `x = 4`, `α = 8`, `p = 4`, not eligible, `|X| = 35` and `|N(X)| = 34`. These are laboratory facts, not evidence about (HALL).
- **G. C-F2-U A5** (proved on the face; replayed). At `T_22/34` (`n = 91`, `α = 68`, `x = 32`, eligible, `ℓ` favorable), the
  distinguished leaf's summand is `+212336130412243110 = C(66,33) − C(66,32)`. Per-tag deletion injection is impossible there by
  counting, while (HALL) saturates there on record. So the per-tag mechanism is strictly weaker than (HALL), and CT-1-type
  arguments give family theorems only.
- **H. C-F2-U A7: (HALL) with deletion arcs on the spider `S(1,2,3^k)`** (STATED; proposed `proved_informal`). I verified it in full,
  as recorded under `## Established results`. It is the only candidate on record for the second half of letter (b′).
- **I. C-F2-U A8** (degree-counting no-go: `|U_A| = α(T[U_A]) + ν(T[U_A])` on forests, and the crude bound recovers exactly the closed
  high tail). I accept it as a STATED critic remark. I checked the König–Gallai step, but I did not replay the `G_k` counterexample.

**Letters (ruling 39) from F2:**
- **(b′) second half: candidate supplied, critic-attributed (C-F2-U A7)**, and verified by this adjudicator. It still needs the
  synthesis to STATE it and an isolated second read to confirm it.
- (a′), (c′) and (d′): none.

## Cross-route reconciliation

1. **F1's and F2's objects are the same phenomenon (adjudicator-derived; elementary).** On `CB(d,m)` the arm tag `v` has
   `q_v = x·D^m`, so `q_v(j) = 2^{j−1}·C(dm, j−1)`. The members of `I_{p+1}` in which `v` is active are exactly the root-plus-arm
   sector, and its deletion shadow in `I_p` has size `q_v(p−1)`. Hence

   `sector supply − sector deletion shadow = q_v(p) − q_v(p−1)` = **the arm leaf's own summand**.

   A row is "sector-deletion-deficient / switch-necessary" (F1's object) **if and only if the arm tag has a positive summand**, which
   is exactly where F2's per-tag deletion injection fails by counting. So all 223 switch-necessary CB rows (order ≥ 1465) and the
   `T_m` rows (order ≥ 91) are positive-summand rows, while through order 19 no eligible row has one (E). The frontier where
   **cross-tag routing or switch arcs become necessary** therefore lies somewhere in orders 20–91. The smallest known instance is
   `T_22/34` at order 91, and its (HALL) is of record by the orbit-flow instrument.
2. **Where a (CUT) could still live.** Two places remain untested:
   - On the CB pattern, sector-level Hall has a surplus of at least 4,401 times the deficit over all 223 rows and every tested
     invariant family. That leaves (i) competition between sector and non-sector sources for shared targets (C-F1-T A4). CF-F4 records
     a non-eligible `CB(11,2)/16` whole-network deficit whose maximizer mixes sector and regime-3 orbits. That record comes from the
     U-orientation critic C-U2-F. It is outside my capsule, and I weigh it as a controller prior only.
   - (ii) The not-yet-located first positive-summand rows in orders 20–90, where neither the CB sector structure nor the `T_m`
     orbit flow applies.

   Neither F route searched either place.
3. **No route or critic contradicts another.** The paired critics disagree only in precision (the "3,000" figure), and my replays
   decide it.

## Established results

**Grades are at the evidence named. "Critic-attributed" follows protocol check 2. Nothing below is (HALL) at full scope.**

**E-1. (HALL) with deletion arcs on the spider family `S(1,2,3^k)`** — critic-attributed (C-F2-U A7). Graded `proved_informal`
candidate; the adjudicator verified it in full; isolated second read pending.
- *Tree.* `T_k`: root `0`, pendant leaf `1`, pendant path `0–2–3`, and `k` pendant paths `0–a_i–b_i–c_i`. So `n = 3k+4`, and the
  leaves are `{1, 3, c_1, …, c_k}`.
- *Statement.* For every `k ≥ 1`, every natural `p ≥ k+2` and every `F ⊆` leaves, the network `(I_{p+1}(T_k), I_p(T_k), w_F)`
  restricted to deletion arcs (D) has a saturating integral flow. Hence the (D) ∪ (S) network has one too.
- *Hypotheses consumed:*
  - `IsTree`: connectivity and acyclicity are used only through the component structure of `T_k` minus a closed neighbourhood;
  - finiteness;
  - `p ≥ k+2`.

  No eligibility is needed for the flow statement, and no quotient step is used.
- *Proof check.*
  - **Sufficiency.** Per-tag injections along (D) into targets where the tag stays active give out-flow `w_F(B)` and in-flow at most
    `w_F(A)`.
  - **Tip `c_i`** (`W = {a_i}`). The remainder poset is `I({1}) × I(2–3) × Π_{j≠i} I(P_3)`, with factor chain partitions `∅<{1}`;
    `∅<{2}`, `{3}`; and `∅<{a}<{a,c}`, `{b}`, `{c}`. The maximal centres are ½, 1 and 1 each, so `c_max = k + ½`. The step-down
    condition `p − 1 ≥ c_max + ½` holds exactly when `p ≥ k+2`.
  - **Leaf `1`** (`W = {2, a_1, …, a_k}`). Split by the first root present. Every class has `c_max = k`. Deletions inside a class
    never add a root or remove the class root, so the class images are disjoint.
  - **Cherry leaf `3`** (`W = {0}`). There are no sources, because the remainder's maximum rank is `k < p − 1`.
  - All three are correct.
  - **The "classical dependency" is discharged on the face.** For saturated chains of lengths `h` and `L` with centres `c_1` and
    `c_2`, the grid `[0,h] × [0,L]` is partitioned by the hooks
    `C_t = {(i,t) : 0 ≤ i ≤ h−t} ∪ {(h−t, j) : t < j ≤ L}`, for `0 ≤ t ≤ min(h,L)`.
    Each hook is saturated and symmetric about `c_1 + c_2`. The point `(i,j)` lies in `C_j` if `i ≤ h−j`, and otherwise in
    `C_{h−i}`, so the hooks are disjoint and cover the grid. Iterating over factors gives the product chain partition with every
    centre at most `Σ` of the factor maxima. So de Bruijn–Tengbergen–Kruyswijk is not needed as an import.
- *Two instruments.*
  - (i) The written proof, checked step by step above.
  - (ii) `a7_check.py` implements **this exact construction** (the hook chains and the chain-predecessor map), not a matching. For
    every `k = 1..7` and **every** `p ∈ [k+2, α]` it asserts:
    - the map's domain is exactly the `τ`-active `(p+1)`-sets;
    - no chain bottom is hit;
    - the map is injective, and each image is a one-vertex deletion that keeps `τ` active;
    - the assembled flow saturates, for `F` = all leaves and for `F = F_p`.
  - C-F2-U's `gk1_out.txt` is a third, matching-based instrument, covering `k ≤ 6`.
- *Eligibility.*
  - `I(T_k) = (1+y)(1+2y)(1+3y+y²)^k + y(1+y)(1+2y)^k`. This follows directly by conditioning on the root; it is also
    `E993-PAIR-SPIDER-CLOSED-FORM`, VERIFIED. It equals my generic DP for `k ≤ 300`.
  - `α = 2k+2`.
  - With `e_j` the coefficients of `(1+3y+y²)^k` and `g = (1+y)(1+2y)^k`, the descent identity
    `Δ_{k+1} = (e_{k+2} − e_k) − k·2^{k−1} < 0` holds. This uses palindromy and unimodality of `(1+3y+y²)^k` (real-rooted), together
    with `g_{k+1} = 2^k` and `g_k = 2^k + k·2^{k−1}`. It is checked for `k ≤ 300`.
  - Hence `x ≤ k+1`, **and `p = k+3` is eligible for every `k ≥ 5`, proved** (answering CF-F3). This holds because
    `3(k+3) < 4k+5 ⇔ k ≥ 5`.
- *Adjudicator-derived complement (STATED here; needs an isolated second read): `x(T_k) = k+1` for every `k ≥ 5`.*
  - For `1 ≤ j ≤ k−1`, `Δ_j = (e_{j+1}−e_j) + 3(e_j−e_{j−1}) + 2(e_{j−1}−e_{j−2}) + (g_j−g_{j−1})`. The three `e`-differences are
    ≥ 0.
  - When `j ≤ (2k+2)/3`, the `g`-difference is also ≥ 0. This is because `C(k,j)2^j` is nondecreasing there.
  - When `(2k+2)/3 < j ≤ k−1`, use three bounds:
    - Newton's inequality at the centre gives `e_k ≥ (1+1/k)·e_{k−1}`, and log-concavity then gives `e_j − e_{j−1} ≥ e_{j−1}/k`;
    - `e_{j−1} ≥ C(k,j−1)·3^{j−1}`;
    - `g_{j−1} ≤ C(k,j−1)·2^{j−1}·(k+4)/6`.

    So `Δ_j ≥ 0` whenever `(3/2)^{j−1} ≥ k(k+4)/18`, which holds for all such `j`.
  - At `j = k`, `Δ_k ≥ 2e_{k−1}/k − g_{k−1}`, which is ≥ 0 when `(3/2)^{k−1} ≥ k(k+3)/8`. That holds for `k ≥ 5`.
  - `xlower_check.py` verifies every sufficient inequality exactly for `k ≤ 120`. Past that, the exponential side grows faster than
    the quadratic side. `a7_check.py` confirms `x = k+1` directly for `k ≤ 300`.
- *Corollary.* **(HALL) holds at every eligible `(T_k, p)`, `k ≥ 5`.** The eligible window is `[k+3, ⌊(4k+4)/3⌋]`, nonempty exactly
  when `k ≥ 5`. By FLOW⇒SIGN (C1-LA2) it follows that `S(T_k, p) ≤ 0`. That is a corollary only, not an aggregate contribution.
- *Fences.*
  - These rows have `n = 3k+4 > 2p+2` at `p = k+3`, `k ≥ 5`, so they lie in the unresolved band. Nothing closed is re-proved.
  - `S(1,2,3^k)` is not the equal-length-three spider `S(3^m)` and not a path-star. It is not `G_k` either, since `G_k` has a two-leaf
    cherry at vertex `2` and `n = 3k+5`.
  - This is a family theorem. It is not (HALL), and not the primary aggregate.
  - Its mechanism is the per-tag matching shadow of the refuted per-leaf key, scoped to one family (row 6 above). It is not a
    revival.
- *Lexical alias check.* I checked the critic's candidate key
  `E993-R30-SPIDER-ONE-TWO-AND-K-THREES-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-2-FOR-EVERY-LEAF-TAG-SET` against
  every alias and alias pattern of the frozen 434-entry master, with no hit. The run-local registry, especially the `G_k` flow key's
  patterns, is not in my capsule. **The synthesis must run that check.**

**E-2. Per-tag sufficiency lemma** (F2's statement; verified by C-F2-T, C-F2-U and this adjudicator). On any finite simple graph, for
any tag set `F` and rank `p`: if every `τ ∈ F` has an injection from the `τ`-active `(p+1)`-sets into the `τ`-active `p`-sets along
(D) arcs, then a saturating deletion-only flow exists. Elementary; `proved_informal`-level. It is probably already a node of
C4-LA1's DAG, which I cannot see in my capsule. It is a companion lemma, not a key.

**E-3. Bounded records** (`bounded_computation`, critic-attributed, and replayed by me where stated).
- (i) The 223-row switch-necessary eligible CB census and its full-sector surplus of at least 4401.4666 (A, B).
- (ii) The CB family scans (C).
- (iii) Deletion-only (HALL) at every eligible row of every tree of order ≤ 19, with no positive summand there (E).
- (iv) Laboratory per-tag failures at non-eligible ranks (F).
- (v) The `T_22/34` per-tag impossibility (G). Its closed form `C(3m, p−1) − C(3m, p−2)` is proved on the face, so the mechanism
  scope note is `proved_informal`.
- (vi) The identity "arm-tag summand = sector deletion deficit" on `CB(d,m)`. This is adjudicator-derived and elementary; it is
  cross-route item 1.

**Imported results used at their grades:**
- (WID), C1-LA1, `formally_verified`: used as a fidelity check only.
- FLOW⇒SIGN, C1-LA2, `formally_verified`: corollary only.
- `E993-PAIR-SPIDER-CLOSED-FORM`, `proved_informal`: re-derived directly.
- The (HALL) record at `T_22/34`, `bounded_computation` lifted by (LIFT): cited, not re-proved.

**Record corrections:** all STRUCK and CORRECTED rows in the two claim tables above.

## Rejected and narrowed mechanisms

- **Per-tag deletion injection as a route to full (HALL): REJECTED at universal scope.**
  - It fails by counting at every positive-summand eligible row. `T_22/34` is proved; all 223 switch-necessary CB rows fail at the
    arm tag.
  - It is the matching shadow of the REFUTED `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`.
  - Retained only as a family-theorem method (E-1, and C4-LA1's `G_k`).
- **Sector-level analysis as a (CUT) search on the CB pattern: NARROWED.**
  - The full sector and every tested invariant family are non-deficient with a large surplus.
  - A sector family that is non-deficient does not give a flow, because competition with non-sector sources is untested.
  - A sector deficit would not be a (CUT) either, unless every condition of SEMANTIC-CONTRACT §1.2 holds for the whole network's
    `N(X)`. Here `N(X)` is literal, so a sector family IS a legitimate `X ⊆ I_{p+1}`. No deficit exists.
- **F1's small-`m` grid as evidence about switch capacity: REJECTED.** It contains no switch-necessary row.
- **Heuristics stay conjectures.**
  - "switch/deficit ≈ `(dm)²(2/3)^d/(3(1+j))`" (both F1 critics): conjecture.
  - "switch ≥ c·supply uniformly" (C-F1-T): STATED, unproved.
  - "stranded witness needs `p ≤ x+1`" (C-F2-T): heuristic.
- **No refuted mechanism is revived** by either route or any critic. F2's refuted-key paragraph is replaced by the corrected
  distinction (F2 claim-table row 6).

**Adversarial record (protocol check 7).**

*Horizons attained:*
- **CB pattern, homogeneous only.** Every eligible rank for `d ≤ 14` at `m ≤ 160`, and for `d = 12, 13` at `m ≤ 260`: four
  instruments, one of them mine.
- **All free trees, every eligible rank.** Orders 13–19 by C-F2-U; 13–18 by C-F2-T; 13–17 by me.
- **Named families.** F2's 124 trees, the `S(1,2,3^k)` family for `k ≤ 7` literal and `k ≤ 300` by counts, and `T_22/34`.

*Families searched:* at switch-necessary CB rows, the full sector, choke-count multiset families, product families, and
total-support families.

*Not searched:*
- whole-network invariant families that mix sector and non-sector sources at an eligible row;
- the heterogeneous CB pattern (F1 and both critics say so; T2 owns `G(8^82,7^2)/448`);
- trees of order 20–90.

**No candidate deficient cut exists anywhere in the F record. No tuple satisfies SEMANTIC-CONTRACT §1.2.** The controller's CF-0
and CF-F1 are consistent with my replays. I weigh them as one more replay.

**Fidelity record.** No predecessor error is reconstructed in this cycle's F portfolio. The mechanism-equivalence table is:

| Mechanism | Refuted key it relates to | Ruling |
|---|---|---|
| per-tag matching | `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` | weaker shadow; not revived |
| switch-dead `X′` | `E993-R23-LITERAL-DELETE-ONLY-HALL` | legitimate sub-case, not a revival (C-F1-T) |
| sector counts | — | literal (D) ∪ (S) with active weight; distinct from all ten refuted keys |

## Lean readiness

My orientation's portfolio contains **no Lean text at all**. Both routes and all four critiques are Python only, with no
`lake`/`lean` invocation. So check 6(b), compiled fragments, is empty for every group.

**G-F-1: E-1, the `S(1,2,3^k)` deletion-arc flow.** NOT contract-ready for this cycle's Stage 7. It is informally ready: (a) is
complete, with the closed DAG below. It is the natural Cycle 6 Lean target.
- **Draft statement** (namespace `E993Transport`; the `def` is new and authored in-run):

  ```lean
  def spiderOneTwoThrees (k : ℕ) : SimpleGraph (Fin (3 * k + 4))
  lemma spiderOneTwoThrees_deletionFlow (k p : ℕ) (hp : k + 2 ≤ p) (F : Finset (Fin (3 * k + 4)))
      (hF : F ⊆ C5LA1.leafSet (spiderOneTwoThrees k)) :
      ∃ f, IsSaturatingFlow (spiderOneTwoThrees k) F p f ∧ ∀ B A, 0 < f B A → ∃ q ∈ B, A = B.erase q
  theorem spiderOneTwoThrees_weightedHall (k p : ℕ)
      (hElig : C5LA1.crossingIndex (spiderOneTwoThrees k) + 2 ≤ p)
      (hLow : 3 * p < 2 * (spiderOneTwoThrees k).indepNum + 1) :
      ∃ f, IsSaturatingFlow (spiderOneTwoThrees k) (favorableLeaves (spiderOneTwoThrees k) p) p f
  ```

  The terminal theorem needs `crossingIndex = k+1` for the case `k ≥ 5`, and small `k` has an empty window. Alternatively, freeze the
  `p = k+3` form with `5 ≤ k`, which needs only `crossingIndex ≤ k+1` and `indepNum = 2k+2`.
- **Carried fragments.** C1-LA1's `Main.lean` (`86b59c6c…`) supplies `IsSaturatingFlow`, `activeWeight`, `favorableLeaves` and
  `transportRel`, and entries 1–18 of the first-interior source supply `C5LA1.*` and `C4LA1.*`. Carry them byte-identically under
  ruling 40. C4-LA1's text (`66db6c73…`) may already hold E-2 and a product-chain injection; I cannot see it.
- **DAG nodes and their state:**

  | Node | Content | Informal | Lean |
  |---|---|---|---|
  | N1 | `IsTree` of `spiderOneTwoThrees k`, its leaves, supports and `W` sets | closed | open |
  | N2 | `indepNum = 2k+2` | closed | open |
  | N3a | `crossingIndex ≤ k+1` (the descent identity) | closed | open |
  | N3b | `crossingIndex ≥ k+1` for `k ≥ 5` | closed (adjudicator STATED) | open |
  | N4 | E-2, per-tag injections ⇒ saturating flow | closed | open, or carried from C4-LA1 if present there |
  | N5 | hook partition of a two-chain grid, and its iteration to finite products, with the chain-predecessor injection above the centre | closed on this face | open |
  | N6 | tag classification and class disjointness for leaf `1` | closed | open |
  | N7 | composition | closed | open |

- **Smallest unproved lemma (Lean): N5.** Stated in cleared integer form: given a finite product of ranked posets, each partitioned
  into saturated chains with `2·centre ≤ c_i`, the map sending an element of rank `r+1` to its chain predecessor is defined and
  injective whenever `2(r+1) ≥ Σ c_i + 1`.
- **Fences for the face:** family scope only; not (HALL); not the aggregate; not an RTree statement; attribution to C-F2-U (the
  theorem), F2 (N4) and this adjudicator (N3b and the N5 discharge).

**G-F-2: E-2 alone.** Not an award group by itself. It is a companion lemma (R29-N-12) inside G-F-1, or already inside C4-LA1.

**Everything else in F is bounded.** A bounded result never qualifies. No outcome-B lemma in F reaches (a). The switch-capacity lower
bound (C-F1-T) has no proof.

**(WID)** is already `formally_verified` (C1-LA1), and F adds nothing to it. **(HALL)** at full scope: no F material bears on its
Lean readiness.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

All of the progress is **critic-attributed**. The seat returns alone would be a near-plateau: two `bounded_evidence` routes, both
narrowed, with obligation (a)(b) of F1 and obligation (b) of F2 not delivered as chartered. The orientation's portfolio nonetheless
contains the following.
- (i) **A new restricted-scope (HALL) theorem on a second infinite eligible family**, E-1, at `proved_informal` candidate grade. I
  verified it in full, but it is not yet second-read.
- (ii) **New adversarial findings:**
  - the instance frontier widened from five certified CB rows to 223 switch-necessary eligible rows, of which 218 are uncertified;
  - the exhaustive order-≤19 census, which places both the first positive-summand row and any per-tag frontier at order ≥ 20;
  - the proved per-tag impossibility at `T_22/34`.
- (iii) The cross-route identity that locates F1's and F2's objects in the same positive-summand regime.

The plateau definition asks for no new lemma at `proved_informal` or better and no new adversarial finding. That definition is not
met.

**Stop-gate bearing (ruling 39).**
- (a′): not F's.
- (b′): F supplies the second-half candidate, E-1. The decisive instruments are `a7_check.py` (the explicit construction at every
  rank, `k ≤ 7`) together with the written proof check above. It becomes decisive only after the synthesis STATES it and an isolated
  second read confirms it, and it also needs T2's `G/448` half, which I cannot see.
- (c′): **not supplied**. There is no (CUT) candidate, and the decisive instruments are `cb_adj.py scan`, `cb_rows.py` and the
  replayed critic family scans.
- (d′): nothing from F.

CF-6's point stands: a finite list of certified CB rows is not an infinite family. E-1 is an infinite family.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at orientation F's evidence grade:
- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` is **still_open**. There is no complete proof and no replayed deficient
  cut. No eligible deficient row is known anywhere. The CB sector surplus is at least 4401 times, and there is no per-tag failure
  through order 19.
- **(WID)** is VERIFIED (`formally_verified`, C1-LA1). F only used it as a fidelity check, on independently computed sides where
  stated.
- **E-1** (restricted-scope Hall on `S(1,2,3^k)`, every `p ≥ k+2`, every `F`, and hence every eligible rank for `k ≥ 5`): **proved**
  at its exact family scope by my verification (informal). It is critic-attributed and awaits an isolated second read. It is a
  separate key candidate, not (HALL).
- **E-2**: proved (elementary companion).
- The switch-capacity lower bound (C-F1-T) and the switch/deficit asymptotic: conjecture.
- The primary aggregate: OPEN and untouched. The fence holds: mechanism ≠ aggregate.

## Next-route allocation

**Exact remaining obligation for orientation F.** Exhibit, or rule out with a proof or an exhaustive literal search at a stated
horizon, a deficient `X ⊆ I_{p+1}` whose **literal whole-network** neighbourhood is short. Search where the F record has not looked:
1. at an uncertified switch-necessary eligible CB row, families that **mix sector and non-sector sources** competing for shared
   targets (CF-F4's non-eligible pattern);
2. at the first eligible rows with a **positive leaf summand** in orders 20–90, where cross-tag routing or switch arcs are forced.

**F-R1 `WHOLE-NETWORK-MIXED-FAMILY-CUT-SEARCH-AT-UNCERTIFIED-CB-ROWS`.**
- *Rows:* `CB(9,112)/673`, which has the smallest sector surplus, and `CB(8,95)/508`, the smallest uncertified row.
- *Method:*
  - Classify `I_{p+1}` and `I_p` by per-choke state and root/arm state, and count literal `N(X)` by generating functions for
    `Aut`-invariant threshold families that include non-sector sources (regime mixing), seeded by the maximizer shape of CF-F4.
  - Use (INV) / C2-LA1 (formally verified: a deficient cut implies an invariant deficient family) so the search is complete over
    invariant families at the chosen thresholds.
  - Validate the counting on literal networks at small non-eligible CB laboratories, including `CB(11,2)/16`.
- *Could close in one cycle:* a (CUT) candidate at an eligible row, which is decisive event (b) after two instruments and a second
  read. Or a whole-row certificate at those rows (`computer_assisted`), which adds to the five-row scope.

**F-R2 `FIRST-POSITIVE-SUMMAND-ELIGIBLE-ROW-AND-LITERAL-HALL`.**
- *Step 1:* an exhaustive **counts-only** census of orders 20–22 (823,065 trees at order 20 and 2,144,505 at order 21), with every
  eligible `p`, `F_p` derived and summands by DP. No enumeration is needed to detect a positive summand. Push until the first
  positive-summand eligible row is found, or state the horizon attained.
- *Step 2:* at that row, run literal (HALL) with two instruments: exact max-flow on the literal network, plus an (INV)-quotient flow.
  Also record whether switch arcs are load-bearing.
- *Could close in one cycle:* the smallest eligible row where per-tag deletion must fail, which is the only kind of place a non-CB
  (CUT) can live. Either (HALL) there, or a (CUT) candidate there.

**For the synthesis (not an F route):**
- STATE E-1 together with N3b for an isolated second read.
- Run the run-local alias check on the candidate key.
- Consider G-F-1 as a Cycle 6 Lean target. It is U's to build, and N5 is the smallest missing lemma.

## Artifact inventory

All my scratch is under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-adj-F/`. Everything ran with
`python3 -B`, the standard library and exact integers, in the foreground. **I started no background job, and none is running.**
There is no `__pycache__`, confirmed by a `find` inside my own scratch.

**Own instruments** (SHA-256):

| File | SHA-256 | Role |
|---|---|---|
| `a7_check.py` | `5a933224b3def125f3055cd2b34ffa237654ac3a73d5f34b78cc528159305be8` | E-1: closed form = DP; `α`; `x`; descent identity (`k ≤ 300`); the explicit hook-chain injection at every rank for `k ≤ 7`; saturating flow; two-sided `S` |
| `a7_check_out.json` | `3eccbd18a0770d9fa8fffbc17cb21c7b6e24eb10e14d30975a948250d7cf65dc` | output of `python3 -B a7_check.py 300 7` |
| `xlower_check.py` | `51488b1870b11295a9833524e507e78eb643ef7589570712ff73b47724655e36` | N3b sufficient inequalities, `k ≤ 120`, zero violations |
| `cb_adj.py` | `fb972da0cc5d45ce4fdf9f98e16b21b42d8ef00e0bc54e3f0784313db2cb706d` | CB closed forms and generic DP; literal sector network; census scan |
| `cb_small_out.json` | `1cba7777890773c99229bbed8346ab4564e2478c9566709b8041d545645d6df1` | 16 trees; 8 literal sector points |
| `cb_scan_2-3-4-5-6-7-8-9-10-11-12-13-14_1_160.json` | `8238e345936d3e0a14d2aa0572e764ab9f2127b10a8f9793f1fc78c2e304e4a2` | 103,835 rows; 164 deficient |
| `cb_scan_12-13_161_260.json` | `173e9c961fadb52993acff488f54ff31f75c8cb8d655bfbcd84f82f297b43a8e` | 49 + 10 deficient |
| `cb_scan_8_1_160.json` | `dbb340fa3267556babe87f3bae00fe48a6442ec936449ac985ab7300be53ac3f` | `d = 8` alone |
| `cb_rows.py` | `2c7c409fc59f8071feac3a8f5b6b0b80aa33402c57e5bc7bc442ebacf248d81d` | four explicit rows, two instruments; frozen `S` and `P` match |
| `cb_rows_out.json` | `d8e92350de1cae796d6ab0ff2a932e9f01c26be6587b43a96390caee301b7475` | output of `cb_rows.py` |
| `f2_adj.py` | `3bc8e39fe08cfc68b0359fd1c52141be425c0abf1a0b33729f5900e03ba0812f` | own free-tree census; per-tag matching; order-10 lab; `T_22/34` |
| `f2_adj_out_13_15.json` | `30347190bd5a5e4facf720674c7d6106edad46e49ec125ceabc0fe4928de64e5` | orders 13–15 |
| `f2_adj_out_16_17.json` | `8ab5ad6a9eec99e90a67fdb779f006f27c2ee5c0e74086dca31ffc97001dceba` | orders 16–17 (about 250 s) |

**Replay commands**, run in `c5-adj-F/`:
- `python3 -B a7_check.py 300 7`
- `python3 -B xlower_check.py`
- `python3 -B cb_adj.py small`
- `python3 -B cb_adj.py scan 2,3,4,5,6,7,8,9,10,11,12,13,14 160`
- `python3 -B cb_adj.py scan 12,13 260 161`
- `python3 -B cb_rows.py`
- `python3 -B f2_adj.py 13 15`
- `python3 -B f2_adj.py 16 17`

**Copy-out replays of critic instruments.** The originals are untouched, and the copies' digests equal the critics' inventories.
- `replay-cF1T/`:
  - `scan.py 8,86,460 8,92,492` gave `31d7f1a4…`, byte-identical.
  - `scan.py 7,109,510 9,112,673 10,106,708 11,134,984` gave `acdb3168…`, byte-identical.
- `replay-cF1U/`: `fam_named.py 8,86,460 9,112,673` equals the original except for its wall-clock `secs` field.
- `replay-cF2T/`: `census_all.py 15 13` gave 1,004 rows, identical to the `n ≤ 15` rows of the original `census_all_13_17.json`.
- `replay-cF2U/`:
  - `elig_scan.py 13 18` gave `elig_13_18.json`, byte-identical.
  - `ptag_census.py 13 16` matched the original `ptag_13_15.json` summaries at orders 13–15, and order 16 agrees with C-F2-U's
    census counts.

**Read-boundary and process disclosures.**
1. Beyond the capsule members, I read only authorized material: frozen `sources/` files (`authority/CLAIM-IDENTITY.json`,
   `cb-switch-cut/RESULTS.json`, and `SOURCE-DIGESTS` verification over `sources/`), and the inventoried scratch of `F1`, `C-F1-T`,
   `C-F1-U`, `C-F2-T` and `C-F2-U`. Of that scratch I made non-recursive listings, heads of `scan.py`, `fam_named.py`,
   `census_all.py` and `ptag_census.py`, and read `c5-F1/ROW-TABLE.json`'s field names.
2. A non-recursive `ls` of `cycles/cycle-5/stage5/adjudicators/`, made to check whether my output directory existed, showed the
   names `T` and `U`. I read nothing in them.
3. One mistaken command, run with the working directory at `scratchpad/`, tried to import a non-existent module name. It failed
   without reading any file.
4. No `find`, `grep` or `rg` rooted above my grant. The single `grep` I ran was on my own copy of `ptag_census.py`. I ran no other
   return, critique, adjudication or synthesis, and read no other experiment root. No network, no installs, no `lake`/`lean`.
5. The host-injected `CLAUDE.md` and memory index were not acted on.
