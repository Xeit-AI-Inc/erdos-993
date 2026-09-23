# Informal Proof — `E993-R25-CATALAN-GAP-MONOTONE-RATIO`

Award group 1, Cycle 3, r25 (`cycles/cycle-3/stage6/SYNTHESIS.md`, `## Lean
awards`). Registry key `E993-R25-CATALAN-GAP-MONOTONE-RATIO`. Namespace
`Erdos993G1.U3`. This document restates the mathematics that the compiled
Lean fragment proves. It is a statement about Catalan integers. It is **not**
a graph theorem, **not** fixed-band, and **not** uniform in `d` (`d` does not
occur anywhere below).

## 1. Definitions

`catalan : ℕ → ℕ` is Mathlib's Catalan-number function.

`Gamma : ℕ → ℕ → ℤ` is the Catalan-dominance gap:

```
Gamma τ k = catalan (k+1) − Σ_{j=1}^{τ} C(τ,j) · [ if j ≤ k then catalan (k−j) else 0 ]
```

**Zero-extension convention of record.** The guard `if j ≤ k then catalan
(k−j) else 0` is a convention of record, cited from `SEMANTIC-CONTRACT.md`'s
integer zero-extension convention ("`coeff` is zero at negative integer
indices"), **not** from `SOLUTION-CONTRACT-ADDENDUM-1.md` §A2, which is
silent on the value of `Cat_{k−j}` when `k < j`. Under natural-number
subtraction alone (without the guard), `k − j` would truncate to `0` rather
than being excluded, which silently changes the sum for `k < τ` (e.g. it
would make `K(1) = 1` instead of the correct `K(1) = 0`). The guard is what
decides `K(1) = 0`: at `τ = 1`, `k = 0`, the single term `j = 1` is guarded
off (`1 ≤ 0` is false), leaving `Gamma 1 0 = catalan 1 = 1 > 0`; without the
guard the term would wrongly contribute `−catalan(0 − 1) = −catalan 0 = −1`
under truncated subtraction, i.e. `1 − 1·catalan(0) = 0`, which does not
match. This guard is load-bearing for every `k < τ` case, including the
`τ = 2, 3, 4` minimality witnesses below.

`Gamma τ 0 = 1` for every `τ` (`Gamma_zero`), matching the Cycle 1/2 record.

## 2. Hypotheses (load-bearing)

`monotone_ratio`, `gamma_pos_of_base`, and every downstream `gamma_pos_τ`
theorem carry `(hτ : 1 ≤ τ)` and `(hk : τ ≤ k)`. Both are necessary, not
decorative: the synthesis records 25 violations of the denominator-free
monotonicity at `k < τ`. `τ = 1` is handled outside `monotone_ratio`'s domain
entirely, by `gamma_one_pos`, since `K(1) = 0 < τ = 1`.

## 3. The finitary route

### 3.1 The multiplicative recurrence (no division)

Mathlib's `succ_mul_catalan_eq_centralBinom` gives `(n+1)·Cat_n =
centralBinom n`, and `Nat.succ_mul_centralBinom_succ` gives `(n+1)·centralBinom
(n+1) = 2(2n+1)·centralBinom n`. Composing and cancelling the common factor
`(n+1)` yields the classical recurrence with no division anywhere:

```
(n+2)·Cat_{n+1} = (4n+2)·Cat_n            (catalan_mul_recurrence)
```

### 3.2 Strict log-convexity (renamed; condition (i))

`catalan_strict_logConvex` (previously misnamed `catalan_strict_logConcave` in
the originating draft — see §6):

```
Cat_{n+1}·Cat_{n+1} < Cat_n·Cat_{n+2}
```

Proof: apply the recurrence at `n` and at `n+1`, clear denominators by
multiplying through by `(n+2)(n+3)`, and reduce to the always-true polynomial
fact `(4n+2)(n+3) < (4n+6)(n+2)` (`⟺ 12 > 6`, i.e. `f(i) = Cat_{i-1}/Cat_i =
(i+1)/(4i−2) > 1/4` cleared of division). This is the sole finitary engine
behind the whole fragment.

### 3.3 Cross-index monotonicity

`catalan_cross_strict (a b : ℕ) (hab : a < b)`:

```
Cat_{a+1}·Cat_b < Cat_a·Cat_{b+1}
```

Proved by induction on `b` from log-convexity at each step (telescoping the
single-step inequality across `b − a` steps), with no limits or real/rational
analysis anywhere.

### 3.4 The monotone-ratio theorem (obligation (1))

`monotone_ratio (τ k : ℕ) (hτ : 1 ≤ τ) (hk : τ ≤ k)`:

```
Gamma τ k · Cat_{k+2} < Gamma τ (k+1) · Cat_{k+1}
```

This is the denominator-free, cross-multiplied statement of record (condition
(v)) of "the ratio `Gamma τ k / Cat_{k+1}` strictly increases in `k`". Proof:
expand both `Gamma τ k` and `Gamma τ (k+1)` via `Gamma_unfold` (licensed
because `hk : τ ≤ k` and `τ ≤ k+1`), cross-multiply, and the difference
collapses to

```
Σ_{j=1}^{τ} C(τ,j) · ( Cat_{k−j}·Cat_{k+2} − Cat_{k+1−j}·Cat_{k+1} )
```

Each summand is strictly positive: reindex `catalan_cross_strict (k−j) (k+1)`
(valid since `j ≤ k` gives `k − j < k + 1`) to get `Cat_{k−j+1}·Cat_{k+1} <
Cat_{k−j}·Cat_{k+2}`, and `k − j + 1 = k + 1 − j` in `ℕ` since `j ≤ k`. The sum
of strictly positive terms over the nonempty index set `Finset.Icc 1 τ` (`τ ≥
1`) is strictly positive, giving the claimed strict inequality.

### 3.5 Propagation from a base rank

`gamma_pos_of_base (τ K : ℕ) (hτ : 1 ≤ τ) (hK : τ ≤ K) (hbase : 0 < Gamma τ K)`:

```
∀ k, K ≤ k → 0 < Gamma τ k
```

By induction on `k` from `K`, using `monotone_ratio` and positivity of
`catalan` at each step (`mul_pos_iff_of_pos_right`): if `0 < Gamma τ k` and
`Gamma τ k · Cat_{k+2} < Gamma τ (k+1) · Cat_{k+1}`, then `0 < Gamma τ (k+1) ·
Cat_{k+1}`, and since `Cat_{k+1} > 0`, `0 < Gamma τ (k+1)`.

### 3.6 The seven base values, `K(1..7) = 0, 2, 3, 4, 6, 12, 70`

Each `gamma_base_τ` (`τ = 2..7`) is a concrete, kernel-decided numeric fact:
`Gamma_unfold` reduces `Gamma τ K` to a finite sum, `catalan_eq_centralBinom_div`
rewrites every `catalan` occurrence to the closed `centralBinom`/`Nat.choose`
form (the raw recursive `catalan` does not reduce under `decide`; the closed
form does, up to `Nat.choose 142 71`, a 42-digit number, computed in a Lean
`decide` call bounded by `maxRecDepth 4000` or `10000`), and `decide` checks the
resulting closed-form integer inequality. `τ = 1` is handled separately by
`gamma_one_pos`, proved directly (no base-value `decide` call needed): the
single term `j = 1` is either guarded off (`k = 0`, giving `Gamma 1 0 = 1 >
0`) or reduces via `catalan_strict_two_step` (itself from the recurrence) to
`Cat_{k−1} < Cat_{k+1}`.

Each `gamma_pos_τ` (`τ = 2..7`) then combines `gamma_base_τ` with
`gamma_pos_of_base` for the general-`k` conclusion `∀ k, K(τ) ≤ k → 0 < Gamma
τ k`.

I independently reconfirmed every `K(τ)` numerically (exact-integer Python,
`EVIDENCE/generate_gamma_witnesses.py`): `Gamma(1,0)=1`, `Gamma(2,2)=2`,
`Gamma(3,3)=4`, `Gamma(4,4)=5`, `Gamma(5,6)=18`, `Gamma(6,12)=16848`,
`Gamma(7,70)=1327331792479871686755508212156357075`, all strictly positive,
and `C(142,71)` has exactly 42 digits (condition (vi): the originating
return's "41 digits" is corrected).

### 3.7 The `τ ≥ 8` ceiling

`gamma_neg_of_ge_eight (τ k : ℕ) (hτ : 8 ≤ τ) (hk : τ ≤ k)`:

```
Gamma τ k < 0
```

Same finitary engine, run in the other direction. `catalan_succ_lt_four_mul`
(`Cat_{m+1} < 4·Cat_m`, from the recurrence) iterates to `catalan_pow_bound`
(`Cat_{m+i} < 4^i · Cat_m`) and then `catalan_cross_lower` (`Cat_{k+1} <
4^{j+1}·Cat_{k−j}`), which lower-bounds every term of the gap sum. The
binomial theorem at `(1+4)^τ = 5^τ` splits as `Σ_{j=1}^{τ} C(τ,j)·4^{τ−j} +
4^τ = 5^τ` (`binom_five_pow_split`), and `5·4^τ ≤ 5^τ` for `τ ≥ 8`
(`five_pow_ge`, by induction — this is `Addendum §A2`'s criterion `(5/4)^τ − 1
< 4 ⟺ τ ≤ 7`, used at the complementary threshold `τ ≥ 8`) makes the lower
bound on the gap sum strictly exceed `Cat_{k+1}`, giving `Gamma τ k < 0`. No
limit, no real/rational analysis anywhere in this project.

## 4. Threshold-minimality witnesses (condition (iii) — added)

The `K(1..7)` literals above certify the *sufficiency* half only:
`Γ(τ,k) > 0` for `k ≥ K(τ)`. This project also adds the *minimality* half —
`K(τ)` is the least such threshold — as six additional kernel-decided lemmas,
each proved by `catalan_eq_centralBinom_div` then `decide` (never
`native_decide`):

| witness | value | note |
|---|---|---|
| `Gamma 2 1` | `0` | **a plateau, not a strict negative** — `Γ ≤ 0` at `k = K(τ)−1` is the correct minimality statement; `Γ(2,1)=0` shows `K(2)=2` cannot be lowered to `1` since `Γ` is not yet strictly positive there |
| `Gamma 3 2` | `−1` | |
| `Gamma 4 3` | `−4` | |
| `Gamma 5 5` | `−14` | |
| `Gamma 6 11` | `−1563` | |
| `Gamma 7 69` | `−799363812466329793611557404284949737` | |

The `τ = 2, 3, 4` witnesses sit at `k < τ` (`k = 1 < 2`; `k = 2 < 3`; `k = 3 <
4`), **outside `Gamma_unfold`'s domain** (`Gamma_unfold` requires `hk : τ ≤
k`), so these three are proved directly from the raw definition of `Gamma`
(unfolding the `Finset.Icc 1 τ` sum termwise, with the `if j ≤ k` guard
load-bearing since some `j > k` terms are present and must vanish) rather than
through `Gamma_unfold`. The `τ = 5, 6, 7` witnesses sit at `k ≥ τ`
(`5 ≤ 5`, `6 ≤ 11`, `7 ≤ 69`) and go through `Gamma_unfold` exactly as the
base values do. All six were independently reconfirmed by exact-integer
Python (`EVIDENCE/generate_gamma_witnesses.py`) before formalization, so that
a `decide` failure would be diagnosed as a translation bug rather than a false
numeric claim.

## 5. Alias note (condition (iv))

`gamma_pos_4`, after unfolding `Gamma`, states the same integer inequality as
the frozen, already formally verified `Erdos993G1.ThirdWide.catalan_gap_pos`
(ENTRY 149 of the frozen C3 Lean source, cited in `SEMANTIC-CONTRACT.md`'s
digest chain). **This project does not import or depend on that frozen
declaration.** `gamma_pos_4` is re-derived here from scratch, inside this
project's own closed dependency DAG against pinned Mathlib alone. The
coincidence is recorded as an alias for cross-reference only.

## 6. Correction to the originating source (condition (i))

The originating seat's compiled project
(`scratchpad/c3-U3/LeanProof/Main.lean`, digest
`e5785f1c707e28fc4190a159ac8f5d5b10914ce619857c821bdd28db9fe43a18`) names its
strict log-inequality lemma `catalan_strict_logConcave`, but the statement it
proves —

```
Cat_{n+1}·Cat_{n+1} < Cat_n·Cat_{n+2}
```

— is strict log-**convexity** (an increasing-ratio statement), the exact
reverse of the name. This project renames the lemma
`catalan_strict_logConvex` throughout, including every downstream reference
and every prose mention in this document and in `FORMALIZER-REPORT.md`. No
run fence is breached by the original name (the objects are Catalan integers,
not graph independence-polynomial coefficients `i_k(F)`, and the inequality is
proved, never assumed as a premise), but the run's fence list forbids the
fenced word for its opposite meaning, so the rename is carried through
completely.

## 7. Scope exclusions (fences)

This project proves a statement about Catalan integers only. It does not
state or imply anything about forests, covers, matchings, `Δ_k`, `i_k`,
`x(F)`, `c(d)`, any graph, Tier 1/2/3, the diagnostic band, FOREST, TREE,
TRANSFER, `E993-BETA-AGG`, or Erdős #993, and it imports and re-declares
nothing from the frozen G1 Lean sources — `indepCount`, `coeff`, `delta`,
`stratum` do not occur anywhere in this project. Per condition (vii), the
originating file's Part 6 (`exists_subsuperset_card_eq_five`,
`cover_pad_to_five` — the obligation-(3) cover-padding fragment) is **not**
carried into this run; it is outside this award's scope.

## 8. Terminal declaration

`Erdos993G1.U3.catalanGap_monotone_ratio_award` is the explicit conjunction of
the four parts of the award (monotone-ratio, propagation-from-base, the seven
positivity theorems, and the `τ ≥ 8` ceiling), stated in full in
`THEOREM-CONTRACT.yaml`. It is the single terminal `theorem` the governed
workflow binds; every other declaration is a supporting lemma or theorem
registered ahead of it in dependency order.
