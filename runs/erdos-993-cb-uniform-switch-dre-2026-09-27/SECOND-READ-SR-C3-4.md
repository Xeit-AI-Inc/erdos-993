# Second Read

**VerityOS boot.** Operating within VerityOS. Boot files read: exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS file was read with a tool. See the disclosures below
for what the harness placed in context without a read.

Reader: `SR-C3-4`, the isolated second read of r31 Cycle 3 (Lemma HX and the θ_Hall floor, optional). Run root
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27`. Date 2026-09-28 (clock 07:18 EDT at the
inventory step).

Two-part model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Protocol.** `control/C3-SECOND-READ-PROTOCOL.md`: SHA-256 `1eb6aa33f05fef770cbd571e1f39fa5ea9a5329e4c5f05dd5d961764c40753cc`.
  This equals the digest given at dispatch. I verified it before reading.
- **Brief.** `control/C3-SECOND-READ-BRIEF-SR-C3-4.md`: SHA-256 `b64f12c70a21f7c449a18c81e6b6802835a38a5e1f97122291f38fc50ff9c92b`.
  This equals the digest given at dispatch. I verified it before reading.
- **Capsule seal.** `control/c3-second-read/SR-C3-4-PACKET-MANIFEST.json`:
  - I recomputed the SHA-256 of the compact, key-sorted JSON of the manifest without `seal_sha256`, with no trailing newline. It gives
    **`8de2fea180ede0ba53253890b90e39b44b76afbd82e056c6b749c1e1451e0681`**. This equals both the manifest's `seal_sha256` and the
    dispatch seal. The result is the same with and without `ensure_ascii`.
  - The file-level SHA-256 of the manifest (`bcd9ba0a…9dee`) differs from the seal, as it must: the seal covers the manifest
    without its own field.
- **Members.** 272 listed. I checked each for byte length and SHA-256: 272/272 present, with 0 mismatches
  (`scratchpad/c3-sr-SR-C3-4/digest-check.txt`).
- **Frozen source tables.** Every capsule member under `sources/` is listed in its directory's `SOURCE-DIGESTS.json`
  (`sources/`, `sources/c1-results/`, `sources/c2-results/`, `sources/c3-stage7-sources/`, `sources/concurrent/`), and every one
  matches it: 245 table checks, 0 mismatches, 0 unlisted. I checked these before reading any of them.
- **Read boundary and disclosures.**
  - I read only capsule members and the two boot files.
  - The only directory listings I made were of my own scratch directory.
  - I ran no `find`, `grep` or `rg` above the capsule members. My greps ran only on named member files.
  - I used no network, installs, `lake`/`lean`, Mathlib or background jobs, and killed nothing.
  - All computation used Python 3 standard library only (`python3 -B`), with exact integers and `Fraction`.
  - I seated no child agents.
  - I did not read the seats' or adjudicator's scripts under `sources/c3-stage7-sources/`. My instruments are written from the
    contracts alone.
- **Disclosures (not tool reads).**
  - The harness injected the text of `/Users/ashtonsperry/VerityOS/CLAUDE.md` and the user's auto-memory index into my context
    at session start.
  - The harness saved one oversized tool output (my `cat` of the brief plus manifest) to a harness tool-results file. I did not
    open that file.
  - One shell line had a stray `echo =====` that zsh rejected. It was harmless.

## Statements read

Statement of record: `cycles/cycle-3/stage6/SYNTHESIS.md`. I read `## Exact established results` Y-12 and Y-13, `## Registrations`
G-4 and G-5 (the list of second reads to fund, item 4), the scope-note list for the Tier 1 and R-1 keys, and `## Refuted or narrowed
mechanisms`. Origins read:
- C-F2-T's Lemma HX (`cycles/cycle-3/stage4/critics/F2/T/CRITIQUE.md`, "Critic-derived advance", with the whole-family sums);
- C-F2-U's advance (ii)(a)–(d) (`…/F2/U/CRITIQUE.md`);
- the F adjudication E-2 and E-3, cross-route item 4, and G-F-C and G-F-D;
- F2's return, for the allocation line "Hall sums over structured `X`";
- the Stage 5 and Stage 6 controller facts, which are facts and never authority.

C1-LA1's frozen run supplied the conclusion used (the Lean text of `cb8_topRank_sectorTemplate_feasible`, `cb8Theta`, `cb8R1`,
`VERIFICATION-REPORT.md`, `EVIDENCE/axioms.txt`). The run-local snapshot (497), the frozen master (491) and the concurrent master
(510) were used for the key texts and the alias checks.

- **SR-C3-4a (Y-12, Lemma HX).**
  - Class `m ≥ 107`, `m ≡ 2 (mod 3)`, `K = p* − 1`, `X = Sec ∪ P_1`.
  - Claim: `Σ_{N(X)} w_F − Σ_X w_F ≥ 8m(r_1(K−1) − r_1(K)) − R_{K−1}/K ≥ 2.51·R_{K−1}/K > 0`.
  - Stated with "explicit `M_0 = 107`, no E1 input". Grade `proved_informal` STATED. Attribution C-F2-T, with the F adjudicator's
    check.
- **SR-C3-4b (Y-13, θ_Hall floor).**
  - Claim: any sector allocation with Out = 1, In ≤ 1, per-image switch load ≤ `θγ` and positive arcs only on in-sector targets and
    switch images has `θ ≥ θ_Hall := (R_K − R_{K−1})/Σ_γ γN_γ`, where `N_γ = m·C(8,γ)·2^{K−1−γ}·C(8m−8, K−1−γ)`.
  - Bounded companion: the governed `θ(m)` lies at `1.1879–1.1892·θ_Hall` at every class row up to 1100.
  - Grades: `proved_informal` STATED, conditional on the bridge; the ratio `bounded_computation`. Attribution C-F2-U and the F
    adjudicator.
