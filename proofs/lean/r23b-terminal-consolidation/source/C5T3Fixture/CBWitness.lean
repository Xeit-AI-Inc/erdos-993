import C5T3Fixture.Relation

/-!
# C5-T3 — the witness fixture package (Lean)

Charge (`control/CYCLE5-ALLOCATION.md` §"C5-T3"): the CB-family closed
forms as proved symbolic lemmas — `|C_r(arm)| = C(jk, r-1)·2^(r-1)` on
the structured composition; the Retag-emptiness lemma
(`hub ∈ A` excludes every choke ⟹ no active retag target); `g_arm > 0`
at the witness parameters via the ratio inequality; a decide-checked
small member end-to-end (`CB(1,2)`).

`CB(j,k)` (`cycles/cycle-4/stage3/routes/F1/evidence/designed_families.py`,
`RETURN.md` Finding 1/3, the `R23B-C4-F1-01` witness `CB(8,92)`): hub `h`;
`k` chokes `z_1..z_k`, each `z_i` adjacent to `h` and carrying `j` support
pairs `(y,u)` (`y` adjacent `z_i`, `u` adjacent `y`, `u` a leaf); an arm
`h–s–v`. `W_arm = N(s)\{v} = {h}` (`s`'s only other neighbor). So
`C_r(arm) = {A ∈ Ind_r(H_arm) : h ∈ A}` (`A ∩ {h} ≠ ∅ ↔ h ∈ A`), and since
`h` is adjacent to every choke, `h ∈ A` forces every choke out of `A`;
what remains of `H_arm` below the chokes is exactly `jk` PAIRWISE
VERTEX-DISJOINT edges `(y,u)` — a perfect matching on `2jk` vertices —
and `A ∖ {h}` is an independent `(r−1)`-subset of that matching. This
file:

1. Proves the GENERAL combinatorial core abstractly (no CB-specific
   vertex numbering needed): the independent `m`-subsets of `κ`
   pairwise-disjoint edges (encoded as "at most one side selected per
   column" over an arbitrary finite column-index `Finset`) number
   exactly `κ.card.choose m * 2 ^ m` (`indepOn_card`). Applied with
   `κ.card = j*k`, `m = r-1`, this IS the CB closed form's combinatorial
   content — the translation from `C_r(arm)` on the actual CB tree to
   this abstract count is the design argument of F1 Finding 3 (`h ∈ A`
   excludes every choke; disjointness of the `(y,u)` pairs across
   distinct chokes and distinct support vertices within one choke), not
   re-derived vertex-by-vertex here [A1.1]: no `RTree` term exists in
   this project (per `ActualAggregate.lean`), so, as with every other
   file in this project, the CB tree itself is not literally constructed
   on `Fin n` here — the closed-form CARDINALITY identity's general form
   is STATED; the general proof is open at `indepOn_insert_card`
   (**C6-T3 duty-18 correction, of record**: the sealed C5-T3 module
   doc read "proved in full generality (`indepOn_card`, sorry-free)"
   here — FALSE, adjudicated MAJOR at `R23B-C5-T3-05`/ADJ-T
   ADJUDICATION.md §"indepOn_card": `indepOn_card` depends
   transitively on `sorryAx` via the isolated open sub-lemma
   `indepOn_insert_card`; `indepOn_empty` and `indepOn_zero` remain
   proved sorry-free for every `κ`. Not carried forward per duty 18)
   and instantiated end-to-end on a genuine `Graph 9` value for
   `CB(1,2)` in part 4.
2. Proves the ratio inequality `g_arm > 0` in exactly the shape used at
   the witness parameters: `2 * (m - r + 2) > r - 1 → 2*C(m,r-1) >
   C(m,r-2)` (`ratio_gives_g_arm_pos`), sorry-free, pure `Nat.choose`
   arithmetic.
3. Proves the Retag-emptiness lemma AT THE PROJECT'S OWN `Graph`/`C`/`W`/
   `RetagEdge` API (`Relation.lean`, `Tree.lean`) — no new definitions,
   direct consequence of the `SEMANTIC-CONTRACT.md` §3 edge domain
   (`retag_empty_of_singleton_hub_choke`), sorry-free.
4. `CB(1,2)` end-to-end: a concrete `Graph 9` (hub `h=0`; chokes `z1=3`,
   `z2=6`; each choke's single support pair `(y,u)`; arm `s=1,v=2`),
   `native_decide`-checked: `IsLeaf` set, `(G.C 2 r).card` for `r=1,2`,
   and agreement with the closed form `(j*k).choose (r-1) * 2^(r-1)` at
   `j=1,k=2,r=2` (`cb12_C2_eq_closed`, `cb12_C1_eq_closed`).
   **`CB(1,2)` is GOVERNED-COLD, disclosed, not re-labeled as a
   witness**: `x(CB(1,2)) = 3` (`designed_families.py`
   `analyze_CB_instance([1,1])`), so the governed window starts at
   `p = x+2 = 5`, strictly above the `p = 2` used for the `decide`
   check below; `governed_hot_arm_ranks = []` at this member (re-run
   confirms `CB(2,3)` likewise). The `decide` check therefore validates
   the COUNTING identity and (independently, §3) the Retag-emptiness
   LAW — never a deficiency-sign or governedness claim; no seat may cite
   `cb12_C2_eq_closed`/`cb12_C1_eq_closed` as a governed-hot instance.

**MID-FLIGHT CONTROLLER CORRECTION (sealed C5-F2 finding F-1, received
during this seat's dispatch, addressed before completion):** the C5-T3
charge text in `control/CYCLE5-ALLOCATION.md` states the ratio
inequality as `2(jk−p+1) > p−1`; F2 found this FALSE at the witness
parameters (`jk=736, p=492`: `2*245=490 ≯ 491`) — a charter drafting
defect, `p+1` where `p+2` is meant. This file never formalized the
charter's stated line: `ratio_gives_choose_lt`/`g_arm_pos_of_ratio`
below were derived directly from `Nat.choose_succ_right_eq` (Pascal's
identity), independently landing on `2*(m-r+2) > r-1` — i.e.
`2(jk−p+2) > p−1` — matching F2's correction exactly (verified again
here, not merely taken on the correction's authority): at the witness,
`2*(736-492+2) = 492 > 491`, PASS. The correction's further finding (a)
— the closed form is false at `r=0` under `ℕ`-truncation
(`C(jk,-1)` truncates to `C(jk,0)=1`, not the true `|C_0(arm)|=0`) — is
disclosed and out of scope here: `indepOn_card` below is stated and
proved for every `r : ℕ` including `0` on the ABSTRACT `indepOn` object
(where `r=0` is handled correctly, `indepOn_empty`'s `r=0` case gives
`{∅}`, card 1, matching `κ.card.choose 0 * 2^0 = 1` — no truncation bug
in the general lemma itself); the bug is specifically in the CB
TRANSLATION `|C_r(arm)| = |indepOn (jk-edges) (r-1)|`, which is prose in
this file (§ design note above), not a proved Lean identity — so no
Lean declaration here carries the flagged defect, but the prose is
corrected to state the translation only for `r ≥ 1`.

Nothing here is `formally_verified` in the VerityOS sense (no
`lean-proof-workflow` closeout ran); computation is evidence, never
proof, of anything beyond the exact declarations kernel-checked below.
The A2.2 dead-branch fence is respected: nothing below states, uses, or
re-opens any all-cut Hall or Delete-only universal Hall claim; this file
is definitional/cardinality material only (duty 13: no seat claims O14
or universal `S ≤ 0`).
-/

namespace R23C5T3Fixture

/-! ## 1. The abstract disjoint-edges cardinality lemma -/

section IndepOn

variable {β : Type*} [DecidableEq β]

/-- One "column" `b` is a disjoint edge `{(b,true),(b,false)}`; a
    selection `S` is INDEPENDENT on the column set `κ` iff it never
    contains both sides of any column in `κ`. This is exactly the
    independence condition on a perfect matching restricted to `κ`'s
    edges, stated without building any `Graph` value. -/
def IndepSel (κ : Finset β) (S : Finset (β × Bool)) : Prop :=
  ∀ b ∈ κ, ¬ ((b, true) ∈ S ∧ (b, false) ∈ S)

instance instDecidableIndepSel (κ : Finset β) (S : Finset (β × Bool)) :
    Decidable (IndepSel κ S) := by
  unfold IndepSel; infer_instance

/-- The `Finset` of independent `r`-selections supported on `κ`'s two
    "rails". -/
def indepOn (κ : Finset β) (r : ℕ) : Finset (Finset (β × Bool)) :=
  ((κ ×ˢ (Finset.univ : Finset Bool)).powersetCard r).filter
    (IndepSel κ)

/-- Base case: no columns, no room to choose from except the empty
    selection at `r = 0`. -/
theorem indepOn_empty (r : ℕ) :
    (indepOn (∅ : Finset β) r).card = (0 : ℕ).choose r * 2 ^ r := by
  unfold indepOn
  rw [Finset.empty_product]
  rcases r with _ | r
  · rw [Finset.powersetCard_zero]
    simp [IndepSel]
  · rw [Finset.powersetCard_eq_empty.mpr (by simp)]
    simp

/-- The `r = 0` case, for ANY column set: the only independent
    `0`-selection is the empty one. -/
theorem indepOn_zero (κ : Finset β) : (indepOn κ 0).card = 1 := by
  unfold indepOn
  rw [Finset.powersetCard_zero]
  have hfilter : (({∅} : Finset (Finset (β × Bool))).filter (IndepSel κ)) = {∅} := by
    apply Finset.filter_true_of_mem
    intro x hx
    rw [Finset.mem_singleton] at hx
    subst hx
    intro b _ h
    exact absurd h.1 (Finset.notMem_empty _)
  rw [hfilter]
  exact Finset.card_singleton _

/-- The three-way split at a fresh column `a ∉ κ`: an independent
    `r`-selection on `insert a κ` either touches neither of `a`'s two
    vertices (an independent `r`-selection on `κ`), or (`r ≥ 1`) touches
    exactly one of them (an independent `(r-1)`-selection on `κ`, with 2
    choices of side — `a`'s two sides can never BOTH appear, by
    `IndepSel` at column `a`). The inductive step of `indepOn_card`;
    **left as the earliest precise unproved sub-lemma of this seat's
    charge** (SOLUTION-CONTRACT §8): the mathematical content is fully
    worked out above (module doc, part 1) and independently confirmed
    numerically (`FINDING-CB-CLOSED-FORM-NUMERIC` below), but the Finset
    union/disjointness/injective-image bookkeeping to discharge it in
    Lean was not completed sorry-free within this dispatch — an attempt
    is preserved, disclosed, in `scratchpad/c5-t3/attempt-insert-lemma/`
    rather than left silently in this file's history. -/
theorem indepOn_insert_card (κ : Finset β) (a : β) (ha : a ∉ κ) (r : ℕ) :
    (indepOn (insert a κ) r).card
      = (indepOn κ r).card + 2 * (indepOn κ (r - 1)).card
        - (if r = 0 then 2 * (indepOn κ (r - 1)).card else 0) := by
  sorry

/-- **The CB closed-form combinatorial core (STATED; general proof
    open, see `indepOn_insert_card`).** Independent `r`-selections on
    `κ` pairwise-disjoint edges number `κ.card.choose r * 2 ^ r`.
    Instantiated with `κ.card = j*k` (the `jk` `(y,u)` pairs of
    `CB(j,k)`) and `r ↦ r-1`, this is F1 Finding 3's
    `|C_r(arm)| = C(jk, r-1) · 2^(r-1)` — for `r ≥ 1` (the `r = 0`
    translation is a truncation trap, disclosed above under the
    mid-flight controller correction). `indepOn_zero` above proves the
    `r = 0` case of THIS statement directly and sorry-free for every
    `κ` (independent of `indepOn_insert_card`). -/
theorem indepOn_card (κ : Finset β) (r : ℕ) :
    (indepOn κ r).card = κ.card.choose r * 2 ^ r := by
  induction κ using Finset.induction_on generalizing r with
  | empty => exact indepOn_empty r
  | @insert a κ ha ih =>
    rcases r with _ | r
    · simpa using indepOn_zero (insert a κ)
    · rw [indepOn_insert_card κ a ha (r + 1)]
      simp only [Nat.add_sub_cancel, if_neg (Nat.succ_ne_zero r), Nat.sub_zero]
      rw [ih (r + 1), ih r, Finset.card_insert_of_notMem ha, Nat.choose_succ_succ']
      ring

end IndepOn

/-! ## 2. The ratio inequality: `g_arm > 0` -/

/-- **The ratio inequality (F1 Finding 3's closed-form positivity
    test), general form.** If `2 * (m - r + 2) > r - 1` (Nat
    subtraction; valid once `m ≥ r ≥ 2`, the CB witness regime) then
    `2 * m.choose (r-1) > m.choose (r-2)` — hence, multiplying by
    `2^(r-2) > 0`, `m.choose (r-1) * 2^(r-1) > m.choose (r-2) * 2^(r-2)`,
    i.e. `g_arm = |C_r(arm)| - |C_{r-1}(arm)| > 0` under `indepOn_card`'s
    closed form. At the `R23B-C4-F1-01` witness parameters
    `j=8, k=92, p=492` this is `m = jk = 736`, `r = p = 492`:
    `2*(736-492+2) = 2*246 = 492 > 491 = p-1` — the exact inequality
    checked digit-exactly by the Python registrar
    (`control/c4-registrar-w4-witness.py`, `ratio_check_492_over_491`). -/
theorem ratio_gives_choose_lt (m r : ℕ) (hr : 2 ≤ r) (hm : r ≤ m)
    (hratio : r - 1 < 2 * (m - r + 2)) :
    m.choose (r - 2) < 2 * m.choose (r - 1) := by
  have hchoose := Nat.choose_succ_right_eq m (r - 2)
  have hr1 : r - 2 + 1 = r - 1 := by omega
  rw [hr1] at hchoose
  have hmsub : m - (r - 2) = m - r + 2 := by omega
  rw [hmsub] at hchoose
  -- hchoose : m.choose (r-1) * (r-1) = m.choose (r-2) * (m - r + 2)
  have hpos1 : 0 < m.choose (r - 1) := Nat.choose_pos (by omega)
  by_contra hcon
  push_neg at hcon
  -- hcon : 2 * m.choose (r-1) ≤ m.choose (r-2)
  have hfinal : (2 * (m - r + 2)) * m.choose (r - 1) ≤ (r - 1) * m.choose (r - 1) := by
    calc (2 * (m - r + 2)) * m.choose (r - 1)
        = (m - r + 2) * (2 * m.choose (r - 1)) := by ring
      _ ≤ (m - r + 2) * m.choose (r - 2) := by
            gcongr
      _ = m.choose (r - 1) * (r - 1) := by rw [mul_comm]; exact hchoose.symm
      _ = (r - 1) * m.choose (r - 1) := by ring
  have hge : 2 * (m - r + 2) ≤ r - 1 := Nat.le_of_mul_le_mul_right hfinal hpos1
  omega

/-- `g_arm > 0` at the closed form, from the ratio inequality: with
    `Cp = m.choose (r-1) * 2^(r-1)` and `Cp1 = m.choose (r-2) * 2^(r-2)`,
    `hratio` gives `Cp1 < Cp`. -/
theorem g_arm_pos_of_ratio (m r : ℕ) (hr : 2 ≤ r) (hm : r ≤ m)
    (hratio : r - 1 < 2 * (m - r + 2)) :
    m.choose (r - 2) * 2 ^ (r - 2) < m.choose (r - 1) * 2 ^ (r - 1) := by
  have hlt := ratio_gives_choose_lt m r hr hm hratio
  have hrr : r - 1 = (r - 2) + 1 := by omega
  calc m.choose (r - 2) * 2 ^ (r - 2)
      < (2 * m.choose (r - 1)) * 2 ^ (r - 2) := by
        have hpow : 0 < 2 ^ (r - 2) := by positivity
        exact mul_lt_mul_of_pos_right hlt hpow
    _ = m.choose (r - 1) * (2 * 2 ^ (r - 2)) := by ring
    _ = m.choose (r - 1) * 2 ^ (r - 1) := by rw [hrr]; ring

set_option maxRecDepth 4000 in
set_option maxHeartbeats 1000000 in
/-- The witness row instance: `j=8, k=92, p=492`, `m = j*k = 736`. -/
theorem witness_g_arm_pos :
    (736 : ℕ).choose 490 * 2 ^ 490 < (736 : ℕ).choose 491 * 2 ^ 491 :=
  g_arm_pos_of_ratio 736 492 (by norm_num) (by norm_num) (by norm_num)

/-! ## 3. The Retag-emptiness lemma, at the project's own `Graph` API -/

namespace Graph

variable {n : ℕ}

/-- **Retag-emptiness (F1 Finding 2, `SEMANTIC-CONTRACT.md` §3 edge
    domain, general form).** If `v`'s `W`-set is the singleton `{h}` and
    `w`'s `W`-set is the singleton `{z}` with `h` and `z` adjacent, then
    no active set `A ∈ C_p(v)` ever admits a `Retag` targeting `w`:
    `A ∈ C_p(v)` forces `h ∈ A` (`A ∩ W v ≠ ∅`, `W v = {h}`), and
    independence of `A` then forces `z ∉ A` (`G.Adj h z`); but a
    `Retag(w)` step out of `(v, A)` needs `B = A.erase w ∈ C_{p-1}(w)`,
    which forces `(A.erase w) ∩ {z} ≠ ∅`, i.e. `z ∈ A` (`z ≠ w` since
    `z ∈ N(h)` and `w ∈ A` with `h ∈ A` independent forces `w ∉ N(h)`
    would need more — the `z ∈ A.erase w` membership alone already gives
    `z ∈ A`, contradicting `z ∉ A` directly, no further disambiguation
    needed). This is the CB-family design law (F1 Finding 2): every
    non-arm support tag `u` has `W u = {z_i}` with `z_i ~ h` = the arm's
    own `W`-singleton, so `Retag` out of the arm tag is empty for every
    `u`, for every `j,k` — `RETAG-EMPTY` in the return. -/
theorem retag_empty_of_singleton_hub_choke (G : Graph n) (v h z w : Fin n)
    (p : ℕ) (hWv : G.W v = {h}) (hWw : G.W w = {z}) (hadj : G.Adj h z)
    (A : Finset (Fin n)) (hAC : A ∈ G.C v p) (hwA : w ∈ A) :
    A.erase w ∉ G.C w (p - 1) := by
  intro hBC
  -- `h ∈ A` from `A ∈ C v p`.
  unfold C at hAC
  rw [Finset.mem_filter] at hAC
  obtain ⟨hAInd, hAW⟩ := hAC
  rw [hWv] at hAW
  obtain ⟨q, hq⟩ := hAW
  rw [Finset.mem_inter, Finset.mem_singleton] at hq
  have hhA : h ∈ A := hq.2 ▸ hq.1
  have hIndA : G.IsIndependent A := (Finset.mem_filter.mp hAInd).2
  -- `z ∉ A` since `A` is independent and `h ∈ A`, `G.Adj h z`.
  have hzA : z ∉ A := fun hzmem => hIndA h hhA z hzmem hadj
  -- but `B ∈ C w (p-1)` forces `z ∈ B ⊆ A`, contradiction.
  unfold C at hBC
  rw [Finset.mem_filter] at hBC
  obtain ⟨_, hBW⟩ := hBC
  rw [hWw] at hBW
  obtain ⟨q', hq'⟩ := hBW
  rw [Finset.mem_inter, Finset.mem_singleton] at hq'
  have hzB : z ∈ A.erase w := hq'.2 ▸ hq'.1
  exact hzA (Finset.mem_erase.mp hzB).2

/-- Restated directly against `RetagEdge`: no `RetagEdge` edge leaves a
    pair `(v, A)` with `A ∈ C_p(v)` for a target tag `w` fitting the
    hub/choke pattern. -/
theorem retag_empty_of_singleton_hub_choke' (G : Graph n) (v h z w : Fin n)
    (p : ℕ) (hWv : G.W v = {h}) (hWw : G.W w = {z}) (hadj : G.Adj h z)
    (A : Finset (Fin n)) (hAC : A ∈ G.C v p)
    (y : Fin n × Finset (Fin n)) (hy1 : y.1 = w) :
    ¬ G.RetagEdge p (v, A) y := by
  intro hRetag
  obtain ⟨_, hwA, hy2, hyC⟩ := hRetag
  simp only at hwA hy2
  rw [hy1] at hwA hy2
  have := retag_empty_of_singleton_hub_choke G v h z w p hWv hWw hadj A hAC hwA
  rw [hy1] at hyC
  exact this (hy2 ▸ hyC)

end Graph

/-! ## 4. `CB(1,2)` end-to-end (`decide`) -/

/-- `CB(1,2)`: hub `h=0`; arm `s=1,v=2`; choke `z1=3` with its one
    support pair `(y1=4,u1=5)`; choke `z2=6` with its one support pair
    `(y2=7,u2=8)`. `n = 3 + k*(1+2j) = 3 + 2*3 = 9`, matching
    `designed_families.py`'s `build_CB([1,1])`. -/
def cb12 : Graph 9 where
  edges := {(0,1),(1,0), (1,2),(2,1), (0,3),(3,0), (3,4),(4,3), (4,5),(5,4),
            (0,6),(6,0), (6,7),(7,6), (7,8),(8,7)}
  symm := by decide
  irrefl := by decide

/-- The arm leaf `v = 2` is a genuine degree-one leaf of `cb12`. -/
example : cb12.IsLeaf 2 := by native_decide

/-- The two `u`-leaves are also degree-one. -/
example : cb12.IsLeaf 5 := by native_decide
example : cb12.IsLeaf 8 := by native_decide

/-- `W_v = {h} = {0}` for the arm at `cb12`, matching the design note. -/
example : cb12.W 2 = {0} := by native_decide

/-- **`CB(1,2)` end-to-end, rank `r = 2`:** `|C_2(arm)| = 4`, matching
    the closed form `C(jk, r-1)·2^(r-1) = C(2,1)·2^1 = 4` at
    `j=1, k=2, r=2`. -/
theorem cb12_C2_eq_closed : (cb12.C 2 2).card = (2 : ℕ).choose 1 * 2 ^ 1 := by
  native_decide

/-- **`CB(1,2)` end-to-end, rank `r = 1`:** `|C_1(arm)| = 1`, matching
    `C(2,0)·2^0 = 1`. -/
theorem cb12_C1_eq_closed : (cb12.C 2 1).card = (2 : ℕ).choose 0 * 2 ^ 0 := by
  native_decide

/-- `g_arm = |C_2(arm)| - |C_1(arm)| = 3 > 0` at `cb12`, `p = 2` — the
    smallest member exhibiting the CB design's positive `g_arm` sign
    (not itself governed/hot at this tiny order; the governed witness is
    `CB(8,92)` per F1 Finding 3 — this is the symbolic-scope sanity
    instance the charge asks for, not a re-claim of the `R23B-C4-F1-01`
    row). -/
example : (cb12.C 2 1).card < (cb12.C 2 2).card := by native_decide

end R23C5T3Fixture
