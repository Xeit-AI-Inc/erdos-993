# Critique

Critic `C-F2-U` (orientation U, formal/structural) of route `C6-F-02 FIRST-POSITIVE-SUMMAND-ELIGIBLE-ROW` (seat F2, orientation F),
Cycle 6 of r30. Dispatch `control/dispatch/c6-stage4/DISPATCH-C-F2-U.md`: SHA-256
`a5a393d338dfd747e4321bcdfaa637d2e00f7c16ec9e68c5c4c956e171d79eb3`, recomputed with `shasum -a 256` and matched before I followed it.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot acknowledgment.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I opened no other VerityOS file. The host injected the root `CLAUDE.md`
and the auto-memory index into my context. I did not open them and did not act on them. I kept no conversation log, because the
dispatch allows only this file and my scratch directory.

**Letters line (gate ruling 30 / attack-brief form).** The return supplies no `proved_informal`-or-better restricted (HALL), no (CUT)
candidate and no Lean-ready statement. It supplies a `bounded_computation` census: no positive per-leaf summand on any eligible row of
orders 20–22. I reproduced that census exactly with an independent instrument and extended it to order 23 (critic-derived; see below).
A successor inherits no mechanism from it.

## Identity and seal audit

- **Capsule seal.** I recomputed `control/c6-critic-capsules/F2-PACKET-MANIFEST.json` as SHA-256 over the compact key-sorted JSON
  without `seal_sha256`, with no trailing newline. The result is `63a626d9640297ac7858557708113b4f2437296727bc6c399f1e1e88787bd365`,
  which equals the recorded value and the dispatch's value. All 14 members match their recorded SHA-256 and byte counts, including the
  return (`0f47c145…2aded`, 26,334 B).
- **Other seals, recomputed the same way:** Stage 4 dispatch `74be1845f4005d6846c10eacdebf5049b6d7d971a53b445c1dcab3b3637ddf50`,
  Stage 3 `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd` and Stage 2
  `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611`. Each matches its recorded `seal_sha256`. The Stage 2 value also
  equals the protocol's and the return's. (`scratchpad/c6-crit-F2-U/seals.py`)
- **Digests the return lists:**
  - The copy-out `census_f2.py` hashes to `ed81931011af…7d55` and `hall_check.py` to `83f178482f14…4be5`. Both match the return.
  - `sources/lower-region/inputs/ordinary_tree_checked.py` hashes to `a012bb78…533d`, which matches `control/SOURCE-DIGESTS.json`.
  - The three census digests `0661a79e…`, `77117ba5…` and `aa1aaa35…` are consistent with their files. I recomputed each as SHA-256
    of the canonical JSON minus the timing and digest fields, and all three matched.
  - **Not verifiable within my grant:** the self-test digest `e21e70e43f08…` of `selftest-result.json` and the copy of the scripts in
    `scratchpad/c6-F2-replay/`. That directory is not in my grant (the dispatch authorizes `scratchpad/c6-F2/` only), and the
    self-test driver is not among the inventoried artifacts in `scratchpad/c6-F2/`. I therefore replayed the K_{1,12} self-test myself
    (below) and did not rely on the digest.
- **Stage 3 disclosures (capsule member).** F2 disclosed a bounded `find -maxdepth 1` and `ls` within the run root and `control/`, and
  three background jobs (PIDs 58470, 60746, 64096) confirmed exited. The return's text agrees. This is a process note with no bearing
  on the numbers.
- **The return's model disclosure** ("chartered sonnet/xhigh; … `claude-sonnet-5`") matches the allocation's route charter (Claude
  Sonnet 5, xhigh).
- **Erratum R30-E-p.** The return's order/count correction is right. A000055 gives 19 → 317,955, 20 → 823,065, 21 → 2,144,505 and
  22 → 5,623,756. My generator reproduces all four, and the allocation's numbered item 4 attaches the 19/20/21 values to the labels
  20/21/22.

## Independent re-derivation

**My instrument** (`crit_inst.py`, standard library, exact integers) shares no code with F2's:

- **Generator.** Wright–Richmond–Odlyzko–McKay level-sequence generation of free trees. F2 uses a centroid multiset-partition
  construction with a `seen` set, so the two generators are different algorithms.
- **Polynomial arithmetic.** Kronecker-packed big-integer tree DP, with slot width 2^40 (2^64–2^120 for the larger fixed points).
- **Per-support decomposition.** For a support `s` with `l` leaf neighbours and branches `B_w` (for its non-leaf neighbours `w`),
  set `P = ∏ i(B_w)` and `Q = ∏ i(B_w − w)`. Then `i(H_v) = (1+y)^{l−1}P`, `i(R_v) = Q`, `i(T − v) = i(H_v) + y·i(R_v)` and
  `i(T) = (1+y)^l P + yQ`. The identity for `i(T)` is asserted across supports, and against a separate full-tree DP when checking is
  switched on.
- **Row computation.** `x` is the first `k ∈ [0, α]` with `Δ_k(T) < 0`, using zero extension, so `Δ_α = −i_α` is included. The
  eligible range is `[x+2, ⌊2α/3⌋]`. `F_p` is derived per row from `Δ_p(T − v) < 0` on the original tree. The summand is
  `[i_p(H_v) − i_p(R_v)] − [i_{p−1}(H_v) − i_{p−1}(R_v)]`.

**Instrument validation (none of it evidence for a new claim):**

- **Generator counts.** Orders 1–18 match the contract's literal A000055 sequence exactly, and every tree passes an explicit
  edge-count plus connectivity test.
- **Duplicate-freeness.** For orders 1–14, the canonical centre encodings are pairwise distinct and their number equals A000055.
  (`test_basic.py`)
- **(WID) fidelity, two independent sides.** On every free tree with `n = 3…12` and every `p ∈ [1, α]` (6,924 instances):
  - brute-force `I_{p+1}` and `I_p` with the literal active-tag weight `w_F` (`v ∈ F ∩ B` with `B ∩ N(s_v) ∖ {v} ≠ ∅`) gives
    `supply − capacity`, which equals the per-support summand sum `S` from the DP;
  - the selector computed from brute-force `i(T − v)` equals the DP selector;
  - `i_k(T)` from the DP equals the brute-force counts. (`test_wid.py`)
- **Fixed points (`fixed_points.py`):**

  | Fixed point | My instrument | Contract |
  |---|---|---|
  | `K_{1,12}` | `n = 13`, `α = 12`, `x = 6`, `p = 8`, `|F| = 12`, every summand −165, `S = −1980` | same |
  | path-star `(2,3,4)`, `p = 7` | `n = 15`, `α = 11`, `x = 5`, `|F| = 10`, `S = −1218` | same |
  | path-star `(2,2,4,3)`, `p = 8` | `n = 18`, `α = 13`, `x = 6`, `|F| = 12`, `S = −5434` | same |
  | `T_22`, `p = 34` | `n = 91`, `α = 68`, `x = 32`, `|F| = 67`, `S = −498754180547001418536` | same |

  I did not reach `CB(8,92)` (`n = 1567`). F2's census never reaches it either.

**Replay of the census.** The two instruments differ in generator, polynomial arithmetic and code base. Mine reproduces every number
in F2's table exactly:

| Order | Trees | Eligible trees | Eligible `(T,p)` rows | Favorable-leaf summand rows | Max | Min | Positive | Zero-summand leaf rows (mine) |
|---|---|---|---|---|---|---|---|---|
| 20 | 823,065 | 394,693 | 406,262 | 3,992,600 | 0 | −13,260 | 0 | 2,955 |
| 21 | 2,144,505 | 808,972 | 880,489 | 9,557,583 | 0 | −25,194 | 0 | 7,679 |
| 22 | 5,623,756 | 2,659,885 | 2,959,314 | 34,332,403 | 0 | −48,450 | 0 | 19,926 |
| **23 (critic-derived)** | **14,828,074** | **9,327,580** | **10,107,371** | **116,670,944** | **0** | **−90,440** | **0** | 43,665 |

(`census.py`; `c20.json` … `c23.json`; order 23 ran 1,836.9 s)

