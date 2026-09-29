# Critique

Critic `C-T1-U` (cross-orientation, orientation U: formal / structural) of the Cycle 1 return of seat `T1`, route
`C1-T-01 LS-TOP-CLOSED-FORMS-FROM-EXACT-TABLES` (orientation T), r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`), 2026-09-27.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot:** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS subsystem. (The first attempt to print the
startup protocol failed on a shell quirk, so I read it in a separate call before any substantive work. The tool display
truncated the middle of `verity.md`, and I re-read that span.)

**Dispatch:** `control/dispatch/c1-stage4/DISPATCH-C-T1-U.md`: SHA-256 `5338ff135a52561754936ba04d0e8300368d9eeb531550343325633cea894585`,
verified with `shasum -a 256` before any other action.

**Read-boundary disclosures (complete list):**
1. The harness put the project `CLAUDE.md` and the user's auto-memory index into my context. I did not fetch them and did not use them.
2. One names-only, non-recursive `ls` of `cycles/cycle-1/stage4/`, which sits one level above my grant. I ran it to check whether the
   output directory existed. It showed a single entry, `critics`. I opened nothing and used nothing from it.
3. Before the final reread I ran one user-wide process listing (`ps -U <uid> | grep -c …`) to check for leftover jobs. Only an
   integer count was printed (11). No command line, PID or sibling content was displayed. I had started no background job, so I
   killed nothing.
4. All other reads were capsule members, frozen files under `sources/` (authorized as Stage 2 members), T1's inventoried scratch
   (`scratchpad/c1-T1/`: one non-recursive `ls`, then a copy-out into my own scratch) and my own scratch directory. I ran no `find`, `grep`
   or recursive search above a granted directory. I did no network access and no installs, and I started no background job.

## Identity and seal audit

- **Capsule** `control/c1-critic-capsules/T1-PACKET-MANIFEST.json`. The inner seal, recomputed as SHA-256 of the compact key-sorted
  JSON without `seal_sha256` and with no trailing newline, is `4fe158977944c7a5f2a5838a6b9ca0f16403fa81dd8c1c2e7cfb901b4d6ebf95`
  and matches. All 14 listed files match their SHA-256 and byte counts.
- **Stage 2 seal** `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`: recomputed, matches.
- **Stage 3 seal** `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37`: recomputed, matches. The Stage 3
  manifest lists `cycles/cycle-1/stage3/returns/T1/RETURN.md` at `6c9708d4…fb197f12d` (21578 bytes), which matches the file. It also
  lists `DISPATCH-T1.md` at `2f088bb2…4765d2`, the value the return quotes.
- **Stage 4 dispatch seal** `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b`: recomputed, matches.
- **Frozen inputs I used**, checked against `sources/SOURCE-DIGESTS.json` before use:
  `sources/r30/instruments/c6/C-T2-U/own/CERT-TABLES.json`,
  `sources/r30/instruments/c6/C-T2-F/{crit_cert_tables,crit_extend_a,crit_extend_b}.json` and
  `sources/authority/CLAIM-IDENTITY.json` (`b4a339ef…`, 491 claims). All match.
- **T1's digest.** A copy-out-first replay of `t1_generator.py` in `scratchpad/c1-crit-T1-U/replay/` ran in the foreground in 105 s
  and reproduced `ecb572f544ef65cf903c610a941fc756d6bd71c6f7de4fa850b9b7829521603a` exactly. The only edit was the `sys.path` line.
  The byte copies of every T1 artifact in `t1copy/` hash as listed in the inventory.
- **Claim identity.** T1's candidate key is
  `E993-R31-CB-8-TOP-RANK-SECTOR-ALLOCATION-CLOSED-FORM-SATISFIES-OUT-IN-SWITCH-FOR-EVERY-M`.
  - Lexical alias check: I searched the frozen registry for `E993-R31`, keys containing `SECTOR` together with `ALLOCATION` or
    `CLOSED`, `RESIDUAL`, `CB-8` and `SWITCH` in key names, and "sector allocation", "sector certificate", "residual capacity" and
    "288…200m" in statements. No alias turned up. The `RESIDUAL` hits (the G1 residual strata and `E993-R26-TOP-RANK-RESIDUAL-SIGN*`)
    are different objects. The nearest neighbour is the finite row key
    `E993-R30-CB-8-M-95-TO-107-…-WITH-LOAD-BEARING-SWITCH-ARCS` (`computer_assisted`), which has no closed form.
  - Mathematical alias check: the statement is not equivalent to any registered key. **Not an alias.**
  - The name is still defective. `FOR-EVERY-M` overstates the scope, which is `m ≥ 107`, `m ≡ 2 (mod 3)`, rank `p*` only. Suggested
    predicate:
    `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-ON-THE-RESIDUE-2-CLASS-FROM-107`.
- **Tier 3 keys cited by the return as "VERIFIED".** That is their registry *status*. Their evidence grade is `proved_informal`
  (`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`, `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`), and
  the grade must travel with the citation (`SOLUTION-CONTRACT.md` §1 Tier 3).

## Independent re-derivation

My own instruments use the standard library and exact `Fraction`/`int` arithmetic. They are in `scratchpad/c1-crit-T1-U/own/`. None of
them imports T1 code.

**(a) Where the allocation comes from.** `crit_alloc.py` reads the frozen r30 `d = 8` tables at `m = 95, 98, 101, 104` in
`CERT-TABLES.json`, which are independent of T1's solver.
- For each of the 72 `pb`/`pc` cells it fits `D(m)·value = A·m + B`, where `D(m) = (200m² + 82m + 5)/3`, using `m = 95, 98`. It then
  checks the fit at `101` and `104`. Every fit is exact, and every slope is `A = 25/2`.
- `θ·D = 96`, and `σ(γ)/θ = c_γ = 1/7, 1/3, 3/5, 1, 5/3, 3, 7/2` for `γ = 1..7`.
- From this point the allocation is a **definition**: `pb(β,γ) = (25m/2 + B_pb)/D`, `pc(β,γ) = (25m/2 + B_pc)/D`, `σ(γ) = c_γ·96/D`,
  `θ = 96/D`. The fit only produced the proposal and is not evidence.
- Cross-match with T1: `replay/cmp_intercepts.py` ran T1's own LP (copy-out) at `m = 95, 98, 110, 113` and compared every `pb`, `pc`
  and `σ` cell with my closed form. There were **316 cells and 0 differences**, and `θ = 96/D(m)` at every row. T1's closed form is
  therefore mine. The full intercept table, which T1 did not ship, is in `crit_alloc_out.json` (SHA-256 in the inventory).

**(b) Reducing Out, In and Switch to m-free inequalities.** I derived these from `D` directly, without taking `a`, `λ`, `a2` or `λ2`
from T1. Here `n = β + γ`, `K = p* − 1 = (16m+1)/3`, and the Iverson bracket `[β = 1, γ ≥ 1]` is 1 when that holds and 0 otherwise.

- **Out.** For a choke in state `(β,γ)`,
  `D·Out = (25/2)m·n + C(β,γ)`, where `C = β·B_pb + γ·B_pc + 96·c_γ·[β = 1, γ ≥ 1]`.
  - Every source must satisfy `Σ_i C_i ≥ D − (25/2)mK = (139m + 10)/6`.
  - `C(β,γ) ≥ 5n − 7/2` implies this, because then `Σ C_i ≥ 5K − 7m/2 = (139m+10)/6`, which is an identity in `m`.
  - This holds for **every** splitting of `K` over the `m` chokes, including chokes in state `(0,0)` and chokes with `n = 8`.
- **In.** For a choke in state `(β,γ)`,
  `D·In = 25m(8−n) + E(β,γ)`, where `E = (8−n)(B_pb(β+1,γ) + B_pc(β,γ+1))`, and `E = 0` when `n = 8`.
  - Every in-sector target must satisfy `Σ_i E_i ≤ D − 25m(8m − K + 1) = (32m+5)/3`.
  - `E ≤ 24 − 5n/2` implies this, because then `Σ E_i ≤ 24m − 5(K−1)/2 = (32m+5)/3`, again an identity.
- The two aggregate identities are polynomial identities of degree at most 2 in `m`. I checked them exactly at five points, which
  proves them. They agree with T1's `m·a + λK = 1` and `m·a2 + λ2(K−1) = 1`.
- **Checked on all 45 states:**
  - Out: minimum slack 0, and every slack is at least 0. 40 states are tight, including `(1,7)`, where `C(1,7) = 73/2`. State `(0,0)`
    has slack `7/2`.
  - In: minimum slack 0, and every slack is at least 0. All 36 states with `n < 8` are tight. The 9 states with `n = 8` have slack 4.
  - Switch: `(8−γ)c_γ ≤ γ`, with slack 0 for `γ = 1..6` and `7/2` for `γ = 7`.
  - Nonnegativity: the most negative intercept is `B_pc(1,7) = −689/16`, so `pb, pc ≥ 0` if and only if `m ≥ 689/200`.
- **Exact DP of the closed form at named rows.** I took the minimum over all splittings of `K` for Out and the maximum over all
  splittings of `K−1` for In, with no affine relaxation. At `m = 107, 110, 113`, `minOut = 1` and `maxIn = 1` exactly, nonnegativity
  and Switch hold, and `θ = 96/766193, 96/809675, 96/854357`.
- This is the gate's fresh-row test (ruling 2) done with an instrument independent of T1. The formulas pass at `m = 110` and `113`.

**(c) Literal laboratory on the actual tree** (`crit_lab.py`, at `m = 110` and `113`).
- I built `CB(8,m)` from adjacency lists: `17m + 2` edges, connected, so a tree.
- Relation: (D) ∪ (S) enumerated literally. Weight: active tags, with `F = leafSet`. `F` is **cited** from the favorability key at its
  grade and not derived here.
- Values are placed on sector-source arcs only; every other arc gets 0.
- Samples per row: 24 sector sources (random, plus structured samples that cover many states), 8 in-sector targets, and one switch
  image for each `γ = 1..7`. For the targets I summed over **all** literal preimages.
- Results: for every sampled source, literal outflow equals the per-state formula, and `min Out = 809724/809675 ≥ 1` at `m = 110`. For
  every sampled target, literal inflow equals the formula, and `max In = 809663/809675 ≤ 1`.
- Each switch image has weight exactly `γ` and exactly `8 − γ` sector preimages. Its total load, sector plus `ρ_1γ`, divided by `γ`
  is at most `0.99587 < 1`. The results at `m = 113` are the same in kind.
- This is **sampled evidence** of the per-state reduction, not a proof of it. The reduction belongs to U2 under ruling 4.

**(d) `ρ_1`.** A brute-force convolution of `(1+y)^7(1+2y)^{8m−7}` reproduces the §5 fixed point
`ρ_1(95) = 1354839571516225/1361543988640524`. It also reproduces T1's `ρ_1` at `107, 110, 113`, and the r30 margin `34.90` at `107`.

## Attacks and findings

1. **The load-bearing proof of Out, In, Switch and nonnegativity is correct.** I checked it symbolically, not by sampling, on every
   state from a table I recovered independently.
   - It does not depend on the allocation being optimal for the LP. It needs only that the allocation is *defined* by the displayed
     formulas.
   - The `m`-linear terms cancel exactly, so no `M_0` is needed inside the class.
   - T1's own script skipped `n = 0` for Out and `n = 8` for In. Both hold, with slack `7/2` and `4`.
   - The attack brief's concern about σ(7) is harmless. `c_7 = 7/2` is exactly what makes Out tight at `(1,7)`, and Switch at `γ = 7`
     has slack. With the same intercepts, a smaller `σ(7)` would break Out at `(1,7)`.
2. **FINDING: the allocation was not shipped.** The return says the intercepts `B_pb` and `B_pc` are "listed in
   `t1_generator_output.json`". They are not. The digested JSON has no per-cell data. It has only aggregate forms, the `c_γ`, `θ` by
   row, pass/fail booleans and `ρ_1` values.
   - As shipped, T1's universal proof is about a table that exists only in memory while the LP runs, so the face cannot be checked
     without re-solving.
   - I repaired this: the table is recovered from frozen r30 data, cross-matched with T1's LP output cell by cell, and published in
     `crit_alloc_out.json`.
3. **FINDING: the Residual step, which the return leaves open, is closed. This is a critic-derived advance, attributed to C-T1-U.** It
   is proved without Darroch, without Newton and without asymptotics, for every real `m ≥ 107`, and so for the whole class.
   - **Setup.** `c_k = Σ_{i=0}^{7} C(7,i)·t_{k−i}` with `t_j = 2^j·C(N,j)` and `N = 8m − 7`. Also `K = (16m+1)/3`,
     `j0 = K − 8 = (16m−23)/3` (an integer on the class) and `M = N − j0 = (8m+2)/3`.
   - **Clearing denominators.** `Q·t_{j0+s}/t_{j0} = τ_s := 2^s·Π_{u=1}^{s}(M−u+1)·Π_{u=s+1}^{8}(j0+u)`, where
     `Q = Π_{u=1}^{8}(j0+u) > 0`. This is valid because `N ≥ j0 + 8` for `m ≥ 3`. Each `τ_s` is a polynomial in `m` of degree 8.
   - **Reduction.** Let `A_K = Σ_i C(7,i)·τ_{8−i}`, `A_{K−1} = Σ_i C(7,i)·τ_{7−i} > 0` and `P2 = 200m² + 82m + 5`. Then
     `θ ≤ 1 − ρ_1` is equivalent to
     `G(m) := (P2 − 288)·A_{K−1} − P2·A_K ≥ 0`.
   - **Positivity.** `G` has degree 9 and leading coefficient `17179869184000/2187`. **Every coefficient of `G(107 + t)` is strictly
     positive** (the smallest is about `7.86·10^9` and the constant term about `1.37·10^28`). So `G > 0` on `[107, ∞)`.
   - **Tie-in.** `A_K/A_{K−1}` equals the brute-force `ρ_1` exactly at `m = 95, 107, 110, 113`.
   - **A crude bound, the one the attack brief asked for.** The same coefficient test on `m·(A_{K−1} − A_K) − (2/5)·A_{K−1}` proves
     **`1 − ρ_1(m) ≥ 2/(5m)` for every real `m ≥ 107`.** Since `θ ≤ 2/(5m)` whenever `400m² + 164m + 10 ≥ 1440m`, which holds for
     `m ≥ 4`, this is a second, one-line closure.
   - Asymptotically, `m·(1 − ρ_1) → 15/32`, the brief's "≈ 0.47/m".
   - Corollary within the class: `ρ_1 < 1`. That is E1 condition (i) at `q = 1`, strict, at `p*`, now shown without Darroch. I state
     this at `q = 1` only and claim nothing for the other `q`.
   - The return said a polynomial route would need "degree ≈ 50+" and root isolation. Normalizing at `t_{K−8}` gives degree 9 and no
     root isolation.
4. **The T1 bracket `[2(8m−19)/(16m+1), (4m+1)/(4m−5)]` is correct but idle.** I re-derived it: `f_i − 1 = (3i − 13)/(K − i)` is
   increasing in `i` because `3K − 13 > 0`. It is not needed once finding 3 holds.
5. **Reduction and fence.** The return rests on the template-to-network reduction (ruling 4). My structural reading of the literal arcs,
   confirmed on samples in (c), is as follows.
   - The sector-source arcs are: deletions of `r` and `v` (weight-0 targets); leg deletions (in-sector targets, one choke state
     changes); the `u_i`-insertion at state `(1,γ)` (the sector switch); the `u_i`-insertion at state `(1,0)` (a weight-0 target); and
     the **`s`-insertion** (`|N(s) ∩ B| = |{r,v}| = 2`), a switch arc to a weight-0 target. The return never names the last one.
   - In-sector targets also have literal **switch preimages** that are *non-sector* sources: `r`-insertion into sources with exactly
     two chokes. Those arcs carry 0 in the composition, because E1 uses deletions only and the template covers sector sources only.
   - None of this changes a number. A complete written reduction must still list these classes, and they belong to U2's lemma.
6. **Scope overreach.** The phrases "for every `m ≥ 4`" and "for every `m`" make statements outside the class (ruling 5) and are struck.
   The statement is kept at `m ≥ 107`, `m ≡ 2 (mod 3)`, rank `p*` only.
7. **Overclaim in the Remaining obligation.** "Everything else needed for (L-S)_top is now closed unconditionally" is struck. (L-S)_top
   as the contract defines it requires the allocation to be proved against the literal network or a proved quotient. That needs U2's
   reduction, the E1 key (`proved_informal` modulo Darroch on the `r_q`) for the `ρ_1γ` load, and the favorability key for
   `F = leafSet`, which sets the sector weight to 1 and the switch-image weight to `γ`.
8. **No fidelity assertion.** T1's instruments are template-level. They never build the tree, never assert
   `supply − capacity = S(T, p*)`, never derive `F_{p*}`, and never compute `x`. That is legitimate for this route, but every T1
   number is a template number, not a network number. My own instruments make no aggregate or network-count claim either. No
   fidelity failure is present, so nothing is struck on fidelity grounds.
9. **No cut and no template failure.** The template is feasible at every tested row and, by (b) together with finding 3, on the whole
   class.

## Mechanism-equivalence and fence check

- **Mechanism.** The route uses the r30 choke-local sector template (switch arcs carry the deficit, and E1 serves non-sector sources).
  It is not a refuted mechanism.
  - It is not the "`m`-independent per-choke certificate": the allocation scales as `1/m`.
  - It is not the all-families compression lemma, not forest real-rootedness, and not CHAR at `m = 1`.
- **Darroch/Newton hygiene.** Neither T1 nor I apply either tool anywhere. The Residual proof is exact polynomial algebra, and T1's
  bracket uses a weighted average of ratios.
- **The `θ*` law** stays a conjecture about the LP optimum. The proof uses `θ(m) := 288/P2` as a *chosen* parameter, not as an optimum
  and not as a hypothesis. T1's LP optimality at `110, 113, 116` was not re-derived by me and is not needed.
- **One rank per tree, class only.** Enforced; see findings 6 and 7.
- **Census discipline.** The eight-row agreement is test evidence only. The universal statements rest on (b) and finding 3.
- **No status transfer.** (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` and the primary aggregate stay OPEN.
- **Attribution.** The template, E1, favorability and the `θ*` conjecture are r30's. The closed forms and the proof of Out, In, Switch
  and nonnegativity are T1's (r31). Recovering the table from frozen r30 data, the m-free reduction derived from `D`, and the
  Residual proof are C-T1-U's (r31, Cycle 1, Stage 4).

