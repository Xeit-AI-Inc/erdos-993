# Semantic Contract — r26 (top-rank residual sign)

This contract fixes the meaning of every symbol used in this run. It narrows, and does not alter,
the r24 contracts (`sources/r24/records/SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`) and the
frozen C5-LA1 theorem contract (`sources/r24/c5-la1/THEOREM-CONTRACT.yaml`). Where prose and the
Lean source disagree, the Lean source of the verified award governs
(`sources/r24/c5-la1/LeanProject/LeanProof/Main.lean`, SHA-256 in `control/SOURCE-DIGESTS.json`).

## 1. Carrier and definitions (the C5-LA1 definitions, verbatim in meaning)

- `V` a finite type with decidable equality; `G : SimpleGraph V` with decidable adjacency. A
  **finite ordinary tree** is `G` with `G.IsTree` (connected and acyclic; Mathlib). Vertices are
  never relabelled, deleted or quotiented: every "deletion" is a deletion SET on the original type.
- `I_k(G − D)` := `C5LA1.indepSetsAvoiding G D k` — the independent `k`-subsets of `V` disjoint from
  the finite deletion set `D`; `i_k(G − D)` := its cardinality (`indepSetCount`). `I_k(G)` and
  `i_k(G)` are the case `D = ∅`. `i_k = 0` for `k > α` (integer zero extension by the definition).
- `α(G)` := `G.indepNum` (Mathlib), the maximum cardinality of an independent set. A **maximum
  independent set** is an independent `S` with `|S| = α(G)`.
- `Δ_k(G − D)` := `i_{k+1}(G − D) − i_k(G − D)` in `ℤ` (`forwardDifferenceDel`).
- `x(G)` := `C5LA1.crossingIndex G`, the least `k` with `Δ_k(G) < 0` — the FIRST STRICT DESCENT of
  the independence sequence (exists because `Δ_α(G) = −i_α(G) < 0`). Zero differences do not count
  as descents.
- A **leaf** is `v` with `C4LA1.IsGraphLeaf G v : ∃! u, G.Adj v u` (exactly one neighbour). `L(G)`
  := `C5LA1.leafSet G` (the finite set of leaves), `ℓ := |L(G)|`.
- The **support** of a leaf `v` is `s_v := C5LA1.support G v`, its unique neighbour (a classical
  choice, unconstrained off the leaf set). `C(G)` (also written `S*` in r24; NOT `S`, which is the
  aggregate) := the set of supports `{s_v : v ∈ L(G)}` = `{s : λ(s) > 0}`.
- `λ(s)` := `C5LA1.leafDegree G s`, the number of leaves adjacent to `s` (zero off supports). In the
  candidate's notation `q_s = λ(s)` for `s ∈ C(G)`; `C_j := {s : λ(s) = j}`; `k_2 := |C_2|`.
- `D(G)` := `V ∖ (L(G) ∪ C(G))`, the **interior**. `a := α(G) − ℓ` (see §3 for why this equals the
  independence number of the induced graph on `D` under the residual hypothesis) and
  `M := i_α(G)` (`indepSetCount G ∅ G.indepNum`).
- `H_v := {v, s_v}` and `R_v := N[s_v] = {s_v} ∪ N(s_v)` are deletion sets (`C5LA1.H`, `C5LA1.R`).
- A leaf `v` is **favorable at `p`** when `Δ_p(G − v) < 0` (`C4LA1.IsFavorableAt`).
- The **aggregate** `S(G, p)` := `C5LA1.aggregate G p` :=
  `Σ_{v ∈ L(G), v favorable at p} ( Δ_{p−1}(G − H_v) − Δ_{p−1}(G − R_v) )` in `ℤ`. The charter writes
  `A(T, p)` for the same quantity to avoid the collision with support notation; both names denote
  `C5LA1.aggregate`. The **top rank** is `p = α(G) − 1` (natural subtraction; `α ≥ 2` makes it ≥ 1).

## 2. Hypotheses of record (the C5-LA1 hypotheses, verbatim)

- `hyp-tree`: `G.IsTree`.
- `hyp-alpha`: `2 ≤ α(G)`.
- `hyp-eligible`: `x(G) + 2 ≤ α(G) − 1` (the top rank lies in the live window `x(G)+2 ≤ p < α`).
- `hyp-residual` `(★)`: every leaf belongs to every maximum independent set —
  `∀ v, IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet S → S.card = α(G) → v ∈ S`.

The **eligible top-rank residual class** is the class of `G` satisfying all four. The
**flat subclass** is `D(G) = ∅`; the **non-flat** class is `D(G) ≠ ∅`.

## 3. The two statements

