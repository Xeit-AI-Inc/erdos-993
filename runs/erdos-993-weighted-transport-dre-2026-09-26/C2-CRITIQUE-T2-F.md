# Critique

Critic `C-T2-F` (orientation F, falsify), Cycle 2 Stage 4, r30. Assigned return: seat `T2`, route
`C2-T-02 WEIGHTED-SECTOR-LYM-BEYOND-PAIRS` (orientation T), `cycles/cycle-2/stage3/returns/T2/RETURN.md`.

**Boot.** I am operating within VerityOS. The two boot reads, and only those: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS subsystem was loaded, because the dispatch fences it.
Process note: `verity.md` was read first. The first attempt to print the startup protocol failed because of a shell quoting error
(zsh `=` expansion in a separator `echo`). I read it in full later, before writing this critique. It governs nothing that changed
my work.

**Model disclosure:** the two-part line is under `## Verdict`.

## Identity and seal audit

- **Dispatch.** `control/dispatch/c2-stage4/DISPATCH-C-T2-F.md` has SHA-256 `b4f3c5d945c7326d49a889c428330458d5c1d964118499b06d55169ab0a327a5`. This
  matches the wrapper before the file was read.
- **Capsule seal.** `control/c2-critic-capsules/T2-PACKET-MANIFEST.json` recomputes to
  `a0fe655a9499f12474a9be1a73bb0db375062e5035488c2fd35c06c27570922b` (canonical: key-sorted, `(",", ":")`, no trailing newline, `seal_sha256` removed).
  This equals the stored value. All 13 members match both SHA-256 and byte count.
- **Stage seals (recomputed canonically).** Stage 2 is `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`, which matches the stored value and the
  protocol. Stage 3 is `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d`, which matches the stored value. The Stage 3 manifest lists
  `cycles/cycle-2/stage3/returns/T2/RETURN.md` at `64dec148…f544cf`, and that is the digest I verified. Stage 4 dispatch is
  `a361cd175e7c3968cdf2a8d14f92e9b2b5883b018bd72e837f54f26ce38da383`, which matches the stored value.
- **Return digests.** All eight script digests in the return's replay table match my copy-out
  (`scratchpad/c2-crit-T2-F/replay/`). All seven output files in `scratchpad/c2-T2/` hash to the claimed output digests. I replayed four
  scripts copy-out-first, and each regenerated output was byte-identical to its claimed digest:
  - `t2_nm_checks`: `699323ef…`
  - `t2_fixedpoint_k112`: `c3c8e17a…`
  - `t2_fixedpoint_cb892`: `6de93edc…`
  - `t2_fixedpoint_starforest_small`: `1f1e4c33…`

  I did not re-run `t2_switch_check.py`, `t2_search.py` or `t2_record_cbstar_scan.py`, because each takes hours. Their
  claims are re-derived below with my own instrument instead.
- **Model disclosure of the return.** "chartered sonnet/xhigh; … runtime-reported model id: `claude-sonnet-5`". This is consistent with the
  allocation (routes Sonnet 5 xhigh).
- **Award labels.** The return cites only C1-LA1, which exists. It cites no nonexistent award label.
- **Read-boundary disclosures (return).** The return self-discloses one full process listing (`ps aux | grep`, forbidden) and four
  single-level name listings above its grant (`ls scratchpad/`, `find cycles/cycle-1/stage3/returns -maxdepth 1`,
  `find cycles/cycle-1/stage6`, `find second-reads -maxdepth 2`). These are recorded. No file named `control/C2-STAGE3-READ-BOUNDARY-DISCLOSURES.json`
  exists, so no controller-filed disclosure was in my capsule.
- **My own read boundary.** I read the capsule members, the return's inventoried scripts and outputs by exact name,
  `sources/` (single-level listings of `sources/`, `sources/authority`, `sources/predecessor-ledgers`, and a read of
  `sources/authority/CLAIM-IDENTITY.json`, whose digest is present in `SOURCE-DIGESTS.json`), and my own scratch. Two further actions are disclosed:
  - One `ls` existence check of the protocol-named path `control/C2-STAGE3-READ-BOUNDARY-DISCLOSURES.json`. It is absent, and this was not a search.
  - One `grep` over my own replay directory, which is inside my grant.

  I read no other return, critique, adjudication, experiment root or external source. I used no network and installed nothing.

