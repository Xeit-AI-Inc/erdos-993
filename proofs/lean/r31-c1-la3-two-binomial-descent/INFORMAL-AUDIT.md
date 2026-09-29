---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la3-formalizer-opus-20260928
critic_id: c1-la3-opus-informal-20260928
attestation_id: c1-la3-informal-pass-20260928
claim_sha256: 560e9ea2fb8b6a468cbf3af08ba5a1a1dd2134e1d1e7f91424ca6130abd8eb49
---

# Informal Proof Integrity Audit

**Boot.** I am operating within VerityOS. I read `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md`, and loaded nothing else from VerityOS. The procedural layer (`skills/`) is the only
subsystem loaded. The controller owns conversation logging and durable records. This seat wrote only under
`scratchpad/c1-s7-informal-LA3/`.

**Model disclosure (two-part).**
- Chartered model, on dispatch-record authority: Claude Opus 5.5, effort high.
- Runtime-reported model id, verbatim: `claude-opus-5-5`.
- No child agents were used.

- **Seat.** Reviewer id `c1-la3-opus-informal-20260928`, kind `independent-mathematical-proof-integrity-reviewer`. I am not the
  artifact producer (`c1-la3-formalizer-opus-20260928`), and I edited no contract, Lean source, informal proof or receipt.
- **Canonical run id:** `erdos-993-math-dre-20260927-r31-cb-uniform-switch`. Award `C1-LA3`. Lean run
  `runs/lean-2026-09-28-c1-la3-two-binomial-descent/`.

## Identity and digest gate

| Object | Expected | Recomputed | Match |
|---|---|---|---|
| Auditor brief `control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA3.md` | `d79116a2…bd09f` | `d79116a21b3302079f8dac82a41cf7049be9f23196462719177794eb199bd09f` | yes, checked before reading |
| `THEOREM-CONTRACT.yaml` | `33bc3c74…6bcc` | `33bc3c74a4f8fef571367a974cea3ee1a2ff761a1ec9da051f0df01b74f66bcc` | yes |
| `INFORMAL-PROOF.md` | `a8bbf4f5…1c166` | `a8bbf4f52a9599bf7a99d3ef8febd893a94e74e250b9fe6738f0dc6e188c1166` | yes |
| `LeanProject/LeanProof/Main.lean` | `c0605e12…3f011` | `c0605e12b91375ede9fb72cb9af428a96d9b6a7d678b856b0131f9c7b10f3011` (18,989 bytes) | yes |
| Capsule seal of `C1-LA3-PACKET-MANIFEST.json` | `f51ec356…3ada8d` | `f51ec356ba160d0833c65f3a486a00ef4cb621b717de0a851b9ad0576f3ada8d` | yes |
| `claim_sha256`, computed as `" ".join(s.split())` of `theorem.informal_statement` | `560e9ea2…eb49` | `560e9ea2fb8b6a468cbf3af08ba5a1a1dd2134e1d1e7f91424ca6130abd8eb49` | yes |
| `lean_binding.expected_statement` | `40d79e5b…a7b5ed` | `40d79e5b5b80cf51af08966cba8015869a1816516d5dbd1b361bcfe72fa7b5ed`, found verbatim in `Main.lean` | yes |
| `CAPSULE-VERIFICATION.json`, as digested in the contract | `cdcd34bd…14418` | `cdcd34bd93f42587cea29c45d68b31fb33667c30f1fe2d73b7914fb816e14418` | yes |

- **Seal rule.** Compact key-sorted JSON of the manifest minus `seal_sha256`, with no trailing newline.
- **Capsule members.** All 975 are present, and each matches its listed digest (0 mismatches).
- **Frozen sources.** `sources/c1-stage7-sources/SOURCE-DIGESTS.json` lists 924 files: 0 mismatches, 0 missing. The capsule's 272
  members under that directory (273 with the digest file) agree with it.
- **Registrar entries.** All 21 `VERITYOS ENTRY` blocks in `Main.lean` are byte-identical to their `Snippets/*.fragment` files,
  and each carries the fragment's SHA-256 in its header.
- **Re-authored closing step.** Entry 2 (`descent_of_recurrence_logconcave`) has the same statement as C-U3-T's frozen DRAFT
  `Critic.lean` (`435eb4a1…`, verified). The only proof change is `rw [not_lt] at hcon` in place of `push_neg at hcon`. It is
  re-authored, not carried.

