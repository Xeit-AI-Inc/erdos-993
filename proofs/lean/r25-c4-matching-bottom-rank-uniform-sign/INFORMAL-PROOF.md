# Informal proof — `Erdos993G1.UniformMatching.bottomRank_delta_nonpos`

Award group `C4-LA1` (`BOTTOM-RANK-UNIFORM-MATCHING-SIGN`), Cycle 4 Stage 7,
run `erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`. Formalizer
seat: Claude Sonnet 5 (chartered effort `xhigh`; the transport exposes no
effort parameter and this seat cannot self-inspect its runtime model/effort —
stated on dispatch-record authority). Governed run root
`runs/lean-2026-09-21-c4-bottom-rank-uniform-matching-sign`.

## 1. Definitions (verbatim, `SEMANTIC-CONTRACT.md` / frozen C3 source
`sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean`,
SHA-256 `aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`)

```lean
noncomputable def Erdos993G1.indepCount {V : Type u} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)
noncomputable def Erdos993G1.coeff {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0
noncomputable def Erdos993G1.delta {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k
noncomputable def Erdos993G1.FirstWide.stratum {X : Type u} [Fintype X]
    (G : SimpleGraph X) (M : Finset X) (k j : ℕ) : Finset (Finset X) :=
  (G.indepSetFinset k).filter (fun S => (S ∩ M).card = j)
```

`i_k(F)` counts actual independent `k`-subsets once (`i_0 = 1` for every
finite graph); `coeff` is the integer zero-extension of `i_k` to `k < 0`;
`Δ_k(F) = i_{k+1} - i_k`. These are reused **verbatim**; nothing is weakened
or replaced. No other G1 definition (`firstDescent`, `ambientA`/`ambientH`,
`residual`, `ordinaryG1Guards`, …) is touched, referenced, or transferred to.

## 2. `m(d)`, `K`, strata

For `d ≥ 3`, `m(d) := ⌈3d/2⌉ - 1 = (3d+1)/2 - 1` in ℕ division (checked at
both parities below). At the bottom rank `r = d`, order `n = 3d = 2r + d`.
Fix a matching of size `m := m(d)` realised by an injective
`f : Fin m × Bool → X` with `G.Adj (f(i,false)) (f(i,true))` for every `i`,
`M := image f`, `K := 2m - d`. For `k, j ∈ ℕ`:

```
S(k,j) := { S ⊆ V(G) : S independent, |S| = k, |S ∩ M| = j }   -- FirstWide.stratum G M k j
a_j := |S(d,j)|,  b_j := |S(d+1,j)|
```

## 3. The two incidence inequalities, at the Lean statements' breadth
(condition (iii))

**Outside incidence** (`Erdos993G1.UniformMatching.matching_outside_incidence`):
for *any* `M : Finset X` with `M.card = 2*m` (not necessarily `image f` — the
Lean lemma never uses the matching structure, only `|M| = 2m`; this is
**broader** than an earlier informal draft's "`M = image f`" reading, and the
Lean statement is the one of record) and any `r,j`:

```
(r+1-j) * |S(r+1,j)|  ≤  (r+j-K) * |S(r,j)|        (ℕ, ordinary truncation)
```

Proof: double-count pairs `(T,v)`, `T ∈ S(r+1,j)`, `v ∈ T \ M`. Exactly
`(r+1-j)` such `v` per `T`. Map `(T,v) ↦ (T\{v}, v) =: (A,v)`, injective,
`A ∈ S(r,j)`. Each `A` receives at most `|V \ (M∪A)| = (2r+d)-(2m+r-j) = r+j-K`
such pairs.

**Inside incidence** (`matching_inside_incidence`): for `M = image f` (this
one genuinely needs the matching, not just `|M|=2m` — Lean hypothesis is the
injective `f` and the adjacency family) and `j+1 ≤ m`:

```
(j+1) * |S(r+1,j+1)|  ≤  2*(m-j) * |S(r,j)|
```

Proof: double-count `(T,v)`, `T ∈ S(r+1,j+1)`, `v ∈ T ∩ M`. Exactly `j+1`
choices of `v` per `T`. `(T,v) ↦ (T\{v},v)`, injective, target in `S(r,j)`;
each `A ∈ S(r,j)` receives at most `2(m-j)` (the free endpoints of the
`m-j` matched edges `A` does not yet meet).

