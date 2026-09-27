---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c6-la2-formalizer-opus-20260928
critic_id: c6-la2-fable-informal-20260928
attestation_id: c6-la2-informal-pass-20260928
claim_sha256: 942f576ef2c2138c98c8e5a9315e14fd633504019c01c5a0d3a0d13f304c5c88
---

# Informal Proof Integrity Audit

**Boot.** This audit ran within VerityOS. I read `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md` (brief §0). My only instructions were
`control/C6-STAGE7-INFORMAL-AUDITOR-BRIEF-LA2.md`; I verified its SHA-256 first
(`9c09ce6b8b5e98d59079892a59480c740cf5c6f39a65b7e9be8207585bfadab2`, matches). The host put `CLAUDE.md` and the auto-memory index into
context; beyond the boot, I did not act on them.

- **Reviewer:** `c6-la2-fable-informal-20260928`, of kind `independent-mathematical-proof-integrity-reviewer`. I am not the artifact producer.
- **Run:** the canonical run id is `erdos-993-math-dre-20260926-r30-weighted-transport`; the award is `C6-LA2`.
- **Model disclosure:** chartered Claude Opus 5.5, effort high, on dispatch-record authority. The model id my runtime reports, verbatim, is `claude-opus-5-5[1m]`.

**Integrity gates, all recomputed by me:**

| Object | Expected SHA-256 | Result |
|---|---|---|
| `THEOREM-CONTRACT.yaml` | `dc2fc2a0…d417651` | matches |
| `INFORMAL-PROOF.md` | `b3e3bfcc…792019` | matches |
| `LeanProject/LeanProof/Main.lean` | `df5e2870…a4c60fc` | matches |
| Capsule seal (`json.dumps(sort_keys, separators=(",",":"))` of the manifest without `seal_sha256`) | `0433f214…a269223` | matches; 1500/1500 members match by digest and byte count (`seal_check.py` / `.log`) |
| Frozen instruments `U1/`, `C-U1-T/`, `C-U1-F/`, `ADJ-U/` | per `SOURCE-DIGESTS.json` | 99/99 files match |
| C4-LA1 `Main.lean` | `66db6c73…` | matches |
| C4-LA1 kernel receipt | `dd9c21f7…` | matches |
| Run kernel receipt | `ce9dbc19…` | matches; verdict `verified` |
| `FORMALIZATION-STATE.json` | `e78d4bcf…` | matches; 173 entries (53 `definition`, 119 `lemma`, 1 `theorem`); every fragment digest matches |
| `EVIDENCE/axioms.txt` (receipt-bound) | `8ca319ac…` | matches; pre-verification digest `57c493b8…` as disclosed |

`claim_sha256` recomputed as `sha256(" ".join(informal_statement.split()))` =
`942f576ef2c2138c98c8e5a9315e14fd633504019c01c5a0d3a0d13f304c5c88` (equals the brief's value).
The contract's `expected_statement` hashes to `b5fba0738b…a9a10`. It occurs exactly once in `Main.lean`, followed by ` := `.

## Intended Claim

The claim is exactly the contract's `theorem.informal_statement`. For every natural `k ≥ 5`, the spider
`S(1,2,3^k) = spiderOneTwoThrees k` on `Fin (3k+4)` has these properties:

1. It is a tree.
2. `C5LA1.crossingIndex + 2 ≤ k + 3`.
3. `3(k+3) < 2·indepNum + 1`.
4. The transport network at rank `p = k+3`, with the derived selector `F = favorableLeaves (spiderOneTwoThrees k) (k+3)`, has a saturating integral flow (`IsSaturatingFlow`).

The labels are those of record: root `0`; leaf `1`; the path `0–2–3`; for each `i < k`, the path `0–a_i–b_i–c_i` with `a_i = 4+3i`, `b_i = 5+3i`, `c_i = 6+3i`.

The Lean terminal `E993Transport.spiderOneTwoThrees_treeWeightedHall_kPlus3 (k : ℕ) (hk : 5 ≤ k)` states exactly these four conjuncts. It has one hypothesis, `hk`, and nothing else; this matches the claim one-for-one. The claim is false for `k ≤ 4`. My part (a) confirms that conjunct 3 fails exactly for `k ≤ 4`.

## Claim Ledger

**How to read this ledger.**

- **Entry numbers** are C4-LA1's numbering unless marked "reg." (this run's registrar index).
- **The registrar mapping**, which I checked:
  - reg. 1–34 = C4-LA1 1–21 and 25–37;
  - reg. 35 = first-interior entry 14;
  - reg. 54–84 = C4-LA1 45–75.
- **Verdict "V"** means verified against the Lean text and by my own reproduced computation where one applies. "V (read)" means verified by reading the statement or definition and the proof step.

### N0: carried layer

