# RETURN — r31 Cycle 2, Route U2

**Route ID:** `C2-U-02` **Mechanism token:** `FORMAL-CB-SECTOR-COMPOSITION-INSTANTIATION`
**Orientation:** U (formal / structural). **Chartered:** Claude Sonnet 5, high.

## Boot acknowledgment

Booted per the dispatch's restricted boot: read exactly
`/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and nothing else in VerityOS
(no memory, conversations, modules, skills, logs or decisions were read; the controller has
booted for the run). No read-boundary disclosure to record.

## Digests verified

- Dispatch file `DISPATCH-U2.md`: SHA-256 `aceab660ee82818cec663a84bf3807d187dacdc9ab74d8b74726d427b8ea299d` — matched before reading.
- Stage 2 packet seal (`control/C2-STAGE2-PACKET-MANIFEST.json`): recomputed SHA-256 of the
  canonical JSON (all fields except `seal_sha256`, `sort_keys=True`, `separators=(",",":")`, no
  trailing newline) = `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`, **matches**
  the recorded `seal_sha256`.
- Every source file read (below) was checked against `sources/SOURCE-DIGESTS.json` or
  `sources/c1-results/SOURCE-DIGESTS.json` before reading; all matched (table below).

| File used | SHA-256 | Verified against |
|---|---|---|
| `sources/c1-results/.../lean-2026-09-28-c1-la2-cb8-definition-layer/LeanProject/LeanProof/Main.lean` | `a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f` | `sources/c1-results/SOURCE-DIGESTS.json` |
| `sources/c1-results/.../lean-2026-09-28-c1-la1-cb8-sector-template-feasible/LeanProject/LeanProof/Main.lean` | `f0578ed7ce7f51f695d410cdbd1265d7071d40f40832635ed12d3dade6c9b78e` | `sources/c1-results/SOURCE-DIGESTS.json` |
| `sources/r30/.../c1-la2-weighted-hall-implies-nonpositive-aggregate/.../Snippets/0030-...card_sigma_fiber_filter.lean.fragment` | `e8c6b0d12256a6e44f3550cdd7c1eccf10d32930c3f5ccb3b4b5def291be83fe` | `sources/SOURCE-DIGESTS.json` |
| `sources/r30/.../c1-la2-weighted-hall-implies-nonpositive-aggregate/.../Snippets/0031-...exists_saturatingFlow_of_weightedHall.lean.fragment` | `ec521065a45bda39199f86d965ea609fb472adb341061ca5d6bb44b0d31a2ac2` | `sources/SOURCE-DIGESTS.json` |
| `sources/mathlib-binding/PIN.json` (toolchain `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`) | — | read directly; matched the lakefile's pinned `rev` and the `.lake/packages/mathlib` checkout |

## IMPORT LIST (the one Python script used, standard library only)

`json`, `hashlib` — used only for the Stage 2 seal recomputation and per-file digest checks shown
above; every other artifact in this return is Lean, checked by the pinned `lake`/`lean` (v4.32.2)
against the read-only shared Mathlib.

## Registered claims named before any computation

This route touches, without re-proving or upgrading any of them:

- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN — the run's (HALL) headline; **not** resolved
  by this return).
- `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN — untouched).
- `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (`formally_verified`; its
  companion lemma `exists_saturatingFlow_of_weightedHall` is carried byte-identically, see below).
- `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` and the CB sector-structure keys of
  `SEMANTIC-CONTRACT.md` §2 (the sector `{r,v}` + `K` legs shape) — this route's Part C
  (`sector_legCount_eq_card_sub_two`) is a fresh, independent formal derivation of that shape on
  the literal `cbGraph m`, not a re-proof of the registered key's existing grade, and is **scratch**
  (no grade; SOLUTION-CONTRACT §2/`C2-WORKER-COMMON-BRIEF.md` item 8: "a seat's compiled
  declarations are scratch").
- C1-LA1's template feasibility award (`cb8_topRank_sectorTemplate_feasible`, `formally_verified`,
  template level only) and C1-LA2's terminal reduction (`cb8_topRank_of_descent_and_flow`,
  `formally_verified`) — both carried, not re-proved.

No new claim is proposed for registration by this route (nothing here rises above scratch); no
alias check is therefore owed against the run-local registry. Lexical/mathematical self-check
against the frozen concurrent master (`sources/concurrent/master-494-2026-09-28/`) was not needed
for the same reason (no candidate key is proposed).

## What was carried (byte-identical) vs. authored new

The scratch project `scratchpad/c2-U2/LeanProject/LeanProof/Main.lean` (2,942 lines, SHA-256
`a03e15f3695f817ed0c02d16c4d4a258b897c78f8ee773246aa57475c8d81d2c`) is, in order:

1. **Carried byte-identically**, C1-LA2's full `Main.lean` (entries 1–78: the graph-generic
   `C4LA1`/`C5LA1` layer, `E993Transport`'s transport-network definitions — `indepFamily`,
   `tagWitnesses`, `activeWeight`, `layerWeight`, `favorableLeaves`, `transportRel`,
   `IsSaturatingFlow`, `WeightedHall`, `crossingIndex` — and the full CB(8,m) definition/tree/leaf
   layer: `cbEdge`, `cbGraph`, `cbVertex`, `cbParent*`, `cbGraph_isTree`, `cb_val_cases`,
   `cb_leaf_cases`, `mem_leafSet_cbGraph_iff`, `mem_cb_tagWitnesses_{v,leaf}_iff`,
   `mem_neighborFinset_{root,choke}_iff`, `choke_degree`, `favorableLeaves_eq_leafSet_of_all`, and
   the terminal reduction `cb8_topRank_of_descent_and_flow`).
2. **Carried byte-identically**, from the r30 award
   `sources/r30/lean/lean-2026-09-26-c1-la2-weighted-hall-implies-nonpositive-aggregate`, Snippets
   0030 (`card_sigma_fiber_filter`) and 0031 (`exists_saturatingFlow_of_weightedHall`) — the
   rational-to-integral companion `SEMANTIC-CONTRACT.md` §2 names explicitly. (Every other entry of
   that award, 0001–0021, is the *same* carried layer already in C1-LA2 above and was **not**
   duplicated, to avoid redeclaration.)
3. **Carried byte-identically**, C1-LA1's full `Main.lean` (the abstract `State8` template:
   `cb8Pb`, `cb8Pc`, `cb8Sigma`, `cb8Theta`, `cb8Out`, `cb8In`, `cb8R1`, and the template feasibility
   theorem `cb8_topRank_sectorTemplate_feasible` with its four components — nonnegativity,
   `Out ≥ 1`, `In ≤ 1`, Switch — and the Residual inequality).
4. **New, authored in this route** (Parts A–D below), fully sorry-free, kernel-checked against the
   pinned Mathlib, depending only on `[propext, Classical.choice, Quot.sound]` (checked by
   `#print axioms` on every new declaration; see the replay log).

