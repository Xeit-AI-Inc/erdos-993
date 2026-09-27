# Critique

Critic `C-U2-T` (cross-orientation, orientation T: prove) of seat `U2`, route `C2-U-02 EQUITABLE-PARTITION-LIFT-AND-CB-SWITCH-NETWORK`
(orientation U), Cycle 2 Stage 4, r30 (Erdős #993, weighted mixed-boundary transport). Date 2026-09-26.

Boot: operating within VerityOS. Booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS file was read. The session-injected `CLAUDE.md` and
auto-memory index arrived as harness context and were not opened as files. No conversation log was written, because the dispatch
confines writes to the critique path and this seat's scratch.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

Read boundary: the dispatch file (its digest was verified before reading), the protocol, and the 13 capsule members only. From the
attack briefs I read the header paragraph and the U2 section only; I located the U2 section with a `grep -n "^#"` on that one granted
file. Replays used copies of the return's inventoried artifacts: the seven `scratchpad/c2-U2-replay/*.py` files, plus
`scratchpad/c2-U2/{cb_scan.py, cb_search_small_deficient.py, cb_common.py}`, which the return cites. I ran `ls -la` once, non-recursively,
on `scratchpad/c2-U2/` and `scratchpad/c2-U2-replay/`; both directories are within the grant. I hashed three frozen files under
`sources/lower-region/`, and replays imported `sources/lower-region/inputs/ordinary_tree_checked.py` read-only with `python3 -B`, so
no bytecode was written; the post-run listing of `sources/lower-region/inputs/` shows the `.py` only. I read no other return,
critique, adjudication, root or external source, used no network and installed nothing. Read-boundary disclosures: none beyond this
paragraph.

## Identity and seal audit

- Dispatch `DISPATCH-C-U2-T.md`: SHA-256 `00c24f431db2339ef09fb782650cd3184902ee4878487a556855743850d5c5b0`, matching the wrapper. Verified
  before reading.
- Capsule `U2-PACKET-MANIFEST.json`: the inner seal, recomputed canonically (sort_keys, `(",", ":")`, no trailing newline, without
  `seal_sha256`), is **`292e6685125c9e267c082a2b39f074229ea4d83b3cb4583d9fed69a837786c54`** and matches. All 13 members match their bytes
  and SHA-256.
- Stage 4 dispatch manifest: seal `a361cd175e7c3968cdf2a8d14f92e9b2b5883b018bd72e837f54f26ce38da383`, recomputed OK. Stage 3 manifest:
  seal `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d`, recomputed OK. Stage 2 manifest: seal
  `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`, recomputed OK and equal to the protocol's value.
- Return `RETURN.md`: 40000 bytes, `3acbdd0a…f37`, matching the capsule entry.
- Digests the return lists:
  - All seven replay modules match: `run_all.py` `6ece1fda…`, `cb_common.py` `462d7a12…`, `cb_weighted_gf.py` `8e0292c5…`,
    `lift_toy.py` `671079f3…`, `cb_mechanism.py` `35c2585e…`, `coarsening_impossibility.py` `5bc9f989…`, `cb_target_rows.py` `926b14a4…`.
  - The three sources match `control/SOURCE-DIGESTS.json` when hashed directly: `ordinary_tree_checked.py` `a012bb78…`,
    `cb-switch-cut/RESULTS.json` `873cf922…`, `cb-switch-cut/run.py` `94ced046…`.
- The replay of `run_all.py` from my copy reproduces the combined digest
  **`218b5d3bf81257e3adca19d887014d537a8ed0909ad25593d45e43506b5dba4c`** exactly.
- Process records:
  - U2's own disclosures stand as filed: the `__pycache__` write under `sources/` (deleted), and one digest verified after reading.
  - New: the return's replay recipe (`cd …/c2-U2-replay; python3 run_all.py`) is not self-contained. `cb_common.py` imports
    `ordinary_tree_checked` from `sources/` via `sys.path`, so running the recipe as written recreates the `sources/` bytecode write.
    Replay needs `python3 -B`. The claim that "every module the entry point imports already sits beside it" is false.
  - No award label other than C1-LA1 and C1-LA2 is cited.

## Independent re-derivation

**Instrument (critic-authored, stdlib only, exact integers):**
- `inst/crit_inst.py` builds CB(d, m) from the recipe and runs a tree test (connected, with n − 1 edges).
- Independence polynomials `i_j(G − D)` come from a generic forest DP that uses no CB structure.
- `x` is computed through rank `α`, including the terminal zero-extension.
- `F_p` comes from `Δ_p(T − v) < 0` on the original tree.
- `S` is computed on the q-side as `Σ_{v∈F} [q_v(p) − q_v(p−1)]`, with `q_v = i(H_v) − i(R_v)` from the generic DP.
- Supply and capacity come from my own derivation of the active-weight GF:
  - `x²(1+2x)^{dm}` for the tag `v` (active iff `r, v ∈ B`),
  - plus `dm·(1+2x)·x²(1+x)^{d−1}·((1+2x)^d + x(1+x)^d)^{m−1}` for the private tags (`c` active iff its choke is in `B`).
- The GF and the generic DP were validated by literal brute force, with my own enumerator and a literal `w_F` predicate, on CB(1,2),
  CB(2,2), CB(1,4), CB(3,2) and CB(2,3). They match at every rank.
- The `K_{1,12}` fixed point at `p = 8` reproduces `α = 12`, `x = 6`, all leaves favorable, 1980 / 3960, `S = −1980`.
- Supply − capacity is compared with the q-side `S` from a different algorithm. It is also checked layer by layer: `W[p+1] = Σ_F q_v(p)`
  and `W[p] = Σ_F q_v(p−1)`.

**Rows (all `bounded_computation`):**

| row | n | α | x | eligible | F | supply | capacity | S (q-side) | supply − capacity = S |
|---|---|---|---|---|---|---|---|---|---|
| CB(2,5)/10 | 28 | 16 | 8 | yes | all 11 leaves | 259980 | 396460 | −136480 | yes (layer-level too) |
| CB(8,86)/460 | 1465 | 775 | 458 | yes | all 689 leaves | 330 digits | 330 digits | 328 digits | yes (layer-level too) |
| CB(8,89)/476 | 1516 | 802 | 474 | yes | all 713 leaves | 342 digits | 342 digits | 340 digits | yes (layer-level too) |
| CB(8,92)/492 | 1567 | 829 | 490 | yes | all 737 leaves | 353 digits | 353 digits | 351 digits | yes (layer-level too) |

- The three large rows agree digit for digit with U2's shipped `run_all_RESULT.json` and with the RETURN.md literals, for supply,
  capacity and `S`.
- CB(8,92)/492 `S` equals the frozen `cb-switch-cut/RESULTS.json` `aggregate`.
- For 86 and 89, `F_p` = the whole leaf set was checked leaf by leaf over all 689 and all 713 leaves (`inst/allleaves.py`), with no
  symmetry shortcut. This is the step U2 left as "inherited, not re-derived".

**Replays:**
- `run_all.py` gives the digest above.
- In `cb_mechanism` (CB(2,2)/5, not eligible): 41 / 152 sets, supply 76, capacity 148, `S = −72`. There are 15 / 42 orbit classes, and
  the max-flow is 76 both in the full network and in the quotient. My independent literal network reproduces 41 / 152 / 76 / 148 and the
  15 / 42 orbit counts, and gives mixed = deletion-only = 76.
- `lift_toy.py` reproduces its result. I re-derived the toy by hand: `C_4 ⊔ C_6` with sides respected has four orbits
  `{a}, {b}, {c}, {d}`. The two-class partition is equitable with `r = r' = 2`. It is strictly coarser than the `Aut` orbit partition,
  and hence than every orbit partition of any relation-preserving group, since such a group is a subgroup of `Aut`.
- `coarsening_impossibility.py` reproduces its result. My own check (`inst/witness.log`) confirms both configurations have `w = 0`, eight
  deletion arcs to weight-0 targets, and switch target weights `{1, 3}` versus `{2, 2}`.
- `cb_scan.py` (a dev copy) reproduces its output, including the defects listed under Attack 5.

**Candidate 1 (equitable-partition flow lift), re-proved:**
- (⇒) is class-wise summation. It needs only constancy of supply and capacity on classes.
- (⇐) sets `f(u,t) = F(C_s,C_t)/(|C_s|·r)` on each arc between classes with `r > 0`. For pairs with `r = 0` there are no arcs, and `F = 0`
  by the quotient-arc rule.
  - Row sum at `u`: `Σ_{C_t} r·F/(|C_s| r) = Σ F(C_s,·)/|C_s| = supply(u)` exactly.
  - Column sum at `t`: `Σ_{C_s} r'·F/(|C_s| r)`. By double counting `|C_s| r = |C_t| r'`, which is a consequence and not a hypothesis;
    also `r > 0 ⇔ r' > 0`. So the sum is `Σ F(·,C_t)/|C_t| ≤ cap(t)`.
- Integrality: the polytope `{f ≥ 0, f = 0 off R, row sums = supply, column sums ≤ cap}` is nonempty, bounded (`f ≤ supply`) and pointed.
  Its constraint matrix is a bipartite incidence matrix stacked with identities, which is TU, and the right-hand side is integral, so a
  vertex exists and is integral. Integral max-flow gives the same conclusion.
- The hypotheses used are exactly: constancy on classes, plus the two local regularity numbers. Integrality of `F` is not needed for (⇐).
- The proof is complete and correct. I agree with `proved_informal`: STATED, needing an isolated second read, with no key this cycle
  (ruling 18).

## Attacks and findings

1. **Non-falsifiable fidelity check (ruling 17). Strikes a column.**
   - `cb_target_rows.analyze` sets `S = supply - capacity` and then reports `"supply_minus_capacity_equals_S": (supply - capacity) == S`.
     This holds by construction.
   - So the table's `supply − capacity = S: yes` column is struck for CB(2,5)/10, CB(8,86)/460 and CB(8,89)/476. No shipped code
     computes `S` independently for those rows.
   - CB(8,92)/492 survives through the real byte-comparison against the frozen record. CB(2,2)/5 survives through `cb_mechanism`'s
     `S_polynomial_independent`.
   - The numbers themselves are rescued by my instrument, which computes `S` on the q-side and assigns grades on critic evidence (see
     re-derivation).
2. **CB(2,5)/10 table literals are wrong. Struck.**
   - RETURN.md prints supply `275920` and capacity `412400`.
   - U2's own shipped `run_all_RESULT.json` says `259980` / `396460`, and so do my GF and my literal network (88,506 sources, 185,256
     targets).
   - Both printed values are off by +15940. `S = −136480` is right.
