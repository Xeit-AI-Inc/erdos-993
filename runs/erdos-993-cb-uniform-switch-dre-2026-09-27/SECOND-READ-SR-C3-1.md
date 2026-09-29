# Second Read

Operating within VerityOS. Boot read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`; no other VerityOS file was read.

Read `SR-C3-1` of r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`), Cycle 3: E1 clone-level exactness (the exact domain, the
degenerate columns, the `ℓ = 0` boundary, nonnegativity) and the class instance of the frozen C3-LA1 terminal. Reader: Claude Opus 5.5,
isolated, 2026-09-28. The protocol is `control/C3-SECOND-READ-PROTOCOL.md` and the brief is `control/C3-SECOND-READ-BRIEF-SR-C3-1.md`.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Protocol digest.** SHA-256 `1eb6aa33f05fef770cbd571e1f39fa5ea9a5329e4c5f05dd5d961764c40753cc`. It matches the dispatch.
- **Brief digest.** SHA-256 `9ac33b9400b59d7575621a21886b39434b25988d439218acd58c48544249c2ed`. It matches the dispatch.
- **Capsule seal.** `control/c3-second-read/SR-C3-1-PACKET-MANIFEST.json`, stage `cycle-3-second-read-SR-C3-1`, 498 members. The
  recomputed seal is **`0068a939451f18b4078e3ec64c9560522c24b0c37a169190e6248305a9693ab4`**: SHA-256 of the compact, key-sorted JSON of
  the manifest minus `seal_sha256`, with no trailing newline. It equals the stated seal. The manifest file's own byte digest is
  `fe9322a5…35db`; it is not the seal and is not compared.
- **Members.** All 498 listed digests and byte counts match. There are 0 mismatches and 0 missing files.
- **Source digests.** Every capsule member under `sources/` also matches its directory's `SOURCE-DIGESTS.json`:

  | Directory | Members matched |
  |---|---|
  | `sources/c1-results/` | 218/218 |
  | `sources/c2-results/` | 1/1 |
  | `sources/c3-stage7-sources/` | 179/179 |
  | `sources/concurrent/` | 1/1 |
  | `sources/r30/` + `sources/authority/`, via `sources/SOURCE-DIGESTS.json` | 65/65 |

- **Carried files the terminal relies on.** C1-LA1 `Main.lean` is `f0578ed7ce7f51f695d410cdbd1265d7071d40f40832635ed12d3dade6c9b78e` and
  C1-LA3 `Main.lean` is `c0605e12b91375ede9fb72cb9af428a96d9b6a7d678b856b0131f9c7b10f3011`. Both equal the synthesis's carry digests. The
  entry markers 11 (`cb8R1`, `2efd2823…`) and 1/5/14/15/17/18/20 carry the digests the synthesis lists.

**Read-boundary disclosures.**
1. `grep -rn "def cb8R1" sources/c1-results/runs --include=Main.lean` scanned one non-member file for that pattern:
   `sources/c1-results/runs/lean-2026-09-28-c1-la2-cb8-definition-layer/LeanProject/LeanProof/Main.lean`. It did not match and no
   content of it was displayed.
2. To audit item 1, I made a names-only walk of the directories I had grepped or listed. `sources/c1-results/runs` holds 230
   non-member names; I saw five of them, all C1-LA2 run records (`CAPSULE-VERIFICATION.json`, `INFORMAL-PROOF.md`,
   `FORMALIZER-REPORT.md`, `THEOREM-CONTRACT.yaml`, `FIDELITY-REVIEW.md`). The `T1`, `T2`, `crit-T1-U`, `crit-T2-F` and `crit-T2-U`
   directories under `sources/c3-stage7-sources/` hold no non-member file.
3. `ls` of those five `sources/c3-stage7-sources/` directories printed member names only.
4. `mkdir -p` of `second-reads/SR-C3-1/` and `scratchpad/c3-sr-SR-C3-1/` created my two write locations. I made no listing of
   `second-reads/`.
5. The harness injected the user auto-memory index into context. It was not used.
6. The repository's conversation-logging instruction was not executed: this seat's protocol permits exactly one output file plus
   scratch.

**Discipline.**
- No Mathlib read was needed.
- There was no `lake`/`lean`, network, install, child agent or background job, and nothing was killed.
- Python ran as `python3 -B`, standard library only, with exact `int`/`Fraction`.
- No seat, critic, adjudicator or controller instrument was run, imported or copied. Their outputs are not cited as evidence.
- The controller's alias pre-screen was not used.

## Statements read

Statement of record: `cycles/cycle-3/stage6/SYNTHESIS.md`. From it I read:
- `## Exact established results` (Y-1, Y-2, Y-3, Y-14, B-1 (vii));
- `## Refuted or narrowed mechanisms`;
- the C3-LA1 section (frozen definitions, the frozen terminal `cb8_E1_cloneTransport_topRank`, the companion `e1_cloneTransport`,
  informal DAG steps 1–9, hypotheses, fences, attribution);
- `## Registrations` (G-1, G-2, the second-read list);
- the reconciliation item R-5.

Origins read:
- the F3 return;
- C-F3-T ((R1)–(R4));
- C-F3-U (A1, items 1–5 and the Consequence);
- the T adjudication (T1 and T2 decisions, `## Established results`, Group T-A);
- the frozen T2 and C-T2-F Lean text (`Sterm`, `Tterm`, `rz`, `likelihood_ratio`, `cb8_typePath_ii1`, `critF_cb8_typePath_ii2`,
  `critF_cb8Rho1_eq_c1la1_ratio`);
- C-T2-U's `critic_cb8R1_rho1_lt_one_LA1form`;
- C1-LA1 entry 11 and C1-LA3 entries 14, 15, 17, 18 and 20;
- SR-C2-2 (`## Findings and repairs`, `## Registration text`, `## Verdicts`);
- the criterion key's record in all three registries;
- `SOLUTION-CONTRACT.md` (§3 fences, §4 grades);
- the Stage 5 and Stage 6 controller facts (as facts only).

