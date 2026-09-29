import LeanProof.Main
import LeanProof.E1FlowConstruction
import LeanProof.ChokeState

/-
r31 Cycle 4 gate — leaf statement texts (DRAFT for the controller; nothing here is graded).
Drafted 2026-09-28 by controller staff (Claude Opus 5.5, chartered high) under
`control/C4-GATE-STATEMENT-DRAFTER-BRIEF.md`. Every proof body is `sorry`: these are statement
texts to be frozen at the Cycle 4 gate and engineered by Cycle 4 routes, not results.
Base: `LeanProof.Main` = r31 Cycle 3 U3's merged six-award project with entry 607 deleted;
`LeanProof.E1FlowConstruction` = copy of Cycle 3 U2's E1 layer (one recorded rekey,
`cb8G -> cb8E1G`); `LeanProof.ChokeState` = copy of Cycle 2 U2's choke-state layer (Part B).
Companion: `C4-FROZEN-STATEMENTS.md` (sources, guards, checks, digests).
Nodes N1-N8 are those of `control/CHECKPOINT-ANALYSIS-C3.md` §"Conjunct 4". Fences: one rank
p* = (16m+4)/3, d = 8, the class m >= 107, m % 3 = 2 only; nothing here asserts (HALL) beyond
that class and rank, a θ* law, or any Newton/Darroch input.
-/

namespace E993Transport

open SimpleGraph Polynomial

/-- **N1 companion (generic).** The open-choke count is at most `m`, so the ℕ subtractions
`m - q` and `(16 * m + 4) / 3 - q` in the E1 layer (N2) are exact on the class (`q ≤ m < p*`). -/
theorem cbOpenChokeCount_le (m : ℕ) (X : Finset (Fin (17 * m + 3))) :
    cbOpenChokeCount m X ≤ m := by
  sorry

open Classical in
/-- **N1 (B1), deletion classes on `cbGraph m`.** An `r`-free independent `B` splits into its
`q` chokes, its `w` active tags (tag set `leafSet`; the Boolean branch of `cb8E1Val`), and the
remaining `ℓ = |B| - q - w` non-choke, non-active vertices (the ternary branch); with a marked
tag, `α = w - 1` Boolean, `j - α` ternary, `q` choke. Bounds `w ≤ 8q` (`α ≤ a = 8q - 1`) and
`ℓ ≤ 8(m - q) + 1 = b`, written subtraction-free. Any rank. -/
theorem cb8_rFree_deletionClasses (m : ℕ) (hm : 0 < m) (B : Finset (Fin (17 * m + 3)))
    (hB : (cbGraph m).IsIndepSet (B : Set (Fin (17 * m + 3)))) (hr : cbVertex m 0 ∉ B) :
    (B.filter fun z => ∃ i < m, z = cbVertex m (3 + 17 * i)).card = cbOpenChokeCount m B ∧
    (B.filter fun z => ¬ (∃ i < m, z = cbVertex m (3 + 17 * i)) ∧
        (z ∈ C5LA1.leafSet (cbGraph m) ∧ ¬ Disjoint (B.erase z) (tagWitnesses (cbGraph m) z))).card =
      activeWeight (cbGraph m) (C5LA1.leafSet (cbGraph m)) B ∧
    cbOpenChokeCount m B + activeWeight (cbGraph m) (C5LA1.leafSet (cbGraph m)) B +
        (B.filter fun z => ¬ (∃ i < m, z = cbVertex m (3 + 17 * i)) ∧
          ¬ (z ∈ C5LA1.leafSet (cbGraph m) ∧ ¬ Disjoint (B.erase z) (tagWitnesses (cbGraph m) z))).card =
      B.card ∧
    activeWeight (cbGraph m) (C5LA1.leafSet (cbGraph m)) B ≤ 8 * cbOpenChokeCount m B ∧
    (B.filter fun z => ¬ (∃ i < m, z = cbVertex m (3 + 17 * i)) ∧
          ¬ (z ∈ C5LA1.leafSet (cbGraph m) ∧ ¬ Disjoint (B.erase z) (tagWitnesses (cbGraph m) z))).card +
        8 * cbOpenChokeCount m B ≤ 8 * m + 1 := by
  sorry

