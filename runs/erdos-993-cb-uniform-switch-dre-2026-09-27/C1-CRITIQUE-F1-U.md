# Critique

**Critic:** `C-F1-U` (orientation U, formal / structural), Cycle 1, r31. **Assigned return:** seat `F1`, route
`C1-F-01 LITERAL-NETWORK-FIDELITY-AND-SHARED-CAPACITY-AT-FRESH-ROWS` (orientation F).

**Boot:** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I then read the dispatch
`control/dispatch/c1-stage4/DISPATCH-C-F1-U.md`, whose SHA-256 I recomputed and matched before anything else
(`a4bb0ad9d5a731851c593a58c0f488f839faa78e041a73c71fba1b080e933f96`). After that I read the 14 capsule members, the r30 semantic
contract under `sources/` (the definition of `S` and (WID) that governs this run) and the return's inventoried scratch.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Read-boundary disclosures (complete list):**
1. The harness put the project `CLAUDE.md` and the user's auto-memory index into my context at session start. I did not fetch them,
   and nothing in them was used.
2. I listed two directories, without recursion: `scratchpad/c1-F1/` and `scratchpad/c1-F1-replay/`. Both are the return's
   inventoried artifact directories. The listing showed their files and the two directories' own entries, and no sibling names.
3. Three of my own jobs ran in the background: two long audits and one waiter. The harness writes each job's stdout to a file under
   `/private/tmp/claude-501/…/tasks/`, and I read two of those files. Each held only my own job's output: one was empty, and the
   other held the exit line.
4. I ran one `grep -n` over `*.py` in my own copy-out directory `scratchpad/c1-crit-F1-U/replay/`, which is inside my grant.
   I ran no other search tool on purpose.
5. **INCIDENT (inadvertent search above the grant).** During the final heading check, a stray `grep -c "^verdict: " $OLDPWD`
   expanded to files at the run-root top level. The shell printed per-file match counts, all `0`, for five of them:
   `AUTHORIZATION.md`, `OBLIGATIONS.csv`, `SOLUTION-CONTRACT.md`, `SEMANTIC-CONTRACT.md` and `RUN-STATE.live.json`. It displayed no
   file contents. Only file names and zero counts were seen. Nothing from it was used, and the critique was already complete when
   it happened.

Nothing was read from a sibling return, a critique, an adjudication, another experiment root or the network. No package was
installed. No Lean was invoked, because this seat has no Lean.

## Identity and seal audit

- **Capsule** `control/c1-critic-capsules/F1-PACKET-MANIFEST.json`. The inner seal, recomputed as compact key-sorted JSON without
  `seal_sha256` and with no trailing newline, is `20d4a1f0d0c1208b7e4cd380a705b575055ecd6599c12eaa8471a0d9e9a33016`. It matches.
  All 14 listed files match in both byte count and SHA-256.
- **Stage 4 dispatch manifest** seal `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b`: matches.
  **Stage 3 packet manifest** seal `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37`: matches.
  **Stage 2 packet manifest** seal `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`: matches.
- **Return** `cycles/cycle-1/stage3/returns/F1/RETURN.md`: SHA-256 `628a9d97…0c490a`, 30,826 bytes, matching the capsule.
- **Digests the return lists.** I replayed each one copy-out-first in `scratchpad/c1-crit-F1-U/replay/`, and every one reproduced
  byte-identically:
  - `row_check_out.json` = `062addaf…9be82a`
  - `shared_capacity_out.json` = `4f9da57a…a7995`
  - `literal_lab_out.json` = `885a5e87…0f90142`
  - `crit_extend_b.json` = `a22aa73b…90cdaa`, which also equals the `sources/SOURCE-DIGESTS.json` entry
  - `DISPATCH-F1.md` = `0315ada9…4a4987`, which equals the Stage 3 manifest entry

  `compare_control_row.py` replayed to "FULL EXACT REPRODUCTION … True". `dp_certify.py` replayed as `certified=True` at all three
  rows. That run saves no output file, so the return ships no digest and no table for the 110/113 certificates; see finding A6.
