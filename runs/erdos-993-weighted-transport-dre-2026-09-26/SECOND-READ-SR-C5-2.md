# Second Read

**Read:** `SR-C5-2`, isolated second read of r30 Cycle 5 (run `erdos-993-math-dre-20260926-r30-weighted-transport`), 2026-09-27.
**Object:** deletion-arc (HALL) on the spider family `S(1, 2, 3^k)`; decisive for gate ruling 39 letter (b′), second half.
**Reader:** Claude Opus 5.5, high, isolated under `control/C5-SECOND-READ-PROTOCOL.md` (binding in full).

**Boot.** I am operating within VerityOS. I booted by reading exactly two VerityOS files, in full: `/Users/ashtonsperry/VerityOS/verity.md`, then
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other VerityOS subsystem (no memory, knowledge, conversations, decisions, logs,
modules or skills). The host placed the project `CLAUDE.md` and the user's auto-memory index into my context at session start. I did not act on
either. In particular I kept no conversation log, because the protocol confines my writes to this file and my scratch.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Decisive answer (ruling 39 (b′), second half).** Deletion-arc (HALL) on the infinite eligible family `{(S(1,2,3^k), k+3) : k ≥ 5}` is **confirmed at
`proved_informal`**, and N3b (`x(S(1,2,3^k)) = k+1` for every `k ≥ 5`, hence (HALL) at **every** eligible rank of the family) is **confirmed, with a repair**
(an explicit uniform-in-`k` step replaces the adjudicator's "the exponential side grows faster" past `k = 120`; Newton's inequalities named).

## Identity and seal audit

- **Protocol** `control/C5-SECOND-READ-PROTOCOL.md`: read first, in full. SHA-256 `78bc4897f1d1797a0fbfa56952270e67ae2761fa51ac1ce57f7388af338c3c7c`.
- **Brief** `control/C5-SECOND-READ-BRIEF-SR-C5-2.md`: SHA-256 recomputed with `shasum -a 256` **before** following it:
  `142a8691f5eb99be44d8fe393c5e6eda4583648889285583f82f3ea3f7122436`, **match** with the dispatch.
- **Capsule** `control/c5-second-read/SR-C5-2-PACKET-MANIFEST.json` (stage `cycle-5-second-read-SR-C5-2`, 207 files): inner seal recomputed as SHA-256 of
  the key-sorted compact JSON (`separators=(",", ":")`, `seal_sha256` removed, no trailing newline) =
  `aed541232318d35ca2bd1f3343bbaddbcedecbf9e04b17bfffe13419c85ee0f3`, **match**. All 207 member SHA-256 digests recomputed: **0 mismatches**
  (`scratchpad/c5-sr-SR-C5-2/seal_audit.py`).
- **Frozen reference instruments** `sources/c5-stage7-sources/`: each of the 177 capsule members under that directory was checked against
  `sources/c5-stage7-sources/SOURCE-DIGESTS.json` (bytes and SHA-256) before any was opened: 177 ok, 0 bad, 0 unlisted
  (`source_digest_audit.py`). I used them only as reference (ADJ-F `a7_check_out.json` for windows and summands); no conclusion rests on them.
- **Inputs read (capsule members), SHA-256:** `SEMANTIC-CONTRACT.md` `ee7ca2e2…9000`; `SOLUTION-CONTRACT.md` `3168e7a1…5980`;
  `cycles/cycle-5/stage6/SYNTHESIS.md` `83b9f816…0e76`; `cycles/cycle-5/stage4/critics/F2/U/CRITIQUE.md` `e1953d19…1119`;
  `cycles/cycle-5/stage5/adjudicators/F/ADJUDICATION.md` `3e098eff…f7ff`; `cycles/cycle-5/stage3/returns/F2/RETURN.md` `c3c15b48…ba60`;
  `control/C5-STAGE6-CONTROLLER-FACTS.json` (CF-F2, CF-F3, CF6-1, CF6-3, CF6-6, CF6-8, CF6-9; facts, never authority);
  `control/C5-CONTROLLER-ALIAS-PRESCREEN.json` `b946fe2d…67fd`; `control/CLAIM-DISTINCTIONS.json` (row format and existing per-leaf rows);
  the frozen run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c5-stage2.json` `e55151a0…84da` (453 claims) and the frozen master
  `sources/authority/CLAIM-IDENTITY.json` `eba20be3…9c84` (434 claims); the heads of `control/controller-facts/CF-REPLAY-c5{a,b,c,d}.json` (all four
  concern CB rows; none bears on the spider, so no third-instrument comparison was available from them).
- **Read-boundary deviations (disclosed).**
  1. One `ls` of the directory `second-reads/` (to confirm my output directory did not yet exist). It printed sibling read folder names only
     (`SR-BUDGET`, `SR-C2-*`, `SR-C3-*`, …). I opened none of them.
  2. The harness saved two large tool outputs (the brief, and the C-F2-U critique) as files under
     `/Users/ashtonsperry/.claude/projects/-Users-ashtonsperry-VerityOS/…/tool-results/`, and I read the critique back from that copy. Its
     content is the capsule member itself (digest-verified in place); no other content came from there.
  3. The host-injected `CLAUDE.md` and memory index (above). Nothing else outside the capsule and the two boot files was read. No `find`/`grep`/`rg`
     above the capsule members, no network, no install, no `lake`/`lean`, no background job; every Python run was `python3 -B`, foreground,
     standard library, exact integers and `Fraction`.

## Statements read

Statement of record: `SYNTHESIS.md` `## Exact established results` item 3, `## Progress and stop-gate ruling` → SR-C5-2 (i)–(vi),
`## Registrations` new key 3. Origins: C-F2-U A7 (theorem), A5 (`T_22/34`), A6 (census); F2 Step 1 (E-2); ADJ-F E-1 (hook discharge; N3b), E-2, row 6.