open Classical in
/-- **N1 (B2), insertion classes on `cbGraph m`.** For an `r`-free independent `A`, the
independent up-covers `insert z A` with `z ≠ r` lie in the next layer; the Boolean ones
(`z` becomes an active tag: an absent private leaf at a present choke) number `8q - w = a - α`,
and the ternary ones (non-choke, non-active: an empty closed leg or the empty arm, two choices
each) number `2(b - ℓ')` with `b = 8(m - q) + 1`, `ℓ'` the ternary count of `A`; both written
subtraction-free. Choke insertions are the remaining class (E1 value 0). Any rank. -/
theorem cb8_rFree_insertionClasses (m : ℕ) (hm : 0 < m) (A : Finset (Fin (17 * m + 3)))
    (hA : (cbGraph m).IsIndepSet (A : Set (Fin (17 * m + 3)))) (hr : cbVertex m 0 ∉ A) :
    (∀ z ∈ (Finset.univ.filter fun z => z ∉ A ∧ z ≠ cbVertex m 0 ∧ (cbGraph m).IsIndepSet ((insert z A : Finset (Fin (17 * m + 3))) : Set (Fin (17 * m + 3)))),
      insert z A ∈ indepFamily (cbGraph m) (A.card + 1)) ∧
    (Finset.univ.filter fun z => z ∉ A ∧ z ≠ cbVertex m 0 ∧ (cbGraph m).IsIndepSet ((insert z A : Finset (Fin (17 * m + 3))) : Set (Fin (17 * m + 3))) ∧
        ¬ (∃ i < m, z = cbVertex m (3 + 17 * i)) ∧ (z ∈ C5LA1.leafSet (cbGraph m) ∧ ¬ Disjoint ((insert z A).erase z) (tagWitnesses (cbGraph m) z))).card +
      activeWeight (cbGraph m) (C5LA1.leafSet (cbGraph m)) A = 8 * cbOpenChokeCount m A ∧
    (Finset.univ.filter fun z => z ∉ A ∧ z ≠ cbVertex m 0 ∧ (cbGraph m).IsIndepSet ((insert z A : Finset (Fin (17 * m + 3))) : Set (Fin (17 * m + 3))) ∧
        ¬ (∃ i < m, z = cbVertex m (3 + 17 * i)) ∧ ¬ (z ∈ C5LA1.leafSet (cbGraph m) ∧ ¬ Disjoint ((insert z A).erase z) (tagWitnesses (cbGraph m) z))).card +
      2 * (A.filter fun z => ¬ (∃ i < m, z = cbVertex m (3 + 17 * i)) ∧
          ¬ (z ∈ C5LA1.leafSet (cbGraph m) ∧ ¬ Disjoint (A.erase z) (tagWitnesses (cbGraph m) z))).card +
      16 * cbOpenChokeCount m A = 16 * m + 2 := by
  sorry

/-- **N1 (B3), invariance under non-choke insertion.** Inserting a vertex `z ∉ A`, `z ≠ r`, that
is not a choke keeps the open-choke count and raises the `leafSet` active weight by exactly
`[z is active in insert z A]` (the Boolean test of `cb8E1Val` at the source `insert z A`). -/
theorem cb8_nonChokeInsert_weight (m : ℕ) (hm : 0 < m) (A : Finset (Fin (17 * m + 3)))
    (z : Fin (17 * m + 3)) (hzA : z ∉ A) (hzr : z ≠ cbVertex m 0)
    (hz : ¬ ∃ i < m, z = cbVertex m (3 + 17 * i)) :
    cbOpenChokeCount m (insert z A) = cbOpenChokeCount m A ∧
    activeWeight (cbGraph m) (C5LA1.leafSet (cbGraph m)) (insert z A) =
      activeWeight (cbGraph m) (C5LA1.leafSet (cbGraph m)) A +
        (if z ∈ C5LA1.leafSet (cbGraph m) ∧
            ¬ Disjoint ((insert z A).erase z) (tagWitnesses (cbGraph m) z) then 1 else 0) := by
  sorry

