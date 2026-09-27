# Critique

**Seat:** critic `C-T1-U` (orientation U, formal/structural), Cycle 4 Stage 4, r30. **Return:** `T1`, route
`C4-T-01 CB-FIRST-RANK-COUPLED-ALLOCATION` (orientation T).
**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot.** I am operating within VerityOS. Boot reads: exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS file was opened.

**Read-boundary and process disclosures.**
1. The host injected `CLAUDE.md` and the memory index into context at start. I did not open them or act on them.
2. Files read for content: the dispatch (SHA-256 verified `a5e69a45…`), the capsule manifest, and the capsule members listed
   under the seal audit below. For `control/C4-CRITIC-ATTACK-BRIEFS.md` I read the preamble and the `T1` section (lines 1–44).
   The return's inventoried scripts and outputs under `scratchpad/c4-T1/` (a non-recursive `ls -la` of that directory) were
   copied out and replayed. No file under `sources/` was needed or opened. `control/CLAIM-IDENTITY.run-local.json` is not a
   capsule member and was not read.
3. A single `grep -o 'E993-R30-…'` over five capsule files (the allocation, the gate, the attack briefs and both contracts)
   was used to list key names for the alias check. A follow-up `grep -n` for three of those names printed one line each from
   the `T2` and `U1` sections of the attack briefs (lines 65, 67 and 132). From those lines I used only the fact that the (NM)
   key's name of record is `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`. That key's content is already
   described in `C4-ALLOCATION.md` (U1 obligation (b)), which is in my grant.
4. A one-line `grep` of `SEMANTIC-CONTRACT.md` checked for a `ρ`/`r_q` formula. There is none (see Attacks, A7).
5. One names-only `ls` of `cycles/cycle-4/stage4/critics/T1/`, run before I created my own directory, showed the sibling
   critic directory `F`. I did not open it.
6. **Process incident.** The harness moved one foreground command to the background when it passed 600 s. The command was a
   literal laboratory check whose case list included two over-large laboratories. I located its PID with `lsof +d` on my own
   scratch directory (a targeted query, not a full process listing) and killed Python by literal PID (`kill 41340`). Its `tee`
   (41341) and wrapper shell (41312) then exited on their own, which `kill -0` confirmed. The harness's task-output file under
   `/private/tmp/claude-501/…` was read once and was empty. The check was rerun in the foreground on smaller laboratories. No
   background job is alive at this write.
7. No network was used and nothing was installed. Every script ran with `python3 -B`, and no `__pycache__` or `.pyc` exists
   in my scratch (checked by a `find` scoped to my own directory). Nothing was written outside
   `scratchpad/c4-crit-T1-U/` and this file.

## Identity and seal audit

- **Dispatch:** SHA-256 of `control/dispatch/c4-stage4/DISPATCH-C-T1-U.md` is
  `a5e69a454e62755be653a33efcdbd4e71e1359329bb1a0d4bb2786f7bda13751`. It matches the pointer message.
- **Capsule seal (reported):** `control/c4-critic-capsules/T1-PACKET-MANIFEST.json`. I recomputed the canonical seal (compact
  key-sorted JSON, `seal_sha256` removed, no trailing newline) and got
  **`a26be96ea7a3d467e184ab6dc28be86e6fd3c3fcd70a69f40ecf1e31855851d4`**. It matches the dispatch.
- All 14 capsule members match their manifest SHA-256 and byte counts. The members are `SEMANTIC-CONTRACT.md`,
  `SOLUTION-CONTRACT.md`, `C4-ALLOCATION.md`, `C4-CRITIC-ATTACK-BRIEFS.md`, `C4-CRITIC-COMMON-BRIEF.md`,
  `C4-CRITIC-PROTOCOL.md`, `C4-STAGE1-GATE.md`, the Stage 2, Stage 3 and Stage 4 manifests,
  `C4-STAGE3-READ-BOUNDARY-DISCLOSURES.json`, `SOURCE-DIGESTS.json`, `PATH-CHECK-T1.json` and `returns/T1/RETURN.md`
  (`b6eff68f…`).
