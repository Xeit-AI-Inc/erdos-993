# Critique

Critic `C-U2-F` (orientation F, falsify), Cycle 3, Stage 4, r30. Assigned return: seat `U2`, route `C3-U-02
PRODUCT-FORM-FLOW-CERTIFICATE-ON-CB-ROWS` (orientation U). Date 2026-09-26.

**Model disclosure (two-part):** the disclosure line is under `## Verdict`.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I did not follow the protocol's pointers into memory, modules,
skills, logs, decisions or conversations. The harness injected the project `CLAUDE.md` and the user auto-memory index into
context on its own; I did not open them as reads and I use nothing from them as evidence. Before reading the dispatch
`control/dispatch/c3-stage4/DISPATCH-C-U2-F.md`, I checked its SHA-256: it is
`5e27fa37098b7043537e43dc812372fb8c593220d5004b9c72af2473ba7dadb1`, which matches the wrapper.

**Read-boundary disclosure.**
1. The dispatch grants replay of `scratchpad/c3-U2/` only. My attack brief also directs "replay parity `c3-U2/` vs
   `c3-U2-replay/`", so I made one non-recursive `ls` of `scratchpad/c3-U2-replay/` and copied its five files into my scratch.
   I read nothing else under `scratchpad/`.
2. I ran `find` twice inside `sources/`, which is within my grant (stray `__pycache__`/`.pyc`, and files newer than the
   Stage 4 dispatch manifest). Both came back empty. I also ran `find` for `__pycache__` in my own scratch directory; it was
   empty too.
3. I read one source-of-record file, `sources/lower-region/instruments/cb-switch-cut/RESULTS.json`, after checking its digest.
4. I read no other return, critique, adjudication, experiment root or external source, used no network and installed nothing.

I launched no background job. Every command ran in the foreground, and nothing was running at the final write.

## Identity and seal audit

All seals and digests below were recomputed as SHA-256 over the compact, key-sorted JSON of each manifest without
`seal_sha256`, with no trailing newline.

| Object | Recomputed | Status |
|---|---|---|
| Capsule `control/c3-critic-capsules/U2-PACKET-MANIFEST.json` (14 members) | `b6a8bca6a22ba207a81f4c9ea64e1f58605171aec674bdd4d5e42f5b0058fbd4` | matches; **I report this capsule seal** |
| Stage 4 dispatch manifest | `b57e5de137627d8526c12e5f54a2011683c1ba010f98450a8adace5f4e7ca3c7` | matches its own field |
| Stage 3 packet manifest | `64c6c84aabe2392394f680abb3c8862a349f06a4f8043a9960b706f35b294797` | matches its own field |
| Stage 2 packet manifest (1051 files) | `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416` | matches the protocol's value and the return's citation |
| All 14 capsule members (bytes + SHA-256) | — | all match |
| `RETURN.md` | `7970cdbf…8f72b` | matches the capsule and the Stage 3 manifest |
| U2's Stage 3 dispatch digest cited by the return (`a24d3948…2611`) | Stage 3 manifest lists `a24d39489139964f587e9ee49a0769b291ba6181ab35e86521be6b39b40b2611` | consistent (I did not read the file) |
| `sources/lower-region/instruments/cb-switch-cut/RESULTS.json` | `873cf9229923153d7626c6d721ab40b8ace8488b51343c66a00b6cfb0449d5d5` | matches `control/SOURCE-DIGESTS.json` and the return |
| U2 artifacts: `tree_lib.py` `19247e63…`, `network.py` `6fa12483…`, `cb_gf.py` `563e43cc…`, `run_all.py` `5821cc5e…`, `run_all_RESULT.json` `ac432c7c…` | identical in `c3-U2/` and `c3-U2-replay/` | inventory confirmed; replay parity holds |
| Copy-out replay (`python3 -B run_all.py`, 13 s) | canonical digest `20a48614b9555fb44183cb7a1bde8a0f709ee5444d9c3b92fe1a6ffcfbf387c9`; regenerated `run_all_RESULT.json` = `ac432c7c…` | reproduced byte for byte |

**Process.** I found no stray bytecode under `sources/` and nothing under `sources/` newer than the Stage 4 dispatch manifest.

