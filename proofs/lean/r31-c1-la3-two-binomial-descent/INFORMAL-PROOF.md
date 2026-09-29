# C1-LA3 (r31): two-binomial descent. Informal proof at statement level

- Canonical run id: `erdos-993-math-dre-20260927-r31-cb-uniform-switch`. Award `C1-LA3`. Lean run `lean-2026-09-28-c1-la3-two-binomial-descent`.
- Governing text: `cycles/cycle-1/stage6/SYNTHESIS.md`, `## Lean awards` → `### C1-LA3 (r31)` (copied byte-identically as `SOURCE/cycle-1-SYNTHESIS.md`).
- Producer: `c1-la3-formalizer-opus-20260928`. Model disclosure (two-part): chartered Claude Opus 5.5 (effort high, applied by the platform), on dispatch-record authority; runtime-reported model id `claude-opus-5-5`.

## Attribution (on the face)

- Lemma A and the closing step: C-U3-T.
- The `q = 1` case: r31 U3.
- Corroboration: C-U3-F.
- The (BD) instance and its role in (ELIG-top)(a): the r31 Cycle 1 synthesis, from C-U3-T's Lemma B.
- The E1 criterion, threshold and `r_q`: r30.
- The mechanism: Codex GPT-6.
- Codex's heterogeneous-closure binomial-block mechanisms are cited as templates only, not as carried fragments (none was opened as a Lean source in this run).
- Lean text: the C1-LA3 formalizer `c1-la3-formalizer-opus-20260928` (Claude Opus 5.5). `descent_of_recurrence_logconcave` is re-authored from C-U3-T's `Critic.lean` DRAFT scratch (no grade, never carried).

## Fences and excluded conclusions

- (BD) is a NODE of (ELIG-top)(a), not (ELIG-top)(a), which also needs the `S_5` certificate and the block identity.
- (E1i) is an instance of the registered threshold key's (a) at `p*` on the class. It is a Tier 3 dependency reduction, never Tier 2 progress, and a lemma on the face (not the terminal).
- (G) is a companion tool with no certificate of its own. It makes no family or tree claim.
- Not claimed: (ELIG-top)(a) itself; E1-R's flow; favorability; any rank other than `p*`; the threshold key's (a) off `p*`; any residue class other than `m ≡ 2 (mod 3)`; any `m < 107`. No grade is asserted for any companion lemma.
- Repairs carried in: U3's "any fixed `Q_0` immediate" and its §5.6 are never inputs; U3's degree is 7, not 8; nothing from U3's Lean atoms is on this DAG.
- No Newton inequality and no Darroch mode theorem is used anywhere; the pinned Mathlib has neither.

## Notation

For `a b : ℕ` let `P_{a,b} = (1+X)^a (1+2X)^b ∈ ℤ[X]` and `r(k) = [X^k] P_{a,b}` (`Polynomial.coeff`, `k : ℕ`). The auxiliary `polyCoeffZ p i` extends `p.coeff` to `i : ℤ` by `0` for `i < 0` (Lean: `if i < 0 then 0 else p.coeff i.toNat`).

## DAG (Lean names in `E993Transport`)

1. `descent_of_recurrence_logconcave` (closing step; C-U3-T). For integers `a b k r0 r1 r2` with `0 ≤ k`, `0 < r0`, `0 < r1`, `k ≤ a+b+1`, `(k+1) r2 = (a+2b−3k) r1 + 2(a+b−k+1) r0`, `r0 r2 ≤ r1²` and `3a+4b+2 ≤ 6k`, we have `r2 < r1`.
   Proof. Suppose `r2 ≥ r1`. Then `r0 r1 ≤ r0 r2 ≤ r1²`, so `r0 ≤ r1` (divide by `r1 > 0`). Since `a+b−k+1 ≥ 0`, `(k+1) r1 ≤ (k+1) r2 = (a+2b−3k) r1 + 2(a+b−k+1) r0 ≤ (a+2b−3k) r1 + 2(a+b−k+1) r1 = (3a+4b−5k+2) r1`. Divide by `r1 > 0`: `k+1 ≤ 3a+4b−5k+2`, i.e. `6k ≤ 3a+4b+1`, contradicting the gap.
