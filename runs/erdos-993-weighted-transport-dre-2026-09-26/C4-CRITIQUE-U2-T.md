# Critique

Critic `C-U2-T` (cross-orientation, orientation T: prove) of route `C4-U-02 SWITCH-SHARE-ALLOCATION-LEMMA` (seat U2, orientation U), r30 Cycle 4 Stage 4. Date 2026-09-27.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I read no other VerityOS file outside the run root. The host injected the project `CLAUDE.md` and the auto-memory index into context at session start; I did not open or act on either. Dispatch `control/dispatch/c4-stage4/DISPATCH-C-U2-T.md`: SHA-256 `b06ee735188d26190887f5ab53a27a37c30a79eee10fc4b92ff0fb69fff39286`, verified before use.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Ruling-30 line:** the return supplies none of items (a)–(d). The critic finding in §Attacks (A1) is at a non-eligible rank, so it is not a (CUT) and not item (c).

## Identity and seal audit

- Capsule `control/c4-critic-capsules/U2-PACKET-MANIFEST.json`: I recomputed the inner seal canonically (SHA-256 of the key-sorted compact JSON without `seal_sha256`, no trailing newline). It is `4d32baafa8b7ef9225633c3a834572185f38430b2d0d689fc1bde7ff740803d2`, which **matches**. All 14 members match their listed SHA-256 and byte counts.
- Stage 2 packet seal: I recomputed `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`, which **matches** the protocol's value and the value the return cites.
- Stage 3 packet seal: recomputed as `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9`, self-consistent. The Stage 3 manifest lists `cycles/cycle-4/stage3/returns/U2/RETURN.md` at `e54d4805…af8e` (40395 bytes), and the live file matches.
- Stage 4 dispatch manifest seal: recomputed as `784132f0726699b6f7ef5cbf07196f7d35d233d980799f25fdd6883cadde9229`, self-consistent. Its members match the capsule's shared entries.
- The return's digests:
  - Its source digest for `sources/lower-region/inputs/ordinary_tree_checked.py` is not re-checked, because no finding of mine rests on that file.
  - `sources/authority/CLAIM-IDENTITY.json` (used below for the alias check) matches `control/SOURCE-DIGESTS.json` (`eba20be3…9c84`, 2624107 bytes).
  - The six generator digests replay exactly (see Certification audit).
- Read-boundary disclosures filed for U2: "none reported". Scratch contents against the inventory: `scratchpad/c4-U2/` holds the 4 libraries, the 6 generators and the 6 `*_RESULT.json` files the return names, plus two stdout captures the return does not list (`out_b9.txt`, `out_cb42.txt`). This is a low-severity inventory gap, and nothing else is present.
- My own read-boundary disclosures:
  - one non-recursive `ls -la` of `scratchpad/c4-U2/` (granted, for the copy-out) and one `ls -d` of my own critique path;
  - `sources/authority/CLAIM-IDENTITY.json` loaded by `json` for the alias check (within the `sources/` grant);
  - the harness saved the 40 KB return's display to a tool-results file under `~/.claude/projects/…/tool-results/`, and I read the return through that copy. Its content is the digest-verified return; this is a harness mechanism, not a new source;
  - no `find`, `grep -r`, `rg` or recursive listing anywhere. The only `grep` calls were single-file greps inside my own replay copy. No network use, no installs, no background jobs;
  - `python3 -B` throughout; no `__pycache__` in either of my directories (checked).

## Independent re-derivation

**Instrument.** I wrote `scratchpad/c4-crit-U2-T/own/crit.py` from SEMANTIC-CONTRACT §1.1–1.2 only and imported no U2 code. It uses:
- a separate union-find acyclicity test plus a DFS connectivity test;
- backtracking enumeration of independent sets, cross-checked against an iterative rooted-DP independence polynomial at `p` and `p+1`;
- `x` scanned through rank `α`;
- `F_p` derived as `Δ_p(T − v) < 0` on the original tree;
- literal `w_F` with `W_v = N(s_v) ∖ {v}`, and the literal (D) ∪ (S) relation (switch only for `u ∉ B` with `|N(u) ∩ B| = 2`);
- Dinic max-flow with `INF = supply + 1`;
- (WID) asserted on every instance. The asserted equality is layer-sum `supply − capacity` against `Σ_F [q_v(p) − q_v(p−1)]`, with `q_v(j)` counted directly as independent `j`-sets of `T − {v, s_v}` meeting `W_v` (the `taggedFamily` definition). That is a different object and code path from both the layer sums and U2's forest-DP `wid.py`.

