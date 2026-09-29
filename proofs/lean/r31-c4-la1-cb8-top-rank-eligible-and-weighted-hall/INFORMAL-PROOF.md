# C4-LA1 — Informal Proof (statement level): the Tier 1 family theorem on CB(8,m) at p*

- Canonical run id: `erdos-993-math-dre-20260927-r31-cb-uniform-switch`.
- Award: C4-LA1 (r31 Cycle 4 Stage 7). Governed run: `runs/lean-2026-09-29-c4-la1-cb8-top-rank-eligible-and-weighted-hall`.
- Producer: `c4-la1-formalizer-opus-20260929`. Chartered model: Claude Opus 5.5 (effort high), on dispatch-record authority;
  runtime-reported model id: `claude-opus-5-5`.
- Governing text: `cycles/cycle-4/stage6/SYNTHESIS.md`, `## Lean awards` → "### C4-LA1"; controller ruling R31-N-30.
- This file restates, at the level of statements, the proof that the Lean source `LeanProject/LeanProof/Main.lean` checks. It
  follows the synthesis's node-by-node reconciliation (N1–N8, then the stitch). It grades nothing: the kernel receipt certifies
  the Lean declaration; the controller's review gate and the isolated second reads R31-SR-C4-1..5 decide attribution and grades.

## 1. The theorem

For every natural `m` with `107 ≤ m` and `m % 3 = 2`, writing `T = cbGraph m` (the literal `CB(8, m)` on `Fin (17m+3)`) and
`p* = (16m + 4)/3`:

1. `T` is a tree;
2. (E, first half) `crossingIndex T + 2 ≤ p*`;
3. (E, second half) `3p* < 2α(T) + 1`;
4. (H) there is a saturating integral flow `f` for `favorableLeaves T p*` at rank `p*` (`IsSaturatingFlow`).

Lean (namespace `E993Transport`; statement text exactly as SOLUTION-CONTRACT §2 and the synthesis):

```lean
theorem cb8_topRank_eligible_and_weightedHall (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2) :
    (cbGraph m).IsTree ∧
    C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
    3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1 ∧
    ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f
```

Hypotheses are exactly `hm` and `hres`. There is no `hfav`: the selector is derived (C2-LA3 proves
`favorableLeaves (cbGraph m) p* = leafSet (cbGraph m)` on the class), and N8 carries no class hypothesis.

## 2. The objects (all definitions are carried or frozen; none is new to this award)

- Network definitions of record (carried byte-identically from r31 C1-LA2, itself carrying r30's): `indepFamily G k` (independent
  `k`-sets), `tagWitnesses G v`, `activeWeight G F B` (`w_F(B)`), `favorableLeaves G p` (the strict selector), `transportRel G B A`
  (deletion `A = B \ {q}` or switch `A = (B \ N(u)) ∪ {u}`, `|N(u) ∩ B| = 2`), `IsSaturatingFlow`, `WeightedHall`,
  `C5LA1.crossingIndex` (first-interior entry 14 as carried), `C5LA1.leafSet`.
- The CB layer (C1-LA2): `cbEdge`, `cbGraph`, `cbVertex`; root `r` = label 0, `s` = 1, arm leaf `v` = 2, choke `u_i` = `3+17i`,
  support `b_ij` = `3+17i+1+2j`, private leaf `c_ij` = `3+17i+2+2j` (`i < m`, `j < 8`).
- C1-LA1's per-state sector template (`State8`, `cb8Pb`, `cb8Pc`, `cb8CGamma`, `cb8Theta`, `cb8Sigma`, `cb8Out`, `cb8In`, `cb8R1`)
  and its terminal `cb8_topRank_sectorTemplate_feasible` (conclusions (i) nonnegativity, (ii) Out, (iii) In, (iv) Switch,
  (v) Residual `θ ≤ 1 − ρ₁`).
