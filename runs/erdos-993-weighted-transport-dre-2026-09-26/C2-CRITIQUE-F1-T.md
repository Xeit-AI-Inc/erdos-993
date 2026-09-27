# Critique

Critic `C-F1-T` (cross-orientation T, prove) on seat `F1`, route `C2-F-01 SWITCH-NECESSARY-REGIME-CUT-SEARCH` (orientation F),
Cycle 2 Stage 4, run `erdos-993-math-dre-20260926-r30-weighted-transport`, 2026-09-26.

**Boot.** Operating within VerityOS. Boot reads were exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in that order. No other VerityOS file was read: no memory,
conversations, modules, skills, logs or decisions. Subsystems loaded: the constitution and the startup protocol only; the
experiment's own control files are listed below.

**Read-boundary disclosures (complete).**
1. Outside the capsule's file list I read two Stage 2 members, both digest-verified against the Stage 2 manifest before I read
   them: `control/C2-WORKER-COMMON-BRIEF.md` (`c7c0a13b…`), on the authority of `C2-CRITIC-COMMON-BRIEF.md`, which names it as
   readable and binding on critics; and `cycles/cycle-1/CYCLE-CLOSE.md` (`30ab62b3…`), on the authority of my attack-brief
   section, which says to compare against it, and ruling 13.
2. I listed `scratchpad/c2-F1/` and `scratchpad/c2-F1-replay/` with plain, non-recursive `ls`, and `scratchpad/c2-F1/__pycache__/`
   the same way. My attack-brief section calls for the replay-parity check. I also ran `mkdir -p` on my own critique directory,
   and its `ls` showed that `critics/F1/` has two entries. I opened neither of the other entries.
3. I ran `grep` on five named capsule files, never recursively, and `find` only inside my own scratch directory, to confirm that no
   `__pycache__` had been written.
4. The harness captured the one-line stdout (`exit=0`) of my two backgrounded runs under
   `/private/tmp/claude-501/…/tasks/`. I chose no such path, and every result file is in my scratch.

I read no other return, critique, adjudication, experiment root or external source. I used no network and installed nothing.

## Identity and seal audit

- Dispatch `control/dispatch/c2-stage4/DISPATCH-C-F1-T.md`: SHA-256 `5c601b171cf298c6d3192675a6c3c32454abf85846e2b4a2987997af7f13b884`,
  recomputed before reading. It matches.
- **Capsule seal** `control/c2-critic-capsules/F1-PACKET-MANIFEST.json`: recomputed as the canonical JSON without `seal_sha256`
  (sort_keys, `(",", ":")`, no trailing newline) = **`f2bd5105977eb29d6bbebe6320982f34620772606cf2c8b62d6eafcc922c739a`**. It matches.
  All 13 members matched on both bytes and SHA-256, including the return
  (`fdc74dd1aa12ebf548b6a2281bfc2c4ada5be6a51bdacb582fb17ea087b9c9bb`, 32,876 bytes).
- Stage 4 dispatch seal: `a361cd175e7c3968cdf2a8d14f92e9b2b5883b018bd72e837f54f26ce38da383`. Stage 3 seal:
  `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d`. Stage 2 seal:
  `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`. I recomputed each canonically and all three match
  (`scratchpad/c2-crit-F1-T/seals.py`).
- The capsule lists no `C2-STAGE3-READ-BOUNDARY-DISCLOSURES.json`, so none was filed.
- **Return-listed digests.** Every digest the return cites, 12 artifacts (`validate_fixed_points.py`, `grid_search.py`,
  `grid_search_results.json`, `adversarial_sweep.py`, `caterpillar_sweep.json`, `deletion_only_check.{py,json}`,
  `pendant_pair_caterpillar.py`, `pendant_pair_sweep.{py,json}`, `heterogeneous_cb_sweep.{py,json}`), matches the bytes on disk.
