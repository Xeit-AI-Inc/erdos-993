# Orientation Adjudication

Cycle 3, Stage 5, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`). Orientation F (falsify). The portfolio is
seats `F1` (`C3-F-01 INVARIANT-CLASS-UNION-CUT-SEARCH-ON-SWITCH-NECESSARY-ROWS`) and `F2`
(`C3-F-02 UNREACHABLE-CAPACITY-FAMILY-CLOSURE`), plus the four cross-orientation critiques `C-F1-T`, `C-F1-U`, `C-F2-T` and
`C-F2-U`. The object is (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, which is OPEN.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other VerityOS subsystem.

## Identity and seal audit

- **Dispatch.** `control/dispatch/c3-stage5/DISPATCH-ADJ-F.md` hashes to
  `e70b700f21af9ab5fb03e33309fbdd490c5fa4da4f156822961e7a49ac19d0bc`. I verified this before reading it. **Match.**
- **Capsule seal.** For `control/c3-adjudicator-capsules/F-PACKET-MANIFEST.json`, I recomputed the canonical JSON without
  `seal_sha256` (sort_keys, `(",", ":")`, no trailing newline). It gives
  **`cf249ea34ccf3945b6b5b823c7777ca1a26be149e942c84ec14f88fda85f8cb8`**. **Match.**
  - All 20 listed members match their byte counts and SHA-256.
  - `PATH-CHECK-F.json` records 0 findings.
- **Stage seals, recomputed canonically:**
  - Stage 2: `5df4c603…52752416` (1051 files), match.
  - Stage 3: `64c6c84a…5b294797` (35 files), match.
  - Stage 4: `25f6f51a07ff8427379ef50c03c5e172dc260cafa72f1def8afb6dc67424d495` (53 files), match.
  - The returns and critiques in the Stage 3 and 4 manifests and in the admissions carry the same digests as the capsule:
    - F1 `3f4bc4c2…`, F2 `5a27881f…`;
    - C-F1-T `2259910a…`, C-F1-U `cabbe53b…`, C-F2-T `1e12e236…`, C-F2-U `7c9e8648…`.
  - Admissions: Stage 3 admitted 6 of 6 with 0 findings; Stage 4 admitted 12 of 12 with 0 findings. All four critiques in
    this portfolio are `retained_narrowed` with `headline_resolved: no`.
- **Model disclosures on record:**
  - F1 and F2: chartered sonnet/xhigh, runtime `claude-sonnet-5`.
  - All four critics: chartered opus/medium, runtime `claude-opus-5-5[1m]`.
  - Each agrees with the allocation and with CF-4.
- **Controller facts (`C3-STAGE5-CONTROLLER-FACTS-F.json`).**
  - I read the facts file as one more instrument, not as authority.
  - The replay records it cites (`control/controller-facts/CF-REPLAY-c3*.json`) and the disclosures addendum are not
    capsule members, so I did not open them.
  - Where a controller fact states a number, I replayed that number myself (below) instead of relying on it.
- **Read-boundary disclosures (adjudicator):**
  1. The host injected the project `CLAUDE.md` and the user auto-memory index into my session context automatically. I did
     not open either file, and nothing from them is used as evidence.
  2. I ran three non-recursive `ls`, all inside the grant: `scratchpad/c3-F1/`, `scratchpad/c3-crit-F1-T/` and
     `scratchpad/c3-crit-F1-T/own/`.
  3. I ran one `grep` over my own copied-out files inside `scratchpad/c3-adj-F/`.
  4. I did not read `scratchpad/c3-F1-replay/`. Its name is not literally `c3-<seat>/`, and both F1 critics established byte
     parity with `c3-F1/`.
  5. I read nothing under `sources/`, and no seat or critic instrument that I replayed imports from `sources/`.
  6. No network, no installs, no Lean. I used `python3 -B` with the standard library and exact integers.
  7. Process note: `famflow.py` imported my own `classpos.py`, whose unguarded top-level block re-ran its checks once. That
     was harmless duplicate work, and I added a main guard.
  8. No background job was started, and none is running at this write.

## Route-by-route decisions

### F1 — `C3-F-01` (route verdict `bounded_evidence`, upheld)

**What F1 did.**

- For `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`, F1 computed exact `α`, `x`, `|F|`, supply, capacity and `S`. It
  also computed the exact `(r, v, q)` class decomposition of supply.
- F1 computed **no** neighbourhood `N(X)` under (D), (S) or both. The chartered class-union cut search (allocation item 3(a))
  was therefore **not executed**. Part (c) was not attempted.

**Fidelity (duty 3).** Checked against F1's code and against my own instrument:

- `w_F` counts active tags only: `c_ij` is active iff `u_i ∈ B`, and `v` is active iff `r ∈ B`.
- `F` is fixed at rank `p`. F1 derived it from two orbit representatives. That is valid under the explicit automorphisms
  (chokes of equal `d` permute, and supports permute within a choke). I also derived it **leaf by leaf** on all 689, 713
  and 737 leaves: `F = all leaves`.
- `x` is computed through `α`.
- `supply − capacity = S` is asserted from independent sides: the closed-form `W(x)` against the `H_v`/`R_v` tree DP.
- No relation is implemented, so there is no relation-fidelity question.
- **Fidelity passes.** No number is struck on fidelity grounds.

**Row data, replayed by my own instrument.**

- The instrument (`own/adj.py`) is new code. It shares nothing with F1 or the critics.
  - A memoised forest-polynomial DP.
  - A direct active-weight DP over the states IN, OUT-none, OUT-pending-tag and OUT-other. It never touches `H_v` or `R_v`,
    so it is independent of the WID side.
  - `S` built from literal deleted forests.
  - Tree tests: connectivity (DFS) and acyclicity (union-find) as separate predicates, plus `|E| = n − 1`.
  - Validated on 400 random trees against brute force with WID at every rank: 0 mismatches.
  - Every fixed point reproduced: `K_{1,12}/8`, both path-stars (including their flows), `CB(1,7)/10` and `CB(2,5)/10`.
- **All nine of F1's printed integers equal mine digit for digit.** I compared them by script against the return text. The
  exact values are:

  | Row | `n` | `α` | `x` | window | `\|F\|` |
  |---|---:|---:|---:|---|---:|
  | `CB(8,86)/460` | 1465 | 775 | 458 | [460, 516] | 689 |
  | `CB(8,89)/476` | 1516 | 802 | 474 | [476, 534] | 713 |
  | `CB(8,92)/492` | 1567 | 829 | 490 | [492, 552] | 737 |

- The margin `capacity/supply − 1` is 0.012421190928…, 0.012240477299… and 0.012071368521….
- The supply and capacity digits are now backed by **three** independent instruments: C-F1-T `eng.py`, C-F1-U `inst.py`
  and mine. They were not backed by F1's own shipped code (see the strikes below).
- The `q`-class decomposition (`W_q` and the weight-1 sector `x²(1+2x)^{dm}`) sums exactly to **my** supply at all three
  rows.
  - The argmax is `q = 4`, with shares 0.2270, 0.2250 and 0.2222.
  - The `q = 1` shares are 0.0392, 0.0350 and 0.0312. The sector shares are 0.00098, 0.00084 and 0.00073.
  - **Retained**, `bounded_computation`. It is a statement about where supply mass sits, not about Hall slack.

**Strikes (both critics concur; I confirmed each on F1's shipped code, copied out to `replay-F1/`).**

- "eight small `(d,m)` pairs": `run_validate.py` has **six**.
- "`W(x)` verified … on 8 small cases": no shipped code checks `layer_weight_poly_closed` or `base_poly_closed` on small
  cases.
- "`run_classes.py`'s embedded validation, all `match: True`" and the "`sector_poly` … 7 small-case checks": the script
  computes `total_supply_from_classes` but never compares it with anything.
- "Every reported row … three independent confirmations" is **narrowed**:
  - `P_closed = P_dp` and WID against the aggregate on all three rows;
  - the frozen-instrument check on `m = 92` only (`α`, `x`, aggregate);
  - the `CB(1,7)` and `CB(2,5)` fixed-point checks are unshipped (the values are right on my instrument).
- "~340–~450-digit": read **328–353 digits** (see the cross-route reconciliation).
- "the Cycle 2 `computer_assisted` finding that the whole network saturates": the record is **sector** Hall only. **Struck.**
- The "new finding" status of the global totals is withdrawn. Two reasons:
  - C-F1-U's argument, which I verified: every maximal independent set of `CB(d,m)` contains at least one vertex of each
    (support, leaf) pair, so it has at least `dm > p` elements. Hence `N(I_{p+1}) = I_p`, and the whole-layer margin is
    exactly the known sign of `S`.
  - It is also a replay of the aggregate row with its two sides separated.
- The §7 WLOG lemma is **correct but subsumed** by the `formally_verified` C2-LA1 (an Aut-invariant, all-positive-weight,
  strictly deficient family exists whenever weighted Hall fails). It carries no key and no contribution credit (ruling 21).
  Its grade `proved` is not on the contract scale.
- The PID 72145 kill is self-reported and cannot be re-observed. Nothing depends on it.

**Part (c) miss.** The object was stated in F1's own granted allocation: the registered `CBstar` formula with `M` and `t`,
and the target `3(p−1) < 2(M+1)`. The miss was avoidable. C-F1-U executed part (c); see below.

### F2 — `C3-F-02` (route verdict `bounded_evidence`, upheld)

**Seat-authored proved content, retained at `proved_informal` (companion level; no key):**

- **Block recurrence.** `T_{j+1} = (1+3y+y²)T_j − y²(1+y)T_{j−1}`, with `T_0 = 1`, `T_1 = 1+3y+y²`, and the assembly
  `I(T(m,k)) = T_{m−1}·TailOut + W_{m−1}(OUT)·TailIn`.
  - I re-derived it with my own spine DP (state: last spine vertex in or out).
  - The spine DP equals the literal forest DP for `m < 30`, `k = 1..3`.
  - The recurrence holds identically for `j < 58`.
- **Closed forms** `H_1 = (1+3y+y²)^{k+1}` and `R_1 = (1+y)²(1+2y)^k`.
- **`Δ_{k+2}(R_1) = −2^k`** (degree `k+2`, leading coefficient `2^k`).
- **`Δ_{k+2}(H_1) < 0`** (real roots, Newton, palindrome centre `k+1`).

**Bounded content, retained at `bounded_computation`.** All of it reproduces on my instrument.

- For `T(m,2)`, `m ≤ 1500`:
  - `α(T(m,2)) = 2m+1`.
  - `x(T(m,2)) ≤ m` for `m = 3..1500`; `x = m` exactly on `3..18`.
  - `x` at `m` = 19, 50, 100, 200, 304, 400, 500, 1000, 1250, 1500 is 18, 48, 95, 190, 288, 379, 474, 947, 1184, 1421.
  - `Δ_{m+2}(T(m,1)) < 0` for `m = 2..1500`.
  - `Δ_m(T(m,2)) < 0` for `m = 3..1500`.
- For `G_k`: `S(G_k, k+3) ≤ −2` for `k = 3..250`. This is now superseded by the theorem below.
- The scalar rows `G_6`, `G_7`, `T(7,2)` and `T(8,2)`, and the `T(7,2)` deletion-only flow of 33026 (gap 133).

**Strikes (both critics concur unless noted; each confirmed by my replay).**

- (a) On `G_6`, `G_7`, `T(7,2)` and `T(8,2)`, F2 set `S` as `supply − capacity`, which is non-falsifiable (rulings 17 and 24).
  The column header "S (own, `H_v/R_v` side)" and "every row … two INDEPENDENTLY computed sides" are **struck as F2's
  certification**. The values survive: my instrument computes the two sides independently and they agree.
- (b) The `x`/`α` cells for `G_6`/`G_7` are not F2-instrument output (cited family facts). My instrument gives
  `α = 15, 17` and `x = 7, 8`.
- (c) The `f2_partC.py` line saying deletion-only saturation was "DIRECTLY verified" on `G_3–G_5` and `T(4..6,2)` is struck.
  F2's validation ran mixed flows only, and mixed saturation does not imply deletion-only saturation. The fact is true: my
  deletion-only flows saturate on every one of those rows.
- (d) "Equivalent" and "strictly weaker" for `Δ_m(T(m,2)) < 0`: it is a **sufficient** (logically stronger) condition for
  `x ≤ m`.
- (e) C1's `T(m,2)` "EQUIVALENT target" sentence is struck. The `G_k` half of C1 is a one-line corollary of (WID) and the
  registered `G_k` key, so it becomes a scope-note sentence, not new content.
- (f) "slack strictly growing": read "non-decreasing, with 78 strict unit rises on `m = 20..1500`, no decreases, maximum
  step 1".
- (g) "0.0528 at `m = 1000`": it is 0.053 there. 0.0528 is the value at `m = 1250`.
- (h) "165-digit" at `k = 250`: it has **175 digits** (C-F2-U only; I confirmed via the closed form).
- (i) Remaining obligation 1, "POSITIVE eigenvalues for every real `y ≥ 0`": false at `y = 0`, where the eigenvalues are 1
  and 0 (C-F2-U only). A5's own "for `y > 0`" is correct.
- (j) B3's "`k = 3..30` … printed exactly": nothing is printed. The claim is superseded by the theorem below.
- (k) "verified structurally" for the `G_k` automorphisms: no code checks this. My literal per-leaf computation gives
  per-leaf summands equal to the closed forms at `k ≤ 40`.
- (l) **P10 cited as a registered `proved_informal` key** (C-F2-T only). **Upheld.** The Stage 1 gate's count,
  443 = 434 + (WID) + 3 Cycle 1 keys + 5 Cycle 2 keys, names every key, and P10 is not among them. It must be cited as an
  unregistered second-read item. It is not load-bearing, because F2's code computes reachability directly.
- (m) The internal inconsistency on `G_6` ("attempted" versus "not attempted") is moot now that the flow has been run.

**Fence note.** Two rows lie in the formally closed band `n ≤ 2p+2`: `G_3/6` (`n = 14 = 2p+2`) and `T(4,2)/6`
(`n = 14 = 2p+2`). Any sign statement on these families contributes new content only for `k ≥ 4` and `m ≥ 5`. Both rows
remain legitimate (HALL) rows, since (HALL) concerns flows.

## Cross-route reconciliation

Paired-critic disagreements are resolved claim by claim below. Replays are weighed over self-reports, and no verdict is
averaged.

1. **Digit count of F1's integers.** C-F1-T says 328–353; C-F1-U says 329–353.
   - Replay: `S` at `CB(8,86)` has 328 digits, or 329 characters including the minus sign. The supply and capacity digit
     counts are 330, 342 and 353, and the `S` digit counts are 328, 340 and 351.
   - **C-F1-T is exact.** C-F1-U counted the sign.
2. **Two different critic advances on F1.** C-F1-T built a `(τ,q)`-class-union Hall test; C-F1-U built the order-1427
   switch-necessary tree. They do not conflict. They answer different sub-questions of the charter: 3(a) and 3(c).
3. **Scope of C-F1-T's class-union result (adjudicator finding).**
   - `classnet.py`'s reach set `R(A)` includes every source `B → A`, **including weight-0 members** of a class. So
     "weighted Hall for every union of `(τ,q)` classes" is literally correct, but it concerns **full** classes, whose
     neighbourhoods are enlarged by zero-supply members.
   - C2-LA1 locates any deficient family among all-positive-weight Aut-invariant families, and the positive-weight parts of
     class unions are such families. That test is not what was run at the three rows.
   - My own check (`own/classpos.py`) runs a class-aggregated max-flow in both versions, full-class and positive-part, on 73
     small `CB` rows. Those are all ranks of `CB(1,3)`, `CB(2,2)`, `CB(3,2)`, `CB(2,3)`, `CB(1,4)`, `CB(1,5)`, `CB(2,4)` and
     `CB(3,3)`, plus the eligible `CB(1,7)/10` and `CB(2,5)/10`.
     - The verdicts **agree on every row**: 43 deficient under both, 0 differing. Both eligible rows pass.
     - On the 32 rows the two instruments share, my full-class verdicts equal C-F1-T's deficient list exactly.
   - **Ruling:** the result stands, qualified to full classes. This is a scope narrowing, not a strike, and the distinction
     has not been seen to bite.
4. **Independence of C-F1-U's "two instruments" (CF-F4's question).**
   - `inst.py` (a generic DP) and the frozen `ordinary_tree_checked.py` independently fix `α = 755`, `x = 446` and the
     favorability of the three leaf types.
   - The **sector deficit itself**, however, came only from C-F1-U's closed forms (brute-force-validated on 5 small trees).
     On the deficit the frozen checker computed nothing. As shipped, then, the deficit was one formula evaluated once.
   - My replay supplies an independent second instrument for the deficit (`own/sector.py`):
     - The sector counts are read from the forest DP of `T − N[r] − N[v]`, not from `C(M,k)2^k`.
     - The sector structure was brute-forced with the literal (D) ∪ (S) relation on 7 small trees at every rank, including
       one with a `d_i = 0` choke. 36 checks, 0 failures:
       - every sector source has weight 1;
       - the positive-weight deletion image is exactly `{A ∈ I_p : r, v ∈ A}`, each of weight 1;
       - the switch image weight matches the formula.
     - `n = 1427`, `M = 670`, `α = 755`, `x = 446`, window [448, 503], `p = 448` eligible, and `F_448` = all 671 leaves,
       derived leaf by leaf.
     - Supply − capacity equals `S` (320 digits) from independent sides.
     - Sector supply to deletion image is **exactly 448/447**. The deficit (316 digits) equals C-F1-U's printed integer, and
       so does the sector supply.
     - The switch image weighs **13.107470…×** the sector supply.
     - `p = 448` is the only eligible rank on this tree with `3p < 2M+5`.
   - Two instruments now agree.
5. **The two `G_k` sign theorems (CF-F2: "the two bounds differ; both must be checked").** I checked both proofs line by
   line.
   - I re-derived all nine deleted-graph polynomials:
     - `H − R` for leaf 1, leaf 3 and `c_i`;
     - `G_k − 1`, `G_k − 3` and `G_k − c_i`.
   - I re-derived Lemma M's recursions, including the palindrome step at `j = N`.
   - I re-derived C-F2-T's two Newton steps at `j = N` and `j = N−1`, its dominance `P^N ≥ (1+3y)^N`, its Newton step for
     `U = (1+y)P^k` at `j = k`, and its Darroch argument for `G_k − 3`. The mean of `A` is `k + 7/6`.
   - Numerically (`own/gk.py`), against the literal tree DP for `k = 1..40`:
     - `F_{k+3}(G_k)` is all `k+3` leaves.
     - Every per-leaf summand equals its closed form: `σ_1 = 2^k − g(k+1)`, `σ_3 = σ_4 = −A(k) − 2^k`, `σ_c = −A(k)`.
     - `S = −g(k+1) − 2^k − (k+2)A(k)`.
     - C-F2-T's bounds hold: `S ≤ −2 − 2^{k+1}`, `σ_1 ≤ −(3^{k+1} − 2^{k+1})/2`, `σ_c ≤ −2u_{k−1}/k`.
     - C-F2-U's bound holds: `S ≤ −(3^k + 2^k + (k+2)(2^k + 3^{k−1}))`.
     - Lemma M, both recursions, `h(N) ≥ 2^N` and `g(N) ≥ 3^{N−1}` hold for `N ≤ 300`.
   - **Ruling:** both are correct and consistent. C-F2-U's is an exact identity whose bound implies C-F2-T's for every
     `k ≥ 1`. The difference is strength, not conflict.
   - C-F2-U's proof is elementary: induction on convolutions, with no real-rootedness. C-F2-T's needs Newton and Darroch.
6. **Slack step count.** C-F2-T says "rises on 79 steps from `m = 20`, level on 1403". C-F2-U says "78 of the 1481 steps".
   - Replay: `slack(19) = 1`, `slack(1500) = 79`, with 78 strict rises on `m = 20..1500`, no decreases and maximum step 1.
     Counting the 18→19 step gives 79 rises in total.
   - **C-F2-U is exact.** C-F2-T's window label is off by one.
7. **Deletion-only flow horizons.**
   - C-F2-T ran to `G_7` and `T(8,2)`; C-F2-U ran to `G_8` and `T(9,2)`. They do not conflict.
   - My own Dinic, with integral flows extracted, every flow-carrying arc re-checked against the literal (D)/(S), and source
     and target constraints asserted, **reproduces every row of C-F2-U's table**, including `G_8` and `T(9,2)`:

     | Row | supply | capacity | `S` | mixed flow | deletion-only flow | gap mixed / del-only |
     |---|---:|---:|---:|---:|---:|---|
     | `G_8` | 1448816 | 1964489 | −515673 | 1448816 | 1448816 | 2 / 530 |
     | `T(9,2)` | 833663 | 1257739 | −424076 | 833663 | 833663 | 2 / 406 |

8. **Real-rootedness.**
   - C-F2-T: `I(T(m,k))` is not real-rooted from `m = 3`. C-F2-U: the chain `T_2` is already not real-rooted.
   - My exact Sturm counts:
     - `T_2 = 1+6y+10y²+5y³+y⁴` has 2 real roots.
     - `I(T(2,2))` has 5 real roots out of degree 5.
     - `I(T(3,2))` has 5 of 7.
     - `I(T(9,2))` has 11 of 19.
   - Both are confirmed. The Darroch/Newton mode route to item (a) is closed.
9. **The limiting constant.**
   - `ρ = 5(3+√17)/(17+5√17) = 0.946830…` is the mean per block of `λ₊` at `y = 1`. I re-derived it by implicit
     differentiation of `λ² − (1+3y+y²)λ + y²(1+y) = 0`.
   - Replay: `μ_1500 − 1500ρ = 0.5915` and `1 − ρ = 0.053170`.
   - This is a **lead only**, with no evidential grade.

**Controller facts.**

- CF-F1, CF-F2 and CF-F4 are consistent with my replays. For CF-F4, see item 4 above.
- CF-F3, C-U2-F's finding: I replayed the order-8 tree (edges 0–1, 1–2, 2–3, 2–6, 2–7, 3–4, 3–5):
  - `α = 5`, `x = 3`, no eligible rank.
  - At `p = 3`: `F` = all 5 leaves, supply 29, capacity 32, `S = −3`. Mixed max-flow is 29 (it saturates); deletion-only
    max-flow is 27.
  - At `p = 2`: `S = +21`, and both flows are 11.
  - At `p = 4`: both flows saturate at 8.
  - All reproduced digit for digit. Switch arcs are strictly load-bearing on a whole tree **below** the window. No eligible
    row is known to need them for full saturation.

## Established results

**Grades are as I rule them.** "STATED" means first stated at a review stage, so an isolated second read is required before
registration (`SOLUTION-CONTRACT.md` §4). "Adjudicator-verified" means I checked the proof or replayed the number myself.

**E1. Theorem GK-SIGN** (critic-attributed: exact form C-F2-U; independent bound and first proof of `3, 4 ∈ F` C-F2-T).

- **Status:** STATED; `proved_informal` at statement level; adjudicator-verified at full scope.
- **Setting.**
  - `G_k` (`k ≥ 1`): root 0; leaf 1 on 0; support 2 on 0 with leaves 3 and 4; `k` arms `0–a_i–b_i–c_i`; `n = 3k+5`.
  - `P = 1+3y+y²`, `c^{(N)}_j = [y^j]P^N`, `g(N) = c^{(N)}_{N+1} − c^{(N)}_{N+2}`, `A(k) = c^{(k)}_k − c^{(k)}_{k+2}`.
- **Statement.** For every `k ≥ 1`:
  - (i) `F_{k+3}(G_k)` is the whole leaf set `{1, 3, 4, c_1, …, c_k}`;
  - (ii) every per-leaf summand of `S(G_k, k+3)` is strictly negative;
  - (iii) `S(G_k, k+3) = −g(k+1) − 2^k − (k+2)A(k) ≤ −(3^k + 2^k + (k+2)(2^k + 3^{k−1})) < −2`.
- **Hypotheses consumed.**
  - The literal graph. Every deletion is on the original carrier, and the deleted graphs decompose into disjoint paths and
    stars (acyclicity and connectivity are used only through these explicit decompositions).
  - The fixed rank `p = k+3`, and `k ≥ 1`.
  - No census value.
- **Exact scope.** One explicit family at one rank.
  - Eligibility holds iff `k ≥ 3` (from the registered `G_k` key).
  - `k = 3` lies in the closed band. The new sign content is `k ≥ 4`, where `2p+3 ≤ n ≤ 4p−8`.
  - It is not (HALL) and not the primary aggregate.
  - It **extends, and does not alias,** the registered key
    `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`: the sign of `S` is not in
    that key's statement.
- **Corollary.** Composed with (WID) (`formally_verified`) and the registered `G_k` key (unique positive-weight no-in-arc
  target, weight 2), (HALL-COND) holds at `X = I_{p+1}` on every `G_k`, `k ≥ 3`.
  - This is the scalar necessary condition only.
  - Its grade is that of its weakest input: STATED until GK-SIGN's second read, `proved_informal` after it.

**E2. Order-1427 switch-necessary eligible tree** (critic-attributed, C-F1-U; two instruments now agree, C-F1-U and adj-F).

- **Grade:** `bounded_computation`. The sector-deficit counting identity is the registered
  `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` at `t = 1`, re-derived; it is not new.
- **Statement.** On `G(8^82, 7^2)` at the eligible rank `p = 448`, the root-plus-arm sector is **deletion-deficient**
  (supply to deletion image exactly 448/447). So deletion-only transport fails at an eligible rank on a tree of order
  1427 < 1465.
- It is **not a cut**: the switch image is 13.107× the sector supply.
- It answers the Stage 1 gate's open question ("whether any tree of order 20–1464 is switch-necessary") in the affirmative.
- It is the **smallest found** in a bounded two- and three-type scan of the generalized-CB class, **not a proved minimum**.
- The pattern: every sector-deficient row found sits at the boundary `3p = 2M + 4`, where supply/deletion image is
  `2(M−p+2)/(p−1) = p/(p−1)`. This covers the three CB rows and the order-1427 row.
- Second read required before any scope note.

**E3. `(τ,q)`-class-union Hall at the three `CB(8,·)` rows** (critic-attributed, C-F1-T).

- **Grade:** `bounded_computation`; the reach-set lemma is STATED.
- **Statement.** Under (D) ∪ (S), with literal active weights, weighted Hall holds for every union of **full** `(τ,q)`
  classes at `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`.
  - The tightest class union is the whole layer.
  - Under deletion alone, the sector's positive-weight neighbourhood has ratio exactly `(p−1)/p` (deficient). With (S) the
    ratio is 14.32, 14.79 and 15.25, so switch arcs are load-bearing at this level.
  - I replayed both sets of ratios with `own/sector.py`'s brute-force-validated sector formulas: 459/460, 475/476 and 491/492
    under deletion alone; 14.32, 14.79 and 15.25 with (S).
- **Replay:** byte-identical (`classnet_rows.json` `760f9ae2…`). The reach-set validation gives 290,916 reach sets with 0
  mismatches, and the all-union cross-check 32 rows with 0 disagreements.
- **My independent small-row check:** the same detector verdicts on the shared rows, with no positive-part difference on 73
  rows.
- **Qualification:** full classes only (reconciliation item 3). This is not (HALL). Aut-invariant families finer than
  `(τ,q)` unions remain open.

**E4. Bounded family flow record** (critic-attributed, C-F2-T and C-F2-U; replayed by me).

- **Grade:** `bounded_computation`.
- **Statement.** Mixed **and** deletion-only saturating flows exist on `G_3..G_8` and `T(4..9,2)` at their eligible ranks.
  On every such row the mixed network has exactly one positive-weight target with no in-arc, of weight 2.
- This is a finite record on two families. It is not a revival of `E993-R23-LITERAL-DELETE-ONLY-HALL`: it is finite, it uses
  the active weight, and it asserts no universal deletion-only Hall.

**E5. F2's seat-authored lemmas.**

- **Grade:** `proved_informal` (companions; no key).
- **Statement.** The block recurrence and assembly for `T(m,k)`; `H_1` and `R_1` closed forms; `Δ_{k+2}(R_1) = −2^k`;
  `Δ_{k+2}(H_1) < 0`.
- E1 now subsumes the last three inside its dependency DAG.

**E6. Bounded premises of the conditional `T(m,2)` record.**

- **Grade:** `bounded_computation`, extended from `m ≤ 400` to `m ≤ 1500`; seat F2, replayed by me.
- **Statement.**
  - `x(T(m,2)) ≤ m` and `Δ_m(T(m,2)) < 0` for `m = 3..1500` (sufficient direction only).
  - `Δ_{m+2}(T(m,1)) < 0` for `m = 2..1500`.
- **Negative structural finding (critic-attributed, both critics; exact Sturm; replayed):** `I(T(m,2))` is not real-rooted
  for `m ≥ 3` at the checked `m`, and neither is `T_2`.

**E7. F1's three-row data and `q`-class decomposition.**

- **Grade:** `bounded_computation`.
- **Statement.** Exact `α`, `x`, `|F|`, supply, capacity and `S` at the three rows, and the `q`-class shares, all replayed by
  three independent instruments.

**Nothing in this portfolio is compiled Lean.** There are no `#print axioms` outputs to confirm and no carried or authored
declarations.

