# Informal proof of record — `C1-LA3`, the degree-lemma implication chain

Award: `C1-LA3` (candidate key `E993-R27-DEGREE-LEMMA-IMPLIES-EXTENSION-CHAIN`).
Run: `erdos-993-math-dre-20260924-r27-forest-degree-extension`, Cycle 1 Stage 7.
Lean run root: `runs/lean-2026-09-25-c1-la3-degree-lemma-implication-chain`.
Producer: `c1-la3-formalizer-opus-20260925` (governed formalizer seat; no child delegation).

## 0. What is claimed and what is not

The single terminal declaration is an **implication**:

```lean
theorem degree_lemma_implies_chain :
    DlHyp.{u} → ExHyp.{u} ∧ LbHyp.{u} ∧ R5Hyp.{u} ∧ XrHyp.{u}
```

`DlHyp`, `ExHyp`, `LbHyp`, `R5Hyp`, `XrHyp` are `Prop` abbreviations whose bodies are,
definitionally, the five frozen `SOLUTION-CONTRACT.md` §2 declarations
`forest_degree_lemma`, `forest_extension_inequality`, `forest_descent_linear_bound`,
`forest_rank5_ceiling_20`, `forest_descent_restriction`.

**The implication is the award; the targets are not.** Nothing here asserts (DL), (EX), (LB),
(R5) or (XR). All four consequents remain `conditional` until an unconditional (DL) lands
(award `C1-LA1`). This fence travels on every face of the award.

**Instance caveat (critic `C-U3-F`, load-bearing).** The hypothesis `DlHyp` quantifies over
carrier types *and over `Fintype`/`DecidableEq`/`DecidableRel` instances*. A proof of (DL) at
one fixed `Fintype` instance would not compose with this chain. The elaborated type in
`EVIDENCE/elaborated-types.txt` shows the instance binders explicitly.

## 1. The five statements (`SOLUTION-CONTRACT.md` §2, verbatim as `Prop`s)

With the G1 definitions of record `Erdos993G1.indepCount`, `coeff`, `delta` (carried
byte-identically from the r25 award source) and the run-local `indepDegreeSum`, `e`,
`firstDescent`:

| Key | `Prop` | Statement |
|---|---|---|
| (DL) | `DlHyp` | every finite forest `G`, every `k`: `D_k(G) ≤ 2k · i_k(G)` in `ℤ` |
| (EX) | `ExHyp` | every finite forest, every `k`: `n · i_k ≤ (k+1) i_{k+1} + 3k · i_k` in `ℤ` |
| (LB) | `LbHyp` | every finite forest, every `k`: `Δ_k(G) < 0 ⇒ n ≤ 4k` |
| (R5) | `R5Hyp` | every finite forest: `21 ≤ n ⇒ 0 ≤ Δ_5(G)` |
| (XR) | `XrHyp` | every finite forest, every `r`: `x(G) < r ⇒ n ≤ 4r − 4` |

`n` is `Fintype.card X` in (DL)/(EX) and `Nat.card X` in (LB)/(R5)/(XR), exactly as §2 states
them; `x(G)` is `Erdos993G1.firstDescent G`.

**Anti-drift test of record** (synthesis carry condition (ii)): the registered source contains
five `example`s, each taking the §2 declaration *in its own binder form, written exactly as §2
writes it* as a hypothesis and producing the corresponding `Prop`. These are kernel-checked
conversions, so no abbreviation can drift from its §2 statement without the file failing to
compile. The elaborated types are recorded in `EVIDENCE/elaborated-types.txt`.

## 2. The proof, statement by statement

### 2.1 (DL) ⇒ (EX) — `Erdos993G1.ex_of_dl`

Fix a finite type `X` with `[Fintype X] [DecidableEq X]`, a graph `G` with `[DecidableRel G.Adj]`,
an acyclicity witness `hG`, and `k : ℕ`.

