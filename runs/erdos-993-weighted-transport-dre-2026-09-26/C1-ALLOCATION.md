# Cycle 1 Route Allocation — r30 (correctly weighted mixed-boundary transport for the remaining ordinary-tree favorable-leaf aggregate)

Controller: Claude Fable 5.1, 2026-09-26. Topology 6 routes / 12 critics / 3 adjudicators / 1 synthesis; routes Claude
Sonnet 5 xhigh, critics Claude Opus 5.5 medium, adjudicators/synthesis/Stage 7 Claude Opus 5.5 high (`AUTHORIZATION.md`).
The object: the OPEN mechanism key (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — a saturating integral flow of the
deletion / two-for-one network with the ACTIVE-TAG weight on every eligible `(T, p)` — to be proved (outcome A), advanced by
a parameter-uniform lemma (outcome B), or refuted by an exact deficient cut (outcome C); and the prerequisite identity
(WID). This is a research run, not an extraction run: the mathematics is open. The six routes are the charter's six research
directions.

| Seat | Route | Object |
|---|---|---|
| `T1` | `C1-T-01 WEIGHTED-SHADOW-NORMALIZED-MATCHING` | Weighted shadows, normalized matching and product-poset expansion: prove (HALL-COND) on structured sectors, starting with the corrected `CB(d, m)` root-plus-arm sector; a shadow-stability inequality charging deletion deficits to switch exits |
| `T2` | `C1-T-02 DEFICIT-BUDGET-AND-ROOTED-RECURRENCE` | The parallel scalar route: the budget `D + C ≥ (2α + 1 − 3p)Q` through matching deficiency and neighbourhood structure; rooted recurrences for `w_F`-weighted layer sums that retain the fixed selector and the active-tag witnesses; alternative direct compensation inequalities if Hall is stronger than necessary |
| `F1` | `C1-F-01 ADVERSARIAL-CUT-SEARCH` | Hunt for an exact deficient cut: exhaustive exact max-flow on every eligible tree to the largest attainable order; adversarial families (few usable switches, heavily overlapping images, many tags on few supports, `CB(d, m)` and generalizations) via exact orbit quotients with the lift theorem's converse |
| `F2` | `C1-F-02 FIDELITY-AND-MECHANISM-EQUIVALENCE` | Weight and relation fidelity as mathematics: the identity (WID), its proof and its failure modes (what `|F ∩ B|` measures instead); the two C6 errors reconstructed and corrected; mechanism-equivalence of (HALL) against the ten refuted keys; where (HALL) is stronger than the aggregate (unreachable positive-weight targets; the `X = I_{p+1}` cut) |
| `U1` | `C1-U-01 COMPRESSION-UNCROSSING-ORBIT-REDUCTION` | Structural reduction of arbitrary source families: supermodularity of the deficit, invariant maximizers (an `Aut(T)`-invariant deficient cut exists if any does), compression/uncrossing to canonical families, exact orbit quotients of `CB(d, m)` sectors with switch exits; a reduction theorem stated at exact scope |
| `U2` | `C1-U-02 LEAN-TRANSPORT-SKELETON` | Scratch project carrying entries 1–18 byte-identically; the `E993Transport` definitions of SOLUTION-CONTRACT §2 compiled; (WID), (FLOW⇒SIGN) and (HALL⇒FLOW) proved sorry-free if reachable; draft contracts for the WID award; the dependency diagram |

## Standing state entering Cycle 1

Master registry 434 identities (`sources/authority/`; `control/CLAIM-IDENTITY.run-local.json` 435 at Stage 2 — the master plus
(WID)); public `main` `0411905`. (HALL) is OPEN (`formal_award: false`; certificate "OPEN Cycle 3 intake …
`control/C3-INTAKE-RECONCILIATION.md`"; frozen under `sources/lower-region/records/`). The primary aggregate is OPEN. The
lower-region run (`sources/lower-region/records/REPORT.md`, `FINAL-ANALYSIS.md`, `RESEARCH-NOTEPAD.md`) records: formal coverage
`n ≤ 2p + 2`; the `T_m`, spider and path-star cutoff families settled at nonformal grades; the incidence identity
`kS = (2α + 1 − 3p)Q − D − C` at `proved_informal`; four mechanism refutations; the finite-group lift at `proved_informal`; the
corrected `CB(8, 92)` sector (weight one; `492/491`); the two corrected heterogeneous saturating flows; three saturating `T_m`
quotient flows. r29 (`sources/r29/records/`) closed the high tail. The controller's pre-run instrument
(`control/controller-prerun/wt_check.py`, `wt_report.json`) found the weight identity and saturating (deletion-only!) flows on
every eligible tree to order 14 — a prior, not evidence.

## Mechanism fingerprints and load-bearing obligations

1. **T1 `WEIGHTED-SHADOW-NORMALIZED-MATCHING`.** (a) The `CB(d, m)` root-plus-arm sector is a product of `dm` copies of the
   three-element pair poset `{∅ < b, ∅ < c}` (rank numbers `1, 2`; log-concave), truncated at the root/arm; establish (with
   proof, not citation) the normalized matching property of this product for the DELETION boundary (Harper/Hsieh–Kleitman
   product theorem or a direct LYM argument) and derive `|∂X| ≥ |X|·|R_490|/|R_491| = |X|·491/492` for every `X ⊆ R_491`; hence
   the deletion-only deficit of any `X` is at most `|X|/492`. (b) The SWITCH boundary: for `B` in the sector, a choke `u_i` is
   insertable iff branch `i` has exactly one support in `B` (its other neighbour `r` is present); the image
   `A = B ∖ {r, b_{ij}} ∪ {u_i}` has weight = the number of leaves of branch `i` present in `B` (each private tag in branch `i`
   becomes active through `u_i`; the arm tag `v` becomes inactive because `r` is gone). Derive the exact switch-image weight
   distribution over the sector and over arbitrary `X`; find a quantitative inequality "deletion deficit of `X` ≤ switch
   capacity newly reachable from `X`" that holds for EVERY `X ⊆ R_491` (the hard requirement: overlap between deletion and
   switch images and competition from sources outside `X`); if only a sector-level or a family-level statement is provable,
   state exactly which. (c) Generalize: which structural features of a tree (pendant support-leaf pairs behind a "choke")
   make the pair-poset expansion work; a candidate parameter-uniform lemma (outcome B) at exact scope. (d) Fixed points
   BEFORE any table: `K_{1,12}` at `p = 8` (supply 1980, capacity 3960, no switches); the sector ratio `492/491`. (e) Name
   every registered claim touched (the deletion-only refuted key `E993-R23-LITERAL-DELETE-ONLY-HALL` is DIFFERENT: no active
   weight, no switches — say why your shadow statements are not it).
2. **T2 `DEFICIT-BUDGET-AND-ROOTED-RECURRENCE`.** (a) From the frozen C6-T4/C6-U4 identities: for each tag `v` and marked
   `k`-set `A ⊆ H_v` (`k = p − 1`), `d_v(A) = 2(h − k) − e_v(A) = (n_v − 2ν_v) + |N_{H_v}(A)| − k ≥ 0` with `h = α − 1`; `C` counts
   multiply-witnessed upper sets once per tag; the target is `D + C ≥ (2α + 1 − 3p)Q`. Re-derive both identities from the
   definitions (prove, do not cite) and identify what structural quantity would give the budget: e.g. a lower bound on the
   average neighbourhood size `|N_{H_v}(A)|` of marked `k`-sets in terms of `x`, `p`, `α` (the early-rank premise `CT_x` is a
   registered OPEN key `E993-LOWER-REGION-EARLY-MARKED-OCCUPANCY-TRANSFER` — do not claim it; test whether the budget follows
   from a WEAKER, provable statement). (b) Rooted recurrence: root `T` at a support or a branch vertex; express `Σ_{B ∈ I_j}
   w_F(B)` through subtree polynomials with the active-tag witness tracked (a tag is active iff a designated neighbour of its
   support is chosen); derive `S = Q_p − Q_{p−1}` (C6-U6) and a recurrence for `Q_j` in which the fixed selector `F_p` appears
   only through which leaves are tagged; look for a monotonicity/log-concavity property of `j ↦ Q_j` on the eligible window
   that would give `Q_p ≤ Q_{p−1}` directly (an alternative compensation inequality). (c) Check every candidate inequality on
   the fixed points and on the controller's eligible rows (replay, own instrument) and on `T_22` at `p = 34` (`Q`, `C`, `D`
   values recorded in C6-AT; `D + C − 35Q = −33S`). (d) State exactly which of (HALL), the budget, and `Q_p ≤ Q_{p−1}` is
   stronger than which (with proofs of the implications). (e) Fences: the four refuted covariance/injectivity/domination
   mechanisms are not revived; the `T_m` family theorem is not re-proved.
