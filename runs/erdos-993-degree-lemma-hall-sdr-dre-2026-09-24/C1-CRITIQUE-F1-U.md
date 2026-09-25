# Critique

Critic `C-F1-U` (orientation U, formal/structural) on seat `F1`, route `C1-F-01 DOMINANCE-FALSIFICATION-CENSUS`
(orientation F), Cycle 1 Stage 4, r28.

**Boot acknowledgment.** I am operating within VerityOS. For the boot I read exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The
tool display truncated the middle of `verity.md`, and I read the startup protocol in two passes. I read no other
VerityOS file outside the run root. Subsystems loaded: the constitution and startup protocol only, and the
run-root control and contract files my capsule lists.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

**Headline of this critique.** In the next open step, the order-21-to-24 growth attack the brief asked for, I found a counterexample to (HS). It is a
critic-derived result, attributed to `C-F1-U`. The tree has order 22: a root joined to three hubs, and each hub carries two pendant
paths of 3 edges. At `k = 12` the root has `c_0(12) = 18`, and every one of the six leaves has `c_ℓ(12) = 17`. So
`slots_{≥18}(12) = 1 > 0 = leaves_{≥18}(12)`. Both the threshold form and the matching form fail. The same happens for an
infinite family `T(d, r)`, with a hand proof below. I confirmed the order-22 instance four ways: my own DP, a DP-free
enumeration of all 54,929 independent sets, F1's instrument run copy-out-first, and a hand count. It has not had an
isolated second read. Per `SOLUTION-CONTRACT.md` §4 it is **STATED**, and it needs that second read before stop gate §5(b) can fire.

## Identity and seal audit

- Capsule `control/c1-critic-capsules/F1-PACKET-MANIFEST.json`: the inner seal recomputes canonically (SHA-256 of
  the compact key-sorted JSON without `seal_sha256`, no trailing newline) to
  **`58419b49364ce44b9d8ccda14655b2420292df6e4587665f7ae2dd429bc06ba6`**, which matches. All 14 members match
  their `sha256` and `bytes`.
- Stage 4 dispatch manifest seal recomputes to `7ead45432169e189c210cd2f81486dfb9f6fbd9b46af0c1c81eb902e8a76812e` (matches;
  13/13 members match). Stage 3 packet manifest seal: `56fa3b76ba633b21aa40e58b554560bd59239322edf35375a3bdc668318b2be5`
  (matches; 24/24 members match). Stage 2 seal: `2eff91efcc2889ffcbbdc7e046adeb69e9a74e162d68a454afe94068e7af710b`
  (matches the protocol literal; 83/83 members match).
- F1's return digest is `ddae1c71…` and matches the capsule. F1's shipped report digests are canonical-JSON digests, and each
  recomputes from the shipped JSON: fixed points `04f3bc52…4e22936`, families `29d0c2fe…f221626`, Prüfer
  `e6e66d19…fbf216`, master `6144e7c4…fbeffeba`. Note that the file-byte SHA-256 values differ because the files are indented. The `.sha256` files
  record the canonical digest, as the return says.
- `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` is present (a capsule member), and it records F1's host restart and three
  PID kills.
- **My read-boundary disclosures:**
  1. My member-digest pass over the Stage 3 and Stage 4 manifests hashed the bytes of files listed there, including
     other seats' `RETURN.md` and dispatch files. I hashed them only. I never displayed or used their content.
  2. I ran one non-recursive `ls -la` of `scratchpad/c1-F1-replay/`, F1's replay directory named in its return.
  3. I read `sources/authority/CLAIM-IDENTITY.json` (authorized under `sources/`) for the alias check.

  I ran no `find`, `grep` or `rg` above my grant. I used no network and installed nothing.

## Independent re-derivation

**My instrument** is `scratchpad/c1-crit-F1-U/crit_inst.py`, standard library only, exact integers. It is independent of F1 at
every layer:

- **Generation.** Beyer–Hedetniemi rooted level sequences produce every rooted tree of order `n`. I then deduplicate free trees by a
  centre-rooted nested-tuple AHU code. There is no leaf augmentation and no interning.
