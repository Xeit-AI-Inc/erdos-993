# RETURN — Route `C1-U-02 LEAN-TRANSPORT-SKELETON` (seat U2), r30 Cycle 1

## Boot acknowledgment

Booted by reading exactly two files, in order, and nothing else from VerityOS
proper: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS
file (memory, conversations, modules, skills, logs, decisions) was read — the
controller booted for the run. This return therefore carries **no**
`## Read-boundary disclosure` section.

## Route identity

- Route ID: `C1-U-02`
- Mechanism fingerprint: `LEAN-TRANSPORT-SKELETON`
- Orientation: U (formal / structural)
- Load-bearing obligation: `control/C1-ALLOCATION.md`, item 6 (U2), parts (a)–(f)
- Chartered model/effort: Claude Sonnet 5, xhigh

## IMPORT LIST

Two small Python replay scripts are shipped; nothing else in this return
executes code outside the pinned Lean toolchain.

- `verify_seal_and_digests.py`: `json`, `hashlib`, `sys` (standard library only)
- No `pip`, no network, no package installs anywhere in this route.
- Lean/Mathlib: the pinned toolchain only (`leanprover/lean4:v4.32.2`,
  Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`), bound by manual symlink;
  no `lake update`, no `lake clean`, no `elan` invocation.

## Stage 2 seal verification

Recomputed SHA-256 over the canonical JSON of
`control/C1-STAGE2-PACKET-MANIFEST.json` with the `seal_sha256` field removed
(`sort_keys=True`, `separators=(",", ":")`, no trailing newline):

```
886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92
```

This matches the manifest's own `seal_sha256` field exactly (`match: True`).
Digest verified independently against `control/SOURCE-DIGESTS.json` for every
source file this route reads (see the replay below): `Main.lean`
(`8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9`),
`LeanProof.lean`, `lake-manifest.json`, `lakefile.toml`, `lean-toolchain`,
`FORMALIZATION-STATE.json`, `THEOREM-CONTRACT.yaml`,
`RECEIPTS/theorem-contract.json` (all under
`sources/first-interior/c2-primary-v2/`), and `sources/mathlib-binding/PIN.json`
— all nine `match: True`. Replay: see "Replays" below.

Sources read (all digest-verified before reading, per the two-step check
above): `control/C1-WORKER-COMMON-BRIEF.md`, `control/C1-STAGE2-PACKET-MANIFEST.json`,
`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C1-ALLOCATION.md`,
`control/C1-STAGE1-GATE.md`, `cycles/cycle-1/stage2/ROUTE-STATE.md`,
`control/SOURCE-DIGESTS.json`, `sources/first-interior/c2-primary-v2/LeanProject/**`
(all files, byte-copied), `sources/mathlib-binding/PIN.json`. No other `sources/`
subtree was read (the lower-region and r29 numeric/instrument records were not
needed by a pure Lean-skeleton route and were not opened).

## Toolchain / pin verification

`sources/mathlib-binding/PIN.json` names Mathlib revision
`905b95818eb32af7874a58b427f50c1711a5e96c` bound at
`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project`. The
manual symlink `scratchpad/c1-U2/LeanProject/.lake/packages ->
.../mathlib-v4.32.2-project/.lake/packages` was created (never copied), and
`git -C .../mathlib-v4.32.2-project/.lake/packages/mathlib rev-parse HEAD`
returned `905b95818eb32af7874a58b427f50c1711a5e96c` — exact match. No
`bind-shared-packages` tool was invoked (it refuses scratch roots per the
brief); the symlink was made directly with `ln -sfn`, which is within grant
since the target is read-only and nothing under `.lake/packages` was written.

## What this route did (summary before any derivation)

`Main.lean` from `sources/first-interior/c2-primary-v2/LeanProject/LeanProof/`
was byte-copied in full (all 45 entries, sha256
`8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9` — identical
to the source; the allocation permits carrying all 45 "if simpler," and it
was: entries 41–42's private lemmas `E993Interior.Leaf.support_adj`,
`.leaf_insert_indep`, `.H_subset_R`, `.tagged_count_split` are exactly the
tools the WID bijection needs, and re-deriving them independently would have
duplicated proof text already governed as entries of record). A new namespace
`E993Transport` was appended, plain source (not run through the VerityOS Lean
Formalization skill that minted entries 1–45's per-fragment digests — see
Fidelity notes). It compiles sorry-free against the pinned Mathlib with the
declarations listed below.

## Registered claims named before this return's results (none are a census)

This route ships **no numeric claims, no census, no tree instances, no flow
table**. It is pure Lean formalization. Per the brief's requirement to name
every registered claim touched before presenting results as evidence:

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — **touched only by
  quoting its typed Lean signature in prose** (see Fidelity notes); **not
  proved, not attempted, not even stated as a Lean declaration** in this
  route's file (stating it without proof needs `sorry`, forbidden; proving it
  is the open object of the whole run, allocated to T1/T2/F1/U1). Status
  unchanged: OPEN.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — this route's
  actual product. A **compiled, sorry-free Lean declaration** exists for it
  (`E993Transport.activeWeightAggregateIdentity`), but per SOLUTION-CONTRACT
  §4 ("a compiled scratch declaration has no grade until its governed award
  closes") this is **not** a self-issued `formally_verified` certificate — it
  is a candidate for the controller's Stage 7 award workflow. Status: OPEN
  (unchanged by a route; only the governed award can close it).
- **(LIFT)**, **(DCB)**, **(TSB)** — not used, not touched. My proof of WID
  uses only entries 1–18 plus the private helper lemmas of entries 41–42
  (`support_adj`, `leaf_insert_indep`, `H_subset_R`, `tagged_count_split`); it
  never cites the finite-group orbit lift, the incidence-deficit identity, or
  the tagged-shadow bound.
- **The ten refuted mechanism keys of `SOLUTION-CONTRACT.md` §3.2** and the
  C6-F4 own-support rule — not touched. None of them is a graph-generic
  weight/layer identity; WID is not a Hall-type mechanism on trees at all, it
  is an identity that holds on *every* finite simple graph with *any* finite
  set of degree-1 tags, so it cannot collide with mechanisms that are
  specifically about `(D)∪(S)`-Hall on ordinary trees.
- **The primary aggregate** `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`
  — untouched (mechanism ≠ aggregate fence; nothing here proves `S(T,p) ≤ 0`
  universally, only that a saturating flow, if one is ever exhibited, would
  imply it via WID).

## Alias check (WID), lexical and mathematical

- **Lexical**: `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` does not
  collide with any of the 434 master-registry names nor the run-local 435th
  entry recorded at Stage 1/2 (`control/C1-STAGE1-GATE.md`: "No registered key
  states (WID)... registered run-local... (OPEN; 435 run-local claims)").
- **Mathematical**, against the two nearest keys named at Stage 1:
  - `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY` (DCB): an
    **extension-accounting** identity on a *bipartite* graph with `h ≥ α(H)`,
    of the shape `k·q_{k+1} + C = 2(h−k)·q_k − D`. It relates *consecutive
    ranks of a single tagged shadow* through an extension/deletion count
    split (`C`, `D` are correction terms). WID relates the *difference of two
    layer sums across the whole vertex set* (`I_{p+1}` vs `I_p`) to a *sum
    over tags of forward-difference gaps between two deletion sets `H_v`,
    `R_v`*. WID has no `C`, `D` correction terms and needs no bipartiteness or
    `h ≥ α` hypothesis — it holds on every finite simple graph. Distinct.
  - `E993-BIPARTITE-TAGGED-SHADOW-BOUND` (TSB): an **inequality**
    (`k·q_{k+1} ≤ 2(a−k)·q_k`) on bipartite graphs bounding one tagged shadow
    by another. WID is an **equality** with no bipartiteness hypothesis and no
    shadow-bound structure. Distinct.
  - Not a re-derivation of the master aggregate `C5LA1.aggregate` itself
    (entry 13, carried byte-identically) — WID's terminal theorem
    (`activeWeightAggregateIdentity`) merely identifies the *transport
    network's* layer-weight difference with that already-defined aggregate; it
    does not redefine or re-derive `aggregate`.
- No refuted mechanism key is revived: WID is a definitional identity, not a
  Hall/flow existence claim, so it cannot be a rephrasing of any of the ten
  struck keys.

## Step-by-step derivation, naming where each hypothesis enters

The transport network's definitions (`SOLUTION-CONTRACT.md` §2) were
transcribed into Lean, namespace `E993Transport`, matching the draft with
implicit/explicit argument style as the only deviations (permitted:
`C1-STAGE1-GATE.md` ruling 9, "U2 may propose equivalent Lean phrasings with
the equivalence proved"):

1. `indepFamily G j` = `I_j(G)`, proved equal to the inherited
   `C5LA1.indepSetsAvoiding G ∅ j` (`indepFamily_eq_indepSetsAvoiding`). No
   hypothesis on `G` at all — holds for any `[Fintype V] [DecidableEq V]
   [DecidableRel G.Adj]`. **`IsTree` does not enter anywhere in this route**:
   WID, `layerWeight_sub_eq_sum`, `aggregate_nonpos_of_saturatingFlow`, and
   `exists_saturatingFlow_of_weightedHall` are all stated and proved for an
   arbitrary finite simple graph, exactly as `SEMANTIC-CONTRACT.md` §1.2
   specifies ("For every finite simple graph `G`..."). `IsTree`
   (connectivity + acyclicity, taken separately in Mathlib's definition) is a
   hypothesis **only** of the un-attempted target
   `lowerRegionTwoForOneWeightedHall` — the one theorem this route does not
   touch. Finiteness enters as `[Fintype V]` throughout (needed for every
   `Finset.univ`, `Finset.powersetCard`, and the clone-expansion `Sigma`
   types to themselves be finite).
2. `tagWitnesses G v` = `W_v`, and `activeWeight G F B` = `w_F(B)` **exactly**
   as the literal count `#{v ∈ F∩B : ¬Disjoint (B.erase v) (tagWitnesses G v)}`
   — never `#(F∩B)`. This is the one place a predecessor error (C6-F5/C6-U5:
   counting `|F∩B|`) could have crept back in; the Lean `def` makes the
   distinction syntactically load-bearing (see Fidelity notes for the exact
   text).
3. `favorableLeaves G p` = `F_p(G)`, the **fixed** selector — Lean enforces
   this by construction: `p` is a single fixed argument to `favorableLeaves`,
   never recomputed inside any of the later lemmas at `p±1`. Where a lemma
   needs the selector fixed at the ORIGINAL rank `p` while ranging over layers
   `p` and `p+1`, that is exactly what `layerWeight G (favorableLeaves G p) (p+1)`
   vs `layerWeight G (favorableLeaves G p) p` express — one fixed `F`, two
   different layer indices.
4. **The bijection of record** (`card_active_eq_tagged`, entry point of the
   whole proof): for a leaf `v` (`hv : C4LA1.IsGraphLeaf G v`, entering via the
   hypothesis `hF : ∀ v∈F, IsGraphLeaf G v` at the point WID is applied to a
   set of tags) and `j ≥ 1`, `B ↦ B.erase v` bijects `{B ∈ I_j(G) : v∈B,
   B\{v} meets W_v}` onto `taggedFamily G (univ∖H_v) R_v (j-1)`. Proved via
   `Finset.card_nbij'` with explicit inverse `A ↦ insert v A`. The **active-tag
   witness** enters exactly here: membership in the source set requires
   `¬Disjoint (B.erase v) (tagWitnesses G v)`, which is carried across the
   bijection into `¬Disjoint A (R G v)` using `tagWitnesses G v ⊆ R G v`
   (`tagWitnesses_subset_R`, unconditional) and the fact that `A` avoids `v`
   and `support G v` (so `A ∩ R_v = A ∩ W_v`). `j ≥ 1` enters only to make
   the arithmetic `(j-1)+1 = j` hold in ℕ (guarded, `omega`); at `j=0` the
   statement is vacuously fine but the specific bijection construction is not
   needed by WID (which only ever calls it at `j = p` and `j = p+1` with
   `p ≥ 1`).
5. **Double counting** (`layerWeight_eq_sum_card`): `layerWeight G F j = Σ_B
   activeWeight G F B` is rewritten as `Σ_{v∈F} #{B ∈ I_j : v∈B, v active}`
   by expanding each `activeWeight` as `Σ_{v∈F} ite(...) 1 0`
   (`Finset.card_filter`) and swapping the double sum (`Finset.sum_comm`). No
   graph hypothesis enters; this is pure Finset combinatorics.
6. **WID, general form** (`layerWeight_sub_eq_sum`): combine steps 4–5 at
   `j = p+1` and `j = p`, then invoke `E993Interior.Leaf.tagged_count_split`
   (carried, entry 41/42 block; `H_v ⊆ R_v` from `H_subset_R`, itself needing
   `hv : IsGraphLeaf` — this is where **leafhood enters a second time**, to
   split `indepSetCount G (H_v) k` into the tagged part plus
   `indepSetCount G (R_v) k`) to identify `#{B∈I_j : v active} = q_v(j-1)`,
   then close the arithmetic (ℕ-to-ℤ casts, `p-1+1=p` and `p+1-1=p` both
   guarded by `hp : 1 ≤ p` via `omega`) with `push_cast` and `ring`. **`p ≥ 1`
   is the one ℕ-subtraction guard this whole route needs**, and it is a
   hypothesis of every lemma from here on.
7. **WID at the fixed selector** (`activeWeightAggregateIdentity`): specialize
   step 6 to `F = favorableLeaves G p`; the right side becomes *literally*
   `C5LA1.aggregate G p` by `rfl` after `unfold`, because `favorableLeaves G p`
   is definitionally the same filtered Finset that `C5LA1.aggregate`'s
   defining sum ranges over (both trace to the byte-identical entry 13). No
   group invariance enters anywhere in this route — it is not used by WID,
   FLOW⇒SIGN, or HALL⇒FLOW (group-invariant reductions are U1's route).
8. **FLOW⇒SIGN** (`aggregate_nonpos_of_saturatingFlow`): given
   `IsSaturatingFlow G (favorableLeaves G p) p f`, the total flow equals the
   supply sum (`layerWeight ... (p+1)`, from the saturation clause) and is
   `≤` the capacity sum (`layerWeight ... p`, from the capacity clause,
   summed via `Finset.sum_le_sum`); casting to ℤ and combining with WID gives
   `C5LA1.aggregate G p ≤ 0`. **This proof never inspects `transportRel`** —
   exactly as `SEMANTIC-CONTRACT.md` §2 remarks ("uses (HALL-COND) only at
   `X = I_{p+1}`"); the flow's *support* clause (which does mention
   `transportRel`) is destructured and discarded (`obtain ⟨-, hsat, hcap⟩`).
9. **HALL⇒FLOW** (`exists_saturatingFlow_of_weightedHall`, attempted per
   obligation (d) and completed — see below): the clone expansion. Two
   "weighted-to-zero-one" sigma types `α = Σ B:Finset V, Fin (wSrc B)`,
   `β = Σ A:Finset V, Fin (wTgt A)` where `wSrc B := if B∈I_{p+1} then
   activeWeight G F B else 0` (and symmetrically `wTgt`) — the `if` is what
   makes junk (non-layer) Finsets contribute **zero** clones, so `α`/`β`
   contain only genuine source/target clones. The relation `r x y :=
   transportRel G x.1 y.1` — **this is the one place the literal relation
   `(D)∪(S)` enters**, unchanged, exactly as defined. Hall's theorem
   (`Fintype.all_card_le_filter_rel_iff_exists_injective`,
   `Mathlib.Combinatorics.Hall.Basic:196`) needs `∀ A:Finset α, #A ≤
   #{b|∃a∈A,r a b}`; this is derived from the hypothesis `WeightedHall G F p`
   by observing that for any `A`, letting `X := A.image (·.1)` (necessarily
   `⊆ I_{p+1}`, since only genuine sources have nonempty fibers), `A` sits
   inside the *full fiber* over `X` (cardinality `Σ_{B∈X} wSrc B`, by the
   generic helper `card_sigma_fiber_filter`), and the target-side filtered set
   is exactly the full fiber over `N(X)` — so the chain `#A ≤ Σ_X w ≤ Σ_{N(X)}
   w = #{b|...}` closes with the WeightedHall hypothesis supplying the middle
   inequality. The resulting injection `f` is turned into
   `flow B A := #{x:α | x.1=B ∧ (f x).1=A}`; support, saturation
   (`Finset.card_eq_sum_card_fiberwise`) and capacity
   (`Finset.card_le_card_of_injOn`, using injectivity of `f`) are each proved
   from `f`'s two properties (injective; respects `r`).

## Result: what compiled, sorry-free, axiom-clean

All five new substantive declarations (plus the double-counting lemma and the
generic sigma-fiber helper) compile with **zero `sorry`** and depend only on
the three permitted axioms:

| Lean name | Role | `#print axioms` |
|---|---|---|
| `E993Transport.card_active_eq_tagged` | the WID bijection | `[propext, Classical.choice, Quot.sound]` |
| `E993Transport.layerWeight_eq_sum_card` | double-counting | `[propext, Classical.choice, Quot.sound]` |
| `E993Transport.layerWeight_sub_eq_sum` | **(WID), general form** | `[propext, Classical.choice, Quot.sound]` |
| `E993Transport.activeWeightAggregateIdentity` | **(WID) at `F_p`, the Tier-1′ target** | `[propext, Classical.choice, Quot.sound]` |
| `E993Transport.aggregate_nonpos_of_saturatingFlow` | **(FLOW⇒SIGN)** | `[propext, Classical.choice, Quot.sound]` |
| `E993Transport.card_sigma_fiber_filter` | generic clone-count helper | `[propext, Classical.choice, Quot.sound]` |
| `E993Transport.exists_saturatingFlow_of_weightedHall` | **(HALL⇒FLOW)** | `[propext, Classical.choice, Quot.sound]` |

Obligation (d) ("attempt `exists_saturatingFlow_of_weightedHall`... or report
the exact blocking node") is therefore **fully discharged, not blocked**: no
blocking node to report. `(HALL)` itself — the theorem that would *supply*
the `WeightedHall` hypothesis for actual trees — remains untouched and OPEN;
that is T1/T2/F1/U1's object, not a Lean-skeleton deliverable.

Final scratch project: `scratchpad/c1-U2/LeanProject/`. `LeanProof/Main.lean`:
1901 lines, sha256 `110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743`
(this exact byte sequence: the frozen 45-entry source, then the five
`e993transport_partN.lean` files below concatenated in order 1–5). `lake build`
from a clean `.lake/build` (no `lake clean`; the project's own build directory
had never been built before this session) completed with 8657/8657 jobs,
warnings only (all pre-existing, in the carried entries — none in the new
`E993Transport` code), 0 errors.

## Dependency diagram

**Carried definitions (byte-identical, entries 1–18 of
`sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean`,
digest `8d864da2...`):** `C4LA1.IsGraphLeaf` (4), `C4LA1.IsFavorableAt` (3),
`C5LA1.support` (5), `C5LA1.leafSet` (6), `C5LA1.H` (8), `C5LA1.R` (9),
`C5LA1.indepSetsAvoiding` (10), `C5LA1.indepSetCount` (11),
`C5LA1.forwardDifferenceDel` (12), `C5LA1.aggregate` (13),
`C5LA1.crossingIndex` (14, unused by this route but carried with the file),
`E993Interior.taggedFamily` (18).

**Carried private lemmas (entries 41–42's block,
`sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean` lines
981–984, 991–1002, 1004–1023, 1045–1084):**
`E993Interior.Leaf.support_adj`, `.support_unique`, `.H_subset_R`,
`.leaf_insert_indep`, `.leaf_indep_cap`, `.tagged_count_split` — all four of
the first group are used directly by `card_active_eq_tagged` /
`layerWeight_sub_eq_sum`; `.leaf_indep_cap` and the shadow-bound machinery of
41/42 are carried (part of the same file) but **not used** by this route's
new code.

**New (this route), namespace `E993Transport`, plain appended source (not run
through the VerityOS Lean Formalization skill — see Fidelity notes):**
`indepFamily`, `indepFamily_eq_indepSetsAvoiding`, `tagWitnesses`,
`activeWeight`, `layerWeight`, `favorableLeaves`,
`isGraphLeaf_of_mem_favorableLeaves`, `transportRel`, `IsSaturatingFlow`,
`WeightedHall` (10 definitions/basic facts); `tagWitnesses_subset_R`,
`card_active_eq_tagged` (2); `layerWeight_eq_sum_card`,
`layerWeight_sub_eq_sum`, `activeWeightAggregateIdentity`,
`aggregate_nonpos_of_saturatingFlow` (4); `card_sigma_fiber_filter` (1);
`exists_saturatingFlow_of_weightedHall` (1) — 18 new declarations total.

**Mathlib lemmas cited by declaration name with pinned file:line**
(revision `905b95818eb32af7874a58b427f50c1711a5e96c`):

- `SimpleGraph.isIndepSet_iff` — `Mathlib/Combinatorics/SimpleGraph/Clique.lean:846`
- `Finset.card_nbij'` — `Mathlib/Data/Finset/Card.lean:403-405`
- `Finset.card_bij'` — `Mathlib/Data/Finset/Card.lean:373-378`
- `Finset.card_filter` — `Mathlib/Algebra/BigOperators/Group/Finset/Piecewise.lean:277-278`
- `Finset.card_eq_sum_card_fiberwise` — `Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean:979-981`
- `Finset.card_le_card_of_injOn` — `Mathlib/Data/Finset/Card.lean:422-427`
- `Finset.card_sigma` — `Mathlib/Algebra/BigOperators/Group/Finset/Sigma.lean:134`
- `Fintype.all_card_le_filter_rel_iff_exists_injective` — `Mathlib/Combinatorics/Hall/Basic.lean:196-207`
- `Disjoint.mono_right` — `Mathlib/Order/Disjoint.lean:89`
- `Finset.not_disjoint_iff` — `Mathlib/Data/Finset/Disjoint.lean:69`
- `Finset.insert_erase` — `Mathlib/Data/Finset/Basic.lean:142`
- `Finset.erase_insert` — `Mathlib/Data/Finset/Basic.lean:134`
- `Finset.filter_filter` — `Mathlib/Data/Finset/Filter.lean:137`

A draft `THEOREM-CONTRACT.yaml`-style JSON for the WID award (matching the
schema of `sources/first-interior/c2-primary-v2/THEOREM-CONTRACT.yaml`) is at
`scratchpad/c1-U2/THEOREM-CONTRACT-draft-WID.json` (sha256
`3d47a0e6059236c8c2d99d63bdb60bebab1ba0981142f8a277aebcdc7b778f44`), naming
every `lean_name`, dependency, the terminal theorem's signature deviation from
the contract draft, and — explicitly — the un-attempted `(HALL)` statement and
why.

## Fidelity notes (obligation (f))

1. **`transportRel`'s case (S) is neither wider nor narrower than the
   charter's relation.** The Lean text is
   `∃ u, u ∉ B ∧ (G.neighborFinset u ∩ B).card = 2 ∧ A = insert u (B \
   G.neighborFinset u)` — this is exactly "`u` has exactly two neighbours in
   `B`, and `A` is `B` with those two neighbours replaced by `u`," matching
   `SEMANTIC-CONTRACT.md` §1.2 literally, including that `u ∉ B` is required
   (so `u` is genuinely new) and the cardinality is pinned at exactly `2`, not
   "at least 2" or "at most 2." I did not prove (nor need, since `transportRel`
   is never inspected by any lemma this route proves except through the
   `Fintype.all_card_le_filter_rel_iff_exists_injective` application, which
   only needs `DecidableRel r`) that case (S) preserves independence or the
   exact cardinality claim `|A| = p` asserted informally in
   `SEMANTIC-CONTRACT.md` §1.2 — that is a property of `transportRel`
   relevant to whoever eventually proves `(HALL)`, not to WID or the two flow
   companions, which only use `transportRel` as an uninterpreted relation
   between two independent-set layers.
2. **`activeWeight` differs from `#(F ∩ B)` exactly as required.** The Lean
   `def` is `((F ∩ B).filter fun v => ¬ Disjoint (B.erase v) (tagWitnesses G
   v)).card` — the `.filter` clause is the entire fix for the two struck
   predecessor errors (C6-F5, C6-U5). A seat or reviewer can `#print` this
   definition and see directly that a favorable leaf merely present in `B`
   (`v ∈ F ∩ B`) is not counted unless its witness condition holds.
3. **`theorem`/`lemma` keyword deviation.** `SOLUTION-CONTRACT.md` §2 marks
   `layerWeight_sub_eq_sum` as a `lemma` (a companion, no certificate of its
   own) and `activeWeightAggregateIdentity` as the `theorem` (the terminal,
   certificate-bearing statement). This route's Lean text declares
   `layerWeight_sub_eq_sum` with the `theorem` keyword instead of `lemma` —
   Lean treats the two keywords identically (no semantic difference; this is
   a documentation convention only), but it is a literal deviation from the
   contract's draft text and should be corrected to `lemma` before Stage 7
   registration, purely for readability of the award's face.
4. **Entries not minted through the VerityOS Lean Formalization skill.** The
   45 carried entries carry `-- VERITYOS ENTRY N BEGIN/END` markers with
   per-fragment SHA-256 digests, generated by a tool this route was not asked
   to invoke and does not have standing to invoke on its own initiative. The
   18 new `E993Transport` declarations are therefore plain, unmarked Lean
   source appended after entry 45. If the controller's Stage 7 workflow wants
   entries 46+ with the same fragment-digest apparatus, it will need to run
   that skill over `scratchpad/c1-U2/drafts/e993transport_part{1..5}.lean` (or
   the assembled `Main.lean`) itself; I have not fabricated entry numbers or
   digests for this content.
5. **No `native_decide`, no `decide` over an enumeration for a universal
   step, no `axiom`, no `admit`.** Confirmed by grep and by the `#print
   axioms` table above (only the three permitted axioms appear anywhere).
6. **ℕ-subtraction guards.** Every `p - 1` in this route's code is guarded by
   `hp : 1 ≤ p` (threaded from `layerWeight_sub_eq_sum` down to
   `activeWeightAggregateIdentity`, `aggregate_nonpos_of_saturatingFlow`); the
   one internal `j - 1` (inside `card_active_eq_tagged`) is guarded by
   `hj : 1 ≤ j`, which is instantiated at call sites only with `j = p` or
   `j = p + 1` under `hp : 1 ≤ p`. `omega` discharges every resulting
   arithmetic identity (`p - 1 + 1 = p`, `p + 1 - 1 = p`) explicitly, never
   silently via `simp`.

## Not applicable to this route (stated explicitly, not silently skipped)

- **No numeric claims, no generator, no census, no table.** This route
  produces zero integers, zero trees, zero flows-on-instances. The two
  "numeric" facts reported (the seal match and the nine digest matches) are
  the only computations, and both are re-verified below with a
  copy-out-first replay.
- **No acyclicity-and-connectivity test in code**, because no object in this
  route's code is ever asserted to be a tree. `IsTree` appears nowhere in the
  code this route wrote (see derivation step 1); the one theorem that
  *would* need `IsTree` (`lowerRegionTwoForOneWeightedHall`) was deliberately
  not stated.
- **No `x`, `Δ_k` table rows**, for the same reason.
- **No background jobs were started**, so none needed to be finished or
  killed; every `lake build` / `lake env lean` invocation ran in the
  foreground via a blocking shell call and returned before the next command
  was issued.

## Replays

Both under `scratchpad/c1-U2-replay/` (never `/tmp`, never a session
scratchpad, never in place):

1. **Seal + digest replay** (deterministic, standard library only):
   ```
   cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-U2-replay
   python3 verify_seal_and_digests.py
   ```
   Output reproduced verbatim in `verify_output.txt` this session
   (sha256 of that output file: `1a02b4ff684c93656da96a133d0900e4d3c53f9e1aabb8e33d7bd4867a6d6eec`);
   final line `ALL CHECKS PASS: True`.
2. **Lean rebuild replay** (copy-out-first: copies the frozen source
   `Main.lean` plus this directory's five `e993transport_partN.lean` files
   into a fresh `rebuild/LeanProject/`, binds Mathlib by manual symlink,
   builds, and runs the same seven `#print axioms` checks):
   ```
   cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-U2-replay
   sh build_and_check.sh
   ```
   Reproduced this session in `full_replay_output.txt` (sha256
   `8d9372bd8b1c3b49614ebe16379a7184c1dcc5c1a2c0616ffa6f257e6cd1ab9b`; 0
   occurrences of the string `error`); confirms `NO SORRY`, the Mathlib
   revision match, `Build completed successfully (8657 jobs)`, and all seven
   `#print axioms` lines reading `[propext, Classical.choice, Quot.sound]`.
   Note: the rebuilt `Main.lean` under `rebuild/` has a different sha256
   (`bb018442662aee3485302b6d26ba61d4d5f87ec9031ea354c042f14016718279`, 1902
   lines vs. the working copy's 1901) than the working copy at
   `scratchpad/c1-U2/LeanProject/LeanProof/Main.lean` — this is a
   single-trailing-newline artifact of `cat`-concatenation order and is
   content-identical (both compile to the same declarations with identical
   `#print axioms` output); it is disclosed here rather than silently
   reconciled.

## `headline_resolved: no`

## Route verdict: `compiled`

Seven Lean declarations (one bijection lemma, one double-counting lemma, the
WID identity in general and specialized form, the FLOW⇒SIGN companion, a
generic clone-counting helper, and the HALL⇒FLOW companion) compile sorry-free
against the pinned Mathlib with only the three permitted axioms. Nothing here
is a theorem, proved_informal certificate, or bounded-computation record about
Erdős #993 itself — it is compiled scratch Lean text, standing ready for the
governed award workflow, and it neither proves nor refutes `(HALL)`.

## Model disclosure

Chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter,
matching the charter); runtime-reported model id: `claude-sonnet-5` (as
reported by this runtime's own system context; not independently re-queried
via a tool call, since no such tool was available in this route's grant).

## Remaining obligation (successor inheritance)

A successor (the Cycle 1 synthesis, or a later cycle's seat) inherits:

1. **A compiled, sorry-free candidate for the (WID) award** at
   `scratchpad/c1-U2/LeanProject/LeanProof/Main.lean` (entries 1–45 carried
   byte-identically, then 18 new `E993Transport` declarations), with a draft
   `THEOREM-CONTRACT.yaml`-style file at
   `scratchpad/c1-U2/THEOREM-CONTRACT-draft-WID.json`. The governed award
   workflow still needs to: run the VerityOS Lean Formalization skill over
   the new declarations to mint entry numbers 46+ with fragment digests;
   rename `layerWeight_sub_eq_sum` from `theorem` to `lemma` (fidelity note
   3); and formally register `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`
   as `formally_verified` only through that workflow, not from this return.
2. **A compiled, sorry-free HALL⇒FLOW companion**
   (`exists_saturatingFlow_of_weightedHall`) that is ready to consume, as
   soon as some route (T1/T2/F1/U1 or a later cycle) establishes
   `WeightedHall G F p` for an actual tree family — at that point this
   route's Lean text already produces the saturating flow and, via
   FLOW⇒SIGN, the sign bound on `S(G,p)` for that family, purely
   mechanically.
3. **The un-touched open object**: `(HALL)` itself
   (`lowerRegionTwoForOneWeightedHall`) has no Lean statement in this file
   and no proof attempt. Whoever proves it in Lean can append it directly to
   this same `E993Transport` namespace and immediately compose it with
   `exists_saturatingFlow_of_weightedHall`'s converse direction (informal:
   `WeightedHall` is *equivalent* to a saturating flow existing, by
   `SEMANTIC-CONTRACT.md` §1.2's "By max-flow/min-cut... a saturating
   integral flow exists iff (HALL-COND) holds" — only the ⇐ direction was
   formalized here; the ⇒ direction (flow ⇒ Hall-COND, needed if a future
   route wants to go from a *constructed* flow back to the Hall inequality)
   was not attempted and is a small, likely-mechanical companion gap.
4. **A fidelity item, not a mathematical gap**: the `theorem`/`lemma` keyword
   mismatch (note 3 above) and the missing skill-minted entry digests (note 4
   above) are both purely bureaucratic follow-ups, not open proof
   obligations.

No disclosures beyond the ones stated above (fidelity notes 1–6, the
replay-digest mismatch note, and the explicit "not applicable" section).