3. **F1 `ADVERSARIAL-CUT-SEARCH`.** (a) Your OWN instrument (do not copy the controller's `wt_check.py`; read it only to
   reconcile at the end): free trees up to isomorphism (canonical form; A000055 reconciled), `x` through rank `α`, eligibility,
   `F_p` from `Δ_p(T − v)` on the original tree, `w_F` literal, (D) ∪ (S) literal, exact integer max-flow; assert
   `supply − capacity = S` on every instance; report attained horizons. Exhaust every eligible `(T, p)` to the largest order
   you can (orders 15–17 are within reach with bitmask enumeration and a fast flow; the count of eligible rows per order is a
   deliverable), separately for the mixed relation and for deletion-only. (b) Adversarial families where switches are scarce
   or images overlap: `CB(d, m)` for small `(d, m)` with eligible ranks (find the smallest eligible `CB`), generalized chokes
   (branches of pairs behind a vertex of degree ≥ 3), many tags sharing few supports (the C6-F4 configuration), caterpillars
   with pendant pairs, double brooms; for each, either a full exact flow or an exact orbit-quotient flow (your own quotient
   builder; validate it against brute force on small members as the predecessor's `smoke.py` did) — a QUOTIENT deficit proves
   an original deficient cut exists (the lift's converse; prove the converse on your face), and then EXHIBIT the invariant cut.
   (c) For any candidate (CUT): the full record of SEMANTIC-CONTRACT §1.2 (graph, `p`, `F`, weights, relation, `X`, `N(X)`, both
   sums), a second independent computation path (brute force vs quotient), and the statement that the complete `S` stays
   negative (mechanism ≠ aggregate). (d) Reconcile with the controller's prior at the end (515 eligible rows to order 14; all
   saturate).
4. **F2 `FIDELITY-AND-MECHANISM-EQUIVALENCE`.** (a) Prove (WID) at statement level from the definitions (the bijection
   `B ↦ B ∖ {v}`); state the general-`F` form and the `F = F_p` specialization; prove (FLOW⇒SIGN) and (HALL⇒FLOW) informally
   (capacitated Hall via clone expansion or max-flow/min-cut); identify exactly what `|F ∩ B|`-counting measures instead
   (`Σ_{B} |F ∩ B| − Σ_A |F ∩ A| = Σ_v [i_p(T − v) − i_{p−1}(T − v)]`? derive it) and reconstruct the two predecessor errors
   (C6-F5's `−1406/−6717` vs `−1218/−5434`; C6-U5's `493/491`) from the frozen files, with your own recomputation. (b) Where is
   (HALL) strictly stronger than `S ≤ 0`? Characterize positive-weight targets unreachable by any arc (maximal independent
   `p`-sets with an active tag — do they exist on eligible trees? exhibit or exclude) and the gap `Σ_{I_p} w − Σ_{N(I_{p+1})} w`.
   (c) Mechanism-equivalence: for each of the ten refuted keys of SOLUTION-CONTRACT §3.2 and the C6-F4 rule, state precisely how
   (HALL) differs (weight, relation, capacity, quantifier) and whether the registered witness of that refutation is a
   deficient cut of (HALL) (compute it where the witness is small: `K_{1,12}`-type, the order-14 covariance tree, the order-24
   tree, `T_22` at `p = 34` via orbits). (d) Literal-hypothesis attacks on (HALL): `p` with no favorable leaf (`F = ∅`, supply
   0 — trivially saturating; say so); supports of degree 2 (`W_v` a singleton); leaves sharing a support (separate tags,
   witnesses each other); switches that DEACTIVATE tags; the `u` with exactly two neighbours in `B` being a leaf's support
   (then `A` contains `s_v`, removing `v` — weight effects); ranks at the top of the window `p = ⌊2α/3⌋`. (e) Grades and alias
   checks for (WID) and any `E993-R30-…` candidate.
5. **U1 `COMPRESSION-UNCROSSING-ORBIT-REDUCTION`.** (a) Prove: `φ(X) = Σ_X w − Σ_{N(X)} w` is supermodular on subsets of
   `I_{p+1}`; the maximizers form a lattice; if `max φ > 0` then an `Aut(T)`-invariant `X` with `φ(X) > 0` exists (the argument of
   C6-T5, re-derived and generalized to any group preserving relation and weights); hence (HALL) on a family with a
   transitive-enough symmetry reduces to a QUOTIENT max-flow — state the reduction theorem at exact scope (outcome B
   candidate `E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION`), with its converse direction (quotient feasibility ⇒ original
   feasibility is the registered (LIFT); original feasibility ⇒ quotient feasibility by summation). (b) Compression /
   uncrossing: can an arbitrary `X` be replaced by a "compressed" family (e.g. closed under exchanging a leaf for its support
   within a pair, or downward-closed in a suitable order) without decreasing `φ`? Prove a compression lemma on the `CB(d, m)`
   sector or exhibit why it fails. (c) The orbit quotient of `CB(d, m)` at eligible ranks INCLUDING switch exits (a state
   records per-branch (supports, leaves, choke) counts as a multiset — the state space is large; find the coarsest quotient
   that (LIFT) still admits, e.g. by grouping branches by type counts only) and compute exact quotient flows for the smallest
   eligible `CB(d, m)` (own builder; validate against brute force on tiny members); report saturation or a quotient deficit.
   (d) Fixed points: the `T_m` orbit classification and the three recorded rows; the sector ratio.
6. **U2 `LEAN-TRANSPORT-SKELETON`.** In a scratch project pinned at the run's toolchain (`scratchpad/c1-U2/LeanProject` seeded
   from the byte-copied `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`, `LeanProof.lean` of
   `sources/first-interior/c2-primary-v2/LeanProject/`; MANUAL SYMLINK of `.lake/packages`; verify the Mathlib revision against
   `sources/mathlib-binding/PIN.json`; `cd` into the project before any `lake`/`lean`): (a) carry `Main.lean` entries 1–18
   byte-identically (the definition layer; you may carry all 45 entries if simpler) and append, in the NEW namespace
   `E993Transport`, the definitions of SOLUTION-CONTRACT §2 (`indepFamily`, `tagWitnesses`, `activeWeight`, `layerWeight`,
   `favorableLeaves`, `transportRel`, `IsSaturatingFlow`, `WeightedHall`) — decidability instances as needed; (b) prove
   `layerWeight_sub_eq_sum` and `activeWeightAggregateIdentity` (the bijection `B ↦ B.erase v` between
   `{B ∈ indepFamily G (j+1) | v ∈ B ∧ ¬Disjoint (B.erase v) (tagWitnesses G v)}` and `taggedFamily G (univ \ H G v) (R G v) j`;
   `Finset.card_bij`/`Finset.sum_comm`; the carried `tagged_count_split` for `q_v = i_j(H_v) − i_j(R_v)`), sorry-free if
   reachable, `#print axioms`; (c) prove `aggregate_nonpos_of_saturatingFlow`; (d) attempt `exists_saturatingFlow_of_weightedHall`
   via Mathlib's `Finset.all_card_le_biUnion_card_iff_exists_injective` on the clone expansion (`Σ B : Fin (w B)` sigma types) or
   report the exact blocking node; (e) the exact dependency diagram (entry numbers, fragment digests, Mathlib lemmas with
   pinned file:line); a draft `THEOREM-CONTRACT.yaml` for the WID award (definitions by exact `lean_name`; the ℕ/ℤ equivalence
   text for `p − 1`); (f) fidelity notes: where `transportRel`'s case (S) could be wider or narrower than the charter's relation
   and how the Lean text pins it; where `activeWeight` differs from `|F ∩ B|`. Report every `sorry` by name if any node blocks.

