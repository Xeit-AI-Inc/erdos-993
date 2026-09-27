# Route U1 Return — `C2-U-01 LEAN-INV-AND-SECTOR-FORMALIZATION`

Run: `erdos-993-math-dre-20260926-r30-weighted-transport` (r30), Cycle 2, Stage 3, seat `U1`. Orientation U
(formal/structural). Mechanism fingerprint: `LEAN-INV-AND-SECTOR-FORMALIZATION`.

**Model disclosure (two parts):** chartered Claude Sonnet 5, xhigh; transport-resolved model Claude Sonnet 5
(explicit parameter); runtime-reported model id, verbatim: `claude-sonnet-5`.

## Boot acknowledgment (VerityOS)

I am operating within VerityOS. Per the dispatch (`control/dispatch/c2-stage3/DISPATCH-U1.md`, SHA-256
`61ff751cdb08645ca6856c363495ae1e9db3eecf88c7184b33b2b86f820acf05`, verified against the wrapper's digest before
reading) and `control/C2-WORKER-COMMON-BRIEF.md`, the authorized boot reads were EXACTLY two files and nothing
else: `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I
read those two files and no other VerityOS file (not the startup protocol's own task-type map, not memory, not
conversations, not modules, not skills beyond the one disclosure below, not logs, not decisions). The harness
injected the root `CLAUDE.md` and the user auto-memory index into context at session start, outside my control; I
did not open either as a source and nothing below relies on them.

## Read-boundary disclosure

Two boundary slips occurred before I had fully internalized the dispatch's narrower boot instruction (both before
any substantive mathematical work; no VerityOS content beyond file/directory names was read or relied on):

1. I ran `find /Users/ashtonsperry/VerityOS/skills/optimization-loop -maxdepth 2 -type f`, following the general
   CLAUDE.md task-type map ("controlled optimization" → load `skills/optimization-loop/skill.md`) instead of the
   dispatch's explicit "do not follow the startup protocol's own map" instruction. This is a search rooted above my
   grant (the VerityOS root). It returned one path (`skills/optimization-loop/skill.md`); I did not read its
   contents and did not use it.
2. I ran a non-recursive `ls -la` on the experiment run root
   (`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/`) before reading the
   dispatch's file list. It showed top-level entries: `AUTHORIZATION.md`, `OBLIGATIONS.csv`, `RUN-STATE.live.json`,
   `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, and the directories `control/`, `cycles/`, `runs/`, `scratchpad/`,
   `second-reads/`, `sources/`. I read no further content from `cycles/`, `runs/`, `second-reads/` or `scratchpad/`
   beyond what the dispatch and worker-common-brief separately, explicitly authorize (listed below); the two
   contract files and `control/` were subsequently read exactly as the dispatch instructs.

No other out-of-grant read or search occurred. Searches inside the pinned Mathlib package directory
(`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/mathlib`) are explicitly
within grant (worker-common-brief) and are not disclosures; nor are the targeted, non-recursive listings of the
`runs/lean-2026-09-26-c1-la1-active-tag-weight-identity/LeanProject/LeanProof/Snippets/` directory (an authorized
"Main.lean, contracts" source) or of my own `scratchpad/c2-U1/` and `scratchpad/c2-U1-replay/`.

## Seals and digests verified

- **Stage 2 packet manifest seal** (`control/C2-STAGE2-PACKET-MANIFEST.json`): recomputed SHA-256 of the canonical
  JSON without `seal_sha256` (`sort_keys`, separators `(",", ":")`, no trailing newline, via Python's
  `json.dumps`) = **`2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`**, equal to both the
  dispatch's cited value and the manifest's own `seal_sha256` field. Match.
- **C1-LA1's frozen `Main.lean`** (the byte-identical carry seeding this route's scratch project, per
  `control/C2-ALLOCATION.md` item 5 and Gate ruling 14): SHA-256 of
  `runs/lean-2026-09-26-c1-la1-active-tag-weight-identity/LeanProject/LeanProof/Main.lean` on disk =
  **`86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb`** (45,610 bytes) — matches the digest bound
  by that award's own `kernel-verification`/`FIDELITY-REVIEW.md` receipts (`source_sha256` before = after =
  `86b59c6c…`), and my byte-copy into `scratchpad/c2-U1/LeanProject/LeanProof/Main.lean` is confirmed
  byte-identical (Python comparison, not just hash equality).
- The Mathlib pin: toolchain `leanprover/lean4:v4.32.2`, revision `905b95818eb32af7874a58b427f50c1711a5e96c`
  (`git -C <shared project> rev-parse HEAD`), matching `sources/mathlib-binding/PIN.json` exactly. Bound by manual
  symlink (`ln -sfn .../mathlib-v4.32.2-project/.lake/packages LeanProject/.lake/packages`); `.lake/packages` was
  never copied; no `lake update`, no `lake clean`, no network, no package installs.