2. `twoBinom_derivative_identity`. `(1+3X+2X²) · P′ = (C(a+2b) + C(2a+2b)·X) · P` for `P = P_{a,b}`, since `(1+X)(1+2X) = 1+3X+2X²` and `P′ = a(1+X)^{a−1}(1+2X)^b + 2b(1+X)^a(1+2X)^{b−1}`. Proof in Lean: case split `a = 0 | a'+1`, `b = 0 | b'+1`; `derivative_mul`, `derivative_pow_succ`, `ring`. No ℕ-subtraction appears (the successor form replaces `a−1`, `b−1`).
3. `twoBinomCoeff_recurrence` (R). For every `n : ℕ`, with `k = n+1`:
   `(n+2) r(n+2) = (a+2b−3(n+1)) r(n+1) + 2(a+b−n) r(n)`, i.e. `(k+1) r(k+1) = (a+2b−3k) r(k) + 2(a+b−k+1) r(k−1)`.
   Proof. Take the coefficient of `X^{n+1}` in (2). Using `[X^j] P′ = (j+1) r(j+1)`: the left side is `(n+2) r(n+2) + 3(n+1) r(n+1) + 2 n r(n)` (for `n = 0` the `X²` term contributes `0 = 2·0·r(0)`); the right side is `(a+2b) r(n+1) + (2a+2b) r(n)`. Rearrange (`linear_combination`). All arithmetic is in ℤ after casting `a, b, n`; no ℕ-subtraction.
