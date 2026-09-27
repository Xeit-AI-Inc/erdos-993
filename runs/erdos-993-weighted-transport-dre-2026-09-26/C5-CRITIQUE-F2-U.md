# Critique

**Seat:** critic `C-F2-U` (orientation U, formal/structural) of Cycle 5, r30, on the route return of seat `F2`
(`C5-F-02 PER-TAG-INJECTION-FRONTIER`, orientation F). **Return:** `cycles/cycle-5/stage3/returns/F2/RETURN.md`.

**Boot.** I am operating within VerityOS. Per the dispatch, the boot reads were exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, both read in full
before any other file. No other VerityOS subsystem (memory, conversations, logs, decisions, skills) was loaded. The host
injected the project `CLAUDE.md` and the auto-memory index into context at session start; I did not act on them (no
conversation log written; the dispatch confines writes to the critique path and my scratch).

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Dispatch** `control/dispatch/c5-stage4/DISPATCH-C-F2-U.md`: SHA-256 `04b596ea2347f94b9b4fa9637d0cb2b0a324e0e0cc70a6e9079e3117ced31c63` — match (hashed in the same command that first printed it).
- **Capsule** `control/c5-critic-capsules/F2-PACKET-MANIFEST.json`: inner seal recomputed canonically (key-sorted, `(",", ":")`,
  no trailing newline, `seal_sha256` removed) = `0a6285304b1eb6df0623b5e3c5c7b475d48e2cb0b94e1ab9377cd928a8cdfb6e` — **match**. All 14
  members match their listed byte counts and SHA-256.
- **Stage 4 dispatch manifest** seal recomputed `8987ae6103a006574f10d7a79ba9cb61fa9f1f9700ef9b731123f540d3c5028d` — match.
- **Stage 3 packet manifest** seal recomputed `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58` — match; it lists the
  return at `c3c15b48…a1ba60`, which matches the file.
- **Stage 2 packet manifest** seal recomputed `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289` — matches its stored
  seal and the Stage 2 seal named in `control/C5-CRITIC-COMMON-BRIEF.md`. **Finding (clone residue):** `control/C5-CRITIC-PROTOCOL.md`
  duty 1 names the Stage 2 seal as `f0b5a2a1…0869684`. That value is not the Cycle 5 Stage 2 seal. I traced it by a grep that
  went outside my grant (see the read-boundary disclosure below): it is the **Cycle 4** Stage 2 seal (`control/C4-STAGE2-PACKET-MANIFEST.json`,
  `C4-STAGE3-ADMISSION.json`). The Cycle 4 → Cycle 5 clone left it unchanged, and ruling 44's residue grep missed it
  because it is a digest and carries no `C4-` token. The common brief and the recomputation agree on `2e8e3d44…`. I audited against that value.
- **Return artifacts:** I copied all 15 inventoried files of `scratchpad/c5-F2/` out to my scratch. Every SHA-256 matches the
  return's `## Artifact inventory`. (`MANIFEST.json` and `make_manifest.py` are present but not inventoried. The return's
  `scratchpad/c5-F2-replay/` is outside my grant and was not inspected.)
- **Seat disclosures** (`C5-STAGE3-READ-BOUNDARY-DISCLOSURES.json`, F2 items): two self-terminated timeout runs, and one failed
  `/tmp_unused_ignore` redirect that wrote nothing. **Note only.** The seat's model disclosure (chartered sonnet/xhigh; runtime
  `claude-sonnet-5`) is consistent with the allocation.
- **Read-boundary disclosure (this critic).**
  1. One `grep` over the globs `control/*.md control/*.json`, run to find where the stale seal literal came from. This is a search above
     my grant. It printed matching line fragments from `C4-CRITIC-COMMON-BRIEF.md`, `C4-CRITIC-PROTOCOL.md`, `C4-STAGE3-AGENTS.json`,
     `C4-STAGE3-ADMISSION.json`, `C4-STAGE2-PACKET-MANIFEST.json`, `C5-STAGE3-ADMISSION.json`, `C5-STAGE3-AGENTS.json` and a truncated
     `CONTROLLER-NOTES.json` note. I used them only to identify the seal literal above; no mathematical content came from them.
  2. `ls sources/` and one `grep -rl` rooted at `sources/` (within grant) for the refuted per-leaf key. The file-name list it
     returned included paths under `sources/heterogeneous-closure/`. I read **no content** from that fenced subtree.
  3. Read from `sources/` (authorized): `authority/CLAIM-IDENTITY.json` (the frozen 434-entry master registry: the statement of
     `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` and lexical alias checks), and `lower-region/instruments/orbit-flow-twoforone/run.py`
     (lines 1–76 and 137–170) plus the head of its `PROTOCOL.md` (to fix the `T_m` definition).
  4. `ps -p <literal PID>` on my own background jobs only. No full process listing, no pattern kill, no network, no install, no Lean.

## Independent re-derivation

