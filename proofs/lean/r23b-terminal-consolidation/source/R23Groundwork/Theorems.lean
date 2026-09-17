import R23Groundwork.Bridge
import R23Groundwork.LC4567

/-!
# `THM-R23-A/B` (`SEMANTIC-CONTRACT.md` §5) — C4-T1 GRAND MERGE

**C4-T1 charge (`control/CYCLE4-ALLOCATION.md`): THE GRAND MERGE.** This
file is C3-T2's sealed merged `Theorems.lean`
(`cycles/cycle-3/stage3/routes/T2/evidence/lean-project-source/`, sha256
`ba9dd2afd3853bf4ff64a3c3ab007cffbd25b7de9b19757da77f5a451d812e80`) with
exactly the C4-T1 merge deltas and nothing else:

1. the C3-T3 COMPLETION of `THM_R23_A` is folded in: the six new
   ingredient lemmas (`tag_not_mem_of_mem_C`,
   `delete_retag_targets_distinct`, `mem_P_iff`, `mem_N_iff`,
   `tag_pair_injective`, `card_tagged_biUnion`, `P_card_eq_sum`,
   `N_card_eq_sum`, `deleteEdge_label_unique`,
   `deleteEdge_retagEdge_exclusive` — from C3-T3's sealed
   `Theorems.lean`, sha256
   `3df118d13ea9af59e21216e20d0b016605b37109d003e9e35b196e268d013ffd`)
   and the completed THIRTEEN-conjunct `THM_R23_A` statement/proof
   (C3-LEDGER `R23B-C3-T3-01`), REPLACING C3-T2's carried seven-conjunct
   form (whose seven conjuncts appear verbatim among the thirteen, per
   that ledger row: C2's (1),(2),(3),(4a),(4b),(4c),(5) byte-unchanged);
2. C3-T3's `local_L1`-based proof of `retag_erase_mem_IndOn_pred` is NOT
   carried — the C3-T2 canonical-LC-4 proof below (via `toSimpleGraph` +
   `ErdosR23C2T3.lc4_retag_domain`) is retained, so Lemma L1 stays
   maintained ONCE (identical statement; C3-T3's copy proved the same
   thing through its route-local `local_L1`, deleted per the C2-T1
   module doc's own recommendation, executed at the C3-T2 merge);
3. the 13-conjunct docstring below carries C3-T2's REPAIRED clause-(3)
   sentence (CRIT-1 T1-6), not C3-T3's inherited garbled variant —
   docstring-currency only, zero statement/proof effect.

The C3 reconciliation debt `R23B-C3-T2-02` (three divergent Lean
lineages, no single artifact with the completed `THM_R23_A` and
`THM_R23_C` proved together) is what this project discharges; see also
`ActualTree.lean` (C3-T1 lineage), `InjectionFork.lean` (C3-T6 lineage),
`LCEF.lean` (C3-T4 lineage) and the module-level provenance digest table
in this route's evidence.

# `THM-R23-A/B` (`SEMANTIC-CONTRACT.md` §5) — C3-T2 MERGED PROJECT (LC-C)

**C3-T2 charge (`control/CYCLE3-ALLOCATION.md`): the Lean merge.** This
file is C2-T1's sealed `Theorems.lean`
(`cycles/cycle-2/stage3/routes/T1/evidence/`, sha256
`e33558f735750a553af766c1ca61d62b99cb5e83f6f332be60956cf30f17d34a`) with
exactly the merge deltas chartered for C3-T2 and nothing else:

1. imports now pull in C2-T2's sealed `Bridge.lean` (byte-identical copy)
   and C2-T3's sealed LC-4/5/6/7 file (as `LC4567.lean`, LC-7 docstring
   repaired per CR-T-1);
2. `THM_R23_B_bridge1`/`THM_R23_B_bridge2` are now PROVED (citing
   `bridge1_proof`/`bridge2_proof` from `Bridge.lean`) instead of `sorry`;
3. `local_L1` is DELETED and its single use replaced by a citation of the
   canonical LC-4 (`ErdosR23C2T3.lc4_retag_domain`), via the small
   `toSimpleGraph` view below — exactly the C2-T1 module doc's own
   recommendation to C3, executed;
4. the statement-only `THM_R23_C` (`sorry`) is REMOVED, NOT proved: it is
   C3-T6's charge (LC-G), and this merged artifact is chartered SORRY-FREE
   — a `sorry` is inventory, never a result, and none may ship here. The
   `HallCondition` definition is retained (a `Prop`-valued definition
   carries no truth claim) with an AMENDMENT A2.2 fence note;
5. three stale docstrings repaired (`Tree.lean` ghost citation E-1;
   `Controls.lean` cross-ref per ADJ-T F-7(c); LC-7 per CR-T-1) plus the
   two inherited ones (`Tree.lean` "left sorry"; `Relation.lean` "open"
   reading) and the garbled clause-(3) sentence below (CRIT-1 T1-6).

No sealed C2 byte was modified; the sealed trees remain the provenance of
record. Everything below this note is C2-T1's text unless marked
`(C3-T2)`.

# `THM-R23-A/B/C` (`SEMANTIC-CONTRACT.md` §5)

**C2-T1 charge (`control/CYCLE2-ALLOCATION.md`): re-state `THM_R23_A`.**
ADJ-T CR-3 (`cycles/cycle-1/stage5/adjudicators/t/ADJUDICATION.md`) is
binding: the C1 `THM_R23_A` declaration (`Theorems.lean:96-102` in
`cycles/cycle-1/stage3/routes/T6`'s sealed evidence) is VACUOUS — its three
conjuncts are (i) a restatement of the ALREADY-PROVED
`support_mem_nbrs_of_isLeaf`, (ii) the CONVERSE of totality (soundness: an
edge that exists lands in `N`, not that the domain's edges exist), and (iii)
bare `Prod` injectivity (`v ≠ w → (v,A) ≠ (w,A)`), a tautology with no
multiplicity content — `hT` and `hp` are UNUSED in the old statement, per
CRIT-6/ADJ-T. This file does NOT reuse that declaration's shape (per
`control/CYCLE2-ALLOCATION.md`'s explicit instruction). It assembles the
re-stated `THM_R23_A` from the three ingredients C1 already proved
informally (L-03 Delete-domain-exact, L-05 Retag-totality via Lemma L1,
L-06 simplicity/injectivity), Lean-formalizing each as a genuine lemma
about THIS encoding, then proving the assembled theorem from them.

**LC-11 encoding repairs (prerequisite, applied here and in `Tree.lean` /
`Controls.lean`):** `IsTree` below now excludes the 0-vertex graph
(`S-09`); `xOf`'s docstring in `Tree.lean` now gives the correct existence
argument (`Delta_α = -i_α < 0`, `α = α(T) ≤ n`) instead of the vacuous C1
one; `Controls.lean`'s stale `RETURN.md` finding cross-reference (`F-4` →
`F-6`) is corrected.

**Scope discipline (as merged, C3-T2).** `THM_R23_B_bridge1/2`'s STATEMENTS
below are unchanged from the C1 declarations; their proofs now cite
`Bridge.lean` (C2-T2's sealed, adjudicated proofs — R23-C2-01/02).
C2-T1's `local_L1` (a self-contained reproduction of Lemma L1, needed only
because sibling isolation forbade importing C2-T3's output mid-cycle) has
been deleted per its own module doc's recommendation to C3: the canonical
LC-4 (`ErdosR23C2T3.lc4_retag_domain`, byte-carried from C2-T3's sealed
evidence) is cited instead, through the `toSimpleGraph` view below, so the
argument is no longer maintained twice.
-/

namespace R23
namespace Graph

variable {n : ℕ} (G : Graph n)

/-- `G` is connected: every pair of vertices is joined by a reflexive-
    transitive `Adj`-path. -/
def Connected : Prop := ∀ u v : Fin n, Relation.ReflTransGen G.Adj u v

/-- WORKING tree predicate for this groundwork encoding: connected, with
    edge-`Finset` cardinality `2*(n-1)` (both orientations of `n-1`
    undirected edges). This is a MODELING CHOICE, not yet reconciled with
    the registered `RTree` interface (`C1-U2`'s charge) or with any
    alternative acyclicity-based tree characterization — recorded as a
    fidelity limitation, never silently treated as "the" canonical tree
    definition.

    **LC-11 repair (C2-T1):** the C1 version of this `def` had no `0 < n`
    conjunct, so the 0-vertex graph satisfied it VACUOUSLY: at `n = 0`,
    `n - 1 = 0` in `ℕ` (truncated subtraction), so `edges.card = 2*(n-1)`
    demands `edges.card = 0` (true, vacuously, since `Fin 0` has no edges
    at all), and `Connected` holds vacuously (there is no pair `u v : Fin 0`
    to fail on). So the empty graph was `IsTree` under the C1 encoding —
    plainly not intended by `SEMANTIC-CONTRACT.md` §5's "for every finite
    tree `T`". Fixed by conjoining `0 < n` explicitly. -/
def IsTree : Prop := 0 < n ∧ G.Connected ∧ G.edges.card = 2 * (n - 1)

/-! ## Auxiliary lemmas (proved, no `sorry`) — carried over unchanged from C1,
    still valid facts about this encoding, and used as ingredients below. -/

/-- Under `IsLeaf v`, the working `support v` really is a neighbor of `v`
    (not just some fallback sentinel). -/
theorem support_mem_nbrs_of_isLeaf {v : Fin n} (h : G.IsLeaf v) :
    G.support v ∈ G.nbrs v := by
  have hcard : (G.nbrs v).card = 1 := h
  have hne : (G.nbrs v).Nonempty := by
    rw [← Finset.card_pos, hcard]; decide
  unfold support
  rw [dif_pos hne]
  exact (G.nbrs v).min'_mem hne

/-- Every node of `P p` has its tag in `F_p(T)`. -/
theorem fst_mem_favorable_of_mem_P {p : ℕ} {x : Fin n × Finset (Fin n)}
    (hx : x ∈ G.P p) : x.1 ∈ G.Favorable p := by
  obtain ⟨v, hv, hx2⟩ := Finset.mem_biUnion.mp hx
  obtain ⟨A, _, hxeq⟩ := Finset.mem_image.mp hx2
  rw [← hxeq]
  exact hv

/-- Any correctly-tagged pair `(v, A)` with `v` favorable and `A ∈ C_r(v)`
    lies in the corresponding tagged union (specialized to `N p`, i.e.
    `r = p - 1`). -/
theorem mem_N_of_tag_mem_C {p : ℕ} {v : Fin n} (hv : v ∈ G.Favorable p)
    {A : Finset (Fin n)} (hA : A ∈ G.C v (p - 1)) : (v, A) ∈ G.N p :=
  Finset.mem_biUnion.mpr ⟨v, hv, Finset.mem_image.mpr ⟨A, hA, rfl⟩⟩

/-- Every `Delete` edge out of a `P p` node lands in `N p` (soundness half;
    the converse of totality). -/
theorem delete_lands_in_N (p : ℕ) {x y : Fin n × Finset (Fin n)}
    (hx : x ∈ G.P p) (hxy : G.DeleteEdge p x y) : y ∈ G.N p := by
  obtain ⟨hy1, _q, _hq, _herase, hyC⟩ := hxy
  have hxfav : x.1 ∈ G.Favorable p := G.fst_mem_favorable_of_mem_P hx
  have hyfav : y.1 ∈ G.Favorable p := by rw [hy1]; exact hxfav
  have hyC' : y.2 ∈ G.C y.1 (p - 1) := by rw [hy1]; exact hyC
  exact G.mem_N_of_tag_mem_C hyfav hyC'

/-- Every `Retag` edge out of a `P p` node lands in `N p` (soundness half). -/
theorem retag_lands_in_N (p : ℕ) {x y : Fin n × Finset (Fin n)}
    (_hx : x ∈ G.P p) (hxy : G.RetagEdge p x y) : y ∈ G.N p := by
  obtain ⟨hyF, _hmem, _herase, hyC⟩ := hxy
  exact G.mem_N_of_tag_mem_C hyF hyC

/-! ## New ingredient lemmas for the re-stated `THM_R23_A` (C2-T1) -/

/-- Independence is hereditary: a subset of an independent set is
    independent. `Delete`/`Retag` act by erasing one element from an
    already-independent set, so this is used repeatedly below. -/
theorem isIndependent_mono {S S' : Finset (Fin n)} (h : G.IsIndependent S)
    (hsub : S' ⊆ S) : G.IsIndependent S' :=
  fun u hu v hv => h u (hsub hu) v (hsub hv)

/-- Unfolds `IndOn` membership into its three constituent Finset facts. -/
theorem mem_IndOn_iff {U : Finset (Fin n)} {r : ℕ} {A : Finset (Fin n)} :
    A ∈ G.IndOn U r ↔ A ⊆ U ∧ A.card = r ∧ G.IsIndependent A := by
  unfold IndOn
  rw [Finset.mem_filter, Finset.mem_powersetCard]
  exact ⟨fun h => ⟨h.1.1, h.1.2, h.2⟩, fun h => ⟨⟨h.1, h.2.1⟩, h.2.2⟩⟩

/-- **Well-typedness of one-element erasure, unconditionally.** If `A` is an
    independent `r`-subset of carrier `U` and `q ∈ A`, then `A.erase q` is
    automatically an independent `(r-1)`-subset of the SAME carrier `U` — no
    extra hypothesis needed. This is the part of both `Delete`'s and
    (with a different carrier below) `Retag`'s totality that is completely
    free; the only thing that can fail is the `C`-membership "activity"
    condition `_ ∩ W_· ≠ ∅`, never this. -/
theorem erase_mem_IndOn_pred {U : Finset (Fin n)} {r : ℕ} {A : Finset (Fin n)}
    (hA : A ∈ G.IndOn U r) {q : Fin n} (hq : q ∈ A) :
    A.erase q ∈ G.IndOn U (r - 1) := by
  obtain ⟨hsub, hcard, hindep⟩ := (G.mem_IndOn_iff).mp hA
  refine (G.mem_IndOn_iff).mpr ⟨?_, ?_, ?_⟩
  · exact (Finset.erase_subset q A).trans hsub
  · rw [Finset.card_erase_of_mem hq, hcard]
  · exact G.isIndependent_mono hindep (Finset.erase_subset q A)

/-- **Well-definedness of `support` on leaves (THM-R23-A's well-definedness
    clause).** Under `IsLeaf v`, `support v` is not merely A neighbor of
    `v` (`support_mem_nbrs_of_isLeaf`, already known) — it is genuinely THE
    unique neighbor: `nbrs v` is exactly the singleton `{support v}`. This
    is the fact that makes every downstream object built "from the support"
    (`W_v`, `H_v`, `C_r(v)`) unambiguous, and it did not exist as a proved
    declaration in the C1 file (only as a docstring promise, left `sorry`
    in intent). -/
theorem support_eq_of_isLeaf {v : Fin n} (h : G.IsLeaf v) :
    G.nbrs v = {G.support v} := by
  have hcard : (G.nbrs v).card = 1 := h
  obtain ⟨a, ha⟩ := Finset.card_eq_one.mp hcard
  have hmem : G.support v ∈ G.nbrs v := G.support_mem_nbrs_of_isLeaf h
  rw [ha, Finset.mem_singleton] at hmem
  rw [ha, hmem]

/-- General Finset fact used by the Delete-domain characterization: erasing
    `q` from a nonempty `S` leaves it nonempty unless `S` was exactly `{q}`.
    Proved by cases on whether `q ∈ S`. -/
theorem erase_nonempty_iff_ne_singleton {S : Finset (Fin n)} (hS : S.Nonempty)
    {q : Fin n} : (S.erase q).Nonempty ↔ S ≠ {q} := by
  constructor
  · rintro ⟨x, hx⟩ hEq
    rw [Finset.mem_erase] at hx
    rw [hEq, Finset.mem_singleton] at hx
    exact hx.1 hx.2
  · intro hne
    by_cases hq : q ∈ S
    · by_contra hcontra
      rw [Finset.not_nonempty_iff_eq_empty] at hcontra
      apply hne
      apply Finset.Subset.antisymm
      · intro x hx
        by_contra hxq
        have hxq' : x ≠ q := fun h => hxq (Finset.mem_singleton.mpr h)
        have hxe : x ∈ S.erase q := Finset.mem_erase.mpr ⟨hxq', hx⟩
        rw [hcontra] at hxe
        exact absurd hxe (Finset.notMem_empty x)
      · intro x hx
        rw [Finset.mem_singleton] at hx
        rw [hx]; exact hq
    · rw [Finset.erase_eq_of_notMem hq]
      exact hS

/-- **`Delete`'s exact domain (`R23-C1-DELETE-DOMAIN`, LC-5, formalized).**
    For `A ∈ C_p(v)` and `q ∈ A`: `A.erase q` is a valid `Delete`-target
    (lands in `C_{p-1}(v)`, i.e. `Delete(q)` is DEFINED at `(v,A)`) if and
    only if removing `q` does not destroy activity, i.e. iff `A ∩ W_v` is
    not the single point `{q}`. Combined with `erase_mem_IndOn_pred`
    (well-typedness is free), this shows the ONLY way `Delete(q)` can fail
    to be defined is exactly this one activity condition — `Delete`'s
    domain is EXACTLY as `SEMANTIC-CONTRACT.md` §3 states, no more, no
    less. -/
theorem delete_domain_exact {p : ℕ} {v : Fin n} {A : Finset (Fin n)}
    (hA : A ∈ G.C v p) {q : Fin n} (hq : q ∈ A) :
    A.erase q ∈ G.C v (p - 1) ↔ A ∩ G.W v ≠ {q} := by
  obtain ⟨hAInd, hact⟩ := Finset.mem_filter.mp hA
  have herase_ind : A.erase q ∈ G.IndOn (G.Hcarrier v) (p - 1) :=
    G.erase_mem_IndOn_pred hAInd hq
  have herase_inter : A.erase q ∩ G.W v = (A ∩ G.W v).erase q := by
    ext x
    simp only [Finset.mem_inter, Finset.mem_erase]
    tauto
  unfold C
  rw [Finset.mem_filter]
  rw [herase_inter]
  exact ⟨fun h => (erase_nonempty_iff_ne_singleton hact).mp h.2,
         fun h => ⟨herase_ind, (erase_nonempty_iff_ne_singleton hact).mpr h⟩⟩

/-- **(C3-T2 merge glue.)** The `SimpleGraph (Fin n)` view of this
    encoding's adjacency: `Adj` is literally `G.Adj` (definitionally equal),
    symmetry is `G.symm`, looplessness is `G.irrefl`. Exists ONLY so the
    canonical LC-4 (`ErdosR23C2T3.lc4_retag_domain`, stated over an
    arbitrary `SimpleGraph`) can be cited from this encoding — replacing
    C2-T1's deleted `local_L1` per that file's own recommendation to C3.
    This is a view, not a second encoding: no downstream definition is
    restated over it. -/
def toSimpleGraph : SimpleGraph (Fin n) where
  Adj := fun u v => G.Adj u v
  symm := by constructor; intro u v h; exact G.symm u v h
  loopless := by constructor; intro u h; exact G.irrefl u h

/-- **Lemma L1 at this encoding, via the canonical LC-4 (C3-T2).** `A`
    independent, `w ∈ A`, `w` a leaf `⇒ support w ∉ A`. The body is now a
    citation of `ErdosR23C2T3.lc4_retag_domain` (C2-T3's canonical, citable
    Lean formalization of Lemma L1 — `R23-C2-04`), applied through
    `toSimpleGraph`; C2-T1's local reproduction (`local_L1`) is deleted so
    the argument is not maintained twice. -/
theorem support_notMem_of_isLeaf {A : Finset (Fin n)}
    (hA : G.IsIndependent A) {w : Fin n}
    (hwA : w ∈ A) (hlw : G.IsLeaf w) : G.support w ∉ A := by
  have hmem := G.support_mem_nbrs_of_isLeaf hlw
  unfold nbrs at hmem
  have hadj : G.toSimpleGraph.Adj w (G.support w) :=
    (Finset.mem_filter.mp hmem).2
  exact ErdosR23C2T3.lc4_retag_domain G.toSimpleGraph
    (fun x hx y hy => hA x hx y hy) hwA hadj

/-- **`Retag`'s totality on its exact domain (`R23-C1-RETAG-DOMAIN`, LC-4,
    formalized).** For `A ∈ C_p(v)` and `w ∈ F_p(T) ∩ A`: `A.erase w` is
    ALWAYS an independent `(p-1)`-subset of `H_w`'s carrier — no side
    condition beyond `w` being a favorable leaf in `A` is needed, because
    Lemma L1 (`support_notMem_of_isLeaf`, citing the canonical LC-4 since
    the C3-T2 merge) guarantees `support w ∉ A` automatically, which is
    exactly what keeps `A.erase w` inside `Hcarrier w = univ \ {w, support
    w}`. This is the "totality of Retag on its stated domain" clause: the
    ONLY way `Retag(w)` can still fail to land in `C_{p-1}(w)` is the
    activity condition `A.erase w ∩ W_w ≠ ∅` — never a well-typedness
    failure. -/
theorem retag_erase_mem_IndOn_pred {p : ℕ} {v : Fin n} {A : Finset (Fin n)}
    (hA : A ∈ G.C v p) {w : Fin n} (hlw : G.IsLeaf w) (hwA : w ∈ A) :
    A.erase w ∈ G.IndOn (G.Hcarrier w) (p - 1) := by
  obtain ⟨hAInd, _⟩ := Finset.mem_filter.mp hA
  obtain ⟨_, hcard, hindep⟩ := (G.mem_IndOn_iff).mp hAInd
  have hL1 : G.support w ∉ A := G.support_notMem_of_isLeaf hindep hwA hlw
  refine (G.mem_IndOn_iff).mpr ⟨?_, ?_, ?_⟩
  · intro x hx
    rw [Finset.mem_erase] at hx
    obtain ⟨hxw, hxA⟩ := hx
    have hxsw : x ≠ G.support w := fun h => hL1 (h ▸ hxA)
    unfold Hcarrier
    rw [Finset.mem_sdiff]
    refine ⟨Finset.mem_univ x, ?_⟩
    rw [Finset.mem_insert, Finset.mem_singleton]
    exact fun h => h.elim hxw hxsw
  · rw [Finset.card_erase_of_mem hwA, hcard]
  · exact G.isIndependent_mono hindep (Finset.erase_subset w A)

/-! ## New ingredient lemmas for the UPGRADED clause (3) and the P-membership
    discharge (C4-T4; charge: `control/CYCLE4-ALLOCATION.md` "C4-T4", the
    residual item 4 = C3-F2's F2-7 (i)/(ii)). A1.3 stays CLOSED: nothing here
    re-opens the Retag domain reading or simplicity; the demand was only that
    the closed facts appear as discharged Lean clauses. (Folded into the
    GRAND MERGE by C4-T1 from the sealed C4-T4 return, statement-verbatim.) -/

/-- The tag is never in its own `W`: `W_w = N(s_w) \ {w}` erases `w`. -/
theorem self_notMem_W (w : Fin n) : w ∉ G.W w := by
  unfold W
  exact Finset.notMem_erase w _

/-- **Erase-invariance of Retag activity.** Erasing `w` from `A` cannot
    change the intersection with `W_w`, because `w ∉ W_w`
    (`self_notMem_W`). So the activity condition may be read on `A` itself
    or on the Retag target `A \ {w}` — extensionally the same condition. -/
theorem erase_inter_W_self {A : Finset (Fin n)} (w : Fin n) :
    (A.erase w) ∩ G.W w = A ∩ G.W w := by
  ext x
  simp only [Finset.mem_inter, Finset.mem_erase]
  constructor
  · rintro ⟨⟨_, hxA⟩, hxW⟩
    exact ⟨hxA, hxW⟩
  · rintro ⟨hxA, hxW⟩
    refine ⟨⟨?_, hxA⟩, hxW⟩
    rintro rfl
    exact G.self_notMem_W x hxW

/-- **`Retag`'s exact domain (C4-T4; residual item 4, F2-7 (i)).** For
    `A ∈ C_p(v)` and `w` a leaf with `w ∈ A`: the Retag target `A.erase w`
    lies in `C_{p-1}(w)` — i.e. `Retag(w)` is DEFINED at `(v,A)` — if and
    only if the activity condition `(A \ {w}) ∩ W_w ≠ ∅` holds. The
    well-typedness half (`retag_erase_mem_IndOn_pred`, via Lemma L1) is
    unconditional, so activity is the WHOLE domain condition: `Retag`'s
    domain is EXACTLY as `SEMANTIC-CONTRACT.md` §3 states, no more, no
    less — the Retag mirror of `delete_domain_exact`, closing the
    clause-(2)/(3) parity gap C3-F2 recorded. -/
theorem retag_domain_exact {p : ℕ} {v : Fin n} {A : Finset (Fin n)}
    (hA : A ∈ G.C v p) {w : Fin n} (hlw : G.IsLeaf w) (hwA : w ∈ A) :
    A.erase w ∈ G.C w (p - 1) ↔ ((A.erase w) ∩ G.W w).Nonempty := by
  unfold C
  rw [Finset.mem_filter]
  exact ⟨fun h => h.2, fun h => ⟨G.retag_erase_mem_IndOn_pred hA hlw hwA, h⟩⟩

/-- `retag_domain_exact` in the `≠ ∅` phrasing (the literal C3-F2 F2-7 (i)
    form), via `Finset.nonempty_iff_ne_empty`. Same content. -/
theorem retag_domain_exact_ne_empty {p : ℕ} {v : Fin n} {A : Finset (Fin n)}
    (hA : A ∈ G.C v p) {w : Fin n} (hlw : G.IsLeaf w) (hwA : w ∈ A) :
    A.erase w ∈ G.C w (p - 1) ↔ (A.erase w) ∩ G.W w ≠ ∅ := by
  rw [G.retag_domain_exact hA hlw hwA]
  exact Finset.nonempty_iff_ne_empty

/-- **The erase-invariant activity form**: `Retag(w)` is defined at `(v,A)`
    iff `A ∩ W_w ≠ ∅` — the source set `A` itself already decides
    definedness (by `erase_inter_W_self`; contrast `Delete`, where erasing
    `q` CAN destroy activity, whence its `≠ {q}` guard). -/
theorem retag_domain_exact_inter {p : ℕ} {v : Fin n} {A : Finset (Fin n)}
    (hA : A ∈ G.C v p) {w : Fin n} (hlw : G.IsLeaf w) (hwA : w ∈ A) :
    A.erase w ∈ G.C w (p - 1) ↔ (A ∩ G.W w).Nonempty := by
  rw [G.retag_domain_exact hA hlw hwA, G.erase_inter_W_self w]

/-- The support of the tag is never in the tag's active set:
    `A ⊆ Hcarrier v = univ \ {v, s_v}` forces `s_v ∉ A` (companion to
    `tag_not_mem_of_mem_C` below, same carrier argument, other excluded
    point). -/
theorem support_not_mem_of_mem_C {v : Fin n} {r : ℕ} {A : Finset (Fin n)}
    (hA : A ∈ G.C v r) : G.support v ∉ A := by
  intro hsA
  have hInd : A ∈ G.IndOn (G.Hcarrier v) r := (Finset.mem_filter.mp hA).1
  have hsub : A ⊆ G.Hcarrier v := ((G.mem_IndOn_iff).mp hInd).1
  have hs := hsub hsA
  unfold Hcarrier at hs
  rw [Finset.mem_sdiff] at hs
  exact hs.2 (Finset.mem_insert_of_mem (Finset.mem_singleton_self _))

/-! ## New ingredient lemmas for the COMPLETED `THM_R23_A` (C3-T3):
    the multiplicity/simplicity clause and `P`/`N` block-disjointness
    (`ADJ-T CR-T-2` and `D-1`, C2 gate; charge: `control/CYCLE3-ALLOCATION.md`
    "C3-T3 (LC-B)"). Each is independently re-derived here from the sealed
    `Relation.lean`/`Tree.lean` definitions — C2-T3's `lc6_simple` (abstract
    Finset scope, `LC4567.lean` in this merged project) and C2-T2's
    `card_P_eq_sum`/`card_N_eq_sum` (`Bridge.lean`) prove overlapping facts
    at their own scopes; both are present in this GRAND MERGE and the
    overlap is disclosed, not hidden (C4-T1 merge note: carried verbatim
    from C3-T3's sealed `Theorems.lean`). -/

/-- **The tag never lies in its own active set.** `A ∈ C_r(v)` forces
    `A ⊆ Hcarrier v = univ \ {v, s_v}`, hence `v ∉ A`. This is the
    by-construction discharge of `lc6_simple`'s `v ∉ A` hypothesis that
    `D-1` records ("discharged by construction in the actual relation but
    NOT discharged here" — discharged HERE now, at actual-relation scope). -/
theorem tag_not_mem_of_mem_C {v : Fin n} {r : ℕ} {A : Finset (Fin n)}
    (hA : A ∈ G.C v r) : v ∉ A := by
  intro hvA
  have hInd : A ∈ G.IndOn (G.Hcarrier v) r := (Finset.mem_filter.mp hA).1
  have hsub : A ⊆ G.Hcarrier v := ((G.mem_IndOn_iff).mp hInd).1
  have hv := hsub hvA
  unfold Hcarrier at hv
  rw [Finset.mem_sdiff] at hv
  exact hv.2 (Finset.mem_insert_self v _)

/-- **Cross-family simplicity at target level.** A `Delete`-target and a
    `Retag`-target out of the SAME source `(v, A)` are always distinct: the
    Delete-target keeps tag `v`, every Retag-target's tag `w` lies in `A`,
    and `v ∉ A` (`tag_not_mem_of_mem_C`). This is the cross-family
    "no shared target" content `ADJ-T D-1` notes was proved only by a critic
    instrument in C2, absent from the theorem. -/
theorem delete_retag_targets_distinct {r : ℕ} {v : Fin n} {A : Finset (Fin n)}
    (hA : A ∈ G.C v r) (q : Fin n) {w : Fin n} (hw : w ∈ A) :
    (v, A.erase q) ≠ (w, A.erase w) := by
  intro hEq
  have hvw : v = w := congrArg Prod.fst hEq
  exact G.tag_not_mem_of_mem_C hA (hvw ▸ hw)

/-- `P`-membership unpacked: `x ∈ P p` iff `x`'s tag is favorable and its
    active set lies in the tag's OWN block `C_p(x.1)`. So the tagged union
    is well-defined: every element of `P` names its unique block by its
    first coordinate — the membership half of `SEMANTIC-CONTRACT.md` §3's
    `⊔` being a genuine disjoint union. -/
theorem mem_P_iff {p : ℕ} {x : Fin n × Finset (Fin n)} :
    x ∈ G.P p ↔ x.1 ∈ G.Favorable p ∧ x.2 ∈ G.C x.1 p := by
  unfold P
  rw [Finset.mem_biUnion]
  constructor
  · rintro ⟨v, hv, hx⟩
    obtain ⟨A, hA, hxeq⟩ := Finset.mem_image.mp hx
    rw [← hxeq]
    exact ⟨hv, hA⟩
  · rintro ⟨h1, h2⟩
    exact ⟨x.1, h1, Finset.mem_image.mpr ⟨x.2, h2, rfl⟩⟩

/-- `N`-membership unpacked, same structure at rank `p - 1`. -/
theorem mem_N_iff {p : ℕ} {y : Fin n × Finset (Fin n)} :
    y ∈ G.N p ↔ y.1 ∈ G.Favorable p ∧ y.2 ∈ G.C y.1 (p - 1) := by
  unfold N
  rw [Finset.mem_biUnion]
  constructor
  · rintro ⟨v, hv, hy⟩
    obtain ⟨A, hA, hyeq⟩ := Finset.mem_image.mp hy
    rw [← hyeq]
    exact ⟨hv, hA⟩
  · rintro ⟨h1, h2⟩
    exact ⟨y.1, h1, Finset.mem_image.mpr ⟨y.2, h2, rfl⟩⟩

/-- Tagging by a fixed first coordinate is injective (pure `Prod` fact,
    honestly labeled as such). -/
theorem tag_pair_injective (v : Fin n) :
    Function.Injective (fun A : Finset (Fin n) => (v, A)) :=
  fun _ _ h => congrArg Prod.snd h

/-- **Cardinality of a tagged union**: blocks with distinct tags are
    pairwise disjoint (first coordinates differ), and tagging is injective
    within a block, so `|⊔_{v∈s} {v} × f(v)| = Σ_{v∈s} |f(v)|`. The counting
    half of §3's `⊔` disjointness. -/
theorem card_tagged_biUnion (s : Finset (Fin n))
    (f : Fin n → Finset (Finset (Fin n))) :
    (s.biUnion (fun v => (f v).image (fun A => (v, A)))).card
      = ∑ v ∈ s, (f v).card := by
  have hdisj : ∀ v ∈ s, ∀ w ∈ s, v ≠ w →
      Disjoint ((f v).image (fun A => (v, A)))
               ((f w).image (fun A => (w, A))) := by
    intro v _ w _ hvw
    refine Finset.disjoint_left.mpr (fun x hx1 hx2 => ?_)
    obtain ⟨A, _, hA⟩ := Finset.mem_image.mp hx1
    obtain ⟨B, _, hB⟩ := Finset.mem_image.mp hx2
    exact hvw (congrArg Prod.fst (hA.trans hB.symm))
  rw [Finset.card_biUnion hdisj]
  exact Finset.sum_congr rfl
    (fun v _ => Finset.card_image_of_injective _ (tag_pair_injective v))

/-- `|P p| = Σ_{v ∈ F_p} |C_p(v)|` — `P`'s block-disjointness, counted.
    (Named per CRIT-1's instrument to avoid colliding with C2-T2's
    `card_P_eq_sum` in `Bridge.lean` — in THIS merged project both are
    present; they are independent proofs of the same fact, and the
    name separation is what lets them coexist.) -/
theorem P_card_eq_sum (p : ℕ) :
    (G.P p).card = ∑ v ∈ G.Favorable p, (G.C v p).card := by
  unfold P
  exact card_tagged_biUnion (G.Favorable p) (fun v => G.C v p)

/-- `|N p| = Σ_{v ∈ F_p} |C_{p-1}(v)|` — `N`'s block-disjointness, counted. -/
theorem N_card_eq_sum (p : ℕ) :
    (G.N p).card = ∑ v ∈ G.Favorable p, (G.C v (p - 1)).card := by
  unfold N
  exact card_tagged_biUnion (G.Favorable p) (fun v => G.C v (p - 1))

/-- **Each `Delete` edge carries a unique label**: if `y.2` arises from
    `x.2` by erasing `q₁ ∈ x.2` and also by erasing `q₂ ∈ x.2`, then
    `q₁ = q₂`. With `DeleteEdge`'s `∃ q ∈ x.2, …` witness this says the
    witness is unique — the within-family "no multi-edge" content at EDGE
    level, not just at label level. -/
theorem deleteEdge_label_unique {x y : Fin n × Finset (Fin n)}
    {q₁ q₂ : Fin n} (h₁ : q₁ ∈ x.2) (he₁ : y.2 = x.2.erase q₁)
    (he₂ : y.2 = x.2.erase q₂) : q₁ = q₂ :=
  (Finset.erase_inj x.2 h₁).mp (he₁.symm.trans he₂)

/-- **`Delete` and `Retag` are mutually exclusive out of a `P`-source**: no
    target `y` is simultaneously a `Delete`-target and a `Retag`-target of
    the same `x ∈ P p`. A Delete-edge forces `y.1 = x.1`; a Retag-edge
    forces `y.1 ∈ x.2`; and `x.1 ∉ x.2` (`tag_not_mem_of_mem_C`, via
    `mem_P_iff`). Together with `deleteEdge_label_unique` and the
    `Prop`-valued encoding (a pair `(x,y)` either is or is not an edge —
    multi-edges are unrepresentable, a fidelity point CRIT-1 recorded),
    this completes the simplicity package `A1.3` names. -/
theorem deleteEdge_retagEdge_exclusive {p : ℕ} {x y : Fin n × Finset (Fin n)}
    (hx : x ∈ G.P p) : ¬ (G.DeleteEdge p x y ∧ G.RetagEdge p x y) := by
  rintro ⟨⟨hy1, _⟩, _, hy1mem, _, _⟩
  have hxC : x.2 ∈ G.C x.1 p := ((G.mem_P_iff).mp hx).2
  exact G.tag_not_mem_of_mem_C hxC (hy1 ▸ hy1mem)

/-- **The P-membership discharge (C4-T4; F2-7 (ii), the R23-C2-06 gap).**
    Every `(v, A) ∈ P p` satisfies `v ∉ A ∧ s_v ∉ A`, by construction
    (`A ⊆ Hcarrier v`). Named so that the merged project's `lc6_simple`-
    style hypotheses `hv : v ∉ A` are CONSUMED from `P`-membership rather
    than assumed (grand-merge seat's consumption site, C4-T1). Placed after
    the C3-T3 block because it consumes `mem_P_iff` and
    `tag_not_mem_of_mem_C`. -/
theorem mem_P_tag_support_not_mem {p : ℕ} {x : Fin n × Finset (Fin n)}
    (hx : x ∈ G.P p) : x.1 ∉ x.2 ∧ G.support x.1 ∉ x.2 := by
  have hC : x.2 ∈ G.C x.1 p := ((G.mem_P_iff).mp hx).2
  exact ⟨G.tag_not_mem_of_mem_C hC, G.support_not_mem_of_mem_C hC⟩

/-! ## `THM_R23_A`, re-stated (C2-T1), COMPLETED (C3-T3), clause (3)
    UPGRADED to the exact-domain biconditional (C4-T4; folded by C4-T1) -/

/-- **`THM-R23-A` (row construction), re-stated.** `SEMANTIC-CONTRACT.md`
    §5: for every finite tree `T` and rank `p ≥ x(T)+2`, the §3 data is
    well-defined; `Delete` and `Retag` are total on their EXACT stated
    domains; every edge lands in `N`; multiplicity statements are exact.
    Four real clauses, replacing the C1 declaration adjudicated VACUOUS
    (`ADJ-T CR-3`):

    1. **Well-definedness.** Every favorable leaf's `support` is genuinely
       its unique neighbor (`support_eq_of_isLeaf`) — not merely `support_
       mem_nbrs_of_isLeaf`'s weaker membership fact, which was the ENTIRE
       first conjunct of the old (vacuous) declaration.
    2. **`Delete` totality, exact domain.** For `(v,A) ∈ P p` and `q ∈ A`:
       `Delete(q)` is defined (`A.erase q ∈ C_{p-1}(v)`) IFF `A ∩ W_v ≠
       {q}` — an honest bidirectional domain characterization, not the old
       one-directional "an edge that exists lands in `N`" soundness clause.
    3. **`Retag` totality, exact domain (UPGRADED, C4-T4 — residual item 4,
       C3-F2 F2-7 (i)).** For `(v,A) ∈ P p` and `w ∈ F_p(T) ∩ A`:
       `Retag(w)` is defined (`A.erase w ∈ C_{p-1}(w)`) IFF the activity
       condition `(A.erase w) ∩ W_w ≠ ∅` holds (`retag_domain_exact`) —
       the honest bidirectional domain characterization at exact parity
       with clause (2), replacing the C2/C3 well-typedness-only clause
       (whose content, `retag_erase_mem_IndOn_pred` via Lemma L1, is the
       backward direction's engine and remains a named lemma). By
       `erase_inter_W_self` (`w ∉ W_w`), the condition is equivalently
       `A ∩ W_w ≠ ∅` (`retag_domain_exact_inter`): the source set already
       decides definedness — contrast `Delete`, where erasing `q` can
       destroy activity, whence clause (2)'s `≠ {q}` guard. (The C3-T2
       cosmetic repair of the old clause's garbled sentence is superseded
       with the clause itself; provenance noted, C4-T1.)
    4. **Multiplicity exact.** Both `Delete`'s and `Retag`'s edge-generating
       maps are INJECTIVE in their parameter (distinct `q`'s / distinct
       `w`'s from the same source give distinct targets) — the real
       "multiplicities are exact" content — together with the tagged-pair
       distinctness `SEMANTIC-CONTRACT.md` §2 requires ("leaves counted
       separately even when supports coincide"), retained from the old
       declaration's third conjunct because it IS part of the multiplicity
       package, just not the whole of it.

    Every edge landing in `N` (`delete_lands_in_N`, `retag_lands_in_N`,
    already proved) is included as clause 5 for completeness, since
    `SEMANTIC-CONTRACT.md` §5 lists it as part of THM-R23-A alongside
    totality, not as a separate theorem.

    **Honest scope note (a finding, not a defect).** The proof below uses
    NEITHER `hT` nor `hp` — all four clauses hold for every graph `G` and
    every `p : ℕ` whatsoever, exactly parallel to `THM_R23_B_bridge1`'s
    hypothesis-free ℤ form that ADJ-T commended (`CR-3` discussion). This is
    NOT a recurrence of the C1 vacuity defect: what makes a statement
    vacuous is trivial/tautological/already-proved-elsewhere CONTENT,
    which is exactly what clauses (2)-(4) here are not (they are genuine,
    previously-unassembled domain-exactness and injectivity facts) — a
    hypothesis being unnecessary for true content is a broadened-scope
    finding, not a vacuity. `hT`/`hp` are RETAINED as explicit parameters
    to match `SEMANTIC-CONTRACT.md` §5's literal "for every finite tree `T`
    and rank `p ≥ x(T)+2`" quantifier prefix; dropping them from the
    signature is a scope-broadening decision for a later gate to make
    explicitly, not this restatement's call.

    **COMPLETION (C3-T3, per `ADJ-T CR-T-2` and `D-1`; carried into this
    GRAND MERGE by C4-T1).** The C2 statement carried clauses (1), (2),
    (3), (4a), (4b), (4c), (5); `CR-T-2` ruled (4b)/(4c) hypothesis-free
    `Prod` tautologies (retained below, honestly labeled) and the charge
    item "multiplicity/simplicity" NOT discharged, and `D-1` placed the
    missing `P`/`N` block-disjointness squarely inside §5's "the data of
    §3 is well-defined". This completed statement folds both in:

    - **(4d)** the tag is never in its own active set (`v ∉ A` for
      `A ∈ C_p(v)`) — the by-construction discharge of `lc6_simple`'s
      `v ∉ A` hypothesis at actual-relation scope (`D-1`);
    - **(4e)** cross-family target distinctness out of one source
      (`delete_retag_targets_distinct`);
    - **(4f)** `Delete`/`Retag` mutual exclusivity out of `P`-sources
      (`deleteEdge_retagEdge_exclusive`);
    - **(4g)** per-edge `Delete`-label uniqueness
      (`deleteEdge_label_unique`);
    - **(6)** `P`/`N` membership characterization (`mem_P_iff`/`mem_N_iff`):
      the `⊔` is a genuine tagged disjoint union;
    - **(7)** the block-disjointness cardinalities
      `|P| = Σ_v |C_p(v)|` and `|N| = Σ_v |C_{p-1}(v)|`
      (`P_card_eq_sum`/`N_card_eq_sum`).

    In this `Prop`-valued edge encoding a pair `(x,y)` either is or is not
    an edge, so multi-edges are unrepresentable BY TYPE (CRIT-1's fidelity
    point, now stated in the artifact itself); (4d)-(4g) are the
    non-trivial simplicity content that survives that observation: label
    uniqueness, family exclusivity, target distinctness.

    **UPGRADE (C4-T4, residual item 4 of the C3 gate; folded by C4-T1).**
    Clause (3) is upgraded from well-typedness-only to the exact-domain
    biconditional (see the clause-3 text above); the accompanying
    P-membership discharge `mem_P_tag_support_not_mem` (C3-F2 F2-7 (ii),
    the R23-C2-06 gap) is a named lemma, not a new conjunct — clause (4d)
    already carries `v ∉ A` inside this statement, and the 13-conjunct
    registered shape (R23B-C3-T3-01) is otherwise preserved. A1.3 stays
    CLOSED: nothing here re-opens the Retag domain reading.

    Scope fidelity [A1.1]: every clause is about THIS ordinary-tree
    groundwork encoding; any actual-tree reading carries the unproved
    RTree-transfer premise of `SEMANTIC-CONTRACT.md` AMENDMENT A1.1
    (erratum A2.3). -/
theorem THM_R23_A (_hT : G.IsTree) (p : ℕ) (_hp : p ≥ G.xOf + 2) :
    -- (1) well-definedness
    (∀ v ∈ G.Favorable p, G.nbrs v = {G.support v}) ∧
    -- (2) Delete totality, exact domain
    (∀ v ∈ G.Favorable p, ∀ A ∈ G.C v p, ∀ q ∈ A,
        A.erase q ∈ G.C v (p - 1) ↔ A ∩ G.W v ≠ {q}) ∧
    -- (3) UPGRADED (C4-T4): Retag totality, exact domain — Retag(w) is
    --     defined at (v,A) IFF the activity condition holds
    (∀ v ∈ G.Favorable p, ∀ A ∈ G.C v p, ∀ w ∈ G.Favorable p ∩ A,
        A.erase w ∈ G.C w (p - 1) ↔ ((A.erase w) ∩ G.W w).Nonempty) ∧
    -- (4a) Delete multiplicity: injective in q
    (∀ v ∈ G.Favorable p, ∀ A ∈ G.C v p, ∀ q₁ ∈ A, ∀ q₂ ∈ A,
        A.erase q₁ = A.erase q₂ → q₁ = q₂) ∧
    -- (4b) Retag multiplicity: injective in w (targets differ by first coord)
    (∀ v ∈ G.Favorable p, ∀ w₁ ∈ G.Favorable p, ∀ w₂ ∈ G.Favorable p,
        ∀ A : Finset (Fin n), w₁ ∈ A → w₂ ∈ A →
        (w₁, A.erase w₁) = (w₂, A.erase w₂) → w₁ = w₂) ∧
    -- (4c) tagged-pair distinctness (leaves counted separately)
    (∀ v ∈ G.Favorable p, ∀ w ∈ G.Favorable p, ∀ A : Finset (Fin n),
        v ≠ w → (v, A) ≠ (w, A)) ∧
    -- (4d) NEW (C3-T3): the tag is never in its own active set
    (∀ v ∈ G.Favorable p, ∀ A ∈ G.C v p, v ∉ A) ∧
    -- (4e) NEW (C3-T3): cross-family target distinctness out of one source
    (∀ v ∈ G.Favorable p, ∀ A ∈ G.C v p, ∀ q : Fin n, ∀ w ∈ A,
        (v, A.erase q) ≠ (w, A.erase w)) ∧
    -- (4f) NEW (C3-T3): Delete/Retag mutual exclusivity out of P-sources
    (∀ x ∈ G.P p, ∀ y : Fin n × Finset (Fin n),
        ¬ (G.DeleteEdge p x y ∧ G.RetagEdge p x y)) ∧
    -- (4g) NEW (C3-T3): each Delete edge's label is unique
    (∀ x ∈ G.P p, ∀ y : Fin n × Finset (Fin n), ∀ q₁ ∈ x.2, ∀ q₂ ∈ x.2,
        y.2 = x.2.erase q₁ → y.2 = x.2.erase q₂ → q₁ = q₂) ∧
    -- (5) every edge lands in N
    (∀ x ∈ G.P p, ∀ y : Fin n × Finset (Fin n),
        G.DeleteEdge p x y ∨ G.RetagEdge p x y → y ∈ G.N p) ∧
    -- (6) NEW (C3-T3): P/N block structure exact (the ⊔ is well-defined)
    ((∀ x : Fin n × Finset (Fin n),
        x ∈ G.P p ↔ x.1 ∈ G.Favorable p ∧ x.2 ∈ G.C x.1 p) ∧
     (∀ y : Fin n × Finset (Fin n),
        y ∈ G.N p ↔ y.1 ∈ G.Favorable p ∧ y.2 ∈ G.C y.1 (p - 1))) ∧
    -- (7) NEW (C3-T3): block-disjointness cardinalities
    ((G.P p).card = ∑ v ∈ G.Favorable p, (G.C v p).card ∧
     (G.N p).card = ∑ v ∈ G.Favorable p, (G.C v (p - 1)).card) := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro v hv
    exact G.support_eq_of_isLeaf (Finset.mem_filter.mp hv).2.1
  · intro v _ A hA q hq
    exact G.delete_domain_exact hA hq
  · intro v _ A hA w hw
    obtain ⟨hwFav, hwA⟩ := Finset.mem_inter.mp hw
    exact G.retag_domain_exact hA (Finset.mem_filter.mp hwFav).2.1 hwA
  · intro v _ A _ q₁ hq₁ q₂ _ hEq
    exact (Finset.erase_inj A hq₁).mp hEq
  · intro v _ w₁ _ w₂ _ A _ _ hEq
    exact congrArg Prod.fst hEq
  · intro v _ w _ A hne hcontra
    exact hne (congrArg Prod.fst hcontra)
  · intro v _ A hA
    exact G.tag_not_mem_of_mem_C hA
  · intro v _ A hA q w hw
    exact G.delete_retag_targets_distinct hA q hw
  · intro x hx y
    exact G.deleteEdge_retagEdge_exclusive hx
  · intro x _ y q₁ hq₁ q₂ _ he₁ he₂
    exact deleteEdge_label_unique hq₁ he₁ he₂
  · intro x hx y hxy
    rcases hxy with hd | hr
    · exact G.delete_lands_in_N p hx hd
    · exact G.retag_lands_in_N p hx hr
  · exact ⟨fun x => G.mem_P_iff, fun y => G.mem_N_iff⟩
  · exact ⟨G.P_card_eq_sum p, G.N_card_eq_sum p⟩

/-- `THM-R23-B` BRIDGE-1 (`SEMANTIC-CONTRACT.md` §4/§5): the exact
    cardinality identity `|C_r(v)| = i_r(H_v) - i_r(T - N[s_v])`, statement
    unchanged from C1. **PROVED since the C3-T2 merge** by citing C2-T2's
    sealed `bridge1_proof` (`Bridge.lean`; C2-LEDGER `R23-C2-01`, LC-1).
    Scope, per that row: the C1-T6 `Graph`/`Fin n` encoding; no hypotheses
    (every finite simple graph, every `v`, every `r`). Identification with
    `SEMANTIC-CONTRACT.md` §4 BRIDGE-1 on ordinary trees is NOT included —
    it needs `support v = s_v`, `xOf = x(T)`, and carries the A1.1
    RTree-transfer premise (C3-T1's charge, LC-A). -/
theorem THM_R23_B_bridge1 (v : Fin n) (r : ℕ) :
    ((G.C v r).card : ℤ)
      = (G.iOn (G.Hcarrier v) r : ℤ) - (G.iOn (G.removedClosedNbhdCarrier v) r : ℤ) :=
  G.bridge1_proof v r

/-- `THM-R23-B` BRIDGE-2: `|P| - |N| = S(T,p)`, statement unchanged from C1
    (with C2-T1's LC-11-repaired `IsTree`, which now carries `0 < n`).
    **PROVED since the C3-T2 merge** by citing C2-T2's sealed
    `bridge2_proof` (`Bridge.lean`; C2-LEDGER `R23-C2-02`, LC-2). The tree
    hypothesis is UNUSED by the proof (bound `_hT`, per the C1-registered
    "BROADENED beyond the contract" scope — only `hp`'s `p ≥ 1` consequence
    is load-bearing); it is retained
    in the signature to match the contract's quantifier prefix, and
    strengthening `IsTree` cannot un-prove an `hT`-unused theorem. Same
    C1-T6-encoding scope qualification as BRIDGE-1 ([A1.1] for any
    actual-tree reading). -/
theorem THM_R23_B_bridge2 (_hT : G.IsTree) (p : ℕ) (hp : p ≥ G.xOf + 2) :
    ((G.P p).card : ℤ) - ((G.N p).card : ℤ) = G.S p :=
  G.bridge2_proof p hp

/-- Hall's subset condition on the literal relation `(P, N, Delete ∪ Retag)`,
    `E993-R19-FIXED-GAMMA-HALL` / `SEMANTIC-CONTRACT.md` §3-§4.

    **AMENDMENT A2.2 fence (C3-T2 note).** The universal claim "this
    condition holds on every governed row" at literal ordinary-tree scope
    is REFUTED (order-91 T22, `p = 34`, the no-branch-center cut) and is a
    DEAD BRANCH: no r23 seat re-opens it or hands it onward as live. This
    `def` is retained solely because retained-live statements still refer
    to the condition (r19 Thm 3.1 at `2p ≥ n`; F1-EXT-1 at `2p ≥ n−1`;
    THM-R23-C as a CONDITIONAL — C3-T6's charge, which prefers an explicit
    injection with no subset-quantified hypothesis). A definition asserts
    nothing. -/
def HallCondition (p : ℕ) : Prop :=
  ∀ X ⊆ G.P p, X.card ≤ (X.biUnion (fun x => G.outEdges p x)).card

/-! **`THM_R23_C` intentionally ABSENT from this merged project (C3-T2).**
    The C1 statement-only declaration (`sorry`) is not carried: this
    artifact is chartered sorry-free (LC-1/LC-2/LC-3 TOGETHER, single
    axioms printout, `sorry` = inventory never a result), and proving the
    conditional is C3-T6's charge (LC-G), not the merge's. Its retained-live
    conditional content is `R23-C2-09` (proved_informal): all-cut Hall ⇒
    injection ⇒ `|P| ≤ |N|` ⇒ `S(T,p) ≤ 0`, conditional on the (refuted at
    literal universal scope, A2.2) all-cut hypothesis and BRIDGE-2 only. -/

end Graph
end R23