## Certification audit

| Literal in the return | Evidence shipped | Ruling |
|---|---|---|
| Intercepts "listed in `t1_generator_output.json`" | Absent from the JSON | **STRUCK**. Table now shipped by the critic (`crit_alloc_out.json`) |
| Five tables reproduced "identical … spot-checked cell-by-cell" | Spot check only, nothing digested | Narrowed to a spot check by T1. Backed for all cells at `95, 98` and by exact fits at `101, 104` by the critic |
| Aggregates checked at `m = 5,000,003` | Generator rows are `[107, 1000001, 12345683]` only | `5,000,003` **STRUCK** |
| "`m·a2 + λ2(K−1) = 1` exactly" | Generator tests `≤ 1` only | Not backed by T1's artifact. True: proved symbolically by the critic |
| Out/In/Switch/nonneg "for every `m ≥ 107`" `proved_informal` | Reduction script and replay | **Retained** (checked independently on all 45 states) |
| "for every `m ≥ 4`", "no asymptotic regime" | Arithmetic | Out of class, **STRUCK** (ruling 5) |
| `ρ_1` closed form and bracket "**proved**" | `t1_rho1.py` | `proved` is not a contract grade. Regraded to `proved_informal` (elementary) |
| Route verdict "`proved_conditional`" | — | Not a contract grade. It would be `conditional`, and is superseded by finding 3 |
| "Everything else … closed unconditionally" | — | **STRUCK** (finding 7) |
| Residual `bounded_computation` at 8 rows | Replayed exactly | Retained as stated. Superseded by the critic's universal proof |
| Digest `ecb572f5…` | Replayed | **Confirmed** |
| Fresh rows `110, 113` "certified `ok=True`" | T1's own DP, same seat | Retained. Now also checked by a verifier from a different author (critic DP plus literal lab) |