## Independent re-derivation

My instrument is `scratchpad/c2-crit-T2-F/own/`. It is written from SEMANTIC-CONTRACT §1.2 and shares no code with `scratchpad/c2-T2/`.
- **Brute side.** Bitmask enumeration of independent sets, a tree test (BFS connectivity plus union-find acyclicity plus edge count),
  `x` through rank `α`, `F_p` from `Δ_p(T − v)` on the original tree, the literal active weight, and literal (D) ∪ (S) with every `u ∉ B` that has
  `|N(u) ∩ B| = 2`. Supply − capacity is asserted equal to `S` computed separately from `H_v`, `R_v` on every brute instance. Dinic max-flow.
- **Closed-form side.** Exact Kronecker-substitution polynomial arithmetic for `CBstar(d, m, t)`. It computes `I(T)`, `I(T − v)`, `I(T − c)`, and
  `H_v`, `R_v` for both leaf classes. Every one of these was validated coefficient-for-coefficient against brute force on six configurations.

**Fixed points (before anything else).** All are reproduced exactly.
- `K_{1,12}`/8: `n = 13`, `α = 12`, `x = 6`, `|F| = 12`, supply 1980, capacity 3960, `S = −1980`, flow 1980.
- Path-star `(2,3,4)`/7: supply 1483, capacity 2701, `S = −1218`, flow 1483, 2025 arcs.
- Path-star `(2,2,4,3)`/8: 8033 / 13467 / 8033, `S = −5434`, 11691 arcs.
- `CB(8,92)`: `n = 1567`, `α = 829`, `x = 490`, window `[492, 552]`. `|F| = 737`, which is every leaf, and `S < 0` at every window `p`. The sector ratio
  `R_491·491 = R_490·492` and `R_491 − R_490 = R_490/491` both hold exactly.

**Definitions in `CBstar(d,m,t)` (brief item 1).**
- The tags are the arm leaf `v` (support `s`, `W_v = {r}`) and the private leaves `c_{i,l,j}` (support `b_{i,l}`, `W_c` = the other `t − 1` leaves of the star together with `u_i`).
  Supports, chokes, `r` and `s` are not leaves when `t ≥ 1`.
- In the root-plus-arm sector (`r, v ∈ B`), `u_i ∉ B`, so `c` is active if and only if a same-star sibling is present. The centre-present state carries weight 0.
  A star with `s ≥ 2` leaves present carries weight `s`.
- The return's §1 reading is therefore correct. My brute sector sums equal T-A's `𝒲_k` at every rank where `F_p` is the whole leaf set.

**T-A.** `f_t = (1+x)^t + x` and `w_t = Σ_{s≥2} s·C(t,s)x^s` are re-derived, and `𝒲 = f^{M−1}(f + M w_t)` is confirmed. At `t = 1`, `𝒲 = (1+2x)^M`, which is P5/P6.
T-A holds under the unstated hypothesis `F_p(T) = P ∪ {v}` (Finding 3).

**T-E (brief item 5).** I brute-forced every choke switch from every sector source at every eligible `p` of all eight configurations in the return's table.
- The six small configurations use full enumeration.
- `CBstar(3,3,2)` at `p = 13, 14` uses a product enumeration of star states, with `F` computed from the closed forms.
- Result: 32, 1338, 432, 498, 152, 36, 132300, 46881 instances, which is **181,669, all matching T-E**. My counts equal the return's
  row-for-row. `F_p` is the whole leaf set on every one of these rows.
- These are **arcs, not distinct targets**. For example, 132,300 arcs reach 123,984 distinct targets at `(3,3,2)/13`, and 1,338 reach 1,272 at `(3,2,2)/9`.

**§7 rows.** With my closed-form instrument I reproduced `n`, `α`, `x` and the window of all 16 rows of the `d = 8` table exactly. On every window `p` of every row:
- `F_p(T)` is the whole leaf set.
- `S < 0`, computed by the aggregate definition. At these orders neither instrument computes supply or capacity separately.
- T-B's criterion fires only at 460/476/492.

I also re-ran the return's sweep with my own instrument: the same enumeration (3,102 configurations confirmed), 204,265 eligible rows.
- `F_p` is the whole leaf set on all 204,265 rows.
- `S < 0` on all of them.
- The only deficient rows are `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`, under both T-B and my corrected criterion (Lemma L1 below).

