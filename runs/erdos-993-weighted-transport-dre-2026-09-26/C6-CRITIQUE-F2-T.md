# Critique

Critic `C-F2-T` (orientation T, prove), Cycle 6 of r30. Assigned return: `cycles/cycle-6/stage3/returns/F2/RETURN.md` (route `C6-F-02 FIRST-POSITIVE-SUMMAND-ELIGIBLE-ROW`, orientation F). Date 2026-09-27.

Boot acknowledgment: I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other VerityOS file. The host-injected CLAUDE.md and memory index appeared in the session context. I did not open them further or act on them.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- Dispatch `control/dispatch/c6-stage4/DISPATCH-C-F2-T.md`: SHA-256 `60d645f718ee659f3df742b1a61f109eee30ac09cc6ca9683161b147537b925b`. It matches the digest I was given.
- Capsule `control/c6-critic-capsules/F2-PACKET-MANIFEST.json`: I recomputed the inner seal (compact key-sorted JSON without `seal_sha256`, no trailing newline) as `63a626d9640297ac7858557708113b4f2437296727bc6c399f1e1e88787bd365`. It matches. All 14 members match their listed SHA-256 and byte counts, including the return (`0f47c145…`).
- Stage 4 dispatch manifest seal: recomputed `74be1845f4005d6846c10eacdebf5049b6d7d971a53b445c1dcab3b3637ddf50`, which matches. Stage 3 packet manifest seal: recomputed `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd`, which matches. Stage 2 seal: recomputed `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611`, which matches.
- Digests the return lists, checked on my copy-out (`scratchpad/c6-crit-F2-T/copy/`):
  - `census_f2.py` is `ed81931011af…` and `hall_check.py` is `83f178482f14…`. Both match, and the working and replay copies are byte-identical.
  - The three per-order digests (`0661a79e…`, `77117ba5…`, `aa1aaa35…`) and the self-test digest `e21e70e4…` each equal the SHA-256 of their own result file's canonical JSON with the timing and digest fields removed. They are therefore digests of a summary of 11–12 fields, not of any per-tree data (see Certification audit).
- Read-boundary disclosures (mine):
  1. To find my seat's section I ran `grep -n '^#'` on `control/C6-CRITIC-ATTACK-BRIEFS.md`. This displayed the other seats' section headings, but not their bodies. I also read the file's common preamble (lines 1–20) together with my F2 section.
  2. I ran non-recursive `ls` on `sources/`, `sources/lower-region/`, `sources/lower-region/instruments/` and `…/orbit-flow-twoforone/`. I read that directory's `PROTOCOL.md`, the first 1,500 bytes of `m22-p34.json`, and ran a `grep -n` inside `run.py`. All of these are Stage 2 source members and within the grant; I used them to fix the definition of `T_m`.
  3. I ran `ls -la` on the two granted F2 scratch directories. The unlisted working note `RETURN-draft.md` there was copied out and read.
  4. The harness automatically moved one foreground search (`ps_search.py`, which produced no output) to the background after its timeout. I stopped it through the harness task-control channel, not by a literal PID, because the harness did not expose one. It is superseded by `ps_search2.py`.
  5. My only self-started background job was the census chain, PID 76556. I polled it with `kill -0` and confirmed it had exited before this write.
  6. I ran no full process listing and no pattern kill. I used no network and installed nothing. Every Python run used `python3 -B`.

## Independent re-derivation

Instrument: `scratchpad/c6-crit-F2-T/own/crit_lib.py`. It shares no code with F2 and uses the standard library only, with exact integers. It has four parts:
- a WROM level-sequence free-tree generator. F2 builds trees by centroid-rooted multisets, so the two generators are independent.
- Otter's formula for the counts of unlabeled free trees.
- an AHU canonical form taken from the tree's centre. I tested it for invariance under random relabelling and for distinctness through order 15.
- a literal include/exclude dynamic program for the independence polynomial of `T − D`, computed separately for `D = {v}`, `{v, s_v}` and `N[s_v]`, with no polynomial identities. The favourable-leaf set `F_p` comes from `Δ_p(T − v) < 0` on the original tree at rank `p`. `x` is computed through rank `α`. Eligible `p` runs from `x + 2` to `⌊2α/3⌋`.

