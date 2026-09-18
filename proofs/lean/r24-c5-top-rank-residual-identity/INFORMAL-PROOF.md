# C5-LA1 Informal Proof — `TOP-RANK-RESIDUAL-IDENTITY`

## Status and scope

This is the formalizer's source-bound proof preparation for the awarded
composed theorem `C5-LA1` (`TOP-RANK-RESIDUAL-IDENTITY`, F7 collapse composed
with `(RI)`), literal ordinary-tree scope only. It is not an independent
proof-integrity audit, a fidelity attestation, or workflow closeout.

The theorem asserts an EQUALITY only. It does not assert, weaken to, or
accompany with `(RC)` in any form, the unqualified `(RC)` equivalence, the
reduced lower guard, universal qualifying deletion, any `Γ`/Hall
reformulation, literal-to-governed transport, `E993-BETA-AGG`, or Erdős #993.
`E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`, `E993-BETA-TARGET`, and
`E993-BETA-AGG-SUPPORT` are REFUTED and are neither reopened nor renamed here.

## Source authority

- `sources/r23/SEMANTIC-CONTRACT.md` (SHA-256
  `d004e814e6c6c279a50b3df26d76318d5ff44e5c25f90e446f85f70d15487960`), lines
  30-48: literal definitions of `i_k`, `Delta_k`, `x(T)`, `H_v`, `R_v`,
  `a_v`, `b_v`, `B_v`, `F`, `S(T,p)`.
- `control/C5-F1-STATEMENT-CAPSULE.md`, "Quoted verbatim: Top-Rank Residual
  Identity" (source lines 71-136 of the sealed Cycle 4 F1 return): the exact
  double-counting argument for `(RI)`.
- The verified base award F7 (`C4LA1.topRankSelectorCollapse`,
  `runs/lean-2026-09-15-c4-top-rank-selector-collapse/`): discharges exactly
  the step `F = leafSet` at `p = alpha(G) - 1` (every original leaf is
  favorable at the top interior rank), so the favorable set never enters as a
  hypothesis of this theorem.
- Cycle 5 Stage 6 synthesis (`cycles/cycle-5/stage6/SYNTHESIS.md`,
  `## Lean awards`): the exact awarded statement, the four load-bearing
  hypotheses (including the controller ruling that `hyp-eligible` needs a
  `def-crossing-index` node even though the proof does not use it), and the
  mandatory fences.

## Exact definitions

Let `G` be a finite simple graph on a finite vertex type `V` with decidable
equality and decidable adjacency.

- `i_k(G)` = the number of independent vertex `k`-subsets of `G`, zero
  outside supported nonnegative ranks. For a vertex-deleted graph, coefficient
  counting is over independent subsets of the ORIGINAL vertex type that avoid
  the deleted vertices (as in F7).
- `Delta_k(G) = i_{k+1}(G) - i_k(G)`, an integer.
- `x(G)` = the least `k >= 0` with `Delta_k(G) < 0`. This exists because
  `Delta_{alpha}(G) = i_{alpha+1}(G) - i_alpha(G) = 0 - i_alpha(G) =
  -i_alpha(G) < 0` (no independent set exceeds the independence number, and
  `i_alpha(G) > 0` since the empty independent set of size 0 is always
  achievable and `alpha(G) >= 0`; more precisely `i_alpha(G) >= 1` because a
  maximum independent set exists). Realized in Lean via `Nat.find` over this
  witnessed decidable predicate.
- An original leaf `v` of `G` has degree one; `s_v` is its unique support
  (neighbour).
- `L = L(G)` is the set of original leaves of `G`; `ell = |L|`.
- `lambda(s)` = the number of leaves of `G` adjacent to `s`, extended by zero
  for vertices that are not the support of any leaf.
- `H_v = G - {v, s_v}` (delete the leaf and its support).
- `R_v = G - N_G[s_v]` (delete the closed neighbourhood of the support).
- `p = alpha(G) - 1`, the top interior rank.
- `M = i_{alpha(G)}(G)`.
- `I_p(G)` = the family of independent `p`-subsets of `G`.
- `S(G,p) = ell * M - sum_{B in I_p(G)} ( |B ∩ L| - sum_{s in B} lambda(s) )`.

