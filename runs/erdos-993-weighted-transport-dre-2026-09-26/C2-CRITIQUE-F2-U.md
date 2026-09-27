# Critique

Critic `C-F2-U` (orientation U, formal / structural) of the route return of seat `F2` (`C2-F-02 SELECTOR-BINDING-AND-UNREACHABLE-CAPACITY`, orientation F), Cycle 2, r30 (Erdős #993, weighted mixed-boundary transport). Run root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26`.

**Boot acknowledgment.** I am operating within VerityOS. The boot read exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Per the dispatch, I followed no other VerityOS subsystem: no memory, conversations, modules, skills, logs or decisions were loaded or written.

**Read-boundary disclosures.**
1. The host harness injected the project `CLAUDE.md` and the user auto-memory index into my context at session start. I did not open either, and neither was used as evidence.
2. The assigned return (`RETURN.md`, 35,964 bytes) was too large for inline tool output. The harness saved a verbatim copy under `~/.claude/projects/.../tool-results/`, and I read that copy. It is the same capsule member; its digest was verified on the original.
3. I ran a non-recursive `ls -la` on `scratchpad/c2-F2/`, which is within the grant, and on my own scratch directory. I did not list `scratchpad/`, `cycles/` or any directory above my grant. I ran no `find`, `grep -r`, `rg` or other recursive search above the grant. The only `grep` calls were non-recursive, on single files I had copied into my own scratch.
4. Nothing else was read: no other return, critique or adjudication, no Cycle 1 file, and not `control/C2-WORKER-COMMON-BRIEF.md`, `control/r30_tool.py`, `control/CLAIM-IDENTITY.run-local.json` or `sources/`. I did not need them. This limits what I can check (see the certification audit).

## Identity and seal audit

- **Dispatch.** `control/dispatch/c2-stage4/DISPATCH-C-F2-U.md` has SHA-256 `50d8f7376ca7108473c4c6f896dbf7c080ee2ad1790c69c743cd65c716e6c92b`. This matches the wrapper, and I checked it before reading the file.
- **Capsule seal.** `control/c2-critic-capsules/F2-PACKET-MANIFEST.json` recomputes (canonical JSON without `seal_sha256`, `sort_keys`, separators `(",", ":")`, no trailing newline) to **`cae78e43a97efbd4be9a61d96d44b4e7e02f1c5ce617c8e09c4fa00e3203f53c`**, which matches. All 13 members match in both SHA-256 and byte count, including the return (`0ee92511…ab7`, 35,964 bytes) and `PATH-CHECK-F2.json` (0 findings).
- **Stage 2 seal.** Recomputed `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`, which matches.
- **Stage 3 seal.** Recomputed `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d`, which matches the embedded value. Its F2 entry (`0ee92511…`, 35,964 bytes) agrees with the capsule.
- **Stage 4 dispatch manifest seal.** Recomputed `a361cd175e7c3968cdf2a8d14f92e9b2b5883b018bd72e837f54f26ce38da383`, which matches. Its member digests equal the capsule's for the shared files.
- **Digests the return lists.**
  - `F2-EVIDENCE.json` = `edf4fa62c18619553fcdfd0f4c84e9b22549ac77699c08ec15cd02b39adaaeaa`. I reproduced this by a copy-out-first replay (below). All four PART files came out byte-identical.
  - The return's `ordinary_tree_checked.py` and `CLAIM-IDENTITY.run-local.json` digests concern files outside my capsule. I did not re-hash them, and I do not rely on them.

## Independent re-derivation

**Instrument.** My own instrument is `scratchpad/c2-crit-F2-U/own/cu_lib.py`. It is standard library only and written from SEMANTIC-CONTRACT §1 alone, with nothing imported from F2 or `sources/`. It works as follows:
- It enumerates independent sets by bitmask.
- It computes `x` through rank `α`.
- It computes `F_p` from `Δ_p(T − v)` on the original carrier.
- It computes `S` from `H_v = T − {v, s_v}` and `R_v = T − N[s_v]` counts, a side independent of the network.
- The literal `w_F` is the active test `(B ∖ {v}) ∩ W_v ≠ ∅`, and (REL) is literal (D) ∪ (S).
- It asserts `supply − capacity = S` and eligibility on every row.
- It computes the max flow with Dinic.
- The tree test uses BFS connectivity plus an `n − 1` edge count.

**Fixed points reproduced** (`own/FIXED-POINTS.json`):

| Row | n | α | x | p | \|F\| | S | supply / capacity / flow | arcs |
|---|---:|---:|---:|---:|---:|---:|---|---:|
| `K_{1,12}` | 13 | 12 | 6 | 8 | 12 | −1980 | 1980 / 3960 / 1980 | 1980 |
| path-star (2,3,4) | 15 | 11 | 5 | 7 | 10 | −1218 | 1483 / 2701 / 1483 | 2025 |
| path-star (2,2,4,3) | 18 | 13 | 6 | 8 | 12 | −5434 | 8033 / 13467 / 8033 | 11691 |

**F2's two rows, reproduced digit for digit** (all leaves favorable on every row):

| Row | n | α | x | p | \|F\| | S | supply / capacity / flow | gap | unreachable targets |
|---|---:|---:|---:|---:|---:|---:|---|---:|---|
| `G_3` | 14 | 9 | 4 | 6 | 6 | −274 | 253 / 527 / 253 | 2 | exactly one, `{0,3,4,6,9,12}`, w = 2 |
| `T(4,2)` | 14 | 9 | 4 | 6 | 5 | −252 | 202 / 454 / 202 | 2 | exactly one, `{0,1,2,3,12,13}`, w = 2 |

**Four further rows I computed** (each saturating, each with exactly one unreachable target of weight 2, gap = 2):

| Row | n | S | supply / capacity / flow |
|---|---:|---:|---|
| `G_4`, p = 7 | 17 | −1193 | 1542 / 2735 / 1542 |
| `G_5`, p = 8 | 20 | −5321 | 8875 / 14196 / 8875 |
| `T(5,2)`, p = 7 | 17 | −1094 | 1173 / 2267 / 1173 |
| `T(6,2)`, p = 8 | 20 | −4805 | 6350 / 11155 / 6350 |

All of these are `bounded_computation`.

**Replay.** I copied F2's generators and outputs into `scratchpad/c2-crit-F2-U/replay/` and ran `f2_main.py`, `f2_part2.py`, `f2_part3.py`, `f2_part4.py` and `f2_combine.py` with `PYTHONDONTWRITEBYTECODE=1`, all in the foreground. The outputs were byte-identical to the shipped ones, and the digest reproduced as `edf4fa62…aaeaa`.

**Fidelity** (duty 2, checked first).
- F2's `f2_lib.py` counts ACTIVE tags only (`(B − {v}) & W_v`, with `W_v = N(s_v) ∖ {v}`).
- The relation is exactly (D) ∪ (S): switches use `|N(u) ∩ B| = 2`, `u ∉ B`.
- `F` is fixed at rank `p` from `Δ_p(T − v)` on the original tree.
- `crossing_index` scans through `α` and treats no plateau as a descent.
- `f2_part3.py` asserts `supply − capacity = S` using an `H_v`/`R_v` recomputation that is independent of the network.

No fidelity failure was found.

A process deviation: Parts A, B and D report eligibility and selector rows without any WID assertion, and Part D reports no row data at all, only a count. SOLUTION-CONTRACT §3.3 and the shared rules require the assertion "before any other output" and "every eligible row reported with full row data". The numbers affected (x, α, favorability) do not depend on `w_F` or (REL), so nothing is struck on fidelity grounds. The Part D count is re-graded below.

**A1 / B1 (`α`), re-derived.**
- `G_k`: the matching `{01, 23, a_ib_i}` and cover `{0, 2, b_i}` have size `k + 2`. By König–Gallai, `α = 2k + 3`. Independently, the polynomial below has degree `2k + 3`.
- `T(m,k)`: the matching `{e_ic_i (i<m), c_mf, sℓ_1}` and cover `{c_1..c_m, s}` have size `m + 1`, so `α = 2m + k − 1`. The argument is uniform in `k ≥ 1` and `m ≥ 1`.

Both are confirmed `proved_informal`.

**A2 (closed forms), re-derived** by branch decomposition at the root `0`:
- `I(G_k) = (1+y)(1+3y+y²)^{k+1} + y(1+y)²(1+2y)^k`.
- `I(G_k − 3) = (1+y)(1+2y)(1+3y+y²)^k + y(1+y)(1+2y)^k`.

Both match brute force for `k = 0..7` (`own/ALGEBRA.json`).

**A3 (`x(G_k) ≤ k+1` for `k ≥ 2`), checked line by line. Correct.**
- `P = (1+y)(1+3y+y²)^{k+1}` is a product of palindromes, so it is palindromic of odd degree `2k + 3`. Hence `P_{k+1} = P_{k+2}` exactly.
- The convolution is correct: `q_k = 2^k + k·2^k + C(k,2)·2^{k−2} = 2^{k−3}(k² + 7k + 8)` and `q_{k+1} = 2^{k+1} + k·2^{k−1} = 2^{k−3}(4k + 16)`. The index ranges are valid for `k ≥ 2`, and at `k = 2` the identity holds over ℚ: `q_2 = 13`, `q_3 = 12`.
- So `Δ_{k+1}(I(G_k)) = [y^{k+2}]I − [y^{k+1}]I = 0 + (q_{k+1} − q_k) = −2^{k−3}(k² + 3k − 8) < 0`. The inequality is strict at the right rank, `k + 1` (not `k + 2`).
- It holds at the boundary `k = 2`: `k² + 3k − 8 = 2`, and `Δ_3(G_2) = −1`. At `k = 1` it fails (`k² + 3k − 8 = −4`), consistent with `x(G_1) = 3`.
- The Newton-inequality step is correct but not load-bearing for `x ≤ k+1`. Only the palindromic plateau and the sign of `q_{k+1} − q_k` are used. Strict unimodality of `P` would matter only for the reverse inequality, which F2 correctly does not claim.

**A4 (eligibility of `(G_k, k+3)` iff `k ≥ 3`).** Confirmed `proved_informal` in both directions:
- `3(k + 3) < 4k + 7` iff `k ≥ 3`, and for `k ≤ 2` the upper condition fails.
- For `k ≥ 3`, `x ≤ k + 1 = p − 2` by A3.

**B2.** `3(m + 2) < 4m + 3` iff `m ≥ 4`. Confirmed, pure algebra.

## Attacks and findings

**Finding 1: false certification literal (A3 and grades table).**
- The return says `x(G_k) = k+1` "exactly on every one of these 305 instances" (`k = 0..304`). The grades table carries `x(G_k) = k+1` as `bounded_computation (k=0..304)`.
- This is false at `k = 0` and `k = 1`: `x(G_0) = 2` (`I = 1 + 5y + 6y² + 2y³`) and `x(G_1) = 3` (`I = 1 + 8y + 21y² + 22y³ + 9y⁴ + y⁵`).
- F2's own evidence records the failure. `x_checks_G_k_k0_304` has `x_eq_k+1: false` and `x_le_k+1: false` at `k = 0, 1`. The script's printed summary and the `f2_main.py` docstring ("for every k >= 0") are also wrong.
- The correct bounded statement is `x(G_k) = k+1` for `2 ≤ k ≤ 304`. My closed-form scan confirms it for `2 ≤ k ≤ 400`, where it fails only at `k = 0, 1`.
- No eligibility claim is affected, because `k ≤ 2` is ineligible anyway. The literal is struck and replaced.

**Finding 2: F2's gap "closed form" rested on an unproved uniqueness, now proved by me (critic-derived).**
- F2 grades "gap `= Σ_{unreachable} w_F`, hence `= 2`" as `proved_informal` for the identity. But the step "`A_k` is the UNIQUE unreachable target" was checked only by brute force at order 14. The general-`k` gap was therefore `bounded_computation`, not proved.
- I supply the proof (see the lemmas at the end of this section), which lifts it to `proved_informal`, attributed to C-F2-U.

**Finding 3: A5 (favorability of the tags 3 and 4 in `G_k`) is provable in closed form. F2 missed a degree observation (critic-derived advance).**
- The correction term `y(1+y)(1+2y)^k` in `I(G_k − 3)` has degree `k + 2`, so it vanishes at ranks `k+3` and `k+4`. Favorability therefore reduces to the palindromic main term alone.
- F2's remaining-obligation item 1 is closed (Lemma F below).

**Finding 4: `T(m,2) − ℓ_1 ≅ T(m,1)` is structural, as the attack brief expected.**
- Deleting `ℓ_1` leaves the vertex set and edges of `T(m,1)`, with `ℓ_2` in the role of the single leaf on `s`. The identity map (renaming `ℓ_2 ↦ ℓ_1`) is an isomorphism.
- The grade rises from `bounded_computation` (degree sequence plus polynomial) to `proved_informal`.
- Favorability of `ℓ_1` is thus exactly `Δ_{m+2}(T(m,1)) < 0`. That remains `bounded_computation`: F2 has `m = 4..304`, and my transfer-matrix DP has `m = 4..400`. The swap automorphism gives `ℓ_2` too.

**Finding 5: `T(m,2)`'s lower eligibility bound is sharp at small `m`. No closed form is in reach by the `G_k` method.**
- My DP matches brute force for `m ≤ 6` and `k ∈ {1,2,3}`. It gives `x(T(m,2)) = m` exactly for `4 ≤ m ≤ 18`. So `x + 2 = p` exactly there, with zero slack.
- The ratio `x/m` then decreases (`x(T(400,2)) = 379`).
- The block transfer matrix `[[(1+y)², 1+y], [y, y]]` has discriminant `1 + 6y + 7y² + 2y³ + y⁴`, which is not a square. So no product closed form exists, and a proof needs real-rootedness plus a mean estimate, or diagonal asymptotics.
- F2's grade `bounded_computation` for B3 is correct.

**Finding 6: item (a), the selector. The brief's suggested implication has a gap, and the selector lemma has open unimodality content (critic-derived structural reduction, `proved_informal`, elementary).**
- For a leaf `v`, `T − v` is a tree, and `v ∉ F_p(T)` iff `Δ_p(T − v) ≥ 0`. A selector-binding eligible row `(T, p, v)` therefore forces one of two things:
  - (i) `x(T − v) ≥ p + 1 ≥ x(T) + 3`, a jump of at least 3 in the first descent under deleting one leaf; or
  - (ii) the tree `T − v` has a strict descent before `p` and `Δ_p(T − v) ≥ 0`, so it is not strictly decreasing between its first descent and a lower-region rank `p ≤ ⌊2α(T)/3⌋`. With `Δ_p > 0`, `T − v` would be a **non-unimodal tree**.
- Hence the attack brief's proposal ("prove `x(T − v) ≤ x(T) + 1`, then `x + 2 ≤ p` gives favorability") is incomplete. A first descent of `T − v` at or before `p − 1` does not give `Δ_p(T − v) < 0` without a no-re-ascent or no-plateau statement for `T − v` at rank `p`. That is strict unimodality of trees in the lower region, the open core of #993.
- Conversely, "`F_p(T)` = all leaves on every eligible row" implies, for every tree `T'` and every leaf attachment `T = T' + v`, strict decrease of `T'` at every rank in `[x(T) + 2, ⌊2α(T)/3⌋]`. So the selector lemma is not a routine simplification. It carries unimodality content for arbitrary trees on a lower-region window.
- This does not refute or prove the selector lemma. It changes what a proof of it must contain, and it says a selector-binding row of type (ii) with `Δ_p > 0` would be far more than a transport finding.
- **Exploratory evidence** (`bounded_computation`, never a proof; `own/SELECTOR-EXPLORE-N16.json`): all rooted trees of orders 2–16 (376,463 level sequences, counts matching A000081). Every leaf deletion shifts the first descent by `x(T − v) − x(T) ∈ {−1, 0}`, with 2,018,001 zeros and 759,818 minus-ones and never a positive shift. So case (i) did not come close. On 37,048 eligible `(T, p)` rows (counted with multiplicity over rooted labellings), no leaf is non-favorable, and every `T − v` is strictly decreasing from `x(T − v)` through `p`.

**Finding 7: Part D certification.**
- The "1,143 eligible `(T,p)` rows" counts isomorphic duplicates. For example, `path_len = 0` at two attachment points is one tree, and a broom plus a pendant path at its tip equals a longer broom. My replay analysis (`replay/PARTD-DISTINCT.json`, AHU canonical forms) gives **588 distinct `(tree, p)` rows on 539 non-isomorphic trees**.
- "Trees up to order ~44" is false. The code skips `n > 40`, and the largest order among eligible rows is **37** (smallest 11).
- The zero-counterexample conclusion stands at that reduced scope.

**Finding 8: claim-status error.**
- The return lists (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` as "OPEN at Stage 1 (run-local)", with an "existing `proved_informal` statement-level grade".
- `control/C2-STAGE1-GATE.md` (current-state check) and `control/C2-ALLOCATION.md` record it as **VERIFIED `formally_verified`** (C1-LA1, `activeWeightAggregateIdentity`) entering Cycle 2.
- The return misstates a registered key's status. It is harmless to F2's mathematics, which only asserts WID on two rows, but it must be corrected in the record.

**Finding 9: process.**
- Disclosure 5 records a forbidden full process listing (`ps aux | grep …`), per the attack brief. It is recorded here.
- The return's own "Background jobs" section then says "no `pgrep`/full process listing was used". That contradicts Disclosure 5, and the literal is struck.
- The `os.walk` of `sources/` found 12 files under `sources/c1-stage7-sources/` that are not in `control/SOURCE-DIGESTS.json`. Per the controller's note, these are Stage 7 frozen files with their own digest record. **This is a non-finding.**
- Disclosures 1–2 (non-recursive `ls` above the grant) are recorded as F2 filed them.

**Lemma F (C-F2-U; `proved_informal`).** For every `k ≥ 1`, `Δ_{k+3}(G_k − 3) < 0` and `Δ_{k+3}(G_k − 4) < 0`.

*Proof.*
1. Write `M = (1+3y+y²)^k`. Then `I(G_k − 3) = R + yS` with `R = (1+3y+2y²)·M` and `S = (1+y)(1+2y)^k`.
2. `deg S = k + 1`, so `[y^j](yS) = 0` for `j ≥ k + 3`. Hence `Δ_{k+3}(G_k − 3) = R_{k+4} − R_{k+3}`.
3. `R_j = M_j + 3M_{j−1} + 2M_{j−2}`, so `R_{k+3} − R_{k+4} = (M_{k+3} − M_{k+4}) + 3(M_{k+2} − M_{k+3}) + 2(M_{k+1} − M_{k+2})`.
4. `M` has positive coefficients and real roots (`−1/φ`, `−1/ψ` with `φψ = 1`, `φ + ψ = 3`, each of multiplicity `k`). By Newton's inequalities its coefficient ratios `r_j = M_{j+1}/M_j` strictly decrease on `0 ≤ j ≤ 2k − 1`.
5. `M` is palindromic of degree `2k`, which gives `r_j·r_{2k−1−j} = 1`. So `r_j < 1` for `j ≥ k`, and `M_k > M_{k+1} > … > M_{2k} > 0 = M_{2k+1}`.
6. Every bracket in step 3 is therefore `≥ 0`. The last one is `> 0`: for `k ≥ 2` by strict decrease, and for `k = 1` because `M_2 = 1 > 0 = M_3`. Hence `R_{k+3} > R_{k+4}`.
7. The automorphism of `G_k` swapping `3` and `4` gives the same for leaf `4`. ∎

Numeric check (`own/ALGEBRA.json`): every ingredient holds for `k = 1..400`, and the values agree with F2's `Δ_p(G_k − 3)` column (for example, −2 at `k = 1` and −13 at `k = 2`).

**Lemma U (C-F2-U; `proved_informal`). Arc-reachability of targets.**
- A target `A ∈ I_p` has an in-arc of (D) ∪ (S) iff either `A` is not maximal independent, or some `u ∈ A` has two neighbours `y, z ∉ A` whose only neighbour in `A` is `u`.
- In a tree, `y` and `z` are automatically non-adjacent. The preimage is `B = (A ∖ {u}) ∪ {y, z}`, which has `|N(u) ∩ B| = 2`.
- This re-derives, and does not cite, the P10 predicate.

**Lemma U applied to `G_k` (`k ≥ 1`, `p = k + 3`).** Let `A` be a maximal independent `p`-set with no such `u`.
- *Case `0 ∈ A`.* Maximality forces `3, 4 ∈ A` and exactly one of `b_i`, `c_i` for each `i`, so `|A| = k + 3` automatically. If some `c_j ∈ A`, then `1` and `a_j` are both private to `0`, which gives an in-arc. So `A = A_k = {0, 3, 4, b_1, …, b_k}`.
- *Case `0 ∉ A`.* Then `1 ∈ A`. Either `2 ∈ A`, in which case `3` and `4` are private to `2`; or `{3, 4} ⊆ A`, and the size count then forces `b_i ∈ A` for all `i`, where `a_i` and `c_i` are private to `b_i`. Either way there is an in-arc.

So `A_k` is the unique unreachable target at every `k ≥ 1`.
- `A_k` is independent of size `p`, and no vertex of it has a private pair: `0` has only `1` private, `b_i` has only `c_i`, and `3` and `4` share `2`.
- Its weight is `w_F(A_k) = |{3, 4} ∩ F|`: `W_3 = {0, 4}` and `W_4 = {0, 3}` both meet `A_k`, and `0` and `b_i` are not leaves.

**Lemma U applied to `T(m,2)` (`m ≥ 2`, `p = m + 2`).** Let `A` be a maximal independent `p`-set with no private pair.
- `s ∈ A` would make `ℓ_1` and `ℓ_2` private to `s`, so `s ∉ A`, and hence `ℓ_1, ℓ_2 ∈ A`.
- Maximality puts exactly one of `c_i`, `e_i` in `A` for each `i < m`. So exactly one more vertex comes from `{d_i, c_m, f}`.
- `d_i` is impossible: `f` would be addable.
- `f` gives `c_{m−1} ∈ A`, with the private pair `{e_{m−1}, d_{m−1}}`.
- `c_m` with some `e_i ∈ A` gives `c_{i+1}` the private pair `{d_i, e_{i+1}}`, or `{d_{m−1}, f}` if `i + 1 = m`.

So `A = {c_1, …, c_m, ℓ_1, ℓ_2}` is the unique unreachable target, with `w_F = |{ℓ_1, ℓ_2} ∩ F|`.

**Corollary G (C-F2-U; `proved_informal`; composed from F2's A1–A4 and Lemmas F and U).** For every `k ≥ 3`:
- `(G_k, k + 3)` is eligible;
- `{3, 4} ⊆ F_{k+3}(G_k)`;
- `A_k` is the unique target with no in-arc;
- `Σ_{I_p} w_F − Σ_{N(I_{p+1})} w_F = 2` exactly.

So on infinitely many eligible rows, (HALL-COND) at `X = I_{p+1}` reads `supply ≤ capacity − 2`, strictly stronger as a statement than `S ≤ 0`. This is the object of F2's item (b) for `G_k`, now complete at statement level.

It says nothing about whether either inequality fails. On the computed rows `S` is far below −2 (`G_3..G_5`: −274, −1193, −5321), and I did not prove `S(G_k, k+3) ≤ −2` in general.

For `T(m,2)` the analogous statement holds with gap `= |{ℓ_1, ℓ_2} ∩ F|`. It is conditional on the still-bounded `x(T(m,2)) ≤ m` and `Δ_{m+2}(T(m,1)) < 0`.

## Mechanism-equivalence and fence check

- F2 proposes no transport mechanism. None of the ten refuted keys of SOLUTION-CONTRACT §3.2 is revived, and I found no deletion-only or own-support rule in its arguments.
- No closed region is re-proved. `T_m`, the high tail, the order bands and the CB family results are untouched, as F2 states.
- No census value enters a proof: A3/A4 and my lemmas are algebraic or combinatorial. The one place where a bounded check was graded as a proof was F2's general-`k` gap (Finding 2), which is now repaired by proof.
- There is no RTree wording, (LIFT) is not used, and `D, C ≥ 0` is not used as a budget.
- Corollary G is a statement about the gap between two scalar inequalities on a family. It is not (HALL), a (CUT), or a statement about the primary aggregate. Nothing crosses the mechanism/aggregate fence.
- My Finding 6 ties the selector to tree unimodality. It is a reduction, not a status transfer: no key moves because of it.

## Certification audit

| Literal (return) | Status |
|---|---|
| `F2-EVIDENCE.json` sha `edf4fa62…` | **Backed**: replay byte-identical |
| `G_3` / `T(4,2)` rows "digit for digit" | **Backed** by my independent instrument |
| "`x(G_k) = k+1` exactly on every one of these 305 instances" (A3; grades table `k=0..304`) | **Struck.** False at `k = 0, 1` by F2's own JSON. Replace with `2 ≤ k ≤ 304` (`bounded_computation`) |
| `x(G_k) ≤ k+1` for `k ≥ 2`; eligibility iff `k ≥ 3` | **Backed** (`proved_informal`, re-derived) |
| `f2_main.py` docstring "`x(G_k) ≤ k+1` for every `k ≥ 0`" | **Struck** (false at `k = 0, 1`). The return text itself says `k ≥ 2` |
| Gap "`proved_informal` for the identity itself (… uniqueness … re-verified by brute force)" | **Over-graded as shipped.** Uniqueness was bounded (order 14). Now `proved_informal` by C-F2-U's Lemma U |
| "1,143 eligible `(T,p)` rows … trees up to order ~44" | **Narrowed**: 588 distinct rows on 539 trees; **max order 37**. "~44" is struck |
| `T(m,2) − ℓ_1 ≅ T(m,1)` `bounded_computation` | **Upgradable** to `proved_informal` (structural, Finding 4) |
| (WID) "OPEN at Stage 1 … `proved_informal` statement-level grade" | **Struck**: VERIFIED `formally_verified` (C1-LA1) per the Stage 1 gate |
| "no `pgrep`/full process listing was used" (Background jobs) | **Struck**: contradicts Disclosure 5 (`ps aux`) |
| "longest single call … under 20 seconds" | Consistent with the replay (19.3 s) |
| SR-REACH ranges (`k ≤ 300`, `m ≤ 150`), Cycle 1 counts (3,806 rows to order 16), C-F2-U key rejection | **Not checkable** within my read boundary; carried as the return's report only. Note the allocation records "on every computed eligible row `F_p(T)` is the whole leaf set" over 195,683 rows at orders 11–19. F2's statement that the check was not run at orders 17–18 is in tension with that and needs reconciliation by the adjudicator |
| Alias check "no collision" | Not re-run (the registry is not in my capsule). The adjudicator must alias-check any key built on Corollary G |

**Claim identity.**
- Keys touched:
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: OPEN, unchanged.
  - (WID): VERIFIED; the return's status is wrong.
  - Primary aggregate: OPEN, context only.
  - P10 and P12: unregistered candidate names, correctly called candidates.
- No nonexistent award label ("C1-LA3" etc.) is cited.
- F2 correctly proposes no key.
- With Lemmas F and U, the `G_k` family statement now has proved eligibility **and** favorability, which is the registrability condition F2 reports from SR-REACH. A candidate in predicate form, for the synthesis, after an isolated second read and a lexical and mathematical alias check against the run-local registry: `E993-R30-GK-TREE-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO` (STATED; not registered by me).

## Verdict

verdict: retained_narrowed
headline_resolved: no

F2's principal new result stands at `proved_informal`: `x(G_k) ≤ k+1` for `k ≥ 2`, hence `(G_k, k+3)` is eligible iff `k ≥ 3`, in both directions. The same holds for its `α` formulas and closed forms.

The following are narrowed or struck:
- The `x(G_k) = k+1` "all 305 instances" literal (false at `k = 0, 1`).
- The general-`k` gap grade, which was bounded as shipped.
- Part D's scope: 588 distinct rows, max order 37.
- The (WID) status misstatement.
- The self-contradictory process literal.

Critic-derived advances, attributed to C-F2-U, `proved_informal`, each needing an isolated second read before any registration:
- Lemma F: favorability of `3` and `4` in `G_k` for all `k ≥ 1`, which closes F2's obligation 1.
- Lemma U: unique unreachable targets in `G_k` and `T(m,2)`.
- Corollary G: the `G_k` gap is exactly 2 for every `k ≥ 3`, which completes item (b) for `G_k`.
- The structural isomorphism `T(m,2) − ℓ_1 ≅ T(m,1)`.
- The selector reduction of Finding 6.

In my judgment Corollary G's mathematics is complete at `proved_informal`. Nothing here moves (HALL) or the primary aggregate.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

Stated exactly:
1. **`T(m,2)`, lower eligibility.** Prove `Δ_j(T(m,2)) < 0` for some `j ≤ m`, for every `m ≥ 4`. It is sharp: `x = m` exactly for `4 ≤ m ≤ 18`.
2. **`T(m,2)`, favorability.** Prove `Δ_{m+2}(T(m,1)) < 0` for every `m ≥ 4`.

   Both are `bounded_computation` to `m = 400` (C-F2-U). They need real-rootedness or interlacing for the block recurrence `P_{j+1} = (1+3y+y²)P_j − y²(1+y)P_{j−1}` plus a mean or mode bound, or diagonal asymptotics with a finite check. Once both are proved, Lemma U gives the `T(m,2)` gap `= 2` for every `m ≥ 4`.
3. **Second read and alias check** for Lemma F, Lemma U and Corollary G. Then the synthesis may register a predicate-form `G_k` family key.
4. **Item (a) stays open**, reduced as follows. A proof of "`F_p(T) = leafSet(T)` on every eligible row" must show `Δ_p(T − v) < 0` at eligible `p`. By Finding 6 this contains strict decrease of arbitrary trees on a lower-region rank window, beyond any first-descent monotonicity. A refutation must exhibit either a first-descent jump of at least 3 under leaf deletion (never seen: the shifts are in `{−1, 0}` to order 16), or a tree not strictly decreasing after its first descent at a lower-region rank. With `Δ_p > 0`, that would be a non-unimodal tree and must be treated as such, not merely as a transport row.
5. **Optional.** Prove `x(G_k) ≥ k+1` (the reverse inequality, `bounded_computation` for `2 ≤ k ≤ 400`), and `S(G_k, k+3) ≤ −2`, i.e. (HALL-COND) at `X = I_{p+1}` on the whole family.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-crit-F2-U/`. Nothing was written elsewhere except this critique. No `__pycache__` was written (`sys.dont_write_bytecode` / `PYTHONDONTWRITEBYTECODE=1` throughout). No background job was started; every run was in the foreground, so there was nothing to kill. There was no network access and no install; standard library only (`sys`, `json`, `collections`, `itertools`).

**My own instrument and outputs (`own/`):**

| File | SHA-256 | Contents |
|---|---|---|
| `own/cu_lib.py` | `ab1d44f81f0bb6d4346ef40cb4074e9619843d0ed15ee2a84fccbd0ae605574e` | my own instrument |
| `own/fixed_points.py` | `9fdf820d600094a4acd2b691f8be2ac240695ffdf0e40e383a437b02e20720b5` | fixed-point and family runner |
| `own/FIXED-POINTS.json` | `3521c3fc90fbf84ca8019b998d003af12d8812083efa808f377eeb8c6181785b` | 9 rows |
| `own/algebra.py` | `9860943935ba7f10a512d0b43df16bd6e330eee1114372d42188713a86e05854` | closed forms, Lemma F ingredients, `T(m,k)` transfer DP |
| `own/ALGEBRA.json` | `08ce031076fc0870fc4073cd4d4a5328e7e12db36c75530af3f976b6e6998967` | output of `algebra.py` |
| `own/selector_explore.py` | `11505cc6acf891e852d3bcecdce4b5aa923382fe17a8a4dcbaedf1a59d2226ba` | rooted-tree selector exploration |
| `own/SELECTOR-EXPLORE-N14.json` | `64f2c6938cbcc8c8b3370f0a6ec0f828ee512413ec6838027196356b57956b0a` | orders ≤ 14 |
| `own/SELECTOR-EXPLORE-N16.json` | `c230705dc18c6ed44b1de51cb1d1ad9f1c256f5d43c8b7e2f552231432f9ccc1` | orders ≤ 16 |

**Replay of F2 (`replay/`):**

| File | SHA-256 | Contents |
|---|---|---|
| `replay/f2_*.py` | identical to `scratchpad/c2-F2/` | copy-out |
| `replay/F2-PART{A,B,C,D}.json`, `replay/F2-EVIDENCE.json` | EVIDENCE `edf4fa62…aaeaa` | regenerated, byte-identical to `replay/orig/` |
| `replay/orig/` | — | the shipped copies |
| `replay/partd_distinct.py` | `0e8cd842f845b54fb1142b5219d7e995a059fce3c0be957c457c5381d6508925` | Part D distinct-class analysis |
| `replay/PARTD-DISTINCT.json` | `70c2dc85798dcee13260022201cb5ba54e874f226b18e5726caae7de3824cf97` | output of `partd_distinct.py` |
