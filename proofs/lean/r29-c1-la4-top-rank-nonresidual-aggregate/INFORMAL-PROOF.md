# Informal Proof — C1-LA4 (TRN), key `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE`

- Award: `C1-LA4`, Cycle 1 Stage 7 of r29 (canonical run id `erdos-993-math-dre-20260925-r29-high-tail-certification`).
- Governed run root: `runs/lean-2026-09-25-c1-la4-top-rank-nonresidual-aggregate/`.
- Producer id: `c1-la4-formalizer-opus-20260925`.
- Model disclosure (two parts): chartered model **Claude Opus 5.5**, effort high, on dispatch-record authority
  (`control/dispatch/c1-stage7/DISPATCH-C1-LA4.md`); runtime-reported model id, verbatim: **`claude-opus-5-5[1m]`**.
- Informal proof of record (synthesis `## Exact established results`, R-TRN). This file restates it at statement
  level against the exact Lean declarations of `LeanProject/LeanProof/Main.lean`. It is not an audit and grades
  nothing; the informal proof-integrity audit and the fidelity review are separate, later gates.

## 1. Statement

Lean (namespace `E993HighTail`, with `open SimpleGraph` and `open E993Interior`); the text is the synthesis §2 text
byte for byte (statement SHA-256 `b21887c09fcf9d7c68abd02b3465e7f3e297ccdf3e2ba9b62089feedfeb0e44e`):

```lean
theorem topRankNonResidualAggregate {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1) :
    C5LA1.aggregate G (G.indepNum - 1) ≤ 0
```

Prose: for every finite ordinary tree `T` with `α = α(T)`, `x = x(T)` and integer rank `p = α − 1`, if `x + 2 ≤ p` then
`S(T, p) = Σ_{v ∈ F_p(T)} [Δ_{p−1}(T − {v, s_v}) − Δ_{p−1}(T − N_T[s_v])] ≤ 0`, where `F_p(T)` is the set of original
leaves `v` with `Δ_p(T − v) < 0`.

## 2. Definitions used (all carried byte-identically; none re-stated)

| Symbol | Lean name | Meaning |
|---|---|---|
| `α(G)` | `SimpleGraph.indepNum` | maximum size of an independent set (Mathlib) |
| tree | `SimpleGraph.IsTree` | connected and acyclic (Mathlib) |
| bipartite | `SimpleGraph.IsBipartite` | `G.Colorable 2` (Mathlib; used only inside the carried chain) |
| `I_k(G − D)` | `C5LA1.indepSetsAvoiding` | independent `k`-subsets of `univ` disjoint from `D` (entry 10) |
| `i_k(G − D)` | `C5LA1.indepSetCount` | its cardinality (entry 11) |
| `Δ_k(G − D)` | `C5LA1.forwardDifferenceDel` | `(i_{k+1} : ℤ) − i_k` (entry 12) |
| `x(G)` | `C5LA1.crossingIndex` | `Nat.find` of the least `k` with `Δ_k(G) < 0`, `D = ∅` (entry 14) |
| leaf | `C4LA1.IsGraphLeaf` | `∃! u, G.Adj v u` (entry 4) |
| leaves | `C5LA1.leafSet` | the finset of leaves (entry 6) |
| `s_v` | `C5LA1.support` | the unique neighbour of a leaf (entry 5) |
| `H_v`, `R_v` | `C5LA1.H`, `C5LA1.R` | deletion sets `{v, s_v}` and `N_G[s_v]` (entries 8, 9) |
| selector | `C4LA1.IsFavorableAt` | `Δ_p(G − v) < 0`, via `vertexDeletionForwardDifference`/`vertexDeletionIndepSetCount` (entries 1–3) |
| `S(G, p)` | `C5LA1.aggregate` | sum over favourable leaves of `Δ_{p−1}(H_v) − Δ_{p−1}(R_v)` (entry 13) |
| `q_j` | `E993Interior.taggedFamily` | independent `j`-subsets of `U` meeting `W` (entry 18; inside the carried chain) |

`C5LA1.leafDegree` (entry 7) is carried because it is part of the definition layer of record; the proof does not use it.

## 3. Proof

