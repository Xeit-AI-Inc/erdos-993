# Critique

Critic `C-F2-T` (orientation T, prove) of route return `F2` (`C1-F-02 FIDELITY-AND-MECHANISM-EQUIVALENCE`, orientation F),
Cycle 1 Stage 4, r30. Date 2026-09-26.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I followed no other VerityOS subsystem (memory, modules, skills,
logs, conversations). The harness put the root `CLAUDE.md` and a user-memory index into my context automatically. I did not read
them as files and used nothing from them as evidence.

**Read-boundary disclosures (mine).**
1. When I first opened `control/C1-CRITIC-ATTACK-BRIEFS.md`, an `awk` pattern that started at the first line containing "F2"
   printed about five lines of the T2 section. Those lines were the tail of T2's pointers, which mention "F2's §C" and T2's
   Step 3. I then re-read only lines 1–12 (the shared preamble) and 101–124 (my own seat's section). None of the T2 text is
   used below.
2. All other reads are capsule members (all 14 digest-verified), my dispatch file, the two boot files, F2's inventoried scratch
   `scratchpad/c1-F2/` (listed and copied out, never edited), and frozen Stage 2 members under `sources/`. The `sources/` files
   were the registry `sources/lower-region/records/FINAL-REGISTERED-CLAIM-IDENTITY.json`, `t_family` in
   `sources/lower-region/inputs/ordinary_tree_checked.py`, and `sources/lower-region/cycle-6/{C6-F5,C6-U5,C6-F4}/*`. Every
   search (`grep`, `os.walk`) was rooted at or below `sources/` or my own scratch directory.
3. I used no network, installed nothing, started no background job, and ran no process listing. The copy-out-first replay
   imported the pinned evaluator with `sys.dont_write_bytecode = True`, and I deleted the `__pycache__` directories inside my
   own scratch. A re-digest after the replay found `sources/` intact (see below).

## Identity and seal audit

- **Capsule seal.** I recomputed the SHA-256 of the compact, key-sorted JSON of `control/c1-critic-capsules/F2-PACKET-MANIFEST.json`
  without `seal_sha256` and without a trailing newline. It gives `32f5d900dcaf29b39bcdcd02c0ba5fe646356216bc6f0eb34533c1875ebba0f6`,
  which matches the dispatch. All 14 members match their `(bytes, sha256)`, including the return
  (`cd0976be…e6f0eb…`, 45465 bytes).
- **Stage 4 dispatch seal** `f62b5c6a639104c155f2acebb4b40b5f6379134f490c90edc1601a0b764ac2cc`: recomputed, matches.
  **Stage 3 seal** `da784de8567703935e95ea3e452acc151fdbc15a7e20ffd86634ecb87e4f92ac`: recomputed, matches.
  **Stage 2 seal** `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92`: recomputed, matches the return's value.
- **Sources.** I re-digested all 981 files listed in `control/SOURCE-DIGESTS.json`: 981 match, none missing, and no file under
  `sources/` is unlisted. There are zero `__pycache__` directories. This confirms from the digests file itself that F2's deleted
  `__pycache__` left no trace. The pinned evaluator matches its entry (`a012bb78…`, 16710 bytes), and so does the registry
  (`eba20be3…`, 2624107 bytes).
- **F2 evidence replay (copy-out-first).** I copied all five `.py` generators to `scratchpad/c1-crit-F2-T/replay/` and ran
  `f2_main.py`, `f2_part2.py`, `f2_part3.py` and `f2_combine.py` in order. The output printed
  `F2-EVIDENCE.json sha256: 3c6226b1cd9e7706d465002d4d0d1f03fa40591ca12bc1519fec102b35ebc186`, the value the return states.
  The replayed `F2-EVIDENCE.json` is byte-identical (`cmp`) to F2's.
- **F2's disclosures.** (a) The two non-recursive `ls` calls above the grant are disclosed candidly, and their content was not
  used, so I see no taint. (b) The `__pycache__` write is confirmed repaired, as above. (c) Arguing D8 and D10 from registry
  text is acceptable for the mechanism-equivalence verdict, because a moment inequality has no cut object. But the allocation
  asked for the small witnesses to be computed. I computed a D8 witness from the statement text alone (Attacks, item 7), so that
  gap is now partly closed without touching the fenced root.
- **F2's model line** ("Chartered Sonnet/xhigh; … `claude-sonnet-5`") agrees with the allocation (routes are Claude Sonnet 5,
  xhigh).

