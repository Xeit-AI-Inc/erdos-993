# Second Read

Read `SR-C4-1`, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Cycle 4. Isolated second read of Theorem CT-1, its
rank extension R2′, the composition to (HALL) on the `G_k` family, and the key name. Date 2026-09-27.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and loaded no other VerityOS subsystem (no memory, decisions, logs,
conversations, operations, modules, skills or knowledge files).

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

(The chartered model and the transport clause are as the dispatch states them; I cannot observe the transport parameter myself.
The runtime-reported id is quoted verbatim from my runtime.)

**Decisive line (C4 gate ruling 30, letter (a)): CT-1 at `p = k + 3` is CONFIRMED.** It holds for every `k ≥ 1` and every leaf tag
set, and with the registered `G_k` eligibility key it is (HALL) on the infinite eligible family `{(G_k, k+3) : k ≥ 3}` at
`proved_informal`.

## Identity and seal audit

- **Capsule.** `control/c4-second-read/SR-C4-1-PACKET-MANIFEST.json` (file SHA-256
  `7ed9c25573d5344cfabfbb6adf0c56114c9d6b61f11ac0e88d987c1d105d0da8`), stage `cycle-4-second-read-SR-C4-1`, 75 members.
- **Inner seal.** I recomputed it as the SHA-256 of the compact, key-sorted JSON of the manifest without `seal_sha256`, with no
  trailing newline: `8d4f8d53d9a63b9473d763f999d386d8e5168ea0bf31c9617714a365f084198e`. It **equals** the recorded seal.
- **Members.** All 75 digests and byte counts match (0 mismatches). My instrument is `scratchpad/c4-sr-SR-C4-1/seal_audit.py`.
- **Nested digests.** All 49 capsule members under `sources/c4-stage7-sources/` match their entries in that directory's own
  `SOURCE-DIGESTS.json` (0 mismatches). The file lists 217 entries; the other 168 are not in my capsule and I did not open them.
- **Order.** I read the protocol and then the manifest, and verified the seal before reading any other member.
- **Registry snapshot.** `control/snapshots/CLAIM-IDENTITY.run-local.c4-stage2.json` has 448 claims. I read it with Python only,
  inside the capsule.
- **Frozen seat instruments** (`sources/c4-stage7-sources/…`). I verified them and did not run or read them. Every number below
  comes from my own instrument.

## Statements read

Statement of record: `cycles/cycle-4/stage6/SYNTHESIS.md`. I read EST-1, EST-2, EST-3, EST-13, C4-LA1, R-2, R-3, R-4,
Registrations items 1 and 6, the headline scope notes, and the progress ruling. Origins:

- **CT-1 and its proof:** `cycles/cycle-4/stage4/critics/F2/T/CRITIQUE.md` (`## Independent re-derivation`, Theorem CT-1, and the
  mechanism-equivalence section).
- **R2′, the step-by-step verification and the distinction table:** `cycles/cycle-4/stage5/adjudicators/F/ADJUDICATION.md` (F2
  section; `## Established results` R2/R2′; the mechanism-equivalence table).