3. **Hard-coded selector.**
   - `favorable_count = d*m + 1` is a constant in `cb_target_rows.py`, with a comment claiming verification.
   - The prose claim "CB(2,5)/10 … direct `O.aggregate_row` check: 11 = 11" is backed by no shipped script. The only `aggregate_row`
     call, in `cb_search_small_deficient.py`, is capped at `n ≤ 24` and never reaches `n = 28`.
   - CB(8,92)'s 737 is "recorded", not derived.
   - All four `|F|` values are now critic-derived and correct: 11, 689, 713, 737.
   - The return's reason for not checking 86/89 ("too slow") was an instrument limitation. Each `Δ_p(T − v)` is one forest DP, and 689
     of them took under a minute.
4. **Unbacked cross-check literals. Struck as shipped evidence.**
   - "Cross-checked against literal brute force on four small instances — CB(2,2), CB(2,3), CB(1,4), CB(3,2) — exact match at every
     rank" is unbacked.
   - "Cross-checked against … `forest_independence_polynomial` … on CB(8,86)" is unbacked.
   - No replay module performs either check. `cb_weighted_gf.py` says "verified against literal brute force on small instances below",
     and nothing follows.
   - The formula is nevertheless correct: it is identical to my independently derived GF, which I brute-forced on five instances.
