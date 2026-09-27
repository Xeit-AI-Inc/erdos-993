# Critique

Critic `C-U1-T` (orientation T, prove), r30 Cycle 2 Stage 4. Assigned return: seat `U1`, route
`C2-U-01 LEAN-INV-AND-SECTOR-FORMALIZATION` (orientation U). Run root
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26`.

**Boot acknowledgment.** I am operating within VerityOS. For the boot I read exactly two files:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I read no
other VerityOS file. The harness put the root `CLAUDE.md` and the user auto-memory index into my context at session
start. I did not open either as a source, and nothing below relies on them.

**Read-boundary statement.** My reads were the dispatch, the 13 capsule members, U1's inventoried scratch artifacts
(`scratchpad/c2-U1/LeanProject/`, `scratchpad/c2-U1-replay/`), and frozen sources under `sources/`
(`first-interior/c2-primary-v2/.../Main.lean` and `Snippets/`, `c1-stage7-sources/U2-Main.lean`,
`mathlib-binding/PIN.json`). I also used Mathlib source files in the pinned shared project to confirm lemma names. The
only listings I ran were non-recursive: U1's scratch directories, `sources/c1-stage7-sources/`, and my own critique
directory. When I created the critique directory, a plain `ls` of `cycles/cycle-2/stage4/critics/U1/` showed that a
sibling directory `F/` exists. I did not open it. I ran no `find`/`grep`/`rg` rooted above my grant. I had no network
access and installed nothing. I did not read `runs/`, the Cycle 1 adjudications or synthesis, any other return or
critique, or any other experiment root.

## Identity and seal audit

- Dispatch `control/dispatch/c2-stage4/DISPATCH-C-U1-T.md`: SHA-256 `5ecb3fecbee157922991bceb1755cc6ecad6eae81c12dc1b63f52cd402b2aeb6`.
  This matches the wrapper's digest, and I checked it before reading.
- **Capsule seal** (`control/c2-critic-capsules/U1-PACKET-MANIFEST.json`, recomputed canonically: key-sorted, `(",", ":")`,
  no `seal_sha256`, no trailing newline) = **`adc5015e1c5b34231db7c06c3102ad65d84f488ed76cebc55cb6d4b5163e8635`**, which matches.
  All 13 members match on SHA-256 and on byte count.
- Stage 4 dispatch manifest seal recomputed = `a361cd175e7c3968cdf2a8d14f92e9b2b5883b018bd72e837f54f26ce38da383` (matches its field).
  Stage 3 packet manifest seal recomputed = `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d` (matches). The Stage 3 manifest lists
  `cycles/cycle-2/stage3/returns/U1/RETURN.md` at `525d81af…6fccad00`, which is the capsule digest. Stage 2 seal recomputed =
  `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`, which matches the protocol's value.
- Digests the return lists, re-hashed on disk: `INV.lean` `174d84c3…f9f9` (18,816 bytes), `AxiomCheck.lean` `5c135a8b…eeca`,
  `Main.lean` `86b59c6c…e0cb` (45,610 bytes) and `LeanProof.lean` `093353ce…055fe` all match. The replay copies in
  `scratchpad/c2-U1-replay/` are hash-identical. `REPLAY.md` (`59b5bd1d…0704`) is not in the return's table.
- **C1-LA1 carry.** I cannot independently confirm that `86b59c6c…` is C1-LA1's award file, because `runs/` is outside my
  grant and no capsule member carries that digest. I checked what I could reach instead. Registrar entries 1–13 of U1's
  `Main.lean` are **byte-identical** to the first-interior snippets 0001–0006, 0008–0013 and 0018
  (`out-defcmp.txt`), and each entry's header hash equals the snippet's SHA-256. Entries 14–21 (the eight
  `E993Transport` definitions) equal the `SOLUTION-CONTRACT.md` §2 text after whitespace normalization, excluding
  docstrings and the documented `noncomputable`/`open Classical in` wrappers, and appear verbatim in the frozen
  `sources/c1-stage7-sources/U2-Main.lean` (`out-defcmp2.txt`). `INV.lean` redefines no carried declaration. Its nine new
  `def`s are `covered`, `cov`, `supply`, `phi`, `domain`, `maxPhi`, `maximizers`, `canonMin` and `canonMax`.
- **Read-boundary disclosures.** The return self-discloses two slips: a `find` under `VerityOS/skills/` and an `ls -la`
  of the run root. The protocol puts `control/C2-STAGE3-READ-BOUNDARY-DISCLOSURES.json` into the capsule when a seat
  files a disclosure, and my capsule does not carry it. I refer this mismatch to the adjudicator. It does not affect the
  mathematics.
- Model disclosure on the return: chartered Sonnet 5 xhigh, runtime `claude-sonnet-5`. This is consistent with
  `C2-ALLOCATION.md` (routes run Sonnet 5 xhigh).

## Independent re-derivation

**Instrument 1: copy-out Lean rebuild.** I copied U1's project into `scratchpad/c2-crit-U1-T/LeanProject/`. I did not
copy `.lake/build`. I bound Mathlib by manual symlink (`.lake/packages -> …/mathlib-v4.32.2-project/.lake/packages`),
ran `cd` into the project, and ran `lake build`. The build completed successfully (8658 jobs, EXIT 0). `Main` and `INV`
rebuilt from source, with linter warnings only (unused section variables, unused binders); there were no errors. Then
`lake env lean LeanProof/AxiomCheck.lean` returned EXIT 0. All 30 lines match the return's table verbatim:
`isGraphLeaf_map_aut` and `map_map_symm_self` report `[propext, Quot.sound]`, and the other 28 report
`[propext, Classical.choice, Quot.sound]`. `INV.lean` contains no `sorry`/`admit`/`native_decide`/`axiom`/`decide`.
Toolchain `leanprover/lean4:v4.32.2`. The Mathlib rev `905b95818eb3…` is confirmed from `lakefile.toml` and
`lake-manifest.json`. See the certification audit for `git rev-parse`.

**Statement reading against SOLUTION-CONTRACT §2 and SEMANTIC-CONTRACT §1.2.**

- `favorableLeaves_map_aut` is a **Finset equality**, `(favorableLeaves G p).map γ.toEquiv.toEmbedding = favorableLeaves G p`,
  for every `p`, with no leaf, tree or eligibility hypothesis. This is correct and is the right strength.
- `activeWeight_map_aut` maps **both** `F` and `B`, under `hF : ∀ v ∈ F, IsGraphLeaf G v`. That hypothesis is necessary,
  because `support` is `Classical.choose` and unconstrained off leaves. To get invariance with `F = F_p(G)` fixed, it
  must be composed with `favorableLeaves_map_aut` and C1-LA1 entry 24 (`isGraphLeaf_of_mem_favorableLeaves`). **The
  return does not make that composition.** I made it (below).
- `transportRel_map_aut` is a genuine iff. One direction is proved directly; the other applies the same proof to
  `γ.symm` and cancels with `map_map_symm_self`. The (S) witness `u ↦ γ u` keeps `u ∉ B` and
  `|N(u) ∩ B| = 2` (via `Finset.map_inter`, `card_map`). The relation is neither widened nor narrowed.
- `phi X := (supply X : ℤ) − (cov X : ℤ)` uses integer subtraction, so there is no ℕ truncation. `covered` is the filter
  of `I_p` by `∃ B ∈ X, transportRel G B A`, which is SEMANTIC-CONTRACT's `N(X)`. `supply` is modular (exact).
  `covered` preserves unions exactly and maps intersections only to a subset, so `cov` is submodular. Hence
  `phi_supermodular : φ X + φ Y ≤ φ(X∪Y) + φ(X∩Y)`, with the direction correct. It holds over all
  `Finset (Finset V)`, which is more general than `X ⊆ I_{p+1}`.
- `isMaximizer_union_inter` is the pairwise core. Closure of `maximizers` (inside the domain `(I_{p+1}).powerset`) under
  `∪`/`∩` is `isMaximizer_union`/`isMaximizer_inter`. Nonemptiness is discharged: `∅ ∈ domain` gives
  `domain_nonempty`, and `Finset.exists_mem_eq_sup'` gives `maximizers_nonempty`, which `inf'`/`sup'` then consume.
  `canonMin_isMaximizer` and `canonMax_isMaximizer` compile.
