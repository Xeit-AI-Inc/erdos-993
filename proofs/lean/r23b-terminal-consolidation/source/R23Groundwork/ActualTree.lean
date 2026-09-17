import R23Groundwork.Theorems
import R23Groundwork.Controls

/-!
# C3-T1 (LC-A): `THM-R23-B` at ACTUAL-TREE scope

**C4-T1 GRAND-MERGE note.** This file is C3-T1's sealed
`ActualTree.lean` (`cycles/cycle-3/stage3/routes/T1/evidence/
lean-project-source/R23Groundwork/ActualTree.lean`, sha256
`8fc4af04450857fc956bad5d6d59aeed4a092c5b3295a691440e6536d48662d3`)
carried into the merged project with exactly
two delta classes, disclosed: (i) the underlying `Theorems.lean` is now
the merged/completed one — in particular `IsTree` is the LC-11-repaired
THREE-conjunct form (`0 < n ∧ Connected ∧ edges.card = 2*(n-1)`),
whereas C3-T1's sealed project sat on the C1-era two-conjunct `IsTree`;
every `_actual` theorem here carries `hT` NON-load-bearing (C3-LEDGER
`R23B-C3-T1-03`: "`_hT` non-load-bearing"), so strengthening the
hypothesis cannot un-prove any of them, and the two concrete witnesses
(`k13_isTree`, `k16_isTree`) gain the trivial `0 < n` component in their
proofs — the ONLY proof-term deltas in this file; (ii) docstring-currency
repairs marked `(C4-T1)`. The `_actual` statements themselves are
byte-unchanged from the sealed evidence.

Charge (`control/CYCLE3-ALLOCATION.md` §"C3-T1"): discharge the
identification between the C1-T6 encoding and `SEMANTIC-CONTRACT.md` §4 on
ordinary trees — prove, sorry-free, `support v = s_v` and `xOf = x(T)`
(first strict descent) under the encoding for actual finite trees, state
A1.1 where it bears, and land BRIDGE-1/2 as actual-tree statements.

**[A1.1] premise, stated where it bears (SEMANTIC-CONTRACT AMENDMENT A1.1,
binding on every actual-tree sentence):** every theorem below whose name
carries `_actual` is a statement about the C1-T6 ordinary-graph encoding
(`Graph n` on `Fin n`); its reading as a statement about the registered
"actual tree" objects is the r23 CONVENTION of AMENDMENT A1.1 — the
`RTree.semanticAdequacyTarget` transfer is stated, unproved, and
source-annotated unattempted, and no Lean hypothesis in this project can
express it (no `RTree` value exists in this project). The premise therefore
cannot be discharged or even stated as a Lean term here; it is carried as
this documented, named side condition on every `_actual` declaration, per
standing duty 6. Nothing here touches, weakens, or discharges A1.1.

Mode convention (standing duty 1): `x(T)` = FIRST STRICT DESCENT,
`min{k ≥ 0 : Δ_k(T) < 0}`; first global mode and last global mode are
different objects from `x(T)` and from each other. The `xOf` specification
theorems below formalize exactly the first-strict-descent convention.

The A2.2 DEAD-BRANCH fence is respected: nothing below states, uses, or
re-opens any all-cut Hall or Delete-only universal Hall claim. BRIDGE-1/2
are cardinality identities (the O14-row objects), not Hall statements.

Nothing in this file is `formally_verified` in the VerityOS sense (no
`lean-proof-workflow` closeout ran). Lean-kernel type-checking is
computation-grade evidence of exactly the declarations checked, on exactly
this encoding — never proof of any claim beyond them.
-/

namespace R23
namespace Graph

variable {n : ℕ} (G : Graph n)

/-! ## 1. `support v = s_v`: the working stand-in equals the unique
    leaf-neighbor. (Docstring currency, C4-T1: in this merged project
    `support_eq_of_isLeaf` is PROVED sorry-free in `Theorems.lean` —
    since C2-T1; the C1-era "left unproved" framing this section header
    carried in the sealed C3-T1 copy is history, not current state. The
    lemmas below remain C3-T1's independent adjacency-form
    characterization, registered `R23B-C3-T1-01`.) -/

