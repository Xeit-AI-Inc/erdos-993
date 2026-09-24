# Informal proof — C1-LA2: the deletion injection and the sharp fibre inequality

Award group `C1-LA2` of Cycle 1, r26 (`erdos-993-math-dre-20260923-r26-top-rank-residual-sign`).
Governing text: `cycles/cycle-1/stage6/SYNTHESIS.md`, `## Lean awards`, "C1-LA2 — the deletion
injection and the sharp fibre inequality". Granularity: statement level, one section per shipped
declaration, in the order the Lean project compiles them.

## Attribution on the face of this claim

- **Andriantiana–Razanajatovo Misanantenaina–Wagner (2020)** — the occupancy bound
  `avi(H) ≤ |V(H)|/2` of which `deletionInjectionBound` is the in-run restatement. Per
  `SOLUTION-CONTRACT.md` §3.7 (fence 7) this attribution travels on the face of every registration
  of the deletion injection. **The result is RE-PROVED in-run** by the injection `A ↦ A.erase u`
  and **is never imported**: no Mathlib or external statement of the occupancy bound is used, and
  the proof below is self-contained over `Finset` and `SimpleGraph.IsIndepSet`. The critique
  `C-U2-F` (finding F6) and the critique `C-U2-T` both record that the missing attribution line was
  the only defect standing between this material and registration.
- **Compiled form of `deletionInjectionBound`: route-attributed to U2** (`cycles/cycle-1/stage3/
  returns/U2/RETURN.md`, items (a)/(b): `R26LA1.deletionInjectionBound`, `R26LA1.fibreInequality`).
- **Sharp form `fibreInequalitySharp`: critic-attributed to `C-U2-F`**
  (`cycles/cycle-1/stage4/critics/U2/F/CRITIQUE.md`, finding F7 item 1,
  `R26CritF.fibreInequalitySharp`).
- **Informal derivations: `T3` (v)** (`cycles/cycle-1/stage3/returns/T3/RETURN.md`, "(v) The
  deletion injection (arbitrary finite graph) and the fibre corollary" — the sharpest informal
  statement) **and `C-F1-T` (D)**.
- **Statement identity** of `C-U1-F`'s variant `deletionInjection_proved` with the U2 form was
  verified in the kernel by `rfl` (recorded in the synthesis, `## Lean awards`, C1-LA2).
- The general Fubini-for-filters lemma `C5LA1.sum_card_filter_comm` is the frozen C5-LA1 award's
  ENTRY 23, reused by U2 (a) and by T3 (v) and carried here byte-identically at the declaration
  level; it is not re-proved.

## Excluded conclusions (fences)

This award states **nothing** about the residual sign `S`, about trees, about connectivity, about
families (I)/(II)/(III), about `W_III`, or about (RC). Its **use** at `U(J')` — the instantiation
`U := U(J')`, `ℓ := |L(G)|` that turns the fibre bound into `W_III(J') ≥ 0` — belongs to C1-LA1 and
is **not** part of this award. No status transfers to the all-rank aggregate,
`E993-BETA-AGG`, the ordinary-to-RTree transport, the common-leaf condition, TREE, FOREST, TRANSFER
or Erdős #993.

## Hypotheses

**None beyond finiteness.** `V` is a finite type with decidable equality and `G` has decidable
adjacency; `U : Finset V` and `ℓ : ℕ` are arbitrary. There is no tree hypothesis, no connectivity
hypothesis, no `hyp-alpha`, no `hyp-eligible`, and no residual hypothesis `(★)`. In particular
`|U| ≤ ℓ` is **not** assumed: the sharp form holds for every `ℓ : ℕ`, including `ℓ < |U|`, where the
left-hand side is negative and the inequality is weak but true.

---

## 1. Definition — `R26LA2.indepPowerset`

For a finite simple graph `G` on `V` and a vertex set `U : Finset V`,

```
I(U) := indepPowerset G U := U.powerset.filter (fun A => G.IsIndepSet (A : Set V))
```

is the finset of those `A ⊆ U` that are independent in `G`. Note `I(U)` is a set of subsets of `U`,
not of `V`: membership `A ∈ I(U)` unfolds exactly to `A ⊆ U ∧ G.IsIndepSet (A : Set V)`. The empty
set always belongs, so `I(U)` is never empty.

