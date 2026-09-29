# Orientation Adjudication

Stage 5 adjudicator, orientation **T (prove)**, Cycle 1 of r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`), 2026-09-27.
Portfolio: returns `T1` (`C1-T-01`, `LS-TOP-CLOSED-FORMS-FROM-EXACT-TABLES`), `T2` (`C1-T-02`, `LS-TOP-SLACK-ALLOCATION-WITH-EXPLICIT-ERROR-BOUNDS`),
`T3` (`C1-T-03`, `ELIG-TOP-BLOCK-MIXTURE-PARENT-DESCENT`) and their six cross-orientation critiques (`C-T1-F`, `C-T1-U`, `C-T2-F`, `C-T2-U`,
`C-T3-F`, `C-T3-U`).

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. My first combined print failed on a zsh `=====` separator, so I read the
startup protocol in a separate call, and I re-read the span of `verity.md` that the tool display had truncated. Subsystems loaded:
the constitution and the startup protocol only. The controller boots for the run and owns conversation logging and durable updates.
This seat writes only this file and scratch under `scratchpad/c1-adj-T/`.

## Identity and seal audit

- **Dispatch** `control/dispatch/c1-stage5/DISPATCH-ADJ-T.md`: SHA-256 `e20eaee9f3fefda82db12b71be15301c16b5758200a4e207edbcc8d92a92748d`, checked
  with `shasum -a 256` before any other action. **MATCH.**
- **Capsule** `control/c1-adjudicator-capsules/T-PACKET-MANIFEST.json`. Its inner seal, recomputed as SHA-256 of the canonical JSON
  without `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline), is
  **`1ed0f67ae96368d88b7efbbfaa26e7f2f496126ae4bc88c40afb622b75918b24`**. **MATCH.** All 24 listed files match their SHA-256 and byte
  counts, with 0 mismatches (`scratchpad/c1-adj-T/verify_capsule.py`).
- **Packet seals**, recomputed the same way (`verify_manifests.py`):
  - Stage 2: `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`, MATCH (1403 files).
  - Stage 3: `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37`, MATCH. It lists `T1`–`T3` `RETURN.md` at the digests I
    re-hashed.
  - Stage 4 packet: `40f2e21645552e9929b17b28f7be262613bdc0d0f7dbd212997f783083f25fec`, MATCH. It lists all six of my critiques at the
    digests I re-hashed.

  The critics cite the Stage 4 **dispatch** manifest seal `86453c5c…`. That file is not in my capsule, and I did not recompute it.
- **Admission.** Stage 3 admitted 9 of 9 returns. The exceptions it applied concern U2 and U3 only, none of my seats. Stage 4 admitted
  18 of 18 critiques. Every critique of my portfolio has verdict `retained_narrowed` and `headline_resolved: no`.
- **Scratch digests.** 27 artifacts listed on the faces match the files: T1's generator output, T2's flat-obstruction script, T3's
  generator and rows, and the critics' key instruments and certificates.
- **Frozen inputs.** `sources/r30/instruments/c6/C-T2-U/own/CERT-TABLES.json` and `…/C-T2-F/{crit_cert_tables,crit_extend_a,crit_extend_b}.json`
  match `sources/SOURCE-DIGESTS.json`.
- **Controller facts** `control/C1-STAGE5-CONTROLLER-FACTS-T.json` (CF-T-1..4): read as facts, never authority. I rely on none of
  them. CF-T-1, -2 and -3 report cross-orientation concordance, which I note but did not grade. CF-T-4 is a controller prior.
- **Path check** `PATH-CHECK-T.json`: 0 findings.
- **Read-boundary disclosures (this seat):**
  1. The harness injected the project `CLAUDE.md` and the user memory index into my context. I did not fetch them and did not use them.
  2. I ran one targeted `grep -rlI` for `darroch|newton…inequalit|LogConcave` inside the pinned Mathlib source tree
     `…/mathlib-v4.32.2-project/.lake/packages/mathlib/Mathlib`. Mathlib is readable under the protocol, and the search was rooted
     there. It found no hits.
  3. I ran non-recursive `ls` of two `sources/r30/instruments/c6/` subdirectories, of the six critic scratch directories of my
     portfolio, of `scratchpad/c1-T3/`, and of my own replay folders. All are within my grant.
  4. I read lines 20–66 of `scratchpad/c1-T3/block_mixture_check.py`, which is inventoried scratch.
  5. Two copied-out critic scripts (C-T1-F residual, C-T2-U instrument) wrote their output by absolute path into the critics'
     own scratch. I edited only **my copies** so that they write locally, and the critics' directories were not touched.

  I used no network, installed nothing, invoked no Lean, and started no background job.

## Route-by-route decisions

### T1 — `C1-T-01` — **retained_narrowed (core mathematics upheld; the Residual gap is closed by critics)**