5. **Eligibility scan defects in `cb_scan.py` and `cb_search_small_deficient.py`.**
   - Both use `hi = (2α − 1)//3` where the window's top is `⌊2α/3⌋`. This drops the top rank whenever `3 | α`, and the protocol says
     "every eligible `p` including the top of the window".
   - Replayed misses: CB(3,5)/14 (n = 38) and CB(4,4)/14 (n = 39). Both are eligible, have `F` = all leaves, and have `S` = −18375605 and
     −25335360 respectively.
   - RETURN.md says the `d ≤ 4, m ≤ 5` scan "found **no** eligible `(d, m, p)` for CB with `n ≤ 48`". The same script prints eligible
     rows at n = 28, 31, 38 and 48, and the next clause of RETURN.md names CB(2,5)/10 at n = 28. The sentence is struck.
   - The conclusion "smallest eligible CB row is CB(2,5)/10" is unaffected.
   - `cb_search_small_deficient.py` also silently drops any row whose `S` mismatches or whose `F` is not all leaves. This is a filter
     that would hide exactly the fidelity or selector events the run wants surfaced. It is recorded, and no reported number depends on it.
6. **Candidate 2 is overclaimed, and its witness lies off the flow-relevant network.**
   - The exact content is correct. On CB(5,2), sources `A` and `B` share the marginal totals, yet their switch arcs reach targets of
     weight `{1, 3}` versus `{2, 2}`.
   - A sharper form holds for every admissible equitable partition, not just for marginal totals. Capacity must be constant on target
     classes, so target classes refine weight classes. `A` has one arc into weight-3 targets and `B` has none, so every admissible
     equitable partition separates `A` from `B`.
   - But `w(A) = w(B) = 0`: both are zero-supply sources. Deleting zero-supply sources and zero-capacity targets changes neither
     saturating-flow existence nor (HALL-COND), since zero-supply members add nothing to `Σ_X w` and zero-capacity targets add nothing
     to `Σ_{N(X)} w`. A lift only needs equitability on the reduced network, so the witness says nothing about lift granularity.
   - Struck:
     - the proof-text sentence "Hence any equitable partition of this relation must resolve at least the per-arm `(a_i, b_i)` …
       confirming that '54 branch types' is … the genuine minimal granularity",
     - the `coarsening_impossibility.py` docstring "no partition strictly coarser than the full per-arm-type … histogram is equitable".
     Both contradict the return's own scope note, which I endorse.
   - Grade: `bounded_computation` for the narrowed statement, "the marginal-totals partition of the full network is not equitable".
   - Critic replacement (C-U2-T, `bounded_computation`): see "Critic-derived results" below. On the reduced network, the coarsest
     equitable partition coincides with the orbit partition on sources.