/-- Under `IsLeaf v`, the working `support v` is an actual neighbor of `v`:
    `v ~ support v`. (Adjacency form of C1-T6's `support_mem_nbrs_of_isLeaf`.) -/
theorem adj_support_of_isLeaf {v : Fin n} (h : G.IsLeaf v) :
    G.Adj v (G.support v) := by
  have hmem : G.support v ∈ G.nbrs v := G.support_mem_nbrs_of_isLeaf h
  exact (Finset.mem_filter.mp hmem).2

/-- **`support v = s_v`, uniqueness direction:** under `IsLeaf v`, EVERY
    neighbor of `v` equals `support v` — so `support v` is THE unique
    neighbor `s_v` of the contract (`SEMANTIC-CONTRACT.md` §2 "unique
    neighbor (support) `s_v`"). Together with `adj_support_of_isLeaf` this
    is the full characterization: `support v` is a neighbor, and there is
    no other. -/
theorem support_eq_of_adj_of_isLeaf {v s : Fin n} (h : G.IsLeaf v)
    (hs : G.Adj v s) : G.support v = s := by
  have hcard : (G.nbrs v).card = 1 := h
  obtain ⟨a, ha⟩ := Finset.card_eq_one.mp hcard
  have h1 : G.support v ∈ G.nbrs v := G.support_mem_nbrs_of_isLeaf h
  have h2 : s ∈ G.nbrs v := Finset.mem_filter.mpr ⟨Finset.mem_univ s, hs⟩
  rw [ha, Finset.mem_singleton] at h1 h2
  rw [h1, h2]

/-- **`support v = s_v`, packaged as the existence-and-uniqueness spec:**
    for a leaf `v`, `support v` is a neighbor of `v` and every neighbor of
    `v` is `support v`. This is the exact well-definedness content the
    contract's `s_v` notation presupposes, discharged for the encoding's
    total stand-in. -/
theorem support_spec_of_isLeaf {v : Fin n} (h : G.IsLeaf v) :
    G.Adj v (G.support v) ∧ ∀ s : Fin n, G.Adj v s → s = G.support v :=
  ⟨G.adj_support_of_isLeaf h,
   fun _ hs => (G.support_eq_of_adj_of_isLeaf h hs).symm⟩

/-- For a leaf `v`, the neighbor set is exactly the singleton
    `{support v}` — the `Tree.lean` doc comment's "`nbrs v` is a singleton
    `{s_v}`", proved. -/
theorem nbrs_eq_singleton_support_of_isLeaf {v : Fin n} (h : G.IsLeaf v) :
    G.nbrs v = {G.support v} := by
  have hcard : (G.nbrs v).card = 1 := h
  obtain ⟨a, ha⟩ := Finset.card_eq_one.mp hcard
  have h1 : G.support v ∈ G.nbrs v := G.support_mem_nbrs_of_isLeaf h
  rw [ha, Finset.mem_singleton] at h1
  rw [ha, h1]

/-- Every favorable vertex is a leaf (by construction of `Favorable`);
    convenience projection so the `_actual` statements below can consume
    favorable membership directly. -/
theorem isLeaf_of_mem_favorable {v : Fin n} {p : ℕ}
    (hv : v ∈ G.Favorable p) : G.IsLeaf v :=
  (Finset.mem_filter.mp hv).2.1

/-! ## 2. `xOf = x(T)`: the bounded-search stand-in computes the first
    strict descent. Proved for EVERY `G : Graph n` (any finite simple
    graph on this encoding, `n = 0` included) — broader than the tree
    domain the contract needs, disclosed as such: the two facts driving it
    are `i_0 = 1` and `i_{n+1} = 0`, neither of which needs acyclicity or
    connectivity. -/

/-- The empty set is independent. -/
theorem isIndependent_empty : G.IsIndependent (∅ : Finset (Fin n)) := by
  intro u hu
  simp at hu

/-- `i_0(G) = 1` on any carrier's ambient graph: the unique independent
    `0`-set is `∅` (`SEMANTIC-CONTRACT.md` §2 "`i_0 = 1`"). -/
theorem i_zero : G.i 0 = 1 := by
  unfold i Ind IndOn
  rw [Finset.powersetCard_zero, Finset.filter_singleton,
    if_pos (G.isIndependent_empty)]
  exact Finset.card_singleton _

/-- `i_{n+1}(G) = 0`: there is no `(n+1)`-subset of an `n`-element vertex
    set at all (`SEMANTIC-CONTRACT.md` §2 "zero outside supported ranks",
    at the rank just above the vertex count). -/
theorem i_top : G.i (n + 1) = 0 := by
  unfold i Ind IndOn
  have hcard : (Finset.univ : Finset (Fin n)).card = n := Finset.card_univ.trans (Fintype.card_fin n)
  have hempty : (Finset.univ : Finset (Fin n)).powersetCard (n + 1) = ∅ :=
    Finset.powersetCard_eq_empty.mpr (by omega)
  rw [hempty, Finset.filter_empty, Finset.card_empty]

/-- **Existence of a strict descent within the search window `[0, n]`:**
    since `i_0 = 1` and `i_{n+1} = 0`, some `k ≤ n` has `Δ_k < 0`. This is
    the existence half of `x(T)`'s well-definedness (the `Tree.lean` doc
    comment's open "general existence argument", including the
    `i_n(G) = 0` edge case, closed for every finite graph). -/
theorem exists_first_descent : ∃ k, k ≤ n ∧ G.Delta k < 0 := by
  by_contra hcon
  simp only [not_exists, not_and, not_lt] at hcon
  have hmono : ∀ m, m ≤ n + 1 → (1 : ℤ) ≤ (G.i m : ℤ) := by
    intro m
    induction m with
    | zero =>
      intro _
      rw [G.i_zero]
      norm_num
    | succ m ih =>
      intro hm1
      have hm : m ≤ n := by omega
      have hd : 0 ≤ G.Delta m := hcon m hm
      have ihm : (1 : ℤ) ≤ (G.i m : ℤ) := ih (by omega)
      unfold Delta at hd
      linarith
  have htop := hmono (n + 1) le_rfl
  rw [G.i_top] at htop
  norm_num at htop

/-- The bounded `find?` in `xOf` succeeds (never falls back to the `getD`
    sentinel), because a strict descent exists inside the window. -/
theorem xOf_find?_isSome :
    ∃ j, (List.range (n + 1)).find? (fun k => decide (G.Delta k < 0)) = some j := by
  cases hfind : (List.range (n + 1)).find? (fun k => decide (G.Delta k < 0)) with
  | some j => exact ⟨j, rfl⟩
  | none =>
    exfalso
    obtain ⟨k, hk, hneg⟩ := G.exists_first_descent
    have hnone := List.find?_eq_none.mp hfind k (List.mem_range.mpr (by omega))
    simp only [decide_eq_true_eq] at hnone
    exact hnone hneg

/-- **`xOf = x(T)`, the specification theorem:** `xOf` lies in `[0, n]`,
    `Δ_{xOf} < 0`, and every `k < xOf` has `Δ_k ≥ 0` — i.e. `xOf` IS
    `min{k ≥ 0 : Δ_k(T) < 0}`, the contract's first strict descent
    (`SEMANTIC-CONTRACT.md` §2; mode convention per standing duty 1:
    first strict descent, NOT first/last global mode). -/
theorem xOf_spec :
    G.xOf ≤ n ∧ G.Delta G.xOf < 0 ∧ ∀ k < G.xOf, 0 ≤ G.Delta k := by
  obtain ⟨j, hj⟩ := G.xOf_find?_isSome
  have hxof : G.xOf = j := by
    unfold xOf
    rw [hj]
    rfl
  have hpj := List.find?_some hj
  simp only [decide_eq_true_eq] at hpj
  have hneg : G.Delta j < 0 := hpj
  have hjmem : j ∈ List.range (n + 1) := List.mem_of_find?_eq_some hj
  have hjle : j ≤ n := by
    have := List.mem_range.mp hjmem
    omega
  obtain ⟨-, as, bs, hsplit, hall⟩ := List.find?_eq_some_iff_append.mp hj
  -- `j` sits at position `as.length` of `range (n+1)`, whose entries are
  -- their own indices; so `j = as.length` and `as = [0, …, j-1]` entrywise.
  have hlen : as.length + (bs.length + 1) = n + 1 := by
    have h1 : (List.range (n + 1)).length = n + 1 := List.length_range
    rw [hsplit] at h1
    simpa [List.length_append] using h1
  have hlenlt : as.length < n + 1 := by omega
  have hj_eq : j = as.length := by
    have hget : (List.range (n + 1))[as.length]'(by
        rw [List.length_range]; exact hlenlt) = j :=
      List.getElem_of_append hsplit rfl
    rw [List.getElem_range] at hget
    exact hget.symm
  have hmin : ∀ k < j, 0 ≤ G.Delta k := by
    intro k hk
    have hklen : k < as.length := hj_eq ▸ hk
    have hklt : k < (List.range (n + 1)).length := by
      rw [List.length_range]; omega
    have hget : (List.range (n + 1))[k]'hklt = k := List.getElem_range hklt
    have hget2 : (List.range (n + 1))[k]'hklt = as[k]'hklen := by
      simp only [hsplit]
      exact List.getElem_append_left hklen
    have hkmem : k ∈ as := by
      have heq : as[k]'hklen = k := hget2.symm.trans hget
      exact heq ▸ List.getElem_mem hklen
    have hfalse := hall k hkmem
    simp only [Bool.not_eq_eq_eq_not, Bool.not_true, decide_eq_false_iff_not] at hfalse
    exact not_lt.mp hfalse
  exact ⟨hxof ▸ hjle, hxof ▸ hneg, hxof ▸ hmin⟩

