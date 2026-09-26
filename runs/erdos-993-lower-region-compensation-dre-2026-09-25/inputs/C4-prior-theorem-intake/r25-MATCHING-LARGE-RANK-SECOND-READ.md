# Second Read — E2

Controller-commissioned independent second reader for the adjudicator-identified
result **E2** (large-rank matching-branch sign), Cycle 4, run
`erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`. Adversarial and
independent; child delegation not used.

**Model disclosure.** chartered opus/high; transport-resolved model opus
(explicit parameter); the seat cannot self-inspect its runtime model/effort —
stated on dispatch-record authority.

## Identity and seal audit

Capsule `control/c4-second-read/E2-PACKET-MANIFEST.json`, schema
`verityos.math-dre.packet-manifest.v1`, stage `cycle-4-stage5-second-read-E2`.

Seal recomputed canonically by my own generator (`verify_seal.py`): SHA-256 of
the compact key-sorted JSON of the manifest minus `seal_sha256`, separators
`(",",":")`, no trailing newline:

```
b67356aa027442508dae857d682b8d21f3ebf8a7cae82a73583b359f4dbe04f0
```

This equals the manifest's own `seal_sha256` **and** the value carried on the
dispatch record. `file_count` 13 equals the number of `files` entries. All
**13/13** member digests and byte counts independently recomputed and matched:
0 missing, 0 mismatched. Earlier chain cited for reference only, not
recomputed (the files are outside this capsule): Stage 4
`efdc4f00…`, Stage 3 `b5d112cd…`, Stage 2 `36a38fb9…` (T1 and T2 each
independently report recomputing the Stage 2 seal to `36a38fb9…`).

Read boundary observed: only the capsule's 13 members, plus
`control/c4-second-read/PATH-CHECK-E2.json` (a member). No other orientation,
no prior-cycle returns/critiques/adjudications, no other experiment root, no
external source. Provenance was located with `Read` and with `python3` reads of
the permitted registry member only — no repository-wide search. Replayable
scratch was written fresh under the absolute path
`<run root>/scratchpad/c4-second-read-E2/`; `/tmp`, `mktemp` and `TMPDIR` were
not used. No `lake clean`, `lake update` or `elan` was run. Three background
jobs were launched, each polled by PID with `kill -0` in a bounded loop, and all
three were confirmed dead before this file was written.

## Independent derivation

Written and committed to scratch (`DERIVATION-BEFORE-READING.md`,
digest below) **before** opening the T adjudication, the T1/T2 returns or the
critiques, from `SEMANTIC-CONTRACT.md` and the registered statements of
`E993-R25-MATCHING-CERTIFICATE-SOUNDNESS`,
`E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF` and
`E993-R25-CLAMPED-DUAL-DOMINATION` read out of the registry member.

Let `G` be finite simple of order `n = 2r+d`, `M` a matching with `|M| = m`,
`W = V ∖ V(M)`, `K := 2m−d`, `t := r−K`, so `|W| = 2r−K`. For an independent
set `S`, `|S ∩ e| ≤ 1` for each `e ∈ M`, so the level `lev(S) := #{e ∈ M :
S ∩ e ≠ ∅}` equals `|S ∩ V(M)|`. With `a_j` (resp. `b_j`) the number of
independent `r`-sets (resp. `(r+1)`-sets) of level `j`, `Σ a_j = i_r`,
`Σ b_j = i_{r+1}`, and `Δ_r ≤ 0 ⟺ Σ b_j ≤ Σ a_j`.

Two double-counts, each derived here from scratch:

```
C1_j   (r+1−j) · b_j    ≤ (r+j−K) · a_j                (delete a W-vertex)
C2_j   (j+1)  · b_{j+1} ≤ 2(m−j) · a_j   (j = 0…m−1)   (delete a matched vertex)
```

C1: each `S ∈ B_j` has exactly `r+1−j` vertices in `W`; each `T ∈ A_j` extends
only by `w ∈ W∖T`, and `|W∖T| = (2r−K)−(r−j) = t+j`. C2: each `S ∈ B_{j+1}` has
exactly `j+1` matched vertices; each `T ∈ A_j` extends only by a vertex of one
of the `m−j` edges it misses, at most `2(m−j)` choices.