- **SR-C3-4c.** The registration text for the optional G-4 HX note on the Tier 1 key, and for the G-5 note on the R-1 allocation
  key.

## Independent re-derivation

Throughout: `T = CB(8,m)` with labels 0 = r, 1 = s, 2 = v, `u_i = 3+17i`, `b_ij = u_i+1+2j`, `c_ij = u_i+2+2j`. Also
`p* = (16m+4)/3`, `K = p*−1 = (16m+1)/3` (an integer exactly when `m ≡ 2 (mod 3)`), `R_j = 2^j C(8m, j)` and
`r_1(k) = [y^k](1+y)^7(1+2y)^{8m−7} = Σ_{i=0}^{7} C(7,i)C(8m−7,k−i)2^{k−i}`. This is exactly C1-LA1's `cb8R1 m k`: the Lean sum
runs over `i ≤ min 7 k`, so `k − i` is never truncated.

**Weights (from the contract, rederived).**
- `W_v = {r}` and `W_{c_ij} = {u_i}`. So `v` is active iff `r ∈ B`, and `c_ij` is active iff `u_i ∈ B`.
- `F = F_{p*}(T) = leafSet(T)` is formally verified on the class by the C2-LA3 clause on the R30 favorability key (read in the
  snapshot). As a fence-2 hygiene check I also derived it at `m = 107, 110, 113`; see the instruments below.

**HX, step by step.**
1. **`Σ_X w_F`.**
   - `r ∈ B` excludes `s` and every `u_i`. So a sector member has exactly one active tag, `v`, and weight 1. There are
     `|Sec| = R_K` of them.
   - A `P_1` member with choke `u_i` has no active `v` (`r ∉ B`). Its active tags are exactly its `c_i·`.
   - Generating function over `P_1`: choke factor `x`; weighted choke-`i` leaves `8x(1+x)^7`; other legs `(1+2x)^{8(m−1)}`; arm
     `{∅, s, v}`, giving `(1+2x)`. Summed over `i`, this is `8m x²(1+x)^7(1+2x)^{8m−7}`, whose coefficient at `x^{p*+1}` is
     `8m·r_1(K)`.
   - The two families are disjoint (`r`). So `Σ_X w_F = R_K + 8m·r_1(K)`. **Confirmed.**
2. **`Σ_{N(X)} w_F ≥ R_{K−1} + 8m·r_1(K−1)`.**
   - An in-sector `p*`-set `A` has `K−1 < 8m` nonempty legs. So `A ∪ {c_ij}` at an empty leg is independent (`b_ij ∉ A`) and lies
     in Sec. Hence `A ∈ N(X)`.
   - Take a positive-weight `r`-free one-choke `p*`-set `A` with choke `u_i`. Add an absent `c_i·` (its support is absent because
     `u_i ∈ A`). If all eight are present, `A` has at most `p* − 9` occupied legs elsewhere, and `p* − 9 < 8(m−1)` iff
     `p* < 8m+1`. That is true for every `m ≥ 1`. C-F2-T's `p < 8(m−1)` is sufficient on the class (`m ≥ 4`). So some other choke
     has an empty leg, and adding its `c` keeps one choke and `r ∉`. The source lies in `P_1`, so `A ∈ N(X)`.
   - The two target families are disjoint, with total weights `R_{K−1}` (weight 1 each) and `8m·r_1(K−1)` (the same generating
     function at `x^{p*}`).
   - `N(X)` holds more still, for example the two-choke `u`-switch images of `P_1`. The inequality is therefore `≥`, as stated.
     **Confirmed.**
3. **Step 3.** `R_K/R_{K−1} = 2(8m−K+1)/K`, and `2(8m−K+1) = K+1` iff `3K = 16m+1`. This is exactly the residue class. So
   `R_K − R_{K−1} = R_{K−1}/K` is an integer. **Confirmed**, and exact at every row.
4. **Step 4.** C1-LA1's terminal `cb8_topRank_sectorTemplate_feasible` has hypotheses `107 ≤ m` and `m % 3 = 2`. Its fifth
   conjunct is literally `cb8Theta m ≤ 1 − cb8R1 m ((16m+1)/3) / cb8R1 m ((16m+1)/3 − 1)`, with
   `cb8Theta m = 288/(200m²+82m+5)`.
   - The run is `formally_verified` (report verdict; axioms `propext`, `Classical.choice`, `Quot.sound`).
   - The ℕ subtraction `(16m+1)/3 − 1` is safe (`K ≥ 571`). `r_1(K−1) > 0`, so the Lean `x/0 = 0` convention is not reached.
   - This is exactly `1 − ρ_1 ≥ θ` with `ρ_1 = r_1(K)/r_1(K−1)`. **Confirmed.**
5. **Step 5.** Set `k = K−1` and `N = 8m−7`.
   - Vandermonde: `Σ_{i=0}^{7} C(7,i)C(N,k−i) = C(8m,k)`. So `r_1(k)/R_k = Σ a_i 2^{−i}/Σ a_i` with `a_i = C(7,i)C(N,k−i) > 0`
     (`7 < k ≤ N`).
   - `a_{i+1}/a_i = ((7−i)/(i+1))·λ_i`, where `λ_i = (k−i)/(N−k+i+1)` is strictly decreasing. So `a_i/(C(7,i)λ_0^i)` is
     nonincreasing. That is likelihood-ratio domination by `Binomial(7,q)` with `q = λ_0/(1+λ_0)`. `N − k + 1 = (8m−16)/3 > 0`.
   - Hence `q = (16m−2)/(24m−18)`, with derivative sign `−240 < 0`, `q(107) = 57/85` and limit `2/3`.
   - LR order implies stochastic order, and `2^{−i}` is decreasing. So `r_1(k)/R_k ≥ E_Bin[2^{−i}] = (1−q/2)^7 ≥ (113/170)^7`.
   - No real-rootedness, Newton or Darroch. **Confirmed.**
