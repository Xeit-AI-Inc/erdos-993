# C1-LA1 — informal proof of record for `R26LA1.topRankResidualSign`

Award group `C1-LA1`, r26 Cycle 1 Stage 7. Producer `c1-la1-formalizer-opus-20260924`.
This is the statement-level informal proof that the shipped Lean development realises, node by node
in the order of the Stage 7 brief §3 R3. It is the informal audit's input. It carries the repaired
`L5′ + L5″` (never the unrepaired `L5`), the `ℕ`-subtraction audit, the carry table and the
attributions and excluded conclusions of the brief §2.

## 0. The statement

```lean
theorem topRankResidualSign (G : SimpleGraph V) [DecidableRel G.Adj] (hTree : G.IsTree)
    (hAlpha : 2 ≤ G.indepNum) (hEligible : crossingIndex G + 2 ≤ G.indepNum - 1)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S) :
    aggregate G (G.indepNum - 1) ≤ 0
```

Namespace `R26LA1`; section variables `{V : Type*} [Fintype V] [DecidableEq V]`, exactly as C5-LA1.
`crossingIndex` and `aggregate` are `C5LA1.crossingIndex` and `C5LA1.aggregate`, resolved through
`open C5LA1`. All four hypotheses are verbatim; none is dropped, weakened or reordered.

Throughout: `L = C5LA1.leafSet G`, `ℓ = |L|`, `λ = C5LA1.leafDegree`, `α = G.indepNum`,
`M = C5LA1.indepSetCount G ∅ α = i_α(G)`, `C = R26LA1.supportSet G = {s : λ(s) > 0}`,
`D = R26LA1.interior G = V ∖ (L ∪ C)`, `a = R26LA1.aVal G`, `S = aggregate G (α−1)`.
`(★)` denotes `hResidual`.

**Where each hypothesis enters.**

- `hTree` (`hyp-tree`): `leaf_card_ge_two`, `leaf_not_mem_supportSet` / `leaf_support_disjoint`,
  `leafSet_indep`, hence the gate, the budget and every family node; and `ell_two_lambda_two_imp_alpha_two`.
- `hAlpha` (`hyp-alpha`): the same tree-structural nodes (`L` independent, `L ∩ C = ∅`, `ℓ ≥ 2`).
  It is **not** used by `ell_two_lambda_two_imp_alpha_two` (L-7), which takes `ℓ = 2` and `λ(s) = 2` only.
- `hEligible` (`hyp-eligible`): consumed **only** through `α ≥ 3`
  (`eligible_imp_alpha_ge_three`, the `ℓ = 2` branch: `C2_card_eq_zero_of_alpha_three`, which takes
  `3 ≤ G.indepNum` and not `hEligible`). Its only other occurrence is as an inert argument passed to
  `C5LA1.topRankResidualIdentity`, whose own proof does not use it. It is retained in the statement of
  record per `C1-STAGE1-GATE.md` Ruling 5.
- `hResidual` (`(★)`): `maxIndep_no_support`, `max_indep_eq_leaf_union_D`, `M_eq_card_maxIndep_D`,
  `forced_neighbour` and everything downstream of them (`family_support_pruned`, the family-(II)
  weight, the family-(I) count, `N2_le_k2_mul_M`). It is **not** used by the gate node
  `alpha_eq_ell_add_a`.

## 1. Definition layer

