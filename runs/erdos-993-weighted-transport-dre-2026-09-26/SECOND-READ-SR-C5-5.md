# Second Read

Read `SR-C5-5`, r30 Cycle 5. This is an isolated second read, registration only, non-decisive and optional. It covers sector sufficiency for `d ≤ 6` and `CB(1,m)` sector non-eligibility.

- Reader: Claude Opus 5.5, high.
- Date: 2026-09-27.

**VerityOS boot.** I operate within VerityOS. I loaded exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, the two boot files the protocol permits. I then worked only inside the run's experiment subsystem, through the sealed capsule.

Two-part model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Protocol.** I read `control/C5-SECOND-READ-PROTOCOL.md` first and followed it in full.
- **Brief.** `shasum -a 256 control/C5-SECOND-READ-BRIEF-SR-C5-5.md` gives
  `3453b1fb5607d23f9b482f7d167a524ddbc2e3fb667030e826e372cd0c32ff60`. This equals the chartered digest.
- **Capsule seal.** For `control/c5-second-read/SR-C5-5-PACKET-MANIFEST.json` I recomputed SHA-256 over the canonical JSON: `seal_sha256` removed, `sort_keys`, separators `(",", ":")`, no trailing newline.
  - Stored: `f1ed9355f911808abe96eaa1d4faad502bcf27eb80d5068ef3676ce3d4d7589d`.
  - Recomputed: the same. **Seal verified.**
  - Manifest facts: schema `verityos.math-dre.packet-manifest.v1`, stage `cycle-5-second-read-SR-C5-5`, run
    `erdos-993-math-dre-20260926-r30-weighted-transport`, `file_count` 164.
- **Member digests.** All 164 listed members match their manifest SHA-256. There are 0 mismatches.
- **Frozen reference instruments.** Before reading any of them, I checked all 131 capsule members under `sources/c5-stage7-sources/` against that directory's `SOURCE-DIGESTS.json` (schema `verityos.r30.source-digests.v1`, 460 files). There are 0 mismatches.
- **Registries (frozen).**
  - `control/snapshots/CLAIM-IDENTITY.run-local.c5-stage2.json` holds 453 claims.
  - `sources/authority/CLAIM-IDENTITY.json` is the 434 master. Every master key is in the snapshot, so the union has 453 keys.
  - Both are capsule members with matching digests.
- **Read-boundary deviations.** Each is disclosed; none bears on the mathematics.
  1. The harness placed `/Users/ashtonsperry/VerityOS/CLAUDE.md` and the user auto-memory index in my context at session start. I did not open either; I record their presence.
  2. I ran `ls` on the output parent `second-reads/` to create `second-reads/SR-C5-5/`. I saw directory names only and opened no file.
  3. The brief's first `cat` overflowed to a harness tool-result file under `~/.claude/projects/…/tool-results/`. Reading it only echoed the brief's own bytes. I then read the brief directly.
  4. Once, `python3 -B -c "import sr5_census"` re-executed my own census script by accident. It is deterministic, and its output digest is unchanged (`0a8533ab…`, verified after the event).
  5. Nothing else was used: no `lake`/`lean`, no network, no installs, no background jobs, no `find`/`grep` above capsule members, and no edits to any sealed member.

## Statements read

**SR-C5-5a (sector sufficiency for `d ≤ 6`).**
- Origin: C-T1-F F-3 (`cycles/cycle-5/stage4/critics/T1/F/CRITIQUE.md`, lines 107–126). It was checked in ADJ-T Established 5 (`cycles/cycle-5/stage5/adjudicators/T/ADJUDICATION.md`, lines 248–254) and stated in SYNTHESIS item 7 and Registrations item 7.
- Claim: for `d ≤ 6` and every `m ≥ 1`, `3x(CB(d,m)) ≥ 2dm`. With `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` at `t = 1`, the root-plus-arm sector is then never deletion-deficient at an eligible rank.

**SR-C5-5b (`CB(1,m)` sector non-eligibility).**
- Origins: C-U2-T F6 (`…/U2/T/CRITIQUE.md`, lines 108–122) and C-U2-F F4 (`…/U2/F/CRITIQUE.md`, lines 190–209), on U2's structure. U2's structure is New Lemma 1, the sector closed forms and `SW ≡ 0` at `d = 1` (`cycles/cycle-5/stage3/returns/U2/RETURN.md`, lines 251–282, 306–350 and 412–470).
- It was checked in ADJ-U item 4 (`…/U/ADJUDICATION.md`, lines 185–198) and stated in SYNTHESIS item 9 and in the CBstar scope-note list.

**SR-C5-5c (names and placement).**
- The synthesis proposes the key `E993-R30-CB-CHOKE-DEGREE-AT-MOST-SIX-SECTOR-DELETION-SUFFICIENT-AT-EVERY-ELIGIBLE-RANK` for 5a. Its screen note says the key shares 3 of 5 tokens with `E993-GRAPH-SINGLE-RANK-DELETION-SUFFICIENT`, and it offers a CBstar scope note as the alternative.
- It proposes a CBstar scope note for 5b.

**Registered inputs, used at their grades.**
- `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`: VERIFIED, `proved_informal`. I read its face from the snapshot. The statement covers `d, m, t ≥ 1`, `p ≥ 2` and `F` with `v ∈ F` and `P ⊆ F`. The fence excludes `F = {v}` (its counterexample is `CBstar(2,2,2)`, `t = 2`), states that `v ∉ F` is trivially non-deficient, and records that at `t = 1` the non-deficiency corollary fails (`CB(8,86)/460`, …).
- Darroch (1964), named classical dependency. It is not under `sources/`.