`## Remaining obligation` in the return is **not exact**: item 1 is closed by finding 3, and the "unconditional" framing is wrong.
The exact obligation is stated below.

## Verdict

The return's core mathematical claim holds. The closed-form allocation satisfies Out, In, Switch and nonnegativity on the class, and I
proved this independently from the frozen r30 tables on every state. It does not depend on the LP being optimal.

The return is narrowed for these reasons:
- the allocation table was not shipped (now repaired);
- several certification literals are unbacked;
- it uses grade words outside the contract vocabulary;
- it makes out-of-class statements;
- it overclaims "unconditional" closure;
- its key name overstates the scope.

I closed the step the return leaves open, Residual (`θ(m) ≤ 1 − ρ_1(m)` for every real `m ≥ 107`), by an exact degree-9 polynomial
positivity argument. The crude bound `1 − ρ_1 ≥ 2/(5m)` gives the same result.

I believe the mathematics of (L-S)_top at the level of the **template** is now complete on the class. That is T1's closed forms
together with the critic's Residual proof, at grade `proved_informal`. It is STATED at a review stage and needs an isolated second read
before registration.

As a **literal-network** statement, it remains conditional on three inputs:
- U2's reduction (ruling 4);
- the E1 key, `proved_informal` modulo Darroch on the `r_q`;
- the favorability key, `proved_informal` modulo Darroch/Newton.

