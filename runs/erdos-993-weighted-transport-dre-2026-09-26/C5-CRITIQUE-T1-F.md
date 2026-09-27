# Critique

Critic `C-T1-F` (orientation F, falsify) on seat `T1`, route `C5-T-01 CB-CLASS-UNIFORM-SWITCH-HALL` (orientation T), r30
Cycle 5 Stage 4. Run root `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26`.

**Boot.** I am operating within VerityOS. I booted by reading `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (both in full), and no other VerityOS file. The host-injected
`CLAUDE.md` and memory index were present in context. I did not open them or act on them.

**Model disclosure.** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read-boundary disclosure.** I read these files:
- the dispatch `control/dispatch/c5-stage4/DISPATCH-C-T1-F.md`, after checking its SHA-256 `757bd1be…0827`, which matched;
- the 14 capsule members. From `control/C5-CRITIC-ATTACK-BRIEFS.md` I read only the preamble and the T1 section. Before that I ran a heading-only `grep -n "^#"` on that single file to find the section;
- the three frozen `sources/` files that the return cites, by digest only;
- T1's scratch directories. I ran a non-recursive `ls` of `scratchpad/c5-T1/` and `scratchpad/c5-T1-replay/` (these are the return's inventoried artifacts), then copied `t1_generator.py` and `T1-GENERATOR-OUTPUT.json` into my own scratch. `t1_generator.py` imports the frozen evaluator read-only.

Two deviations:
1. I ran `shasum -a 256` on `control/dispatch/c5-stage3/DISPATCH-T1.md` to check the digest the return quotes. That file is not a capsule member. I computed its digest only and did not display or read its content.
2. One foreground run (`census.py 9 16 600`) was killed by its own `timeout 590`. Its empty output files were deleted, and the work was redone with `census2.py`.

Nothing else happened outside my grant. I ran no `find`/`grep`/`rg` above the grant, used no network, installed nothing, did not use Lean, and started no background job. Every run used `python3 -B`, and I checked that no bytecode was written.

## Identity and seal audit

| Object | Recorded | Recomputed (canonical: sort_keys, `(",",":")`, `seal_sha256` removed, no newline) | Result |
|---|---|---|---|
| Capsule `c5-critic-capsules/T1-PACKET-MANIFEST.json` | `ebc5a0bbabcfd1f04f13d3723d2c40e8faf4d419b096b86e105fffdec5d94b8d` | same | **match**; all 14 members match on SHA-256 and byte count |
| Stage 4 dispatch manifest | `8987ae6103a006574f10d7a79ba9cb61fa9f1f9700ef9b731123f540d3c5028d` | same | match |
| Stage 3 packet manifest | `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58` | same | match |
| Stage 2 packet manifest | `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289` | same; 1400 members | match. This equals the value in the common brief and the one T1 cites. **The protocol's literal `f0b5a2a1…` (Duty 1) does NOT equal the recomputed Stage 2 seal.** It looks like a stale literal or clone residue in `C5-CRITIC-PROTOCOL.md`. I reconciled it to the common brief and the recomputation and flag it for the controller. |
| `sources/lower-region/inputs/ordinary_tree_checked.py` | `a012bb78…533d` (SOURCE-DIGESTS) | same | match |
| `…/cb-switch-cut/run.py`, `PROTOCOL.md` | `94ced046…9d53`, `5b09a7f3…d952` | same | match. T1 read these before checking their digests, but nothing depends on that order. |
| `DISPATCH-T1.md` (digest only, see disclosure) | `fc33dda8…5a9a` (as quoted by T1) | same | match |
| T1 result JSON digest | `e6ccfd94793eef232175aab096e3991b31ce6e7646bee8a08983efcd6f93e65a` | same | My copy-out-first replay reproduces it, and the output file is **byte-identical** to T1's `T1-GENERATOR-OUTPUT.json`. Runtime was 80 s. |

T1's own disclosures (the names-only `ls` of `scratchpad/`, and the digest check made after reading) match the controller's disclosure record. The model disclosure is two-part (Sonnet, xhigh), consistent with the allocation.

## Independent re-derivation

**My instrument** is in `scratchpad/c5-crit-T1-F/instr/`. It uses exact integers and the standard library only, and it uses neither T1's code nor the frozen evaluator. I derived the following closed forms from the tree structure:

- `f_d(y) = y(1+y)^d + (1+2y)^d` (the choke subtree)
- `I(CB(d,m)) = y(1+y)(1+2y)^{dm} + (1+2y) f_d^m`
- `I(CB − v) = y(1+2y)^{dm} + (1+y) f_d^m`
- `I(CB − c) = y(1+y)^2(1+2y)^{dm−1} + (1+2y) f_d^{m−1} g_d`, where `g_d = y(1+y)^{d−1} + (1+y)(1+2y)^{d−1}`

Validation (`validate.py`):
- Brute-force enumeration, a generic tree DP of my own, and the closed form agree on 4 tiny rows, including `T−v` and `T−c`.
- The DP and the closed form agree on all 36 rows with `d, m ≤ 6`.
- Fixed points are reproduced: `K_{1,12}` has `n = 13`, `α = 12`, `x = 6`, and `Δ_8(K_{1,11}) = −110 < 0`. `CB(8,92)` has `n = 1567`, `α = 829`, `x = 490`, eligible window `[492, 552]`, and the closed form equals the generic DP on it.
- `x` is always the first strict descent computed through rank `α`.
- `IsTree` (edge count plus connectivity) is checked on every edge-list instance.

**Claim 1, `α(CB(d,m)) = 1 + m(d+1)` for `m ≥ 1`. Proof (critic).**
- Upper bound: partition `V` into the edge `{s, v}`, the `dm` edges `{b_ij, c_ij}`, and the star `{r, u_1, …, u_m}`. An independent set takes at most one vertex from each edge. From the star it takes at most `max(1, m) = m` vertices. So `α ≤ 1 + dm + m`.
- Lower bound: `{v} ∪ {u_i} ∪ {c_ij}` is independent and has that size.

This is a uniform proof, grade `proved_informal`. T1's Step 2 "generating-function decomposition" contains no such argument. Its one-line remark about selecting every choke is a lower-bound heuristic, not a proof. T1 graded Claim 1 `bounded_computation`, which is conservative; the statement is true.

**Step 2, the `t = 1` instantiation.**
- Criterion: `C(M,k)2^k > C(M,k−1)2^{k−1}` holds iff `3k < 2M + 2`. With `k = p − 1` and `M = dm`, this is `3p < 2dm + 5`. Checked.
- Unmatched count: `|S| − |S_p| = C(dm,p−2)2^{p−2}(2dm−3p+5)/(p−1)`. Checked.
- The defect-Hall deduction is valid, given the registered `CBstar` maximum: the maximum over `X` is attained at `X = S`, so the maximum matching equals `|N(S)|`, which is the whole in-sector target layer.
- The deletion exits `B∖{r}` and `B∖{v}` have weight 0 (I recomputed this), so they are irrelevant.
- **Literal laboratory** (`lab.py`: literal max matching, literal `w_F` with `F` = all leaves, non-eligible laboratories). On `CB(2,3)/4`, `CB(3,2)/5`, `CB(2,3)/5` and `CB(4,2)/6`, every sector source and in-sector target has weight 1. The matching saturates the targets, and the unmatched count equals T1's formula (100, 80, 80, 672).
- Grade: `bounded_computation` confirmation of an instantiation of a `proved_informal` key. It supplies no flow.

**Claim 2, the five registered rows.** I recomputed them independently (`confirm.py`):
- `α` = 775, 802, 829, 973, 1153;
- `x = p − 2` on all five;
- ratios `460/459`, `476/475`, `492/491`, `289/288`, `337/336`.

**Claim 3, the census on T1's rectangle.** My exact census (`census.py 1 8 150` plus T1's `d ∈ [9,16]`, `m ≤ 89` range, via `census2.py`) gives **exactly the same 59 hits** `(d, m, x, p)` as T1: 17 with `d = 7` and 42 with `d = 8`. Two independent instruments therefore agree on the census as stated.

**Fidelity, which I derived myself.** At every one of the 59 hits (and at every hit of the extended census below), the arm tag `v` AND a private tag `c` satisfy `Δ_p(T − leaf) < 0` on the original tree. So `F_p` = all leaves at those rows, and `w_F ≡ 1` on the sector holds. T1 never derived this (see Attacks, F-1). The numbers survive because I derived it; they would not survive on T1's evidence alone.

## Attacks and findings

**F-1 (fidelity; certification literal struck).**
- The generator's docstring says "F_p is derived on every row via favorable_leaves(), never hard-coded" and that every eligible row reports `|F|`. In fact `favorable_leaves` and `aggregate_S_independent_side` are defined but **never called**. No census row carries `F` or `|F|`.
- The switch-necessity flag silently assumes `v ∈ F_p`: if `v ∉ F_p`, every sector weight is 0 and there is no deficit.
- This breaks the allocation's shared rule ("`F_p` DERIVED at rank `p` on every row").
- My derivation (`v, c ∈ F_p` at all 59 hits, exact, two instruments at `CB(8,161)` and `CB(8,212)` via the generic DP) repairs the numbers. T1's literal is struck.

**F-2 (the `d ∈ {7,8}` narrowing is an artefact of the census range; STRUCK).** Extending the exact census (`census2.py`) to `m ≤ 400` for `d = 7..13` and `m ≤ 600` for `d = 14..16` gives switch-necessary eligible first ranks for **every** `d ∈ [7,16]`, with `v, c ∈ F_p` at every hit. The first hits (`n`, `p`) are:

| `d` | First hit | `n` | `p` |
|---|---|---|---|
| 7 | `m = 109` | 1638 | 510 |
| 8 | `m = 86` | 1465 | 460 |
| 9 | `m = 112` | 2131 | 673 |
| 10 | `m = 106` | 2229 | 708 |
| 11 | `m = 134` | 3085 | 984 |
| 12 | `m = 212` | 5303 | 1697 |
| 13 | `m = 232` | 6267 | 2012 |
| 14 | `m = 314` | 9109 | 2932 |
| 15 | `m = 520` | 16123 | 5201 |
| 16 | `m = 592` | 19539 | 6316 |

T1 stopped `d ≥ 9` at `m = 89`, just below the first hits at `d = 9, 10`. The closed form that explains the window is exact. The mean of the choke factor is `μ(d) = f_d′(1)/f_d(1)`, and

  `2d/3 − μ(d) = 2^d (d − 6) / (6 (2^d + 3^d))`

I verified this identity in exact rationals for `d ≤ 30` (`sturm.py`). Its sign is the sign of `d − 6`. The sector criterion `3(x+2) < 2dm + 5` compares `x ≈ m μ(d)` with `2dm/3`. So the mechanism behind T1's gesture is a mean-versus-`2d/3` comparison, not Kruskal–Katona. The threshold `m_0(d) ≍ 1/δ(d)`, with `δ(d)` the right-hand side above, is not monotone in `d`, and the hit set in `m` has gaps (for example `d = 8`: 86, 89, 92, 95, …).

**F-3 (critic-derived lemma: no sector deficiency at any eligible rank for `d ≤ 6`).**

*Lemma (C-T1-F, STATED).* For every `d ∈ {1,…,6}` and every `m ≥ 1`, `x(CB(d,m)) ≥ ⌊(2dm+2)/3⌋`, so `3x ≥ 2dm`. Hence every rank `p ≥ x + 2` has `3p ≥ 2dm + 6`. By the `t = 1` case of the `CBstar` sector-deficit key, the root-plus-arm sector of `CB(d,m)` is deletion-sufficient at every eligible rank, for every `m`.

*Proof.*
1. Expand `(1+2y) f_d^m` by the binomial theorem. It is `Σ_q C(m,q) T_q` with `T_q = y^q (1+y)^{qd} (1+2y)^{d(m−q)+1}`, and `I = Σ_q C(m,q) T_q + E`, where `E = y(1+y)(1+2y)^{dm}`.
2. Each `T_q` and `E` is a product of linear factors. Its coefficients are, up to scale and shift, a Poisson-binomial law. It is therefore log-concave with no internal zeros, so it is nondecreasing up to its first mode.
3. By Darroch's theorem, every mode lies within 1 of the mean.
4. `mean(T_q) = 2dm/3 + 2/3 + q(1 − d/6)`. This is `≥ 2dm/3 + 2/3` exactly when `d ≤ 6`. Also `mean(E) = 2dm/3 + 3/2`.
5. So every summand satisfies `a_{k+1} ≥ a_k` for all `k ≤ ⌊(2dm−1)/3⌋`. Summing gives `x(I) ≥ ⌊(2dm−1)/3⌋ + 1`. ∎

Inputs:
- Darroch (1964) is classical and not under `sources/`; it is an undischarged dependency named on this face.
- `CBstar` (`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`) is `proved_informal`.

Grade: `proved_informal` if an isolated second read confirms it; it was first stated at this review stage. Bounded check: `3x − 2dm ≥ 2` on all 900 rows with `d ≤ 6`, `m ≤ 150`.

Note that `f_d` is **not** real-rooted for `d ≥ 3` (Sturm: 2 or 3 real roots out of `d + 1`, `sturm.py`). A Darroch argument applied directly to `f_d^m` would be wrong. The proof above works on the product-of-linear-factors summands instead.

This settles the brief's question for `d ≤ 6` (never switch-necessary) at a proof grade. For `d ≥ 7` the census shows hits for all tested `d`. The asymptotic existence of hits for every fixed `d ≥ 7` is a STATED sketch (a local-CLT argument that the mode of `f_d^m` is `m μ(d) + O(1)`, with `E` exponentially negligible), not a proof.

**F-4 (strongest finding; falsifies T1's allocated object through E1, and its Remaining obligation item 1).** Condition (i) is E1's criterion (CD-2): `r_q(p−q) ≤ r_q(p−q−1)`, where `r_q = coefficients of (1+y)^{qd−1}(1+2y)^{d(m−q)+1}`.

My implementation (`lcheck.py`) first **reproduces the allocation's quoted record exactly**: over `d ≤ 8`, `m ≤ 15` there are 364 eligible rows, and condition (i) fails at 90 of them. The largest failing `d` is 5, and the first failure is `CB(1,7)/10`.

At the first eligible rank of the switch-necessary rows, condition (i) **fails at `q = 1`** as follows:

| `d` | First failure | Holds for no switch-necessary `m` beyond | Failing / hits for `m ≤ 400` |
|---|---|---|---|
| 7 | `m = 217` | 287 | 148 / 257 |
| 8 | `m = 161` | 211 | 214 / 292 |
| 9 | `m = 186` | 185 | 215 / 289 |
| 10 | `m = 213` | 265 | 162 / 270 |
| 11 | `m = 289` | 354 | 79 / 237 |

The window has not yet closed for `d = 12..16` within the tested range.

Concrete example: `CB(8,161)` with `n = 2740`, `α = 1450`, `x = 857`, first eligible `p = 859`, which is eligible and switch-necessary (slack 4), and `v ∈ F_p`. There `r_1(858) − r_1(857) > 0`.
- The value of `x` comes from two instruments: the closed form and the generic tree DP.
- The value of `r_1` comes from two instruments: the incremental binomial sum and full polynomial multiplication.
- `CB(8,212)/1131` is the same.

Full-`q` scans:
- At `CB(8,300)/1599` the failing set is `q ∈ {1..5}`; at `CB(7,350)/1633` it is `{1..6}`; at `CB(9,250)/1500` it is `{1}`.
- At both ends of every `q = 1` window, all `q` pass. E1 holds at the first hits, consistent with the five registered certificates.

Consequences:
- The allocation's step (L-i) is "a PROVED mode bound … for every `q ∈ [1,m]` at every eligible `p` of the class". For `CB(8,m)`, `m ≥ m_0`, and for `CB(d,m)` with `d ∈ {7..11}` and all large `m`, it is **false** (`bounded_computation`, exact).
- T1's Remaining-obligation item 1 asks for exactly this statement on `d ∈ {7,8}`, so the obligation is **not exact**: it points a successor at a false statement.
- Asymptotically (STATED sketch): `r_1` is Poisson-binomial with mean `2dm/3 − d/6 + 1/6`, so condition (i) at `q = 1` fails as soon as `p ≤ 2dm/3 − d/6 + 1/6`. With `p = x + 2 ≈ 2dm/3 − δ(d)m + O(1)`, this happens for every fixed `d ≥ 7` once `δ(d) m ≳ d/6 + O(1)`, while switch-necessity needs only `δ(d) m ≳ O(1)`.
- So the switch-necessary rows that E1 can serve form a **finite window in `m` for each fixed `d`**. The only infinite switch-necessary CB class on which the E1 composition can work is a `d`-growing diagonal `{(d, m) : m ∈ [m_0(d), m_1(d)]}`. It cannot be a fixed-`d` class.
- E1 is only sufficient, so this refutes nothing about (HALL). But beyond the window, a non-sector certificate other than E1 is needed for the families with few chokes (`q ≤ 6` at the rows tested), in addition to (L-S).

**F-5 (the frontier is misstated).**
- T1 writes that the five registered rows appear "as its own five smallest-d=8/one d=7 entries". This is false. By order, the list starts `CB(8,86)`, `CB(8,89)`, `CB(8,92)`, `CB(8,95)`, `CB(7,109)`, `CB(8,98)`, …, so `CB(8,95)` and `CB(7,109)` sit below the registered `CB(8,108)` and `CB(7,144)`.
- Consequence T1 did not draw: 54 switch-necessary eligible first ranks inside T1's own rectangle have **no** certificate of record. By the Stage 1 gate, the five registered rows are the only ones closed (the gate calls `G(8^82,7^2)/448` "the one open switch-necessary eligible row on record").
- That record is correct as a record, but the instance frontier is far larger than one row: 54 rows in the rectangle, and over 1,900 hits in the extended census. T2's object cannot retire it.

**F-6 (a non-falsifiable check is struck, ruling 17).**
- In Claim 2, "matches quoted record" for the ratios compares `2(dm−p+2)/(p−1)`, evaluated at the registered `p`, with values produced by the same formula.
- Only `α` and `x = p − 2` are independent content. Those survive (re-derived above). The ratio "match" is struck as evidence.

**Other attacks, all clean.**
- The switch-necessity direction and the ℕ arithmetic are correct.
- Eligibility at switch-necessary rows is automatic, since `2dm + 5 ≤ 2α + 1`.
- Nothing downstream uses the Step 5 heuristic.
- No `S` is asserted, so no WID equality is owed. T1 is transparent about this, but it means no census row carries `S` or `|F|`, contrary to the shared rules.
- Competition for sector targets: the sector's switch exits (`u = u_i` with exactly one `b_ij ∈ B`) land on `r`-free targets. Non-sector sources `{v, u_i, u_j, …}` switch INTO sector targets via `u = r`. T1's "deletion saturates all in-sector targets" therefore leaves no sector capacity for those arcs. (L-S) must account for this, and T1 does not mention it.

## Mechanism-equivalence and fence check

- T1 proposes no mechanism, so none of the ten refuted keys is revived.
- Nothing closed is re-proved as a contribution: Step 2 is a cited instantiation of `CBstar`, and Claim 2 is graded as a cross-check.
- No census value enters a proof. There is no RTree wording, no use of the controller prior, and no reliance on (LIFT) or (DCB).
- The `sources/` reads are within grant.
- My own F-3 lemma uses the registered `CBstar` key at its grade and Darroch as a named dependency. It re-proves no closed region.
- Claim identity: T1 proposes no key, which is correct.
- My F-3 statement, if the synthesis registers it, needs a predicate-form `E993-R30-…` name distinct from `CBstar`. For example `E993-R30-CB-CHOKE-DEGREE-AT-MOST-SIX-SECTOR-DELETION-SUFFICIENT-AT-EVERY-ELIGIBLE-RANK`. I checked it only lexically against the keys quoted in my capsule, because I cannot read the registry. Mathematically it is a corollary of `CBstar` plus the new bound `3x ≥ 2dm`.
- F-4 is a bounded record against E1's applicability, not a key.

## Certification audit

| Literal | Evidence | Ruling |
|---|---|---|
| Result digest `e6ccfd94…`; "identical SHA-256 reproduced" | my replay, byte-identical | backed |
| "88/88 match" (Claim 1) | replay flag, 88 by loop | backed; statement also proved above |
| "all 5 match" (Claim 0) | replay | backed |
| "59 hits … `d ∈ {7,8}`"; "every pair … evaluated" | replay plus my independent census | backed as a bounded fact |
| "most likely `d ∈ {7,8}` rather than `d ≥ 6`" | contradicted (F-2) | **struck** |
| "F_p is derived on every row via favorable_leaves()"; "every eligible row reports … \|F\|" (generator) | function never called | **struck** (F-1) |
| "five previously registered rows … its own five smallest … entries" | false order (F-5) | **struck** |
| Claim 2 ratio "matches quoted record" | formula against formula | **struck as evidence** (F-6); `α`, `x = p−2` backed |
| "maximum matching saturates the entire smaller side exactly" | follows from `CBstar`; lab-confirmed on 4 rows | backed at its inherited grade |
| "453 `claim_key` strings" | registry not in my capsule | unverified (not struck) |
| "no .pyc / __pycache__" | T1 scratch listing shows none | backed |
| Gate-31 lines; `headline_resolved: no` | present | backed |

T1's supply toward ruling 39's letters (a′)–(d′): **none**. Critic-derived findings (F-3; F-4 against (a′) through E1 on fixed-`d` classes) bear on (a′) only as scope information, never as a supply.

## Verdict

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Retained:**
- the Step 2 instantiation (inherited `proved_informal`, lab-confirmed);
- Claims 0 and 2 (`α`, `x`);
- Claim 3's 59-row census as a bounded fact on its stated rectangle, with `F_p` now derived by the critic;
- Claim 1, which is **true and proved** (critic proof above).

**Struck:**
- the `d ∈ {7,8}` narrowing (F-2);
- the `F_p` certification literal (F-1);
- the "five smallest" ordering (F-5);
- the ratio "match" as evidence (F-6).

**Critic-derived** (attributed to C-T1-F, first stated at Stage 4, needing an isolated second read):
- the `d ≤ 6` sector-sufficiency lemma (F-3), grade `proved_informal`;
- the finite-window obstruction to E1 on fixed-`d` CB classes (F-4), grade `bounded_computation` exact, with the asymptotic form a STATED sketch.

T1 did not attempt (L-i) or (L-S). F-4 shows (L-i) is false as the allocation poses it for fixed `d`.

## Remaining obligation

This replaces T1's list; its item 1 is not exact.
1. **Class choice.** A uniform switch-arc (HALL) through E1 can only live on a `d`-growing diagonal class with `m ∈ [m_0(d), m_1(d)]`, where `m_0` is the first switch-necessary rank and `m_1` the last at which condition (i) holds at `q = 1`. Examples: `m_0(8) = 86`, `m_1(8) = 211`; `m_0(7) = 109`, `m_1(7) = 287`. On fixed-`d` tails it must be replaced by a non-E1 non-sector certificate for the families with few chokes (`q ≤ 6` at the rows tested). Prove `m_0(d) ≤ m_1(d)` for every `d ≥ 7`, or state the class exactly. Heuristically both are `≍ 1/δ(d)`, and their ratio grows with `d`; this is not proved.
2. **(L-S).** Route the counted sector deficiency `C(dm,p−2)2^{p−2}(2dm−3p+5)/(p−1)` through the one-support-choke switch images, with the capacity cap `(1 − ρ_1)` on those targets. Include the incoming `u = r` switch arcs from non-sector sources, which compete for sector targets that deletion already saturates.
3. **Second read** of the critic lemma F-3 and of the F-4 rows.
4. **The 54 uncertified switch-necessary rows** inside T1's rectangle (smallest `CB(8,95)`, `CB(7,109)/510`, `CB(8,98)`) are open instances. Any (L-S) certificate should be validated on them before any uniform claim.

## Artifact inventory

Scratch: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-crit-T1-F/` (full SHA-256, computed before this write):