- **Registry entries** (snapshot; read at their grades, never re-proved):
  - the eligibility key `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`
    (VERIFIED, `proved_informal`);
  - GK-SIGN `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE` (VERIFIED, `proved_informal`);
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN) and its scope text;
  - (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` and FLOW⇒SIGN `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`
    (both `formally_verified`);
  - `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`, `E993-R23-LITERAL-DELETE-ONLY-HALL`,
    `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT` (all REFUTED);
  - the five-row key and E1;
  - the primary aggregate (OPEN).
- **Also read:** the controller replay `control/controller-facts/CF-REPLAY-c4c.json` (its numbers are compared below, never used
  as evidence), `SEMANTIC-CONTRACT.md` in full, and `control/C4-STAGE1-GATE.md` (rulings 30, 33, 35).

The four statements under read:

- **SR-C4-1a (EST-1, CT-1).** For every `k ≥ 1`, every `F ⊆ leafSet(G_k)` and `p = k+3`, there is a saturating integral flow on
  (D) arcs only.
- **SR-C4-1b (EST-2, R2′).** The same holds at every `p ≥ k+3`.
- **SR-C4-1c (EST-3).** With the eligibility key, (HALL) holds at every `(G_k, k+3)`, `k ≥ 3`. This includes the GK-SIGN note
  `S(G_k, p) ≤ 0` for `p ≥ k+3`, and it excludes "every eligible rank".
- **SR-C4-1d.** The name `E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET`, and
  its alias and distinction rows.

## Independent re-derivation

### A. The proof, re-derived from the frozen definitions

I use `w_F(B) = #{v ∈ F ∩ B : (B ∖ {v}) ∩ W_v ≠ ∅}` with `W_v = N(s_v) ∖ {v}` (SEMANTIC-CONTRACT §1.2, the definition of record).

- In `G_k`: `W_1 = {2, a_1, …, a_k}`, `W_3 = {0, 4}`, `W_4 = {0, 3}` and `W_{c_i} = {a_i}`.
- `leafSet(G_k) = {1, 3, 4, c_1, …, c_k}` for `k ≥ 1`. The degree of 0 is `k+2 ≥ 3`, and `a_i` and `b_i` have degree 2.
- The contract's gloss `(B ∖ {v}) ∩ W_v = B ∩ N(s_v)` in §1.2 and §3 is the shortcut that registered erratum R30-E-b already
  strikes (`B ∩ N(s_v)` always contains `v`). I did not use it.

**Step (0): no source contains `0`. Hypothesis `p ≥ k+3` enters here.**

- A set containing `0` omits `1`, `2` and every `a_j`, and takes at most one of `b_j, c_j` from each arm (they are adjacent).
  So it has at most `1 + |{3,4}| + k = k+3` elements.
- Sources have `p+1 ≥ k+4` elements, so no source contains `0`.
- This is used only for tags `3` and `4`. Tag `1` excludes `0` by adjacency, and tag `c_i` excludes it through `a_i ∈ B`.

**Step (1): the per-tag reduction.** Let `U_τ(j)` be the independent `j`-sets in which `τ` is active. Suppose each `φ_τ` is an
injection `U_τ(p+1) → U_τ(p)` with `φ_τ(B) = B ∖ {q}`, `q ∈ B`. Put `f(B, A) := #{τ ∈ F : τ active in B, φ_τ(B) = A}`. Then:

- `f` is integral, and it is positive only where `A = B ∖ {q}`, a (D) arc into `I_p`.
- Its row sum at `B` is `#{τ ∈ F active in B} = w_F(B)`. This is exact, because each active tag sends exactly one unit.
- Its column sum at `A` is `Σ_{τ ∈ F} #{B : φ_τ(B) = A}`. Injectivity makes each term at most 1, and the term is nonzero only if
  `A ∈ U_τ(p)`, that is, only if `τ` is active in `A`. So the column sum is at most `w_F(A)`.
- This is exactly a saturating integral flow in the sense of §1.2. The arcs are a subset of (REL), so it is also a flow of the
  (D) ∪ (S) network.
- Hypothesis `F ⊆ leafSet` enters here: tags are degree-one vertices with the stated supports.

**Step (2): the slices, re-derived.**

- **`τ = c_i`.** It is active iff `a_i ∈ B`. Then `0, b_i ∉ B`, and `S = B ∖ {a_i, c_i}` is independent in
  `G_k − {0, a_i, b_i, c_i}`, which is `{1}` (isolated) ⊔ the cherry `3–2–4` ⊔ the `k−1` other arms `= K_1 ⊔ kP_3`.
  Conversely, `{a_i, c_i} ∪ S` is independent, because `N(a_i) ∪ N(c_i) = {0, b_i}`.
- **`τ = 3` (and `4`, symmetrically).** It is active iff `0 ∈ B` or `4 ∈ B`. By (0) this forces `4 ∈ B`. So `2 ∉ B`, and
  `S = B ∖ {3, 4}` avoids `0` and `2`, which makes it independent in `G_k − {0,2,3,4} = K_1 ⊔ kP_3`, with `|S| = p−1`.
- **`τ = 1`.** Here `0 ∉ B`, and `S = B ∖ {1}` is independent in `G_k − {0,1} = (k+1)P_3`, with `|S| = p`. A `W_1`-avoiding
  independent set takes at most `{3,4}` from the cherry and at most one of `b_j, c_j` from each arm, so it has at most `k+2`
  elements. Since `p ≥ k+3`, every such `S` meets `W_1`.
- In every case the map `B ↦ S` is injective (the fixed part is constant), and `|S|` is `p−1` or `p`.

**Step (3): the symmetric chain decomposition, constructed here and not cited.**

- The face poset of the independence complex of a disjoint union is the product of the factors' posets, ranked by size.
- `K_1 = {u}` has one chain, `∅ < {u}`, with centre 1/2.
- `P_3 = x–y–z` has faces `∅, x, y, z, xz`. Its chains are `∅ < {x} < {x,z}`, `{y}` and `{z}`: saturated, and each centred at 1.
- **Two chains of any lengths.** For `[0..m] × [0..n]` put `L_i = {(s,i) : 0 ≤ s ≤ m−i} ∪ {(m−i, t) : i < t ≤ n}`, for
  `0 ≤ i ≤ min(m,n)`.
  - `L_i` is a saturated chain from rank `i` to rank `m+n−i`, symmetric about `(m+n)/2`.
  - **Partition.** If `t ≤ m−s`, then `(s,t)` lies in `L_t`, which is valid since `t ≤ min(m,n)`. Otherwise put `i = m−s`. Then
    `0 ≤ i < t ≤ n` and `i ≤ m`, so `(s,t) = (m−i, t)` lies in `L_i`.
  - **Uniqueness.** The first part of `L_i` needs `t = i`. The second part needs `s = m−i` with `t > i`, which means `t > m−s`.
    These two conditions are exclusive.
  - The rule never uses `m = n`, so it covers chains of different lengths.
- **Iteration.** Suppose a partial product `P` has chains symmetric about `c_P`. For a chain `C` (rank `a..a+m`, with
  `a + m/2 = c_P`) and a factor chain `D` (rank `b..b+n`, with `b + n/2 = c_Q`), the chains of the split of `C × D` run from rank
  `a+b+i` to rank `a+b+m+n−i`, which is symmetric about `c_P + c_Q`.
  - Each step moves one coordinate one step along its own chain, which is a single-vertex addition. So every chain is saturated
    by single additions.
  - The centres are `k + 1/2` for `K_1 ⊔ kP_3` (total rank `2k+1`) and `k+1` for `(k+1)P_3` (total rank `2k+2`).

**Step (4): the down-maps. Hypothesis `p ≥ k+3` enters again for tag `1`.**

- **Not a chain bottom.** Take an element at rank `ℓ` with `2ℓ > R`, where `R` is the total rank. Its chain runs from `j` to
  `R−j` with `j ≤ ℓ ≤ R−j`, so `j ≤ R−ℓ < ℓ`, and the element is not the bottom.
  - The ranks used are `ℓ = p−1 ≥ k+2` for `c_i, 3, 4` (`R = 2k+1`) and `ℓ = p ≥ k+3` for `1` (`R = 2k+2`).
  - For `c_i, 3, 4` the centre condition alone needs only `p ≥ k+2`. Step (0) is what needs `p ≥ k+3`.
- **The map.** `φ_τ(B) := fixed ∪ pred(S)` deletes one vertex of `S`, never a vertex of the fixed part. It is injective because
  chains are disjoint and the predecessor map is injective on each chain.
- **Activity for `c_i, 3, 4`.** The fixed part contains both the tag and its witness (`a_i`, or `4`, or `3`), so the tag stays
  active.
- **Activity for tag `1`, when `p−1 = k+2`.** With the cherry chains `∅ < {3} < {3,4}`, `{2}`, `{4}` and the arm chains
  `∅ < {a} < {a,c}`, `{b}`, `{c}`:
  - a `W_1`-avoiding set of size `k+2` is `{3,4}` plus one of `b_j, c_j` for each arm;
  - each of its coordinates is the top of its factor chain;
  - by induction over the iteration, the maximum of a box `C_1 × … × C_r` is the top of that box's `L_0` chain (`(m,n)` is the top
    of `L_0` in `[0..m] × [0..n]`), so the set is a chain top;
  - a chain top is never a predecessor.
- **Activity for tag `1`, when `p−1 ≥ k+3`.** Every set of that size meets `W_1`.
- So `φ_1` lands in `U_1(p)`.

**Conclusion.** Steps (0)–(4) prove CT-1 at `p = k+3`. The same steps, with the rank bounds above, prove it at every `p ≥ k+3`
(R2′). Where `I_{p+1} = ∅`, that is at `p ≥ α = 2k+3`, both the construction and the zero flow are vacuous.

- **Hypotheses and where they enter.**
  - The explicit adjacency and finiteness: steps (0) and (2).
  - `F ⊆ leafSet`: step (1).
  - `p ≥ k+3`: step (0), used for tags 3 and 4, and step (4), used for tag 1's image activity.
  - `k ≥ 1`: not load-bearing. At `k = 0`, `α(G_0) = 3` and every layer used is empty.
