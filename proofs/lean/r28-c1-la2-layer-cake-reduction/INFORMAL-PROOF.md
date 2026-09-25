# Informal Proof — C1-LA2 (r28): the layer-cake reduction (LC) and the r27 reformulation, formal upgrade

- Run: `erdos-993-math-dre-20260924-r28-degree-lemma-hall-sdr`; Lean run root
  `runs/lean-2026-09-25-c1-la2-layer-cake-reduction` (Cycle 1 Stage 7, award C1-LA2).
- Producer: `c1-la2-formalizer-opus-20260925` (governed formalizer seat). This document is the formalizer's
  statement-level account of the carried proofs; it is not an independent audit. The independent informal
  proof-integrity audit and the statement-fidelity review are separate seats, assigned by the controller.
- Key: `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA` (LC). The reformulation companions are a **scope note** on
  `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`, never a new key.
- Governing text: `cycles/cycle-1/stage6/SYNTHESIS.md` `## Lean awards` "C1-LA2"; statement of record
  `SOLUTION-CONTRACT.md` §2 (run copy `SOURCES/contracts/SOLUTION-CONTRACT.md`).

## 1. The terminal statement

```lean
theorem dominance_implies_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hT : G.IsTree) (k : ℕ)
    (h : ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k
```

Registered as `Erdos993G1.dominance_implies_degree_lemma`, in namespace `Erdos993G1`, so `slotsAtLeast` and
`leavesAtLeast` resolve to `Erdos993G1.slotsAtLeast` and `Erdos993G1.leavesAtLeast`. In the conclusion,
`2 * k * …` is elaborated in ℤ as `2 * (k : ℤ) * indepCount G k`.