7. **Orbit-space literal is misattributed.**
   - `C(m + 53, 53)` counts multisets of `m` branch types over all ranks, ignoring the head `(r, s, v)`. It is not the orbit count of
     the network.
   - The binomials themselves are exact: `C(139,53)`, `C(142,53)`, `C(145,53)` all match. The 54 types are confirmed: 9 with the choke
     present, by leaf count 0–8, plus 45 with the choke absent, `(a, b)` with `a + b ≤ 8`.
   - The actual source-layer orbit counts are `|I_{p+1}/Aut|`:
     - 32679711368341187783680131875634392813 (86/460),
     - 130767212724564223897917583833021519977 (89/476),
     - 504442749902778247863465882195112269919 (92/492).
   - Target layers are of the same order.
   - These come from a multiset GF over the 54 typed ranks and five head states (`inst/orbits.py`). The same DP reproduces my
     brute-force orbit counts on six small networks, for example 15 / 42, 101 / 140 and 432 / 644.
   - "Orbit space has exact size `C(m+53,53)`" is struck as an orbit count. "Out of reach" stands, since 10^37–10^38 orbits per layer.
8. **(LIFT) is mischaracterized. The distinction stands, but its wording is corrected.**
   - The return says (LIFT)'s proof "needs supermodularity … plus an invariant-maximizer argument" and that Lemma 1 is "a different,
     strictly simpler tool for a different task". Per SEMANTIC-CONTRACT §1.2, (LIFT) is the lifting direction: a saturating orbit-quotient
     flow lifts. The supermodular maximizer belongs to its converse and to (INV).
   - Candidate 1 is the same task with a weaker hypothesis. The orbit partition of any finite group preserving the relation, supplies
     and capacities is equitable, so (LIFT)'s lifting statement is the special case. Candidate 1 generalizes it.
   - Attribution: (LIFT) is Codex's. The generalization is U2's. The lemma is of a standard LP-reduction type, so its novelty lies in
     the hypothesis weakening, not in the method.
9. **Checked and passed.** Quantifiers: Candidate 1 has none over `X`, and U2 claims no (HALL-COND) anywhere. No natural-number
   subtraction arises. There is no circularity. `supply − capacity = S` is not used to prove itself anywhere except the struck
   column in finding 1.

**Critic-derived results (C-U2-T; attributed to this critic):**