The order-23 row is my own advance on the step the return leaves open. It covers every free tree of order 23 and finds no positive
per-leaf summand on any eligible row. The horizon of record for "no positive summand" is therefore order 23, graded
`bounded_computation`. Each order's minimum is attained by the star `K_{1,n−1}`, for example `C(18,12) − C(18,11) = −13,260` at order 20.

**The zero-summand witness.** I reproduced it exactly: `n = 20`, `α = 18`, `x = 9`, `p ∈ {11, 12}`, `|F| = 18` at both ranks.

| Rank | `S` | Summand of the 17 hub leaves | Summand of leaf 19 | `Δ_p(T − 19)` |
|---|---|---|---|---|
| 11 | −178,568 | −10,504 | 0 | −13,260 |
| 12 | −167,076 | −9,828 | 0 | −9,996 |

(`witness_and_arm.py`)

**Positive control on F2's pipeline (copy-out, `replay/posctl.py`).** F2's own `analyze_tree`, applied to `T_22`, returns the eligible
range `[34, 45]`. At `p = 34` it finds a positive summand for the arm leaf: 212,336,130,412,243,110, which equals `C(66,33) − C(66,32)`.
F2's pipeline therefore detects positive rows when they exist. Its "zero positives" is not an artefact of an insensitive code path.

**F2's K_{1,12} Hall self-test, replayed (`replay/k112_hall.py`).** I ran F2's `hall_check.build_and_check`, with `F` derived by my
instrument, on K_{1,12} at `p = 8`. It gives supply 1980, capacity 3960 and max flow 1980, both with and without switch arcs, over
1980 arcs. The asserted `supply − capacity = S` of −1980 is computed independently.

**Cross-check of `hall_check.py` against my own max-flow.** My max-flow (`own_flow.py`) builds the literal network itself and runs
Edmonds–Karp. On every free tree with `n ≤ 11` and every `p ∈ [1, α−1]` with nonempty `F_p` (1,499 instances), the two agree on
max flow, supply and saturation.

## Attacks and findings

**F-1. Attack brief (ii), the decisive check: `T_22/34` is not an order-22 tree.**

- The `T_m` family is a hub `r` with an arm `r–s–v` and `m` claws. Each claw is a centre adjacent to `r` carrying 3 leaves. So
  `n = 4m + 3`.
- `T_22/34` means `m = 22` at `p = 34`. It has `n = 91`, as the contract's own fixed point states (`n = 91`, `α = 68`, `x = 32`) and as
  my instrument and the frozen orbit-flow `run.py` state layout confirm.
- The label "22" is the family parameter `m`, not the order. `T_22/34` is outside orders 20–22, and its positive summand does not
  contradict F2's "zero positive summands through order 22".
- The positive control above shows that F2's pipeline does see that positive row when it is given the tree.
- The premise in the brief that "order 22 IS in F2's range" for `T_22/34` is an erratum of the attack brief, not a defect of the
  return. I recommend recording it. The census pipeline is not defective.

**F-2. Attack brief (i): completeness of the generator.**