The return's `bounded_computation` conclusion stands, but only through the corrected criterion (Finding 1).

## Attacks and findings

**Finding 1 (major; T-B is false as stated for `t ≥ 2`).** T-B asserts that the deletion image of the whole sector layer "is the entire lower layer exactly …
as long as `k ≤ Mt`", and that whole-sector deficiency holds if and only if `𝒲_k > 𝒲_{k−1}`. Both parts fail for every `t ≥ 2`.

- (a) **Maximal star-forest states are unreachable.** A state in which every star is centre-present or full is maximal. Such states exist at every local rank in `[M, Mt]`, and deletion cannot reach them.
  This is T-C's own observation, so T-C and T-B contradict each other. Brute-force unreached in-sector weight at eligible rows: 12 at
  `CBstar(2,2,2)/7`, 18 at `(3,2,2)/9`, 75 at `(3,2,2)/10`, 42 at `(2,2,3)/10`. In the whole eligible window `k > M`, so these states are always present.
- (b) **Out-of-sector deletion targets carry weight.** This is the brief's edge case. Deleting `v` gives `B ∖ {v}`, of weight `starweight(B)`. Deleting `r` gives `B ∖ {r}`,
  where `v` is inactive and the weight is again `starweight(B)`. These weights are zero only at `t = 1`. Brute force confirms that the out-of-sector weight equals `2G_k` (`G = M w_t f^{M−1}`) exactly.
- (c) **The "iff" fails outright.** At `CBstar(2,2,2)`, `p = 6` (`F` = all 9 leaves), `𝒲_5 = 504 > 𝒲_4 = 435`, so T-B declares deficiency. The true
  `Σ_{N_D(X)} w = 434 + 720 = 1154 ≥ 504`. The same false positive occurs at `(2,2,3)/7` and `(3,2,2)/7, 8`. T-B is stated "for every `d, m, t, p`", so it is refuted as stated.

  **Correct statement (critic-derived, Lemma C-T2-F-L1).** Let `F = a{v} ∪ bP` with `a, b ∈ {0,1}`. This covers every case, because `F_p(T)` is `Aut(T)`-invariant and
  `Aut(T)` is transitive on `P`. Let `R = f^M`, `N^max = (x + x^t)^M` (`(2x)^M` at `t = 1`), and `G^max = M·g(t)·x^t(x + x^t)^{M−1}`, where `g(t) = t` for `t ≥ 2` and 0 for `t = 1`. Then

  `Σ_X w_F − Σ_{N_D(X)} w_F = a·[R_k − R_{k−1} + N^max_{k−1}] − b·[G_k + G_{k−1} − G^max_{k−1}]`.

  Proof: `N_D(X)` is the disjoint union of the non-maximal in-sector states, `{B ∖ v}` and `{B ∖ r}`, with the weights listed above. The formula matches brute force on all 129
  (configuration, `F`, rank) cases I checked, including `t = 1, 2, 3` and all three nonempty selector choices. At `t = 1` it reduces to P8.
- **Consequence for the return.** §7's "no deficiency" rested on T-B's reachability step, which is false. It is rescued, not invalidated: the corrected balance agrees on all 204,265 rows.

**Finding 2 (major; the relation is misdescribed).** §1 says a switch is "insertable exactly at a choke `u_i` with exactly one of its `d` supports present". In the sector
there are two more literal (S) families:
- **The `s`-switch.** `N(s) = {r, v} ⊆ B` always, so every sector source has one. The image `{s} ∪ state` has weight `starweight(B)`.
- **The support switch (`t ≥ 2`).** When exactly two leaves of a star are present, the switch replaces them by the centre. The image weight is `w(B) − 2`, and it stays in the sector.

My census on the eligible rows gives, for example, choke / `s` / support = 32 / 58 / 120 at `CBstar(2,2,2)/7` and 1338 / 1770 / 4110 at `(3,2,2)/9`. Both image-weight
formulas hold on every instance (critic-derived; `bounded_computation` checks of an elementary derivation). T-E is correct for what it covers. The §6 (SW) template, however, accounts only
for choke exits. It omits the two families that carry most of the switch mass and that reach the deletion-unreachable maximal states.

