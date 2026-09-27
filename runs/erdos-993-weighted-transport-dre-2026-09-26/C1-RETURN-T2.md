# RETURN — Route `C1-T-02 DEFICIT-BUDGET-AND-ROOTED-RECURRENCE`, seat T2, r30 Cycle 1

Orientation: **T (prove)**. Object: the OPEN mechanism key **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` and the
prerequisite identity **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`, via T2's assigned load-bearing obligation
(`control/C1-ALLOCATION.md` §2, item 2): the parallel scalar route through the budget `D + C ≥ (2α+1−3p)Q`, rooted
recurrences for `w_F`-weighted layer sums, and alternative direct compensation inequalities.

## Boot acknowledgment

VerityOS booted for this route by reading EXACTLY the two files the dispatch and the worker common brief authorize, and no
other VerityOS file: `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`.
The startup protocol's own task-type map, memory, conversations, modules, skills, logs and decisions directories were
**not** loaded (the controller has booted for the run); this return does not read or cite them.

## Stage 2 seal and source digests

Recomputed SHA-256 of the canonical JSON of `control/C1-STAGE2-PACKET-MANIFEST.json` with its `seal_sha256` field removed
(`sort_keys=True`, separators `(",",":")`, no trailing newline):

```
886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92
```

This equals the manifest's own `seal_sha256` field. **Seal verified.**

Every source file this return relies on was digest-checked against `control/SOURCE-DIGESTS.json` (exact `sha256` field
match, recomputed by this seat, not assumed) before it was read:
`sources/lower-region/cycle-6/C6-T4/{REPORT.md,RETURN.json,replay_t22.py,evidence_t22.json}`,
`sources/lower-region/cycle-6/C6-U6/{REPORT.md,RETURN.json,transport_census.py,transport_census.json,t_family_transport.py,t_family_transport.json}`,
`sources/lower-region/cycle-6/C6-AT/{REPORT.md,T3-REPLAY.json,t3_factor_replay.py}`,
`sources/lower-region/records/{NEUTRAL-HANDOFF.md,FINAL-ANALYSIS.md,RESEARCH-NOTEPAD.md,C5-INCIDENCE-IDENTITY-RECONCILIATION.md,C3-INTAKE-RECONCILIATION.md,SOLUTION-CONTRACT.md}`,
`sources/lower-region/inputs/ordinary_tree_checked.py`. All twenty matched exactly (script and output in
`scratchpad/c1-T2/`, see IMPORT LIST/replay below). `control/controller-prerun/wt_check.py` (SHA-256
`0ffaa4c8af6c7eb97a2a0f61e9743bafd7fa8b32ea38e0b268f987144eb33f5a`, matching its Stage-2 manifest entry) was also read — it
is explicitly authorized by the common brief ("`control/controller-prerun/` … a prior, never evidence"); nothing from it is
cited as evidence below, only as context for one disclosure (see "Fixed-point reproduction note").

## IMPORT LIST (standard library only, both scripts)

`t2_instrument.py`: `hashlib`, `json`, `sys`, `itertools.combinations`, `itertools.product`, `typing.*`.
`t2_run.py`: `json`, `sys`, `time`, `itertools.product`, plus the sibling module `t2_instrument`. No network, no
`pip`/`brew`/`elan`. Exact Python integers throughout (unbounded precision); no floats anywhere in the numeric claims.

## Registered claims this route touches (named before any census, per requirement 3)

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — OPEN. Not resolved by this route (no flow constructed, no
  deficient cut found).
