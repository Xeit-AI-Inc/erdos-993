# Critique

Critic `C-T1-F` (cross-orientation F, falsify) on the return of seat `T1`, route `C1-T-01 HIGH-TAIL-EXTRACTION-AND-ENDPOINT` (orientation T). Run `erdos-993-math-dre-20260925-r29-high-tail-certification`, Cycle 1 Stage 4.

**Boot acknowledgment.** I booted VerityOS for this session by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in that order. I did not read any other VerityOS file outside this run root. Read-boundary disclosure: the harness put the root `CLAUDE.md` and the user auto-memory index (`MEMORY.md`) into my context automatically at session start. I did not read or open either file, and nothing below depends on them. I did not read the worker common brief (`control/C1-WORKER-COMMON-BRIEF.md`). I read these files, all under the grant: the capsule members; the frozen sources under `sources/`, namely `first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean`, the four fragments 0041–0044, `FORMALIZATION-STATE.json`, `records/C2-SCOPE-AUDIT.md` (`grep` on this one file only), `authority/CLAIM-IDENTITY.json` and `mathlib-binding/PIN.json`; and 4 pinned Mathlib files by exact line, to check T1's file:line pins. I ran one non-recursive `ls` of `scratchpad/c1-T1/`, the return's inventory directory, and one non-recursive `ls` of `sources/mathlib-binding/`. I ran no search rooted above a granted directory. No network, no installs, no `lake`/`lean` invocation (T1 is not a Lean seat).

## Identity and seal audit

Every seal and digest below was recomputed as SHA-256 over compact key-sorted JSON with `seal_sha256` removed and no trailing newline.

| Object | Stated | Recomputed | Match |
|---|---|---|---|
| Capsule `c1-critic-capsules/T1-PACKET-MANIFEST.json` | `6fe1fef8c0486d4e7bc2ad7f72576fd39f443f2b001be4364b2dfe6280425717` | `6fe1fef8c0486d4e7bc2ad7f72576fd39f443f2b001be4364b2dfe6280425717` | yes |
| Stage 2 `C1-STAGE2-PACKET-MANIFEST.json` | `58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e` | same | yes |
| Stage 3 `C1-STAGE3-PACKET-MANIFEST.json` | `40561239862ea63cedfe37f877654bcc2d401b2dd52059139f0e2e37e18d8205` | same | yes |
| Stage 4 dispatch `C1-STAGE4-DISPATCH-MANIFEST.json` | `62f95191f0e3d8f8177493e94a7501a34a3909199b0d8a21e416b931a80d5058` | same | yes |

- **Capsule members.** All 14 match in byte count and SHA-256. This includes `RETURN.md` at `25fc83fc…41e`. All 13 Stage 4 dispatch-manifest members also match.
- **`C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json`.** It lists T1 under `seats_without_disclosure`, which is consistent with the return's "None".
- **Return source-digest table (9 files).** Every entry matches both `control/SOURCE-DIGESTS.json` and my own recomputation. The files are `Main.lean 8d864da2…`, `FORMALIZATION-STATE.json 5411a8c2…`, `CANDIDATE-PROOF.md cc9fa001…`, `FINAL-ANALYSIS.md 16bb743e…`, `C2-SCOPE-AUDIT.md ad24a0fe…`, `THEOREM-CONTRACT.yaml 61029a50…`, `axioms.txt fe4fbfbf…`, `DEPENDENCIES.yaml f2d29a42…` and `CLAIM-IDENTITY.json 97abd89e…`.
- **Fragment digests for entries 41–44.** The four digests the return cites are `50dcce4a…`, `972d0d90…`, `dbd200bd…` and `b7ee9d1a…`. Each equals the SHA-256 of its `Snippets/004x-*.fragment` file, the `source_sha256` in `FORMALIZATION-STATE.json`, and the `VERITYOS ENTRY` banner in `Main.lean`.
- **T1 artifacts.** `fixed_points.py` is `74e34689…d1c6c1f` (matches). `fixed_points.out.json` is `1ec01100…fabc8c` (matches). I copied both out to `scratchpad/c1-crit-T1-F/replay/` and re-ran the script there. The output is byte-identical (`1ec01100…`), and the internal digest `bee4fa79…` is reproduced.
- **Model disclosure.** T1's line "chartered sonnet/xhigh … claude-sonnet-5" is consistent with `C1-ALLOCATION.md` (routes: Sonnet 5 xhigh).