| Id | Statement (the brief's wording, abbreviated) |
|---|---|
| SR-C3-1a | Exactness. For `1 ≤ j ≤ a+b+1`, the rows `e1G(α+1) + e1H(α) = ρ·e1T(α)` (`α < a`) and `e1H(a) = ρ·e1T(a)`, the column identity for `e1T α > 0` in all four sub-cases of step 8 (including `ℓ = b` and `α = a`), `e1G 0 = 0`, and `j ≤ a ⇒ e1G j = e1S j ∧ e1H j = 0`, under Lean conventions. This includes Y-1, Y-14 and E-1. |
| SR-C3-1b | Nonnegativity. `e1G ≥ 0` and `e1H ≥ 0` for every `α ≤ a`, by the monotone ratios with the zero-extension boundary handled, or via TP-g/TP-h from carried entry 15. No Newton, no Darroch. |
| SR-C3-1c | The class instance. At `a = 8q−1`, `b = 8(m−q)+1`, `j = p*−q`, `1 ≤ q ≤ m`: the domain holds, `ρ < 1` (entry 20 through the coefficient bridge), and the `q = 1` link to C1-LA1's `cb8R1` syntax. Checked by my own exact instrument, every `q` and `α`, fresh rows and controls. |
| SR-C3-1d | Registration text. G-1 (the formal clause, only on C3-LA1's close) and G-2 (the informal note) on the homogeneous criterion key. |

## Independent re-derivation

**Notation.** `S_α := e1S a b j α` and `T_α := e1T a b j α`, zero-extended exactly as frozen. `ΣS`, `ΣT` are sums over `α ∈ [0, a]`.
`Sc(α)`, `Tc(α)` are the strict prefix sums, `ρ := ΣS/ΣT`, `g_α := e1G`, `h_α := e1H = S_α − g_α`. `C(a, α) = 0` for `α > a`, so every
`S_i`, `T_i` with `i > a` is 0 and prefix sums past `a` equal the totals. For registration I use SR-C2-2's lower-case `g`, `h` and
`ℓ := j − α` (see finding 5).

**D1 — domain and the bridge.**
- `ΣS = [y^j](1+y)^a(1+2y)^b` and `ΣT = [y^{j−1}](…)` for `j ≥ 1`, by the Cauchy product. The guard `α + 1 ≤ j` is exactly
  `α ≤ j − 1`.
- The coefficients of `(1+y)^a(1+2y)^b` are positive exactly on `[0, a+b]`, so `ΣT > 0 ⟺ 1 ≤ j ≤ a+b+1`. Hence `ρ·ΣT = ΣS` on
  the domain.
- **At `j = 0`.** `ΣT = 0`, so `ρ` is undefined informally and `0` in Lean. `ΣS = S_0 = 1`.
- **At `j > a+b+1`.** Every `S_α`, `T_α` is 0 (for `α ≤ a`, `j − 1 − α ≥ b + 1`), so every conjunct reads `0 = 0` or `0 ≤ 0`.

**D2 — rows, top, `g_0`, and `j ≤ a`.**
- **Rows.** `g_{α+1} + h_α = ρ(Tc(α)+T_α) − Sc(α) − S_α + S_α − ρTc(α) + Sc(α) = ρT_α`, for every `α` and any `ρ`. This is pure
  telescoping.
- **Top.** `h_a = Sc(a+1) − ρTc(a) = ΣS − ρ(ΣT − T_a) = ρT_a`. This uses `ρΣT = ΣS`, so it needs `ΣT ≠ 0`.
- **`g_0 = 0`.** The sums are empty.
- **`j ≤ a`.** `T_i = 0` for `i ≥ j` and `S_i = 0` for `i > j`, with every `i < j` inside `[0, a]`. So `Tc(j) = ΣT` and
  `Sc(j) = ΣS − S_j`, giving `g_j = S_j` and `h_j = 0`.

**D3 — absorption.**
- **Boolean.** `(α+1)S_{α+1} = (a ∸ α)T_α` holds for **every** `α ∈ ℕ` under zero extension. From `(α+1)C(a,α+1) = (a−α)C(a,α)`, both
  sides share the factor `C(b, j−1−α)2^{j−1−α}` and the guard `α + 1 ≤ j`. For `α ≥ a` both sides are 0.
- **Ternary.** For `α + 1 ≤ j`, write `ℓ' := j−1−α`. Then `(j−α)S_α = 2(b ∸ ℓ')T_α`, from `(ℓ'+1)C(b,ℓ'+1) = (b−ℓ')C(b,ℓ')`; for
  `ℓ' ≥ b` both sides are 0.

**D4 — columns.** Fix `α ≤ a` with `T_α > 0`. Then `α + 1 ≤ j` and `ℓ' ≤ b`. Every ℕ subtraction in the frozen column is exact here:
`a − α` under `α < a`; `j − 1 − α` from `α + 1 ≤ j`; `b − ℓ'` under `ℓ' < b`; `j − α ≥ 1`.
- **Case `α < a`.** `(α+1)S_{α+1} = (a−α)T_α > 0`, so the Boolean term is `g_{α+1}/T_α`.
- **Case `ℓ' < b`.** `(j−α)S_α = 2(b−ℓ')T_α > 0`, so the ternary term is `h_α/T_α`.
- **Case `ℓ' = b`.** For `i < α`, `j−1−i > b` and `j−i > b+1`, so `S_i = T_i = 0`. Also `S_α = C(a,α)C(b,b+1)… = 0`. Hence
  `Sc(α) = Tc(α) = 0` and `g_α = h_α = 0`. The `if` drops the ternary term, which is faithful because there are `2(b − ℓ') = 0`
  ternary up-covers.

Assembly by sub-case:
- `α < a`, `ℓ' < b`: `(g_{α+1}+h_α)/T_α = ρ` by D2.
- `α < a`, `ℓ' = b`: `g_{α+1}/T_α = (g_{α+1}+h_α)/T_α = ρ`.
- `α = a`, `ℓ' < b`: `h_a/T_a = ρ` by the top identity.
- `α = a`, `ℓ' = b`: the sum is 0, and `j = a+b+1`, so `ΣS = 0` and `ρ = 0`.

The per-clone inflow in the frozen column is the key's type-symmetric transport per target clone: `(a−α)` Boolean up-covers at
`g_{α+1}/((α+1)S_{α+1})` each, and `2(b−ℓ')` ternary up-covers at `h_α/((j−α)S_α)` each. That is the [r31 C2; SR-C2-2] note's (3)
divided by nothing, since it is already per clone. It is also C-F3-U A1(3)'s per-target load `ρ·(α+1)` divided by `w_F(A) = α+1`.
R-5 is right that these are the same content.

**D5 — nonnegativity (SR-C3-1b).** Multiply by `ΣT > 0`. Splitting at `α` and cancelling the pairs below `α`:
- `ΣT·g_α = Σ_{i<α≤k≤a}(S_kT_i − S_iT_k)`.
- `ΣT·h_α = S_0·Σ_{k≥α}T_k + Σ_{i<α≤k≤a}(U_iT_k − T_iU_k)`, with `U_i := S_{i+1}` and `U_a = 0`.

Summands, for `g`:
- If `T_i, T_k > 0`: both `i, k < j` and `ℓ_i, ℓ_k ≤ b`. `S_i/T_i = 2(b−j+1+i)/(j−i)` is nondecreasing in `i` (numerator up,
  positive denominator down), so `S_kT_i ≥ S_iT_k`.
- If `T_k = 0 < T_i`: the summand is `S_kT_i ≥ 0`.
- If `T_i = 0` and `i < j`: then `ℓ_i > b` or `i > a`, so `S_i = 0` and the summand is `S_kT_i = 0`.
- If `T_i = 0` and `i ≥ j`: then `k > i ≥ j`, so `T_k = 0` and the summand is `0`.

  The synthesis's step 9 states only the `i < j` half of the zero case; see finding 2.

Summands, for `h`: by D3, `U_i = (a ∸ i)T_i/(i+1)` for every `i`. So the summand is **identically**
`T_iT_k·((a∸i)/(i+1) − (a∸k)/(k+1))`, which is `≥ 0` because `i ↦ (a∸i)/(i+1)` is nonincreasing. There is no zero case at all.
Also `S_0 ≥ 0`.

The TP route is also valid:
- TP-g at `α−1` is `ΣT·Sc(α) ≤ ΣS·Tc(α)`, which is `g_α ≥ 0` for `1 ≤ α ≤ a`; `g_0 = 0`.
- TP-h at `α` is `ΣS·Tc(α) ≤ ΣT·Sc(α+1)`, which is `h_α ≥ 0`.
- `likelihood_ratio` (TP-g) uses entry 15 at `a = 0`, and C-T2-F's TP-h uses entry 15 at `b = 0`. Entry 15 is proved by induction on
  linear factors.

I also re-derived C-F3-T's (R3) factorizations and C-F3-U's A1(5) equivalences; both are correct. None of these routes uses Newton or
Darroch.

**D6 — the class instance (SR-C3-1c).** Take `a = 8q−1`, `b = 8(m−q)+1`, `j = p*−q`, so `a+b+1 = 8m+1`. `m ≡ 2 (mod 3)` makes `16m+4`
and `13m+4` divisible by 3.
- **Domain.** `j ≥ p*−m = (13m+4)/3 ≥ 465` for `m ≥ 107`, and `j ≤ p*−1 = (16m+1)/3 ≤ 8m+1`. The domain needs only `1 ≤ q ≤ m`
  and `1 ≤ m`.
- **Conjunct 2 (the coefficient bridge).** It holds by D1.
- **Conjunct 3 (`ρ < 1`).** Entry 20 gives `coeff(p*−q) < coeff(p*−q−1)`, with the same ℕ index text `(16 * m + 4) / 3 - q - 1`.
  Entry 14 gives `coeff(j−1) > 0` at `j−1 ≤ a+b`. So `ρ < 1`.
- **Conjunct 1.** At `q = 1`, `j = (16m+4)/3 − 1`, and `(16m+4)/3 − 1 = (16m+1)/3` holds **for every `m ∈ ℕ`** (`(n+3)/3 = n/3 + 1`).
  `8·(m−1)+1 = 8m−7` needs `1 ≤ m`. `Σ_{α≤7, α≤k} C(7,α)C(8m−7,k−α)2^{k−α}` is `cb8R1 m k` term for term (`range (min 7 k + 1)`),
  and the `e1T` total is `cb8R1 m (k−1)` term for term (`α+1 ≤ k ⟺ α ≤ k−1`, `k ≥ 1`). So numerator and denominator are
  equal, not only the ratio.
- **Hypotheses.** `hm`/`hmod` are used only through entry 20 (`hm` also supplies `1 ≤ m`).

No `M_0`, no remainder, no asymptotic step. The endpoint `m = 107` and the endpoints `q = 1`, `q = m` are inside the checks.

**D7 — Y-14.**
- `j = α + ℓ` with both in ℕ, so `α = ℓ = 0 ⟺ j = 0`. With `j := p − q` in the integers, `j = 0 ⟺ p = q`.
- At `j = 0`, `r_q(−1) = 0`, so `ρ_q` is undefined, and condition (i) reads `1 ≤ 0`.
- On the class, `p* − q ≥ (13m+4)/3 ≥ 465`. This is correct. It is already implied by the key's scope sentence "it forces
  `p ≥ m + 1`" and by the [r31 C2; SR-C2-2] note's item (1); see finding 4.

**My instrument** (own transcription of the frozen text under Lean conventions: ℕ truncation, `x/0 = 0`, `Nat.choose` = 0 above `n`):

| Check | Scope | Result |
|---|---|---|
| Generic (`sr1_generic.py 20`) | every `a, b ≤ 20`, every `j ∈ [0, a+b+3]`; all six per-`(a,b,j)` conjuncts of the companion | domain `1 ≤ j ≤ a+b+1`: **9,261 triples, 0 failures**. `j > a+b+1`: 882 triples, 0 failures (Lean conventions make everything 0). `j = 0`: the top row fails at 441/441, the `j ≤ a` clause at 441/441, nonnegativity at 420/441 (exactly `a ≥ 1`); rows, `g_0`, columns (vacuous) hold |
| Proof steps (same run) | absorption (136,563 + 94,101), both decompositions (118,041 each), both ratio monotonicities and their closed forms (9,261 each), the zero pattern `T_i = 0, i < j ⇒ S_i = 0` (40,740), `ℓ' = b` lower vanishing (4,851), `α = a ∧ ℓ' = b ⇒ j = a+b+1, ρ = 0` (441), TP-g/TP-h (118,041 each), `ρ` against coefficients from an independent polynomial product (9,261), the positivity used in D4 (48,510 each) | **0 failures** |
| Column sub-cases exercised | generic 44,100; `α = a` 4,410; `ℓ' = b` 4,410; both 441; `j ≤ a` 4,410 triples | all four step-8 branches live |
| Mutant (liveness) | `e1T` with its guard removed (T1's truncated form), `a, b ≤ 6` | fails at 147 triples (first `(1,0,1)`: the `j ≤ a` clause and a column) |
| Class (`sr1_class.py`) | **every `q ∈ [1, m]` and every `α ∈ [0, a]`**; polynomial coefficients by linear-factor multiplication and exact division by `(1+2X)` (no binomial formula); `cb8R1` transcribed from entry 11; all three terminal conjuncts plus entry-20/entry-14 facts | controls 107, 110, 113, 116, 119, 122; **fresh 125, 128, 140**; further 131, 134, 137, 143, 146, 152, 200, 302: **0 failures** in every conjunct at all 17 class rows (1,531,248 `α`-checks); `ρ_q < 1` at every `q`; `argmax_q ρ_q = 1`; `min j = (13m+4)/3` (465 at 107, 543 at 125, 556 at 128, 608 at 140); the degenerate classes occur at every class row (`α = a`, `ℓ' = b`, `j ≤ a` at 63/67/44 values of `q` at `m = 107`) |
| Cross-validation (`sr1_misc.py`) | the literal `Fraction` path against the cleared-integer path at `m = 107, 125`, every `q`; `(16m+4)/3 − 1 = (16m+1)/3` for every `m ≤ 20000`; the class integrality, bound and `j`-range facts for all 6,632 class `m ≤ 20000` | 0 failures |
| Off-class probes (flagged; no claim) | `m = 104, 108, 109` | 0 failures. The class hypotheses are sufficient for the proof, not shown necessary |

All of this is `bounded_computation` for corroboration. The universal content is D1–D7.

## Findings and repairs

1. **The mathematics of Y-1, E-1 (C-F3-T (R1)–(R4), C-F3-U A1(1)–(5)), the synthesis's step 1–9 DAG and Y-14 is correct.**
   - The frozen companion and terminal are true under Lean conventions.
   - Every ℕ subtraction is guarded or proved safe:
     - `j − α` sits under `α ≤ j`;
     - `j − 1 − α` sits under `α + 1 ≤ j`, and inside the column under `0 < e1T α`;
     - `a − α` sits under `α < a`;
     - `b − (j−1−α)` sits under `j−1−α < b`;
     - `8q − 1` is safe by `1 ≤ q`, and `m − q` by `q ≤ m`;
     - `(16m+4)/3 − q − 1` is safe because `j ≥ 1`;
     - `8m − 7` is safe by `1 ≤ m`.
   - Every `x/0 = 0` site is either unreachable (D4) or evaluates to the intended 0 (`j > a+b+1`).
   - The `if` guards equal "up-cover count nonzero", so they hide no weakening.
2. **Step 9's zero case is incomplete as written; this is a repair to the face paragraph.**
   - "`T_i = 0` forces `S_i = 0` below `j`" omits the pairs with `j ≤ i < α ≤ k`, where `S_j` may be positive. Those pairs vanish
     because `T_k = 0` for `k > i ≥ j`.
   - Add the sentence: "if `T_i = 0` and `i ≥ j`, then `T_k = 0` too (`k > i ≥ j`), so the summand is 0."
   - For `h`, the argument is zero-safe once written as `U_iT_k − T_iU_k = T_iT_k((a∸i)/(i+1) − (a∸k)/(k+1))`, using the Boolean
     absorption at every index.
   - This is the step the synthesis expected to be the smallest blocked node. With these two sentences it is closed.
3. **C3-LA1's "Hypotheses" paragraph is imprecise; this is a face-text repair.**
   - "`(16m+4)/3 − 1 = (16m+1)/3` in the first conjunct" is **not** a use of the class hypotheses: it holds for every `m`.
     `8(m−1)+1 = 8m−7` needs only `1 ≤ m`.
   - The domain `1 ≤ j ≤ a+b+1` needs only `1 ≤ q ≤ m`.
   - `hm` and `hmod` are load-bearing only through entry 20, for `ρ < 1`; `hm` also supplies `1 ≤ m`.
   - Also: the companion's `hjab : j ≤ a+b+1` is not load-bearing under Lean conventions (all conjuncts hold trivially beyond it).
     It stays: it is the informal domain where `ρ` is defined. No change to the frozen text.
4. **Most of Y-14 and part of Y-1 are already on the criterion key.**
   - The key's scope has "it forces `p ≥ m + 1` (for `p ≤ m` the class `q = p` has `j = 0`, and `r_q(0) = 1 > 0 = r_q(−1)`)" and
     the [r30 C4; SR-C4-6] (d) precision.
   - The [r31 C2; SR-C2-2] note already carries:
     - `r_q(j−1) > 0` via `(13m+1)/3 ≤ j − 1`;
     - "if `ℓ = 0` … `h_α = 0` identically" (the synthesis's "`β = 0` boundary");
     - `g_0 = 0`, `g_{a+1} = 0`, hence `h_a = ρT_a`;
     - the double counts and the in-balance.
   - What is new:
     - the generic statement for all `a, b` and `1 ≤ j ≤ a+b+1`;
     - the degenerate target class `ℓ' = b` (`S_α = 0 < T_α`, `g_α = h_α = 0`), which the SR-C2-2 note uses implicitly;
     - the joint corner `α = a ∧ ℓ' = b ⇒ j = a+b+1, ρ = 0`;
     - the exact failure set at `j = 0`;
     - the per-clone guarded column under `x/0 = 0`;
     - a third elementary nonnegativity proof.
   - **Repair to G-2:** the note records only this new content and cites the existing sentences by tag. It does not re-register them.
5. **Notation (binding from SR-C2-2 finding 1).** `G_α`/`H_α` collide with the contract polynomial `G`, and `β` collides with the choke
   state `(β, γ)`. The registration uses `g_α`, `h_α`, `ℓ := j − α` and `ℓ' := j − 1 − α`. The Lean identifiers `e1G`/`e1H` may be
   named as identifiers.
6. **Grade wording for condition (i).**
   - The synthesis writes "condition (i) formal (C1-LA3 entry 20)" and "C1-LA3 entry 20, formal" (Why funded; Y-2).
   - The registry's [r31 C2; SR-C2-2] note rules that `E993Transport.cb8_E1_conditionI_topRank` is an **ungraded companion lemma**
     compiled in C1-LA3's kernel-verified file, and corrects any face reading it as `formally_verified`.
   - **Repair:** say "compiled in r31 award C1-LA3's kernel-verified file (entry 20, companion, no grade of its own)".
   - After C3-LA1 closes, `ρ_q < 1` at the class is `formally_verified` **as a conjunct of C3-LA1's terminal**, and G-1 may say so.
     That changes no grade on the condition-(i) notes of any other key. No status crosses that fence.
7. **Alias hazard (lexical).** r30 already uses the tags `[r30 C3; SR-C3-1]` and `[r30 C3; C3-LA1; SR-C3-1]` in the registry, which
   has 7 occurrences of `SR-C3-1`. Every r31 registration must therefore be run-qualified: `[r31 C3; SR-C3-1]`,
   `[r31 C3; C3-LA1; SR-C3-1]`, "r31 award C3-LA1", "isolated second read SR-C3-1 (r31 Cycle 3)". Checked in all three registries and
   `control/CLAIM-DISTINCTIONS.json`, the proposed tags and row ids are absent both as key names and as text: `R31-C3-LA1`,
   `R31-C3-SR-C3-1-CLONE-TRANSPORT-LEAN-CONVENTION-CHECKS`, `[r31 C3; SR-C3-1]`, `[r31 C3; C3-LA1; SR-C3-1]`. No token `R31-C3-*`
   exists yet.
8. **No new key; the predicate check passes.**
   - G-1 and G-2 are scope notes on `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`. The spelling is
     identical in the run-local snapshot (497 claims), the frozen master (491) and the concurrent master-510.
   - The key is VERIFIED `proved_informal`, `formal_award: false` in all three. The r31 C1/C2 notes appear only in the run-local
     snapshot.
   - The clause is a node of the key's own mechanism, the type-symmetric clone transport; a new key would be an alias (SR-C2-2
     finding 5). No working label (Y-n, E-1, X-8, X-9, T-A, G-F-A, O2, R-5, S1..S9, Lemma A/B, E1-R) is used as a name, and r30
     content is named by key.
9. **G-2 as filed bundles Y-6.** The fidelity of `cb8E1Arc` belongs to SR-C3-3 and is excluded here. My G-2 text covers Y-1 and Y-14
   only.
10. **Attribution.**
    - The C3-LA1 face list is complete against SOLUTION-CONTRACT §3.9: Codex GPT-6's lower-region run, r30, Codex's
      heterogeneous-closure run, and the r31 seats of origin.
    - The Y-1 and G-2 attribution cells omit fence-9 items and some contributors: C-T1-U, the T adjudicator, the F adjudicator, r31
      C2 T3 and its critics, SR-C2-2, r30, Codex and this read. My texts complete them.
    - Seat models are per `control/C3-ALLOCATION.md`: routes Claude Sonnet 5; critics and adjudicators Claude Opus 5.5.
11. **Graph-level per-target load (outside this read's statements).**
    - The arc counts `a − α'` and `2(b − ℓ')` on literal (D) arcs are the key's registered clone correspondence and biregularity
      (r30 proof of record).
    - The Lean lift to `cbGraph m`, the literal up-cover counts (R-12), is open, and nothing here closes it.
    - The cross-route composition's "caveat removed once SR-C3-1 and SR-C3-2 concord" is supported by this read **at clone level
      only**.
12. **Struck items stay struck and were not used:**
    - T1's `clone_fiber_card`;
    - F3's inverted flag, Witness 1's "literal" reading, and "`unfold`-level";
    - the census rows as proof;
    - T2's "of record".

## Registration text

Precondition for the first block: file it only when r31 award C3-LA1 closes, with a kernel receipt whose `expected_statement` equals the
frozen C3-LA1 text in `cycles/cycle-3/stage6/SYNTHESIS.md`. If C3-LA1 is blocked, file nothing from the first block. The second block
and the record depend only on this read.

```text
SCOPE NOTE ON: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: [r31 C3; C3-LA1; SR-C3-1] Formal clause at clone level, at d = 8, for every integer m >= 107 with m ≡ 2 (mod 3) and the single rank p = p* = (16m + 4)/3. The Lean theorem E993Transport.cb8_E1_cloneTransport_topRank, the terminal of r31 award C3-LA1, proves the following over the zero-extended rational type counts S_α := C(a, α)·C(b, j − α)·2^{j − α} (0 unless α <= j; Lean e1S) and T_α := C(a, α)·C(b, j − 1 − α)·2^{j − 1 − α} (0 unless α + 1 <= j; Lean e1T), with ρ := Σ_{α <= a} S_α / Σ_{α <= a} T_α (Lean e1Rho), g_α := ρ·Σ_{α' < α} T_{α'} − Σ_{α' < α} S_{α'} (Lean e1G) and h_α := S_α − g_α (Lean e1H). For every q ∈ [1, m], with a = 8q − 1, b = 8(m − q) + 1 and j = p* − q: (1) ρ = r_q(j)/r_q(j − 1) as a ratio of coefficients of (1 + X)^a·(1 + 2X)^b in ℤ[X]; (2) ρ < 1; (3) g_α >= 0 and h_α >= 0 for every α ∈ [0, a]; (4) g_{α+1} + h_α = ρ·T_α for α < a, and h_a = ρ·T_a; (5) g_0 = 0; (6) if j <= a then g_j = S_j and h_j = 0; (7) for every α ∈ [0, a] with T_α > 0, the per-clone inflow of this key's type-symmetric transport, namely (a − α)·g_{α+1}/((α + 1)·S_{α+1}), present iff α < a, plus 2(b − (j − 1 − α))·h_α/((j − α)·S_α), present iff j − 1 − α < b, equals ρ. And at q = 1: (8) ρ_1 = cb8R1 m ((16m + 1)/3) / cb8R1 m ((16m + 1)/3 − 1), in the syntax of the residual of r31 award C1-LA1. All of this holds under Lean's conventions (truncated ℕ subtraction, x/0 = 0), and every subtraction is guarded or exact on the class. The hypotheses are exactly 107 <= m and m % 3 = 2. They enter only through E993Transport.cb8_E1_conditionI_topRank, a companion lemma with no grade of its own compiled in the kernel-verified file of r31 award C1-LA3, for (2); (1) and (3)–(8) need only 1 <= m. Grade of this clause: formally_verified, at this restricted scope only. Condition (i) at p*, in the form ρ_q < 1, is formally verified here only as conjunct (2) of this terminal. This clause changes no grade on any condition-(i) note of any key, and this key's statement, grade (proved_informal) and fences are unchanged. What the clause is not: it concerns the numbers of the clone transport on K(1)^a × K(2)^b by type, not cbGraph m. It asserts neither the clone correspondence nor the literal up-cover counts on cbGraph m, nor the E1 flow on the literal network, nor conjunct 4 of E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL, nor (HALL) at any scope, nor S(T_m, p*) <= 0. F_{p*}(T) ⊇ C is not used and remains a separate obligation. It is not progress on (L-S)_top or (ELIG-top)(a), and not a new identity: a new key would be an alias of this key. Fences: one rank p*, d = 8, the class only. Nothing is asserted at m < 107, at m ≡ 0 or 1 (mod 3), for d ≠ 8, or at any other rank. No θ* law. No Newton or Darroch: nonnegativity is by elementary binomial ratio monotonicity or by the type-path inequalities from the carried strong log-concavity lemma of r31 award C1-LA3, an induction over linear factors. No cutoff M_0 and no asymptotic step. E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER and Erdős #993 stay OPEN; no status transfers. Attribution: T1 (r31 Cycle 3 seat C3-T-01, Claude Sonnet 5; the double counts and the in-balance); T2 (r31 Cycle 3 seat C3-T-02, Claude Sonnet 5; the coefficient bridge, ρ_q < 1 through the carried coefficient lemmas, the first type-path inequality as a Finset sum, the zero-extended vocabulary); C-T1-F and C-T1-U (r31 Cycle 3, Claude Opus 5.5; the guarded clone count, independently; C-T1-U the rows, g_0 = 0 and the non-degenerate column); C-T2-F and C-T2-U (r31 Cycle 3, Claude Opus 5.5; the second type-path inequality and the ρ_1 link in C1-LA1's syntax, each independently; C-T2-U the class nonnegativity of the type totals); C-F3-T and C-F3-U (r31 Cycle 3, Claude Opus 5.5; the exact domain j >= 1, the boundary closures, the per-target load); F3 (r31 Cycle 3 seat C3-F-03, Claude Sonnet 5; the edge-case record); U2 (r31 Cycle 3 seat C3-U-02, Claude Sonnet 5; the duplicate ρ_q < 1); the r31 Cycle 3 T adjudicator (Claude Opus 5.5; the statement draft, the degenerate-case open nodes and their instrument); the r31 Cycle 3 F adjudicator (Claude Opus 5.5; the guard discipline); the r31 Cycle 3 synthesis (Claude Opus 5.5; the statement freeze, the merged form, the degenerate-case and monotone-ratio paragraph); the r31 C3-LA1 Stage 7 panel as named in its close record; isolated second read SR-C3-1 (r31 Cycle 3, Claude Opus 5.5); r31 Cycle 2 T3 and its critics and isolated second read SR-C2-2 (the explicit arc values and type totals of the [r31 C2; SR-C2-2] note); r31 awards C1-LA1 (cb8R1) and C1-LA3 (the carried coefficient lemmas) and their formalizers; this key, its criterion, its proof of record, its [r30 C4; SR-C4-6] note and the type totals: r30, as registered on this key and on E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL; the heterogeneous coefficient mechanisms: Codex's heterogeneous-closure run, as the face of r31 award C1-LA3 cites them; the transport network, the active-tag weight, the relation (D) ∪ (S) and (HALL): Codex (GPT-6 Astra/Sol/Luna), the lower-region run. This note changes neither this key's statement, grade nor fences.
```

```text
SCOPE NOTE ON: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: [r31 C3; SR-C3-1] Exact domain and degenerate target classes of this key's clone transport, generic in (a, b, j), completing the [r31 C2; SR-C2-2] note. For all integers a, b >= 0 and 1 <= j <= a + b + 1, take N(α, k) as in this key's [r30 C4; SR-C4-6] note (0 outside its ranges), S_α := N(α, j), T_α := N(α, j − 1), and ρ := Σ_α S_α / Σ_α T_α; the denominator r(j − 1) is positive exactly on this range of j. Put g_α := ρ·Σ_{α' < α} T_{α'} − Σ_{α' < α} S_{α'} and h_α := S_α − g_α. Then: (a) g_α >= 0 and h_α >= 0 for every α ∈ [0, a]. (b) g_{α+1} + h_α = ρ·T_α for α < a, h_a = ρ·T_a, and g_0 = 0. (c) If j <= a then g_j = S_j and h_j = 0; this is the source class with ℓ := j − α = 0, already recorded for the class in the [r31 C2; SR-C2-2] note. (d) For every α ∈ [0, a] with T_α > 0, put ℓ' := j − 1 − α <= b. The per-clone inflow (a − α)·g_{α+1}/((α + 1)·S_{α+1}) + 2(b − ℓ')·h_α/((j − α)·S_α), each term read as 0 when its up-cover count (a − α, resp. 2(b − ℓ')) is 0, equals ρ. This includes the two degenerate target classes. At α = a only the ternary term is present, and h_a = ρ·T_a. At ℓ' = b the source class of type α is empty (S_α = 0), every S_i and T_i with i < α vanishes, g_α = h_α = 0, and only the Boolean term is present; it equals g_{α+1}/T_α = ρ. Both together force j = a + b + 1 and ρ = 0. Proof (elementary; no import). The absorption identities (α + 1)·S_{α+1} = (a − α)·T_α (every α, with a − α truncated at 0) and (j − α)·S_α = 2(b − (j − 1 − α))·T_α (α + 1 <= j) turn each present term into g_{α+1}/T_α, resp. h_α/T_α. (b) is telescoping of the strict prefix sums with ρ·Σ T = Σ S. (c) holds because S_i = 0 for i > j and T_i = 0 for i >= j. For (a): r(j − 1)·g_α = Σ_{i < α <= k} (S_k·T_i − S_i·T_k), and r(j − 1)·h_α = S_0·Σ_{k >= α} T_k + Σ_{i < α <= k} (U_i·T_k − T_i·U_k), where U_i := S_{i+1} = (a − i)·T_i/(i + 1). In the first sum each summand is >= 0: where T_i, T_k > 0, because S_i/T_i = 2(b − j + 1 + i)/(j − i) is nondecreasing in i; where T_k = 0 < T_i, it equals S_k·T_i >= 0; where T_i = 0, either i < j and S_i = 0, or i >= j and T_k = 0. In the second sum each summand equals T_i·T_k·((a − i)/(i + 1) − (a − k)/(k + 1)) >= 0 identically. Equivalently, (a) is the pair of type-path inequalities of the [r30 C4; SR-C4-6] note, at α − 1 and at α. No Newton, no Darroch, no unguarded ℕ subtraction, no cutoff, no asymptotic step. Boundary: the hypothesis j >= 1 is load-bearing. At j = 0 the only source type has α = ℓ = 0, r(j − 1) = 0 and ρ is undefined (condition (i) reads 1 <= 0, the case this key's scope sentence 'it forces p >= m + 1' already excludes). Under the convention ρ := 0, the identity h_a = ρ·T_a and clause (c) fail for every (a, b), and g_α >= 0 fails at every α >= 1 (for every a >= 1). On the class of the [r31 C2; SR-C2-2] note (d = 8, m >= 107, m ≡ 2 (mod 3), p = p*, 1 <= q <= m, a = 8q − 1, b = 8(m − q) + 1), every j = p* − q satisfies (13m + 4)/3 <= j <= (16m + 1)/3 <= a + b + 1, so (a)–(d) hold at every q. Grade: proved_informal. Bounded support, not proof: record R31-C3-SR-C3-1-CLONE-TRANSPORT-LEAN-CONVENTION-CHECKS. Scope: clone level only. Nothing is asserted about cbGraph m, the literal up-cover counts, conjunct 4, (HALL) at any scope, or S(T_m, p*) <= 0. F_{p*}(T) ⊇ C remains a separate obligation. Nothing is asserted at any other rank, at m ≡ 0 or 1 (mod 3), at m < 107, or for d ≠ 8. E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER and Erdős #993 stay OPEN; no status transfers. Attribution: C-F3-T and C-F3-U (r31 Cycle 3, Claude Opus 5.5; the exact domain j >= 1, the ℓ = 0 and ℓ' = b closures, the per-target load; C-F3-U the generic statement); F3 (r31 Cycle 3 seat C3-F-03, Claude Sonnet 5; the edge-case record and the j = 0 corner); C-T1-U (r31 Cycle 3, Claude Opus 5.5; the rows, g_0 = 0 and the non-degenerate column); T1 (r31 Cycle 3 seat C3-T-01, Claude Sonnet 5; the double counts and the in-balance); the r31 Cycle 3 T adjudicator (Claude Opus 5.5; the degenerate-case open nodes and their instrument); the r31 Cycle 3 F adjudicator (Claude Opus 5.5; the guard discipline); the r31 Cycle 3 synthesis (Claude Opus 5.5; the degenerate-case and monotone-ratio paragraph); isolated second read SR-C3-1 (r31 Cycle 3, Claude Opus 5.5; the zero-case completion of the monotone-ratio proof, the j = 0 failure set, the rename to g, h, ℓ, ℓ'); r31 Cycle 2 T3 and its critics and isolated second read SR-C2-2 (the explicit arc values of the [r31 C2; SR-C2-2] note); this key, its criterion, its proof of record, its [r30 C4; SR-C4-6] note and the type totals: r30, as registered on this key; the transport network, the active-tag weight, the relation (D) ∪ (S) and (HALL): Codex (GPT-6 Astra/Sol/Luna), the lower-region run. This note changes neither this key's statement, grade nor fences.
```

```text
RECORD: R31-C3-SR-C3-1-CLONE-TRANSPORT-LEAN-CONVENTION-CHECKS
CLAIM: Exact checks of the [r31 C3; SR-C3-1] and [r31 C3; C3-LA1; SR-C3-1] notes on E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL, by an own transcription of the frozen r31 C3-LA1 definitions and terminal under Lean conventions (truncated ℕ subtraction, x/0 = 0). Generic: every a, b <= 20 and every j ∈ [0, a + b + 3]. On 1 <= j <= a + b + 1 (9,261 triples) there were 0 failures of the six clone-level conjuncts and 0 failures of every proof step: both absorption identities, both prefix-sum decompositions, both ratio monotonicities, the zero pattern, the ℓ' = b vanishing, both type-path inequalities, and ρ against coefficients of an independent polynomial product. All four column sub-cases were exercised. On j > a + b + 1 (882 triples) there were 0 failures. At j = 0 (441 triples), h_a = ρ·T_a fails at 441, the j <= a clause at 441 and nonnegativity at 420 (exactly a >= 1). A mutant without the T guard fails at 147 triples with a, b <= 6. Class (d = 8, m ≡ 2 (mod 3)): m ∈ {107, 110, 113, 116, 119, 122, 125, 128, 131, 134, 137, 140, 143, 146, 152, 200, 302}, every q ∈ [1, m] and every α ∈ [0, 8q − 1] (1,531,248 α-checks), with coefficients by linear-factor multiplication and exact division, and cb8R1 as transcribed. There were 0 failures of any conjunct. ρ_q < 1 at every q and the maximum is at q = 1. Min j = (13m + 4)/3. The degenerate classes α = a, ℓ' = b and j <= a occur at every row. The literal Fraction path agrees with the cleared-integer path at m = 107 and 125. (16m + 4)/3 − 1 = (16m + 1)/3 holds for every m <= 20000.
STATUS: bounded_computation
PROVENANCE: isolated second read SR-C3-1 (r31 Cycle 3, Claude Opus 5.5); scratchpad/c3-sr-SR-C3-1/sr1_lean_semantics.py (7a20c3f04ab835163ff9ec024707fd1927ec64a93a5b30c63b8b13c983de3630), sr1_generic.py (e90a83d07257d098c1f1fc5b0d76d556495c52c9c9875942041eb3a9c987438c; output sr1_generic_N20.out.json f69f2f9f6003eb3a194a7dc3fcad42113a6e136a299507c4f8ee3f320405e8cb), sr1_class.py (226ac05912ddf403b802da5e016c1ae1f1c8af015f9f765c839c35c290f2ac2a; output sr1_class_rows.out.json d17a8b99e0fc4d971decd2a07b7e5f4cd57bd008bc9fbd2dd8605c8ac632fb18), sr1_misc.py (a0b6a32015bfb22b418e9ff27ed1b1ce8599dbccc7a847475eb4f1bc416765da; output sr1_misc.out.json 267548559379dc4f2ef220a21d774e876a898baa8c0af29da0049ee772b647fa); Python standard library, exact integers and Fraction.
```

No `KEY:` block is proposed; a new key would be an alias of the criterion key. No `DISTINCTION ROW` is needed. The ledger row R31-C3-LA1
is the controller's to write from C3-LA1's close record. The Y-6 clause of G-2 is left to SR-C3-3.

## Verdicts

verdict[SR-C3-1a]: confirmed_with_repairs
verdict[SR-C3-1b]: confirmed_with_repairs
verdict[SR-C3-1c]: confirmed_with_repairs
verdict[SR-C3-1d]: confirmed_with_repairs

- **SR-C3-1a (exactness).** Rows, top, `g_0`, the `j ≤ a` clause and all four column sub-cases are correct under Lean conventions on
  `1 ≤ j ≤ a+b+1`. `j ≥ 1` is load-bearing, and the exact `j = 0` failure set is recorded. Y-14 is correct.
  Repairs (registration only):
  - notation `g`, `h`, `ℓ`, `ℓ'`;
  - the new content separated from what the key already records (findings 4 and 5).
- **SR-C3-1b (nonnegativity).** Correct by the monotone ratios, by C-F3-T's and C-F3-U's log-concavity forms, and by TP-g/TP-h from
  entry 15. There is no Newton and no Darroch.
  Repair: step 9's zero case needs the `i ≥ j` sentence, and the `h` summand should be written in product form (finding 2).
- **SR-C3-1c (the class instance).**
  - The domain, the coefficient bridge, `ρ < 1` via entries 20 and 14, and the `q = 1` link hold. The link is term-for-term equal in
    numerator and denominator.
  - My exact instrument covers 17 class rows (including the fresh rows 125, 128 and 140), every `q` and every `α`, with 0 failures.
  - Repairs:
    - the "Hypotheses" paragraph (finding 3);
    - "condition (i) formal" is reworded to the registry's ungraded-companion ruling (finding 6).
- **SR-C3-1d (registration text).** G-1 and G-2 are warranted as scope notes on the criterion key. Repairs:
  - run-qualified tags (finding 7);
  - G-2 restricted to Y-1/Y-14 and to new content (findings 4 and 9);
  - the attribution completed (finding 10);
  - the condition-(i) fence (finding 6).

  The exact texts are above. G-1 is filed only on C3-LA1's close.

## Artifact inventory

Everything under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-sr-SR-C3-1/`
(SHA-256):

| File | SHA-256 |
|---|---|
| `sr1_lean_semantics.py` | `7a20c3f04ab835163ff9ec024707fd1927ec64a93a5b30c63b8b13c983de3630` |
| `sr1_generic.py` | `e90a83d07257d098c1f1fc5b0d76d556495c52c9c9875942041eb3a9c987438c` |
| `sr1_generic_N12.out.json` | `e959c9011175c2e686dc56f584f48560b2b821a2fe2b5ae2d80774f12f69a00f` |
| `sr1_generic_N20.out.json` | `f69f2f9f6003eb3a194a7dc3fcad42113a6e136a299507c4f8ee3f320405e8cb` |
| `sr1_class.py` | `226ac05912ddf403b802da5e016c1ae1f1c8af015f9f765c839c35c290f2ac2a` |
| `sr1_class_107.out.json` | `7b5db6a045a63d613be5f9ab81fbef5f00b399a0852ca9581a08b4c8652a3b23` |
| `sr1_class_rows.out.json` | `d17a8b99e0fc4d971decd2a07b7e5f4cd57bd008bc9fbd2dd8605c8ac632fb18` |
| `sr1_misc.py` | `a0b6a32015bfb22b418e9ff27ed1b1ce8599dbccc7a847475eb4f1bc416765da` |
| `sr1_misc.out.json` | `267548559379dc4f2ef220a21d774e876a898baa8c0af29da0049ee772b647fa` |

Replay: `cd` into the scratch directory, then run `python3 -B sr1_generic.py 20`,
`python3 -B sr1_class.py 107 110 113 116 119 122 125 128 131 134 137 140 143 146 152 200 302 104 108 109` and `python3 -B sr1_misc.py`.
Rows 104, 108 and 109 are flagged off-class probes. This file is the only output outside scratch.