- **Not consumed.** `IsTree`, eligibility, `x(G_k)`, `α(G_k)`, any quotient or lift, and any census value.
- **ℕ-subtraction.**
  - The critic's "bottoms out at rank `≤ 2k+1−(k+2) = k−1`" is a truncated subtraction when `k = 0`. The inequality form
    `j ≤ R − ℓ < ℓ`, guarded by `2ℓ > R`, is the safe form (advice for C4-LA1's N5).
  - `p − 1` appears in the `S` summand. It is guarded by `p ≥ k+3 ≥ 3`, which also gives FLOW⇒SIGN's `p ≥ 1`.

### B. Own instruments (`scratchpad/c4-sr-SR-C4-1/`; `python3 -B`, standard library, exact integers)

**`gkcore.py`.** This is my own code throughout:

- the labelling: arm `i` is `a = 5+3i`, `b = 6+3i`, `c = 7+3i`;
- a tree test (edge count plus BFS);
- recursive enumeration of independent sets on the original carrier with deleted sets;
- `x` through `α` inclusive;
- `F_p` derived leaf by leaf from `Δ_p(G − v) < 0`;
- `S` from the literal `H_v = {v, s_v}` and `R_v = N[s_v]` deletion counts;
- the literal `w_F`, and literal (D) and (S) arcs;
- a Dinic max-flow.

**`brute_network.py` and `brute_extra.py`.** Literal networks, `F = F_p` derived. On every run, `supply − capacity = S` is asserted
from the independent sides (network weights against `H_v/R_v` counts).

| `k` | `p` | `n` | `α` | `x` | elig | `F_p` | `i_{p+1}` | `i_p` | supply | capacity | `S` | max-flow (D) | max-flow (D)∪(S) | every tag set, (D) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 4 | 8 | 5 | 3 | no | 4/4 | 1 | 9 | 4 | 20 | −16 | 4 | 4 | 16/16 |
| 2 | 5 | 11 | 7 | 3 | no | 5/5 | 10 | 43 | 37 | 102 | −65 | 37 | 37 | 32/32 |
| 3 | 6 | 14 | 9 | 4 | yes | 6/6 | 70 | 210 | 253 | 527 | −274 | 253 | 253 | 64/64 |
| 4 | 7 | 17 | 11 | 5 | yes | 7/7 | 425 | 1031 | 1542 | 2735 | −1193 | 1542 | 1542 | 128/128 |
| 5 | 8 | 20 | 13 | 6 | yes | 8/8 | 2400 | 5060 | 8875 | 14196 | −5321 | 8875 | 8875 | 256/256 |
| 6 | 9 | 23 | 15 | 7 | yes | 9/9 | 12999 | 24795 | 49422 | 73573 | −24151 | 49422 | 49422 | — |
| 1 | 5 | 8 | 5 | 3 | no | 0/4 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 16/16 |
| 1 | 6 | 8 | 5 | 3 | no | 0/4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 16/16 |
| 2 | 6 | 11 | 7 | 3 | no | 5/5 | 1 | 10 | 5 | 37 | −32 | 5 | 5 | 32/32 |
| 2 | 7 | 11 | 7 | 3 | no | 0/5 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 32/32 |
| 3 | 7 | 14 | 9 | 4 | no | 6/6 | 13 | 70 | 62 | 253 | −191 | 62 | 62 | 64/64 |
| 3 | 8 | 14 | 9 | 4 | no | 6/6 | 1 | 13 | 6 | 62 | −56 | 6 | 6 | 64/64 |
| 4 | 8 | 17 | 11 | 5 | no | 7/7 | 110 | 425 | 515 | 1542 | −1027 | 515 | 515 | 128/128 |
| 4 | 9 | 17 | 11 | 5 | no | 7/7 | 16 | 110 | 93 | 515 | −422 | 93 | 93 | 128/128 |
| 5 | 9 | 20 | 13 | 6 | no | 8/8 | 771 | 2400 | 3605 | 8875 | −5270 | 3605 | 3605 | — |
| 5 | 10 | 20 | 13 | 6 | no | 8/8 | 159 | 771 | 911 | 3605 | −2694 | 911 | 911 | — |
| 6 | 10 | 23 | 15 | 7 | yes | 9/9 | 4872 | 12999 | 23001 | 49422 | −26421 | 23001 | 23001 | — |

**What the table shows.**

- **Every run saturates under (D) alone.** In the last column, "16/16" means all 16 tag sets saturate and WID was asserted on each.
  `G_5/8` (all 256 tag sets) is from `brute_extra.py`.
- **Agreement with CF-REPLAY-c4c.** The rows `k = 3, 4, 5` equal the replay exactly: `n`, `α`, `x`, sources, targets,
  supply/capacity/`S`, both max-flows, and 0 failures over 64 and 128 tag sets.
- **Agreement with the GK-SIGN face.** `S` at `k = 1..5`, `p = k+3`, equals `−16, −65, −274, −1193, −5321`.
- **`G_6/10`** is the first eligible rank above `k+3`, covered by R2′ only.
- **Negative control.** On `CB(4,1)/4` my instrument gives 60/60/0, deletion-only 52 and mixed 60, which equals the registered
  record. So the max-flow does detect a deletion deficit.
- **Outside the theorem.** Every tag set at `p = k+2`, `k ≤ 4`, also saturates under (D). This is informational only.

**`scd_construct.py`: the construction itself, checked literally.**

- **Chain decomposition.** It builds the iterated two-chain split in MY factor order (arms, then cherry, then `K_1`), which is not
  the critic's text order. For every `k = 0..7` it verifies: a partition of each slice poset (enumerated independently from
  `G_k`), saturation by single additions, symmetry (bottom + top = total rank), and the tag-1 box-top property. That is,
  `2^k` `W_1`-avoiding sets at size `k+2`, all of them chain tops.
- **The maps.** For every `k = 0..7` and every `p` from `k+3` through the first empty layer, and every tag and every active source:
  - `0 ∉ B`;
  - the slice shape holds;
  - `pred(S)` is defined;
  - the image is a single deletion into `I_p`, with the tag active;
  - `φ_τ` is injective.
- **The flow.** The flow `f` is certified arc by arc: every tag set for `k ≤ 4`, and `F` = all leaves and `F = F_p` for
  `k = 5..7`. There are 0 errors in all 49 `(k, p)` rows.
- **Units sent.** At `p = k+3` with `F` = all leaves, the units sent are 4, 37, 253, 1542, 8875, 49422, 269507 (`k = 1..7`),
  which is the supply.

**`alt_order_probe.py`: is the tag-1 chain choice load-bearing?**