## Independent re-derivation

**Instrument.** `scratchpad/c1-crit-T1-F/crit_instrument.py` (SHA-256 `b7e5fe2e36a970b85ad7e93b6947ed4d041679491b763036520e7254591608cb`). I wrote it from `SEMANTIC-CONTRACT.md` §1, not from T1's script.

- It uses the standard library only (`itertools, json, hashlib, math, sys`) and exact integers.
- Deletion is realised as avoidance on the original carrier. `q_j` is counted directly as independent `j`-sets meeting `W`, never through the split identity.
- Graphs pass a 2-colouring test. Trees pass an edge-count-plus-connectivity test.
- Free trees are enumerated up to isomorphism by a centre-rooted AHU canonical string ("AHU canonical form").

Output `out14.json` SHA-256 is `c604bce42d6caf6c0eff9b17b192df3d901c00bd77c0dd2fea6dff1234861211` (results digest `faa35b8c…`). A copy-out rerun in `rerun/` gave a byte-identical file.

**Fixed points, reproduced before anything else.**
- `K_2`, `α = 1`: at `p = 1`, both leaf terms are `0` and both leaves are favourable, so `S = 0`.
- `P_3`, `α = 2`: the term at `p = 2` is `−1`.
- `K_{1,m}`, `m = 2..12`, every `p = 1..m+1`: for `p ≥ 2` the term equals the closed form `C(m−1,p) − C(m−1,p−1)`, and it is nonpositive exactly when `2p ≥ m`.
- At `p = 1` the direct term is `m − 1`, not the closed-form value `m − 2`. Instrument rows `(m, term, closed form)`: `(2,1,0), (3,2,1), (4,3,2), (5,4,3)`. The reason is that `Δ_0` of the empty graph is `0 − 1 = −1`, not `0`. This confirms T1's observation that the contract's star closed form is valid only for `p ≥ 2`.
- Labelled bipartite graph counts for orders 1–6 are `1, 2, 7, 41, 376, 5177`. Free-tree counts for orders 1–14 are `1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159` (A000055).

**Exhaustive checks (`bounded_computation`; exact horizons).**

| Claim | Horizon | Rows | Failures |
|---|---|---|---|
| Split identity `q_j = i_j(H) − i_j(H − W)` | every labelled bipartite graph of order ≤ 6, every `W ⊆ V`, `j = 0..n+1` | 2,739,102 | 0 |
| (TSB) at `1 ≤ k ≤ a`, integer form | same graphs, every `W` | 1,235,654 | 0 |
| (TSB) integer form at `k = 0` | same graphs, every `W` | 344,082 | 0 |
| (TSB) integer form at `k > a` | same graphs, every `W` | 1,159,366 | 0 |
| (HTP) with (HTA) aggregate, every leaf, every `p ≥ 1` under the guard | same graphs | 44,074 | 0 |
| (HTP), `p = 1` rows only | same graphs | 2 (both leaves of `K_2`) | 0 |
| General `p = 1` formula `term = deg(s) − 1` | EVERY labelled graph of order ≤ 6, bipartite or not, every leaf | 32,110 | 0 |
| Graphs with a leaf and `α = 1` | all labelled graphs of order ≤ 6 | exactly one: `K_2` | — |
| (HTP) on trees, every leaf, every `p` under the guard | trees of order ≤ 12 | 27,184 | 0 |
| (ELIG): trees eligible at `p = α − 2` | trees of order ≤ 14 | 4,123 eligible; minimum `α` = 7 | 0 |
| `i_2(T) = C(n,2) − (n − 1)` | every tree of order ≤ 14 | — | 0 |
| `i_3(T) = C(n,3) − (n−1)(n−2) + Σ_u C(deg u, 2)` | every tree of order ≤ 14 | — | 0 |
| `6Δ_2 = (n−1)(n−2)(n−9) + 6D` | trees of order 2–14 | 5,446 | 0 |

The named `Δ_2` cases, with `D = Σ_u C(deg u, 2)`:

| Tree | `D` | `Δ_2` | Formula | `x` | `α` |
|---|---|---|---|---|---|
| `P_7` | 5 | −5 | −5 | 2 | 4 |
| `K_{1,6}` | 15 | 5 | 5 | 3 | 6 |
| Spider `S(2,2,2)` | 6 | −4 | −4 | 2 | 4 |

