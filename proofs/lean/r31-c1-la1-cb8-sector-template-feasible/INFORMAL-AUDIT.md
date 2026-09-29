---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la1-formalizer-opus-20260928
critic_id: c1-la1-opus-informal-20260928
attestation_id: c1-la1-informal-pass-20260928
claim_sha256: 9fdc9ce568b4271462f526288af87cf857f588a5dc798d4ab8800a4c6b3ddc18
---

# Informal Proof Integrity Audit

**Boot acknowledgment.** I am operating within VerityOS. I verified the brief
`control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA1.md` against
`3dc86a4647ecb05d7b4bfbae653e870c34fac16eca9744a5f51afe689c5969a9` (match) before reading it. I then read:
- `verity.md`;
- `identity/startup-protocol.md`;
- `skills/proof-integrity-audit/skill.md`.

Subsystems loaded: the constitution, the startup protocol and the proof-integrity-audit skill. My first boot command failed partway
(zsh read `=====` as an expansion), so I re-read the protocol and the skill in a separate call.

**Model disclosure (two-part):** chartered Claude Opus 5.5 (effort high) on dispatch-record authority; runtime-reported model id
`claude-opus-5-5`. No child agent was used.

**Seat.** Reviewer `c1-la1-opus-informal-20260928` (kind `independent-mathematical-proof-integrity-reviewer`). I am not the artifact
producer. I edited no contract, Lean source, informal proof or receipt. My only writes are under
`scratchpad/c1-s7-informal-LA1/`.

**Run.** `erdos-993-math-dre-20260927-r31-cb-uniform-switch`, award C1-LA1, Lean run root
`runs/lean-2026-09-28-c1-la1-cb8-sector-template-feasible`.

**Identity of the audited objects** (SHA-256 recomputed by me):

| Object | Expected | Observed |
|---|---|---|
| `THEOREM-CONTRACT.yaml` | `e40762f1…cf3d0` | match |
| `INFORMAL-PROOF.md` | `16209c9b…c534c3` | match |
| `LeanProject/LeanProof/Main.lean` | `f0578ed7…b78e` | match |
| capsule `C1-LA1-PACKET-MANIFEST.json` seal (compact key-sorted JSON minus `seal_sha256`) | `b5b37332…99d0` | match; 875/875 members match bytes and SHA-256 |
| `sources/c1-stage7-sources/SOURCE-DIGESTS.json` | — | all 924 listed files match bytes and SHA-256 |
| table of record `ADJ-T/adj_alloc_out.json` | `7d635805…4b13` | match |
| formalizer brief `control/C1-STAGE7-FORMALIZER-BRIEF-LA1.md` | `d16e65a9…fbf3f` | match |

**`claim_sha256`.** I recomputed it as the SHA-256 of the contract's `theorem.informal_statement` with whitespace collapsed
(`" ".join(s.split())`). Result: `9fdc9ce568b4271462f526288af87cf857f588a5dc798d4ab8800a4c6b3ddc18`. It **equals** the value in the
brief.

## Intended Claim

The claim is exactly the contract's `theorem.informal_statement`, and it matches the synthesis section "C1-LA1 (r31)" clause for clause.

Take `m ∈ ℕ` with `107 ≤ m` and `m % 3 = 2`. Put:
- `K := (16m+1)/3`, `L := 200m²+82m+5` and `D := L/3` over ℚ;
- `State8 := {(β,γ) : ℕ×ℕ // β+γ ≤ 8}`;
- `pb m (β,γ) := (25m/2 + B_pb(β,γ))/D` and `pc m (β,γ) := (25m/2 + B_pc(β,γ))/D`, using the 72 intercepts of `adj_alloc_out.json`
  (0 off the table);
- `θ m := 288/L` and `σ m γ := c_γ θ m`, with `c = (1/7,1/3,3/5,1,5/3,3,7/2)`;
- `Out := β pb + γ pc + [β=1 ∧ γ≥1] σ(γ)`;
- `In := (8−β−γ)(pb(β+1,γ) + pc(β,γ+1))` for `β+γ ≤ 7`, and `0` at `β+γ = 8`;
- `r1 m k := Σ_{i=0}^{min(7,k)} C(7,i) C(8m−7,k−i) 2^{k−i}`.