- Put the cherry factor first and use the other valid `P_3` decomposition for the arms (`∅ < {c} < {a,c}`, `{a}`, `{b}`). Then
  `2^k − 1` `W_1`-avoiding sets at size `k+2` are NOT chain tops (`k = 1..6`: 1, 3, 7, 15, 31, 63), so tag-1 units would land
  where tag 1 is inactive.
- With the critic's choice there are 0 such sets in either factor order.
- In my arms-first order the alternative choice happens to work too. The box-maximum criterion is sufficient, not necessary.
- So the proof's explicit chain choice is load-bearing, and the proof states it correctly.

**`gk_params.py`** (bounded; never proof). My closed form `I(G_k)` equals brute force for `k = 0..7`. For `k = 1..120`:
`α = 2k+3`; `x = k+1` for `k ≥ 2`, and `x(G_1) = 3`; the first non-empty window is at `k = 3`; the window is
`[k+3, ⌊(4k+6)/3⌋]` for every `k ≥ 3`; and every eligible rank lies in the unresolved band for every `k ≥ 4`.

- **The band claim holds in general, not just to 120.** At `k = 4, 5` the window is `{k+3}`, and `2(k+3)+3 ≤ 3k+5` iff `k ≥ 4`.
  For `k ≥ 6`, `⌊(4k+6)/3⌋ ≤ (3k+2)/2`. And `n ≤ 4p−8` holds for all `p ≥ k+3`.

**`alias_check.py`.** Every alias (substring, then word-bounded and case-sensitive) and every `alias_pattern` of all 448 claims is
run against every block of my registration text, and the proposed and fallback names are checked lexically against every key.
Results in `## Findings and repairs`.

## Findings and repairs

**F-1. CT-1 is correct as stated, and its proof is complete.**

- Every step (0)–(4) re-derives from the contract definitions.
- The two-chain split is constructed with a partition proof that covers chains of different lengths.
- Every level used lies strictly above its centre.
- The deleted vertex is never in the fixed part, so it is never the tag or its (3, 4, `c_i`) witness.
- Tag 1's activity is secured by the box-top argument at image level `k+2`, and by counting at levels `≥ k+3`.
- Injectivity per tag makes the column sums at most `w_F(A)`, because each tag lands on `A` at most once and only when active
  there.
- **No repair.**

**F-2. R2′ is correct.** The centre condition holds for every `p ≥ k+3`: `p−1 ≥ k+2 > k + 1/2`, and `p ≥ k+3 > k+1`. Step (0)
holds for every `p+1 ≥ k+4`. For tag 1, the image level is `k+2` (box-top) or `≥ k+3` (counting). **No repair.**

**F-3. The composition EST-3 is correct.**

- `G_k` is a finite ordinary tree (`3k+4` edges on `3k+5` vertices, connected through 0). This is elementary, and it is used only
  to place `(G_k, p)` inside (HALL)'s domain, not in the flow theorem.
- `F_p(G_k) ⊆ leafSet` holds by definition.
- The registered eligibility key gives eligibility at `k+3` for `k ≥ 3`.
- The weakest registered input is that key (`proved_informal`). The flow key enters at `proved_informal` on this read. The result
  is `proved_informal`.
- "Every eligible rank of `G_k`" is NOT claimed; it needs `x(G_k) ≥ k+1`, which is open.
- The GK-SIGN note follows: the flow gives weighted Hall at `F = F_p` (`Σ_X w = Σ_{B∈X} Σ_A f ≤ Σ_{N(X)} w`), and the FLOW⇒SIGN key
  (`formally_verified`, with `p ≥ 1`) gives `S(G_k, p) ≤ 0`.
- **Repairs to the synthesis's scope-note wording.**
  - (i) The primary-aggregate note's "At the other eligible ranks of `G_k` it is new" could be read to include eligible ranks
    below `k+3`, which are not covered. It is repaired to "eligible ranks `p ≥ k+4`, which exist exactly for `k ≥ 6`; ranks below
    `k+3` are not covered".
  - (ii) The (HALL) note adds the band fact for every eligible rank `≥ k+3`, and names the exact superseded words of the
    `[r30 C3; SR-C3-2; G_k whole layer]` clause.
  - (iii) The registry texts cite the r30 awards by key name, not as the bare tokens "C1-LA1" and "C1-LA2". Those tokens are
    registered aliases of two r25 keys (`E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`,
    `E993-R25-PERFECT-MATCHING-EVEN-EXCESS-SIGN`), so a lint would mis-attribute them.
  - (iv) `⌊(4k+6)/3⌋` is written `floor(2(2k+3)/3)` in registry text, because the literal token `4k` matches the alias pattern
    of `E993-R27-FOREST-DESCENT-LINEAR-BOUND`.
  - None of these changes any mathematics.

**F-4. The key name is a predicate (ruling 33).**

- Read without hypotheses, it says: on the `G_k` tree, a deletion-arc-supported saturating flow exists at every rank `≥ k+3` for
  every leaf tag set. That is exactly the statement. At ranks with empty source layers it is true through the zero flow.
- It asserts nothing about eligibility, `IsTree` content beyond the family name, (HALL), or the sign.
- R2′ holds, so the fallback name is not needed.
- **Lexical check.** No exact, substring or near (token-Jaccard ≥ 0.6) collision among the 448 keys. The nearest keys are GK-SIGN
  (0.364) and the eligibility key (0.357), which share only the family and rank tokens.
- **Alias check of every block.** There are 0 hits on any REFUTED key's aliases or patterns, and 0 on any OPEN key's pattern. The
  remaining hits are all benign:
  - deliberate references to the key being cited (WID and FLOW⇒SIGN by name; `(WID)`);
  - the standard fence phrase "TREE, FOREST, TRANSFER", worded as in GK-SIGN's registered scope;
  - substring-only artefacts: `TREE` inside `GK-TREE` or inside key names, which the two registered `GK-TREE` keys already carry
    and lint clean; and `AdjU` inside "adjudicator".
- The phrase "favorable-leaf aggregate" is absent (the `E993-BETA-AGG` pattern gives 0 hits).
- The ALIASES line carries names only: no `:` and no `[` (ruling 35).

**F-5. Distinction from `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` (REFUTED), stated precisely.**

- Under the (WID) bijection `B ↦ B ∖ {v}`, `U_v(p+1)` is the set of marked (`W_v`-meeting) `p`-sets of `H_v`, and `U_v(p)` is the
  set of marked `(p−1)`-sets. `φ_v` picks, injectively, one single deletion that stays marked.
- So `φ_v` is a matching that saturates the marked `p`-sets, inside the support of `d_p`. Linear injectivity of `d_p` implies such a
  matching; the converse fails (`[[1,1],[1,1]]`).