**Record discrepancy for the controller (process, not mathematics).** `control/C3-STAGE3-READ-BOUNDARY-DISCLOSURES.json`
records U2 as "none reported". U2's own RETURN (§ Read-boundary disclosure) actually reports two things:
- one non-recursive `ls -la <run root>/scratchpad/`, which listed sibling directory names only;
- a harness auto-backgrounded job (`bnr4rdn4b`), stopped by `TaskStop` before it produced any output.

The return also cites `find … -iname "__pycache__"` without naming its root. The disclosures record should be corrected to
match the return, which is the verbatim record.

## Independent re-derivation

**Instrument.** My own standard-library code in `scratchpad/c3-crit-U2-F/own/inst.py` shares no code with U2. It uses:
- my own `CBstar` builder, with vertex labels permuted by a seed;
- an `IsTree` check (connected and n−1 edges);
- a generic forest independence-polynomial DP;
- `x` scanned through rank `α` inclusive;
- `F_p` derived per rank from `Δ_p(T − v)` on the original tree, strict;
- the aggregate computed as `Σ_F [q_v(p) − q_v(p−1)]` with `q_v(j) = i_j(H_v) − i_j(R_v)`;
- bitmask enumeration of independent layers;
- a literal `w_F` (tag `v ∈ F ∩ B` counted only if `(B∖{v}) ∩ W_v ≠ ∅`);
- literal (D) ∪ (S) arcs;
- my own iterative Dinic solver;
- a **flow verifier** that re-tests every positive arc against (D)/(S) with a separate pairwise predicate and checks integrality, supply saturation and capacities;
- a **Hall-violator extractor** (the min-cut source side), with `N(X)` and both sums recomputed from scratch.

`supply − capacity = S` is asserted on every instance from independent sides: layer enumeration or tag-sums on one side, the
`H_v/R_v` aggregate on the other.

**Fixed points reproduced before trusting the instrument** (`fixed_points.py`):

| Tree / p | n / α / x | |F| | supply / capacity / S | deletion-only flow (verified) | arcs |
|---|---|---|---|---|---|
| `K_{1,12}` / 8 | 13 / 12 / 6 | 12 | 1980 / 3960 / −1980 | 1980 | — |
| path-star `(2,3,4)` / 7 | 15 / 11 / 5 | 10 | 1483 / 2701 / −1218 | 1483 | 2025 |
| path-star `(2,2,4,3)` / 8 | 18 / 13 / 6 | 12 | 8033 / 13467 / −5434 | 8033 | 11691 |

- `CB(8,92)/492` gives n 1567, α 829, x 490 and |F| 737. My `S` equals the frozen `RESULTS.json` `aggregate` integer exactly.
- My free-tree generator reproduces A000055 through order 15: 1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159, 7741.

**Fidelity of U2's instrument (read line by line, then replayed).**
- `active_weight` counts active tags literally, not `|F ∩ B|`.
- `relation_targets` and the flow builders implement (D) ∪ (S) exactly: `u ∉ B`, `|N(u) ∩ B| = 2`, `A = (B ∖ N(u)) ∪ {u}`.
- `favorable_leaves` derives `F_p` strictly from `Δ_p(T − v)` on the original carrier.
- `crossing_index_through_alpha` scans through `α`.
- `aggregate_S_via_HR` is the contract's summand.
- The `IsTree` test checks acyclicity and connectivity separately.

**Fidelity passes on every row U2 reports, with one exception:** `cbstar_corroboration()` asserts no `supply − capacity = S`,
does not report `F`, and reports no full row data. See Attacks, item 3.

**Re-derived values** (`cb_rows.py`, `big_rows.py`; every row: `IsTree`, `F_p` derived, WID from two sides true):

| Row | n / α / x / window | |F| | supply | capacity | S | My flow result |
|---|---|---|---|---|---|---|
| `CB(1,7)/10` | 24/15/8/[10,10] | 8 (all) | 29,190 | 58,002 | −28,812 | (D) flow 29,190, verified saturating, 0 switch units |
| `CB(2,5)/10` | 28/16/8/[10,10] | 11 (all) | 259,980 | 396,460 | −136,480 | (D) flow 259,980, verified saturating |
| `CB(3,5)/13` | 38/21/11/[13,14] | 16 (all, every leaf tested) | 38,064,305 | 54,292,890 | −16,228,585 | — |
| `CB(3,5)/14` | same | 16 | 19,688,700 | 38,064,305 | −18,375,605 | — |
| `CB(4,4)/14` | 39/21/12/[14,14] | 17 | 33,933,216 | 59,268,576 | −25,335,360 | — |
| `CB(8,86)/460` | 1465/775/458/[460,516] | 689 | = U2 | = U2 | = U2 | — |
| `CB(8,89)/476` | 1516/802/474/[476,534] | 713 | = U2 | = U2 | = U2 | — |
| `CB(8,92)/492` | 1567/829/490/[492,552] | 737 | = U2 | = U2 | = U2 = frozen `aggregate` | — |

