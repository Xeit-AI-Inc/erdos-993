# Route Return — `U1`, Cycle 6, r30

**Route:** `C6-U-01 LEAN-GK-AND-SPIDER-FAMILY-AWARDS`. **Orientation:** U (formal/structural). **Load-bearing obligation** (`control/C6-ALLOCATION.md`, item 5): "(a) If C5-LA1 did NOT close: complete its DAG ... FIRST. (b) `C5-LA2` on `S(1,2,3^k)`: the definition layer (`spiderOneTwoThrees`), tree layer, `indepNum = 2k+2`, `crossingIndex`, E-2 ..., N5 (the hook-product chain-predecessor injection), leaf-1 disjointness, and the composition — contract-ready statements for a terminal Stage 7."

**Model disclosure:** chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); runtime-reported model id: `claude-sonnet-5`.

## Boot acknowledgment

I am operating within VerityOS. I booted by reading **exactly** two files, in this order: `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I did not follow the startup protocol's own map into memory, conversations, modules, skills, logs or decisions — the controller has booted for the run. The host placed the project `CLAUDE.md` and the user's auto-memory index into my context at session start; I did not act on either beyond stating this boot in the format the dispatch requires.

## Dispatch and seal verification

Dispatch `control/dispatch/c6-stage3/DISPATCH-U1.md`: SHA-256 recomputed with `shasum -a 256` before reading it: `34dbb0dae23fc45372e82568a628d4940a49e30950977e12c56f02e5fb478074`, **match** with the value given to me.

`control/C6-STAGE2-PACKET-MANIFEST.json`, inner seal (SHA-256 of the canonical JSON without `seal_sha256`, `sort_keys=True`, `separators=(",", ":")`, no trailing newline), recomputed by `scratchpad/c6-U1/verify_seal.py` (SHA-256 of the script `ba5e5dfa1ee1575375534082613e1a19a9bf1821c524dcbf147cf6423c2554f1`):

```
recorded_seal : 29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611
computed_seal : 29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611
MATCH
```

Replay (copy-out-first): `cd scratchpad/c6-U1-replay/ && python3 -B verify_seal.py` (script digest `ba5e5dfa1ee1575375534082613e1a19a9bf1821c524dcbf147cf6423c2554f1`, identical copy, rerun independently with the same result).

## Sources read and digests verified

Byte-identical carries, each verified against its origin's recorded digest before use:

| Source | Role | SHA-256 |
|---|---|---|
| `runs/lean-2026-09-26-c1-la1-active-tag-weight-identity/LeanProject/LeanProof/Main.lean` | carried `→ LeanProof/Carried.lean` (definitions of record, entries 1–36) | `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` (match) |
| `runs/lean-2026-09-26-c1-la1-.../LeanProject/{lakefile.toml,lake-manifest.json,lean-toolchain,LeanProof.lean}` | byte-copied project seed | `lakefile.toml` `45d0ca58…`; `lake-manifest.json` `52a4d73c…`; `lean-toolchain` `2bdc48ad…` (all match) |
| `sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Snippets/0014-definition-C5LA1-crossingIndex.lean.fragment` | carried `→ LeanProof/CrossingIndex.lean` | `378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb` (match; also matches `control/SOURCE-DIGESTS.json`) |
| `runs/lean-2026-09-27-c4-la1-gk-deletion-saturating-flow-every-rank/LeanProject/LeanProof/Snippets/0073-…mem_indepFamily_iff…`, `0074-…erase_mem_indepFamily…`, `0075-…saturatingFlow_of_perTag_deletionInjections…` | carried `→ LeanProof/CarriedC4LA1.lean` (**E-2** / N4) | `d30c9ae0035311c89520623588b7418ed42be1a95848546b7b181e1a257411e5`; `2832798965770e894f108bf878bbc98df5a0a0b7738130529c712b613d44442b`; `72ae49fe71d5923ebf506d4d48f40139072320a394af5c8f6b7611fa898fb048` (all match the C5-STAGE7-FORMALIZER-BRIEF-LA1.md entry table) |
| `sources/mathlib-binding/PIN.json` | pin check | toolchain `leanprover/lean4:v4.32.2`; Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` — the shared project's own `lake-manifest.json` reports the identical revision for the `mathlib` package (verified by `python3 -B -c "..."` reading `.lake/packages` after the symlink bind) |
| `scratchpad/c5-U1/LeanProject/LeanProof/Main.lean` | **read and copy-out-replay only, never written**; template for `gkGraph_isTree` (U1, Cycle 5; formally_verified via C5-LA1) transcribed to the spider's edge set | `05c24dda55cea6f877bc2e3caed0a156e559e6ef6254d303d81e377aaf64165e` (matches the citation in `control/C5-STAGE7-FORMALIZER-BRIEF-LA1.md`: "lines 2957–3229") |