**Fixed points reproduced before trust** (`fixed_RESULT.json`):

| Row | Result |
|---|---|
| `K_{1,12}/8` | `n` 13, `α` 12, `x` 6, 12 favorable; 1980 / 3960 / `S = −1980`; deletion-only saturates |
| path-star `(2,3,4)/7` | `n` 15, `α` 11, `x` 5, 10 favorable; 1483 / 2701, flow 1483, `S = −1218`, **2025 arcs** |
| order-8 tree `/3` | 29 / 32 / −3; mixed 29, deletion-only 27 |
| `CB(4,1)/4` | 60 / 60 / 0; mixed 60, deletion-only 52 |
| `CBstar(2,2,2)/7` | eligible; 2194 / 3888 / −1694; both flows 2194 |

**Part (a): the three-formula identity (candidate key 1).** I derived it from first principles and agree with the return's derivation. In `CB(d,1)` at `p = k+1`, a sector member `B ∋ r, v` excludes `s` and `u_0`. `B` is determined by a pair `(J, K)` of disjoint column sets holding supports and leaves, with `|J| + |K| = k`, and `w(B) = 1_v`. The positive-weight neighbours are:
- in-sector deletions (weight `1_v`);
- the `u_0`-switch targets `Z_K = {v, u_0} ∪ c_K` with `|K| = k − 1`, reached only when `|J| = 1`, each of weight `(k − 1)·1_c`.

Everything else has weight 0: deleting `r` or `v`, the `s`-switch, and there is no support or leaf pivot.

Literal check (`sector1.py`) on every `(d, k)` with `2 ≤ d ≤ 10` and `1 ≤ k ≤ d` (54 rows; WID asserted on all 54 rows in `wid1.py`):
- `supply`, `cap_D` and `cap_U` equal the formulas on 54/54 rows.
- On the 1_v/1_c scan (`large1.py`, `d = 2..120`, DP only), the split `1_v = 1, 1_c = 0` occurs **exactly** at `(d, k) = (3t+1, 2t)`: (7,4), (10,6), (13,8), …, (118,78).
- The reverse split `1_v = 0, 1_c = 1` **never** occurs for `d ≤ 120`.

**Part (a): the `j`-threshold claim (candidate key 2), literal and quotient.** For all 54 rows:
- the literal sector-restricted max-flow deficiency equals the recomputed min-cut deficit (`Σ_X w − Σ_{N(X)} w` over the residual-reachable sources);
- it also equals an exhaustive search over the `S_d` quotient.

`max(0, max_{j0} D(j0))` equals the literal deficiency on **54/54** rows. The return's literal statement (no `max(0, ·)`) holds on **35/54**; it fails on every non-deficient row with `1_v = 1`, where the threshold maximum is negative. There are 10 deficient rows: (2,1), (3,2), (5,3), (6,4), (7,4), (7,5), (8,5), (9,6), (10,6), (10,7). Their deficiencies are 3, 3, 20, 25, 280, 21, 406, 882, 5376, 1170.

**Critic-derived advance: proof of the corrected key 2 (my derivation, STATED, `proved_informal` pending an isolated second read).**

*Statement.* For `T = CB(d,1)`, `p = k + 1`, `1 ≤ k ≤ d` and `F = F_p(T)`, let `δ = max_{X ⊆ sec} (w_F(X) − w_F(N(X)))`. Then `δ = 1_v · max(0, max_{0 ≤ j0 ≤ k} D(j0))`, where

- `D(j0) = Σ_{j ≥ j0} C(d,k)C(k,j) − Σ_{j' ≥ max(j0−1, 0)} C(d,k−1)C(k−1,j') − [j0 ≤ 1]·(k−1)·1_c·C(d,k−1)`.