/-- **`xOf = x(T)`, uniqueness direction:** any `x` satisfying the
    first-strict-descent specification equals `xOf`. With `xOf_spec` this
    identifies the stand-in with the mathematical object exactly. -/
theorem eq_xOf_of_first_descent {x : ℕ} (hneg : G.Delta x < 0)
    (hmin : ∀ k < x, 0 ≤ G.Delta k) : x = G.xOf := by
  obtain ⟨-, hxneg, hxmin⟩ := G.xOf_spec
  rcases lt_trichotomy x G.xOf with h | h | h
  · exact absurd hneg (not_lt.mpr (hxmin x h))
  · exact h
  · exact absurd hxneg (not_lt.mpr (hmin _ h))

/-! ## 3. BRIDGE-1/2 as actual-tree statements. **[A1.1]** on every
    declaration below (see the module docstring: the RTree transfer is an
    unproved premise carried on every actual-tree reading; it is not — and
    cannot be — a Lean hypothesis in this project). -/

/-- **BRIDGE-1 at actual-tree scope [A1.1]** (`SEMANTIC-CONTRACT.md` §4,
    BRIDGE-1; THM-R23-B first identity): for a finite tree `T`, an
    original degree-one leaf `v`, and ITS UNIQUE NEIGHBOR `s` (any vertex
    adjacent to `v` — uniqueness is `support_spec_of_isLeaf`), every rank
    `r` satisfies
    `|C_r(v)| = i_r(T − {v,s}) − i_r(T − N[s])`,
    with both carriers written in terms of the actual `s`, not the
    encoding's `support` stand-in — `support v = s` (proved above) is what
    discharges the identification with C2's `bridge1_proof`.

    Honesty notes: `hT` is carried to pin the actual-tree domain of the
    contract statement but is NOT load-bearing (the identity holds on
    every finite simple graph — C1-LEDGER `R23-C1-BRIDGE1`'s registered
    broadening; dropping `hT` would only re-broaden). `hleaf`/`hs` ARE
    load-bearing: they are what turns the stand-in `support v` into the
    contract's `s_v`. -/
