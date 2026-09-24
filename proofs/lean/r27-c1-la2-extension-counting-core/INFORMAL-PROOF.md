# Informal proof — `C1-LA2`, the unconditional counting core (r27 Cycle 1 Stage 7)

Run root: `runs/lean-2026-09-25-c1-la2-extension-counting-core`.
Producer: `c1-la2-formalizer-opus-20260925` (governed formalizer seat; Claude Opus 5, chartered effort
high — the seat cannot self-inspect its runtime model or effort setting and states this on
dispatch-record authority).
Statement of record: `cycles/cycle-1/stage6/SYNTHESIS.md`, `## Lean awards`, Decision 2, `C1-LA2`.

This document is the statement-level informal proof that the Lean development discharges. It is not an
independent proof-integrity audit and it makes no verification claim.

---

## 1. What is proved, and what is not

Two graph-general statements about a **finite simple graph** `G` on a vertex type `X`:

```lean
lemma Erdos993G1.double_count {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) :
    ((k : ℤ) + 1) * Erdos993G1.indepCount G (k + 1) = ∑ J ∈ G.indepSetFinset k, (Erdos993G1.e G J : ℤ)

theorem Erdos993G1.e_ge_sub {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) {J : Finset X} (hJ : G.IsNIndepSet k J) :
    (Erdos993G1.e G J : ℤ) ≥ (Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ)
```

Informally: `(k+1)·i_{k+1}(G) = Σ_{J ∈ I_k(G)} e(J)`, and `e(J) ≥ n − k − Σ_{v ∈ J} deg(v)` for every
independent `k`-set `J`, where `n = |X|`, `I_k(G)` is the set of independent `k`-subsets, `i_k(G)` its
count, and `e(J) = |V ∖ N[J]|` is the number of vertices that extend `J` to an independent `(k+1)`-set.

**Excluded conclusions (synthesis `## Lean awards`, `C1-LA2`; `SOLUTION-CONTRACT.md` §3).**