## Rejected and narrowed mechanisms

- **No mechanism is proposed by either seat, and none of the ten refuted keys is revived.**
  - The deletion-only flows (E4) are finite rows.
  - The order-1427 finding (E2) is a further instance of deletion-only failure. It is consistent with the refuted
    `E993-R23-LITERAL-DELETE-ONLY-HALL` and revives nothing.
  - GK-SIGN is a direct calculation on one family, not an injection or domination mechanism. It is therefore distinct from
    `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` and `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`.
- **Narrowed:**
  - F1's WLOG lemma: subsumed by C2-LA1; no key.
  - F1's "new exact globals": withdrawn as novelty; the top-level margin is the known sign of `S`.
  - F2's C1 for `T(m,2)`: struck. The `G_k` half is a scope-note sentence.
  - F2's `Δ_m < 0` "equivalent": narrowed to sufficient.
  - C-F1-T's class-union result: narrowed to full classes.
  - C-F1-U's "two instruments": the deficit was single-instrument as shipped, and is now two-instrument.
- **Route closed (critic-attributed, confirmed):** the Darroch/Newton mode–mean route to the `T(m,2)` premises. The
  polynomials are not real-rooted.
- **Fidelity record (duty 7).**
  - No F-orientation instrument counts `|F ∩ B|` or `1 + #private`, re-selects `F` at `p ± 1`, or recomputes neighbourhoods
    in a deleted graph. The predecessor C6-F5/C6-U5 error does not recur.
  - The corrected sector ratio reproduces: `492/491` at `CB(8,92)` as `p/(p−1)`, and `(p−1)/p` for the deletion-image-to-
    supply direction in C-F1-T. The wrong-weight `493/491` does not appear.
  - The one fidelity failure in the portfolio is procedural: F2's non-falsifiable `S` on four rows. Its numbers survive on
    independent instruments.

