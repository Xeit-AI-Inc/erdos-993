# Critique

Critic seat `C-F2-T` (orientation T, prove), Cycle 2 Stage 4 of r30, reviewing the route return of seat `F2`
(`C2-F-02 SELECTOR-BINDING-AND-UNREACHABLE-CAPACITY`, orientation F). Date 2026-09-26.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot acknowledgment.** I am operating within VerityOS. Boot read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and nothing else from VerityOS. The dispatch confines the boot to
those two files, so I did not follow the startup protocol's memory, conversation, module, skill, log or decision steps.

**Read-boundary disclosure.**
- (i) The harness saved the return's text to a tool-result cache file outside the run root
  (`~/.claude/projects/.../tool-results/…txt`), and I read the return from that file. It is a byte copy of the capsule member,
  not a different source.
- (ii) `control/C2-CRITIC-COMMON-BRIEF.md` refers to `control/C2-WORKER-COMMON-BRIEF.md`. That file is not a capsule member, so I
  did not open it. The dispatch restates the rules I applied.
- (iii) I ran one non-recursive `ls -la` on `scratchpad/c2-F2/`, which is inside my grant.
- (iv) I ran `grep` only inside my own scratch copy (`scratchpad/c2-crit-F2-T/replay/`) and on the capsule member
  `RETURN.md`, and I ran one non-recursive `ls` of `sources/lower-region/inputs/`.
- (v) I ran no search above my grant, used no network, installed nothing, started no background job and ran no process
  listing.

## Identity and seal audit

Every seal below was recomputed as SHA-256 over compact, key-sorted JSON of the manifest without `seal_sha256`, with no
trailing newline.

- **Dispatch file** `control/dispatch/c2-stage4/DISPATCH-C-F2-T.md`: `4c624d4e9f23fed940f0468ad785374d2d0954b647aca4aff5e4cd45f3edb6d8`.
  This matches the wrapper, and I checked it before reading the file.
- **Capsule seal** `control/c2-critic-capsules/F2-PACKET-MANIFEST.json`: recomputed
  `cae78e43a97efbd4be9a61d96d44b4e7e02f1c5ce617c8e09c4fa00e3203f53c`, equal to the embedded value and the dispatch value. All
  13 members re-hash and match their listed byte counts (the return is `0ee9251107cd…f37`, 35964 bytes).
- **Stage 4 dispatch manifest:** recomputed `a361cd175e7c3968cdf2a8d14f92e9b2b5883b018bd72e837f54f26ce38da383`, equal to its
  embedded value.
- **Stage 3 packet manifest:** recomputed `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d`, equal to its
  embedded value.
- **Stage 2 packet manifest:** recomputed `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`, equal to the
  protocol's value and the return's cited value.
- **Digests the return lists:**
  - `F2-EVIDENCE.json`: `edf4fa62c18619553fcdfd0f4c84e9b22549ac77699c08ec15cd02b39adaaeaa`. I re-hashed the shipped file, and a
    copy-out-first replay (below) reproduced it byte-identically.
  - `sources/lower-region/inputs/ordinary_tree_checked.py`: `(16710, a012bb78…533d)`, re-hashed; it matches its
    `SOURCE-DIGESTS.json` entry. `SOURCE-DIGESTS.json` records `file_count` 981. No `__pycache__` was present in that
    directory when I listed it.
  - `DISPATCH-F2.md` `8c349d44…4e37` and `CLAIM-IDENTITY.run-local.json` `cb8000c3…c7349a`: both match their entries in the
    Stage 3 manifest (a capsule member). I did not open the registry file itself, which is outside my capsule.
- **Process record.**
  - F2's Disclosure 5, a `ps aux` full process listing, is a rule violation, and I record it as one. F2 self-disclosed it,
    and the output was not used.
  - F2's `## Background jobs` section says "no `pgrep`/full process listing was used". That contradicts Disclosure 5 and is
    struck (see Certification audit).
  - The "12 unlisted files under `sources/c1-stage7-sources/`" in Disclosure 3 are a **non-finding**. They are the Stage 7
    frozen files with their own digest record.
  - The return cites no nonexistent award label: no "C1-LA3", "C1-LA4" or similar appears.

