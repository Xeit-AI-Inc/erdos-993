import LeanProof.RTreeBase

/-!
# Order-243 counterexample to the Erdős-993 `(β)` target

This module builds, on top of the governed `RTree` model inherited byte-for-byte
as `LeanProof.RTreeBase`, the closed order-243 rooted tree `Order243.T60` and
proves `RTree.BetaCounterexample T60 [0,0] 90`, hence `¬ RTree.BetaTarget`.

Nothing here modifies the inherited model: every definition of the model
(`RTree`, `indepCountOn`, `Delta`, `a`, `b`, `Bgen`, `crossingIndex`, `K_A`,
`BetaTarget`, `BetaCounterexample`) is used exactly as inherited.
-/

namespace Order243

open Polynomial
open scoped Classical

set_option maxRecDepth 20000

/-! ## Part 0 — A kernel-computable coefficient-list layer

Independence counts are natural numbers, so all exact arithmetic below is
carried out on `List ℕ` with `Nat` literals (which the kernel reduces
efficiently). Truncation at `N = 92` keeps every list short: no rank above
`91` is ever needed. -/

/-- `cf l r` is the `r`-th entry of the coefficient list `l` (`0` past the end). -/
def cf : List ℕ → ℕ → ℕ
  | [], _ => 0
  | x :: _, 0 => x
  | _ :: l, r + 1 => cf l r

/-- Pointwise (padded) addition of coefficient lists. -/
def pad : List ℕ → List ℕ → List ℕ
  | [], b => b
  | a, [] => a
  | x :: xs, y :: ys => (x + y) :: pad xs ys

/-- Scalar multiple of a coefficient list. -/
def smul (k : ℕ) : List ℕ → List ℕ
  | [] => []
  | x :: xs => (k * x) :: smul k xs

/-- Truncation length: only ranks `< 92` are ever inspected. -/
def N : ℕ := 92

@[simp] theorem cf_nil (r : ℕ) : cf [] r = 0 := rfl
@[simp] theorem cf_cons_zero (x : ℕ) (l : List ℕ) : cf (x :: l) 0 = x := rfl
@[simp] theorem cf_cons_succ (x : ℕ) (l : List ℕ) (r : ℕ) : cf (x :: l) (r + 1) = cf l r := rfl

theorem cf_pad : ∀ (a b : List ℕ) (r : ℕ), cf (pad a b) r = cf a r + cf b r
  | [], b, r => by simp [pad]
  | _ :: _, [], r => by simp [pad]
  | x :: xs, y :: ys, 0 => by simp [pad]
  | x :: xs, y :: ys, r + 1 => by simp [pad, cf_pad xs ys r]

theorem cf_smul (k : ℕ) : ∀ (l : List ℕ) (r : ℕ), cf (smul k l) r = k * cf l r
  | [], r => by simp [smul]
  | x :: xs, 0 => by simp [smul]
  | x :: xs, r + 1 => by simp [smul, cf_smul k xs r]

theorem cf_take : ∀ (n : ℕ) (l : List ℕ) (r : ℕ), r < n → cf (l.take n) r = cf l r
  | 0, _, _, h => absurd h (Nat.not_lt_zero _)
  | n + 1, [], r, _ => by simp
  | n + 1, x :: xs, 0, _ => by simp
  | n + 1, x :: xs, r + 1, h => by
      have : r < n := Nat.lt_of_succ_lt_succ h
      simp [List.take_succ_cons, cf_take n xs r this]

/-! ### The three coefficient lists we need -/

/-- One multiplication by `1 + 4X + 3X² + X³` (the star's independence
polynomial), truncated. -/
def stepStar (l : List ℕ) : List ℕ :=
  (pad l (0 :: pad (smul 4 l) (0 :: pad (smul 3 l) (0 :: l)))).take N

/-- Coefficients of `(1 + 4X + 3X² + X³) ^ k`, truncated to `N` terms. -/
def Plist : ℕ → List ℕ
  | 0 => [1]
  | k + 1 => stepStar (Plist k)

/-- One multiplication by `1 + X`, truncated. -/
def stepOne (l : List ℕ) : List ℕ := (pad l (0 :: l)).take N

/-- Coefficients of `(1 + X) ^ m`, truncated: the binomial row `C(m, ·)`. -/
def Blist : ℕ → List ℕ
  | 0 => [1]
  | m + 1 => stepOne (Blist m)

/-- `P` = independence polynomial of sixty disjoint three-leaf stars. -/
def Pl : List ℕ := Plist 60

/-- `(1 + 2X)·P`: the coefficients of `i_r(T60 − root)`. -/
def ET : List ℕ := (pad Pl (0 :: smul 2 Pl)).take N

/-- `(1 + X)·P`: the coefficients of `i_r((T60 − v) − root)`. -/
def EV : List ℕ := (pad Pl (0 :: smul 1 Pl)).take N

/-- `i_r(T60)`. -/
def iT : List ℕ := pad ET (0 :: Blist 181)

/-- `i_r(T60 − v)`. -/
def iV : List ℕ := pad EV (0 :: Blist 180)

/-- `nondecTo l k` is `true` iff `cf l j ≤ cf l (j+1)` for every `j < k`. -/
def nondecTo (l : List ℕ) : ℕ → Bool
  | 0 => true
  | k + 1 => nondecTo l k && decide (cf l k ≤ cf l (k + 1))

theorem nondecTo_spec (l : List ℕ) :
    ∀ (k : ℕ), nondecTo l k = true → ∀ j < k, cf l j ≤ cf l (j + 1)
  | 0, _, j, hj => absurd hj (Nat.not_lt_zero _)
  | k + 1, h, j, hj => by
      rw [nondecTo, Bool.and_eq_true, decide_eq_true_eq] at h
      rcases Nat.lt_succ_iff_lt_or_eq.mp hj with hj' | rfl
      · exact nondecTo_spec l k h.1 j hj'
      · exact h.2

/-! ## Part 1 — The bridge to `Polynomial ℤ` coefficients -/

/-- `1 + 4X + 3X² + X³`, the independence polynomial of a three-leaf star. -/
noncomputable def starPoly : ℤ[X] := 1 + C 4 * X + C 3 * X ^ 2 + X ^ 3