**What a valid dual certificate at `(m,d,r)` must satisfy.** Multiply C1_j by
`λ_j ≥ 0` and C2_j by `μ_j ≥ 0` and add; with `μ_{−1} := 0`, `μ_m := 0`,

```
coef_b(j) = λ_j (r+1−j) + j·μ_{j−1}        coef_a(j) = λ_j (r+j−K) + 2(m−j)·μ_j
```

and the sum reads `Σ coef_b(j) b_j ≤ Σ coef_a(j) a_j`. Hence the requirement is
exactly `λ_j ≥ 0`, `μ_j ≥ 0`, `coef_b(j) ≥ 1` on every alive `b`-index and
`coef_a(j) ≤ 1` on every alive `a`-index, since then
`i_{r+1} = Σ b_j ≤ Σ coef_b b_j ≤ Σ coef_a a_j ≤ Σ a_j = i_r`. This reproduces
`E993-R25-MATCHING-CERTIFICATE-SOUNDNESS` verbatim, coefficient for coefficient.

**Greedy dual, derived.** Setting `coef_b(j) = 1` and `coef_a(j) = 1` and
writing `ε_j := j·μ_{j−1}` gives `λ_j = (1−ε_j)/(r+1−j)` (clamped to `0` when
`ε_j > 1`) and `μ_j = (1 − λ_j(t+j))/(2(m−j))`, whence on the unclamped branch

```
ε_{j+1} = (j+1)[(K+1−2j) + ε_j(t+j)] / [2(m−j)(t+K+1−j)]
```

— **exactly** the registered recursion — and the terminal row `j = m` gives
`coef_a(m) ≤ 1 ⟺ ε_m(t+m) − (d−1) ≥ 0`, i.e. **exactly** the registered
`Q_{m,d}`, using `t+K+1−m = (t+m)−(d−1)`. On the clamped branch
`μ_j = 1/(2(m−j))`, so `μ_{m−1} = 1/2` and `ε_m = m/2`, and the terminal row is
`m(t+m) ≥ 2(d−1)` — the registered clamped-dual quantity.

**My own reduction, stated before reading the adjudication.** With this greedy
the rows `coef_b(j) ≥ 1` (all `j`) and `coef_a(j) ≤ 1` (`j ≤ m−1`) hold
*identically by construction*, clamped or not. The theorem therefore reduces to
exactly two facts: **(P1)** `μ_j ≥ 0` for `j ≤ m−1`, and **(P2)** the terminal
row. This prediction is what I then graded the adjudicator's five links against.

**Threshold and regime facts I established independently.**
`3d ≤ 2m+2 ⟺ m ≥ ⌈3d/2⌉−1`, so `m(d)` is *precisely* the least `m` meeting the
positivity-iff hypothesis — the threshold is forced by the algebra, not chosen
(verified for every `d ∈ [0, 20000]`). At `m = m(d)`: `2m−3d+3 = 1` (even `d`),
`= 2` (odd `d`); `K(d) ≥ m(d)` for every `d ∈ [2, 20000]`, so
`r+1−j ≥ t+1 ≥ 1 > 0` and the division that the adjudication's struck literals
show can fail (`(m,d,t) = (2,4,0)`) **cannot** occur anywhere in E2's regime;
`m(d)−d+1 ≥ 1` for every `d ∈ [2, 20000]`; and at `t ≥ 0` every `j ∈ [0,m]` has
`r+j−K = t+j ≥ 0`, so the ℕ/ℤ reconciliation the soundness lemma's scope
demands is automatic and no alive-window subtlety arises.

## Link-by-link verdicts