## Intended Claim

The claim is exactly the contract's `theorem.informal_statement` (hash above). Its mathematical content has three parts: the
terminal (BD) and two lemmas on the face, (G) and (E1i). All coefficients are over ℤ, with ℕ floor division and truncated
subtraction.

- **(BD), the terminal `E993Transport.cb8_block_descent_topRank`.**
  - Hypotheses: `m j : ℕ`, `107 ≤ m`, `m % 3 = 2`, `5 ≤ j ≤ m`.
  - Let `l := (16m+4)/3 − 2 − j`.
  - Conclusion: `[X^{l+1}] (1+X)^{8j}(1+2X)^{8(m−j)+1} < [X^l] (1+X)^{8j}(1+2X)^{8(m−j)+1}`.
- **(G), the lemma `twoBinom_coeff_strictAnti_of_gap`.**
  - Hypotheses: `a b t : ℕ`, `1 ≤ t`, `t ≤ a+b`, `3a+4b+2 ≤ 6t`.
  - Conclusion: `[X^{t+1}] (1+X)^a(1+2X)^b < [X^t] (1+X)^a(1+2X)^b`.
- **(E1i), the lemma `cb8_E1_conditionI_topRank`.**
  - Hypotheses: `107 ≤ m`, `m % 3 = 2`, `1 ≤ q ≤ m`.
  - Conclusion: `[X^{p*−q}] (1+X)^{8q−1}(1+2X)^{8(m−q)+1} < [X^{p*−q−1}] (1+X)^{8q−1}(1+2X)^{8(m−q)+1}`, where `p* = (16m+4)/3`.

These are the three exact statements of the synthesis's `### C1-LA3 (r31)` → "Exact statements", symbol for symbol. The synthesis's
`l := …` is inlined in the terminal. The terminal's four Lean hypotheses (`hm`, `hmod`, `hj`, `hjm`) match the claim's
hypotheses one for one. No binder is added or dropped.

**Role check against SEMANTIC-CONTRACT §2.**
- The block `j` of `I(CB(8,m))` is `C(m,j)·x^j(1+x)^{8j}(1+2x)^{8(m−j)+1}`. Its contributions to `i_{p*−1}` and `i_{p*−2}` are
  therefore `B_j(p*−1−j)` and `B_j(p*−2−j)`, i.e. `B_j(l+1)` and `B_j(l)`. So (BD) is exactly "block `j` descends across
  `Δ_{p*−2}`": a node of (ELIG-top)(a), as the fence says.
- (E1i) uses `a_q = 8q−1`, `b_q = 8(m−q)+1` and `r_q(p−q) ≤ r_q(p−q−1)` at `p = p*`, exactly as §2 defines E1's condition (i).
  (E1i) proves the strict form, which implies the non-strict one.

## Claim Ledger

Verdict key: **V** means verified by hand derivation plus reproduced exact computation.