- **SR-C5-2a (the theorem).** `S_k := S(1,2,3^k)`: root `0`; pendant leaf `1`; pendant path `0–2–3`; `k` pendant paths `0–a_i–b_i–c_i`; `n = 3k+4`.
  For every `k ≥ 1`, every `p ≥ k+2` and every `F ⊆ leafSet`, the network of SEMANTIC-CONTRACT §1.2 with the active-tag weight has a saturating
  integral flow supported on single-deletion arcs.
- **SR-C5-2b (companions; minimal (b′)).** `α(S_k) = 2k+2`; `x(S_k) ≤ k+1` for every `k` via `Δ_{k+1} = (e_{k+2} − e_k) − k·2^{k−1} < 0`; `(S_k, k+3)`
  eligible for every `k ≥ 5`; with 2a, (HALL) with deletion arcs alone on `{(S_k, k+3) : k ≥ 5}`; rows in the unresolved band.
- **SR-C5-2c (N3b).** `x(S_k) = k+1` for every `k ≥ 5`; hence (HALL) at every eligible rank of `S_k`, `k ≥ 5`.
- **SR-C5-2d (distinctness and fences).** `S_k ≇ G_k`; a second infinite eligible family relative to the registered `G_k` scope; fences; the
  distinction from the REFUTED `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`, including the counting failure at `T_22/34`.
- **SR-C5-2e (the key).** `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2`, VERIFIED `proved_informal`:
  predicate check (ruling 33) and lexical plus mathematical alias check.

## Independent re-derivation

All derivations below are my own, from the frozen definitions (SEMANTIC-CONTRACT §1.1–1.2). Leaves of `S_k` are `1, 3, c_1, …, c_k` with original
supports `0, 2, b_i`; hence `W_1 = N(0) ∖ {1} = {2, a_1, …, a_k}`, `W_3 = N(2) ∖ {3} = {0}`, `W_{c_i} = N(b_i) ∖ {c_i} = {a_i}`. A tag `τ ∈ F ∩ B` is
active iff `B` meets `W_τ`. The deletion layer poset of any induced forest is the product of the independent-set posets of its components, and a
cover in a product is a one-vertex deletion in one factor.

**2a, step (0): root exclusion.** An independent set containing `0` avoids `1, 2, a_1, …, a_k`, so it lies in `{0, 3} ∪` one vertex of each edge
`b_i–c_i`; it has at most `k+2` elements. Sources have `p+1 ≥ k+3` elements, so **no source contains the root** (uses `p ≥ k+2`).

**2a, step (1): the three tag shapes.**
- *Tip `c_i`.* `c_i` active in `B` iff `a_i ∈ B`, and then `0, b_i ∉ B`. So the `c_i`-active sources are exactly `{c_i, a_i} ∪ S'`, `S'` an
  independent `(p−1)`-set of `T − {0, a_i, b_i, c_i}` = `{1} + (2–3) + Σ_{j≠i} (a_j–b_j–c_j)`. Deleting a vertex of `S'` keeps `{c_i, a_i}`, so the tag
  stays active.