## Independent re-derivation

### Definitions and fidelity

`CB(d,m) = CBstar(d,m,1)` has:
- the path `r – s – v`;
- chokes `u_1..u_m ~ r`;
- supports `b_ij ~ u_i`;
- one private leaf `c_ij ~ b_ij`.

So `n = 3 + m + 2dm`, `M = D = dm`, and `leafSet = {v} ∪ P`. My instruments take `x` as the first strict descent through rank `α`, with the terminal difference `Δ_α = −i_α` included.

**The polynomial (by conditioning on `r`).**
- If `r ∉ I`, the components are `s–v` (`P_2`, polynomial `1+2y`) and `m` choke subtrees. Each choke subtree has `f_d = (1+2y)^d` (with `u ∉ I`) plus `y(1+y)^d` (with `u ∈ I`).
- If `r ∈ I`, then `s` and every `u_i` are excluded, `v` is free, and every `b–c` edge is free.
- Hence `I(CB(d,m)) = (1+2y)·f_d^m + y(1+y)(1+2y)^{dm}`, with `f_d = y(1+y)^d + (1+2y)^d`.
- Validation (`sr5_census.py` (A)), with `IsTree` (edge count and connectivity) asserted on every explicit instance:
  - the closed form equals my generic rooted-tree DP on the explicit edge list for all 36 rows `d, m ≤ 6`;
  - it equals brute-force enumeration on 6 tiny trees.
- `α = deg I = max(dm + m + 1, dm + 2) = 1 + m(d+1)` for `m ≥ 1`. This is asserted on all 1,200 census rows.

### SR-C5-5a, step by step

1. **Binomial split.** `(1+2y) f_d^m = Σ_{q=0}^{m} C(m,q) T_q` with `T_q = y^q (1+y)^{qd} (1+2y)^{d(m−q)+1}`. So `I = Σ_q C(m,q) T_q + E` with `E = y(1+y)(1+2y)^{dm}`.
   - This is correct.
   - The ℕ-subtraction `m − q` is guarded by `0 ≤ q ≤ m`.
   - My instrument re-sums the split and recovers `I` exactly on 240 rows (`d ≤ 6`, `m ≤ 40`).