6. **Step 6.** `8m(r_1(K−1) − r_1(K)) = 8m(1−ρ_1)r_1(K−1) ≥ [8mKθ(113/170)^7]·R_{K−1}/K`.
   - `8mKθ = 768m(16m+1)/(200m²+82m+5)`. By my own quotient-rule computation its derivative numerator is `1112m² + 160m + 5 > 0`.
   - The exact value at `m = 107` is `3.51115…`. So the middle expression is `≥ 3.511·R_{K−1}/K`, and the surplus is
     `≥ 2.511·R_{K−1}/K ≥ (251/100)·R_{K−1}/K`. **Confirmed.**

**θ_Hall floor, re-derived.**
- **Sector arcs, by my own case analysis.** Take `B ∈ Sec` (`r, v ∈ B`, `K` nonempty legs).
  - Deleting a leg vertex gives an in-sector target (weight 1).
  - Deleting `r` gives an `r`-free, choke-free set: weight 0.
  - Deleting `v` gives weight 0.
  - The `s`-switch (`N(s) = {r, v}`) gives an `r`-free, choke-free set: weight 0.
  - A `u_i`-switch is available iff choke `i` is in state `(1, γ)`. It gives the image `A = {v, u_i} ∪ {γ c's at i} ∪
    {K−1−γ legs elsewhere}`, with literal weight `γ`.
  - A `b_ij`-switch has `|N ∩ B| ≤ 1` (`u_i ∉ B`). A leaf can never switch.
  - So the only positive-capacity sector targets are the `R_{K−1}` in-sector sets and the images with `γ = 1..7`. For `γ = 8`
    there is no `b` at the choke, so there is no image.
- **Images.** A weight-`γ` image has exactly `8−γ` sector preimages (put the `b` on any of its empty legs at choke `i`). Their
  number is `N_γ = m·C(8,γ)·2^{K−1−γ}·C(8m−8, K−1−γ)` for `1 ≤ γ ≤ 7`. `K−1−γ ≥ K−8 > 0` and `8m−8` are safe.
- **Summing outflows.** For any nonnegative flow on literal sector arcs with outflow `≥ 1` at every sector source (hence `= 1` after
  scaling), inflow `≤ 1` at every in-sector target, inflow `≤ θγ` at every weight-`γ` image, and 0 elsewhere:
  `R_K ≤ R_{K−1} + θ·Σ_{γ=1}^{7} γN_γ`. Hence `θ ≥ θ_Hall`. **Confirmed**, with the sum range `γ = 1..7` made explicit (see R-4).
- **Cross-check.** An independent rewriting `Σ_{γ=1}^{7} γN_γ = 8m[x^{K−2}](1+x)^7(1+2x)^{8m−8} − 8m·2^{K−9}C(8m−8, K−9)` agrees
  exactly at every row.
- **Relation to a registered quantity.** The numerator `R_K − R_{K−1}` is the maximum deletion deficit of the sector registered in
  `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` at `t = 1`, `d = 8`, `k = K`. Its deficiency criterion
  `(t+2)(p−1) < (t+1)(dm+1)` reads `16m+1 < 16m+2`, which is true.

**Own instruments** (standard library, exact; `scratchpad/c3-sr-SR-C3-4/`):
- **`sr4_rows.py`** runs every class row `107 ≤ m ≤ 1100`, `m ≡ 2 (mod 3)`: 332 rows, 0 failures (payload
  `d5375f59…dbdf`). It checks:
  - step 3 exactly;
  - the step 1/2 surplus identity;
  - step 5, both inequalities, the `q` identity, Vandermonde and LR monotonicity;
  - step 4 (Residual) exactly;
  - step 6's value (`≥ 3511/1000`) and its strict increase;
  - the full chain;
  - the `W` rewriting;
  - `θ/θ_Hall > 1` and `Λ := (1−ρ_1)/θ_Hall > 1`;
  - `r_1` against an independent polynomial-multiplication route at 107 and 110.

  Results:
  - The HX surplus bound is exactly `≥ 124.222·R_{K−1}/K` (minimum at `m = 107`) and rises to `1286.58·R_{K−1}/K` at 1100.
  - The step 6 minimum is `3.51115`.
  - `θ_Hall(107) = 36132547728/342577655754191` exactly, equal to the fixed-point prior.
  - `Λ` runs from `41.46` at 107 to `425.89` at 1100.
- **`sr4_ratio_mono.py`** (payload `abe65b7b…b332`) shows that `θ/θ_Hall`, the HX surplus ratio and `Λ` are all strictly
  increasing over the 332 rows.
  - `θ/θ_Hall` has minimum `1.1879373` (`m = 107`) and maximum `1.1891512` (`m = 1100`). Exactly, `1.1879 ≤` every value
    `≤ 1.1892`.
  - Every value lies below the leading-order heuristic `(36/25)(16256/19683) = 1.18928…`. This is an unproved observation, not
    registered.