(ELIG-top)(a) is untouched.

verdict: retained_narrowed
headline_resolved: no

`LS_top: advanced`
`ELIG_top: not_advanced`
`cut_candidate: none`

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

1. **Second read.** An isolated second read of the Residual proof: `G(m) = (P2−288)A_{K−1} − P2·A_K`, with every coefficient of
   `G(107+t)` positive. The same read should cover T1's m-free reduction of Out, In and Switch on the intercept table in
   `crit_alloc_out.json`. Both are STATED at `proved_informal` and are not registrable until that read.
2. **Composition to the literal network.** U2's reduction must be written on the face (ruling 4). It must list every arc class out of
   sector sources, including the `s`-insertion and the `(1,0)`-insertion to weight-0 targets. It must list every literal preimage
   class of in-sector targets and switch images, including the non-sector two-choke `r`-insertion preimages, which carry 0. It must
   also treat shared capacity: the `ρ_1γ` E1 load on switch images, and zero load on in-sector targets. Only then does template
   feasibility become (HALL-COND) at `p*`.
3. **Carried inputs, cited at grade and never upgraded.** The E1 criterion and its condition (i) at `p*` for every `q ∈ [1, m]`
   (`proved_informal` modulo Darroch on the `r_q`). The critic shows `q = 1` without Darroch, as a corollary of finding 3, and nothing
   more. Also the favorability key giving `F_{p*} = leafSet` (`proved_informal` modulo Darroch/Newton).