**Step A — public counting facts** (new lemmas, any finite simple graph, any deletion set `D`).
1. `indepSetCount_zero`: `i_0(G − D) = 1`. The only `0`-subset is `∅`, which is independent and avoids `D`.
2. `indepSetCount_one`: `i_1(G − D) = |univ ∖ D|`. Every singleton is independent, so the filter is the whole
   `powersetCard 1`, of size `C(|univ ∖ D|, 1)`.
3. `forwardDifferenceDel_zero_eq`: `Δ_0(G − D) = |V| − |D| − 1` in ℤ. From 1 and 2 with `|univ ∖ D| = |V| − |D|`, cast
   by `Nat.cast_sub` using `|D| ≤ |V|`. At `D = ∅`: `Δ_0(G) = n − 1`.
4. `indepNum_le_card`: `α(G) ≤ n`. A maximum independent set (Mathlib `exists_isNIndepSet_indepNum`) is a subset of `V`.
5. `crossingIndex_negative`: `Δ_{x(G)}(G) < 0` (`Nat.find_spec`).

**Step B — S7, `topRankEligibleAlphaGeFour`: the ℕ hypothesis forces `α ≥ 4`** (any finite simple graph).
Suppose `α ≤ 3`. The ℕ hypothesis reads `x + 2 ≤ α ∸ 1`. If `α ≤ 2` the right side is at most `1 < 2`, impossible; so
`α = 3`, the right side is `2`, and `x = 0`. Then Step A.5 gives `Δ_0(G) < 0`, while Step A.3 gives `Δ_0(G) = n − 1` and
Step A.4 gives `n ≥ α = 3`, so `Δ_0(G) ≥ 2`, a contradiction. Hence `α ≥ 4`. (Lean: `by_contra`, then `omega` twice.)
This lemma consumes only `hEligible`; it uses no tree, bipartite or connectivity hypothesis. It is the synthesis's
companion S7, which is STATED and needs its isolated second read (SR-5) before it is registered as a fact of its own;
here it is a compiled companion lemma carrying this award's proof.

**Step C — terminal step.** With `α ≥ 4`, put `p = α ∸ 1 = α − 1`. Then `p ≥ 3 ≥ 2` and
`2α + 1 ≤ 3(α − 1) ⟺ α ≥ 4`. The graph is bipartite: `hT.isAcyclic.isBipartite` (Mathlib
`SimpleGraph.IsAcyclic.isBipartite`, `Mathlib/Combinatorics/SimpleGraph/Acyclic.lean:617`: a forest is 2-coloured by
distance parity from a chosen vertex of each component). Apply the carried entry 44
`E993Interior.bipartiteHighTailAggregate G hBip (α − 1) hp hTail`, discharging `hp : 2 ≤ α − 1` and
`hTail : 2α + 1 ≤ 3(α − 1)` by `omega` from `α ≥ 4`.

**Step D — the carried chain (context, compiled internal lemmas of the first-interior package; not certificates).**
- Entry 44 feeds entry 42 `highTailAggregateFromShadow` the shadow hypothesis `hShadow`, discharged by entry 41
  `taggedShadowBound G hBip`.
- Entry 42 bounds **every** summand of `S(G, p)` by `0` (`Leaf.leaf_term_nonpos`) and closes by `Finset.sum_nonpos`. For
  a leaf `v` with `k = p − 1 ≥ 1`:
  - the term equals `q_p − q_{p−1}`, counted in `G` on the carrier `univ ∖ H_v` with tag set `R_v`
    (`Leaf.tagged_count_split`, using `H_v ⊆ R_v`);
  - every independent subset of `univ ∖ H_v` has size at most `α − 1` (`Leaf.leaf_indep_cap`: `v` extends it);
  - `Leaf.leaf_tagged_monotone`: if `k > α − 1` both counts vanish (`Leaf.tagged_zero_above_leaf_cap`); otherwise the
    guard gives `2((α − 1) − k) ≤ k`, and entry 41 at `U = univ ∖ H_v`, `a = α − 1` gives
    `k·q_{k+1} ≤ 2(a − k)·q_k ≤ k·q_k`, so `q_{k+1} ≤ q_k`.