/-- **N2 companion (E), the expansion identity** (U adjudicator: smallest unproved node of the
E1 group): the zero-extended type terms `cb8N` sum to the coefficient `cb8R` of
`(1+X)^a (1+2X)^b` at every integer index (both sides `0` for `k < 0`). -/
theorem cb8N_sum_eq_cb8R (a b : ℕ) (k : ℤ) :
    ∑ α ∈ Finset.range (a + 1), cb8N a b α k = cb8R a b k := by
  sorry

/-- **N2, the unconditional E1 spec on `cbGraph m`.** Cycle 3 U2's five clauses for `cb8E1Arc`
at `p* = (16m+4)/3` with `F = favorableLeaves (cbGraph m) p*` — (1) nonnegativity, (2) deletion
support, (3) rows `= w` on `r`-free sources, (4) columns `= ρ_q · w` on `r`-free targets with
`q ≥ 1`, (5) zero columns on targets with `r` or `q = 0` — with U2's `hfav` and all four named
hypotheses REMOVED (C2-LA3 supplies `hfav`; N1, (E) and C3-LA1's algebra discharge the rest).
Conclusion text copied byte-for-byte from U2's `E1FlowConstruction.lean` lines 272-287. -/
theorem cb8E1Arc_spec_topRank (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2) :
    let p := (16 * m + 4) / 3
    let F := favorableLeaves (cbGraph m) p
    let f := cb8E1Arc m p F
    (∀ B A, 0 ≤ f B A) ∧
    (∀ B A, f B A ≠ 0 →
        B ∈ indepFamily (cbGraph m) (p + 1) ∧ A ∈ indepFamily (cbGraph m) p ∧
        cbVertex m 0 ∉ B ∧ ∃ x ∈ B, A = B.erase x) ∧
    (∀ B ∈ indepFamily (cbGraph m) (p + 1), cbVertex m 0 ∉ B →
        ∑ A ∈ indepFamily (cbGraph m) p, f B A = (activeWeight (cbGraph m) F B : ℚ)) ∧
    (∀ A ∈ indepFamily (cbGraph m) p, cbVertex m 0 ∉ A → 1 ≤ cbOpenChokeCount m A →
        ∑ B ∈ indepFamily (cbGraph m) (p + 1), f B A =
          cb8Rho (8 * cbOpenChokeCount m A - 1) (8 * (m - cbOpenChokeCount m A) + 1)
            (((16 * m + 4) / 3 - cbOpenChokeCount m A : ℕ) : ℤ) *
            (activeWeight (cbGraph m) F A : ℚ)) ∧
    (∀ A ∈ indepFamily (cbGraph m) p, (cbVertex m 0 ∈ A ∨ cbOpenChokeCount m A = 0) →
        ∑ B ∈ indepFamily (cbGraph m) (p + 1), f B A = 0) := by
  sorry

open Classical in
/-- **N3, the sector flow `g_sec` (definition; the gate's single frozen copy).** On a sector
source `B` (`r, v ∈ B`, `B ∈ I_(p*+1)`) and a literal arc `B → A`: `cb8Pb m (state_i B).1` on
each `b`-leg deletion at choke `i` (`B \ A = {b_ij}`), `cb8Pc m (state_i B).1` on each `c`-leg
deletion (`B \ A = {c_ij}`), `cb8Sigma m γ` on the `u_i`-switch (`A \ B = {u_i}`) when
`state_i B = (1, γ)` with `γ ≥ 1`, and `0` elsewhere. States are read through Cycle 2 U2's
`chokeState` (no fourth copy). Arc labels are read off the pair by set difference (SR-C3-2 (1)):
at most one summand is nonzero on any pair. -/
noncomputable def cb8GSec (m : ℕ) (B A : Finset (Fin (17 * m + 3))) : ℚ :=
  if h : IsSectorSource m B ∧ B ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1) ∧
      transportRel (cbGraph m) B A then
    ∑ i : Fin m,
      ((∑ j ∈ Finset.range 8,
          ((if B \ A = {cbVertex m (3 + 17 * (i : ℕ) + 1 + 2 * j)} then
              cb8Pb m (chokeState m B h.1 i).1 else 0) +
            (if B \ A = {cbVertex m (3 + 17 * (i : ℕ) + 2 + 2 * j)} then
              cb8Pc m (chokeState m B h.1 i).1 else 0))) +
        (if A \ B = {cbVertex m (3 + 17 * (i : ℕ))} ∧
            ((chokeState m B h.1 i).1.1 = 1 ∧ 1 ≤ (chokeState m B h.1 i).1.2) then
          cb8Sigma m (chokeState m B h.1 i).1.2 else 0))
  else 0

/-- **N3 companion, `g_sec` sign and support** on the class: nonnegative (C1-LA1 conclusion (i))
and zero off `transportRel` (the definition's guard). -/
theorem cb8GSec_nonneg_and_support (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2) :
    (∀ B A : Finset (Fin (17 * m + 3)), 0 ≤ cb8GSec m B A) ∧
    (∀ B A : Finset (Fin (17 * m + 3)), ¬ transportRel (cbGraph m) B A → cb8GSec m B A = 0) := by
  sorry

/-- **N3, the image-in-layer lemma** (the synthesis's smallest unproved sector lemma, R-6). For a
sector source `B ∈ I_(p*+1)`: every deletion `B.erase x` is a `transportRel` image in `I_p*`;
and at a choke with `β_i = 1`, `u_i ∉ B`, `|N(u_i) ∩ B| = 2` (`r` and the one support), and the
`u_i`-switch image `insert u_i (B \ N(u_i))` is a `transportRel` image in `I_p*`. -/
theorem cb8_sector_arcImages_mem_layer (m : ℕ) (B : Finset (Fin (17 * m + 3)))
    (hB : B ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1)) (hr : cbVertex m 0 ∈ B)
    (hv : cbVertex m 2 ∈ B) :
    (∀ x ∈ B, B.erase x ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3) ∧
      transportRel (cbGraph m) B (B.erase x)) ∧
    (∀ i < m, chokeBeta m B i = 1 →
      cbVertex m (3 + 17 * i) ∉ B ∧
      ((cbGraph m).neighborFinset (cbVertex m (3 + 17 * i)) ∩ B).card = 2 ∧
      insert (cbVertex m (3 + 17 * i)) (B \ (cbGraph m).neighborFinset (cbVertex m (3 + 17 * i))) ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3) ∧
      transportRel (cbGraph m) B (insert (cbVertex m (3 + 17 * i)) (B \ (cbGraph m).neighborFinset (cbVertex m (3 + 17 * i))))) := by
  sorry