4. **Registration hygiene.** Rename T1's candidate to a predicate on the exact scope (see the seal audit). If the synthesis takes the
   critic-derived Residual lemma, register it under its own predicate, for example
   `E993-R31-CB-8-TOP-RANK-E1-RESIDUAL-CAPACITY-EXCEEDS-288-OVER-200M2-PLUS-82M-PLUS-5-ON-THE-RESIDUE-2-CLASS-FROM-107`,
   attributed to C-T1-U.
5. **(ELIG-top)(a)** for every `m` in the class. Untouched by this route; it is T3's and U3's.

## Artifact inventory

All of these are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-T1-U/`.
Every run was in the foreground, and no background job was started.

**Own instruments (`own/`)**

| File | SHA-256 |
|---|---|
| `crit_alloc.py` | `e05541315cfbf25c20262b1111d12533df57fca58f076c72fc0e4cd62c596087` |
| `crit_alloc_out.json` (canonical, sort_keys, compact; intercept table, slacks, DP at `107, 110, 113`) | `da76863dd0d9dcc27c83271f6648e0f1396fcf964b7b923b1a7493f1c26f8f1d` |
| `crit_residual.py` | `d660e3e2dbad39c151cf65ee28a438bddbf569f3e78863f09e110a4657dfb761` |
| `crit_residual_out.json` (`G` coefficients, shifted coefficients, row tie-ins) | `d978c07bfeb63643c65d7d3c163f9a2de3e4caa522b71b47846abf57148d37dc` |
| `crit_crude.py` (`c ∈ {2/5, 3/8, 1/3, 1/4}` all pass) | `7206c8ad72c8fb3be4fd6881561a8f6ce4de04fa559cadaf3331bfd98c74975e` |
| `crit_lab.py` | `da0d24a27db401c437bdbc0f9dac9fd13169c791adecb70d2406c714c71cdb4d` |
| `crit_lab_110.json` | `067a5e2d7d1f0bc18ae3c3c2ed230237354c0ca856870f4a599b464640bd1e11` |
| `crit_lab_113.json` | `1ee2199e027a8af093c679f756841a93354e659a75cffda1fd15632a673b00b6` |

Commands, each run with `cd own/` first:
- `python3 -B crit_alloc.py 107 110 113`
- `python3 -B crit_residual.py`
- `python3 -B crit_crude.py`
- `python3 -B crit_lab.py 110` and `python3 -B crit_lab.py 113`

**Byte copies of T1's scratch (`t1copy/`)**

| File | SHA-256 |
|---|---|
| `t1_generator_output.json` | `ecb572f5…21603a` |
| `t1_generator.py` | `bf7ff5a3ef983a34ee108b895b310a2cfb1d87f14e1d9ccf2460009aa9443b28` |
| `t1_closed_form_proof.py` | `dc2e5716fd59a59f20593be23ded89d252116b8c7f942c251f2afdcc5e3c0cfa` |
| `t1_rho1.py` | `ff5707e3e8055626350a272b350bf51a6a72c3069425113471fe1559ea9b323b` |
| `t1_simplex.py` | `9e1b51e2e1ed043f6dfbcbf2898d885a1e4fe35ba26ce8683848d89274aa1946` |
| `t1_template.py` | `c5172ae871a84bd25c2e122dc2d6982566665b69083f492326336f6b3c4c6b3f` |
| `t1_verify.py` | `a1414022956b42d167139336d044aa596c3321038bda3f600d4359332f7cc903` |

**Replay (`replay/`)**
- Copies of T1's modules. Only the `sys.path` line differs.
- `t1_generator_output.json` reproduced as `ecb572f544ef65cf903c610a941fc756d6bd71c6f7de4fa850b9b7829521603a`.
- `cmp_intercepts.py` (`8b18d06a52a359c63e27f0e8d37931d65e1434cd1a66632599c7f9ea13e39269`): 316 cells, 0 differences.