- No declaration uses `IsTree`, `crossingIndex` or `indepNum`. I confirmed this by searching my copy of the file. This
  matches SEMANTIC-CONTRACT §1.2's claim that (INV) needs neither.

**Instrument 2: my own Python network, built from SEMANTIC-CONTRACT §1.1–1.2** (`tools/net.py`, standard library,
exact integers). It computes `F_p` from `i_{p+1}(G−v) − i_p(G−v) < 0` on the original graph, the active weight
(`(B∖{v}) ∩ W_v ≠ ∅`), and (D) ∪ (S) literally. It computes `S` independently from `q_v(j) = i_j(H_v) − i_j(R_v)` and
asserts `supply − capacity = S` on every instance. It computes `x` through rank `α`, tests trees for acyclicity and
connectivity, and runs Dinic max-flow. It extracts `X_min` and `X_max` from the residual graph (s-reachable sources and
sources that cannot reach t). Fixed points reproduced:
- `K_{1,12}` at `p = 8`: `α = 12`, `x = 6`, `|F| = 12`, `1980 / 3960`, `S = −1980`, flow 1980.
- Path-star `(2, 3, 4)` at `p = 7`: `n = 15`, `α = 11`, `x = 5`, `|F| = 10`, `1483 / 2701`, flow 1483, `S = −1218`,
  2025 arcs.