- `instr/c2_d10.json` `0c3ee0241d4764b6ab65100292bbbc195be4ef204e05602aa3610a6933e23cee`
- `instr/c2_d11.json` `8e9e534e3a2fe52365664c130f02a2cf1a2eee2f4869bffcfe70ded7d26010fc`
- `instr/c2_d12.json` `49a4a72b4e5900974025d51e673adbb8774cc697c69ca7ce4b1ead90a2100ce6`
- `instr/c2_d13.json` `f6b9b39c2952972752a6271ae987a18c74806a77b9de796f97abf2c4af2b675c`
- `instr/c2_d14.json` `3a8c9a9cd1f486a5815bdbda02b6fa8f61cd0269239710ed567b37a7d41e6ee8`
- `instr/c2_d15.json` `e058c0390c6238acd8ef6bb773b60e9c67dda5a76d0070af4d831c54a071f783`
- `instr/c2_d16.json` `fabc78ffde34202f83c472067146d10de81eec0fbde18eceb49280d1fbcd4324`
- `instr/c2_d7.json` `470d656c03a15634252448262375680de899d33b0ea249bda98d66ac16e33f5f`
- `instr/c2_d8.json` `dee9e64c759da40c60c9d3ee8de5f6bc3d7f417c9745f2f32cfae5f38c447e87`
- `instr/c2_d9.json` `a04477cfdc639f3c0a17d3330cdd9db64061f880b0f07e1ef74f4a8cab6513a8`
- `instr/cbcrit.py` `05249e1030c1ec5b699c64b918cdfc72002127c3848859650a83e084e283ef68`
- `instr/census.py` `c31cb2068562112ed08fea3625a5a185ca38bac5de92060fdd469c5b5f05c322`
- `instr/census2.py` `b018d842e03692c9776dbc0aae24f64051a1e03f6cb5455710e1589c9fb3b552`
- `instr/census_1_8_150.json` `0e6a4af2aba3968e9013492da6fa7f300b25a4c36d38cfc831c76b63a0521a8b`
- `instr/census_1_8_150.log` `ac06fbe9387bd941f099217c925e0c1400829e295c50299713e9744bc5980618`
- `instr/confirm.json` `b43b6a205923db498871b828498dda55815f7eae1178741093c18939e48bafaa`
- `instr/confirm.py` `39f97f22426ed290b5f942df2a20a17facd63e87333a1447c958c47bd16da592`
- `instr/e1small.json` `c0eaa3120efc968f7df64c86aac183add779a629a32ce2172f4b7279afc61e4e`
- `instr/e1small.py` `8a70a610d9cfca0c3ceee5b26338c75c3e2e74936fca35b7cc3d06d3efa6ff3e`
- `instr/lab.json` `051513b5feba73267f1713b9f3196c77f38f50fcb9ec9303aa0f85a67c96efda`
- `instr/lab.py` `2058cf190a6ea49d2240f754ccafa285bb57d361bb1593496adcab44d36c7d18`
- `instr/lcheck.py` `3cb9cd4419c6b0f3a854c2ed9f2ee7191db47cb12421986f16b5c5d81986dff5`
- `instr/lcheck_fullq.json` `01459f2d27790cd39b12b54e5999613c7842f95595e88be8cf8bcd50175306fa`
- `instr/lcheck_q1scan.json` `1d89d9706314df7a4f527087815cd7fad2e82b25b6c5fc79758b504cad8fb334`
- `instr/sturm.json` `7b21bfc30361d0951be96debf39daf00a83d251de406befb90c8ccf8ddadd143`
- `instr/sturm.py` `f7d80b75d517e7858c62297d605429680756d63b7e0affa9fa73aa796c7ec05a`
- `instr/validate.out.json` `ce02992497cd1d36f77690abca692f33a2bd2ea3ff0626d937c4c87c00e50576`
- `instr/validate.py` `8a1929c3759d64cf301264acc33d1f127fb3f06e980f82f4ea75bfe583a9d312`
- `replay/REPLAY-OUTPUT.json` `55ddca3ef3fb371e9678ca2a80a785a4de2b2bc06da1e972e004228fb3e980f9`
- `replay/T1-GENERATOR-OUTPUT.json` `55ddca3ef3fb371e9678ca2a80a785a4de2b2bc06da1e972e004228fb3e980f9`
- `replay/replay_err.log` `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`
- `replay/t1_generator.py` `f969a378ed7459fdfd37b2c064ba5c5fbe91e4d5a5e483cab01d0f8cf863a136`

Roles:
- `replay/` holds the copy-out-first replay of T1's generator. Its output is byte-identical to T1's.
- `cbcrit.py` holds the closed forms, the generic DP and brute force; `validate.py` runs the fixed points.
- `census.py` and `census2.py` are the exact census.
- `lcheck.py` checks condition (i); `e1small.py` validates it against the 364/90 record.
- `sturm.py` holds the real-root counts and the exact mean identity.
- `confirm.py` holds the two-instrument confirmations and the T1 hit-list equality.
- `lab.py` is the literal Step 2 matching laboratory.

Replay any of these with `cd …/scratchpad/c5-crit-T1-F/instr && python3 -B <script>`. `lcheck.py` needs the `c2_d*.json` files. One transient helper list of these digests was written to the session scratchpad (outside the run root) and deleted after this write. No background job was started, so none needed killing.