- **Upheld: the load-bearing claim.** The closed-form per-state allocation satisfies nonnegativity, Out, In and Switch for every
  `m ≥ 107`, `m ≡ 2 (mod 3)`, with no `M_0`.
  - With `D(m) = (200m²+82m+5)/3`, each allocation cell is `pb(β,γ) = (25m/2 + B_pb(β,γ))/D` or `pc(β,γ) = (25m/2 + B_pc(β,γ))/D`. The
    remaining parameters are `σ(γ) = c_γ·96/D` with `c = (1/7, 1/3, 3/5, 1, 5/3, 3, 7/2)`, and `θ = 96/D = 288/(200m²+82m+5)`.
  - Multiplying by `D` cancels the `m`-linear terms exactly. What remains is one `m`-free rational inequality per state, plus the two
    aggregate polynomial identities `m·a + λK = 1` and `m·a2 + λ2(K−1) = 1`.
  - The affine bounds pass to every splitting: the per-state bounds sum to `m·a + λΣn_i` with `Σn_i = K` (or `K−1`), and this holds at
    `(0,0)` and at `n = 8`.
- **Adjudicator replay, an independent instrument** (`adj_alloc.py`):
  - I derived the 72 intercepts from the frozen `m = 95` row **alone**. They reproduce every `pb`/`pc` cell, `θ` and `σ/θ` at
    `m = 98, 101, 104, 107` exactly. This is an out-of-sample check that the slope `25/2` is common to every cell.
  - All 45 states hold. Out slack is at least 0, with 40 tight states. In slack is at least 0, with 36 tight states and slack 4 at
    `n = 8`. Switch has slack 0 for `γ = 1..6` and `7/2` at `γ = 7`. The most negative intercept is `B_pc(1,7) = −689/16`.
  - The aggregate identities hold as polynomial identities.
  - An exact min-plus/max-plus DP over **all** splittings, with no affine relaxation, gives `minOut = 1` and `maxIn = 1` at
    `m = 107, 110, 113`. Nonnegativity holds there, and `θ = 96/766193, 96/809675, 96/854357`.
  - The fresh-row gate (ruling 2) is satisfied by T1's own DP and by three instruments from other authors (C-T1-F, C-T1-U and mine).
- **Narrowed (certification):**
  - The intercept table is **not** in `t1_generator_output.json`. That literal is struck. The table is now shipped in `crit_alloc_out.json`
    (C-T1-U), in `crit_t1f_template_out.json` (C-T1-F) and in my `adj_alloc_out.json`.
  - The aggregate literal "`m = 5,000,003`, both equalities" is struck. The generator checked `[107, 1000001, 12345683]` with `≤`. The
    identities themselves hold symbolically.
  - "for every `m ≥ 4`" and "FOR-EVERY-M" are out of class and are struck (ruling 5).
  - "Everything else needed for (L-S)_top is closed unconditionally" is struck. The literal network still needs the composition.
  - The grade words "proved" and "proved_conditional" are renormalized to contract grades.
  - "degree roughly 50+" is wrong: the Residual polynomial has degree 9.
  - The `σ(7)` anomaly is explained: `c_7 = 7/2` is pinned from below by a tight Out at `(1,7)`.
- **T1's open step (Residual) is closed by the critics** (critic-attributed; see Established results R2).

### T2 — `C1-T-02` — **retained_narrowed; route verdict `blocked` is accurate**

- **Mathematics upheld.**
  - §6.1 (flat rate): no constant `p` satisfies Out and In, and the switch cannot rescue it, because an all-`c` source has no `(1,γ)`
    state. `2(8m−K+1) = p*` is exact. C-T2-U completes the argument for every `p`, not only `p = 1/p*`.
  - §6.2 (Jensen with `B ≥ 0`): the algebra is correct (`C2 = −1/(2m)`, `C1 > 0`).
- **Novelty narrowed.** Both critics make this point and I agree. The switch-free content of both families is implied by the registered
  `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`, because `R_K > R_{K−1}` kills every deletion-only allocation. Proposal 2 (the Jensen
  certificate) is **not registrable**. Proposal 1's only new residue is the "with switch" clause, which the critics' theorems absorb.
- **Struck literals:**
  - "`B = −1/(100K)` makes both sides worse". The replayed value is `maxIn = 14294/14275 < 572/571`, so In improves.
  - The §7 claim that no registered key "implies" these facts, which is false mathematically.
- **Superseded:**
  - §8.2's "open door" (`pb`/`pc` depending on leg type and leg count) is closed **uniformly** by C-T2-F F-2 and by C-T2-U's
    corollary. Its β/γ-separated variant is closed **at `m = 107, 110, 113`** by C-T2-F's Farkas certificates.
  - §8.3 (state-dependent switches) is not a template move. The only positive-weight switch arcs from sector sources are the `u_i`
    switches at `(1,γ)`.
- **The route delivered no feasible allocation.** The T orientation's feasible allocation is T1's.

### T3 — `C1-T-03` — **retained_narrowed; `bounded_evidence` as filed; the open step is closed by critics**

- **Mathematics upheld:**
  - step 1, the exact block decomposition `i_k = Σ_j C(m,j) a_j(k−j) + t_k`;
  - step 2, log-concavity of each `P_j`, modulo Newton on a product of linear factors (fence 3 respected);
  - step 4, `l_j − μ_j = (j−4)/3`;
  - step 5, `g_0(l_0) < 0` for every class `m`;
  - step 6, the per-block convolution identity.

  I re-derived all of these, and both critics confirm them.