- **Route identity.** Route ID `C1-F-01` and mechanism token `LITERAL-NETWORK-FIDELITY-AND-SHARED-CAPACITY-AT-FRESH-ROWS` both
  appear verbatim. The return's disclosures agree with `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` item for item.

## Independent re-derivation

Every item below is my own stdlib-only instrument. The return's scripts are used only as replays.

1. **Literal rows (`crit_graph.py`, `crit_row.py`).**
   - I built CB(8,m) under my own labelling (`v=0, s=1, r=2`, chokes in blocks) and tested it as a tree by edge count plus
     connectivity. A generic forest DP gives `i_k(T − D)` on the original carrier for any deletion set `D`.
   - `x` is computed through `α` with the zero-extended terminal difference.
   - (WID) is asserted from **genuinely independent sides**:
     - **Weight side:** `supply(j) = Σ_{ℓ∈F} #{B ∈ I_j : ℓ ∈ B, B ∩ W_ℓ ≠ ∅}`. Since `|W_ℓ| = 1` (checked literally), this equals
       `Σ_ℓ i_{j−2}(T − N[ℓ] − N[w_ℓ])`, a count on a DIFFERENT deletion set from the aggregate's.
     - **Aggregate side (of record):** `S = Σ_{ℓ∈F} (Δ_{p−1}(T − H_ℓ) − Δ_{p−1}(T − R_ℓ))`, as in `C5LA1.aggregate`.
   - The instrument asserts `supply(p+1) − supply(p) = S`.
   - **Brute-force validation (`crit_small_bf.py`).** I enumerated every independent set, with literal `w_F`, `W_ℓ = N(s_ℓ)∖{ℓ}`
     and `F` derived at each rank. This covered CB(2,3), CB(3,2), CB(8,1), CB(4,2) and CB(2,4), up to 98,805 sets each.
     - (WID) held at every rank.
     - My formula instrument agreed with the brute force at all 24 (tree, rank) cases where every leaf is favorable.
     - `ALL_OK True`.
   - **Results at the four rows.**

     | m | p* | n | α | x | p* − x | eligible | |F| | S |
     |---|---|---|---|---|---|---|---|---|
     | 95 | 508 | 1618 | 856 | 506 | 2 | yes | 761 = 8m+1 | < 0, 363 digits |
     | 107 | 572 | 1822 | 964 | 570 | 2 | yes | 857 | < 0, 409 digits |
     | 110 | 588 | 1873 | 991 | 586 | 2 | yes | 881 | < 0, 420 digits |
     | 113 | 604 | 1924 | 1018 | 602 | 2 | yes | 905 | < 0, 432 digits |

     - The parent descent `i_{p*−1} < i_{p*−2}` holds and `Δ_{x−1} > 0` at each row.
     - At `m = 110` and `m = 113` I derived `F_{p*}` **for every leaf, one at a time** (881 and 905 separate `Δ_{p*}(T − ℓ)`
       computations), with no symmetry reduction. Every leaf is favorable.
     - The all-leaves totals equal my symmetry-reduced totals. They also equal the return's `S`, supply, capacity, `x`, `α` and `n`
       exactly, integer for integer, at all four rows.
2. **Template verifier (`crit_template.py`).**
   - It checks nonnegativity. It checks Out ≥ 1 by taking each choke's minimum Out over states with the same leg count, then an
     `m`-fold min-plus convolution by binary powering to leg total `K = p* − 1`. In ≤ 1 is the same with max-plus to `K − 1`.
     It also checks Switch and Residual.
   - `ρ_q = r_q(p−q)/r_q(p−q−1)` is computed with `math.comb` sums (Darroch-free). E1's condition (i) is checked at **every**
     `q ∈ [1, m]`.
   - I ran it on the return's LP primal (replayed) and on my own primal. Both pass at 107, 110 and 113: min Out = 1 and max In = 1,
     both exact, so both constraints are tight.