- Path-star `(2, 2, 4, 3)` at `p = 8`: `n = 18`, `α = 13`, `x = 6`, `|F| = 12`, `8033 / 13467 / 8033`, `S = −5434`,
  11691 arcs.
- `Δ_0 = n − 1` and `i_2 = C(n, 2) − (n − 1)` are asserted.

These are `bounded_computation`, used only to validate the instrument. The CB and `T_m` fixed points are not reached by
this graph-generic Lean route and were not recomputed. I cross-checked the flow-derived `maxPhi`, `X_min` and `X_max`
against a full `2^20` subset enumeration on `P_3 ⊔ K_{4,2}` at `p = 3`, and they agree exactly (`out-brute.json`).

## Attacks and findings

1. **The step U1 leaves open, item 5(c), is closed at `compiled` grade by the critic (critic-derived advance, C-U1-T).**
   The file is `scratchpad/c2-crit-U1-T/LeanProject/LeanProof/CritINV.lean` (SHA-256 `e6cbd7e6…4ceb`, 11,436 bytes). It
   imports U1's `INV.lean` unchanged on top of the carried `Main.lean`. `lake build` completed (8659 jobs, EXIT 0).
   The file has 2 `def`s and 20 lemma/theorem declarations, with no `sorry`. `#print axioms` gives
   `[propext, Classical.choice, Quot.sound]` for the 12 declarations I checked (`critaxioms.log`). Those 12 include both
   terminal theorems, and a theorem's axiom list includes those of everything it depends on. The pieces are:
   - `famMap γ X := X.map (s ↦ s.map γ)`.
   - `mem_indepFamily_map`, `covered_famMap` (`N(γX) = γN(X)`), `activeWeight_map_of_invariant` (the missing
     composition to fixed `F`), `phi_famMap`, and `famMap_mem_maximizers`.
   - `canonMin_famMap` and `canonMax_famMap`. These use a simpler proof than the one U1 planned: `γ·X_min` is a
     maximizer, so `X_min ⊆ γ·X_min`, and equal cardinality then forces equality. No `sup'` distributivity is needed.
   - `canonMin_pos`, and `weightedHall_iff_phi_nonpos` (instance-agnostic, via `filter_eq_covered`).

   The terminal statements are:
   ```lean
   theorem exists_aut_invariant_deficient_of_not_weightedHall (p : ℕ)
       (h : ¬ WeightedHall G (favorableLeaves G p) p) :
       ∃ X ⊆ indepFamily G (p + 1), (∀ γ : G ≃g G, famMap G γ X = X) ∧
         (∀ B ∈ X, 0 < activeWeight G (favorableLeaves G p) B) ∧
         ∑ A ∈ (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A),
             activeWeight G (favorableLeaves G p) A < ∑ B ∈ X, activeWeight G (favorableLeaves G p) B
   theorem weightedHall_iff_invariant (p : ℕ) : WeightedHall G (favorableLeaves G p) p ↔
       ∀ X ⊆ indepFamily G (p + 1), (∀ γ : G ≃g G, famMap G γ X = X) → Σ_X w ≤ Σ_{N(X)} w   -- abbreviated; literal sums in CritINV.lean
   ```
   The witness is `X_min`. Because it is `Aut(G)`-invariant, the statement holds for every `Γ ≤ Aut(G)`. The same
   argument gives the Hall iff for every such `Γ`. The binder text is **my own**: the Cycle 1 adjudication's Award-group-2
   text is outside my grant, so a Stage 7 contract must diff it against that text. Grade: `compiled` (R29-N-12). It is
   not an award, and it does not move (INV).
