# Second Read

Read `SR-C3-5`, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Cycle 3. Object: E4 (the pendant-`P_3`-arm
collapse, CD-1 = L1) with G1 (the self-covering reduction), G3 as repaired, the conditional C1, and the proposed key.
Date 2026-09-27.

**Boot.** Operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, the two files the protocol grants. I loaded no other VerityOS
subsystem (memory, decisions, logs, conversations, operations, modules, skills).

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Capsule inner seal `control/c3-second-read/SR-C3-5-PACKET-MANIFEST.json` (SHA-256 of the key-sorted compact JSON without `seal_sha256`, separators `(",", ":")`, no trailing newline) | `12095fd7a36ef508b082ba6331da2a2c279485316b4fa212164cb3a6536e214b` | `12095fd7a36ef508b082ba6331da2a2c279485316b4fa212164cb3a6536e214b` | **match** |
| The 18 listed members (bytes and SHA-256 each) | manifest | recomputed before any member was read | **18/18 match** |
| `control/PATH-CHECK-c3-second-read-briefs.json` | — | read | 9 files scanned, 0 findings |

Manifest fields: `run_id` `erdos-993-math-dre-20260926-r30-weighted-transport`, `stage` `cycle-3-second-read-SR-C3-5`,
`file_count` 18. Members read: `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C3-SECOND-READ-PROTOCOL.md`,
`control/C3-SECOND-READ-BRIEF-SR-C3-5.md`, `cycles/cycle-3/stage6/SYNTHESIS.md`, `cycles/cycle-3/stage3/returns/T2/RETURN.md`,
both T2 critiques, `cycles/cycle-3/stage5/adjudicators/T/ADJUDICATION.md` (its T2 section and summary tables), and the two
registries (`control/snapshots/CLAIM-IDENTITY.run-local.c3-stage2.json`, 443 claims; `sources/authority/CLAIM-IDENTITY.json`,
434 claims), both read with Python by key. From `control/C3-ALLOCATION.md`, `control/C3-STAGE1-GATE.md`,
`control/C3-STAGE6-CONTROLLER-FACTS.json` and `cycles/cycle-2/CYCLE-CLOSE.md` I read only single-file `grep` hits (T2, A4,
self-covering). I did not open `control/C3-STAGE6-PACKET-MANIFEST.json` or `control/SOURCE-DIGESTS.json` beyond hashing them.
I used no controller fact or census as evidence.

**Read-boundary disclosures.**
1. The host put the project `CLAUDE.md` and the user auto-memory index into context at session start. I did not open either,
   and nothing below relies on them. `CLAUDE.md` asks every session to boot from `verity.md` and `startup-protocol.md`; the
   protocol grants exactly those two files, so the boot fits inside the isolation boundary.
2. `SYNTHESIS.md` was too large to print in one call, so the harness saved my `cat` output to a session tool-results file,
   which I then read in two pages. The content is the capsule member's own text.
3. Above the capsule: one `ls -d` of `second-reads/SR-C3-5` (it did not exist yet), one `mkdir` each for that directory and for
   my scratch directory, and `ls` listings of those two directories only. There was no `find`, and no `grep`/`rg` rooted above a capsule member.
4. I opened no other return, critique, adjudication, second read, seat or critic scratch, `control/CLAIM-DISTINCTIONS.json`,
   Mathlib or Lean project. I used no network and installed nothing. Python ran as `python3 -B` with the standard library,
   exact integers and `fractions`. There was no background job, so none was running at the final write.

## Statements read

- **SR-C3-5a (B3, G1).** From T2 (§1–§2): Proposition 1 (the weight formula), Proposition 2 (the exact per-exit weight loss
  `κ_q`), the `φ` identity, and Theorem G1, which restricts every sector deficit to `R* = {B ∈ S^Q_{p+1} : w_F(B) < K/(|Q|−1)}`.
  The synthesis records it as B3 (`proved_informal`, narrowed by B2), with `P ⊆ F`, (A4) and (H-attach) on its face.
- **SR-C3-5b (B2, E4).** C-T2-F's F-1 (CD-1) and C-T2-U's L1, as adjudicated (T2-A1). Under (A4), (H-attach), `M ≥ 1` and
  `T ≠ K_2, P_3`, a positive sector deletion deficit requires `Q = {r, v}` with `N(s) = {r, v}`, `β = 1` and `K = 2`. The brief
  also asks for the Corollary counterexample (C-T2-U: formula 96, true deficit 0).
- **SR-C3-5c (B4 and C1).** G3 as repaired (`t_min ≥ 2` ⇒ no deletion-deficient sector subfamily at any eligible `p`), with the
  two critic repairs, the (LB) input and its record-only status. C1 (CD-2 = L2): the exact heterogeneous deficit
  `max(0, e_{p−1}(q) − e_{p−2}(q))`, graded `conditional` on the claw-product normalized-matching theorem.
- **SR-C3-5d (the key).** Synthesis registration 10, `E993-R30-POSITIVE-SECTOR-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM`,
  VERIFIED `proved_informal`, B2 with B3 as its reduction. It needs an alias check against `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`
  and the refuted keys, a check that the name is a predicate, and the scope note on the `CBstar` key.

**Definitions used (from T2 §0 and `SEMANTIC-CONTRACT.md` §1).** `T` is a finite tree and `Q ⊆ V(T)` is nonempty and
independent. `T − N[Q]` is a disjoint union of stars `S_1, …, S_M` with centres `c_i` and `t_i ≥ 1` leaves; `P` is the union of
the star leaves. **(H-attach)**: every edge between `S_i` and `N(Q)` is incident to `c_i`, equivalently every leaf of `S_i` is a
leaf of `T`. **(A4)**: every `v ∈ F ∖ P` has `W_v = N(s_v) ∖ {v} ⊆ Q`. The sector is `S^Q_{p+1} = {B ∈ I_{p+1}(T) : Q ⊆ B}`,
`β = |F ∩ Q|`, and `κ_q = [q ∈ F] + #{u ∈ F ∩ Q ∖ {q} : W_u = {q}}`, with `K = Σ_q κ_q`. For `X` in the sector,
`φ(X) = Σ_{B∈X} w_F(B) − Σ_{A ∈ N_D(X)} w_F(A)`, where `N_D(X) = {B ∖ {y} : B ∈ X, y ∈ B} ⊆ I_p(T)`. A *positive sector deletion
deficit* at `p` means `max_{X ⊆ S^Q_{p+1}} φ(X) > 0`.

