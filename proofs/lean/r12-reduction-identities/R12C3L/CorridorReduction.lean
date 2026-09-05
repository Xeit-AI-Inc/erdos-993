import R12C3L.CorridorIngredients

/-!
# R12C3-L — the corrected combined identity and its favorable-support corollary

This file adds exactly two new declarations on top of the byte-identical,
CONSUMED `CorridorIngredients.lean` of record (digest
`d846b17d32252c447b09197cf2b051b24be5153220da760935a44b95897ffd8a`, copied
unedited as `R12C3L/CorridorIngredients.lean` — verified before and after
this route touched a single line, see `receipts/source_copy_verify.log`).
Nothing above this file's own two theorems is edited.

Both declarations are the C3-1 duty of `control/CYCLE3-ALLOCATION.md`
(R12C3-L route mapping) and are the exact forms fixed at record by
`control/FC-R12-5.md` (H-2 extraction, binding from C3):

  `t.a s p = t.a v p + (t.b v p − t.Bgen s ((p:ℤ) − 1))` for a leaf `v`
  with `s := t.support v` ("combined corrected" row, 0 mismatches /
  8,934,564 exhaustive checks orders 2–8), and the corollary

  `PFavorableAt t p s → t.b v p ≤ t.Bgen s ((p:ℤ) − 1) → t.a s p < 0`.

Both are proved by COMPOSING two already-governed theorems —
`RTree.Delta_eq_A_add_Bgen` (`:1411`) applied at two different vertices,
and `RTree.b_eq_Bgen_of_leaf` (`:1508`) — never by re-deriving
`RTree.indepCountOn_succ` (`:1294`) itself, per `SOLUTION-CONTRACT.md` §4
(consume the governed modules; never re-derive).
Neither declaration introduces a new definition; neither asserts (A), (B),
`CMP-A`, `CMP-B`, or `O3`; both are stated only for `v ∈ t.leaves`.

**Fence check (restated at the object, per `FC-R12-5`):** F1/F2 not
approached — no step invokes or requires log-concavity or unimodality.
F10 not approached — no `Bpoly_node` recursion, no inequality carried
across a subtraction, no blocked-root state; the corollary's own
inequality (`hb` below) is consumed as a HYPOTHESIS, not derived across a
subtraction here.
-/

noncomputable section
namespace RTree

/-- **The corrected combined identity (`FC-R12-5`, "combined corrected"
row), formalized.** For a leaf `v` with `s := t.support v`, and any
`p : ℕ`:

`t.a s p = t.a v p + (t.b v p − t.Bgen s ((p:ℤ) − 1))`.

Derivation of record: apply `Delta_eq_A_add_Bgen` at `z = v` and again at
`z = t.support v` (both are vertices — `v` via `t.leaves`'s own membership
content, `t.support v` via `support_mem_vertices`); both instances equal
the SAME `t.Delta p`, so their right-hand sides are equal; rewrite
`t.b v p` to `t.Bgen v ((p:ℤ) - 1)` via `b_eq_Bgen_of_leaf` (valid because
`v` is a leaf, using `t.b`'s own definitional unfold to `t.bZ v ((p:ℤ)-1)`
at `:1501`); then close the resulting ℤ-linear identity. No
tree-recursive structure and no `Bpoly_node` step occur anywhere in this
chain — both `Delta_eq_A_add_Bgen` and `b_eq_Bgen_of_leaf` are themselves
off F10 by the governed file's own documentation at `:1399`–`:1524`.

Invariance: a function of `(t, v, p)` only, with `s := t.support v`
determined by `v`, exactly as `FC-R12-5`'s own invariance statement
requires. Stated only for `v ∈ t.leaves`. Introduces no new definition;
asserts neither (A) nor (B) nor `CMP-A` nor `CMP-B` nor `O3`. -/
theorem a_support_eq_a_add_b_sub_Bgen (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    (p : ℕ) :
    t.a (t.support v) p = t.a v p + (t.b v p - t.Bgen (t.support v) ((p : ℤ) - 1)) := by
  have hvmem : v ∈ t.vertices := (t.mem_leaves_iff v).mp hv |>.1
  have hsmem : t.support v ∈ t.vertices := t.support_mem_vertices hv
  have h1 := t.Delta_eq_A_add_Bgen hvmem p
  have h2 := t.Delta_eq_A_add_Bgen hsmem p
  have h3 : t.bZ v ((p : ℤ) - 1) = t.Bgen v ((p : ℤ) - 1) := t.b_eq_Bgen_of_leaf hv ((p : ℤ) - 1)
  have h4 : t.b v p = t.bZ v ((p : ℤ) - 1) := rfl
  rw [h4, h3]
  omega

/-- **The corrected sufficient condition, as a corollary (`FC-R12-5`,
"SUSTAINED as a genuine sufficient condition"), formalized.** For a leaf
`v` witnessing `PFavorableAt t p (t.support v)` — i.e. carrying
`t.a v p < 0` itself — together with the `b`-against-`Bgen` bound AT THAT
SAME `v`, the combined identity above forces `t.a (t.support v) p < 0`.

Stated with the witnessing leaf `v` as an explicit parameter (`hv`, `ha`)
rather than by destructuring the bare existential `t.PFavorableAt p s`:
the identity above is genuinely about ONE leaf's data, and a different
leaf sharing the same support could satisfy `PFavorableAt` without
satisfying the `b`-bound below, in which case the corollary would not
follow for it. `hv` and `ha` together are exactly the witness data
`t.PFavorableAt p (t.support v)` unpacks to — `_hfav` below exhibits this
correspondence (bound, deliberately unused past that, matching this run's
own `_hInterval` precedent for a witness recorded but not consumed
further) — so this is precisely the "`PFavorableAt(T,p,s)` witnessed by
leaf `v`" reading `FC-R12-5` states the corollary under. No step here
decomposes `Bgen` through branch structure; `hb` is consumed as a
hypothesis, never derived across a subtraction. F10 not approached.

Invariance: a function of `(t, v, p)` on the same scope as the identity
above, conditioned on `PFavorableAt(t, p, t.support v)` witnessed by `v`.
Asserts nothing about (A); this is a SUFFICIENT condition, not a
reduction — its exceptional set is C3-2's duty (`n = 14`), out of this
route's scope. -/
theorem a_support_neg_of_favorable_and_bBound (t : RTree) {v : List ℕ}
    (hv : v ∈ t.leaves) {p : ℕ} (ha : t.a v p < 0)
    (hb : t.b v p ≤ t.Bgen (t.support v) ((p : ℤ) - 1)) :
    t.a (t.support v) p < 0 := by
  have _hfav : t.PFavorableAt p (t.support v) := ⟨v, hv, rfl, ha⟩
  have hid := t.a_support_eq_a_add_b_sub_Bgen hv p
  omega

end RTree
end