- **Occupancy.** `c_v(k) = i_{k−1}(T − N[v])` is computed by a plain in/out DP on each component of the forest `T − N[v]`.
- **Threshold form.** For orders 2–17 I checked every integer `t` from 1 to `max c + 1`. For orders 18–20 I checked every step point of
  either side (the union of branch and leaf `c`-values), which is logically equivalent because both sides are step functions.
- **Matching form.** I build the explicit bipartite graph (`deg v − 2` copies of each branch vertex against the leaves) and run a general
  BFS-augmenting-path maximum matching that does not use the nested structure.
- **Tree test.** Every tree passes a BFS connectivity test and a separate union-find acyclicity test. Both are exercised on non-trees (a
  triangle and a doubled edge are rejected).

**Fixed points** (`fixed.py`):

- Spider `S(2,1,1)` at `k = 3`: `c = (0,1,2,2,1)`, `i = [1,5,6,2]`, and (HS) holds.
- Stars `K_{1,m}` (`m ≤ 7`): centre `c = [k=1]`, and each leaf has `c_ℓ(k) = C(m−1,k−1)`.
- Paths `P_2..P_11`: the `c` values are symmetric.
- On all 436 free trees of orders 1–11, my DP agrees with a `2^n` bitmask scan on every `i_k` and every `c_v(k)`,
  `Σ_v c_v(k) = k·i_k`, `c_v(0) = 0` and `c_v(1) = 1`.

**Census replay, orders 2–20, my own instrument** (all orders re-executed, not just ≤ 14):

| orders | classes (= A000055) | threshold fails | matching fails | threshold/matching disagreements | tight | tight at `t = min c_v` | digest |
|---|---|---|---|---|---|---|---|
| 2–16 | 32,507 | 0 | 0 | 0 | 0 | 0 | `ab94d559…` |
| 17 | 48,629 | 0 | 0 | 0 | 0 | 0 | `a3afeff8…` |
| 18 | 123,867 | 0 | 0 | 0 | 0 | 0 | `fbd6f532…` |
| 19 | 317,955 | 0 | 0 | 0 | 3 | 0 | `765a59ff…` |
| 20 | 823,065 | 0 | 0 | 0 | 2 | 0 | `25d5e436…` |

Every per-order count equals A000055: 1, 1, 2, …, 19320, 48629, 123867, 317955, 823065. The tight instances are exactly F1's five,
at the same `(k, t)`: order 19 at `(9,128)` twice and `(10,27)`; order 20 at `(10,110)` and `(11,16)` on one tree. **F1's order-2–20 census table is
independently reproduced in full**, including orders 18–20, which F1 ran only once.

**Replays of F1's generators, copy-out-first** (`replay/`, `replay2/`):

- `f1_validate.py`: all checks pass (4.5 s).
- `f1_fixedpoints.py`: `04f3bc52…`, byte-identical canonical digest.
- `f1_prufer.py`: `e6e66d19…`, identical.
- `f1_families.py`: `29d0c2fe…`, identical.

**Large-instance spot check** (`spot.py`, digest `251159e1…`). F1's rerooting `c_v(k)` for `k = 1..5` agrees with an independent truncated per-vertex
DP, and for `k = 2, 3` with closed forms:

- `c_v(2) = n − 1 − deg v`
- `c_v(3) = C(m,2) − (n − 1 − deg v − Σ_{w∼v}(deg w − 1))` with `m = n − 1 − deg v`

It was checked on complete 3-ary depth 6 (`n = 1093`), caterpillar(150, 2), lobster(80, 1, 1), spider(500 × 2) and broom(300, 1500),
with 0 mismatches in 18,550 values. F1's large trees were not computed by subset enumeration. The method is a bottom-up DP with a
prefix/suffix rerooting, where identical child polynomials are grouped and raised by repeated squaring. Its rerooting identity is
**tested, not proved**:

- by the ≤ 10 brute-force comparison;
- by my ≤ 20 census agreement;
- by this spot check.