- **Replay parity** `c2-F1/` against `c2-F1-replay/`: all 14 inventoried files are byte-identical. The return does not cite digests
  for `cb_closed_form.py` (`18f314b2…`) or `flow_instrument.py` (`e80d1eab…`), but both copies of each are identical. `c2-F1/` also
  holds an uninventoried `__pycache__/` (three `.pyc` files). It is harmless, but the return does not list it.
- **Claim identity.** The return registers no key and touches (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN), (WID)
  `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (VERIFIED, used and not re-proved), and the primary aggregate (untouched). This is
  correct. It cites no award label other than C1-LA1, which is correct.
- **Grade error.** The return twice calls the CB sector criterion "the Cycle-1 critic C-F1-T's finding A3 … STATED, needs an
  isolated second read" (lines 75–78 and 290–292). The Cycle 1 close records it as **P8, `proved_informal`, STATED and
  second-read (SR-9, `confirmed_with_repairs`)**, and SR-9 made the hypothesis `v ∈ F_p`, `2 ≤ p ≤ dm + 1` load-bearing. F1's
  own `grid_search.py` docstring gets this right ("STATED + second read SR-8..10"), so the return contradicts its own code. The
  grade in the return is struck and replaced by the record's.

## Independent re-derivation

I built my own instrument from SEMANTIC-CONTRACT §1.2 (`crit_instrument.py`). It imports nothing from F1. Its parts:
- a tree test with separate union-find acyclicity and BFS connectivity checks;
- independence counts by bitmask enumeration;
- `x` scanned through rank `α`, including the terminal difference;
- `F_p` from `Δ_p(T − v) < 0` on the original tree;
- `S` computed from `H_v` and `R_v`, never from the weights;
- the literal active test `B ∩ W_v ≠ ∅` with `W_v = N(s_v) ∖ {v}`;
- the literal relation (D) ∪ (S);
- exact-integer Dinic.

`supply − capacity = S` is asserted on every instance before any output.

**Fixed points reproduced exactly** (`fixed_points.py`, `fixed_points.json` `ebb8ae7c…`). Each case lists n, α, x, p, F, supply,
capacity and S, then the mixed and deletion-only flows:

- `K_{1,12}`: 13, 12, 6, 8, 12, 1980, 3960, −1980. Flow 1980 both ways; no switch arc exists (mixed and deletion-only arc counts
  are both 1980).
- Path-star (2,3,4): 15, 11, 5, 7, 10, 1483, 2701, −1218. Mixed 1483 on **2025** arcs; deletion-only 1483.
- Path-star (2,2,4,3): 18, 13, 6, 8, 12, 8033, 13467, −5434. Mixed 8033 on **11691** arcs; deletion-only 8033.
- Double broom: 11, 9, 4, 6, 9, 255, 516, −261. Saturates both ways.
- `CB(1,7)` at `p = 10` (a worker-brief fixed point that F1 checked only through `n/α/x`): 24, 15, 8, 10, 8, **29190, 58002, −28812**.
  Saturates, and also saturates with deletion arcs alone.

The arc counts match the frozen 2025 and 11691 as the count of all related `(B, A)` pairs.

**CB closed form and sector criterion (re-derived).** Root at `r`. A branch with `u_i ∈ B` contributes `y(1+y)^d`, and one with
`u_i ∉ B` contributes `(1+2y)^d`. So

`I(y) = y(1+y)(1+2y)^{dm} + (1+2y)(y(1+y)^d + (1+2y)^d)^m`, with `n = 3 + m(2d+1)` and `α = m(d+1) + 1`.

This equals brute enumeration on six small CB. The formula `n = 1 + m(d+2)` floated in the attack brief is not the CB order; F1's
`3 + m(1+2d)` is correct: `CB(8,92) = 1567` and `CB(8,86) = 1465`.

Sector criterion, re-derived:
- On `X_sec = {B : r, v ∈ B}`, every member is `{r, v}` plus one vertex from each of `p − 1` of the `dm` induced pairs, and has
  weight exactly 1 when `v ∈ F_p`. The arm tag is active through `r`; every private tag is inactive because its choke is absent.
- Deleting `r` or `v` gives weight 0. Deleting a pair vertex stays in the sector with weight 1.
- The sector is deletion-deficient iff `2^{p−1}C(dm, p−1) > 2^{p−2}C(dm, p−2)` ⟺ `3p < 2dm + 5`. This is P8.

**Own sweep** (`cb_sweep.py`), with separately coded incremental polynomial arithmetic:
- `n ≤ 1465`: 4,485 configurations (4,482 with `n < 1465`, matching F1's `configs_tested`) and 3,143 with a nonempty eligible
  window. Exactly **one** hit: `CB(8,86)`, `x = 458`, `α = 775`, window `[460, 516]`, hit `p = 460` only, margin
  `3·460 − (2·688 + 5) = −1` (`cb_sweep_1466.json` `37595c69…`).
- `n ≤ 1600`: exactly the three record rows `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`, each at margin −1
  (`cb_sweep_1601.json` `5b9b8256…`).

This agrees with the Cycle 1 close. The sector ratio at `CB(8,86)/460` is `2(688 − 458)/459 = 460/459`, which matches the
worker-brief fixed point.

**Replay of F1's generators (copy-out-first into `scratchpad/c2-crit-F1-T/replay/`).**
- `cb_closed_form.py`, `pendant_pair_caterpillar.py` and `validate_fixed_points.py` pass.
- `grid_search.py` gives `configs_tested=4482` and 0 hits, and its output `grid_search_results.json` re-hashes to F1's
  `3b87f17b…`.
- `deletion_only_check.py`'s output re-hashes to `39e1dc08…`.
- `adversarial_sweep.py` gives all 17 rows identical in content, **but a different file digest** (`2542210e…` against F1's
  `9976e96d…`), because the hashed payload contains the wall-clock field `elapsed_s` (see Certification audit).

**Bare-leaf caterpillar rows (own brute force).** I computed four of F1's nine rows independently: spine/leaves 3/3, 4/3, 6/2 and
3/4. Supply, capacity, S, α, x and p match F1's table exactly. Each saturates both with the mixed relation and with deletion arcs
alone (`bare_cat_…json` `0efb5134…`).

**Pendant-pair caterpillar `PP(L,k)` (spine `s_0…s_{L−1}`, `k` pairs `b ~ s_i`, `c ~ b` per spine vertex, `n = L(2k+1)`).**
- My own transfer DP (`pp_scan.py`) equals brute enumeration on 7 small instances.
- The scan over `L ∈ [2,60)`, `k ∈ [1,20)`, `n ≤ 300` covers 377 pairs, of which **298** are eligible. That is the smallest
  instance plus 297 more, as F1 said, but F1 shipped no generator for it.
- The smallest eligible instance is **`PP(7,2)`: `n = 35`, `α = 18`, `x = 10`**, and `p = 12` is the only eligible rank
  (`36 < 37`, `12 ≥ 12`).

## Attacks and findings

**A1. Critic-derived advance: F1's open row `PP(7,2)` at `p = 12` is resolved. It saturates with deletion arcs alone
(`bounded_computation`).**

The group is `G = (S_2)^7`, which permutes the two pendant pairs at each spine vertex. These are automorphisms of `T`. `F_12`
is `G`-invariant: all 14 leaves are favorable, and the code asserts invariance per spine vertex. `w_F` and (REL) are preserved.

Orbits correspond to per-spine types `('I', t)` or `('O', n_b, n_c)`. Quotient supply and capacity are the orbit size times the
representative's literal weight. A quotient arc exists iff the representative has a literal (D)∪(S) target in that orbit, which is
exactly "some edge joins the orbits" because `G` is transitive on each orbit.

**Exactness (my proof, on the face).**
- With uncapacitated arcs, the min-cut value is `min_X [sup(I_{p+1} ∖ X) + cap(N(X))]`. That function is submodular: a modular
  term plus a coverage term.
- `G` permutes its minimizers, and the union of all minimizers is a minimizer, so the minimizer is `G`-invariant.
- For an invariant `X`, `N(X)` is a union of target orbits, so the original min cut equals the quotient min cut. The two max-flow
  values are therefore **equal**, not merely equal in saturation status.
- This is the value form of the registered (INV) key together with the elementary converse of (LIFT), for a subgroup of `Aut(T)`.
  It is not a new key.

**Two independently coded quotient instruments.** `pp_quotient.py` is PP-specific. `pair_quotient.py` is a generic hub/pair
quotient with its own orbit enumerator, keys and representatives. Each was validated against my brute-force full network, using
different Dinic implementations:
- 224 comparisons for the first (`pp_validate.json` `25017dc3…`) and 260 for the second, across CB and PP (`pairq_validate.json`
  `8de1f25d…`).
- Each covers every `p`, `F ∈ {F_p, all leaves}`, and both relations.
- There were **0 mismatches** in supply, capacity or max-flow value. The comparisons include 84 and 104 non-saturating cases, so
  deficits are reproduced as well.

**Result at `PP(7,2)`, `p = 12`.** Both instruments agree on every figure:

| Quantity | Value |
|---|---|
| Orbits (sources / targets) | 249,153 / 394,553 |
| Orbit totals | `i_13` = 3,070,508 (F1's figure) and `i_12` = 5,669,905 |
| `\|F\|` | 14 = all leaves |
| Supply | **7,801,728** |
| Capacity | **11,469,576** |
| `S` | **−3,667,848** (WID asserted) |
| Mixed max-flow | 7,801,728, on 2,770,437 quotient arcs |
| Deletion-only max-flow | 7,801,728, on 2,124,714 quotient arcs |

Supply and capacity were also checked separately as `Σ_F q_v(12)` and `Σ_F q_v(11)` by DP.

So this row saturates, **deletion arcs alone suffice**, and switch arcs are not load-bearing. There is no deficit, so INV has
nothing to exhibit and no (CUT) candidate arises. Grade: `bounded_computation`. A finite row proves nothing universal.

**A2. Critic-derived advance: F1's only eligible "heterogeneous" row, which timed out, is also resolved.**
- Configuration `[4,4,4,4]` is the **uniform** `CB(4,4)` (`n = 39`, `α = 21`, `x = 12`, only `p = 14`).
- Using the `(S_4)^4` pair quotient: `|F| = 17` (all leaves), supply **33,933,216**, capacity **59,268,576**,
  `S = −25,335,360` (WID asserted). Orbit totals equal `i_15 = 18,553,604` and `i_14 = 38,447,784`.
- Mixed and deletion-only max-flow both equal the supply, so it saturates with deletion arcs alone (`bounded_computation`;
  `pairq_CB_4_4_p14.json` `4c11d5cc…`).

**A3. F1's "heterogeneous-degree chokes" are mostly not heterogeneous.** Of the 14 configurations, 8 are uniform `CB(d,m)`:
`[8] = CB(8,1)`, `[12]`, `[20]`, `[30]`, `[4,4] = CB(4,2)`, `[8,8] = CB(8,2)`, `[4,4,4] = CB(4,3)` and `[4,4,4,4] = CB(4,4)`. These
are already inside F1's own closed-form CB sweep and inside Cycle 1's `n ≤ 114` CB quotient range. Only 6 are genuinely unequal:
`[8,4]`, `[12,4]`, `[16,2]`, `[8,4,2]`, `[6,6,2]` and `[8,2,2,2]`. Of these, 5 have no eligible `p` and one was skipped. The
family is therefore untested at any eligible row, not "inconclusive at one row".

**A4. The CB sweep is exhaustive over rows for one sector, not over sectors or families.** `grid_search.py` tests only whether an
eligible `p` satisfies P8's inequality `3p < 2dm + 5`. That is the root-plus-arm sector. It never computes deletion-only Hall on a
row. So "No deletion-deficient row smaller than `CB(8,86)`/n=1465 was found anywhere searched" (return line 274), and the verdict's
"CB … to n<1465 by closed form" (line 346), must be narrowed to **"no eligible `CB(d,m)` with `n < 1465` has a deletion-deficient
root-plus-arm sector"**.

Deletion-only Hall on whole CB rows is established only where flows were computed:
- Cycle 1's quotient rows up to `n ≤ 114`;
- `CB(1,7)/10` (mine);
- `CB(4,4)/14` (mine, A2).

Another sector shape could in principle be deletion-deficient at `114 < n < 1465`, and F1's evidence does not exclude it.

My partial check: the only other weight-one CB sector over an induced perfect matching I found is `Q = {u_i, c_i1}` with the free
part on the other `d(m−1) + 1` pairs (arm edge `s–v` plus the other branches' pairs).
- It has weight exactly 1, and deleting `u_i` or `c_i1` kills the weight.
- By the P8 argument it is deletion-deficient iff `3p < 2d(m−1) + 7`.
- That threshold never exceeds P8's `2dm + 5` (they are equal at `d = 1`), so it cannot fire below `CB(8,86)`.

This is a critic-derived remark, graded `proved_informal` for the inequality comparison and STATED. It is not a proof that no
other sector or family is deficient.

**A5. "None below 1465" is a family statement, not a tree statement.** F1's mandate was the smallest tree of ANY shape on which
active-weight deletion-only Hall fails. The only exhaustive evidence for general trees is Cycle 1's census of orders 11–19
(195,683 rows; order 19 was done by one critic only, a qualifier F1 drops). Everything above that is family evidence:
- CB rows by the sector criterion;
- 9 bare-leaf caterpillar rows up to `n = 24`;
- `PP(7,2)` and `CB(4,4)` (mine).

**The gap between order 19 and order 1465 is unchanged for general trees.** Neither F1's verdict nor mine may be read as "no tree
of order 20–1464 is deletion-deficient". F1's closing sentence (line 346, "no evidence gathered here narrows the gap") is correct
on this point, and SR-14(b) says the same.

**A6. Critic-derived bounded record: the pendant-pair family has no P8-type sector deficiency.** In `PP(L,k)` the analogue of the
root-plus-arm sector is:

`X_i = {s_i, c_i1} ∪ M`, where `M` takes one vertex from each chosen pair among the `N' = k(L−1)` pairs not at `s_i`, and no other
spine vertex or `c_ij` is present.

