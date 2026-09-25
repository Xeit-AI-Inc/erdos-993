# Informal Proof — C1-LA5 (r28): Theorem BTP and its composition with (LC)

Run `lean-2026-09-25-c1-la5-btp-second-proof-on-class` (experiment `erdos-993-degree-lemma-hall-sdr-dre-2026-09-24`,
DRE run `erdos-993-math-dre-20260924-r28-degree-lemma-hall-sdr`). Producer `c1-la5-formalizer-opus-20260925`.
Written at the granularity of the Lean declarations in `LeanProject/LeanProof/Main.lean`; every Lean name below is a
registered entry of that file.

## 1. Keys, statements and scope

- **Key `E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2`** (Theorem BTP; informal grade of record
  `proved_informal`, SR-cleared with repairs, SR-BTP BT-1). Lean face: the lemma
  `Erdos993G1.leaf_slot_dominance_on_pathlike_branch_trees`.
- **Terminal theorem** `Erdos993G1.forest_degree_lemma_on_pathlike_branch_trees`: for a finite tree `G` in the class
  `BranchTreeMaxDegreeLeTwo` and every `k`, `(indepDegreeSum G k : ℤ) ≤ 2 * k * indepCount G k`. It is a **scope note
  on `E993-R27-FOREST-DEGREE-LEMMA`** — a byte-different second formal proof of (DL) **on this class only**, an alias
  distinction, **never a (DL) key**. The formal (DL) of record is r27 C1-LA1 `forest_degree_lemma`; it is an input to
  nothing here (not imported, not carried, not edited) and its face is never touched.

### The class predicate (`BranchTreeMaxDegreeLeTwo`, run-local definition, entry 6)

For every vertex `v` with `3 ≤ deg v`, the number of neighbours `w` of `v` such that some `z` with `3 ≤ deg z` is
reachable from `w` in `G − v` is at most 2. In Lean, "reachable from `w` in `G − v`" is written "there is a walk
`p : G.Walk w z` with `v ∉ p.support`" (such a `z` is automatically `≠ v`, since `z ∈ p.support`), and the count is
`(Finset.univ.filter …).card ≤ 2` with classical decidability of the filter predicate.

This is the synthesis's predicate (`## Lean awards`, C1-LA5: `(G.induce {v}ᶜ).Reachable ⟨w, _⟩ ⟨z, _⟩`, `z ≠ v`) in
an equivalent recorded form, as the brief (§2) permits. The equivalence is **proved in Lean**, not only asserted:
- `walk_avoiding_iff_induce_reachable` (entry 21): for `w, z ≠ v`, a `v`-avoiding walk `w ⇝ z` in `G` exists iff
  `(G.induce {v}ᶜ).Reachable ⟨w, _⟩ ⟨z, _⟩` (membership proofs built from `w ≠ v`, `z ≠ v` by
  `Set.mem_compl_singleton_iff`). Forward: induction on the walk, each edge is an induced edge. Backward: map the
  induced walk into `G` along `Embedding.induce`; its support consists of vertices of `{v}ᶜ`.
- `branchTreeMaxDegreeLeTwo_iff_induce` (entry 22): `BranchTreeMaxDegreeLeTwo G` iff for every branch vertex `v` the
  filter of neighbours `w` with some `z`, `3 ≤ deg z`, `w ≠ v`, `z ≠ v`, `(G.induce {v}ᶜ).Reachable ⟨w,_⟩ ⟨z,_⟩` has
  card `≤ 2` — the synthesis / T-adjudication wording ("the component of `G.induce {v}ᶜ` containing `w` has a vertex of
  degree ≥ 3"). Degrees are degrees in `G` throughout.

The class is exactly SR-BTP's (i) `max_v b(v) ≤ 2` (a neighbour `w` of `v` is an *internal direction* iff its side of
`G − v` contains a branch vertex). It contains paths, stars, spiders, brooms, double brooms and caterpillars; it
excludes exactly the trees with some branch-tree degree `≥ 3`, e.g. `T22` (branch tree `K_{1,3}`: vertex 0 has three
branch neighbours 1, 8, 15).