**Order 21, exhaustive.** The attack brief asked me to grow tight instances at orders 21–24, so I extended F1's copied order-20 list
by one leaf with F1's canonical form, copy-out-first (`replay/order21.py`). I checked each class with F1's `check_one_tree`:
2,144,505 classes (= A000055), 0 threshold failures, 0 matching failures, 24 tight instances on 19 trees, 0 tight at `min c_v`
(digest `46aae48a…`). This order-21 result rests on **F1's instrument** (my own generator is too slow at order 21). The minimal
counterexample order is therefore 22, conditional on F1's instrument at order 21. My instrument agrees with it at every order ≤ 20.

## Attacks and findings

**Finding 1 (critic-derived; STATED; the load-bearing finding): (HS) is false.**

*The family.* Let `d ≥ 3` and `r ≥ 1`. The tree `T(d, r)` has:

- a root `o`, adjacent to hubs `h_1..h_d`;
- two pendant paths `h_i – x_1 – x_2 – … – x_{2r+1}` on each hub, each of `2r + 1` edges, so each hub has two copies of `P_{2r+1}` hanging from it by `x_1`;
- order `n = 1 + d(4r + 3)`;
- `deg o = d` (`d − 2` slots), `deg h_i = 3` (one slot each), and `|L| = 2d` leaves (slot count `2d − 2 = |L| − 2` ✓).

*Claim.* At `k* = α − 1 = 2d(r+1)`:

- `c_o(k*) = 2d·C(r+2,2)`;
- `c_ℓ(k*) = (2d−1)·C(r+2,2) + C(r+1,2) + 1` for every leaf;
- `c_{h_i}(k*) = 0`.

So `c_o − c_ℓ = r ≥ 1`, and at `t = c_o(k*)`: `slots_{≥t}(k*) = d − 2 ≥ 1 > 0 = leaves_{≥t}(k*)`. The deficit `d − 2` is unbounded
in `d`.

*Proof.* The standard fact used is `i_j(P_m) = C(m − j + 1, j)`.

1. **α.** `P_{2r+1}` has the unique maximum independent set of odd positions, of size `r + 1`, and it contains the endpoint `x_{2r+1}`. A hub
   group (`h_i` with its two legs) has maximum `2r + 2` with `h_i` out, uniquely (both legs at their maximum). With `h_i` in it has at most
   `1 + 2r`, because `x_1` is excluded and each leg becomes `P_{2r}`. So `α = 1 + 2d(r+1)`, attained with `o` in, all hubs out and every leg at its maximum.
2. **`c_o(k*)`.** `o` excludes every hub, so the `2d` legs must supply `2d(r+1) − 1`: exactly one leg supplies `r` and the rest supply `r + 1`. That gives
   `2d · i_r(P_{2r+1}) = 2d·C(r+2, r) = 2d·C(r+2,2)`. Equivalently, `T − N[o] = 2d·P_{2r+1}`.
3. **`c_ℓ(k*)` for the leaf `ℓ = x_{2r+1}` of a leg `λ`.**
   - With `o` in: either the short leg is not `λ`, which gives `(2d−1)·C(r+2,2)` choices with `λ` at its maximum (which contains `ℓ`); or the short leg is `λ`, and
     then the `r`-subsets of `P_{2r+1}` that contain the endpoint number `i_{r−1}(P_{2r−1}) = C(r+1, 2)`.
   - With `o` out: `k* = 2d(r+1)` equals the sum of the group maxima, so every group is at its unique maximum. That is exactly 1 set, and it contains `ℓ`.
4. **`c_{h_i}(k*)`.** `o` is out, the group of `h_i` supplies at most `2r + 1`, and the others at most `2r + 2` each, for a total of `2d(r+1) − 1 < k*`. So the count is 0. ∎

*Smallest case `T(3,1)`, order 22.* Edges: `0–1, 1–4, 4–5, 5–6, 1–7, 7–8, 8–9, 0–2, 2–10, 10–11, 11–12, 2–13, 13–14,
14–15, 0–3, 3–16, 16–17, 17–18, 3–19, 19–20, 20–21`. `Br = {0,1,2,3}`, `L = {6,9,12,15,18,21}`,
`i = [1,22,210,1144,3933,8907,13470,13529,8856,3691,975,171,19,1]`, `α = 13`.