The claim has five conclusions:
- (i) `pb`, `pc` and `σ` are at least 0 on every state.
- (ii) Every `c : Fin m → State8` with leg total `K` has `Σ Out ≥ 1`.
- (iii) Every `c` with leg total `K−1` has `Σ In ≤ 1`.
- (iv) `(8−γ)σ ≤ θγ` for `γ = 1..7`.
- (v) `θ ≤ 1 − r1(K)/r1(K−1)`.

Scope:
- Hypotheses: the class only.
- Fences: template level only; no flow on the literal network, no (HALL), no eligibility, no optimality; the `θ*` law is never a
  hypothesis.
- The terminal Lean declaration `E993Transport.cb8_topRank_sectorTemplate_feasible` has exactly the binders `(m : ℕ) (hm : 107 ≤ m)
  (hm3 : m % 3 = 2)`, which match the class one for one.
- Its conclusion is the conjunction (i) ∧ (ii) ∧ (iii) ∧ (iv) ∧ (v), stated literally. The `expected_statement` in the contract is
  byte-equal to the source text from `theorem` up to but excluding ` :=`, and its SHA-256 is `f9b5bcf5…17d5` (recomputed).

## Claim Ledger

Verdict key:
- **V** means verified with evidence I reproduced.
- **V-L** means I checked it literally against the Lean source.
- **O** is an observation: imprecise, but true under a charitable reading and not load-bearing.

Every hypothesis is named where it enters the argument.

