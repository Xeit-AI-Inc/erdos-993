# C3 first-shell flat intake — proposal to controller

**Status:** `proposed_worker_only`. The brief and all 17 listed source files matched their SHA-256 pins. I read only those files and this scratch. I did not run Lean, modify an old source, register a theorem, or assign a status. The exact later target remains subject to C3 synthesis.

## Deliverable and source extraction

[`MANIFEST.json`](MANIFEST.json) lists **each of 182 retained declarations** with its source marker number, fully qualified name, marker SHA-256, independently recomputed SHA-256 of the exact fragment bytes, zero-based byte offsets, and dependencies. The fragment convention is the byte range immediately after the `BEGIN` marker newline through immediately before the `END` marker. Every recomputed fragment digest equals its source marker digest. The G1 dependency field uses the full retained source-order prefix as a conservative closure; its detected name references help a later producer reduce that prefix but are not a proof of a smaller closure. The C2/interior/r25 direct lists name the dependencies used in the selected extraction, plus Mathlib.

The proposed single flat order is:

1. [`G1-PREFIX-132.lean.fragment`](G1-PREFIX-132.lean.fragment): original G1 entries 1–132, including `Erdos993G1.firstWide_nonpos_of_two_edges` (entry 132), stopping before its unrelated sign/history and terminal entries 133–136. Retaining the whole prefix preserves its cross-entry namespaces and variables and is the practical safe selection from this long source. Its first line is `import Mathlib`.
2. [`C2-SELECTED.lean.fragment`](C2-SELECTED.lean.fragment): C2 entries 1–8, 13–15, 17–25, 28, 32–36, 38–41. This includes the **already proved** relative marked bound `E993OrderBand.marked_bound_below_even` (28), original support and retained-order facts, `tagged_count_split`, `tagged_marks_sdiff`, and `leaf_count_split`. The chosen declarations are closed under their C2 references; `IsolateCoveredOn`, the older larger-band route, and its terminal are not needed. No C2 `universe u` entry is included, avoiding a duplicate global universe declaration.
3. [`INTERIOR-SELECTED.lean.fragment`](INTERIOR-SELECTED.lean.fragment): only first-interior entries 1–3, 6–7, 13–14. These add exact vertex-deletion favorability, original leaf set and degree, aggregate, and crossing index. The seven shared C4/C5/count definitions and `E993Interior.taggedFamily` come from C2 instead.
4. [`R25-SELECTED.lean.fragment`](R25-SELECTED.lean.fragment): r25 entries 16–19, 22, 40–43, 45–48. These give cover fibers/partition/sum bound, empty-cover availability, binomial monotonicity and the shifted Catalan floor. Entry 44 is a stronger-premise convenience version of 43 and is unnecessary. Entries 23–24 and 49–52 concern card-five work or its terminal and are not shell dependencies. The r25 fragment opens `Erdos993G1.ThirdWide`; it needs the final `end Erdos993G1.ThirdWide` scaffold.

[`FLAT-PREFIX-PROPOSAL.lean.fragment`](FLAT-PREFIX-PROPOSAL.lean.fragment) concatenates those exact blocks in that order, adds only the namespace close, and has sole import `Mathlib`. It is a **reviewable extraction proposal**, not a compiling or verified module. Its SHA-256 is `95bf9f7502e0208a87692a0a01cb550a3513863ba9c53d68ad894ff8523c23e5`. The later producer must register/compile this assembly, then add the new proof declarations and terminal under the governed workflow.

### Collision reconciliation

The eight C2/interior overlaps (`C4LA1.IsGraphLeaf`; `C5LA1.support`, `H`, `R`, `indepSetsAvoiding`, `indepSetCount`, `forwardDifferenceDel`; `E993Interior.taggedFamily`) have **byte-identical fragments and identical marker digests**. Keep C2, omit their interior copies. `MANIFEST.json` records each pair and both hashes.