- `supportSet G := univ.filter (0 < λ ·)` — `C(G)`.
- `interior G := univ \ (L ∪ C)` — `D(G)`.
- `interiorIndep G := (interior G).powerset.filter (IsIndepSet ·)`.
- `aVal G := (interiorIndep G).sup Finset.card` — `a`, the maximum size of an independent subset of `D`.
- `C1 G := univ.filter (λ · = 1)`, `C2 G := univ.filter (λ · = 2)` — `C₁`, `C₂`; `k₂ = |C₂|`.
- `w G B := |B ∩ L| − Σ_{s ∈ B} λ(s)` in `ℤ` — the `SEMANTIC-CONTRACT.md` §4 weight.
- `USet G J := (C1 G).filter (fun s => ∀ d ∈ J, ¬ Adj s d)` — `U(J)`.
- `maxIndepInterior G := (interiorIndep G).filter (·.card = aVal G)`.
- `topShell G := C5LA1.indepSetsAvoiding G ∅ (α−1)` — `I_{α−1}(G)` on the contract carrier.
- `slack G B := ℓ − |B ∩ L| − Σ_{s ∈ B} λ(s)` in `ℤ` — `h(B)`.
- `famI/famII/famIII G` — filters of `topShell G` (below); `N2 G := |famII G|`.
- `shellD G := (interiorIndep G).filter (·.card + 1 = aVal G)` — the `a − 1` shell.
- `famIIIIndex G := (shellD G).sigma (fun J => indepPowerset G (USet G J))`;
  `famIIIMap G ⟨J, A⟩ := A ∪ J ∪ (L ∖ leaves(A))`, `famIIMap G (s, J) := {s} ∪ J ∪ (L ∖ leaves(s))`.

`λ`, `L`, `support`, `indepSetsAvoiding`, `indepSetCount`, `forwardDifferenceDel`, `crossingIndex`,
`aggregate`, `H`, `R` are reused from C5-LA1 **by name**; no C5-LA1 definition is re-stated.

**Carrier discipline (R4).** Every counting node is stated over `C5LA1.indepSetsAvoiding G Wᶜ k`
or over filters of `Finset.powerset` (`indepPowerset`). `SimpleGraph.induce` occurs nowhere in the
development. `I_k(T[D])` is `interiorIndep`/`maxIndepInterior`/`shellD` (filters of
`(interior G).powerset`), and `I(T[U(J')])` is `indepPowerset G (USet G J)`.

## 2. Structure

**L-12 `c_eq_support_image`** (no hypotheses). `C(G) = support '' L(G)`. `λ(s) > 0` iff
`(L.filter (support · = s)).card > 0` (`C5LA1.leafDegree_eq_filter_support`) iff some leaf has
support `s`.

**L-8 `leaf_not_mem_supportSet` / `leaf_support_disjoint`** (`hyp-tree`, `hyp-alpha`; connectivity).
If a leaf `v` were a support, some leaf `u` would have `support u = v`, hence `Adj u v` — two adjacent
leaves, impossible in a tree with `α ≥ 2` (`R26U3.tree_two_le_indepNum_no_adjacent_leaves`, which uses
connectivity to force `V = {u, v}` and then contradicts `α ≥ 2`). Re-derived on this run's spelling of
`supportSet` (the corpus carries three incompatible spellings; R2).

**L-10 `leaf_degree_sum_eq_card`** (no hypotheses). `Σ_{s : V} λ(s) = ℓ`, by fibering `L` over `support`.

**L-6 `leaf_card_ge_two`** (`hyp-tree`, `hyp-alpha`; connectivity). `2 ≤ ℓ`, by the handshake count
`Σ deg = 2|E| = 2(n−1)` against `deg ≥ 1` (connectivity, nontrivial `V` from `α ≥ 2`).

**L-10 `k2_le_ell_div_two`** (no hypotheses). `j·|C_j| ≤ ℓ` for every `j`, hence `2k₂ ≤ ℓ`.

**L-11 `eligible_imp_alpha_ge_three`** (no hypotheses beyond `hyp-eligible`). `x(G) + 2 ≤ α − 1`
forces `3 ≤ α` — pure `ℕ` arithmetic on the truncated subtraction (if `α ≤ 2` then `α − 1 ≤ 1 < 2`).

**X-5 `maxIndep_no_support`** (`(★)` alone). A maximum independent set `S` meets no support: if
`s ∈ S ∩ C`, some leaf `v` has `support v = s`, so `Adj v s`; `(★)` puts `v ∈ S`, contradicting
independence.

**GATE, L-9 `alpha_eq_ell_add_a`** (`hyp-tree`, `hyp-alpha`; **`(★)`-free**). `α = ℓ + a`.

