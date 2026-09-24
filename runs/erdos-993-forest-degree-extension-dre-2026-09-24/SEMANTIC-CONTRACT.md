# Semantic Contract — r27 (finite forest degree/extension inequality)

Fixes the meaning of every symbol used in this run. Narrows, and does not alter, the r25 contracts
(`sources/r25/records/R25-SEMANTIC-CONTRACT.md`) and the G1 definitions of record carried by the r25
award `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`
(`sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean`, entries 1–3). Where prose
and that Lean source disagree, the Lean source governs.

## 1. Carrier and definitions of record

- `X` a finite type (`[Finite X]`, or `[Fintype X] [DecidableEq X]` where a `Finset` computation needs it);
  `G : SimpleGraph X`. A **finite forest** is `G` with `G.IsAcyclic` (Mathlib); it may be disconnected or
  empty. `n := Nat.card X` is the order. `deg_G(v) := G.degree v` (Mathlib, with `[DecidableRel G.Adj]`).
- `i_k(G)` := `Erdos993G1.indepCount G k : ℤ` = `Nat.card {S : Finset X // G.IsNIndepSet k S}` — the number
  of independent `k`-subsets (an integer, nonnegative); `i_k = 0` for `k > α(G)`; `i_0 = 1` always
  (the empty set). `Erdos993G1.coeff G (k : ℤ)` is the integer-indexed zero extension;
  `Δ_k(G)` := `Erdos993G1.delta G k = coeff G (k+1) − coeff G k` in `ℤ`.
- **First strict descent** `x(G)` := the least natural `k` with `Δ_k(G) < 0` (exists for every finite
  graph: `Δ_α = −i_α < 0`; for the empty forest `Δ_0 = 0 − 1 < 0`, so `x = 0`). To be defined in-run as
  `Erdos993G1.firstDescent` (or a run-local name) by `Nat.find`; equal to the r25 informal `x(F)`.
- **Extensions.** For an independent `J`, `e(J)` := `|V ∖ N[J]|`, the number of vertices `v ∉ J` not adjacent
  to `J` (so `J ∪ {v}` is independent). **Double counting:** `(k+1)·i_{k+1}(G) = Σ_{J ∈ I_k(G)} e(J)`.
- **Incident degree sum.** `D_k(G)` := `Σ_{J ∈ I_k(G)} Σ_{v ∈ J} deg_G(v)` (a natural number; to be defined
  in-run, e.g. `indepDegreeSum G k`).
- `α(G)` := the independence number (largest `k` with `i_k > 0`), Mathlib `G.indepNum` where needed.
- For `n = 2r + d` (r25 convention): `r` the reference rank, `d` the excess.

## 2. The statements of this run