## Independent re-derivation

**Instrument.** I wrote my own instrument, `crit_lib.py`, from SEMANTIC-CONTRACT §1 only, using the standard library and
exact integers. It does not import F2's code or the pinned evaluator. It has these parts:
- a tree test (n−1 edges plus BFS connectivity);
- a forest DP for `i_k(G − D)` on the original carrier, cross-checked against brute-force enumeration of independent sets on
  every network row;
- `x` found as the least `k` with `Δ_k < 0`, scanned through rank `α` (plateaus are not descents);
- the selector `F_p` computed from `Δ_p(T − v) < 0` on the original tree at the fixed rank `p`;
- `S` computed from `q_v` through the literal deletion sets `H_v = {v, s_v}` and `R_v = N[s_v]`;
- the literal active weight: `v ∈ F ∩ B` counts iff `B ∩ (N(s_v) ∖ {v}) ≠ ∅`;
- the literal relation (D) ∪ (S), where (S) requires exactly `|N(u) ∩ B| = 2` and `u ∉ B`, and every image is asserted to lie
  in `I_p`;
- Dinic max-flow for the mixed network and for the deletion-only network.

Before any other output, every row asserts that `supply − capacity = S` from independently computed sides.

**Fixed points reproduced (`crit_fixed.json`).**

| Row | n | α | x | p | \|F\| (= all leaves) | supply / capacity / flow | S | arcs | gap |
|---|---:|---:|---:|---:|---:|---|---:|---:|---:|
| `K_{1,12}` | 13 | 12 | 6 | 8 | 12 | 1980 / 3960 / 1980 | −1980 | 1980 | 0 |
| path-star (2,3,4) | 15 | 11 | 5 | 7 | 10 | 1483 / 2701 / 1483 | −1218 | 2025 | 0 |
| path-star (2,2,4,3) | 18 | 13 | 6 | 8 | 12 | 8033 / 13467 / 8033 | −5434 | 11691 | 0 |
| `G_3` | 14 | 9 | 4 | 6 | 6 | 253 / 527 / 253 | −274 | 664 | **2** |
| `T(4,2)` | 14 | 9 | 4 | 6 | 5 | 202 / 454 / 202 | −252 | 547 | **2** |
| `G_4` | 17 | 11 | 5 | 7 | 7 | 1542 / 2735 / 1542 | −1193 | 4466 | 2 |
| `G_5` | 20 | 13 | 6 | 8 | 8 | 8875 / 14196 / 8875 | −5321 | 27850 | 2 |
| `T(5,2)` | 17 | 11 | 5 | 7 | 6 | 1173 / 2267 / 1173 | −1094 | 3387 | 2 |

- The first three rows match the common brief's fixed points exactly.
- The `G_3` and `T(4,2)` rows match F2's §C table digit for digit, and the unreachable witnesses are the same up to labelling:
  mine are `{0,3,4,6,9,12}` and `{c_1,…,c_4,ℓ_1,ℓ_2}`.
- The `G_4`, `G_5` and `T(5,2)` rows are new rows from my instrument, all `bounded_computation`. Every one saturates, and
  every one also saturates with deletion arcs alone.

**F2's closed forms and the principal claim (A1 to A4), re-derived by hand and checked in `crit_algebra.py` for k = 1..60.**
- *A1.* The matching `{01, 23, a_ib_i}` and the cover `{0, 2, b_i}` both have size k+2. Every edge (01, 02, 23, 24, 0a_i,
  a_ib_i, b_ic_i) meets the cover. So `α = 2k+3`. Correct.
- *A2.* Conditioning on root 0 gives `I(G_k) = (1+y)(1+3y+y²)^{k+1} + y(1+y)²(1+2y)^k`. The branch polynomials are
  `1+y`, `(1+y)²+y`, and `I(P_3) = 1+3y+y²`; the minus-attachment polynomials are `1`, `(1+y)²` and `1+2y`. Correct. It
  equals my DP output coefficient for coefficient.
