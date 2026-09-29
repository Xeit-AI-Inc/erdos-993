import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition e993TailB 0675aca6ddf94dfc3037b1f49627fd51e03d4b9e744d97ebb62edacced1625a7
open scoped BigOperators

noncomputable
def e993TailB (a : ℕ) : Polynomial ℝ := (1 + Polynomial.X)^a + Polynomial.X
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition e993TailN 238a93d24068682724bce84b4c4e3487067949ce27c0d5b72afcb8894425cfd4
def e993TailN {m : ℕ} (r : Fin m → ℕ) : ℕ := ∑ i, r i
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition e993TailH 0e4136253e6f6a2aac35a4d8e25c36d0458f1193bfa247b866efc540b0c13b62
def e993TailH {m : ℕ} (r : Fin m → ℕ) : ℕ :=
  1 + ∑ i, if r i = 2 then 2 else if r i = 3 then 4 else 7
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition e993TailC f4881f3de4f298ab3fce9276a9bdfd452d7251463577c60d3e0ad0d0dc1ccab2
noncomputable
def e993TailC {m : ℕ} (r : Fin m → ℕ) : Polynomial ℝ :=
  e993TailB 1 * ∏ i, e993TailB (r i)
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition e993TailU 0d088074fbafb752e85c9de891b6bffc2e1ff1dfecac8c6ef8cfd63c1155c73a
noncomputable
def e993TailU {m : ℕ} (r : Fin m → ℕ) (i : Fin m) : Polynomial ℝ :=
  e993TailB 1 * e993TailB (r i - 1) *
    ∏ j ∈ (Finset.univ : Finset (Fin m)).erase i, e993TailB (r j)
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition e993TailE 3d9abc81727e01e78c3b080e598197e7a69ec5f967c539243431bc139d264261
noncomputable
def e993TailE {m : ℕ} (r : Fin m → ℕ) : Polynomial ℝ :=
  Polynomial.X * (1 + Polynomial.X)^e993TailN r
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition e993TailNN cf4a322153ff70d541225e4e67c2eaa79ce8abe06f86e2f3f78a215bd1e2870d
def e993TailNN (p : Polynomial ℝ) : Prop := ∀ n, 0 ≤ p.coeff n
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition e993TailD 93be2ca33f6eb0713431594817899e78f061e2c240b27553d92c1fb6ac71b7ff
noncomputable
def e993TailD (d : ℕ) (p : Polynomial ℝ) : Polynomial ℝ :=
  (3 + 2 * Polynomial.X) * p.derivative - (2 * (d : Polynomial ℝ)) * p
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition e993TailLE 755c59a4419280bc69298c779c00237959ffbfd6f21a6d4e3440c91074b05bc0
def e993TailLE (p q : Polynomial ℝ) : Prop := ∀ n, p.coeff n ≤ q.coeff n
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition e993BlockProduct a06825ae137ff6103e14e2ec4120fdb1651b587bd8a90055a613ba41fbc26045
noncomputable
def e993BlockProduct {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) : Polynomial ℝ :=
  ∏ i, ∑ t ∈ Finset.range (r i + 1), Polynomial.monomial t (f i t)
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition e993BlockMass 03b5ac26ac84d45d313e280e700eab748de756da49239900c04dab557dfa650d
noncomputable
def e993BlockMass {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (k : ℕ) : ℝ :=
  ((∑ i, r i).choose k : ℝ)
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition e993BlockCount a36ecd60e8394e595db5164ecd8ad3041886a3f761a97cc4dc1f446c50dc1607
noncomputable
def e993BlockCount {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) (i : ι) : ℕ :=
  ((Finset.univ : Finset (Fin (r i))).filter fun v => Sigma.mk i v ∈ S).card
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN definition e993SubsetAverage f5e3c55955d99a975188d41dc798a971837e255fa7b201ed9423ee0265ff7fb0
noncomputable
def e993SubsetAverage {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) : ℝ :=
  (∑ S ∈ (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k,
    ∏ i, f i (e993BlockCount r S i) /
      ((r i).choose (e993BlockCount r S i) : ℝ)) /
    (((Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k).card : ℝ)
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN definition e993BlockExponent faceb6209677defc332399b3a244e4ba6b903d27036e54a98615517d013b57e1
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
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN definition e993ExpTaylor df1cf11775b48b32dca39f92d846d6e57e9f4718648cfcfd0131812c72134a37
noncomputable
def e993ExpTaylor (d : ℕ) (y : ℝ) : ℝ :=
  ∑ a ∈ Finset.range (d + 1), y ^ a / (Nat.factorial a : ℝ)
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN definition e993Fiber 043c84b335b136423b2f5e69c81953526e7697700ef093d77f2613070222016c
noncomputable
def e993Fiber {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) (i : ι) : Finset (Fin (r i)) :=
  Finset.univ.filter fun v => Sigma.mk i v ∈ S
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN definition e993CountVec 52b46c179b2f1c98015c0c9d8bdb5f47cec3790e2223a2174aae7fdbfca8a30d
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
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN definition e993CountFiberEquiv a1a167c0fb8854cf85f11a2575f5a4668b7cf92191410931d8ffaeee38251f53
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
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN definition e993BlockSet fef18d07b024a6726479c9d9140f966e5744d95564b9319435e2f809a15b207f
noncomputable
def e993BlockSet {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (i : ι) : Finset (Σ j, Fin (r j)) :=
  (Finset.univ : Finset (Fin (r i))).image (Sigma.mk i)
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN definition e993TailBlockSize 91385076f738c912d2a061404c079805a9f5b1fb02cf64aef34d0faa49dfcfc2
def e993TailBlockSize {m : ℕ} (r : Fin m → ℕ) (i : Fin m) : Option (Fin m) → ℕ
  | none => 1
  | some j => if j = i then r i - 1 else r j
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN definition e993TailG f846f061b9eb0bf20f06b656b447c16bb16c91d6bce236cc1268d8967a0e4e88
noncomputable
def e993TailG (a N k : ℕ) : ℝ :=
  (2 * (a : ℝ) / (2 * (a : ℝ) + 1)) *
    ((N - a).choose (k - 1) : ℝ) / (N.choose k : ℝ)
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN definition e993TailQ 9cfeb603fc563b6de4b4b738e9018154bc2883277daf6742597ed4a69d1982c5
noncomputable
def e993TailQ {m : ℕ} (r : Fin m → ℕ) : Polynomial ℝ :=
  ∏ j, e993TailB (r j)
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma e993_tail_arity_lower b350a81941bebd3d953b0341e60f8acb58b518dc3118ecb143fe1e8828f7d01a
lemma e993_tail_arity_lower {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) : 2 * m ≤ e993TailN r := by
  have h : (∑ _i : Fin m, 2) ≤ ∑ i, r i := by
    apply Finset.sum_le_sum
    intro j hj
    rcases hr j with hj2 | hj3 | hj4 <;> omega
  simpa [e993TailN, Nat.mul_comm] using h
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma e993_tail_arity_upper 9f87fa08c16945ae2f299db9896fc1404b2e4bd3dc2569b21c0e58bebdde8fa8
lemma e993_tail_arity_upper {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) : e993TailN r ≤ 4 * m := by
  have h : (∑ i, r i) ≤ ∑ _i : Fin m, 4 := by
    apply Finset.sum_le_sum
    intro j hj
    rcases hr j with hj2 | hj3 | hj4 <;> omega
  simpa [e993TailN, Nat.mul_comm] using h
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma e993_tail_order_lower 3fd719bae24abc8f90d6c69a697bbaf829a281f2be138bfa7a96e8b37a6d29f1
lemma e993_tail_order_lower {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) : e993TailN r + 1 ≤ e993TailH r := by
  have h : (∑ i, r i) ≤ ∑ i, (if r i = 2 then 2 else if r i = 3 then 4 else 7) := by
    apply Finset.sum_le_sum
    intro j hj
    rcases hr j with hj2 | hj3 | hj4
    · simp [hj2]
    · simp [hj3]
    · simp [hj4]
  unfold e993TailN e993TailH
  omega
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma e993_tail_E_coeff 26921fa5f8812488624f0449bb189e6edfd739a4bd7784ef67eec737fcb45e4d
lemma e993_tail_E_coeff {m : ℕ} (r : Fin m → ℕ) (k : ℕ) (hk : 1 ≤ k) :
    (e993TailE r).coeff k = ((e993TailN r).choose (k - 1) : ℝ) := by
  obtain ⟨j, rfl⟩ : ∃ j, k = j + 1 := ⟨k - 1, by omega⟩
  simp [e993TailE, Polynomial.coeff_X_mul, Polynomial.coeff_one_add_X_pow]
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma e993_tail_E_coeff_succ 17d627fce89908de80309c7ac4a1fe975a74ab0f92b5e5e31e8a101f8ba6c371
lemma e993_tail_E_coeff_succ {m : ℕ} (r : Fin m → ℕ) (k : ℕ) :
    (e993TailE r).coeff (k + 1) = ((e993TailN r).choose k : ℝ) := by
  simp [e993TailE, Polynomial.coeff_X_mul, Polynomial.coeff_one_add_X_pow]
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma e993_tail_NN_add 8dadf84b4109739dca6fcb353440d49de441eeef50c1ab7af644f6fe07508880
lemma e993_tail_NN_add {p q : Polynomial ℝ} (hp : e993TailNN p) (hq : e993TailNN q) :
    e993TailNN (p + q) := by
  intro n
  rw [Polynomial.coeff_add]
  exact add_nonneg (hp n) (hq n)
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma e993_tail_NN_mul 66cec8d57cc3b97601cfa1cac68e5a4f298ac31e2d0c38d7d709ac596cc6a7ef
lemma e993_tail_NN_mul {p q : Polynomial ℝ} (hp : e993TailNN p) (hq : e993TailNN q) :
    e993TailNN (p * q) := by
  intro n
  rw [Polynomial.coeff_mul]
  apply Finset.sum_nonneg
  intro x hx
  exact mul_nonneg (hp x.1) (hq x.2)
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma e993_tail_NN_one 9e1ce2d926d29571ed1f81a3133a354f65e09cfaca9a634807fcc2de60cf5c70
lemma e993_tail_NN_one : e993TailNN (1 : Polynomial ℝ) := by
  intro n
  rw [Polynomial.coeff_one]
  split_ifs <;> norm_num
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma e993_tail_NN_X c16beb2d512eb335d972b98f52e7b42102576ce5af5dbd6a2a582f3c7be7ba6a
lemma e993_tail_NN_X : e993TailNN (Polynomial.X : Polynomial ℝ) := by
  intro n
  rw [Polynomial.coeff_X]
  split_ifs <;> norm_num
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma e993_tail_NN_nat ee7cee2e12b803f1cd479591648c4d09baadc506ad0832d9c039e03e1476e010
lemma e993_tail_NN_nat (m : ℕ) : e993TailNN (m : Polynomial ℝ) := by
  intro n
  rw [← Polynomial.C_eq_natCast, Polynomial.coeff_C]
  split_ifs <;> positivity
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma e993_tail_NN_pow 5419f31f70c62513bbfb0cdaaa3fc2994c664e751d19b36e3719fa469f27986f
lemma e993_tail_NN_pow {p : Polynomial ℝ} (hp : e993TailNN p) (m : ℕ) :
    e993TailNN (p ^ m) := by
  induction m with
  | zero => simpa using e993_tail_NN_one
  | succ m ih => simpa [pow_succ] using e993_tail_NN_mul ih hp
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma e993_tail_D_mul 01915eb5c01675c0e869f04898ce0d04c9a517d9a96e512a5b30745119c3151e
lemma e993_tail_D_mul (a b : ℕ) (p q : Polynomial ℝ) :
    e993TailD (a + b) (p * q) = e993TailD a p * q + p * e993TailD b q := by
  simp only [e993TailD, Polynomial.derivative_mul, Nat.cast_add]
  ring
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma e993_tail_D_one f65f08ea8c265538ceb41c7ce4d9ba6db79a75c7d40d73839255214fea08012f
lemma e993_tail_D_one : e993TailD 0 (1 : Polynomial ℝ) = 0 := by
  simp [e993TailD]
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma e993_tail_NN_zero 61867aee5f52ee2e1db740e0c65ddbea843ea05ad689f4c10ef51a6739eba884
lemma e993_tail_NN_zero : e993TailNN (0 : Polynomial ℝ) := by
  intro n
  simp
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma e993_tail_NN_L a573d9a7581302a44da382f448e8758fa2d43a094971aec3be8420ea94984d69
lemma e993_tail_NN_L : e993TailNN (1 + Polynomial.X : Polynomial ℝ) :=
  e993_tail_NN_add e993_tail_NN_one e993_tail_NN_X
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma e993_tail_NN_B 2beb6203ad10184e1198ecad3c7be2f822dbe1bc26c7c4f79cb77ba2d25344ed
lemma e993_tail_NN_B (a : ℕ) : e993TailNN (e993TailB a) :=
  e993_tail_NN_add (e993_tail_NN_pow e993_tail_NN_L a) e993_tail_NN_X
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma e993_tail_C2 6367ea4bef9cac0ca0a1fdffac4d49de15817bcb129036c3109ec4f7eef1e371
lemma e993_tail_C2 : (Polynomial.C (2 : ℝ) : Polynomial ℝ) = 2 := by norm_cast
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma e993_tail_C3 11a2bfdf3b0c76ad73471c1c5940f34a5d459906ccb902187837eaa7e0e66165
lemma e993_tail_C3 : (Polynomial.C (3 : ℝ) : Polynomial ℝ) = 3 := by norm_cast
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma e993_tail_C4 53af182f290da61fb3ed42f2579226c436bfa329daf24ac24c61477145f1ac1a
lemma e993_tail_C4 : (Polynomial.C (4 : ℝ) : Polynomial ℝ) = 4 := by norm_cast
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma e993_tail_D_B1 f3b03178df9756bb015a2019dee49e129783b59ba4dcf74f23bf340c61b53619
lemma e993_tail_D_B1 : e993TailD 1 (e993TailB 1) = 4 := by
  norm_num [e993TailD, e993TailB, Polynomial.derivative_pow,
    e993_tail_C2, e993_tail_C3, e993_tail_C4]
  ring
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma e993_tail_D_B2 2315503867f9d5a260b56ca253f38b9813caa14c33b83dc2fefac4007f97cc13
lemma e993_tail_D_B2 : e993TailD 2 (e993TailB 2) = 5 := by
  norm_num [e993TailD, e993TailB, Polynomial.derivative_pow,
    e993_tail_C2, e993_tail_C3, e993_tail_C4]
  ring
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma e993_tail_D_B3 3f9f0f521a032894483ba4629eb29dc13379cb7b74e33c1e78da533b43235a08
lemma e993_tail_D_B3 : e993TailD 3 (e993TailB 3) =
    6 + 2 * Polynomial.X + 3 * Polynomial.X ^ 2 := by
  norm_num [e993TailD, e993TailB, Polynomial.derivative_pow,
    e993_tail_C2, e993_tail_C3, e993_tail_C4]
  ring
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma e993_tail_D_B4 64b655be0c3f1cc5a94d60485602137855484dcdd55fca64831a0880ff13b1c5
lemma e993_tail_D_B4 : e993TailD 4 (e993TailB 4) =
    7 + 6 * Polynomial.X + 12 * Polynomial.X ^ 2 + 4 * Polynomial.X ^ 3 := by
  norm_num [e993TailD, e993TailB, Polynomial.derivative_pow,
    e993_tail_C2, e993_tail_C3, e993_tail_C4]
  ring
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma e993_tail_NN_DB efdb95d87f62d8071f9b0dece791e0eb68898eaa5d33d8c48b3ba71e15ead8e8
lemma e993_tail_NN_DB (a : ℕ) (ha : a = 2 ∨ a = 3 ∨ a = 4) :
    e993TailNN (e993TailD a (e993TailB a)) := by
  rcases ha with h | h | h
  · subst a
    rw [e993_tail_D_B2]
    exact e993_tail_NN_nat 5
  · subst a
    rw [e993_tail_D_B3]
    exact e993_tail_NN_add
      (e993_tail_NN_add (e993_tail_NN_nat 6)
        (e993_tail_NN_mul (e993_tail_NN_nat 2) e993_tail_NN_X))
      (e993_tail_NN_mul (e993_tail_NN_nat 3)
        (e993_tail_NN_pow e993_tail_NN_X 2))
  · subst a
    rw [e993_tail_D_B4]
    exact e993_tail_NN_add
      (e993_tail_NN_add
        (e993_tail_NN_add (e993_tail_NN_nat 7)
          (e993_tail_NN_mul (e993_tail_NN_nat 6) e993_tail_NN_X))
        (e993_tail_NN_mul (e993_tail_NN_nat 12)
          (e993_tail_NN_pow e993_tail_NN_X 2)))
      (e993_tail_NN_mul (e993_tail_NN_nat 4)
        (e993_tail_NN_pow e993_tail_NN_X 3))
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma e993_tail_NN_prod 2b5966ba8632dc22708f7a2b8d19da1aed632745799c15a907c4b44e60a4f98d
lemma e993_tail_NN_prod {m : ℕ} (r : Fin m → ℕ) (s : Finset (Fin m)) :
    e993TailNN (∏ j ∈ s, e993TailB (r j)) := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa using e993_tail_NN_one
  | @insert j s hjs ih =>
      simpa [Finset.prod_insert hjs] using e993_tail_NN_mul (e993_tail_NN_B (r j)) ih
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma e993_tail_NN_Dprod d889cdb95493c88ed64e3a957837473eed39fdf16a1d040ebd8c5565b97259d0
lemma e993_tail_NN_Dprod {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) (s : Finset (Fin m)) :
    e993TailNN (e993TailD (∑ j ∈ s, r j) (∏ j ∈ s, e993TailB (r j))) := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa [e993_tail_D_one] using e993_tail_NN_zero
  | @insert j s hjs ih =>
      have h := e993_tail_NN_add
        (e993_tail_NN_mul (e993_tail_NN_DB (r j) (hr j))
          (e993_tail_NN_prod r s))
        (e993_tail_NN_mul (e993_tail_NN_B (r j)) ih)
      simpa only [Finset.sum_insert hjs, Finset.prod_insert hjs,
        e993_tail_D_mul] using h
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma e993_tail_NN_DC 04980307f457f7e99ffff01c652c0b0d36be1407ccbc26f6b2b3ba45f5643339
lemma e993_tail_NN_DC {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) :
    e993TailNN (e993TailD (e993TailN r + 1) (e993TailC r)) := by
  have hroot : e993TailNN (e993TailD 1 (e993TailB 1)) := by
    rw [e993_tail_D_B1]
    exact e993_tail_NN_nat 4
  have h := e993_tail_NN_add
    (e993_tail_NN_mul hroot
      (e993_tail_NN_prod r Finset.univ))
    (e993_tail_NN_mul (e993_tail_NN_B 1)
      (e993_tail_NN_Dprod r hr Finset.univ))
  change e993TailNN (e993TailD ((∑ j, r j) + 1)
    (e993TailB 1 * ∏ j, e993TailB (r j)))
  rw [show (∑ j, r j) + 1 = 1 + (∑ j, r j) from Nat.add_comm _ _]
  rw [e993_tail_D_mul]
  exact h
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma e993_tail_coeff_X_derivative 578d473790c738ed4d916d7187fedd2c8902fff876aeb885b7328bccd01165f1
lemma e993_tail_coeff_X_derivative (p : Polynomial ℝ) (k : ℕ) :
    (Polynomial.X * p.derivative).coeff k = (k : ℝ) * p.coeff k := by
  cases k with
  | zero => simp
  | succ n =>
      rw [Polynomial.coeff_X_mul, Polynomial.coeff_derivative]
      push_cast
      ring
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma e993_tail_D_coeff c7e7e07d58bc2540d185c7695ff5d9ce4bd99acb29d7f83c44270765ae8649c8
lemma e993_tail_D_coeff (d k : ℕ) (p : Polynomial ℝ) :
    (e993TailD d p).coeff k =
      3 * ((k : ℝ) + 1) * p.coeff (k + 1) +
      2 * (k : ℝ) * p.coeff k - 2 * (d : ℝ) * p.coeff k := by
  have hpoly : (3 + 2 * Polynomial.X : Polynomial ℝ) * p.derivative =
      3 * p.derivative + 2 * (Polynomial.X * p.derivative) := by ring
  unfold e993TailD
  rw [hpoly, Polynomial.coeff_sub, Polynomial.coeff_add]
  rw [mul_assoc (2 : Polynomial ℝ) (d : Polynomial ℝ) p]
  simp only [Polynomial.coeff_ofNat_mul, Polynomial.coeff_natCast_mul,
    Polynomial.coeff_derivative, e993_tail_coeff_X_derivative]
  ring
-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN lemma e993_tail_C_ratio_succ b87b38d20c9f623ff66430df3d6872f6a6ce681215412319ecc3adf886c19578
lemma e993_tail_C_ratio_succ {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) (j : ℕ) :
    2 * ((e993TailN r : ℝ) + 1 - (j : ℝ)) * (e993TailC r).coeff j ≤
      3 * ((j : ℝ) + 1) * (e993TailC r).coeff (j + 1) := by
  have h := e993_tail_NN_DC r hr j
  rw [e993_tail_D_coeff] at h
  push_cast at h ⊢
  nlinarith
-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN lemma e993_tail_C_ratio 79f0a8737deda26f32b43fde95acb377caff68ffd8a451e3a3c4408983803de4
lemma e993_tail_C_ratio {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) (k : ℕ) (hk : 1 ≤ k) :
    2 * ((e993TailN r : ℝ) + 2 - (k : ℝ)) * (e993TailC r).coeff (k - 1) ≤
      3 * (k : ℝ) * (e993TailC r).coeff k := by
  obtain ⟨j, rfl⟩ : ∃ j, k = j + 1 := ⟨k - 1, by omega⟩
  convert e993_tail_C_ratio_succ r hr j using 1 <;> push_cast <;> ring
-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma e993_tail_LE_mul 9bc33f776b45e97c7d6c66e7b5e8cfafb450bdbca494086c1cece643d50b4947
lemma e993_tail_LE_mul {p q p' q' : Polynomial ℝ}
    (hp : e993TailLE p q) (hp' : e993TailLE p' q')
    (hnp' : e993TailNN p') (hnq : e993TailNN q) :
    e993TailLE (p * p') (q * q') := by
  intro n
  rw [Polynomial.coeff_mul, Polynomial.coeff_mul]
  apply Finset.sum_le_sum
  intro x hx
  exact mul_le_mul (hp x.1) (hp' x.2) (hnp' x.2) (hnq x.1)
-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN lemma e993_tail_LE_B 9f2512f5b867a2f7eed38aa5f3cebaaa7ca7fed92f32e111a5f04f7780be8034
lemma e993_tail_LE_B (a : ℕ) :
    e993TailLE ((1 + Polynomial.X : Polynomial ℝ) ^ a) (e993TailB a) := by
  intro n
  rw [e993TailB, Polynomial.coeff_add]
  exact le_add_of_nonneg_right (e993_tail_NN_X n)
-- VERITYOS ENTRY 55 END

-- VERITYOS ENTRY 56 BEGIN lemma e993_tail_LE_prod 4231ac7fe60e832bfdde28bad0aa3e58306d6a32da75e73f03cc7843271c0bb3
lemma e993_tail_LE_prod {m : ℕ} (r : Fin m → ℕ) (s : Finset (Fin m)) :
    e993TailLE ((1 + Polynomial.X : Polynomial ℝ) ^ (∑ j ∈ s, r j))
      (∏ j ∈ s, e993TailB (r j)) := by
  classical
  induction s using Finset.induction_on with
  | empty => intro n; simp
  | @insert j s hjs ih =>
      have h := e993_tail_LE_mul (e993_tail_LE_B (r j)) ih
        (e993_tail_NN_pow e993_tail_NN_L (∑ j ∈ s, r j)) (e993_tail_NN_B (r j))
      simpa only [Finset.sum_insert hjs, Finset.prod_insert hjs, pow_add] using h
-- VERITYOS ENTRY 56 END

-- VERITYOS ENTRY 57 BEGIN lemma e993_tail_LE_C bfe0495d9d2252b6abfa4fc1527840dff00dfe41c34e32be32e0e20ffa50a216
lemma e993_tail_LE_C {m : ℕ} (r : Fin m → ℕ) :
    e993TailLE ((1 + Polynomial.X : Polynomial ℝ) ^ (e993TailN r + 1))
      (e993TailC r) := by
  have h := e993_tail_LE_mul (e993_tail_LE_B 1)
    (e993_tail_LE_prod r Finset.univ)
    (e993_tail_NN_pow e993_tail_NN_L (∑ j, r j))
    (e993_tail_NN_B 1)
  intro n
  change ((1 + Polynomial.X : Polynomial ℝ) ^ (e993TailN r + 1)).coeff n ≤
    (e993TailB 1 * ∏ j, e993TailB (r j)).coeff n
  rw [show e993TailN r + 1 = 1 + e993TailN r from Nat.add_comm _ _, pow_add]
  simpa only [e993TailN, pow_one] using h n
-- VERITYOS ENTRY 57 END

-- VERITYOS ENTRY 58 BEGIN lemma e993_tail_LE_U a1fb832ffc5deca165f75c783ff5a5a68b874db424ef18bb620f2ee03369fa6c
lemma e993_tail_LE_U {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hi : 1 ≤ r i) :
    e993TailLE ((1 + Polynomial.X : Polynomial ℝ) ^ e993TailN r)
      (e993TailU r i) := by
  let s : Finset (Fin m) := Finset.univ.erase i
  have hsum : 1 + (r i - 1) + (∑ j ∈ s, r j) = e993TailN r := by
    have h := Finset.add_sum_erase (Finset.univ : Finset (Fin m)) r (Finset.mem_univ i)
    dsimp [e993TailN, s]
    omega
  have hfirst := e993_tail_LE_mul (e993_tail_LE_B 1)
    (e993_tail_LE_B (r i - 1))
    (e993_tail_NN_pow e993_tail_NN_L (r i - 1)) (e993_tail_NN_B 1)
  have h := e993_tail_LE_mul hfirst (e993_tail_LE_prod r s)
    (e993_tail_NN_pow e993_tail_NN_L (∑ j ∈ s, r j))
    (e993_tail_NN_mul (e993_tail_NN_B 1) (e993_tail_NN_B (r i - 1)))
  intro n
  change ((1 + Polynomial.X : Polynomial ℝ) ^ e993TailN r).coeff n ≤
    (e993TailB 1 * e993TailB (r i - 1) *
      ∏ j ∈ (Finset.univ : Finset (Fin m)).erase i, e993TailB (r j)).coeff n
  rw [← hsum, pow_add, pow_add, pow_one]
  simpa only [s, pow_one] using h n
-- VERITYOS ENTRY 58 END

-- VERITYOS ENTRY 59 BEGIN lemma e993_tail_C_coeff_floor 6319bc7ee7893235f7662cf886e1037d1074361184dd75bda594e1fc7d1c0274
lemma e993_tail_C_coeff_floor {m : ℕ} (r : Fin m → ℕ) (k : ℕ) :
    ((e993TailN r + 1).choose k : ℝ) ≤ (e993TailC r).coeff k := by
  simpa only [Polynomial.coeff_one_add_X_pow] using e993_tail_LE_C r k
-- VERITYOS ENTRY 59 END

-- VERITYOS ENTRY 60 BEGIN lemma e993_tail_U_coeff_floor 99e033b73d1185528d6ef1315263163a2da5b99f2b8366e790b42c11903b0c4e
lemma e993_tail_U_coeff_floor {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hi : 1 ≤ r i) (k : ℕ) :
    ((e993TailN r).choose k : ℝ) ≤ (e993TailU r i).coeff k := by
  simpa only [Polynomial.coeff_one_add_X_pow] using e993_tail_LE_U r i hi k
-- VERITYOS ENTRY 60 END

-- VERITYOS ENTRY 61 BEGIN lemma e993_card_ambient d708ee04400e30935a78f0cba408a971a68080af5f69dd6c271afb19580f6d25
lemma e993_card_ambient {ι : Type*} [Fintype ι]
    (r : ι → ℕ) : Fintype.card (Σ i, Fin (r i)) = ∑ i, r i := by
  simp [Fintype.card_sigma]
-- VERITYOS ENTRY 61 END

-- VERITYOS ENTRY 62 BEGIN lemma e993_card_subsets f0539cc57b797b0638d5c9442163444386837d709526c0395f4dc0bad4c4205f
lemma e993_card_subsets {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (k : ℕ) :
    ((Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k).card =
      (∑ i, r i).choose k := by
  rw [Finset.card_powersetCard, Finset.card_univ, e993_card_ambient]
-- VERITYOS ENTRY 62 END

-- VERITYOS ENTRY 63 BEGIN lemma e993_mass_pos 6b3d90955167199ee7653df0e967d4c2f244ffbfad6e42b986811a9868693faf
lemma e993_mass_pos {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (k : ℕ) (hk : k ≤ ∑ i, r i) :
    0 < e993BlockMass r k := by
  unfold e993BlockMass
  exact_mod_cast Nat.choose_pos hk
-- VERITYOS ENTRY 63 END

-- VERITYOS ENTRY 64 BEGIN lemma e993_taylor_le d33282ff8ec332f896e150a9458f5a8abefa017c790483e30eedf9f2d1ceee83
lemma e993_taylor_le (d : ℕ) {y : ℝ} (hy : 0 ≤ y) :
    e993ExpTaylor d y ≤ Real.exp y := by
  simpa [e993ExpTaylor] using Real.sum_le_exp_of_nonneg hy (d + 1)
-- VERITYOS ENTRY 64 END

-- VERITYOS ENTRY 65 BEGIN lemma e993_scalar_log 07e90e165093497955abe6dd85665533e82faeeffe3a041f1356166373e4ea31
lemma e993_scalar_log {c f : ℝ} (hc : 0 < c) (hcf : c ≤ f) :
    2 * (f - c) / (f + c) ≤ Real.log (f / c) := by
  have h : 0 ≤ f / c - 1 := by
    apply sub_nonneg.mpr
    exact (le_div_iff₀ hc).2 (by simpa using hcf)
  have hlog := Real.le_log_one_add_of_nonneg h
  convert hlog using 1 <;> field_simp <;> ring
-- VERITYOS ENTRY 65 END

-- VERITYOS ENTRY 66 BEGIN lemma e993_exponent_nonneg 382d32f707d14ffa71fe66ca089b62da9c51207efe16c2078e7ba5a49870101e
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
-- VERITYOS ENTRY 66 END

-- VERITYOS ENTRY 67 BEGIN lemma e993_rebuild_fibers 012104ad43177c02ae5b475ee9eefed1f7f606360d01fc4b3f07705038ae11e8
lemma e993_rebuild_fibers {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) :
    (Finset.univ : Finset ι).sigma (e993Fiber r S) = S := by
  ext ⟨i, v⟩
  simp [e993Fiber]
-- VERITYOS ENTRY 67 END

-- VERITYOS ENTRY 68 BEGIN lemma e993_count_eq_fiber_card 368c51d64851f7f20af77a85f32c11298d612e19a7a7da205e5fb62b6b46c138
lemma e993_count_eq_fiber_card {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) (i : ι) :
    e993BlockCount r S i = (e993Fiber r S i).card := rfl
-- VERITYOS ENTRY 68 END

-- VERITYOS ENTRY 69 BEGIN lemma e993_sum_counts d47d582bcc25c153d6e521c62db76b246a951657af47e779123f005b3d2b4eee
lemma e993_sum_counts {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) :
    ∑ i, e993BlockCount r S i = S.card := by
  calc
    ∑ i, e993BlockCount r S i = ∑ i, (e993Fiber r S i).card := by rfl
    _ = ((Finset.univ : Finset ι).sigma (e993Fiber r S)).card := by
      rw [Finset.card_sigma]
    _ = S.card := by rw [e993_rebuild_fibers]
-- VERITYOS ENTRY 69 END

-- VERITYOS ENTRY 70 BEGIN lemma e993_count_le bf48bbb98d098f6fa5e55f516a19f1b04add684626e075f1978a7c782ffe0167
lemma e993_count_le {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ i, Fin (r i))) (i : ι) :
    e993BlockCount r S i ≤ r i := by
  rw [e993_count_eq_fiber_card]
  simpa [e993Fiber] using (Finset.card_le_card
    (Finset.filter_subset (fun v : Fin (r i) => Sigma.mk i v ∈ S) Finset.univ))
-- VERITYOS ENTRY 70 END

-- VERITYOS ENTRY 71 BEGIN lemma e993_prod_monomial f547d3d2fd7e41c659166de8b5277caea8771076b9b4eec75eaacfad9ae463ec
lemma e993_prod_monomial {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (t : ι → ℕ) (a : ι → ℝ) :
    (∏ i ∈ s, Polynomial.monomial (t i) (a i)) =
      Polynomial.monomial (∑ i ∈ s, t i) (∏ i ∈ s, a i) := by
  induction s using Finset.induction with
  | empty => simp
  | @insert i s hi ih =>
      simp [Finset.prod_insert hi, Finset.sum_insert hi, ih,
        Polynomial.monomial_mul_monomial]
-- VERITYOS ENTRY 71 END

-- VERITYOS ENTRY 72 BEGIN lemma e993_coeff_expansion 648534608ba8d2116cbe179ea8a1cb0498d4b48c92e54f16063790751a3f9344
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
-- VERITYOS ENTRY 72 END

-- VERITYOS ENTRY 73 BEGIN lemma e993_finite_jensen b562c54e9a86c695cd41f328d309292734653159348828c21c2874b3032e8890
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
-- VERITYOS ENTRY 73 END

-- VERITYOS ENTRY 74 BEGIN lemma e993_weight_ge_one b01eb53d9f2cf1883591c30b522458ad76f29f2eb2b84dccf909901e7185bf3c
lemma e993_weight_ge_one {ι : Type*} [Fintype ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ)
    (hf : ∀ i t, t ≤ r i → ((r i).choose t : ℝ) ≤ f i t)
    (i : ι) (t : ℕ) (ht : t ≤ r i) :
    1 ≤ f i t / ((r i).choose t : ℝ) := by
  have hc : (0 : ℝ) < (r i).choose t := by exact_mod_cast Nat.choose_pos ht
  exact (le_div_iff₀ hc).2 (by simpa using hf i t ht)
-- VERITYOS ENTRY 74 END

-- VERITYOS ENTRY 75 BEGIN lemma e993_exp_log_product f8b9d524dde3bdd09a685cff4c627f3ea57ee9c6a89f37438a670b8965ed90f4
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
-- VERITYOS ENTRY 75 END

-- VERITYOS ENTRY 76 BEGIN lemma e993_pointwise_log b01bf4323bcaa9052a4a3c28666def908a62e093cda166cf074f8eb47d35974e
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
-- VERITYOS ENTRY 76 END

-- VERITYOS ENTRY 77 BEGIN lemma e993_card_block_fiber 80284d71229e0eb059417393db7232026b6ab4ae2d9380dda394ee6f72ec2b65
lemma e993_card_block_fiber (n t : ℕ) :
    Fintype.card {T : Finset (Fin n) // T.card = t} = n.choose t := by
  classical
  rw [Fintype.card_subtype]
  rw [← Finset.powerset_univ (α := Fin n)]
  rw [← Finset.powersetCard_eq_filter]
  simp
-- VERITYOS ENTRY 77 END

-- VERITYOS ENTRY 78 BEGIN lemma e993_card_joint_fiber c0aa6fad5f749760360e5ee1f04c5dd39445462b72694550e60717ba10f43596
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
-- VERITYOS ENTRY 78 END

-- VERITYOS ENTRY 79 BEGIN lemma e993_card_rank_fiber 2d7d968a3b4831a5bdc2f941ba714399023bba006db0b4762eab8dadd1601daf
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
-- VERITYOS ENTRY 79 END

-- VERITYOS ENTRY 80 BEGIN lemma e993_countvec_eq_iff 065da4e601598c021782237e5faab1cc504d624669711af55934fd4f361a36db
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
-- VERITYOS ENTRY 80 END

-- VERITYOS ENTRY 81 BEGIN lemma e993_prod_choose_mul_weight ac90a34f0372dcab2c8c31ffa631a4661761c1cb8648df1ceb0fd82b9205220b
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
-- VERITYOS ENTRY 81 END

-- VERITYOS ENTRY 82 BEGIN lemma e993_actual_sum_eq_count_sum 32feeb2d40a84cfd4c4e5390671f9e4eb43d016d1fcd6da30dbd35fca1b4997d
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
-- VERITYOS ENTRY 82 END

-- VERITYOS ENTRY 83 BEGIN lemma e993_coeff_actual e74f5f25efce57e6d0171f41d50bfb5fe9a9419f456334b3f26951179c390564
lemma e993_coeff_actual {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) :
    (e993BlockProduct r f).coeff k =
      ∑ S ∈ (Finset.univ : Finset (Σ i, Fin (r i))).powersetCard k,
        ∏ i, f i (e993BlockCount r S i) /
          ((r i).choose (e993BlockCount r S i) : ℝ) := by
  rw [e993_coeff_expansion, e993_actual_sum_eq_count_sum]
-- VERITYOS ENTRY 83 END

-- VERITYOS ENTRY 84 BEGIN lemma e993_coefficient_average 739048576c7fbba3e0815e300979a8e5f548d3a66e95bcd91898561d1d867fab
lemma e993_coefficient_average {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (f : ι → ℕ → ℝ) (k : ℕ) :
    (e993BlockProduct r f).coeff k / e993BlockMass r k =
      e993SubsetAverage r f k := by
  unfold e993SubsetAverage e993BlockMass
  rw [e993_coeff_actual, e993_card_subsets]
-- VERITYOS ENTRY 84 END

-- VERITYOS ENTRY 85 BEGIN lemma e993_card_inter_fiber d3db140f9a8364abd484ae61a4cd20e3aa5a1d2f4d9af7133e46f9b7be6488ce
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
-- VERITYOS ENTRY 85 END

-- VERITYOS ENTRY 86 BEGIN lemma e993_blockset_card 54df21fb0ba5ae093cdd6e92ec84508fc2570b0d1e8b00044c24ab0be6e9cb07
lemma e993_blockset_card {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (i : ι) : (e993BlockSet r i).card = r i := by
  unfold e993BlockSet
  rw [Finset.card_image_of_injective]
  · simp
  · intro a b h
    exact HEq.eq (Sigma.mk.inj_iff.mp h).2
-- VERITYOS ENTRY 86 END

-- VERITYOS ENTRY 87 BEGIN lemma e993_fiber_image 5709293a20455b2d4dd2e50648de0f6db8f195eb62f3d7d0dea8b77cec5003a2
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
-- VERITYOS ENTRY 87 END

-- VERITYOS ENTRY 88 BEGIN lemma e993_count_inter 337a7acc920ad414b4640d57d11f83cdc510c6bac56acc6ca0a412820f2c491f
lemma e993_count_inter {ι : Type*} [Fintype ι] [DecidableEq ι]
    (r : ι → ℕ) (S : Finset (Σ j, Fin (r j))) (i : ι) :
    e993BlockCount r S i = (S ∩ e993BlockSet r i).card := by
  rw [e993_count_eq_fiber_card, ← e993_fiber_image r S i]
  rw [Finset.card_image_of_injective]
  intro a b h
  exact HEq.eq (Sigma.mk.inj_iff.mp h).2
-- VERITYOS ENTRY 88 END

-- VERITYOS ENTRY 89 BEGIN lemma e993_marginal_count 1fa1cba6fe4b84d64110fc78273976dcb6e94fd10db3796cefcdef0e10cbc2b6
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
-- VERITYOS ENTRY 89 END

-- VERITYOS ENTRY 90 BEGIN lemma e993_marginal_sum c55f6b37ff74402d53b60598353887ca1b5d69b7c9d60c3b6265eb982c97dd2a
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
-- VERITYOS ENTRY 90 END

-- VERITYOS ENTRY 91 BEGIN lemma e993_exponent_eq_average 50f5809fc788b1c09e393425f963d4b8b39d1897ea759798aa13684712a545f8
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
-- VERITYOS ENTRY 91 END

-- VERITYOS ENTRY 92 BEGIN lemma e993_finite_block_coefficient_jensen fe9ea3ff59067f1d779c66b74cceb3e7827052f8278bcf4a4a55655ac66168f7
lemma e993_finite_block_coefficient_jensen
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
-- VERITYOS ENTRY 92 END

-- VERITYOS ENTRY 93 BEGIN lemma e993_tail_B_degree e8d4204ebdbde8879f2ae94fb6aa10a6f9f673bf8ac47baceb8fcaa7585fb62c
lemma e993_tail_B_degree (a : ℕ) (ha : 1 ≤ a) :
    (e993TailB a).natDegree ≤ a := by
  have hL : (1 + Polynomial.X : Polynomial ℝ).natDegree ≤ 1 := by
    rw [add_comm]
    change (Polynomial.X + Polynomial.C (1 : ℝ)).natDegree ≤ 1
    rw [Polynomial.natDegree_X_add_C]
  have hp : ((1 + Polynomial.X : Polynomial ℝ) ^ a).natDegree ≤ a := by
    calc
      _ ≤ a * (1 + Polynomial.X : Polynomial ℝ).natDegree := Polynomial.natDegree_pow_le
      _ ≤ a * 1 := Nat.mul_le_mul_left a hL
      _ = a := by omega
  unfold e993TailB
  exact Polynomial.natDegree_add_le_of_degree_le hp (by simpa using ha)
-- VERITYOS ENTRY 93 END

-- VERITYOS ENTRY 94 BEGIN lemma e993_tail_B_sum_monomial 7a9abd87d90f144ff2256607e9de0b2618915e0264041a3f626935fa5f918078
lemma e993_tail_B_sum_monomial (a : ℕ) (ha : 1 ≤ a) :
    (∑ t ∈ Finset.range (a + 1),
      Polynomial.monomial t ((e993TailB a).coeff t)) = e993TailB a := by
  symm
  exact Polynomial.as_sum_range' (e993TailB a) (a + 1)
    (Nat.lt_succ_of_le (e993_tail_B_degree a ha))
-- VERITYOS ENTRY 94 END

-- VERITYOS ENTRY 95 BEGIN lemma e993_tail_block_pos 6b8812dc902e12fd2760af44dcd96fa462faab3bc3c9e7c4184cc33c00b14c0e
lemma e993_tail_block_pos {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4) :
    ∀ b, 0 < e993TailBlockSize r i b := by
  intro b
  cases b with
  | none => simp [e993TailBlockSize]
  | some j =>
      by_cases hji : j = i
      · subst j
        rcases hr i with h | h | h <;> simp [e993TailBlockSize, h]
      · rcases hr j with h | h | h <;> simp [e993TailBlockSize, hji, h]
-- VERITYOS ENTRY 95 END

-- VERITYOS ENTRY 96 BEGIN lemma e993_tail_block_sum 38a2eb5ddbc8f57f4e7ef01b3f9552ed556ad94164716afead90776d6ea49440
lemma e993_tail_block_sum {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hi : 1 ≤ r i) :
    (∑ b, e993TailBlockSize r i b) = e993TailN r := by
  classical
  rw [Fintype.sum_option]
  change 1 + (∑ j, if j = i then r i - 1 else r j) = e993TailN r
  have hfix := Finset.add_sum_erase (Finset.univ : Finset (Fin m))
    (fun j => if j = i then r i - 1 else r j) (Finset.mem_univ i)
  have hfix' : (∑ j, if j = i then r i - 1 else r j) =
      (r i - 1) + ∑ j ∈ (Finset.univ : Finset (Fin m)).erase i, r j := by
    rw [← hfix]
    simp only [if_pos rfl]
    congr 1
    apply Finset.sum_congr rfl
    intro j hj
    have hne : j ≠ i := (Finset.mem_erase.mp hj).1
    simp [hne]
  have horig := Finset.add_sum_erase (Finset.univ : Finset (Fin m))
    r (Finset.mem_univ i)
  rw [hfix']
  unfold e993TailN
  omega
-- VERITYOS ENTRY 96 END

-- VERITYOS ENTRY 97 BEGIN lemma e993_tail_block_product 3ba61458cad83c61c96d8fbb59f63df7d856790026dfc8c0d2ae95e2f7d77618
lemma e993_tail_block_product {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4) :
    e993BlockProduct (e993TailBlockSize r i)
      (fun b t => (e993TailB (e993TailBlockSize r i b)).coeff t) = e993TailU r i := by
  classical
  unfold e993BlockProduct
  simp_rw [e993_tail_B_sum_monomial _ (e993_tail_block_pos r i hr _)]
  rw [Fintype.prod_option]
  change e993TailB 1 * (∏ j, e993TailB (if j = i then r i - 1 else r j)) =
    e993TailU r i
  have hfix := Finset.mul_prod_erase (Finset.univ : Finset (Fin m))
    (fun j => e993TailB (if j = i then r i - 1 else r j)) (Finset.mem_univ i)
  have hfix' : (∏ j, e993TailB (if j = i then r i - 1 else r j)) =
      e993TailB (r i - 1) *
        ∏ j ∈ (Finset.univ : Finset (Fin m)).erase i, e993TailB (r j) := by
    rw [← hfix]
    simp only [if_pos rfl]
    congr 1
    apply Finset.prod_congr rfl
    intro j hj
    have hne : j ≠ i := (Finset.mem_erase.mp hj).1
    simp [hne]
  rw [hfix']
  simp only [e993TailU, mul_assoc]
-- VERITYOS ENTRY 97 END

-- VERITYOS ENTRY 98 BEGIN lemma e993_tail_block_floor 9610e9e8910ea77e373258bc092f5c99a3d5d78601f503d155bc08cccfeb3e78
lemma e993_tail_block_floor {m : ℕ} (r : Fin m → ℕ) (i : Fin m) :
    ∀ b t, t ≤ e993TailBlockSize r i b →
      (((e993TailBlockSize r i b).choose t : ℝ) ≤
        (e993TailB (e993TailBlockSize r i b)).coeff t) := by
  intro b t ht
  rw [e993TailB, Polynomial.coeff_add, Polynomial.coeff_one_add_X_pow]
  exact le_add_of_nonneg_right (e993_tail_NN_X t)
-- VERITYOS ENTRY 98 END

-- VERITYOS ENTRY 99 BEGIN lemma e993_tail_jensen_raw 875f7b0e5da723a82fdc54b0c289c26beec90cf0d1bd9e4474f9da11e9ccf86f
lemma e993_tail_jensen_raw {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4) (i : Fin m)
    (k : ℕ) (hk : k ≤ e993TailN r) :
    ((e993TailN r).choose k : ℝ) *
      Real.exp (e993BlockExponent (e993TailBlockSize r i)
        (fun b t => (e993TailB (e993TailBlockSize r i b)).coeff t) k) ≤
      (e993TailU r i).coeff k := by
  have hi : 1 ≤ r i := by
    rcases hr i with h | h | h <;> omega
  have hj := (e993_finite_block_coefficient_jensen
    (e993TailBlockSize r i) (e993_tail_block_pos r i hr)
    (fun b t => (e993TailB (e993TailBlockSize r i b)).coeff t)
    (e993_tail_block_floor r i) k 0
    (by simpa only [e993_tail_block_sum r i hi] using hk)).2.1
  rw [e993_tail_block_product r i hr, e993BlockMass,
    e993_tail_block_sum r i hi] at hj
  exact hj
-- VERITYOS ENTRY 99 END

-- VERITYOS ENTRY 100 BEGIN lemma e993_tail_exp_base 07b7cbb198ac2ad5d80ba9887ab97513c74c9f14dbb09afc14c5605ca5696867
lemma e993_tail_exp_base : (102 : ℝ) < Real.exp (99 / 20 : ℝ) := by
  have h := e993_taylor_le 8 (show 0 ≤ (99 / 20 : ℝ) by norm_num)
  have hnum : (102 : ℝ) < e993ExpTaylor 8 (99 / 20 : ℝ) := by
    norm_num [e993ExpTaylor, Finset.sum_range_succ]
  exact lt_of_lt_of_le hnum h
-- VERITYOS ENTRY 100 END

-- VERITYOS ENTRY 101 BEGIN lemma e993_tail_exp_growth 1f4cdb1284a7deb93e9634404aafa7148b7fd88abdaa552e9fd646c26927f437
lemma e993_tail_exp_growth (m : ℕ) (hm : 100 ≤ m) :
    (m : ℝ) + 2 < Real.exp (((m - 1 : ℕ) : ℝ) / 20) := by
  let t : ℝ := ((m : ℝ) - 100) / 20
  have hmR : (100 : ℝ) ≤ m := by exact_mod_cast hm
  have ht : 0 ≤ t := by dsimp [t]; positivity
  have hm1 : 1 ≤ m := by omega
  have hdecomp : (((m - 1 : ℕ) : ℝ) / 20) = 99 / 20 + t := by
    rw [Nat.cast_sub hm1]
    dsimp [t]
    push_cast
    ring
  have he : 1 + t ≤ Real.exp t := by simpa [add_comm] using Real.add_one_le_exp t
  have hstrict : (102 : ℝ) * Real.exp t < Real.exp (99 / 20 : ℝ) * Real.exp t :=
    mul_lt_mul_of_pos_right e993_tail_exp_base (Real.exp_pos t)
  have hlow : (102 : ℝ) * (1 + t) ≤ 102 * Real.exp t := by nlinarith
  have hfirst : (m : ℝ) + 2 ≤ 102 * (1 + t) := by
    dsimp [t]
    nlinarith
  rw [hdecomp, Real.exp_add]
  exact lt_of_le_of_lt (hfirst.trans hlow) hstrict
-- VERITYOS ENTRY 101 END

-- VERITYOS ENTRY 102 BEGIN lemma e993_tail_guard_le_N 92f29908e78c2065bfa658a5fadd2590a338742fba3cd96a387b190c5f9c15a9
lemma e993_tail_guard_le_N {m : ℕ} (r : Fin m → ℕ)
    (hm : 100 ≤ m) (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (k : ℕ) (hguard : 2 * k ≤ e993TailN r + 2) :
    k ≤ e993TailN r := by
  have hN := e993_tail_arity_lower r hr
  omega
-- VERITYOS ENTRY 102 END

-- VERITYOS ENTRY 103 BEGIN lemma e993_tail_choose_adjacent 9a7c3ce014b3622656edf71270a35a2fba5303e799e52a38b0c85a9c15691453
lemma e993_tail_choose_adjacent (N k : ℕ) (hk : 1 ≤ k) (hkN : k ≤ N) :
    (N.choose k : ℝ) * (k : ℝ) =
      (N.choose (k - 1) : ℝ) * ((N : ℝ) + 1 - (k : ℝ)) := by
  have hnat := Nat.choose_succ_right_eq N (k - 1)
  have hkm : k - 1 + 1 = k := by omega
  rw [hkm] at hnat
  have hrem : N - (k - 1) = N + 1 - k := by omega
  rw [hrem] at hnat
  have hreal : (N.choose k : ℝ) * (k : ℝ) =
      (N.choose (k - 1) : ℝ) * ((N + 1 - k : ℕ) : ℝ) := by
    exact_mod_cast hnat
  rw [hreal, Nat.cast_sub (by omega : k ≤ N + 1)]
  push_cast
  ring
-- VERITYOS ENTRY 103 END

-- VERITYOS ENTRY 104 BEGIN lemma e993_tail_C_coeff_pos 19b64397c6a8232d13454ad7f6d69c555714c18ccbaf4a7125a314e57a4f0f3e
lemma e993_tail_C_coeff_pos {m : ℕ} (r : Fin m → ℕ) (k : ℕ)
    (hk : k ≤ e993TailN r + 1) : 0 < (e993TailC r).coeff k := by
  have hchoose : 0 < ((e993TailN r + 1).choose k : ℝ) := by
    exact_mod_cast Nat.choose_pos hk
  exact lt_of_lt_of_le hchoose (e993_tail_C_coeff_floor r k)
-- VERITYOS ENTRY 104 END

-- VERITYOS ENTRY 105 BEGIN lemma e993_tail_U_coeff_pos 1fedb9ba5ee92c6dd0964033efc55086e7f0e0dc939e887640d3a4d4b4a46375
lemma e993_tail_U_coeff_pos {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hi : 1 ≤ r i) (k : ℕ) (hk : k ≤ e993TailN r) :
    0 < (e993TailU r i).coeff k := by
  have hchoose : 0 < ((e993TailN r).choose k : ℝ) := by
    exact_mod_cast Nat.choose_pos hk
  exact lt_of_lt_of_le hchoose (e993_tail_U_coeff_floor r i hi k)
-- VERITYOS ENTRY 105 END

-- VERITYOS ENTRY 106 BEGIN lemma e993_tail_minor_half d869c0a5164c5b0c7018a15d2b4953df0c29db54cf8aa9d91e1c7aaf05a44a96
lemma e993_tail_minor_half {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (k : ℕ) (hk : 1 ≤ k) (hkN : k ≤ e993TailN r) :
    -(((e993TailN r).choose (k - 1) : ℝ) * (e993TailC r).coeff k) / 2 <
      (e993TailE r).coeff k * (e993TailC r).coeff k -
        (e993TailE r).coeff (k + 1) * (e993TailC r).coeff (k - 1) := by
  let N := e993TailN r
  let e : ℝ := (N.choose (k - 1) : ℝ)
  let c : ℝ := (N.choose k : ℝ)
  let A : ℝ := (e993TailC r).coeff k
  let B : ℝ := (e993TailC r).coeff (k - 1)
  have he : 0 < e := by
    dsimp [e, N]
    exact_mod_cast Nat.choose_pos (by omega : k - 1 ≤ e993TailN r)
  have hB : 0 < B := by
    dsimp [B]
    apply e993_tail_C_coeff_pos
    omega
  have hkR : (0 : ℝ) < k := by exact_mod_cast hk
  have hchoose : c * (k : ℝ) = e * ((N : ℝ) + 1 - (k : ℝ)) :=
    e993_tail_choose_adjacent N k hk hkN
  have hratio : 2 * ((N : ℝ) + 2 - (k : ℝ)) * B ≤ 3 * (k : ℝ) * A :=
    e993_tail_C_ratio r hr k hk
  have hmul : 0 ≤ e * (3 * (k : ℝ) * A - 2 * ((N : ℝ) + 2 - (k : ℝ)) * B) :=
    mul_nonneg (le_of_lt he) (sub_nonneg.mpr hratio)
  have hchooseB : c * (k : ℝ) * B =
      e * ((N : ℝ) + 1 - (k : ℝ)) * B := congrArg (· * B) hchoose
  have hstep : 0 < (k : ℝ) * (3 * e * A - 2 * c * B) := by
    nlinarith [mul_pos he hB]
  have hhalf : 0 < 3 * e * A - 2 * c * B := by
    nlinarith [hstep]
  rw [e993_tail_E_coeff r k hk, e993_tail_E_coeff_succ]
  dsimp [e, c, A, B, N] at hhalf ⊢
  nlinarith
-- VERITYOS ENTRY 106 END

-- VERITYOS ENTRY 107 BEGIN lemma e993_tail_numeric_payment b0d42d85a5b68c8b0ad88874c1a272562714ae0dff9e0c33aa7d176e09d11ece
lemma e993_tail_numeric_payment (m N k : ℕ)
    (hm : 100 ≤ m) (hNlo : 2 * m ≤ N) (hNhi : N ≤ 4 * m)
    (hk : 1 ≤ k) (hguard : 2 * k ≤ N + 2) :
    (k : ℝ) * ((k : ℝ) + 1) <
      2 * ((m : ℝ) + 2) * ((N : ℝ) + 1 - (k : ℝ)) := by
  have hmR : (100 : ℝ) ≤ m := by exact_mod_cast hm
  have hNloR : 2 * (m : ℝ) ≤ N := by exact_mod_cast hNlo
  have hNhiR : (N : ℝ) ≤ 4 * m := by exact_mod_cast hNhi
  have hkR : (1 : ℝ) ≤ k := by exact_mod_cast hk
  have hgR : 2 * (k : ℝ) ≤ N + 2 := by exact_mod_cast hguard
  have ha : ((N : ℝ) + 2) / 2 ≤ 2 * ((m : ℝ) + 2) := by nlinarith
  have hb : (N : ℝ) / 2 ≤ (N : ℝ) + 1 - (k : ℝ) := by nlinarith
  have hc : 0 ≤ (N : ℝ) / 2 := by positivity
  have hd : 0 ≤ 2 * ((m : ℝ) + 2) := by positivity
  have hleft : (((N : ℝ) + 2) / 2) * ((N : ℝ) / 2) ≤
      2 * ((m : ℝ) + 2) * ((N : ℝ) + 1 - (k : ℝ)) := by
    exact mul_le_mul ha hb hc hd
  have he : (k : ℝ) ≤ ((N : ℝ) + 2) / 2 := by nlinarith
  have hf : (k : ℝ) + 1 ≤ ((N : ℝ) + 4) / 2 := by nlinarith
  have hg : 0 ≤ (k : ℝ) + 1 := by positivity
  have hh : 0 ≤ ((N : ℝ) + 2) / 2 := by positivity
  have hright : (k : ℝ) * ((k : ℝ) + 1) ≤
      (((N : ℝ) + 2) / 2) * (((N : ℝ) + 4) / 2) := by
    exact mul_le_mul he hf hg hh
  nlinarith [hleft, hright]
-- VERITYOS ENTRY 107 END

-- VERITYOS ENTRY 108 BEGIN lemma e993_tail_payment_from_U 13e15adfcfc19f88313a5671c8fecc563b5dceef44e282388058e577af9b7b02
lemma e993_tail_payment_from_U
    (m : ℕ) (hm : 100 ≤ m) (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (i : Fin m) (k : ℕ) (hk : 1 ≤ k)
    (hguard : 2 * k ≤ e993TailN r + 2)
    (hU : ((e993TailN r).choose k : ℝ) * ((m : ℝ) + 2) <
      (e993TailU r i).coeff k) :
    0 < ((e993TailH r : ℝ) + 1) * (e993TailU r i).coeff k *
        (e993TailC r).coeff k +
      ((k : ℝ) + 1) * ((e993TailH r : ℝ) - (k : ℝ) + 1) *
        ((e993TailE r).coeff k * (e993TailC r).coeff k -
          (e993TailE r).coeff (k + 1) * (e993TailC r).coeff (k - 1)) := by
  let N := e993TailN r
  let H := e993TailH r
  let e : ℝ := (N.choose (k - 1) : ℝ)
  let c : ℝ := (N.choose k : ℝ)
  let U : ℝ := (e993TailU r i).coeff k
  let A : ℝ := (e993TailC r).coeff k
  let M : ℝ := (e993TailE r).coeff k * A -
    (e993TailE r).coeff (k + 1) * (e993TailC r).coeff (k - 1)
  let g : ℝ := ((k : ℝ) + 1) * ((H : ℝ) - (k : ℝ) + 1)
  have hNlo : 2 * m ≤ N := e993_tail_arity_lower r hr
  have hNhi : N ≤ 4 * m := e993_tail_arity_upper r hr
  have hH : N + 1 ≤ H := e993_tail_order_lower r hr
  have hkN : k ≤ N := e993_tail_guard_le_N r hm hr k hguard
  have he : 0 < e := by
    dsimp [e, N]
    exact_mod_cast Nat.choose_pos (by omega : k - 1 ≤ e993TailN r)
  have hc : 0 < c := by
    dsimp [c, N]
    exact_mod_cast Nat.choose_pos hkN
  have hA : 0 < A := e993_tail_C_coeff_pos r k (by omega)
  have hkR : (0 : ℝ) < k := by exact_mod_cast hk
  have hHreal : (N : ℝ) + 1 ≤ H := by exact_mod_cast hH
  have hkNR : (k : ℝ) ≤ N := by exact_mod_cast hkN
  have hcurv : 0 < (H : ℝ) - (k : ℝ) + 1 := by nlinarith
  have hHpos : 0 < (H : ℝ) + 1 := by nlinarith
  have hg : 0 < g := mul_pos (by positivity) hcurv
  have hchoose : c * (k : ℝ) = e * ((N : ℝ) + 1 - (k : ℝ)) :=
    e993_tail_choose_adjacent N k hk hkN
  have hnum : (k : ℝ) * ((k : ℝ) + 1) <
      2 * ((m : ℝ) + 2) * ((N : ℝ) + 1 - (k : ℝ)) :=
    e993_tail_numeric_payment m N k hm hNlo hNhi hk hguard
  have hnumE := mul_lt_mul_of_pos_left hnum he
  have hchooseM : 2 * ((m : ℝ) + 2) * (c * (k : ℝ)) =
      2 * ((m : ℝ) + 2) * (e * ((N : ℝ) + 1 - (k : ℝ))) :=
    congrArg (2 * ((m : ℝ) + 2) * ·) hchoose
  have hbaseK : (k : ℝ) * (e * ((k : ℝ) + 1)) <
      (k : ℝ) * (2 * c * ((m : ℝ) + 2)) := by
    nlinarith [hnumE, hchooseM]
  have hbase : e * ((k : ℝ) + 1) < 2 * c * ((m : ℝ) + 2) := by
    nlinarith [hbaseK]
  have hscale : g * e < 2 * ((H : ℝ) + 1) * c * ((m : ℝ) + 2) := by
    calc
      g * e = ((H : ℝ) - (k : ℝ) + 1) * (e * ((k : ℝ) + 1)) := by dsimp [g]; ring
      _ < ((H : ℝ) - (k : ℝ) + 1) * (2 * c * ((m : ℝ) + 2)) :=
        mul_lt_mul_of_pos_left hbase hcurv
      _ ≤ ((H : ℝ) + 1) * (2 * c * ((m : ℝ) + 2)) := by
        apply mul_le_mul_of_nonneg_right _ (by positivity)
        linarith
      _ = 2 * ((H : ℝ) + 1) * c * ((m : ℝ) + 2) := by ring
  have hminor : -(e * A) / 2 < M := e993_tail_minor_half r hr k hk hkN
  have hUterm := mul_lt_mul_of_pos_right hU (mul_pos hHpos hA)
  have hMterm := mul_lt_mul_of_pos_left hminor hg
  have hpay := mul_lt_mul_of_pos_right hscale hA
  dsimp [N, H, e, c, U, A, M, g] at *
  nlinarith [hUterm, hMterm, hpay]
-- VERITYOS ENTRY 108 END

-- VERITYOS ENTRY 109 BEGIN lemma e993_tail_B_coeff e1e57559af985865f446e515b2498f0df516f8ce6e3141309828103306c3ee44
lemma e993_tail_B_coeff (a t : ℕ) :
    (e993TailB a).coeff t = (a.choose t : ℝ) + if t = 1 then 1 else 0 := by
  simp only [e993TailB, Polynomial.coeff_add, Polynomial.coeff_one_add_X_pow,
    Polynomial.coeff_X]
  by_cases h : t = 1 <;> simp [h, eq_comm]
-- VERITYOS ENTRY 109 END

-- VERITYOS ENTRY 110 BEGIN lemma e993_tail_singleton_exponent 69d4f9d4da231b2893ac63fe01a4a9fea5e226b5831cccefac13bcb1d1f5edad
lemma e993_tail_singleton_exponent (a N k : ℕ) (ha : 1 ≤ a)
    (hk : 1 ≤ k) (hkN : k ≤ N) :
    (∑ t ∈ Finset.range (a + 1),
      (if t ≤ k then
        (a.choose t : ℝ) * ((N - a).choose (k - t) : ℝ) /
          (N.choose k : ℝ)
       else 0) *
        (2 * ((e993TailB a).coeff t - (a.choose t : ℝ)) /
          ((e993TailB a).coeff t + (a.choose t : ℝ)))) =
      e993TailG a N k := by
  classical
  rw [Finset.sum_eq_single 1]
  · have hmem : 1 ∈ Finset.range (a + 1) := by simp; omega
    have hchoose : (a.choose 1 : ℝ) = (a : ℝ) := by simp
    have hcoeff : (e993TailB a).coeff 1 = (a : ℝ) + 1 := by
      rw [e993_tail_B_coeff]
      simp
    have hden : (N.choose k : ℝ) ≠ 0 := by
      exact_mod_cast (Nat.choose_pos hkN).ne'
    have hden2 : (2 * (a : ℝ) + 1) ≠ 0 := by positivity
    simp only [if_pos hk, Nat.sub_self, hchoose, hcoeff]
    unfold e993TailG
    field_simp
    ring
  · intro t ht hne
    rw [e993_tail_B_coeff]
    simp [hne]
  · intro hnot
    exact False.elim (hnot (by simp; omega))
-- VERITYOS ENTRY 110 END

-- VERITYOS ENTRY 111 BEGIN lemma e993_tail_exponent_sum e4bb7124020186f3b7f0baafb370b01bdb5dd50aa6b5d4584797dde8e97a8c24
lemma e993_tail_exponent_sum {m : ℕ} (r : Fin m → ℕ) (i : Fin m)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4)
    (k : ℕ) (hk : 1 ≤ k) (hkN : k ≤ e993TailN r) :
    e993BlockExponent (e993TailBlockSize r i)
      (fun b t => (e993TailB (e993TailBlockSize r i b)).coeff t) k =
      ∑ b, e993TailG (e993TailBlockSize r i b) (e993TailN r) k := by
  classical
  have hi : 1 ≤ r i := by
    rcases hr i with h | h | h <;> omega
  unfold e993BlockExponent
  apply Finset.sum_congr rfl
  intro b hb
  have ha : e993TailBlockSize r i b ≤ e993TailN r := by
    have h := Finset.single_le_sum
      (fun j (_hj : j ∈ (Finset.univ : Finset (Option (Fin m)))) =>
        Nat.zero_le (e993TailBlockSize r i j)) (Finset.mem_univ b)
    simpa only [e993_tail_block_sum r i hi] using h
  simp only [e993BlockMass, e993_tail_block_sum r i hi]
  exact e993_tail_singleton_exponent (e993TailBlockSize r i b)
    (e993TailN r) k (e993_tail_block_pos r i hr b) hk hkN
-- VERITYOS ENTRY 111 END

-- VERITYOS ENTRY 112 BEGIN lemma e993_tail_choose_k_step 66d6b9e25c8f2d76276073957009627ee9155261530e3b103889fe0f94e2fc09
lemma e993_tail_choose_k_step (N k : ℕ) (hk : 1 ≤ k) :
    N.choose k * k = N * (N - 1).choose (k - 1) := by
  have h := Nat.choose_mul (n := N) (k := k) (s := 1) hk
  simpa using h
-- VERITYOS ENTRY 112 END

-- VERITYOS ENTRY 113 BEGIN lemma e993_tail_choose_n_step 58b09a349f2ba1647b3aa526f4355be15cf6af0d2b33451a90445e5267055522
lemma e993_tail_choose_n_step (N k : ℕ) (hN : 2 ≤ N) (hk : 1 ≤ k)
    (hkN : k ≤ N - 1) :
    (N - 2).choose (k - 1) * (N - 1) =
      (N - 1).choose (k - 1) * (N - k) := by
  have h := Nat.choose_mul_succ_eq (N - 2) (k - 1)
  have h1 : N - 2 + 1 = N - 1 := by omega
  rw [h1] at h
  have h2 : N - 1 - (k - 1) = N - k := by omega
  rw [h2] at h
  exact h
-- VERITYOS ENTRY 113 END

-- VERITYOS ENTRY 114 BEGIN lemma e993_tail_choose_four 7706da57f5dde814310580d51264f15b0610bc3ddd4fdadd454ddfb96b28efb6
lemma e993_tail_choose_four (N k : ℕ) (hN : 8 ≤ N)
    (hk : 1 ≤ k) (hkN : k ≤ N - 3) :
    (N.choose k) * k * (N - k) * (N - k - 1) * (N - k - 2) =
      (N - 4).choose (k - 1) * N * (N - 1) * (N - 2) * (N - 3) := by
  have h0 := e993_tail_choose_k_step N k hk
  have h1 := e993_tail_choose_n_step N k (by omega) hk (by omega)
  have h2 := e993_tail_choose_n_step (N - 1) k (by omega) hk (by omega)
  have h3 := e993_tail_choose_n_step (N - 2) k (by omega) hk (by omega)
  have hN1 : N - 1 - 2 = N - 3 := by omega
  have hN2 : N - 1 - 1 = N - 2 := by omega
  have hK1 : N - 1 - k = N - k - 1 := by omega
  rw [hN1, hN2, hK1] at h2
  have hN3 : N - 2 - 2 = N - 4 := by omega
  have hN4 : N - 2 - 1 = N - 3 := by omega
  have hK2 : N - 2 - k = N - k - 2 := by omega
  rw [hN3, hN4, hK2] at h3
  calc
    (N.choose k) * k * (N - k) * (N - k - 1) * (N - k - 2) =
      N * (N - 1).choose (k - 1) * (N - k) * (N - k - 1) * (N - k - 2) := by rw [h0]
    _ = N * ((N - 2).choose (k - 1) * (N - 1)) * (N - k - 1) *
        (N - k - 2) := by rw [h1]; ring
    _ = N * (N - 1) * ((N - 3).choose (k - 1) * (N - 2)) *
        (N - k - 2) := by rw [h2]; ring
    _ = (N - 4).choose (k - 1) * N * (N - 1) * (N - 2) * (N - 3) := by
      calc
        _ = N * (N - 1) * (N - 2) *
            ((N - 3).choose (k - 1) * (N - k - 2)) := by ring
        _ = N * (N - 1) * (N - 2) *
            ((N - 4).choose (k - 1) * (N - 3)) := by rw [← h3]
        _ = _ := by ring
-- VERITYOS ENTRY 114 END

-- VERITYOS ENTRY 115 BEGIN lemma e993_tail_G4_formula 25c5e9f17dcbe29342b9485b7fbcf8225735177079c71ee094bfecdcc86ba26f
lemma e993_tail_G4_formula (N k : ℕ) (hN : 8 ≤ N)
    (hk : 1 ≤ k) (hkN : k ≤ N - 3) :
    e993TailG 4 N k =
      (8 : ℝ) / 9 *
        ((k : ℝ) * ((N : ℝ) - k) * ((N : ℝ) - k - 1) *
          ((N : ℝ) - k - 2)) /
        ((N : ℝ) * ((N : ℝ) - 1) * ((N : ℝ) - 2) * ((N : ℝ) - 3)) := by
  have hc : (N.choose k : ℝ) ≠ 0 := by
    exact_mod_cast (Nat.choose_pos (by omega : k ≤ N)).ne'
  have hden : (N : ℝ) * ((N : ℝ) - 1) * ((N : ℝ) - 2) * ((N : ℝ) - 3) ≠ 0 := by
    have hNR : (8 : ℝ) ≤ N := by exact_mod_cast hN
    apply ne_of_gt
    apply mul_pos
    apply mul_pos
    apply mul_pos
    · nlinarith
    · nlinarith
    · nlinarith
    · nlinarith
  have hnat := e993_tail_choose_four N k hN hk hkN
  have hreal : (N.choose k : ℝ) * k * ((N : ℝ) - k) *
      ((N : ℝ) - k - 1) * ((N : ℝ) - k - 2) =
        ((N - 4).choose (k - 1) : ℝ) * N * ((N : ℝ) - 1) *
          ((N : ℝ) - 2) * ((N : ℝ) - 3) := by
    have h := congrArg (fun x : ℕ => (x : ℝ)) hnat
    push_cast at h
    rw [Nat.cast_sub (by omega : 1 ≤ N - k),
      Nat.cast_sub (by omega : 2 ≤ N - k)] at h
    rw [Nat.cast_sub (by omega : k ≤ N)] at h
    rw [Nat.cast_sub (by omega : 1 ≤ N),
      Nat.cast_sub (by omega : 2 ≤ N),
      Nat.cast_sub (by omega : 3 ≤ N)] at h
    push_cast at h
    convert h using 1 <;> ring
  have hratio : ((N - 4).choose (k - 1) : ℝ) / (N.choose k : ℝ) =
      ((k : ℝ) * ((N : ℝ) - k) * ((N : ℝ) - k - 1) *
        ((N : ℝ) - k - 2)) /
      ((N : ℝ) * ((N : ℝ) - 1) * ((N : ℝ) - 2) * ((N : ℝ) - 3)) := by
    apply (div_eq_div_iff hc hden).2
    nlinarith [hreal]
  unfold e993TailG
  norm_num
  simp only [mul_div_assoc, hratio]
-- VERITYOS ENTRY 115 END

-- VERITYOS ENTRY 116 BEGIN lemma e993_tail_G4_step b9ec1322ad500fa475bd1b43f5a434d5f1e49db0d837cd57c0ad0e8524761377
lemma e993_tail_G4_step (N k : ℕ) (hN : 200 ≤ N)
    (hk : 1 ≤ k) (hband : N + 1 < 4 * k) (hkN : k + 1 ≤ N - 3) :
    e993TailG 4 N (k + 1) ≤ e993TailG 4 N k := by
  have hNR : (200 : ℝ) ≤ N := by exact_mod_cast hN
  have hkR : (1 : ℝ) ≤ k := by exact_mod_cast hk
  have hbR : (N : ℝ) + 1 < 4 * (k : ℝ) := by exact_mod_cast hband
  have hkNR : (k : ℝ) + 1 ≤ (N : ℝ) - 3 := by
    have hnat : k + 4 ≤ N := by omega
    have hR : (k : ℝ) + 4 ≤ N := by exact_mod_cast hnat
    linarith
  have hden : 0 < (N : ℝ) * ((N : ℝ) - 1) *
      ((N : ℝ) - 2) * ((N : ℝ) - 3) := by
    apply mul_pos
    apply mul_pos
    apply mul_pos <;> linarith
    all_goals linarith
  have hf1 : 0 ≤ (N : ℝ) - (k : ℝ) - 1 := by nlinarith
  have hf2 : 0 ≤ (N : ℝ) - (k : ℝ) - 2 := by nlinarith
  have hcore : ((k : ℝ) + 1) * ((N : ℝ) - (k : ℝ) - 3) ≤
      (k : ℝ) * ((N : ℝ) - (k : ℝ)) := by nlinarith
  have hmul := mul_le_mul_of_nonneg_right hcore (mul_nonneg hf1 hf2)
  rw [e993_tail_G4_formula N (k + 1) (by omega) (by omega) (by omega),
    e993_tail_G4_formula N k (by omega) hk (by omega)]
  have hnum : ((k : ℝ) + 1) * ((N : ℝ) - (k : ℝ) - 1) *
      ((N : ℝ) - (k : ℝ) - 2) * ((N : ℝ) - (k : ℝ) - 3) ≤
      (k : ℝ) * ((N : ℝ) - (k : ℝ)) *
        ((N : ℝ) - (k : ℝ) - 1) * ((N : ℝ) - (k : ℝ) - 2) := by
    nlinarith [hmul]
  have hnum' := mul_le_mul_of_nonneg_left hnum (show (0 : ℝ) ≤ 8 / 9 by norm_num)
  have hquot := div_le_div_of_nonneg_right hnum' (le_of_lt hden)
  simp only [Nat.cast_add, Nat.cast_one]
  have heq1 : (N : ℝ) - ((k : ℝ) + 1) = (N : ℝ) - k - 1 := by ring
  have heq2 : (N : ℝ) - k - 1 - 1 = (N : ℝ) - k - 2 := by ring
  have heq3 : (N : ℝ) - k - 1 - 2 = (N : ℝ) - k - 3 := by ring
  rw [heq1, heq2, heq3]
  exact hquot
-- VERITYOS ENTRY 116 END

-- VERITYOS ENTRY 117 BEGIN lemma e993_tail_G4_ge_of_poly 0de83cafc69287ea93d446c1b3704d8aeef5e03c6a659092ffab5a9929b5e2ca
lemma e993_tail_G4_ge_of_poly (N k : ℕ) (hN : 200 ≤ N)
    (hk : 1 ≤ k) (hkN : k ≤ N - 3)
    (hpoly : (9 : ℝ) * ((N : ℝ) * ((N : ℝ) - 1) *
      ((N : ℝ) - 2) * ((N : ℝ) - 3)) ≤
      160 * ((k : ℝ) * ((N : ℝ) - k) *
        ((N : ℝ) - k - 1) * ((N : ℝ) - k - 2))) :
    (1 / 20 : ℝ) ≤ e993TailG 4 N k := by
  have hNR : (200 : ℝ) ≤ N := by exact_mod_cast hN
  have hden : 0 < (N : ℝ) * ((N : ℝ) - 1) *
      ((N : ℝ) - 2) * ((N : ℝ) - 3) := by
    apply mul_pos
    apply mul_pos
    apply mul_pos <;> linarith
    all_goals linarith
  rw [e993_tail_G4_formula N k (by omega) hk hkN]
  apply (le_div_iff₀ hden).2
  nlinarith [hpoly]
-- VERITYOS ENTRY 117 END

-- VERITYOS ENTRY 118 BEGIN lemma e993_tail_G4_even_endpoint 46dc3ef0545dacdba754349f9b98044b2fa0e7aa146ab81d9607bbbb68559f2f
lemma e993_tail_G4_even_endpoint (s : ℕ) (hs : 100 ≤ s) :
    (1 / 20 : ℝ) ≤ e993TailG 4 (2 * s) (s + 1) := by
  have hsR : (100 : ℝ) ≤ s := by exact_mod_cast hs
  have hpoly0 : 0 ≤ 4 * (s : ℝ)^2 * ((s : ℝ) - 22) +
      13 * (s : ℝ) + 240 := by
    have h : 0 ≤ 4 * (s : ℝ)^2 * ((s : ℝ) - 22) := by
      apply mul_nonneg (by positivity)
      linarith
    nlinarith
  have hpoly1 : 0 ≤ ((s : ℝ) - 1) *
      (4 * (s : ℝ)^2 * ((s : ℝ) - 22) + 13 * (s : ℝ) + 240) :=
    mul_nonneg (by linarith) hpoly0
  apply e993_tail_G4_ge_of_poly (2 * s) (s + 1) (by omega)
    (by omega) (by omega)
  have hcast : ((2 * s : ℕ) : ℝ) = 2 * (s : ℝ) := by push_cast; ring
  have hkcast : (((s + 1 : ℕ) : ℝ)) = (s : ℝ) + 1 := by push_cast; ring
  rw [hcast, hkcast]
  nlinarith [hpoly1]
-- VERITYOS ENTRY 118 END

-- VERITYOS ENTRY 119 BEGIN lemma e993_tail_G4_odd_endpoint 2513cbb05dd2e2bfc8362004bb9dd5d02bb1357d7f940b6a70da920f80ec7f08
lemma e993_tail_G4_odd_endpoint (s : ℕ) (hs : 100 ≤ s) :
    (1 / 20 : ℝ) ≤ e993TailG 4 (2 * s + 1) (s + 1) := by
  have hsR : (100 : ℝ) ≤ s := by exact_mod_cast hs
  have hpoly0 : 0 ≤ 4 * (s : ℝ)^2 - 40 * (s : ℝ) - 71 := by nlinarith
  have hpoly1 : 0 ≤ 4 * (s : ℝ) * ((s : ℝ) - 1) *
      (4 * (s : ℝ)^2 - 40 * (s : ℝ) - 71) := by
    apply mul_nonneg
    · apply mul_nonneg (by positivity)
      linarith
    · exact hpoly0
  apply e993_tail_G4_ge_of_poly (2 * s + 1) (s + 1) (by omega)
    (by omega) (by omega)
  have hcast : ((2 * s + 1 : ℕ) : ℝ) = 2 * (s : ℝ) + 1 := by push_cast; ring
  have hkcast : (((s + 1 : ℕ) : ℝ)) = (s : ℝ) + 1 := by push_cast; ring
  rw [hcast, hkcast]
  nlinarith [hpoly1]
-- VERITYOS ENTRY 119 END

-- VERITYOS ENTRY 120 BEGIN lemma e993_tail_G4_band 2139715eaac4dbdea71843cd10dde642edd98c4a667134acc2510fee16e681c6
lemma e993_tail_G4_band (N k : ℕ) (hN : 200 ≤ N)
    (hk : 1 ≤ k) (hband : N + 1 < 4 * k)
    (hguard : 2 * k ≤ N + 2) :
    (1 / 20 : ℝ) ≤ e993TailG 4 N k := by
  let K := (N + 2) / 2
  have hkK : k ≤ K := by dsimp [K]; omega
  have hKlast : K ≤ N - 3 := by dsimp [K]; omega
  have hKbase : (1 / 20 : ℝ) ≤ e993TailG 4 N K := by
    have hpar : ∃ s : ℕ, N = 2 * s ∨ N = 2 * s + 1 := ⟨N / 2, by omega⟩
    obtain ⟨s, hs | hs⟩ := hpar
    · have hs100 : 100 ≤ s := by omega
      have hK : K = s + 1 := by dsimp [K]; omega
      rw [hs, hK]
      exact e993_tail_G4_even_endpoint s hs100
    · have hs100 : 100 ≤ s := by omega
      have hK : K = s + 1 := by dsimp [K]; omega
      rw [hs, hK]
      exact e993_tail_G4_odd_endpoint s hs100
  have hmono : ∀ j, k ≤ j → j ≤ K → e993TailG 4 N j ≤ e993TailG 4 N k := by
    intro j hkj
    induction j, hkj using Nat.le_induction with
    | base => intro _; exact le_rfl
    | succ j hkj ih =>
        intro hjK
        have hjLast : j + 1 ≤ N - 3 := by omega
        have hjBand : N + 1 < 4 * j := by omega
        exact (e993_tail_G4_step N j hN (by omega) hjBand hjLast).trans
          (ih (by omega))
  exact hKbase.trans (hmono K hkK le_rfl)
-- VERITYOS ENTRY 120 END

-- VERITYOS ENTRY 121 BEGIN lemma e993_tail_G3_ge_G4 e78c6dd588a008121e7b56f4f4fc0ec18569e8b09bb41eb081d2565a7558aebc
lemma e993_tail_G3_ge_G4 (N k : ℕ) (hN : 200 ≤ N)
    (hk : 1 ≤ k) (hband : N + 1 < 4 * k)
    (hguard : 2 * k ≤ N + 2) :
    e993TailG 4 N k ≤ e993TailG 3 N k := by
  have hkN : k ≤ N - 3 := by omega
  have hstep := e993_tail_choose_n_step (N - 2) k (by omega) hk (by omega)
  have hN1 : N - 2 - 2 = N - 4 := by omega
  have hN2 : N - 2 - 1 = N - 3 := by omega
  have hK : N - 2 - k = N - k - 2 := by omega
  rw [hN1, hN2, hK] at hstep
  have hq4 : (0 : ℝ) ≤ ((N - 4).choose (k - 1) : ℝ) := by positivity
  have hq3 : (0 : ℝ) ≤ ((N - 3).choose (k - 1) : ℝ) := by positivity
  have hN3 : (0 : ℝ) < (N : ℝ) - 3 := by
    have hNR : (200 : ℝ) ≤ N := by exact_mod_cast hN
    linarith
  have hratio : (28 : ℝ) * ((N - 4).choose (k - 1) : ℝ) ≤
      27 * ((N - 3).choose (k - 1) : ℝ) := by
    have hstepR : ((N - 4).choose (k - 1) : ℝ) * ((N : ℝ) - 3) =
        ((N - 3).choose (k - 1) : ℝ) * ((N : ℝ) - k - 2) := by
      have h := congrArg (fun x : ℕ => (x : ℝ)) hstep
      push_cast at h
      rw [Nat.cast_sub (by omega : 3 ≤ N),
        Nat.cast_sub (by omega : 2 ≤ N - k)] at h
      rw [Nat.cast_sub (by omega : k ≤ N)] at h
      push_cast at h
      nlinarith [h]
    have hbound : (28 : ℝ) * ((N : ℝ) - k - 2) ≤
        27 * ((N : ℝ) - 3) := by
      have hbR : (N : ℝ) + 1 < 4 * (k : ℝ) := by exact_mod_cast hband
      have hNR : (200 : ℝ) ≤ N := by exact_mod_cast hN
      nlinarith
    have hmul := mul_le_mul_of_nonneg_right hbound hq3
    have hboth : (28 * ((N - 4).choose (k - 1) : ℝ)) * ((N : ℝ) - 3) ≤
        (27 * ((N - 3).choose (k - 1) : ℝ)) * ((N : ℝ) - 3) := by
      nlinarith [hmul, hstepR]
    exact (mul_le_mul_iff_of_pos_right hN3).mp hboth
  have hc : (0 : ℝ) < (N.choose k : ℝ) := by
    exact_mod_cast Nat.choose_pos (by omega : k ≤ N)
  have hnum : (8 / 9 : ℝ) * ((N - 4).choose (k - 1) : ℝ) ≤
      (6 / 7 : ℝ) * ((N - 3).choose (k - 1) : ℝ) := by nlinarith [hratio]
  unfold e993TailG
  norm_num
  exact div_le_div_of_nonneg_right hnum (le_of_lt hc)
-- VERITYOS ENTRY 121 END

-- VERITYOS ENTRY 122 BEGIN lemma e993_tail_G2_ge_G3 8e58c0726130a74dc02d7415a69da20742155edc30426b944ab20b64e3ca77cd
lemma e993_tail_G2_ge_G3 (N k : ℕ) (hN : 200 ≤ N)
    (hk : 1 ≤ k) (hband : N + 1 < 4 * k)
    (hguard : 2 * k ≤ N + 2) :
    e993TailG 3 N k ≤ e993TailG 2 N k := by
  have hkN : k ≤ N - 2 := by omega
  have hstep := e993_tail_choose_n_step (N - 1) k (by omega) hk (by omega)
  have hN1 : N - 1 - 2 = N - 3 := by omega
  have hN2 : N - 1 - 1 = N - 2 := by omega
  have hK : N - 1 - k = N - k - 1 := by omega
  rw [hN1, hN2, hK] at hstep
  have hq2 : (0 : ℝ) ≤ ((N - 2).choose (k - 1) : ℝ) := by positivity
  have hN2pos : (0 : ℝ) < (N : ℝ) - 2 := by
    have hNR : (200 : ℝ) ≤ N := by exact_mod_cast hN
    linarith
  have hratio : (15 : ℝ) * ((N - 3).choose (k - 1) : ℝ) ≤
      14 * ((N - 2).choose (k - 1) : ℝ) := by
    have hstepR : ((N - 3).choose (k - 1) : ℝ) * ((N : ℝ) - 2) =
        ((N - 2).choose (k - 1) : ℝ) * ((N : ℝ) - k - 1) := by
      have h := congrArg (fun x : ℕ => (x : ℝ)) hstep
      push_cast at h
      rw [Nat.cast_sub (by omega : 2 ≤ N),
        Nat.cast_sub (by omega : 1 ≤ N - k)] at h
      rw [Nat.cast_sub (by omega : k ≤ N)] at h
      push_cast at h
      nlinarith [h]
    have hbound : (15 : ℝ) * ((N : ℝ) - k - 1) ≤
        14 * ((N : ℝ) - 2) := by
      have hbR : (N : ℝ) + 1 < 4 * (k : ℝ) := by exact_mod_cast hband
      have hNR : (200 : ℝ) ≤ N := by exact_mod_cast hN
      nlinarith
    have hmul := mul_le_mul_of_nonneg_right hbound hq2
    have hboth : (15 * ((N - 3).choose (k - 1) : ℝ)) * ((N : ℝ) - 2) ≤
        (14 * ((N - 2).choose (k - 1) : ℝ)) * ((N : ℝ) - 2) := by
      nlinarith [hmul, hstepR]
    exact (mul_le_mul_iff_of_pos_right hN2pos).mp hboth
  have hc : (0 : ℝ) < (N.choose k : ℝ) := by
    exact_mod_cast Nat.choose_pos (by omega : k ≤ N)
  have hnum : (6 / 7 : ℝ) * ((N - 3).choose (k - 1) : ℝ) ≤
      (4 / 5 : ℝ) * ((N - 2).choose (k - 1) : ℝ) := by nlinarith [hratio]
  unfold e993TailG
  norm_num
  exact div_le_div_of_nonneg_right hnum (le_of_lt hc)
-- VERITYOS ENTRY 122 END

-- VERITYOS ENTRY 123 BEGIN lemma e993_tail_G_all 841c043420bff9e1195736ce5fa30e79c1e21e8bd5e0dc8b5a52f986a4f5a51d
lemma e993_tail_G_all (a N k : ℕ) (ha : a = 2 ∨ a = 3 ∨ a = 4)
    (hN : 200 ≤ N) (hk : 1 ≤ k) (hband : N + 1 < 4 * k)
    (hguard : 2 * k ≤ N + 2) :
    (1 / 20 : ℝ) ≤ e993TailG a N k := by
  have h4 := e993_tail_G4_band N k hN hk hband hguard
  rcases ha with h | h | h
  · subst a
    exact h4.trans ((e993_tail_G3_ge_G4 N k hN hk hband hguard).trans
      (e993_tail_G2_ge_G3 N k hN hk hband hguard))
  · subst a
    exact h4.trans (e993_tail_G3_ge_G4 N k hN hk hband hguard)
  · subst a
    exact h4
-- VERITYOS ENTRY 123 END

-- VERITYOS ENTRY 124 BEGIN lemma e993_tail_G_nonneg 92bb5f4d269033d479d2b06289fe8a00f54464ec87dcead33c933501d71a88a2
lemma e993_tail_G_nonneg (a N k : ℕ) : 0 ≤ e993TailG a N k := by
  unfold e993TailG
  positivity
-- VERITYOS ENTRY 124 END

-- VERITYOS ENTRY 125 BEGIN lemma e993_tail_exponent_lower fd1f43c380c9d9aabb70460cb6963aec8476a741f2e75ff94bf799460219d3c1
lemma e993_tail_exponent_lower {m : ℕ} (r : Fin m → ℕ)
    (hm : 100 ≤ m) (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4)
    (i : Fin m) (k : ℕ) (hk : 1 ≤ k)
    (hband : e993TailN r + 1 < 4 * k)
    (hguard : 2 * k ≤ e993TailN r + 2) :
    (((m - 1 : ℕ) : ℝ) / 20) ≤
      e993BlockExponent (e993TailBlockSize r i)
        (fun b t => (e993TailB (e993TailBlockSize r i b)).coeff t) k := by
  classical
  have hN : 200 ≤ e993TailN r := by
    have h := e993_tail_arity_lower r hr
    omega
  have hkN : k ≤ e993TailN r := by omega
  rw [e993_tail_exponent_sum r i hr k hk hkN, Fintype.sum_option]
  have hsplit := Finset.add_sum_erase (Finset.univ : Finset (Fin m))
    (fun j => e993TailG (e993TailBlockSize r i (some j)) (e993TailN r) k)
    (Finset.mem_univ i)
  have hroot : 0 ≤ e993TailG (e993TailBlockSize r i none) (e993TailN r) k :=
    e993_tail_G_nonneg _ _ _
  have hmark : 0 ≤ e993TailG (e993TailBlockSize r i (some i)) (e993TailN r) k :=
    e993_tail_G_nonneg _ _ _
  have hother : (∑ j ∈ (Finset.univ : Finset (Fin m)).erase i, (1 / 20 : ℝ)) ≤
      ∑ j ∈ (Finset.univ : Finset (Fin m)).erase i,
        e993TailG (e993TailBlockSize r i (some j)) (e993TailN r) k := by
    apply Finset.sum_le_sum
    intro j hj
    have hji : j ≠ i := (Finset.mem_erase.mp hj).1
    have ha : r j = 2 ∨ r j = 3 ∨ r j = 4 := hr j
    simpa only [e993TailBlockSize, if_neg hji] using
      e993_tail_G_all (r j) (e993TailN r) k ha hN hk hband hguard
  have hcard : ((∑ j ∈ (Finset.univ : Finset (Fin m)).erase i, (1 / 20 : ℝ))) =
      (((m - 1 : ℕ) : ℝ) / 20) := by
    simp [div_eq_mul_inv]
  rw [← hsplit]
  rw [hcard] at hother
  nlinarith
-- VERITYOS ENTRY 125 END

-- VERITYOS ENTRY 126 BEGIN lemma e993_tail_U_high_lower 437edc3f618333f158cdafdc4e0b13cbad61d70040b5c5acebcff801adf03dfe
lemma e993_tail_U_high_lower
    (m : ℕ) (hm : 100 ≤ m) (r : Fin m → ℕ)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4)
    (i : Fin m) (k : ℕ) (hk : 1 ≤ k)
    (hband : e993TailN r + 1 < 4 * k)
    (hguard : 2 * k ≤ e993TailN r + 2) :
    ((e993TailN r).choose k : ℝ) * ((m : ℝ) + 2) <
      (e993TailU r i).coeff k := by
  have hkN : k ≤ e993TailN r := e993_tail_guard_le_N r hm hr k hguard
  have hc : (0 : ℝ) < ((e993TailN r).choose k : ℝ) := by
    exact_mod_cast Nat.choose_pos hkN
  have hexp := e993_tail_exponent_lower r hm hr i k hk hband hguard
  have hmono : Real.exp ((((m - 1 : ℕ) : ℝ) / 20)) ≤
      Real.exp (e993BlockExponent (e993TailBlockSize r i)
        (fun b t => (e993TailB (e993TailBlockSize r i b)).coeff t) k) :=
    Real.exp_le_exp.mpr hexp
  have hgrowth := e993_tail_exp_growth m hm
  have hj := e993_tail_jensen_raw r hr i k hkN
  have hstrict := mul_lt_mul_of_pos_left hgrowth hc
  have hweak := mul_le_mul_of_nonneg_left hmono (le_of_lt hc)
  exact (hstrict.trans_le hweak).trans_le hj
-- VERITYOS ENTRY 126 END

-- VERITYOS ENTRY 127 BEGIN lemma e993_tail_center_expansion 634ba0dca934e49402847bf1a832a97573edf5b3764f758689935c9d65b3a0ba
lemma e993_tail_center_expansion {m : ℕ} (s : Finset (Fin m)) (r : Fin m → ℕ) :
    (∏ j ∈ s, e993TailB (r j)) =
      ∑ t ∈ s.powerset,
        Polynomial.X ^ t.card *
          (1 + Polynomial.X) ^ (∑ j ∈ s \ t, r j) := by
  classical
  unfold e993TailB
  rw [show (∏ j ∈ s, ((1 + Polynomial.X : Polynomial ℝ) ^ (r j) + Polynomial.X)) =
      ∏ j ∈ s, (Polynomial.X + (1 + Polynomial.X) ^ (r j)) from
        Finset.prod_congr rfl (by intro j hj; exact add_comm _ _)]
  rw [Finset.prod_add
    (fun _ : Fin m => (Polynomial.X : Polynomial ℝ))
    (fun j => (1 + Polynomial.X) ^ (r j)) s]
  apply Finset.sum_congr rfl
  intro t ht
  rw [Finset.prod_const, Finset.prod_pow_eq_pow_sum]
-- VERITYOS ENTRY 127 END

-- VERITYOS ENTRY 128 BEGIN lemma e993_tail_center_coeff fefa5d98bf418a608b7ecab7f49887111945a0c4702052d4df6cf85946234415
lemma e993_tail_center_coeff {m : ℕ} (s : Finset (Fin m))
    (r : Fin m → ℕ) (k : ℕ) :
    (∏ j ∈ s, e993TailB (r j)).coeff k =
      ∑ t ∈ s.powerset,
        if t.card ≤ k then ((∑ j ∈ s \ t, r j).choose (k - t.card) : ℝ)
        else 0 := by
  rw [e993_tail_center_expansion]
  simp only [Polynomial.finsetSum_coeff, Polynomial.coeff_X_pow_mul',
    Polynomial.coeff_one_add_X_pow]
-- VERITYOS ENTRY 128 END

-- VERITYOS ENTRY 129 BEGIN lemma e993_tail_Q_coeff e2f6517f1ff9c0efca5d1d17fcbf9227e06ec31f98e748785ff33302544bd4b4
lemma e993_tail_Q_coeff {m : ℕ} (r : Fin m → ℕ) (k : ℕ) :
    (e993TailQ r).coeff k =
      ∑ t ∈ (Finset.univ : Finset (Fin m)).powerset,
        if t.card ≤ k then
          ((∑ j ∈ (Finset.univ : Finset (Fin m)) \ t, r j).choose
            (k - t.card) : ℝ) else 0 := by
  simpa only [e993TailQ] using
    e993_tail_center_coeff (Finset.univ : Finset (Fin m)) r k
-- VERITYOS ENTRY 129 END

-- VERITYOS ENTRY 130 BEGIN lemma e993_tail_subset_cross 0e79dffaf03bbaf521d5b1ecbeb25895135182cb185f8b49e490a2bc095fbff2
lemma e993_tail_subset_cross (N R s k : ℕ)
    (hk : 1 ≤ k) (hRN : R ≤ N) (hRs : R ≤ 4 * s)
    (hlow : 4 * k ≤ N + 1) :
    (N.choose (k - 1) : ℝ) *
        (if s ≤ k then ((N - R).choose (k - s) : ℝ) else 0) ≥
      (N.choose k : ℝ) *
        (if s ≤ k - 1 then ((N - R).choose (k - 1 - s) : ℝ) else 0) := by
  by_cases hsk : s ≤ k - 1
  · have hskt : s ≤ k := by omega
    simp only [if_pos hskt, if_pos hsk]
    let n := N - R
    let t := k - s
    have ht : 1 ≤ t := by dsimp [t]; omega
    have htn : t ≤ n := by
      dsimp [t, n]
      omega
    have hkN : k ≤ N := by omega
    have he : (0 : ℝ) < (N.choose (k - 1) : ℝ) := by
      exact_mod_cast Nat.choose_pos (by omega : k - 1 ≤ N)
    have hq : (0 : ℝ) < (n.choose (t - 1) : ℝ) := by
      exact_mod_cast Nat.choose_pos (by omega : t - 1 ≤ n)
    have hkt : (0 : ℝ) < (k : ℝ) * (t : ℝ) := by
      have hkR : (0 : ℝ) < k := by exact_mod_cast hk
      have htR : (0 : ℝ) < t := by exact_mod_cast ht
      exact mul_pos hkR htR
    have hNchoose := e993_tail_choose_adjacent N k hk hkN
    have hnchoose := e993_tail_choose_adjacent n t ht htn
    have hsign : (0 : ℝ) ≤ (s : ℝ) * ((N : ℝ) + 1) - (k : ℝ) * (R : ℝ) := by
      have hRsr : (R : ℝ) ≤ 4 * (s : ℝ) := by exact_mod_cast hRs
      have hlr : 4 * (k : ℝ) ≤ (N : ℝ) + 1 := by exact_mod_cast hlow
      have hmul := mul_le_mul_of_nonneg_right hRsr (show (0 : ℝ) ≤ k by positivity)
      have hmul2 := mul_le_mul_of_nonneg_left hlr (show (0 : ℝ) ≤ s by positivity)
      nlinarith [hmul, hmul2]
    have hcross :
        ((N.choose (k - 1) : ℝ) * (n.choose t : ℝ) -
          (N.choose k : ℝ) * (n.choose (t - 1) : ℝ)) *
            (k : ℝ) * (t : ℝ) =
          (N.choose (k - 1) : ℝ) * (n.choose (t - 1) : ℝ) *
            ((s : ℝ) * ((N : ℝ) + 1) - (k : ℝ) * (R : ℝ)) := by
      have hnR : (n : ℝ) = (N : ℝ) - R := by
        dsimp [n]
        rw [Nat.cast_sub hRN]
      have hts : (t : ℝ) = (k : ℝ) - s := by
        dsimp [t]
        rw [Nat.cast_sub hskt]
      have hratioexpr : (k : ℝ) * ((n : ℝ) + 1 - (t : ℝ)) -
          (t : ℝ) * ((N : ℝ) + 1 - (k : ℝ)) =
          (s : ℝ) * ((N : ℝ) + 1) - (k : ℝ) * (R : ℝ) := by
        rw [hnR, hts]
        ring
      calc
        _ = ((n.choose t : ℝ) * (t : ℝ)) *
              ((N.choose (k - 1) : ℝ) * (k : ℝ)) -
            ((N.choose k : ℝ) * (k : ℝ)) *
              ((n.choose (t - 1) : ℝ) * (t : ℝ)) := by ring
        _ = ((n.choose (t - 1) : ℝ) * ((n : ℝ) + 1 - (t : ℝ))) *
              ((N.choose (k - 1) : ℝ) * (k : ℝ)) -
            ((N.choose (k - 1) : ℝ) * ((N : ℝ) + 1 - (k : ℝ))) *
              ((n.choose (t - 1) : ℝ) * (t : ℝ)) := by
          rw [hnchoose, hNchoose]
        _ = (N.choose (k - 1) : ℝ) * (n.choose (t - 1) : ℝ) *
              ((k : ℝ) * ((n : ℝ) + 1 - (t : ℝ)) -
                (t : ℝ) * ((N : ℝ) + 1 - (k : ℝ))) := by ring
        _ = _ := by rw [hratioexpr]
    have hnonneg : 0 ≤ (N.choose (k - 1) : ℝ) *
        (n.choose (t - 1) : ℝ) *
          ((s : ℝ) * ((N : ℝ) + 1) - (k : ℝ) * (R : ℝ)) := by positivity
    have hgoal : 0 ≤ (N.choose (k - 1) : ℝ) * (n.choose t : ℝ) -
        (N.choose k : ℝ) * (n.choose (t - 1) : ℝ) := by
      nlinarith [hcross, hnonneg]
    have hprev : k - 1 - s = t - 1 := by dsimp [t]; omega
    dsimp [n, t] at hgoal ⊢
    rw [hprev]
    linarith
  · by_cases hskt : s ≤ k
    · have hprev : ¬ s ≤ k - 1 := hsk
      simp only [if_pos hskt, if_neg hprev, mul_zero]
      positivity
    · have hprev : ¬ s ≤ k - 1 := by omega
      simp only [if_neg hskt, if_neg hprev, mul_zero]
      exact le_refl _
-- VERITYOS ENTRY 130 END

-- VERITYOS ENTRY 131 BEGIN lemma e993_tail_Q_normalized_rise 86caa9126ba2afa2e49a6ba4c0664bee55872e11557536dc53ce5383c1cad3ca
lemma e993_tail_Q_normalized_rise {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4)
    (k : ℕ) (hk : 1 ≤ k) (hlow : 4 * k ≤ e993TailN r + 1) :
    ((e993TailN r).choose k : ℝ) * (e993TailQ r).coeff (k - 1) ≤
      ((e993TailN r).choose (k - 1) : ℝ) * (e993TailQ r).coeff k := by
  classical
  rw [e993_tail_Q_coeff r k, e993_tail_Q_coeff r (k - 1)]
  simp only [Finset.mul_sum]
  apply Finset.sum_le_sum
  intro t ht
  let R := ∑ j ∈ t, r j
  let s := t.card
  have hRsum : R + (∑ j ∈ (Finset.univ : Finset (Fin m)) \ t, r j) =
      e993TailN r := by
    simpa [R, e993TailN, Finset.compl_eq_univ_sdiff] using
      (Finset.sum_add_sum_compl t r)
  have hRN : R ≤ e993TailN r := by omega
  have hRs : R ≤ 4 * s := by
    have h : (∑ j ∈ t, r j) ≤ ∑ _j ∈ t, 4 := by
      apply Finset.sum_le_sum
      intro j hj
      rcases hr j with hj2 | hj3 | hj4 <;> omega
    simpa [R, s, Nat.mul_comm] using h
  have hcomp : e993TailN r - R =
      ∑ j ∈ (Finset.univ : Finset (Fin m)) \ t, r j := by omega
  have h := e993_tail_subset_cross (e993TailN r) R s k hk hRN hRs hlow
  rw [hcomp] at h
  exact h
-- VERITYOS ENTRY 131 END

-- VERITYOS ENTRY 132 BEGIN lemma e993_tail_choose_logconcave 48ab2ebf7bec82305b457cad7b878d48a021f6ad95731bc81056f9ef76cbe74f
lemma e993_tail_choose_logconcave (N j : ℕ)
    (hj : 1 ≤ j) (hjN : j + 1 ≤ N) :
    (N.choose (j - 1) : ℝ) * (N.choose (j + 1) : ℝ) ≤
      (N.choose j : ℝ) ^ 2 := by
  let a : ℝ := (N.choose (j - 1) : ℝ)
  let b : ℝ := (N.choose j : ℝ)
  let c : ℝ := (N.choose (j + 1) : ℝ)
  have ha : 0 < a := by
    dsimp [a]
    exact_mod_cast Nat.choose_pos (by omega : j - 1 ≤ N)
  have hb : 0 < b := by
    dsimp [b]
    exact_mod_cast Nat.choose_pos (by omega : j ≤ N)
  have hjR : (0 : ℝ) < j := by exact_mod_cast hj
  have h1 : b * (j : ℝ) = a * ((N : ℝ) + 1 - (j : ℝ)) :=
    e993_tail_choose_adjacent N j hj (by omega)
  have h2 : c * ((j : ℝ) + 1) = b * ((N : ℝ) - (j : ℝ)) := by
    have h := e993_tail_choose_adjacent N (j + 1) (by omega) hjN
    push_cast at h
    convert h using 1 <;> ring
  have h1m := congrArg (fun x : ℝ => x * b * ((j : ℝ) + 1)) h1
  have h2m := congrArg (fun x : ℝ => x * a * (j : ℝ)) h2
  have hcross : (b ^ 2 - a * c) * (j : ℝ) * ((j : ℝ) + 1) =
      a * b * ((N : ℝ) + 1) := by nlinarith [h1m, h2m]
  have hnonneg : 0 ≤ a * b * ((N : ℝ) + 1) := by positivity
  have hres : 0 ≤ b ^ 2 - a * c := by nlinarith [hcross, hnonneg]
  dsimp [a, b, c] at hres ⊢
  linarith
-- VERITYOS ENTRY 132 END

-- VERITYOS ENTRY 133 BEGIN lemma e993_tail_Q_predecessor_bracket 7ccbbc5bcc46c37190c7e50b187cb6e0daeb60fdb4ebea6a3e2f8ce576397754
lemma e993_tail_Q_predecessor_bracket {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4)
    (k : ℕ) (hk : 2 ≤ k) (hlow : 4 * k ≤ e993TailN r + 1) :
    ((e993TailN r).choose k : ℝ) * (e993TailQ r).coeff (k - 2) ≤
      ((e993TailN r).choose (k - 1) : ℝ) * (e993TailQ r).coeff (k - 1) := by
  let N := e993TailN r
  let q0 : ℝ := (e993TailQ r).coeff (k - 2)
  let q1 : ℝ := (e993TailQ r).coeff (k - 1)
  let c0 : ℝ := (N.choose (k - 2) : ℝ)
  let c1 : ℝ := (N.choose (k - 1) : ℝ)
  let c2 : ℝ := (N.choose k : ℝ)
  have hkN : k ≤ N := by dsimp [N]; omega
  have hc0 : 0 < c0 := by
    dsimp [c0]
    exact_mod_cast Nat.choose_pos (by omega : k - 2 ≤ N)
  have hc1 : 0 < c1 := by
    dsimp [c1]
    exact_mod_cast Nat.choose_pos (by omega : k - 1 ≤ N)
  have hq0 : 0 ≤ q0 := by
    dsimp [q0, e993TailQ]
    exact e993_tail_NN_prod r Finset.univ (k - 2)
  have hlowprev : 4 * (k - 1) ≤ N + 1 := by omega
  have hrise : c1 * q0 ≤ c0 * q1 := by
    simpa only [N, c0, c1, q0, q1, show k - 1 - 1 = k - 2 by omega] using
      e993_tail_Q_normalized_rise r hr (k - 1) (by omega) hlowprev
  have hlog : c0 * c2 ≤ c1 ^ 2 := by
    simpa only [N, c0, c1, c2, show k - 1 - 1 = k - 2 by omega,
      show k - 1 + 1 = k by omega] using
      e993_tail_choose_logconcave N (k - 1) (by omega) (by omega)
  have hprod := mul_le_mul_of_nonneg_left hrise (le_of_lt hc1)
  have hlogprod := mul_le_mul_of_nonneg_right hlog hq0
  have hcross : 0 ≤ c0 * (c1 * q1 - c2 * q0) := by
    nlinarith [hprod, hlogprod]
  have hres : c2 * q0 ≤ c1 * q1 := by nlinarith [hcross]
  exact hres
-- VERITYOS ENTRY 133 END

-- VERITYOS ENTRY 134 BEGIN lemma e993_tail_C_eq_Q 53a2eacb824a8d93e67bcd67b808545f80b9f9dbed8a2864fd0f22888d5e8e13
lemma e993_tail_C_eq_Q (m : ℕ) (r : Fin m → ℕ) :
    e993TailC r = e993TailQ r + 2 * Polynomial.X * e993TailQ r := by
  have hb : e993TailB 1 = 1 + 2 * Polynomial.X := by
    simp [e993TailB]
    ring
  rw [e993TailC, e993TailQ, hb]
  ring
-- VERITYOS ENTRY 134 END

-- VERITYOS ENTRY 135 BEGIN lemma e993_tail_C_coeff_succ 56cecc622b8def8af7ead16954f432eb8d8cfd1f1d6af9a447062b7c63234a1e
lemma e993_tail_C_coeff_succ (m : ℕ) (r : Fin m → ℕ) (j : ℕ) :
    (e993TailC r).coeff (j + 1) =
      (e993TailQ r).coeff (j + 1) + 2 * (e993TailQ r).coeff j := by
  rw [e993_tail_C_eq_Q m r, Polynomial.coeff_add]
  rw [mul_assoc, Polynomial.coeff_ofNat_mul, Polynomial.coeff_X_mul]
-- VERITYOS ENTRY 135 END

-- VERITYOS ENTRY 136 BEGIN lemma e993_tail_C_coeff_zero e981538538d2dc88deb1f9ef13afa6b1d724e131a8cd964470e9b26e67a929a0
lemma e993_tail_C_coeff_zero (m : ℕ) (r : Fin m → ℕ) :
    (e993TailC r).coeff 0 = (e993TailQ r).coeff 0 := by
  rw [e993_tail_C_eq_Q m r, Polynomial.coeff_add]
  simp
-- VERITYOS ENTRY 136 END

-- VERITYOS ENTRY 137 BEGIN lemma e993_tail_E_minor_low faf16a0e89c6ca2ccf05e0a4db46b8450e9b7646df7c76bfdb24fb85b5a38776
lemma e993_tail_E_minor_low {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ j, r j = 2 ∨ r j = 3 ∨ r j = 4)
    (k : ℕ) (hk : 1 ≤ k) (hlow : 4 * k ≤ e993TailN r + 1) :
    0 ≤ (e993TailE r).coeff k * (e993TailC r).coeff k -
      (e993TailE r).coeff (k + 1) * (e993TailC r).coeff (k - 1) := by
  let N := e993TailN r
  have hQrise := e993_tail_Q_normalized_rise r hr k hk hlow
  by_cases hk1 : k = 1
  · subst k
    have hC1 := e993_tail_C_coeff_succ m r 0
    have hC0 := e993_tail_C_coeff_zero m r
    have hQ0 : 0 ≤ (e993TailQ r).coeff 0 := by
      dsimp [e993TailQ]
      exact e993_tail_NN_prod r Finset.univ 0
    rw [e993_tail_E_coeff r 1 (by omega), e993_tail_E_coeff_succ,
      hC1, hC0]
    norm_num at hQrise ⊢
    nlinarith
  · have hk2 : 2 ≤ k := by omega
    have hCk := e993_tail_C_coeff_succ m r (k - 1)
    have hCprev := e993_tail_C_coeff_succ m r (k - 2)
    have h1 : k - 1 + 1 = k := by omega
    have h2 : k - 2 + 1 = k - 1 := by omega
    rw [h1] at hCk
    rw [h2] at hCprev
    have hQprev := e993_tail_Q_predecessor_bracket r hr k hk2 hlow
    rw [e993_tail_E_coeff r k hk, e993_tail_E_coeff_succ,
      hCk, hCprev]
    nlinarith [hQrise, hQprev]
-- VERITYOS ENTRY 137 END

-- VERITYOS ENTRY 138 BEGIN theorem e993_guarded_tip_surplus_tail f1062202aadf947b8afe7aaefbd513f715ea8bd04bed1279ab82e6dde366bda9
theorem e993_guarded_tip_surplus_tail
    (m : ℕ) (hm : 100 ≤ m) (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (i : Fin m) (k : ℕ) (hk : 1 ≤ k) (hguard : 2 * k ≤ e993TailN r + 2) :
    0 < ((e993TailH r : ℝ) + 1) * (e993TailU r i).coeff k * (e993TailC r).coeff k +
      ((k : ℝ) + 1) * ((e993TailH r : ℝ) - (k : ℝ) + 1) *
        ((e993TailE r).coeff k * (e993TailC r).coeff k -
          (e993TailE r).coeff (k + 1) * (e993TailC r).coeff (k - 1)) := by
  by_cases hlow : 4 * k ≤ e993TailN r + 1
  · have hkN : k ≤ e993TailN r := e993_tail_guard_le_N r hm hr k hguard
    have hi : 1 ≤ r i := by
      rcases hr i with h | h | h <;> omega
    have hU : 0 < (e993TailU r i).coeff k :=
      e993_tail_U_coeff_pos r i hi k hkN
    have hC : 0 < (e993TailC r).coeff k :=
      e993_tail_C_coeff_pos r k (by omega)
    have hH : e993TailN r + 1 ≤ e993TailH r := e993_tail_order_lower r hr
    have hHR : (e993TailN r : ℝ) + 1 ≤ e993TailH r := by exact_mod_cast hH
    have hkR : (k : ℝ) ≤ e993TailN r := by exact_mod_cast hkN
    have hHpos : 0 < (e993TailH r : ℝ) + 1 := by nlinarith
    have hcurv : 0 < (e993TailH r : ℝ) - (k : ℝ) + 1 := by nlinarith
    have hg : 0 < ((k : ℝ) + 1) * ((e993TailH r : ℝ) - (k : ℝ) + 1) :=
      mul_pos (by positivity) hcurv
    have hfirst : 0 < ((e993TailH r : ℝ) + 1) *
        (e993TailU r i).coeff k * (e993TailC r).coeff k :=
      mul_pos (mul_pos hHpos hU) hC
    have hminor := e993_tail_E_minor_low r hr k hk hlow
    have hsecond := mul_nonneg (le_of_lt hg) hminor
    linarith
  · have hband : e993TailN r + 1 < 4 * k := by omega
    have hU := e993_tail_U_high_lower m hm r hr i k hk hband hguard
    exact e993_tail_payment_from_U m hm r hr i k hk hguard hU
-- VERITYOS ENTRY 138 END