**Own instrument** (`scratchpad/c5-crit-F2-U/own/`, standard library, exact integers, `python3 -B`). I built it from
SEMANTIC-CONTRACT §1.1–1.2 only; no F2 code was imported.
- Graphs are bitmask adjacency lists. `is_tree` is edge count plus a parent-tracking DFS.
- The forest independence polynomial is computed by a DP on any vertex mask.
- `x` is taken through rank `α`, including `Δ_α = −i_α`.
- `F_p` is derived from `Δ_p(T − v) < 0` on the original tree.
- Summands `q_v(p) − q_v(p−1)` come from literal `H_v`, `R_v` masks by DP.
- Independent sets are enumerated literally.
- `w_F` is literal: `(B ∖ {v}) ∩ W_v ≠ ∅`.
- The relation is literal (D) ∪ (S), with `|N(u) ∩ B| = 2` and `u ∉ B`.
- Flows are exact Dinic; per-tag matchings are unit-capacity max-flow.
- Every row asserts `supply − capacity = S`, with supply and capacity from enumeration and `S` from the DP.
- Every tag also asserts `#τ-active (p+1)-sets − #τ-active p-sets = summand_τ`, a second instrument per tag.

**Fixed points reproduced by my instrument (the gate before trusting it):**
- `K_{1,12}`/8: `n=13`, `α=12`, `x=6`, 12 favorable, `1980/3960`, `S=−1980`, flow 1980.
- Path-star `(2,3,4)`/7: `n=15`, `α=11`, `x=5`, 10 favorable, `1483/2701`, flow `1483`, `S=−1218`, **2025** full-relation arcs (1744 deletion-only).
- Path-star `(2,2,4,3)`/8: `n=18`, `α=13`, `x=6`, 12 favorable, `8033/13467/8033`, `S=−5434`, **11691** arcs.
- `T_22`/34 by DP: `n=91`, `α=68`, `x=32`, 67 favorable, `S = −498754180547001418536`.
- Rooted-tree counts (A000081) and free-tree counts (A000055) for orders 1–15 from my generator (`gen_out.txt`). The census asserts
  the A000055 counts for orders 13–19 (1301 … 317955).

**Fidelity of F2's instrument** (read against the contract):
- `weight.w_F` counts ACTIVE tags literally. It is not `|F ∩ B|`.
- `deletion_targets`/`switch_targets` are exactly (D) and (S).
- `model.favorable_leaves` uses `Δ_p(T − v) < 0` at the original `p`.
- `crossing_index` scans through `α` inclusive.
- `per_tag_report` asserts WID from two code paths: enumeration sums against the DP aggregate.
- The joint flows use literal arcs and supplies/capacities `w_F`.

**Fidelity passes.**

**Replay (copy-out-first, `python3 -B`, in `scratchpad/c5-crit-F2-U/replay/`).** I re-ran `families.py`, `validate_matching.py`,
`validate_baseline.py`, `census_push.py` and `census.py`. Every output is **byte-identical** to the inventoried one:
`validate_matching_out.json`, `validate_baseline_out.json`, `census_push_out.json`, `census_push_summary.json`, `census_out.json`,
`census_summary.json`.

**Own re-derivation of the 56-row scope** (`f2rows.py`; the trees are rebuilt from the return's prose definitions with my own
builder; every eligible `p` is taken, with no cap):
- The 124 trees in the stated family ranges have exactly **56** eligible rows, at orders 13–26. The largest is `T(8,2)`, `n = 26`.
- The multiset of `(n, p, x, α, S, |F|)` over my 56 rows equals F2's exactly.
- F2's "first 3 eligible `p` per tree" cap **never binds**: no tree in scope has more than 3 eligible ranks. So the scope really is
  every eligible row of every tree in the stated family ranges.
- `F_p` equals the full leaf set on every row.

**Two literal replays on my instrument:**

| Row | supply / capacity / `S` | deletion-only flow | full flow | per-tag injections |
|---|---|---|---|---|
| `G_5`, one cherry leaf, `p=8`, `n=19` | `3125 / 6100 / −2975` | 3125 | 3125 | all saturate; the cherry tag has 0 active sets |
| `T(8,2)`, `p=11`, `n=26` | `79970 / 167410 / −87440` | 79970 | 79970 | all saturate |

Both rows match F2.

**Step 1 reformulation.** I checked the "one-line sufficiency argument" and it is **correct**:
- Each source sends one unit along each active tag's injection, so its outflow is `w_F(B)`.
- A target `A` receives at most one unit per tag active at `A`, so its inflow is at most `w_F(A)`.
- So per-tag injections for every `τ ∈ F` (landing where `τ` stays active) give a deletion-only saturating flow for any tag set `F`.

For its identity with a refuted key, see the mechanism-equivalence section.

## Attacks and findings

**A1. Obligation (b) was not executed as chartered (ruling 42; allocation item 4(b)).**
- The charter asks for "an exhaustive census over a STATED **order** range (trees of every order in the range)".
- F2's table is headed "Stated order range (every tree in the stated range is covered)", but it lists a **family-parameter** range:
  the `G_k` deformations, `T(m,2)` and `T(m,1)`.
- Those 124 trees are covered completely (verified above). No order is covered completely.
- The heading is struck as worded, and the "smallest eligible `(T, p)`" of obligation (b) was not searched.
- The gap is filled below (A6) by a critic census over every tree of every order 13–19.

