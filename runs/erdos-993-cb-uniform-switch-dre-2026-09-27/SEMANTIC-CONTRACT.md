# Semantic Contract — r31 (a parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank)

Fixes the meaning of every symbol used in this run. It INHERITS, unchanged, r30's semantic contract
(`sources/r30/records/SEMANTIC-CONTRACT.md`, frozen; its §1.1 definitions of record, §1.2 transport network, weight, relation,
(WID), (HALL), (CUT) and imported results govern here word for word) and the Lean definitions of record carried in r30's
formally verified awards (`sources/r30/lean/*/LeanProject/LeanProof/Main.lean`; `sources/first-interior/c2-primary-v2/`). Where
prose and a Lean source of record disagree, the Lean source governs. This file adds only the CB-specific objects of the r31
target; each is the object of record registered by r30 (the keys cited below, in `sources/authority/CLAIM-IDENTITY.json`).

## 1. Inherited essentials (restated for convenience; r30's text governs)

- `x(T)` is the first strict descent `C5LA1.crossingIndex`: the least `k` with `i_{k+1}(T) < i_k(T)`, computed in ℤ with counts
  zero above `α`, so the terminal difference `Δ_α = −i_α` counts. **Eligibility:** `x(T) + 2 ≤ p` and `3p < 2α(T) + 1`.
- `F_p(T)` is the original strict favorable-leaf selector: original leaves `v` with `Δ_p(T − v) < 0`, fixed at rank `p`.
- **Active-tag weight** `w_F(B) = #{v ∈ F ∩ B : B ∩ (N(s_v) ∖ {v}) ≠ ∅}` (`s_v` the original support; every original leaf a distinct
  tag). **Relation** (D) ∪ (S): `A = B ∖ {q}`, or `A = (B ∖ N(u)) ∪ {u}` for `u ∉ B` with `|N(u) ∩ B| = 2`. **(WID):**
  supply − capacity = `S(T, p)`, the complete aggregate — asserted from INDEPENDENT sides on every instance before anything else.
  **(HALL)** at `(T, p)`: a saturating integral flow; equivalently `Σ_X w_F ≤ Σ_{N(X)} w_F` for every `X ⊆ I_{p+1}(T)`.

## 2. The CB family and the target rank

- **`CB(d, m)`** (r30 record `R30-CB-RECORD`; keys cited in §4): the path `r – s – v`; `m` chokes `u_1..u_m` adjacent to `r`; `d`
  supports `b_{i1..id}` adjacent to each `u_i`; one private leaf `c_{ij}` adjacent to each `b_{ij}`. `n = 3 + m(2d + 1)`;
  `leafSet = {v} ∪ C`, `C` the `dm` private leaves; `W_v = {r}`, `W_{c_ij} = {u_i}`; `α(CB(d,m)) = m(d+1) + 1`.
- **The r31 family:** `d = 8`, every integer `m ≥ 107` with `m ≡ 2 (mod 3)`; `T_m := CB(8, m)`, `n = 17m + 3`, `α = 9m + 1`,
  **`p* = p*(m) := (16m + 4)/3`** (an integer exactly when `m ≡ 2 (mod 3)`; `= ⌊(2dm + 4)/3⌋` with `d = 8`, the TOP
  sector-deficient rank). `3p* = 16m + 4 < 18m + 3 = 2α + 1` for every `m ≥ 1`. ONE rank per tree: for large `m` the rank
  `p*` is interior to the eligible window (`p* − x` grows like `256m/20451`); nothing here is about any other rank.
- **Parent descent (ELIG-top)(a):** the sufficient condition `i_{p*−1}(T_m) < i_{p*−2}(T_m)`, which gives `x ≤ p* − 2`. The
  closed forms of record (T1 of r30 Cycle 6; `proved_informal` as a node of the favorability key):
  `I(CB(d,m)) = (1+2x)G^m + x(1+x)(1+2x)^{dm}`, `I(CB − v) = (1+x)G^m + x(1+2x)^{dm}`,
  `I(CB − c) = (1+2x)G_c G^{m−1} + x(1+x)^2(1+2x)^{dm−1}`, `G = (1+2x)^d + x(1+x)^d`, `G_c = (1+2x)^{d−1}(1+x) + x(1+x)^{d−1}`.
  Block decomposition: `I = Σ_j C(m, j)(1+2x) x^j (1+x)^{dj} (1+2x)^{d(m−j)} + x(1+x)(1+2x)^{dm}`. Each block is a monomial times a
  product of linear factors (real-rooted); `I` itself, `G`, `G^m` and forest independence polynomials in general are NOT
  real-rooted (`K_{1,3}`; `E993-TREE-REAL-ROOTED` REFUTED, minimal witness order 4). Newton's inequalities and Darroch's mode
  theorem may be applied ONLY to real-rooted polynomials with positive coefficients, i.e. here to the blocks and to the `r_q`.