Prose sources read in full (all within the dispatch's grant): `control/C6-WORKER-COMMON-BRIEF.md`; `SEMANTIC-CONTRACT.md`; `SOLUTION-CONTRACT.md`; `control/C6-ALLOCATION.md`; `control/C6-STAGE1-GATE.md`; `cycles/cycle-6/stage2/ROUTE-STATE.md`; `cycles/cycle-5/stage7/LEAN-GATE-CLOSEOUT.md`; `control/C5-STAGE7-FORMALIZER-BRIEF-LA1.md` (named explicitly by the dispatch for obligation (a)); `cycles/cycle-5/CYCLE-CLOSE.md`; `cycles/cycle-5/stage6/SYNTHESIS.md`; `cycles/cycle-5/stage5/adjudicators/F/ADJUDICATION.md`; `second-reads/SR-C5-2/SECOND-READ.md`; `cycles/cycle-5/stage3/returns/U1/RETURN.md`; `cycles/cycle-5/stage4/critics/U1/{T,F}/CRITIQUE.md` (the last three read in full but not load-bearing for anything below, since obligation (a) resolved from the closeout and close records alone — a disclosed over-read, harmless, matching the run's own convention for such items).

**`control/C6-STAGE2-PACKET-MANIFEST.json`** (452,559 bytes) was **not read in full** (it exceeds a single-read window); only its seal was recomputed over the parsed JSON, per item 1 of the shared obligations. This is not a partial verification: the seal recompute reads and canonicalizes every byte of the file via `json.load`.

## Obligation (a): C5-LA1

`cycles/cycle-5/CYCLE-CLOSE.md` §1 and §3, and `cycles/cycle-5/stage7/LEAN-GATE-CLOSEOUT.md`, state that the bounded Stage 7 attempt **CLOSED `formally_verified`, zero repair rounds**: key `E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK`, terminal `E993Transport.gk_lowerRegionWeightedHall_everyEligibleRank`, kernel receipt verified, 183 declarations, no `sorryAx`. Both open nodes named by `control/C5-STAGE7-FORMALIZER-BRIEF-LA1.md` (N4a, N4b) were closed by the formalizer (ruling 2, 3 of the closeout). **Obligation (a) is therefore already discharged; nothing remains for U1 to do on `C5-LA1`.** This route accordingly turns entirely to obligation (b), `C5-LA2` on `S(1,2,3^k)`.

## Registered claims touched (named before any evidence below)

This route presents **no census and no numeric flow table**; the only "evidence" below is Lean source that either kernel-checks or does not. Consistent with `SOLUTION-CONTRACT.md` §3.9 ("every award is a separate certificate") and R29-N-12 (a companion lemma carries no certificate of its own), nothing in this route changes the grade of any registered claim. For the record:

- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (HALL, Tier 1): **untouched**, OPEN at full scope.
- `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2` (the spider key; VERIFIED `proved_informal` at the Cycle 5 close): **not re-derived and not re-graded**. This route attempts a **Lean formalization** of its already-certified informal content; the key's grade stays `proved_informal` until (if ever) a governed Stage 7 award closes a Lean text for it.
- `E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK` (C5-LA1): **untouched**, `formally_verified`, unchanged (see Obligation (a) above).
- `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (WID, C1-LA1) and `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (C1-LA2): **untouched**; their carried Lean definitions are used unmodified (byte-identical) but neither lemma is invoked by name in any theorem below.
- The ten refuted mechanism keys (`SOLUTION-CONTRACT.md` §3.2): **not touched, not revived**. This route's mechanism is the per-tag deletion injection **on one named family**, `S(1,2,3^k)`, exactly as the spider key already states; nothing here is a universal claim.
- `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (the primary aggregate): **untouched**.

**No new registry key is proposed by this route.** The new Lean declarations below (`spiderOneTwoThrees`, `spiderOneTwoThrees_isTree`, `hookChainIndex`, `hookPred`, `hookPred_injOn_rank`, and the five draft lemmas) are Lean-engineering nodes feeding a **future** governed award for the already-registered spider key, not standalone mathematical claims; per ruling 48, none of them is or could be mistaken for a key (they are Lean identifiers, not predicates offered for registration), so no alias screen against `sources/authority/CLAIM-IDENTITY.json` or the run-local registry is owed for them. I did check, as a courtesy, that none of these five identifiers collides lexically with any working label barred from key/alias use by ruling 48 (`CD-1, CD-2, E1-R, R3, CT-1, R2′, L2, C1, A7, A5, F-3, GK-MONO, E-1, E-2, N1–N7, (L-S)_top, (ELIG-top), 𝒞_8`); none does (they are new Lean names, not tokens drawn from that list, and are not being submitted as aliases of anything).

## Step-by-step derivation

### N1 — the tree layer: `spiderOneTwoThrees` and its `IsTree` proof (Lean, **sorry-free**)

**Definition.** `spiderOneTwoThrees k : SimpleGraph (Fin (3*k+4))` via `spiderEdge k` and `SimpleGraph.fromRel`, on the vertex labelling `0` = root, `1` = pendant leaf, `2` = middle of the path `0–2–3`, `3` = cherry leaf, and for `i < k`: `a_i = 4+3i`, `b_i = 5+3i`, `c_i = 6+3i` (the pendant path `0–a_i–b_i–c_i`). This is exactly the tree of `SEMANTIC-CONTRACT.md`'s `E-1` / `SR-C5-2`'s `S_k`. **Finiteness** enters at the type `Fin (3*k+4)` itself (a `Fintype`); **decidability** of `Adj` is supplied by `spiderOneTwoThrees_decAdj`, an explicit instance (finite disjunction of `Nat` equalities plus a bounded `∃ i < k`), not `Classical.dec`.

**Method.** Transcribed from `gkGraph_isTree` (U1, Cycle 5; `scratchpad/c5-U1/LeanProject/LeanProof/Main.lean:3222`, digest `05c24dda…`, itself `formally_verified` via C5-LA1), with `G_k`'s second cherry leaf (`gkVertex k 4`) removed and every arm index shifted down by one (offset `4` instead of `5`). The method is `SimpleGraph.isTree_iff_connected_and_card`: **connectivity** (`spiderGraph_connected`, via an explicit `Reachable` witness from the root of length ≤ 3 for every vertex, `spiderGraph_reachable_zero`) together with **exactly `3k+3` edges on `3k+4` vertices**, shown by exhibiting an explicit **bijection between edges and non-root vertices** — the child–parent map `spiderChildEdge` (`v ↦ s(v, spiderParent k v)`) — proved **injective** (`spiderChildEdge_injective`, from strict monotone decrease of `spiderParentVal`) and with **range exactly the edge set** (`spiderChildEdge_range`, by an explicit case split on the vertex label). This is the "acyclicity-and-connectivity test in code" the shared rules require: Mathlib's `IsTree` is connectivity plus acyclicity, and `isTree_iff_connected_and_card` reduces acyclicity, for a connected graph, to the edge count `|E| = |V| - 1`, which is exactly what the bijection establishes.

**Where every hypothesis enters.** `IsTree` (connectivity and the edge count, proved separately as required by the shared rules) is the THEOREM's conclusion, not a hypothesis; there is no other hypothesis in `spiderOneTwoThrees_isTree (k : ℕ) : (spiderOneTwoThrees k).IsTree` beyond `k : ℕ` itself (the statement holds for **every** `k`, including `k = 0`, where the tree degenerates to a 4-vertex path-like shape with an empty arm family — the case split `hcase` in `spiderGraph_reachable_zero` covers `n ≤ 3` uniformly in `k`, and the arm existential is vacuous when `k = 0`). No ℕ-subtraction is unguarded: every occurrence of `v.val - 1`, `h - i`, or `(n-4)/3`-style arithmetic is behind an explicit `by omega` discharging the guard from hypotheses already in context (`hv : v.val ≠ 0`, or a `by_cases` split), exactly as in the `gkGraph` template.

**Kernel check.** `#print axioms E993Transport.spiderOneTwoThrees_isTree` → `[propext, Classical.choice, Quot.sound]` — the three permitted axioms, no `sorryAx`. `grep` for `sorry|admit|native_decide` over `LeanProof/Spider.lean`: **no match**.

### E-2 / N4 — the per-tag sufficiency lemma (Lean, **carried, sorry-free**)

