# Critique

Critic `C-T2-U` (orientation U, formal/structural) of route return `T2` (`C4-T-02 CB-PATTERN-UNIFORM-CLONE-TRANSPORT`,
orientation T), r30 Cycle 4 Stage 4, 2026-09-27.

**Boot acknowledgment.** Operating within VerityOS. Boot files read exactly: `/Users/ashtonsperry/VerityOS/verity.md`,
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS subsystem loaded.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read-boundary disclosures.**
1. The host injected the project `CLAUDE.md` and the user memory index into context at session start. I did not open
   or act on either.
2. I read for content only: the dispatch `control/dispatch/c4-stage4/DISPATCH-C-T2-U.md` (SHA-256 verified
   `e9c70e8e…ff32`), the two boot files, and the 14 capsule members. From the attack-brief file I read only the preamble
   (lines 1–19) and my seat's section (lines 45–71), after a heading-only `grep -n '^#'` on that single file to find the
   section. SR-C3-3 and SR-C3-5 are **not** capsule members and I did not read them. Every statement below about their
   content comes from the return's quotations or from capsule members.
3. I ran one non-recursive `ls -la` of `scratchpad/c4-T2/`, which is a granted directory. I ran one `find` rooted at my
   own scratch directory, to take the inventory and check for `__pycache__`. No other search was run.
4. **Process incident, self-disclosed.** The harness moved one of my foreground runs (`hetero_rows.py`, first version) to
   the background when it passed the 600 s tool timeout. To get its PID I ran `pgrep -f 'python3 -B hetero_rows.py'`.
   That is a pattern-matched process query. It returned only the PID; it is not a listing and it killed nothing. I then
   killed the job with `kill 39311`, a literal PID, and confirmed it was dead. I optimized the script and reran it in the
   foreground (17 s). No background job of mine remains.
5. No network, no installs, no Lean/lake invocation. Every script ran with `python3 -B`, and there is no `__pycache__`.

## Identity and seal audit

- **Capsule seal** (`control/c4-critic-capsules/T2-PACKET-MANIFEST.json`), recomputed canonically (sort_keys,
  `(",", ":")`, no trailing newline, `seal_sha256` removed): `53718cf8f5c4482904832c73b73f03811463b07f64088d5ea067e97c43f047bd`,
  which matches the dispatch. All 14 members match on bytes and SHA-256.
- **Stage 4 dispatch seal:** recomputed `784132f0726699b6f7ef5cbf07196f7d35d233d980799f25fdd6883cadde9229`, equal to its
  `seal_sha256`. **Stage 3 seal:** recomputed `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9`, equal to its
  `seal_sha256`; its manifest file digest `b9fbdd33…` matches the capsule entry. **Stage 2 seal:** recomputed
  `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`, matching the protocol.
- **Return digest:** `RETURN.md` is `3314c564…54c4` (51280 bytes) and matches the capsule. **Every digest the return lists
  (18 artifacts)** was recomputed from `scratchpad/c4-T2/`, and all 18 match.
- **Replay** was run copy-out-first into `scratchpad/c4-crit-T2-U/replay/` with `python3 -B`. All six generators exit 0
  and give byte-identical outputs (`cmp`) against the shipped outputs.
- The return carries the gate-31 line `Central obligation attempted: yes`, and it names the `S` instruments (§13). The
  process incident T2 self-disclosed (`ps aux`, which showed sibling F1/F2 command lines) is noted. It is not a
  mathematical defect, and no sibling content appears in the return.

## Independent re-derivation

I built my own instruments from `SEMANTIC-CONTRACT.md` §1 and from the return's own §4 statement of the criterion. They
are under `scratchpad/c4-crit-T2-U/own/`, and no T2 code is imported.