3. **Own exact LP with a dual certificate (`crit_lp.py`).**
   - I wrote my own formulation and my own two-phase Bland simplex in Fractions, then solved the dual separately.
   - Weak duality (`y ≥ 0`, `−Aᵀy ≤ c`, so `−b·y ≤ c·x` for every feasible `x`) certifies the optimum of the affine-separation LP of
     record at `θ* = 96/766193`, `96/809675`, `96/854357` for `m = 107, 110, 113`. My primal is entry-for-entry identical to the
     return's replayed primal.
   - **Critic-derived fresh row `m = 116` (p* = 620):**
     - `θ* = 96/900239 = 288/(200m² + 82m + 5)`, certified optimal by the dual. The DP gives min Out = 1 and max In = 1.
     - E1(i) holds at all 116 values of `q`.
     - `ρ_1 = 58633895019037705/58871393306616916`.
     - Residual holds with margin `(1 − ρ_1)/θ* ≈ 37.83`.
4. **Literal per-state reduction laboratory (`crit_lab.py`, d = 8).**
   - **Part A (exhaustive).** The cases are CB(8,1) at K = 1…8 (all 45 choke states occur), CB(8,2) at K = 1…5 (up to 139,776
     sources) and CB(8,3) at K = 1…3. Each case uses a random positive rational table, because the reduction must hold for every
     table. For every sector source I enumerated all of its literal (D) and (S) arcs and computed each target's literal weight. The
     checks:
     - Every sector member has weight 1.
     - Positive template flow lands only on in-sector targets (weight 1) or on one-choke `r`-free switch images of weight `γ`.
     - Literal outflow equals `Σ_i Out(state_i)`.
     - Literal inflow of **every** in-sector target, including every `(K−1)`-leg target, equals `Σ_i In(state_i)`.
     - Every switch image receives exactly `(8 − γ)σ(γ)`.
     - No weight-zero target receives flow.
   - **Part B (sampled on the actual trees, m = 107, 110, 113, with the certificate).**
     - Per row I built 211 sector sources literally: the DP's **argmin-Out profile** plus 210 random profiles. Every literal arc
       was enumerated.
     - Per row I built 211 in-sector targets: the DP's **argmax-In profile** plus 210 random. All of their literal deletion AND
       switch preimages were enumerated.
     - Per row I built 210 switch images, 30 for each `γ = 1…7`, with all literal preimages.
     - Results:
       - Literal outflow equals the formula on every source, and the literal minimum is exactly 1, the DP's minimum.
       - Literal inflow equals the formula on every target, and the literal maximum is exactly 1, the DP's maximum.
       - Each image has exactly `8 − γ` sector preimages, each in state `(1, γ)`.
       - Every image satisfies `(8 − γ)σ(γ) + ρ_1γ ≤ γ`.
     - `ALL_OK True`.
5. **Structural reduction, written out.** This re-derives U2's object and is STATED, not a registration. Let `B = {r, v} ∪ L` be a
   sector source.
   - **Arcs out of B:**
     - Deleting `r` or `v` gives a weight-0 target.
     - Deleting a leg vertex at choke `i` gives the in-sector target with that choke in state `(β−1, γ)` or `(β, γ−1)`.
     - The only `u ∉ B` with `|N(u) ∩ B| = 2` are:
       - `s`, since `N(s) = {r, v}`, which gives a weight-0 image;
       - `u_i` with `β_i = 1`, which gives the image with weight `γ_i`, or 0 when `γ_i = 0`.
     - A support has at most one neighbour in `B`, since `u_i ∉ B`, and a leaf has one neighbour.
   - **In-sector target A:** its deletion preimages are exactly `A + b` or `A + c` at one of the `8 − n_i` empty legs of each choke.
     Every deletion preimage of an in-sector target contains `r` and `v`, so it is a sector member. Its switch preimages carry 0,
     because E1 is deletion-only and sector switches land `r`-free.
   - **Switch image A ∋ u_i:** it has no sector deletion preimage, since `r ~ u_i`. Its sector switch preimages are exactly
     `A − u_i + {r, b_ij}` over the `8 − γ` `c`-free legs, and every one of them is in state `(1, γ)`.
   - These are the template's Out, In and switch-load formulas. Part A checks them exhaustively and Part B by sampling.