## Shared rules (binding on every route)

- Statement-level derivations; every hypothesis (`IsTree` — connectivity and acyclicity separately, finiteness, eligibility
  `x + 2 ≤ p` and `3p < 2α + 1`, `p ≥ 1`, invariance of weights under a group action) named where it enters; every
  ℕ-subtraction guarded or cast.
- Fidelity: `w_F` literal; (D) ∪ (S) literal; `F` fixed at rank `p`; `x` through rank `α`; `supply − capacity = S` asserted on
  every instance before any other output; "active tag" vs "favorable leaf present" never conflated (SOLUTION-CONTRACT §3.3).
- Fences §3.1–3.7: mechanism ≠ aggregate; finite ≠ universal; no refuted mechanism revived; no closed region re-proved; no
  census value in a proof; no RTree wording; sealed roots untouched.
- Every numeric claim: own instrument, standard library, exact integers, digest, copy-out-first replay under
  `scratchpad/c1-<seat>-replay/`; trees pass an acyclicity-and-connectivity test; counts up to isomorphism by a canonical
  form named as such; `x`, `Δ_k`, `α`, `p`, `|F|`, supply, capacity, `S` and the graph on every row.
- `headline_resolved: no` this cycle (the headline is (HALL) FORMALLY VERIFIED or REFUTED by a confirmed cut — neither is a
  route's product); one typed route verdict.