/-- `l` represents `p` on every rank below `N`. -/
def Rep (l : List ℕ) (p : ℤ[X]) : Prop := ∀ r, r < N → p.coeff r = (cf l r : ℤ)

theorem coeff_mul_X_one (p : ℤ[X]) (r : ℕ) :
    (p * X).coeff r = if 1 ≤ r then p.coeff (r - 1) else 0 := by
  have := Polynomial.coeff_mul_X_pow' p 1 r
  simpa using this

theorem rep_one : Rep [1] 1 := by
  intro r _
  rcases r with _ | r
  · simp
  · simp [Polynomial.coeff_one]

theorem rep_stepStar {l : List ℕ} {p : ℤ[X]} (h : Rep l p) :
    Rep (stepStar l) (starPoly * p) := by
  intro r hr
  have hexp : starPoly * p = p + C 4 * (p * X) + C 3 * (p * X ^ 2) + p * X ^ 3 := by
    simp only [starPoly]; ring
  have hcf : cf (stepStar l) r
      = cf l r + cf (0 :: pad (smul 4 l) (0 :: pad (smul 3 l) (0 :: l))) r := by
    rw [stepStar, cf_take N _ r hr, cf_pad]
  rw [hexp, hcf]
  simp only [Polynomial.coeff_add, Polynomial.coeff_C_mul,
    Polynomial.coeff_mul_X_pow', coeff_mul_X_one]
  rcases r with _ | _ | _ | k
  · have h0 := h 0 (by omega)
    simp [cf_pad, cf_smul, h0]
  · have h0 := h 0 (by omega)
    have h1 := h 1 (by omega)
    simp [cf_pad, cf_smul, h0, h1]
  · have h0 := h 0 (by omega)
    have h1 := h 1 (by omega)
    have h2 := h 2 (by omega)
    simp [cf_pad, cf_smul, h0, h1, h2]
    ring
  · have h0 := h k (by omega)
    have h1 := h (k + 1) (by omega)
    have h2 := h (k + 2) (by omega)
    have h3 := h (k + 3) (by omega)
    simp [cf_pad, cf_smul, h0, h1, h2, h3]
    ring

theorem rep_stepK (k : ℕ) {l : List ℕ} {p : ℤ[X]} (h : Rep l p) :
    Rep ((pad l (0 :: smul k l)).take N) ((1 + C ((k : ℕ) : ℤ) * X) * p) := by
  intro r hr
  have hexp : (1 + C ((k : ℕ) : ℤ) * X) * p = p + C ((k : ℕ) : ℤ) * (p * X) := by ring
  rw [hexp, cf_take N _ r hr, cf_pad]
  simp only [Polynomial.coeff_add, Polynomial.coeff_C_mul, coeff_mul_X_one]
  rcases r with _ | j
  · have h0 := h 0 (by omega)
    simp [h0]
  · have hj := h j (by omega)
    have hj1 := h (j + 1) (by omega)
    simp [cf_smul, hj, hj1]

theorem rep_Plist (k : ℕ) : Rep (Plist k) (starPoly ^ k) := by
  induction k with
  | zero => simpa [Plist] using rep_one
  | succ k ih =>
      have := rep_stepStar ih
      simpa [Plist, pow_succ, mul_comm] using this

/-- The binomial row is exactly what `Blist` computes. -/
theorem cf_Blist (m : ℕ) : ∀ r, r < N → cf (Blist m) r = Nat.choose m r := by
  induction m with
  | zero =>
      intro r _
      rcases r with _ | r <;> simp [Blist]
  | succ m ih =>
      intro r hr
      rw [Blist, stepOne, cf_take N _ r hr, cf_pad]
      rcases r with _ | k
      · simp [ih 0 (by omega)]
      · have hk : k < N := by omega
        have hk1 : k + 1 < N := hr
        simp only [cf_cons_succ]
        rw [ih (k + 1) hk1, ih k hk, Nat.choose_succ_succ']
        omega

/-! ## Part 2 — Generic facts about the inherited model -/

/-- `indepCountOn` only sees the ambient tree through `IndepSet`, which for
subsets of a common carrier is the same condition in either tree. -/
theorem indepCountOn_congr {t t' : RTree} {V : Finset (List ℕ)}
    (h : V ⊆ t.vertices) (h' : V ⊆ t'.vertices) (r : ℕ) :
    t.indepCountOn V r = t'.indepCountOn V r := by
  unfold RTree.indepCountOn
  congr 1
  apply Finset.filter_congr
  intro S hS
  rw [Finset.mem_powerset] at hS
  constructor
  · rintro ⟨⟨-, hpw⟩, hc⟩; exact ⟨⟨hS.trans h', hpw⟩, hc⟩
  · rintro ⟨⟨-, hpw⟩, hc⟩; exact ⟨⟨hS.trans h, hpw⟩, hc⟩

/-- On a carrier that is itself independent, every subset is independent, so the
count is a plain binomial coefficient. -/
theorem indepCountOn_of_indep (t : RTree) {V : Finset (List ℕ)}
    (h : t.IndepSet V) (r : ℕ) : t.indepCountOn V r = Nat.choose V.card r := by
  unfold RTree.indepCountOn
  have hfil : V.powerset.filter (fun S => t.IndepSet S ∧ S.card = r)
      = V.powerset.filter (fun S => S.card = r) := by
    apply Finset.filter_congr
    intro S hS
    rw [Finset.mem_powerset] at hS
    exact ⟨fun h' => h'.2, fun h' => ⟨h.mono hS, h'⟩⟩
  rw [hfil, ← Finset.powersetCard_eq_filter, Finset.card_powersetCard]

theorem indepCountOn_empty (t : RTree) (k : ℕ) :
    t.indepCountOn (∅ : Finset (List ℕ)) k = if k = 0 then 1 else 0 := by
  rcases k with _ | k
  · simp [t.indepCountOn_zero]
  · have hlt : (∅ : Finset (List ℕ)).card < k + 1 := by simp
    simp [t.indepCountOn_eq_zero_of_card_lt (∅ : Finset (List ℕ)) hlt]

/-- Membership in `(RTree.node cs).vertices`, restated with a plain `ℕ` index so
that `List.getElem` lemmas apply directly. -/
theorem mem_node_iff (cs : List RTree) (w : List ℕ) :
    w ∈ (RTree.node cs).vertices ↔
      w = [] ∨ ∃ i, ∃ h : i < cs.length, ∃ p ∈ (cs[i]'h).vertices, w = i :: p := by
  rw [RTree.mem_vertices_node]
  constructor
  · rintro (h | ⟨i, p, hp, rfl⟩)
    · exact Or.inl h
    · exact Or.inr ⟨i.1, i.2, p, by simpa [List.get_eq_getElem] using hp, rfl⟩
  · rintro (h | ⟨i, hi, p, hp, rfl⟩)
    · exact Or.inl h
    · exact Or.inr ⟨⟨i, hi⟩, p, by simpa [List.get_eq_getElem] using hp, rfl⟩

/-- Addresses of equal length are never adjacent. -/
theorem not_addrAdjacent_of_length_eq {u w : List ℕ} (h : u.length = w.length) :
    ¬ addrAdjacent u w := by
  unfold addrAdjacent
  rintro (⟨hne, hu⟩ | ⟨hne, hw⟩)
  · have h1 : 0 < w.length := List.length_pos_of_ne_nil hne
    have h2 : u.length = w.length - 1 := by rw [hu]; exact List.length_dropLast
    omega
  · have h1 : 0 < u.length := List.length_pos_of_ne_nil hne
    have h2 : w.length = u.length - 1 := by rw [hw]; exact List.length_dropLast
    omega

/-! ## Part 3 — Stars, and their independence polynomials -/

def leaf : RTree := RTree.node []

/-- The rooted star with `m` leaf children. -/
def starTree (m : ℕ) : RTree := RTree.node (List.replicate m leaf)

def markedArm : RTree := starTree 1
def star13 : RTree := starTree 3

theorem leaf_vertices : leaf.vertices = {([] : List ℕ)} := RTree.vertices_leaf

theorem mem_starTree (m : ℕ) (w : List ℕ) :
    w ∈ (starTree m).vertices ↔ w = [] ∨ ∃ i < m, w = [i] := by
  rw [starTree, mem_node_iff]
  constructor
  · rintro (h | ⟨i, hi, p, hp, rfl⟩)
    · exact Or.inl h
    · rw [List.getElem_replicate, leaf_vertices, Finset.mem_singleton] at hp
      subst hp
      rw [List.length_replicate] at hi
      exact Or.inr ⟨i, hi, rfl⟩
  · rintro (h | ⟨i, hi, rfl⟩)
    · exact Or.inl h
    · refine Or.inr ⟨i, by simpa using hi, [], ?_, rfl⟩
      rw [List.getElem_replicate, leaf_vertices]
      simp

theorem starTree_erase_root (m : ℕ) :
    (starTree m).vertices.erase [] = (Finset.range m).image (fun i => [i]) := by
  ext w
  rw [Finset.mem_erase, Finset.mem_image]
  simp only [Finset.mem_range]
  constructor
  · rintro ⟨hne, hmem⟩
    rcases (mem_starTree m w).mp hmem with rfl | ⟨i, hi, rfl⟩
    · exact absurd rfl hne
    · exact ⟨i, hi, rfl⟩
  · rintro ⟨i, hi, rfl⟩
    exact ⟨by simp, (mem_starTree m _).mpr (Or.inr ⟨i, hi, rfl⟩)⟩

theorem starTree_erase_root_card (m : ℕ) : ((starTree m).vertices.erase []).card = m := by
  rw [starTree_erase_root, Finset.card_image_of_injective _ (by
    intro a b hab
    simpa using hab), Finset.card_range]

theorem starTree_indep_erase (m : ℕ) :
    (starTree m).IndepSet ((starTree m).vertices.erase []) := by
  refine ⟨Finset.erase_subset _ _, ?_⟩
  intro u hu w hw
  rw [starTree_erase_root, Finset.mem_image] at hu hw
  obtain ⟨i, -, rfl⟩ := hu
  obtain ⟨j, -, rfl⟩ := hw
  exact not_addrAdjacent_of_length_eq rfl

theorem starTree_nbhd_root (m : ℕ) :
    (starTree m).vertices \ (starTree m).closedNbhd [] = ∅ := by
  rw [Finset.sdiff_eq_empty_iff_subset]
  intro w hw
  rw [RTree.mem_closedNbhd_iff]
  refine ⟨hw, ?_⟩
  rcases (mem_starTree m w).mp hw with rfl | ⟨i, -, rfl⟩
  · exact Or.inl rfl
  · exact Or.inr ((addrAdjacent_nil_iff _).mpr rfl)

theorem indepPoly_starTree (m : ℕ) : (starTree m).indepPoly = (1 + X) ^ m + X := by
  ext r
  rw [RTree.i_eq_indepPoly_coeff]
  have hroot : ([] : List ℕ) ∈ (starTree m).vertices := RTree.root_mem_vertices _
  rcases r with _ | k
  · rw [RTree.i_, RTree.indepCountOn_zero]
    simp [Polynomial.coeff_one_add_X_pow]
  · rw [RTree.i_, RTree.indepCountOn_succ _ hroot k, starTree_nbhd_root,
      indepCountOn_of_indep _ (starTree_indep_erase m), starTree_erase_root_card,
      indepCountOn_empty]
    rcases k with _ | k
    · simp [Polynomial.coeff_one_add_X_pow, Polynomial.coeff_X]
    · simp [Polynomial.coeff_one_add_X_pow, Polynomial.coeff_X]

theorem starPoly_eq : ((1 : ℤ[X]) + X) ^ 3 + X = starPoly := by
  rw [starPoly, Polynomial.C_ofNat, Polynomial.C_ofNat]; ring

theorem indepPoly_star13 : star13.indepPoly = starPoly := by
  rw [star13, indepPoly_starTree, starPoly_eq]

theorem indepPoly_markedArm : markedArm.indepPoly = 1 + C ((2 : ℕ) : ℤ) * X := by
  rw [markedArm, indepPoly_starTree]
  push_cast
  rw [Polynomial.C_ofNat]
  ring

theorem indepPoly_leaf' : leaf.indepPoly = 1 + C ((1 : ℕ) : ℤ) * X := by
  have : leaf = starTree 0 := rfl
  rw [this, indepPoly_starTree]
  simp

/-! ## Part 4 — The witness `T60`, its geometry and its carriers -/

/-- **The closed order-243 witness.** The root has a first child `[0]` carrying a
single marked leaf `[0,0]`, followed by sixty three-leaf stars. -/
def T60 : RTree := RTree.node (markedArm :: List.replicate 60 star13)

/-- The same tree with the marked leaf's arm replaced by a bare leaf: used only
to name the carrier `T60 − {v, root}` as an erase-root carrier. -/
def Tb : RTree := RTree.node (leaf :: List.replicate 60 star13)

/-- The marked leaf. -/
def vAddr : List ℕ := [0, 0]

/-- Its support. -/
def sAddr : List ℕ := [0]

theorem mem_T60 (w : List ℕ) : w ∈ T60.vertices ↔
    w = [] ∨ w = [0] ∨ w = [0, 0] ∨ (∃ i < 60, w = [i + 1]) ∨
      (∃ i < 60, ∃ j < 3, w = [i + 1, j]) := by
  rw [T60, mem_node_iff]
  constructor
  · rintro (h | ⟨i, hi, p, hp, rfl⟩)
    · exact Or.inl h
    · rcases i with _ | k
      · rw [List.getElem_cons_zero, markedArm] at hp
        rcases (mem_starTree 1 p).mp hp with rfl | ⟨j, hj, rfl⟩
        · exact Or.inr (Or.inl rfl)
        · interval_cases j
          exact Or.inr (Or.inr (Or.inl rfl))
      · rw [List.getElem_cons_succ, List.getElem_replicate, star13] at hp
        simp only [List.length_cons, List.length_replicate] at hi
        have hk : k < 60 := by omega
        rcases (mem_starTree 3 p).mp hp with rfl | ⟨j, hj, rfl⟩
        · exact Or.inr (Or.inr (Or.inr (Or.inl ⟨k, hk, rfl⟩)))
        · exact Or.inr (Or.inr (Or.inr (Or.inr ⟨k, hk, j, hj, rfl⟩)))
  · have hlen : (markedArm :: List.replicate 60 star13).length = 61 := by simp
    rintro (rfl | rfl | rfl | ⟨i, hi, rfl⟩ | ⟨i, hi, j, hj, rfl⟩)
    · exact Or.inl rfl
    · refine Or.inr ⟨0, by omega, [], ?_, rfl⟩
      rw [List.getElem_cons_zero, markedArm]
      exact (mem_starTree 1 _).mpr (Or.inl rfl)
    · refine Or.inr ⟨0, by omega, [0], ?_, rfl⟩
      rw [List.getElem_cons_zero, markedArm]
      exact (mem_starTree 1 _).mpr (Or.inr ⟨0, by omega, rfl⟩)
    · refine Or.inr ⟨i + 1, by omega, [], ?_, rfl⟩
      rw [List.getElem_cons_succ, List.getElem_replicate, star13]
      exact (mem_starTree 3 _).mpr (Or.inl rfl)
    · refine Or.inr ⟨i + 1, by omega, [j], ?_, rfl⟩
      rw [List.getElem_cons_succ, List.getElem_replicate, star13]
      exact (mem_starTree 3 _).mpr (Or.inr ⟨j, hj, rfl⟩)

theorem mem_Tb (w : List ℕ) : w ∈ Tb.vertices ↔
    w = [] ∨ w = [0] ∨ (∃ i < 60, w = [i + 1]) ∨ (∃ i < 60, ∃ j < 3, w = [i + 1, j]) := by
  rw [Tb, mem_node_iff]
  constructor
  · rintro (h | ⟨i, hi, p, hp, rfl⟩)
    · exact Or.inl h
    · rcases i with _ | k
      · rw [List.getElem_cons_zero, leaf_vertices, Finset.mem_singleton] at hp
        subst hp
        exact Or.inr (Or.inl rfl)
      · rw [List.getElem_cons_succ, List.getElem_replicate, star13] at hp
        simp only [List.length_cons, List.length_replicate] at hi
        have hk : k < 60 := by omega
        rcases (mem_starTree 3 p).mp hp with rfl | ⟨j, hj, rfl⟩
        · exact Or.inr (Or.inr (Or.inl ⟨k, hk, rfl⟩))
        · exact Or.inr (Or.inr (Or.inr ⟨k, hk, j, hj, rfl⟩))
  · rintro (rfl | rfl | ⟨i, hi, rfl⟩ | ⟨i, hi, j, hj, rfl⟩)
    · exact Or.inl rfl
    · refine Or.inr ⟨0, by simp, [], ?_, rfl⟩
      rw [List.getElem_cons_zero, leaf_vertices]
      simp
    · refine Or.inr ⟨i + 1, by simp; omega, [], ?_, rfl⟩
      rw [List.getElem_cons_succ, List.getElem_replicate, star13]
      exact (mem_starTree 3 _).mpr (Or.inl rfl)
    · refine Or.inr ⟨i + 1, by simp; omega, [j], ?_, rfl⟩
      rw [List.getElem_cons_succ, List.getElem_replicate, star13]
      exact (mem_starTree 3 _).mpr (Or.inr ⟨j, hj, rfl⟩)

theorem T60_len_le {w : List ℕ} (h : w ∈ T60.vertices) : w.length ≤ 2 := by
  rcases (mem_T60 w).mp h with rfl | rfl | rfl | ⟨i, -, rfl⟩ | ⟨i, -, j, -, rfl⟩ <;> simp

theorem root_mem_T60 : ([] : List ℕ) ∈ T60.vertices := RTree.root_mem_vertices _

theorem s_mem_T60 : sAddr ∈ T60.vertices := (mem_T60 _).mpr (Or.inr (Or.inl rfl))

theorem v_mem_T60 : vAddr ∈ T60.vertices := (mem_T60 _).mpr (Or.inr (Or.inr (Or.inl rfl)))

/-! ### The residual carriers -/

/-- The 180 star leaves. -/
def D1set : Finset (List ℕ) :=
  ((Finset.range 60) ×ˢ (Finset.range 3)).image (fun p : ℕ × ℕ => [p.1 + 1, p.2])

/-- The 181 depth-two vertices of `T60`. -/
def D2set : Finset (List ℕ) := insert vAddr D1set

theorem mem_D1set (w : List ℕ) : w ∈ D1set ↔ ∃ i < 60, ∃ j < 3, w = [i + 1, j] := by
  rw [D1set, Finset.mem_image]
  constructor
  · rintro ⟨⟨i, j⟩, hij, rfl⟩
    rw [Finset.mem_product, Finset.mem_range, Finset.mem_range] at hij
    exact ⟨i, hij.1, j, hij.2, rfl⟩
  · rintro ⟨i, hi, j, hj, rfl⟩
    exact ⟨(i, j), by rw [Finset.mem_product, Finset.mem_range, Finset.mem_range]; exact ⟨hi, hj⟩, rfl⟩

theorem D1set_len {w : List ℕ} (h : w ∈ D1set) : w.length = 2 := by
  obtain ⟨i, -, j, -, rfl⟩ := (mem_D1set w).mp h; simp

theorem D1set_card : D1set.card = 180 := by
  have hinj : Function.Injective (fun p : ℕ × ℕ => [p.1 + 1, p.2]) := by
    rintro ⟨a, b⟩ ⟨c, d⟩ h
    simp only [List.cons.injEq, List.nil_eq, and_true, Nat.add_right_cancel_iff] at h
    obtain ⟨h1, h2⟩ := h
    subst h1; subst h2; rfl
  rw [D1set, Finset.card_image_of_injective _ hinj, Finset.card_product, Finset.card_range,
    Finset.card_range]

theorem v_notMem_D1set : vAddr ∉ D1set := by
  intro h
  obtain ⟨i, -, j, -, hw⟩ := (mem_D1set _).mp h
  rw [vAddr] at hw
  simp at hw

theorem D2set_card : D2set.card = 181 := by
  rw [D2set, Finset.card_insert_of_notMem v_notMem_D1set, D1set_card]

theorem mem_closedNbhd_root (w : List ℕ) :
    w ∈ T60.closedNbhd [] ↔ w ∈ T60.vertices ∧ (w = [] ∨ w.length = 1) := by
  rw [RTree.mem_closedNbhd_iff]
  constructor
  · rintro ⟨hw, h⟩
    exact ⟨hw, h.imp id (addrAdjacent_nil_iff w).mp⟩
  · rintro ⟨hw, h⟩
    exact ⟨hw, h.imp id (addrAdjacent_nil_iff w).mpr⟩

theorem carrier_root : T60.vertices \ T60.closedNbhd [] = D2set := by
  ext w
  rw [Finset.mem_sdiff, mem_closedNbhd_root, D2set, Finset.mem_insert, mem_D1set]
  constructor
  · rintro ⟨hw, hnot⟩
    rcases (mem_T60 w).mp hw with rfl | rfl | rfl | ⟨i, hi, rfl⟩ | ⟨i, hi, j, hj, rfl⟩
    · exact absurd ⟨hw, Or.inl rfl⟩ hnot
    · exact absurd ⟨hw, Or.inr rfl⟩ hnot
    · exact Or.inl rfl
    · exact absurd ⟨hw, Or.inr rfl⟩ hnot
    · exact Or.inr ⟨i, hi, j, hj, rfl⟩
  · rintro (rfl | ⟨i, hi, j, hj, rfl⟩)
    · exact ⟨v_mem_T60, by rintro ⟨-, (h | h)⟩ <;> simp [vAddr] at h⟩
    · refine ⟨(mem_T60 _).mpr (Or.inr (Or.inr (Or.inr (Or.inr ⟨i, hi, j, hj, rfl⟩)))), ?_⟩
      rintro ⟨-, (h | h)⟩ <;> simp at h

theorem carrier_v : (T60.vertices.erase vAddr) \ T60.closedNbhd [] = D1set := by
  ext w
  rw [Finset.mem_sdiff, Finset.mem_erase]
  constructor
  · rintro ⟨⟨hne, hw⟩, hnot⟩
    have : w ∈ D2set := by
      rw [← carrier_root, Finset.mem_sdiff]; exact ⟨hw, hnot⟩
    rw [D2set, Finset.mem_insert] at this
    exact this.resolve_left hne
  · intro hw
    have h2 : w ∈ D2set := by rw [D2set, Finset.mem_insert]; exact Or.inr hw
    rw [← carrier_root, Finset.mem_sdiff] at h2
    exact ⟨⟨fun h => v_notMem_D1set (h ▸ hw), h2.1⟩, h2.2⟩

theorem carrier_D : ((T60.vertices.erase vAddr).erase sAddr) \ T60.closedNbhd [] = D1set := by
  ext w
  rw [Finset.mem_sdiff, Finset.mem_erase, ← carrier_v, Finset.mem_sdiff]
  constructor
  · rintro ⟨⟨-, hw⟩, hnot⟩; exact ⟨hw, hnot⟩
  · rintro ⟨hw, hnot⟩
    refine ⟨⟨?_, hw⟩, hnot⟩
    rintro rfl
    exact hnot ((mem_closedNbhd_root _).mpr ⟨Finset.mem_of_mem_erase hw, Or.inr rfl⟩)

theorem carrier_Tb : (T60.vertices.erase vAddr).erase [] = Tb.vertices.erase [] := by
  ext w
  rw [Finset.mem_erase, Finset.mem_erase, Finset.mem_erase]
  constructor
  · rintro ⟨hnil, hnev, hw⟩
    refine ⟨hnil, ?_⟩
    rcases (mem_T60 w).mp hw with rfl | rfl | rfl | ⟨i, hi, rfl⟩ | ⟨i, hi, j, hj, rfl⟩
    · exact absurd rfl hnil
    · exact (mem_Tb _).mpr (Or.inr (Or.inl rfl))
    · exact absurd rfl hnev
    · exact (mem_Tb _).mpr (Or.inr (Or.inr (Or.inl ⟨i, hi, rfl⟩)))
    · exact (mem_Tb _).mpr (Or.inr (Or.inr (Or.inr ⟨i, hi, j, hj, rfl⟩)))
  · rintro ⟨hnil, hw⟩
    refine ⟨hnil, ?_, ?_⟩
    · rintro rfl
      rcases (mem_Tb vAddr).mp hw with h | h | ⟨i, hi, h⟩ | ⟨i, hi, j, hj, h⟩ <;>
        · rw [vAddr] at h; simp at h <;> omega
    · rcases (mem_Tb w).mp hw with rfl | rfl | ⟨i, hi, rfl⟩ | ⟨i, hi, j, hj, rfl⟩
      · exact absurd rfl hnil
      · exact s_mem_T60
      · exact (mem_T60 _).mpr (Or.inr (Or.inr (Or.inr (Or.inl ⟨i, hi, rfl⟩))))
      · exact (mem_T60 _).mpr (Or.inr (Or.inr (Or.inr (Or.inr ⟨i, hi, j, hj, rfl⟩))))

theorem indep_D2 : T60.IndepSet D2set := by
  refine ⟨?_, ?_⟩
  · rw [← carrier_root]; exact Finset.sdiff_subset
  · intro u hu w hw
    have hlen : ∀ x ∈ D2set, x.length = 2 := by
      intro x hx
      rw [D2set, Finset.mem_insert] at hx
      rcases hx with rfl | hx
      · simp [vAddr]
      · exact D1set_len hx
    exact not_addrAdjacent_of_length_eq ((hlen u hu).trans (hlen w hw).symm)

theorem indep_D1 : T60.IndepSet D1set :=
  indep_D2.mono (by rw [D2set]; exact Finset.subset_insert _ _)

/-! ## Part 5 — Address-level geometry of the witness -/

theorem nbr_v {w : List ℕ} (hw : w ∈ T60.vertices) : addrAdjacent vAddr w ↔ w = sAddr := by
  rcases (mem_T60 w).mp hw with rfl | rfl | rfl | ⟨i, -, rfl⟩ | ⟨i, -, j, -, rfl⟩ <;>
    simp [addrAdjacent, vAddr, sAddr]

theorem nbr_s {w : List ℕ} (hw : w ∈ T60.vertices) :
    addrAdjacent sAddr w ↔ (w = [] ∨ w = vAddr) := by
  rcases (mem_T60 w).mp hw with rfl | rfl | rfl | ⟨i, -, rfl⟩ | ⟨i, -, j, -, rfl⟩ <;>
    simp [addrAdjacent, vAddr, sAddr]

theorem degree_v : T60.degree vAddr = 1 := by
  unfold RTree.degree
  rw [Finset.card_eq_one]
  refine ⟨sAddr, ?_⟩
  ext w
  simp only [Finset.mem_filter, Finset.mem_singleton]
  constructor
  · rintro ⟨hw, hadj⟩
    exact (nbr_v hw).mp hadj
  · rintro rfl
    exact ⟨s_mem_T60, (nbr_v s_mem_T60).mpr rfl⟩

theorem v_leaf : vAddr ∈ T60.leaves := (T60.mem_leaves_iff vAddr).mpr ⟨v_mem_T60, degree_v⟩

theorem support_v : T60.support vAddr = sAddr :=
  (T60.eq_support_of_adjacent v_leaf s_mem_T60 ((nbr_v s_mem_T60).mpr rfl)).symm

theorem degree_s : T60.degree sAddr = 2 := by
  unfold RTree.degree
  rw [Finset.card_eq_two]
  refine ⟨[], vAddr, by simp [vAddr], ?_⟩
  ext w
  simp only [Finset.mem_filter, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨hw, hadj⟩
    exact (nbr_s hw).mp hadj
  · rintro (rfl | rfl)
    · exact ⟨root_mem_T60, (nbr_s root_mem_T60).mpr (Or.inl rfl)⟩
    · exact ⟨v_mem_T60, (nbr_s v_mem_T60).mpr (Or.inr rfl)⟩

theorem s_adj_root : addrAdjacent sAddr [] := (nbr_s root_mem_T60).mpr (Or.inl rfl)

/-! ### The order of the witness -/

/-- The sixty-one depth-one vertices. -/
def Dep1 : Finset (List ℕ) := (Finset.range 61).image (fun i => [i])

theorem mem_Dep1 (w : List ℕ) : w ∈ Dep1 ↔ ∃ i < 61, w = [i] := by
  rw [Dep1, Finset.mem_image]
  constructor
  · rintro ⟨i, hi, rfl⟩
    exact ⟨i, Finset.mem_range.mp hi, rfl⟩
  · rintro ⟨i, hi, rfl⟩
    exact ⟨i, Finset.mem_range.mpr hi, rfl⟩

theorem Dep1_card : Dep1.card = 61 := by
  rw [Dep1, Finset.card_image_of_injective _ (by
    intro a b hab
    simpa using hab), Finset.card_range]

theorem T60_vertices_eq : T60.vertices = insert [] (Dep1 ∪ D2set) := by
  ext w
  rw [Finset.mem_insert, Finset.mem_union, mem_Dep1, D2set, Finset.mem_insert, mem_D1set, mem_T60]
  constructor
  · rintro (rfl | rfl | rfl | ⟨i, hi, rfl⟩ | ⟨i, hi, j, hj, rfl⟩)
    · exact Or.inl rfl
    · exact Or.inr (Or.inl ⟨0, by omega, rfl⟩)
    · exact Or.inr (Or.inr (Or.inl rfl))
    · exact Or.inr (Or.inl ⟨i + 1, by omega, rfl⟩)
    · exact Or.inr (Or.inr (Or.inr ⟨i, hi, j, hj, rfl⟩))
  · rintro (rfl | ⟨i, hi, rfl⟩ | rfl | ⟨i, hi, j, hj, rfl⟩)
    · exact Or.inl rfl
    · rcases i with _ | k
      · exact Or.inr (Or.inl rfl)
      · exact Or.inr (Or.inr (Or.inr (Or.inl ⟨k, by omega, rfl⟩)))
    · exact Or.inr (Or.inr (Or.inl rfl))
    · exact Or.inr (Or.inr (Or.inr (Or.inr ⟨i, hi, j, hj, rfl⟩)))

theorem Dep1_disjoint_D2set : Disjoint Dep1 D2set := by
  rw [Finset.disjoint_left]
  intro w hw hw2
  obtain ⟨i, -, rfl⟩ := (mem_Dep1 w).mp hw
  rw [D2set, Finset.mem_insert, mem_D1set] at hw2
  rcases hw2 with h | ⟨a, -, b, -, h⟩
  · rw [vAddr] at h; simp at h
  · simp at h

/-- **The witness has exactly 243 vertices.** -/
theorem T60_order : T60.vertices.card = 243 := by
  have hnotmem : ([] : List ℕ) ∉ Dep1 ∪ D2set := by
    intro h
    rw [Finset.mem_union, mem_Dep1, D2set, Finset.mem_insert, mem_D1set] at h
    rcases h with ⟨i, -, hi⟩ | hv | ⟨a, -, b, -, hab⟩
    · simp at hi
    · rw [vAddr] at hv; simp at hv
    · simp at hab
  rw [T60_vertices_eq, Finset.card_insert_of_notMem hnotmem,
    Finset.card_union_of_disjoint Dep1_disjoint_D2set, Dep1_card, D2set_card]

/-- **Contract node `def-concrete-geometry`.** -/
theorem T60_geometry :
    T60.vertices.card = 243 ∧
    vAddr ∈ T60.leaves ∧ T60.support vAddr = sAddr ∧ T60.degree sAddr = 2 ∧
      (([] : List ℕ) ≠ vAddr ∧ addrAdjacent sAddr [] ∧ ([] : List ℕ) ∈ T60.vertices) :=
  ⟨T60_order, v_leaf, support_v, degree_s, by simp [vAddr], s_adj_root, root_mem_T60⟩

/-! ## Part 6 — Exact counts on every carrier -/

theorem rep_ET : Rep ET ((1 + C ((2 : ℕ) : ℤ) * X) * starPoly ^ 60) :=
  rep_stepK 2 (rep_Plist 60)

theorem rep_EV : Rep EV ((1 + C ((1 : ℕ) : ℤ) * X) * starPoly ^ 60) :=
  rep_stepK 1 (rep_Plist 60)

theorem eraseRoot_T60_coeff (r : ℕ) :
    (T60.indepCountOn (T60.vertices.erase []) r : ℤ)
      = ((1 + C ((2 : ℕ) : ℤ) * X) * starPoly ^ 60).coeff r := by
  have hprod : ((markedArm :: List.replicate 60 star13).map RTree.indepPoly).prod
      = (1 + C ((2 : ℕ) : ℤ) * X) * starPoly ^ 60 := by
    rw [List.map_cons, List.prod_cons, List.map_replicate, List.prod_replicate,
      indepPoly_markedArm, indepPoly_star13]
  rw [T60, RTree.indepCountOn_eraseRoot_eq_coeff,
    RTree.prod_fin_length_eq_prod (markedArm :: List.replicate 60 star13) RTree.indepPoly, hprod]

theorem eraseRoot_Tb_coeff (r : ℕ) :
    (Tb.indepCountOn (Tb.vertices.erase []) r : ℤ)
      = ((1 + C ((1 : ℕ) : ℤ) * X) * starPoly ^ 60).coeff r := by
  have hprod : ((leaf :: List.replicate 60 star13).map RTree.indepPoly).prod
      = (1 + C ((1 : ℕ) : ℤ) * X) * starPoly ^ 60 := by
    rw [List.map_cons, List.prod_cons, List.map_replicate, List.prod_replicate,
      indepPoly_leaf', indepPoly_star13]
  rw [Tb, RTree.indepCountOn_eraseRoot_eq_coeff,
    RTree.prod_fin_length_eq_prod (leaf :: List.replicate 60 star13) RTree.indepPoly, hprod]

theorem count_eraseRoot_T60 (r : ℕ) (hr : r < N) :
    T60.indepCountOn (T60.vertices.erase []) r = cf ET r := by
  have h := (eraseRoot_T60_coeff r).trans (rep_ET r hr)
  exact_mod_cast h

theorem count_eraseRoot_Tb (r : ℕ) (hr : r < N) :
    Tb.indepCountOn (Tb.vertices.erase []) r = cf EV r := by
  have h := (eraseRoot_Tb_coeff r).trans (rep_EV r hr)
  exact_mod_cast h

theorem count_erase_v_root (r : ℕ) (hr : r < N) :
    T60.indepCountOn ((T60.vertices.erase vAddr).erase []) r = cf EV r := by
  have hsub1 : Tb.vertices.erase [] ⊆ T60.vertices := by
    rw [← carrier_Tb]
    exact (Finset.erase_subset _ _).trans (Finset.erase_subset _ _)
  have hsub2 : Tb.vertices.erase [] ⊆ Tb.vertices := Finset.erase_subset _ _
  rw [carrier_Tb, indepCountOn_congr hsub1 hsub2 r, count_eraseRoot_Tb r hr]

theorem count_D2 (r : ℕ) : T60.indepCountOn D2set r = Nat.choose 181 r := by
  rw [indepCountOn_of_indep _ indep_D2, D2set_card]

theorem count_D1 (r : ℕ) : T60.indepCountOn D1set r = Nat.choose 180 r := by
  rw [indepCountOn_of_indep _ indep_D1, D1set_card]

theorem count_T60 (r : ℕ) (hr : r < N) : T60.indepCountOn T60.vertices r = cf iT r := by
  rcases r with _ | k
  · rw [T60.indepCountOn_zero]
    exact (by decide : (1 : ℕ) = cf iT 0)
  · rw [RTree.indepCountOn_succ _ root_mem_T60 k, carrier_root, count_D2,
      count_eraseRoot_T60 (k + 1) hr, iT, cf_pad, cf_cons_succ, cf_Blist 181 k (by omega)]

theorem count_T60v (r : ℕ) (hr : r < N) :
    T60.indepCountOn (T60.vertices.erase vAddr) r = cf iV r := by
  rcases r with _ | k
  · rw [T60.indepCountOn_zero]
    exact (by decide : (1 : ℕ) = cf iV 0)
  · have hV : T60.vertices.erase vAddr ⊆ T60.vertices := Finset.erase_subset _ _
    have hnil : ([] : List ℕ) ∈ T60.vertices.erase vAddr :=
      Finset.mem_erase.mpr ⟨by simp [vAddr], root_mem_T60⟩
    rw [RTree.stage7_indepCountOn_succ_within _ hV hnil k, carrier_v, count_D1,
      count_erase_v_root (k + 1) hr, iV, cf_pad, cf_cons_succ, cf_Blist 180 k (by omega)]

/-- **Contract node `def-carrier-realization`.** Every carrier that the argument
touches is identified inside the actual closed `RTree` object, and its exact
independent-set counts are pinned to kernel-computed integer data. -/
theorem T60_carrier_realization :
    (T60.vertices \ T60.closedNbhd [] = D2set) ∧
    ((T60.vertices.erase vAddr) \ T60.closedNbhd [] = D1set) ∧
    (((T60.vertices.erase vAddr).erase sAddr) \ T60.closedNbhd [] = D1set) ∧
    (∀ r, T60.indepCountOn D2set r = Nat.choose 181 r) ∧
    (∀ r, T60.indepCountOn D1set r = Nat.choose 180 r) ∧
    (∀ r < N, T60.indepCountOn T60.vertices r = cf iT r) ∧
    (∀ r < N, T60.indepCountOn (T60.vertices.erase vAddr) r = cf iV r) :=
  ⟨carrier_root, carrier_v, carrier_D, count_D2, count_D1,
    fun r hr => count_T60 r hr, fun r hr => count_T60v r hr⟩

/-! ## Part 7 — The crossing index, `K_A`, and `a_v(90)` -/

theorem Delta_T60 (r : ℕ) (hr : r + 1 < N) :
    T60.Delta r = (cf iT (r + 1) : ℤ) - (cf iT r : ℤ) := by
  obtain ⟨-, -, -, -, -, hcT, -⟩ := T60_carrier_realization
  rw [RTree.Delta, RTree.DeltaOn, hcT (r + 1) hr, hcT r (by omega)]

theorem Delta_nonneg_lt87 : ∀ r < 87, 0 ≤ T60.Delta r := by
  intro r hr
  have hspec := nondecTo_spec iT 87 (by decide) r hr
  rw [Delta_T60 r (by simp only [N]; omega)]
  omega

theorem Delta_87_neg : T60.Delta 87 < 0 := by
  have h : cf iT (87 + 1) < cf iT 87 := by decide
  rw [Delta_T60 87 (by decide)]
  omega

theorem crossing_87 : T60.crossingIndex = 87 := by
  have hle : T60.crossingIndex ≤ 87 := Nat.sInf_le Delta_87_neg
  by_contra hne
  have hlt : T60.crossingIndex < 87 := lt_of_le_of_ne hle hne
  exact absurd T60.crossingIndex_spec (not_lt.mpr (Delta_nonneg_lt87 _ hlt))

theorem KA_3 : RTree.K_A T60 90 = 3 := by
  rw [RTree.K_A, crossing_87]
  norm_num

theorem a_v_neg : T60.a vAddr 90 < 0 := by
  obtain ⟨-, -, -, -, -, -, hcV⟩ := T60_carrier_realization
  have h : cf iV (90 + 1) < cf iV 90 := by decide
  rw [RTree.a, RTree.DeltaOn, hcV (90 + 1) (by decide), hcV 90 (by decide)]
  omega

/-- **Contract node `def-crossing-and-a`.** -/
theorem T60_crossing_and_a :
    (∀ r < 87, 0 ≤ T60.Delta r) ∧ T60.Delta 87 < 0 ∧ T60.crossingIndex = 87 ∧
      RTree.K_A T60 90 = 3 ∧ T60.a vAddr 90 < 0 :=
  ⟨Delta_nonneg_lt87, Delta_87_neg, crossing_87, KA_3, a_v_neg⟩

/-! ## Part 8 — The degree-two gap reversal -/

theorem choose_180_88_lt : Nat.choose 180 88 < Nat.choose 180 89 := by
  have key : Nat.choose 180 89 * 89 = Nat.choose 180 88 * 92 := by
    have h := Nat.choose_succ_right_eq 180 88
    norm_num at h
    exact h
  have hpos : 0 < Nat.choose 180 88 := Nat.choose_pos (by omega)
  rcases Nat.lt_or_ge (Nat.choose 180 88) (Nat.choose 180 89) with h | h
  · exact h
  · exfalso; nlinarith

/-- **Contract node `def-gap-reversal`.** -/
theorem T60_gap_reversal :
    ¬ (T60.b vAddr 90 ≤ T60.Bgen (T60.support vAddr) (((90 : ℕ) : ℤ) - 1)) := by
  obtain ⟨-, hleaf, hsup, hdeg, hyv, hsy, hymem⟩ := T60_geometry
  obtain ⟨-, -, hcD, -, hcnt1, -, -⟩ := T60_carrier_realization
  have hred := RTree.supportDegreeTwoGapReduction T60 (v := vAddr) (s := sAddr) (y := [])
    hleaf hsup.symm hdeg hyv hsy hymem (p := 90) (by omega)
  obtain ⟨-, -, hiff⟩ := hred
  rw [hsup, hiff, hcD, hcnt1, hcnt1]
  exact not_le.mpr choose_180_88_lt

/-! ## Part 9 — The pointwise counterexample and the refutation -/

/-- **Contract node `def-pointwise-counterexample`.** -/
theorem T60_betaCounterexample : RTree.BetaCounterexample T60 vAddr 90 := by
  obtain ⟨-, hleaf, -, -, -, -, -⟩ := T60_geometry
  obtain ⟨-, -, -, hk, ha⟩ := T60_crossing_and_a
  refine ⟨hleaf, ?_, ha, T60_gap_reversal⟩
  rw [hk]
  norm_num

/-- **Terminal declaration.** -/
theorem T60_not_BetaTarget : Not RTree.BetaTarget := by
  intro hB
  obtain ⟨hleaf, hk, ha, hgap⟩ := T60_betaCounterexample
  exact hgap (hB T60 vAddr 90 hleaf hk ha)

end Order243
