# Orientation Adjudication

Stage 5 adjudicator, orientation F (falsify), r29 Cycle 1 (Erdős #993: certify the uniform high-tail mechanism and its
non-residual top-rank consequence). Portfolio: seat `F1` (route `C1-F-01 HIGH-TAIL-FALSIFICATION-AND-BOUNDARY`) and its
two cross-orientation critiques, `C-F1-T` and `C-F1-U`.

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. The harness put the repository
`CLAUDE.md` and the user auto-memory index into my context without my asking. I did not open them, and nothing below
depends on them.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read-boundary disclosure.**
1. I read the protocol, the capsule, and the 18 files the capsule lists.
2. I copied F1's 13 inventoried files out of `scratchpad/c1-F1-replay/` into `scratchpad/c1-adj-F/f1copy/`, by exact
   name, with no listing or glob. F1's `scratchpad/c1-F1/` directory is empty (both critics confirm this, and the Stage 4
   disclosures record it).
3. I read the frozen `sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean` (SHA-256 `8d864da2…a7d9`,
   which matches the contract). I ran one non-recursive `grep`/`awk` over that single file to find declaration lines.
   The file is inside `sources/`, which the grant covers.
4. I did not replay `gen_reconcile.py`, because it reads `control/controller-prerun/ht_report.json`, which is not a
   capsule member. I checked its shipped report internally only (see the audit below).
5. I ran no search rooted above my grant, used no network, installed no packages, and did no Lean or `lake`
   invocation. I read no other orientation's portfolio or adjudication and no prior synthesis.

## Identity and seal audit

Every seal below was recomputed as SHA-256 over key-sorted compact JSON (separators `(",", ":")`, with `seal_sha256`
removed and no trailing newline).

| Object | Recomputed seal | Match |
|---|---|---|
| Capsule `control/c1-adjudicator-capsules/F-PACKET-MANIFEST.json` | `82e5e35ad4c12112fe8caaf87b5bfe3fc6c71f31bd3cd0c07c02827ba100fd81` | yes (the dispatch's value) |
| `control/C1-STAGE2-PACKET-MANIFEST.json` (169 files) | `58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e` | yes |
| `control/C1-STAGE3-PACKET-MANIFEST.json` (22 files) | `40561239862ea63cedfe37f877654bcc2d401b2dd52059139f0e2e37e18d8205` | yes |
| `control/C1-STAGE4-PACKET-MANIFEST.json` (36 files) | `f5a61035a30eb80affc2dcd3bbbf7333ccfc14d6586e96ffef87fecea7fd0386` | yes |

**Capsule members.** All 18 capsule members match their SHA-256 and byte counts. Every member that also appears in a
Stage 2, 3 or 4 manifest carries the same digest there. The sealed documents are:
- the return `F1/RETURN.md` (`44139def…6563`, 34,844 bytes);
- the critique `F1/T/CRITIQUE.md` (`175772f4…090a`);
- the critique `F1/U/CRITIQUE.md` (`9b7c9f88…190f`).

**Admissions.** The Stage 3 admission admitted 4 of 4 returns with 0 findings. The Stage 4 admission admitted 8 of 8
critiques with 0 findings. Both critics returned `retained_narrowed`. Neither the path check (`PATH-CHECK-F.json`) nor
the Stage 3 or Stage 4 disclosure files show anything that bears on validity:
- `PATH-CHECK-F.json` reports 0 findings.
- F1's process disclosures were ruled no-penalty.
- The critics' disclosures (listing F1's two scratch directories non-recursively, and copying files by exact name) were
  ruled within the grant.

**F1's scripts and reports.** All seven script digests match the return's table byte for byte. The report files'
on-disk digests also match the replay outputs of critic C-F1-T:

| Report | On-disk digest |
|---|---|
| `tsb_report_n7.json` | `b30fd86c…` |
| `htp_report_n8.json` | `dd8b23c3…` |
| `trees_report_n16.json` | `3c0e01f6…` |
| `literal_attacks_report.json` | `e42bc552…` |

**Controller facts.** I weighed `control/C1-STAGE5-CONTROLLER-FACTS-F.json` as one more replay, never as authority.
- CF-F-1 (the `P_6` hand replay) agrees with my instrument.
- CF-F-2 (the reconciliation) agrees: my cumulative eligible counts to order 12 are 361 for (ELIG) and 846 for (TRN).
- CF-F-3 (erratum: 987 tree classes to order 12, not 976) agrees: the partial sum of my class counts is 987.
- CF-F-star (the star erratum) agrees with both critics and with my own derivation (see the star entry under
  Route-by-route decisions).

**Registry keys touched.** None was re-registered and no status was changed. The five targets are
`E993-BIPARTITE-TAGGED-SHADOW-BOUND`, `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`, `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE`,
`E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` and `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE`. The other keys touched are:
- the candidate record `E993-R29-HIGH-TAIL-BOUNDARY-RECORD`;
- the inputs `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` and `E993-R26-TOP-RANK-RESIDUAL-SIGN` (both VERIFIED, and never
  re-registered);