**Erratum R28-E-a (recorded on the face).** The `∀ t` quantifier stays, as §2 writes it. On a tree the `t = 0` row
follows from the rows with `t ≥ 1` (`Erdos993G1.CriticU1F.tree_forall_t_of_ge_one`, whose `t = 0` case is
`Erdos993G1.CriticU1F.tree_slots_le_leaves_zero`). The proof uses only the rows with `1 ≤ t ≤ i_k`. `hT` is not
used and stays in the signature (Lean's unused-variable linter reports it; that is a warning, not an error).

## 2. Notation and definitions of record

`X` is a finite type with decidable equality, `G : SimpleGraph X` with decidable adjacency, and `k ∈ ℕ`.

- `I_k := G.indepSetFinset k` (Mathlib): the independent sets of size exactly `k`.
- `i_k := Erdos993G1.indepCount G k := (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)`. This is r25 entry 1,
  byte-identical. By r25 entry 4 (`indepCount_eq_card_indepSetFinset`, byte-identical), `i_k = (|I_k| : ℤ)`.
- `D_k := Erdos993G1.indepDegreeSum G k := Σ_{J∈I_k} Σ_{v∈J} deg v` (in ℕ). This is r27 entry 7, byte-identical.
  U1's re-typed copy is **not** carried; C-U1-F's `Audit.lean` shows the two are equal by `rfl`.
- `c_v := Erdos993G1.occ G v k := ((G.indepSetFinset k).filter (fun J => v ∈ J)).card`.
- `slots_{≥t} := Erdos993G1.slotsAtLeast G k t := ∑ v ∈ univ.filter (fun v => 3 ≤ G.degree v ∧ t ≤ occ G v k), (G.degree v - 2)`.
- `leaves_{≥t} := Erdos993G1.leavesAtLeast G k t := (univ.filter (fun ℓ => G.degree ℓ = 1 ∧ t ≤ occ G ℓ k)).card`.
- `L := {v : deg v = 1}` (leaves) and `Br := {v : deg v ≥ 3}` (branch vertices).

The three run-local definitions are the §2 text (seat U1, carried byte-identically). None of them depends on
`indepDegreeSum`. `occ` depends only on Mathlib's `indepSetFinset`; `slotsAtLeast` and `leavesAtLeast` depend on
`occ`. (This corrects the false `def-occ → def-indepdegreesum` dependency in U1's draft contract.)

## 3. Proof of (LC), at statement level

Each step names the Lean declaration that carries it and the hypotheses it uses.

**Step 0 — `c_v ≤ i_k`.** (`Erdos993G1.occ_le_card_indepSetFinset`; any finite graph.) A filter of `I_k` has at
most `|I_k|` elements.

**Step 1 — generic layer cake.** (`Erdos993G1.layerCake_subset`; no graph at all.) Let `s` be a finset,
`w, f : X → ℕ`, and suppose `f v ≤ N` on `s`. Then
`Σ_{v∈s} w(v)·f(v) = Σ_{t∈[1,N]} Σ_{v∈s, t ≤ f(v)} w(v)`.
*Proof.* Rewrite each inner filtered sum as `Σ_{v∈s} [t ≤ f v]·w(v)` and swap the two sums. For fixed `v`,
`#{t ∈ [1,N] : t ≤ f v} = f v`, because `f v ≤ N`. The bound is where `N` enters.

**Step 2 — the two specific layer cakes.** (`sum_branch_slots_eq_sum_slotsAtLeast`,
`sum_leaves_eq_sum_leavesAtLeast`; any finite graph.) Take `N := |I_k|` and use Step 0.
- With `s = Br`, `w = deg − 2` (natural subtraction) and `f = c`:
  `Σ_{v∈Br} (deg v − 2)·c_v = Σ_{t=1}^{i_k} slots_{≥t}`.
  `Finset.filter_filter` merges `3 ≤ deg v` and `t ≤ c_v` into the defining predicate of `slotsAtLeast`.
- With `s = L` and `w = 1`: `Σ_{v∈L} c_v = Σ_{t=1}^{i_k} leaves_{≥t}`.

**Step 3 — double counts.** (`indepDegreeSum_eq_sum_degree_mul_occ`, `sum_occ_eq_card_mul_indepSetFinset`; any
finite graph.) Swapping the order of summation gives two identities:
- `D_k = Σ_v deg v · c_v`;
- `Σ_v c_v = k·|I_k|`, because every `J ∈ I_k` has exactly `k` elements (`IsNIndepSet.card_eq`).

**Step 4 — where the hypothesis `h` enters.** The rows of `h` are used only at `t ∈ Finset.Icc 1 |I_k|`, so only
at `t ≥ 1`. Summing them gives `Σ_{t=1}^{i_k} slots_{≥t} ≤ Σ_{t=1}^{i_k} leaves_{≥t}`. By Step 2 this is
`Σ_{Br} (deg v − 2)·c_v ≤ Σ_L c_v` in ℕ.

**Step 5 — cast to ℤ.** On `Br`, `deg v ≥ 3`, so `2 ≤ deg v`, and `Nat.cast_sub` gives
`((deg v − 2 : ℕ) : ℤ) = (deg v : ℤ) − 2`. Hence `Σ_{Br} ((deg v : ℤ) − 2)·c_v ≤ Σ_L (c_v : ℤ)`.

**Step 6 — the weight identity and the nonnegative remainder.** From Step 3, in ℤ:
`2k·|I_k| − D_k = 2·Σ_v c_v − Σ_v deg v·c_v = Σ_v (2 − deg v)·c_v`.
Split `X` into `L`, `Br` (disjoint) and the rest. Each group contributes as follows:
- `v ∈ L`: `(2 − 1)·c_v = c_v`;
- `v ∈ Br`: `−(deg v − 2)·c_v`;
- the rest (`deg v ∈ {0, 2}`): `(2 − deg v)·c_v ≥ 0`.

So `2k·|I_k| − D_k ≥ Σ_L c_v − Σ_{Br}(deg v − 2)·c_v ≥ 0`, the last inequality by Step 5. With r25 entry 4
(`i_k = |I_k|` in ℤ) this is `(D_k : ℤ) ≤ 2·k·i_k`. ∎

**Hypothesis ledger for (LC).**
- `IsTree`: used nowhere.
- `n ≥ 2`: not needed.
- `k ≥ 1`: not needed. At `k = 0`, `I_0 = {∅}`, every `c_v = 0` and `D_0 = 0`, and the same proof applies.
- The rows `t ≥ 1` are consumed; the row `t = 0` is not.
- The argument holds on **any** finite simple graph. The graph-general form at `t ≥ 1` is carried twice, by
  independent critic proofs:
  - `CriticU1T.dominance_implies_degree_lemma_graph_general` (C-U1-T);
  - `Erdos993G1.CriticU1F.dominance_implies_degree_lemma_general` (C-U1-F).

  Both take `h : ∀ t, 1 ≤ t → slotsAtLeast G k t ≤ leavesAtLeast G k t`, with no acyclicity and no connectivity.
  This is the scope declaration of the key.

## 4. Companion lemmas: the r27 reformulation in full (scope note on the r27 key)

All are critic-authored (C-U1-F under `Erdos993G1.CriticU1F`, C-U1-T under `CriticU1T`). The two critics proved them
independently.

1. **Weight identity, any finite simple graph:** `2k·|I_k| − D_k = Σ_v (2 − deg v)·c_v`.
   Carried by `Erdos993G1.CriticU1F.weight_identity` and by `CriticU1T.base_identity`, which is stated with
   `indepCount`. Proof: Step 3 cast to ℤ.
2. **Pointwise split:** `(2 − d)·c = [d=0]·2c + [d=1]·c − [d≥3]·(d − 2)·c` (`CriticU1F.pointwise_split`).
   Proof by cases: `d < 3` (`interval_cases d` over `d ∈ {0,1,2}`, a three-case split on a bounded natural, each case
   closed by `simp`) and `d ≥ 3`.
3. **Exact leaf/branch identity with the isolated-vertex term, any finite simple graph**
   (`CriticU1F.leaf_branch_identity_general`):
   `2k·i_k − D_k = 2·Σ_{deg v=0} c_v + Σ_{deg v=1} c_v − Σ_{deg v≥3} (deg v − 2)·c_v`. Degree-2 vertices contribute 0.
4. **No-isolated-vertex form** (`CriticU1F.leaf_branch_identity_of_no_isolated`, hypothesis `∀ v, 0 < deg v`;
   `CriticU1T.reformulation_of_no_isolated`, hypothesis `∀ v, 1 ≤ deg v`): the same identity without the
   degree-0 term.
5. **Trees of order `n ≥ 2` have no isolated vertex.** `CriticU1F.tree_degree_pos` and `CriticU1T.tree_no_isolated`
   both use `hT.connected` and `2 ≤ card X`, and nothing else from `IsTree`.
6. **The r27 identity for `IsTree`, `2 ≤ card X`** (`CriticU1F.tree_leaf_branch_identity`,
   `CriticU1T.tree_leaf_branch_reformulation`): `2k·i_k − D_k = Σ_L c_v − Σ_{Br}(deg v − 2)·c_v`. It uses
   connectivity only, via item 5.
7. **The biconditional** (`CriticU1F.tree_degree_lemma_iff`, `CriticU1T.tree_DL_iff_aggregate`; `IsTree`,
   `2 ≤ card X`): `D_k ≤ 2k·i_k ⟺ Σ_{Br}(deg v − 2)·c_v ≤ Σ_L c_v`. Linear arithmetic from item 6.
8. **Slot count in ℤ** (`CriticU1F.tree_slot_count`, `CriticU1T.tree_slot_count`; `IsTree`, `2 ≤ card X`):
   `Σ_{Br}((deg v : ℤ) − 2) = |L| − 2`.
   - The handshake gives `Σ_v deg v = 2|E|` (`sum_degrees_eq_twice_card_edges`).
   - `IsTree.card_edgeFinset` gives `|E| + 1 = n`. This is where acyclicity enters, together with connectivity.
   - Hence `Σ_v (2 − deg v) = 2`. With no isolated vertex (item 5), split by item 2 at `c = 1`.
9. **The `t = 0` rows** (`CriticU1F.slotsAtLeast_zero`, `CriticU1F.leavesAtLeast_zero`; any finite graph).
   `slots_{≥0} = Σ_{Br}(deg v − 2)` and `leaves_{≥0} = |L|`, because the conjunct `0 ≤ c_v` is trivially true.
10. **The tree `t = 0` lemma** (`CriticU1F.tree_slots_le_leaves_zero`; `IsTree`, every `n`).
    - If `n < 2`, every degree is `< n ≤ 1`, so `Br = ∅` and the left side is 0.
    - If `n ≥ 2`, item 8 gives `Σ_{Br}(deg v − 2) = |L| − 2 ≤ |L|`, cast back to ℕ.
11. **Quantifier bridge** (`CriticU1F.tree_forall_t_of_ge_one`; `IsTree`). On a tree, the rows `t ≥ 1` imply the
    rows at every `t`: split `t = 0` (item 10) from `t ≥ 1`.

## 5. ℕ/ℤ cast audit

- `deg v − 2` is natural subtraction only inside `slotsAtLeast` and in the Step 2 sum over `Br`. There,
  `3 ≤ deg v` holds by the filter predicate, and the cast to ℤ uses `Nat.cast_sub` with the explicit witness
  `2 ≤ G.degree v` (Step 5; `hLHS` in U1's proof, `hcastB` in C-U1-T's, `hLHS` in C-U1-F's).
- The slot count (item 8) is stated in ℤ as `Σ_{Br}((deg v : ℤ) − 2) = (|L| : ℤ) − 2`. It is never read as a
  truncated natural subtraction. In `tree_slots_le_leaves_zero`, the ℕ-side sum `Σ_{Br}(deg v − 2 : ℕ)` is cast
  to ℤ under the same `3 ≤ deg v` guard (`hcast`) before comparison.
- `D_k` is a natural number and is cast to ℤ in the conclusion. `i_k` is already in ℤ (r25 entry 1). The bridge
  `i_k = (|I_k| : ℤ)` is r25 entry 4.
- All sign reasoning (`2 − deg v ≥ 0` for `deg v ≤ 2`) is done in ℤ.

## 6. Attribution (travels on every face)

- **(LC):** seat **U1** (r28 Cycle 1 Stage 3, route `C1-U-01`). U1 wrote the definition layer, the layer-cake
  lemmas, the double counts and the terminal proof block.
- **The graph-general form and the reformulation's Lean proofs:** critics **C-U1-T** and **C-U1-F** (r28 Cycle 1
  Stage 4). They are critic-attributed, and each critic's declarations keep its namespace (`CriticU1T`,
  `Erdos993G1.CriticU1F`).
- **The mechanism** (the leaf/branch reformulation and the SDR condition): r27 critic **C-T2-U** (Finding 6,
  Steps A–D).
- **The `2 ≤ n` correction:** the r27 **T adjudicator**.
- **The reformulation's second read:** **SR-JOIN** (JN-3).
- **The degree lemma:** Fang–Lu–Nevo–Yao–Zheng 2026 §8. The formal (DL) of record is r27 C1-LA1
  `Erdos993G1.forest_degree_lemma`. It is an input to this run, not a target, and nothing here uses or restates it.
- **Corrections:** r28 second read **SR-PP** (PP-3/PP-4).
- **G1 definitions of record:** the r25 award source (`736eb9df…`) and the r27 C1-LA1 award source (`b49ea82a…`).

## 7. Fences and excluded conclusions

- This is **not a proof of (DL)** and **not a second proof of (DL)**. It is an instance-wise implication: for a
  given `(G, k)`, the threshold rows imply `D_k ≤ 2k·i_k`.
- Its hypothesis **fails at `(T22, 11)` and `(T22, 12)`**. `T22` is the order-22 tree of SR-HS-REF, and (HS) is
  REFUTED. The implication therefore gives no route to (DL) on all trees.
- **No composition with `tree_leaf_slot_dominance`.** Neither `R28U2.slot_leaf_sdr_exists` nor
  `R28U2.tree_leaf_slot_dominance` is carried, and no registered declaration depends on either. Nothing from U2,
  C-U2-T or C-U2-F is carried.
- The reformulation upgrade is a **scope note on `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`**. It is not
  a new key and edits no r27 face.
- **No status transfer** (`SOLUTION-CONTRACT.md` §3.1) to any no-recovery statement or to
  `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, `E993-BETA-AGG`, the
  aggregate `S(T,p)`, `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`, or Erdős #993.
- **Repairs applied from the adjudications:**
  - "carried byte-identically" is struck for U1's `indepDegreeSum`, and the r27 entry text is registered instead;
  - U1's draft grade `formally_verified_conditional` is not used, and no grade outside `SOLUTION-CONTRACT.md` §4
    appears;
  - the false `def-occ → def-indepdegreesum` dependency is removed;
  - the informal statement of the key is the **tree-scoped** §2 statement, with the graph-general `t ≥ 1` reading
    recorded separately as the scope declaration.

## 8. Provenance of every registered declaration

**Byte-identical registrar entries.**
- Entry 1 is r25 entry 1 (`5484fc21…`).
- Entry 2 is r27 entry 7 (`a1ed32eb…`).
- Entry 6 is r25 entry 4 (`4463e7ee…`).

For each, the registrar's entry digest equals the original's (see `CAPSULE-VERIFICATION.json`). The registrar
orders every definition before every lemma, so r25 entry 4 is registered after the definition layer.

**Carried declarations.** Every other declaration except the terminal theorem is carried at the declaration level.
The declaration text runs from its docstring through the end of its proof, and it occurs verbatim in the frozen
source file. Only a namespace wrapper and the critic file's `variable` line are added (plus `open Erdos993G1` for
C-U1-T, as in its source), and those are not bodies.

**Keyword change.** For critic declarations declared with `theorem`, the keyword is changed to `lemma`, and nothing
else changes. Two registrar constraints force this:
- the registrar's `lemma` kind requires the `lemma` keyword;
- only one terminal `theorem` is allowed.

The transport script checks that swapping the keyword back reproduces the original bytes exactly.

**Terminal theorem (re-assembled).**
- Its statement is the `SOLUTION-CONTRACT.md` §2 text, verbatim.
- Its proof is U1's tactic block (everything after `:= by`), verbatim, with SHA-256
  `4f7862213d3996305242c6299522b557b4e07cc0154532baad86533fec5fbd68`.
- U1's own statement differs from §2 only in the `Erdos993G1.` qualification of `indepDegreeSum` and
  `indepCount`.
- The docstring is authored in-run.

**Not carried.** No declaration is re-derived by this seat. U1's own `indepCount`, `indepDegreeSum` and
`indepCount_eq_card_indepSetFinset` are replaced by the registrar entries above. C-U1-T's `R27Quarantine`,
`critic_indepDegreeSum_same` and `critic_contract_literal` are audit-only declarations: they are superseded by
registering the r27 entry itself and the §2 statement literally.

Frozen source files (full SHA-256):
- `U1-Main.lean`: `74ab21082d03161c1dc875eb04cb356e07d81de997b9e4a8ddacb4f982d628e5` (16,007 B);
- `C-U1-F-Critic.lean`: `7ae3f19e2ad980d512b30eeaab9df0ac07fc725b0ea1d8eec7923a553ff66a59`;
- `C-U1-T-CriticCheck.lean`: `35b10eb00b3eab4131f2f9b1d78164bd2893829cff9231fcf1693f041302e6ce`;
- `C-U1-F-Audit.lean`: `59e28fa8a58ef9858f896fbf406f837fbbab60efca8da966554e9586fbc541bb`. It is not
  transported; it is the evidence that U1's `indepDegreeSum` and the r27 entry are equal by `rfl`;
- r25 award `Main.lean`: `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0`;
- r27 C1-LA1 `Main.lean`: `b49ea82a33edc55f8185379c3abd44e13a17914b7f8b9ab0bf5e2aaac5aafc5a`.

### Carry table

| # | Registered name | Kind | Origin (frozen file, lines) | Original declaration/entry SHA-256 | Registered fragment SHA-256 | Transport | Attribution |
|---|---|---|---|---|---|---|---|
| 1 | `Erdos993G1.indepCount` | definition | r25-award-entry-1 | `5484fc21ffce7bf707240da15858d7d82289f8e6f286a8fa9837cd9a0c474ccb` | `5484fc21ffce7bf707240da15858d7d82289f8e6f286a8fa9837cd9a0c474ccb` | registrar entry, byte-identical (fragment = original entry) | r25 award (G1 of record) |
| 2 | `Erdos993G1.indepDegreeSum` | definition | r27-C1-LA1-entry-7 | `a1ed32eb12b137ac5915bf15255c1173593296f3eb22127e2dcf0fab2ea9f38e` | `a1ed32eb12b137ac5915bf15255c1173593296f3eb22127e2dcf0fab2ea9f38e` | registrar entry, byte-identical (fragment = original entry) | r27 C1-LA1 award |
| 3 | `Erdos993G1.occ` | definition | U1-Main.lean L45-49 | `9233e1cfdedad8a852d9c1e57e8348bea5b6653b993bfc1c9baac69aa551ede5` | `db58fa8816d4fd3ced845333ac9fe9beb9802c0657631a15bb03e5ab273583e6` | declaration byte-identical; wrapper added | U1 (seat) |
| 4 | `Erdos993G1.slotsAtLeast` | definition | U1-Main.lean L51-55 | `512b890d39b85dba033f07dc19568d277e757c7d1d991ac6c1a851cde3ed29d3` | `0c74d48cbf739f4bc344b3b64d7a60cb2ebda43753b66db8d2dec09f72285b73` | declaration byte-identical; wrapper added | U1 (seat) |
| 5 | `Erdos993G1.leavesAtLeast` | definition | U1-Main.lean L57-60 | `3e635dfe6ec4cf1d621558210d5252e4e310190121bd248b7b54c1c51046a707` | `e916f3de7a4a8ebf1bbd40ebb6f5fe99d9779723e10f894ab43619e191cd55dd` | declaration byte-identical; wrapper added | U1 (seat) |
| 6 | `Erdos993G1.indepCount_eq_card_indepSetFinset` | lemma | r25-award-entry-4 | `4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac` | `4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac` | registrar entry, byte-identical (fragment = original entry) | r25 award (G1 of record) |
| 7 | `Erdos993G1.occ_le_card_indepSetFinset` | lemma | U1-Main.lean L64-67 | `7173b6a35cd9e3156fee119f87c55f46f52197ed7948919a0ccfeabba9e3692e` | `87ad5da837416ec0668d4f6b4777063821dea443fb1382355906e52fc89ddea6` | declaration byte-identical; wrapper added | U1 (seat) |
| 8 | `Erdos993G1.layerCake_subset` | lemma | U1-Main.lean L71-96 | `7c0ad19c81ebe0fa68c3389afe5066bdfca45b932f1173f9d3c9fdd47818bf07` | `d139c09ae0164c1ab9edb972e2e1c866b21062be023466c3046afbde26f04112` | declaration byte-identical; wrapper added | U1 (seat) |
| 9 | `Erdos993G1.sum_branch_slots_eq_sum_slotsAtLeast` | lemma | U1-Main.lean L100-110 | `4d2c1fe3f3ac40fb089bc2ed52cb6675ea52ba3b970fc6a2112796c2a5f57bc6` | `e5a2b903b0e490509cc5316f1f771c2531f166b894d2602217ca3613342131df` | declaration byte-identical; wrapper added | U1 (seat) |
| 10 | `Erdos993G1.sum_leaves_eq_sum_leavesAtLeast` | lemma | U1-Main.lean L112-125 | `082b834ed303846e4da464babeeaf5b4e719bdba0115023146487111630cbd6f` | `e4738b113958c21e198961ebfb9f2b86663504db5ff6cd02fb1619b16cb78a96` | declaration byte-identical; wrapper added | U1 (seat) |
| 11 | `Erdos993G1.indepDegreeSum_eq_sum_degree_mul_occ` | lemma | U1-Main.lean L129-151 | `aee71b9a5dcd4b5465c7d83077cbb42cbf84360b328dbb8f947abddf5358bb45` | `a45ec9902fa3b8afc4729ff561c0c9d433ebb349645dc080789fc442e2bca959` | declaration byte-identical; wrapper added | U1 (seat) |
| 12 | `Erdos993G1.sum_occ_eq_card_mul_indepSetFinset` | lemma | U1-Main.lean L153-171 | `0a7b11521b937f1ad90d5dee21d56291a396b41c0acb52d5020a43792fdcf1cf` | `e7c6833a89c2b886fe87f31df39efba0835aaededc36730e1f13520abddfaea4` | declaration byte-identical; wrapper added | U1 (seat) |
| 13 | `Erdos993G1.CriticU1F.weight_identity` | lemma | C-U1-F-Critic.lean L13-27 | `4ec985db6a4872cecd4cdc7eb595416304dac930587c5bfcca276a956988c11c` | `e95a4d9e80f7705238a5e07c0e0aa41693e322613ef7f4becfd0dcfc1ece1fcb` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-F (critic) |
| 14 | `Erdos993G1.CriticU1F.pointwise_split` | lemma | C-U1-F-Critic.lean L29-38 | `102d5b27157810db328988fd3c57aae111a878132e49dbfe4bb19ef25414093e` | `fd04869ea267c4fb0d74d05208dbff0d62b6023531b6992a2bbfa174b1a471d6` | declaration byte-identical; wrapper added | C-U1-F (critic) |
| 15 | `Erdos993G1.CriticU1F.leaf_branch_identity_general` | lemma | C-U1-F-Critic.lean L40-52 | `cab18921d2908d5bceb6f48f679160525f508952086d2674091c2d773fe6a86b` | `90d2921d92e3ff7623290f1fca875ef8310db48a7807037a1d15802ba666ff07` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-F (critic) |
| 16 | `Erdos993G1.CriticU1F.leaf_branch_identity_of_no_isolated` | lemma | C-U1-F-Critic.lean L54-64 | `195e32223f302117a6a527088986b38c3bff2fefb78cd3e3d6313e27e0195d74` | `b8c7649179b696e0579392f21b64f8def41d1cb1bc12c051d0cf3fc9466d8c75` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-F (critic) |
| 17 | `Erdos993G1.CriticU1F.tree_degree_pos` | lemma | C-U1-F-Critic.lean L66-69 | `64dfe3e8dedc634428657396050c04ac265ae366a198dd840f5ae7c7e4f06a1a` | `293c62494096b9e763a3d22e9541b618b50c01a28b82971c130ce75678b193ba` | declaration byte-identical; wrapper added | C-U1-F (critic) |
| 18 | `Erdos993G1.CriticU1F.tree_leaf_branch_identity` | lemma | C-U1-F-Critic.lean L71-77 | `8830a9ee063c38a5b4082302a93aea32285c1d13870a2a03900ff7be0b462f0b` | `611eb6ad46b50bc09697b7d4ee550f4f48837d1d6a54a4dc2d3e77d9a72ee5b9` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-F (critic) |
| 19 | `Erdos993G1.CriticU1F.dominance_implies_degree_lemma_general` | lemma | C-U1-F-Critic.lean L79-103 | `61a23048484d215d89c6e20d0805a247a431e0b4c7ac9e67fa5baf063319d200` | `f0b7979e42b433f7ac72d270133f21e3ba12a690ce45df6138446957f650caf8` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-F (critic) |
| 20 | `Erdos993G1.CriticU1F.slotsAtLeast_zero` | lemma | C-U1-F-Critic.lean L105-109 | `69fcdda619eb4a43ddb3eed9fcb3fd1af39403f53a1be309bce124d2be65c8d0` | `0f8f3da22d524141e0056b72e0a780fdee1e2413d6158220eaeb4a6261ce0c29` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-F (critic) |
| 21 | `Erdos993G1.CriticU1F.leavesAtLeast_zero` | lemma | C-U1-F-Critic.lean L111-113 | `b44e4579e53044f4ed891b883ef28231d70521cf573434274630b316802e0d80` | `bc5749767db698f20433b76c57ff603c51d09153a16de2e13b1d4ef83c143e0a` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-F (critic) |
| 22 | `Erdos993G1.CriticU1F.tree_slots_le_leaves_zero` | lemma | C-U1-F-Critic.lean L115-152 | `1f2d4e1d4ad775e7316e305ce23b9714466f13d733202e0e4c89fb6d5f5ff121` | `a6af82ce56161747793a9b6c34e12f2f0918f32676033dab5c52ee6f0eb4b485` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-F (critic) |
| 23 | `Erdos993G1.CriticU1F.tree_forall_t_of_ge_one` | lemma | C-U1-F-Critic.lean L154-161 | `1e3e5c5b6558389f9a66603ff0800dd00070da06155d5e52c4cabb9836de6a5d` | `eb1b848b871287d732bf3bb85e19fad23faa2dfcd206e3840c468071deb65108` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-F (critic) |
| 24 | `Erdos993G1.CriticU1F.tree_slot_count` | lemma | C-U1-F-Critic.lean L163-187 | `c7edaadabda7e7ddbe75ed5adf4e6bcb38cbe83eeafa22766c0413f7a8060cae` | `aac553f8b53ea4f090d7d8a692d451776479bb21847b235b4cdf312618fc974a` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-F (critic) |
| 25 | `Erdos993G1.CriticU1F.tree_degree_lemma_iff` | lemma | C-U1-F-Critic.lean L189-195 | `ac65ad7c7b83b37865d3beea244398a65d420e7533e48e1afa79f50e6b82b1b8` | `a7e7b681c7cc65320ed14c01c7a9b8d0fc19e3408f21da12b4046431fa75f987` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-F (critic) |
| 26 | `CriticU1T.base_identity` | lemma | C-U1-T-CriticCheck.lean L42-56 | `3019cef9cea742648c509f2cf631eefda04340c61c170a3e24583e1462c9cc9c` | `d3a5da63a80271c7c147e7f556c3c8cb50731d3ffadf6dcc7112869e7fb60491` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-T (critic) |
| 27 | `CriticU1T.reformulation_of_no_isolated` | lemma | C-U1-T-CriticCheck.lean L58-71 | `1d4bf3ede326c8ecd98cdcc5091950027148abd01511b44357c66183820f6abf` | `7cd189fa776b7bf8fd0cbcc83c2785887d150075641c6ef1ce2e7b6439777286` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-T (critic) |
| 28 | `CriticU1T.tree_no_isolated` | lemma | C-U1-T-CriticCheck.lean L73-76 | `4c2457cb784bf0bc2d024b859373e58f53015332fe1a2c09a6c4922396b33486` | `57be795e863cdb3f6b99bfe2034e08979c2eda668178cf2252541c788b293282` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-T (critic) |
| 29 | `CriticU1T.tree_leaf_branch_reformulation` | lemma | C-U1-T-CriticCheck.lean L78-85 | `708f2ff54bd1a61d85b988150f599e0cd91b562d7f6d40ced8b1359c2bac56d7` | `2b8e6cfb8ae87e7f4492a6cfb98ecb9b59bd6324c6888d0dee5ad5cb46b6eeec` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-T (critic) |
| 30 | `CriticU1T.tree_slot_count` | lemma | C-U1-T-CriticCheck.lean L87-112 | `0949a3b63564525b8d8c4e5dc2100100a819e48fb2471231f92eae3f24f084d2` | `6563c8f420e6416760b4276c0a7132d2d166b0dc2f61056129a9d86e6588c10c` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-T (critic) |
| 31 | `CriticU1T.dominance_implies_degree_lemma_graph_general` | lemma | C-U1-T-CriticCheck.lean L114-150 | `bb527dd72c08190c72097712ebe5bc9996b00bb56fa49d14645f1a067413e8ab` | `eef224d92fb920e5a063047d5a8c5a46b6bd779f10e208ab4b17bbf90ff43668` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-T (critic) |
| 32 | `CriticU1T.tree_DL_iff_aggregate` | lemma | C-U1-T-CriticCheck.lean L152-160 | `091b0e737aa19bdf2f5dedae880766845e7ab342097a1f2a307e4b17cdd8529a` | `3b70324939f3c34959832f7d6184a324d4a29b8f3acf0cb5ac86da0651f75a6f` | declaration byte-identical except keyword `theorem`→`lemma`; wrapper added | C-U1-T (critic) |
| 33 | `Erdos993G1.dominance_implies_degree_lemma` | theorem | U1-Main.lean L175-290 (proof block) + SOLUTION-CONTRACT.md §2 (statement) | `7058e8298fdaf76c490d46223675660ab6491fe563d63f52f422ec7471106e52` | `eefb5f1859af38e4760936c333d7432c01e00363ed25985cc4fbc1fc01bb440c` | statement = SOLUTION-CONTRACT §2 verbatim; proof block = U1 verbatim; docstring in-run | U1 (seat) for (LC) |