Fixed points reproduced by my instrument:
- `K_{1,12}` at `p = 8`: `α = 12`, `x = 6`, 12 favourable leaves, each summand `−165`, supply 1980, capacity 3960, `S = −1980`.
- Path-star `(2,3,4)` at `p = 7`: `n = 15`, `α = 11`, `x = 5`, 10 favourable leaves, supply 1483, capacity 2701, `S = −1218`. My own Dinic max-flow (`flow_crit.py`) gives flow 1483 with 2025 distinct arcs (1744 deletion arcs; 281 switch incidences).
- Path-star `(2,2,4,3)` at `p = 8`: supply 8033, capacity 13467, flow 8033, 11691 arcs, `S = −5434`.
- `T_m` with `m = 22`: `n = 91`, `α = 68`, `x = 32`, `|F_34| = 67`, `S = −498754180547001418536`.

**Weight identity check, two independent sides.** On every eligible row of every free tree of orders 13, 14 and 15 (163 + 313 + 528 = 1004 rows), I compared:
- supply − capacity, computed from a literal enumeration of independent sets with the active-tag weight `w_F(B) = #{v ∈ F ∩ B : (B∖{v}) ∩ W_v ≠ ∅}`;
- `S` from the per-leaf polynomial summands.

They agree on every row (`wid_small.json`).

**Census replay with my own instrument (all trees; `order13.json` … `order22.json`).**

| order | trees (= Otter) | eligible trees | eligible `(T,p)` rows | leaf-summand rows | max | min | zero rows | trivial zeros (`q_v(p) = q_v(p−1) = 0`) | sup of `q_v(p)/q_v(p−1)` when `q_v(p−1) > 0` |
|---|---|---|---|---|---|---|---|---|---|
| 19 | 317,955 | 143,171 | 144,521 | 1,419,692 | 0 | −7,072 | 925 | 925 | 90/119 |
| 20 | 823,065 | 394,693 | 406,262 | 3,992,600 | 0 | −13,260 | 2,955 | 2,955 | 2087/2668 |
| 21 | 2,144,505 | 808,972 | 880,489 | 9,557,583 | 0 | −25,194 | 7,679 | 7,679 | 63/80 |
| 22 | 5,623,756 | 2,659,885 | 2,959,314 | 34,332,403 | 0 | −48,450 | 19,926 | 19,926 | 29/36 |

At orders 20, 21 and 22, all six of F2's reported numbers agree exactly with my instrument's: trees, eligible trees, eligible rows, leaf rows, max and min. This is `bounded_computation` from two independent instruments.

**Generator completeness (brief item (i)).**
- Otter's formula gives 1, 1, 1, 2, …, 123867 for orders 1–18 (matching the contract), then 317955, 823065, 2144505, 5623756 and 14828074 for orders 19–23.
- I copied out F2's `generate_free_trees` and applied my canonical form to its output. At orders 16, 17, 18, 19 and 20, the set of isomorphism classes F2 yields equals the set my WROM generator yields: 823,065 = 823,065 at order 20, with no duplicates (`gen_crosscheck_16_19.json`, `gen_crosscheck_20.json`).
- At orders 21 and 22, F2's generator is backed by its `seen`-set deduplication together with a yield count equal to Otter's number.
- The allocation's count labels are off by one. Erratum R30-E-p stands; F2 is right.

**The decisive check (brief item (ii)): `T_22/34` is not an order-22 row.** `T_22/34` denotes the tree `T_m` with `m = 22` at rank 34, not a tree of order 22.
- In the frozen instrument (`sources/lower-region/instruments/orbit-flow-twoforone/m22-p34.json`), `T_m` is a root 0 with an arm `0–1–2` and `m` claw centres attached to 0, each carrying 3 leaves. Its order is `n = 4m + 3 = 91`.
- My instrument reproduces this row: `α = 68`, `x = 32`, eligible `p ∈ [34, 45]`. Exactly one favourable-leaf summand is positive, at `p = 34`: the arm leaf 2 (`W_2 = {0}`). Its value is `C(66,33) − C(66,32) = 212336130412243110`, equal to the frozen record's `g`.
- This row lies outside orders 20–22, so it does not contradict F2's "zero positive summands". The census pipeline is not defective on this point. Brief item (iii) (sign conventions and zero extension) is confirmed by the same run, since the literal `H_v` and `R_v` summand reproduces the positive `T_22` value with the correct sign.

