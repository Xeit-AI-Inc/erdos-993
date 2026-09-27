# Cycle 4 Route Allocation — r30 (correctly weighted mixed-boundary transport for the remaining ordinary-tree favorable-leaf aggregate)

Controller: Claude Fable 5.1, 2026-09-27. Topology unchanged: 6 routes / 12 critics / 3 adjudicators / 1 synthesis; routes Claude
Sonnet 5 xhigh, critics Claude Opus 5.5 medium, adjudicators/synthesis/Stage 7/second reads Claude Opus 5.5 high. The portfolio is
the admitted Cycle 3 synthesis's `## Next-cycle portfolio` (`cycles/cycle-3/stage6/SYNTHESIS.md`), narrowed here into binding route
text, dispatched only after the controller checkpoint (`control/CONTROLLER-CHECKPOINT-C3.md`; ruling 28). The object is unchanged:
(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, OPEN; smallest unproved lemma — (HALL-COND) at `CB(8,86)/460` (likewise
`CB(8,89)/476`, `CB(8,92)/492`), `F = F_p` derived, for every `X ⊆ I_{p+1}` meeting both the root-plus-arm sector and the
positive-weight V sources (`v ∈ B`, `r ∉ B`, `w_F(B) > 0`); by C2-LA1 it suffices to treat `Aut`-invariant all-positive-weight such `X`.

| Seat | Route | Object |
|---|---|---|
| `T1` | `C4-T-01 CB-FIRST-RANK-COUPLED-ALLOCATION` | (HALL-COND) at the three first ranks for every family meeting `sec` and V⁺; then the (O3) first ranks 577 and 673 |
| `T2` | `C4-T-02 CB-PATTERN-UNIFORM-CLONE-TRANSPORT` | The E1 criterion proved analytically for every `CB(d,m)` and every eligible `p`; extended to the heterogeneous CB pattern; C1's import discharged |
| `F1` | `C4-F-01 POSITIVE-PART-FEATURE-REFINED-CLASS-UNION-CUT-SEARCH` | A (CUT) or its exclusion over `Aut`-invariant all-positive-weight families at the five sector-deficient CB first ranks and `G(8^82, 7^2)/448` |
| `F2` | `C4-F-02 GK-UNIFORM-HALL-OR-CUT-AND-THE-SATURATION-CONJECTURE` | A parameter-uniform saturating flow or a cut on `G_k`; a closed-form adversarial test of "on trees, `S ≤ 0` ⇒ saturation"; the `T(m,2)` premises if time remains |
| `U1` | `C4-U-01 LEAN-GK-SIGN-AND-NM-ENCODING` | GK-SIGN's DAG and (NM)'s encoding on the frozen definitions; the ℚ-flow verification lemma as a companion |
| `U2` | `C4-U-02 SWITCH-SHARE-ALLOCATION-LEMMA` | An exact rational switch-share allocation rule verified on brute-forceable laboratories, then lifted to the `CB(8,·)` coupled families |

## Standing state entering Cycle 4 (from the Cycle 3 close; `cycles/cycle-3/CYCLE-CLOSE.md` — read it for the grades of record)

- Formally verified this run (governed awards; run-local registry): (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (C1-LA1);
  `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (C1-LA2); the invariant positive deficient family
  `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY` (C2-LA1; existential); and the (INV) orbit-quotient clause (Cycle 3 Stage 7 CLOSED, `formally_verified`) `weightedHall_iff_autOrbitQuotientHall` (C3-LA1: WeightedHall at `F = F_p` iff the `Aut(G)`-orbit
  quotient's Hall inequality for every set of source orbits — an equivalence of Hall conditions, NOT feasibility of any quotient;
  registered as the separate key `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` — SR-C3-1 ruled the
  registered (INV) text wider, so (INV) itself stays `proved_informal`; see the cycle close). Definitions of record: C1-LA1's `Main.lean` (`86b59c6c…`), C2-LA1's (`a9cf3b81…`) and C3-LA1's
  new declarations, all receipt-bound and carried byte-identically by every award, keyed by (origin award, entry, digest).
- `proved_informal`, registered (every Cycle 3 key below was confirmed by its isolated second read; three were RENAMED by their
  readers — cite the names below, never the Stage 6 proposals): (INV) as registered; (NM); the
  second-eigenvalue theorem; the `CBstar` sector deficit (exact formula at every `p ≥ 2`; the `t ≥ 2` no-deficit corollary for `p ≥ x+2`); the `G_k` family key; the equitable-partition lift; and
  from Cycle 3 — GK-SIGN `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE` (`S(G_k, k+3) = −g(k+1) − 2^k − (k+2)A(k) < −2`
  for every `k ≥ 1`, all leaves favorable), the E1 mark-clone reduction `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (on
  `CB(d,m)` with `F ⊇` all private leaves: if `ρ_q ≤ 1` and the type-path inequalities hold at rank `p` then (HALL-COND) holds for every
  non-sector family with deletion arcs only), the pendant-P3-arm collapse `E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM`
  (a positive sector deletion deficit needs `Q = {r, v}` with a pendant `P_3` arm — the CB pattern). STATED items not confirmed by
  their second read are cited only as STATED.
- `computer_assisted`, restricted scope: `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK` — D1 (every non-sector
  family, all 177 eligible ranks of `CB(8,86/89/92)`, deletion arcs; worst `ρ_1` at the first ranks 0.99456 / 0.99474 / 0.99492),
  D2 (full (HALL) with deletion arcs at the 174 ranks above the first), D3 (full (HALL) at 166 ranks of `CB(8,108)` and `CB(7,144)`
  above their first ranks); the Cycle 2 sector Hall at every eligible rank of the three rows. The open part at the three rows is
  exactly the first-rank coupled families as NARROWED by SR-C3-4: families meeting the sector, a positive-weight V source AND a
  positive-weight S or O source (Cycle 2's (O2)); families with no positive S/O member are settled by (R-i) with the registered sector
  Hall. E1 is a SUFFICIENT criterion only (`CB(1,7)/10` fails it yet saturates, SR-C3-3).
- `conditional`: C1, the exact heterogeneous sector deletion deficit `max(0, e_{p−1}(q) − e_{p−2}(q))`, `q_i = t_i + 1`, on the
  normalized-matching property of claw products (Harper; Hsieh–Kleitman — no run source; the smallest unproved lemma is
  `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)`); T2's obligation includes discharging it self-containedly.
- Bounded facts of record (`R30-CB-RECORD`): deletion-only Hall fails at eligible ranks on `CB(8,86)/460`, `CB(8,89)/476`,
  `CB(8,92)/492`, `CB(8,108)/577`, `CB(7,144)/673` (sector; ratios `460/459`, `476/475`, `492/491`, `289/288`, `337/336`) and on the
  non-CB tree `G(8^82, 7^2)/448` (`n` 1427, `α` 755, `x` 446, window [448, 503]; ratio `448/447`; switch image ≈ 13.1× the sector
  supply; not a cut; not a proved minimum); whole-tree saturation that NEEDS switch arcs is exhibited only at non-eligible ranks (the
  order-8 tree at `p = 3`: 29/32/−3, mixed 29, deletion-only 27; `CB(4,1)/4`: 60/60/0, deletion-only 52, mixed 60); at no eligible row
  has saturation with switch arcs been proved where deletion alone fails; weighted Hall for every union of full `(τ,q)` classes at
  the three first ranks (the whole layer tightest; switch-image ratios 14.32 / 14.79 / 15.25); mixed and deletion-only flows saturate
  on `G_3..G_8`, `T(4..9,2)`, `CBstar(2,2,2)/7`; `F_p` = all leaves on every computed row. Conjecture (C-U2-F; `conjecture` grade,
  never evidence): on trees, `S(T,p) ≤ 0` implies a saturating flow at every rank (no counterexample through order 15).
- Struck in Cycle 3 (never cite as evidence): T1's "middle t-range needs switch arcs" and its three proposed keys; T2's Corollary
  formula off `c = β = 1`, G3's algebra as written, the "arbitrary tree, arbitrary `Q`" generality; U2's `CBstar` paraphrase ("never
  deletion-deficient at any rank" — false at non-eligible ranks), its "smallest" and "first" literals; F1's "Cycle 2 established
  whole-network saturation" and its unbacked validation literals; F2's balancing `S` on its new rows and "P10 is a registered key";
  U1's "remaining gap" in (INV).
- Errata R30-E-a … R30-E-g (see the cycle closes; R30-E-g: `SEMANTIC-CONTRACT.md` §1.1's order-13 sentence is false — eligible trees
  exist at orders 11 and 12, all in the closed band; derive any census yourself). Controller checkpoint `control/CONTROLLER-CHECKPOINT-C3.md`
  §4.5 pre-arms the plateau test for this cycle's close (gate ruling 30). Stop gate ARMED (since the Cycle 1 close). This cycle is the FOURTH of six; if it
  yields only instance-level (HALL) evidence, the Cycle 4 synthesis must weigh that pattern in its plateau ruling.

## Mechanism fingerprints and load-bearing obligations

1. **T1 `CB-FIRST-RANK-COUPLED-ALLOCATION`.** (a) At `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`: prove (HALL-COND) under
   (D) ∪ (S) for every family meeting `sec` and V⁺ (by C2-LA1, WLOG `Aut`-invariant and all-positive-weight). Method (the synthesis's):
   start from the E1 flow's residual `(1 − ρ_1)·w_F(A)` on `q = 1` targets (which include every sector switch image); shift an
   `ε`-share of switch-live sector sources onto their `u_i`-switch targets to unload the sector targets whose up-neighbourhoods are
   dominated by switch-dead members; rebalance V sources through their equal-weight `v`-free exits `B − v`; verify by exact
   branch-type generating-function summation. (b) Validate the allocation FIRST by literal max-flow on small CB rows at
   sector-deficient ranks with `S ≤ 0` (non-eligible laboratories are fine for validation, never for evidence). (c) Then the (O3)
   first ranks `CB(8,108)/577`, `CB(7,144)/673`. (d) Could close: full (HALL) at all 177 eligible ranks of the three rows
   (`computer_assisted`, SEPARATE key) — the first eligible whole tree proved to saturate with switch arcs load-bearing; a
   (CUT) candidate if the allocation provably cannot exist (hand it to F1 for the two-instrument rule).
2. **T2 `CB-PATTERN-UNIFORM-CLONE-TRANSPORT`.** (a) Prove the E1 criterion (`ρ_q ≤ 1` and the type-path inequalities) analytically
   for every `CB(d,m)` and every eligible `p`, via log-concavity and the mode of the rank sequence of `(1+y)^{qd−1}(1+2y)^{d(m−q)+1}`.
   (b) Extend to the heterogeneous CB pattern (covering `G(8^82, 7^2)` off the sector). (c) Discharge C1's import by a self-contained
   normalized-matching proof for claw products (the lemma `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)`). (d) Every deletion-only statement says on its
   face why it is not `E993-R23-LITERAL-DELETE-ONLY-HALL`. Could close: a `proved_informal` parameter-uniform restricted-scope (HALL)
   theorem — every eligible rank with `3(p−1) ≥ 2M + 2` of every CB-pattern tree — as a SEPARATE key and a Cycle 5 Lean target; C1
   promoted from `conditional`.
3. **F1 `POSITIVE-PART-FEATURE-REFINED-CLASS-UNION-CUT-SEARCH`.** (a) At the five sector-deficient CB first ranks and
   `G(8^82, 7^2)/448`: C-F1-T's reach-set rule refined to positive-weight members and to feature counts (choke-out branches with
   no / exactly one support; choke-in branches with ≥ 1 / ≥ 2 absent leaves); class-aggregated max-flow; a (CUT) must be an
   original class-union cut (`X`, `N(X)`, both sums) with TWO independent instruments and the route flag stays `headline_resolved:
   no` until the second read. (b) Sector Hall under (D) ∪ (S) for every `X ⊆ sec` at `G(8^82, 7^2)/448`. (c) Could close: a (CUT)
   candidate, or the strongest adversarial record at six rows (a proved lower bound on the class-union slack feeds T1).
4. **F2 `GK-UNIFORM-HALL-OR-CUT-AND-THE-SATURATION-CONJECTURE`.** (a) On `G_k` at `p = k+3` (`k ≥ 3`): an explicit parameter-uniform
   saturating flow (deletion arcs saturate every computed row; the layers factor through `P^k`) or a cut in some `X ⊊ I_{p+1}`. (b) A
   closed-form adversarial test of the conjecture "on trees, `S ≤ 0` ⇒ saturation": a counterexample at a non-eligible rank refutes
   only the conjecture; at an eligible rank it is a (CUT) candidate. (c) If time remains, the `T(m,2)` premises for `m ≥ M_0` by a
   local-limit bound at `λ₊`. Could close: the first parameter-uniform restricted-scope (HALL) theorem on an infinite eligible family
   (SEPARATE key), or a cut, or the conjecture's refutation.
5. **U1 `LEAN-GK-SIGN-AND-NM-ENCODING`.** Seed from C1-LA1 and C2-LA1 byte-identically, and from C3-LA1's closed award text if it
   closed (if it did not, completing C3-LA1's DAG is this route's first obligation). (a) GK-SIGN's DAG on the frozen definitions —
   the component-product lemma for `C5LA1.indepSetCount` over a disjoint union, the explicit `G_k` on `Fin (3k+5)`, Lemma M, the
   aggregate identity — following C-F2-U's proof (no real-rootedness). (b) (NM)'s (N1) encoding bijection (independent `k`-sets of
   the induced-matching sector ↔ rank-`k` states of `Fin N → Option Bool`, deletion ↔ `Rdel`) and (N2) the sector correspondence with
   weight one. (c) The ℚ-flow verification lemma (B7) as a compiled companion. `#print axioms` on everything; exact dependency
   diagram; draft contracts. Could close: GK-SIGN and (NM) contract-ready for the Cycle 4 Stage 7.
6. **U2 `SWITCH-SHARE-ALLOCATION-LEMMA`.** (a) An (SW) lemma: an exact rational switch-share allocation rule for a deficient sector,
   verified by exact summation against literal max-flow on brute-forceable laboratories (the order-8 tree, `CB(4,1)/4`, the
   non-eligible `CB(d,1)` sectors, the eligible `CBstar(2,2,2)/7`), with eligibility and derived `F_p` as named hypotheses (B8/B9 show
   rescue fails without them). (b) Its lift to the `CB(8,·)` coupled families, converging with T1 as the certificate primal. Could
   close: an (SW) outcome-B lemma at `proved_informal` on a named family, or a sharp statement of where per-class allocation fails,
   handed to F1.

## Shared rules (binding on every route; Cycles 1–3 lessons included)

- `w_F` literal (active tags: `B ∩ W_v ≠ ∅`, `W_v = N(s_v) ∖ {v}`); (D) ∪ (S) literal; `F_p` DERIVED at rank `p` on every row (never
  hard-coded "all leaves" — three Cycle 3 routes were struck for it); `x` through rank `α`; `supply − capacity = S` asserted on every
  instance from INDEPENDENTLY computed sides (a balancing check is struck — ruling 17/24); every eligible row reported with full row
  data; replay with `python3 -B`; nothing written under `sources/`; "validated on N cases" is written only when the shipped code runs
  those cases.
- The Cycle 1–3 sealed records are sources at their recorded grades; nothing in them is re-proved as a contribution; every Cycle 4
  claim is graded on its own evidence; STATED items are cited as STATED; classical theorems not under `sources/` are undischarged
  dependencies named on the face.
- Fences §3.1–3.7 of `SOLUTION-CONTRACT.md`: mechanism ≠ aggregate; finite ≠ universal; no refuted mechanism revived; no closed region
  re-proved; no census value in a proof; no RTree wording; sealed roots untouched. A sector, family or finite-instance statement is
  not (HALL); a deletion-only deficit is not a (CUT); a non-eligible rank is a laboratory, not evidence.
- `headline_resolved: no` unless a route exhibits a (CUT) candidate (then say so in prose; the flag stays `no` until two instruments
  and a second read agree); one typed route verdict.