6. **A necessary global bound (critic-derived).**
   - This holds for ANY sector allocation on the literal arcs, template or not, composed with E1 at the fixed load `ρ_1γ`. The switch
     images must absorb at least `R_K − R_{K−1} = R_{K−1}/(p* − 1)` in total. Their total residual capacity is `(1 − ρ_1)·W_img`,
     where `W_img = Σ_{γ=1}^{7} m·C(8,γ)·γ·2^{K−1−γ}·C(8m−8, K−1−γ)`.
   - Hence `θ ≥ θ_LB := (R_K − R_{K−1})/W_img`. Exact values:

     | m | θ_LB | θ*/θ_LB | (1 − ρ_1)/θ_LB |
     |---|---|---|---|
     | 107 | `36132547728/342577655754191` | ≈ 1.18794 | ≈ 41.46 |
     | 110 | `67298524400/674298099790357` | ≈ 1.18797 | ≈ 42.62 |
     | 113 | `154375517648/1632172880908899` | ≈ 1.18801 | ≈ 43.78 |
     | 116 | `1749430054320/19490132168548241` | ≈ 1.18804 | ≈ 44.94 |

   - So global switch-capacity accounting leaves no room for a deficient cut at these rows. The template gives up only about 19%
     against the necessary bound. This is `bounded_computation`, four named rows, and not a proof for all `m`.

## Attacks and findings

- **A1. The return's (WID) "from independent sides" is a tautology. Fidelity literal struck; the fact itself is independently
  confirmed.**
  - In `row_check.py`, `supply := n_v·qv_p + n_c·qc_p` and `capacity := n_v·qv_pm1 + n_c·qc_pm1`. It then asserts
    `supply − capacity == n_v(qv_p − qv_pm1) + n_c(qc_p − qc_pm1)`. That is distributivity and cannot fail.
  - The WEIGHT side, `Σ_B w_F(B)`, is never computed at the target rows. The `q`'s are cross-checked by two instruments (literal
    H/R DP vs closed forms), and that part is sound. But the protocol's "(WID) from independent sides" was not done.
  - The literal weight side appears only in the small laboratory, and only as "every sector member has weight 1".
  - I discharged it with a distinct weight-side count plus brute force (Re-derivation 1). All four rows agree exactly. No
    downstream number is struck, because the fidelity fact holds. The return's claim to have asserted it is struck.
- **A2. `F_{p*}` "derived" rests on 1 `v` and 3 `c` representatives plus symmetry.** The symmetry is legitimate, because `Aut`
  acts transitively on the `c`'s. Still, I derived all 881 and all 905 leaves literally at the fresh rows: all favorable, totals
  unchanged. Retained.
- **A3. The per-state reduction was not tested by the return's laboratory.**
  - Part 1 uses d ∈ {2, 3}, never d = 8.
  - Its rank is degenerate. `K = dm − 1` in all four cases (`K = 5, 7, 5, 8` for CB(2,3), CB(2,4), CB(3,2), CB(3,3)), so every
    choke is full except one. Only a sliver of the state space appears.
  - It computes no flow values: it never compares literal outflow or inflow with the Out/In formulas. It checks the
    zero-weight-on-`r`/`v`-deletion property only on the first 200 sources.
  - Part 2 is ONE hand-built configuration per row, with one deletion and one switch.
  - The heading "Sampled literal laboratory … confirming the per-state reduction" is therefore **narrowed** to "spot-checks of
    weights and switch mechanics". The return's own remaining obligation 3 concedes this.
  - My d = 8 laboratory, including the DP-extremal profiles on the actual trees, and the written reduction (Re-derivation 4–5)
    close the gap at instance level. The universal lemma is still U2's, pending its read.
- **A4. Target classes: one class unnamed, one condition unverified.** Both are now closed at bounded grade.
  - The return never names the dispatch's class "`r`-free one-choke targets not reached by a sector switch". Examples are
    `s ∈ A`, `v ∉ A`, `γ = 0` and `γ = 8`. That class receives only E1's `ρ_1·w ≤ w`.
  - The ≥2-choke class needs `ρ_q ≤ 1` at every `q`. The return checked only `q = 1` and says so.
  - My check (Re-derivation 2) confirms E1(i) at every `q` at `m = 107, 110, 113, 116`, and that `ρ_1` is the maximum.
    `max_{q≥2} ρ_q ≈ 0.99388, 0.99405, 0.99421, 0.99436`.
  - The weight-zero and in-sector classes are right as argued; both are confirmed exhaustively in my Part A.
  - The return's shared-capacity table is correct. `σ(γ) = θγ/(8−γ)` for γ ≤ 6 and `σ(7) = 7θ/2` (slack), so each switch-image
    load is `≤ θγ + ρ_1γ < γ`.
  - These closures are bounded at named rows. For every `m`, E1(i) remains the registered `proved_informal` key, modulo Darroch.