- **`sr4_literal.py`** (payload `df33bf10…3b00`) is a literal brute force with my own tree builder (tree test), literal `w_F`
  (with `F = leafSet` stipulated, as HX stipulates it at `p*`) and literal (D) ∪ (S).
  - Instances: `CB(8,1)` at `p = 2..7`, `CB(8,2)` at `p = 2..5`, `CB(3,3)` at `2..8`, `CB(4,3)` at `3..7`, `CB(2,5)` at `3..7`,
    `CB(5,2)` at `3..6`. That is 31 instances, using the general-`d` forms (`d·m·x²(1+x)^{d−1}(1+2x)^{dm−d+1}`, `N_γ` with
    `C(d,γ)`).
  - Results: `Σ_X w = R_K + dm·r_1(K)` exactly (31/31). `N(X)` contains every in-sector and every positive-weight one-choke target
    (31/31), and `Σ_{N(X)} w ≥ R_{K−1} + dm·r_1(K−1)` (31/31).
  - Sector arcs reach no positive-weight target outside in-sector ∪ images (0 exceptions). Every image has exactly `d − γ`
    preimages, and the image counts equal `N_γ` (31/31).
  - At `CB(8,2)`, `p = 4, 5`, my literal sums `37,968/5,408` and `195,664/40,128` coincide with the F adjudicator's values
    (concordance only).
  - These ranks are not eligible and `F` is stipulated. The negative surpluses there are not cuts and bear on nothing in the class.
- **`sr4_literal_wid.py`** (payload `100666d3…044b`): the weight-side class decomposition equals literal `Σ w_F` on
  `CB(8,1)`, `CB(8,2)`, `CB(3,3)` and `CB(4,3)`, and literal (WID) holds at every tested `p`.
- **`sr4_wid.py`** (payload `8faa7d53…b99d`) is a generic forest DP on the literal tree at `m = 107, 110, 113`.
  - It computes the tree, `α = 964/991/1018` and `x` through rank `α` = `570/586/602`. Eligibility and descent (a) hold. The fixed
    point `CB(8,107)`: `n = 1822`, `α = 964`, `x = 570` is reproduced.
  - It derives `Δ_{p*}(T−t) = i_{p*+1}(T−t) − i_{p*}(T−t) < 0` for `v` and three `c` positions (all `c` values equal, as `Aut(T)`
    is transitive on the `c_ij`).
  - **(WID) holds from independent sides.** The weight-side decomposition is compared with `Σ_F [q_t(p*) − q_t(p*−1)]` computed
    by DP on `H_t`, `R_t`. `S < 0`, with 409/420/432 digits.

## Findings and repairs

- **HX.** The mathematics is correct and complete at every step. Its inputs are exactly:
  - C1-LA1 conclusion (v) (`formally_verified`);
  - `F_{p*} = leafSet` (the C2-LA3 clause, `formally_verified`);
  - elementary counting.

  So `proved_informal` is the right grade. Repairs, all of wording:
  - **R-1.** "No E1 input" is made precise. The proof uses neither `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`
    nor any E1 arc value or load. `ρ_1` enters only as the coefficient ratio `r_1(K)/r_1(K−1)` in C1-LA1's conclusion (v).
  - **R-2.** "Explicit `M_0 = 107`" is restated as "no cutoff beyond the class endpoint 107 and no asymptotic step". It is not a
    cutoff.
  - **R-3.** The setting goes on the face: `F = F_{p*}(T) = leafSet(T)`, literal `w_F`, literal (D) ∪ (S), and `P_1` defined with
    exactly one choke and `r ∉ B`, weight-0 members included. Two further additions:
    - the sharp side condition of step 2 (`p* < 8m + 1`);
    - the fact that HX is a necessary condition implied by (H) itself. It is not a step toward (H) or its formal conjunct 4, and it
      tests no `X` mixing Sec with `q ≥ 2` sources.
- **θ_Hall floor.** The one-line proof is correct.
  - **R-4.** The sum is `Σ_{γ=1}^{7}`. A reading over `γ = 1..8` would wrongly add `N_8`, and weight-8 one-choke sets are not
    images. The recorded `θ_Hall(107)` is the `γ ≤ 7` value.
  - **R-5.** The conditionality is placed precisely:
    - Stated in network form (a flow on literal sector arcs), the floor is elementary. The hypothesis "positive arcs only on
      in-sector targets and images" is free for any flow that respects capacities, by the sector-arc case analysis above.
    - "Conditional on the bridge" attaches only to reading the R-1 key's template `θ(m)` as the `θ` of a literal allocation. That
      reading needs the template's Out, In and `(8−γ)σ(γ)` to be the literal outflow, in-sector inflow and image load (the
      composition key's reduction; the Cycle 3 bridge items are under SR-C3-2).
  - **R-6.** The ratio claim is `bounded_computation` at the 332 rows only. Its exact extremes are `1.187937…` and `1.189151…`.
    - The F adjudicator's rounded "1.18794–1.18915" is not an enclosure: both ends fall just outside, a rounding artifact. The
      synthesis's `[1.1879, 1.1892]` is a correct enclosure.
    - No limit claim, no claim beyond 1100 and no optimality claim. The `θ*` law stays a conjecture.
- **Fences.** One rank `p*`, class only. No Newton, Darroch or real-rootedness; step 5 is an LR comparison of explicit binomial
  weights. No refuted mechanism: not (G′), not the `m`-independent per-choke certificate, not compression, not CHAR. The θ* law is
  not a hypothesis: `θ` enters only as C1-LA1's governed value. No census is used as proof. No status transfer: (HALL) at full scope,
  the primary aggregate, TREE, FOREST, TRANSFER, governed beta and #993 stay OPEN.
