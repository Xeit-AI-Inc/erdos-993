# Critique

**Seat:** `C-T1-F` (orientation F, falsify), Cycle 3 Stage 4, r30. **Assigned return:** `T1`, route `C3-T-01 CB-CHOKE-FOREST-HALL-AND-SECTOR-ABSORPTION` (orientation T).
**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot.** I am operating within VerityOS. Boot reads: exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Per the dispatch I loaded no other VerityOS subsystem.

**Order.** I verified the dispatch digest, then read the dispatch, then booted, then read the protocol and the capsule. That is the dispatch's own order.

**Read-boundary disclosures.**
1. **Harness-injected context.** The host injected the project `CLAUDE.md` and the auto-memory index (`MEMORY.md`) into my context before any read. I did not open either file, and neither is used as evidence.
2. **What I read.** Only capsule members, the 14 inventoried T1 artifacts (copied out first) and my own scratch.
   - Not read: `sources/` (authorized, but not needed); any other return, critique or adjudication; any Cycle 1–2 record; the run-local registry; Mathlib.
   - So what I say about (NM) and the refuted keys rests only on their descriptions in capsule members (`control/C3-ALLOCATION.md`, `SOLUTION-CONTRACT.md` §3), not on registry text.
3. **Directory listings and process queries.** One non-recursive `ls` of my own scratch directories. To stop a harness-backgrounded job I also ran:
   - `lsof -t` on my own output file;
   - `ps -o … -p <literal PID>`;
   - `pgrep -P 88667`, which lists the children of that literal parent shell (no pattern, no full process listing).
4. **Background job.** The harness auto-backgrounded my first validation pipeline (`validate.py | tee`) at its 600 s window. I killed the Python process by literal PID `88718`; its `tee` (PID `88719`) exited with it. None of its output was used: the file was deleted and the run was replaced by `validate2.py`. No job was running at the final write.
5. **Script edit.** `crit.py` was edited once, after `out_crit.txt` and `out_window.txt` were produced. The edit only fixes a `None`-key crash in reporting when `ρ` is undefined, a case that never occurs at the three rows. Re-running it reproduced `out_crit.txt` byte-for-byte (checked with `cmp`).

## Identity and seal audit

**Seals and digests**

| Object | Result |
|---|---|
| Dispatch file `control/dispatch/c3-stage4/DISPATCH-C-T1-F.md` | SHA-256 `454679428035acb8b757f57c35306bd1c23ac71a8f3795b2320993e1025ed790`, matches the wrapper. It is not itself a member of the Stage 4 dispatch manifest, whose 13 members are the shared packet. |
| Capsule seal (`control/c3-critic-capsules/T1-PACKET-MANIFEST.json`) | Recomputed canonically: SHA-256 of compact key-sorted JSON without `seal_sha256`, no trailing newline = **`067e1b1ed3bc35157f6f012428266414e06e89484a56ea3f83f1f1f1b491f620`**, matches. |
| Capsule members | All 14 match their bytes and SHA-256. |
| Stage 4 dispatch manifest seal | `b57e5de137627d8526c12e5f54a2011683c1ba010f98450a8adace5f4e7ca3c7`, recomputed, matches. |
| Stage 3 packet manifest seal | `64c6c84aabe2392394f680abb3c8862a349f06a4f8043a9960b706f35b294797`, recomputed, matches. It lists the T1 return at `f7da309f…cc40`, which equals the capsule digest. |
| Stage 2 packet manifest seal | `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416`, recomputed, matches. |

- **Return's digest table.** All 14 T1 files (7 generators and 7 stdouts) copied out to `scratchpad/c3-crit-T1-F/replay/shipped/` hash exactly to the return's table.
- **Replays.** All seven generators were re-run with `python3 -B` in `replay/run/`. Every stdout is byte-identical to the shipped one.
- **Stage 3 read-boundary disclosures.** T1's items (boot-order deviation; nine non-recursive `ls` inside `cycles/`) match the return's own disclosure section. Weighed; no penalty.

**Claim identity touched**

| Key | Status and grade |
|---|---|
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (HALL) | OPEN |
| `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (WID) | formally_verified (C1-LA1) |
| `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` (INV) | proved_informal |
| `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (NM) | proved_informal |
| `E993-R30-TERNARY-COVER-SECOND-EIGENVALUE` | proved_informal |