1. **Extensions.** For `J : Finset X`, `closedNbhdFinset G J := J ∪ ⋃_{u ∈ J} N(u)`,
   `extensionFinset G J := univ \ closedNbhdFinset G J`, and `e G J := #(extensionFinset G J)`.
   `mem_extensionFinset_iff`: `v ∈ extensionFinset G J ↔ v ∉ J ∧ ∀ u ∈ J, ¬ G.Adj v u`.
2. **Insertion / erasure.** `isNIndepSet_insert_of_mem_extensionFinset`: if `J ∈ I_k` and
   `v ∈ extensionFinset G J` then `insert v J ∈ I_{k+1}`.
   `isNIndepSet_erase_and_mem_extensionFinset`: if `J' ∈ I_{k+1}` and `u ∈ J'` then
   `J'.erase u ∈ I_k` and `u ∈ extensionFinset G (J'.erase u)`. *(No acyclicity.)*
3. **The double count.** `sigma_card_double_count`: `(J, v) ↦ (insert v J, v)` is a bijection
   `Σ_{J ∈ I_k} extensionFinset G J ≃ Σ_{J' ∈ I_{k+1}} J'` with inverse
   `(J', u) ↦ (J'.erase u, u)` (`Finset.card_bij'`). Since every member of `I_{k+1}` has
   cardinality `k+1` (`sum_card_indepSetFinset_succ`), `sum_e_eq_succ_mul_card` gives
   `Σ_{J ∈ I_k} e(J) = (k+1) · #I_{k+1}` in `ℕ`, and `double_count` its `ℤ` form
   `(k+1) · i_{k+1}(G) = Σ_{J ∈ I_k} e(J)`. *(No acyclicity; graph-general.)*
4. **The per-`J` bound.** Every vertex of `N[J]` is in `J` or a neighbour of some `v ∈ J`, so
   `#(closedNbhdFinset G J) ≤ #J + Σ_{v ∈ J} deg(v)` (`card_closedNbhdFinset_le`, by
   `Finset.card_union_le` and `Finset.card_biUnion_le`). Because
   `#(extensionFinset G J) + #(closedNbhdFinset G J) = n`, this is the subtraction-free
   `e(J) + #J + Σ_{v∈J} deg(v) ≥ n` (`e_add_card_add_degreeSum_ge`), whose `ℤ` form for
   `J ∈ I_k` is `e(J) ≥ n − k − Σ_{v∈J} deg(v)` (`e_ge_sub`). *(No acyclicity.)*
5. **Summation.** Summing 4 over `J ∈ I_k` and using 3,
   `n · i_k − k · i_k − D_k(G) ≤ (k+1) · i_{k+1}`, where
   `D_k(G) = Σ_{J ∈ I_k} Σ_{v ∈ J} deg(v) = indepDegreeSum G k`. Feeding the (DL) hypothesis
   `D_k ≤ 2k · i_k` at this same `k` gives `n · i_k ≤ (k+1) i_{k+1} + 3k · i_k`, which is
   (EX) (`forest_extension_inequality`).

**This is the only place acyclicity is used**, and it is used only by being handed to the
hypothesis: `ex_of_dl` calls `hDL G hG k`. Steps 1–4 are unconditional facts about finite
graphs.

### 2.2 (EX) ⇒ (LB) — `Erdos993G1.lb_of_ex`

Fix `[Finite X]`, `G`, `hG : G.IsAcyclic`, `k`, and `hneg : Δ_k(G) < 0`. Work at the `Fintype`
instance `Fintype.ofFinite X` (the `[Finite]`/`[Fintype]` seam; the method is critics
`C-U3-T` / `C-U3-F`, carry rows 15 and 16).

1. `delta_nat`: `Δ_k = i_{k+1} − i_k`, so `hneg` says `i_{k+1} < i_k`.
2. `pos_indepCount_of_delta_neg`: `i_{k+1} ≥ 0` (it is a cast `Nat.card`), hence `0 < i_k`.
3. `hEX G hG k` gives `n · i_k ≤ (k+1) i_{k+1} + 3k i_k`. With `i_{k+1} ≤ i_k − 1` and
   `k + 1 > 0`, `(k+1) i_{k+1} ≤ (k+1)(i_k − 1)`, so
   `n · i_k ≤ (k+1)(i_k − 1) + 3k i_k < (4k+1) i_k`.