- **(DL) Degree lemma** (Fang–Lu–Nevo–Yao–Zheng 2026, Lemma 8.1 consequence (8.3)): for every finite forest
  `G` and every natural `k`, `D_k(G) ≤ 2k · i_k(G)`. (An AVERAGE statement over independent `k`-sets; it
  bounds no individual set's incident degree.)
- **(EX) Extension inequality** (their Proposition 8.2's displayed step): for every finite forest `G`, every
  `k`, in `ℤ`: `(k+1)·i_{k+1}(G) ≥ (n − 3k)·i_k(G)`, equivalently the subtraction-free
  `(k+1)·i_{k+1}(G) + 3k·i_k(G) ≥ n·i_k(G)`. Derivation: `e(J) ≥ n − k − Σ_{v∈J} deg(v)` (every vertex of
  `N[J] ∖ J` is a neighbour of some `v ∈ J`, so `|N[J]| ≤ k + Σ deg`), summed over `J` with the double
  count and (DL).
- **(LB) Linear descent-order bound:** `Δ_k(G) < 0 ⇒ n ≤ 4k` for every natural `k` (from (EX):
  `Δ_k < 0` gives `i_k > 0` and `(k+1)i_k > (k+1)i_{k+1} ≥ (n−3k)i_k`, so `n − 3k < k + 1`, i.e. `n ≤ 4k`).
  Compare the registered formal `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`: `Δ_k < 0 ⇒ n ≤ (k+1)²` for
  `k ≥ 1` — since `4k ≤ (k+1)²` always (`(k−1)² ≥ 0`, equality only at `k = 1`), (LB) is at least as strong
  for every `k` and strictly stronger for `k ≥ 2`; both stay registered (the r25 award at its own statement).
- **(R5) Rank-5 consequence:** `n ≥ 21 ⇒ Δ_5(G) ≥ 0`; equivalently `x(G) = 5 ⇒ n ≤ 20`. Supersedes the
  registered informal ceiling 25 (`E993-R25-RANK5-CEILING-SHARPENED-TO-25`), whose stated residue (orders
  22–25 with ≥ 3 branch vertices) is therefore empty.
- **(XR) Descent restriction:** `x(G) < r ⇒ n ≤ 4r − 4` (apply (LB) at `k = x(G) ≤ r − 1`); for
  `n = 2r + d` this is `d ≤ 2r − 4`. It narrows the live region of the r25 forest targets; it is NOT a
  uniform bound on `d` and NOT a no-recovery statement.
- **(K1) The r25 isolated-vertex-addition claim:** `x(G ⊔ K₁) ≤ x(G) + 1` for every finite forest `G`;
  registered closure `E993-R25-KADDITION-CLOSURE-X-LE-4` for `x(G) ≤ 4` (proved_informal; inputs: the
  r25 second-order two-sided ceiling `Δ_4 < 0 ⇒ n ≤ 19`, Hunter's spanning-tree inequality, and the
  in-run order-≤21 forest census of 8,355,831 isomorphism classes — `sources/r25/records/C4-RETURN-T4.md`,
  `sources/r25/c4-T4-census/`). The rank-5 residue of record: orders 22–25 with at least three branch
  vertices (`E993-R25-RANK5-TWO-BRANCH-EXACTNESS-ORDERS-22-29`). With (R5), `x(G) = 5 ⇒ n ≤ 20`, inside the
  census horizon: the composition extends the closure to `x(G) ≤ 5` at the grade of its weakest input (the
  census is bounded computation replayed in r25; the closure stays `proved_informal`-with-census, never
  `formally_verified`).

## 3. External source of record

Fang, Lu, Nevo, Yao, Zheng, *Unimodality of Independence Polynomials for Sufficiently Large Forests*,
arXiv:2609.20961v1 (17 September 2026), §8 (Lemma 8.1 with the polynomials `D_T`, `E_T` and the
recurrences (8.4)–(8.5); Proposition 8.2 with (8.8)); frozen as `sources/external/paper/` (HTML and the
extracted §8 text). Their public Lean project `junwei-lu/Erdos_993_Tree_Independent_Set_Unimodality` at
`b2a1d3ede8aef259b1de6e319e7fd6cb56481ac1` (Lean 4.29.1; a different Mathlib pin), finite slice frozen as
`sources/external/lean-source/ErdosProblem993/{Basic,Recursion,Extensions,Components,DegreeLemma,Ends,
AxiomCheck,Main}.lean` with the packet's static scan (`sources/external/STATIC-SCAN.json`: not built, not
axiom-replayed). Its key declarations: `sum_degOn_le` (DegreeLemma.lean) = (DL) in their `icoeff`/`degOn`
carrier; `prefix_ratio` (Ends.lean) = (EX)'s prefix form; `numExtensions`, `sum_numExtensions`,
`numExtensions_ge` (Extensions.lean) = the double count. **No LICENSE file is present in the audit copy:
external Lean text is read for audit and proof structure only and is never carried into the run's
project or published; every declaration of this run is written in-run** (Gate ruling).

## 4. Conventions that are load-bearing

- `x` is the first STRICT descent; `Δ_k = 0` is not a descent.
- Natural-number subtraction: (EX) is stated subtraction-free or in `ℤ`; `4r − 4` is safe for `r ≥ 1`
  (`x < r` forces `r ≥ 1`); `n − 3k` is stated in `ℤ`.
- Counts are of labelled subsets of the fixed vertex type; census counts of forests are up to isomorphism
  and named as such (r25's 8,355,831 classes to order 21 includes all component counts).
- Fixed points every instrument reproduces before any table: the empty forest (`n = 0`: `i_0 = 1`,
  `Δ_0 = −1`, `x = 0`); `K₁` (`i = 1,1`; `Δ_0 = 0`, `Δ_1 = −1`, `x = 1`); `P_n` sequences; the star `K_{1,m}`
  (`i_k = C(m,k)` for `k ≥ 1` plus the centre: `i_1 = m+1`, `i_k = C(m,k)` for `k ≥ 2`); (DL) tight cases
  (e.g. edgeless forests: `D_k = 0`; single edges); the r25 rank-5 margins at `n = 22..29`
  (`−9,527 / −8,598 / −6,139 / −3,738 / +578 / +9,435 / +24,767 / +41,513`, the DP-certificate values, NOT
  minima of `Δ_5`) are cited from `E993-R25-RANK5-CEILING-SHARPENED-TO-25` only with that meaning.
