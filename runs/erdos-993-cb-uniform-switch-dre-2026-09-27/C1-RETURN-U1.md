# RETURN — r31 Cycle 1, route U1

**Route ID:** `C1-U-01`. **Mechanism token:** `LEAN-CB-DEFINITION-LAYER`. **Orientation:** U (formal/structural).

**Model disclosure (two-part):** chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported
model id: `claude-sonnet-5` (per this runtime's own system disclosure: "You are powered by the model named Sonnet 5. The exact
model ID is claude-sonnet-5.").

## Boot acknowledgment

Booted VerityOS by reading EXACTLY the two authorized files and nothing else from the VerityOS root: `verity.md` and
`identity/startup-protocol.md`. No other VerityOS file (memory, conversations, modules, skills, logs, decisions) was read by
this seat via any tool call.

**Read-boundary disclosure.** This runtime's harness auto-injects the user's standing memory index
(`~/.claude/projects/.../memory/MEMORY.md`) into every session's system context regardless of task; that content arrived
pre-session, was not fetched by this seat, and was not used for anything in this return (it concerns unrelated prior runs,
r24–r30, none of which were re-read or relied on beyond the frozen copies this dispatch explicitly authorizes under `sources/`).
Flagged for completeness per the dispatch's disclosure rule, not because this seat chose to read it.

## Digests verified before use

- Dispatch file (`control/dispatch/c1-stage3/DISPATCH-U1.md`): `148ea72ffe4839eb430e3e5345e0aa5f7e0ac0d3b5f9ee79d3daa4f1b08a270f` — matches the
  value given at assignment.
- Stage 2 packet manifest inner seal (`control/C1-STAGE2-PACKET-MANIFEST.json`, canonical JSON without `seal_sha256`,
  `sort_keys`, separators `(",", ":")`, no trailing newline): recomputed `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`
  — **matches** the manifest's stored `seal_sha256`.
- `AUTHORIZATION.md`: `7d9bd0514744386daf81d13c4d89100acb131b2c94c02a322b084edc072edec9` — matches manifest.
- `control/R31-CHARTER-PROMPT.md`: `7b6f4a0e30d3789097a601bc51cf006d16f6b3a6c255d06cd6b8358400b68d93` — matches manifest.
- `OBLIGATIONS.csv`: `8d8cd5116fd8c5a95a588804a1f6352bc9a060133306c9d7b1fb8253eca02880` — matches manifest.
- `control/CLAIM-IDENTITY.run-local.json`: `b4a339eff1e2cdc04ceedcdd55fdd53697574bf64ed7e26631c50d84d56e470b` — matches manifest and
  `sources/SOURCE-DIGESTS.json`.
- `sources/mathlib-binding/PIN.json`: `af78b3d8e94a358eb69719280ba3bf79c7bf400d468c6143e07313dbfcbd3ba0` (toolchain
  `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`) — matches `sources/SOURCE-DIGESTS.json`.
- Seed project files copied byte-identically from `sources/first-interior/c2-primary-v2/LeanProject/` — `lakefile.toml`
  `45d0ca58145784d5f29322ff21a1335e350c38e72afe8d5396d9c9910b94ff49`, `lake-manifest.json`
  `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`, `lean-toolchain`
  `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` — all three match `sources/SOURCE-DIGESTS.json`.
- Template source `sources/r30/lean/lean-2026-09-28-c6-la2-spider-tree-weighted-hall-rank-k-plus-3/LeanProject/LeanProof/Main.lean`:
  `df5e287022083ad3b61c2efa3ce53953da22896145fb90046f871a082a4c60fc` — matches `sources/SOURCE-DIGESTS.json`.
- Carried entries (per-entry content hash printed after `ENTRY N BEGIN` in every r30 Main.lean that contains them — verified
  identical across the C1-LA1/C4-LA1/C5-LA1/C6-LA2 copies read): `C4LA1.IsGraphLeaf`
  `65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5`; `C5LA1.support`
  `8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4`; `C5LA1.leafSet`
  `78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697`; `E993Transport.support_eq_of_isGraphLeaf_of_adj`
  `16687f86fa9b55f6996ffb8d02fcf3cf1af6129033605d60c019f33c360b620d`; `E993Transport.tagWitnesses`
  `113d952167528dfc045eb79961e8fbff0326da8f04277799436d6c8962022025`; `E993Transport.mem_tagWitnesses_iff_of_adj`
  `772a13c0522f1c4b7c8d93dc3920688ea5649302271cbd8799d1c575e8773de5`.

## IMPORT LIST

- Lean scratch file (`import Mathlib` only; the pinned shared project, symlinked, supplies everything else).
- Python numeric instrument: standard library only — `hashlib`, `json`, `sys`.

## Registered claims named before any computation (`SEMANTIC-CONTRACT.md` §4; `sources/authority/CLAIM-IDENTITY.json` /
`control/CLAIM-IDENTITY.run-local.json`, searched for `CB` by `claim_key`, all `VERIFIED` at r30's grade — none re-confirmed or
re-graded here, cited only as dependency)