- **Favorability at `p*`:** registered `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`
  (`proved_informal` modulo Darroch and Newton on products of linear factors). On the r31 family `dm = 8m ≡ 1 (mod 3)`, so
  EVERY leaf is favorable at `p*` and `F_{p*}(T_m) = leafSet` (`8m + 1` tags) at the key's grade.
- **E1, the non-sector deletion flow:** registered `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`
  (`proved_informal`). With `a_q = qd − 1`, `b_q = d(m − q) + 1`, `r_q(k) = [y^k](1+y)^{a_q}(1+2y)^{b_q}`, and the criterion
  (i) `r_q(p − q) ≤ r_q(p − q − 1)` for every `q ∈ [1, m]` and (ii) the type-path inequalities (which hold identically by its
  scope note `[r30 C4; SR-C4-6]`), it gives a deletion-arc flow saturating every NON-sector source and loading each `r`-free
  target with `q ≥ 1` chokes at exactly `ρ_q·w_F(A)`, `ρ_q := r_q(p − q)/r_q(p − q − 1)`, and every other target at 0. Condition
  (i) at `p*` for every `q`: registered `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`
  (`proved_informal` modulo Darroch on the `r_q`): holds iff `p ≥ ⌈μ_1⌉ + 2`, `μ_1 = (4dm − d + 1)/6`; at `d = 8`, `m ≡ 2 (mod 3)`,
  `⌈μ_1⌉ + 2 = p*` exactly (scope note `[r30 C6; SR-C6-1]`). `ρ_1 = ρ_(1,8)(m)` is the largest `ρ_q`.
- **The root-plus-arm sector** `sec := {B ∈ I_{p*+1}(T_m) : r, v ∈ B}`. `r ∈ B` excludes `s` and every `u_i`; the only active tag
  is `v` (witness `r`), so every sector member has weight exactly 1. A sector member is `{r, v}` plus `K := p* − 1` legs, each leg
  `j` of choke `i` in one of three states {empty, `b_{ij}`, `c_{ij}`}: `|sec| = R_K := 2^K·C(8m, K)`. Its positive-weight deletion
  neighbourhood is the in-sector layer of total weight `R_{K−1}`, and `R_K/R_{K−1} = p*/(p* − 1) > 1`: deletion arcs alone
  cannot serve the sector — the switch arcs are load-bearing.
- **Choke state** of a sector source or in-sector target at choke `i`: `(β, γ)` = (number of its legs in state `b`, number in
  state `c`), `β + γ ≤ 8`. **Sector switch**: at a choke in state `(1, γ)` with `γ ≥ 1`, insert `u_i` (its two neighbours in `B`
  are `r` and the one present support), removing `r` and that support; the image is `r`-free with exactly ONE choke and weight
  `γ` (its `γ` private tags become active through `u_i`); an image of weight `γ` has exactly `8 − γ` sector preimages.