- The E1 layer (in-file; seat U2 of Cycle 3, as copied into the Cycle 4 base with the recorded rekey `cb8G → cb8E1G`):
  `cbOpenChokeCount m X` (`q`, the number of chokes in `X`), `cbRootFree`, `cb8R a b k` (coefficient of `(1+X)^a(1+2X)^b`, zero for
  `k < 0`), `cb8Rho a b j = cb8R a b j / cb8R a b (j−1)`, `cb8N a b α k` (type-`α` term), `cb8E1G`, `cb8H`, `cb8E1Val`, and the
  explicit E1 arc function `cb8E1Arc m p F B A`.
- The choke-state layer (in-file; seat U2 of Cycle 2): `chokeBeta m B i` (`β_i`), `chokeGamma m B i` (`γ_i`),
  `IsSectorSource m B` (`B` independent, `r, v ∈ B`), `chokeState m B hsec : Fin m → State8`.
- The frozen sector flow `cb8GSec m B A` (frozen text, gate ruling 23): on a sector source `B ∈ I_(p*+1)` and a `transportRel`
  arc `B → A`, `cb8Pb`/`cb8Pc` of the choke state on each `b`/`c`-leg deletion, `cb8Sigma m γ` on the `u_i`-switch at a choke in
  state `(1, γ)` with `γ ≥ 1`, and `0` elsewhere.

The flow of the proof is `g = cb8E1Arc m p* F + cb8GSec m`, `F = favorableLeaves (cbGraph m) p*`.

## 3. The dependency DAG

```
carried: C1-LA1 terminal (template (i)-(v)); C1-LA1 entries 24 (cb8_sum_in), 27 (nonneg/out/in/switch);
         C1-LA2 (graph layer, entry 78 cb8_topRank_of_descent_and_flow); C1-LA3 20 (E1 condition (i) at p*), 14 (positivity);
         C2-LA1 579 (AdjU.cb8_crossingIndex_add_two_le), 580 (AdjU.cb8_topRank_of_flow); C2-LA3 terminal (F = leafSet);
         C3-LA1 cone (e1S/e1T/e1Rho/e1G/e1H algebra); r30 C1-LA2 entries 30-31 ((HALL => FLOW)).
in-file: E1 layer (incl. cb8Rho_lt_one_topRank, cb8R_natCast_eq_coeff); ChokeState; Part A.
N1 (companion, B1, B2, B3) --> N2 (companion (E), main five clauses)
N3 (cb8GSec sign/support, image-in-layer, leg count, Out bridge, Out >= 1)
N4 (In bridge, In <= 1, zero classes)          N5 (switch preimages, switch-image inflow)
N6 (weight formula on leafSet)                 N7 companion (rho_1 link)
N2, N3, N4, N5, N6 --(conclusions as hypotheses)--> N7 main (flow bundle for g) --> N8 (conjunct 4)
N8 + C2-LA1 580 --> terminal
```

The closed dependency set of the Lean file is the terminal's kernel cone plus every frozen node and the whole E1 and ChokeState
layers (two frozen nodes, `cb8N_sum_eq_cb8R` and `cb8_sector_arcImages_mem_layer`, lie outside the terminal's kernel cone; they are
proved on the face as the brief requires).

## 4. Node by node

### N1 — the up-cover counts on `cbGraph m` (tag set `leafSet`)

- **Companion `cbOpenChokeCount_le`:** `q(X) ≤ m`, since `q(X)` is the size of a filter of `range m`. (Seat T1; independent proof
  seat U1.) This makes every `m − q` and `p* − q` below an exact ℕ subtraction.
- **B1 `cb8_rFree_deletionClasses`** (`0 < m`, `B` independent, `r ∉ B`): the vertices of `B` split into chokes (`q` of them), active
  tags (exactly `w(B)`: a leaf `z ∈ leafSet` whose witness set meets `B \ {z}`), and the rest (`ℓ`), with `q + w + ℓ = |B|`,
  `w ≤ 8q`, and `ℓ + 8q ≤ 8m + 1`. Proof: an active tag with `r ∉ B` must be a private leaf `c_ij` whose choke `u_i` is in `B`
  (the witness of `v` is `r`), giving at most 8 active tags per present choke; the non-choke, non-active vertices of `B` occupy
  distinct legs of absent chokes or the arm, at most `8(m − q) + 1` places. (Critic C-T1-F; second instrument C-T1-U.)
