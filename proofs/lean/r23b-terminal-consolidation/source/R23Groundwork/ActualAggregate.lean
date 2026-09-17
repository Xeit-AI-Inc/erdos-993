import R23Groundwork.ActualTree

/-!
# C4-T2: aggregate definienda de-routed from `support`

Charge (`control/CYCLE4-ALLOCATION.md` §"C4-T2", residual item 1 of the C3
gate's four-item list; the exact residual is C3-LEDGER `R23B-C3-T1-03`'s
"NOT lifted" clause: `(G.C v r).card`, `G.P p`, `G.N p`, `G.S p` still
route through the `support` stand-in in every `_actual` statement): define
the aggregate `S` and the per-leaf quantities DIRECTLY against actual
adjacency — no occurrence of the `support` stand-in in any definition of
this file — and prove equivalence lemmas to the C3 forms, sorry-free.

Design, disclosed:

* The `…Act` definitions (`WAct`, `HcarrierAct`, `removedClosedNbhdCarrierAct`,
  `CAct`, `bAct`, `BAct`, `gAct`) take the actual neighbor `s` as an
  explicit argument. They mention only `G.Adj`/`G.nbrs` data of the ACTUAL
  vertex `s` handed in — never `G.support`.
* The `…Adj` definitions (`gAdjSum`, `SAct`, `PAct`, `NAct`) close over the
  neighbor argument by summing/uniting over the ACTUAL neighbor set
  `G.nbrs v`. For a degree-one leaf this range is exactly the singleton of
  the contract's unique neighbor `s_v` (proved at C3:
  `nbrs_eq_singleton_support_of_isLeaf`), so no choice function — and in
  particular no `support` — is needed to make the aggregate a definite
  value.
* `a` and `Favorable` are ALREADY support-free in the C1-T6 encoding
  (`Tree.lean`: `a v p = DeltaOn (univ.erase v) p`;
  `Favorable p = filter (IsLeaf v ∧ a v p < 0) univ`) — nothing to
  de-route; recorded here so the residual's item-1 scope is answered in
  full rather than silently narrowed.

**[A1.1] premise (SEMANTIC-CONTRACT AMENDMENT A1.1, reaffirmed A2.3),
stated where it bears:** every declaration below is a statement about the
C1-T6 ordinary-graph encoding (`Graph n` on `Fin n`); its reading as a
statement about the registered "actual tree" objects carries the unproved
`RTree.semanticAdequacyTarget` transfer premise. No `RTree` term exists in
this project, so the premise cannot be a Lean hypothesis; it is carried as
this documented side condition per standing duty 6 — unless C4-T3
discharges it, in which case that route's exact scope governs.

Mode convention (standing duty 1): `x(T)` = FIRST STRICT DESCENT,
`min{k ≥ 0 : Δ_k(T) < 0}`; first and last global mode are different
objects. The governed-row hypotheses below consume `x` through its
first-strict-descent specification (`Δ_x < 0`, `Δ_k ≥ 0` below), exactly
as C3-T1's `THM_R23_B_bridge2_actual` does.

The A2.2 DEAD-BRANCH fence is respected: nothing below states, uses, or
re-opens any all-cut Hall or Delete-only universal Hall claim. Everything
here is definitional/cardinality material on the O14-row objects
(BRIDGE-1/2 and `S`), which A2.2 explicitly retains outside the fence.

Nothing in this file is `formally_verified` in the VerityOS sense (no
`lean-proof-workflow` closeout ran). Lean-kernel type-checking is
computation-grade evidence of exactly the declarations checked, on exactly
this encoding — never proof of any claim beyond them.
-/

namespace R23
namespace Graph

variable {n : ℕ} (G : Graph n)

/-! ## 1. Per-leaf definienda against the actual neighbor (no `support`)

Each definition takes the actual neighbor `s` explicitly. Under
`IsLeaf v` and `Adj v s`, C3's `support_eq_of_adj_of_isLeaf` proves
`support v = s`, which is what the §3 equivalence lemmas use — the
definitions themselves never consult the stand-in. -/