**Derivation by hand of the `Δ_2` identity (the brief asked for it).** A forest has no triangles, so a 3-set contains 0, 1 or 2 edges. A 3-set with 2 edges is a 2-path, counted once by its centre.

- The number of 3-sets containing at least one edge is `m(n − 2) − Σ_u C(deg u, 2)`.
- So `i_3 = C(n,3) − m(n−2) + D`. With `m = n − 1`, which needs connectivity as well as acyclicity: `i_3 = C(n,3) − (n−1)(n−2) + D`.
- Then `Δ_2 = i_3 − i_2 = (n−1)[n(n−2)/6 − (n−2) − n/2 + 1] + D`.
- The bracket simplifies to `(n − 2)(n − 9)/6`, so `Δ_2 = (n−1)(n−2)(n−9)/6 + D`.

The brief's guessed middle term `(n−1)(n−2)` is correct: it is `m(n−2)` with `m = n − 1`.

**The low-`α` exclusions, recomputed.**

| `α` | Forces | Order | Why `Δ` stays nonnegative |
|---|---|---|---|
| 4 | `x ≤ 0` | — | `Δ_0 = n − 1 ≥ 0` |
| 5 | `x ≤ 1` | `n ≥ 6` | `Δ_1 = C(n,2) − 2n + 1 = C(n−1,2) − n`, which is 4 at `n = 6` and increasing after |
| 6 | `x ≤ 2` | `n = 7` | the complement of a maximum 6-set is one vertex covering all 6 edges, so its degree is 6, `D ≥ 15`, and `Δ_2 ≥ −10 + 15 = 5` |
| 6 | `x ≤ 2` | `n = 8` | two vertices cover 7 edges, so `d + e ≥ 7`, `D ≥ C(3,2) + C(4,2) = 9`, and `Δ_2 ≥ −7 + 9 = 2` |
| 6 | `x ≤ 2` | `n ≥ 9` | both terms of the formula are `≥ 0` |

All of this agrees with T1 §6.

**(HTP) `p ≥ 2`, re-derived in my own words.**
1. Put `k = p − 1 ≥ 1`, `U = V ∖ {v, s}` and `W' = N(s) ∖ {v}`. Inside `U`, meeting `R_v = {s} ∪ N(s)` is the same as meeting `W'`: `s ∉ U`, `v ∉ U`, and `s ∉ N(s)` by irreflexivity.
2. The split identity gives `term = q_p − q_{p−1}`.
3. Every independent `A ⊆ U` extends by `v`, because the only neighbour of `v` is `s ∉ A`. So `|A| ≤ α − 1`.
4. The guard gives `2(α − 1 − k) ≤ k`.
5. (TSB) with cap `α − 1`, together with step 4, gives `k·q_p ≤ k·q_{p−1}`. Cancelling `k ≥ 1` gives `q_p ≤ q_{p−1}`.

This matches `Main.lean` lines 1099–1153 exactly.

**(TSB) re-derived.**
- Each tagged `(k+1)`-set `B` has at least `k` tag-preserving deletions: delete any vertex other than one fixed `w ∈ B ∩ W`.
- Each tagged `k`-set `A` has at most `2(a − k)` extensions. Its addable set `E` splits by colour, and `A ∪ (E ∩ colour class)` is independent, so each part has at most `a − k` vertices.
- Double counting gives the bound. This matches lines 817–957.

## Attacks and findings

**F1. The `p = 1` endpoint does not need bipartiteness, and its Lean form is simpler than T1's (critic-derived; see advance A1).** T1 §4 step 4 gets `|V| ≤ 2` from the 2-colouring. That step is valid: an empty colour class is harmless, since `|X| ≤ α` holds trivially for `X = ∅`. It is also unnecessary. `α(G) = 1` together with a leaf forces `N(s) = {v}` on every finite simple graph. My instrument agrees: among all 33,867 labelled graphs of orders 1–6 (1 + 2 + 8 + 64 + 1,024 + 32,768), the only graph with a leaf and `α = 1` is `K_2`. T1's endpoint proof is correct but uses a hypothesis it does not need.