## 2. Definitions used (carried, one copy)

- `Erdos993G1.indepCount` (r25 award entry 1), `Erdos993G1.indepDegreeSum` (r27 C1-LA1 entry 7),
  `Erdos993G1.indepCount_eq_card_indepSetFinset` (r25 entry 4): byte-identical registrar entries.
- `occ G v k := ((G.indepSetFinset k).filter (fun J => v ∈ J)).card` — `c_v(k)`.
- `slotsAtLeast G k t := ∑ v ∈ univ.filter (fun v => 3 ≤ G.degree v ∧ t ≤ occ G v k), (G.degree v - 2)`.
- `leavesAtLeast G k t := (univ.filter (fun ℓ => G.degree ℓ = 1 ∧ t ≤ occ G ℓ k)).card`.
- Slots: `Σ v : {v : X // 3 ≤ G.degree v}, Fin (G.degree v.1 - 2)` — C1-LA3's `Slot G` (U2's `Σ v : Branch G,
  Fin (G.degree v.1 - 2)` with `Branch G` unfolded), written out on the face; no `Slot` definition is carried.

## 3. The proof, declaration by declaration

Throughout: `X` finite with decidable equality, `G` a simple graph on `X` with decidable adjacency. A **pendant
chain** of length `a ≥ 1` is `f : ℕ → X` with `f` injective on `{0,…,a}`, `f i ~ f (i+1)` for `i < a`, and
`deg (f i) = 2` for `0 < i < a`; it is **leaf-ended** if `deg (f a) = 1`. The anchor `f 0` is unconstrained.

1. **`pendant_chain_back_eq`** (entry 23). *Hypotheses:* two chains `f` (length `a`) and `g` (length `b`), `f`
   interior degree 2, `f a = g b`, `deg (f a) = 1`. *Conclusion:* for every `j ≤ min a b`, `f (a−j) = g (b−j)` (and the
   previous positions agree when `j > 0`). *Proof:* induction on `j`. `j = 0` is `f a = g b`. Step `j → j+1`: let
   `x = f (a−j) = g (b−j)`. If `j = 0`, `x` is the leaf; it has one neighbour, so its chain predecessors `f (a−1)` and
   `g (b−1)` coincide. If `j > 0`, `0 < a−j < a`, so `deg x = 2` and its two (distinct, by injectivity) neighbours are
   `f (a−j−1)` and `f (a−j+1)`; `g (b−j−1)` is a neighbour of `x`, and it is not `f (a−j+1) = g (b−j+1)` (the
   induction hypothesis) because `g` is injective; so it is `f (a−j−1)`. **No acyclicity, no connectivity**: only the
   degree pattern (SR-BTP (F2)).
2. **`pendant_chain_eq`** (entry 24). *Added hypotheses:* `1 ≤ a, b`; `g` interior degree 2; `3 ≤ deg (f 0)`,
   `3 ≤ deg (g 0)`. *Conclusion:* `a = b` and `f i = g i` for all `i ≤ a`. *Proof:* if `a < b`, step 1 at `j = a`
   gives `f 0 = g (b−a)` with `0 < b−a < b`, so `deg (f 0) = 2`, contradicting `3 ≤ deg (f 0)`; symmetrically
   `b < a` is impossible; with `a = b`, step 1 at `j = a − i` gives `f i = g i`. Consequences used below: anchors
   agree (`i = 0`, **disjointness of own-leaf sets**), first steps agree (`i = 1`, **distinct pendant directions end at
   distinct leaves**).
