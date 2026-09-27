# Critique

Critic `C-F2-U` (orientation U, formal/structural), Cycle 3 Stage 4, r30. Assigned return: seat `F2`, route
`C3-F-02 UNREACHABLE-CAPACITY-FAMILY-CLOSURE` (orientation F).

**Boot acknowledgment.** I am operating within VerityOS. Before anything else I verified the dispatch file's digest
(`95c5d244…6cae`, match) and then read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` for the boot. No other VerityOS file was opened.
Read-boundary disclosure: the harness put the project `CLAUDE.md` and the user auto-memory index into my session
context automatically. I did not open either one, and nothing from them enters this critique.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

All seals were recomputed canonically: SHA-256 of the key-sorted JSON with separators `(",", ":")`, `seal_sha256` removed, and no trailing newline.

| Object | Recomputed | Status |
|---|---|---|
| Capsule `control/c3-critic-capsules/F2-PACKET-MANIFEST.json` | `c6ec438745b6a7a9c598f74294ffe409deae5a4469ebac9e9f6446a335459ad8` | match |
| Stage 4 dispatch manifest | `b57e5de137627d8526c12e5f54a2011683c1ba010f98450a8adace5f4e7ca3c7` | match |
| Stage 3 packet manifest (capsule member) | `64c6c84aabe2392394f680abb3c8862a349f06a4f8043a9960b706f35b294797` | match |
| Stage 2 packet manifest | `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416` | match |
| All 14 capsule members (bytes + SHA-256) | — | all match |
| `RETURN.md` | `5a27881f…fba26d` (43430 bytes) | matches the capsule and the Stage 3 manifest |

Digests the return lists:
- The dispatch digest `38262b04…c34f` equals the Stage 3 manifest's `DISPATCH-F2.md` entry.
- `sources/lower-region/inputs/ordinary_tree_checked.py` rehashes to `a012bb78…498f533d` (16710 bytes), which equals its Stage 2 manifest entry.
- The `control/CLAIM-IDENTITY.run-local.json` entry `b8f3c2a1…d178508` equals the Stage 2 and Stage 3 manifest entries. I did not open that file because it is not a member of my capsule.
- The evidence digest `4305ffb5d639f52a68fa2bdcc7f1dc31e8366b03a88822ca8530c62da1b632c8` is the canonical-JSON digest of `F2-EVIDENCE.json`. The raw file bytes hash to `05b525cd…` instead; the return correctly calls its literal "canonical". I copied the 11 scripts and 7 JSONs out into `scratchpad/c3-crit-F2-U/replay/` and ran the return's full chain with `python3 -B` in the foreground (about 148 s). The run reprinted `4305ffb5…`, and every one of the 7 regenerated JSON parts is content-equal to F2's shipped originals, which are kept under `replay/orig/`. **Replay: VERIFIED.**

F2's read-boundary disclosures (the `ls scratchpad/` and the two harness auto-backgrounding incidents stopped via `TaskStop`) match `control/C3-STAGE3-READ-BOUNDARY-DISCLOSURES.json`. `TaskStop` is the harness's own control, not a literal-PID kill. I note this as process only. No output from the stopped runs appears in the evidence, and the replay confirms that.

## Independent re-derivation

**Own instrument.** It is written from SEMANTIC-CONTRACT §1 and uses the standard library only (`cfu_lib.py`, `cfu_rows.py`, `cfu_partA.py`, `cfu_partB.py`, `cfu_realroots*.py`).
- Graphs are adjacency bitmasks. Connectivity (BFS) and acyclicity (union-find) are checked as separate predicates.
- Independence polynomials use a min-degree leaf-elimination recursion, `I = (1+y)·I(G−ℓ−s) + y·I(G−N[s])`. This is a different method from F2's rooted two-state DP. On every network row it is cross-checked against brute-force layer counts.
- `x` is scanned through rank `α`, including the terminal difference.
- `F_p` is derived from `Δ_p(T−v)` on the original tree.
- `w_F` is literal: `v ∈ F ∩ B` with `B ∩ (N(s_v)∖{v}) ≠ ∅`.
- The relation is literally (D) ∪ (S), with `|N(u) ∩ B| = 2` and `u ∉ B`.
- Supply − capacity is asserted to equal `Σ_{v∈F}[Δ_{p−1}(H_v) − Δ_{p−1}(R_v)]`. The two sides are computed independently: layer enumeration on one side, the `H_v`/`R_v` polynomials on the other.
- Max-flow is Dinic on source → B → A → sink. The integral B→A flow is extracted and each constraint is checked. A negative control (target capacities halved) must fail to saturate, and it does (G_6: 30998 < 49422; T(7,2): 22801 < 33026).

**Fixed points reproduced before trust.** The code asserts each of these rows:
- `K_{1,12}/8`: 13 / 12 / 6 / 12 favorable, 1980 / 3960 / −1980, deletion-only saturates.
- Path-star `(2,3,4)/7`: 1483 / 2701 / −1218, flow 1483, 2025 arcs.
- Path-star `(2,2,4,3)/8`: 8033 / 13467 / −5434, flow 8033, 11691 arcs.

**Fidelity of F2's instrument (read line by line).** It passes on every item:
- `active_weight` counts active tags only.
- `transport_targets` implements the literal (D) ∪ (S).
- `favorable_leaves` works at the fixed rank `p` on the original carrier.
- `crossing_index` scans through `α` with zero extension.
- `aggregate_S` is computed from the `H_v`/`R_v` side, independently of the layer enumeration.

No fidelity failure was found, so no downstream number is struck on fidelity grounds.

**Network rows (own instrument).** Every row below is eligible, `F_p` equals all leaves, (WID) holds from two independent sides, and exactly one positive-weight target has no in-arc under the mixed relation. That target has weight 2, and it is the same whether reachability is taken from all of `I_{p+1}` or from the positive-weight sources only.

| Row | n | α | x | p | \|F\| | supply | capacity | S | gap mixed / del-only | mixed flow | **deletion-only flow** |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|---:|---:|
| G_3 | 14 | 9 | 4 | 6 | 6 | 253 | 527 | −274 | 2 / 24 | 253 | 253 |
| G_4 | 17 | 11 | 5 | 7 | 7 | 1542 | 2735 | −1193 | 2 / 42 | 1542 | 1542 |
| G_5 | 20 | 13 | 6 | 8 | 8 | 8875 | 14196 | −5321 | 2 / 76 | 8875 | 8875 |
| G_6 | 23 | 15 | 7 | 9 | 9 | 49422 | 73573 | −24151 | 2 / 142 | 49422 | **49422** |
| G_7 | 26 | 17 | 8 | 10 | 10 | 269507 | 380552 | −111045 | 2 / 272 | 269507 | **269507** |
| G_8 | 29 | 19 | 9 | 11 | 11 | 1448816 | 1964489 | −515673 | 2 / 530 | 1448816 | **1448816** |
| T(4,2) | 14 | 9 | 4 | 6 | 5 | 202 | 454 | −252 | 2 / 22 | 202 | 202 |
| T(5,2) | 17 | 11 | 5 | 7 | 6 | 1173 | 2267 | −1094 | 2 / 43 | 1173 | 1173 |
| T(6,2) | 20 | 13 | 6 | 8 | 7 | 6350 | 11155 | −4805 | 2 / 74 | 6350 | 6350 |
| T(7,2) | 23 | 15 | 7 | 9 | 8 | 33026 | 54302 | −21276 | 2 / 133 | 33026 | 33026 |
| T(8,2) | 26 | 17 | 8 | 10 | 9 | 167410 | 262182 | −94772 | 2 / 232 | 167410 | **167410** |
| T(9,2) | 29 | 19 | 9 | 11 | 10 | 833663 | 1257739 | −424076 | 2 / 406 | 833663 | **833663** |

Every value F2 reports for the rows it shares with this table is reproduced exactly: supply, capacity, `S`, gap 2, the no-in-arc target equal to `A_k`, the T(7,2) deletion-only gap 133, and the T(7,2) deletion-only saturation. Bold entries are rows F2 did not flow-check; they are critic-derived and `bounded_computation`. The brief asked for G_6 with deletion arcs alone: **G_6 saturates with deletion arcs alone.** The Dinic run takes 0.16 s, so F2's "infeasible" reflects its unit-augmenting Ford–Fulkerson instrument, not the size of the network.

**Part A (own c-state transfer).** The state is whether `c_j` is in the set:
- `a_{j+1} = y(a_j + b_j)`
- `b_{j+1} = (1+y)(a_j + (1+y)b_j)`
- the tail is `a_m(y + (1+y)^k) + b_m(y + (1+y)^{k+1})`, with no `e_m`.

This equals the literal-tree polynomial for m = 1..14, k = 0..3. From it, F2's d-state prefix `T_j = a_j + (1+y)b_j` satisfies `T_{j+1} = (1+3y+y²)T_j − y²(1+y)T_{j−1}` identically (checked j = 1..58), with `T_0 = 1` and `T_1 = 1+3y+y²`. F2's two-state derivation (A1) and assembly (A2) are also correct by hand.

The discriminant is `(1+3y+y²)² − 4y²(1+y) = y⁴+2y³+7y²+6y+1`, confirmed. So the eigenvalues are real for every y ≥ 0, and both are positive for y > 0 by Vieta. At y = 0 they are 1 and 0, so "positive for every real y ≥ 0" (Remaining obligation 1) is literally false at y = 0.

To m = 1500 on my own chain:
- `α(T(m,2)) = 2m+1` (the exact degree).
- `x(T(m,2)) ≤ m` for m ≥ 3, with x = 2, 3 at m = 1, 2.
- `x = m` exactly on 3..18, and the first slack is at m = 19.
- x = 288, 379, 1421 at m = 304, 400, 1500.
- `Δ_{m+2}(T(m,1)) < 0` for m = 2..1500.
- `Δ_m(T(m,2)) < 0` for m = 3..1500.

All of these reproduce F2.

**Part B.** Here I re-derived F2's two closed forms and then pushed past the step F2 left open, closing its item (b) completely; the result is written up in the next section.

## Attacks and findings

**Critic-derived advance (C-F2-U, attributed to me; STATED at a review stage, `proved_informal` pending an isolated second read). Theorem GK-SIGN.** For every k ≥ 1, at p = k+3 on G_k:
- (i) every one of the k+3 leaves is favorable;
- (ii) every per-leaf summand is strictly negative;
- (iii) `S(G_k, k+3) = −g(k+1) − 2^k − (k+2)·A(k) ≤ −(3^k + 2^k + (k+2)(2^k + 3^{k−1})) < −2`.

This closes allocation item 4(b) for every k ≥ 3, and it settles F2's open `|Δ_{k+2}(H_1)| > 2^k`: in fact `|Δ_{k+2}(H_1)| ≥ 3^k`.

*Notation.* `P = 1+3y+y²`, `Q = 1+2y`. `c^{(N)}_j = [y^j]P^N` and `d^{(N)}_j = c^{(N)}_j − c^{(N)}_{j+1}`. Then `h(N) = d^{(N)}_N`, `g(N) = d^{(N)}_{N+1}`, and `A(k) = c^{(k)}_k − c^{(k)}_{k+2} = h(k) + g(k)`.

*Lemma M (elementary; no real-rootedness needed).* For every N and every j ≥ N, `d^{(N)}_j ≥ 0`. Moreover `h(N) = g(N−1) + 2h(N−1)` and `g(N) = d^{(N−1)}_{N+1} + 3g(N−1) + h(N−1)`, with `h(0) = 1` and `g(0) = 0`. Hence `h(N) ≥ 2^N` and `g(N) ≥ 3^{N−1}` for N ≥ 1.

Proof:
- Convolution with P gives `d^{(N)}_j = d^{(N−1)}_j + 3d^{(N−1)}_{j−1} + d^{(N−1)}_{j−2}`.
- For j ≥ N+1 all three indices are ≥ N−1, so the induction hypothesis applies.
- For j = N, palindromy of `P^{N−1}` (centre N−1) gives `d^{(N−1)}_{N−2} = −d^{(N−1)}_{N−1}`, hence `h(N) = d^{(N−1)}_N + 2d^{(N−1)}_{N−1} ≥ 0`.
- Above the degree every `d` is 0.
- The two recursions follow from the same convolution. `g(1) = 1`, and for N ≥ 2, `g(N) ≥ 3g(N−1)`. ∎

*Deleted polynomials on the original carrier* (root 0; leaf 1; support 2 ~ 0 with leaves 3, 4; arms `0–a_i–b_i–c_i`):

| Leaf | `H − R` | leaf deletion `G_k − v` |
|---|---|---|
| 1 | `P^{k+1} − (1+y)²Q^k` | `P^{k+1} + y(1+y)²Q^k` |
| 3 (and 4) | `y(1+y)(P^k + Q^k)` | `(1+y)(1+2y)P^k + y(1+y)Q^k` |
| arm tip `c_i` | `y(1+y)P^k` (`W = {a_i}`) | `(1+y)(1+2y)P^k + y(1+y)³Q^{k−1}` |

*Summands.* Each is `[y^{k+3}] − [y^{k+2}]` of `H − R`:
- leaf 1: `2^k − g(k+1)`. The term `(1+y)²Q^k` has degree k+2 and top coefficient 2^k.
- leaf 3 (and 4): `(c_{k+2} − c_k) − 2^k = −A(k) − 2^k`. The term `(1+y)Q^k` has degree k+1.
- arm tip: `−A(k)`.

All three are negative by Lemma M. F2's B3 observation is therefore now proved for every k ≥ 1.

*Favorability at rank k+3:*
- Leaf 1: `Δ = −d^{(k+1)}_{k+3} − 2^k < 0`.
- Leaves 3 and 4 and every arm tip: the `(1+y)(1+2y)P^k` part contributes `−(d_{k+3} + 3d_{k+2} + 2d_{k+1}) ≤ −2g(k) < 0`. The tails have degree ≤ k+3, so they only add `0` or `−2^{k−1}`.

*Checks (own instrument, `cfu_partB.py`):*
- Every closed form and summand equals the literal-tree DP for k = 1..12.
- `S` and all three summands equal F2's printed values at k ∈ {3, 4, 5, 10, 20, 50, 100, 150, 200, 250}.
- Lemma M holds, with both recursions exact, for N ≤ 300.

*Consequence with the registered G_k key.* The key gives a unique no-in-arc target of weight 2 for k ≥ 3. Combined with (WID), (HALL-COND) at `X = I_{p+1}` holds on every G_k with k ≥ 3. That is the scalar necessary condition only, not (HALL). The composition is `proved_informal`, the grade of its weakest input.

**Findings on the return.**

1. **Item (a), `Δ_m(T(m,2)) < 0` as a "sharper equivalent target" (A5, Grades).** Only one direction is proved: `Δ_m < 0 ⇒ x ≤ m`, by the definition of x. The converse needs no rise between x and m. That is observed on 3 ≤ m ≤ 1500 (my scan finds `Δ_j < 0` for every j ∈ [x, m]) but it is not proved. The text calls the same target both "sharper equivalent" and "strictly weaker"; it is formally the stronger statement. The label should read "sufficient condition; equivalence observed to m = 1500".
2. **The mode-estimate route is narrower than A5 suggests (critic-derived, `bounded_computation`).** Exact Sturm counts show:
   - `I(T(m,2))` is **not real-rooted** for any 3 ≤ m ≤ 25. For example, m = 3 has 5 real roots out of degree 7.
   - The chain polynomials `T_j` (F2's `P_j`) are already non-real-rooted at j = 2: `T_2 = 1+6y+10y²+5y³+y⁴` has 2 real roots.

   So no Newton/Darroch argument applies to `T_{m−1}` or to the assembled polynomial. The real eigenvalues of the transfer matrix at real y ≥ 0 say nothing about where the coefficients peak.

   Lead for the successor:
   - The mean `μ_m = I′(1)/I(1)` satisfies `μ_m − ρm → 0.5915` (stable to four decimals for m ≥ 100), with `ρ = y·λ₊′/λ₊ |_{y=1} = 5(3+√17)/(17+5√17) ≈ 0.946830`.
   - So `slack/m → 1 − ρ ≈ 0.05317`. This is the explicit algebraic constant F2's Remaining obligation 1 predicts.
   - `x ∈ {⌊μ_m⌋, ⌈μ_m⌉}` on every row I checked.

   A proof needs a mode–mean bound for this non-real-rooted family, for example a local limit theorem from the λ₊ saddle, plus the finite check where `μ_m > m` (m ≤ 11).
3. **The C1 sentence for T(m,2) conflates two different objects.** "the analogous statement for T(m,2) is item (a)'s `S(T(m,2), m+2) ≤ −2` EQUIVALENT target" is wrong: item (a)'s premises are eligibility (`x ≤ m`) and favorability (`Δ_{m+2}(T(m,1)) < 0`), not the sign of S. Also, the "analogous proved uniqueness" of the T(m,2) no-in-arc target is cited from SR-C2-4. That is outside my read boundary, and the return itself calls the T(m,2) record CONDITIONAL. The G_k half of C1 is a correct one-line corollary of (WID) plus the registered key. **It is a scope-note sentence, not new content.** The T(m,2) half stays conditional; it is observed with gap 2 for m = 4..9.
4. **Where the deletion-only record is not backed.** `f2_validate.py` calls `network_row(..., verify_max_flow=True)` with the default `deletion_only=False`, so on G_3–G_5 and T(4..6,2) it verified MIXED saturation only. The printed summary of `f2_partC.py` says deletion-only saturation is "DIRECTLY verified … on G_3,G_4,G_5 (… mixed==deletion trivially since flow==supply …) and on T(4,2),T(5,2),T(6,2)". That inference is invalid: mixed saturation does not imply deletion-only saturation. The fact itself is true; my instrument checks it on every one of those rows.
5. **Deletion-only observations and the refuted key.** The return says no distinction from the refuted mechanisms is owed, but its C2/C3 deletion-only observations sit close to `E993-R23-LITERAL-DELETE-ONLY-HALL`. One sentence was owed: this is a bounded row record under the ACTIVE weight on two families, not a deletion-only Hall claim. Deletion-only Hall on the CB root-plus-arm sector first fails at `CB(8,86)/460` (allocation, standing state). There is no revival in substance.
6. **Internal inconsistency on G_6.** The table says "not attempted (too large)", while C2 and the `f2_partC.py` header say a G_6 flow was attempted and timed out. Neither version holds: my rows show G_6 flow is cheap.
7. Items that hold:
   - The B4 proofs are correct: `Δ_{k+2}(R_1) = −2^k`, and `Δ_{k+2}(H_1) < 0` via real roots `(3±√5)/2`, Newton, and palindromy.
   - The symmetry reduction in B1 is correct. Its code comment says the automorphisms were "verified structurally", but no code checks this. My literal-tree DP confirms all arm tips give equal summands for k ≤ 12.

## Mechanism-equivalence and fence check

- The route proposes no transport mechanism, so it is not one of the ten refuted keys. The deletion-only observations are bounded rows; see Finding 5 for the one missing sentence.
- It re-proves no closed region, and the G_k key is cited rather than re-litigated. G_3 lies in the closed order band `n ≤ 2p+2` (14 ≤ 14), so its sign is already known there. Theorem GK-SIGN is new content for k ≥ 4, where `2p+3 ≤ n = 3k+5 ≤ 4p−8`.
- The sign of S on G_k is not part of the G_k key's statement (eligibility; tags 3, 4 favorable; unique no-in-arc target of weight 2; gap 2). By the allocation's item 4(b) it was open, so GK-SIGN extends the key rather than aliasing it.
- The census-to-proof fence holds. No census value enters any proof in the return or in GK-SIGN, and the bounded rows are labelled as such.
- There is no RTree wording, and (LIFT) and the budget are not used.
- A registry alias check for a GK-SIGN key is owed by the synthesis: `CLAIM-IDENTITY.run-local.json` is not a capsule member, so I did not open it. A suggested key name is `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-CLOSED-FORM-BELOW-MINUS-TWO`.

## Certification audit

Backed (replayed or reproduced by my own instrument):
- the digest `4305ffb5…` (canonical);
- the recurrence and its base cases;
- the checkpoints `x(T(m,2))`: 288, 379, 1421 and slack 2, 10, 16, 21, 79;
- `x = m` on 3..18;
- the P2 and `Δ_m` scans to 1500;
- `H_1`/`R_1` checked for k = 0..39;
- `S(G_k,k+3) ≤ −2` and whole-leaf-set favorability for k = 3..250 (now proved for all k ≥ 1);
- the scalar values in every row of the Fixed-points table;
- T(7,2) deletion-only flow 33026 and the gaps 2 and 133.

**Struck or corrected:**
- (a) **"Every row asserts `supply − capacity = S(T,p)` from two INDEPENDENTLY computed sides"** and the column header "S (own, `H_v/R_v` side)", for G_6, G_7, T(7,2) and T(8,2). F2's shipped `f2_partC.py` computes S for these rows only as `supply − capacity`. No `H_v`/`R_v` side is computed or compared: k = 6, 7 are not among `f2_partB.py`'s saved rows, and there is no T(m,2) aggregate at all. The values themselves are right, and my two-sided assertion backs them at `bounded_computation`.
- (b) B3's "**each strictly negative on every checked k=3..30 (printed exactly in the derivation below)**". Nothing is printed in the return. The shipped code saves and checks only the sample k ∈ {3, 4, 5, 10, 20, …}, with no negativity assertion. The statement is now true for every k ≥ 1 by Theorem GK-SIGN, on my evidence.
- (c) "**165-digit** negative integer at k=250". It has **175** digits.
- (d) "slack/m is **0.0528 at m=1000**". It is 53/1000 = 0.0530; 0.0528 is the value at m = 1250.
- (e) Grades table: "**slack strictly growing for m≥19**". False as literally stated. The slack is nondecreasing on 19..1500 but increases strictly in only 78 of the 1481 steps.
- (f) "**sharper equivalent**" for `Δ_m(T(m,2)) < 0`. Only a sufficient condition is proved (Finding 1).
- (g) Remaining obligation 1: eigenvalues "POSITIVE for every real y≥0 (proved here …)". False at y = 0, and positivity comes from Vieta, not from the discriminant.
- (h) The `f2_partC.py` summary line claiming deletion-only saturation was "directly verified" on G_3–G_5 and T(4..6,2) (Finding 4).
- (i) The C1 "EQUIVALENT target" sentence for T(m,2) (Finding 3).
- (j) The α and x cells for G_6 and G_7 are marked "re-verified here via the same matching/cover certificate", but the shipped code does this only for k = 3..5 and m = 4..6. My instrument confirms α = 15, 17 and x = 7, 8.

## Verdict

verdict: retained_narrowed
headline_resolved: no

F2's own proved items are correct as stated at `proved_informal`:
- the block recurrence and its assembly;
- the closed forms of `H_1` and `R_1`;
- `Δ_{k+2}(R_1) = −2^k`;
- `Δ_{k+2}(H_1) < 0`.

Its bounded extensions reproduce exactly. The return is narrowed by the struck literals (a)–(j), and C1 is reduced to a scope-note sentence for G_k (conditional for T(m,2)).

Critic-derived and attributed to C-F2-U:
- **Theorem GK-SIGN** (`proved_informal` in my judgment, STATED, needs an isolated second read). It closes allocation item 4(b) for every k ≥ 3, with an explicit closed form and every leaf favorable. With the registered key it gives top-level (HALL-COND) on all G_k, which is not (HALL).
- **Bounded rows:** deletion-only saturation on G_6, G_7, G_8, T(8,2), T(9,2), in addition to the reproduced rows.
- **Negative structural finding:** real-rootedness fails for `I(T(m,2))` (3 ≤ m ≤ 25) and for the chain `T_j` (from j = 2). This closes the Darroch/Newton mode route.
- **Lead:** the limiting slack ratio `1 − ρ = 1 − 5(3+√17)/(17+5√17) ≈ 0.05317`.

## Remaining obligation

1. **(HALL) on G_k and T(m,2) for every source subfamily X.** This is still open at every parameter. It is now the only open part of item (c) on G_k, since the scalar top-level condition is proved there, conditional on the registered key. A uniform deletion-only saturating flow is the natural target: deletion arcs alone saturate on every computed row, through G_8 and T(9,2). It must be exhibited explicitly and parameter-uniformly, or refuted by a cut X ⊊ I_{p+1}.
2. **T(m,2) premises for every m ≥ 4.** These are `x(T(m,2)) ≤ m` (or the sufficient `Δ_m(T(m,2)) < 0`) and `Δ_{m+2}(T(m,1)) < 0`. Real-rootedness is unavailable, so the proof needs a coefficient-level mode bound: a local limit/saddle argument at `λ₊(y)` with the explicit constant ρ, plus the finite check m ≤ M₀, where the zero-slack window is 3..18.
3. **The sign `S(T(m,2), m+2) ≤ −2` in closed form.** It is known only on the rows m = 4..9.
4. **An isolated second read of Theorem GK-SIGN** and of Lemma M before any registration, with the alias check against the run-local registry.

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-crit-F2-U/`. All code is stdlib-only and run with `python3 -B`. There is no network, no install, no Lean and no `__pycache__`, and no background job was started. Nothing was written under `sources/`.