## Independent re-derivation

My instrument is `crit_lib.py`, written from SEMANTIC-CONTRACT §1 without reusing F2's logic. It uses bitmask graphs, a forest
DP for independence polynomials, and `x` scanned through rank `α` with zero extension. Each tree passes separate connectivity and
union-find acyclicity tests. The selector is `F_p` from `Δ_p(T − v)` on the original tree, and `w_F` is the literal active-tag
weight. The relation is (D) ∪ (S) taken literally, and the flow is exact-integer Dinic. On every instance, before any other
output, the instrument asserts `supply − capacity = S`, where `S` is computed independently from `q_v = i(H_v) − i(R_v)`.

**Fixed points (all reproduced).** Every row satisfies `supply − capacity = S`, and every flow saturates.

| tree | n | α | x | p | \|F\| | S | supply/capacity/flow | arcs | literal diff = ΣΔ_{p−1}(H_v) |
|---|---:|---:|---:|---:|---:|---:|---|---:|---:|
| `K_{1,12}` | 13 | 12 | 6 | 8 | 12 | −1980 | 1980/3960/1980 | 1980 (0 switch) | −1980 |
| path-star (2,3,4) | 15 | 11 | 5 | 7 | 10 | −1218 | 1483/2701/1483 | 2025 | −1406 |
| path-star (2,2,4,3) | 18 | 13 | 6 | 8 | 12 | −5434 | 8033/13467/8033 | 11691 | −6717 |
| `CB(1,7)` | 24 | 15 | 8 | 10 | 8 | −28812 | 29190/58002/29190 | 124593 | −53592 |

The `CB(1,7)` row matches the controller's cross-check in the attack-brief preamble. The `T_22` row at `p = 34` is scalar only
(own DP on `t_family(22)`): `n = 91`, `α = 68`, `x = 32`, `|F| = 67`, `S = −498754180547001418536`,
`i_34 = 289115251921304851378`, `i_35 = 254400180721024303524` and `Δ_x = −940335682600092973`. The special-leaf term is
`212336130412243110`, and all 66 arm terms equal `−7560098737536570631`. Every F2 number on this row is reproduced digit for
digit. On free trees, orders 1–16 reconcile with A000055. Eligible rows by order 11–16 are 5, 34, 163, 313, 528 and 2763, equal
to the controller erratum R30-E-a, with 515 rows through order 14.

**§A (WID). Re-derived; the proof is correct.** Fix `v ∈ F` with unique neighbour `s_v`, and let `j ≥ 1`. Define
`φ(B) = B ∖ {v}` on `{B ∈ I_j : v ∈ B, (B∖{v}) ∩ W_v ≠ ∅}`. The proof uses these facts, each exactly where stated:

- `s_v ∉ B`, because `v ∈ B`, `v ~ s_v`, and `B` is independent. Only adjacency is used. Simplicity is used only to make
  `v ≠ s_v`, so that `{v, s_v}` has two elements.
- `B∖{v}` is an independent `(j−1)`-set of `H_v` that meets `W_v`.
- `R_v = H_v − W_v`, because `N[s_v] = {s_v, v} ∪ W_v` (since `v ∈ N(s_v)`). So the image family has size
  `i_{j−1}(H_v) − i_{j−1}(R_v) = q_v(j−1)`. This is the `tagged_count_split` identity with `D = H`, `E = R`.
- Surjectivity: `A ∪ {v}` is independent for `A ⊆ V ∖ {v, s_v}`, and only this step uses `deg v = 1`.

The proof needs only that each `v ∈ F` has degree one. `C5LA1.leafSet` is exactly `IsGraphLeaf`, so this is the same as
`F ⊆ leafSet`. `IsTree` is never used. The hypothesis `p ≥ 1` is only a guard. At `p = 0` both sides vanish: no singleton has
an active tag, and in ℕ `0 − 1 = 0` makes the right side `q_v(0) − q_v(0)`. Leaves sharing a support are separate summands on
both sides, and `B ∋ v, v′` scores once for each active tag. That matches the per-leaf sum of `C5LA1.aggregate`.