| ID | Claim (INFORMAL-PROOF.md node) | Hypotheses used | Evidence | Verdict |
|---|---|---|---|---|
| D1 | `State8` = pairs with `β+γ ≤ 8`, 45 states | — | Lean `abbrev State8 := {s : ℕ × ℕ // s.1 + s.2 ≤ 8}`; enumerated, 45 | V-L |
| D2 | `B_pb`: 36 cells, `β ≥ 1`, entered literally, default 0 | — | Parsed Lean match arms: string-equal and value-equal to JSON `Bpb` (36 cells), default `0`; cell set = `{β≥1, β+γ≤8}` | V-L |
| D3 | `B_pc`: 36 cells, `γ ≥ 1`, entered literally, default 0 | — | Same for `Bpc` (36 cells) | V-L |
| D4 | `c_γ = (1/7,1/3,3/5,1,5/3,3,7/2)`, 0 elsewhere | — | Lean arms equal JSON `c_gamma`, which equals the synthesis vector | V-L |
| D5 | `pb`, `pc`, `θ`, `σ` as stated (`D = L/3` over ℚ) | — | Lean `cb8Pb`, `cb8Pc`, `cb8Theta`, `cb8Sigma` read literally; the contract's Lean text of record for all 13 definitions is a substring of `Main.lean` | V-L |
| D6 | `Out`, `In` as stated; `8−β−γ` is rational subtraction; `In = 0` at `β+γ = 8` | — | Lean `cb8Out`, `cb8In` read literally: casts precede subtraction, and the guard `s.1.1 + s.1.2 ≤ 7` is on ℕ | V-L |
| D7 | Off-table default cells never enter `Out`/`In` with nonzero weight | — | Computed: every `pb` cell read by `Out`/`In` (`β·pb(β,γ)` with `β≥1`, and `pb(β+1,γ)`) lies in the 36-cell `Bpb` set; likewise for `pc`. So the defaults only affect (i), where they give `25m/(2D) > 0` | V |
| D8 | `r1 m k = Σ_{i≤min(7,k)} C(7,i)C(8m−7,k−i)2^{k−i} = [y^k](1+y)^7(1+2y)^{8m−7}` | — | Lean `cb8R1` read literally (`Finset.range (min 7 k + 1)`). Coefficient identity checked for every `k` at `m = 2, 5, 107, 110` by explicit convolution | V |
| D9 | `cb8OutConst`, `cb8InConst` are proof-only helpers, not in the terminal statement | — | The terminal statement text mentions neither, nor `cb8Bpb`/`cb8Bpc`/`cb8CGamma` directly. They have no contract edge to `conclusion` | V-L |
| N0.1 | `m % 3 = 2 ⇒ 3·K = 16m+1` (ℕ division exact); `(K:ℚ) = (16m+1)/3` | hm3 | Checked for every class `m` in `[107, 5000)`. Lemma `cb8_K_cast` uses only hm3 | V |
| N0.2 | `m = 3p+107`, `p = (m−107)/3`; `K = a+8`, `a = 16p+563`; `n = 8m−7 = 24p+849`; `n−a = 8p+286` | hm, hm3 | Checked on the class grid; `K(107) = 571` | V |
| N1.1 | `D·Out(β,γ) = (25m/2)n + C(β,γ)`, `C = βB_pb + γB_pc + [β=1,γ≥1]·96c_γ`, using `θD = 96` | — (identity for all `m`) | Exact equality on all 45 states at `m ∈ {0,1,2,107,1000,123457}`. Both sides are affine in `m`, so this is an identity | V |
| N1.2 | `D·In(β,γ) = 25m(8−n) + E(β,γ)`; both sides vanish at `n = 8` | — | Same grid, all 45 states | V |
| N1.3 | `C(s) ≥ 5n − 7/2` on all 45 states | — | Exact. 40 tight states. Nonzero slacks: `(0,0)` 7/2, `(0,2)` 96/7, `(0,3)` 42, `(0,4)` 72, `(0,5)` 72. `C(1,7) = 73/2` | V |
| N1.4 | `E(s) ≤ 24 − (5/2)n` on all 45 states | — | Exact. 36 tight states; slack 4 at the nine `n = 8` states | V |
| N1.5 | Slacks equal the table's `out_slack`/`in_slack` | — | All 90 values equal | V |
| N1.6 | Per-state affine bounds `Out ≥ ((25m/2+5)n − 7/2)/D`, `In ≤ (25m(8−n)+24−(5/2)n)/D` | `D > 0` (all `m`) | Follows from N1.1–N1.4 by division by `D > 0`. The direction is preserved | V |
| N2.1 | `(25m/2+5)K − (7/2)m = D` | hm3 (through `K = (16m+1)/3`) | Polynomial identity in ℚ[m]: the difference is the zero polynomial | V |
| N2.2 | `25m(8m−(K−1)) + 24m − (5/2)(K−1) = D` | hm3 | Polynomial identity: zero polynomial | V |
| N3 | Summation over ANY `c : Fin m → State8`: `Σ Out ≥ 1` at total `K`, `Σ In ≤ 1` at total `K−1` | hm3; card `Fin m = m` | Algebra re-derived: the sum of the affine bounds is `(25m/2+5)ΣnᵢD⁻¹ − (7/2)mD⁻¹`, and N2 finishes. Universal in `c`; no enumeration (Lean: `Finset.sum_le_sum`). Independently, an exact DP over all assignments (no affine relaxation) gives `minOut = maxIn = 1` exactly at `m = 107, 110, …, 125, 200, 302`. Random literal assignments (from the definitions as written, 240 trials) were never below 1 or above 1 | V |
| N3.c | `K−1` (ℕ) is not truncated | hm | `K ≥ 571`; cast via `Nat.cast_sub` | V |
| N4 | (i): `B ≥ −50` on all states (min `−689/16` at `B_pc(1,7)`), so `25m/2 + B ≥ 25·107/2 − 50 > 0`; `D > 0`; `c_γ ≥ 0`, `θ ≥ 0` | hm | Minimum over both 45-state lists = `−689/16`. Nonnegativity checked literally at `m = 107` on all states | V |
| N5 | (iv): `(8−γ)c_γ = 1,2,3,4,5,6,7/2 ≤ γ`; multiply by `θ ≥ 0` | — | Exact; also checked literally at `m = 107, 110, 2000` | V |
| N6 | `C(n,k+1)(k+1) = C(n,k)(n−k)`, `k < n`, cast by `Nat.cast_sub`. Instantiated: `X_{j+1}(16p+564+j) = X_j(8p+286−j)` | `a+j < n` (from hm, hm3) | Mathlib `Nat.choose_succ_right_eq (n k) : choose n (k+1) * (k+1) = choose n k * (n - k)` (read in the pinned Mathlib). Instantiation checked with `math.comb` at `p ∈ {0,1,2,7,50,333}` for `j = 0..7` | V |
| N7 | `r1(a+8) = 2^a S1`, `r1(a+7) = 2^a S0`; coefficients `C(7,i)2^{8−i}`, `C(7,i)2^{7−i}` as listed; `ρ_1 = S1/S0` | hm, hm3 (`min 7 (a+8) = min 7 (a+7) = 7`) | Exact equality at the same six `p`. Coefficient lists recomputed | V |
| N8.1 | Telescoping `X_j Π_{s<j}(16p+564+s) = X_0 Π_{s<j}(8p+286−s)` | N6 | Consequence of N6 by induction. Used to build `X_j·Pd/X_0` as integer polynomials | V |
| N8.2 | `((L−288)S0 − L S1)·Pd = X_0·Q(p)`, with `L = 1800p²+128646p+2298579` and `Q` of degree 9 with the ten stated coefficients | N8.1 | Recomputed `Q` by exact integer polynomial arithmetic. It equals the ten coefficients in INFORMAL-PROOF.md and in `Main.lean` digit for digit; all are positive. `L(3p+107)` identity checked | V |
| N8.3 | `X_0 > 0`, `X_j ≥ 0`, `p ≥ 0` ⇒ `S0 > 0`, `X_0 Q ≥ 0`, hence `(L−288)S0 − L S1 ≥ 0` ⇒ `θ ≤ 1 − ρ_1` | hm (`p ≥ 0`), `a ≤ n` | Inference re-derived: divide by `L·S0 > 0`. The ℚ `x/0` convention is not used because `r1(K−1) = 2^a S0 > 0`. Direct exact check of (v) from the definitions at 968 class rows (`107 ≤ m < 3000`, plus `10001, 30002, 100001`) holds everywhere; the minimum margin `(1−ρ_1)/θ` is 34.90, at `m = 107` | V |
| N8.4 | Agreement with C-T1-F's frozen instrument: "`deg_Q = 9`, all ten coefficients of `Q(107+t)` positive; the shift `m = 3p+107` rescales by `3^k`" | — | Degree and positivity agree with `crit_t1f_residual_out.json`. The exact relation is `Q(p) = 2·Q_{C-T1-F}(107+3p)` (constant term `2·6868427157766954030053902400`, leading `2·(8589934592000/2187)·3⁹`). It is also exactly C-T1-U's `G(107+t)` at `t = 3p` (`q_k = G_k 3^k` for all k). The factor 2 is not mentioned | O (see Critic pass, item 1) |
| C | Composition: `cb8_sectorTemplate_nonneg_out_in_switch` gives (i)–(iv); `cb8_sectorTemplate_residual` gives (v); the terminal is their conjunction | hm, hm3 | Read the Lean: the terminal destructures the lemma and appends the residual; no extra hypothesis | V-L |
| X | ℕ-subtraction and cast audit table | — | Every row re-checked: `(16m+1)/3` exact (hm3); `K−1` with `K ≥ 571`; `8m−7` with `m ≥ 107`; `k−i` with `i ≤ min(7,k)`; `n−k` with `k < n`; `8−β−γ` and `8−γ` over ℚ; ℕ sums cast by `push_cast`; ratio denominator positive; `L > 0` for every `m` | V |
| R-num | Numeric claims in FORMALIZER-REPORT.md | — | The eight `#eval` spot values (`evalcheck.out`) equal my recomputation. `θ = 96/766193, 96/809675, 96/854357` at 107/110/113 (quoted from the adjudication) recomputed. The Switch slack `7/2` at `γ=7`, the 40/36 tight counts and the minimum `−689/16` all recomputed | V |