- At `k = 12`: `c_0 = 18`, `c_{1,2,3} = 0`, every leaf 17. `slots_{≥18} = 1 > leaves_{≥18} = 0`.
- At `k = 11`: `c_0 = 141`, `c_{1,2,3} = 4`, every leaf 136. `slots_{≥t} = 1 > 0` for `t = 137..141`.
- The matching form fails at `k = 11, 12`: the maximum matching is 3 of 4 slots.

Four confirmations:

- my DP (`cex22.py`);
- F1's `compute_i_and_c` run copy-out-first, which agrees on every `i_k` and `c_v(k)`;
- a DP-free backtracking enumeration of all 54,929 independent sets (`cex22_brute.py`, digest `9ae8f3f1…`);
- the hand count above.

`family_Tdr.py` (digest `37600aa5…`) confirms the closed forms and the violation for every `d ∈ {3,4,5}` and `r ∈ {1,2,3}`
(orders 22 to 76). Its deficits are 1, 2 and 3 for `d = 3, 4, 5`, and its gaps are `c_o − c_ℓ = r`.

*Other counterexamples found* (`famsearch.py`; the two-level spider family is a root with 3–5 arms, each arm a pendant path of length
1–5 or a hub on a stem of 1–3 edges with 2–4 legs of length 1–4):

- orders 19–20: 74,603 classes, 0 failures, 4 tight trees. These are exactly F1's tight trees; all lie in this family.
- orders 21–22: 194,531 classes, 1 failure (`T(3,1)`), 17 tight instances.
- orders 23–24: 475,078 classes, 4 failures:
  - root arms `[3,3],[3,3],[3,4]` (order 23, `k = 12`, `t = 49`);
  - root arms `[3,3],[3,3],[2,2,3]` (order 23);
  - root arms `[3,3],[3,3],[2,3,3]` (order 24);
  - root arms `[2,2,2],[2,2,2],[2,2,2,2]` (order 24, a different mechanism with even legs: the root's `c = 5120` at `k = 10` beats every leaf).

*What this does and does not affect:*

- (DL) is unaffected. At `T(3,1)`, `k = 12`: `Σ_Br(deg−2)c = 18 ≤ Σ_L c = 102`. The layer-cake sum keeps its slack even though one
  addend is negative. This is consistent with the formal (DL) of record and with its equality classification.
- (LC), (FC) and the Hall equivalence are independent of whether (HS) is true and stand as targets.
- **Tier 1 `tree_leaf_slot_dominance` is false as stated.** Any T-route proof of it contains an error at a named step, and the U2
  skeleton's open nodes cannot all be closed.
- Why (HS) fails: a branch vertex whose closed neighbourhood is a set of hubs sits at the top of the maximum-independent-set
  structure. Its `c` then exceeds every leaf's, because each leaf loses one count to the "short leg is my own leg" case (`C(r+2,2) − C(r+1,2) = r + 1`) and gains back only 1 from the root-out case.
- The failure is at the top thresholds (`k = α − 1`, `t = max c`), exactly where F1's tight instances sit.

**Finding 2: F1's tight instances were the precursors, and the brief's suggested growth works.**

- F1's order-20 tight tree is `T(3,1)` with one leg shortened from 3 edges to 1.
- F1's order-19 tree at `(10,27)` is the same tree with one leg of length 2 and one of length 1.
- Restoring the leg to 3 edges gives the order-22 counterexample.

Answers to the brief's questions:

- **Is the tie always a branch vertex with `c_v(k) = max_ℓ c_ℓ(k)` at `k` near `α`?** Near `α`, yes: every tie is at `k ∈ {α−2, α−1}`. At `max_ℓ c_ℓ`, only in 2 of 5 (`27 = 27`, `16 = 16`). In the other three the single qualifying leaf is strictly larger: `128 < 159`, `128 < 173`, `110 < 118`.
- **Consequence for F1's wording.** F1's "matched against a single leaf at that same value" (Remaining obligation 3) is inaccurate for 3 of 5 and is struck.
- **Is any tie at `t = min c_v`?** No, through order 20 (reproduced by my instrument) and at order 21.

Structural reading, critic-derived: sort the branch slots' `c`-values in descending order `s_1 ≥ s_2 ≥ …`, and the leaves' `c`-values `l_1 ≥ l_2 ≥ …`.

- (HS) at `(T, k)` is equivalent to `l_j ≥ s_j` for every `j`.
- F1's "tight" is equivalent to `s_j > l_{j+1}` for some `j`.
- Every tie observed has `j = 1`.

**Finding 3: the two matchers are not independent of the threshold check.**

- F1's `greedy_nested_matching` sorts both sides in descending order and matches greedily. On a nested-neighbourhood graph it
  succeeds exactly when `l_j ≥ s_j` for all `j`. That is the threshold form rewritten, and it runs on the same `c`-arrays from
  the same DP.
- So the order-2–20 "matching form … reconciled" result is a consistency check of one computation, not a second instrument.
- The general-purpose Hopcroft–Karp matcher ran only to order 13 (`f1_validate.py`, 22,019 instances) and on the Prüfer sample.
- The route obligation ("two independent instruments, reconciled") was met at order 20 only by this critique's instrument (a separate
  generator, a separate DP and a general matcher).