4. Cancelling the strictly positive factor `i_k` (`lt_of_mul_lt_mul_right`) gives `n < 4k + 1`
   in `ℤ`, i.e. `n ≤ 4k`, and `exact_mod_cast` returns to `ℕ`.

Acyclicity is again only threaded into the hypothesis (`hEX G hG k`). The case `k = 0` is
included: `Δ_0 < 0` forces `i_1 < i_0` and `0 < i_0`, and the same computation yields `n ≤ 0`.

### 2.3 (LB) ⇒ (R5) — `Erdos993G1.r5_of_lb`

Contrapositive at `k = 5`. Suppose `21 ≤ n` and, for contradiction, `Δ_5(G) < 0` with `5 : ℤ`
the integer literal. The **cast bridge** `((5 : ℕ) : ℤ) = (5 : ℤ)` (`exact_mod_cast`) turns
this into the `ℕ`-indexed hypothesis `LbHyp` consumes; `LbHyp` then gives `n ≤ 4 · 5 = 20`,
contradicting `21 ≤ n` (`omega`).

### 2.4 (LB) ⇒ (XR) — `Erdos993G1.xr_of_lb`

Apply `LbHyp` at `k := firstDescent G`. `firstDescent G` is `Nat.find` of
`exists_delta_neg G`, so `delta_firstDescent_neg` gives `Δ_{x(G)}(G) < 0` and `LbHyp` gives
`n ≤ 4 · x(G)`. With `hx : x(G) < r` we have `x(G) ≤ r − 1`, hence `n ≤ 4r − 4` (`omega`,
which handles the `ℕ` truncation correctly; see §4).

### 2.5 The chain — `Erdos993G1.degree_lemma_implies_chain`

`hEX := ex_of_dl hDL`, `hLB := lb_of_ex hEX`, and the conjunction
`⟨hEX, hLB, r5_of_lb hLB, xr_of_lb hLB⟩`.

## 3. Where each hypothesis enters

| Hypothesis | Enters at | Consumed by |
|---|---|---|
| `G.IsAcyclic` | **exactly once**, as the argument of the (DL) hypothesis in `ex_of_dl` (`hDL G hG k`); thereafter it is only forwarded into `hEX`/`hLB` | nothing unconditional |
| `[Fintype X]`, `[DecidableEq X]`, `[DecidableRel G.Adj]` | every `Finset` computation: `indepSetFinset`, `neighborFinset`, `closedNbhdFinset`, `extensionFinset`, `indepDegreeSum` | §2.1 steps 1–5 |
| `[Finite X]` | (LB), (R5), (XR) and `exists_delta_neg`/`firstDescent` | bridged to `[Fintype X]` by `Fintype.ofFinite` inside `exists_delta_neg`, `pos_indepCount_of_delta_neg` and `critic_lb_of_ex` |
| `Δ_k(G) < 0` | (LB) | §2.2 steps 1–2 |
| `21 ≤ Nat.card X` | (R5) | §2.3 |
| `firstDescent G < r` | (XR) | §2.4 (and it forces `1 ≤ r`) |

No `α`/`hyp-alpha` side condition appears anywhere; no statement carries a hypothesis it does
not need. In particular `double_count` and `e_ge_sub` carry **no** acyclicity binder, as the
synthesis requires of the `C1-LA2` counting core.

## 4. ℕ/ℤ cast audit

1. `Erdos993G1.indepCount : ℤ` by definition (`(Nat.card {S // G.IsNIndepSet k S} : ℤ)`); it is
   nonnegative, and that is re-proved where needed from
   `indepCount_eq_card_indepSetFinset` plus `Nat.zero_le`. Nonnegativity is never assumed.
2. `indepDegreeSum : ℕ`; it appears in (DL) only under an explicit `ℤ` cast
   `(indepDegreeSum G k : ℤ)`. `e G J : ℕ`, cast to `ℤ` in `double_count` and `e_ge_sub`.