- The flow key is on one family and asserts nothing about `rank d_p`. **No revival.**
- Consistent with scope remark (i): the per-tag injection gives `q_v(p) ≤ q_v(p−1)`, which GK-SIGN's per-leaf negativity confirms
  independently.

**F-6. Registry data defect, for the controller; not a statement of this read.**

- GK-SIGN's `aliases` field is the literal list `["none"]`. As an alias string, "none" matches any text containing "none", such as
  "nonempty" or "nonnegative".
- The eligibility key's `aliases` holds one alias split at a comma into two elements:
  `"E993-R30-GK-TREE-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO (synthesis proposal"` and
  `"renamed by SR-C2-4)"`.
- The five-row key and E1 show the same split pattern.
- I recommend that the controller repair these at the close. I edited nothing.

**F-7. Advice for C4-LA1's fidelity review (not a verdict item).**

- The drafted terminal theorem quantifies over every `k : ℕ`, including `k = 0`. It is still true there, vacuously
  (`α(G_0) = 3 < p+1`), so the formal scope is a harmless superset of EST-1/EST-2's `k ≥ 1`.
- N5 should state the level condition as `2ℓ > R` rather than through truncated `R − ℓ`.
- N5 must fix, for tag 1, the arm chain `∅ < {a} < {a,c}` and the cherry chain through `{3}` or `{4}` up to `{3,4}` (see the probe).

**F-8. Nothing in this read uses a census value, the controller's prior, a frozen record's numbers as evidence, (LIFT), the
equitable lift, or `D, C ≥ 0`.** No closed region is re-proved, and no status is transferred across a fence.

## Registration text

Each block below is for verbatim registration on this read, in order: the KEY block, four SCOPE NOTEs, seven DISTINCTION ROWs
and one RECORD. The fallback name `E993-R30-GK-TREE-RANK-K-PLUS-3-DELETION-ARC-SATURATING-FLOW-FOR-EVERY-LEAF-TAG-SET` is NOT to be
used, because R2′ is confirmed. If the governed award C4-LA1 closes at exactly this scope, the controller may change `GRADE:` to
`formally_verified` and add the award receipt to the attribution. Nothing else changes.