**The zero-summand witness (brief bullet 2).** I reproduced the witness: `K_{1,17}` plus a pendant path `0–18–19`, `n = 20`.
- `α = 18`, `x = 9`, eligible `p ∈ {11, 12}`, `|F| = 18`.
- `S(T,11) = −178568` and `S(T,12) = −167076`.
- `Δ_11(T−19) = −13260` and `Δ_12(T−19) = −9996`.
- Leaves 1–17 have summands `−10504` at `p = 11` and `−9828` at `p = 12`.
- Leaf 19 has summand 0.

That zero is trivial. `T − {18,19} − N[0] = ∅`, so `q_19(j) = [j = 1]`, and both terms vanish at every eligible rank. The tree is the `T_m` arm-tag shape with the claws collapsed to bare leaves, so it is not a new structural class.

**The step the return left open, attempted by me (critic-derived; `bounded_computation`).**
- **(R1) Literal (HALL) at the witness rows** (`witness_flow.json`), with supply − capacity equal to `S` on both rows from independent sides:
  - `p = 11`: 30,940 sources and 51,272 targets; supply 346,528, capacity 525,096, max-flow 346,528.
  - `p = 12`: 14,756 sources and 30,940 targets; supply 179,452, capacity 346,528, max-flow 179,452.
  - Both rows saturate with deletion arcs alone. No switch arc exists at either row: only 0 and 18 are non-leaf vertices, and neither can have exactly two neighbours in an independent set of size 12 or 13.
- **(R2) Every zero summand through order 22 is trivial**, meaning `q_v(p) = q_v(p−1) = 0`: 925, 2955, 7679 and 19926 rows at orders 19–22, all trivial. On rows that are not trivial, the largest ratio `q_v(p)/q_v(p−1)` rises slowly: 2/3 at order 14, 90/119 at 18–19, 2087/2668 at 20, 63/80 at 21, 29/36 ≈ 0.806 at 22.
  - At orders 18, 19, 21 and 22, the best approach is an arm-type leaf: its support has degree 2 and `W_v` is one hub vertex. At order 22 that hub carries three arity-3 claws plus one other branch.
  - At order 20, the best row is also a leaf with a degree-2 support whose single witness has degree 3.
  - So the census's approach toward a positive summand runs through the `T_m` arm-tag mechanism, not through the pendant-path shape F2 proposed.
- **(R3) Smallest positive arm-leaf summand among path-stars** (`ps_search2.py`, `ps_hits2.json`). The class is: root, arm `0–1–2`, and centres attached to the root carrying `a` leaves each, with every `a ∈ {1,…,7}` and any multiplicities.
  - The arm leaf's summand is `C(L,p−1) − C(L,p−2)`, where `L` is the total number of claw leaves. It is positive at an eligible `p` with the arm leaf favourable only if `x ≤ ⌊L/2⌋ − 1`.
  - Scanning every profile with `n ≤ 91`, the only such row is the homogeneous `(3^22)` at `p = 34`, which is `T_22/34` itself.
  - For homogeneous profiles, the first positive row is at `m = 22` for `a = 3` (`n = 91`) and at `m = 24` for `a = 4` (`n = 123`). None occurs through `m = 30` for `a = 5, 6`.
  - Mechanism: a claw lowers the mode of `T` relative to `L/2` by only `1.5 − 13/9 ≈ 0.056` per arity-3 claw, and an arity-2 claw is neutral (`1 + 3y + y²`). About 22 claws are needed to cover the offset from the root and arm.
  - This search covered only the arm leaf in this one class. It proves no minimality outside that class, and it proves nothing universal.

## Attacks and findings