## Load-bearing obligation (`control/C2-ALLOCATION.md`, item 5)

> In a scratch project seeded from C1-LA1's frozen `Main.lean`: (a) `favorableLeaves_map_aut`,
> `activeWeight_map_aut`, `transportRel_map_aut` for `γ : G ≃g G`; (b) supermodularity of `φ` and the maximizer
> lattice over `Finset (Finset V)`; (c) `exists_aut_invariant_deficient_of_not_weightedHall` (INV's tree
> specialization) — the smallest node the synthesis named; (d) then NM
> (`sectorPairProductNormalizedMatching`) at the registered statement; (e) `#print axioms` on everything; exact
> dependency diagram; draft contracts.

I read the exact target for (c) from the Cycle 1 sealed source of record,
`cycles/cycle-1/stage5/adjudicators/U/ADJUDICATION.md` ("Lean readiness", Award group 2), which states the smallest
unproved formal node as `favorableLeaves_map_aut` feeding a stated Lean goal
`exists_aut_invariant_deficient_of_not_weightedHall`. I also read `cycles/cycle-1/stage6/SYNTHESIS.md` (P4/(INV),
P5/(NM), the Next-cycle portfolio's U1 object) as the source of the exact informal proof outline: coverage
submodularity → `φ`-supermodularity → maximizer lattice → least/greatest-maximizer invariance → Hall ⇔
invariant-family Hall.

## Registered claims named before this return's content is used as evidence

This route produces no numeric claim, census, table or flow — every requirement of worker-common-brief item 7
that presupposes one (deterministic generator, digest, `x`/`Δ_k`/`α`/`p`/`|F|`/supply/capacity/`S` row fields,
acyclicity-and-connectivity test in code) is **vacuous here** (nothing to which it applies); this is stated once,
up front, rather than repeated per (non-existent) row. **IMPORT LIST: none** — no Python or other computational
instrument was run in this route; every artifact is Lean source, compiled by `lake`/`lean` against the pinned
project.

Claims this route's Lean work bears on (named before any of the content below is used as evidence, per
worker-common-brief item 3):

- **`E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` (INV)** — `proved_informal`, STATED, registration pending
  an isolated second read (Cycle 1 record). This route formalizes part of its informal DAG in Lean scratch (see
  Grades below); it does **not** close the key, does not register anything, and does not change its grade.
- **`E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (NM)** — `proved_informal`, STATED. **Not
  attempted this route** (see Remaining obligation): no Lean text for NM exists in `INV.lean`.
- **`E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (WID)** — `formally_verified` (C1-LA1, already closed). This
  route only *reads* its frozen `Main.lean` text (byte-identical carry) as the seed for definitions
  (`indepFamily`, `tagWitnesses`, `activeWeight`, `layerWeight`, `favorableLeaves`, `transportRel`,
  `IsSaturatingFlow`, `WeightedHall`, plus `C4LA1`/`C5LA1`/`E993Interior` entries 1–13, 18, 42); it proves nothing
  new about WID and does not touch its award.