**Finding 3 (fidelity; the selector is not computed).**
- The return computes `F_p` on `CBstar` only once, at `(2,2,2)/7`.
- `t2_switch_check.py` hard-codes `F = {v} ∪ P` with the comment "tested for favorability separately", but no such test exists for its other seven configurations.
- `t2_search.py` and `t2_record_cbstar_scan.py` compute neither `F` nor `S`.
- §7's table lacks `|F|`, supply, capacity and `S`, which SOLUTION-CONTRACT §3.3 and SEMANTIC-CONTRACT §3 require on every reported row.
- T-A's "exact match at every rank" against brute force used the same hard-coded `F`. At `CBstar(2,2,2)` the literal `F_p` is empty for `p ≤ 4`, so the literal sector weight is 0 there, not T-A's 12/66/216.

Under the letter of fence 3 this strikes the numbers. I restore them on my own evidence: `F_p` is the whole leaf set on every eligible row I computed (the 16 table rows, 204,265 sweep rows, and 1,051 `t = 2` grid rows),
and `S < 0` on all of them. T-A and T-B are retained only with the explicit hypothesis `F_p(T) = P ∪ {v}`.

**Finding 4 (scope overclaim).** The return offers T-A, T-B and T-D-R1 "at a strictly more general hypothesis (`G − N[Q]` a disjoint union of stars of sizes `t_1, …, t_M`)".
Every formula is for uniform `t`, in `CBstar`'s root-plus-arm sector only.
- T-D-R1's biregularity fails for heterogeneous `t_i`: the up-degree `Σ_{empty i}(t_i + 1)` varies.
- In a general tree, a "leaf" of a star in `T − N[Q]` need not be a tree leaf, so it need not be a tag.
- The constant baseline 1 is specific to `Q = {r, v}` with `W_v = {r}`.

Allocation item (a) (general star-forest sectors) is therefore not delivered beyond `CBstar`.

**Finding 5 (T-C, T-D).**
- T-C is correct and elementary (the support singleton lies below no leaf pair).
- T-D-R1 is correct. Its proof is direct biregularity. At `t = 1` it is NM with SR-SECTOR's Route 2 proof, so it is not a contribution there.
- T-D-R2 is the classical Boolean-lattice LYM inequality, re-derived and unweighted.
- None of T-C or T-D controls the actual deletion image of an arbitrary `X ⊆ S^Q`. That image includes out-of-sector targets (Finding 1b), and (S) adds three switch families. So the "mixed-regime NM" the return names as open is not the right object on its own.

**Finding 6 (non-falsifiable checks).** None found. `K_{1,12}` and `CBstar(2,2,2)/7` compute supply − capacity and the `H_v`/`R_v` aggregate independently, and I confirmed both.
The `CB(8,92)` "fixed point" is an algebraic identity of `2^k C(736,k)`. It is valid as a `t = 1` consistency check of T-A, but it reproduces neither `|F| = 737` nor `S`. I reproduced both.

**Finding 7 (minor).** The sector-weight-range fact (values `{1} ∪ {≥3}`, odd at `t = 2`) is correct under `F = P ∪ {v}`, but the §5 prose ("never `1+2=2`") is garbled. The E8 gloss
"66 claw-leaf tags" was not verified by me. It is not load-bearing.

**Direction, overlap, competition and subtraction audit.** T-E's derivation is correct (`lc − g(lc) = [lc = 1]`), and there is no natural-number subtraction hazard in the scripts. T-B's comparison direction (upper to lower) is right.
Its defect is the image, not the direction. No step assumes `S ≤ 0` or uses the budget.

## Mechanism-equivalence and fence check

- **No refuted mechanism is revived.** The return's deletion-only statements, and my L1/P1, concern single sector families under `w_F`. The registry's
  `E993-R23-LITERAL-DELETE-ONLY-HALL` (REFUTED) is universal Delete-only Hall over every `X` of the r23 tagged top side, so there is no equivalence.
  The (SW) "template" is an accounting instruction ("sum over distinct targets via T-E, never per tag"), not an injectivity or domination statement. It is not
  the per-leaf, signed cross-tag or own-support unit-capacity key. As an instruction it is incomplete (Finding 2).
