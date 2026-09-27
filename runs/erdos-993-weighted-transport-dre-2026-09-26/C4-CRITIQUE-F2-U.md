# Critique

Critic `C-F2-U` (orientation U, formal/structural), Cycle 4 Stage 4 of r30, on the return of seat `F2`
(`C4-F-02 GK-UNIFORM-HALL-OR-CUT-AND-THE-SATURATION-CONJECTURE`, orientation F).

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full, before any other read. I opened no other VerityOS file.
The host placed the project `CLAUDE.md` and the user's auto-memory index into context at session start. I did not open or act
on either (see the read-boundary disclosure under `## Artifact inventory`).

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- Dispatch `control/dispatch/c4-stage4/DISPATCH-C-F2-U.md`: SHA-256 `85b17f4282bcb5ee1f05ac1e4faab30a8e001239876e395704e0b5bd153217ef`. **Match** (hashed before reading).
- Seals recomputed canonically (SHA-256 of the manifest without `seal_sha256`, `sort_keys`, separators `(",", ":")`, no trailing newline; `python3 -B`, run alone):
  - Capsule `control/c4-critic-capsules/F2-PACKET-MANIFEST.json`: declared `0fd0246169f5917587d93039f052316d69d229ea506aee89c42864e76d3551f5`, recomputed `0fd0246169f5917587d93039f052316d69d229ea506aee89c42864e76d3551f5`. **Match.**
  - Stage 4 dispatch manifest: `784132f0726699b6f7ef5cbf07196f7d35d233d980799f25fdd6883cadde9229`. Declared value matches recomputed.
  - Stage 3 packet manifest: `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9`. Declared value matches recomputed.
  - Stage 2 packet manifest: `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`. Matches the value stated in the protocol and the common brief.
