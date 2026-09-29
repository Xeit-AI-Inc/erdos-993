# Second Read

**Read:** `R31-SR-C4-2` (N2: the E1 spec on `cbGraph m`), r31 Cycle 4, isolated second read, 2026-09-29.
**Reader:** Claude Opus 5.5, chartered effort high.

**Boot.** I am operating within VerityOS under the brief's restricted boot. I read exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the brief and the
binding protocol. I loaded no other VerityOS subsystem file. The host auto-injected the root `CLAUDE.md` and the user auto-memory index
into context. I did not act on either, and I disclose them here.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Brief.** `control/C4-SECOND-READ-BRIEF-R31-SR-C4-2.md`: SHA-256 `6fa3b2d30ea7b6c327003b90a6f5aafab577fac62bdfbeb6830830b2da4f7fc2`.
  This matches the value given at invocation.
- **Protocol.** `control/C4-SECOND-READ-PROTOCOL.md`: `eb175f41e1d9b563f09535785a2fb0d0e3ad0491632dfb431f1748b7e7026277`. This matches
  its manifest entry.
- **Capsule seal.** `control/c4-second-read/R31-SR-C4-2-PACKET-MANIFEST.json` (run `erdos-993-math-dre-20260927-r31-cb-uniform-switch`,
  stage `cycle-4-second-read-R31-SR-C4-2`). I recomputed the seal as the SHA-256 of the compact, key-sorted JSON without
  `seal_sha256` and with no trailing newline: `5afa3bb9b5dbd6db1775875b923545846e7eb25e12f599148904b0da4d64d4a0`. **This matches.**
- **Members.** All 270 listed files match on both SHA-256 and byte count (`file_count` 270; 0 missing, 0 mismatches).
- **Source digests.** Every member under `sources/c4-stage7-sources/`, `sources/c4-base/` and `sources/c3-results/` (247 files) also
  matches its entry in that tree's `SOURCE-DIGESTS.json` (0 mismatches, 0 missing entries). I checked this before reading.
- **Frozen text.** `control/C4-FROZEN-STATEMENTS.lean` (`0fc723d7…39ede1`) is byte-identical to
  `sources/c4-base/LeanProject/LeanProof/Statements.lean` (by `diff`).
  - U1's `Statements.lean` (`75388bec…`) is byte-identical across its three copies (`c4-U1`, `c4-crit-U1-F`, `c4-crit-U1-T`).
  - U1's copy differs from the frozen file only in the following:
    - an added `import LeanProof.C3LA1` and its comment;
    - the proof bodies of `cbOpenChokeCount_le` and `cb8N_sum_eq_cb8R`;
    - the inserted helper `cb8N_eq_e1S_natCast`;
    - the N2 body `refine ⟨sorry, shape, sorry, sorry, zero-lemmas⟩`.

  **No statement text is touched.**

## Statements read

- **R31-SR-C4-2a, `cb8N_sum_eq_cb8R (a b : ℕ) (k : ℤ)`.** The statement is
  `∑ α ∈ range (a+1), cb8N a b α k = cb8R a b k` (frozen line 88).
  - Proof text: U1's body plus U1's bridge `cb8N_eq_e1S_natCast`.
  - Governed inputs: C3-LA1 entry 31 `e1S_sum_eq_coeff`, and the carried `polyCoeffZ_of_neg` / `polyCoeffZ_natCast` (C1-LA3).
  - Base input: `cb8R_natCast_eq_coeff`, which is in-file base scratch.