- **No closed region is re-proved** as a contribution, apart from T-D-R1 at `t = 1` (NM; Finding 5).
- **No census value enters a proof**, and there is no RTree wording.
- **(LIFT) and (INV) are not invoked**, so the claim of automorphism-free proofs is accurate.
- **Registry keys touched:**
  - `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: OPEN, untouched.
  - `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`: OPEN, untouched.
  - `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: `formally_verified`. It is used only as an asserted identity.
  - `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`: `proved_informal`, the precedent.
  - `E993-R23-LITERAL-DELETE-ONLY-HALL`: REFUTED, not revived.
  - `R30-CB-RECORD`: the record.
- **Alias check of my candidate** `E993-R30-CBSTAR2-WHOLE-SECTOR-DELETION-NONDEFICIENT` against the frozen 434-key `sources/authority/CLAIM-IDENTITY.json`: lexical near-hits are the
  `*STAR*`/`*NORMALIZED*` keys. Their statements (star-window closure, G1 handle trees, clique-partition comparisons) are different objects. The nearest run-local key, NM, is
  a shadow ratio, not a sector balance. No collision.

## Certification audit

- "**181,669 literal switch instances, zero mismatches**" → confirmed by my enumeration, but it must read "181,669 *choke-switch arcs*". They are not all literal switches (Finding 2),
  and they are not distinct targets.
- "T-B … **exact** … **iff** …; the deletion image … is the **entire** lower layer **exactly**; no distinct-target subtlety" → **struck** (Finding 1).
- §6 "T-B/T-A **recover** the standing deficit **and switch-capacity multiples exactly**" → **struck** for the multiples. No shipped script computes a switch capacity. The deficits are recovered (confirmed).
- T-A "cross-checked **exactly** against brute force … at **every** rank" → **narrowed** to "under a hard-coded `F = P ∪ {v}`" (Finding 3).
- "`x`, window **matching** the frozen record", and the §7 table's `n`/`α`/`x`/windows → confirmed for all 16 rows.
- "**3,102** configurations", "**3,115** total" → confirmed (3,102 + 13 uncapped `d = 8` rows).
- T-A/T-B/T-D offered "at a **strictly more general** hypothesis `t_1, …, t_M`" → **struck** (Finding 4).
- T-D-R1 "exhaustively checked on 5 `(M,t)` instances"; the T-C digest; replay byte-identity → replay confirmed for the four scripts I ran.
- Grades:
  - T-A: `proved_informal` is accepted with the hypotheses `F_p = P ∪ {v}` and uniform `t`, in `CBstar` only.
  - T-B: rejected as stated for `t ≥ 2`. At `t = 1` it is P8 and not new.
  - T-C, T-D-R1 (uniform `t`), T-D-R2 and T-E (choke switches): `proved_informal` is accepted.
  - The sector-weight range: accepted under the hypothesis.

## Verdict

verdict: retained_narrowed

headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Retained:**
- T-A, under `F_p(T) = P ∪ {v}` and uniform `t` in `CBstar`.
- T-C.
- T-D-R1 at uniform `t`.
- T-D-R2 (classical).
- T-E for choke switches.
- §7 as `bounded_computation`, re-derived here under the correct criterion with the selector computed.

**Rejected:**
- T-B as stated. It is replaced by Lemma C-T2-F-L1.
- The heterogeneous-star scope claim.
- The switch-multiple recovery claim.

**Narrowed:**
- The relation description and the (SW) template, which must include `s`-switches and support switches.

**Critic-derived advance (attributed to C-T2-F; STATED at a review stage; a `proved_informal` candidate that needs an isolated second read).**

*Proposition C-T2-F-P1.* Let `T = CBstar(d, m, 2)` with any `d, m ≥ 1`, and `M = dm`.
- **(i)** `Δ_k(T) ≥ 0` for `0 ≤ k ≤ M`. Hence `x(T) ≥ M + 1`, and every eligible `p` has `p ≥ M + 3`.
- **(ii)** If `F_p(T) ≠ {v}`, then for every `p ≥ M + 2` the whole root-plus-arm sector `X = S^Q_{p+1}` satisfies `Σ_X w_F ≤ Σ_{N_D(X)} w_F`, using deletion arcs alone.
  The inequality is strict when `P ⊆ F` and `X ≠ ∅`.
- **(iii)** With `F = P ∪ {v}`, `𝒲_{k} ≤ 𝒲_{k−1}` for every `k ≥ M + 2`, so T-B's in-sector inequality never fires in the eligible window.