3. (EX) is stated **subtraction-free** (`n · i_k ≤ (k+1) i_{k+1} + 3k i_k`): the informal
   `n − 3k` is never formed. The only subtraction in the (EX) derivation is `ℤ` subtraction in
   `e_ge_sub`, obtained from the subtraction-free `ℕ` statement
   `e(J) + #J + Σ deg ≥ n` by `push_cast`/`linarith`, not by `ℕ` truncation.
4. `k + 1` inside `indepCount G (k + 1)` is `ℕ` addition; `(k + 1)` as a coefficient is
   `((k : ℤ) + 1)`. The elaborated types in `EVIDENCE/elaborated-types.txt` show both
   (`Erdos993G1.indepCount G (k + (1 : ℕ))` versus `(↑k + (1 : ℤ))`), matching §2.
5. **(R5) cast bridge.** `delta` is indexed by `ℤ`; (R5) is stated at the literal `(5 : ℤ)`,
   while (LB) is stated at `((k : ℕ) : ℤ)`. `exact_mod_cast` supplies
   `((5 : ℕ) : ℤ) = (5 : ℤ)`. This is the `(5:ℤ)`/`((5:ℕ):ℤ)` bridge the synthesis names.
6. **(XR) ℕ truncation.** `4 * r - 4` is truncated `ℕ` subtraction. For `r ≥ 1` — which
   `firstDescent G < r` forces — it is ordinary arithmetic and the bound is the intended one.
   At `r = 0` the hypothesis `firstDescent G < 0` is unsatisfiable, so the statement is
   **vacuous-hypothesis-sound**: it asserts nothing there, and the `4 * 0 - 4 = 0` truncation
   is *not* being claimed as correct arithmetic. `omega` discharges the step with the
   truncation semantics made explicit to it.
7. `Nat.card X` versus `Fintype.card X`: bridged by `Nat.card_eq_fintype_card` at the single
   point where (EX) (stated with `Fintype.card`) feeds (LB) (stated with `Nat.card`).

## 5. Carry table

Every carried body is cited with its origin file and full SHA-256. **No external Lean text was
read or carried** (Gate ruling 3): `sources/external/lean-source/` is not a member of this
capsule and this seat never opened it. Rows 10–16 are **critic-attributed** and rows 17–19
**adjudicator-attributed**; they are not seat work, and that travels on every face.

### 5.1 Byte-identical carries

| Registrar entry | Declaration(s) | Origin | Origin SHA-256 |
|---|---|---|---|
| 1 | `Erdos993G1.indepCount` | r25 award source, registrar entry 1 | file `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0`; entry `5484fc21ffce7bf707240da15858d7d82289f8e6f286a8fa9837cd9a0c474ccb` |
| 2 | `Erdos993G1.coeff` | r25 award source, entry 2 | entry `211900436b28e4a685af60df26a20e8fe254fd4c9479c12ba2863fa180c1a639` |
| 3 | `Erdos993G1.delta` | r25 award source, entry 3 | entry `bdb46014d98507a7c85cc8de0b806f80c04496479795e28677dde024e216b9ee` |
| 4 | `closedNbhdFinset`, `extensionFinset`, `e`, `indepDegreeSum` | carry row 9 (`C1-U-03`), `U3-Extension.lean` lines 16–37 | `116b4f313eedfe4210173226c2f5ef877a6e1ee07061888f4106e908ba6b08a6` |
| 9 | `firstDescent` | carry row 9, lines 292–297 | `116b4f31…b6ba08a6` |
| 10 | `Erdos993G1.indepCount_eq_card_indepSetFinset` | r25 award source, entry 4 | entry `4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac` |
| 11 | `Erdos993G1.coeff_nat` | r25 award source, entry 5 | entry `df2c55481b6ddf4fc4fcce445b787573fca53c0f4fb7599f0e1f5b3330f36da1` |
| 12 | `Erdos993G1.delta_nat` | r25 award source, entry 6 | entry `c063c49584d30c5e9e7761596f1f323212ddb803b56bea9b3fd8b0027ad38077` |
| 13 | `mem_extensionFinset_iff`, `isNIndepSet_insert_of_mem_extensionFinset`, `isNIndepSet_erase_and_mem_extensionFinset`, `sigma_card_double_count`, `sum_card_indepSetFinset_succ`, `sum_e_eq_succ_mul_card`, `double_count`, `card_closedNbhdFinset_le`, `e_add_card_add_degreeSum_ge`, `e_ge_sub`, `forest_extension_inequality` | carry row 9, lines 39–244 | `116b4f31…b6ba08a6` |
| 14 | `delta_firstDescent_neg` | carry row 9, lines 299–302 | `116b4f31…b6ba08a6` |
| 16 | `critic_lb_of_ex` | carry row 10 (critic `C-U1-T`), `C-U1-T-CriticAdvances.lean` lines 179–209 | `41dae810663a4ae1c680afac7bacc0824351f94858e89f5da32fdd51c112515a` |
| 17 | `critic_r5_of_lb` | carry row 10, lines 211–218 | `41dae810…1c112515a` |
| 18 | `critic_xr_of_lb` | carry row 10, lines 220–226 | `41dae810…1c112515a` |