I asserted (WID) on every eligible row to order 16 (3806 rows), on the four fixed points, on `G_4`, `G_5` and `G_6` below, and
on `T_22`'s scalar side. **(FLOW⇒SIGN)** and **(HALL⇒FLOW)** are also correct. For the clone step: given any clone subset `Y`,
let `X` be the set of sources with a clone in `Y`. Then `|Y| ≤ Σ_X w ≤ Σ_{N(X)} w = |N(Y)|`, so HALL-COND on whole sources
gives Hall's condition for every clone subset. F2's parenthetical "it suffices to check unions of whole clone classes" is this
argument, compressed.

**§B1. Correct.** F2 also silently corrects the allocation's prompt. For each `v`, the sets `B ∈ I_j` containing `v` are in
bijection with `I_{j−1}(H_v)`, where `H_v = T − {v, s_v}`, not `T − v`. So the literal difference is `Σ_v Δ_{p−1}(H_v)`. The
allocation's suggested form, `Σ_v Δ_{p−1}(T − v)`, is **false**: on path-star (2,3,4) at `p = 7` it gives −1715 against the
literal −1406. F2's form holds on all seven instances I computed. **§B2.** The frozen `C6-F5/direct_audit.py` line 81 is
`w=lambda I:sum(bool(I>>v&1) for v in tagged)`. The corrected script changes exactly that line and adds
`assert sup-cap==S` at line 112. F2's localization of the bug is exact. **§B3.** `|R_491|/|R_490| = 492/491`, the struck ratio
is `493/491`, and the deletion-only shortfall is `|R_491| − |R_490| = |R_490|/491`. All are exact (`fractions`).

**§C1 (reachability lemma). Correct; here is a complete proof.** Let `A ∈ I_p`.
- (D) preimage: `B = A ∪ {q}` with `q ∉ A` and `B` independent. One exists if and only if `A` is not maximal.
- (S) preimage: we need `u ∉ B`, `|N(u) ∩ B| = 2`, and `A = (B ∖ N(u)) ∪ {u}`. Then `u ∈ A`, and
  `B = (A ∖ {u}) ∪ {y, z}` with `{y, z} = N(u) ∩ B`. A third neighbour of `u` in `B` would lie in `A ∖ {u}`, which is
  impossible because `A` is independent. `B` is independent if and only if `y` and `z` are non-adjacent and each has no
  neighbour in `A ∖ {u}`. Equivalently, `y` and `z` are non-adjacent private neighbours of `u` relative to `A`.
- Conversely, any two non-adjacent private neighbours give such a `B` with `|N(u) ∩ B| = 2` exactly.

On a tree, two neighbours of one vertex are never adjacent. So `A` has no in-arc if and only if `A` is maximal and no `u ∈ A`
has two private neighbours. On a general graph the condition reads "two non-adjacent private neighbours"; F2 states the tree
case, which is enough here. My instrument implements the general form. It agrees with brute-force arc enumeration on **every**
target, of every weight, of every eligible row to order 16, with 0 mismatches. F2 checked four non-eligible trees.

## Attacks and findings