- F2's generator was self-tested on orders 1–18.
- Its order 20–22 tree counts equal A000055 and my WROM generator's counts. Full coverage is confirmed by `trees_scanned_fully =
  trees_generated` in its result files.
- An independent generator reproduces every downstream count exactly (eligible trees, eligible rows, leaf-summand rows, max and min).
  An omission or duplicate in either generator would almost certainly have shown up in these numbers.
- Duplicate-freeness is checked directly (canonical encodings) only through order 14. At orders 20–22 it rests on the exact
  agreement of two distinct algorithms with A000055. I grade that `bounded_computation`, and it is adequate for this record.

**F-3. Attack brief (ii)–(iii): fidelity of the census pipeline.** I read `census_f2.py` line by line.

- `x` is computed through rank `α`: `delta_array` covers `k = 0…α` with zero-extended `coeff`, so `Δ_α = −i_α`.
- Eligibility is `x + 2 ≤ p ≤ ⌊2α/3⌋`, which is the contract's `3p < 2α + 1`. Rows with empty eligibility are counted and never
  reported as rows.
- `F_p` is derived at each `p` from `Δ_p(T − v) < 0` on the original tree. The `p < len` guard is harmless, because `Δ_p = 0` above
  `α(T − v)`.
- `H_v` and `R_v` use the original adjacency (`N[s]` of `T`). The summand is `q_v(p) − q_v(p−1)` with zero extension. This equals
  the contract's `forwardDifferenceDel(H, p−1) − forwardDifferenceDel(R, p−1)`. The signs and ranks are correct.
- Leaves are vertices of original degree 1. A centroid root is never a leaf when `n ≥ 3`.
- **Gap (process, not a strike).** The census is scalar. It computes no `w_F`, no supply and no capacity, so it cannot assert
  `supply − capacity = S` per row as `SOLUTION-CONTRACT.md` §3.3 asks of every instrument. It also does not report `S(T,p)` per row.
  The summand is literally the right-hand-side term of the formally verified (WID) (`E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`).
  My independent brute-force check of (WID) on 6,924 instances with `n ≤ 12` binds my instrument's summand to the literal weight and
  relation-free network sums. That is enough for a sign census. It would not be enough for any network claim.

**F-4. The census says nothing about (HALL) at orders 20–23.**

- The route's premise (from the allocation) is that a positive summand is "the only kind of place a non-CB (CUT) can live". That is
  an unproved implication: *all per-leaf summands ≤ 0 ⇒ (HALL-COND)*.
- A nonpositive `q_v(p) − q_v(p−1)` is necessary for a per-tag deletion injection, not sufficient. Per-tag injectivity is the refuted
  `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`. So "no positive summand" does not certify (HALL), even deletion-only.
- F2 correctly claims nothing about (HALL). The synthesis must not read orders 20–22 (or my 23) as extending the literal
  "every row of order ≤ 19 saturates" record. No literal flow was run on any row of order ≥ 20.
- **Critic-derived bounded support for the premise (not proof).** Over every free tree with `n ≤ 14` and every rank `p ∈ [1, α−1]`
  with nonempty `F_p` (23,728 instances, including non-eligible ranks), every literal (HALL) failure has a strictly positive per-leaf
  summand. The sweep finds 6,194 literal (HALL) failures, all 6,194 with a positive summand, and none with all summands ≤ 0.
  (`nonpos_hall.py`, `nonpos14.log`)
  - The sweep uses F2's `hall_check`, with `supply − capacity = S` asserted from my independent `S`. I cross-validated `hall_check`
    against my own max-flow on all 1,499 instances with `n ≤ 11`.
  - At the three recorded refutation rows `CB(7,1)/6`, `CB(9,2)/13` and `CB(11,2)/16` (non-eligible), the arm leaf's summand is
    positive (112, 10,862,592 and 349,274,112). At `CB(7,1)/6` my literal replay finds (HALL) deficient by 21 with switch arcs and
    by 112 with deletion arcs only (`cb_small.py`).
  - The premise holds wherever I could test it. It remains a conjecture.

**F-5. Attack brief, witness: the "hub + one extra pendant path" is not a new structural class.**

- **Arm-tag identity (critic-derived, elementary, verified by brute force on 109,982 instances with `n ≤ 14`).** Let `v` be a leaf
  whose support `s` has degree 2, with `N(s) = {v, r}`. Then `W_v = {r}`, and `q_v(j)` counts the independent `j`-sets of `H_v`
  containing `r`, so `q_v(j) = i_{j−1}(T − N_T[r] − v)`. Hence
  `q_v(p) − q_v(p−1) = Δ_{p−2}(T − N_T[r] − v)`.
  (`N_T[r] ∋ s`, and `v ∉ N_T[r]` is removed separately. Every set containing `r` avoids `N(r)`, and conversely.)
- **The F2 witness is the degenerate case.** There, `T − N[r] − v = ∅`, so `q_v = δ_{j,1}` and the summand is 0 at every `p ≥ 3`.
- **`T_m` is the non-degenerate case.** There, `T − N[r] − v` is `3m` isolated vertices, which gives `C(3m, p−1) − C(3m, p−2)`.
  The witness is the `m = 0` shape of the `T_m` arm-tag mechanism: hub neighbours that are leaves instead of claw centres.
- **Consequence for the return's successor hint (Remaining obligation (2)).** The hint points the wrong way. Extra pendant leaves at
  the hub contribute nothing to `T − N[r] − v`. Extra pendant paths contribute single isolated vertices, which never makes
  `Δ_{p−2}` positive at eligible ranks. Positivity needs hub neighbours whose deletion frees many vertices: claw centres, as in `T_m`.
- **Critic-derived bounded search** (`tm_scan.py`, `search_depth2.py`, `search_d2b.py`, `search_hub.py`):
  - Within `T_m`, the first positive eligible summand is at `m = 22` (`n = 91`, `p = 34`). At `m = 15, 17, 19, 21` the first-rank
    arm summand is exactly 0, because `2p − 3 = 3m` there.
  - Over all radius-2 hub trees (every partition of `n − 1` into branch sizes) with `n ≤ 34`, there is no positive row.
  - With branch sizes ≤ 5, there is no positive row for `n ≤ 74`.
  - Over a hub family with orders 24–93 (1–3 arms; 0–3 pendant leaves; 0–3 `P3`s; 0–2 `K_{1,5}`s; any number of claws and
    `K_{1,4}`s), the first positive row is `T_22/34` itself at `n = 91`. The next are at `n = 93`.
  - Among hub-child subtrees of up to 9 vertices, a mean-shift heuristic (`gains.py`) ranks the claw first per vertex. That explains
    why the mechanism needs about 20 claws.
  - All of this is `bounded_computation`: evidence that the smallest positive-summand eligible row may be far above order 23, and no
    proof. A short simulated-annealing probe on random trees of orders 24–40 (`anneal.py`, `anneal1.log`) found no positive row. It is
    reported as a negative heuristic only.

**F-6. Standby checker.** The allocation conditions the literal (HALL) check on a positive-summand row. With none found through
order 22 (or 23), F2's reading, that the check was not required, is correct on the allocation's terms. The shipped checker is weaker
than advertised (see the certification audit).

**F-7. Natural-number and circularity checks.** The census involves no ℕ subtraction. The `p − 1` rank has `p ≥ x + 2 ≥ 2`. No step
assumes `S ≤ 0`. The census uses the summand, never the budget or the sign.

## Mechanism-equivalence and fence check

- The return proposes no mechanism, and none of the refuted keys of `SOLUTION-CONTRACT.md` §3.2 is revived.
- The "positive summand" filter is the shadow of the refuted per-leaf injectivity key, but it is used only as a search filter, never
  as a claim. That is not a revival. F-4 records that the filter's negative result must not be read as (HALL).
- The return re-proves no closed region. It uses no census value in a proof, no RTree wording and no controller prior. It does not
  treat (LIFT) as feasibility or `D, C ≥ 0` as the budget.
- **Claim identity.** Keys touched: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN, untouched),
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN, untouched) and `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (cited;
  formally verified per the allocation). The return proposes no new key, and its alias section drafts no key text, which is correct.