- **Primary aggregate** `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (and its r23 alias
  `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`) — OPEN. Every instance this route computed satisfies `S ≤ 0`, but this is
  bounded computation, not a proof; the target's status is unchanged by this route.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — OPEN (the Lean target is U2's, not this route's). This route
  re-verifies the identity **by direct brute-force enumeration of `I_{p+1}(T)`/`I_p(T)`** (the definitional check, not the
  `q_v` bijection shortcut) on every instance small enough to enumerate — touched/reconfirmed at `bounded_computation`
  grade only; its registry status is not changed by this route.
- **(DCB)** `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY` — VERIFIED `proved_informal`. Re-derived from the
  definitions below (not cited) and reconfirmed numerically; touched, not newly registered.
- **`E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION`** — VERIFIED (`independently_adjudicated_informal_proof`).
  Touched: §"Rooted recurrence" below shows this route's `deg(s_v)=2` collapse is a direct restatement of this already-
  registered identity in transport notation (alias-checked mathematically, not just lexically — see below); this route
  does **not** propose it as new.
- **`E993-LOWER-REGION-EARLY-MARKED-OCCUPANCY-TRANSFER`** (`CT_x`), **`E993-LOWER-REGION-FLAT-ADDABILITY-BUDGET`**,
  **`E993-LOWER-REGION-CURRENT-RANK-ADDABILITY-BUDGET`** — all OPEN. **Not claimed** anywhere in this route (per the
  allocation's explicit instruction). They are strictly different (progressively weaker sufficient) premises than the
  target budget `D + C ≥ (2α+1−3p)Q`; this route tests only the target itself, never these.
- **Ten refuted mechanism keys** (`SOLUTION-CONTRACT.md` §3.2) and the C6-F4 own-support rule — **not revived**. All ten are
  *pointwise/per-leaf* mechanisms (a single leaf's own sign, injectivity, domination or covariance). This route's target is
  the *aggregate* budget across the whole selector `F`; T2 never asserts a per-leaf inequality, and this route's own T_22
  reproduction (below) exhibits a positive per-leaf term coexisting with a negative aggregate — exactly the phenomenon that
  refuted those four keys, reconfirmed, not contradicted. The C6-F4 own-support unit-capacity rule concerns a different
  (unit-capacity, own-support-only) relation, not the active-tag weight `w_F` and (D)∪(S) relation used here.
- **`E993-ORDINARY-TM-LOWER-REGION-AGGREGATE`** (T_m family, VERIFIED `computer_assisted`) — used with attribution, **not
  re-proved**: reproduced independently (own script, m = 1..8, every eligible p) as a self-check of this route's
  instrument, not as new evidence for the family theorem.
- Free-tree counts (OEIS A000055) — a named fixed point, reproduced (not a registry claim).

## Step-by-step derivation

All objects below are `SimpleGraph`-style undirected graphs on a finite vertex set; every graph this route calls a tree is
passed through `Graph.is_tree()` in `t2_instrument.py`, which checks **edge count `= n−1`**, **connectivity** (explicit BFS)
and **acyclicity** (explicit DFS with back-edge detection) as three separate conditions, all three required. `IsTree` is
used exactly where `SEMANTIC-CONTRACT.md` §1.1 uses it: to license the forest independence-polynomial DP
(`indep_poly_dp`), which is asserted equal to a brute-force `2^n` subset enumeration (`indep_poly_bruteforce`) on every
tree of order ≤ 18 this route builds (`dp_vs_bruteforce_selfcheck_all_pass = true`, 64 trees on 5 vertices; every fixed
point and every census tree besides `T_22` re-checks this at its own order). Finiteness is used throughout via `Fintype`
size `n`; nothing here is asserted for an infinite graph.

### Step 1 — `x(T)` computed through rank `α`, independently of the standing evaluator

`SEMANTIC-CONTRACT.md` §1.1 and `NEUTRAL-HANDOFF.md` require `x` to be computed through rank `α` (the standing
`ordinary_tree.py` helper's `first_strict_descent` was flagged as omitting the terminal zero-extension difference). This
route's `first_strict_descent_through_alpha` scans `k = 0..α` inclusive and uses `Δ_α = 0 − i_α < 0` (always true since
`i_α > 0` for a nonempty independence polynomial) as the guaranteed terminal case, so the scan always terminates by
`k = α` at the latest — never relying on an out-of-range default. This was cross-checked against an *independently
written* second scan (extend the polynomial by one explicit zero and take the first negative adjacent difference) on
every tree on 6 vertices (625 labelled trees via Prüfer sequences): `x_through_alpha_selfcheck_all_pass = true`.

### Step 2 — the active-tag weight and (WID), by definition

`w_F(B) := #{v ∈ F ∩ B : (B∖{v}) ∩ N_T(s_v) ≠ ∅}` (`SEMANTIC-CONTRACT.md` §1.2, `activeWeight` of `SOLUTION-CONTRACT.md`
§2) is implemented literally in `active_weight()`: for each `v ∈ F` present in `B`, it tests whether `B` (minus `v`)
intersects `v`'s support's OTHER neighbours (`W_v`) — never `|F ∩ B|`. `wid_direct_check()` enumerates `I_{p+1}(T)` and
`I_p(T)` by brute force (`independent_sets`, using `is_independent` on the ORIGINAL graph `T`, never a deleted graph), sums
`w_F` over each layer, and asserts `supply − capacity = S(T,p)` where `S(T,p)` is computed independently from the
`H_v,R_v` definition (`aggregate_S`, matching `C5LA1.aggregate` of `SEMANTIC-CONTRACT.md` §1.1 exactly: `Σ_{v∈F}
[Δ_{p−1}(H_v) − Δ_{p−1}(R_v)]`). This is the definitional route to (WID), not the `q_v` bijection shortcut, and it is run
on every fixed point and every census tree of order ≤ 18 with a formed `wid_direct_check` field (four named fixed points,
plus every ≤18-order census row): identity holds in all cases tested (see tables below).