/-- `W_v = N_T(s_v) \ {v}` (`SEMANTIC-CONTRACT.md` §3), against the actual
    neighbor `s`. -/
def WAct (v s : Fin n) : Finset (Fin n) := (G.nbrs s).erase v

/-- `H_v = T − {v, s_v}` carrier (`SEMANTIC-CONTRACT.md` §3), against the
    actual pair `{v, s}`. -/
def HcarrierAct (_G : Graph n) (v s : Fin n) : Finset (Fin n) :=
  Finset.univ \ {v, s}

/-- `T − N[s_v]` carrier (`SEMANTIC-CONTRACT.md` §2/§3), against the
    actual `s`: remove the actual closed neighborhood `insert s (nbrs s)`.
    Depends on `s` alone — the contract's object does too. -/
def removedClosedNbhdCarrierAct (s : Fin n) : Finset (Fin n) :=
  Finset.univ \ insert s (G.nbrs s)

/-- `C_r(v) = {A ∈ Ind_r(H_v) : A ∩ W_v ≠ ∅}` (`SEMANTIC-CONTRACT.md` §3),
    against the actual neighbor `s`. -/
def CAct (v s : Fin n) (r : ℕ) : Finset (Finset (Fin n)) :=
  (G.IndOn (G.HcarrierAct v s) r).filter (fun A => (A ∩ G.WAct v s).Nonempty)

/-- `b_v = Δ_{p−1}(T − {v, s_v})` (`SEMANTIC-CONTRACT.md` §2), against the
    actual `s`. -/
def bAct (v s : Fin n) (p : ℕ) : ℤ := G.DeltaOn (G.HcarrierAct v s) (p - 1)

/-- `B_{s_v} = Δ_{p−1}(T − N[s_v])` (`SEMANTIC-CONTRACT.md` §2), against
    the actual `s`. -/
def BAct (s : Fin n) (p : ℕ) : ℤ :=
  G.DeltaOn (G.removedClosedNbhdCarrierAct s) (p - 1)

/-- `g_v = b_v − B_{s_v}` (`SEMANTIC-CONTRACT.md` §2), against the actual
    `s`. -/
def gAct (v s : Fin n) (p : ℕ) : ℤ := G.bAct v s p - G.BAct s p

/-! ## 2. Aggregate definienda against actual adjacency (no `support`)

The neighbor argument is closed over by ranging over the ACTUAL neighbor
set `G.nbrs v`. For a leaf this set is the singleton of the unique
neighbor, so the sum/union has exactly one term — the contract's own
`s_v`, reached through adjacency, not through the stand-in. -/

/-- Per-leaf `g_v` as a function of `v` alone: sum of `gAct v s p` over the
    ACTUAL neighbors `s` of `v`. On a degree-one leaf this is literally
    `g_v` at the unique neighbor (`gAdjSum_eq_g`). -/
def gAdjSum (v : Fin n) (p : ℕ) : ℤ := ∑ s ∈ G.nbrs v, G.gAct v s p

/-- **The complete aggregate `S(T,p)` de-routed from `support`**
    (`SEMANTIC-CONTRACT.md` §2): `S(T,p) = Σ_{v ∈ F_p(T)} g_v`, with every
    per-leaf term reached through actual adjacency. Contract clauses
    inherited definitionally: leaves are counted separately even when
    supports coincide (the outer sum ranges over `v`), and an empty
    favorable set sums to `0`. -/
def SAct (p : ℕ) : ℤ := ∑ v ∈ G.Favorable p, G.gAdjSum v p

/-- `P = ⊔_{v∈F} {v} × C_p(v)` de-routed from `support`: the inner union
    ranges over the actual neighbors of the favorable leaf `v` (a
    singleton for a leaf). -/
def PAct (p : ℕ) : Finset (Fin n × Finset (Fin n)) :=
  (G.Favorable p).biUnion (fun v =>
    (G.nbrs v).biUnion (fun s => (G.CAct v s p).image (fun A => (v, A))))