- **`E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (HALL)** — OPEN, untouched. Nothing in this route is a Hall
  theorem, a restricted-scope Hall theorem, or a deficient cut.
- **`E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`** (the primary aggregate) — OPEN, untouched; no sign
  content anywhere in `INV.lean`.
- **The ten refuted mechanism keys of `SOLUTION-CONTRACT.md` §3.2** and the C6-F4 own-support unit-capacity rule:
  none is revived. Every declaration in `INV.lean` is either (i) an automorphism-equivariance fact about the
  already-frozen, already-registered `E993Transport` definitions, or (ii) a generic supermodularity/lattice fact
  about the deficiency function `φ`. Neither resembles a per-leaf injectivity, domination, covariance, unit-capacity,
  or literal-delete-only-Hall statement; none is a tag-closed-cut, hot-tag-singleton, or zero-retag-export claim.
  This route proposes **no transport mechanism** of its own.

**Alias check (lexical and mathematical).** Lexically: none of `INV.lean`'s 30 declaration names collides with any
registered key name (`favorableLeaves_map_aut`, `activeWeight_map_aut`, `transportRel_map_aut`,
`isMaximizer_union_inter`, `canonMin`/`canonMax`, `phi_supermodular`, etc. — all new, route-local, unregistered
names; none is proposed for registration). Mathematically: the closest registered statement is (INV) itself; my
`phi_supermodular`, `isMaximizer_union`/`isMaximizer_inter`, `canonMin_isMaximizer`/`canonMax_isMaximizer` are
**sub-lemmas toward** (INV)'s informal DAG (the "coverage submodularity → supermodularity → maximizer lattice"
steps of the Cycle 1 U adjudication's item (i)–(iii)), not a restatement of (INV) itself and not a new claim — no
new `E993-R30-…` key is proposed here. `favorableLeaves_map_aut`/`activeWeight_map_aut`/`transportRel_map_aut` are
exactly the three Lean nodes item 5(a) names verbatim; they are not aliases of anything registered (equivariance
under a graph automorphism has no existing key). No statement here is mathematically identical to any of the ten
refuted keys (checked against the one-line description of each in `SOLUTION-CONTRACT.md` §3.2, quoted above).

## Step-by-step derivation, with hypotheses named where they enter

All work is in namespace `E993Transport`, file `scratchpad/c2-U1/LeanProject/LeanProof/INV.lean` (SHA-256
`174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9`, 18,816 bytes), importing the frozen
`LeanProof.Main` unchanged. **No declaration anywhere in this file uses `IsTree`** (neither connectivity nor
acyclicity) **or eligibility** (`crossingIndex + 2 ≤ p`, `3p < 2·indepNum + 1`) — exactly as SEMANTIC-CONTRACT
§1.2 states (INV)'s informal DAG needs neither; every statement is graph-generic (`G : SimpleGraph V`,
`[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`) and finiteness enters only through these three instances.
Group invariance enters via `γ : G ≃g G`, a single graph automorphism (a specific `Γ = ⟨γ⟩`-worth of invariance;
the general "`Γ ≤ Aut(G)` is admissible" clause of (INV) is not separately re-derived, since every step here holds
for one arbitrary `γ`, hence for every element of any subgroup).

### Part (a) — automorphism equivariance (11 lemmas + 1 theorem-labelled target, all proved)

1. `adj_equiv_iff`/direct use of `γ.map_rel_iff` (a `RelIso` fact, not authored) — the one fact every later step
   composes with: `G.Adj (γ u) (γ w) ↔ G.Adj u w`. **Where it enters:** every subsequent equivariance lemma.
2. `isIndepSet_map_aut` — an automorphism preserves independence of a finite vertex set (`Set.Pairwise`
   unfolding of `IsIndepSet`, composed with (1) and injectivity of `γ`). **Enters:** the base case for every
   "this family is `Aut`-invariant" lemma below.
3. `neighborFinset_map_aut` — `N(γ u) = γ(N(u))` (`Finset.map`), via (1) and `γ.apply_symm_apply`/`γ.symm`.
   **Enters:** `tagWitnesses_map_aut`, and the (S) branch of `transportRel_map_aut`.
4. `isGraphLeaf_map_aut` — `IsGraphLeaf G (γ v) ↔ IsGraphLeaf G v`, via (1) and injectivity/`γ.symm`. **Enters:**
   `support_map_aut`, `leafSet_map_aut`.
5. `support_spec` — a technical device, not mathematics: `Classical.choose_spec` applied to a *freshly
   reconstructed* witness of the same existence proposition `C5LA1.support` uses, so the tactic unifies without a
   higher-order metavariable (`Prop` proof irrelevance makes the two `Classical.choose` calls defeq). **Enters:**
   `support_map_aut` only.
6. `support_map_aut` — `s_{γ v} = γ(s_v)` for a leaf `v` (**hypothesis `hv : IsGraphLeaf G v` is load-bearing
   here**: `support` is unconstrained off the leaf set, so the fact is false without it). Uses (4), (5), (1), and
   uniqueness of the neighbour. **Enters:** `tagWitnesses_map_aut`.
7. `tagWitnesses_map_aut` — `W_{γ v} = γ(W_v)` for a leaf `v` (same `hv` hypothesis, inherited from (6)), via
   `Finset.map_erase` and (3),(6).
8. `mem_leafSet_iff`, `leafSet_map_aut` — `leafSet` is `Aut`-invariant (no leaf hypothesis needed: this fact is
   about the whole set, via (4)).
9. `vertexDeletionIndepSetCount_map_aut` — `i_k(G − γv) = i_k(G − v)`, via `Finset.map_erase`,
   `Finset.map_univ_equiv`, `Finset.powersetCard_map`, `Finset.filter_map`, and (2). No leaf hypothesis needed
   (deletion of any single vertex).
10. `isFavorableAt_map_aut` — `IsFavorableAt G (γv) p ↔ IsFavorableAt G v p` at every rank `p`, directly from (9)
    applied at ranks `p` and `p+1` (the ℤ-subtraction defining `vertexDeletionForwardDifference` is untouched;
    both sides cast the same naturals).
11. **`favorableLeaves_map_aut` (theorem)** — `(favorableLeaves G p).map γ.toEquiv.toEmbedding = favorableLeaves G
    p`, the exact node the Cycle 1 synthesis named as smallest-unproved. From (8) (via `mem_leafSet_iff`) and (10);
    no `IsTree`, no eligibility, holds at every `p : ℕ`.
12. **`activeWeight_map_aut` (theorem)** — `activeWeight G (F.map f) (B.map f) = activeWeight G F B` for
    `f = γ.toEquiv.toEmbedding`, **under `hF : ∀ v ∈ F, IsGraphLeaf G v`** (the same guard `layerWeight_sub_eq_sum`
    already carries in the frozen `Main.lean`, load-bearing here because `tagWitnesses_map_aut` needs it). Via
    `Finset.map_inter`, `Finset.filter_map`, `Finset.card_map`, (7), `Finset.disjoint_map`.
13. `map_map_symm_self` — `(s.map f).map f⁻¹ = s` for the automorphism's own inverse `γ.symm` (`Function.Embedding`
    composition collapses to the identity `Equiv`).
14. `transportRel_map_aut_mp` — one direction of (D)∪(S)-relation equivariance, via `Finset.map_erase` (D) and
    (3)+`Finset.map_sdiff`+`Finset.map_insert` (S); the (S) case's witness vertex `u` is mapped by `γ`, and its
    "exactly two neighbours in `B`" cardinality condition transports via `Finset.map_inter`+`Finset.card_map`.
15. **`transportRel_map_aut` (theorem)** — the general iff, obtained by applying (14) to *both* `γ` and `γ.symm`
    (also an automorphism) and cancelling the round trip with (13) — avoids re-deriving the backward direction by
    hand.

### Part (b) — supermodularity of `φ` and the maximizer lattice (16 declarations, all proved)

For a fixed `(G, F, p)` (no `IsTree`, no eligibility, `F` an arbitrary finite set — not yet specialized to
`favorableLeaves`):

16. `covered` — `N(X) := (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A)`, `cov`, `supply`, and
    **`phi X := (supply X : ℤ) − (cov X : ℤ)`**, the deficiency function of (HALL-COND)/(CUT) (`φ(X) > 0` is
    exactly a Hall violator/deficient cut; `WeightedHall` is `∀ X, φ(X) ≤ 0`).
17. `covered_union` — `N` is *exactly* union-preserving: `N(X∪Y) = N(X) ∪ N(Y)` (direct from the existential's
    `∃B∈X∪Y,R` splitting).
18. `covered_inter_subset` — `N` is only *subset*-preserving on intersections: `N(X∩Y) ⊆ N(X) ∩ N(Y)` (the
    converse can fail — a target reachable from some `B∈X` and some `B'∈Y` need not be reachable from a single
    `B∈X∩Y`).
