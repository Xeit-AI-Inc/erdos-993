# Informal Proof — C1-LA1 (TSB), key `E993-BIPARTITE-TAGGED-SHADOW-BOUND`

Run: r29 (`erdos-993-math-dre-20260925-r29-high-tail-certification`), Cycle 1 Stage 7, governed run
`runs/lean-2026-09-25-c1-la1-tagged-shadow-bound`. Producer: `c1-la1-formalizer-opus-20260925`.
Model disclosure (two-part): chartered model Claude Opus 5.5, effort high (dispatch-record authority,
`control/dispatch/c1-stage7/DISPATCH-C1-LA1.md`); runtime-reported model id, verbatim: `claude-opus-5-5[1m]`.

Informal proof of record: the synthesis `cycles/cycle-1/stage6/SYNTHESIS.md`, `## Exact established results`,
R-TSB (steps (i)–(iv)). This file restates it at statement-level granularity against the Lean declarations of this
run. It is an informal proof for audit, not a verification claim.

## 1. Statement

For a finite type `V` (`[Fintype V] [DecidableEq V]`), a simple graph `H` on `V` with `[DecidableRel H.Adj]`,
`hBip : H.IsBipartite`, a tag set `W : Finset V`, and a natural `k` with `hk : 1 ≤ k` and `hka : k ≤ H.indepNum`:

```
(k : ℤ) * q_{k+1} ≤ 2 * ((H.indepNum : ℤ) - k) * q_k,     q_j := (taggedFamily H Finset.univ W j).card,
```

