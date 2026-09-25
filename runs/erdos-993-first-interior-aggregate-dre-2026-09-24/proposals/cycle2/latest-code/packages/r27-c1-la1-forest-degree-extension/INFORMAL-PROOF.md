# Informal proof of record — `C1-LA1` (DL) + (EX)

Run: `runs/lean-2026-09-25-c1-la1-forest-degree-extension`.
Producer: `c1-la1-formalizer-opus-20260925` (governed formalizer seat, Claude Opus 5, chartered effort high;
the seat cannot self-inspect its runtime model or effort setting — model and effort are stated on
dispatch-record authority).
Route followed: **the primary (injection) route of synthesis Decision 1**. The fallback was not taken; see
§9.

Attribution, on this face and on every award face:

- **Mathematics of (DL) and (EX):** Fang–Lu–Nevo–Yao–Zheng, *Unimodality of Independence Polynomials for
  Sufficiently Large Forests*, arXiv:2609.20961v1 (17 September 2026), §8 — Lemma 8.1 with its consequence
  (8.3), and the displayed step inside the proof of Proposition 8.2.
- **Injection derivation of the root-corrected lemma:** critic `C-F1-T` (r27 Cycle 1), sustained line by line
  by the F adjudication.
- **The compiled (EX) step** (the double count and the per-set extension bound): seat `U3`, independently
  re-derived by `C-U1-T`, replayed by the U adjudicator.
- **G1 definitions of record:** the r25 award `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`.

No external Lean text was read or carried by this seat (Gate ruling 3): `sources/external/lean-source/` was
never opened. Every declaration of this run is authored in-run or carried from an in-run source named in §8.

---

## 1. Objects

`X` is a finite type with decidable equality; `G : SimpleGraph X` has decidable adjacency; `n := Fintype.card X`.

- `I_k(G)` — the finset `G.indepSetFinset k` of independent `k`-subsets of `X` (Mathlib).
- `i_k(G)` — `Erdos993G1.indepCount G k : ℤ`, the G1 definition of record, equal to `#I_k(G)` cast to `ℤ`
  (`Erdos993G1.indepCount_eq_card_indepSetFinset`, r25 entry 4).
- `D_k(G)` — `Erdos993G1.indepDegreeSum G k : ℕ` `= Σ_{J ∈ I_k} Σ_{v ∈ J} deg_G(v)` (U3's definition of
  record; adjudicator row 19 proves U1's and U3's texts definitionally equal by `rfl`).
- `e(J)` — `Erdos993G1.e G J : ℕ`, the number of vertices outside the closed neighbourhood of `J`.

## 2. The two statements proved

**(DL) `Erdos993G1.forest_degree_lemma`.** For every finite `X`, every `G : SimpleGraph X` with
`hG : G.IsAcyclic`, and every `k : ℕ`:

    (D_k(G) : ℤ) ≤ 2 * k * i_k(G).

**(EX) `Erdos993G1.forest_extension_inequality`** (terminal). Under the same hypotheses:

    (n : ℤ) * i_k(G) ≤ (k + 1) * i_{k+1}(G) + 3 * k * i_k(G).