- *Leaf `1`.* `1 ∈ B` forces `0 ∉ B`, and `1` is active iff `B` meets `{2, a_1, …, a_k}`. Classify by the first root present in the order
  `2, a_1, …, a_k`. Class `2`: `B = {1, 2} ∪ S''`, `S''` any independent `(p−1)`-set of the `k` paths (`3` excluded by `2`). Class `a_j`:
  `B = {1, a_j} ∪ S''`, `S''` in `I({3}) × Π_{i<j} I(b_i–c_i) × I({c_j}) × Π_{i>j} I(a_i–b_i–c_i)` (the absences of `2, a_1, …, a_{j−1}` are exactly these
  factor restrictions; `b_j` is excluded by `a_j`). Each class is a product; deleting a vertex of `S''` keeps `1` and the class root and adds no
  root, so images stay in the same class, the tag stays active, and **class images are disjoint** (a target's class is read off the target).
- *Cherry leaf `3`.* `3` active iff `0 ∈ B`. By step (0) no source contains `0`: **the tag has no active source at any `p ≥ k+2`**, and its
  per-tag requirement is vacuous. (Equivalently: the remainder after `{0, 3}` lies in `Π I(b_i–c_i)`, of maximum rank `k < p − 1`.) Its active
  targets exist only at `p = k+2`; they contain the root and receive no deletion arc.

**2a, step (2): chains, hooks and the step-down condition.** Factor chain partitions (all saturated): `I({v}) = {∅ < {v}}` (centre ½);
`I(u–w) = {∅ < {u}} ⊔ {{w}}` (centres ½ and 1); `I(a–b–c) = {∅ < {a} < {a,c}} ⊔ {{b}} ⊔ {{c}}` (every centre exactly 1). The centre of a chain is
(bottom rank + top rank)/2.
- *Hook partition (checked on ADJ-F's face and re-derived).* For saturated chains with positions `0..h` and `0..L`, the hooks
  `C_t = {(i,t) : 0 ≤ i ≤ h−t} ∪ {(h−t, j) : t < j ≤ L}`, `0 ≤ t ≤ min(h,L)`, partition `[0,h] × [0,L]`: if `i ≤ h−j` then `j ≤ min(h,L)` and
  `(i,j) ∈ C_j` (first part); otherwise `t := h−i` satisfies `0 ≤ t < j ≤ L`, so `(i,j) = (h−t, j)` lies in the second part of `C_t`; a point cannot be in
  both (the two cases are complementary). Each hook steps one coordinate by one, so it is saturated, and its bottom `(0,t)` and top `(h−t, L)` have
  position sums `t` and `h+L−t`, so **bottom + top = 2(c_1 + c_2)** in true ranks. Taking every pair (chain of the first partition, chain of the next
  factor) and hooking it partitions the product; iterating over the finitely many factors gives a partition of the whole product into saturated
  chains, each with centre equal to a sum of factor chain centres, hence at most the sum `c_max` of the factor maximal centres. **This is a
  construction; the de Bruijn–Tengbergen–Kruyswijk theorem is not a dependency.**
- *`c_max`.* Tip: `½ (for {1}) + 1 (for 2–3) + (k−1)·1 = k + ½`. Leaf `1`, class `2`: `k·1 = k`; class `a_j`: `½ + (j−1)·1 + ½ + (k−j)·1 = k`.
- *Chain predecessor.* An element at rank `r+1` on a chain of centre `c` has chain bottom `= 2c − top ≤ 2c − (r+1)`; if `r+1 ≥ c_max + ½ ≥ c + ½`,
  the bottom is `≤ r`, so the element is not a bottom and has a chain predecessor at rank `r`, obtained by deleting one vertex. Distinct elements of
  one rank lie on distinct chains, and chains are disjoint, so the predecessor map is **injective**. With `r+1 = p−1`: tips need
  `p − 1 ≥ k + 1`, leaf `1` needs `p − 1 ≥ k + ½`; **both are equivalent to `p ≥ k+2`** (integers).

**2a, step (3): E-2.** Let `φ_τ` be the injective map of step (2) for each `τ ∈ F` with active sources (tag `3` has none). Put
`f(B, A) := #{τ ∈ F active in B : φ_τ(B) = A}`. Then `f > 0` only on single-deletion arcs; the out-flow of `B` is the number of tags of `F` active in
`B`, which is `w_F(B)`; the in-flow of `A` is at most one unit per tag (injectivity), and only from tags active in `A` (images keep the tag active),
so it is at most `w_F(A)`. Hence a saturating integral flow; since (D) ⊆ (REL), it is a flow of the full network. F2's Step 1 argument, C-F2-U's and
ADJ-F's checks say the same.

**Hypotheses and where they enter.** `p ≥ k+2`: step (0) (root exclusion, hence tag `3` vacuous) and the two step-down conditions. `F ⊆ leafSet`:
every tag is one of `1, 3, c_i`, each handled. `k ≥ 1`: only to fix the family (nothing in the argument needs more). No eligibility, crossing-index,
independence-number or `IsTree` hypothesis is used by the flow statement (the tree enters only through the component structure above). ℕ-subtractions:
remainder ranks `p − 1`, `p − 2` with `p ≥ k+2 ≥ 3`; `h − t`, `h − i` with `t ≤ h`, `i ≤ h`; all guarded. **Sharpness of the construction (laboratory):**
at `p = k+1` the tip chains do hit bottoms (2, 6, 20, 72, 274, 1086, 4438 bottoms for `k = 1..7`), so `p ≥ k+2` is exactly this construction's
threshold; no statement is made below it.

**2b.** Conditioning on the root: root absent gives `(1+y)·(1+2y)·(1+3y+y²)^k`; root present excludes `1, 2, a_i` and leaves `{3}` and the `k` edges
`b_i–c_i`, giving `y(1+y)(1+2y)^k`. So `I(S_k) = (1+y)(1+2y)(1+3y+y²)^k + y(1+y)(1+2y)^k` (agrees with `E993-PAIR-SPIDER-CLOSED-FORM`, an input). The
first summand has degree `2k+2` with top coefficient 2, the second degree `k+2 < 2k+2`, so `α = 2k+2`. With `e_j = [y^j](1+3y+y²)^k` and
`g = (1+y)(1+2y)^k` (`g_{k+1} = 2^k`, `g_k = 2^k + k·2^{k−1}`), `i_j = e_j + 3e_{j−1} + 2e_{j−2} + g_{j−1}`, so
`Δ_{k+1} = e_{k+2} + 2e_{k+1} − e_k − 2e_{k−1} + g_{k+1} − g_k = (e_{k+2} − e_k) − k·2^{k−1}` by palindromy `e_{k+1} = e_{k−1}`. **Identity verified.**
*Sign:* `e_{k+2} = e_{k−2} ≤ e_k`. The critic and adjudicator derive this from real-rootedness (Newton). It also follows with no classical input from
step (2): the iterated hook partition of `I(a–b–c)^k` has every chain centred at exactly `k`, so each chain meeting rank `j < k` also meets rank `j+1`,
and `e_j ≤ e_{j+1}` for `j < k`. Since `k·2^{k−1} > 0` for `k ≥ 1`, `Δ_{k+1} < 0`, so `x ≤ k+1` for every `k ≥ 1`. **Eligibility at `p = k+3`:**
`x + 2 ≤ k+3`, and `3(k+3) < 2(2k+2) + 1 ⇔ k > 4`. For `k ≥ 5`, 2a applies at `p = k+3 ≥ k+2` with `F = F_{k+3}(S_k) ⊆ leafSet`: (HALL) with deletion
arcs alone on `{(S_k, k+3) : k ≥ 5}`. **Band:** `2(k+3) + 3 = 2k + 9 ≤ 3k + 4 ⇔ k ≥ 5`; `3k + 4 ≤ 4(k+3) − 8`; `p = k+3 ≥ 8 ≥ 6`. This minimal (b′)
statement uses no N3b.

**2c (N3b).** For `1 ≤ j ≤ k−1`, `Δ_j = (e_{j+1} − e_j) + 3(e_j − e_{j−1}) + 2(e_{j−1} − e_{j−2}) + (g_j − g_{j−1})` (zero extension below 0); `Δ_0 = n − 1 > 0`.
- `3j ≤ 2k+2`: the three `e`-differences are `≥ 0` (unimodality, `j+1 ≤ k`, which holds since `(2k+2)/3 ≤ k−1` for `k ≥ 5`), and
  `g_j − g_{j−1} = (t_j − t_{j−1}) + (t_{j−1} − t_{j−2})` with `t_i = C(k,i)2^i`, `t_i/t_{i−1} = 2(k−i+1)/i ≥ 1 ⇔ 3i ≤ 2k+2`; so `Δ_j ≥ 0`.
- `2k+2 < 3j`, `j ≤ k−1`: `Δ_j ≥ 3(e_j − e_{j−1}) − g_{j−1}`. Newton's inequalities for the real-rooted `(1+3y+y²)^k` (degree `2k`, positive coefficients)
  give log-concavity (ratios `e_j/e_{j−1}` nonincreasing) and, at the centre with `e_{k+1} = e_{k−1}`, `e_k ≥ (1 + 1/k)·e_{k−1}`; so
  `e_j − e_{j−1} ≥ e_{j−1}/k` for `j ≤ k`. With `e_{j−1} ≥ C(k,j−1)·3^{j−1}` and `g_{j−1} = t_{j−1}(1 + (j−1)/(2(k−j+2))) ≤ t_{j−1}·(k+4)/6`, `Δ_j ≥ 0`
  once `18·3^{j−1} ≥ k(k+4)·2^{j−1}`. **Repair (uniformity).** The range is empty for `k = 5`. For `k ≥ 6`, `3(j−1) ≥ 2k` gives `(3/2)^{j−1} ≥ (9/4)^{k/3}`, and
  `(9/4)^k·18³ ≥ (k(k+4))³` holds at `k = 6` and is preserved because `((k+1)(k+5)/(k(k+4)))³ ≤ (77/60)³ < 9/4` for `k ≥ 6` (the ratio decreases in `k`).
- `j = k`: `Δ_k = 2(e_k − e_{k−2}) + (g_k − g_{k−1}) ≥ 2e_{k−1}/k − g_{k−1}`, with `e_{k−1} ≥ k·3^{k−1}` and `g_{k−1} = k(k+3)·2^{k−3}`, so `Δ_k ≥ 0` once
  `8·3^{k−1} ≥ k(k+3)·2^{k−1}`: true at `k = 5` (`648 ≥ 640`), and preserved since `(k+1)(k+4)/(k(k+3)) ≤ 54/40 < 3/2` for `k ≥ 5`. **Repair
  (uniformity)** as above; the adjudicator's face stops at "verified for `k ≤ 120`; past that the exponential side grows faster".

  Hence `Δ_j ≥ 0` for `0 ≤ j ≤ k` and `Δ_{k+1} < 0`: `x(S_k) = k+1` for every `k ≥ 5`. The eligible window is exactly
  `[k+3, ⌊2(2k+2)/3⌋]`, nonempty iff `k ≥ 5`, every member `≥ k+2`: (HALL) at every eligible rank. Every such row lies in the unresolved band
  (`p ≤ (2(2k+2))/3` gives `2p + 3 ≤ 3k + 4` for `k ≥ 5`). The dependency is Newton's inequalities (classical), named.

**2d.** `|V(S_k)| = 3k+4 ≡ 1` and `|V(G_{k'})| = 3k'+5 ≡ 2 (mod 3)`: no member of either family is isomorphic to a member of the other (stronger than the
brief's same-`k` comparison). `S_k` is also not the equal-length-three spider (a leaf, `1`, is adjacent to the unique vertex of degree `≥ 3`), not a
path-star of the contract (depth 3 from the high-degree vertex), and not `T_m`. The G_k flow key's statement is about `gkGraph k` only; a flow on
`G_k` does not restrict to `S_k = G_k − {4}` (weights and layers change), and conversely. **`T_22/34` (my instrument, by DP):** `n = 91`, `α = 68`,
`x = 32`, `p = 34` eligible, the distinguished leaf `ℓ` favorable; `q_ℓ(j) = C(66, j−1)` for every `j` (checked for `1 ≤ j ≤ 69`), so its summand is
`C(66,33) − C(66,32) = 212336130412243110 > 0`: `ℓ` has more active sources than active targets, and no per-tag injective map exists for `ℓ`.
The support-graph relation (ADJ-F row 6) is right: under `B ↦ B ∖ {τ}` the per-tag bipartite graph is the support of the refuted key's `d_p`; linear
injectivity gives a nonzero maximal minor, hence a saturating matching; the converse fails.

**2e.** The key asserts saturation by vertex deletions at every rank from `k+2` on the spider with legs `1, 2` and `k` legs of length 3: every
conjunct is a conclusion of 2a (it omits "every leaf tag set", which is weaker, not stronger). It names no eligibility, no (HALL) at full scope, no
`x`, no Lean status. **It is a predicate of 2a.** Lexical screen (`sr2_alias_screen.py`, tokens = hyphen split minus `E993` and `R<digits>`) against the
453-claim snapshot and the 434-claim master: no exact key, no alias equality, no alias-pattern hit on the key or the alias line, no key with
`≥ 85%` shared tokens; against the G_k flow key it shares 4 of 17 tokens (`3`, `K`, `PLUS`, `RANK`), against
`E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE` 4 of 9. The controller's pre-screen (a capsule member) flagged only the critic's withdrawn
name (14 of 17). The R26 alias pattern `deletion.injection` matches neither the key nor any line of my registration text.

**Own instrument, numerical corroboration (bounded_computation; never the basis of a verdict).**

| Check | Result |
|---|---|
| Literal (D)-only network, `k = 1..6`, `p = k+2, k+3, k+4`, `F = F_p` (derived) and `F` = all leaves; every `F ⊆ leafSet` for `k ≤ 4` | 384 rows (360 subset rows), every row: literal `supply − capacity` = Σ_{v∈F}[q_v(p) − q_v(p−1)] from the `H_v`, `R_v` deletion polynomials; exact Dinic max-flow = supply on every row |
| `k = 5, p = 8` (eligible) | `n = 19`, `α = 12`, `x = 6`, `|F_p| = 7`, supply 3125, capacity 6100, `S = −2975`, deletion-only max-flow 3125; summands `1: −945`, `3: 0`, `c_i: −406` (matches the synthesis and ADJ-F) |
| `k = 6, p = 9` (eligible) | `n = 22`, `α = 14`, `x = 7`, supply 18900, capacity 33072, `S = −14172`, max-flow 18900 |
| Hook construction executed literally (`sr2_hook.py`), `k = 1..7`, every `p ∈ [k+2, α]` | hooks partition every grid (membership rule of the face asserted); `2·c_max = 2k+1` (tips) and `2k` (leaf 1); no chain bottom hit; domain = literal τ-active sources; injective; one-vertex deletions keeping τ active; leaf-1 classes disjoint; tag 3 has no active source; assembled flow: out-flow = `w_F(B)`, in-flow ≤ `w_F(A)` |
| Closed form = forest DP, `α = 2k+2`, descent identity and sign, palindromy/unimodality, Newton at centre, N3b sufficient inequalities, `k ≤ 60` | all true; `x = k+1` for `1 ≤ k ≤ 60`; window nonempty iff `k ≥ 5`; every eligible `p ≥ k+2` |
| Uniform inequalities (`sr2_uniform.py`) | both base cases and ratio steps exact; direct scans `k ≤ 3000`; band at every eligible rank `k ≤ 3000` |
| `T_22/34` | summand `212336130412243110 = C(66,33) − C(66,32)`, eligible, `ℓ` favorable |

## Findings and repairs

1. **2a holds as stated.** The assembled proof (C-F2-U A7 with ADJ-F's hook discharge and F2's E-2) is complete and correct. The only
   classical dependency named by the critic (de Bruijn–Tengbergen–Kruyswijk) is removed by the explicit hook construction, which I re-derived
   (partition, saturation, centre additivity) and executed literally. I write step (0) (root exclusion) explicitly: it is where `p ≥ k+2` makes
   tag `3` vacuous. No repair of the statement.
2. **2b holds.** Identity and sign verified. I note (not a repair) that unimodality of `(1+3y+y²)^k` follows from the same hook partition, so the
   minimal (b′) statement needs no classical input at all.
3. **2c: repair.** ADJ-F's lower-bound proof is correct, but its uniformity step for large `k` is informal ("past `k = 120` the exponential side grows
   faster"). The repaired text supplies the base case and the ratio step for both inequalities (`(9/4)^k·18³ ≥ (k(k+4))³` for `k ≥ 6`;
   `8·3^{k−1} ≥ k(k+3)·2^{k−1}` for `k ≥ 5`), and names Newton's inequalities as the classical dependency.
4. **2d holds, strengthened.** Non-isomorphism is by order modulo 3 across the two whole families, not only at equal `k`. The `T_22/34` counting
   failure is confirmed by my own DP and closed form.
5. **2e holds.** The name is a predicate of 2a and clears the lexical and mathematical screens. My registration text originally tripped four other
   keys' alias patterns (`T_m.*ratio` via "corroboration", `R2.*Hall.*universal`, `two.leaves.*support`, and `weighted.hall … implies … aggregate` via
   "neither key implies"). I reworded all four. The remaining pattern hits are self-citations of the keys `E993-PAIR-SPIDER-CLOSED-FORM` and
   `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` by name, and the fence list "TREE, FOREST, TRANSFER" (aliases of the TGT keys, cited
   as the registry's own fences do). The controller should treat these as citations, not aliases.
6. **Critic-side literals.** C-F2-U's A7 "Tool" paragraph ("undischarged classical dependency") is superseded by the hook construction. It should
   not be carried to the registry. The critic's "I have no proof of `x ≥ k`" is superseded by 2c.
7. **Not mine to grade:** the order-13–19 census RECORD row (C-F2-U, C-F2-T, ADJ-F; `bounded_computation`). I make no statement about it.

## Registration text

**Key (2a with 2b's companions and, 2c being confirmed with repairs, the every-eligible-rank form on the face):**

```text
KEY: E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: For k >= 1 let S_k = S(1,2,3^k) be the tree with root 0, pendant leaf 1, pendant path 0–2–3 and k pendant paths 0–a_i–b_i–c_i (n = 3k+4; original leaves 1, 3, c_1, ..., c_k with original supports 0, 2, b_i; W_1 = {2, a_1, ..., a_k}, W_3 = {0}, W_(c_i) = {a_i}). For every k >= 1, every natural p >= k+2 and every set F of original leaves of S_k, the transport network of SEMANTIC-CONTRACT s1.2 with the active-tag weight w_F has a saturating integral flow f with f(B, A) > 0 only when A = B minus {q} for some q in B (single-vertex deletion arcs); hence the (D) ∪ (S) network has one. Proof on the face. (0) Root exclusion: an independent set containing 0 lies in {0, 3} ∪ one vertex of each edge b_i–c_i, so it has at most k+2 elements; since p+1 >= k+3, no source contains the root. (1) Tag classes: a c_i-active source is {c_i, a_i} ∪ S' with S' an independent (p−1)-set of the forest {1} + (2–3) + the k−1 other paths a_j–b_j–c_j; a 1-active source is {1} ∪ S' with S' an independent p-set of (2–3) + the k paths meeting {2, a_1, ..., a_k}, split by the first root present in the order 2, a_1, ..., a_k: class 2 is {1, 2} ∪ S'' with S'' in the product of the k path posets, class a_j is {1, a_j} ∪ S'' with S'' in I({3}) × prod_(i<j) I(b_i–c_i) × I({c_j}) × prod_(i>j) I(a_i–b_i–c_i), rank p−1; a 3-active source contains 0, so by (0) the tag 3 has no active source at p >= k+2 and its requirement is vacuous (3-active targets exist only at p = k+2, contain the root and receive no deletion arc). (2) Chain partitions of the factors: I({v}) = {empty < {v}} (centre 1/2); I(u–w) = {empty < {u}}, {{w}} (maximal centre 1); I(a–b–c) = {empty < {a} < {a,c}}, {{b}}, {{c}} (every centre 1). Hook partition (constructed on the face): for saturated chains with positions 0..h and 0..L and centres c_1, c_2, the grid [0,h] × [0,L] is the disjoint union of the hooks C_t = {(i,t) : 0 <= i <= h−t} ∪ {(h−t, j) : t < j <= L}, 0 <= t <= min(h, L), the point (i,j) lying in C_j when i <= h−j and in C_(h−i) otherwise; each hook is saturated (each step adds one vertex in one factor) and has bottom rank + top rank = 2(c_1 + c_2). Iterating over the factors partitions every product into saturated chains each of centre at most the sum of the factor maximal centres: c_max = k + 1/2 for a tip c_i, c_max = k for every class of leaf 1. Chain-predecessor map: an element of rank r+1 on a chain of centre c has chain bottom <= 2c − (r+1), which is <= r whenever r+1 >= c_max + 1/2; the map to the chain predecessor is then defined, injective (distinct chains are disjoint, one element per rank per chain) and each step deletes exactly one vertex of S' or S'', never the tag and never the tag's witness ({c_i, a_i} resp. {1, class root} is kept), so the tag stays active and the class of leaf 1 is preserved (class images are disjoint). With r+1 = p−1 the condition reads p−1 >= k+1 (tips) and p−1 >= k + 1/2 (leaf 1), both equivalent to p >= k+2. (3) Per-tag sufficiency: with phi_tau these injective maps, f(B, A) = #{tau in F active in B : phi_tau(B) = A} is supported on deletion arcs, has out-flow w_F(B) at every source, and in-flow at most one unit per tag active at A, hence at most w_F(A). The de Bruijn–Tengbergen–Kruyswijk theorem is not a dependency. Companions on the face (face content, not keys): α(S_k) = 2k+2 (the independence polynomial (1+y)(1+2y)(1+3y+y²)^k + y(1+y)(1+2y)^k, by conditioning on the root, has degree 2k+2 with top coefficient 2); with e_j = [y^j](1+3y+y²)^k and g = (1+y)(1+2y)^k, Δ_(k+1)(S_k) = (e_(k+2) − e_k) − k·2^(k−1) < 0 for every k >= 1 (palindromy e_(k+1) = e_(k−1), g_(k+1) = 2^k, g_k = 2^k + k·2^(k−1), and e_(k+2) = e_(k−2) <= e_k because the iterated hook partition of the k-fold product of I(a–b–c) has every chain centred at exactly k), so x(S_k) <= k+1 for every k >= 1; hence for every k >= 5 the rank p = k+3 is eligible (x + 2 <= k+3 and 3(k+3) < 2(2k+2) + 1 exactly when k > 4) and (HALL) holds on the infinite eligible family {(S_k, k+3) : k >= 5} with deletion arcs alone (F = F_(k+3)(S_k) is a set of leaves); moreover x(S_k) = k+1 for every k >= 5 (for 1 <= j <= k−1, Δ_j = (e_(j+1) − e_j) + 3(e_j − e_(j−1)) + 2(e_(j−1) − e_(j−2)) + (g_j − g_(j−1)); every term is >= 0 when 3j <= 2k+2; for 2k+2 < 3j, j <= k−1, Newton's inequalities for the real-rooted (1+3y+y²)^k give e_j − e_(j−1) >= e_(j−1)/k, with e_(j−1) >= C(k, j−1)·3^(j−1) and 6·g_(j−1) <= C(k, j−1)·2^(j−1)·(k+4), so Δ_j >= 0 once 18·3^(j−1) >= k(k+4)·2^(j−1), true for every k >= 6 since j−1 >= 2k/3, (9/4)^6·18³ >= 60³ and (9/4) >= ((k+1)(k+5)/(k(k+4)))³ for k >= 6; at j = k, Δ_k = 2(e_k − e_(k−2)) + (g_k − g_(k−1)) >= 2e_(k−1)/k − g_(k−1) >= 0 once 8·3^(k−1) >= k(k+3)·2^(k−1), true at k = 5 and preserved since 3/2 >= (k+1)(k+4)/(k(k+3)) for k >= 5; Δ_0 = n − 1 > 0), so the eligible window of S_k is exactly [k+3, floor(2(2k+2)/3)], nonempty exactly when k >= 5, and (HALL) holds at EVERY eligible rank of S_k for every k >= 5 with deletion arcs alone; every such row satisfies 2p+3 <= n = 3k+4 <= 4p−8 (the unresolved band). Corollary only: C5LA1.aggregate S_k p <= 0 at every p >= k+2 by E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE.
SCOPE: One explicit tree family S(1,2,3^k), k >= 1, at every rank p >= k+2, every leaf tag set F; the flow statement uses only p >= k+2 and F ⊆ leafSet (no eligibility, crossing-index or independence-number hypothesis). The (HALL) clauses are compositions with the face companions: at p = k+3 for k >= 5 using only x <= k+1 and α = 2k+2; at every eligible rank for k >= 5 using also x = k+1 (Newton's inequalities, classical, named). The construction's threshold p >= k+2 is where the tip chains stop reaching a chain bottom (at p = k+1 they do); no statement is made at p <= k+1. Numeric corroboration (bounded_computation, never proof): literal deletion-only max-flow equals supply at p = k+2, k+3, k+4 for k <= 6 with F = F_p and F = all leaves, and for every F ⊆ leafSet for k <= 4 (384 rows, supply − capacity = the per-tag summand sum from the H_v, R_v deletion polynomials on every row; k = 5, p = 8: supply 3125, capacity 6100, S = −2975, max-flow 3125); the hook construction executed literally at every rank p in [k+2, α] for k <= 7; closed form, α, x = k+1 (5 <= k <= 60) and the inequalities behind x = k+1 checked exactly.
ATTRIBUTION: The theorem and its per-tag chain construction: critic C-F2-U, r30 Cycle 5 (Claude Opus 5.5). The per-tag sufficiency lemma (step 3): seat F2, r30 Cycle 5 (Claude Sonnet 5). The hook partition discharging the product-of-chains step, and x = k+1 for k >= 5: the r30 Cycle 5 F adjudicator (Claude Opus 5.5). The descent identity and x <= k+1: C-F2-U, verified by the F adjudicator. The key name: the r30 Cycle 5 Stage 6 synthesis. Isolated second read SR-C5-2 (Claude Opus 5.5): unimodality of (1+3y+y²)^k from the hook partition and the uniform ratio steps of the two inequalities behind x = k+1. Input: E993-PAIR-SPIDER-CLOSED-FORM (VERIFIED, r20), re-derived by conditioning on the root. The transport network, the active-tag weight and (HALL): Codex GPT-6, the lower-region run. FLOW⇒SIGN: E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (r30 Cycle 1).
FENCES: One family; deletion arcs; (HALL) at full scope is not asserted and E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. Not a revival of E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY (REFUTED): the per-tag maps are a matching inside the support of that key's map d_p on one family, not linear injectivity, and the per-tag statement at full scope is itself refuted by counting at the eligible T_22, p = 34. Not E993-R23-LITERAL-DELETE-ONLY-HALL (REFUTED; an unweighted delete-only statement over every eligible tree). Not the G_k family of E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET (non-isomorphic trees: orders 3k+4 and 3k+5 differ modulo 3), and neither statement entails the other. No switch-arc content; no claim about any other tree. No status change to E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993; the corollary S <= 0 on the family is not an aggregate contribution. No RTree wording; no closed region re-proved (the rows lie in 2p+3 <= n <= 4p−8); bounded rows are corroboration only; not formally verified (no Lean award); not the registered equal-length-three spider or path-star theorems, nor the registered family theorem of T_m.
ALIASES: legs one two and k threes spider vertex-deletion saturating flow theorem
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: r30 Cycle 5, second read SR-C5-2. On the spider family S(1,2,3^k) (root 0, pendant leaf 1, pendant path 0–2–3, k pendant paths 0–a_i–b_i–c_i; n = 3k+4) the network has a saturating integral flow supported on single-deletion arcs at every rank p >= k+2 for every leaf tag set; hence (HALL) holds with deletion arcs alone at every eligible rank of every S(1,2,3^k) with k >= 5 (eligible window [k+3, floor(2(2k+2)/3)], using x = k+1 and α = 2k+2); the minimal form at p = k+3 for k >= 5 needs only x <= k+1. Grade proved_informal (key E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2; x = k+1 uses Newton's inequalities, classical, named). This is the second infinite eligible family of record, non-isomorphic to the G_k family of E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET; every row lies in the unresolved band 2p+3 <= n <= 4p−8. Attribution: C-F2-U (theorem), F2 (per-tag sufficiency), the r30 Cycle 5 F adjudicator (hook discharge; x = k+1), SR-C5-2. Fences: a family result; (HALL) stays OPEN at full scope; the per-tag method is strictly weaker than (HALL) (it fails by counting at the eligible T_22, p = 34, where (HALL) is of record); no status change to the primary aggregate or any aggregate key.
```

```text
DISTINCTION ROW: DR-SR-C5-2-01
KEY: E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY
TEXT: The REFUTED key asserts, at every eligible (T, p) and every favorable leaf v, injectivity of the rational linear map d_p sending each marked independent p-set of H_v to the sum of its one-vertex deletions still meeting W_v. Under the (WID) bijection B -> B minus {v}, the spider key's per-tag map phi_v is an injective choice of one such deletion per marked set, that is a matching saturating the marked sets inside the support of d_p, on the one family S(1,2,3^k). Linear injectivity implies such a matching (a nonzero maximal minor has a nonzero permutation term); a matching does not imply linear injectivity. The per-tag matching statement at full scope is itself refuted by counting at the eligible T_22, p = 34 (n = 91, α = 68, x = 32, the distinguished leaf favorable): its summand q(34) − q(33) = C(66,33) − C(66,32) = 212336130412243110 > 0, so its active sources outnumber its active targets, while (HALL) saturates there on record (orbit-flow lift, bounded_computation). The spider key asserts nothing beyond its one family and nothing linear; not a revival. Attribution: C-F2-U (the counting refutation, proved on the face), the r30 Cycle 5 F adjudicator (the support-graph distinction), SR-C5-2.
```

```text
DISTINCTION ROW: DR-SR-C5-2-02
KEY: E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET
TEXT: The registered key (formally_verified) is a flow theorem on G_k, where vertex 2 carries the cherry {3, 4} (n = 3k+5), at every rank p >= k+3. The spider key is on S(1,2,3^k), where vertex 2 carries the single pendant leaf 3 (n = 3k+4), at every rank p >= k+2. Orders differ modulo 3, so no member of one family is isomorphic to a member of the other, and neither statement entails the other (a flow on one tree does not carry over across the deletion of the leaf 4). Lexically the spider key shares 4 of the registered key's 17 tokens (K, 3, RANK, PLUS); the critic's candidate name, which shared 14 of 17, was withdrawn by the synthesis. The spider key is therefore a second infinite eligible family relative to the G_k scope of record, not an alias.
```

```text
DISTINCTION ROW: DR-SR-C5-2-03
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: The REFUTED key is an unweighted delete-only Hall inequality asserted on the r23 tagged top side of every eligible ordinary tree. The spider key is a flow theorem for the active-tag weight w_F on one explicit family, at ranks p >= k+2, with the demand w_F(B) and capacity w_F(A) of SEMANTIC-CONTRACT s1.2. Different weight, demand, family and scope; nothing is revived.
```

## Verdicts

verdict[SR-C5-2a]: confirmed
verdict[SR-C5-2b]: confirmed
verdict[SR-C5-2c]: confirmed_with_repairs
verdict[SR-C5-2d]: confirmed
verdict[SR-C5-2e]: confirmed

**Decisive line (ruling 39 (b′), second half):** deletion-arc (HALL) on the infinite eligible family `{(S(1,2,3^k), k+3) : k ≥ 5}` is CONFIRMED at
`proved_informal`, and N3b (`x = k+1` for `k ≥ 5`, hence (HALL) at every eligible rank of the family) is CONFIRMED (with the uniformity repair above).

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Artifact inventory

**Deliverable:** this file only, `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/second-reads/SR-C5-2/SECOND-READ.md`.

**Scratch:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-sr-SR-C5-2/`. Every run: `python3 -B`, foreground, standard library, exact integers and `Fraction`; no bytecode written; no background job; replays are deterministic (result digests reproduced on a second run).

| File | SHA-256 | Role |
|---|---|---|
| `registration_scope.txt` | `50ae72eeffbac37b821a4e789afbd0823daeca95380f3f10b6570bcca3d20008` | the scope note and three distinction rows, verbatim |
| `registration_text.txt` | `45ac0e244c339274807026b3be8db362ca603513bbbb822e870609e07d8a15b0` | the key block, verbatim as under ## Registration text |
| `seal_audit.py` | `fadf6380c0f151b7e0f6ee24588de0e5420a54ac8b66a3eff187007fb36b68e0` | capsule inner seal and 207 member digests |
| `source_digest_audit.py` | `9efa68e547231d2a45ff4f36494deafbb563e6419a63fec935875955595a0908` | 177 frozen reference instruments against SOURCE-DIGESTS.json |
| `sr2_alias_screen.py` | `ea01afc50dda50301bb69008715387faebd12b637b1c28225f25d32e97cbbf75` | lexical screen of the key, alias line and registration text vs snapshot and master |
| `sr2_alias_screen_out.json` | `08c0caca721a94699e1c73df1a84c11e743f588f56b835fec058aa82cdf03b29` | its output (result sha256 08c0caca...3b29; hits are self-citations and the TREE/FOREST/TRANSFER fence list only) |
| `sr2_core.py` | `2c0ceb4e53da95b01998f25021549a74681a637852f64497db54535cff98fbd2` | own core: S(1,2,3^k), T_m, tree test, forest DP, x through alpha, literal enumeration, w_F, Dinic |
| `sr2_hook.py` | `251b1b4a6dbf56fe8ddcfdccdd5ac43f8f538d55a520334a9e61756033b724d1` | the proof construction executed: hooks, chain predecessors, leaf-1 classes, assembled flow, k<=7 every rank |
| `sr2_hook_out.json` | `11c4744ad67506070a191530005a3be424acee84c02b59991dfc142bbf8bff94` | its output (result sha256 11c4744a...ff94) |
| `sr2_network.py` | `f54e807f3a1b8c30b50d163b77e11981f8d3552bab3a8c3e6a01e080969bff02` | literal (D)-only network, k<=6 at p=k+2..k+4, every F for k<=4, two-sided supply-capacity |
| `sr2_network_out.json` | `bd612f5242899ac8f73fe82f57211e83d2835b8399f815f6d449cc07f369a5c4` | its output (result sha256 bd612f52...a5c4; 384 rows, all saturate) |
| `sr2_poly.py` | `86f449244bdea3dc76b18f1ff7b029a57faf74397d40704fd2754dc4d29f42da` | closed form, alpha, x, descent identity, N3b inequalities (k<=60), T_22/34 summand |
| `sr2_poly_out.json` | `d8945949c5968b427a356b70bf0b159e26c863305e059c8f723404c30c0c0f11` | its output (result sha256 d8945949...0f11) |
| `sr2_uniform.py` | `f032d57be143732e6026c8e2e28136fcf2adb84914d2a6cdf33fac57b7e9a620` | uniform-in-k base cases and ratio steps; band at every eligible rank (k<=3000) |
| `sr2_uniform_out.json` | `ced303f2c6365adcf7168d3f1719818d77c10c1dbd236b39da63e1dd3b45e0ff` | its output (result sha256 ced303f2...e0ff) |

Replay: `cd` into the scratch directory, then `python3 -B seal_audit.py` and `python3 -B source_digest_audit.py` (both from the run root: `cd ../..` first), `python3 -B sr2_network.py 6`, `python3 -B sr2_hook.py 7`, `python3 -B sr2_poly.py 60`, `python3 -B sr2_uniform.py`, `python3 -B sr2_alias_screen.py`.

No sealed member was edited. Nothing was written outside the deliverable and the scratch directory.
