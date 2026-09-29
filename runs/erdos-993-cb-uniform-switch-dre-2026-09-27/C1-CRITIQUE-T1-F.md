# Critique

Critic `C-T1-F` (orientation F, falsify) of seat `T1`, route `C1-T-01`, mechanism `LS-TOP-CLOSED-FORMS-FROM-EXACT-TABLES`.
Cycle 1, Stage 4, run r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`), 2026-09-27.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. Per the dispatch, the protocol's task map,
memory, logs, decisions and conversations were not loaded.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Dispatch integrity:** `control/dispatch/c1-stage4/DISPATCH-C-T1-F.md`. I checked it against the supplied SHA-256
`edb6d991b3f4b3aefe00caf11e547be86fd5b006398db462d915c431973b45be` with `shasum -a 256` before doing anything else. It matched exactly.

## Identity and seal audit

All seals were recomputed as SHA-256 of the compact key-sorted JSON with `seal_sha256` removed and no trailing newline.

| Object | Recorded seal | Recomputed |
|---|---|---|
| Capsule `control/c1-critic-capsules/T1-PACKET-MANIFEST.json` | `4fe158977944c7a5f2a5838a6b9ca0f16403fa81dd8c1c2e7cfb901b4d6ebf95` | match |
| Stage 2 `control/C1-STAGE2-PACKET-MANIFEST.json` | `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc` | match |
| Stage 3 `control/C1-STAGE3-PACKET-MANIFEST.json` | `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37` | match |
| Stage 4 `control/C1-STAGE4-DISPATCH-MANIFEST.json` | `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b` | match |

All 14 capsule members matched on SHA-256 and byte count. That includes the return (`6c9708d4…ef719`, 21578 B) and `sources/SOURCE-DIGESTS.json`
(`1508f7dd…5c703`).

**Digests the return lists:**
- The return's dispatch digest (`2f088bb2…`) is a Stage 3 dispatch. It is not a capsule member, so I did not recompute it.
- The return's Stage 2 seal equals the recomputed one.
- The return's generator digest `ecb572f544ef65cf903c610a941fc756d6bd71c6f7de4fa850b9b7829521603a` equals the SHA-256 of the file bytes
  of `scratchpad/c1-T1/t1_generator_output.json`. My copy-out-first replay reproduced it byte for byte.
- Minor: loading that file and re-serialising it "canonically" gives `8d25b69a…8f8906`, not `ecb572f5…`. The file was written from a dict
  with integer row keys, which sort numerically; after a reload the keys are strings and sort lexically. The digest is the file-bytes
  digest, not a reload-canonical one. The return should say so.

**Claim identity.** The return touches (L-S)_top, which is Tier 2 and not yet keyed, plus the cited keys below. I checked each against
the frozen registry (`sources/authority/CLAIM-IDENTITY.json`, 491 claims, 0 `E993-R31-` keys):

| Key | Status | Grade |
|---|---|---|
| `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` | VERIFIED | `proved_informal` |
| `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` | VERIFIED | `proved_informal` |
| `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` | VERIFIED | `proved_informal` |
| `E993-R30-CB-8-M-95-TO-107-…-WITH-LOAD-BEARING-SWITCH-ARCS` | VERIFIED | `computer_assisted` |

The return's citations are consistent with these, but it writes status ("VERIFIED") where the grade is what matters. The grades govern
(SEMANTIC-CONTRACT §3).

**Candidate key `E993-R31-CB-8-TOP-RANK-SECTOR-ALLOCATION-CLOSED-FORM-SATISFIES-OUT-IN-SWITCH-FOR-EVERY-M`:**
- No lexical alias: no registry key contains `SECTOR-ALLOCATION`, `THETA`, `OUT-IN` or `288`. The one `CLOSED-FORM` hit is
  `E993-PAIR-SPIDER-CLOSED-FORM`, which is unrelated.
- No mathematical alias: the nearest key is the finite 95–107 row key.
- The name over-scopes the claim: "FOR-EVERY-M" conflicts with fence 1. It must name the class, for example
  `…-FOR-M-AT-LEAST-107-CONGRUENT-2-MOD-3` (see Certification audit).

## Independent re-derivation

**My instruments** are standard library only and live in `scratchpad/c1-crit-T1-F/`. None of them imports T1 code. T1's scripts were used
only in the separate replay directory.

**(A) The per-state model, derived from SEMANTIC-CONTRACT §2 without reference to T1's code**

A sector source is `B = {r, v}` plus `K = p* − 1` legs. At a choke in state `(β, γ)`:
- `Out(β,γ) = β·pb(β,γ) + γ·pc(β,γ) + [β = 1, γ ≥ 1]·σ(γ)`.
- An in-sector target has `K − 1` legs. Its only positive-certificate in-arcs are deletions from `A ∪ {q}`, with `q` a `b` or `c` on an
  empty leg. So `In(β,γ) = (8 − n)(pb(β+1,γ) + pc(β,γ+1))` for `n = β + γ < 8`, and `In = 0` at `n = 8`.
- The switch at `u_i` is legal exactly when `β = 1`, because `N(u_i) ∩ B = {r, b_ij}`.
- A switch image is `r`-free, contains `v`, has the single choke `u_i` and weight `γ`. It has exactly `8 − γ` sector preimages. No
  sector source reaches an in-sector target by a switch, because `r ∈ N(u)` would be removed.

This is the model T1 uses.

**(B) Intercepts from the frozen r30 tables, independent of T1's LP**

I took the tables for `d = 8` at `m = 95, 98, 101, 104, 107` from these files:
- `C-T2-U/own/CERT-TABLES.json`
- `C-T2-F/crit_cert_tables.json`
- `C-T2-F/crit_extend_a.json`
- `C-T2-F/crit_extend_b.json`

Where a row appears in two files, the two copies agree on every cell. Results:
- For all 72 `pb`/`pc` cells, `D(m)·value − 25m/2` is the same constant on all five rows, where `D(m) = (200m² + 82m + 5)/3`.
- `θ = 288/(200m² + 82m + 5)` on all five rows.
- `σ(γ)/θ = c_γ` is constant, with `c = (1/7, 1/3, 3/5, 1, 5/3, 3, 7/2)`.

The intercept table `B_pb`, `B_pc` is in `crit_t1f_template_out.json`.

My copy-out-first replay of T1's LP (`scratchpad/c1-crit-T1-F/replay/`) gives tables at `m = 95, 110, 113` that equal the closed forms
defined by these intercepts, cell for cell. So T1's closed forms coincide with the frozen-source closed forms.

**(C) The per-state reduction, checked exactly in all 45 states**

Multiplying by `D(m) > 0`, the `m`-terms cancel identically on both sides. The Out and In inequalities become `m`-free rational
inequalities, and I checked them in every state, including `(0,0)` and `n = 8`.

- **Out slack:** at least 0 everywhere. 40 states are tight, including `(1,7)`.
- **In slack:** at least 0 everywhere, with many tight states.
- **Switch:** `γ − (8 − γ)c_γ = 0` for `γ = 1..6`, and `7/2` (in units of `θ`) at `γ = 7`.
- **Nonnegativity:** the most negative intercept is `B_pc(1,7) = −689/16`. Every `pb`, `pc` is nonnegative once `m ≥ 689/200`, and
  `D > 0` always.
- **Aggregates, checked symbolically as polynomial identities in `m`** (not by sampling):
  - `m·a + λK = 1`, from `−7m/2 + (25m/2 + 5)(16m + 1)/3 = D(m)`.
  - `m·a2 + λ2(K − 1) = 1`, from `m(200m + 24) + (−25m − 5/2)(16m − 2)/3 = D(m)`.
  - Both are identities in `m`.

**(D) The literal splitting condition at the fresh rows**

I wrote my own min-plus/max-plus DP over every splitting of `K` (respectively `K − 1`) legs among the `m` chokes, in integer-scaled exact
arithmetic, and tested the recurrence against brute force on 200 random toy instances. Applied to the closed forms:

| m | p* | min Out | max In | nonneg | switch |
|---|---|---|---|---|---|
| 107 | 572 | 1 | 1 | yes | yes |
| 110 | 588 | 1 | 1 | yes | yes |
| 113 | 604 | 1 | 1 | yes | yes |
| 116 | 620 | 1 | 1 | yes | yes |

**(E) Exact `ρ_1`**

`ρ_1 = r_1(p* − 1)/r_1(p* − 2)`, where `r_1(k) = [y^k](1+y)^7 (1+2y)^{8m−7}`. I computed it by explicit polynomial multiplication at
`m = 95, 98, 101, 104, 107, 110, 113, 116, 200, 302`.
- The value at `m = 95` equals the fixed point `1354839571516225/1361543988640524`.
- The margin `(1 − ρ_1)/θ` is 34.90 at `m = 107`, which matches the fixed point. It is 35.88 at 110 and 36.85 at 113.
- `m(1 − ρ_1)` lies between 0.4678 and 0.4684 across these rows.

**(F) Fidelity on the literal tree (sampled laboratory, my own)**

I built `CB(8,m)` explicitly at `m = 107, 110, 113` and checked the tree and its invariants:
- It is a tree, both by edge count `n − 1` and by connectivity.
- `α = 9m + 1`, computed by a generic tree DP.
- `x` was computed through `α`:
  - At `m = 107`: `n = 1822`, `α = 964`, `x = 570`. This is the fixed point.
  - At `m = 110`: `x = 586`, with `α = 991`.
  - At `m = 113`: `x = 602`, with `α = 1018`.
  - The parent descent `i_{p*−1} < i_{p*−2}` holds at all three rows.
- `leafSet = {v} ∪ C`.

I derived `F_{p*}` from `i_{p+1}(T − ℓ) < i_p(T − ℓ)`. It holds for `v` and for four sampled private leaves per row. The remaining
private leaves are covered by the automorphism group, which permutes chokes and supports.

Then I sampled 15 sector sources per row, including forced states `(1,1..7)`, `(0,8)`, `(8,0)`, `(1,0)` and `(0,0)`, and 12 in-sector
targets. For each I enumerated the literal (D) ∪ (S) arcs and computed the literal active-tag weight:
- Every literal outflow equals the per-state `Out` sum.
- Every literal inflow equals the per-state `In` sum.
- Every positive-certificate target has the claimed class and weight.
- No positive-weight out-arc of a sampled source falls outside the model.
- Every switch image (258, 268 and 271 checked across the three rows) has exactly `8 − γ` sector preimages.
- No sector source reaches an in-sector target by a switch.

This is sampled evidence for the template-to-network reduction, not a proof of it.

**(WID) was not asserted by me or by T1.** T1's instruments never build the network, and T1 discloses this. The sector certificate alone
does not need (WID), but a composition does. That check belongs to F1/U2.

## Attacks and findings

1. **Out/In as literal splittings.**
   - The affine bounds sum to `m·a + λK` whatever the splitting is, because `Σ n_i = K`. Chokes in `(0,0)` contribute
     `Out = 0 ≥ a = −7/(2D)`, which I checked. On the In side, `n = 8` contributes `In = 0 ≤ a2 + 8λ2 = 4/D`, also checked.
   - So the affine per-state inequalities imply the literal min/max conditions for every `m` in the class. The direction is right: a lower
     bound for Out, an upper bound for In.
   - Because the `m`-terms cancel identically, no `M_0` is needed for Out, In or Switch. **Confirmed.**
2. **σ(7) anomaly.**
   - `c_7 = 7/2` is below the Switch ceiling `7`, so Switch at `γ = 7` has slack `7/2 · θ`.
   - Out at `(1,7)` is **tight** with this value: slack exactly 0, where `σ(7)` contributes `96 · 7/2 = 336` to `D·Out`. Lowering
     `σ(7)` would break Out(1,7); raising it toward `7θ` would add slack.
   - The value is correct as defined. The return's remark that `σ(7)` is "otherwise under-determined" is incomplete: it is pinned from
     below by Out(1,7).
3. **Nonnegativity.**
   - Confirmed: the threshold is `689/200`, from `pc(1,7)`.
   - The remark that it holds "for every `m ≥ 4`" is outside the class (fence 1). It is not a claim, and I have struck it from the
     claimed scope.
4. **The fit and the fresh-row gate.**
   - T1's line is fitted on `m = 95, 98` and checked at all eight rows, so `110, 113, 116` are genuine predictions. T1's DP verified them.
   - My DP on the closed forms at `107, 110, 113, 116` independently confirms them. The gate ruling 2 order is respected.
   - The universal proof does not depend on the fit at all. The closed forms are *defined* by the intercepts, and the proof is the
     `m`-free per-state check.
5. **The intercept table is not shipped (material certification defect).**
   - The return says the intercepts `B_pb`, `B_pc` are "listed in `t1_generator_output.json`". They are not. The output holds only
     booleans (`out_constraint_proved_for_all_m: true`, and so on) plus `θ`, `c_γ`, `a`, `λ`, `a2` and `λ2`.
   - The per-cell data the universal proof rests on can be recovered only by re-running T1's LP.
   - I recovered them independently from the frozen r30 tables and confirmed they are identical to T1's replayed LP. The mathematics
     survives; the literal is struck.
6. **Aggregate-check literal.**
   - The return says the aggregates were confirmed at `m = 107`, `1,000,001`, `5,000,003` and `12,345,683`, and that both are equalities.
   - The generator checks only `[107, 1000001, 12345683]`, and tests `agg2 ≤ 1`, not equality.
   - The symbolic identities in (C) make both points moot, but the literal is inaccurate.
7. **Residual.**
   - T1's bracket `[2(8m − 19)/(16m + 1), (4m + 1)/(4m − 5)]` is correct: it comes from the weighted-average-of-ratios argument, and
     `f(i)` increases in `i`. It is also useless for Residual, as T1 says.
   - T1's claim that the exact route needs "degree roughly 50+" polynomials is wrong. The exact rational form has numerator and
     denominator of degree 8, and the Residual polynomial has degree 9 (see the advance below).
8. **Template ≠ network.** T1 cites the reduction to U2 and r30 at STATED grade, which is correct under gate ruling 4. My sampled
   laboratory (F) agrees with the reduction at 107, 110 and 113. It still is not a proof.
9. **E1 dependence.**
   - The Residual condition makes switch-image capacity suffice **given** E1's load `ρ_1 γ`. That load comes from the E1 criterion key,
     graded `proved_informal`, and needs condition (i) at every `q`. That in turn is covered by the threshold key, graded
     `proved_informal` modulo Darroch on the `r_q`.
   - T1 inherits both dependencies. Neither is re-proved, and neither is T1's obligation.
10. **Eligibility.** T1 correctly disclaims it. My `x` and parent-descent values at 107, 110 and 113 are row data only and do not advance
    (ELIG-top)(a).

**Critic-derived advance (C-T1-F): Residual `θ(m) ≤ 1 − ρ_1(m)` for every real `m ≥ 107`, hence for every class member. The proof is
Darroch- and Newton-free.**

Setup:
- Write `c_k = Σ_{i=0}^{7} C(7,i) 2^{k−i} C(N, k−i)`, with `N = 8m − 7`, `K = (16m + 1)/3` and `u = N − K = (8m − 22)/3`.
- For `m ≥ 107` we have `0 ≤ K − 8` and `K ≤ N`, so `C(N, K−8+j)/C(N, K−8) = Π_{s<j}(u + 8 − s)/(K − 7 + s)`.
- Define `E_j = Π_{s<j}(u + 8 − s) · Π_{s=j}^{7}(K − 7 + s)`. Each `E_j` is a degree-8 polynomial in `m`.

Then, with the same positive factor removed from numerator and denominator:
- `ρ_1 = A/B`
- `A = Σ_i C(7,i) 2^{7−i} E_{8−i}`
- `B = Σ_i C(7,i) 2^{6−i} E_{7−i}`

I checked the identity against brute force at 10 rows.

Residual holds if and only if `Q(m) := (B − A)(200m² + 82m + 5) − 288B ≥ 0`, where `B` is positive. `Q` has degree 9.

Expanding in `t = m − 107`:
- `Q(107 + t)` has all 10 coefficients **positive**. Its constant term is `6868427157766954030053902400` and its leading coefficient is
  `8589934592000/2187`.
- `B(107 + t)` has all 9 coefficients positive.

So `Q > 0` and `B > 0` for every real `m ≥ 107`. There is no `M_0` beyond the class endpoint, no remainder term and no sampling.

A second, human-checkable form:
- `m(B − A) − (9/20)B` has nonnegative coefficients at `107 + t`. Hence `1 − ρ_1(m) ≥ 9/(20m)` for every `m ≥ 107`.
- The asymptotic constant is `κ = lead(B − A)/lead(B) = 15/32`. The bound fails with `1/2` in place of `9/20`, as it should.
- Since `θ(m) < 288/(200m²) = 1.44/m² ≤ 0.45/m` for `m ≥ 3.2`, Residual follows again.

Instrument: `crit_t1f_residual.py`.

**Consequence.** Combined with T1's Out/In/Switch/nonnegativity result (item 1), the closed-form template allocation satisfies all four
constraints of (L-S)_top, at the template level, for every `m ≥ 107` with `m ≡ 2 (mod 3)`. That is `proved_informal` in my judgment, but
it is STATED at a review stage and needs an isolated second read. It meets the contract's "proved against the literal network or a
PROVED quotient" clause only through the template-to-network reduction, which is U2's lemma and is STATED at r30's grade until read.

## Mechanism-equivalence and fence check

- **Mechanism.** This is the r30 choke-local template, with switch arcs load-bearing. It is not the refuted `m`-independent per-choke
  certificate: every value scales with `m` through `D(m)`, and `θ` depends on `m`. No refuted mechanism is revived.
- **Fence 1.** One rank `p*`, the class only. The "`m ≥ 4`" nonnegativity remark and "FOR-EVERY-M" in the key name exceed the class and
  are narrowed. Nothing is transferred to (HALL) at full scope or to any aggregate.
- **Fence 3 (Darroch/Newton).**
  - T1 uses neither.
  - T1's bracket is an elementary weighted average.
  - My Residual proof uses neither.
- **Fence 4 (template vs network).** T1 and this critique both route the reduction through U2. The affine separation is used only as a
  sufficient condition. LP optimality is never a hypothesis, and the proof uses only the defined closed forms.
- **Fence 5 (explicit M₀).** No asymptotic step appears in the Out/In/Switch proof, because the cancellation is exact. The Residual
  proof is valid from `m = 107`.
- **Fence 7.** The `θ*` law stays a conjecture as an LP-optimum law. Feasibility of the closed forms does not depend on optimality.

## Certification audit

- **Struck.** "the intercepts … listed in `t1_generator_output.json`". They are absent; they are recoverable from the frozen r30 tables
  (my `crit_t1f_template_out.json`) or by LP replay.
- **Struck.** The aggregate-check literal: "`m = 5,000,003`", and "both are equalities" as a computational report. What was computed
  is `[107, 1000001, 12345683]`, with `agg2 ≤ 1`. The equalities hold symbolically, which is my check.
- **Relabelled.** "Closed form for `ρ_1(m)`: **proved**", and the bracket "**proved**", become `proved_informal`. "proved" is not a
  contract grade.
- **Relabelled.** "Route verdict `proved_conditional`" and "(L-S)_top: proved_conditional" become `conditional`, the contract's grade. The
  condition, Residual, is now discharged by this critique, subject to a second read.
- **Relabelled.** "SHA-256(… canonical)" is the file-bytes digest; see the seal audit.
- **Narrowed.** The candidate key should be scoped to the class, and graded `proved_informal` at STATED for Out/In/Switch/nonnegativity,
  valid on the class through the exact `m`-cancellation. A second read is needed before registration.
- **Backed.**
  - The generator digest (replayed).
  - The eight-row certification (replayed; my own DP at 107 to 116).
  - `θ` at every row.
  - `c_γ`.
  - The most negative intercept `−689/16`.
  - Switch equality for `γ = 1..6`.
  - `ρ_1` at the five frozen rows.
  - "No background jobs" (not contradicted).
- **Remaining obligation audit.** Item 1 (Residual) is discharged by this critique. The "degree ≈ 50+" estimate is wrong: it is 9.
  Item 3 (σ(7)) is answered in Attacks item 2. Items 2 and 4 stand.

## Verdict

verdict: retained_narrowed
headline_resolved: no
`LS_top: advanced`
`ELIG_top: not_advanced`
`cut_candidate: none`

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

T1's mathematics is sound. For every class member, the closed-form allocation satisfies Out, In, Switch and nonnegativity through an exact
`m`-free per-state reduction. I verified that reduction in all 45 states from intercepts I derived independently from the frozen r30
tables, and confirmed it by my own literal-splitting DP at the fresh rows.

The narrowing is for certification, not mathematics:
- the unshipped intercept table;
- the inaccurate aggregate literal;
- non-contract grade labels;
- a key name wider than the class.

With my Residual proof (critic-derived, STATED, needs an isolated second read), the template-level (L-S)_top is complete on the class at
`proved_informal`. Its literal-network validity still rests on U2's reduction and on the E1 keys (`proved_informal`, modulo Darroch on
the `r_q`).

## Remaining obligation

1. An isolated second read of both parts:
   - T1's per-state Out/In/Switch/nonnegativity reduction. The intercept table must be shipped on the face; it is in
     `crit_t1f_template_out.json` (`B_pb`, `B_pc`, `c_γ`).
   - This critique's Residual proof: `Q(107 + t)` and `B(107 + t)` with positive coefficients, and `ρ_1 = A/B` as derived above.
2. The template-to-literal-network reduction as a proved lemma (U2). It should cover in-sector targets, switch images with exactly
   `8 − γ` preimages and weight `γ`, and the absence of any other positive-certificate arc. Only then does the template-level (L-S)_top
   become (L-S)_top for the literal network.
3. The E1 load identity `ρ_1 γ` on switch images and condition (i) at every `q`. These are carried keys at `proved_informal` modulo
   Darroch on the `r_q`; discharging that, for instance Darroch-free via U3's route, is open.
4. (ELIG-top)(a) for every class member (T3/U3). This critique's values at 107, 110 and 113 are row data only.
5. (WID) and the derived `F_{p*}` over the whole class, on the composed flow (F1/U2).

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-T1-F/`.
Everything ran in the foreground; no background job was started.