- **Host keys.**
  - The Tier 1 key's predicate (literal network satisfies weighted Hall) implies Hall at `X = Sec ∪ P_1`, so the HX note is an
    instance of the key's predicate with an independent, criterion-free proof. It changes no grade.
  - The G-5 note sits on a `formally_verified` key. As with `[r31 C2; SR-C2-6]`, the note must say that the key's formal grade
    does not cover it.
- **Alias check** (my own, not the pre-screen; all three registries).
  - No new key is proposed. Both host keys exist verbatim in the run-local snapshot. Neither r31 key is in master-491 or
    master-510, as expected for run-local keys.
  - A lexical scan for `ONE-CHOKE`, `THETA`, `WHOLE-FAMILY`, `SWITCH-IMAGE`, `FLOOR`, `NECESSARY`, `STRUCTURED` and `SURPLUS`
    finds no key with this content. A text scan for "θ_Hall", "one-choke", "Sec ∪", "Lemma HX" and "whole-family" finds 0 hits in
    all three registries.
  - Mathematically nearest:
    - `E993-R30-CB-FAMILY-WHOSE-ROOT-FREE-MEMBERS-…`, whose reduction needs every `r`-free member to contain `v`, or every one to
      contain `s`. `P_1` has both kinds and neither kind, so it does not apply.
    - `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`, which covers deletion-only sector subfamilies. It supplies the floor's
      numerator but not the floor.
  - Both distinctions are recorded below. My row ids and record id collide with no existing row (the last existing row is
    `SR-C2-1-D1`).
- **Attribution.**
  - HX: r31 Cycle 3 critic C-F2-T, the critic of route F2, whose allocation named "Hall sums over structured `X`".
  - Floor, `N_γ` and the 13-row ratio: critic C-F2-U.
  - 332-row check: the F adjudicator.
  - Inputs: C1-LA1 (allocation from r31 Cycle 1 seat T1), C2-LA3, r30 keys, and Codex GPT-6's lower-region run for mechanism,
    weight, relation and (HALL).

  All of these travel on the faces below.

## Registration text

```text
SCOPE NOTE ON: E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL
TEXT: [r31 C3; SR-C3-4] Criterion-free Hall surplus at the sector plus the one-choke sources (proved_informal; first stated at r31 Cycle 3 Stage 4 by critic C-F2-T; confirmed with repairs by an isolated second read). For every integer m >= 107 with m ≡ 2 (mod 3), T = CB(8,m), p* = (16m+4)/3, K = p* − 1 = (16m+1)/3 and F = F_{p*}(T) = leafSet(T) (the formally verified graph-level clause [r31 C2; C2-LA3] on E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3), with the literal active-tag weight w_F and the literal relation (D) ∪ (S), put Sec := {B ∈ I_{p*+1}(T) : r ∈ B, v ∈ B}, P_1 := {B ∈ I_{p*+1}(T) : r ∉ B and B contains exactly one choke u_i} (weight-zero members included) and X := Sec ∪ P_1. Then Σ_{A ∈ N(X)} w_F(A) − Σ_{B ∈ X} w_F(B) >= 8m·(r_1(K−1) − r_1(K)) − R_{K−1}/K >= (251/100)·R_{K−1}/K > 0, where R_j = 2^j·C(8m, j) and r_1(k) = [y^k](1+y)^7(1+2y)^{8m−7} = Σ_{i=0}^{7} C(7,i)·C(8m−7, k−i)·2^{k−i}. Proof on the face. (1) Sec and P_1 are disjoint; a sector member has weight exactly 1 (v is active through r; r excludes every u_i, so no c_ij is active); a P_1 member with choke u_i has weight equal to the number of c_i· it contains; hence Σ_X w_F = R_K + 8m·r_1(K) (weight generating function of P_1: 8m·x²(1+x)^7(1+2x)^{8m−7}). (2) N(X) contains every in-sector p*-set (add c_ij at an empty leg, which exists since K − 1 < 8m; the source lies in Sec) and every positive-weight r-free one-choke p*-set (add an absent c_i·, or, when all eight are present, a c at an empty leg of another choke, which exists since p* < 8m + 1; the source lies in P_1); the two families are disjoint with total weights R_{K−1} and 8m·r_1(K−1). (3) R_K/R_{K−1} = 2(8m − K + 1)/K = (K+1)/K exactly because 3K = 16m + 1, so R_K − R_{K−1} = R_{K−1}/K. (4) 1 − ρ_1 >= θ := 288/(200m² + 82m + 5) with ρ_1 = r_1(K)/r_1(K−1): conclusion (v) of E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107 (formally_verified, r31 award C1-LA1). (5) With k = K − 1 and N = 8m − 7, Vandermonde gives r_1(k)/R_k = Σ_i a_i·2^{−i} / Σ_i a_i with a_i = C(7,i)·C(N, k−i), 0 <= i <= 7; a_{i+1}/a_i = ((7−i)/(i+1))·λ_i with λ_i = (k−i)/(N−k+i+1) decreasing in i, so (a_i) is dominated in likelihood-ratio order by Binomial(7, q), q = λ_0/(1+λ_0) = (16m−2)/(24m−18), which decreases in m with q(107) = 57/85; since 2^{−i} decreases, r_1(K−1)/R_{K−1} >= (1 − q/2)^7 >= (113/170)^7. (6) Hence 8m·(r_1(K−1) − r_1(K)) = 8m(1 − ρ_1)·r_1(K−1) >= [768m(16m+1)(113/170)^7/(200m² + 82m + 5)]·R_{K−1}/K, and the bracket increases in m (derivative numerator 1112m² + 160m + 5 > 0) and exceeds 3.511 at m = 107. Inputs: conclusion (v) of the allocation key (formally_verified), F_{p*} = leafSet (formally_verified clause) and elementary counting; the weakest step is informal, so the note is proved_informal. Not used: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL or any E1 arc value or load (ρ_1 enters only as the coefficient ratio in conclusion (v)); Darroch's theorem, Newton's inequalities or any real-rootedness (step (5) is a likelihood-ratio comparison of explicit binomial weights); the θ* law (θ is the allocation key's governed value, not an LP optimum); LP optimality. No cutoff beyond the class endpoint 107 and no asymptotic step. Bounded support (bounded_computation, never evidence): record R31-C3-SR-C3-4-CB8-SECTOR-PLUS-ONE-CHOKE-HALL-SURPLUS-AND-SECTOR-SWITCH-FLOOR-ROWS-107-TO-1100 (the exact middle expression is at least 124.22·R_{K−1}/K at every class row to 1100, minimum at m = 107). What it is: a necessary condition of this key's (H) at one structured X, which (H) itself implies; it is not a step toward (H), not progress on the formal fourth conjunct (the saturating flow on cbGraph m), and it changes no grade (this key stays proved_informal, not decisive). Fences: one rank p* per tree and the class only (nothing at m < 107, at m ≡ 0, 1 (mod 3), at other ranks, for d ≠ 8, for heterogeneous CB patterns or arbitrary trees); Hall at other X, including X mixing Sec with r-free sources having two or more chokes, is neither tested nor asserted; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, governed beta and Erdős #993 stay OPEN, with no status transfer; E993-TREE-REAL-ROOTED stays REFUTED. Attribution: the statement and its proof: r31 Cycle 3 critic C-F2-T (critic of route F2, whose allocation named Hall sums over structured X); check over 332 class rows: r31 Cycle 3 F adjudicator; θ and conclusion (v): the allocation key's governed award (allocation r31 Cycle 1 seat T1; residual origins as registered on that key); F_{p*} = leafSet at graph level: r31 award C2-LA3 as registered; the root-plus-arm sector, r_q and ρ_q: r30 (E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL, with its named seats as registered); mechanism, weight, relation and (HALL): Codex GPT-6's lower-region run; isolated second read: r31 SR-C3-4.
```