Note on scratch-project setup (a disclosed deviation from a literal reading of one clause): the
brief's item 8 says to byte-copy `lakefile.toml`/`lake-manifest.json`/`lean-toolchain` "of the
pinned shared project" (`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project`).
That project's own `lakefile.toml` targets its `Smoke` library, not a `LeanProof` library, so a
literal byte-copy would not build a project with our `LeanProof.Main` module. I instead copied
those three files (plus `LeanProof.lean`) from the already-compiled, digest-verified,
kernel-checked C1-LA2 award, which targets the *same* pinned toolchain (`leanprover/lean4:v4.32.2`)
and the *same* pinned Mathlib revision (`905b95818eb32af7874a58b427f50c1711a5e96c`, matching
`sources/mathlib-binding/PIN.json`) and binds `.lake/packages` by the same manual symlink rule
(never copied, verified `ln -s` to the shared `.lake/packages`, never `lake update`/`lake clean`).
This satisfies the substance of the pin (identical toolchain and Mathlib commit, read-only shared
packages) while producing a project that actually builds `LeanProof/Main.lean`.

## Step-by-step derivation (where each hypothesis enters)

**Target reminder** (`SOLUTION-CONTRACT.md` §2, C1-LA2 entry 78): the terminal's conjunct 4 is
`∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) p*) p* f`, `p* = (16m+4)/3`. My
load-bearing obligation is the composition that would produce this conjunct from (i) the criterion
key's E1 deletion flow (T3's object, not yet written as an explicit Lean statement — T3 runs
concurrently this cycle and its return is not readable by rule), (ii) C1-LA1's per-state
`Out`/`In`/Switch/Residual template (already formally verified, but only at the *abstract*
`State8` level — "not a flow on the literal network", its own docstring says), and (iii) the
rational-to-integral step.