```text
KEY: E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: For k >= 1 let G_k be the tree on vertices 0, 1, 2, 3, 4 and a_i, b_i, c_i (1 <= i <= k) with edges 0-1, 0-2, 2-3, 2-4, 0-a_i, a_i-b_i, b_i-c_i (n = 3k+5; leafSet(G_k) = {1, 3, 4, c_1, ..., c_k}, original supports 0, 2, 2, b_i). For every k >= 1, every natural p >= k+3 and every F ⊆ leafSet(G_k), the transport network of SEMANTIC-CONTRACT §1.2 on G_k at rank p (sources I_{p+1}(G_k) with supply w_F(B), targets I_p(G_k) with capacity w_F(A), w_F(B) = #{v in F ∩ B : (B \ {v}) ∩ W_v ≠ ∅}, W_v = N(s_v) \ {v}) has an integral flow f with f(B, A) > 0 only if A = B \ {q} for some q in B, Σ_A f(B, A) = w_F(B) for every source B and Σ_B f(B, A) <= w_F(A) for every target A; when I_{p+1}(G_k) is empty the zero flow is such a flow. Consequently (HALL-COND) holds at (G_k, p, F) for every X ⊆ I_{p+1}(G_k) with N(X) taken along deletion arcs alone, and a fortiori along (D) ∪ (S). Proof on the face. (0) An independent set containing 0 omits 1, 2 and every a_j and takes at most one of b_j, c_j per arm, so it has at most k+3 elements; no source (p+1 >= k+4 elements) contains 0. (1) For a tag t let U_t(j) be the independent j-sets in which t is active. If every t in F has an injective map phi_t from U_t(p+1) to U_t(p) with phi_t(B) = B \ {q} for some q in B, then f(B, A) := #{t in F : t active in B, phi_t(B) = A} is such a flow: its row sum at B counts the tags of F active in B, which is w_F(B); at a target A each t contributes at most one unit (injectivity) and only if t is active in A (the codomain), so the column sum is at most w_F(A). (2) Slices. t = c_i is active iff a_i is in B, and then B = {a_i, c_i} ⊔ S with S independent in G_k − {0, a_i, b_i, c_i} = K_1 ⊔ kP_3. t = 3 (resp. 4) is active iff 0 or 4 (resp. 3) is in B, so by (0) B = {3, 4} ⊔ S with S independent in G_k − {0, 2, 3, 4} = K_1 ⊔ kP_3. t = 1 is active iff B meets W_1 = {2, a_1, ..., a_k}; B = {1} ⊔ S with S independent in G_k − {0, 1} = (k+1)P_3 and |S| = p; an independent set of (k+1)P_3 avoiding W_1 has at most k+2 elements, so every such S meets W_1. (3) The independent sets of a disjoint union, ordered by inclusion and graded by size, form the product of the factors' posets. K_1 = {u} has the chain ∅ < {u}; P_3 = x–y–z has the chains ∅ < {x} < {x, z}, {y}, {z}. A product of chains [0..m] × [0..n] (any m, n) is partitioned into the saturated chains L_i = {(s, i) : 0 <= s <= m − i} ∪ {(m − i, t) : i < t <= n}, 0 <= i <= min(m, n), from rank i to rank m + n − i ((s, t) lies in L_t if t <= m − s and in L_{m−s} otherwise). Iterating over the factors partitions each slice poset into chains saturated by single-vertex additions and symmetric about its centre, k + 1/2 for K_1 ⊔ kP_3 and k + 1 for (k+1)P_3. (4) phi_t keeps the fixed part ({a_i, c_i}, {3, 4} or {1}) and sends S to its predecessor in its chain. An element strictly above the centre is never a chain bottom; the ranks used are p − 1 >= k+2 (tags c_i, 3, 4) and p >= k+3 (tag 1), both strictly above the centre, so phi_t is defined, is a single deletion of a vertex outside the fixed part, and is injective (disjoint chains). For c_i, 3, 4 the fixed part contains the tag and its witness, so t stays active. For tag 1 take the cherry 3–2–4 chains ∅ < {3} < {3, 4}, {2}, {4} and the arm chains ∅ < {a_j} < {a_j, c_j}, {b_j}, {c_j}: if p − 1 = k+2, a set of size k+2 avoiding W_1 is {3, 4} with one of b_j, c_j per arm, every coordinate the top of its factor chain, hence the maximum of its box and the top of its chain, hence never a predecessor; if p − 1 >= k+3 every set of that size meets W_1. So tag 1 is active in every image.
SCOPE: One explicit tree family, every k >= 1 (the statement also holds at k = 0, vacuously: alpha(G_0) = 3, so I_{p+1}(G_0) is empty for p >= 3), every rank p >= k+3 whether eligible or not, every leaf tag set F (in particular F = F_p(G_k)). Hypotheses consumed: the explicit adjacency of G_k and finiteness (steps 0 and 2), F ⊆ leafSet(G_k) (step 1: tags are degree-one vertices with the stated supports), p >= k+3 (step 0 for tags 3 and 4; step 4 for tag 1, whose images must meet W_1). Not consumed: IsTree, eligibility, x(G_k), alpha(G_k), any orbit quotient or lift, any census value. The explicit chain choice for tag 1 is load-bearing (with the arm chain ∅ < {c_j} < {a_j, c_j} and the cherry factor first, 2^k − 1 sets avoiding W_1 at size k+2 are not chain tops, k = 1..6, SR-C4-1 probe). Scope limit of the method: an injective per-tag map by single deletions forces q_t(p) <= q_t(p − 1) for every t in F, so it cannot reach a row with a positive per-leaf summand or a family whose deletion neighbourhood is deficient.
ATTRIBUTION: CT-1 (rank p = k+3) and its proof, critic C-F2-T, r30 Cycle 4 (Claude Opus 5.5); rank extension R2′ (every p >= k+3), the r30 Cycle 4 F adjudicator (Claude Opus 5.5), with step-by-step verification and an independent instrument; controller replay CF-REPLAY-c4c (Claude Fable 5.1); r30 Cycle 4 Stage 6 synthesis (Claude Opus 5.5); isolated second read SR-C4-1 (Claude Opus 5.5). Bounded G_k Hall record, F2 (Claude Sonnet 5), C-F2-T and C-F2-U. The family G_k, r30 Cycle 1 C-F2-T (construction) and the G_k key (Cycle 2). The transport network, the active-tag weight and the relation, Codex (GPT-6 Astra/Sol/Luna), lower-region run; definitions of record, the first-interior run (Codex), entries 1-18, on the r26/r24/r25 layers; (WID) E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY. The two-chain split is the classical de Bruijn–Tengbergen–Kruyswijk decomposition, written out on the face.
FENCES: One family; not (HALL) at any other scope, and E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. The statement carries no IsTree, eligibility, crossing-index or independence-number content; the (HALL) and sign consequences are scope notes composed with the G_k key and E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE. It does not assert (HALL) at every eligible rank of G_k (that needs x(G_k) >= k+1, open; bounded only). It is a per-tag deletion matching on one family, not linear injectivity of any down-map (E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY stays REFUTED) and not delete-only Hall on trees (E993-R23-LITERAL-DELETE-ONLY-HALL stays REFUTED). No claim that switch arcs are unnecessary on any other tree. No status change to E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993. No RTree wording; no closed region re-proved; the bounded rows are corroboration, never proof. Grade formally_verified only if the governed award C4-LA1 closes at exactly this scope (the controller decides); it does not formally verify E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE.
ALIASES: r30 C4 Theorem CT-1, r30 C4 rank extension R2′ of CT-1, C4-LA1 terminal theorem gk_deletionSaturatingFlow_of_rank_ge
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: [r30 C4; SR-C4-1; G_k flow] On the explicit family G_k, (HALL) holds at (G_k, p) for every k >= 3 and every p >= k+3 at which (G_k, p) is eligible, with deletion arcs alone: apply E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET at F = F_p(G_k) ⊆ leafSet(G_k); G_k is a finite ordinary tree (3k+4 edges on 3k+5 vertices, every vertex joined to 0). By E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO (proved_informal) the rank p = k+3 is eligible for every k >= 3, so (HALL) holds on the infinite eligible family {(G_k, k+3) : k >= 3}. k = 3 (n = 14 = 2p+2) lies in the closed band; for k >= 4 every eligible rank p >= k+3 of G_k lies in the unresolved band 2p+3 <= n <= 4p−8 (elementary: the window top floor(2(2k+3)/3) is k+3 at k = 4, 5 and at most (3k+2)/2 for k >= 6). Grade proved_informal (inputs: the flow key and the G_k key, both proved_informal; the tree property is elementary). (HALL) holds at every eligible rank of G_k if x(G_k) >= k+1, which is not proved (bounded: x(G_k) = k+1 for 2 <= k <= 400; x(G_1) = 3). This supersedes, in kind, the bounded G_k rows (every-X (HALL-COND) at k+3 for k <= 60 under (D), k <= 30 under (D) ∪ (S)) and the words 'a saturating flow on G_k for general k, and hence (HALL) on G_k' in the 'Not established' sentence of the [r30 C3; SR-C3-2; G_k whole layer] clause. (HALL) stays OPEN at full scope; nothing here is a cut; no status transfer; the primary aggregate is untouched. Attribution: C-F2-T (CT-1), the r30 Cycle 4 F adjudicator (R2′ and the composition), the Stage 6 synthesis, SR-C4-1.
```

```text
SCOPE NOTE ON: E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE
TEXT: [r30 C4; SR-C4-1] For every k >= 1 and every p >= k+3, S(G_k, p) = C5LA1.aggregate G_k p <= 0. Proof: the flow key E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET at F = F_p(G_k) gives a saturating flow f; for every X ⊆ I_{p+1}, Σ_{B in X} w_F(B) = Σ_{B in X} Σ_A f(B, A) <= Σ_{A in N(X)} w_F(A), so the weighted Hall condition holds at F = F_p(G_k); E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (formally_verified, the r30 Cycle 1 award for FLOW-to-SIGN; its guard p >= 1 follows from p >= k+3) gives S(G_k, p) <= 0. Grade proved_informal. At p = k+3 it is weaker than this key's S(G_k, k+3) < −2. At p >= k+4 it is new; the eligible ranks among them are k+4 <= p <= floor(2(2k+3)/3), which exist exactly for k >= 6. Not strict. This key's statement, grade and fences are unchanged; no status change to any aggregate key. Attribution: the r30 Cycle 4 F adjudicator (composition), the Stage 6 synthesis, SR-C4-1; E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE.
```

