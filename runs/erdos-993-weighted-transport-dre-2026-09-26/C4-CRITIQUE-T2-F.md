# Critique

**Critic:** `C-T2-F` (orientation F, falsify), Cycle 4 Stage 4, r30. **Assigned return:** `cycles/cycle-4/stage3/returns/T2/RETURN.md`
(route `C4-T-02 CB-PATTERN-UNIFORM-CLONE-TRANSPORT`, orientation T, seat T2).

**Boot acknowledgment.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I read no other VerityOS file. The host put the project `CLAUDE.md`
and the user memory index into context at session start. I did not open either file and did not act on either.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: `claude-opus-5-5[1m]`.

**Plateau-test line (gate ruling 30):** the return supplies none of items (a)–(d). It proves no (HALL) theorem at any scope,
exhibits no cut, and has no Lean component.

## Identity and seal audit

- Dispatch `DISPATCH-C-T2-F.md`: SHA-256 `6f693036d18e462e9543ea285309931f3308fec04a7d4637d0bb90afdaea377f`, matches.
- Capsule `T2-PACKET-MANIFEST.json`: recomputed canonical seal `53718cf8f5c4482904832c73b73f03811463b07f64088d5ea067e97c43f047bd`,
  matches. All 14 members match their listed digest and byte count.
- Stage 4 dispatch seal: `784132f0726699b6f7ef5cbf07196f7d35d233d980799f25fdd6883cadde9229`, matches. Stage 3 seal:
  `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9`, matches. Stage 2 seal:
  `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`, matches the charter value.
- The return's literals "1113 members" (Stage 2) and "981 files" (`SOURCE-DIGESTS.json`) are confirmed.
- All 18 artifact digests in the return's §12 inventory match the files under `scratchpad/c4-T2/`. I copied them out to my own
  scratch and replayed all six generators with `python3 -B`. All exited 0, and every `out_*`/`err_*` file is byte-identical to the
  shipped one (`cmp`). The return's "byte-identical" replay literal is confirmed.
- Process: T2 disclosed its own `ps aux` full process listing, which exposed the command lines of sibling seats F1 and F2. I note
  it. It is not a mathematical defect, and I found no F1 or F2 content in the return.
- **My read-boundary disclosures.**
  1. A heading-only `grep -n '^#'` on `C4-CRITIC-ATTACK-BRIEFS.md` printed the other seats' section titles. I read the body only
     for the preamble and the T2 section.
  2. I ran single-file `grep` calls on capsule members: `C4-ALLOCATION.md`, `SEMANTIC-CONTRACT.md`, `C4-CRITIC-COMMON-BRIEF.md`,
     and T2's copied-out scripts.
  3. I ran one non-recursive `ls -la` of `scratchpad/c4-T2/`, which is granted.
  4. `seals.py` ran under plain `python3` without `-B`. It imports no local module, and no `__pycache__` exists in my scratch.
  5. I read no `sources/` file, no second read, no other return or critique, and no registry file.

## Independent re-derivation

My own instrument is `own/treeinst.py`. It is built from `SEMANTIC-CONTRACT.md` §1 alone:

- a tree test (edge count, BFS connectivity and union-find acyclicity, run separately);
- independence polynomials by a canonical-form memoized rooted DP on the original carrier;
- `x` computed through rank `α`;
- `F_p` derived from `Δ_p(T − v) < 0`;
- `S = Σ_F [q_v(p) − q_v(p−1)]` from DPs of `T − {v, s_v}` and `T − N[s_v]`;
- supply and capacity from literal independent-set enumeration with the literal active-tag test `(B ∖ {v}) ∩ W_v ≠ ∅`.

**Fixed points reproduced before any other use:**

| Tree / rank | Reproduced values |
|---|---|
| `K_{1,12}/8` | `n` 13, `α` 12, `x` 6, 12/12 favorable, 1980/3960, `S` −1980 |
| path-star `(2,3,4)/7` | 1483/2701/−1218 |
| path-star `(2,2,4,3)/8` | 8033/13467/−5434 |
| `CB(8,92)/492` | `n` 1567, `α` 829, `x` 490, window [492, 552], 737/737 favorable, `S < 0` |
| `G(8^82,7^2)` | `n` 1427, `α` 755, `x` 446, window [448, 503] |