1. **§C2 resolved: YES (critic-derived advance, C-F2-T).** Eligible `(T, p)` do have positive-weight targets that no arc of
   (D) ∪ (S) reaches.
   - *Smallest witnesses.* An exhaustive census to order 16 with my own instrument finds none at orders 11–13, **11 eligible
     rows at order 14**, and none at orders 15–16. Each of the 11 rows has exactly one such target, of weight 2. Brute force
     agrees on all of them.
   - *The explicit family `G_k`.* Take a root `0` with a pendant leaf `1`, a support `2` carrying leaves `3` and `4`, and
     `k` pendant paths `0–a_i–b_i–c_i`. Then `n = 3k + 5`. Let `A_k = {0, 3, 4, b_1, …, b_k}` and `p = k + 3`. `G_3` is
     isomorphic to the first order-14 witness.
   - *Structure, proved for every `k ≥ 3`.*
     - `A_k` is independent and maximal. Vertex `1` is dominated by `0`, `2` by `0, 3, 4`, `a_i` by `0, b_i`, and `c_i` by `b_i`.
     - Its private vertices are `1` (private to `0`) and `c_i` (private to `b_i`). Every `u ∈ A_k` has at most one, so
       `A_k` is unreachable by §C1.
     - `w_F(A_k) = #({3, 4} ∩ F)`: each of `3` and `4` is active through the other and through `0`.
     - `α = 2k + 3`. The matching `{01, 23, a_i b_i}` and the cover `{0, 2, b_i}` both have size `k + 2`, so König gives
       `α = n − (k + 2)`.
     - Hence `3p < 2α + 1` if and only if `k ≥ 3`.
   - *Polynomials.* `I(G_k) = (1+y)(1+3y+y²)^{k+1} + y(1+y)²(1+2y)^k`, and
     `I(G_k − 3) = (1+y)(1+2y)(1+3y+y²)^k + y(1+y)(1+2y)^k`. Both equal the DP for `k ≤ 40`.
   - *Window, exact arithmetic, `3 ≤ k ≤ 1500`.* `x(G_k) = k + 1`, so `p = x + 2`, the bottom of the window. Also
     `Δ_{k+3}(G_k − 3) < 0`, so `3, 4 ∈ F`, and `w_F(A_k) = 2`. I have not proved the window part for all `k`; it is
     `bounded_computation`.
   - *Hand-checkable instance `k = 3`.* `I(G_3) = [1, 14, 78, 227, 377, 367, 210, 70, 13, 1]`, so `x = 4`, `α = 9` and
     `p = 6` is eligible. `I(G_3 − 3) = [1, 13, 66, 171, 245, 197, 88, 21, 2]` gives `Δ_6 = −67 < 0`. `F` is all six leaves,
     and `A = {0, 3, 4, 6, 9, 12}` has weight 2. The row has `S = −274` and supply/capacity 253/527. The reachable capacity is
     525, so the gap `Σ_{I_p} w − Σ_{N(I_{p+1})} w` is **2**. Flow 253 saturates.
   - *Flows on the family.* `G_4`, `G_5` and `G_6` all saturate (1542/2735, 8875/14196, 49422/73573), each with an
     unreachable gap of 2. All 11 order-14 rows saturate.
   - *What this shows.* On the eligible domain, the scalar content of (HALL) at `X = I_{p+1}` is strictly stronger than
     `S ≤ 0`, by exactly the unreachable weight. It does **not** refute (HALL): no cut is exhibited, and every such row
     saturates. The existence claim (`k = 3`) is an exact finite fact, checkable by hand from the polynomials above and by two
     computation paths (characterization and brute force). The family statement is STATED here and needs an isolated second
     read before registration.
2. **A necessary-structure lemma (critic-derived, STATED, `proved_informal` candidate).** Let `A` be an unreachable target in a
   tree. Let `P` be the outside vertices with exactly one `A`-neighbour and `M` those with at least two.
   - The maps `u ↦` (its private vertex) give a matching, so `ν ≥ |P|`.
   - Every `M`-vertex has at least 2 neighbours in `A`, and the `A`–`M` edges form a forest. So `|N_A(S)| ≥ |S| + 1` for
     every `S ⊆ M`, and Hall matches `M` into `A`. Hence `ν ≥ |M|`.
   - König gives `α = n − ν ≤ p + min(|P|, |M|)`. Counting edges gives `n ≤ 2p − 1 + |P| ≤ 3p − 1`.
   - So eligibility (`3p ≤ 2α`) forces `min(|P|, |M|) ≥ p/2`. `G_k` meets this with `|P| = |M| = k + 1`.

   This explains the scarcity of such targets, and it names the structure a (HALL) proof must route around: capacity parked on
   maximal sets whose outside is half private and half multiply-dominated.
3. **F2's Remaining obligation 1 overclaims.** It says a "no" answer "would show (HALL) is exactly equivalent, on positive-weight
   targets, to `S ≤ 0`". Even with every target reachable, (HALL-COND) quantifies over **every** `X ⊆ I_{p+1}`. Only its
   `X = I_{p+1}` instance would reduce to `S ≤ 0`. The point is now moot, because the answer is "yes", but the sentence should
   be struck.
4. **D6 misattributes the registered refutation.** The registry certificate of `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT` is
   a *singleton support block*: the special leaf has `g_v = 212336130412243110 > 0`, hence `P_s > 0 = N_s`. F2 instead cites
   "the identical concentration phenomenon" of 33 tags on 11 supports. That is C6-F4's obstruction (F2's D13), not D6's. The
   categorical distinction in D6 (global flow versus support-label-preserving injection) stands. The same-witness narrative is
   struck.