How the medium and `CB(8,·)` rows were computed:
- For `CB(3,5)` and `CB(4,4)`, I computed supply and capacity tag by tag as
  `Σ_{v∈F} [i_{k−1}(T − N[v]) − i_{k−1}(T − N[v] − W_v)]`, with the generic DP and no generating function. `S` comes
  separately from `H_v/R_v`. The values agree with the controller's forest-polynomial figures in the attack brief.
- For the `CB(8,·)` rows I used orbit representatives. `v` plus three private leaves in distinct choke/support positions give
  identical polynomials and identical tag terms. `Δ_x`, `Δ_{x−1}`, supply, capacity and `S` are string-identical to U2's
  `run_all_RESULT.json` on all three rows.

**Candidate 1, the generating function `W(x)`: independently correct.**

The derivation, by the root/arm macro-state:
- In `CB(d,m)`, `W_v = {r}` for the arm tag `v`, and `W_{c_ij} = {u_i}` for a private tag.
- So `w(B) = [v,r ∈ B] + Σ_i [u_i ∈ B]·#{j : c_ij ∈ B}`.
- If `r ∈ B`, then `s` and every choke are excluded. `v` is free and active, and each support/leaf pair is in state
  none / `b` / `c` with `c` inactive. This gives `x(1+yx)(1+2x)^{dm}`.
- If `r ∉ B`, the arm contributes `(1+2x)`, since `v` is inactive. Each choke is either included, giving `x(1+yx)^d`, or
  excluded, giving `(1+2x)^d`.
- Differentiating in `y` at `y = 1` gives U2's `W(x)`.

I re-implemented the formula from the RETURN's text, not from `cb_gf.py`. It matches literal enumeration with
`F` = all leaves at every rank on 14 shapes (`gf_check.py`), including 8 shapes U2 did not test: `(1,3)`, `(1,5)`, `(3,1)`,
`(4,1)`, `(5,1)`, `(3,3)`, `(2,4)`, `(4,2)`.

**Candidate 2, `CB(2,2)/4`: numbers reproduced.**
- n 13, α 7, x 4, window [6,4] (empty), |F| 5, `S = +32` from two sides.
- `X_sec` has 32 members, each of weight 1, so `Σ = 32`.
- Deletion-only sector max-flow is 24. My violator is **`X_sec` itself**: `Σ_X = 32`, `Σ_{N_D(X)} = 24`, deficit 8. The
  deletion shortfall is therefore a whole-sector inequality failure, not a subtle subfamily.
- Under (D) ∪ (S), `Σ_{N(X_sec)} = 40`, and the verified flow saturates 32, with 13 switch units in my solver's flow (U2's
  solver used 8 switch arcs; that count depends on the solver and carries no weight).
- I hand-checked U2's example arc `{0,2,5,10,12} → {2,3,10,12}`: `|N(u_0) ∩ B| = |{r, b_00}| = 2`, `w(B) = 1`, `w(A) = 1`.

## Attacks and findings

1. **Obligation (a) is not achieved, and the obligation's required lemma is not on the face.**
   - The return correctly says no certificate exists on the three `CB(8,·)` networks.
   - The allocation also required "a rational saturating flow implies WeightedHall for every `X` — prove that lemma on the face".
     The return contains no such lemma.
   - I supply it below (item 7). U2's totals-only generating function carries no Hall content: supply − capacity is `S` by
     (WID), which is already fixed by the frozen record at `CB(8,92)`.