- **B2 `cb8_rFree_insertionClasses`** (`A` independent, `r ∉ A`): every independent up-cover `insert z A`, `z ≠ r`, lies in
  `I_(|A|+1)`; the Boolean insertions (a private leaf at a present choke becoming active) number `8q − w(A)`; the ternary
  insertions number `16m + 2 − 2ℓ' − 16q`. Proof: at a present choke the 8 legs contribute `8q − w` absent private leaves that are
  insertable and become active; at absent chokes each empty leg offers two insertable vertices, via the partner involution on
  legs (`critPartner*`), and the arm offers two; counts are written subtraction-free. (Critic C-T1-F; second instrument C-T1-U.)
- **B3 `cb8_nonChokeInsert_weight`:** inserting a non-choke `z ≠ r`, `z ∉ A`, keeps `q` and raises `w` by exactly
  `[z active in insert z A]`, because `z` is never a tag witness (witnesses are `r` or chokes) so no other tag changes status.
  (Critic C-T1-F using seat T1's helpers `cb_tagWitnesses_subset_root_or_choke`, `cb8_activeWitness_unaffected_by_insert`;
  second instruments C-T1-U and C-U1-F.)

### N2 — the unconditional E1 spec

- **Companion (E) `cb8N_sum_eq_cb8R`:** `Σ_{α ≤ a} N(α, k) = r(k)` for every integer `k`; both sides are `0` for `k < 0`; for
  `k = n ≥ 0`, `cb8N a b α n = e1S a b n α` (the guards `α ≤ a`, `n − α ≤ b` are redundant because an out-of-range binomial is
  `0`), and C3-LA1's `e1S_sum_eq_coeff` is the Vandermonde-type expansion. (Seat U1.)