### Step 3 — re-deriving the incidence identity `kS = (2α+1−3p)Q − D − C`

For `v ∈ F`, `k = p−1`, `h = α(H_v)`: `q_v(j) := i_j(H_v) − i_j(R_v)` (`R_v = H_v` minus the vertex set `W_v`, literally,
not a closed-neighbourhood deletion). For a marked `k`-set `A` (independent in `H_v`, meeting `W_v`), `e_v(A) := |V(H_v)
∖ N_{H_v}[A]|` counts vertices individually addable to `A`. Every `(k+1)`-set upper set with **exactly one** mark in `W_v`
has exactly `k` single-vertex deletions producing a marked `k`-set below it; one with **at least two** marks has `k+1`
such deletions. Counting the incidences `(A, u)` with `u` addable two ways (`Σ_A e_v(A)` directly, and `k·q_v(k+1) + C_v`
by the upper-set side, where `C_v` counts `(k+1)`-marked sets meeting `W_v` at least twice, once each) gives, for each `v`:

```
E_v := k·q_v(k+1) + C_v
D_v := 2(h−k)·q_v(k) − E_v      (h = α(T) − 1 here; the leaf-exchange fact h = α(T)−1 is not re-derived
                                  independently in this return — it is cross-checked implicitly by the identity
                                  holding below with the GLOBAL coefficient 2α(T)+1−3p, not a per-leaf one)
```

`C_v` is computed by the inclusion-exclusion identity `#{A : |A∩W_v| ≥ 2} = Σ_{size=2}^{|W_v|} (−1)^{size}(size−1)
Σ_{X⊆W_v,|X|=size} i_{rank−size}(H_v ∖ N_{H_v}[X])`, proved on its own face in `multiply_marked_count`'s docstring (the
indicator identity `[m≥2] = Σ_{size=2}^{m}(−1)^{size}(size−1)\binom{m}{size}` is checked by hand for `m=0,1,2,3,4` there and
holds by the standard binomial-transform argument for all `m`), and cross-checked against an *independent* brute-force
enumeration (`multiply_marked_count_bruteforce`) wherever `|W_v| ≥ 2` and the tree is small enough (every fixed point and
every census row with `n ≤ 20`): `C_bruteforce_all_match = true` everywhere it was checked. Summing over `F` (`Q :=
Σ_F q_v(k)`, `U := Σ_F q_v(k+1)`, `D := Σ_F D_v`, `C := Σ_F C_v`) and using `S = U − Q` (the fixed-selector identity of
`E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY`/C6-U6, re-derived independently from `q_v(z) = A_v(z) − B_v(z)` where
`A_v,B_v` are the forest independence polynomials of `H_v,R_v`) gives exactly `kS = (2α(T)+1−3p)·Q − D − C`. Confirmed
(`incidence_identity_holds`) on every one of the 1,043 own-census rows, all 13 T_m rows, all 3 named fixed points, and the
`T_22` reproduction — **1,060 fresh instances**, all exact-integer.

### Step 4 — rooted recurrence for `Q_j` and the `deg(s_v)=2` collapse