Three emptiness facts (`stratum_empty_of_card_lt`, `stratum_empty_of_index_gt`,
`stratum_empty_of_index_gt_matching`): `S(k,j) = ∅` if `n+j < 2m+k`
(cardinality budget), if `j > k` (index budget: `S∩M ⊆ S`), or if `j > m`
(matching budget: every independent set meets an `m`-matching in at most `m`
vertices).

## 4. Live windows at `r = d`, both parities, boundary-index checks

At `r=d`, `k ∈ {d,d+1}` (both ≤ m, so `stratum_empty_of_index_gt_matching`
never fires ahead of `stratum_empty_of_index_gt` in this window — checked
below), so only `stratum_empty_of_card_lt` (kills small `j`) and
`stratum_empty_of_index_gt` (kills `j > k`, always the exact top of the live
window since `k = j` is literally the emptiness threshold) are needed.

**Odd `d = 2e+1`, `e ≥ 1`.** `m = 3e+1`, `K = 4e+1`, `n = 6e+3`.

- `a`-stratum, `k=r=2e+1`: card-empty `⟺ n+j < 2m+k = 8e+3 ⟺ j < 2e`.
  index-empty `⟺ j > 2e+1`. **Live `a ∈ {2e, 2e+1}`.**
- `b`-stratum, `k=r+1=2e+2`: card-empty `⟺ n+j < 2m+k = 8e+4 ⟺ j < 2e+1`.
  index-empty `⟺ j > 2e+2`. **Live `b ∈ {2e+1, 2e+2}`.**
- Matching-budget check: `k=2e+2 ≤ m=3e+1 ⟺ e ≥ 1` — holds exactly at the
  hypothesis boundary; below it (`e=0`, i.e. `d=1`) the theorem does not
  apply (`d ≥ 3` excludes it). At `e ≥ 1` index-emptiness alone already
  covers every `j` above the live window within `[0,m]`.

**Even `d = 2e`, `e ≥ 2`.** `m = 3e-1`, `K = 4e-2`, `n = 6e`.

- `a`-stratum, `k=r=2e`: card-empty `⟺ n+j < 2m+k = 8e-2 ⟺ j < 2e-2`.
  index-empty `⟺ j > 2e`. **Live `a ∈ {2e-2, 2e-1, 2e}`.**
- `b`-stratum, `k=r+1=2e+1`: card-empty `⟺ n+j < 2m+k = 8e-1 ⟺ j < 2e-1`.
  index-empty `⟺ j > 2e+1`. **Live `b ∈ {2e-1, 2e, 2e+1}`.**
- Matching-budget check: `k=2e+1 ≤ m=3e-1 ⟺ e ≥ 2` — again exactly the
  hypothesis boundary (`d=4` is the smallest even instance, matching the
  brief's "no hidden `e ≥ 3`" requirement: `e=2` is already covered, with no
  slack needed in the argument).

Both boundary computations are re-verified for `d = 3..400` by
`EVIDENCE/verify_bottom_rank_certificate.py`
(`EVIDENCE/bottom-rank-certificate.out.json`, digest below).

## 5. Closed-form dual per parity (critic-attribution, condition (i))

The `r = d` dual is **CRITIC-ATTRIBUTED**: `C-U4-T`'s re-derivation (7)
(`cycles/cycle-4/stage4/critics/U4/T/CRITIQUE.md`, "Independent re-derivation"
§(7)) on both branches; `C-U4-F` independently corroborates the same vector
on the even branch and finds two distinct feasible vectors on the odd branch
(`C-U4-F`'s `check_residues.py`/exact LP re-solve, per
`cycles/cycle-4/stage4/critics/U4/F/CRITIQUE.md`) — this proof uses
**`C-U4-T`'s vector** throughout (stated explicitly, per the brief's
condition (i) instruction "use C-U4-T's re-derivation (7) or state which you
use"). The generalised `(m,d)` incidence family itself (§3 above) is seat
**U4**'s (`U-C4-04` return, `cycles/cycle-4/stage3/returns/U4/RETURN.md`).