```text
SCOPE NOTE ON: E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO
TEXT: [r30 C4; SR-C4-1] Every-X (HALL-COND) at rank k+3, and hence (HALL) at (G_k, k+3), holds for every k >= 3 with deletion arcs alone: E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET composed with this key's eligibility clause (proved_informal). The bounded G_k Hall rows (k <= 60 under (D), k <= 30 under (D) ∪ (S)) are superseded in kind. This key's statement, grade and fences are unchanged; A_k is still the unique target with no in-arc, and the flow key needs no in-arc of A_k because a flow may leave any target unused.
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE
TEXT: [r30 C4; SR-C4-1] Restricted consequence on one family, no status change: S(G_k, p) <= 0 for every k >= 1 and every p >= k+3 (the G_k flow key with E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE; proved_informal), hence at every eligible rank p >= k+3 of every G_k. Eligible ranks of G_k below k+3 would exist only if x(G_k) <= k, which no registered statement excludes (bounded: x(G_k) = k+1 for 2 <= k <= 400); they are not covered. Status OPEN, unchanged; the key moves only by its own certificate.
```

```text
DISTINCTION ROW: DR-SR-C4-1-01
KEY: E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY
TEXT: REFUTED key: for every eligible ordinary tree and every favorable leaf v, the rational linear map d_p on marked independent p-sets of H_v (sum of the one-vertex deletions still meeting W_v) is injective. Under the (WID) bijection B -> B \ {v}, the flow key's per-tag map phi_v is an injective selection of one such deletion per marked set, that is a matching saturating the marked p-sets inside the support of d_p, on the one family G_k. Linear injectivity of d_p implies such a matching (a nonzero maximal minor has a nonzero permutation term); a matching does not imply linear injectivity (the 0/1 matrix [[1, 1], [1, 1]] has a perfect matching and is singular). The flow key asserts nothing about the rank of d_p on G_k or elsewhere. Different object, restricted scope, weaker per-tag content; no revival.
```

```text
DISTINCTION ROW: DR-SR-C4-1-02
KEY: E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO
TEXT: The G_k key asserts eligibility of (G_k, k+3) for k >= 3, {3, 4} ⊆ F_p, the unique no-in-arc target A_k of weight 2 and the gap identity; it asserts no flow and no Hall inequality below X = I_{p+1}. The flow key asserts a deletion-supported saturating flow, hence (HALL-COND) for every X, at every p >= k+3 and every leaf tag set, and asserts no eligibility. Composed, they give the (HALL) scope note. Lexically distinct: the names share only the family and rank tokens (E993-R30-GK-TREE, RANK-K-PLUS-3), token-Jaccard 0.357.
```

```text
DISTINCTION ROW: DR-SR-C4-1-03
KEY: E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE
TEXT: GK-SIGN is an exact sign theorem at one rank, S(G_k, k+3) = −g(k+1) − 2^k − (k+2)A(k) < −2, with every per-leaf summand strictly negative. The flow key is a transport statement at every rank p >= k+3 for every leaf tag set; it implies only S(G_k, p) <= 0 (scope note on GK-SIGN), not strict and not the closed form, and GK-SIGN does not imply the flow key (a sign is the whole-layer condition at X = I_{p+1} only). Neither is an alias of the other.
```

```text
DISTINCTION ROW: DR-SR-C4-1-04
KEY: E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK
TEXT: The five-row key is a computer_assisted statement on five finite CB(d,m) rows (non-sector (HALL-COND) at 177 ranks; deletion-only saturation at 340 ranks above the first), certified through the mark-clone criterion. The flow key is a parameter-uniform proof on the G_k family, which contains no CB(d,m) tree. The shared words DELETION-ARC name the same arc class (D); the families, grades and certificates differ.
```

```text
DISTINCTION ROW: DR-SR-C4-1-05
KEY: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: E1 is a numerical criterion at a rank of CB(d,m) implying (HALL-COND) for non-sector families by a fractional deletion flow with loads rho_q; it says nothing about G_k. The flow key uses no criterion, is integral, serves every family including every sector-type family of G_k, and holds for every leaf tag set.
```

```text
DISTINCTION ROW: DR-SR-C4-1-06
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: REFUTED key: universal unweighted delete-only Hall |X| <= |Gamma_Delete(X)| on every ordinary tree under the r23 literal contract. The flow key is weighted by the active-tag weight at a fixed leaf tag set, restricted to one family, and proved there; it is a sufficiency on G_k, not a universal claim. No revival.
```

```text
DISTINCTION ROW: DR-SR-C4-1-07
KEY: E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT
TEXT: REFUTED key: a support-label-preserving unit-token injection from positive to negative favorable-leaf tokens on governed base-rank rows. The flow key moves active-tag units between independent sets along single deletions; it has no token sign split and no support-label constraint. Different object; no revival.
```

```text
RECORD: R30-SR-C4-1-GK-FLOW-INSTRUMENT
CLAIM: SR-C4-1 own instruments (standard library, exact integers). Literal (D)-only and (D) ∪ (S) max-flow (Dinic) on G_k with F = F_p derived, supply − capacity = S asserted against the literal H_v / R_v aggregate on every run: p = k+3 for k = 1..6, p = k+4, k+5 for k = 1..5, plus G_6 at p = 10; every one of the 2^(k+3) leaf tag sets at those ranks for k = 1..4 and at G_5/8; all saturate under (D) alone; k = 3, 4, 5 equal CF-REPLAY-c4c exactly (253/527/−274, 1542/2735/−1193, 8875/14196/−5321; sources 70/425/2400, targets 210/1031/5060); G_6/9 49422/73573/−24151; G_6/10 23001/49422/−26421. Negative control CB(4,1)/4: 60/60/0, deletion-only 52, mixed 60. Own construction (iterated two-chain split, own factor order): partition, saturation, symmetry and the tag-1 box-top property verified for k = 0..7; phi_t defined, single-deletion, activity-preserving and injective at every p >= k+3 through the empty layer for k = 0..7; flow certificate arc by arc for every leaf tag set (k <= 4) or for F = all leaves and F = F_p (k = 5..7); 0 errors.
STATUS: bounded_computation
PROVENANCE: second-reads/SR-C4-1/SECOND-READ.md; scratchpad/c4-sr-SR-C4-1/ (brute_network.py, brute_extra.py, scd_construct.py, alt_order_probe.py, gk_params.py and their outputs)
```

## Verdicts

verdict[SR-C4-1a]: confirmed
verdict[SR-C4-1b]: confirmed
verdict[SR-C4-1c]: confirmed_with_repairs
verdict[SR-C4-1d]: confirmed

- **SR-C4-1a** (EST-1, Theorem CT-1 at `p = k+3`): **confirmed**, with no repair. This read is decisive for C4 gate ruling 30
  letter (a): **CT-1 at `p = k + 3` is confirmed.**
