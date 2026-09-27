# Critique

Critic `C-U2-T` (orientation T, prove), Cycle 3 Stage 4, r30 (Erdős #993, weighted mixed-boundary transport). Assigned return:
seat `U2`, route `C3-U-02 PRODUCT-FORM-FLOW-CERTIFICATE-ON-CB-ROWS` (orientation U), `cycles/cycle-3/stage3/returns/U2/RETURN.md`.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and I followed the dispatch's order: the dispatch digest was checked first, then
the boot, the protocol, the capsule and its members. I did not load any other VerityOS subsystem. The harness injected the repository
`CLAUDE.md` and the user auto-memory index into context without my reading them; I used neither as evidence.

**Model disclosure.** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

| Object | Stored | Recomputed / checked | Result |
|---|---|---|---|
| Dispatch `control/dispatch/c3-stage4/DISPATCH-C-U2-T.md` | `c493e34a…fa53c58` (wrapper) | `shasum -a 256`, before reading | match |
| Capsule seal `U2-PACKET-MANIFEST.json` | `b6a8bca6a22ba207a81f4c9ea64e1f58605171aec674bdd4d5e42f5b0058fbd4` | canonical JSON minus `seal_sha256` (sort_keys, `(",",":")`, no newline) | **match** |
| Capsule members (14) | bytes + sha256 per manifest | recomputed | 14/14 match |
| Stage 2 packet seal | `5df4c603…52416` | recomputed | match |
| Stage 3 packet seal (capsule member) | `64c6c84a…294797` | recomputed | match |
| Stage 4 dispatch manifest seal | `b57e5de1…7ca3c7` | recomputed | match |
| Return `RETURN.md` | `7970cdbf…91a72b` (capsule) | recomputed | match |
| Return-listed module digests (`tree_lib.py 19247e63…`, `network.py 6fa12483…`, `cb_gf.py 563e43cc…`, `run_all.py 5821cc5e…`, `run_all_RESULT.json ac432c7c…`) | return table | recomputed in `c3-U2-replay/` and `c3-U2/` after copy-out | all match; the dev and replay copies are byte-identical |
| Replay digest `20a48614b9555fb44183cb7a1bde8a0f709ee5444d9c3b92fe1a6ffcfbf387c9` | return | my copy-out replay (`python3 -B run_all.py`, 13.8 s) | reproduced; the regenerated `run_all_RESULT.json` is byte-identical to the shipped one |
| Frozen `sources/lower-region/instruments/cb-switch-cut/RESULTS.json` | `873cf922…d5d5` (`SOURCE-DIGESTS.json`) | digest checked before I read it | match |
| U2's own dispatch digest `a24d3948…` (`control/dispatch/c3-stage3/DISPATCH-U2.md`) | return | not checked: the file is outside my read grant | unverified by me |

**Read-boundary and process audit of the return.**
- **The controller's record contradicts the return.** `control/C3-STAGE3-READ-BOUNDARY-DISCLOSURES.json` and the attack brief both say
  that U2 reports "none … no background jobs left". The return in fact discloses two items. The first is one non-recursive
  `ls -la <run root>/scratchpad/`, which sits above the seat's grant (§ Read-boundary disclosure). The second is one auto-backgrounded
  enumeration job (harness task `bnr4rdn4b`), stopped with `TaskStop` by task id. That is not the charter's literal-PID kill, but it is
  the same class as F2's recorded incident. The controller record should be corrected. U2's disclosure itself is adequate.
- The return reports two `find` checks. One is `find sources -newer … -type f`, which is rooted inside the grant. The other is
  written `find … -iname "__pycache__"`, and its root is not stated. I cannot tell whether it was rooted above the grant, so it is flagged
  as unresolved, not as a finding.
- My own `find` over `sources/` for `__pycache__` and `*.pyc` found nothing. No bytecode exists in `c3-U2/` or `c3-U2-replay/`, and my
  replay created none.

**My own read boundary.** I read the capsule members; the frozen `cb-switch-cut/RESULTS.json` under `sources/`, which is authorized
and was digest-checked first; and U2's inventoried scratch directories, using two non-recursive `ls` calls on `scratchpad/c3-U2/` and
`scratchpad/c3-U2-replay/` followed by a copy-out. My one `find` was rooted at `sources/`, which is inside the grant. I read no other
return, critique, adjudication, Cycle 1/2 record or experiment root. I used no network and installed no packages. No background job was
started: every computation ran in the foreground.

## Independent re-derivation

**Instrument.** I wrote my own instrument, standard library only, in `scratchpad/c3-crit-U2-T/`. It is built from SEMANTIC-CONTRACT
§1.2 and never imports U2's modules.
- **`crit_lib.py` (tree side):** tree builders; a union-find acyclicity test plus a BFS connectivity test; the independence polynomial by
  a rooted DP that groups identical siblings.
- **`crit_lib.py` (weight polynomial):** `Σ_B x^{|B|} w_F(B)` comes from a **dual-number DP** that decides tag activity literally. For
  each non-member vertex `s` it carries two states, "parent in `B`" and "parent not in `B`". A tag child in `B` is inactive exactly when it
  is the only neighbour of `s` in `B`. This DP does not use (WID), U2's closed form, or the `H_v/R_v` polynomials.
- **`crit_lib.py` (rank data):** `x` is computed through rank `α`. `F_p` is derived from `Δ_p(T − v)` on the original tree for every leaf
  automorphism class, and the classes come from rerooted canonical forms. `S` is computed from the `H_v/R_v` deletion polynomials, so
  supply − capacity and `S` come from independent computations.
- **`net.py`:** literal enumeration, literal weights and literal (D) ∪ (S) targets; an iterative Dinic solver; and an independent
  flow-certificate checker. The checker has its own relation test `in_relation` and verifies integrality, arc membership in (D) ∪ (S),
  independence and size of both endpoints, exact saturation of every supply, and every capacity.

**Validation before trust.**
- 400 random labelled trees (`n = 3..15`) with random tag sets `F`: the count polynomial and the weight polynomial match exhaustive
  enumeration at every rank, with **0 mismatches**.
- 8 CB/CBstar shapes, each with two tag sets: literal match at every rank.
- Contract fixed points reproduced:
  - `K_{1,12}/8`: 13 / 12 / 6, 12 favorable, 1980 / 3960, `S = −1980`.
  - Path-star `(2,3,4)/7`: 15 / 11 / 5, 10 favorable, 1483 / 2701, `S = −1218`.
  - Path-star `(2,2,4,3)/8`: 18 / 13 / 6, 12 favorable, 8033 / 13467, `S = −5434`.
  - `CB(8,92)/492`: `n = 1567`, `α = 829`, `x = 490`, 737 favorable, `S < 0`, and my `S` equals the frozen `aggregate` string exactly.

**Fidelity (duty 2), checked against U2's code and against my instrument.**
- **Weight:** U2's `network.active_weight` counts `v ∈ F ∩ B` with `(B∖{v}) ∩ W_v ≠ ∅`, which is active tags only. It is not `|F ∩ B|`.
- **Relation:** `relation_targets` and `build_flow_network` build exactly (D) ∪ (S). The switch test is `u ∉ B`, `|N(u) ∩ B| = 2`.
- **Selector:** `F` is fixed at rank `p` from `Δ_p(T − v)` on the original tree. It is computed per leaf on the brute-force rows and per
  orbit representative on the formula rows, and both are correct.
- **`x`:** computed through rank `α`.
- **`supply − capacity = S`:** asserted from independent sides on every CB row. It is **not asserted on the `CBstar(2,2,2)` rows**
  (finding 3).
- **Notation:** U2 writes `Aut(CB(d,m)) = S_m ≀ S_d`, while the allocation writes `S_d ≀ S_m`. The group meant is `S_d^m ⋊ S_m`. Only the
  transitivity on private leaves is used, and that is correct.

**Every row U2 reports, re-derived (all values equal U2's shipped values exactly):**

| row | n | α | x | eligible | \|F\| | supply | capacity | S | my deletion-only / full max-flow |
|---|---|---|---|---|---|---|---|---|---|
| `CB(1,7)/10` | 24 | 15 | 8 | yes | 8 | 29,190 | 58,002 | −28,812 | 29,190 / 29,190 |
| `CB(2,5)/10` | 28 | 16 | 8 | yes | 11 | 259,980 | 396,460 | −136,480 | 259,980 / 259,980 |
| `CB(2,2)/4` | 13 | 7 | 4 | no (window [6,4]) | 5 | 148 | 116 | +32 | 116 / 116 (whole network) |
| `CB(3,5)/13` | 38 | 21 | 11 | yes | 16 | 38,064,305 | 54,292,890 | −16,228,585 | — |
| `CB(3,5)/14` | 38 | 21 | 11 | yes | 16 | 19,688,700 | 38,064,305 | −18,375,605 | — |
| `CB(4,4)/14` | 39 | 21 | 12 | yes | 17 | 33,933,216 | 59,268,576 | −25,335,360 | — |
| `CB(8,86)/460` | 1465 | 775 | 458 | yes | 689 | 330 digits | 330 digits | −(328 digits) | — |
| `CB(8,89)/476` | 1516 | 802 | 474 | yes | 713 | 342 digits | 342 digits | −(340 digits) | — |
| `CB(8,92)/492` | 1567 | 829 | 490 | yes | 737 | 353 digits | 353 digits | −(351 digits), equal to the frozen `aggregate` | — |

- **Independence of the sides at the `CB(8,·)` rows.** My supply and capacity come from the dual-number DP, independently of U2's
  closed form. My `S` comes from `H_v/R_v`. All three sides agree exactly, which confirms the controller's small-row values.
- **What U2's own check covers there.** At the big rows U2 checks only that the difference of its closed-form totals equals the
  `H_v/R_v` aggregate. That check is falsifiable, but on its own it does not validate each total separately. My DP does.
- **`Δ_x`, `Δ_{x−1}` literals.** `CB(1,7)`: −12,683 / 2,406. `CB(2,5)`: −7,840 / 70,021. `CB(3,5)`: −973,815 / 7,227,452. `CB(4,4)`:
  −10,466,698 / 5,365,734. All are reproduced.

**Candidate 1: the whole-network weight generating function, re-derived by hand.**
- Case `r ∈ B`: `s` and every choke are excluded. `v` is free and active iff present, since `W_v = {r}`. Each private tag is inactive
  because its only witness, its choke, is absent. This case contributes `x(1+yx)(1+2x)^{dm}`.
- Case `r ∉ B`: the arm `{s, v}` contributes `(1+2x)` with weight 0. Each branch contributes either `(1+2x)^d` (choke excluded, weight 0)
  or `x(1+yx)^d` (choke included: its supports are out and every present leaf is active through the choke).
- Differentiating in `y` at `y = 1` gives `W(x) = x²(1+2x)^{dm} + m·d·x²(1+x)^{d−1}(1+2x)·Br(x)^{m−1}`, which is exactly the formula in the
  return.
- Sweep against my literal DP with `F` = the full leaf set, `d, m ∈ 1..8`, every rank: **3,200 coefficients, 0 mismatches**.
- The form U2 quotes for Cycle 2's formula is algebraically identical to this one, since `D^m = (1+2x)^{dm}` and
  `ML = d x²(1+x)^{d−1}`. I cannot check the quotation itself, because Cycle 2 U2's file is outside my grant.

**Candidate 2 (`CB(2,2)/4`, restricted to the root-plus-arm sector `X_sec`), re-derived.**
- `|X_sec| = 32`, and every member has weight 1.
- Deletion-only: max-flow 24, so the maximum subfamily deficit is 8, and the whole sector already attains it (positive-weight deletion
  neighbourhood 24).
- (D) ∪ (S): max-flow **32**. My extracted flow passes the independent certificate checker: 32 flow-carrying arcs, 8 of them switch arcs
  carrying 8 units.
- Every saturating flow must send at least 8 units along switch arcs, because the positive-weight deletion targets hold only 24 in total.
  U2's "8 switch arcs" is therefore the forced minimum, realized.

## Attacks and findings

1. **The digit-count certification literals for the three `CB(8,·)` rows are wrong.** 11 of U2's 15 annotations disagree with the
   values its own generator writes:

   | row | quantity | U2 wrote | actual |
   |---|---|---|---|
   | `CB(8,86)/460` | `Δ_x` | 330 digits | 326 |
   | `CB(8,86)/460` | supply / capacity | 352 / 352 | 330 / 330 |
   | `CB(8,86)/460` | `S` | 351 | 328 |
   | `CB(8,89)/476` | `Δ_x` | 340 | 337 |
   | `CB(8,89)/476` | supply / capacity | 363 / 363 | 342 / 342 |
   | `CB(8,89)/476` | `S` | 362 | 340 |
   | `CB(8,92)/492` | `Δ_x` | 352 | 349 |
   | `CB(8,92)/492` | supply / capacity | 369 / 369 | 353 / 353 |
   | `CB(8,92)/492` | `S` | 369 | 351 |

   The `Δ_{x−1}` digit counts (327, 338, 350) are correct. The return also says no literal was "typed in by hand" apart from two
   cross-check quotes. These annotations were typed by hand and are wrong. **Struck.** The underlying values are correct (exact string
   equality with my instrument).

2. **U2's paraphrase of `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` is false as written, and its "corroboration" is mostly outside
   the key's scope.**
   - **The broadened paraphrase.** The return says "`t ≥ 2`: the sector is never deletion-deficient at any rank" (line 254). The
     registered statement, as the allocation carries it, is scoped to **eligible ranks**. My exact max-flow scan over `t ∈ {2,3}` finds
     deletion-deficient sector subfamilies at non-eligible ranks: `CBstar(1,1,2)/2` (deficit 2), `CBstar(1,2,2)/3` (3),
     `CBstar(2,1,2)/3` (3) and `CBstar(1,1,3)/2` (3). The explicit family at `CBstar(1,1,2)/2`: `n = 7`, `x = 2`, `α = 4`, `F_p` is all 3
     leaves. `X = X_sec = {rvb, rvc₁, rvc₂}` has `Σ_X w = 3`. The only positive-weight neighbour, under either relation, is `{r, v}` of
     weight 1.
   - **The key itself stands.** No eligible row in my scan is deficient: `CBstar(2,2,2)/7`, `CBstar(1,2,3)/6` and `CBstar(1,4,2)/8`
     all have deficit 0.
   - **Scope of U2's rows.** U2 tested `p = 5, 6`, which are non-eligible (window [7,7]), so they corroborate nothing about the key.
   - **What U2 actually checked.** U2's check was the single whole-sector inequality `cap(N_D(X_sec)) ≥ w(X_sec)`, not Hall for every
     subfamily. A single-family inequality is not (HALL-COND). "Confirmed … by direct Hall-condition computation" is therefore struck.
   - **The conclusion still holds, on my evidence.** My exact max-flow gives the maximum deficit over every subfamily at `p = 5, 6, 7`.
     It is 0 in all three cases, both deletion-only and under (D) ∪ (S).

3. **`CBstar(2,2,2)` at `p = 7` is an eligible row, and U2 did not identify it or report its row data.**
   - Its data: `x = 5`, `α = 11`, window [7,7], `n = 17`, `|F| = 9` (all leaves), supply 2,194, capacity 3,888, `S = −1,694`. The sides
     match (DP and `H_v/R_v`).
   - The return flags only `p = 5, 6` as non-eligible. Its `cbstar_corroboration` computes no `S` and no `|F|` and asserts nothing about
     `supply − capacity`. That breaches the shared rule that every instance asserts `S` and every eligible row carries full row data. It
     is a procedural fidelity breach. The weight and relation were literal, so the numbers are not corrupted: U2's whole-sector sums
     435/696, 504/1154 and 298/972 equal mine.
   - My whole-network result for this eligible row: deletion-only saturates at 2,194, and the certificate checks with 0 switch arcs.
     This is a **critic-derived** bounded row: a non-CB-shape (`t = 2`) eligible row that saturates with deletion arcs alone. It is
     `bounded_computation`, not evidence for (HALL).

4. **Candidate 2 is correct at its exact scope, and the return keeps it there.**
   - It is a subfamily statement (`X_sec`) at a non-eligible rank of a tree that has no eligible rank. Lines 259–286 and 395–404 say so
     explicitly and never present it as switch-necessity on an eligible row. Confirmed.
   - Two narrowings:
     - (a) The deletion-only half (32 against 24, deficit 8) equals the sector-deficit formula quoted in the allocation,
       `C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1}`, at `t = 1`, `M = 4`, `k = 3`. Only the (D) ∪ (S) saturation is new content.
     - (b) At the whole-network level of `CB(2,2)/4`, switch arcs change nothing: both max-flows are 116, which equals the capacity.
   - The priority phrase "the first small … instance in this run" cannot be backed within my grant and is struck. The instance itself
     stands at `bounded_computation`.

5. **Critic-derived: the sector's switch rescue is not uniform, so Candidate 2 does not generalize without the eligibility window.**
   - **(i) Lemma (C-U2-T, `proved_informal` on this face).** In `CB(1,m)`, every (S)-target of a root-plus-arm source has active weight 0.
     *Proof.* For `B ⊇ {r, v}` with no choke in `B`, the only vertices outside `B` with exactly two neighbours in `B` are `s` and chokes
     `u_i` whose single support is in `B`. The target `(B∖{r,v}) ∪ {s}` contains no active tag: `v` is absent, and every private tag's only
     witness is its absent choke. The target `(B∖{r, b_i}) ∪ {u_i}` has `v` inactive, since `r` is gone. With `d = 1`, branch `i` has no
     other private tag, and every other private tag is inactive because its choke is absent. Hence the sector's (D) ∪ (S) Hall condition
     equals its deletion-only condition. ∎
   - **(ii) Whole-sector sums for `CB(d,1)`.** Take rank `p = k+1` with `2 ≤ k ≤ d` and `F_p` equal to all leaves. Then
     `Σ_{X_sec} w = 2^k·C(d,k)` and `Σ_{N(X_sec)} w = C(d,k−1)·(2^{k−1} + k − 1)` under (D) ∪ (S). The `k − 1` counts the private tags
     activated by the entering choke. By the same case analysis, the only positive-weight targets are the deletions `{r,v} ∪ R'` of
     weight 1 and the choke switches `{v, u} ∪ C'`, where `|C'| = k − 1` and the weight is `k − 1`. This matches the literal computation on
     all 15 rows with `d = 2..7` where `F_p` = all leaves (`cbd1_RESULT.json`).
   - **(iii) Explicit (D) ∪ (S)-deficient sectors, all non-eligible:**

     | row | Σ_X w | Σ_{N(X)} w | deficit | note |
     |---|---|---|---|---|
     | `CB(2,1)/2` | — | — | 3 | at `k = 1`; the max-flow deficit, outside the `k ≥ 2` range of (ii) |
     | `CB(3,1)/3` | 12 | 9 | 3 | the whole sector; members and neighbourhood are listed in `mincut_RESULT.json` |
     | `CB(5,1)/4` | 80 | 60 | 20 | |
     | `CB(6,1)/5` | — | — | 25 | the max-flow deficit; the whole sector's deficit is 20 |
     | `CB(d≥2, m≥2)` sector-deficient ranks | — | — | 0 | switches rescue the sector in every case scanned, with `F_p` = all leaves |
     | `CB(5,2)/7` | — | — | 5376 (full) = 5376 (deletion-only) | `F_p` excludes the private leaves, so every switch target has weight 0 |

   - None of these rows is eligible, so none is a (CUT). **Consequence:** any successor lemma of the form "switch arcs rescue the sector"
     has to carry eligibility (`3p < 2α + 1`, with `F_p` derived) as a load-bearing hypothesis. Candidate 2 is one data point, not a
     mechanism.

6. **The claim that the `CB(1,7)/10` and `CB(2,5)/10` flows are the first in this run is unbacked.** The allocation's standing state
   already records both rows as saturating with deletion arcs alone in Cycles 1–2. "First genuine integral max-flow solves" is **struck**
   as a priority claim. The flows themselves reproduce: my deletion-only flows saturate and pass the certificate checker, with 14,125 and
   137,494 flow-carrying arcs.

7. **The `CB(2,5)/10` "data-quality correction" is not a contribution.** The attack-brief preamble records it as a controller fact already
   established by three Cycle 2 instruments. U2's diagnosis ("script slip, not formula") is consistent with that fact, but I cannot verify
   it: the Cycle 2 file is outside my grant.

8. **Obligation (a) is not achieved, and the return says so honestly.** No rational flow, LP-dual potential or per-class certificate
   exists at any `CB(8,·)` row. Ruling 25 requires the verification lemma on the face for any certificate. None was offered, so its
   absence is moot, but it is supplied here for the successor.
   - **Lemma (C-U2-T, `proved_informal`).** Let `f ≥ 0` be a rational function on (D) ∪ (S) arcs such that
     `Σ_A f(B,A) = w_F(B)` for every source and `Σ_B f(B,A) ≤ w_F(A)` for every target. Then for every `X ⊆ I_{p+1}`,
     `Σ_{B∈X} w_F(B) ≤ Σ_{A∈N(X)} w_F(A)`.
   - *Proof.* `Σ_{B∈X} w_F(B) = Σ_{B∈X} Σ_{A∈N(B)} f(B,A)`. Every such arc has `A ∈ N(X)`, so the double sum is at most
     `Σ_{A∈N(X)} Σ_{B} f(B,A)`, which is at most `Σ_{A∈N(X)} w_F(A)`. ∎ With (HALL⇒FLOW) this also yields an integral flow.

9. **Minor points.**
   - The rows that carry the `|F| = dm+1` claim are correct. The `is_tree` checks are genuine: I read `is_tree_exact`'s use in the
     driver, and my separate test agrees on all nine trees.
   - "CB(2,2) has no eligible `p` at all": correct, since `x + 2 = 6 > ⌊14/3⌋ = 4`.
   - The window notation `[x+2, ⌊2α/3⌋]` is used consistently.

## Mechanism-equivalence and fence check

- **No refuted mechanism is revived.**
  - Candidate 1 is a totals identity, not a transport mechanism.
  - Candidate 2 is a statement about the r30 active-weight network under (D) ∪ (S). It is not `E993-R23-LITERAL-DELETE-ONLY-HALL`: the
    weight, the demand and the relation all differ. Its deletion-only half is exhibited as a failure, not proposed as a mechanism.
  - Nothing uses own-support unit capacity, per-leaf injectivity, occupancy domination, the Delete/Retag relations, signed cross-tag or
    covariance.
- **Fences held.** No closed region is re-proved: the high tail, the order bands, `T_m`, the spiders and the path-stars are untouched.
  No census value enters a proof. No RTree wording is used. (LIFT), (INV) and the equitable lift are not used. `D, C ≥ 0` is not used as
  a budget. FLOW⇒SIGN is not invoked.
- **Fence stress on the CBstar item.** The return calls it "used, not re-proved". At `p = 5, 6` it is neither: those ranks are outside the
  key's scope, and the key was paraphrased wider than registered (finding 2). This is a citation-scope error, not a re-proof. It is
  struck as corroboration.
- **The frozen record is used correctly** (§ fence 3.4): `cb-switch-cut/RESULTS.json` enters only as a cross-check literal, after its
  digest was checked.

**Claim identity (duty 6).**
- **Keys touched:** (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN, untouched); (WID) and FLOW⇒SIGN (used as standards
  only); `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` (mis-paraphrased; the key stands).
- **Candidate 1, `E993-R30-CB-WHOLE-NETWORK-ACTIVE-WEIGHT-GENERATING-FUNCTION`.** The brief asks for a ruling on whether it is a claim
  or a record.
  - *Lexically*, it does not collide with any key named in my capsule.
  - *Mathematically*, it is a closed form for layer totals on a named family. Together with the independence polynomial and (WID), those
    totals are already computable. It says nothing about any subfamily, so it adds nothing to (HALL).
  - **Ruling:** the mathematics is a complete, correct statement at exact scope (`d, m ≥ 1`, `F` = `leafSet`; I judge the proof above
    `proved_informal`). It belongs as a **Tier-3 record attached to `R30-CB-RECORD`**, not as a new `E993-R30-…` key. If the synthesis
    registers it anyway, the statement must say "`F` = the full leaf set". Use at a row requires `F_p(CB(d,m))` = `leafSet` to be
    derived at that row: `CB(5,2)/7` is a row where it is not.
- **Candidate 2:** a `bounded_computation` record, not a key.
- **My own items** (the two lemmas in findings 5(i) and 8, and the `CB(d,1)` sums in 5(ii)) are STATED at review stage. Each needs an
  isolated second read before any registration.

## Certification audit

| Literal in the return | Status |
|---|---|
| Seal `5df4c603…`, frozen digest `873cf922…`, module digests, replay digest `20a48614…`, "byte-identical" dev/replay copies | backed (recomputed) |
| `CB(1,7)/10` and `CB(2,5)/10`: source and target counts (8,673 / 22,197; 88,506 / 185,256), supply, capacity, `S`, "saturates" | backed (my enumeration and certificate-checked flows) |
| `CB(3,5)/13–14` and `CB(4,4)/14` supply, capacity, `S`; the small `Δ_x` / `Δ_{x−1}` values | backed |
| `CB(8,·)`: `n`, `α`, `x`, `|F|`, exact values (JSON), "byte-identical" to the frozen `aggregate` | backed |
| `CB(8,·)` digit counts for `Δ_x`, supply, capacity and `S` (11 of 15 annotations) | **struck** (finding 1) |
| `CB(2,2)/4`: 32 / 24 / 32, "8 switch arcs", "exact saturation", window [6,4] | backed (8 is the forced minimum) |
| "`t ≥ 2`: the sector is never deletion-deficient at any rank"; "corroboration … by direct Hall-condition computation" | **struck** (finding 2) |
| `CBstar(2,2,2)/5,6` described as the non-eligible demonstration rows | backed; but `p = 7` is eligible and its row data were omitted (finding 3) |
| "first genuine integral max-flow solves …"; "first small … instance in this run …" | **struck** (unbacked priority claims) |
| "none is a literal typed in by hand, except the two cross-check literals" | **struck** (the digit counts were typed by hand) |
| Candidate 1 "triple cross-validation"; "algebraically identical" to Cycle 2's quoted form | backed for the formula; the quotation itself is not verifiable by me |
| Candidate 1 grade `proved_informal` (proposed) | supported on my re-derivation; STATED pending a second read |
| Route verdict `bounded_evidence` | justified |

## Verdict

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**What survives.**
- Every exact value U2 computes reproduces on an independent instrument:
  - brute-force networks with certificate-checked flows;
  - a literal dual-number weight DP;
  - an independent `H_v/R_v` aggregate;
  - the frozen record.
- Candidate 1 is a correct closed form. I rule it a Tier-3 record, not a key.
- Candidate 2 is a correct `bounded_computation` record at its exact, non-eligible subfamily scope.

**Narrowed.**
- The wrong digit-count literals are struck.
- The widened CBstar paraphrase and its whole-sector-only "corroboration" are struck.
- The priority claims are struck.
- The missing eligible-row data and `S` assertion at `CBstar(2,2,2)/7` are recorded as a procedural breach. My re-derivation supplies them.

**Critic-derived results (attributed to C-U2-T).**
- The flow ⇒ WeightedHall verification lemma (finding 8).
- The `d = 1` switch-weight-zero lemma and the `CB(d,1)` whole-sector sums (finding 5). These show that switch rescue of the sector is not
  uniform away from the eligibility window.
- The eligible bounded row `CBstar(2,2,2)/7`, which saturates with deletion arcs alone.
- Exact every-subfamily max-flow deficits for the `CBstar(2,2,2)` sector.

None of these touches (HALL). No (CUT) candidate exists.

## Remaining obligation

The return's `## Remaining obligation` is exact on its item 1, with one amendment: obligation (a) remains open in full. That obligation
is an exact per-subfamily certificate on the full (D) ∪ (S) networks of `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`, in either form:
- a rational saturating flow over branch-type classes, carrying the verification lemma of finding 8; or
- an LP-dual potential.

It must cover the coupled families that mix `sec`, positive-weight V sources and positive-weight S/O sources. Totals, whether from
Candidate 1 or from (WID), certify nothing here.

Amendments to the return's list:
- **Item 2** is correct: no eligible switch-necessary row is known below the `CB(8,·)` rows. Any successor lemma on sector switch rescue
  must carry the eligibility window as a hypothesis. Finding 5 shows that it fails at non-eligible ranks, both for `d = 1` and for
  `m = 1` with `d ∈ {2, 3, 5, 6}`.
- **Item 3** is not an obligation: the correction is already a controller fact.
- **Item 4:** both candidates need isolated second reads, and so do my stated lemmas.
- **New (controller):** correct the U2 entry of `C3-STAGE3-READ-BOUNDARY-DISCLOSURES.json`. The return does disclose one above-grant
  `ls` and one background job stopped by `TaskStop`.

## Artifact inventory

Everything is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-crit-U2-T/`.
Every script was run with `python3 -B`, uses the standard library only, and does exact integer arithmetic.

| file | sha256 | role |
|---|---|---|
| `seal_check.py` | `745f1828a547c643ed48965af5083d410f3eaba3e30f851f4361f7cd20b3292d` | capsule, Stage 2/3/4 seals, member digests |
| `crit_lib.py` | `6961b84d423231fac3b2ab8a42c0a0c7f8a8f8f4d33202c02a0cfa81e4a39c93` | own trees, DP, dual-number weight DP, `x`, `F_p`, `S` via `H/R` |
| `net.py` | `ed74040f9257245bfc28d176679cd19acd311dfad71a45c188ebfaf5c659de20` | literal network, Dinic, independent flow-certificate checker |
| `validate.py` | `0e5238768efd14b70e0019fae8c9a9c1ca4e81d915bf013fcb831cf29f9b6ab8` | 400 random trees plus CB/CBstar, every rank (output printed: 0 mismatches) |
| `rows.py` / `rows_RESULT.json` | `5b55e218…` / `71fb77c994d8b7862804dbcbff50eaf66eccd6987f91ebe58f170334aea30d42` | fixed points, every U2 row, frozen-record check |
| `flows.py` / `flows_RESULT.json` | `68d496b7…` / `f332a809bca4b2378ed0070edf73017a2e47a2e84cfffbccb776f9cee4452680` | max-flows and certificates (`CB(2,2)/4`, `CBstar(2,2,2)/5–7`, `CB(1,7)/10`, `CB(2,5)/10`) |
| `sector_scan.py` / `sector_scan_RESULT.json` | `93462a89…` / `e1f155980fb8276333af4aa38c1fbecc361af014ddd924cbc1d13e08ccd0b976` | CB sector deletion vs (D) ∪ (S) deficits (finding 5) |
| `cbstar_scan.py` / `cbstar_scan_RESULT.json` | `110ecf71…` / `db9a05b317df2f63bc44c3fdb5f5b031b3a7dd3593e4f45f695495d9037b163b` | `t ≥ 2` sector deficits at every rank (finding 2) |
| `mincut.py` / `mincut_RESULT.json` | `f8f07cbc…` / `37d46686fa190b318c02afd57470a5e130034f637dfe78873657eaf3541165bf` | explicit maximum-deficit families (`CB(3,1)/3`, `CBstar(1,1,2)/2`), sums recomputed independently of the flow |
| `cbd1.py` / `cbd1_RESULT.json` | `0aed77a0…` / `039fab2a2dc3170050bec1fffd123d8561b8e83d6aeacc1ef21637634675ce2d` | `CB(d,1)` whole-sector formula check |
| `audit.py` | `18df9ef37503b840ce3cc481efecf7d9e2fff8f8594d0fbcc2d808b3cbd4ee1c` | digit-count audit; Candidate 1 sweep (3,200 coefficients, 0 mismatches) |
| `replay-U2/` (copy-out of `c3-U2-replay/`), `replay-U2-dev/` (copy-out of `c3-U2/`) | module digests as in the return; regenerated `run_all_RESULT.json` `ac432c7c…`; `replay_stdout.txt` `6e7acf10…` | U2 replay parity |

No background job was started, so none is left to kill.