- **Main `cb8E1Arc_spec_topRank`** at `p = p*`, `F = favorableLeaves (cbGraph m) p*`, `f = cb8E1Arc m p F`, five clauses:
  1. `f ≥ 0` (`crit_cb8E1Val_nonneg`, for `m + 1 ≤ p ≤ 8m + 1`): if the type `α = w − 1` exceeds `a` or the index `j = p − q`,
     `cb8N`'s guard fails, the denominator is `0` and the value is `0` (Lean's `x / 0 = 0`); otherwise, through the bridges
     `cb8E1G = e1G`, `cb8H = e1H`, `cb8N = e1S` at `n = p − q ≥ 1`, C3-LA1's `e1G_nonneg`/`e1H_nonneg` (with `e1T_sum_pos`) give
     nonnegativity, and `j − α ≥ 0` on the ternary branch.
  2. support: a nonzero value forces `B ∈ I_(p+1)`, `r ∉ B`, `A = B.erase x` (`cb8E1Arc_shape`, E1 layer).
  3. rows `= w(B)` on `r`-free sources: reindex the row by the deleted vertex; B1 gives the class counts
     (`q` chokes contributing `0`, `w` Boolean deletions, `ℓ = j − α` ternary deletions with `α = w − 1`), and the value-level core
     `crit_row_value` sums them to `w` using C3-LA1's `e1_rows_identity` (and `e1_saturation` in the edge case where the
     ternary coefficient is `0 · (x / 0)`).
  4. columns `= ρ_q · w(A)` on `r`-free targets with `q ≥ 1`: the preimages are the non-choke insertions; B2 counts the Boolean
     (`8q − w = a − α`) and ternary (`2(b − ℓ')`) classes and B3 gives the source weights; `crit_column_value` (the literal value
     is `(α + 1)` times C3-LA1's clone column term, `e1_column_inflow_clone`) gives `ρ_q w`.
  5. zero columns when `r ∈ A` or `q(A) = 0` (`cb8E1Arc_zero_of_root_mem`, `cb8E1Arc_zero_of_no_open_choke`, E1 layer).
  The favorable selector enters only through C2-LA3 (`F = leafSet`). (Critic C-U1-F; clauses (2) and (5) seat U1 on base scratch.)

### N3 — the sector flow's source side (for any `m` except where the class is named)

- `cb8GSec_nonneg_and_support` (class): `cb8GSec ≥ 0` because each coefficient is a C1-LA1 template value, nonnegative by C1-LA1
  entry 27 on the class; zero off `transportRel` by the definition's guard.
- `cb8_sector_arcImages_mem_layer`: for a sector source `B ∈ I_(p*+1)`, every deletion `B.erase x` is a `transportRel` image in
  `I_p*`; at a choke with `β_i = 1`, `u_i ∉ B` (it is adjacent to `r`), `|N(u_i) ∩ B| = 2` (`r` and the one support), and the switch
  image `insert u_i (B \ N(u_i))` is an independent `p*`-set related to `B`.
- `cb8_sector_legCount`: `Σ_i (β_i + γ_i) + 2 = |B|` (the sector source is `{r, v}` plus its legs).
- `cb8GSec_out_eq`: the row sum of `cb8GSec` at a sector source equals `Σ_i cb8Out m (state_i B)` exactly (each leg deletion and
  each eligible switch is one `transportRel` arc, and the set-difference labels make at most one summand nonzero per arc).
- `cb8GSec_out_ge_one` (class): with leg total `K = p* − 1 = (16m + 1)/3`, C1-LA1's Out conclusion (ii) gives `Σ_i Out ≥ 1`.
(Seat T2's proofs, bound to the frozen constant by critic C-T2-U; second instrument C-T2-F's binding.)

### N4 — the sector flow's target side

- `cb8GSec_in_eq`: on an in-sector target `A ∈ I_p*` (`r, v ∈ A`) the column sum is `Σ_i cb8In m (state_i A)`: the sector preimages
  are the leg insertions `insert x A` (a support or private leaf on an empty leg), each carrying the template value of the
  source's state; the other literal preimages (switches at `r` from non-sector sources) carry `0`. (Critic C-T3-U.)
- `cb8GSec_in_le_one` (class): leg total `K − 1`, C1-LA1 entry 24 (`cb8_sum_in`) gives `≤ 1`. The compiled route uses
  `cb8_sum_in`, not N3's leg count (synthesis disagreement 4: both sound). (Critic C-T3-U.)
- `cb8GSec_zero_classes`: `cb8GSec B A = 0` for non-sector sources, for weight-zero targets, and, at a sector source, for the
  deletions of `r` and `v`, the switch at `s`, and every switch at a choke in state `(1, 0)`. (Seat T3, Sections 0–3, bound to the
  frozen constant by the critics.)

### N5 — the switch images

- `cb8_sector_switchPreimages`: if `A ∈ I_p*` contains `v` and exactly one choke `u_i`, its sector preimages are exactly the
  `8 − γ` sets `(A \ {u_i}) ∪ {r, b_ij}` over the legs with `c_ij ∉ A` (`γ = γ_i(A)`), each in state `(1, γ)` at choke `i`.
- `cb8GSec_switchImage_inflow`: such an `A` receives `(8 − γ)·σ(γ)`; a target with two or more chokes, or with one choke and no
  `v`, receives `0`. At `γ = 0` the value is `0` through `cb8Sigma`'s junk value `cb8CGamma 0 = 0` (synthesis disagreement 9, a
  fidelity flag for the review panel: the informal meaning is that no switch preimage carries flow at `γ = 0`).