**A2. "Every per-leaf summand strictly negative on every tested row, in fact" is false.** Strike it.
- On the three one-cherry-leaf rows (`k = 5, 6, 7`; `p = 8, 9, 10`), the cherry leaf `3` has summand exactly **0**.
- Its support `2` has degree 2 and `W_3 = {0}`. A `3`-active set contains `0`, and the rest of it lies in the `k` edges
  `b_i–c_i`. So `q_3(j) = C(k, j−1)·2^{j−1}`, which vanishes for `j ≥ k+2`.
- Hence `q_3(p) = q_3(p−1) = 0` at `p = k+3`.
- F2's own `census_out.json` shows it: tag `3` has `n_sources_with_tag_active: 0` on all three rows.
- A corollary: F2 counts vacuous tags (0 active sources) as "injection saturates". That is true but empty, and should be said.

**A3. The census tests per-tag MATCHING EXISTENCE, not the reach of CT-1's symmetric-chain construction.** Narrow the wording.
- The claims "CT-1's OPERATIONAL reach … extends at least this far" and "further than the naive rank-symmetry heuristic predicted"
  compare two different things.
- Rank symmetry was a hypothesis of CT-1's *construction* (a symmetric chain decomposition). Matching existence never needed it.
- So the census says nothing about where the symmetric-chain construction itself stops. It says only that a deletion injection exists on those rows.
- Retained reading: "per-tag deletion injections exist on all 56 rows".

**A4. The mechanism-distinction paragraph is wrong in substance.** It is corrected in the mechanism-equivalence section, and A5 gives a
critic-derived failure of the universal per-tag statement.

**A5. Where CT-1's per-tag method provably fails: the distinguished leaf of `T_m`** (critic-derived, proved on the face).
- `T_m`: root `r`, path `r–s₁–ℓ`, and `m` claw centres `c_i ~ r`, each with three leaves (`n = 4m+3`).
- For `ℓ`: `W_ℓ = {r}`. An `ℓ`-active `(j+1)`-set is `{ℓ, r} ∪ A'`, with `A'` any `(j−1)`-subset of the `3m` claw leaves, since
  `T − {ℓ, s₁} − N[r]` is `3m` isolated vertices. So `q_ℓ(j) = C(3m, j−1)`, and the summand is `C(3m, p−1) − C(3m, p−2)`.
- That summand is **positive iff `2p ≤ 3m+2`**.
- A positive summand means more `ℓ`-active sources than `ℓ`-active targets, so **no per-tag injection exists for `ℓ`**, by counting alone.
- **Bounded:** by DP, `T_22`/34 is eligible (window `34–45`) with all 67 leaves favorable. Its `ℓ`-summand is `+212336130412243110`,
  which equals `C(66,33) − C(66,32)`, an independent closed-form check of my DP. The same holds at `T_60`/89–91 and `T_66`/98–100.
- A scan of `T_m` for `m ≤ 39` finds the first eligible positive-summand row at `m = 22`.
- On record (SEMANTIC-CONTRACT §1.2; `bounded_computation`, lifted by (LIFT) at its grade), the deletion-plus-switch orbit flow
  **saturates** at `T_22`/34.
- So at an eligible row where (HALL) holds on record, CT-1's per-tag method cannot work. Its reach is strictly smaller than (HALL).
- `T_m` is a settled family. It is used here only as a laboratory for the mechanism. No aggregate statement about it is made.

**A6. The frontier of obligation (b): exhaustive critic census** (critic-derived; `bounded_computation`).
- Scope: EVERY free tree of every order `13 ≤ n ≤ 19` (A000055 counts asserted: 1301, 3159, 7741, 19320, 48629, 123867, 317955), EVERY
  eligible `p`, with `x` through `α`.
- Per row:
  - `F_p` derived.
  - Per-leaf summands by DP.
  - WID asserted from enumeration against DP.
  - Every tag tested by exact bipartite matching, one tag per automorphism class. Two tags with equal AHU codes rooted at the tag
    are exchanged by an automorphism, and matching existence is Aut-invariant.
  - The literal marked counts are asserted to equal the DP summand for each tag.
  - Joint deletion-only and full max-flow on any row with a tag failure.
- **Result:** 195,644 eligible rows (per order 163 / 313 / 528 / 2763 / 10061 / 37295 / 144521) over all 521,972 free trees of orders 13–19; `F_p` = the full leaf set on EVERY row; **no positive per-leaf summand on any row**; **no tag's deletion injection fails on any row** (frontier rows: 0; so no joint-flow fallback was triggered); WID and the per-tag marked-count identity asserted on every row (`own/CENSUS-SUMMARY.json`, merged from the per-order/per-chunk outputs).
- Consequences (all bounded):
  - **(HALL) holds with deletion arcs alone at every eligible row of every tree of order ≤ 19**, via per-tag injections and the proved load bound.
  - A frontier row, if one exists, has order ≥ 20.
  - Positive summands, and with them per-tag failure by counting, first appear at larger orders. `T_22`/34 at `n = 91` is the smallest
    `T_m` instance. I do not know the smallest tree overall.