3. **`exists_pendant_chain`** (entry 25). *Hypotheses:* `G.IsAcyclic`; `v ~ w`; no `z` with `3 ≤ deg z` is reachable
   from `w` by a `v`-avoiding walk (`hno`, stated as: every walk `w ⇝ z` to such a `z` passes through `v`).
   *Conclusion:* a leaf-ended pendant chain `f` of length `m+1` with `f 0 = v`, `f 1 = w`. *Proof:* among paths
   `q : G.Walk w ℓ` avoiding `v`, take one of maximal length `N` (lengths are `< card X`; `Nat.findGreatest`; the
   length-0 path at `w` exists since `w ≠ v`). Every vertex of `q` has degree `< 3` (`hno` applied to the prefix
   `q.takeUntil x`). The path `Q := v :: q` is a path of length `N+1`. Its end `ℓ` has degree `≥ 1` (its penultimate
   vertex is a neighbour) and `< 3`; if it had a second neighbour `x ≠ penultimate`, then either `x ∈ Q.support`,
   whence `x = Q.penultimate` by acyclicity (`IsAcyclic.eq_penultimate_of_adj_end`) — contradiction — or
   `x ∉ Q.support`, whence `q.concat (ℓ ~ x)` is a longer `v`-avoiding path — contradiction with maximality. So
   `deg ℓ = 1`. Set `f := Q.getVert`: injective on `{0,…,N+1}` (path), consecutive vertices adjacent, `f 0 = v`,
   `f 1 = w`, `f (N+1) = ℓ`; an interior vertex `f i` (`0 < i < N+1`) lies on `q` (degree `< 3`) and has the two
   distinct neighbours `f (i−1)`, `f (i+1)` (degree `≥ 2`), so its degree is exactly 2. **Acyclicity enters here and
   only here** (SR-BTP (F1)); finiteness enters in the length bound.
4. **`pendant_chain_occ_le`** (entry 26). *Conclusion:* for a leaf-ended pendant chain of length `m+1` and every `k`,
   `occ G (f 0) k ≤ occ G (f (m+1)) k`. *Proof:* the carried C1-LA4 lemma `pendant_path_leaf_dominance` (entry 13) at
   position `i = 0`, applied to `u := fun i : Fin (m+2) => f i` (injective from the `InjOn`; adjacency, interior
   degree and leaf hypotheses transfer verbatim). Graph-general: no tree hypothesis (SR-BTP (F3), SR-PP PP-1).
5. **`exists_own_leaves`** (entry 27). *Hypotheses:* `hT : G.IsTree`, `hB : BranchTreeMaxDegreeLeTwo G`,
   `3 ≤ deg v`. *Conclusion:* a finset `O` with `deg v − 2 ≤ |O|`, every `ℓ ∈ O` the end of a leaf-ended pendant chain
   anchored at `v` (an **own leaf** of `v`). *Proof:* split the neighbours of `v` into internal directions `Int`
   (some branch vertex reachable avoiding `v`) and pendant directions `Pend`. `|Int| ≤ 2` by `hB` (`Int` is contained
   in the filter of the predicate). `|Int| + |Pend| = deg v`, so `|Pend| ≥ deg v − 2`. For each `w ∈ Pend`, step 3
   (acyclicity from `hT.isAcyclic`) gives a chain through `w` ending at a leaf `L w` (chosen). `L` is injective on
   `Pend` by step 2 (`i = 1`, using `3 ≤ deg v` for both anchors). Take `O := Pend.image L`. *ℕ/ℤ audit:*
   `deg v − 2` is truncated ℕ subtraction; it is exact because `3 ≤ deg v`, and the inequality
   `deg v − 2 ≤ |Pend|` follows from `|Int| ≤ 2` and `|Int| + |Pend| = deg v` by `omega`.
6. **`btp_sdr_exists`** (entry 28). *Conclusion:* for every `k`, an injective `f` from the slots to `X` with, for every
   slot `s = ⟨v, j⟩`, `deg (f s) = 1` and `occ G v k ≤ occ G (f s) k`. *Proof:* choose `O v` (step 5) for each branch
   vertex; `|Fin (deg v − 2)| ≤ |O v|` gives an embedding `e v : Fin (deg v − 2) ↪ O v`; set `f ⟨v, j⟩ := e v j`.
   Injectivity: if `f ⟨v, j⟩ = f ⟨v', j'⟩ = ℓ`, then `ℓ` is an own leaf of both `v` and `v'`, so `v = v'` by step 2
   (`i = 0`), and then `j = j'` since `e v` is injective. Leaf and dominance: step 4 on the chain witnessing
   `f s ∈ O v`. This is the explicit own-leaves injection of SR-BTP BT-1 — **no Hall, no slot count, no surplus
   identity**.