## Exact awarded theorem

For every finite vertex type `V` with decidable equality, every finite simple
graph `G` on `V` with decidable adjacency, assume:

1. `hyp-tree`: `G.IsTree`.
2. `hyp-alpha`: `2 <= G.indepNum`.
3. `hyp-eligible`: `x(G) + 2 <= G.indepNum - 1`.
4. `hyp-residual`: every leaf of `G` belongs to every maximum independent set
   of `G`.

Then, with `p = G.indepNum - 1`,

```text
S(G, p) = ell*M - sum_{B in I_p(G)} ( |B ∩ L| - sum_{s in B} lambda(s) ).
```

This is `(RI)` composed with the F7 collapse at literal ordinary-tree scope.
The conclusion is an equality; it is never stated as, weakened to, or
accompanied by an inequality, a sign, or a nonpositivity claim about `S`.

Controller ruling on `hyp-eligible` (recorded per the brief and the
synthesis): the proof below does not use `hyp-eligible` — it is carried
verbatim because the synthesis's exact statement requires it in the terminal
declaration, and because omitting it would let the statement be misread as
licensing the FALSE unqualified `(RC)` equivalence (refuted at `K_{1,2}`,
Stage 4 `C-U3-F` critique). Because `hyp-eligible` is stated in terms of
`x(G)`, the contract must add a `def-crossing-index` node even though the
seven-node list quoted from the T critic omitted it; the T critic's list is
superseded on this point by the synthesis's exact statement, which governs.

## Quantifiers and hypotheses

- Universal: finite type `V`.
- Universal: simple graph `G : SimpleGraph V`.
- Typeclass data: `Fintype V`, `DecidableEq V`, `DecidableRel G.Adj`.
- Mathematical hypotheses: `G.IsTree`; `2 <= G.indepNum`;
  `x(G) + 2 <= G.indepNum - 1`; every leaf of `G` lies in every maximum
  independent set of `G`.
- Conclusion: the equality `S(G, G.indepNum - 1) = ...` above.

No domain is narrowed to a named tree family. No extra graph hypothesis is
introduced beyond the four named. `hyp-tree` and `hyp-eligible` are retained
in the declaration even though the proof below does not use them for the
counting argument, per the synthesis's explicit F7 precedent (`_hTree`
retained unused there) and its explicit ruling that all four hypotheses must
appear in the terminal declaration.

## Proof

Fix `G` satisfying the four hypotheses. Write `a = alpha(G) = G.indepNum`,
`p = a - 1`.

### Step 1 — every leaf is favorable at `p`, hence in the favorable filter