```text
SCOPE NOTE ON: E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107
TEXT: [r31 C3; SR-C3-4] Sector switch-capacity floor (proved_informal; first stated at r31 Cycle 3 Stage 4 by critic C-F2-U; confirmed with repairs by an isolated second read) and the position of this key's θ above it (bounded_computation). Setting: every integer m >= 107 with m ≡ 2 (mod 3), T = CB(8,m), p* = (16m+4)/3, K = p* − 1, R_j = 2^j·C(8m, j), F = leafSet(T), literal w_F and (D) ∪ (S), Sec := {B ∈ I_{p*+1}(T) : r, v ∈ B} (R_K members, each of weight 1). Sector arcs, by case analysis: deleting a leg vertex gives an in-sector p*-set (r, v ∈ A; R_{K−1} of them, weight 1); deleting r or v, and the s-switch, give weight-0 targets; a b_ij-switch never applies (u_i ∉ B); the u_i-switch applies exactly at a choke in state (1, γ) and gives the image A = {v, u_i} ∪ {γ private leaves at choke i} ∪ {K − 1 − γ nonempty legs at the other chokes}, of literal weight γ, with exactly 8 − γ sector preimages; for 1 <= γ <= 7 there are N_γ = m·C(8,γ)·2^{K−1−γ}·C(8m−8, K−1−γ) such images, and none for γ = 8. (a) Floor. If g >= 0 is any flow on literal arcs out of Sec with outflow >= 1 at every sector source, inflow <= 1 at every in-sector p*-set, inflow <= θ·γ at every weight-γ image, and zero on arcs to every other target (automatic for any flow within capacities, by the case analysis), then R_K <= R_{K−1} + θ·Σ_{γ=1}^{7} γ·N_γ, that is θ >= θ_Hall(m) := (R_K − R_{K−1})/Σ_{γ=1}^{7} γ·N_γ. Proof: sum the outflows. The numerator R_K − R_{K−1} = R_{K−1}/K is the sector's maximum deletion deficit registered in E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT at t = 1, d = 8, p = p*. (b) Reading on this key's allocation (conditional): through the literal sector reduction of E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107 at its own grade (the allocation's Out, In and (8 − γ)·σ(γ) are the literal sector outflow, in-sector inflow and image switch load), this key's conclusions (ii), (iii) and (iv) place its allocation under (a), so θ(m) = 288/(200m² + 82m + 5) >= θ_Hall(m) necessarily; a row with θ(m) < θ_Hall(m) would contradict this key together with that reduction. (c) Bounded (bounded_computation, exact): 1.1879 <= θ(m)/θ_Hall(m) <= 1.1892 at every class row 107 <= m <= 1100 (332 rows; exact minimum 1.187937… at m = 107, exact maximum 1.189151… at m = 1100, strictly increasing over those rows), with θ_Hall(107) = 36132547728/342577655754191 (record R31-C3-SR-C3-4-CB8-SECTOR-PLUS-ONE-CHOKE-HALL-SURPLUS-AND-SECTOR-SWITCH-FLOOR-ROWS-107-TO-1100); so at those rows no sector allocation of the form in (a) has θ below θ(m)/1.1892. No claim about a limit, about rows beyond 1100, about LP optimality or uniqueness; the θ* law stays a conjecture. This note adds no formal content: this key's formally_verified grade covers its conclusions (i)–(v) as stated, not this note. Fences: (a) is a necessary condition on sector allocations, not a sufficient one, and says nothing about the E1 flow; template level and the class only (one rank p*; nothing at m < 107, at m ≡ 0, 1 (mod 3), at other ranks, for d ≠ 8 or for heterogeneous patterns); E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, governed beta and Erdős #993 stay OPEN, with no status transfer. Attribution: the floor, its proof and the image count N_γ: r31 Cycle 3 critic C-F2-U (critic of route F2); the ratio: C-F2-U (13 rows) and the r31 Cycle 3 F adjudicator (332 rows), re-derived by SR-C3-4 (332 rows, own instrument); θ = 288/L: this key's allocation (r31 Cycle 1 seat T1), first recorded by r30 as a conjecture; the sector deletion deficit: r30 (E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT, as registered); the root-plus-arm sector and the choke-local certificate method: r30 (named seats, as registered); mechanism, weight, relation and (HALL): Codex GPT-6's lower-region run; isolated second read: r31 SR-C3-4.
```

