# Cycle 2 Route Allocation — r30 (correctly weighted mixed-boundary transport for the remaining ordinary-tree favorable-leaf aggregate)

Controller: Claude Fable 5.1, 2026-09-26. Topology unchanged: 6 routes / 12 critics / 3 adjudicators / 1 synthesis; routes Claude
Sonnet 5 xhigh, critics Claude Opus 5.5 medium, adjudicators/synthesis/Stage 7/second reads Claude Opus 5.5 high. The portfolio is
the admitted Cycle 1 synthesis's `## Next-cycle portfolio` (`cycles/cycle-1/stage6/SYNTHESIS.md`), narrowed here into binding route
text. The object is unchanged: (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, OPEN; smallest unproved lemma — a
switch-capacity statement for every source subfamily where deletion-only Hall fails, first instance `CB(8, 86)` at `p = 460` for
`X ⊄ X_sec`.

| Seat | Route | Object |
|---|---|---|
| `T1` | `C2-T-01 CB-FAMILY-FULL-NETWORK-HALL` | (HALL-COND) for EVERY `X ⊆ I_{p+1}` on the three sector-deficient CB rows, the Lemma C-uncovered sector rows, and a proof of the spectral node (n1) |
| `T2` | `C2-T-02 WEIGHTED-SECTOR-LYM-BEYOND-PAIRS` | Generalize the sector normalized-matching lemma from induced perfect matchings to star-forest sectors under the active weight; characterize deletion-deficient sectors; a cross-tag (SW) lemma template |
| `F1` | `C2-F-01 SWITCH-NECESSARY-REGIME-CUT-SEARCH` | The smallest tree of ANY shape on which active-weight deletion-only Hall fails (between order 20 and 1465); exact mixed flows there; a (CUT) if one exists |
| `F2` | `C2-F-02 SELECTOR-BINDING-AND-UNREACHABLE-CAPACITY` | Prove or refute "`F_p(T)` is the whole leaf set on every eligible `(T, p)`"; uniform eligibility for the unreachable-target families; (HALL) on any selector-binding rows |
| `U1` | `C2-U-01 LEAN-INV-AND-SECTOR-FORMALIZATION` | Kernel-check the invariant-cut reduction (INV) and the sector normalized-matching lemma (NM) on C1-LA1's frozen definitions |
| `U2` | `C2-U-02 EQUITABLE-PARTITION-LIFT-AND-CB-SWITCH-NETWORK` | Prove a flow lift for equitable partitions (coarser than orbits); apply it to the FULL networks of the three CB rows; the first exact saturation with switch arcs load-bearing, or a quotient deficit as a candidate cut |

## Standing state entering Cycle 2 (from the Cycle 1 close; `cycles/cycle-1/CYCLE-CLOSE.md`)

- Formally verified this run (governed awards; registered in the run-local registry): `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`
  (WID; `E993Transport.activeWeightAggregateIdentity`) and `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`
  (`E993Transport.aggregate_nonpos_of_weightedHall`); companions on their faces: FLOW⇒SIGN, HALL⇒FLOW, the converse and the iff,
  `transportRel_mem_indepFamily`. The frozen `E993Transport` definitions are the Lean text of record for every later award (use
  C1-LA1's text; C1-LA2's differs only in the classical-decidability wrapper and docstrings — R30-N-8).
- `proved_informal`, registered: `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` (INV: supermodular deficit; canonical invariant
  maximizers `X_min`/`X_max`; Hall ⇔ Hall on `Γ`-orbit unions ⇔ quotient Hall; `Aut(G)` admissible with `F_p(G)` invariant; the
  `(⇐)` direction is (LIFT) in Hall form) and `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (NM: `k·|X| ≤
  2(N − k + 1)·|∂_Q X|` on the sector over an induced perfect matching; abstract `S_N ≀ (ℤ/2)^N` symmetry, no tree automorphism).
- Records (`R30-CB-RECORD`, `bounded_computation` with proved sector facts): CB sector weight one; criterion `3p < 2dm + 5` for a
  deletion-deficient sector (P8); deletion-only Hall on every sector subfamily iff `3p ≥ 2dm + 5` (P9); the switch-image weight
  formula (P6); Lemma C (sector Hall on `CB(8, 92)` at every eligible `p`: `proved_informal` for `p ≥ 493`, `computer_assisted`
  at 492 with the spectral node (n1) cited); the three sector-deficient CB rows with `n ≤ 1600`: `CB(8, 86)`/460, `CB(8, 89)`/476,
  `CB(8, 92)`/492 with whole-sector switch-exit multiples 6,128.8×, 6,563.1×, 7,012.3×.
- Bounded facts: every eligible row of free trees at orders 11–19 (195,683 rows) saturates with DELETION ARCS ALONE; every computed
  CB orbit-quotient row (`n ≤ 114`) likewise; on every computed eligible row `F_p(T)` is the whole leaf set; eligible trees with a
  positive-weight arc-unreachable target exist at orders 14, 17, 18 ((HALL) saturates there); no separating instance of
  "`S ≤ 0` but Hall fails" is known on trees (one exists on `P_3 ⊔ K_{6,3,3,3}` at `p = 4`).
- Errata R30-E-a (smallest eligible order 11), R30-E-b (active test `B ∩ W_v ≠ ∅`); incident R30-I-1 (process). The (HALL) and D8
  scope notes are as the SR-REACH read confirmed (see the cycle close).
- Stop gate: ARMED from this cycle's close (unarmed-early rule satisfied). Decisive events halt at any time.

## Mechanism fingerprints and load-bearing obligations

1. **T1 `CB-FAMILY-FULL-NETWORK-HALL`.** (a) At `CB(8, 86)`/460, `CB(8, 89)`/476 and `CB(8, 92)`/492, prove (HALL-COND) for every
   `X ⊆ I_{p+1}` NOT contained in the root-plus-arm sector: by INV restrict to `S_d ≀ S_m`-invariant families; classify sources by
   arm state (`r ∈ B`; `s ∈ B`; `v` only; neither) and by the multiset of branch types; count exactly the sources with `r ∉ B`
   that compete for the choke-switch targets `{v, u_i} ∪ L ∪ rest`; combine the sector deficit bound (NM/P9) with a lower bound on
   the switch capacity net of that competition. State the theorem at exact scope with every hypothesis named; where only a
   family-level or a partial statement is provable, say exactly which subfamilies remain. (b) Sector Hall at the Lemma C-uncovered
   rows (`x₀ ≤ 0`: `CB(8, 108)`/577, `CB(7, 144)`/673, ordered by `n`) by an expansion bound on the switch-dead family `X''`.
   (c) Prove the spectral node (n1) on the face: every eigenvalue of `BBᵀ` on `𝟙^⊥` (B the cover matrix between ranks `k` and
   `k − 1` of `{0,1,2}^N`) is at most `2(k − 1)(N − k + 1)` (SR-SECTOR's route record gives the commutation-identity argument;
   re-derive, do not cite). (d) Could close: "sector Hall for every eligible `(CB(d, m), p)`" at `proved_informal`; a
   restricted-scope (HALL) theorem on the CB family as a SEPARATE key, or a statement-level plan with named open nodes.
2. **T2 `WEIGHTED-SECTOR-LYM-BEYOND-PAIRS`.** (a) Generalize NM to sectors `S^Q` where `T − N[Q]` is a star forest (stars of any
   sizes), under the active weight `w_F`: which layers have the normalized-matching property for deletion; the exact ratio; where
   the weight breaks the symmetry (a star's leaves are tags whose witness is the star centre — weight varies within a layer).
   (b) Characterize exactly the deletion-deficient sectors of eligible trees (generalizing P8 from `CB`): for a sector `S^Q_{|Q|+k}`
   with `T − N[Q]` a star forest, when is `Σ_{S^Q} w > Σ_{N_D(S^Q)} w`? (c) State an (SW) lemma template "the switch exits of a
   deficient sector carry its deficit" cross-tag (E8 forbids tag-by-tag: on `T_22` a private tip has `q_v(j) = C(66, j − 1)`); test
   it on the three CB rows and on the smallest deletion-deficient non-CB sector you find. (d) Every deletion-only statement says on
   its face why it is not `E993-R23-LITERAL-DELETE-ONLY-HALL` (weight, relation, sector object). Could close: a star-forest weighted
   LYM lemma at `proved_informal`; the deficient-sector characterization.
3. **F1 `SWITCH-NECESSARY-REGIME-CUT-SEARCH`.** (a) Find the smallest tree of ANY shape on which active-weight deletion-only Hall fails
   at an eligible rank (currently known: none to order 19; `CB(8, 86)` at order 1465). Search structured families with symmetry:
   unequal branch sizes, several arms, pendant-pair caterpillars (untested at scale), generalized chokes, `CB`-like trees with one
   choke of large degree; use closed forms and validated orbit quotients (INV: a quotient deficit is a deficit) — never a raw
   census of all trees of order 20+. (b) At every deletion-deficient row: the exact MIXED max-flow (full or by a brute-validated
   quotient); a quotient deficit gives an `Aut(T)`-invariant original cut (INV) which you must EXHIBIT (its `X`, `N(X)`, both sums)
   with two independent instruments (a (CUT) is decisive). (c) Otherwise deliver the first brute-force-checkable row where switch
   arcs are load-bearing and saturate. (d) Reconcile with the Cycle 1 record (195,683 rows to order 19; the three CB rows).
4. **F2 `SELECTOR-BINDING-AND-UNREACHABLE-CAPACITY`.** (a) Prove or refute by construction: "on every eligible `(T, p)`, `F_p(T)` is
   the whole leaf set" (no instrument has ever exercised the fixed selector). Attack: a leaf `v` with `Δ_p(T − v) ≥ 0` at an
   eligible `p` needs `T − v` to have a late descent; try trees with a very long path attached to a dense part. If refuted, test
   (HALL) on the selector-binding rows (two instruments). If provable, state the lemma at exact scope (it would simplify every
   (HALL) statement to the all-leaf sum). (b) Prove uniform eligibility and favorability for the unreachable-target families
   `G_k` (`k ≥ 3`) and `T(m, 2)` (`m ≥ 4`) from the Cycle 1 critiques (C-F2-T, C-F2-U; second read SR-REACH), so that
   "(HALL-COND) at `X = I_{p+1}` is strictly stronger than `S ≤ 0` on infinitely many eligible rows" becomes a theorem; compute
   the gap `Σ_{I_p} w − Σ_{N(I_{p+1})} w` in closed form. (c) Could close: a parameter-uniform `E993-R30-…` family key at
   `proved_informal`; either the selector lemma or the first selector-binding rows with exact flows.
5. **U1 `LEAN-INV-AND-SECTOR-FORMALIZATION`.** In a scratch project seeded from C1-LA1's frozen `Main.lean`
   (`runs/lean-2026-09-26-c1-la1-active-tag-weight-identity/LeanProject/LeanProof/Main.lean`; byte-identical carry; manual symlink;
   `cd` before any `lake`/`lean`): (a) `favorableLeaves_map_aut`, `activeWeight_map_aut`, `transportRel_map_aut` for `γ : G ≃g G`;
   (b) supermodularity of `φ` and the maximizer lattice over `Finset (Finset V)`; (c) `exists_aut_invariant_deficient_of_not_weightedHall`
   (INV's tree specialization) — the smallest node the synthesis named; (d) then NM (`sectorPairProductNormalizedMatching`) at the
   registered statement; (e) `#print axioms` on everything; exact dependency diagram; draft contracts. Could close: kernel-checked
   INV and NM ready for Cycle 2 Stage 7 awards (their keys are registered `proved_informal`).
6. **U2 `EQUITABLE-PARTITION-LIFT-AND-CB-SWITCH-NETWORK`.** (a) Prove on the face a flow lift for EQUITABLE partitions of the source and
   target sets (every source in a class has the same number of arcs into each target class, and likewise for targets; supplies
   and capacities constant on classes): a saturating quotient flow spreads to a fractional saturating flow, and integrality of
   max-flow gives an integral one; state exactly how this is coarser than orbits and why it is not (LIFT) (finite group not
   required). (b) Build the equitable quotient of the FULL network (all arm states; branch-type counts) for `CB(8, 86)`/460,
   `CB(8, 89)`/476, `CB(8, 92)`/492 — the `S_d ≀ S_m` orbit quotients are out of reach (54 branch types); validate equitability and
   the transition rules by brute force on small `CB(d, m)`; compute exact quotient max-flows. (c) Could close: the first exact
   saturation with switch arcs load-bearing on a whole tree (`bounded_computation` plus a `proved_informal` lift lemma), or a
   quotient deficit yielding a candidate cut for F1's two-instrument confirmation.

## Shared rules (binding on every route; unchanged from Cycle 1 plus the Cycle 1 lessons)

- `w_F` literal (active tags: `B ∩ W_v ≠ ∅`, `W_v = N(s_v) ∖ {v}` — erratum R30-E-b); (D) ∪ (S) literal; `F_p` fixed at rank `p`;
  `x` through rank `α`; `supply − capacity = S` asserted on every instance before any other output; every eligible row reported
  with full row data. An instrument whose check is non-falsifiable by construction (a quantity computed as the balancing term and
  then "confirmed") is struck (C-T2-F/U on T2).
- The Cycle 1 sealed record is a source of record at its recorded grades; nothing in it is re-proved as a contribution; every
  Cycle 2 claim is graded on its own evidence; a repeated census of already-saturating rows is not evidence.
- Fences §3.1–3.7 of `SOLUTION-CONTRACT.md`: mechanism ≠ aggregate; finite ≠ universal; no refuted mechanism revived; no closed
  region re-proved; no census value in a proof; no RTree wording; sealed roots untouched.
- `headline_resolved: no` unless a route exhibits a (CUT) candidate (then say so in prose; the flag stays `no` until two
  instruments and a second read agree); one typed route verdict.
