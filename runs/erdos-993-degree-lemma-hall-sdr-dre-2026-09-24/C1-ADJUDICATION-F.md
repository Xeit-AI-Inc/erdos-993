# Orientation Adjudication

Adjudicator of orientation **F** (falsify), r28 Cycle 1 Stage 5. Portfolio: seats `F1` (`C1-F-01 DOMINANCE-FALSIFICATION-CENSUS`) and `F2` (`C1-F-02 DOMINANCE-LOCAL-LEMMA-OBSTRUCTIONS`), and their critiques `C-F1-T`, `C-F1-U`, `C-F2-T`, `C-F2-U`.

**Boot acknowledgment.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. That loaded the root constitution and the identity startup protocol. I read no other VerityOS file outside the run root. The harness put `CLAUDE.md` and the auto-memory index into my context. That is a harness fact; I disclose it and did not act on it.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

## Identity and seal audit

- **Capsule seal.** I recomputed `control/c1-adjudicator-capsules/F-PACKET-MANIFEST.json` as SHA-256 over the canonical JSON without `seal_sha256` (sort_keys, separators `(",",":")`, no trailing newline). The result is **`69f1965e8893231380de7a1c686fe775b660460a6e030d8760b4de685c25c3e5`**, which matches. All **21/21** listed members match their SHA-256 and byte counts. The members are the protocol, both contracts, allocation, gate, source digests, the Stage 2/3/4 manifests and admissions, both disclosure files, the controller facts record `C1-STAGE5-CONTROLLER-FACTS-F.json` (`fc63609f…`), `PATH-CHECK-F.json` (0 findings), the two returns and the four critiques.
- **Stage seals, recomputed.** Stage 2 `2eff91efcc2889ffcbbdc7e046adeb69e9a74e162d68a454afe94068e7af710b`; Stage 3 `56fa3b76ba633b21aa40e58b554560bd59239322edf35375a3bdc668318b2be5`; Stage 4 packet `4f6545959854f69e59bfa1cba137e1a56d20d46ba453774b13c49fa40a6e84d7`. All three match. The F members listed in the Stage 3 and Stage 4 manifests match the files on disk. Stage 3 admitted 6/6 returns and Stage 4 admitted 12/12 critiques, each with 0 findings.
- **Return and critique digests.** F1 `ddae1c71…92b21` (34,310 B); F2 `e8a3c9e1…c9b` (35,048 B); C-F1-T `c86c441d…`; C-F1-U `02a4ec16…`; C-F2-T `139da130…`; C-F2-U `43e0760d…`. All match the capsule.
- **Critic seal values.** The critics report capsule seals `58419b49…` (F1) and `e9cd78e4…` (F2), each verified independently by both of that seat's critics. Every critic also reports reproducing the seat's shipped report digests (F1: `04f3bc52…`, `29d0c2fe…`, `e6e66d19…`, `6144e7c4…`; F2: `702d2cd3…`). I did not re-execute the seats' pipelines. I relied on two concordant critic replays for each seat and on my own independent instrument (below).
- **My read boundary.** Beyond the capsule I read three things:
  - `sources/authority/CLAIM-IDENTITY.json` (authorized under `sources/`), for the statements of two keys: `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2` and `E993-R27-DEGREE-LEMMA-K1-ACYCLICITY-CRITERION`.
  - The two critics' order-21 artifacts, copied out first into `scratchpad/c1-adj-F/copyout/`. They came from `scratchpad/c1-crit-F1-T/`: `order21_result.json`, `order21.log`, `crit_order21.py`; and from `scratchpad/c1-crit-F1-U/replay/`: `order21.json`, `order21.log`, `order21.py`. Both directories are inventoried in the critiques.
  - Nothing else. I ran no `find`, `grep`, `rg` or recursive listing, used no network, installed nothing, used no Lean, and did not delegate to child agents.
- **Process disclosure.**
  - My first `adj_families.py` evaluated the threshold at every integer `t` up to `max c`. Values in the order-90 family members are huge, so it overran the 600 s foreground limit and the harness moved it to the background as task `b7v1vl9e8`. I stopped it with the harness task-stop by task ID, not by a pattern kill. That version wrote no PID file, so I cannot report its PID. It wrote no result, and no number below depends on it.
  - I then rewrote the evaluator to check every piece of the two step functions. It agrees with the literal every-integer-`t` evaluation on the validation set and on `T22`.
  - One deliberate background job: the order-2–20 census, `adj_census.py 20`, with its PID in `census.pid`. It is accounted for in `## Artifact inventory`.
  - I ran no process listing.

## Route-by-route decisions

### F1 — `C1-F-01 DOMINANCE-FALSIFICATION-CENSUS`: **retained, narrowed; evidential reading withdrawn**

1. **The census stands at its horizon.** Both critics reproduced F1's exhaustive census with their own generators, DPs and general matchers. My third instrument reproduces it too (see `## Established results`, item 4).
   - Orders 2–20: 1,346,023 isomorphism classes, equal to A000055.
   - 0 threshold failures and 0 matching failures.
   - 5 tight instances, at orders 19 (3) and 20 (2). Both critics and my census find the same five `(tree, k, t)`.
   - The families (25 configurations) and the Prüfer sample (29 trees) replay digest-identically on both critics.
