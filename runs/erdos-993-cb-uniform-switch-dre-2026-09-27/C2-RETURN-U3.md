# RETURN — Route U3, Cycle 2, r31 (Erdős #993, CB uniform switch)

**Route ID:** `C2-U-03`
**Mechanism token:** `FORMAL-CB-INDEPENDENCE-POLYNOMIAL-CLOSED-FORMS`
**Orientation:** U (formal / structural)
**Load-bearing obligation (verbatim from `control/C2-ALLOCATION.md`, U3 section):** prove in Lean,
over C1-LA2's `cbGraph m`, that the number of independent sets of size `k` equals the `k`-th
coefficient of the closed form of record (and the same for `cbGraph m − v` and `cbGraph m − c_ij`,
as far as reached), linking `C5LA1.crossingIndex (cbGraph m)` to the closed-form coefficients —
the formal link conjunct 2 needs from U1's integer theorem. Infrastructure (the closed forms are
`proved_informal` nodes), not Tier 2 progress. Deliver compiled scratch or the exact blocked node.

## Boot acknowledgment

Booted VerityOS per the dispatch's exact boot grant: read, in full, `/Users/ashtonsperry/VerityOS/verity.md`
(443 lines) and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (326 lines), and nothing else
of VerityOS's own startup map (no memory/, conversations/, modules/, skills/, logs/, decisions/ reads
for this run — the controller has booted for the run).

## Read-boundary disclosures

Two disclosures, both harmless but recorded in full per the brief's instruction that any non-authorized
VerityOS read or any write outside the granted scratch is a disclosure:

1. **Outer-harness pre-read.** Before opening the dispatch file, the invoking harness's own project-level
   `CLAUDE.md` (outside this run's `control/`) directed a generic VerityOS boot procedure, and under its
   task-type map I read `/Users/ashtonsperry/VerityOS/skills/optimization-loop/skill.md` (~200 lines)
   prior to reaching and reading `DISPATCH-U3.md`. This is a VerityOS file outside the two-file boot grant
   this dispatch authorizes for a seat. No content from it was used in this route's mathematics or Lean
   work; it is reported here only because the dispatch requires disclosing any such read.
2. **Transient `/tmp` write (immediately corrected).** While debugging one `isIndepSet_iff` name-resolution
   error, I briefly wrote a throwaway two-line `#check` probe to `/tmp/check_isindep_test.lean` instead of
   under this route's scratch directory. It was never compiled/run against the project and was deleted
   (`rm -f`) within the same turn, before any further action. The actual resolving probe was then redone
   correctly inside `scratchpad/c2-U3/LeanProject/LeanProof/U3check.lean` (also removed once its answer
   was used) and `scratchpad/c2-U3/LeanProject/LeanProof.lean` (briefly repointed, then restored). The
   file this route wrote under `/tmp` no longer exists there. Flagged per the brief's rule that scratch
   must never land under `/tmp`. Note for the record: a final sweep of `/tmp` (`ls /tmp/*.lean`) found
   several `.lean` files (`probe.lean`, `repro*.lean`, `mini_test.lean`, `tail_only.lean`,
   `append*.lean`) this route did not create, did not touch, and did not read — presumably scratch from
   another concurrent process on the same host (possibly a sibling seat); they are reported here only so
   their presence is not mistaken for this route's doing.

## Controller fact CF-C2-G

Read and digest-verified `control/C2-STAGE3-CONTROLLER-FACT-G.json`
(SHA-256 `7582bb5e0cc16778bdf702596f303559b9528ac953d5e1a4104bd8c7a5c408f3`, matches). The fact: the
Cycle 2 allocation's own U1 prose states `G = (1+x)^8 + x(1+2x)^8`, which has the two binomial
factors swapped; the object of record is `SEMANTIC-CONTRACT.md` §2, `G = (1+2x)^d + x(1+x)^d` at
`d = 8`, i.e. `G = (1+2x)^8 + x(1+x)^8`.

**Disposition for this route: nothing to redo.** U3's Lean work (below) never encodes `G`, `I(CB(8,m))`,
or any polynomial closed form as a Lean term — it builds only the graph-generic and CB-generic
*combinatorial* bridge (`indepSetCount`/leaf-deletion recursion) that a later step will need to connect
to whichever closed form is used. My own prior reading of `SEMANTIC-CONTRACT.md` §2 (done before this
controller fact arrived, during the mandated read order) already recorded the correct, non-swapped
form `G = (1+2x)^8 + x(1+x)^8`, `I(CB(8,m)) = (1+2x)G^m + x(1+x)(1+2x)^{8m}`, so no prose or Lean of
mine needed correction either.

## Stage 2 seal and digest verification

- **Stage 2 packet manifest seal** (`control/C2-STAGE2-PACKET-MANIFEST.json`, 2799 files): recomputed
  SHA-256 of the canonical JSON (all keys except `seal_sha256`, `sort_keys=True`,
  `separators=(",",":")`, no trailing newline) = `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`
  — **MATCH** against the stored `seal_sha256`.
- **C1-LA2 award, all 83 files used** (Main.lean, `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`,
  all 78 `Snippets/*.lean.fragment`, `FORMALIZATION-STATE.json`), verified file-by-file against
  `sources/c1-results/SOURCE-DIGESTS.json`: **ALL OK**. In particular `Main.lean` sha256
  `a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f` (84219 bytes, 1701 lines).
- **Mathlib pin** (`sources/mathlib-binding/PIN.json`, sha256 `af78b3d8e94a358eb69719280ba3bf79c7bf400d468c6143e07313dbfcbd3ba0`,
  verified against `sources/SOURCE-DIGESTS.json`): toolchain `leanprover/lean4:v4.32.2`, Mathlib rev
  `905b95818eb32af7874a58b427f50c1711a5e96c`. Confirmed against the live shared project's own
  `git rev-parse HEAD` (matches) and against the scratch `LeanProject`'s carried `lakefile.toml`/
  `lake-manifest.json` (matches).
- Documents read in full per the mandated order: `control/C2-WORKER-COMMON-BRIEF.md`,
  `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C2-ALLOCATION.md`, `control/C2-STAGE1-GATE.md`,
  `cycles/cycle-2/stage2/ROUTE-STATE.md`. (`AUTHORIZATION.md`, `control/R31-CHARTER-PROMPT.md`, the
  run-local registry and `OBLIGATIONS.csv` were listed in the manifest but not separately needed by this
  route's mechanics beyond what the six documents above already fix; nothing in them was relied upon
  without being named here.)
- No file was read above this seat's grant (no `sources/` recursive listing beyond the targeted paths
  named above; no read of `cycles/` outside `cycles/cycle-2/stage2/ROUTE-STATE.md` and this route's own
  `cycles/cycle-2/stage3/returns/U3/`; no sibling return, critic, or adjudicator file read; no network
  access; no package installs).

## Naming clarification (not a defect; recorded for citation hygiene)

`control/C2-ALLOCATION.md`'s U3 section cites "`C5LA1.crossingIndex` (entry 0035)". In the CARRIED
`sources/c1-results/.../C1-LA2/LeanProject/LeanProof/Main.lean`'s own snippet numbering (verified
above), `crossingIndex` is entry **22**; entry **35** is `cbGraph_adj_iff`. "Entry 0035" is r30
C6-LA2's *original* numbering for `crossingIndex` before C1-LA2 carried and renumbered it (gate ruling
12 names exactly this: "C1-LA2: the CB layer, itself carrying r30 C6-LA2 entries 1–21, 0035, 0123,
0124"). This route cites C1-LA2's own numbers throughout (entry 22 for `crossingIndex`, entry 10 for
`indepSetCount`, entries 7/8 for `H`/`R`, entries 67/68/39/42 for the two leaf facts used below) to
avoid this cross-run ambiguity.

## What this route found: no existing formal bridge, and no closed-form route elsewhere