- **Stage 2 seal:** recomputed `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`. It matches the stored
  value and the protocol, and it is the value T1 cites (brief item: confirmed).
- **Stage 3 seal:** recomputed `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9`, which matches the stored
  value.
- **Stage 4 dispatch seal:** recomputed `784132f0726699b6f7ef5cbf07196f7d35d233d980799f25fdd6883cadde9229`, which matches the
  stored value.
- **Return digests:** all ten SHA-256 values in T1's table (five scripts and five outputs) match the files in
  `scratchpad/c4-T1/`. I copied all of them into `scratchpad/c4-crit-T1-U/replay/` and replayed them with `python3 -B`. All
  five exit 0, and all five outputs are **byte-identical** to the shipped `out_*.txt` (`cmp`).
- T1's read-boundary items, as the Stage 3 record transcribes them, are low-severity names-only listings plus two searches
  rooted at `sources/` (within its grant). I found nothing further.

## Independent re-derivation

My own instruments are in `scratchpad/c4-crit-T1-U/own/`. They are written from the semantic contract, not from T1's code.

1. **Fixed points (instrument A: a generic rooted-tree DP on the literal adjacency, with every leaf's `F_p` derived
   individually).** `K_{1,12}/8` gives `n=13, α=12, x=6, |F|=12`, supply 1980, capacity 3960, `S=−1980`. Path-star
   `(2,3,4)/7` gives `15, 11, 5, 10`, 1483 / 2701 / −1218. Path-star `(2,2,4,3)/8` gives `18, 13, 6, 12`, 8033 / 13467 /
   −5434. All reproduced (`out_fixedpoints.txt`).
2. **Row data at the five rows.** Two instruments: A, the generic DP with deletion sets on the original carrier; and B, my own
   closed forms. For B, `β = (1+2y)^d + y(1+y)^d`, `P = (1+2y)β^m + y(1+y)(1+2y)^M`, `q_v(j) = [y^j] y(1+2y)^M` for the arm
   leaf, and `q_c(j) = [y^j] y(1+y)^{d−1}(1+2y)β^{m−1}` for a private leaf. Both use `x` scanned through rank `α` and derive
   `F_p` from `Δ_p(T − v) < 0` on the original tree. They agree on `n, α, x, |F_p|, S`:

   | row | `n` | `α` | `x` | eligible | leaves | `|F_p|` | `S` | `S` digits |
   |---|---|---|---|---|---|---|---|---|
   | `CB(8,86)/460` | 1465 | 775 | 458 | yes | 689 | 689 | `< 0` | 328 |
   | `CB(8,89)/476` | 1516 | 802 | 474 | yes | 713 | 713 | `< 0` | 340 |
   | `CB(8,92)/492` | 1567 | 829 | 490 | yes | 737 | 737 | `< 0` | 351 |
   | `CB(8,108)/577` | 1839 | 973 | 575 | yes | 865 | 865 | `< 0` | 413 |
   | `CB(7,144)/673` | 2163 | 1153 | 671 | yes | 1009 | 1009 | `< 0` | 483 |

   Instrument A also asserts `supply − capacity = S`. Supply and capacity each have 330 / 342 / 353 digits at the three first
   rows; the exact `S` values are in `out_rowdata.txt`. So `F_p` = all leaves is **derived** by me at all five rows. The
   return's Step 4 values (`n, α, x`, eligibility, the signs and digit counts of `Δ_x` and `Δ_{x−1}`) are reproduced exactly
   by my generic DP (`out_step4.txt`).
