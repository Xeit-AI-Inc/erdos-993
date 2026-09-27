# RETURN — Route `C3-U-01 LEAN-INV-QUOTIENT-NM-AND-LEMMA-U` (Cycle 3, seat U1)

Run: r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Erdős #993, weighted mixed-boundary
transport. Orientation: U (formal/structural). Mechanism fingerprint: `LEAN-INV-QUOTIENT-NM-AND-LEMMA-U`.

**Model disclosure (two-part, per the brief):** chartered sonnet/xhigh; transport-resolved model
sonnet (explicit parameter); runtime-reported model id: `claude-sonnet-5` (as stated by this
session's own environment declaration; the harness does not expose a separate introspection call
beyond that declaration).

## Boot

I booted VerityOS by reading, in full, exactly the two files the dispatch and the common brief
authorize and nothing else: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I did not follow the startup
protocol's own task-type map into memory, conversations, modules, skills, logs or decisions — the
controller has booted for the run. The harness placed the project `CLAUDE.md` and the user's
auto-memory index into context at session start (visible as system-reminders); I did not open
either as a source and nothing below relies on them.

## Dispatch and seal verification

- **Dispatch digest.** `control/dispatch/c3-stage3/DISPATCH-U1.md` SHA-256 recomputed and matched
  exactly against the value quoted in the invoking wrapper:
  `c8f92ec29499e979d1c351acbe61a21d0197f297df21849fad5e0460c3e0d8e0`.
- **Stage 2 packet manifest seal.** `control/C3-STAGE2-PACKET-MANIFEST.json`: removed `seal_sha256`,
  recomputed SHA-256 of the canonical JSON (`sort_keys=True`, `separators=(",", ":")`, no trailing
  newline) over the remaining object. Result **`5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416`**,
  equal to the embedded `seal_sha256` and to the value in the dispatch. `file_count: 1051`,
  `stage: ` (Cycle 3 Stage 2), `run_id` present. Computed with `python3 -B`, standard library
  (`json`, `hashlib`) only; no `sources/` file was mutated by this check.