The r25 entries 1–6 were registered through the registrar and their entry digests **reproduce
the originals' exactly** — recorded declaration by declaration in `CAPSULE-VERIFICATION.json`
(`g1_entries_registered_byte_identically`). **No G1 definition is re-stated.**

Section, namespace and `variable` wrappers are context, not bodies (R2); the carried bodies
sit inside `namespace Erdos993G1` in this run, so `critic_lb_of_ex`, `critic_r5_of_lb` and
`critic_xr_of_lb` acquire that namespace prefix.

### 5.2 Re-derived in-run (with the reason)

| Declaration | Why re-derived |
|---|---|
| `exists_delta_neg` | Row 9's proof calls the r25 `lemma` layer, which the registrar orders after every `definition`, while `firstDescent` is a `definition`. The in-run proof is self-contained on Mathlib and the three G1 definitions: `i_0 > 0`, `i_{n+1} = 0`, and a monotone chain if no `Δ_k` were negative. By **definitional proof irrelevance** `Nat.find` does not depend on which proof of the existential is supplied, so `firstDescent` is the *same function* as row 9's and U1's — which is exactly why carry row 19 (U adjudicator) proves the two equal by `rfl`. |
| `pos_indepCount_of_delta_neg` | The name row 10's body calls. It was first stated in U1's file, carry row 6 (`sources/c1-stage7-sources/U1-Main.lean`, SHA-256 `8cc381f413e6b5533995a362f4f38f4930d99119e8eece9a5f1cc323a62dea0d`), which **is** a member of this capsule and was read. Row 6 is **not** on the brief's byte-identical carry list (R7 names rows 9, 10, 11, 12, 15, 16, 19), and the synthesis's carry condition (i) admits U1's file as statements of record only; so the NAME is taken from row 6 and the BODY is written here, from `delta_nat` and the nonnegativity of `indepCount`. U1's own body is stated at `{V : Type v}` with no finiteness binder; this one is stated at the `[Finite X]` carrier that row 10's `critic_lb_of_ex` works in. |
| `firstDescent_spec` | The name row 10's `critic_xr_of_lb` calls, again row 6's (same file and digest; a capsule member, read, but not on R7's byte-identical carry list). U1's body there is `Nat.find_spec (Erdos993G1.firstDescent_exists G)`, against U1's own `firstDescent` and `firstDescent_exists`, neither of which this run registers — the definition of record here is row 9's — so that body could not have been carried in any case. Re-derived as an alias of row 9's `delta_firstDescent_neg`. |
| `DlHyp`, `ExHyp`, `LbHyp`, `R5Hyp`, `XrHyp` | Authored in-run from the frozen `SOLUTION-CONTRACT.md` §2 statement texts, as the brief's §2 prescribes. |
| `ex_of_dl`, `lb_of_ex`, `r5_of_lb`, `xr_of_lb`, `degree_lemma_implies_chain`, the five anti-drift `example`s | Authored in-run (the `Prop`-to-`Prop` wrappers and the chain). |

### 5.3 Carry rows available but **not** used

Rows 6 (seat U1), 11 and 12 (critic `C-U1-F`), 15 (critic `C-U3-T`), 16 (critic `C-U3-F`) and 19
(U adjudicator) are members of the capsule but no body of theirs is used, so nothing of theirs is
carried. (Row 6 additionally is not on R7's byte-identical carry list, and carry condition (i)
admits its five targets as statements of record only.) They remain load-bearing as *evidence*,
and are cited as such:

- Row 6 is where `pos_indepCount_of_delta_neg` and `firstDescent_spec` were first stated; this
  run takes those two NAMES from it and writes the bodies itself (§5.2).

- Row 11's `crit_LB_of_EX` is an **independent second derivation** of the same (EX) ⇒ (LB)
  step compiled here from row 10; row 12 closes (LB) unconditionally at `k = 0, 1`.
- Rows 15 and 16 are the source of the `[Fintype]`/`[Finite]` seam method (`Fintype.ofFinite`)
  used inside the carried row-10 bodies, and row 16 is the origin of the instance caveat in §0.
- Row 19 is the `firstDescent` reconciliation (`rfl`) relied on in §5.2.

## 6. Attributions and excluded conclusions

**Attribution** (`SOLUTION-CONTRACT.md` §3.7; travels on every face):

- Fang–Lu–Nevo–Yao–Zheng 2026, §8 (Lemma 8.1 / (8.3) and Proposition 8.2's displayed step) for
  the mathematics of (DL) and (EX).
- The literature map (FRESH-LEAD, lane 11) for the conditional deductions (LB), (R5), (XR).
- r27 critics `C-U1-T`, `C-U3-T`, `C-U3-F`, `C-U1-F` and r27 seat U3 for the derivations
  carried and used here; the U adjudicator for the `firstDescent` reconciliation by `rfl`
  (row 19).
- No external Lean text is carried or published; every Lean line of this run is authored
  in-run or carried from an in-run seat/critic/adjudicator artifact or the frozen r25 award
  source.

**Excluded conclusions** (`SOLUTION-CONTRACT.md` §3, the brief's §2 fences):

1. No no-recovery reading. (LB)/(R5)/(XR) are **order bounds** whose contrapositives have sign
   `Δ_k ≥ 0`. No status transfers to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`,
   NR1, FOREST, TREE, TRANSFER, `E993-BETA-AGG` or Erdős #993.
2. Nothing asymptotic: no `N₀`, no CLT, no unimodality claim.
3. (DL) is an **average** over `I_k`; no pointwise degree statement is registrable, and none is
   stated here.
4. (XR) is **not** a uniform bound on `d`, and its `r = 0` truncation is
   vacuous-hypothesis-sound, not correct arithmetic (§4.6).
5. No tightness claim for (DL) or for `4k`. The r25 award
   `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (`Δ_k < 0 ⇒ n ≤ (k+1)²`, `k ≥ 1`) stays
   registered at its own statement; the comparison `4k ≤ (k+1)²` is a comparison, not a
   supersession, and this award proves nothing about it.
6. The four consequents are `conditional`. This award's grade is `formally_verified` **as
   implications** only.
7. Sealed r25/r26 records are never edited.
8. `E993-R25-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` (REFUTED) is not a premise anywhere.

## 7. Axioms and completeness

Every one of the 39 declarations in `LeanProject/LeanProof/Main.lean` depends on exactly
`[propext, Classical.choice, Quot.sound]` (`EVIDENCE/axioms-all-declarations.txt`); the
terminal declaration's line is `EVIDENCE/axioms.txt`, written before kernel verification. The
source contains no `sorry`, `admit`, `native_decide` or `axiom`, and no `decide` over an
enumeration stands in for a universal step.