`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`; `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`;
`E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`;
`E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`;
`E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`;
`E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` (the favorability key: cited,
not reproved — see "Remaining obligation");
`E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`. No literal
`E993-…-CB-RECORD` key exists in the run-local registry under that exact name; `SEMANTIC-CONTRACT.md` §2's "r30 record
`R30-CB-RECORD`" is a mnemonic for the CB(d,m) structural definition (not itself a claim — a definition is never registered)
and for the closed forms/favorability/criterion keys above, which are.

**No new `E993-R31-` claim is proposed by this route.** This route formalizes, in Lean, structural facts already stated in
`SEMANTIC-CONTRACT.md` §2 as informal/carried r30 content (the CB(8,m) tree, its `IsTree` status, and
`α(CB(d,m)) = m(d+1)+1`); it does not assert a new mathematical fact. Per `C1-WORKER-COMMON-BRIEF.md` item 8, "a seat's compiled
declarations are scratch (no grade)" until a governed Stage 7 award funds them, so the alias-check machinery of item 5 (for a
proposed `E993-R31-` predicate) does not apply — there is no candidate key to check. For completeness, a lexical search of
`control/CLAIM-IDENTITY.run-local.json`'s 491 `claim_key`/`aliases` fields for `cbGraph`, "CB definition layer", "CB tree Lean"
and "CB independence number" found no existing claim of this specific formal-layer content (mathematically it is the same fact
as the cited closed form above, at that closed form's existing grade, never upgraded by this formalization).

## Step-by-step derivation

**Target of this route** (`C1-ALLOCATION.md`, U1's load-bearing obligation): the CB(8,m) definition layer in Lean, compiled
sorry-free in scratch — `cbEdge`, `cbGraph m : SimpleGraph (Fin (17*m+3))` with a frozen labelling, the decidability instance,
`IsTree`, `α = 9m+1` (both directions), the leaf classification `leafSet = {v} ∪ C`, and the witness sets `W_v = {r}`,
`W_{c_ij} = {u_i}`; "only as needed for the terminal, say which pieces the terminal consumes."

**Where each hypothesis enters** (this route touches no eligibility/selector/active-tag/relation/residue-class machinery —
those are T3/U3/U2's obligations; the hypotheses below are purely about the CB tree's own structure):

1. **Frozen labelling** (`sources/…/Main.lean`, `E993Transport` namespace, `cbEdge`/`cbGraph`/`cbVertex`). Vertices
   `Fin (17m+3)`. `0=r`, `1=s`, `2=v`; for `i<m`, `base(i)=3+17i`: `u_i=base(i)`, `b_{ij}=base(i)+1+2j` (`j<8`),
   `c_{ij}=base(i)+2+2j`. Edges `r–s`, `s–v`, `r–u_i`, `u_i–b_{ij}`, `b_{ij}–c_{ij}`. This is the ONE hypothesis this route
   introduces (a proposed frozen labelling, as the allocation asks); every later fact is proved FROM it, never assumed.
2. **`IsTree`** (`cbGraph_isTree`). Method: r30's child–parent-edge-bijection technique (C5-LA1 `gkGraph_isTree`, C6-LA2
   `spiderOneTwoThrees_isTree`), transcribed. `cbParentVal` gives every non-root label's parent; `cbParentVal_lt` (parent value
   strictly less than the vertex, for `n≥1`) makes the map `v ↦ s(v, parent v)` injective (`cbChildEdge_injective`); its range is
   exactly the edge set (`cbChildEdge_range`, a case-bash on `cbEdge`'s four edge shapes); the domain has `17m+2` elements
   (`cbGraph_card_nonroot`), giving exactly `17m+2` edges on `17m+3` vertices. Connectivity (`cbGraph_connected`) is an explicit
   walk of length ≤ 3 from the root to every vertex (`cbGraph_reachable_zero`), case-split on the labelling. `IsTree` =
   connected + `n-1` edges (`SimpleGraph.isTree_iff_connected_and_card`). No hypothesis on `m` needed here (holds for every
   `m:ℕ`, including `m=0`, the degenerate `r–s–v` path).
3. **Leaf classification** (`mem_leafSet_cbGraph_iff`, needs `hm : 0 < m`). A vertex is a leaf iff it has exactly one neighbour
   (`C4LA1.IsGraphLeaf`, carried). Degree count from the labelling: `r` has degree `m+1` (needs `m≥1` to exhibit `u_0` as a
   SECOND neighbour distinct from `s`, ruling `r` out — this is the ONLY place `m>0` enters this route's leaf/witness work);
   `s` has degree 2 (`r,v`) always; `v` has degree 1 (`s`) always; `u_i` has degree `9` (`r` plus `b_{i,0..7}`, using `8>0`
   to exhibit `b_{i0}` as a second neighbour) always; `b_{ij}` has degree 2 (`u_i,c_{ij}`) always; `c_{ij}` has degree 1
   (`b_{ij}`) always. `leafSet = {v} ∪ {c_{ij}: i<m,j<8}` — matches `SEMANTIC-CONTRACT.md` §2's `{v} ∪ C`, `|C|=8m`.
4. **`α(CB(8,m)) = 9m+1`** (`cbGraph_indepNum_eq`, needs `hm : 0 < m`). *Lower bound*: the explicit witness
   `{s} ∪ {u_i:i<m} ∪ {c_{ij}:i<m,j<8}` (`cbLowerWitness`, cardinality `9m+1` proved by exact `Finset.image`/`Finset.card`
   arithmetic, independence proved by a direct case-bash on `cbEdge`). *Upper bound* (`cbGraph_indepNum_le`, the harder
   direction — no closed-form/polynomial machinery, a direct partition argument): partition `V` into `{r}∪{u_i:i<m}` (a STAR —
   `r` is adjacent to every `u_i`, so any independent set meets this part in ≤ `m`, proved by cases on whether `r` itself is in
   the set, NOT by a naive "≤1 per pairwise-edge cell" trick, which is invalid here since the `u_i` are pairwise
   non-adjacent — this is the one place a plain edge-partition/cell argument, as used by the spider template, would silently
   overcount by `1`, and the fix is the explicit case split on `r`), `{s,v}` (an edge, ≤1, direct), and the `m` choke blocks
   `{b_{ij},c_{ij}:j<8}` (`8` disjoint edges each, ≤8 each, by an injective map into `Fin m × Fin 8` using
   `(x.val-3)/17` and `((x.val-3)%17-1)/2`, which sends BOTH `b_{ij}` and `c_{ij}` to `(i,j)` — matching pairs are handled by
   case-splitting on same-vs-different type and, in the different case, deriving a contradiction from independence via
   `cbGraph_adj_support_leaf`). Sum: `m+1+8m=9m+1`. `m>0` is used only to bound the star's local contribution by `m` (at
   `m=0` the "star" is empty and the bound is vacuous but the constant term would be off by one; irrelevant to this run's class,
   `m≥107`).
5. **`W_v={r}`, `W_{c_{ij}}={u_i}`** (`mem_cb_tagWitnesses_v_iff`, `mem_cb_tagWitnesses_leaf_iff`, needs the leaf facts of
   step 3). These are `tagWitnesses` (`N(s_τ)∖{τ}`, `SEMANTIC-CONTRACT.md` §1.2), NOT `C5LA1.support` itself — `v`'s SUPPORT is
   `s` (its only neighbour), and `W_v = N(s)∖{v} = {r,v}∖{v} = {r}`; `c_{ij}`'s support is `b_{ij}`, and
   `W_{c_{ij}} = N(b_{ij})∖{c_{ij}} = {u_i,c_{ij}}∖{c_{ij}} = {u_i}`. Proved via the carried, graph-generic
   `mem_tagWitnesses_iff_of_adj` (entry 124) plus a case-bash on `cbEdge` at the known support.
6. **The terminal's third conjunct, free of charge** (`cb_lowWindow`): `3*((16m+4)/3) < 2*(cbGraph m).indepNum+1` follows from
   step 4 alone by `omega`, for every `m≥1` — `3*((16m+4)/3) ≤ 16m+4 < 18m+3 = 2*(9m+1)+1` needs only `m≥1`, not `m≡2 (mod 3)`.

**Newton/Darroch**: not used anywhere in this route (no real-rootedness claim is made or needed; the α upper/lower bounds are
direct combinatorial arguments on the literal tree, not polynomial coefficient arguments).

## Compilation record (numeric claim 1: the Lean certificate)

File `scratchpad/c1-U1/LeanProject/LeanProof/Main.lean`, 837 lines, SHA-256
`c6d2279cd3f5e254e950dc860b30b90943e17047ef89af7907a6bedc596ef5e7`. Compiles sorry-free (`grep sorry` → no matches). Axiom audit
(`#print axioms`, appended to a disposable copy of the file, run and then deleted — never left in the shipped file) on the five
substantive results: `E993Transport.cbGraph_isTree`, `E993Transport.cbGraph_indepNum_eq`,
`E993Transport.mem_leafSet_cbGraph_iff`, `E993Transport.mem_cb_tagWitnesses_v_iff`, `E993Transport.mem_cb_tagWitnesses_leaf_iff`,
and `E993Transport.cb_lowWindow` — all six depend on exactly `[propext, Classical.choice, Quot.sound]` (Lean/Mathlib's standard
axioms; no `sorryAx`).

Replay (copy out first, target `scratchpad/c1-U1-replay`, never `/tmp`):
```
mkdir -p /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-U1-replay/lean-check
cp -r /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-U1/LeanProject \
      /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-U1-replay/lean-check/
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-U1-replay/lean-check/LeanProject
mkdir -p .lake && ln -sf /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages .lake/packages
lake env lean LeanProof/Main.lean   # exits 0, no output, on the pinned toolchain/Mathlib rev above
```
This is a **compiled scratch declaration** (`C1-WORKER-COMMON-BRIEF.md` item 8: "a seat's compiled declarations are scratch (no
grade)") — a Lean certificate of a Tier-3 carried fact, not a governed Stage 7 award. It has no grade of its own; it is offered
as the definition layer the terminal Lean target (`SOLUTION-CONTRACT.md` §2) needs.

## Numeric claim 2: independent cross-check of the closed forms

`scratchpad/c1-U1/cb_indepnum_check.py`, IMPORT LIST `hashlib, json, sys` (standard library only), SHA-256
`b68699d201947dbc85e2f22d11f1c04dd634b8ccceff689ffafc260d0eb0d4d9`. Builds the exact adjacency list of `CB(d,m)` from the SAME
labelling as the Lean `cbEdge`, checks connectivity and acyclicity in code (`is_connected` by explicit traversal;
`is_tree := connected ∧ edges = n-1`), and computes `α` exactly by the standard O(n) rooted-tree DP (not the Lean proof — an
independent instrument, exact integer arithmetic throughout, no floating point). Sampled at `m ∈ {1,2,3,5,10,95,107,110,113,200}`
(`d=8` fixed, matching the run's target; the two named fresh test rows `m=110,113` and the class's first certified row `m=107`
are included). Result: `n=17m+3`, `edges=17m+2`, `is_tree=True`, `α=9m+1`, `leafCount=8m+1` at every sampled `m` — all
`*_match` fields `true`, `all_checks_pass: true`. Result digest (over the result object before the digest field itself is added;
no wall-clock/PID/host field is hashed): `b1e4a7b2136b53dad7f5e5c2f25ffc3e70dd4f8a23cb56f3e3a9f19a33aad633`.

Replay (copy out first):
```
mkdir -p /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-U1-replay
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-U1/cb_indepnum_check.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-U1-replay/
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-U1-replay
python3 -B cb_indepnum_check.py
```
This is a numeric sanity instrument, not a proof; the Lean file above is the certificate of record for this route.

## Grades

Both artifacts are **compiled / scratch** (no grade of their own, per `C1-WORKER-COMMON-BRIEF.md` item 8): a compiled Lean
formalization and a Python cross-check of Tier-3 carried facts (`α(CB(d,m))=m(d+1)+1`, `SEMANTIC-CONTRACT.md` §2, cited above at
its `proved_informal`-modulo-Darroch/Newton grade — note the CITED closed form's own r30 derivation used Darroch/Newton on
real-rooted factors elsewhere in its proof; THIS route's α upper/lower bound arguments use no such machinery and are exact
combinatorics, so this Lean/Python work adds no new Darroch/Newton dependency). Neither artifact upgrades, downgrades, or
re-registers that grade. Attained horizon: the definition layer compiles for every `m:ℕ` (`IsTree`) and every `m≥1`
(leaf/independence/witness facts); no obstruction found; no new formal or informal theorem beyond the already-cited closed form
is claimed.

## Alias check (lexical and mathematical)

No new claim is proposed (see above), so there is nothing to alias-check against `CLAIM-IDENTITY.run-local.json` as a
REGISTRATION step. As a discipline check anyway: lexically, no run-local `claim_key` or `aliases` field matches "CB definition
layer", "CB(8,m) Lean", "CB tree formalization", or "CB independence number Lean" (searched the full 491-entry array).
Mathematically, the content proved here (`α(CB(d,m))=m(d+1)+1`, `IsTree`, the leaf/witness sets) is the SAME fact as
`SEMANTIC-CONTRACT.md` §2's inherited `R30-CB-RECORD` content and the cited closed-form/favorability keys above — not a
different or stronger statement, so even informally it could not be filed as a new `E993-R31-` predicate without duplicating an
existing one (which `SOLUTION-CONTRACT.md` §2 explicitly forbids: "Do not substitute already known identities for the missing
uniform result").

## Gate lines (`C1-STAGE1-GATE.md` ruling 6)

```
LS_top: not_advanced
ELIG_top: not_advanced
cut_candidate: none
```

## headline_resolved

`headline_resolved: no`

## Route verdict

**`compiled`** — a sorry-free Lean formalization of the CB(8,m) definition layer (tree structure, `IsTree`, `α=9m+1` both
directions, leaf classification, witness sets, and the terminal's third conjunct as a free corollary), independently
cross-checked numerically; no new mathematical claim; no obstruction found; (L-S)_top and (ELIG-top)(a) untouched.

## Remaining obligation

A successor building the terminal Lean award (`SOLUTION-CONTRACT.md` §2) from this layer inherits:

1. **The frozen labelling is a PROPOSAL, not yet synthesis-frozen.** `0=r,1=s,2=v`; `base(i)=3+17i`; `u_i=base(i)`;
   `b_{ij}=base(i)+1+2j`; `c_{ij}=base(i)+2+2j` (`i<m,j<8`). If the Stage 7 synthesis adopts a DIFFERENT labelling (e.g. to
   align with a sibling U-seat's independent construction — routes this cycle cannot read each other's returns), every lemma
   here transports verbatim under a relabelling isomorphism, but the labelling itself must be re-frozen on the synthesis's face.
2. **Not built**: `favorableLeaves (cbGraph m) p* = C5LA1.leafSet (cbGraph m)`. This needs the EXTERNAL favorability key
   (`E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`, `proved_informal`
   modulo Darroch/Newton, cited above, NOT formalized by any route this cycle to my knowledge) — until it is formalized or
   otherwise composed, the terminal's fourth conjunct cannot be assembled even with U2's sector-composition lemma in hand.
3. **Not built**: `C5LA1.crossingIndex (cbGraph m) + 2 ≤ p*` (the terminal's second conjunct) — T3/U3's obligation
   ((ELIG-top)(a) and the actual-first-descent composition), entirely untouched by this route.
4. **Not built**: any instantiation of `IsSaturatingFlow`/`WeightedHall` on `cbGraph m` itself — these are carried generic
   definitions (entries 18, 20–21 of the C1-LA1/C4-LA1 Snippets); U2's sector-certificate composition lemma is the piece that
   turns a per-state allocation into a literal saturating flow on THIS graph, and is not attempted here.
5. **The upper-bound independence argument's star case is the one place a naive per-choke "cell" bound (as used by the r30
   spider/G_k templates for their lower-degree-root structures) would overcount by exactly 1** (`9m+2` instead of `9m+1`) if
   applied uncritically to CB(8,m)'s degree-`(m+1)` root; a future route reusing this style of argument on a DIFFERENT CB-like
   family should re-derive the star bound rather than transplanting the spider/G_k cell function.
6. This route's `cbGraph`, being newly authored, is NOT yet carried into any OTHER seat's Snippets; a successor wanting to
   build on it should carry `cbEdge`, `cbGraph`, `cbGraph_decAdj`, `cbVertex`(+`_val`,`eq_cbVertex_iff`), `cbGraph_isTree`,
   `cbGraph_indepNum_eq`, `mem_leafSet_cbGraph_iff`, `mem_cb_tagWitnesses_v_iff`, `mem_cb_tagWitnesses_leaf_iff`, and
   `cb_lowWindow` byte-identically from this file (SHA-256 above), not re-type them.

## Disclosures

- **Read-boundary disclosure**: see "Boot acknowledgment" above (harness-injected user memory, not fetched by this seat, not
  used).
- No sibling returns, critic work, other experiment roots, or external/networked sources were read. No `find`/`grep`/`rg`/`ls
  -R` was run rooted above this route's grant; all searches (a handful of `find -maxdepth N` and `grep` calls used to locate
  specific Snippets filenames and to search `CLAIM-IDENTITY.run-local.json`'s content) were rooted at or below `sources/` or at
  `control/CLAIM-IDENTITY.run-local.json` itself, both within the grant.
- No background jobs were left running; every `lake env lean` invocation ran to completion in the foreground before the next
  command. `ps aux` was checked once at the end (no PID filtering needed — no long job was ever backgrounded).
- No writes occurred under `sources/`, under any other experiment root, or under `/tmp`. All scratch is under
  `scratchpad/c1-U1/`; both replay artifacts are under `scratchpad/c1-U1-replay/`.
- This return's own numeric claims (Lean compilation exit status; the Python cross-check's `all_checks_pass`) are the only
  "computations reported as evidence" in this return; the registered claims they touch are named above, before this section.