**Finding 4: the adversarial families missed the failing shape.** All 25 families are one-level (spiders, brooms, caterpillars,
lobsters) or uniform (complete `d`-ary). None has hubs with odd pendant paths hanging off a common branch vertex. F1's own
Remaining obligation 4 pointed the right way ("a branch vertex two levels removed from a leaf via one intermediate branch vertex").
The family results themselves are correct: I replayed them byte-identically and spot-checked them.

**Finding 5: the Remaining obligation is superseded.** Item 1 says "(HS) remains open, unrefuted". Pending second read, (HS) is refuted at order 22.

**Finding 6: a process-rule lapse missing from the controller's record.**

- F1's return says it ran `ps aux` twice: after resuming, and before finalizing. Both are full process listings, which the protocol forbids ("never a pattern kill or a full process listing").
- The controller's disclosure file lists only the restart and PID kills for F1. Its `rule_text_items` says the rule was honoured by every seat except T2.
- That record should be corrected. No reported number depends on these listings.
- I cannot verify from shipped evidence when the restart happened, and the checkpoint `ckpt.pkl` (mtime 19:34) predates the last edit of `f1_census.py` (20:00). Neither point matters to the result, because my independent instrument reproduces every order-2–20 number.

**Finding 7: the layer-cake remark is confirmed.** F1 separates (HS)-tightness from (DL)-tightness in lines 72–76, and that is correct.
(LC) sums over `t ≥ 1`, so one tight addend leaves the sum slack wherever another addend has slack (for example at `t = 1`, `slots = |L| − 2 < |L|` when every `c ≥ 1`). Finding 1 shows the stronger point: one addend can be negative while (DL) keeps slack.

Other checks:

- Hypotheses and quantifiers are handled correctly. `k = 0` and `k > α` are trivial and are included by both instruments.
- The threshold is checked only at branch values in F1's code. That is sufficient, because `slots_{≥t}` is constant between branch values while `leaves_{≥t}` does not increase in `t`.
- `deg v − 2` is taken only on `Br`.
- (PW) is never used as a premise.

## Mechanism-equivalence and fence check

- F1 uses no no-recovery wording, does not re-prove (DL), uses no (PW) premise, and gives no formal grade to a census. The Codex target is untouched. F1 cites
  (DL) by key as an input. The fences are respected.
- My refutation is a statement about independent-set counts on finite trees. It transfers nothing across fence 1: not to
  `E993-R25-UNR-FOREST-WIDE`, NR1, FOREST, TREE, TRANSFER, the aggregate or Erdős #993. It leaves `E993-R27-FOREST-DEGREE-LEMMA` untouched
  (the fence-2 face is unchanged).