where `taggedFamily H Finset.univ W j` (carried entry 18 of the first-interior source) is the finset of `j`-subsets
`A ⊆ V` that are independent in `H` (`H.IsIndepSet (A : Set V)`) and meet `W` (`¬ Disjoint A W`). Write
`a := H.indepNum` (Mathlib's independence number: the largest cardinality of an independent finset).

Lean terminal declaration: `theorem E993HighTail.bipartiteTaggedShadowBound` (placed last in the single source).

## 2. Proof (dependency order = declaration order)

Let `T_j := taggedFamily H U W j` for a carrier `U : Finset V` and a cap `a` with
`hcap : ∀ A ⊆ U, H.IsIndepSet A → A.card ≤ a`. Entry 41 works at this `U`-relative generality; the award uses
`U = Finset.univ`, `a = H.indepNum`.

**Step 1 — deletions (carried `E993Interior.Core.tagged_deletions_lower`, entry 41).** Every `B ∈ T_{k+1}` contains
at least `k` members of `T_k`. Proof: `B` meets `W`; fix `w ∈ B ∩ W`. For each `v ∈ B ∖ {w}`, the set `B ∖ {v}` has
`k` elements (since `|B| = k + 1`), lies in `U`, is independent (a subset of an independent set), and still contains
`w`, so it meets `W`; hence `B ∖ {v} ∈ T_k`. The map `v ↦ B ∖ {v}` is injective on `B`, so these are `|B ∖ {w}| = k`
distinct members of `T_k` below `B`. Hypotheses used: none beyond the definition of `taggedFamily` (neither `hBip`
nor `hk`).

**Step 2 — colour-class union is independent (carried `E993Interior.Core.indep_union_color`).** Given a colouring
`c : H.Coloring (Fin 2)`, an independent `A`, and `E` with no edge from `E` to `A`, for each colour `z` the set
`A ∪ {v ∈ E : c v = z}` is independent: pairs inside `A` by independence of `A`; mixed pairs by the no-cross-edge
condition; pairs inside the colour class because a proper colouring gives adjacent vertices different colours.

**Step 3 — additions bound (carried `E993Interior.Core.card_extension_le`). `IsBipartite` enters here and only
here.** `hBip : H.IsBipartite` is Mathlib's `H.Colorable 2` (`Bipartite.lean:286`), i.e. a proper 2-colouring
`c : V → Fin 2` exists; the proof destructures it (`obtain ⟨c⟩ := hBip`). For an independent `A ⊆ U` and any
`E ⊆ U` disjoint from `A` with no edge to `A`, split `E = P ⊔ Q` with `P = {v ∈ E : c v = 0}` and
`Q = {v ∈ E : c v ≠ 0}`; since `Fin 2` has two values, `Q = {v ∈ E : c v = 1}` (proved by `omega` from
`(c v).isLt`, not by `decide`). By Step 2, `A ∪ P` and `A ∪ Q` are independent subsets of `U`, so by `hcap`,
`|A| + |P| ≤ a` and `|A| + |Q| ≤ a` (disjoint unions). With `|P| + |Q| = |E|`
(`Finset.card_filter_add_card_filter_not`), `|E| ≤ 2(a ∸ |A|)` in truncated ℕ (`omega`).

**Step 4 — upper count per `k`-set (carried `E993Interior.Core.tagged_extensions_upper`).** For `A ∈ T_k`, let
`E := {v ∈ U : v ∉ A, A ∪ {v} independent}`. Then `E ⊆ U`, `E ∩ A = ∅`, and no vertex of `E` is adjacent to a
vertex of `A`; by Step 3 (with `|A| = k`), `|E| ≤ 2(a ∸ k)`. Every `B ∈ T_{k+1}` with `A ⊆ B` has `B ∖ A` a
one-element subset of `E` (its element `v` gives `A ∪ {v} ⊆ B`, independent), and `B ↦ B ∖ A` is injective on
supersets of `A`. So the number of such `B` is at most `|E| ≤ 2(a ∸ k)`. Consumes `hBip` (through Step 3) and `hcap`.

**Step 5 — double count (carried `E993Interior.taggedShadowBound`, entry 41).** Count the pairs `(B, A)` with
`B ∈ T_{k+1}`, `A ∈ T_k`, `A ⊆ B`. By Step 1 each `B` has at least `k` partners; by Step 4 each `A` has at most
`2(a ∸ k)` partners. Hence (Mathlib `Finset.card_nsmul_le_card_nsmul`) `k · |T_{k+1}| ≤ 2(a ∸ k) · |T_k|` in ℕ.
Hypotheses: `hBip`, `hcap`; `hk : 1 ≤ k` is a hypothesis of entry 41 but its body never references it (the Lean
unused-variable linter reports `hk` at the carried fragment, `Main.lean:178:5`).

**Step 6 — registry specialisation, ℕ companion (`lemma E993HighTail.bipartiteTaggedShadowBoundNat`).** Apply
Step 5 with `U = Finset.univ` and `a = H.indepNum`. The cap `hcap` holds because every independent finset has
cardinality at most `H.indepNum` (Mathlib `SimpleGraph.IsIndepSet.card_le_indepNum`, `Clique.lean:991`). Result:
`k * q_{k+1} ≤ 2 * (H.indepNum - k) * q_k` in ℕ with truncated subtraction, for every `k` with `1 ≤ k` (no
`k ≤ a` hypothesis).

**Step 7 — the terminal theorem (`theorem E993HighTail.bipartiteTaggedShadowBound`).** Cast the ℕ inequality of
Step 6 to ℤ (`Int.ofNat_le.mpr`), distribute the casts (`push_cast`), and replace `((H.indepNum - k : ℕ) : ℤ)` by
`(H.indepNum : ℤ) - k` using `Nat.cast_sub hka`; `linarith` closes. **`hka : k ≤ H.indepNum` enters here only.**
`hk` is passed to the ℕ companion and on to entry 41 (statement scope).

## 3. Hypothesis consumption

| Hypothesis | Where it enters | Role |
|---|---|---|
| `hBip : H.IsBipartite` | Step 3, `Core.card_extension_le` (`obtain ⟨c⟩ := hBip`), the 2-colouring splits the addable set | essential (false for non-bipartite graphs, B4: `K_1 ⊔ K_5`) |
| `hk : 1 ≤ k` | passed to entry 41 via the ℕ companion; never referenced in entry 41's body | statement scope only |
| `hka : k ≤ H.indepNum` | Step 7, `Nat.cast_sub hka` | makes the ℤ `α − k` equal the ℕ `α ∸ k` |
| `W : Finset V` | the tag set of `taggedFamily`; arbitrary (`W = ∅` gives `0 ≤ 0`) | — |
| `IsTree` | not a hypothesis of this award; no tree statement | not used |
| `p ≥ 1`, `p ≥ 2`, the guard `2α + 1 ≤ 3p` | not hypotheses of this award (no leaf/rank/aggregate statement) | not used |

## 4. ℕ/ℤ cast audit

- `taggedFamily … .card` is a natural number; the terminal statement casts `k`, both cardinalities and
  `H.indepNum` to ℤ; the subtraction `(H.indepNum : ℤ) - k` is integer subtraction.
- The only truncated subtraction is `H.indepNum - k` in ℕ (entry 41 and the ℕ companion). Under `hka : k ≤ H.indepNum`,
  `((H.indepNum - k : ℕ) : ℤ) = (H.indepNum : ℤ) - (k : ℤ)` (`Nat.cast_sub hka`), so the ℤ right side equals the ℕ right
  side. The registry text (`1 ≤ k ≤ a`, integers) and the Lean text agree on this domain.
- The terminal theorem makes no claim for `k = 0` or `k > a` (excluded; the ℕ companion without `k ≤ a` is a lemma, not
  the award).

## 5. Carry table (byte-identical transport)

| Run entry | Declaration | Origin | Origin SHA-256 | Registered SHA-256 | Mode |
|---|---|---|---|---|---|
| 1 | `E993Interior.taggedFamily` (definition) | first-interior entry 18, `sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Snippets/0018-definition-E993Interior-taggedFamily.lean.fragment` | `cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e` | same | byte-identical registrar unit |
| 2 | `E993Interior.taggedShadowBound` (+ private `Core.indep_union_color`, `Core.card_extension_le`, `Core.tagged_deletions_lower`, `Core.tagged_extensions_upper`) | first-interior entry 41, `…/Snippets/0041-lemma-E993Interior-taggedShadowBound.lean.fragment` | `50dcce4a7ad13fbb73361ff1235996a7bb79eeea2cf9435a752b1eab50d8583f` | same | byte-identical registrar unit |
| 3 | `E993HighTail.bipartiteTaggedShadowBoundNat` (lemma, with its docstring) | U's adjudicator base candidate `sources/c1-stage7-sources/ADJ-U-awards-LA1-Main.lean` | file `d88f6043e9b8e1587daa1495a1e7a8792f9cd3400529c159e46c5021ba5862ce`; declaration text `eef5a65947906c834919094ccd32abc24a3ec022ac0be2b4ad2059b5c4d88ecb` (507 B) | fragment digest in `FORMALIZATION-STATE.json` | declaration byte-identical; namespace wrapper, `open E993Interior` and a provenance comment are new |
| 4 | `E993HighTail.bipartiteTaggedShadowBound` (terminal theorem) | same base candidate | file `d88f6043…62ce`; declaration text `f5f0011b595194ebb8fe132a8f79c428546df7ea0b38649292111b0fcc708428` (757 B) | fragment digest in `FORMALIZATION-STATE.json` | declaration byte-identical; wrapper and comments new |

The first-interior verified `Main.lean` is `8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9`; both
carried fragment digests reproduce its `FORMALIZATION-STATE.json` entries 18 and 41 (`CAPSULE-VERIFICATION.json`).
The carry files `C-U1-F-LA1-Main.lean` (`3cb2055b…`) and `U1-E993HighTail-append.lean` (`f3b89bbf…`) were verified
against `sources/c1-stage7-sources/SOURCE-DIGESTS.json` and not transported. No declaration was re-derived: every
declaration of the source is transported byte-identically at the declaration level. Entries 3 and 4 are
adjudicator-authored bodies (U's adjudicator), attributed as such; the `Nat.cast_sub hka` narrowing they implement is
C-T1-F's and C-T1-U's.

## 6. Attribution

- Codex (GPT-6 Luna/Sol/Astra): the tagged-shadow mechanism, entry 41 (`taggedShadowBound` and its `Core` helpers),
  and the proposed statement (Sol's C2 scope audit).
- First-interior award source: the definition of entry 18 (`E993Interior.taggedFamily`).
- r29: T1 (registry derivation); C-T1-F and C-T1-U (the `Nat.cast_sub hka` narrowing); U1 (scratch compile); C-U1-T
  and C-U1-F (carry sets, candidates); U's adjudicator (base candidate, the source of entries 3–4 here); F1, C-F1-T and
  C-F1-U (falsification, tightness).
- This seat: registrar transport, the contract, this informal restatement; no new mathematics.

## 7. Fences and excluded conclusions

- §3.1: a statement about independent-set counts on finite bipartite graphs; not a no-recovery statement; transfers no
  status to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, `E993-BETA-AGG`, or
  Erdős #993.
- §3.4: this is NOT `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` (REFUTED: "at most `r` addable vertices" for every
  independent `r`-set). The per-set bound used here is `2(a − k)` on bipartite graphs, inside a size-restricted
  incidence count; the refuted key is neither reopened nor aliased.
- §3.7: attribution as in §6, on every face.
- §3.8: this award is a separate certificate. Entry 41's presence inside the first-interior package is context, never a
  certificate; the key changes OPEN → VERIFIED only by this award's own close.
- Excluded: no leaf, tree, selector or aggregate statement; no `k = 0` or `k > a` clause in the terminal theorem
  (the ℕ companion without `k ≤ a` is a lemma only); no tightness claim; nothing about non-bipartite graphs (false
  there, B4); no reopening or aliasing of the refuted addability bound.