Writing `coef_b(j) = λ_j(r+1-j) + [j>0]·j·μ_{j-1}` and
`coef_a(j) = λ_j(r+j-K) + [j<m]·2(m-j)·μ_j` (the standing `B1` soundness
form, `cycles/cycle-3/stage6/SYNTHESIS.md`, cited not re-derived):

**Odd `d=2e+1`:** `μ_{2e} = μ_{2e+1} = λ_{2e+1} = 1/(2e+2)`, all other
`λ,μ = 0`. `coef_a(2e) = 1`; `coef_a(2e+1) = (2e+1)/(2e+2)`;
`coef_b(2e+1) = coef_b(2e+2) = 1`.

**Even `d=2e`, `e≥2`:** `μ_{2e-2} = (2e-2)/((2e+1)(2e-1))`,
`λ_{2e-1} = λ_{2e} = 3/(2(2e+1))`, `μ_{2e-1} = (4e-1)/(4e(2e+1))`,
`μ_{2e} = 1/(2e+1)`. `coef_a(2e-2) = (4e²-4)/(4e²-1)`; all other live
`coef_a = 1`; all live `coef_b = 1`.

Both were **re-verified exactly** (rational, `fractions.Fraction`-equivalent
arithmetic) by this seat independently of the critic's own script, for every
column condition (`coef_b(j) ≥ 1` on live `b`, `coef_a(j) ≤ 1` on live `a`,
all `λ,μ ≥ 0`) at every `d = 3..400`; see §7.

## 6. Cleared integer certificate, per parity (what Lean actually proves)

Rather than formalise the LP weights `λ,μ` as ℚ objects, the Lean proof
clears denominators and works with the **raw incidence facts directly** —
exactly the brief's guidance (§4.2–4.3 of the brief), verified rather than
trusted:

**Odd branch** (`Erdos993G1.UniformMatching.bottomRank_odd_delta_nonpos`,
`e ≥ 1`; write `a₀=|S(d,2e)|`, `a₁=|S(d,2e+1)|`, `b₁=|S(d+1,2e+1)|`,
`b₂=|S(d+1,2e+2)|`):

```
O  : outside(j=2e+1)  ⟹  b₁ ≤ a₁                          (both raw coeffs = 1)
I1 : inside(i=2e)     ⟹  (2e+1)·b₁ ≤ 2(e+1)·a₀
I2 : inside(i=2e+1)   ⟹  (2e+2)·b₂ ≤ 2e·a₁
```

`O + I1` gives `(2e+2)·b₁ ≤ a₁ + 2(e+1)·a₀`; adding `I2` gives
`(2e+2)·(b₁+b₂) ≤ (2e+1)·a₁ + (2e+2)·a₀`; adding the trivial `a₁ ≥ 0` pads
the `a₁` coefficient from `2e+1` to `2e+2`:

```
(2e+2)·(b₁+b₂) ≤ (2e+2)·(a₀+a₁)   ⟹   b₁+b₂ ≤ a₀+a₁   (since 2e+2 > 0)
```

which is exactly `i_{d+1} ≤ i_d`, i.e. `Δ_d(G) ≤ 0`. This is a four-term,
unit-weight combination — `O`, `I1`, `I2`, and one positivity fact, each used
with coefficient exactly `1` — so the Lean proof supplies it via `linarith`
directly from the four `have`s, with no explicit multiplier needed.

**Even branch** (`bottomRank_even_delta_nonpos`, `e ≥ 2`; substitute
`e = e'+2`, `e' ≥ 0`, so every coefficient below is addition-only — the
`Lean` proof performs this substitution with `obtain ⟨e', rfl⟩` immediately.
Write `A0,A1,A2 = |S(d,2e-2)|,|S(d,2e-1)|,|S(d,2e)|` and
`B0,B1,B2 = |S(d+1,2e-1)|,|S(d+1,2e)|,|S(d+1,2e+1)|`):

```
Oa : outside(j=2e-1)   ⟹  2·B0 ≤ A1
Ob : outside(j=2e)     ⟹  B1 ≤ 2·A2
Ic : inside(i=2e-2)    ⟹  (2e'+3)·B0 ≤ (2e'+6)·A0
Id : inside(i=2e-1)    ⟹  (2e'+4)·B1 ≤ (2e'+4)·A1
Ie : inside(i=2e)      ⟹  (2e'+5)·B2 ≤ (2e'+2)·A2
```

