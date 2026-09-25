# RETURN — Seat U1, Cycle 1, r29 (Erdős #993 high-tail certification)

Route: `C1-U-01 LEAN-EXTRACTION-SKELETON`. Mechanism fingerprint: `LEAN-EXTRACTION-SKELETON`.

## Boot acknowledgment

VerityOS booted for this seat per the dispatch's exact, narrowed boot grant: read
`/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` — and nothing else in VerityOS
(no `memory/`, `conversations/`, `modules/`, `skills/`, `logs/`, `decisions/`; the run controller
booted for the run). No other VerityOS file was read. **No read-boundary disclosure applies to the
boot.** (Two in-grant, non-recursive `grep`/`find` calls against the Mathlib package directory and one
`find -maxdepth 1` against the same directory were run later, for Mathlib `file:line` citations — see
`## Read-boundary disclosure` below; they are within the explicitly granted Mathlib directory, not
above it, but are disclosed per the brief's "a search that does occur is a read-boundary disclosure.")

## Stage 2 seal and source digests

Recomputed SHA-256 of the canonical JSON of `control/C1-STAGE2-PACKET-MANIFEST.json` (the object with
`seal_sha256` removed; `sort_keys=True`, `separators=(",",":")`, no trailing newline):

```
58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e
```

This equals the manifest's declared `seal_sha256`. **Seal verified.**

Before reading any of them, all 54 files this route needed under `sources/` and `control/` were
verified byte-exact (SHA-256 and byte count) against `control/SOURCE-DIGESTS.json`: `Main.lean`
(`8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9`, 61296 bytes), all 45
`Snippets/*.fragment`, `LeanProof.lean`, `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`,
`FORMALIZATION-STATE.json`, `THEOREM-CONTRACT.yaml`, `DEPENDENCIES.yaml`, `sources/mathlib-binding/PIN.json`.
**All 54 matched.**

`sources/mathlib-binding/PIN.json` pins Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` /
Lean `v4.32.2`. The shared project's actual checkout
(`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/mathlib`,
`git rev-parse HEAD`) is `905b95818eb32af7874a58b427f50c1711a5e96c` — **matches the pin exactly.**

## IMPORT LIST

Python (fixed-points instrument, `scratchpad/c1-U1-replay/fixed_points_check.py`): `itertools`,
`hashlib`, `json` — standard library only, no network, no third-party packages.

Lean/Lake (`scratchpad/c1-U1/LeanProject`): `import Mathlib` (as carried, unmodified, from the
verified source `Main.lean`); no new imports added by the append. Toolchain
`leanprover/lean4:v4.32.2`; Mathlib bound by **manual symlink** of
`.lake/packages` to the shared, pre-built project (never copied, never `lake update`/`lake clean`).

## Load-bearing obligation (from `control/C1-ALLOCATION.md`, item 4)

In a scratch project pinned at the run's toolchain: carry `Main.lean` byte-identically (all 45
entries) and append, in a NEW namespace `E993HighTail`, the five §2 declarations
(`bipartiteTaggedShadowBound`, the `p = 1` endpoint lemma(s), `bipartiteLeafHighTailPointwise`,
`bipartiteHighTailAggregateAllRanks`, `interiorEligibilityAlphaGeSeven`, `topRankNonResidualAggregate`
— six declarations under five headings); compile sorry-free (`lake build`, foreground); `#print axioms`
on each; the exact dependency diagram; the registrar/carry plan for four award projects; draft
`THEOREM-CONTRACT.yaml` for LA1–LA3; report every `sorry` by name if any node blocks.

**Result: done. All six new declarations compile sorry-free against the pinned, verified,
byte-identical carry, with axioms `[propext, Classical.choice, Quot.sound]` only. No node blocks; no
`sorry` anywhere in the file (checked by `grep -n sorry`, zero matches).**

## Registered claims named before any census (`sources/authority/CLAIM-IDENTITY.json`, 407 claims)

Checked by field (`claim_key`, `status`, `statement`) before presenting any numeric material:

| Key | Status | Relation to this route |
|---|---|---|
| `E993-BIPARTITE-TAGGED-SHADOW-BOUND` (TSB) | OPEN | Target 1; my `bipartiteTaggedShadowBound` is a scratch, kernel-checked, ungoverned draft of exactly this registered statement — see grades below. |
| `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` (HTP) | OPEN | Target 2; my `bipartiteLeafHighTailPointwise` is a scratch draft of exactly this statement, `p ≥ 1` including the new endpoint. |
| `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` (ELIG) | OPEN | Target 3; my `interiorEligibilityAlphaGeSeven` is a keyword re-export of the compiled internal `E993Interior.eligibleAlphaGeSeven` (entry 43) — re-touches, does not resolve, the OPEN status (fence §3.8: compiled-internal is never a certificate). |
| `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` | VERIFIED | Input only (award `E993Interior.firstInteriorAggregate`, entry 45); never re-registered, never re-proved; carried byte-identically and re-checked with `#print axioms` (below) as a control. |
| `E993-R26-TOP-RANK-RESIDUAL-SIGN` | VERIFIED | Not touched by U1 (T2's comparison); noted only because `topRankNonResidualAggregate`'s conclusion coincides with its conclusion under weaker hypotheses — U1 does not re-derive or alias this key. |
| `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | OPEN | Not touched; U1 makes no claim in this key's scope. |
| `E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT`, `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` | REFUTED | Not touched, not aliased; U1's five new declarations are rank-restricted (`3p ≥ 2α+1`) or size-restricted (`k ≤ a`) forms, distinct in scope per the C2 scope audit (`sources/first-interior/records/C2-SCOPE-AUDIT.md`) and fence §3.4. |

No claim with `claim_key` matching `SHADOW`, `HIGH-TAIL`/`HIGHTAIL`, `ELIGIBIL`, `TOP-RANK`, or `TAGGED`
(searched over all 407 `claim_key` values, case-insensitively) exists besides the six rows above plus
the r23/r24/r26 refuted Hall-relation keys already carried in `C1-WORKER-COMMON-BRIEF.md`, none of
which share a mathematical statement with anything U1 produced. **No new claim is proposed for
registration by U1** (U1's five helper lemmas below are Tier-3 candidates per `SOLUTION-CONTRACT.md`
§1, left to the synthesis; see `## Alias check`).

## What was built (scratch, `scratchpad/c1-U1/LeanProject/`, never under `sources/`)

`Main.lean` (61296 bytes, digest above) copied byte-identically into
`scratchpad/c1-U1/LeanProject/LeanProof/Main.lean`, verified equal by SHA-256 immediately after copy
(`8d864da2…` both sides). `.lake/packages` bound by manual symlink to the shared, pinned project.
Then, in a new `namespace E993HighTail` appended at the end of the same file (never touching entries
1–45), nine declarations:

1. `indepSetCount_zero`, `indepSetCount_one`, `forwardDifferenceDel_zero_eq` — new helper lemmas:
   `i_0(G-D)=1`, `i_1(G-D)=|univ\D|`, hence `Δ_0(G-D) = (n:ℤ) - D.card - 1`, for **any** deletion set
   `D` on **any** graph (no leaf/bipartite/guard hypothesis anywhere).
2. `leafTermAtOne_eq_degSubOne` — the general `p=1` formula: for any leaf `v` on any graph, the
   pointwise term at `p=1` equals `deg_G(s_v) - 1` exactly (SEMANTIC-CONTRACT §2's "term = deg(s) - 1"
   claim), proved from (1) plus `|H_v|=2` and `|R_v|=deg(s_v)+1`.
3. `bipartite_indepNum_one_card_le_two` — for bipartite `G` with `α(G)=1`: `card V ≤ 2` (both
   2-colour classes are independent, hence each has card `≤ 1`, and they partition `V`).
4. `bipartiteTaggedShadowBound` — Target 1 (TSB), registry ℤ scope: specializes the compiled internal
   `E993Interior.taggedShadowBound` (entry 41) at `U = univ`, `a = H.indepNum`, `hcap` from
   `IsIndepSet.card_le_indepNum`, then casts to ℤ using `k ≤ a`.
5. `bipartiteLeafHighTailPointwise` — Target 2 (HTP), every `p ≥ 1`: case-splits on `p=1` (uses 2, 3
   directly — no internal mechanism needed) vs `p ≥ 2` (calls the internal `leaf_term_nonpos`, entry
   42, fed by the ℕ form of `taggedShadowBound`, entry 41 — NOT my ℤ-cast (4), since `leaf_term_nonpos`
   wants the ℕ-form `hShadow` argument literally).
6. `bipartiteHighTailAggregateAllRanks` — Target 2's corollary (HTA), every `p ≥ 1`: `Finset.sum_nonpos`
   over (5).
7. `interiorEligibilityAlphaGeSeven` — Target 3 (ELIG): a one-line keyword re-export of the compiled
   internal `E993Interior.eligibleAlphaGeSeven` (entry 43).
8. `topRankNonResidualAggregate` — Target 4 (TRN): the eligibility hypothesis (ℕ) forces `α≥3` by
   `omega`; `α=3` is excluded by `Δ_0(T)≥0` (`Guard.delta_zero_nonneg`, entry 43, called **across the
   award boundary within the same file** — see the private-visibility finding below) contradicting
   `crossingIndex=0`; hence `α≥4`, the guard `3(α-1)≥2α+1` holds, and `bipartiteHighTailAggregate`
   (entry 44) with `hT.isBipartite` closes it.

`lake build LeanProof` — **build completed successfully, 8657 jobs, zero errors** (only pre-existing
linter warnings from the carried source, plus two harmless unused-argument/deprecated-name linter
warnings in the new code, listed under `## Lint notes`, not correctness issues).

`#print axioms` on all six new terminal-facing declarations plus a control check on the verified
award's own theorem:

```
'E993HighTail.bipartiteTaggedShadowBound' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993HighTail.leafTermAtOne_eq_degSubOne' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993HighTail.bipartite_indepNum_one_card_le_two' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993HighTail.bipartiteLeafHighTailPointwise' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993HighTail.bipartiteHighTailAggregateAllRanks' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993HighTail.interiorEligibilityAlphaGeSeven' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993HighTail.topRankNonResidualAggregate' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Interior.firstInteriorAggregate' depends on axioms: [propext, Classical.choice, Quot.sound]
```

Only the three permitted axioms (`SOLUTION-CONTRACT.md` §2) on every declaration, including the
control re-check of the already-verified award. **No `sorry`, no `admit`, no `native_decide`, no new
`axiom`.**

Digests (all under `scratchpad/c1-U1-replay/`, never under `sources/`):
- Assembled `Main.lean` (carried source + append), 70523 bytes:
  `9fa0ffdd69f74cf21a27edafae411ad5b7bf77e039bb19157df2c22338507aa0`
- The append block alone (`E993HighTail-append.lean`), 9227 bytes:
  `f3b89bbf4fb2a6f687ba70529106c7e223ad507c8a351ee9979bb0654022378b`
- `#print axioms` output text (`axiom-check-output.txt`), 830 bytes:
  `11ea513cb897fb50ed5e07bf4fe80685b7f582fe6396e42143dd87c27a39374a`

**Copy-out-first replay** (foreground; target is in-root, never `/tmp`):
```
sh /Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-U1-replay/replay.sh \
  /Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-U1-replay/out
```
The script copies the four pinned project files and `Main.lean` fresh from `sources/`, symlinks the
shared Mathlib packages, appends the byte-identical `E993HighTail-append.lean`, asserts the assembled
digest and axiom-output digest above (`assert`, hard-fails on mismatch — no silent drift), builds, and
re-runs `#print axioms`. **Already executed in this session against `scratchpad/c1-U1-replay/out/`
(left in place as the replay artifact): exact digest match on both the assembled source and the axiom
output, `lake build` succeeded (8657 jobs), identical axiom set on all 8 declarations.** No wall-clock,
PID or host field is embedded in any hashed artifact. (A second, throwaway build — swapping
`bipartiteHighTailAggregateAllRanks` from `theorem` to `lemma` to verify the `## Correction verified`
claim — was run in `scratchpad/c1-U1-replay/lemma-correction-test/` and then deleted; it is not part of
the replay bundle and carries no digest of its own, since its only purpose was the boolean
"does it still build" check, confirmed 8657/8657.)

## Step-by-step derivations, every hypothesis named where it enters

**`bipartiteTaggedShadowBound` (TSB).** Internal `E993Interior.taggedShadowBound` (entry 41) states,
for `H`, `hBip : H.IsBipartite`, `U W : Finset V`, `a k : ℕ`, `hcap : ∀ A ⊆ U, IsIndepSet A → A.card ≤ a`,
`hk : 1 ≤ k`: `k * (taggedFamily H U W (k+1)).card ≤ 2*(a-k) * (taggedFamily H U W k).card` (ℕ,
truncated `a-k`). Specialize `U := Finset.univ` (`hcap`'s `A ⊆ univ` is then vacuous — trivially true
for every `A`) and `a := H.indepNum`; `hcap` becomes exactly `IsIndepSet.card_le_indepNum`
(`Combinatorics/SimpleGraph/Clique.lean:991`), needing **no extra hypothesis** — it holds for every
independent set unconditionally. `hk : 1 ≤ k` is the route's own `hk`. The registry statement adds
`hka : k ≤ H.indepNum` **only** to make the ℕ-truncated `a - k` equal the honest integer difference
`(a:ℤ) - k` when cast — `Nat.cast_sub hka` is exactly this fact, used once. Cast the ℕ inequality to ℤ
via `Int.ofNat_le`, `push_cast [Nat.cast_sub hka]`, close with `linarith`. **`hk` enters only in the
internal lemma's own proof (never touched here); `hka` enters only in the final cast.**

**`p = 1` endpoint (`leafTermAtOne_eq_degSubOne`, `bipartite_indepNum_one_card_le_two`, folded into
`bipartiteLeafHighTailPointwise`'s first case).** From `hTail : 2·α(G)+1 ≤ 3·1 = 3`: `α(G) ≤ 1` by
`omega` on the ℕ hypothesis directly (no separate lemma needed — this is where `hTail` enters). The
leaf `v` gives `α(G) ≥ 1` (the singleton `{v}` is independent — `SimpleGraph.isIndepSet_iff` on a
one-element set is vacuous — combined with `IsIndepSet.card_le_indepNum` in reverse, i.e.
`hsingle.card_le_indepNum : 1 ≤ G.indepNum`). So `α(G) = 1` — **this is where `hv` (leafhood) enters**:
only to witness a nonempty independent set forcing `α ≥ 1`; leafhood is not used again until the
degree bound below. `hBip` (bipartiteness) enters exactly once, in
`bipartite_indepNum_one_card_le_two`: the two colour classes of any 2-colouring
(`obtain ⟨c⟩ := hBip`, unfolding `IsBipartite := G.Colorable 2`,
`Combinatorics/SimpleGraph/Bipartite.lean:286`) are each independent (adjacent vertices get different
colours by `c.valid`, so two same-coloured vertices are never adjacent — `SimpleGraph.isIndepSet_iff`),
hence each has card `≤ α(G) = 1` by `IsIndepSet.card_le_indepNum`, and they partition `V`
(`Finset.card_filter_add_card_filter_not`) — `card V ≤ 2`. **This bound is not directly used in the
final term computation** (the general formula `term = deg(s)-1` from `leafTermAtOne_eq_degSubOne`
holds unconditionally); it is used only to derive `deg(s) ≤ 1`: the neighbours of `s` lie in
`univ.erase s` (no self-loop, `G.irrefl`), so `deg(s) = |neighborFinset s| ≤ card V - 1 ≤ 1`. Then
`term = deg(s) - 1 ≤ 0` by `omega` after casting. **`hv` enters a second time here** implicitly (it is
what makes `s = support G v` well-defined and adjacent to `v` — `E993Interior.Leaf.support_adj`,
private in entry 42, called across the file boundary since the append lives in the same `Main.lean`).
`hp : 1 ≤ p` enters only to justify the case split (`p=1` vs `p≥2`); it is not otherwise used in the
`p=1` branch.

**`bipartiteLeafHighTailPointwise`, `p ≥ 2` branch.** Directly `E993Interior.Leaf.leaf_term_nonpos`
(private, entry 42) applied with the internal ℕ-form shadow bound (`E993Interior.taggedShadowBound`,
entry 41, fed via `hBip`) — `hp2 : 2 ≤ p` and `hTail` pass straight through unchanged; this is
compiled-internal machinery, cited by entry number and digest, **never presented as a certificate on
its own** (fence §3.8).

**`bipartiteHighTailAggregateAllRanks` (HTA).** `Finset.sum_nonpos` over the favorable-leaf filter of
`leafSet G` (entry 6/13); each summand is `bipartiteLeafHighTailPointwise` at that leaf. `hp`, `hTail`
pass through unchanged to every summand — the aggregate adds no new hypothesis beyond HTP's.

**`interiorEligibilityAlphaGeSeven` (ELIG).** Pure re-export: `E993Interior.eligibleAlphaGeSeven`
(entry 43) applied to `hT`, `hInterior` verbatim. `hT.IsTree`'s two components (connectivity,
acyclicity) are used **inside** entry 43 (not re-derived here): connectivity via
`hT.card_edgeFinset`/tree-edge-count identities (`Guard.order_ge_alpha_succ`,
`Guard.delta_one_nonneg`, etc.); acyclicity via `hT.isAcyclic` feeding
`Erdos993G1.indepCount_three_add_edge_incidence`'s triple-incidence identity (entry 34, itself built on
entry 31's `IsAcyclic.cliqueFree` triangle exclusion). `hInterior : crossingIndex G + 2 ≤ indepNum − 2`
(ℕ) is exactly the registry's hypothesis (SEMANTIC-CONTRACT §2, (ELIG)): false for `α<2` (RHS `0`),
equal to the integer statement for `α≥2`.

**`topRankNonResidualAggregate` (TRN).** `hEligible : crossingIndex G + 2 ≤ indepNum − 1` (ℕ) gives
`3 ≤ α` by `omega` alone (any `α ≤ 2` makes `α-1 ≤ 1 < 2 ≤ x+2` regardless of `x`). To exclude `α = 3`:
`order_ge_alpha_succ` (`Guard`, entry 43, needs `hT : G.IsTree` **and** `2 ≤ α` — this is where
`hT`'s connectivity is used a second time, via the maximum-independent-set-is-not-everything argument
that needs `hT.card_edgeFinset ≥ 1`, i.e. the tree has an edge, i.e. `n ≥ 2`) gives `n ≥ α+1`;
`delta_zero_nonneg` (needs only `2 ≤ card V`, itself from `n ≥ α+1 ≥ 4`) gives `Δ_0(T) ≥ 0`; if `α=3`
then `hEligible` forces `x=0` by `omega`, but `crossing_negative` (entry 43, no extra hypothesis beyond
`DecidableRel`) says `Δ_x(T) < 0` — contradiction at `x=0` with `Δ_0(T)≥0`. Hence `α≥4`. Then
`p := α-1 ≥ 3 ≥ 2` and `3(α-1) ≥ 2α+1 ⟺ α ≥ 4` (`omega`, using `α≥4` directly) — `hT.isBipartite` (the
**bipartite half** of `IsTree`, not acyclicity or connectivity per se, though both feed the coloring
construction inside Mathlib's `IsTree → IsBipartite` route) feeds `E993Interior.bipartiteHighTailAggregate`
(entry 44) to close. **`hT` therefore enters TRN's proof three separate times**: once for
`order_ge_alpha_succ`'s edge-existence step, once (trivially, via `2 ≤ card V`) for
`delta_zero_nonneg`, and once via `hT.isBipartite` for the final application.

## Private-visibility finding (allocation item (b))

`E993Interior.Guard.delta_zero_nonneg` and `E993Interior.Guard.order_ge_alpha_succ` (and every other
`Guard`/`Core`/`Leaf` helper, entries 41–43) are declared `private`. **Confirmed empirically, not just
by reading**: `topRankNonResidualAggregate` calls `Guard.order_ge_alpha_succ`, `Guard.crossing_negative`
and `Guard.delta_zero_nonneg` directly and the file **compiles**, because Lean's `private` restricts
visibility to the **declaring file**, not the declaring namespace or project, and my new declarations
live in the very same `Main.lean` (byte-identical carry + append, one physical file). **Answer to the
allocation's question:** a separate award **project** (a different file, even if it `import`s a
compiled `.olean` of another award) could **not** call these `private` helpers — `private` blocks
cross-file access regardless of import. So the carry plan below either (i) re-carries the `Guard` block
(entry 43, as one registrar unit — its private helpers travel with it into whichever award's file
contains it) into any award project whose terminal theorem needs it, or (ii) has that entry's own award
add a **new public** re-statement of exactly the needed facts (`order_ge_alpha_succ`,
`delta_zero_nonneg`, `crossing_negative`) on its own face, citable cross-file by the dependent award —
mirroring how `E993Interior.eligibleAlphaGeSeven` and `E993Interior.bipartiteHighTailAggregate`
themselves (entries 43/44, non-private) are already citable cross-file once compiled. **A public
re-statement is the cleaner, less-duplicative choice** for LA4 if LA3 (ELIG) is built as its own
project first; re-carrying entry 43 wholesale into LA4 works but duplicates ~250 lines of guard
machinery that LA3 will have already certified.

## Registrar/carry plan for four separate award projects

Carrying rule throughout: definitions before lemmas, terminal theorem last, no trailing prime in any
name (`SOLUTION-CONTRACT.md` §2), `expected_statement` text taken verbatim from `theorem`/`lemma` to
before ` :=`.

**LA1 — TSB (`E993-BIPARTITE-TAGGED-SHADOW-BOUND`).** Carries: entry 18 (`E993Interior.taggedFamily`,
definition), entry 41 (`E993Interior.taggedShadowBound` with its `Core` private helpers, one registrar
unit, digest `50dcce4a…`). New: `bipartiteTaggedShadowBound` (terminal `theorem`). No G1 (entries
15–17/19–40) or C4LA1/C5LA1 (1–14) definitions are needed — entry 41's proof is self-contained on
`taggedFamily`, `IsBipartite`, `IsIndepSet.card_le_indepNum`. **Smallest of the four projects.**

**LA2 — HTP + HTA (`E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` + the run-local HTA key).** Carries:
entries 1–14 (`C4LA1.*`, `C5LA1.*` — `IsGraphLeaf`, `support`, `H`, `R`, `indepSetCount`,
`forwardDifferenceDel`, `aggregate`, `leafSet`, all needed), entry 18, entry 41, entry 42
(`E993Interior.highTailAggregateFromShadow` with its `Leaf` private helpers, digest `972d0d90…`). New:
`indepSetCount_zero`, `indepSetCount_one`, `forwardDifferenceDel_zero_eq`, `leafTermAtOne_eq_degSubOne`,
`bipartite_indepNum_one_card_le_two` (defs/lemmas, in that dependency order), `bipartiteTaggedShadowBound`
(**needed again here** as a `lemma`, or — cleaner — LA2 depends on LA1's compiled `.olean` for it,
since it is not `private`; the `p ≥ 2` branch of HTP calls the entry-41 ℕ form directly, not this ℤ
form, so LA2 does **not strictly need** `bipartiteTaggedShadowBound` itself, only entry 41 — drop it
from LA2's new-declarations list; it belongs only to LA1), then the terminal `theorem
bipartiteLeafHighTailPointwise`, then the companion `lemma bipartiteHighTailAggregateAllRanks`
(**correction**: my scratch compiled this as `theorem`, matching neither `SOLUTION-CONTRACT.md` §2's
own code block, which declares it `lemma`, nor the "one terminal theorem per award" rule — the governed
award MUST use `lemma` here; trivial keyword fix, already re-verified to compile as `lemma` — see
`## Correction verified` below).

**LA3 — ELIG (`E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN`).** Carries: entries 1–14, 15–17
(`Erdos993G1.indepCount/coeff/delta`), 18 (not actually used by entry 43's proof — **omit**; entry 43
never calls `taggedFamily`), 19–40 (the full `Erdos993G1` counting-lemma chain entry 43's `Guard`
namespace needs: `indepCount_eq_card_indepSetFinset`, `coeff_nat`, `delta_nat`,
`indepCount_two_add_edges`, `indepCount_three_add_edge_incidence`, `scaledChooseTwo/Three`, and their
own dependency chain back through 19–33), entry 43 (`E993Interior.eligibleAlphaGeSeven` with its
`Guard` private helpers, digest `dbd200bd…`). New: `interiorEligibilityAlphaGeSeven` (terminal, a
thin re-export) **plus**, per the private-visibility finding, new PUBLIC (non-`private`) restatements
of `Guard.order_ge_alpha_succ`, `Guard.delta_zero_nonneg`, `Guard.crossing_negative` **on LA3's own
face** (e.g. `interiorOrderGeAlphaSucc`, `interiorDeltaZeroNonneg`, `interiorCrossingNegative`) so that
LA4 can cite them cross-file without re-carrying entry 43. Drop entry 18 to shrink this project (only
LA1/LA2/LA4 need `taggedFamily`).

**LA4 — TRN (`E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE`).** Two carry options, both proved viable here
because everything compiled in one file: **(preferred, cross-award dependency)** entries 1–14 only
(needs `C5LA1.crossingIndex`, `C5LA1.aggregate` for its own statement) + a Lean `import` of LA2's
compiled award (for `bipartiteHighTailAggregateAllRanks`/`E993Interior.bipartiteHighTailAggregate`,
public) + a Lean `import` of LA3's compiled award (for the new public Guard restatements) — the
`DEPENDENCIES.yaml`/`RECEIPTS/dependency-authority.json` pattern already used by the first-interior
award for its own upstream citations (r24/r25/r26). **(fallback, self-contained)** carry entries 1–14,
15–17, 18, 19–40, 41, 42, 43, 44 wholesale (everything except entry 45) into LA4's own file — this is
exactly what my scratch project does, and it is what I actually compiled and axiom-checked above; it
works but duplicates the entire mechanism a fourth time. **I recommend the preferred (dependency)
option** to the synthesis; the fallback is the proven-safe default if governed cross-award Lean imports
are not set up in time.

## Draft `THEOREM-CONTRACT.yaml` — LA1, LA2, LA3

(T2 drafts LA4 per allocation; not duplicated here.)

```yaml
# LA1 — draft, not submitted
schema_version: "theorem-contract/v1"
contract_id: "e993-r29-bipartite-tagged-shadow-bound-la1-draft"
theorem:
  title: "Bipartite tagged-shadow bound (registry scope)"
  informal_statement: "For every finite bipartite simple graph H, every W subset of V(H), a = alpha(H), and every natural k with 1<=k<=a: k*q_(k+1)(H,W) <= 2*(a-k)*q_k(H,W) over the integers, where q_j(H,W) counts independent j-subsets of H meeting W."
formulation_status:
  status: "draft_kernel_checked_ungoverned"
  evidence:
    - "scratchpad/c1-U1/LeanProject/LeanProof/Main.lean, E993HighTail.bipartiteTaggedShadowBound: sorry-free, axioms [propext, Classical.choice, Quot.sound], lake build 8657/8657 (this RETURN.md)."
    - "Compiled internal E993Interior.taggedShadowBound, entry 41 of the verified first-interior award (context, never a certificate; fence SOLUTION-CONTRACT.md §3.8)."
definitions:
  - {id: def-taggedFamily, lean_name: "E993Interior.taggedFamily", dependencies: []}
  - {id: def-indepNum, lean_name: "SimpleGraph.indepNum", dependencies: []}
hypotheses:
  - {id: hyp-bip, statement: "H.IsBipartite", dependencies: []}
  - {id: hyp-k, statement: "1 <= k", dependencies: []}
  - {id: hyp-ka, statement: "k <= H.indepNum -- makes the Nat-truncated (a-k) equal the integer difference on cast", dependencies: [def-indepNum]}
conclusion:
  statement: "(k:Z) * (taggedFamily H univ W (k+1)).card <= 2*((H.indepNum:Z)-k) * (taggedFamily H univ W k).card"
  dependencies: [hyp-bip, hyp-k, hyp-ka, def-taggedFamily]
permitted_axioms: ["Classical.choice", "Quot.sound", "propext"]
lean_binding:
  project_relpath: "LeanProject"
  source_relpath: "LeanProject/LeanProof/Main.lean"
  declaration_name: "bipartiteTaggedShadowBound"
  expected_declaration_kind: "theorem"
  expected_statement: |
    theorem bipartiteTaggedShadowBound {V : Type*} [Fintype V] [DecidableEq V]
        (H : SimpleGraph V) [DecidableRel H.Adj] (hBip : H.IsBipartite) (W : Finset V) (k : ℕ)
        (hk : 1 ≤ k) (hka : k ≤ H.indepNum) :
        (k : ℤ) * (taggedFamily H Finset.univ W (k + 1)).card ≤
          2 * ((H.indepNum : ℤ) - k) * (taggedFamily H Finset.univ W k).card

# LA2 — draft, not submitted
---
schema_version: "theorem-contract/v1"
contract_id: "e993-r29-bipartite-leaf-high-tail-pointwise-la2-draft"
theorem:
  title: "Bipartite leaf high-tail pointwise sign, every p >= 1, with aggregate corollary"
  informal_statement: "For every finite bipartite G, every original leaf v with support s, every integer p>=1 with 3p>=2*alpha(G)+1: Delta_(p-1)(G-{v,s}) - Delta_(p-1)(G-N_G[s]) <= 0; and the sum of this term over every favorable original leaf (one tag per leaf) is <= 0."
formulation_status:
  status: "draft_kernel_checked_ungoverned"
  evidence:
    - "scratchpad/c1-U1/LeanProject/LeanProof/Main.lean, E993HighTail.bipartiteLeafHighTailPointwise and .bipartiteHighTailAggregateAllRanks: sorry-free, axioms [propext, Classical.choice, Quot.sound] (this RETURN.md)."
    - "p=1 endpoint is NEW (Astra's FINAL-ANALYSIS.md gap); p>=2 is the compiled internal leaf_term_nonpos, entry 42, context only."
hypotheses:
  - {id: hyp-bip, statement: "G.IsBipartite"}
  - {id: hyp-leaf, statement: "C4LA1.IsGraphLeaf G v"}
  - {id: hyp-p, statement: "1 <= p"}
  - {id: hyp-tail, statement: "2*G.indepNum + 1 <= 3*p"}
conclusion:
  statement: "C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p-1) - C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p-1) <= 0"
  dependencies: [hyp-bip, hyp-leaf, hyp-p, hyp-tail]
companion_lemma:
  name: "bipartiteHighTailAggregateAllRanks"
  declaration_kind: "lemma"
  note: "CORRECTION vs the U1 scratch compile, which used `theorem` for this declaration; SOLUTION-CONTRACT.md §2 declares it `lemma` (one terminal theorem per award); re-verified to compile as `lemma` with no other change (see RETURN.md § Correction verified)."
  statement: "C5LA1.aggregate G p <= 0"
permitted_axioms: ["Classical.choice", "Quot.sound", "propext"]
lean_binding:
  declaration_name: "bipartiteLeafHighTailPointwise"
  expected_declaration_kind: "theorem"
  expected_statement: |
    theorem bipartiteLeafHighTailPointwise {V : Type*} [Fintype V] [DecidableEq V]
        (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite) (v : V) (hv : C4LA1.IsGraphLeaf G v)
        (p : ℕ) (hp : 1 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
        C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p - 1) - C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p - 1) ≤ 0

# LA3 — draft, not submitted
---
schema_version: "theorem-contract/v1"
contract_id: "e993-r29-interior-eligibility-alpha-ge-seven-la3-draft"
theorem:
  title: "Interior eligibility guard, re-exported at registry scope, plus public Guard restatements for LA4"
  informal_statement: "For every finite tree T with p=alpha(T)-2: x(T)+2<=p implies alpha(T)>=7."
formulation_status:
  status: "draft_kernel_checked_ungoverned"
  evidence:
    - "scratchpad/c1-U1/LeanProject/LeanProof/Main.lean, E993HighTail.interiorEligibilityAlphaGeSeven: sorry-free re-export of the compiled internal E993Interior.eligibleAlphaGeSeven, entry 43 (this RETURN.md)."
hypotheses:
  - {id: hyp-tree, statement: "G.IsTree"}
  - {id: hyp-interior, statement: "C5LA1.crossingIndex G + 2 <= G.indepNum - 2"}
conclusion:
  statement: "7 <= G.indepNum"
  dependencies: [hyp-tree, hyp-interior]
public_restatements_for_la4:
  - {name: "interiorOrderGeAlphaSucc", source: "private Guard.order_ge_alpha_succ, entry 43", note: "publish non-private so LA4 can cross-file-cite it instead of re-carrying entry 43"}
  - {name: "interiorDeltaZeroNonneg", source: "private Guard.delta_zero_nonneg, entry 43"}
  - {name: "interiorCrossingNegative", source: "private Guard.crossing_negative, entry 43"}
permitted_axioms: ["Classical.choice", "Quot.sound", "propext"]
lean_binding:
  declaration_name: "interiorEligibilityAlphaGeSeven"
  expected_declaration_kind: "theorem"
  expected_statement: |
    theorem interiorEligibilityAlphaGeSeven {V : Type*} [Fintype V] [DecidableEq V]
        (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
        (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) :
        7 ≤ G.indepNum
```

## Correction verified

The keyword fix noted above (LA2's companion declaration must be `lemma`, not `theorem`) was tested:
changing `theorem bipartiteHighTailAggregateAllRanks` to `lemma bipartiteHighTailAggregateAllRanks` in
the scratch file and re-running `lake build LeanProof` **still builds with zero errors** (Lean's
`lemma` is literally notation for `theorem`; the only thing that changes is contract compliance, not
provability). The scratch file was left with `theorem` (matching the axiom-check script above, which
names it) after confirming the fix; the governed award project must use `lemma` per contract.

## Fixed points reproduced (own instrument, exact integers)

U1's own mechanism reaches exactly two of the worker brief's fixed points (the `p=1` endpoint touches
`K_2`; the general `p≥2` internal mechanism's first nontrivial case is `P_3` at `p=2`); the star family
and the two large censuses (A000055 orders 1–16; bipartite labelled graphs orders 1–6) belong to F1's
exhaustive-falsification route and are not reproduced here (no table in this return depends on them).

`scratchpad/c1-U1-replay/fixed_points_check.py` (own instrument, independent of the Lean formalization
— plain Python set/graph brute force implementing `i_k`, `Δ_k`, leaf/support/`H`/`R` exactly per
SEMANTIC-CONTRACT §1, with an explicit acyclicity-and-connectivity test (`is_tree`, via the forest
identity `edges = vertices − components` from union-find) and an explicit 2-colouring test
(`is_bipartite`, BFS colouring) run on every graph before any claim about it):

| Graph | `x(G)` | `α(G)` | is_tree | is_bipartite | leaf `v` | `p` | `Δ_{p-1}(G-H_v)` | `Δ_{p-1}(G-R_v)` | term(`v,p`) |
|---|---|---|---|---|---|---|---|---|---|
| `K_2` (`V={0,1}`, edge `01`) | 1 | 1 | True | True | 0 | 1 | `Δ_0=−1` | `Δ_0=−1` | **0** |
| `K_2` | 1 | 1 | True | True | 1 | 1 | `Δ_0=−1` | `Δ_0=−1` | **0** |
| `P_3` (`V={0,1,2}`, edges `01`,`12`) | 1 | 2 | True | True | 0 | 2 | `Δ_1=−1` | `Δ_1=0` | **−1** |
| `P_3` | 1 | 2 | True | True | 2 | 2 | `Δ_1=−1` | `Δ_1=0` | **−1** |

(`x(K_2)=1`: `Δ_0(K_2)=i_1−i_0=2−1=1≥0`, `Δ_1(K_2)=i_2−i_1=0−2=−2<0`, the least such `k` is `1` — the
worker brief's stated `K_2` term value `0` matches; `x` itself is not separately claimed by
`SEMANTIC-CONTRACT.md` for `K_2`, only computed here as the required per-row field.) Matches
`SEMANTIC-CONTRACT.md` §2 exactly: "`S(K_2,1)=0+0=0`"; "`P_3` … at `p=2` … `Δ_1(H_v)=0−1=−1,
Δ_1(R_v)=0−0=0`, term `−1 ≤ 0`."
Payload SHA-256 (canonical JSON, `sort_keys`, `separators=(",",":")`, no wall-clock/PID/host fields):
`a557df48a8d0f2addd391c0cfd0302595d7531acd554a43a133f7e2b8090b436`. Replay:
```
python3 /Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-U1-replay/fixed_points_check.py
```

## Dependency diagram (new declarations → entries + Mathlib, pinned where found)

| New declaration | Registrar entries used | Private helpers used (same-file only) | Mathlib (pinned `file:line` where located this pass) |
|---|---|---|---|
| `indepSetCount_zero`/`_one` | 10, 11 | — | `Finset.card_singleton`; `Finset.card_eq_one`; `Finset.card_powersetCard` (`Data/Finset/Powerset.lean:212`); `Nat.choose_one_right` (named only — not pinned this pass) |
| `forwardDifferenceDel_zero_eq` | 12 | — | `Finset.card_sdiff` (`Data/Finset/Card.lean:585`, note: unconditional `#(t\s) = #t - #(s∩t)`, not the `A⊆s` form I first guessed); `Finset.inter_univ`; `Finset.card_univ`; `Nat.cast_sub` (named only); `Finset.card_le_univ` (named only) |
| `leafTermAtOne_eq_degSubOne` | 5, 8, 9 | `E993Interior.Leaf.support_adj` (entry 42) | `Finset.card_insert_of_notMem` (`Data/Finset/Card.lean:104`); `Finset.notMem_singleton` (named only); `SimpleGraph.mem_neighborFinset` (named only); `G.irrefl`; `SimpleGraph.card_neighborFinset_eq_degree` (`Combinatorics/SimpleGraph/Finite.lean:203`) |
| `bipartite_indepNum_one_card_le_two` | — | — | `SimpleGraph.IsBipartite = G.Colorable 2` (`Combinatorics/SimpleGraph/Bipartite.lean:286`); `SimpleGraph.Coloring.valid`; `SimpleGraph.isIndepSet_iff`; `IsIndepSet.card_le_indepNum` (`Combinatorics/SimpleGraph/Clique.lean:991`); `Finset.card_filter_add_card_filter_not` (`Data/Finset/Card.lean:643`; I called the now-deprecated alias `Finset.filter_card_add_filter_neg_card_eq_card` — linter warning, not an error, noted below) |
| `bipartiteTaggedShadowBound` | 18, 41 | (entry 41's `Core.*`, internally) | `IsIndepSet.card_le_indepNum` (as above); `Nat.cast_sub`; `Int.ofNat_le` (named only) |
| `bipartiteLeafHighTailPointwise` | 4, 5, 8, 9, 18, 41, 42 | `E993Interior.Leaf.leaf_term_nonpos` (42); plus the three helpers above for its `p=1` branch | `SimpleGraph.isIndepSet_iff` (singleton) |
| `bipartiteHighTailAggregateAllRanks` | 6, 13 | — | `Finset.sum_nonpos` (named only) |
| `interiorEligibilityAlphaGeSeven` | 43 | `E993Interior.eligibleAlphaGeSeven` itself is not private (re-export only) | — |
| `topRankNonResidualAggregate` | 14, 43, 44 | `Guard.order_ge_alpha_succ`, `Guard.crossing_negative`, `Guard.delta_zero_nonneg` (all 43) | `omega`-only arithmetic, no further Mathlib lemma cited by name |

## Lint notes (not correctness issues — `lake build` reported 0 errors)

`Finset.filter_card_add_filter_neg_card_eq_card` is deprecated in favour of
`Finset.card_filter_add_card_filter_not` (used once, in `bipartite_indepNum_one_card_le_two`); two
`Finset.mem_coe` simp arguments are reported unused in the same lemma. Both are cosmetic; a governed
award would swap the deprecated name and drop the unused simp arg before submission. No other new
warning.

## Grades (`SOLUTION-CONTRACT.md` §4)

None of the four targets change registry status from this route: fence §3.8 and Ruling 2 hold —
**a scratch, kernel-checked Lean compile outside the governed award workflow is not a certificate**,
exactly as a compiled-internal lemma inside another award's package is not. What changed materially
this cycle: entering Cycle 1, (TSB)/(HTP)/(ELIG) were "OPEN, proposal only, independent scope audit
approved the identity" (informal-level confidence); (HTA)/(TRN) did not exist as stated declarations
anywhere. After this route, all five registry-scope statements (plus the `p=1` endpoint, which did
not exist even informally before this cycle) have a **complete, sorry-free, permitted-axioms-only Lean
proof, foreground-compiled against the pinned toolchain and Mathlib revision, independently
reproduced byte-for-byte by the replay script in this session**. This is materially stronger evidence
than `proved_informal` (it is machine-checked) but is **not** `formally_verified` in this run's sense
(that status requires the full governed award workflow — `THEOREM-CONTRACT.yaml` submission, informal
audit, fidelity review, kernel-verification receipt, reviewer assignment — none of which ran here).
I record no grade change to any registry key; I record that the governed award workflow's technical
risk on all four targets is now low (a working proof skeleton exists and compiles) rather than
unknown.

## Alias check (lexical AND mathematical)

**Lexical:** searched all 407 `claim_key` values in `sources/authority/CLAIM-IDENTITY.json` for
`SHADOW`, `HIGH-TAIL`/`HIGHTAIL`, `ELIGIBIL`, `TOP-RANK`, `TAGGED`, `R26`, `R23`, `R24`, `BETA`,
`INTERIOR` (case-insensitive substring); results tabulated in `## Registered claims` above. No
`claim_key` matches any of my new Lean declaration names or the run-local `E993-R29-…` candidate names.
**Mathematical:** `bipartiteTaggedShadowBound`/`bipartiteLeafHighTailPointwise`/
`bipartiteHighTailAggregateAllRanks` are the exact registry-scope statements already named OPEN as
`E993-BIPARTITE-TAGGED-SHADOW-BOUND`/`E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` (TSB/HTP) and the
proposed-but-unregistered HTA — not aliases of anything else, by construction (their statements are
copied verbatim from `SOLUTION-CONTRACT.md` §2, which is itself binding). `interiorEligibilityAlphaGeSeven`
is `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` verbatim. `topRankNonResidualAggregate` is the candidate
`E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` (T2's to register); checked against `E993-R26-TOP-RANK-RESIDUAL-SIGN`
(same conclusion shape, `S(G,α−1)≤0`, but r26 additionally requires `2≤α` and the residual hypothesis
(★) — **not the same statement**, a strict weakening of hypotheses, not an alias) and against
`E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` (`S ≤ −2`, a strictly stronger conclusion under r26's stronger
hypotheses — also not an alias). My five new helper lemmas (`indepSetCount_zero/one`,
`forwardDifferenceDel_zero_eq`, `leafTermAtOne_eq_degSubOne`, `bipartite_indepNum_one_card_le_two`) are
Tier-3 candidates (`SOLUTION-CONTRACT.md` §1) with no lexical or mathematical match anywhere in the 407;
left to the synthesis to decide whether they are worth registering on an award's face.

## Read-boundary disclosure

Three `grep`/`find` calls were made against
`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project` (the Mathlib package
directory, explicitly granted "readable for API meaning" and explicitly listed as within-grant for
search tools, per `C1-WORKER-COMMON-BRIEF.md` and the dispatch): one `find -maxdepth 1` to check for a
prebuilt `.lake/build` cache before the first `lake build`, and two batches of `grep -rn`/`grep -rln`
calls (each rooted at or below that same directory, never above it and never touching `sources/`,
`scratchpad/`'s sibling seats, or anything outside the grant) to locate pinned `file:line` citations
for the Mathlib lemmas used in the dependency diagram above. All results are reported verbatim in that
diagram. No file outside the explicitly granted set was read as a result of these searches, and no
`sources/` file was searched recursively (every `sources/` file this route used was named explicitly
from the manifest/brief and read directly, never located by search).

## Remaining obligation

(successor inheritance)

1. **LA1–LA4 are not yet governed awards.** The scratch skeleton compiles; the governed award workflow
   (per-project `THEOREM-CONTRACT.yaml` submission, informal audit, fidelity review, kernel-verification
   receipt, reviewer assignment) has not run on any of the four. A successor (or the controller, per the
   worker brief's closing line: "a seat's compiled fragments are scratch, and the governed award
   workflow is invoked by the controller after synthesis") should seed LA1–LA4 from
   `scratchpad/c1-U1/LeanProject/LeanProof/Main.lean` using the carry plan above, applying the
   `lemma`-not-`theorem` correction to LA2's companion declaration first.
2. **LA2's carry list should drop `bipartiteTaggedShadowBound`** (not needed by HTP's own proof; only
   LA1 needs it) — noted above, not yet acted on since U1 does not edit the carry plan's target files.
3. **LA3 should add three new PUBLIC restatements** (`interiorOrderGeAlphaSucc`,
   `interiorDeltaZeroNonneg`, `interiorCrossingNegative`) of the `private` Guard facts LA4 needs, so
   LA4 can be built as a genuine cross-award dependency rather than re-carrying entry 43 wholesale (the
   proven-safe but heavier fallback is documented above and already demonstrated to compile).
4. **The two lint items** (deprecated `Finset.filter_card_add_filter_neg_card_eq_card`, unused
   `Finset.mem_coe` simp args) should be cleaned before any governed submission; they do not block
   compilation.
5. **T2's LA4 draft contract** should reconcile with the carry-plan analysis here (cross-award
   dependency vs. wholesale carry) before submission; U1 drafted LA1–LA3 only, per allocation.
6. Nothing in the lower region (`3p < 2α+1`), the census values, the r27 root correction, or the r28
   Hall/SDR route was touched, cited, or needed — no fence crossing occurred.

## Headline resolution

`headline_resolved: no`

## Route verdict

`compiled` — a complete, sorry-free, permitted-axioms-only Lean skeleton for all five §2 declarations
exists, foreground-compiled and independently replayed byte-for-byte in this session, but no governed
award has closed; per fence §3.8 and Ruling 2, this is not `proved`/`proved_conditional` at the
registry level.

## Model disclosure

Chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); runtime-reported model
id: `claude-sonnet-5` (per this session's system context, verbatim).