- It is not a (PW)-type argument. The violating comparison is between the root's slot and **every** leaf, which is the threshold form itself.
- **Alias check, lexical and mathematical**, over the 392 claims in `sources/authority/CLAIM-IDENTITY.json`:
  - "dominance" (7), "slot" (3), "occupancy" (6), "spider" (6): all are Catalan or `τ`-dominance results, ambient `Δ` targets, the spider closed form, the r26 fibre bound, or the r27
    reformulation. None states (HS) or a leaf/slot threshold comparison.
  - "R28" gives 0 hits.
  - No collision. The refutation belongs under the contract's conditional key `E993-R28-DOMINANCE-REFUTATION`, with
    `E993-R28-TREE-LEAF-SLOT-DOMINANCE` → REFUTED (the smallest witness order is 22, conditional on the order-21 sweep; see the re-derivation).

## Certification audit

Backed (reproduced by me):

- the order-2–20 class counts;
- 0 threshold failures to order 20;
- the five tight `(k,t)`;
- 0 tight at `min c_v`;
- all four report digests (fixed points, families and Prüfer replayed; master recomputed);
- the fixed-point table;
- the (PW) witness;
- `f1_validate.py` "ALL VALIDATION CHECKS PASSED";
- the 25 family rows (replay digest identical);
- 29 Prüfer trees (replay identical).

**Struck or narrowed:**

1. The claim "Both forms … on two independent instruments" and "three independent components" at the order-20 scale. The greedy
   matcher is the threshold test rewritten, and both run on one DP (Finding 3). Narrow it to: threshold form at orders 2–20, one instrument;
   greedy reconciliation is a consistency check; a general matcher ran to order 13 plus the Prüfer sample.
2. "Hopcroft-Karp alone was run to order 17 as an additional, slower cross-check" is **struck**: no artifact, log or report
   field backs it.
3. "`f1_extract_census_summary.py` recomputes — not merely re-reads — every number below from that checkpoint's raw tree lists"
   and "census summary … recomputed directly from the checkpoint … not copied from run-time counters" are **struck**. The script writes
   `census_results_summary.json` as `json.dump(state["results"])`, which are the cached run-time counters. It recomputes only the tight witnesses.
4. "verified against the naive all-distinct computation in f1_validate.py" (the `grouped_exclusion_products` docstring) is **struck**:
   there is no such test in `f1_validate.py`. The grouped code is covered indirectly, by the ≤ 10 brute-force comparison and by my spot check.
5. "a single-slot-vs-single-leaf tie … matched against a single leaf at that same value" is **narrowed**. Equal values occur in 2 of 5
   (Finding 2).
6. The docstring "no floats anywhere" is inaccurate (`float('inf')` in Hopcroft–Karp). It is cosmetic and bears on no result.
7. Remaining obligation item 1, "(HS) remains open, unrefuted", is superseded (Finding 5).

## Verdict

verdict: retained_narrowed
headline_resolved: no

The census, `E993-R28-DOMINANCE-CENSUS` at `bounded_computation`, is correct and has now been reproduced independently to order 20.
I extended it to order 21 with F1's instrument. It is retained, narrowed by the certification strikes above. Its reach is bounded by the fact
that (HS) fails at order 22.

The critic-derived refutation of (HS) is my own work. It is a closed-form proof for the infinite family `T(d,r)`, `d ≥ 3`,
`r ≥ 1`, plus a four-way-confirmed order-22 instance. I grade the family statement `proved_informal`. The order-22 instance is exact and
confirmed by several independent methods. The refutation is **STATED at a review stage**: per `SOLUTION-CONTRACT.md` §4 it needs an isolated
second read before registration and before stop gate §5(b) can fire. Once second-read, it resolves the run's headline in the REFUTED direction.
The flag above stays `no`, as the protocol requires.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

## Remaining obligation

1. **Isolated second read of the refutation.** Check `T(3,1)`: order 22, `k = 12`, `c_0 = 18` against every leaf at 17, and hubs at 0. The DP-free
   count is feasible by hand (above) or by enumerating its 54,929 independent sets. Then check the `T(d,r)` proof (steps 1–4). On confirmation, register
   `E993-R28-DOMINANCE-REFUTATION` and move `E993-R28-TREE-LEAF-SLOT-DOMINANCE` to REFUTED. Stop gate §5(b) then applies.