## 2. Lemma — `C5LA1.sum_card_filter_comm` (frozen C5-LA1 ENTRY 23, reused)

For finsets `s : Finset α`, `t : Finset β` and a decidable relation `r : α → β → Prop`,

```
∑ a ∈ s, |{b ∈ t : r a b}| = ∑ b ∈ t, |{a ∈ s : r a b}|.
```

**Proof.** Rewrite each filtered cardinality as a sum of indicator terms
(`Finset.card_filter`), then exchange the two finite sums (`Finset.sum_comm`). ∎

This is the exchange-of-summation step ("Fubini for filters") used by the double count in §3. It is
the C5-LA1 award's own declaration, carried unchanged.

## 3. Lemma — `R26LA2.deletionInjectionBound`

**Statement.** For every finite simple graph `G` on `V` and every `U : Finset V`,

```
2 * ∑ A ∈ I(U), |A|  ≤  |U| * |I(U)|         (in ℕ)
```

equivalently: the average size of an independent subset of `U` is at most `|U|/2`.

**Proof.**

*Step 1 (the deletion injection, one fixed vertex).* Fix `u ∈ U`. The map `A ↦ A.erase u` sends
`{A ∈ I(U) : u ∈ A}` into `{A ∈ I(U) : u ∉ A}`:

- *well-defined*: from `A ∈ I(U)` we get `A ⊆ U` and `G.IsIndepSet (A : Set V)`. Then
  `A.erase u ⊆ A ⊆ U`, and `A.erase u` is independent because independence is a pairwise condition
  and hence downward closed along `A.erase u ⊆ A` (`Set.Pairwise.mono`). Finally
  `u ∉ A.erase u` (`Finset.notMem_erase`). So `A.erase u ∈ {A ∈ I(U) : u ∉ A}`.
- *injective*: if `u ∈ A`, `u ∈ B` and `A.erase u = B.erase u`, then
  `A = insert u (A.erase u) = insert u (B.erase u) = B` (`Finset.insert_erase` twice).

Hence `|{A ∈ I(U) : u ∈ A}| ≤ |{A ∈ I(U) : u ∉ A}|`.

*Step 2 (the partition).* The predicates `u ∈ A` and `¬ u ∈ A` partition `I(U)`, so exactly
`|{A ∈ I(U) : u ∈ A}| + |{A ∈ I(U) : u ∉ A}| = |I(U)|`
(`Finset.card_filter_add_card_filter_not`). Combining with Step 1 by linear arithmetic over `ℕ`
(`omega` — the equation is exact, nothing is truncated) gives, **for every `u ∈ U`**,

```
2 * |{A ∈ I(U) : u ∈ A}| ≤ |I(U)|.
```

*Step 3 (double count).* By §2 with `s := U`, `t := I(U)`, `r u A := u ∈ A`,

```
∑ u ∈ U, |{A ∈ I(U) : u ∈ A}| = ∑ A ∈ I(U), |{u ∈ U : u ∈ A}| = ∑ A ∈ I(U), |A|,
```

the last equality because `A ⊆ U` for `A ∈ I(U)`, so the inner filter `U.filter (· ∈ A)` is `A`
itself (proved elementwise by `Finset.ext`).

*Step 4 (sum and conclude).* Summing Step 2 over `u ∈ U` and substituting Step 3,

```
2 * ∑ A ∈ I(U), |A| = ∑ u ∈ U, 2 * |{A ∈ I(U) : u ∈ A}| ≤ ∑ u ∈ U, |I(U)| = |U| * |I(U)|. ∎
```

**`ℕ`-subtraction audit.** None occurs. The lemma uses only additions, one exact partition
equation, and `omega`; no truncated subtraction appears anywhere in the statement or the proof.

## 4. Theorem (terminal) — `R26LA2.fibreInequalitySharp`

**Statement.** For every finite simple graph `G` on `V`, every `U : Finset V` and **every** `ℓ : ℕ`,
in `ℤ` with all casts explicit,

```
((ℓ : ℤ) - (|U| : ℤ)) * (|I(U)| : ℤ)  ≤  ∑ A ∈ I(U), ((ℓ : ℤ) - 2 * (|A| : ℤ)).
```

