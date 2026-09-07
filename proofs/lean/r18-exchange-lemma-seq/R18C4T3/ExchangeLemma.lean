import Mathlib.Combinatorics.Hall.Finite
import Mathlib.Order.Interval.Finset.Fin
import Mathlib.Data.Finset.Max

/-!
# R18C4-T3 — GATE-2 scoped Lean: `E993-EXCHANGE-LEMMA`, the abstract
sorted-domination criterion

`GATE-2` §2 item 4. Per `CYCLE4-ALLOCATION.md` seat T-3's own charge:
formalize `E993-EXCHANGE-LEMMA` "as abstract-sequence lemmas where
tree-binding is not premise-free, with the scope stated verbatim in each
declaration's docstring." Unlike `GovernedCore`/`ClosedForms`, this file
does **not** import the governed `RTree` chain at all — the lemma below
is pure order/combinatorics on finite sequences of integers, and is
**fully proved**, not merely transcribed, because (per the sealed record
itself) its proof is elementary and does not touch the reserved
rooted-recursion zone.

**Sealed source, verbatim** (`cycles/cycle-2/stage3/R18C2-T1.md`:
274-316, this run's own r18 C2-T1 seat; registered `E993-EXCHANGE-LEMMA`,
`erdos-993-master-ledger-2026-09-04/CLAIM-IDENTITY.json`, status
`VERIFIED`/`proved_informal`, certificate: "r18 C2: T1 pre-test 94,052
checks 0 disagreements; CRIT-T1-F brute-force over all `t!` enumerations
107,210 checks 0 disagreements; ADJ-T retained under three independent
decision procedures"):

> **Lemma.** Let `r_1 > r_2 > … > r_t` be any strictly decreasing integers
> and `d_1,…,d_t` any nonnegative integers. A bijection `σ` with
> `d_{σ(j)} ≥ r_j` for every `j` exists **iff** the sorted-decreasing
> sequence `d_(1) ≥ d_(2) ≥ … ≥ d_(t)` satisfies `d_(m) ≥ r_m` for every
> `m = 1,…,t`.
>
> *Proof.* (⇐) Assign `d_(m)` to `r_m` directly. (⇒) Fix any valid `σ`
> and any `m`. The `m` values `d_{σ(1)},…,d_{σ(m)}` satisfy
> `d_{σ(i)} ≥ r_i ≥ r_m` for `i ≤ m` (thresholds decreasing), so the
> multiset has at least `m` entries `≥ r_m`; hence its `m`-th largest
> entry, `d_(m)`, is `≥ r_m`. ∎

## Formalization scope (stated verbatim, per the charge)

**This declaration formalizes ONLY the abstract sequence-domination
criterion.** It does **not** formalize, assert, or rely on:

- the identification of the abstract `r`/`d` with `k_shell+t+2−j` /
  `deg_T(z_j)` from `ClosedForms.BandEligible` (that identification is
  tree-bound and outside GATE-2's premise-free scope — the charge's own
  words: "as abstract-sequence lemmas **where tree-binding is not
  premise-free**");
- the pairwise-non-adjacency fact that licenses treating `deg_T(z_j)` as
  a free-to-permute quantity on real trees (`R18C2-T1.md`:277-282,
  reserved-zone-adjacent, consumed only by `GovernedCore`/`ClosedForms`,
  never re-derived there either);
- any claim that a real tree instance realizes either side of the
  criterion.

**The "sorted-decreasing sequence `d_(m)`" phrasing is formalized via the
EQUIVALENT counting condition the sealed proof's own (⇒) direction
already computes with** ("the multiset has at least `m` entries `≥ r_m`;
hence its `m`-th largest entry … is `≥ r_m`" — the counting statement and
the order-statistic statement are the same content the sealed proof
itself moves between, mid-proof, without treating the move as a separate
lemma). This route formalizes the counting form directly rather than
introducing a separate order-statistic/sorting construction, and proves
the FULL bijection-existence iff from it — a strictly more informative
statement than a bare restatement of the order-statistic phrasing, since
existence of the witnessing bijection `σ` is exactly what
`ClosedForms`/the sealed record needs `E993-EXCHANGE-LEMMA` FOR (deciding
whether SOME enumeration makes every remnant band-eligible).

No tree, no `RTree`, no `Premise K`, no `K-SCOPE`, no target of any kind
occurs anywhere below. Decisive-event threshold: not applicable — no
`#eval`/`decide`/`native_decide`/numerical witness search occurs; this is
a `theorem`, proved by direct term/tactic construction over an arbitrary
finite index type, at no particular order.
-/

namespace R18C4T3

open Finset

/-- **`E993-EXCHANGE-LEMMA`, abstract sorted-domination criterion**
(`GATE-2` §2 item 4). See the module docstring above for the exact
formalization scope (abstract sequences only; tree-binding NOT included).

`r d : Fin tCount → ℤ` are the abstract thresholds/degrees (0-indexed;
`r ⟨0⟩` plays the sealed record's `r_1`, the LARGEST threshold, down to
`r ⟨tCount−1⟩` playing `r_t`, the smallest — `hr : StrictAnti r` is
exactly "`r_1 > r_2 > … > r_t`" read as a function of index). `hd`
(`d` nonnegative) is retained for fidelity to the sealed statement's
typing even though the proof below never uses it (the argument is
positivity-free, as the sealed two-line proof itself already is).

The right-hand side is the sealed proof's own COUNTING form: for every
threshold level `r m` (the `(m+1)`-th largest, 0-indexed), at least
`m+1` of the `d i`'s meet or exceed it. -/
theorem exchangeLemma_dominationCriterion
    {tCount : ℕ} (r d : Fin tCount → ℤ) (hr : StrictAnti r) (hd : ∀ i, 0 ≤ d i) :
    (∃ σ : Equiv.Perm (Fin tCount), ∀ j, r j ≤ d (σ j)) ↔
      ∀ m : Fin tCount, m.val + 1 ≤ (univ.filter (fun i => r m ≤ d i)).card := by
  constructor
  · -- (⇒), the sealed proof's own argument, verbatim in structure.
    rintro ⟨σ, hσ⟩ m
    have hsub :
        (Iic m).image σ ⊆ univ.filter (fun i => r m ≤ d i) := by
      intro i hi
      simp only [mem_image, mem_Iic] at hi
      obtain ⟨j, hjm, rfl⟩ := hi
      simp only [mem_filter, mem_univ, true_and]
      have hrmj : r m ≤ r j := hr.antitone hjm
      exact hrmj.trans (hσ j)
    calc m.val + 1 = (Iic m).card := (Fin.card_Iic m).symm
      _ = ((Iic m).image σ).card := (card_image_of_injective _ σ.injective).symm
      _ ≤ (univ.filter (fun i => r m ≤ d i)).card := card_le_card hsub
  · -- (⇐), via Hall's Marriage Theorem: the per-level counting condition
    -- is exactly Hall's condition once restricted to the NESTED family
    -- `D j := {i : r j ≤ d i}` (nested because `r` is antitone), and for
    -- a nested family Hall's condition on every subset reduces to the
    -- condition on "prefixes" `{0,…,m}`, i.e. exactly the hypothesis.
    intro hcount
    set D : Fin tCount → Finset (Fin tCount) :=
      fun j => univ.filter (fun i => r j ≤ d i) with hD
    have hnest : ∀ i j : Fin tCount, i ≤ j → D i ⊆ D j := by
      intro i j hij x hx
      simp only [hD, mem_filter, mem_univ, true_and] at hx ⊢
      exact (hr.antitone hij).trans hx
    have hhall : ∀ s : Finset (Fin tCount), s.card ≤ (s.biUnion D).card := by
      intro s
      rcases s.eq_empty_or_nonempty with rfl | hne
      · simp
      · obtain ⟨m, hmem, hmax⟩ := s.exists_max_image (fun x : Fin tCount => x.val) hne
        have hunion : s.biUnion D = D m := by
          apply Subset.antisymm
          · intro x hx
            simp only [mem_biUnion] at hx
            obtain ⟨j, hj, hxj⟩ := hx
            have hjm : j ≤ m := hmax j hj
            exact hnest j m hjm hxj
          · exact fun x hx => mem_biUnion.mpr ⟨m, hmem, hx⟩
        rw [hunion]
        have hsub : s ⊆ Iic m := by
          intro j hj
          simp only [mem_Iic]
          exact hmax j hj
        calc s.card ≤ (Iic m).card := card_le_card hsub
          _ = m.val + 1 := Fin.card_Iic m
          _ ≤ (D m).card := hcount m
    obtain ⟨f, hf_inj, hf_mem⟩ :=
      (Finset.all_card_le_biUnion_card_iff_existsInjective' D).mp hhall
    have hf_bij : Function.Bijective f :=
      (Fintype.bijective_iff_injective_and_card f).mpr ⟨hf_inj, rfl⟩
    refine ⟨Equiv.ofBijective f hf_bij, fun j => ?_⟩
    have hmemj : f j ∈ D j := hf_mem j
    simp only [hD, mem_filter, mem_univ, true_and] at hmemj
    simpa [Equiv.coe_ofBijective] using hmemj

end R18C4T3