2. **Minimality.** Order 22 is minimal conditional on the order-21 sweep, which used F1's instrument (`replay/order21.json`, `46aae48a…`). A second
   instrument at order 21, and a census of all order-22 counterexamples, are open. The smallest untested case for a second instrument is order 21.
3. **The weakest surviving strengthening of (DL)** (the contract's §1 companion to the refutation) is open. Facts for whoever takes it:
   - The deficit `d − 2` is unbounded, so no additive-constant repair of (HS) survives.
   - The ratio `c_o/c_ℓ` at `k*` stays below `2d/(2d−1)`-type bounds, so a multiplicative relaxation `c_ℓ ≥ c_v/λ` is untested.
   - The failure lives only at `k ∈ {α−2, α−1}`, top `t`, in these families.
4. **For T1/T2/U2.** No proof of Tier 1 exists. The error in any claimed proof should be located on `T(3,1)` at `k = 12`. (LC), (FC) and `sdr_iff_threshold` stand
   unchanged as Lean targets.
5. **Controller record.** Add F1's two self-reported `ps aux` full process listings to the Stage 3 disclosures (Finding 6).

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-degree-lemma-hall-sdr-dre-2026-09-24/scratchpad/c1-crit-F1-U/`.
Output digests are SHA-256 of the file bytes (the JSON outputs are compact and canonical, so they equal the printed digests).

- **Instrument:** `crit_inst.py` (`eab606f2…`; the step-point threshold edit was applied before the order 18–20 runs; the orders 2–17 runs used
  the every-integer-`t` loop). Also `fixed.py` (`f56cf9c5…`) and `census.py` (`35787777…`).
- **Census outputs:** `census_2_16.json` (`ab94d559…`), `census_17_17.json` (`a3afeff8…`), `census_18_18.json` (`fbd6f532…`),
  `census_19_19.json` (`765a59ff…`), `census_20_20.json` (`25d5e436…`), plus the `.log` files. `census_upto_14.json` is from an initial run.
- **Counterexample:** `cex22.py` (`3219…`), `cex22_tree.json`, `cex22_brute.py` (`ffd97451…`) and `cex22_brute.json`
  (`9ae8f3f1…`); `family_Tdr.py` (`df548a94…`) and `family_Tdr.json` (`37600aa5…`).
- **Family search:** `fam.py` (`376a8970…`) and `famsearch.py` (`15ff8277…`), with outputs `famsearch_19_20.json` (`b9a1f1c0…`),
  `famsearch_21_22.json` (`91625c3d…`), `famsearch_23_24.json` (`9394605c…`), `fam_21_22.log` and `fam_23_24.log`.
- **Spot check and tight analysis:** `spot.py` (`1bd75615…`), `spot2.json` (`251159e1…`) and `tight_analyze.py`.
- **Replays:**
  - `replay/`: F1's files copied out, plus my driver `order21.py` (`4e4e7143…`), `order21.json` (`46aae48a…`),
    `order21_tight_trees.json` and `order21.log`. The 226 MB checkpoint copy `ckpt_copy.pkl` was deleted after use.
  - `replay2/`: re-executions of F1's `f1_fixedpoints.py`, `f1_prufer.py` and `f1_families.py`, with identical digests.
- **Process:**
  - Background jobs ran with PIDs recorded in `PIDS.txt`. All had exited before this write, which I checked by literal PID with `kill -0`.
  - I killed PIDs 25098 and 25099 by literal PID (superseded slow runs). 25097 had already exited. I then deleted its completed order-18 log by mistake, and the rerun (29002) supersedes it.
  - Two harness-promoted foreground commands (tasks `bdvbiwd99` and `b3ol8l6th`, slow first versions of the family scripts) were stopped with the harness `TaskStop`, not by PID. Neither result is reported.
  - The first census launch failed at once because of shell word-splitting and did no work.
  - I ran no process listing.