(all four coefficients on each line are literally the raw `(r+1-j)`/`(r+j-K)`
or `(i+1)`/`2(m-i)` values, substituted and simplified by `omega` — e.g. at
`j=2e-1`: `r+1-j = (2e+1)-(2e-1) = 2`, `r+j-K = (2e)+(2e-1)-(4e-2) = 1`).
Clearing denominators (the exact integer weights the Lean proof uses,
matching `D·λ_j`, `D·μ_i` for `D = 4e(2e-1)(2e+1)` rewritten in `e'`):

```
wOa = wOb = 12e'²+42e'+36        wIc = 8e'²+24e'+16
wId = 8e'²+26e'+21               wIe = 8e'²+28e'+24
D   = 16e'³+96e'²+188e'+120      slack(A0) = 12e'+24
```

all manifestly `≥ 0` for `e' ≥ 0` (`positivity` in Lean). The identity
`wOa·Oa + wOb·Ob + wIc·Ic + wId·Id + wIe·Ie + slack(A0)·A0
  = D·(A0+A1+A2) − D·(B0+B1+B2)` holds **exactly** — every one of the six
atom coefficients collected equals `D` (verified both symbolically, by exact
polynomial arithmetic, and numerically for `e' = 0..499`, i.e. `d = 4..1002`
⊃ the required `d = 3..400`; see `EVIDENCE/`). Since every term on the left
is `≥ 0`, `D·(A0+A1+A2-B0-B1-B2) ≥ 0`, and `D > 0`, so
`B0+B1+B2 ≤ A0+A1+A2`, i.e. `Δ_d(G) ≤ 0`. In Lean this is `nlinarith` from
the five scaled `mul_le_mul_of_nonneg_left` facts plus the slack term,
followed by `le_of_mul_le_mul_left` to cancel `D`.

Both cleared inequalities were checked exactly (Python integers, no floats)
for **all** `d = 3..400` by `EVIDENCE/verify_bottom_rank_certificate.py`,
independent of and prior to the Lean proof; digest below.

## 7. Small cases (no hidden stronger hypothesis)

`d=3` is `e=1` on the odd branch (`m=4,K=5`); `d=4` is `e=2` on the even
branch (`m=5,K=6`, i.e. `e'=0`). Both are exactly the two cells
`CriticBottomRank.lean` compiles concretely
(`scratchpad/c4-crit-U4-T-replay/LeanProject/LeanProof/CriticBottomRank.lean`,
SHA-256 `c4d1810c54f38e88e04736550ef82d0e574562afb0759d5bc02427bd88e2eedc`,
theorems `bottomRank_d3_delta_nonpos`/`bottomRank_d4_delta_nonpos`), and the
symbolic Lean proof in this run specialises to the *same* raw incidence
instances at `e=1`/`e'=0` — checked by direct substitution and by the
`e ≥ 1`/`e' ≥ 0` hypotheses never being strengthened anywhere in the proof
(no `e ≥ 2` sneaks into the odd branch; no `e ≥ 3`/`e' ≥ 1` sneaks into the
even branch — every arithmetic side-condition in the Lean source is
discharged by `omega` from exactly `he : 1 ≤ e` (odd) or `he : 2 ≤ e` (even),
never a stronger fact).

## 8. Terminal statement and parity split

```lean
theorem Erdos993G1.UniformMatching.bottomRank_delta_nonpos {X : Type u} [Finite X]
    (d : ℕ) (hd : 3 ≤ d) (G : SimpleGraph X)
    (hn : Nat.card X = 3 * d)
    (f : Fin ((3 * d + 1) / 2 - 1) × Bool → X) (hf : Function.Injective f)
    (he : ∀ i, G.Adj (f (i, false)) (f (i, true))) :
    Erdos993G1.delta G (d : ℤ) ≤ 0
```