(Note that `C(d,j)C(d−j,k−j) = C(d,k)C(k,j)`.)

*Proof.*
1. **Weights.** As in the identity above. If `1_v = 0` the sector has no weight, so assume `1_v = 1`.
2. **Symmetry.**
   - `S_d` permutes columns and preserves the sector, `w_F` and (REL). The sector-restricted max-flow LP is therefore invariant, and averaging an optimal flow over `S_d` gives an optimal flow that is constant on arc orbits.
   - The source orbits are the classes `j = |J|` (size `C(d,k)C(k,j)`). The target orbits are the sector classes `j'` (size `C(d,k−1)C(k−1,j')`) and the single switch orbit (`C(d,k−1)` targets, each of weight `(k−1)1_c`).
   - Every arc orbit is biregular:
     - `j → j−1` has out-degree `j` and in-degree `d−k+1`;
     - `j → j` has out-degree `k−j` and in-degree `d−k+1`;
     - `1 → *` has out-degree 1 and in-degree `d−k+1`.
   - So a quotient flow spreads uniformly back to an original flow of the same value, and the original max-flow equals the max-flow of the caterpillar quotient `s_0 – t_0 – s_1 – t_1 – … – t_{k−1} – s_k`, with `t_*` hung on `s_1`. (This is the equitable-partition argument, given here directly.) Hence `δ = max_Y (a(Y) − cap(N_Q(Y)))` over sets `Y` of source classes.
3. **Runs.** `Y` splits into maximal runs of consecutive indices. Their quotient neighbourhoods are disjoint, and `t_*` belongs to the run containing 1, so the deficit is additive over runs.
4. **Run deficit.** Put `ρ = C(d,k)/C(d,k−1) = (d−k+1)/k` and work in units of `C(d,k−1)`. Using `C(k,j) = C(k−1,j) + C(k−1,j−1)`, a run `[a,b]` has deficit
   - `(ρ−1)[C(k−1,a−1) + C(k−1,b)] + (2ρ−1)·Σ_{a ≤ j ≤ b−1} C(k−1,j)`,
   - minus `(k−1)1_c` when `a ≤ 1 ≤ b`,
   - with the convention `C(k−1,−1) = C(k−1,k) = 0`.
5. **Case `ρ < 1/2`.** Every run deficit is `≤ 0`, so `δ = 0` and every `D(j0) ≤ 0`.
6. **Case `ρ ≥ 1/2`.**
   - Extending the last run `[a,b]` (with `b ≥ 1`) to `[a,k]` changes the deficit by `ρC(k−1,b) + (2ρ−1)Σ_{b+1}^{k−1} ≥ 0`.
   - Filling the gap between runs `[a_1,b_1]` and `[a_2,·]` (with `b_1 ≥ 1`) changes it by `ρ[C(k−1,b_1) + C(k−1,a_2−1)] + (2ρ−1)Σ_{b_1+1}^{a_2−2} ≥ 0`.
   - Neither move adds class 1. So an optimal `Y` is a suffix `[j0, k]` or `{0} ∪ [a, k]` with `a ≥ 2`.
7. **The leftover case.** If `ρ ≤ 1`, `{0}` has deficit `ρ − 1 ≤ 0` and can be dropped. If `ρ > 1`:
   - left-extending `[a,k]` to `[2,k]` gains `ρC(k−1,a−1) + (ρ−1)C(k−1,1) + (2ρ−1)Σ_2^{a−2} ≥ 0`;
   - `({0} ∪ [2,k]) − [1,k] = (k−1)(1_c − ρ) < 0`;
   - `{0}` alone is at most `D(1)` because `(2ρ−1)(2^{k−1} − 1) ≥ k − 1`.

∎

The general statement is therefore proved, not only observed on instances. Its scope is `CB(d,1)`, which has **no eligible rank** for `2 ≤ d ≤ 120` (`large1.py`; `bounded_computation`; the window is `[x+2, ⌊2α/3⌋]` with `x + 2 = ⌊2α/3⌋ + 2` on every such `d` computed). It is a laboratory theorem and bears on no (HALL) instance.