- `c_i1` is active through `s_i`. Every other tag `c_jl` is inactive because `s_j ∉ B`. So `w = 1` when `c_i1 ∈ F_p`.
- Deleting `s_i` or `c_i1` gives weight 0. Deleting an `M`-vertex stays in the sector.
- The whole sector is deletion-deficient iff `3p < 2k(L−1) + 5`. By (NM) on the induced matching, no subfamily of it is deficient
  otherwise.

Exact closed-form screen (`pp_sector_scan.py`, `n ≤ 600`): 1,278 `(L,k)` pairs, 920 eligible, **0 hits**. The minimum margin
`3p_min − (2k(L−1) + 5)` is **+7**, attained at `PP(7,2)` itself (`pp_sector_scan_600.json` `b0939e11…`).

Unlike CB, where the margin reaches −1, the pendant-pair caterpillar never comes close on this sector up to `n ≤ 600`. It is
therefore a weak candidate for the switch-necessary regime through weight-one sectors. Other sectors were not screened. Grade:
`bounded_computation` for the screen; the criterion's derivation is STATED (a P8 analogue). I propose no key.

**A7. Instances beyond `PP(7,2)` are out of reach of an orbit quotient by `(S_k)^L`.** Exact orbit counts at the next eligible
rows (layers `p+1` / `p`):

