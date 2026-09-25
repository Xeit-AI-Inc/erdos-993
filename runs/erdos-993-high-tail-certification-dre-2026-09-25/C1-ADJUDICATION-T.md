# Orientation Adjudication

This is the isolated Stage 5 adjudicator for orientation **T (prove)**, Cycle 1 of r29 (`erdos-993-math-dre-20260925-r29-high-tail-certification`). The portfolio is seats `T1` (`C1-T-01 HIGH-TAIL-EXTRACTION-AND-ENDPOINT`) and `T2` (`C1-T-02 TOP-RANK-NONRESIDUAL-COROLLARY`), plus their four cross-orientation critiques: `C-T1-F`, `C-T1-U`, `C-T2-F` and `C-T2-U`.

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. As the dispatch directs, the startup protocol's further loading map (memory, conversations, modules, skills, logs, decisions) was not followed, and I read no other VerityOS file outside this run root.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read-boundary disclosure** (process notes; nothing here breaches the grant):
- The harness injected the root `CLAUDE.md` and the user auto-memory index into my context at session start. I did not open either file, and nothing below depends on them.
- I read the following, all within the grant:
  - the capsule members;
  - the frozen sources under `sources/`: `Main.lean`, the `Snippets/` fragments, `FORMALIZATION-STATE.json` (keys only), `mathlib-binding/PIN.json`, and a targeted parse of five keys of `authority/CLAIM-IDENTITY.json`;
  - seven pinned Mathlib lines (`Clique.lean:991`, `Bipartite.lean:286`, `Acyclic.lean:56/60/63/296/598/617`) plus `git rev-parse HEAD` of the shared Mathlib;
  - the returns' and critiques' inventoried scratch (hashed, and copied out where replayed).
- I ran one `grep -n` on the frozen `Main.lean` (within `sources/`), non-recursive `ls -la` on the six granted scratch directories and on the critic Lean project, and one `find` rooted in my own scratch directory (to build the inventory).
- I read no other orientation's portfolio or adjudication, no prior synthesis, no other experiment root and no external source. I used no network and installed nothing. Every `lake`/`lean` call ran after `cd` into my pinned scratch project, which is bound by a manual symlink of `.lake/packages`. I never ran `lake update` or `lake clean`.

## Identity and seal audit

| Object | Stated seal | Recomputed (canonical JSON, `seal_sha256` removed, sort_keys, `(",",":")`, no newline) | Match |
|---|---|---|---|
| Capsule `control/c1-adjudicator-capsules/T-PACKET-MANIFEST.json` | `6a7b7127b55f44b61e7a6ce0a7c4d62b3bdde267cb9d744a87bdf584eef5c1de` | same | yes |
| Stage 2 `control/C1-STAGE2-PACKET-MANIFEST.json` | `58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e` | same | yes |
| Stage 3 `control/C1-STAGE3-PACKET-MANIFEST.json` | `40561239862ea63cedfe37f877654bcc2d401b2dd52059139f0e2e37e18d8205` | same | yes |
| Stage 4 `control/C1-STAGE4-PACKET-MANIFEST.json` | `f5a61035a30eb80affc2dcd3bbbf7333ccfc14d6586e96ffef87fecea7fd0386` | same | yes |

- **Capsule members.** All 21 members match their listed SHA-256 and byte count (script `scratchpad/c1-adj-T/seal_check.py`). The four T-orientation members of the Stage 3 and Stage 4 manifests carry the same digests as the capsule: `T1/RETURN.md` `25fc83fc…41e`, `T2/RETURN.md` `09eb816c…fe37`, and the critiques `6c37475d…`, `c84a7fc8…`, `0b6c1f48…`, `c9c6dddb…`.
- **Admission.** Stage 3 and Stage 4 each have `verdict: admit` with 0 findings. T2's cosmetic model-disclosure format exception is noted and sealed. `PATH-CHECK-T.json` reports 0 findings.
- **Read-boundary records.** Stage 3 records no disclosure for T1 or T2. Every Stage 4 disclosure for my four critics is ruled "within the grant; no penalty". I have no reason to disturb those rulings.
- **Frozen source.** `Main.lean` is `8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9` (1,494 lines, 45 entries). For all 45 `Snippets/*.fragment` files, the SHA-256 equals the digest in the `VERITYOS ENTRY` banner (41 `50dcce4a…`, 42 `972d0d90…`, 43 `dbd200bd…`, 44 `b7ee9d1a…`; the full list is under Lean readiness). The seed files (`lakefile.toml` `45d0ca58…`, `lake-manifest.json` `52a4d73c…`, `lean-toolchain` `2bdc48ad…`, `LeanProof.lean` `f4dfdef8…`) match the first-interior project byte for byte.
- **Toolchain pin.** The shared Mathlib `HEAD` is `905b95818eb32af7874a58b427f50c1711a5e96c`, which equals `sources/mathlib-binding/PIN.json`; Lean is v4.32.2.
- **Inventoried scratch.** Every digest the returns and critiques state for their artifacts recomputes and matches:
  - T1: `fixed_points.py` `74e34689…`, `fixed_points.out.json` `1ec01100…`.
  - T2: `census_gen.py` `7352d946…`, `census_analyze.py` `73c94c15…`, `census_result.json` `3b32e2a5…`, `run1.log` `003212ce…`.
  - C-T1-F: `crit_instrument.py` `b7e5fe2e…`, `out14.json` `c604bce4…`, the four `nonbip_*` files.
  - C-T1-U: `crit_bip.py` `2ff45a6d…`, `crit_trees.py` `06af65c5…`, `count_bip7.py` `07ac92b1…`, and both outputs.
  - C-T2-F: `crit_instrument.py` `60f80e52…`, `crit12.json` `21ad8add…`, `crit16.json` `ead237a3…`, `bip_check.py` `bc6ab40d…`.
  - C-T2-U: `crit_instr.py` `d1b12479…`, `crit_census16.json` `86dd10f1…`, `crit_bip7.json` `9eea7a1f…`, `CritTRN.lean` `a94223b1…`, `crit_lean_compile.log` `c1dbfd87…`.