Hypotheses consumed: **acyclicity and finiteness only.** There is no `α`/`indepNum` side condition, no
`(★)` hypothesis, and no lower bound on `k` or on `n`. Both are stated with instance binders
(`[Fintype X] [DecidableEq X] [DecidableRel G.Adj]`), never at one fixed `Fintype` instance
(`C-U3-F`'s caveat).

## 3. The rooting API (where acyclicity enters, use 1)

For each vertex `v`, `rootRep G v := (G.connectedComponentMk v).out` is a vertex of `v`'s component that
depends only on the component; `rootPath G v` is a path from `v` to `rootRep G v` (it exists because `v`
reaches its own component's representative); `par G v := (rootPath G v).snd`, and `rk G v :=
(rootPath G v).length`. A vertex is a **root** exactly when `par G v = v`, which happens exactly when its
root path is trivial. **The rooting is one root per connected component**, chosen by `rootRep`; the roots
are exactly the fixed points of `par`.

- `rootPath_isPath` — the root path is a path. *(no acyclicity)*
- `rootRep_eq_of_adj` — adjacent vertices have the same component representative. *(no acyclicity)*
- `par_eq_self_of_nil`, `not_nil_rootPath_of_par_ne`, `adj_par` — if `par G v ≠ v` then `G.Adj v (par G v)`.
  *(no acyclicity)*
- **`rootPath_unique`** — *acyclicity, use 1.* Any path from `v` to `rootRep G v` **is** `rootPath G v`
  (`SimpleGraph.IsAcyclic.path_unique`), hence has its length and its second vertex. The endpoint is a bound
  variable of the lemma, so the lemma also applies to a walk typed at a propositionally-equal root; this is
  what lets the two paths of §3's arguments be compared without a transport.

From `rootPath_unique` follow, with no further use of acyclicity:

- **`par_or`** — *the neighbourhood decomposition.* If `G.Adj u v` then `par G u = v` or `par G v = u`.
  *Proof.* If `u` lies on `rootPath G v`, then `SimpleGraph.IsAcyclic.eq_snd_of_adj_start` gives
  `u = (rootPath G v).snd = par G v`. Otherwise `cons (G.Adj u v) (rootPath G v)` is a path from `u` to
  `rootRep G v = rootRep G u`, so by `rootPath_unique` its second vertex `v` is `par G u`. ∎
  Equivalently: `N(v) = {par v} ∪ children(v)`, and every edge is a parent edge.
- **`rk_par_lt`** — if `par G v ≠ v` then `rk G (par G v) < rk G v`: the tail of `rootPath G v` is a path from
  `par G v` to the same root, so by `rootPath_unique` its length is `rk G (par G v)`, and it is one shorter.
- **`par_par_ne`** — *no two-cycles:* if `par G u ≠ u` then `par G (par G u) ≠ u`. Immediate from `rk_par_lt`
  applied twice.

`par_par_ne` is a **third, separately named use of the rooted acyclic structure**, distinct from the two
uses named in the F adjudication (the edge ↔ non-root correspondence and the neighbourhood decomposition).
It is exactly the step that makes "`J` independent forces `p(p(u)) ∉ J`, hence `p(p(u)) ∉ K`" valid, because
`K = (J ∖ {p(u)}) ∪ {u}` always contains `u`, so ruling out `p(p(u)) ∈ K` requires `p(p(u)) ≠ u` as well as
`p(p(u)) ∉ J`. In this development that obligation is discharged by the strictly decreasing rank `rk`, and
the lemma is named.

## 4. The degree decomposition (where acyclicity enters, use 2)

`childrenFinset G v := {u | par G u = v ∧ par G u ≠ u}`.

- `neighborFinset_eq_of_root` (`par G v = v`): `N(v) = children(v)`. *(uses `par_or`)*
- `neighborFinset_eq_of_nonroot` (`par G v ≠ v`): `N(v) = insert (par G v) (children(v))`, and
  `par_notMem_childrenFinset` (which uses `par_par_ne`) shows `par G v ∉ children(v)`, so the union is
  disjoint.
- **`degree_eq_card_childrenFinset_add`**: `deg(v) = #children(v) + (if par G v = v then 0 else 1)`.

This is an exact decomposition of the degree, in `ℕ`, with no subtraction.

## 5. The incidence split of `D_k`

Three finsets of pairs, all sub-finsets of `Σ (J : Finset X), X`:

- `upPairs G k` — `(J, v)` with `J ∈ I_k`, `v ∈ J`, `par G v ≠ v` ("`v ∈ J` charged to the edge `{v, par v}`").
- `downPairs G k` — `(J, u)` with `J ∈ I_k`, `par G u ≠ u`, `par G u ∈ J` ("`par u ∈ J` charged to the edge
  `{u, par u}`"). Note `u ∉ J` automatically (`notMem_of_par_mem`: `u` and `par u` are adjacent and `J` is
  independent).
- `rootPairs G k` — `(J, r)` with `J ∈ I_k`, `r ∈ J`, `par G r = r`. **This is the root-correction term, and
  it carries multiplicity across components**: it counts every pair of an independent `k`-set with a root of
  any component lying in it, so a set meeting `c` component-roots contributes `c`.

- **`sum_card_childrenFinset`**: `Σ_{v ∈ J} #children(v) = #{u | par G u ≠ u ∧ par G u ∈ J}`, because the
  child sets of distinct vertices are disjoint (fibrewise counting along `par`).
- **`card_downPairs_add_card_upPairs`**: `#downPairs + #upPairs = D_k`. Summing §4 over `v ∈ J` and then
  over `J ∈ I_k` splits `D_k` into the down incidences (the `#children` part) and the up incidences (the
  `0/1` part).
- **`card_upPairs_add_card_rootPairs`**: `#upPairs + #rootPairs = k · #I_k`, since for each `J ∈ I_k` the
  root and non-root members partition `J` and `#J = k`.

## 6. The injection (`#downPairs ≤ #upPairs`)

`swapMap G ⟨J, u⟩` is defined for every pair, by one case split:

    if  {c ∈ J | par G c = u}  is nonempty   then   ⟨J, (that set's chosen element)⟩      -- child branch
    else                                            ⟨insert u (J.erase (par G u)), u⟩     -- swap branch

**Well-definedness into `upPairs` (`swapMap_mem_upPairs`).** Let `⟨J, u⟩ ∈ downPairs`, `w := par G u ∈ J`,
`u ∉ J`.

- *Child branch.* The chosen `c` lies in `J` and has `par G c = u`. If `par G c = c` then `u = c ∈ J`,
  contradicting `u ∉ J`; so `par G c ≠ c` and `⟨J, c⟩ ∈ upPairs`.
- *Swap branch.* Set `S := insert u (J.erase w)`. If `x ∈ J`, `x ≠ w` and `G.Adj u x`, then `par_or` gives
  `par G u = x` (impossible, `par G u = w ≠ x`) or `par G x = u`, which puts `x` in the branch's filter and
  contradicts the branch condition. Hence `u` has no neighbour in `J.erase w`, and `J.erase w` is
  independent as a subset of `J`; so `S` is independent. Since `w ∈ J`, `#J = k ≥ 1`, and `u ∉ J.erase w`,
  we get `#S = (k − 1) + 1 = k`. Finally `u ∈ S` and `par G u ≠ u`, so `⟨S, u⟩ ∈ upPairs`.

**The separating invariant, two-sided.** For an image pair `⟨K, y⟩`:

- *Child branch* (`swapMap_grandparent_pos`): `par G (par G y) = par G u = w ∈ J = K`, so the grandparent
  **is** in the image's set.
- *Swap branch* (`swapMap_grandparent_neg`): `y = u`, `K = insert u (J.erase w)`, and `par G (par G u) ∉ K`.
  Indeed `par G (par G u) ≠ u` by **`par_par_ne`** (this is the third use of the acyclic structure, §3), and
  if `par G (par G u) ∈ J.erase w` then it lies in `J`, differs from `w ∈ J`, and is adjacent to `w`
  (`adj_par`), contradicting independence of `J`.

So an image pair comes from the child branch **iff** its grandparent lies in its set, which is a property of
the image alone. The two branches therefore have disjoint images.

**Injectivity (`swapMap_injOn`).**

- Child/child: `⟨J₁, c₁⟩ = ⟨J₂, c₂⟩` gives `J₁ = J₂` and `c₁ = c₂`, hence `u₁ = par G c₁ = par G c₂ = u₂`.
- Swap/swap: `⟨S₁, u₁⟩ = ⟨S₂, u₂⟩` gives `u₁ = u₂ =: u` and `S₁ = S₂`; erasing `u` recovers
  `J₁.erase (par G u) = J₂.erase (par G u)` (using `u ∉ J_i`), and re-inserting `par G u ∈ J_i` recovers
  `J₁ = J₂`.
- Mixed: excluded by the invariant above.

Hence **`card_downPairs_le_card_upPairs`**: `#downPairs ≤ #upPairs`
(`Finset.card_le_card_of_injOn`).

## 7. Assembly (additive, no `ℕ`-subtraction anywhere)

**(RC), `forest_root_corrected_degree_bound`** — the root-corrected degree lemma, in incidence form:

    D_k + 2 · #rootPairs ≤ 2 · (k · #I_k).

*Proof.* `D_k = #downPairs + #upPairs ≤ 2 · #upPairs ≤ 2 · (#upPairs + #rootPairs) − 2 · #rootPairs`; in the
additive form actually used, `D_k + 2·#rootPairs ≤ 2·#upPairs + 2·#rootPairs = 2·(#upPairs + #rootPairs) =
2·(k·#I_k)`. Every step is an addition or a comparison of naturals; nothing is subtracted in `ℕ`. ∎

**(DL) at the `ℕ` level, `forest_degree_lemma_nat`**: drop the nonnegative term `2·#rootPairs`, giving
`D_k ≤ 2·k·#I_k`.

**(DL), `forest_degree_lemma`**: cast. `i_k = (#I_k : ℤ)` by r25 entry 4, and the `ℕ` inequality transports
to `ℤ` by `exact_mod_cast`.

**(EX), `forest_extension_inequality`** (terminal). Two unconditional ingredients, neither of which uses
acyclicity:

- `double_count` (U3): `((k : ℤ) + 1) * i_{k+1} = Σ_{J ∈ I_k} (e(J) : ℤ)`.
- `e_ge_sub` (U3): for `J` an independent `k`-set, `(e(J) : ℤ) ≥ (n : ℤ) − k − Σ_{v ∈ J} deg(v)`.

Summing the second over `J ∈ I_k` and expanding the left side gives

    (n : ℤ)·i_k − (k : ℤ)·i_k − (D_k : ℤ) ≤ Σ_{J ∈ I_k} (e(J) : ℤ) = ((k : ℤ) + 1)·i_{k+1},

and adding (DL) (`(D_k : ℤ) ≤ 2·k·i_k`) yields
`(n : ℤ)·i_k ≤ (k+1)·i_{k+1} + 3·k·i_k`. ∎

**Where each hypothesis enters.**
*Finiteness* (`[Fintype X]`) is used everywhere: it makes `I_k`, `childrenFinset`, the three pair finsets and
every cardinality meaningful. *Decidable equality* and *decidable adjacency* are bookkeeping instances.
*Acyclicity* (`hG : G.IsAcyclic`) enters **exactly once as a mathematical hypothesis, through (DL)**: it is
consumed only inside the rooting API, at `rootPath_unique`, and propagates from there to `par_or`,
`rk_par_lt`, `par_par_ne`, the degree decomposition, the injection and (RC). The double count and the
per-set extension bound are graph-general and carry **no** acyclicity binder; a stray `hG` on either is
struck at fidelity review.

## 8. `ℕ`/`ℤ` cast audit

- `D_k`, all three pair cardinalities, `#I_k`, `#children(v)`, `deg(v)`, `e(J)` and `#J` live in **`ℕ`**.
  Every identity and inequality in §§4–7 up to and including `forest_degree_lemma_nat` is an identity or
  inequality of naturals, and **no `ℕ`-subtraction occurs anywhere in the chain**: the only `Finset.erase`
  cardinality step (`#(J.erase w) = #J − 1`) is immediately re-added by `Finset.card_insert_of_notMem` and
  is discharged by `omega` from `1 ≤ k`, which is available because `w ∈ J`.
- `i_k(G) : ℤ` is the G1 definition of record; the bridge to `ℕ` is r25 entry 4
  (`indepCount_eq_card_indepSetFinset`), used exactly twice: once in `forest_degree_lemma` and once inside
  the terminal theorem's expansion step.
- The two award statements are stated in **`ℤ`**, as required. The quantity `2 − deg(v)` of the paper's
  weighting never appears in this development: the injection route replaces it by the incidence split of
  §5, so there is no place where a genuinely negative weight could be silently clamped in `ℕ`. The clamping
  hazard named in the synthesis (`f_D(v)` reaching `−3`, `−5`) is therefore structurally absent from this
  route, not merely avoided.
- `(k : ℤ)` appears only as a cast of the natural `k`; `(Fintype.card X : ℤ)` only as a cast of `n`. No
  truncated subtraction is used to state or prove (EX): the terminal statement is the subtraction-free form
  `n·i_k ≤ (k+1)·i_{k+1} + 3k·i_k`.

## 9. Route record and the switch point

The primary (injection) route was taken and completed. The rooting API — `rootRep`, `rootPath`, `par`, `rk`,
with `rootPath_unique`, `par_or`, `rk_par_lt`, `par_par_ne` — was sorry-free well before the halfway mark of
the bounded attempt (it was the first block written and compiled), so the switch point of synthesis
Decision 1 was never reached and **the fallback (U2's `R27DegreeLemma` machinery, the edge-split join, the
separated-union convolution, the all-roots induction) was not used**. Consequently row 8 of the carry list
(U2's file) is off the critical path entirely and **none of its fragments is carried**, so the three
mandated renames (`indepFinsets → r27IndepFinsets` with its body re-expressed, `mem_indepFinsets →
mem_r27IndepFinsets`, `degOn → r27DegreeIn`) do not arise in this run. No identifier of this run coincides
with any declaration base name of the external slice.

## 10. Carry table

Every carried body's origin and full SHA-256. Rows 10–16 of the synthesis carry list are critic-attributed
and rows 17–19 adjudicator-attributed; **this run carries none of rows 10–19**. It carries only row 5 (the
frozen r25 award source) and row 9 (U3).

| Carried declaration | Origin file | Origin SHA-256 | Manner of carry |
|---|---|---|---|
| `Erdos993G1.indepCount` (r25 entry 1) | `sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean` | `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0` | byte-identical registrar entry; entry digest `5484fc21ffce7bf707240da15858d7d82289f8e6f286a8fa9837cd9a0c474ccb` reproduced |
| `Erdos993G1.coeff` (r25 entry 2) | same | same | byte-identical; entry digest `211900436b28e4a685af60df26a20e8fe254fd4c9479c12ba2863fa180c1a639` reproduced |
| `Erdos993G1.delta` (r25 entry 3) | same | same | byte-identical; entry digest `bdb46014d98507a7c85cc8de0b806f80c04496479795e28677dde024e216b9ee` reproduced |
| `Erdos993G1.indepCount_eq_card_indepSetFinset` (r25 entry 4) | same | same | byte-identical; entry digest `4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac` reproduced. Carried under R1's "further entries only if a carried body depends on them": `double_count` and `forest_degree_lemma` both depend on it |
| `Erdos993G1.closedNbhdFinset` | `sources/c1-stage7-sources/U3-Extension.lean` (row 9, U3) | `116b4f313eedfe4210173226c2f5ef877a6e1ee07061888f4106e908ba6b08a6` | byte-identical declaration text (lines 20–23) |
| `Erdos993G1.extensionFinset` | same (lines 25–28) | same | byte-identical declaration text |
| `Erdos993G1.e` | same (lines 30–31) | same | byte-identical declaration text |
| `Erdos993G1.indepDegreeSum` | same (lines 33–35) | same | byte-identical declaration text — **the definition of record for `D_k`** |
| `Erdos993G1.mem_extensionFinset_iff` | same (lines 43–54) | same | byte-identical declaration text |
| `Erdos993G1.isNIndepSet_insert_of_mem_extensionFinset` | same (lines 56–73) | same | byte-identical declaration text |
| `Erdos993G1.isNIndepSet_erase_and_mem_extensionFinset` | same (lines 75–96) | same | byte-identical declaration text |
| `Erdos993G1.sigma_card_double_count` | same (lines 104–131) | same | statement and proof byte-identical; **leading keyword `theorem` → `lemma`** (re-derivation, see note) |
| `Erdos993G1.sum_card_indepSetFinset_succ` | same (lines 133–139) | same | same, keyword changed |
| `Erdos993G1.sum_e_eq_succ_mul_card` | same (lines 141–151) | same | same, keyword changed |
| `Erdos993G1.double_count` | same (lines 153–165) | same | same, keyword changed |
| `Erdos993G1.card_closedNbhdFinset_le` | same (lines 173–185) | same | same, keyword changed |
| `Erdos993G1.e_add_card_add_degreeSum_ge` | same (lines 187–197) | same | same, keyword changed |
| `Erdos993G1.e_ge_sub` | same (lines 199–208) | same | same, keyword changed |

**Note on the keyword change (R2).** The governed registrar accepts exactly one `theorem`-kind entry and it
must be terminal; every non-terminal declaration must be registered as `definition` or `lemma`, and the
registrar matches the declaration keyword against the registered kind. Seven of U3's carried declarations
are written with the keyword `theorem`. Their statements and proof bodies are carried byte for byte; only
the leading keyword is changed to `lemma`. Per R2 a body that is not byte-identical at the declaration level
is a **re-derivation, recorded as such**, and it is so recorded here and in `FORMALIZER-REPORT.md`, with the
exact delta stated and the per-declaration digests before and after the change recorded in
`DRAFTS/ORDER.json`. U3's carried fragments are wrapped in `namespace Erdos993G1` and a `section` carrying
U3's own `variable` line; per R2 namespace wrappers and variable context are not bodies.

U3's conditional `forest_extension_inequality` (which takes (DL) as a hypothesis) is **not** carried: its
name is the terminal declaration's name in this run. The terminal theorem is written in-run from
`double_count`, `e_ge_sub` and this run's `forest_degree_lemma`, following the same statement-level
derivation; U3 is cited for that step (R8 permits carry **or** re-derivation).

`firstDescent` is **not** part of this award. It is a `def` whose body depends on an existence lemma, so it
cannot be registered under the registrar's definition-before-lemma ordering, and it is not a dependency of
either `C1-LA1` declaration; it belongs to `C1-LA4` ((XR)). This is recorded as a deviation from the brief's
R3 wording in `FORMALIZER-REPORT.md`.

## 11. Excluded conclusions

The following are **not** claimed, anywhere, by this artifact:

1. No tightness claim for (DL). (DL) is never tight on a finite forest except at `k = 0` and where `i_k = 0`
   (Established result 17); nothing here asserts or uses tightness.
2. No claim that (DL) certifies acyclicity. Every cycle `C_n` satisfies (DL) with equality at every `k`;
   only the root-corrected form at `k = 1` separates forests. (RC) is proved here in incidence form, but no
   acyclicity-characterisation corollary is drawn.
3. No `α`/`indepNum` hypothesis, and no `(★)` or `hyp-alpha` side condition.
4. **No pointwise degree statement.** (DL) is an average over `I_k(G)`; it bounds no individual independent
   set's incident degree. The per-`J` inequality is false in general and is nowhere asserted.
5. Nothing asymptotic: no `N₀`, no CLT, no "sufficiently large forests are unimodal".
6. No no-recovery reading, and no status transfer to r25 Tier 1 (`E993-R25-UNR-FOREST-WIDE`),
   `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, the all-rank aggregate, `E993-BETA-AGG`, or
   Erdős #993. All of those stand untouched at their own statements.
7. No order bound, no `(LB)`, `(R5)` or `(XR)`, and no descent statement is proved or implied here; those are
   `C1-LA4` and are contingent on this award.
8. Formal grade attaches to exactly the two declarations of §2 at exactly their stated types, and to nothing
   else. In particular `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` keeps its own statement and its own
   grade; this run makes no comparison claim.