| Row | Orbits (`p+1` / `p`) |
|---|---|
| `PP(13,1)/13` | 20.2M / 34.8M (`k = 1`: no pair symmetry) |
| `PP(9,2)/15` | 16.9M / 24.4M |
| `PP(6,4)/18` | 4.6M / 5.5M |

Further progress needs a coarser proved lift. U2's equitable-partition lift, once proved, is the natural tool; under ruling 16 it
may not be used before then.

**A8. Minor.**
- (i) The return's claim that the double broom is "the fourth fixed point of SEMANTIC-CONTRACT.md's list", and
  `cb_closed_form.py`'s claim that `CB(1,7)` is "quoted verbatim in SEMANTIC-CONTRACT.md Sec 1.2", are both **misattributed**.
  Neither instance appears in SEMANTIC-CONTRACT; both are in `C2-WORKER-COMMON-BRIEF.md`'s list of fixed points added by Cycle 1.
  The numbers themselves are correct (reproduced above).
- (ii) F1 reproduced `CB(1,7)` only through `n/α/x`. The worker brief also lists its flow (29190/58002, saturating), which I
  reproduced.
- (iii) Process, disclosed by F1 and recorded here: two prohibited `ps aux` full process listings (the second repeated the first
  error; nothing depends on either), and two non-recursive `ls` calls under `cycles/`.
