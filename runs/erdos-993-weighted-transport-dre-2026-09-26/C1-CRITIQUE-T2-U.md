# Critique

Critic `C-T2-U` (orientation U, formal/structural), r30 Cycle 1 Stage 4. The return under review is seat `T2`, route
`C1-T-02 DEFICIT-BUDGET-AND-ROOTED-RECURRENCE` (orientation T), `cycles/cycle-1/stage3/returns/T2/RETURN.md`.

Boot acknowledgment: I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file outside this run root. The run files I
loaded were the dispatch `control/dispatch/c1-stage4/DISPATCH-C-T2-U.md`, the capsule members, and the frozen registry
`sources/authority/CLAIM-IDENTITY.json`, which sits under `sources/` and is authorized.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

Attribution: the mechanism, the incidence identity (DCB), the lower-region run and its corrections are Codex's (GPT-6
Astra/Sol/Luna). The high-tail certificates are r29's. The derivations reviewed here are T2's (Claude Sonnet 5). The re-derivations and
findings marked **[C-T2-U]** are this critic's.

## Identity and seal audit

- **Capsule seal**: `control/c1-critic-capsules/T2-PACKET-MANIFEST.json`. I recomputed SHA-256 over compact key-sorted JSON
  with `seal_sha256` removed and no trailing newline, and got `b62d393d363e5e486bcd0d37dd3cebc7d7044c8ae556b59409b7aa6a785dcbd3`.
  This equals the dispatched value. All 14 members match their listed sha256 and bytes.
- **Stage 4 dispatch seal**: `f62b5c6a639104c155f2acebb4b40b5f6379134f490c90edc1601a0b764ac2cc`, recomputed equal. 13/13 members match.
- **Stage 3 seal**: `da784de8567703935e95ea3e452acc151fdbc15a7e20ffd86634ecb87e4f92ac`, recomputed equal. 36/36 members match. The
  T2 return's digest is `f6a0dec8…5953215`, which matches the capsule.
- **Stage 2 seal**: `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92`, recomputed equal. 1006/1006 members match.
- **Return-listed digests**: I recomputed the twenty `sources/lower-region/…` files the return lists. All 20 equal both
  `control/SOURCE-DIGESTS.json` and the Stage 2 manifest. `control/controller-prerun/wt_check.py` =
  `0ffaa4c8…33f5a`, as stated. The seat's scripts `t2_instrument.py` = `877fdbf2…c3d` and `t2_run.py` = `763939bd…2e2d`
  equal the return's table. So does `out.json` = `b6e69862…a1ab`.
- **Replay**: I copied the three files out to `scratchpad/c1-crit-T2-U/replay/` and ran `python3 -B t2_run.py` in the foreground
  (~92 s). The new `out.json` is **byte-identical** to the original: sha256 `b6e69862…a1ab`, and `cmp` reports no difference.
- **Registry**: `sources/authority/CLAIM-IDENTITY.json` has sha256 `eba20be3…9c84`, equal to SOURCE-DIGESTS. It has 434 claims.
- **T2's disclosure**: T2 ran one non-recursive `ls` of `scratchpad/`. I confirmed that T2's scripts perform **no file I/O at all**:
  no `open`, no path strings, and the only imports are stdlib plus the sibling module. Nothing from `c1-U1` enters the return.
  No penalty applies.