- **R31-SR-C4-2b, `cb8E1Arc_spec_topRank`, clauses (1)–(5).** This is frozen lines 98–115, at
  `p = (16m+4)/3` and `F = favorableLeaves (cbGraph m) p`.
  - Proof text: C-U1-F's `CritU1F.lean` (`459e9f67…`), in particular the following:
    - §1: the bridges;
    - §2: `crit_cb8E1Val_nonneg` and `crit_cb8E1Arc_spec_clause1`;
    - §3: `crit_row_value` and `crit_column_value`;
    - §4: `crit_cb8E1Arc_spec_clause3`;
    - §4b: `crit_cb_tagWitness_root_or_choke` and `crit_cb8_nonChokeInsert_weight`, i.e. B3;
    - §5: `crit_cb8E1G_zero` and `crit_cb8E1Arc_spec_clause4`;
    - §6: the assembly `crit_cb8E1Arc_spec_topRank_modN1`.
  - Clauses (2) and (5) come from Cycle 3 U2's base lemmas `cb8E1Arc_shape`, `cb8E1Arc_zero_of_root_mem` and
    `cb8E1Arc_zero_of_no_open_choke`, as `E1FlowConstruction.lean` copies them.
  - Governed inputs:
    - C3-LA1 entries 30, 31, 33, 34, 40, 44, 49, 50 and 51;
    - C2-LA3's terminal `cb8_favorableLeaves_eq_leafSet_topRank` (base entry 606; I read its statement).
  - Open frozen inputs: exactly N1's B1 `cb8_rFree_deletionClasses` and B2 `cb8_rFree_insertionClasses`, as statements.
  - I read the Lean texts as mathematics, case by case. I did not rebuild them, and I cite no replay as evidence.

## Independent re-derivation

### 2a: the (E) identity and the bridge

The frozen definitions are:
- `cb8N a b α k = [α ≤ a ∧ (α:ℤ) ≤ k ∧ k−α ≤ b]·C(a,α)·C(b,(k−α).toNat)·2^{(k−α).toNat}`, in ℚ;
- `cb8R a b k = ((polyCoeffZ ((1+X)^a(1+2X)^b) k : ℤ) : ℚ)`, where `polyCoeffZ p i = if i < 0 then 0 else p.coeff i.toNat`.

The identity holds in two cases.
- **Case `k < 0`.** Every summand's guard needs `(α:ℤ) ≤ k < 0 ≤ α`, so every summand is 0. The right side is 0 by
  `polyCoeffZ_of_neg`. Both sides are 0.
- **Case `k = n ≥ 0`.** The bridge gives `cb8N a b α n = e1S a b n α` pointwise.
  - If `α > n`, both guards fail and both sides are 0.
  - If `α ≤ n` and both of `cb8N`'s extra guards hold, the two sides are the same product: `toNat(n−α) = n−α`, and the cast is
    handled by `push_cast; ring`.
  - If `α ≤ n` and an extra guard fails, then either `a < α` or `b < n−α`. The corresponding binomial vanishes
    (`Nat.choose_eq_zero_of_lt`), so `e1S = 0` as well.

  With the bridge in hand:
  - the sum over `range (a+1)` equals `Σ e1S = ((coeff n : ℤ) : ℚ)` by C3-LA1 entry 31;
  - that equals `cb8R a b n` by `cb8R_natCast_eq_coeff`.

The index convention is fixed: `α ∈ ℕ` ranges over `range (a+1)`, and `k : ℤ` is zero-extended. The cast chain `ℕ → ℤ → ℚ` is the same
on both sides.

**The bridge to C3-LA1 (used by 2b).** The following hold for `n ≥ 1`:
- `cb8N a b α ((n:ℤ)−1) = e1T a b n α`, through `(n:ℤ)−1 = ((n−1:ℕ):ℤ)` and entry 30 `e1T_eq_e1S_pred`;
- `cb8Rho a b n = e1Rho a b n`, through entry 33;
- hence `cb8E1G = e1G` and `cb8H = e1H`, after unfolding (`cb8H` has the `Σ_{α'≤α}` form and `e1H = S_α − G_α`; they agree by
  `sum_range_succ`).

`1 ≤ n` is load-bearing, and it holds on the class: `j = p* − q ≥ p* − m ≥ 1`.

### 2b: the five clauses

Put `q = cbOpenChokeCount m B` and `w = activeWeight F B`. In the nonzero branch, put `a = 8q−1`, `b = 8(m−q)+1`, `j = p*−q` and
`α = w−1`.