## Lean readiness

This is the ruling for orientation F. A bounded result never qualifies.

- **(WID)** at `SOLUTION-CONTRACT.md` §2 is already `formally_verified` (C1-LA1). The F portfolio uses it and re-proves
  nothing. There is nothing to decide.
- **Restricted-scope (HALL) theorem:** none in the F portfolio. No parameter-uniform flow and no Hall-for-every-`X` statement
  was proved on `G_k`, `T(m,2)` or any `CB` row.

**Award groups: none is contract-ready for Cycle 3 Stage 7.** The candidates:

**1. GK-SIGN (E1), the strongest F candidate: NOT contract-ready this cycle.**

- (a) **Complete informal proof at statement-level granularity with a closed DAG: yes (adjudicator-verified).** Every node is
  proved informally:
  - `n1` — deleted-graph polynomial identities on the original carrier. For `v ∈ {1, 3, c_i}`:
    - `H_v − R_v` is `P^{k+1} − (1+y)²Q^k`, `y(1+y)(P^k + Q^k)` and `y(1+y)P^k` respectively;
    - `I(G_k − v)` is `P^{k+1} + y(1+y)²Q^k`, `(1+y)(1+2y)P^k + y(1+y)Q^k` and `(1+y)(1+2y)P^k + y(1+y)³Q^{k−1}`;
    - here `Q = 1+2y`.
  - `n2` — palindromy of `P^N`.
  - `n3` — Lemma M: `d^{(N)}_j ≥ 0` for `j ≥ N`; `h(N) = g(N−1) + 2h(N−1)`; `g(N) = d^{(N−1)}_{N+1} + 3g(N−1) + h(N−1)`;
    hence `h ≥ 2^N` and `g ≥ 3^{N−1}`.
  - `n4` — the leaf set of `G_k`.
  - `n5` — favorability of every leaf at `k+3` (from `n1` and `n3`, plus the tail-degree argument).
  - `n6` — the summand values (from `n1`–`n3`).
  - `n7` — assembly `S = Σ_{v ∈ F}` summands, and the bound.