**Two brief paraphrases do not match these definitions.** Neither is load-bearing; the registration text uses the
definitions.
1. The brief glosses (H-attach) as "deleting `q ∈ Q` from a sector source gives a target private to that source". That is the
   (automatic) privacy of `Q`-exits inside the sector, not (H-attach).
2. The brief glosses `R*` as "sources whose every `Q`-deletion carries its full weight". This is inverted. `R*` is the set of
   sources whose `Q`-exits do **not** absorb their weight: `Σ_q w(B ∖ {q}) = |Q|·w(B) − K < w(B)`. In the live case every
   `Q`-exit of an `R*` member has weight 0.

## Independent re-derivation

**Own instrument.** It lives in `scratchpad/c3-sr-SR-C3-5/` and shares no code with any seat or critic.
- Trees are checked for connectivity (BFS) and acyclicity (union-find) as separate conditions, plus `|E| = n − 1`.
- Independence polynomials of `T − D` come from a forest DP on the original carrier. On the small eligible trees they were
  cross-checked against brute-force enumeration.
- `x` is scanned through rank `α`, with the terminal difference included.
- `F_p(T)` is derived leaf by leaf from `Δ_p(T − v) < 0`.
- `S` comes from the DP polynomials of `T − H_v` and `T − R_v`. Supply and capacity come from brute-force layer enumeration with
  the literal active weight. `supply − capacity = S` is asserted on every full row (independent sides).
- The (D) and (S) arcs are literal.
- The maximum deficit is `supply − maxflow` (Dinic; capacitated Hall deficiency).
- Non-isomorphic trees come from leaf growth with a min-over-roots AHU canonical form. The counts 1, 1, 1, 2, 3, 6, 11, 23,
  47, 106, 235, 551 for orders 1–12 agree with the known sequence.

**Fixed points reproduced first** (`fixed_points.py`; all asserted):
- `K_{1,12}/8`: `α 12`, `x 6`, eligible `{8}`, `|F| 12`, supply/capacity `1980/3960`, `S = −1980`, full-network deficit 0.
- Path-star `(2,3,4)/7`: `n 15`, `α 11`, `x 5`, `|F| 10`, `1483/2701`, `S = −1218`, mixed deficit 0.
- `CB(8,92)`: `n 1567`, `α 829`, `x 490`, window `[492, 552]`, `|R_491|/|R_490| = 492/491`.

### SR-C3-5a — Proposition 2, the `φ` identity and G1

- **Where `B` lives.** `Q ⊆ B` and `B` is independent, so `B ∩ N(Q) = ∅` and `B ⊆ Q ∪ (star forest)`.
- **Proposition 2: `w_F(B ∖ {q}) = w_F(B) − κ_q` for `B ∈ S^Q_{p+1}`, `q ∈ Q`.**
  - Take a tag `u ∈ F ∩ B` in the star forest. Its support is a centre `c_i ∉ N[Q]`, so `W_u ⊆ S_i ∪ N(Q)` and `q ∉ W_u`. Its
    activity is unchanged.
  - Take a tag `u ∈ F ∩ Q`, `u ≠ q`. By (A4), `W_u ⊆ Q ⊆ B`, and `u ∉ W_u`. So `u` stays active in `B ∖ {q}` iff
    `W_u ∖ {q} ≠ ∅`, and it is lost iff `W_u = {q}`.
  - The tag `q` itself, if `q ∈ F`, is removed.
  - The total loss is `κ_q`.
  - Hypotheses consumed: (A4) on the `Q`-tags, and star-forest tags having their support off `N[Q]`. That second fact needs
    only that every component of `T − N[Q]` has at least 2 vertices; (H-attach) is **not** consumed.
- **Privacy within the sector.**
  - The exits `B ∖ {q}` are injective in `B` (add `q` back).
  - For `q ≠ q'`, the `q`-exit contains `q'` and the `q'`-exit does not, so exits for different `q` are distinct.
  - Exits miss `q`, while the in-sector shadow `∂_sec X = {B ∖ {y} : B ∈ X, y ∈ B ∖ Q}` keeps all of `Q`, so the two are
    disjoint.
  - Hence `φ(X) = Σ_{B∈X}[K − (|Q| − 1)·w_F(B)] − w_F(∂_sec X)`.
  - "Private" means private within the sector: an exit is also a deletion target of non-sector sources.
- **G1 (for `|Q| ≥ 2`).** Removing `B_0` with `(|Q| − 1)w_F(B_0) ≥ K` changes `φ` by `[(|Q|−1)w_F(B_0) − K] +
  [w_F(∂_sec X) − w_F(∂_sec(X ∖ B_0))] ≥ 0`, since `∂_sec` is monotone and weights are nonnegative. Hence
  `φ(X ∩ R*) ≥ φ(X)` for **every** `X`, and `max_{sector} φ = max_{R*} φ`. G1 uses only Proposition 2's hypotheses: **`P ⊆ F`
  is not consumed.**