(Critic C-T3-U's text; second instrument critic C-T3-F.)

### N6 — the weight formula (`0 < m`)

`cb8_activeWeight_leafSet_eq`: `w(B) = [v, r ∈ B] + Σ_{i<m} [u_i ∈ B]·γ_i(B)` for every finset `B`: the tag `v` is active iff its
witness `r ∈ B`; a private leaf `c_ij ∈ B` is active iff its witness `u_i ∈ B`. `0 < m` is load-bearing (at `m = 0` the vertex
labels collapse). (Seat U2.)

### N7 — composition

- **Companion `cb8Rho_one_eq_cb8R1_ratio`:** `ρ_1` in the E1 syntax (`a = 7`, `b = 8(m−1)+1`, index `p* − 1`) equals C1-LA1's
  `cb8R1 m K / cb8R1 m (K − 1)`, `K = (16m + 1)/3`: `cb8Rho = e1Rho` by `cb8R_natCast_eq_coeff` and C3-LA1's `e1Rho_eq_coeff_ratio`
  (index `p* − 1 ≥ 1`), then C3-LA1's `e1Rho_one_eq_cb8R1_ratio`. (Seat U2.)
- **Main `cb8_flowBundle_of_arcSpecs`:** from the conclusions of N2–N6 (taken as hypotheses, byte-for-byte), `g = f + g_sec`
  satisfies: `g ≥ 0`; `g = 0` off `transportRel`; Out: `w(B) ≤ Σ_A g(B, A)` for every `B ∈ I_(p*+1)`; In: `Σ_B g(B, A) ≤ w(A)`
  for every `A ∈ I_p*`. Proof, with `F = leafSet` by C2-LA3 and `r ∈ X` forcing every choke out of an independent `X`:
  - Out, `r ∈ B`: E1 contributes `0` (support clause); by N6 `w(B) = [v ∈ B]`; if `v ∈ B`, N3's Out `≥ 1` gives it; else `w = 0`.
  - Out, `r ∉ B`: E1's row is exactly `w(B)` (clause 3) and `g_sec` is `0` (zero classes).
  - In, `r ∈ A`: E1 column `0` (clause 5); `w(A) = [v ∈ A]`; if `v ∈ A`, N4's `In ≤ 1`; else `w(A) = 0` and every `g_sec` into `A` is 0.
  - In, `r ∉ A`, `q = 0`: `w(A) = 0` by N6 and both columns vanish.
  - In, `r ∉ A`, `q ≥ 1`, and (`q ≥ 2` or `v ∉ A`): sector column `0` (N5), E1 column `ρ_q w ≤ w` since `ρ_q < 1`
    (`cb8Rho_lt_one_topRank`, from C1-LA3's condition (i) at `p*` and coefficient positivity).
  - In, `r ∉ A`, `q = 1`, `v ∈ A` (the switch images): `w(A) = γ` by N6; the load is `ρ_1 γ + (8 − γ)σ(γ)`. For `1 ≤ γ ≤ 7`,
    C1-LA1's Switch `(8 − γ)σ(γ) ≤ θγ` and Residual `θ ≤ 1 − ρ_1` (through the companion) give `≤ γ`, with exact `≤` (zero slack
    allowed; synthesis (iv)); for `γ ∈ {0, 8}`, `σ(γ) = 0` and `ρ_1 γ ≤ γ`.
  (Critic C-U2-F; second instrument critic C-U2-T.)

### N8 — bundle ⇒ conjunct 4

`cb8_conjunct4_of_flowBundle`: N7's conclusion is exactly the hypothesis list of Part A's `exists_saturatingFlow_of_ratFlow_bound`
at `G = cbGraph m`, `F = favorableLeaves (cbGraph m) p*`, `g`. Part A: for any source family `X ⊆ I_(p+1)`,
`Σ_X w ≤ Σ_X Σ_A g = Σ_{A ∈ N(X)} Σ_X g ≤ Σ_{N(X)} Σ_B g ≤ Σ_{N(X)} w` (support restricts the inner sum to `N(X)`,
nonnegativity extends `X` to `I_(p+1)`), i.e. `WeightedHall`; r30's `exists_saturatingFlow_of_weightedHall` (C1-LA2 entry 31,
Hall's marriage theorem on the clone expansion, with entry 30) gives the integral saturating flow. (Seat U3; Part A re-authored
from Cycle 2 seat U2; second instrument critic C-U3-T, which does not use Part A.)

### The stitch (the terminal)

`AdjU.cb8_topRank_of_flow m hm hres (cb8_conjunct4_of_flowBundle m (cb8_flowBundle_of_arcSpecs m hm hres (N2) (N3) (N3) (N4) (N4)
(N5) (N6 at 0 < m)))`. C2-LA1 entry 580 supplies conjuncts 1–3: tree (`cbGraph_isTree`), `x + 2 ≤ p*` (C2-LA1 entry 579 through
C-U3-T's closed form and C-U1-T's `S_5 > 0`), and the low window (`cb_lowWindow`: `3p* = 16m + 4 < 18m + 3 = 2α + 1`), via
C1-LA2's carried entry 78.