- *A3.*
  - `P` is palindromic of odd degree 2k+3, so `P_{k+1} = P_{k+2}`.
  - Write `Q = (1+2y+y²)(1+2y)^k`. Then `q_k = 2^k + k·2^k + C(k,2)·2^{k−2} = 2^{k−3}(k²+7k+8)` and
    `q_{k+1} = 2^{k+1} + k·2^{k−1} = 2^{k−3}(4k+16)`. So `Δ_{k+1}(I) = q_{k+1} − q_k = −2^{k−3}(k²+3k−8) < 0` for k ≥ 2.
  - I re-derived both coefficient formulas and they are correct. The rank indexing is also correct:
    `Δ_{k+1} = i_{k+2} − i_{k+1}`, and `[yQ]_j = q_{j−1}`. The inequality is the strict one at the right rank, so
    `x(G_k) ≤ k+1` for **every** k ≥ 2.
  - At the boundary k = 2 the formula gives `2^{−1}·2 = 1`, and indeed `i_4 − i_3 = 87 − 88 = −1`.
  - The Newton-inequality and strict-unimodality paragraph is correct but not load-bearing: the proof needs only
    `P_{k+1} = P_{k+2}` and the sign of `q_{k+1} − q_k`.
  - **Grade: `proved_informal`. The step is sound.**
- *A4.*
  - The upper bound `3(k+3) < 2(2k+3)+1 ⇔ k ≥ 3` is pure algebra from A1.
  - The lower bound `x + 2 ≤ k + 3` follows from A3 for k ≥ 2.
  - For k ≤ 2 the upper bound fails.
  - So **"(G_k, p = k+3) is eligible iff k ≥ 3" is `proved_informal` in both directions.** I confirm F2's claim.
  - The reverse inequality `x ≥ k+1` is not needed for eligibility, and F2 correctly keeps it at `bounded_computation`.
- *B1 and B2 (`T(m,k)`).*
  - The matching `{e_ic_i (i<m), c_mf, sℓ_1}` and the cover `{c_1,…,c_m, s}` each have size m+1, so `α = 2m+k−1`. Correct.
  - The window upper bound `m ≥ 4` is correct.

**Replay (copy-out-first).** I copied `scratchpad/c2-F2/*.py,*.json` to `scratchpad/c2-crit-F2-T/replay/`, deleted the
copied JSON, and ran `f2_main.py → f2_part2.py → f2_part3.py → f2_part4.py → f2_combine.py` with
`PYTHONDONTWRITEBYTECODE=1`. All writes are relative to the replay directory, and the run took about 42 s. The replay
regenerated `F2-EVIDENCE.json = edf4fa62…aaeaa`, **byte-identical** to the shipped file, and all five part files re-hash
identically. The replay is weighed below against my own instrument, not used in place of it.

## Attacks and findings

**F-1. Fidelity: pass.**
- F2's `active_weight` counts `v ∈ F ∩ B` with `(B ∖ {v}) ∩ W_v ≠ ∅`, where `W_v = N(s_v) ∖ {v}`. That is the active weight,
  not tags merely present.
- `transport_targets` is (D) ∪ (S) with exactly two neighbours of `u` in `B` and `u ∉ B`.
- `favorable_leaves` evaluates `Δ_p(T − v)` on the original tree at the fixed rank `p`.
- `crossing_index` scans through rank `α`.
- §C asserts `supply − capacity = S` from two sides (`F2-PARTC.json`: `supply_minus_capacity_eq_S: true`).
- My independent instrument reproduces §C.
- Part D, the selector search, builds no network, so WID is not needed there. It computes `F_p` literally.
- The `f2_lib.py` docstring says the pinned evaluator "is imported separately". No script imports it (I grepped the
  replay), so the docstring is stale. This is a cosmetic inconsistency, not a fidelity failure.

**F-2. A certification literal in A3 is false and is struck.** F2 writes "`x(G_k) ≤ k+1` was additionally verified directly …
for `k=0..304` … `x(G_k) = k+1` exactly on every one of these 305 instances".
- F2's own `F2-PARTA.json` (`x_checks_G_k_k0_304`) records `x(G_0) = 2` and `x(G_1) = 3`, with `x_le_k+1: false` on both.
- My DP agrees: `I(G_1) = 1+8y+21y²+22y³+9y⁴+y⁵` has x = 3.
- The correct literal is **303 instances, k = 2..304**. The theorem's hypothesis k ≥ 2 is exactly where it holds, so the
  mathematics is unaffected.

