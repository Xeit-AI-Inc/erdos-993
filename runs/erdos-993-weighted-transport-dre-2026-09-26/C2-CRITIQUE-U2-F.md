# Critique

Critic `C-U2-F` (orientation F, falsify) of seat `U2`, route `C2-U-02 EQUITABLE-PARTITION-LIFT-AND-CB-SWITCH-NETWORK`, Cycle 2 Stage 4, r30 (Erdős #993).

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I followed no other VerityOS pointers: no memory, conversations, modules, skills, logs or decisions.

**Model disclosure.** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read boundary.** I read the sealed dispatch `control/dispatch/c2-stage4/DISPATCH-C-U2-F.md` after verifying its digest. I read the capsule `U2-PACKET-MANIFEST.json` and its 13 listed members: the protocol, the common brief, my own U2 section of `C2-CRITIC-ATTACK-BRIEFS.md` (lines 1–11 and 119–145 only), `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `C2-ALLOCATION.md`, `C2-STAGE1-GATE.md`, `SOURCE-DIGESTS.json`, the Stage 2/3/4 manifests, `PATH-CHECK-U2.json` and the return. I read one frozen source, `sources/lower-region/instruments/cb-switch-cut/RESULTS.json`, and verified its digest before comparing.
- I copied the return's inventoried scripts out of `scratchpad/c2-U2-replay/` and `scratchpad/c2-U2/`. I listed those two directories non-recursively and ran `grep` on the copies inside my own scratch.
- Two replayed scripts (`run_all.py` via `cb_common.py`, and `cb_scan.py`) import `sources/lower-region/inputs/ordinary_tree_checked.py` from `sources/`. I ran them with `python3 -B` and `PYTHONDONTWRITEBYTECODE=1`, so no bytecode was written under `sources/`. `sources/lower-region/inputs/` holds only `ordinary_tree_checked.py` after every run.
- I read no other return, critique, adjudication, Cycle 1 record, registry, other root or external source. I ran no `find`, `grep`, `rg` or `ls -R` above my grant. I used no network and installed no packages.
- One background job (`cutlift.py`, first version) was killed by literal PID 42724 after I found that PID through `lsof -t` on its own output file. That was a targeted query, not a process listing. No job is running at this write.

## Identity and seal audit

- Dispatch digest: `ec8a3cd8a9818ee8d54f8c6d1c3b6d5c13df4bf8bd917feaedaa811be3abfd88`. Recomputed; it matches.
- Capsule inner seal: `292e6685125c9e267c082a2b39f074229ea4d83b3cb4583d9fed69a837786c54`. Recomputed canonically (sort_keys, `(",", ":")`, no trailing newline, `seal_sha256` removed); it matches. All 13 members match both declared bytes and SHA-256.
- Stage 2 seal: `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`. Recomputed; it matches.
- Stage 3 seal: `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d`. Recomputed; it matches. The return (`3acbdd0a…df437`, 40000 bytes) is a member.
- Stage 4 dispatch-manifest seal: `a361cd175e7c3968cdf2a8d14f92e9b2b5883b018bd72e837f54f26ce38da383`. Recomputed; it matches.
- Return digests. All seven per-module SHA-256 values in `scratchpad/c2-U2-replay/` match the return's list (`run_all.py` `6ece1fda…`, `cb_common.py` `462d7a12…`, `cb_weighted_gf.py` `8e0292c5…`, `lift_toy.py` `671079f3…`, `cb_mechanism.py` `35c2585e…`, `coarsening_impossibility.py` `5bc9f989…`, `cb_target_rows.py` `926b14a4…`). The development copies in `scratchpad/c2-U2/` are byte-identical for these seven.
- Replay. Run copy-out-first in my scratch, `run_all.py` prints the combined digest `218b5d3bf81257e3adca19d887014d537a8ed0909ad25593d45e43506b5dba4c`, which matches the return. Its `run_all_RESULT.json` is byte-identical to the shipped one.
- `sources/lower-region/instruments/cb-switch-cut/RESULTS.json`: `873cf9229923153d7626c6d721ab40b8ace8488b51343c66a00b6cfb0449d5d5`, verified against `SOURCE-DIGESTS.json` before I read it.
- Process record, as the brief asks:
  - U2 wrote `sources/lower-region/inputs/__pycache__/` and then deleted it. U2 disclosed this. The controller's re-hash found 981/981 files intact.
  - U2 verified one digest after reading the file rather than before (`RESULTS.json`). U2 disclosed this too.
  - New finding: the return's own replay command (`python3 run_all.py`, without `-B`) recreates that `__pycache__` write under `sources/`, because `cb_common.py` puts `sources/lower-region/inputs` on `sys.path`. So the return's claim "copy-out-first: every module the entry point imports already sits beside it in this directory" is false. `ordinary_tree_checked` is imported from `sources/`.
- Registry and award labels. The return names no award label other than the Cycle 1 ones. It proposes two candidate keys, `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT` and `E993-R30-CB-TRANSPORT-EQUITABLE-PARTITION-RIGIDITY`. Neither is registered (Ruling 18). The alias check is in §Mechanism-equivalence.

## Independent re-derivation

My instrument lives in `scratchpad/c2-crit-U2-F/own/`. It shares no code with U2 and uses only the standard library with exact integers. It has four parts:
- a literal `CB(d, m)` builder;
- a tree test (connected with `n − 1` edges);
- a generic forest independence-polynomial DP that works with arbitrary deleted vertex sets;
- `q_v(j) = i_j(T − {v, s_v}) − i_j(T − N[s_v])` computed on the literal tree.

The selector is `Δ_p(T − v) < 0`, computed by the DP on the original tree. `x` is computed through rank `α`, including the terminal difference.

For the supply and capacity side I derived my own closed form, with `F` equal to all leaves:

`W(x) = x²(1+2x)^{dm} + m·d·x²(1+x)^{d−1}(1+2x)·Br^{m−1}`, where `Br = (1+2x)^d + x(1+x)^d`.

- The `v` tag is active iff `r ∈ B`, because `W_v = {r}`. That forces `s` and every choke out.
- The tag `c_ij` is active iff `u_i ∈ B`, because `W_{c_ij} = {u_i}`.

It is algebraically the same as U2's `W`. I checked it against literal brute-force enumeration (every independent set, literal `w_F`) at every rank on `CB(2,2)`, `CB(2,3)`, `CB(1,4)`, `CB(3,2)`, `CB(5,2)`, `CB(2,4)` and `CB(3,3)`: an exact match everywhere.

`S` is computed from the definition, `Σ_{v∈F_p} [q_v(p) − q_v(p−1)]`, on the literal tree. It is a different computation from `W`, so `supply − capacity = S` is a real (falsifiable) check here.

**The target rows** (`rows.py` → `rows_RESULT.json`, sha256 of canonical payload `ccda128a…110a`):

| row | n | α | x | window | `\|F_p\|` (strict selector) | supply, capacity, `S` vs U2 | `supply − capacity = S(definition)` |
|---|---|---|---|---|---|---|---|
| CB(2,5)/10 | 28 | 16 | 8 | [10, 10] | 11 = all leaves | match U2's **JSON**; **U2's RETURN table is wrong** (below) | yes |
| CB(8,86)/460 | 1465 | 775 | 458 | [460, 516] | 689 = all leaves | exact match | yes |
| CB(8,89)/476 | 1516 | 802 | 474 | [476, 534] | 713 = all leaves | exact match | yes |
| CB(8,92)/492 | 1567 | 829 | 490 | [492, 552] | 737 = all leaves | exact match; `S` byte-equal to the frozen `RESULTS.json` `aggregate` | yes |

How the selector was checked:
- `Δ_p(T − v) < 0` was computed for `v` and for three `c_ij` at different branch and pair positions. All four agree.
- All `c_ij` are equivalent under `S_d ≀ S_m ⊆ Aut(T)`, and the `q` polynomials of the three agree exactly.
- So for `CB(8,86)` and `CB(8,89)` I derive `F_p` = the whole leaf set myself. U2 left this as inherited; it is now re-derived.
- Every row has `S < 0`.

**Other quantities.**
- Branch types: 9 with the choke present (0–8 leaves) plus 45 with it absent (`(a, b)`, `a + b ≤ 8`) gives 54. Confirmed.
- `C(139,53)`, `C(142,53)` and `C(145,53)` are exactly the integers U2 prints. What these numbers count is qualified in §Attacks, A6.
- Candidate 1 (the lift) is re-proved in §Attacks, A1.
- The `CB(2,2)/5` mechanism facts reproduce: `|I_6| = 41`, `|I_5| = 152`, supply 76, capacity 148, mixed and deletion-only max-flow both 76, 15 + 42 orbit classes.

## Attacks and findings

**A1 — Candidate 1 (equitable-partition flow lift). Correct; retained at `proved_informal` (STATED).** I re-proved both directions myself.
- (⇒) is class summation. It needs supply and capacity to be constant on classes, and nothing else.
- (⇐), rows: with `f ≡ F(C_s,C_t)/(|C_s|·r)` on the arcs between two classes, the row sum at `u ∈ C_s` is `Σ_{C_t} F/|C_s| = supply(C_s)`, exactly. This uses the source-side count `r` being constant.
- (⇐), columns: the column sum at `t ∈ C_t` is `Σ_{C_s} r'·F/(|C_s| r) = Σ F/|C_t| ≤ cap(C_t)`. This uses `|C_s| r = |C_t| r'`, which is double counting (and holds as `0 = 0` when `r = 0`), and the target-side count `r'` being constant.
- Integrality: the polytope has the bipartite incidence matrix (TU) with integral right-hand side. It is nonempty (the averaged `f` lies in it) and pointed (`f ≥ 0`), so it has an integral vertex. Equivalently, integral max-flow applies. "Saturating" is preserved because the source rows are equalities in the polytope.
- The lemma needs exactly: constant supply and capacity on classes, plus two-sided local regularity. No group, no tree, no eligibility.

Critic-derived strengthening (proved here; STATED): **the Hall-form converse is constructive for equitable partitions.**
- If a family `X_Q` of source classes has quotient deficit `Σ_{X_Q} |C|w − Σ_{N_Q(X_Q)} |C|w > 0`, then `X := ∪X_Q` is an original deficient cut with `N(X) = ∪N_Q(X_Q)` and identical sums.
  - `⊆`: an arc `B → A` with `B ∈ C_s` forces `r(C_s, C_t) > 0`.
  - `⊇`: `r > 0` forces `r' > 0`, so every member of `C_t` has an in-neighbour in `C_s ⊆ X`.
- Corollary (equitable analogue of INV's reduction, obtained by LP averaging with no supermodularity): **(HALL-COND) holds for every `X` iff it holds for every union of equitable classes.**
  - Hall on class-unions gives quotient Hall.
  - Quotient Hall gives a quotient flow (Hall/max-flow on the finite quotient).
  - Candidate 1 (⇐) lifts that to an original flow.
  - An original flow gives Hall for every `X`.
- This is exactly the "exhibit the invariant cut" step that Ruling 16 requires, for equitable quotients.
- Exercised on `CB(5,2)/7` (`cutlift_RESULT.json`): the quotient cut lifts to an original cut with deficit 5376 in both spaces. That instance is **not eligible** (`x = 8`) and `F_p = {v}`, so it is a mechanism test only and says nothing about (HALL).

**A2 — Is Candidate 1 "not (LIFT)"? The return's distinction is mis-stated.**
- By `SEMANTIC-CONTRACT.md` §1.2, (LIFT) is exactly "a saturating quotient flow lifts to a saturating original flow", which is the same task as Candidate 1's (⇐). The supermodular-maximizer argument belongs to the converse and to INV. It is not the content of (LIFT).
- Every orbit partition of a group preserving the relation and the weights is equitable. So **Candidate 1 is a strict generalization of (LIFT)**: its hypothesis is weakened from group orbits to equitable partitions. It is not "a different, strictly simpler tool for a different task."
- Mathematically, (LIFT) is the orbit special case of Candidate 1. Together with A1's converse, Candidate 1 also generalizes the "Hall ⇔ quotient Hall" part of INV.
- The registration must record (LIFT), and the quotient clause of INV, as special cases (a partial mathematical alias on the orbit sub-case), not as unrelated keys.
- Minor wording: "partitions that are not unions of automorphism orbits" is wrong. Every class of a partition coarser than the orbits is a union of orbits. What is meant is "not the orbit partition of any group of automorphisms".
- The toy (`C4 ⊔ C6`) is correct as a witness to that meaning: there are 4 side-respecting `Aut` orbits, and the 2-class partition is equitable with `r = r' = 2`.

**A3 — Candidate 2's headline is refuted by exact computation (critic-derived).** The return asserts two things:
- "any equitable partition of this relation must resolve at least the per-arm `(a_i,b_i)` (equivalently, at least the full `S_d ≀ S_m` branch-type histogram)", and that the 54 types are "the genuine minimal granularity";
- in the script docstring: "no partition strictly coarser than the full per-arm-type (Aut(T)-orbit) histogram is equitable".

I computed the **coarsest admissible equitable partition** by colour refinement on the literal network (`cr.py`, `cr_big.py`, `cr_pos.py`). The initial colours are (side, `w_F`), so every class has constant weight. Every result was re-verified explicitly: equitable on both sides, weights constant, the orbit partition refines it, and the quotient max-flow equals the original max-flow.

- **Eligible rows `CB(1,m)`** (the full literal network):

  | row | orbit classes | coarsest equitable classes |
  |---|---|---|
  | `CB(1,7)/10` (n = 24) | 147 | **11** |
  | `CB(1,8)/11` (n = 27) | 224 | **13** |
  | `CB(1,9)/12` (n = 30) | 324 | **15** |

  - The merges include positive-weight sources from different histograms, for example `A(0,1)` vs `A(1,0)` next to five `P(1)`. They also merge heads `s` and `v`, which no automorphism does.
  - On `CB(1,7)/10`: the quotient max-flow is 29190, equal to the supply and to the original max-flow. This is the first non-orbit application of Candidate 1 to an eligible transport network. It is `bounded_computation`.
  - Deletion arcs alone saturate on `CB(1,7)/10` and `CB(1,8)/11`, so switch arcs are not load-bearing there.
- **`d = 2`, not eligible:**
  - `CB(2,2)/5`: 54 coarsest equitable classes vs 57 orbit classes (U2's own 15 + 42).
  - `CB(2,3)/7`: 138 vs 141.
  - In both, the merges are zero-weight targets only.
- **Where the orbit granularity does appear coarsest (bounded).**
  - At the eligible `CB(2,5)/10`, colour refinement returns exactly the orbit partition: 1076 classes on the full network, 872 on the positive-weight network.
  - Removing zero-supply sources and zero-capacity targets leaves feasibility unchanged. On those positive-weight networks, colour refinement equals the orbit partition on every `d ≥ 2` instance tested: `CB(2,2)/5`, `CB(2,3)/6,7`, `CB(3,2)/6`, `CB(3,3)/8,9`, `CB(4,2)/7,8`, `CB(5,2)/8`, and `CB(2,5)/10`.

What survives, narrowed:
- Configurations `A` and `B` on `CB(5,2)` lie in different classes of **every** admissible equitable partition. Admissibility forces target classes to refine target weight. `A`'s switch arcs hit weights {1, 3} and `B`'s hit {2, 2}. Deletion targets have no choke and so are separated anyway.
- Hence the marginal-totals coarsening is not equitable, confirmed by replay.

The rigidity and "minimal granularity" statement is struck. The return's own scope note is the correct scope. Its proof paragraph and script docstring overclaim against it.

**A4 — Certification literal wrong in the RETURN table (`CB(2,5)/10`).**
- RETURN.md prints supply `275920` and capacity `412400`.
- U2's own generator (`run_all_RESULT.json`), my closed form, and my literal enumeration of `I_10` and `I_11` (185256 and 88506 sets, literal `w_F`) all give **supply 259980, capacity 396460**.
- The RETURN literal is 15940 too high in both.
- `S = −136480` is right. The table's `supply − capacity = S` column could not catch the error: see A5.

**A5 — Non-falsifiable checks (Ruling 17).**
- `cb_target_rows.py` sets `S = supply − capacity` and then reports `supply_minus_capacity_equals_S: True`. Every **yes** in the return's four-row table is therefore struck as a check.
- Only `CB(8,92)/492` had an independent side in the shipped evidence (the frozen `aggregate`). My instrument supplies the definition side for all four rows (A-table above), so the three d = 8 numeric rows are now backed.
- `cb_search_small_deficient.py` silently drops (`return None`) any instance where the network `S` disagrees with the polynomial `S`, and any instance where `F_p` is not the whole leaf set. A fidelity failure would be hidden rather than raised.

**A6 — Orbit-space literal mislabelled.**
- `C(m+53, 53)` is the number of branch-type histograms over **all** ranks, for one head. It is not the size of the orbit quotient of either layer.
- My exact count of `S_8 ≀ S_m` orbits (head state × histogram, rank-constrained; `orbits.py`, validated on `CB(2,2)/5` at 15/42):

  | row | source orbits (`I_{p+1}`) | target orbits (`I_p`) |
  |---|---|---|
  | `CB(8,86)/460` | 32679711368341187783680131875634392813 (38 digits) | 32790700508039735984424897097173056128 |
  | `CB(8,89)/476` | 130767212724564223897917583833021519977 | 131199551378014144037536617524191609446 |
  | `CB(8,92)/492` | 504442749902778247863465882195112269919 | 506067536207197899006015647949642414215 |

  This is about 28× below U2's figure. The conclusion (out of reach) stands; the label "exact size of the orbit space" does not.

**A7 — The small-CB scan claims are false.**
- The return says that "a full scan of `d ≤ 4, m ≤ 5` found **no** eligible `(d, m, p)` for CB with `n ≤ 48`", that "zero eligible CB instances" exist at `n ≤ 24`, and that "the smallest eligible CB row is `CB(2,5)/10` at `n = 28`".
- Facts, from my scan and U2's own `cb_scan.py` replayed:
  - U2's scan itself prints eligible rows at `CB(2,5)`, `CB(3,4)`, `CB(3,5)` and `CB(4,5)`, all with `n ≤ 48`.
  - The smallest eligible CB row is **`CB(1,7)/10` at `n = 24`**: `α = 15`, `x = 8`, `3·10 = 30 < 31`, with `S = −28812`, supply 29190, capacity 58002, and `F_p` all 8 leaves.
- Root cause: both U2 scripts take the window top as `(2α − 1)//3`, which drops `p = 2α/3` whenever `3 | α`. Their comment asserts `3p < 2α + 1 ⇔ 3p ≤ 2α`, but the code then uses the wrong floor. `cb_scan.py` also stops at `m ≤ 5`, so it misses `d = 1`.
- `cb_target_rows.py` itself uses the correct test, so the four main rows are unaffected.

**A8 — Unshipped cross-checks.**
- The return says `W` was "cross-checked against literal brute force on four independent small instances" and the ordinary polynomial "against the independent tree-DP … additionally on `CB(8,86)`".
- No shipped script performs either check. `cb_weighted_gf.py` has no test or `__main__`. The certification is struck.
- The facts themselves are true. My instrument re-established them: 7 brute-force instances, and the DP on all target rows.

**A9 — Other checks.**
- Overclaim: "switch arcs … load-bearing … first at `CB(8,86)/460`". My sector-deficiency scan (`scan_def2_RESULT.json`) uses my derivation `|R_{p−1}|/|R_{p−2}| = 2(dm−p+2)/(p−1)`, so whole-sector deletion deficiency holds iff `3p < 2dm + 5`. It finds no such eligible row for `d ≤ 6`, `m < 400`. The first rows are `d = 7` at `m = 109` (`n = 1638`, `p = 510`) and `d = 8` at `m = 86` (`n = 1465`). "First" is supported only within the CB family scanned, never over all trees.
- Eligibility, `x` through `α`, `IsTree`, literal `w_F` (the `B ∖ {v}` meets `W_v` test) and literal (D) ∪ (S): all pass on U2's scripts and on mine.
- There is no natural-number subtraction and no circularity in Candidate 1.
- No step assumes `S ≤ 0` or uses the budget.

## Mechanism-equivalence and fence check

- Neither candidate asserts (HALL-COND) for any `(T, p, X)`, and neither uses the deletion-only or Delete/Retag relations. **None of the ten refuted mechanisms is revived.**
- Candidate 1 is a generic LP/flow lemma. Its only near alias is (LIFT) together with INV's quotient clause, which are its orbit special case (A2).
- No closed region is re-proved. No census value enters a proof. There is no RTree wording.
- (LIFT) is not used to supply quotient feasibility. No quotient flow at the target rows is claimed.
- One point for the synthesis: my corollary (Hall ⇔ Hall on unions of equitable classes) does not by itself make the target rows tractable. On every `d ≥ 2` positive network I tested, the coarsest equitable partition *is* the orbit partition (A3).
- Fence §3.7 (sealed roots untouched): U2's replay command as shipped would write under `sources/`. The adjudicator should require `python3 -B`, or a copied evaluator, in any replay instruction.

## Certification audit

Struck:
- the RETURN table's `CB(2,5)/10` supply `275920` and capacity `412400` (correct: 259980 / 396460);
- every "`supply − capacity = S`: **yes**" in that table, as a check (non-falsifiable);
- "cross-checked against literal brute force on four … instances" and "cross-checked against the independent tree-DP … on CB(8,86)" (unshipped);
- "no eligible (d, m, p) for CB with n ≤ 48", "zero eligible CB instances … n ≤ 24" and "smallest eligible CB row is CB(2,5)/10";
- "exact size" of the orbit space, relabelled as the histogram count (A6);
- "any equitable partition … must resolve … the full `S_d ≀ S_m` histogram" and "genuine minimal granularity";
- "every module the entry point imports already sits beside it";
- "first at CB(8,86)/460", beyond the CB-family scope.

Backed, now by my instrument as well as U2's:
- `n, α, x`, eligibility, `|F_p|` (strict selector re-derived for all four rows), supply, capacity and `S` for `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, and `S` for `CB(2,5)/10`;
- the byte-match of `CB(8,92)/492` `S` with the frozen record;
- the `CB(2,2)/5` mechanism numbers;
- the 54 branch types, and the three binomial integers as integers;
- the replay digest `218b5d3b…4c`.

Grades:
- Candidate 1: `proved_informal`, STATED, needs an isolated second read. I agree the mathematics is complete.
- Candidate 2, as narrowed in A3: `bounded_computation`.
- The rows: `bounded_computation`.

## Verdict

verdict: retained_narrowed
headline_resolved: no

What is retained:
- Candidate 1, the equitable-partition flow lift (iff): correct, `proved_informal` (STATED). It must be registered as a strict generalization with (LIFT) and INV's quotient clause as its orbit special case, not as "not (LIFT)".
- The three d = 8 target-row aggregates, reproduced exactly by an independent instrument with a definition-side `S` and a strictly re-derived `F_p`.

What is narrowed:
- Candidate 2, to its exact witness: `A` and `B` are separated in every admissible equitable partition, so the marginal-totals coarsening fails. Its rigidity and minimal-granularity headline is refuted. On `CB(1,7)/10`, `CB(1,8)/11` and `CB(1,9)/12` (eligible) the coarsest equitable partition has 11, 13 and 15 classes against 147, 224 and 324 orbit classes.

What is struck: the `CB(2,5)/10` supply and capacity literals, the scan claims, the unshipped cross-checks, the non-falsifiable checks, and the orbit-space label.

Critic-derived results, attributed to `C-U2-F`:
1. The constructive Hall-form converse, and the corollary "Hall ⇔ Hall on unions of equitable classes" (proved on the face here; STATED).
2. The first non-orbit application of the lift on an eligible transport network (`bounded_computation`).
3. The smallest eligible CB row, `CB(1,7)/10`.
4. Positive-network colour refinement equals the orbit partition on every `d ≥ 2` instance tested (`bounded_computation`).
5. No whole-sector-deficient eligible CB row exists for `d ≤ 6`, `m < 400`.

## Remaining obligation

Exactly, still open:
- (HALL-COND) for every `X ⊆ I_{p+1}` on the full mixed networks of `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`, meaning either a saturating integral flow, or an exhibited `Aut`-invariant deficient cut (`X`, `N(X)`, both sums) sent for two-instrument confirmation.
- The certificate cannot materialize the orbit quotient: about `3.27·10^37`, `1.31·10^38` and `5.04·10^38` source orbits.

The two successor paths U2 names:
- Path (i), a coarser equitable partition: my bounded evidence argues against it for `d ≥ 2`. Colour refinement returns the orbit partition on every positive network tested with `d ≥ 2`, including the eligible `CB(2,5)/10`. The dramatic coarsening seen at `d = 1` does not recur there.
- Path (ii), a transfer-matrix or LP-duality certificate that processes the `m` branches in product form, or a direct switch-capacity lemma (T1's object): this is the live route.

Registration and correction obligations:
- Candidate 1 and the corollary need an isolated second read before registration (Ruling 18). The claim-distinction must name (LIFT) and INV as special cases.
- The `CB(2,5)/10` literals and the scan claims must be corrected in any record that carries them.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-crit-U2-F/`, SHA-256:

`replay/` holds the byte-identical copies of U2's seven replay scripts (digests as in the return) and `replay/run_all_RESULT.shipped.json` (U2's shipped output). `replay-dev/` holds copies of U2's development scripts and results, including `cb_scan.py` `826b1fe5…` and `cb_search_small_deficient.py` `0f5987ae…`.

| file | purpose | SHA-256 |
|---|---|---|
| `replay/run_all_RESULT.json` | my replay output; byte-identical to the shipped result; combined digest `218b5d3b…4c` | `c98006372f6e3fae2e31e6f694e068370ab45d59aeba2c93e03d4d597e078c61` |
| `own/crit_core.py` | instrument: builder, tree test, deletion DP, `q_v`, closed-form `W` | `56d7167b55202afb8095ac2f764d66aae83071fee1a5de333c5755dac2d560d7` |
| `own/rows.py` | brute-force `W` checks (7 instances) and the four target rows | `fec56a81faadc5b6080034a460c5d1a50e63833f983a75943f181be410cf35da` |
| `own/rows_RESULT.json` | output of `rows.py` | `576145613375d3c997e5150c5352a0658f05320d254c5ffe6ce7e93dc4b22b72` |
| `own/cr.py` | colour refinement, orbit comparison, Dinic, lift check | `548c22084a5681f61feb82e5de928a5d544110aae35232af5c33855858448a91` |
| `own/cr_RESULT.jsonl` | output of `cr.py` | `878b6b2fdcc33ed97e53cd46dc5ac117b524f614fc029c8fd04289508a098849` |
| `own/cr_pos.py` | colour refinement on positive-weight networks | `0b405ba82d4573094232c8fd564c77311752e22f5c9663406cc3fbd4e6f1a15f` |
| `own/cr_pos_RESULT.jsonl` | output of `cr_pos.py` | `d7fd0e300e628357c0f2758442e0fd660300f28343eda323a040a597393f28d6` |
| `own/cr_big.py` | eligible rows `CB(1,7..9)`, `CB(2,5)` | `a67dfd769be1d8208e2d9b7941ccf6bad04e30c05a7296018de5b48a49d2a235` |
| `own/cr_big_RESULT.jsonl` | output of `cr_big.py` | `15d042488481cec1a75317add28fe241005a7f9774e1b0a34f53912f7048854e` |
| `own/cb17_RESULT.json` | `CB(1,7)/10` with definition-side `S` | `d9132b0e97fa92849173b956bd8eaba602288f195751a066d6e3f3e1c8f8d07d` |
| `own/cr_detail.py` | lists merged classes (diagnostic) | `e94f952e59821b6c668fecb229abb4293282b35425c5a2633a44de1f7ead5419` |
| `own/cutlift.py` | quotient-cut lift demonstration | `3b30a9b4f11950cf45021404822589719cdf0dbb8775d8421f85e265335ada01` |
| `own/cutlift_RESULT.json` | output of `cutlift.py` | `7c1876c0334704172dd0b57fcd3b316200621fe09d0d9be455c2d4e5cd5309ef` |
| `own/orbits.py` | exact per-layer orbit counts | `df411aaf4fc2010521e4ac9188a5a66e6cc6660cb90bfc16327c04632ec2a664` |
| `own/orbits_RESULT.json` | output of `orbits.py` | `b28d0802d1ddcc5b4855b46c60567c93a6ffec8fddd0950a04386ad268a6a689` |
| `own/scan_def.py` | first sector-deficiency scan (slow); output shown in-session only; superseded by `scan_def2.py` | `0e436aba8d7be48fe8af7a8a8f1e22998b84f3a0879efaa4114583059995e184` |
| `own/scan_def2.py` | sector-deficiency scan, incremental | `6a895df04eb4f1c2eaec131c9367004409bb3e54c0b722d87af3e10fbf30ea05` |
| `own/scan_def2_RESULT.json` | output of `scan_def2.py` | `6cb1775926a86469007f99408948f4cea6daf27f29175ba8358af31f5b5b3b19` |

Replay: `cd` into `own/` and run `python3 -B <script>`. Only the standard library is used, there is no network, and nothing is written outside this directory.