Primary aggregate: untouched. T1's three proposed keys are dealt with under the fence check.

## Independent re-derivation

I built my own instrument from the semantic contract, never using T1's code as the sole evidence. It has three parts.

- **`own/rows.py`: exact polynomials.** Exact independence polynomials of `CB(d,m)`, `T − v`, `T − c`, `H_v`, `R_v`, `H_c`, `R_c`, derived by conditioning on `r`.
  - `n`, `α`, and `x` computed through rank `α` (the terminal difference is explicit).
  - `F_p` is derived per leaf type from `Δ_p(T − leaf) < 0`.
  - Supply and capacity come from a direct weighted class count (sector `y²(1+2y)^{dm}` with weight 1, plus `(1+2y)·m·d·y²(1+y)^{d−1}β^{m−1}` for active in-choke leaves).
  - `S` is computed separately from `q_v = i(H_v) − i(R_v)`, each factor a separately built polynomial.
  - WID `supply − capacity = S` is asserted from these two independent sides.
- **`own/brute.py`: literal network.** A literal graph, a tree test (edge count, then BFS connectivity), independent layers by enumeration, `F_p` from literal `Δ_p(T − v)` counts, literal `w_F` with `W_v = N(s_v) ∖ {v}`, literal (D)∪(S), and Dinic max-flow. WID is asserted against literal `q_v`.
- **Fixed points reproduced** (`out_brute_fixedpoints.txt`):

| Instance | n | α | x | F | supply / capacity / S | flow | arcs |
|---|---|---|---|---|---|---|---|
| `K_{1,12}`, p = 8 | 13 | 12 | 6 | 12 | 1980 / 3960 / −1980 | 1980, saturating | — |
| path-star (2,3,4), p = 7 | — | 11 | 5 | — | 1483 / 2701 / −1218 | 1483 | 2025 |
| path-star (2,2,4,3), p = 8 | — | — | — | — | 8033 / 13467 / −5434 | 8033 | 11691 |

  `CB(2,5)/10` reproduces the record 259,980 / 396,460 / −136,480.

**The three rows** (`out_rows.txt`, `out_window.txt`, `out_digits.txt`)

| Row | n | α | x | eligible window | F_p |
|---|---|---|---|---|---|
| `CB(8,86)` | 1465 | 775 | 458 | [460, 516] | all 689 leaves |
| `CB(8,89)` | 1516 | 802 | 474 | [476, 534] | all 713 leaves |
| `CB(8,92)` | 1567 | 829 | 490 | [492, 552] | all 737 leaves |

- `F_p` equals all leaves at **every** eligible rank (177 ranks). This is derived, not assumed.
- WID holds at every one of the 177 ranks, and at every rank of eight small CB trees (`out_validate2.txt`).
- `S < 0` at the first ranks.
- T1's digit counts (`Δ_x`: 326/337/349/408/479; `Δ_{x−1}`: 327/338/350/411/482) reproduce exactly.

**T1's model (Step 1).** For a private leaf `c_{ij}`, `W = {u_i}`, so a private tag is active exactly when its choke is in `B`. For r-free sources, `w_F(B)` is the number of present leaves in in-chokes. The arm tag `v` is inactive unless `r ∈ B`, because `W_v = {r}`. The sector has weight 1 and R0 has weight 0. Confirmed by the literal instrument, which computes weights from the definition, on every enumerated set.

**T1's exact literals, rebuilt from my own generating function** (`out_literals.txt`)
- The q = 1 O-class supply/capacity fractions `1325825212805/1338918371349`, `4727130817223/4772229963615` and `117301488813803/118383886278251` are equal to mine as exact fractions.
- The uncovered-supply percentages 17.158674 / 17.178670 / 17.193174 % reproduce from the same exact integers.
- T1's `gap_weight.py` treats `q = m`, `t = 0` as covered by Lemma 2.1 (it sets threshold 0 when N = 0), which is not a valid use of that lemma. At these rows the same strata are covered by Lemma 2.2 anyway, so the uncovered integer is unchanged.