**ℕ-safety.** Every truncated subtraction is guarded or proved safe:
- `8q−1` is exact once `q ≥ 1`; the `q = 0` branch returns 0 unconditionally.
- `m−q` and `(16m+4)/3−q` are exact because `q ≤ m` (`cbOpenChokeCount_le`, a `card_filter_le` bound) and `m < p*`.
- `w−1` is exact once `w ≥ 1`; the `w = 0` branch returns 0.
- `j−α` is taken in ℤ. Its sign is handled by `cb8N`'s guard `(α:ℤ) ≤ j`: when `α > j`, `cb8N = 0` and the value is `x/0 = 0`.
- In clause (4), the ℕ expressions `b−(n−1−α)` and `(8q−1)−(w−1)` are equalities that `omega` derives from B1 and B2's
  subtraction-free counts.

**Clause (1), nonnegativity.** `cb8E1Arc` is either 0 or `Σ_{z∈B\A} cb8E1Val`, so it suffices that every value is `≥ 0`.
- The value is 0 when `w = 0`, `q = 0`, or `z` is a choke.
- **Boolean branch.** The value is `G_α/N_α`.
  - If `α > a`, then `N_α = 0` by the guard, and the value is 0.
  - Otherwise, through the bridges, it is `e1G/e1S` with `e1G ≥ 0` (entry 49). That lemma needs `α ≤ a` and `ΣT > 0`, and entry 34
    gives `ΣT > 0` on `1 ≤ j ≤ a+b+1 = 8m+1`. `e1S ≥ 0` holds by definition.
- **Ternary branch.** The value is `w·H_α/((j−α)·N_α)`.
  - If `α > a` or `α > j`, then `N_α = 0` and the value is 0.
  - Otherwise the numerator is `≥ 0` (entry 50) and the denominator is `≥ 0`, because `j−α ≥ 0` and `e1S ≥ 0`.
- **Class inputs.** Only `m+1 ≤ p* ≤ 8m+1`, which holds for every `m ≥ 1`, and `q ≤ m`.

  No B1, B2 or B3 input is used. The one N1-labelled input is the companion `cbOpenChokeCount_le`; see Findings F1.

**Clause (2), support.** From `cb8E1Arc_shape`:
- a nonzero value forces the guard `B ∈ I_{p+1}`, `r ∉ B`, `A ⊆ B`, `|B\A| = 1`;
- `exists_erase_of_sdiff_card_one` gives `A = B.erase x`;
- `A ∈ I_p` follows by `IsIndepSet.mono` and a card count.

This is correct and unconditional.

**Clause (3), rows on `r`-free sources.**
- **Selector.** C2-LA3's governed terminal rewrites `F` to `leafSet`. The selector is derived, not assumed.
- **Reindexing.** The row over `A ∈ I_p` equals `Σ_{z∈B} cb8E1Val B z`. Each `B.erase z` is in `I_p`, `erase` is injective on `B`, and
  every other `A` fails the guard.
- **Classes from B1** (tag set `leafSet`). The vertices of `B` split as follows:
  - chokes: value 0;
  - active non-chokes: `Act z = z ∈ L ∧ (B.erase z) ∩ W_z ≠ ∅`. This is exactly `cb8E1Val`'s Boolean test, so the value is `G_α/N_α`.
    B1 gives their count as `w`;
  - the remaining `ℓ` vertices: value `w·H_α/((j−α)N_α)`, with `q + w + ℓ = p*+1`, `w ≤ 8q` and `ℓ + 8q ≤ 8m+1`.
- **Degenerate sources.**
  - `w = 0`: every value is 0, and the row is `0 = w`.
  - `q = 0`: B1's `w ≤ 8q` forces `w = 0`, which is the previous case.
- **Nondegenerate sources.** `ℓ + α = j`, `α ≤ a` and `ℓ ≤ b`. The Boolean denominator is `N_α = e1S_α > 0`, since `α ≤ a`, `α ≤ j` and
  `j−α = ℓ ≤ b`. The row is `w·G/S + ℓ·(w·H/((j−α)·S))`.
  - **`ℓ ≥ 1`.** Then `j−α = ℓ ≠ 0`, so the denominator `ℓ·S_α` is nonzero. The row is `w(G+H)/S = w`, by the rows identity
    `G + H = S` (entry 40, definitional).
  - **`ℓ = 0`, so `α = j`.** The ternary term is `0·(x/0) = 0`. The row closes by `e1_saturation` (entry 44): with `j = α ≤ a` and
    `ΣT ≠ 0`, it gives `G_j = S_j`, so the row is `w·S/S = w`.
  - **Liveness of `ℓ = 0` on the class.** It requires `w = p*+1−q ≤ 8q`, i.e. `q ≥ ⌈(p*+1)/9⌉`.
    - At `m = 107` (`p* = 572`): `⌈573/9⌉ = 64`, so the case is **live for every `q ≥ 64`**.
    - My instrument found the least such `q` to be 64 at 107, 66 at 110, 68 at 113 and 96 at 161.
    - My literal instrument realized an `ℓ = 0` source at `q = 64`, `m = 107`.