19. `cov_submodular` — `cov(X∪Y) + cov(X∩Y) ≤ cov(X) + cov(Y)`: the standard "nonnegative-weighted coverage
    function of a union-exact, intersection-subset set map is submodular" argument, via `Finset.sum_union_inter`
    (exact, on (17)) and `Finset.sum_le_sum_of_subset` (on (18), using `activeWeight ≥ 0` automatically since it
    is `ℕ`-valued).
20. `supply_modular` — `supply(X∪Y) + supply(X∩Y) = supply(X) + supply(Y)`, exactly, via `Finset.sum_union_inter`
    on `X, Y` directly (the source part of `φ` is modular, not merely sub/supermodular).
21. **`phi_supermodular` (theorem)** — `φ(X) + φ(Y) ≤ φ(X∪Y) + φ(X∩Y)`, i.e. **`φ` is supermodular**: cast (19)
    and (20) to `ℤ` and combine (`linarith`). This is (b)'s first half, proved for a completely general finite
    simple graph and finite tag set — no automorphism anywhere yet.
22. **`isMaximizer_union_inter` (theorem)** — the *pairwise* lattice-of-maximizers fact stated without first
    fixing an ambient domain: if `φ(X) = φ(Y) = M` and `M` also bounds `φ(X∪Y)` and `φ(X∩Y)` above, both attain
    `M`. Pure `omega` on (21).
23. `domain := (indepFamily G (p+1)).powerset`, `domain_nonempty` (`∅` always qualifies), `maxPhi := sup'` over
    `domain` of `φ`, `maximizers := domain.filter (φ · = maxPhi)`, `maximizers_nonempty`
    (`Finset.exists_mem_eq_sup'`), `le_maxPhi_of_mem_domain` (`Finset.le_sup'`), `mem_domain_union`,
    `mem_domain_inter` (monotonicity of `⊆` under `∪`/`∩` within a fixed powerset).