| # | Item | What it says or computes (read from the fragment) | Where it enters | Verdict |
|---|---|---|---|---|
| L1 | Byte identity of the carry | 66/66 carried fragments are byte-identical to their origin fragments, with identical names: 65 from C4-LA1 `Snippets/` and 1 from first-interior `Snippets/0014` (`378868ab…`). See `carry_check.py` / `.log`. Nothing from C4-LA1 22–24, 38–44 or 76–113 and nothing from C5-LA1 is carried: none of the 48 excluded C4-LA1 declaration names occurs in `Main.lean` outside comments or docstrings. No `hookPred`, `hookChainIndex`, `HookChain` or `SpiderDraft` token occurs. `Main.lean` contains the 173 snippets in registrar order and has no other declarations. | all | V |
| L2 | `indepFamily G j` (entry 14) | Independent `j`-subsets of `univ`. | layers `I_p`, `I_{p+1}` | V (read) |
| L3 | `tagWitnesses G v` (15) | `(N(support v)).erase v` | activity | V (read) |
| L4 | `activeWeight G F B` (16) | `#{v ∈ F ∩ B : ¬Disjoint (B.erase v) W_v}`, which counts ACTIVE tags only. | flow constraints | V (read) |
| L5 | `favorableLeaves G p` (18) | `leafSet.filter (Δ_p(G−v) < 0)`, under `open Classical in`. It is a subset of `leafSet` by `Finset.filter_subset`. | terminal selector | V (read) |
| L6 | `transportRel` (19) | (D) `∃ q ∈ B, A = B.erase q`, or (S) the two-for-one switch. Carried literally. | flow support | V (read) |
| L7 | `IsSaturatingFlow` (20) | (i) `f` is positive only on `I_{p+1} × I_p` arcs in `transportRel`; (ii) every source sends exactly `activeWeight`; (iii) every target receives at most `activeWeight`. | conjunct 4 | V (read) |
| L8 | `C5LA1.support` / `leafSet` / `IsGraphLeaf` (4–6) | A leaf has a unique neighbour, and `support` is that neighbour, via `Classical.choose` with the uniqueness clause. | (F0) | V (read) |
| L9 | `indepSetsAvoiding` / `indepSetCount` / `forwardDifferenceDel` (9–11) | `indepSetCount G D j = (indepSetsAvoiding G D j).card` by definition. `forwardDifferenceDel` is ℤ-valued: `(i_{j+1} : ℤ) − i_j`, with no truncated ℕ subtraction. | N3a | V (read) |
| L10 | `C5LA1.crossingIndex` (FI 14) | `Nat.find` of the first `j` with `forwardDifferenceDel G ∅ j < 0`. The existence witness is `j = indepNum`, from `G.exists_isNIndepSet_indepNum`: `i_α > 0` because the maximum independent set is counted, and `i_{α+1} = 0` because every counted `t` has `t.card ≤ indepNum` (`card_le_indepNum`). The "zero extension" is therefore not a separate device: the `powersetCard` filter is empty above `α`. My port `crossing_index` uses the same zero extension. | N3a, conjunct 2 | V |
| L11 | `ChainFactor` (25) | Constructors `single v`, `path x y z`, `frozen vs s`. | (F3) | V (read) |
| L12 | `verts` / `code` / `drop` / `rk` / `Valid` (26–30) | See the block-type table after this one. | (F3)–(F6) | V (read and ported) |
| L13 | `chainDownUp` (31) | For `c :: cs`, let `(d,u)` be the tail's value and `(i,l) = code c B`. If `i ≤ u`, the result is `(d, u−i+(l−i))`; otherwise it is `(d+i−u, l−i)`. Every ℕ subtraction here is exact: `i ≤ u` in the first branch, `i ≤ l` (entry 57), and `u < i` in the second. | (F5), N3a | V (ported) |
| L14 | `chainDownVertex` (32) | Walks the list: if `i ≤ u` it recurses into the tail, otherwise it returns `c.drop B`. It returns `none` only at `[]`. | φ, ψ | V (ported) |
| L15 | `chainVerts` / `chainSize` / `chainRank` / `ChainValid` / `ChainDisjoint` (33–37) | `chainVerts` is the union of the blocks' `verts`. `chainSize` is Σ `|B ∩ verts|`. `chainRank` is Σ `rk`. `ChainValid` means every block is `Valid`. `ChainDisjoint` means the blocks' `verts` are pairwise disjoint (`List.Pairwise`). | (F3), (F5) | V (read) |
| L16 | Entry 46 `indepFamily_eq_indepSetsAvoiding` | `indepFamily G j = indepSetsAvoiding G ∅ j` | count bridge | V (read) |
| L17 | Entry 55 `card_inter_path_eq` | For distinct `x,y,z`, `|B ∩ {x,y,z}|` is the sum of three indicators. | root bound, (F6) | V (read) |
| L18 | Entry 63 `two_mul_chainSize_add_up_eq` | Under `ChainValid`: `2·chainSize + up = chainRank + down`. | (F5), N3a | V (read; identity asserted on every row in part (c)) |
| L19 | Entry 64 `mem_and_exists_drop_of_chainDownVertex` | Under `ChainValid`, if `chainDownVertex = some q`, then `q ∈ B` and some block `c` has `code.1 > 0`, `drop = some q` and `q ∈ c.verts`. | q ∈ B; (F6) block identification | V (read) |
| L20 | Entry 65 `exists_chainDownVertex_of_down_pos` | `ChainValid` and `down > 0` give `∃ q, chainDownVertex = some q`. | totality | V (read) |
| L21 | Entry 67 `notMem_verts_of_chainDownVertex` | Under `ChainDisjoint` and `ChainValid`, `q ∉ c.verts` for every block with `code.1 = 0`. Every `frozen` block has code `(0,0)`. | (F6) "frozen never drops" | V (read) |
| L22 | Entry 68 `eq_of_chainDownVertex_erase_eq` | Under `ChainDisjoint`, with `ChainValid` on both `B` and `B'`, `some q` and `some q'`, `B.erase q = B'.erase q'` implies `B = B'`. | injectivity of φ and ψ | V (read) |
| L23 | Entry 70 `chainSize_eq_card_inter` | Under `ChainDisjoint`: `chainSize = |B ∩ chainVerts|`. | `chainSize = |B|` | V (read) |
| L24 | Entry 71 `chainSize_le_length` | If every block meets `B` at most once, then `chainSize ≤ length`. | root bound, (F6) | V (read) |
| L25 | Entry 74 `erase_mem_indepFamily` | `B ∈ I_{p+1}` and `q ∈ B` give `B.erase q ∈ I_p`. | ψ lands in `I_{k+1}`; inside entry 75 | V (read) |
| L26 | Entry 75 `saturatingFlow_of_perTag_deletionInjections` | Hypotheses: `hφ` (for `τ ∈ F`, `B ∈ I_{p+1}`, `τ ∈ B` and `τ` active, there is `q ∈ B` with `φ τ B = B.erase q`, `τ ∈ φ τ B`, and `τ` still active) and `hinj` (injective on the active sources containing `τ`). Conclusion: a saturating flow with deletion support. | (F7) | V (read) |