- **My own items.** I propose no key. The arm-tag identity (F-5) is an elementary lemma STATED here at review stage. It would need an
  isolated second read before any registration. It is a one-line consequence of the definitions and is likely already implicit in the
  `T_m` analysis of record (`C(66,33) − C(66,32)`). A name, if one is ever wanted, must be a predicate, not a working label.

## Certification audit

Backed by shipped evidence and my replay:

- F2's census table: all six numbers per order, reproduced exactly by an independent instrument.
- "Max summand 0, attained".
- "Zero positive summands".
- The order/count erratum.
- The witness row's data.
- The three result digests. They are internally consistent. They are digests of summaries, not of per-row ledgers.

Struck or narrowed:

1. **"the ready, self-tested `hall_check.py` literal max-flow / (INV)-quotient-flow instrument" — "(INV)-quotient-flow" is STRUCK.**
   `hall_check.py` contains no quotient or orbit code at all. The only mention of an (INV)-quotient flow is in its docstring
   (lines 4–5). Its docstring item 4 ("asserts total supply − capacity == S(T,p) computed INDEPENDENTLY") is likewise not implemented
   in `build_and_check`, which takes `F` and `W` from the caller and asserts nothing. The literal max-flow part is sound: I replayed it
   on K_{1,12} and cross-validated it against my own max-flow on 1,499 instances.