- I verified all 14 capsule members (SHA-256 and byte count). All 14 match, including `cycles/cycle-4/stage3/returns/F2/RETURN.md` (`39d3170b…`).
- I verified the return's artifact inventory after copying it out to `scratchpad/c4-crit-F2-U/replay/`. All 11 listed digests match: `model.py 63385069…`, `gk_direct_check.py 3540de8b…`, `gk_direct_check_out.json 51af99ae…`, `orbit_types.py af1a0264…`, `orbit_types_out.json 320536ac…`, `brute_validate.py 10b4ef3d…`, `brute_validate_out.json c2ff2a75…`, `explicit_rule.py 7239893e…`, `explicit_rule_out.json ac6e275f…`, `conjecture_search.py 4c5d3978…`, `conjecture_search_out.json e6b5c312…`. `MANIFEST.json` lists the same 11 values.
- Claim identity.
  - Keys touched: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (HALL, OPEN, master name kept) and `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (primary, OPEN, untouched).
  - Also touched: `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE` (GK-SIGN, `proved_informal`, re-confirmed and not claimed) and `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO` (the whole-layer key).
  - Used: `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` (C3-LA1, `formally_verified`) and the conjecture C-U2-F (`conjecture`).
  - Distinguished: `E993-R23-LITERAL-DELETE-ONLY-HALL`.
  - The return proposes no key. Its proposed "record" is lexically distinct from the whole-layer key (neither name contains the other) and mathematically distinct from it (universal over `X` rather than `X = I_{p+1}`).
  - The run-local registry is not a capsule member, so I ran no alias check against it. I mark the critic-derived statement below with that limitation.

## Independent re-derivation

**Own instrument.** Scratch path: `scratchpad/c4-crit-F2-U/inst/`. Standard library only, exact integers and `Fraction`, `python3 -B`.

- I wrote it from SEMANTIC-CONTRACT §1 without reading F2's code first. It includes:
  - an iterative forest independence-polynomial DP;
  - `x` computed through rank `α`;
  - `F_p` derived from `Δ_p(T − v)` on the original tree;
  - `S` from the literal `H_v`/`R_v` definition;
  - the literal active-tag `w_F`;
  - the literal (D) and (D) ∪ (S) relations;
  - my own Dinic implementation, followed by an arc-by-arc certificate check. From the arc flows alone it confirms that every source is saturated and every target is within capacity.
- **Fixed points reproduced** (`fixed_points_out.json`, `cb_scalar_out.json`):
  - `K_{1,12}`/8: n 13, α 12, x 6, |F| 12, supply 1980, capacity 3960, S −1980, deletion-only saturating, 1980 arcs.
  - Path-star (2,3,4)/7: n 15, α 11, x 5, |F| 10, 1483/2701, flow 1483, S −1218, 2025 arcs.
  - Path-star (2,2,4,3)/8: n 18, α 13, x 6, |F| 12, 8033/13467/8033, S −5434, 11691 arcs.
  - `CB(8,92)`/492: n 1567, α 829, x 490, eligible window [492, 552], 737 favorable, S < 0. Leaf classes were reduced by the wreath symmetry to one representative each.
  - `Δ_0 = n − 1` and `i_2 = C(n,2) − (n−1)` hold on all three small trees.
  - Not reproduced, because this mechanism does not reach them: the `T_m` rows and the A000055 counts.
- **`G_k` scalars, k = 1..60** (`gk_out_60_30.json`).
  - Eligibility holds exactly for k ≥ 3 and fails at k = 1, 2.
  - `F_{k+3}(G_k)` is the whole leaf set for every k = 1..60, derived each time.
  - `supply − capacity = S` is asserted on every row.
  - `S`, `x` and `α` agree with both of F2's instruments on all 40 rows k = 1..40.
  - This closes a gap in F2's pipeline. `orbit_types.py` does not derive `F`, check eligibility, or assert (WID). Its weight formula hard-codes F = all leaves, and `gk_direct_check.py` only covers k ≤ 40. So for k = 41..60 the return's `F_p`/eligibility/WID groundwork was not derived. My instrument now derives it: it holds.
- **Orbit quotient built independently of F2's hand-derived table** (`gk.py`).
  - Types are generated by constructing a literal representative set for each candidate (central, arm-count) pair and keeping it only if it passes a literal independence test.
  - Weights are the literal `w_F` on the representative.
  - Arcs are found by applying every literal deletion and switch to the representative (one arm per occupied state class, which is sound because arms in the same state are swapped by `S_k` while `B` stays fixed) and canonicalising the image.
  - The existential orbit-arc rule is exactly this: `B ~ A'` with `A' ∈ O_A` gives `g·B = rep ~ g·A' ∈ O_A`.
  - Orbit sizes are `k!/∏n_s! · (2 if c34 = 1)`, and on every layer their sum equals the polynomial coefficient `i_{p+1}` or `i_p`, asserted at every k.
- **Orbit identity.** |Aut(G_k)| is `2·k!` by brute-force automorphism count at k = 1..4. For k ≥ 2, vertex 0 is the unique vertex of degree k + 2. The types are exactly the `S_k × Z_2` orbits: the counts are invariant, and arm permutations plus the 3↔4 swap act transitively. They are **not** a coarser equitable partition, so C3-LA1 applies at its stated scope (Γ = Aut, orbit totals, existential arcs).
- **Encoding cross-check** (`compare_encoding_out.json`). For k = 1..30 and both relations, F2's `types_of_size`, `weight · orbit_size` and `all_targets` agree exactly with mine: same type sets, same supplies and capacities, and identical arc sets (all arcs and positive-endpoint arcs).
- **Literal brute force, k = 1..8** (`brute_out_8.json`). This is one k beyond F2's k ≤ 7; k = 8 has 355,890 sources and 593,275 targets.
  - Zero weight mismatches between literal sets and their type representatives.
  - The canonicalised literal arc type-pairs equal the quotient arc set, for both relations.
  - Literal max-flow = quotient max-flow = supply for both relations, with both certificates passing.
- **Central result re-derived.**
  - Deletion-only (HALL-COND) holds for every `X ⊆ I_{p+1}` at every k = 3..60.
  - (D) ∪ (S) holds at k = 3..30.
  - My supply, capacity and max-flow equal F2's `orbit_types_out.json` on all 58 + 28 rows.
  - The representative rows k = 3, 4, 5, 10, 20, 40, 60 in the return's table are exact.
  - The route relies on C3-LA1 (`formally_verified`) plus an encoding that is correct by construction and validated literally through k = 8. That is sound support for "Hall on the quotient ⇔ Hall on `G_k`". Each row is `bounded_computation` (`computer_assisted` per instance).