- **Census.** `[107, 584]`, 160 rows, graded `bounded_computation`. C-T3-F confirmed all 160 rows against a literal-tree DP. My
  independent closed-form check reproduces `Δ` digit counts 407, 418 and 430 at `m = 107, 110, 113`.
- **Narrowed:**
  - `identity_check_pass` is **tautological**. I read the code: `sum_weighted` and `main_diff_direct` are built from the same numbers in
    the same loop. The claims "independent cross-check" and "checked against … `i_k`" are struck. The identity itself is true: C-T3-F
    checked it against the literal tree, C-T3-U against the literal tree at three rows, and I checked it against direct truncated
    polynomial arithmetic on `(1+2x)G^m + x(1+x)(1+2x)^{8m}` at `m = 107, 110, 113`.
  - "EXACTLY" for `l_j − μ_j` was a floating-point check (tolerance `1e-9`) and is struck as a computational literal; the identity
    is exact by algebra.
  - The replay recipes copy from the target directory and are defective.
  - Obligation item 3 omitted the negative tail `τ` (C-T3-U, A3).
  - The step 6 "√j versus linear offset" account is commentary graded `conjecture`, and it is superseded: the operative facts are
    step 4 plus Darroch for `j ≥ 4` and an exact certificate below that.
  - The grade word "proved" is renormalized.
  - The composition (E) was not written on the face. It is immediate; see R3.

## Cross-route reconciliation

**Paired-critic disagreements, resolved claim by claim. No verdicts were averaged.**

| # | Claim | Critic F | Critic U | Ruling |
|---|---|---|---|---|
| 1 | T1 Residual lower bound | `1−ρ_1 ≥ 9/(20m)`, degree-9 `Q` | `1−ρ_1 ≥ 2/(5m)`, degree-9 `G` | **No conflict.** `9/20 > 2/5`, and both bounds hold. My instrument certifies both, and certifies that `15/32` and `1/2` fail, consistent with the limit `m(1−ρ_1) → 15/32` from below. `Q` and `G` are the same polynomial up to a positive normalization: at `m = 107`, `G(107) = 1.3737·10²⁸` in both C-T1-U's normalization and mine. |
| 2 | Arc classes of the per-state reduction | Sampled lab: no positive-weight arc outside the model | Adds the `s`-insertion and `(1,0)`-insertion arcs (weight-0 targets) and the non-sector two-choke `r`-insertion preimages of in-sector targets (carrying 0) | **U's list is the complete one. Adopted.** F's statement is consistent with it, since weight-0 targets are outside the model. Both remain sampled evidence; the reduction is U2's lemma. |
| 3 | T2 gate line | Keeps `template_failure_found` | Records `not_advanced`; the r30 template did not fail | **`template_failure_found` stands only in the qualified sense** that restricted sub-families failed: rates depending only on (leg type, leg count), uniformly, and β/γ-separated rates at three rows. The r30 template, and T1's closed form on the whole class, are **feasible**. Contract §1 counts failure of a local-flow template as a template failure, so F's literal reading is admissible. U's warning against reading it as failure of the r30 template is adopted as the binding gloss. At the orientation level, `LS_top` is advanced (via T1). |
| 4 | Scope of the T2 no-go | F-2: pure-layer double counting kills every `pb = f_b(n)`, `pc = f_c(n)`; necessary asymmetry | Theorem N: a necessary lone-b discount at some `γ` for any template; corollary kills leg-count-only rates; switch-budget floor (B) | **Concordant; both upheld, and they are complementary.** F-2 gives the forced ratio `maxIn ≥ (p*/K)·minOut`. N is the sharper structural necessary condition. I checked both proofs line by line. As a consistency test, the feasible T1 allocation satisfies (N) strictly at every `γ` and `θ ≥ θ_budget` at 107, 110 and 113 (`θ/θ_budget = 1.188`), as any feasible allocation must (`adj_nogo_consistency.py`). |
| 5 | The T3 identity check | "Tautological" | "Checked only against its own closed form" | **F is right.** I read the code. U's description is compatible but weaker. |
| 6 | The tail `τ` in T3's obligation | Not raised | `τ < 0`, missing from item 3 | **U adopted.** My per-block instrument certifies `τ < 0` for every `t ≥ 35`. |
| 7 | Darroch range and the `j = 3` block | Darroch decides `j ≥ 4`; `j = 3` descends | Same | **Concordant.** My per-block certificates give signs `(−,−,−,+,+,+)` for `j = 0..5` for every `t ≥ 35`. A mean-side classification (`j ≤ 3` below the mean) is not a sign classification. How this bears on U3's and F3's summaries is for their adjudicators; I did not read those returns. |
| 8 | Truncation level for (ELIG-top)(a) | `J = 5` from `n = 35`; `J = 6` also works | `J = 5` from `t = 35`; `J = 4` fails at `t = 35..44` | **Concordant.** I confirm that `S_4 ≤ 0` at `t = 35..44` and that `S_5 > 0` uniformly. |