2. **Remaining-obligation item 5 points the wrong way (substantive).** U1 proposes `X := canonMax` as the deficiency
   witness and leaves positivity "to be settled". The question can be settled on paper. Suppose `X` is a maximizer and
   `B ∉ X` has `w(B) = 0`. Then `φ(X ∪ {B}) = φ(X) − w(N(B) ∖ N(X))`. So `X_max`, the greatest maximizer, contains
   **every** weight-0 source whose positive-weight targets already lie in `N(X_max)`, and in general it does contain
   weight-0 sources.

   Instrument 2 exhibits this. On `P_3 ⊔ K_{6,3,3,3}` at `p = 4` (graph-generic, not a tree):
   - The favorable selector is `F = {0, 2}`, both endpoints of the `P_3`. Supply is 46, capacity 48, `S = −2`, max flow
     36, and `maxPhi = 10`.
   - `X_min` has 20 members, none of weight 0 (the `C(6, 3)` sets `{0, 2}` ∪ 3 of the 6-part). `X_max` has 71 members,
     **51 of weight 0**, which is every weight-0 source. Both have `φ = 10`.
   - The brute-validated small case `P_3 ⊔ K_{4,2}` at `p = 3` behaves the same way: `X_min` has 7 members with none of
     weight 0, and `X_max` has 20 with 13 of weight 0.

   The paper argument for `X_min` positivity is U1's own item 4, which I compiled as `canonMin_pos`. Removing a weight-0
   member keeps supply the same and does not raise coverage, and this would contradict minimality. `φ(X_min) = maxPhi`
   as well, so **`X_min` is the correct witness for all three conjuncts, and `X_max` fails positivity.** U1's reason for
   preferring `X_max` ("the target wants a large … witness") has no basis. The allocation's summary of (INV) names both
   canonical maximizers. Positivity, as the return quotes the Cycle 1 record, belongs to `X_min`. My theorem uses
   `X_min`, which is consistent with that record.
3. **Unproved docstring claim.** The docstring of `phi` (return §(b) item 16) asserts that `WeightedHall` is
   `∀ X, φ(X) ≤ 0`. Nothing in `INV.lean` proves this, and the two filters are elaborated under different decidability
   contexts: `open Classical in` in `Main`, `open scoped Classical` in `INV`. I closed this gap with
   `weightedHall_iff_phi_nonpos`, using a membership-level `filter_eq_covered` quantified over the instance. It is not a
   defect in what was compiled, but the return's prose claims more than its file proves.
4. **Quantifiers and hypotheses.** Every part (a) lemma holds for one arbitrary `γ`, and so for every element of any
   subgroup. The `hv`/`hF` leaf guards are load-bearing and named. There is no natural-number subtraction: `φ` and the
   forward difference are ℤ-valued. There is no circularity: nothing assumes `S ≤ 0` or uses a budget.
5. **What remains of the registered (INV) statement after items 1–4.** The Lean text now covers "Hall ⇔ Hall on
   `Aut`-invariant families" and the invariant positive deficient cut. The **quotient** form ("⇔ quotient Hall"), whose
   `(⇐)` direction is (LIFT), is not formalized by U1 or by me, because no quotient-network definition exists in the
   carried text. Part (d), NM, is untouched: no Lean text exists for it.
6. **Draft-contract entry numbering is mixed.**
   - Line 99's "entries 1–13, 18, 42" uses the **first-interior** registrar numbering (there, 18 = `taggedFamily` and
     42 = `highTailAggregateFromShadow`). C1-LA1's `Main.lean` has 36 entries, and those two items are its entries 13 and
     22.
   - "Entries 1–6, 8, 13, 18" for `favorableLeaves_map_aut` in C1-LA1 numbering includes `C5LA1.R` (8) and
     `taggedFamily` (13), which that proof does not use. It needs 1–4, 6 and 18.

   Any Stage 7 contract must re-derive the needed-entry list.