By F7 (`C4LA1.topRankSelectorCollapse`, using only `hyp-tree`, `hyp-alpha`,
and that `v` is a leaf — `hyp-residual` is not needed for this step),
`a_v = Delta_p(G - v) < 0` for every original leaf `v`. Hence `F = L`: the
favorable filter used in the general literal definition of `S(G,p)` collapses
to exactly the leaf set. (This is the composition step named by the
synthesis: "F7 discharges exactly the `F = leafSet` step, so the favorable
set never enters as an assumption.")

### Step 2 — the leaf-deletion bijection: `i_p(H_v) = M`

Fix a leaf `v` with unique support `s_v`. By `hyp-residual`, every maximum
independent set of `G` contains `v` (hence avoids `s_v`, since `v` and `s_v`
are adjacent and independent sets contain at most one endpoint of an edge).

Consider the map "delete `v`" from maximum independent sets of `G` to
independent `p`-subsets of `H_v = G - {v, s_v}`:

- **Well-defined**: if `S` is independent, `|S| = a`, `v in S`, then `S - v`
  is independent, has cardinality `p = a - 1`, avoids `v` (removed) and
  avoids `s_v` (since `S` is independent and `v in S`, `s_v ∉ S`, so
  `s_v ∉ S - v` either), hence `S - v` is an independent `p`-subset of `H_v`.
- **Injective**: distinct maximum independent sets containing `v` remain
  distinct after removing the same element `v`.
- **Surjective onto `I_p(H_v)`**: given any independent `p`-subset `A` of
  `H_v` (so `A` avoids `v` and `s_v`), `A ∪ {v}` is independent (nothing in
  `A` is adjacent to `v`, because `v`'s only neighbour is `s_v ∉ A`), has
  cardinality `a`, hence is a maximum independent set of `G`; by
  `hyp-residual` it contains `v`, consistent with construction; deleting `v`
  from it recovers `A`.

Since every maximum independent set of `G` contains `v` (again by
`hyp-residual`), this "delete `v`" map is a bijection between ALL maximum
independent sets of `G` (there are exactly `M = i_a(G)` of them) and
`I_p(H_v)`. Hence `i_p(H_v) = M`.

### Step 3 — the residual vanishing: `i_p(R_v) = 0`

Suppose toward a contradiction that `A` is an independent `p`-subset of
`R_v = G - N_G[s_v]` (so `A` avoids `s_v` and every neighbour of `s_v`,
including `v`). Then `A ∪ {s_v}` is independent: no element of `A` is
adjacent to `s_v` (all such elements were deleted with `N_G[s_v]`), and `A`
itself is independent. Its cardinality is `a`, so `A ∪ {s_v}` is a maximum
independent set of `G`. By `hyp-residual`, it must contain the leaf `v`. But
`v ∉ A` (since `A ⊆ V - N_G[s_v]` and `v ∈ N_G[s_v]`), and `v ≠ s_v` (a leaf
is not its own support, since `G` is simple and loopless), so
`v ∉ A ∪ {s_v}` — contradiction. Hence no such `A` exists: `i_p(R_v) = 0`.

### Step 4 — the per-leaf summand identity

By definition (using the literal summand formula with `p' = p - 1` the
one-lower rank, matching the SEMANTIC-CONTRACT's `b_v = Delta_{p-1}(H_v)`,
`B_v = Delta_{p-1}(R_v)`):

```text
b_v - B_v
  = Delta_{p-1}(H_v) - Delta_{p-1}(R_v)
  = (i_p(H_v) - i_{p-1}(H_v)) - (i_p(R_v) - i_{p-1}(R_v))
  = (M - i_{p-1}(H_v)) - (0 - i_{p-1}(R_v))      [Steps 2-3]
  = M - i_{p-1}(H_v) + i_{p-1}(R_v).
```

This is exactly `g_v(G,p)` of formula `(1)` in the source capsule.

### Step 5 — double counting, first sum

Claim: `sum_{v in L} i_{p-1}(H_v) = sum_{B in I_p(G)} |B ∩ L|`.

Consider pairs `(v, C)` with `v ∈ L` and `C` an independent `(p-1)`-subset of
`H_v`. Map each such pair to `B = C ∪ {v}`. This `B` is an independent
`p`-subset of `G` containing `v` (the same argument as Step 2's
well-definedness: `C` avoids `v` and `s_v`, so `C ∪ {v}` is independent of
size `p`), i.e. `B ∈ I_p(G)` with `v ∈ B ∩ L`.

Conversely, given `B ∈ I_p(G)` and a leaf `v ∈ B ∩ L`, then `s_v ∉ B` (`B`
independent, `v ∈ B`, `v` adjacent to `s_v`), so `B - v` is an independent
`(p-1)`-subset of `H_v = G - {v, s_v}`, giving back a pair `(v, B - v)`.

These two maps are mutually inverse (`(B - v) ∪ {v} = B` since `v ∈ B`; and
`(C ∪ {v}) - v = C` since `v ∉ C`), so counting the pairs two ways gives
`sum_{v in L} i_{p-1}(H_v) = |{(v,B) : B ∈ I_p(G), v ∈ B ∩ L}|
= sum_{B in I_p(G)} |B ∩ L|` (via `Finset.card_eq_sum_ones` /
`Finset.sum_boole` style double counting, e.g. by `Finset.sum_comm` on the
indicator of `v ∈ B` summed first over `v ∈ L ∩ B` then reorganized).

### Step 6 — double counting, second sum

Claim: `sum_{v in L} i_{p-1}(R_v) = sum_{B in I_p(G)} sum_{s in B} lambda(s)`.

Consider pairs `(v, C)` with `v ∈ L` and `C` an independent `(p-1)`-subset of
`R_v = G - N_G[s_v]`. Map each such pair to `B = C ∪ {s_v}`. As in Step 3,
`B` is an independent `p`-subset of `G` (since `C` avoids `N_G[s_v]`, nothing
in `C` is adjacent to `s_v`); `s_v ∈ B` and `v` is a leaf neighbour of
`s_v ∈ B`.

Conversely, for `B ∈ I_p(G)` and `s ∈ B`, each leaf `v` of `G` adjacent to
`s` (there are `lambda(s)` of them) gives a pair `(v, B - s)`: `B - s` avoids
`N_G[s]` because `B` is independent (no element of `B` other than `s` is
adjacent to `s`) and `s ∉ B - s`, and `B - s` has cardinality `p - 1`, so
`B - s ∈ I_{p-1}(R_v)`.

Summing the indicator that `s ∈ B` and `v` is a leaf neighbour of `s`, over
all `(v, s)` incident leaf-support pairs with `v ∈ L`, in two different
orders (`v` first vs. `s` then `B` then `v`) gives the claimed identity: the
left side groups by leaf `v` (giving `i_{p-1}(R_v)` for each `v` after
undoing the `∪{s_v}` bijection), the right side groups by `B` then by
`s ∈ B` then by leaf-neighbour count `lambda(s)` of `s`. This is a
`Finset.sum_comm`-style reindexing of the same doubly-indexed finite sum
(`Finset.sum_sigma'` / `Finset.sum_biUnion` over the disjoint per-leaf fibers
`{v} × I_{p-1}(R_v)`).

### Step 7 — summation

By Step 1, `F = L`, so `S(G,p) = sum_{v in L} (b_v - B_v)`. Substituting Step
4's per-leaf identity and summing over `L`:

```text
S(G,p) = sum_{v in L} (M - i_{p-1}(H_v) + i_{p-1}(R_v))
       = ell*M - sum_{v in L} i_{p-1}(H_v) + sum_{v in L} i_{p-1}(R_v)
       = ell*M - sum_{B in I_p(G)} |B ∩ L| + sum_{B in I_p(G)} sum_{s in B} lambda(s)
       = ell*M - sum_{B in I_p(G)} ( |B ∩ L| - sum_{s in B} lambda(s) ),
```

using Steps 5 and 6 and that `Int` subtraction distributes over the finite
sums (`Finset.sum_sub_distrib`). This is exactly the awarded equality
`(RI)` composed with the F7 collapse. `hyp-eligible` is not used anywhere in
this derivation; it is retained in the statement only because the terminal
declaration must carry it (see the controller ruling above).

## Awarded dependency DAG

```text
finite tree + independence number + leaf/support structure
  -> F7 topRankSelectorCollapse (every leaf favorable at p = alpha-1)  [reused, digest-bound]
  -> F = leafSet at p                                                  [Step 1]
  -> residual hypothesis: every leaf in every maximum independent set
  -> leaf-deletion bijection: i_p(H_v) = M                             [Step 2]
  -> support-deletion vanishing: i_p(R_v) = 0                          [Step 3]
  -> per-leaf summand b_v - B_v = M - i_{p-1}(H_v) + i_{p-1}(R_v)      [Step 4]
  -> double count 1: sum_v i_{p-1}(H_v) = sum_B |B ∩ L|                [Step 5]
  -> double count 2: sum_v i_{p-1}(R_v) = sum_B sum_{s in B} lambda(s) [Step 6]
  -> summation over F = L gives (RI) composed with F7                 [Step 7]
```

## Remaining gates

The formalizer may prepare and kernel-check the exact declaration.
Independent informal review, independent fidelity review, and workflow
closeout remain unperformed by instruction (controller-owned).