## Reproduced Mathematical Evidence

All scripts are my own and written for this audit. They use the standard library only; no prior evaluator is imported. The explicit
import list is `json`, `hashlib`, `re`, `sys`, `random`, `math.comb`, `fractions.Fraction`. No wall-clock field appears in any hashed
output. Everything ran in the foreground.

| File (`scratchpad/c1-s7-informal-LA1/`) | SHA-256 |
|---|---|
| `audit_la1.py` (81 checks) | `d16e67cbfecae02271cfa3af5bb190da61951a5858d00e5d71891fa7818ce096` |
| `audit_la1_out.json` (canonical compact key-sorted) | `8ff488880dc45bdee8aae3ae7c7fc4edba457fe2c8be456327e8a411f1bb8dd6` |
| `spot_la1.py` (eval spot values; attribution and fences on both faces) | `bce3b922fdd866dc0f60b3be336fe9f02b159ca25260d7a5b0f69972ea1a6b58` |

Command: `PYTHONDONTWRITEBYTECODE=1 python3 -B audit_la1.py` gave **81 checks, 0 failures** in 82 s. `spot_la1.py` gave all true.

**Key integer statements verified exactly:**
- The 45 + 45 per-state inequalities (N1.3, N1.4).
- The two aggregate identities as zero polynomials in ℚ[m] (N2).
- `Q(p)` recomputed from the telescoped product formulas, integer coefficients:
  `[13736854315533908060107804800, 3485757943832316875116853760, 393116201147170279914011136, 25861741787599751845613568,
  1093718124274605922197504, 30836007270585567805440, 579583454459211546624, 7003008881186045952, 49359024738533376, 154618822656000]`.
  All are positive, and the list is identical to the proof's and to the Lean literal.