## Mechanism-equivalence and fence check

(INV) is a symmetry reduction of the Hall condition, not a transport mechanism. It is none of the ten refuted keys of
§3.2 and not the C6-F4 own-support unit-capacity rule. It asserts no deletion-only Hall, no per-leaf injectivity, no
occupancy domination, no signed cross-tag and no covariance, and neither U1's file nor mine contains a sign statement. No
closed region or settled family theorem is re-proved. Formalizing the registered `proved_informal` (INV) key is the
allocated object of U1 (allocation item 5). No census value, RTree wording or controller prior is used as evidence. My
instrument's rows validate the instrument, and the `P_3 ⊔ K_{6,3,3,3}` example settles an obligation question. It is
not evidence about trees. (LIFT) is not treated as supplying quotient feasibility, and `D, C ≥ 0` does not appear.
Weight and relation fidelity hold: the Lean `activeWeight` counts `v ∈ F ∩ B` with `¬Disjoint (B.erase v) W_v`, not
`|F ∩ B|`, and `transportRel` is (D) ∪ (S) with `|N(u) ∩ B| = 2` and `u ∉ B`. `F` is `favorableLeaves G p` at the
original rank. **Claim identity:** the keys touched are (INV) `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`, (NM)
`E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`, (WID) as read only, (HALL) and the primary aggregate as
untouched. Neither U1 nor I propose a new `E993-R30-…` key. Grades are unchanged: (INV) and (NM) `proved_informal`,
(HALL) OPEN.

## Certification audit

- **Backed by replay:** the axiom table (all 30 lines verbatim), "sorry-free", "8658 jobs", "18,816 bytes", every listed
  digest, "no `IsTree`, no eligibility", and the replay copies being identical.
- **Struck: count literals that do not match the file.**
  - "Part (a) — … (11 lemmas + 1 theorem-labelled target)": the file has 12 `lemma` and 3 `theorem`, 15 in total.
  - "Part (b) — … (16 declarations, all proved)" and the grade row "Part (b), all 16 declarations": the file has 15
    lemma/theorem declarations plus 9 `def`s.
  - Route verdict "27 lemmas and 3 theorem-labelled targets": the file has 23 `lemma` and 7 `theorem` (30 proved
    declarations).
  - Alias check "INV.lean's 30 declaration names": there are 39 declarations; 30 is the count of proved ones.
- **Struck: wording.**
  - "all proved" at lines 136 and 180, and "proved for a completely general finite simple graph" at line 200. The
    correct word is `compiled`. The grade table itself holds `compiled` throughout, and nothing is graded above it.
  - "C1-LA4" (line 410) as the award carrying NM's informal proof. **No such award exists in r30; only C1-LA1 and
    C1-LA2 exist.** A `c1-la4` directory exists under `sources/r29/`, but it is r29's top-rank non-residual aggregate
    award and is unrelated to NM. NM's informal proof is in the Cycle 1 route and critique record, not an award.
- **Not reproducible:** the Mathlib revision "via `git -C <shared project> rev-parse HEAD`". In my session that command
  fails ("unknown revision"). The pin is instead backed by `lakefile.toml` and `lake-manifest.json` (`905b95818eb3…`),
  which match `sources/mathlib-binding/PIN.json`. I strike the method, not the value.
- **Unverifiable by this critic:** "matches the digest bound by that award's own kernel-verification/FIDELITY-REVIEW
  receipts". It rests on `runs/`, which is outside my grant, and is referred to the adjudicator. The weaker checks in the
  seal audit (entries 1–21 against the first-interior snippets and contract text) pass.
- **Path hygiene:** `REPLAY.md` tells a replayer to write to `/tmp/c2-u1-replay-check` and copy from `runs/`. A replay
  should target the replayer's scratch directory. This is minor, and I did not follow that path.

## Verdict

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

The Lean content of parts (a) and (b) is correct, fidelity-clean and replays exactly, at grade `compiled`. The narrowing
is:
- the count literals, "proved" wording and "C1-LA4" citation are struck;
- remaining-obligation item 5 is corrected: `X_min`, not `X_max`, is the positive invariant deficient witness, and
  `X_max` provably can contain weight-0 sources;
- the `φ ≤ 0 ⇔ WeightedHall` docstring claim is marked unproved in the return.