**Clause (4), columns on `r`-free targets with `q ≥ 1`.**
- **Reindexing.** The column equals `Σ_{z∈U} cb8E1Val (insert z A) z`, with `U = {z ∉ A, z ≠ r, insert z A independent}`.
  - B2 conjunct 1 puts every image in `I_{p+1}`.
  - Insertion is injective on `z ∉ A`.
  - Any guarded `B` is `insert x A` with `x ∈ U`.
- **Chokes** give 0.
- **Non-chokes.** `q(insert z A) = q` (base lemma), and `w(insert z A) = w + [Act z]`, which is B3, proved by C-U1-F.
  - B3's key fact is that every tag witness of a CB leaf is `r` or a choke (entries 69/70 with the leaf classification), so a non-choke
    `z ≠ r` never activates another leaf.
  - B3's inclusion/exclusion over the filter is correct.
- **Boolean up-covers** (`Act z`). The source weight is `w+1` and the type is `α+1 = w`; the value is `G(w)/N(w)`. There are
  `8q−w = a−α` of them, by B2 conjunct 2.
- **Ternary up-covers.** The source weight is `w`; the value is `w·H(w−1)/((j−(w−1))·N(w−1))`, or 0 if `w = 0`. B2 conjunct 3 gives
  `16m+2−16q−2ℓ' = 2(b−ℓ')` of them. B1 on `A` gives `q + w + ℓ' = p*`, so `ℓ' = j−1−α`.
- **The `w_A = 0` case.** Every ternary value is 0, since the source weight is 0. Every Boolean value is `cb8E1G(·,·,j,0)/N = 0`,
  because both prefix sums are empty (`crit_cb8E1G_zero`). The column is `0 = ρ·0`, which is correct.
- **The `w ≥ 1` case.** The literal column is exactly `(α+1) ×` C3-LA1's `e1_column_inflow_clone` (entry 51) expression.
  - That lemma needs `α ≤ a`, `ΣT ≠ 0` and `T_α = e1S(j−1, α) > 0`. The last holds by `α ≤ a`, `α ≤ j−1` and `j−1−α = ℓ' ≤ b`.
  - I checked all four `if`-branches.
    - In the non-degenerate branch, `S_{α+1}` and `S_α` are nonzero (`α+1 ≤ a`, `α+1 ≤ j`, `j−(α+1) = ℓ' ≤ b`; and `j−α ≤ b` from
      `ℓ' < b`), and `(j−α) ≠ 0`.
    - In the degenerate branches (`α = a`, or `ℓ' = b`), the literal count factor (`a−α` or `b−ℓ'`) is 0, exactly where the clone
      lemma's `if` returns 0.
  - The index of `ρ` is `((p*−q : ℕ) : ℤ)`, matching the frozen text's `(((16m+4)/3 − q : ℕ) : ℤ)` after `rw [← hp]`.

**Clause (5), zero columns.**
- `r ∈ A`: the guard needs `r ∉ B ⊇ A`, so every arc is 0.
- `q(A) = 0`: for `B = insert x A`, either `x` is a choke (value 0), or `q(B) = q(A) = 0` (value 0).

Both are correct and unconditional.

**Conclusion of the derivation.** The five clauses hold on the class at `p*`, given exactly the frozen statements B1 and B2. The other
inputs are:
- B3 (proved in-file by C-U1-F);
- `cbOpenChokeCount_le` (U1);
- the base E1 layer;
- C2-LA3's terminal;
- C3-LA1's cone.