**Part A (`weightedHall_of_ratFlow_bound`, `exists_saturatingFlow_of_ratFlow_bound`).** I proved,
for an *arbitrary* graph `G`, tag set `F` and rank `p` (nothing CB-specific enters here — this is
the reusable half of the composition `SEMANTIC-CONTRACT.md` §2 describes): if a rational function
`g : Finset V → Finset V → ℚ` is (a) nonnegative everywhere, (b) zero off `transportRel`'s arcs,
(c) has row sums at least each source's `activeWeight` (`Out`), and (d) column sums at most each
target's `activeWeight` (`In`), then `WeightedHall G F p` holds — by summing `g` over an arbitrary
source subfamily `X` and its literal neighbourhood `N`, exactly the "summing it over any `X` gives
(HALL-COND)" step of `SEMANTIC-CONTRACT.md` §2 — and hence (composing with the carried
`exists_saturatingFlow_of_weightedHall`) an integral saturating flow exists. This is where
hypothesis (iii), the rational-to-integral step, is fully discharged, unconditionally, for any
future `g` satisfying (a)–(d).

**Part B (`chokeBeta`, `chokeGamma`, `chokeBeta_add_chokeGamma_le`, `IsSectorSource`,
`chokeState`).** This is the allocation's "choke-state extraction" node: I read a literal
independent set `B`'s choke-`i` leg state `(β_i, γ_i)` directly off `cbGraph m`'s vertex labels
(`chokeBeta`/`chokeGamma` count, via `Finset.filter`, how many of the 8 legs have their support
`b_{ij}`/private leaf `c_{ij}` present in `B`), and prove `β_i + γ_i ≤ 8` from independence alone
(`chokeBeta_add_chokeGamma_le`): a leg with *both* `b_{ij}` and `c_{ij}` in `B` would violate
independence, since `cbGraph_adj_support_leaf` (carried) makes them adjacent — this is where
hypothesis "`B` is an independent set" enters. This packages exactly into C1-LA1's `State8` type
(`chokeState`), so C1-LA1's already-verified `cb8Out`/`cb8In`/etc. apply to it with no further
translation.

**Part C (`legVerticesAt`, `legVerticesAt_card`, `legVerticesAt_disjoint`, `sdiff_rv_eq_biUnion`,
`sector_legCount_eq_card_sub_two`).** This is "Lemma 0, literal form": for a *sector* source `B`
(independent, containing both `r = cbVertex m 0` and `v = cbVertex m 2` — `IsSectorSource`), I show
`B \ {r, v}` is *exactly* the disjoint union over the `m` chokes of the legs present in `B`
(`sdiff_rv_eq_biUnion`), by the same case-split method C1-LA2 already uses for `cb_leaf_cases`/
`cbGraph_indepNum_le` (`cb_val_cases` gives six label shapes for any `x ≠ r, v`; independence with
`r ∈ B` rules out `x` being `s` — via `cbGraph_adj_r_s` — or a choke `u_i` — via
`cbGraph_adj_r_choke` — so only the support/leaf shapes survive; this is where hypothesis
"`r, v ∈ B`, `B` independent" enters a second time, at the *global* level rather than per-choke).
Counting both sides (`Finset.card_biUnion` needs the chokes' vertex ranges pairwise disjoint,
`legVerticesAt_disjoint`, from the `17`-spacing of choke labels vs. the width-`16` leg range — an
arithmetic fact closed by `omega`) gives the sector leg-count identity: `∑ i, (β_i + γ_i) = B.card
− 2`, which is `SEMANTIC-CONTRACT.md` §2's "a sector member is `{r, v}` plus `K := p* − 1` legs",
now a literal, sorry-free fact about `cbGraph m` rather than an assertion.

**Part D (`sector_out_ge_one`).** The capstone: a sector source with exactly `p*+1` vertices has
`B.card − 2 = (16m+4)/3 − 1 = (16m+1)/3 = K`, C1-LA1's own `Out`-hypothesis shape exactly — so
`cb8_sum_out` (carried, formally verified) applies through `chokeState`/Part C with **no further
argument**, giving `1 ≤ ∑ i, cb8Out m (chokeState m B hsec i)`: the literal sector's total
allocation from C1-LA1's per-state intercept table is at least `1`, for the first time proved about
an actual vertex set of `cbGraph m` rather than an abstract `Fin m → State8` assignment. This is
where hypothesis "`m ≥ 107`, `m ≡ 2 (mod 3)`" enters, via C1-LA1's `cb8_sum_out m hm3`.

**What this chain does *not* yet close** (see `## Remaining obligation`): `sector_out_ge_one` shows
the *template's* `Out` bound holds for the literal sector, but `weightedHall_of_ratFlow_bound`
needs an actual `g` (arc values, not just a per-source total) with `g`'s support inside
`transportRel` and matching column bounds at every target — i.e. the literal deletion/switch arcs
still need to be assigned `pb`/`pc`/`σ` values and checked against `transportRel`'s two disjuncts,
and the non-sector part of the network (everything E1 alone must saturate) is untouched by this
route. Nothing here claims (HALL) or conjunct 4 unconditionally.