- **(C1) Cut-form converse for equitable quotients** (STATED; proposed `proved_informal`; needs an isolated second read). Assume
  Candidate 1's hypotheses. For any set `X_Q` of source classes, let `X := ⋃ X_Q`. Then:
  - `N(X) = ⋃ {C_t : r(C_s, C_t) > 0 for some C_s ∈ X_Q}` exactly.
    - ⊆: an arc from `u ∈ C_s` into `C_t` forces `r(C_s,C_t) > 0`.
    - ⊇: `r > 0` gives `r' = |C_s| r/|C_t| > 0`, so every `t ∈ C_t` has `r' ≥ 1` neighbours in `C_s ⊆ X`.
  - Therefore `Σ_X supply − Σ_{N(X)} cap = Σ_{X_Q} |C_s|·supply(C_s) − Σ_{N_Q(X_Q)} |C_t|·cap(C_t)`.
  - Consequence: (HALL-COND) on the original network ⇔ (HALL-COND) on the quotient with clone weights. (⇒) holds by this identity;
    (⇐) follows from Candidate 1 and max-flow/min-cut.
  - A quotient deficit therefore yields an exhibited class-union original cut with the same deficit, and no group or supermodularity
    argument is needed. This is exactly what ruling 16 requires before an equitable-quotient deficit may be used. U2 did not state it.
- **(C2) The equitable lift gains nothing over orbits on CB networks** (`bounded_computation`, `inst/refine*.py`). I ran colour refinement
  from (side, weight). This yields the coarsest partition with constant supply and capacity that is equitable for (D) ∪ (S). I ran it
  on literal networks.
  - On the flow-relevant reduced network (`w > 0` on both sides): CB(2,2)/5, CB(2,3)/6, CB(3,2)/6, CB(2,3)/7, CB(1,4)/6, CB(5,2)/7 and
    CB(3,3)/8 give coarsest-equitable source classes equal to the `Aut(T)` orbit counts: 15, 71, 35, 40, 17, 104, 194. Target classes are
    equal too, except CB(1,4)/6 at 37 against 38.
  - On the full eligible row CB(2,5)/10 the counts are equal on both sides: 432 / 644.
  - Every admissible equitable partition refines the colour-refinement result. So on these instances the orbit partition is the unique
    minimal admissible equitable partition on sources. This answers the return's open item 4 at bounded scope.
  - It also closes branch (i) of its item 1 at bounded scope: no coarser equitable reduction exists on any tested CB network. A route at
    the three target rows must be non-equitable (branch (ii)) or a direct proof.
- **(C3) First exact full-network flow on an eligible CB row** (`bounded_computation`; `inst/refine_RESULT_2-5-10.json`).
  - CB(2,5)/10 has 88,506 sources, 185,256 targets and 1,317,906 literal (D) ∪ (S) arcs, with supply 259,980 and capacity 396,460.
  - Mixed max-flow is 259,980, which saturates. Deletion-only max-flow is also 259,980, so switch arcs are not load-bearing there.
  - This is consistent with the P8 criterion: `3p = 30 ≥ 2dm + 5 = 25`, so the sector is not deletion-deficient. It does not meet
    obligation (c).

## Mechanism-equivalence and fence check

