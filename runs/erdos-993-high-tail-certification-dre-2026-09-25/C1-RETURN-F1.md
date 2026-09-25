# RETURN — Route `C1-F-01`, mechanism fingerprint `HIGH-TAIL-FALSIFICATION-AND-BOUNDARY`

r29 (certify the uniform high-tail mechanism and its non-residual top-rank consequence), Cycle 1, Stage 3, seat F1.
Orientation F (falsify).

## Boot acknowledgment

VerityOS booted per dispatch: read `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and **only** those two files for the VerityOS boot
(the startup protocol's own task-type map, memory, conversations, modules, skills, logs and decisions directories
were **not** read — the controller has booted for the run). No other VerityOS-root file was read.

## Read-boundary disclosure

None. Beyond the two boot files, I read exactly the files DISPATCH-F1.md names in its "THEN read, in this order"
list — `control/C1-WORKER-COMMON-BRIEF.md`, `control/C1-STAGE2-PACKET-MANIFEST.json`, `SEMANTIC-CONTRACT.md`,
`SOLUTION-CONTRACT.md`, `control/C1-ALLOCATION.md`, `control/C1-STAGE1-GATE.md`,
`cycles/cycle-1/stage2/ROUTE-STATE.md`, `control/SOURCE-DIGESTS.json` — plus, from `sources/` and `control/`, only
the specific files this route's obligation (`C1-ALLOCATION.md` item 3) actually needs:
`sources/first-interior/records/C2-SCOPE-AUDIT.md`, `control/CLAIM-DISTINCTIONS.json`,
`control/CLAIM-IDENTITY.run-local.json`, and `control/controller-prerun/ht_check.py` /
`control/controller-prerun/ht_report.json` (read only for the end-of-run reconciliation the brief requires, never
as evidence). I did not read `AUTHORIZATION.md`, `control/R29-CHARTER-PROMPT.md`, `control/RESIDUE-CHECK.json`, any
Lean project file, the first-interior/r25/r26/r27/r28 detailed packages, `sources/authority/`, `sources/followups/`,
`sources/public-docs/`, or `sources/mathlib-binding/` — none is needed for a pure combinatorial
falsification/boundary route (F1 builds and runs its own Python instrument; it does not touch Lean). No `find`,
`grep -r`, `rg`, `ls -R`, or glob `cat` was run rooted above my grant; one `pgrep -f` lookup was used to locate a
backgrounded job's PID and is disclosed under Rule discipline below.

## Stage 2 seal and source digests verified

Recomputed SHA-256 of the canonical JSON of `control/C1-STAGE2-PACKET-MANIFEST.json` (the object with
`seal_sha256` popped, `sort_keys=True`, `separators=(",", ":")`, no trailing newline):

```
58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e
```

This matches the manifest's own `seal_sha256` field exactly (recomputed independently, not copied from the
dispatch text).

Digests of the two `sources/` files this route relies on for evidentiary content, verified against
`control/SOURCE-DIGESTS.json`:

| File | SHA-256 (recomputed) | Matches `SOURCE-DIGESTS.json` |
|---|---|---|
| `sources/first-interior/records/C2-SCOPE-AUDIT.md` | `ad24a0fe7c7021c90f3d5bdf07df57746d89ac6ff65f4c27c7a0071c67e95cbb` | yes (6628 bytes) |
| `control/CLAIM-IDENTITY.run-local.json` | `97abd89e77314edba1f2ebde486a5e39ccd295cc3ffe609c36ef9e3da7775082` | yes (2548453 bytes) |

## Model disclosure

Chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); runtime-reported model id:
`claude-sonnet-5` (system-reported: "You are powered by the model named Sonnet 5. The exact model ID is
claude-sonnet-5.").

## IMPORT LIST (every generator in this return, no exceptions)

`itertools`, `json`, `hashlib`, `sys`, `time`, `math`, `random` — Python standard library only. No network, no
`pip`, no third-party packages. Verified by inspection of every `import` line in the five generator files listed
under Replay below.

## Registered claims this route touches or re-confirms (named before any census, per shared rule 3)

Read directly from `control/CLAIM-IDENTITY.run-local.json` (2548453 bytes, digest verified above; 407 claims) —
verbatim status/scope/statement fields, not summarized from memory:

| Claim key | Status | Scope (verbatim, truncated) |
|---|---|---|
| `E993-BIPARTITE-TAGGED-SHADOW-BOUND` (TSB) | OPEN | "New proposed counting lemma. No leaf, acyclicity, selector, first descent, residual premise or aggregate. A size-restricted incidence count, not the refuted all-window pointwise addability claim." |
| `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` (HTP) | OPEN | "Proposed high-rank proper restriction of pointwise leaf sign. No residual or favorable-selector hypothesis." |
| `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` (ELIG) | OPEN | "Proposed guard lemma for the registered first-interior aggregate only." |
| `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` | **VERIFIED** | first-interior award, an input; never re-proved or re-registered here. |
| `E993-R26-TOP-RANK-RESIDUAL-SIGN` (RC) | **VERIFIED** | r26 award (residual class, four hypotheses); never re-proved or re-registered here. |
| `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | OPEN | all-rank aggregate; not attacked or resolved by F1 (T2's scope note). |
| `E993-BETA-TARGET` (β) | **REFUTED** | universal at `k_A>=2`; refuted by the order-243 witness `R17-BETA-CE-ORDER243-STAR60`. |
| `E993-BETA-AGG-SUPPORT` | **REFUTED** | per-support favorable-leaf aggregate on the governed RTree model; refuted by the order-91 `T_22` witness. |
| `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` | **REFUTED** | "at most `r` addable vertices" for every independent `r`-set of a full ordinary G1 tuple. |

No key states (TRN) or (HTA) yet (confirmed OPEN/absent at Stage 1 gate, ruling recorded in
`control/C1-STAGE1-GATE.md`). This route proposes **no new registration**; it produces evidence only. A candidate
`E993-R29-HIGH-TAIL-BOUNDARY-RECORD` (Solution Contract §1 Tier 2) is a synthesis decision, not something F1 awards
itself — its alias check is done below (Alias check section) so synthesis has it in hand.

## Own instrument (never the controller's `ht_check.py`)

All code below is my own, written for this route, under
`scratchpad/c1-F1-replay/f1lib.py` and five `gen_*.py` scripts. `control/controller-prerun/ht_check.py` was read
**once**, at the very end, only to reconcile counts (see Reconciliation section); no line of it was copied, and no
number in this return is derived from it.

Before use, the instrument was **validated against the SEMANTIC-CONTRACT.md §2 fixed points**:
- `all_bipartite_labelled_graphs(n)` for `n=1..6` reproduces exactly `1, 2, 7, 41, 376, 5177` (the semantic
  contract's own named fixed point), every generated graph independently re-verified bipartite by a 2-colouring
  test in code (`f1lib.is_bipartite`, `f1lib.two_colouring`).
- `free_trees_up_to_iso(n)` for `n=1..16` reproduces exactly A000055's `1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235,
  551, 1301, 3159, 7741, 19320`, every generated tree independently re-verified by **two separate** tests in code,
  `test_connected` (BFS reachability) and `test_acyclic` (parent-tracking DFS with an explicit back-edge check) —
  never assumed from the construction.
- `forest_indep_poly` (the exact tree/forest independent-set DP used for the large adversarial families) was
  validated against brute-force `indep_set_masks` subset enumeration on 30 random trees (`n<=14`) and against
  brute-force counts after an induced deletion on 15 more random trees: exact match on every coefficient, every
  trial.

All counting is by exact-integer bitmask subset enumeration (`indep_set_masks`, orders ≤ 8) or by the validated
exact polynomial DP (`forest_indep_poly`, arbitrarily large forests) — never floats, never sampling presented as
exhaustive.

## Step-by-step derivation, naming where each hypothesis enters

**(TSB)** `k·q_{k+1}(H,W) ≤ 2(a−k)·q_k(H,W)`, `a=α(H)`. `IsBipartite` enters only through the internal mechanism
(every addable vertex's set induces a bipartite graph, so its two colour classes each contribute ≤ `a−k`
vertices — I did not re-derive this half of the compiled internal `taggedShadowBound`, entry 41, digest
`50dcce4a…`, a **compiled internal, unawarded** fragment per fence §3.8; I attack the resulting inequality as a
black box). `1 ≤ k` bounds the natural subtraction `a−k` from going negative in the informal reading; `k ≤ a` is
the stated range, but I found computationally (see "k>a companion" below) that `q_j=0` for every `j>a` by
definition of `α`, so both sides of the raw inequality are identically `0` for `k>a` — **the `k≤a` clause in the
registry English is not needed to keep the raw inequality true**, only to keep "`a−k`" a meaningful non-negative
quantity in prose (this is a registry-text-vs-statement-scope note, not a proof gap). `W` is unconstrained;
`W=∅` forces both sides to `0` (verified). The companion identity `q_j(H,W) = i_j(H) − i_j(H−W)`
(`tagged_count_split` at `D=∅`, `E=W`) was independently re-derived and checked exhaustively (2,395,020 exact
triples, `n≤6`, every bipartite `H`, every `W`, every `j`, zero mismatches, §"Companion identity" below).

**(HTP)** `Δ_{p−1}(G−{v,s}) − Δ_{p−1}(G−N_G[s]) ≤ 0`. `IsGraphLeaf` (`v` degree exactly 1) fixes `s` uniquely.
`p ≥ 1` guards `p−1` in ℕ equalling the integer rank. The guard `3p ≥ 2α(G)+1` is the sole gate; for `p ≥ 2` it
composes with (TSB) via `k=p−1`, `α(H_v) ≤ α(G)−1` (the `v` extends every independent set of `H_v` argument,
`leaf_indep_cap`); for `p=1` the guard forces `α(G) ≤ 1`, a leaf forces `α(G)=1`, and (this is the step I checked
computationally rather than assumed) a bipartite graph with `α=1` and a leaf has exactly two vertices — confirmed
below not by a general bipartite argument but by **direct enumeration**: across every bipartite labelled graph
with a leaf up to order 8 (37,561,316 leaf/`p` instances under the guard), the `p=1` guard fired in **exactly two**
instances total (both endpoints of the single edge of `K_2`, constant from `n=2` through `n=8` — no larger graph
ever reaches `α≤1` while having a leaf), which is an empirical confirmation, not a re-derivation, of the semantic
contract's claim that the `p=1` endpoint is true "only because the guard forces `K_2`". `IsBipartite` does not
enter the `p=1` case at all in my check (`K_2` is bipartite trivially); I did not need it because I tested the raw
leaf/guard combinatorics directly rather than the general-`n` argument.

**(HTA)** sums (HTP)'s term over `F_p(G)` (`Δ_p(G−v)<0`, the **original**, unshifted selector). Every summand
`≤0` under the guard makes the sum `≤0`; no extra hypothesis. Verified as a corollary check alongside (HTP) in the
same generators.

**(ELIG)** `x(T)+2 ≤ α(T)−2 ⇒ α(T) ≥ 7`. `IsTree` enters through **both** separate tests (`test_connected`,
`test_acyclic`) on every generated candidate before its counts are trusted. The ℕ hypothesis `crossingIndex + 2 ≤
indepNum − 2` is `False` (not merely vacuous by convention, but arithmetically: `indepNum − 2` truncates to `0` in
ℕ for `α<2`, and `x+2≥2>0` always) whenever `α<2`, matching the registry's stated ℕ/ℤ equivalence.

**(TRN)** `x(T)+2 ≤ α(T)−1 ⇒ S(T,α(T)−1) ≤ 0`. Same two tree tests. My exhaustive census (`trn_low_alpha_witnesses`,
zero found to order 16) confirms no eligible tree ever has `α≤3` — consistent with, not a re-derivation of, the
semantic contract's chain `α=3 ⇒ x=0 ⇒ Δ_0(T)=n−1≥0` contradiction.

## Exhaustive falsification results

### (TSB), bipartite labelled graphs, exhaustive to order 7

Generator `gen_tsb.py`. Every `H`, every `W ⊆ V(H)`, every `1≤k≤a`: **56,649,670** `(H,W,k)` triples checked, **0
failures**. Companion checks (both included, zero failures): `W=∅` forces `q_j=0` for every `j`; `q_{a+1}=0`
exactly (the `k>a` companion). Graph counts by order (own generator, independently reproduces the semantic
contract's fixed point): `n=1..7 → 1, 2, 7, 41, 376, 5177, 103237`.

Report: `tsb_report_n7.json`, SHA-256 (of the report body without the digest field itself)
`4f98c745ccf6531842474f6ec0d2b2607d42868821b7649ee2fdbf34a29158a8`.

### (HTP)/(HTA), bipartite labelled graphs, exhaustive to order 8

Generator `gen_htp_bipartite.py`. Every original leaf, every `p≥1` with `3p≥2α+1` (`p=1` included): **37,561,316**
leaf/`p` instances under the guard, **0 HTP failures, 0 HTA failures, 0 `p=1`-endpoint failures**. `p=1` guard
instances: exactly 2 across all orders 1–8 (both leaves of `K_2`), confirming the endpoint's scope. Graph counts:
`n=1..8 → 1, 2, 7, 41, 376, 5177, 103237, 2922446`.

Report: `htp_report_n8.json`, SHA-256 `03ecf220e3bffe3f5455a0f02a4ee64929331fc39dcad9bf7209110740c98a56`. (This
route attempted order 8 for HTP as the allocation names "order 7–8"; order 8 was reached, order 9 was not
attempted — an honest horizon, not a silent cutoff: 2,922,446 distinct labelled bipartite graphs at `n=8` already
cost 234s of the 4-minute run.)

### (ELIG), (TRN), (HTP)/(HTA)-on-trees, and the boundary search: free trees up to isomorphism, exhaustive to order 16

Generator `gen_trees.py`. `x`, `α`, and the graph (canonical tree, reported by order `n` and adjacency) are carried
on every row. Cumulative results to `n=16`:

| Check | Eligible instances | Failures |
|---|---|---|
| (ELIG) `x+2≤α−2 ⇒ α≥7` | 29,181 | **0** |
| (TRN) `x+2≤α−1 ⇒ S≤0` | 32,364 | **0** |
| (HTP) on trees (every leaf, every guarded `p`) | 2,504,091 leaf/`p` instances | **0** |
| (HTA) on trees | (same guarded `p` set, per tree) | **0** |
| TRN low-`α` witnesses (would-be eligible tree with `α≤3`) | — | **0 found** |

Tree class counts `n=1..16` reproduce A000055 exactly at every order (table already given under Instrument
validation).

Smallest eligible-TRN tree by `α` (own census, `x`, `Δ_k` and `S` reported; `Δ_k` here is the aggregate sum `S`,
not a single forward difference — see table headers): `α=5 → n=7` (`x=2`, `S=−14`); `α=6 → n=7` (`x=3`, `S=−24`);
`α=7 → n=8` (`x=4`, `S=−35`); `α=8 → n=9` (`x=4`, `S=−48`); `α=9 → n=10` (`x=5`, `S=−63`); `α=10 → n=11` (`x=5`,
`S=−80`).

Report: `trees_report_n16.json`, SHA-256 `ea2cba4b4a688e3045087fdb3752aee9a8d070ae49d7a901d4f68360fb13d6fb`.

### Boundary record (Solution Contract §1 Tier 2): is `3p≥2α+1` sharp?

On trees (own exhaustive search, `n≤16`):

- Smallest tree with a **positive** leaf term at exactly `3p=2α` (one step outside the guard): **order 6**, the
  path `P_6` (`v=0, s=1`, adjacency `0−1−2−3−4−5`), `α=3`, `p=2`, `Δ_1(P_6−\{0,1\}) − Δ_1(P_6−N[1])
  = term = +1`.
- Smallest tree with a positive term at `3p=2α−1`: **order 3**, `P_3` (`v=0, s=1, w=2`), `α=2`, `p=1`,
  `term=+1` — this is exactly the semantic contract's own `P_3` fixed point read at its own boundary rank.
- **Per-`α` sharpness table** (largest `p` anywhere in the census with a positive leaf term, vs. the guard's own
  floor `p_guard(α)=⌈(2α+1)/3⌉`), `α=2..15`:

  | `α` | largest positive-term `p` | `p_guard(α)` | gap |
  |---|---|---|---|
  | 2 | 1 | 2 | 1 |
  | 3 | 2 | 3 | 1 |
  | 4 | 2 | 3 | 1 |
  | 5 | 3 | 4 | 1 |
  | 6 | 4 | 5 | 1 |
  | 7 | 4 | 5 | 1 |
  | 8 | 5 | 6 | 1 |
  | 9 | 5 | 7 | 2 |
  | 10 | 6 | 7 | 1 |
  | 11 | 6 | 8 | 2 |
  | 12 | 6 | 9 | 3 |
  | 13 | 7 | 9 | 2 |
  | 14 | 7 | 10 | 3 |
  | 15 | 7 | 11 | 4 |

  For `α=2..8` the gap is exactly 1: the guard is **sharp within the tested horizon** at every value of `α` up to
  8 (a positive term is found at `p_guard(α)−1`, none at `p_guard(α)` or above). From `α=9` on, the gap widens to
  2–4 within the `n≤16` census — this is a **horizon effect, not evidence of slack**: a tree realizing the true
  worst case at larger `α` may simply require more than 16 vertices to appear (the smallest eligible tree at, say,
  `α=13` already needs order ≥ 13 just to have that many independent leaves, leaving little room under a 16-vertex
  cap to also host a near-boundary positive-term witness). **I report this honestly as an attained horizon, not a
  filter bound**: the guard's sharpness for `α≥9` is open past what this route established.
- On bipartite graphs generally (not just trees), the guard is **not sharp for disconnected instances** at even
  smaller order: the disjoint union `P_3 ⊔ K_2` (order 5, `α=3`) already gives a positive term at `p=2`,
  `3p=2α=6` — this witness is inherited context from the controller's own prior (`control/controller-prerun/`,
  a prior never used as evidence in this return) and is **consistent with**, not contradicted by, my own
  tree-only order-6 finding (`P_3⊔K_2` is disconnected, hence outside my tree census; the tree-restricted
  threshold (order 6) is one step later than the general-bipartite one (order 5), which is exactly what
  connectivity should cost).

Boundary data is embedded in `trees_report_n16.json` (`boundary_3p_eq_2a_*` and `per_alpha_largest_positive_p`
fields; digest above).

## Adversarial families (allocation item F1.b), by exact formula or the validated tree/forest DP, far past the
census horizon

Generator `gen_adversarial.py`; `forest_indep_poly`-based, no subset enumeration, every object independently
re-verified `test_acyclic` and `is_bipartite` in code. Leaf-heavy families (thousands of structurally-identical
leaves) are **sampled**, never silently claimed exhaustive — every family row below states `leaves` (total) vs.
`sampled` (tested) explicitly, and `sampled_not_exhaustive_over_leaves` is recorded per family in the JSON.

| Family | `n` | `α` | leaves (total/sampled) | leaf/`p` instances checked | failures |
|---|---|---|---|---|---|
| Star `K_{1,m}`, closed form, `m` up to 5000 | up to 5001 | up to 5000 | 1 leaf-type, exact formula, no sampling | every `p=1..m+1` | **0** |
| Spider, up to 58 legs, total leg length 1769 | 1770 | 899 | 58 / 20 | 23,420 | **0** |
| Double broom `(500,500,2)` | 1002 | 1000 | 1000 / 20 | 6,720 | **0** |
| Caterpillar, spine 500, 1416 pendant legs | 1916 | 1495 | 1416 / 20 | 18,400 | **0** |
| Matching-with-pendant-leaves, `k=2000` (disconnected, 2000×`P_3`) | 6000 | 4000 | 4000 / 20 | 66,680 | **0** |
| Disconnected union, 4 mixed components + 100 isolates | 143 | 130 | 23 / 20 | 1,140 | **0** |

**Star closed form** (`term(p)=C(m−1,p)−C(m−1,p−1)`, exact `math.comb`, no DP): re-derives `α(K_{1,m})=m`
independently; the sign-crossover (`term≤0` starts) is always at or below `⌈m/2⌉`, strictly below the guard floor
`p_guard=⌈(2m+1)/3⌉` for every `m` tested (`m=2,3,5,10,50,100,1000,5000`) — e.g. `m=5000`: crossover at `p=2500`,
guard floor at `p=3334`, a gap of 834. **Zero guard failures** at any tested `m`. This independently confirms the
semantic contract's own remark that "the star shows the boundary is not tight on stars" — the boundary witnesses
above (order 6 `P_6`, order 3 `P_3`) come from **paths**, not stars, consistent with stars being nowhere near the
sharp case.

Report: `adversarial_report.json`, SHA-256 `201d3ab812cbf3cf46eb55b9aa8eebe4be9d03ba1eac94273263025feebd69dd`.

## Literal-hypothesis attacks (allocation item F1.d)

Generator `gen_literal_attacks.py`.

1. **A leaf whose support has degree 1** (`K_2` component): tested both as the whole graph and as one component
   of a 7-vertex disconnected bipartite graph (`K_{1,4} ⊔ K_2`). In every instance `H_v` and `R_v` are the
   **identical vertex set** `{v,s\}`'s complement, so the term is `0` **at every `p`**, not merely at `p=1` —
   `terms_p1to5 = [0,0,0,0,0]` in both settings. This is a clean algebraic degeneracy, not a boundary case: a
   support of degree exactly 1 makes `N_G[s]=\{v,s\}=H_v` as sets, so `R_v=H_v` and the term vanishes identically.
2. **Isolated vertices are never leaves**: on a 5-vertex graph with one edge (`0−1`) and three isolates (`2,3,4`),
   `leaves_of` returns exactly `\{0,1\}`; the three isolates (degree `0`, not `1`) are correctly excluded.
3. **`α(H_v) < α(G)−1` strict search**: 25 leaf instances across 4 structured families (star `K_{1,5}`, spider
   `[3,3,3]`, double broom `(5,5,3)`, a caterpillar) — **0 strict instances found**; `α(H_v)=α(G)−1` exactly in
   every case tested. This does **not** establish the bound is always tight (only an upper bound `≤α(G)−1` is
   claimed by the semantic contract, via `leaf_indep_cap`); I report the negative search result honestly as
   bounded (4 families, 25 instances), not as a universal claim.
4. **`k>a` companion, both extreme `W`** (`W=∅`, `W=`everything), `k=a+1..a+5`, 3 sample graphs (star, spider,
   double broom): **every** `(lhs, rhs)` pair is `(0, 0)` — `q_k=q_{k+1}=0` for all `k>a` confirmed directly (not
   merely `q_{a+1}=0`), reinforcing the registry-text-vs-Lean-text note under (TSB) above: the informal "`1≤k≤a`"
   restriction is a scoping convenience, not a precondition the raw inequality needs.

Report: `literal_attacks_report.json`, SHA-256 `570bc7937261c74b8c27882db2c21cf5d355df24c0bd9d455fbbdb70faa79d5a`.

## Companion identity: `q_j(H,W) = i_j(H) − i_j(H−W)`

Verified exhaustively, own instrument, every bipartite `H` to order 6, every `W`, every `j`: **2,395,020** exact
triples, **0 mismatches** (script run inline during this session; reproduced by the `q_j` computation embedded in
`gen_tsb.py`'s `q_table` plus a direct `i_j(H−W)` computation — the identity is exercised, not separately shipped
as its own generator file, since `gen_tsb.py` already recomputes both sides for every `(H,W)` pair it visits).

## Mechanism-equivalence with REFUTED keys (allocation item F1.e)

- **(HTP) vs `E993-BETA-TARGET` (β, REFUTED)**: per `C2-SCOPE-AUDIT.md` §2 (digest-verified above) and
  `CLAIM-IDENTITY.run-local.json`, the order-91 witness `T_22` (67 mutually independent original leaves, so
  `α≥67`) has `3p=102 < 135 ≤ 2α+1`, and the order-243 witness `T_60` (sixty 3-leaf stars, `α≥180`) has
  `3p=270 < 361 ≤ 2α+1` — **both refutation witnesses of (β) sit strictly below (HTP)'s guard**. This is
  consistency, not evidence for (HTP): I did not have the raw `T_22`/`T_60` graphs in my grant (they live in a
  different, non-frozen experiment root) so I could not recompute their leaf terms myself; I report the registry's
  own certificate arithmetic (`102<135`, `270<361`) as a citation, explicitly not as an independent recomputation.
- **(HTP) vs `E993-BETA-AGG-SUPPORT` (REFUTED)**: same `T_22` witness, same guard-exclusion argument
  (`C2-SCOPE-AUDIT.md` §2); the per-support aggregate refutation is likewise below the guard.
- **(TSB) vs `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` (REFUTED, "at most `r` addable vertices")**: these are
  different statements on their face — (TSB) bounds addable vertices by `2(a−k)` (both colour classes of a
  bipartite addable set), the refuted key bounds by `r` (a single, tighter, model-specific quantity on the
  governed G1 tuples) with no bipartite-colour-class structure invoked. `2(a−k)` is generally **larger** than a
  plausible `r=a−k`-style single-class bound, so (TSB)'s bound is the **weaker, more permissive** one — a
  statement refuted at a tighter bound is not automatically refuted at a looser one, and my exhaustive TSB
  results (56.6M triples, 0 failures, orders 1–7) are independent evidence that the looser `2(a−k)` bound itself
  holds throughout the tested range. `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`'s own registry entry carries no
  smallest-witness order or certificate text (`smallest_witness_order: None`, `certificate: None` — confirmed by
  direct read of `CLAIM-IDENTITY.run-local.json`), so I cannot cross-check a specific witness against (TSB); I
  record this as an open cross-check, not a settled one.

## Reconciliation with the controller's prior (allocation item F1.f)

Generator `gen_reconcile.py`, reading `control/controller-prerun/ht_report.json` **only** for this comparison (a
prior, never evidence, per shared rule and `C1-STAGE1-GATE.md` ruling 7).

| | Controller prior | F1 own instrument | Match |
|---|---|---|---|
| Bipartite labelled graph counts, `n=1..6` | `1,2,7,41,376,5177` | `1,2,7,41,376,5177` | **exact, all 6 orders** |
| Tree class counts, `n=1..12` | `1,1,1,2,3,6,11,23,47,106,235,551` | same | **exact, all 12 orders** |
| Controller's own reported failures (T1–T4) | `0,0,0,0` | — | consistent |
| F1's own reported failures (TSB, HTP, HTA, ELIG, TRN, HTP-tree, HTA-tree) | — | `0,0,0,0,0,0,0` | consistent |

**Total discrepancies: 0.** Report: `reconcile_report.json`, SHA-256
`d73eb45feb8398d112b8dd25128c72993fde45f289741c2805d4060731d587b9`.

## Alias check (candidate `E993-R29-HIGH-TAIL-BOUNDARY-RECORD`), lexical AND mathematical

**Lexical**: searched `CLAIM-IDENTITY.run-local.json`'s 407 `claim_key` strings for substrings `TOP-RANK`,
`TAGGED-SHADOW`, `HIGH-TAIL`, `NONRESIDUAL`, `NON-RESIDUAL`, `BOUNDARY`, `SHARP`, `GUARD`. Hits: `E993-G1-*`
(4 REFUTED guard-implication keys, about a completely different `GUARDS-IMPLY-*` mechanism), `E993-GRAPH-FIRST-
WIDE-SHARP-CLASSIFICATION`, `E993-GRAPH-D3-COVER-THRESHOLD-SHARPNESS`, `E993-C3-SR2-SINGLETON-BOUNDARY-WITNESS`,
`E993-R25-FOREST-*-SHARP*` (3 keys), `E993-R26-TOP-RANK-*` (3 keys, already named above as inputs), the two OPEN
TSB/HTP keys already named above. None states a sharpness question about the high-tail rank guard `3p≥2α+1` on
bipartite graphs or trees. **No lexical alias found.**

**Mathematical**: none of the matched keys' statements (read in full for each hit) concern the smallest-order
witness of a positive leaf term at `3p=2α` or `3p=2α−1`, nor a per-`α` threshold table for the pointwise high-tail
sign. `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`/`-SHARPENED` are about a completely different quantity
(`Δ_5(T)<0 ⇒ n≤bound`, a rank-5 forest order bound, r25's mechanism, not this run's). `E993-GRAPH-D3-COVER-
THRESHOLD-SHARPNESS` is about degree-3 vertex covers, unrelated. **No mathematical alias found.** The candidate
key `E993-R29-HIGH-TAIL-BOUNDARY-RECORD` (Solution Contract §1 Tier 2) is clean to register at synthesis's
discretion; the evidence backing it is this return's Boundary record section.

## Grades (Solution Contract §4)

| Claim (this route's evidence) | Grade |
|---|---|
| (TSB) survives every tested instance | `bounded_computation` (exhaustive to order 7, own instrument) |
| (HTP)/(HTA), including the `p=1` endpoint, survive every tested instance | `bounded_computation` (exhaustive to order 8, plus the DP-based adversarial families to `n≤6000`) |
| (ELIG), (TRN) survive every tested instance | `bounded_computation` (exhaustive to order 16, own instrument) |
| Guard sharpness on trees, `α=2..8` (gap exactly 1) | `bounded_computation`, explicit witnesses (`P_6` at `α=3`, `P_3` at `α=2`) |
| Guard sharpness on trees, `α≥9` | **unresolved** — horizon effect, explicitly not claimed |
| `α(H_v)<α(G)−1` (strict case exists?) | **unresolved** — 0/25 sampled instances, bounded search only |
| Mechanism-equivalence vs REFUTED keys | consistency check only (cited certificate arithmetic, not independently recomputed for `T_22`/`T_60`) |
| No claim in this return is asserted `proved`, `proved_informal`, `conditional`, or `formally_verified` — F1 produces **falsification-attempt evidence**, never a proof. A compiled internal lemma (entries 41–44 of the first-interior source) is cited by entry number only, never presented as a certificate (fence §3.8). |

## `headline_resolved: no`

## Route verdict

**`bounded_evidence`** — no counterexample to (TSB), (HTP), (HTA), (ELIG), or (TRN) was found across 56.6M +
37.6M + 2.5M + adversarial-family leaf/`p` instances (own instrument, independently validated against the
semantic contract's own fixed points and cross-reconciled with zero discrepancies against the controller's
prior); one clean boundary-sharpness finding was produced (guard sharp on trees for `α=2..8`; open for `α≥9`
within this route's horizon).

## Remaining obligation (successor inheritance)

1. **Guard sharpness for `α≥9` on trees is open.** This route's census stops at order 16; the smallest tree that
   is both TRN-eligible at a given `α≥9` and exhibits a near-boundary positive term may require substantially
   more than 16 vertices. A successor with either a larger exhaustive census (order 18–22, feasible: A000081
   growth is modest, ~600K rooted trees at `n=17`) or a targeted constructive search (not brute force) over
   caterpillar/path-like families specifically at each `α` is needed to extend or refute the "gap exactly 1"
   pattern found here.
2. **`α(H_v)<α(G)−1` strict-case search is a bounded negative result (0/25), not resolved.** A successor should
   either search a broader/larger family set or attempt a direct proof that equality always holds for a leaf
   (which, if true, is itself a small structural lemma worth naming as a Tier 3 companion per Solution Contract
   §1).
3. **The `T_22`/`T_60` guard-exclusion citations (mechanism-equivalence vs REFUTED keys) are cited, not
   independently recomputed** — I did not have those graphs in my grant. A route with access to
   `experiments/erdos-993-beta-remainder-dre-2026-09-06/` and `experiments/erdos-993-beta-aggregate-dre-2026-09-07/`
   (outside this run's frozen `sources/`) could recompute the exact leaf terms directly rather than trust the
   registry's certificate arithmetic.
4. **`E993-C3-G1-POINTWISE-ADDABILITY-BOUND`'s exact witness is unavailable** (`smallest_witness_order: None`,
   `certificate: None` in the run-local registry) — the TSB-vs-addability-bound distinctness argument in this
   return is structural (different bound magnitude, different model), not witness-checked. A successor with
   access to that key's original refutation run could close this.
5. **The candidate `E993-R29-HIGH-TAIL-BOUNDARY-RECORD` key is alias-clean and evidence-backed but unregistered**
   — registration is a synthesis decision (Stage 7 or a later cycle's synthesis step), not something F1 does.
6. **Order 8 TSB and order 9+ HTP/HTA bipartite exhaustive checks were not attempted** (order-8 TSB would need
   testing every `W∈2^8` per one of 2,922,446 graphs — roughly 750M `(H,W,k)` triples, well beyond this session's
   time budget at the per-triple cost observed). A successor with more compute budget or a smarter `W`-filtering
   strategy (e.g. only testing `W` up to symmetry) could extend TSB to order 8 and HTP/HTA to order 9.

## Rule discipline / minor disclosures

- One long job (`gen_htp_bipartite.py` to order 8, ~4 min) exceeded the harness's 120s foreground window and was
  moved to a background task **by the harness itself**, not by my own choice to detach; I polled its output file
  in a bounded loop (`until grep -q "SHA256(report" <output file>; do sleep 5; done`, wrapped in a 280s
  `timeout`) rather than passively awaiting a notification, and read the completed output only after the loop's
  own exit. A second job (`gen_adversarial.py`, first attempt, before I bounded the per-family leaf sample) was
  similarly moved to background after exceeding its exhaustive-leaf-loop budget (an `O(n)`-per-leaf cost on a
  4000-leaf family, unbounded); I stopped it with the harness's `TaskStop` tool by its task id (not a PID-listing
  kill) once I recognized the cost bug, then fixed the generator to sample leaves (documented explicitly per
  family as `sampled`/`leaves_sampled` fields) and re-ran successfully in the foreground.
- One `pgrep -f "gen_htp_bipartite.py 8 htp_report_n8.json"` lookup was run to locate the backgrounded job's PID
  before I recognized this search string appears in the target command line (as intended) but could, per the
  rule "never `pgrep -f` a pattern your own command line contains", also self-match the wrapping invocation; the
  result (two PIDs) was **not used** for anything (no `kill` was issued from it) — I switched to output-file
  polling for the actual wait. Disclosed per the shared rule rather than omitted.
- No `pip`/network use, no `/tmp` or `mktemp` writes (one write attempt to a stray non-scratch path failed with
  a read-only-filesystem error and was abandoned, never retried outside the grant), no full process listing, no
  `lake`/`lean`/`elan` invocation (this route does no Lean work).
- Every background job was finished and its output collected before this file was written; none is still running.

## Replay (copy-out-first; every generator, every digest)

All five generators and the shared library live in
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-F1-replay/`.
To replay from scratch, copy the whole directory to a fresh working directory and run, in order:

```
python3 gen_tsb.py 7 tsb_report_n7.json
python3 gen_htp_bipartite.py 8 htp_report_n8.json
python3 gen_trees.py 16 trees_report_n16.json
python3 gen_adversarial.py adversarial_report.json
python3 gen_literal_attacks.py literal_attacks_report.json
python3 gen_reconcile.py reconcile_report.json   # requires control/controller-prerun/ht_report.json readable at its fixed run-root path
```

Every script computes exact integers only (no floats, no wall-clock/PID/host fields hashed into any report body)
and prints its own `SHA256(report body without this field)` line, matching the table below:

| Script | SHA-256 |
|---|---|
| `f1lib.py` | `5f41fd4f0fdad1880e580465b55a8112aab5d0a928af5aeb17a0ab6931e54a1e` |
| `gen_tsb.py` | `086dddd06b53ce1826483703edd7b516c03903da8cac5b8379b4d8419470b8b5` |
| `gen_htp_bipartite.py` | `2850717272d48d9367796d2e8110ab26958135b03d8a9291e5c4711028a325ce` |
| `gen_trees.py` | `c0a742afdb93a25f1d8a8e8fc0ed8e95cc20e742cee221dad3820fb4ddeefb49` |
| `gen_adversarial.py` | `8d4a674dd8a8e1cec7ee54f0e52e75ff95bedcb9fdd1d6cb05e76a3db8c87740` |
| `gen_literal_attacks.py` | `b96e6f010d3c885a0af934be1236ff2b35a057272d691455ca30173ebac067a1` |
| `gen_reconcile.py` | `0f42d15b089788dc713b91db81f0c803edab62041c6461debf8e508f22bbf011` |

| Report | SHA-256 (of report body without the digest field) |
|---|---|
| `tsb_report_n7.json` | `4f98c745ccf6531842474f6ec0d2b2607d42868821b7649ee2fdbf34a29158a8` |
| `htp_report_n8.json` | `03ecf220e3bffe3f5455a0f02a4ee64929331fc39dcad9bf7209110740c98a56` |
| `trees_report_n16.json` | `ea2cba4b4a688e3045087fdb3752aee9a8d070ae49d7a901d4f68360fb13d6fb` |
| `adversarial_report.json` | `201d3ab812cbf3cf46eb55b9aa8eebe4be9d03ba1eac94273263025feebd69dd` |
| `literal_attacks_report.json` | `570bc7937261c74b8c27882db2c21cf5d355df24c0bd9d455fbbdb70faa79d5a` |
| `reconcile_report.json` | `d73eb45feb8398d112b8dd25128c72993fde45f289741c2805d4060731d587b9` |

No writes occurred under `sources/`, any other experiment root, or `/tmp`. All scratch and all replay artifacts
are under this run's `scratchpad/c1-F1/` (unused — all work fit under the replay directory) and
`scratchpad/c1-F1-replay/` as required.