The informal argument is complete relative to B1 and B2. It uses no Newton, no Darroch, no asymptotics and no `θ*`. The endpoint
`m = 107` is included, since only `107 ≤ m` is used, through C2-LA3.

### My own numeric instrument (test only, fence 7; never proof)

The instrument is `scratchpad/c4-sr-R31-SR-C4-2/sr2_instrument.py`. It uses the standard library, exact integers and `Fraction`, and
Lean conventions (`toNat`, `x/0 = 0`, ℕ truncation). I wrote it from the Lean definitions. I did not use or read any seat or critic
script.

- **Part E, (E).** Side A is `cb8N`'s type sum. Side B is the coefficients of `(1+X)^a(1+2X)^b`, built by polynomial multiplication and
  by exact synthetic division by `(1+2X)` (the remainder is asserted to be 0), never by the binomial formula.
  - Small checks: 6,144 with `a, b ∈ [0,15]` and `k ∈ [−4, a+b+4]`. **0 failures.** The `range a` off-by-one mutant is caught 2,176
    times.
  - Class-scale checks: every `q ∈ [1,m]`, with `k ∈ {p*−q−1, p*−q, p*−q+1, −1, a+b+1}`, at `m = 107, 110, 161`. That is
    535 / 550 / 805 checks, **0 failures**.
  - Fixed point: `ρ_1` at `CB(8,95)/508` equals `1354839571516225/1361543988640524` exactly (SEMANTIC-CONTRACT §5).
- **Part V, value arithmetic at class rows**, with every type that is numerically feasible. At `m = 107, 110, 113`, every `q ∈ [1,m]`
  was checked. At `m = 161` the `q` values were sub-sampled: `q ≤ 6`, `q ≥ m−5`, `7 | q`, and the band of the `ℓ = 0` threshold.
  - Nonnegativity of both branch values for every `w ∈ [1, p*+2]`, which runs beyond N1's bound `w ≤ 8q` and exercises the guard
    alone: **0 negatives**.
  - Rows (`q+w+ℓ = p*+1`): 22,007 / 23,255 / 24,538 / 9,481, **0 failures**. The `ℓ = 0` rows number 44 / 45 / 46 / 17.
  - Columns (`q+w+ℓ' = p*`, `q ≥ 1`), against `ρ_q·w` with `ρ_q` from the polynomial: 22,030 / 23,279 / 24,563 / 9,488,
    **0 failures**. These include the `w_A = 0` columns: 40 / 41 / 43 / 14.
  - Mutants caught: dropping `w` from the ternary value (21,883 at 107), and shifting `ρ` to `j−1` (21,990 at 107).
- **Part L, the literal network.** Edges are transcribed from `cbEdge`. `leafSet` is the degree-1 vertices, and `W_v = N(s_v)∖{v}`.
  - **The selector is derived.** `i_{p*+1}(T−v) < i_{p*}(T−v)` by tree DP, for `v` and three `c`-leaves: all favorable at
    107, 110, 161 and 164. I then use `F = leafSet`; that step is C2-LA3's governed statement, not my instrument's.
  - Random and extremal `r`-free sources (`|B| = p*+1`) and targets (`|A| = p*`) were evaluated from the definitions alone. No N1 count
    is used: the row is `Σ_z cb8E1Val`, and the column sums over every insertable `z`. The modes were: random; `ℓ = 0`; `w = 0`;
    `w = 8q`; `ℓ = b`; `q = 1`; `q = m`.

    | Row | Sources | Targets | Row failures | Column failures | Negative values |
    |---|---|---|---|---|---|
    | 107 | 240 | 240 | 0 | 0 | 0 |
    | 110 | 120 | 120 | 0 | 0 | 0 |
    | 161 | 72 | 72 | 0 | 0 | 0 |
    | 164 | 72 | 72 | 0 | 0 | 0 |

    The `ℓ = 0` sources number 29 / 14 / 9 / 8; the least sampled `q` at 107 is 64. The `w = 0` targets number 22 / 12 / 6 / 7.
  - Clause (5) targets (`r ∈ A`, and `q = 0`): 40 / 20 / 12 / 12, **0 failures**.

## Findings and repairs