/-- **N3, the leg count** `Σ_i (β_i + γ_i) = |B| - 2`, written subtraction-free, read through
`chokeState` (draft proof: Cycle 2 U2 `sector_legCount_eq_card_sub_two`, not copied). -/
theorem cb8_sector_legCount (m : ℕ) (hm : 0 < m) (B : Finset (Fin (17 * m + 3)))
    (hsec : IsSectorSource m B) :
    ∑ i : Fin m, ((chokeState m B hsec i).1.1 + (chokeState m B hsec i).1.2) + 2 = B.card := by
  sorry

/-- **N3, the Out bridge** (exact, before scaling, for any `m`): the row sum of `g_sec` at a
sector source is `Σ_i cb8Out m (state_i B)` (SR-C3-2 (2)). -/
theorem cb8GSec_out_eq (m : ℕ) (B : Finset (Fin (17 * m + 3)))
    (hB : B ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1)) (hsec : IsSectorSource m B) :
    ∑ A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3), cb8GSec m B A =
      ∑ i : Fin m, cb8Out m (chokeState m B hsec i) := by
  sorry

/-- **N3, Out `≥ 1`** on the class: every sector source of `I_(p*+1)` sends at least `1` under
`g_sec` (Out bridge, leg total `K = (16m+1)/3`, C1-LA1 conclusion (ii)). -/
theorem cb8GSec_out_ge_one (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2) :
    ∀ B ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), cbVertex m 0 ∈ B → cbVertex m 2 ∈ B →
      1 ≤ ∑ A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3), cb8GSec m B A := by
  sorry

