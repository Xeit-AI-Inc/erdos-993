# RETURN — Route `C1-T-02 TOP-RANK-NONRESIDUAL-COROLLARY`, mechanism fingerprint `TOP-RANK-NONRESIDUAL-COROLLARY`

Cycle 1, Stage 3, seat `T2`, r29 (`erdos-993-math-dre-20260925-r29-high-tail-certification`). Object: Target 4
(TRN), the non-residual eligible top-rank corollary, plus its low-α audit, relation to r26, region scope note for
`E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, alias check, and a draft `THEOREM-CONTRACT.yaml` for `LA4`
(`C1-ALLOCATION.md`, "Mechanism fingerprints and load-bearing obligations", item 2).

## IMPORT LIST

Every script in this return uses the Python 3 standard library only, no network, no package installs:

- `census_gen.py` — `itertools`, `sys`.
- `census_analyze.py` — `hashlib`, `json`, `sys`, `time`, plus this run's own `census_gen`.
- Manifest/seal verification one-liners in this return — `json`, `hashlib`.

No `numpy`, no `sympy`, no `networkx`. All arithmetic is exact Python `int` (arbitrary precision); no floats appear
in any reported quantity.

## Boot acknowledgment

Booted VerityOS by reading EXACTLY the two authorized files and nothing else from VerityOS root: `verity.md` and
`identity/startup-protocol.md`. No other VerityOS file (memory, conversations, modules, skills, logs, decisions) was
read — the controller has booted for the run. **Read-boundary disclosure: none.**

## Two-part model disclosure

Chartered Claude Sonnet 5, xhigh. Transport-resolved model: sonnet (explicit parameter). Runtime-reported model id
(verbatim, as stated to this seat by its own harness system prompt): `claude-sonnet-5` ("You are powered by the
model named Sonnet 5. The exact model ID is claude-sonnet-5.").

## Seal and digest verification

**Stage 2 packet seal.** Recomputed SHA-256 over the canonical JSON of `control/C1-STAGE2-PACKET-MANIFEST.json`
with `seal_sha256` removed (`json.dumps(data, sort_keys=True, separators=(",",":"))`, UTF-8, no trailing newline):

```
stated seal_sha256: 58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e
computed sha256   : 58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e
MATCH
```

**Every file this route read**, re-hashed against `control/C1-STAGE2-PACKET-MANIFEST.json`'s own per-file table
(for control-root files) or `control/SOURCE-DIGESTS.json` (for `sources/` files and
`control/CLAIM-IDENTITY.run-local.json`) — all 15 MATCH, none MISMATCH:

| File | Digest check |
|---|---|
| `AUTHORIZATION.md` | MATCH |
| `SEMANTIC-CONTRACT.md` | MATCH |
| `SOLUTION-CONTRACT.md` | MATCH |
| `control/R29-CHARTER-PROMPT.md` | MATCH |
| `control/C1-ALLOCATION.md` | MATCH |
| `control/C1-STAGE1-GATE.md` | MATCH |
| `control/C1-WORKER-COMMON-BRIEF.md` | MATCH |
| `control/RESIDUE-CHECK.json` | MATCH |
| `control/SOURCE-DIGESTS.json` | MATCH (self) |
| `cycles/cycle-1/stage2/ROUTE-STATE.md` | MATCH |
| `control/CLAIM-IDENTITY.run-local.json` | MATCH (`97abd89e…82`) |
| `sources/first-interior/records/FINAL-ANALYSIS.md` | MATCH |
| `sources/first-interior/records/C2-SCOPE-AUDIT.md` | MATCH |
| `sources/r26/c1-la1-top-rank-residual-sign/THEOREM-CONTRACT.yaml` | MATCH |
| `sources/r26/c1-la1-top-rank-residual-sign/INFORMAL-PROOF.md` | MATCH (header/§0–§2 read) |
| `sources/r26/c1-la1-top-rank-residual-sign/VERIFICATION-REPORT.md` | MATCH |

No other file was read. `control/RESIDUE-CHECK.json` was reviewed: every hit is this run's OWN control files citing
r26/r24/r27/r28 identities that are legitimate inputs to r29 (e.g. `E993-R26-TOP-RANK-RESIDUAL-SIGN` named in
`C1-ALLOCATION.md`), not leaked predecessor scaffolding; no finding required action.

Mathlib was consulted, read-only, for one declaration's exact location (API meaning only, per grant): a targeted
`grep` confined to `…/mathlib-v4.32.2-project/.lake/packages/mathlib/Mathlib/Combinatorics/SimpleGraph/` (within
the granted Mathlib package directory, not a listing rooted above any grant) located
`lemma IsTree.isBipartite (hG : G.IsTree) : G.IsBipartite` at
`Mathlib/Combinatorics/SimpleGraph/Acyclic.lean:598`, and `lemma IsAcyclic.isBipartite (hG : G.IsAcyclic) :
G.IsBipartite` at the same file, line 617 — confirming that bipartiteness follows from **acyclicity alone** (the
`IsAcyclic` route exists as a separate lemma), not from connectivity.

## Registered claims named (before any census)

Per shared rule 3 and this brief's requirement to name every registered claim touched before presenting census
evidence:

| Claim key | Status entering r29 | Role in this route |
|---|---|---|
| `E993-R26-TOP-RANK-RESIDUAL-SIGN` | VERIFIED | Input; compared against (never re-proved, never re-registered, never widened) — obligation (c). |
| `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` | VERIFIED | Input; the sibling award at `p = α − 2`, cited for form comparison only — never re-proved. |
| `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | OPEN | Scope-noted, not attacked — obligation (d). |
| `E993-BETA-TARGET` | REFUTED | Distinguished (different carrier: governed `RTree`, not ordinary bipartite/tree) — obligation (e). |
| `E993-BETA-AGG` | OPEN | Distinguished (governed `RTree`, not ordinary) — obligation (e). |
| `E993-BETA-AGG-SUPPORT` | REFUTED | Distinguished (governed `RTree`, support-fibre form, not ordinary) — obligation (e). |
| `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` | REFUTED | Distinguished (bounds addable vertices by `r`, not `2(a−k)`; not this route's statement) — obligation (e). |
| `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` | OPEN | Distinguished (Target 3, a guard concluding `α ≥ 7`, not an aggregate sign; T1's object) — obligation (e). |
| `E993-BIPARTITE-TAGGED-SHADOW-BOUND` (TSB) | OPEN | Cited as the mechanism's base lemma (entry 41, compiled-internal, unawarded) — never presented as a certificate. |
| `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` (HTP) | OPEN | Cited as this route's load-bearing dependency's own dependency (entry 42/44, compiled-internal, unawarded). |
| `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` (HTA) | New run-local, OPEN | This route's DIRECT load-bearing dependency — obligation (e), candidate entry drafted below. |
| `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` (TRN) | New run-local, this route's object | Obligation (a)–(f). |

`E993-R24-*` (`TOP-RANK-SELECTOR-COLLAPSE`), named parenthetically in `C1-ALLOCATION.md`'s alias-check instruction,
does **not** resolve to any `claim_key` or alias in `control/CLAIM-IDENTITY.run-local.json` (queried programmatically,
§5 below): no claim under that literal name exists. The only `R24`-attributed alias found anywhere in the registry
is `E993-R24-RC` / `r24 (RC)`, both aliases **of `E993-R26-TOP-RANK-RESIDUAL-SIGN` itself** (its own r24-era proposal
name, before the r26 award). This is reported as a finding, not a boundary violation: no file outside the grant was
read to establish it.

## 1. The exact statement and its informal proof — obligation (a)

**Statement (`SOLUTION-CONTRACT.md` §2, `topRankNonResidualAggregate`).** For every finite ordinary tree `T`
(`hT : G.IsTree`) with `p = α(T) − 1` (`ℕ`; `hEligible : crossingIndex G + 2 ≤ G.indepNum − 1`):
`aggregate G (G.indepNum − 1) ≤ 0`, i.e. `S(T, p) ≤ 0`.

**Derivation, step by step, naming where each hypothesis enters.**

1. `hEligible` reads `x(T) + 2 ≤ α − 1` in `ℕ`. Since `x(T) : ℕ` so `x(T) ≥ 0`, this forces `α − 1 ≥ 2` in `ℕ`.
   Because `T` is nonempty (`hT.nonempty`, supplied by `IsTree`'s **connectivity** clause — a connected graph is
   nonempty by Mathlib convention — **not** by acyclicity), `α = G.indepNum ≥ 1` always, so the `ℕ` subtraction
   `α − 1` is honest (no truncation): `α − 1 ≥ 2 ⟹ α ≥ 3`. **`hEligible` enters here**, and **only the `Nonempty`
   half of `hT` enters here** (not acyclicity, not the full tree structure) — this is the answer to the obligation's
   question "where does `IsTree` — connectivity vs acyclicity — enter?" for this first step.
2. Suppose `α = 3`. Then `hEligible` becomes `x + 2 ≤ 2`, i.e. `x = 0` (since `x ≥ 0` in `ℕ`). By definition
   `crossingIndex G = 0` means `Δ_0(G) < 0`, i.e. `i_1(G) − i_0(G) < 0`. For **any** finite nonempty simple graph
   (tree or not — this fact uses only `Nonempty`, not `IsTree` at all): `i_1(G) = n` (every single vertex is an
   independent 1-set; a simple graph has no self-loops) and `i_0(G) = 1` (the empty set), so `Δ_0(G) = n − 1`. Since
   `n ≥ 1` (nonempty), `Δ_0(G) = n − 1 ≥ 0`, contradicting `Δ_0(G) < 0`. So `α ≠ 3`.
3. Combining steps 1–2: `α ≥ 3` and `α ≠ 3` give `α ≥ 4`. Hence `p = α − 1 ≥ 3`.
4. `p ≥ 3 ≥ 2`, so the internal helper's hypothesis `hp : 2 ≤ p` (entry 44, `bipartiteHighTailAggregate`) is
   satisfied — **`p = 1` never arises under `hEligible`'s own force**; the `p = 1` endpoint (T1's separate obligation
   for `HTP`/`HTA`'s own full-range certificates) is irrelevant to TRN's actual domain. This is a sharpening worth
   recording on TRN's face: TRN's dependency on the high-tail mechanism is entirely within the **already
   kernel-checked** `p ≥ 2` region (entry 44), not the still-open `p = 1` endpoint.
5. The rank guard: `3p ≥ 2α + 1 ⟺ 3(α − 1) ≥ 2α + 1 ⟺ 3α − 3 ≥ 2α + 1 ⟺ α ≥ 4` — an **iff**, not just a
   sufficient direction; equality (`α = 4 ⟹ 3p = 9 = 2α+1`) is the tight boundary case. Since step 3 gave `α ≥ 4`
   exactly, the guard holds (with equality possible at `α = 4`). **`α ≥ 4` (steps 1–3) enters here.**
6. `T` is bipartite: `hT.isBipartite` (Mathlib `SimpleGraph.IsTree.isBipartite`, `Acyclic.lean:598`) — this uses
   **acyclicity**, confirmed independently derivable from acyclicity alone via the companion lemma
   `IsAcyclic.isBipartite` (`Acyclic.lean:617`), so **acyclicity, not connectivity, is what supplies `hBip`** for
   this route — the complementary half of the "connectivity vs acyclicity" question to step 1's answer.
7. With `hBip`, `hp : 2 ≤ p` and `hTail : 2α + 1 ≤ 3p` all discharged, entry 44
   `E993Interior.bipartiteHighTailAggregate` (compiled internal, unawarded — cited by entry number and fragment
   digest `b7ee9d1a…3` per `control/SOURCE-DIGESTS.json`, never presented as a certificate, fence §3.8) — or
   equivalently the registry-scope corollary `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` (HTA) once it has its own
   certificate — gives `C5LA1.aggregate G p ≤ 0`, i.e. exactly `S(T, α − 1) ≤ 0`. **This is the conclusion.**

No `ℕ`-subtraction in this derivation is left unguarded: `α − 1` is guarded by `α ≥ 1` (step 1, from `Nonempty`);
`p − 1` never appears in TRN's own statement (only inside HTA/HTP's internal machinery, T1's territory); `2(a−k)`
and `a − k` inside TSB/HTP are guarded there, not here. No cast is silently dropped: every comparison above (`x+2≤α−1`,
`3p≥2α+1`) is stated and checked as an honest integer statement given `α ≥ 1`.

## 2. Low-α exhaustive census at `p = α − 1` — obligation (b)

**Own instrument**, standard library only, two files under `scratchpad/c1-T2/` (copied byte-identically into the
replay directory below):

- `census_gen.py` — a canonical free-tree generator via the classical **centroid theorem** (every tree has 1 or 2
  centroids; a vertex is a centroid iff every branch at it has `≤ ⌊n/2⌋` vertices; two centroids occur iff `n` is
  even and some branch has size exactly `n/2`). Rooted trees are generated by a grouped-by-size-class multiset
  recursion over an AHU canonical form (`tuple(sorted(children))`); free trees are then assembled as
  single-centroid rooted trees (root's branches all `≤ ⌈n/2⌉ − 1`) or, for even `n`, unordered pairs of rooted trees
  of size `n/2` joined by an edge. **Every** materialized object is checked by `is_tree` — an **acyclicity-and-
  connectivity test** (`edges == n−1` AND single-component BFS) — never assumed; the self-check log below reports
  `non-tree-objects=0` at every order.
- `census_analyze.py` — an exact polynomial (generating-function) tree/forest DP for `i_k`, hence `Δ_k`, `α`, `x`,
  applied to the whole tree and to every induced-subgraph deletion (`H_v`, `R_v`, `T − v`) needed for `S(T,p)`. Every
  count is an exact Python `int`; no census value from any prior run enters the computation (own instrument, from
  first principles, reconciled with A000055 only as a self-check on the generator).

**Reconciliation of the generator against A000055 (own self-check, `census_gen.py`'s `__main__`), orders 1–16 —
ALL MATCH, zero non-tree objects at any order:**

```
n= 1  generated=    1  expected(A000055)=    1  MATCH=True  non-tree-objects=0
n= 2  generated=    1  expected(A000055)=    1  MATCH=True  non-tree-objects=0
n= 3  generated=    1  expected(A000055)=    1  MATCH=True  non-tree-objects=0
n= 4  generated=    2  expected(A000055)=    2  MATCH=True  non-tree-objects=0
n= 5  generated=    3  expected(A000055)=    3  MATCH=True  non-tree-objects=0
n= 6  generated=    6  expected(A000055)=    6  MATCH=True  non-tree-objects=0
n= 7  generated=   11  expected(A000055)=   11  MATCH=True  non-tree-objects=0
n= 8  generated=   23  expected(A000055)=   23  MATCH=True  non-tree-objects=0
n= 9  generated=   47  expected(A000055)=   47  MATCH=True  non-tree-objects=0
n=10  generated=  106  expected(A000055)=  106  MATCH=True  non-tree-objects=0
n=11  generated=  235  expected(A000055)=  235  MATCH=True  non-tree-objects=0
n=12  generated=  551  expected(A000055)=  551  MATCH=True  non-tree-objects=0
n=13  generated= 1301  expected(A000055)= 1301  MATCH=True  non-tree-objects=0
n=14  generated= 3159  expected(A000055)= 3159  MATCH=True  non-tree-objects=0
```
(orders 15, 16 independently checked too: generated 7741 and 19320, both MATCH A000055; dispatch requires order
`≥ 14`, this route ran to order 16.)

**Fixed points reproduced first** (own instrument, before any table, cross-checked against `SEMANTIC-CONTRACT.md`
§2's stated values): `K_2` leaf term at `p=1` is `0` (computed: `H_v=R_v=∅`, `Δ_0(∅)=−1` both sides, term `0`);
`P_3` leaf term at `p=2` is `−1` (computed: `Δ_1({single vertex})=−1`, `Δ_1(∅)=0`, term `−1`); star `K_{1,m}`
(`m=2..6`) leaf term matches `C(m−1,p) − C(m−1,p−1)` exactly for every `p ≥ 2` tested, and at `p=1` matches the
general `deg_G(s) − 1 = m − 1` formula (NOT the `p≥2` binomial simplification, since `Δ_0(∅) = −1 ≠ 0`, exactly the
reason `SEMANTIC-CONTRACT.md` §2 flags `p=1` as needing the general-graph formula, not the star's own `p≥2` closed
form) — all fixed points independently reproduced by exact computation, matching the semantic contract's stated
values digit for digit.

**Census result (`x`, `Δ_k`/`S`, `α` and the graph on every reported row below), orders 1–16, `p = α(T) − 1` on
every tree:**

| order `n` | trees (A000055) | eligible (`x+2≤p`) |
|---:|---:|---:|
| 1–6 | 1,1,1,2,3,6 | 0,0,0,0,0,0 |
| 7 | 11 | 4 |
| 8 | 23 | 6 |
| 9 | 47 | 27 |
| 10 | 106 | 90 |
| 11 | 235 | 217 |
| 12 | 551 | 502 |
| 13 | 1301 | 1301 |
| 14 | 3159 | 3156 |
| 15 | 7741 | 7741 |
| 16 | 19320 | 19320 |

**Totals, orders 1–16: 32,508 trees, 32,364 eligible at `p = α − 1`.**

**Eligible set broken down by `α` (every `α` that occurs, orders 1–16 combined):**

| `α` | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| count | 3 | 135 | 877 | 4068 | 10794 | 10594 | 4644 | 1082 | 152 | 14 | 1 |

**`alpha ≤ 3` among eligible trees: 0 occurrences, at every order 1–16 — confirms the obligation's required check
directly and exhaustively over this range** (not just consistent with the derivation of §1 — it is the same claim,
checked by an independent method).

**`S > 0` among eligible trees (a would-be TRN counterexample): 0 occurrences.** Maximum `S` among all 32,364
eligible trees is `−12` (never `0`, i.e. no eligible tree in this range is tight) — over `int`, exact, no float
anywhere.

**Non-vacuity witness, the smallest eligible tree (order 7, `α=5`, `x=2`, `p=4`):** edges
`{(0,1),(0,4),(1,2),(1,3),(4,5),(4,6)}` — a "double claw" (0 is the connector; 1 and 4 each carry two pendant
leaves). Leaves `{2,3,5,6}`, all favorable, terms `{2:−3, 3:−3, 5:−3, 6:−3}`, `S = −12`. A second witness at order
8 (`α=6`, `x=3`, `p=5`): favorable `{1,2,3,4,7}`, terms `{1:−5,2:−5,3:−5,4:−5,7:−3}`, `S=−23`.

**Honest tightness note (do not overclaim):** the derivation of §1 proves `α ≥ 4` as a *necessary* consequence of
eligibility; it does not claim `α = 4` is *achieved*. The census shows the minimum `α` actually occurring among
eligible trees to order 16 is **5**, not 4 — no witness at `α = 4` exists in this range. This is reported as an
empirical finding about the guard's tightness, not a gap in the proof (the proof only asserts `α ≥ 4`).

**Incidental reconciliation (not evidence — the controller's pre-run instrument is explicitly a prior per Stage 1
Gate Ruling 7 and `SOLUTION-CONTRACT.md` §5).** `SEMANTIC-CONTRACT.md` §2 cites, as a controller prior, "846 at
`p = α − 1`" for trees of order `≤ 12`. This route's own, independently-derived instrument gives, for orders 1–12:
`4+6+27+90+217+502 = 846` — numerically identical. This is reported as an incidental cross-check on a number this
route derived itself from first principles, never as citing the prior as evidence. One discrepancy IS worth flagging
plainly: the same prior text cites "976 classes" for trees of order `≤ 12`, but the correct A000055 partial sum
(and this route's own generator, self-verified above) is `1+1+1+2+3+6+11+23+47+106+235+551 = 987`, not 976. This
route did not use the prior's "976" figure anywhere and flags the mismatch for the record; per the stop-gate rules
this is not evidence of anything mathematical, only a note that the cited prior total is not internally consistent
with A000055 — reconciling scattered prior figures in general is F1's obligation, not this route's, so no further
attack on it is made here.

**Reproducibility — copy-out-first replay.** Both scripts were copied byte-identically into
`scratchpad/c1-T2-replay/` and re-run there from scratch (never `/tmp`, never in place):

```
mkdir -p /Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-T2-replay
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-T2/census_gen.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-T2/census_analyze.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-T2-replay/
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-T2-replay
python3 census_gen.py                              # reconciles A000055, orders 1-16
python3 census_analyze.py 16 census_result.json     # runs the full census, foreground, ~1-2s
```

Ran in the foreground both in the primary scratch directory and independently in the replay directory; both runs
produced the byte-identical digested result (no wall-clock, PID or host field is written into the digested JSON —
elapsed time is reported on a separate, non-digested stdout line):

- `census_gen.py` SHA-256: `7352d946688f3cf81925e34a7b50487261cbcbd0188fd2d33ed765b6c9a4fb3a`
- `census_analyze.py` SHA-256: `73c94c150c35001325e5870c8393e49ce6e875534a3cd5e027e3a709f33fb264`
- `census_result.json` SHA-256 (**identical** in both the primary run and the independent replay run):
  `3b32e2a5c0973c03990fd499e9e4f2c0ba990dc7e7067e39e26e81a3e2621460`

No background job was used anywhere in this route: both scripts ran to completion in the foreground (total wall
time ≈ 1.1s for the order-1..16 census); nothing was detached, nothing was polled by PID, no `pgrep`/full process
listing was run.

## 3. Relation to r26's `topRankResidualSign` — obligation (c)

r26's four hypotheses (`sources/r26/c1-la1-top-rank-residual-sign/THEOREM-CONTRACT.yaml`, `hypotheses`; confirmed
verbatim against `INFORMAL-PROOF.md` §0's Lean block):

1. `hyp-tree` — `G.IsTree`.
2. `hyp-alpha` — `2 ≤ G.indepNum`.
3. `hyp-eligible` — `crossingIndex G + 2 ≤ G.indepNum − 1` — **identical text to TRN's own `hEligible`.**
4. `hyp-residual` — `(★)`: every leaf of `G` belongs to every maximum independent set of `G`.

Conclusion: `aggregate G (G.indepNum − 1) ≤ 0` — **identical conclusion to TRN's.**

**TRN drops hypotheses 2 and 4** (`hAlpha`, `hResidual`) and keeps only `hTree` + the identical `hEligible`; §1
step 3 shows TRN's own derivation gets `α ≥ 4` anyway, so `hAlpha : 2 ≤ α` becomes logically redundant under TRN's
hypotheses (a strictly stronger fact than `hAlpha` is derived, not assumed) — it is not merely dropped-and-unused,
it is dropped-and-superseded. `hResidual` (★) is dropped with **no replacement**: TRN's mechanism never inspects
whether leaves lie in every maximum independent set.

**The mechanism differs, not just the hypothesis list.** r26's proof (`INFORMAL-PROOF.md` §0–§2, and its
`formulation_status.evidence`) composes the base award `(RI)` (`C5LA1.topRankResidualIdentity`, the identity
`S = ℓ·M − W`) with an exact **budget identity** on the top shell `I_{α−1}(G)`, a **three-family classification**
(`famI`/`famII`/`famIII`) obtained by **forced-neighbour pruning under `(★)`** (`forced_neighbour`,
`maxIndep_no_support`, `max_indep_eq_leaf_union_D` — every one of these is stated "`(★)` alone" or "`hyp-tree`,
`hyp-alpha`, `(★)`" in the informal proof's own hypothesis attributions), finishing via
`S ≤ −ℓ(ℓ−2)M − (ℓ−4)N₂ ≤ 0` in three branches on `ℓ = |leafSet|`. This is a **global, residuality-dependent
counting argument specific to rank `α−1`.**

TRN/HTA's mechanism (§1 above; entry 41/42/44) is the **tagged-shadow double count**: a per-leaf, per-rank local
sign bound (`k·q_{k+1} ≤ 2(a−k)·q_k`) valid **uniformly across the whole high-tail region `3p ≥ 2α+1`**, requiring
no residuality, no leaf-union structure, no budget/family classification at all. These are two structurally
unrelated proofs of hypothesis-nested statements that happen to coincide at rank `α − 1` once residuality is added
back.

**Scope-note text for `E993-R26-TOP-RANK-RESIDUAL-SIGN` (status unchanged, VERIFIED):** r26's award remains the
proof of record on the eligible **residual** tree class at rank `α − 1`; it is never re-proved, re-registered, or
edited (fence `SOLUTION-CONTRACT.md` §3.2, Stage 1 Gate Ruling 3). `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` is
registered as an independently mechanised, strictly more general statement at the same rank (same conclusion,
strictly fewer hypotheses): once TRN has its own certificate, r26's theorem becomes derivable as an immediate
corollary of TRN (drop `hResidual`, apply TRN, note the extra hypotheses were unused) — but this run does **not**
perform, claim, or register that derivation; it is recorded here only as an observation for a successor, and r26's
own certificate stands unchanged and independently as the historical proof of record.

## 4. Region scope note for `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — obligation (d)

`E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN): "For every finite ordinary tree `T` and every natural
`p ≥ x(T)+2`, `S(T,p) ≤ 0`" — **every** eligible rank, not just `p = α−1`.

`(HTA)` (`E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE`, once certified) closes this for every eligible `p` satisfying
`3p ≥ 2α+1`, on **every** finite bipartite graph — trees are bipartite (`hT.isBipartite`, §1 step 6), so this
applies to every ordinary tree without needing eligibility at all for HTA's own hypotheses (HTA's only hypotheses
are `hBip`, `p ≥ 1`, `3p ≥ 2α+1` — eligibility `x+2≤p` is not among them). TRN is the single-rank case `p = α−1`
of this, now proved to *always* fall inside HTA's guarded region whenever it is eligible at all (§1 steps 3–5).

**The precise remaining open region for `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, stated exactly (not
attacked, fence `SOLUTION-CONTRACT.md` §3.3):**
```
{ p : ℕ | x(T) + 2 ≤ p  AND  3p < 2·α(T) + 1 }
```
i.e. eligible ranks strictly below the high-tail guard. This region is nonempty in general (`SEMANTIC-CONTRACT.md`
§2 records a positive-term witness at `3p = 2α` from order 5), is explicitly fenced (Astra's proposed parallel
experiment; `AUTHORIZATION.md` "Scope and coordination"), and is not touched, tested, or narrowed by anything in
this return.

## 5. Alias check — lexical AND mathematical — obligation (e)

Queried `control/CLAIM-IDENTITY.run-local.json` (407 claims; digest verified above) programmatically for every
`claim_key` under the prefixes `E993-R26-`, `E993-R24-`, `E993-R23-`, `E993-BETA-`, `E993-INTERIOR-`, plus a full-text
search for "COLLAPSE"/"SELECTOR" across every claim's statement and alias list (19 prefix matches + 0 text-search
matches beyond the prefix set; see the "Registered claims named" table above for the full match list with status).

### `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` (TRN)

- **vs `E993-R26-TOP-RANK-RESIDUAL-SIGN`** (VERIFIED). Lexically: deliberately antonymic
  (`NONRESIDUAL` vs `RESIDUAL`) at the same "TOP-RANK-…-AGGREGATE/SIGN" root — not a lexical collision, the
  antonym is intentional. Mathematically: **not an alias** — different hypothesis sets (r26 requires `hAlpha`,
  `hResidual`; TRN requires neither), so they are logically distinct universally-quantified statements even though
  one entails the other on the residual sub-domain (§3).
- **vs `E993-R24-*` (`TOP-RANK-SELECTOR-COLLAPSE`)**. No such `claim_key` or alias exists in the registry (see
  "Registered claims named", above) — nothing to check against; the only `R24`-tagged alias present anywhere is on
  `E993-R26-TOP-RANK-RESIDUAL-SIGN` itself.
- **vs `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`** (OPEN). Lexically distinct. Mathematically: TRN is the
  single-rank (`p = α−1`) restriction of R23's all-eligible-ranks universal claim — **not an alias** (different
  quantifier scope: `∃`-fixed rank vs `∀`-ranks), and TRN's own certificate would resolve only one rank of R23, not
  R23 itself (§4).
- **vs `E993-BETA-TARGET`/`E993-BETA-AGG`/`E993-BETA-AGG-SUPPORT`**. Different carrier entirely: the governed
  `RTree` model with `k_A`, `b_v`, `Bgen_s`, `a_v(p)` (registry statement text, quoted verbatim above) vs TRN's
  ordinary `SimpleGraph`/`IsTree` carrier with `Δ_{p−1}(H_v)`, `Δ_{p−1}(R_v)`. No shared vocabulary beyond English
  words ("leaf", "support", "aggregate"); **not aliases**, and REFUTED status is correctly never at risk of
  regressing onto TRN (`E993-BETA-TARGET`/`E993-BETA-AGG-SUPPORT` stay REFUTED at their exact governed scopes,
  fence `SOLUTION-CONTRACT.md` §3.4).
- **vs `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`** (VERIFIED). Same summand form, same non-residual character
  (Interior's own registered statement has no residual hypothesis either), but a **different rank**
  (`p = α−2`, not `α−1`) — a genuinely different universally-quantified statement, not an alias, though
  mechanism-related (§3's tagged-shadow family covers both once HTA is certified; Interior's own award used
  entries 41–44 directly under its own `ELIG`-strength guard `α ≥ 7`, a strictly stronger eligibility guard than
  TRN needs, since TRN's own derivation only forces `α ≥ 4`, not `≥ 7`).
- **vs `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN`** (OPEN). Different conclusion type (`7 ≤ α`, a guard, vs
  `S ≤ 0`, a sign) — not comparable in form, not an alias.
- **vs `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`** (REFUTED). Bounds "addable vertices ≤ r" for full G1 tuples — an
  unrelated statement to TRN specifically (relevant to TSB's own alias check, already recorded by the C2 scope
  audit, `sources/first-interior/records/C2-SCOPE-AUDIT.md` §1); not touched by TRN's own statement at all.

### `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` (HTA)

- **vs `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`** (HTP, OPEN). HTA is the **aggregate** (summed over the
  favorable-selected subset of leaves) of HTP's **pointwise** (every leaf, unconditionally) sign — related by direct
  summation (any subset of a family of `≤0` terms sums to `≤0`), explicitly named as "Target 2's corollary, on the
  same face" (`SOLUTION-CONTRACT.md` §1) — **not an alias** (different quantifier: pointwise over every leaf vs a
  selected sum).
- **vs `E993-BIPARTITE-TAGGED-SHADOW-BOUND`** (TSB, OPEN). Different object: a raw counting inequality on `q_j`,
  no leaf/tree structure — the base lemma HTP/HTA's proof is built on, not the same statement.
- **vs `E993-R26-*`/`E993-R23-*`/`E993-BETA-*`/`E993-INTERIOR-*`**: HTA quantifies over **every finite bipartite
  graph** (not just trees), with **no** eligibility, residual, or governed-carrier hypothesis — broader in graph
  class than every tree-only key above, narrower in rank than R23's all-eligible-ranks claim; not an alias of any
  of them.

### Candidate registry entries (drafted, not registered — registration is a controller/Stage 7 act)

```
claim_key: E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE
statement: >
  For every finite ordinary tree T with p = alpha(T) - 1 (natural), if x(T) + 2 <= p then
  the favorable-original-leaf aggregate S(T, p) = sum over v in F_p(T) of
  [Delta_(p-1)(T-{v,s_v}) - Delta_(p-1)(T-N_T[s_v])] is <= 0. No residual hypothesis, no
  hAlpha (2<=alpha) hypothesis; derives alpha>=4 internally.
scope: ordinary finite trees only; rank fixed at p = alpha - 1 (top rank); non-residual.
status: OPEN (this run's proposal; not yet formally_verified)
aliases: []
fences:
  - does not widen, re-register, or edit E993-R26-TOP-RANK-RESIDUAL-SIGN
  - does not close E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE (one rank only)
  - not an alias of any E993-BETA-* key (different carrier)
  - depends on E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE (HTA) at p>=2 only (p=1 never arises)
```

```
claim_key: E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE
statement: >
  For every finite bipartite simple graph G and every integer p >= 1 with 3p >= 2*alpha(G)+1,
  the favorable-original-leaf aggregate S(G,p) <= 0 (original strict selector, one tag per
  original leaf; no eligibility, residual or connectivity hypothesis).
scope: all finite bipartite simple graphs; rank range 3p >= 2*alpha+1; corollary of HTP.
status: OPEN (this run's proposal; not yet formally_verified; p>=2 compiled-internal at entry 44)
aliases: []
fences:
  - not an alias of E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE (aggregate, not pointwise)
  - does not transfer to RTree/E993-BETA-AGG (ordinary carrier only)
```

## 6. Draft `THEOREM-CONTRACT.yaml` for `LA4` (TRN) — obligation (f)

Draft only (T2's obligation is to draft it; Stage 7 formalization and the final contract are the controller's/U1's
domain). Definitions by exact `lean_name`, carried byte-identically from the frozen source per
`SOLUTION-CONTRACT.md` §2:

```yaml
schema_version: theorem-contract/v1
contract_id: c1-la4-top-rank-nonresidual-aggregate-v1-DRAFT
theorem:
  title: "C1-LA4 Non-residual eligible top-rank aggregate corollary (TRN)"
  informal_statement: >
    For every finite ordinary tree T with p = alpha(T) - 1 (natural number), if
    crossingIndex T + 2 <= alpha(T) - 1 then the favorable-original-leaf aggregate
    S(T, alpha(T) - 1) is <= 0. The proof forces alpha(T) >= 4 from the eligibility
    hypothesis alone (excluding alpha=3 via the universal fact Delta_0 = n-1 >= 0 on any
    nonempty simple graph), places p = alpha-1 >= 3 strictly inside the high-tail guard
    3p >= 2*alpha+1 (an iff at alpha>=4), and applies bipartiteHighTailAggregate (entry 44,
    compiled internal to the first-interior package) or its registry-scope corollary
    E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE, with hBip from hT.isBipartite
    (SimpleGraph.IsTree.isBipartite, Mathlib Acyclic.lean:598). No residual hypothesis, no
    2<=alpha hypothesis (dropped from r26's topRankResidualSign; alpha>=4 is derived, not
    assumed).
formulation_status:
  status: proposed_this_run
  evidence:
    - "Informal derivation: this file, RETURN.md section 1 (route C1-T-02, r29 Cycle 1)."
    - "Low-alpha exhaustive census, orders 1-16, own instrument: 32364/32364 eligible trees
       satisfy S<=0 (0 violations), 0 eligible trees with alpha<=3; RETURN.md section 2,
       digest 3b32e2a5c0973c03990fd499e9e4f2c0ba990dc7e7067e39e26e81a3e2621460."
    - "Relation to E993-R26-TOP-RANK-RESIDUAL-SIGN (VERIFIED): same rank, same conclusion,
       hAlpha and hResidual hypotheses dropped; RETURN.md section 3. r26 unwidened."
definitions:
  - {id: def-independence-number, lean_name: SimpleGraph.indepNum}
  - {id: def-graph-leaf, lean_name: C4LA1.IsGraphLeaf}
  - {id: def-support, lean_name: C5LA1.support}
  - {id: def-h-del, lean_name: C5LA1.H}
  - {id: def-r-del, lean_name: C5LA1.R}
  - {id: def-forward-difference-del, lean_name: C5LA1.forwardDifferenceDel}
  - {id: def-aggregate, lean_name: C5LA1.aggregate}
  - {id: def-crossing-index, lean_name: C5LA1.crossingIndex}
  - {id: def-top-rank, lean_name: Nat.sub, description: "p = alpha - 1, truncated ℕ subtraction; hEligible makes it honest (alpha>=1 from IsTree.nonempty)"}
  - {id: def-high-tail-aggregate, lean_name: E993Interior.bipartiteHighTailAggregate, description: "entry 44, compiled internal; OR the registry-scope E993HighTail.bipartiteHighTailAggregateAllRanks once its own award closes"}
  - {id: def-isTree-isBipartite, lean_name: SimpleGraph.IsTree.isBipartite, pinned: "Mathlib/Combinatorics/SimpleGraph/Acyclic.lean:598"}
hypotheses:
  - id: hyp-tree
    statement: "G.IsTree"
    ℕ_ℤ_equivalence_text: "supplies Nonempty V (connectivity clause) for step 1's alpha>=1, and IsBipartite (via acyclicity, Acyclic.lean:598/617) for the HTA application; acyclicity itself is not separately used elsewhere in this contract."
  - id: hyp-eligible
    statement: "C5LA1.crossingIndex G + 2 <= G.indepNum - 1"
    ℕ_ℤ_equivalence_text: "false (LHS>=2, RHS truncates to 0) whenever alpha<1, impossible under hyp-tree's Nonempty; equals the integer statement x+2<=alpha-1 for every alpha>=1, i.e. always under hyp-tree. Consumed fully (not just through an intermediate bound): forces alpha>=3 directly, and forces alpha=3 to contradiction, together giving alpha>=4."
conclusion:
  id: conclusion-top-rank-nonresidual-aggregate
  statement: "C5LA1.aggregate G (G.indepNum - 1) <= 0. Does not restate r26 (no residual/hAlpha hypothesis discharged or assumed); does not state S<0 or S=0 iff any family; states nothing at any other rank; does not close E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE (one rank only)."
  dependencies: [def-aggregate, def-top-rank, hyp-tree, hyp-eligible, def-high-tail-aggregate, def-isTree-isBipartite]
permitted_axioms: [propext, Classical.choice, Quot.sound]
notes: >
  DRAFT ONLY. This route (T2) did not compile or kernel-check anything; U1 carries the
  registrar/carry plan for the four award projects (C1-ALLOCATION.md item 4). This contract
  becomes live only through the governed Stage 7 workflow.
```

## 7. Grades (`SOLUTION-CONTRACT.md` §4)

| Claim | Grade | Basis |
|---|---|---|
| `E993-R26-TOP-RANK-RESIDUAL-SIGN` | `formally_verified` | Existing award (input, unchanged). |
| `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` | `formally_verified` | Existing award (input, unchanged). |
| Entry 44 `bipartiteHighTailAggregate` (`p≥2`) | compiled-internal, **no independent grade** (fence §3.8) | Kernel-checked inside the first-interior package; not separately certified. |
| `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` (HTA) | `conditional` | Follows from entry 44 (compiled, ungraded) at `p≥2`; TRN never needs its still-open `p=1` case. |
| `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` (TRN) | `conditional` | This route's informal derivation (§1) is complete and gap-free, but its weakest input (HTA/entry 44) has no certificate of its own yet — "a composition's grade is its weakest input's" (`SOLUTION-CONTRACT.md` §4). Supported by `bounded_computation` (§2: 32,364/32,364 eligible trees, orders 1–16, zero violations) — bounded evidence, never a substitute for the certificate. |
| This route's census (§2) | `bounded_computation` | Own instrument, exact integers, orders 1–16 only; never promoted as a proof. |

## 8. `headline_resolved`

`headline_resolved: no`

(The headline is all four targets `formally_verified` at Stage 7; no route can produce that alone, per shared rule
6 and `SOLUTION-CONTRACT.md` §5.)

## 9. Route verdict

`proved_conditional`

The exact TRN statement is derived by a complete, gap-free informal proof (§1) — every hypothesis named, every
`ℕ`-subtraction guarded, the `p=1` endpoint shown irrelevant to TRN's own domain. The derivation is **conditional**
on `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` (equivalently entry 44 at `p≥2`, already compiled and kernel-checked
inside the first-interior package but not separately awarded) receiving its own governed certificate — this route
did not, and could not alone, produce that certificate (Stage 7, all-route synthesis). The low-α exhaustive census
(§2, orders 1–16, 32,364/32,364 eligible trees, zero `S>0`, zero `α≤3`) is `bounded_computation` support, not part
of the proof.

## Remaining obligation

Written as what a successor inherits, not as a request:

1. **TRN's own governed Lean award** needs `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` (or directly entry 44's carried
   fragment, `E993Interior.bipartiteHighTailAggregate`, `p≥2` only — TRN never needs the `p=1` endpoint) to close as
   its own certificate first (T1/U1's registrar-carry territory), or to be discharged in the same Stage 7 award
   group as TRN if the synthesis chains them. TRN's own Lean body (once carried) is short: the five-step arithmetic
   of §1 (`hEligible ⟹ α≥3`; exclude `α=3` via `Δ_0=n−1≥0`; `α≥4`; guard `3(α−1)≥2α+1 ⟺ α≥4`; apply HTA/entry 44
   with `hT.isBipartite`) plus the carried definitions of entries 1–14, 18.
2. **The draft `THEOREM-CONTRACT.yaml` above (§6) is unreviewed** by any adjudicator/critic and unregistered; it
   needs a Stage 7 formalizer's pass before it can seed an award project.
3. **The candidate registry entries (§5)** for `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` and
   `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` are drafted, not registered; registration is additive and scoped at the
   controller's publication step (`AUTHORIZATION.md` "Publication at the close"), never a route act.
4. **`E993-R24-*` (`TOP-RANK-SELECTOR-COLLAPSE`) does not exist** in the registry under that name (§0's "Registered
   claims named" section) — if the controller intended a real, distinct claim by that name, its exact spelling or
   location needs to be supplied; this route could not find it inside its read grant and is not authorized to
   search further.
5. **The `α=4` tightness question is open**: the census (orders 1–16) never witnesses an eligible tree at exactly
   `α=4` (minimum observed is `α=5`); whether `α=4` is eligible for some larger tree, or whether eligibility at
   `p=α−1` structurally forces `α≥5`, is unresolved and unattempted here — worth a small dedicated check (not a
   broad search) before any claim of exact tightness is made on TRN's guard.
6. **The "976 classes" figure** in `SEMANTIC-CONTRACT.md` §2 (attributed to the controller's pre-run prior) does not
   match the correct A000055 partial sum for orders 1–12 (987, confirmed independently by this route's own
   generator); this route did not rely on it and takes no position on its origin, but flags it for whoever owns
   prior-reconciliation (F1, per `C1-ALLOCATION.md` item 3(f), or the controller at Stage 7).