**(i) T1's chain equals the certificate's clamped-greedy dual at `t = r−K ≥ 0`
— HOLDS.** T1's `g_j := 2(m−j)μ_j` satisfies `g_j = 1 − λ_j(t+j)`, and
`ε_j = j·μ_{j−1}` (T1's Fact A). I re-implemented T1's `g`-normalisation
recursion and the registry's `ε`-recursion separately and reproduced the
registered `Q` and its leading coefficient `m!·3^(m−1)·(2m−3d+3)` with
normalisation factor **exactly 1** (`m = 1…12`, every `0 ≤ d ≤ 2m`). T1's
ceiling identity `g_j^true = min(1, F_j(g_{j−1}^true))` is the same clamp rule I
derived independently.

**(ii) `λ_j ≥ 0` and `coef_b(j) ≥ 1` at every alive `b`-index — HOLDS**, with
one side-condition that should be stated because it is exactly where the
neighbouring struck literals died. `λ_j ≥ 0` holds by the clamp *provided*
`r+1−j > 0`. That needs `K ≥ m`, which is true throughout E2's regime
(`K(d) − m(d) = ⌈d/2⌉ − 1 ≥ 0` for `d ≥ 2`) but is *false* outside E1's region,
where the chain is genuinely undefined. `coef_b(j) = 1` unclamped and
`= ε_j > 1` clamped, so the row is met at every `j ∈ [0,m]` — a superset of the
alive indices, so the soundness lemma's "every alive `b_j`" is met a fortiori.

**(iii) `coef_a(j) = 1` for `j ≤ m−1` given E1 — HOLDS WITH A REPAIR (stated).**
The equality `coef_a(j) = 1` for `j ≤ m−1` holds **identically by construction**
of `μ_j`, with or without E1; E1 is not what supplies it. What E1 actually
supplies is `μ_j ≥ 0`, i.e. the *admissibility* of the dual. The adjudication's
gloss "because **E1** removes the only possible `μ`-clamp" is substantively
correct — a negative `μ_j` would have to be clamped to `0`, which pushes
`coef_a(j) = λ_j(t+j)` strictly above `1` and breaks the row — but the literal
sentence mis-assigns the dependency. **Repair, adopted:** read link (iii) as
"`μ_j ≥ 0` for every `j ≤ m−1` by **E1**; hence no `μ`-clamp is needed and
`coef_a(j) = 1` identically for `j ≤ m−1`." With that substitution the link is
correct and load-bearing. The mathematics is unchanged; the statement of E2 is
unchanged.

**(iv) The terminal constraint `coef_a(m) ≤ 1` is exactly `Q_{m,d}(t) ≥ 0` on
the unclamped branch — HOLDS.** I verified the equivalence by hand
(`coef_a(m) ≤ 1 ⟺ (1−ε_m)(t+m) ≤ t+K+1−m = (t+m)−(d−1) ⟺ ε_m(t+m) ≥ d−1`), and
the adjudication's own restatement `m·μ_{m−1}(t+m) ≥ 2m−K−1 = d−1` is correct
since `2m−K−1 = d−1`. The supply is legitimate: at `m = m(d)` the hypothesis
`3d ≤ 2m+2` of the registered VERIFIED
`E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF` holds (with equality for even
`d`), so `Q` is coefficientwise nonnegative and therefore `≥ 0` for every real
`t ≥ 0` — stronger than the integer `t` E2 needs. My own cleared polynomial
`N_m(t)(t+m) − (d−1)D_m(t)` reproduced the iff with **0 mismatches** over
`m = 1…30`, every `0 ≤ d ≤ 2m`.

**(v) The clamped branch is covered by the registered clamped-dual result
(`m(t+m) > 2(d−1)`) — HOLDS, and is doubly covered.** On a clamp,
`μ_{m−1} = 1/2`, `ε_m = m/2`, and the row is `m(t+m) ≥ 2(d−1)`; at `m = m(d)`
this is strict, which I verified in closed form rather than by census: at
`t = 0` it is `m(d)² > 2(d−1)`, and `m(d) ≥ (3d−2)/2` reduces it to
`9d² − 20d + 12 > 0`, whose discriminant is `−32 < 0`, so it holds for every
real `d` (and I checked `d ∈ [1, 20000]` directly: no exception). Independently,
a clamp at `j = m` means `ε_m > 1`, hence `λ_m = 0`, hence `coef_a(m) = 0 ≤ 1`
outright — so this link survives even if the registered quantity were withdrawn.
I also verified the *persistence* structure the link relies on: over **8,159**
cells (`d = 2…200`, `t = 0…40`, `m = m(d)`) the clamp set is **always** a
contiguous suffix ending at `j = m`, and its first index `j₀` **always**
satisfies `j₀ > (2m+2)/3` — 0 exceptions. Materially: clamps are not an edge
case. Of the 3,689 cells with `d ≤ 120`, `t ≤ 30`, **3,541 carry a clamp** and
**3,433 carry an interior clamp (`j < m`)**; the first interior clamp appears at
`d = 7`. Link (v) therefore carries most of the weight at `d ≥ 7`, and the
unclamped branch of link (iv) is the operative one only for `d ≤ 6`.

**Quantifier and edge-case checks the protocol lists.**
*Real vs integer `t`*: E1 and the positivity-iff both deliver real `t ≥ 0`;
E2 needs only integer `t = r−K ≥ 0`. No gap; the supply is strictly stronger.
*`m = m(d)` vs `m ≥ m(d)`*: E2 hypothesises a matching of size **at least**
`m(d)`; truncating it to a sub-matching of size exactly `m(d)` leaves `G`
untouched, so the order is still `2r+d` and every hypothesis is preserved — the
derivation uses only "`M` is a matching of `G` with `|M| = m`", never
`ν(G) = m`, never maximality. Truncation is sound. I additionally checked
feasibility at `m = m(d)+1, +2, +5` (261 cells, `d ≤ 30`, `t ∈ {0,1,7}`): 0
infeasible, so the certificate does not even need the truncation.
*Alive windows at `r ≥ K`*: every `j ∈ [0,m]` is ℤ-alive; the greedy meets both
row families at **all** `j`, a superset of "alive", so the lemma's hypotheses are
met verbatim. *ℕ/ℤ reading of `r+j−K`*: `= t+j ≥ 0` throughout — the scope note's
reconciliation is vacuous here, as the adjudication says.
*`d = 2`*: `m = 2`, `K = 2`, `3d = 6 = 2m+2` (boundary), chain unclamped,
`Q(0) = 1/4 > 0`, feasible. *`d = 3`*: `m = 4`, `K = 5`, `3d = 9 ≤ 10`, chain
unclamped, `Q(0) = 73/40 > 0`, feasible. *Soundness hypotheses verbatim*: `λ, μ`
are nonnegative **rationals** at integer `t`; both row families hold at every
index. Met.

## Attempts to break

All arithmetic exact (Python `int`/`Fraction`); no float in any decisive step;
every number below comes from a shipped, digested generator in the inventory.
Horizons are the attained ones.

**Certificate feasibility, my own implementation.** `m = m(d)`, `d = 2…120`,
`t = 0…30`: **3,689 cells, 0 infeasible, 0 negative `μ`, 0 rows violated.**
Larger matchings `m = m(d)+{1,2,5}`, `d = 2…30`, `t ∈ {0,1,7}`: **261 cells, 0
infeasible.** Spot cells away from the grid, including `(d,t) = (121,0)`,
`(200,0)`, `(200,500)`, `(301,0)`, `(400,0)`, `(400,1000)`, `(2,10⁶)`,
`(7,10⁶)`: all feasible. `t = 0` and the first `t` after a clamp were both
covered (the clamp set is not monotone in `t`: at `d = 7` there is an interior
clamp at `t = 0` and none at `t = 1,2`).

**E1 re-checked as a dependency — conclusion and proof skeleton.**
Conclusion, from my own `N_j/D_j` recursion: **600** in-region `(m,d)` cells
(`m ≤ 40`, every `j ≤ m`) — **0 negative coefficients**; at `m = m(d)` for
`d = 0…120` — all nonnegative. Five in-region-complement cells are *also*
nonnegative (`(d,m) = (2,1),(3,2),(3,3),(4,4),(5,6)`), so `3d ≤ 2m+2` is
sufficient but not necessary — consistent with E1, which claims only the one
direction. Proof skeleton, re-implemented from the critique's stated formulas
without reusing seat code: closed form `N_j = Σ_i (K+1−2i)W_iA_iB_i` vs the
recursion — **11,255 cases, 0 mismatches**; reflection identity
`A_iB_i = A_{K+1−i}B_{K+1−i}` — **3,480 pairs, 0 mismatches**; orphan search
(`m ≤ 200`) — **5,189,284 hard indices, 0 orphans, 0 failures of `m ≤ K+1`**
(my count agrees with the adjudicator's 5,189,284 exactly); `(P)`
`C(n,s) ≥ 2^s C(q,s)` — **300,763 instances, 0 failures, tightest ratio exactly
1** at `(m,d,n) = (2,2,2)`; step `(S)` — **1,845,312 instances, 0 failures**;
bases — `s=1` **15,050** cases and `s=2` **14,850** cases, `m ≤ 300`, 0 failures.
I also re-derived the decisive step by hand: `(S)` is the quadratic
`3n² − 3Kn + (K+1+4Km−4m²) ≥ 0`, its discriminant is
`9d² + 12(m+1)d − 12(m+1)²` (identity confirmed, 40,400 cases, 0 failures), and
with `u = m+1` this is `3[(3d−2u)(d+2u)]`, so `Δ ≤ 0 ⟺ 3d ≤ 2u = 2m+2`
**exactly** — an algebraic factorisation, not a census. The induction is
complete: `s` moves by 2 per step and its parity is fixed by `K`'s, so the two
bases cover every hard index.

**Explicit graphs — where a wrong theorem dies.**
*Exhaustive, smallest admissible order.* `d = 2`, `r = 2`, order 6: **all 32,768
labeled graphs** (= **156** isomorphism classes, the known value, computed by
orbit enumeration as a control); **32,576** carry a matching `≥ m(2) = 2`;
**0 violations**. The C2 fixed point is reproduced exactly: `Δ_2 > 0` holds for
graphs with **0 or 1** edges and for no others.
*Exhaustive local perturbation of the extremal point.* Every graph obtained from
`m(d)K₂ ⊔ pK₁` by adding a set of `≤ k` further edges (the planted matching
survives, so the hypothesis holds at every graph visited), 9 cells over
`d = 2…6` at `r = K, K+1`: **188,569 graphs enumerated exhaustively, 0
violations**. In **every** cell the maximiser of `Δ_r` is the comparator itself
(empty added-edge set) — an independent confirmation that the comparator is the
extremal graph, which is what my saturation computation predicted (the
comparator meets every C1_j and C2_j with equality).
*Structured families far from disjoint unions.* 17 families × 15 cells
(`d = 2…6`, `r = K, K+1, K+2`) = **255 instances, 0 violations**, maximum
`Δ_r = 0` attained: comparator, disjoint stars, `K_{m,n−m}`, `K_{m,m}`,
`K_{2m}` and `K_{2m+1}` plus isolated vertices, complete split graph, path,
cycle, caterpillar, `m` triangles, `mK₂` with `W` joined to one matched vertex,
`mK₂` with `W` a clique, `mK₂` with a hub in `W`, comparator plus a `W`-edge.
*Random graphs containing an `m(d)`-matching at `r = K, K+1`.* Seed 20260921,
9 cells, `d = 2…6`, orders 6…26: **2,850 graphs, 0 violations.**
*Active adversarial search.* Steepest-ascent local search that **maximises**
`Δ_r` over graphs carrying the planted `m(d)`-matching, 9 cells: the maximum
attainable value found is **exactly 0**, never positive.
*Registered fence graphs.* `6K₂ ⊔ (2r−7)K₁` at `d = 5`: `Δ_r > 0` for every
`r = 4…39` (reproduces `E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN`).
`3K₂ ⊔ (2r−3)K₁` at `d = 3`: `Δ_r > 0` for every `r = 2…39` (reproduces
`E993-FOREST-D3-BARE-MATCHING3-SIGN`).

**The threshold `m(d)` is exactly sharp — a new check.** For every `d = 2…40`
the comparator with `m(d) − 1` edges, `(m(d)−1)K₂ ⊔ pK₁` of order `2r+d`, has
`Δ_r > 0` **strictly, for every `r = K(d) … K(d)+119`** — 0 exceptions. So no
smaller matching threshold can work at any rank in E2's range. This generalises
the two registered fences (matching-3 at `d = 3`, six edges at `d = 5`) from two
bands to every `d ≤ 40` and confirms that E2's `m(d)` cannot be lowered.

**The rank threshold `K(d)` is NOT sharp — the other new check.** For every
`d = 2…40` the least `r` at which the comparator `m(d)K₂ ⊔ pK₁` attains
`Δ_r ≤ 0` is exactly `2⌈d/2⌉ − 1 = K(d) − (d−1)` (and it stays `≤ 0` to
`r = K+199`, 0 breaks). So at the extremal graph the sign already turns a full
`d−1` ranks below `K(d)`. `K(d)` is the point where `t ≥ 0` makes the alive
window full, not the point where the statement starts being true.
Probing the uncovered band directly (11 cells with `d ≤ r < K(d)`, `d = 3…6`,
exhaustive perturbation plus hill climbing): **0 positive `Δ_r`** — consistent
with T2's bounded computation. The band looks true; E2 simply does not reach it.

**No counterexample was found by any instrument.** Nothing above is a proof of
E2 beyond its stated dependencies; it is falsification pressure that E2 survived
at the horizons named.

## Fences and owned slices

I checked each registered fence against E2 by reading its statement and scope in
the registry member and reproducing its witness with my own instrument.

* `E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN` (REFUTED) — `6K₂ ⊔ (2r−7)K₁`
  at `d = 5` has `Δ_r > 0`. Uses `m = 6 < m(5) = 7`: **outside** E2. Reproduced.
* `E993-FOREST-D3-BARE-MATCHING3-SIGN` and `E993-FOREST-D3-BARE-MATCHING2-SIGN`
  (REFUTED) — matching `≥ 3`, resp. `≥ 2`, at `d = 3`. Both `< m(3) = 4`:
  **outside** E2. The matching-3 witness reproduced.
* C2 (`d = 2`, all graphs: `Δ_r > 0 ⟺ ≤ 1` edge) — E2 at `d = 2` requires a
  matching `≥ 2`, hence `≥ 2` edges, hence `Δ_r ≤ 0`. **Consistent**, and
  reproduced exhaustively at order 6.
* C3 (`d = 4`, five disjoint edges) — `m(4) = 5`. **Consistent**; the comparator
  `5K₂` at `r = 3` gives `Δ_3 = 0` exactly, the boundary case.
* `E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN` together with the sharpness
  sweep above puts `m(d)` exactly at the boundary: `m(d)−1` fails, `m(d)` works.

**E2 contradicts no registered REFUTED or comparator claim.** A comparator
failure is not a counterexample to a crossing theorem, and none was treated as
one here.

**Slices already owned by registered or awarded claims — named, not counted as
new**, confirmed against the registry:
* `d = 2` — the C2 fixed point, all `r`. E2 reproduces it and is weaker there
  (E2 only reaches `r ≥ 2`).
* `d = 4` — `E993-C3-GRAPH-MATCHING5-THIRD-BAND-SIGN` (VERIFIED): order `2r+4`,
  `r ≥ 3`, matching `≥ 5 = m(4)`. Strictly stronger than E2 at `d = 4`
  (E2 reaches only `r ≥ K(4) = 6`). E2 adds nothing here.
* `d = 5` — `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN` (VERIFIED, the
  Cycle 1 formal award): order `2r+5`, seven disjoint edges, **every `r ≥ 1`**.
  Strictly stronger than E2 at `d = 5` (E2 reaches only `r ≥ K(5) = 9`). E2 adds
  nothing here.

**Genuinely new content of E2: `d = 3`, and every `d ≥ 6`, at ranks
`r ≥ K(d)`.** This matches the adjudication's own accounting exactly.

## What E2 is not

* **No status transfers to Tier 1, Tier 2, FOREST, TREE, TRANSFER or Erdős
  #993.** E2 is bare and matching-only; `x(G) < r` never enters, `τ` never
  enters, acyclicity never enters. It says nothing about forests as a class,
  nothing about the G1 residual or the ten-guard tuple, nothing about
  convolution closure, and nothing about any tier above 3a.
* **It is one concrete instantiation of the OPEN Tier 3a schema**
  `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`, which stays OPEN as a schema and for
  which this instantiation requires its own registry key.
* **It is the large-rank half only.** The band `d ≤ r < K(d)` is **not covered**:
  there the alive windows genuinely truncate (`a_j = 0` for `j < K−r`), the
  certificate must be rebuilt on the alive window, and that is T2's object,
  standing at bounded computation (`d ≤ 300`) with
  `E993-R25-MATCHING-BOTTOM-RANK-UNIFORM-SIGN` still `CONDITIONAL` on the
  generalised `(m,d)` incidence lemmas. My own sub-`K` probe found no
  counterexample there either, but that is evidence, not coverage.
* **It is `proved_informal`, not formally verified**, and its grade is inherited:
  it is no stronger than `E993-R25-MATCHING-CERTIFICATE-SOUNDNESS`
  (`proved_informal`, VERIFIED status) and E1 (`proved_informal`).
* **`K(d)` is not claimed sharp, and is not sharp at the extremal graph** — see
  the `d−1` gap above. `m(d)` *is* sharp on the evidence gathered.
* **A second documentation repair.** The adjudication's Lean-readiness paragraph
  lists "the generalised incidence lemmas" inside E2's DAG. For the *informal*
  grade that is an over-inclusion: E2 needs only the elementary stratum
  double-count (C1/C2 above, which I re-derived from scratch in three lines
  each) as already absorbed into the registered **unconditional** soundness
  lemma. The sharper generalised incidence lemmas — coefficientwise
  nonnegativity of the cleared `A_j, B_j, E_j` forms — are U4's object and gate
  the *small-rank* `BOTTOM-RANK` claim, not E2. The remark is correct as a
  statement about what a Lean formalisation would have to build.

## Lean readiness

E2's exact Lean-style statement is: `∀ (d r : ℕ), 2 ≤ d → 2*(⌈3*d/2⌉−1) − d ≤ r
→ ∀ {V} [Fintype V] (G : SimpleGraph V), Fintype.card V = 2*r + d → (∃ M :
Finset (Sym2 V), M.card = ⌈3*d/2⌉−1 ∧ IsMatching G M) → Erdos993G1.delta G r ≤ 0`,
in the frozen `indepCount`/`coeff`/`delta` definitions of `SEMANTIC-CONTRACT.md`
(integer zero extension, `Δ_k = i_{k+1} − i_k`). Its dependency DAG has four
nodes: the stratum decomposition and the two incidence inequalities C1/C2
(elementary, but not yet formalised in general `(m,d)`); the soundness lemma
(`proved_informal`, unconditional); E1's coefficientwise positivity (needs the
`N_j/D_j` recursion, the reflection pairing, `(P)` and the discriminant of `(S)`
in Lean); and the terminal row, split into the registered positivity-iff
(unclamped) and the clamped-dual quantity, with the clamp-persistence lemma
joining them. What already exists kernel-checked in the run is the `(m,d) = (7,5)`
instance — the Cycle 1 award `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`,
whose informal record carries `sevenMatching_outside_incidence` and
`sevenMatching_inside_incidence`, i.e. exactly C1/C2 at one cell — so the
formalisation pattern is proven at a point but not in the parameters. **The
largest unformalised node is the terminal row's unclamped supply,
`E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF`**, which the record already
judges not Lean-ready; the second largest is E1's coefficientwise statement,
whose arithmetic core `(P)` is Lean-sized but whose polynomial-family wrapper is
not. I concur with the adjudication: **E2 is not a Cycle 4 Stage 7 candidate.**
`(P)` plus the discriminant factorisation `Δ = 3(3d−2(m+1))(d+2(m+1))` is the
right Cycle 5 sub-target — it is pure integer algebra and I verified it as an
identity, not a census.

## Verdict

The composition is sound and E2's statement survives **verbatim and unnarrowed**.
All five links hold; one (link iii) requires a wording repair that re-assigns
where E1 enters, and I record a second repair to the Lean-readiness DAG remark.
Neither repair changes the statement, its thresholds, its regime or its grade.
No counterexample was found by any of the six independent attacks, and two new
sharpness facts were established: `m(d)` cannot be lowered, and `K(d)` is not
sharp at the extremal graph.

e2_verdict: confirmed_with_repairs
e1_dependency: confirmed
headline_resolved: no

**Exact surviving statement of E2 (unchanged from the adjudication).** For every
`d ≥ 2` and every `r ≥ K(d) = 2·m(d) − d` (`= 2d−2` for even `d`, `2d−1` for odd
`d`), every finite simple graph `G` of order `2r+d` carrying a matching of size
at least `m(d) = ⌈3d/2⌉−1` satisfies `Δ_r(G) ≤ 0` (`Δ_r = i_{r+1} − i_r`; bare —
`x(G) < r` is not assumed). Grade `proved_informal`; adjudicator-identified
composition, now independently second-read; dependencies
`E993-R25-MATCHING-CERTIFICATE-SOUNDNESS`,
`E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF`,
`E993-R25-CLAMPED-DUAL-DOMINATION` and E1. **Exact repairs required at
registration:** (1) link (iii) must read "`μ_j ≥ 0` for `j ≤ m−1` by E1, hence
no `μ`-clamp and `coef_a(j) = 1` identically", not "`coef_a(j) = 1` given E1";
(2) the Lean-readiness DAG remark must not list the generalised incidence lemmas
as an *informal* dependency of E2. **Registration must also record** that
`d = 2`, `d = 4` and `d = 5` are owned by stronger registered claims, so the new
content is `d = 3` and `d ≥ 6` only; and that `K(d)` is not sharp.

## Artifact inventory

All under `<run root>/scratchpad/c4-second-read-E2/`. Exact integer/`Fraction`
arithmetic throughout; no hashed artifact carries a wall-clock, PID or host
field. Replay: `python3 e2_instrument.py <cert|e1|qpoly|comparator|fences|
exhaust6|structured|randomg>`, `python3 e2_attack.py <perturb|climb|subk>`,
`python3 e1_recheck.py`, `python3 verify_seal.py`.

| artifact | SHA-256 |
|---|---|
| `DERIVATION-BEFORE-READING.md` | `87016fe982b10ab811f036a09296ce45d28d792f8614024c4194d02d244491d3` |
| `verify_seal.py` | `4e05ff4a3a97c34ddbf3ebdf680866ef6f5294d22542e92d5ca300f9aafd0b18` |
| `seal-audit.json` | `6baa42edf1c81e6fa87de15db44c64dd2a3e3f8268acbdbc069e68c812cb2226` |
| `e2_instrument.py` | `175f929b72169f5632a5114322260fabe4c1f4dd583d5591719b24839bd06afc` |
| `e2_attack.py` | `c43075cdbbb1075ea6828cdc943a6576421170d11d40c188af6efdcf6a988b8e` |
| `e1_recheck.py` | `9f6c597b13404eec58325d47546efe714b617b1585f7633c441e4afb4f9f5f61` |
| `cert-grid.json` | `f3fcf497b1c39f839561c23ffa033a111728cf2ba03ef7b6ba5f8d34d5a85cfa` |
| `e1.json` | `ae6c4ab7aa329169796574ff94c96cc5b4e36d505930743865b131ac24d28aac` |
| `e1-recheck.json` | `a047ec7eb6fe37e51c6a54140d6874ab9b8fa49e8445d81a5a3b50d022cc373b` |
| `qpoly.json` | `d319c600e4aee257d1ac0b03a691b8c8c146fbbe008cd0cf51b3df669e92bd0c` |
| `comparator.json` | `8b25b149d7fd79163f9fee065b50c03720f3d3612e683c217852d906672322c8` |
| `fences.json` | `ba0e511275e381fc56838be915a19b89de98178954ee9024588f4e5d7dc9eb3c` |
| `exhaust6.json` | `fa0cbf8d9c31368dd3fcd434470ba2a2e3331dbcc1d133695d396e9655574a73` |
| `structured.json` | `34d2f017d6b4aef1508a41cfead2911fa6ad43bdf806deac13db62b29687057c` |
| `randomg.json` | `3149b663eb9d6af2cacf90ac847d7a0612a372acfa09ba2074baea2a4cdcaf11` |
| `perturb.json` | `0fa8ea9288f997103585763b57784fb5c51ddf8008cbe293b93fb2be0eb4685e` |
| `climb.json` | `e63d81184506e18fb71754aeea3f1f4974b9bbc11e6c47be750dd01542345261` |
| `subk.json` | `179c0dfc26ae1733f30dbeaf1f4d80f977e5a390a3608165b68326720331e9c7` |