**Proof.**

*Step 1 (cast §3 into `ℤ`).* From `2 * ∑ A ∈ I(U), |A| ≤ |U| * |I(U)|` in `ℕ`, casting the whole
inequality (`exact_mod_cast`) and distributing the cast over the product and the sum (`push_cast`)
gives

```
2 * ∑ A ∈ I(U), (|A| : ℤ)  ≤  (|U| : ℤ) * (|I(U)| : ℤ).
```

The cast is monotone and injective on `ℕ`, so no information is lost and no subtraction is involved.

*Step 2 (expand the fibre sum).* Splitting the summand and evaluating the constant sum
(`Finset.sum_sub_distrib`, `Finset.sum_const`, `Finset.mul_sum`, `push_cast`, `ring`),

```
∑ A ∈ I(U), ((ℓ : ℤ) - 2 * (|A| : ℤ)) = (ℓ : ℤ) * (|I(U)| : ℤ) - 2 * ∑ A ∈ I(U), (|A| : ℤ).
```

This is an identity in `ℤ`, valid for every `ℓ`; the individual terms `ℓ - 2|A|` may be negative,
which is exactly why the statement lives in `ℤ` and not in `ℕ`.

*Step 3 (conclude).* Substituting Step 2, the claim becomes

```
(ℓ : ℤ) * (|I(U)| : ℤ) - (|U| : ℤ) * (|I(U)| : ℤ)
    ≤ (ℓ : ℤ) * (|I(U)| : ℤ) - 2 * ∑ A ∈ I(U), (|A| : ℤ),
```

i.e. `2 * ∑ A ∈ I(U), (|A| : ℤ) ≤ (|U| : ℤ) * (|I(U)| : ℤ)`, which is Step 1. ∎

**Sharpness and scope.** No hypothesis `|U| ≤ ℓ` is used. When `|U| ≤ ℓ` the left-hand side is
nonnegative (`|I(U)| ≥ 0`), so U2's `fibreInequality`
(`0 ≤ ∑ A ∈ I(U), ((ℓ : ℤ) - 2 * (|A| : ℤ))`) is the immediate corollary — `C-U2-F` records this as
`fibreInequalityOfSharp`, showing that `|U| ≤ ℓ` is a specialization and not a need. When `ℓ < |U|`
the left-hand side is negative and the inequality is still true and still content-bearing: it is the
quantitative slack `(ℓ − |U|)·|I(U)|`, not merely the sign. That quantitative form is what a
successor needs at `U := U(J')`; **the instantiation itself is C1-LA1's obligation, not this
award's.**

**`ℕ`-subtraction audit.** The statement and the proof are in `ℤ` throughout. The only `ℕ` objects
are `ℓ`, `|U|`, `|A|` and `|I(U)|`, each cast individually with `Nat.cast`; every subtraction
(`(ℓ : ℤ) - (|U| : ℤ)`, `(ℓ : ℤ) - 2 * (|A| : ℤ)`) is an `ℤ`-subtraction that may cross zero and is
never truncated.

---

## Method and axiom policy

Permitted axioms exactly `propext`, `Classical.choice`, `Quot.sound`. No `sorry`, no `admit`, no
`axiom`, no `native_decide`, and no `decide` over an enumeration standing in for a universal step.
Both proofs are structural: an explicit injection on finsets plus an exchange of summation, then
linear/ring reasoning over `ℤ`. No bounded computation, census or numerical corroboration carries
any weight here; the exhaustive checks recorded by `C-U2-F` (all graphs `n ≤ 5`, all `U`, all
`ℓ ≥ 0`) and by the Cycle 1 census are corroboration only, per `SOLUTION-CONTRACT.md` §3.3.

## Second reader's eye (F adjudicator's caveat, adopted by the synthesis)

The synthesis records that the sharp form's informal derivation is single-sourced within orientation
F, and directs the Stage 7 informal auditor to give it a second reader's eye. The derivation above
is written to be checkable independently of the Lean text: §4 Steps 1–3 are three lines of integer
algebra over §3, and §3 is T3 (v)'s argument verbatim in structure. The informal audit of this award
is an independently assigned seat and is **not** performed by this formalizer.