5. **D7's "same concentration story" is unbacked.** The registry certifies `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` by
   "selected T22 arm dimensions", which is a dimension count. The special leaf's positive summand makes `dim K_p > dim K_{p−1}`.
   F2 does not show that this is a concentration phenomenon. The categorical point, a rational linear map rather than an
   integral flow, stands; the narrative is struck.
6. **D11's domain claim is inverted.** The registry scope note says the witnesses of `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`
   **fail** `3p ≥ 2α + 1`. That means they lie *outside* the high tail, which is why the note is a theorem given the high-tail
   pointwise key. F2 reads the note as placing them in the high tail ("high-tail witness", line 96; §D11), and that is struck.
   D11's categorical distinction (not a network statement) survives.
7. **D8 witness reconstructed from statement text alone (critic-derived).** I evaluated
   `i_p E ≤ (p+1) i_{p+1} Q`, reading the registered statement of
   `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION` literally, on every eligible row to order 14.
   - It **fails on 508 rows**: 4 of the 5 order-11 rows, 33 at order 12, 161 at order 13 and 310 at order 14.
   - Smallest instance: the order-11 double broom (`0` adjacent to `1..7`; `1` adjacent to `8, 9, 10`) at `p = 6`. There
     `Q = 516`, `E = 1494`, and `134460 > 133644`. A separate `itertools` brute force confirms it.
   - The (HALL) network **saturates on all 508 rows**. This supplies the same-object separation F2's D8 lacked.
   - Discrepancy for adjudication: the registry calls its witness "an eligible order14 tree". Either that witness was not
     minimal, which fits the predecessor's belief that eligible trees start at order 13 (see erratum R30-E-a), or the fenced
     source's definitions differ from the registered text. I make no registry correction. D10's order-24 witness is not
     reconstructable within grant, and F2's text-only treatment is acceptable there.
8. **§E2 does not realize its own probe.** The heading reads "Supports of degree 2 / leaves sharing a support". F2's own
   evidence records `some_favorable_leaf_has_degree2_support: false`, because both supports in the 6-vertex tree have degree 3.
   I supply the missing case:
   - In `CB(1,7)`, the private leaf `c` has a degree-2 support `b`, with `W_c = {choke}`, and `c ∈ F`. Its weight turns on
     only through the choke, and that fixed point saturates.
   - The same holds for the `c_i` of `G_k`.
9. **Eligibility of F2's §E instances.** SEMANTIC-CONTRACT §1.1 requires every reported instance to be eligible.
   - §E1 (`K_{1,4}` at `p = 4`) is in the high tail.
   - §E2–E4 (the 6-vertex tree at `p = 2, 3`, with `x = 2`) are below the window.
   - F2 does not say so, while §C2 does flag its own spider as non-eligible.

   These are semantic demonstrations of weight and relation behaviour, so no number of record depends on them. They are
   non-eligible and should be labelled so.
10. **§E add-on requested by the brief (a switch inserting the support of a non-`F` tag).** No eligible row to order 16 has any
    non-favorable leaf: `F_p(T)` is the whole leaf set on all 3806 rows. So neither `F = ∅` nor a non-`F` support switch occurs
    in the eligible domain to that order. I confirm from the definitions that the relation is `F`-free: the Lean
    `transportRel` has no `F` argument, and `F` enters only through `w_F`. This is a bounded observation, not a theorem.
11. **Minor wording.** D5 says the implication's "hypothesis (zero Retag export) is refuted". In the registry the hypothesis
    **holds** (`zero_export: true`) and the conclusion fails (a positive arm gap). D9's "≥ 8 co-leaf witnesses" is garbled. The
    right reason is that any leaf in a source or target has another leaf of the same centre in the set. The conclusion
    (literal = active on `K_{1,12}`) is correct, and I computed it.
12. **D12 confirmed.** The registry's R28 witness "T22" has order 22 (`smallest_witness_order: 22`, `R(3,2)_3`). The r23 key
    `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` uses "T22" for the order-91 tree. The collision lives inside the registry
    itself, and F2's flag is correct and useful.
13. **Fidelity: no failure found.** F2's weight is active-tag (`active_weight`, `(Bs − {v}) & tag_witnesses`). Its relation
    (`relation_neighbors`) reproduces 2025/11691 arcs. `F` is fixed at `p`, `x` is computed through `α` with the pinned
    evaluator only as a cross-check, and `supply − capacity = S` is asserted. Every downstream number I re-derived agrees.