- **SR-C4-1b** (EST-2, R2′ at every `p ≥ k+3`): **confirmed**, with no repair. The fallback name is not needed.
- **SR-C4-1c** (EST-3, the composition, and the GK-SIGN note): **confirmed_with_repairs**. The mathematics is unchanged. The
  repairs are to scope-note wording only (F-3 (i)–(iv)), and the exact repaired texts are the SCOPE NOTE blocks above.
- **SR-C4-1d** (the key name, alias check and distinction rows): **confirmed**. The name is a predicate of the statement,
  there is no lexical or alias collision, and the distinction rows are as above.

## Artifact inventory

- **Output (this file):** `second-reads/SR-C4-1/SECOND-READ.md`. Its SHA-256 is reported in the final message, since a file
  cannot carry its own digest.
- **Scratch:** `scratchpad/c4-sr-SR-C4-1/` (absolute:
  `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-sr-SR-C4-1/`). SHA-256 digests,
  computed at assembly:

| File | SHA-256 | Bytes |
|---|---|---|
| `alias_check.py` | `b763bdf53574bcd6f91101189f1aa90dec00f3ba8276383ac10d35d358866750` | 3361 |
| `alias_check_out.json` | `0b6d70ce5db94b809e81f46370db1ff1ac6d3a93b14a1724a5e297ec895a0e2d` | 4153 |
| `alt_order_probe.py` | `d62079dd4172ab9b2932d1ca2d3aa1aa6af751aa7644d1457d936fcacd1d2ffe` | 1258 |
| `alt_order_probe_out.json` | `cc0a1a550686e3f58450684fb3ef57916390657c1190eb402d7af35d686aecc0` | 341 |
| `assemble.py` | `d1a6eb1e1b300418fd888c69e6f634659ab9ab256c1c3dad2780f06c544a0ca2` | 4781 |
| `body_pre_tail.md` | `a4e2b704632c759d2bec7b0d614d36945c7b06972e73cf1d7f375dfab05529d5` | 41438 |
| `brute_extra.py` | `435091a99f20de5b998c2bb59fa62ef54371e24f277a6d2f233ccacbd2a5b921` | 1052 |
| `brute_extra_out.json` | `040d005a4d494b217158aface686f86d30f1f06ba6feb4a1d4ad784130e74cb0` | 624 |
| `brute_network.py` | `3d34bcac8c8d42a86f18717cfed97431c433c3d2f15b413e48ac8d2bd52484d3` | 4745 |
| `brute_network_out.json` | `aa6d3bd2da794f8df858c64fd6bb7118515aba46c54ad6f3e1f7a7dc15774cbc` | 10129 |
| `brute_network_stdout.txt` | `9c79767b8bdceee36be8a153ca304ed0fac0b7a7faa4ff34c980e446e8adec6a` | 2054 |
| `gk_params.py` | `5a317184709564ee0557e2c32a2d17bafa5dcbd2d02b7eb3e287df0435ca1e3f` | 2276 |
| `gk_params_out.json` | `3dc07a222aa5a8e8343b0636ea39019c0425eaf75f51fde75ca17d7b0ab45488` | 38274 |
| `gkcore.py` | `b234c2fde8c3466eecb59afebe5dc836064cc0341dc72bd248e92a0ba945da60` | 4732 |
| `head.md` | `d62ccc27556edbca6646e8f62f25e6c0cf8e206464548f9b0a37f8806a4d2d4f` | 24360 |
| `reg_text.txt` | `eb09114c6663c3b8512d637c109c77784e348c5495d6734e35a990a9b13cabc4` | 16421 |
| `registry_extract.txt` | `27f45a6699492049c2920c201b44bccfd7ddf1a9bdcf4e3476bfd48c6bf74da9` | 24551 |
| `registry_extract2.txt` | `761f6606d8d0bf9282f5b2c66cd49c85b4dff86cc376d67cdcb3e8e66cdbaade` | 13738 |
| `scd_construct.py` | `03b016915fb84a248420ed2f03c198654bdd195fff0bc0aa370f2172aa2b7633` | 9262 |
| `scd_construct_out.json` | `e60000ffd53b9d26a224f507a1a179878b799cc9a6114cf7a0c8ae22ae17e393` | 19561 |
| `scd_construct_stdout.txt` | `aebcd1f9054a11d8fd8ce69835be53671dc7269ad9741e31eb01484f1f62398c` | 4685 |
| `seal_audit.py` | `5efe1c3a10dd0225a6afbb79c6bd2bf0117a4b261f2dc4f410eb5ad42095e37c` | 813 |

**Roles.**

- `seal_audit.py`: capsule seal and member digests.
- `gkcore.py`: shared definitions.
- `brute_network.py`, `brute_extra.py` and their outputs: the literal networks, WID, max-flows and the negative control.
- `scd_construct.py` and its outputs: the construction itself, checked literally.
- `alt_order_probe.py`: the chain-choice probe.
- `gk_params.py`: bounded parameters and windows.
- `alias_check.py`: the alias and lexical check.
- `reg_text.txt`: the checked registration text, embedded verbatim above.
- `registry_extract*.txt`: registry extracts from the capsule snapshot.
- `head.md`, `body_pre_tail.md`, `assemble.py`: assembly of this file.

**Process and read-boundary deviations (all of them).**

1. **A shell error delayed the boot-file read.** My first combined `cat` (verity.md, then startup-protocol.md) aborted after
   verity.md on a zsh `=`-expansion error. I read `identity/startup-protocol.md` only after the instrument runs; I then read it
   in full before writing this file. The first display of verity.md was truncated by the tool, so I re-read its middle section
   (the same file). The same zsh error aborted my first protocol+manifest `cat` after the protocol; I read the manifest
   immediately after, before verifying the seal. In each case only the display failed; nothing outside the grant was read.
2. **A harness artifact outside the grant.** One Python extraction of registry entries (capsule snapshot content) exceeded the tool
   output limit, and the harness saved the full output to its own tool-results file under `~/.claude/projects/…/tool-results/`.
   I did not open that file; I saw only a 2 KB preview. I re-ran the extraction into my scratch directory.
3. **Harness-injected context.** The project `CLAUDE.md` and the user auto-memory index (`MEMORY.md`) were injected into my context
   by the harness. I did not open them, and I used nothing from them as evidence.
4. **No conversation log.** `CLAUDE.md` asks for conversation logging. I created no conversation log, because this read's charter
   restricts writes to exactly this file plus my scratch directory. Logging is left to the controller.
5. **No other deviations.** I used no `find`, `grep -r` or `ls -R` above the grant; my one `ls` was of my own scratch directory,
   and my `grep`s ran on single capsule members or on my own scratch files. There was no network, no install, no Lean or `lake`, no child agents, no
   background jobs and no kills. I did not run or read the frozen seat instruments. I edited no sealed member.