For a fixed `v`, `H_v`'s components are indexed exactly by `W_v` (removing `s_v` from `T` splits it into
`deg_T(s_v)` components, one per neighbour; `v`'s own component vanishes with `v`). Writing `A_i(z), B_i(z)` for the
independence polynomial of the `i`-th component and of that component minus its `W_v`-vertex, the standard forest
recursion gives `q_v(z) = Π_i A_i(z) − Π_i B_i(z)` (C6-U6's expansion, re-derived the same way here). **When
`|W_v| = 1`** (support `s_v` has degree 2, other neighbour `g = w_1`), there is exactly **one** component, so `H_v` IS
`A_1`'s graph and `R_v` IS `B_1`'s graph directly (no product structure at all), and the plain tree recursion
`I(H_v;z) = I(R_v;z) + z·I(H_v ∖ N_{H_v}[w_1]; z)` gives, **exactly**:

```
q_v(j) = i_{j−1}(H_v ∖ N_{H_v}[w_1])          (a PLAIN independent-set count of a strictly smaller forest — not a
                                                 difference of two counts at all)
C_v = 0  identically   (a 1-element set W_v cannot be met "at least twice")
```

This is not new mathematics: translating notation (`H_v ∖ N_{H_v}[w_1]` here is exactly `U = A ∖ N_A[g]` of the already
**VERIFIED** `E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION`, whose stated identity `I(A) = I(H) + z·I(U)` —
with their `A = H_v` (mine) and their `H = R_v` (mine) — is *literally* the recursion used above, coefficient by
coefficient. This route's contribution here is (a) the translation into the transport network's own notation, checked
mathematically against the registry (alias check below), and (b) a fresh computational cross-check
(`deg2_collapse_check`, comparing `q_v(k)` computed the direct `i_k(H_v)−i_k(R_v)` way against `i_{k−1}` of the
further-deleted graph): **`deg2_collapse_all_match = true` on every fixed point and every census/T_family/T_22 row that
has a degree-2-support tag** (this includes every marked-arm and every claw-leaf tag of the `T_m` family and `K_{1,12}`'s
leaves have degree-1 supports of degree `m` — no degree-2 supports there — but the path-star profiles and `T_22`'s
marked arm exercise it). No new claim is registered for this paragraph; it confirms/touches
`E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION`.

**Why this does not close the target.** For `|W_v| ≥ 2`, `q_v(z)` is a *difference* of two products of independence
polynomials, and no general monotonicity of `j ↦ q_v(j)` is available (this is exactly the point at which
`E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` and the covariance mechanism were refuted). Even restricting to the
`|W_v|=1` sub-case, `q_v(j) = i_{j−1}(\text{smaller forest})` reduces monotonicity of a single tag to a same-type
first-difference-sign question on a *strictly smaller* tree — structurally the same kind of question as Erdős #993 itself,
recursed one level down, and not resolved by this route (the sub-case's `Q_j := Σ q_v(j)` still sums differences across
tags with generally *different* smaller forests, so a per-tag unimodality result would not by itself give the needed sum
inequality). This route did **not** find a proof of this reduction terminating; it is named explicitly as an open
sub-question in "Remaining obligation" below, not claimed.

### Step 5 — the logical hierarchy (obligation item (d))

**Claim (proved here, elementary from the definitions, grade `proved_informal`).** For every eligible `(T,p)`
(`x+2 ≤ p`, so `p ≥ 2` and `k = p−1 ≥ 1 > 0`), the following three statements are **pairwise equivalent**:

1. **(budget)** `D + C ≥ (2α+1−3p)·Q`;
2. **(REC-mono)** `Q_p ≤ Q_{p−1}` (same fixed selector `F = F_p(T)` at both ranks, `Q_j := Σ_{v∈F} q_v(j)`);
3. **(sign)** `S(T,p) ≤ 0` (the primary aggregate's own defining inequality, `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`).

*Proof.* `S = U − Q = Q_p − Q_{p−1}` (Step 4/C6-U6's identity, `S ≤ 0 ⟺ Q_p ≤ Q_{p−1}`, giving (2)⟺(3) immediately with no
further hypothesis. Multiplying `kS = (2α+1−3p)Q − D − C` by the positive integer... rather, dividing: since `k > 0`,
`S ≤ 0 ⟺ kS ≤ 0 ⟺ (2α+1−3p)Q − D − C ≤ 0 ⟺ D + C ≥ (2α+1−3p)Q`, giving (1)⟺(3). ∎

**Consequence.** Proving the budget (T2's assigned object) would prove **only** the primary aggregate `S(T,p) ≤ 0` — a
separate, context-tier target (`SOLUTION-CONTRACT.md` §1, bottom row) — **not** (HALL) itself. `(HALL) ⟹ S ≤ 0` via `(WID)`
and `(FLOW⇒SIGN)` (using `(HALL-COND)` only at `X = I_{p+1}`, per `SEMANTIC-CONTRACT.md` §1.2), so (HALL) is at least as
strong as the budget; the **converse is not established** by anything in this run — a saturating flow for `X = I_{p+1}`
is a strictly more demanding fact than one scalar inequality, since (HALL) additionally requires `Σ_X w_F(B) ≤
Σ_{N(X)} w_F(A)` for **every** `X ⊆ I_{p+1}`, not just the full layer. **This route's assigned target, even if
fully proved, would not by itself resolve Tier 1 (HALL); it would resolve only the bottom-row context target.** This is
stated explicitly because the allocation asked precisely "which of (HALL), the budget, and `Q_p ≤ Q_{p−1}` is stronger
than which" — the answer is: (2)≡(3)≡(1) are one statement in three forms, and (HALL) is a (not-known-to-be-reversible)
sufficient condition for all three, strictly stronger in general.

## Own instrument, fixed points and census (`scratchpad/c1-T2/t2_instrument.py`, `t2_run.py`)

Digests (this seat's own scripts, standard library only, exact integers):

| file | SHA-256 |
|---|---|
| `t2_instrument.py` | `877fdbf24d691b1b407762cef1298e392a07c5dfdfecc8daf7cd7df83b7e2c3d` |
| `t2_run.py` | `763939bdb47f1069d0316d3bc9761b7774dd55ab77e22a070750bee7401f2e2d` |
| `out.json` (digested run output; no wall-clock/PID/host fields — elapsed time is printed to stderr only) | `b6e6986250546bd42e335c4bfbbbcc7c91231b2250879b5b4342242fc555a1ab` |

**Replay (copy-out-first, run in the FOREGROUND — no background/detached jobs were used anywhere in this route):**

```sh
mkdir -p /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-T2-replay
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-T2/t2_instrument.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-T2-replay/
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-T2/t2_run.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-T2-replay/
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-T2-replay
python3 t2_run.py > out.json
shasum -a 256 t2_instrument.py t2_run.py out.json
```

This was executed by this seat before writing this return: the replay directory's three digests are byte-identical to the
table above (`out.json` diffed byte-for-byte equal against the original). Wall-clock: ~92–95s single foreground process
each run (not a hashed field); no background job was ever started, so no PID-polling or kill step was needed.

### Fixed points (every row: `x`, `α`, `p`, `|F|`, supply, capacity, `S`, `Q`, `U=Q_p`, `D`, `C`)

| tree | `n` | `α` | `x` | `p` | `k` | `2α+1−3p` | `\|F\|` | supply (`I_{p+1}` wt.) | capacity (`I_p` wt.) | `S` | `Q` | `U` | `D` | `C` |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| `K_{1,12}` | 13 | 12 | 6 | 8 | 7 | 1 | 12 | 1980 | 3960 | −1980 | 3960 | 1980 | 15840 | 1980 |
| path-star (2,3,4) | 15 | 11 | 5 | 7 | 6 | 2 | 10 | 1483 | 2701 | −1218 | 2701 | 1483 | 11608 | 1102 |
| path-star (2,2,4,3) | 18 | 13 | 6 | 8 | 7 | 3 | 12 | 8033 | 13467 | −5434 | 13467 | 8033 | 73216 | 5223 |
| `T_22` | 91 | 68 | 32 | 34 | 33 | 35 | 67 | 6533318342644086823410 | 7032072523191088241946 | −498754180547001418536 | 7032072523191088241946 | 6533318342644086823410 | 260062757342819689323912 | 2518668926919445955886 |

Every value in this table (supply, capacity, `S`, `Q`, `U`, `D`, `C`) matches the frozen record's value for that fixed
point exactly (`SEMANTIC-CONTRACT.md` §1.2 for the first three; `evidence_t22.json`/C6-T4 for `T_22`) — reproduced by this
route's own, independently-written script, not copied from any frozen file. `incidence_identity_holds`,
`budget_holds_D+C>=coeffQ`, and `S_le_0` are `true` on all four; the direct `wid_direct_check` (brute-force `I_{p+1}`,
`I_p` enumeration, feasible for the first three at `n ≤ 18`) also holds exactly (e.g. path-star (2,2,4,3): 1080
`I_9`-sets, 2185 `I_8`-sets, supply 8033, capacity 13467, `S=−5434`). `T_22`'s marked-arm tag has per-leaf term
`+212336130412243110` (positive) while every one of its 66 claw-leaf tags has `−7560098737536570631`; this route's own
`T_m` family reproduction (`m = 1..8`, 13 eligible rows, order ≤ 35) never produces a positive per-leaf term — the
positive-term phenomenon needs `m` in the high teens/twenties, matching (and now independently cross-validating, at `m ≤
8`) the predecessor's account that no small `T_m` exhibits it.

### Free-tree count reproduction (fixed point, `SEMANTIC-CONTRACT.md` §1.2)

Own isomorph-free generator (`gen_nonisomorphic_trees`: order-`n` trees from order-`(n−1)` trees by attaching one pendant
leaf to every vertex, deduped by an AHU canonical form implemented in `canonical_form`), orders 1–18:

```
1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159, 7741, 19320, 48629, 123867
```

Matches A000055/the semantic contract's listed sequence exactly (`free_tree_counts_match_A000055 = true`).

### Own bounded census (orders 1–15, exhaustive up to isomorphism; `bounded_computation`, not proof)

Every non-isomorphic tree of order 1–15 (3,973 iso-classes total by the count above) was checked at every eligible `p`:
**1,043 eligible `(T,p)` rows**, every one with `incidence_identity_holds`, `budget_holds_D+C>=coeffQ`, `S_le_0` and
`deg2_collapse_all_match` all `true`; **zero** rows with any positive per-leaf term. This is a modest, explicitly bounded
check (order ≤ 15), not a substitute for F1's exhaustive adversarial search, and it proves nothing about arbitrary trees
(`SOLUTION-CONTRACT.md` §3.4, census discipline) — it is reported only as evidence that this route's re-derived identity
and its own instrument are correct on a fresh, independently generated sample, and as a systematic probe of `j ↦ Q_j`.

**`Q_j` monotonicity/log-concavity probe** (extending the identity to a third point `Q_{k−1}`, same fixed selector
`F = F_p(T)`, `k = p−1`): on **every one** of the 1,043 census rows, all 13 `T_m` rows, all 3 named path-star/star fixed
points, and `T_22`, both `Q_{k−1} ≥ Q_k ≥ Q_{k+1}` (weak monotone decrease) **and** `Q_k^2 ≥ Q_{k−1}·Q_{k+1}`
(log-concavity at the tested point) hold — **1,060 instances, zero failures of either property**. This is bounded
computational evidence, **not a proof**, for the "(REC)" outcome-B template of `SEMANTIC-CONTRACT.md` §2: a
monotonicity/log-concavity property of `j ↦ Q_j` on the eligible window, which — if it could be proved in general — would
give `Q_p ≤ Q_{p−1}` directly (Step 5) and hence the primary aggregate. No claim is registered for this: it is a
candidate direction named for a successor, per the fence that "a template is not a claim."

## Fixed-point reproduction note (a factual correction, not a refutation)

`SEMANTIC-CONTRACT.md` §1.1 states: *"On trees the smallest eligible instances have order 13 (`K_{1,12}`, …)."* This
route's exhaustive, isomorph-free census (above) finds this to be **factually incorrect as a general claim**: the
smallest eligible order is **11**, not 13. A minimal witness, checked by this route's full pipeline including the
**direct brute-force `wid_direct_check`** (not merely the DP/incidence-identity route):

- Double-broom on 11 vertices: centre `0` adjacent to `1` and to 6 private leaves `{2..7}`; centre `1` also adjacent to 3
  private leaves `{8,9,10}`. Edges: `(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7),(1,8),(1,9),(1,10)`.
- `α = 9`, `x = 4` (both independently checked through rank `α`), eligible at `p = 6` (`x+2=6≤6`, `3·6=18<2·9+1=19`).
- `|F| = 9` (all leaves), `S = −261`, `Q = 516`, `U = 255`, `D = 1602`, `C = 219`.
- Direct enumeration: `|I_7(T)| = 37`, `|I_6(T)| = 90`, supply `= 255`, capacity `= 516`, `supply − capacity = −261 = S`
  (`identity_holds = true`). `C_v` cross-checked against brute force for every tag (`C_bruteforce_all_match = true`).
- The eligible-`p` window for this tree is the single point `p=6` (`⌊2·9/3⌋=6`), so it is not an artifact of scanning
  outside the intended window.

This does **not** refute anything: `S ≤ 0` and the budget both hold on this instance and on every other order-11/12
instance the census found (the smallest order with **zero** eligible rows is confirmed through order 10 — the census
covers 1–15 exhaustively and the smallest eligible order found is 11, not lower). It is not a deficient cut (no `X` with
`Σ_X w > Σ_{N(X)} w` is asserted or found here). It simply corrects a specific numeric claim in the sealed
`SEMANTIC-CONTRACT.md` that this route was asked to reproduce as a fixed point and could not reproduce as stated. For
context only (**not cited as evidence**, per the fence on the controller's pre-run instrument): `control/controller-
prerun/wt_check.py`'s own default scope already runs to order ≥ 14/15/16, and this route's independently-generated
1,043-row count for orders 1–15 happens to equal the figure recorded in `control/C1-STAGE1-GATE.md` for the controller's
own order-≤15 follow-on run — consistent with, but not derived from or dependent on, that prior; this route's order-11
witness stands entirely on its own replayable computation above.

## Read-boundary disclosure

Before creating this seat's own scratch subdirectories, this route ran a single non-recursive `ls` on the shared parent
directory `experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/` (not `ls -R`, no glob, no recursion into
any subdirectory), which is named in the dispatch as above this seat's grant except for `scratchpad/c1-T2/` itself. The
output showed only the four directory **names** `c1-T2`, `c1-T2-replay`, `c1-U1`, `c1-U1-replay` — no file was opened, no
file content from another seat's scratch directory was read, and nothing from `c1-U1`/`c1-U1-replay` is used anywhere in
this return. Disclosed per the dispatch's instruction that "a search that does occur is a read-boundary disclosure item,"
out of caution, even though the action was a single-level listing rather than a recursive one.

## Grades

| item | grade |
|---|---|
| WID checked by direct definition on 1,060+ fresh instances | `bounded_computation` (identity itself remains OPEN pending U2's Lean award) |
| Incidence identity `kS=(2α+1−3p)Q−D−C`, re-derived | re-derivation of an existing `proved_informal` result (DCB); this route's derivation is `proved_informal`, not newly registered |
| `deg(s_v)=2` collapse / `C_v=0` when `\|W_v\|=1` | `proved_informal` corollary of the existing VERIFIED `E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION`; not new |
| Logical hierarchy (budget) ⟺ (`Q_p≤Q_{p−1}`) ⟺ (`S≤0`); (HALL) sufficient, not known reversible | `proved_informal` (elementary, complete, from the definitions; not Lean-formalized) |
| Smallest eligible order is 11 (not 13) | `bounded_computation` / exact finite witness (record correction) |
| 1,043-row order-≤15 census; T_m, fixed-point, `T_22` reproductions | `bounded_computation` |
| `Q_j` monotonicity/log-concavity on 1,060 tested instances | `bounded_computation`; **not** a conjecture registration, offered only as a successor lead |
| The assigned target itself: `D+C ≥ (2α+1−3p)Q` for arbitrary eligible `(T,p)` | **unresolved** — no grade assigned; remains OPEN exactly as entering the cycle |

## Alias check (lexical AND mathematical)

Checked the 435-claim `control/CLAIM-IDENTITY.run-local.json` for every statement made above. Lexical: no claim_key or
alias string in the registry matches "deficit budget", "rooted recurrence", "layer weight monotone/log-concave", or this
route's specific phrasing. Mathematical: the only genuine mathematical coincidence found is the `deg(s_v)=2` case, which
**is** the same statement (after notation translation `H_v↔A`, `R_v↔H`, `H_v∖N[w_1]↔U`) as the VERIFIED
`E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION` — named and attributed above, not re-registered. The three
`E993-LOWER-REGION-{EARLY-MARKED-OCCUPANCY-TRANSFER,FLAT-ADDABILITY-BUDGET,CURRENT-RANK-ADDABILITY-BUDGET}` OPEN keys are
mathematically *different* statements (they bound `E` alone, not `D+C`, against `i_x·Q`/`(x+1)Q`/`(p−1)Q` respectively,
not `(2α+1−3p)Q`) — confirmed by direct comparison of their registered `statement` fields against this route's target;
none is claimed or conflated with the assigned budget. No new claim is registered by this route (the logical-hierarchy
theorem of Step 5 is offered as a proved statement in this return, but registration is a synthesis/Stage-7 decision, not
a route's own act).

## headline_resolved: no

## Route verdict: `bounded_evidence`

This route did not prove the assigned budget `D+C ≥ (2α+1−3p)Q` (equivalently `Q_p≤Q_{p−1}`, equivalently the primary
aggregate `S≤0`) for arbitrary eligible trees, and found no deficient cut or counterexample. Its contribution is: (i) an
independently re-derived and re-verified incidence identity and WID (by direct definition, not the bijection shortcut),
cross-checked on 1,060+ fresh exact-integer instances including a full reproduction of every named fixed point and the
`T_m` family; (ii) a precise, proved logical hierarchy clarifying that this route's target — even fully proved — would
settle only the primary-aggregate context target, not (HALL) Tier 1; (iii) a proved corollary connecting the
`deg(s_v)=2` sub-case to an already-VERIFIED registered identity, exposing a recursive (same-type, smaller-instance)
structure in exactly the sub-case where `q_v` is not a difference; (iv) bounded computational evidence (zero failures
over 1,060 instances) for a monotonicity/log-concavity property of `j↦Q_j`, offered as a successor lead, not a claim; and
(v) a factual, fully replayable correction to the sealed contract's "smallest eligible order is 13" statement (it is 11).

## Remaining obligation (successor inheritance)

1. **The target itself is untouched.** `D+C ≥ (2α+1−3p)Q` (equivalently `Q_p≤Q_{p−1}`, equivalently `S(T,p)≤0`) remains
   OPEN for arbitrary eligible ordinary trees. This route's logical-hierarchy result means a successor pursuing this
   scalar route should be told explicitly: **proving it proves the primary aggregate, not (HALL)** — a separate,
   stronger, and still-untouched flow-existence question would remain even after a full proof here.
2. **The `deg(s_v)≥2` case is where the difficulty lives.** The `deg(s_v)=2` sub-case collapses `q_v(j)` to a plain
   independent-set count of a smaller forest (proved above); a successor should determine whether an induction on tree
   order, applied component-by-component through this collapse, can be extended to `|W_v|≥2` tags (where `q_v(z)` is
   generally a difference of two products, not a single count) — this route found no such extension and does not know
   one exists.
3. **The `Q_j` monotonicity/log-concavity lead (REC template) is untested beyond order 15 and the `T_m`/`T_22` family.**
   1,060 zero-failure instances is suggestive, not evidence toward a proof; a successor with more computational budget
   (F1's exhaustive scope, not a repeat of this route's modest census) could extend the order range, and — more
   importantly — someone should attempt an actual proof of `Q_k^2 ≥ Q_{k-1} Q_{k+1}` or `Q_{k+1}\le Q_k` from the
   component-product structure of Step 4, which this route did not attempt beyond the `|W_v|=1` case.
4. **The fixed-point correction (smallest eligible order = 11, not 13) should be reconciled into `SEMANTIC-CONTRACT.md`**
   at the next controlled-update opportunity (this route has no authority to edit a sealed contract file); it does not
   change any theorem or the search space already covered by the controller's own broader prior instrument, but the
   prose fixed point as stated is not reproducible and a successor citing "smallest eligible order 13" as a fact should
   be aware of this return's replayable order-11 counterexample-to-the-prose-claim.
5. No deficient cut, no refutation, and no new registrable claim is being handed forward by this route beyond what is
   listed above.

## Model disclosure

Chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); runtime-reported model id: `claude-sonnet-5`.