**Part (b), multi-choke test** (`multi.py`, literal sector-restricted flows, `F_p` derived). Rows: `CB(d,2)` for `d = 2..5`, `CB(2,3)`, `CB(3,3)` and `CB(2,4)` at every rank; 51 rows, 24 with positive sector supply, none eligible.
- **No** mixed-deficient sector row with `1_c = 1` appears at `m ≥ 2`. The `CB(7,1)/6`-type phenomenon did not appear for `md ≤ 10`.
- The one mixed-deficient `m = 2` row, `CB(5,2)/7` (deficit 5376), is a split row (`|F| = 1`) with `S = +5376`.
- This extends the return's evidence. It does not establish the lift, and the lift remains `conjecture`-grade prose.

## Attacks and findings

**A1. Critic-derived finding: the "S ≤ 0 ⇒ saturation" conjecture fails at `CB(7,1)/6`.** Two instruments agree.
- Own instrument (`cb71.py`, `cut71.py`): `n = 18`, `α = 9`, `x = 6`, `p = 6` (non-eligible: `p < x + 2`), `|F| = 8` = all leaves. Supply 924, capacity 945, so **`S = −21`**. The whole-network mixed max-flow is **903 < 924**, and deletion-only is 812.
- Explicit cut: `X = {B ∈ I_7 : r, v ∈ B, B` holds at least 2 supports`}`. It has 546 members, each of weight 1. `N(X)` under literal (D) ∪ (S) has 2163 targets, 525 of positive weight, total weight **525**. The deficit is **21**.
- Second instrument: U2's `network.py` and `wid.py`, run copy-out-first. They give `S = −21` (forest-DP), Edmonds–Karp flow 903, and a min-cut source side of 546 sources, identical to my `X`.

The allocation records the conjecture "on trees, `S(T,p) ≤ 0` implies a saturating flow at every rank" (`conjecture` grade, no counterexample through order 15). This tree has order 18, so the conjecture is **refuted at a non-eligible rank**. That is exactly the case the allocation's F2 item (b) says "refutes only the conjecture".

The finding does not touch (HALL) or the primary aggregate (fence §3.1). The return had the instance but never computed `S` or the whole network there. The observation that the row has `S < 0` and still fails to saturate is mine. It is STATED and needs an isolated second read.

Among the 54 `CB(d,1)` rows with `d ≤ 10`, it is the **only** row where `S ≤ 0` and the network fails to saturate. `scan_sat.py` covers every rank for `d ≤ 8`; `d = 9, 10` were checked at their deficient ranks.

**A2. The split instance `CB(7,1)/5` is forced by FLOW⇒SIGN.** There `|F| = 1` and `S = +280`, so the whole-network flow is 280 = total capacity. A deficiency is forced by `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` once `S > 0`. It is not a switch-allocation phenomenon.
- The return reports no `S` on this row, although every row must carry one (SEMANTIC-CONTRACT §3).
- 9 of the 10 deficient `CB(d,1)` sector rows have `S > 0`. The indicator analysis is correct but mostly describes positive-aggregate ranks.
- The phrase "B8/B9 show rescue fails without eligibility and derived `F_p` … made explicit and exhibited" is narrowed accordingly.