**F-3. The (WID) status is misreported and struck.**
- F2 calls `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` "OPEN at Stage 1 … corroboration of the existing
  `proved_informal` statement-level grade".
- `control/C2-STAGE1-GATE.md` and `control/C2-ALLOCATION.md` record it as VERIFIED `formally_verified`
  (C1-LA1, `E993Transport.activeWeightAggregateIdentity`).
- F2's WID assertions are fidelity checks, as the rules require, not corroboration of a grade.

**F-4. Item (a), the selector search. Its evidence is narrowed and struck in part.** My audit (`crit_partd_audit.py`, run on
F2's own generator) finds:
- "1,143 eligible (T, p) rows" are 1,143 row evaluations but only **588 distinct rows up to tree isomorphism**. The gadget
  grid repeats trees: double stars `(a,b)` and `(b,a)`, attachment at either centre with L = 0, and so on.
- "trees up to order ~44" is wrong: the largest tested order is **37**. The generator skips trees with more than 40
  vertices, and the dumbbells reach 34.
- `F2-PARTD.json` ships only four summary scalars. No per-row data (tree, n, α, x, p, |F|) is shipped, contrary to the
  shared rule that every eligible row is reported with full row data. The count is backed only by replay.

The substantive verdict, "not proved, not refuted", stands. I extend the question in "Remaining obligation" below.

**F-5. Item (a): the brief's proposed proof route is insufficient as stated (critic finding).**
- The brief suggests that `x(T − v) ≤ x(T) + 1` together with `x + 2 ≤ p` would give favorability. It would not.
  `x(T − v) ≤ p − 1` says only that `T − v` has *some* strict descent before `p`. Favorability is `Δ_p(T − v) < 0` at `p`
  itself.
- The missing step is descent persistence: `Δ_j(T − v) < 0` for every `j ∈ [x(T − v), p]`, or at least at `j = p`, for every
  leaf `v` and every eligible `p`.
- That is a no-rise-after-descent statement for the forest `T − v` on the window `[x(T)+2, ⌊2α/3⌋]`. It is a statement of the
  same type as the open unimodality question. It would follow from unimodality of `T − v`, and I know of no route to it that
  avoids a window unimodality statement.
- So the selector lemma is exactly "every leaf-deleted forest `T − v` is strictly decreasing at every eligible `p`". It is not a
  cheap simplifying lemma, and no first-descent monotonicity alone proves it.
- Bounded side result (`crit_selector.py`; free trees generated by canonical level sequences, with counts checked against
  A000055 for orders 2 to 14): on every leaf of every one of the **5,446 free trees of orders 2–14**, `x(T − v) ≤ x(T)`.
  That is the stronger inequality, with maximum `x(T − v) − x(T) = 0`. It is `bounded_computation` and a new observation.
- The same run found all leaves favorable on the 515 eligible rows at orders 11–14. That repeats the Cycle 1 census; it is
  an instrument sanity check and **not evidence**.

**F-6. Attempting the open step for `G_k` (critic-derived advance, attributed to C-F2-T).** F2 leaves A5, the favorability
of leaves 3 and 4, at `bounded_computation`. It is provable in a few lines.
- *Setup.* `I(G_k − 3) = R + yS` with `R = (1+2y)·P′`, `P′ = (1+y)(1+3y+y²)^k` and `S = (1+y)(1+2y)^k`. F2's A2 already
  has this formula.
- *The S term drops out.* `deg S = k+1`, so `S_{k+3} = S_{k+2} = 0`. Hence
  `Δ_{k+3}(G_k − 3) = R_{k+4} − R_{k+3} = (P′_{k+4} − P′_{k+3}) + 2(P′_{k+3} − P′_{k+2})`.
- *P′ is strictly decreasing past its centre.*
  - `P′` is real-rooted with negative roots `−1`, `−1/φ` and `−1/ψ`, and it is palindromic of odd degree 2k+1, so
    `P′_k = P′_{k+1}`.
  - By Newton's inequalities its coefficient ratios are strictly decreasing, so `P′_{k+1} > P′_{k+2} > … > P′_{2k+1} > 0`,
    and `P′` is zero beyond degree 2k+1.
  - For k ≥ 1, `P′_{k+2} > 0` and `P′_{k+3} < P′_{k+2}`. For k = 1 this holds because `P′_4 = 0`.
- *Conclusion.* `Δ_{k+3}(G_k − 3) < 0` for every k ≥ 1. The automorphism swapping 3 and 4 gives the same for leaf 4. So
  **3, 4 ∈ F_{k+3}(G_k) for every k ≥ 1**.
- Checked as exact identities for k = 1..60 in `crit_algebra.py` (asserts: `c(G_k−3) = R + yS`, `deg S = k+1`,
  `Δ = R_{k+4} − R_{k+3} < 0`). This agrees with F2's `k = 1..304` table.

**F-7. The unique unreachable target, and the gap in closed form (critic-derived, attributed to C-F2-T).**

*Reachability criterion.* A target that is not maximal has a deletion in-arc. A maximal `A` has an in-arc iff some `u ∈ A` has
two neighbours outside `A` whose only neighbour in `A` is `u` ("private" neighbours). Those two neighbours are automatically
non-adjacent in a tree, and `B = (A ∖ {u}) ∪ {y, z}` then satisfies `|N(u) ∩ B| = 2`. This is F2's P10, re-proved here in two
lines.

*`G_k`, all k ≥ 1.* Enumerate the maximal independent `(k+3)`-sets.
- If `0 ∈ A`: then 1, 2 and every `a_i` are excluded. Leaves 3 and 4 are forced in, and each path branch contributes exactly
  one of `b_i`, `c_i`. So every such set has size k+3.
  - If some `c_i ∈ A`, then 0 has the private pair `{1, a_i}`, so `A` is reachable.
  - If every branch contributes `b_i`, the set is `A_k`. Its possible switch centres all fail: `u = 0` has only the private
    neighbour 1 (2 is adjacent to 3 and 4, and each `a_i` is adjacent to `b_i`); `u = 3` and `u = 4` have a single neighbour;
    `u = b_i` has `a_i`, which is adjacent to 0.
- If `0 ∉ A`: leaf 1 is forced in. Branch {2,3,4} contributes {2} or {3,4}. Each path branch contributes {b_i} or
  {a_i, c_i}. Size k+3 forces one of two shapes:
  - `{1, 3, 4, b_*}`: `b_i` has the private pair `{a_i, c_i}`.
  - `{1, 2, a_i, c_i, b_{j≠i}}`: vertex 2 has the private pair `{3, 4}`.
  - Both shapes are reachable.
- Hence **`A_k = {0, 3, 4, b_1, …, b_k}` is the unique member of `I_{k+3}(G_k)` with no in-arc**.
- `F ∩ A_k ⊆ {3, 4}`, since 0 and the `b_i` are not leaves. Both tags are active through `W_3 = {0, 4}` and `W_4 = {0, 3}`.
  So `w_F(A_k) = 2` by F-6.
- Brute-force confirmation for k = 1..6 (`crit_unreach.py`): exactly one unreachable target of any weight, equal to `A_k`.

*`T(m,2)`, all m ≥ 2.*
- If `s ∈ A`: s has the private pair `{ℓ_1, ℓ_2}`, so `A` is reachable.
- Otherwise `ℓ_1, ℓ_2 ∈ A`. For each i < m exactly one of `c_i`, `e_i` is in `A`, and `d_i ∈ A` iff `c_i, c_{i+1} ∉ A`. Size
  m+2 forces no `d_i` in both sub-cases (`f ∉ A`, which forces `c_m ∈ A`; and `f ∈ A`, which forces `c_{m−1} ∈ A`).
  - If some `c_i ∉ A` (i < m), then `c_{i+1}` has the private pair `{d_i, e_{i+1}}`, or `{d_{m−1}, f}` when i+1 = m.
  - If `f ∈ A`, then `c_{m−1}` has the private pair `{e_{m−1}, d_{m−1}}`.
  - The only remaining set is `A = {c_1, …, c_m, ℓ_1, ℓ_2}`.
- Hence `A` is the unique unreachable target for every m ≥ 2, and `w_F(A) = |{ℓ_1, ℓ_2} ∩ F_p| ∈ {0, 2}`. The value is even
  because of the `ℓ_1 ↔ ℓ_2` automorphism.
- Brute-force confirmation for m = 2..6: unique.

**Resulting statement (critic-derived; STATED at Stage 4; needs an isolated second read before registration).**
- For every k ≥ 3, with p = k+3 and F = F_p(G_k):
  - (G_k, p) is eligible (F2's A1, A3 and A4);
  - 3, 4 ∈ F (F-6);
  - `A_k` is the unique target of `I_p` with no in-arc of (D) ∪ (S) (F-7);
  - hence **`Σ_{I_p} w_F − Σ_{N(I_{p+1})} w_F = 2` exactly**.
- So on infinitely many eligible tree rows the right-hand side of (HALL-COND) at `X = I_{p+1}` is exactly 2 below the total
  capacity, which is the right-hand side of the scalar `S ≤ 0`.
- Grade `proved_informal`, composed from F2's A1/A3/A4 (retained) and my F-6/F-7.
- Wording: "strictly stronger" in F2's item (b) and the allocation means only that this right-hand side is strictly smaller.
  It does not mean a row where `S ≤ 0` holds and Hall fails. No such tree row is known, and every `G_k` row I computed
  saturates.
- For `T(m,2)` the same closed form holds (gap = `|{ℓ_1, ℓ_2} ∩ F_p|`, proved), but it is conditional on the two facts F2
  left bounded: `x(T(m,2)) ≤ m` and `Δ_{m+2}(T(m,1)) < 0`.

**F-8. `T(m,2) − ℓ_1 ≅ T(m,1)` is a structural fact; the grade rises.** Deleting `ℓ_1` leaves the path, the pendants `e_i`
and the single leaf `ℓ_2` on `s`. That is the defining construction of `T(m,1)` with `ℓ_2` renamed `ℓ_1`, and the identity on
the remaining vertices is an isomorphism. My builder confirms that the edge lists coincide literally.
- F2's grade `bounded_computation` (degree sequence plus polynomial match) should rise to **`proved_informal`**.
- The favorability of `ℓ_1, ℓ_2` itself stays `bounded_computation`.

**F-9. T(m,2) observation (bounded).** `x(T(m,2)) = m` for m = 3..13 in my run. F2's table has `x(T(304,2)) = 288 < m`. So
`x(T(m,2))` falls below m for large m, and "x ≤ m" is not tight asymptotically. A proof will probably need an asymptotic
(mode-location) estimate plus a finite check, not an exact identity like `G_k`'s.

**F-10. Quantifier and circularity checks.**
- No step assumes `S ≤ 0`, uses the budget, or subtracts in ℕ unguarded.
- The gap identity `Σ_{I_p} w − Σ_{N(I_{p+1})} w = Σ_{A unreachable} w(A)` is true by the definition of `N(·)`. F2's grade
  `proved_informal` for "the identity itself" is therefore trivially correct. The content is the uniqueness, now proved (F-7).
- No (HALL-COND) claim for arbitrary `X` is made or needed.

## Mechanism-equivalence and fence check

- F2 proposes no transport mechanism. Its objects are eligibility, the selector, and arc-reachability records.
- None of the ten refuted keys is revived. None of these is re-proved as a contribution: a closed region (the high tail or
  the order bands `n ≤ 2p+2`), a settled family (`T_m`, spiders, path-stars), or `CB`.
- `G_k` rows have n = 3k+5 and p = k+3, so `2p+3 = 2k+9 ≤ n` for k ≥ 4 and `n ≤ 4p − 8 = 4k+4` for k ≥ 1. The family therefore
  lies in the unresolved band `2p+3 ≤ n ≤ 4p−8` for k ≥ 4, and is not in a closed region.
- No census value enters a proof. F2's item (a) search and my F-5 run are `bounded_computation`.
- There is no RTree wording, and (LIFT) and INV are not used.
- The controller's prior is not cited as evidence.
- The family record serves the (HALL) scope note and does not touch the primary aggregate. A positive gap never implies a
  cut: every computed `G_k` and `T(m,2)` row saturates.

## Certification audit

**Struck or corrected:**
1. "`x(G_k) = k+1` exactly on every one of these 305 instances (k = 0..304)" and "`x(G_k) ≤ k+1` … verified … for k = 0..304".
   F2's own evidence shows k = 0 and k = 1 fail. Correct to **k = 2..304 (303 instances)**.
2. "(WID) … OPEN at Stage 1 … existing `proved_informal` grade". Correct to VERIFIED `formally_verified` (C1-LA1).
3. "1,143 eligible (T, p) rows". Correct to 1,143 evaluations, **588 distinct up to isomorphism**.
4. "trees up to order ~44". Correct to a **maximum order of 37**.
5. "no `pgrep`/full process listing was used" (`## Background jobs`). This contradicts Disclosure 5 (`ps aux`) and is struck.

**Minor inconsistencies:**
- The §C "IMPORT LIST: json, sys, pathlib" understates the imports; `f2_main.py` also imports `fractions`. This is cosmetic.
- The `f2_lib.py` docstring claims a pinned-evaluator import that does not exist. This is also cosmetic.

**Backed:**
- The `F2-EVIDENCE.json` digest (replayed byte-identically).
- The §C rows (my instrument, digit for digit).
- The A1, A2 and A3 formulas: A2 against my DP for k = 1..60; A1 and A3 re-derived by hand.
- "eligible iff k ≥ 3" (k = 0..304 in F2's table; k = 1..60 in mine).
- `α(T(m,k))`.
- The ranges in `F2-PARTB.json`, which has no false flags outside m < 4.

**Not re-checked (outside my capsule):**
- The alias-check hit list against `CLAIM-IDENTITY.run-local.json` (438 claims).
- The SR-REACH census values quoted in §C ("gap 2 or 3 or 1").

**Grade adjustments:**
- B4 isomorphism: `bounded_computation` → `proved_informal` (F-8).
- A5 favorability of 3 and 4: `bounded_computation` → `proved_informal` (critic-derived, F-6).
- "gap = 2 always" for `G_k`: bounded → `proved_informal` (critic-derived, F-7).

## Verdict

verdict: retained_narrowed

headline_resolved: no

The return's principal mathematics is retained at `proved_informal`: `x(G_k) ≤ k+1` for every k ≥ 2, and hence
"(G_k, k+3) eligible iff k ≥ 3" in both directions. The α formulas and closed forms are also retained.

The narrowing is to certification literals:
- the 305-instance `x = k+1` literal (true only for k ≥ 2);
- the misreported (WID) status;
- the item (a) row count and order range;
- the contradicted "no process listing" line.

Critic-derived advance (C-F2-T): leaves 3 and 4 are favorable in `G_k` for every k ≥ 1, and `A_k` is the unique unreachable
target. Together with F2's eligibility theorem this makes the `G_k` family a complete `proved_informal` statement: every row is
eligible, both tag leaves are favorable, and the gap is exactly 2. That is the "eligibility AND favorability both proved"
condition SR-REACH set for registration.
- Proposed predicate-form key (candidate only): `E993-R30-GK-ELIGIBLE-ROW-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`.
- Its lexical and mathematical alias check against the run-local registry could not be run inside my read boundary and is
  owed by the synthesis.
- It needs an isolated second read before registration.

Nothing here proves or refutes (HALL).

## Remaining obligation

1. **Second read and registration of the `G_k` statement.** For every k ≥ 3, p = k+3:
   - eligible;
   - `{3, 4} ⊆ F_p(G_k)`;
   - `A_k` is the unique no-in-arc target;
   - `Σ_{I_p} w_F − Σ_{N(I_{p+1})} w_F = 2`.

   Owed: an isolated second read of F-6 and F-7 as written here, then an alias check and a predicate-form key.
2. **`T(m,2)`, exactly two open facts.**
   - (i) `x(T(m,2)) ≤ m` for every m ≥ 4.
   - (ii) `Δ_{m+2}(T(m,1)) < 0` for every m ≥ 4.

   Proved here: uniqueness of the unreachable target and the conditional gap, and the isomorphism reduction. By F-9, (i) is not
   tight for large m (`x(T(304,2)) = 288`), so an asymptotic mode estimate plus a finite check is the likely route. A useful
   start, checked in my scratch: `I(T(m,k)) = (1+y)^k I(Cat_m) + y I(Cat′_m)`, obtained by conditioning on `s`. Here `Cat_m` is
   the chain with a pendant on every `c_i` (f acting as the pendant of `c_m`), and `Cat′_m` is the chain without `f`. Neither
   factor is palindromic.
3. **Item (a), the selector lemma.** It is exactly "`Δ_p(T − v) < 0` for every leaf v and every eligible p". F-5 shows it needs
   descent persistence on `T − v` over the eligible window, which no first-descent inequality alone supplies. It remains open.

   Bounded lead: `x(T − v) ≤ x(T)` held for every leaf of every free tree of order ≤ 14. A proof of that inequality would
   still need persistence. The identity `I(T) = I(T − v) + y·I(H_v)` gives `Δ_k(T) = Δ_k(T − v) + Δ_{k−1}(H_v)`, which proves
   `x(T − v) ≤ x(T)` whenever `Δ_{x−1}(H_v) ≥ 0`. The case where `H_v` has already descended is open.
4. The item (a) search should ship per-row data (tree, n, α, x, p, |F|) and deduplicate by isomorphism.

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-crit-F2-T/`.
Everything uses the standard library and was written with `sys.dont_write_bytecode = True`, so no `__pycache__` was written.
Everything ran in the foreground, and no background job was started.

| File | SHA-256 | Role |
|---|---|---|
| `crit_lib.py` | `ec0fd4da444bc575d05b4e6db1d702cfce046add198f72a677ecd1e233ab8d8b` | independent instrument (DP, brute force, selector, S, weight, relation, Dinic) |
| `crit_families.py` | `5e3ff4382637c618b85c8b44cdadf9317dfc07259af7624e1e57f83985c257b4` | `K_{1,m}`, path-stars, `G_k`, `T(m,k)` builders |
| `crit_fixed.py` / `crit_fixed.json` | `e348c9ae…24d4` / `0e2eb15179a7fbe7f91065d391872daaadb5459a031b29d068a64feb4cf093c0` | fixed points and 8 network rows |
| `crit_algebra.py` / `crit_algebra.json` | `fd963855…b72b` / `c9309bbc48ba3bbbb32c2a0d2bd7b734a056ea9e07e6c3c4ff4076d9db427c9d` | A2/A3 identities, F-6 favorability identity (k = 1..60), T(m,2) ranges and isomorphism (m = 2..60) |
| `crit_unreach.py` / `crit_unreach.json` | `bfddd8e9…a2a8` / `8cec3fbd4170af73b709fe39d47b55cffe1b9a14fdb37b52f49b23069eeec3fe` | unique unreachable target, `G_1..G_6` and `T(2..6,2)` |
| `crit_selector.py` / `crit_selector.json` | `a231abe4…d230` / `f088bd2588953f2a705c6408c64948f889d33976a15a95f4b1d71112a6cdb071` | `x(T − v)` vs `x(T)`, free trees of orders 2–14 (A000055-checked) |
| `crit_partd_audit.py` | `c4e4fffc282a46d234a67d0c238c7af21fbfba38fa02acebcd6c2fe9e96e8b3f` | isomorphism dedup and order range of F2's item (a) rows |
| `replay/` | `F2-EVIDENCE.json = edf4fa62c18619553fcdfd0f4c84e9b22549ac77699c08ec15cd02b39adaaeaa` | copy-out-first replay of F2's five scripts; byte-identical |

Replay: `cd …/scratchpad/c2-crit-F2-T && python3 crit_fixed.py && python3 crit_algebra.py && python3 crit_unreach.py && python3 crit_selector.py`
(about 4 s in total). F2 replay: `cd replay && PYTHONDONTWRITEBYTECODE=1 python3 f2_main.py && python3 f2_part2.py && python3 f2_part3.py && python3 f2_part4.py && python3 f2_combine.py`.