- **Replay** (`scratchpad/c4-crit-F2-U/replay/`, copy-out, `python3 -B`, foreground runner). All five generators reproduce byte-identical outputs:

  | Generator | Replay time |
  |---|---|
  | `gk_direct_check` | 1.4 s |
  | `brute_validate` | 18 s |
  | `orbit_types` | 203 s |
  | `explicit_rule` | 2.9 s |
  | `conjecture_search` | 5.6 s |

  No `__pycache__` was left.

## Attacks and findings

**F-1. "No tested row is even close to tight" is struck.**
- The relevant margin for (HALL) is `ρ(k) = min_X w(N(X))/w(X)`, not capacity/supply of the whole layer. I computed it exactly on the quotient by Dinkelbach iteration with min-cuts (`hall_ratio_out_30.json`, k = 3..30).
- For deletion arcs, `ρ_D(k)` is 1.7293 at k = 3, 1.2124 at k = 10, 1.0685 at k = 30. The product `k(ρ_D − 1)` falls from 2.188 to 2.055.
- At every k it is strictly below the whole-layer ratio (1.2793 at k = 10; 1.0873 at k = 30).
- The Hall margin therefore shrinks like `2/k`. The saturation is not robust in the sense the wording suggests.
- With switch arcs, the minimiser is the whole positive layer. Its ratio sits below capacity/supply by exactly two units of capacity, the unreachable weight-two target. This is consistent with the registered whole-layer key's "unique no-in-arc target, active weight two".

**F-2 (critic-derived; tight family identified exactly).**
- The minimising deletion-only family is **exactly** `X* = C(L′, p+1)`, where `L′ = {1, 3, 4} ∪ {a_i, c_i}` is the maximum independent set of `G_k`. It is unique, with `|L′| = 2k + 3 = α`.
- The minimum ratio equals `W(p)/W(p+1)` with `W(j) = C(2k+2, j−1) − C(k+2, j−1) + (k+2)·C(2k+1, j−2)`. This is a direct count of active tags over `j`-subsets of `L′`:
  - tag 1 needs some `a_i`;
  - tags 3 and 4 need each other;
  - `c_i` needs `a_i`.
- Checked: equal as exact rationals for every k = 3..30, and the minimiser's types are exactly the types inside `L′` (`closed_form_check_out.json`).
- Asymptotically `ρ_D = 1 + 2/k + O(1/k²)`. The values are 1.0338 at k = 60 and 1.0020 at k = 1000.
- That this family is the minimiser is `bounded_computation` (k ≤ 30). The formula for its own ratio is exact for all k.

**F-3. The §4 negative finding is narrowed.**
- The rule as coded (`explicit_rule.py`) deletes `c_i`, the tag itself, for every AC arm. For tag 1 it deletes the witness `2` or `a_i`. The prose "by deleting the SPECIFIC WITNESS vertex … (never the tag itself)" is therefore false for the arm tags. The prose and the code disagree.
- The failure itself reproduces byte-identically: 13 capacity violations at k = 3, … 25,705 at k = 7.
- The return's generalisation is not supported: "which split works depends on the GLOBAL profile … a single local, context-free rule cannot". I tested two local, context-free fractional rules literally with exact `Fraction` inflows (`uniform_split_out.json`, `local_rules_*.json`). In both, each active tag splits its unit over the deletions that keep it active.
  - **U** (equal shares) is a valid saturating flow at k = 3, 4, 5 (max inflow/capacity 4/5, 34/35, 1). It fails from k = 6 (35 violating targets, ratio 53/48).
  - **H** (share ∝ 1/add(target), with add = number of addable vertices) is valid through k = 7 (ratio 8728/8811). It fails at k = 8 (3,374 violating targets, ratio 1.0643).
  - The violating types are always targets with many ∅ arms and many AC arms.
