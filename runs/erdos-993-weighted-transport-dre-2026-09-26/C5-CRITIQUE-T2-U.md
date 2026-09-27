# Critique

Critic `C-T2-U` (cross-orientation U, formal / structural) of route `C5-T-02 HETEROGENEOUS-SWITCH-NECESSARY-ROW-CLOSURE`
(seat T2, orientation T), Cycle 5 Stage 4, run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30). Date 2026-09-27.

**Boot.** I am operating within VerityOS. Boot reads, exactly and only: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I did not follow the startup protocol's task map into memory, decisions,
logs, operations or conversations. The host put the project `CLAUDE.md` and the user's memory index into my context at session start.
I did not open or act on either, and I kept no conversation log because the dispatch limits my writes to this file and my scratch.

**Model disclosure (two parts):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

| Object | Value | Check |
|---|---|---|
| Dispatch `control/dispatch/c5-stage4/DISPATCH-C-T2-U.md` | `86735af81e837c1e317768dee892f53868e6716cc16e90bcde180faf514357e3` | `shasum -a 256` matches the pointer, checked before I followed it |
| Capsule `control/c5-critic-capsules/T2-PACKET-MANIFEST.json` inner seal | `3f58173d43e2172d355f070eaaa136ba87db2a432ab53a960c9a70289c475b78` | recomputed (canonical JSON without `seal_sha256`, sort_keys, `(",", ":")`, no trailing newline): **match**. All 14 members match on SHA-256 and byte count |
| Stage 4 dispatch manifest inner seal | `8987ae6103a006574f10d7a79ba9cb61fa9f1f9700ef9b731123f540d3c5028d` | recomputed: **match** |
| Stage 3 packet manifest inner seal | `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58` | recomputed: **match**. Its entry for `returns/T2/RETURN.md` (`91113a42…`) equals the capsule's |
| Stage 2 packet manifest inner seal | `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289` | recomputed: **match**, and it equals the common brief's quoted value and the return's |
| **Stale literal (controller finding)** | `C5-CRITIC-PROTOCOL.md` duty 1 quotes the Stage 2 seal as `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684` | **does not match** the sealed Stage 2 manifest (`2e8e3d44…`). The manifest, the common brief and the return all agree on `2e8e3d44…`, so I treat `f0b5a2a1…` as residue carried over from an earlier protocol, in the R30-E-h class. The controller should record an erratum. None of my conclusions depends on it |
| Return's 13 inventoried scratch artifacts (`scratchpad/c5-T2/`) | digests in the return's table | copied out to `scratchpad/c5-crit-T2-U/replay/` first. All **13/13 match** |
| Stage 3 read-boundary disclosures (capsule member) | T2 items | names-only `ls` of `scratchpad/`, `scratchpad/c4-crit-T1-U/` and 3 Cycle 4 directories. This is the recurring low-severity class and is weighed as disclosed. The headline-flag amendment made before the seal is recorded |