- (b) **Compiled fragments covering named nodes: none.** No F seat or critic authored Lean.
- (c) **Open nodes: none mathematically.** Every node is unformalized.
- **Why not ready:**
  - It is STATED at Stage 4, so an isolated second read is required before registration.
  - No fragment exists.
- **Smallest unformalized node:** `n1`. Its Lean form needs a disjoint-union product lemma for
  `C5LA1.indepSetCount G D k` over components, and the explicit graph `G_k` on `Fin (3k+5)`.
- **Draft statement to freeze after the second read.** It is on the frozen definitions (C1-LA1 `Main.lean`), in namespace
  `E993Transport`:

  ```text
  For every k ≥ 1, with G := Gk k (the explicit graph on Fin (3k+5)) and p := k + 3:
    favorableLeaves G p = C5LA1.leafSet G, and
    C5LA1.aggregate G p = −((P^(k+1)).coeff (k+2) − (P^(k+1)).coeff (k+3)) − 2^k
                          − (k+2)·((P^k).coeff k − (P^k).coeff (k+2)),   P := 1 + 3X + X² ∈ ℤ[X];
  corollary: C5LA1.aggregate G p ≤ −2.
  ```

- **Fences on its face:**
  - one family, one rank;
  - not (HALL) and not the primary aggregate;
  - `k = 3` is in the closed band `n ≤ 2p+2`;
  - no RTree wording.