**F2. By contrast, `hBip` is load-bearing for `p ≥ 2` and for (TSB). T1 asserts this but does not show it; I exhibit witnesses. Neither is in scope, since both graphs are non-bipartite, so these are records, not counterexamples.**
- (TSB) fails on `K_1 ⊔ K_5` with `W` = the isolate, `α = 2`, `k = 1`: `k·q_2 = 5 > 2(a−k)·q_1 = 2` (`nonbip_tsb.py` → `nonbip_tsb.out.txt`).
- (HTP) fails on `G` = path `v–s–w` plus two disjoint triangles. Here `α = 4`, `p = 3`, `3p = 9 = 2α + 1`, and the term is `+3` (`q_3 = 9`, `q_2 = 6`) (`nonbip_htp.py` → `nonbip_htp.out.txt`).
- No non-bipartite graph of order ≤ 6 has a positive guarded term. So the smallest such witness has order between 7 and 9; I did not determine it.
- T1's claim that `hBip` enters the leaf-term proof only inside `Core.card_extension_le` (line 826) is confirmed by reading the source.

**F3. The `hk` / `hka` question, which T1 left to F1, settled here (critic-derived; see advance A2).**
- *`hk : 1 ≤ k` is redundant in entry 41.* Neither `tagged_deletions_lower` nor `tagged_extensions_upper` takes it, and `nlinarith [hcount]` closes without it (lines 942–957). The statement is also true at `k = 0`, because `q_0 = 0`: the empty set meets no `W`.
- *`1 ≤ k` is load-bearing one level up.* It is consumed in `leaf_tagged_monotone`, where the `nlinarith` step cancels `k` from `k·q_p ≤ k·q_{p−1}`. So `k ≥ 1` is needed for the (HTP) cancellation, not for (TSB).
- *`hka : k ≤ a` is mathematically dispensable even in ℤ.* For `k > a`, `q_k = q_{k+1} = 0`, so both sides are `0`. My instrument confirms the integer form with no `k`-hypothesis at 344,082 rows with `k = 0` and 1,159,366 rows with `k > a`, 0 failures.
- *Correction to T1 §5 step 5.* T1 calls the ℕ→ℤ recast "valid unconditionally". That is wrong for the natural proof route. Casting gives `2·↑(a − k)·q_k`, and rewriting `↑(a − k)` as `↑a − ↑k` needs `Nat.cast_sub hka`. Without `hka`, the ℤ statement needs a separate vanishing argument (`q_k = 0` for `k > a`, by `card_le_indepNum`). So `hka` is consumed by the cast, which contradicts step 5 as written, while step 4 ("not needed to typecheck step 3") is right.

**F4. (ELIG) extraction mis-attributes where tree hypotheses enter.**
- T1 §6 step 7 says the `n ≥ 9` branch uses `hT.isAcyclic` "STANDALONE, not the bundled tree fact". `delta_two_nonneg_large` uses both `hT.card_edgeFinset` (line 1314) and `hT.isAcyclic` (line 1315).
- T1's summary says the `n ∈ {7, 8}` branch "avoids the formula entirely". `delta_two_nonneg_seven/eight` both invoke `indepCount_three_add_edge_incidence G hT.isAcyclic` (lines 1398, 1412), which is the same `i_3` inclusion–exclusion identity, specialised by `norm_num` at `n = 7, 8`. Acyclicity therefore enters that branch too; T1's step-7 bullet names only the edge count and the cover.

Correct attribution: connectivity enters only through `IsTree.card_edgeFinset` (`m = n − 1`), which appears in `order_ge_alpha_succ`, `delta_one_nonneg`, all three `Δ_2` branches, and the cover degree bounds. Acyclicity also enters standalone, through `triple_local_identity` (line 523, `hF.cliqueFree 3`), in all three `Δ_2` branches. The mathematics is unaffected; the dependency diagram needs correcting.

**F5. (HTP) tag set: the prose disagrees with itself.** T1 §3 step 2 sets `W := N_G(s) ∖ {v}`, and step 7 applies the bound with `W := R_v`. Lean uses `R_v`. The two agree inside `U = univ ∖ H_v` by the argument in step 1 of my (HTP) re-derivation, which uses irreflexivity. Step 2 also attributes "`W ⊆ V(H_v)`" to `H_subset_R`, but that lemma proves `H_v ⊆ R_v` as deletion sets. The mathematics is harmless; the prose needs cleaning up.