| # | Claim or step (INFORMAL-PROOF item → Lean name) | Hypotheses, and where they enter | ℕ-subtraction / cast audit | Evidence | Verdict |
|---|---|---|---|---|---|
| L0 | `polyCoeffZ p i := if i < 0 then 0 else p.coeff i.toNat` (def) | none | `i.toNat` is used only when `i ≥ 0` | The contract text equals the Lean text. Only proof-internal; it does not occur in any claim statement. | V |
| L1 | Closing step (item 1 → `descent_of_recurrence_logconcave`): for integers with `0≤k`, `0<r0`, `0<r1`, `k≤a+b+1`, (R) at `k`, `r0 r2 ≤ r1²` and `3a+4b+2 ≤ 6k`, we get `r2 < r1` | `r1>0` is used for both divisions; `r0>0` gives `r0r1 ≤ r0r2`; `k ≤ a+b+1` gives `a+b−k+1 ≥ 0`; `k ≥ 0` gives `k+1>0`; the gap gives the contradiction | All in ℤ; nothing truncates | Hand: `r2≥r1 ⇒ r0r1 ≤ r0r2 ≤ r1² ⇒ r0 ≤ r1 ⇒ (k+1)r1 ≤ (a+2b−3k)r1 + 2(a+b−k+1)r1 = (3a+4b−5k+2)r1 ⇒ 6k ≤ 3a+4b+1`. Exhaustive integer box (C7): 6,548 hypothesis-satisfying tuples, 0 failures. With the gap weakened by one, the abstract counterexample `(a,b,k,r0,r1,r2)=(1,2,2,1,1,1)` meets every other hypothesis and has `r2 = r1` (C7b). So the lemma's gap is sharp. | V |
| L2 | Derivative identity (item 2 → `twoBinom_derivative_identity`): `(1+3X+2X²)P′ = ((a+2b)+(2a+2b)X)P` | none (all `a, b : ℕ`) | The prose's `a−1`, `b−1` are replaced by the successor case split; there is no ℕ-subtraction in the Lean text | Hand: `(1+X)(1+2X)P′ = a(1+2X)P + 2b(1+X)P`. Exact polynomial equality for `0 ≤ a,b ≤ 15`, including `a=0` and `b=0` (C1, 256 pairs). | V |
| L3 | Recurrence (R) (item 3 → `twoBinomCoeff_recurrence`): `(n+2)r(n+2) = (a+2b−3(n+1))r(n+1) + 2(a+b−n)r(n)` for every `n : ℕ` | none | Casts `↑a`, `↑b`, `↑n` into ℤ; `a+2b−3(n+1)` and `a+b−n` are ℤ subtractions | Coefficient of `X^{n+1}` in L2, using Mathlib `coeff_derivative : (derivative p).coeff n = p.coeff (n+1) * (n+1)`. At `n=0` the `X²` term is `0 = 2·0·r(0)`. Exact for `0≤a,b≤24`, `0≤n≤a+b+3`, including indices beyond the support (C2, 17,500 checks). | V |
| L4 | `polyCoeffZ_natCast`, `_of_neg`, `_one` (item 4) | `i<0` for `_of_neg` | none | Immediate from L0; `polyCoeffZ 1 = [i=0]` | V |
| L5 | Linear-factor rule (item 5 → `polyCoeffZ_linear_mul`): `polyCoeffZ((1+cX)p, i) = f(i) + c·f(i−1)` for all `c, i : ℤ` | none | `i−1` is in ℤ; the case `i=0` gives `i−1<0` | Mathlib `coeff_X_mul`. Random `p` and `c ∈ [−5,5]`, every `i ∈ [−3, deg+3]` (C3, 5,584 checks). | V |
| L6 | (M)-propagation (item 6 → `strongLC_linear_step`): if `f(i−1)f(j+1) ≤ f(i)f(j)` for all `i≤j`, then the same holds for `g = f + c·f(·−1)` when `c ≥ 0` | `c ≥ 0` multiplies the middle bracket and `c² ≥ 0` the last one; (M) is used at `(i,j)`, `(i−1,j−1)`, and at `(i,j−1)`+`(i−1,j)` if `i<j` or `(i−1,i)` if `i=j` | All in ℤ | The expansion `g(i)g(j) − g(i−1)g(j+1) = [A] + c[f(i)f(j−1) − f(i−2)f(j+1)] + c²[f(i−1)f(j−1) − f(i−2)f(j)]` was re-derived by hand; the `c·f(i−1)f(j)` terms cancel. The identity was checked on random integer data including negative entries (C4, 3,000). Every (M)-instance used satisfies its own `i ≤ j` side condition. The step needs no positivity; I confirmed propagation on 275 random sign-mixed (M)-sequences (C5b, 33,000 minors). | V |
| L7 | Factor peeling (item 7 → `twoBinom_succ_left/right`) | none | none | Ring identity (`C 1 = 1`; `C 2 = 2` via `map_ofNat`) | V |
| L8 | Positivity (item 8 → `polyCoeffZ_linear_mul_nonneg_pos`, `twoBinomCoeffZ_nonneg_pos`, `twoBinomCoeff_pos`): `r(k) > 0` for `k ≤ a+b` | `c>0`; induction on `b` from `P_{0,0}=1`, then on `a` | Casts `↑N`, `↑(N+1)`; the index `i−1` is in ℤ | At `i ≤ N` use `f(i)>0` plus `c·f(i−1) ≥ 0`; at `i=N+1` use `c·f(N)>0`. Degree `a+b` and all coefficients positive for `0≤a,b≤24` (C6). | V |
| L9 | Log-concavity (item 9 → `twoBinomCoeffZ_strongLC`, `twoBinomCoeff_logConcave`): (M) for `P_{a,b}`, hence `r(n)r(n+2) ≤ r(n+1)²` | Base: for `δ_0`, the left product is nonzero only at `(i,j)=(1,−1)`, which `i≤j` excludes. Steps: L6 with `c=2` (on `b`) and `c=1` (on `a`). Specialise to `i=j=n+1`. | `(n+1)−1 = n` and `(n+1)+1 = n+2` are rewritten in ℤ | Base on `[−6,6]` (91 pairs). (M) for `0≤a,b≤10`, every `i≤j` in `[−3,a+b+3]` (C5, 19,723 pairs). No Newton and no Darroch: the invariant is the elementary two-by-two-minor factor induction the synthesis names. | V |
| L10 | (G) (item 10 → `twoBinom_coeff_strictAnti_of_gap`) | `t≥1` gives `t=n+1`; `n < t ≤ a+b` gives `r(n)>0`; `t ≤ a+b` gives `r(t)>0` and `k ≤ a+b+1`; the gap is cast to ℤ | `t−1` appears only in the witness `t = (t−1)+1`, which is valid because `t ≥ 1` | L1 applied with `k=n+1` and `(r0,r1,r2) = (r(n), r(n+1), r(n+2))`, using L3, L8 and L9. Grid `0≤a,b≤60` (C8): 93,960 instances, 0 failures. `t ≤ a+b` is necessary: at `a=b=0`, `t=1` the gap holds but `r(2)=r(1)=0` (C8d). | V |
| L11 | Gap `2q+1` (item 11 → `cb8_gap_E1_conditionI`): `6(p*−q−1) = 3(8q−1) + 4(8(m−q)+1) + (2q+1)` in ℕ | `m%3=2` makes `3p* = 16m+4`; `q≥1`; `q≤m` | `8q−1`, `m−q`, `p*−q−1` are all true values (see the audit below) | Hand: `6t = 32m+2−6q` and `3a+4b = 32m−8q+1`. Literal ℕ semantics (truncated `−`, floor `/`) on every class row `107 ≤ m ≤ 6000` and every `q` (C9, 5,999,145 pairs). | V |
| L12 | Gap `2j−8` (item 12 → `cb8_gap_block_descent`): `6(p*−2−j) + 8 = 3(8j) + 4(8(m−j)+1) + 2j` in ℕ | `m%3=2`; `5≤j≤m` | `p*−2−j` and `m−j` are true values | Hand: `6l = 32m−4−6j` and `3a+4b = 32m−8j+4`. Literal ℕ semantics on every class row `107..6000`, every `j ∈ [5,m]` (C9, 5,991,285 pairs). | V |
| L13 | (E1i) (item 13 → `cb8_E1_conditionI_topRank`) | (G) with `a=8q−1`, `b=8(m−q)+1`, `t=p*−q−1`. `t ≥ 1` because `p* ≥ m+2 ≥ q+2`. `t ≤ 8m = a+b` because `p* ≤ 8m`. The gap is `6t = 3a+4b+2q+1 ≥ 3a+4b+3`. `t+1 = p*−q`. | `(p*−q−1)+1 = p*−q` holds because `p*−q ≥ 1` | Every side condition was re-checked on 1,965 class rows (C9). The literal coefficients are strict at every `q` for `m = 107, 110, 113, 116, 302` and at 62 sampled `q` for `m = 1001` (C10). `q ≥ 1` is needed: at `q = 0`, Lean's `8·0−1` truncates to `0`, and `coeff(p*) = coeff(p*−1)` exactly (a tie), because `2(8m+2)/(16m+4) = 1` (C10c). | V |
| L14 | (BD), the terminal (item 14 → `cb8_block_descent_topRank`) | (G) with `a=8j`, `b=8(m−j)+1`, `t=l`. `l ≥ 1` because `p* ≥ m+3 ≥ j+3`. `l ≤ p* ≤ 8m+1 = a+b`. `6l = 3a+4b+2j−8 ≥ 3a+4b+2` exactly when `j ≥ 5`. | The terminal's `… − 2 − j + 1` is addition after a true subtraction | Every side condition on 1,965 class rows (C9). Literal coefficients strict at every `j ∈ [5,m]` for `m = 107, 110, 113, 116, 302`, and at 58 sampled `j ≥ 5` for `m = 1001` (C10). | V |
| A1 | ℕ-subtraction audit section of `INFORMAL-PROOF.md` | — | Each listed bound was recomputed: `p* ≥ 572` at `m=107`; `p*−q−1 ≥ (13m+1)/3`; `p*−2−j ≥ (13m+4)/3 − 2`; `p*` exact under `m%3=2` | C9 | V |
| A2 | Repair "U3's degree is 7, not 8" (on the face; not on the DAG) | — | — | I recomputed U3's `Diff(n)` by exact Fractions at `n = 0..11`. It equals the listed 8 coefficients, and its 8th finite difference is identically 0, so the degree is 7 (C11). | V |