**(RI) — formally verified (r24 C5-LA1, `C5LA1.topRankResidualIdentity`).** Under the four
hypotheses,
`S(G, α−1) = ℓ·M − Σ_{B ∈ I_{α−1}(G)} ( |B ∩ L(G)| − Σ_{s ∈ B} λ(s) )`.
The sum inside runs over ALL `s ∈ B` (λ vanishes off supports). `hyp-eligible` is not used by the
proof of (RI) but is part of the verified statement (controller ruling recorded in the r24 contract).

**(RC) — the target of this run (`E993-R26-TOP-RANK-RESIDUAL-SIGN`).** Under the same four
hypotheses, `S(G, α−1) ≤ 0`. Equivalently, by (RI):
`Σ_{B ∈ I_{α−1}(G)} ( |B ∩ L(G)| − Σ_{s ∈ B} λ(s) ) ≥ ℓ·M`.
The intended Lean declaration is stated exactly in `SOLUTION-CONTRACT.md` §2. The strict form
`S(G, α−1) < 0` for `ℓ ≥ 3` is a SECONDARY candidate, never a substitute for (RC).

Facts a proof may use only after proving them in-run (they are consequences of the hypotheses, not
hypotheses): under `(★)`, a maximum independent set contains `L` and no support, so its remainder
lies in `D` and has size `α − ℓ = a`; conversely `L ∪ J` is independent for every independent
`J ⊆ D` (no interior vertex is adjacent to a leaf); hence `a` is the independence number of the
induced graph on `D`, `M` counts the maximum independent subsets of `D`, and `α = ℓ + a`. Leaves
and supports are disjoint when `α ≥ 2` (the only tree with a leaf adjacent to a leaf is `K_2`,
`α = 1`). Distinct supports have disjoint leaf neighbourhoods (each leaf has one neighbour). None
of these is assumed by (RC); each must be proved from `hyp-tree`, `hyp-alpha`, `(★)`.

## 4. The candidate's objects (names fixed for this run)

For `B ∈ I_{α−1}(G)`: `A_D := B ∩ D`, `A_C := B ∩ C(G)`, `Q(A_C) := Σ_{s ∈ A_C} λ(s)`,
`h := ℓ − Q(A_C) − |B ∩ L|` (leaves omitted beyond those adjacent to `A_C`). The **budget** is
`(a − |A_D|) + Σ_{s ∈ A_C}(λ(s) − 1) + h = 1` (every term a natural number). The three
**families**: (I) `|A_D| = a`, all `λ = 1` on `A_C`, `h = 1`; (II) `|A_D| = a`, exactly one
`s ∈ A_C` with `λ(s) = 2`, the rest `λ = 1`, `h = 0`; (III) `|A_D| = a − 1` (requires `a ≥ 1`), all
`λ = 1` on `A_C`, `h = 0`. The **weight** of `B` is `w(B) := |B ∩ L| − Σ_{s ∈ B} λ(s)`.
`N_2` := the number of pairs `(J, s)` with `J` a maximum independent subset of `D`, `λ(s) = 2`,
and `J ∪ {s}` independent. `U(J)` := `{s ∈ C_1 : N(s) ∩ J = ∅}` for independent `J ⊆ D`.
The **forced-neighbour lemma**: under `(★)`, every maximum independent `J ⊆ D` meets `N(s)` for
every `s ∈ C_1`. The **deletion injection**: for every finite graph `H`,
`2 Σ_{A ∈ I(H)} |A| ≤ |V(H)| · |I(H)|`.

These names are conventions, not claims: every one of the budget identity, the family
classification, the forced-neighbour lemma and the fibre inequality is a statement to be proved or
refuted in this run.

## 5. Conventions that are load-bearing

- `x` is the first STRICT descent; the r24 evaluator `first_strict_descent`
  (`sources/r24/r23-evaluator/ordinary_tree.py`) is the reference implementation.
- Natural-number subtraction: `α − 1`, `a − 1`, `ℓ − 2` are truncated in `ℕ`; every inequality that
  crosses zero is stated in `ℤ` with explicit casts, and every family that would be created by a
  truncated subtraction (the `a − 1` shell at `a = 0`) is declared empty.
- Counts are of labelled subsets of the fixed vertex type (as in the Lean definitions); census
  counts of TREES are up to isomorphism and are named as such.
- The r24 census figures of record: 312 eligible residual trees of orders 7–12 (the packet's
  independent check agrees), 3,244 of orders 7–15, 16,424 of orders 4–17 (r24 C6 TD-6 states
  16,134 exhaustively enumerated members of orders 4–17 across three instruments; the two figures
  are different instruments' counts and are reconciled, not averaged, by whoever quotes them).