## Grades (SOLUTION-CONTRACT §4; never upgraded by use)

- `weightedHall_of_ratFlow_bound`, `exists_saturatingFlow_of_ratFlow_bound`: formally verified as
  stated (sorry-free, standard axioms only) — but they are **conditional infrastructure**: general
  theorems about an arbitrary hypothesised `g`, not a statement about `CB(8,m)`. Scratch (no grade
  per SOLUTION-CONTRACT §2/brief item 8), correctly not confused with a contribution to Tier 1/2.
- `chokeBeta_add_chokeGamma_le`, `sdiff_rv_eq_biUnion`, `sector_legCount_eq_card_sub_two`,
  `sector_out_ge_one`: formally verified as stated, about the literal `cbGraph m` — the strongest
  grade this route produces. Scratch (no grade) until a governed award adopts them; they carry no
  certificate of their own (SOLUTION-CONTRACT §4).
- Every carried declaration (C1-LA1, C1-LA2, the r30 companion) keeps its own grade
  (`formally_verified` at the exact scopes stated in `SEMANTIC-CONTRACT.md` §3); none is re-proved
  or touched here.
- The composition as a whole (Tier 2's "(L-S)_top … composition to (HALL) on the literal network")
  remains at its entering grade, `proved_informal` (SR-3; key R-2, per `C2-ALLOCATION.md`'s
  "where the target stands entering Cycle 2") — this route advances toward a formal version of that
  composition but does not complete or upgrade it.

## Darroch/Newton, ℕ-subtraction, casts

No Newton or Darroch step occurs anywhere in this route (nothing here touches a coefficient
polynomial). The one ℕ-subtraction is `B.card − 2` (`sector_legCount_eq_card_sub_two`) and `K − 1`
style arithmetic already inside carried C1-LA1 code; both are guarded (`Finset.card_sdiff` after
establishing `{r,v} ⊆ B` via `Finset.inter_eq_left`, so the subtraction never underflows) and check
under the kernel. All arithmetic is exact (`ℕ`/`ℚ`), no floating point, no `native_decide`, no
`decide` standing in for a universal step, no `sorry` anywhere in the 2,942-line file (`grep -c
sorry` → `0`, confirmed both before and after every append in this session).

## Verified network hygiene (brief item 2, as far as this route's content requires it)

This route builds no ad hoc numeric network instrument (no Python (WID) check) — its object is the
Lean-typed network already carried from C1-LA2 (`IsSaturatingFlow`/`WeightedHall`/`transportRel`,
entries 19–21 of that award), whose own tree/connectivity facts (`cbGraph_isTree`,
`cbGraph_connected`, entries 44/56) are carried, not re-derived. The one cardinality identity this
route contributes (`sector_legCount_eq_card_sub_two`) is itself checked from two independent
descriptions of the same object inside the Lean proof — `B.card − 2` via `Finset.card_sdiff` on one
side, `∑ chokeBeta + chokeGamma` via `Finset.card_biUnion` on the other — and the kernel confirms
their equality; this is the formal analogue of the brief's "asserts supply − capacity = S from
independent sides" for a route whose instrument is a proof term rather than a numeric script.

## Replay (copy-out-first; foreground; no detached jobs)

All Lean invocations in this session ran in the foreground or were polled on their literal PID in a
bounded loop (`kill -0 $PID`, `sleep 10` per iteration, capped at 30 iterations) and every job
finished (confirmed by PID check) before this return was written; none was left running.

```sh
# copy out first (never edit in place; target is this run's own scratch, never /tmp)
mkdir -p /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-U2-replay
cp -R /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-U2-replay/LeanProject \
  <your-copy-target>/LeanProject
cd <your-copy-target>/LeanProject
mkdir -p .lake
ln -s /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages .lake/packages
shasum -a 256 LeanProof/Main.lean   # expect a03e15f3695f817ed0c02d16c4d4a258b897c78f8ee773246aa57475c8d81d2c
/Users/ashtonsperry/.elan/bin/lake env lean LeanProof/Main.lean   # expect no output = compiles clean
```

Already executed once in place at
`scratchpad/c2-U2-replay/` (script `replay.sh`, output `replay_output.log`, both present) and at
`scratchpad/c2-U2/LeanProject/` (the working copy), both foreground/PID-polled, both confirming:
compiles with zero errors, `grep -c sorry` = 0, and

```
'E993Transport.sector_out_ge_one' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.exists_saturatingFlow_of_ratFlow_bound' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.weightedHall_of_ratFlow_bound' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.sector_legCount_eq_card_sub_two' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.chokeBeta_add_chokeGamma_le' depends on axioms: [propext, Classical.choice, Quot.sound]
```

Compile time of the full 2,942-line file against the precompiled shared Mathlib: ≈24s (foreground,
timed by wall clock around the process, not hashed into any claim).

No numeric census table is produced by this route, so the brief's "`x` and `Δ_k` with the
difference index on every row" does not apply (no rows of that shape were generated here); the
only numeric artifact is the Stage 2 seal recomputation (digest given above, reproducible by the
one-line Python script in the seal-verification step of this session).

## headline_resolved

`headline_resolved: no`

## Route verdict

`compiled` — sorry-free, kernel-checked Lean infrastructure (Parts A–D) that advances the formal
composition toward conjunct 4, but does not itself prove, refute, or conditionally establish Tier 1
or Tier 2 at any grade above scratch, and finds no cut.

## Gate lines (ruling 14)

`ELIG_formal: not_advanced`
`HALL_formal: advanced`
`FAV_darroch_free: not_advanced`
`cut_candidate: none`

## Remaining obligation

Written as what a successor inherits, in dependency order:

1. **In-side sector-target corollary** (mechanical, mirrors `sector_out_ge_one`): for a target
   `A ∈ indepFamily (cbGraph m) p*` that is itself in-sector (`r, v ∈ A`) with `A.card = p*`, show
   `A.card − 2 = K − 1` and invoke the carried `cb8_sum_in` through `chokeState m A` (needs
   `IsSectorSource` restated for a `p*`-sized set, or a shared predicate covering both layers —
   straightforward given Part C already proves the general leg-count identity for *any* cardinality
   sector set, not just `p*+1`).
2. **The literal arc-value function `g`.** `weightedHall_of_ratFlow_bound`/
   `exists_saturatingFlow_of_ratFlow_bound` (Part A) are ready to consume a concrete
   `g : Finset V → Finset V → ℚ`, but no such `g` is defined on `cbGraph m` yet. Building it needs:
   (a) T3's explicit per-choke-state arc values (`C2-T-03`'s load-bearing obligation, not yet
   returned this cycle and not readable by rule) restated as literal functions of a source's
   `chokeState`, i.e. `g B A := cb8Pb m (chokeState m B _ i) `if`A = B.erase (b_{ij})`, similarly
   for `pc`/`σ`, `0` otherwise; (b) a proof that this `g`'s support lies in `transportRel B A` —
   should follow directly from `transportRel`'s two disjuncts (`B.erase q` and the `u`-insertion
   form) matching the deletion/switch operations by construction, but is not yet written.