- **F1 (precision repair, 2b clause (1); wording only).** C-U1-F's A2 ("clause (1) **needs no N1 input at all**") is repeated by the U
  adjudication (ruling 1) and by the synthesis ((ii).5). It is inexact as a dependency statement.
  - `crit_cb8E1Val_nonneg` uses `cbOpenChokeCount_le`, the frozen **N1 companion**, to get `q ≤ m` and hence `1 ≤ p*−q`. C-U1-F's own
    text says so ("follows from `cbOpenChokeCount_le`").
  - Repaired wording: "clause (1) uses none of N1's B1, B2 or B3. Its only N1-labelled input is the companion `cbOpenChokeCount_le`
    (U1; `card_filter_le`)."
  - The mathematics is unaffected.
- **F2 (confirmed).** The ternary sign `j − α` is handled by `cb8N`'s guard `(α:ℤ) ≤ k`, never by a separate sign argument. This
  confirms C-U1-F A2 and strikes U1's "numerator nonnegativity" reduction as incomplete.
- **F3 (confirmed).** The clause (3) points C-U1-F raised all hold:
  - the `ℓ = 0` rows need `e1_saturation`, not `e1_rows_identity`, and the case is live on the class (`m = 107`, `q ≥ 64`);
  - the Boolean and ternary denominators are nonzero exactly in the nondegenerate branch;
  - zero-weight sources are closed by `cb8E1Val`'s first guard, and zero-choke sources by B1's `w ≤ 8q`.
- **F4 (confirmed).** Clause (4)'s `w_A = 0` case is closed by `crit_cb8E1G_zero`, where both prefix sums are empty, and by the
  weight-zero guard on ternary up-covers. C-U1-T identified the gap in U1's prose, and C-U1-F's compiled text closes it.
- **F5 (scope of dependency).** N2's proof rests on B1 and B2 **as statements**. R31-SR-C4-1 reads those; this read does not. The
  informal grade of 2b is therefore relative to B1 and B2 until R31-SR-C4-1 confirms them. B3 is proved inside C-U1-F's text, and I
  read it as correct.
- **F6 (fences).** Checked:
  - one rank `p*`, `d = 8`, the class only;
  - the selector derived through governed C2-LA3;
  - no Newton or Darroch: C3-LA1's nonnegativity comes from its likelihood-ratio lemmas, not from Darroch;
  - no asymptotic step and no `θ*`;
  - no (HALL) or aggregate claim; N2 asserts per-arc specs only;
  - nothing refuted is revived.

  My numeric sweeps are test only. No (WID) assertion applies, because nothing here is a network-level (HALL) or supply/capacity
  computation.
- **F7 (registry).** No key is proposed for N2 or for (E); the synthesis registers none. I checked the run-local snapshot (497 claims),
  the frozen master (491) and the concurrent master (510):
  - none contains a `cb8N_sum`/`cb8E1Arc`/E1-spec key;
  - the nearest key is r30's `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (generic existence under the
    criterion). I give a distinction row below, so that N2 is never aliased to it or used to regrade it.

## Registration text

```text
RECORD: R31-SR-C4-2a
CLAIM: For all natural a, b and every integer k, Σ_{α ∈ range(a+1)} cb8N a b α k = cb8R a b k, where cb8N a b α k = C(a,α)·C(b,k−α)·2^{k−α} when α ≤ a, α ≤ k and k − α ≤ b (else 0) and cb8R a b k is the zero-extended k-th coefficient of (1+X)^a(1+2X)^b cast to ℚ; for k = n ≥ 0 each summand equals C3-LA1's e1S a b n α (bridge cb8N_eq_e1S_natCast), and both sides vanish for k < 0 [r31 C4; R31-SR-C4-2].
STATUS: proved_informal
PROVENANCE: seat U1 (route C4-U-01, Claude Sonnet 5): frozen declaration cb8N_sum_eq_cb8R (frozen text, controller staff, R31-N-23) and helper cb8N_eq_e1S_natCast; inputs C3-LA1 entry 31 e1S_sum_eq_coeff (governed; in the cone of the C3-LA1 terminal, no certificate of its own), C1-LA3 polyCoeffZ_natCast/polyCoeffZ_of_neg (carried), base cb8R_natCast_eq_coeff; compiled scratch, ungraded until a governed award closes; isolated second read R31-SR-C4-2 (Claude Opus 5.5) confirmed; no status to any key.
```