- **The choke-local sector certificate (the r30 template; `sources/r30/instruments/c6/T2/inherited/localflow.py`, `certify.py`):**
  nonnegative rationals `pb(β, γ)` on each `b`-deletion and `pc(β, γ)` on each `c`-deletion at a choke in state `(β, γ)`, `σ(γ)` on
  the `u_i`-switch at a choke in state `(1, γ)`, and 0 on every other sector arc, subject to — **Out:** every sector source has
  total outflow `≥ 1` (then scaled down to exactly 1, which only lowers loads); **In:** every in-sector target has inflow `≤ 1`;
  **Switch:** `(8 − γ)·σ(γ) ≤ θ·γ` for `γ = 1..7`; **Residual capacity:** `θ ≤ 1 − ρ_1`, so every switch image, which also
  receives `ρ_1·γ` from E1, is loaded at most `γ`. The LP of record imposes Out/In through a sufficient AFFINE separation
  (`Out(β,γ) ≥ a + λ(β+γ)`, `m a + λK ≥ 1`; `In(β,γ) ≤ a2 + λ2(β+γ)`, `m a2 + λ2(K−1) ≤ 1`) and minimizes `θ`; its second instrument is
  an exact min-plus/max-plus DP over all splittings of `K` and `K−1` among the `m` chokes. The minimum `θ*(m)` of THAT LP at the
  recorded residue-2 rows fits `θ*_8(m) = 288/(200m² + 82m + 5)` (a CONJECTURE of r30: a law of one LP optimum, not an
  instance fact, and not necessary for arbitrary flows). Composition (registered row keys, §4): the E1 flow plus the sector
  certificate is a nonnegative rational flow on literal (D) ∪ (S) arcs saturating every source within every capacity; summing it
  over any `X` gives (HALL-COND); an integral saturating flow follows (the kernel-checked companion
  `exists_saturatingFlow_of_weightedHall`, or max-flow integrality). In-sector targets receive nothing from E1 (deletion-only);
  targets with two or more chokes receive no sector flow; weight-zero targets receive nothing.
- **(L-S)_top (the first missing lemma):** for every `m ≥ 107`, `m ≡ 2 (mod 3)`, a sector allocation (the r30 template or any
  other, proved against the literal network or a PROVED quotient) with Out, In, Switch and Residual-capacity all satisfied at
  `p*(m)`, with `θ(m) ≤ 1 − ρ_1(m)`. **(ELIG-top)(a) (the second):** `i_{p*−1}(T_m) < i_{p*−2}(T_m)` for every such `m`.

## 3. Grades of the inputs (never upgraded by use)

`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` `proved_informal`; the E1 threshold key and the
favorability key `proved_informal` modulo Darroch/Newton on products of linear factors; the closed forms `proved_informal`
(a node); the r30 row keys and the five-row keys `computer_assisted`; the `θ*` laws `conjecture`; (ELIG-top)(a) exact on
`m ∈ [106, 2395]` `bounded_computation` (exceptions only at `m ≡ 1 (mod 3)` in `{106, …, 133}` — outside the r31 class); the
r30 Lean awards `formally_verified` at their exact scopes (the weight identity; Hall ⇒ sign; the invariant family; the
orbit-quotient equivalence; the `G_k` flow; `G_k` every eligible rank; the spider at `k+3`).

## 4. Registered keys this run touches (see `sources/authority/CLAIM-IDENTITY.json`)

(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN); the primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`
(OPEN); `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`; `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`;
`E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR`; `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`; the
criterion, threshold and favorability keys of §2; `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`;
`E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`;
`E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` (the r31 class
begins at its last row, `m = 107`); the CB exactness, shift and stratum keys of r30 Cycle 6; `E993-TREE-REAL-ROOTED` (REFUTED);
`E993-ZERO-EXTENDED-BINOMIAL-BLOCK-RISE-FALL-STRICT-RISE` and `E993-PATH-STAR-ARITY-2-4-MAIN-MARK-RELATIVE-BINOMIAL-MARGIN-QNPLUS1`
(Codex's formal coefficient mechanisms — tools, at their exact scopes).

## 5. Fixed points every instrument reproduces before reporting (from registered records; priors, never evidence)

`CB(8,107)/572`: `n = 1822`, `α = 964`, `x = 570`, `θ* = 96/766193`, margin `(1 − ρ_1)/θ* ≈ 34.90` (r30 row key).
`CB(8,95)/508`: `n = 1618`, `α = 856`, `x = 506`, `θ* = 96/604265`, `ρ_1 = 1354839571516225/1361543988640524`,
`σ(1..3) = 96/4229855, 32/604265, 288/3021325`, `R_K/R_{K−1} = 508/507`. `CB(8,110)/588` and `CB(8,113)/604` are the FRESH test rows
the charter names (uncertified census rows of record; `n = 1873` and `1924`; nothing about them is known beyond the census).