`Nat.even_or_odd' d` gives `d = 2*e` or `d = 2*e+1`; `(3*d+1)/2-1` is checked
by `omega` (ℕ division by the literal `2`) to equal `3*e+1` (odd) or `3*e-1`
(even) — both exact, no additional floor-adjustment needed. `f` (of type
`Fin ((3*d+1)/2-1) × Bool → X`) is transported to the branch lemma's
`Fin (3*e±1) × Bool → X` domain via `Fin.cast` along that arithmetic
equality, composed with `Prod.map`; injectivity and adjacency transport
along the same cast (`Function.Injective.prodMap`, `Function.Injective.comp`).
The two branch lemmas of §6 are then applied directly.

## 9. The `[Finite X]` bridge (condition (ii))

U4's fragment states its 26 declarations with `[Fintype X] [DecidableEq X]`;
the award idiom (matching the formally verified `sevenMatching_delta_nonpos`
of the Cycle 1 award,
`runs/lean-2026-09-20-c1-d5-seven-matching-sign/LeanProject/LeanProof/Main.lean`,
SHA-256 `c1061ca67ff78acd477769e56e94a054646e7d7f18b207cf5c0a0b8e6c56b5dc`) uses
`[Finite X]`. The bridge is exactly `classical; letI := Fintype.ofFinite X` at
the top of each branch lemma and the terminal theorem — the same two-line
idiom the Cycle 1 award already uses. This is not a gap; it is recorded here
so a reviewer does not read it as one.

## 10. Attribution summary (condition (i))

- The generalised `(m,d)` incidence family (§3), its three emptiness facts,
  and the nine transcribed `FirstWide` structural lemmas: seat **U4**
  (`U-C4-04` return), all 26 declarations kernel-checked by the U adjudicator
  before this Stage 7 session began and re-registered byte-for-byte here
  (see `EVIDENCE`/report hash table).
- The `r=d` closed-form dual, both parities: **critic-attributed**, `C-U4-T`
  re-derivation (7) — used here — independently corroborated by `C-U4-F`.
- The live-window boundary derivation (§4), the cleared-integer certificates
  (§6), the `Fin.cast` parity-split assembly (§8), and all Lean engineering
  in this run: this Stage 7 formalizer session.

## 11. Fidelity item (condition (iii)), widened text

The Lean `matching_outside_incidence` holds for an **arbitrary** `M : Finset X`
with `M.card = 2*m` — it never uses the matching structure of `M`, only its
cardinality. This is broader than an earlier informal draft's §5.4 text,
which described `M` as `image f`. The informal statement in §3 above is
written at the Lean statement's actual breadth, per this condition.

## 12. Scope exclusions and excluded margin literals (mandatory fences)

This theorem is **not** the Tier 3a schema `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`.
It says nothing at any rank other than `r = d`, nothing about the band
`d < r < K(d)`, nothing about `r ≥ K(d)`. No transfer to
`firstDescent`/`x(G)`, forests, residuals, G1 tuples, Tier 1, Tier 2, the
diagnostic band, FOREST, TREE, TRANSFER, or Erdős #993. No sharpness claim.
The terminal-margin literals `3/(d²−4)` and `1/(d−1)` are **excluded from
this award**: no definition of record for "terminal margin" exists; they
appear above (§5, "reproduced exactly" in the critic's re-derivation) only as
proof data corroborating that the dual is the registered one, never as a
theorem of this file. G1 definitions are reused verbatim (§1). No `sorry`,
`admit`, `native_decide`; axioms exactly `propext`, `Classical.choice`,
`Quot.sound` (kernel-checked, `RECEIPTS/kernel-verification.json`).

## 13. Evidence digests

- `EVIDENCE/verify_bottom_rank_certificate.py` — the exact-integer generator
  (deterministic, no wall-clock/PID/host field), checking both parities'
  live windows and cleared-integer certificate identities for `d = 3..400`.
- `EVIDENCE/bottom-rank-certificate.out.json` — its output, `398` rows, all
  passed, with an internal payload digest.
- `SOURCE/originating-fragment-Main.lean` — a read-only copy of the
  originating U4 fragment, digest `aad2a9e783442927112843601a896834148a978baf9b9b30383c280517680ce6`
  (matches the capsule-cited digest, re-verified in `CAPSULE-VERIFICATION.json`).

(Exact SHA-256 values of this file, `THEOREM-CONTRACT.yaml`,
`LeanProject/LeanProof/Main.lean`, and `RECEIPTS/kernel-verification.json`
are reported in `FORMALIZER-REPORT.md` and the final message.)