```text
RECORD: R31-SR-C4-2b
CLAIM: For every m ≥ 107 with m ≡ 2 (mod 3), at p* = (16m+4)/3 and F = favorableLeaves (cbGraph m) p*, the explicit arc function cb8E1Arc m p* F satisfies the five frozen clauses of cb8E1Arc_spec_topRank — (1) nonnegativity, (2) support on literal deletion arcs from r-free sources in I_{p*+1}, (3) row sum = w_F(B) on every r-free source, (4) column sum = ρ_q·w_F(A) with ρ_q = cb8Rho(8q−1, 8(m−q)+1, p*−q) on every r-free target with q ≥ 1 (including w_F(A) = 0), (5) column 0 on targets containing r or with q = 0 — conditional on exactly the frozen N1 statements cb8_rFree_deletionClasses (B1) and cb8_rFree_insertionClasses (B2); clause (1) uses none of B1, B2, B3 (only the N1 companion cbOpenChokeCount_le); the ℓ = 0 rows close through e1_saturation and are live on the class (m = 107, q ≥ 64) [r31 C4; R31-SR-C4-2].
STATUS: conditional
PROVENANCE: clauses (1), (3), (4) and the whole-body assembly critic-derived, C-U1-F (Claude Opus 5.5, chartered medium; CritU1F.lean 459e9f67…), with N1 (B3) cb8_nonChokeInsert_weight proved in the same text (C-U1-F); clauses (2) and (5) from r31 Cycle 3 U2's base lemmas (Claude Sonnet 5; E1FlowConstruction.lean, controller-staff copy with the cb8G→cb8E1G rekey), discharged in the frozen body by U1; the w_A = 0 gap in U1's sketch identified by C-U1-T; governed inputs C2-LA3 terminal cb8_favorableLeaves_eq_leafSet_topRank and C3-LA1 entries 30, 31, 33, 34, 40, 44, 49, 50, 51 (in the cone of the C3-LA1 terminal); mechanism r30 E1 (E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL, named seats as registered); weight and relation Codex GPT-6's lower-region run; compiled scratch modulo {B1, B2}, ungraded until a governed award closes; isolated second read R31-SR-C4-2 (Claude Opus 5.5) confirmed with one wording repair; the grade rises to proved_informal only when R31-SR-C4-1 confirms B1 and B2; no status to any key.
```

```text
DISTINCTION ROW: R31-SR-C4-2-D1
KEY: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: The r30 key asserts, for general d, m, p and any tag set F ⊇ C, that the mark-clone criterion (i)+(ii) implies the EXISTENCE of a nonnegative rational deletion flow saturating non-sector sources with target loads ρ_q·w_F(A); it is proved_informal. The r31 record R31-SR-C4-2b is a different object: one explicitly named function cb8E1Arc on the literal cbGraph m, at the single rank p* = (16m+4)/3, d = 8, m ≥ 107, m ≡ 2 (mod 3) only, with F = favorableLeaves derived and rewritten to leafSet by C2-LA3, with the criterion discharged by C3-LA1's algebra rather than assumed, and conditional on the frozen N1 counts B1/B2. It neither regrades nor restates the r30 key, transfers no status to it, and says nothing at other d, m, p or for heterogeneous CB patterns [r31 C4; R31-SR-C4-2].
```

## Verdicts

verdict[R31-SR-C4-2a]: confirmed
verdict[R31-SR-C4-2b]: confirmed_with_repairs