1. **Fidelity.** The census computes the aggregate's per-leaf term exactly as the contract defines it: original leaves, `H_v = T − {v, s_v}`, `R_v = T − N[s_v]`, `F_p` from `Δ_p(T − v)` at the original rank `p`, `x` through `α` with the terminal difference included, and eligibility `p ≤ ⌊2α/3⌋`. The code encodes no active-tag weight and no relation, so the census makes no weight or relation claim to strike.
   - The shared rule that supply − capacity equal `S` on every instance is not met by the census, because it computes no transport side. The rows it reports are sign data on summands, not transport rows, so I do not strike the census for this.
   - The reported witness row did omit supply and capacity (marked "N/A"). I supply them above (R1), checked against `S` from independent sides.
2. **Completeness of the enumeration.** Confirmed at every order from two sides: set equality with an independent generator at orders 16–20, and Otter's counts at orders 19–22.
3. **Summand sign and zero extension.** Confirmed on `T_22/34`, the only known positive favourable-leaf summand at an eligible rank, and on the fixed points.
4. **"Max summand 0, attained".** True but uninformative. Every attaining row is a vanishing tagged family (R2). The return's sentence calling leaf 19 "the row with summand exactly 0 … the closest any row in orders 20–22 comes to positive" is wrong on both counts:
   - leaf 19 is one of 2,955 zero rows at order 20 alone;
   - on the only meaningful scale, the ratio `q(p)/q(p−1)`, zero rows are not close to anything, and the nearest rows that are not trivial still sit at ratio ≤ 29/36.
5. **Hall-check instrument ("standby").** Replayed copy-out (`f2_hallcheck_replay.txt`, with `F` derived by my code because `hall_check.py` takes `F` as an input and does not derive it), it reproduces both path-star fixed points: deletion-only and switch flows 1483 and 8033, with 1744/2025 and 9720/11691 arcs. So its switch path works.
   - Neither of the functions the docstring describes as step 4 (asserting supply − capacity = `S`) or as an (INV)-quotient flow under `Aut(T)` exists in the file.
   - The allocation required the literal (HALL) check only at a positive-summand row. None exists at orders ≤ 22, so F2's decision not to run it is correct under the allocation's own terms.
6. **The structural hint in the return's remaining obligation (2) points the wrong way.** Pendant paths off a hub of bare leaves make the tagged family vanish (R2), so no push past zero comes from there. The census and R3 point to hubs with arity-3 claws (the `T_m` arm tag). In the path-star class, that mechanism first yields a positive summand at order 91.
7. **Quantifiers and scope.** The return claims nothing universal. Its grades are `bounded_computation`. Its alias section is correct: it proposes no key.

## Mechanism-equivalence and fence check