- the fence-only keys `E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT` and `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` (all
  REFUTED at their own scopes).

**Instruments in this portfolio.** There are four independent ones:
1. F1: subset enumeration plus a forest DP.
2. C-F1-T: brute force plus a forest DP, with trees canonicalised by AHU.
3. C-F1-U: bitmask enumeration, with trees canonicalised by AHU and a union-find acyclicity test.
4. Mine: the deletion–contraction recurrence `I(S) = I(S − u) + x·I(S − N[u])` on vertex bitmasks, with deletion done as
   avoidance on the original carrier. My tree canonical form is "centre-rooted AHU string, minimum over centres". Every
   tree is tested for connectivity and, separately, for acyclicity (by union-find), and every bipartite graph passes a
   2-colouring test in code.

Counts of bipartite graphs below are **labelled**; counts of trees are **isomorphism classes** (A000055).

## Route-by-route decisions

**Route `C1-F-01` (F1): `retained_narrowed`.** Both critics agree on this verdict and I adopt it. I found no
counterexample to any target, and I strike no count. I narrow the literals listed below. The table decides claim by
claim, and resolves every disagreement between the two critics.

| # | F1 claim | C-F1-T | C-F1-U | Ruling (replay over self-report) |
|---|---|---|---|---|
| 1 | (TSB) holds on every labelled bipartite graph to order 7, every `W`, every `1 ≤ k ≤ a`: 56,649,670 triples, 0 failures | replayed; own instrument agrees to order 6 | replayed; own instrument agrees to order 6 | **Retained**, `bounded_computation`. My instrument (identity route) gives exactly 55,414,016 triples at order 7, which is F1's order-7 increment (56,649,670 − 1,235,654), with 0 failures. By definition, to order 6, it also holds in ℤ for **every** `k ∈ 0..n+1` and in truncated ℕ: 2,739,102 triples, 0 failures. Labelled counts: 1, 2, 7, 41, 376, 5177, 103237. |
| 2 | (HTP)/(HTA) hold on every labelled bipartite graph to order 8: 37,561,316 leaf/`p` instances, 0 failures | replayed; independent agreement to order 6 (59,530) | same | **Retained**, `bounded_computation`. Mine: 1,307,476 instances to order 7 (59,530 at order ≤ 6), 0 failures for both. **Narrowed per C-F1-T A10:** every instance count uses the cutoff `p ≤ n + 1`, which the return never states. Terms vanish identically once `p ≥ α + 1`. |
| 3 | "`p = 1` guard fires exactly twice (the two leaves of `K_2`)" | proved (A3) | proved (A3) | **Retained**, and now **proved_informal (critic-attributed)**. Both critics give equivalent proofs that use no bipartiteness, and I verified both. My instrument agrees: exactly 2 instances to order 7, and `term(1) = deg(s) − 1` at all 229,632 labelled leaf instances. |
| 4 | Trees to order 16: (ELIG) 29,181 eligible, (TRN) 32,364 eligible, (HTP) 2,504,091 instances, 0 failures, no eligible tree with `α ≤ 3` | own instrument to 16, exact | own instrument to 14, exact | **Retained**, `bounded_computation`. My census reproduces every per-order figure and extends the horizon to **order 18**: (ELIG) 200,699 eligible, (TRN) 204,860 eligible, (HTP) 19,730,188 instances. There are 0 failures of (ELIG), (TRN), (HTP) or (HTA); no eligible tree has `α ≤ 3`; and A000055 is matched at 17 (48,629) and 18 (123,867). |
| 5 | Boundary minima: trees at order 6 (`P_6`) for `3p = 2α`, and at order 3 (`P_3`) for `3p = 2α − 1` | order-6 witness **not unique**: `P_6` and the spider `S(1,2,2)` | "the smallest tree witness is `P_6`" | **C-F1-T is right.** Up to isomorphism there are exactly **two** order-6 classes, `P_6` and `S(1,2,2)`. My census shows this, and F1's own `trees_report_n16.json` lists both (adjacency `[2,5,42,20,8,4]` is the spider). `P_3` is the unique order-3 witness. |
| 6 | `P_3 ⊔ K_2` (order 5) is "inherited context from the controller's prior"; the guard is "**not sharp** for disconnected instances" | F1's own report records it; "not sharp" is backwards | F1 "only cited it"; established now by the critic's instrument | **C-F1-T is right on both counts.** F1's shipped `htp_report_n8.json` records `P_3 ⊔ K_2` (adjacency `[24,4,2,1,1]`) as its first positive term at `3p = 2α`, with 1,500 labelled instances. My instrument independently finds order 5 as the bipartite minimum (60 labelled instances at order 5, 1,440 at order 6). A positive term at `3p = 2α` shows the guard **is** sharp at `α = 3`. **Strike** "not sharp", and **strike** "inherited context" as the only backing. |
| 7 | Per-`α` table (`α = 2..15`): gap 1 for `α ≤ 8`; "`α ≥ 9` unresolved (horizon effect)" | superseded by A1 | superseded by A1 | **Superseded.** The table is retained only as a bounded record. My census to order 18 now gives gap 1 at `α = 9` (largest positive `p` = 6, against `p_guard = 7`), because the order-18 members of the two families appear. The "every `α`" statement is recorded under Established results. |
| 8 | Star closed form `C(m−1,p) − C(m−1,p−1)` "exact … every `p = 1..m+1`"; crossover "strictly below the guard floor for every `m` tested" | wrong at `p = 1` | wrong at `p = 1`; the docstring claims a DP cross-check that the code does not contain | **Strike both literals.** This is controller erratum R29-E-c. At `p = 1` the term is `m − 1`. At `m = 2` (`P_3`) the true crossover is `p = 2 = p_guard`. No in-guard check is affected. |
| 9 | `adversarial_report.json` digest `201d3ab8…`; "no wall-clock/PID/host fields hashed" | does not reproduce (timing fields) | does not reproduce | **Strike the hashing literal.** In `gen_adversarial.py`, line 87 (`seconds`) and line 124 (`elapsed_seconds`) feed the hashed body. The family counts stand, because both critics' replays agree once the timing fields are removed. Every family that was sampled is labelled as sampled. |
| 10 | Identity `q_j = i_j(H) − i_j(H − W)`: "2,395,020 triples … `gen_tsb.py` already recomputes both sides" | "agrees" (from the critic's own check) | **false literal**: `gen_tsb.py` never computes `i_j(H − W)` | **C-F1-U is right on the literal.** I inspected `gen_tsb.py`: `q_table` counts by definition only. 2,395,020 is simply `Σ_{n≤6} bip(n)·2^n·(n+1)`. **Strike** the claim that shipped evidence backs the count. The identity itself stands on three other instruments: C-F1-T, C-F1-U, and mine (2,739,102 checks to order 6, both sides computed independently, 0 mismatches). |
| 11 | "`1 ≤ k` bounds the natural subtraction `a − k`" | misattributed: that is `k ≤ a`'s job, and neither hypothesis is needed for truth | the `k ≤ a` remark is correct in ℤ | **C-F1-T is right.** `q_0 = 0` makes `k = 0` trivial, and `k > a` gives `0 ≤ 0`. My by-definition check covers every `k ∈ 0..n+1`. |
| 12 | (TSB) vs `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`: "`r = a − k`-style … (TSB) weaker, more permissive" | misreads `r` (it is the set's size); `2(a−k)` and `k` are incomparable | same | **Strike F1's reason; the distinction stands for the critics' reason.** The two exhibits check out on ordinary graphs, and in each (TSB) holds **with equality**. I verified both families for `m ≤ 10` (see Established results, (TSB) tightness). The refuted key lives in the G1-tuple model, so no status transfers. |
| 13 | (HTP) vs `E993-BETA-TARGET`: cited `T_22`/`T_60` arithmetic; open item 3 wants a recomputation | a logical point, not a data check; close the item | same, plus a caveat about the governed-model bridge | **Both critics are right.** The implication is logical. The citation is redundant given (HTP), and unverified without it. Close F1 item 3 as unnecessary. Fence §3.1: no ordinary-to-governed bridge is attempted. |
| 14 | "smallest eligible-TRN tree … `α = 5`, `n = 7`, `S = −14`" | not unique: `S ∈ {−16, −14, −12}` | same | **Narrow to "a smallest".** My census gives three classes at `n = 7`, all with `x = 2`, and `S ∈ {−16, −14, −12}`. The rows for `α = 6..15` (unique, stars) replay. |
| 15 | `α(H_v) < α(G) − 1`: "0/25, unresolved" | proved never strict (A2) | proved never strict (A4) | **Superseded.** The equality is proved (see Established results). My instrument finds 0 exceptions at all 229,632 leaf instances of labelled bipartite graphs to order 7, and at every leaf of every tree to order 18. |
| 16 | `reconcile_report.json`, 0 discrepancies | its digest checks internally once integer keys are restored | unverified (not replayed) | **Both are accurate.** I reproduced `d73eb45f…` from the shipped body once integer keys are restored, and could not replay it within the capsule. The report reconciles only class counts and failure totals. The eligible counts (361 and 846 to order 12) reconcile through my census and CF-F-2. |
| 17 | "import lines in the **five** generator files" | — | six `gen_*.py` files plus `f1lib.py` | **Correct to "six"** (cosmetic). |

**What I weigh the verdict on.** F1's process disclosures (harness auto-backgrounding, an unused `pgrep -f`, a failed
write outside scratch) do not affect any number. Every reported figure comes from a job that ran to completion and was
digested: three critic replays and my own. F1 claims no grade above `bounded_computation`, and I sustain that.

## Cross-route reconciliation

Only one route is in my portfolio, so the reconciliation here runs between F1 and the two critics.
- The critics **agree** on every mathematical finding: sharpness at every `α ≥ 2`, the leaf `α`-drop equality, the
  bipartite-free `p = 1` endpoint, and the tightness of (TSB). They reached these with **different constructions**:
  C-F1-T used the spider `S(1, 2^m)` and `mK_2`, and C-F1-U used the path-plus-pendant-edges family. I read that as two
  independent derivations of the same statements.
- Their disagreements are about literals and backing, never about mathematics. I resolved rows 5, 6, 10, 11 and 16 above
  by inspecting the shipped files and by my own replay.
- My own additions are one hypothesis observation on (TRN) (see Established results) and the census extension to order
  18. Neither conflicts with any critic.

Relation to the other targets' origin routes (T1, T2, U1): I have not read their portfolios. F's evidence **raises no
objection** to any target: there is no counterexample at any horizon, and every literal-hypothesis attack comes out
consistent. F's portfolio also supplies two DAG nodes that the other orientations' award groups need: the `p = 1`
endpoint, and a shortened low-`α` step for (TRN).

## Established results

Grades follow SOLUTION-CONTRACT §4. A statement first made at a review stage is **STATED** and still needs an isolated
second read before registration. My verification is an adjudicator check. I do not count it as that second read; the
synthesis rules on that.

**Exact theorems (proved_informal), with the hypotheses each consumes:**

1. **The `p = 1` endpoint of (HTP), with no bipartiteness.** Critic-attributed (C-F1-T A3, C-F1-U A3); adjudicator-
   verified; STATED.
   - Statement: for every finite simple graph `G`, every original leaf `v` with support `s`, at `p = 1`, the term is
     `Δ_0(G − {v,s}) − Δ_0(G − N[s]) = deg_G(s) − 1`. This uses `Δ_0(G − D) = (n − |D|) − 1` on the original carrier,
     with `|R_v| = deg(s) + 1`.
   - Under the guard `2α + 1 ≤ 3` we have `α ≤ 1`. If `n ≥ 3`, any `u ∉ {v, s}` is non-adjacent to `v`, so `{v, u}` is
     independent and `α ≥ 2`, a contradiction. Hence `V = {v, s}`, `N(s) = {v}`, `R_v = H_v` as Finsets, and the term is
     `0`.
   - Hypotheses used: finiteness and `IsGraphLeaf` only. `IsBipartite` is **not** used, and neither is connectivity.
   - Evidence: my instrument checked the formula at every leaf of every labelled bipartite graph to order 7 (229,632
     instances) with 0 mismatches, and C-F1-U checked it on all 33,867 labelled graphs to order 6.
   - (HTA) at `p = 1` follows as a sum of zero terms, since the guard forces `G = K_2`.
2. **The leaf `α`-drop is an equality.** Critic-attributed (C-F1-T A2, C-F1-U A4); STATED.
   - Statement: for every finite simple graph `G` and every original leaf `v`, `α(G − {v,s}) = α(G) − 1`.
   - `≤` is `leaf_indep_cap` (entry 42, compiled internal, unawarded).
   - `≥`: a maximum independent set `I` contains exactly one of `v` and `s`. It cannot miss both, or `I ∪ {v}` would be
     larger; it cannot hold both, because they are adjacent. So `I ∖ {v, s}` has size `α − 1`.
   - Hypotheses: finiteness and `IsGraphLeaf` only. Only `≤` is load-bearing for (HTP). Equality is a Tier 3 companion
     candidate.
3. **Guard sharpness on trees at every `α ≥ 2`.** This is the Tier 2 boundary theorem. Critic-attributed: C-F1-T A1
   (family A) and C-F1-U A1 (family B), found independently. Adjudicator-verified; STATED.
   - Family A, order `2α`: a centre `s`, a leaf `v`, and `α − 1` legs `s–w_i–u_i`. With `m = α − 1`,
     `term(p) = C(m,p)(2^p−1) − C(m,p−1)(2^{p−1}−1) = (C(m,p−1)/p)·[t(2^{p−1} − ½) + p/2]`, where `t = 2α − 3p`.
   - Family B, order `2α`: the path `v–s–w–c` plus `α − 2` pendant edges `a_i–b_i` with each `a_i ~ c`. Here
     `term(p) = q_p − q_{p−1}`, with `q_j = C(m, j−1)·2^{j−1}` and `m = α − 2`. For `p ≥ 2` the term has the sign of
     `2α + 1 − 3p`, and `term(1) = 1`.
   - I re-derived both closed forms by hand. My recurrence engine matches them at every `p ∈ 1..n+1` for `m ≤ 10`. By the
     closed forms, the sign is positive exactly on `1 ≤ p ≤ ⌊2α/3⌋` and `≤ 0` for `3p ≥ 2α + 1`, for every `m ≤ 1500`
     (4,518,005 exact checks, 0 failures).
   - Hypotheses: the objects are trees (connected and acyclic, both tested in code), so they are bipartite.
4. **(TSB) is tight at every `1 ≤ k ≤ a`.** Critic-attributed; STATED.
   - C-F1-T: `mK_2` (disconnected, bipartite) with a single tag `W = {w}`.
   - C-F1-U: the tree `H_v(` family B `)` with `W = {w}`.
   - In both, `k·q_{k+1} = 2(a − k)·q_k` with `q_k > 0` for every `1 ≤ k ≤ a`. I checked this for `m ≤ 10`.
   - Separately, there are exactly 5,235 strictly positive equalities among labelled bipartite graphs to order 6. My
     count reproduces C-F1-U's figure exactly.
   - Consequence: the constants `k` and `2(a − k)` cannot be improved, and via result 2 the guard is sharp *because*
     (TSB) is sharp.
5. **(TSB) needs neither `1 ≤ k` nor `k ≤ a` for truth.** Critic-attributed (C-F1-T A8); trivial; adjudicator-verified to
   order 6 in both the ℤ and the truncated-ℕ form.
   - `q_0 = 0`, so `k = 0` gives `0 ≤ 0`.
   - For `k > a`, `q_k = q_{k+1} = 0`.
   - The registered hypotheses stay as the contract states them. The proof through entry 41 consumes `hk : 1 ≤ k`, and
     the ℤ cast consumes `k ≤ a`.
6. **Adjudicator observation on (TRN) (adjudicator-attributed; STATED; needs a second read).** The eligibility step of
   (TRN) needs neither connectivity nor acyclicity:
   - In ℕ, `x + 2 ≤ α − 1` forces `α ≥ 3`, so `n ≥ 3`.
   - Then `Δ_0(G) = n − 1 ≥ 0`, so `x ≥ 1`. Hence `α − 1 ≥ 3`, so `α ≥ 4` and `p = α − 1 ≥ 3 ≥ 2`.
   - `3(α − 1) ≥ 2α + 1` holds exactly when `α ≥ 4`, so (HTA) applies.
   - Consequences:
     - (TRN) holds verbatim for every finite **bipartite** `G`, with `IsTree` used only through `hT.isBipartite`.
     - The contract's `α = 3` exclusion needs only `x ≥ 1`. It needs neither `n ≥ α + 1` nor `order_ge_alpha_succ`
       (which carries `IsTree` and `2 ≤ α`).
     - For Lean, the step is `crossingIndex ≥ 1` from `Δ_0 = n − 1 ≥ 0` at `n ≥ 1`.
   - Bounded check: 11,768 eligible labelled bipartite graphs to order 7, of which 9,871 are not trees, with 0 failures
     and none with `α ≤ 3`. An example: `K_{1,3} ⊔ 2K_1`, with `α = 5`, `x = 2`, `S(G, 4) = −9`.
   - This does not change any target. The synthesis may adopt the shorter derivation.

**Bounded computations (with the instrument named):**
- (TSB) to order 7: F1, with three replays; and mine by the identity route.
- (HTP)/(HTA) on bipartite graphs: to order 8 (F1, replayed) and to order 7 (mine).
- Trees to order 18 (mine), with no counterexample to (ELIG), (TRN), (HTP) or (HTA).
- Tree identities `Δ_0 = n − 1` and `i_2 = C(n,2) − (n−1)` on every tree to order 18, with 0 failures.
- Boundary minima, established by at least three instruments:
  - trees: 6 at `3p = 2α` (`P_6` and `S(1,2,2)`), and 3 at `3p = 2α − 1` (`P_3`);
  - labelled bipartite graphs: 5 at `3p = 2α` (`P_3 ⊔ K_2`), and 3 at `3p = 2α − 1`.

**The Tier 2 boundary statement of record** (`E993-R29-HIGH-TAIL-BOUNDARY-RECORD`, if the synthesis registers it):
- **Statement.** For every integer `α ≥ 2` there is a finite tree `T` of order `2α` with `α(T) = α` (families A and B),
  and an original leaf `v`, whose (HTP) term is strictly positive at `p = ⌊2α/3⌋ = ⌈(2α+1)/3⌉ − 1`. So on trees, and
  hence on finite bipartite graphs, the guard `3p ≥ 2α + 1` cannot be relaxed by one rank at any `α ≥ 2`.
- **Minimal witnesses.**
  - Trees: `P_6` and `S(1,2,2)` at order 6 (`α = 3`, `p = 2`, term `+1`), and `P_3` at order 3 (`p = 1`, term `+1`).
  - Bipartite graphs: `P_3 ⊔ K_2` at order 5.
- **Grades.** The every-`α` statement is `proved_informal`, critic-attributed, and STATED pending a second read. The
  minima are `bounded_computation`.
- **What stays conditional.** "The largest positive `p` on trees equals `⌊2α/3⌋` exactly" is **conditional on (HTP)**.
  It is bounded-verified for `α ≤ 9` to order 18.
- **Fence.** This refutes nothing in scope. It evaluates no selector and no aggregate below the guard. It is not a step
  toward the lower region (§3.3). The stronger unguarded statement is already REFUTED as `E993-BETA-TARGET` in the
  governed setting, so no new refutation key is needed.

**Compiled fragments.** F's portfolio contains **none**: no Lean seat and no Lean return. Entries 41–44 of the frozen
source are cited as context only: "compiled internal, unawarded" (fence §3.8).

**Record corrections.**
- Contract errata: R29-E-a (987 tree classes, not 976) and R29-E-c (the star term at `p = 1` is `m − 1`).
- The F1 literals struck above: rows 6, 8, 9, 10, 11 and 12.

## Rejected and narrowed mechanisms

- **Struck:** F1's (TSB) vs addability-bound argument ("`r = a − k`-style … weaker"). The quantities are incomparable,
  so the reason fails. The distinction survives on the critics' exhibits, as recorded in row 12.
- **Struck:** "guard not sharp for disconnected instances". It is sharp.
- **Struck:** the star closed form at `p = 1`, and the "strictly below the guard for every `m`" crossover claim.
- **Struck:** the claim that shipped evidence backs the companion-identity count (2,395,020). Also struck: "no wall-clock
  fields hashed".
- **Narrowed:**
  - "the smallest eligible (TRN) tree" becomes "a smallest";
  - the order-6 boundary witness becomes two classes;
  - every instance count now carries the cutoff `p ≤ n + 1`.
- **Closed as unnecessary (no successor work):** F1 item 3 (recomputing `T_22`/`T_60`, which is logically redundant and
  fenced), item 4 (a G1 addability witness, since the structural distinction suffices), and item 6 (orders 8–9 would add
  only bounded evidence and no award needs them).
- **No refuted step exists in this portfolio.** No target statement was weakened. No status transfers to any
  no-recovery claim, `E993-BETA-AGG`, TREE/FOREST, the lower region, or Erdős #993. The two existing awards stay inputs.

## Lean readiness

This is the central ruling for orientation F. **No award group is contract-ready on F's evidence alone.** F1 is a
falsification route: it authors no proof and compiles no Lean. The critics' proofs cover only some DAG nodes. The
contract's statements are SOLUTION-CONTRACT §2. For each target, the table gives what F supplies and the smallest missing
node (in F's portfolio).

| Target (§2 statement) | (a) Informal DAG at registry scope in F's evidence | (b) Compiled fragments in F's evidence | (c) Open nodes (smallest first) |
|---|---|---|---|
| (TSB) `bipartiteTaggedShadowBound` (`hBip`, `W`, `k`, `hk : 1 ≤ k`, `hka : k ≤ H.indepNum`; ℤ) | **Incomplete.** F1 black-boxed the mechanism. C-F1-T checked both halves exhaustively to order 6 (the per-set bound of `2(a−k)` addable vertices, and at least `k` tag-preserving deletions), which is **bounded**, not a proof. F supplies the tightness proof (result 4) and the unrestricted-`k` companion (result 5). | none. Context: entry 41 `E993Interior.taggedShadowBound` (fragment `50dcce4a7ad13fbb73361ff1235996a7bb79eeea2cf9435a752b1eab50d8583f`; `U`-relative `hcap`, `hk : 1 ≤ k`, ℕ, truncated `a − k`), compiled internal, unawarded. | The registry wrapper: `U = univ`; `hcap` discharged by `IsIndepSet.card_le_indepNum` (the same Mathlib lemma `leaf_indep_cap` uses); then cast `((a − k : ℕ) : ℤ) = a − k` under `hka`. There is no mathematical gap, only an authoring node. |
| (HTP) `bipartiteLeafHighTailPointwise` (`hBip`, `hv : IsGraphLeaf`, `hp : 1 ≤ p`, `hTail`) with (HTA) `bipartiteHighTailAggregateAllRanks` on its face | **The `p = 1` node is complete** (result 1, critic-attributed, graph-general). The `p ≥ 2` node is **not** re-derived in F's portfolio. It is compiled-internal only: `leaf_term_nonpos` (private, `hp : 2 ≤ p`) inside entry 42, together with `tagged_count_split`, `leaf_indep_cap` and `leaf_tagged_monotone`. | none. Context: entry 42 `highTailAggregateFromShadow` (`972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d`) and entry 44 `bipartiteHighTailAggregate` (`b7ee9d1adcac58675ea4216906ca944049df3f3be12873c4996cb23fe4dc3b93`), both compiled internal and unawarded. | Smallest missing node: `lemma p_one_R_eq_H : IsGraphLeaf G v → 2 * G.indepNum + 1 ≤ 3 → C5LA1.R G v = C5LA1.H G v`. Proof: any `u ∉ {v, s}` makes `{v, u}` independent, so `2 ≤ indepNum`, a contradiction. So `univ ⊆ {v, s}` and `neighborFinset s = {v}`. The term is then `0` by `sub_self`. No `IsBipartite` is needed, and no `card V ≤ 2` colour-class lemma. The next node is a case split on `p = 1` versus `p ≥ 2`, which routes `p ≥ 2` to the carried `leaf_term_nonpos`. Since that lemma is private, the new declaration must live in the same single source file as the carried entry 42. (HTA): `Finset.sum_nonpos` over the pointwise statement. |
| (ELIG) `interiorEligibilityAlphaGeSeven` (`hT : IsTree`, ℕ `hInterior`) | **None in F.** Bounded only: 200,699 eligible trees to order 18, 0 failures, plus the identities `Δ_0 = n − 1` and `i_2 = C(n,2) − (n − 1)` on every tree to order 18. | none. Context: entry 43 `eligibleAlphaGeSeven` (`dbd200bd15cf7cf8ce2516587fb25491dbddad2b171a079bda87b92258c32b06`), compiled internal, unawarded. | A keyword re-export of entry 43 (an origin-T/U node). F raises no objection. |
| (TRN) `topRankNonResidualAggregate` (`hT : IsTree`, ℕ `hEligible`) | **Partial.** Result 6 gives the complete low-`α` step (`x ≥ 1 ⇒ α ≥ 4`), adjudicator-attributed and STATED. It then composes with (HTA) at `p = α − 1 ≥ 3`, whose `p ≥ 2` node is compiled internal only. Bounded evidence: 204,860 eligible trees to order 18, and 11,768 eligible bipartite graphs to order 7, 0 failures. | none | `1 ≤ crossingIndex G` from `Δ_0 = card V − 1 ≥ 0` when `card V ≥ 1`. The Guard helpers `delta_zero_nonneg`/`crossing_negative` are private and need `2 ≤ card V`; a public restatement is cleaner. Then `omega` gives `4 ≤ indepNum`, and the goal follows from entry 44 (or from (HTA)) with `hT.isBipartite`. |

**Contract-ready award groups from orientation F:** none. **Not ready (on F's evidence):** all four.
- **Mathematics.** Nothing in F's evidence says any target is false or has a mathematical gap. What remains is the
  registry-scope assembly: the (TSB) wrapper, the `p = 1` Lean node, the (TRN) `x ≥ 1` step, and the (ELIG) re-export.
  The combined DAG is closed only if the T and U portfolios supply the registry-scope informal proofs and compiled
  fragments.
- **Fences for any award that uses F's nodes.**
  - Attribution: the `p = 1` proof belongs to the r29 critics C-F1-T and C-F1-U; the (TRN) low-`α` shortening belongs to
    this adjudication.
  - Carry: entries 1–18 are carried byte-identically, and entries 41/42/44 are carried as registrar units with their
    private helpers.
  - Statement: one terminal `theorem`. Permitted axioms are `propext`, `Classical.choice` and `Quot.sound`; no `sorry`,
    `native_decide` or `decide` over an enumeration.
  - Scope: no status transfer (fences §3.1–3.8).
- **Axioms.** There is no `#print axioms` output in F's portfolio to confirm, because F shipped no build.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

Material progress for orientation F this cycle:
1. The falsification record now stands at larger exhaustive horizons than the prior, with three independent replays plus
   mine, and no counterexample to any target:
   - bipartite graphs: order 7 for (TSB), orders 7–8 for (HTP)/(HTA);
   - trees: order 18 for (ELIG), (TRN) and (HTP).
2. The boundary question moved from "sharp for `α ≤ 8`, open for `α ≥ 9`" to a proof of sharpness at every `α ≥ 2`
   (two families, critic-attributed, pending a second read).
3. The only genuinely new mathematical node of (HTP), the `p = 1` endpoint, has a complete informal proof on every
   finite simple graph (critic-attributed).
4. There are three companions: the leaf `α`-drop equality, (TSB) tightness, and the (TRN) low-`α` shortening.

**Stop gate.** Neither decisive event occurred: there is no confirmed in-scope counterexample, and no formal award
exists at Stage 5. The plateau condition does not hold.

## Headline assessment

headline_resolved: no
status: still_open

Per target, at orientation F's evidence grade:
- **(TSB):** not refuted; bounded to order 7; proved tight. There is no complete informal proof in F's portfolio.
- **(HTP):** not refuted. The `p = 1` node is `proved_informal` (critic-attributed). The `p ≥ 2` node is compiled internal
  only.
- **(HTA):** not refuted; it follows from (HTP) pointwise.
- **(ELIG):** not refuted; bounded to order 18.
- **(TRN):** not refuted; bounded to order 18 on trees and order 7 on bipartite graphs. The low-`α` step is STATED
  (adjudicator), and the rest is composition with (HTA).

No target is refuted, so `status` is not `refuted`. No target has a complete informal proof verified within this
portfolio, so it is not `proved`. The headline is formal awards for all four targets, which only Stage 7 can grant.

## Next-route allocation

**Exact remaining obligation for orientation F.**
1. An isolated second read (§4) of the STATED results:
   - result 1 (the `p = 1` endpoint, graph-general);
   - result 2 (the leaf `α`-drop equality);
   - result 3 (sharpness at every `α ≥ 2`, families A and B);
   - result 4 ((TSB) tightness);
   - result 6 (the (TRN) low-`α` step via `x ≥ 1`).
2. The synthesis adopts, or narrows, the Tier 2 boundary text above.
3. Optional digest hygiene: re-emit `adversarial_report.json` without its timing fields.

No further falsification census is needed for any award.

**Next-cycle routes for F** (at most two; Cycle 2 keeps at most one route per target still open):
- **F-A: second read and boundary record closure.** An isolated seat re-derives results 1–4 and 6 from their statements
  alone, and re-runs one instrument on the minima.
  - It could close in one cycle: the Tier 2 boundary record at `proved_informal` (every-`α` sharpness) plus
    `bounded_computation` (the minima); the `p = 1` and (TRN) low-`α` nodes, cleared for use on the (HTP) and (TRN)
    award faces; and the Tier 3 companions, if the synthesis wants them.
- **F-B: post-assembly literal audit of the funded award statements.** For each award project that Stage 7 funds, the
  seat checks the compiled `expected_statement` against the registry text:
  - `k ≤ a` and the ℤ cast;
  - `hp : 1 ≤ p` and the ℕ `p − 1`;
  - the ℕ eligibility hypotheses at `α < d`;
  - non-vacuity witnesses: the `K_2` endpoint, the order-7 eligible (TRN) trees, the order-9 eligible (ELIG) trees.

  It also evaluates each hypothesis literally with an instrument on the fixed points, and confirms the
  `#print axioms` logs.
  - It could close in one cycle: the fidelity and non-vacuity record for every award funded in that cycle.

## Artifact inventory

All paths are under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-adj-F/`
(SHA-256 of each file; for each report, its inner `digest` field hashes the body without that field).

| File | SHA-256 | Role |
|---|---|---|
| `adj_instr.py` | `c0783c8a857b3a735667f353ae1b1f1bab05e56b0abb45524a601440cf2cdf43` | own instrument (the deletion–contraction recurrence; term; selector; `S`; `x`; bipartite and tree tests) |
| `adj_bip.py` | `67a04c2759ecccb9cb4aad0ba781f37d41e12921297c0764a3a293b6e2c2e0b4` | `python3 adj_bip.py 7 6 7 adj_bip_report.json` |
| `adj_bip_report.json` | `6b1e3348ed52a2814ba530c03ac10b23b5ede78d10df4e51f503037c5c28a9ef` (inner `725d0383…79a9`) | bipartite: counts to order 7; (TSB) by definition to order 6 (every `k`, ℤ and ℕ) and by identity at order 7; the identity; (HTP)/(HTA) to order 7; the `p = 1` formula; the `α`-drop; boundary minima |
| `adj_bip.log` | `8941340b8a9b2a49fd53aa61090cb514c14ce2731e7176460dfe2918cd2869b9` | run log |
| `adj_trees.py` | `2c33f3fa42d402f32fdbdedfb04d4ebc02036b680cf91f91c5b44fb874c689bc` | `python3 adj_trees.py 18 adj_trees_report_n18.json` |
| `adj_trees_report_n18.json` | `7bd1f0928a3ba8ff292a90f4375c1025a1c1d45f7b638b121687896b57225d88` (inner `81ff85dd…adea`) | trees to order 18: (ELIG), (TRN), (HTP), (HTA); the per-`α` table; order-6 witness classes; smallest eligible trees |
| `adj_trees.log` | `5f500c1b143c15cf9e64e6c6ac73a9fef0110c46386ca3fc6d5bb5934fd13b8b` | run log |
| `adj_family.py` | `27a2558a7f25e47cdd02c49cd2f57f66fdc7f65faa00380f1bd68a0ec550490d` | `python3 adj_family.py 10 1500 adj_family_report.json` |
| `adj_family_report.json` | `8dbb4b061362ce877d0cd0c1c3589e1b2139fdfcb4d18e1486a0ecaea64c5fd6` (inner `dc6c190b…3f90`) | families A and B (recurrence vs closed form, `m ≤ 10`; sign pattern, `m ≤ 1500`); (TSB) equality families |
| `adj_trn_bip.py` | `85728699eecdaf04132f53e7d7db0d2ebeaa8059ad12053382b08a66a73148cd` | `python3 adj_trn_bip.py 7` |
| `adj_trn_bip_report.json` | `655d479f650e623f50b7a30394cdca9bd08b0f2850aae40b847898deeafdb946` (inner `12f4411e…c5ce`) | (TRN) on all labelled bipartite graphs to order 7 |
| `adj_tight.py` | `0cccb4809d87977646a8399ec63a1165e393e74e992a42eeb104bbb8ce37eb87` | `python3 adj_tight.py 6`; output printed: 5,235 strictly positive (TSB) equalities (per order: 0, 0, 3, 42, 105, 5085) |
| `f1copy/` | the 13 files of F1, copied by exact name (script digests equal the return's) | copy-out source for inspection |

**Process.** I ran two background jobs, PIDs 98052 (`adj_bip.py`) and 98283 (`adj_trees.py`). Both ran to completion,
and before this write I confirmed each had exited, by literal PID. No job of mine is running. I did no Lean work, used
no network, installed nothing, and wrote nothing outside this file and `scratchpad/c1-adj-F/`.