- Entry 41 (`taggedShadowBound`): every tagged independent `(k+1)`-set has at least `k` tagged `k`-subsets
  (`Core.tagged_deletions_lower`); every tagged independent `k`-set `A ⊆ U` has at most `2(a − k)` tagged extensions
  (`Core.tagged_extensions_upper`, via `Core.card_extension_le`); double count the containments
  (`Finset.card_nsmul_le_card_nsmul`).

### Where each hypothesis enters

| Hypothesis | Where it is consumed |
|---|---|
| `hT : G.IsTree` | Only as `hT.isAcyclic` (acyclicity), to obtain `G.IsBipartite` in Step C. **Connectivity is not used**; no `Nonempty V`, edge count or `IsTree.card_edgeFinset` enters. The Lean term is `hT.isAcyclic.isBipartite` (line 617 route), not `hT.isBipartite` (line 598, which routes through `hT.connected.nonempty`). |
| `G.IsBipartite` (derived) | Only inside entry 41, at `Core.card_extension_le`: `obtain ⟨c⟩ := hBip` gives a colouring `c : G.Coloring (Fin 2)`; `Core.indep_union_color` shows `A ∪ (E ∩ colour class)` is independent, so each colour class of the addable set `E` has at most `a − |A|` vertices, hence `|E| ≤ 2(a − k)`. |
| `hEligible` (ℕ) | Only in Step B, to derive `4 ≤ α`. |
| `1 ≤ k` | Entry 41's `hk`, supplied in `Leaf.leaf_tagged_monotone` from `p ≥ 2` (`k = p − 1`). Entry 41's proof does not reference it (Lean's unused-variable linter flags `Main.lean:419`); it is statement scope there. |
| `k ≤ a` | Not a hypothesis of entry 41 (its `a − k` is truncated ℕ). It is the `¬ (α − 1 < k)` branch of `Leaf.leaf_tagged_monotone`, where the truncation is exact; the other branch uses the vanishing counts. |
| `p ≥ 1` | Implied by `p ≥ 2`; makes the ℕ `p − 1` inside `C5LA1.aggregate` the integer rank `α − 2`. |
| `p ≥ 2` | Entry 44's `hp`, discharged by `omega` from `α ≥ 4` (`p = α − 1 ≥ 3`). |
| guard `2α + 1 ≤ 3p` | Entry 44's `hTail`, discharged by `omega` from `α ≥ 4`; consumed in `Leaf.leaf_tagged_monotone` as `2((α − 1) − k) ≤ k`. |
| selector `IsFavorableAt` | Not consumed: every leaf's term is bounded, so the sum over the favourable filter is `≤ 0` whatever the filter is. |

## 4. ℕ/ℤ cast audit

- `hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1` is in ℕ with truncated subtraction. For `α ≥ 1`,
  `α ∸ 1 = α − 1`, so it is literally the integer hypothesis `x + 2 ≤ α − 1`. For `α = 0` the ℕ right side is `0` and the
  integer right side is `−1`: both false. For `α = 1` both right sides are `0`: both false. **The ℕ and ℤ hypotheses are
  equivalent for every `α`, and both are false when `α ≤ 1`.** No hypothesis is added or strengthened.
- The rank `G.indepNum - 1` in the conclusion is ℕ; under `hEligible`, `α ≥ 4`, so it equals the integer `α − 1`; the
  inner `p - 1` of `C5LA1.aggregate` equals the integer `α − 2 ≥ 2`.
- `C5LA1.forwardDifferenceDel` and `C5LA1.aggregate` are ℤ-valued; counts are ℕ cast into ℤ; no truncation occurs there.
- `forwardDifferenceDel_zero_eq`: the only ℕ subtraction `|V| − |D|` is cast by `Nat.cast_sub` under `|D| ≤ |V|`.
- Step B: after rewriting, `omega` works on `(|V| : ℤ) − 1 < 0` together with `α ≤ |V|` in ℕ; the casts are handled by
  `omega`'s `↑` support.
- Entry 41 is in ℕ with truncated `a − k`; it is used only in the branch `k ≤ α − 1`, where the truncation is exact.

## 5. Carry table

Registrar index → first-interior entry. Carried fragments are the frozen first-interior `Snippets/*.lean.fragment`
files, registered byte-identically (fragment SHA-256 = `FORMALIZATION-STATE.json` `source_sha256` of the frozen
first-interior state, SHA-256 `5411a8c2451549b650be1af2e551c40d8b4440f65ce50c691023ef1be2dc94a0`).

| Reg. | Entry | Declaration | Fragment SHA-256 | Origin |
|---|---|---|---|---|
| 1 | 1 | `C4LA1.vertexDeletionIndepSetCount` | `7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48` | r24 C4-LA1 via first-interior |
| 2 | 2 | `C4LA1.vertexDeletionForwardDifference` | `c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880` | r24 C4-LA1 via first-interior |
| 3 | 3 | `C4LA1.IsFavorableAt` | `25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db` | r24 C4-LA1 via first-interior |
| 4 | 4 | `C4LA1.IsGraphLeaf` | `65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5` | r24 C4-LA1 via first-interior |
| 5 | 5 | `C5LA1.support` | `8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4` | r26 via first-interior |
| 6 | 6 | `C5LA1.leafSet` | `78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697` | r26 via first-interior |
| 7 | 7 | `C5LA1.leafDegree` | `ccfc9b2f549aa8c9986931152d249096ce49e3ccd3b67f4afd8678a749d93a68` | r26 via first-interior |
| 8 | 8 | `C5LA1.H` | `55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d` | r26 via first-interior |
| 9 | 9 | `C5LA1.R` | `a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8` | r26 via first-interior |
| 10 | 10 | `C5LA1.indepSetsAvoiding` | `ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368` | r26 via first-interior |
| 11 | 11 | `C5LA1.indepSetCount` | `e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71` | r26 via first-interior |
| 12 | 12 | `C5LA1.forwardDifferenceDel` | `60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f` | r26 via first-interior |
| 13 | 13 | `C5LA1.aggregate` | `d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b` | r26 via first-interior |
| 14 | 14 | `C5LA1.crossingIndex` | `378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb` | r26 via first-interior |
| 15 | 18 | `E993Interior.taggedFamily` | `cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e` | Codex (first-interior) |
| 16 | 41 | `E993Interior.taggedShadowBound` (+ `Core` helpers) | `50dcce4a7ad13fbb73361ff1235996a7bb79eeea2cf9435a752b1eab50d8583f` | Codex (first-interior) |
| 17 | 42 | `E993Interior.highTailAggregateFromShadow` (+ `Leaf` helpers) | `972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d` | Codex (first-interior) |
| 18 | 44 | `E993Interior.bipartiteHighTailAggregate` | `b7ee9d1adcac58675ea4216906ca944049df3f3be12873c4996cb23fe4dc3b93` | Codex (first-interior) |

New declarations (namespace `E993HighTail`). Bodies transported at declaration level from the frozen carry file
`sources/c1-stage7-sources/ADJ-U-awards-LA4b-Main.lean` (full SHA-256
`5457ede803a03fc9c9cc153aa0217b0f206c8c91a5cbddceafa48e3febeb2295`, 30,116 B; origin
`scratchpad/c1-adj-U/awards/LA4b/LeanProject/LeanProof/Main.lean`; author: r29 U adjudicator, base candidate). The
namespace/`open` wrapper of each fragment is formalizer-authored (wrappers are not bodies).

| Reg. | Declaration | Source lines | Declaration-block SHA-256 | Provenance |
|---|---|---|---|---|
| 19 | `lemma indepSetCount_zero` | 671–687 | `fedae3a66476912978b58f274dd09ea8361ed8b7155ac8b7d6536228c312bb8c` | byte-identical transport (U adjudicator) |
| 20 | `lemma indepSetCount_one` | 689–703 | `57215a38e137e0142dfc2414e18ec8a3c8890f4c2846c42f47925d0563607728` | byte-identical transport (U adjudicator) |
| 21 | `lemma forwardDifferenceDel_zero_eq` | 705–718 | `572f474ef8e24232db643dc845734a5b01125be373328aeb33fddb62892b3c1a` | byte-identical transport (U adjudicator) |
| 22 | `lemma indepNum_le_card` | 720–724 | `d0e2410fd7ad045d6aab9f43c261c330b284da8105f9bbfe8c7fb072b575f8a8` | byte-identical transport (U adjudicator) |
| 23 | `lemma crossingIndex_negative` | 726–731 | `a796425d6c84ac2ebea2802686794f6238135eda1d812da14c4e91ab164a3021` | byte-identical transport (U adjudicator) |
| 24 | `lemma topRankEligibleAlphaGeFour` (S7) | 733–744 | `a780ca971f8cef66b08e214156f86eed53df4cc5e4289e920945cfff188df9b3` | byte-identical transport (U adjudicator; mathematics C-T2-U, F and U adjudicators) |
| 25 | `theorem topRankNonResidualAggregate` | 746–753 | source block `8fb2b6cb58625bd10d2818b8b87ebca4bfd2e07667f7ea48de602250c2a1b0dc` | **adapted by the formalizer**: statement byte-identical; proof identical except the single term `hT.isBipartite` replaced by `hT.isAcyclic.isBipartite` (the brief's preferred acyclicity route) |

Carry files verified against `sources/c1-stage7-sources/SOURCE-DIGESTS.json` but **not transported**:
`ADJ-T-CarryLA4.lean` (`a9e9db7f0a041289d6e3298c3b573cd3088d9b7af00652986ead79923641a981`; T adjudicator, equivalent
route), `ADJ-U-awards-LA4a-Main.lean` (`58029dc90c8adead50a1bf3287eb4ea9089da9b305c9ef0437e8c3ae2476ba56`, fallback),
`C-U1-F-LA4-Main.lean` (`0487f2e80604e44f92507d39b5ca325ecfcae785f94643482d09d195a249d47a`, critic fallback),
`C-T2-U-CritTRN.lean` (`a94223b1075a0725d5a9040defac6038dbcbe9d42df228da3cdbb56b58f6194c`, critic). No critic-authored
body enters this source. Entry 43 and the `Erdos993G1` chain (entries 15–17, 19–40) are not carried. Optional
companions S8 and S9 are not formalized.

## 6. Attribution

- Codex (GPT-6 Astra): the proposed corollary ("supported informally"); Codex (first-interior) for the mechanism and the
  carried entries 18, 41, 42, 44.
- r26: the `C5LA1` definition layer (entries 5–14) and the `α ≥ 4` ingredient on the residual class.
- r24 C4-LA1: the selector and leaf definitions (entries 1–4).
- r29: T2 — the derivation; C-T2-F and C-T2-U — `α ≥ 5` and the bipartite form (companions, not stated here); C-T2-U,
  F's adjudicator and U's adjudicator — the `x ≥ 1` shortening (Step B); C-U1-T — the minimal public route; U's
  adjudicator — the base candidate (`ADJ-U-awards-LA4b-Main.lean`).
- This formalizer: registrar packaging, the `open` wrappers, and the one-term acyclicity routing in the terminal proof.

## 7. Fences and excluded conclusions

- §3.1: (TRN) is a statement about independent-set counts on finite trees. It is not a no-recovery statement and
  transfers no status to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER,
  `E993-BETA-AGG` or Erdős #993.
- §3.2: `E993-R26-TOP-RANK-RESIDUAL-SIGN` and `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` are never re-registered or
  edited; r26's award is not widened and remains the proof of record on the residual class. Relation (scope note only):
  same conclusion and rank as r26's `topRankResidualSign`, with `hAlpha` and the residual condition (★) dropped, by a
  different mechanism (tagged shadow, not the (RI)/(RC) budget).
- §3.3: nothing here concerns the region `3p < 2α + 1`.
- §3.7: attribution as in §6, on every face.
- §3.8: this award is a separate certificate; the carried entries 41, 42, 44 are context, never certificates; nothing is
  presented as awarded before the close.
- Excluded conclusions: no strict inequality (`E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` is untouched; the census maximum
  is not used); no other rank; `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` stays OPEN (one rank of it, not the key); no
  widening of r26; no bipartite or forest statement in the terminal theorem; no `E993-BETA-AGG` transport.