- **Lean-friendliness:** C-F2-U's proof (Lemma M) needs no real-rootedness. Prefer it over C-F2-T's Newton/Darroch route.

**2. (HALL-COND) at `X = I_{p+1}` on `G_k`, `k ≥ 3` (E1's corollary): NOT contract-ready.**

- It inherits GK-SIGN's status.
- The registered `G_k` key it composes with (the unique no-in-arc target) has no Lean text.
- It is a scalar condition, not a restricted-scope Hall theorem.

**3. C-F1-T's reach-set lemma for `(τ,q)` classes of `CB(d,m)`: NOT ready.**

- It is STATED, with a hand derivation plus brute-force validation.
- I did not independently prove it at full scope.
- Its only application is bounded.

**4. F2's `T(m,2)` machinery: NOT ready.**

- The recurrence is proved, but the premises are open.
- **Smallest unproved lemma:** a coefficient-level mode bound. Specifically, `Δ_m(T(m,2)) < 0` for all `m ≥ M_0`, and
  `Δ_{m+2}(T(m,1)) < 0` for all `m ≥ M_0`, together with the finite check below `M_0`, which already holds to 1500.
  Real-rootedness is unavailable.

**Smallest unproved lemma toward (HALL) in F's direction:**

- At the three `CB(8,·)` rows and the order-1427 row: weighted Hall for Aut-invariant all-positive-weight families mixing
  sec, positive-weight V and positive-weight S/O. A feature-refined positive-part class-union statement is the next
  checkable approximation.
- On `G_k`: Hall for every `X ⊆ I_{k+4}`. A parameter-uniform saturating flow suffices.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

**Evidence of material progress.**

- **A new lemma at `proved_informal`: GK-SIGN** (critic-attributed; adjudicator-verified; STATED pending its second read).
  It closes allocation item 4(b) for every `k`, and with the `G_k` key it proves top-level (HALL-COND) on the whole family.
- **New adversarial findings:**
  - The first switch-necessary eligible tree below the `CB(8,86)` record (order 1427). This answers the Stage 1 gate's open
    question; two instruments agree.
  - No `(τ,q)`-class-union cut at the three switch-necessary rows. The tightest union is the whole layer.
  - Deletion-only saturation through `G_8` and `T(9,2)`.
  - The closure of the real-rootedness route.
- **Seat-authored contributions:**
  - F2's recurrence and `H_1`/`R_1` lemmas (`proved_informal`).
  - Exact bounded extensions (F1 rows; F2 to `m ≤ 1500`, `k ≤ 250`).
- **Candid note.** The load-bearing F advances this cycle are critic-attributed. F1 did not execute its chartered search, and
  F2 left item (b) open.

**Stop gate.**

- No decisive event occurred: (HALL) is not formally verified, and no (CUT) is confirmed.
- The plateau test fails for F: a new `proved_informal` lemma and new adversarial findings exist.
- The gate's conditions are not met from this orientation.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at orientation F's evidence grade:

- **(HALL): still open.**
  - No candidate deficient cut satisfies SEMANTIC-CONTRACT §1.2 at any eligible row.
  - The adversarial horizons attained this cycle:
    - full-class `(τ,q)` unions at `CB(8,86/89/92)`;
    - the whole sector family at order 1427, which is not deficient under (D) ∪ (S);
    - full mixed networks on `G_3..G_8` and `T(4..9,2)`, all saturating.
  - No proof at any scope.
- **(WID):** `formally_verified` (C1-LA1). Cited; outside this portfolio's evidence.
- **GK-SIGN:** proved at full scope at my grade (informal, adjudicator-verified). STATED pending its second read.
  - It is not an outcome-B template, and it is not (HALL).
  - Its corollary, (HALL-COND) at `X = I_{p+1}` on `G_k` (`k ≥ 3`), is the scalar necessary condition only.
- **Outcome-B candidates:**
  - The reach-set lemma: STATED, not proved by me at full scope.
  - The `T(m,2)` premises: still open. They are bounded to `m ≤ 1500`, and the real-rootedness route is closed.
  - No (NMP), (SW), (INV), (REC) or (BUD) statement was proved in this portfolio.
- **Primary aggregate:** untouched.

## Next-route allocation

**Exact remaining obligation for orientation F.** Two parts:

- Either exhibit a (CUT) or rule one out at the switch-necessary eligible rows, over the families C2-LA1 leaves possible:
  Aut-invariant, all-positive-weight, mixing sec with positive-weight V and positive-weight S/O. Four rows:
  `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492` and `G(8^82,7^2)/448`.
- Or settle (HALL) for every `X` on the unreachable-capacity family `G_k`, where the top-level condition is now proved.

**Route F-1: `POSITIVE-PART FEATURE-REFINED CLASS-UNION CUT SEARCH`.**

- (a) Refine C-F1-T's reach-set lemma in two ways:
  - to **positive-weight members only**;
  - to feature counts (the number of choke-out branches with no support, and with exactly one support; choke-in branches
    with at least one or at least two absent leaves; `E`).
  Then run the class-aggregated max-flow at all four rows.
- (b) Prove sector Hall for every `X ⊆ X_sec` on the order-1427 tree.
- (c) Minimality below 1427 outside the generalized-CB class: `s` carrying pendant pairs, larger `Q`, and `t ≥ 2` residuals.
  Use closed forms, not census.
- **Could close in one cycle:**
  - a (CUT) candidate at an eligible switch-necessary row (decisive only after two instruments and an isolated second
    read); or
  - the strongest adversarial record yet: Hall for every feature-refined positive-part invariant family at four rows; or
  - a smaller switch-necessary tree.
- Second reads of E2 and E3 should precede it.

**Route F-2: `G_k UNIFORM HALL OR CUT, WITH T(m,2) LOCAL-LIMIT PREMISES`.**

- (a) On `G_k` at `p = k+3`, either construct an explicit parameter-uniform saturating flow, or search `X ⊊ I_{p+1}` for a
  cut. Deletion arcs alone saturate on every computed row, and the layers factor through `P^k`.
  - A uniform flow proves Hall for every `X`.
  - Any deletion-only statement must carry its distinction from `E993-R23-LITERAL-DELETE-ONLY-HALL` on its face.
- (b) A local-limit or saddle-point bound at `λ₊` with the explicit `ρ`, closing `Δ_m(T(m,2)) < 0` and `Δ_{m+2}(T(m,1)) < 0`
  for `m ≥ M_0`, plus the finite check (already to 1500).
- **Could close in one cycle:**
  - the first parameter-uniform restricted-scope (HALL) theorem on an infinite eligible family, as a SEPARATE key; and/or
  - the `T(m,2)` family key at `proved_informal`.
- **Stage 7 recommendation (not a route):** after GK-SIGN's isolated second read, it is the F orientation's best formal
  target. Lemma M is elementary, and the smallest node to build is the component-product lemma for `indepSetCount`.

## Artifact inventory

All adjudicator scratch is under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-adj-F/`. It is
standard library only, run with `python3 -B`, uses exact integers and `fractions`, and leaves no `__pycache__`. No
background jobs ran.

**Own instrument (`own/`), SHA-256:**

| File | Role | SHA-256 |
|---|---|---|
| `adj.py` | Forest DP, direct active-weight DP, aggregate, literal network primitives | `78982c8876d94629fa16eb76118c580da54c47dd5c0181774d991de6a86af72e` |
| `flow.py` | Dinic plus flow extraction and verification | `c404f8463813f3aa9e1a40564c01d3682eb0d2a8da90e3b5d9ce32d1ef00a52a` |
| `fam.py` | Builders for star, path-star, `gcb`/`cb`, `G_k`, `T(m,k)` | `2188fd31093859219055eca0efbe470e818e9c82786fda14d7e603fc3cda7212` |
| `validate.py` | 400 random trees against brute force, WID at every rank | `c4da952ed2f291c3a838125b50dc0905398ba9db5f5a0c5386f00c2e6f64cab4` |
| `fixed.py` | Fixed points and the CF-F3 order-8 tree | `18824506a6f47a1bb8cd013903af8ffb4d04d537d9a655cbb99703ad68479326` |
| `fixed_out.json` | Output of `fixed.py` | `aeba65f6bc2c33b5a9bd3dc31ed4751eb533449c8ddd7ceb4b4552df59fd0a63` |
| `rows.py` | `CB(8,86/89/92)` and order-1427 rows, per-leaf `F` | `44f25ea03d110394fd8be829b9ed7c9451996e864f5bdf222a6156418039c3d3` |
| `rows_out.json` | Output of `rows.py` | `7df9126b6279f5698b461cb39a58ef7819f88a03952884918273fcc7fa4459a0` |
| `sector.py` | Order-1427 sector deficit (forest-DP counts; small-tree brute force) | `d9b62162a49a49c378ff78993f1fde82d450a43ca02a1e00fade0f3a0dcf9578` |
| `sector_out.json` | Output of `sector.py` | `effbb58ebbb3f90062ac73d03863905300d734ef242176c2a5f655f7e00fae71` |
| `classpos.py` | Full-class vs positive-part class-union Hall, 73 small rows | `96bd57ee03dc10035ecafeb20f6d1e84ddd691baaa3277c12483215056a6d99a` |
| `classpos_out.json` | Output of `classpos.py` | `e232361ef60206653111d598be19ba7df2a4815210f304da2559ccb2366c2b42` |
| `gk.py` | GK-SIGN closed forms, both bounds, Lemma M (`N ≤ 300`), digits at `k = 250` | `af14277c4475c6c2c96ce5279247dfc997f6b367060c0dd7f79a9420c12757fd` |
| `gk_out.json` | Output of `gk.py` | `7b4899503ed3e591ff62c5784bff3f1b276d24fdba3ddef0e5a4e2d0e9241f9f` |
| `famflow.py` | Mixed and deletion-only flows on `G_3..G_8` and `T(4..9,2)` | `496d489238793d5383c342dedad3de30c2930e0774384b01db20a8dc684c1cc6` |
| `famflow_out.json` | Output of `famflow.py` (standard rows) | `666a4e350f6cf215a1ef7a9ca8d5e437e1d2cd6265d7cee9fa737502d123351b` |
| `famflow_out_big.json` | Output of `famflow.py` (`G_8`, `T(9,2)`) | `918262acfdd35a8f2f1b997a4878c619504c33507c9b67d15ad1618c3bc39611` |
| `tm.py` | Spine DP, recurrence check, premises to `m = 1500`, Sturm counts | `a1374d4db7ae4025ebba0d159e1602854c56d2220c165ff2b85cc9e74eef180a` |
| `tm_out.json` | Output of `tm.py` | `855abfbe057dd7b220906e2d88e560d1d5cc0ffd30b5f4791ef49ef5e197dd78` |

**Copy-out replays:**

- `replay-cF1T/` holds C-F1-T's `own/*.py`, byte-identical to its inventory.
  - Regenerated `classnet_rows.json`: `760f9ae22750de6862f01afd9cb444013c89f97f8b35bf045ba64e021550010b`, identical to the
    critic's.
  - `validate`: 290,916 reach sets, 0 mismatches. `xcheck_unions`: 32 rows agree.
- `replay-F1/` holds F1's four scripts from `scratchpad/c3-F1/`, digests as inventoried (`59d1b114…`, `354b4a1a…`,
  `1e04c6f5…`, `64beae95…`). They were inspected for the certification strikes only and not executed.

**Replay commands** (from `own/`, each foreground):

```text
python3 -B validate.py
python3 -B fixed.py
python3 -B rows.py
python3 -B sector.py
python3 -B classpos.py
python3 -B gk.py
python3 -B famflow.py
python3 -B famflow.py big
python3 -B tm.py
```

Total runtime is about 4 minutes; `famflow.py big` alone takes about 100 s.