**The block types (L12), for a `single v`, a `path x y z` and a `frozen vs s`:**

| Field | `single v` | `path x y z` | `frozen vs s` |
|---|---|---|---|
| `verts` | `{v}` | `{x,y,z}` | `vs` |
| `code` | `(1,1)` if `v ∈ B`, else `(0,1)` | `(0,0)` if `y ∈ B` or `B ∩ path = {z}`; `(1,2)` at `{x}`; `(2,2)` at `{x,z}`; `(0,2)` at `∅` | always `(0,0)` |
| `drop` | `some v` | `some z` if `z ∈ B`, else `some x`; it never returns `y` | `none` |
| `rk` | 1 | 2 | `2·|s|` |
| `Valid` | `True` | pairwise distinct, `¬(x,y ∈ B)`, `¬(y,z ∈ B)` | `B ∩ vs = s` |

### N1: the tree face

| # | Claim | Check | Verdict |
|---|---|---|---|
| T1 | `spiderEdge` / `spiderOneTwoThrees` / `spiderOneTwoThrees_decAdj` | `fromRel` symmetrises the relation and removes loops. I evaluated the literal Lean relation for `k ≤ 12`, and its edge set equals the labels of record (part (c), check c1). `decAdj` is `decidable_of_iff` on `fromRel_adj`, so it is instance plumbing only; any `DecidableRel` instance gives the same values, since all the carried objects are decidable filters of Props. | V |
| T2 | Parent map `spiderParentVal`: `1,2 ↦ 0`, `3 ↦ 2`, `a_i ↦ 0`, `b_i ↦ a_i`, `c_i ↦ b_i` | Branch order: `n ∈ {1,2,3}` first, then `(n−4)%3 = 0`, then `n−1`. So `(n−4)` is evaluated only at `n ≥ 4` (at `n = 0` it truncates to `0%3 = 0` and returns `0`, which is never used for a non-root vertex). `n−1` is reached only at `n ≥ 5`. For `k ≤ 12` the parent is smaller and adjacent (c2). | V |
| T3 | Child–parent injection | If `s(v,pv) = s(w,pw)` with `v ≠ w`, then `pv < v = pw < w = pv`, a contradiction. The range equals the edge set, because each listed edge's larger label has the smaller as its parent. For `k ≤ 12`, the `3k+3` child edges are distinct and equal `E` (c3). | V |
| T4 | Connectivity by root walks of length ≤ 3; `isTree_iff_connected_and_card` | The Mathlib statement (read in `Mathlib/Combinatorics/SimpleGraph/Acyclic.lean:480`) is `[Finite V] : G.IsTree ↔ G.Connected ∧ Nat.card G.edgeSet + 1 = Nat.card V`. The Lean proof rewrites the edge set as the range of the injective child-edge map, and the non-root card plus 1 as `3k+4`. Part (a) independently confirms `|E| = n−1` and connectivity for `k ≤ 40`. | V |

### α and the low window

| # | Claim | Check | Verdict |
|---|---|---|---|
| A1 | Witness `{v ≠ 0, v % 3 ≠ 2} = {1,3} ∪ {a_i, c_i}` is independent | Every edge has an endpoint labelled `0`, `2` or `b_i ≡ 2`. For `k ≤ 12` it is independent with `2k+2` elements (c6). | V |
| A2 | `card_range_filter_ne_zero_mod_three_ne_two`: the card is `2k+2` by induction over `Finset.range (3k+4)` | Step: `range(3(k+1)+4)` is three `insert`s over `range(3k+4)`. Label `3k+4 ≡ 1` counts; `3k+5 ≡ 2` does not; `3k+6 ≡ 0` (nonzero) counts. So the step adds 2, matching the Lean `if_pos` / `if_neg` / `if_pos`. Base: `range 4 → {1,3}` has 2 elements, a closed `rfl` evaluation of one fixed finite object. No universal step is replaced by an enumeration (disclosure (v)). | V |
| A3 | Upper bound by the `2k+2` cells | `spiderCell`: `{0,1} ↦ 0`, `{2,3} ↦ 1`, `{a_i,b_i} ↦ 2i+2`, `{c_i} ↦ 2i+3`. The `(n−4)` terms are evaluated only when `n ≥ 4`. Two distinct vertices in one cell are adjacent. `card_le_card_of_injOn` into `range(2k+2)` (Mathlib `Finset/Card.lean:422`). For `k ≤ 12` the cells are exactly `0..2k+1`, each an edge or a singleton, and `spiderPartner` is correct (c4, c5). | V |
| A4 | `α = 2k+2` | `le_antisymm` of A1–A3. Part (a): `α = 2k+2` for `k ≤ 40` by my own tree DP, equal to the registered closed form, with brute force for `k ≤ 6`. | V |
| A5 | Low window `3(k+3) < 2α+1 ⇔ k ≥ 5` | `3k+9 < 4k+5 ⇔ k > 4`, by `omega`. This is the only use of `hk` apart from its consequence `1 ≤ k` passed to N3a (see A6/N9 and the terminal). Part (a): `low_window` is true exactly for `k ≥ 5` (`k = 0..40`). | V |