- **Controller facts** (`C1-STAGE5-CONTROLLER-FACTS-T.json`, `f10e26ae…`). I weigh these as one more replay, never as authority. CF-T-1 (no eligible tree with `α = 4`) and CF-T-4 (987, not 976) are independently reproduced below. CF-T-2 (no `E993-R24-*` key) agrees with both T2 critics. CF-T-3 (U1's scratch bodies are sorry-free) is not evidence in my portfolio; my own scratch build below reaches the same fact independently.

## Route-by-route decisions

Replays outweigh self-reports throughout. Every "replayed" item was re-run copy-out-first in `scratchpad/c1-adj-T/`.

### T1 — `C1-T-01 HIGH-TAIL-EXTRACTION-AND-ENDPOINT`: RETAINED, NARROWED

**Replays.**
- `fixed_points.py`, re-run in `replay-T1/`, reproduces `fixed_points.out.json` `1ec01100…` byte for byte; 726/726 checks pass.
- The shipped JSON gives `tsb_sample_count = 419`, `tagged_count_split_sample_count = 80` and `tree_i2_identity_sample_count = 140`.

**Rulings, claim by claim.** Both critics are `retained_narrowed`, and they agree on almost every point. Where they differ I rule explicitly.

1. **(TSB) at registry scope (§5).** RETAINED at `proved_informal`. The derivation is:
   - instantiate `U = univ` and `a = α(H)`;
   - discharge `hcap` by `IsIndepSet.card_le_indepNum`;
   - recast to ℤ.

   Both critics independently narrow step 5: the ℤ recast is **not** "valid unconditionally". Identifying `2·↑(a ∸ k)` with `2·(↑a − ↑k)` consumes `hka` through `Nat.cast_sub hka`. I uphold this: my kernel replay (`CarryLA1.lean`, below) needs exactly `push_cast [Nat.cast_sub hka]`. Step 4 ("`hka` not needed to typecheck step 3") is correct as written.
2. **The `hk`/`hka` question T1 deferred.** Settled by both critics, who agree. I confirm it by reading lines 942–957 of `Main.lean`.
   - `hk : 1 ≤ k` is not consumed in entry 41's body: neither `Core.tagged_deletions_lower` nor `Core.tagged_extensions_upper` takes it, and `hcount` is already the goal after `nsmul_eq_mul`.
   - It is consumed one level up, in `leaf_tagged_monotone`'s cancellation of `k`.
   - It is also part of the `hShadow` interface of entry 42.
   - Neither critic compiled a variant without `hk`, and neither did I. Instead I compiled an independent all-`k` ℤ companion (below), which makes the question moot for the award statement.
3. **Companion identity `q_j(H, W) = i_j(H) − i_j(H − W)`.** RETAINED at `proved_informal`: it is `tagged_count_split` at `D = ∅`, `E = W`. Corroboration literal: "52 rows / all `W ⊆ V`" is **struck**. The shipped count is 80 rows over 15 hand-chosen `W`, not all subsets (both critics agree; my replay confirms).
4. **(HTP) for `p ≥ 2` (§3).** RETAINED at `proved_informal`. The extraction of `Leaf.leaf_term_nonpos` composed with `taggedShadowBound` is faithful (I checked `Main.lean` lines 1086–1153). Three prose items are narrowed, all agreed by both critics and confirmed by my read:
   - (a) The tag set in Lean is `R_v`. It coincides with `N(s) ∖ {v}` inside `U = univ ∖ H_v` by irreflexivity. `H_subset_R` proves `H_v ⊆ R_v`, not "`W ⊆ V(H_v)`".
   - (b) `hcoeff` is proved by `omega` at line 1112, *before* the `by_cases hbig` split, and holds in truncated ℕ. The split only routes the zero-count case.
   - (c) No separate "`α ≥ 1` guard" step exists in Lean; `leaf_indep_cap` closes by `omega`.
5. **(HTP) `p = 1` endpoint (§4).** T1's proof is RETAINED as valid at `proved_informal`: the colour classes are independent, so `|V| ≤ 2`, `G = K_2`, and the term is 0. It is NARROWED on one point, on which both critics agree independently: **bipartiteness is not load-bearing at `p = 1`**. T1's "where bipartiteness enters" paragraph is correct but inessential. Two critic routes exist, and they are compatible alternatives, not a disagreement. I kernel-checked both in scratch:
   - **A1 (C-T1-F).** Under the `p = 1` guard (`α ≤ 1`), a leaf forces `N(s) = {v}`, so `C5LA1.R G v = C5LA1.H G v` on **any** finite simple graph, and the term is `sub_self`. (`E993AdjT.p1_R_eq_H` and `leafTermAtOne`, standard axioms.)
   - **Two-branch route (C-T1-U).** Split on `α ∸ 1 < p`.
     - In the zero branch, `q_p = 0` (`tagged_zero_above_leaf_cap`), so the term is `−q_{p−1} ≤ 0`. This branch uses **no guard and no `hBip`**.
     - In the other branch, `2α + 1 ≤ 3p ≤ 3α − 3` forces `α ≥ 4` and `p ≥ 3`, so `leaf_term_nonpos` applies verbatim.
     - This is the proof body I compiled for `E993AdjT.bipartiteLeafHighTailPointwise`.
     - My own instrument confirms the zero-branch identity `term = −q_{p−1}`, `q_p = 0` on all 180,168 (leaf, `p ≥ α`) rows of all 33,867 labelled graphs of order ≤ 6, bipartite or not, with 0 failures. That is `bounded_computation`; the proof is the Lean-checked argument.
6. **General formula `term(p = 1) = deg_G(s) − 1` on any graph with a leaf.** RETAINED at `proved_informal` (T1). Bounded corroboration: C-T1-F, C-T1-U and my instrument each find 32,110 leaf rows on all labelled graphs of order ≤ 6 with 0 failures (three agreeing instruments). The contract's star closed form `C(m−1, p) − C(m−1, p−1)` holds for `p ≥ 2` only. At `p = 1` the star term is `m − 1`. That correction to the phrasing of `SEMANTIC-CONTRACT` §2 is T1's, confirmed by both critics.
7. **(ELIG) (§6).** RETAINED at `proved_informal`. The mathematics is correct: I recomputed `Δ_2 = (n−1)(n−2)(n−9)/6 + Σ_u C(deg u, 2)` by hand, and the cover bounds give `Δ_2 ≥ 5` at `n = 7` and `≥ 2` at `n = 8`. The **hypothesis-entry map is narrowed**; both critics agree and I confirm from lines 1310–1420:
   - `delta_two_nonneg_seven` and `_eight` both call `indepCount_three_add_edge_incidence G hT.isAcyclic` (lines 1398 and 1412), so **acyclicity enters all three `Δ_2` branches**, not only `n ≥ 9`.
   - Connectivity enters only through `hT.card_edgeFinset` (`m = n − 1`), in `order_ge_alpha_succ`, `delta_one_nonneg`, all three `Δ_2` branches and the cover-degree lemmas.
   - Strike T1's "the `n ∈ {7, 8}` branch avoids the formula entirely" and "the `n ≥ 9` branch uses acyclicity STANDALONE, not the bundled tree fact".
8. **Distinction table (§1).** NARROWED; C-T1-F and C-T1-U agree.
   - The (HTP) gap column must add the `hShadow` discharge (by `taggedShadowBound G hBip`, entry 44's pattern) and the single-file carry of entries 41 + 42, whose `private` helpers are callable only in-file.
   - The (TSB) gap must add `Nat.cast_sub hka`.
   - The (ELIG) row's "byte-identical re-export" is **struck** (C-T1-U; C-T1-F is silent). The terminal name and keyword differ, so it is a new terminal theorem applying the byte-carried entry 43.
   - The table has no (TRN) row, which C-T1-F notes; TRN has no internal declaration.
9. **Corroboration literals.** Struck, with the shipped values substituted:
   - "156" → 419;
   - "145 / 145/145" → 140;
   - "52" → 80;
   - "all `W ⊆ V`" → 15 hand-chosen `W`.

   **Horizon.** Both critics strike "the star and path at each order". I uphold the strike, but correct one detail in both critiques: at `n = 5` the labelled path `0–1–2–3–4` *is* generated. Its Prüfer sequence is `(1,2,3)`, index 38 < 40, and it appears in the shipped keys. At `n = 6, 7` every one of the first 40 Prüfer sequences begins `0,0`, so no path is generated. The correct horizon is: all labelled trees for `n ≤ 4`, and the first 40 lexicographic Prüfer sequences for `n = 5..7` (the path is included at `n = 5` only).
10. **Registry naming (§0).** T1 says "(HTA) closes `E993-R23-…` on the high-tail region". NARROWED to "would close, upon (HTA)'s award" (C-T1-F).
11. **Typed route verdict `proved_conditional`.** C-T1-F says "conditional" is not a mathematical condition; C-T1-U calls the label acceptable. **Ruling:** the label stands as the route's typed verdict, but the grade of record for (TSB), (HTP) and (ELIG) is `proved_informal`, with no mathematical condition. "Conditional" names only the outstanding formal award.
12. **Mathlib pins.** C-T1-F read them and backs them; C-T1-U did not read them and left them unverified. I read them: `Clique.lean:991` `IsIndepSet.card_le_indepNum`, `Bipartite.lean:286` `abbrev IsBipartite … := G.Colorable 2`, `Acyclic.lean:56/60/63/296` (`IsAcyclic`, `structure IsTree`, field `isAcyclic`, `IsTree.card_edgeFinset`). **Backed.**

### T2 — `C1-T-02 TOP-RANK-NONRESIDUAL-COROLLARY`: RETAINED (core), face NARROWED

**Replays.**
- `census_analyze.py 16`, re-run copy-out-first in `replay-T2/`, reproduces `census_result.json` `3b32e2a5…1460` byte for byte, in 22.45 s wall time.
- C-T2-U's scratch `CritTRN.lean` (`a94223b1…`), rebuilt copy-out-first in my pinned project against the byte-carried `Main.lean`, compiles with 0 errors. The log is **byte-identical** to the shipped `crit_lean_compile.log` (`c1dbfd87…`). All five `#print axioms` lines read `[propext, Classical.choice, Quot.sound]`.

**Rulings, claim by claim.** The critics' verdicts are `retained_narrowed` (C-T2-F) and `retained` (C-T2-U). **Resolution:** both accept the TRN statement and its proof, and both narrow the same side claims. C-T2-U's "retained" is a verdict on the mathematical core; C-T2-F's "narrowed" covers the face. I rule the core retained and the face narrowed. Neither verdict is averaged.

1. **TRN statement and reduction (§1).** RETAINED. `x + 2 ≤ α ∸ 1 ⇒ α ≥ 3`; `α = 3 ⇒ x = 0`, contradicting `Δ_0 = n − 1 ≥ 0`; hence `α ≥ 4`, `p = α − 1 ≥ 3`, and `3(α − 1) ≥ 2α + 1 ⟺ α ≥ 4`; then (HTA) or entry 44 applies with `hBip`. The reduction is kernel-checked twice in scratch:
   - C-T2-U's `CritT2U.topRankNonResidualAggregate`, replayed;
   - my `E993AdjT.topRankNonResidualAggregate`, via (HTA) at all ranks, and `CarryLA4.lean`, via entry 44 and the public `Δ_0 = n − 1`.

   Both statements equal the `SOLUTION-CONTRACT` §2 text (whitespace-normalised).
2. **Grade of TRN — the paired critics disagree.** C-T2-F: "`proved_informal` in my prose judgment; T2's `conditional` is not an overclaim". C-T2-U: "stays `conditional` until HTA holds its own grade". **Ruling: `proved_informal` at this orientation's evidence grade.**
   - T2 computed `conditional` by taking entry 44, a compiled internal lemma with no grade of its own (fence §3.8), as the input.
   - The input of record is instead the informal chain TSB → HTP → HTA, each link `proved_informal` in this portfolio (T1 §3–§5, re-derived by C-T1-F, C-T1-U and C-T2-F, and verified by me).
   - Under §4 the composition's grade is its weakest input's, which is `proved_informal`.
   - C-T2-U's reading is correct only under the entry-44 input, which is superseded.
   - Registry statuses are unchanged: every key stays OPEN until its own award.
3. **"Only the `Nonempty` half of `hT` enters" (§1 step 1; draft `hyp-tree` text).** NARROWED (both critics). Truncated ℕ gives `α ≥ 3` with no honesty condition, and `n ≥ α` comes from `exists_isNIndepSet_indepNum`. `Nonempty` is sufficient but not required. C-T2-U's kernel file proves `eligible_top_alpha_ge_four` for **every** finite simple graph, and I replayed it.
4. **"Acyclicity supplies `hBip` via `IsTree.isBipartite` (`Acyclic.lean:598`)."** NARROWED (both critics). The line-598 lemma is `⟨hG.coloringTwo⟩`, which the critics trace to `hG.connected.nonempty.some` (lines 589–596), so the named term routes through connectivity. The acyclicity-only route is `IsAcyclic.isBipartite` (line 617). I confirmed that both lemmas exist at the pinned lines. The mathematical point that acyclicity suffices is right; the citation must name line 617 if hypothesis accounting is to be literal.
5. **The `α = 4` tightness question (T2 open item 5).** RESOLVED negatively: **no tree eligible at `p = α − 1` has `α ≤ 4`; the minimum is `α = 5`.**
   - Proof: `α = 4` needs `x ≤ 1`; `x = 1` means `Δ_1 < 0`; on a tree `2Δ_1 = n² − 5n + 2 < 0 ⟺ n ≤ 4`; but `n ≥ α + 1 = 5`.
   - Attribution: critic-attributed, derived **independently** by C-T2-F (A1) and C-T2-U (A2). The controller derived it too (CF-T-1).
   - Kernel-checked in C-T2-U's scratch as `tree_eligible_top_alpha_ge_five` and `tree_eligible_top_guard_strict`; I replayed both.
   - Prior art on the **residual** class is in the registered text of `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT`: "hEligible forces alpha >= 4, on the eligible class in fact alpha >= 5" and "Ingredient: hEligible implies alpha >= 4 since x >= 1 always". I confirmed this in the frozen `CLAIM-IDENTITY.json`. r26 attribution travels with the `α ≥ 4` step.
   - Consequence: T2's §1 step 5, "equality possible at `α = 4` … the tight boundary case", is **struck**. The guard holds strictly on TRN's domain, with slack `α − 4 ≥ 1`.
   - The bipartite extension (no eligible bipartite graph has `α = 4`) is proved informally by both critics, by different edge-count arguments. My instrument corroborates it: 91 top-eligible labelled bipartite graphs of order ≤ 6, minimum `α` 5, 0 with `S > 0`, matching C-T2-F's 91.
6. **Bipartite generalisation of TRN.** Critic-attributed; derived independently by C-T2-F (A3) and C-T2-U (advance 2). Connectivity is never used, so the TRN conclusion holds for every finite bipartite `G` under the same ℕ hypothesis. It is kernel-checked in C-T2-U's scratch as `bipartiteTopRankNonResidualAggregate`, which I replayed. It remains a STATED scope observation, not a target and not a registration.
7. **Census (§2).** Backed by my byte-identical replay and by two independent critic instruments (C-T2-F: leaf augmentation with centre-AHU and a deletion recursion; C-T2-U: leaf augmentation with centre-AHU and a rooted DP):
   - **32,508 isomorphism classes of free trees** of orders 1–16 (A000055);
   - **32,364 classes eligible** at `p = α − 1`;
   - the per-`α` histogram (3, 135, 877, 4068, 10794, 10594, 4644, 1082, 152, 14, 1 for `α = 5..15`);
   - 0 classes with `S > 0`; maximum `S = −12`;
   - 846 eligible classes through order 12.

   All of it is `bounded_computation`. C-T2-F's "TRN verified by complete enumeration for `α ≤ 8`" is valid reasoning (a tree has `n ≤ 2α`) and critic-attributed `bounded_computation`, now subsumed by the proof. The "976" figure is corrected to **987** classes through order 12 (erratum R29-E-a; T2 found it, and both critics and my replay confirm).
8. **Struck literals.**
   - "total wall time ≈ 1.1 s / ~1–2 s" is struck: the shipped `run1.log` says 22.555 s, and my replay took 22.45 s (both critics).
   - "all 15 MATCH" → 16 rows (C-T2-U).
   - "the smallest eligible tree" → "an eligible tree of the minimum order 7". Order 7 has four eligible classes: three with `α = 5` (`S = −12, −16, −14`) and `K_{1,6}` with `α = 6` (C-T2-U; C-T2-F agrees there are four).
   - "the full match list" → 7 of 19 prefix hits (C-T2-F).
9. **Alias table (§5).** NARROWED (both critics). `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` (VERIFIED informally; `S ≤ −2` on the residual class) is omitted and must be named in TRN's fences, with the note that TRN states no strict inequality. `E993-R26-TOP-RANK-N2-LE-M` (REFUTED, unused) is also omitted. The conclusions of the alias checks all stand: no alias found, and no `E993-R24-*` key exists (CF-T-2 agrees).
10. **Region scope note (§4).** The region `{p : x + 2 ≤ p ∧ 3p < 2α + 1}` is stated exactly and RETAINED. The "nonempty in general" justification (the `P_3 ⊔ K_2` prior: disconnected, a non-tree, not an eligible rank) is **struck as evidence** (C-T2-F).
    - C-T2-F supplies a membership count of 3,806 classes to order 16, with a single instrument; it is critic-reported and I did not replay it.
    - I replayed its first example as membership only, evaluating no sign in the fenced region: order 11, `α = 9`, `x = 4`, `p = 6` is eligible and below the guard (`instr/region_member.out`).
11. **r26 relation (§3).** RETAINED and correctly fenced. The hypotheses dropped are `hAlpha` and `hResidual`; `hEligible` and the conclusion are textually identical (C-T2-F and C-T2-U both checked the r26 `Main.lean`). The remark "r26 derivable from TRN" is recorded as an unregistered observation.
12. **Top-rank selector collapse.** CF-T-2 records it; C-T2-F (A6) and C-T2-U (A5) confirm it on every tree of order ≤ 16 as bounded evidence. At `p = α − 1` every leaf of a tree with `α ≥ 2` is strictly favorable (the published r24 C4-LA1 package, which has no claim identity). TRN is therefore a full-leaf-sum statement on trees. This is a scope note only.
13. **Draft `LA4` `THEOREM-CONTRACT.yaml` (§6).** NEEDS REPAIR (both critics).
    - Move `Nat.sub`, entry 44 and `IsTree.isBipartite` out of `definitions`.
    - Add the omitted definitions of record: `C4LA1.vertexDeletionIndepSetCount`, `vertexDeletionForwardDifference`, `IsFavorableAt`, `IsGraphLeaf`, and `C5LA1.leafSet`, `indepSetsAvoiding`, `indepSetCount`.
    - The ℕ/ℤ equivalence of `hEligible` holds for **every** `α`: at `α = 0` both sides are false.
    - Drop the `Nonempty` dependency from `hyp-tree`.
    - Add attribution: Codex/Astra, and r26 for the `α ≥ 4` step.

## Cross-route reconciliation

- **The dependency joint.** TRN (T2) consumes (HTA) only at `p = α − 1`. By the resolved `α ≥ 5`, that is `p ≥ 4`, so (TSB) is invoked at `k = p − 1 ≥ 3`. T1's `p = 1` endpoint and the two-branch zero case are never needed by TRN. The portfolio's DAG is therefore two separate chains that share the TSB/HTP core:
  - TSB → HTP (`p ≥ 2` body) → HTA → TRN;
  - HTP's `p = 1` endpoint, closed by the guard alone.
- **Grades line up.** T1 grades (TSB), (HTP) and (ELIG) `proved_informal`, but does not grade (HTA). T2 grades (HTA) and (TRN) `conditional`, on the entry-44 reading. Under ruling T2-2, (HTA) is `proved_informal`: it is `Finset.sum_nonpos` over (HTP), which is immediate, and kernel-checked in my scratch. (TRN) is `proved_informal` as well. No route claims `formally_verified`.
- **Shared errata.** Both seats flag 976 → 987 (R29-E-a). T2 finds that no `E993-R24-*` key exists (R29-E-b). Neither affects any proof.
- **Fence consistency.** Neither seat enters the lower region, uses a census value, the r27 root correction or Hall/SDR, or transfers status to a no-recovery key, TREE/FOREST, `E993-BETA-AGG` or Erdős #993. Both cite entries 41–44 as "compiled internal, unawarded". The two existing awards are inputs only.
- **Critic advances converge.** C-T1-F's A1 and C-T1-U's two-branch route both show `p = 1` is free of bipartiteness. C-T2-F and C-T2-U independently prove `α ≥ 5` and the bipartite form of TRN. Each advance has therefore been derived by two isolated critics, and I kernel-checked each one. That exceeds a single isolated second read, but by protocol the synthesis still decides whether these STATED review-stage items go on a face or into the registry.

## Established results

**Grades** follow `SOLUTION-CONTRACT` §4, applied as I rule them here. "Scratch kernel" means compiled sorry-free against the byte-carried source in adjudicator or critic scratch. It is not a certificate and it grades nothing.

| # | Result (exact hypotheses consumed) | Grade | Attribution | Scratch kernel |
|---|---|---|---|---|
| E1 | **(TSB)**: `H.IsBipartite`, `W : Finset V`, `1 ≤ k`, `k ≤ H.indepNum`, finite `V` ⇒ `(k:ℤ)·q_{k+1} ≤ 2((α:ℤ) − k)·q_k`. `hBip` enters only in `Core.card_extension_le` (line 826). `hka` enters only in the ℤ cast. `hk` is not consumed by entry 41. | `proved_informal` | Codex mechanism; T1 registry derivation | `E993AdjT.bipartiteTaggedShadowBound` (AdjMain; CarryLA1) |
| E2 | **(TSB) all-`k` ℤ companion**: the same inequality with no `hk` and no `hka`. `k = 0` holds by nonnegativity; `k > a` because `q_k = q_{k+1} = 0`. | `proved_informal` | critic-attributed (C-T1-F A2; C-T1-U F4) | `bipartiteTaggedShadowBoundAllK` |
| E3 | Identity `q_k(H, W) = i_k(H) − i_k(H − W)` (`tagged_count_split`, `D ⊆ E`) | `proved_informal` | Codex (entry 42); T1 | used inside E4 |
| E4 | **(HTP)** at every `p ≥ 1`: `G.IsBipartite`, `C4LA1.IsGraphLeaf G v`, `1 ≤ p`, `2α + 1 ≤ 3p`. `hBip` is used only in the branch `p ≤ α − 1`, which forces `p ≥ 3`. The branch `α − 1 < p` uses neither `hBip` nor the guard. | `proved_informal` | Codex (`p ≥ 2` body); T1 (`p = 1`); two-branch packaging critic-attributed (C-T1-U) | `bipartiteLeafHighTailPointwise` |
| E5 | `p = 1` endpoint on **any** finite simple graph: a leaf and `α ≤ 1` give `R_v = H_v`, so the term is 0 | `proved_informal` | critic-attributed (C-T1-F A1); Codex's C2 scope audit observed `α(H) = 0` | `p1_R_eq_H`, `leafTermAtOne` |
| E6 | Unguarded `p = 1` formula `term = deg_G(s) − 1` for any leaf of any finite simple graph | `proved_informal` | T1 | — (three agreeing instruments to order 6) |
| E7 | **(HTA)**: `G.IsBipartite`, `1 ≤ p`, `2α + 1 ≤ 3p` ⇒ `C5LA1.aggregate G p ≤ 0` (original strict selector; one tag per leaf) | `proved_informal` | Codex/Astra proposal; T1 + T2 | `bipartiteHighTailAggregateAllRanks` |
| E8 | **(ELIG)**: `G.IsTree` (connectivity via `card_edgeFinset`, acyclicity via entry 34 in all three `Δ_2` branches), ℕ hypothesis `x + 2 ≤ α ∸ 2` (≡ the integer form) ⇒ `7 ≤ α` | `proved_informal` | Codex (entry 43); T1 extraction, corrected | `interiorEligibilityAlphaGeSeven` (CarryLA3) |
| E9 | **(TRN)**: `G.IsTree` (used only for `hBip`), ℕ `x + 2 ≤ α ∸ 1` ⇒ `aggregate G (α − 1) ≤ 0` | `proved_informal` | Astra proposal; T2 derivation; r26 for the `α ≥ 4` ingredient | `topRankNonResidualAggregate` (AdjMain; CarryLA4; CritT2U replayed) |
| E10 | Tree eligible at `p = α − 1` ⇒ `α ≥ 5`, so the guard is strict | `proved_informal` | critic-attributed (C-T2-F; C-T2-U), with r26 residual-class prior art | `CritT2U.tree_eligible_top_alpha_ge_five` (replayed) |
| E11 | The TRN conclusion on every finite bipartite `G` under the same ℕ hypothesis | `proved_informal` | critic-attributed (C-T2-F; C-T2-U) | `CritT2U.bipartiteTopRankNonResidualAggregate` (replayed) |
| E12 | No bipartite graph eligible at `p = α − 1` has `α = 4` | `proved_informal` (critics) plus `bounded_computation` | critic-attributed (C-T2-F; C-T2-U) | — |

**Bounded computations** (`bounded_computation`, exact horizons, canonicalised):
- **Free trees, orders 1–16.** 32,508 **isomorphism classes**; 32,364 eligible at `α − 1`; 0 with `S > 0`; maximum `S = −12`. That is three agreeing instruments plus my byte-identical replay.
- **(ELIG) on free trees.** Every eligible class has `α ≥ 7`: 4,123 eligible classes to order 14 (C-T1-F) and 29,181 to order 16 (C-T1-U); 361 through order 12 matches the contract prior.
- **Labelled bipartite graphs, orders 1–6** (5,604 **labelled** graphs). TSB, HTP and HTA hold with 0 failures (C-T1-F, C-T1-U, and my `instr/adj_instr6.json`: 71,728 guarded bipartite leaf rows, 32,987 guarded aggregates, 0 positive). C-T1-U extends this to order 7 (103,237 labelled; two instruments agree on the count): 913,810 guarded leaf rows, 0 positive.

**Non-bipartite witnesses** (records, not counterexamples; outside every target's scope). Both are C-T1-F's, and I replayed both:
- `K_1 ⊔ K_5` with `W` = the isolate and `k = 1`: `5 > 2`, so (TSB) fails without `hBip`.
- The path `v–s–w` plus two disjoint triangles, with `α = 4` and `p = 3` (guard equality `9 = 9`): the term is `+3` (`q_3 = 9`, `q_2 = 6`), so (HTP) fails without `hBip`.

**Record corrections carried by this adjudication:**
- R29-E-a: 987, not 976.
- The star closed form is valid for `p ≥ 2` only; at `p = 1` the term is `m − 1`.
- T1's struck literals: 419, 140, 80, the horizon.
- T2's struck literals: runtime, "15", "smallest", "full list".

**Open bridges** (none mathematical inside the targets):
- the governed awards themselves;
- the synthesis's rulings on whether (HTA)'s key may be certified as a companion on the (HTP) award's face;
- the second-read status of the critic-derived items.

## Rejected and narrowed mechanisms

- **Rejected:**
  - (TSB) or (HTP) without `hBip`: C-T1-F's witnesses, replayed. Bipartiteness is load-bearing for (TSB) and for (HTP) on the branch `p ≤ α − 1`.
  - The unguarded `p = 1` sign: the term is `deg(s) − 1 > 0` whenever `deg(s) ≥ 2`, so the endpoint holds only because the guard forces `K_2`.
  - "Equality possible at `α = 4`" on TRN's domain.
  - "`hk` is load-bearing in (TSB)".
  - "The ℤ recast is unconditional".
  - The `P_3 ⊔ K_2` prior as evidence that the lower region is nonempty.
- **Narrowed:**
  - T1's "bipartiteness enters at `p = 1`" (true, but inessential);
  - T1's (ELIG) connectivity/acyclicity map;
  - T1's distinction table (`hShadow`, private carry, `Nat.cast_sub`, and "byte-identical" struck);
  - T2's `Nonempty` and `Acyclic.lean:598` hypothesis accounting;
  - T2's alias table (the strict r26 key);
  - T2's draft `LA4` contract;
  - T2's (HTA) and (TRN) grade, from `conditional` to `proved_informal` (ruling T2-2).
- **Not claimed and not a target:**
  - strict `S(T, α − 1) < 0` on the eligible non-residual class. The census maximum `−12` is bounded only; C-T2-U reports a zero pointwise term, which I did not replay.
  - Anything in the lower region `3p < 2α + 1` (fenced).
- **Refuted keys stay refuted and are not aliased:**
  - `E993-BETA-TARGET`: its witnesses `T_22` and `T_60` lie below the guard (C2 scope audit, cited by both T1 critics).
  - `E993-BETA-AGG-SUPPORT`.
  - `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`: the `3K_2` and `K_{1,m}` witnesses show `2(a − k)` attained where `r` is exceeded. It is a different statement.

## Lean readiness

**Verdict.** In this portfolio's evidence, **all four award groups are contract-ready.** For each group:
- (a) the complete informal proof is at statement level, with a closed DAG at REGISTRY scope, including the `p = 1` endpoint and the `k ≤ a`/ℤ form;
- (b) every new node was compiled sorry-free in adjudicator scratch with a minimal carry, and standard axioms only;
- (c) no mathematical node is open.

**Carried fragments.** These are byte-identical `Snippets/*.fragment` files; each fragment's SHA-256 equals its banner digest (first 16 hex shown):

| Entries | Digests |
|---|---|
| 1–5 | 1 `7e0a588e243735a6`, 2 `c2da50eb16ee788c`, 3 `25d8f7d274f90804`, 4 `65acd314d3bfd74a`, 5 `8e1e1a689393f555` |
| 6–10 | 6 `78ec65517bde90cc`, 7 `ccfc9b2f549aa8c9`, 8 `55f37d9161901d60`, 9 `a0407d82ab112a65`, 10 `ac0e331eec99650e` |
| 11–15 | 11 `e22635d8697e49b3`, 12 `60bd8efcc88e8e51`, 13 `d66e776c5cf49b2a`, 14 `378868ab2e660af8`, 15 `f6bc96fd41a76a97` |
| 16–18 | 16 `15ce5e3474a249e2`, 17 `d7dc776c79754ed2`, 18 `cb43feebd48bdf3a` |
| 19–40 | the `Erdos993G1` counting layer, each fragment matching its banner (`01ee774f…` through `d6f34279…`) |
| 41–44 | 41 `50dcce4a7ad13fbb`, 42 `972d0d9002188899`, 43 `dbd200bd15cf7cf8`, 44 `b7ee9d1adcac5867` |

**Statement fidelity.** All five new declarations compile at exactly the `SOLUTION-CONTRACT` §2 text (whitespace-normalised; `statement_fidelity.txt`). One qualification: `taggedFamily` must resolve in the award namespace. The §2 text writes it unqualified, so the award must either `open E993Interior` or sit in a namespace where the name resolves. The registrar's `expected_statement` must be fixed accordingly; this is a fidelity-review item.

**`#print axioms`.** Every new declaration prints `[propext, Classical.choice, Quot.sound]` (logs `adj_compile.log`, `CarryLA1-4.log`). My replay of C-T2-U's shipped log is byte-identical to it. I found no `sorry`, `admit`, `native_decide`, `decide` or `axiom` in any new text.

**Award groups.** The next four entries give, for each group, its exact statement, hypotheses, fences, carried fragments, new declarations and remaining gate.

- **LA1 — (TSB) `E993-BIPARTITE-TAGGED-SHADOW-BOUND`: CONTRACT-READY.**
  - **Terminal theorem:** `theorem bipartiteTaggedShadowBound {V : Type*} [Fintype V] [DecidableEq V] (H : SimpleGraph V) [DecidableRel H.Adj] (hBip : H.IsBipartite) (W : Finset V) (k : ℕ) (hk : 1 ≤ k) (hka : k ≤ H.indepNum) : (k : ℤ) * (taggedFamily H Finset.univ W (k + 1)).card ≤ 2 * ((H.indepNum : ℤ) - k) * (taggedFamily H Finset.univ W k).card`.
  - **Hypotheses:** `hBip`, `hk` (kept to match the registry text, although not consumed), and `hka` (consumed by `Nat.cast_sub`). The registry and Lean texts agree on `1 ≤ k ≤ a`.
  - **Carry:** entries **18, 41** only (compiled as `CarryLA1.lean`).
  - **New declarations:** the terminal theorem; optional companion lemmas `tagged_zero_above` and `bipartiteTaggedShadowBoundAllK` (critic-attributed; second read at the synthesis's discretion).
  - **Also optional:** the identity companion `taggedCount = i(H) − i(H − W)` needs `indepSetCount` (entries 10–11) and a public re-proof of `tagged_count_split` at `D = ∅`, or the carry of entry 42. I did not compile it; it is not needed for the award.
  - **Fences:** §3.1, §3.4 (not `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`) and §3.8. The key is certified only by its own award.
- **LA2 — (HTP) `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`, with the (HTA) companion: CONTRACT-READY.**
  - **Terminal theorem:** the §2 text of `bipartiteLeafHighTailPointwise`.
  - **Companion lemma:** the §2 text of `bipartiteHighTailAggregateAllRanks`.
  - **Carry:** entries **1–14, 18, 41, 42** (compiled as `CarryLA2.lean`; entry 44 is not needed).
  - **Proof shape:** the two-branch body. It uses the `private` helpers `E993Interior.Leaf.H_subset_R`, `tagged_count_split`, `tagged_zero_above_leaf_cap` and `leaf_term_nonpos`, which are callable because they sit in the same single source file. `hShadow` is discharged by `E993Interior.taggedShadowBound G hBip`.
  - **Optional companions:** `p1_R_eq_H` and `leafTermAtOne` (critic-attributed A1). The award needs no `card V ≤ 2` lemma.
  - **Hypotheses:** `hBip`, `hv`, `hp : 1 ≤ p` (makes `p − 1` the integer rank), `hTail`. There is no selector, residual or connectivity hypothesis.
  - **Open ruling for the synthesis (not mathematical):** whether (HTA)'s run-local key `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` can change status through a companion lemma on LA2's face. `SOLUTION-CONTRACT` §2 says the terminal theorem is pointwise "unless the synthesis rules otherwise", and §3.8 says every award is a separate certificate. If the ruling is no, (HTA) needs its own terminal-theorem award. Its carry would be the same as LA2's, and the body is ready.
  - **Fences:** §3.1, §3.3 (the lower region is untouched) and §3.4 (not `E993-BETA-TARGET`).
- **LA3 — (ELIG) `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN`: CONTRACT-READY.**
  - **Terminal theorem:** `theorem interiorEligibilityAlphaGeSeven … (hT : G.IsTree) (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) : 7 ≤ G.indepNum := E993Interior.eligibleAlphaGeSeven G hT hInterior`. This is a new terminal name applying the carried entry 43, **not** a byte-identical re-export.
  - **Carry:** entries **1–17, 19–40, 43** (compiled as `CarryLA3.lean`; entry 18 is not needed). The minimal subset of 19–40 is not determined here and is a registrar question.
  - **ℕ/ℤ note for the fidelity face:** the hypothesis is false for `α < 2` and equals the integer hypothesis otherwise.
  - **Fences:** §3.2. The first-interior award is unchanged, and (ELIG)'s relation to it is a scope note.
- **LA4 — (TRN) `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE`: CONTRACT-READY.**
  - **Terminal theorem:** the §2 text of `topRankNonResidualAggregate`.
  - **Recommended body:** the public route, compiled as `CarryLA4.lean`. It carries entries **1–14, 18, 41, 42, 44** and adds public lemmas `count_zero`, `count_one`, `delta_zero` (`Δ_0 = n − 1` on every finite simple graph), `indepNum_le_card`, `crossing_negative` and `eligible_top_alpha_ge_four`. The terminal step is `E993Interior.bipartiteHighTailAggregate G hT.isBipartite (α − 1)`.
  - **Why this route:** it avoids carrying entry 43 and the `Guard` privates. The alternative, calling the private `Guard.order_ge_alpha_succ`/`delta_zero_nonneg` in-file, also compiles (AdjMain) but needs entries 15–40 and 43.
  - **Optional companions:** `tree_eligible_top_alpha_ge_five` and `tree_eligible_top_guard_strict` (critic-attributed; they need entries 15–17, 19, 25, 26 and 39 for the `i_2` bridge).
  - **Fences:** §3.2. r26's award is never re-registered or widened, and TRN's candidate entry must name `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` and say that TRN states no strict inequality. §3.3 applies, and TRN closes one rank of `E993-R23-…`, not the key.

**What is NOT ready.** No mathematical lemma is unproved. The smallest remaining obligations are all procedural:
- the governed registrar carry and fidelity review of the four statements, including the `taggedFamily` namespace resolution and the private-helper single-file carry for LA2;
- the synthesis ruling on (HTA)'s certificate route;
- the repaired `LA4` draft contract;
- each award's own kernel gate and `#print axioms`.

**Standing of my compilations.** They are adjudicator scratch replays, not certificates. They show that the DAG closes at the pin; they grade nothing (fence §3.8).

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

Entering Cycle 1, two parts of the targets had no statement-level proof at registry scope: the `p = 1` endpoint and the (TRN) derivation. The registry forms of (TSB) and (ELIG) existed only as compiled internal lemmas with no grade. The T portfolio now has, all verified by me:
- complete informal proofs of all four targets at registry scope;
- two independent bipartiteness-free `p = 1` routes;
- a resolved tightness question (`α ≥ 5` on TRN's domain);
- scratch kernel compilations of every new node over minimal carries.

The stop gate's decisive events are both absent:
- **All four targets formally verified.** Not yet; that is Stage 7's to deliver, and the portfolio makes it fundable this cycle.
- **An in-scope counterexample.** None exists: every attack found 0 in-scope failures, and every witness found lies outside scope (non-bipartite, or at `3p = 2α`).

## Headline assessment

headline_resolved: no
status: proved

`status` is recorded at this orientation's evidence grade (`proved_informal` for every target, each verified by me). Per target:
- **(TSB)**: complete informal proof, verified.
- **(HTP) with (HTA)**: complete informal proof at every `p ≥ 1`, verified.
- **(ELIG)**: complete informal proof (the extraction of entry 43, with the corrected hypothesis map), verified.
- **(TRN)**: complete informal proof via (HTA), verified.

No target is refuted, and none is formally verified. Formal verification is the headline, and it belongs to Stage 7's governed awards.

## Next-route allocation

**Exact remaining obligation (orientation T).** Four governed Lean awards, LA1–LA4, at the `SOLUTION-CONTRACT` §2 statements, using the carry sets and bodies under Lean readiness. Before them come:
- the synthesis's rulings on (HTA)'s certificate route (a companion on LA2 or its own award);
- whether the critic-derived STATED items go on award faces as companion lemmas or scope notes: E2, E5, E10, E11, E12, and the `deg(s) − 1` formula E6 (T1's);
- the repair of the `LA4` draft contract and TRN's candidate registry entry.

**Routes.** At most two; at most one per target that is still open.
1. **Stage 7 this cycle (preferred): fund LA1–LA4 directly.** Everything above is ready, and this could close all four targets in one cycle, which is stop-gate event (a).
2. **Cycle 2 (only if an award blocks at the registrar or fidelity gate): a targeted U-style repair of the blocked award alone.** Likely blockers are the private-helper visibility across the registrar carry for LA2, the `taggedFamily` namespace qualification in `expected_statement`, and a separate (HTA) terminal award if the synthesis requires one. This route carries the exact blocked obligation and could close that target in one cycle.

No T-orientation mathematical route is needed.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-adj-T/`:

| File | SHA-256 | Role |
|---|---|---|
| `seal_check.py` | `ef6cb20ce2635e4084bae47fb0492aa1f8030c9a9d6c61e9323954bc491e7d1e` | capsule/stage seal and member digest check |
| `replay-T1/fixed_points.py`, `replay-T1/fixed_points.out.json` | `74e34689…d1c6c1f`, `1ec01100b7ae6d7d9724fffbac65d8e57b0a2701f37c02974e5c14cd32fabc8c` | T1 replay (byte-identical) |
| `replay-T2/census_gen.py`, `census_analyze.py`, `census_result.json`, `run.log` | `7352d946…`, `73c94c15…`, `3b32e2a5c0973c03990fd499e9e4f2c0ba990dc7e7067e39e26e81a3e2621460`, `f64a83f2…` | T2 replay (byte-identical; 22.45 s) |
| `instr/adj_instr.py` | `61e84ca383e02689227db46b1aff59728894a08b7baa6473a736d965f9a9a43c` | own instrument (stdlib, exact ints; all labelled graphs of order ≤ 6) |
| `instr/adj_instr6.json` | `21366ee9d3a336e402594f53eecb4e4ac6bbd21cad05b3ef7fd6c43ddf0f48a9` (content digest `58cdc080…`) | A1 on 2 rows; zero branch on 180,168 rows; HTP on 71,728; HTA on 32,987; `deg(s) − 1` on 32,110; 91 top-eligible bipartite graphs, min `α` 5; all 0 failures |
| `instr/nonbip_witness.py`, `.out` | `b4ca2b89…`, `d19788d0…` | replay of C-T1-F's non-bipartite witnesses |
| `instr/region_member.out` | `63156f6f…` | fenced-region membership example (no sign evaluated) |
| `LeanProject/{lakefile.toml, lake-manifest.json, lean-toolchain, LeanProof.lean}` | `45d0ca58…`, `52a4d73c…`, `2bdc48ad…`, `f4dfdef8…` | byte-copied seed; `.lake/packages` symlinked to the pinned shared project |
| `LeanProject/LeanProof/Main.lean` | `8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9` | byte-carried first-interior source; `lake build` OK (8,657 jobs; `build.log` `d0a266bf…`) |
| `LeanProject/LeanProof/CritTRN.lean`, `crit_replay.log` | `a94223b1…`, `c1dbfd87d55f8326812ac8ddcffe1b4758b4fa25d0d5f687fc5a253154ff7b44` | C-T2-U scratch replay (log byte-identical to shipped) |
| `LeanProject/LeanProof/AdjMain.lean`, `adj_compile.log` | `04434c25e5b0708b65e6bef92a073ed42505035dadbfd481591b292ff53d49a2`, `8dca3fc3…` | `Main.lean` prefix byte-identical plus the adjudicator section `E993AdjT` (all five §2 statements plus companions; 0 errors; standard axioms) |
| `LeanProject/LeanProof/CarryLA1.lean` … `CarryLA4.lean` | `7d611473…`, `ad655a12…`, `b37768ee…`, `a9e9db7f…` | minimal-carry compilations per award group |
| `CarryLA1.log` … `CarryLA4.log` | `cdcaa4b4…`, `3ffea258…`, `ffbf3abe…`, `7abecbb6…` | 0 errors each; standard axioms |
| `LeanProject/statement_fidelity.txt` | `9ad74b99…` | §2 statement text equality check |

Background jobs: none were launched; every `python3` and `lake` run was in the foreground and completed, so there was nothing to kill. I wrote only this file and my scratch directory. I reread the file before close.