Before writing anything, I checked (within grant, inside `sources/`) whether a generic combinatorial
bridge from `C5LA1.indepSetCount`/`crossingIndex` to a *closed-form polynomial* coefficient identity
already existed anywhere carried into this run:

- `sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/LeanProject/LeanProof/Main.lean`
  works entirely with `Polynomial.coeff` over `ℤ[X]` for the abstract family `(1+X)^a(1+2X)^b`; it never
  touches `indepSetCount` or any `SimpleGraph`. No bridge there.
- `sources/r30/lean/lean-2026-09-28-c6-la2-spider-tree-weighted-hall-rank-k-plus-3/LeanProject/LeanProof/Main.lean`
  (the one prior award that bounds a `crossingIndex` on a concrete parametrized tree family, the spider
  `S(1,2,3^k)`) does **not** go through a closed-form polynomial at all: its
  `spiderOneTwoThrees_crossingIndex_le` is proved by a direct combinatorial **injection**
  (`spiderRootSplitDown`) between independent-set families at adjacent ranks, never identifying
  `indepSetCount` with a coefficient of a generating function.

So the bridge this route was asked to build is genuinely new infrastructure, not a re-derivation of
something already carried (Solution Contract §2, Lean targets: "Build the CB definition layer only as
needed" — and gate ruling 13 forbids re-proving the already-closed; this is not that, it targets a gap).
This also means U1's own route (which DOES go through the closed-form polynomial, per its own mandate)
needs exactly this bridge and cannot get it from the spider precedent.

## Strategy

Per the allocation's stated options ("a tree/forest independence-polynomial recursion (deletion of a
leaf and its support), or a product formula over the chokes' branches; state which"): **the
deletion/leaf recursion**, proved once at maximal generality (any simple graph, any vertex, not just a
leaf), then specialized. This is Node 0 below. A full product formula over the `m` choke branches
(needed to reach the actual closed form `I(CB(8,m))`) is *not* attempted in this route; it is named
exactly in `## Remaining obligation`.

## Lean work (compiled scratch, sorry-free, no grade)

**IMPORT LIST.** This route ships no Python numeric-claim generator (no numeric census in this route —
see "Registered claims" below), so the brief's "IMPORT LIST (standard library only)" clause has no
Python file to apply to. The one artifact is a Lean file with a single import:
```
import LeanProof.Main
```
(`LeanProof.Main` itself is the carried, digest-verified C1-LA2 award; it in turn `import Mathlib`,
pinned per `PIN.json` above.) No other imports, no `native_decide`, no new `axiom`, no `sorry`.

**File:** `scratchpad/c2-U3/LeanProject/LeanProof/U3.lean` (198 lines after the file's own `import`
line; final SHA-256 `bacc48086c1306548f9757f63b041a0ed2ca8151629509ccd7e0e4cb9f25e9e0`).
`LeanProof/Main.lean` in the same scratch tree is byte-identical to the carried award (verified above;
never edited). `LeanProof.lean` was updated to `import LeanProof.Main` then `import LeanProof.U3`.
Mathlib bound by manual symlink (`LeanProject/.lake/packages -> .../mathlib-v4.32.2-project/.lake/packages`),
never copied; no `lake update`/`lake clean`/`elan` invoked; every `lake`/`lean` call was run with `cd`
into the project first, in the foreground (no detached/background jobs, nothing to kill).

### Theorem 1 — Node 0: generic vertex-split recursion

```lean
theorem indepSetCount_succ_split (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (x : V) (hx : x ∉ D) (k : ℕ) :
    C5LA1.indepSetCount G D (k + 1) =
      C5LA1.indepSetCount G (insert x D) (k + 1) +
        C5LA1.indepSetCount G (insert x (D ∪ G.neighborFinset x)) k
```

**Step-by-step derivation, naming where each hypothesis enters.**

1. Unfold `C5LA1.indepSetCount G D (k+1)` to `(C5LA1.indepSetsAvoiding G D (k+1)).card`
   (Main.lean entries 9–10, carried, unedited).