```text
DISTINCTION ROW: SR-C3-4-D1
KEY: E993-R30-CB-FAMILY-WHOSE-ROOT-FREE-MEMBERS-ALL-CONTAIN-ARM-LEAF-OR-ALL-CONTAIN-ARM-SUPPORT-HAS-DEFICIENCY-AT-MOST-ITS-ROOT-AND-ARM-LEAF-SECTOR-PART
TEXT: The [r31 C3; SR-C3-4] note on E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL bounds def(X) at X = Sec ∪ P_1, with P_1 the r-free sources having exactly one choke. The registered key's reduction def(X) <= def(X ∩ Sec) applies only when every r-free member of X contains v, or every one contains s. P_1 contains r-free members with v, members with s and members with neither, so neither clause applies, and the note's bound is proved directly by counting. It is consistent with the key's corollary (a deficient X needs a member with neither r nor v and one with neither r nor s): Sec ∪ P_1 has both and is shown non-deficient on the class. Neither statement implies the other; the registered key is unchanged.
```

```text
DISTINCTION ROW: SR-C3-4-D2
KEY: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: The registered key gives the maximum deletion-only deficit over subfamilies of the root-plus-arm sector; on CB(8,m) (t = 1) at p* = (16m+4)/3 with m ≡ 2 (mod 3) it is R_K − R_{K−1} = R_{K−1}/K > 0, R_j = 2^j·C(8m, j), K = p* − 1 (its criterion (t+2)(p−1) < (t+1)(dm+1) reads 16m + 1 < 16m + 2). The two [r31 C3; SR-C3-4] notes use that quantity as the sector's shortfall: the note on E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL evaluates the full (D) ∪ (S) neighbourhood of Sec together with the one-choke r-free sources, and the note on E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107 divides it by the total weight of the sector's u_i-switch images. Neither note restates, extends or upgrades the registered key, which is unchanged.
```

```text
RECORD: R31-C3-SR-C3-4-CB8-SECTOR-PLUS-ONE-CHOKE-HALL-SURPLUS-AND-SECTOR-SWITCH-FLOOR-ROWS-107-TO-1100
CLAIM: At every integer m with 107 <= m <= 1100 and m ≡ 2 (mod 3) (332 rows), with p* = (16m+4)/3, K = p* − 1, R_j = 2^j·C(8m, j), r_1(k) = Σ_{i=0}^{7} C(7,i)·C(8m−7, k−i)·2^{k−i}, ρ_1 = r_1(K)/r_1(K−1), θ = 288/(200m² + 82m + 5), N_γ = m·C(8,γ)·2^{K−1−γ}·C(8m−8, K−1−γ) and θ_Hall = (R_K − R_{K−1})/Σ_{γ=1}^{7} γ·N_γ, exactly: K·R_K = (K+1)·R_{K−1}; θ <= 1 − ρ_1; r_1(K−1)/R_{K−1} >= (1 − q/2)^7 >= (113/170)^7 with q = (16m−2)/(24m−18); 768m(16m+1)(113/170)^7/(200m² + 82m + 5) >= 3.511, strictly increasing over the rows; [8m·(r_1(K−1) − r_1(K)) − R_{K−1}/K]·K/R_{K−1} >= 124.22 (minimum at m = 107, 1286.58 at m = 1100); 1.1879 <= θ/θ_Hall <= 1.1892 (minimum 1.187937… at 107, maximum 1.189151… at 1100, strictly increasing); θ_Hall(107) = 36132547728/342577655754191; Λ := (1 − ρ_1)/θ_Hall runs from 41.46 (m = 107) to 425.89 (m = 1100), strictly increasing. At m = 107, 110, 113: tree, α = 9m + 1, x = p* − 2 computed through rank α, eligibility, Δ_{p*}(T − t) < 0 for v and three private leaves, and (WID) from independent sides (weight-side class decomposition against Σ_F [q_t(p*) − q_t(p*−1)] by a generic forest DP). Literal brute force on CB(8,1), CB(8,2), CB(3,3), CB(4,3), CB(2,5), CB(5,2) at 31 small (ineligible) ranks with F = leafSet stipulated: the counting identities of the two notes' steps (the source sum, the neighbourhood containments and lower bound, the sector-arc case analysis, the preimage count d − γ and the image counts) hold at every instance; negative surpluses there are not cuts.
STATUS: bounded_computation
PROVENANCE: r31 SR-C3-4 own instruments, standard library and exact arithmetic, under scratchpad/c3-sr-SR-C3-4/: sr4_rows.py (SHA-256 69e1d154ff60c0d16285d092e4fc0b5b4b2c9c4a1276e269dd125fc9d64c6d4a; payload d5375f59768ada075eed26ef56485275066fd3dbf86269dc2c0ae79a0ac7dbdf), sr4_ratio_mono.py (e51d0ee251676fb9133e992f46407eaf56879bf1db422f9d27062447db4b556a; payload abe65b7b9fff29d7b726fcf4ebbe870b78a13c3e233e98e391922505990db332), sr4_wid.py (aa93381ddd0104a3907cd7229cf43f48255c484de50df3a9fb0545a457a573de; payload 8faa7d531c195298f48c56a8519bd4008058f97cb27d867d5915e76c4729b99d), sr4_literal.py (f44f48e6b674f34071eddd650171fa5437a0fdea26a14e94a05d44cc316d9405; payload df33bf1077212da34dcbf7f009bc32f763269384bbbacc757e48616b50283b00), sr4_literal_wid.py (af6e19661d6016662e401fc18af7a8c94e4e2ef7cb63b2e61db8cbe3957dbcf0; payload 100666d30cd52df9ec7facef4808302e0909775db3f5b6d155d19328b64e044b). Concordant with, and not evidenced by, the r31 Cycle 3 F adjudicator's own/adj_hx.py ledger and critics C-F2-T and C-F2-U. Never proof of any universal statement.
```