- No refuted key is revived:
  - Candidate 1 and (C1) are generic statements about bipartite capacitated relations and assert no Hall property for any tree
    relation.
  - Candidate 2 is a granularity fact.
  - No deletion-only statement is made as a mechanism. The deletion-only flows (CB(2,2)/5 in U2's replay, CB(2,5)/10 in mine) are
    diagnostics, not a Hall claim, and are not `E993-R23-LITERAL-DELETE-ONLY-HALL`: they use the active weight, and the mixed relation is
    also computed.
- (LIFT) is not treated as supplying quotient feasibility. U2 computes no target-row quotient flow at all.
- `D, C ≥ 0` is not used. No census value appears in a proof, no RTree wording is used, and no closed region is re-proved: the CB rows
  are in the lower region with `2p + 3 ≤ n ≤ 4p − 8`, for example 1465 ≤ 1832.
- The (HALL) and primary keys keep their master names.
- The proposed `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT` does not collide with any registry key I can see. The capsule carries no registry,
  so I did not check the registry myself, and U2's collision search is a self-report.
- Note for alias control: `…-FLOW-LIFT` sits lexically beside `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`. Mathematically it is a strict
  generalization of that key's lifting direction (finding 8), not an alias. The face should say so.
- `E993-R30-CB-TRANSPORT-EQUITABLE-PARTITION-RIGIDITY` should not register in its current wording (finding 6). If it registers at all, it
  should be as the narrowed marginal-totals statement or as the reduced-network (C2) record.

## Certification audit

| Literal | Status |
|---|---|
| Seals: Stage 2 `2bf054d6…`; module digests; source digests; combined digest `218b5d3b…`, "identical on two runs" | **backed** (recomputed / replayed) |
| Candidate 1 proof, "iff", "no finite group" | **backed** (re-proved) |
| "sharper than (LIFT)'s task / different task" | **corrected** to "generalizes (LIFT)'s lifting direction" (finding 8) |
| Toy: 4 orbits, 2-class equitable, `f ≡ 1/2`, perfect matching | **backed** |
| CB(2,2)/5: 41 / 152, 76 / 148, `S = −72`, 15 / 42 classes, "verified equitable", flows 76 / 76, deletion-only 76 | **backed** (replay + independent literal network) |
| CB(8,86)/460, CB(8,89)/476, CB(8,92)/492 supply / capacity / `S` values | **backed by critic instrument** (the return's own check is non-falsifiable) |
| `supply − capacity = S: yes` column (the three rows without an independent `S` in shipped code) | **struck** (ruling 17) |
| CB(2,5)/10 supply `275920`, capacity `412400` | **struck** (correct: 259980 / 396460) |
| `|F|` = 11 / 689 / 713 / 737, "independently confirmed … 11 = 11" | values **critic-backed**; the "independently confirmed" literal is **struck** (no shipped check) |
| "cross-checked against literal brute force on four small instances"; "`P(x)` tree-DP cross-check on CB(8,86)" | **struck** as shipped evidence (no code); the formula is correct on critic evidence |
| "byte-identical" CB(8,92) `S` vs frozen `RESULTS.json` | **backed** |
| "scan found **no** eligible CB with `n ≤ 48`" | **struck** (the script's own output lists four) |
| "smallest eligible CB row is CB(2,5)/10, n = 28" | **backed** |
| 54 branch types; `C(139,53)`, `C(142,53)`, `C(145,53)` as integers | **backed** |
| "orbit space has exact size `C(m+53,53)`" | **struck** as an orbit count (correct per-layer counts in finding 7) |
| Candidate 2 exact witness | **backed**; "hence any equitable partition must resolve per-arm / genuine minimal granularity" **struck** |
| "every module the entry point imports already sits beside it" | **struck** (imports from `sources/`; replay needs `-B`) |
| "No background job was left running" | not re-verifiable by a critic; no contrary evidence |

## Verdict

verdict: retained_narrowed
headline_resolved: no

Retained:
- Candidate 1, the equitable-partition flow lift (iff), whose mathematics I judge complete: grade `proved_informal`, STATED, needing an
  isolated second read. Its (LIFT) relation must be restated as a generalization.
- The exact supply, capacity and `S` values at CB(8,86)/460 and CB(8,89)/476, as `bounded_computation` on critic-instrument backing.
- The CB(8,92)/492 byte-match.
- The toy witness, the CB(2,2)/5 mechanism check, the 54-type count, and the honest statement that obligation (c) was not achieved.

Narrowed:
- Candidate 2, to the marginal-totals statement (finding 6).
- The orbit-space wording (finding 7).

Struck:
- The non-falsifiable fidelity column, the CB(2,5)/10 literals, the unbacked cross-check literals, and the false "no eligible `n ≤ 48`"
  sentence.

The route verdict `bounded_evidence` is fair. Under ruling 17 the return's own fidelity column fails, but the headline numbers survive
on independent evidence, so the result is narrowed, not rejected.

## Remaining obligation

1. **Target rows (unchanged, and still the route's object).** For CB(8,86)/460, CB(8,89)/476 and CB(8,92)/492, either:
   - a saturating integral flow of the full (D) ∪ (S) network, or
   - an exhibited `Aut(T)`-invariant or class-union deficient cut `(X, N(X), both sums)`.
   Neither exists yet.
   - By (C2), an equitable reduction coarser than orbits does not exist on any tested CB network, so the successor should not look for
     one (the return's item 1(i)).
   - The per-layer orbit counts of 10^37–10^38 rule out orbit enumeration.
   - What remains is a non-equitable certificate: an explicit fractional flow in closed form over branch-type generating functions, or
     an LP dual (potential) certificate built one branch at a time, verified by Candidate 1 and (C1) only where exact equitability holds.
     Alternatively, a direct Hall proof (T1's object).
2. **Second reads before any registration (ruling 18):**
   - Candidate 1, with the (LIFT) wording corrected.
   - (C1), the cut-form converse: a critic-derived statement needing its own isolated read.
   - Candidate 2 only in narrowed form, or not at all.
3. **Repairs to the U2 instruments before they are reused:**
   - Compute `S` on the q-side for every row.
   - Derive `F_p` rather than hard-coding it.
   - Use `⌊2α/3⌋` for the window top.
   - Replace silent filters with assertions.
   - Make the replay self-contained, or run it with `-B`.
4. The newly surfaced eligible top-of-window rows CB(3,5)/14 and CB(4,4)/14 are small (n = 38, 39). They are available as brute-forceable
   eligible CB rows for any successor's mixed-flow validation.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-crit-U2-T/`. I ran everything
with `python3 -B` from inside my scratch; stdlib only; no network. Background jobs PID 37471 (`allleaves.py`) and PID 38086 (`refine.py
2,5,10`) both exited on completion and were confirmed gone by literal PID before this write. No job is running.

| File | SHA-256 | Role |
|---|---|---|
| `seal_check.py` | `a7c9aaae8a1c0a413f30e2427b6a0f1acbd5414684cb540133681bdb3297c26c` | capsule/stage seals + member digests |
| `inst/crit_inst.py` | `4aaca8a8451830caec97f4850ce358d5bce7be50fe832cb43247c137b29eccb6` | independent instrument (generic DP, q-side S, selector, own GF, brute validation) |
| `inst/crit_inst_RESULT.json` | `b5cd37d274cfbdef58d522cc0df0ec9135912c4f91451cb819b51bbfeb9a8623` | rows + validations (canonical digest printed `6c433cb5…1933`) |
| `inst/allleaves.py` / `allleaves_RESULT.json` / `allleaves.log` | `9fb89ad17612c11521532d4d971b0819d943fe053c4f973062af672b4e60dc04` / `17829b548e6e170448d4165eaffc80e8ed608a12023fe8f9899e0a4449249fae` / `1a0bb63c018745f74e6d57d9e4f8e57393ae5656c6acd10474a479335920326a` | leaf-by-leaf `F_p` for 86/460 and 89/476 |
| `inst/orbits.py` / `orbits_RESULT.json` | `d7f26ce26aa1a4ad3d300f97ea0cd54bd9cc8ca0f4b392f76b3cde0bf17a81eb` / `d12aa00fb52f4cef2f22445eecda3761813813130c0a4fe72d9fdd6414bcab81` | exact per-layer `Aut(T)` orbit counts |
| `inst/refine.py` | `6ab2386f573faa3947d9a816798e99a63d7ceef4434aa0548efd93661bfeb646` | literal network, colour refinement, orbit keys, Dinic max-flow (mixed + deletion-only) |
| `inst/refine_RESULT_2-2-5_2-3-6_3-2-6_2-3-7_1-4-6.json` | `346ee77f1a86500576cdf288563e82f14b0077b7c437125f4136198fd75cc283` | full-network runs |
| `inst/refine_RESULT_2-5-10.json` / `refine_cb25.log` | `2b0f7b95dfb4c2282e149bd7e69b5915ff56e5fb04279460c7c9a248a64d4eb7` / `484019971625197099f9d3fe08686660eff964556c35eff0a0e26e0bfc4399cc` | eligible CB(2,5)/10 full network (C3) |
| `inst/refine_reduced.py` / `refine_reduced_RESULT.json` | `8d4430b53a89c52d2addec73238751056b7bb996c72d7279259d88edcc1497bb` / `1ec538b70af70f9e5d07a5c4f20c02aeb19e1c7460371a4d08cef1f8f52cd61d` | flow-relevant reduced networks (C2) |
| `inst/witness.log` | `70d87923c711d8b83265fc167551f1d55175c53d3759d6ee1642f20d2d6c7d1a` | independent Candidate 2 witness check |
| `inst/scan_topwindow.log` | `c072d972543096b2af407cd77aa332063df29a550f9c54264fee66da58a8e982` | window-top omissions + two new eligible rows |
| `replay/` (7 U2 modules, unmodified bytes) + `run_all_RESULT.json` | `c98006372f6e3fae2e31e6f694e068370ab45d59aeba2c93e03d4d597e078c61` | copy-out replay; combined digest `218b5d3b…ba4c` |
| `replay_dev/` (`cb_scan.py`, `cb_search_small_deficient.py`, `cb_common.py` copies) | (U2 bytes) | dev-script replay (finding 5) |