Registered claims this critique touches: (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN at full scope, unchanged);
(WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (`formally_verified`); CD-1 `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`
and E1-R `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (both `proved_informal`, used as
inputs); the neighbouring keys `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` and
`E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK` (for the alias check). The primary aggregate is untouched.

## Independent re-derivation

I built every instrument myself (`scratchpad/c5-crit-T2-U/own/`, standard library only, `python3 -B`, exact `int`/`Fraction`).
I used none of the return's code, except to read off the LP's candidate per-state values. I then checked those values with my own algorithm.

**Replay (sourcing, not evidence).** `rowdata.py`, `rho.py`, `window_check.py` and `hetero_certify.py`, copied out and rerun, reproduce
their shipped outputs **byte-for-byte** (runtimes 9.8 s, 0.5 s, 4.9 s, 1.4 s). I did not run `alias_check.py`, because it reads the
run-local registry, which is outside my capsule, or `verify_seal.py`, whose relative path does not resolve from my scratch. I
recomputed the seal myself (above).

**R1. Row data and fidelity (`own_row.py`).** I relabelled the tree (degree-7 chokes first) and built it from its own edge list.
The union-find acyclicity check and the BFS connectivity check pass. The independence polynomial comes from a generic post-order DP
over the edge list with an arbitrary deletion set, and I checked it against the closed form `(1+2y)Q_8^82 Q_7^2 + y(1+y)(1+2y)^670`:
identical. `i_0 = 1`, `i_1 = n`, `i_2 = C(n,2) − (n−1)` hold. **`n = 1427`, `α = 755`, `x = 446`** (first strict descent,
zero-extended through rank `α`; `Δ_445 > 0`, `Δ_446 < 0`), window **`[448, 503]`, 56 ranks**. All confirmed.

**R2. `F_p` derived at every rank.** 671 degree-one vertices. I computed `Δ_p(T − v) < 0` with the generic DP for six representatives:
the arm leaf; private leaves at both degree-7 chokes (different legs); and private leaves at three different degree-8 chokes (different
legs). All six are favorable at **every** `p ∈ [448, 503]`. Leaves in the same orbit have **identical** `I(T − leaf)` polynomials,
which is a numerical check of the automorphism argument. So `F_p = leafSet(T)` at all 56 ranks, derived rather than hard-coded.

**R3. `supply − capacity = S` from genuinely independent sides.** Side 1 is the aggregate `Σ_{v∈F}[q_v(p) − q_v(p−1)]`, with every
`i_j(T − H_v)` and `i_j(T − R_v)` from the generic DP. Side 2 is `Σ_{B∈I_{p+1}} w_F(B) − Σ_{A∈I_p} w_F(A)`, taken from a weight
generating function I derived **from the definition of the active weight**, never via `q_v`:
- `r ∈ B`: contributes `y·y·(1+2y)^670` (only the arm tag can be active, through `r`).
- `r ∉ B`: contributes `(1+2y)·Σ_i d_i y²(1+y)^{d_i−1} Π_{k≠i} Q_{d_k}` (each `c` at a present choke is active through its `u_i`).

My laboratory (R5 below) validates this generating function against literal enumeration of `Σ_B w_F(B)` on six small heterogeneous
profiles. Result: the two sides agree at **all 56 ranks**. At 448, supply and capacity each have 322 digits and `S` has 320 digits.
My `S(T,448)` is character-identical to the return's, and `S < 0` at every rank.

**R4. The sector and its exits.** In the sector `{B : r, v ∈ B}` every choke hub is absent. The arm tag is active through `r`, and every
private tag is inactive, so each member has weight 1. The only positive-weight exits are in-sector leg deletions (weight 1) and
`u_i`-switches at chokes with `β_i = 1` (image weight `γ_i`). Deleting `r` or `v`, or switching at `s`, lands on weight 0, and no other
switch is possible. The sector is the claw product `Π_{670} K(2)`, with `e_k = 2^k C(670,k)` and `e_k/e_{k−1} = 2(671−k)/k`. This is
`448/447 > 1` at `k = 447` (p = 448) and `≤ 1` at every `p = 449…503` (e.g. `223/224` at 449, `169/251` at 503). So 448 is the unique
sector-deletion-deficient rank. At 448, deletion alone fails on `X = sec` itself, so the switch arcs are load-bearing there.

**R5. Literal laboratory for the flow model (`own_lab.py`; critic-derived, and the allocation's item 2(d) "literal laboratory
validation" that the return did not supply).** Profiles `[2,3]`, `[3,2,2]`, `[3,3,2]` and `[1,2,3]`, at six ranks in total, give up to
4863 sources per layer. I enumerated every independent set, built the relation (D) ∪ (S) literally from neighbourhoods, and computed
`w_F` literally from `W_v = N(s_v) ∖ {v}`. Findings:
- Layer weight sums equal the generating function of R3.
- Every sector source has weight 1, and its positive-weight exits are exactly those of R4.
- For **random** rational choke-local rules `pb_d, pc_d, σ_d`, the literal load on every target equals T2's formulas exactly:
  `In_d = Σ_i (d_i − n_i)(pb(β_i+1, γ_i) + pc(β_i, γ_i+1))` on in-sector targets, `(d − γ)σ_d(γ)` on one-choke switch images, and 0
  elsewhere.
- No non-sector source has a deletion arc into an in-sector target. The only other arcs into in-sector targets are `r`-switches from
  two-choke `r`-free sources, and E1-R, being deletion-only, never uses them.

This closes the gap that the return's "two instruments" (LP plus DP in one file) left open: both instruments share the unvalidated
`Out`/`In` model. The model is now literal-exact on 6/6 laboratory rows. `ALL_LAB_OK True`.

**R6. The certificate at 448, rechecked by a different algorithm (`own_cert448.py`).** I did not use the affine constants `a, λ`. I took
the per-state values from the LP and computed min-plus and max-plus convolution **powers** (repeated squaring over the degree-8 table,
82 copies), then convolved with exactly two degree-7 copies:
- **min Σ Out over all sector sources (447 legs) = 1**
- **max Σ In over all in-sector targets (446 legs) = 1**
- all 155 values are nonnegative
- `(d − γ)σ_d(γ) ≤ θ*_d γ` for every `d, γ`
- `θ*_7 = 0`, and `σ_7 ≡ 0`; `θ*_8 = 384/1832557`, and `σ_8 > 0` at every `γ = 1..7`

My own binomial-sum coefficients give **`ρ_(1,7) = 5327002801984/5350924042653 ≈ 0.995529512`** and
**`ρ_(1,8) = 588641648396200/591947103906771 ≈ 0.994415961`**. Both equal the return's values, and `θ*_d ≤ 1 − ρ_(1,d)` holds for both
degrees; at degree 8 the margin is about 27×. `CERT_OK True`.

**R7. Obstruction R8 (critic-derived).** R8 targets are in-sector targets all of whose preimages are switch-dead: no choke has `β = 1`,
and every choke with an empty leg has `β ≥ 2`. Their maximum load under the certificate is **exactly 1**. They are tight but not
overloaded, whereas a uniform `1/447` share loads every in-sector target at `448/447 ≈ 1.002237`. The certificate is **one-hop and
non-uniform**. It does not construct the "two-hop route" that the allocation's parenthetical anticipated, and does not need one:
R8 obstructs only a uniform per-source share, and a source whose split depends on its local state clears it at equality.

**R8. The E1-R criterion census at all 56 ranks (critic re-derivation; `own_e1r_census.py`).** The return cites the Cycle 4
bounded record and recomputes only `(1,7)` and `(1,8)`. I checked `ρ_Q = r_Q(p−q)/r_Q(p−q−1) ≤ 1` myself, with
`r_Q = (1+y)^{D_Q−1}(1+2y)^{D−D_Q+1}` (the registered SR-C4-6 poset), for **every** choke-set type `(a, b)` (`a ≤ 82` degree-8,
`b ≤ 2` degree-7, `q ≥ 1`) at **every** `p ∈ [448, 503]`. The criterion holds everywhere. The maximum is `0.995529512` at `p = 448`,
at `(a, b) = (0, 1)`, i.e. `(q, D_Q) = (1, 7)`; at `p = 503` the maximum is `0.668508854`. This reproduces the record's figure. It is
`bounded_computation`, and I cannot audit E1-R's proof that the load equals `ρ_Q·w` because it lies outside my capsule. I use E1-R at
its registered grade.

**Composition (R4–R8 together).**
- **At 448:** the sector flow loads in-sector targets at most 1 and switch images at most `θ*·w`. E1-R's deletion-only flow loads every
  `r`-free target at `ρ_{Q(A)}·w` and every in-sector target at 0. So each target class stays within its weight: in-sector at most `w`,
  switch images at most `(ρ + θ*)·w ≤ w`, and all other `r`-free targets at `ρ·w ≤ w`. Every source is saturated after proportional
  scaling (outflow ≥ supply). This gives a fractional saturating flow, hence (HALL-COND) for every `X`, hence an integral flow by
  (HALL⇒FLOW).
- **At 449–503:** CD-1 on `Π_{670} K(2)` gives `|∂X| ≥ |X|·e_{k−1}/e_k ≥ |X|` for the sector (unit weights), which is Hall. E1-R covers
  the rest.

The composition is **sound as stated** at the per-class level that SR-C4-3 requires, not as a global bound.

## Attacks and findings

1. **(Struck, ruling 17/24) The return's `supply − capacity = S` check is non-falsifiable.** `rowdata.py` lines 324–328 set
   `supply := Σ_v q_v(448)` and `capacity := Σ_v q_v(447)`, then compare `supply − capacity` with `Σ_v (q_v(448) − q_v(447))`. These
   are two groupings of one sum, so the check cannot fail. Neither side is `Σ_B w_F(B)` (the network supply); both are the WID right
   side. The return's §4 defence (Method A vs Method B for the `i_j`) checks the `i_j` values, not the identity. **The fidelity fact is
   true**, but it now rests on my independent sides (R3), at all 56 ranks rather than at 448 only. The return's §4 labels "supply" and
   "capacity" are misnomers for `Σ q_v(p)` and `Σ q_v(p−1)`.
2. **(Supplied by me) The two certificate instruments shared a model.** The LP and the "independent" DP sit in one file and evaluate
   the same `Out_from`/`In_from` formulas. The DP legitimately checks the LP's values without the affine relaxation, but nothing checked
   that the formulas describe the literal network. The allocation's item 2(d) asked for a literal laboratory, and the return has none.
   R5 supplies it, and R6 re-verifies the values with a different algorithm.
3. **R8 and "two-hop".** Covered in R7: the certificate is one-hop and non-uniform, R8 targets are loaded to exactly 1, and the
   "two-hop" expectation is unnecessary. The return's §7 discussion of R8 is qualitative. It never evaluates R8 targets. It is correct in
   substance, and R7 makes it quantitative.
4. **Quantifiers.**
   - The whole-row claim is for every `X ⊆ I_{p+1}` via a flow, not a sector-level or whole-layer inequality. The DP ranges over every
     multiset of choke states with the **correct degree multiplicities**: exactly 82 of degree 8 and 2 of degree 7. My convolution
     powers fix the multiplicities structurally.
   - The switch-image count `d − γ` is correct: a switch image has `u_i` present, so its choke carries only `c`-legs, and each empty leg
     gives one preimage. R5 confirms this literally.
   - A switch image receives sector flow from one choke only (it has exactly one hub present).
   - `γ = 0` images (weight 0) are never fed. Reducing a source's outflow to exactly 1 can only lower loads.
   - No natural-number subtraction is involved (everything is `Fraction`).
   - No circularity: nothing assumes `S ≤ 0`.
5. **Composition inputs are proved_informal plus bounded.** The whole-row statements at all 56 ranks rest on E1-R (`proved_informal`;
   conditional on CD-1) and on the E1-R criterion census. I re-derived that census (R8), but it remains `bounded_computation`. §9 also
   rests on CD-1 (`proved_informal`). The §7 sector certificate alone rests on neither, except that its capacity target
   `(1 − ρ)·w` is defined through E1-R's `ρ`. The return says this correctly (Remaining obligation item 3).
6. **§9's invocation is CD-1 exactly**, in the constant case `q_i = 2`, `M = 670`. It is CD-1 plus E1-R's non-sector flow, and the
   return names both. My R4 ratio check confirms `e_k ≤ e_{k−1}` at `k = 448..502`. The 55 ranks are therefore **carried by registered
   statements plus bounded checks**, not merely asserted.
7. **Naming (ruling 33).** Both proposed keys read as **class** statements ("MIXED-DEGREE-CHOKE-TREE"), but each is a predicate of
   **one tree**, `G(8^82, 7^2)`, and the first is also a predicate of one rank. The second name also collides lexically with the full
   9-token pattern of `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`, as the return itself found, and a
   registry lint would flag it. **Rename to name the tree and the ranks**, for example:
   - `E993-R30-G-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`
   - `E993-R30-G-8POW82-7POW2-RANKS-449-TO-503-DELETION-ARC-WEIGHTED-HALL`

   Alternatively, use one key `E993-R30-G-8POW82-7POW2-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK` with the 448 switch certificate as its
   scope note. The mathematical distinction from the five-CB keys (two choke degrees, a non-CB tree) is real. I could not run the lexical
   alias check against the registry because it is outside my capsule, so the adjudicator or second read must do it.
8. **Verdict label.** The return types its route verdict `proved_conditional`. The verdict vocabulary is not in my capsule, so I rule
   only on the grade. By SOLUTION-CONTRACT §4 a composition's grade is its weakest input's. With registered `proved_informal` inputs
   and a bounded census, that grade is **`computer_assisted`, STATED**, which is exactly what the return's own `## Grades` section says.
   "Conditional" adds nothing beyond that and should not be read as a separate, stronger grade.
9. **Minor literal inconsistencies.**
   - §2 says "eight polynomials" and §4 says "All four polynomials (H_v, R_v for both leaf types)". The shipped output has **ten**
     polynomial comparisons (full; three single-leaf deletions; six `H/R`, for three leaf types) plus an `x` match.
   - "~5s" for `rowdata.py` was 9.8 s on replay.

   These are corrections, not strikes.
10. **Unauditable within my grant.** The return reports a byte-identical replay of `C-T1-U`'s Cycle 4 scripts and digests from
    `ADJUDICATION.md`. Both lie outside my capsule. The return itself says the replay is not load-bearing, and I neither confirm nor
    rely on it.

Standing letters (ruling 39, the successor of ruling 30's (a)–(d)): **T2 supplies half of (b′).** That half is whole-row (HALL) at
`G(8^82, 7^2)/448`, `computer_assisted` STATED, pending an isolated second read, and extended here to all 56 eligible ranks. The other
half, a second infinite eligible family at `proved_informal`, is F2's. T2 supplies nothing toward (a′), (c′) or (d′).

## Mechanism-equivalence and fence check

- **Not one of the ten refuted keys.** The weight is the literal `w_F` (active tags; R5 checks it literally) and the relation is
  literally (D) ∪ (S). Capacities are `w_F` and never unit own-support capacity (C6-F4). It uses no per-leaf injection, occupancy
  domination, signed cross-tag or covariance argument, and no Delete/Retag relation. At 448 the switch arcs are load-bearing (R4), so
  this is not deletion-only Hall. At 449–503 the flow is deletion-only on a row where deletion suffices. That is a finite-instance fact,
  not a revival of `E993-R23-LITERAL-DELETE-ONLY-HALL`, which is refuted at its own exact scope.
- **No closed region re-proved.** `n = 1427` lies inside the unresolved band (`2p + 3 ≤ n ≤ 4p − 8` at every `p ∈ [448, 503]`). The tree
  is not in the `T_m`, spider or path-star families, and it is not a sixth homogeneous CB row.
- **Fences held.** No census value is used as a universal step (the certificate is an exact finite decision), there is no RTree wording,
  and the controller's prior is not cited. (LIFT) is not used. `D, C ≥ 0` is not used for the budget. No live root was read.
- **Finite ≠ universal.** The return correctly keeps (HALL) OPEN at full scope and the primary aggregate untouched.

## Certification audit

| Literal | Status |
|---|---|
| `n 1427, α 755, x 446, window [448,503]` | **backed** (my R1; replay) |
| "F_448 = leafSet(T), all 671, derived"; "ALL_56_RANKS_ALL_LEAVES_FAVORABLE" | **backed** (my R2, at all 56 ranks) |
| "supply − capacity == S … True" (§4, `out_rowdata.txt`) as an independent-sides fidelity check | **STRUCK** (ruling 17/24; finding 1). The identity itself is **backed** by my R3 at all 56 ranks |
| "supply (digits) 322 / capacity 322 / S 320"; exact `S(T,448)` | **backed** (my R3; character-identical `S`) |
| `ρ_(1,7)`, `ρ_(1,8)` and the residuals `≈ 4.470488×10⁻³`, `≈ 5.584039×10⁻³` | **backed** (my R6) |
| LP values `θ*_7 = 0`, `θ*_8 = 384/1832557`; "min Σ Out = 1", "max Σ In = 1"; "CERTIFIED … True" | **backed** (replay byte-identical; my independent convolution verifier R6) |
| "two independent exact instruments" for the certificate | **narrowed**: two checks that share one model. The model is now validated by my literal lab (R5) |
| "UNIQUE_DEFICIENT_RANK_IS_448" | **backed** (my R4) |
| "E1(-R) criterion holds at all 56 ranks (max ρ 0.995530 at 448, at (1,7))" | cited by T2 as a record. **Re-derived and backed** by me (R8, `bounded_computation`) |
| "(HALL) holds at every one of the 56 eligible ranks" | **backed at `computer_assisted`, STATED**, given E1-R and CD-1 at their registered `proved_informal` grades |
| "retires the entire known instance frontier" | backed only as the return scopes it: the one switch-necessary eligible row on record without a certificate. It carries the grade above |
| "eight polynomials" / "All four polynomials" / "~5s" | **corrected** (finding 9) |
| byte-identical `C-T1-U` replay | **not audited** (outside my grant; not load-bearing) |
| "no background job"; "no bytecode" | consistent with my replay. My own scratch has no bytecode (checked inside my own directory only) |

`## Remaining obligation` in the return ("On this route's own object: none") is **almost exact**, with two omissions. First, it should
name the missing literal-laboratory validation (supplied here). Second, the whole-row claims need an isolated second read and a
tree-specific key name before registration. Its run-level items 1–5 are exact.

## Verdict

verdict: retained_narrowed
headline_resolved: no

The mathematics of the return stands. The choke-local, non-uniform, reduced-capacity sector certificate at `G(8^82, 7^2)/448` is valid:
I re-verified its values with an independent algorithm, and its flow model is literal-exact on my laboratory rows. Its per-class
composition with E1-R gives whole-row (HALL) at 448. CD-1 plus E1-R give whole-row (HALL) at 449–503. The grade is `computer_assisted`,
STATED, with the E1-R criterion census re-derived by this critic.

The return is narrowed in three ways. The §4 fidelity check is struck as non-falsifiable (the fact is restored on my instrument). The
"two instruments" claim is narrowed to one model with two checks, now validated literally by this critic. The two key names must be
rewritten to name the tree and the ranks.

I do not grade anything `proved_informal`: this is a finite certificate, and its composition inherits `proved_informal` inputs and a
bounded census.

## Remaining obligation

1. **Second read (isolated)** of the whole-row statement at `G(8^82, 7^2)` for `p ∈ [448, 503]` before registration, under a
   tree-specific key (finding 7). Its lexical alias check must be run against the run-local registry, which I could not read.
2. **E1-R's load statement** (`ρ_{Q(A)}·w_F(A)` on every `r`-free target, deletion arcs only) is the one input whose proof I could not
   audit within my grant. The adjudicator should confirm that its registered text covers one-choke targets containing `v` with the arm
   as a `K(2)` coordinate, which is the case the switch images occupy.
3. **Controller erratum:** the stale Stage 2 seal literal `f0b5a2a1…` in `control/C5-CRITIC-PROTOCOL.md` duty 1 (the sealed value is
   `2e8e3d44…`).
4. At the run level (not T2's object): (a′), the other half of (b′), (c′) and (d′) are untouched. (HALL) stays OPEN at full scope.

## Artifact inventory

Deliverable: this file, `cycles/cycle-5/stage4/critics/T2/U/CRITIQUE.md`. Scratch: `scratchpad/c5-crit-T2-U/` only. Every run used
`python3 -B` in the foreground. No background job was started, so none needed to be killed. There is no network use, no install and no
`lake`/`lean`, and there is no bytecode.

| File (under `scratchpad/c5-crit-T2-U/`) | SHA-256 | Role |
|---|---|---|
| `seals.py` | `0efa6eef001396641b42baaf4050835de3590455b4bf3a7d09adb242f2104f00` | capsule, Stage 2, 3 and 4 seal recomputation; member digests |
| `own/own_row.py` | `9b76e3accd90f2904a6534d494ec784519d7655bcac61106240c9e551c673ead` | R1–R3: tree test, generic DP, row data, `F_p`, independent-sides `S` at 56 ranks |
| `own/out_own_row.txt` | `39a6c308238bbc2625910de34ffba2308f7e53eeaec83a4832c35359260faf5d` | its output |
| `own/own_lab.py` | `48ea60220a573eff0c648832dbafe2f8ccb05e925b358ee5137f474a04163036` | R5: literal laboratory (weight GF, sector exits, flow-model formulas, no-leak) |
| `own/out_own_lab.txt` | `62fef2ffc925d18d5b9a429b6c4e67d33befb2ba8af8ea6f069463fa1998d10a` | its output (`ALL_LAB_OK True`) |
| `own/own_cert448.py` | `260f84561f22a9577b5ed7d59f36898199a74e9fabcc23de0c3b3ad5151e563b` | R6–R7: independent convolution-power verifier; `ρ`; R8 targets |
| `own/out_own_cert448.txt` | `d5a79b5bc7545c0c5451c41b22ce97fcdf49ed507d5dab84931639f914683d38` | its output (`CERT_OK True`) |
| `own/own_e1r_census.py` | `b743f84d7eb9742b18d75f8d22b80968fa608b4be4c95f477c65c8b995a9cef4` | R8: E1-R criterion at every `Q`, all 56 ranks |
| `own/out_own_e1r_census.txt` | `34cc46e20aaeb90f3e4ae859b1d15356e4312ed6330680072835d7e543c93c40` | its output |
| `replay/` (13 copied T2 artifacts) | as in the return's inventory (13/13 match) | copy-out replay |
| `replay/re_out_{rowdata,rho,window_check,hetero_certify}.txt` | identical to T2's shipped outputs (`19de28f0…`, `9061e0c3…`, `067c03fd…`, `d09cc747…`) | replay outputs, byte-identical |
| `replay/export_cert.py` | `d110db0295e92cfdcac351ca349ad07978718e30be0443329d6757831dddc960` | runs T2's LP only to export candidate values |
| `replay/cert_values.json` | `7a6f4c66eb7db2fc872b96a85b2a6adcaf02ae7591b194b11b97f7a11bc53849` | the 155 exported values checked by `own_cert448.py` |

Read-boundary disclosure: the only VerityOS reads beyond the two boot files were the capsule members, the dispatch, and T2's
inventoried scratch (copied out). I read nothing under `sources/`, and no other return, critique, adjudication, root or network
resource. I ran `grep` on named capsule-member files only, and one `find` inside my own scratch directory (a bytecode check).