theorem THM_R23_B_bridge1_actual (_hT : G.IsTree) {v s : Fin n}
    (hleaf : G.IsLeaf v) (hs : G.Adj v s) (r : ℕ) :
    ((G.C v r).card : ℤ)
      = (G.iOn (Finset.univ \ {v, s}) r : ℤ)
        - (G.iOn (Finset.univ \ insert s (G.nbrs s)) r : ℤ) := by
  have hsup : G.support v = s := G.support_eq_of_adj_of_isLeaf hleaf hs
  have h := G.bridge1_proof v r
  unfold Hcarrier removedClosedNbhdCarrier closedNbhd at h
  rw [hsup] at h
  exact h

/-- **BRIDGE-2 at actual-tree scope [A1.1]** (`SEMANTIC-CONTRACT.md` §4,
    BRIDGE-2; THM-R23-B second identity): for a finite tree `T` and any
    rank `p ≥ x + 2` where `x` is THE FIRST STRICT DESCENT of `T` — given
    here by its mathematical specification (`Δ_x < 0` and `Δ_k ≥ 0` below
    it), NOT by the encoding's `xOf` stand-in —
    `|P| − |N| = S(T,p)`.
    The identification `x = xOf` (`eq_xOf_of_first_descent`) is what
    discharges the hypothesis of C2's `bridge2_proof`; the rank floor is
    thereby stated against the contract's `x(T)` for the first time.

    Honesty notes: `hT` is carried for the actual-tree domain but is not
    load-bearing (C2's proof needs only the rank floor; C1-LEDGER
    `R23-C1-BRIDGE2` already registered the broadening). The floor really
    is needed only as `p ≥ 1` by the underlying proof (C2-T2 F-2's
    truncated-subtraction finding, unchanged); `p ≥ x + 2` is the
    contract's stated domain and implies it. -/