1. **Tree fidelity and fixed points (`crit_trees.py`).** The instrument runs a tree test (edge count, BFS connectivity and
   a separate union-find acyclicity check). It computes independence polynomials by a rooted DP, derives `α`, and computes
   `x` through rank `α` with the terminal difference included. It derives `F_p` from `Δ_p(T − v) < 0`. It computes
   supply and capacity by brute-force layer enumeration with the literal active weight (`(B∖{v}) ∩ W_v ≠ ∅`), and it
   computes `S` from separate DP polynomials of `T − H_v` and `T − R_v`. Those are two independent code paths, and
   `supply − capacity = S` is asserted on every row. Results, all equal to the common-brief fixed points:
   - `K_{1,12}/8`: 1980 / 3960 / −1980.
   - Path-star `(2,3,4)/7`: `n` 15, `α` 11, `x` 5, `|F|` 10, 1483 / 2701 / −1218.
   - Path-star `(2,2,4,3)`: `n` 18, `α` 13, `x` 6, window `[8]`.
   - `CB(8,92)`: `n` 1567, `α` 829, `x` 490, window `[492, 552]`.
   - `G(8^82, 7^2)`: `n` 1427, `α` 755, `x` 446, window `[448, 503]`.
   - `CB(1,7)/10`: `n` 24, `α` 15, `x` 8, eligible, `|F_p|` 8, 29190 / 58002 / −28812. This agrees with T2 §13.
2. **ρ₁ at the three first ranks (`hetero_rows.py`).** I recomputed `ρ_1 = r_1(p−1)/r_1(p−2)` with `a = 7`,
   `b = 8(m−1)+1`. The exact fractions equal T2's three literals, `460421124882845/462938713343604`,
   `1698319298589907/1707291739633300` and `4838946572060835/4863675235331932` (0.994562 / 0.994745 / 0.994916), and they
   agree with the allocation's decimals.
3. **The E1 criterion at every eligible rank (`crit_trees.py`, `crit_extend.py`).** For `CB(d,m)` with `d ≤ 8` and
   `m ≤ 30`, I computed the eligible window from the tree itself and checked conditions (i) and (ii) separately at every
   eligible rank. That is **1758 eligible rows; 520 fail the criterion, and every failure is a condition-(i) failure.**
   Condition (ii) fails at none of them.
   - Rows with `m ≤ 12`: 46 of 210 fail. By `d`: 1 → 9, 2 → 18, 3 → 14, 4 → 5.
   - Rows with `13 ≤ m ≤ 30`: 474 of 1548 fail. By `d`: 1 → 99, 2 → 148, 3 → 122, 4 → 76, 5 → 29.
   - First instance: `CB(1,7)/10`, `q = 6` (`a = 5`, `b = 2`, `j = 4`), where `r(4) = 85 > r(3) = 70`.
4. **Heterogeneous criterion at `G(8^82, 7^2)` (`hetero_rows.py`).** I checked all 248 achievable `(q, D_Q)` pairs at
   **every** rank of the window, 448–503 (56 ranks). The criterion holds at all 56, which agrees with T2's verdict at its
   6 ranks. The binding value, max ρ over the pairs, is **0.995530 at p = 448**. It is 0.988866 at 449, 0.917482 at 460,
   0.796108 at 480 and 0.684484 at 500.
5. **Poset identification and a self-contained normalized-matching proof (`claw_nm.py`).** Details are in Attacks A1
   and the Remaining obligation. The results:
   - Exact-matching deficiency between consecutive ranks of heterogeneous **claw products** equals
     `max(0, e_k(q) − e_{k−1}(q))` (elementary symmetric) on 248/248 instances.
   - T2's chain-product numbers disagree with that deficiency on 193/248.
   - My recursive normalized flow is built and verified exactly (Fractions) on 75 heterogeneous products.
   - Brute force confirms the multiplicative NM inequality on 8549 subfamilies.
6. **Condition (ii) universally (`tp_universal.py`).** I checked (TP-g) and (TP-h), in the return's §4 form, at every rank
   `1 ≤ j ≤ a+b+1` for all `0 ≤ a ≤ 30` and `1 ≤ b ≤ 30`. That is 543,120 `(a, b, j, α)` checks with **0 failures**. The
   proof is in A3.

## Attacks and findings