3. **Sector counts.** My own instrument classifies each choke state `(β, γ)` (number of `b`-legs and `c`-legs) with
   multinomial pattern counts and extracts coefficients. Brute force on the literal tree for 8 laboratories (all weights
   computed literally) matches it exactly for sources, targets, stuck, bad and cornered. At the three rows,
   `R_K/R_{K−1} = 460/459, 476/475, 492/491`. `stuck/R_K`, `bad/R_{K−1}` and `cornered/R_K` are `3.1193e−7 / 1.8660e−9 /
   5.7297e−28`, `1.8466e−7 / 9.2653e−10 / 6.3640e−29` and `1.0932e−7 / 4.6005e−10 / 7.0685e−30`. These agree with T1's
   values. "Cornered ⇔ every occupied choke has `β ≥ 3`" holds as an equality of counts at the rows and literally in every
   laboratory (`out_sector.txt`).
4. **Step 1 (uniform deletion), re-derived.** The in-sector deletion graph is biregular. Sources have down-degree `K = p − 1`
   and targets have up-degree `2(M − K + 1)`. A constant arc value `γ = 1/(2(M−K+1))` therefore fills every in-sector target
   exactly. Each source's outflow is `K/(2(M−K+1)) = R_{K−1}/R_K`. This equals `(p−1)/p` **iff** `2(M−p+2) = p`, i.e.
   `3p = 2M + 4`. Here `M − p + 2 = p/2`, not T1's garbled "`(p−2)/2·…`". At the two (O3) rows (`3p = 2M + 3`) it is
   `(p−1)/(p+1)`, which is `288/289` and `336/337`, not `576/577` and `672/673` (`out_sector.txt`).
5. **Step 2 audit.** `Δ = R_K − R_{K−1} = R_K/p` exactly at the three rows. `Δ` has **325 / 336 / 347** digits.
   `(1−ρ_1)·C_1^V/Δ` is 33.58 / 34.75 / 35.92 over all `ℓ ≤ d`, and **33.33 / 34.49 / 35.65** over the switch-reachable
   targets `ℓ ≤ d − 1` only (`out_step2.txt`). `ρ_1` is evaluated by T1's formula. Its values match the allocation's record
   (0.99456 / 0.99474 / 0.99492), but I could not check its meaning against E1's text (see A7).
6. **Hall for `X` = all stuck sources.** This is a new check (`out_stuckhall.txt`). For `X ⊆ stuck`, the positive part of
   `N(X)` is exactly the in-sector deletion shadow: every other exit of a sector source has literal weight 0. I derived
   `|∂ stuck| = N_0 + N_1`, where `N_0` counts targets with no usable choke and `N_1` counts targets with exactly one usable,
   non-full choke. The formula matches the literal count in all 8 laboratories. In every laboratory `|stuck| > |∂ stuck|`, but
   those are non-eligible, heavily deficient ranks and show only that the question is real. At the three rows,
   `|∂ stuck|/|stuck| = 16.52 / 17.07 / 17.61`, so Hall holds for this family (as the registered Cycle 2 sector Hall
   requires).

## Attacks and findings