- (iv) The "(LIFT), (DCB) … used at their recorded grades" sentence is vacuous: neither is used.

## Mechanism-equivalence and fence check

- F1 proposes no mechanism. It searches for failures of (HALL) at the literal network. The weight is literal `w_F` (F1's
  `active_weight` uses `(B∖{v}) ∩ W_v ≠ ∅`, the R30-E-b test). The relation is literal (D) ∪ (S), with a deletion-only
  restriction used as a screen. `F` is fixed at the original rank. `x` runs through `α`, and I confirmed this by replay and by my
  own instrument. No fidelity failure was found, and nothing downstream is struck on fidelity grounds.
- **Ruling 15 (deletion-only statements).** F1's stated distinction from `E993-R23-LITERAL-DELETE-ONLY-HALL` is that "my mixed test
  includes (S) throughout". That does not distinguish the **deletion-only** screening statements, whose relation is exactly (D).
  The correct distinction is the **active-tag weight** (and, for P8, the sector object). F1's preamble does name the weight, so
  this is a wording defect, not a revival. No deletion-only deficit was reported as a (CUT).
- No revival of the ten refuted keys, the C6-F4 unit-capacity rule, or any `|F ∩ B|` counting. No closed region was re-proved.
  No `T_m` or spider controls were rerun. No RTree wording. No census value is used as a proof step. The controller's prior was not
  cited.