/-- `N = ⊔_{v∈F} {v} × C_{p−1}(v)` de-routed from `support`. -/
def NAct (p : ℕ) : Finset (Fin n × Finset (Fin n)) :=
  (G.Favorable p).biUnion (fun v =>
    (G.nbrs v).biUnion (fun s => (G.CAct v s (p - 1)).image (fun A => (v, A))))

/-! ## 3. Equivalence lemmas to the C3 forms, per-leaf tier

Under `IsLeaf v` and `Adj v s` the actual-adjacency definienda equal the
C3 `support`-routed forms exactly. Load-bearing input: C3-T1's
`support_eq_of_adj_of_isLeaf` (`R23B-C3-T1-01`). -/

/-- `WAct` = C3's `W` on a leaf and its actual neighbor. -/
theorem wAct_eq_W {v s : Fin n} (h : G.IsLeaf v) (hs : G.Adj v s) :
    G.WAct v s = G.W v := by
  unfold WAct W
  rw [G.support_eq_of_adj_of_isLeaf h hs]

/-- `HcarrierAct` = C3's `Hcarrier` on a leaf and its actual neighbor. -/
theorem hcarrierAct_eq_Hcarrier {v s : Fin n} (h : G.IsLeaf v)
    (hs : G.Adj v s) : G.HcarrierAct v s = G.Hcarrier v := by
  unfold HcarrierAct Hcarrier
  rw [G.support_eq_of_adj_of_isLeaf h hs]

/-- `removedClosedNbhdCarrierAct` = C3's `removedClosedNbhdCarrier` on a
    leaf and its actual neighbor. -/
theorem removedAct_eq_removed {v s : Fin n} (h : G.IsLeaf v)
    (hs : G.Adj v s) :
    G.removedClosedNbhdCarrierAct s = G.removedClosedNbhdCarrier v := by
  unfold removedClosedNbhdCarrierAct removedClosedNbhdCarrier closedNbhd
  rw [G.support_eq_of_adj_of_isLeaf h hs]

/-- `CAct` = C3's `C` on a leaf and its actual neighbor, every rank. -/
theorem cAct_eq_C {v s : Fin n} (h : G.IsLeaf v) (hs : G.Adj v s)
    (r : ℕ) : G.CAct v s r = G.C v r := by
  unfold CAct C
  rw [G.hcarrierAct_eq_Hcarrier h hs, G.wAct_eq_W h hs]

/-- `bAct` = C3's `b` on a leaf and its actual neighbor. -/
theorem bAct_eq_b {v s : Fin n} (h : G.IsLeaf v) (hs : G.Adj v s)
    (p : ℕ) : G.bAct v s p = G.b v p := by
  unfold bAct b
  rw [G.hcarrierAct_eq_Hcarrier h hs]

/-- `BAct` = C3's `B` on a leaf and its actual neighbor. -/
theorem bigBAct_eq_B {v s : Fin n} (h : G.IsLeaf v) (hs : G.Adj v s)
    (p : ℕ) : G.BAct s p = G.B v p := by
  unfold BAct B
  rw [G.removedAct_eq_removed h hs]

/-- `gAct` = C3's `g` on a leaf and its actual neighbor. -/
theorem gAct_eq_g {v s : Fin n} (h : G.IsLeaf v) (hs : G.Adj v s)
    (p : ℕ) : G.gAct v s p = G.g v p := by
  unfold gAct g
  rw [G.bAct_eq_b h hs, G.bigBAct_eq_B h hs]

/-- `gAdjSum` = C3's `g` on a leaf: the actual-neighbor sum has exactly
    one term, the unique neighbor. Needs only `IsLeaf v` — the neighbor is
    produced, not supplied. -/
theorem gAdjSum_eq_g {v : Fin n} (h : G.IsLeaf v) (p : ℕ) :
    G.gAdjSum v p = G.g v p := by
  unfold gAdjSum
  rw [G.nbrs_eq_singleton_support_of_isLeaf h, Finset.sum_singleton]
  exact G.gAct_eq_g h (G.adj_support_of_isLeaf h) p