*Proof of (i).* Write
`I(T) = x(1+x)f^{M} + (1+2x)Σ_j C(m,j) x^j(1+x)^{2dj} f^{d(m−j)}`, where `f = 1 + 3x + x²` is palindromic and real-rooted.
- Each product `P_j` is real-rooted, so it is log-concave by Newton's inequalities. It is also palindromic about `c_j = M + j`, so it is nondecreasing up to `c_j`.
- For `(1+2x)P_j`, the difference at `k` is `(P_{k+1} − P_k) + 2(P_k − P_{k−1})`. This is `≥ 0` for `k ≤ c_j`; at `k = c_j` use `P_{c+1} = P_{c−1}`.
- For `x(1+x)f^M`, `Δ_k = F_k − F_{k−2} ≥ 0` for `k ≤ M + 1`.
- Summing the terms gives the claim.

*Proof of (ii).* Use Lemma L1.
- `R = f^M` is palindromic about `M` and unimodal, so `R_k ≤ R_{k−1}` for `k ≥ M + 1`.
- With `φ := k − 1 − M ∈ [0, M − 1]` (the case `k − 1 = 2M` gives `X = ∅`), `N^max_{k−1} = C(M, φ)`.
- By palindromy, `G_k = 2M·[x^{M−1−φ}]f^{M−1} ≥ 2M·C(M−1, φ)·3^{M−1−φ} = 2(M−φ)3^{M−1−φ}C(M,φ) ≥ 2C(M,φ)`.
- Hence with `a = b = 1` the balance is `≤ C(M,φ) − G_k ≤ −C(M,φ) < 0`.
- With `a = 0` the balance is `−(G_k + G_{k−1} − G^max_{k−1}) ≤ 0`.

*Proof of (iii).* `𝒲 = f^{M−1}·(1 + 3x + (1+2M)x²)`. For `k ≥ M + 2`, every difference `F_{k−j} − F_{k−1−j}`, `j ≤ 2`, of the palindromic `f^{M−1}` lies past its centre `M − 1`, so each is `≤ 0`.

*Numerical support (`bounded_computation`).* (i)–(iii) hold on 320 grid trees (`d ≤ 8`, `m ≤ 40`). The excluded case `F = {v}` also holds numerically there, but it is unproved.
On every eligible row computed, `F_p(T)` is the whole leaf set, so the hypothesis of (ii) is met there.

*Scope.* This is one source family and deletion arcs only. It is not (HALL-COND) for other `X`, not (HALL), and not the aggregate.

*Consequence.* For `t = 2` it answers the return's Remaining obligation 2 at every scale: no eligible `(CBstar(d,m,2), p)` has a deletion-deficient whole root-plus-arm sector unless `F_p = {v}`.

*Heuristic (not a claim).* The per-star offset between the whole-tree and the sector mean rank is `(t/2 − 1)/(2^t + 1)`. Per choke, the block offset is `π_u(1 + d(t/2 − 1))`, which is negative only for `t = 1`, `d ≥ 7`.
This matches the record's `d ∈ {7, 8}` deficient rows and suggests `t = 1` is uniquely extremal.

## Remaining obligation

1. **(HALL-COND) for every `X ⊆ I_{p+1}` on `CBstar(d, m, t ≥ 2)`,** not only the whole sector. Any bound for `X ⊆ S^Q` must use the true deletion image (in-sector non-maximal states plus
   `B ∖ v` and `B ∖ r`) and all three switch families (choke, `s`, support). Neither T-D regime nor the "mixed NM" of the return's item 1 does this.