- My own lemma-level content introduces no new mechanism. A1's exactness argument is the value form of (INV) plus (LIFT)'s
  converse. A4's and A6's sector criteria are the P8 argument applied to other weight-one sectors over induced matchings (T2's
  territory generalizes it). The fence "mechanism ≠ aggregate" is untouched: no deficit of any kind was found.

## Certification audit

- **"ALL FOUR fixed points reproduced exactly"**: backed; replayed by me. The source attribution "SEMANTIC-CONTRACT.md's list" is
  **struck** and replaced by `C2-WORKER-COMMON-BRIEF.md`.
- **"configs_tested=4482 … 0 hits"** with digests `cae37805…` and `3b87f17b…`: backed; replay reproduces them byte-for-byte and my
  own sweep agrees. The qualifier "exhaustive" stands only as "exhaustive over `(d,m)` for the P8 inequality" (A4).
- **"compared term-by-term: identical, just written in a different grouping"** (against the Cycle 1 critic's formula): **unbacked**.
  No shipped artifact contains the comparison, and I did not read that critique. Struck as a certification. The formula itself is
  correct by my derivation.
- **Bare-leaf caterpillar table (9 rows), "all 9 also saturate on deletion arcs alone"**: backed. Replay content is identical and 4
  of 9 rows were re-derived with my own instrument. However, the cited digest `9976e96d…` of `caterpillar_sweep.json` is **not
  replay-reproducible**: the hashed payload includes the wall-clock `elapsed_s`, contrary to worker-brief rule 7.
  `pendant_pair_sweep.json` and `heterogeneous_cb_sweep.json` also hash an `elapsed_s` field; the first reproduces only because it
  rounds to `0.0`. The timeout outcomes ("timed out at 5s per test") depend on the host and are not deterministic results.
- **`PP` closed form "validated against … brute-force DP"**: backed, but F1's check is DP against DP, not enumeration. My check is
  against brute enumeration (7 instances).
- **"A closed-form eligibility scan over L ∈ [2,60), k ∈ [1,20), n ≤ 300 found every eligible (L,k); smallest … n=35", "the further
  297 eligible (L,k) instances", "|F|=14", "3,070,508"**: F1 shipped **no generator** for the scan, for `|F|`, or for the layer
  count. Every one of these literals is **unbacked on F1's evidence**. Each is true by my independent computation (298 = 1 + 297;
  `|F_12| = 14`; `i_13 = 3,070,508`) and stands on this critique's artifacts. The timing literals "<2ms" and "10.2s" are
  **struck**.