**A1. The "uniform-deletion saturation lemma" is false as stated and, where true, is a restatement.** Statement (i) asserts
"total deletion outflow is `Kγ = (p−1)/p` exactly" for **any** `d, m` and any `2 ≤ K ≤ M`. That holds only on `3p = 2M + 4`
(re-derivation 4). The return also asserts the identity at the (O3) rows (`3p = 2M+3`), where it is false (`288/289 ≠
576/577`). The construction is a flow (outflow ≤ supply 1) only when `3K ≤ 2M + 2`. For larger `K` it over-draws every
source. Where valid, it is the double-counting (biregular) form of the normalized-matching inequality
`2(M−K+1)·|∂X| ≥ K·|X|` on the ternary leg cube. That is, it is the homogeneous whole-sector instance of the (NM) key
`E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`, of C1's deficit formula at `q_i = 2`, and of the record's
deficit `R_K/p`. T1's alias check was lexical only, over keywords (`stuck|bad target|reduced capacity|switch share|coupled
alloc|usable switch`) that cannot hit a normalized-matching restatement. **Ruling: struck as a new claim; registers
nothing.** It survives only as a remark (grade not separately registrable): at `3p = 2M + 4`, the uniform in-sector deletion
flow fills every in-sector target and leaves every sector source exactly `1/p` short. The brief asked whether the fraction is
`(p−1)/p` or the `R_{K−1}/R_K` quantity. It is the latter. It equals `(p−1)/p` only on the boundary rows `3p = 2M+4`.

**A2. The obstruction hierarchy is an artifact of the uniform baseline, not a Hall obstruction.** I confirmed the definitions
(stuck; bad = every in-sector deletion preimage stuck; cornered = stuck with every in-sector deletion target bad) and the
per-choke characterizations for `d ≥ 2`. At `d = 1`, the full state `(1,0)` is bad-type, but T1's rule "full with `β ≠ 1`"
excludes it. This is harmless at `d = 8`. The counts are reproduced exactly (re-derivation 3). However, the hierarchy only
measures where the **uniform** deletion rule fails. A2's decisive counter is A8: a **non-uniform, choke-local** deletion
allocation absorbs stuck, bad and cornered sources outright at all three rows. The return's "strong quantitative evidence
for" the reduced-capacity sector Hall is struck. The size of the failure set of one naive allocation is not evidence about
Hall for every subfamily. The sentence "shrinks by roughly eighteen to twenty orders of magnitude at each level" is
**numerically false**. Stuck to bad is about 2 orders (`3.1e−7 → 1.9e−9`, over different denominators `R_K` and `R_{K−1}`).
Bad to cornered is about 19 orders. It is not used as evidence for anything once struck.

**A3. Step 2's "aggregate necessary condition".** The inequality is correctly labelled necessary-only, and the return does
not let it read as (HALL). Two defects:
- It aggregates over unreachable `ℓ = d` targets. With reachable targets only, the margins are 33.33 / 34.49 / 35.65, still
  large.
- It never tests a family meeting `V⁺`, so it says nothing about the (O2) coupling.

The competition noted in SR-C3-4 (E1's flow and the sector's switch exits share the `q = 1` targets) is honoured only in the
sense that the residual `(1 − ρ_1)ℓ` is used.

**A4. Fidelity: `F_p` is hard-coded, and `S` is asserted nowhere.** In T1's code, the only literal weight evaluation is
`F_all_leaves = {v} | set(leaves.values())` (`cb_type_analysis.py`, line 189). No script derives `F_p` at any row, and no row
reports `|F|`, supply, capacity or `S`. This breaches the shared rules ("`F_p` DERIVED at rank `p` on every row"; "`supply −
capacity = S` asserted on every instance"; conventions §3: full row data on every reported row). Gate ruling 31 is not
breached, because T1 makes no `S` assertion. **As T1-backed evidence, every weight-dependent number is struck.** That covers
the sector weight 1, the switch-target weight `ℓ`, `C_1^V`, stuck, bad and cornered. My derivation (re-derivation 2: `F_p` =
all leaves at all five rows, from two instruments) restores the weight assumptions. Those numbers therefore stand at
`bounded_computation`, **on this critic's derivation**.

**A5. Quantifiers and scope.** Step 3's "proved_informal" grade for the generating functions is acceptable for the
characterizations with `d ≥ 2` and `K > d`, as re-derived. The counts at the three rows are `bounded_computation`. Nothing
in the return is claimed for every `X`, and obligation (a) is honestly "not proved". There is no inequality-direction error,
no natural-number subtraction hazard, and no circularity.

**A6. Validation literals.**
- "Verified against literal brute force on 11 small `CB(d,m)` instances" and "6+11" are not backed. The shipped code runs 5
  (type analysis), 6 (bad targets) and 6 (cornered) cases, over **7 distinct trees**.
- "`C_1^V` verified … 100% exact match at every weight class `ℓ`" is overstated. The literal check compares only `ℓ` values
  reached by usable switches (`1 ≤ ℓ ≤ d−1`), never `ℓ = 0` or `ℓ = d`.

**A7. False provenance and wrong digit counts.**
- "`ρ_1` … reproduced here from `SEMANTIC-CONTRACT.md`'s `r_q(k)` formula" is false. The contract contains no `ρ` or `r_q`
  formula. The formula's provenance is E1's sealed record, which is outside my grant. Its values match the allocation's
  record.
- In the Step 2 table, the "`Δ` digits 327 / 339 / 350" are the digit counts of `R_K`. T1's own generator prints `Δ` with
  **325 / 336 / 347** digits. Struck.

**A8. Critic-derived advance (attributed to `C-T1-U`): the reduced-capacity sector Hall (Cycle 3's A4) holds at all three
first ranks, by an explicit choke-local fractional flow.** This is the step T1 leaves open.
- **Construction.** Each deletion arc from a sector source carries a value that depends only on the state `(β, γ)` of the
  choke where the leg is removed, and on the leg type: `φ_b(β, γ)` or `φ_c(β, γ)`. A usable choke in state `(1, g)` sends
  `σ(g)` along its unique switch arc to the target with `u_i` present, which has literal weight `g`. A source's outflow is
  then `Σ_chokes Out(x_j)`, and an in-sector target's inflow is `Σ_chokes (d − |y_j|)(φ_b(y_j + b) + φ_c(y_j + c))`. A switch
  target of weight `ℓ` receives `(d − ℓ)σ(ℓ)` from its `d − ℓ` sector preimages.
- **Search.** An exact LP over the 45 choke states (my own Fraction simplex, used only to *find* the values) minimizes the
  switch load `θ` subject to an affine separation.
- **Certification.** The certificate is then checked **without** the relaxation. An exact min-plus and max-plus DP runs over
  every profile of `m` choke states with total rank `K` (sources) or `K − 1` (targets) (`certify.py`, `out_certify.txt`):

  | row | min source outflow | max in-sector target inflow | switch load `θ*` (per unit weight) | residual `1 − ρ_1` | margin |
  |---|---|---|---|---|---|
  | `CB(8,86)/460` | 1 | 1 | `96/495419 ≈ 1.94e−4` | `≈ 5.44e−3` | 28.1× |
  | `CB(8,89)/476` | 1 | 1 | `96/530501 ≈ 1.81e−4` | `≈ 5.26e−3` | 29.0× |
  | `CB(8,92)/492` | 1 | 1 | `96/566783 ≈ 1.69e−4` | `≈ 5.08e−3` | 30.0× |

- **Why it is a flow.** Sources with outflow above 1 are scaled down, which only lowers the target loads. All values are
  `≥ 0`. Every in-sector target (weight 1) receives `≤ 1`, and every sector switch image of weight `ℓ` receives `≤ θ*·ℓ`. So
  every sector source is saturated using in-sector targets plus at most `θ*ℓ` of each switch image. This is (HALL-COND) for
  every `X ⊆ sec` in the reduced-capacity network. It holds for any residual `≥ θ*`, not only E1's `(1 − ρ_1)`.
- **Literal validation.** On 7 laboratories where the local LP is feasible, the literal CB graph was built and every literal
  (D) and (S) arc was loaded with the local values. Literal target weights reproduce `1` and `ℓ`. The literal minimum outflow
  and maximum inflow equal the certified values, and switch caps hold (`out_literal_localflow.txt`). The local LP is
  infeasible at the laboratories `CB(7,1)/6` and `CB(6,1)/5`. This is a laboratory fact only.
- **Consequence (conditional).** Suppose E1's flow at these ranks is, as T1 describes it, a deletion-only flow that saturates
  every non-sector source, uses no in-sector target, and loads each sector switch image `A` at `ρ_1·w_F(A)`. It suffices that
  the load is `≤ (1 − θ*)·w_F(A)`. Superposing the two flows then gives a saturating flow on the **whole network** at
  `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`. This is (HALL) at three eligible switch-necessary rows, with switch arcs
  load-bearing (`σ > 0` is forced, since the sector is deletion-deficient). I could not verify E1's load profile: its text is
  outside my grant, and D1 is `computer_assisted`. The whole-row statement is therefore `conditional` and STATED.
- **(O3) rows** (`out_certify_o3.txt`). The same certificate holds for the sector at `CB(8,108)/577` (`θ* = 16/65097`, 10.6×
  below `1 − ρ_1`) and `CB(7,144)/673` (`θ* = 16/138633`, 12.9×). `F_p` = all leaves was derived there too. D1 does not cover
  E1 at these first ranks, so only the sector statement is claimed.

## Mechanism-equivalence and fence check

- T1's mechanism is none of the ten refuted keys. Its deletion-only statements are sector-internal and explicitly not
  deletion-only Hall. Its weight is literal `w_F` (on a hard-coded `F`, A4), and its relation is (D) plus (S) as literally
  enumerated. The Step 1 lemma is a restatement of (NM)/C1 at the homogeneous sector (A1), and it re-proves a settled fact as
  a contribution. No census value is used in a proof. There is no RTree wording. (LIFT) is not treated as feasibility.
  `D, C ≥ 0` is not used as a budget. No cut is claimed or handed to F1.
- My A8 flow uses the literal relation (D) ∪ (S) (switches only at `u_i` with exactly two neighbours `{r, b_ij}` in `B`),
  literal weights on a derived `F_p`, and capacities `≤ w_F`. It is a fractional flow in the charter's network. It is not
  per-leaf injectivity, not own-support unit capacity, and not occupancy domination. Its closest template is (SW), a
  switch-share lemma. It may converge with `U2`'s route object, whose return I have not read. A finite certificate at five
  rows is not (HALL) and is not parameter-uniform.
- **Ruling 30 line.** The return supplies **none** of items (a)–(d). The critic-derived A8, *if* E1's load profile is
  confirmed and the certificate survives an isolated second read, would supply **item (b)** at three rows. As filed, it is
  STATED and `conditional`, not admitted.
- **Keys touched.**
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: OPEN, untouched.
  - E1 `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`: `proved_informal`, used as an input.
  - `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`: `computer_assisted`, via D1.
  - C2-LA1 `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`: T1's use is fine. A8 does not need
    it, because a flow covers every `X`.
  - (NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`: A1's alias target.
  - `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`: cited for context.

  T1's old key names: none cited. T1's three "new candidate observations" register nothing: item 1 is an alias (A1), item 2
  is a characterization of a naive allocation, and item 3 is struck (A2).