The critic-derived advance is `exists_aut_invariant_deficient_of_not_weightedHall` and `weightedHall_iff_invariant`,
compiled axiom-clean against C1-LA1's definitions and U1's parts (a) and (b). It is attributed to C-U1-T and graded
`compiled`. In my judgement, the mathematics of (INV)'s invariant-family half is complete, consistent with its registered
`proved_informal` grade. The quotient half and (NM) are not.

## Remaining obligation

In order, for a successor or Stage 7:
1. Diff my `exists_aut_invariant_deficient_of_not_weightedHall` binder text against the Cycle 1 U adjudication's
   Award-group-2 statement, and adapt it if the registered statement differs (for example, a general `Γ ≤ Aut(G)` binder
   or a differently named action). The proof carries over.
2. Define the orbit-quotient network (orbit-total supplies and capacities; an orbit arc iff some arc joins the orbits)
   and prove "invariant-family Hall ⇔ quotient Hall". Only the `(⇒)`/converse direction is elementary. The `(⇐)`
   direction is (LIFT) in Hall form. This is the only (INV) content with no Lean text.
3. (NM) `sectorPairProductNormalizedMatching` at the registered statement: not started. Cite its informal source
   correctly (not "C1-LA4").
4. Re-derive the draft-contract needed-entry lists in C1-LA1 numbering, and correct the struck count literals in any
   carried record.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-crit-U1-T/`:

| file | role | sha256 |
|---|---|---|
| `LeanProject/LeanProof/Main.lean` | copy of U1's carried file (unchanged) | `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` |
| `LeanProject/LeanProof/INV.lean` | copy of U1's file (unchanged) | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` |
| `LeanProject/LeanProof/AxiomCheck.lean` | copy of U1's driver (unchanged) | `5c135a8b9e1559b289294e2ab8cbad04d360950ae61085c83f3e5cbcdf46eeca` |
| `LeanProject/LeanProof/CritINV.lean` | critic-derived (c): 2 defs + 20 lemma/theorem declarations, `compiled` | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` |
| `LeanProject/LeanProof/CritAxioms.lean` | `#print axioms` and `#check` driver for CritINV | `e7816d92fa96f10fd27adf4e73557e8156b434e68b712c479f0d0535d17fa1a9` |
| `LeanProject/LeanProof.lean` | root module importing Main, INV and CritINV (scratch edit) | `9ef39334f1baba39449da7937fcad06f4f1e57049f1ddd68f3323dd8046196a4` |
| `LeanProject/.lake/packages` | manual symlink to the pinned shared Mathlib | (symlink) |
| `build.log` / `axioms.log` | replay of U1 (8658 jobs; 30 axiom lines) | `9e11d536…f487` / `65d609f6…c995` |
| `build2.log` / `critaxioms.log` | build with CritINV (8659 jobs); critic axioms | `86d0490323b93144c2d1f46ea2601ffb6290bc8e31614e3331e7ecfdfae222fc` / `254255db00c6e4d296ce05d06e0e951c5debc416da77e34bb4f4050acbeb10f1` |
| `tools/net.py` | Instrument 2 (network, WID assertion, flow, maximizers) | `d359d82946f747a038450569a40f86ca6e2ae859786a7fac94ff50c323160de5` |
| `tools/run.py` → `out-run.json` | K_{1,12}, PS(2,3,4), P_3 ⊔ K_{6,3,3,3} | `1598b649…d5b5` → `220e69c0…85fb` |
| `tools/fp2.py` → `out-fp2.json` | PS(2,2,4,3), Δ_0 and i_2 checks | `cc9d7a16…aea` → `fe887158…6606` |
| `tools/brutecheck.py` → `out-brute.json` | 2^20 brute cross-check of maxPhi, X_min, X_max | `dfae02f2…bcaa` → `3aa96072…ed51` |
| `tools/defcmp.py`, `tools/defcmp2.py` → `out-defcmp*.txt` | carried-definition comparisons | `47386c66…2fec`, `4dfddc01…fa96` → `08d6e2f1…80e`, `e5ce26d7…213a` |

Background jobs: one `lake build`, PID 35070. It had exited before the final write (`kill -0` reports no such process),
so there was nothing to kill. All Python runs used `PYTHONDONTWRITEBYTECODE=1`, and nothing was written under `sources/`.