2. Partition this Finset of independent `(k+1)`-subsets by whether `x ∈ A`, using
   `Finset.card_filter_add_card_filter_not` (a pure `Finset`/`DecidablePred` fact; **hypothesis
   `[DecidableEq V]` enters here**, giving decidability of `x ∈ A` for each `A`).
3. **Branch `x ∉ A`.** `A ⊆ univ\D ∧ x∉A ↔ A ⊆ univ\(insert x D)`: a pure `Finset.mem_sdiff`/
   `Finset.mem_insert` unfolding, no graph structure used at all. This identifies the branch's card
   with `C5LA1.indepSetCount G (insert x D) (k+1)` exactly (not up to a correction term).
4. **Branch `x ∈ A`.** Exhibit the bijection `A ↦ A.erase x` onto
   `C5LA1.indepSetsAvoiding G (insert x (D ∪ N(x))) k`:
   - *Forward.* For `a ∈ A.erase x`: `a ≠ x` (erase) and `a ∈ A`. **Hypothesis `x ∈ A` enters** (needed
     to invoke independence between `x` and `a`): `G.IsIndepSet ↑A` unfolded via `isIndepSet_iff`
     (`Set.Pairwise`) at the pair `(x, a)`, `x ≠ a`, gives `¬G.Adj x a`, i.e. `a ∉ N(x)`. Combined with
     `a ∈ A ⊆ univ\D` (so `a ∉ D`) and `a ≠ x`, this places `a` outside `insert x (D ∪ N(x))`.
     Cardinality: `(A.erase x).card = A.card - 1 = k` from `A.card = k+1` (`Finset.card_erase_of_mem`,
     **needs `x ∈ A`**). Independence of `A.erase x` follows from independence of `A` by
     `Set.Pairwise.mono` on `↑(A.erase x) ⊆ ↑A` — monotonicity of pairwise properties under subset, no
     graph-specific content.
   - *Backward.* For `B` independent, `B ⊆ univ\(insert x(D∪N(x)))`, `|B| = k`: first `x ∉ B` (since
     `x ∈ insert x (D∪N(x))` trivially, so `B`'s own subset condition excludes it). Build
     `A := insert x B`. Subset: for `a = x`, uses the *outer* hypothesis `x ∉ D` directly; for `a ∈ B`,
     `a ∉ D` since `a ∉ insert x(D∪N(x)) ⊇ D`. Cardinality: `Finset.card_insert_of_notMem` with the
     just-established `x ∉ B`. Independence of `insert x B`: `Set.pairwise_insert_of_symm_of_notMem`
     (**this is where `SimpleGraph.Adj`'s symmetry is used explicitly**, via a local
     `Std.Symm (fun p q => ¬G.Adj p q)` instance built from `G.Adj`'s own `.symm`), reducing to
     independence of `B` (given) plus `∀ b ∈ B, ¬G.Adj x b`, which holds because `B` avoids `N(x)`
     by its subset condition (`Finset.mem_neighborFinset` translates `b ∈ N(x)` to `G.Adj x b`).
   - Injectivity of `B ↦ insert x B` on this domain: every `B` in it satisfies `x ∉ B` (same argument
     as above, re-derived for the `card_image_of_injOn` step since it is stated over the domain
     Finset directly rather than the destructured hypothesis); then `Finset.erase_insert` inverts
     `insert x` on both sides of an assumed equality `insert x B₁ = insert x B₂`, forcing `B₁ = B₂`.
5. Sum the two branches (`Finset.card_image_of_injOn` turns the second branch's card into
   `C5LA1.indepSetCount G (insert x (D∪N(x))) k` via the image-card-equals-domain-card fact for an
   injective map); `congr 1` matches this against the theorem's stated RHS.

Fully compiled: `lake build LeanProof.U3` → `Build completed successfully`; `#print axioms` on this
theorem returned exactly `[propext, Classical.choice, Quot.sound]` (the three standard Lean/Mathlib
axioms; no `sorryAx`, confirming no `sorry` anywhere in the proof term, consistent with a `grep -n
sorry` over the file returning nothing).

### Theorem 2 — generic leaf corollary

```lean
theorem leaf_neighborFinset_eq (G : SimpleGraph V) [DecidableRel G.Adj] (x s : V)
    (hx : C4LA1.IsGraphLeaf G x) (hxs : G.Adj x s) : G.neighborFinset x = {s}

theorem indepSetCount_succ_split_at_leaf (G : SimpleGraph V) [DecidableRel G.Adj] (x s : V)
    (hx : C4LA1.IsGraphLeaf G x) (hxs : G.Adj x s) (k : ℕ) :
    C5LA1.indepSetCount G ∅ (k + 1) =
      C4LA1.vertexDeletionIndepSetCount G x (k + 1) +
        C5LA1.indepSetCount G (C5LA1.H G x) k
```

**Derivation.** `IsGraphLeaf` (`∃!`) gives the unique neighbour `s`; combined with `G.Adj x s` this
forces `G.neighborFinset x = {s}` (uniqueness clause applied twice, once to `s` once to any `w ∈ N(x)`,
then transitivity). `C5LA1.support G x = s` is **not reproved**: it is the already-carried, graph-generic
`support_eq_of_isGraphLeaf_of_adj` (Main.lean entry 31, r30 C6-LA2). Together these identify
`insert x (∅ ∪ N(x))` with `C5LA1.H G x = {x, support G x}` literally (`ext`+`simp`), and a one-line
`Finset.erase_eq`/`Finset.insert_empty` calculation identifies `C5LA1.indepSetCount G {x} (k+1)` with
the already-carried `C4LA1.vertexDeletionIndepSetCount G x (k+1)` (Main.lean entry 1). Applying
Theorem 1 at `D = ∅` and rewriting both identifications gives the stated recursion. This is exactly the
literal-network form of the informal `i_k(G) = i_k(G-v) + i_{k-1}(G-\{v,s_v\})` recursion that
`C5LA1.aggregate` (Main.lean entry 12) already uses through `H`/`R`, but derived here from first
principles rather than assumed.

### Theorems 3–4 — instantiated at `CB(8,m)`'s two leaf classes

```lean
theorem cb_v_indepSetCount_succ_split (m k : ℕ) :
    C5LA1.indepSetCount (cbGraph m) ∅ (k + 1) =
      C4LA1.vertexDeletionIndepSetCount (cbGraph m) (cbVertex m 2) (k + 1) +
        C5LA1.indepSetCount (cbGraph m) (C5LA1.H (cbGraph m) (cbVertex m 2)) k

theorem cb_leaf_indepSetCount_succ_split (m i j : ℕ) (hi : i < m) (hj : j < 8) (k : ℕ) :
    C5LA1.indepSetCount (cbGraph m) ∅ (k + 1) =
      C4LA1.vertexDeletionIndepSetCount (cbGraph m) (cbVertex m (3+17*i+2+2*j)) (k+1) +
        C5LA1.indepSetCount (cbGraph m) (C5LA1.H (cbGraph m) (cbVertex m (3+17*i+2+2*j))) k
```

These instantiate Theorem 2 at `x = v` (`cbVertex m 2`, support `s = cbVertex m 1`, using the carried
`cb_isGraphLeaf_v` / `cbGraph_adj_s_v`, Main.lean entries 67/39) and at `x = c_{ij}` (support
`b_{ij} = cbVertex m (3+17i+1+2j)`, using the carried `cb_isGraphLeaf_leaf` / `cbGraph_adj_support_leaf`,
entries 68/42). Both are one-line applications with zero new trust beyond Theorem 2 and the four cited
carried facts.

**Build record.** `lake build LeanProof.U3` → `✔/⚠ [8656/8656] Built LeanProof.U3` (one harmless linter
warning: an unused `[DecidableEq V]` section variable on `leaf_neighborFinset_eq`, not a proof issue).
`#print axioms` on all five theorems returned exactly `[propext, Classical.choice, Quot.sound]` for each.
`grep -n "sorry\|native_decide\|axiom\b" LeanProof/U3.lean` → no matches.

## Replay (copy-out-first)

```
bash /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-U3-replay/replay-U3.sh
```
This script (itself under the run's scratch, never `/tmp`) copies the carried C1-LA2 project files plus
this route's `U3.lean` into a fresh `scratchpad/c2-U3-replay/LeanProject/`, re-symlinks the pinned shared
Mathlib, prints the SHA-256 of both `Main.lean` (expect
`a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f`) and `U3.lean` (expect
`bacc48086c1306548f9757f63b041a0ed2ca8151629509ccd7e0e4cb9f25e9e0`), and runs
`lake build LeanProof.U3`. **Already executed once in this route as an independent check**: both
digests matched and the build succeeded (`Build completed successfully (8656 jobs)`).

## Registered claims, census, and grades

**No numeric census was performed in this route** (no table of `(m, x, Δ_k)` rows; this route is pure
Lean formalization, not a network/coefficient computation), so the brief's "`x` and `Δ_k` with the
difference index on every row" and "acyclicity-and-connectivity tests in code" clauses (both aimed at
network/numeric instruments) are **not applicable** here — this route builds no transport-network
instrument and asserts no `(WID)` supply/capacity fact.

**No registered claim was confirmed, touched, or re-derived.** This route's five theorems are new,
graph-generic and CB-specific *scratch* declarations under `E993Transport`, not statements of any
`E993-…` registered key. Per Solution Contract §4 and the worker brief §8 ("a seat's compiled
declarations are scratch (no grade)"), **none of the five theorems above carries a grade**; they are
compiled infrastructure only. No new claim in the `E993-R31-` namespace is proposed by this route, so
the alias-check requirement (lexical and mathematical, against the run-local registry and the frozen
concurrent master-494) is satisfied vacuously — there is nothing to check in. (For the avoidance of
doubt: the Lean identifiers `indepSetCount_succ_split`, `leaf_neighborFinset_eq`,
`indepSetCount_succ_split_at_leaf`, `cb_v_indepSetCount_succ_split`, `cb_leaf_indepSetCount_succ_split`
are ordinary Lean declaration names inside the carried `E993Transport` namespace, not registry keys, and
do not collide lexically or mathematically with any registered `E993-…` key or with any other carried
Lean declaration name in `Main.lean`'s 78 entries, checked by direct inspection of the entry list above.)

## Gate lines (ruling 14)

```
ELIG_formal: advanced
HALL_formal: not_advanced
FAV_darroch_free: not_advanced
cut_candidate: none
```

`ELIG_formal: advanced` because this route delivers the missing generic bridge
(`indepSetCount_succ_split` + `indepSetCount_succ_split_at_leaf`) that U1's closed-form route to
(ELIG-top)(a) needs to connect `C5LA1.crossingIndex (cbGraph m)` to any coefficient identity it proves
about `I(CB(8,m); x)`; it does **not** itself advance (ELIG-top)(a) to a higher grade (that inequality
remains `computer_assisted`/open per Cycle 1's record) — only the *formal wiring* for a future proof to
use is new. `HALL_formal`/`FAV_darroch_free`: this route touches neither the sector-certificate/flow
side nor Darroch/Newton removal at all, so both are unaffected by this route's work.

## Route verdict

**`compiled`** — new, sorry-free, kernel-checked Lean infrastructure (five theorems, `#print axioms`
clean on each), directly matching the allocation's own framing of U3 as infrastructure rather than
Tier 1/2 progress ("the closed forms are `proved_informal` nodes, not Tier 2 progress. Deliver compiled
scratch or the exact blocked node").

`headline_resolved: no`

## Remaining obligation

Written as what a successor inherits, in the order a successor should attempt it:

1. **The m-ary branch product (the actual blocked node).** Node 0 (`indepSetCount_succ_split`) splits
   on ONE vertex. It has not been applied at the root `r = cbVertex m 0` in this route (a one-line
   application exactly like the two leaf instantiations above — flagged but not executed here, to keep
   this route's scope to what was fully checked). Doing so gives
   `indepSetCount (cbGraph m) ∅ (k+1) = indepSetCount (cbGraph m) {r} (k+1) + indepSetCount (cbGraph m) (closedNbhd r) k`,
   but `cbGraph m − r` is `m` vertex-disjoint copies of the same 17-vertex "choke gadget" plus the
   `{s,v}` pendant — connecting THIS to the actual closed form `I(CB(8,m))` (§2:
   `(1+2x)G^m + x(1+x)(1+2x)^{8m}`, `G=(1+2x)^8+x(1+x)^8`, confirmed non-swapped per controller fact
   CF-C2-G above) needs a genuinely new **generic disjoint-union multiplicativity lemma** for
   `C5LA1.indepSetCount` over a Finset partition into components with no cross-edges (a convolution
   identity: `indepSetCount G D k = Σ_{k1+k2=k} indepSetCount (component 1) k1 · indepSetCount
   (component 2) k2` when no edges cross), applied `m` times (or once via an explicit product/`Finset.sum`
   over `Fin m → ℕ` compositions). This is the load-bearing gap; Node 0 alone does not close it and no
   attempt at it is compiled here (it is a materially larger lemma than Node 0 — likely comparable in
   size to Node 0 itself, or larger, given the need for a `Nat.antidiagonal`-style convolution and an
   induction over `m` copies).
2. **Formalizing `I(CB(8,m);x)` itself** as a Lean object (a `Polynomial ℤ` built from the block
   decomposition in `SEMANTIC-CONTRACT.md` §2) and stating the target coefficient-equality theorem
   precisely, so the multiplicativity lemma of (1) has something concrete to be composed against.
3. **The same one level down**, for `I(CB(8,m) − v)` and `I(CB(8,m) − c_{ij})`: Theorems 3–4 above give
   `indepSetCount (cbGraph m) (H (cbGraph m) x) k` as a residual term, but `cbGraph m` with `{x,
   support x}` deleted is not literally `cbGraph m'` for a smaller `m` — a further per-branch argument
   (structurally the same shape as (1), on `m` branches for the `v` case, or on `m−1` untouched branches
   plus one damaged branch for the `c_{ij}` case, matching `G_c` in `SEMANTIC-CONTRACT.md` §2) is needed
   there too.
4. **Closing the link to `crossingIndex`.** Once (1)–(2) give `indepSetCount (cbGraph m) ∅ k = i_k` (the
   closed-form coefficient) for the relevant range of `k`, `C5LA1.crossingIndex`'s `Nat.find`
   definition (Main.lean entry 22) turns U1's integer coefficient inequality directly into
   `crossingIndex (cbGraph m) + 2 ≤ p*`, closing conjunct 2 of the terminal theorem
   `cb8_topRank_of_descent_and_flow` (Main.lean entry 78). The `Nat.find_le` idiom for exactly this step
   is already demonstrated, for a different graph, in the carried r30 award at
   `sources/r30/lean/lean-2026-09-28-c6-la2-spider-tree-weighted-hall-rank-k-plus-3/LeanProject/LeanProof/Main.lean`
   (`spiderOneTwoThrees_crossingIndex_le`).
5. **A strategic note, not a finding, for the controller/synthesis to weigh (does not bind U1's
   chartered route):** that same r30 spider award bounds `crossingIndex` on a comparable parametrized
   tree family WITHOUT ever building a closed-form/generating-function bridge — it uses a direct
   combinatorial injection between independent-set families at adjacent ranks
   (`spiderRootSplitDown`). If (1)–(3) above prove heavier than expected, a successor (or U1 itself)
   should weigh whether an analogous direct injection for `CB(8,m)` at rank `p*−1`/`p*−2` is cheaper
   than completing the full branch-product/closed-form route — a strategic option, not a change to any
   grade or to U1's mandate.

## Model disclosure

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id:
`claude-sonnet-5`.

## Background jobs

None outstanding. Every `lake build`/`lake env lean` invocation in this route ran to completion in the
foreground via direct tool calls; nothing was started detached; there is no PID to poll or kill.