24. `isMaximizer_union`, `isMaximizer_inter` — the maximizers close under `∪` and `∩` (apply (22) with `M = maxPhi`
    and the two domain-membership facts of (23) supplying the upper bounds via `le_maxPhi_of_mem_domain`).
25. **`canonMin := (maximizers).inf' id`, `canonMax := (maximizers).sup' id`**, and
    **`canonMin_isMaximizer`, `canonMax_isMaximizer` (theorems)** — the two canonical extremal maximizers *are*
    maximizers, by `Finset.inf'_induction`/`Finset.sup'_induction` (a finite-family generalization of (24), not
    hand-rolled induction).

**Where this leaves (c).** (22)–(25) are exactly the "supermodularity → maximizer lattice → least/greatest
maximizer" steps of the Cycle 1 U adjudication's informal DAG (i)–(iii) for **a fixed, non-invariant `X` universe**.
What is **not yet done** is showing `canonMin`/`canonMax` are themselves `γ`-invariant (as `Finset (Finset V)`
values, for `γ : G ≃g G` acting on the ambient index by `X ↦ X.map (bigEquiv γ)` where `bigEquiv γ : Finset V ≃
Finset V := γ.toEquiv.finsetCongr`), which needs (i) `indepFamily`/`domain`/`maximizers`-set invariance under this
outer map (an easy one-level-up repeat of part (a)'s `vertexDeletionIndepSetCount_map_aut` recipe, using
`Equiv.finsetCongr` so `Finset.map_univ_equiv` etc. apply unchanged) and (ii) that `canonMax.map (bigEquiv γ) =
canonMax` given `maximizers` is `γ`-invariant as a *set*, which I have identified the exact Mathlib tools for
(`Finset.apply_sup'_eq_sup'_comp`, `Finset.sup'_comp_eq_image`, `Finset.map_union`) but have **not** wired
together and verified in this cycle — see Remaining obligation. **`exists_aut_invariant_deficient_of_not_weightedHall`
is not proved this route**; no attempt at it is compiled (I removed one `sorry`-containing draft rather than ship
it — the file as returned is 100% `sorry`-free).

### Part (d) — NM (`sectorPairProductNormalizedMatching`)

**Not attempted.** No line of `INV.lean` addresses the sector normalized-matching lemma. This is a full open item,
not a partial one.

## Grades (`SOLUTION-CONTRACT.md` §4 ladder)