- `S0·Pd/X_0` has nonnegative coefficients and a positive constant term.

**Behaviour outside the stated hypotheses:**
- **`m % 3 = 2` is necessary for (ii)/(iii) as stated.** With `K = ⌊(16m+1)/3⌋` off the class, the exact DP over all assignments gives:

  | m | m mod 3 | min Σ Out | max Σ In |
  |---|---|---|---|
  | 108 | 0 | 2340306/2341661 < 1 | 4688727/4683322 > 1 |
  | 109 | 1 | 2382408/2385143 < 1 | 2390598/2385143 > 1 |
  | 111 | 0 | 4943829/4946614 < 1 | 4952169/4946614 > 1 |
  | 112 | 1 | 2515179/2517989 < 1 | 2523594/2517989 > 1 |

  Both bounds fail. N2 is an identity only because `3K = 16m+1`.
- **Sharpness inside the class.** `min Σ Out = 1` and `max Σ In = 1` exactly at every tested class row, so neither bound can be
  improved. Out is tight at `(1,7)` (slack 0), which pins `c_7 = 7/2` from below.
- **`m ≥ 107` is a class boundary, not a sharp threshold, and the record does not claim it is sharp.**
  - Nonnegativity (i) needs `m ≥ 689/200`: `pc(1,7) < 0` at `m = 2, 3` and `> 0` at `m = 4`. It fails at the residue-2 member
    `m = 2`.
  - (v) holds at every residue-2 `m` from 5 to 104 and fails at `m = 2`. Consistently, `Q(p) > 0` for `p = −1..−34` and `Q(−35) < 0`
    (`p = −35` is `m = 2`).
  - The claim asserts nothing below 107, so none of this is a defect.

## Independent Critic Pass

I ran this as a separate pass over my own ledger, attacking each closed row.

1. **N8.4 (cross-reference wording).** INFORMAL-PROOF.md says C-T1-F's certificate "rescales the coefficients by the positive powers
   `3^k`". The exact relation is `Q(p) = 2·Q_{C-T1-F}(107+3p)`, so `q_k = 2·3^k·[t^k]Q_{C-T1-F}(107+t)`.
   - The reason: C-T1-F's `E_j` equals `X_j·Pd/X_0` here, while its `A`, `B` carry `2^{7−i}`, `2^{6−i}`, i.e. `S1`, `S0` halved.
   - I confirmed this on the constant and leading coefficients C-T1-F records.
   - The constant factor 2 is omitted from the remark.
   - The sign and degree statements, which are the only content the remark carries, are correct.
   - The remark is a provenance note and no inference depends on it. The proof's own `Q` is recomputed exactly (N8.2) and matches
     C-T1-U's `G` exactly.
   - Classification: imprecise but true under a charitable reading, not load-bearing. **Not a defect of the proof.**
