# RETURN — Route F2, Cycle 1, r30 (correctly weighted mixed-boundary transport)

**Route:** `C1-F-02 FIDELITY-AND-MECHANISM-EQUIVALENCE`, orientation F (falsify).
**Mechanism token:** `FIDELITY-AND-MECHANISM-EQUIVALENCE`.
**Load-bearing obligation (`control/C1-ALLOCATION.md`, item 4):** weight-and-relation fidelity as mathematics — the
identity (WID), its proof and its failure modes; reconstruction of the two Cycle‑6 weight errors; mechanism-equivalence
of (HALL) against the ten refuted keys and the C6‑F4 own-support rule; where (HALL) is strictly stronger than the
scalar aggregate.

## Boot acknowledgment

VerityOS was booted for this seat by reading EXACTLY the two authorized files and nothing else:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Per the
dispatch, the startup protocol's own task-type map, memory, conversations, modules, skills, logs and decisions
directories were NOT followed for this seat (the controller has booted for the run).

## Read-boundary disclosure

Two items, both non-content directory listings, neither followed by reading any sibling file's content:

1. Before creating this seat's own scratch directories, this route ran `ls scratchpad/` and
   `ls cycles/cycle-1/stage3/returns/` (non-recursive) to check whether `scratchpad/c1-F2/` already existed. The
   dispatch's search-tools rule states this run's shared `scratchpad/` and `cycles/` roots are ABOVE this seat's
   grant (only the seat's OWN `scratchpad/c1-F2*` is within it), so this pair of listings is disclosed as a
   read-boundary item even though no sibling file's content was opened. The listings revealed the NAMES of five
   sibling scratch directories (`c1-F1, c1-T1, c1-T2, c1-U1, c1-U2`, each with a `-replay` pair) and that a return
   already exists at `cycles/cycle-1/stage3/returns/F1`. Nothing from any of these was opened, read, or used in this
   return's derivation; the fact of D1–D13's analysis, the fixed-point reconstructions, and every claim above were
   produced independently of this listing.
2. The exact tree structures behind the `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION` (order‑14) and
   `E993-LOWER-REGION-LOCAL-MARKED-ADDABILITY-NONPOSITIVE-COVARIANCE` (order‑24) refutation witnesses live only in
   the certificate's cited path under the **live** `erdos-993-lower-region-compensation-dre-2026-09-25` root, which
   is fenced (`SOLUTION-CONTRACT.md` §3.7); this route did not read it. §D8/§D10 state their mechanism-equivalence
   from the registered statement text alone, without recomputing those two specific numeric witnesses; named again
   under Remaining obligation.

Otherwise every file read is one of: the two boot files above; the seven control/contract files named in the
dispatch and worker brief; the frozen Stage‑2 `sources/` members listed below (each digest-verified against
`control/SOURCE-DIGESTS.json` before reading); this route's own scratch under `scratchpad/c1-F2/` and
`scratchpad/c1-F2-replay/`. No sibling return's or critic's/adjudicator's CONTENT, no other experiment root, and no
live lower-region or first-interior root was read.

**Self-corrected write disclosure.** `importlib.util`'s default loader wrote a `__pycache__/` bytecode cache next to
`sources/lower-region/inputs/ordinary_tree_checked.py` on first import — a write under `sources/`, which the brief
forbids ("nothing under `sources/` is written"). This was caught, the stray `__pycache__/` was deleted, and
`sys.dont_write_bytecode = True` was added before the import in `f2_main.py`/`f2_part2.py` (and the replay copies) so
no further run recreates it; `sources/lower-region/inputs/` was re-verified to contain only the original
`ordinary_tree_checked.py` after the fix, and its digest (checked above) is unchanged since bytecode caches do not
alter the `.py` file itself. The evidence digest was regenerated after the fix and is unaffected by it (the fix
changes only side effects, not any computed value).

## Stage 2 seal and source digests

Recomputed SHA‑256 of the canonical JSON of `control/C1-STAGE2-PACKET-MANIFEST.json` (its `seal_sha256` field removed,
`sort_keys=True`, separators `(",", ":")`, no trailing newline):

```
886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92
```

This matches both the manifest's own embedded `seal_sha256` field and the value cited in the dispatch. Every
Stage‑2 source file this route opened was independently re-hashed and its `(bytes, sha256)` pair checked against
`control/SOURCE-DIGESTS.json` *before* it was opened; the batch check covered 21 files (all matched exactly),
including `sources/lower-region/cycle-6/{C6-T4,C6-T5}/*` pre-verified in case they were needed. Files whose CONTENT
this route actually read and cites: `sources/lower-region/records/FINAL-REGISTERED-CLAIM-IDENTITY.json`,
`sources/lower-region/cycle-6/{C6-F5,C6-U5,C6-F4,C6-U6,C6-T5}/*`, `sources/lower-region/inputs/ordinary_tree_checked.py`,
plus `control/CLAIM-DISTINCTIONS.json` and `control/CLAIM-IDENTITY.run-local.json` — control-tier files, digest-verified
separately against their entries in `control/C1-STAGE2-PACKET-MANIFEST.json`'s own `files` list (not
`SOURCE-DIGESTS.json`, which only covers `sources/`): both matched exactly (`(6853, a257ebbc…)` and
`(2409146, 86f94811…)` respectively). `C6-T4`'s files were digest-verified but their content was not needed and was
not read (this route's `T_22` cross-check used `C6-T5` alone).

## IMPORT LIST (standard library only; no network; no package installs)

`itertools`, `collections`, `fractions`, `math`, `hashlib`, `json`, `pathlib`, `importlib.util`, `sys`. One local
import of the pinned, digest-verified evaluator `sources/lower-region/inputs/ordinary_tree_checked.py` (via
`importlib.util`, for a same-tree cross-check only — never for this route's own weight/relation/flow logic, which is
independently written in `f2_lib.py`).

## Registered claims touched (named before any table below, per the worker brief's rule 3)

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — OPEN. This route does not move it; it supplies fidelity
  analysis in service of it.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — OPEN at Stage 1 (run-local, 435 claims). §A below is a
  statement-level (`proved_informal`-track) proof; it is a candidate, not an award (awards are Stage 7's).
- The primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — OPEN, untouched (context only).
- The **ten refuted mechanism keys** of `SOLUTION-CONTRACT.md` §3.2, each confirmed REFUTED in
  `sources/lower-region/records/FINAL-REGISTERED-CLAIM-IDENTITY.json` and distinguished from (HALL) in §D:
  `E993-R23-LITERAL-DELETE-ONLY-HALL`, `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`, `E993-R23-TAG-CLOSED-CUT-HALL`,
  `E993-R23-HOT-TAG-SINGLETON-HALL`, `E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG`,
  `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT`, `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`,
  `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`, `E993-LOWER-REGION-C4-T4-SIGNED-CROSS-TAG-INJECTIVITY`,
  `E993-LOWER-REGION-LOCAL-MARKED-ADDABILITY-NONPOSITIVE-COVARIANCE`. None is revived; none is re-proved; none is
  claimed refuted-differently — each is confirmed REFUTED exactly as registered, and only distinguished from (HALL).
- Two further REFUTED keys named in the same fence but explicitly **not** in the "ten": `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`
  (a different pointwise counting bound, high-tail witness) and `E993-R28-TREE-LEAF-SLOT-DOMINANCE` ("a different
  problem" — Hall/SDR for the degree lemma, unrelated bipartite graph). Both are named and distinguished in §D5–D6,
  not re-proved, not re-opened.
- **C6-F4's own-support unit-capacity rule** — a route record (`sources/lower-region/cycle-6/C6-F4/REPORT.md`), not a
  registered key; distinguished in §D7.
- (LIFT) `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` and the `T_m` family theorems are cited at their existing
  `proved_informal` / `bounded_computation` grades (never re-derived, never re-proved) as inputs to §B3/§D2.
- **Alias check (lexical and mathematical)**, run against `control/CLAIM-IDENTITY.run-local.json` (435 claims), for
  the three candidate statements this route contributes (§A, §B2, §C1): searching every claim's `statement`+`scope`
  text for `reachab`, `maximal independent`, `private neighb`, `literal presence`, `measures instead`, `addable
  vertex`, `deletion-unreachable`, `switch-reachable` returns exactly four lexical hits, all for
  `reachab`(ility)-flavored r25/r28 stratification keys (`E993-PAIR-EDGE-JOIN-COMPOSITION`,
  `E993-R25-COVER-CELL-DRIFT-CRITERION`, `E993-R25-THIN-TREE-TAU-12-BAND-NO-IN-WINDOW-FAILURE-NO-RECOVERY`,
  `E993-R28-BRANCH-TREE-SURPLUS-IDENTITY`) — none of which is a statement about independent-set transport-arc
  reachability, tag activity, or a favorable-leaf presence/witness distinction; reading each `scope` string confirms a
  different object (branch/edge stratification, not this run's network). No lexical or mathematical collision found.
  (WID) itself was confirmed present and OPEN in the same registry (its full statement matches SOLUTION-CONTRACT §1
  verbatim).

---

## A. (WID) at statement level: proof and the two companions

**General statement (not tied to `F = F_p`).** Fix a finite simple graph `G`, a finite set `F` of degree-one
vertices of `G` (each `v ∈ F` with unique neighbour `s_v`), and an integer `p ≥ 1`. Let `W_v := N_G(s_v) \ {v}` and,
for an independent set `B`, `w_F(B) := #{v ∈ F ∩ B : (B \ {v}) ∩ W_v ≠ ∅}`. Then

```
Σ_{B ∈ I_{p+1}(G)} w_F(B)  −  Σ_{A ∈ I_p(G)} w_F(A)  =  Σ_{v ∈ F} [ q_v(p) − q_v(p−1) ],   q_v(j) := i_j(H_v) − i_j(R_v),
H_v := G − {v, s_v},  R_v := G − N_G[s_v].
```

**Proof (the bijection, stated so every hypothesis is named where it enters).** Since `w_F` is additive over `v ∈ F`
(each `B` is scored once per active tag it contains), it suffices to fix one `v ∈ F` and prove, for every `j ≥ 1`,

```
#{B ∈ I_j(G) : v ∈ B, (B \ {v}) ∩ W_v ≠ ∅}  =  q_v(j − 1).
```

Consider the map `φ : B ↦ B \ {v}`. *Domain check:* `v` is a leaf (`G` finite, `IsGraphLeaf` — degree exactly one, so
`v`'s only possible conflict is with `s_v`), so `B` independent and `v ∈ B` forces `s_v ∉ B`; hence `B \ {v}` is an
independent set of `G` avoiding both `v` and `s_v`, i.e. an independent `(j−1)`-set of `H_v`. It meets `W_v` exactly
when the active-tag condition holds. So `φ` maps the left-hand family into `{A ∈ I_{j-1}(H_v) : A ∩ W_v ≠ ∅}`, whose
size is `i_{j-1}(H_v) − i_{j-1}(H_v \text{ avoiding } W_v)`; and `H_v` restricted to avoid `W_v` is exactly
`H_v − W_v = G − ({v,s_v} ∪ W_v) = G − N_G[s_v] = R_v` (this uses `N_G[s_v] = \{s_v\} ∪ N_G(s_v) = \{s_v, v\} ∪ W_v`,
i.e. finiteness of the neighbourhood and the definition of `W_v`, nothing else) — giving `i_{j-1}(H_v) − i_{j-1}(R_v)
= q_v(j-1)` for the image size. *`φ` is injective* (removing one fixed element from a set is injective). *`φ` is onto
its stated image:* given `A ∈ I_{j-1}(H_v)` with `A ∩ W_v ≠ ∅`, `A ∪ {v}` is independent in `G` because `N_G(v) =
\{s_v\}` and `s_v ∉ A` (`A ⊆ V(H_v) = V(G) \ \{v, s_v\}`) — this is the one place the leaf hypothesis (`v` has a
*unique* neighbour) is load-bearing; a degree-≥2 vertex would need every neighbour excluded from `A`, not just one.
Summing the resulting identity `#\{B ∈ I_j(G): \text{tag } v \text{ active}\} = q_v(j-1)` over `v ∈ F` at `j = p+1`
and at `j = p` and subtracting gives the target identity. ∎

**Specialization (`F = F_p(G)`).** With `F := F_p(G) = \{v ∈ \text{leafSet}(G) : Δ_p(G-v) < 0\}` fixed at the
*original* rank `p` (never recomputed at `p ± 1` — the eligibility/fixed-selector hypothesis of
`SEMANTIC-CONTRACT.md` §1.1 enters exactly here, nowhere in the bijection itself), the right-hand side is by
definition `C5LA1.aggregate G p = S(G,p)`. So **supply − capacity = S(G,p)** for every finite simple graph, not only
for trees — `IsTree` (acyclicity and connectivity) is never used in this proof; it is a hypothesis of (HALL) and of
the eligible-window bound, not of (WID).

**(FLOW⇒SIGN).** If `f` is a saturating flow of the network at `(F,p)`, then `Σ_B w_F(B) = Σ_B Σ_A f(B,A) =
Σ_A Σ_B f(B,A) ≤ Σ_A w_F(A)` (the first equality is the saturation condition `Σ_A f(B,A)=w_F(B)` summed over `B`; the
middle step is Fubini on a finite double sum of nonnegative terms, an equality, not a bound; the final step sums the
capacity constraint `Σ_B f(B,A) ≤ w_F(A)` over every `A`). Hence `supply ≤ capacity`, i.e. by (WID), `S(G,p) =
supply − capacity ≤ 0`. This uses (HALL-COND) only at `X = I_{p+1}(G)` — the FULL network, not a general subfamily —
exactly the "sufficient mechanism is stronger than the scalar target" remark of `SEMANTIC-CONTRACT.md` §1.2 (§C makes
this quantitative).

**(HALL⇒FLOW).** Capacitated Hall on a finite bipartite graph: clone each `B ∈ I_{p+1}(G)` into `w_F(B)` unit-supply
copies and each `A ∈ I_p(G)` into `w_F(A)` unit-capacity copies, joined by clone-pairs whenever `(B,A)` satisfies the
relation. (HALL-COND) for every `X ⊆ I_{p+1}(G)` is exactly Hall's marriage condition for every union of clone-sets
of sources (clone sets of the *same* source are interchangeable, so it suffices to check unions of whole clone
classes), so a perfect matching from the source clones into the target clones exists by Hall's theorem (finiteness of
`V` makes every layer finite, so the classical finite Hall theorem applies without further hypotheses); collapsing
matched clone-pairs back to `(B,A)` multiplicities gives an integral `f` with `Σ_A f(B,A) = w_F(B)` (every clone of
`B` is matched) and `Σ_B f(B,A) ≤ w_F(A)` (at most `w_F(A)` clones of `A` exist) — a saturating flow.

**Numerical corroboration (own instrument; no assumed conclusion).** §A is proved above without appeal to any
computation; the computations below are cross-checks of the *statement*, not the proof.

- `wid_general_check`: on 5 fixed deterministic trees (`path7, star6, spider_2_2_2, double_star_3_4, caterpillar`,
  every one passing `is_tree()` — acyclicity and connectivity checked separately, see `f2_lib.SimpleGraph.is_tree`),
  with `F` = every leaf and `F` = a proper leaf-subset, at every `p` from 1 to `⌊n/2⌋`: **34/34 rows** satisfy
  `supply − capacity = Σ_v [q_v(p) − q_v(p−1)]` exactly, in exact integer arithmetic. This directly checks the
  *general* form (arbitrary finite `F`, not `F_p`).

```
IMPORT LIST: fractions, math, json, sys, pathlib, f2_lib (local; standard library only)
SHA-256 of scratchpad/c1-F2/F2-EVIDENCE.json (canonical, no host/PID/wall-clock fields): 3c6226b1cd9e7706d465002d4d0d1f03fa40591ca12bc1519fec102b35ebc186
Copy-out-first replay:
  cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-F2-replay
  python3 f2_main.py && python3 f2_part2.py && python3 f2_part3.py && python3 f2_combine.py
  # prints: F2-EVIDENCE.json sha256: 3c6226b1cd9e7706d465002d4d0d1f03fa40591ca12bc1519fec102b35ebc186
```

---

## B. What `|F ∩ B|`-counting measures instead, and the two Cycle‑6 errors reconstructed

**B1. The struck identity.** Literal-presence weight `w'_F(B) := |F ∩ B|` drops the witness clause entirely. Running
the *same* bijection proof of §A with `w'_F` in place of `w_F` — the map `B ↦ B \ {v}` is still injective, and its
image is now *all* of `I_{j-1}(H_v)` (no `∩ W_v` restriction) — gives, by the identical argument with `R_v` deleted
from consideration:

```
Σ_{B ∈ I_{p+1}} |F ∩ B|  −  Σ_{A ∈ I_p} |F ∩ A|  =  Σ_{v ∈ F} [ i_p(H_v) − i_{p−1}(H_v) ]  =  Σ_{v ∈ F} Δ_{p-1}(H_v).
```

This differs from `S(T,p) = Σ_v [Δ_{p-1}(H_v) − Δ_{p-1}(R_v)]` by exactly `Σ_v Δ_{p-1}(R_v)` — the literal count
silently **omits the entire `R_v` (closed-neighbourhood-of-support deletion) correction**, i.e. it never checks
whether the witness `W_v` is actually present. This is `x`/`Δ_k`-indexed precisely: the omitted term is `Δ_{p-1}(R_v)`
for every `v ∈ F`, the same difference index `p-1` that appears in both `q_v(p)-q_v(p-1)` terms of (WID).

**B2. C6-F5's error, reconstructed from scratch (own recomputation, own tree build from the prose recipe, not the
producer's code).** Built independently (`f2_lib` + `f2_main.py:build_path_star`) on both C6-F5 profiles:

| Profile | `n` | `α` | `x` | `p` | `S` | active supply/capacity/flow (arcs) | literal supply/capacity/flow (arcs) | literal − S = Σ Δ_{p−1}(H_v)? |
|---|---:|---:|---:|---:|---:|---|---|---|
| `(2,3,4)` | 15 | 11 | 5 | 7 | **−1218** | 1483 / 2701 / 1483 (2025) | 1563 / 2969 / 1563 (2025) | 1563−2969=**−1406** = Σ Δ_{6}(H_v) ✓ |
| `(2,2,4,3)` | 18 | 13 | 6 | 8 | **−5434** | 8033 / 13467 / 8033 (11691) | 8751 / 15468 / 8751 (11691) | 8751−15468=**−6717** = Σ Δ_{7}(H_v) ✓ |

Every one of these eight numbers (both `S`, both active triples, both literal triples) was reproduced independently
and matches, digit for digit, `C6-F5-ROOT-CORRECTION-NOTE.md`'s corrected values, `sources/.../C6-F5/REPORT.md`'s
original (struck) table, and `sources/.../C6-F5/C6-F5-root-corrected-direct-audit.py`'s asserted
`supply − capacity == S` invariant. The mechanism of the original bug is now exactly located: **the original
`direct_audit.py` computed `S` correctly** (via the independent `H_v`/`R_v` term expansion, identical to `f2_lib.aggregate_S`)
**but computed `(supply, capacity, flow)` from the wrong weight `w' = |F ∩ B|`**, and — critically — **never asserted
`supply − capacity == S`**, so the inconsistency between its two internally-computed quantities went undetected. The
corrected script adds exactly that assertion. The literal-network deficit (`−1406`, `−6717`) is *not* a second
instance of `S`; it is `Σ_v Δ_{p-1}(H_v)`, confirmed exactly by B1's identity in both cases (own computation, both
sides independent).

**B3. C6-U5's error, reconstructed algebraically (own derivation, exact `fractions.Fraction`, no enumeration of
`C(736,491)` itself — only its exact ratio).** In the `CB(8,92)` root‑plus‑arm sector (root `r`, distinguished arm
leaf, 736 disjoint support–leaf pairs, no choke ever selected in this sector by construction), every member has
**active-tag weight exactly 1** (the arm tag only — a private leaf's witness is its choke, and no choke is present in
this sector, `sources/.../C6-U5/C6-U5-ROOT-ACTIVE-WEIGHT-CORRECTION.md`), so weighted sums equal unweighted counts
exactly:

```
|R_491| / |R_490| = 2·(736−490)/491 = 492/491     (own computation: exact via math.comb, Fraction)
```

The struck weight `W_s := |R_s|·(1 + s/2)` (favorable-leaf-presence count, `1 + #private leaves present`, using the
exact pair-symmetry identity `Σ_{B∈R_s} (#leaves in B) = s·|R_s|/2`) gives

```
W_491/W_490 = (492/491)·(493/492) = 493/491     (own computation, exact Fraction; reproduces C6-U5's reported 493/491)
```

Both ratios were computed exactly (own `fractions.Fraction` script, `f2_part2.py:cb_sector_case`); `492/491 ≠ 493/491`
is exactly the discrepancy the root correction reports. The mechanism is again literal-presence weighting: the struck
formula counts every selected private leaf toward the sector's weight regardless of whether its choke (its witness)
is present, and in this sector no choke is *ever* present, so the correction is not a small perturbation but a
collapse of the weight function to the constant 1.

```
IMPORT LIST: fractions, math, json, sys, pathlib, f2_lib (local; standard library only)
Digest and replay: same F2-EVIDENCE.json / command as §A (parts B2 is in f2_main.py, B3 in f2_part2.py).
```

---

## C. Where (HALL) is strictly stronger than `S ≤ 0`

**C1. Reachability characterization (own lemma, own proof, own computational verification).** For an independent
`p`-set `A`, call `w ∈ N_T(u)` a **private neighbour of `u ∈ A` relative to `A`** if `w ∉ A` and `N_T(w) ∩ A = \{u\}`.

> **Lemma.** `A` has no in-arc of `(D) ∪ (S)` (no `B` with `A` reachable from `B`) iff (1) `A` is a **maximal**
> independent set (deletion-unreachable ⟺ maximal: `B = A ∪ \{q\}` requires an addable `q`) **and** (2) no `u ∈ A`
> has ≥ 2 private neighbours relative to `A` (switch-reachable at `u` ⟺ ≥ 2 private neighbours — on a tree any two
> distinct neighbours of `u` are automatically non-adjacent, since a triangle would be a cycle, so any 2 private
> neighbours of the same `u` can always be jointly re-inserted).

*Proof.* (⟸ of unreachability, i.e. the "only if" direction of each iff, is immediate from the definitions of (D) and
(S) given in `SOLUTION-CONTRACT.md` §2's `transportRel`; the two conditions are read off directly: a deletion-preimage
of `A` is exactly `A` plus one addable vertex, and a switch-preimage requires a `u ∈ A`, two neighbours `y,z ∈ N(u)`
outside `A` that, once `u` is removed, can be added — `y,z` are automatically mutually non-adjacent on a tree, and
adding them is blocked only if one of them is already adjacent to some *other* member of `A`, i.e. is not private.)

*Verification (own instrument).* Checked by brute force against **every** independent set of **every** size on four
structurally distinct trees (`path7`, `star6`, a length‑2 spider on 4 legs, a caterpillar) — **0 mismatches** between
the characterization and an exhaustive scan of every `B ∈ I_{p+1}` for every candidate `A`
(`f2_part2.py:reachability_verification`).

**C2. Existence, in the eligible window: characterized but not settled.** A concrete, verified *non-eligible*
instance shows the phenomenon is not vacuous: on the length‑2 spider with `k=4` legs (`r; a_i (i=1..4); b_i`, edges
`r–a_i–b_i`), `A = \{a_1,a_2,a_3,a_4\}` is independent, maximal (own instrument confirms: `r` is blocked by every
`a_i`, every `b_i` is blocked by its own `a_i`), and no `a_i` has ≥ 2 private neighbours (`b_i` is `a_i`'s only
private neighbour) — **unreachable** by both the lemma and brute force. But `α = 5`, `x = 3`, `p = |A| = 4`, and
`3·4 = 12 ≥ 2·5+1 = 11`: **not eligible** (it sits in the already-closed high tail, `SOLUTION-CONTRACT.md` §2). I was
not able, inside this route's budget, to construct or exclude an ELIGIBLE `(T,p)` with a positive-weight (`w_F(A)>0`,
i.e. `A` contains an actively-tagged leaf) unreachable target; this is named under Remaining obligation. Two structural
observations bear on it: (a) `w_F(A) > 0` requires `A` to contain some `v ∈ F` with a witness `w ∈ W_v ∩ A`, so any
unreachable-and-positive-weight witness must have that pair inside a maximal set with condition (2) above — a real,
checkable constraint, not merely `A` maximal; (b) `K_{1,12}` at `p=8` (§ fixed points below) has **no** unreachable
target of any weight (every 8-subset of the 12 leaves is deletion-reachable, since ≤ 11 leaves are always present to
add back), consistent with — but not proving — the Stage 1 Gate's "no counterexample known."

---

## D. Mechanism-equivalence: the ten refuted keys, two named exclusions, and the C6‑F4 rule, against (HALL)

Every entry below is REFUTED at its own registered scope (`FINAL-REGISTERED-CLAIM-IDENTITY.json`, verified digest
`eba20be3…`); none is re-proved, revived, or narrowed here. "Object" states the mathematical structure each key is
actually a statement about, so its difference from (HALL)'s bipartite flow network is visible without guessing.

| Key | Object (what it is a statement about) | How it differs from (HALL) | Same-witness check against (HALL) |
|---|---|---|---|
| **D1** `E993-R23-LITERAL-DELETE-ONLY-HALL` | Unweighted Hall demand `\|X\| ≤ \|Γ_Delete(X)\|` for the **deletion-only** relation (no switch arcs at all) on the r23 literal contract's "complete tagged top side". | Two independent differences from (HALL), both named on the key's own scope line: (i) relation — `Γ_Delete ⊊ (D)∪(S)`, missing every switch arc; (ii) weight — unweighted cardinality, not `w_F`. Refuted *a fortiori* from the same witness as D2 via `Γ_Delete(X) ⊆ Γ_actual(X) ⊆ Y`. | Not a cut of (HALL): (HALL)'s relation is strictly larger (adds (S)) and its demand is weighted, not cardinality; a cardinality-deficient cut of the smaller relation says nothing about the weighted sum over the larger one. |
| **D2** `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` | Hall for the r23 "literal fixed Delete/Retag relation" `Γ_actual` (an r23-specific relation, not (D)∪(S) — its exact Retag step is defined in the (fenced) r23 semantic contract, not re-derived here) on **the same tree `T_22` at `p=34`** as this route's own §D2 witness below. | `SOLUTION-CONTRACT.md` §3.2 groups this with "the literal Delete/Retag relations", explicitly fenced as distinct from (HALL) by relation and by the absence of the active-tag weight. Witness order 91 = `n(T_22)`. | **Checked, same tree, against the primary record (own instrument, `sources/lower-region/cycle-6/C6-T5/EVIDENCE.json`, digest `0ed20395…`, read directly — not the semantic contract's summary of it):** this route independently rebuilt `T_22` (`t_family(22)`, `n=91,α=68,x=32`, 67 favorable leaves, `S=−498754180547001418536`, cross-checked against three independent sources — see §Fixed points) and cites the ALREADY-VERIFIED `T_m` orbit flow at `(m,p)=(22,34)` (`bounded_computation`, not recomputed here): supply `6533318342644086823410`, capacity `7032072523191088241946`, flow `6533318342644086823410` (**saturating**, no deficient cut recorded), `supply − capacity` equals this route's own `S` exactly, AND this route's own forest-DP independently reproduces the two raw independent-set-layer sizes `i_34(T_22)=289115251921304851378` and `i_35(T_22)=254400180721024303524` digit-for-digit against C6-T5's `lower_actual_sets`/`upper_actual_sets`, and the special-leaf/arm-leaf summand decomposition (`212336130412243110 + 66·(−7560098737536570631) = S`) exactly. So the *same tree and rank* that refutes D2's mechanism is **not** a known deficient cut of (HALL) — a direct, same-object mechanism ≠ mechanism demonstration, now tied to the primary evidence file at four independent numeric points, not just the scalar `S`. |
| **D3** `E993-R23-TAG-CLOSED-CUT-HALL` | Universal Hall for **tag-closed cuts only** of the r23 literal Delete/Retag relation. | Narrower cut class than D2, same relation fence; witness order 1567 = `n(CB(8,92))`. | `CB(8,92)` at `p=492` is combinatorially too large to enumerate (`C(736,491)` has 350 digits); not recomputed here. Stage 1 Gate's universal-counterexample search (`control/C1-STAGE1-GATE.md`) reports **no** registered or reported deficient cut of the *mixed* (HALL) network at this tree; this route's own exact algebra (§B3) shows the corrected active-tag weight *reduces* the sector's deletion-only deficit relative to the struck weight (`492/491` vs the struck `493/491`), consistent with (not proving) non-transfer. |
| **D4** `E993-R23-HOT-TAG-SINGLETON-HALL` | Hall for the **complete active arm-tag singleton cut** `X = \{v\} × C_p(v)` under D2's relation. | Same relation fence as D2/D3; a narrower cut family, refuted by the identical `CB(8,92)` arm cut. | Same disclosure as D3: not independently recomputed (object too large); no known transfer per Stage 1 Gate. |
| **D5** `E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG` | A **per-leaf sign implication** (`g_v ≤ 0` from a zero-export hypothesis on the r23 Retag edge set) — an implication about one leaf's own gap, not a Hall inequality or a flow at all. | Categorically different object: no bipartite network, no cut, no supply/capacity. Cannot literally "be" a deficient cut of (HALL) — the comparison is a category error, and the fence names it as refuted at its own (different) scope. | N/A — the two objects are not comparable at the level of witnesses; only the implication's *hypothesis* (zero Retag export) is refuted by the same `CB(8,92)` arm tag, whose (HALL)-network export (via switch arcs) is exactly what (HALL) leaves open. |
| **D6** `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT` | A **per-support-block unit-capacity injection** from "positive" to "negative" favorable-leaf tokens, required to preserve each leaf's own support label. | (HALL)'s flow is a *global* bipartite max-flow (Hall/max-flow–min-cut over the WHOLE network via HALL-COND on every `X`), not a support-label-preserving per-block matching; switch arcs (S) route weight to targets with a DIFFERENT support label by construction — exactly the freedom D6's mechanism forbids. | **Checked, same tree** (`T_22`, `p=34`, `x=32`): this route's own witness `B` (§ fixed points) has 33 active tags concentrated on only 11 distinct supports (3 tags/support) — the identical concentration phenomenon that breaks D6's per-support injectivity — yet the *same tree's* orbit flow (cited, D2's cross-check) saturates: (HALL) does not require per-support injectivity, so the same concentration that refutes D6 does not touch (HALL). |
| **D7** `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` | Injectivity of a **rational linear map** `d_p` on the vector space of marked independent `p`-sets of `H_v` (one leaf `v` at a time), not a flow. | Different category again: a linear-algebraic map on a `ℚ`-vector space with a possible kernel, vs. an integral max-flow. Injectivity failing for one leaf's own map says nothing about the GLOBAL bipartite flow across all leaves and both layers. | Same T_22-family concentration story as D6 (many tags routing through few supports is exactly what defeats a *per-leaf* map); not a cut of (HALL) for the same categorical reason as D5. |
| **D8** `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION` | A **scalar moment inequality** `i_p(T)·E ≤ (p+1)·i_{p+1}(T)·Q` between the weighted occupancy `Q` and the weighted-addability sum `E`, both taken over the *same* rank `p`. Refuted on an order‑14 witness (structure not in this route's read grant — see Read-boundary disclosure). | Not a network statement at all: no `B`, no `A`, no relation, no cut, no supply/capacity — a single-rank counting inequality. Its failure closes off a candidate *sufficient condition* for the aggregate/Hall, not a fact about the flow's existence. | Cannot be "a cut of (HALL)" by construction (no cut object exists in its statement); its numeric witness was not independently recomputed here (fenced source). |
| **D9** `E993-LOWER-REGION-C4-T4-SIGNED-CROSS-TAG-INJECTIVITY` | Injectivity of a **signed linear retagging map** `L : K_p → K_{p-1}` on `ℚ`-vector spaces with basis `(v,A)` pairs, refuted by an explicit nonzero-boundary vector on `K_{1,12}`, `p=8`. | Signed linear algebra over `ℚ` vs. a nonnegative-integer flow: `L` can vanish on a nonzero combination without any single term failing; (HALL) has no signed cancellation, only nonnegative capacities. | **Checked, same tree:** this route rebuilt `K_{1,12}` at `p=8` fully (§ fixed points): the (HALL) network there is **fully saturating** under BOTH the active and the literal weight (they coincide on this tree — every present favorable leaf is automatically active, since any 8 of the 12 leaves always leaves ≥8 co-leaf witnesses). So the same tree that refutes D9's signed map is a tree where (HALL) demonstrably HOLDS — the cleanest possible same-object mechanism ≠ mechanism separation this route found. |
| **D10** `E993-LOWER-REGION-LOCAL-MARKED-ADDABILITY-NONPOSITIVE-COVARIANCE` | A **covariance statement** `Cov(M_v, e_v) ≤ 0` between an indicator and an addability count, under the uniform measure on independent `k`-sets of `H_v`, refuted on an order‑24 witness with `Cov = 1773113/13677² > 0` (structure not in this route's read grant). | Same category as D8: a probabilistic/moment statement about ONE leaf's local measure, not a network. | Cannot be "a cut of (HALL)"; numeric witness not independently recomputed here (fenced source), named under Remaining obligation. |

**D11 (not one of the ten; named separately by the fence).** `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` — a pointwise
bound "every independent `r`-set has ≤ `r` addable vertices", refuted on witnesses that the key's own scope note says
fail `3p ≥ 2α+1` (the **high tail**, already closed by r29, out of this run's lower-region domain entirely). Not a
network statement; not touched by (HALL) either categorically or by domain.

**D12 (not one of the ten; explicitly "a different problem").** `E993-R28-TREE-LEAF-SLOT-DOMINANCE` — Hall/SDR from
**branch slots** to **leaves**, ordered by a coefficient threshold `c_v(k) ≥ t`, refuted on a witness the registry
calls "T22" with **order 22, k=12, t=18**. **This is a different tree from this route's `T_22` (`t_family(22)`, order
91)** — the label "22" refers to the *branch count* `m` in the r30/r19 `T_m` family but to the *order* in R28's
witness; they are not the same object, and this route flags the naming collision explicitly to avoid exactly the kind
of alias error the registry's discipline exists to prevent. R28's bipartite graph (slots vs. leaves, threshold-ordered)
shares no vertex set, relation, or weight with (HALL)'s network; `SOLUTION-CONTRACT.md` already fences it as "a
different problem" and this route confirms no accidental overlap in the objects.

**D13 (a route record, not a registered key).** C6-F4's own-support unit-capacity charging rule ("inject every
active tag in `B` into a distinct support in `N(B)`") — refuted on `T_22` at `p=34` by the same 33-tags/11-supports
concentration this route reproduced (§ fixed points). It differs from (HALL) exactly as D6/D7 do: (HALL)'s flow is a
network-wide max-flow, not a per-`B` support-preserving matching, so the local charging failure does not bind the
global flow.

---

## E. Literal-hypothesis attacks (own instrument, all four demonstrated concretely and in code)

1. **`F = ∅`.** On `K_{1,4}` at `p = α = 4`, `favorable_leaves` returns `[]` (own computation), so `w_F ≡ 0`
   identically; supply `= 0 =` capacity trivially, and the empty flow is (vacuously) saturating — (HALL) holds, and
   `S = 0` by the empty sum convention, consistent with (WID). No boundary case to fence.
2. **Supports of degree 2 / leaves sharing a support.** On a 6-vertex tree (`r=0, s=1` with leaf children `v1=2,v2=3`,
   and `r`'s own leaf children `u1=4,u2=5`), `F = \{2,3,4,5\}` is favorable at `p=2,3`, and leaves `2,3` (sharing
   support `1`) mutually witness each other whenever both are present (own computation confirms `active_in_B` includes
   both `2` and `3` together, never one without the other, in every `B` containing both).
3. **A step that deactivates a tag.** Own computation exhibits `B=\{2,3,4\} \xrightarrow{\text{delete }2} A=\{3,4\}`
   with tag `3` active in `B` (witness `2` present) and inactive in `A` (witness `2` gone): `active_in_B=[2,3]`,
   `active_in_A=[]`. Weights are recomputed literally on each side, never inferred, exactly as
   `SEMANTIC-CONTRACT.md` §1.2 requires.
4. **The switch-inserted `u` equal to a leaf's own support.** Own computation exhibits the switch
   `B=\{2,3,4\} \xrightarrow{u=1} A=\{1,4\}` (`u=1=\text{support}(2)=\text{support}(3)`, `N(1)∩B=\{2,3\}`, size 2):
   tags `2,3` are removed from the set entirely (not merely deactivated — they leave `B\A`), while tag `4` is
   simultaneously **activated** in `A` (its witness is `1`, now present). This single example realizes three of the
   dispatch's named literal-hypothesis probes at once: a switch through a support vertex, a tag leaving the set via a
   switch, and a different tag being activated by the same switch.
5. **Rank at the top of the window `p = ⌊2α/3⌋`.** Already realized without new construction: `K_{1,12}` at `p=8`
   (§ fixed points) has `α=12`, so `⌊2·12/3⌋ = 8 = p` exactly — the eligibility margin `3p=24 < 2α+1=25` is as tight
   as it gets (margin 1), and (HALL) is shown saturating there.

```
IMPORT LIST: json, sys, pathlib, f2_lib (local; standard library only)
Digest and replay: f2_part3.py, folded into the same F2-EVIDENCE.json / replay command as §A/§B.
```

---

## F. Grades

| Statement | Grade (this route's contribution) |
|---|---|
| (WID), general form and `F=F_p` specialization | `proved_informal` at statement level (the bijection is complete and elementary; not yet composed into a kernel-checked award — that is U2/Stage 7's object) |
| (FLOW⇒SIGN), (HALL⇒FLOW) | `proved_informal` (standard capacitated-Hall / max-flow–min-cut arguments, stated with every hypothesis named) |
| §B1 "measures instead" identity | `proved_informal` (proved by the same bijection technique; numerically confirmed on 2 instances) |
| §B2, §B3 error reconstructions | `bounded_computation` (own instrument, 2 + 1 instances; exact integers/fractions; not a universal claim) |
| §C1 reachability characterization | `proved_informal` (proof given; verified by exhaustive brute force on 4 small trees — not a universal computer proof, a hand proof with computational corroboration) |
| §C2 existence in the eligible window | **open** — explicitly not settled; see Remaining obligation |
| §D mechanism-equivalence table | `proved_informal` for the categorical/relational distinctions (read off the registered statements); `bounded_computation` for the same-witness checks on `K_{1,12}` and `T_22` (both fully reproduced); **not independently checked** for `CB(8,92)` (D3/D4, combinatorially too large — disclosed) and for the order‑14/order‑24 witnesses of D8/D10 (fenced source — disclosed) |
| §E literal-hypothesis attacks | `bounded_computation` (5 own, exact, small witnesses) |
| Fixed points reproduced (`K_{1,12}`, both C6-F5 path-star trees, `T_22`) | reproduction of already-`bounded_computation`/`proved_informal`-grade prior facts, at the same grade — not strengthened, not re-proved as a new theorem |

No certification here strengthens a prior grade without strengthening its evidence; no census value enters a proof;
no closed region (high tail, order bands, `T_m`/spider/path-star family theorems) is re-proved — `T_22`'s orbit-flow
saturation is CITED (C6-T5), never recomputed, and this route's own recomputation on `T_22` is limited to the scalar
polynomial/aggregate/witness-set side, which is a fidelity check, not a re-proof of the family theorem.

---

## Fixed points reproduced (own instrument; required before any table above was reported)

Every row below asserts `supply − capacity = S(T,p)` under the active weight, and states `x`, `Δ_k` (via the explicit
rank‑`α` scan, cross-checked against the pinned evaluator's own `first_strict_descent`), `α`, `p`, `|F|`, and the
graph, per the shared rules.

| Fixed point | `n` | `α` | `x` (own = pinned) | `Δ_x` (own scan, exact) | `p` | difference index `p−1` | `\|F\|` | `S` | active supply/capacity/flow | saturating |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|---|
| `K_{1,12}` | 13 | 12 | 6 = 6 | −132 | 8 | 7 | 12 | −1980 | 1980/3960/1980 | yes (no switch exists; 220 sources) |
| path-star `(2,3,4)` | 15 | 11 | 5 = 5 | −61 | 7 | 6 | 10 | −1218 | 1483/2701/1483 | yes (2025 arcs) |
| path-star `(2,2,4,3)` | 18 | 13 | 6 = 6 | −285 | 8 | 7 | 12 | −5434 | 8033/13467/8033 | yes (11691 arcs) |
| `T_m`, `(m,p)=(22,34)` | 91 | 68 | 32 = 32 | −940335682600092973 | 34 | 33 | 67 | −498754180547001418536 | 6533318342644086823410 / 7032072523191088241946 / (cited, saturating — C6-T5) | yes (cited) |

`Δ_x := Δ_x(\text{poly}) = i_{x+1} - i_x`, the first strict-descent value itself (negative by definition of `x`); the
`p−1` column is the difference index that enters every `q_v(p) − q_v(p−1)` / `Δ_{p-1}(H_v)` / `Δ_{p-1}(R_v)` term of
`S` at that row (§A, §B1). Every `Δ_x` value in this table is read off this route's own
`forest_independence_polynomial()` (own DP, cross-checked against brute-force subset enumeration on `K_{1,12}` and
against the pinned evaluator's `first_strict_descent` for the descent RANK on all four rows — `T_22`'s exact
coefficients are not printed here, only its `Δ_x`, since `i_{32}`/`i_{33}` run to dozens of digits).

`T_22`'s `n, α, x, |F|, S` are this route's own forest-DP recomputation (`f2_lib`, cross-checked against a second,
independently hand-built edge list matching the pinned evaluator's `t_family(22)` byte-for-byte in adjacency); only
the supply/capacity/flow triple is cited from `C6-T5` (own reconstruction of the full `I_{35}}/I_{34}` orbit flow on a
91-vertex tree is F1/T1/U1's instrument and the `T_m` family is a settled, non-re-provable theorem —
`SOLUTION-CONTRACT.md` §2/§3.6). Beyond the scalar `S`, this route's own polynomial independently reproduces two raw
layer sizes read directly from `C6-T5/EVIDENCE.json` (digest `0ed20395…`, `checks[0]`): `i_34(T_22) =
289115251921304851378` (their `lower_actual_sets`) and `i_35(T_22) = 254400180721024303524` (their
`upper_actual_sets`), both matching exactly, plus the summand decomposition `212336130412243110 +
66·(−7560098737536570631) = S` (their `special_leaf_summand` + 66×`each_arm_leaf_summand`). The C6-F4 witness `B`
(33 active tags on 11 distinct supports out of 35 vertices) was independently reconstructed from `C6-F4/REPLAY.py`'s
prose recipe and matches exactly.

`CB(8,92)` at `p=492` (`n=1567, α=829, x=490`, 737 favorable leaves, `S<0`, sector ratio `492/491`) is cited from the
semantic contract / `C6-U5` (own algebraic re-derivation in §B3 confirms the ratio exactly); the full network is not
independently reconstructed (combinatorially infeasible: `C(736,491)` has 350 digits) and is not claimed as this
route's own numeric computation beyond the exact-fraction algebra of §B3.

---

## `headline_resolved: no`

The headline is (HALL) `formally_verified` (or a confirmed (CUT) refutation) at Stage 7; neither is this route's
product. This route's product is fidelity analysis in service of (HALL) and (WID).

## Route verdict: `bounded_evidence`

Statement-level proofs are given for (WID), (FLOW⇒SIGN), (HALL⇒FLOW), the literal-weight substitute identity, and
the deletion/switch reachability characterization (all `proved_informal`-grade, informal but complete arguments); the
mechanism-equivalence table and the fixed-point/error reconstructions are exact, own-instrument, digested
computations (`bounded_computation`) on named, small, or already-cited instances. Nothing here proves, refutes, or
narrows (HALL) itself, and the route says so plainly: this is `bounded_evidence` in service of the run's fidelity
prerequisite, not `proved`/`proved_conditional`/`refuted`/`compiled`.

## Remaining obligation

A successor should:

1. **Settle §C2**: does there exist an ELIGIBLE `(T,p)` with a positive-weight (`w_F(A)>0`) independent `p`-set `A`
   unreachable by any arc of `(D)∪(S)` (per the §C1 characterization: `A` maximal, and no `u∈A` has ≥2 private
   neighbours)? A "no" (for all eligible `(T,p)`) would show (HALL) is exactly equivalent, on positive-weight targets,
   to `S ≤ 0` via the elementary direction; a "yes" would exhibit (HALL) as a strictly stronger, genuinely
   informative sufficient condition. This route's non-eligible witness (the length‑2, 4‑leg spider) shows the
   underlying maximal-independent-set phenomenon is real but currently only located in the closed high tail.
2. **Reconstruct or formally accept as ungrantable** the order‑14 (`E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`)
   and order‑24 (`E993-LOWER-REGION-LOCAL-MARKED-ADDABILITY-NONPOSITIVE-COVARIANCE`) witness trees, currently
   available only via a fenced live root; if a controller grant widens access to the two specific frozen files (not
   the whole live root), this route's §D8/§D10 rows can be completed with the same own-instrument treatment given to
   `K_{1,12}` and `T_22`.
3. **Compose (WID)'s statement-level proof (§A) into the Lean skeleton** (`E993Transport.layerWeight_sub_eq_sum` /
   `activeWeightAggregateIdentity` in `SOLUTION-CONTRACT.md` §2) — U2's object; this route's bijection argument maps
   directly onto `Finset.card_bij` at the `B ↦ B.erase v` map, with the domain/image computation of §A's proof as the
   two halves of the bijection's well-definedness and surjectivity obligations.
4. Register, at Stage 7 discretion, the two candidate lemmas this route names and alias-checks clean: the
   literal-weight substitute identity (§B1) and the deletion/switch reachability characterization (§C1), if the
   synthesis judges either useful on its own face outside this return.

## Background jobs

None. Every computation in this return ran to completion in the foreground (`python3 <script>` from the shell tool,
each call returning before the next was issued); nothing was detached, backgrounded, or polled by PID; no
`pgrep`/full process listing was used.

## Model disclosure

Chartered Sonnet/xhigh; transport-resolved model Sonnet (explicit parameter); runtime-reported model id: `claude-sonnet-5`
(per this session's system context; the harness does not expose a separate lower-level build identifier beyond this
string).