2. **"Smallest" and the unshipped sweep.**
   - The return says it "swept every small `CB(d,m)` with `dm ≤ 16` over every feasible `p` to find the smallest genuinely
     deletion-deficient-sector instance", and names `CB(2,2)/4`. No generator for this sweep is in the inventoried code:
     `run_all.py` has no sweep. The claim is unbacked.
   - It is also contradicted. My sweep of every `CB(d,m)` with `n ≤ 23` at every rank (`sector_sweep.py`) finds
     sector-deletion-deficient rows at `CB(1,1)/2` (n 6), `CB(2,1)/2` (n 8), `CB(3,1)/3` (n 10), `CB(1,3)/3`, `CB(4,1)/4` (n 12),
     `CB(5,1)/4`, `CB(1,4)/4`, `CB(6,1)/5`, `CB(3,2)/5`, `CB(2,3)/5` and `CB(4,2)/6`.
   - The smallest row where the sector is deletion-deficient but saturates under (D) ∪ (S) is **`CB(4,1)/4` (n 12, `dm = 4`)**,
     not `CB(2,2)/4` (n 13). There the sector is 24 < 32 under (D) and 32 = 32 under (D) ∪ (S).
   - `"smallest"` is struck.

3. **The `CBstar(2,2,2)` "corroboration" is struck as a corroboration.** Four separate problems:
   - (i) `cbstar_corroboration()` compares `Σ_{X_sec} w` with the weight of the **whole-sector** deletion shadow, which is the
     single inequality at `X = X_sec`. The return calls this "direct Hall-condition computation" and `deletion_only_Hall_holds`.
     A whole-sector inequality is not (HALL-COND); the common brief says so explicitly.
   - (ii) The return misquotes the key's scope. It says "`t ≥ 2`: the sector is never deletion-deficient at any rank". The
     registered `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` says so only at **eligible** ranks, and the return treats all of
     `p = 5, 6, 7` as non-eligible demonstration rows.
   - (iii) **`p = 7` is eligible.** `CBstar(2,2,2)` has n 17, α 11, x 5, so the window is `[7, 7]`. The return never reports
     `n, α, x, |F|, supply, capacity, S` for this eligible row, which the shared rules require.
   - (iv) No `supply − capacity = S` assertion exists on any `CBstar` row.

   My re-derivation of `CBstar(2,2,2)`:

   | p | status | |F| | supply | capacity | S | sector flows |
   |---|---|---|---|---|---|---|
   | 5 | non-eligible | 9 | 4275 | 2816 | +1459 | (D) 435/435, (D)∪(S) 435 |
   | 6 | non-eligible | 9 | 3888 | 4275 | −387 | (D) 504/504 |
   | 7 | eligible | 9 | 2194 | 3888 | −1694 | (D) 298/298 |

   At `p = 7` the full network's deletion-only flow is 2194, verified saturating. So U2's conclusion (no sector deletion
   deficit) happens to be true in the stronger all-subfamily sense, **by my flows, not by U2's test**. Grade:
   `bounded_computation`. At `p = 7` it touches the key's scope, but it is one row of an already-proved key: supporting,
   never a contribution.