7. **`threshold_of_sdr`** (entry 29). *Hypotheses:* any finite simple graph, any `k`, an injective `f` from the slots
   into leaves with `occ v ≤ occ (f s)`. *Conclusion:* `slotsAtLeast G k t ≤ leavesAtLeast G k t` for **every**
   `t : ℕ`, including `t = 0`. *Proof:* the slots with `t ≤ occ G v k` number exactly `slotsAtLeast G k t`
   (card of the filter = `∑_s [t ≤ occ]` = `∑_v ∑_{j < deg v − 2} [t ≤ occ v]` (`Fintype.sum_sigma`) =
   `∑_{v : deg v ≥ 3} [t ≤ occ v]·(deg v − 2)` (`Finset.sum_subtype`) = `slotsAtLeast` (`Finset.sum_filter`,
   `Finset.filter_filter`)); `f` maps them injectively into `{ℓ : deg ℓ = 1, t ≤ occ ℓ}` since
   `t ≤ occ v ≤ occ (f s)`. The "direct counting argument" of the brief; C1-LA3's Hall machinery is not used. No tree
   hypothesis.
8. **`leaf_slot_dominance_on_pathlike_branch_trees`** (entry 30; the **BTP face**). *Hypotheses:* `hT`, `hB`, `k`.
   *Conclusion:* the SDR of step 6 exists **and hence** `∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t`
   (step 7). All `t`, including 0; all `k`, including 0.
9. **`forest_degree_lemma_on_pathlike_branch_trees`** (entry 31; the **terminal theorem**). Step 8's threshold
   conjunct is the hypothesis `h` of the carried C1-LA2 reduction `dominance_implies_degree_lemma G hT k h`
   (entry 20), which returns `(indepDegreeSum G k : ℤ) ≤ 2 * k * indepCount G k`.

## 4. Where each hypothesis enters

| Hypothesis | Where it is consumed | Not needed for |
|---|---|---|
| finiteness (`Fintype X`) | step 3 (path length `< card X`), counting in steps 5–7, `occ` | — |
| `hT : G.IsTree` | step 3 via `hT.isAcyclic` (inside step 5); passed to `dominance_implies_degree_lemma`, where it is unused (R28-E-a) | connectivity is never used |
| `hB` | step 5 only (`|Int| ≤ 2`) | steps 1–4, 6–7 are class-free |
| `3 ≤ deg v` | step 2 (anchor uniqueness) and the ℕ subtraction `deg v − 2` (exact) | — |
| `n ≥ 2` | not used | the theorem holds for every finite tree, incl. the 1-vertex tree |
| `k ≥ 1` | not used | all `k : ℕ` |
| `t ≥ 1` | not used | all `t : ℕ`, including `t = 0` |

**ℕ/ℤ cast audit.** `deg v − 2` appears in ℕ (slot type `Fin (deg v − 2)`, `slotsAtLeast`); it is only ever used
under `3 ≤ deg v` (the slot type is indexed by `{v // 3 ≤ deg v}`; `slotsAtLeast` filters on `3 ≤ deg v`), so no
truncation occurs. The ℤ-valued conclusion comes from the carried (LC) reduction, whose own cast audit (the
`(deg v : ℤ) − 2` rewriting under `2 ≤ deg v`, the slot count in ℤ) is recorded in the C1-LA2 run; nothing here
re-casts.

## 5. Excluded conclusions and fences

- **NOT (HS) on all trees.** (HS) `tree_leaf_slot_dominance` is FALSE (`T22`, SR-HS-REF). `T22` has branch tree
  `K_{1,3}` and lies outside the class; the class is sharp for every branch-degree bound `D ≥ 3` (SR-BTP BT-2).
  `slot_leaf_sdr_exists` and `R28U2.tree_leaf_slot_dominance` are not carried and nothing here depends on them.