*≥.* Pick `J ⊆ D` independent with `|J| = a`. `L` is independent (L-8's companion `leafSet_indep`),
`J` is independent, and there is no `D`–`L` edge (`no_edge_interior_leaf`: an edge from `d` to a leaf
`v` forces `support v = d`, so `d ∈ C`, contradicting `d ∈ D`). Hence `L ∪ J` is independent, and
`L ∩ D = ∅`, so `α ≥ ℓ + a`.

*≤.* Let `S` be maximum. `V = L ⊎ C ⊎ D` (`card_inter_split`, using `L ∩ C = ∅`), so
`|S| = |S∩L| + |S∩C| + |S∩D|`. The map `s ↦ (a leaf with support s)` exhibits
`S ∩ C ⊆ (L ∖ S).image support`, because a leaf `v` with `support v = s ∈ S` cannot lie in `S`.
Hence `|S∩C| ≤ |L ∖ S| = ℓ − |S∩L|` (`Finset.card_sdiff_add_card_inter`). And `S ∩ D` is an
independent subset of `D`, so `|S∩D| ≤ a`. Therefore `α = |S| ≤ ℓ + a`.

**L-9 + `(★)` `max_indep_eq_leaf_union_D`.** For `S` maximum: `L ⊆ S` by `(★)` and `S ∩ C = ∅` by X-5,
so `S = L ∪ (S ∩ D)`; and `|S ∩ D| = a` (`card_inter_interior_of_max`) since `|S| = α = ℓ + a` and the
union is disjoint.

**L-9 + `(★)` `M_eq_card_maxIndep_D`.** `M = i_α(G) = |maxIndepInterior G|`, by the mutually inverse
maps `S ↦ S ∩ D` and `J ↦ L ∪ J` (`Finset.card_nbij'`), on the contract carrier
`indepSetsAvoiding G ∅ α`.

**L-1 `forced_neighbour`** (`hyp-tree`, `hyp-alpha`, `(★)`). If `B` is independent, `|B ∩ D| = a`, and
`s ∈ B` has `λ(s) = 1`, then `False`. Let `J = B ∩ D` (independent, `⊆ D`, of size `a`) and let `v` be
the unique leaf with `support v = s` (`λ(s) = 1` makes `L.filter (support · = s)` a singleton). Then
`T = {s} ∪ J ∪ (L ∖ {v})` is independent: `L ∖ {v}` and `J` have no crossing edge; `s` has no
neighbour in `J` (both lie in the independent `B`); and `s` has no neighbour in `L ∖ {v}` because every
leaf adjacent to `s` lies in the singleton `{v}`. Its size is `1 + a + (ℓ − 1) = ℓ + a = α` by the gate.
So `T` is a maximum independent set omitting the leaf `v` — contradicting `(★)`.

## 3. Counting

**(RI), carried.** `C5LA1.topRankResidualIdentity` gives, on the eligible residual class,
`S = ℓ·M − Σ_{B ∈ I_{α−1}(G)} w(B)`, where `w(B) = |B ∩ L| − Σ_{s ∈ B} λ(s)`. Write `W` for that sum.

**L-2 `h_nonneg`** (independence of `B` only). `0 ≤ h(B)`: `|B ∩ L| + Σ_{s∈B} λ(s) ≤ ℓ`
(`R26LA1.budgetWeightBound`, carried from U2) — the leaves `B` contains and the leaves forced out by
the supports `B` contains are disjoint subsets of `L`. This is the only step in the budget that uses
independence.

**L-2 `budget_identity` (= 1, not ≤ 1).** For `B ∈ topShell G`, in `ℤ`:

```
Σ_{s ∈ B∩C} (λ(s) − 1)  +  (a − |B∩D|)  +  h(B)  =  1.
```

Proof: expand. `Σ_{B∩C}(λ−1) = Σ_{s∈B} λ(s) − |B∩C|` (λ vanishes off `C`,
`R26LA1.leafDegree_sum_eq_inter_support`), and `h(B) = ℓ − |B∩L| − Σ_{s∈B} λ(s)`, so the left side is
`a + ℓ − (|B∩L| + |B∩C| + |B∩D|) = a + ℓ − |B| = a + ℓ − (α − 1) = 1`, using the partition
`V = L ⊎ C ⊎ D` and the **gate** `α = ℓ + a`. Pure `Finset.card` arithmetic once `h_nonneg` is split out.

**Nonnegativity of the three terms.** `Σ_{B∩C}(λ−1) ≥ 0` since `λ(s) ≥ 1` on `C`;
`a − |B∩D| ≥ 0` since `B ∩ D` is an independent subset of `D`; `h(B) ≥ 0` by `h_nonneg`.

**L5′ `budget_shapes`.** Three nonnegative integers summing to `1`: exactly one is `1`. Hence for every
`B ∈ topShell G` exactly one of

1. `|B∩D| = a`, `h = 1`, `Σ(λ−1) = 0`;
2. `|B∩D| = a`, `h = 0`, `Σ(λ−1) = 1`;
3. `|B∩D| + 1 = a` (in `ℤ`), `h = 0`, `Σ(λ−1) = 0`.

Shape 1 splits into `A_C = ∅` (family I) and `A_C ≠ ∅` (the fourth arithmetic shape), which `L5″`
proves empty. **The `a − 1` shell at `a = 0` is proved empty by the budget term itself**: shape 3 reads
`(a : ℤ) = |B∩D| + 1 ≥ 1`, an inequality in `ℤ`; nothing is declared empty by `ℕ`-truncation.

**L5″ `family_support_pruned`** (`(★)`, through `forced_neighbour`). If `B ∈ topShell G` and
`|B∩D| = a`, then `B ∩ C = ∅` or `B ∩ C = {s}` with `λ(s) = 2`. Proof: no `s ∈ B ∩ C` has `λ(s) = 1`
(`forced_neighbour`), and `λ ≥ 1` on `C`, so `λ(s) ≥ 2` and `λ(s) − 1 ≥ 1` for every such `s`; hence
`|B∩C| ≤ Σ_{B∩C}(λ−1) ≤ 1` by the budget and `h ≥ 0`. If `|B∩C| = 1`, say `{s}`, then
`λ(s) − 1 ≤ 1` and `λ(s) ≥ 2` give `λ(s) = 2`.

**The three families.** `famI = {B ∈ topShell : |B∩D| = a ∧ B∩C = ∅}`,
`famII = {B ∈ topShell : |B∩D| = a ∧ B∩C ≠ ∅}`, `famIII = {B ∈ topShell : |B∩D| ≠ a}`.
They partition `topShell` by two applications of `Finset.sum_filter_add_sum_filter_not` (`W_split`).

**L-3 `family_I_weight`.** On `famI`: `A_C = ∅` gives `Σ_{s∈B} λ(s) = 0` and `Σ(λ−1) = 0`; with
`|B∩D| = a` the budget gives `h = 1`, i.e. `|B∩L| = ℓ − 1`; hence `w(B) = ℓ − 1`.

**`family_I_count` (`famI_eq_image`, `famI_card`).** `famI` is *exactly* the image of
`maxIndepInterior G ×ˢ L` under `(J, v) ↦ J ∪ (L ∖ {v})` (`R26CritT.famOneMap`), and that map is
injective there (`R26CritT.famOneInjOn`, using `Disjoint D L`), so
`|famI| = ℓ·|maxIndepInterior G| = ℓ·M` by `M_eq_card_maxIndep_D`. (⊆: `|B∩L| = ℓ − 1` and
`B∩L ⊆ L` force `B ∩ L = L ∖ {v}` for a unique `v`, and `B = (B∩D) ∪ (B∩L)` since `B∩C = ∅`.
⊇: `J ∪ (L∖{v})` is independent of size `a + (ℓ−1) = α − 1`, meets `D` in `J` and `C` not at all.)
Hence `W_I = ℓ·M·(ℓ−1) = ℓ(ℓ−1)M`.

**L-3 `family_II_weight`.** On `famII`: `L5″` gives `B ∩ C = {s}`, `λ(s) = 2`, so
`Σ_{s∈B} λ(s) = 2` and `Σ(λ−1) = 1`; the budget gives `h = 0`, i.e. `|B∩L| = ℓ − 2`; hence
`w(B) = (ℓ − 2) − 2 = ℓ − 4`, and `W_II = (ℓ−4)N₂` with `N₂ = |famII|`.

**L-10 `N2_le_k2_mul_M`** — **`N₂ ≤ k₂·M`, never `N₂ ≤ M`** (which is false from order 9).
Each `B ∈ famII` equals `famIIMap G (s, B∩D)` with `s ∈ C₂` and `B∩D ∈ maxIndepInterior G`: indeed
`B ∩ L ⊆ L ∖ leaves(s)` (a leaf of `s` in `B` would be adjacent to `s ∈ B`) and both sides have
cardinality `ℓ − 2`, so they are equal, and `B = {s} ∪ (B∩D) ∪ (B∩L)`. Hence
`N₂ ≤ |C₂ ×ˢ maxIndepInterior G| = k₂·M`.

**L-4 `family_III_bijection`** — outer index the **`a − 1` shell** `I_{a−1}(D)`, never the maximum shell.
`famIII` is exactly the image of `famIIIIndex G = Σ_{J ∈ shellD G} I(U(J))` under
`⟨J, A⟩ ↦ A ∪ J ∪ (L ∖ leaves(A))`, and that map is injective (`famIIIMap_injOn`), because
`Φ⟨J,A⟩ ∩ D = J` and `Φ⟨J,A⟩ ∩ C = A`.

*⊇ (`famIIIMap_spec`).* For `J` in the `a−1` shell and `A ⊆ U(J)` independent: `A ⊆ C₁`, so
`|leaves(A)| = |A|` (the fibres of `support` over `A` are singletons — `card_leaf_fiber_mem`);
`A`, `J`, `L ∖ leaves(A)` are pairwise disjoint (`C ∩ D = ∅`, `C ∩ L = ∅`, `D ∩ L = ∅`);
`A ∪ J` is independent by the definition of `U(J)`; nothing in `A` is adjacent to a leaf outside
`leaves(A)`; nothing in `J` is adjacent to a leaf. So `Φ⟨J,A⟩` is independent of size
`|A| + (a−1) + (ℓ − |A|) = ℓ + a − 1 = α − 1`, and `|Φ ∩ D| = |J| = a − 1 ≠ a`.
Its weight is `w = (ℓ − |A|) − |A| = ℓ − 2|A|` (λ ≡ 1 on `A`).

*⊆ (`famIII_subset_image`).* For `B ∈ famIII`, shape 3 gives `|B∩D| + 1 = a`, `Σ(λ−1) = 0` — so
`λ ≡ 1` on `B ∩ C`, i.e. `B ∩ C ⊆ C₁` — and `h = 0`, i.e. `|B∩L| = ℓ − |B∩C|`. `B ∩ C ⊆ U(B∩D)`
because `B` is independent. `B ∩ L ⊆ L ∖ leaves(B∩C)` and both have cardinality `ℓ − |B∩C|`, so they
are equal; and `B = (B∩C) ∪ (B∩D) ∪ (B∩L)`.

**L-5 `deletion_injection` / `fibre_nonneg`.** For any `U`,
`2 Σ_{A ∈ I(U)} |A| ≤ |U|·|I(U)|` (`R26LA1.deletionInjectionBound`, the `A ↦ A.erase u` injection —
Andriantiana–Razanajatovo Misanantenaina–Wagner (2020), **re-proved in-run, never imported**), hence
the sharp fibre inequality `(ℓ − |U|)·|I(U)| ≤ Σ_{A ∈ I(U)} (ℓ − 2|A|)` (`R26CritF.fibreInequalitySharp`).
With `|U(J)| ≤ |C₁| ≤ ℓ` (from `j·|C_j| ≤ ℓ` at `j = 1`) each fibre sum is `≥ 0`.

**`famIII_sum_nonneg` (`W_III ≥ 0`).**
`W_III = Σ_{J ∈ shellD} Σ_{A ∈ I(U(J))} (ℓ − 2|A|) ≥ 0` by `Finset.sum_sigma` and `fibre_nonneg`.

**`node-sign-bound` (`sign_bound`).** `W = W_I + W_II + W_III ≥ ℓ(ℓ−1)M + (ℓ−4)N₂`, so by (RI)

```
S = ℓM − W  ≤  −ℓ(ℓ−2)M − (ℓ−4)N₂           (in ℤ).
```

## 4. Finish (three named nodes)

- **`finish_ell_ge_four`** (`ℓ ≥ 4`). `ℓ(ℓ−2) ≥ 0` and `ℓ − 4 ≥ 0`, `M ≥ 0`, `N₂ ≥ 0`; both terms of
  the bound are `≤ 0`, so `S ≤ 0`.
- **`finish_ell_three`** (`ℓ = 3`). `2k₂ ≤ ℓ = 3` gives `k₂ ≤ 1`, so `N₂ ≤ k₂M ≤ M`; the bound reads
  `S ≤ −3M + N₂ ≤ −2M ≤ 0`.
- **`finish_ell_two`** (`ℓ = 2`). `C₂ = ∅` on the eligible class: if `λ(s) = 2` and `ℓ = 2` then
  `G = P₃` and `α = 2` (**L-7** `ell_two_lambda_two_imp_alpha_two`, `hyp-tree` and connectivity, **no**
  `hyp-alpha`), contradicting `α ≥ 3`, which is the *only* consumption of `hyp-eligible`
  (`C2_card_eq_zero_of_alpha_three`). So `k₂ = 0`, `N₂ = 0`, and the bound reads `S ≤ 2·0 = 0`.
- `ℓ ≤ 1` is impossible by `leaf_card_ge_two`.

The terminal theorem splits on `ℓ < 4` / `ℓ ≥ 4` and, in the first case, on `ℓ = 2` / `ℓ = 3`
(`2 ≤ ℓ` from `leaf_card_ge_two`), applying the three finish nodes to the sign bound.

## 5. `ℕ`-subtraction audit (R5, R8)

Every inequality that could cross zero is stated in `ℤ` with explicit casts. The truncated `ℕ`
subtractions that occur, and why each is safe:

| Expression | Where | Discharge |
|---|---|---|
| `α − 1` | the rank of `topShell`, `aggregate G (α−1)` | `hAlpha : 2 ≤ α`, so `α − 1 + 1 = α`; converted once in `budget_identity` (`B.card + 1 = α`) and in `famI_eq_image`/`famIIIMap_spec` (`|B| = ℓ + a − 1` with `ℓ ≥ 1`). |
| `a − |A_D|` | the budget's interior term | stated in `ℤ` as `(aVal G : ℤ) − ((B ∩ interior G).card : ℤ)`; nonnegativity is `interior_term_nonneg`, an `ℕ` inequality cast up. |
| `a − 1` (the shell) | `shellD` | **never written**: the shell is `J.card + 1 = aVal G`, so `a = 0` makes it empty by construction, and shape 3 of `budget_shapes` is the `ℤ` statement `(|B∩D| : ℤ) + 1 = (a : ℤ)`. |
| `λ(s) − 1` | the budget's support term | stated in `ℤ` as `(λ(s) : ℤ) − 1`; `λ ≥ 1` on `C` (`support_term_nonneg`). |
| `ℓ − |B∩L| − Σλ` | `slack` | defined in `ℤ`; `h_nonneg` casts U2's `ℕ` bound up. |
| `ℓ − 2` | `|B ∩ L|` in family (II) | `famII_card_inter_leaf` is proved as `|B∩L| + 2 = ℓ` in `ℕ` (no subtraction); the `ℤ` form is obtained by `exact_mod_cast`. |
| `ℓ − 4` | the family-(II) weight | appears only inside `ℤ` expressions `((ℓ : ℤ) − 4)`. |
| `ℓ − |A|`, `ℓ − |FA|` | `(L ∖ leaves(A)).card` | `Finset.card_sdiff` with `leaves(A) ⊆ L`; converted to `ℤ` with `A.card ≤ ℓ` in hand (`famIIIMap_spec`, `famIII_subset_image`). |
| `ℓ − 1` | `(L.erase v).card` | `Finset.card_erase_of_mem` with `v ∈ L`, and `1 ≤ ℓ`. |
| `ℓ − Q(A_C) − |B∩L|` | the `h = 0` shapes | never formed as `ℕ` subtraction; it is `slack`, an `ℤ` definition. |

## 6. Carry table (R2) — origin and full SHA-256

Every carried declaration is byte-identical to its origin at the declaration level, **except** the
declaration keyword: a source `theorem` is registered under kind `lemma` (the registrar admits exactly
one terminal `theorem`), with every other byte identical. The full per-declaration digests before and
after that one-token change are in `CAPSULE-VERIFICATION.json` (`r2_carry_keyword_normalisation`);
the frozen-file digests are:

| Origin file | SHA-256 | Declarations carried |
|---|---|---|
| `sources/r24/c5-la1/LeanProject/LeanProof/Main.lean` | `0933211d8f02acd867e91547d4a2b09d13fcc3ea178e192e385acc33b696b63b` | all 31 `VERITYOS ENTRY` bodies (definitions 1–14, lemmas 15–30, entry 31 as `lemma`; 30/31 entry digests reproduced, entry 31 recorded under `r1_byte_diff`) |
| `sources/c1-stage7-sources/U2-Main.lean` | `c382707596674822e0b78135414cdd3320e0bc56f9f558fee78e438794b1043b` | `R26LA1.indepPowerset`, `deletionInjectionBound`, `isIndepSet_union_of_no_cross_adj`, `budgetWeightBound`, `leafDegree_sum_eq_inter_support` |
| `sources/c1-stage7-sources/U3-Main.lean` | `fb54fa05563238ba77167cefd1d30fd85baa0135a36d24518284e2380b6fa332` | `R26U3.closed_reachable`, `card_leafSet_ge_two_of_nontrivial`, `tree_two_le_indepNum_two_le_leafSet`, `tree_two_le_indepNum_no_adjacent_leaves`, `sum_leafDegree_eq_card_leafSet`, `eligible_three_le_indepNum`, `nonleaf_degree_eq_two_of_leafSet_card_eq_two`, `leafDegree_two_indepNum_eq_two` |
| `sources/c1-stage7-sources/C-U3-T-CriticU3T.lean` | `1dba1d5bb45129f3e0a62a1081723db558bbcf134a4acb0d928125a24074a993` | `R26CritU3T.mul_card_leafDegree_fiber_le_card_leafSet`, `two_mul_card_C2_le_card_leafSet` |
| `sources/c1-stage7-sources/C-U2-T-CriticT.lean` | `5fafeb1446bca62ea16c46679fa37636fbd5e11a190e23a605a9c7428043600e` | `R26CritT.famOneMap`, `famOneSource`, `famOneInjOn`, `famOneImageCard` |
| `sources/c1-stage7-sources/C-U2-F-CritF.lean` | `4ce9a7a5690f584e88d60947ec32ee33aaa42bc134b6bede86c0db73712edfb4` | `R26CritF.fibreInequalitySharp` |

**Not carried, and re-derived instead** (R2's collision rule and the `sorry` rule):

- `R26CritU3T.supportSet` (the *image* spelling), `leaf_not_mem_supportSet`,
  `disjoint_leafSet_supportSet`, `leaf_leafDegree_eq_zero` — three incompatible spellings of
  `supportSet` exist in the corpus; this run defines `R26LA1.supportSet` as the *filter* spelling,
  proves `c_eq_support_image` (L-12) to connect them, and re-derives `leaf_not_mem_supportSet` and
  `leaf_support_disjoint` on its own spelling. No carried bytes were edited.
- `R26CritU3T.no_leafDegree_two_of_eligible` / `card_C2_eq_zero_of_eligible` — re-derived as
  `C2_card_eq_zero_of_alpha_three`, which takes `3 ≤ α` rather than `hEligible`, so that the
  "`hyp-eligible` is consumed only through `α ≥ 3`" claim is literal in the Lean text.
- `R26CritT.budgetIdentity` / `slack` / `slack_nonneg` / `budgetExact` — re-derived as
  `R26LA1.slack`, `h_nonneg`, `budget_identity` over this run's `supportSet`, so the budget is stated
  on the award's own carrier rather than on `R26CritT.suppSet`.
- `R26CritF.familyOneWeightPointwise` / `familyOneWeightSum`, `R26LA1.familyOneInjection`,
  `R26CritF.familyOneInjectionNoL1` — superseded: `family_I_weight` gives the weight on the *actual*
  family (I) and `famI_eq_image`/`famI_card` give the *exact* count `ℓM`, not an inequality over an
  index product. The inert `hL1` of U2's `familyOneInjection` never enters (repair 10); the real
  obligation `a + (ℓ−1) = α − 1` is discharged at the call site by the gate.
- `R26U3.degree_one_mem_support_eq_endpoint`, `connected_induce_compl_pair` — not carried and not a
  DAG step (repair 9); the `ℓ = 2` closure goes through `leafDegree_two_indepNum_eq_two` and
  connectivity consumed explicitly, never through a nested `induce`.
- `U1`'s `LeanProject/LeanProof/Main.lean` (`c8f29ef0…`) — **never carried**: five `sorry`s and a
  wrongly stated `signBound`. Its sorry-free declarations are re-derived on the clean base
  (`mem_supportSet_iff`, `support_mem_supportSet`, `leaf_degree_sum_eq_card`,
  `eligible_imp_alpha_ge_three`). The `C-U1-T` and `C-U1-F` fragments reference that module and are
  therefore re-derived, not carried (`deletionInjection` is carried instead from U2's sorry-free
  `deletionInjectionBound`; the `2 ≤ ℓ` bridge of `C-U1-F` is subsumed by the three finish nodes).
- The U adjudicator's probe X-5 (`AdjProbe.lean`) is **re-proved** here as `maxIndep_no_support`,
  not carried, so no adjudicator statement enters the award unread.

## 7. Attributions on the face of the claim (fence 7, repair 11)

- **Packet lane 05** — the candidate architecture and the forced-neighbour **statement**.
- **r24 critic `C-T1-U`** — the family expansion (B3).
- **r24 route A1** — the flat law.
- **Andriantiana–Razanajatovo Misanantenaina–Wagner (2020)** — the occupancy bound
  (`deletionInjectionBound` / the sharp fibre inequality), **re-proved in-run and never imported**.
- **r26 seats and critics, per node**: U2 (`indepPowerset`, `deletionInjectionBound`,
  `isIndepSet_union_of_no_cross_adj`, `budgetWeightBound`, `leafDegree_sum_eq_inter_support`);
  U3 (the tree-structural core, L-6/L-7/L-10/L-11); `C-U3-T` (`j·|C_j| ≤ ℓ`, `k₂ ≤ ⌊ℓ/2⌋`);
  `C-U2-T` (the exact `= 1` budget, the family-(I) map, its injectivity and exact image count);
  `C-U2-F` (the sharp fibre inequality); `C-T1-F`, `C-U1-T`, `C-U1-F`, `C-U3-F` for their informal
  derivations of the same nodes; T1 §3 (`L0`–`L11` with the `L5` repair) for the derivation of record.

## 8. Fences and excluded conclusions (§2, `SOLUTION-CONTRACT.md` §3)

§3.1 — no status transfers to the all-rank aggregate
`E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, `E993-BETA-AGG`, the transport, the common-leaf
condition, TREE, FOREST, TRANSFER or Erdős #993. §3.2 — `P₃` and `P₅` are excluded by `hyp-eligible`,
not by `(★)`. §3.3 — no census carries any weight: the 16,424-tree census, the order-54 adversarial
families and the order-53 `M = 2^k` witnesses are corroboration only and appear nowhere in the proof.
§3.4 — no counterexample exists or is proposed. §3.5 — no sealed r24 file is edited. §3.6 — no refuted
mechanism is reopened. §3.7 — the attributions of §7 above.

**Excluded conclusions.** This award does **not** state, and nothing here may be read as stating: the
strict form `S < 0`; the characterization `S = 0 ⟺ P₅`; any statement at a rank other than `α − 1`;
any statement on the non-residual class; any forest statement; any `RTree` statement; any restatement
of (RI); any fixed-band, bounded or censused result; `N₂ ≤ M` (false from order 9 — the proof uses
`N₂ ≤ k₂M` with `k₂ ≤ ⌊ℓ/2⌋`); and the all-rank aggregate.

## 9. Axiom and method policy

Permitted axioms exactly `propext`, `Classical.choice`, `Quot.sound`. No `sorry`, `admit`,
`native_decide`, `axiom`; no `decide` over an enumeration standing in for a universal step. The proof
runs through structural bijections (`Finset.card_nbij'`, `Finset.card_image_of_injOn`,
`Finset.sum_image`, `Finset.sum_sigma`) and integer counting lemmas on the actual C5-LA1 definitions.