/-- **N4, the In bridge** (exact, before scaling, for any `m`): on an in-sector target
`A ∈ I_p*` (`r, v ∈ A`) the column sum of `g_sec` is `Σ_i cb8In m (state_i A)`; the only other
literal preimages (switches at `r` from non-sector sources) carry `0` (SR-C3-2 (3)). -/
theorem cb8GSec_in_eq (m : ℕ) (A : Finset (Fin (17 * m + 3)))
    (hA : A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3)) (hsec : IsSectorSource m A) :
    ∑ B ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), cb8GSec m B A =
      ∑ i : Fin m, cb8In m (chokeState m A hsec i) := by
  sorry

/-- **N4, In `≤ 1`** on the class: every in-sector target of `I_p*` receives at most `1` under
`g_sec` (In bridge, leg total `K - 1`, C1-LA1 conclusion (iii)). -/
theorem cb8GSec_in_le_one (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2) :
    ∀ A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3), cbVertex m 0 ∈ A → cbVertex m 2 ∈ A →
      ∑ B ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), cb8GSec m B A ≤ 1 := by
  sorry

/-- **N4, the zero classes** (SR-C3-2 (5)): `g_sec` vanishes on every non-sector source (so the
switch-at-`r` arcs into in-sector targets carry `0`) and on every weight-zero target; on a
sector source it vanishes on the deletions of `r` and `v`, the switch at `s`, and every switch
at a choke in state `(1, 0)`. -/
theorem cb8GSec_zero_classes (m : ℕ) :
    (∀ B A : Finset (Fin (17 * m + 3)), ¬ (cbVertex m 0 ∈ B ∧ cbVertex m 2 ∈ B) → cb8GSec m B A = 0) ∧
    (∀ B A : Finset (Fin (17 * m + 3)),
      activeWeight (cbGraph m) (C5LA1.leafSet (cbGraph m)) A = 0 → cb8GSec m B A = 0) ∧
    (∀ B : Finset (Fin (17 * m + 3)), cbVertex m 0 ∈ B → cbVertex m 2 ∈ B →
      cb8GSec m B (B.erase (cbVertex m 0)) = 0 ∧
      cb8GSec m B (B.erase (cbVertex m 2)) = 0 ∧
      cb8GSec m B (insert (cbVertex m 1) (B \ (cbGraph m).neighborFinset (cbVertex m 1))) = 0 ∧
      ∀ i < m, chokeBeta m B i = 1 → chokeGamma m B i = 0 →
        cb8GSec m B (insert (cbVertex m (3 + 17 * i)) (B \ (cbGraph m).neighborFinset (cbVertex m (3 + 17 * i)))) = 0) := by
  sorry

open Classical in
/-- **N5, A2 (census).** If `A ∈ I_p*` contains `v` and exactly one choke `u_i`, its sector
preimages in `I_(p*+1)` are exactly the `8 - γ` sets `(A \ {u_i}) ∪ {r, b_ij}` over the legs
with `c_ij ∉ A` (`γ = chokeGamma m A i`), each in state `(1, γ)` at choke `i`. -/
theorem cb8_sector_switchPreimages (m : ℕ) (A : Finset (Fin (17 * m + 3)))
    (hA : A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3)) (hv : cbVertex m 2 ∈ A)
    (hq : cbOpenChokeCount m A = 1) (i : ℕ) (hi : i < m) (hu : cbVertex m (3 + 17 * i) ∈ A) :
    (indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1)).filter
        (fun B => cbVertex m 0 ∈ B ∧ cbVertex m 2 ∈ B ∧ transportRel (cbGraph m) B A) =
      ((Finset.range 8).filter (fun j => cbVertex m (3 + 17 * i + 2 + 2 * j) ∉ A)).image
        (fun j => insert (cbVertex m 0)
          (insert (cbVertex m (3 + 17 * i + 1 + 2 * j)) (A.erase (cbVertex m (3 + 17 * i))))) ∧
    ((indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1)).filter
        (fun B => cbVertex m 0 ∈ B ∧ cbVertex m 2 ∈ B ∧ transportRel (cbGraph m) B A)).card + chokeGamma m A i = 8 ∧
    ∀ B ∈ (indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1)).filter
        (fun B => cbVertex m 0 ∈ B ∧ cbVertex m 2 ∈ B ∧ transportRel (cbGraph m) B A),
      chokeBeta m B i = 1 ∧ chokeGamma m B i = chokeGamma m A i := by
  sorry