The `Δ_0 = n−1` and `i_2` identities also hold. On every brute-forced row, WID is checked from two independent sides (DP-based
`S` against literal enumeration of `w_F`). I did not rebuild the `T_m` flows, the arc counts or the A000055 tree census; my
instrument does not use them.

**The route's claims, re-derived:**

1. **ρ₁ record fractions.** Recomputed with my own code at `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`. The three reduced
   fractions equal the record, and `q = 1` is the argmax of `ρ_q` at each row. T2's "3/3 exact match" is confirmed.
2. **Theorem C2 and Theorem C3 on chain products.** I read both proofs line by line. The staircase peeling handles unequal side
   lengths, each shift is an exact order isomorphism, and the span arithmetic `2c_D + ℓ_D + q_M − 2 = n_P + q_M − 1` is right.
   C3's injection and the argument `N_j = #{c_i ≤ j}` for `j ≤ N/2` are right. One cosmetic slip: C3's second case is headed
   `k > ⌈N/2⌉`, but it must cover `k > N/2`, as the boundary paragraph itself does. **As statements about a product of chains,
   C2 and C3 are correct.** They are the classical de Bruijn–Tengbergen–Kruyswijk decomposition and its standard corollary. The
   decisive problem is that this is the wrong poset (finding A1).
3. **The E1 criterion at eligible ranks.** This is the check T2 never ran; T2's sweep ignores eligibility (finding A2). I used my
   own implementation of the criterion exactly as T2 §4 quotes it, at every eligible `p` from my own `x` and `α`.
4. **The heterogeneous criterion at `G(8^82,7^2)`.** I checked all 56 eligible ranks, not T2's six (finding A4).
5. **C1's actual lemma on claw products.** I tested it directly and proved it (finding A1 and the advance under `## Remaining
   obligation`).

## Attacks and findings

**A1 (decisive for obligation (c)): Theorem C3 is proved for the wrong poset, so C1's import is NOT discharged.**

The lemma C1 depends on is the normalized-matching property of **claw products**, `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)`
(`C4-ALLOCATION.md` lines 45–47 and item 2(c); the attack brief says the same).

- Here `e_k(q)` is the **elementary symmetric function**, the rank size of `Π_i K(q_i)`. `K(q)` is a bottom element below `q`
  atoms, so the ranks run `0..M`.
- This agrees with the return's own §8.1, which says `∂L_k = L_{k−1}` for `1 ≤ k ≤ M`.
- It also agrees with NM's scope note as T2 quotes it: the up-degree is `Σ_{empty i}(t_i+1)`, and the uniform bound
  `k|X| ≤ q(M−k+1)|∂X|` is exactly claw-product biregularity. It is not a chain-product fact.

T2 instead proves its bound for **chains** `C_{q_1} × ⋯ × C_{q_M}`. Its code redefines `e_k(q) := [y^k] Π(1 + y + ⋯ + y^{q_i−1})`
(`chain_scd.py` line 138), and `nm_bound_check.py` enumerates chain products.

The two posets differ, and T2's formula gives wrong deficits on the claw product (my `own/claw_nm.py`):

| `q` | Claw rank sizes `e_k` | T2's chain rank sizes |
|---|---|---|
| (2,2) | 1, 4, 4 | 1, 2, 1 |
| (3,4,5) | 1, 12, 47, 60 | 1, 3, …, 1 |

| `q`, `k` | Exact claw deficit (max matching) | `max(0, e_k − e_{k−1})` | T2's chain formula |
|---|---|---|---|
| (2,2), 1 | 3 | 3 | 1 |
| (2,2,2), 2 | 6 | 6 | 0 |
| (3,3), 2 | 3 | 3 | 1 |

§8.4's "this **is** the conclusion SR-C3-5c needed", §8's "exactly sufficient", §10's "fills exactly that documented gap" in NM,
and §11's "the dependency is discharged" are therefore false. T2's own §6.3 obstruction also applies to the true object: `K(q)`
has rank sizes `1, q`, which are not symmetric, so a claw product has no symmetric chain decomposition and §8's method cannot
reach C1.

**A2 (decisive for obligation (a)): the universal E1 criterion is FALSE at eligible rows. Condition (i) is not "proved in full
generality".**

§6.1 proves only that `r(t) = [y^t](1+y)^a(1+2y)^b` is log-concave. That shows (i) holds on a final segment of `j` for each fixed
`q`. It does not show `p − q ≥ t*(qd−1, d(m−q)+1)` for every `q`, which is what (i) requires at a given eligible `(d, m, p)`.

My `own/crit_eligible.py` evaluates the criterion at every eligible rank of `CB(d,m)`, `d ≤ 8`, `m ≤ 15`:

- **it fails at 90 of 364 eligible rows, every time through condition (i)**;
- `own/crit_scope.py` extends this to `m ∈ [16, 40]`: (i) fails at 918 of 2903 eligible rows.

Every failure has `d ≤ 5`, and `CB(d,m)` fails at some eligible rank for every `m ≥ 16` when `d ≤ 5`. Two examples:

- `CB(1,7)/10` (`n` 24, `α` 15, `x` 8): (i) fails at `q = 6` (`r(4) = 85 > 70 = r(3)`) and at `q = 7` (`50 > 27`).
- `CB(5,15)/53` (`n` 168): fails at `q = 14`.

Twenty `(d,m)` pairs fail at **every** eligible rank. The return itself holds the counterexample: its §4 quotes "`CB(1,7)/10` fails
it", and its §13 confirms that `CB(1,7)/10` is eligible.

"Grade `bounded_evidence` for the criterion holds at every eligible `(d,m,p)`" must therefore become **REFUTED as stated**. Obligation
(a) as the allocation words it is unattainable. A critic-derived restriction is under `## Remaining obligation`.