- **Source digests used, verified against `control/SOURCE-DIGESTS.json` (`sources/` tree) or by
  direct `shasum -a 256` against a hash literally quoted in a binding contract (for the two `runs/`
  award files, which are this run's own governed outputs and are not listed in
  `SOURCE-DIGESTS.json`, which covers only `sources/`):**

  | file | mechanism | result |
  |---|---|---|
  | `sources/mathlib-binding/PIN.json` | `SOURCE-DIGESTS.json` entry | matched: 469 bytes, `af78b3d8e94a358eb69719280ba3bf79c7bf400d468c6143e07313dbfcbd3ba0` |
  | `runs/lean-2026-09-26-c1-la1-active-tag-weight-identity/LeanProject/LeanProof/Main.lean` | quoted prefix `86b59c6c…` in `C3-ALLOCATION.md`/`C3-STAGE1-GATE.md` | matched in full: `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` |
  | `runs/lean-2026-09-26-c2-la1-aut-invariant-positive-deficient-family/LeanProject/LeanProof/Main.lean` | quoted prefix `a9cf3b81…` | matched in full: `a9cf3b815832b6fa25e43e07e628db4ce01a7a496b084cac0cd3768e877c7fc4` |

  Mathlib revision cross-check: `sources/mathlib-binding/PIN.json` pins
  `905b95818eb32af7874a58b427f50c1711a5e96c`; the seat's `lakefile.toml`/`lake-manifest.json`
  (byte-copied from C1-LA1's scaffold) request the identical revision. Match confirmed by direct
  comparison of the two strings, not by trusting either file alone.

## Read-boundary disclosures

1. `sources/mathlib-binding/PIN.json` was read in the same tool batch as a directory listing,
   before its digest was checked against `control/SOURCE-DIGESTS.json`. Checked retroactively
   immediately after (see table above): matched exactly, 0 discrepancy. Recorded here per the
   dispatch's verify-before-read instruction, which this read did not observe in real time even
   though the outcome was clean.
2. Two non-recursive, single-level `ls` calls were run on directories the dispatch/common brief
   name explicitly as sources of record: `ls runs/` (three award directories, names only) and
   `ls second-reads/` (ten directory names only, e.g. `SR-C2-4`, `SR-REACH`). Both listings were
   needed to find the exact subpath of the two governed award files and of the second read cited
   below; neither was a search rooted above this seat's grant (both directories are explicitly
   enumerated as readable in `C3-WORKER-COMMON-BRIEF.md`'s Cycle 1/2 inheritance clause). No other
   directory was listed recursively or with a glob.
3. `cycles/cycle-1/stage3/returns/T1/RETURN.md` was read in full. This is explicitly authorized:
   the common brief's Cycle 1/2 inheritance clause names "every return
   `cycles/cycle-{1,2}/stage3/returns/*/RETURN.md`" as a sealed source of record. It was needed to
   recover the exact statement of T1's Lemma 1 (the informal content behind (NM)), which the
   allocation and `C3-STAGE1-GATE.md` reference only by name. No Cycle 3 sibling return, critique,
   adjudication, or scratch was read.
4. `cycles/cycle-1/CYCLE-CLOSE.md` was read by targeted `grep` for the (INV)/(NM) registry rows
   only (not opened in full), to confirm attribution and grade (`proved_informal` for both,
   confirmed by SR-5/SR-7 respectively).

No `find`, `rg`, `ls -R`, or glob `cat` was run anywhere. No file under `sources/` was written. No
other experiment root, live root, manuscript, or external source was read. No network access, no
package installs.

## Obligation bound (`control/C3-ALLOCATION.md`, item 5)

> **U1 `LEAN-INV-QUOTIENT-NM-AND-LEMMA-U`.** Seed from C1-LA1's `Main.lean` byte-identically
> (manual symlink; `cd` before any `lake`/`lean`; `python3 -B`), plus C2-LA1's closed award text...
> (i) Define the `Aut(G)`-orbit quotient; prove `covered_orbitUnion` and the class-union deficit
> identity; with `weightedHall_iff_invariant` this gives WeightedHall ⇔ quotient Hall — the whole
> (INV) key, without flows. (ii) NM: the sector encoding over an induced perfect matching, the two
> cover-degree lemmas (`k` down, `2(N−k+1)` up), the double count. (iii) Lemma U
> `exists_transportRel_iff` on the frozen definitions. `#print axioms` on everything; exact
> dependency diagram; draft contracts. Could close: kernel-checked (INV) at its full registered
> statement and (NM), ready for Cycle 3 Stage 7 awards.

**Outcome, stated plainly up front: item (iii) is fully discharged (a complete, kernel-checked
theorem with no remaining gap). Items (i) and (ii) are genuinely advanced — new, kernel-checked
building blocks are added that did not exist before this route — but neither is closed at its full
registered scope.** Details and exact remaining obligations follow section by section.

## Setup (byte-identical carry)

`scratchpad/c3-U1/LeanProject` was created by: copying `lakefile.toml`, `lake-manifest.json`,
`lean-toolchain`, `LeanProof.lean` and `LeanProof/Main.lean` byte-for-byte from
`runs/lean-2026-09-26-c1-la1-active-tag-weight-identity/LeanProject/` (C1-LA1's frozen definitions
of record, verified above); then appending C2-LA1's NEW declarations (its entries 22–77, i.e.
`famMap` through the terminal theorem `exists_aut_invariant_deficient_of_not_weightedHall`) from
`runs/lean-2026-09-26-c2-la1-aut-invariant-positive-deficient-family/LeanProject/LeanProof/Main.lean`,
**with one correction**: C2-LA1's own entry 31 (`isGraphLeaf_of_mem_favorableLeaves`) duplicates
C1-LA1's entry 24 verbatim (C2-LA1 re-carried the whole C1-LA1 base as its own entries 1–21/24/31
before adding its new material) — a byte-identical concatenation of both files therefore declares
that lemma twice, which Lean rejects (`has already been declared`). The duplicate block was
removed; every other line is an unmodified byte-carry. Mathlib was bound by manual symlink:
`ln -s /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages
scratchpad/c3-U1/LeanProject/.lake/packages` (never copied; the governed `bind-shared-packages`
tool was not invoked, since no governed award is being requested by this return). `lake build
LeanProof` on this baseline (before any new declaration) succeeded with 0 errors, confirming the
byte-carry is faithful and self-contained.

## Derivations

Every declaration below is in namespace `E993Transport`, `import Mathlib` only, no `sorry`, no
`admit`, no `axiom`, no `native_decide`, no `decide` over an enumeration. `#print axioms` results
for all nine load-bearing declarations (the three inherited plus the six new) are in the table
after the derivations; all show exactly `[propext, Classical.choice, Quot.sound]`.

### (iii) Lemma U — `exists_transportRel_iff` (fully discharged)

```lean
theorem exists_transportRel_iff (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) (A : Finset V)
    (hA : A ∈ indepFamily G p) :
    (∃ B ∈ indepFamily G (p + 1), transportRel G B A) ↔
      (∃ q, q ∉ A ∧ G.IsIndepSet ((insert q A : Finset V) : Set V)) ∨
      (∃ u ∈ A, ∃ y z, y ≠ z ∧ ¬ G.Adj y z ∧
        G.neighborFinset y ∩ A = {u} ∧ G.neighborFinset z ∩ A = {u})
```