**A1 (fatal to obligation (c)). Theorem C2/C3 is proved on the wrong poset.** C1's poset is a product of **claws**. T2's
proof is for a product of **chains**. §8.1 sets C1's layer as the rank-`k` layer of `C_{q_1} × ⋯ × C_{q_M}`, with
"`C_q` the `q`-element chain `{0,…,q−1}`". C1's deficit `max(0, e_{p−1}(q) − e_{p−2}(q))` and the lemma
`|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)` live on the product of claws `K(q_i)`: a bottom plus `q_i = t_i + 1` atoms, i.e. one
"empty or one-of-`q_i`" choice per star. Its rank sizes are the elementary symmetric functions `e_k(q)` and its top rank
is `M`. Four pieces of evidence inside my grant fix this:
- The allocation calls the lemma "the normalized-matching property of **claw products**".
- The NM scope note that T2 itself quotes gives the up-degree as `Σ_{empty i}(t_i+1)`. In a product of claws an empty
  coordinate has `t_i + 1` upper covers. In a product of chains it has one.
- T2's own quotation of the setup has "`∂L_k = L_{k−1}` for `1 ≤ k ≤ M`", so the top rank is `M`. For chains it would be
  `Σ t_i`.
- The uniform-CB fixed point has `|R_j| = 2^j·C(736, j) = e_j(2,…,2)`. With T2's `C_2` factors this would be `C(736, j)`.

The two posets differ, not only in notation. For `q = (2,2)` the claw product has ranks `1,4,4` and the chain product has
`1,2,1`. For `q = (3,4,2)` they are `1,9,26,24` against `1,3,5,6,5,3,1`. On 193 of 248 instances T2's chain formula gives
the wrong claw-product deficiency (`claw_nm.py`). Once some `q_i ≥ 2`, the claw product is not rank-symmetric (`e_M ≠ e_0`), so it has no
symmetric chain decomposition. T2's own §6.3 argument, that `Λ^b` is not rank-symmetric, applies word for word, because
`Λ = K(2)`. T2's §8 method therefore **cannot** reach C1's poset.

Theorems C2 and C3 are true statements about chain products; I checked the construction and the proof and both are
correct. For chains of different lengths, Lemma R1 is applied to `D × C_{q_M}` at offset `c_D`, and the span identity
`2c_D + ℓ_D + q_M − 2 = n_P + q_M − 1` holds. The 785 cases are a check of the construction, not the proof. But they are
not C1's lemma, and §8.4's "this **is** the conclusion SR-C3-5c needed" is false. **C1 stays `conditional` on T2's
evidence.** One sub-point is fine: on the correct poset, the additive deficiency bound would suffice for C1's max-over-`X`
formula, because the bound holds for every `X` and `X = L_k` attains it. So T2's "exactly sufficient" reasoning is sound
in the abstract. It was applied to the wrong object.