2. **Shape of each summand.** Each `T_q`, and `E`, is `y^{shift}` times a product of linear factors `(1+y)` and `(1+2y)`.
   - Normalized, its coefficients are the law of `shift + Bin(·, 1/2) + Bin(·, 2/3)`, a shifted Poisson-binomial.
   - The coefficients are positive on an interval and log-concave (Newton's inequalities, a classical result named here). Hence each sequence is unimodal and **nondecreasing up to its first mode**.
3. **Darroch (1964).** For a Poisson-binomial law with mean `μ`, every mode lies in `{⌊μ⌋, ⌈μ⌉}`, strictly within 1 of `μ`. If `μ ∈ ℤ`, the mode is `μ`. A shift moves mean and mode together. Hence **first mode ≥ ⌊μ⌋**.
   - C-T1-F's wording "within 1 of the mean" must be read strictly. This is repair (R-a2) below.
4. **Means** (checked in exact `Fraction`s on all 5,400 summands with `d ≤ 6`, `m ≤ 40`; 0 failures).
   - `mean(T_q) = q + qd/2 + 2(d(m−q)+1)/3 = 2dm/3 + 2/3 + q(1 − d/6)`.
   - `mean(E) = 1 + 1/2 + 2dm/3 = 2dm/3 + 3/2`.
   - **The hypothesis `d ≤ 6` enters here, and only here:** `q(1 − d/6) ≥ 0` for every `q ≥ 0`. So every summand has mean `≥ (2dm+2)/3`, and first mode `≥ ⌊(2dm+2)/3⌋`.
5. **Monotone prefix.** Each summand satisfies `a_{k+1} ≥ a_k` for `k ≤ ⌊(2dm+2)/3⌋ − 1 = ⌊(2dm−1)/3⌋`.
   - The ℕ-subtraction `2dm − 1` is guarded by `dm ≥ 1`.
   - All weights `C(m,q)` are positive, so `Δ_k(I) ≥ 0` for `k ≤ ⌊(2dm−1)/3⌋`. This index is below `α`, so the terminal zero extension is never in play.
   - Hence **`x(CB(d,m)) ≥ ⌊(2dm+2)/3⌋`**, and so `3x ≥ 2dm + 2 − 2 = 2dm`.
   - My instrument checked the step the proof consumes directly: every `T_q` and `E` is nondecreasing through index `⌊(2dm+2)/3⌋`, and every first mode is `≥ ⌊mean⌋`. It covered 5,400 summands with 0 failures. That is `bounded_computation` support for the Darroch step, not a proof of it.
6. **Sector conclusion.**
   - For `p ≥ x + 2`: `3p ≥ 3x + 6 ≥ 2dm + 6 > 2dm + 5`.
   - At `t = 1` the CBstar criterion is: a deletion-deficient sector subfamily exists iff `3(p−1) < 2(dm+1)`, i.e. `3p < 2dm + 5`. The key needs `p ≥ 2`, which holds because `p ≥ x + 2`. The ℕ-subtraction `p − 1` is guarded by `p ≥ 2`, and `K − 1` in `C(M, K−1)` by `K = p − 1 ≥ 1`.
   - So no subfamily of the root-plus-arm sector is deletion-deficient.
   - Only the lower eligibility bound `x + 2 ≤ p` is used. The upper bound `3p < 2α + 1` is not, so the conclusion holds at every rank `p ≥ x + 2`.
7. **Selector (my addition; see repair R-a3).** CBstar's face is registered for `F` with `v ∈ F` and `P ⊆ F`. The (HALL) network uses `F = F_p(T)`, and `F_p(T) = leafSet(T)` is proved for no eligible window. At `t = 1` this gap closes elementarily:
   - A private tag `c_ij` has `W_{c_ij} = N(b_ij) ∖ {c_ij} = {u_i}`.
   - Every sector source `B ∋ r` excludes every `u_i`. So does every deletion target `B ∖ {q}`.
   - Hence no private tag is ever active on a sector source or on any deletion target of one. The sector deletion network for `F` coincides with that for `F ∪ P` when `v ∈ F`.
   - When `v ∉ F`, every sector source has weight 0.
   - So the deletion non-deficiency holds for **every** `F`, in particular for `F_p(T)`.
   - In addition, `Aut(CB(d,m))` is transitive on `P`, so `F_p(T) ∩ P ∈ {∅, P}`.
   - Literal check (`sr5_lab.py`, 65 laboratory rows on 15 trees `CB(1,1..6)`, `CB(2,1..3)`, `CB(3,1..2)`, `CB(4,1..2)`, `CB(5,1)`, `CB(6,1)`, every `2 ≤ p < α` with a nonempty sector):
     - the exact maximum sector deletion deficit (sector supply minus max-flow) is identical for `F = {v}`, `F = leafSet` and `F = F_p(T)` (when `v ∈ F_p`), with 0 violations;
     - it is 0 for `F = P`;
     - it equals the CBstar `t = 1` formula `max(0, C(dm,K)2^K − C(dm,K−1)2^{K−1})` on every row, with 0 mismatches, 43 of them positive;
     - every sector source weight lies in `{0, 1}`.
8. **Consequence for the full relation.** `N_D(X) ⊆ N(X)` and weights are nonnegative. So deletion non-deficiency gives the weighted Hall inequality `Σ_X w_F ≤ Σ_{N(X)} w_F` for every `X ⊆ S^{r,v}_{p+1}` in the (D) ∪ (S) network, by the same step as CBstar's own corollary. This is a sector-subfamily statement only.

**Mean identity.**
- `f_d(1) = 2^d + 3^d` and `f_d′(1) = 2^d + d·2^{d−1} + 2d·3^{d−1}`.
- So `2d/3 − μ(d) = [2d·2^d − 3·2^d − (3d/2)·2^d] / (3(2^d+3^d)) = 2^d(d−6) / (6(2^d+3^d))`.
- I derived this by hand and checked it in exact rationals for `d ≤ 30` (`sr5_census.py` (D)). It agrees with C-T1-F's `sturm.json`.
- The identity is **explanatory** and not a step of the proof. The proof uses the summand means of step 4, whose `q`-coefficient `1 − d/6` carries the same sign of `d − 6`.

**Own census (`sr5_census.py` (B)), `1 ≤ d ≤ 6`, `1 ≤ m ≤ 200`, 1,200 trees.**
- `α = 1 + m(d+1)` on every row.
- `3x ≥ 2dm` on every row. The minimum of `3x − 2dm` is 4, 3, 3, 2, 2, 3 for `d = 1..6`.
- `x ≥ ⌊(2dm+2)/3⌋` on every row, with equality (the proven bound is sharp) at exactly 7 rows: `CB(4,2)` (`x = 6`) and `CB(5,m)` for `m = 1, 4, 7, 10, 13, 16`.
- Eligible windows: 63,851 eligible `(T, p)` rows on 1,178 trees. Sector-deficient eligible rows: **0**.
- Agreement with the reference instruments (third instruments only, not evidence):
  - C-T1-F `census_1_8_150.log`: 0 hits for `d ≤ 6`, `m ≤ 150`;
  - ADJ-T `out_adj_t1_low.txt`: min `3x − 2dm` is 3, 2, 2, 3 at `d = 6, 5, 4, 2` (mine matches);
  - CF-REPLAY-c5b: 0 for `d = 2..6`, `m ≤ 160`.
- Sharpness in `d` (records only, not mine to certify): the frozen census `census_1_8_150.log` and CF-REPLAY-c5b show eligible sector-deficient rows at `d = 7` (first `CB(7,109)/510`), so `d ≤ 6` is the right boundary.

**Eligible literal fidelity rows** (`sr5_lab.py`). `F_p` is derived on the original tree, `w_F` is literal, and (WID) was asserted two-sided before anything was reported. On every row `F_p` = all leaves. The sector at `CB(2,5)/10` has 5,120 sources, all of weight 1, with deletion deficit 0.

| Row | `n` | `α` | `x` | `supply` | `capacity` | `S` | Sector |
|---|---|---|---|---|---|---|---|
| `CB(1,7)/10` | 24 | 15 | 8 | 29,190 | 58,002 | −28,812 | empty (`K = 9 > D = 7`) |
| `CB(1,8)/11` | 27 | 17 | 9 | 177,576 | 322,112 | −144,536 | empty |
| `CB(2,5)/10` | 28 | 16 | 8 | 259,980 | 396,460 | −136,480 | not deletion-deficient (deficit 0) |

All 65 laboratory rows also pass (WID) two-sided. They are non-eligible laboratories, used only to test identities; they are not (HALL) evidence.

### SR-C5-5b, step by step

1. **Polynomial.**
   - `T − r = P_2 (s–v) ∪ m·P_3 (u_i–b_i–c_i)` gives `(1+2y)(1+3y+y²)^m`.
   - `T − N[r] = K_1 (v) ∪ m·P_2 (b_i–c_i)` gives `(1+y)(1+2y)^m`.
   - So `I = (1+2y)(1+3y+y²)^m + y(1+y)(1+2y)^m`. This matches `I_closed(1,m)` for `m ≤ 200`.
2. **First term.** `1 + 3y + y²` has roots `(−3 ± √5)/2 < 0`. So `(1+3y+y²)^m` is real-rooted and palindromic of degree `2m`.
   - Its coefficients `c_k` are positive, log-concave (Newton) and symmetric about `m`, hence nondecreasing up to `m`. Symmetry plus nonincreasing ratios forbids a drop before the centre.
   - The coefficient `c_k + 2c_{k−1}` has difference `(c_{k+1} − c_k) + 2(c_k − c_{k−1}) ≥ 0` for `k ≤ m − 1`. The ℕ-subtraction `m − 1` is guarded by `m ≥ 1`.
   - My instrument asserts palindromy and monotonicity to `m` for `m ≤ 200`.
3. **Second term.** Its coefficient is `e_{k−1} + e_{k−2}` with `e_j = C(m,j)2^j`.
   - `e_{j+1}/e_j = 2(m−j)/(j+1)`, so `e_{j+1} ≥ e_j` iff `3j ≤ 2m − 1`.
   - Hence the difference `(e_k − e_{k−1}) + (e_{k−1} − e_{k−2}) ≥ 0` for `3k ≤ 2m + 2`.
4. **Bound.** `Δ_k ≥ 0` for `k ≤ min(m − 1, ⌊(2m+2)/3⌋)`, checked directly for `m ≤ 200` with 0 failures.
   - For **`m ≥ 3`**, `⌊(2m+2)/3⌋ ≤ m − 1`. So `x ≥ ⌊(2m+2)/3⌋ + 1`.
   - The critics' `m ≥ 5` is valid but conservative (repair R-b2).
5. **Sector.** By CBstar at `(d,t) = (1,1)`, `D = m`, `K = p − 1`: a deletion-deficient sector subfamily exists iff `v ∈ F` and `3K < 2m + 2`, i.e. `K ≤ ⌊(2m+1)/3⌋`. The same follows from U2's regular-bipartite lemma with `SW ≡ 0`.
6. **Eligibility.** `K = p − 1 ≥ x + 1 ≥ ⌊(2m+2)/3⌋ + 2 > ⌊(2m+1)/3⌋` for `m ≥ 3`.
   - For `m ≤ 4` the eligible windows are empty: `x = m+1` and `α = 2m+1` give windows `[4,2]`, `[5,3]`, `[6,4]`, `[7,6]`, by direct computation.
   - So `CB(1,m)` has no eligible sector-deficient rank for any `m ≥ 1`.
7. **The switch term.** The brief says to "check" that `SW ≡ 0` holds "since `1_c = 0`". I checked, and the stated reason is wrong. **`SW ≡ 0` at `d = 1` holds for every `F`, independent of `1_c`.**
   - The only switch vertices available to a sector source are:
     - `s`, with `N(s) = {r, v} ⊆ B`. Its image drops `r` and `v`, and every choke stays absent, so the image has weight 0.
     - `u_i` with `b_i ∈ B`, the only way `|N(u_i) ∩ B| = 2`. Its image drops `b_i` and adds `u_i`. The one private leaf `c_i` of that choke is absent because `b_i ∈ B`, and `v` loses its witness `r`. So the image has weight 0.
   - This is U2's `(k−1) = 0` at `k = 1`. My literal check confirms it: at `d = 1`, the switch-only images of sector sources have total weight 0 on every laboratory row for every `F`, and D-only and D∪S deficits coincide there.
   - For non-eligibility the switch term is **not needed** at all, because `N_D ⊆ N`. It matters only for U2's exact sector maximum.
8. **Comparing the two critic proofs.**
   - C-U2-T F6 and C-U2-F F4 give the same construction; ADJ-U also notes "one construction, two critics".
   - Both are correct. C-U2-T states the first-term monotonicity at coefficient index `k ≤ m`, which gives `Δ_k ≥ 0` for `k ≤ m − 1`. C-U2-F states it directly as `k ≤ m − 1`. The two agree.
   - C-U2-F adds the correct consequence `p ≥ (2m+9)/3`, since `⌊(2m+2)/3⌋ ≥ 2m/3`.
   - Neither uses Darroch. The only classical input is log-concavity of a real-rooted polynomial's coefficients (Newton), and its unimodality consequence is elementary here.
9. **Relation to 5a.** At `d = 1`, 5a (modulo Darroch) already implies 5b. 5b's independent value is its **Darroch-free** proof.

**Bounded observation (mine).** For `m ≤ 200`, `x(CB(1,m)) = m + 1`. So every eligible `p ≥ m + 3` has `K ≥ m + 2 > D = m`, and **the sector is empty at every eligible rank**: 6,370 eligible rows, 0 with a nonempty sector. This is `bounded_computation` only, since `x = m+1` is unproved. It sharpens why 5b holds but is not part of its proof.

## Findings and repairs

**Strongest finding (R-a3, selector gap).** SR-C5-5a applies CBstar at eligible ranks of the (HALL) network, where `F = F_p(T)`. CBstar is registered only for `F ⊇ {v} ∪ P`, excludes `F = {v}` and states that `F_p(T) = leafSet(T)` is proved for no eligible window. ADJ-U records that `F = {v}` occurs literally on `CB(d,2)` rows.
- As written, the step "hence (with the CBstar key at `t = 1`) … NEVER deletion-deficient" therefore rests on an unstated selector hypothesis.
- **Repair:** add the elementary `t = 1` selector-independence step (step 7 above). Every private tag's witness set is `{u_i}`, absent from every sector source and every deletion target, so the sector deletion network depends on `F` only through `[v ∈ F]`.
- With this step on the face, the conclusion holds for `F = F_p(T)` at every eligible rank. I confirmed it literally on 65 rows.

**Repairs to SR-C5-5a.**
- **R-a1.** State the domain `1 ≤ d ≤ 6`, `m ≥ 1`. CBstar requires `d, m ≥ 1`, and `CB(0,m)` is outside the family.
- **R-a2.** State Darroch precisely: every mode lies in `{⌊μ⌋, ⌈μ⌉}`, hence first mode `≥ ⌊μ⌋`. The phrase "within 1 of the mean" must be strict for the displayed `3x ≥ 2dm`.
  - Robustness note: even the non-strict reading gives `x ≥ ⌈(2dm−1)/3⌉`, `3p ≥ 2dm + 5`, and still no deficiency. The sector conclusion does not hinge on the strictness.
- **R-a3.** Selector step, as above.
- **R-a4.** Put the sharper proven bound `x ≥ ⌊(2dm+2)/3⌋` on the face, with `3x ≥ 2dm` as its consequence. The bound is attained on 7 census rows (bounded).
- **R-a5.** The mean identity `2d/3 − μ(d) = 2^d(d−6)/(6(2^d+3^d))` is explanatory. The proof's `d ≤ 6` step is the summand-mean coefficient `1 − d/6`. Attribute the identity as a companion (C-T1-F and C-T1-U), not as a proof step.
- **R-a6.** Record that only `x + 2 ≤ p` is used, so the sector conclusion holds at every rank `p ≥ x + 2`. The eligibility cap `3p < 2α + 1` is not needed.

**Repairs to SR-C5-5b.**
- **R-b1.** Strike the rationale "`SW ≡ 0` since `1_c = 0`". `SW ≡ 0` at `d = 1` is structural and holds for every `F`, and it is not needed for non-eligibility.
- **R-b2.** The bound `x ≥ ⌊(2m+2)/3⌋ + 1` holds for `m ≥ 3`, not only for `m ≥ 5`. The small cases `m ≤ 4` have empty windows either way.
- **R-b3.** The "iff" of the sector-deficit criterion needs `v ∈ F_p(T)`. For non-eligibility only the "only if" direction is used, and it holds for every `F`.
- **R-b4.** Name the classical input as Newton's inequalities (log-concavity of real-rooted coefficient sequences). Note that 5a implies 5b at `d = 1` modulo Darroch, so 5b's value is a Darroch-free proof.

**SR-C5-5c (names and placement).**
- **Key or scope note: KEY for 5a.**
  - 5a carries a new lemma on independence polynomials (the lower bound on `x`) and an external classical dependency (Darroch). CBstar does not carry either.
  - A scope note cannot change a key's statement or grade, so it would import a modulo-Darroch result onto the face of a plain `proved_informal` key. The registry's precedent (`[r30 C3; SR-C3-5]`) is a separate key plus a cross-reference scope note, and I follow it.
  - I also recommend a cross-reference scope note on CBstar, because CBstar's own fence says the `t = 1` corollary "fails there". That note must now say it fails only at `d ≥ 7` census rows and holds for `d ≤ 6` by the new key.
- **5b: SCOPE NOTE on CBstar**, as the synthesis proposes. It is an elementary `d = 1` instance with no new dependency.
- **Predicate check of the synthesis name.** `…-CB-CHOKE-DEGREE-AT-MOST-SIX-…` is defective.
  - A choke `u_i` has graph degree `d + 1`: it is adjacent to `r` and to `d` supports. Literally, "choke degree at most six" means `d ≤ 5`.
  - The run's informal usage ("degree-`d_i` choke" in U2) means the support count, so the name is ambiguous between `d ≤ 5` and `d ≤ 6`.
  - The literal reading asserts less than the statement, so this is not over-assertion. But it misstates the sharp threshold, and `d = 6` is exactly where `1 − d/6` vanishes.
  - **Repaired name:** `E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS`. The statement satisfies this predicate literally: on `CB(d,m)` with at most six supports per choke, at every eligible rank, no root-plus-arm sector subfamily is deletion-deficient.
- **Lexical screen** (`sr5_alias.py`, against the 453 snapshot keys, which include the 434 master).
  - Repaired name: no exact, alias-pattern or alias hit, and no token overlap ≥ 85%. The top overlap is CBstar at 2/5. This matches the controller's prescreen of a near-identical candidate.
  - Synthesis name: its top overlap is `E993-GRAPH-SINGLE-RANK-DELETION-SUFFICIENT` at 3/5, below the 85% threshold.
  - Distinction rows are supplied for both, and for the fence key `E993-R23-LITERAL-DELETE-ONLY-HALL`.
  - The aliases I propose contain no `:`, `[`, commas or forbidden phrases.

**No fence crossed.**
- 5a and 5b are sector statements about `CB(d,m)` only.
- Neither says anything about (HALL) at any scope, and neither touches the primary aggregate or the sign of `S`.
- On switch arcs they say only `SW ≡ 0` at `d = 1`, plus the trivial `N_D ⊆ N` inclusion.
- No refuted mechanism is revived. See the distinction rows.

## Registration text

```text
KEY: E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS
STATUS: VERIFIED
GRADE: proved_informal (modulo Darroch (1964), a named classical dependency not under sources/)
STATEMENT: Let 1 ≤ d ≤ 6 and m ≥ 1, and let CB(d,m) = CBstar(d,m,1) be the tree with path r – s – v, m chokes u_i adjacent to r, d supports b_ij adjacent to each u_i and one private leaf c_ij adjacent to each b_ij (n = 3 + m + 2dm). Then I(CB(d,m)) = (1+2y)·f_d^m + y(1+y)(1+2y)^{dm} with f_d = y(1+y)^d + (1+2y)^d, and the first strict descent (computed through rank α = 1 + m(d+1)) satisfies x(CB(d,m)) ≥ ⌊(2dm+2)/3⌋, hence 3x ≥ 2dm. Consequently, for every rank p ≥ x + 2 (in particular every eligible p) and every set F of leaves of CB(d,m) (in particular F = F_p(T)), no subfamily X of the root-plus-arm sector {B ∈ I_{p+1} : r, v ∈ B} is deletion-deficient: Σ_{B∈X} w_F(B) ≤ Σ_{A∈N_D(X)} w_F(A), and a fortiori ≤ Σ over the (D) ∪ (S) neighbourhood. Proof: I = Σ_q C(m,q)·T_q + E with T_q = y^q (1+y)^{qd} (1+2y)^{d(m−q)+1} and E = y(1+y)(1+2y)^{dm}; each summand is a shifted Poisson-binomial coefficient sequence (log-concave by Newton, so nondecreasing to its first mode), with means 2dm/3 + 2/3 + q(1 − d/6) and 2dm/3 + 3/2, both ≥ (2dm+2)/3 because d ≤ 6; by Darroch every mode lies in {⌊μ⌋, ⌈μ⌉}, so every summand is nondecreasing through index ⌊(2dm+2)/3⌋ and Δ_k(I) ≥ 0 for k ≤ ⌊(2dm−1)/3⌋. For p ≥ x + 2, 3p ≥ 2dm + 6 > 2dm + 5, so by E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT at t = 1 (deficient iff 3p < 2dm + 5) no sector subfamily is deletion-deficient when v ∈ F and P ⊆ F. For general F: each private tag c_ij has W = {u_i}, and u_i lies in no sector source and in no deletion target of one, so the sector deletion network depends on F only through [v ∈ F], and v ∉ F gives weight 0. The bound x ≥ ⌊(2dm+2)/3⌋ is attained (e.g. CB(4,2), CB(5,1), bounded_computation).
SCOPE: The root-plus-arm sector of the homogeneous CB(d,m) family, 1 ≤ d ≤ 6, m ≥ 1, every rank p ≥ x(T) + 2, every set F of leaves. Deletion arcs; the (D) ∪ (S) inequality on sector subfamilies follows from N_D ⊆ N.
ATTRIBUTION: C-T1-F (Claude Opus 5.5; critic-derived lemma F-3, the binomial split and the summand-mean bound); the mean identity 2d/3 − μ(d) = 2^d(d−6)/(6(2^d+3^d)) as an explanatory companion, derived by C-T1-F and C-T1-U (Claude Opus 5.5); the r30 T adjudicator (Claude Opus 5.5; step check and census); isolated second read SR-C5-5 (Claude Opus 5.5; the selector-independence step at t = 1, the precise Darroch form, the sharper bound on the face); E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT (C-T2-U and T2, with their attribution); Darroch (1964) for the mode bound; Codex (GPT-6) for the transport mechanism, the active-tag weight and the relation; the first-interior run (Codex) for the definition layer, entries 1–18.
FENCES: sector subfamilies of CB(d,m) with d ≤ 6 only; not (HALL) or (HALL-COND) for any X outside the sector, at any scope; not a (CUT); not the primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, nothing about the sign of S(T, p); no status transfer to E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993; not E993-R23-LITERAL-DELETE-ONLY-HALL (distinction row); not E993-GRAPH-SINGLE-RANK-DELETION-SUFFICIENT (distinction row); nothing for d ≥ 7, where eligible sector-deficient rows exist (bounded census, first CB(7,109)/510); Darroch (1964) is an undischarged classical dependency named here, not under sources/; the census rows are bounded_computation and are not evidence of the statement.
ALIASES: CB at-most-six-supports sector non-deficiency
ALIASES: CB d at most 6 sector sufficiency
```

```text
SCOPE NOTE ON: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: [r30 C5; SR-C5-5] At t = 1 this key's non-deficiency corollary fails only where 3(x(T)+2) < 2dm + 5 (census rows at d ≥ 7, e.g. CB(8,86)/460). For 1 ≤ d ≤ 6 it holds at every rank p ≥ x(T) + 2 by E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS (proved_informal modulo Darroch (1964); C-T1-F; second read SR-C5-5), which proves x(CB(d,m)) ≥ ⌊(2dm+2)/3⌋. At t = 1 the key's F hypothesis may be dropped for the sector deletion network: each private tag's witness set is {u_i}, absent from every sector source and deletion target, so the network depends on F only through [v ∈ F] (SR-C5-5; literal check on 65 laboratory rows, bounded_computation). This note changes neither this key's statement, grade nor fences.
```

```text
SCOPE NOTE ON: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: [r30 C5; SR-C5-5] CB(1,m) (d = t = 1) has no eligible sector-deficient rank for any m ≥ 1, proved_informal without Darroch. I(CB(1,m)) = (1+2y)(1+3y+y²)^m + y(1+y)(1+2y)^m (from T − r = P_2 ∪ mP_3 and T − N[r] = K_1 ∪ mP_2); (1+3y+y²)^m is real-rooted and palindromic, so its coefficients are log-concave (Newton) and nondecreasing to index m, giving Δ_k ≥ 0 for k ≤ m − 1; the coefficients e_{k−1} + e_{k−2}, e_j = C(m,j)2^j, give Δ_k ≥ 0 for 3k ≤ 2m + 2; hence x ≥ ⌊(2m+2)/3⌋ + 1 for m ≥ 3, and eligibility forces K = p − 1 ≥ ⌊(2m+2)/3⌋ + 2 > ⌊(2m+1)/3⌋, the deficiency threshold of this key at (d, t) = (1, 1); m ≤ 4 has empty eligible windows. At d = 1 the switch images of sector sources have weight 0 for every F (SW ≡ 0; U2's (k − 1) = 0), so the exact sector maximum is max(0, C(m,K)2^K − C(m,K−1)2^{K−1}) when v ∈ F_p(T); non-eligibility does not use SW, since N_D ⊆ N. Sector only; not (HALL) on CB(1,m) (E1 fails at CB(1,7)/10; C-U2-F's full-network check at 126 eligible ranks, 7 ≤ m ≤ 32, is bounded_computation). The exact deficient list {(1,1), (3,2), (4,3)} stays bounded_computation. Attribution: C-U2-T and C-U2-F (Claude Opus 5.5; the lower bound on x, two statements of one construction) on U2's structure (Claude Sonnet 5; New Lemma 1, the sector closed forms, SW ≡ 0); the r30 U adjudicator (Claude Opus 5.5); isolated second read SR-C5-5 (Claude Opus 5.5). This note changes neither this key's statement, grade nor fences.
```

```text
DISTINCTION ROW: R30-C5-CB-SIX-SUPPORT-SECTOR-VS-GRAPH-SINGLE-RANK-DELETION-SUFFICIENT
KEY: E993-GRAPH-SINGLE-RANK-DELETION-SUFFICIENT
TEXT: The CONDITIONAL key is a coefficient-sign certificate on a finite graph U at the single rank q = p − 2: a residual vertex a with Δ_q(U − a) ≤ 0 and Δ_{q−1}(U − N_U[a]) ≤ 0 certifies Δ_q(U) ≤ 0. The new key concerns no residual vertex and no sign of Δ: it gives a lower bound on the first strict descent of CB(d,m), d ≤ 6, and deduces, through the CBstar formula, that no subfamily of one transport sector is deficient under deletion arcs with the active-tag weight. Different object (independence-count certificate vs weighted transport inequality), family and conclusion; the shared tokens RANK, DELETION, SUFFICIENT name unrelated notions. Not an alias.
```

```text
DISTINCTION ROW: R30-C5-CB-SIX-SUPPORT-SECTOR-VS-R23-LITERAL-DELETE-ONLY-HALL
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: The refuted key asserts universal unweighted Delete-only Hall, |X| ≤ |Gamma_Delete(X)|, on the complete r23 tagged top side of every eligible ordinary tree. The new key is weighted by the active-tag weight w_F, restricted to subfamilies of the root-plus-arm sector of CB(d,m) with d ≤ 6, and proved from an exact sector formula plus a descent bound; it asserts nothing about sources outside that sector, nothing for d ≥ 7 (where the sector is deletion-deficient at eligible ranks), and no universal deletion-only statement. Not a revival.
```

```text
DISTINCTION ROW: R30-C5-CB-SIX-SUPPORT-SECTOR-VS-CBSTAR
KEY: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: CBstar gives the exact sector deletion-deficit formula for every p ≥ 2 and F ⊇ {v} ∪ P, with a non-deficiency corollary for t ≥ 2 only. The new key adds a new lemma CBstar does not contain, x(CB(d,m)) ≥ ⌊(2dm+2)/3⌋ for d ≤ 6 (modulo Darroch), and the t = 1 selector-independence step, and composes them with CBstar at t = 1 to obtain non-deficiency at every rank p ≥ x + 2 for every F. A corollary with its own lemma and dependency, not a restatement; CBstar's statement, grade and fences are unchanged.
```

```text
RECORD: R30-C5-SR5-CB-SMALL-D-DESCENT-CENSUS
CLAIM: For 1 ≤ d ≤ 6 and 1 ≤ m ≤ 200 (1,200 trees; x through α): 3x(CB(d,m)) − 2dm ≥ 2 on every row (minima 4, 3, 3, 2, 2, 3 for d = 1..6); x = ⌊(2dm+2)/3⌋ exactly at CB(4,2) and CB(5,m), m = 1, 4, 7, 10, 13, 16; 63,851 eligible rows, 0 sector-deficient. For CB(1,m), m ≤ 200: x = m + 1, so the root-plus-arm sector is empty at every eligible rank (6,370 rows). 65 laboratory rows (non-eligible, plus 3 eligible fidelity rows CB(1,7)/10, CB(1,8)/11, CB(2,5)/10 with (WID) two-sided): the sector deletion max-deficit is the CBstar t = 1 formula and is independent of F given [v ∈ F]; switch-only images have weight 0 at d = 1.
STATUS: bounded_computation
PROVENANCE: isolated second read SR-C5-5 (Claude Opus 5.5), scratchpad/c5-sr-SR-C5-5/sr5_census.py (out 0a8533ab229c7f40a252e938d970668f414acba04c5310c4af4daeac22104257) and sr5_lab.py (out c3a7f84fc280d457f724d621d3eb763f2dc71ba0880f4e3cb0920d738cbd9cb1); never evidence in a proof.
```

## Verdicts

verdict[SR-C5-5a]: confirmed_with_repairs
verdict[SR-C5-5b]: confirmed_with_repairs
verdict[SR-C5-5c]: confirmed_with_repairs

- **5a.** The mathematics is correct. The repairs are the domain `1 ≤ d ≤ 6` (R-a1), the precise Darroch form (R-a2), the `t = 1` selector-independence step needed to apply CBstar at `F = F_p(T)` (R-a3), the sharper bound on the face (R-a4), the role of the mean identity (R-a5) and the rank range `p ≥ x + 2` (R-a6). The registration text above is the repaired form.
- **5b.** The mathematics is correct and the two critic proofs agree. The repairs are the corrected `SW ≡ 0` rationale (R-b1), `m ≥ 3` (R-b2), the `v ∈ F` condition on the "iff" (R-b3) and naming the dependency (R-b4). It registers as a SCOPE NOTE on CBstar.
- **5c.** KEY form confirmed for 5a, with a renamed predicate, because "choke degree" is `d + 1` in graph terms. SCOPE NOTE confirmed for 5b. Add the cross-reference scope note and the three distinction rows.
- Both statements are non-decisive for ruling 39.

## Artifact inventory

Scratch is under `scratchpad/c5-sr-SR-C5-5/`. Everything uses the Python standard library with exact integers and `Fraction`, runs under `python3 -B`, and runs in the foreground.

| File | SHA-256 | Content |
|---|---|---|
| `sr5_census.py` | `4ad8a8e5ccbedebf9e9e90ba86559335e5f85993c186d4f3deaa72a98f87a950` | Closed-form polynomial and validation; `d ≤ 6`, `m ≤ 200` census; summand/Darroch-step check; mean identity; `CB(1,m)` to 200 |
| `sr5_census.out.json` | `0a8533ab229c7f40a252e938d970668f414acba04c5310c4af4daeac22104257` | Census output (`RESULT_SHA256` of the same bytes) |
| `sr5_lab.py` | `b61cde0f7b7aa4327e3a9babb7d0e552c9b0a1f716cb164c1d4d35f422e35bf0` | Literal network laboratory: derived `F_p`, literal `w_F`, (D)/(S), (WID) two-sided, Dinic max-flow sector deficits for four `F` |
| `sr5_lab.out.json` | `c3a7f84fc280d457f724d621d3eb763f2dc71ba0880f4e3cb0920d738cbd9cb1` | 65 laboratory rows and 3 eligible rows |
| `sr5_alias.py` | `3e73b4f82b9c81ae956fff71bc5db31b41d324335d12670bf4d3bf61416e0739` | Lexical screen against the 453-key snapshot and the 434 master |
| `sr5_alias.out.json` | `177ed3ea6aaaa221f9ca7292f8b6f81e00c78ca5cab7f1d78086973d71400701` | Screen output |
| `second-reads/SR-C5-5/SECOND-READ.md` | (this file) | The read |

I read the following capsule members, all digest-verified:
- the protocol, the brief and the manifest;
- `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`;
- `SYNTHESIS.md` (the sections named in the brief, plus Registrations);
- the C-T1-F, C-U2-T and C-U2-F critiques (the relevant findings);
- the ADJ-T and ADJ-U adjudications (the relevant items);
- the U2 return (New Lemma 1, the closed forms and the `CB(1,m)` section);
- the snapshot entries for CBstar and `E993-GRAPH-SINGLE-RANK-DELETION-SUFFICIENT`;
- `C5-CONTROLLER-ALIAS-PRESCREEN.json`;
- `CLAIM-DISTINCTIONS.json` (its format and the last rows);
- `CF-REPLAY-c5b.json`;
- the reference outputs `ADJ-T/out_adj_t1_low.txt`, `ADJ-U/own/adj_cb.out`, `C-T1-F/instr/sturm.json` and `C-T1-F/instr/census_1_8_150.log`, compared only.

Read-boundary deviations are listed under *Identity and seal audit*.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]