2. **Default-0 cells (D7).** Could the defaults hide a missing intercept that `Out`/`In` actually read? No. The set of cells read with
   nonzero weight is contained in the 72-cell table (computed). Could (i) be vacuously weakened? No. Every table cell `(β,γ)` is itself
   a `State8` element, so (i) covers all 72 real cells. The defaults add only the harmless extra cells `pb(0,γ)` and `pc(β,0)`.
3. **Direction of the summation step (N3).** A lower bound on each `Out` summed with `Σ nᵢ = K` gives a lower bound. An upper bound on
   each `In` summed with `Σ nᵢ = K−1` gives an upper bound. States `(0,0)` (`Out = 0 ≥ −7/(2D)`) and `n = 8` (`In = 0 ≤ 4/D`) are
   covered by N1.3 and N1.4, which include them. The exact DP, which uses no relaxation, confirms the extremes are exactly 1.
4. **ℕ artifacts.**
   - The leg-total hypotheses in (ii)/(iii) are ℕ equalities, and so is the claim ("Σ_i (b_i+g_i) = K"), so they agree.
   - `(16*m+1)/3 − 1` cannot truncate on the class.
   - In `cb8R1`, `k − i` is never truncated inside the summation range.
   - `8*m − 7` is exact for `m ≥ 1`.
   - No hidden ℕ subtraction occurs in `In` or Switch: both are cast before subtracting.
5. **Residual inference chain (N8.3).** Dividing `(L−288)S0 − L S1 ≥ 0` by `L·S0 > 0` gives `(1 − 288/L) − S1/S0 ≥ 0`, which is (v)
   after N7. `Pd > 0` is needed to cancel it from `X_0 Q = (…)·Pd`; it holds for `p ≥ 0`. `X_0 = C(24p+849, 16p+563) > 0` needs
   `16p+563 ≤ 24p+849`, which holds. No step uses Darroch, Newton or log-concavity.
6. **Hypothesis accounting.**
   - hm enters in N0.2 (`p ≥ 0`), N3.c, N4 and N8.3.
   - hm3 enters in N0.1, N2 (through `K`), N3 and N0.2.
   - The Lean terminal has no other hypothesis, and the contract's two hypotheses are verbatim binders.
7. **Dependency hygiene.**
   - `Main.lean` imports only `Mathlib`. It has 33 in-run entries (all marked "authored in-run") and no carried entry.
   - The 33 Snippet fragments are byte-identical to `DRAFTS/fragments/`.
   - Nothing marked "not a dependency" is one: the r30 and first-interior awards are absent, the network bridge S3 is absent (no
     graph, no flow, no Hall object in the source), and `cb8OutConst`/`cb8InConst` are absent from the statement.
   - R1: the synthesis says "Carried fragments. None", so the carry check is vacuous and no r30 `Snippets/` comparison applies.
8. **Tactic hygiene (R2).** `Main.lean` contains no `sorry`, `admit`, `native_decide`, `decide` or `axiom`. The finite splits are
   `interval_cases` over `β,γ ≤ 8` (the 45 states, with the out-of-range cases closed by `omega`) and over `γ ∈ [1,7]`. Nothing ranges
   over `m`, `p`, `c`, `a` or `j`. The only `decide` I found is in `DRAFTS/EvalCheck.lean`, a scratch `#eval` file outside the project.

The critic pass found no defective step. The ledger stands: every row is V or V-L, and one row is O.

## Scope and Fence Check

**Excluded conclusions.** From the synthesis and from brief §2: (H), (HALL), eligibility, any statement at other `m`, residues, ranks or
`d`, and uniqueness or optimality of the allocation.
- The claim asserts none of them. It is pure ℚ/ℕ arithmetic about defined closed forms on the class.
- `θ = 288/L` enters as a definition, never as a hypothesis or an optimum.
- No network, flow or Hall object is defined or concluded.
- The informal statement's remark "(= 1 − ρ_1, K = p*−1)" identifies the right side of (v) with the synthesis's S2 object. It is not a
  fenced conclusion.