- **"pendant_pair_sweep.json … all not_eligible at n ≤ 32"**: backed.
- **"No completed row exists in this family [heterogeneous]"**: true, but the family is mislabelled (A3), and its one eligible row
  is resolved here (A2).
- **"switch arcs … not known to exist anywhere below n=1465"**: acceptable as worded ("from any evidence gathered here").
- **Seal and digest literals**: the Stage 2 seal and the dispatch digest are backed.
- **"STATED, needs an isolated second read"** (for P8/A3): **struck**. The record grade is `proved_informal`, second-read by SR-9.

## Verdict

verdict: retained_narrowed

headline_resolved: no

F1's `bounded_evidence` verdict is retained, narrowed as follows:
1. The CB result is a statement about the root-plus-arm sector criterion only, not about deletion-only Hall of whole rows (A4).
2. The "heterogeneous choke" pass is mostly uniform CB, and its one eligible row is resolved here (A3, A2).
3. The fixed-point provenance and P8's grade are corrected.
4. The scan, count and timing literals that F1 shipped no generator for are struck from F1's evidence, and where true are carried
   on this critique's artifacts.

No (CUT) candidate exists, and none surfaced in my quotient computations. The one place the attack brief flagged as a possible
(CUT), `PP(7,2)/12`, **saturates with deletion arcs alone** on two independently coded exact orbit-quotient instruments.

I make no mathematical claim at `proved_informal` beyond these:
- the quotient-value exactness argument (A1), which is the value form of registered keys;
- the P8-analogue sector criteria (A4, A6), which are STATED and need an isolated second read if the synthesis wants them on
  record.

Everything else is `bounded_computation`.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

What a successor inherits, stated exactly:

1. **The smallest tree of any shape on which active-weight deletion-only Hall fails at an eligible rank is still unknown.** It lies
   at order at least 20 (the census is exhaustive through 19, with order 19 done by one critic) and at most 1465 (`CB(8,86)/460`,
   by P8). Every tree between those orders is untested except:
   - the bare-leaf caterpillar rows up to 24 (9 rows);
   - `PP(7,2)/12` (`n = 35`);
   - `CB(4,4)/14` (`n = 39`);
   - `CB(1,7)/10` (`n = 24`);
   - the CB quotient rows up to 114 (Cycle 1).

   All of these saturate with deletion arcs alone.