**Replays weighed over self-reports.** Each critic-derived advance was replayed copy-out-first in `scratchpad/c1-adj-T/replay/` and
reproduced byte for byte:

- C-T1-F `crit_t1f_residual_out.json` `8d6ca1aa…`;
- C-T1-U `crit_residual_out.json` `d978c07b…`, plus `crit_crude.py`, where all four constants pass;
- C-T2-U `crit_t2u_output.json` `6e90699e…`, including its Part A (WID) assertion;
- C-T2-F `crit_t2f_cutplane_107.json` `74df0e61…` and `crit_t2f_farkas_107.json` `46f680ca…`, with `certificate_valid: true`;
- C-T3-F `uniform_cert_J5_n35.json` `738da71f…`;
- C-T3-U `eligtop_magnitude_cert.json` `04aba2e0…`.

I also built **independent instruments of a different construction**. The critics expand falling factorials symbolically; my
instruments interpolate exact polynomials in `t` (`m = 3t+2`) from direct big-integer binomial sums. They yield:

- **Residual.** `G(t)` has degree 9, and all 10 coefficients of `G(35+u)` are positive (the constant is `13736854315533908060107804800`).
  `B(35+u)` has all coefficients positive. Everything was checked at 22 further points up to `t = 1001`.
- **ELIG.** `P(t) := S_5(t)·Den(t)/R`, with `Den = ff(B,40)(L+1)Π_{q≤5}(M+q)`, has degree 50, and all 51 coefficients of `P(35+u)` are
  positive. My `P` equals C-T3-F's `N_5` **coefficient for coefficient**: the ratio is 1 at every index. That is exact agreement
  between two constructions.

For the uniform certificates, that makes two instruments of different construction. It does **not** replace the contract's
isolated second read (§4), which the synthesis must still commission.

**Cross-route coherence inside T.** T1 (feasible closed form) and T2's critics (necessary conditions) are consistent: the T1 allocation
is exactly of the two-dimensional, lone-b-discounted shape that N and F-2 require. T3 is independent of the sector. No route or
critique in my portfolio found a deficient cut. `cut_candidate` is `none` throughout.

**Fidelity record** (check 3). The T returns are template-level (T1, T2) or coefficient-level (T3), and legitimately assert no
network aggregate. The critics supplied fidelity:

- C-T2-U asserted (WID) from two independent sides at `m = 107, 110, 113`: side 1 from its own weighted generating function, side 2
  from `Σ_z[q_z(p*) − q_z(p*−1)]` on the literal `H_z`, `R_z`. It derived `F_{p*} = leafSet` there, with `S(T,p*) < 0`. I replayed
  this byte-identically.
- Four critics computed `x` through `α` on the literal tree. They find `x = p* − 2` exactly at `m = 107, 110, 113` (and 116), so
  eligibility is tight at the start of the class, and `p* − x` grows to 8 by `m = 584`.
- Samples by C-T1-F and C-T1-U confirm the per-state Out/In/switch functions against the literal arcs at 107, 110 and 113.
- `supply − capacity = S` was never taken from one side only.
- Newton and Darroch appear only on real-rooted `P_j`. None of my seats applies them to `I`, `G` or `G^m`.

## Established results

Grades are contract grades (`SOLUTION-CONTRACT.md` §4). Every item first stated at Stage 3 or 4 is **STATED** and needs an isolated
second read before registration. Scope throughout: `T = CB(8,m)`, `m ≥ 107`, `m ≡ 2 (mod 3)`, rank `p* = (16m+4)/3` only.

- **R1 (T1, r31; exact theorem). Closed-form allocation, template level.**
  - *Data.* The allocation above, with the intercept table `B_pb`, `B_pc` (72 cells) shipped in `crit_alloc_out.json` (C-T1-U, `da76863d…`)
    and `adj_alloc_out.json` (this seat, `7d635805…`); the two agree.
  - *Statement.* The allocation is nonnegative. It satisfies Out (`Σ Out ≥ 1` over every splitting of `K = p*−1` legs among the `m`
    chokes), In (`Σ In ≤ 1` over every splitting of `K−1`) and Switch (`(8−γ)σ(γ) ≤ θγ`).
  - *Hypotheses consumed.* None beyond the class. Nonnegativity needs `m ≥ 689/200`. **No `M_0`.** LP optimality is not used, and the
    `θ*` law is not a hypothesis: `θ` is a chosen parameter.
  - *Grade.* `proved_informal` (STATED; adjudicator-replayed).