## 5. ℕ-subtraction and cast audit

| Occurrence | Where | Why exact |
|---|---|---|
| `(16 * m + 4) / 3` | statement, every node | `m % 3 = 2` gives `16m + 4 ≡ 0 (mod 3)`; the division is exact and `p* = (16m+4)/3`. Where the class is not assumed (N3 bridges, N4 In bridge, N5, N6, N8), the statements hold for the floor value as written and no exactness is used. |
| `(16 * m + 1) / 3`, `… - 1` | N7 companion; C1-LA1 | `16m + 1 ≡ 0 (mod 3)` on the class, so `K = p* − 1` exactly; `K ≥ 1`, so `K − 1` is exact. |
| `8 * q - 1` | N2 clause (4), E1 layer | only used with `1 ≤ q` (clause hypothesis) or `q = 1` (N7). |
| `m - q` | N2 clause (4), E1 layer | `q ≤ m` by N1's companion. At `q = 1`, `m ≥ 107`. |
| `p* - q` (ℕ, then cast to ℤ) | N2 clause (4), `cb8Rho_lt_one_topRank` | `q ≤ m < p*`, so the ℕ subtraction is exact before the cast `((p* − q : ℕ) : ℤ)`. |
| `w - 1` (`α`) | `cb8E1Val` | used only on the branch `w ≠ 0`. |
| `(k - α).toNat` | `cb8N` | guarded by `α ≤ k` (ℤ); outside the guard the value is `0`. |
| `j - α` (ℤ), `j - 1` (ℤ) | `cb8E1Val`, `cb8Rho` | integer arithmetic, no truncation; `cb8R` is `0` at negative index. |
| `8 - (γ : ℚ)` | N5 | rational, no truncation; `γ ≤ 8` by `chokeBeta_add_chokeGamma_le`. |
| `|B| − q − w`, `8q − w`, `b − ℓ'` | N1 | written subtraction-free in the frozen texts (sums on the left). |
| `(activeWeight … : ℚ)`, `(n : ℚ)` casts | N2, N7, N8, Part A | ℕ → ℚ is an order embedding; Part A's final `exact_mod_cast` moves the rational Hall inequality back to ℕ. |
| `cb8R` (ℤ coefficient → ℚ) | E1 layer | `Int.cast`, exact; the denominator of `cb8Rho` at `p*` is positive (C1-LA3 `twoBinomCoeff_pos`). |
| `x / 0 = 0` in ℚ | `cb8E1Val` | the Boolean/ternary values divide by `cb8N` and `(j − α)·cb8N`; where these vanish the value is `0` by Lean's convention. This is part of the in-file E1 definition, the N2 clauses are proved about these literal values, and the convention does not occur in the terminal statement. |

## 6. Integration (Lean engineering; no mathematics added)

- Single source `Main.lean`, importing only Mathlib: 758 registrar entries (definitions, then lemmas, then the one terminal
  theorem). Carried: 627 entries (622 byte-identical governed fragments, 5 origin terminals keyword-rekeyed `theorem → lemma`,
  R31-N-15). In-file: the E1 layer, ChokeState, Part A, the integration of the two adjudicator merges.