**F6. (HTP) row of the distinction table leaves out one gap.**
- The gap column lists only the `p = 1` case. Entry 42's `leaf_term_nonpos` takes `hShadow` as a hypothesis and is `private`. So the (HTP) award must also discharge `hShadow` with entry 41, as entry 44 does, and carry entries 41 and 42 in one source file.
- T1's §3 step 7 does perform the composition, so this is a table omission, not a proof gap.
- The table also has no row for Target 4 (TRN), which allocation item 1(e) asks for "for each of the four targets … (if any)". TRN has no internal declaration; T2 owns it.

**F7. Minor points.**
- T1 §3 step 6 says the `by_cases hbig` split "guards" the ℕ subtraction in `hcoeff`. In fact `hcoeff` is proved by `omega` before the split (line 1112) and holds in truncated ℕ regardless. The split exists to use `tagged_zero_above_leaf_cap`.
- T1 §0 says (HTA) "closes" `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` on the high-tail region. That should read "would close, on its award": (HTA) is not yet certified.
- T1's `route_verdict: proved_conditional` justifies "conditional" by formal verification still being outstanding. That is not a mathematical condition. The informal proofs are unconditional.

**No in-scope failure found.** Every literal hypothesis the brief lists holds at the horizons above:

| Brief item | Result |
|---|---|
| `W = ∅` | inside the TSB sweep |
| `k = a`, `k > a` | covered by the `k > a` rows and the `1 ≤ k ≤ a` rows |
| Disconnected graphs, isolates | inside the labelled sweep |
| A `K_2` component, where `deg s = 1` | the `p = 1` formula gives `0`; at `p ≥ 2` the guarded terms are nonpositive |
| `p − 1` at `p = 1` | handled by the endpoint |
| The ℕ `α − 2` at `α < 2` | `omega` reading confirmed; the hypothesis is false there |

The `P_3 ⊔ K_2`-type terms at `3p = 2α` lie outside the guard; they are F1's boundary record.

## Mechanism-equivalence and fence check

- **(TSB) vs `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` (REFUTED; "at most `r` addable vertices" over full G1 tuples at `r = p − 2`).** T1's reasons for treating these as distinct are correct: a per-set bound of `2(a − k)` from the colour split, and a comparison of counts. The brief asked for a witness; T1 gave none. Mine: the perfect matching `3K_2`, `S` = one endpoint, `k = 1`, `a = 3`. It has `4` addable vertices, which exceeds `k = 1` and equals `2(a − k) = 4`. So the `2(a − k)` bound is attained with equality. This illustrates the distinction; it does not refute the refuted key, whose scope is G1 tuples.
- **(HTP) vs `E993-BETA-TARGET` (REFUTED; governed `RTree`, `k_A ≥ 2`, favourable-selector premise).** T1's reason is correct: ordinary bipartite graphs, no selector, a rank restriction. For the witnesses, T1 cites `C2-SCOPE-AUDIT.md` §2, which records `T_22`: `α ≥ 67`, `3p = 102 < 135`; and `T_60`: `α ≥ 180`, `3p = 270 < 361`. This is consistency, not evidence, as it should be.
- **Other neighbouring keys.** `E993-BETA-AGG-SUPPORT` is correctly distinguished. `E993-PAIR-ALPHA-FLOOR` and `E993-C3-GRAPH-ADDABLE-VERTEX-AVERAGE-IDENTITY` are neighbours or ingredients, not aliases; I checked their registry statements.
- **Registry figures.** I reproduced T1's lexical figures exactly: the registry holds 407 claims, and statement + scope + aliases matching the 7 terms gives 45 distinct keys. The three auxiliary keys are `OPEN`, `formal_award: False`, `aliases: []`.
- **Fences.** No no-recovery wording. The existing awards are treated as inputs only. No lower-region attack. No census, root-correction or Hall step. The compiled-internal declarations are consistently labelled "context, NOT separately awarded" (fence §3.8). T1 registers no `E993-R29-…` key.

**Critic-derived advances. Both are STATED at a review stage and need an isolated second read before registration.**