**A3: the "3,948 zero-counterexample checks" are not checks of the universal claim.** `e1_criterion.py` sweeps
`p ∈ [m+1, m+40]` without computing eligibility. It records where the criterion first turns true, so the sweep is full of criterion
failures (for example `CB(1,1)` is false at `p = 2`). What it tests is monotonicity (Conjecture B1), not the criterion. At
eligible ranks I also find no B1 reversal (0 across the 364 rows). That is consistent with B1, which stays a `conjecture`, and T2
never uses B1 as a premise.

**A4: the heterogeneous extension survives, but its table is mislabelled.**

- In `e1_heterogeneous.py`, the "worst ratio" keeps the **smallest** `ρ` (`if rj*worst[1] < worst[0]*rjm1`).
- The true maximum at `p = 448` is `ρ = 0.995530`, attained at `(q, D_Q) = (1, 7)`, the degree-7 choke. That is tighter than all
  three uniform first-rank `ρ₁` values. T2 reports 0.844223.
- At `p = 503` the true maximum is 0.668509, against T2's 0.601985.
- With my own implementation, the criterion holds at **all 56** eligible ranks `[448, 503]` (`bounded_computation`, critic-derived
  extension of T2's six).
- `α = 755` and `x = 446` are hard-coded in T2's script. My DP derives the same values.

**A5: the small heterogeneous corroboration is eligibility-blind.** For the pattern `(3,3,3,2,2)` (`n` 34, `α` 19, `x` 10), the
**only** eligible rank is `p = 12`, and T2's own output shows the criterion **false** there. The ranks `p ≥ 13`, where it is "true
from … onward", are all non-eligible (`3p ≥ 39`). This is not evidence about eligible rows.

**A6: the heterogeneous reduction (§7).** I re-derived the adjacency count independently:

- in-choke private leaves are free Boolean positions, giving `a_Q = D_Q − 1` once the mark is fixed;
- out-choke `b–c` pairs and the arm `s–v` are ternary, giving `b_Q = D_tot − D_Q + 1`, with `r ∉ B`;
- the rank is `j = p − |Q|`.

The indexing is right. The rest of the reduction, "SR-C3-3 Steps 3–5 unchanged", is inherited from a second read that is not in my
capsule, so I cannot verify it. It is right only if that flow never moves load between different choke sets, and the criterion's
same-`q` form suggests it does not. Grade: `proved_informal` **conditional on the inherited steps**. The second read or the
synthesis must confirm it.

**A7: log-concavity (§6.1) cites Newton's inequalities from memory.** Under the Cycle 3 ruling, that citation is an undischarged
dependency. The 224-pair check is not a proof. Repair (critic-derived): if `N` is log-concave and positive on an interval, then
`E_k = N_k + cN_{k−1}` with `c > 0` satisfies

`E_k² − E_{k−1}E_{k+1} = (N_k² − N_{k−1}N_{k+1}) + c(N_kN_{k−1} − N_{k−2}N_{k+1}) + c²(N_{k−1}² − N_{k−2}N_k) ≥ 0`.

Multiplying by the factors `(1+y)` and `(1+2y)` one at a time then gives the claim. Even repaired, it does not give condition (i)
(A2).

**A8:** §13 says `CB(1,7)/10` "reproduces exactly the fixed point already on the record (SEMANTIC-CONTRACT §1.2)". The numbers
29190 / 58002 / −28812 are correct; my instrument reproduces them from two sides. But `SEMANTIC-CONTRACT.md` contains no `CB(1,7)`
row, so the attribution is struck.

## Mechanism-equivalence and fence check

- **Heterogeneous E1 (§7).** It is a deletion-only transport, but restricted to non-sector families under the active weight `w_F`
  and gated by a criterion. It is not `E993-R23-LITERAL-DELETE-ONLY-HALL`, which is unweighted and covers the complete top side.
  T2 states this on its face, as (d) requires. It is none of the other nine refuted keys.
- **C2 and C3.** These are abstract poset facts with no Hall content. They re-prove no closed region of the run. They do re-prove
  a classical theorem, which is not a run contribution.
- **Census use.** No census value enters a proof. The only universal-sounding numeric claim (A2 and A3) is struck.
- **Other fences.** No RTree wording appears. No live root was read. (LIFT) and (DCB) are unused. `F_p` is derived in T2's WID
  instrument, and `supply − capacity = S` is asserted there on two sides.
- **Claim identity (ruling 33).**
  1. `E993-R30-CHAIN-PRODUCT-RANK-SHADOW-DEFICIT-BOUND` is true as a predicate about chain products. It is classical and has no
     consumer in the run, and it must **not** be registered as C1's discharge or as a scope note to NM, since that would be a
     false alias.
  2. `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION` names an object rather than stating a predicate. If it is registered, it
     should read `…-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`. Mathematically it contains
     E1, so it may be better as a scope note on E1.
  3. (HALL) and the primary aggregate keep their master names and stay OPEN.

## Certification audit

| Literal (location) | Ruling |
|---|---|
| "condition (i) is proved in full generality" (§5, §6.2, Remaining obligation 1) | **STRUCK.** False at 90 of 364 and 918 of 2903 eligible rows (A2). Only log-concavity is proved, and only modulo the citation (A7). |
| "criterion holds at every eligible `(d,m,p)`", `bounded_evidence` (§5, §11) | **STRUCK. The statement is refuted** (A2). |
| "3,840 + 3×36 = 3,948 zero-counterexample checks" (§6.2) | **STRUCK** (A3). |
| Theorem C2 / C3 "proved" (§8.2–8.3, §11) | Retained as chain-product theorems (classical). |
| "C1's missing ingredient discharged", "exactly sufficient", "fills exactly that documented gap", "the controller may consider promoting C1" (§8.3–8.4, §10, §11, verdict) | **STRUCK** (A1). |
| "785 cases", "386 nontrivial instances, 0 mismatches" | Replayed and confirmed. They certify chain-product statements only. |
| §7 "worst ratio (exact)" column | **STRUCK and corrected.** It is the minimum `ρ`, printed as a decimal. True maxima: 0.995530 at `p = 448`, 0.668509 at `p = 503` (A4). |
| "criterion holds for every pair" at the 6 ranks of `G(8^82,7^2)` | Confirmed, and extended by me to all 56 eligible ranks. |
| "monotone-once-true … corroborating B1" for the small heterogeneous instance (§7) | **STRUCK** as eligibility-blind (A5). |
| "exact match, 3/3" ρ₁ | Confirmed independently. |
| §13 "fixed point already on the record (SEMANTIC-CONTRACT §1.2)" | Numbers confirmed; **attribution STRUCK** (A8). |
| "log-concavity … proved (self-contained)" (§11) | Narrowed to "cited (Newton)". Repairable by A7's elementary induction. |
| "byte-identical", every §12 digest, "1113 members", "981 files" | Confirmed. |
| Route verdict `proved_informal` | Overstated. The one load-bearing "proved" discharge is struck. What survives is the conditional heterogeneous reduction and one computer-assisted row. |

The return's `## Remaining obligation` is not exact:

- item 1 treats (i) as done and (a) as a true statement still awaiting proof, when (a) is false for `d ≤ 5`;
- item 3 describes the gap as "additive vs multiplicative", when it is "chain vs claw";
- item 5 presupposes a discharge that did not occur.

## Verdict

verdict: retained_narrowed
headline_resolved: no

What is retained:

- the heterogeneous `(a_Q, b_Q)` indexing of E1 (§7), `proved_informal` conditional on SR-C3-3's inherited Steps 3–5;
- the criterion at `G(8^82,7^2)` as a `computer_assisted` record, now covering all 56 eligible ranks by my instrument;
- C2 and C3 as correct classical chain-product facts with no run consumer;
- the ρ₁ reproduction;
- log-concavity, with the proof repaired (A7).

What is struck:

- the discharge of C1 (wrong poset);
- "condition (i) proved";
- the universal E1 criterion, which is refuted at eligible rows;
- the mislabelled ratio table;
- the eligibility-blind corroborations.

Obligation (c) is nevertheless now met, by me and not by T2; see the advance below. Chartered opus/medium; transport-resolved model
opus (explicit parameter); runtime-reported model id: `claude-opus-5-5[1m]`.

## Remaining obligation

**Critic-derived advance (C-T2-F): the claw-product normalized-matching lemma, proved self-contained.** Grade: `proved_informal` as
stated here. It needs an isolated second read before registration. Suggested key: `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`.
The lexical alias check against the registry is left to the synthesis, because the registry is not in my capsule. Mathematically,
its uniform case is exactly NM's uniform bound `k|X| ≤ q(M−k+1)|∂X|`.

**Statement.** Let `q_1, …, q_M ≥ 1` and `P = Π_i K(q_i)`, ranked by the number of nonzero coordinates, so that
`|L_k| = e_k(q)`. For every `1 ≤ k ≤ M` there is a nonnegative rational flow on the cover pairs `(x ∈ L_k, y ∈ L_{k−1})` such that
every `x` sends out `1/e_k` and every `y` receives `1/e_{k−1}`. Hence `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)` for every `X ⊆ L_k`.

**Proof.** Induction on `M`, carrying the claim that `e(q)` is positive and log-concave on `[0, M]`. The base case `M = 0` is
trivial.

1. **Setup.** Let `N_j := e_j(q_1..q_{M−1})`, write `c := q_M`, and let `E_j = N_j + cN_{j−1}`. The layer splits as
   `L_k = L_k(P′)×{0} ⊔ L_{k−1}(P′)×[c]`, where `P′ = Π_{i<M} K(q_i)`.
2. **The flow.** Set `α = N_k/E_k`, `β = N_{k−2}/E_{k−1}` and `γ = 1/E_k − N_{k−2}/(N_{k−1}E_{k−1})`, with `N_{k−1} > 0`.
   - Put `α·f′_k` on the pairs `((a,0),(a′,0))`. This term is absent when `k = M`, since then `N_M = 0` and `α = 0`.
   - Put `β·f′_{k−1}` on the pairs `((b,j),(b′,j))`. This term is absent when `k = 1`.
   - Put `γ` on each pair `((b,j),(b,0))`.

   Here `f′_k` is the inductive flow of `P′` from rank `k` to rank `k−1`, and every pair above is a cover pair of `P`.
3. **Outflows.** Each `(a,0)` sends `α/N_k = 1/E_k`, and each `(b,j)` sends `β/N_{k−1} + γ = 1/E_k`.
4. **Inflows.** Each `(b′,j)` receives `β/N_{k−2} = 1/E_{k−1}`. Each `(a′,0)` receives `α/N_{k−1} + cγ`. Multiplying that
   quantity by `N_{k−1}E_kE_{k−1}` gives `E_{k−1}(N_k + cN_{k−1}) − cN_{k−2}E_k = E_k(E_{k−1} − cN_{k−2}) = E_kN_{k−1}`, so the
   inflow is `1/E_{k−1}`.
5. **Nonnegativity.** `γ ≥ 0` is equivalent to `(N_{k−1} + cN_{k−2})N_{k−1} ≥ (N_k + cN_{k−1})N_{k−2}`, which is equivalent to
   `N_{k−1}² ≥ N_kN_{k−2}`. That is the inductive log-concavity.
6. **Log-concavity of `E`.** It follows from the three-term expansion in A7. The middle term `N_kN_{k−1} ≥ N_{k−2}N_{k+1}` holds by
   log-concavity together with positivity on an interval. Positivity holds because `E_j ≥ N_j > 0` for `j < M` and
   `E_M = cN_{M−1} > 0`.
7. **Conclusion.** For `X ⊆ L_k`, `|X|/e_k` is the flow out of `X`, which is at most the capacity of `∂X`, namely
   `|∂X|/e_{k−1}`. ∎

**Consequence (C1's consumed form).** `max_{X ⊆ L_k}(|X| − |∂X|) = max(0, e_k − e_{k−1})` for `1 ≤ k ≤ M`. The upper bound comes
from normalized matching. Equality is attained at `X = L_k`, since `∂L_k = L_{k−1}`, or at `X = ∅`.

**Instrument evidence** (`own/claw_nm.py`, `bounded_computation` only):

- the recursive flow was built in exact `Fraction`s and verified as a normalized flow on literal cover edges on 251 `(q, k)` cases;
- the exact matching deficit equals `max(0, e_k − e_{k−1})` on those 251 cases;
- brute-force normalized matching holds over 1,080 families `X`;
- 0 failures.

This is the classical Harper / Hsieh–Kleitman product theorem, specialized to claws. The proof above cites neither.

**What it licenses.** The multiplicative lemma named in `C4-ALLOCATION.md` is proved. Promoting C1 from `conditional` still depends
on SR-C3-5c's reduction of the sector deficit to this claw poset. That reduction is outside my capsule and remains for the synthesis
or a second read. Promotion is the synthesis's act.

**Open for a successor:**

1. **Obligation (a), restated at a true scope.** On my record, the E1 criterion holds at every eligible rank for `d ∈ {6,7,8}`:
   `m ≤ 15` in full, plus `m ∈ {16, 20, 25, 30, 35, 40}` (304 eligible ranks, full criterion, 0 failures;
   `own/crit_full_d6.py`). It fails for every `d ≤ 5` at large `m`. The candidate is "for every `d ≥ 6` and `m ≥ 1`, the
   criterion holds at every eligible `p`" (`conjecture`, bounded evidence only).
   - Condition (i) needs a quantitative lower bound on `p − q` against the mode of `(1+y)^{qd−1}(1+2y)^{d(m−q)+1}`, using
     `p ≥ x + 2`. Log-concavity alone does not supply it.
   - Condition (ii) is untouched.
2. **Rows with `d ≤ 5` (including the 20 pairs that fail at every eligible rank).** These need a mechanism other than E1. E1
   remains merely sufficient, and its failure there implies no deficient cut.
3. **The heterogeneous reduction's inherited Steps 3–5.** These must be confirmed against SR-C3-3 by a reader who holds it.
4. **C1's reduction to the claw poset.** It must be checked, and then C1 composed with the lemma above.

## Artifact inventory

Scratch: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-crit-T2-F/`. Every
run was in the foreground with `python3 -B`, except `seals.py`, which imports nothing local. No background job was started, so
none was left to kill. There is no `__pycache__`.

| File | SHA-256 | Purpose |
|---|---|---|
| `seals.py` | `c57f2584734a4c9b5feb0844fa9c7d7fc55d5a0d25f40e5200501745fc36e74c` | capsule, Stage 4/3/2 seals; member digests |
| `own/treeinst.py` | `65e67b9955cc9786b0264420cb940acb6564c6c9849d53d2f8d3b6d71cfec7eb` | own tree/DP/`x`/`F_p`/WID instrument, fixed points |
| `own/out_treeinst.json` | `197f6caad3f9bc2ae65339464c72c802f670b83005ce5e89d7c288ffffdf0c59` | fixed-point rows |
| `own/crit_eligible.py` | `f58eed1db6865f6df3797f605cc028527f7bc528ca8d89fb8256a6a45bc11127` | E1 criterion at eligible ranks, `d ≤ 8`, `m ≤ 15`; `G(8^82,7^2)` full window |
| `own/crit_eligible_core.py` | `4e88c23fb9ed6406a8323282b93f10ee7664bddb3dd607fc49b66d97419c47dc` | criterion core, extracted from the above |
| `own/out_crit_eligible.json` | `7d2f98838d6c6e6ac85cbaefb02b7b07f9436f04487e4b135516c2786693ef35` | 364 eligible rows (90 fail); 56 heterogeneous ranks |
| `own/err_crit_eligible.txt` | `1d2032160c5eee2b39a580d9afa3a5a8747d173ffac9ff896550390aa424bf7b` | summary and failure list |
| `own/crit_scope.py` | `3ded03e9d2b17395392888ed76a6bf0003a5fad8cceec702e3162c6a8af2d7a3` | condition (i) at eligible ranks, `m ∈ [16, 40]` |
| `own/out_crit_scope.json` | `f25e7932d0f3add27a7e5593f7a9d0dfe92c65ac33b9787db0596b163f710f5e` | 2903 eligible ranks, 918 fail (i) |
| `own/err_crit_scope.txt` | `0589aa4a893805b1c0638f71bc2d864f91ea5fcb86d043456fc28bc4f1fa4fbc` | summary |
| `own/crit_full_d6.py` | `567afa2110c0ef2d21189a519a048863f6432b1ce8aedb2e3033fd88013508b9` | full criterion, `d ∈ {6,7,8}`, `m ∈ {16..40}` sample |
| `own/out_crit_full_d6.json` | `d62302be53c35aba11f89d4dbfea836fc61f42e1ed6725d42bfceef617b071a7` | 304 eligible ranks, 0 failures |
| `own/err_crit_full_d6.txt` | `b41cfefd73dbd5805a173e3484b5991ffce791a6a34ab64007e26fca777f97f6` | summary |
| `own/rho_record2.py` | `7aa9f2b56c8a29ea05cc3551fd950e8d9d074c57f19d7303e6f3b6c1c7c5c024` | ρ₁ record fractions, argmax `q` |
| `own/out_rho_record.json` | `7e8cae1bd571e06ff6c14d70e61787c9a354e51072eb6d2b3ba46eeb9c852119` | 3/3 match |
| `own/claw_nm.py` | `6f338f29853ca216d311773b2acfac401b3e3be4b1e666944232fe50fb2a0394` | claw product: rank contrast, matching deficit, recursive flow, brute NM |
| `own/out_claw_nm.json` | `e6d2cd86800c92b7de64db378483b53a6d515491dd1d7f1c00a2eb05dca5e8bc` | output |
| `own/err_claw_nm.txt` | `3a0cc275fdeddfe097210ab7d4a31bdf1c61d16a4a983b774c40c2f2b0968239` | summary |
| `replay/*` | identical to §12 of the return | T2's six generators, copied out and replayed; outputs byte-identical |
| `orig/*` | identical to §12 of the return | copied-out originals used for `cmp` |