- Frozen texts: `cb8GSec` and the 20 frozen theorems keep their bytes; the only edit is the declaration keyword `theorem → lemma`
  (registrar kinds and R7's single `theorem`), reversible (EVIDENCE/frozen-header-check.json).
- Registrar-order hosting: `chokeState` (a definition whose `State8` proof field uses `chokeBeta_add_chokeGamma_le`) is hosted in
  that lemma's fragment; the frozen `cb8GSec` (which uses `chokeState`) is hosted in the fragment of `cb8GSec_nonneg_and_support`;
  `sdiff_singleton_sum'` is hosted in the fragment of the preceding lemma because the registrar's name check cannot match a
  trailing prime. Texts unchanged.
- Integration items of the synthesis: the two differing `choke_neighborFinset_inter_card` texts stay distinct (T2's plain name;
  T3's renamed `choke_neighborFinset_inter_card_n45` by the T adjudicator); one `no_choke_of_root_mem` (the T adjudicator dropped the
  identical duplicate); no `crit_*` clash arose between the T and U regions; the `import LeanProof.C3LA1` / `LeanProof.U3Interface`
  layout dissolves into the single file (C3-LA1 carried, Part A in-file, r30 entries 30–31 carried). The U-side B3 copy (C-U1-F) and
  its helper `crit_cb_tagWitness_root_or_choke` are not used (C-T1-F's B3 is the face text; C-U1-F is its second instrument).
- Stale comments repaired: "still `sorry` in this build" (two N2 section headers), the wrong Part A file (`U3Stitch.lean`) in N8's
  body comment; merge-marker comments removed; U3Stitch's reserved-name comment and its non-existent `print_axioms.sh` reference
  are not carried (the terminal is written fresh).

## 7. Fences and excluded conclusions (on the face)

- One rank `p*` per tree; `d = 8`; the class `m ≥ 107`, `m ≡ 2 (mod 3)` only; the selector derived (`favorableLeaves`), never
  assumed; `x` through rank `α` (the carried `crossingIndex`); no Newton or Darroch input (every step is kernel-checked; the
  E1 condition (i) enters through C1-LA3's formal two-binomial descent); the `θ*` law is never used (`cb8Theta` is only a
  definition); no LP optimality.
- **Excluded:** (HALL) at any other rank, at `m < 107`, at `m ≡ 0, 1 (mod 3)`, for `d ≠ 8`, for heterogeneous CB patterns and for
  arbitrary trees; any aggregate status — full (HALL), the primary aggregate, TREE, FOREST, TRANSFER and Erdős #993 stay OPEN;
  LP optimality or the `θ*` law; any Newton or Darroch input. `S(T_m, p*) ≤ 0` is NOT claimed: it is not composed in this file,
  and it would transfer no status.

## 8. Attribution

- Codex GPT-6's lower-region run: mechanism, weight, relation, (HALL).
- r30, named seats as registered: the network definitions, the awards (C1-LA2 entries 30–31), the criterion, threshold,
  favorability and closed forms, and the certificate method.
- Codex's heterogeneous-closure run: the coefficient mechanisms, as C1-LA3's face cites them.
- r31 Cycles 1–3: the award attributions as carried (C1-LA1, C1-LA2, C1-LA3, C2-LA1, C2-LA2, C2-LA3, C3-LA1).
- r31 Cycle 4 (per the synthesis): frozen texts, controller staff (R31-N-23). N1: companion seat T1 (independent: U1); B1/B2/B3
  critics C-T1-F / C-T1-U (B3 also C-U1-F). N2: companion seat U1, main critic C-U1-F (clauses 2 and 5: U1 on base scratch). N3:
  seat T2, binding C-T2-F / C-T2-U. N4: `zero_classes` seat T3; `in_eq` and `in_le_one` critic C-T3-U. N5: critics C-T3-F / C-T3-U.
  N6: seat U2. N7: companion seat U2; main critics C-U2-F / C-U2-T. N8: seat U3 (alternative: C-U3-T). Helper blocks: T2's;
  T3's Sections 0–3; C-T3-U's `crit_*`; the N1 critics' helpers; C-U1-F's §1–5 helpers and `crit_*` for N2; U1's
  `cb8N_eq_e1S_natCast`. The terminal: the stitch, seat U3; its conditional form, critics C-U3-F and C-U3-T. The integration merges:
  adjudicators T and U. The single-file integration, hosting and repairs: the formalizer `c4-la1-formalizer-opus-20260929`
  (Claude Opus 5.5).
- The critic-derived proofs (N1 B1/B2/B3, N2 main, N4 `in_eq`/`in_le_one`, N5, N7 main) were first stated at a review stage; their
  attribution and informal grades are gated by the isolated second reads R31-SR-C4-1..4, not by this file.