- **A5. A wrong literal.** "`S(T,p*)` is negative at every row (365–434 decimal digits)" is incorrect. 365–434 is the digit range of
  **supply**. `S` has 363, 409, 420 and 432 digits. Corrected.
- **A6. "Exactly feasible" at 110/113 rests on an unsaved run.** The return ships no certificate table and no output digest for
  the fresh-row LP/DP. It is backed now: I replayed the run (`certified=True` ×3) and my independent LP plus DP reproduce it exactly.
  I saved the tables (`F1_replayed_certs.json`, `crit_lp_out_107_110_113_116.json`). A registration should cite a shipped table.
- **A7. A confused gloss on `p* − x`.** The observation `p* − x = 2` at all four rows is correct; my instrument agrees. The
  explanation "`256m/20451` (≈1.3 at m=107…) too small yet to move the integer floor past 2" is incoherent: a quantity ≈ 1.3 cannot
  floor to 2, and the contract's growth law is an asymptotic slope, not a value. The sentence is struck; the observation stays.
  This is F3/T3 territory.
- **A8. Checked and clean.**
  - ℕ-subtraction: no underflow is possible at the tested rows. Python ints are exact.
  - No Newton or Darroch appears anywhere.
  - No asymptotic step is claimed, so no `M_0` is owed.
  - No cut is claimed, and no template failure.
  - The fresh-row test was done before any universal claim, per gate ruling 2. The return makes no universal claim.

## Mechanism-equivalence and fence check

- **One rank per tree, class only.** Every row is `(CB(8,m), p*)` with `m ≡ 2 (mod 3)` and `m ≥ 107`. `m = 95` appears only as a
  fixed-point reproduction and is correctly not claimed. Clean.
- **No refuted mechanism is revived.** `E993-TREE-REAL-ROOTED` (REFUTED) is untouched, and no `m`-independent per-choke
  certificate is claimed.