2. **An isolated second read of C-T2-F-L1 and C-T2-F-P1.** Then prove the `F = {v}` case of P1(ii), namely `R_k + C(M, k−1−M) ≤ R_{k−1}` for `k ≥ M + 2`.
3. **Whole-sector non-deficiency for `t ≥ 3`.** This needs a proof that `x(T) − 1` lies at or above the mode of `((1+x)^t + x)^M`, which is not palindromic for `t ≥ 3`. Then P1(ii)'s slack argument applies.
4. **A selector lemma: `F_p(CBstar(d,m,t)) = P ∪ {v}` at every eligible `p`.** It is `bounded_computation` only (204,265 plus 1,051 rows). T-A, T-B and L1 carry it as a hypothesis.
5. **The (SW) template restated with the `s`-switch** (image weight `starweight(B)`) **and the support switch** (image weight `w(B) − 2`, reaching the deletion-unreachable maximal states), counted over distinct targets.
6. **Unchanged:** no deficient cut, no statement about (HALL) or the aggregate.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-crit-T2-F/`. Everything uses the Python standard library only, with exact integers, and all jobs have finished.

The one background job (`own/sweep.py`, PID 42084) ran to completion. That was confirmed by `kill -0` on the literal PID. No job remains.

**My instrument, `own/` (script SHA-256 → output SHA-256):**

| script | script SHA-256 | output | output SHA-256 |
|---|---|---|---|
| `crit_lib.py` | `2c84a12441cb4efcaf898e690c5b1b5cfff2a1388645f66b3dfd547ccc1ecbd8` | (library) | |
| `closed.py` | `61e4253f02ab1f9d964c2b0bbd398ceba8f56b9ef7c42f341bb7959e47455110` | (library) | |
| `validate_closed.py` | `440650621097169f50761f1a9f43c8184f5adb3d7dd7a213bd98ec156b03a998` | (printed, all True) | |
| `validate_S.py` | `8933d795bf0973e7b30d88711e2f82edb611ac3f4584254df47db79615dbe887` | (printed, all True) | |
| `fixed_points.py` | `c75461d3c63aba197636404b7180cf75d115fb1aff255158ebe61a085a338d0d` | `fixed_points_output.json` | `e2e3d091319faba19ca46f40ce259a931f63c4658dad54ced3c83604c1b20cf5` |
| `cbstar_small.py` | `fcbedd5f65eb611127c5ab00d952333f7dfe9ffc58574c94caa1353a9a811002` | `cbstar_small_output.json` | `c4b60871417c1a47ad9b4c3ccf8395a4e6e955cf2a4eae67b15990e2e6b89b70` |
| `switch_census.py` | `ec8535436f78d86d574bdede1f3bcad97c592d4f079abb2cec037f3727fcf662` | `switch_census_output.json` | `f319aa90def3e7200a7148861a6407f64b97478d649ceb70e20856ace0d00630` |
| `te_332.py` | `25c8a284c86b7b62466b8c252417362a5ad484a465ac87b5cdebdd59bcc21fd6` | `te_332_output.json` | `4d3a2167e6e2e62f5b191f55ff446777c36fb9d2bc39b370668bb39d5a7b3306` |
| `balance_check.py` | `a9c30a8040b7447437e8f18e873ce913565fe41fa7cb9ad60e4bc6141d75aad6` | `balance_check_output.json` | `0bdb834dbbda5af594528f046700a3389451266467951ab3ac89e08f18d0775d` |
| `rows.py` | `bc4f0f98874ce39a5c9b207bff5bc17661661bca1dc04d40ca89a71473d0cd30` | `rows_A.txt`, `rows_B.txt` | `80f8d26d35f9c6e5b6573b875a681a1518cddd8afc28903d88507dc10a50ea65`, `834a9403c2049ed692a62e53c767ef3938af8f34e54a0508deb9708c0514bbb6` |
| `prop_t2_grid.py` | `8aa9afc61c304db5a0ca2eea417dc68781d6b46b2ca1655a1abc843d98611b74` | `prop_t2_grid_output.json` | `cc6941330d432c1c14d8bcd51f15e0d80dbfc4fd9ef30e9c50354e3bb27f2e30` |
| `sweep.py` | `f4542e882185a69f76b2e0362a895f8d0b29ddfbf9ef0815cdb32caa6cdcf538` | `sweep_output.json`, `sweep.log` | `28f17f08350801b9cd5feed943ae901b39d7f4480041931d7f7363befb3af019`, `723a8364c5548bbd080d0da8bf8c882c890ecbf9ea0403da9c7c57a4e96ae2f5` |

`closed.py`'s private-leaf `H_v` was corrected once during validation, to add the factor `(1+x)^{t−1}` for the star's remaining isolated leaves. Every run cited here used the corrected file, and `validate_S.py` passes on it.

**Replay, `replay/`:** byte-identical copies of the return's eight scripts (digests verified), plus four regenerated outputs, each byte-identical to the return's claimed digest.