The return proposes no mechanism. Its census is scalar data on the summands of (WID), so none of the ten refuted keys is engaged. No closed region is re-proved: the rows lie in the eligible lower region, and orders 20–22 are not covered by the closed order bands as a family.
- Census values enter no proof.
- No RTree wording appears.
- (LIFT), (DCB) and (TSB) are not used.
- It does not use the controller's prior. It cites Cycle 5's "no positive summand ≤ 19" only as an inheritance. My census replay independently covers orders 13–19.
- Claim identity: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` stays OPEN and untouched. The primary aggregate stays OPEN and untouched.
- No `E993-R30-…` candidate is proposed by F2 or by me. The census, R1, R2 and R3 are bounded records, suitable for a scope note under the Tier-3 bounded records, not keys.

Standing letters (a)–(d) of gate ruling 30: the return supplies bounded records toward (d), a census horizon, and nothing toward (a)–(c). It gives no `proved_informal` restricted (HALL), no (CUT) candidate, and no Lean-ready statement.

## Certification audit

Backed, and replayed by me:
- the counts 823,065, 2,144,505 and 5,623,756;
- eligible trees, rows and summand rows for orders 20–22;
- max 0 and min −13,260 / −25,194 / −48,450;
- "zero positive summands" at orders 20–22;
- the witness's `α`, `x`, `|F|`, `S` and `Δ` values;
- `K_{1,12}` (−165 × 12, 1980/3960/1980);
- the erratum R30-E-p;
- the per-order digests as digests of the summary JSON.

Struck:
1. "self-test … `count_free_trees(n)` for `n = 1..18` … re-run from the copy-out replay directory, digest `e21e70e4…`". The shipped `census_f2.py` contains no `count_free_trees`, and `selftest-result.json` holds no counts for orders 1–18; it holds only orders 19 and 20 and `K_{1,12}`. The fact itself is true, and I re-derived it independently, but the shipped evidence does not back this literal.
2. "|F_p| (recorded per tree internally…)". The script records no `|F_p|`.
3. "the ledger of record … reproducible bit-for-bit". The digest covers 12 summary fields, not per-row data. The replay reproduces those summaries, which I confirmed with a second instrument; no per-row ledger exists.
4. "Leaf 19 is the row with summand exactly 0 … the closest any row … comes to positive". Struck (Attacks 4).
5. "the ready, self-tested `hall_check.py` literal max-flow / (INV)-quotient-flow instrument", and the docstring's claim of an assertion that supply − capacity = `S`. No quotient flow and no assertion exist in the code. The switch path had not been exercised by F2; it has now been exercised by me (Attacks 5).
6. "exact integer arithmetic throughout". This holds for the census. `hall_check.py` passes `float("inf")` as a DFS bound, which is harmless but not literally integer-only.

`RETURN-draft.md` is an uninventoried working note in F2's scratch directory. It contains no certification literal beyond those in the return.

## Verdict

verdict: retained_narrowed
headline_resolved: no

The census is retained at `bounded_computation`: every free tree of orders 20, 21 and 22 was scanned, and no favourable-leaf summand is positive at any eligible rank. Two independent instruments agree on every reported count. The decisive `T_22/34` question is resolved in the census's favour, because that row has order 91. The return is narrowed by the six struck literals above and by the correction to the successor hint. No statement here is `proved_informal`.

## Remaining obligation

Exact: find the smallest eligible `(T, p)` with a positive favourable-leaf summand, and decide literal (HALL) there, with the switch arcs' role recorded.
- It is known that no such row exists at orders ≤ 22 (two instruments). `T_22/34` (`n = 91`) is one, and there (HALL) holds per the Cycle 5 record.
- In the path-star class (arities ≤ 7, arm leaf), `n = 91` is the smallest (R3, critic-derived). The gap is orders 23–90 outside that class.
- A successor should prefer a structural search over hubs carrying arity-3 claws with mixed side branches and more than one arm, testing every leaf and not only the arm, over an order-23 exhaustive census (14,828,074 trees). On evidence R2, an order-23 census is expected to be negative: the closest ratio that is not trivial was only 29/36 at order 22.
- (HALL) remains OPEN at full scope.

## Artifact inventory

All paths below are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-crit-F2-T/`.

- `seals.py`: seal and member-digest recomputation.
- `copy/f2/`, `copy/f2replay/`: copy-out of F2's artifacts; digests are listed in the audit.
- `own/crit_lib.py` (`1812c59b…`): the independent instrument.
- `own/fixed_points.py` (`674d7489…`): fixed points and the literal weight enumeration.
- `own/wid_small.py` (`9ca44085…`) → `wid_small.json` (`c51aa926…`).
- `own/census_crit.py` (`8d818e84…`) → `order13.json` … `order22.json`. Digests: order 20 `94eaa622…`, order 21 `887796a6…`, order 22 `9793bcd0…`, with body SHA-256 `f1106072…` for order 22. Log: `census_big.log`; PID 76556, exited.
- `own/gen_crosscheck.py` (`bcdf405a…`) → `gen_crosscheck_16_19.json` (`21cde925…`), `gen_crosscheck_20.json` (`ee37309f…`).
- `own/witness.py` (`ade1711e…`) → `witness.json` (`042dbc39…`).
- `own/flow_crit.py` (`2179e70f…`) → `witness_flow.json` (`76c5282b…`).
- `own/f2_hallcheck_replay.txt`: replay of F2's `hall_check.py`.
- `own/t22_check.txt`: `T_22/34`, giving 91 / 67 / −498754180547001418536.
- `own/ps_search2.py` (`dac3776a…`) → `ps_hits2.json` (`ab1cc194…`).
- `own/ps_search.py` (`8efbeb1c…`): stopped and superseded; no output.