### N3a: the root split

| # | Claim | Check | Verdict |
|---|---|---|---|
| N1 | Root bound `spider_card_le_of_root_mem` | If `0 ∈ B`, then `1, 2, a_i ∉ B`. On `L₀ = [single 1, path(3,2,0), path(a_i,b_i,c_i)]`, the counts are: `{1}` meets `B` in 0; `path(3,2,0)` in `1 + [3 ∈ B]`; each arm in at most 1 (`b_i ~ c_i`). Then `|B| = chainSize L₀ B` (entry 70) `≤ k+1+[3 ∈ B]` (entries 55, 71). For `k ≤ 8`, every root-present independent set of every size satisfies the bound (part (d)). | V |
| N2 | `L₀ = spiderTagFactors k 0` | `spiderLeafBlock` at label `0 ≠ 1` is `single 1`. `spiderArmIndex` at `0 < 6` is `k`, so no arm is frozen. Asserted literally for `k ≤ 8`. | V |
| N3 | Totality on root-free `B ∈ I_{k+2}` | `L₀` is `ChainValid` on every independent `B`, `chainRank L₀ = 1+2+2k = 2k+3`, and `chainSize = k+2`. Entry 63 gives `down = 1 + up ≥ 1`; entry 65 gives `q`; entry 64 gives `q ∈ B`. Part (d) checks `d = 1+u` on every root-free source, `k ≤ 8`. | V |
| N4 | Root-present `(k+2)`-sets contain `3`; `ψ B = B ∖ {3}` | From N1 with `|B| = k+2`. There are `2^k` root-present sources for every `k ≤ 8` (d). | V |
| N5 | Injectivity | `0 ≠ 3` preserves root membership, so the two cases do not mix. Root-present: `insert 3 (B ∖ {3}) = B`. Root-free: entry 68 under `ChainDisjoint L₀` and `ChainValid` on both. Part (d): injective and root-membership-preserving on all of `I_{k+2}`, `k ≤ 8`. | V |
| N6 | Missed witness `W = {v % 3 = 0} ∖ {3k+3} = {0,3,c_0,…,c_{k−2}}` | No edge joins two labels `≡ 0`. `|{v % 3 = 0} ∩ range(3k+4)| = k+2` by induction (the step adds only `3k+6`; base `{0,3}`), so `|W| = k+1`. It contains `0` and `3` iff `3 ≠ 3k+3`, i.e. `k ≥ 1`. It is missed by both cases: a root-present image lacks `3`, a root-free image lacks `0`. Checked for `k ≤ 12` (c7) and `k ≤ 8` (d). `W` is defined without reference to ψ, so it is independent of the map. | V |
| N7 | `i_{k+2} < i_{k+1}` | `card_le_card_of_injOn` into `I_{k+1}.erase W`, then `card_erase_of_mem`. The ℕ `card − 1` is guarded by `hpos : 0 < card` (W is a member) before `omega`. For `k ≤ 8`, part (d) gives `|I_{k+2}| < |I_{k+1}|`; for `k = 8` that is `443054 < 483665`, matching C-U1-T `run1.log` row F. Part (a) gives the inequality for `1 ≤ k ≤ 40`. | V |
| N8 | Count bridge; `forwardDifferenceDel G ∅ (k+1) < 0` | `rw [indepFamily_eq_indepSetsAvoiding]` (entry 46) twice, then unfold `forwardDifferenceDel` and `indepSetCount` (entries 10–11; ℤ-valued), then `omega`. No new bridge lemma was authored (confirmed: no bridge declaration among the new entries). | V |
| N9 | `crossingIndex ≤ k+1` | `Nat.find_le` (Mathlib `Data/Nat/Find.lean:138`: `p n → Nat.find h ≤ n`) on the unfolded definition of record, valid for any decidability instance. Part (a): `x = k+1` for `1 ≤ k ≤ 40`. | V |

### FLOW: `spiderOneTwoThrees_deletionFlow (k p) (hp : k+2 ≤ p) (F ⊆ leafSet)`