- **NOT (DL) on all forests.** The terminal theorem is (DL) on the BTP class only; it is a scope note on
  `E993-R27-FOREST-DEGREE-LEMMA`, never a (DL) key; the r27 award's face is never edited.
- Not (PW): every comparison is between a branch vertex and a leaf at the end of its own pendant path.
- No status transfer (SOLUTION-CONTRACT §3.1).

## 6. Attribution

- Theorem BTP: `C-T2-U` (Finding 2); independent proofs `C-T2-F` (F2), `C-F2-T` (Finding 2), `C-F2-U` (F-2),
  `C-T1-F` (F2); repairs and canonical proof SR-BTP; route `U-BTP-CLASS-FORMAL` (U adjudicator).
- Pendant-path lemma: C-T1-U, C-T1-F, C-T2-U, C-T2-F, C-F2-T, C-F2-U (SR-PP); Lean text: the C1-LA4 formalizer
  (carried).
- (LC) reduction: U1 (seat); Lean text: U1's declarations as assembled by the C1-LA2 formalizer (carried).
- Common: r27 critic `C-T2-U` (Finding 6, Steps A–D, the mechanism); the `2 ≤ n` correction (r27 T adjudicator);
  SR-JOIN (JN-3); the degree lemma: Fang–Lu–Nevo–Yao–Zheng 2026 §8 (formal (DL) of record r27 C1-LA1).
- New Lean text in this run (entries 6, 21–31): written in-run by `c1-la5-formalizer-opus-20260925` ("re-derived
  in-run"); no compiled fragment for BTP existed (synthesis: "Every open node is Lean engineering"). No critic-authored
  Lean body is carried in this run.

## 7. Carry table (R2, R7)

Carry transport is mechanical (`DRAFTS/transport.py`, record `DRAFTS/carry-table.json`). Each carried fragment is the
registered entry body of the CLOSED C1-LA4 or C1-LA2 run's `Main.lean`, extracted between its registrar markers; each
body's SHA-256 equals its marker digest. Source files (full SHA-256, verified before transport and matching the
sealed capsule): C1-LA4 `Main.lean` `f979e1d7a8b3df6605765969d7c2c73762c736f073f8806f494da1d8b7c8bae0`; C1-LA2
`Main.lean` `64545ccd0b20ffe2da540fc4ae9d365825d43b73929201a1dab915925f109efc`; r25 award `Main.lean`
`736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0`; r27 C1-LA1 `Main.lean`
`b49ea82a33edc55f8185379c3abd44e13a17914b7f8b9ab0bf5e2aaac5aafc5a`. Duplicate definition-layer entries (1–6 of both
sibling runs) are byte-identical; ONE copy is carried.

