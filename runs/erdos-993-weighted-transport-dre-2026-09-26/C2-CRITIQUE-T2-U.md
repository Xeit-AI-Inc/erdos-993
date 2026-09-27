# Critique

Critic `C-T2-U` (orientation U, formal / structural), Cycle 2 Stage 4 of r30, on seat `T2`
(route `C2-T-02 WEIGHTED-SECTOR-LYM-BEYOND-PAIRS`, orientation T). Dispatch
`control/dispatch/c2-stage4/DISPATCH-C-T2-U.md`, SHA-256 `e16d6ea69089c6efd5461e8524a54fc7370392b24e01b6221940718fc9192a4d`,
recomputed before reading: match.

Boot: I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS file outside the run root was read. The harness
itself injected the repository `CLAUDE.md` and the user auto-memory index into context before the dispatch; I did not open
them and used nothing from them.

Model disclosure: the two-part disclosure line is under `## Verdict`.

## Identity and seal audit

- **Capsule** `control/c2-critic-capsules/T2-PACKET-MANIFEST.json`: the inner seal, recomputed as the SHA-256 of the
  canonical JSON without `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline), is
  `a0fe655a9499f12474a9be1a73bb0db375062e5035488c2fd35c06c27570922b`. It matches the dispatch. All 13 members re-hash to the
  manifest's per-file `sha256` and byte counts (13/13).
- **Stage 2** `control/C2-STAGE2-PACKET-MANIFEST.json`: seal recomputed as `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`.
  It matches the protocol, and T2 cites the same value.
- **Stage 3** `control/C2-STAGE3-PACKET-MANIFEST.json`: seal recomputed as `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d`,
  self-consistent. It lists `cycles/cycle-2/stage3/returns/T2/RETURN.md` at `64dec148…f544cf`, the same digest as my capsule.
- **Stage 4 dispatch** `control/C2-STAGE4-DISPATCH-MANIFEST.json`: seal recomputed as `a361cd175e7c3968cdf2a8d14f92e9b2b5883b018bd72e837f54f26ce38da383`,
  self-consistent. Its members shared with my capsule carry identical digests.
- **Return's listed digests.** I copied every inventoried `.py` and `.json` out of `scratchpad/c2-T2/` into my
  `replay/`. All 8 script digests and all 7 output digests in the return's replay table match the shipped files. I replayed 4
  generators copy-out-first (`t2_nm_checks`, `t2_fixedpoint_k112`, `t2_fixedpoint_cb892`, `t2_fixedpoint_starforest_small`),
  and each output was byte-identical to the shipped one (`699323ef…`, `c3c8e17a…`, `6de93edc…`, `1f1e4c33…`). I did not
  replay `t2_switch_check.py`, `t2_search.py` or `t2_record_cbstar_scan.py`, which are long-running. I re-derived their
  content independently instead (below).
- **Sources used.** `sources/authority/CLAIM-IDENTITY.json` re-hashes to `eba20be3…8c09c84`, which equals its
  `control/SOURCE-DIGESTS.json` entry. I used it for the (LB) statement and for the alias check.
  `sources/predecessor-ledgers/r27.csv` was used only to locate (LB).
- **Award labels.** T2 cites only C1-LA1, which exists. No nonexistent "C1-LA3/4" label appears.
- **Read-boundary disclosure (mine).**
  1. One single-level `ls -la` of `<run root>/scratchpad/` (above grant). It returned directory names only, and I read no
     other seat's files. This was an error, and it is disclosed here.
  2. One `ls -la` of `scratchpad/c2-T2/`, the inventoried-artifact directory. It surfaced the uninventoried logs
     `d8_extra.log`, `scan_stdout.log`, `scan_stderr.log` and `t2_search_*.log`. I did not read them.
  3. One `grep -rln` rooted at `sources/` (within grant).
  I read no other return, critique, adjudication, experiment root or external source. There was no network use, no
  install and no Lean invocation. I started no background job.

## Independent re-derivation

**Instrument.** `crit_lib.py` is written from SEMANTIC-CONTRACT §1.1–1.2 and shares no code with `t2_lib.py`. It provides:

- a literal `CBstar` builder with string labels;
- a tree test that checks connectivity (BFS) and acyclicity (parent-tracked DFS) separately, plus the edge count;
- backtracking enumeration of independent sets;
- `x` computed through rank `α` with explicit `i_{α+1} = 0`;
- the selector `F_p` from `Δ_p(T − v) < 0` on the original tree;
- the literal active weight `(B ∖ {v}) ∩ W_v ≠ ∅`;
- the relation (D) ∪ (S), with a switch at any `u ∉ B` having `|N(u) ∩ B| = 2`;
- the aggregate `S` computed by separate enumeration on `T − H_v` and `T − R_v`;
- an exact integral Dinic max-flow;
- my own closed form `I(CBstar) = (1+2z)·g^m + z(1+z)·f^M`, with `f = (1+z)^t + z` and `g = f^d + z(1+z)^{td}`, and the
  analogous closed forms for `T − c` (a private leaf) and `T − v`. These are checked against brute force on 11 instances.

On every full-network row, `supply − capacity = S` is asserted from independently computed sides.

**Fixed points reproduced (own instrument):**

| Tree | Result |
|---|---|
| `K_{1,12}`, `p = 8` | `n = 13`, `α = 12`, `x = 6`, `|F| = 12`, supply 1980, capacity 3960, `S = −1980`, mixed and deletion max-flow 1980 |
| Path-star `(2,3,4)`, `p = 7` | `n = 15`, `α = 11`, `x = 5`, `|F| = 10`, 1483 / 2701 / flow 1483, `S = −1218`, 2025 arcs |
| `CB(8,92)` | `n = 1567`, `α = 829`, `x = 490`, window `[492, 552]`, arm and private leaves favorable at 492 |

**T2's claims re-derived:**

- **T-A.** I derived `f_t`, `w_t` and `𝒲 = f^{M−1}(f + M·w_t)` myself and matched them against literal brute-force sector
  counts and weights at every local rank on all 11 small instances (`TA_brute_match` true throughout). At `t = 1`,
  `𝒲 = (1+2z)^M`. **Confirmed.**
- **T-D-R1.** The ≤1-per-star sub-poset is the product of `M` "claws" (empty below `q = t+1` atoms). Its down-degree is
  `k` and its up-degree is `q(M−k+1)`, so `k|X| ≤ q(M−k+1)|∂X|`, with equality at the whole layer. **Confirmed** by my own
  derivation. **T-D-R2** is the Boolean lattice on `Mt` points. **Confirmed**, and it is classical.
- **T-C.** Leaf pairs of one star shade only the `t` leaf singletons, never the support state. **Confirmed.** It is an
  unweighted fact about the count poset (see Attack 3).
- **T-E.** My brute-force check on `CBstar(3,2,2)`, `p = 9`, gave exactly 1,338 choke-switch instances with 0
  mismatches, and 1,272 distinct choke-switch targets. **Confirmed** for choke switches.
- **§7 table.** My closed forms reproduce all 16 rows of T2's `d = 8` table exactly (`n`, `α`, `x`, window). At `p = x+2`,
  every private leaf and the arm leaf are favorable on all 16 rows.

**Critic-derived theorem (C-T2-U; STATED here, grade `proved_informal` pending an isolated second read).**

Let `T = CBstar(d,m,t)`, with `d, m, t ≥ 1`, `M = dm` and `Q = {r, v}`. Let `S^Q_{p+1}` be the sector sources, let
`p ≥ 2` and `k = p − 1`, and let `F` contain `v` and every private leaf. Let `N_D` be the deletion neighbourhood in the
whole network (all of `I_p`, not only the sector). Then

    max_{X ⊆ S^Q_{p+1}} ( Σ_X w_F − Σ_{N_D(X)} w_F ) = max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1}),

with `C(M,k) = 0` for `k > M`. A deletion-deficient sector subfamily therefore exists iff `k ≤ M` and
`(t+2)(p−1) < (t+1)(dm+1)`.

*Proof.*

1. **Private targets.** For `B` in the sector, `B∖{r}` and `B∖{v}` lie outside the sector. Across all sector sources
   they are pairwise distinct. Each has weight `w(B) − 1`: `v` loses its only witness `r` or is itself removed, and `r` is
   never a witness of a private tag.
2. **Self-covering.** A source with `w(B) ≥ 2` is covered by its own private targets, since `2(w − 1) ≥ w`. So
   `deficit(X) ≤ deficit(X₁)`, where `X₁` is the set of weight-1 members of `X`. With `F ⊇ {v} ∪ C`, the weight-1
   members are exactly the ≤1-per-star sub-poset `R1`.
3. **Deletion within `R1`.** Deleting a non-`Q` vertex from an `R1` member gives an `R1` member of weight 1. Deleting
   `r` or `v` gives weight 0. So `deficit(X₁) = |X₁| − |∂_{R1} X₁|`.
4. **Upper bound.** By T-D-R1, `|∂_{R1} X₁| ≥ c·|X₁|` with `c = k/(q(M−k+1))`, so
   `deficit(X₁) ≤ (1 − c)|R1_k| = |R1_k| − |R1_{k−1}|`.
5. **Attainment.** `X = R1_k` attains this bound: every `R1_{k−1}` state has an empty star, so it is reachable. ∎

- **Check.** On 75 (instance, `p`) rows over 11 small `CBstar` instances (`t = 1, 2, 3`), the exact max-flow deficit
  equals the formula on every row (`crit_small_output.json`).
- **At `t = 1`** the theorem is the Cycle 1 P8/P9 record (`3p ≥ 2dm + 5`), and at `CB(8,92)`/492 it gives
  `R_491 − R_490 = |R_490|/491`. Only `t ≥ 2` and the exact max-deficit form are new.

**Critic-derived corollary (C-T2-U; STATED, `proved_informal`, one `formally_verified` input).** For every `t ≥ 2`, every
`d, m ≥ 1` and every `p ≥ x(T) + 2` (in particular every eligible `p`), provided `F_p(T)` contains `v` and all private
leaves, no subfamily of the root-plus-arm sector of `CBstar(d,m,t)` is deletion-deficient.

*Proof.*

1. `Δ_x(T) < 0`, so (LB) `E993-R27-FOREST-DESCENT-LINEAR-BOUND` (`formally_verified`: `Δ_k < 0 ⇒ n ≤ 4k` for every
   forest) gives `x ≥ n/4`, with `n = 3 + m + (t+1)M`.
2. Therefore `4[(t+2)(p−1) − (t+1)(M+1)] ≥ (t+1)(t−2)M + tm + 3t + 2m + 10 > 0`. ∎

The bound fails for `t = 1`, as it must, because the three `CB` rows exist.

- **Bounded cross-checks.** A scan over `t ≤ 5`, `d ≤ 10` and `n ≤ 1600` (5,762 configurations with a nonempty window)
  finds exactly the three standing `t = 1` rows `CB(8,86)`/460, `CB(8,89)`/476 and `CB(8,92)`/492 and nothing else.
  On the 13 `t ≥ 2` rows of T2's table, the corollary's margin ranges from 360 to 4,459 (in units of 4).

## Attacks and findings

1. **T-B is false as a deletion-deficiency criterion for `t ≥ 2` (strike T-B's `proved_informal`).** T-B asserts that the
   whole sector layer's deletion image "is the entire lower layer exactly". Both halves of that are wrong once `t ≥ 2`:
   - (a) **Out-of-sector targets are omitted.** `N_D` contains the out-of-sector targets `B∖{r}` and `B∖{v}`, of total
     weight `2(𝒲_k − R_k)`. That is zero at `t = 1` and positive for `t ≥ 2`. This is exactly the attack brief's
     root/choke edge case, and T2 never addresses it.
   - (b) **Some lower states are unreachable.** When `k − 1 ≥ M`, some lower sector states are maximal (every star in
     support or full-leaf state) and cannot be reached. T2's proviso "`k ≤ Mt`" is the wrong condition. Example:
     `CBstar(2,2,2)` at its eligible `p = 7` has 4 unreachable lower sector states.
   - (c) **The whole layer is not the extremal family.** `CBstar(2,2,3)` at `p = 4` has a true whole-layer deficit of
     −28 while the maximum subfamily deficit is 160. `CBstar(1,3,3)` at `p = 4` gives −89 against 16.

   Measured against the exact max-flow, T-B gives 16 false positives, for example `CBstar(2,2,2)` at `p = 5, 6`, where
   T-B fires but every sector subfamily satisfies deletion Hall. What remains true is only the generating-function
   identity already contained in T-A. T-B recovers P8 at `t = 1` only because (a) and (b) both vanish there.
2. **§7 is struck as evidence.** Its search and scan instruments apply T-B's wrong criterion. They never compute `F_p`
   (they assume all leaves are favorable), and they assert no `supply − capacity = S` on any row. That breaks shared rule
   1 and SOLUTION-CONTRACT §3.3. The "3,102 configurations", the "3,115 total" and the "no `t ≥ 2` deficiency up to
   `n = 5,503`" finding carry no weight as they stand. The conclusion itself survives, now **proved** for the whole
   `CBstar` family by the critic corollary, under the selector hypothesis.
3. **The §4 diagnosis is superseded.** T2 calls the mixed support/leaf regime "the central obstruction for every `t ≥ 2`"
   and leaves the weighted NM bound for arbitrary `X` open (Remaining obligation 1). Under the literal (D), which includes
   the `Q`-deletions, the mixed regime collapses: every member of weight at least 2 covers itself, and the question
   reduces exactly to `R1`, where T-D-R1 is sharp. T-C is a correct fact about the unweighted count poset, but it is not
   where the weight breaks anything. The gap came from treating the sector as a closed poset.
4. **(S) is misdescribed.** §1 says a switch is "insertable exactly at a choke `u_i`". In fact:
   - `s` has exactly two neighbours (`r` and `v`) in every sector member, so every sector source has an `s`-switch, at
     every `t`.
   - For `t ≥ 2`, a support with exactly two leaves present is a switch vertex that keeps the image inside the sector.

   On `CBstar(3,2,2)` at `p = 9` there are 1,770 `s`-switches, 1,338 choke switches and 4,110 support switches. T-E,
   §6 and the "181,669 literal switch instances" therefore cover choke switches only. This does not affect T-E's formula.
5. **The (SW) template (§6) states no inequality.** It is a method remark, so there is nothing to test. It also recasts
   E8 (no tag-by-tag compensation) as a warning about overcounting. By the critic corollary, the root-plus-arm sector of
   `CBstar` has no deletion-deficient subfamily for `t ≥ 2`, so the template has no object on that family. T2's empty
   search reflects a theorem, not a compute limit.
6. **Selector hypothesis.** Every `CBstar` statement (T-A, T-E, the sector-weight range, and the critic theorem) assumes
   `F ⊇ {v} ∪ C`. T2 checked this only on `CBstar(2,2,2)`. I checked it on every small eligible row and at `p = x+2` on
   all 16 `d = 8` rows. It is not proved across windows; that is F2's selector question. If `v ∉ F`, the sector is
   trivially non-deficient, since `B∖{r}` carries the full weight.
7. **Internal inconsistency in the return.** The return says one job was "stopped by literal PID, `kill 29870`, after
   collecting sufficient data", and then says "all reported computation ran to completion". The shipped scan output has
   16 rows, matching the table.
8. **Minor.** The sector-weight-range sentence contains a garbled "never `1+2=2`". The true statement, when `F` is all
   leaves, is that weights lie in `{1} ∪ [3, ∞)`, and are odd for `t = 2`. That is correct and trivial.
9. **Non-falsifiable checks.** None found. The WID checks in the `K_{1,12}` and `CBstar(2,2,2)` scripts use two
   independent sides. The `492/491` check is an identity on T2's own generating function, and at `t = 1` it duplicates
   the Cycle 1 record.

## Mechanism-equivalence and fence check

- **Not a refuted mechanism.** T2 does not revive `E993-R23-LITERAL-DELETE-ONLY-HALL`: its statements concern sector
  subfamilies under `w_F`, not deletion-only Hall on a tree. The critic theorem is the same kind of object, a sector
  deletion-deficit statement analogous to P9. It is not a (HALL) claim, and not a cut. A deletion deficit is not a (CUT)
  (ruling 15).
- **No closed region re-proved.** None of the other refuted keys is touched, and no closed region is re-proved. NM, P5–P9
  and Lemma C are cited, and the `t = 1` recoveries are labelled as fixed points.
- **No fenced evidence.** No census value enters a proof, there is no RTree wording, and no live root is read. (LB) is
  used at its exact scope (forests, `Δ_k < 0 ⇒ n ≤ 4k`), which is an order-bound input. The mechanism ≠ aggregate fence
  is respected: nothing bounds `S(T,p)`.
- **Scope.** Everything, including the critic advance, concerns the root-plus-arm sector of `CBstar`, not (HALL-COND)
  for every `X ⊆ I_{p+1}` on these trees.

## Certification audit

| Literal | Status |
|---|---|
| "T-B `proved_informal`" | **Struck** (Attack 1). |
| "∂X is the entire lower layer" | **Struck** (false for `t ≥ 2`; out-of-sector targets and maximal states). |
| §7 "3,102 configurations", "3,115", "no `t ≥ 2` deficiency", "zero new rows" | **Struck as evidence** (wrong criterion, no `F`, no WID). The configuration counts match the shipped JSON, but they are counts of the wrong test. |
| "(S) insertable exactly at a choke" | **Struck** (Attack 4). |
| "181,669 literal switch instances, zero mismatches" | **Narrowed** to "(source, choke) choke-switch instances". The sum is arithmetically correct, and one configuration (1,338) was independently confirmed. The other seven rest on the shipped, digest-verified output, not replayed by me. |
| "T-E `proved_informal`" | **Retained**, for choke switches only. |
| "T-C … exactly why the weight breaks the symmetry" | **Narrowed**: an unweighted count-poset fact. |
| T-A, T-D-R1, T-D-R2 | **Retained** at `proved_informal`. T-D-R2 is classical. |
| "Every script ran in the foreground" / "all … ran to completion" | **Inconsistent** with the background polling and `kill 29870` recorded in the same section. |
| "every replayed output's SHA-256 matched" | **Confirmed** for the 4 I replayed. |
| Fixed points | `K_{1,12}` and the `CB(8,92)` `n, α, x`, window: **confirmed**. |
| Stage 2 seal, model disclosure | **Confirmed.** |
| `ps aux` | Disclosed by T2 as a process violation. |

## Verdict

verdict: retained_narrowed
headline_resolved: no

**What is retained.** T-A, T-D-R1, T-D-R2, T-C (as an unweighted fact) and T-E (choke switches only) are retained.

**What is struck.** T-B and §7's evidentiary value are struck. The (S) description is corrected, and the (SW) template
is recorded as a remark, not a claim.

**Critic-derived advance (C-T2-U).**

- The exact sector deletion-deficit theorem for `CBstar(d,m,t)`, with max deficit
  `max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1})`. It rests on a general self-covering reduction: `Q`-deletions are private
  targets, so only weight-1 members can carry a sector deficit.
- Its corollary: for `t ≥ 2`, no root-plus-arm sector subfamily is ever deletion-deficient at `p ≥ x + 2`, via (LB).

This answers the attack brief's structural question and T2's Remaining obligations 1–2 on this family.

**Grades.** Both statements are `proved_informal` in my judgement, STATED at review stage, and need an isolated second
read. A suggested candidate key after an alias check is `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` (no lexical
collision among the 434 master keys). Its mathematical nearest neighbours are NM and the non-key record P9, which it
contains at `t = 1`.

**Keys touched.**

| Key | Status |
|---|---|
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | OPEN, untouched |
| `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | OPEN, untouched |
| `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` | context |
| `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` | asserted in my instrument |
| `E993-R27-FOREST-DESCENT-LINEAR-BOUND` | input |
| `E993-R23-LITERAL-DELETE-ONLY-HALL` | distinguished |

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