4. **"First" literals are unbacked or false.** Three are struck:
   - "the first time a real max-flow solver … has been run to completion on the whole network of either of these two rows in
     this run". U2 cannot know the Cycle 1–2 record contains no such solve. Both rows are already on record as
     deletion-saturating (the allocation's Standing state), so repeating them is not evidence.
   - "the first small, fully brute-forced, exactly checkable instance … where … switch arcs are strictly necessary to
     saturate a natural source subfamily". Superseded by item 2 (`CB(4,1)/4`, smaller) and by item 5.
   - Candidate 2's implied novelty. Sector-level switch necessity was already the recorded situation at `CB(8,86)/460`
     (`computer_assisted`).

5. **Obligation (c): switch arcs are load-bearing on a WHOLE tree, and U2's own family already had one.** Critic-derived; see
   Remaining obligation. `CB(4,1)/4` is a **full-network** switch-load-bearing saturation:
   - supply 60 = capacity 60, `S = 0`;
   - deletion-only max-flow 52;
   - (D) ∪ (S) max-flow 60, verified.

   It sits inside the `dm ≤ 16` range U2 says it swept. The return says (c) was "achieved only at the small `CB(2,2)/4`
   sub-family scale". A whole-tree instance existed in its own family.

6. **Minor record items.**
   - The return's pointer "full case analysis in `scratchpad/c3-U2/cb_gf.py`'s docstring" is unbacked: the docstring states
     the formulas only. The case analysis on the face is a sketch; my derivation above completes it.
   - `Aut(CB(d,m))` is written "`S_m ≀ S_d`". The intended group is `S_d ≀ S_m`. The leaf-orbit use is still correct.
   - The claim that `CBstar(2,2,2)` is "a fresh instance not in Cycle 2 T2's own tested set" is outside my read grant and
     unverified.

7. **No circularity, no ℕ-subtraction issue and no quotient misuse.** U2 uses no group quotient or lift, and every S-sign
   statement is at its row. Fence items are in the next section.

## Mechanism-equivalence and fence check

- **No refuted mechanism is revived.** The weight is the literal active-tag `w_F` and the relation is the literal (D) ∪ (S).
- The deletion-only failures (U2's `CB(2,2)/4` sector, my item 2 rows) are sector or whole-network deletion statements about
  the r30 network. They are not `E993-R23-LITERAL-DELETE-ONLY-HALL`, which has a different demand and a different relation.
  Nothing is asserted about (HALL) from them.
- **No closed region is re-proved.** `CB(1,7)/10` and `CB(2,5)/10` repeat already-saturating rows, so they are no new
  evidence. The `CBstar` key is cited, and U2's test of it is struck as a corroboration (item 3).
- **No census value is used in a proof, no RTree wording appears, and no live root was read.** (WID) and (FLOW⇒SIGN) are
  cited `formally_verified` exactly as `control/C3-STAGE1-GATE.md` records them. (LIFT), (INV) and the equitable lift are
  unused.
- **Candidate 1, alias and registration ruling.**
  - Lexically, "generating function" collides with nothing in the return's search.
  - Mathematically, it is by the return's own statement term-for-term identical to Cycle 2 U2's unregistered
    `cb_target_rows.py` formula. Its count specialisation equals the lower-region `cb-switch-cut/run.py` branch decomposition.
  - It is a closed form for the layer totals of a named family with `F` = all leaves. It carries **no transport content**:
    its only downstream quantity is supply − capacity = `S` (WID).
  - **Ruling:** a Tier 3 record, an adjunct to `R30-CB-RECORD`, not an `E993-R30-…` key.
  - Its mathematics is complete and correct: `proved_informal` if the synthesis chooses to register it anyway. The scope
    must then say `F` = the full leaf set, with `F_p` = all leaves derived per row before any row use.
- **Candidate 2, ruling.** A `bounded_computation` record at a non-eligible rank, superseded as a witness by `CB(4,1)/4` and by
  the order-8 whole-tree row below. Not a key.

## Certification audit

| Literal on the face | Evidence | Ruling |
|---|---|---|
| All row values for `CB(1,7)/10`, `CB(2,5)/10`, `CB(2,2)/4`, `CB(3,5)/13–14`, `CB(4,4)/14`, `CB(8,·)` (n, α, x, |F|, supply, capacity, S) | replay plus my own instrument | **backed** |
| `CB(8,92)` `S` "byte-identical" to the frozen `aggregate` | replay, plus my own value against the file's integer | **backed** |
| Canonical digest `20a48614…`, module digests, "identical digest in both directories" | replay | **backed** |
| Digit-count literals in the `CB(8,·)` table | actual values: 86 row — Δ_x **326**, Δ_{x−1} 327, supply 330, S 328 digits; 89 row — 337 / 338 / 342 / 340; 92 row — 349 / 350 / 353 / 351 | **struck**. The face gives 330/327/352/351, 340/338/363/362 and 352/350/369/369. Only the Δ_{x−1} counts happen to be right |
| "an actual flow found … exhibited" for `CB(1,7)/10` and `CB(2,5)/10` | only the max-flow value is returned; no flow is extracted or independently verified | **narrowed** to "max-flow value equals supply (Dinic)". My verified flows confirm the value |
| "8 of its flow-carrying arcs are genuine switch arcs" (`CB(2,2)/4`) | true of U2's particular flow; depends on the solver | backed as stated, but carries no weight |
| `deletion_only_Hall_holds: true` (`CBstar`) | whole-sector inequality only | **struck** as a Hall statement (item 3) |
| "swept every small `CB(d,m)` with `dm ≤ 16`" / "smallest" | no generator shipped; contradicted | **struck** (item 2) |
| "first …" (three instances) | unbacked or superseded | **struck** (item 4) |
| "verified three ways" / "triple cross-validation" of `W(x)` | backed by replay; I independently confirmed it on 14 shapes | **backed** |
| "no `__pycache__`", "nothing under `sources/` was written" | my `find` checks are empty | **backed** |
| Disclosures | the return discloses; the controller's disclosures record says "none reported" | record discrepancy (Identity section) |
| Route verdict `bounded_evidence`; headline flag set to no | consistent with the evidence | **justified** |

## Verdict

verdict: retained_narrowed
headline_resolved: no

Retained: every row value, the literal fidelity of the instrument, and Candidate 1's mathematics, which I confirm. I would
grade Candidate 1 `proved_informal` as mathematics and file it as a record, not a key.

Narrowed or struck:
- the `CBstar` "corroboration" (a whole-sector inequality, a misquoted key scope, and eligible `p = 7` unreported);
- "smallest" `CB(2,2)/4` (`CB(4,1)/4` is smaller, and the sweep is unshipped);
- all three "first" literals;
- the `CB(8,·)` digit counts;
- "exhibited flow" on the full rows.

Candidate 2 stays a non-eligible `bounded_computation` record. Obligations (a) and (c) are not met by the return. (c) is met,
in its non-eligible form, by this critique (below).

Chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

What remains after this critique, stated exactly:

1. **Obligation (a) is open.** An exact per-subfamily certificate on the full (D) ∪ (S) networks of `CB(8,86)/460`,
   `CB(8,89)/476` and `CB(8,92)/492`, in the form of a rational saturating flow or an LP-dual potential, covering the coupled
   families that mix `sec`, positive-weight V and positive-weight S/O. Totals such as `W(x)` cannot supply it.

   **Critic-derived verification lemma (C-U2-F; STATED; `proved_informal`; elementary, and very likely an alias of the easy
   direction of max-flow/min-cut already used by C1-LA2).**
   - Hypotheses: `f : I_{p+1} × I_p → ℚ_{≥0}` is positive only on (REL) arcs, with `Σ_A f(B,A) = w_F(B)` for every `B` and
     `Σ_B f(B,A) ≤ w_F(A)` for every `A`.
   - Conclusion: for every `X ⊆ I_{p+1}`,
     `Σ_{B∈X} w_F(B) = Σ_{B∈X} Σ_{A∈N(X)} f(B,A) ≤ Σ_{A∈N(X)} Σ_{B∈I_{p+1}} f(B,A) ≤ Σ_{A∈N(X)} w_F(A)`.
   - Why each step holds: the equality holds because `f(B,A) > 0` forces `A ∈ N({B}) ⊆ N(X)`; the first inequality uses
     `f ≥ 0`; the last uses capacity.
   - So a rational saturating flow gives (HALL-COND) for every `X`. With (HALL⇒FLOW) it gives an integral saturating flow,
     and with (FLOW⇒SIGN) it gives `S ≤ 0`.
   - This is the lemma the allocation required on U2's face. A certificate is still needed at the three rows.

2. **Switch-load-bearing whole trees exist below the window, and none have yet been found at eligible ranks.** This is a
   critic-derived advance by C-U2-F, graded `bounded_computation`. Instruments: `switch_search.py` and `n8_bruteforce_hall.py`.
   Every flow was verified and every violator recomputed.

   **Scope of the search.** Every free tree of order ≤ 15 (A000055-checked) and every rank `p ≥ 1` with positive supply. On
   each row: `F_p` derived, WID asserted from two sides, deletion-only and (D) ∪ (S) max-flows.

   **Findings.**
   - Full-network rows with deletion-only max-flow < supply but (D) ∪ (S) saturating: **1, 0, 1, 37, 21, 10, 500, 722** at
     orders 8 through 15, i.e. **1,292 in all**.
   - Every one of these rows has `p ∈ {x, x+1}`, below the window, so every one is non-eligible.
   - No row with `S ≤ 0` fails under (D) ∪ (S). Through order 15, the full network saturates exactly when `S(T,p) ≤ 0`, at
     every rank.
   - Eligible rows through order 15 (1,043) all saturate deletion-only. This repeats the recorded census and is instrument
     sanity only, not evidence.

   **Smallest witness (order 8, unique at that order).**
   - Tree edges: `0–1, 1–2, 2–3, 2–6, 2–7, 3–4, 3–5`.
   - Row data: `i = (1, 8, 21, 24, 12, 2)`, α 5, x 3, `p = 3`, window [5,3] (non-eligible), `F` = all 5 leaves.
   - Totals: supply 29, capacity 32, `S = −3`.
   - Deletion-only max-flow is 27. The deletion-deficient `X` has 9 members, `Σ = 22`, `Σ_{N_D} = 20`.
   - Under (D) ∪ (S) the flow saturates at 29, and every nonempty `X` has slack ≥ 3.
   - This was confirmed by three instruments: my flow instrument; exhaustive enumeration of all 4,095 subfamilies without any
     flow solver; and U2's replayed Dinic code.
   - Mechanism: the switch at the support `3` (`B ⊇ {4,5}`) exits to targets that contain `3` and so activate the private
     tags `6, 7` of support `2`. This is the "switch exits that activate private tags" effect, at order 8.

   **What it shows and does not show.**
   - It closes allocation item (c) in its non-eligible reading. It also narrows the Standing-state sentence "switch arcs have
     NEVER been load-bearing on any computed tree row" to **eligible** rows.
   - It says nothing about (HALL), which is quantified over eligible `p` only.
   - It suggests a question for T1/F1, as a conjecture and not a claim: "on trees, (HALL-COND) at rank `p` ⟺ `S(T,p) ≤ 0`".
     The open instance is still an eligible switch-necessary row below order 1465.
   - An isolated second read is needed before any registration.

3. **Record corrections for the synthesis.**
   - Correct U2's CB-row digit counts.
   - Record `CBstar(2,2,2)/7` as eligible, with its row data from item 3 above.
   - Correct the Stage 3 disclosures record entry for U2.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-crit-U2-F/`.
All code is standard library only and was run with `python3 -B`.

| Path | SHA-256 | Purpose |
|---|---|---|
| `replay/{tree_lib,network,cb_gf,run_all}.py`, `replay/run_all_RESULT.json` (regenerated), `replay/run_all_RESULT.orig.json` | same as U2's inventory (`19247e63…`, `6fa12483…`, `563e43cc…`, `5821cc5e…`, `ac432c7c…`) | copy-out replay from `c3-U2/`; canonical digest `20a48614…` |
| `replay2/*` | same digests | copy of `c3-U2-replay/` for the parity check |
| `own/inst.py` | `26444e95b07106bc4e6b3f119b050c0df65b04cac53e31308f23b60330ae4bd8` | own instrument library |
| `own/fixed_points.py` | `67e69edc72114a5ef2883b9a8df8d966fb062cd873d922ebf57e7904bc11f977` | fixed points |
| `own/cb_rows.py` / `cb_rows_RESULT.json` | `22532f38…` / `821daf60…` | `CB(2,2)` all ranks, sector `CB(2,2)/4`, `CBstar(2,2,2)/5–7`, full `CB(1,7)/10`, `CB(2,5)/10` with verified flows |
| `own/big_rows.py` / `big_rows_RESULT.json` | `6a966986…` / `d7b368d8…` | `CB(3,5)/13–14`, `CB(4,4)/14`, the three `CB(8,·)` rows |
| `own/gf_check.py` / `gf_check_RESULT.json` | `7901cd64…` / `fc0788bc…` | `W(x)` against enumeration, 14 shapes |
| `own/sector_sweep.py` / `sector_sweep_RESULT.json` | `759a7308…` / `f4b9a230…` | `CB(d,m)`, `n ≤ 23`, sector deletion deficits |
| `own/trees.py` | `2d68470d…` | free-tree generator (A000055 through 15) |
| `own/switch_search.py`, `own/switch_search_range.py` | `54758380…`, `86806651…` | whole-tree switch-load-bearing search |
| `own/switch_search_n12_RESULT.json`, `…_n14_RESULT.json`, `…_n15-15_RESULT.json` (+ stdout `.txt`) | `b5d63e27…`, `9894ac0a…`, `e65effb1…` | search results through order 15 |
| `own/n8_bruteforce_hall.py` / `n8_bruteforce_hall_RESULT.json` | `86f48c3c…` / `f55565a5…` | exhaustive-subfamily Hall check of the order-8 witness |

Replay: `cd <scratch>/own && python3 -B fixed_points.py && python3 -B cb_rows.py && python3 -B big_rows.py && python3 -B gf_check.py && python3 -B sector_sweep.py && python3 -B n8_bruteforce_hall.py && python3 -B switch_search.py 14 && python3 -B switch_search_range.py 15 15`.
Timings: about 5 min for order 15, about 90 s for orders ≤ 14, seconds for the rest. No background jobs were run.