3. **Non-sector sources and targets.** Everything outside `{B : r, v ∈ B}` is E1's object (the
   homogeneous mark-clone criterion key), entirely outside this route's grant; T3's explicit
   statement (`C2-T-03`) is the named dependency.
4. **The `8 − γ` switch-preimage count and the doubly-fed residual argument**
   (`SEMANTIC-CONTRACT.md` §2: "an image of weight `γ` has exactly `8 − γ` sector preimages";
   `(8−γ)·σ(γ) ≤ θ·γ` composed with E1's `ρ_1·γ` load to give `(ρ_1+θ)·γ ≤ γ`) is not formalized by
   this route; C1-LA1's Switch/Residual clauses (already carried) give the *template* inequality,
   but the literal preimage-counting bridge (a `legVerticesAt`-style biUnion/card argument keyed by
   the switch relation's second disjunct, `|N(u) ∩ B| = 2`) is unbuilt.
5. Once (1)–(4) close, `exists_saturatingFlow_of_ratFlow_bound` (already proved here, unconditional)
   discharges conjunct 4 in one line — no further composition lemma is needed on top of what this
   return delivers.

## Model disclosure

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model
id: claude-sonnet-5 (per this session's system context; not independently queryable beyond that).

## Files of record (all absolute)

- `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/cycles/cycle-2/stage3/returns/U2/RETURN.md` (this file)
- `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-U2/LeanProject/LeanProof/Main.lean` (working copy, SHA-256 `a03e15f3695f817ed0c02d16c4d4a258b897c78f8ee773246aa57475c8d81d2c`)
- `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-U2-replay/LeanProject/LeanProof/Main.lean` (replay copy, identical digest)
- `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-U2-replay/replay.sh` and `replay_output.log` (executed replay, foreground/PID-polled)
- `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-U2/LeanProject/LeanProof/U2New.lean.part`, `U2PartB.lean.part`, `U2PartC.lean.part`, `U2PartD.lean.part` (the four new sections in isolation, for review)