theorem THM_R23_B_bridge2_actual (_hT : G.IsTree) {x : ℕ}
    (hxneg : G.Delta x < 0) (hxmin : ∀ k < x, 0 ≤ G.Delta k)
    (p : ℕ) (hp : p ≥ x + 2) :
    ((G.P p).card : ℤ) - ((G.N p).card : ℤ) = G.S p := by
  have hxeq : x = G.xOf := G.eq_xOf_of_first_descent hxneg hxmin
  exact G.bridge2_proof p (by omega)

/-- **THM-R23-B at actual-tree scope, packaged [A1.1]:** on a governed
    actual-tree row `(T, p)` — `T` a finite tree, `p ≥ x(T) + 2` with
    `x(T)` specified as the first strict descent — (i) BRIDGE-1 holds at
    every favorable leaf against its unique neighbor, at every rank, and
    (ii) BRIDGE-2 holds for the row. This is `SEMANTIC-CONTRACT.md` §5's
    THM-R23-B statement shape on the encoding, with every contract-side
    object (`s_v`, `x(T)`) supplied by its specification rather than by a
    stand-in. -/
theorem THM_R23_B_actual (hT : G.IsTree) {x : ℕ}
    (hxneg : G.Delta x < 0) (hxmin : ∀ k < x, 0 ≤ G.Delta k)
    (p : ℕ) (hp : p ≥ x + 2) :
    (∀ v ∈ G.Favorable p, ∀ s : Fin n, G.Adj v s → ∀ r : ℕ,
      ((G.C v r).card : ℤ)
        = (G.iOn (Finset.univ \ {v, s}) r : ℤ)
          - (G.iOn (Finset.univ \ insert s (G.nbrs s)) r : ℤ)) ∧
    ((G.P p).card : ℤ) - ((G.N p).card : ℤ) = G.S p := by
  refine ⟨fun v hv s hs r => ?_, G.THM_R23_B_bridge2_actual hT hxneg hxmin p hp⟩
  exact G.THM_R23_B_bridge1_actual hT (G.isLeaf_of_mem_favorable hv) hs r

/-! ## 4. Non-vacuity controls (SOLUTION-CONTRACT §6 discipline: no
    vacuous certification). `decide`-checked witnesses that the `_actual`
    hypotheses are inhabitable on real rows. Kernel `decide` only — no
    `native_decide`, no custom axioms. -/

/-- A graph in which every non-center vertex is adjacent to a fixed center
    is connected (helper for concrete `IsTree` witnesses; stars). -/
