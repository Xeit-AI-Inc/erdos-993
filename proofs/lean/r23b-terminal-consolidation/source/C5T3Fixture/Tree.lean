import C5T3Fixture.Graph

/-!
# Tree-level definitions: leaves, supports, `x(T)`, `a_v`, `F_p(T)`

Groundwork (C1-T6). All definitions here are TOTAL and computable so that
`decide`/`#eval` can exercise them on small fixtures, per the charge. Several
are deliberately loose "working" definitions (documented per-definition) that
are NOT yet proved equal to their intended mathematical meaning outside the
governing hypotheses — that equality is exactly THM-R23-A "well-definedness"
territory, stated with `sorry` in `Theorems.lean`, never assumed here.
-/

namespace R23C5T3Fixture
namespace Graph

variable {n : ℕ} (G : Graph n)

/-- Degree of `v` in `G`. -/
def degree (v : Fin n) : ℕ := (Finset.univ.filter (fun u => G.Adj v u)).card

/-- `v` is a (degree-one) leaf of `G`. Decidable. -/
def IsLeaf (v : Fin n) : Prop := G.degree v = 1

instance instDecidableIsLeaf (v : Fin n) : Decidable (G.IsLeaf v) := by
  unfold IsLeaf; infer_instance

/-- The neighbor-`Finset` of `v`. For a leaf this is a singleton. -/
def nbrs (v : Fin n) : Finset (Fin n) := Finset.univ.filter (fun u => G.Adj v u)

/-- `support v`: the WORKING total, computable stand-in for `s_v`, the
    unique neighbor of a leaf `v`. Defined as the least element of `nbrs v`
    under `Fin n`'s linear order when `nbrs v` is nonempty, else `v` itself
    (a sentinel; only ever consumed under an `IsLeaf` hypothesis in the
    statements below). Under `IsLeaf v`, `nbrs v` is a singleton `{s_v}` and
    `support v = s_v` exactly — this equality is `support_eq_of_isLeaf`
    in `Theorems.lean`, PROVED sorry-free there since C2-T1 (docstring
    repaired C3-T2: the inherited C1 text said "left `sorry`", which is no
    longer true in this merged project — synthesis §4 inherited-docstring
    item, ADJ-T CRIT-2 T-2). -/
def support (v : Fin n) : Fin n :=
  if h : (G.nbrs v).Nonempty then (G.nbrs v).min' h else v

/-- Closed neighborhood `N[s_v] = {s_v} ∪ N(s_v)`. -/
def closedNbhd (v : Fin n) : Finset (Fin n) := insert v (G.nbrs v)

/-- `W_v = N_T(s_v) \ {v}`, `SEMANTIC-CONTRACT.md` §3. -/
def W (v : Fin n) : Finset (Fin n) := (G.nbrs (G.support v)).erase v