2. **Within `CB(d,m)`, `114 < n < 1465`:** deletion-only Hall is open for sector shapes other than root-plus-arm and
   `{u_i, c_i1}`. Settling it needs a full-row flow, which in turn needs a proved coarser lift (U2's equitable lift).
3. **Pendant-pair caterpillars:** the next eligible rows (`PP(13,1)/13`, `PP(9,2)/15`, `PP(6,4)/18`) exceed `(S_k)^L` orbit
   quotients. The weight-one sector screen shows no deficiency up to `n ≤ 600` (margin at least +7), so the family is not a
   promising source through that sector. Other sectors are unscreened.
4. **No row with load-bearing switch arcs has been delivered anywhere** (item (c)). The nearest known rows remain `CB(8,86)/460`,
   `CB(8,89)/476` and `CB(8,92)/492`, owned by T1 and U2.
5. **Genuinely heterogeneous chokes** (unequal choke degrees) have no eligible tested row. Eligibility needs a larger total branch
   count than the configurations F1 tried.

## Artifact inventory

All files are under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-crit-F1-T/`. All use the
Python standard library only, with exact integers, and were run with `PYTHONDONTWRITEBYTECODE=1`, so no `__pycache__` was
written. Replay each generator by `cd`-ing into this directory and running `python3 <script> <args>` as shown.

| File | SHA-256 | Role |
|---|---|---|
| `seals.py` | `edc04d6e…` | capsule, dispatch, Stage 3 and Stage 2 seals; capsule member digests |
| `crit_instrument.py` | `9e3e3ea9…` | own brute-force instrument (tree test, counts, x, F_p, S, w_F, (D)∪(S), Dinic) |
| `flatflow.py` | `91498b5f…` | second, independently coded Dinic (flat arrays), used by both quotients |
| `fixed_points.py` / `fixed_points.json` | `5fda51d8…` / `ebb8ae7c…` | 5 fixed points |
| `cb_sweep.py` | `d2ed4ff8…` | own CB closed form and P8 sweep (`python3 cb_sweep.py 1466`; `… 1601`) |
| `cb_sweep_1466.json` / `cb_sweep_1601.json` | `37595c69…` / `5b9b8256…` | 1 hit (n ≤ 1465); 3 hits (n ≤ 1600) |
| `bare_cat.py` / `bare_cat_3-3_4-3_6-2_3-4.json` | `7fbc0786…` / `0efb5134…` | 4 of F1's bare-leaf rows re-derived |
| `pp_scan.py` / `pp_scan_300.json` | `da40c651…` / `8e6e68b0…` | PP closed form against brute; 298 eligible with n ≤ 300 |
| `pp_quotient.py` | `c08254d4…` | quotient instrument 1 (`python3 pp_quotient.py 7 2 12`) |
| `pp_validate.py` / `pp_validate.json` | `bab02216…` / `25017dc3…` | 224 brute-vs-quotient comparisons, 0 mismatches |
| `pp_quotient_L7_k2_p12.json` / `run_L7_k2_p12.log` | `3ec59a62…` / `129a34e6…` | PP(7,2)/12 result, instrument 1 |
| `pair_quotient.py` | `ec417e11…` | quotient instrument 2, generic hub/pair (`python3 pair_quotient.py PP 7 2 12`; `CB 4 4 14`) |
| `pairq_validate.py` / `pairq_validate.json` | `82cf0467…` / `8de1f25d…` | 260 comparisons (CB and PP), 0 mismatches |
| `pairq_PP_7_2_p12.json` / `run_PP72_p12_pairq.log` | `855b3995…` / `ac37481e…` | PP(7,2)/12 result, instrument 2 |
| `pairq_CB_4_4_p14.json` / `run_CB44_p14.log` | `4c11d5cc…` / `6342ba26…` | CB(4,4)/14 result |
| `pp_sector_scan.py` / `pp_sector_scan_600.json` | `ac429653…` / `b0939e11…` | PP weight-one sector screen, n ≤ 600 |
| `replay/` | F1's 14 files, copied out | F1 replay. Its outputs `grid_search_results.json` and `deletion_only_check.json` re-hash to F1's digests. `caterpillar_sweep.json` differs from F1's only by the wall-clock field; F1's shipped copy is kept as `caterpillar_sweep.F1.json` |

**Background jobs.** Three runs went to the background:
- PID 41308, launched with `nohup`: finished, and `kill -0 41308` then reported "no such process".
- Harness tasks `b9b4e6oz3` and `bbmfbg7ti`: both finished with exit 0.

No background job of mine is running at the final write. I ran no process listing and killed nothing.