## Verdicts

verdict[SR-C3-4a]: confirmed_with_repairs
verdict[SR-C3-4b]: confirmed_with_repairs
verdict[SR-C3-4c]: confirmed_with_repairs

- **SR-C3-4a.** Lemma HX is mathematically correct at every step, at `proved_informal`, with no cutoff beyond 107. The repairs are
  R-1 to R-3 (wording and face hypotheses).
- **SR-C3-4b.**
  - The floor is correct at `proved_informal` and is elementary in network form. The repairs are R-4 (sum over `γ = 1..7`) and R-5
    (the conditionality attaches to the template reading only).
  - The ratio is confirmed at `bounded_computation`: `[1.1879, 1.1892]` over all 332 class rows to 1100. The exact extremes are
    `1.187937…` at 107 and `1.189151…` at 1100 (R-6).
- **SR-C3-4c.** Register the two scope notes, the two distinction rows and the record above verbatim.
  - G-4 is registered as the HX note only. The rest of G-4 (status map, reserved name) is outside this read.
  - Neither note changes a key's grade. The R-1 key's `formally_verified` grade does not extend to its note.

Seal verified: `8de2fea180ede0ba53253890b90e39b44b76afbd82e056c6b749c1e1451e0681`.

Two-part model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Artifact inventory

| Path (run root relative) | SHA-256 |
|---|---|
| `scratchpad/c3-sr-SR-C3-4/digest-check.txt` (272-member digest check) | `896a697912dfd6c4f268d917a02ed26069eefd145cc85ca559c303b14e771719` |
| `scratchpad/c3-sr-SR-C3-4/sr4_rows.py` | `69e1d154ff60c0d16285d092e4fc0b5b4b2c9c4a1276e269dd125fc9d64c6d4a` |
| `scratchpad/c3-sr-SR-C3-4/sr4_rows.out.txt` (payload `d5375f59…dbdf`) | `d779eb5e8742a3692ea0a452af37e74ce853f2d14235c478a82bce832e1dcb70` |
| `scratchpad/c3-sr-SR-C3-4/sr4_ratio_mono.py` | `e51d0ee251676fb9133e992f46407eaf56879bf1db422f9d27062447db4b556a` |
| `scratchpad/c3-sr-SR-C3-4/sr4_ratio_mono.out.txt` (payload `abe65b7b…b332`) | `648877776c95b29d65b995c3aa3c6ee02764384c7d0a73748b7a7c8500ee89bf` |
| `scratchpad/c3-sr-SR-C3-4/sr4_wid.py` | `aa93381ddd0104a3907cd7229cf43f48255c484de50df3a9fb0545a457a573de` |
| `scratchpad/c3-sr-SR-C3-4/sr4_wid.out.txt` (payload `8faa7d53…b99d`) | `ab03ca3468d2fd2dd3fbf7480b70f664e40959cdd6578fccdd2b5dbc4bb8827c` |
| `scratchpad/c3-sr-SR-C3-4/sr4_literal.py` | `f44f48e6b674f34071eddd650171fa5437a0fdea26a14e94a05d44cc316d9405` |
| `scratchpad/c3-sr-SR-C3-4/sr4_literal.out.txt` (payload `df33bf10…3b00`) | `a4f0258fc377a6710131c2afe5497f9ab9c2b1f5c21367ed528b503ed3a4336b` |
| `scratchpad/c3-sr-SR-C3-4/sr4_literal_wid.py` | `af6e19661d6016662e401fc18af7a8c94e4e2ef7cb63b2e61db8cbe3957dbcf0` |
| `scratchpad/c3-sr-SR-C3-4/sr4_literal_wid.out.txt` (payload `100666d3…044b`) | `0713791dae3c8c4073fffcb9bd82c6a7a033c70998cc3b9be7185aff0c5e06b2` |
| `second-reads/SR-C3-4/SECOND-READ.md` | this file |

Commands, all in the foreground with `python3 -B`, in `scratchpad/c3-sr-SR-C3-4/`:
- `sr4_rows.py` (about 5 s);
- `sr4_ratio_mono.py`;
- `sr4_wid.py` (about 6 s);
- `sr4_literal.py` (about 14 s);
- `sr4_literal_wid.py` (about 12 s).

No sealed member was edited. Reread before close: done.