**Fences on the face.**
- The contract's scope text carries every fence: template only, NOT a flow on the literal network, NO (HALL), S3 informal and not
  formalized, NO eligibility, one rank `p*`, the class only, no optimality, `θ*` law never a hypothesis. It also states the excluded
  conclusions and that no grade is asserted for any companion lemma.
- INFORMAL-PROOF.md carries the same fences and excluded conclusions on its face. Both were checked programmatically (`spot_la1.py`).

**Attribution on the face.** The synthesis list is present in both the contract's `informal_statement` and INFORMAL-PROOF.md:
- allocation: r31 T1 (seat of origin), independently C-F2-U and C-F1-T;
- Residual: C-T1-F and C-T1-U, with C-F1-T, C-F2-T and C-F2-U;
- table shipped by C-T1-U and the T adjudicator;
- template method and certificate: r30, the Cycle 6 certificate method of record and its named seats as registered;
- mechanism, weight, relation and (HALL): Codex GPT-6's lower-region run;
- Lean: the Stage 7 seat, formalizer `c1-la1-formalizer-opus-20260928` (Claude Opus 5.5).

**Repairs carried in.**
- The table of record is `adj_alloc_out.json`, not T1's generator output: `CAPSULE-VERIFICATION.json` records
  `t1_generator_output_used: false`, and the Lean arms equal the JSON literally.
- Out-of-class literals ("for every `m ≥ 4`", "FOR-EVERY-M") appear nowhere on either face.
- No `formally_verified` grade is claimed.

**Read-boundary disclosures.**
1. The harness injected the project `CLAUDE.md` and the user memory index into my context. I used neither. I wrote no conversation log,
   because the brief confines my writes to `scratchpad/c1-s7-informal-LA1/`.
2. A names-only `ls` of the run's `scratchpad/`, to confirm my output directory existed, printed the sibling seat directory names. I
   opened none of them.
3. Within the Lean run root I also read `DEPENDENCIES.yaml`, `DRAFTS/gen_table.py`, `DRAFTS/evalcheck.out` and the `#eval` lines of
   `DRAFTS/EvalCheck.lean`, all cited by the report or contract as generators and outputs. I also read `EVIDENCE/axioms*.txt` and
   hashed the Snippets and fragments.
4. From `sources/c1-stage7-sources/` I read `C-T1-U/own/crit_residual_out.json` and `C-T1-U/own/crit_alloc_out.json` (key names only),
   as frozen instrument outputs, after digest verification. I imported no code from them.
5. The harness saved two oversized outputs (the `Main.lean` print and the manifest print) to its own tool-results files. I did not read
   those files back: I read `Main.lean` from its source path and parsed the manifest programmatically.
6. One grep inside the pinned Mathlib package (`Mathlib/Data/Nat/Choose/Basic.lean`) for `choose_succ_right_eq` and `choose_pos`.
7. No network, no installs, no Lean invocation, no `lake`, no background job, no process killed.

## Verdict

passed

`INFORMAL-PROOF.md` is a complete, correct statement-level proof of the contract's `informal_statement` (claim SHA-256
`9fdc9ce568b4271462f526288af87cf857f588a5dc798d4ab8800a4c6b3ddc18`):
- Every definition matches the Lean source literally, and the 72 intercepts equal the table of record.
- Every inference step and every ℕ-subtraction and cast was checked.
- Every numeric claim was recomputed exactly: the 90 state inequalities, both aggregate identities as polynomial identities, and the
  degree-9 certificate `Q` digit for digit.
- The terminal's hypotheses match the class one for one.
- No fenced conclusion is asserted, and the synthesis attribution travels on both faces.

One non-load-bearing imprecision is recorded (N8.4: the cross-reference to C-T1-F omits a constant factor 2). It does not affect the
proof.

Attestation id: `c1-la1-informal-pass-20260928`. Reviewer `c1-la1-opus-informal-20260928`; producer
`c1-la1-formalizer-opus-20260928`.

Model disclosure (two-part): chartered Claude Opus 5.5 (effort high) on dispatch-record authority; runtime-reported model id
`claude-opus-5-5`.