- **Candidate from this critique (for the synthesis; STATED).** Proposed name:
  `E993-R30-CB-FIRST-RANK-SECTOR-CHOKE-LOCAL-FLOW-UNDER-RESIDUAL-SWITCH-CAPACITY`. Statement: at the five named rows and
  ranks, with `F = F_p` derived, the root-plus-arm sector admits a saturating fractional flow into in-sector targets and
  sector switch images loaded at most `θ*·w_F`, with the exact `θ*` above. Grade `computer_assisted`.
  - Lexical alias check: no clash against the key names in my capsule files. The full registry was not in my grant.
  - Mathematical alias check: this is not E1, which covers non-sector families only. It is not the Cycle 2 sector Hall, which
    uses full switch capacity. It is not D1, D2 or D3, which cover other families or ranks.
  - The name is true when read with its hypotheses at those rows (ruling 33).

## Certification audit

- **Backed:**
  - The ten digests.
  - The byte-identical replays (re-done by me).
  - The Stage 2 seal value.
  - `n, α, x`, eligibility, and the signs and digit counts of `Δ_x` and `Δ_{x−1}` at all five rows.
  - `R_K/R_{K−1} = p/(p−1)` at the three rows.
  - `ρ_1` fractions, matching the record's values.
  - The stuck, bad and cornered counts, as ratios.
  - The `(1 − ρ_1)C_1^V/Δ` ratios, as computed over all `ℓ`.
  - `ALL_ISTREE_OK`.