- **R2 (critic-attributed: C-T1-F and C-T1-U independently; exact theorem). Residual.**
  - *Statement.* `θ(m) = 288/(200m²+82m+5) ≤ 1 − ρ_1(m)` for every real `m ≥ 107`, with `ρ_1 = r_1(p*−1)/r_1(p*−2)` and
    `r_1(k) = [y^k](1+y)^7(1+2y)^{8m−7}`.
  - *Proof.* Clear denominators at `C(N, K−8)`. The inequality becomes positivity of a degree-9 polynomial with all coefficients
    positive after the shift `m = 107 + t` (or `t = 35 + u` in my variable). No Darroch, no Newton, no `M_0`.
  - *Human-checkable forms.* `1 − ρ_1 ≥ 9/(20m)` (C-T1-F) and `≥ 2/(5m)` (C-T1-U).
  - *Corollary.* `ρ_1 < 1` at `p*`: E1 condition (i) at **`q = 1` only**, strict and Darroch-free.
  - *Grade.* `proved_informal` (STATED; critic-attributed; three instruments concordant).
- **R1 ∧ R2: (L-S)_top at the template level.** All four constraints hold for the closed forms on the whole class. Grade
  `proved_informal` (STATED).
  - This is (L-S)_top as the contract defines it **only through** a proved reduction to the literal network (fence 4). That reduction is
    the composition lemma of U2, which is not in my capsule and is STATED. As such, the literal-network (L-S)_top is a **conditional
    reduction**.
  - It is conditional on (i) the per-state reduction and the composition (every arc class of item 2 of the reconciliation); (ii) E1,
    for the `ρ_1γ` load on switch images (criterion key `proved_informal`; condition (i) at every `q` from the threshold key,
    `proved_informal` modulo Darroch on the `r_q`); and (iii) favorability, for `F = leafSet` (`proved_informal` modulo
    Darroch/Newton).