/-! ## 4. Equivalence lemmas to the C3 forms, aggregate tier

Unconditional on `G` (any `Graph n` of the encoding): every member of
`Favorable p` is a leaf by construction, which is all the per-leaf tier
needs. Broadening disclosed exactly as C3-T1's F-1/F-2 (no tree
hypothesis is needed or carried; the contract's domain is a subdomain). -/

/-- **`SAct = S`:** the de-routed aggregate equals the C3
    `support`-routed aggregate, for every `G` and `p`. -/
theorem sAct_eq_S (p : ℕ) : G.SAct p = G.S p := by
  unfold SAct S
  exact Finset.sum_congr rfl
    (fun v hv => G.gAdjSum_eq_g (G.isLeaf_of_mem_favorable hv) p)

/-- **`PAct = P`:** the de-routed source multiset equals the C3 form. -/
theorem pAct_eq_P (p : ℕ) : G.PAct p = G.P p := by
  unfold PAct P
  refine Finset.biUnion_congr rfl (fun v hv => ?_)
  have h := G.isLeaf_of_mem_favorable hv
  rw [G.nbrs_eq_singleton_support_of_isLeaf h, Finset.singleton_biUnion,
    G.cAct_eq_C h (G.adj_support_of_isLeaf h) p]

/-- **`NAct = N`:** the de-routed target multiset equals the C3 form. -/
theorem nAct_eq_N (p : ℕ) : G.NAct p = G.N p := by
  unfold NAct N
  refine Finset.biUnion_congr rfl (fun v hv => ?_)
  have h := G.isLeaf_of_mem_favorable hv
  rw [G.nbrs_eq_singleton_support_of_isLeaf h, Finset.singleton_biUnion,
    G.cAct_eq_C h (G.adj_support_of_isLeaf h) (p - 1)]

/-! ## 5. The bridges on the de-routed definienda

BRIDGE-1 is proved DIRECTLY against actual adjacency — the proof never
passes through `support`, its sentinel, or any C3 `support`-routed
statement; only the carrier-restriction lemma `indOn_sdiff` (support-free,
Bridge.lean) is reused. BRIDGE-2 is obtained through the §4 equivalences
from C3-T1's `THM_R23_B_bridge2_actual` (its rank floor consumed through
the first-strict-descent specification, unchanged). -/

/-- Key carrier identity against actual adjacency:
    `H_v \ W_v = T − N[s]` for ANY adjacent pair `v ~ s` — no leaf
    hypothesis (broadening disclosed: adjacency alone forces
    `{v,s} ∪ (N(s) \ {v}) = N[s]`). Support-free analogue of C2's
    `hcarrier_sdiff_w_eq_removedClosedNbhd`. -/