- Correct wording: "this witness-deletion rule fails at every k = 3..7". Whether some local rule works for every k is open. The concentration diagnosis stands as a description of this rule's failure only.

**F-4. The conjecture search (§5) coverage claims are struck and narrowed.**
- `scan_tree` has `max_n_for_full_scan=17` and returns no rows for n > 17. `main` also wraps every scan in `try/except Exception: continue`.
- The audit (`audit_conjecture_out.json`, which imports F2's replay copy): of 546 listed trees, **497 were scanned**, and **49 were silently skipped**: all 40 random order-18 trees and 9 hand-built trees of orders 18, 20–24, 29. No exception was swallowed.
- The scanned order range is 6–17. The claims "orders up to 29", "larger orders up to 18" and "546 trees in total" (as scanned) are struck.
- `conjecture_search.py` asserts no (WID) on any row.
- The 13 eligible rows are not identified in the shipped artifact. I identified them: tree indices 5, 11, 16, 17, 313, 346, 357, 361, 370, 372, 376, 449, 461. I re-derived each with my own instrument. `F`, `S`, supply and capacity match F2 exactly, (WID) holds, and deletion-only saturation is confirmed. They now stand on two instruments.
- Two of the 13 (indices 16, 17) are `G_3` and `G_4` themselves.
- Twelve of the 13 satisfy `n ≤ 2p + 2`, the formally CLOSED order band for the aggregate. Only `G_4` (n = 17, p = 7) lies in the unresolved domain `2p + 3 ≤ n ≤ 4p − 8`.
- So as saturation instances of record the search adds **no eligible row in the unresolved domain beyond the `G_k` family itself**.
- The conjecture stays at `conjecture`, correctly.

**F-5. Smaller fidelity and certification points.**
- (a) The return says the `G_k` numbers `253/527/−274 … 269507/380552/−111045` are "on record in `SEMANTIC-CONTRACT.md` §1.2". They are not in that file (I read it in full). The attribution is struck. The numbers themselves are correct.
- (b) F2's "saturates" is `max_flow == total_supply` from Dinic. It carries no arc-level certificate. With uncapacitated arcs that is mathematically sufficient, and my certificate-checked instrument confirms every row.
- (c) The "no other automorphism" argument presumes vertex 0 is fixed. At k = 1, vertices 0 and 2 both have degree 3. The brute-force count covers that case.
- (d) The quantifier check passes. F2's result covers every `X` at the single eligible rank `p = k + 3`, not every eligible `p` of `G_k`. The return states that scope correctly. No natural-number subtraction or circularity was found.

**F-6 (process).**
- The `pkill -f` pattern kill is disclosed and on the Stage 3 record.
- Also: the return's own process section says `ps aux | grep` was run twice. That is a full process listing filtered for display, the same class as T2's flagged incident. It is in the return's text but absent from F2's items in `C4-STAGE3-READ-BOUNDARY-DISCLOSURES.json`. I note it for the adjudicator. No evidence contamination follows from it.

**Critic-derived statement, STATED (proposed `proved_informal` after an isolated second read).**
- **Lemma (bounded up-degree deletion Hall).** Setting: any finite simple graph `G`, any set `F` of degree-one tags, any `p ≥ 2`, any `X ⊆ I_{p+1}`. Let `d` be the maximum over `A ∈ I_p` of `#{B ∈ X : B ⊃ A}`. Then `(p − 1)·Σ_{X} w_F ≤ d·Σ_{N_D(X)} w_F`. In particular, deletion arcs alone satisfy (HALL-COND) at `X` whenever `d ≤ p − 1`, for example whenever `|⋃X| ≤ 2p − 1`.
- **Proof.**
  1. For each source `B ∈ X` and each tag `t` active in `B`, call a deletion `y ∈ B` valid if `t` stays active in `B − y`. The invalid ones are only `y = t` and, when `|B ∩ W_t| = 1`, that single witness. So there are at least `p − 1 ≥ 1` valid deletions.
  2. Send `t`'s unit equally along the valid deletions.
  3. A target `A` receives tag-`t` flow only if `t` is active in `A`. It receives at most `1/(p−1)` from each of at most `d` sources.
  4. So the inflow at `A` is at most `w_F(A)·d/(p − 1)`.
  5. The outflow of `X` totals `w_F(X)`, and all of it lands in `N_D(X)`. ∎
- **On `G_k`.** Every independent set has at most `α = 2p − 3` vertices. So (HALL-COND) holds, with margin at least `1 + 2/k`, **for every family whose union is independent, for every k ≥ 1**. This includes the computed minimiser `X*`, so the tight family of F-2 is covered uniformly in k.
- Random sanity test (`lemma_test_out.json`): 1,214 families on `G_3..G_5` and random trees, 0 violations of the inequality.
- **What it is not.** It is not (HALL) on `G_k`. Families whose union is not independent can have targets of up-degree `add(A)` up to about `3k/2 > p − 1`. Those are exactly F-3's violating types.
- **Fence adjacency.** The flow is a per-tag split, the shape of the refuted `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`. It is not revived: no per-leaf injectivity is claimed, and the statement is a fractional bound under an explicit up-degree hypothesis.
- It may overlap the Cycle 1 key (NM), whose exact text is outside my capsule. The synthesis must alias-check it before any registration.
- A predicate name, if registered: `E993-R30-DELETION-WEIGHTED-HALL-HOLDS-WHEN-EVERY-TARGET-HAS-AT-MOST-P-MINUS-1-SOURCES-ABOVE-IT`.

## Mechanism-equivalence and fence check

- F2 proposes no transport mechanism. It uses the C3-LA1 equivalence as a computational reduction and computes quotient feasibility by exact max-flow. It does not treat (LIFT) as supplying feasibility.
- The deletion-only result is under the active-tag weight at fixed `F_p`, so it is not `E993-R23-LITERAL-DELETE-ONLY-HALL`. That key's refuted scope is a different weight and relation, and the `G_k` rows are a finite record, not a universal deletion-only claim.
- No refuted key is revived. The failed witness rule is reported as ruled out, not proposed.
- GK-SIGN is re-confirmed and extended to k ≤ 40 as groundwork, not claimed as a contribution. This is correct.
- No census value or RTree wording is used. The controller prior is not used as evidence: the misattributed fixed points in F-5a are cited only as a consistency check.
- No fixed point is mis-reached.
- My own F-3 rules and the lemma are flagged for fence adjacency above.

## Certification audit

- **Backed (replayed byte-identical and re-derived independently):**
  - (HALL-COND) for every `X` on `G_k` at `p = k + 3`: deletion-only at k = 3..60 (58), (D) ∪ (S) at k = 3..30 (28), "switch arcs never needed", and every table digit.
  - Literal validation at k = 1..7 (now k = 1..8).
  - "Exact big integers, no floating point."
  - GK-SIGN two-instrument agreement at k = 1..40.
  - "`F_p` = whole leaf set on eligible rows".
  - `smallest_eligible_k = 3`.
  - The explicit rule's violation counts.
  - "13 eligible rows, all S < 0, all saturating" (now with identities and two instruments).
  - The digests in the inventory.
- **Struck:**
  - "no tested row is even close to tight" (F-1);
  - "(never the tag itself)" for the explicit rule (F-3);
  - "a single local, context-free rule cannot" (F-3);
  - "orders up to 29", "larger orders up to 18" and "546 trees" as scanned (F-4);
  - "frozen fixed points … in `SEMANTIC-CONTRACT.md` §1.2" (F-5a);
  - "take a few minutes each" for `conjecture_search.py` (5.6 s; immaterial).
- **Narrowed:**
  - "type count … close to cubic": source types are 26,214 at k = 34 and 144,020 at k = 60, consistent with Θ(k³), but empirical only.
  - `F_p`/eligibility/(WID) groundwork for k = 41..60 was not derived in F2's pipeline. It is now supplied by this critic's instrument.
- **Grade of the central result:** `bounded_computation` (`computer_assisted` per row). It is a real strengthening in kind over the whole-layer key: every subfamily, 58 instances.
- **Registration.** I recommend a scope note on (HALL) and on the `G_k` family, not a new key. If the synthesis prefers a key, it must be a predicate stating the finite range, for example `E993-R30-GK-TREE-K-3-TO-60-AT-RANK-K-PLUS-3-DELETION-ARC-WEIGHTED-HALL` (`computer_assisted`). It must stay distinct from GK-SIGN (a sign of `S`) and from the whole-layer key (`X = I_{p+1}` only).
- **Plateau (ruling 30):** the return supplies none of (a)–(d). The results cover a finite `k`-range, no cut, and no Lean. The critic-derived lemma is not item (a) either, because it covers restricted families, not full (HALL) on an infinite family.

## Verdict

verdict: retained_narrowed
headline_resolved: no

The central computation is exact and faithful, and I independently reproduced it through k = 60 (literally through k = 8). It is retained at `bounded_computation`. The negative finding is narrowed to the specific rule, and the conjecture-search coverage is narrowed to 497 trees of orders 6–17. Of the eligible rows, 12 of 13 lie in the closed order band. Six literals are struck. Nothing in the return, or in this critique, is a uniform theorem. The critic-derived lemma is STATED with its proof on the face and proposed at `proved_informal` pending an isolated second read and an alias check against (NM).

Chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

F2's list is accurate as far as it goes. It is inexact in two places:

- Item 5 omits that the search skipped every tree above order 17.
- Item 1 does not locate the difficulty.

The sharpened obligation for (a) on `G_k` at `p = k + 3`, all k ≥ 3, is as follows.

- (i) The minimising family is `C(L′, p+1)`, with ratio `W(p)/W(p+1) = 1 + 2/k + O(1/k²)`. That ratio exceeds 1 for all k, and the critic lemma proves (HALL-COND) on every union-independent family uniformly in k.
- (ii) What remains is a **compression lemma**: the deficiency `Σ_X w − Σ_{N(X)} w` does not decrease when each source is pushed toward `L′`. The natural shift is `b_i → c_i`. It preserves `w_F` exactly, because `b_i` is neither a tag nor a witness. Vertices `0` and `2` need separate handling because they are witnesses.
- (iii) Equivalently, one needs a load-balanced local rule that controls targets with many ∅ arms and many AC arms. Rules U and H fail on exactly those targets, at k = 6 and k = 8.

Proving (ii) would give deletion-only (HALL) on the infinite eligible family `G_k`, which is plateau item (a). Obligation (c), `T(m, 2)`, remains untouched.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-crit-F2-U/`. I wrote nothing else except this file.

**`inst/` (own instrument; SHA-256):**

| File | SHA-256 |
|---|---|
| `core.py` | `a82f9d620378425e881d1e12968797a05f70e639276704924120487f38a08e4e` |
| `fixed_points.py` | `8b5dd28b7805c09f1d50f6d012ed27a952598c29b7af818b1a30e87b111773ed` |
| `fixed_points_out.json` | `21a9118483f34b8c2f84094ca27930fc54e5c2be4c04bfeeb8feff7860795ad0` |
| `cb_scalar.py` | `07652f0ef1de4621b3260a30af1bd5dae389644921ec89ccd404ab0e8ecf2828` |
| `cb_scalar_out.json` | `cc86909945f410e3f17f63313ac39a63aa011edcc90df46adfc9c2f5903f767a` |
| `gk.py` | `ec57f3317bdf4ad95dd75345a01aced5a648c888abaa019a16ead4f17a6739f4` |
| `gk_out_60_30.json` | `887de79f241d8d04b65f802874679333e02a74de49db48b28aca3110063f7f46` |
| `gk_out_12_12.json` | `538b75a4a8a76dfc0dfec9016b0154f4af919b6f1465e29f12c6249394e31ecd` |
| `brute.py` | `f55ed5bcdbac1165af39632407714cdfc06dba3f3ffe9a99a4b8e78bff6fae6b` |
| `brute_out_8.json` | `d1a9ca6fbab52feeb20491931f0aea4663bf162dbdc31577dc97e4c954d838db` |
| `brute_out_6.json` | `113db8205a1e7052acd4104759f03c49842bcdd7f12acc98bd76b26768a9447c` |
| `compare_encoding.py` | `2e3d5e59a453555c8749a1b34c71cd8f6ef429e7f62f225c4b61c49cd6efe7ce` |
| `compare_encoding_out.json` | `ada12a7aedf14022ba05587a423d6e5b5826c2651be820525fb37ff5fb07c771` |
| `hall_ratio.py` | `f1e39609038934c18c8ee6988999d47e450d88d64b6316bd3e7b903ecf95c377` |
| `hall_ratio_out_30.json` | `e03a9eefb152d28dff225e68b4072a86144a8f2ae2078e4d7ffa4ca54cbfc4cd` |
| `hall_ratio_out_10.json` | `1b312d0a339af8466c63bbe5f160bebb0a960ef41e3ca215d57ebc71d3ede057` |
| `closed_form_check.py` | `e6b08d64e933664d9c35d56049c86f0855bb2718dbe6a28b9f3fdb4323bbdb5c` |
| `closed_form_check_out.json` | `26d30498842f43841227613afbd957ca3b095d562d4b87dad8b197125fb12469` |
| `uniform_split.py` | `27930afe0c2850bc451c2c6147c89e1ff591bb6684ac73347141c51997eb254e` |
| `uniform_split_out.json` | `7ec13d446ebcb40ed3a677235bd65acd4d0a2c3ecde006d5044111bb20f7c6fc` |
| `local_rules.py` | `b73cb25de9b9c7f14abc54a98c52c20e953d74361f3cd2bc44c35167d5a3cd48` |
| `local_rules_out_6.json` | `edc0281895187e32e4d7da40e0ddb98bc523f5672e3c75a4647b38eb97b55dcb` |
| `local_rules_H_k7.json` | `0055ff5a151f78c615cb79aff8e7a52de19f7aaad09e4d84616d45f5ac9edd6d` |
| `local_rules_H_k8_9.json` | `2b208ca1bbdf4f8d72afa33b6cc49b5b32aea54e89a352a13f5118540f022d38` |
| `runH.py` | `c22ffecd4f1ca2da2d1b9410fd466a85ed1351735de1183d333c79bfec564bb9` |
| `lemma_test.py` | `12b6aa3de9d1bb746f9bb07d3243f50536976ace917866e9a545b944458e464d` |
| `lemma_test_out.json` | `13667a26d4e165a2b5c66d224f4de68d3a6369dd3dde485564efec962d4e225e` |
| `audit_conjecture.py` | `15dbbaf2a15ba4730b76436b49ba9a9b040bec8fd47aec99b15a68ee571bf7a2` |
| `audit_conjecture_out.json` | `09788f766c0a13ee8ecda4f93b55848ddea4c14abe5a24af3d9de70e7f300db3` |

The directory also holds the logs and PID files (`*.log`, `*.pid`).

**`replay/`:** the copy-out of F2's `c4-F2/` files, `orig/` (the shipped outputs, kept for byte comparison), the replay logs and `run_replay.sh`.

**Background jobs.** Six were started: the replay runner, `cb_scalar`, `brute` k ≤ 8, `gk` k ≤ 60, `hall_ratio` k ≤ 30, and `runH`.
- Five ran to completion.
- `runH` was killed by literal PID `kill 41232` after its k = 8 result was written; k = 9 was not needed.
- I confirmed all six PIDs had exited before this write. I did no pattern kill and no process listing.

**Read-boundary disclosure.**
- The host put the project `CLAUDE.md` and the auto-memory index into context. I did not open or act on either.
- I read the preamble lines 1–19 of `C4-CRITIC-ATTACK-BRIEFS.md`, which address all critics, in addition to my own section. One `grep -n '^## '` on that single capsule file displayed the other seats' section headings, names only.
- One non-recursive `ls` of `scratchpad/c4-F2/`, the return's inventoried artifact directory.
- F2's modules were imported only from my copy-out replay directory.
- Nothing under `sources/` was read. I ran no recursive search, used no network and installed nothing.