All 14 G1/r25 colliding fully qualified names are omitted from r25. Their normalized declaration text matches exactly after whitespace and optional namespace qualification of the declaration name are removed: `Erdos993G1.indepCount`, `coeff`, `delta`, `indepCount_eq_card_indepSetFinset`, `coeff_nat`, `delta_nat`, `forest_card_edges_add_components`, `components_card_pos_of_card_pos`; and `Erdos993G1.FirstWide.binomCoeff`, `binomCoeff_nat`, `binomCoeff_neg`, `binomCoeff_nat_add_one`, `choose_step_strict`, `choose_step_nonpos`. The manifest includes the matching normalized-declaration hashes for exact inspection. Their *whole fragments* are not byte-identical because their namespace/proof scaffolding differs; the assembly calls the retained G1 declarations and does not assert definitional equality of separately imported duplicates.

The full interior source also shares 25 `Erdos993G1` names with G1. Interior entries 15–45 are **not extracted at all**; the manifest inventories those collisions. Thirteen have nonmatching normalized declaration text, so no equivalence is assumed for them. This is harmless for the selected C4/C5 prefix, whose proofs do not depend on those later interior entries. In particular, the high-tail `E993Interior.firstInteriorAggregate` is neither imported nor used.

## Proposed exact statements

Here is the stronger internal **pointwise** header. Its proof needs the new DAG below; it is not part of the inherited fragments.

```lean
namespace E993FirstShell

theorem originalLeafTermNonpos
    {V : Type*} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hTree : T.IsTree) (p : ℕ)
    (hEarly : C5LA1.crossingIndex T + 2 ≤ p)
    (hOrder : Fintype.card V = 2 * p + 2)
    (v : V) (hv : C4LA1.IsGraphLeaf T v) :
    C5LA1.forwardDifferenceDel T (C5LA1.H T v) (p - 1) -
      C5LA1.forwardDifferenceDel T (C5LA1.R T v) (p - 1) ≤ 0
```

The proposed **aggregate terminal header** keeps the registered strict alpha guard and exact selector:

```lean
theorem registeredFirstOrderShell
    {V : Type*} [Fintype V] [DecidableEq V]
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hTree : T.IsTree) (p : ℕ)
    (hEarly : C5LA1.crossingIndex T + 2 ≤ p)
    (hAlpha : 3 * p < 2 * T.indepNum + 1)
    (hOrder : Fintype.card V = 2 * p + 2) :
    C5LA1.aggregate T p ≤ 0

end E993FirstShell
```

**Exact informal statement.** For every finite ordinary tree `T`, natural `p`, first-negative coefficient rank `x(T)` with `x(T)+2≤p`, strict `3p<2α(T)+1`, and `|T|=2p+2`, sum over precisely the original leaves `v` whose original single-vertex deletion has `Δ_p(T-v)<0` the quantity `Δ_(p-1)(T-{v,s_v})−Δ_(p-1)(T-N_T[s_v])`. This sum is at most zero. Distinct original leaves with one support contribute separately; the empty selector contributes zero. The pointwise lemma proposes the same sign for **every** original leaf using only the tree, early-rank and order hypotheses. The terminal guard is retained even though this route does not use it internally. Natural `p-1` is justified after deriving `p≥3`.

## New implementation DAG, in proof order