- **A1 (`p = 1` endpoint on every finite simple graph; Lean-shaped).** Claim: let `G` be a finite simple graph and `v` a leaf with support `s`. If `2α(G) + 1 ≤ 3`, then `C5LA1.R G v = C5LA1.H G v`, so the `p = 1` term is `x − x = 0`.

  Proof:
  1. The guard gives `α ≤ 1`.
  2. `v ∈ N(s)` by `support_adj`.
  3. Suppose some `w ∈ N(s)` has `w ≠ v`. Then `w ≠ s` by irreflexivity. `v` is not adjacent to `w`, since `support_unique` would force `w = s`. So `{v, w}` is an independent 2-set, and `IsIndepSet.card_le_indepNum` gives `2 ≤ α`, a contradiction.
  4. Hence `N(s) = {v}`, `R = insert s {v} = {v, s} = H`, and the term is `sub_self`.

  Consequences:
  - No colouring, no `|V| = 2`, and no `Δ_0` evaluation is needed. For U1, this is a shorter `p = 1` branch than T1 §4.
  - Together with F2, (HTP)'s `hBip` is needed only on the `p ≥ 2` branch.
  - Grade: `proved_informal` (critic-derived). Corroborated by the order ≤ 6 census: only `K_2` qualifies, and the formula `deg(s) − 1` holds on all 32,110 leaf rows.

- **A2 ((TSB) at every natural `k`).** For every finite bipartite `H`, every `W` and every `k ∈ ℕ`: `(k:ℤ)·q_{k+1} ≤ 2((α(H):ℤ) − k)·q_k`. The case `1 ≤ k ≤ a` is the registry statement. At `k = 0`, `q_0 = 0`. For `k ≥ a`, `q_{k+1} = 0`; and for `k > a`, `q_k = 0` as well. Grade: `proved_informal` (critic-derived). It is a companion form only; the registry statement keeps `1 ≤ k ≤ a`.

## Certification audit

Every certification literal in the return, checked against the shipped `fixed_points.out.json` (replayed byte-identically):

| Return literal | Shipped evidence | Ruling |
|---|---|---|
| "All 726 checks passed (0 failed)" | `summary.checks_passed = 726`, `failed = 0` | backed |
| Star `p ≥ 2` closed form "35 rows, all match" | 2+3+…+8 = 35 `formula_matches_direct` rows | backed |
| Star `p = 1` "all 7 checks pass" | 7 `p1_matches_general_deg_minus_1_formula` rows | backed |
| Split identity "across all `W ⊆ V` … (52 rows, all match)" (§5) | `tagged_count_split_sample_count = 80`; `W` is a hand-picked list of 3–4 subsets per graph (15 in total), not all `W` | **STRUCK**, both "all `W ⊆ V`" and "52" |
| (TSB) "156 spot-check rows" (§8) | `tsb_sample_count = 419` | **STRUCK** (the shipped count is 419) |
| Trees "145 tree instances … all 145 match" and "145/145" (§7, §8) | `tree_i2_identity_sample_count = 140` | **STRUCK** (140) |
| Trees "the star and path at each order, plus … the first 40 lexicographic Prüfer sequences" (§2, §7) | The code uses only the first 40 lexicographic Prüfer sequences per order (all 3 at `n = 3`, all 16 at `n = 4`). For `n = 5..7` every such sequence begins `0,0,…`, so the path is never generated. The labelled instances cover few isomorphism classes. | **STRUCK** ("star and path"); the horizon is the Prüfer prefix only |
| Output SHA `1ec01100…`, internal digest `bee4fa79…`, script SHA `74e34689…` | reproduced | backed |
| 9 source digests; fragment digests 41–44 | recomputed | backed |
| Registry "407 claims", "45 distinct matches", `aliases: []` | reproduced | backed |
| Mathlib pins `Clique.lean:991`, `Bipartite.lean:286`, `Acyclic.lean:56/60/296` | read at the pinned shared project | backed |
| IMPORT LIST including `heapq` | `heapq` is imported locally inside `prufer_to_tree` (line 323); the file header omits it | backed (the header comment is incomplete) |

A cosmetic defect in the shipped output: every TSB `detail` string prints `k*q_(k+1)=… > 2*(a-k)*q_k=…`, even when the check passes. For example, `star_K1_4 W=[3] k=1: … =3 > … =6` with `pass: true`. The boolean is computed correctly (`ok = lhs <= rhs`, line 423), but the text reads as a failure. It should be reworded before any reuse.