- **R3 (critic-attributed: C-T3-F and C-T3-U independently; exact theorem modulo a classical input). (ELIG-top)(a) and (E).**
  - *Statement.* `i_{p*−1}(CB(8,m)) < i_{p*−2}(CB(8,m))` for every `m ≥ 107`, `m ≡ 2 (mod 3)`.
  - *Proof.*
    - (B-0) The exact block identity.
    - (B-1) For `j ≥ 6`, `l_j − μ_j = (j−4)/3 ≥ 2/3` puts `l_j` at or beyond every mode of the real-rooted positive-coefficient block
      `P_j = (1+x)^{8j}(1+2x)^{8(m−j)+1}` (Darroch's mode theorem), and log-concavity (Newton) gives `g_j(l_j) ≥ 0`.
    - (B-2) `S_5 := Σ_{j≤5} C(m,j) g_j(l_j) + τ > 0` for every real `t ≥ 35`, by a degree-50 polynomial with all 51 coefficients
      positive after the shift.
  - *Consequences.* `x ≤ p* − 2`. With `α = deg I = 9m+1` (the leading term `2x^{9m+1}` comes from `(1+2x)G^m`; the tail has degree
    `8m+2`) and `3p* = 16m+4 < 18m+3 = 2α+1`, (E) holds.
  - *`M_0`.* None beyond the class start: the certificate begins at `m = 107` and is negative at `t = 28..32`, so nothing is claimed
    below 107.
  - *Grade.* `proved_informal` **modulo Darroch/Newton on the blocks `P_j`, `j ≥ 6`** (products of linear factors; the same dependency
    class as the carried keys). STATED; critic-attributed; three instruments concordant, two of them coefficient-identical.
- **R4 (critic-attributed; same grade as R3).** The exceptional set is exactly `{0,1,2}` and `τ < 0` for every class `m`: per-block
  certificates for `j ≤ 5` and the tail, which I reproduced, plus Darroch for `j ≥ 6`.
- **R5 (T3, r31).** Steps 1, 4, 5 and 6 are exact identities, `proved_informal` (STATED). Step 2 is `proved_informal` modulo Newton.
- **R6 (critic-attributed; template failures, not cuts).** Each is `proved_informal` (STATED); all hold for every class `m`.
  - C-T2-F F-2: every allocation with `pb = f_b(β+γ)`, `pc = f_c(β+γ)` (any `σ`, `θ`) is infeasible, with
    `maxIn ≥ (p*/K)·minOut`.
  - C-T2-U Theorem N: the lone-b discount at some `γ` is necessary for every template satisfying Out and In; its corollary is
    the leg-count no-go.
  - C-T2-U (B): the switch-budget floor `θ ≥ θ_budget(m) ≈ 1.21/m²` is necessary.
- **R7 (bounded computations and template facts).**
  - T3 census `[107,584]` (160 rows): `bounded_computation`, superseded as proof by R3.
  - T1's eight exact template tables (`m = 95…116`) and `θ* = 288/(200m²+82m+5)` as the LP optimum at 110, 113 and 116:
    `computer_assisted` values. The law remains a `conjecture` in my portfolio. CF-T-1 reports a cross-orientation optimality proof,
    which I did not grade.
  - C-T2-F F-3: β/γ-separated rates are infeasible at `m = 107, 110, 113` by integer-checked Farkas certificates. This is per-row and
    one instrument; my replay reran the same instrument.
- **Imported results at their grades (Tier 3, cited, never upgraded).**
  - `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`: `proved_informal`.
  - The E1 threshold key: `proved_informal` modulo Darroch on the `r_q`.
  - The favorability key: `proved_informal` modulo Darroch/Newton.
  - `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`: `proved_informal` (registry status VERIFIED; the grade governs).
  - The r30 row key `…M-95-TO-107…`: `computer_assisted`. The first class row, `m = 107`, is certified there.
- **Compiled scratch.** None in the T portfolio: no Lean was run by any T seat or T critic.
- **Record corrections** (records, not edits):
  - T1's intercept and aggregate literals;
  - T2's "both sides worse" and its §7 alias statement;
  - T3's tautological identity check, its float "EXACTLY", its replay recipes and its omitted `τ`;
  - grade words renormalized in all three returns.

## Rejected and narrowed mechanisms

- **Rejected as proof strategies (template failures, not cuts):**
  - sector rates depending only on leg type and choke leg count, uniformly (R6), which contains T2's flat and symmetric-quadratic
    families;
  - β/γ-separated rates, at `m = 107, 110, 113` only (not uniform);
  - any deletion-only allocation, which is the registered deficit key and not new.

  Any viable allocation must be genuinely two-dimensional in `(β,γ)`, must discount lone-`b` states (N) and must have
  `θ ≥ θ_budget`. T1's closed form meets all three.
- **Not registrable:** T2 proposal 2 (Jensen-certificate infeasibility), which the deficit key implies and R6 dominates. T2 proposal 1
  is absorbed into R6; at most it becomes a scope note on the deficit key.
- **Narrowed scope:** T1's candidate key must be renamed to the class, for example
  `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-ON-THE-RESIDUE-2-CLASS-FROM-107`, and must ship the
  intercept table on its face. Every statement outside the class is struck.
- **Superseded:** T3's `√j`-spread heuristic (a conjecture-grade comment); T1's "degree ≈50+" route estimate; T1's min–max bracket on
  `ρ_1`, which is correct but idle.
- **Refuted steps:** none. No claim of my portfolio was refuted, and no REFUTED key regresses. **Not revived:** Darroch or Newton on
  `I`, `G` or `G^m` (the struck r30 argument), the `m`-independent per-choke certificate, and forest real-rootedness.

## Lean readiness

No T seat or T critic compiled Lean, so there are no `#print axioms` outputs to confirm and none to strike. My targeted search of the
pinned Mathlib (`905b9581…`) found **no** Darroch mode theorem, **no** Newton inequalities and **no** log-concavity API.

- **Award group LA-T-1: closed-form sector allocation, template level. Rated CONTRACT-READY at statement level (arithmetic only).**
  - *Exact statement.* For `m : ℕ`, `107 ≤ m`, `m % 3 = 2`, `K = (16m+1)/3`, let `pb`, `pc`, `σ`, `θ` be the closed forms of R1,
    defined from the shipped intercept table, and let `ρ_1(m) := c_K/c_{K−1}` with `c_k := Σ_{i=0}^{7} C(7,i)·2^{k−i}·C(8m−7, k−i)`.
    Then:
    - (i) every `pb`, `pc`, `σ` is at least 0;
    - (ii) for every `n : Fin m → Fin 9` with `Σ n = K` and every choice of states with those counts, `Σ Out ≥ 1`;
    - (iii) the same with `K − 1` gives `Σ In ≤ 1`;
    - (iv) `(8−γ)σ(γ) ≤ θγ` for `γ = 1..7`;
    - (v) `θ ≤ 1 − ρ_1(m)`.
  - *Hypotheses.* The class only.
  - *Fences.* Template level: not a flow on the literal network, and no (HALL) claim until the composition is formal. One rank `p*`,
    the class only. LP optimality and the `θ*` law are never hypotheses.
  - *(a) Informal proof.* Complete, with a closed DAG and no external theorem:
    - the 45-state `m`-free rational inequalities (finite checks);
    - the two aggregate identities (`ring`);
    - summation of the affine per-state bounds over a splitting;
    - Switch (finite) and nonnegativity (linear in `m`);
    - the `ρ_1` normalization `C(N, j0+s)·Π_{u≤8}(j0+u) = C(N,j0)·τ_s` (a `Nat.choose` ratio lemma, the one engineering-heavy node);
    - positivity of the degree-9 polynomial after the shift (explicit coefficients).
  - *(b) Carried fragments.* None needed. The link `c_k = [y^k](1+y)^7(1+2y)^{8m−7}` is a `Polynomial.coeff_mul` node if the award
    states `ρ_1` through `r_1`.
  - *(c) Open nodes.* None mathematical.
  - *New declarations* (proposed): `cb8Pb`, `cb8Pc`, `cb8Sigma`, `cb8Theta`, `cb8Rho1`, `cb8_sectorAllocation_out_in_switch_nonneg`,
    `cb8_residual_capacity`.
  - *Caveat.* Registration of the informal keys waits for the isolated second read. It is for the synthesis to decide whether the award
    is funded before, or as, that check.
- **Award group LA-T-2: (ELIG-top)(a) as an integer statement about `I(CB(8,m))`. NOT contract-ready.**
  - *Ready nodes:* (B-0), a finite sum identity; (B-2), degree-50 positivity after the shift, with the coefficients shipped in
    `uniform_cert_J5_n35.json` / `eligtop_magnitude_cert.json` / `adj_eligtop_out.json`; and the (E) composition `3p* < 2α+1`, which is
    trivial once `α = 9m+1` is available from U1's layer.
  - **Smallest unproved lemma (formal open node):** a Darroch-free proof, or a formalization, of the following. For `6 ≤ j ≤ m` and
    `m = 3t+2`, `t ≥ 35`, `[x^{l}] (1+x)^{8j}(1+2x)^{8(m−j)+1} ≥ [x^{l+1}] (1+x)^{8j}(1+2x)^{8(m−j)+1}` at `l = (16m−2)/3 − j`.
    Equivalently, coefficient descent of a two-binomial product at or beyond `mean + 2/3`.
  - *Also consumed:* the closed form of `I(CB(8,m))` in Lean, via the CB layer (U1) and the tree polynomial.
- **Tier 1 terminal.** Not ready. It needs LA-T-1, the formal composition lemma (U2), E1 condition (i) at `p*` for all `q` and
  favorability at `p*` in Darroch-free or formal form, LA-T-2 and the CB layer.
- **T2's no-go theorems** are not award targets.
- **No bounded result is proposed for an award.**

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

Both Tier 2 lemmas reached `proved_informal` content in this orientation's portfolio this cycle:

- (L-S)_top at the template level: T1 plus the critic-attributed Residual;
- (ELIG-top)(a): critic-attributed, modulo Darroch/Newton on real-rooted blocks.

The critic-derived parts are graded critic-attributed, and all of it is STATED pending isolated second reads. New necessary
conditions and no-go theorems narrow the allocation space.

Stop gate (`SOLUTION-CONTRACT.md` §5): unarmed in Cycle 1. No decisive event occurred: Tier 1 is not `formally_verified`, and no
eligible deficient cut was found. This cycle is not a plateau cycle for the T orientation. The plateau clock only matters from the
Cycle 2 close.

## Headline assessment

headline_resolved: no
status: still_open

- **Tier 1** (E ∧ H on the class), at T's evidence grade: **still open.**
  - (E) is `proved_informal` modulo Darroch/Newton (R3, critic-attributed, STATED).
  - (H) is a conditional reduction: template-level (L-S)_top (R1 ∧ R2, `proved_informal`, STATED), plus the literal-network composition
    (U2's lemma, outside this capsule, STATED), plus the E1 and favorability keys (`proved_informal` modulo Darroch/Newton).
  - I have not verified the composition, so I do not rate a complete informal proof of the full Tier 1 statement.
  - No eligible deficient cut exists in my portfolio, so Tier 1 is not refuted.
- **(L-S)_top:** proved at the template level for every class `m` (`proved_informal`, STATED). As the contract's literal-network lemma
  it is **conditional** on the per-state reduction and composition.
- **(ELIG-top)(a):** **proved_informal modulo Darroch/Newton** on `P_j`, `j ≥ 6`, for every class `m` (critic-attributed, STATED;
  three concordant instruments). It is no longer only a `bounded_computation` in this portfolio.
- (HALL) at full scope, the primary aggregate, TREE, FOREST, TRANSFER and Erdős #993 stay OPEN. No status transfers.

## Next-route allocation

**The exact remaining obligation for the T orientation:**

1. **(O1) Isolated second reads** of:
   - R1, with the intercept table on the face;
   - R2 (the rational form of `ρ_1` and the degree-9 positivity);
   - R3/R4 (rebuild `S_5` independently and check the Darroch step's hypotheses for `j ≥ 6`);
   - optionally R6.
2. **(O2) The literal-network (H).** Compose R1 ∧ R2 with the repaired composition lemma: every source arc class, including the `s`- and
   `(1,0)`-insertions to weight-0 targets; every target preimage class, including the non-sector two-choke `r`-insertions carrying 0;
   and shared capacity (switch image load `ρ_1γ + (8−γ)σ(γ) ≤ γ`, E1 load 0 on in-sector targets). This takes (H) to `proved_informal`
   modulo the carried keys.
3. **(O3) Discharge the Darroch/Newton dependencies:** block descent for `j ≥ 6` (LA-T-2's open node), E1 condition (i) at `p*` for every
   `q`, and favorability at `p*`.
4. **(O4) The Lean awards** LA-T-1 and then LA-T-2.

**Routes for Cycle 2, at most three:**

- **T-A `ELIG-TOP-DARROCH-FREE-BLOCK-DESCENT`.**
  - *Approach.* Prove the descent `a_j(l_j) ≥ a_j(l_j+1)` for `j ≥ 6` (or `j ≥ 4`) without Darroch. Two candidate methods:
    - use the exact per-block identity `g_j(l_j) = Σ_i C(8j,i)·C(B_j,k_i)·2^{k_i}·(13j−3−3i)/(k_i+1)` and pair the negative terms
      (`i > i* = (13j−3)/3`) against the positive ones, with explicit ratio bounds on the unimodal weights;
    - or prove an elementary mean–mode bound for the two-binomial product.
  - *Could close in one cycle:* (ELIG-top)(a) with no external theorem, which makes LA-T-2 contract-ready.
- **T-B `LS-TOP-LITERAL-NETWORK-ASSEMBLY`.**
  - *Approach.* Write the full proof of (H) on one face: R1 ∧ R2, the repaired composition (O2), and the carried keys at their grades.
    Test it exactly at `m = 110` and `113` with an independent literal-network verifier (`WID` from two sides, derived `F`, the exact
    total load on every target class).
  - *Could close in one cycle:* Tier 1 at `proved_informal` modulo the carried keys and (B-1), ready for an isolated second read.
- **T-C `E1-AND-FAVORABILITY-DARROCH-FREE-AT-TOP-RANK`.**
  - *Approach.* Extend the exact polynomial-certificate method of R2 and R3 (normalize, then check positivity of the shifted
    coefficients in `t`):
    - to `ρ_q ≤ 1` at `p*` for every `q ∈ [1,m]`, with per-`q` certificates for small `q` and a uniform argument for large `q`;
    - to favorability of `v` and of the `c_{ij}` at `p*`.
    Coordinate with U3's contested Darroch-free scope, which the U adjudicator rules on.
  - *Could close in one cycle:* the Darroch/Newton dependencies of Tier 1's carried inputs on the class.

The synthesis may also fund LA-T-1 in the U lane now, since it is contract-ready at statement level.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-adj-T/`. Tools use
the Python standard library with exact integers and `Fraction`s. Every run was in the foreground, and each finished in under about 10 s.
**No background job was started, so none needed killing.**

| File | SHA-256 | Role |
|---|---|---|
| `verify_capsule.py` | `04f6ec2a90eec9a75d1f7c278d248e64dfc2987a639507c30e441018b8fbdfd0` | capsule seal and 24 member digests |
| `verify_manifests.py` | `c7bf6945998eb70b05db848bd9ba51213a685f49e771ead28ceac37412cf963f` | Stage 2/3/4 packet seals; my portfolio's entries |
| `adj_alloc.py` | `10a9af5e37bd2b8d750c37ab59ea4a9eb7f543638a14765937f6bebca1a17ee9` | intercepts from the frozen `m=95` row; out-of-sample check at 98–107; 45-state slacks; aggregates; exact splitting DP at 107/110/113 |
| `adj_alloc_out.json` | `7d63580526f84c48434b832353298bdba97c6a9cdce2a1bb95be9540870d4b13` | intercept table, `c_γ`, slacks, DP rows |
| `adj_residual.py` | `def15439b87c1cbd98c71a1f1872cdcca56c837978f91d8ef2aea831d622d809` | Residual by exact interpolation in `t`; shifted positivity; crude bounds |
| `adj_residual_out.json` | `5a4833be8e7c77efe827c15eb1ff9abb14c4d4892c186bc466aac86ddca8e474` | `G`, `G(35+u)`, `B`, margins 34.90/35.88/36.85 |
| `adj_eligtop.py` | `1dfaeb8bf99f304e515935228ef740e851033a39dbd11b241bccac73099046cb` | block identity against direct `(1+2x)G^m + x(1+x)(1+2x)^{8m}`; `S_5` certificate by interpolation |
| `adj_eligtop_out.json` | `eb2b4a802949cd86ff76e17dab044724649b5827138518674999c0f3661542ff` | `P`, `P(35+u)` (equal to C-T3-F's `N_5`), row facts |
| `adj_blocksigns.py` | `e41a7b5cafece4743274cb1f24a7463c7f025a5fcd424496287dedc75ea64b23` | per-block sign certificates `j=0..5` and the tail |
| `adj_blocksigns_out.json` | `50c2e0084a540b129883a40b7e33c1566461460af851b518f93e0dc9e3b4f0ca` | signs `(−,−,−,+,+,+)`, tail negative |
| `adj_nogo_consistency.py` | `d32efff63ef8e36eee9da0dead4a63b2482ae5c56c493fb0c8cc1a777c7f7ae6` | (N) and `θ ≥ θ_budget` on the feasible allocation |
| `replay/T1F/`, `replay/T1U/` | outputs `8d6ca1aa…`, `d978c07b…` (byte-identical to the originals) | copy-out replays of the C-T1-F and C-T1-U Residual proofs |
| `replay/T2F/`, `replay/T2U/` | `74df0e61…`, `46f680ca…` (payload); `6e90699e…` (file) | copy-out replays of C-T2-F (`m = 107`) and C-T2-U |
| `replay/T3F/`, `replay/T3U/` | `738da71f…`, `04aba2e0…` | copy-out replays of both uniform (ELIG-top)(a) certificates |

To replay, `cd` into the directory and run `python3 -B adj_alloc.py 107 110 113`, then `python3 -B adj_residual.py`,
`python3 -B adj_eligtop.py`, `python3 -B adj_blocksigns.py` and `python3 -B adj_nogo_consistency.py`, in that order (the last reads
`adj_alloc_out.json`).