2. **"Every row above carries `x`, `Δ_k`, `α`, `p`, `|F_p|` … and the graph" — STRUCK as an overstatement.** The result files carry
   aggregate counts only. No per-row data, and no graph other than the single witness, is shipped. Gate-31 row reporting is met for
   the witness row only. As the allocation says, this is a counts-only census.
3. **"Leaf 19 is the row with summand exactly 0 … the closest any row in orders 20–22 comes to positive" — NARROWED.** The maximum 0
   is attained by 2,955, 7,679 and 19,926 favorable-leaf rows at orders 20, 21 and 22. The witness is one of many, and it is
   structurally the degenerate arm tag (F-5), not a near-miss.
4. **The self-test digest `e21e70e43f08…` and "re-run from the copy-out replay directory" — UNVERIFIED within my grant.** They are not
   struck as false. The K_{1,12} claims they certify are backed by my own replay.
5. **Remaining obligation (2), the structural hint "two or more such pendant paths, or a longer pendant path" — CORRECTED.** By the
   arm-tag identity, pendant paths off the hub cannot create a positive arm summand. The productive direction is claw-centre hub
   neighbours (`T_m`), where the first positive row within `T_m` and my searched hub family is at `n = 91`.
6. **Remaining obligation (3), "successor horizon starts at order 23" — SUPERSEDED** by my order-23 census.
7. **Grades.** The return's `bounded_computation` grades are correct. "Exhaustive over the full stated order" is backed for orders
   20, 21 and 22.

## Verdict

verdict: retained_narrowed

headline_resolved: no

The census object is retained. Orders 20–22 are exhaustively covered with no positive per-leaf summand at any eligible row
(`bounded_computation`), and I reproduced this exactly with an independent generator and polynomial engine. The decisive check of the
attack brief does not bite, because `T_22/34` has order 91 (F-1), and F2's pipeline detects its positive summand when given the tree.
The return is narrowed by the strikes in the certification audit: the (INV)-quotient checker does not exist, the per-row reporting
claim is an overstatement, the witness is not singular, and the successor hint is misdirected. It is also narrowed by F-4: the census
certifies nothing about (HALL) at orders ≥ 20. No statement here is `proved_informal` beyond the elementary arm-tag identity, which is
STATED by me.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

Exactly:

- (a) No free tree of order ≤ 23 has an eligible row with a positive per-leaf summand. Orders 20–22 are F2's, orders 20–23 are mine,
  and all are `bounded_computation`. The smallest known positive-summand eligible row is `T_22/34` at `n = 91`. Whether a smaller
  one exists in orders 24–90 is OPEN.
- (b) (HALL) has not been tested literally at any row of order ≥ 20, so the literal saturation horizon stays at order 19.
- (c) The implication "all summands ≤ 0 at `(T, p)` ⇒ (HALL-COND) at `(T, p)`" is unproved. It holds on every tree with `n ≤ 14` at
  every rank (bounded). Either a proof of it, or a counterexample, would decide whether sign censuses are relevant to (CUT) search
  at all.