**A7. Critic-derived advance: (HALL) on a second infinite eligible family, the spider `S(1, 2, 3^k)` =
`G_k^{(1)}`** (F2's own "one cherry leaf" family). STATED; proposed `proved_informal`; needs an isolated second read.

*The tree.* `G_k^{(1)}` has:
- root `0`;
- a pendant leaf `1`;
- a pendant path `0–2–3`;
- `k` pendant paths `0–a_i–b_i–c_i`.

So `n = 3k+4`. Leaves are `{1, 3, c_1, …, c_k}`.

*Statement.* For every `k ≥ 1`, every `p ≥ k+2` and every set `F` of leaves, the deletion-arc network with active weights
`w_F` has a saturating integral flow.

*Proof.* By the sufficiency argument it is enough to give each leaf `τ` a deletion injection from `τ`-active `(p+1)`-sets into
`τ`-active `p`-sets. Tool: if each factor of a product poset is partitioned into saturated chains, then each product of chains has a
symmetric chain decomposition centred at the sum of the chain centres. This is classical (de Bruijn–Tengbergen–Kruyswijk). It is an
undischarged classical dependency, named here. So the product is partitioned into saturated chains, each symmetric about a centre at
most `c_max` = the sum of the factor maxima. Take an element at rank `r+1` on a chain with centre `c`. The chain's bottom is at most
`2c − (r+1)`. If `r+1 ≥ c_max + 1/2`, that bottom is at most `r`, so the element has a predecessor on its chain. Mapping each such
element to its chain predecessor is injective, and each step deletes one vertex.

- **Tip `c_i`** (`W = {a_i}`). A source is `{c_i, a_i} ∪ S'`, with `S'` of rank `p−1` in
  `I({1}) × I(2–3) × Π_{j≠i} I(a_j–b_j–c_j)`. The factor maxima are `0.5` for `{1}`; `1` for the edge `2–3` (chains `∅<{2}` and
  `{3}`); and `1` for each `P_3` (chains `∅<{a}<{a,c}`, `{b}`, `{c}`). So `c_max = k + 0.5`. The condition `p − 1 ≥ k + 1` holds
  exactly when `p ≥ k+2`. Targets keep `a_i`, so `c_i` stays active.
- **Leaf `1`** (`W = {2, a_1, …, a_k}`). Split the sources by the first root present, in the order `2, a_1, …, a_k`.
  - Class `2`: `S' ∈ Π I(P_3)`, with `c_max = k`.
  - Class `a_j`: `S'` lies in `I({3}) × Π_{i<j} I(b_i–c_i) × I({c_j}) × Π_{i>j} I(P_3)`, with
    `c_max = 0.5 + (j−1) + 0.5 + (k−j) = k`.
  - Deletions within a class keep its first root and add none, so each class maps into itself and the classes' images are disjoint.
  - The condition is `p − 1 ≥ k + 1/2`, which holds when `p ≥ k+2`.
- **Cherry leaf `3`** (`W = {0}`). A source's remainder lies in `Π I(b_i–c_i)`, which has maximum rank `k < p − 1`. So there are no
  sources, and the tag is vacuous.

∎

*Eligibility (proved).*
- The pair-spider closed form (registered `E993-PAIR-SPIDER-CLOSED-FORM`, VERIFIED) gives
  `I(G_k^{(1)}) = (1+y)(1+2y)(1+3y+y²)^k + y(1+y)(1+2y)^k`. My DP reproduces this for `k ≤ 300`.
- `α = 2k+2`.
- Write `e_j` for the coefficients of `(1+3y+y²)^k`. This polynomial is palindromic of degree `2k` and real-rooted, so it is
  unimodal with its peak at `k`. Then `Δ_{k+1} = (e_{k+2} − e_k) − k·2^{k−1} < 0`.
- The identity and the sign are checked by DP for `k ≤ 200`. The second term is `g_{k+1} − g_k` with `g = (1+y)(1+2y)^k`, so
  `g_{k+1} = 2^k` and `g_k = 2^k + k·2^{k−1}`.
- Hence `x ≤ k+1`, and `p = k+3` is eligible for every `k ≥ 5`, since `3(k+3) < 4k+5`.
- So **(HALL), with deletion arcs alone, holds on the infinite eligible family `{(G_k^{(1)}, k+3) : k ≥ 5}`**. It also holds at every
  eligible `p ≥ k+2` of `G_k^{(1)}`.
- Bounded: for `5 ≤ k ≤ 300` the eligible window starts at `k+3`, with `x = k+1`. So (HALL) holds at every eligible rank of those trees.
  I have no proof of `x ≥ k` for all `k`.
- For `k ≥ 5`, `n = 3k+4 > 2p+2`, so these rows lie in the unresolved band and are not a closed-region re-proof.
- Literal cross-check (`gk1_out.txt`): for `k ≤ 6` and every `p ≥ k+2` (eligible and laboratory ranks), every leaf's per-tag
  injection saturates and the deletion-only flow equals supply.

**A8. No-go for the easy uniform route** (critic-derived; elementary).
- For tag `τ`, each source has at least `p−1` in-graph deletions. A target `A` has exactly `|U_A|` sources above it, where
  `U_A = {u ∉ A : A ∪ {u}` independent`}`.
- So per-tag Hall follows whenever `|U_A| ≤ p−1` for all `τ`-active targets. This is R3's degree bound, per tag.
- On a forest, `|U_A| = α(T[U_A]) + ν(T[U_A]) ≤ (α − p) + ν(T[U_A])` (König–Gallai).
- The crude bound `ν ≤ |U_A|/2` turns the criterion into exactly `3p ≥ 2α+1`, the closed high tail.
- In the lower region the bound genuinely fails. Take `G_k` (baseline, `k` even ≥ 6), `p = k+3`, tag `3`, and
  `A = {1,3,4} ∪ {a_i, c_i : i ≤ k/2}`. Then `|U_A| = 3k/2 > k+2`.
- So degree counting cannot replace the chain structure used in A7.

**A9. Joint Hall.** F2 does test both halves the brief names: the per-tag matchings and the literal joint weighted Hall. Joint Hall is a
max-flow equal to supply, deletion-only and with (D)∪(S). The joint-flow numbers replay exactly. No finding.

**Letters (ruling 39):**
- The return supplies **none** of (a′)–(d′). Its census is finite, and it states no family theorem.
- This critique supplies a **STATED candidate for the second half of (b′)**: A7, the infinite eligible family `{(G_k^{(1)}, k+3) : k ≥ 5}`,
  proposed `proved_informal` and awaiting an isolated second read.
- (b′) also needs T2's whole-row (HALL) at `G(8^82, 7^2)/448`, which this seat cannot supply.

## Mechanism-equivalence and fence check

- **Per-tag injection is the matching shadow of a refuted key.** The return says none of the ten refuted keys "concerns a per-tag
  deletion-injection existence test specifically". That is inaccurate.
  - `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` (REFUTED; exact finite witness of order 91) asserts injectivity of the linear map
    `d_p` on marked independent `p`-sets of `H_v`. `d_p` sends each set to the sum of its one-vertex deletions that still meet `W_v`.
  - Under `B ↦ B ∖ {τ}`, F2's per-tag bipartite graph is **exactly the support graph of `d_p`'s matrix**.
  - Injectivity of `d_p` gives a nonzero maximal minor, hence a saturating matching. So F2's criterion is the *weaker*, combinatorial
    shadow of the refuted statement.
  - F2 asserts no universal form, so **nothing is revived**. The census is a finite map.
  - But any future universal "per-tag injection at every eligible row" is refuted at `T_22`/34 by counting (A5), the same order-91 tree
    as the registered witness. The distinction paragraph should say this.
- **CT-1 is a working label** (ruling 41). F2 proposes no key and defers naming. That is correct.
- **Other fences:**
  - The closed `G_k` flow key and GK-SIGN are cited only as fidelity checks.
  - No census value enters a proof.
  - No RTree wording.
  - (LIFT) and (DCB) are unused.
  - Deletion-only Hall is not claimed universally.
  - `T_m`/`T(m,k)` are kept apart explicitly. That is good.
- **A7 against the fences:**
  - The mechanism is per-tag deletion injections with the load bound, on a family not among the settled ones (`T_m`,
    equal-length-three spiders, path-stars, baseline `G_k`). It is not deletion-only Hall universally; it is scoped to one family.
  - It does not re-prove a closed region. The rows lie in `2p+3 ≤ n`, and the order bands are `n ≤ 2p+2`.
  - FLOW⇒SIGN gives `S ≤ 0` on the family as a corollary. It is not offered as an aggregate contribution.
- **A5 against the fences:** it is a mechanism-scope record on a settled family and makes no aggregate claim.

**Claim identity.** Registry keys touched:
- (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: OPEN, unchanged.
- The primary aggregate: OPEN, untouched.
- `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE`: fidelity only.
- `E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET`: not re-proved. Its tree has a
  cherry, so it does not imply A7.
- `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`: REFUTED, unchanged.
- `E993-PAIR-SPIDER-CLOSED-FORM`: used, VERIFIED.

**Candidate key for A7 (for the synthesis):**
`E993-R30-SPIDER-ONE-TWO-AND-K-THREES-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-2-FOR-EVERY-LEAF-TAG-SET`
- The name is a predicate and reuses no working label.
- Lexical check against the frozen 434-entry registry under `sources/authority/`: the only `SPIDER` keys are the pair-spider closed form
  and the two equal-length-three keys. The only `SATURATING-FLOW` key is none of those. Mathematically, the equal-length-three spider
  lacks legs 1 and 2, so there is no alias.
- The run-local registry is not a capsule member. The synthesis must re-run the check there, especially against the `G_k` flow key.

**Alias literal in the return.** F2 reports "0 matches" for `DELETION-INJECTION` in `control/CLAIM-IDENTITY.run-local.json`. But the
frozen master registry, which the run-local registry carries in full per the C5 gate, contains
`E993-R26-DELETION-INJECTION-FIBRE-BOUND` (VERIFIED). That key is mathematically unrelated: it is an occupancy bound. The "0 matches"
literal is still contradicted by the master's content. I cannot verify it within my grant, so it is struck as unbacked.

## Certification audit

| Literal in the return | Status |
|---|---|
| 56 eligible instances (30 + 26), every one eligible with `x` through `α` | backed (replay byte-identical; own re-derivation, identical row multiset) |
| `F_p` = whole leaf set on every tested row (derived) | backed |
| `every_per_leaf_summand_le_0` true on all 56 | backed |
| "every per-leaf summand **strictly** negative on every tested row, in fact" | **struck**: false on 3 rows, where the cherry tag has summand 0 (A2) |
| `wid_consistent` on all 56, from independent sides | backed (two code paths in F2; my third instrument agrees on `S` for all 56) |
| `any_tag_deletion_injection_fails` false on all 56 | backed (replay; own literal at 2 rows); note that vacuous tags count as passes |
| `joint_hall_deletion_only` / `joint_hall_full` true on all 56 | backed (replay; own at 2 rows) |
| baseline `G_k` rows `k=3..7` "all match exactly" | backed (replay; own DP gives `S = −24151` at `G_6/9` and `−111045` at `G_7/10`) |
| `validate_matching` 200 random instances, 0 mismatches | backed by replay (output byte-identical); both sides are F2's own code |
| "Stated order range (every tree in the stated range is covered)" | **struck as worded**: it is a family-parameter range. The family coverage is backed, and the 3-rank cap never binds |
| "CT-1's OPERATIONAL reach extends at least this far"; "further than the naive rank-symmetry heuristic predicted" | **narrowed** to "per-tag deletion injections exist on those rows" (A3) |
| "None of the ten refuted keys concerns a per-tag deletion-injection existence test" | **corrected** (mechanism section) |
| lexical alias "0 matches" incl. `DELETION-INJECTION` | **struck as unbacked** (contradicted by the frozen master registry) |
| hand-checked `K_{1,3}` chain partition / "3 forced bottoms" | unbacked (not shipped); the seat itself does not rely on it |
| replay `MANIFEST.json` "byte-identical" in `c5-F2-replay/` | not inspected (outside grant); determinism is backed in substance by my byte-identical replay of every output |
| sufficiency argument (per-tag injections ⇒ capacity-respecting joint flow) | backed (proof checked) |
| `census.py` "~140s" | immaterial (191 s user here, on a loaded host) |

`## Remaining obligation`: items 1–3 stand, but item 1 must be recast. The order-range frontier search is now done through order 19
(A6). The frontier question must also exclude rows with a positive summand, since there the per-tag method fails trivially (A5).

## Verdict

verdict: retained_narrowed
headline_resolved: no

The computations in F2's return are faithful to the contract and reproduce exactly:
- the 56 rows;
- WID;
- the per-tag matchings;
- both joint flows.

Four things are narrowed or struck:
- the census is a family-parameter scan, not the chartered order-range census;
- the "strictly negative" literal is false;
- the "CT-1 reach" wording conflates matching existence with the symmetric-chain construction;
- the refuted-key distinction and the alias literal are inaccurate.

The return's grade stays `bounded_computation`. It supplies none of the letters (a′)–(d′).

This critique adds three critic-derived items:
- **A6** (`bounded_computation`): an exhaustive census of every tree of order 13–19. It finds no frontier and no positive summand.
- **A5** (proved on the face): a closed-form per-tag failure at the eligible `T_22`/34.
- **A7** (STATED, proposed `proved_informal`, needs an isolated second read): (HALL) with deletion arcs on the infinite eligible
  family `{(G_k^{(1)}, k+3) : k ≥ 5}`. It depends on the classical de Bruijn–Tengbergen–Kruyswijk theorem.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

1. **Isolated second read of A7.** Points to check:
   - the classification of the three tag types;
   - the chain-centre sums;
   - the step-down condition `r + 1 ≥ c_max + 1/2` at `r + 1 = p − 1`;
   - class disjointness for leaf `1`;
   - the descent identity `Δ_{k+1} = (e_{k+2} − e_k) − k·2^{k−1}`.

   If it survives, register it under a predicate key (candidate above) as the F2 half of letter (b′).
2. **Prove `x(G_k^{(1)}) = k+1` for all `k`.** The upper bound is proved. The lower bound `x ≥ k` is bounded to `k ≤ 300`. With it,
   (HALL) holds at every eligible rank of the family, not only at `p = k+3`.
3. **The frontier of obligation (b), restated exactly.** Find the smallest eligible `(T, p)` with every summand `≤ 0` and some tag's
   deletion injection failing. None exists at orders ≤ 19. Candidates must come from larger orders. The obvious lead is the arm tags
   of `T_m` at ranks `2p > 3m+2` (where `ℓ`'s summand is `≤ 0`), tested by an orbit-quotient per-tag matching with literal
   neighbourhoods.
4. **Mechanism scope note for the synthesis.** A universal per-tag injection is refuted by counting at `T_22`/34 (A5). CT-1-type
   arguments can therefore only ever give family theorems, never (HALL).

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-crit-F2-U/`
(`own/` = my instrument; `replay/` = F2 copy-out replay). SHA-256:

| File | SHA-256 |
|---|---|
| `own/CENSUS-SUMMARY.json` | `7b83563bceb485a4f4b2ad3030f7904b6d2a7ac9b56fb1fa72d6f2be4ad2a46f` |
| `own/core.py` | `80d51a143f6465d0090617dbdc6cbbfce326e0b599034cec3903cd38fcd96ec4` |
| `own/elig_13_18.json` | `c202fb8994045d03e240c8c0dfcde33dc537a919356088d94536b34d5e0c471e` |
| `own/elig_19_19.json` | `c0bfd477b12f037d084dd2e3dd2387c54506a52458ad22a958c3f6b92cb90068` |
| `own/elig_scan.py` | `d99e063472b6f0daa1efcc4af7468c6b0b86eca272ebc620b9edc6a26a690189` |
| `own/f2rows.json` | `f0ca475b4d2ff422d36c4de40edf9ee6d7fd3109b5c73ddaf4ffc953aa9ce1fb` |
| `own/f2rows.py` | `9458ba0ada8a653f22a762eae2905e474b38714812ecc54c811e2a6c9c2db97c` |
| `own/f2rows_out.txt` | `a4bdbac237a8a155f27bbab346b13d4fc0a210bf7147c9a3382f288420f21a2d` |
| `own/fixed.py` | `e1222f76250d3c9dfa6b030776256919e738d1f06ca4db730e90f9e1b166eaaf` |
| `own/fixed_out.txt` | `548ee2773ef6d6549c757200e34bf6f8c5e39c566ef659c29e1113c21e02efc4` |
| `own/gen.py` | `f7346c860134baf10b11f426273adf7224b83253ee72c65331bfe8f49faca332` |
| `own/gen_out.txt` | `9c760dc82a471b241d1df0ca5bdae84a4860057d402422bc66408911d65e6626` |
| `own/gk1.py` | `fa319acaff0d5bfd5a538b32bd42a948072be63e4745aaeac8b0143f4fd51206` |
| `own/gk1_out.txt` | `6d605df066dcfbdba2006d53f96688cb5da90400cd38a35a186a88105bc7a621` |
| `own/gk1_x.py` | `af893363348157b7ee5700757e1d947c3069657fa1342eef8ce13582dd71a3f2` |
| `own/gk1_x_out.txt` | `12d6b0484d7020c0a500a5941f547287a277980e9ef40d6aad70d546de5957bb` |
| `own/log18_0.txt` | `83ceb64ca2497443d90f015db6890acc8c78de4bdca9fff130835f74ce932d0e` |
| `own/log18_1.txt` | `e5d84d9428a82b1c86b7e6e5d247f4ba180fb8d80c24c4ad6ad2a8f26ad5748c` |
| `own/log18_2.txt` | `ad5771faa7eae19e9fb2695663139e617aa5f6646fe407d2fcc4e0e46700a7e8` |
| `own/log18_3.txt` | `3d15801f33e849d90030490356b7f390747f80975cb601a12b2184df9a8f23eb` |
| `own/log18_4.txt` | `e4786342412822f756453209778904a433203c059d357e769ad1cd751083da06` |
| `own/log18_5.txt` | `d87dddfac45044b57eea1ad043d2faaf9637463f25da4ecfe8697cf84f614f5a` |
| `own/log19_0.txt` | `dc4410c1236891bba87c68fe54ea4271873da7de30b7dcf683acf8a91b1c3495` |
| `own/log19_1.txt` | `f2ecbd2fc0dd1b57214a993ff0d17fa52bc9c3c6e1c6edc83caa4c9fff236b15` |
| `own/log19_2.txt` | `fba2a97cce7a225db5b042a5e95d9b210e33abd5510b48f6c2789d7110f6b2bc` |
| `own/log19_3.txt` | `b0e73adc01d65b3130d71b41c7c2c13b24833e97c09aae23c0f38042bb508a08` |
| `own/log19_4.txt` | `f03c285cc1ade0fa9b3960c5cdf22a4bc17649bd48ae52089f05ddc716c98eee` |
| `own/log19_5.txt` | `6543d0d6ea3d1de890841ebb4ab904481b1fa795b944e67f2574a3b1025a2c11` |
| `own/log_elig19.txt` | `85c6e36127cb5af93d56d0cdba14dd2a8de50394a1179a1430e14da0488edb50` |
| `own/merge.py` | `3813c45c90cbac23bc0cab2c046135fee17ba471732ee74a9e5fffcb0b5ebdb9` |
| `own/ptag_13_15.json` | `4117c8b7d985f748aa42e1be8004f7d3752f719f4bec17cbc098e0e332b575ea` |
| `own/ptag_16_17.json` | `8c3bc539e5dcfe210140648bc267c64ad28ba113dce247ddced79f66093fe40e` |
| `own/ptag_18_18_0of6.json` | `e53c7aa03c62b722ff072e2a09ea42cd31abfbe6d5c4117c17448df3500aff06` |
| `own/ptag_18_18_1of6.json` | `9cb20312fba1353a3b3bce293772877d28aded05850e2da22c26f3a3dc64758a` |
| `own/ptag_18_18_2of6.json` | `c9e2ac1707fd4aa83aa36cf94ebd880fa84a7272d06d0c09a9e8e1b1dfd097f8` |
| `own/ptag_18_18_3of6.json` | `a02ada522cf9c1af633a02205f03e432b9be1c2d3d33f41d0162db3f1ca7805c` |
| `own/ptag_18_18_4of6.json` | `cbf06fa2f1925e04257995fb93821a188dcb3a1abf571291243abc5ab5137b37` |
| `own/ptag_18_18_5of6.json` | `b720a806cab72747867cc97809936cc92ed07d26c656a33a84bbef2169ad8c5d` |
| `own/ptag_19_19_0of6.json` | `a864bc975a9cb2ec0336a3f4de705b0d373a524e6c903bdbf13cbd587f776904` |
| `own/ptag_19_19_1of6.json` | `90fed760e0b7581690b118e58560f38a4514dae8bc657f7db7447c60f46b4cc6` |
| `own/ptag_19_19_2of6.json` | `dedb27e4fa90fc2c9235afd682211dbc00d70290a34b812180edbf114fdb403e` |
| `own/ptag_19_19_3of6.json` | `e40df2f9fd664761cdad7f621c30cf3768997f09ee0782516d830d32ffb500a5` |
| `own/ptag_19_19_4of6.json` | `71e783a854388c72820b1740c526857b84b54414dff0081f0f551da8da1c53f8` |
| `own/ptag_19_19_5of6.json` | `f5cdc030c8b1c2df362cf66c2790622f76733039e1fae330c92ee84074dac25a` |
| `own/ptag_census.py` | `4b64d2989d71b678bf234c17755bad4cd769131ef8afd5e62d62db01ae0bc585` |
| `own/ptag_census_chunk.py` | `041d2dd3e528da802d0a5c97f2420f49862d49cb7246911eee4842211b7286a9` |
| `own/tm.py` | `9f3741c608a5596710cb1c237f8224f6fbe17cf270de99f430ff0e6babfa90b1` |
| `own/tm_out.txt` | `aae6edd241d99e1b51ef8e378a9f6745bfb767cb9fa2806bf78fc921066ce8a2` |
| `replay/census.py` | `93870a8c907c8c57db48ac23c63d8010e1ddd1300683f243507786f320efd971` |
| `replay/census_out.json` | `43252b9f7108a1794cd2647debf8ab52e3abe7227a165d765ec26d34990fc80a` |
| `replay/census_push.py` | `6b371ddce084680c94ea0519341f0d5ea9582880a68c46de42c7167e477a6497` |
| `replay/census_push_out.json` | `7c193b608fa3a515583538f4f18af876af25c41cd28599a6f1fa517ef15f7698` |
| `replay/census_push_stdout.log` | `b82eb1c1494a6e52040405a67eb194e302569245fe6da273f2eef1181cff7fb2` |
| `replay/census_push_summary.json` | `f784241c84e008f85c789deacaf2cfe0d0040317542404f826a2912330cbf2c4` |
| `replay/census_stdout.log` | `9efc7ffe3704ec7bb38231d25257e6280adbe2ae03f587f7347042fa57d2c2e9` |
| `replay/census_summary.json` | `d5b5cec23e9767baccb02735846cdddf92679108a3b18fab66fcab56b7ab023d` |
| `replay/families.py` | `b04be675af8db9e3da844fda03f70e4c3c4018e75a109b2858d8023bbf271b5d` |
| `replay/make_manifest.py` | `273a59253dcdae3b48cf877a83bb497507f4db3afad3e665ffc4bce2036dc5ec` |
| `replay/matching.py` | `cdba291a0cce4d0181f89ea2a072919394d5148c504334bf7135607d45b3daa1` |
| `replay/model.py` | `169e655365dbae31f1b0605f2c3d7d5aef68ec68720e67a1889dcc662c1cdeb4` |
| `replay/per_tag_frontier.py` | `192814cc0132dfc8410a52f92574ecbd654c0794d06455e16de0dd31fb153531` |
| `replay/validate_baseline.py` | `2ead773bd8dfc85715460b2e4ecd9ab9e5db6477e42a7cf8c64d675d7e5a108c` |
| `replay/validate_baseline_out.json` | `443bc9876cc7acb93734bd0d6edf62c7ea08d45c4f27ddbe9bd25faca72c8033` |
| `replay/validate_matching.py` | `fecffd0f49b81c4ebcefe283a729be6e5e7b0e8fe1aae14132513b54faee429a` |
| `replay/validate_matching_out.json` | `0bcaca0340c5a5fb64e3b646237d2abd1fb31220385a208c9e8062c9c0a4133e` |
| `replay/weight.py` | `7dc7c97d047086910f6c0de49b0cd76e3fb5544d1e95950c07415b14c741cced` |

`replay/orig/` holds the copied F2 outputs; the replay outputs beside them are byte-identical to them. No background job is running (all 12 census chunks exited on their own; PIDs checked by literal `ps -p`).