- **No status transfer.** (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` and the primary aggregate stay OPEN, and the return
  says so.
- **Census and law discipline.** The `θ*` law is reproduced at the rows, never used as a hypothesis, and kept at `conjecture`.
  My dual certificates make "θ* equals the law at 110, 113 (and 116)" a fact about the LP of record at those rows only. That
  confirms no optimality or necessity for arbitrary flows. The r30 bounded record is not used as proof.
- **Template ≠ network.** The candidate key is correctly limited to TEMPLATE feasibility plus switch-image shared capacity. The
  literal-network reduction is cited to U2 per ruling 4.
- **Candidate key** `E993-R31-CB-8-M-110-AND-113-CHOKE-LOCAL-SECTOR-CERTIFICATE-EXACT-FEASIBILITY-AT-RANK-16M-PLUS-4-OVER-3`.
  - The name is a predicate.
  - My lexical alias check, done by reading the return's statement against the §4 key list of `SEMANTIC-CONTRACT.md`, finds no
    collision.
  - Mathematically it is disjoint from the r30 row key `…M-95-TO-107…`, which is full weighted Hall at five other rows. It is
    narrower and does not duplicate that key.
  - Grade `computer_assisted` is correct.
  - I recommend the statement cite shipped certificate tables (A6). If the synthesis wants the critic's row, `m = 116` can be added
    under the same predicate; I do not register it.
- **Attribution.** The return cites r30 for the template, `θ*` law, criterion and row keys, and Codex's lower-region run for the
  weight and relation. Clean.

## Certification audit

| Literal on the return's face | Backing | Ruling |
|---|---|---|
| "(WID) asserted from independent sides" | an algebraic identity, not two sides (A1) | **struck** as to the return's instrument; the fact is confirmed by the critic |
| `F_{p*}` "DERIVED", all leaves favorable, `|F| = 8m+1` | 4 representatives plus symmetry; critic all-leaves at 110/113 | retained |
| `x`, `α`, `n`, eligibility, `p* − x = 2` | replay plus independent instrument | retained |
| "S negative … (365–434 decimal digits)" | wrong range (A5) | **corrected** to 363–432 |
| `ρ_1` at 107/110/113 and the `m = 95` fixed point | replay plus `math.comb` instrument | retained |
| "exactly feasible", min_out = 1, max_in = 1 at 110/113 | unsaved run (A6); critic replay plus independent LP/DP | retained; tables now shipped by the critic |
| "θ* equal to 288/(200m²+82m+5) exactly" | own simplex only; critic dual certificates | retained as the LP-of-record optimum at the rows only |
| "all 36 pb, 36 pc, 7 σ, θ match the frozen m=107 table" | replayed True | retained |
| "(d−γ)σ(γ) + ρ_1γ ≤ γ strictly, 21 cases" | replayed; critic sampled literal images | retained |
| "literal laboratory … confirming the per-state reduction" | degenerate K, d ≠ 8, no flow values (A3) | **narrowed** to spot-checks |
| "exhaustively verified over 432–4608 images per case" | true, but only at `K = dm − 1` | narrowed (scope stated) |
| "p* − x … 256m/20451 … too small to move the integer floor past 2" | incoherent (A7) | **struck** |
| digests of `row_check_out`, `shared_capacity_out`, `literal_lab_out` | replayed byte-identical | retained |
| `LS_top: advanced` | the ruling-2 precondition met at two fresh rows; nothing universal | retained as a bounded summary only |
| route verdict `bounded_evidence` | consistent with evidence | retained |

## Verdict

The return's numbers are all right. I reproduced every one exactly with independent instruments, and then extended them: every leaf
literally at the fresh rows, a dual-certified LP optimum, E1(i) at every `q`, and a d = 8 literal reduction laboratory with extremal
profiles. A fresh row `m = 116` was added. No template failure, no deficient cut and no fidelity breach of the underlying objects
was found.

The return overstates two of its own evidence labels. Its (WID) check is a tautology (A1), and its laboratory does not test the
per-state reduction (A3). It also carries one wrong literal (A5) and one incoherent gloss (A7). These are narrowings, not rejections.

verdict: retained_narrowed
headline_resolved: no

`LS_top: advanced`
`ELIG_top: not_advanced`
`cut_candidate: none`

`LS_top` is a bounded summary only. The fresh-row precondition of gate ruling 2 is met at 110 and 113, and at 116 by the critic.
Nothing universal is established.

The mathematics the return actually claims is complete at `computer_assisted`: template feasibility and shared capacity at two
named rows. No statement here is `proved_informal`. The written reduction (Re-derivation 5) is STATED and awaits U2's lemma and an
isolated second read.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

Exactly what is still open after this return and this critique:

1. **(L-S)_top, universal.** Closed forms for `pb`, `pc`, `σ` and `θ(m)`, with a proof valid for every `m ≥ 107`, `m ≡ 2 (mod 3)`,
   of nonnegativity, Out ≥ 1 and In ≤ 1 over all splittings, Switch, and `θ(m) ≤ 1 − ρ_1(m)`. That last inequality needs an
   explicit lower bound on `1 − ρ_1` with explicit `M_0` and remainder. This belongs to T1 and T2, and is untouched here.
   - Useful targets the critic records:
     - Out and In are exactly tight (min = max = 1) at the LP optimum, so a proof of the LP-optimal template has no slack there.
     - The switch slack lies entirely in Residual, with margin ≈ 0.33m.
     - The necessary global bound `θ ≥ θ_LB` sits within a factor of about 1.188 of `θ*` at every tested row.
2. **The per-state reduction as a proved lemma.** This is U2's composition lemma plus an isolated second read. Re-derivation 5 is
   a STATED re-derivation, and the laboratory is instance evidence only.
3. **E1(i) at every `q` for every `m`.** It stands as the registered `proved_informal` key, modulo Darroch on the `r_q`. At
   `m = 107, 110, 113, 116` it is now a bounded exact check, not a proof.
4. **(ELIG-top)(a) for every `m`.** The rows show `p* − x = 2` exactly at 95, 107, 110 and 113. The universal parent descent
   belongs to T3, F3 and U3.
5. **Full (HALL) at the fresh rows.** It follows at `computer_assisted`, modulo the criterion key (`proved_informal`) and the
   reduction lemma (item 2), once item 2 is read. The candidate key rightly does not claim it. Any registration should cite shipped
   certificate tables (A6).

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-F1-U/`.
They use the Python standard library only (`fractions`, `math`, `itertools`, `json`, `hashlib`, `random` with fixed seeds, `sys`).
Replay with `cd` into that directory and then `python3 -B <script>`.

**Critic scripts:**

| File | SHA-256 | Purpose |
|---|---|---|
| `seals.py` | `d79d10b0d8aac0dc6e5a0cbcd43bbce7aa24df9525487db867e0519615dd3640` | seal and capsule audit |
| `crit_graph.py` | `28487e872a8a4b98f185c7e9f60877d28c2f124898dbb8fb5c7a223a86aa3233` | literal CB(d,m); generic forest DP |
| `crit_row.py` | `a4cd539a2455d0321d3a86e91a66924aea83ac4362c0a013b925b32c126551ae` | row audit; arguments `reps`, `all110`, `all113` |
| `crit_small_bf.py` | `f3fbeabce72fefa1d74e6e7f2cdbb0275a9fd7ba09ef7e4eddb83ed89dffc03d` | brute-force validation |
| `crit_template.py` | `785ca5193de3b42e5840147342067c9128913f49e71dd5517a1881fa0bac450b` | template verifier; argument is a certificate file plus rows; E1(i) all q; θ_LB |
| `crit_lp.py` | `aaee4208fb16ba2af8a91d3e20e99f9435badf53553cbf03f6a013538dcd700e` | own LP plus dual certificate; arguments are rows |
| `crit_lab.py` | `f66936d6b1e3c0b78f7a97363bf19d360cb43f229b6eb12d534a7dbc839c28a6` | literal reduction laboratory; argument is samples per class, and 210 was used |

**Outputs:**

| File | SHA-256 |
|---|---|
| `crit_row_out_reps.json` | `02290386ec1bbf036f96d6a27a3d62efa2bae44ce4aebd6e98ca7a3051a5219d` |
| `crit_row_out_all110.json` | `180b8eb0a23576360ba7917e0bc16d3d6a8ab11b51c1a7d317639a47917d300b` |
| `crit_row_out_all113.json` | `0bcc2161779f65a7a36febf53d21474f9d61f99df16da3c6210bfc4ae0988650` |
| `crit_lp_out_107_110_113_116.json` | `9de40cdb807251c41396f7235a202fd4857d5eeb79669a034286fbeed533a6cf` |
| `crit_template_out_crit_lp_out_107_110_113_116.json` | `2acb63bc4e79b704059d2b5d9ec607b93438f36c0b8b3c1fa23d574072f7e042` |
| `crit_template_out_F1_replayed_certs.json` | `bbed413f7859bdbd687e7629bb50aba207479734be95e024ff9f79d68138ae01` |
| `crit_lab_out.json` | `745873de2cd36fa6f78b799f07e247227e0b54d0c6f96acac43927f994bccc0d` |
| `F1_replayed_certs.json` (the return's LP primal, dumped from a replay) | `c66823399ff331dc031b7bbd62405fbc2379b91c8d763277d039697b9d1a981e` |
| `log_all110.txt` | `38882475418a220223eec1a76bfcd72d108eae93b853b12cfb771f63822ace84` |
| `log_all113.txt` | `2e95d46559d11f11a090b5411f31a5ee2a651dd87beb263fad16d42e5cf74882` |

**Replay directory `replay/`.** This is a byte copy of `scratchpad/c1-F1/` plus the `dump_cert.py` helper, with replay logs
`log_row_check.txt`, `log_e1.txt` and `log_dp.txt`. The return's sources were not modified.

**Background jobs.** Three were started: the two all-leaves audits and one waiter. All three exited with code 0 before this file was
written, and none is running. No kill was needed.