| Entry | Name | Origin | Original entry SHA-256 | Registered SHA-256 | Transport |
|---|---|---|---|---|---|
| 1 | `indepCount` (def) | r25 entry 1 = LA4 1 = LA2 1 | `5484fc21ffce7bf707240da15858d7d82289f8e6f286a8fa9837cd9a0c474ccb` | same | byte-identical |
| 2 | `indepDegreeSum` (def) | r27 entry 7 = LA4 2 = LA2 2 | `a1ed32eb12b137ac5915bf15255c1173593296f3eb22127e2dcf0fab2ea9f38e` | same | byte-identical |
| 3 | `occ` (def) | LA4 3 = LA2 3 (origin U1-Main.lean `74ab2108…`) | `db58fa8816d4fd3ced845333ac9fe9beb9802c0657631a15bb03e5ab273583e6` | same | byte-identical |
| 4 | `slotsAtLeast` (def) | LA4 4 = LA2 4 (U1) | `0c74d48cbf739f4bc344b3b64d7a60cb2ebda43753b66db8d2dec09f72285b73` | same | byte-identical |
| 5 | `leavesAtLeast` (def) | LA4 5 = LA2 5 (U1) | `e916f3de7a4a8ebf1bbd40ebb6f5fe99d9779723e10f894ab43619e191cd55dd` | same | byte-identical |
| 7 | `indepCount_eq_card_indepSetFinset` | r25 entry 4 = LA4 6 = LA2 6 | `4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac` | same | byte-identical |
| 8 | `pendant_path_adj_of_pos` | LA4 7 | `e0b86a6d6d9ca5bc2aef995d4b27b85b1eba4e6aad52bc2741b7bb4349361787` | same | byte-identical |
| 9 | `pendant_path_adj_consec` | LA4 8 | `34427ac636105b7f12a998c7b91bc7cc80cc95b4a033b024822456e50c7688fe` | same | byte-identical |
| 10 | `pendant_path_adj_mem_range` | LA4 9 | `b2a5a0c02fd79a468329b1d2c4b00a407b0681ed629583254f63116462c0a20a` | same | byte-identical |
| 11 | `exists_pendant_shift_perm` | LA4 10 | `ace96d1ec54fe794357e36542c01f375e702856d0ec8236da54edf249399b412` | same | byte-identical |
| 12 | `pendant_path_occ_le_of_lt` | LA4 11 | `4087830d9c05849f6065a1b6a2eceec2cb780cac6e9f830d150bca83e64df608` | same | byte-identical |
| 13 | `pendant_path_leaf_dominance` | LA4 12 (terminal `theorem` there) | `6f0dcbe2feebce289af31daadc2d705823ff411d66e50e470484bc57700eb43b` | `18b1b9c763f30a5819853ab14f0b065322e5478b5ec84ecb1e57b76b5d9d34fd` | N1 |
| 14 | `occ_le_card_indepSetFinset` | LA2 7 (U1) | `87ad5da837416ec0668d4f6b4777063821dea443fb1382355906e52fc89ddea6` | same | byte-identical |
| 15 | `layerCake_subset` | LA2 8 (U1) | `d139c09ae0164c1ab9edb972e2e1c866b21062be023466c3046afbde26f04112` | same | byte-identical |
| 16 | `sum_branch_slots_eq_sum_slotsAtLeast` | LA2 9 (U1) | `e5a2b903b0e490509cc5316f1f771c2531f166b894d2602217ca3613342131df` | same | byte-identical |
| 17 | `sum_leaves_eq_sum_leavesAtLeast` | LA2 10 (U1) | `e4738b113958c21e198961ebfb9f2b86663504db5ff6cd02fb1619b16cb78a96` | same | byte-identical |
| 18 | `indepDegreeSum_eq_sum_degree_mul_occ` | LA2 11 (U1) | `a45ec9902fa3b8afc4729ff561c0c9d433ebb349645dc080789fc442e2bca959` | same | byte-identical |
| 19 | `sum_occ_eq_card_mul_indepSetFinset` | LA2 12 (U1) | `e7c6833a89c2b886fe87f31df39efba0835aaededc36730e1f13520abddfaea4` | same | byte-identical |
| 20 | `dominance_implies_degree_lemma` | LA2 33 (terminal `theorem` there) | `eefb5f1859af38e4760936c333d7432c01e00363ed25985cc4fbc1fc01bb440c` | `eca485740083521846164b57e89193016cdd8b38f75dac577ef3b6e38f2d32dd` | N1 |

**N1** (two entries): the declaration-head keyword `theorem` becomes `lemma`, and nothing else changes. The registrar
forces it (a `lemma` entry must match `^\s*lemma <name>`, and exactly one `theorem` — this run's terminal — is
permitted). `DRAFTS/transport.py` asserts that reversing N1 reproduces the original entry bytes exactly. Lean
elaborates `lemma` as `theorem`, so the kernel declarations are the same. This is the normalization disclosed by the
C1-LA2 and C1-LA3 formalizers for their critic transports.

C1-LA2's other entries (13–32: the critic-authored reformulation companions) are **not** carried: the reduction's
dependency closure is entries 1–12 and 33. Nothing is carried from `sources/c1-stage7-sources/` (U2's
`sdr_iff_threshold` Hall route was not taken; `slot_leaf_sdr_exists` / `R28U2.tree_leaf_slot_dominance` never enter).

**Route (R7):** the direct own-leaves injection (preferred), with the direct counting argument for the threshold form.