## Mechanism-equivalence and fence check

(HALL) is not any of the ten refuted keys under new notation, and F2's categorical table is sound once findings 4–6 and 11 are
applied.
- D1–D4 differ in relation (Delete/Retag or deletion only, against (D) ∪ (S)) and in demand (cardinality, against `w_F`).
- D5, D7, D9 and D10 are implications, linear maps or moment statements, with no cut object.
- D6 and D13 are local injections, against the global max-flow.
- D8 is a single-rank moment inequality. Here the separation is now exhibited on 508 rows where (HALL) saturates.

Fences:
- No closed region is re-proved. `T_22`'s orbit flow is cited and only its scalar side recomputed.
- No census value enters a proof, and there is no RTree wording.
- (LIFT) is not used to supply feasibility, and nothing claims `D, C ≥ 0` gives the budget.
- The C2 advance (finding 1) is not a cut and changes no key's status. It touches (HALL) only as a scope observation, under
  mechanism ≠ aggregate.
- Alias check for my candidates. Lexically, `unreachable`, `maximal independent`, `private neighbour` and `G_k` produce no
  collision in the frozen registry text, where F2's own lexical scan found only unrelated r25/r28 "reachability" keys.
  Mathematically, the family is a statement about the (HALL) network's reachable capacity, and no registered key concerns that.
  Keys touched: (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN, unchanged), (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`
  (OPEN; statement-level proof concurred), the primary aggregate (untouched), and the ten refuted keys plus the two named
  exclusions (all REFUTED, unchanged).

## Certification audit

- **Backed:**
  - Stage 2 seal; digest `3c6226b1…` (replayed); the eight C6-F5 numbers (own instrument and frozen `REPORT.md`/`EVIDENCE.json`);
    492/491 and 493/491.
  - `T_22`'s `n`, `α`, `x`, `|F|`, `S`, `i_34`, `i_35`, `Δ_x` and summands.
  - `K_{1,12}` "fully saturating under both weights", and "no unreachable target" on `K_{1,12}` (every 8-set of leaves is
    non-maximal).
  - "34/34 rows" and "0 mismatches" (both replayed).
  - The fixed-point `Δ_x` values −132, −61 and −285.
  - D12.
  - The literal-identity grade `proved_informal`, which I concur with.
- **Struck:**
  - D6's and D7's same-witness "concentration" narratives (findings 4–5).
  - "high-tail witness" and D11's domain sentence (finding 6).
  - D5's "hypothesis … is refuted" (finding 11).
  - §E2's claim to demonstrate "supports of degree 2" (finding 8).
  - The Remaining-obligation sentence "exactly equivalent, on positive-weight targets, to `S ≤ 0`" (finding 3).
  - §C2's "open" grade is superseded (finding 1).
- **Not independently re-checked, and not used by me:**
  - F2's reconstruction of the C6-F4 `B` (33 tags on 11 supports). It is consistent with the frozen `C6-F4/REPORT.md` text.
  - The `T_22` saturating triple (cited from C6-T5 at `bounded_computation`/`proved_informal` via LIFT).
- **"`proved_informal` for WID, FLOW⇒SIGN, HALL⇒FLOW, §B1, §C1": concur.** I re-derived all of these independently (§C1 with a
  completed proof). These are statement-level grades, and a governed award remains Stage 7's.

## Verdict

verdict: retained_narrowed

headline_resolved: no

F2's load-bearing mathematics is correct, and I re-derived all of it independently: (WID) with every hypothesis located,
(FLOW⇒SIGN), (HALL⇒FLOW), the literal-weight identity, the exact localization of both Cycle 6 errors, and the reachability
lemma. The narrowing applies to the mechanism-equivalence table's witness narratives (D5, D6, D7, D11) and to §E2's unrealized
degree-2 probe, and it strikes the Remaining-obligation overclaim. §C2, which F2 left open, is resolved "yes" by this critic.
An eligible order-14 tree has a weight-2 positive target unreachable by (D) ∪ (S), and an explicit family `G_k` continues it,
with structure proved for all `k ≥ 3` and the window checked for `k ≤ 1500`. On every such row (HALL) still saturates. In prose,
I judge the (WID) statement-level mathematics complete at grade `proved_informal`. The headline is not resolved.

## Remaining obligation

1. **Prove the window part of the `G_k` family for all `k ≥ 3`.** This means `x(G_k) = k + 1` and `Δ_{k+3}(G_k − 3) < 0`.
   A sketch: `(1+y)(1+3y+y²)^{k+1}` is palindromic of odd degree `2k + 3`, so it plateaus exactly at ranks `k+1` and `k+2`.
   The correction `y(1+y)²(1+2y)^k` is decreasing at rank `k+1` once `k ≥ 3`, and it is exponentially smaller, `O(3^k)`
   against `Θ(5^k/√k)`, below the plateau. With that proof, the family becomes a parameter-uniform `E993-R30-…` scope
   statement: "(HALL)'s reachable capacity is strictly below `Σ_{I_p} w` on infinitely many eligible rows". It needs an
   isolated second read.
2. **Adjudicate the D8 discrepancy.** The registered text fails already at order 11, while the registry names an order-14
   witness. A controller holding the frozen witness file should compare the definitions.
3. **Run the §E add-on beyond order 16,** in a family with non-favorable leaves on eligible rows, if one exists. On orders to 16,
   `F_p = leafSet` on every eligible row, and whether that holds in general is itself an open, unregistered observation.
4. **Unchanged from F2:** compose §A into the Lean skeleton (U2/Stage 7).

## Artifact inventory

Scratch: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-crit-F2-T/`.
Standard library only (`collections`, `itertools`, `fractions`, `math`, `json`, `sys`, `time`, `pathlib`). Replay: run each
script with `python3` from that directory. The arguments used were `c2_census.py 16 16`, `family.py 40`,
`family_closed.py 1500`, `nonF_count.py 16` and `e_demo.py 16`. `fixed_points.py` and `extra_checks.py` take no arguments.

| file | sha256 |
|---|---|
| `crit_lib.py` | `9532841d213b6d192a80f9683d193051efbf7e65c0cbff4fa43a59701878450e` |
| `fixed_points.py` / `.json` | `630f2c72cfed04c71a545ac0741c602068e72caf1803f332a8a659cfcb013548` / `dec557d4a6193e09726d6da88835b1f91b44e37bdf623b4cd73f0eb4c7013d35` |
| `c2_census.py` | `1b42b527e3fa5cfdcbd7f14f5f2893df6ffae58da6ded22eb02952ec62848980` |
| `c2_census_n14.json` / `c2_census_n16.json` | `8f13084e80faea776dde02152bdb73b912fe1b0690f8a43948097ab12dfd8df1` / `052f4ae2b454fcf2e134243818f1d6fdffa43bfba75e15ba4f2fb9ab6b0ceaab` |
| `extra_checks.py` / `.json` | `4fc4894a10d9e17ecc6e3bfba68f4483d4fea448b799d78d10ebdacbd0d1de4a` / `b31b8ea7b63a48d56143866e66e19f87feacf237d683372ab8dc990fbfc8ed39` |
| `family.py` / `.json` | `2305df5cc7fa835bcb21ee2869360b8f1cd42dd98d7d49c373bda5612232ebe9` / `ce040d0acf86d7fe91435af4082a3ea7450ca69b2c9f7ffffe54301ccebb5bc6` |
| `family_closed.py` / `.json` | `80659cd614e0bebdb264fa02306c7501b94c91fede22233ef592dd11a0cacf76` / `1aa77d2720a4436772c48ec4458a7ffac7c2e5e72e929f93c3f7777e248f074d` |
| `nonF_count.py` / `.json` | `5c58fc85e9992246d211768b7f47c11dbcb6968f11983de3ddb5897f5ffa443f` / `0478ff675abd7e21421a37f064445c31c2b941c893f0d529a032f26788330151` |
| `e_demo.py` / `.json` (null result) | `ac80389559259de678da43b4591575d2e54efe93f8b3b527ed1dc9c9e2a97147` / `74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b` |
| `replay/` (F2's five `.py`, copied out) and `replay/F2-EVIDENCE.json` | raw `c5f8658584eaf18a68d2644bdb1441a73de0de9fc2360c101537dc7a18f1fa88`; canonical digest printed by `f2_combine.py`: `3c6226b1…ebc186` (matches the return) |

Background jobs: none were started, so none needed to be killed.
