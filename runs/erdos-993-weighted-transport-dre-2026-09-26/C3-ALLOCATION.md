# Cycle 3 Route Allocation — r30 (correctly weighted mixed-boundary transport for the remaining ordinary-tree favorable-leaf aggregate)

Controller: Claude Fable 5.1, 2026-09-26. Topology unchanged: 6 routes / 12 critics / 3 adjudicators / 1 synthesis; routes Claude
Sonnet 5 xhigh, critics Claude Opus 5.5 medium, adjudicators/synthesis/Stage 7/second reads Claude Opus 5.5 high. The portfolio is
the admitted Cycle 2 synthesis's `## Next-cycle portfolio` (`cycles/cycle-2/stage6/SYNTHESIS.md`), narrowed here into binding route
text. The object is unchanged: (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, OPEN; smallest unproved lemma — Hall on the
choke forest `T′ = T − {r, s, v}` at `CB(8,86)/460` (likewise 476, 492), plus the coupled allocation for source families that mix
the root-plus-arm sector with positive-weight V sources and positive-weight S/O sources.

| Seat | Route | Object |
|---|---|---|
| `T1` | `C3-T-01 CB-CHOKE-FOREST-HALL-AND-SECTOR-ABSORPTION` | Prove (CF-HALL) and (O1) on the choke forest `T′` at the three `CB(8,·)` rows, then close (O2) with an explicit allocation; a restricted-scope (HALL) key at the three rows |
| `T2` | `C3-T-02 GENERAL-SECTOR-SELF-COVERING` | Generalize the self-covering reduction to arbitrary trees with `T − N[Q]` a star forest; characterize every switch-necessary sector shape; the small-set cases at `CB(8,108)/577` and `CB(7,144)/673` |
| `F1` | `C3-F-01 INVARIANT-CLASS-UNION-CUT-SEARCH-ON-SWITCH-NECESSARY-ROWS` | Adversarial class-union cut search on the three `CB(8,·)` rows by branch-type generating functions (no orbit enumeration); the smallest non-CB switch-necessary tree by closed form |
| `F2` | `C3-F-02 UNREACHABLE-CAPACITY-FAMILY-CLOSURE` | Prove the `T(m,2)` premises and `S(G_k, k+3) ≤ −2`; then attack (HALL) itself on `G_k` and `T(m,2)` |
| `U1` | `C3-U-01 LEAN-INV-QUOTIENT-NM-AND-LEMMA-U` | Kernel-check (INV)'s quotient half via a class-union identity (no flows), then (NM) and Lemma U, on C1-LA1's frozen definitions and C2-LA1's closed award text |
| `U2` | `C3-U-02 PRODUCT-FORM-FLOW-CERTIFICATE-ON-CB-ROWS` | An exact saturating-flow or LP-dual certificate on the full mixed networks of the three `CB(8,·)` rows, validated first on brute-forceable rows |

## Standing state entering Cycle 3 (from the Cycle 2 close; `cycles/cycle-2/CYCLE-CLOSE.md` — read it for the grades of record)

- Formally verified this run (governed awards; run-local registry): `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (WID; C1-LA1),
  `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (C1-LA2) and
  `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY` (C2-LA1, closed `formally_verified`: if weighted Hall
  fails on any finite simple graph at any rank, an `Aut(G)`-invariant, all-positive-weight, strictly deficient source family EXISTS —
  an existential statement; that the proof's witness is `X_min` is proof content; graph-generic; the invariant-family half of (INV)
  only). The definitions of record are C1-LA1's `Main.lean` (`86b59c6c…`), carried byte-identically by every award; C2-LA1's
  `Main.lean` (`a9cf3b81…`) is the text of record for `famMap`, `phi`, `canonMin`.
- `proved_informal`, registered: (INV) `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` (its quotient clause is NOT
  kernel-checked); (NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (no Lean text anywhere); and, confirmed by the Cycle 2 second reads
  (all four; see the cycle close): `E993-R30-TERNARY-COVER-SECOND-EIGENVALUE` (node (n1): `λ₂ =
  2(k−1)(N−k+1)` on both layers of the ternary cover operator), `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` (the exact sector
  deletion deficit `max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1})`; for `t ≥ 2` no sector subfamily is deletion-deficient at eligible
  ranks, via (LB)), `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO` (the `G_k` family, `k ≥ 3`: eligible
  iff `k ≥ 3`, tags `3, 4` favorable, unique unreachable target `A_k` of weight 2, gap exactly 2), `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT`
  (the lift iff plus class-union Hall; generalizes (LIFT)). Every Cycle 2 key was confirmed by its second read; items the reads STRUCK (cycle close §6) are
  never cited as evidence.
- `computer_assisted` (three instances; not a family theorem): sector Hall under (D) ∪ (S) for every `X ⊆ X_sec` at every eligible `p`
  of `CB(8,86)`, `CB(8,89)`, `CB(8,92)` (margins 6863.256, 11209.544, 18328.277 at the first rank via the Lemma C(ii) composition
  with (n1); NM/P9 above it). The CB competition map (S3): every positive-weight target of a sector source contains `v`; every
  target of an R0/S/O source is `v`-free; a V source has exactly one `v`-free target `B − v` of equal weight; reductions (R-i) and the REPAIRED
  (R-ii): if `X ∩ V` has no positive-weight member then `Hall(X ∩ sec) ∧ Hall(X ∩ (R0 ∪ S ∪ O)) ⇒ Hall(X)` — the synthesis's
  `Hall(X ∖ sec)` form is FALSE (weight-0 V sources share `v`-containing switch targets with the sector; witness `CB(3,2)` at `p = 5`,
  SR-C2-2, controller-replayed). The open part of (HALL) at the three rows is exactly the families mixing `sec` with positive-weight V and positive-weight
  S/O sources.
- Bounded facts: switch arcs have NEVER been load-bearing on any computed tree row (Cycles 1–2); every eligible free-tree row to
  order 19 (195,683), every computed CB row (`CB(1,7)/10`, `CB(2,5)/10`, `CB(3,5)/13–14`, `CB(4,4)/14`), the pendant-pair caterpillar
  `PPC(7,2)/12` (n 35; supply 7,801,728 / capacity 11,469,576 / S −3,667,848), and the `G_k`, `T(m,2)` small rows saturate with
  deletion arcs alone; on every computed row `F_p(T)` = all leaves (leaf deletion shifts `x` by 0 or −1 on every free tree to
  order 14); deletion-only Hall on the root-plus-arm sector first fails at `CB(8,86)/460`; no whole-sector deletion deficit exists in
  the `CBstar` family for `t ≥ 2` (proved) nor in the pendant-pair family to `n ≤ 600` (bounded); the coarsest equitable partition
  equals the orbit partition on every `d ≥ 2` CB network tested (so equitable quotients give no reduction there; orbit spaces at
  the three rows ≈ 3·10^37 per layer).
- Struck in Cycle 2 (do not cite as evidence): T2's whole-sector criterion T-B (false for `t ≥ 2`) and its §7 search; T1's and
  U2's non-falsifiable `S` checks; U1's `X_max` witness; U2's Candidate 2 headline and its "not (LIFT)" framing; the synthesis's (R-ii) wording; F1's "no deletion-deficient CB row below 1465"
  beyond the root-plus-arm sector; T1's "formally_verified-grade" wording.
- Errata R30-E-a, R30-E-b, R30-E-c, R30-E-d (see the cycle closes). Stop gate: ARMED (since the Cycle 1 close). Controller checkpoint
  falls after this cycle's close.

## Mechanism fingerprints and load-bearing obligations

1. **T1 `CB-CHOKE-FOREST-HALL-AND-SECTOR-ABSORPTION`.** (a) At `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, prove (HALL-COND) on
   the choke forest `T′ = T − {r, s, v}` for every `Aut`-invariant family (INV restricts to `S_d ≀ S_m`-invariant families): class
   the sources by the number `q` of included chokes; each class is a product of `q` choke-in blocks and `m − q` ternary blocks;
   prove Hall per class with explicit slack (the thinnest class is `q = 1`, ratio ≈ 0.9902 — verify); use the self-covering idea
   (deleting a choke is a private exit). (b) Then absorb the sector: route the sector's switch share into the V-target slack left
   after the V sources are served inside their `T′` copy, and close (O2) — the coupled families mixing `sec`, positive-weight V and
   positive-weight S/O — with an explicit allocation. (c) State the theorem at exact scope with every hypothesis named; where only a
   family-level statement is provable, say exactly which families remain. (d) Could close: a restricted-scope (HALL) theorem at the
   three rows as a SEPARATE key (`computer_assisted`; the first full-network Hall with switch arcs load-bearing on a whole tree), or
   an explicit coupled family whose deficit sign becomes F1's sharp candidate.
2. **T2 `GENERAL-SECTOR-SELF-COVERING`.** (a) Generalize the `CBstar` self-covering reduction to an arbitrary tree `T` and independent
   `Q` with `T − N[Q]` a star forest: the `Q`-deletions are private exits; bound the weight lost when `q ∈ Q` is a witness; reduce any
   sector deficit to the weight-inert residual; characterize exactly when that residual is deletion-deficient (a weighted LYM for
   non-uniform star sizes `q_i`). (b) (O3): sector Hall at `CB(8,108)/577` and `CB(7,144)/673` by small-set expansion
   `|X|/R_k < θ` via a Kruskal–Katona-type bound on the product of three-element posets (no spectral route exists there). (c) Every
   deletion-only statement says on its face why it is not `E993-R23-LITERAL-DELETE-ONLY-HALL`. Could close: a parameter-uniform
   (NMP) lemma at `proved_informal` identifying every switch-necessary sector shape on trees (expected: pendant-pair sectors only),
   plus sector Hall at the two uncovered rows.
3. **F1 `INVARIANT-CLASS-UNION-CUT-SEARCH-ON-SWITCH-NECESSARY-ROWS`.** (a) Adversarial search for a mixed-relation deficit at the
   three `CB(8,·)` rows restricted to what S3 leaves possible: `Aut`-invariant families meeting `sec`, positive-weight V and
   positive-weight S/O together. Compute `Σ_X w_F` and `Σ_{N(X)} w_F` EXACTLY for class unions indexed by arm state × choke count ×
   branch-type marginals through branch-type generating functions — no orbit materialization, no equitable quotient coarser than
   orbits (none exists at `d ≥ 2`). (b) Any deficit must be exhibited as an original class-union cut (`X`, `N(X)`, both sums; INV /
   class-union Hall form) with TWO independent instruments; a (CUT) is decisive and gets an isolated second read; the route flag
   stays `headline_resolved: no`. (c) Separately test the prediction that switch-necessity needs many pendant-pair sectors: construct
   the smallest non-CB trees with a `t = 1` sector satisfying `3(p−1) < 2(M+1)` at an eligible rank, by closed form, never by census.
   (d) Could close: a (CUT) candidate; a proved lower bound on class-union slack feeding T1's (O2); or the smallest switch-necessary
   tree below order 1465.
4. **F2 `UNREACHABLE-CAPACITY-FAMILY-CLOSURE`.** (a) Prove for every `m ≥ 4`: `x(T(m,2)) ≤ m` and `Δ_{m+2}(T(m,1)) < 0` (favorability
   of `ℓ_1, ℓ_2` via `T(m,2) − ℓ_1 ≅ T(m,1)`), using the block recurrence `P_{j+1} = (1+3y+y²)P_j − y²(1+y)P_{j−1}` with a mode
   estimate and a finite check (the bound is tight: `x = m` exactly for `4 ≤ m ≤ 18`). (b) Prove `S(G_k, k+3) ≤ −2` for every `k ≥ 3`.
   (c) Then attack (HALL) itself on `G_k` and `T(m,2)`: an explicit parameter-uniform saturating flow (deletion arcs suffice on
   every computed row — prove it uniformly, or show where it fails), or a cut on the family where Hall's room is provably smallest
   (gap exactly 2). (d) The selector is retired as a route object (S9); the `G_k` key registers through its second read, not here.
   Could close: the `T(m,2)` family key at `proved_informal`; the first parameter-uniform restricted-scope (HALL) theorem on an
   infinite family with unreachable capacity, as a SEPARATE key; or a cut.
5. **U1 `LEAN-INV-QUOTIENT-NM-AND-LEMMA-U`.** Seed from C1-LA1's `Main.lean` byte-identically (manual symlink; `cd` before any
   `lake`/`lean`; `python3 -B`), plus C2-LA1's closed award text `runs/lean-2026-09-26-c2-la1-aut-invariant-positive-deficient-family/LeanProject/LeanProof/Main.lean`
   (`a9cf3b81…`; carry its new declarations byte-identically through the registrar with its receipt binding). (i) Define the `Aut(G)`-orbit quotient; prove `covered_orbitUnion` and the class-union deficit identity;
   with `weightedHall_iff_invariant` this gives WeightedHall ⇔ quotient Hall — the whole (INV) key, without flows. (ii) NM: the sector
   encoding over an induced perfect matching, the two cover-degree lemmas (`k` down, `2(N−k+1)` up), the double count. (iii) Lemma U
   `exists_transportRel_iff` on the frozen definitions. `#print axioms` on everything; exact dependency diagram; draft contracts.
   Could close: kernel-checked (INV) at its full registered statement and (NM), ready for Cycle 3 Stage 7 awards.
6. **U2 `PRODUCT-FORM-FLOW-CERTIFICATE-ON-CB-ROWS`.** (a) An exact certificate on the FULL mixed networks of the three `CB(8,·)`
   rows, in one of two forms: a closed-form rational saturating flow over branch-type generating functions, verified by summation (a
   rational saturating flow implies WeightedHall for every `X` — prove that lemma on the face); or an LP-dual potential certifying
   that no deficient family exists. (b) Validate first on the brute-forceable eligible rows `CB(1,7)/10`, `CB(2,5)/10`,
   `CB(3,5)/13–14`, `CB(4,4)/14`, then on a small NON-eligible row where the root-plus-arm sector is deletion-deficient at the chosen
   rank (e.g. `CBstar(2,2,2)` at `p = 5` or `6`, or a `CB(d,m)` rank with `3p < 2dm + 5`), so the certificate's switch share is
   exercised on a checkable network before `d = 8`. (c) Could close: the first exact saturation with switch arcs load-bearing on a
   whole tree (`bounded_computation` plus a `proved_informal` verification lemma), or a candidate invariant cut for F1's
   two-instrument confirmation. T1, U2 and F1 converge on the same three rows by design (analytic primal, certificate primal, dual
   adversary); their disagreement at Stage 5 would itself be informative.

## Shared rules (binding on every route; Cycles 1–2 lessons included)

- `w_F` literal (active tags: `B ∩ W_v ≠ ∅`, `W_v = N(s_v) ∖ {v}` — erratum R30-E-b); (D) ∪ (S) literal; `F_p` DERIVED at rank `p`
  (never hard-coded "all leaves"); `x` through rank `α`; window top `⌊2α/3⌋` (check `3p < 2α + 1` literally); `supply − capacity =
  S` asserted on every instance from INDEPENDENTLY computed sides (a balancing check is struck — ruling 17); every eligible row
  reported with full row data; replay with `python3 -B`; nothing written under `sources/`.
- The Cycle 1 and Cycle 2 sealed records are sources of record at their recorded grades; nothing in them is re-proved as a
  contribution; every Cycle 3 claim is graded on its own evidence; a repeated census of already-saturating rows is not evidence;
  STATED items not yet confirmed by a second read are cited as STATED.
- Fences §3.1–3.7 of `SOLUTION-CONTRACT.md`: mechanism ≠ aggregate; finite ≠ universal; no refuted mechanism revived; no closed
  region re-proved; no census value in a proof; no RTree wording; sealed roots untouched. A sector or family statement is not (HALL);
  a deletion-only deficit is not a (CUT).
- `headline_resolved: no` unless a route exhibits a (CUT) candidate (then say so in prose; the flag stays `no` until two
  instruments and a second read agree); one typed route verdict.