/-- `H_v = T - {v, s_v}`, realized as the ambient carrier
    `Finset.univ \ {v, s_v}` fed to `IndOn` (no fresh `Graph` value needed —
    see `Graph.lean`'s module doc). -/
def Hcarrier (v : Fin n) : Finset (Fin n) :=
  Finset.univ \ {v, G.support v}

/-- `T - N[s_v]` carrier. -/
def removedClosedNbhdCarrier (v : Fin n) : Finset (Fin n) :=
  Finset.univ \ G.closedNbhd (G.support v)

/-- `a_v = Delta_p(T - v)`, `SEMANTIC-CONTRACT.md` §2. -/
def a (v : Fin n) (p : ℕ) : ℤ := G.DeltaOn (Finset.univ.erase v) p

/-- `b_v = Delta_{p-1}(H_v)`. -/
def b (v : Fin n) (p : ℕ) : ℤ := G.DeltaOn (G.Hcarrier v) (p - 1)

/-- `B_{s_v} = Delta_{p-1}(T - N[s_v])`. -/
def B (v : Fin n) (p : ℕ) : ℤ := G.DeltaOn (G.removedClosedNbhdCarrier v) (p - 1)

/-- `g_v = b_v - B_{s_v}`. -/
def g (v : Fin n) (p : ℕ) : ℤ := G.b v p - G.B v p

/-- `F_p(T) = {original leaves v : a_v < 0}`, `SEMANTIC-CONTRACT.md` §2.
    "Original" leaves means: leaves OF `G` itself, evaluated once (this
    definition does not re-derive leafhood inside any deleted subgraph),
    matching the contract's "ORIGINAL degree-one leaf" language. -/
def Favorable (p : ℕ) : Finset (Fin n) :=
  Finset.univ.filter (fun v => G.IsLeaf v ∧ G.a v p < 0)

instance instDecidableFavorableMem (p : ℕ) (v : Fin n) :
    Decidable (v ∈ G.Favorable p) := by
  unfold Favorable; infer_instance

/-- `S(T,p) = sum_{v in F_p(T)} g_v`, `SEMANTIC-CONTRACT.md` §2. Contract:
    "Leaves counted separately even when supports coincide" — automatic
    here since the sum ranges over the leaf `v`, never over `s_v`, and
    "empty favorable set ⇒ S = 0" — automatic since `Finset.sum` over `∅`
    is `0`. -/
def S (p : ℕ) : ℤ := ∑ v ∈ G.Favorable p, G.g v p

/-- `x(T)`: WORKING computable stand-in for "first `k ≥ 0` with
    `Delta_k(T) < 0`", searching only `k ∈ [0, n]`.

    **LC-11 repair (C2-T1).** The C1 docstring's justification was vacuous:
    it observed only `Delta_n(G) = 0 - i_n(G) ≤ 0` (a WEAK, non-strict
    descent) and then admitted the `i_n(G) = 0` case was "NOT proved here" —
    so as written it gave no actual reason the bounded search ever
    succeeds. The correct argument, independent of tree-ness and valid for
    every `n` including `n = 0`:

    Let `α = α(G)` be `G`'s independence number, i.e. the largest `r ≤ n`
    with `i_r(G) > 0` (`α` exists and `α ≤ n` since `i_0(G) = 1 > 0` and
    `Ind_r(G) = ∅` for `r > n`, so `{r ≤ n : i_r(G) > 0}` is a nonempty
    finite subset of `[0,n]`). By maximality of `α`, `i_{α+1}(G) = 0`
    (`α+1 ≤ n` is NOT assumed — if `α = n` then `i_{α+1}(G) = i_{n+1}(G) = 0`
    automatically, since no `(n+1)`-subset of an `n`-element carrier
    exists). Hence

        Delta_α(G) = i_{α+1}(G) - i_α(G) = 0 - i_α(G) = -i_α(G) < 0,

    STRICTLY (not merely `≤ 0`), because `i_α(G) ≥ 1` by definition of `α`
    (`α` is chosen so `i_α(G) > 0`). So a strict descent exists at `α ≤ n`
    for EVERY graph on `n` vertices, in particular the bounded search over
    `[0,n]` always finds one (indeed within `[0,α]`) and the `getD n`
    fallback is never actually reached. (At `n = 0`: `α = 0`, `i_0 = 1`,
    `Delta_0 = i_1 - i_0 = 0 - 1 = -1 < 0` — the strict descent exists even
    on the empty graph; the `n = 0` exclusion needed elsewhere in this
    project is `IsTree`'s job, in `Theorems.lean`, not `xOf`'s.)

    This existence argument is now REGISTERED as a Lean declaration in
    this project: `exists_first_descent` in `ActualTree.lean` (C3-T1
    lineage; C3-LEDGER `R23B-C3-T1-02`) proves exactly the strict-descent
    existence above, sorry-free, for every `G : Graph n` including
    `n = 0`, together with the full specification (`xOf_find?_isSome`,
    `xOf_spec`) and uniqueness (`eq_xOf_of_first_descent`). (Docstring
    history: the C2-T1 text cited a ghost declaration
    `xOf_strict_descent_exists` — struck at the C3-T2 merge per ADJ-T
    F-7(b), when no such declaration existed in the shipped tree; the C3
    gate then recorded the existence lemma as ORPHANED, `R23B-C3-T2-02` —
    T2 deferred it to C3-T4, which never mentioned it. C4-T1's GRAND MERGE
    discharges the orphan by carrying C3-T1's proof into this union and
    re-pointing this docstring at the real declaration.) `xOf` itself
    stays the WORKING computable stand-in defined here, with the
    correctness argument stated honestly rather than left as an
    unaddressed edge case. Falls back to `n` if the bounded search finds
    nothing (which `exists_first_descent` proves never happens). -/
def xOf : ℕ :=
  ((List.range (n + 1)).find? (fun k => decide (G.Delta k < 0))).getD n

end Graph
end R23C5T3Fixture