/-- **N5, A2 (inflow) and the no-preimage classes.** A target of `I_p*` with `v` and exactly one
choke `u_i` receives `(8 - γ) · σ(γ)` under `g_sec` (`γ = chokeGamma m A i`; `0` at `γ ∈ {0, 8}`);
a target with two or more chokes, or with one choke and no `v`, receives `0`. -/
theorem cb8GSec_switchImage_inflow (m : ℕ) :
    (∀ A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3), cbVertex m 2 ∈ A →
      cbOpenChokeCount m A = 1 → ∀ i < m, cbVertex m (3 + 17 * i) ∈ A →
        ∑ B ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), cb8GSec m B A =
          (8 - (chokeGamma m A i : ℚ)) * cb8Sigma m (chokeGamma m A i)) ∧
    (∀ A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3),
      (2 ≤ cbOpenChokeCount m A ∨ (cbOpenChokeCount m A = 1 ∧ cbVertex m 2 ∉ A)) →
        ∑ B ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), cb8GSec m B A = 0) := by
  sorry

/-- **N6, the exact weight formula on `leafSet`** (R-8's object of record; subsumes entry 608 and
both `hZeroChoke`): `w(B) = [v, r ∈ B] + Σ_(i<m) [u_i ∈ B] · #{j : c_ij ∈ B}` for every finset
`B`, with `#{j : c_ij ∈ B}` the carried `chokeGamma`. `0 < m` is load-bearing (SR-C3-3). -/
theorem cb8_activeWeight_leafSet_eq (m : ℕ) (hm : 0 < m) :
    ∀ B : Finset (Fin (17 * m + 3)),
      activeWeight (cbGraph m) (C5LA1.leafSet (cbGraph m)) B =
        (if cbVertex m 2 ∈ B ∧ cbVertex m 0 ∈ B then 1 else 0) +
          ∑ i ∈ Finset.range m, if cbVertex m (3 + 17 * i) ∈ B then chokeGamma m B i else 0 := by
  sorry

/-- **N7 companion, the ρ₁ link.** U2's `cb8Rho` at `q = 1` in the E1 spec's clause-(4) syntax
(`8 * q - 1`, `8 * (m - q) + 1`, `((p* - q : ℕ) : ℤ)` at `q = 1`) equals C1-LA1's residual ratio
`cb8R1 m K / cb8R1 m (K - 1)`, `K = (16m+1)/3` (entry 111's syntax), so N7 can compose the E1
load `ρ₁ γ` with C1-LA1's Residual `θ ≤ 1 - ρ₁`. (C3-LA1 proved the same value link in its `e1Rho`
vocabulary; the critics C-T2-F/C-T2-U compiled it in scratch.) -/
theorem cb8Rho_one_eq_cb8R1_ratio (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2) :
    cb8Rho (8 * 1 - 1) (8 * (m - 1) + 1) (((16 * m + 4) / 3 - 1 : ℕ) : ℤ) =
      (cb8R1 m ((16 * m + 1) / 3) : ℚ) / (cb8R1 m ((16 * m + 1) / 3 - 1) : ℚ) := by
  sorry