4. `polyCoeffZ_natCast`, `polyCoeffZ_of_neg`, `polyCoeffZ_one`: `polyCoeffZ p n = p.coeff n` for `n : ℕ`; `polyCoeffZ p i = 0` for `i < 0`; `polyCoeffZ 1 i = [i = 0]`.
5. `polyCoeffZ_linear_mul`. For every `c i : ℤ`, `polyCoeffZ ((1 + C c·X)·p) i = polyCoeffZ p i + c · polyCoeffZ p (i−1)`. Cases `i < 0` (both sides `0`), `i = 0` (`i−1 < 0`), `i = n+1` (`coeff_X_mul`). The subtraction `i − 1` is in ℤ.
6. `strongLC_linear_step` (LC factor step; no Newton, no Darroch). Let `f : ℤ → ℤ` satisfy `(M)`: `f(i−1) f(j+1) ≤ f(i) f(j)` for all `i ≤ j`. For `c ≥ 0`, `g(i) = f(i) + c f(i−1)` satisfies (M). Indeed
   `g(i) g(j) − g(i−1) g(j+1) = [f(i)f(j) − f(i−1)f(j+1)] + c [f(i) f(j−1) − f(i−2) f(j+1)] + c² [f(i−1) f(j−1) − f(i−2) f(j)]`.
   The first and last brackets are (M) at `(i, j)` and `(i−1, j−1)`. The middle bracket: if `i < j`, (M) at `(i, j−1)` and `(i−1, j)` chain `f(i−2) f(j+1) ≤ f(i−1) f(j) ≤ f(i) f(j−1)`; if `i = j`, it is (M) at `(i−1, i)`. Multiply by `c ≥ 0`, `c² ≥ 0` and add.
   Note (formalizer's choice of invariant). C-U3-T states the induction for "positive and log-concave" sequences via the ratio chain. The Lean text propagates instead the two-by-two minor condition (M) on the zero-extended ℤ-indexed sequence, which needs no positivity and no division, and specializes at `i = j` to one-point log-concavity. It is the same elementary factor induction; it uses neither Newton nor Darroch.
7. `twoBinom_succ_left`, `twoBinom_succ_right`. `P_{a+1,b} = (1 + C 1·X) P_{a,b}` and `P_{a,b+1} = (1 + C 2·X) P_{a,b}` (`ring`).
8. `polyCoeffZ_linear_mul_nonneg_pos`, `twoBinomCoeffZ_nonneg_pos`, `twoBinomCoeff_pos` (positivity). If `p` has nonnegative ℤ-indexed coefficients that are positive on `[0, N]` and `c > 0`, then `(1 + C c·X) p` has nonnegative coefficients positive on `[0, N+1]` (at `i ≤ N` use `f(i) > 0`; at `i = N+1` use `c f(N) > 0`). By induction on `b` then `a` from `P_{0,0} = 1`: `r(k) > 0` for every `k ≤ a+b`.
9. `twoBinomCoeffZ_strongLC`, `twoBinomCoeff_logConcave` (LC by factor induction). `polyCoeffZ 1` satisfies (M) (the only nonzero product on the right is at `i = j = 0`; the left product is nonzero only at `i = 1, j = −1`, excluded by `i ≤ j`). Step (6) with `c = 2` (induction on `b`) and `c = 1` (induction on `a`) gives (M) for `P_{a,b}`. At `i = j = n+1`: `r(n) r(n+2) ≤ r(n+1)²` for every `n : ℕ`.
10. `twoBinom_coeff_strictAnti_of_gap` (G). For `a b t : ℕ` with `1 ≤ t`, `t ≤ a+b`, `3a+4b+2 ≤ 6t`: `r(t+1) < r(t)`.
    Proof. Write `t = n+1` (possible since `t ≥ 1`). Apply (1) with `k = n+1`, `r0 = r(n)`, `r1 = r(n+1)`, `r2 = r(n+2)`: `r0 > 0` and `r1 > 0` by (8) since `n < n+1 = t ≤ a+b`; `k ≤ a+b+1`; the recurrence is (3); LC is (9); the gap is the hypothesis cast to ℤ.
11. `cb8_gap_E1_conditionI` (gap `2q+1`). For `107 ≤ m`, `m % 3 = 2`, `1 ≤ q ≤ m`, with `p* = (16m+4)/3`: `6(p* − q − 1) = 3(8q−1) + 4(8(m−q)+1) + (2q+1)` in ℕ (`omega`).
12. `cb8_gap_block_descent` (gap `2j−8`). For `107 ≤ m`, `m % 3 = 2`, `5 ≤ j ≤ m`: `6(p* − 2 − j) + 8 = 3(8j) + 4(8(m−j)+1) + 2j` in ℕ (`omega`).
13. `cb8_E1_conditionI_topRank` (E1i), a lemma on the face. For `107 ≤ m`, `m % 3 = 2`, `1 ≤ q ≤ m`:
    `[X^{p*−q}] (1+X)^{8q−1}(1+2X)^{8(m−q)+1} < [X^{p*−q−1}] (1+X)^{8q−1}(1+2X)^{8(m−q)+1}`.
    Proof. (G) with `a = 8q−1`, `b = 8(m−q)+1`, `t = p*−q−1`: `t ≥ 1` since `p* ≥ m + 2 ≥ q + 2`; `t ≤ a+b = 8m` since `p* ≤ 8m`; `3a+4b+2 ≤ 6t` by (11) and `q ≥ 1`; and `t+1 = p*−q`.
14. `cb8_block_descent_topRank` (BD), the ONE terminal theorem. For `107 ≤ m`, `m % 3 = 2`, `5 ≤ j ≤ m`, `l = p* − 2 − j`:
    `[X^{l+1}] (1+X)^{8j}(1+2X)^{8(m−j)+1} < [X^{l}] (1+X)^{8j}(1+2X)^{8(m−j)+1}`.
    Proof. (G) with `a = 8j`, `b = 8(m−j)+1`, `t = l`: `l ≥ 1` since `p* ≥ m + 3 ≥ j + 3`; `l ≤ a+b = 8m+1`; `3a+4b+2 ≤ 6l` by (12) and `j ≥ 5` (`6l = 3a+4b+2j−8 ≥ 3a+4b+2`).

## ℕ-subtraction and cast audit

- `p* = (16m+4)/3` is ℕ floor division; under `m % 3 = 2`, `16m+4 ≡ 0 (mod 3)` so it is exact, and `3p* = 16m+4`. `omega` reasons with the floor semantics directly; no exactness is assumed beyond what the hypotheses give.
- `8q − 1` (E1i): true value because `q ≥ 1`.
- `m − q`, `m − j`: true values because `q ≤ m`, `j ≤ m`.
- `p* − q` and `p* − q − 1` (E1i): true values because `p* ≥ (16·107+4)/3 = 572` and `p* − q − 1 ≥ (13m+1)/3 ≥ 1` for `q ≤ m`; `(p*−q−1)+1 = p*−q` is rewritten by `omega` under these facts.
- `p* − 2 − j` (BD): true value because `p* − 2 − j ≥ (13m+4)/3 − 2 ≥ 1`; the terminal's `l + 1` is written `(16 * m + 4) / 3 - 2 - j + 1`, i.e. addition after the (true) subtraction.
- (R), LC and the closing step are stated over ℤ with `a, b, n` cast from ℕ (`↑a`, `↑b`, `↑n`); every subtraction there (`a+2b−3k`, `a+b−k+1`, `a+b−n`, `i−1`) is in ℤ. The gap hypothesis of (G) is ℕ and is cast to ℤ by `omega` at its single use.
- Coefficients are taken over ℤ (`Polynomial ℤ`), exactly as the synthesis states; `2 * X` is the ℤ[X] numeral `2` times `X`, equal to `C 2 * X` (`map_ofNat`).

## Checks (never proof)

No Python was run in this seat. The compiled Lean text is the proof of record for the statements above; the frozen instruments (`sources/c1-stage7-sources/ADJ-U/adj_lemmaA.py` and the C-U3-T logs) were not re-run.