| Item | Grade |
|---|---|
| Part (a), all 15 declarations (11–15 above; theorem-labelled: `favorableLeaves_map_aut`, `activeWeight_map_aut`, `transportRel_map_aut`) | **kernel-checked in scratch** (`compiled`; no grade above `compiled` until a governed award closes, per Gate ruling and R29-N-12) |
| Part (b), all 16 declarations (theorem-labelled: `phi_supermodular`, `isMaximizer_union_inter`, `canonMin_isMaximizer`, `canonMax_isMaximizer`) | **kernel-checked in scratch** (`compiled`) |
| Part (c), `exists_aut_invariant_deficient_of_not_weightedHall` | **not attempted / open** — no grade |
| Part (d), NM | **not attempted / open** — no grade |
| (INV) `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` | unchanged: `proved_informal`, STATED (this route neither strengthens nor weakens its grade) |
| (NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` | unchanged: `proved_informal`, STATED |
| (HALL) | unchanged: OPEN |

No certification is strengthened without strengthening its evidence: this route reports every result at exactly
`compiled` (a scratch declaration that type-checks against the kernel, per SOLUTION-CONTRACT §3.9/R29-N-12), never
higher, and does not claim `proved_informal` for anything beyond what Cycle 1 already established at that grade.

## `#print axioms` — every declaration in `INV.lean`

Ran via `scratchpad/c2-U1/LeanProject/LeanProof/AxiomCheck.lean` (`import LeanProof.INV`; requires the top-level
`LeanProof.lean` to also `import LeanProof.INV`, which I appended there — a scratch-only change, not to any frozen
file). `lake build` (8658 jobs) then `lake env lean LeanProof/AxiomCheck.lean`: **exit 0, and every one of the 30
declarations below reports axioms `⊆ {propext, Classical.choice, Quot.sound}`** (the three permitted by
SOLUTION-CONTRACT §2), with **no `sorry`, `admit`, `native_decide`, or extra `axiom` anywhere in `INV.lean`**
(confirmed both by the successful kernel check and the SOLUTION-CONTRACT ban being unenforced-but-unused —
verified by grep-free inspection of the whole file, which was written by me in full in this session and re-read
above line by line):

```
isIndepSet_map_aut                       [propext, Classical.choice, Quot.sound]
neighborFinset_map_aut                   [propext, Classical.choice, Quot.sound]
isGraphLeaf_map_aut                      [propext, Quot.sound]
support_spec                             [propext, Classical.choice, Quot.sound]
support_map_aut                          [propext, Classical.choice, Quot.sound]
tagWitnesses_map_aut                     [propext, Classical.choice, Quot.sound]
mem_leafSet_iff                          [propext, Classical.choice, Quot.sound]
leafSet_map_aut                          [propext, Classical.choice, Quot.sound]
vertexDeletionIndepSetCount_map_aut      [propext, Classical.choice, Quot.sound]
isFavorableAt_map_aut                    [propext, Classical.choice, Quot.sound]
favorableLeaves_map_aut                  [propext, Classical.choice, Quot.sound]
activeWeight_map_aut                     [propext, Classical.choice, Quot.sound]
map_map_symm_self                        [propext, Quot.sound]
transportRel_map_aut_mp                  [propext, Classical.choice, Quot.sound]
transportRel_map_aut                     [propext, Classical.choice, Quot.sound]
covered_union                            [propext, Classical.choice, Quot.sound]
covered_inter_subset                     [propext, Classical.choice, Quot.sound]
cov_submodular                           [propext, Classical.choice, Quot.sound]
supply_modular                           [propext, Classical.choice, Quot.sound]
phi_supermodular                         [propext, Classical.choice, Quot.sound]
isMaximizer_union_inter                  [propext, Classical.choice, Quot.sound]
domain_nonempty                          [propext, Classical.choice, Quot.sound]
maximizers_nonempty                      [propext, Classical.choice, Quot.sound]
le_maxPhi_of_mem_domain                  [propext, Classical.choice, Quot.sound]
mem_domain_union                         [propext, Classical.choice, Quot.sound]
mem_domain_inter                         [propext, Classical.choice, Quot.sound]
isMaximizer_union                        [propext, Classical.choice, Quot.sound]
isMaximizer_inter                        [propext, Classical.choice, Quot.sound]
canonMin_isMaximizer                     [propext, Classical.choice, Quot.sound]
canonMax_isMaximizer                     [propext, Classical.choice, Quot.sound]
```

(`isGraphLeaf_map_aut` and `map_map_symm_self` happen not to route through `Classical.choice`; harmless.)

## Exact dependency diagram

```
Main.lean (frozen, C1-LA1)
  ├─ C4LA1.* , C5LA1.* , E993Interior.taggedFamily   (entries 1–13, 18)
  └─ E993Transport.{indepFamily, tagWitnesses, activeWeight, layerWeight,
                     favorableLeaves, transportRel, IsSaturatingFlow, WeightedHall}

INV.lean (this route, scratch)
  adj:= γ.map_rel_iff (Mathlib RelIso, unauthored)
   └─ isIndepSet_map_aut
        ├─ neighborFinset_map_aut ──┐
        ├─ isGraphLeaf_map_aut      │
        │     └─ support_spec       │
        │          └─ support_map_aut
        │                └─ tagWitnesses_map_aut ◄──┘
        ├─ mem_leafSet_iff → leafSet_map_aut
        ├─ vertexDeletionIndepSetCount_map_aut
        │     └─ isFavorableAt_map_aut
        │           └─ favorableLeaves_map_aut  ★(a1, named node)
        ├─ activeWeight_map_aut  ★(a2)              [uses tagWitnesses_map_aut]
        └─ map_map_symm_self, transportRel_map_aut_mp
              └─ transportRel_map_aut  ★(a3)         [uses neighborFinset_map_aut]

  covered, cov, supply, phi                          (independent of Part (a))
   ├─ covered_union, covered_inter_subset
   │     └─ cov_submodular
   ├─ supply_modular
   │     └─ phi_supermodular  ★(b1, supermodularity)
   │           └─ isMaximizer_union_inter
   │                 ├─ domain, domain_nonempty, maxPhi, maximizers, maximizers_nonempty
   │                 │     └─ le_maxPhi_of_mem_domain, mem_domain_union, mem_domain_inter
   │                 └─ isMaximizer_union, isMaximizer_inter
   │                       └─ canonMin_isMaximizer, canonMax_isMaximizer  ★(b2, lattice)

  [NOT PRESENT: any link from Part (a) into Part (b) — i.e. no automorphism-invariance
   of covered/cov/supply/phi/domain/maximizers/canonMin/canonMax is proved. This missing
   link is exactly (c)'s gap.]
```

## Draft contracts (not award-ready; scratch only, no `THEOREM-CONTRACT.yaml` produced)

No award is proposed this route (nothing here registers or closes a key), so no formal
`THEOREM-CONTRACT` is written. If a future cycle awards a subset, the natural terminal candidates and their exact
carried-definition needs are:

- **`favorableLeaves_map_aut`** — terminal `theorem`, needs entries 1–6, 8, 13, 18 of `Main.lean` (the `C4LA1`/
  `C5LA1` leaf/support/count layer) plus this route's `isIndepSet_map_aut`, `mem_leafSet_iff`, `leafSet_map_aut`,
  `vertexDeletionIndepSetCount_map_aut`, `isFavorableAt_map_aut` as companions (no certificate of their own,
  R29-N-12).
- **`activeWeight_map_aut`** — needs additionally entry 15–16-equivalent (`tagWitnesses`, `activeWeight`) plus
  `neighborFinset_map_aut`, `support_spec`, `support_map_aut`, `tagWitnesses_map_aut`.
- **`transportRel_map_aut`** — needs `transportRel` (entry 19-equivalent) plus `neighborFinset_map_aut`,
  `map_map_symm_self`, `transportRel_map_aut_mp`.
- **`phi_supermodular`** — self-contained given `activeWeight`/`transportRel`/`indepFamily`; companions
  `covered_union`, `covered_inter_subset`, `cov_submodular`, `supply_modular`.
- A hypothetical **INV award** would need all of the above plus the still-missing (c) content.

## Route verdict

`compiled` — 27 lemmas and 3 theorem-labelled targets (all of item 5(a) verbatim, plus item 5(b) in full including
the canonical `X_min`/`X_max` construction) are kernel-checked in scratch, sorry-free, axiom-clean. Item 5(c) (the
tree-specialization deficient-cut existence theorem) and item 5(d) (NM) are **not** compiled. `compiled` is the
correct verdict word because a compiled scratch declaration carries no grade above `compiled` until a governed
award closes (Gate ruling; R29-N-12), and because the obligation's numbered items (c) and (d) are incomplete —
this is not a `proved`/`proved_conditional` route.

`headline_resolved: no`

## Remaining obligation

Written as what a successor inherits, in the exact order to attempt:

1. **`bigEquiv γ := γ.toEquiv.finsetCongr : Finset V ≃ Finset V`** (`Equiv.finsetCongr`, confirmed to exist and to
   satisfy `finsetCongr_apply : e.finsetCongr s = s.map e.toEmbedding` in the pinned Mathlib). Re-run the
   `vertexDeletionIndepSetCount_map_aut` recipe **one level up** (`Finset.map_univ_equiv`, `Finset.powersetCard_map`,
   `Finset.filter_map`, closed with `isIndepSet_map_aut` — already proved — rather than re-deriving independence)
   to get `indepFamily_map_aut : (indepFamily G j).map (bigEquiv γ).toEmbedding = indepFamily G j` for every `j`. I
   attempted this in-session and it needs care: the filter condition after peeling one `Finset.powersetCard_map`/
   `Finset.filter_map` layer closes by `isIndepSet_map_aut` directly (unlike the vertex-level proof, no fresh
   argument is needed) — the one wrong turn I made was conflating `(bigEquiv γ).toEmbedding` with
   `(Finset.mapEmbedding γ.toEquiv.toEmbedding).toEmbedding`; these have the same underlying function
   (`mapEmbedding_apply` + `Equiv.finsetCongr_apply`, both `rfl`-adjacent) but are different bundled terms, so the
   bridge needs the same `simp [...]`-not-`rfl` discipline part (a) already established.
2. `domain_map_aut`, `maximizers` set-invariance: `X ∈ domain G p ↔ X.map (bigEquiv γ).toEmbedding ∈ domain G p`
   (from (1)); `phi_map_aut : phi G (favorableLeaves G p) p (X.map (bigEquiv γ).toEmbedding) = phi G
   (favorableLeaves G p) p X` (from `favorableLeaves_map_aut`, `activeWeight_map_aut`, `transportRel_map_aut`, (1),
   and `Finset.sum_map`); then `X ∈ maximizers G (favorableLeaves G p) p ↔ X.map (bigEquiv γ).toEmbedding ∈
   maximizers G (favorableLeaves G p) p`, hence (applying this with both `γ` and `γ.symm`) `(maximizers).image
   (fun Y => Y.map (bigEquiv γ).toEmbedding) = maximizers` as **Finsets**, not just an iff.
3. **`canonMax.map (bigEquiv γ).toEmbedding = canonMax`** (and symmetrically for `canonMin`): chain
   `Finset.apply_sup'_eq_sup'_comp` (`g (s.sup' H f) = s.sup' H (g∘f)` given `g` distributes over `⊔`, which
   `Finset.map_union` supplies for `g := Finset.map (bigEquiv γ).toEmbedding`) with `Finset.sup'_comp_eq_image`
   (reindexing a `sup'` along an image) and the set-equality of (2). Both lemma names are confirmed present in the
   pinned Mathlib (`Mathlib/Data/Finset/Lattice/Fold.lean`); I did not wire the three-step `calc` together and
   verify it compiles.
4. **The `X_min` positivity property** (`∀ B ∈ canonMin, 0 < activeWeight G F B`), needed for the target theorem's
   third conjunct: for `B ∈ canonMin` with `activeWeight G F B = 0`, show `canonMin \ {B}` is *also* a maximizer
   (`supply` unchanged, `cov` monotone-non-increasing under removing a source — needs one new monotonicity lemma
   `covered_subset_of_subset : X' ⊆ X → covered G p X' ⊆ covered G p X`, immediate from the definition, not yet
   written), contradicting `canonMin ⊆ canonMin \ {B}` forced by `canonMin`'s definition as the meet of every
   maximizer.
5. Assemble **`exists_aut_invariant_deficient_of_not_weightedHall`** at the exact binder text
   `cycles/cycle-1/stage5/adjudicators/U/ADJUDICATION.md` "Award group 2" gives, taking `X := canonMax` (not
   `canonMin` — the target wants a *large*, positive-`φ` invariant witness family, `φ(canonMax) = maxPhi ≥
   φ(X₀) > 0` from `¬ WeightedHall`'s witness `X₀`) for the deficiency clause, and `canonMin`'s positivity result
   (4) does not directly transfer to `canonMax`'s members — **this needs re-checking**: confirm which of
   `canonMin`/`canonMax` the positivity property actually holds for before assembling the final theorem (the
   Cycle 1 record states positivity for `X_min` specifically; whether `X_max`, the natural deficiency witness,
   inherits it is exactly the point a successor must settle first, possibly by using `canonMin` as the deficient
   witness instead if `φ` is monotone enough, or by proving positivity separately for `canonMax`).
6. **Part (d), NM** (`sectorPairProductNormalizedMatching`): fully open, not started. The registered statement
   (P5 of `cycles/cycle-1/stage6/SYNTHESIS.md`): for `Q` independent with `G − N_G[Q]` an induced perfect matching
   on `N` edges, `k·|X| ≤ 2(N−k+1)·|∂_Q X|` for every `X ⊆ S^Q_{|Q|+k}`, `k ≥ 1`. The informal proof is closed
   (biregular double counting, `Finset.card_mul_le_card_mul`) per C1-LA4; no Lean text exists for it anywhere in
   this run's sources.

## Artifact inventory

All under `scratchpad/c2-U1/LeanProject/` (scratch; nothing under `sources/` was written; no other experiment
root was touched):

| file | role | sha256 |
|---|---|---|
| `LeanProof/Main.lean` | byte-copy of C1-LA1's frozen award text (unmodified) | `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` |
| `LeanProof/INV.lean` | this route's work (parts a, b; no sorry) | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` |
| `LeanProof/AxiomCheck.lean` | the `#print axioms` driver | `5c135a8b9e1559b289294e2ab8cbad04d360950ae61085c83f3e5cbcdf46eeca` |
| `LeanProof.lean` | root module; I appended `import LeanProof.INV` (scratch-only edit) | `093353ceb220f986c569d0fc8db06f3f889cf9270694ddb74a3488b279e055fe` |
| `.lake/packages` | manual symlink to the pinned shared Mathlib | — (symlink, not copied) |

Copy-out-first replay (per worker-common-brief item 7): `scratchpad/c2-U1-replay/{INV.lean,AxiomCheck.lean,REPLAY.md}`
(sha256 of `INV.lean` and `AxiomCheck.lean` there match the table above exactly — verified identical). Replay
command is given in full in `REPLAY.md`; in short: copy the frozen `LeanProject`, drop in the two replay files,
append the one import line, symlink `.lake/packages`, then `lake build && lake env lean
LeanProof/AxiomCheck.lean`. All `lake`/`lean` invocations in this route ran in the **foreground**; no background
job was ever started, so none needed to be killed.

## Fences held

Graph-generic throughout (no `IsTree`); no eligibility hypothesis anywhere; no sign content (`φ`'s sign is
discussed only abstractly — "Hall violator means `φ(X) > 0`" — never evaluated on any concrete graph, so nothing
about `S(T,p)` or the primary aggregate is touched); no RTree wording; no closed region re-proved; no census value
(no census at all); no refuted mechanism revived (checked by name above); sealed roots (`sources/`, the
lower-region/first-interior/r24–r29 roots, the master ledger, the public repository) never read outside the
explicitly authorized frozen copies, never written.