/-- **N7, the per-class composition** "E1 spec ∧ `g_sec` spec ⇒ Out-`≥`/In-`≤` bundle for
`cb8E1Arc + g_sec`". Its hypotheses are, byte-for-byte, the CONCLUSIONS of N2
(`cb8E1Arc_spec_topRank`), N3 (`cb8GSec_nonneg_and_support`, `cb8GSec_out_ge_one`), N4
(`cb8GSec_in_le_one`, `cb8GSec_zero_classes`), N5 (`cb8GSec_switchImage_inflow`) and N6
(`cb8_activeWeight_leafSet_eq`) — per-arc specs, never a flow's existence or conjunct 4 (R-9).
The proof may use carried formal facts only: C1-LA1's terminal (Switch, Residual), C2-LA3
(`favorableLeaves = leafSet`), `cb8Rho_lt_one_topRank`, and the companion `cb8Rho_one_eq_cb8R1_ratio`. The
conclusion is the hypothesis list of Cycle 2 U2's `exists_saturatingFlow_of_ratFlow_bound` at
`G := cbGraph m`, `F := favorableLeaves (cbGraph m) p*`, `g := cb8E1Arc + cb8GSec`. -/
theorem cb8_flowBundle_of_arcSpecs (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2)
    (hE1 :
    let p := (16 * m + 4) / 3
    let F := favorableLeaves (cbGraph m) p
    let f := cb8E1Arc m p F
    (∀ B A, 0 ≤ f B A) ∧
    (∀ B A, f B A ≠ 0 →
        B ∈ indepFamily (cbGraph m) (p + 1) ∧ A ∈ indepFamily (cbGraph m) p ∧
        cbVertex m 0 ∉ B ∧ ∃ x ∈ B, A = B.erase x) ∧
    (∀ B ∈ indepFamily (cbGraph m) (p + 1), cbVertex m 0 ∉ B →
        ∑ A ∈ indepFamily (cbGraph m) p, f B A = (activeWeight (cbGraph m) F B : ℚ)) ∧
    (∀ A ∈ indepFamily (cbGraph m) p, cbVertex m 0 ∉ A → 1 ≤ cbOpenChokeCount m A →
        ∑ B ∈ indepFamily (cbGraph m) (p + 1), f B A =
          cb8Rho (8 * cbOpenChokeCount m A - 1) (8 * (m - cbOpenChokeCount m A) + 1)
            (((16 * m + 4) / 3 - cbOpenChokeCount m A : ℕ) : ℤ) *
            (activeWeight (cbGraph m) F A : ℚ)) ∧
    (∀ A ∈ indepFamily (cbGraph m) p, (cbVertex m 0 ∈ A ∨ cbOpenChokeCount m A = 0) →
        ∑ B ∈ indepFamily (cbGraph m) (p + 1), f B A = 0))
    (hSec :
    (∀ B A : Finset (Fin (17 * m + 3)), 0 ≤ cb8GSec m B A) ∧
    (∀ B A : Finset (Fin (17 * m + 3)), ¬ transportRel (cbGraph m) B A → cb8GSec m B A = 0))
    (hOut :
    ∀ B ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), cbVertex m 0 ∈ B → cbVertex m 2 ∈ B →
      1 ≤ ∑ A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3), cb8GSec m B A)
    (hIn :
    ∀ A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3), cbVertex m 0 ∈ A → cbVertex m 2 ∈ A →
      ∑ B ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), cb8GSec m B A ≤ 1)
    (hZero :
    (∀ B A : Finset (Fin (17 * m + 3)), ¬ (cbVertex m 0 ∈ B ∧ cbVertex m 2 ∈ B) → cb8GSec m B A = 0) ∧
    (∀ B A : Finset (Fin (17 * m + 3)),
      activeWeight (cbGraph m) (C5LA1.leafSet (cbGraph m)) A = 0 → cb8GSec m B A = 0) ∧
    (∀ B : Finset (Fin (17 * m + 3)), cbVertex m 0 ∈ B → cbVertex m 2 ∈ B →
      cb8GSec m B (B.erase (cbVertex m 0)) = 0 ∧
      cb8GSec m B (B.erase (cbVertex m 2)) = 0 ∧
      cb8GSec m B (insert (cbVertex m 1) (B \ (cbGraph m).neighborFinset (cbVertex m 1))) = 0 ∧
      ∀ i < m, chokeBeta m B i = 1 → chokeGamma m B i = 0 →
        cb8GSec m B (insert (cbVertex m (3 + 17 * i)) (B \ (cbGraph m).neighborFinset (cbVertex m (3 + 17 * i)))) = 0))
    (hSw :
    (∀ A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3), cbVertex m 2 ∈ A →
      cbOpenChokeCount m A = 1 → ∀ i < m, cbVertex m (3 + 17 * i) ∈ A →
        ∑ B ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), cb8GSec m B A =
          (8 - (chokeGamma m A i : ℚ)) * cb8Sigma m (chokeGamma m A i)) ∧
    (∀ A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3),
      (2 ≤ cbOpenChokeCount m A ∨ (cbOpenChokeCount m A = 1 ∧ cbVertex m 2 ∉ A)) →
        ∑ B ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), cb8GSec m B A = 0))
    (hW :
    ∀ B : Finset (Fin (17 * m + 3)),
      activeWeight (cbGraph m) (C5LA1.leafSet (cbGraph m)) B =
        (if cbVertex m 2 ∈ B ∧ cbVertex m 0 ∈ B then 1 else 0) +
          ∑ i ∈ Finset.range m, if cbVertex m (3 + 17 * i) ∈ B then chokeGamma m B i else 0) :
    let p := (16 * m + 4) / 3
    let F := favorableLeaves (cbGraph m) p
    let g : Finset (Fin (17 * m + 3)) → Finset (Fin (17 * m + 3)) → ℚ :=
      fun B A => cb8E1Arc m p F B A + cb8GSec m B A
    (∀ B A, 0 ≤ g B A) ∧
    (∀ B A, ¬ transportRel (cbGraph m) B A → g B A = 0) ∧
    (∀ B ∈ indepFamily (cbGraph m) (p + 1),
      (activeWeight (cbGraph m) F B : ℚ) ≤ ∑ A ∈ indepFamily (cbGraph m) p, g B A) ∧
    (∀ A ∈ indepFamily (cbGraph m) p,
      ∑ B ∈ indepFamily (cbGraph m) (p + 1), g B A ≤ (activeWeight (cbGraph m) F A : ℚ)) := by
  sorry

