# RETURN — Route U1, Cycle 4, r30 (correctly weighted mixed-boundary transport)

**Route ID:** `C4-U-01`. **Mechanism fingerprint:** `LEAN-GK-SIGN-AND-NM-ENCODING`. **Orientation:** U
(formal/structural). Chartered model/effort: Claude Sonnet 5, xhigh.

## Boot acknowledgment

VerityOS was booted for this seat by reading EXACTLY the two authorized files and nothing else, in
this order: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Per the dispatch and
`control/C4-WORKER-COMMON-BRIEF.md`, the startup protocol's own task-type map, and its pointers
into memory, conversations, modules, skills, logs and decisions, were **not** followed for this
seat (the controller has booted for the run).

Before opening the dispatch file, its digest was verified: SHA-256 of
`control/dispatch/c4-stage3/DISPATCH-U1.md` = `d3da827b1951d12f68cf29fbf8207c02a6b0ee3e65b8f08ac7e8328c750de135` — **matches** the wrapper's stated
digest exactly.

Model disclosure (two-part, on the face): chartered sonnet/xhigh; transport-resolved model sonnet
(explicit parameter); runtime-reported model id: `claude-sonnet-5` (per this session's own
environment disclosure: "You are powered by the model named Sonnet 5. The exact model ID is
claude-sonnet-5.").

## Read-boundary disclosure

1. **One non-recursive listing above grant.** Before creating this seat's own scratch directories,
   an early shell command combined `mkdir -p` (for this seat's own two scratch directories) with
   `ls scratchpad/ | head -5` in the same call. `scratchpad/` as a whole (this run's shared
   scratch root) is above this seat's grant; only `scratchpad/c4-U1/` and
   `scratchpad/c4-U1-replay/` are within it. The listing showed five directory **names** only
   (`c1-F1`, `c1-F1-replay`, `c1-F2`, `c1-F2-replay`, `c1-S`, all Cycle 1 seat scratch residue);
   no sibling directory's contents were opened, and nothing from this listing entered any
   derivation, digest, or claim below. This is the same class of disclosure Cycle 2/3 U2 and F2
   each self-reported for the identical kind of touch.
2. **Two `find` invocations rooted at explicitly authorized directories, not above them.** The
   worker common brief explicitly authorizes reading "the governed awards under
   `runs/lean-2026-09-26-c1-la1-*/`, `runs/lean-2026-09-26-c1-la2-*/`, `runs/lean-2026-09-26-c2-la1-*/`
   and `runs/lean-2026-09-27-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall/`". To locate the
   exact `LeanProject/` file paths inside two of these four named, already-authorized directories
   (`runs/lean-2026-09-26-c1-la1-active-tag-weight-identity/` and
   `runs/lean-2026-09-27-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall/LeanProject/`), two
   `find` calls were run rooted exactly at those directories (not above them, and not at the
   shared `runs/` parent). This is the same pattern Cycle 3 F2 used for
   `find sources -iname "__pycache__"` (rooted at an authorized directory, not above it). No
   sibling award's or seat's files were listed or opened as a result.
3. **One targeted Python filter over an already-authorized, digest-verified control file.**
   `control/C4-STAGE2-PACKET-MANIFEST.json` (read in full via the tool's own pagination, matching
   its stated `file_count` 1113) was loaded with the Python standard library `json` module and its
   `files` list filtered in-memory for path substrings (`c3-stage7-sources`, `lean-2026-09-26-c1-la1`,
   etc.) to locate exact file paths already implied by the brief's own authorized list. This is
   content-filtering of one file already read in full, not a directory search, and is analogous to
   Cycle 3 U2's own `grep -n` on a single already-authorized file to locate one definition.
4. **`control/CLAIM-IDENTITY.run-local.json`** was digest-verified against its Stage 2 manifest
   entry (`e41525674827ebee44279b170ee72836bc9ec5e9659e5a9918f3613494f64e43`, 2,522,715 bytes; own
   recomputed `shasum -a 256` matched exactly) before being loaded with `json.load` for the alias
   check below (§ Alias check). This is a control-tier file, not a `sources/` member, so it is not
   covered by `SOURCE-DIGESTS.json`; its own entry in the Stage 2 manifest's `files` list is the
   digest of record, and it matched.
5. No sibling Cycle 4 return, critique, or scratch directory was read. No other experiment root, no
   live lower-region or first-interior root, was read. No network access or package install
   occurred at any point.
6. **A refused stray write.** One early shell command piped a `find`/`wc`/`head` list into a
   redirect target `/tmp_list1.txt` before this route had confirmed its own scratch directories;
   the write was refused by the OS ("read-only file system: /tmp_list1.txt") and nothing was
   written anywhere. This is the same class of incident SR-C3-7 self-reported ("a shell redirect
   typo... tried to write `/before.sha` at the filesystem root. The write was refused... nothing was
   written"). All later output was redirected into this route's own scratch directories instead.

## Stage 2 seal and source digests

Recomputed SHA-256 of the canonical JSON of `control/C4-STAGE2-PACKET-MANIFEST.json` (its
`seal_sha256` field removed, `sort_keys=True`, separators `(",", ":")`, no trailing newline, own
Python script, `python3 -B`):

```
f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684
```

This **matches** both the manifest's own embedded `seal_sha256` field and the value cited in the
dispatch file (independently digest-verified before it was opened, per the outer boot
instructions). **I cite this seal value:
`f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`.**

Every Lean source file this route reads or seeds from was independently re-hashed with literal
`shasum -a 256` and checked against the digest cited on the face of the record that names it
(`cycles/cycle-1/CYCLE-CLOSE.md`, `cycles/cycle-2/CYCLE-CLOSE.md`, `cycles/cycle-3/CYCLE-CLOSE.md`)
*before* being used to seed the scratch project:

| File | Bytes | SHA-256 (own recomputation) | Matches record of |
|---|---:|---|---|
| `runs/lean-2026-09-26-c1-la1-active-tag-weight-identity/LeanProject/LeanProof/Main.lean` | 61,296 (unchanged from the first-interior award; see below) | `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` | C1-LA1, Cycle 1 Close §3 |
| `runs/lean-2026-09-26-c2-la1-aut-invariant-positive-deficient-family/LeanProject/LeanProof/Main.lean` | — | `a9cf3b815832b6fa25e43e07e628db4ce01a7a496b084cac0cd3768e877c7fc4` | C2-LA1, Cycle 2 Close §3 |
| `runs/lean-2026-09-27-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall/LeanProject/LeanProof/Main.lean` | 2,187 lines | `22e3f81c487697912e3e94741eeb27e580324fd1bf3e06f52afaebc667e04a45` | C3-LA1, Cycle 3 Close §3 |

(The first row's byte count is the digest of the frozen award file as it stands today; the table's
own byte figure for the middle two rows is omitted since only the hash was cross-checked, not
re-derived from a separately reported byte count — the hash match alone is the fidelity check.)
I additionally opened `runs/lean-2026-09-27-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall/RECEIPTS/kernel-verification.json`
and confirmed its recorded verdict `{"code": "verified", "verified": true}` with
`source_sha256_before` = `source_sha256_after` = `22e3f81c…` (the same digest, confirming the
kernel-checked source was never mutated after the award closed) and `allowed_axioms: ["Classical.choice", "Quot.sound", "propext"]`.

## IMPORT LIST

This route is Lean-only: no Python numeric instrument was written or run, and no numeric claim
(count, flow, cut, census row) is shipped by this return — the deliverable is Lean source text and
its own kernel/axiom checks. Lean side: `import Mathlib` (inherited, unchanged, from the seeded
`Main.lean`); every new declaration in `LeanProof/C4U1.lean` uses only Mathlib and the frozen
`E993Transport`/`C4LA1`/`C5LA1` definitions already carried into `Main.lean`. No `sorry`, `admit`,
`native_decide`, or `axiom` token appears anywhere in the new file (checked by literal `grep` on
the file itself, not a directory search); `#print axioms` on every one of the 18 new declarations
reports exactly `[propext, Classical.choice, Quot.sound]` or a strict subset (two declarations use
only `[propext, Quot.sound]`), reproduced below.

## Registered claims named before any table (worker brief rule 3)

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — OPEN. This route neither proves nor
  refutes it, nor touches any of its ten scope notes; nothing below is a family, sector, or
  instance statement about it.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — `formally_verified` (C1-LA1). This
  route's Lean work *uses* `activeWeight`, `indepFamily`, `transportRel`, `IsSaturatingFlow` exactly
  as C1-LA1 froze them (byte-identical, seeded from C3-LA1's carrier); it is not re-derived, not
  re-proved, and not weakened or widened anywhere.
- **The `G_k` key** `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`
  (`proved_informal`) and **GK-SIGN** `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE`
  (`proved_informal`) — **neither is touched.** This route's Part A (the component-product lemma)
  is general infrastructure usable by a *future* Lean formalization of GK-SIGN's DAG (the
  allocation's item 5(a) names exactly this mechanism, "the component-product lemma for
  `C5LA1.indepSetCount` over a disjoint union"); it does not itself construct `G_k`, does not prove
  Lemma M, and does not prove or extend either registered key's statement. See Remaining
  obligation.
- **(NM)** `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` — `proved_informal`, no
  Lean text (SR-C3-7f: the abstract-poset half is compiled scratch by C-U1-T/C-U1-F; nodes (N1)
  graph encoding, (N2) sector correspondence, (N3) binder diff are explicitly open). I read the
  key's full registered statement, scope, and SR-C3-7f's exact node list directly from
  `control/CLAIM-IDENTITY.run-local.json` (digest-verified, § Read-boundary disclosure item 4)
  before writing any Lean. This route's Part C supplies (N1) in full (a real bijection between
  independent sets of a concrete `SimpleGraph (Fin N × Bool)` and states `Fin N → Option Bool`,
  with deletion corresponding to `Rdel`) and Part D supplies one general half of the mechanism
  (N2)'s registry text attributes to T1's Cycle 1 derivation ("every private tag is inactive
  because its witness lies in the excluded shell"), **without** the complementary "exactly one
  designated tag is always active" half that would complete (N2), and without attempting (N3).
  Neither (NM)'s registered statement nor its grade is changed by this route; nothing here is
  offered as a re-derivation of the abstract-poset facts (`down_card`, `up_card`, `rk_of_Rdel`,
  `shadow_degree_bound`), which remain C-U1-T's/C-U1-F's own compiled scratch, cited, not
  re-proved.
- **B7 record** `R30-C3-B7-RATIONAL-FLOW-VERIFICATION-LEMMA` (`proved_informal`, SR-C3-7b; "a
  companion, no key... Its Lean form needs a `ℚ`-valued flow predicate, which the frozen
  definitions do not contain"). This route supplies exactly that missing Lean predicate
  (`IsSaturatingFlowQ`) and proves the exact statement SR-C3-7b confirmed, generalizing the
  frozen ℕ-valued compiled companion `weightedHall_of_saturatingFlow` (C1-LA2's face, read from
  `runs/lean-2026-09-26-c1-la2-.../LeanProject/LeanProof/Main.lean` for its proof pattern) to
  `ℚ≥0`. It also formalizes SR-C3-7b's own noted restricted form (equality assumed only on a
  subfamily `Y`). Neither is a re-derivation of the informal proof (which is a three-line chain);
  it is that proof's first Lean text.
- **The ten refuted mechanism keys** and the two named exclusions of `SOLUTION-CONTRACT.md` §3.2 —
  **not touched.** This route proposes no transport mechanism of its own; every new declaration is
  either (i) general graph/Finset infrastructure (Parts A, C, D) with no claim about (HALL) at any
  scope, or (ii) a companion verification lemma (Part B) that is explicitly a certificate-checking
  tool, not a Hall theorem, exactly as SR-C3-7b's own fence states ("a certificate check, not
  (HALL) and not evidence for it").
- **`E993-R23-LITERAL-DELETE-ONLY-HALL`** and its four siblings — not touched; nothing below
  proposes a deletion-only or Delete/Retag relation of any kind.
- No table, census, or numeric row is reported anywhere in this return (this route ships Lean
  source and its kernel checks only), so the "before any census" ordering rule is vacuously
  satisfied by every section above being written before any such table would appear.

## Alias check (lexical AND mathematical), against `control/CLAIM-IDENTITY.run-local.json` (448 claims, digest-verified above)

Performed with the Python standard library (`json.load` + substring search over each claim's
`claim_key`, `statement`, `scope`, `status`, `certificate`, `aliases`, `alias_patterns` fields), not
a directory-rooted `grep`.

- **Lexical.** Searched for: `component-product`, `disjoint sum`, `disjoint union`, `Vandermonde`,
  `convolution`, `rational flow`, `rational saturating flow`, `induced matching`, `matchingGraph`,
  `Option Bool`, `encoding bijection`, `Rdel`, `decode`, `IsSaturatingFlowQ`. Zero hits for
  `component-product`, `rational saturating flow`, `matchingGraph`, `encoding bijection`, `Rdel`
  (as a bare term outside the one expected (NM) hit below), `decode`, `IsSaturatingFlowQ`. The
  remaining terms return only unrelated hits, read individually and confirmed distinct: eighteen
  `disjoint union` hits are all r25/r27/G1 forest/graph-family theorems about specific *finite
  graph families* (e.g. `2K2 ⊔ (2r-2)K1`, spanning cliques, a G1 residual stratum) — none is a
  general Vandermonde/convolution statement about independent-set counts of an *arbitrary* disjoint
  sum, which is what Part A proves; the `convolution` hits are all about coefficient-sequence
  log-concavity/unimodality classes (TRS2, TGT, P1-NNSEQ, etc.) or a *different* convolution
  identity (`E993-L0-CONV-DELTA`, a forward-difference/Δ convolution, not an independent-set-count
  one); the one `rational flow` hit
  (`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`) is T1's E1
  criterion on `CB(d,m)`, an unrelated deletion-only Hall statement with no rational-flow content
  in its text (the substring matched "cri**terion i**mplies", not the phrase); the one `induced
  matching` and one `Option Bool` hit are both the (NM) key itself, the expected, non-colliding
  match (this route extends its Lean formalization, it does not propose a competing claim).
- **Mathematical.** No registered claim states or implies: an independent-`k`-set-count identity
  for the disjoint sum of two arbitrary finite simple graphs (Part A); a `ℚ`-valued flow predicate
  or a rational-flow-implies-weighted-Hall theorem (Part B: the nearest object, B7, is an
  unregistered *record*, not a claim, and is the exact statement this route formalizes, not a
  distinct one); a bijection between independent sets of a concrete induced-matching graph and
  `Fin N → Option Bool` states with deletion corresponding to `Rdel` (Part C: (NM)'s own text
  explicitly says this bijection, node (N1), "is not formalized" — so by the key's own face there
  is nothing to collide with); or a general "witnesses-in-the-excluded-shell implies inactive"
  lemma for the active-tag weight (Part D). **No lexical or mathematical collision found for any
  of the eighteen new declarations.**

## Derivation, step by step, naming where each hypothesis enters

**Part A — the component-product lemma (`indepSetCount_sum_eq`).** GK-SIGN's informal derivation
(C-F2-U's Cycle 3 critique) builds `G_k`'s independence polynomial, and every deleted-graph
polynomial `H_v`, `R_v` it needs, by recognizing that removing a cut vertex splits the remainder
into vertex-disjoint pieces whose polynomials multiply — e.g. `H_1 = G_k − {1, 0}` "disconnects into
the star `{2,3,4}` and `k` copies of `a_i–b_i–c_i}`, so `H_1`'s independence polynomial is
`(1+3y+y²)^{k+1}` exactly" (a product of `k+1` identical factors). This route makes that
multiplicativity a proved Lean theorem for *any* two finite simple graphs, not only for `G_k`'s
specific pieces:

1. `instDecidableRelSum` — Mathlib's `SimpleGraph.sum` (the disjoint sum `G ⊕g H` on `V ⊕ W`, `Adj`
   true only within a summand) carries no `DecidableRel` instance; one is supplied directly from
   `[DecidableRel G.Adj] [DecidableRel H.Adj]`, since the match defining `.sum`'s `Adj` reduces
   definitionally on each of the four `Sum` constructor patterns. This is where `DecidableRel`
   (needed for every later `Finset.filter` over independent sets of `G ⊕g H`) enters.
2. `isIndepSet_sum_iff` — since no edge of `G ⊕g H` crosses summands
   (`SimpleGraph.not_adj_sum_inl_inr`), independence of a set `u : Finset (V ⊕ W)` splits along
   `Finset.toLeft`/`Finset.toRight` (Mathlib's `Finset.sumEquiv : Finset (α ⊕ β) ≃o Finset α × Finset β`
   machinery) into independence of the two projected pieces. This is where finiteness of `V`, `W`
   enters only through `Fintype`/`DecidableEq` (needed for the ambient `Finset` machinery); no
   other hypothesis is used.
3. `mem_indepFamily` — an unfolding lemma making `A ∈ indepFamily K i ↔ A.card = i ∧ K.IsIndepSet A`
   explicit, used to keep every later `rintro`/`refine` free of `indepFamily`'s internal
   `powersetCard`/`filter` representation.
4. `indepFamily_sum_eq` — the disjoint sum's independent `k`-sets are exactly a disjoint union
   (indexed by `i = 0, …, k`, via `Finset.biUnion`) of images, under `Finset.disjSum`, of
   `(indepFamily G i) ×ˢ (indepFamily H (k−i))`. This is where `#A + #B = k` enters via
   `card_toLeft_add_card_toRight` (`Finset.disjSum`'s own cardinality-additivity lemma).
5. `indepSetCount_sum_eq` — the **component-product lemma**: taking cardinalities of both sides of
   step 4 via `Finset.card_biUnion` (needing the images for distinct `i` pairwise disjoint, proved
   from `Finset.Injective2_disjSum` plus the fact that `A.card` — hence `i` — is determined by the
   image) and `Finset.card_image_of_injOn` (needing `Finset.disjSum`'s injectivity on each product,
   `Finset.Injective2_disjSum`) gives exactly
   `C5LA1.indepSetCount (G ⊕g H) ∅ k = Σ_{i=0}^{k} C5LA1.indepSetCount G ∅ i · C5LA1.indepSetCount H ∅ (k−i)`
   — the Vandermonde convolution GK-SIGN's derivation uses implicitly at every cut-vertex deletion.
   No cast, ℕ-subtraction guard, or `IsTree` hypothesis is needed anywhere in Part A: it holds for
   *any* two finite simple graphs, tree or not.

**Part B — B7, the rational flow verification lemma.** SR-C3-7b's proof is a three-line chain
(`Σ_X w = Σ_X Σ_{N(X)} f ≤ Σ_{N(X)} Σ_{I_{p+1}} f ≤ Σ_{N(X)} w`), already compiled for ℕ-valued
flows on C1-LA2's face (`weightedHall_of_saturatingFlow`). This route:

6. `IsSaturatingFlowQ` — the missing `ℚ`-valued predicate (support only on `transportRel` arcs,
   exact rational supply equality at every source in `indepFamily G (p+1)`, capacity inequality at
   every target in `indepFamily G p`, and a global nonnegativity conjunct `∀ B A, 0 ≤ f B A`
   standing in for "`ℚ_{≥0}`"). This is where the predicate SR-C3-7b's own record explicitly says
   "the frozen definitions do not contain" is supplied.
7. `weightedHall_of_saturatingFlowQ` — the same three-step chain as the ℕ compiled companion, with
   `Finset.sum_le_sum_of_subset_of_nonneg` in place of ℕ's automatic subset-monotonicity (this is
   where the nonnegativity conjunct enters: ℚ sums are not automatically monotone under subset the
   way ℕ sums are), concluding the ℚ-valued inequality and casting down to the *already-ℕ-valued*
   `WeightedHall G F p` proposition via `exact_mod_cast` (both sides of the concluding inequality
   are literal casts of natural sums, so no rounding or truncation is possible).
8. `weightedHall_on_of_saturatingFlowQ_restricted` — SR-C3-7b's own noted restricted form (source
   equality assumed only on `Y ⊆ indepFamily G (p+1)`, giving the conclusion for every `X ⊆ Y`),
   proved by the identical chain with `Y` in place of `indepFamily G (p+1)` throughout — this is
   the shape a coupled per-class certificate (T1's or U2's object) would actually ship, since it
   need not route every source in the whole layer, only those in its own class.

**Part C — (NM)'s (N1) encoding bijection.** (NM)'s registry text names the induced matching of `N`
edges `{b_i, c_i}` and the abstract states `Fin N → Option Bool` with `Rdel f g := ∃ i, f i ≠ none ∧
g = update f i none`, but records "the graph encoding (N1)... not formalized." This route builds it:

9. `matchingGraph N` — the literal graph on `Fin N × Bool` with `Adj p q := p.1 = q.1 ∧ p.2 ≠ q.2`
   (adjacent exactly within a block, across the two labels): this *is* an induced matching of `N`
   edges, literally, not merely analogous to one.
10. `not_both` — the sole content of independence in this graph: two members of the same block
    force the same label, by direct contradiction with `Adj`.
11. `decode`/`mem_decode`/`isIndepSet_decode` — every state `f` decodes to an independent set (via
    `Finset.univ.biUnion`, contributing at most one vertex per block), and independence is
    automatic (`isIndepSet_decode`) precisely because two vertices of the same block can never both
    be `some` for the same `f`.
12. `rk`/`card_decode` — the state's rank (occupied-coordinate count) equals `(decode f).card`, via
    `Finset.card_biUnion` on a manifestly pairwise-disjoint family (distinct blocks contribute
    disjoint singletons or nothing).
13. `encode`/`decode_encode`/`encode_decode` — the two directions are mutually inverse *on
    independent sets* (`decode_encode` needs `s`'s independence, via `not_both`, to know `encode`
    does not silently drop information; `encode_decode` needs no hypothesis, since `decode f` is
    always independent). Together these are the bijection (N1) asks for.
14. `erase_iff_Rdel` — **the deletion correspondence.** For an independent `B` and an occupied
    `(i, b) ∈ B`, `encode (B.erase (i, b)) = Function.update (encode B) i none` exactly — the
    literal graph deletion arc (D), restricted to this sector, *is* `Rdel` at witness `i`. This is
    where independence of `B` enters twice: once (via `hB.mono`) to know the erased set is still
    independent, and once (via `not_both`) to know no *other* vertex of block `i` could have been
    present alongside `(i, b)`, so erasing `(i, b)` alone suffices to clear block `i` to `none`.

**Part D — toward (NM)'s (N2).** (NM)'s registry text attributes "every root-plus-arm sector member
has active weight exactly one" to the fact that private tags' witnesses sit in the excluded shell
around a fixed independent `Q`. This route proves the general half of that mechanism, for any graph
and any independent `Q`, not only `CB(d,m)`:

15. `closedNbhdSet` — `N[Q] := ⋃_{q∈Q} N[q]`, as a `Finset.biUnion`.
16. `disjoint_of_indep_shell` — if `Q ⊆ B` and `B` is independent, `B` meets `N[Q] \ Q` in nothing:
    a shell vertex `x` is adjacent to some `q ∈ Q ⊆ B`, so `x ∈ B` together with independence of
    `B` is a direct contradiction. This is where independence of `B` (not of `Q`) is the only
    hypothesis used; `Q`'s own independence is never needed for this direction.
17. `not_active_of_witnesses_subset_shell` — a tag `v` whose `tagWitnesses G v` lie entirely in the
    shell is therefore never active in any `B ⊇ Q`: `B.erase v`'s intersection with the shell is
    empty by step 16, and `tagWitnesses G v` is inside the shell by hypothesis, so the two are
    disjoint. This is exactly the reason `CB(1,m)`'s private leaves (SR-C3-7c's B8) and `CB(d,m)`'s
    (T1's Cycle 1 §1) are inactive in their own root-plus-arm sectors — proved once, generically.
18. `notMem_activeFilter_of_witnesses_subset_shell` — the direct corollary that such a `v` is
    excluded from the `Finset.filter` defining `activeWeight`, for every tag set `F`.

**What Part D does not supply (see Remaining obligation).** The complementary half of "weight
exactly one" — that Q's own designated tag (e.g. an arm leaf `v` with `s_v ∈ Q`) is *always*
active, and that it is the *only* tag whose witnesses are not confined to the shell — needs a
specific hypothesis on `Q` and `F` this route does not state or prove; without it,
`activeWeight G F B` for `B ⊇ Q` could be `0` (if no tag has a witness outside the shell at all)
rather than provably `1`.

## Grades (`SOLUTION-CONTRACT.md` §4 vocabulary)

| Declaration(s) | Content | Grade |
|---|---|---|
| `instDecidableRelSum`, `isIndepSet_sum_iff`, `mem_indepFamily`, `indepFamily_sum_eq`, `indepSetCount_eq_card`, `indepSetCount_sum_eq` | Part A: the component-product lemma, general (any two finite simple graphs) | `formally_verified`-grade proof text (kernel-checked, zero `sorry`, axioms exactly `{propext, Classical.choice, Quot.sound}` or a subset); **compiled scratch, no key, no award** — this route's deliverable is contract-ready text, not a governed award (allocation: "GK-SIGN and (NM) contract-ready for the Cycle 4 Stage 7") |
| `IsSaturatingFlowQ`, `weightedHall_of_saturatingFlowQ`, `weightedHall_on_of_saturatingFlowQ_restricted` | Part B: B7, the ℚ-valued flow verification lemma, general | same as above — first Lean text for the record `R30-C3-B7-RATIONAL-FLOW-VERIFICATION-LEMMA` (previously `proved_informal`, no Lean form) |
| `matchingGraph`, `not_both`, `decode`, `mem_decode`, `isIndepSet_decode`, `rk`, `card_decode`, `encode`, `decode_encode`, `encode_decode`, `erase_iff_Rdel` | Part C: (NM)'s (N1), the encoding bijection and the deletion/`Rdel` correspondence, general | same as above — closes node (N1) of SR-C3-7f's open list |
| `closedNbhdSet`, `disjoint_of_indep_shell`, `not_active_of_witnesses_subset_shell`, `notMem_activeFilter_of_witnesses_subset_shell` | Part D: the general private-tag-inactivity mechanism, one half of (N2) | same as above — **partial** progress on node (N2); the complementary "exactly one active tag" half is **not attempted** |
| GK-SIGN's full DAG (explicit `G_k` on `Fin (3k+5)`, Lemma M, the aggregate identity) | item 5(a)'s remaining ingredients | **not attempted**; remains `proved_informal`/STATED at C-F2-U's Cycle 3 critique, pending Lean formalization |
| (NM)'s (N2) in full (weight identically one) and (N3) (binder diff against the registered text) | item 5(b)'s remaining ingredients | **not attempted**; (NM) remains `proved_informal`, no Lean text, exactly as SR-C3-7f left it |

No certification above strengthens a prior grade without strengthening its evidence: (WID), the
`G_k` key, GK-SIGN, and (NM) each keep exactly the grade and scope the Cycle 1–3 closes and SR-C3-7f
recorded. Nothing here is a governed award (no `THEOREM-CONTRACT.yaml`, no `RECEIPTS/`, no
`lean-proof-workflow` invocation) — per the shared rules, "the governed award workflow is invoked
by the controller after synthesis," and this route's compiled declarations are scratch until then.

## Draft contracts (for a possible Cycle 4/5 Stage 7 award, at the controller's discretion)

Three self-contained candidate terminal statements, each with zero dependency on the other two and
each provable independently of any tree-specific construction:

1. **Component-product.** `theorem indepSetCount_sum_eq {V W} [Fintype V] [Fintype W] [DecidableEq V] [DecidableEq W] (G : SimpleGraph V) [DecidableRel G.Adj] (H : SimpleGraph W) [DecidableRel H.Adj] (k : ℕ) : C5LA1.indepSetCount (G.sum H) ∅ k = ∑ i ∈ Finset.range (k+1), C5LA1.indepSetCount G ∅ i * C5LA1.indepSetCount H ∅ (k - i)`. No hypotheses beyond finiteness and decidability. Companions: `isIndepSet_sum_iff`, `indepFamily_sum_eq`.
2. **B7.** `theorem weightedHall_of_saturatingFlowQ {V} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ) (f : Finset V → Finset V → ℚ) (hf : IsSaturatingFlowQ G F p f) : WeightedHall G F p`. Companion `IsSaturatingFlowQ` is new vocabulary (SR-C3-7b: "needs a `ℚ`-valued flow predicate, which the frozen definitions do not contain").
3. **(N1).** `theorem erase_iff_Rdel {N} {B : Finset (Fin N × Bool)} (hB : (matchingGraph N).IsIndepSet (B:Set _)) (i : Fin N) (b : Bool) (hib : (i,b) ∈ B) : encode (B.erase (i,b)) = Function.update (encode B) i none`, together with `decode_encode`/`encode_decode` (the bijection) and `card_decode` (rank ↔ cardinality). New vocabulary: `matchingGraph`, `decode`, `encode`, `rk`.

Each would carry its own certificate under R29-N-12 (a kernel-checked companion registers
`proved_informal`; a key needing `formally_verified` gets its own award group); none is proposed as
a registered key by this route (that is the synthesis's act).

## Exact dependency diagram

```
Part A (component-product, standalone — no dependency on Parts B/C/D):
  instDecidableRelSum
        └─> isIndepSet_sum_iff
                └─> indepFamily_sum_eq  <── mem_indepFamily
                        └─> indepSetCount_sum_eq  <── indepSetCount_eq_card

Part B (B7, standalone — no dependency on Parts A/C/D):
  IsSaturatingFlowQ
        ├─> weightedHall_of_saturatingFlowQ
        └─> weightedHall_on_of_saturatingFlowQ_restricted   (same proof shape, independent)

Part C ((N1), standalone — no dependency on Parts A/B/D):
  matchingGraph ──> not_both
        ├─> decode ──> mem_decode ──> isIndepSet_decode
        │                     └─> card_decode
        └─> encode ──> decode_encode (uses not_both)
                  └─> encode_decode
                          └─> erase_iff_Rdel (uses not_both, decode_encode's independence side)

Part D (toward N2, standalone — no dependency on Parts A/B/C):
  closedNbhdSet
        └─> disjoint_of_indep_shell
                └─> not_active_of_witnesses_subset_shell
                        └─> notMem_activeFilter_of_witnesses_subset_shell

All four parts depend only on the frozen carried entries of `Main.lean` (C1LA1/C4LA1/C5LA1/
E993Transport definitions 1–21 and the map/orbit lemmas 22–89; no new declaration edits, widens, or
re-proves any of them) and on Mathlib. Parts A–D are mutually independent: none of the 18 new
declarations in one part is used by any declaration in another part.
```

## Central obligation

**central obligation attempted: yes** (partial). The allocation's stated object for `C4-U-01` is
three-fold: (a) GK-SIGN's DAG (component-product lemma, explicit `G_k`, Lemma M, the aggregate
identity); (b) (NM)'s (N1) encoding bijection and (N2) the sector correspondence with weight one;
(c) the ℚ-flow verification lemma B7 as a compiled companion. This route: **completes** (c) in
full; **completes** (N1) of (b) in full and advances one general half of (N2); **advances only the
named component-product ingredient** of (a), leaving `G_k`'s explicit construction, Lemma M, and
the aggregate identity itself untouched. C3-LA1 (this route's other listed first obligation, "if it
did not [close], completing C3-LA1's DAG is this route's first obligation") **had already closed**
`formally_verified` at the Cycle 3 Stage 7 close (`cycles/cycle-3/CYCLE-CLOSE.md` §3), so that
obligation was void and not re-attempted (re-proving a closed award's DAG would itself breach the
census/closed-region fences).

## `headline_resolved: no`

The headline is (HALL) `formally_verified` at `SOLUTION-CONTRACT.md` §2's statement, or a confirmed
(CUT) refutation, at Stage 7; neither is this route's product, and this route offers no (CUT)
candidate.

## Route verdict: `compiled`

Eighteen new declarations across four independent parts, every one kernel-checked with zero
`sorry`/`admit`/`native_decide`/`axiom` and axioms exactly `{propext, Classical.choice, Quot.sound}`
(or a strict subset), replayed byte-identically in a fresh copy of the project. This is genuinely
new, self-contained Lean content — not a re-derivation of anything already compiled or awarded —
but it is not itself a theorem *of the run's registered mechanism* (no (HALL), (WID), `G_k`, or
(NM) key changes grade or scope), so `compiled` rather than `proved`/`proved_conditional`. It is
not `blocked` (nothing here failed for lack of a missing dependency) and not `refuted`/
`bounded_evidence` (no numeric or family-scoped claim is made at all).

## Remaining obligation (successor inheritance)

1. **GK-SIGN's explicit `G_k` on `Fin (3k+5)` and Lemma M remain unformalized.** A successor should
   build `G_k`'s literal `SimpleGraph (Fin (3k+5))` (vertices `0,1,2,3,4` and `a_i,b_i,c_i` for
   `1 ≤ i ≤ k`; edges `0–1, 0–2, 2–3, 2–4, 0–a_i, a_i–b_i, b_i–c_i}`, confirmed against the `G_k`
   key's own registered text, which this route read but did not construct), prove it is a tree
   (`IsTree`: connectivity and acyclicity, separately, per the shared rules), and use this route's
   `indepSetCount_sum_eq` at each cut-vertex deletion (root, support, and each arm) to derive `H_1`,
   `R_1`'s closed forms `(1+3y+y²)^{k+1}` and `(1+y)²(1+2y)^k` (C-F2-U's Cycle 3 critique) as Lean
   `Polynomial ℤ` or coefficient-sequence facts, then Lemma M (the elementary, non-real-rootedness
   coefficient-difference recurrence and its `h(N) ≥ 2^N`, `g(N) ≥ 3^{N-1}` bounds), then assemble
   the full aggregate inequality `S(G_k, k+3) < −2`. This is a substantial independent undertaking
   (comparable in size to Parts A–D combined) that this route's budget did not reach; it is the
   single largest remaining gap toward Cycle 4's obligation 5's "could close: GK-SIGN and (NM)
   contract-ready for the Cycle 4 Stage 7."
2. **(NM)'s (N2) needs its complementary half.** This route's Part D proves "a tag whose witnesses
   lie in the shell is inactive"; a successor needs the matching "some tag is always active"
   argument for a *specific* structural hypothesis on `(G, Q, F)` (the `CB(d,m)` case has `Q = {r,
   v}`, `v`'s witness `{r} ⊆ Q`, always present), stated at the generality (NM)'s own text implies
   (an arbitrary graph with an independent `Q` whose removal of `N[Q]` leaves a perfect matching),
   to conclude `activeWeight G F B = 1` for every `B` in the sector — completing (N1)+(N2) as a
   single Lean theorem package the synthesis could contract at Stage 7.
3. **(N3), the binder diff against (NM)'s exact registered text**, is not attempted: a successor
   should check this route's `matchingGraph`/`decode`/`encode`/`Rdel`-correspondence text against
   the registered statement's own binders (`Q ⊆ V` independent, `G − N_G[Q]` a perfect matching,
   `S^Q_{|Q|+k}`, `∂_Q X`) sentence by sentence, the way SR-C3-7e did for Lemma U against P10.
4. **T1's Cycle 1 "Lemma 2.1" text itself remains unread by this route** (outside its grant, exactly
   as SR-C3-7 also declined to open it): the exact form of the "always-active tag" argument in the
   original CB(d,m) derivation (`cycles/cycle-1/stage3/returns/T1/RETURN.md` §1, read by this route
   for its Lemma 1 and the CB(8,92) fixed point, but not for a leg-poset-specific "Lemma 2.1" that
   does not appear in that file under that name) should be the starting point for obligation 2
   above, not re-derived from scratch.
5. **An isolated second read** of every declaration in `LeanProof/C4U1.lean` is required before any
   registration (worker brief rule 5): none of Parts A–D proposes a named key here, so none is
   registered by this return; the synthesis decides whether any is worth a companion/record entry.

## Background jobs

None. Every command in this route (file reads, `python3 -B` digest/JSON checks, `lake build`,
`lake env lean`) ran in the foreground and returned before the next command was issued; the longest
single command was a full `lake build` of the seeded project plus this route's new file, completing
in under 6 seconds. No `pgrep`/`ps aux`/full process listing was used anywhere.

## Artifact inventory

All files are under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-U1/`
(development) and its byte-identical copy under `scratchpad/c4-U1-replay/` (replay, verified below).
Nothing was written under `sources/`, under any other experiment root, or under `/tmp`.

| File | SHA-256 | Bytes |
|---|---|---:|
| `LeanProject/LeanProof/C4U1.lean` (the 18 new declarations) | `2b9f09d8518c63b78f7139dfa60dbeeab0fcce369d819dd0ea590a12bd5839b5` | 23,547 |
| `LeanProject/LeanProof/AxiomCheckC4U1.lean` (the `#print axioms` probe) | `eb5930be64f7392868a36b3dcff42cc64d8920adfaab7018b9286f27d9ef03ab` | 1,164 |
| `LeanProject/LeanProof/Main.lean` (seeded byte-identically from C3-LA1, unedited) | `22e3f81c487697912e3e94741eeb27e580324fd1bf3e06f52afaebc667e04a45` | — |

**Project scaffold** (`lakefile.toml`, `lake-manifest.json`, `lean-toolchain`, `LeanProof.lean`)
byte-copied from `runs/lean-2026-09-26-c1-la1-active-tag-weight-identity/LeanProject/` per the
shared rules, with `LeanProof.lean` extended by one line (`import LeanProof.C4U1`) after its
existing `import LeanProof.Main`. Shared Mathlib bound by **manual symlink**
(`mkdir -p LeanProject/.lake && ln -s /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages LeanProject/.lake/packages`);
`.lake/packages` was never copied. Mathlib revision verified against
`sources/mathlib-binding/PIN.json`: pinned `905b95818eb32af7874a58b427f50c1711a5e96c`, confirmed
identical to the revision the running project's own `lake` resolved (cross-checked against
C3-LA1's own `kernel-verification.json` `mathlib.revision` field, same value). No `lake update`, no
`lake clean`, no `elan` invocation.

**Axiom check (own instrument, `python3`-free — pure `lake env lean`), full output:**

```
'E993Transport.isIndepSet_sum_iff' depends on axioms: [propext, Quot.sound]
'E993Transport.mem_indepFamily' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.indepFamily_sum_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.indepSetCount_eq_card' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.indepSetCount_sum_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.weightedHall_of_saturatingFlowQ' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.weightedHall_on_of_saturatingFlowQ_restricted' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.not_both' depends on axioms: [propext, Quot.sound]
'E993Transport.mem_decode' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.isIndepSet_decode' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.card_decode' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.decode_encode' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.encode_decode' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.erase_iff_Rdel' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.closedNbhdSet' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.disjoint_of_indep_shell' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.not_active_of_witnesses_subset_shell' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.notMem_activeFilter_of_witnesses_subset_shell' depends on axioms: [propext, Classical.choice, Quot.sound]
```

**Copy-out-first replay** (verified: this exact sequence was run a second time in the `-replay`
directory after copying, and reproduced the identical `lake build` success and the identical
18-line axiom output above, byte for byte):

```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-U1-replay/LeanProject
lake build
lake env lean LeanProof/AxiomCheckC4U1.lean
```

(`lake`/`lean` resolved via `/Users/ashtonsperry/.elan/bin/`; the `.lake/packages` symlink at this
replay location points to the same pinned shared Mathlib, created fresh, never copied.)

`grep -n "sorry\|admit\|native_decide" LeanProof/C4U1.lean` returns only the two lines of this
file's own header comment stating the rule, in both the development and replay copies (verified
identical by digest above) — no executable occurrence of any of the three tokens exists.