1. These are **graph-general** facts. Neither is a forest statement. Neither transfers any status to
   `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, the all-rank
   aggregate, `E993-BETA-AGG`, or Erdős #993.
2. Neither is evidence for (DL) or (EX) beyond "the bridge is built". (DL) is **not** proved here and is
   not used here. (EX) is **not** proved here.
3. Nothing asymptotic, no `N₀`, no unimodality claim, no Tier 1 of r25.
4. No pointwise degree statement is registered (fence §3.3 concerns (DL) and is not touched here).
5. The optional identity `e(J) = n − k − Σ deg + exc(J)` (`C-T3-U`, STATED) was **not** compiled. It is
   STATED and owes its own second read before registration; the brief made it discretionary and this
   seat declined it to keep the award face to the two statements of record.

---

## 2. Definitions

Three are the **G1 definitions of record**, registered byte-identically from the frozen r25 award source
(`sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean`, SHA-256
`736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0`) and **not re-stated**:

| `lean_name` | Meaning |
|---|---|
| `Erdos993G1.indepCount G k` | `i_k(G) := (Nat.card {S : Finset V // G.IsNIndepSet k S} : ℤ)` |
| `Erdos993G1.coeff G (k : ℤ)` | integer-indexed zero extension of `indepCount` |
| `Erdos993G1.delta G (k : ℤ)` | `Δ_k(G) := coeff G (k+1) − coeff G k` |

Five are this run's own definitions:

```lean
def closedNbhdFinset (J : Finset X) : Finset X :=
  J ∪ J.biUnion (fun u => G.neighborFinset u)

def extensionFinset (J : Finset X) : Finset X :=
  Finset.univ \ closedNbhdFinset G J

def e (J : Finset X) : ℕ := (extensionFinset G J).card

def indepDegreeSum (k : ℕ) : ℕ :=
  ∑ J ∈ G.indepSetFinset k, ∑ v ∈ J, G.degree v

noncomputable
def firstDescent {X : Type u} [Finite X] (G : SimpleGraph X) : ℕ :=
  sInf {k : ℕ | Erdos993G1.delta G (k : ℤ) < 0}
```

`closedNbhdFinset G J` is `N[J]`; `extensionFinset G J` is `V ∖ N[J]`; `e G J` is `|V ∖ N[J]|`, U3's
definition of record for the extension count and the one the synthesis's award face names.

`indepDegreeSum` (`D_k`) and `firstDescent` (`x(G)`) are carried in the definition layer because the
brief's condition R3 requires them in the contract by exact `lean_name`. **Neither is used by any
declaration of this award**, and nothing is claimed about either beyond the definition itself.
`firstDescent` is authored in-run rather than carried: U3's form is `Nat.find` applied to an existence
lemma, and the registrar forbids a `definition` entry after a `lemma` entry, so the same object is
written as the infimum of the set of strict descents. On `ℕ` that infimum **is** `Nat.find` applied to a
nonemptiness proof (`Nat.sInf_def`), which is the form `SEMANTIC-CONTRACT.md` §1 names; when the descent
set is empty `sInf` returns `0` by the `ℕ` convention, a case that never arises for a finite graph
(`Δ_α = −i_α < 0`) but about which this award proves nothing.

---

## 3. Hypothesis ledger — where each hypothesis enters

| Hypothesis | Where it enters | Role |
|---|---|---|
| `[Fintype X]` | everywhere | `Finset.univ` in `extensionFinset`; `Fintype.card X`; `G.indepSetFinset`; `G.neighborFinset` |
| `[DecidableEq X]` | everywhere | `Finset` union, `\`, `insert`, `erase`, `biUnion` |
| `[DecidableRel G.Adj]` | everywhere | `G.neighborFinset`, `G.degree`, `G.indepSetFinset` |
| `hJ : G.IsNIndepSet k J` | **once**, in `e_ge_sub` | used **only** through `hJ.card_eq : J.card = k` |
| `G.IsAcyclic` | **nowhere** | see below |

**Finiteness is everywhere**, as three instance binders and never as a hypothesis on `G`. All statements
are universe-polymorphic in `u` and are stated **with instance binders**, not at one fixed `Fintype`
instance (`C-U3-F`'s caveat, load-bearing for free composition with the compiled chain).

**Acyclicity enters exactly zero times.** The brief's R5 phrasing ("acyclicity enters exactly once,
through (DL)") is the run-wide ledger convention; for `C1-LA2` there is no (DL) node and no forest
hypothesis. No `hG : G.IsAcyclic` binder appears on either statement or in any supporting declaration;
per the synthesis a stray acyclicity binder on either statement is struck at fidelity review. There is
likewise no `(★)` hypothesis, no `hyp-alpha`, and no `α(G)` side condition.

**One honest strengthening that the statement does not claim.** The proof of `e_ge_sub` uses only
`J.card = k`; the independence half of `hJ` is never used, so the inequality in fact holds for every
`k`-element `J`. The award face keeps `hJ` because that is the statement of record; nothing stronger is
registered, and the fidelity reviewer should read `hJ` as a hypothesis that is present and sound, not as
one that is load-bearing.

---

## 4. The double count, statement by statement

Let `I_k := G.indepSetFinset k` and `ext(J) := extensionFinset G J`.

**(1) `mem_extensionFinset_iff` — `v ∈ ext(J) ↔ v ∉ J ∧ ∀ u ∈ J, ¬ G.Adj v u`.**
Unfold `ext(J) = univ \ (J ∪ ⋃_{u ∈ J} N(u))`. Membership in the complement says `v ∉ J` and `v` is in no
`N(u)` for `u ∈ J`, i.e. `¬ G.Adj u v` for all `u ∈ J`; `G.adj_comm` converts that to `¬ G.Adj v u`. No
finiteness or independence input beyond the instance binders.

**(2) `isNIndepSet_insert_of_mem_extensionFinset` — `J ∈ I_k`, `v ∈ ext(J)` ⟹ `insert v J ∈ I_{k+1}`.**
Independence: `↑J` is pairwise non-adjacent, and by (1) `v` is adjacent to no member of `J` in either
direction, so `Set.Pairwise.insert_of_notMem` gives pairwise non-adjacency of `insert v ↑J`. Cardinality:
`v ∉ J` so `card_insert_of_notMem` and `hJ.card_eq` give `k + 1`.

**(3) `isNIndepSet_erase_and_mem_extensionFinset` — `J' ∈ I_{k+1}`, `u ∈ J'` ⟹ `J'.erase u ∈ I_k` and
`u ∈ ext(J'.erase u)`.**
Independence is inherited by a subset (`Set.Pairwise.mono`). Cardinality: `card_erase_of_mem` with
`hJ'.card_eq`. Extension: `u ∉ J'.erase u`, and any `w ∈ J'.erase u` is a distinct member of the
independent `J'`, hence not adjacent to `u`.

**(4) `sigma_card_double_count` — `|Σ_{J ∈ I_k} ext(J)| = |Σ_{J' ∈ I_{k+1}} J'|`.**
`Finset.card_bij'` with the mutually inverse maps

  `(J, v) ↦ (insert v J, v)` and `(J', u) ↦ (J'.erase u, u)`.

The four obligations are: well-definedness forward (statement (2), plus `v ∈ insert v J`);
well-definedness backward (statement (3)); left inverse `(insert v J).erase v = J` by `erase_insert`
using `v ∉ J`; right inverse `insert u (J'.erase u) = J'` by `insert_erase` using `u ∈ J'`. This is the
bijection the synthesis's `## 4. Proof architecture` names.

**(5) `sum_card_indepSetFinset_succ` — `Σ_{J' ∈ I_{k+1}} |J'| = (k+1)·|I_{k+1}|`.**
Every member of `I_{k+1}` has cardinality `k+1`; `Finset.sum_const`.

**(6) `sum_e_eq_succ_mul_card` (in `ℕ`) — `Σ_{J ∈ I_k} e(J) = (k+1)·|I_{k+1}|`.**
`Finset.card_sigma` rewrites both sides of (4) as sums of cardinalities: the left side is
`Σ_{J ∈ I_k} |ext(J)| = Σ_{J ∈ I_k} e(J)` by definition of `e` (`rfl`), the right side is
`Σ_{J' ∈ I_{k+1}} |J'|`; then (5).

**(7) `double_count` (in `ℤ`) — `(k+1)·i_{k+1}(G) = Σ_{J ∈ I_k} (e(J) : ℤ)`.**
`Erdos993G1.indepCount_eq_card_indepSetFinset` (r25 registrar entry 4, carried byte-identically) bridges
the `Nat.card`-of-a-subtype definition of `indepCount` to `((I_{k+1}).card : ℤ)`. Casting (6) into `ℤ`
and commuting the cast past the finite sum closes it.

This is the classical extension-method double count; on the external side it is
Fang–Lu–Nevo–Yao–Zheng 2026 §8 (8.1).

---

## 5. The extension lower bound, statement by statement

**(8) `card_closedNbhdFinset_le` — `|N[J]| ≤ |J| + Σ_{v ∈ J} deg(v)`.**
`|J ∪ B| ≤ |J| + |B|` (`Finset.card_union_le`) with `B = ⋃_{u ∈ J} N(u)`; then
`|⋃_{u ∈ J} N(u)| ≤ Σ_{v ∈ J} |N(v)|` (`Finset.card_biUnion_le`); then
`|N(v)| = deg(v)` (`SimpleGraph.card_neighborFinset_eq_degree`). Every vertex of `N[J] ∖ J` is a
neighbour of some `v ∈ J`, which is exactly what the union bound encodes.

**(9) `e_add_card_add_degreeSum_ge` (in `ℕ`, subtraction-free) — `e(J) + |J| + Σ_{v ∈ J} deg(v) ≥ n`.**
`N[J] ⊆ univ`, so `Finset.card_sdiff_add_card_eq_card` gives the exact split
`|ext(J)| + |N[J]| = |univ| = n`, i.e. `e(J) + |N[J]| = n`. Combine with (8) by `omega`.

**(10) `e_ge_sub` (in `ℤ`, terminal) — `e(J) ≥ n − k − Σ_{v ∈ J} deg(v)`.**
`hJ.card_eq` replaces `|J|` by `k` in (9); cast the resulting `ℕ` inequality into `ℤ`; `linarith`.

---

## 6. ℕ/ℤ cast audit

The award's two statements live in `ℤ`; every intermediate count lives in `ℕ`. The audit:

1. **No natural-number subtraction is ever performed.** Statement (9) is deliberately stated in the
   subtraction-free form `e(J) + |J| + Σ deg ≥ n` rather than `e(J) ≥ n − |J| − Σ deg`, and
   `Finset.card_sdiff_add_card_eq_card` is used in place of `Finset.card_sdiff` for the same reason. The
   subtraction in the award face appears only **after** the cast into `ℤ` (statement (10)), where it is
   ordinary ring subtraction. This is `SEMANTIC-CONTRACT.md` §4's load-bearing convention.
2. **The casts used are exactly `Nat.cast : ℕ → ℤ`,** which is an order-embedding ring hom: `push_cast` /
   `exact_mod_cast` move it across `+`, `*` and finite sums without loss, and `Nat.cast_le` /
   `Nat.cast_lt` transport the `ℕ` inequality of (9) to `ℤ` in both directions. No coercion truncates.
3. **`(∑ v ∈ J, G.degree v : ℤ)`** on the award face is the cast of the `ℕ`-valued sum; `push_cast`
   rewrites it to `∑ v ∈ J, (G.degree v : ℤ)` by `Nat.cast_sum`. The two readings agree, so the face
   text is unambiguous.
4. **`Erdos993G1.indepCount` is `ℤ`-valued by definition** (`(Nat.card … : ℤ)`), so no cast is introduced
   on the left-hand side of the double count; the only bridge is
   `indepCount_eq_card_indepSetFinset`, which is itself a carried r25 entry.
5. **`(k : ℤ)` and `(Fintype.card X : ℤ)`** are casts of `ℕ` literals/values and are nonnegative; no step
   depends on their sign, so no clamping hazard of the kind the synthesis flags for
   `2 − (G.degree v : ℤ)` on the (DL) route arises anywhere in this award.

---

## 7. Attribution (travels on every face)

- **Mathematics:** Fang, Lu, Nevo, Yao, Zheng, *Unimodality of Independence Polynomials for Sufficiently
  Large Forests*, arXiv:2609.20961v1 (17 September 2026), §8 — Lemma 8.1 / (8.1) and the displayed step
  of Proposition 8.2. The double count is classical ("the extension method").
- **Derivation in this run:** seat **U3** (`C1-U-03`), whose `Extension.lean` compiled both statements;
  independently re-derived by critic **`C-U1-T`** (`critic_double_count`, `critic_extensionCount_ge`,
  `critic_extensionCount_ge_int` in `C-U1-T-CriticAdvances.lean`); replayed by the **U adjudicator**.
- **G1 definitions of record:** the r25 award `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`.
- **No external Lean text is carried** (Gate ruling 3, fence §3.6). The external slice under
  `sources/external/lean-source/` is not a member of this seat's capsule and was not read. Every line of
  this run's project is either a byte-identical in-run carry (table below) or written by this seat.

---

## 8. Carry table (R2)

Registered fragments live at `LeanProject/LeanProof/Snippets/NNNN-<kind>-<name>.lean.fragment`.
"Body" means the declaration text; import lines and `namespace` / `variable` wrappers are not bodies.

| # | Kind | Declaration | Origin | Origin SHA-256 | Transport | Fragment SHA-256 |
|---|---|---|---|---|---|---|
| 1 | definition | `Erdos993G1.indepCount` | r25 award source, registrar entry 1 | `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0` | byte-identical; reproduces the original entry digest | `5484fc21ffce7bf707240da15858d7d82289f8e6f286a8fa9837cd9a0c474ccb` |
| 2 | definition | `Erdos993G1.coeff` | r25 award source, registrar entry 2 | same file | byte-identical; reproduces the original entry digest | `211900436b28e4a685af60df26a20e8fe254fd4c9479c12ba2863fa180c1a639` |
| 3 | definition | `Erdos993G1.delta` | r25 award source, registrar entry 3 | same file | byte-identical; reproduces the original entry digest | `bdb46014d98507a7c85cc8de0b806f80c04496479795e28677dde024e216b9ee` |
| 4 | definition | `Erdos993G1.closedNbhdFinset` | `U3-Extension.lean` L20–23 | `116b4f313eedfe4210173226c2f5ef877a6e1ee07061888f4106e908ba6b08a6` | body byte-identical | `cd7b02bbb9e1f54197bb4393f553dc9356c77804c15dc5eb7f07fe0792b1ddff` |
| 5 | definition | `Erdos993G1.extensionFinset` | `U3-Extension.lean` L25–28 | same file | body byte-identical | `98167bde3acb58689604d2b5d11f32e099963b6a6d847bef7d1e31c0232f5707` |
| 6 | definition | `Erdos993G1.e` | `U3-Extension.lean` L30–31 | same file | body byte-identical | `c3576e8aafb3ad1ecac91b193eb2ece93cade71ee367c2f0f18a8ac166e51481` |
| 7 | definition | `Erdos993G1.indepDegreeSum` | `U3-Extension.lean` L33–35 | same file | body byte-identical | `54bedd8a2a64d672f14837e8e96231d575a7b9cd93a42453130a3fa1d04bc9ec` |
| 8 | definition | `Erdos993G1.firstDescent` | **authored in-run** (re-derivation; see §2) | — | re-derived | `0ccd1036c077f1c40df3a2c1e2260b25f49f65a6fde2063d2bdd96fce103ec8d` |
| 9 | lemma | `Erdos993G1.indepCount_eq_card_indepSetFinset` | r25 award source, registrar entry 4 | `736eb9df…dfe0` | byte-identical; reproduces the original entry digest | `4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac` |
| 10 | lemma | `Erdos993G1.mem_extensionFinset_iff` | `U3-Extension.lean` L43–54 | `116b4f31…b08a6` | body byte-identical | `b2b5d06c64d10d0251bffd5e17b2fdaa18b46804b1e7b35bb0b1078cf6d56fc1` |
| 11 | lemma | `Erdos993G1.isNIndepSet_insert_of_mem_extensionFinset` | `U3-Extension.lean` L56–73 | same file | body byte-identical | `29cadf3157ff850df750399b7c20b73ad0c0fc573cadb41246d50937c8988c9f` |
| 12 | lemma | `Erdos993G1.isNIndepSet_erase_and_mem_extensionFinset` | `U3-Extension.lean` L75–96 | same file | body byte-identical | `f272e215c6c3ff23ea45de1cb4d97fd46e6a5e5846872f99733556e6a54a9667` |
| 13 | lemma | `Erdos993G1.sigma_card_double_count` | `U3-Extension.lean` L104–131 | same file | body byte-identical **except** the declaration keyword `theorem → lemma` (re-derivation, §9) | `4890fab635992e65b4f611b740729d4cf26554eb3874d3fa68d3bba224bb63cb` |
| 14 | lemma | `Erdos993G1.sum_card_indepSetFinset_succ` | `U3-Extension.lean` L133–139 | same file | as row 13 | `f2e5389c2b1a7df187b58422d6f56be5fd12943ebf9ce709b78bc4294264b728` |
| 15 | lemma | `Erdos993G1.sum_e_eq_succ_mul_card` | `U3-Extension.lean` L141–151 | same file | as row 13 | `16966da037614ae543e50d10e19aa30152f9991cc8d0cce7ea982bb0481a75a9` |
| 16 | lemma | `Erdos993G1.double_count` | statement re-stated in-run from the synthesis `## Lean awards`; proof body `U3-Extension.lean` L157–165 byte-identical | same file | award face re-stated (explicit binders), proof body byte-identical | `f123431dbbf223ed714d031ab21d11dfc85c45c362794f02bf001ff352a24351` |
| 17 | lemma | `Erdos993G1.card_closedNbhdFinset_le` | `U3-Extension.lean` L173–185 | same file | as row 13 | `1872734f778eec5c7536cef4e49d7302e263d312120b5a1152b492b4ea9cb325` |
| 18 | lemma | `Erdos993G1.e_add_card_add_degreeSum_ge` | `U3-Extension.lean` L187–197 | same file | as row 13 | `ef02ff2f0e526b6afd3d5ff092f776491b3c0b1a30041a399050aa8b2548e720` |
| 19 | theorem | `Erdos993G1.e_ge_sub` | statement re-stated in-run from the synthesis `## Lean awards`; proof body `U3-Extension.lean` L203–208 byte-identical | same file | award face re-stated (explicit binders), proof body byte-identical | `e3eec15eac5c8e9b6de24a81537a8daeb7e6a39e2e96a1058f29d28d1f602a09` |

Rows 4–7 and 10–19 are **seat-attributed to U3** (carry-list row 9, the U adjudicator's authority).
This award carries **no** critic-attributed row 10–16 body and **no** adjudicator-attributed row 17–19
body: `C-U1-T`'s file (carry-list row 10) is cited as the independent re-derivation and is **not**
carried. Row 8 of the synthesis carry list (U2's `R27DegreeLemma`) is **not** carried, so the three
mandatory renames (`indepFinsets → r27IndepFinsets` with the body re-expressed,
`mem_indepFinsets → mem_r27IndepFinsets`, `degOn → r27DegreeIn`) have no application here; no identifier
of this award appears in that coincidence list.

## 9. Adaptations recorded as re-derivations

1. **`theorem → lemma` on rows 13, 14, 15, 17, 18.** The registrar admits exactly one terminal
   `theorem` and orders `definition < lemma < theorem`, and its source check matches the Lean keyword
   against the registered kind. In Lean 4 `lemma` is a synonym for `theorem` with identical elaboration,
   so the change is purely lexical; it is nonetheless recorded here as a declaration-level
   re-derivation, not as a byte-identical carry.
2. **`namespace` / `variable` wrappers.** Each fragment is self-contained: `namespace Erdos993G1 … end
   Erdos993G1` plus U3's own section `variable` line, reproduced verbatim
   (`variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]` for the
   definition layer, with `{G : SimpleGraph X}` implicit for the lemma layer). Per R2 these are not
   bodies. `universe u` is declared once, inside r25 registrar entry 1, exactly as in the r25 source.
3. **Award faces (rows 16, 19) re-stated with explicit binders.** U3 stated both through section
   `variable`s with `G` implicit; the synthesis's statements of record have `G` **explicit**. The faces
   are therefore written out in full so that the source text is exactly the synthesis's statement
   (namespace-relative). The proof bodies are byte-identical to U3's.
4. **`firstDescent` authored in-run**, as recorded in §2.