- (d) The successor should run a targeted search, not a flat census at order 24 (39,299,897 trees). Search trees in which some leaf
  has a support of degree 2 whose other neighbour `r` has neighbours whose removal isolates many vertices. By the arm-tag identity,
  the summand is then `Δ_{p−2}(T − N[r] − v)`.
  - The first literal (HALL) and (INV)-quotient check at a positive-summand row must be run at `T_22/34` or smaller. The (INV)-quotient
    checker must actually be written; F2's is not.
  - The frozen orbit-flow record already has `T_22/34` saturating in the quotient (`bounded_computation`).

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-crit-F2-U/`. SHA-256 is
given where stable.

**Instrument and tests:**

| File | SHA-256 |
|---|---|
| `crit_inst.py` | `4c40ac0bd06d2e46b3d15021203e357ba2e5a7b67e7248dff6235c2ae6091424` |
| `census.py` | `27e36d625799a778824e990e89b7a8fa22e9c87663454fbe2ed057300b47c572` |
| `test_basic.py` | `54fad6662e18d621decf383c2711c4dc1afa3f6fa5f0316bc69e5b96094ba2e4` |
| `test_wid.py` | `961fbc687cdc1463f6e81a95db6fa0889ce5969aa23df8a40da862bcacb987b4` |
| `fixed_points.py` | `7b25d80ab21d6cbd20219eba71a374906bba1141e43dc29d16210577955b06f3` |
| `seals.py` | not recorded |

**Census results.** Digests shown are the canonical-JSON digests excluding timing.

| File | Digest |
|---|---|
| `c20.json` | `32c111b6…4700` |
| `c21.json` | `a76c0725…e1f` |
| `c22.json` | `b8c77c34…53fe` |
| `c23.json` | `8c29bd19…47b3` |

File SHA-256: `c20.json` `b5703c47…81f3`, `c21.json` `b3be3802…1ee4`, `c22.json` `5db94830…ea7`, `c23.json` `48cf8e4e…f796`. Also
`c16.json` and `c18.json`, and the logs `c20.log` … `c23.log`.

**Searches and side findings:**

| File | SHA-256 |
|---|---|
| `witness_and_arm.py` | `aa41d5c3…b067` |
| `tm_scan.py` | `bfda5791…a7ea` |
| `search_depth2.py` / `.log` | `f67c26fc…1871` / `aae4f5eb…9246` |
| `search_d2b.py` / `.log` | `c0256c4c…65d0` / `586fcba6…ccc9` (harness-backgrounded, `timeout 600`, exit 124 after completing order 74) |
| `search_hub.py` / `.log` | `39d082c8…0b30` / `c445bc92…d445` |
| `gains.py` | `e49581c6…29b5` |
| `anneal.py` / `anneal1.log` | `141b66eb…55aa` / `29fc2637…a8d8` |
| `cb_small.py` | `1569d888…ae7f` |
| `nonpos_hall.py` / `nonpos14.log` | `7fb7663a…0290` / `0244e6d6…c9c49` |
| `own_flow.py` | `084de600…34bb` |

**Copy-out replay (`replay/`):** F2's `census_f2.py` (`ed819310…7d55`), `hall_check.py` (`83f17848…4be5`) and
`order20/21/22-result.json`, plus my drivers `posctl.py` (`63593abe…43a4`) and `k112_hall.py` (`3f29c422…a279a`).

**Process disclosures:**

- **Background jobs, all confirmed exited by literal PID (`kill -0`) before this write:** the census jobs 74569, 74570, 74571 and
  74572; 77460 (`timeout`-wrapped anneal); 78364 (hub search); 84522 (`n ≤ 14` sweep). The harness task-control channel also ran the
  `timeout 600` radius-2 search and two wait loops, all completed. I ran one single-PID `ps -p 74572` query and no full process
  listing or pattern kill.
- **Reads beyond the listed members, all within the grant:**
  - non-recursive `ls` of `sources/`, `sources/lower-region/`, `sources/lower-region/instruments/`,
    `…/orbit-flow-twoforone/` and `scratchpad/c6-F2/`;
  - one `grep -rn` rooted at `…/orbit-flow-twoforone/` (inside `sources/`);
  - reads of that instrument's `run.py` (head) and `RESULTS.json`, and a `grep` inside `control/SOURCE-DIGESTS.json` (a capsule
    member).
- **Attack briefs.** I read the preamble (lines 1–20) and my seat's section (lines 177–end). A `grep -n '^#'` displayed the heading
  lines, and so the route names, of the other seats' sections. I read none of their content.
- **Not opened:** `control/C6-WORKER-COMMON-BRIEF.md`, the Stage 4 dispatch manifest's members that are not in my capsule, other
  returns, critiques, adjudications, other roots, and the network.
- **Python.** Two in-place edits of my own scratch files used `python3 -` with no imports. Every other Python run used `python3 -B`.
  No bytecode was written.