**Where each terminal hypothesis enters.**
- `hmod`: in L12, to make `3p* = 16m+4` exact.
- `hj`: in L14, to make the gap `2j−8 ≥ 2`.
- `hjm`: in L12/L14, to make `m−j` a true value and to give `l ≥ 1`.
- `hm`: passed to the `omega` calls but not needed mathematically.
  - The same proof works on the class for every `m ≥ 2`. My census found no failure of (E1i) or (BD) on class rows `2..104` (C10d).
  - `107 ≤ m` is therefore a class restriction the synthesis imposes, not a sharp hypothesis. Nothing below 107 is claimed.

**Dependency check ("NOT a dependency" items).**
- `Main.lean` imports only `Mathlib`.
- It contains no `sorry`, `admit`, `native_decide`, `decide` or `axiom` token, no `unsafe` and no `opaque`.
- It contains exactly 1 `theorem`, 19 `lemma` and 1 `def`.
- It does not reference `doubledCoeff*` (U3's two Lean atoms), the `E993R31CritU3T` namespace, or any heterogeneous-closure
  declaration.
- "Newton" and "Darroch" occur only once, in the docstring "no Newton, no Darroch" of entry 9.
- The proof uses no Python instrument; `INFORMAL-PROOF.md` says so, and none is cited as proof.
- U3's fixed-`Q_0` claim and §5.6 appear nowhere on the DAG.

## Reproduced Mathematical Evidence

- **Evaluator.** `scratchpad/c1-s7-informal-LA3/audit_la3.py`, SHA-256
  `a9d08485089cbc60947d021f4fa6dfc07d19f8a6a27ea71ac329223bc098d232`.
  - Standard library only. Explicit imports: `sys`, `hashlib`, `random`, `math.comb`, `fractions.Fraction`.
  - Deterministic, with seed `20260928`. No wall-clock field. No prior evaluator imported.
  - Run in the foreground with `python3 -B`; 157 s CPU; exit 0.
- **Log.** `scratchpad/c1-s7-informal-LA3/audit_la3.log`, SHA-256
  `dd9528bfd04453e8f0f846af6eb6171325e1e329b7c716155e8248172bbd31b5`. In-log `OUTPUT_SHA256`:
  `6fa1b0c53f0e1f7ad09926347f21d41707b37df6644be64713c64691a02e7182`.
- **Method.** Coefficients come from two independent routes: explicit linear-factor multiplication, and the convolution
  `Σ C(a,i)C(b,k−i)2^{k−i}`. The two agree on 2,535 checks (C0). ℕ subtraction is modelled literally as truncation.

Key outputs:
- C1–C6: the derivative identity, (R), the linear-factor rule, the minor expansion, (M) and its propagation, and positivity all
  hold with 0 failures (counts in the ledger).
- C7: the closing step holds on the whole integer box. C7b: with the gap weakened by one it fails, via `(1,2,2,1,1,1)`.
- C8: (G) holds on 93,960 grid instances.
  - C8e gives context, not a defect. On the grid, `r(t+1) ≥ r(t)` occurs at gap `−2` (20 of 620 instances) and at every
    instance with gap in `[−8, −3]` (the range scanned), but never at gap `−1`, `0` or `1`.
  - So (G)'s gap `≥ 2` is a sufficient condition for these polynomials, not a necessary one. Only the abstract closing step (L1)
    is sharp.
- C9: the gap identities and every side condition hold in literal ℕ semantics on all 1,965 class rows `107..6000`.
- C10: the rows are `m = 107, 110, 113, 116, 302` (all `q`, all `j`) and `m = 1001` (sampled).
  - (E1i) is strict at every `q`. The minimum relative margin is at `q = 1`: `4.3729e−3`, `4.2538e−3`, `4.1411e−3`,
    `4.0342e−3`, `1.5512e−3`.
  - (BD) is strict at every `j ≥ 5`.
  - The block pattern for `j = 0..11` is `+++---------` on every row, matching Lemma B.
- C10b, (BD) outside its hypothesis:
  - `j = 2` ascends, so the conclusion fails there.
  - `j = 3` (gap −2) and `j = 4` (gap 0) descend, but the (G) route does not reach them, and they are not claimed.
- C10c: (E1i) at `q = 0` in ℕ semantics is a tie, so the strict claim fails. `1 ≤ q` is load-bearing.
- C11: U3's polynomial has degree 7.

**Report figures re-checked** (`FORMALIZER-REPORT.md`, `CAPSULE-VERIFICATION.json`):
- the seal, the manifest file digest `8d24127d…` and the 975 members;
- the 272 frozen members;
- `Main.lean`'s 18,989 bytes and 21 entries;
- the terminal statement hash `40d79e5b…`;
- all agree.

I did not re-run the kernel. The axiom lists in `EVIDENCE/axioms*.txt` were read, not re-derived: each declaration is within
`{propext, Classical.choice, Quot.sound}`.

## Independent Critic Pass

Separate pass over the ledger above, attacking each closed row:

1. **Could the (M) invariant silently need positivity or support contiguity?**
   - No. The L6 algebra uses only (M)-instances and the signs of `c` and `c²`.
   - C5b tested it on sign-mixed sequences.
   - Contiguity enters nowhere, because `polyCoeffZ` is zero-extended and the base case `δ_0` satisfies (M) outright.
   - This departs in form from C-U3-T's "positive and log-concave, ratio chain" wording, and `INFORMAL-PROOF.md` discloses the
     departure (item 6, note). It is the same elementary factor induction, and it is strictly less demanding.
   - No defect.
2. **Is (R) used at an index where it was not proved?**
   - (R) is proved for every `n : ℕ`. It is used at `n = t−1 ≥ 0`.
   - The ℤ-version with `k = n+1` matches L1's `hrec` exactly: `2(a+b−k+1) = 2(a+b−n)`.
   - No defect.
3. **Does C-U3-T's side condition `b ≥ 1` go missing?**
   - (G) is stated for all `b : ℕ`, and nothing in L2–L10 uses `b ≥ 1`.
   - The grid includes `b = 0`, with 0 failures.
   - No defect.
4. **Truncation traps.**
   - `8q−1` is protected by `q ≥ 1`, and C10c shows the protection is load-bearing.
   - `p*−q−1`, `p*−2−j`, `m−q` and `m−j` are all true values on the domain (C9).
   - The terminal's `+1` is outside the subtraction.
   - No defect.
5. **Floor division.** `(16m+4)/3` is exact under `m%3=2` (C9). `omega` handles it natively; no exactness is smuggled in.
6. **Direction of the inequalities.** (BD) compares `B_j(l+1)` against `B_j(l)`. That is the block's contribution to
   `i_{p*−1} − i_{p*−2}` (SEMANTIC-CONTRACT §2 block decomposition), so the direction matches the role the fence names.
7. **Widening or weakening.**
   - The Lean statements equal the synthesis's exact statements.
   - (E1i) is strict, which is stronger than the non-strict condition (i) of §2 and is what the synthesis states.
   - No hypothesis was added, dropped or relaxed.
8. **Carried or forbidden inputs.** None, per the dependency check above.
9. **Contract-level observation, not a proof defect.**
   - The contract's `dependency_graph` has an edge `def-poly-coeff-z → conclusion`, while that definition's description says it
     "does not occur in the terminal statement".
   - The edge over-includes a proof-internal definition. It narrows nothing and widens nothing.
   - It is recorded for the statement-fidelity reviewer.
10. **Face completeness.**
    - `INFORMAL-PROOF.md`'s excluded list is the synthesis's five conclusions plus "any residue class other than `m ≡ 2 (mod 3)`"
      and "any `m < 107`".
    - The contract's scope text adds "(HALL); any aggregate, TREE, FOREST, TRANSFER or Erdős #993". This is stricter than
      required and consistent.

**Critic outcome:** every ledger row stands. The critic pass found no defect.

## Scope and Fence Check

**Fences and excluded conclusions** (synthesis `### C1-LA3` and formalizer brief §2) against the two faces:

| Fence or excluded conclusion | `INFORMAL-PROOF.md` | Contract scope text | Asserted anywhere? |
|---|---|---|---|
| (BD) is a NODE of (ELIG-top)(a), not (ELIG-top)(a) (needs the `S_5` certificate and the block identity) | yes | yes | no |
| (E1i) is an instance of the threshold key's (a) at `p*`; Tier 3 dependency reduction, never Tier 2; a lemma, not the terminal | yes | yes | no; (E1i) is a `lemma` |
| (G): companion tool, no certificate of its own, no family or tree claim | yes | yes | no |
| (ELIG-top)(a) itself; E1-R's flow; favorability; any rank other than `p*`; the threshold key's (a) off `p*` | yes | yes | no |
| No grade is asserted for any companion | yes | yes | no |
| Repairs: U3's fixed-`Q_0` claim and §5.6 are never inputs; degree 7, not 8; U3's Lean atoms are off the DAG | yes | yes | no; degree 7 re-verified (C11) |
| No Newton, no Darroch | yes | yes | no; not used (dependency check) |
| Exactly one terminal `theorem`: `cb8_block_descent_topRank` | — | `lean_binding` | yes, exactly one |

**Attribution.** Each item of the synthesis's list appears on both faces, verbatim in substance:
- Lemma A and the closing step: C-U3-T;
- the `q = 1` case: r31 U3;
- corroboration: C-U3-F;
- the (BD) instance and its role in (ELIG-top)(a): the r31 Cycle 1 synthesis, from C-U3-T's Lemma B;
- the E1 criterion, threshold and `r_q`: r30;
- the mechanism: Codex GPT-6;
- Codex's heterogeneous-closure binomial-block mechanisms: templates only, not carried.

The formalizer `c1-la3-formalizer-opus-20260928` (Claude Opus 5.5) is named on both faces and in the terminal's docstring. The
attribution travels on the award's face.

**Read-boundary disclosures.**
- **Within the grant.** I read:
  - the brief; the three boot and skill files;
  - the run's contract, informal proof, `CAPSULE-VERIFICATION.json`, `EVIDENCE/THEOREM-CONTRACT.md` (head),
    `EVIDENCE/axioms*.txt`, `EVIDENCE/build.log` (tail), `FORMALIZER-REPORT.md`, `Main.lean` and the snippet digests;
  - the capsule manifest;
  - the synthesis sections `## Lean awards` (intro and C1-LA3) and `## Exact established results`, plus a heading list;
  - the U adjudication's U3 ruling and `## Lean readiness`;
  - C-U3-T's critique (full), C-U3-F's critique (re-derivation and verdict) and U3's return §4–5;
  - the formalizer brief;
  - greps of `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`;
  - `sources/c1-stage7-sources/SOURCE-DIGESTS.json`, verified, and C-U3-T's `Critic.lean`;
  - greps inside the shared Mathlib package (`Algebra/Polynomial/Derivative.lean`, `Coeff.lean`) for `coeff_derivative`,
    `derivative_pow_succ`, `coeff_X_mul` and `coeff_X_pow_mul(')`.
- **Not read.** I did not open `EVIDENCE/fidelity-audit-input.json`, the run's `DRAFTS/` or `RECEIPTS/`, the r30 or first-interior
  sources, or the heterogeneous-closure templates. None has a carry role in this award.
- **Harness behaviour.**
  - The harness saved the full manifest print to a tool-results file under `~/.claude/projects/…`. I did not open it.
  - The harness injected the project `CLAUDE.md` and the user's memory index into context. I did not act on them beyond this
    brief.
- **Nothing else.** No network, no package installs, no Lean build, no `lake`/`elan`, no search rooted above granted paths, no
  background jobs, no child agents.

## Verdict

passed

`INFORMAL-PROOF.md` is a complete, correct statement-level proof of the contract's `informal_statement`: (BD) as the terminal,
with (G) and (E1i) as lemmas on the face.
- Every step is verified by hand derivation plus exact recomputation.
- Every ℕ-subtraction and cast is sound.
- The terminal's hypotheses match the claim one for one.
- No fenced conclusion is asserted.
- No "NOT a dependency" item is a dependency.
- The required attribution travels on both faces.

One non-blocking observation goes to the fidelity reviewer: the over-inclusive contract edge `def-poly-coeff-z → conclusion`
(critic item 9).

Attestation id: `c1-la3-informal-pass-20260928`. Model disclosure: chartered Claude Opus 5.5, effort high, on dispatch-record
authority; runtime-reported model id `claude-opus-5-5`.