T1 does not use "formally verified", "sorry-free", "exact census" or "byte-identical" anywhere as a certificate for its own objects. Its grades are `proved_informal` with non-exhaustive `bounded_computation` corroboration, which is honest. The (TSB), (HTP) and (ELIG) mathematics is not weakened by the struck literals; only the corroboration counts change.

## Verdict

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Retained:**
- T1's extraction of (TSB) to registry scope, (HTP) for `p ≥ 2` and `p = 1`, (HTA) at `p = 1`, and (ELIG). I re-derived each one independently and found them mathematically correct at `proved_informal`. Nothing in the return was found false in scope.
- The general `p = 1` formula `deg(s) − 1`, confirmed on every leaf of every graph of order ≤ 6.
- The observation that the star closed form fails at `p = 1`, which corrects the contract's unqualified phrasing.

**Narrowed:**
- Strike the corroboration literals "52 rows / all `W`", "156", "145 / 145/145" and "star and path".
- Correct the (ELIG) hypothesis attributions (F4).
- Correct the §5 step 5 claim that the ℤ cast is "unconditional"; `hka` is consumed by `Nat.cast_sub` (F3).
- Reconcile the `W` / `R_v` prose (F5).
- Add `hShadow` discharge and single-file carry to the (HTP) gap column (F6).

In my judgement, the mathematics of (TSB), (HTP) and (ELIG) is complete at grade `proved_informal`. No target is formally verified by this route.

## Remaining obligation

1. **U1 / Stage 7.** Formalise at registry scope:
   - (TSB): `U = univ`, `hcap := IsIndepSet.card_le_indepNum`, then `push_cast [Nat.cast_sub hka]`.
   - (HTP): case split on `p`. At `p = 1`, use A1's `R G v = H G v` route, which needs no colouring. At `p ≥ 2`, carry entries 41 and 42 in one file and discharge `hShadow` with `taggedShadowBound`.
   - (HTA): `Finset.sum_nonpos` over (HTP).
   - (ELIG): a byte-identical carry of entries 15–40 and 43, re-exported.
   - Each award must pass its own fidelity and kernel gate and print `#print axioms`.
2. **Second reads.** A1 and A2 each need an isolated second read before any registration. By default they are companion lemmas, not keys.
3. **Dependency diagram.** It must record connectivity (`card_edgeFinset`) and acyclicity (`isAcyclic` → `triple_local_identity`) as they actually enter each `Δ_2` branch (F4).
4. **Open question, out of scope.** The smallest non-bipartite graph with a positive guarded leaf term, somewhere in orders 7–9, is an unresolved record. It is not needed for any target.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-crit-T1-F/`:

| File | SHA-256 |
|---|---|
| `crit_instrument.py` | `b7e5fe2e36a970b85ad7e93b6947ed4d041679491b763036520e7254591608cb` |
| `out14.json` (run as `python3 crit_instrument.py 14`) | `c604bce42d6caf6c0eff9b17b192df3d901c00bd77c0dd2fea6dff1234861211` |
| `rerun/crit_instrument.py`, `rerun/out14.json` (copy-out rerun) | byte-identical output `c604bce4…` |
| `nonbip_tsb.py` | `4f2a2e62d6847151338f1ebdb2d1b34c42830affde35c76bc34badf8fc3d3364` |
| `nonbip_tsb.out.txt` | `2385bfbb44c355aafb4d7bfa4e0ebf08eaf8ebf9cf50cdfa5207be9e15e6ec35` |
| `nonbip_htp.py` | `7d532f3e06076abec9cac212b82dd98ce1ee0a4ede1cb179e539fa578824307e` |
| `nonbip_htp.out.txt` | `a0a06bfca8fc212cf993132a4c358377f0af4bc06110ec9820242331534f2813` |
| `replay/fixed_points.py`, `replay/fixed_points.out.json`, `replay/fixed_points.stderr.txt` | copied out of `scratchpad/c1-T1/` |
| `replay/replay.out.json` (T1's script re-run) | `1ec01100b7ae6d7d9724fffbac65d8e57b0a2701f37c02974e5c14cd32fabc8c` |
| `replay/replay.stderr.txt` | — |

I launched no background jobs; every computation ran in the foreground and finished, so there is nothing to kill. Critique path: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/cycles/cycle-1/stage4/critics/T1/F/CRITIQUE.md`.