`E993Transport.saturatingFlow_of_perTag_deletionInjections` (C4-LA1's entry 75, with its dependencies entries 73–74) states, for **any** finite simple graph `G` and **any** tag set `F`: if every active tag has an injective single-deletion map into the next layer that keeps it active, the assembled counting map `f(B,A) = #{τ active in B : φ_τ(B) = A}` is a saturating flow supported on deletion arcs. This is **exactly** `E-2` (`SEMANTIC-CONTRACT.md`, the F2/F-adjudicator lemma, `proved_informal`-level informally; here **kernel-checked**, since C4-LA1 is `formally_verified`) and answers the F adjudicator's open question ("probably already a node of C4-LA1's DAG, which I cannot see in my capsule" — `cycles/cycle-5/stage5/adjudicators/F/ADJUDICATION.md`, `E-2`): **it is**, byte-identically, and it compiles unmodified against my carried `LeanProof/Carried.lean` (only entries 1–36 were needed as its dependencies; no `gkGraph`-specific text was pulled in). Carrying this fragment discharges the "E-2 (carried from C4-LA1's text where present)" clause of the allocation exactly.

### N5 — the hook-product chain-predecessor injection: **two-factor case proved** (Lean, **sorry-free**); general finite-product case **open**

`SEMANTIC-CONTRACT.md`'s `E-1` proof (`SR-C5-2` step (2)) constructs, for each tag class, a partition of a product of small chain posets into "hooks" and shows the map to the chain predecessor is injective and total above a rank threshold. The Cycle 5 F adjudicator named the **cleared integer form** as N5: "for a finite product of ranked posets, each partitioned into saturated chains with `2·centre ≤ c_i`, the chain-predecessor map is defined and injective at rank `r+1` whenever `2(r+1) ≥ Σ c_i + 1`" (`SYNTHESIS.md` `### C5-LA2`).

`LeanProof/HookChain.lean` formalizes and **proves** the **two-factor base case** of this construction directly on a grid `[0,h] × [0,L] ⊆ ℕ × ℕ`:

- `hookChainIndex h i j := if i+j ≤ h then j else h - i` — the hook (saturated chain) a point lies on, verbatim from `SR-C5-2`'s "`(i,j)` lies in `C_j` when `i ≤ h-j` and in `C_(h-i)` otherwise".
- `hookPred h i j` — the chain-predecessor map, `none` exactly at a chain bottom.
- `hookChainIndex_rank_injective` — **the partition property**: a chain index together with a rank determines the point (proved by `split_ifs <;> omega`, since the two cases collapse to `j₁=j₂` resp. `h-i₁=h-i₂` under the shared-rank hypothesis).
- `hookPred_chain_and_rank` — the predecessor decreases rank by exactly 1 and preserves the chain index.
- `hookPred_isSome_of_rank_ge` — **totality**: `2(i+j) ≥ h+L+1` (with `i≤h`, `j≤L`) rules out the only failure mode (`i=0 ∧ i+j≤h`), by an arithmetic argument using `j ≤ L` to bound the case `i=0` (this is exactly where the hypothesis `j ≤ L`, i.e. the SECOND factor's bound, enters — not needed anywhere else).
- `hookPred_injOn_rank` (**the theorem**) — at every rank `r+1` with `h+L+1 ≤ 2(r+1)`, `hookPred h` is total and injective on that rank's fiber, proved by combining the three lemmas above (chain+rank determine the point; `hookPred` preserves chain and decrements rank; hence two preimages of the same value share chain and rank, hence are equal).

**Where every hypothesis enters.** `i ≤ h` is used in `hookChainIndex_rank_injective` (so that `h-i` is a faithful non-truncating index) and in `hookPred_chain_and_rank`'s case split; `j ≤ L` is used **only** in totality, exactly at the point where a would-be bottom `(0, r+1)` is ruled out by combining `r+1 ≤ L` (from `j ≤ L` with `i=0`) with the rank bound to force `r+1 > h`. `2(r+1) ≥ h+L+1` is used only in totality; the injectivity half needs no rank-threshold hypothesis at all beyond both points sharing rank `r+1` (an unconditional fact about the partition, matching `SR-C5-2`'s claim that "the hooks are disjoint and cover the grid" is rank-independent).

**What remains open (the honest gap).** `SR-C5-2` step (2) iterates this two-factor hook construction over the **finitely many factors** of a tag's remainder poset (`k+1` copies of a length-3-chain-shaped factor for a tip tag; a product of `k` factors for each class of leaf `1`) to get the general finite-product partition, then applies the resulting chain-predecessor map at the appropriate threshold. **That iteration (a finite induction composing the two-factor hook construction with itself, and the bookkeeping that centres add under the composition) is NOT formalized here.** This file discharges the base case only; extending it to the `k`-fold product used by the tip and leaf-1 classes of `E-1` is the concrete remaining Lean obligation on N5, and it is the smallest node that, once closed, makes N6 (the class-disjointness argument, which reuses the same iterated partition) and the terminal composition (N7) tractable as real proofs rather than drafts.

**Kernel check.** `#print axioms E993Transport.hookPred_injOn_rank` → `[propext, Classical.choice, Quot.sound]`, no `sorryAx`. `grep` for `sorry|admit|native_decide` over `LeanProof/HookChain.lean`: **no match**.

### N2, N3a, N3b, N6, N7 — draft statements (type-checked, **not proved**; `sorry`)

`LeanProof/SpiderDraft.lean` states, and confirms **type-correct** against the carried definitions and `spiderOneTwoThrees` (built and axiom-checked as the **separate** target `LeanProof.SpiderDraft`, deliberately **not** imported into the sorry-free `LeanProof` library target, so that target's zero-`sorry` claim above stays clean):

- **N2** `spiderOneTwoThrees_indepNum (k) : (spiderOneTwoThrees k).indepNum = 2*k+2`. Informal proof (`SR-C5-2` step (2b), re-derived independently there by conditioning on the root): the independence polynomial is `(1+y)(1+2y)(1+3y+y²)^k + y(1+y)(1+2y)^k` (matching `E993-PAIR-SPIDER-CLOSED-FORM`, VERIFIED), of degree `2k+2` with top coefficient `2` (the second summand has degree `k+2 < 2k+2`). The missing Lean bridge is a generating-function argument (conditioning `IsIndepSet` on membership of the root) that is not yet built for this graph.
- **N3a** `spiderOneTwoThrees_crossingIndex_le (k) (hk : 1 ≤ k) : crossingIndex (spiderOneTwoThrees k) ≤ k+1`. Informal proof (`SR-C5-2` 2b): the descent identity `Δ_{k+1} = (e_{k+2}-e_k) - k·2^{k-1} < 0`, using `e_{k+2} = e_{k-2} ≤ e_k` — itself provable **with no classical dependency** from the iterated `k`-fold hook partition of `(1+3y+y²)^k`'s factor (every chain centred at exactly `k`), i.e. directly from **N5 iterated**, once that iteration is formalized.
- **N3b** `spiderOneTwoThrees_crossingIndex_ge (k) (hk : 5 ≤ k) : k+1 ≤ crossingIndex (spiderOneTwoThrees k)`. Informal proof (`SR-C5-2` 2c, the repaired uniform-in-`k` form): `Δ_j ≥ 0` for `0 ≤ j ≤ k`, split at `3j ≤ 2k+2` (unimodality, again from the hook centre bound) and `3j > 2k+2` (Newton's inequalities for the real-rooted `(1+3y+y²)^k`, **classical, named as an undischarged dependency** exactly as `SOLUTION-CONTRACT.md` requires for a cited theorem not under `sources/`).
- **N6** the leaf-`1` per-tag deletion injection, stated as an existential matching E-2's hypothesis shape exactly (so that, once proved, it composes with `saturatingFlow_of_perTag_deletionInjections` directly by `apply`). Informal proof: `SR-C5-2` step (1)/(2), the class split by "first root present among `2, a_1, …, a_k`"; each class a product handled by the (iterated) hook construction; disjointness of class images because a within-class deletion never introduces or removes a class root.
- **N7** the terminal composition at the minimal `(b′)` scope, `spiderOneTwoThrees_weightedHall_at_kPlus3 (k) (hk : 5 ≤ k) : ∃ f, IsSaturatingFlow (spiderOneTwoThrees k) (favorableLeaves (spiderOneTwoThrees k) (k+3)) (k+3) f`. This is assembled, on the face, from N1 (proved), N2, N3a (⇒ eligibility of `p=k+3`), and E-2 (carried, proved) fed by N6 and its two sibling classes (tip, and the vacuous cherry leaf `3`, which by the root-exclusion argument of `SR-C5-2` step (0) has no active source at any `p ≥ k+2` and so needs no injection at all).

**Kernel check (documenting these as NOT proved, per the shared grading rule "a compiled declaration with `sorry` is not a theorem").** `#print axioms` on `spiderOneTwoThrees_indepNum` and on the terminal `spiderOneTwoThrees_weightedHall_at_kPlus3` both report `sorryAx` in the axiom list, confirming neither is a kernel-checked proof; both are recorded here as `compiled-scratch` with a stated **missing bridge**, never as `proved`.

## Grades (per `SOLUTION-CONTRACT.md` §4)

| Item | Grade | Note |
|---|---|---|
| `spiderOneTwoThrees`, `spiderOneTwoThrees_isTree` (N1) | **theorem** (Lean, sorry-free, kernel-checked, 3 permitted axioms) | new this route |
| `saturatingFlow_of_perTag_deletionInjections` and its two dependencies (E-2/N4) | **theorem** (Lean, sorry-free, carried from a `formally_verified` award) | carried, not new mathematics |
| `hookChainIndex`, `hookPred`, `hookPred_injOn_rank` (N5, two-factor case) | **theorem** (Lean, sorry-free) | new this route; a genuine but PARTIAL discharge of N5 |
| N5, general finite-product case (the iteration) | **missing bridge** | not attempted in Lean this route |
| N2, N3a, N6, N7 | **compiled-scratch** (type-checks; `sorry`) with a **missing bridge** each | draft signatures only |
| N3b | **compiled-scratch** (type-checks; `sorry`) with a **missing bridge**; the informal content is `confirmed_with_repairs` at `proved_informal` (`SR-C5-2`, decisive) — the Lean bridge additionally names Newton's inequalities as an undischarged classical dependency |
| The spider key `E993-R30-SPIDER-…-RANK-K-PLUS-2` | `proved_informal` (**unchanged**; VERIFIED at the Cycle 5 close) | this route neither strengthens nor weakens it |
| `E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK` (C5-LA1) | `formally_verified` (**unchanged**) | Obligation (a) already discharged before this cycle |
| (HALL) at full scope | OPEN (**unchanged**) | this route makes no claim about it |

## Alias check

No new registry key is proposed (see *Registered claims touched*, above); consequently there is no candidate statement to run the lexical-plus-mathematical screen (`sources/authority/CLAIM-IDENTITY.json`, `control/CLAIM-IDENTITY.run-local.json`) against. I confirmed, as stated above, that none of my six new Lean identifiers reuses a ruling-48 working label.

## headline_resolved: no

## Route verdict

**`compiled`** — two DAG nodes (N1, and the two-factor case of N5) advance from "closed on the face, open in Lean" to genuinely kernel-checked Lean text; the per-tag sufficiency lemma (E-2/N4) is confirmed to carry byte-identically with no gkGraph-specific baggage; five further nodes (N2, N3a, N3b, N6, N7) are reduced to type-checked draft statements with a named missing bridge each, ahead of a future Stage 7 attempt. No award is claimed; no census or numeric flow evidence is presented; (HALL) and every other registered claim are untouched.

## Remaining obligation (successor inheritance)

A successor U-orientation seat (or a future Stage 7 formalizer, once the informal DAG's Lean debt is judged small enough to fund a bounded attempt) inherits, in dependency order:

1. **The N5 iteration** (finite products of more than two hook-partitioned factors): compose `hookPred`/`hookChainIndex` of `HookChain.lean` with itself over a `Finset`-indexed family of factors (the natural target is a function `Fin m → (ℕ × ℕ)` of `(h_i, L_i)` pairs, iterating `hookPred`/`hookChainIndex` pairwise and proving the centre sum `Σ c_i` is preserved by the iteration — an induction on `m`, not new combinatorics). This is the single blocking step for N2's degree argument, N3a/N3b's `e_{k+2}=e_{k-2}` and unimodality facts, N6's per-class injections, and N7's assembly.
2. **N2** (`indepNum = 2k+2`): once the iteration exists, a generating-function argument conditioning on the root (mirrored on `spiderGraph_adj_zero_two`/`spiderGraph_adj_zero_one`/`spiderGraph_adj_zero_arm`'s case split, already available).
3. **N3a, N3b**: the descent identity and its sign; N3b additionally needs Newton's inequalities as a named, undischarged classical dependency (not under `sources/`), exactly as `E1`'s rank-threshold key already carries a Darroch dependency — no new policy question, just the same treatment.
4. **N6**: the three per-tag classes (tip, leaf `1`'s sub-classes, and the vacuous cherry leaf `3`, whose informal proof is a two-line root-exclusion argument already fully worked in `SR-C5-2` step (0) and should be the first of the three actually attempted, being the easiest).
5. **N7**: `apply saturatingFlow_of_perTag_deletionInjections` (already carried and compiling) against the three per-tag maps of N6, once N2/N3a supply eligibility.
6. Only after N1–N7 all close sorry-free does a Stage 7 capsule (byte-identical carry of this route's `Carried.lean`, `CrossingIndex.lean`, `CarriedC4LA1.lean`, `Spider.lean`, `HookChain.lean`, plus the now-real N2/N3a/N3b/N6/N7) become a candidate bounded attempt for the registered spider key, at grade `formally_verified` if it closes.

Nothing above authorizes widening the spider key's scope, touching (HALL), or re-deriving any already-`formally_verified` or `proved_informal` fact informally; every step is Lean engineering against content already established on the face.

## IMPORT LIST

Standard library only, `python3 -B` throughout: `json`, `hashlib`, `sys` (`scratchpad/c6-U1/verify_seal.py` and its replay copy). No third-party packages; no network; no `pip`/`brew`/`npm`/`elan` invocation (the Lean toolchain and Mathlib were already pinned and built by a prior session; I only bound them by manual symlink and never ran `lake update`/`lake clean`/`elan`).

## Lean project provenance and digests

Project root `scratchpad/c6-U1/LeanProject/` (byte-copied `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`, `LeanProof.lean` from `runs/lean-2026-09-26-c1-la1-active-tag-weight-identity/LeanProject/`, all byte-identical per the table above); shared Mathlib bound by `mkdir -p LeanProject/.lake && ln -s /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages LeanProject/.lake/packages` (never copied); Mathlib revision verified `905b95818eb32af7874a58b427f50c1711a5e96c`, matching `sources/mathlib-binding/PIN.json` exactly.

| File | SHA-256 | Sorry-free? |
|---|---|---|
| `LeanProject/LeanProof/Carried.lean` (= C1-LA1 `Main.lean`, byte-identical carry) | `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` | yes (pre-existing, `formally_verified`) |
| `LeanProject/LeanProof/CrossingIndex.lean` | `3fb2dbd616927b2120c5191701f95a5c906d46f037b268a8a8424baf0af46577` | yes (carried body byte-identical; only the import preamble is new) |
| `LeanProject/LeanProof/CarriedC4LA1.lean` | `a038149579c3a147d40709015a2afadaf560f56133a2a5e2a771365a2f8b3272` | yes (carried bodies byte-identical; only the import preamble is new) |
| `LeanProject/LeanProof/HookChain.lean` | `91c85fa236f91491fa57f72b19011dbcce18dfe287b3cbbe092d88e1c5d7e7fb` | **yes — new this route** |
| `LeanProject/LeanProof/Spider.lean` | `18396be59b7f2ad510d6efbef6e633b3581ecc20249cba3524f0397d1eedc4ee` | **yes — new this route** |
| `LeanProject/LeanProof/SpiderDraft.lean` | `8ae4f2f671481e1a45350daf6a9974a40966bef774e10ceb23c71c6bc4cc6a1c` | **no — deliberately `sorry`; built only as the separate target `LeanProof.SpiderDraft`, never as part of `LeanProof`** |
| `LeanProject/LeanProof.lean` | `a259e82d0f502ccbba528ba38e65a3a8edc6d9db96e6656405bbf8961aa0481f` | imports `Carried, CrossingIndex, CarriedC4LA1, HookChain, Spider` only — **not** `SpiderDraft` |

**Build evidence.** `cd scratchpad/c6-U1/LeanProject && lake build LeanProof` → `Build completed successfully`, foreground, no detached process. `#print axioms` (run via `lake env lean` on a throwaway probe file, deleted after use, never committed) confirmed for `spiderOneTwoThrees_isTree`, `hookPred_injOn_rank`, and `saturatingFlow_of_perTag_deletionInjections`: `[propext, Classical.choice, Quot.sound]`, no `sorryAx`, on all three. `grep -nE "(^|[^-a-zA-Z])sorry([^-a-zA-Z]|$)|\badmit\b|native_decide"` over `Carried.lean, CrossingIndex.lean, CarriedC4LA1.lean, HookChain.lean, Spider.lean`: **no match**. Separately, `lake build LeanProof.SpiderDraft` succeeds with five `declaration uses 'sorry'` warnings (exactly the five draft lemmas), and `#print axioms` on two of them reports `sorryAx`, confirming they are not claimed as proofs.

**Replay commands** (copy-out-first target `scratchpad/c6-U1-replay/`, never `/tmp`):
- `cd scratchpad/c6-U1-replay/ && python3 -B verify_seal.py` (Stage 2 seal; result above).
- `cd scratchpad/c6-U1/LeanProject && lake build LeanProof` (the sorry-free library; foreground).
- `cd scratchpad/c6-U1/LeanProject && lake build LeanProof.SpiderDraft` (the draft target; foreground; expect five `sorry` warnings, zero errors).

## Process and disclosures

- **Foreground only.** Every `lake build`, `lean`, and `python3 -B` invocation in this route ran in the foreground and completed before the next command; **no background job was started, so none needed to be killed**.
- **No writes outside my grant.** Nothing was written under `sources/`, `control/`, `cycles/` (other than this one `RETURN.md`, written last), any other experiment root, or `/tmp`. All scratch is under `scratchpad/c6-U1/` and `scratchpad/c6-U1-replay/`.
- **No `lake update`/`lake clean`/`elan`.** The shared Mathlib packages directory was only read from, via the symlink; nothing under it was modified.
- **No bytecode.** `find scratchpad/c6-U1 -iname "__pycache__" -o -iname "*.pyc"`: no match.
- **Read-boundary disclosures.**
  1. `ls cycles/cycle-5/` and `ls cycles/cycle-5/stage7/` (non-recursive; to locate `CYCLE-CLOSE.md` and `LEAN-GATE-CLOSEOUT.md`, both individually authorized): showed the sibling stage-directory names `stage2`…`stage6`. None of their contents outside the specifically authorized files (listed above) was opened.
  2. `ls control/ | grep -i STAGE7` (to confirm the exact filename `control/C5-STAGE7-FORMALIZER-BRIEF-LA1.md`, already named verbatim by my dispatch): the underlying `ls` executed against all of `control/`, though only the grepped lines were displayed to me. I opened no `control/*STAGE7*` file other than `C5-STAGE7-FORMALIZER-BRIEF-LA1.md`, which the dispatch itself names.
  3. `ls second-reads/ | grep -i C5` (to confirm `second-reads/SR-C5-2/` existed before reading it): the underlying `ls` executed against all of `second-reads/`, though only the grepped lines were displayed. I opened only `SR-C5-2/SECOND-READ.md`.
  4. `find scratchpad/c5-U1 -maxdepth 4 -type d` and a `find ... -iname "*.lean"` restricted to that same directory: `scratchpad/c5-*/` is explicitly within my grant (read-and-copy-out-replay only); this `find` was rooted at, not above, a granted directory. Nothing was written there.
  5. I read `cycles/cycle-5/stage3/returns/U1/RETURN.md` and `cycles/cycle-5/stage4/critics/U1/{T,F}/CRITIQUE.md` in full (all individually authorized); none of the three ended up load-bearing for anything in this return, since Obligation (a) was resolved directly from `cycles/cycle-5/CYCLE-CLOSE.md` and the Stage 7 closeout. A disclosed over-read, harmless.
  6. No `find`/`grep`/`rg` was run rooted above any directory in my grant; no full process listing (`ps aux`) was run at any point; no PID was polled or killed (nothing was ever backgrounded); no network access or package install of any kind occurred.

## Ten-line summary (for the reply)

route_verdict: compiled. headline_resolved: no. Load-bearing step: N1 (`spiderOneTwoThrees_isTree`, Lean, sorry-free) is mine, new this route. Also mine, new: the two-factor base case of N5 (`hookPred_injOn_rank`, sorry-free) and the confirmation that E-2/N4 carries byte-identically from C4-LA1 with no `gkGraph` baggage. Obligation (a), C5-LA1, was already closed `formally_verified` before this cycle — nothing to do there. Smallest open Lean lemma: the finite-product iteration of the hook construction (N5's general case), needed before N2/N3a/N3b/N6/N7 (stated, type-checked, `sorry`) can become real proofs. No registered claim's grade changed; no new key proposed; no census; no background jobs. Disclosures: three benign non-recursive `ls`/`find` calls at or within granted directories (listed above), and a harmless authorized over-read of three Cycle 5 U1 files that turned out not to be load-bearing.