| File | Contents | SHA-256 |
|---|---|---|
| `crit_t1f_template.py` | Intercepts from frozen r30 tables; 45-state checks; symbolic aggregates; splitting DP | `1c89a685fc155d31ee1c6979bfaf44c4a7ed7ea1cc3caf0dc6efae4cd56f3dfe` |
| `crit_t1f_template_out.json` | Output of the above (argv `107 110 113 116`) | `8120f6bcffbfb99b2b4977814019c81b96e068585197c793e131912aedde19ee` |
| `crit_t1f_residual.py` | Exact `ρ_1 = A/B`; `Q(107 + t)`; the `9/(20m)` bound | `1d1334d7007d2d87fe8e360a8127154a842af8b73bcc768eee949bad774a59e0` |
| `crit_t1f_residual_out.json` | Output of the above | `8d6ca1aab400863b72cb29f7ffa978d9fa0a7eb89864eb0de9ddd8b538fff6df` |
| `crit_t1f_lab.py` | Literal-tree laboratory | `87d68ed51e08c51a58c934c30d91cbffc98d8b7867a1ab6c2c205077bb9fb7d6` |
| `crit_t1f_lab_out_107.json` | Lab output, `m = 107` | `98d0cdd04ce0fa2b750c46f665628042d09853e3c079ca09897476f07dbae624` |
| `crit_t1f_lab_out_110.json` | Lab output, `m = 110` | `54d371a23abfe5e33e2713336fc2caefada0309c3aeb667aedf2447b522ae6fe` |
| `crit_t1f_lab_out_113.json` | Lab output, `m = 113` | `9d2b63a23013a0f7d47899989984b37d8ae689d4a5ea16f12816852ccb1a2e9f` |
| `replay/t1_generator_output.json` | Output of the copy-out-first replay of T1's generator | `ecb572f544ef65cf903c610a941fc756d6bd71c6f7de4fa850b9b7829521603a` |

The replay directory `replay/` holds T1's `t1_simplex.py`, `t1_template.py`, `t1_verify.py`, `t1_rho1.py` and `t1_generator.py`. Only the
`sys.path` line of the generator was edited. The replay reproduced T1's digest exactly.

**Read-boundary disclosures:**
1. `control/C1-CRITIC-ATTACK-BRIEFS.md` is a capsule member. It was printed in full, so the other seats' sections passed through my
   context. Only the T1 section was used.
2. The harness injected the project `CLAUDE.md` and the user memory index into context. Neither was fetched or used.
3. Non-recursive `ls` of the granted T1 artifact directory `scratchpad/c1-T1/`. The listing also shows `..` metadata.
4. Non-recursive `ls` of three directories under `sources/r30/instruments/c6/` (authorized).
5. One read of `sources/authority/CLAIM-IDENTITY.json` (authorized, under `sources/`) for the alias check.
6. My first boot command failed partway (zsh interpreted `=====` as an expansion), so `startup-protocol.md` was re-read on its own.
   No additional file was read.

No network, no installs, no Lean invocation, and no reads outside the grant.