1. **Relative-set and induced-graph bridges.** Work primarily with C2's `E993Interior.taggedFamily T U W j` where `U=Finset.univ\C5LA1.H T v` and `W=C5LA1.R T v\C5LA1.H T v`. C2 `leaf_count_split` identifies the term with `q_p-q_(p-1)` directly at natural ranks; `tagged_marks_sdiff` removes deleted marks. For the G1 theorem, prove a finite-subtype bijection between `T`-independent finsets within `U` and independent finsets of `T.induce (↑U : Set V)`, plus `Fintype.card`/`Nat.card` and edge-set cardinality bridges. Preserve the parent-graph deletion semantics; the induced subtype is only an auxiliary representation.
2. **Unmarked shadow below center.** New incidence lemma: if a finite graph `J` has `m≤2k-1` vertices and `k≥1`, then `i_k(J)≤i_(k-1)(J)`. Count deletions/extensions on independent sets, with `m<k-1` and all out-of-range ranks handled explicitly. The inequality `k i_k≤(m-k+1)i_(k-1)` must not be used with truncated natural arithmetic when `m<k-1`.
3. **One-mark split and A/B/C.** Prove the disjoint finite-set identity `q_j(G,W)=i_(j-1)(G-N[w])+q_j(G-w,W\{w})` for `w∈W`, using an integer zero extension or only the needed `j=k,k+1` with `k≥2`. **A** is already C2 entry 28 on arbitrary relative `U,W`: `|U|≤2k ⇒ q_(k+1)≤q_k` for `k≥1`; do not redo its incidence proof. **B** is new: `|G|≤2k+1`, `k≥2`, at least two edges, arbitrary `W`; use the split and A. The first residual has `≤2k-1` vertices unless `w` is isolated and its order is `2k`; in that exact case it keeps two edges and G1 entry 132 applies at `r=k-1`. **C** is new: `|G|=2k+2`, no cover of size at most two, and `W` contains a nonisolated `w`. In the `2k` residual case, `N[w]={w,z}` and a residual with at most one edge would let `z` plus one endpoint cover `G`; apply G1 entry 132. The graph `G-w` has at least two edges by the same cover contradiction, so B bounds the second split term. Empty `W` and missing-rank cases need explicit branches.
4. **Three-cover partition.** Use r25 entries 16–19 and 22 with a new cover-padding lemma (`|T|≥8` extends a cover of size `≤3` to exactly three). For each `0≤r≤p-2`, let `C` be this cover and `U=V\C`, `|U|=2p-1`. The empty fiber contributes `E(2p-1,r)`. For independent nonempty `X⊆C`, r25 entry 48 gives the lower bound `−Cat_(r-|X|)` with its explicit `if |X|≤r` guard; nonindependent fibers may be dropped via r25 entry 19 since their assigned negative floors are ≤0. Prove the new card-three powerset sum or a general cardinality grouping, obtaining

   `Δ_r(T) ≥ E(2p-1,r) − 3 Cat_(r-1) − 3 Cat_(r-2) − Cat_(r-3)`, with Catalan zero at negative indices.

   The endpoint `r-|X|=-1` has actual difference `1`; at `≤-2` it is `0`. These must not become `Cat_0` through natural subtraction. Use r25 entry 43 to replace `E(2p-1,r)` by at least `E(2r+3,r)`. At `r=0,1` the margin is exactly `2`. For `r≥2`, prove the denominator-cleared identity `(r+3)E(2r+3,r)=2(2r+3)Cat_(r+1)`, `Cat_(j+1)≥2Cat_j` for `j≥1`, and lower-index monotonicity; thus `E≥8Cat_(r-1)` while the subtractions total at most `7Cat_(r-1)`, giving a positive margin. These Catalan ratio/positivity lemmas are **new**; the prior r25 card-five terminal does not provide the three-cover bound.
5. **Early descent excludes a three-cover.** Prove `Δ_0(T)=|T|-1>0` from the exact C5 count, hence `crossingIndex T≥1` and eligibility implies `p≥3`. Use `Nat.find_spec` and minimality of `crossingIndex` to show that positivity at **every** `r≤p-2` contradicts `crossingIndex+2≤p`. Therefore no cover of `T` has size at most three. Positivity at only the last rank would be insufficient.
6. **Leaf transfer and terminal.** For an original leaf `v`, C2 entries 32–36 and 38 give support adjacency, `H⊆R`, `|H|=2`, and `|V\H|=2p`. Lift any size-≤2 cover of the retained graph by adding the original support; every deleted edge meets that support because `v` is a leaf. This contradicts step 5, so the retained graph has no size-≤2 cover and has an edge. Connectivity supplies a mark in `R\H` that is nonisolated **inside** the retained graph (follow a path from the support to an edge component). Apply C with `k=p-1≥2`. C2 entry 41 at ranks `p-1,p` rewrites the exact pointwise difference as `q_p-q_(p-1)≤0`. Unfold `C5LA1.aggregate` and use `Finset.sum_nonpos` over the original favorable filter. No hypothesis of a favorable leaf is introduced.

## Boundary and verification limits

The old G1 and r25 sources have prior verification evidence, and the C2 source is a newly closed order-band package, but no prior receipt transfers to this **new assembly**. I did not run Lean, and neither the flat prefix nor any new bridge, cover bound, pointwise theorem, or aggregate terminal has a new kernel or fidelity receipt. The producer should first compile the selected flat prefix to expose any namespace or implicit-variable issue, then add the DAG proofs, establish an exact theorem contract, run fresh kernel/no-extra-axiom verification, and obtain independent statement fidelity. This preparation does not prove the registered first shell, a wider order band, or the unrestricted lower-region inequality.