**A3. Key 1 formula factor.**
- The return prints `cap_union = cap_D + (k−1)C(d,k−1)·1_v·1_c`. The literal neighbourhood always contains the switch targets, so the correct factor is `1_c` (as the return's own `run_sw_lemma.py` docstring states).
- The two agree only because `1_v = 0 ⇒ 1_c = 0`, which holds for `d ≤ 120` but is not proved.
- "`1_v` and `1_c` are independent" is narrowed to: they split in one direction, exactly at `(3t+1, 2t)` for `d ≤ 120`.

**A4. Key 2 as stated is false on non-deficient rows.** "max_{j0}[…] equals the TRUE Hall deficiency" fails on 19/54 rows in my instrument, and on 10/16 in U2's own `run_j0_sweep.py`, which prints `ALL LITERAL DEFICIENCIES MATCH THE j0-SWEEP MAXIMUM: False`.
- Corrected statement: `δ = 1_v·max(0, max_{j0} D(j0))`. I proved it above.
- The name `…-J-THRESHOLD-EXTREMAL-DEFICIENT-CUT` fails ruling 33 on two counts. The object is at non-eligible ranks, and "DEFICIENT-CUT" reads as the contract's (CUT). The name also asserts a deficiency on rows where there is none.
- Suggested predicate name: `E993-R30-CB-D1-ROOT-ARM-SECTOR-MAX-HALL-DEFICIT-EQUALS-SUPPORT-COUNT-SUFFIX-MAXIMUM`, scope `CB(d,1)`, `p = k+1`, `1 ≤ k ≤ d`, `F = F_p`.

**A5. Cycle 2 record: strike the implication.** Three passages imply that the Cycle 2 sector-Hall record at `CB(8,86/89/92)` is an aggregate-style check:
- "the STYLE of check Cycle 2's `computer_assisted` sector-Hall result … is described as performing";
- Remaining obligation 2: "the whole-sector aggregate is already `computer_assisted`-recorded as Hall-satisfying";
- Remaining obligation 4: "strengthening … to cover sub-families, not just the whole sector".

The return read no Cycle 2 record; its own disclosure lists only Cycle 3 items. The characterization is therefore unbacked, and the controller's record states that SR-C2-2 covers **every** `X ⊆ sec` (Lemma C(ii) plus the second-eigenvalue key). The allocation's (O2) narrowing is consistent with that: families with no positive S/O member are settled "with the registered sector Hall".

The return has **not** established that any record's method is aggregate-only at any row. There is no record correction, and the three passages are struck. I did not read SR-C2-2; it is outside my capsule.

**A6. B9.** On the return's quotation, B9's pairing `2^k C(d,k)` against `C(d,k−1)(2^{k−1}+k−1)` fails wherever `1_v = 0` (where supply is 0, not `2^k C(d,k)`) and at the `1_c = 0` split rows. On the quotation's reading, this is a record correction to B9's scope. I did not read B9's text; it is outside my capsule. Key 1 is B9 with the indicators made explicit and `cap_D` separated. It is a **record extension of B9**, not an independent key, and the return concedes as much.

**A7. Part (b) prose.** "More chokes give more rescue pivots" is graded `conjecture`-adjacent and used nowhere. This is correct. My test in §Independent re-derivation is consistent with it and proves nothing about `m = 86..92`. "`CB(4,2)`, `p = 6` (`k = 3`)" is wrong: `p = 6` means `k = 5`. "`CB(4,1)`'s OWN deficiency at `k = 3`" is also wrong, because `CB(4,1)/4` saturates with switch arcs and is deficient only deletion-only.

**A8. Fidelity of the sweeps (duty 2).**
- `w_F` is the active weight, (REL) is literal, `F_p` is derived at `p`, and `x` is computed through `α`. All confirmed by reading `network.py` and `tree_lib.py`.
- **But** none of `run_b9.py`, `run_sw_lemma.py`, `run_j0_sweep.py`, `run_multichoke.py` or `run_cb42_probe.py` computes `S` or asserts `supply − capacity = S`. Only `run_labs.py` does, on 3 labs.
- As shipped, every sweep number fails the WID-assertion rule and is struck as the return's evidence. My instrument re-establishes the `CB(d,1)` numbers with WID asserted on all 54 rows, so they survive as **critic-reproduced**.

## Mechanism-equivalence and fence check

- There is no revival of a refuted key. The object is a literal (D) ∪ (S) max-flow on a named family, with the active weight. It is not deletion-only Hall; `j`-threshold families under (D) ∪ (S) are not `E993-R23-LITERAL-DELETE-ONLY-HALL`. There is no retag relation, no own-support unit capacity, no per-leaf injectivity, no occupancy domination, no signed cross-tag and no covariance.
- No closed region is re-proved, and no census value enters a proof. My proof uses only the symmetry, the biregularity counts and binomial identities.
- There is no RTree wording, and (LIFT) is not used to supply feasibility.
- Every `CB(d,1)` row is non-eligible. This holds for `d ≤ 120` (my scan) and for `CB(7,1)` specifically (window `[8, 6]`). No row is (HALL) evidence and nothing is a (CUT).
- A1's cut is a Hall violation at a non-eligible rank. It refutes only a `conjecture`-grade statement.

## Certification audit

Struck or corrected literals (the shipped evidence contradicts or does not back them):
1. "35 … `(d,k)` pairs, `d = 2..9`" (`run_sw_lemma.py`). The code loops `range(2, 9)`, so the sweep covers `d = 2..8`. The count of 35 is correct; "`d = 2..9`" is struck.
2. "over 21 `(d,k)` pairs swept (`d = 2..9`)" and "9 genuinely deficient cases … (8,5), (9,6)" (`run_j0_sweep.py`). The shipped script runs **16** hard-coded pairs with `d ≤ 7` and finds **6** deficient. (8,5) and (9,6) were never run. My instrument confirms them (406 and 882), but that is critic-reproduced, not the return's evidence.
3. "zero mismatches" and "correctly finds …" The shipped script prints `… MATCH …: False` (10/16 rows false). The "sign convention" gloss is an admission that the statement as written is false; see A4.
4. "WID … confirmed … on every one of the 34 `CB(d,1)` instances." WID is computed on 3 labs only; this is struck (A8).
5. "`C(7,2)+C(7,3)+C(7,4)+C(7,5) = 546`" is arithmetically false: the sum is 112. The correct expression is `C(7,5)·(C(5,2)+C(5,3)+C(5,4)+C(5,5)) = 21·26 = 546`. The class counts 210/210/105/21 are right.
6. "the ACTUAL min-cut IS `X'_2`, verified by classifying the 546 cut-side sources." No shipped script performs that classification, so as the return's evidence it is unbacked. **I confirmed it**: U2's min-cut set equals `{j ≥ 2}` exactly (`cut71.py`).
7. "15 tested `(d,m,p)` triples with `m ≥ 2`." The shipped outputs have **16**, 5 of them with zero supply (trivially "hall holds"). They are sector-restricted, not whole-network, flows.
8. "six generators replayed byte-identical." The six `RESULT_SHA256` digests reproduce exactly in my copy-out replay:
   - `8382dbe8…c241`
   - `4056e0bf…0e1d`
   - `9ded05e3…bc04`
   - `9d672d8e…657f`
   - `6fb8a589…49e8`
   - `20a7d6f5…b2ba`

   Four JSON files are byte-identical to U2's. Two differ only in the un-hashed `elapsed_seconds` field (`run_labs`, `run_cb42_probe`). The claim stands as a digest claim.
9. Backed:
   - the lab rows (29/32/−3, 60/60/0, 2194/3888/−1694) and switch-arc counts 11/92/1100;
   - the B8 check (30 rows `all_zero: True`);
   - the `CB(7,1)/5` numbers (560/280/280) and the `CB(7,1)/6` numbers (672/700/651; the `X'_2` count 546 against 525).

   All of these were reproduced by my own instrument or by replay.
10. The attack brief's "order 17" for `CB(7,1)` is wrong: the order is **18** (`3 + 1 + 2·7`).

Grades after audit:

| Item | Grade |
|---|---|
| Lab rows | `bounded_computation` |
| B8 (re-confirmed) | at its STATED grade |
| Key 1 | `proved_informal` as a B9 record extension with factor `1_c` |
| Key 2, corrected statement | `proved_informal` by the critic's proof, STATED, needs an isolated second read |
| Part (b) | `conjecture` |
| A1 | `bounded_computation`, two instruments, STATED; refutes a `conjecture`-grade statement |

## Verdict

verdict: retained_narrowed
headline_resolved: no

What is retained:
- the three-formula `CB(d,1)` sector identity (correct, with factor `1_c`), as a B9 record extension;
- the observation that a proper subfamily can be Hall-deficient under (D) ∪ (S) while the sector aggregate passes (`CB(7,1)/6`).

What is narrowed:
- key 2 is restated with `max(0, ·)`, renamed (no "DEFICIENT-CUT"), and promoted from `computer_assisted` only through my proof;
- "independent indicators" becomes a one-directional split;
- the split instance is recast as an `S > 0` row.

What is struck:
- the Cycle 2 "aggregate-style" implication and remaining obligations 2 and 4 as written;
- the certification literals listed above;
- the return's sweep numbers as its own evidence, since they lack a WID assertion. They are re-established by the critic.

Critic-derived advances, each STATED and pending an isolated second read:
1. The proof of the corrected key 2 on `CB(d,1)`.
2. The refutation of the "`S ≤ 0` ⇒ saturation on trees" conjecture at `CB(7,1)/6` (`S = −21`, flow 903/924, explicit cut 546 → 525).

Neither is (HALL) evidence, and the route's `bounded_evidence` verdict stands.

## Remaining obligation

1. **Isolated second reads**, each at its exact scope:
   - (i) the corrected key 2 and its proof: `CB(d,1)`, `p = k+1`, `1 ≤ k ≤ d`, `F = F_p`, `δ = 1_v·max(0, max_{j0} D(j0))`;
   - (ii) the conjecture refutation at `CB(7,1)/6`: recompute `F_6`, both weights, `N(X)` and both sums.
2. **Scope.** Record B9's scope correction (indicators, with the `1_v = 0` rows) and key 1 as its extension, not as a separate key. Prove or record `1_v = 0 ⇒ 1_c = 0` if the `1_v·1_c` form is kept.
3. **Open, unchanged.** (HALL-COND) at the three `CB(8,·)` first ranks for families meeting the sector, V⁺ and a positive-weight S/O source (Cycle 2's (O2) as narrowed by SR-C3-4; T1's object). U2's part (b) did not advance it. The `CB(d,1)` phenomenon bears on no eligible row: `CB(d,1)` has no eligible rank for `d ≤ 120`, and the Cycle 2 sector-Hall record already covers every `X ⊆ sec`.
4. **Optional.** A proof that `CB(d,1)` has no eligible rank for every `d`.
5. **Unchecked alias space.** The lexical alias check against the master registry (434 keys) found no collision for `SATURAT`, `CB-D1`, `SUFFIX`, `ROOT-ARM`, `SWITCH-CAPACITY`, `MAX-HALL` or `HALL-DEFICIENCY`. The 14 run-local additions lie outside my read boundary and are unchecked.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-crit-U2-T/`. No background jobs were started, so there was nothing to kill.

- `replay/`: byte copies of U2's 10 scripts, their 6 regenerated `*_RESULT.json` files, and `out_*.txt`/`time_*.txt`. Result-file SHA-256:

  | File | SHA-256 |
  |---|---|
  | `run_b9` | `3206a486…ac4e` |
  | `run_cb42_probe` | `5187a61b…fa64` |
  | `run_j0_sweep` | `ea9f667b…ac25` |
  | `run_labs` | `ba21dae3…1a17` |
  | `run_multichoke` | `587d2a51…b1` |
  | `run_sw_lemma` | `11d73ac5…118b92` |

- `own/` (critic instrument; SHA-256):

  | File | SHA-256 |
  |---|---|
  | `crit.py` | `c3c164b8…a0b8` |
  | `fixed.py` / `fixed_RESULT.json` | `9cc359ee…095f` / `de20e093…7b` |
  | `sector1.py` / `sector1_d10_RESULT.json` | `3d8b4c5a…797f` / `f2aa3a5d…ecb1` |
  | `sector1_lib.py` | `0da306e9…bf14` |
  | `large1.py` / `large1_RESULT.json` | `74132eac…6947` / `12264e1b…1598` |
  | `wid1.py` / `wid1_RESULT.json` | `9520b773…d5` / `e2907084…a7` |
  | `scan_sat.py` / `scan_sat_RESULT.json` | `93ac6327…0d37` / `7356f5e2…e116` |
  | `cb71.py` / `cb71_RESULT.json` | `12b52c12…6284` / `2f5e7c10…c0cf` |
  | `cut71.py` / `cut71_RESULT.json` | `e849389d…81fb` / `d7218a94…62a` |
  | `multi.py` / `multi_RESULT.json` | `542e21d5…cafe2` / `dc5ebab5…f23cf2` |

  `cut71.py` imports U2's replay copy as the second instrument.
- Deliverable: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/cycles/cycle-4/stage4/critics/U2/T/CRITIQUE.md` (this file).