| # | Claim | Check | Verdict |
|---|---|---|---|
| F0 | Leaves `{1,3} ∪ {c_i}`, both directions; witness sets | `0, 2, a_i, b_i` each have two distinct neighbours, and `1, 3, c_i` exactly one. The supports are `0, 2, b_i`. `W_1 = N(0) ∖ {1} = {2} ∪ {a_j}`: these are exactly the other neighbours of the support `0`. `W_3 = N(2) ∖ {3} = {0}`. `W_{c_i} = N(b_i) ∖ {c_i} = {a_i}`. The witness lemmas go through the graph-generic `support_eq_of_isGraphLeaf_of_adj` (the uniqueness clause of `Classical.choose_spec`) and `mem_tagWitnesses_iff_of_adj`. Activity is `∃ w ∈ B, w ∈ W_τ` (`not_disjoint_erase_tagWitnesses_iff_exists_mem`; a witness is never `τ` itself). I derived leaves and `W` generically from the edge list for `k ≤ 12` (c8, c9). | V |
| F1 | Root absence at `|B| = p+1 ≥ k+3` | N1. Part (c) asserts it on every active source. | V |
| F2 | Tag-3 vacuity | `W_3 = {0}` and F1. Part (c): 0 active sources for tag 3 on every row. | V |
| F3 | Block lists `𝓑_τ = [β₁(τ), path(3,2,0), A_0…A_{k−1}]` | `path(3,2,0)` is a path of the tree (`3~2`, `2~0`) with the root as its `z`-vertex. `spiderArmIndex` at `c_j` is `j`; at labels `< 6` it is `k`, so none is frozen. `ChainDisjoint` and `chainVerts = univ` hold for every `τ` (not only leaves) for `k ≤ 12` (c11), so `chainSize = |B|` by entry 70. | V |
| F4 | `ChainValid` on `τ`-active `B ∋ τ` | `single` blocks are always valid. `frozen({1},{1})` is valid because `1 = τ ∈ B`. The path blocks are valid by independence. For `τ = c_j`, the frozen arm needs `B ∩ {a_j,b_j,c_j} = {a_j,c_j}`: `a_j ∈ B` from activity (`W_{c_j} = {a_j}`), `b_j ∉ B` from independence (`a_j ~ b_j`), and `c_j ∈ B` from `τ ∈ B` (the `τ ∈ B` hypothesis of entry 75's `hφ` / `hinj`). The Lean text isolates `τ = c_j` from `spiderArmIndex τ = j` and the leaf cases by `omega`. Part (c) asserts `ChainValid` on every active source. | V |
| F5 | `chainRank ≤ 2k+5`; `down ≥ 1` | Rank by block type: `single` 1, `path` 2, `frozen({1},{1})` 2, `frozen(arm,{a,c})` 4. So `𝓑_1 = 2+2+2k = 2k+4` and `𝓑_{c_j} = 1+2+2(k−1)+4 = 2k+5`; root and tag 3 give `2k+3`; every `τ` gives `≤ 2k+5` (c12, `k ≤ 12`). Entry 63: `down = 2(p+1) + up − rank ≥ 2(p+1) − (2k+5) ≥ 1` for `p ≥ k+2`. The quantity is formed as an equation and closed by `omega`; no truncated subtraction is load-bearing. Entry 65 gives `q`, and entry 64 gives `q ∈ B`. | V |
| F6a | Activity after the step, `τ = c_j` | Frozen code `(0,0)`, so by entry 67 `q ∉ {a_j,b_j,c_j}`. `c_j` and `a_j` survive, so `τ` is kept and stays active. | V |
| F6b | Activity after the step, `τ = 1` (cardinality) | See the case walk after this table. | V |
| F7 | `φ = spiderTagDown` and the composition | `spiderTagDown` is `match chainDownVertex with some q ⇒ B.erase q, none ⇒ B`. On every `τ`-active source, F5 yields `some q`, so the `none` branch is never taken there, and `hφ` is discharged by the `some q` witness (`spiderTagDown_erase_keeps_tag_active`). `hinj` follows from entry 68, with `ChainValid` proved on both `B` and `B'` (`spiderTagDown_injOn`). Leaf classes are exhaustive under `hF : F ⊆ leafSet` with F0 (`spider_leaf_cases`). Landing in `I_p` is entry 74 inside entry 75. Part (c) assembles `f(B,A) = #{τ ∈ F_p active in B : φ_τ(B) = A}`: every source sends exactly `w(B)` and every target receives at most `w(A)`, on every row. | V |

**The case walk for F6b.** Suppose `B ∖ {q}` has no element of `W_1`. Then every block of `𝓑_1` meets `B` at most once:

- **`{1}`:** trivially, since it has one vertex.
- **`path(3,2,0)`:** `0 ∉ B` because `0 ~ 1 ∈ B`, and `2, 3` are not both in `B` because `2 ~ 3`. This holds whether or not `q = 2`; in fact `drop` never returns `y = 2`.
- **An arm with `a_j ∉ B`:** `b_j` and `c_j` are adjacent, so at most one of them is in `B`.
- **An arm with `a_j ∈ B`:**
  - `a_j = q`, since otherwise `a_j` would be a surviving witness.
  - The block that returned `q` (entry 64) must contain `a_j`. `frozen({1},{1})` drops nothing, and `path(3,2,0)` holds labels `≤ 3`. So it is arm `j`, by disjointness and the labels.
  - For arm `j`, `drop` is literally `some (if c_j ∈ B then c_j else a_j)`. Having returned `a_j`, this forces `c_j ∉ B`.
  - `b_j ∉ B` because `a_j ~ b_j`.
  - So arm `j` meets `B` once, and at most one arm is in this case.

Then entry 71 gives `|B| = chainSize ≤ length 𝓑_1 = k+2 < k+3 ≤ p+1 = |B|`, a contradiction. The Lean text `spider_one_active_after_down` covers exactly these cases. Part (d) probe: the arm-drop case `q = a_j` really occurs (for example, 4472 of 14196 tag-1 sources at `k = 6`), and a witness survives every time.

### Assembly

| # | Claim | Check | Verdict |
|---|---|---|---|
| S1 | Terminal | The proof term is a four-tuple `refine ⟨isTree, ?_, lowWindow k hk, ?_⟩`: `crossingIndex_le k (by omega)` then `omega`; and `deletionFlow k (k+3) (by omega) _ (filter_subset)`. It calls no identically stated lemma. `F` is the underscore unified from the goal `favorableLeaves (spiderOneTwoThrees k) (k+3)`: derived, not hard-coded. | V |
| S2 | Hypothesis use | `hk` is used by the low window; `1 ≤ k` is its consequence, passed to N3a; `k+2 ≤ k+3` is closed by `omega` without `hk`. | V |
| S3 | ℕ/ℤ audit | Label subtractions: `(n−4)%3`, `(n−4)/3`, `n−1` (`spiderParentVal`, `spiderCell`, `spiderPartner`) are evaluated only past branches forcing `n ≥ 4` or `n ≥ 5`; `(τ−6)/3` only under `6 ≤ τ`. Witness: `k−1` appears only in prose; `W` is defined by `erase`. `chainDownUp`: exact (L13). Ranks: an identity plus `omega`. `forwardDifferenceDel`: ℤ. `card − 1` in N7: guarded. No truncation is load-bearing. | V |

**Disclosure judgements (brief §5).** None of these changes the statement, a definition of record, or the validity of a step.

- **(i)** The controller filed the formalizer report. That is a disclosure of record; its content is consistent with the Lean text.
- **(ii)** The five graph-generic helpers are lemmas, not definitions of record. `inter_insert_insert_singleton_eq_pair` has C4-LA1 entry 102's statement and proof text under a new name, and its comment states the transcription.
- **(iii)** `@[reducible, instance] def`: plumbing only (T1).
- **(iv)** The `Option`-unwrapped φ: see F7.
- **(v)** The `rfl` base cases: see A2 and N6.
- **(vi)** The companion is registered; the terminal keeps the frozen form.
- **(vii)** The axioms rewrite: the digests match as disclosed.
- **(viii)** The formalizer's read-boundary items are process items and affect no step.

## Reproduced Mathematical Evidence

This is my own exact-integer code under `scratchpad/c6-s7-informal-LA2/`:

- It uses the standard library only; the import lists are in each file header (`sys`, `collections`, `random`, `json`, `hashlib`, `os`).
- It uses no prior evaluator. `chainport.py` ports `code`, `drop`, `chainDownUp` and `chainDownVertex` and the C6-LA2 definitions from the fragment statements.
- The logs contain no wall-clock fields.
- Every run used `python3 -B`, in the foreground.

**Digests of the scripts:**

| File | SHA-256 |
|---|---|
| `spiderlib.py` | `5b80996b…` |
| `chainport.py` | `7fa47a5f…` |
| `maxflow.py` | `e7645b49…` |
| `part_a.py` | `fe7d3d89…` |
| `part_b.py` | `5d160ac9…` |
| `part_c.py` | `3e0b2a90…` |
| `part_d.py` | `0dbcdb5e…` |
| `carry_check.py` | `2998bd7c…` |
| `seal_check.py` | `66fc7187…` |

**Digests of the logs:**

| File | SHA-256 |
|---|---|
| `part_a.log` | `ba6ae775…` |
| `part_b.log` | `c2995a39…` |
| `part_c.log` | `f768296c…` |
| `part_d.log` | `de7458b3…` |
| `maxflow_selftest.log` | `fdd0200f…` |
| `carry_check.log` | `d102596d…` |
| `seal_check.log` | `006500de…` |

**(a) Tree, α and x, `k = 0…40`** (`PART_A_ALL_OK True`).

- **Checks per `k`:**
  - the tree has `n−1` edges and is connected;
  - `α = 2k+2`, from my forest DP;
  - the DP polynomial equals the closed form `(1+y)(1+2y)(1+3y+y²)^k + y(1+y)(1+2y)^k`, and equals brute-force enumeration for `k ≤ 6`;
  - `x = k+1` for `1 ≤ k ≤ 40`, computed as the first strict descent through `α` with the zero extension;
  - `i_{k+2} < i_{k+1}`;
  - the low window holds iff `k ≥ 5`.
- **`k = 0`:** `x = 1`, which is outside N3a's `1 ≤ k`; the case is not used.

**(b) Literal deletion-only network, `k = 1…8`, `p = k+2, k+3, k+4`** (`PART_B_ALL_OK True`).

- **Construction:**
  - `F = F_p`, derived from the sign of `Δ_p(G−v)` computed by DP;
  - weights are the literal active-tag weight;
  - arcs are `B → B∖{q}`;
  - the max-flow is an exact Dinic, self-tested against my own Edmonds–Karp on 400 random networks, with 0 mismatches (323 of them had flow below supply).
- **Independent sides:** supply and capacity come from enumeration. `S = Σ_{v∈F} [Δ_{p−1}(G−H_v) − Δ_{p−1}(G−R_v)]` comes from separate DPs on the deleted forests.
- **Result:** on every one of the 24 rows, max-flow = supply and supply − capacity = S.
- **Rows of record, matched exactly:**

| Row | Supply | Capacity | S | Flow |
|---|---|---|---|---|
| `k = 5, p = 8` | 3125 | 6100 | −2975 | 3125 |
| `k = 7, p = 10` | 109389 | 176918 | −67529 | 109389 |

- **Other agreements:** `k = 6, p = 9` gives 18900 / 33072 / −14172 / 18900 (the ADJ-U table). All 9 rows overlapping C-U1-T `run1.log` (`k = 5, 6, 7` at `p = k+2..k+4`) agree field by field.
- **Eligible rows:** `(5,8)`, `(6,9)`, `(7,10)`, `(8,11)` and `(8,12)`; all saturate.

**(c) Per-tag chain maps, every leaf tag, every `p ∈ [k+2, 2k+1]`, `k ≤ 6`** (21 rows; `PART_C_ALL_OK True`).

- **Asserted on every active source:**
  - partition and `ChainDisjoint`;
  - the root is absent;
  - `ChainValid`;
  - the entry-63 identity;
  - `chainSize = p+1` and `down ≥ 1`;
  - totality with `q ∈ B`;
  - `φ = B∖{q}` lies in `I_p`;
  - the tag is kept and stays active;
  - φ is injective per tag;
  - `q` avoids every frozen block.
- **Tag 3:** 0 active sources on every row.
- **The assembled entry-75 flow for `F = F_p`:** it saturates every source and respects every capacity.
- **Literal-definition checks c1–c13 (`k ≤ 12`):** the edge relation, parent map, cells, partner map, both witnesses, leaves and `W`, arm index, partition, per-class ranks, and the mid block.

**(d) Root split, `k ≤ 8`** (`PART_D_ALL_OK True`).

- The literal `spiderRootSplitDown` is a single deletion into `I_{k+1}`.
- It preserves root membership and is injective.
- Root-present sources number `2^k`, and each contains `3`.
- `d = 1+u` on root-free sources.
- `W` is independent, lies in `I_{k+1}` and is missed.
- `|I_{k+2}| < |I_{k+1}|`; for `k = 8` that is `443054 < 483665`.

**Probe.** At `p = k+1` the per-tag maps fail totality or validity (4, 17, …, 7247 failures for `k = 1…6`). So `hp : k+2 ≤ p` is load-bearing, as the registered key's scope says.

All of this is bounded computation, never proof. The proof is the ledger above.

## Independent Critic Pass

I re-attacked my own ledger with the step unchanged.

1. **Could `F` be hard-coded, or could the terminal hide an identically stated lemma?** No. The fourth component is `deletionFlow … _ (filter_subset)` with `F` unified from the goal. The terminal does not call `spider_kPlus3_terminal_of_nodes` or any lemma with the terminal's statement.
2. **Does FLOW rely on eligibility, crossing index or α?** No. It uses only `hp` and `hF`. So there is no circularity with conjuncts 2–3. N3a does not use FLOW. It reuses the root-free chain predecessor `spiderTagDown k 0` only as a function.
3. **The `none` branch of `spiderTagDown`.** Could entry 75's `hφ` be met vacuously or falsely through it? No: `hφ` demands `∃ q ∈ B, φ = B.erase q`, and the proof supplies `q` from `chainDownVertex = some q`. My port confirms `some` on every active source (c).
4. **(F6b) edge cases.**
   - Could `q = 2`? `drop` never returns `y`. The argument does not need this anyway, since `|B ∩ {3,2,0}| ≤ 1` by independence alone.
   - Could two arms both have `a_j ∈ B`? Only one can equal `q`.
   - Could `q = a_j` come from the mid block? It holds labels `≤ 3`, so no.
   - Could the frozen leaf block drop? Its `drop` is `none`.
   - Is the "at most once" bound over all `k+2` blocks, including `β₁`? Yes, `β₁ = {1}`.
5. **(F4) for a non-leaf `τ` of label `≥ 6`,** which would freeze arm `(τ−6)/3`: this is excluded by `hleaf` and `spider_leaf_cases`, and `omega` pins `τ = c_j`. It is irrelevant to entry 75 anyway, since `F ⊆ leafSet`.
6. **Count bridge direction.** `indepSetCount G ∅ j` counts `indepSetsAvoiding G ∅ j`, which equals `indepFamily G j` (entry 46). With `D = ∅`, `univ \ ∅ = univ`. The ℤ cast is exact.
7. **`Nat.find` instance.** `crossingIndex` is elaborated under `open Classical in`. `Nat.find_le` holds for any `DecidablePred`, and the value of `Nat.find` does not depend on the instance.
8. **Fence arithmetic.** "False for `k ≤ 4`" is exact: `3(k+3) < 4k+5 ⇔ k ≥ 5`, with `α = 2k+2` for every `k` (part (a), `k = 0…4` false). "The other three items hold for every `k ≥ 1`" is true: N1 holds for every `k`; `x ≤ k+1` holds for `k ≥ 1`; the FLOW lemma has no `k` hypothesis.
9. **Carried numbering.** `INFORMAL-PROOF.md` §8 says "definition entries 1–18 incl. `C5LA1.crossingIndex` (entry 14)". That uses first-interior numbering, while §1 and §7 use C4-LA1 numbering, in which entry 14 is `indepFamily`. The sentence is the brief's attribution text verbatim. It is an attribution label, not a dependency claim, and has no mathematical effect. **Observation, not a defect.**
10. **ℕ-subtraction list in `INFORMAL-PROOF.md` §0.** It names `(n−4)/3`, `(n−6)/3` and `n−1`. The source also has `(n−4)%3` and `spiderPartner`'s `u−1`, both guarded in the same way (S3). The list is incomplete in wording only. **Observation, not a defect.**
11. **The forbidden phrase.** "deletion injection" occurs in none of `INFORMAL-PROOF.md`, the contract's `informal_statement` or `Main.lean` (case-insensitive). The carried identifier `saturatingFlow_of_perTag_deletionInjections` is C4-LA1's name of record, not new wording.
12. **The formalizer brief's (F6) phrasing,** "`B ⊆ {1,3,a_j} ∪ …`", differs from `INFORMAL-PROOF.md`'s per-block formulation. The latter is what the Lean proves, and both give `|B| ≤ k+2`. There is no gap.

The critic pass found no defect. Each prover-side verdict above stands, with its reproduced evidence.

## Scope and Fence Check

**The claim asserts nothing fenced.**

- **One family:** `S(1,2,3^k)` only.
- **One rank:** `k+3` only. FLOW's general `p ≥ k+2` is a companion lemma with no grade asserted (R29-N-12), and the terminal instantiates `p = k+3`.
- **One range:** `k ≥ 5` only. Both `INFORMAL-PROOF.md` §0 and the contract say the statement is FALSE for `k ≤ 4` because the window is empty.
- **Flows:** deletion-supported flows; the companion carries the support conjunct.
- **Not asserted:**
  - (HALL) at full scope;
  - "every eligible rank" of the spider (the registered `proved_informal` key `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2` keeps that scope, and the face says it is NOT superseded at other ranks);
  - "every tree";
  - anything on the primary aggregate (`C5LA1.aggregate` is carried as part of the definition layer, and nothing about it is claimed);
  - an RTree statement;
  - anything about switch arcs;
  - any status change of a registered key;
  - any revival of the REFUTED universal per-leaf key (the per-tag deletion is stated as family-scoped).
- **The separate key:** `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-TREE-WEIGHTED-HALL-AT-RANK-K-PLUS-3-FOR-K-AT-LEAST-5` contains none of "4k", "deletion injection" or "favorable-leaf aggregate".
- **Attribution:** it travels on both faces, `INFORMAL-PROOF.md` §8 and the contract's `informal_statement`, which name all of:
  - Codex GPT-6;
  - r29;
  - the first-interior run;
  - C1-LA1;
  - C4-LA1;
  - the Cycle 5 spider theorem (`C-F2-U`, F2, the Cycle 5 F adjudicator, SR-C5-2);
  - U1;
  - `C-U1-F`;
  - `C-U1-T`;
  - the U adjudicator, for node (F0);
  - C5-LA1's tree-layer pattern;
  - the C6-LA2 formalizer.

**The proof of record matches the capsule's record.**

- The synthesis `## Lean awards` C6-LA2 (the FLOW nodes (F0)–(F7), N3a's sub-nodes, and the frozen statement, which is identical).
- U adjudication results 3–4 and group U-A.
- C-U1-T F2 and F3.
- C-U1-F F2, F3 and F4.
- The registered key's face in `CLAIM-IDENTITY.run-local.c6-stage2.json`: its labels and `W_1 = {2, a_1…a_k}`, `W_3 = {0}`, `W_{c_i} = {a_i}` agree with (F0) up to 1- versus 0-indexing.
- **Repair R-7 is met:** every C4-LA1 entry was re-verified by me against C4-LA1's own `Snippets/`, not against the Cycle 5 scratch.

**My own read-boundary disclosures.**

- **Names-only listings outside the grant:** `ls` of all subdirectories of `sources/c6-stage7-sources/` (not only the four granted), and of `control/controller-facts/`.
- **A `grep` rooted too high:** one `grep` for `find_le` was rooted at the shared `.lake/packages` directory (via `…/mathlib/Mathlib/../../`), one level above the Mathlib package, instead of inside it. It was read-only, and all hits shown were in Mathlib.
- **One harmless failed command:** a malformed shell redirect to the nonexistent path `/tmp/../dev/null` failed with no file written. A mis-cwd run of `carry_check.py` to `/dev/null` failed and wrote nothing.
- **The registry snapshot:** my scan printed the registered spider key's entry and one neighbouring scope-note text (same file, granted).
- **What I did not do:** no Lean build; no `lake` or `elan`; no network; no installs; no background jobs; no edits anywhere in the Lean run.
- **What I wrote:** only this file and my scratch under `scratchpad/c6-s7-informal-LA2/`. No conversation log was written, because the brief confines writes.

## Verdict

passed

`INFORMAL-PROOF.md` (`b3e3bfcc…`) is a correct, complete, statement-level proof of the contract's `informal_statement`
(`claim_sha256 942f576e…`), and every step matches the kernel-checked Lean text. N1, α, the low window, N3a (the root split) and
FLOW (F0)–(F7) are each verified, the latter composed through entry 75, and so is the assembly. No step depends on an unproved or
misattributed input. Every carried entry is byte-identical to its origin. The hypotheses match the claim one-for-one, and no
fenced conclusion is asserted.

- **Observations** (critic items 9, 10 and 12) are wording only and do not affect validity.
- **Attestation id:** `c6-la2-informal-pass-20260928`.
- **Model disclosure:** chartered Claude Opus 5.5 (effort high) on dispatch-record authority. The runtime-reported model id, verbatim, is `claude-opus-5-5[1m]`.