**A2 (refutes a stated claim). "Condition (i) is proved in full generality" is false.** §6.1 proves only that
`r(t) = [y^t](1+y)^a(1+2y)^b` is log-concave. Condition (i) is `r_q(p−q) ≤ r_q(p−q−1)` at a specific rank. Log-concavity
gives unimodality, so (i) holds exactly when `p − q ≥ t*(a_q, b_q)`, and nothing in eligibility forces that. **46
eligible rows with `m ≤ 12` fail condition (i)**, and 520 of 1758 fail with `m ≤ 30`. The first is `CB(1,7)/10`. T2's own
§13 identifies that row as eligible, and T2's own sweep output records `first_p_where_criterion_holds = 12` for
`CB(1,7)`. The companion line "`bounded_evidence` for 'the criterion holds at every eligible `(d,m,p)`' … 3,948
zero-counterexample checks" is therefore contradicted by T2's own shipped data. `e1_criterion.py` never computes `α`,
`x` or eligibility. Its 3,840 checks run over `p ∈ [m+1, m+40]` regardless of eligibility, and many are `false`. They
test only the monotone-in-`p` pattern (Conjecture B1). As a consequence, **allocation obligation (a) as written ("for
every `CB(d,m)` and every eligible `p`") is false**. It is refuted at eligible rows, not merely unproved. E1 remains a
sufficient criterion, and these failures say nothing about (HALL) at those rows.

**A3 (the step T2 says "resists", which I close). Condition (ii) holds identically.** Theorem, attributed to this critic:
for every `a ≥ 0`, `b ≥ 1` and every rank `j ≥ 1`, (TP-g) and (TP-h) hold in the return's exact §4 form. The proof has
three steps.
1. `P_q = B_1^{a} × Λ^{b}` is the claw product `K(1)^a × K(2)^b`, with rank sizes `r(t) = e_t(1^a, 2^b)`.
2. By the normalized-flow theorem of the Remaining obligation, there is a flow along covers that carries the uniform
   distribution on rank `j` to the uniform distribution on rank `j − 1`.
3. A cover deletes either a Boolean coordinate (`α` drops by 1) or a ternary one (`α` unchanged). So the flow couples
   `α_j ~ N(·, j)/r(j)` with `α_{j−1} ~ N(·, j−1)/r(j−1)` so that `α_j − α_{j−1} ∈ {0, 1}`. That coupling gives
   `P(α_j ≤ α) ≤ P(α_{j−1} ≤ α)`, which is (TP-g), and `P(α_j ≤ α) ≥ P(α_{j−1} ≤ α−1)`, which is (TP-h), after
   multiplying by `r(j)·r(j−1) > 0`. For `j > a+b`, `r(j) = 0` and both inequalities read `0 ≥ 0`.

**Consequence: the E1 criterion is equivalent to condition (i) alone**, `ρ_q ≤ 1` for every `q`, i.e.
`p − q ≥ t*(qd − 1, d(m−q) + 1)` for all `q ∈ [1, m]`. This holds in the heterogeneous form with `(a_Q, b_Q)` too.
T2's §6.3 and Remaining obligation 1 ("attack (ii) via SR-C3-3's machinery") are superseded. The obstacle was not rank
symmetry; SCD was the wrong tool. Grade: STATED (critic-derived); the mathematics is complete here, so it is a
`proved_informal` candidate after an isolated second read. `tp_universal.py` (0/543,120) and the 0 condition-(ii)
failures among 1758 eligible rows corroborate it.

**A4. The heterogeneous reduction (§7) is asserted, not written.** The claim "nothing in SR-C3-3 Steps 1–3 uses `d`
being constant", and the reuse of Steps 3–5 "unchanged", have no written proof on the face. The return gives the
`(a_Q, b_Q)` bookkeeping and nothing more. I cannot check it against SR-C3-3, which is outside my capsule. One point needs
a written step:
- In the uniform case the flow's target loads are indexed by `q`. In the heterogeneous case, targets reached by deleting
  a choke from sources with different compositions receive loads indexed by `(q, D_Q)`.
- The statement "load `ρ_Q·w_F(A) ≤ w_F(A)` on every root-free target" then needs the per-target load to be a single
  `ρ_Q`. The composition of `Q` is determined by the target, so this is plausible, but it must be written.

"No new technique, no new risk" is not evidence. **Grade: STATED, not `proved_informal`**, pending a written proof or
the second read against SR-C3-3. The numeric record is sound and I confirmed it independently at all 56 ranks. With A3
it reduces to condition (i).

**A5. The "worst ratio" column in §7 is mislabeled.** `e1_heterogeneous.py` reports the **minimum** `r(j)/r(j−1)` over
the pairs. Its source comment says "worst (smallest)" and its docstring says "(tightest)". The binding quantity for
`ρ ≤ 1` is the maximum: 0.995530 at 448, against T2's 0.844223. The row is tighter than the `CB(8,·)` first ranks, not
looser. The script also hard-codes `n`, `α`, `x` for `G(8^82, 7^2)` and attributes them to "SEMANTIC-CONTRACT fixed
point". They come from the allocation. My DP derivation agrees with the values.

**A6. Smaller points.**
- §6.1 cites Newton's inequalities and Rolle from memory, which by the Cycle 3 ruling is an undischarged classical
  dependency. The log-concavity it needs has a two-line self-contained proof: Lemma 1 in the Remaining obligation,
  applied with `c = 1` and `c = 2`.
- §13 says `CB(1,7)/10` "reproduces **exactly** the fixed point already on the record (SEMANTIC-CONTRACT §1.2)".
  `SEMANTIC-CONTRACT.md` §1.2 has no `CB(1,7)` row, so the citation is unbacked. The numbers are correct; my instrument
  agrees.
- T2's WID instrument did not reproduce the common-brief fixed points before use. My instrument covers them.
- Grades `proved` and `bounded_evidence` are not on the `SOLUTION-CONTRACT.md` §4 scale. The route verdict
  `proved_informal` rests on the C1 discharge, which A1 strikes.

**Fidelity (Duty 2).** T2's §13 instrument counts active tags literally, uses no relation, derives `F_p` at rank `p`,
computes `x` through `α`, and asserts WID from two independent sides. My replay of it passes. No number downstream fails
on fidelity grounds. The failures above are mathematical, not fidelity failures.

## Mechanism-equivalence and fence check

- None of the ten refuted mechanisms is revived. The deletion-only statements are E1's own scoped, criterion-gated,
  non-sector clone transport with `w_F` capacities, which is not `E993-R23-LITERAL-DELETE-ONLY-HALL`. T2 says so (§7(d)),
  and it names the sector exclusion at `G(8^82, 7^2)/448` correctly.
- No closed region is re-proved. There is no RTree wording and no live-root read. No census value enters a proof, but
  T2's "3,948 zero-counterexample checks" is used as evidence for a universal claim it does not test (A2).
- (LIFT) and (DCB) are not used.
- **Claim identity (ruling 33).**
  - `E993-R30-CHAIN-PRODUCT-RANK-SHADOW-DEFICIT-BOUND` is a true predicate of its statement. But it is a classical
    consequence of de Bruijn–Tengbergen–Kruyswijk about chain products, it is not load-bearing for C1 (A1), and its
    stated relation to (NM), "fills NM's heterogeneous gap", is false: NM's gap lies on the claw product. I recommend it
    not be registered.
  - `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION` names a criterion, not a proposition. If registered after A4 is
    discharged, it should mirror E1:
    `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`.
  - Critic candidates, both STATED:
    - `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`: true for every `q_i ≥ 1` without further hypotheses.
    - `E993-R30-CB-MARK-CLONE-TYPE-PATH-CONDITIONS-HOLD-IDENTICALLY`: true for every `a ≥ 0`, `b ≥ 1`, `j ≥ 1`.
  - Lexical alias check, limited to key names visible in my capsule, against (NM)
    `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (uniform `q`) and E1: no collision. The first
    candidate extends (NM) to heterogeneous `q`, which is exactly the documented gap. The registry file itself is not in
    my capsule, so a full `alias_patterns` check is left to the synthesis.
  - (HALL) and the primary aggregate keep their master names, and both are untouched.
- **Plateau test (gate ruling 30):** the return supplies none of items (a)–(d). My critic-derived results are
  outcome-B-type lemmas and do not supply (a)–(d) either.

## Certification audit

Struck or corrected literals:
1. §8.4 "this **is** the conclusion SR-C3-5c needed", "the specific undischarged dependency … is now discharged", and
   "the controller may consider promoting C1". **Struck** (A1).
2. §5/§6.2 "condition (i) is proved in full generality". **Struck** (A2). Only log-concavity is proved.
3. §6.2/§11 "`bounded_evidence` … criterion holds at every eligible `(d,m,p)` … 3,948 zero-counterexample checks".
   **Struck**. The sweep does not test eligibility and contains eligible failures (A2).
4. §7 "worst ratio (exact)" column (0.844223 … 0.601985). **Corrected**: these are minimum ratios. The binding maximum is
   0.995530 at `p = 448` (A5).
5. §13 "reproduces exactly the fixed point already on the record (SEMANTIC-CONTRACT §1.2)". **Struck** as a citation;
   the numbers stand.
6. §11 grades `proved` for log-concavity, C2 and C3. They are not on the scale. Log-concavity and C2/C3 are true, and they
   are `proved_informal` only as statements about chain products.
7. §7 heterogeneous reduction graded `proved_informal`. **Narrowed to STATED** (A4).
8. Route verdict `proved_informal`. **Overstated.**

Backed literals, confirmed by replay and by my own instrument where marked:
- All 18 artifact digests.
- Byte-identical replay of all six generators.
- 785 SCD cases (chain products; the brief's "786" is not the return's number).
- 386 nontrivial + 90 trivial = 476 deficiency rows (chain products).
- 224 log-concavity pairs.
- 248 pairs per rank at `G(8^82, 7^2)`, with the criterion holding at the six ranks listed. My instrument confirms all 56.
- `n = 1427`, confirmed by my instrument.
- The three `ρ_1` fractions, confirmed by my instrument.
- `CB(1,7)/10` 29190 / 58002 / −28812, confirmed by my instrument.
- 34 WID rows with 0 failures (replayed).

## Verdict

verdict: retained_narrowed
headline_resolved: no

**What is retained:**
- The heterogeneous-criterion record at `G(8^82, 7^2)`, as `computer_assisted` and conditional on the STATED
  heterogeneous reduction (A4). My instrument confirms it at all 56 eligible ranks, with binding ρ 0.995530.
- The `ρ_1` reproductions.
- Log-concavity, at its true scope.
- Theorems C2 and C3 as correct statements about chain products that carry no weight in the run.

**What is struck:** the C1 discharge (wrong poset), "condition (i) proved", the universal `bounded_evidence` line, and
the route's `proved_informal` verdict.

**Critic-derived results** (STATED; the mathematics is complete here, so they are `proved_informal` candidates after an
isolated second read):
- **(CD-1)** A self-contained proof of the literal multiplicative normalized-matching lemma
  `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)` for heterogeneous claw products. This is the lemma C1 is conditional on. The synthesis
  may take it to a second read as the discharge T2 aimed at, provided the second reader confirms against SR-C3-5c that
  C1's poset is the claw product.
- **(CD-2)** Condition (ii) of E1 holds identically, so the E1 criterion reduces to `max_q ρ_q ≤ 1`.
- **(CD-3)** Obligation (a) as allocated is false at eligible rows: 520 of 1758 rows with `d ≤ 8`, `m ≤ 30`, as
  `bounded_computation`.

## Remaining obligation

**(CD-1) proof, for the second read.** Let `K(c)` be the poset with a bottom `0` and `c ≥ 1` atoms. Let
`P = K(q_1) × ⋯ × K(q_M)`, with rank equal to the number of non-bottom coordinates, `L_k` its rank-`k` layer, and
`|L_k| = e_k(q)`. A *normalized flow at level `k`* is a nonnegative function on covers `(x ∈ L_k, y ∈ L_{k−1})` in which
every `x` emits exactly `1/|L_k|` and every `y` absorbs exactly `1/|L_{k−1}|`.
- *Lemma 1.* If `p_0, …, p_N > 0` is log-concave and `c > 0`, then `E_k = p_k + c·p_{k−1}` is positive and log-concave.
  Expanding, `E_k² − E_{k−1}E_{k+1} = [p_k² − p_{k−1}p_{k+1}] + c[p_k p_{k−1} − p_{k−2}p_{k+1}] + c²[p_{k−1}² − p_{k−2}p_k]`.
  The middle bracket is `≥ 0` because the product of the outer two LC inequalities gives it after dividing by
  `p_k p_{k−1} > 0`. If `p_k p_{k−1} = 0`, then `p_{k+1} = 0`.
- *Lemma 2.* Suppose `P` has LC positive rank sizes `p_j` and a normalized flow at every level. Then `P × K(c)` has one
  at every level `k`, built as follows. Write `E_k = p_k + c·p_{k−1}` and
  `λ = 1 − p_{k−2}E_k/(p_{k−1}E_{k−1})`. By LC, `λ ∈ [0, 1]`, because `p_{k−2}E_k ≤ p_{k−1}E_{k−1}` is equivalent to
  `p_{k−2}p_k ≤ p_{k−1}²`.
  - Send `(x, 0)` along `P`'s level-`k` flow, scaled by `p_k/E_k`.
  - Send `(y, a)` with mass `λ/E_k` to `(y, 0)`.
  - Send `(y, a)` along `P`'s level-`(k−1)` flow in the same atom `a`, scaled by `(1−λ)p_{k−1}/E_k`.

  Every vertex emits `1/E_k`. Each `(y, 0)` absorbs `(p_k + cλp_{k−1})/(p_{k−1}E_k) = 1/E_{k−1}`, and each `(z, a)`
  with `z ∈ L_{k−2}(P)` absorbs `(1−λ)p_{k−1}/(p_{k−2}E_k) = 1/E_{k−1}`. Both are direct substitutions of `λ`, and
  `claw_nm.py` checks them exactly. Edge cases: at `k = 1`, `λ = 1`; at `k = N+1`, the `(x, 0)` part is empty.
- *Theorem.* By induction from `K(q_1)`, where atoms go to the bottom with `1/q_1` each, every `P` has normalized flows at
  every level. Pushing uniform mass on `X ⊆ L_k` through the flow gives `|X|/e_k ≤ |∂X|/e_{k−1}`. The deficiency formula
  `max_X (|X| − |∂X|) = max(0, e_k − e_{k−1})` follows, with equality at `L_k` or `∅`.

**What remains open after this critique:**
1. Confirm, against SR-C3-5c, that C1's poset is the claw product and that its only missing ingredient is this lemma.
   If both hold, C1 moves from `conditional` to `proved_informal` on CD-1, by the synthesis's act.
2. Condition (i) alone, i.e. `p − q ≥ t*(qd − 1, d(m − q) + 1)` for every `q`, is the entire E1 criterion. It is false at
   some eligible ranks (A2). The correct outcome-B target is to characterize the eligible `(d, m, p)` where it holds. The
   uniform `ρ ≤ 1` question at the `CB(8, ·)` first ranks and at `G(8^82, 7^2)` reduces to that characterization.
3. Write the heterogeneous flow step (A4).
4. None of this touches the open lemma at the three `CB(8,·)` first ranks: (O2) as narrowed by SR-C3-4, meaning families
   meeting the sector, V⁺ and S/O⁺, under (D) ∪ (S). (HALL) stays OPEN.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-crit-T2-U/`