/-- **N8, the bundle ⇒ conjunct 4** (the compiled Out-`≥` interface, Cycle 2 U2
`weightedHall_of_ratFlow_bound`, then r30's `exists_saturatingFlow_of_weightedHall`, entries
30-31, which are NOT in this base and must be carried for the proof). The hypothesis is N7's
conclusion byte-for-byte. Not the reserved terminal and not an alias of it: the hypothesis is a
property of the one named function `cb8E1Arc + cb8GSec`, not the existence of a flow. -/
theorem cb8_conjunct4_of_flowBundle (m : ℕ)
    (hbundle :
    let p := (16 * m + 4) / 3
    let F := favorableLeaves (cbGraph m) p
    let g : Finset (Fin (17 * m + 3)) → Finset (Fin (17 * m + 3)) → ℚ :=
      fun B A => cb8E1Arc m p F B A + cb8GSec m B A
    (∀ B A, 0 ≤ g B A) ∧
    (∀ B A, ¬ transportRel (cbGraph m) B A → g B A = 0) ∧
    (∀ B ∈ indepFamily (cbGraph m) (p + 1),
      (activeWeight (cbGraph m) F B : ℚ) ≤ ∑ A ∈ indepFamily (cbGraph m) p, g B A) ∧
    (∀ A ∈ indepFamily (cbGraph m) p,
      ∑ B ∈ indepFamily (cbGraph m) (p + 1), g B A ≤ (activeWeight (cbGraph m) F A : ℚ))) :
    ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f := by
  sorry

end E993Transport