- **2a.** The identity and its bridge are correct at every integer index, with the index and cast conventions as stated.
- **2b.** C-U1-F's whole-body proof is correct for all five clauses, conditional on exactly B1 and B2.
  - Clause (1)'s guard argument is confirmed, and so is clause (3), including the nonzero denominators, the live `ℓ = 0` rows and the
    zero-weight and zero-choke sources.
  - Clause (4) is confirmed, including `w_A = 0`. Clauses (2) and (5) are confirmed.
  - The one repair is F1, a wording repair to the dependency claim for clause (1).
  - The grade is `conditional` until R31-SR-C4-1 confirms B1 and B2. It is `proved_informal` after that.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/`.

- **Deliverable:** `second-reads/R31-SR-C4-2/SECOND-READ.md` (this file).
- **Scratch:** `scratchpad/c4-sr-R31-SR-C4-2/`, with SHA-256 digests:
  - `seal_check.py` `fc51f2d19f1f20d0f6a614c006932eb8c5eb50b09be91f577af7d1f37ce2aabb`: the seal and member-digest check.
  - `sr2_instrument.py` `1dc811cd68f902c27afc69047afe94d50cae1ecfd8bb90beb618a99016441a50`: my instrument, final text.
  - `out_E.json` `02e369ca28f86ffe7d1e406b2a947c1ca92e2d8e2509a869f9349ce202877b40` (`python3 -B sr2_instrument.py E`).
  - `out_V1.json` `a48b6cda301b6654a6ade48273ea09cfddcda0ee6120a875a985164b06380434` (`V 107,110,113`).
  - `out_V2s.json` `43e2b92bb9f35448ae34f153617b358933aae650104603856027d66f46a0f4f9` (`Vs 161`).
  - `out_L107.json` `33ea366d136798c4c77f1ac85a81af7f96c5526442b65f168f2ec5d67fdbcb17` (`L 107,240,20260929`).
  - `out_L110.json` `7d910f36cbb8e90892b90f5f780461175f8b42ed9efc0c941a79906b9dcca7dc` (`L 110,120,110`).
  - `out_L161.json` `83aaa3d263af4057583ab3fecf7cd9856dbd94f6e970067f74c4f0b48e3e85e6` (`L 161,72,161`).
  - `out_L164.json` `ad37b4f835cb8b4e27a549e87d7271951e5e754225504c80f6c77a3a995d7663` (`L 164,72,164`).
- **Instrument revision note.** I edited the instrument twice between runs:
  - first, a memo cache and the part-selection `main`, before `out_E` and `out_V1`;
  - second, an optional `q` filter with default `None`, for `Vs`.

  Neither edit changes any value computed by the E/V/L code paths.
  - `out_L107.json` was overwritten by the 240-sample run; the first run used 24 samples, with the same all-zero failures.
  - A partial `out_V2.json` from the stopped run (below) was deleted unread.

**Read-boundary and process disclosures.**
- **Reads.** I read the two boot files, the brief, the protocol and the manifest, then capsule members only:
  - the two contracts;
  - the frozen `.lean`;
  - base `E1FlowConstruction.lean` and targeted `sed`/`grep` ranges of base `Main.lean` (definitions, entries 15/16/18/23–26/69/70,
    `polyCoeffZ`, entry 606);
  - C3-LA1 Snippets 0003–0007, 0030, 0031, 0033, 0034, 0040, 0043, 0044, 0045, 0049, 0050, 0051;
  - `CritU1F.lean`;
  - diffs of U1's `Statements.lean`;
  - the C-U1-F critique in full;
  - targeted parts of the C-U1-T critique, the U adjudication and SYNTHESIS.md;
  - `C4-STAGE6-CONTROLLER-FACTS.json` and `PATH-CHECK-R31-SR-C4-2.json`;
  - the three registries and `CLAIM-DISTINCTIONS.json`, by script.

  I did not read `C4-FROZEN-STATEMENTS.md`, other capsule Lean files, or any seat or critic Python.
- **Outside the capsule.** There is one: a directory listing (names only) of `second-reads/`, taken while locating my output directory.
  I opened no file there.
- **Tools.** I ran no `find`, `rg`, or recursive `grep`/`ls`, no network, no installs, and no `lake`/`lean`. I never took a full
  process listing.
- **Background job (process deviation).** One foreground run (`V 161`, full `q` range) exceeded the 600 s tool limit, and the host
  **automatically moved it to the background**. I stopped it at once through the host's task-stop tool (task `bs54ufqol`), deleted its
  partial output unread, and re-ran a `q`-subsampled version in the foreground (141 s). No result of the stopped job is used.
