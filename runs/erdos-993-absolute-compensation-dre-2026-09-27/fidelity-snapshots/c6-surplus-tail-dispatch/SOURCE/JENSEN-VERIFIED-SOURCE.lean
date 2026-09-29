import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition e993BlockProduct 39a4eb242309917b4cea453273a0d7af6df82205f9ee93706af053180f28a3be
open scoped BigOperators

noncomputable
def e993BlockProduct {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) : Polynomial ℝ :=
  ∏ i, ∑ t ∈ Finset.range (r i + 1), Polynomial.monomial t (f i t)
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition e993BlockMass 03b5ac26ac84d45d313e280e700eab748de756da49239900c04dab557dfa650d
noncomputable
def e993BlockMass {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (k : ℕ) : ℝ :=
  ((∑ i, r i).choose k : ℝ)
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition e993BlockCount a36ecd60e8394e595db5164ecd8ad3041886a3f761a97cc4dc1f446c50dc1607
noncomputable
def e993BlockCount {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) (i : ι) : ℕ :=
  ((Finset.univ : Finset (Fin (r i))).filter fun v => Sigma.mk i v ∈ S).card
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition e993SubsetAverage f5e3c55955d99a975188d41dc798a971837e255fa7b201ed9423ee0265ff7fb0
noncomputable
def e993SubsetAverage {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) : ℝ :=
  (∑ S ∈ (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k,
    ∏ i, f i (e993BlockCount r S i) /
      ((r i).choose (e993BlockCount r S i) : ℝ)) /
    (((Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k).card : ℝ)
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition e993BlockExponent faceb6209677defc332399b3a244e4ba6b903d27036e54a98615517d013b57e1
noncomputable
def e993BlockExponent {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) : ℝ :=
  ∑ i, ∑ t ∈ Finset.range (r i + 1),
    (if t ≤ k then
      ((r i).choose t : ℝ) * (((∑ j, r j) - r i).choose (k - t) : ℝ) /
        e993BlockMass r k
    else 0) *
    (2 * (f i t - ((r i).choose t : ℝ)) /
      (f i t + ((r i).choose t : ℝ)))
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition e993ExpTaylor df1cf11775b48b32dca39f92d846d6e57e9f4718648cfcfd0131812c72134a37
noncomputable
def e993ExpTaylor (d : ℕ) (y : ℝ) : ℝ :=
  ∑ a ∈ Finset.range (d + 1), y ^ a / (Nat.factorial a : ℝ)
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition e993Fiber 043c84b335b136423b2f5e69c81953526e7697700ef093d77f2613070222016c
noncomputable
def e993Fiber {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) (i : ι) : Finset (Fin (r i)) :=
  Finset.univ.filter fun v => Sigma.mk i v ∈ S
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition e993FiberEquiv 96653fd262a49d271dab14e59126379c801b60fc3228b3f8f0011cffa63fb28e
noncomputable
def e993FiberEquiv {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) :
    Finset (Σ i, Fin (r i)) ≃ (∀ i, Finset (Fin (r i))) where
  toFun := e993Fiber r
  invFun := (Finset.univ : Finset ι).sigma
  left_inv := by
    intro S
    ext ⟨i, v⟩
    simp [e993Fiber]
  right_inv := by
    intro A
    funext i
    ext v
    simp [e993Fiber]
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition e993CountVec 52b46c179b2f1c98015c0c9d8bdb5f47cec3790e2223a2174aae7fdbfca8a30d
noncomputable
def e993CountVec {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) : ∀ i, Fin (r i + 1) :=
  fun i => ⟨e993BlockCount r S i, by
    have hle :
        ((Finset.univ : Finset (Fin (r i))).filter
          fun v => Sigma.mk i v ∈ S).card ≤ r i := by
      simpa using (Finset.card_le_card
        (Finset.filter_subset (fun v : Fin (r i) => Sigma.mk i v ∈ S) Finset.univ))
    exact Nat.lt_succ_of_le hle⟩
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition e993CountFiberEquiv a1a167c0fb8854cf85f11a2575f5a4668b7cf92191410931d8ffaeee38251f53
noncomputable
def e993CountFiberEquiv {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (t : ι → ℕ) :
    {S : Finset (Σ i, Fin (r i)) // ∀ i, e993BlockCount r S i = t i} ≃
      (∀ i, {T : Finset (Fin (r i)) // T.card = t i}) where
  toFun := fun S i => ⟨e993Fiber r S.val i, S.property i⟩
  invFun := fun A => ⟨(Finset.univ : Finset ι).sigma (fun i => (A i).val), by
    intro i
    have h : e993Fiber r ((Finset.univ : Finset ι).sigma (fun i => (A i).val)) i =
        (A i).val := by
      ext v
      simp [e993Fiber]
    change (e993Fiber r ((Finset.univ : Finset ι).sigma (fun i => (A i).val)) i).card = t i
    rw [h]
    exact (A i).property⟩
  left_inv := by
    intro S
    apply Subtype.ext
    ext ⟨i, v⟩
    simp [e993Fiber]
  right_inv := by
    intro A
    funext i
    apply Subtype.ext
    ext v
    simp [e993Fiber]
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition e993BlockSet fef18d07b024a6726479c9d9140f966e5744d95564b9319435e2f809a15b207f
noncomputable
def e993BlockSet {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (i : ι) : Finset (Σ j, Fin (r j)) :=
  (Finset.univ : Finset (Fin (r i))).image (Sigma.mk i)
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma e993_card_ambient d708ee04400e30935a78f0cba408a971a68080af5f69dd6c271afb19580f6d25
lemma e993_card_ambient {ι : Type*} [Fintype ι]
    (r : ι → ℕ) : Fintype.card (Σ i, Fin (r i)) = ∑ i, r i := by
  simp [Fintype.card_sigma]
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma e993_card_subsets f0539cc57b797b0638d5c9442163444386837d709526c0395f4dc0bad4c4205f
lemma e993_card_subsets {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (k : ℕ) :
    ((Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k).card =
      (∑ i, r i).choose k := by
  rw [Finset.card_powersetCard, Finset.card_univ, e993_card_ambient]
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma e993_mass_pos 6b3d90955167199ee7653df0e967d4c2f244ffbfad6e42b986811a9868693faf
lemma e993_mass_pos {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (k : ℕ) (hk : k ≤ ∑ i, r i) :
    0 < e993BlockMass r k := by
  unfold e993BlockMass
  exact_mod_cast Nat.choose_pos hk
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma e993_taylor_le d33282ff8ec332f896e150a9458f5a8abefa017c790483e30eedf9f2d1ceee83
lemma e993_taylor_le (d : ℕ) {y : ℝ} (hy : 0 ≤ y) :
    e993ExpTaylor d y ≤ Real.exp y := by
  simpa [e993ExpTaylor] using Real.sum_le_exp_of_nonneg hy (d + 1)
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma e993_scalar_log 07e90e165093497955abe6dd85665533e82faeeffe3a041f1356166373e4ea31
lemma e993_scalar_log {c f : ℝ} (hc : 0 < c) (hcf : c ≤ f) :
    2 * (f - c) / (f + c) ≤ Real.log (f / c) := by
  have h : 0 ≤ f / c - 1 := by
    apply sub_nonneg.mpr
    exact (le_div_iff₀ hc).2 (by simpa using hcf)
  have hlog := Real.le_log_one_add_of_nonneg h
  convert hlog using 1 <;> field_simp <;> ring
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma e993_exponent_nonneg 382d32f707d14ffa71fe66ca089b62da9c51207efe16c2078e7ba5a49870101e
lemma e993_exponent_nonneg {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ)
    (hf : ∀ i t, t ≤ r i → ((r i).choose t : ℝ) ≤ f i t)
    (k : ℕ) (hk : k ≤ ∑ i, r i) :
    0 ≤ e993BlockExponent r f k := by
  unfold e993BlockExponent
  apply Finset.sum_nonneg
  intro i hi
  apply Finset.sum_nonneg
  intro t ht
  have htr : t ≤ r i := by simpa using (Finset.mem_range.mp ht)
  have hc : (0 : ℝ) < (r i).choose t := by exact_mod_cast Nat.choose_pos htr
  have hf' := hf i t htr
  apply mul_nonneg
  · split_ifs
    · apply div_nonneg
      · positivity
      · exact le_of_lt (e993_mass_pos r k hk)
    · exact le_refl 0
  · apply div_nonneg
    · nlinarith
    · linarith
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma e993_rebuild_fibers 012104ad43177c02ae5b475ee9eefed1f7f606360d01fc4b3f07705038ae11e8
lemma e993_rebuild_fibers {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) :
    (Finset.univ : Finset ι).sigma (e993Fiber r S) = S := by
  ext ⟨i, v⟩
  simp [e993Fiber]
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma e993_fiber_rebuild e522e8a0a0822903a7ae43188b245996a768b54228fd8bb7af9427422df251f8
lemma e993_fiber_rebuild {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (A : ∀ i, Finset (Fin (r i))) (i : ι) :
    e993Fiber r ((Finset.univ : Finset ι).sigma A) i = A i := by
  ext v
  simp [e993Fiber]
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma e993_count_eq_fiber_card 368c51d64851f7f20af77a85f32c11298d612e19a7a7da205e5fb62b6b46c138
lemma e993_count_eq_fiber_card {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) (i : ι) :
    e993BlockCount r S i = (e993Fiber r S i).card := rfl
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma e993_sum_counts d47d582bcc25c153d6e521c62db76b246a951657af47e779123f005b3d2b4eee
lemma e993_sum_counts {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) :
    ∑ i, e993BlockCount r S i = S.card := by
  calc
    ∑ i, e993BlockCount r S i = ∑ i, (e993Fiber r S i).card := by rfl
    _ = ((Finset.univ : Finset ι).sigma (e993Fiber r S)).card := by
      rw [Finset.card_sigma]
    _ = S.card := by rw [e993_rebuild_fibers]
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma e993_count_le bf48bbb98d098f6fa5e55f516a19f1b04add684626e075f1978a7c782ffe0167
lemma e993_count_le {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) (i : ι) :
    e993BlockCount r S i ≤ r i := by
  rw [e993_count_eq_fiber_card]
  simpa [e993Fiber] using (Finset.card_le_card
    (Finset.filter_subset (fun v : Fin (r i) => Sigma.mk i v ∈ S) Finset.univ))
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma e993_prod_monomial f547d3d2fd7e41c659166de8b5277caea8771076b9b4eec75eaacfad9ae463ec
lemma e993_prod_monomial {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (t : ι → ℕ) (a : ι → ℝ) :
    (∏ i ∈ s, Polynomial.monomial (t i) (a i)) =
      Polynomial.monomial (∑ i ∈ s, t i) (∏ i ∈ s, a i) := by
  induction s using Finset.induction with
  | empty => simp
  | @insert i s hi ih =>
      simp [Finset.prod_insert hi, Finset.sum_insert hi, ih,
        Polynomial.monomial_mul_monomial]
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma e993_coeff_expansion 648534608ba8d2116cbe179ea8a1cb0498d4b48c92e54f16063790751a3f9344
lemma e993_coeff_expansion {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) :
    (e993BlockProduct r f).coeff k =
      ∑ t : (∀ i, Fin (r i + 1)),
        if (∑ i, (t i).val) = k then ∏ i, f i (t i).val else 0 := by
  classical
  calc
    (e993BlockProduct r f).coeff k =
        (∏ i, ∑ t : Fin (r i + 1),
          Polynomial.monomial t.val (f i t.val)).coeff k := by
      simp only [e993BlockProduct]
      congr 1
      apply Finset.prod_congr rfl
      intro i hi
      exact (Fin.sum_univ_eq_sum_range
        (fun t => Polynomial.monomial t (f i t)) (r i + 1)).symm
    _ = (∑ t : (∀ i, Fin (r i + 1)),
          ∏ i, Polynomial.monomial (t i).val (f i (t i).val)).coeff k := by
      rw [Fintype.prod_sum]
    _ = _ := by
      simp_rw [e993_prod_monomial Finset.univ]
      simp [Polynomial.finsetSum_coeff, Polynomial.coeff_monomial]
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma e993_countvec_sum 06511a070f852a2b379a420f8938e4934eca71053ca23fee220a7a0a279e5894
lemma e993_countvec_sum {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) :
    (∑ i, (e993CountVec r S i).val) = S.card :=
  e993_sum_counts r S
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma e993_finite_jensen b562c54e9a86c695cd41f328d309292734653159348828c21c2874b3032e8890
lemma e993_finite_jensen {α : Type*} [DecidableEq α]
    (s : Finset α) (hs : s.Nonempty) (z : α → ℝ) :
    Real.exp ((∑ x ∈ s, z x) / (s.card : ℝ)) ≤
      (∑ x ∈ s, Real.exp (z x)) / (s.card : ℝ) := by
  have hcard : (0 : ℝ) < s.card := by exact_mod_cast Finset.card_pos.mpr hs
  have h := convexOn_exp.map_centerMass_le
    (t := s) (w := fun _ => (1 : ℝ)) (p := z)
    (by intro i hi; positivity)
    (by simpa using hcard)
    (by intro i hi; trivial)
  simpa [Finset.centerMass, div_eq_mul_inv, smul_eq_mul,
    Finset.sum_mul, mul_comm, mul_left_comm, mul_assoc] using h
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma e993_weight_ge_one b01eb53d9f2cf1883591c30b522458ad76f29f2eb2b84dccf909901e7185bf3c
lemma e993_weight_ge_one {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ)
    (hf : ∀ i t, t ≤ r i → ((r i).choose t : ℝ) ≤ f i t)
    (i : ι) (t : ℕ) (ht : t ≤ r i) :
    1 ≤ f i t / ((r i).choose t : ℝ) := by
  have hc : (0 : ℝ) < (r i).choose t := by exact_mod_cast Nat.choose_pos ht
  exact (le_div_iff₀ hc).2 (by simpa using hf i t ht)
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma e993_exp_log_product f8b9d524dde3bdd09a685cff4c627f3ea57ee9c6a89f37438a670b8965ed90f4
lemma e993_exp_log_product {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ)
    (hf : ∀ i t, t ≤ r i → ((r i).choose t : ℝ) ≤ f i t)
    (S : Finset (Σ i, Fin (r i))) :
    Real.exp (∑ i, Real.log (f i (e993BlockCount r S i) /
      ((r i).choose (e993BlockCount r S i) : ℝ))) =
      ∏ i, f i (e993BlockCount r S i) /
        ((r i).choose (e993BlockCount r S i) : ℝ) := by
  rw [Real.exp_sum]
  apply Finset.prod_congr rfl
  intro i hi
  exact Real.exp_log (lt_of_lt_of_le zero_lt_one
    (e993_weight_ge_one r f hf i _ (e993_count_le r S i)))
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma e993_pointwise_log b01bf4323bcaa9052a4a3c28666def908a62e093cda166cf074f8eb47d35974e
lemma e993_pointwise_log {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ)
    (hf : ∀ i t, t ≤ r i → ((r i).choose t : ℝ) ≤ f i t)
    (S : Finset (Σ i, Fin (r i))) :
    (∑ i, 2 * (f i (e993BlockCount r S i) -
      ((r i).choose (e993BlockCount r S i) : ℝ)) /
      (f i (e993BlockCount r S i) +
      ((r i).choose (e993BlockCount r S i) : ℝ))) ≤
    (∑ i, Real.log (f i (e993BlockCount r S i) /
      ((r i).choose (e993BlockCount r S i) : ℝ))) := by
  apply Finset.sum_le_sum
  intro i hi
  exact e993_scalar_log
    (by exact_mod_cast Nat.choose_pos (e993_count_le r S i))
    (hf i _ (e993_count_le r S i))
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma e993_card_block_fiber 80284d71229e0eb059417393db7232026b6ab4ae2d9380dda394ee6f72ec2b65
lemma e993_card_block_fiber (n t : ℕ) :
    Fintype.card {T : Finset (Fin n) // T.card = t} = n.choose t := by
  classical
  rw [Fintype.card_subtype]
  rw [← Finset.powerset_univ (α := Fin n)]
  rw [← Finset.powersetCard_eq_filter]
  simp
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma e993_card_joint_fiber c0aa6fad5f749760360e5ee1f04c5dd39445462b72694550e60717ba10f43596
lemma e993_card_joint_fiber {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (t : ι → ℕ) :
    Fintype.card {S : Finset (Σ i, Fin (r i)) //
      ∀ i, e993BlockCount r S i = t i} =
      ∏ i, (r i).choose (t i) := by
  classical
  calc
    Fintype.card {S : Finset (Σ i, Fin (r i)) //
      ∀ i, e993BlockCount r S i = t i} =
        Fintype.card (∀ i, {T : Finset (Fin (r i)) // T.card = t i}) :=
          Fintype.card_congr (e993CountFiberEquiv r t)
    _ = ∏ i, Fintype.card {T : Finset (Fin (r i)) // T.card = t i} :=
      Fintype.card_pi
    _ = ∏ i, (r i).choose (t i) := by
      apply Finset.prod_congr rfl
      intro i hi
      exact e993_card_block_fiber (r i) (t i)
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma e993_card_rank_fiber 2d7d968a3b4831a5bdc2f941ba714399023bba006db0b4762eab8dadd1601daf
lemma e993_card_rank_fiber {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (k : ℕ) (t : ι → ℕ) :
    (((Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k).filter
      (fun S => ∀ i, e993BlockCount r S i = t i)).card =
      if (∑ i, t i) = k then ∏ i, (r i).choose (t i) else 0 := by
  classical
  have hfull :
      ((Finset.univ : Finset (Finset (Σ i, Fin (r i)))).filter
        (fun S => ∀ i, e993BlockCount r S i = t i)).card =
        ∏ i, (r i).choose (t i) := by
    rw [← e993_card_joint_fiber r t, Fintype.card_subtype]
  by_cases hsum : (∑ i, t i) = k
  · rw [if_pos hsum, ← hfull]
    congr 1
    ext S
    simp only [Finset.mem_filter, Finset.mem_powersetCard, Finset.mem_univ,
      true_and]
    constructor
    · exact fun h => h.2
    · intro h
      refine ⟨⟨Finset.subset_univ _, ?_⟩, h⟩
      calc
        S.card = ∑ i, e993BlockCount r S i := (e993_sum_counts r S).symm
        _ = ∑ i, t i := Finset.sum_congr rfl (fun i _ => h i)
        _ = k := hsum
  · rw [if_neg hsum]
    apply Finset.card_eq_zero.mpr
    ext S
    have hnot : ¬ ((S ⊆ (Finset.univ : Finset (Σ i, Fin (r i))) ∧ S.card = k) ∧
        ∀ i, e993BlockCount r S i = t i) := by
      intro hS
      apply hsum
      calc
        ∑ i, t i = ∑ i, e993BlockCount r S i :=
          Finset.sum_congr rfl (fun i _ => (hS.2 i).symm)
        _ = S.card := e993_sum_counts r S
        _ = k := hS.1.2
    simpa [Finset.mem_filter, Finset.mem_powersetCard] using hnot
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma e993_countvec_eq_iff 065da4e601598c021782237e5faab1cc504d624669711af55934fd4f361a36db
lemma e993_countvec_eq_iff {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i)))
    (t : ∀ i, Fin (r i + 1)) :
    e993CountVec r S = t ↔
      ∀ i, e993BlockCount r S i = (t i).val := by
  constructor
  · intro h i
    exact congrArg Fin.val (congrFun h i)
  · intro h
    funext i
    exact Fin.ext (h i)
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma e993_prod_choose_mul_weight ac90a34f0372dcab2c8c31ffa631a4661761c1cb8648df1ceb0fd82b9205220b
lemma e993_prod_choose_mul_weight {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ)
    (t : ∀ i, Fin (r i + 1)) :
    (∏ i, ((r i).choose (t i).val : ℝ)) *
      (∏ i, f i (t i).val / ((r i).choose (t i).val : ℝ)) =
      ∏ i, f i (t i).val := by
  rw [← Finset.prod_mul_distrib]
  apply Finset.prod_congr rfl
  intro i hi
  have hc : (((r i).choose (t i).val : ℕ) : ℝ) ≠ 0 := by
    exact_mod_cast (Nat.choose_pos (Nat.le_of_lt_succ (t i).isLt)).ne'
  field_simp
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma e993_actual_sum_eq_count_sum 32feeb2d40a84cfd4c4e5390671f9e4eb43d016d1fcd6da30dbd35fca1b4997d
lemma e993_actual_sum_eq_count_sum {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) :
    (∑ S ∈ (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k,
      ∏ i, f i (e993BlockCount r S i) /
        ((r i).choose (e993BlockCount r S i) : ℝ)) =
    ∑ t : (∀ i, Fin (r i + 1)),
      if (∑ i, (t i).val) = k then ∏ i, f i (t i).val else 0 := by
  classical
  let Ω := (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k
  let w := fun S : Finset (Σ i, Fin (r i)) =>
    ∏ i, f i (e993BlockCount r S i) /
      ((r i).choose (e993BlockCount r S i) : ℝ)
  have hsum := Finset.sum_fiberwise_eq_sum_filter Ω
    (Finset.univ : Finset (∀ i, Fin (r i + 1)))
    (e993CountVec r) w
  have hgroup : ∀ t : (∀ i, Fin (r i + 1)),
      (∑ S ∈ Ω.filter (fun S => e993CountVec r S = t), w S) =
      if (∑ i, (t i).val) = k then ∏ i, f i (t i).val else 0 := by
    intro t
    have hc : (Ω.filter (fun S => e993CountVec r S = t)).card =
        if (∑ i, (t i).val) = k then ∏ i, (r i).choose (t i).val else 0 := by
      simpa only [Ω, ← e993_countvec_eq_iff] using
        e993_card_rank_fiber r k (fun i => (t i).val)
    calc
      (∑ S ∈ Ω.filter (fun S => e993CountVec r S = t), w S) =
          ((Ω.filter (fun S => e993CountVec r S = t)).card : ℝ) *
            (∏ i, f i (t i).val / ((r i).choose (t i).val : ℝ)) := by
        calc
          (∑ S ∈ Ω.filter (fun S => e993CountVec r S = t), w S) =
              ∑ S ∈ Ω.filter (fun S => e993CountVec r S = t),
                (∏ i, f i (t i).val / ((r i).choose (t i).val : ℝ)) := by
            apply Finset.sum_congr rfl
            intro S hS
            have hvec := (Finset.mem_filter.mp hS).2
            simp only [w]
            apply Finset.prod_congr rfl
            intro i hi
            rw [(e993_countvec_eq_iff r S t).mp hvec i]
          _ = _ := by simp
      _ = _ := by
        rw [hc]
        split_ifs with h
        · simpa only [Nat.cast_prod] using e993_prod_choose_mul_weight r f t
        · simp
  calc
    (∑ S ∈ (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k,
      ∏ i, f i (e993BlockCount r S i) /
        ((r i).choose (e993BlockCount r S i) : ℝ)) =
        ∑ S ∈ Ω, w S := rfl
    _ = ∑ t : (∀ i, Fin (r i + 1)),
          (∑ S ∈ Ω.filter (fun S => e993CountVec r S = t), w S) := by
      simpa using hsum.symm
    _ = _ := by
      apply Finset.sum_congr rfl
      intro t ht
      exact hgroup t
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma e993_coeff_actual e74f5f25efce57e6d0171f41d50bfb5fe9a9419f456334b3f26951179c390564
lemma e993_coeff_actual {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) :
    (e993BlockProduct r f).coeff k =
      ∑ S ∈ (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k,
        ∏ i, f i (e993BlockCount r S i) /
          ((r i).choose (e993BlockCount r S i) : ℝ) := by
  rw [e993_coeff_expansion, e993_actual_sum_eq_count_sum]
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma e993_coefficient_average 739048576c7fbba3e0815e300979a8e5f548d3a66e95bcd91898561d1d867fab
lemma e993_coefficient_average {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) :
    (e993BlockProduct r f).coeff k / e993BlockMass r k =
      e993SubsetAverage r f k := by
  unfold e993SubsetAverage e993BlockMass
  rw [e993_coeff_actual, e993_card_subsets]
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma e993_card_inter_fiber d3db140f9a8364abd484ae61a4cd20e3aa5a1d2f4d9af7133e46f9b7be6488ce
lemma e993_card_inter_fiber {α : Type*} [DecidableEq α]
    (U A : Finset α) (hAU : A ⊆ U) (k t : ℕ) :
    ((U.powersetCard k).filter (fun S => (S ∩ A).card = t)).card =
      if t ≤ k then A.card.choose t * (U.card - A.card).choose (k - t) else 0 := by
  classical
  by_cases htk : t ≤ k
  · rw [if_pos htk]
    let P := A.powersetCard t ×ˢ (U \ A).powersetCard (k - t)
    have hb : ((U.powersetCard k).filter (fun S => (S ∩ A).card = t)).card = P.card := by
      apply Finset.card_bij'
        (fun S _ => (S ∩ A, S \ A))
        (fun T _ => T.1 ∪ T.2)
      · intro S hS
        rcases Finset.mem_filter.mp hS with ⟨hSk, hSt⟩
        rcases Finset.mem_powersetCard.mp hSk with ⟨hSU, hScard⟩
        apply Finset.mem_product.mpr
        constructor
        · exact Finset.mem_powersetCard.mpr ⟨Finset.inter_subset_right, hSt⟩
        · refine Finset.mem_powersetCard.mpr ⟨?_, ?_⟩
          · grind
          · change (S \ A).card = k - t
            have hcard := Finset.card_sdiff_add_card_inter S A
            omega
      · intro T hT
        rcases Finset.mem_product.mp hT with ⟨hT1, hT2⟩
        rcases Finset.mem_powersetCard.mp hT1 with ⟨hTA, hTcard⟩
        rcases Finset.mem_powersetCard.mp hT2 with ⟨hTU, hRcard⟩
        apply Finset.mem_filter.mpr
        constructor
        · apply Finset.mem_powersetCard.mpr
          constructor
          · grind
          · have hd : Disjoint T.1 T.2 := by
              apply Finset.disjoint_left.mpr
              intro x hx1 hx2
              exact (Finset.mem_sdiff.mp (hTU hx2)).2 (hTA hx1)
            rw [Finset.card_union_of_disjoint hd, hTcard, hRcard]
            omega
        · have heq : (T.1 ∪ T.2) ∩ A = T.1 := by grind
          rw [heq, hTcard]
      · intro S hS
        grind
      · intro T hT
        rcases Finset.mem_product.mp hT with ⟨hT1, hT2⟩
        rcases Finset.mem_powersetCard.mp hT1 with ⟨hTA, _⟩
        rcases Finset.mem_powersetCard.mp hT2 with ⟨hTU, _⟩
        apply Prod.ext
        · grind
        · grind
    rw [hb, Finset.card_product, Finset.card_powersetCard,
      Finset.card_powersetCard, Finset.card_sdiff_of_subset hAU]
  · rw [if_neg htk]
    apply Finset.card_eq_zero.mpr
    ext S
    have hnot : ¬ (S ∈ U.powersetCard k ∧ (S ∩ A).card = t) := by
      intro h
      have hk := (Finset.mem_powersetCard.mp h.1).2
      have hle := Finset.card_le_card (Finset.inter_subset_left : S ∩ A ⊆ S)
      omega
    simpa [Finset.mem_filter] using hnot
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma e993_blockset_card 54df21fb0ba5ae093cdd6e92ec84508fc2570b0d1e8b00044c24ab0be6e9cb07
lemma e993_blockset_card {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (i : ι) : (e993BlockSet r i).card = r i := by
  unfold e993BlockSet
  rw [Finset.card_image_of_injective]
  · simp
  · intro a b h
    exact HEq.eq (Sigma.mk.inj_iff.mp h).2
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma e993_fiber_image 5709293a20455b2d4dd2e50648de0f6db8f195eb62f3d7d0dea8b77cec5003a2
lemma e993_fiber_image {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ j, Fin (r j))) (i : ι) :
    (e993Fiber r S i).image (Sigma.mk i) = S ∩ e993BlockSet r i := by
  ext ⟨j, v⟩
  constructor
  · intro h
    rcases Finset.mem_image.mp h with ⟨u, hu, heq⟩
    have hS : Sigma.mk i u ∈ S := (Finset.mem_filter.mp hu).2
    rw [← heq]
    exact Finset.mem_inter.mpr ⟨hS, Finset.mem_image.mpr ⟨u, by simp, rfl⟩⟩
  · intro h
    rcases Finset.mem_inter.mp h with ⟨hS, hB⟩
    rcases Finset.mem_image.mp hB with ⟨u, _, heq⟩
    rw [← heq] at hS ⊢
    exact Finset.mem_image.mpr ⟨u, by simp [e993Fiber, hS], rfl⟩
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma e993_count_inter 337a7acc920ad414b4640d57d11f83cdc510c6bac56acc6ca0a412820f2c491f
lemma e993_count_inter {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ j, Fin (r j))) (i : ι) :
    e993BlockCount r S i = (S ∩ e993BlockSet r i).card := by
  rw [e993_count_eq_fiber_card, ← e993_fiber_image r S i]
  rw [Finset.card_image_of_injective]
  intro a b h
  exact HEq.eq (Sigma.mk.inj_iff.mp h).2
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma e993_marginal_count 1fa1cba6fe4b84d64110fc78273976dcb6e94fd10db3796cefcdef0e10cbc2b6
lemma e993_marginal_count {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (i : ι) (k t : ℕ) :
    (((Finset.univ : Finset (Σ j, Fin (r j))).powersetCard k).filter
      (fun S => e993BlockCount r S i = t)).card =
      if t ≤ k then (r i).choose t *
        ((∑ j, r j) - r i).choose (k - t) else 0 := by
  classical
  calc
    (((Finset.univ : Finset (Σ j, Fin (r j))).powersetCard k).filter
      (fun S => e993BlockCount r S i = t)).card =
        (((Finset.univ : Finset (Σ j, Fin (r j))).powersetCard k).filter
          (fun S => (S ∩ e993BlockSet r i).card = t)).card := by
      congr 1
      ext S
      simp only [Finset.mem_filter]
      rw [e993_count_inter]
    _ = if t ≤ k then Nat.choose (e993BlockSet r i).card t *
          Nat.choose ((Finset.univ : Finset (Σ j, Fin (r j))).card -
            (e993BlockSet r i).card) (k - t) else 0 :=
      e993_card_inter_fiber _ _ (Finset.subset_univ _) k t
    _ = _ := by
      simp [e993_blockset_card]
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma e993_marginal_sum c55f6b37ff74402d53b60598353887ca1b5d69b7c9d60c3b6265eb982c97dd2a
lemma e993_marginal_sum {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (i : ι) (k : ℕ) (g : ℕ → ℝ) :
    (∑ S ∈ (Finset.univ : Finset (Σ j, Fin (r j))).powersetCard k,
      g (e993BlockCount r S i)) =
      ∑ t ∈ Finset.range (r i + 1),
        (if t ≤ k then ((r i).choose t : ℝ) *
          (((∑ j, r j) - r i).choose (k - t) : ℝ) else 0) * g t := by
  classical
  let Ω := (Finset.univ : Finset (Σ j, Fin (r j))).powersetCard k
  have hsum := Finset.sum_fiberwise_eq_sum_filter Ω
    (Finset.range (r i + 1)) (fun S => e993BlockCount r S i)
    (fun S => g (e993BlockCount r S i))
  have hgroup : ∀ t ∈ Finset.range (r i + 1),
      (∑ S ∈ Ω.filter (fun S => e993BlockCount r S i = t),
        g (e993BlockCount r S i)) =
      (if t ≤ k then ((r i).choose t : ℝ) *
          (((∑ j, r j) - r i).choose (k - t) : ℝ) else 0) * g t := by
    intro t ht
    calc
      (∑ S ∈ Ω.filter (fun S => e993BlockCount r S i = t),
        g (e993BlockCount r S i)) =
        (∑ S ∈ Ω.filter (fun S => e993BlockCount r S i = t), g t) := by
          apply Finset.sum_congr rfl
          intro S hS
          rw [(Finset.mem_filter.mp hS).2]
      _ = ((Ω.filter (fun S => e993BlockCount r S i = t)).card : ℝ) * g t := by simp
      _ = _ := by
        rw [e993_marginal_count r i k t]
        split_ifs <;> norm_cast
  calc
    (∑ S ∈ (Finset.univ : Finset (Σ j, Fin (r j))).powersetCard k,
      g (e993BlockCount r S i)) =
      ∑ S ∈ Ω, g (e993BlockCount r S i) := rfl
    _ = ∑ t ∈ Finset.range (r i + 1),
        ∑ S ∈ Ω.filter (fun S => e993BlockCount r S i = t),
          g (e993BlockCount r S i) := by
      rw [hsum, Finset.filter_true_of_mem (fun S hS =>
        Finset.mem_range.mpr (Nat.lt_succ_of_le (e993_count_le r S i)))]
    _ = _ := by
      apply Finset.sum_congr rfl
      intro t ht
      exact hgroup t ht
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma e993_exponent_eq_average 50f5809fc788b1c09e393425f963d4b8b39d1897ea759798aa13684712a545f8
lemma e993_exponent_eq_average {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) :
    e993BlockExponent r f k =
      (∑ S ∈ (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k,
        ∑ i, 2 * (f i (e993BlockCount r S i) -
          ((r i).choose (e993BlockCount r S i) : ℝ)) /
          (f i (e993BlockCount r S i) +
          ((r i).choose (e993BlockCount r S i) : ℝ))) /
        e993BlockMass r k := by
  classical
  let Ω := (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k
  let g := fun i t => 2 * (f i t - ((r i).choose t : ℝ)) /
    (f i t + ((r i).choose t : ℝ))
  have hsingle : ∀ i,
      (∑ t ∈ Finset.range (r i + 1),
        (if t ≤ k then ((r i).choose t : ℝ) *
          (((∑ j, r j) - r i).choose (k - t) : ℝ) /
          e993BlockMass r k else 0) * g i t) =
      (∑ S ∈ Ω, g i (e993BlockCount r S i)) / e993BlockMass r k := by
    intro i
    rw [e993_marginal_sum r i k (g i), Finset.sum_div]
    apply Finset.sum_congr rfl
    intro t ht
    split_ifs with h
    · ring
    · simp
  calc
    e993BlockExponent r f k =
      ∑ i, ∑ t ∈ Finset.range (r i + 1),
        (if t ≤ k then ((r i).choose t : ℝ) *
          (((∑ j, r j) - r i).choose (k - t) : ℝ) /
          e993BlockMass r k else 0) * g i t := rfl
    _ = ∑ i, (∑ S ∈ Ω, g i (e993BlockCount r S i)) /
          e993BlockMass r k := by
      apply Finset.sum_congr rfl
      intro i hi
      exact hsingle i
    _ = (∑ i, ∑ S ∈ Ω, g i (e993BlockCount r S i)) /
          e993BlockMass r k := by rw [Finset.sum_div]
    _ = (∑ S ∈ Ω, ∑ i, g i (e993BlockCount r S i)) /
          e993BlockMass r k := by rw [Finset.sum_comm]
    _ = _ := rfl
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN theorem e993_finite_block_coefficient_jensen b7f83f38971232fc6995bee48ad0db950559143e8ee5857282774c1ebab9a5eb
theorem e993_finite_block_coefficient_jensen
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (hr : ∀ i, 0 < r i)
    (f : ι → ℕ → ℝ)
    (hf : ∀ i t, t ≤ r i → ((r i).choose t : ℝ) ≤ f i t)
    (k d : ℕ) (hk : k ≤ ∑ i, r i) :
    (e993BlockProduct r f).coeff k / e993BlockMass r k =
        e993SubsetAverage r f k ∧
    e993BlockMass r k * Real.exp (e993BlockExponent r f k) ≤
        (e993BlockProduct r f).coeff k ∧
    e993BlockMass r k * e993ExpTaylor d (e993BlockExponent r f k) ≤
        e993BlockMass r k * Real.exp (e993BlockExponent r f k) := by
  classical
  let Ω := (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k
  let z := fun S : Finset (Σ i, Fin (r i)) =>
    ∑ i, Real.log (f i (e993BlockCount r S i) /
      ((r i).choose (e993BlockCount r S i) : ℝ))
  let g := fun S : Finset (Σ i, Fin (r i)) =>
    ∑ i, 2 * (f i (e993BlockCount r S i) -
      ((r i).choose (e993BlockCount r S i) : ℝ)) /
      (f i (e993BlockCount r S i) +
      ((r i).choose (e993BlockCount r S i) : ℝ))
  have hm : 0 < e993BlockMass r k := e993_mass_pos r k hk
  have hΩcard : (Ω.card : ℝ) = e993BlockMass r k := by
    simp [Ω, e993BlockMass]
  have hΩ : Ω.Nonempty := Finset.card_pos.mp (by
    have h : 0 < Ω.card := by
      rw [e993_card_subsets]
      exact Nat.choose_pos hk
    exact h)
  have hlog : e993BlockExponent r f k ≤
      (∑ S ∈ Ω, z S) / e993BlockMass r k := by
    rw [e993_exponent_eq_average]
    apply div_le_div_of_nonneg_right _ (le_of_lt hm)
    apply Finset.sum_le_sum
    intro S hS
    exact e993_pointwise_log r f hf S
  have hjensen : Real.exp ((∑ S ∈ Ω, z S) / e993BlockMass r k) ≤
      (e993BlockProduct r f).coeff k / e993BlockMass r k := by
    have hj := e993_finite_jensen Ω hΩ z
    rw [hΩcard] at hj
    have hnum : (∑ S ∈ Ω, Real.exp (z S)) =
        (e993BlockProduct r f).coeff k := by
      calc
        (∑ S ∈ Ω, Real.exp (z S)) =
            ∑ S ∈ Ω, ∏ i, f i (e993BlockCount r S i) /
              ((r i).choose (e993BlockCount r S i) : ℝ) := by
          apply Finset.sum_congr rfl
          intro S hS
          exact e993_exp_log_product r f hf S
        _ = (e993BlockProduct r f).coeff k :=
          (e993_coeff_actual r f k).symm
    rwa [hnum] at hj
  have hbound : e993BlockMass r k * Real.exp (e993BlockExponent r f k) ≤
      (e993BlockProduct r f).coeff k := by
    have h := (Real.exp_le_exp.mpr hlog).trans hjensen
    simpa only [mul_comm] using (le_div_iff₀ hm).mp h
  refine ⟨e993_coefficient_average r f k, hbound, ?_⟩
  exact mul_le_mul_of_nonneg_left
    (e993_taylor_le d (e993_exponent_nonneg r f hf k hk)) (le_of_lt hm)
-- VERITYOS ENTRY 45 END