2. **The route verdict `bounded_evidence` stands only as a horizon statement.** Its reading ("strengthening the evidential case for (HS)") and its Remaining obligation item 1 ("(HS) remains open, unrefuted") are **withdrawn**. (HS) fails at order 22 (see `## Established results`, item 1).
3. **Certification strikes.** Both critics agree on every strike below, and each is backed by their inspection of the shipped scripts:
   - "Hopcroft-Karp alone was run to order 17": **struck**. No artifact backs it. The general matcher reached order 13 plus the Prüfer sample.
   - "`f1_extract_census_summary.py` recomputes … every number": **struck**. It dumps the run-time counters. Only the tight witnesses are recomputed.
   - The matching form at orders 14–20 "on two independent instruments": **narrowed**. The greedy matcher is the threshold test in rank form, run on the same `c`-arrays (C-F1-T's rank lemma; C-F1-U Finding 3). The independent matching-form reconciliation to order 20 is critic evidence: C-F1-T's Kuhn matcher and C-F1-U's BFS general matcher, each on its own DP.
   - Master digest "deterministic end to end": **narrowed**. The embedded summary carries wall-clock fields.
   - The tight tie "matched against a single leaf at that same value": **narrowed**. The values are equal in 2 of 5 cases (C-F1-T table; C-F1-U Finding 2). I replayed both order-20 rows, and each is `slots = leaves = 1` at `(10,110)` and `(11,16)`.
   - "Never tight at `t = min c_v`": keep, with the qualifier that it is counted only at `k` where every branch `c_v ≥ 1` (C-F1-T item 4).
   - Docstring: "verified against the naive all-distinct computation" is **struck** (C-F1-U strike 4).
4. **F1's derivation step 5 (the Hall reduction) is incorrect as written; its conclusion is right.** The correct replacement is `S' = {slots : c ≥ min_S c}`, with `N(S') = N(S)` (C-F1-T item 3).
5. **Process.**
   - F1's two self-reported `ps aux` listings (C-F1-U Finding 6) are already recorded in the sealed Stage 3 disclosure file with a controller ruling. That item is closed.
   - The `f1_census.py` mtime is later than `ckpt.pkl`, so the shipped script is not byte-for-byte the one that produced orders 18–20. Both critics note this. It does not affect any number, because orders 18–20 are reproduced by three independent instruments.
6. **Credit.** F1's Remaining obligation item 4 pointed exactly at the failing shape: "a branch vertex two levels removed from a leaf via one intermediate branch vertex". That pointer is credited to F1, and its order-20 tight tree is the counterexample with one leg shortened (see `## Established results`, item 1). F1 did not run the construction.

### F2 — `C1-F-02 DOMINANCE-LOCAL-LEMMA-OBSTRUCTIONS`: **retained, narrowed; the lemma map is corrected and completed**

Both critics reproduced every count in F2's battery exactly with independent instruments, and F2's report digest `702d2cd3…` replays byte-identically on both. Rulings lemma by lemma:

| Item | F2 grade | Ruling |
|---|---|---|
| L1 leaf ≥ support | `proved_informal` | **Upheld**, for any finite graph with `deg ℓ = 1`. It is the `m = 1` case of pendant-path leaf dominance (see `## Established results`, item 7). |
| L2 pendant-path monotonicity | refuted, order 6 | **Upheld.** I replayed `S(3,1,1)` at `k = 3`: `(0,3,1,3)`. The minimality argument "needs ≥ 2 interior degree-2 vertices" is **struck**: `S(2,2,2)` at `k = 4` gives `(1,0,1)`, which I replayed. Order 6 is minimal by exhaustive census at order ≤ 5 (both critics). |
| L3 pendant-leaf dominance | `bounded_computation`, open | **Superseded: PROVED**, critic-attributed; see `## Established results`, item 7. |
| L4 self-sufficiency | refuted, order 10 | **Upheld and sharpened** into the exact characterization `p(v) = deg v − btd(v)`: L4 holds at `v` iff `btd(v) ≤ 2`. |
| L5 interior ≤ extremal | refuted, order 8 | **Upheld.** I replayed `c_0(3) = 6 > c_1(3) = 4`. The candidate statement must define the branch tree in prose. |
| L6 leaf-removal recurrence | `proved_informal` | **Upheld**, for any graph with `deg ℓ = 1`. It likely duplicates T1's recurrence; merge at the alias gate. |
| §4 `(k,t) = (1,1)` criterion | `proved_informal`, "genuinely new" | **Correct, but not new.** It is the `k = 1` instance of the registered general weight identity; see `## Cross-route reconciliation`, item 3. "Genuinely new general fact" is **struck**. |
| §5 connected `|E| ≤ n`, unicyclic | `bounded_computation` null | The counts are correct: labelled graphs, and (tree, non-edge) **pairs**, not classes. The implied phenomenon is **refuted at order 22**; see `## Rejected and narrowed mechanisms`. |
| §5 bipartite "genuine" failures | refuted | **Struck as a key.** Every failure is `|E| > n` at `(k,t) = (1,1)`, a corollary of §4 (both critics). |
| Relaxation `k ≥ α − 1` | 0 failures to `n ≤ 13` | **REFUTED at order 22.** `T22` fails at `k = 12 = α − 1` and at `k = 11 = α − 2`. |
| Relaxation `k ≤ 2` | 0 failures to `n ≤ 13` | **Proved** (adjudicator-derived); see `## Established results`, item 10. |
| Relaxation `t ≤ 2` | 0 failures to `n ≤ 13` | Stays `bounded_computation`. Every known failure is at the top thresholds. |
| "fractional/weighted relaxation = (DL)" | wording | **Corrected** (C-F2-U F-7). The fractional SDR is equivalent to (HS) by bipartite integrality. What collapses to (DL) is the mass-transport `t`-sum. |
| Obligation 4 ("`(1,t)` row") | — | Vacuous for `t ≥ 2`; restrict it to `k = 2`, which is now trivial by item 10. |
| "eight candidates"; lexical "zero collision" | literals | **Struck.** Nine candidates are listed. The lexical hits exist and none is a match. |

## Cross-route reconciliation

Paired-critic positions, claim by claim. None is averaged.

1. **The refutation of (HS).** C-F1-T and C-F1-U, working in isolation from each other, found the same tree. I checked by canonical form that their two printed edge lists, `R(3,2)` and `T(3,1)` are all one isomorphism class. Their families differ in parametrization, `R(d,m)` (m legs of 3 edges) versus `T(d,r)` (2 legs of `2r+1` edges), and both are correct. They meet at `T22 = R(3,2) = T(3,1)`, and both are specializations of `U(d,m,r)` (see `## Established results`, item 2). Agreement, not conflict.
2. **The order-21 horizon.** The controller facts record says "order 21 is exhaustive on one instrument only". **Corrected:** order 21 rests on two instruments whose outputs reconcile.
   - C-F1-T used its own generator and Kronecker DP (`order21_result.json`, digest recomputed `5decec9c…`). It found 2,144,505 classes, 32,100,522 `(T,k)` instances, 0 failures and 24 tight events, with a Kuhn-matching sample of 642,036 instances and 0 mismatches.
   - C-F1-U used F1's generator and DP (`order21.json`, digest recomputed `46aae48a…`). It found 2,144,505 classes, equal to A000055, 0 failures, 24 tight instances on 19 trees, and 0 tight at `min c_v`.
   - Each critic saw only its own run. Together they are two instruments. I inspected both outputs and did not re-execute either.
3. **Candidate 7's alias target.** C-F2-T calls it a near-alias of `E993-R27-DEGREE-LEMMA-K1-ACYCLICITY-CRITERION`. C-F2-U calls it the `k = 1` instance of the reformulation key's scope text. **C-F2-U is right on the registry text.** The scope of `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2` reads "The general weight identity `2k·i_k − D_k = Σ_v (2 − deg v)·c_v(k)` holds for every finite graph". At `k = 1` that is F2's identity verbatim. **Ruling:** a scope note on the reformulation key, with a cross-reference on the K1 criterion (`Z` isolated vertices versus the component count `c`, which C-F2-T correctly distinguishes). No new key.
4. **Candidate 1 disposition.** C-F2-T says merge it with T1's duplicate. C-F2-U says fold it into candidate 3 as the case `m = 1`. **Both, compatibly:** L1 is the `m = 1` case of the pendant-path leaf-dominance key, with joint attribution to T1 and F2 at the alias gate.
5. **Unicyclic horizon.** C-F2-T reaches order 13 (132,610 tree-plus-edge objects, covering every class). C-F2-U reaches order 14 (61,131 distinct classes). Both find 0 failures, which is consistent. Both float "(HS) on connected graphs with `|E| ≤ n`". That class contains every tree, so the conjecture is refuted by `T22`. The unicyclic-only form is refuted at order 22 by my probe (see `## Rejected and narrowed mechanisms`). Neither F2 critic could see `T22`: the critics were isolated.
6. **C-F2-U F-3, the residual-Hall strengthening** (own leaves first, smallest `c`, then threshold Hall on the rest; 0 failures on 21,537,555 instances to order 17). By its own statement its success implies (HS), so `T22` refutes it. Checked explicitly at `k = 12`:
   - The root has 0 pendant directions and 1 slot.
   - Each hub reserves one own leaf with `c = 17`, leaving three free leaves at 17.
   - The root slot needs `c ≥ 18`, and none remains.

   The controller facts line "'own leaves first, then match the rest' holds to order 17" is correct as a horizon statement and is **refuted at order 22**.
7. **Consistency across routes.** The critic theorem "(HS) holds when every `btd ≤ 2`" (see `## Established results`, item 8) is consistent with every counterexample:
   - `T22`'s root has `btd = 3`.
   - Every `U(d,m,r)` root has `btd = d ≥ 3`.
   - The order-10 smallest residue tree (`U(3,2,0)`) does not fail.

   So the failure lives exactly in the residue that both F2 critics named. Every T-route proof of (HS) must fail at some step on `T22` at `k = 12` (the root's slot).

## Established results

Grades follow `SOLUTION-CONTRACT.md` §4. "STATED" means first made at a review stage; it needs an isolated second read before registration.

1. **(HS) is false: `T22`, order 22** — exact finite computation, confirmed by independent instruments; pending the isolated second read SR-HS-REF. Critic-attributed: found independently by `C-F1-T` and `C-F1-U`.
   - *Tree.* A root `0` joined to three hubs; each hub carries two pendant paths of 3 edges. The critic edge lists are `0–1, 1–2, 2–3, 3–4, 1–5, 5–6, 6–7, 0–8, 8–9, 9–10, 10–11, 8–12, 12–13, 13–14, 0–15, 15–16, 16–17, 17–18, 15–19, 19–20, 20–21`.
   - *Structure.* `Br = {0,1,8,15}` (all degree 3, one slot each). `L = {4,7,11,14,18,21}`. The slot count is `4 = |L| − 2`. `IsTree` is checked by `|E| = n − 1`, BFS connectivity, and a separate union-find acyclicity test.
   - *Counts.* `i = [1,22,210,1144,3933,8907,13470,13529,8856,3691,975,171,19,1]`, `α = 13`, with 54,929 independent sets.
   - *At `k = 12`:* `c_0 = 18`, `c_{1,8,15} = 0`, and all six leaves have 17. So `slots_{≥18}(12) = 1 > 0 = leaves_{≥18}(12)`, and the maximum matching in `H_12` is 3 of 4.
   - *At `k = 11`:* `c_0 = 141`, hubs 4, leaves 136. The inequality fails for `t = 137..141` (1 > 0), and the matching is 3 of 4.
   - *(DL) holds at every `k`.* For example `D_12 = 372 ≤ 456` and `D_11 = 3099 ≤ 3762`. The formal (DL) of record is untouched.

   **Instruments:**

   | Source | Method | Result |
   |---|---|---|
   | C-F1-T | Kronecker DP; backtracking enumeration of all 54,929 sets; F1's DP; hand proof | reproduced |
   | C-F1-U | in/out DP; DP-free enumeration; F1's DP; hand count | reproduced |
   | **This adjudicator** (`adj_t22.py`, own code, digest `1964cbe7…`) | (a) literal scan of all `2^22` vertex subsets by bitmask, no DP and no polynomial; (b) a separate forest-product DP, identical to (a) on every `i_k` and `c_v(k)`; (c) closed form `[x^11](1+3x+x²)^6 = 18`; general augmenting-path matcher on the explicit `H_k` | **reproduced exactly**: failing `k ∈ {11,12}` only |
   | Controller prior | `r22_check.py` brute force | reproduced (a prior, weighed as one more replay) |

   My instrument was first validated on all 2,288 free trees of orders 1–13: the counts equal A000055, the enumeration and the DP agree, `Σ_v c_v(k) = k·i_k`, `c_v(0) = 0`, `c_v(1) = 1`, and the star and `S(2,1,1)` fixed points hold (digest `6b6367eb…`). The two-instrument requirement of stop gate §5(b) is **met**. Only the isolated second read remains.
2. **Infinite family `U(d,m,r)`, for `d ≥ 3`, `m ≥ 2`, `r ≥ 1`.** A root `o` is joined to hubs `h_1..h_d`, and each hub carries `m` pendant paths of `2r+1` edges. So `n = 1 + d(1 + m(2r+1))`.
   - At `k* = α − 1 = dm(r+1)`: `c_o(k*) = dm·C(r+2,2)`, `c_ℓ(k*) = (dm−1)·C(r+2,2) + C(r+1,2) + 1` for every leaf, and `c_{h_i}(k*) = 0`.
   - So `c_o − c_ℓ = r`, and at `t = c_o(k*)` we get `slots_{≥t} = d − 2 > 0 = leaves_{≥t}`. The deficit `d − 2` is unbounded.

   *Proof* (both critics' arguments, merged):
   1. `P_{2r+1}` has a unique maximum independent set, of size `r+1`, which contains its endpoint.
   2. With `h` out, a hub group has maximum `m(r+1)`, attained uniquely. With `h` in, it has at most `1 + mr`, which is smaller than `m(r+1)` because `m ≥ 2`.
   3. So `α = 1 + dm(r+1)`, and the only root-free set of size `k*` is the all-maxima set, which contains every leaf.
   4. Sets containing `o` exclude every hub, so exactly one of the `dm` legs is one short. That gives `dm·i_r(P_{2r+1}) = dm·C(r+2,2)`.
   5. A leaf misses exactly the short-leg sets of its own leg that avoid it: `C(r+2,2) − C(r+1,2)` of them. It gains the single root-free set.
   6. A set containing `h_i` has size at most `k* − (m−1) < k*`. ∎

   `R(d,m) = U(d,m,1)` is C-F1-T's family and `T(d,r) = U(d,2,r)` is C-F1-U's. Their proofs, which I checked step by step, are the cases `r = 1` and `m = 2`. The merged statement is adjudicator-derived and STATED.
   - I verified the closed forms mechanically for every `(d,m,r)` with `3 ≤ d ≤ 6`, `2 ≤ m ≤ 5`, `1 ≤ r ≤ 3` and `n ≤ 90` (`families.json`, digest `bf8ccb85…`). Enumeration cross-checks every member with `n ≤ 24`.
   - The cases `m = 1` and `r = 0` never fail.
   - The failure is not confined to one `k`. `R(3,4) = U(3,4,1)` fails at every `k = 12..24` (`α = 25`), as C-F1-T states, and `U(3,5,1)` fails from `k = 12` up to `k = 30 = α − 1`.
   - Grade: `proved_informal` for the family (critic-attributed; merged form adjudicator-derived), pending second read.
3. **Further counterexamples**, all replayed by my instrument, including enumeration since `n ≤ 24` (hub-arm notation: root arms listed by leg lengths):

   | Order | Arms | Failing `k` | Top `c` values | Found by |
   |---|---|---|---|---|
   | 23 | `(3,3),(3,3),(3,4)` | `k = 12` | 49 vs 48 | both F1 critics |
   | 23 | `(3,3),(3,3),(2,2,3)` | `k = 12` | 64 vs 62 | both F1 critics |
   | 24 | `(3,3),(3,3),(2,3,3)` | `k = 12, 13` | 300 vs 287; 37 vs 35 | C-F1-U |
   | 24 | `(2,2,2),(2,2,2),(2,2,2,2)` | `k = 10, 11` | 5120 vs 4851; 1024 vs 976 | C-F1-U |

   The last row is the even-leg mechanism. My own two-level hub search to order 26 (206,342 distinct trees) finds failing trees at orders 22/23/24/25/26 = 1/2/2/5/9, with 34 failing `(T,k)` instances.
4. **Census record `E993-R28-DOMINANCE-CENSUS`** (`bounded_computation`):
   - The threshold form is exhaustive to **order 21** on two reconciled instruments.
   - The matching form with a general matcher is exhaustive to **order 20** on two critic instruments.
   - Orders 2–20 are reproduced by four independent instruments: F1, the two F1 critics, and this adjudicator (next bullet).
   - **Adjudicator third-instrument census**: `adj_census.py 20` uses my own leaf-augmentation generator with a centre-AHU canonical form and my own forest DP, independent of F1 and of both critics. It checks every free tree of orders 2–20: 1,346,023 classes, each order equal to A000055. It finds **0 (HS) failures** and **3 + 2 tight `(T,k)` instances** at orders 19 and 20, with none at order ≤ 18, matching F1 and both critics exactly (`census_20.json`, canonical digest `7410ef62…`). The matching form is not re-run at scale; on my validation set to order 13 the general matcher and the threshold form agree on every `(T,k)`.
   - Tight instances: 5 at orders 19–20, each a single-slot versus single-leaf tie at the top of the ladder; 24 at order 21 (19 trees); none at `t = min c_v`, under the scoped definition.
   - The tight trees were the precursors. Lengthening the short leg of F1's order-20 tight tree gives `T22`.
   - **The minimum counterexample order is 22**, on two instruments at order 21 and three or more at order ≤ 20.
   - Whether `T22` is the only counterexample at order 22 is **open**. That needs an exhaustive order-22 census (5,623,756 classes).
5. **Rank lemma** (C-F1-T; critic-attributed; `proved_informal`). Sort the slot values `s_1 ≥ s_2 ≥ …` and the leaf values `l_1 ≥ l_2 ≥ …`. Then (HS) at `(T,k)` holds iff `s_j ≤ l_j` for every `j ≤ |L| − 2`. With the corrected nested-neighbourhood argument (`S' = {c ≥ min_S c}`), this is a complete informal proof of the SDR/threshold equivalence for each `(T,k)`. It uses finiteness only. Every known failure is at `j = 1`, which is why it is visible on the top slot.
6. **Local-lemma map** (F2; replayed by both critics and, at the minimal witnesses, by me). L1 and L6 are `proved_informal` for any graph with a degree-1 vertex. L2 is refuted at order 6, L4 at order 10 (exact characterization `btd ≥ 3`), and L5 at order 8. The (PW) branch-versus-leaf form is refuted: the **smallest witness is order 9, `k = 5`, and it is unique at order 9** (edges `0–1, 0–2, 0–3, 1–4, 1–5, 2–6, 3–7, 4–8`; max branch `c = 2 >` min leaf `c = 1`; `adj_pw.py`). This confirms erratum R28-E-b by my own replay.
7. **Pendant-path leaf dominance, with an exact identity** (`C-F2-T` Finding 1 and `C-F2-U` F-1, derived independently; also reported by T critics per the controller record). Critic-attributed, `proved_informal`, STATED, needs the second read.
   - *Statement.* Let `G` be any finite simple graph and `w = u_0 – u_1 – … – u_m = ℓ` a path with `deg u_i = 2` for `0 < i < m` and `deg ℓ = 1`. Let `R := G − {u_1..u_m}`, `A := R − N_R[w]` and `B := R − w`. Then
     `Σ_k (c_ℓ(k) − c_w(k)) x^k = x·(I(B) − I(A))·I(P_{m−2})`, which has nonnegative coefficients, with `I(P_{−1}) = I(P_0) = 1`.
   - *Check.* I re-derived it: `G − N[w] = A ⊔ P_{m−1}`; `G − N[ℓ] = H` splits on `w` into `I(B)·I(P_{m−2}) + x·I(A)·I(P_{m−3})`; and `I(P_{m−1}) = I(P_{m−2}) + x·I(P_{m−3})`. The cases `m = 1, 2` follow from the conventions.
   - *Hypotheses.* The degree pattern and finiteness only: no connectivity, no acyclicity, no `n ≥ 2`. It is not (PW), because the leaf is compared only with vertices on its own pendant path.
8. **(HS-SDR), hence (HS), holds on every tree whose branch tree has maximum degree ≤ 2** (`C-F2-T` Finding 2 and `C-F2-U` F-2, independently). Critic-attributed, `proved_informal`, STATED, needs the second read.
   - *Proof.* On a tree, `p(v) = deg v − btd(v)`, by acyclicity plus the unique first branch vertex on each leaf's inward walk, which uses connectivity. If every `btd ≤ 2`, assign each slot to a distinct own pendant leaf; item 7 makes every pair admissible. I checked the proof.
   - *Checks.* My census confirms the own-leaf assignment on every non-residue tree, with 0 violations to order 20.
   - *Residue sizes.* My census reproduces C-F2-T's residue counts exactly: 1, 4, 19, 77, 287, 1002 at orders 10–15. It adds 3,365, 10,853, 34,088, 104,574 and 315,116 at orders 16–20. The order-17 value equals C-F2-U's figure of 15,608 outside the class to order 17, minus the earlier orders.
   - Every counterexample lies in the residue.
9. **F2 §4, `(k,t) = (1,1)`:** `Σ_{Br}(deg−2) = |L| + 2(|E| + Z − n)` on any finite graph. It is correct, and it becomes a scope note (see `## Cross-route reconciliation`, item 3).
10. **(HS) holds at every `k ≤ 2` on every finite tree** (adjudicator-derived, STATED; elementary).
    - At `k = 0` all `c = 0`.
    - At `k = 1` all `c = 1` and `|L| − 2 ≤ |L|`.
    - At `k = 2`, `c_v(2) = n − 1 − deg v` for every vertex of any simple graph (the critics' closed form). So every branch vertex has `c_v(2) ≤ n − 4 < n − 2 = c_ℓ(2)`. Any `t` with `slots_{≥t} > 0` therefore has `leaves_{≥t} = |L| ≥ |L| − 2 ≥ slots_{≥t}`.
    - Hypotheses: `IsTree` enters only through the slot count at `n ≥ 2`; `n = 1` is vacuous.
11. **Unicyclic counterexample** (adjudicator-derived, STATED, bounded computation). `T22 + {0,3}` has order 22 and 22 edges, and is connected and unicyclic: the extra edge joins the root to the middle vertex of one leg.
    - At `k = 12`: `c_0 = 17`, the root now has degree 4 (2 slots), and the leaves are `16,16,16,16,16,17`. So `slots_{≥17} = 2 > 1 = leaves_{≥17}`.
    - At `k = 11`: `c_0 = 126`, and `slots_{≥126} = 2 > 1`.
    - This is confirmed by two methods: the `2^22` bitmask scan (`probe.json`) and a separate `itertools.combinations` enumeration of all `k`-subsets (`uni_check.out`, digest `9b68a36a…`).
    - Of the 210 single-edge additions to `T22`, 75 fail.
    - The minimum order of a unicyclic counterexample lies between 15 (C-F2-U's null to order 14) and 22.

## Rejected and narrowed mechanisms

- **(HS) and (HS-SDR), the Tier 1 target `E993-R28-TREE-LEAF-SLOT-DOMINANCE`: FALSE.** The Lean statement `tree_leaf_slot_dominance` is false and is withdrawn as a Stage 7 target.
- **Strengthenings refuted by `T22` or the family**, each with its smallest witness:
  - `k ≥ α − 1` restriction: `T22` at `k = α − 1`.
  - `k ≤ α − c`: `U(3,m,1)` fails at `k = 12` for every tested `m = 2..5`, with `α = 6m + 1`. So failures occur as low as `k = α − 19`, and the restriction is refuted for every `c ≤ 19`. Whether the failure persists at `k = 12` for every `m` is not proved here.
  - Additive repair `slots_{≥t} ≤ leaves_{≥t} + C`: `U(C+3,2,1)` has deficit `C + 1`.
  - Weak majorization of the ranked profiles (`Σ_{j≤J} s_j ≤ Σ_{j≤J} l_j`): `T22`, `J = 1`, 18 > 17. It fails on all 169 failing `(T,k)` instances checked: 34 from the hub search and 135 from the `U` grid. The two sets overlap at their small members, for example `T22`.
  - Stop-loss / convex-order form (`Σ (c_v − t + 1)_+`): `T22` at `t = 18`, 1 > 0.
  - Residual-Hall strengthening (C-F2-U F-3): `T22`.
  - "(HS) on connected graphs with `|E| ≤ n`": `T22`, a tree.
  - (HS) on connected unicyclic graphs: `T22 + {0,3}`.
- **(PW) branch-versus-leaf:** refuted, minimal order 9, `k = 5`. The contract's cited order-5 witness is leaf-versus-leaf (erratum R28-E-b, confirmed).
- **Local lemmas:** L2 refuted (order 6), L4 refuted with the exact characterization (order 10), L5 refuted (order 8).
- **Narrowed:**
  - F1's matching-form independence claims, struck literals and Hall step 5, as ruled under `## Route-by-route decisions`.
  - F2's L2 minimality argument, candidates 7 and 9 (scope notes), candidate 8 renamed `E993-R28-DOMINANCE-UNICYCLIC-CENSUS` and bounded by the order-22 unicyclic counterexample, and the "fractional" wording.
- **Surviving strengthening candidates** (adjudicator-derived, STATED, `bounded_computation`; for the refutation record's "weakest surviving matching-type strengthening"). Prefix dominance with offset `o`:
  `P_o: Σ_{j≤J} s_j ≤ Σ_{j≤J+o} l_j` for every `J`.
  - Both `P_1` and `P_2` hold on **all 169 failing `(T,k)` instances checked** (the same overlapping sets).
  - (HS) implies both, so they also hold on every tree to order 21.
  - `P_2` at `J = |L| − 2` is exactly the leaf/branch form of (DL), so `P_1 ⇒ P_2 ⇒ (DL)` on trees.
  - Neither is proved. Every failure tested belongs to the two-level hub class, so this evidence is narrow.

## Lean readiness

The F portfolio contains **no compiled Lean fragments**. Every item below is at the informal level in this orientation's evidence.

| Target (`SOLUTION-CONTRACT.md` §2) | (a) Complete informal proof, closed DAG | (b) Compiled sorry-free fragments (F evidence) | (c) Open nodes | Ruling |
|---|---|---|---|---|
| (HS) `tree_leaf_slot_dominance` | n/a — **the statement is false** (`T22`) | none | — | **Withdrawn.** No Stage 7 attempt. The only formal object is its negation (below). |
| (LC) `dominance_implies_degree_lemma` | yes (F1 derivation steps 1–4; F2's 30,103-instance check; both critics confirm) | none in F | none mathematically | The implication is true and remains formalizable. It now yields **no** second proof of (DL), because its hypothesis fails on `T22` (at `k = 12`, `t = 18`). Keep the `t = 0` quantifier choice per erratum R28-E-a. Value: a lemma only. |
| (FC) `forest_degree_lemma_of_components` | not in F evidence | none | — | Not ruled here (U's portfolio). Erratum R28-E-c applies: the hypothesis must hold at every `a ≤ k`. |
| SDR/threshold equivalence | yes: C-F1-T's rank lemma plus the corrected nested-Hall step (critic-attributed) | none in F | none | Mathematically ready. Its value is unchanged: both forms fail together on `T22`. |

**F-orientation award groups:**

1. **`E993-R28-DOMINANCE-REFUTATION` — ready for registration, not for Lean this cycle.**
   - *Statement:* the finite tree `T22` above, at `k = 12`, `t = 18`, has `slotsAtLeast = 1 > 0 = leavesAtLeast`, with exact counts. The family is `U(d,m,r)`, `d ≥ 3`, `m ≥ 2`, `r ≥ 1`.
   - *Hypotheses:* `IsTree` is checked (connectivity and acyclicity separately), `n = 22 ≥ 2`, `k = 12 ≥ 1`, `t = 18 ≥ 1`.
   - *Fences:* no transfer to any no-recovery claim, the aggregate, TREE/FOREST or Erdős #993. (DL) is unaffected.
   - *Status:* registration awaits SR-HS-REF.
   - *Optional formal target:* `¬ ∀ …, slotsAtLeast G k t ≤ leavesAtLeast G k t`, via `T22` on `Fin 22`. It is **not ready**. Kernel `decide` over `powersetCard 12 (Fin 22)` (646,646 subsets) is infeasible, and `native_decide` is forbidden. The smallest open formal node is the explicit description `indepSetFinset 12 T22 =` (the 19 listed sets). It needs a structural proof: the uniqueness of the `P_3` maxima and one short leg, as in `## Established results`, item 2.
2. **Pendant-path leaf dominance** (item 7). Contract-ready as a Tier 3 structural key **after its second read**.
   - *Statement:* the exact identity, for any finite simple graph.
   - *Hypotheses:* the pendant-path degree pattern only.
   - *DAG inputs:* `c_v(k) = i_{k−1}(G − N[v])`, multiplicativity of `I` over disjoint unions, the path recurrence, and monotonicity of `I` under induced subgraphs. The DAG is closed.
   - It is a clean Lean candidate. No fragment exists.
3. **Branch-tree-degree ≤ 2 dominance** (item 8). Informally complete after second read. It is not Lean-ready: branch-tree and pendant-direction definitions are needed. It is a partial result about (HS) on a subclass and is not a Tier 1 surrogate.
4. **(HS) at `k ≤ 2`** (item 10). Trivial. Register it only as a scope note on the refutation.

No fixed-band or bounded result is presented as ready. The census, the unicyclic counterexample and the `P_1`/`P_2` data are `bounded_computation`.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

- The decisive fact of the cycle comes from this orientation: (HS) is refuted, by an order-22 tree and an infinite family with unbounded deficit.
- The census horizon moved from the controller's order-18 prior to exhaustive order 21 on two instruments. The minimum counterexample order, 22, is established on those instruments.
- The local-lemma map is complete. Every chartered local lemma is either proved (L1, L3, L6) or refuted with a minimal witness (L2, L4, L5).
- **Stop gate §5(b):**
  - An in-scope counterexample with exact counts exists. ✓
  - It is confirmed by two or more independent instruments: C-F1-T, C-F1-U, and this adjudicator's own `2^22` scan with a separate DP. ✓
  - The isolated second read SR-HS-REF is **pending**. I have not seen it.
  - If SR-HS-REF confirms, the run ENDS under §5(b). The refutation is registered, and the weakest surviving strengthening is recorded as the `P_1`/`P_2` candidates at `bounded_computation`.

## Headline assessment

headline_resolved: no
status: refuted

- I rule (HS) `refuted` at this orientation's evidence grade. I verified the counterexample with my own independent instrument, and I checked both family proofs step by step.
- `headline_resolved` stays `no`: the governed event needs SR-HS-REF and the controller's registration.
- No status transfers to (DL), whose formal award is untouched, or to any fenced object in `SOLUTION-CONTRACT.md` §3.1.

## Next-route allocation

**Exact remaining obligation for orientation F.**
1. The isolated second read SR-HS-REF of `T22`, at `k = 12, t = 18` and `k = 11, t = 137..141`, and of the `U(d,m,r)` proof.
2. The refutation record's companion: the weakest surviving strengthening of (DL). The smallest untested case is `P_1` on trees outside the hub class. Any failure of (HS) not of two-level hub type would test it.
3. Uniqueness and minimality at order 22: an exhaustive census of 5,623,756 classes. Order 21 is already clear on two instruments.

If §5(b) fires, these are the recorded residue and no Cycle 2 runs. If the run continues, the routes are:

1. **F-route A — `DOMINANCE-REFUTATION-CLASS-CENSUS`.** Exhaustive order 22 on two independent instruments (threshold form plus a general matcher). List every order-22 counterexample. Push the unicyclic minimum, currently between 15 and 22. *Could close in one cycle:* uniqueness of `T22` at order 22, and the unicyclic minimum order.
2. **F-route B — `PREFIX-DOMINANCE-P1-ATTACK`.** Try to refute `P_1`, then `P_2`, on adversarial non-hub shapes: three-level hubs, mixed odd/even legs, and branch trees with several `btd ≥ 3` vertices. If both survive, attempt a proof of `P_2` by the pendant-path identity plus a transport over the branch tree. *Could close in one cycle:* a refutation of `P_1`, or a bounded record of it to a stated horizon.
3. *(Third, if capacity allows)* **U/F-route — `FORMAL-REFUTATION-T22`.** A Lean proof of the negation of `tree_leaf_slot_dominance`, through a structural enumeration lemma for `indepSetFinset 12` on `T22`, without `decide` over an enumeration. *Could close in one cycle:* a formal refutation, which is optional since §5(b) does not require it.

## Artifact inventory

All written by this adjudicator under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-degree-lemma-hall-sdr-dre-2026-09-24/scratchpad/c1-adj-F/`. They use the standard library only, with exact integers. File SHA-256 values:

| File | Role | SHA-256 |
|---|---|---|
| `adj_inst.py` | Instrument: `2^n` subset scan, forest DP, threshold (literal / step-piece), general matcher, tree test | `c8ae636cc676df04d66528de2f988fc2eac1b0f78a4315cd7311260bb96d5c28` |
| `adj_trees.py` | Canonical form, generator, `hub_tree`, `R_dm`, `T_dr`, `U_dmr` | `099aa20196136c4c83430b01b7b9f8d6bc01b3548f43d0cc65c1f6ff345234da` |
| `adj_validate.py` → `validate13.out` | Validation to order 13 (digest `6b6367eb…`) | `9f83aba6…c339` → `57ac7168…6ea0` |
| `adj_t22.py` → `t22_replay.json` | `T22` replay (literal `t`; digest `1964cbe7…`, reproduced on rerun) | `3b17f29e78bba3f4c1872c3850963c1de5d6811d412706129cd37fc10fbd634e` → `1964cbe7a47fe843b5a165e46c954d49f55f86c13cfee6461b6ca5e14ee86562` |
| `adj_families.py` → `families.json` | `U(d,m,r)` grid and the order-23/24 counterexamples | `cd1745fa…c1f` → `bf8ccb85b31950f60e2f30ea88bb57cfeed4d4191fdde37da010cb63f41cc8f5` |
| `adj_probe.py` → `probe.json` | Unicyclic probe, hub search to order 26, `P_0/P_1/P_2` | `6229316b…bc16` → `162c69047f521a82f3742e01b63894739752209958a915ae1969797a67b9512c` |
| `adj_uni_check.py` → `uni_check.out` | `T22 + {0,3}` by `itertools.combinations` (digest `9b68a36a…`) | `6a24a472…d3a5` → `ae1ff629…e8f` |
| `adj_lemma_witness.py` → `lemma_witness.out` | L2, L5, `S(2,2,2)`, F1 order-20 tight rows (digest `60aede37…`) | `8409b488…5c22` → `4496b03a…016a` |
| `adj_pw.py` → `pw.out` | Branch-vs-leaf (PW) minimum, order 9 (digest `9bd48306…`) | `de3d687e…e1c` → `4422b337…a675` |
| `adj_census.py` → `census_16.json`, `census_20.json`, `census16.out`, `census20.out` | Third-instrument census to 16 and to 20 | `8bcdaed4…a2afa` → `fcb9a7d5…37fa`, `7410ef62f9c8f8920e20a64c0fdcf69e84c95a26b9d8008ac6e423a236edb5e1` |

- Copy-outs (inputs, not re-executed) are under `copyout/cF1T/` and `copyout/cF1U/`. Their file SHA-256 values: `crit_order21.py 7a2d67a7…`, `order21_result.json 5decec9c…`, `order21.log 946fd19e…`; `order21.py 4e4e7143…`, `order21.json 46aae48a…`, `order21.log 3c775e7e…`.
- The reading copies of the returns and critiques (`_F2.txt`, `_cF1T.txt`, `_cF1U.txt`, `_cF2T.txt`, `_cF2U.txt`) are byte copies of capsule members.
- Background jobs: the census, PID 40013 (`census.pid`), ran to completion and was confirmed exited by `kill -0 40013` before this write. `adj_families.py` (PID 38424) and `adj_probe.py` (PID 38594) were confirmed exited the same way. The harness-promoted first `adj_families.py` was stopped by harness task ID `b7v1vl9e8` (see `## Identity and seal audit`). The harness wait loops and the monitor for the census (tasks `b3pq3ntow`, `bjev7vot0`, `bzaas8bb5`) have all ended. No job of mine is running.
- Only this `ADJUDICATION.md` and the scratch directory above were written.