Own instrument code:

| File | SHA-256 |
|---|---|
| `cfu_lib.py` | `e0c6bc10de6294faed6ef11ba2de709f68d10e98d02b10c2d8ea194be5befe34` |
| `cfu_rows.py` | `d4244ee148dc3ef8bb51010ca0f0093585352186c4f44b59bd09b846ec8430c5` |
| `cfu_partA.py` | `2eb904be15bad52cb420054c636600e22752328b8ca3bc4211536929f02b6d48` |
| `cfu_partB.py` | `eee8f75a9c1439b024d1c428963da5825089bf4260e62f2a46a4a7c1f03d8eb2` |
| `cfu_realroots.py` | `26030d806772d92ef653ec7ff7f609637e7c0fdf27260e7199be67d1ec3a82cf` |
| `cfu_realroots2.py` | `8c82700d58cc54b76c4a5c967bed9ccc1d72c8915eabeac76a2afc7b6e095ca8` |

Own outputs:

| File | SHA-256 |
|---|---|
| `OUT-fixed-all.json` | `9992cfd6…` |
| `OUT-gk-3_4_5_6.json` | `1b4ec10e…` |
| `OUT-gk-7_8.json` | `642e3867…` |
| `OUT-tm-4_5_6_7.json` | `7880e53b…` |
| `OUT-tm-8_9.json` | `3e84f705…` |
| `OUT-partA-1500.json` | `7e67ebb1…` |
| `OUT-partB.json` | `b2300d64…` |

The G_6/T(7,2) flow extraction and the negative control were run inline and their output is recorded above.

Replay: `replay/` holds copy-out-first copies of F2's 11 scripts. `replay/orig/` holds F2's 7 shipped JSONs, and the regenerated JSONs sit beside them; all are content-equal, and the canonical evidence digest is `4305ffb5…`.

Critique: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/cycles/cycle-3/stage4/critics/F2/U/CRITIQUE.md`.