**Lemmas 2.1 and 2.2.** Both re-derived; both statements are correct as stated.
- **2.1:** on `{∅,b,c}^N`, `|∂X| ≥ |X|·t/(2(N−t+1))`, tight at the full layer, so Hall holds for every X iff `3t ≥ 2N + 2`.
- **2.2:** LYM on `B_n` rescaled by the weight `k`, so weighted Hall holds iff `2k ≥ n + 2`.
- T1's matching probe (`gap_probe.py`, replayed) confirms the 2.1 threshold on the isolated lattice. It tests **23** `(N, t)` pairs (N ∈ {4,5,6,8}, t = 1..N), not 26.

## Attacks and findings

**F1 — Fidelity: `F` is hard-coded, and WID is never asserted.**
- `verify_model.py` sets `F = leaves` ("matches every computed row in prior cycles"). The q-class closed forms in `qclass_rows.py`, `coverage_analysis.py` and `gap_weight.py` assume all private leaves are tags. No T1 script derives `F_p` at rank `p` at any row. This breaks the shared rule "`F_p` DERIVED … never hard-coded 'all leaves'".
- No T1 script asserts `supply − capacity = S` on any instance. The return says it "never computes S(T,p)".
- Under the protocol, every T1 number downstream of this is struck **as T1's evidence**.
- The same numbers are **re-established by this critic**: `F_p` = all leaves is derived at all 177 eligible ranks, WID is asserted at all of them, and the q = 1 fractions and coverage integers are recomputed exactly from my own generating function. They therefore stand at `bounded_computation` on C-T1-F's instrument, not T1's.

**F2 — T1's "middle t-range" gap comes from its method, not from the network (critic-derived advance A1/A2).**

T1 fixes the in-choke leaf set (and hence ℓ), applies Lemma 2.1 to the ternary part alone, and reports that about 17.2% of O-supply is uncovered. It says closing this "needs either … a joint argument … or the switch arcs." Joint **deletion** suffices, and switches are not needed, for every family of sources not containing both `r` and `v`.

*Construction (C-T1-F).* Clone each r-free source `B` into `w_F(B)` marked copies `(B, x)`, one per active tag `x ∈ L_B`. Only use deletions that remove neither the mark `x` nor a choke. Then:
- The target `A = B − e` keeps the in-choke set `Q` and still has `x` active, so `(A, x)` is a clone of `A`.
- For fixed `(Q, x)` with `|Q| = q`, the clones of sources of size `p + 1` correspond one-to-one with rank `j = p − q` of the product poset `P_q = B_{qd−1} × {∅,b,c}^{d(m−q)} × {∅,s,v}`. The last factor is the arm, which acts as one more ternary position when `r ∉ B`; `v` is inactive and `s` is not a leaf.
- Clones of targets correspond one-to-one with rank `j − 1`.
- An element of type `(a, b)` covers `a` type-`(a−1, b)` elements and `b` type-`(a, b−1)` elements. The arcs between two types form a biregular graph, so a flow on the path of types spreads uniformly over the actual arcs.
- With `ρ_q = r_j / r_{j−1}`, the type-symmetric normalized-matching flow is a transport problem on a path. It is nonnegative iff, for every `a`: `ρ_q·T_{<a} ≥ S_{<a}` and `S_{≤a} ≥ ρ_q·T_{<a}`.
- If it is nonnegative and `ρ_q ≤ 1`, every source clone sends 1 and every target clone receives exactly `ρ_q`.
- Summing over `(Q, x)`: every r-free source `B` sends `w_F(B)`, every r-free target `A` with `q ≥ 1` receives exactly `ρ_q·w_F(A) ≤ w_F(A)`, and sector and R0 targets receive nothing.
- A saturating fractional flow implies (HALL-COND) for every subfamily. R0 and weight-zero sources add no supply.
- So **deletion-only Hall holds for every `X ⊆ I_{p+1} ∖ sec`** whenever the criterion holds for all `q`.
- (Context only, not used: this is an instance of the classical normalized-matching property of products of posets with log-concave rank numbers. The criterion is checked directly, so nothing is imported.)

*Verification.*
- `own/crit.py` checks the criterion with exact integers. At the three first ranks it holds for all `q`, with maximum `ρ_q` at `q = 1`:

| Row | exact `ρ_1` | decimal |
|---|---|---|
| `CB(8,86)/460` | `460421124882845/462938713343604` | 0.99456 |
| `CB(8,89)/476` | `1698319298589907/1707291739633300` | 0.99474 |
| `CB(8,92)/492` | `4838946572060835/4863675235331932` | 0.99492 |

- `own/window.py`: the criterion holds at **every one of the 177 eligible ranks**; the largest `ρ` anywhere is 0.99491564.
- `own/validate2.py` compares against literal max-flow on 69 `(tree, p)` instances over eight small CB trees:
  - The criterion never passes where the literal deletion-only r-free flow fails (no `CRITERION-UNSOUND`).
  - At `CB(2,4)/9`, `CB(3,3)/9` and `CB(1,7)/12`, T1's per-stratum rule leaves 96/1128, 216/1764 and 84/126 of O-weight uncovered. The criterion certifies these, and literal max-flow saturates.
- So T1's gap is refuted as a gap, and (CF-HALL) for every `X ⊆ O` (not only invariant ones) holds at the three rows.

*Grade.* The reduction is `proved_informal`, general in `d, m, p`; STATED at a review stage, so it needs an isolated second read. Its verification at the 177 ranks is `computer_assisted` (exact integers).

**F3 — T1's worry that capacity could be claimed twice inside O is unfounded even for its own certificates.**
- Each covered-stratum certificate sends `(Q, L, t)` to `(Q, L, t−1)`, or, for the Lemma 2.2 point, `(Q, L, 0)` to `(Q, L−y, 0)`.
- These target sets are pairwise disjoint across strata. The only possible collision is with `(q, ℓ−1, t = 1)`, which is never Lemma-2.1-covered because the threshold is at least 6.
- So Hall already held for any union of covered strata. This is moot now that F2 covers all of O ∪ S ∪ V.

**F4 — Full (HALL) at 174 of the 177 eligible ranks of the three rows, with deletion arcs only (critic-derived advance A3).**
- The sector at rank `p` is `{r, v} ∪ C`, with `C` of rank `K = p − 1` in `{∅,b,c}^{dm}`. The deletion bipartite graph onto sector targets is biregular (degrees `K` down and `2(dm − K + 1)` up). This is the (NM) double count.
- So every sector subfamily is deletion-Hall into sector targets alone whenever `K ≥ 2(dm − K + 1)`.
- At the three rows this fails only at the first eligible rank, where `2(dm − K + 1) = K + 1` exactly (460/459, 476/475, 492/491). It holds at every later rank.
- Sector targets are untouched by the F2 flow. Adding the two flows gives a saturating flow on the whole network using only deletion arcs.
- Therefore **(HALL) holds at `CB(8,86)`, p ∈ [461, 516]; `CB(8,89)`, p ∈ [477, 534]; `CB(8,92)`, p ∈ [493, 552]**. That is 56 + 58 + 60 = 174 eligible ranks (`out_combined.txt`).
- Literal check (`combined.py`): all 22 small instances that this combined certificate covers saturate under literal deletion-only max-flow. It is never unsound.
- Grade: `computer_assisted` at restricted scope. STATED; needs a second read before any registration. If registered, it is a SEPARATE key; (HALL) stays OPEN.