- **Proposition 1: `w_F(B) = β + Σ_i g(ℓ_i(B))`.**
  - `P ⊆ F` is consumed here. So is `F ∖ P ⊆ Q`, which T2's proof uses silently and which follows from (A4) and `T ≠ K_2` (CD-1
    step (i); see 5b).
  - The attachment vertices lie in `N(Q)` and are absent from every sector member. T2's "unique attachment edge" argument is
    false (both critics' path `a–x–c–y–b`) and is not needed.
  - With `P ⊆ F`, `R*` in the live case is exactly the rank-`k` layer of the claw product.
- **Checks.**
  - `e4_sweep.py 12`: every tree of order ≤ 12 and every nonempty independent `Q` in the star-forest setting ((H-attach),
    `M ≥ 1`) with (A4). `F` ranges over every leaf subset when there are at most 6 leaves; otherwise `F` is the leaf set, every
    derived `F_p`, and 12 seeded random subsets. Every rank is covered.
  - Proposition 2 was asserted on **1,286,456** sector members.
  - G1's `max_{sector} φ = max_{R*} φ` was asserted on **293,457** `(T, Q, F, p)` rows, with 0 failures.
  - `phi_identity.py`: the `φ` identity, with `φ` computed literally from `N_D(X) ⊆ I_p(T)`, and `φ(X ∩ R*) ≥ φ(X)` on 72,960
    random subfamilies (18,240 cases, order ≤ 11), with 0 failures.
  - `prop1.py`: Proposition 1 was asserted on 14,906 members with `P ⊆ F`, with 0 failures. Where `P ⊄ F` it fails on 24,535 of
    83,823 members, so `P ⊆ F` is load-bearing for Proposition 1. `F ∖ P ⊆ Q` held in all 9,267 (A4) cases.

### SR-C3-5b — the collapse E4 (CD-1 = L1)

This is my proof. It uses only the `φ` identity; G1's restriction is not needed.
1. **(i) The `Q`-tags.** A favorable leaf `v ∈ N(Q)` has `s_v ∈ Q`, so `W_v ⊆ N(s_v)` is disjoint from the independent `Q`.
   (A4) then forces `W_v = ∅`, which means `T = K_2`. So `F ∖ P ⊆ Q`, and `β = |F ∩ Q|`.
2. **(ii) The weight floor.** Each `u ∈ F ∩ Q` is active in every sector member, because `∅ ≠ W_u ⊆ Q ⊆ B` (`W_u ≠ ∅` as
   `T ≠ K_2`). So `w_F ≥ β` on the sector.
3. **(iii) The bound on `K`.** `K = β + β_1` with `β_1 = #{u ∈ F ∩ Q : |W_u| = 1}`, so `K ≤ 2β`.
4. **(iv) The deficit bound.** `φ(X) ≤ Σ_{B∈X}[K − (|Q|−1)β] = c·|X|` with `c = K − (|Q| − 1)β`.
5. **(v) The cases where `c ≤ 0`.**
   - `|Q| = 1`: `W_q ⊆ Q ∖ {q} = ∅` is impossible, so `β = K = 0` and `φ ≤ 0`.
   - `|Q| ≥ 3`: `c ≤ 2β − 2β = 0`.
   - `|Q| = 2`, `β = 0`: `K = 0`.
   - `|Q| = 2`, `β = 1`, `β_1 = 0`: `c = 0`.
   - `|Q| = 2`, `β = 2`: `W_a = {b}` and `W_b = {a}` force one support `s` with `N(s) = {a, b}`, so `T = P_3`, which is excluded.
6. **(vi) The only case left** is `|Q| = 2`, `β = 1`, `β_1 = 1`, `K = 2`. Then `Q = {r, v}`, `v ∈ F` is a leaf, and
   `W_v = {r}`, i.e. `N(s) = {r, v}`: a pendant `P_3` arm `r–s–v`.
   - `N(Q) = N(r) ∪ {s}` and `N(s) = {r, v}`, so the stars hang, at their centres, from vertices of `N(r) ∖ {s}`.
   - Vertices of `N(r) ∖ {s}` that carry no star are leaves of `T`. They lie outside `F` by (A4).
   - This is the heterogeneous CB pattern.

**Why every other shape gives `R*` empty, not merely non-deficient.** For `|Q| ≥ 2`, `c ≤ 0 ⟺ W* = K/(|Q|−1) ≤ β ≤ min w_F`.
So `R* = ∅` at every rank, and by G1 no sector subfamily is deficient. For `|Q| = 1`, `φ(X) = −w_F(∂_sec X) ≤ 0` directly. In the
live case `W* = 2` and `R* = {w_F = 1}`.

**Hypotheses, and where each enters.**
- **(A4)** enters (i) and Proposition 2. It is consumed only through its `Q`-part: tags in `N(Q)` never lie in a sector member
  or in its deletion targets, so they never affect `φ`.
- **`T ≠ K_2`** enters (i) and (ii). **`T ≠ P_3`** enters (v).
- **`M ≥ 1`** is used only to exclude `K_2` and `P_3` (in the setting `M ≥ 1` implies `T ≠ K_2, P_3`). CD-1 cites `M ≥ 1` and
  L1 cites `T ≠ K_2, P_3`; these carry the same content here.
- **(H-attach) and `P ⊆ F` are not consumed.**
- **No eligibility is used.** E4 holds at every rank `p`.

**CD-1 and L1 are the same statement.**
- Both have the same necessity content and the same proof skeleton: `F ∖ P ⊆ Q`, `K ≤ 2β`, the sign of `c`.
- L1 phrases the conclusion as "the residual is nonempty exactly when Q = {r,v} with N(s_v) = {v,r}". Positive `φ` forces
  `X ∩ R* ≠ ∅` by G1, so L1's direction implies CD-1's. `c ≤ 0` gives `R* = ∅`, so CD-1's proof gives L1's.
- CD-1 adds the CB-pattern description of `T − N[Q]`. L1 states the same in words ("heterogeneous `CBstar`").
- The only difference is the hypothesis spelling, `M ≥ 1` versus `T ≠ K_2, P_3`, which coincide in the setting.

**Exhaustive check (`e4_sweep.py 12`; bounded computation, a record only).** The table counts `(T, Q, F, p)` rows over every
tree of order ≤ 12. A row is *live* when `Q = {r, v}` with `v ∈ F`, `N(s_v) = {r, v}`, `β = 1` and `K = 2`.

| Class | Rows | Positive deficit | Positive and not live |
|---|---:|---:|---:|
| star forest, (H-attach), `M ≥ 1`, (A4) (the statement's class) | 309,106 | 2,001 | **0** (asserted) |
| star forest without (H-attach), (A4) | 255,379 | 2,384 | 0 |
| (H-attach), (A4) fails only on tags in `N(Q)` | 391,480 | 1,222 | 0 |
| (H-attach), (A4) fails on a `Q`-tag | 996,064 | 8,534 | 8,534 |
| not a star forest (`F` = leaf set) | 1,611,572 | 49,419 | 45,839 |

The first three rows corroborate the hypothesis accounting above. The fourth shows that (A4) on the `Q`-tags is load-bearing.
For example, on `P_4` (edges 0–1, 0–2, 1–3) with `Q = {2}`, `F = {2}` and `p = 1`, the deficit is 1. In the statement's
class, positive deficits do occur in the live case (2,001 rows), so the necessity statement is not vacuous. Of the 3,568 live
rows, 1,567 are non-deficient, because the arm is necessary, not sufficient.

**The Corollary counterexample, reproduced (`instances.py`).**
- **Tree.** `r = 0`, `s = 1`, `v_1 = 2`, `v_2 = 3` (`s ~ r, v_1, v_2`), one choke `u = 4 ~ r`, and five stars `b_i ~ u` with one
  leaf `c_i` each (`n = 15`).
- **Setting.** `Q = {0, 2, 3}` and `F = P ∪ {v_1, v_2}`. (A4) holds, `F` equals the derived `F_7`, and `α = 8`, `x = 5`. The
  row is not eligible, and the Corollary claims no eligibility.
- **Parameters.** `β = 2`, `κ = (0, 1, 1)`, `K = 2`, `c = −2`. At `M = 5`, `q = 2`, `k = 5` the bracket is
  `C(5,5)·2^5 − C(5,4)·2^4 = −48`.
- **Formula versus truth.** T2's formula gives `max(0, (−2)(−48)) = 96`. The true maximum sector deletion deficit (32 members,
  supply 64, exact max-flow) is **0**. `R* = ∅` and the minimum sector weight is `2 = β`.
- **Every rank.** The deficit is 0 at every rank `p = 2..7`, with the stated `F` and with `F_p` derived.
- T2's own `|Q| = 3` fixed point (two stars with `t = 2`) is also 0 at every rank. Its bracket never turns negative there, which
  is why it could not falsify the formula.
- So the Corollary formula is false off `c = β = 1`. By E4 that is the only positive case, and there the formula is the
  registered `CBstar` formula.

### SR-C3-5c — G3 repaired, (LB), C1

**G3's algebra.**
- By E4, only the live case can be deficient. There the local rank is `k = p − 1`. (T2's general "`k = p − 1`" should read
  `k = p + 1 − |Q|`; this matters only off the live case, where E4 already gives `φ ≤ 0`.)
- With `P ⊆ F`, `R*_k` is the rank-`k` layer of `C_{q_1} × … × C_{q_M}`, where `q_i = t_i + 1`, and `φ(X) = |X| − |∂X|` there.
- **G2b.** Up-degrees are at most `Q_tot − (k − 1)q` with `q = q_min`, so `|∂X| ≥ k|X|/(Q_tot − (k−1)q)`. Hence `φ ≤ 0` once
  `k(1 + q) ≥ Q_tot + q`.
- **The (LB) step.**
  - `T` is a forest and `Δ_x(T) < 0` by the definition of `x`. (LB) `E993-R27-FOREST-DESCENT-LINEAR-BOUND`, at its registered
    statement with `k = x`, gives `n ≤ 4x`.
  - Eligibility gives `k = p − 1 ≥ x + 1 > n/4`, and `n = |N[Q]| + Q_tot`.
  - The only eligibility input is the lower bound `p ≥ x + 2`.
  - One informal identification is involved: (LB)'s `Δ` is `Erdos993G1.delta`, while `x` is `C5LA1.crossingIndex` over
    `forwardDifferenceDel G ∅`. A formal version would need that bridge, as the `CBstar` key already notes.
- **T2's rearrangement is wrong.** From `4k ≥ |Q| + Q_tot` the correct sufficient condition is
  `|Q|(1 + q) − 4q ≥ Q_tot(3 − q)`, which fails at `|Q| = 2`, `q = 3`. My smallest witness is `q = 3`, `Q_tot = 6`, `k = 2`:
  `4k = 8 ≥ 8`, but `k(1 + q) = 8 < 9`.
- **C-T2-U's repair (`|N[Q]| ≥ 3`, from `r, s, v`).** It reduces to `(1 + q)(3 + Q_tot) ≥ 4(Q_tot + q) ⟺ (q − 3)(Q_tot − 1) ≥ 0`.
- **C-T2-F's repair (`|N[Q]| ≥ 4`; a choke exists since `M ≥ 1`).** It reduces to `Q_tot(q − 3) + 4 ≥ 0`.
- **Both repairs are valid.** Checked exactly on the grid `3 ≤ q ≤ 12`, `q ≤ Q_tot < 400`, with the integer `k_min`: 0
  violations for either. C-T2-U's hypothesis is the **weaker** one (`|N[Q]| ≥ 4` implies `|N[Q]| ≥ 3`), so the T adjudicator
  was right to adopt it. Both hypotheses hold in every live instance.
- **B4's hypotheses.** `P ⊆ F` (through Proposition 1), (A4), (H-attach), B2, B3 and (LB). They must stay on B4's face.

**G3 rows (`c1_g3.py`).** There are 16 eligible rows on heterogeneous `t_min ≥ 2` CB-pattern trees of order 16–24, with `F_p`
derived (always the leaf set, and `P ⊆ F`) and WID asserted. On every row the sector deletion deficit is 0 and the weight-one
count is 0. This includes T2's tree, whose choke assignment `[[3,2],[2,3],[2]]` reproduces the critics' corrected row exactly:
- `n 23`, `α 16`, `x 8`, `p = 10`;
- `F` = all 13 leaves;
- WID `74154 − 127390 = −53236 = S`;
- 404 sector members, sector supply 3368, deletion deficit 0, `R* = ∅`.

**Vacuity.** A DP scan of 130 larger rows (`d ≤ 8`, `m ≤ 40`, five `t`-mixes) has minimum `x − M = 1`, so `k ≥ M + 2 > M` and
`R*_k = ∅` at every eligible rank on every tested row. At uniform `t = 2`, emptiness is already a proved record rather than only
a bounded observation: the registered `CBstar` key's scope carries C-T2-F's P1(i) (`Δ_k(T) ≥ 0` for `k ≤ M`, so `x ≥ M + 1`;
`proved_informal`, SR-C2-3). I cite it at that grade and did not re-derive it. For heterogeneous `t` it remains open.

**Record-only status is right.** B4 is correct as repaired, but it has empty content on every tested row, and C1 would
supersede it. So it should not be registered.

**C1.**
- **Reduction.** In the live class with `P ⊆ F`, (A4) and (H-attach), G1 and E4 put the maximum on `X ⊆ L_k`, the rank-`k`
  layer of `C_{q_1} × … × C_{q_M}` (`|L_k| = e_k(q)`). There `φ(X) = |X| − |∂X|`, and `∂L_k = L_{k−1}` for `1 ≤ k ≤ M`.
- **The exact unproved lemma.** For every `1 ≤ k ≤ M` and every `X ⊆ L_k`:
  `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)`, where `∂X = {y ∈ L_{k−1} : y < x for some x ∈ X}`. This is normalized matching between
  consecutive ranks.
- **Given the lemma**, `φ(X) ≤ |X|(1 − e_{k−1}/e_k) ≤ max(0, e_k − e_{k−1})`, with equality at `X = L_k` or `∅`, and `k = p − 1`.
- **Status.** Neither critic proves the lemma, and no capsule member contains it; the Harper and Hsieh–Kleitman product
  theorem is cited from memory. I did not discharge it. **C1 is `conditional`.** It is one shared undischarged import, not two
  proofs, and it is not registered.
- **Corroboration only (bounded computation).**
  - Exact max-flow NM saturation on 24 layers of 7 heterogeneous `q`-tuples.
  - The formula equals the tree max-flow deficit on 46 rows of 6 heterogeneous CB-pattern trees, at every rank with `k ≥ 1`.
  - T2's heterogeneous fixed point is reproduced as `(3,4,5)` on one choke: deficits 11, 35, 13, 0, equal to
    `e_k − e_{k−1}`.

### SR-C3-5d — the key

**Is the name a predicate?** No, as proposed. In the run's vocabulary (T2 §2; the NM key) a "sector" is any `S^Q_{p+1}` with
`Q` independent. The name `…-POSITIVE-SECTOR-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM` therefore reads as a claim about every
sector of every tree, and that claim is false:
- **`K_{1,3}`.** With `Q` = one leaf, `F` = the leaf set and `p = 1`, the maximum deletion deficit is 4, and the tree has no
  pendant `P_3` arm anywhere.
- **Star-forest sectors without (A4).** The double star with edges 0–1, 0–2, 0–3, 1–4, 1–5 has no pendant arm. With
  `Q = {2, 3}`, `F` = the leaf set and `p = 1`, `T − N[Q] = {1, 4, 5}` is one star that satisfies (H-attach), and the
  deficit is 2.
- **The probe (`name_probe.py`).** Over trees of order ≤ 11 with **no** pendant `P_3` arm, `F` ranging over the leaf set and
  every derived `F_p`, there are 4,680 positive rows on arbitrary sectors and 148 on star-forest sectors violating (A4). There
  are **0** on star-forest sectors satisfying (A4) (asserted).

So the predicate needs both the star-forest setting and (A4), which is the condition that every `Q`-tag is witnessed inside
`Q` ("self-witnessed"). I propose `E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM`.
It asserts nothing beyond the statement: it states necessity only, in the statement's class.

**Alias check.**
- **Lexical.** Neither registry (run-local snapshot, 443 claims; authority, 434 claims) contains PENDANT-P3, SELF-WITNESS,
  STAR-FOREST, SELF-COVER or DEFICIT-REQUIRES in any key, alias or statement. No registered `alias_patterns` regex matches
  either name. The only near names, `E993-R28-PENDANT-PATH-LEAF-DOMINANCE`, `E993-R25-PENDANT-CAP-TAU-7` and
  `E993-C3-CB-ARM-EXACT-DELETE-NEIGHBORHOOD`, concern different objects (occupancy counts on pendant paths; a padding-simplex
  minimum; the Delete/Retag neighbourhood cardinality of the CB arm top tag).
- **Mathematical: the `CBstar` key.** The key gives an **exact value** on one uniform family (`CBstar(d,m,t)`, `Q = {r,v}`,
  `F = leafSet(T)`). E4 gives a **necessary shape** over every self-witnessed star-forest sector of every finite tree. Neither
  implies the other. E4 shows that the key's sector type (a pendant arm with the star forest on the chokes) is the only type
  that can be deletion-deficient. So E4 extends the key's context; it is not an alias.
- **The refuted keys.** E4 is not a transport or Hall statement: it bounds a deletion-only deficit on one source family. It
  differs from `E993-R23-LITERAL-DELETE-ONLY-HALL` (REFUTED) in object (a universal unweighted `|X| ≤ |Γ_Delete(X)|` over the
  complete r23 top side, against a necessary condition for a positive weighted deficit on one sector), in weight (cardinality
  against the active-tag weight), and in role (a proposed mechanism against a diagnostic classification). None of the other
  eleven keys of `SOLUTION-CONTRACT.md` §3.2 applies: E4 has no Delete/Retag relation, no own-support unit transport, no
  per-leaf map, no occupancy domination, no signed cross-tag map, no covariance and no pointwise addability, and it is not the
  r28 leaf-slot SDR.

## Findings and repairs

1. **E4 (B2) is correct.** I re-derived it independently. The exhaustive record: 309,106 rows of the statement's class through
   order 12, 2,001 positive, 0 outside the live case. It holds at **every** rank, with no eligibility. Repairs to its face:
   - (a) State the setting in full: finite tree; `Q` nonempty and independent; `T − N[Q]` a union of `M` stars, each with
     `t_i ≥ 1` leaves; `F` a leaf set.
   - (b) Put `v ∈ F` and `β = |F ∩ Q|` in the conclusion.
   - (c) Record that (H-attach) and `P ⊆ F` are not consumed, that `M ≥ 1` serves only to exclude `K_2` and `P_3`, and that
     (A4) enters through its `Q`-part. These are remarks; the registered hypotheses stay as reviewed, so nothing is widened
     at a second read.
   - (d) The proof needs only the `φ` identity, not G1's restriction.
2. **`P ⊆ F` (the brief's addition to the key's face).** It is needed by Proposition 1, by the claw-layer description of `R*`,
   by B4 and by C1. It is not needed by E4, and neither critic's statement of CD-1 or L1 contains it. I leave it off the key's
   STATEMENT and record it in SCOPE where it enters. Adding it would register a strictly weaker but still true statement, so the
   controller may add it without loss of truth.
3. **G1 (B3) is correct, with repairs.**
   - Its reduction consumes (A4) and star-forest witnesses off `Q`, but not `P ⊆ F` and not (H-attach).
   - Proposition 1 consumes `P ⊆ F` and `F ∖ P ⊆ Q`. T2 silently uses the latter; it follows from (A4) and `T ≠ K_2`.
   - `β` must be read as `|F ∩ Q|`.
   - "Private" means within the sector.
   - T2's unique-attachment-edge justification is struck. (H-attach) must be stated as "every edge from `S_i` to `N(Q)` meets
     `c_i`".
   - G1 holds per family: `φ(X ∩ R*) ≥ φ(X)`.
   - The brief's glosses of (H-attach) and `R*` are not the definitions (see `## Statements read`).
4. **The Corollary formula fails off `c = β = 1`.** It is reproduced as formula 96 against true deficit 0, and the T2 fixed
   point could not detect this. "Fully closed for any `|Q|`, `β`, `K`" stays struck.
5. **G3 (B4).**
   - Both algebra repairs are valid; C-T2-U's `|N[Q]| ≥ 3` is the weaker hypothesis.
   - The (LB) use is at its registered statement.
   - T2's end-to-end row is correctly replaced by the eligible `p = 10` row (reproduced).
   - Its content is empty on every tested row; at uniform `t = 2` that emptiness is a proved record (P1(i) on the `CBstar` key).
   - It stays a record and is not registered.
6. **C1 is `conditional`.** The exact undischarged lemma is stated above. It is corroborated only by bounded rows and is not
   registered.
7. **The proposed key name is not a predicate of the statement.** It is repaired by renaming, with counterexamples to the
   unqualified reading above.
8. **Incidental, not load-bearing, outside the brief.** `SEMANTIC-CONTRACT.md` §1.1 says "on trees the smallest eligible
   instances have order 13". My instrument finds eligible trees at order 11 (5 trees) and 12 (34 trees). The smallest example
   is the double star with 7 and 3 leaves: `I = (1, 11, 45, 102, 147, 141, 90, 37, 9, 1)`, `α = 9`, `x = 4`, eligible `p = 6`.
   The polynomial was cross-checked by brute force. All 39 lie in the formally closed band `n ≤ 2p + 2`, so no open-region
   statement is affected. I flag it for the controller as a possible wording correction; it is not a registration.

**Fences.**
- Every statement here concerns a sector under deletion arcs only. It is not (HALL) and not (HALL-COND) for any family outside
  the sector, and it is not a (CUT): a deletion-only deficit is never a cut.
- Nothing bears on `S(T, p)`, on the primary aggregate, or on RTree.
- C1 is not registered, and no refuted key is revived.
- My counts are `bounded_computation` records, never proof steps.

## Registration text

SR-C3-5a (G1) is registered on the face of the key below, as its reduction; it has no separate key. SR-C3-5c (B4, C1) has no
registration text: B4 is record-only and C1 is `conditional` and unregistered.

```text
KEY: E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let T be a finite tree and Q ⊆ V(T) nonempty and independent, and suppose T − N_T[Q] is a disjoint union of M ≥ 1 stars S_1, …, S_M, S_i with centre c_i and t_i ≥ 1 leaves, satisfying (H-attach): every edge between S_i and N_T(Q) is incident to c_i (equivalently every leaf of S_i is a leaf of T); let P be the set of all star leaves. Let F be a set of leaves of T satisfying (A4): every v ∈ F ∖ P has W_v := N_T(s_v) ∖ {v} ⊆ Q. Assume T ≠ K_2, P_3. For p ≥ 1 with p + 1 ≥ |Q| let S^Q_{p+1} := {B ∈ I_{p+1}(T) : Q ⊆ B}, let w_F be the literal active-tag weight (SEMANTIC-CONTRACT §1.2), N_D(X) := {B ∖ {y} : B ∈ X, y ∈ B} ⊆ I_p(T), and φ(X) := Σ_{B∈X} w_F(B) − Σ_{A∈N_D(X)} w_F(A). Put β := |F ∩ Q|, κ_q := [q ∈ F] + #{u ∈ (F ∩ Q) ∖ {q} : W_u = {q}}, K := Σ_{q∈Q} κ_q. If φ(X) > 0 for some X ⊆ S^Q_{p+1}, at any rank p, then |Q| = 2, Q = {r, v} with v ∈ F a leaf whose support s has N_T(s) = {r, v} (a pendant P_3 arm r–s–v), β = 1 and K = 2; T − N[Q] then hangs, by star centres, from vertices of N(r) ∖ {s} (the heterogeneous CB pattern). Proof of record: (i) F ∖ P ⊆ Q, since a favorable leaf v ∈ N(Q) has s_v ∈ Q, so W_v is disjoint from Q and (A4) forces W_v = ∅, i.e. T = K_2; each u ∈ F ∩ Q lies in every sector member and is active there (∅ ≠ W_u ⊆ Q), so w_F ≥ β on S^Q_{p+1}; (ii) [T2, Proposition 2] w_F(B ∖ {q}) = w_F(B) − κ_q for B ∈ S^Q_{p+1} and q ∈ Q, because star-forest tags have their witnesses outside Q and (A4) holds on the Q-tags; (iii) [T2, the φ identity] the Q-exits B ∖ {q} are injective in B, pairwise distinct across q and disjoint from the in-sector shadow ∂_sec X := {B ∖ {y} : B ∈ X, y ∈ B ∖ Q}, so φ(X) = Σ_{B∈X}[K − (|Q| − 1)·w_F(B)] − w_F(∂_sec X) ≤ (K − (|Q| − 1)β)·|X|; (iv) K = β + #{u ∈ F ∩ Q : |W_u| = 1} ≤ 2β, so K − (|Q| − 1)β ≤ 0 when |Q| ≥ 3; |Q| = 1 forces β = K = 0; |Q| = 2 with β = 0, or with β = 1 and K = 1, gives coefficient 0; |Q| = 2 with β = 2 forces T = P_3; the only remaining case is the one stated. Reduction of record [T2, Theorem G1]: for |Q| ≥ 2 and every X ⊆ S^Q_{p+1}, φ(X ∩ R*) ≥ φ(X), where R* := {B ∈ S^Q_{p+1} : (|Q| − 1)·w_F(B) < K} (members whose Q-exits do not absorb their weight); outside the stated case R* = ∅ at every rank, and in it R* = {w_F = 1}.
SCOPE: Necessity only, at every rank p (no eligibility hypothesis). The live case is not claimed deficient at any given rank; for example the CBstar key gives none at eligible ranks for t ≥ 2. F is any leaf set satisfying (A4); the charter selector F_p(T) is covered exactly when it satisfies (A4). Hypotheses consumed (SR-C3-5): (A4) through its part on tags lying in Q; T ≠ K_2 in step (i); T ≠ P_3 in step (iv); M ≥ 1 implies T ≠ K_2, P_3 in this setting and is otherwise unused; (H-attach) is carried for the setting, and P ⊆ F is not a hypothesis of this key; both are consumed only by T2's Proposition 1 (w_F(B) = β + Σ_i ℓ_i(B)·[ℓ_i(B) ≥ 2], needing P ⊆ F) and by the description of R* as the rank-(p−1) layer of the claw product C_{t_1+1} × … × C_{t_M+1}; neither is used by this key's proof. "Private" Q-exits are private only within the sector: each is also a deletion target of non-sector sources, so nothing here bears on families mixing sector and non-sector sources. T2's Corollary formula max(0, (K − (|Q| − 1)β)·[C(M,k)q^k − C(M,k−1)q^{k−1}]) is false off K − (|Q| − 1)β = β = 1 (|Q| = 3 mutual-witness core with five t = 1 stars on one choke, n = 15, k = 5: formula 96, true maximum deficit 0); in the only positive case it is the CBstar formula. Bounded record (not evidence of the statement): all trees of order ≤ 12, every nonempty independent Q in the setting, every rank: 309,106 (T, Q, F, p) rows, 2,001 positive, all live (SR-C3-5 e4_sweep). Name: proposed at the Cycle 3 synthesis as E993-R30-POSITIVE-SECTOR-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM and renamed at SR-C3-5, because the unqualified reading is false (K_{1,3}, Q = one leaf, F = leafSet, p = 1: deficit 4, no pendant P_3 arm; double star 0–1, 0–2, 0–3, 1–4, 1–5 with Q = {2, 3}, a star-forest sector violating (A4): deficit 2, no pendant P_3 arm).
ATTRIBUTION: C-T2-F (Claude Opus 5.5; CD-1) and C-T2-U (Claude Opus 5.5; L1), critic-derived jointly and concordantly; T2 (Claude Sonnet 5; Propositions 1–2, the φ identity and Theorem G1, the reduction carried here); the r30 T adjudicator (each step checked, T2-A1); the Cycle 3 synthesis (B2/B3, registration 10); isolated second read SR-C3-5 (Claude Opus 5.5; re-derivation, hypothesis accounting, exhaustive check through order 12, rename); Codex (GPT-6) for the transport mechanism, the active-tag weight and the relation; the first-interior run (Codex) for the definition layer, entries 1–18.
FENCES: A sector statement, not (HALL) and not (HALL-COND) for any X ⊄ S^Q_{p+1}; deletion arcs only, and a deletion-only deficit is never a (CUT); no eligibility content; nothing about S(T,p), E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993; not an RTree statement (E993-G1-ORDINARY-RTREE-TRANSPORT OPEN); not E993-R23-LITERAL-DELETE-ONLY-HALL and no other refuted key is revived (distinction row R30-PENDANT-P3-COLLAPSE-VS-R23-DELETE-ONLY-HALL); an extension of, not an alias of, E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT (distinction row R30-PENDANT-P3-COLLAPSE-VS-CBSTAR); the exact heterogeneous deficit (CD-2 = L2, C1) is conditional and is not part of this key; G3 as repaired (B4) is a record only.
ALIASES: E4 collapse; CD-1; L1; pendant-P3 collapse; self-witnessed star-forest sector collapse
```

```text
SCOPE NOTE ON: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: [r30 C3; SR-C3-5] E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM (proved_informal) shows that, among all star-forest sectors S^Q_{p+1} of finite trees whose tag set satisfies (A4), only this key's shape (Q = {r, v} with a pendant P_3 arm, N(s) = {r, v}, the star forest hanging from the chokes N(r) ∖ {s}) can carry a positive deletion deficit, at any rank. The live class includes heterogeneous branching and heterogeneous star sizes t_i, which this key's exact formula does not cover; their exact deficit is an unregistered conditional record. This note changes neither this key's statement, grade nor fences.
```

```text
DISTINCTION ROW: R30-PENDANT-P3-COLLAPSE-VS-CBSTAR
KEY: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: The CBstar key gives an EXACT maximum sector deletion deficit, max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1}), on one uniform family CBstar(d,m,t) with Q = {r, v} and F = leafSet(T). The new key gives a NECESSARY SHAPE over every self-witnessed star-forest sector of every finite tree: a positive deletion deficit forces Q = {r, v} with N(s) = {r, v}, β = 1, K = 2. Neither implies the other. The new key says the CBstar sector type is the only one that can be deletion-deficient (an extension of its context), and the CBstar key is the exact value on the uniform sub-family of that type. Not an alias.
```

```text
DISTINCTION ROW: R30-PENDANT-P3-COLLAPSE-VS-R23-DELETE-ONLY-HALL
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: The refuted key is a universal unweighted Hall inequality |X| ≤ |Γ_Delete(X)| for every X in the complete r23 tagged top side of every eligible ordinary tree, proposed as a transport mechanism. The new key is a necessary condition for a POSITIVE weighted (active-tag w_F) deletion deficit on one source family (a star-forest sector S^Q_{p+1}), at every rank, proposed as no mechanism. The objects, the weight and the role all differ, and the new key asserts no Hall inequality anywhere. The refuted key stays refuted at its exact scope.
```

## Verdicts

verdict[SR-C3-5a]: confirmed_with_repairs
verdict[SR-C3-5b]: confirmed_with_repairs
verdict[SR-C3-5c]: confirmed
verdict[SR-C3-5d]: confirmed_with_repairs

- **SR-C3-5a.** G1, Proposition 2 and the `φ` identity are correct at `proved_informal`. Repairs: the hypothesis placement
  (`P ⊆ F` only for Proposition 1 and the claw-layer description of `R*`), `β = |F ∩ Q|` with `F ∖ P ⊆ Q` made explicit,
  "private within the sector", the struck attachment argument, and the per-family form. It is registered as the reduction
  clause of the key above.
- **SR-C3-5b.** E4 is correct at `proved_informal` at every rank. CD-1 and L1 are the same statement, and the Corollary
  counterexample (96 against 0) is reproduced. The repairs make the face complete and record where each hypothesis enters.
- **SR-C3-5c.** B4 holds as repaired, with both repairs valid and C-T2-U's hypothesis the weaker one. The (LB) use is at its
  registered statement, and B4 stays a record. C1 is `conditional` on the stated claw-product NM lemma, which is not
  discharged here, and it is not registered.
- **SR-C3-5d.** The key is confirmed at `proved_informal` under the new name. The synthesis name is not a predicate of the
  statement (see the counterexamples). The alias check is clean; the key extends the `CBstar` key and is not an alias of it.

## Artifact inventory

Scratch directory: `scratchpad/c3-sr-SR-C3-5/` (run root). Everything ran in the foreground with `python3 -B`, the standard
library and exact integers. No `__pycache__` was created and no background job was started. Nothing was written outside that
directory and this file.

| File | SHA-256 | Purpose |
|---|---|---|
| `srlib.py` | `e40fe3b32a5807d3524256e9cf37198b9124548ab66d4a11c95c9686e0ca341f` | own instrument: tree checks, forest DP, `x` through `α`, `F_p`, `S`, literal `w_F`, (D)/(S), Dinic, star-forest setting, (A4), `κ`, `e_k` |
| `treegen.py` | `1239c4fdee0753f28005694ce250c1315ec54dfcc778111ea16737f218e27dcf` | non-isomorphic trees (counts through order 12 verified) |
| `fixed_points.py` / `fixed_points_output.json` | `d71dbe2457083bde5226b3cd71a6d17a9afe42d3b93125c60fce402501e709d5` / `fad8afdaff02ae097857b9cdf6c585239f049af78fe23f299046d173441c7c38` | `K_{1,12}/8`, path-star `(2,3,4)/7`, `CB(8,92)` |
| `e4_sweep.py` | `0f1264a2a41d04f4a95f6391006edff56494680465e197020a8a4760b4f4d859` | E4, Proposition 2 and G1, exhaustive |
| `e4_sweep_output_n8.json` | `8268b62a768a29fea623a91e43267162d34aee80064e6c460138d9333782b406` | order ≤ 8 run |
| `e4_sweep_output_n11.json` | `2498e05eed5abf0f539366c3785e1df3f294ae4be69a9051cd6b86e10a93824e` | order ≤ 11 run |
| `e4_sweep_output_n12.json` | `ab5eada37a69d909f89e43139fc5fa098c86f158bbbddfe309be4be03e299db3` | order ≤ 12 run (the counts quoted) |
| `phi_identity.py` / `phi_identity_output.json` | `6167760cfb5aa5d00018ef9507ad681e1f36ef83d90b37a1b93783ecacbfe3f2` / `24c0f7853f89c8b9587a399f5946f2af41b3d701de089248caf491352afad03b` | the `φ` identity and `φ(X ∩ R*) ≥ φ(X)` on random subfamilies |
| `prop1.py` / `prop1_output.json` | `ff078f73e4f0518a8ae5dbeab2e86186d59d7645907942f3d14de37965188e25` / `b2eed0617101180d9c062df13892487a08bc4528f387617b5267cefa6976d32f` | Proposition 1 with and without `P ⊆ F`; `F ∖ P ⊆ Q` |
| `instances.py` / `instances_output.json` | `a91340778478512cd2b02004fbede1a5d252d8385c971514b6153a8e9a3b70b6` / `d151b3eac277d44cd182a6a91fa861bfb5cbe1e8dbdba38e7ed934f998f9906e` | the 96-against-0 counterexample; T2's `|Q| = 3` point; `(3,4,5)`; T2's G3 tree at `p = 10` with WID |
| `c1_g3.py` / `c1_g3_output.json` | `ef4ed2b2f9ab3f93b16915e4da893d07454d11edf46854b93c5690eee2250ca9` / `eb747234bbccfa28609a912c8e2ab2278cb85d69ef9b3795f2e3366b829c0fc5` | G3 algebra (both repairs; T2's form refuted), 16 eligible G3 rows with WID, the vacuity scan (130 rows), C1 corroboration (24 NM layers, 46 tree rows) |
| `name_probe.py` / `name_probe_output.json` | `3efee1f58f337b245c9f377dd5d53d612004d2bb1872228139e037cbb7d3eb0a` / `0a6b4fcf73221af006184c3ced0a4f4540ec2e92a8ca178abb6b54cb9dd0534e` | the name-scope probe on pendant-arm-free trees |
| `eligibility_note.py` / `eligibility_note_output.json` | `8c728dbc1b426a1a44f9fc053c881096e8f762eb060be84a475c41d35931cfbb` / `6ba20e41b7c0016223101f492c41280719e52f198b026caf9faafd9b9852a261` | incidental note: eligible trees of order 11–12 |

**Replay.** Run from `scratchpad/c3-sr-SR-C3-5/`, in the foreground:

```sh
python3 -B fixed_points.py
python3 -B e4_sweep.py 12      # about 4 minutes; 8 and 11 give the smaller runs
python3 -B phi_identity.py
python3 -B prop1.py
python3 -B instances.py
python3 -B c1_g3.py            # imports instances.cb_pattern only
python3 -B name_probe.py 11
python3 -B eligibility_note.py
```

Every script asserts its claims and halts on any failure. Each writes its JSON deterministically, with fixed seeds and no
wall-clock or host fields.

Deliverable: `second-reads/SR-C3-5/SECOND-READ.md` (this file). Reread before close: done.