- **Struck (unbacked or false):**
  - "`Kγ = (p−1)/p` … for any `d, m, K`" and "general in `d, m, K`" (A1).
  - The (O3)-row identity claim (A1).
  - "no alias exists, lexically or mathematically" (A1).
  - "roughly eighteen to twenty orders of magnitude at each level" (A2).
  - "strong quantitative evidence for" (A2).
  - "11 small instances" and "6+11" (A6).
  - "100% exact match at every weight class `ℓ`" (A6).
  - "reproduced here from SEMANTIC-CONTRACT.md's `r_q(k)` formula" (A7).
  - "`Δ` digits 327 / 339 / 350" (A7).
  - Every weight-dependent number as T1-backed, because `F` is hard-coded (A4; restored on my derivation).
- **Fine:** "No background jobs", "`python3 -B`" and "no `__pycache__`" are consistent with the shipped tree. My scratch has
  none either.

## Verdict

verdict: retained_narrowed
headline_resolved: no

T1 is retained, narrowed to three things:
- Step 1, as a remark on the boundary rows `3p = 2M+4`. It is a restatement of (NM)/C1 and registers nothing.
- The exact stuck, bad and cornered characterizations and counts, at `bounded_computation`, on `F_p` as derived by this
  critic.
- An honest "not proved" on obligation (a).