(SHA-256):

- `own/crit_trees.py` `2800aa64183a1c09bf195db64761028da5524fb6b1a623a895769ef78a280011` → `own/out_crit_trees.json`
  `eb25ccca1d6a6cf30c555cc6c64e611e971cb24ed80ea8ab645a87712d9d6bac`
- `own/crit_extend.py` `0bd9393a99485b8bf9dd43a4003d8b8cb830eb4ac8c53164e8c0c7366967b539` → `own/out_crit_extend.json`
  `6f8560902864fbd512f8c1b2174a20f0353eef522a0ecde884a4ef8dc0d306a5`
- `own/hetero_rows.py` `8f128d5f0a1534f7b873dc936740396f2893004c92568ff513773294b2c67dad` → `own/out_hetero_rows.json`
  `f7cef2a09f69ea267fe9bed8fdc614310f7fc060d393546815efeee555513e97`
- `own/claw_nm.py` `7bed97b6eb9961a0a0da66d81bfa3899f8821584abe37c635932edeeaa686491` → `own/out_claw_nm.json`
  `6c0c99c4e9f8854e73620d781671fbc5a4417ad3c35693d4f4075ab70e10e7cd`
- `own/tp_universal.py` `4d818c2ac8c0de9240745c4eb86b527b37fd7fd551c3ab2f323d6e255eb3478d` → `own/out_tp_universal.json`
  `985ac77568f5c6e0510a36387f718966c287eaee8186a97ded808006d8ede920`
- `own/err_*.txt`: progress lines, or empty (`e3b0c442…`).
- `replay/`: copies of T2's six generators and shipped outputs (`orig_out_*`), plus the replay outputs (`out_*`,
  `err_*`). The digests equal the return's inventory, and every output is byte-identical.

Replay: `cd own && python3 -B <script>.py > out_<script>.json 2> err_<script>.txt` for each of the five scripts. The
total run time is under 30 s. There are no background jobs.