theorem connected_of_center (c : Fin n)
    (h : ∀ w : Fin n, w ≠ c → G.Adj w c) : G.Connected := by
  have hto : ∀ u : Fin n, Relation.ReflTransGen G.Adj u c := by
    intro u
    by_cases hu : u = c
    · rw [hu]
    · exact Relation.ReflTransGen.single (h u hu)
  have hfrom : ∀ v : Fin n, Relation.ReflTransGen G.Adj c v := by
    intro v
    by_cases hv : v = c
    · rw [hv]
    · exact Relation.ReflTransGen.single (G.symm v c (h v hv))
  intro u v
  exact Relation.ReflTransGen.trans (hto u) (hfrom v)

/-- `K_{1,6}`: center `0`, leaves `1..6` — the C2-adjudicated non-vacuous
    BRIDGE-2 row (C2-LEDGER `R23-C2-02`: `|P| = 6`, `|N| = 30`,
    `S = −24` at `p = 5`). -/
def k16 : Graph 7 where
  edges := {(0,1),(1,0),(0,2),(2,0),(0,3),(3,0),(0,4),(4,0),(0,5),(5,0),(0,6),(6,0)}
  symm := by decide
  irrefl := by decide

/-- `K_{1,3}` is a tree in the encoding's `IsTree` sense. (C4-T1: the
    `0 < n` component added for the merged project's LC-11-repaired
    three-conjunct `IsTree`; the sealed C3-T1 proof had two components
    against the C1-era two-conjunct form.) -/
theorem k13_isTree : k13.IsTree :=
  ⟨by decide, k13.connected_of_center 0 (by decide), by decide⟩

/-- `K_{1,6}` is a tree in the encoding's `IsTree` sense. (Same C4-T1
    `0 < n` addition as `k13_isTree`.) -/
theorem k16_isTree : k16.IsTree :=
  ⟨by decide, k16.connected_of_center 0 (by decide), by decide⟩

/-- `support` control on `K_{1,3}`: each leaf's `support` is the center,
    non-vacuously witnessing `support_spec_of_isLeaf`'s subject matter. -/
theorem k13_support_leaves :
    (k13.support 1, k13.support 2, k13.support 3) = (0, 0, 0) := by decide

/-- `x(K_{1,6}) = 3` by the specification (Δ-vector `(6, 8, 5, −5, …)`),
    checked BOTH through the spec theorem's subject (`Δ_3 < 0`, `Δ_k ≥ 0`
    below) AND through the stand-in (`xOf = 3`) — the two agreeing on a
    concrete row is exactly what `xOf_spec`/`eq_xOf_of_first_descent`
    prove in general. -/
theorem k16_first_descent_witness :
    k16.Delta 3 < 0 ∧ (0 ≤ k16.Delta 0 ∧ 0 ≤ k16.Delta 1 ∧ 0 ≤ k16.Delta 2)
      ∧ k16.xOf = 3 := by decide

/-- The `K_{1,6}` row `p = 5` is NON-VACUOUS for `THM_R23_B_bridge2_actual`:
    `|P| = 6`, `|N| = 30`, `S = −24` (matching C2-LEDGER `R23-C2-02`'s
    adjudicated integers exactly). Kernel-`decide` computation — evidence,
    never proof of anything beyond these three integers on this encoding. -/
theorem k16_row_nonvacuous :
    (k16.P 5).card = 6 ∧ (k16.N 5).card = 30 ∧ k16.S 5 = -24 := by decide

/-- End-to-end non-vacuous instantiation of the actual-tree BRIDGE-2: the
    hypotheses of `THM_R23_B_bridge2_actual` are all discharged on the
    concrete row `(K_{1,6}, p = 5)` with `x = 3` supplied by its
    first-strict-descent specification (not by `xOf`). [A1.1] -/
theorem k16_bridge2_actual_instance :
    ((k16.P 5).card : ℤ) - ((k16.N 5).card : ℤ) = k16.S 5 :=
  k16.THM_R23_B_bridge2_actual k16_isTree (x := 3)
    (by decide)
    (by
      intro k hk
      interval_cases k <;> decide)
    5 (by omega)

end Graph
end R23