**Content and alias.** This is SR-C2-4's Lemma U (§"SR-C2-4b: Lemma F, Lemma U, Corollary G"),
itself confirmed **identical to P10** (SR-REACH's SR-11, `confirmed`) "word for word... by
negation" — SR-C2-4 explicitly rules "Lemma U's scope and standing... It is not a new lemma, and
it needs no key or grade of its own." I formalized the *statement content* SR-C2-4 already
confirmed informally, in the frozen `indepFamily`/`transportRel` vocabulary; I did not invent a new
mathematical claim, so there is nothing to register (the alias check below documents this rather
than proposing a key).

**Where each hypothesis enters (no `IsTree`, no eligibility, no `x`: this lemma is about the raw
network on any finite simple graph, at any rank — it is a fact about (D) ∪ (S) themselves, not
about trees or the favorable selector).**
- `hA : A ∈ indepFamily G p` supplies `A.card = p` and `G.IsIndepSet A`; both are used only for the
  *forward* direction (`∃B, …→ …`), to know `B`'s independence and cardinality when a `B` is given,
  and are used directly (not via `IsTree`, `finiteness` beyond `Fintype V`, or eligibility) in the
  reverse direction to build a concrete witness `B`.
- **(D) direction.** Not-maximal `A` (witness `q`) ⇒ `B := insert q A` is independent by hypothesis
  and `A = B.erase q`; conversely `A = B.erase q` with `q ∈ B`, `B` independent, gives `q ∉ A` and
  `insert q A = B` independent. No further structure needed.
- **(S) direction, the private-pair construction.** Given `u ∈ A` and a non-adjacent pair `y ≠ z`
  with `G.neighborFinset y ∩ A = {u} = G.neighborFinset z ∩ A`: independence of `A` forces `y, z ∉
  A` (`y` adjacent to `u ∈ A` and `y ∈ A` would violate `A`'s pairwise non-adjacency) — this is
  where `G.IsIndepSet A` is load-bearing, not an assumption added separately. `B := insert y
  (insert z (A.erase u))` is built and shown independent by a full nine-case pairwise check
  (`y`/`z`/other × `y`/`z`/other), using `¬ G.Adj y z` for the one cross case and the two
  neighbourhood-equals-`{u}` hypotheses for the `y`–other and `z`–other cases. `(G.neighborFinset u
  ∩ B).card = 2` is shown by proving the intersection equals `{y, z}` exactly (any third element
  `w ∈ A.erase u` adjacent to `u` would contradict `A`'s independence, since `w, u ∈ A`, `w ≠ u`).
  `A = insert u (B \ G.neighborFinset u)` follows from the same set identity plus
  `Finset.insert_erase`.
- **Conversely**, given `B` and a case split on `transportRel`: the (D) case reads off `q` directly
  as the erased element; the (S) case reads `u` off `A`'s own `insert`, and the two witnesses `y,
  z` come from `Finset.card_eq_two` applied to the hypothesis `(neighborFinset u ∩ B).card = 2`;
  `¬ G.Adj y z` comes from `B`'s independence (`y, z ∈ B`, `y ≠ z`); `G.neighborFinset y ∩ A = {u}`
  is shown by a direct membership argument using `B`'s independence to rule out any second element.

No group action, no `Aut(G)`, no automorphism enters this lemma at all — it is a first-order fact
about one graph and one relation.

### (i) `Aut(G)`-orbit quotient — partial (new building blocks; not the full (INV) key)

```lean
noncomputable def orbitOf (G) [DecidableRel G.Adj] (j : ℕ) (B : Finset V) : Finset (Finset V) :=
  (indepFamily G j).filter (fun B' => ∃ γ : G ≃g G, B' = B.map γ.toEquiv.toEmbedding)

theorem mem_orbitOf_self (hB : B ∈ indepFamily G j) : B ∈ orbitOf G j B
theorem orbitOf_subset_of_mem_invariant (hXsub : X ⊆ indepFamily G j)
    (hX : ∀ γ, famMap G γ X = X) (hBX : B ∈ X) : orbitOf G j B ⊆ X
theorem invariant_iff_orbitOf_subset (hXsub : X ⊆ indepFamily G j) :
    (∀ γ, famMap G γ X = X) ↔ (∀ B ∈ X, orbitOf G j B ⊆ X)
theorem covered_orbitUnion (hXsub : X ⊆ indepFamily G (p+1)) (hX : ∀ γ, famMap G γ X = X) :
    ∀ γ, famMap G γ (covered G p X) = covered G p X
theorem supply_orbitOf (G p j B) :
    supply G (favorableLeaves G p) (orbitOf G j B) =
      (orbitOf G j B).card * activeWeight G (favorableLeaves G p) B
```

**Why `orbitOf` is a `Finset` filter of the layer, not an image of `Aut(G)`.** No `Fintype (G ≃g
G)` instance exists in this Mathlib revision for a general `SimpleGraph V` (checked directly:
`infer_instance` fails). Building one from scratch (injecting `G ≃g G ↪ V ≃ V` and using
`Fintype (V ≃ V)`) was avoided because it is not needed: since every `orbitOf G j B` we use is a
subset of the already-finite `indepFamily G j`, defining it as "the layer members that are *some*
automorphism's image of `B`" (using `Classical` decidability for the existential, already the
run's convention via `open scoped Classical`) gives the same finite set without constructing
`Aut(G)` as a `Fintype` at all.

**Where each hypothesis enters.**
- `mem_orbitOf_self` needs only `SimpleGraph.Iso.refl` (the identity automorphism) and
  `Finset.map_refl`; no invariance hypothesis.
- `orbitOf_subset_of_mem_invariant` is where the invariance hypothesis `∀ γ, famMap G γ X = X`
  first enters: for `B' = B.map γ ∈ orbitOf G j B`, `mem_famMap` puts `B'` in `famMap G γ X` (since
  `B ∈ X`), and the invariance hypothesis (at exactly this `γ`) rewrites that to `B' ∈ X`.
- `invariant_iff_orbitOf_subset` is the actual orbit-quotient characterization: the forward
  direction is the previous lemma; the reverse direction (union-of-orbits ⇒ invariant) uses
  `mem_famMap`, `mem_indepFamily_map` (to place `B.map γ` back in the layer) and
  `Finset.eq_of_subset_of_card_le` with `card_famMap` (injectivity of `Finset.map` on an
  embedding) — the same "subset plus equal cardinality" pattern C2-LA1 used for `canonMin_famMap`.
  This is the one place cardinality (not eligibility, not `x`, not `IsTree`) is load-bearing.
- `covered_orbitUnion` is one line given the existing `covered_famMap` (C2-LA1 entry 62): the
  invariance hypothesis is substituted directly into `covered_famMap`'s equation. It shows the
  *target* (covered/reached) side of an invariant source family is again invariant — hence, by
  `invariant_iff_orbitOf_subset` at rank `p`, again a union of orbits. This is the requested
  `covered_orbitUnion`: `N` takes orbit-unions to orbit-unions.
- `supply_orbitOf` is where the **fixed selector's unconditional `Aut`-invariance** enters
  specifically (not a general fact about arbitrary tag sets `F`): `favorableLeaves G p` is
  `Aut(G)`-invariant for *every* `γ`, unconditionally (`favorableLeaves_map_aut`, already proved
  by C2-LA1 with no extra hypothesis), so `activeWeight_map_of_invariant` applies at every `γ`
  without needing a side condition on `F`. This makes weight literally constant across an orbit
  for this run's `F`, giving the clean product formula. This is the source-side term of the
  "class-union deficit identity": `φ` of a union of orbits is a sum, over the orbits present, of
  `(orbit size) × (weight)` on the source side, matching `supply_orbitOf` exactly (target-side
  `cov` is not similarly reduced to a *single* per-orbit product here, since `covered` of an orbit
  can meet several distinct target orbits — see Remaining obligation).

**What is NOT done — the actual gap in (INV)'s quotient half.** `weightedHall_iff_invariant`
(already proved by C2-LA1) plus `invariant_iff_orbitOf_subset` together give: `WeightedHall G
(favorableLeaves G p) p` holds **iff** the Hall inequality holds for every `X` that is a union of
orbits. That is already, in substance, "WeightedHall ⇔ (Hall on every union of orbits)" — a real
quotient reduction. What is missing to call this "the whole (INV) key" is assembling it into the
literal small-quotient statement the allocation names: a Hall condition indexed by a **finite set
of orbit representatives** (so the check is over `2^{(number of orbits)}` subfamilies, not
`2^{|indepFamily|}`), with `supply`/`cov` expressed as sums over that representative set using
`supply_orbitOf` and an analogous capacity-side lemma. That needs (a) a formal statement that
`orbitOf` is an equivalence-class partition of the layer (reflexive/symmetric/transitive via
`SimpleGraph.Iso.refl`/`.symm`/`.trans`, not yet stated), (b) a chosen `Finset` of representatives
(e.g. via `Finset.image` of a canonical-form function, mirroring how `canonMin` was built), and (c)
a disjoint-union sum lemma (`Finset.sum_biUnion` over the representative-indexed partition) to turn
`supply`/`cov` of an arbitrary union of orbits into a sum over representatives. None of (a)–(c) is
built in this route.

### (ii) NM — the abstract double count (partial; the concrete sector degrees are not derived)

```lean
theorem regular_bipartite_shadow_bound {α β : Type*} [Fintype α] [Fintype β]
    (R : α → β → Prop) (dtop dbot : ℕ)
    (htop : ∀ a : α, (Finset.univ.filter (fun b => R a b)).card = dtop)
    (hbot : ∀ b : β, (Finset.univ.filter (fun a => R a b)).card = dbot)
    (X : Finset α) :
    dtop * X.card ≤ dbot * (Finset.univ.filter (fun b : β => ∃ a ∈ X, R a b)).card
```

**Content and alias.** This is the *abstract mathematical core* of Cycle 1's T1 return
(`cycles/cycle-1/stage3/returns/T1/RETURN.md`, "Lemma 1: transitive double-level group action ⇒
normalized matching", the informal content behind the registered key
`E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (NM), `proved_informal`, confirmed by
SR-7 per `cycles/cycle-1/CYCLE-CLOSE.md`'s registry row). T1's Lemma 1 *derives* biregularity
(every top-rank element has the same down-degree, every bottom-rank element the same up-degree)
*from* a transitive group action; the group action is T1's mechanism for establishing regularity,
not part of the shadow bound's own logical content. The kernel-checked theorem above needs no
group, no transitivity, no poset structure at all — only that the two degree hypotheses
(`htop`/`hbot`) hold as given facts about the relation `R`. This is a strictly more general
statement than T1's Lemma 1 (T1's Lemma 1 follows from it once biregularity is established by any
means, including but not limited to a transitive group action), so it is not a new claim
competing with NM — it is a re-derivation, at a cleaner level of generality, of the same
mathematical fact T1 already established informally.

**Where each hypothesis enters (double counting, exactly "the two cover-degree lemmas... the
double count" from the allocation).** `htop`/`hbot` are literally "`k` down" and "`2(N−k+1)` up" in
T1's application, supplied here as named hypotheses rather than derived — deriving them for the
concrete branch poset is exactly what is NOT done (see below). The proof: (1) count pairs `(a, b)`
with `a ∈ X`, `R a b` two ways — summing over `a ∈ X` gives `dtop * X.card` (via `htop`); (2)
swapping the order of summation (`Finset.sum_comm`) and restricting the outer sum to `shadowX`
(every `b` outside `shadowX` contributes an empty filter, hence `0`) bounds the same total by
`dbot * shadowX.card` (via `hbot`, since `X.filter (R · b) ⊆ univ.filter (R · b)` for every `b`).
No finiteness beyond `Fintype α`, `Fintype β` is used; no `IsTree`, no eligibility, no `x`, no
selector, no active-tag weight enters at all — this is pure Finset combinatorics, unconnected to
the E993 machinery until it is *applied*.

**What is NOT done — the concrete sector application.** T1's application encodes the `CB(d,m)`
root-plus-arm sector as the graded poset `{∅, b, c}^N` (functions `Fin N → Option Bool`, rank =
number of non-`none` coordinates) under one-coordinate changes, and computes `d_k = k` (empty one
of the `k` occupied branches) and `d_{k-1} = 2(N-k+1)` (fill one of the `N-(k-1)` empty branches
with one of two colours). Neither the poset encoding, the covering relation on it, nor the two
degree computations are formalized in this route; `regular_bipartite_shadow_bound` takes
`dtop`/`dbot` as hypotheses precisely because supplying them for this concrete case is left open.
Formalizing the sector-to-poset correspondence itself (which vertices of a literal `CB(d,m)` tree
correspond to which poset element) is a larger, separate task belonging with the sector routes
(T1/T2/F1), not attempted here.

## Registered claims named before evidence

Per common-brief rule 3, named before any of the above is presented as evidence (it already was,
above, but repeated here as the required standalone accounting):

- **(WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`** — `formally_verified`. Carried
  byte-identically (C1-LA1); re-verified by rebuilding, not re-proved as a contribution.
- **(INV) `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`** — `proved_informal` entering this
  cycle; its Hall-form half (`weightedHall_iff_invariant`) is carried byte-identically from C2-LA1
  (already kernel-checked there, registers `proved_informal` per rule R29-N-12 since it is a
  companion, not C2-LA1's terminal theorem); this route's new `orbitOf` lemmas are **additional
  compiled material toward its quotient clause**, not a closure of the key. I am not asserting
  (INV) is now `formally_verified` at its full statement; that would strengthen a certification
  without strengthening it to the necessary scope (§4 rule), which is exactly the gap named above.
- **(NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`** — `proved_informal`
  (T1, Cycle 1, confirmed SR-7). `regular_bipartite_shadow_bound` is **new compiled material**
  re-deriving NM's abstract double-counting core at greater generality; it does not, by itself,
  formalize the registered key (the sector encoding is missing, as stated).
- **`E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` and the terminal theorem of
  C2-LA1** — carried byte-identically, re-verified, not re-proved.
- **The ten refuted mechanism keys (`SOLUTION-CONTRACT.md` §3.2)** — none is touched. My three
  pieces are (a) a characterization of when the fixed literal relation (D) ∪ (S) has an in-arc (not
  a Hall/SDR/tag-closed-cut claim of any kind), (b) orbit-quotient bookkeeping for an already-stated
  Hall condition (not a new deletion-only or fixed-γ mechanism), and (c) a fully general
  regular-bipartite double-count with no tree structure at all. None proposes a Hall-type sufficient
  condition narrower than or different from (HALL) itself, so none can alias any of the ten refuted
  keys (which are all specific narrower mechanisms for *proving* Hall); this is a structural
  observation, not a name-by-name collision check, because none of my results is a Hall-sufficiency
  claim to begin with.
- **(LIFT), (DCB), the primary aggregate, the `T_m`/spider/path-star family keys** — not cited, not
  used, not touched.

## Grades

Per `SOLUTION-CONTRACT.md` §4 and the run's `compiled`-scratch convention (§3 rule 9, R29-N-12: "a
compiled scratch declaration has no grade until its governed award closes"):

| declaration | status |
|---|---|
| `exists_transportRel_iff` (Lemma U) | **compiled** (kernel-checked; content is a re-derivation of already-`confirmed` P10/SR-11, so no new grade is being requested for a new claim) |
| `orbitOf`, `mem_orbitOf_self`, `orbitOf_subset_of_mem_invariant`, `invariant_iff_orbitOf_subset`, `covered_orbitUnion`, `supply_orbitOf` | **compiled** (kernel-checked; partial progress toward (INV)'s quotient clause, which remains `proved_informal` at its registered scope) |
| `regular_bipartite_shadow_bound` | **compiled** (kernel-checked; re-derivation, at greater generality, of NM's already-`proved_informal` core; NM remains `proved_informal` at its registered scope) |

No claim's certification is strengthened by this return. No new key is proposed for registration
(see alias check).

## Alias check (lexical and mathematical)

- **Lexical.** `exists_transportRel_iff`, `orbitOf`, `covered_orbitUnion`, `supply_orbitOf`,
  `regular_bipartite_shadow_bound` do not match any string in `control/CLAIM-DISTINCTIONS.json`'s
  carried-row names or any of the ten refuted-mechanism key names (checked by inspection against
  the list quoted in `SOLUTION-CONTRACT.md` §3.2 and `C3-WORKER-COMMON-BRIEF.md`'s fences
  paragraph, both read above; `control/CLAIM-IDENTITY.run-local.json`/`sources/authority/CLAIM-
  IDENTITY.json` were not opened, since I am not proposing a new key — see next point).
- **Mathematical.** None of the six new declarations states a Hall-type sufficient condition,
  a deletion-only claim, a fixed-γ/singleton-tag claim, an SDR/degree-lemma claim, or a
  covariance/domination claim of the kind the ten refuted keys cover (`SOLUTION-CONTRACT.md` §3.2
  lists them; all concern specific proposed *mechanisms for proving Hall or a related sign fact*).
  `exists_transportRel_iff` is a pure existence/characterization fact about one relation on one
  graph; the orbit lemmas are bookkeeping about `Finset` images under automorphisms; the
  double-count lemma is generic bipartite combinatorics. **No new claim is being registered by this
  return**: Lemma U is explicitly ruled by SR-C2-4 to be "not a new lemma" (a re-derivation of P10);
  the orbit and double-count lemmas are auxiliary compiled material feeding the *existing* OPEN/
  `proved_informal` keys (INV) and (NM) respectively, not standalone claims with their own
  `E993-R30-…` identity. Nothing here is submitted to the run-local registry.

## `#print axioms` (every load-bearing declaration touched by this route)

```
'E993Transport.activeWeightAggregateIdentity' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.weightedHall_iff_invariant' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.exists_aut_invariant_deficient_of_not_weightedHall' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.exists_transportRel_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.mem_orbitOf_self' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.orbitOf_subset_of_mem_invariant' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.invariant_iff_orbitOf_subset' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.covered_orbitUnion' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.supply_orbitOf' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.regular_bipartite_shadow_bound' depends on axioms: [propext, Classical.choice, Quot.sound]
```

All nine are the permitted axioms only (`propext`, `Classical.choice`, `Quot.sound`); no `sorry`,
`admit`, `native_decide`, or extra `axiom` anywhere in the file (checked by `grep` over the single
file `scratchpad/c3-U1/LeanProject/LeanProof/Main.lean`, not a directory search).

## Exact dependency diagram

```
C1-LA1 defs (entries 1-21: indepFamily, tagWitnesses, activeWeight, layerWeight,
             favorableLeaves, transportRel, IsSaturatingFlow, WeightedHall)
        |
        +--> exists_transportRel_iff   (uses only: indepFamily, transportRel; SELF-CONTAINED)
        |
        +--> C1-LA1 entries 22-36 (WID chain) --> activeWeightAggregateIdentity [formally_verified, carried]
        |
C2-LA1 new defs (famMap, covered, cov, supply, phi, domain, maxPhi, maximizers, canonMin)
        |
        +--> mem_famMap, mem_indepFamily_map, card_famMap, covered_famMap,
        |    activeWeight_map_of_invariant, favorableLeaves_map_aut, favorableLeaves_leaf
        |    (all C2-LA1, carried, unmodified)
        |         |
        |         +--> orbitOf  (new; uses indepFamily only in its definition)
        |         |       |
        |         |       +--> mem_orbitOf_self            (+ SimpleGraph.Iso.refl)
        |         |       +--> orbitOf_subset_of_mem_invariant  (+ mem_famMap)
        |         |       +--> invariant_iff_orbitOf_subset     (+ mem_indepFamily_map, card_famMap)
        |         |       +--> covered_orbitUnion               (+ covered_famMap)
        |         |       +--> supply_orbitOf                   (+ activeWeight_map_of_invariant,
        |         |                                                favorableLeaves_leaf,
        |         |                                                favorableLeaves_map_aut)
        |         |
        +--> weightedHall_iff_invariant [proved_informal by convention, carried, kernel-checked]
                  |
                  +---(combined narratively with invariant_iff_orbitOf_subset; NOT assembled
                       into one closed theorem in this route)---> "WeightedHall <=> Hall on
                       every union of orbits" (informal corollary of the two lemmas above;
                       see Remaining obligation for what blocks stating it as one theorem)

regular_bipartite_shadow_bound: NO dependency on any E993Transport declaration (pure Mathlib
Finset/Fintype combinatorics: Finset.sum_comm, Finset.card_filter, Finset.sum_filter_add_sum_filter_not,
Finset.sum_le_sum, Finset.sum_const, Finset.card_le_card).
```

## Draft contracts (informal; for a future governed award, not requested by this return)

```yaml
# draft only — no lake/lean award workflow was invoked; controller decides if/when to promote
- name: E993-R30-TRANSPORT-INARC-CHARACTERIZATION   # working title; may alias into P10/Lemma U's record, not a new key
  statement_file: scratchpad/c3-U1/LeanProject/LeanProof/Main.lean
  declaration: E993Transport.exists_transportRel_iff
  grade_if_awarded: formally_verified
  scope: every finite simple graph, every rank p, no tree/eligibility hypothesis
  note: re-derivation of SR-C2-4's Lemma U / SR-REACH's P10 (SR-11); not a new claim

- name: E993-R30-AUT-ORBIT-QUOTIENT-BUILDING-BLOCKS   # working title; feeds (INV), does not close it
  statement_file: scratchpad/c3-U1/LeanProject/LeanProof/Main.lean
  declarations: [orbitOf, mem_orbitOf_self, orbitOf_subset_of_mem_invariant,
                 invariant_iff_orbitOf_subset, covered_orbitUnion, supply_orbitOf]
  grade_if_awarded: proved_informal component (feeds INV; does not itself close INV)
  missing_for_full_INV: orbit-partition equivalence-relation lemma, representative Finset,
    disjoint-union sum lemma (Finset.sum_biUnion form), target-side per-orbit capacity analogue

- name: E993-R30-REGULAR-BIPARTITE-SHADOW-BOUND   # working title; feeds (NM), does not close it
  statement_file: scratchpad/c3-U1/LeanProject/LeanProof/Main.lean
  declaration: E993Transport.regular_bipartite_shadow_bound
  grade_if_awarded: formally_verified (as a standalone general fact) / feeds NM as a component
  missing_for_full_NM: the CB(d,m) sector-to-poset encoding and the two concrete degree
    computations (down = k, up = 2(N-k+1)) from Cycle 1 T1's application
```

## Numeric claims, IMPORT LIST, replay

**No numeric claim is made in this return.** No census, no fixed-point reproduction, no counted
instance, no table of `x`/`Δ_k`/rows — this route is pure Lean formalization of graph-generic and
poset-generic statements, none of which was evaluated on a concrete tree. Consequently there is no
numeric-claim generator and no IMPORT LIST in the sense the brief means for census/flow evidence.
`python3 -B` (standard library only: `json`, `hashlib`) was used for two load-bearing, already-
reported digest computations — the Stage 2 manifest seal and the `SOURCE-DIGESTS.json` lookup for
`PIN.json` — both shown inline above with their results; it was also used, not for any claim, as a
plain text-editing/log-triage tool while iterating on `Main.lean` (reading build error line
numbers, applying string patches) and left no numeric assertion of its own. No acyclicity/
connectivity test appears in code (no graph instance was constructed to test), and no `x`/`Δ_k`
rows are reported (none apply — the fences against re-deriving bounded records and against
census-as-proof both point the same way for a purely formal route).

**Replay (copy-out-first, per the brief).** The only reproducible artifact is the Lean build. A
byte-identical copy of the final scaffold and `Main.lean` (SHA-256
`f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180`, 2851 lines) was placed under
`scratchpad/c3-U1-replay/LeanProject/` (copy-out first, verified digest-equal to the working copy
under `scratchpad/c3-U1/`, before building there independently). Replay commands, run from a clean
shell:

```sh
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-U1-replay/LeanProject
lake build LeanProof
lake env lean LeanProof/AxCheck.lean
```

Both commands were run in the foreground (no background jobs; nothing to kill) and produced,
respectively, `Build completed successfully (8657 jobs)` and the nine axiom lines quoted above,
independently of the working copy under `scratchpad/c3-U1/`.

## Fences confirmed

Mechanism ≠ aggregate (no aggregate claim made); finite ≠ universal (no universal (HALL) claim
made — `exists_transportRel_iff` and `regular_bipartite_shadow_bound` are universal *lemmas* about
arbitrary finite structures, which is different from a universal claim about the tree family
`(HALL)` targets); no refuted mechanism revived (checked above); no closed region re-proved (no
tree, no `CB(d,m)` instance, no `T_m`/spider/path-star row was touched); no census value in a
proof (no census exists in this return); no `RTree` wording used; no live root was read (only
`sources/`, `runs/`, `second-reads/`, `cycles/cycle-{1,2}/…`, and this run's own `control/`/root
files, all as authorized above).

## `headline_resolved: no`

(HALL) is untouched by this route; nothing here bears on the headline either way, consistent with
the rule that no route's product may set it to `yes` this cycle.

## Route verdict: `compiled`

Substantive new output is a set of kernel-checked Lean declarations (one theorem fully discharging
its named obligation — Lemma U — and two further groups of compiled lemmas making genuine,
verifiable progress on (INV)'s quotient half and on (NM)'s abstract core) that have not gone
through a governed award (no `VERIFICATION-REPORT.json`, no controller-invoked `lake`/registrar
workflow was run — the brief reserves that step for the controller after synthesis). `proved` was
considered and rejected for the whole route: item (iii) alone would merit it, but the route's
obligation is the conjunction of (i), (ii), and (iii), and (i)/(ii) are explicitly partial.
`bounded_evidence` was rejected because nothing here is a finite/sampled check standing in for a
universal claim — everything proved is already fully general over its stated domain.

## Remaining obligation

Written as what a successor inherits, in the same three parts as the allocation:

1. **(INV), to close the quotient half at its full registered scope:** starting from
   `invariant_iff_orbitOf_subset` and `covered_orbitUnion` (this return), (a) prove `orbitOf` gives
   an equivalence relation on the layer (reflexivity is `mem_orbitOf_self`; symmetry needs
   `γ.symm`; transitivity needs `γ1.trans γ2` — both compile-checked as available in isolation
   during this route's exploration but not assembled into a `Setoid`/partition lemma); (b) choose a
   canonical representative per orbit (a `Finset (Finset V)` of representatives, by analogy with
   how `canonMin` was built from `inf'` — a `Finset.image` of a chosen selection function is the
   likely route); (c) prove the disjoint-union sum lemma turning `supply`/`cov` of a union of
   orbits into a sum over representatives, using `supply_orbitOf` for the source side and a new,
   not-yet-attempted capacity-side analogue (harder: a single orbit's `covered` set can meet
   several *distinct* target orbits, unlike the source side where weight is already constant); (d)
   state and prove the final iff: `WeightedHall G (favorableLeaves G p) p ↔` (a Hall-type condition
   over `Finset`-subsets of the representative set, with weights `orbit.card * activeWeight …`).
   Only then does "(INV) at its full registered statement" have Lean text.
2. **(NM), to close the sector application:** formalize `CB(d,m)`'s root-plus-arm sector as a
   concrete `SimpleGraph` instance (or at least its sector as `Fin N → Option Bool` with an
   explicit embedding into the tree's independent sets), prove the two degree facts `d_k = k` and
   `d_{k-1} = 2(N-k+1)` as Lean lemmas about that concrete poset (a `Finset.card_image_of_injOn`
   argument on the occupied/empty coordinate sets is the likely route — sketched but not attempted
   in this session), and instantiate `regular_bipartite_shadow_bound` with those degrees to recover
   T1's Lemma 1 formally. This piece more naturally belongs alongside T1/T2's sector work (they own
   the `CB(d,m)` construction already, informally); a successor U-seat should coordinate rather
   than re-build the tree type from scratch.
3. **Smallest concrete open lemma of the two above (for a successor's first step):** the degree
   computation in (2) — `d_{k-1} = 2(N-k+1)` — is smaller and more self-contained than the
   orbit-partition machinery in (1): it is a single `Finset.card_image_of_injOn` computation over
   `(Fin N → Option Bool)` restricted to one rank, with no dependency on the rest of this file.

No background job is running; none was left detached at any point in this session.