- **Uninventoried residue**: `scratchpad/c1-T2/` also holds `err.log` (the stderr wall-clock line) and `__pycache__/` (two `.pyc`
  files, one timestamped 12:41, after the return's run). Neither is load-bearing. The return's sentence "script and output
  in `scratchpad/c1-T2/`" about its source-digest check is **unbacked**: no digest script or output is in that directory. My own
  recomputation above backs the digest facts.
- **My read-boundary disclosures**:
  1. `seal_check.py` hashed the bytes of every Stage 3 manifest member to verify that seal (duty 1). Those members include the
     five other returns and the Stage 3 dispatches. They were hashed only. No content was printed or read.
  2. `ls -la cycles/cycle-1/stage4/critics/T2/` showed the paired critic's directory name `F`. That was a single non-recursive
     listing to create my own output directory. No content was read.
  3. I made non-recursive listings of `sources/`, `sources/authority/`, `scratchpad/c1-T2/` and its `__pycache__/`, all within my
     grant or the inventoried directory.
  4. `grep` ran only on my own copies of T2's scripts.
- **Process**: no network, no installs, no Lean. There were no background jobs, since every computation ran in the foreground.
  Nothing needs killing.

## Independent re-derivation

**Instrument [C-T2-U]**: `scratchpad/c1-crit-T2-U/own/crit_inst.py`, `census.py`, `families.py`, `allleaves.py`, `selector.py`
and `famdefs.py`. They use only the stdlib and exact integers, and I wrote them from the semantic contract. They share no code
with T2. The differences from T2's instrument:
- **Tree generation**: T2 attaches pendants and dedupes. I use Beyer–Hedetniemi rooted level sequences deduplicated by a
  centre-rooted, hash-consed AHU canonical form, with bicentral trees encoded as the sorted pair of edge halves.
- **Tree test**: BFS connectivity, union-find acyclicity and the edge count `n − 1`, all separate.
- **Descent `x`**: computed through rank `α`.
- **Selector**: `F_p` comes from `Δ_p(T − v)` on the original tree.
- **Weight**: `w_F` is literal, using `W_v = N(s_v) ∖ {v}`.
- **Aggregate**: `S` comes straight from `C5LA1.aggregate` (`Δ_{p−1}` of `T − {v, s_v}` minus that of `T − N[s_v]`).
- **Fidelity assert**: `S = Q_p − Q_{p−1}` is asserted on every row.

On every row with `n ≤ 15` I enumerated `I_{p+1}` and `I_p` by brute force and **asserted** `supply − capacity = S`.

**Fixed points reproduced by my instrument** (all exact):

| instance | result |
|---|---|
| `K_{1,12}`, `p = 8` | `n = 13`, `α = 12`, `x = 6`, 12 favorable, supply 1980, capacity 3960, `S = −1980`, 1980 arcs, flow 1980 |
| path-star (2,3,4), `p = 7` | `α = 11`, `x = 5`, 10 favorable, 1483 / 2701, `S = −1218`, **2025 arcs**, flow 1483 |
| path-star (2,2,4,3), `p = 8` | `α = 13`, `x = 6`, 12 favorable, 8033 / 13467, `S = −5434` |
| `CB(1,7)`, `p = 10` | `n = 24`, `α = 15`, `x = 8`, `\|F\| = 8`, `Q_p = 29190`, `Q_{p−1} = 58002`, `S = −28812` (the controller's cross-check values) |
| `T_22`, `p = 34` | `n = 91`, `α = 68`, `x = 32`, 67 favorable, `S = −498754180547001418536`, `Q_{p−1} = 7032072523191088241946`, `Q_p = 6533318342644086823410` |
| free-tree counts, orders 1–17 | match A000055 |

**R30-E-a, the order-11 double broom [confirmed]**: the tree is `0–1`, `0–{2..7}`, `1–{8,9,10}`, with `α = 9`, `x = 4`, only `p = 6`
eligible, and `|F| = 9`.
- By brute force, supply is 255, capacity 516, and `S = −261`.
- My **independently enumerated** DCB quantities are `D = 1602` and `C = 219`. They were computed from the per-set deficits, not
  as a residual.
- The mixed-relation max-flow is 255, which saturates, over 277 arcs.
- No tree of order ≤ 10 has an eligible `p`.
- Eligible rows by order: 11: 5, 12: 34, 13: 163, 14: 313, 15: 528, 16: 2763, and **17: 10061** (new). The total through 15 is
  1043, equal to T2's count.

**Step 5, the hierarchy, re-derived [C-T2-U]**. Write `h_j := i_j(H_v)` and `r_j := i_j(R_v)`, so that `q_v(j) = h_j − r_j`.
- The summand of `S` is `Δ_{p−1}(H_v) − Δ_{p−1}(R_v) = q_v(p) − q_v(p−1)`. Hence `S = Q_p − Q_{p−1}` **by definition**, where
  `Q_j := Σ_{v∈F} q_v(j)`. It needs no C6-U6 input, but it needs **the same `F = F_p(T)` in both sums**. If `Q_{p−1}` were summed
  over `F_{p−1}`, the equality with `C5LA1.aggregate` would fail. T2's code uses one `F` for both, which I confirmed.
- I also re-derived the per-set double count: Σ over marked `A` of `e_v(A) = k·q_v(k+1) + C_v`. A marked `(k+1)`-set with exactly
  one mark has `k` marked lower covers; one with at least two marks has `k + 1`.
- **Proof that `h = α − 1` for every original leaf [C-T2-U]**. Take a maximum independent set `I`. If `v ∉ I`, then `s_v ∈ I`,
  since otherwise `I + v` would be independent. So `I − s_v + v` is maximum and contains `v`. Then `I ∖ {v} ⊆ V ∖ N[v] = V(H_v)`,
  giving `α(H_v) ≥ α − 1`. Conversely, `J ∪ {v}` is independent for every independent `J` of `H_v`, since `N(v) = {s_v}`. My
  instrument asserts `α(H_v) = α − 1` for every leaf of every row.
- With `D := Σ_v Σ_A (2(α−1−k) − e_v(A))`, this gives the exact identity **`D + C − (2α+1−3p)·Q_{p−1} = −(p−1)·S`**. Because
  `k = p − 1 ≥ x + 1 ≥ 1`, the three equivalences (budget) ⟺ (`Q_p ≤ Q_{p−1}`) ⟺ (`S ≤ 0`) hold.
- **`D ≥ 0`, the half of DCB that T2 never derived [C-T2-U]**: `V(H_v) ∖ N[A]` induces a bipartite `H'` with
  `α(H') ≤ α(H_v) − k`, since `A` plus any independent set of `H'` is independent. The larger colour class is independent, so
  `e_v(A) = |V(H')| ≤ 2α(H') ≤ 2(h − k)`.
- I checked `d_v(A) ≥ 0` per set, the double count and the identity by **direct enumeration**. This covered all 515 eligible rows
  with `n ≤ 14`, plus `K_{1,12}` and the double broom. Every assertion passed, and the least per-set deficit is 1.

**C_v inclusion–exclusion.** For all `m`: Σ_{s=0}^m (−1)^s(s−1)C(m,s) = Σ(−1)^s s C(m,s) − Σ(−1)^s C(m,s) = −[m=1] − [m=0]. The
`s = 0` term is −1 and the `s = 1` term is 0, so Σ_{s=2}^m (−1)^s(s−1)C(m,s) = [m ≥ 2]. I also checked this exactly for m < 200.
- The formula `#{A ⊇ X} = i_{rank−|X|}(H_v ∖ N[X])` needs `X ⊆ W_v` to be independent. That holds in a tree: the vertices of
  `W_v` are neighbours of one vertex, with no triangles, and they lie in distinct components of `H_v`.

**Step 4, the `deg(s_v) = 2` collapse.** `H_v` is the single component containing `w` and `R_v = H_v − w`. From
`I(H_v) = I(H_v − w) + z·I(H_v − N[w])` it follows that `q_v(j) = i_{j−1}(H_v ∖ N[w])` and `C_v = 0`.
- I read the registered statement of `E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION` (VERIFIED). It defines
  `A = T − {v,s}`, `H = A − g`, `U = A − N_A[g]` and `I(A) = I(H) + z·I(U)`, and states
  `b_v − B_s = Δ_{p−1}(A) − Δ_{p−1}(H) = Δ_{p−2}(U)`.
- Under `A = H_v`, `H = R_v`, `U = H_v ∖ N[w]`, T2's collapse is that identity's coefficient extraction, and its per-leaf summand
  is exactly `Δ_{p−2}(U)`. **The alias is genuine**, and T2 correctly registers nothing new.

## Attacks and findings

1. **The "incidence identity confirmed on 1,060 instances" is a tautology in code (major; certification).**
   - In `t2_instrument.leaf_budget_row`, `D_v` is **defined** as the residual `2(h_v−k)·q_v(k) − (k·q_v(k+1) + C_v)`. The per-set
     addability `e_v(A)` is never enumerated.
   - `incidence_identity_holds` therefore reduces algebraically to `Σ_v 2(h_v − α + 1)·q_v(k) = 0` together with `S = U − Q`. The
     first holds because `h_v = α − 1` (a theorem, proved above), and the second is definitional.
   - `budget_holds_D+C>=coeffQ` is algebraically `S ≤ 0`, so its 1,060 "budget holds" rows are the 1,060 `S ≤ 0` rows counted twice.
   - The DCB content, namely the double count Σ_A e_v(A) = kq(k+1) + C and `D ≥ 0`, was **never tested** by T2.
   - The return's "(DCB) … reconfirmed numerically" and "Confirmed (`incidence_identity_holds`) on … 1,060 fresh instances" are
     struck as evidence for DCB. My enumeration above supplies the missing test on 517 rows.
   - This is not a fidelity failure of `w_F`, the relation, `F` or `x`. Those are all correct in T2's code.
2. **WID coverage is overstated (certification).** `wid_direct_check` runs only when `n ≤ 16/18`.
   - It covers the 1043 census rows, the 3 fixed points and `T_3` (`p = 7`), which is **1,047** instances, not "1,060+".
   - The 12 `T_m` rows with `m ≥ 4` and `T_22` were never direct-checked.
   - `T_22`'s "supply" and "capacity" columns are `U = Σ q_v(p)` and `Q = Σ q_v(p−1)` read through (WID), not direct weight
     sums. They are correct (I reproduce them), but the column label overstates the method.
   - The code records `identity_holds` but does not **assert** it before other output, as SOLUTION-CONTRACT §3.3 requires. The
     outcome is harmless, since every value is true.
3. **Self-check literals (certification).**
   - "every tree on 6 vertices (625 labelled trees via Prüfer sequences)": the code iterates `product(range(5), repeat=4)`, which
     is the 625 sequences over labels 0–4. A 6-vertex labelled tree has 6⁴ = 1296 Prüfer sequences. Struck; the correct wording
     is "625 of the 1296 labelled 6-vertex trees".
   - The docstring says "Cayley 5^3 = 125" but runs 64. The return does say 64, which is accurate.
4. **Step 4 literal**: "(this includes every marked-arm and every claw-leaf tag of the `T_m` family …)". Claw-leaf supports have
   degree 4 (three leaves plus the root), so claw-leaf tags do **not** exercise the degree-2 collapse. Only the marked-arm tag and
   the path-star arm do. Struck.
5. **Step 5, "(HALL) … strictly stronger in general".** Nothing in the return exhibits an eligible `(T, p)` where `S ≤ 0` holds but
   (HALL-COND) fails for some `X`.
   - "Not known to be equivalent" is backed. "Strictly stronger" is not, and is struck.
   - My mixed (D)∪(S) exact max-flow saturates on all 515 eligible rows with `n ≤ 14`. That is `bounded_computation`, and no
     separation was found.
   - The direction of the implications is right: an instance satisfying (HALL-COND) at `X = I_{p+1}` implies `S ≤ 0`, via WID
     and FLOW⇒SIGN.
   - It is not circular, because the hierarchy never assumes `S ≤ 0`.
6. **Hierarchy extension [C-T2-U, STATED; elementary; `proved_informal` at statement level, second read required].**
   - The return's alias paragraph calls the three OPEN addability keys "progressively weaker sufficient premises" without the
     implications. Put `E := Σ_F Σ_A e_v(A) = kU + C`, where `U = Q_p` and `Q = Q_{p−1}`.
   - (i) `E993-LOWER-REGION-CURRENT-RANK-ADDABILITY-BUDGET` (`E ≤ (p−1)Q`) **⟺ `kS ≤ −C`**. It is exactly the aggregate strengthened
     by `C/k`, and it implies `S ≤ 0`.
   - (ii) FLAT (`E ≤ (x+1)Q`) ⇒ CURRENT-RANK, because `x + 1 ≤ p − 1` by eligibility.
   - (iii) `CT_x` (`i_x·E ≤ (x+1)·i_{x+1}·Q`) ⇒ FLAT, because `0 ≤ i_{x+1} < i_x` by the definition of `x`, and `E, Q ≥ 0`.
   - So **CT_x ⇒ FLAT ⇒ CURRENT-RANK ⇒ (budget ⟺ `Q_p ≤ Q_{p−1}` ⟺ `S ≤ 0`)**, so all three keys imply T2's target. I have not
     established that any of these implications is strict.
   - On the 515 enumerated rows, CURRENT-RANK holds with `−kS/C ≥ 4.5` (bounded).
   - No new key is proposed. If the synthesis registers this, it is a relation among existing keys and must be alias-checked
     against them.
7. **The "`Q_j` monotonicity/log-concavity lead" (T2's most valuable observation), attacked [C-T2-U].**
   - Of its three points, `Q_k ≥ Q_{k+1}` **is** the primary aggregate. Only `Q_{k−1} ≥ Q_k` and `Q_k² ≥ Q_{k−1}Q_{k+1}` add anything.
     Local log-concavity plus `Q_{k−1} ≥ Q_k` does imply `Q_k ≥ Q_{k+1}`, but that moves the same-type problem down one rank.
   - **No failure found at the brief's scope**: the orders 16–17 census (2,763 + 10,061 rows); `CB(1,7)`; `CB(d, m)` for `d ≤ 3`
     and `n ≤ 200`; double brooms `(a, b, gap)` with `a < 30` and `gap ≤ 3`; caterpillars with spine ≤ 5 and legs ≤ 6; and `T_m`
     for `m ≤ 40`. That is 13,867 census rows plus 27,826 family rows. The family rows include **17 rows with a positive per-leaf
     term** (`T_22` at `p = 34` through `T_40`). I found zero failures of the three-point monotonicity and zero failures of
     log-concavity at `k`.
   - **Sharpened bounded lead**: on every one of those rows, `j ↦ Q_j` (fixed `F = F_p`) is log-concave at **every** rank
     `1 ≤ j < α` and unimodal, with **mode ∈ {x − 1, x}**. Hence it is nonincreasing for all `j ≥ x`. Call this "tail monotonicity
     from `x`" (TMX). It is `bounded_computation`, STATED and not registered.
   - **The selector never binds on any tested row [C-T2-U, bounded]**: `F_p(T)` equals the full leaf set on all 13,867 census rows
     through order 17 and on all 27,824 named-family rows. So every census here, T2's included, **never exercises the fixed-selector
     rule**.
   - For a fixed tree, TMX is then the primary aggregate at every eligible `p` at once, plus the single non-eligible inequality
     `Q_{x+1} ≤ Q_x`. The `Q_j` lead is **not an independent handle**. It is the aggregate family indexed by rank, with
     log-concavity as its only extra structure.
   - Observation (elementary): a leaf `v ∉ F_p` at an eligible `p` means `Δ_p(T − v) ≥ 0` with `p ≥ x(T) + 2`. That forces either
     the forest `T − v` to be non-unimodal past its first descent, or `x(T − v) > p`.
8. **Remaining-obligation item 2 (induction through the collapse) fails as stated, with an explicit witness [C-T2-U, proved].**
   - For the marked-arm tag of `T_22`, `g` is the root and `U = H_v ∖ N[g]` consists of the 66 claw leaves, isolated. So
     `q_v(j) = C(66, j−1)` exactly.
   - That sequence increases through `j = 34 = p`, and the per-leaf term is `C(66,33) − C(66,32) = +212336130412243110`. This
     equals T2's figure, and I recomputed it.
   - The smaller forest `U` here is perfectly unimodal, yet its mode `j − 1 = 33` lies above `p − 2 = 32`.
   - Therefore **no tag-by-tag argument through the degree-2 collapse can give `Q_p ≤ Q_{p−1}`**, even granting unimodality of every
     smaller forest. Any induction must carry cross-tag compensation, which is exactly the role (HALL) or the budget plays.
9. **Fidelity (duty 2) — PASS.**
   - The weight counts active tags only: `active_weight` tests `(B ∖ {v}) ∩ W_v`.
   - `F` is fixed at `p` from `Δ_p(T − v)` on the original tree.
   - `x` is computed through `α`, including the terminal difference.
   - `S` is computed literally from the H/R definition.
   - T2 builds no relation (it runs no flow), so (D)∪(S) is not in play for its numbers.
   - The one fidelity-adjacent gap is the missing assert (finding 2).
10. **Fences.** T2 re-runs `T_m` for `m ≤ 8` and `T_22` only as instrument self-checks, labelled as not re-proving
    `E993-ORDINARY-TM-LOWER-REGION-AGGREGATE`. That is acceptable. There is no RTree wording, no census value in a proof, and the
    controller's prior is not used as evidence.

## Mechanism-equivalence and fence check

- **No mechanism is proposed.** T2's object is the scalar budget, which is logically the primary aggregate itself (finding 6).
  None of the ten refuted keys and not the C6-F4 own-support rule is revived.
  - Those keys are per-leaf injectivity, per-leaf domination, per-leaf covariance, and relation-level rules: deletion-only
    Hall, Delete/Retag, and unit capacity.
  - T2 asserts no per-leaf inequality, and finding 8 reconfirms per-tag failure.
- **No closed region is re-proved as a contribution.** The high tail, the order bands and the `T_m`/spider/path-star family theorems
  are untouched. The `T_m` rows are labelled self-checks.
- **Imported results are used at their grades.**
  - (DCB) is used only for the identity, never for the budget. T2 correctly says `D, C ≥ 0` do not give it.
  - (LIFT) is not used.
  - (WID) is used at `proved_informal` (contract proof) for the `T_22` columns, and noted.
- **Claim identity (keys touched)**:

| key | status | how it is touched |
|---|---|---|
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | OPEN | unchanged |
| `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | OPEN | equivalent to T2's target, per instance |
| `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` | OPEN | bounded rechecks only |
| `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY` | VERIFIED `proved_informal` | re-derived fully by this critic, including `D ≥ 0` |
| `E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION` | VERIFIED | genuine alias |
| `E993-LOWER-REGION-{EARLY-MARKED-OCCUPANCY-TRANSFER, FLAT-ADDABILITY-BUDGET, CURRENT-RANK-ADDABILITY-BUDGET}` | OPEN | none claimed; chain of implications in finding 6 |
| `E993-ORDINARY-TM-LOWER-REGION-AGGREGATE` | VERIFIED `computer_assisted` | used as a self-check only |

  No `E993-R30-…` candidate is minted by T2 or by me. The critic-derived statements in findings 6 and 8 are STATED and need an
  isolated second read before any registration.

## Certification audit

**Struck (unbacked, or backed by a tautological check):**
- "(DCB) … reconfirmed numerically" and "`incidence_identity_holds` on … 1,060 fresh instances" as DCB evidence (finding 1). The
  code's residual `D_v` makes the check vacuous apart from `h_v = α − 1`.
- "`budget_holds_D+C>=coeffQ`" as a separate datum. It is identically `S ≤ 0`.
- "WID checked by direct definition on 1,060+ fresh instances" → **1,047** (finding 2).
- "every tree on 6 vertices (625 …)" → 625 of 1296 (finding 3).
- "every … claw-leaf tag of the `T_m` family" exercising the degree-2 collapse (finding 4).
- "(HALL) … strictly stronger in general" → "not known to be equivalent" (finding 5).
- "script and output in `scratchpad/c1-T2/`" for the source-digest check. No such artifact exists. The twenty digest facts are
  independently backed by this critic.

**Backed (by my replay or my instrument):**
- The Stage 2 seal.
- The script and `out.json` digests, with a byte-identical replay.
- A000055 through 18 (T2) and through 17 (mine).
- 1,043 eligible rows through order 15.
- The smallest eligible order is 11. For the order-11 double broom: `α = 9`, `x = 4`, `p = 6`, `|F| = 9`, `S = −261`, `Q = 516`,
  `U = 255`, `D = 1602`, `C = 219`, `|I_7| = 37` and `|I_6| = 90` (these two are T2's; not independently counted).
- Every fixed-point row of T2's table, including the `T_22` `S`, `Q` and `U`.
- The `T_22` per-leaf term `+212336130412243110`.
- The deg-2 collapse and `C_v = 0`.
- The `C_v` formula.
- The three-point `Q` probe, with zero failures on 1,060.
- 13 `T_m` rows for `m ≤ 8`.

**Not re-derived here:** the `T_22` `D` and `C` values, and T2's "zero positive per-leaf term rows to order 15". Neither is load-bearing.

**Grades**:
- The hierarchy (Step 5) is correct and complete at `proved_informal`. It is elementary and one part is definitional, so it
  carries no independent mathematical weight.
- The deg-2 collapse is `proved_informal` and an alias; nothing is new.
- The order-11 correction is an exact finite witness (`bounded_computation`) and is confirmed.
- The `Q_j` lead is `bounded_computation`, and T2 correctly does not register it.
- The route verdict `bounded_evidence` is appropriate.

## Verdict

verdict: retained_narrowed
headline_resolved: no

T2's mathematics is correct where it is stated, and its fidelity passes. The narrowing strikes:
- the DCB and budget "confirmations", which are code tautologies;
- the WID count (1,047, not 1,060+);
- two self-check literals;
- "strictly stronger".

The order-11 correction R30-E-a stands, now independently confirmed. The hierarchy stands at `proved_informal`. It carries no
independent mathematical weight: part is definitional, and the rest is algebra once the DCB double count and `h = α − 1` hold.

Critic-derived advances, all attributed to C-T2-U:
- the full DCB re-derivation including `D ≥ 0` and `α(H_v) = α − 1`;
- the implication chain CT_x ⇒ FLAT ⇒ CURRENT-RANK ⇒ budget, with CURRENT-RANK ⟺ `kS ≤ −C`;
- an explicit proof that the deg-2 induction cannot work tag by tag (`T_22`: `q_v(j) = C(66, j−1)`);
- the bounded TMX lead: mode of `Q` in {x−1, x}, and `Q` log-concave on every rank, over 41,693 rows;
- the bounded finding that `F_p` equals the full leaf set on every tested eligible row, so no census exercises the selector.

None of these is a grade change for any key. The primary aggregate and (HALL) remain OPEN.

Model disclosure line: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

1. **The target is unchanged.** `D + C ≥ (2α+1−3p)·Q_{p−1}` is, per instance, **exactly** the primary aggregate `S(T, p) ≤ 0` (via
   `D + C − (2α+1−3p)Q = −kS`). It remains OPEN for arbitrary eligible trees. Proving it yields the primary aggregate at its own
   key, not (HALL).
2. **A successor's scalar route must be cross-tag.** Per-tag monotonicity fails: the `T_22` arm has `q_v(j) = C(66, j−1)`. Any
   induction through the degree-2 collapse must bound the SUM over tags.
3. **The sharpest open bounded lead is TMX.** For eligible `(T, p)`, the claim is that `Q_{j+1} ≤ Q_j` for all `j ≥ x(T)`, with `Q`
   log-concave. There are zero failures on 41,693 rows, but it is unproved. It contains the aggregate at every eligible rank, so a
   proof is outcome A′ (aggregate), not (HALL).
4. **Selector coverage.** No tested eligible row has a non-favorable leaf. An instrument that wants to test the fixed-selector
   rule must first find eligible `(T, p)` with `F_p ≠ L(T)`, or prove that none exist, which would bear on #993-type unimodality
   of `T − v`.
5. **Separation of (HALL) from `S ≤ 0`** on a single instance is unexhibited. That is F1's outcome-C territory.
6. **Registration housekeeping.** The contract prose "smallest eligible order 13" should be reconciled to 11 by record, since it
   is erratum R30-E-a. Findings 6 and 8 need an isolated second read before any registration.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-crit-T2-U/`. All
runs were foreground; there were no background jobs.

| file | sha256 |
|---|---|
| `seal_check.py` (capsule, Stage 4, Stage 3 and Stage 2 seals plus members) | `f7fc11d73d6726678500c23d692e1d7b70ecb4588971711c3abe1d033113479f` |
| `replay/t2_instrument.py` (copy) | `877fdbf24d691b1b407762cef1298e392a07c5dfdfecc8daf7cd7df83b7e2c3d` |
| `replay/t2_run.py` (copy) | `763939bdb47f1069d0316d3bc9761b7774dd55ab77e22a070750bee7401f2e2d` |
| `replay/out.orig.json` (copy) and `replay/out.json` (my replay, byte-identical) | `b6e6986250546bd42e335c4bfbbbcc7c91231b2250879b5b4342242fc555a1ab` |
| `own/crit_inst.py` (critic instrument) | `d2209809bb8a9f42a8b835ca2739ef1dd684ac299baa64ac37577d78bba9e244` |
| `own/census.py` (orders 1–17; WID ≤ 15, DCB ≤ 14, mixed flow ≤ 14; `python3 -B census.py 17 15 14 14`) | `eebb069fd58749cb1ccdd2eaee3a3dc04d2a1b6fca5f03324d9614cbc2f90076` |
| `own/c17.json` (its output) | `b6e587e9272f36f45980295e2bfcae3ce61706dd4723abeb97a012c10960ebc5` |
| `own/families.py` (fixed points, `CB`, `T_m` for m ≤ 40, double brooms, caterpillars) | `527fb117ff15c0ea0be727319541b735f61ba8427215197b731e8ecac55c2e7e` |
| `own/fam.json` (its output) | `253cdf39e0b5969b556f3e06957e1b61027e0efec57546c203b819e47f66689a` |
| `own/allleaves.py` (all-leaf `Q` probe, orders 11–16) | `c9a6c01ba13185099dff9d7c3340a0784d47d10909e03b61d6ee8826ee482340` |
| `own/allleaves.json` (its output) | `365716398053eb51381398f3fe588e718f9de2dc7474c95ae2026f3ee9639f97` |
| `own/famdefs.py` (family builders, extracted from `families.py`) | `e9de4aab5af8244c67e0f75b9a88076c5118f7f73e85484a275d9539a9063801` |
| `own/selector.py` (selector-coverage probe over the named families) | `fec05d5f795f9f23646b4f45c6fd7356912a8245dece91f3bba715912be02b9d` |
| `own/selector.json` (its output: 27,824 rows, 0 with a non-favorable leaf) | `f08064c34bf21574731d2d393b1e5cd2d8e37ab36991c47416f4a7cd842182d9` |

Replay: `cd` into `own/`, then run `python3 -B census.py 17 15 14 14 > c17.json` (~50 s), `python3 -B families.py > fam.json`
(~10 min), `python3 -B allleaves.py > allleaves.json` and `python3 -B selector.py > selector.json` (~3.5 min). Every script asserts
the tree test, `S = Q_p − Q_{p−1}` and `α(H_v) = α − 1`. It asserts `supply − capacity = S` wherever WID is enumerated, and the
DCB double count and identity wherever DCB is enumerated.
