# Critique

Critic `C-U1-F` (orientation F, falsify) of the U1 return (`C2-U-01 LEAN-INV-AND-SECTOR-FORMALIZATION`), r30 Cycle 2 Stage 4.

Boot: I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. The harness put the root `CLAUDE.md` and
the user auto-memory index into context at session start. I did not open either as a source, and nothing below relies on them.

Read-boundary disclosures (none of them bears on the mathematics):
1. I ran a non-recursive `ls -la` on `scratchpad/c2-U1-replay/`. That directory is listed in the return's inventory but is not under
   my grant (`scratchpad/c2-U1/`). I saw file names and sizes only. I read no content from it and used nothing from it.
2. I read the shared Mathlib project's `lean-toolchain` and `lake-manifest.json`, listed its root non-recursively, and ran `git
   rev-parse HEAD` on the project root and on `.lake/packages/mathlib`. I did this only to check the pin.
3. I did not read `runs/` (C1-LA1's award directory), `cycles/cycle-1/**`, any other return, any critique or any adjudication.
   No search tool was run above my grant.

## Identity and seal audit

- Dispatch `control/dispatch/c2-stage4/DISPATCH-C-U1-F.md`: SHA-256 `0e14008c…3641e923`, which matches the wrapper.
- **Capsule seal** `control/c2-critic-capsules/U1-PACKET-MANIFEST.json`: I recomputed it canonically (sort_keys, `(",",":")`, no
  trailing newline, `seal_sha256` removed) and got `adc5015e1c5b34231db7c06c3102ad65d84f488ed76cebc55cb6d4b5163e8635`, which
  matches. All 13 members match their bytes and SHA-256.
- Stage 4 dispatch manifest seal `a361cd17…8da383`: recomputed, matches. Stage 3 packet manifest seal `4254492f…0b2d`: recomputed,
  matches. Stage 2 seal `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`: recomputed, matches.
- `control/C2-STAGE3-READ-BOUNDARY-DISCLOSURES.json` is not a capsule member. I did not read the U1 dispatch or the worker brief.
  The return itself discloses two boundary slips: a `find` under `skills/optimization-loop`, and an `ls -la` of the run root. Both
  involved names only, both are self-reported, and neither bears on the mathematics.
- Return digests that I replayed: `INV.lean` `174d84c3…f9f9` (18,816 B), `AxiomCheck.lean` `5c135a8b…eeca`, `LeanProof.lean`
  `093353ce…55fe`, and `Main.lean` `86b59c6c…e0cb` (45,610 B). The copy of each in `scratchpad/c2-U1/LeanProject/` matches exactly.
- **What I cannot certify from inside my grant:** that `86b59c6c…` is C1-LA1's frozen `runs/…/Main.lean`, since `runs/` is not
  readable to me. Instead I did the protocol's byte-compare against the frozen first-interior source:
  - All 13 carried definitions in U1's `Main.lean` occur byte-identically in `sources/first-interior/c2-primary-v2/…/Snippets/`.
    These are first-interior fragments 0001–0006, 0008–0013 and 0018 (`IsGraphLeaf`, `support`, `leafSet`, `H`, `R`, the counts,
    `aggregate`, `taggedFamily`, …).
  - Fragments 0007 (`leafDegree`) and 0014–0017 (`crossingIndex`, `Erdos993G1.*`) are not carried. That is admissible, because
    none is used.
  - The eight `E993Transport` definitions (entries 14–21 of that file) equal `SOLUTION-CONTRACT.md` §2 up to `noncomputable`,
    docstrings, and `open Classical in` on `favorableLeaves`/`WeightedHall`.
- **Pin.** The toolchain is `leanprover/lean4:v4.32.2`. `lake-manifest.json` and `.lake/packages/mathlib` HEAD are both
  `905b95818eb32af7874a58b427f50c1711a5e96c`, which equals `sources/mathlib-binding/PIN.json`. The return's recipe `git -C <shared
  project> rev-parse HEAD` fails on the shared project root ("unknown revision"). The value is right but the stated method is not
  (see Certification audit).

## Independent re-derivation

**Lean rebuild (copy-out-first).**
- I copied `LeanProject/{LeanProof.lean,lakefile.toml,lean-toolchain,lake-manifest.json}` and `LeanProof/{Main,INV,AxiomCheck}.lean`
  into `scratchpad/c2-crit-U1-F/LeanProject/`.
- I bound `.lake/packages` by a manual `ln -sfn` to the shared project. There was no `lake update`, no `lake clean` and no install.
  Every command ran after `cd` into the copied project.
- `lake build LeanProof.INV` completed successfully with 8656 jobs, 0 errors, and linter warnings only.
- `lake env lean LeanProof/AxiomCheck.lean` exited 0. All 30 `lemma`/`theorem` declarations report axioms ⊆ `{propext,
  Classical.choice, Quot.sound}`. `isGraphLeaf_map_aut` and `map_map_symm_self` report `[propext, Quot.sound]`. The output is
  identical to the return's table.
- `INV.lean` contains no `sorry`, `admit`, `native_decide`, `decide` or `axiom` (grep over my copy).

**Statement fidelity (read against SOLUTION-CONTRACT §2 and SEMANTIC-CONTRACT §1.2).**
- `favorableLeaves_map_aut` is a **Finset equality**: `(favorableLeaves G p).map γ.toEquiv.toEmbedding = favorableLeaves G p`. It
  holds at every `p`. It is not merely membership transport.
- `activeWeight_map_aut` maps both `F` and `B` (`activeWeight G (F.map γ) (B.map γ) = activeWeight G F B`) under `hF : ∀ v ∈ F,
  IsGraphLeaf G v`. The registered INV needs `F` fixed at `F_p(G)`. That fixed form needs the composition with
  `favorableLeaves_map_aut`, which **U1 does not perform**. I performed it (`activeWeight_fav_map_aut`, below); it compiles.
- `transportRel_map_aut` is a genuine iff, obtained from `_mp` at `γ` and at `γ.symm`. The (S) branch transports `u ∉ B`, `|N(u) ∩
  B| = 2` and `A = insert u (B \ N(u))` literally. The relation is the carried `transportRel`, neither wider nor narrower.
- `phi X = supply X − cov X`, where `covered` is `(indepFamily G p).filter (∃ B ∈ X, transportRel G B A)` and `domain =
  (indepFamily G (p+1)).powerset`. These are exactly (HALL-COND)'s `N(X)` and `X ⊆ I_{p+1}`.
- `phi_supermodular` states `φ(X) + φ(Y) ≤ φ(X ∪ Y) + φ(X ∩ Y)`, which is the right direction. The ingredients are:
  - `supply` modular, by `sum_union_inter`;
  - `cov` submodular, from `N(X∪Y) = N(X) ∪ N(Y)` (exact) and `N(X∩Y) ⊆ N(X) ∩ N(Y)`, using ℕ-valued weights ≥ 0.
  - The casts to ℤ are sound, and `linarith` closes the goal.
- `isMaximizer_union_inter` carries the upper-bound hypotheses `hub`, `hub'`. These do not encode the conclusion: they are
  discharged by `le_maxPhi_of_mem_domain` in `isMaximizer_union/inter`.
- `canonMin := maximizers.inf' id` and `canonMax := maximizers.sup' id`. Nonemptiness is discharged: `maximizers_nonempty` comes
  from `exists_mem_eq_sup'` on `domain_nonempty` (`∅ ∈ domain`).
- No declaration uses `IsTree` or eligibility. The work is graph-generic, as INV's informal DAG requires.

**Fidelity of the weight and relation carried.**
- `activeWeight` counts `v ∈ F ∩ B` with `¬Disjoint (B.erase v) (tagWitnesses G v)`, where `tagWitnesses = N(s_v) ∖ {v}`. These
  are ACTIVE tags, not tags merely present.
- `favorableLeaves` filters `leafSet` by `IsFavorableAt G v p` (`Δ_p(G − v) < 0`), at the original rank `p` on the original graph.
- The fidelity check passes.

**Independent numeric instrument (mine; `net_instrument.py`, stdlib and exact integers).** It is built from SEMANTIC-CONTRACT §1.2
alone. It checks the tree property by edge count plus connectivity and computes `x` through rank `α` (terminal difference included).
It selects `F` from `Δ_p(G − v)` on the original graph and uses literal `w_F` and (D) ∪ (S). It asserts `supply − capacity = S`
with `S` computed independently from `q_v(j) = i_j(G − H_v) − i_j(G − R_v)`. It then computes the least and greatest maximizers of
`φ` by a max-closure min cut: X_min is the residual reachable set from `s`, and X_max is the complement of the set that can reach `t`.

| graph | n | α | x | p | eligible | F | supply | capacity | S | arcs | maxflow | maxφ | \|X_min\| (w=0) | \|X_max\| (w=0) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `K_{1,12}` | 13 | 12 | 6 | 8 | yes | 12 | 1980 | 3960 | −1980 | 1980 | 1980 | 0 | 0 (0) | 0 (0) |
| path-star `(2,3,4)` | 15 | 11 | 5 | 7 | yes | 10 | 1483 | 2701 | −1218 | 2025 | 1483 | 0 | 0 (0) | 0 (0) |
| `P_3 ⊔ K_{6,3,3,3}` (not a tree) | 18 | 8 | 3 | 4 | no | 2 | 46 | 48 | −2 | 393 | 36 | 10 | 20 (0) | 71 (**51**) |

- The first two rows reproduce the common brief's fixed points exactly: counts, `x`, `α`, `|F|`, supply, capacity, `S`, flow, and
  2025 arcs.
- The last row is the known non-tree separating instance (`S ≤ 0`, Hall fails). I use it only because INV's lemmas are
  graph-generic.
- All numbers are `bounded_computation`.

## Attacks and findings

**F-1: U1's plan for item (c) is wrong. X_max is not a positive-weight witness, and X_min is the right witness.** This settles the
attack brief's question on paper.
- **Claim.** If `w(B) = 0` and every `A ∈ N({B})` has `w(A) = 0`, then for every maximizer `X` we have `φ(X ∪ {B}) = φ(X) −
  Σ_{A ∈ N(B) ∖ N(X)} w(A) = φ(X)`. So `X ∪ {B}` is a maximizer and `B ∈ X_max`.
- **Tag-free sources satisfy the hypothesis.** Take any source with `B ∩ F = ∅`. Then `w(B) = 0`. Every target of `B` has no tag
  either: a deletion only removes vertices, and a switch inserts a `u` with two neighbours in `B`, which a degree-one tag cannot
  have. So all targets of `B` have weight 0. Hence **`X_max ⊇ {B ∈ I_{p+1} : B ∩ F = ∅}` always**, whatever the sign of `maxφ`.
- **This is not vacuous on trees.** On `CB(8, 92)` the 736 supports `b_ij` form an independent tag-free set of size ≥ `p + 1 = 493`.
- **Measured.** On `P_3 ⊔ K_{6,3,3,3}` at `p = 4`, 51 of X_max's 71 members have weight 0.
- **X_min works.** It has positivity: deleting a weight-0 member keeps `supply` and does not increase `cov`, so the result is still
  a maximizer. That contradicts leastness. It is also equally deficient, because `φ(X_min) = φ(X_max) = maxφ`.
- **Where U1 goes wrong.** Remaining-obligation item 5 says to take `X := canonMax` because "the target wants a large, positive-φ
  witness". It then suggests `canonMin` might work "if φ is monotone enough". Neither point is right: no monotonicity is needed,
  since `canonMin_isMaximizer` already gives `φ(canonMin) = maxφ`.
- **Answer to the brief's question.** The positivity conjunct holds for X_min only, and U1's stated plan (canonMax) is inconsistent
  with it. I have not read Award group 2's binder text; it is outside my grant.

**F-2: The item (c) step that U1 left open is closed in scratch (critic-derived; see Remaining obligation).** File
`scratchpad/c2-crit-U1-F/LeanProject/LeanProof/CritAdvance.lean`, SHA-256 `f59126da…d697`. It imports U1's `INV.lean` and the
frozen `Main.lean`, both unchanged. `lake build` completed successfully with 8659 jobs. `#print axioms` for all 10 new
declarations gives `[propext, Classical.choice, Quot.sound]`. There is no `sorry`, `admit`, `native_decide` or `decide`. The
terminal statement, as `#check` prints it:

```lean
exists_aut_invariant_deficient_of_not_weightedHall : ∀ {V} [Fintype V] [DecidableEq V] (G : SimpleGraph V)
  [DecidableRel G.Adj] (p : ℕ), ¬WeightedHall G (favorableLeaves G p) p →
    ∃ X ⊆ indepFamily G (p + 1),
      (∀ (γ : G ≃g G), Finset.map (liftAut G γ) X = X) ∧
      ∑ A ∈ indepFamily G p with ∃ B ∈ X, transportRel G B A, activeWeight G (favorableLeaves G p) A <
        ∑ B ∈ X, activeWeight G (favorableLeaves G p) B ∧
      ∀ B ∈ X, 0 < activeWeight G (favorableLeaves G p) B
```

- The companions are `liftAut`, `indepFamily_map_aut`, `activeWeight_fav_map_aut` (with `F` FIXED), `covered_map_aut` (`N(γX) =
  γN(X)`), `phi_map_aut`, `mem_maximizers_map_aut`, `canonMin_subset`, `canonMin_map_aut`, `covered_mono` and `canonMin_pos`.
- **Invariance route.** It does not use the `apply_sup'_eq_sup'_comp` chain that U1 planned. Instead: `canonMin.map γ` is a
  maximizer, so `canonMin ⊆ canonMin.map γ`, and equal cardinality then gives equality.
- The invariance holds under every automorphism at once, so under the whole of `Aut(G)`.
- The theorem is graph-generic. "Tree specialization" is a misnomer, since trees are an instance.
- Grade: `compiled`, and nothing higher (R29-N-12). My statement may differ in binder text from the Cycle 1 Award-group-2 draft,
  which I have not read.

**F-3: Minor misstatements in the return.**
- Part (a) is not "11 lemmas + 1 theorem-labelled target": it is 12 `lemma` + 3 `theorem`.
- Part (b) is not "16 declarations": it is 11 `lemma` + 4 `theorem` (15 proof declarations) + 9 `def`s.
- "None of INV.lean's 30 declaration names" omits the 9 definitions (39 names in all).
- "Entries 1–13, 18, 42" mixes two numberings. C1-LA1's file has 36 entries and no entry 42. In first-interior numbering, 1–13
  would include `leafDegree`, which is not carried.
- The draft contract for `favorableLeaves_map_aut` lists entries 5, 8 and 13 (support, `R`, `taggedFamily`), which are not needed.
  Its true dependencies are 1–4, 6 and 18.

**F-4: Naming.** The return writes "per C1-LA4" (Remaining obligation item 6). No award C1-LA4 exists; this run's only awards are
C1-LA1 and C1-LA2. NM's informal proof lives in the Cycle 1 route and critique record, not in an award. I record the slip.

**F-5: Attacks that found nothing.**
- No hypothesis encodes a conclusion.
- There is no natural-number subtraction hazard: `phi` is in ℤ, and `canonMin_pos` uses `omega` on ℕ facts only.
- The quantifiers range over all `X ⊆ I_{p+1}` via `domain`. No whole-layer inequality is presented as (HALL-COND).
- There is no circularity, and no step assumes `S ≤ 0`.
- The decidability-instance difference between `covered` (`open scoped Classical`) and `WeightedHall` (`open Classical in`) is
  real. It is bridged by `convert` in my theorem, and it is harmless.

## Mechanism-equivalence and fence check

- U1 proposes no transport mechanism. Its declarations are automorphism-equivariance facts about the frozen definitions plus a
  generic supermodularity/lattice argument for `φ`.
- None of the ten refuted keys is revived: no deletion-only Hall, no Delete/Retag relation, no unit capacity, no per-leaf
  injectivity, no occupancy domination, no signed cross-tag, no covariance.
- No closed region or settled family is re-proved.
- There is no census, no RTree wording, and no use of the controller's prior.
- (LIFT) is not invoked. Neither U1 nor my advance supplies quotient feasibility or the budget.
- Nothing touches (HALL) or the primary aggregate. My F-2 theorem reduces (HALL-COND) to `Aut(G)`-invariant families. It is a
  sub-node of INV, which is registered `proved_informal`. It is not a Hall theorem and not a cut.

## Certification audit

- **Backed by my replay:** `compiled`; "sorry-free"; zero errors; the 30-row `#print axioms` table (verbatim); all four file
  digests; the byte-copy of `Main.lean` within U1 scratch; the Mathlib revision value.
- **Not verifiable inside my grant (flagged, not struck):** "`86b59c6c…` matches C1-LA1's award receipts". The entries I could
  byte-compare do match the first-interior snippets and the contract text.
- **Struck:**
  - The counts "11 lemmas + 1 theorem-labelled target" (Part (a)) and "16 declarations" (Part (b)).
  - "Entries 1–13, 18, 42" as a description of what is carried.
  - The `git -C <shared project> rev-parse HEAD` provenance, which fails as written. The value is correct via
    `.lake/packages/mathlib`.
  - The citation "C1-LA4".
  - The section headings' "all proved". The correct word is `compiled`, which the Grades table does use.
- **Grades:** U1 holds `compiled` everywhere in its Grades table and its verdict. The only "proved"/"verified" wordings are the two
  headings and "verified by grep-free inspection". None of them raises a claim's grade.
- **Remaining obligation:** items 1–3 are exact. Item 4 is correct. Item 5 is wrong on the witness (F-1). Item 6 is correct in
  substance, apart from the C1-LA4 slip.

## Verdict

verdict: retained_narrowed
headline_resolved: no

Parts (a) and (b) of the return stand as `compiled` scratch declarations. They replay exactly, are axiom-clean, faithful to the
frozen definitions, and graph-generic. The narrowing covers three things:
- the struck certification literals;
- the correction of Remaining-obligation item 5, where the witness is `canonMin`, not `canonMax`, and `X_max` provably contains
  weight-0 sources;
- the note that `activeWeight_map_aut` alone does not give weight invariance with `F` fixed.

The critic-derived advance F-2 compiles the item (c) node in scratch. Its mathematics is INV's already-registered `proved_informal`
content, and I judge the reduction "¬(HALL-COND) ⇒ an `Aut(G)`-invariant, positive-weight deficient family" complete at
`proved_informal`. Its formal grade is `compiled` only, pending a governed award. Nothing here resolves (HALL).

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

1. **(c), done in critic scratch; to be adopted or re-proved by a Stage 7 award.** `exists_aut_invariant_deficient_of_not_weightedHall`
   as stated in F-2, witness `canonMin`. The successor must first compare the statement with the Cycle 1 Award-group-2 binder text
   and adapt it if the binders differ. The critic-derived attribution travels with it.
2. **INV's quotient half is not formalized.** This is "Hall on `Γ`-orbit unions ⇔ quotient Hall" for an admissible `Γ ≤ Aut(G)`,
   with (⇐) being (LIFT) in Hall form. It needs orbit-quotient definitions that do not exist in `E993Transport`. F-2 gives only
   "Hall ⇔ Hall on `Aut(G)`-invariant families". The trivial direction is a one-liner and is not compiled.
3. **(d) NM `sectorPairProductNormalizedMatching` is untouched.** No Lean text exists. The registered statement is P5: `k·|X| ≤
   2(N − k + 1)·|∂_Q X|` on the sector over an induced perfect matching.
4. **Governed award.** A byte-identity receipt of `Main.lean` against C1-LA1's `runs/` copy is needed; I could not read it. A
   terminal theorem should be chosen, with the rest as companions (R29-N-12).

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-crit-U1-F/`. No
background job was started, so none needed to be killed.

| file | role | sha256 |
|---|---|---|
| `seals.py` | canonical seal and member-digest recomputation | `8cb39f484809d1a1b006280865ee6f679cab90019e14d6130ec1dc5f7da8fdad` |
| `net_instrument.py` | independent network, WID-assert and max-closure X_min/X_max instrument | `1f6b4517dc34bf33b546f198bfe1230a94b0bd9e4319ff1c2e4c922274673631` |
| `net_results.json` | its three rows | `825112b05de9c084285ef120318ba26dd8f697d4d9e6e420228f1738ec1ffb36` |
| `LeanProject/LeanProof/Main.lean` | copy of U1's carried `Main.lean` | `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` |
| `LeanProject/LeanProof/INV.lean` | copy of U1's file (replayed) | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` |
| `LeanProject/LeanProof/AxiomCheck.lean` | copy of U1's axiom driver | `5c135a8b9e1559b289294e2ab8cbad04d360950ae61085c83f3e5cbcdf46eeca` |
| `LeanProject/LeanProof/CritAdvance.lean` | critic-derived item (c) | `f59126da1d3296c407f29c25fbfb7a9543755b80348d154315ebf5d9e896d697` |
| `LeanProject/LeanProof/CritAxioms.lean` | axiom and `#check` driver for the advance | `dd446005035d0ee7030b0499b4654a888116afc5e4bf6d433001cbc68068d092` |
| `LeanProject/LeanProof.lean` | root, with `import LeanProof.CritAdvance` appended (scratch) | `ec6576522547088d9866667e98f44c0b7f5b079e3ef58c64ef266db23ec1d123` |
| `build-INV.log`, `axioms-U1.log` | U1 replay: build and `#print axioms` | `e363d14d…a4`, `65d609f6…995` |
| `crit-build.log`, `crit-axioms.log` | advance build and `#print axioms` | `d1cef812…40e0f`, `8b3e9b41…a549a` |
| `crit-compile.log` | first `lake env lean -o /dev/null` attempt. It elaborated with no errors; the exit code 1 was the sandbox refusing to write `/dev/null`. Superseded by `crit-build.log` | `36b3f57f…dd32` |
| `.lake/packages` | manual symlink to `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages` | — |