theorem hcarrierAct_sdiff_wAct {v s : Fin n} (hs : G.Adj v s) :
    G.HcarrierAct v s \ G.WAct v s = G.removedClosedNbhdCarrierAct s := by
  have hv : v ∈ G.nbrs s :=
    Finset.mem_filter.mpr ⟨Finset.mem_univ v, G.symm v s hs⟩
  have hkey : ({v, s} : Finset (Fin n)) ∪ (G.nbrs s).erase v
      = insert s (G.nbrs s) := by
    apply Finset.Subset.antisymm
    · intro x hx
      rcases Finset.mem_union.mp hx with hx1 | hx2
      · rcases Finset.mem_insert.mp hx1 with rfl | hx1'
        · exact Finset.mem_insert_of_mem hv
        · rw [Finset.mem_singleton] at hx1'
          rw [hx1']
          exact Finset.mem_insert_self _ _
      · exact Finset.mem_insert_of_mem (Finset.mem_erase.mp hx2).2
    · intro x hx
      rcases Finset.mem_insert.mp hx with rfl | hx2
      · exact Finset.mem_union_left _
          (Finset.mem_insert.mpr (Or.inr (Finset.mem_singleton.mpr rfl)))
      · by_cases hxv : x = v
        · rw [hxv]
          exact Finset.mem_union_left _ (Finset.mem_insert_self _ _)
        · exact Finset.mem_union_right _ (Finset.mem_erase.mpr ⟨hxv, hx2⟩)
  unfold HcarrierAct WAct removedClosedNbhdCarrierAct
  rw [← hkey]
  ext x
  simp only [Finset.mem_sdiff, Finset.mem_univ, true_and, Finset.mem_union]
  tauto

/-- **BRIDGE-1 on the de-routed definienda, proved directly [A1.1]:**
    `|C_r(v)| = i_r(T − {v,s}) − i_r(T − N[s])` for every adjacent pair
    `v ~ s` and every rank `r` — stated and proved with no reference to
    `support` anywhere in statement OR proof. No leaf/tree hypothesis
    (broadening disclosed, same shape as C1-LEDGER `R23-C1-BRIDGE1`). -/
theorem bridge1Act_proof {v s : Fin n} (hs : G.Adj v s) (r : ℕ) :
    ((G.CAct v s r).card : ℤ)
      = (G.iOn (G.HcarrierAct v s) r : ℤ)
        - (G.iOn (G.removedClosedNbhdCarrierAct s) r : ℤ) := by
  have hEq := G.hcarrierAct_sdiff_wAct hs
  have hFilterEq : G.IndOn (G.HcarrierAct v s \ G.WAct v s) r
      = (G.IndOn (G.HcarrierAct v s) r).filter
          (fun A => ¬ (A ∩ G.WAct v s).Nonempty) :=
    G.indOn_sdiff (G.HcarrierAct v s) (G.WAct v s) r
  have hadd : (G.CAct v s r).card
        + (G.IndOn (G.HcarrierAct v s \ G.WAct v s) r).card
      = (G.IndOn (G.HcarrierAct v s) r).card := by
    rw [hFilterEq]
    exact Finset.card_filter_add_card_filter_not
      (s := G.IndOn (G.HcarrierAct v s) r)
      (fun A => (A ∩ G.WAct v s).Nonempty)
  rw [hEq] at hadd
  unfold iOn
  omega

/-- **BRIDGE-1 de-routed, explicit-carrier headline [A1.1]:** same
    statement with both carriers spelled out
    (`univ \ {v,s}`, `univ \ insert s (nbrs s)`). -/
theorem THM_R23_B_bridge1_deroute (_hT : G.IsTree) {v s : Fin n}
    (_hleaf : G.IsLeaf v) (hs : G.Adj v s) (r : ℕ) :
    ((G.CAct v s r).card : ℤ)
      = (G.iOn (Finset.univ \ {v, s}) r : ℤ)
        - (G.iOn (Finset.univ \ insert s (G.nbrs s)) r : ℤ) :=
  G.bridge1Act_proof hs r

/-- Equivalence of the two BRIDGE-1 left sides: on a leaf and its actual
    neighbor, `|CAct v s r| = |C v r|` — connecting the de-routed
    statement to C3-T1's `THM_R23_B_bridge1_actual` term-for-term. -/
theorem cAct_card_eq_C_card {v s : Fin n} (h : G.IsLeaf v)
    (hs : G.Adj v s) (r : ℕ) : (G.CAct v s r).card = (G.C v r).card := by
  rw [G.cAct_eq_C h hs r]

/-- **BRIDGE-2 on the de-routed definienda [A1.1]:** on a governed row —
    `T` a tree (hypothesis carried for the contract's domain, not
    load-bearing, as at C3), `p ≥ x + 2` with `x` consumed through its
    first-strict-descent SPECIFICATION — `|PAct| − |NAct| = SAct(T,p)`,
    every object reached through actual adjacency. Obtained from C3-T1's
    `THM_R23_B_bridge2_actual` through the §4 equivalences. -/
theorem THM_R23_B_bridge2_deroute (_hT : G.IsTree) {x : ℕ}
    (hxneg : G.Delta x < 0) (hxmin : ∀ k < x, 0 ≤ G.Delta k)
    (p : ℕ) (hp : p ≥ x + 2) :
    ((G.PAct p).card : ℤ) - ((G.NAct p).card : ℤ) = G.SAct p := by
  rw [G.pAct_eq_P, G.nAct_eq_N, G.sAct_eq_S]
  exact G.THM_R23_B_bridge2_actual _hT hxneg hxmin p hp

/-- **THM-R23-B fully de-routed, packaged [A1.1]:** on a governed row,
    (i) BRIDGE-1 holds at every favorable leaf against every actual
    neighbor at every rank, in de-routed form, and (ii) BRIDGE-2 holds on
    the de-routed row objects. `SEMANTIC-CONTRACT.md` §5's THM-R23-B shape
    with NO definiendum routed through the `support` stand-in. -/
theorem THM_R23_B_deroute (hT : G.IsTree) {x : ℕ}
    (hxneg : G.Delta x < 0) (hxmin : ∀ k < x, 0 ≤ G.Delta k)
    (p : ℕ) (hp : p ≥ x + 2) :
    (∀ v ∈ G.Favorable p, ∀ s : Fin n, G.Adj v s → ∀ r : ℕ,
      ((G.CAct v s r).card : ℤ)
        = (G.iOn (Finset.univ \ {v, s}) r : ℤ)
          - (G.iOn (Finset.univ \ insert s (G.nbrs s)) r : ℤ)) ∧
    ((G.PAct p).card : ℤ) - ((G.NAct p).card : ℤ) = G.SAct p := by
  refine ⟨fun v hv s hs r => ?_, G.THM_R23_B_bridge2_deroute hT hxneg hxmin p hp⟩
  exact G.THM_R23_B_bridge1_deroute hT (G.isLeaf_of_mem_favorable hv) hs r

/-! ## 6. Non-vacuity controls (SOLUTION-CONTRACT §6 discipline)

Kernel-`decide` only — no `native_decide`, no custom axioms. Computation:
evidence of exactly these integers on exactly this encoding, never proof
of anything beyond them. -/

/-- The de-routed row objects reproduce C2-LEDGER `R23-C2-02`'s
    adjudicated non-vacuous `K_{1,6}` integers at `p = 5`:
    `|PAct| = 6`, `|NAct| = 30`, `SAct = −24` — a GOVERNED row
    (`x(K_{1,6}) = 3`, `p = 5 = x + 2`), and one where all six favorable
    leaves share the single support `0`, exercising the contract's
    "leaves counted separately even when supports coincide" clause on the
    de-routed aggregate. [A1.1] -/
theorem k16_deroute_row_nonvacuous :
    (k16.PAct 5).card = 6 ∧ (k16.NAct 5).card = 30 ∧ k16.SAct 5 = -24 := by
  decide


/-- End-to-end non-vacuous instantiation of the de-routed BRIDGE-2 on the
    governed row `(K_{1,6}, p = 5)`, `x = 3` supplied by its
    first-strict-descent specification. [A1.1] -/
theorem k16_bridge2_deroute_instance :
    ((k16.PAct 5).card : ℤ) - ((k16.NAct 5).card : ℤ) = k16.SAct 5 :=
  k16.THM_R23_B_bridge2_deroute k16_isTree (x := 3)
    (by decide)
    (by
      intro k hk
      interval_cases k <;> decide)
    5 (by omega)

/-- `K_{1,3}` shared-support control at the UNGOVERNED rank `p = 2`
    (`x(K_{1,3}) = 1`, so `p = 2 < x + 2` — outside the governed domain;
    used ONLY to exercise the DEFINITIONAL equivalence `SAct = S`, which
    is rank-unconditional, on a row with three favorable leaves and one
    shared support; cf. the C1 eligibility-hazard convention for
    ungoverned-rank instances): `SAct = S = −3` and all three leaves
    favorable. Evidence of exactly these integers, nothing else. -/
theorem k13_deroute_shared_support_control :
    k13.SAct 2 = k13.S 2 ∧ k13.SAct 2 = -3 ∧ (k13.Favorable 2).card = 3 := by
  decide


end Graph
end R23
