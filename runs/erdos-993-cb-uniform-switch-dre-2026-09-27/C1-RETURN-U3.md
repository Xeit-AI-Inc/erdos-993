# Return — Route U3, Cycle 1, r31 (`C1-U-03 ELIG-TOP-INTEGER-DESCENT-FORMAL-ROUTE`)

**IMPORT LIST (all scripts, standard library only):** `math`, `sys`, `hashlib`, `fractions.Fraction`. No network, no package installs, no third-party libraries (no `sympy`). All Python invocations were run as `python3 -B`.

**Model disclosure (two-part):** chartered Claude Sonnet 5, high; transport-resolved model sonnet (explicit parameter); runtime-reported model id: `claude-sonnet-5` (as given by this runtime's own system context; the platform's per-seat effort limit noted in `AUTHORIZATION.md` §3 applies).

## 0. Boot acknowledgment

VerityOS booted for this seat by reading **exactly** two files and nothing else: `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The startup protocol's own task-type map, memory, conversations, modules, skills, logs and decisions were **not** loaded (per `control/C1-WORKER-COMMON-BRIEF.md` and `DISPATCH-U3.md`: the controller has booted for the run).

## 1. Dispatch and Stage 2 seal verification

- Dispatch file `control/dispatch/c1-stage3/DISPATCH-U3.md` SHA-256 verified before any other action: `6f8a8f65c23a4b3bd03fe3c82f7c29d3476d25769f0d81fe1f77cbc108054100` (matched).
- Stage 2 packet manifest inner seal, `control/C1-STAGE2-PACKET-MANIFEST.json` (`1403` files): recomputed SHA-256 of the canonical JSON of the manifest **without** its `seal_sha256` field (`sort_keys=True`, `separators=(",", ":")`, no trailing newline, UTF-8) = `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`, which **matches** the manifest's own `seal_sha256` and the value named in the dispatch. Manifest file itself SHA-256: `9e76dc99bca077565fcdc06178457cacffce0a39c90b48c5af52d670725a1e53`.

## 2. Route identity (bound from `control/C1-ALLOCATION.md`)

- **Route ID:** `C1-U-03`
- **Mechanism token:** `ELIG-TOP-INTEGER-DESCENT-FORMAL-ROUTE`
- **Orientation:** U (formal / structural)
- **Load-bearing obligation (verbatim from the allocation table):** "a Darroch-free INTEGER route to the coefficient facts the target needs — (ELIG-top)(a) and E1's condition (i) at `p*` — in a form a Lean award can carry: explicit binomial sums, Pascal-type identities, integer inequalities … Deliver an informal integer proof of at least one of the two facts for every `m` in the class (or the exact obstruction), and compile the finite-parameter-free lemmas you can sorry-free in scratch."

## 3. Sources read and digests verified

All reads were within the grant (`sources/`, the pinned Mathlib package directory, this run's `scratchpad/c1-U3*`, and the top-level control/contract files named by the dispatch and brief). No `find`/`grep`/`rg`/`ls -R` was run rooted above a granted directory; the one `grep` used (Mathlib's `Nat.choose_succ_right_eq` signature) was inside `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project`, explicitly granted "readable for API meaning." **No read-boundary disclosure applies.**

| File | SHA-256 | Checked against |
|---|---|---|
| `control/R31-CHARTER-PROMPT.md` | `7b6f4a0e30d3789097a601bc51cf006d16f6b3a6c255d06cd6b8358400b68d93` | manifest |
| `AUTHORIZATION.md` | `7d9bd0514744386daf81d13c4d89100acb131b2c94c02a322b084edc072edec9` | manifest |
| `OBLIGATIONS.csv` | `8d8cd5116fd8c5a95a588804a1f6352bc9a060133306c9d7b1fb8253eca02880` | manifest |
| `control/CLAIM-IDENTITY.run-local.json` | `b4a339eff1e2cdc04ceedcdd55fdd53697574bf64ed7e26631c50d84d56e470b` | manifest; byte-identical to `sources/authority/CLAIM-IDENTITY.json` |
| `control/C1-WORKER-COMMON-BRIEF.md` | `89a93d95c8290ee4bfaacdee4a733267362b4a17a327a729e9a6caaf66552b00` | manifest |
| `SEMANTIC-CONTRACT.md` | `7cc0bf434d6ea8f8fa2d812caf4e45787c1c06a9dfc6846b6b4d54cb60cf226e` | manifest |
| `SOLUTION-CONTRACT.md` | `480ba2ddda557be50b2d8249feb733be7e3c947d2e0a9dd4e7fee1427a7ef719` | manifest |
| `control/C1-ALLOCATION.md` | `497beb925ad150d1ee783fe9d842e397fa5a03f8393e4b581254def648e062a1` | manifest |
| `control/C1-STAGE1-GATE.md` | `84365a8e85ee2368c3f839721a49941e4e109d5c50799013357f14113665d3c6` | manifest |
| `cycles/cycle-1/stage2/ROUTE-STATE.md` | `9dbe4accfe9356e148f39a49d8108cbac74e1336f5dfc5adbf5a983405e74497` | manifest |
| `sources/mathlib-binding/PIN.json` | `af78b3d8e94a358eb69719280ba3bf79c7bf400d468c6143e07313dbfcbd3ba0` | `SOURCE-DIGESTS.json` + manifest |
| `sources/r30/lean/…c5-la1…/LeanProject/LeanProof/Main.lean` | `e24ba9dd470a4ac99509216695cbe24bbf35689108359841cd0b664af42071bb` | `SOURCE-DIGESTS.json` + manifest |
| `sources/r30/lean/…c5-la1…/INFORMAL-PROOF.md` | `ad566fbc715bc2241a5229e47f7c601b703d34008d96591cac7221475bb58e0b` | `SOURCE-DIGESTS.json` + manifest |
| `sources/r30/lean/…c5-la1…/EVIDENCE/axioms.txt` | `27bcad8e69f266a34b4e90be0c5b4c03899a71be594cc99671a725ba69a11aca` | `SOURCE-DIGESTS.json` + manifest |
| `sources/r30/lean/…c5-la1…/FORMALIZATION-STATE.json` | `8375d8e73db08482c02a83eec2859d7d9a282454142d02c1d099daf24414a928` | `SOURCE-DIGESTS.json` + manifest |
| `sources/heterogeneous-closure/…c5-main-mark-margin/…/Main.lean` | `14e18629a5b514fe7e423f65f4b5d241d0f407b324722953a8dc996c1345e8c7` | `SOURCE-DIGESTS.json` + manifest |
| `sources/heterogeneous-closure/…c5-main-mark-margin/VERIFICATION-REPORT.md` | `9bf47954fdf0fba884e44c331dcf0e39d192137f0909885879f8892b133e4e4d` | `SOURCE-DIGESTS.json` + manifest |
| `sources/heterogeneous-closure/…c5-main-mark-margin/THEOREM-CONTRACT.yaml` | `b404c9580a181f9bcf6e7916e0a788485fa0771bd143e325b86058ee146aa5ea` | `SOURCE-DIGESTS.json` + manifest |
| `sources/heterogeneous-closure/…c3-binomial-block-repair-1/…/Main.lean` | `29caaee0c4695e8b06e0a1960be45068bccde46f7895c6d63b313308de34f3c2` | `SOURCE-DIGESTS.json` + manifest |
| `sources/heterogeneous-closure/…c3-binomial-block-repair-1/VERIFICATION-REPORT.md` | `232765e3e6319ad8702d4943894f7640ea2fcad956ae3c062f0d8b5c41c5d0a0` | `SOURCE-DIGESTS.json` + manifest |
| `sources/heterogeneous-closure/…c3-binomial-block-repair-1/THEOREM-CONTRACT.yaml` | `33dce03d87b9048ce291ab2b1fed82ba344f90e1d2383f083b549bd0bb26323a` | `SOURCE-DIGESTS.json` + manifest |
| `sources/first-interior/c2-primary-v2/…/0014-…crossingIndex.lean.fragment` | `378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb` | `SOURCE-DIGESTS.json` + manifest; matches the carry-table value in C5-LA1's `INFORMAL-PROOF.md` §6 |
| `sources/authority/CLAIM-IDENTITY.json` | `b4a339eff1e2cdc04ceedcdd55fdd53697574bf64ed7e26631c50d84d56e470b` | `SOURCE-DIGESTS.json` + manifest |
| `sources/SOURCE-DIGESTS.json` | `1508f7dd7468dad96ae6d3edfbfc2b402b3dac40513911291a9684561835c703` | self (the digest file itself; manifest lists it) |

All digest checks passed (script: `scratchpad/c1-U3/verify_digests` step, embedded in the session; reproducible inline with `hashlib.sha256`).

## 4. Registered claims named before any computation is reported

Per `SEMANTIC-CONTRACT.md` §4 and my own search of `sources/authority/CLAIM-IDENTITY.json` (491 entries), the claims this route's work touches, cites, or is a dependency-reduction of — named **before** any table below:

1. `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`VERIFIED`/`proved_informal`) — defines "condition (i)" and `r_q`.
2. `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (`VERIFIED`/`proved_informal` modulo Darroch 1964 + Newton) — **the direct parent of this route's contribution.** Its own face states, for `d=8`: "the hold condition (a) `p ≥ ⌈μ_1⌉+2` holds at `p=p*` with equality … exactly when `m ≢ 1 (mod 3)`" — which includes our class `m ≡ 2 (mod 3)` — so E1's condition (i) at `p*`, **every** `q∈[1,m]`, is *already* `proved_informal` (modulo Darroch/Newton) for the r31 family. This route's job is to remove that dependency for as much of the domain as an elementary integer method reaches.
3. `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` (favorability; cited, not re-derived).
4. `E993-TREE-REAL-ROOTED` (`REFUTED`, witness order 4, `K_{1,3}`) — the fence this route respects: Darroch/Newton are legitimate **only** on `r_q` (a product of two linear-factor families, real-rooted), never on `I(CB(d,m))`, `G`, `G^m`, or any forest polynomial. This route's own method uses **neither** Newton nor Darroch anywhere, on anything.
5. `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` (`computer_assisted`) — the `m=107` control row; its fixed point (`n=1822, α=964, x=570`) is reproduced below (§6) with my own generator before any table is reported.
6. `R31-OBL-ELIG-TOP`, `R31-OBL-LS-TOP`, `R31-OBL-TIER1` (`OBLIGATIONS.csv`, run-local, `open`) — this route's contribution feeds `R31-OBL-ELIG-TOP` directly and `R31-OBL-LS-TOP` indirectly (condition (i) is a hypothesis of the sector-certificate composition U2 is proving this cycle; `ρ_1`, the residual-capacity coefficient in `(L-S)_top`, is `r_1(p*-1)/r_1(p*-2)`, computed here).
7. The closed forms of `I(CB(d,m))` and the block decomposition (`SEMANTIC-CONTRACT.md` §2, a node of `T1 of r30 Cycle 6`, `proved_informal`) — cited, used as given, not re-derived or re-claimed.

No claim above is re-proved as if new; §7 below proposes exactly one **new**, narrowly-scoped `E993-R31-` candidate for what this route actually adds.

## 5. Derivation — step by step, hypotheses named where they enter

### 5.1 The two target facts, restated with the difference index explicit

- **(ELIG-top)(a):** `i_{p*-1}(T_m) < i_{p*-2}(T_m)`, i.e. `Δ_{p*-2}(T_m) := i_{p*-1}(T_m) - i_{p*-2}(T_m) < 0`, where `i_k` is the coefficient of `x^k` in `I(CB(8,m);x)`.
- **E1's condition (i) at `p*`, for a given `q∈[1,m]`:** `r_q(p*-q) ≤ r_q(p*-q-1)`, i.e. with `f_q(t) := r_q(t) = [y^t](1+y)^{a_q}(1+2y)^{b_q}`, `a_q = 8q-1`, `b_q = 8(m-q)+1` (`SEMANTIC-CONTRACT.md` §2), the difference `Δf_q(p*-q-1) := f_q(p*-q) - f_q(p*-q-1) ≤ 0`.

### 5.2 Reduction of E1(i) at `q=1` to a fixed, finite (8-term) computation — where the hypothesis `q=1` enters

At `q=1`: `a_1 = d-1 = 7` (**fixed, independent of `m`** — this is the entire reason `q=1` is tractable elementarily where general `q` is not: `a_q = 8q-1` grows with `q`, but `a_1` does not grow with `m`). `b_1 = 8(m-1)+1 = 8m-7`.

Write `m = 3n+2` (the class hypothesis `m ≡ 2 (mod 3)` enters here, `n ≥ 35` for `m ≥ 107`). Then `p* = 16n+12`, `b_1 = 24n+9`. Set `t := p*-2 = 16n+10` and `s_0 := t-7 = 16n+3`.

Define `g(s) := 2^s·C(b_1,s)` (the coefficient of `y^s` in `(1+2y)^{b_1}`) and `G_k := g(s_0+k)` for `k=0,…,8`. Since `f_1(t) = Σ_{i=0}^{7} C(7,i)·g(t-i)` (direct convolution of `(1+y)^7` against `(1+2y)^{b_1}`), reindexing `k=7-i` gives
`f_1(t) = Σ_{k=0}^{7} C(7,k) G_k` and `f_1(t+1) = Σ_{k=1}^{8} C(7,k-1) G_k`,
so
`Δf_1(t) = f_1(t+1) - f_1(t) = -G_0 - 6G_1 - 14G_2 - 14G_3 + 0·G_4 + 14G_5 + 14G_6 + 6G_7 + G_8`
(coefficients `C(7,k-1)-C(7,k)` for `k=1..7`). **Verified exactly** (`crosscheck_symbolic.py`, §6) against the direct double-sum formula for `f_1(t), f_1(t+1)` at `m=107,110,113,200` — bit-for-bit identical, not merely numerically close.

### 5.3 Where Pascal's rule enters (the parameter-free atomic step)

`G_{k+1}/G_k = g(s_0+k+1)/g(s_0+k) = 2(b_1-s)/(s+1)` at `s=s_0+k`, from the elementary Pascal ratio `C(b,s+1)/C(b,s) = (b-s)/(s+1)` (in Lean: `Nat.choose_succ_right_eq`, §8). Substituting `b_1=24n+9`, `s=s_0+j=16n+3+j`:
`ρ_j := G_{j+1}/G_j = (16n+12-2j)/(16n+4+j)`, `j=0,…,7` — **verified exactly as rational number identities** (`crosscheck_symbolic.py`) against the ratio of the actual `math.comb`-computed integers, for every `j` and the same four `m`.

### 5.4 The sign computation (no Darroch, no Newton, anywhere)

Dividing `Δf_1(t)` by `G_4>0` and writing `H_k := G_k/G_4` (a product of the `ρ_j`'s or their reciprocals — `H_4=1`), the target `Δf_1(t) ≤ 0` is equivalent to `LHS_H := H_0+6H_1+14H_2+14H_3 ≥ RHS_H := 14H_5+14H_6+6H_7+H_8`. Clearing denominators (`commonD(n) := N_0N_1N_2N_3·D_4D_5D_6D_7`, `N_j(n)=16n+12-2j`, `D_j(n)=16n+4+j`, all **positive** for the class's range `n≥35`, indeed for all `n≥1`), `Diff(n) := (LHS_H-RHS_H)·commonD(n)` is a **degree-8 polynomial in `n` with integer coefficients**, computed exactly by an explicit list-of-`Fraction` polynomial-arithmetic routine (`poly_explore.py`, no `sympy`, standard library only):

```
degree 0: 1040054400        degree 1: 13872986880     degree 2: 78958982144
degree 3: 248535203840      degree 4: 467158630400    degree 5: 524225085440
degree 6: 325075337216      degree 7: 85899345920     degree 8: 0
```

**Every coefficient of degrees 0–7 is strictly positive; the degree-8 (leading) term cancels exactly to 0.** Hence `Diff(n) > 0` for every `n ≥ 0` (in particular for every `n` in the class, `n ≥ 35`), so `LHS_H > RHS_H`, so `Δf_1(t) = G_4·(RHS_H - LHS_H)·(-1)`... precisely: `Δf_1(t) = G_4·(RHS_H-LHS_H) < 0` (since `G_4>0` and `RHS_H<LHS_H`). This is a **strict** inequality, for every `n≥0`, established purely by an integer-coefficient polynomial sign check — no real-rootedness, no mode theorem, no asymptotics.

**Theorem (this route, elementary, `q=1` case of E1's condition (i)).** For every `m ≥ 2` with `m ≡ 2 (mod 3)` (in particular every `m ≥ 107` in the r31 class), `r_1(p*-1) < r_1(p*-2)` at `p* = (16m+4)/3`. Proof: §5.2–5.4 above, verified independently in two disjoint ways (the 9-term `G_k` reduction, §5.2–5.4, and the direct double-sum `r_q` formula, §6) at `m=107,110,113,116,200,500,2000,5000` with agreement in all cases (`verify_direct.py`, `crosscheck_symbolic.py`).

### 5.5 Why `q=1` is the extremal (binding) case, and why general `q>1` is not reached by this method

`μ_q := a_q/2 + 2b_q/3` (the mean of `r_q`, as in the parent claim's own proof of record) satisfies `μ_q+q = (32m+1-2q)/6`, strictly decreasing in `q`; and the target index `t_q=p*-q-1` decreases by exactly `1` per unit `q`. Since `μ_q` decreases **faster** (rate `-4/3` per unit `q` vs. `t_q`'s `-1`), the gap `t_q-μ_q = 1/2+(q-1)/3` **grows** with `q` (exact, computed from the closed forms; confirmed computationally, `margin_trend.py`: at `m=107` the *relative* margin `(rhs-lhs)/rhs` is `4.37×10⁻³` at `q=1`, rising monotonically to `1.56×10⁻¹` at `q=107`). So `q=1` is confirmed (both analytically and computationally) to be the tightest case, consistent with `SEMANTIC-CONTRACT.md` §2's "`ρ_1` … is the largest `ρ_q`."

The elementary method of §5.2–5.4 works **only** because `a_1=7` is a fixed constant independent of `m`, giving a finite (8-term) reduction. For `q>1`, `a_q=8q-1` grows with `q`; if `q` also grows with `m` (e.g. `q~m/2`) there is no fixed finite reduction of this kind, and the registered proof (Newton + Darroch) remains the only route on file. **This is the precise obstruction reported for `q>1`** (§9, remaining obligation): either (a) extend §5.2–5.4 to every *fixed* `q` (immediate: the same trick works verbatim for any constant `q=Q₀`, since `a_{Q₀}=8Q₀-1` stays fixed as `m→∞`), which does not cover `q` growing with `m`; or (b) find an elementary induction-in-`q` (e.g. a Vandermonde/Chu-type identity linking `r_{q+1}` to `r_q`, since `a_{q+1}=a_q+8`, `b_{q+1}=b_q-8` is a fixed "transfer of 8" operation independent of `m`) — not attempted this cycle; or (c) find an elementary (non-Darroch) proof of the specific mode-bracket fact needed, which is weaker than full Darroch since only the sign at one exact point is needed, not the whole mode. None of (a)-(c) is completed here; (a) is a free corollary of this route's method but does not close the general-`q` gap.

### 5.6 (ELIG-top)(a): the block-mixture obstruction, identified but not resolved by this route

`S(k) := i_k(T_m) = Σ_{j=0}^m C(m,j)·p_j(k-j) + \text{tail}(k)`, `p_j(t):=[x^t](1+x)^{8j}(1+2x)^{8(m-j)+1}` (`SEMANTIC-CONTRACT.md` §2 block decomposition). Each block's own local mean is `μ_j = 4j + (16(m-j)+2)/3`; a direct computation (same style as §5.5) gives, at the target point `k=p*-2-j`: `(p*-2-j) - μ_j = (j-4)/3`, i.e. **block `j` is individually past its own peak (contributing a descending term) exactly for `j ≥ 4`, and still ascending for `j ∈ {0,1,2,3}`** — a **fixed, `m`-independent** threshold on `j`, obtained the same way as §5.5. Unlike the `q=1` case of §5.2, however, **neither exponent of a generic block (`8j` and `8(m-j)+1`) is bounded independent of `m`** except at the two edges `j=0` (single factor `(1+2x)^{8m+1}`, not a genuine 2-factor mixture) and `j=m` (`(1+x)^{8m}(1+2x)^1`, the mirror image of the `q=1` trick, with the *small* exponent now on the `(1+2x)` side). So the finite-reduction method of §5.2–5.4 does **not** generalize term-by-term to the full `m+1`-block mixture: proving `Σ_j C(m,j)[p_j(p*-2-j)-p_j(p*-1-j)] > 0` requires comparing the *magnitude* of a bounded number of possibly-huge low-`j`/high-`j` "ascending" block contributions against the polynomially-more-numerous but individually-smaller bulk of descending mid-range blocks — a genuine cross-block domination argument, which is exactly `T3`'s (`C1-T-03`) load-bearing obligation this cycle, not something this integer-route method resolves as a side effect. **This is reported as the precise, named obstruction for (ELIG-top)(a) via this route**, together with the one usable fact: the "bad" (ascending) blocks are confined to the fixed, finite set `j∈{0,1,2,3}` (weight `O(m^3)`, polynomial) versus a bulk of `Θ(2^m)` total binomial mass in the descending region `j≥4` — a concentration observation, not a completed magnitude bound (I did not attempt the actual per-block magnitude comparison; see §9).

## 6. Numeric verification (own generators; fresh rows first per shared rule 2; fixed point reproduced before any table)

**Fixed point reproduced first** (`SEMANTIC-CONTRACT.md` §5, `CB(8,107)/572`; own generator, `verify_fixed_points.py`, independent of r30's tree-DP): `n=1822` (expect `1822`), `α=964` (expect `964`), `x=570` (expect `570` — MATCH). Eligibility check at `m=107`: `x+2=572=p*` (tight equality at the class's first row) and `3p*=1716<2α+1=1929`.

| Script (SHA-256, `scratchpad/c1-U3-replay/`) | Claim checked | Result |
|---|---|---|
| `verify_direct.py` (`223188aa1f26382cf80f51ab1eb83de4261d70b8b85648c1f6cef6aa0a0fe6e9`) | E1(i), `q=1`, `r_1(p*-1) < r_1(p*-2)`, own double-sum generator | strict, holds at `m=107,110,113,116,200,500,2000,5000` (all `m≡2 mod 3` tested); output digest `9abda58a77c25a266f35872cabc751d5e129658ed1caa979d9673c2474c13251` |
| `crosscheck_symbolic.py` (`1cd7f29341d59123a5e2a3255a683c1594f92c05afca061394951171446ea9c0`) | the §5.2–5.3 reduction and ratio identities, cross-checked against the direct sum | exact match at `m=107,110,113,200`, all 8 ratios per row |
| `poly_explore.py` (`6c496a3a66e7766b23f5373aa674d7f7dacf6fc412622cab5d8b2d1b5a188960`) | `Diff(n)` polynomial, all-`n≥0` sign | all coefficients ≥0, degree-8 coefficient exactly 0, degrees 0–7 strictly positive |
| `margin_trend.py` (`d119adaf6d6ab22a3184ca3d92c8f3580000e45193a59b7950986a5727f0257e`) | relative margin of condition (i) across `q`, `m=107` | minimum (tightest) at `q=1` (`4.37×10⁻³`), monotonically increasing through `q=107` (`1.56×10⁻¹`) |
| `verify_all_q.py` (`9992b85bbbcfea4fe6911bd30c5ea99cffbed3354ea19bd84426b3857a0e51c6`) | condition (i) for **every** `q∈[1,m]` (not just `q=1`), control row `m=107` and fresh rows `m=110,113` | holds for all `q`, strictly, 0 failures, 0 exact ties, at all three rows; digest `989da57383ccee3ef36d6db50afca3be24b197f7bd711f7b89ee4c0f85cc876e` |
| `verify_elig_top.py` (`79c3c43ee455a5366ed3fd532d8065f6180f0008f73e9c3c92f5b8afa08ae2c6`) | (ELIG-top)(a), own independent closed-form double-sum generator (not r30's tree-DP, not reused code) | holds at `m=107,110,113,116,200`; digest `8e1c3196a8238c5bd260b15a29faa931a73f8105616b1274a361343a2e08eebb` |
| `verify_fixed_points.py` (`2413a9858e22294fd8c74ced92be234b42e94245f6d129326a6ef5ca60104ad0`) | fixed-point reproduction, `x(CB(8,107))=570` | exact match |

**Replay (copy-out-first, target is this run's own replay scratch, never `/tmp`):**
```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-U3/*.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-U3-replay/
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-U3-replay
python3 -B verify_direct.py && python3 -B crosscheck_symbolic.py && python3 -B poly_explore.py && \
python3 -B margin_trend.py && python3 -B verify_all_q.py && python3 -B verify_elig_top.py && \
python3 -B verify_fixed_points.py
```
All seven scripts were already run in the foreground during this session (no background jobs were started; none to kill). No wall-clock, PID, or host value is hashed into any digest above.

**ℕ/ℤ audit.** `r_q(k)` and `i_k` are defined `0` for `k<0` (guarded in every generator by an explicit `if k<0: return 0` / range bound, never a truncated `ℕ` subtraction reaching a negative index). `x(T)` is computed as `min{k : Δ_k<0}` scanning `k=0..α` with `Δ_k := i_{k+1}-i_k` computed as an ordinary Python integer difference (unbounded, sign-correct — the Lean definition of record casts to `ℤ` for exactly this reason, `C5LA1.crossingIndex`/`forwardDifferenceDel`, carried by reference, not re-typed here). `m-q`, `b-s`, `p*-2-j` etc. are all guarded by the stated ranges (`q≤m`, `s≤b`, `j≤m`) before use.

**Network instrument requirements (N/A for this route).** This route makes no claim about the transport network, the deletion/switch relation, or a flow; it does not build a graph/flow instrument. The brief's requirements "every instrument asserts `supply−capacity=S` from independent sides and derives `F`" and "acyclicity-and-connectivity tests in code" therefore do not apply to this route's content (they bind `F1`, `U1`, `U2`, and the T-routes' network work). Stated here rather than silently skipped, per the run's own fidelity discipline.

## 7. New candidate claim (alias-checked; not registered — a route proposes, only the controller/synthesis registers)

**Lexical check:** searched all 491 `claim_key` fields plus `aliases`/`statement` text in `sources/authority/CLAIM-IDENTITY.json` for `MARK-CLONE`, `CONDITION-I`, `INTEGER-DESCENT`, `ELIG-TOP`, `DOUBLED`, `PASCAL`, `BINOMIAL`, `MEAN-THRESHOLD`, `CROSSING`, `DARROCH`, `ELEMENTARY`, `RATIO`, `Q=1`. No existing key names an elementary/Darroch-free proof of condition (i) at `q=1`.

**Mathematical check:** the only claim asserting the same conclusion at any grade is `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (§4 item 2) — broader in scope (every `q`) but strictly weaker in dependency grade (`proved_informal` **modulo Darroch 1964**, "a classical theorem not under `sources/`, named … as an undischarged dependency"). My result is narrower (only `q=1`) but removes that dependency entirely for the sub-case it covers. **Not a duplicate; not a re-proof of an already-known identity** (`SOLUTION-CONTRACT.md` §2's "do not substitute already known identities" fence) — it is a dependency-reduction of a registered informal result, at a different, disjoint proof method.

**Proposed candidate (predicate form, `E993-R31-` namespace, STATED here, not registered — needs an isolated second read before registration per `SOLUTION-CONTRACT.md` §4):**

`E993-R31-CB-D8-M-CONGRUENT-2-MOD-3-CONDITION-I-AT-Q-1-AND-RANK-PSTAR-PROVED-BY-ELEMENTARY-PASCAL-RATIO-INTEGER-ARGUMENT-WITHOUT-DARROCH-OR-NEWTON`

*Statement:* For every integer `m≥2` with `m≡2 (mod 3)` (in particular every `m≥107` in the r31 class), with `p*=(16m+4)/3`, `r_1(k):=[y^k](1+y)^7(1+2y)^{8m-7}`: `r_1(p*-1) < r_1(p*-2)`, proved by the finite (9-term) Pascal-ratio reduction of §5.2–5.4, invoking neither Newton's inequalities nor Darroch's theorem (Mathlib's `Nat.choose_succ_right_eq` is the only external fact used). *Scope:* `q=1` only; says nothing about `q>1`, about (ELIG-top)(a), about (HALL), or about any other rank. *Grade proposed:* `proved_informal` (an informal, human/model-checked derivation, cross-verified by two independent exact-integer computational paths, §5.2–5.4 and §6, plus a sorry-free Lean compile of the atomic Pascal-ratio step, §8) — **not** `formally_verified` (the full 8-term sign argument is not itself formalized in Lean this cycle; only its atomic building block is, and compiled scratch carries no grade per the worker brief).

## 8. Lean compile (finite, parameter-free; scratch, no grade)

Set up per the brief: `scratchpad/c1-U3/LeanProject` built from the **byte-copied** `lakefile.toml`, `lake-manifest.json`, `lean-toolchain` of the pinned shared project (`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project`), Mathlib bound by **manual symlink** (`LeanProject/.lake/packages → …/mathlib-v4.32.2-project/.lake/packages`; never copied). Mathlib revision verified against `sources/mathlib-binding/PIN.json` (`905b95818eb32af7874a58b427f50c1711a5e96c`, `leanprover/lean4:v4.32.2`) by the shared project's own `.lake/packages/mathlib` checkout (unchanged; no `lake update`, no `lake clean`, no `elan` invocation). Always `cd`'d into `LeanProject` before every `lake`/`lean` call.

**File:** `scratchpad/c1-U3/LeanProject/Smoke/Basic.lean` (SHA-256 `ff133398885903e086fdd8dfbb88fba89442a051838a79ab82d8d895dd27d246`). Two declarations, both the atomic parameter-free facts behind §5.3–5.4 (no CB/tree definitions needed — genuinely parameter-free integer facts about `2^s·C(b,s)`):

- `E993R31U3.doubledCoeff_succ_mul (b s : ℕ) (h : s ≤ b) : (s+1) * doubledCoeff b (s+1) = 2*(b-s) * doubledCoeff b s` — axioms: `[propext]` only.
- `E993R31U3.doubledCoeff_diff_sign (b s : ℕ) (h : s ≤ b) : (s+1:ℤ)*(doubledCoeff b (s+1) - doubledCoeff b s) = (2b-3s-1)*doubledCoeff b s` — axioms: `[propext, Classical.choice, Quot.sound]`.

Both within Mathlib's permitted classical foundation (the same three axioms named `permitted_axioms` in both Codex `THEOREM-CONTRACT.yaml` files read this cycle, §4/§6). **No `sorry`, no `admit`, no `native_decide`, no additional axiom.** Build log: `lake build Smoke` → `Build completed successfully (8657 jobs)`, run in the foreground (`time lake build Smoke`, ~10s wall), no background process started. `#print axioms` output for both declarations is embedded above verbatim from the build log. These are the atomic Pascal-ratio/sign steps that §5.3–5.4's informal argument composes (by hand, over the fixed 9-term sum) into the full `q=1` result; the composition itself (the degree-8 polynomial sign check) is **not** formalized this cycle — reported honestly as scratch, not a completed formal award (per the worker brief: "a seat's compiled declarations are scratch (no grade)").

## 9. Grades (never upgraded by use)

- This route's own elementary `q=1` result (§5.2–5.4): **`proved_informal`** — a correct, hand-checked, two-way cross-verified (independent computation paths) derivation; not `formally_verified` since the composition (only the atomic step) is compiled in Lean.
- The atomic Lean lemmas (§8): compiled, **sorry-free**, but **scratch — no grade** (per brief item 8; not a governed award).
- Cited inputs keep their registered grades unchanged: `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` `proved_informal`; `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` `proved_informal` (modulo Darroch/Newton, unchanged — this route does **not** discharge that key's own dependency notice; it only supplies a disjoint, dependency-free proof of one of its `q`-instances); `E993-R30-CB-8-M-95-TO-107…` `computer_assisted`; `E993-TREE-REAL-ROOTED` `REFUTED` (never revived, never applied to `I`/`G`/`G^m`).
- The (ELIG-top)(a) block-mixture threshold observation (§5.6): **not a claim, not graded** — an obstruction report only.

## 10. Fences respected

One rank per tree (`p*` only); the r31 class only (`m≥107`, `m≡2 mod 3`, `d=8`); Darroch/Newton were not invoked anywhere in this route's own argument (§5.2–5.4 uses only Pascal's rule and an integer-coefficient polynomial-sign check); no status change asserted for `(HALL)`, the primary aggregate, or any refuted key; no statement about switch arcs, the sector, or the network (§6, N/A note); the struck real-rootedness argument was not reused (§4 item 4); `E993-TREE-REAL-ROOTED` stays `REFUTED`.

## 11. Route verdict

- **Route verdict:** `bounded_evidence` — a complete, correct, dependency-reduced elementary proof for one well-defined, extremal sub-case (`q=1`) of one of the two target facts, plus a precisely-identified (not resolved) obstruction for the other, plus independent exact-integer confirmation at all required test rows, plus a sorry-free (scratch) Lean compile of the atomic step. Not `proved` (neither target fact is closed in full generality by this route) and not `blocked` (real, checkable progress was made and is reported exactly).
- **`headline_resolved: no`** (Tier 1 `formally_verified` at full scope is not this cycle's, nor this route's, product; unaffected by this route).

**Gate lines (ruling 6):**
- `LS_top: not_advanced` (this route's obligation is E1(i)/(ELIG-top)(a), not `(L-S)_top` directly; `ρ_1` is a shared input but no new fact about `(L-S)_top`'s own constraints is asserted here).
- `ELIG_top: advanced` (the block-mixture local-threshold fact of §5.6, `j≥4` descending vs. `j∈{0,1,2,3}` ascending, and the independent-generator confirmation at the fresh/control rows, are new, checkable, named progress — short of a proof).
- `cut_candidate: none`.

## 12. Remaining obligation (successor inheritance)

1. **Extend §5.2–5.4 to `q>1`.** Immediate for any *fixed* constant `q=Q₀` (the identical 8·`Q₀`-term reduction applies verbatim, `a_{Q_0}=8Q_0-1` fixed). Open: `q` growing with `m` (e.g. `q~m/2`). Two named directions, neither attempted: (a) an induction-in-`q` using the fixed "transfer of 8" `(a_q,b_q)→(a_{q+1},b_{q+1})=(a_q+8,b_q-8)` via a Vandermonde/Chu-type identity; (b) an elementary (Darroch-free) proof of just the one-point sign fact needed (weaker than the full mode-bracket theorem).
2. **(ELIG-top)(a): the cross-block magnitude domination.** §5.6 gives the exact, `m`-independent local threshold (`j≥4` blocks individually descend at the target point, `j∈{0,1,2,3}` individually ascend) but does **not** compare the magnitude of the `O(m^3)`-weighted low-`j` terms against the `Θ(2^m)`-weighted bulk. This is `T3`'s (`C1-T-03`) primary load-bearing obligation this cycle; §5.6 is offered as a possibly-useful input to that route or to the Cycle 1 synthesis, not as a substitute for it.
3. **The proposed candidate claim (§7)** needs an isolated second read before registration, per standard workflow.
4. **The Lean composition** (the full 8-term §5.2–5.4 argument as a single Lean theorem, beyond the two atomic lemmas of §8) was not attempted this cycle; a natural Stage-7-style target if `q=1`'s result is funded.

## 13. Background jobs

None started; none to kill. All seven Python scripts and the one `lake build` ran to completion in the foreground within this session.