**F5 — First ranks 460, 476, 492: (O2) reduced to a sector-only statement (partial advance A4, not a proof).**
- Under the F2 flow, every r-free target `A` with `q = 1` keeps residual capacity `(1 − ρ_1)·w_F(A)`, and sector targets keep full capacity.
- The sector's only positive-weight exits are:
  - deletion into sector targets;
  - the `u_i`-switch (a choke with exactly one `b` and `ℓ ≥ 1` of its `c`'s) into V-type targets with `q = 1` and weight `ℓ`.
- So (HALL) at a first rank follows from **reduced-capacity sector Hall**: for every sector subfamily `X`,
  `|X| ≤ |N_D(X) ∩ sector targets| + (1 − ρ_1)·Σ_{A ∈ N_S(X)} w_F(A)`.
  This is sufficient, not necessary.
- Bounded evidence that it is plausible:
  - Aggregate: the residual on switch-reachable V targets is **33.33× / 34.49× / 35.65×** the whole sector's deletion deficit `|R_{K}| − |R_{K−1}|`.
  - The switch-free sector family `Z` (no choke with exactly one `b` and at least one `c`) has no positive-weight exit except sector targets. So `|∂Z| ≥ |Z|` is necessary for (HALL) itself.
  - Exactly, `|∂Z|/|Z| = 16.52 / 17.07 / 17.61`, and `|Z|/|R_K|` is about 3·10⁻⁷ (`out_zfamily.txt`). The formula was checked against literal enumeration on four small trees (`out_zfamily_check.txt`).
- These are single-family or aggregate tests, not Hall for arbitrary `X`. Not proved.

**F6 — The route's own obligations as T1 left them.** T1 is honest that (CF-HALL), (O1) and (O2) are not proved, and its grades say so.
- Its prose still misleads in two places:
  - Step 4 and the route-verdict paragraph say deletion-only Hall is "proved … for arbitrary subfamilies, on a precisely measured ≈82.8% of the choke forest's total source supply". That is Hall for every `X` inside the covered strata, whose supply is 82.8% of **O**-supply only (not S, V or the sector). It is not a Hall statement about the choke forest.
  - The claim that the gap "needs … the switch arcs" is refuted by F2.
- Where T1 says the S/V transfer is "straightforward but unattempted", F2 does it, and it is not a separate transfer: the arm is simply one more ternary factor.
- Step 5 lists "bounded_evidence" as a grade. That is a route-verdict term, not a grade under §4.

## Mechanism-equivalence and fence check

**T1's proposed key 1, `E993-R30-TERNARY-LEG-LATTICE-SHADOW-THRESHOLD`: mathematical alias of (NM).**
- `control/C3-ALLOCATION.md` describes (NM) as "the sector encoding over an induced perfect matching, the two cover-degree lemmas (`k` down, `2(N−k+1)` up), the double count".
- That is the same inequality, `|∂X| ≥ |X|·k/(2(N−k+1))`, on the same poset: legs `b–c` in states ∅/b/c.
- T1 separates them by "chain counting vs double counting" and "different posets". The first is a difference of proof method, not of statement. The second is wrong: the out-choke legs of an O source have exactly the sector's leg encoding.
- The only addition is the threshold arithmetic and the tightness of the full layer, which is a corollary. Recommend no new key; at most a scope note on (NM).

**Key 2, `E993-R30-CHOKE-IN-BLOCK-RANK-WEIGHTED-LYM-THRESHOLD`:** the classical LYM inequality with the weight `k` multiplied in. The return itself says "classical, standard". Registering it adds nothing new; recommend no key.

**Key 3, `E993-R30-CHOKE-FOREST-SAFE-STRATUM-DELETION-HALL`:** superseded by F2, which covers all r-free families at every eligible rank. Its 82.8% figure is a `bounded_computation` record, never a Hall statement.

**Refuted-mechanism check, T1.** T1's deletion-only per-stratum statements are scoped and never claimed universal. They are not `E993-R23-LITERAL-DELETE-ONLY-HALL` revived.

**Refuted-mechanism check, my own advance.**
- A1 is a per-tag (mark-preserving) fractional transport for the private tags only. It is verified row by row, it is not an injection, and it is not universal.
- The one leaf term that is positive at the first ranks, the arm tag `v` (the sector deletion deficit), is not handled tag by tag. F5 requires compensation across tags, from `c`-tag slack, and leaves it open.
- It is therefore not `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`, `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT` or the C6-F4 own-support rule revived at those keys' scope. I could not read the registry text of those keys (outside my capsule), so **the second reader should check this distinction against the registered statements.**
- A3 is deletion-only at 174 specific ranks and makes no universal deletion-only claim. The sector is deletion-deficient at the three first ranks, and the result says so on its face.

**Other fences.**
- No closed region is re-proved: all ranks are in the lower region, `3p < 2α + 1`, and CB is not one of the settled families.
- No census value enters a proof. The criterion is an exact finite check of stated inequalities per rank.
- No RTree wording; (LIFT) and (INV) are not used as supplying feasibility.

## Certification audit

**Backed by byte-identical replay, or by my own instrument**
- The 14 digests.
- "ALL_OK=True" on 6 small `(d, m)`. This is a model check with `F` hard-coded (F1).
- The q = 1 exact fractions.
- The coverage percentages and their digit counts 330/329, 341/341, 353/352.
- The `x`/`Δ` digit table.
- "Replays byte-identical".
- Tightness of the isolated lattice (Kuhn matching).

**Struck**
- **"26 `(N,t)` pairs"**, in two places. The shipped probe tests 23.
- **"a genuinely new elementary technique, not a re-scoping of anything already registered"**: alias of (NM) plus classical LYM.
- **"closing this gap … needs either … or the switch arcs"** as a claim about the network: refuted by F2.
- **"F = F_p(T) … fixed at the original rank p"** as T1's evidence: never computed in T1's code. The value is re-established by C-T1-F.

**Narrowed**
- "deletion-only Hall … proved … on ≈82.8% of the choke forest's total source supply" becomes "for every X contained in the covered O-strata, whose supply is 82.8% of O-supply". Superseded.

**Unverifiable by me (not struck)**
- The Step 0 registry keyword search ("443 claims", "23 hits"): the registry is outside my capsule.
- "no `__pycache__`" in T1's own directory. My replays used `-B` and left none.

## Verdict

verdict: retained_narrowed

headline_resolved: no

**What is retained**
- T1's Step 1 model (exact, confirmed literally).
- Lemmas 2.1 and 2.2 as correct statements. 2.1 is an (NM) corollary and 2.2 is classical, so neither is a new key.
- The q = 1 fractions and coverage integers, as `bounded_computation` records re-backed on my instrument.
- T1's candid statement that (CF-HALL), (O1) and (O2) are unproved.

**What is narrowed or struck:** the fidelity basis of T1's own numbers (F1), the novelty claims, the 26-pair literal, and the switch-necessity diagnosis of the middle range (refuted by F2).

**Critic-derived advances** (C-T1-F; each STATED at a review stage and needing an isolated second read):
- **A1.** The mark-clone product-poset reduction: `proved_informal`, general in `d, m, p`.
- **A2.** Deletion-only Hall for every source family without both `r` and `v`, at all 177 eligible ranks of the three rows: `computer_assisted`. This is (CF-HALL) for every `X ⊆ O`, and (O1).
- **A3.** Full (HALL) with deletion arcs only at 174 eligible ranks, every rank except the first at each row: `computer_assisted`, restricted scope, a separate key if registered.
- **A4.** At the three first ranks, a reduction of (O2) to reduced-capacity sector Hall, with aggregate slack of 33–36× and a necessary switch-free test at 16.5–17.6×. Not a proof.

**The headline.** Neither (HALL) nor the primary aggregate changes status. In my judgment the mathematics of A1 is complete at `proved_informal` for its stated scope. The first-rank case is open.

## Remaining obligation

Exact, and replacing T1's items 1–4:

1. **(HALL) at the three first ranks only**: `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, with `F` = all leaves (derived).
   - Sufficient: for every sector subfamily `X` (sources with `r, v ∈ B`),
     `|X| ≤ |N_D(X) ∩ I_p^{sec}| + (1 − ρ_1)·Σ_{A ∈ N_S(X)} w_F(A)`,
     with `ρ_1` = the exact rationals in F2 and `N_S` the `u_i`-switch images (a choke with exactly one `b`), weighted by the number of `c`'s in that choke.
   - Or, equivalently for the purpose, a fractional sector flow into sector targets (capacity 1) and those V targets (capacity `(1 − ρ_1)ℓ`).
   - The families to beat are the switch-poor ones. Pure switch-free families pass the necessary deletion test by about 17×; mixed switch-poor families are not tested.
   - If this reduced statement fails, that is not a cut. The flow on the r-free sources can be rebalanced, for example by off-loading V targets through the "delete v" exits, before any deficit means anything.
2. **Second reads of A1–A3.** Re-check the clone correspondence, the path-transport inequalities, the biregularity of the sector's deletion graph, and the 177-rank computation. Also check A1 against the registered text of the per-leaf and support-preserving refuted keys (F4 fence note).
3. **Toward a parameter-uniform statement (outcome-B candidate).** Prove the stochastic-dominance inequalities of `crit.py` analytically for all `CB(d, m)` at eligible `p`, via log-concavity of `(1+y)^{qd−1}(1+2y)^{d(m−q)+1}` and the position of `j = p − q` relative to its mode. Also prove the sector condition `K ≥ 2(dm − K + 1)` for all eligible ranks above the first. Then only the first eligible rank of each `CB(d, m)` would remain.
4. **Synthesis:** do not register T1's keys 1 and 2 (an alias and a classical fact). Key 3 is superseded.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-crit-T1-F/`. Everything is standard library, replayed with `python3 -B`, with no `__pycache__`.

- `replay/shipped/`: copied-out T1 artifacts (14 files, digests equal to the return's table).
- `replay/run/`: T1 generators re-executed. `out_*.txt` are byte-identical to the shipped files; `err_*.txt` are timing only.

**Own instrument, `own/`**

| File | SHA-256 | Purpose |
|---|---|---|
| `rows.py` | `25dd3aab624da424d5581b97b1efc57edd62a274f14c9c64ed170023ed867f4c` | Polynomials, n/α/x, derived `F_p`, WID |
| `brute.py` | `9384a8da90558977cfa2a330d3b8854264f5b2b50aeef5930521b9189858e511` | Literal network plus Dinic, fixed points |
| `crit.py` | `edaf807ca62017fad73de396784e658e2d07ae9a205a3080e86944e0a3aceef7` | Mark-clone path-transport criterion |
| `window.py` | `4e9c9292b9da01908fcbc5cc2f0d2703c162fb06ba2ade77d3444f5fb343a584` | All 177 eligible ranks |
| `validate2.py` | `238aa50a9191ce1e2c4bedf00689eec0cffbfdcd2014aed3a856da706c1688e0` | Literal validation on 8 small trees |
| `combined.py` | `900c1b61858ccd4f2b272fe5ed442a654d3c974a4072353e5bdee77c4412886f` | A3 literal validation plus rank list |
| `literals.py` | `2af38e0b96424dafa1b13f7b6efd063e6ac2c8007aaf748019025b5afb70e9b5` | T1 fractions, coverage, (O2) aggregate |
| `zfamily.py` | `815fae34c00f70ced58e1f3082d588661a190d70d29a7270b947bfddbec16ca0` | Switch-free sector family |
| `validate.py` | `4443677a6498faeb33fe97b2109a935823ef0c945a8b38033ec97e5f5e8ddfbf` | Abandoned (killed, PID 88718); no output used |

**Outputs**

| File | SHA-256 |
|---|---|
| `out_rows.txt` | `0cb8876ff0e4d70f861bb6df17bafeff4d201055cb8219de6737dc94af066f6f` |
| `out_brute_fixedpoints.txt` | `1eada538625b027c25255bdc715c6917cc2cbc4c31d203b1075df026c5438bff` |
| `out_crit.txt` | `7b928b2280a6707d50d0a4d703249a19f0af911fb584c983c37b18f7297ad263` |
| `out_window.txt` | `8eef544310209176d47655fab11bda696ad7cd02f8b84cc30c6b442e951a4388` |
| `out_validate2.txt` | `0702791984fa1d21cd98731e9c158e2b73db7f13ff98debc2c935e4ae7048ca3` |
| `out_combined.txt` | `6c01727150b6428a0a34238529b2eacfc034c58dd60274b2bd786fa65473cb5f` |
| `out_literals.txt` | `c1c559d8f5ab27875aad695f7436a59e7f8fe061cc7ff21e10c1f4e378c42a40` |
| `out_digits.txt` | `ad2a65bb18a5ac210d3f1b5359ee3b9e358cd39e06971e804400b4e9a608746c` |
| `out_zfamily.txt` | `b081eaaa8205721cf94645376227c39591254e01a2a7d03a3d5739ae2dfa7d15` |
| `out_zfamily_check.txt` | `3507facd8ca9fd6656c630281ed419e9fb3835160e308233b518dbc00d653bc1` |

**Replay:** `cd …/scratchpad/c3-crit-T1-F/own && python3 -B rows.py && python3 -B brute.py && python3 -B crit.py && python3 -B window.py && python3 -B -u validate2.py 1,3 2,2 2,3 3,2 1,5 2,4 3,3 1,7 && python3 -B literals.py && python3 -B -u combined.py && python3 -B zfamily.py`. `window.py` takes about 100 s and `combined.py` about 85 s. Each prints its own IMPORT LIST; `validate2.py` appends to its output file.