Its central interpretive claim is refuted by A8: that the hierarchy is a structural snag which is evidence for A4. The snag
belongs to the uniform rule, and a choke-local non-uniform allocation removes it. The critic-derived A8 is STATED at
`computer_assisted` for the sector (five rows) and `conditional` for whole-row (HALL) at the three first ranks. It needs E1's
load profile confirmed and an isolated second read.

## Remaining obligation

1. **Confirm E1's load profile at `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`.** The requirement is a deletion-only
   flow that saturates every non-sector source, uses no in-sector target, and loads each sector switch image `A` (r-free,
   `v, u_i ∈ A`, weight `ℓ ≥ 1`) at most `(1 − θ*)·ℓ`, with `θ* = 96/495419`, `96/530501` and `96/566783` respectively.
   Superposed with A8's certificate, this gives (HALL) at the three rows (item (b) of ruling 30), keyed separately at
   `computer_assisted`.
2. **Isolated second read of A8.** Replay `own/certify.py` and `own/literal_localflow.py`. Independently re-verify the choke
   locality of in-flow and out-flow (the only non-computational step), and the claim that every other exit of a sector source
   has literal weight 0.
3. **(O3) rows `577` and `673`.** The sector part is certified here. The missing input is an E1-type non-sector flow at those
   first ranks with loads `≤ (1 − θ*)w_F` on the sector switch images (D1 covers only the three `CB(8, 86/89/92)` rows).
4. **Toward ruling 30 (a).** Decide whether the choke-local LP is feasible for every `CB(d, m)` at every eligible `p` (a
   closed-form `φ, σ` family), which would give a parameter-uniform sector lemma.
