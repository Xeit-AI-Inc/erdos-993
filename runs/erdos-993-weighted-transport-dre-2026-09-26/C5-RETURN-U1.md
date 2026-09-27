# Route Return — U1, Cycle 5, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`)

**Route:** `C5-U-01 LEAN-CLAW-NM-AND-GK-TREE-LAYER`. **Orientation:** U (formal/structural).
**Mechanism fingerprint:** `LEAN-CLAW-NM-AND-GK-TREE-LAYER`. **Load-bearing obligation** (`control/C5-ALLOCATION.md`,
numbered item 5): (a) if C4-LA1 did not close, complete its DAG first; (b) CD-1
(`clawProduct_normalizedMatching`) in Lean at the T adjudicator's draft statement; (c) the `G_k` tree layer on
C4-LA1's `gkGraph` — `IsTree`, `indepNum = 2k+3` (SR-C4-8's proof), `crossingIndex = k+1` (informal proof first,
bounded `k ≤ 400`).

**Model disclosure (two parts):** chartered sonnet/xhigh (work at highest reasoning effort throughout, per
dispatch); transport-resolved model sonnet (explicit parameter); runtime-reported model id: `claude-sonnet-5`
(quoted verbatim from this session's own system context).

## Boot

Operating within VerityOS. Boot reads were **exactly** the two files the pointer dispatch and the Cycle 5
Worker Common Brief authorize: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, read in full. No other VerityOS subsystem
(memory, decisions, logs, conversations, operations, modules, skills, knowledge) was opened this route. The
host's own harness placed the project `CLAUDE.md` and the user's auto-memory index into context at session
start (outside this route's control); neither was opened or acted on beyond the mechanical boot the dispatch
requires — recorded under **Read-boundary disclosure** below, matching the pattern other Cycle 4 seats
recorded for the same host behavior.

## Stage 2 seal

`control/C5-STAGE2-PACKET-MANIFEST.json`: recomputed SHA-256 of the canonical JSON of the manifest with the
`seal_sha256` field removed (`sort_keys=True`, separators `(",", ":")`, no trailing newline, UTF-8):

```
2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289
```

This **matches** both the manifest's own recorded `seal_sha256` and the value asserted by the pointer dispatch
(`DISPATCH-U1.md`, itself verified against its own stated SHA-256
`ef28f198435884216b420342515ac0e95fe7c80b2d0f0235e1a9b9fb578e69b8` before any of its instructions were
followed). `file_count` 1400 matches `len(files)` 1400. Recomputation script: standard library `json` +
`hashlib`, run once, interactively, no persisted artifact (the check is reproduced above verbatim; anyone can
rerun it against the same manifest file).

**Sources read and their grant.** This route's object lives entirely in `runs/`, `cycles/`, `second-reads/`
and `control/`, all explicitly named (with wildcards) in `control/C5-WORKER-COMMON-BRIEF.md`; **no member
under `sources/` was read**, so `control/SOURCE-DIGESTS.json` verification is vacuous for this return (I
opened it to see the file listing, took nothing from it). Files actually read, each an exact path the common
brief already authorizes, with no directory read that this route did not already know the destination of, save
two disclosed exceptions below: `control/C5-WORKER-COMMON-BRIEF.md`, `control/C5-STAGE2-PACKET-MANIFEST.json`,
`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C5-ALLOCATION.md`, `control/C5-STAGE1-GATE.md`,
`cycles/cycle-5/stage2/ROUTE-STATE.md`, `cycles/cycle-4/CYCLE-CLOSE.md` (named directly by
`control/C5-ALLOCATION.md`'s own text as the place to "read it for the grades of record"),
`cycles/cycle-4/stage5/adjudicators/T/ADJUDICATION.md` (an adjudication, explicitly listed generically in the
common brief), `second-reads/SR-C4-5/SECOND-READ.md`, `second-reads/SR-C4-8/SECOND-READ.md` (explicitly listed
generically), `control/CLAIM-IDENTITY.run-local.json` (explicitly listed, not under `sources/`),
`control/SOURCE-DIGESTS.json`, and the C4-LA1 / C1-LA1 Lean project files under `runs/` (explicitly listed by
name in the common brief). Mathlib sources under
`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project` were read for API meaning, as the
common brief authorizes by name (explicitly listed as within the grant, alongside `sources/` and this route's
own scratch).

## Read-boundary disclosure

1. **Host injection (not this route's action).** The project `CLAUDE.md` and the user's memory index arrived
   in context automatically; neither was opened or acted on. This mirrors the disclosure every Cycle 4 seat
   recorded for the identical host behavior (e.g. the T adjudicator's ADJUDICATION.md, item 1).
2. **Two single-level, non-recursive `ls` calls outside the literal `sources:`/Mathlib/scratch grant**, used
   only to resolve an exact filename the common brief had already named with a wildcard, never to explore:
   `ls runs/` (resolved the exact C4-LA1 award directory name, already named
   `runs/lean-2026-09-27-c4-la1-*/` in the brief) and
   `ls cycles/cycle-4/stage5/adjudicators/` (resolved the exact adjudicator id `T`, already named
   `cycles/cycle-{1,2,3,4}/stage5/adjudicators/*/ADJUDICATION.md`). Neither was `-R`, neither used `find`/`grep`,
   and both landed on files the brief already authorized reading in full. This matches the T adjudicator's own
   disclosed practice at the same cycle (its item 4).
3. **`find` inside the Mathlib package directory** (`.../mathlib-v4.32.2-project/.lake/packages/mathlib/...`),
   to locate `Combinatorics/SimpleGraph/Acyclic.lean` and to grep two of its declaration names. The common
   brief names the Mathlib package directory explicitly as within this route's grant (alongside `sources/` and
   the route's own scratch), so this is not a boundary item in the strict sense, but it is recorded here for
   completeness since it used `find`.
4. No other VerityOS file, no sibling seat's scratch, no other experiment root, and no network resource was
   read.

## IMPORT LIST

Python instrument (`scratchpad/c5-U1/gk_tree_layer.py`): `hashlib`, `json` — standard library only, exact
integer arithmetic throughout (no `fractions` needed; every quantity here is a natural-number polynomial
coefficient or count). Every invocation is `python3 -B`. Lean instrument: the pinned
`leanprover/lean4:v4.32.2` toolchain and Mathlib at `905b95818eb32af7874a58b427f50c1711a5e96c` (verified below),
bound by manual symlink, never `lake update`/`lake clean`.

## Registered claims named before any census (SOLUTION-CONTRACT §3; `control/CLAIM-IDENTITY.run-local.json`)

This route's object is the **unweighted structural layer** of `G_k` (is it a tree; what is its independence
number; where is its first strict descent) — a prerequisite of the transport network, not itself a Hall,
weight, flow or aggregate statement. Before presenting any numeric row:

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — **not touched**. Nothing in this return asserts,
  narrows or refutes a Hall condition, at any `(T, p, X)`.
- **The primary aggregate** `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — **not touched**.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (C1-LA1, `formally_verified`) — **not touched**; this
  route's Lean additions are appended after C1-LA1's/C4-LA1's frozen text in the scratch copy and change none
  of it (byte-identical prefix verified below).
- **The ten refuted mechanism keys** of `SOLUTION-CONTRACT.md` §3.2 — **none apply and none is revived**:
  `E993-R23-LITERAL-DELETE-ONLY-HALL`, `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`,
  `E993-R23-TAG-CLOSED-CUT-HALL`, `E993-R23-HOT-TAG-SINGLETON-HALL`,
  `E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG`, `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT`,
  `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`,
  `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`,
  `E993-LOWER-REGION-C4-T4-SIGNED-CROSS-TAG-INJECTIVITY`,
  `E993-LOWER-REGION-LOCAL-MARKED-ADDABILITY-NONPOSITIVE-COVARIANCE`. Each is a claim about the weighted
  transport relation, a tag, a retag map or a covariance; this route asserts none of these objects at all —
  distinct on their face, not merely on their scope.
- **(LIFT)** `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`, **(DCB)**
  `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY` — **not used** (no group invariance and no bipartite
  tagged incidence appears in this route).
- **`E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET`**
  (award C4-LA1, `formally_verified`) — **read, not touched**: `cycles/cycle-4/CYCLE-CLOSE.md` §1 and §3
  confirm C4-LA1 **closed** (`formally_verified`; `Main.lean` digest `66db6c73…`), so this route's load-bearing
  obligation (a) ("complete its DAG **if it did not close**") does **not** apply — recorded here as a
  registered fact consumed, not re-derived. This route's scratch `Main.lean` carries C4-LA1's `Main.lean`
  byte-identically as its first 2956 lines (verified: SHA-256 of the first 2956 lines equals `66db6c73…`,
  matching the Cycle 4 close table exactly) and appends new declarations after it, never editing it.
- **`E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`**
  (`VERIFIED`, run-local registry) — **read and corroborated, not re-proved as a contribution.** Its own
  "Companion content (on the face, same grade)" **already states**: `alpha(G_k) = 2k+3` for every `k ≥ 0`;
  the closed form `I(G_k) = (1+y)(1+3y+y^2)^(k+1) + y(1+y)^2(1+2y)^k`; `x(G_k) ≤ k+1` for every `k ≥ 2`; and
  `(G_k, k+3)` eligible iff `k ≥ 3`. My Python instrument (below) independently rederives the identical closed
  form from the tree's block structure and checks it against a generic (non-closed-form) tree DP for `k = 1..40`
  and against the closed form alone for `k = 1..400` — this is **replication**, not new mathematics, and I
  register **no new key** for `alpha(G_k) = 2k+3` or for the closed form. `control/C5-ALLOCATION.md`'s own
  standing-state bullet separately records `x(G_k) = k+1` for `k = 2..400` as a **bounded** fact (distinct from
  this key's `≤` statement); my instrument confirms **equality** on that exact range with an independent
  script, again as replication.
- **`E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`** (CD-1; `proved_informal`, registered at the
  Cycle 4 close on SR-C4-5's confirmation) — **targeted, not closed.** This route's Lean statement (below) is
  the T adjudicator's own draft for this key's Lean form; the grade of the key **does not change** here (no
  formal proof is shipped for it; the induction is the smallest open lemma named in `## Remaining obligation`).
- **`E993-R26-TREE-STRUCTURAL-CORE`, `E993-R26-TOP-RANK-RESIDUAL-SIGN`** — read for context (general finite-tree
  facts using Mathlib `IsTree`); **not used** as inputs (they concern leaf/support counting under an
  eligibility hypothesis this route does not invoke) and **not touched**.
- **Alias check (lexical and mathematical), both required steps.** *Lexical:* I searched
  `control/CLAIM-IDENTITY.run-local.json`'s 453 `claim_key`/`statement`/`aliases` fields for the substrings
  `GK`, `G_K`, `TREE-LAYER`, `INDEPNUM`, `CROSSINGINDEX`, `SPIDER`, `ISTREE` (case-insensitive); 14 hits, listed
  and read in full above. *Mathematical:* of those 14, the two `E993-R30-GK-TREE-…` keys and the two
  `E993-EQUAL-LENGTH-THREE-SPIDER-…` keys state results about trees with the *same combinatorial shape family*
  (equal-length-three arms from a hub); I checked each one's exact statement (quoted above) against every claim
  in this return and found: (i) `alpha(G_k)=2k+3` and the closed form are **the same statement**, already
  registered (handled by "replication, no new key" above, not by silent adoption); (ii) `x(G_k) ≤ k+1` (`k ≥ 2`,
  registered) is a **weaker** statement than my `x(G_k) = k+1` for `k ≥ 2`, which is **already** the exact
  bounded record in `control/C5-ALLOCATION.md`'s own standing state, not a new claim; (iii) **no existing key
  asserts `(gkGraph k).IsTree` as a Mathlib `SimpleGraph.IsTree` term, and no existing key asserts
  `crossingIndex` computed via a Lean `#print axioms`-checked proof** — this route's one new object
  (`gkGraph_isTree`, below) has no lexical or mathematical alias among the 453 claims, and I propose **no**
  registry key for it (see `## Grades` — it is compiled scratch, ungraded until a governed award closes,
  exactly C4-LA1's own precedent for its supporting Lean lemmas).

## Step-by-step derivation

**Object.** `SimpleGraph.IsTree` (Mathlib) on `E993Transport.gkGraph k := SimpleGraph.fromRel (gkEdge k)`
(C4-LA1's definition of record, `Main.lean` digest `66db6c73…`, carried byte-identically), for **every**
`k : ℕ` — general, not bounded.

1. **Finiteness enters immediately and throughout.** The carrier is `Fin (3*k+5)`, `Fintype`/`Finite` by
   construction; `IsTree` needs `[Finite V]` only for the edge-count half of
   `SimpleGraph.isTree_iff_connected_and_card`.
2. **Connectivity, proved separately from acyclicity** (Mathlib's `IsTree` is `Connected ∧ IsAcyclic`, and the
   contract requires the two checked separately): I built the explicit walk from the root to every vertex —
   `gkGraph_adj_zero_one/_two`, `gkGraph_adj_two_three/_four`, `gkGraph_adj_zero_arm`, `gkGraph_adj_arm_mid`,
   `gkGraph_adj_arm_tip` give each literal edge (reading C4-LA1's own `gkGraph_adj_of_val_root`/`_arm` helpers,
   never re-deriving `gkEdge`'s case split); `gkGraph_reachable_zero` case-splits on `v.val` (`0`; `1`..`4`;
   or, for `v.val ≥ 5`, the unique `i < k` with `v.val ∈ {5+3i, 6+3i, 7+3i}`, an ℕ-division fact
   `i := (v.val-5)/3` guarded by `omega` from `v.val < 3*k+5`) and composes `Reachable` via `.trans`;
   `gkGraph_connected` closes with `SimpleGraph.connected_iff_exists_forall_reachable`.
3. **Acyclicity, via the edge-count half of `isTree_iff_connected_and_card`: `Nat.card G.edgeSet + 1 = Nat.card V`.**
   Rather than construct an edge Finset by hand, I built the **child–parent bijection** that exists on any
   rooted tree: `gkParentVal : ℕ → ℕ` sends a non-root value to its parent's value (`1,2 ↦ 0`; `3,4 ↦ 2`;
   `5+3i ↦ 0`; `6+3i, 7+3i ↦` one less), proved **strictly decreasing** on `n ≥ 1`
   (`gkParentVal_lt`, `unfold; split_ifs; omega` — this is where every ℕ-subtraction in the construction is
   discharged: `n-1`, `(n-5)/3`, `(n-5)%3`, each guarded by the branch's own `n ≥ 5` or `n ≥ 1`). `gkParent`
   lifts this to `Fin (3*k+5)`; `gkGraph_adj_parent` shows every non-root vertex is adjacent to its parent (one
   case per value pattern, each closed by an explicit `eq_gkVertex_iff`-based rewrite, never `▸` into a
   dependent `Fin` motive, which failed on the first attempt — recorded as a fixed error, not a residue).
   `gkChildEdge : {v // v.val ≠ 0} → Sym2 V := fun v => s(v.1, gkParent k v.1)` is then **injective**
   (`gkChildEdge_injective`: if `s(v, parent v) = s(w, parent w)` with `v ≠ w`, the only way is `v = parent w`
   and `w = parent v`, which contradicts strict monotonicity — a genuine two-line proof, not a case bash) and
   its **range is exactly `(gkGraph k).edgeSet`** (`gkChildEdge_range`: every parent edge is an edge by step 2;
   every edge `{a,b}` has its "child" side, identified case-by-case from `gkGraph_adj_iff_val`'s seven leaf
   patterns, mapping back under `gkChildEdge`). `Nat.card_range_of_injective` then gives
   `Nat.card (gkGraph k).edgeSet = Nat.card {v // v.val ≠ 0} = Fintype.card (Fin (3k+5)) - 1 = 3k+4`
   (`gkGraph_card_nonroot`, via `Fintype.card_subtype_compl` and `Fintype.card_subtype_eq`), i.e.
   `Nat.card (gkGraph k).edgeSet + 1 = 3k+5 = Nat.card (Fin (3k+5))`.
4. **No eligibility, no fixed selector, no active-tag witness, no literal (D)∪(S) relation and no group
   invariance enter anywhere in this derivation** — they belong to the transport layer this route does not
   touch. **`IsTree` is Mathlib's own (connected, acyclic) definition**, not an authored notion, and it is
   checked, not asserted, by the kernel.
5. **Result:** `theorem gkGraph_isTree (k : ℕ) : (gkGraph k).IsTree`, general in `k`, **sorry-free**.
   `#print axioms gkGraph_isTree` (this session, `lake env lean`, foreground): `[propext, Classical.choice,
   Quot.sound]` — the three permitted axioms, nothing else, on every declaration built along the way
   (`gkGraph_connected`, `gkGraph_adj_parent`, `gkChildEdge_injective`, `gkChildEdge_range`,
   `gkGraph_card_nonroot` all checked individually, same axiom list).
6. **`indepNum` and `crossingIndex`, in Lean: not completed this cycle.** I identified the exact Mathlib route
   (`SimpleGraph.indepNum`'s defining `sSup`, discharged via `IsIndepSet.card_le_indepNum` for the lower bound
   on an explicit witness Finset, and `exists_isNIndepSet_indepNum` plus a `Finset.card_eq_sum_card_fiberwise`
   partition — the 5-vertex "core" contributes ≤ 3, each 3-vertex arm block contributes ≤ 2 — for the upper
   bound) but did not finish the Finset-level engineering in the time available; this is the **smallest open
   Lean node**, named precisely in `## Remaining obligation`. `crossingIndex = k+1` is supplied **informally**
   (the allocation's own explicit license: "informal proof first — U1 supplies it; bounded `k ≤ 400`"),
   below.
7. **CD-1 (`clawProduct_normalizedMatching`): the exact Lean statement, drafted by the T adjudicator
   (`cycles/cycle-4/stage5/adjudicators/T/ADJUDICATION.md`, "Draft statement for G-T-CLAW"), **type-checks**
   against the current definition layer (`clawRank`, `clawLayer`, `clawShadow` all elaborate; the theorem
   statement elaborates with the guard `hk1 : 1 ≤ k` discharging the ℕ-subtraction `k - 1`). I verified this
   with a throwaway `sorry`-terminated check file, confirmed it produces exactly one warning
   (`declaration uses 'sorry'`) and no error, then **deleted the file** — no `sorry` appears anywhere in any
   file this return ships or claims as evidence. The **proof itself** (SR-C4-5's verified induction on `M`,
   carrying log-concavity through `E_k = N_k + c·N_{k-1}`, the explicit `α, β, γ` flow) is the **smallest open
   lemma** on this line, named in `## Remaining obligation`.

## Independently verified numeric claims (deterministic generator; `python3 -B`)

**Generator:** `scratchpad/c5-U1/gk_tree_layer.py`, SHA-256 `d5dc320002949bac466776b12d2579508c6d10f4ad0305310384f358278d265c`.
**IMPORT LIST:** `hashlib`, `json` (standard library only). **Copy-out-first replay command** (never run
in place):

```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-U1/gk_tree_layer.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-U1-replay/gk_tree_layer.py
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-U1-replay
python3 -B gk_tree_layer.py
```

This was run exactly this way (copy-out to `scratchpad/c5-U1-replay/`, then executed there) and reproduced
`RESULT_SHA256 60f1b4cf2414e933376a2a5819bc8ad738b0f883412597a9998e0d223e6f2f70` byte-identically. No wall-clock,
PID or host field is hashed; the digest covers only `k`, `n`, `alpha`, `x` and the tree-test rows.

1. **Acyclicity-and-connectivity test, `k = 0..60` (61 rows), on the literal edge list** (not assumed;
   `gk_edges(k)` reproduces exactly C4-LA1's `gkEdge`): union-find acyclicity (no edge joins an already-joined
   component) **and** single-component connectivity **and** `|E| = n - 1`, all three asserted on every row —
   `is_tree` returns `True` on all 61. This corroborates `gkGraph_isTree` computationally for small `k`; the
   Lean theorem is the proof for **every** `k`.
2. **`alpha(G_k) = 2k+3`, `k = 1..40` (40 rows), by two independent computations required to agree:**
   (A) a **generic** subtree DP directly on the adjacency list (no closed form assumed: builds the adjacency
   from `gk_edges`, roots at `0`, computes the two-state independence-polynomial DP bottom-up on an explicit
   BFS order — no recursion-depth risk); (B) the **closed form** `P_k(y) = (1+y)(1+3y+y^2)^{k+1} +
   y(1+y)^2(1+2y)^k`, hand-derived from the tree's block structure (leaf `1`; cherry at `2`; each arm a rooted
   `P_3`) and evaluated by exact polynomial multiplication. **Both methods agree on all 40 rows**, and both give
   `deg = 2k+3`. This closed form and the value `2k+3` are **already registered** (companion content of
   `E993-R30-GK-TREE-K-GE-3-…`, above) — this is a replication, reported as such.
3. **`alpha(G_k) = 2k+3` and `x(G_k) = k+1` (`k ≥ 2`) from the closed form alone, `k = 1..400`** (400 rows;
   `k = 1` is a genuine, disclosed exception — see below). `x` is recomputed as the first `j` with
   `Δ_j := i_{j+1} - i_j < 0`, **scanned through rank `α` with the terminal zero-extension difference
   `Δ_α = i_{α+1} - i_α = -i_α` included** (the authorized evaluator `ordinary_tree_checked.py`'s documented
   omission is not repeated here; this script never calls that evaluator).

   | `k` | `n = 3k+5` | `α = 2k+3` | `x` | `Δ_{k+1} = i_{k+2}-i_{k+1}` | `8·Δ_{k+1}` |
   |---|---|---|---|---|---|
   | 1 | 8 | 5 | **3** (not `k+1=2`; see below) | `i_2-i_1 = 22-21 = +1` | 8 |
   | 2 | 11 | 7 | 3 | `i_3-i_2 = 87-88 = -1` | −8 |
   | 3 | 14 | 9 | 4 | `i_4-i_3 = 367-377 = -10` | −80 |
   | 5 | 20 | 13 | 6 | `i_6-i_5 = 7391-7519 = -128` | −1024 |
   | 10 | 35 | 23 | 11 | `i_{11}-i_{10} = 17508787-17524403 = -15616` | −124928 |
   | 100 | 305 | 203 | 101 | (not tabulated; `k+1=101` matches `x`) | — |
   | 400 | 1205 | 803 | 401 | (not tabulated; `k+1=401` matches `x`) | — |

   The `Δ_{k+1}` column also **cross-checks** an already-registered closed form on the same key's face,
   `8·Δ_{k+1}(I(G_k)) = -2^k(k^2+3k-8)`: my script's `8·Δ_{k+1}` column matches `-2^k(k^2+3k-8)` exactly at
   every `k` checked (`8, -8, -80, -1024, -124928` above for `k=1,2,3,5,10`) — again a replication, not a new
   derivation, but a useful independent confirmation that the closed form and the crossing-index scan agree.
4. **The `k = 1` exception, disclosed rather than asserted away.** `x(G_1) = 3`, **not** `k+1 = 2`
   (`Δ_1(G_1) = i_2-i_1 = +1 > 0`, i.e. rank `1` is an **ascent**, not a descent, at `k=1`). This is not a new
   finding: `control/C5-ALLOCATION.md`'s own standing-state bullet already scopes the bounded record to
   `x(G_k) = k+1` for `k = 2..400`, excluding `k=1` for exactly this reason. I report the exception to show the
   script does not silently special-case it.

## Grades (SOLUTION-CONTRACT §4)

- **`gkGraph_isTree` (this route's one new object).** A general (`∀ k`), sorry-free, three-permitted-axiom
  Lean theorem — **compiled scratch**, no grade until a governed award closes over it (SOLUTION-CONTRACT §3.7,
  rule 9: "a compiled scratch declaration has no grade until its governed award closes"). It is **not**
  registered as an `E993-R30-…` key (see the alias check above): it is exactly the kind of supporting
  structural lemma that C1-LA1 through C4-LA1 carried unregistered inside their own awards, here supplied one
  cycle ahead of the award that will need it.
- **`alpha(G_k)=2k+3`, the closed form, `x(G_k) ≤ k+1` (`k≥2`, on the registered key's own face).** Already
  `VERIFIED` (companion content of `E993-R30-GK-TREE-K-GE-3-…`); my Python replication does not change this
  grade and is not itself graded as a new claim.
- **`x(G_k) = k+1`, `k = 2..400` (equality, bounded).** Already a `bounded_computation` record
  (`control/C5-ALLOCATION.md` standing state); replicated here to `k=400` by an independently-written
  generator; grade unchanged.
- **CD-1's Lean statement.** `compiled` in the weakest sense (elaborates; the theorem itself carries `sorry`
  in the throwaway check, which was deleted and is not shipped). The mathematical content, key
  `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`, remains `proved_informal` at its Cycle 4 grade,
  unchanged by this route.
- **`indepNum`/`crossingIndex` in Lean.** **Missing bridge** — identified route, not yet built.

## Central obligation attempted: yes. Two instruments named for every numeric claim: yes (the generic tree DP
and the closed-form polynomial are independently coded and cross-checked at `k=1..40`; the closed form alone
and the already-registered `8·Δ_{k+1}` formula are cross-checked at `k=1..400`).

## headline_resolved: no

## Route verdict: `compiled`

One general, sorry-free, axiom-clean Lean theorem (`gkGraph_isTree`) was produced and is ready to seed a
future governed award; the CD-1 Lean target was confirmed well-typed against the frozen definition layer; the
`indepNum`/`crossingIndex` Lean formalizations and the CD-1 induction proof remain open. No Hall, weight, flow
or aggregate claim is made or touched. This is not `proved` (the route's full object per the allocation is not
discharged), not `proved_conditional` (nothing here is conditional on an unproved hypothesis — `gkGraph_isTree`
is unconditional), not `refuted`, not `bounded_evidence` (the one Lean theorem shipped is a real proof, not a
finite check), and not `blocked` (real, uncontested progress was made and the remaining path is concretely
named).

## Remaining obligation

A successor inherits, in the order most likely to close fastest:

1. **`indepNum (gkGraph k) = 2*k+3` in Lean.** Lower bound: `IsIndepSet.card_le_indepNum` applied to the
   explicit Finset `L' := {gkVertex k 1, gkVertex k 3, gkVertex k 4} ∪ (⋃ i < k, {gkVertex k (5+3i), gkVertex k
   (7+3i)})`, independence checked pairwise via `gkGraph_adj_iff_val` (no chosen pair matches any of the seven
   edge patterns) and `|L'| = 2k+3` via the same `gkVertex_ne`-style distinctness lemmas already in this
   route's file. Upper bound: `exists_isNIndepSet_indepNum` gives a witness Finset `t`; partition
   `Finset.univ` by the block index `b(v) := if v.val < 5 then k else (v.val-5)/3` (range `Finset.range (k+1)`,
   `k` tagging the 5-vertex core, `i<k` tagging arm `i`); `Finset.card_eq_sum_card_fiberwise`; bound the core
   fiber by `≤ 3` (case split on `gkVertex k 0 ∈ t` and `gkVertex k 2 ∈ t`, using the four core edges) and each
   arm fiber by `≤ 2` (the arm is a `P_3`; at most one of its three vertices' pairwise-adjacent middle can
   coexist with both ends). `le_antisymm` closes it.
2. **`crossingIndex (gkGraph k) = k+1` in Lean, `k ≥ 2`.** The informal proof is the closed-form polynomial of
   this return (already independently confirmed to `k=400`); the Lean route is to port `C5LA1.crossingIndex`'s
   `Nat.find` definition against a Lean-proved recurrence for the coefficients of
   `(1+y)(1+3y+y^2)^{k+1} + y(1+y)^2(1+2y)^k`, or to bound `Δ_{k+1}` in closed form
   (`8·Δ_{k+1} = -2^k(k^2+3k-8)`, already on the registered key's face) and separately rule out an earlier
   descent.
3. **CD-1's induction proof in Lean**, following SR-C4-5's fully-checked informal proof verbatim: induction on
   `M`, log-concavity of `e_k(q)` preserved through `E_k = N_k + c·N_{k-1}` (the three-term expansion SR-C4-5
   gives explicitly), the explicit flow (`α = N_k/E_k`, `β = N_{k-2}/E_{k-1}`,
   `γ = 1/E_k - N_{k-2}/(N_{k-1}E_{k-1})`, nonnegative iff `N_{k-1}^2 ≥ N_k N_{k-2}`), base case `M=1`. This is
   the single largest remaining piece of mathematics on this route's line.
4. **Once 1–3 close:** compose a Lean-shaped `(HALL)`-restricted corollary for `G_k` at every eligible rank by
   combining the now-formal eligibility (needs `crossingIndex`, `indepNum`, and the already-`formally_verified`
   `x(T)+2 ≤ p`/`3p<2α(T)+1` eligibility predicate) with C4-LA1's already-`formally_verified` flow theorem —
   this is the "`G_k` (HALL) corollary contract-ready for the Cycle 5 Stage 7" the allocation names as this
   route's ceiling outcome.

None of the above touches (HALL) at full scope, the primary aggregate, or any of the ten refuted mechanisms;
a successor should re-verify the alias check against the run-local registry's state at the time it starts,
since Cycle 5's other five seats may register new keys before this line is picked up again.

## Runtime hygiene

No network, no package installs (`pip`/`brew`/`npm`/`elan` beyond the pinned toolchain already present). Every
`lake build` ran in the foreground to completion (7–11 s each, final build 10 s, `Build completed successfully
(8657 jobs)`); no background job was ever started, so none needed to be killed. The shared Mathlib was bound by
the exact manual symlink the shared rules specify
(`mkdir -p LeanProject/.lake && ln -s .../mathlib-v4.32.2-project/.lake/packages LeanProject/.lake/packages`);
the revision was verified against `sources/mathlib-binding/PIN.json`
(`905b95818eb32af7874a58b427f50c1711a5e96c`, matching the copied `lakefile.toml`'s `rev` field exactly); no
`lake update`, no `lake clean`, `.lake/packages` never copied. `LeanProject`'s four seed files
(`lakefile.toml`, `lake-manifest.json`, `lean-toolchain`, `LeanProof.lean`) are byte-identical to C1-LA1's,
verified by SHA-256 both directions.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-U1/`
(scratch) and `.../scratchpad/c5-U1-replay/` (replay target only; nothing under `sources/`, no other experiment
root, no `/tmp` write anywhere):

| File | SHA-256 | Note |
|---|---|---|
| `LeanProject/lakefile.toml` | `45d0ca58145784d5f29322ff21a1335e350c38e72afe8d5396d9c9910b94ff49` | byte-identical to C1-LA1's |
| `LeanProject/lake-manifest.json` | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` | byte-identical to C1-LA1's |
| `LeanProject/lean-toolchain` | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` | byte-identical to C1-LA1's; `leanprover/lean4:v4.32.2` |
| `LeanProject/LeanProof.lean` | `f4dfdef8320a735eab53d24f4b47d3b60bcb474ffd2c84c77f24ae2fc75fcf31` | byte-identical to C1-LA1's |
| `LeanProject/LeanProof/Main.lean` (first 2956 lines) | `66db6c73ad8f0dbe58dfdf31bf6a5d0b50e3f33459ca08f89ba372cc9ca979bf` | byte-identical to C4-LA1's frozen `Main.lean` (Cycle 4 close table) |
| `LeanProject/LeanProof/Main.lean` (full, 3229 lines) | `05c24dda55cea6f877bc2e3caed0a156e559e6ef6254d303d81e377aaf64165e` | this route's scratch state: C4-LA1's file plus 26 new declarations (lines 2957–3229) |
| `gk_tree_layer.py` | `d5dc320002949bac466776b12d2579508c6d10f4ad0305310384f358278d265c` | the numeric-claims generator |

**Lean replay** (foreground, from a clean `.lake/build` if desired — the shared Mathlib packages are
prebuilt and are never rebuilt):

```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-U1/LeanProject
/Users/ashtonsperry/.elan/bin/lake build
```

**Python replay:** the copy-out-first command under `## Independently verified numeric claims` above.

**New declarations this route added** (all in namespace `E993Transport`, all sorry-free): `gkGraph_adj_zero_one`,
`gkGraph_adj_zero_two`, `gkGraph_adj_two_three`, `gkGraph_adj_two_four`, `gkGraph_adj_zero_arm`,
`gkGraph_adj_arm_mid`, `gkGraph_adj_arm_tip`, `gkGraph_reachable_zero`, `gkGraph_connected`, `gkParentVal`,
`gkParentVal_lt`, `gkParent`, `gkGraph_adj_parent`, `gkChildEdge`, `gkParentVal_le`, `gkChildEdge_injective`,
`gkParentVal_at_one`, `gkParentVal_at_two`, `gkParentVal_at_three`, `gkParentVal_at_four`,
`gkParentVal_at_arm_start`, `gkParentVal_at_arm_mid`, `gkParentVal_at_arm_tip`, `gkChildEdge_range`,
`gkGraph_card_nonroot`, `gkGraph_isTree`.