1. **Isolated second read** of the critic theorem and corollary, re-deriving:
   - (i) that `B∖{r}` and `B∖{v}` are private, distinct targets of weight `w(B) − 1`;
   - (ii) that the weight-1 members are exactly `R1` when `F ⊇ {v} ∪ C`;
   - (iii) the attainment at `X = R1_k`;
   - (iv) the (LB) arithmetic `(t+1)(t−2)M + tm + 3t + 2m + 10 > 0`.
2. **The selector hypothesis** `F_p(T) ⊇ {v} ∪ C` across whole eligible windows of `CBstar`. It is verified at `p = x+2`
   on 16 rows and on the small rows, and not proved (F2's question). The case where `F` omits some private leaves while
   containing `v` is not covered.
3. **Generalizing the self-covering reduction** to arbitrary sectors `S^Q` with `T − N[Q]` a star forest. The
   `Q`-deletion targets are always private. What must be bounded is the weight lost when `q ∈ Q` is a witness, and then
   the weight-1-type residual family's shadow.
4. **(HALL-COND) for `X` not contained in the sector**, on `CBstar` and on the three `CB` rows, is untouched here and
   remains T1's and U2's. For `t ≥ 2`, deletion-only Hall on the root-plus-arm sector holds by the corollary. Whether any
   `t ≥ 2` deletion deficit exists outside that sector is open.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-crit-T2-U/`
(file SHA-256):

| File | SHA-256 |
|---|---|
| `crit_lib.py` | `695868350ab359deb000d21b5fbe0c34f9900849dddcbce59d0ee9f9fb9e5f47` |
| `crit_small.py` | `db4947915af12bdecd9b0960d12b278f9dd434dc4b7938bbb2e97d69aa4c84ab` |
| `crit_small_output.json` | `db1e22b6f5ddc0a5823c30bb5ffe2fc39f4d1d3dfa54ccad763e841d2677d76c` |
| `crit_scan.py` | `7c7d5e38fe09454ae0b3f60e1ce41d1821512d27a057c1df8acc543b4736e2ea` |
| `crit_scan_600_output.json` | `eb6ab738f9ee960a3bd08568d15b942a8dfb108803eb735799b6dabd88f8916d` |
| `crit_scan_1600_output.json` | `07517cc10209ec63652a9c9a70ccc2682c8617ac516551e1a36d2f4594a274a3` |
| `crit_d8.py` | `4d145ef6221d7b2c1ed65c43e1efd25b0ce07bffea29c46bf70bef58bdab246a` |
| `crit_d8_output.json` | `e33fd734d5796a28c9a242165a3b28a87de5e6ee5619f2432cd7fe7d8534102c` |
| `crit_te.py` | `16a53b733450370a5e735191d064eaf681d9f9efe1e7ed7786546dde51fd82b9` |
| `crit_te_output.json` | `474df6104e1e03d7ab069bbe5545ae35e1fc8579fffd5335a32eb6de5fbce88d` |
| `replay/` | T2's 9 scripts copied out (digests as in T2's table; `verify_helper.py` `82fc3e49…`), T2's shipped outputs under `replay/shipped/`, and 4 replayed outputs (byte-identical to shipped) |
| logs | `crit_small_stderr.log`, `crit_d8.log`, `scan600.log`, `scan1600.log` |

Replay (from the scratch directory): `python3 -B crit_small.py; python3 -B crit_d8.py; python3 -B crit_scan.py 1600; python3 -B crit_te.py`.
All jobs ran in the foreground. No background job exists.