5. **T1's own list.** Its item 1 is mis-framed: the cornered gap is an artifact of the uniform rule, superseded at these rows
   by A8. Its item 2 (a literal reduced-capacity max-flow on a small CB with E1's loads simulated) remains useful as
   validation. Its item 4 registers nothing (A1).

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-crit-T1-U/`.
All scripts are standard library only, exact integers and `fractions`, and run with `python3 -B`.

| file | sha256 |
|---|---|
| `own/rowdata.py` | `776f8061798733d1f6831bef47acd37be380adacf80dc806fe7fce1c41d9a656` |
| `own/fixedpoints.py` | `535922f81ac477666bf03eb5aecdf8d24a1a78d3ec8e5df6a7cce4c49bda194f` |
| `own/sector.py` | `90cea707374c3556ed2d53837191a3484755fc613232d4e9023c36d997f7346e` |
| `own/stuckhall.py` | `d27140b503173b1cbcaa2afbea1fab836c8040872428f1fbf30e08d4f5dcc9b0` |
| `own/step2.py` | `17a89e76047aea92136cb63ebd06c2bcdf882ff5c114d6704458c5369d41da69` |
| `own/step4.py` | `e2b856bce12da6c19d37a79b18a1ed43cb7120c97e0650fac68b66f2c13930c7` |
| `own/simplex.py` | `8980c5d8429b8e9183bd154d7c9c24557588220dfa197fc239baf8d2140076de` |
| `own/localflow.py` | `1af2b6ff702f1e1b107b1d4acb358f8e2d95a5afc8aa736160daafcaf5f723de` |
| `own/certify.py` | `431b153f6bd4aa2d0e184d316bc03dfcd9508d41bfb5f091840f07937cfa8fa0` |
| `own/certify_o3.py` | `66a6900722462c778230c61cf46caffd8d7a3f8c2ffbec3a962500c3393b8850` |
| `own/literal_localflow.py` | `8f3ffb508cdf9788a2c045d1956c464358b9e57b45f09e0017d917f2d2186d83` |
| `own/rowdata_o3.py` | `476a537ae438e541ea6b48b8f7137a9fa1350ffe0d5fe6da8deb4df159821205` |
| `own/out_rowdata.txt` | `f9941738ef31b6cac0c4d5e9ac24f8d0686c59214d1adef39b8c7d5cf087ca31` |
| `own/out_rowdata_o3.txt` | `235ffe45a7d54315f2320479953cd055aad315c32728760b4c2bb018c6cd6e08` |
| `own/out_fixedpoints.txt` | `fd795f4c6bf794b667397e66cf3e155acddfca97b1b2d0b249d3cf57d4def9ee` |
| `own/out_sector.txt` | `076e0cdeffcda6aedaca1372fe40aacb91440c35c1246f490ea2a73075f7e9f3` |
| `own/out_stuckhall.txt` | `af4be5111ba2797b2ae6753147237a37d91c9432afd6683a4053c86f90cb95e5` |
| `own/out_step2.txt` | `8078e18d3359b9bd67a9e862fdb09ab7b254486a70ad77971a450894ede0f545` |
| `own/out_step4.txt` | `2fcd33c10d61cd5c0190e6e9ec414dba45351362a73461b7df2a885bb6367cc3` |
| `own/out_certify.txt` | `f6578f8852a19a86e178b78d20fa0472c7cd18ee89de5c46c1280979e4417cb8` |
| `own/out_certify_o3.txt` | `2052e48c5a3140ffe9a359bf0d30914d927859dbe526fcb9052b9e4983c145b2` |
| `own/out_literal_localflow.txt` | `9a2a695679f75d82f3f7c1514f0d134372ed4a8d1c361b904931fa389e25ecf6` |
| `replay/` | copies of T1's five scripts and five outputs, plus `replay_*.txt`, byte-identical to the shipped outputs (same digests as the return's table) |

Replay commands, run from `own/`:
- `python3 -B rowdata.py`
- `python3 -B fixedpoints.py`
- `python3 -B sector.py`
- `python3 -B stuckhall.py`
- `python3 -B step2.py`
- `python3 -B step4.py`
- `python3 -B certify.py` (about 28 s)
- `python3 -B certify_o3.py` (about 30 s)
- `python3 -B literal_localflow.py` (about 9 s)
- `python3 -B rowdata_o3.py`
