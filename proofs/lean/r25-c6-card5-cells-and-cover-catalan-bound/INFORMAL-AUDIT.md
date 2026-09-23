---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c6-la5-formalizer-sonnet-20260922
critic_id: c6-la5-fable-informal-20260922
attestation_id: c6-la5-informal-pass-20260922
claim_sha256: 3e3e30aaf67f2a6664c447c1148ad32ff0d42516dd58d3d3e0cbbf43b4a98952
---

# Informal Proof Integrity Audit

**VerityOS boot.** This audit was produced operating within VerityOS. Booted by
reading `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md` — the three files the auditor brief
authorises — and nothing else from the VerityOS tree outside the brief's read
boundary.

**Model disclosure.** Independent informal proof-integrity reviewer,
`c6-la5-fable-informal-20260922`, chartered Claude Opus 5, effort high, stated
on dispatch-record authority: this seat cannot self-inspect its own runtime
model or effort setting. Child delegation was forbidden and none was used.

**Object audited.** The bounded-repair CHILD run
`runs/lean-2026-09-22-c6-card5-cells-and-cover-catalan-repair-1`. This audit
began on the parent run and was redirected to the child by the controller after
the fidelity reviewer returned `mismatch` on the parent; the parent ledger is
carried over in full and re-run against the child. The parent finding is
recorded in §"Independent Critic Pass" because the child's own prose asserts
facts about it that I verified independently.

**Artifacts audited (digests recomputed by me):**

| artifact | SHA-256 |
|---|---|
| `THEOREM-CONTRACT.yaml` | `658583ce129ea0edf532b46662f48e199f06cf4ab06a1d613a47df127bf90642` |
| `INFORMAL-PROOF.md` | `396a5e1861dee0909559fc538b6ee50100e6bde6e34b9d6b8203e66ea8f5ff47` |
| `LeanProject/LeanProof/Main.lean` | `f47ef6b4fcad06580bb97206950c604927753c2c30cd369dbe6a76d4f0409a2d` |
| `RECEIPTS/kernel-verification.json` | `ae561860b600886b1466c7438ef32ab646ebf5859b06b2c624a94e6c2c2ba75f` |
| `EVIDENCE/verify_frozen_entry_tags.py` | `0d4870b829a8085db7c24e2f3a53eb203aa826363b5545bb072bfd88e8068e54` |
| `EVIDENCE/generate_card5_evidence.py` | `fe53bd306b8eef6f8daaa00f907534c006cc2d0dcc95a2075c091170cece6001` |
| `EVIDENCE/card5_evidence_report.json` | `11d8e869bd49ab580e1e2541ff1b6fe23b8e0a2603c704f0174b7d54e0d45eea` |
| frozen G1 `sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean` | `aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4` |

Capsule `control/c6-stage7-capsules/C6-LA5-PACKET-MANIFEST.json`: seal
recomputed by me (SHA-256 of the compact key-sorted JSON minus `seal_sha256`,
no trailing newline) = `977f1cd2956641f6035287560a0ef91a02e8ae4044ec1ef08880228efe197eb9`
— **matches**; all 9 member byte counts and digests match; all 7 named compiled
Lean sources match.

`claim_sha256` above is SHA-256 of the child contract's
`theorem.informal_statement` with whitespace collapsed by `" ".join(s.split())`,
recomputed by me: `3e3e30aa…`, **equal to the controller's value**. (The
auditor brief's `4533aef2…` is the parent contract's value; I recomputed that
one too and it matched the parent, before the redirect.)

---

## Intended Claim

The intended claim is exactly the contract's `theorem.informal_statement`, bound
to the single terminal declaration
`Erdos993G1.ThirdWide.card5_cells_and_cover_catalan_award`, whose
`expected_statement` I verified is byte-equal to the namespace-relative source
text of that declaration in `Main.lean` (the only difference being the trailing
` :=`, correctly excluded), digest
`cee46ec8164f9bda5912ab51b66f0568e1844e2c40ee97631d2d996e596f09ff` recomputed.

**(a) FIXED-CELL.** For each `(r, k, order) ∈ {(2,1,9), (3,2,11), (4,3,13),
(5,4,15), (6,5,17)}` — i.e. `order = 2k+7`, `r = k+1` — for every
`X : Type u` with `Fintype X`, `DecidableEq X`, every `F : SimpleGraph X` with
`DecidableRel F.Adj`:

> `F.IsAcyclic → Fintype.card X = order → ∀ C0 : Finset X, C0.card ≤ 5 →
> (∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) → (t_k : ℤ) ≤ delta F k`
> with `t = 9, 5, 9, 21, 42`.

**(b) PARAMETERIZED in `(n, k)`.** For every `X`, every `F : SimpleGraph X`
(**no acyclicity hypothesis**), every `C : Finset X` with `C.card = 5` covering
every edge, and all `n k : ℕ` with `Fintype.card X = n + 5`:

> `C(n,k+1) − C(n,k) − 5·[1≤k]Cat(k−1) − 10·[2≤k]Cat(k−2) − 10·[3≤k]Cat(k−3)
> − 5·[4≤k]Cat(k−4) − [5≤k]Cat(k−5) ≤ delta F k`

with `Cat = catalan` (Mathlib) and each correction term guarded by an
`if`-zero-extension.

`delta` is the G1 delta of `SEMANTIC-CONTRACT.md`: `delta F k = coeff F (k+1) −
coeff F k`, `coeff` the integer zero-extension of `indepCount`, `indepCount F k`
the count of actual independent `k`-subsets (`i_0 = 1`).

The `informal_statement` additionally carries, as part of the claim text, the
mandatory disclosures and scope exclusions checked in §"Scope and Fence Check".

---

## Claim Ledger

Every definition, lemma and inference step of `INFORMAL-PROOF.md`, checked
against the compiled `Main.lean` at statement-level granularity. All 52
registered entries parsed independently by my own tag parser
(`parse_entries.py`); **all 52 registrar tag digests recompute** over their own
bodies under the convention `sha256(body + "\n")`, and **all 187 frozen G1 tag
digests recompute** over the frozen bodies under the same convention.

### Definitions

| # | object | source | audit |
|---|---|---|---|
| D1 | `indepCount`, `coeff`, `delta` (entries 1–3) | frozen ENTRIES 1, 2, 3 | match `SEMANTIC-CONTRACT.md` verbatim in content; `coeff`'s `k.toNat` is guarded by `if 0 ≤ k`, so no truncating cast escapes |
| D2 | `FirstWide.binomCoeff` (entry 4) | frozen ENTRY 14 | `if 0 ≤ k then n.choose k.toNat else 0` — zero-extension below 0; truncating cast guarded |
| D3 | `ThirdWide.fSingleton n k d` (entry 5) | seat U3, new | `binomCoeff (n−d) k − binomCoeff (n−d) (k−1)`. **`n − d` is ℕ truncated subtraction.** Every consumer supplies `d ≤ n`: `hcert`'s own binder in `cell_bound`; `joint_cert_finset`'s `hd` (from `crossdeg_le` + `hn` + `hC`); and the singleton layer of `cover_rank_bound_five_singletons` via the ENTRY-174 identity. No truncation is ever reached. **Verified.** |
| D4 | `catalan` | Mathlib | statement (b) only |

### Statement (a) — the chain, and where each hypothesis enters

| # | step | audit |
|---|---|---|
| L1 | `cover_fiber_count` (entry 16 ← frozen 165) | the cover-fiber bijection `T ↦ T \ C`: for a vertex cover `C` and independent `S ⊆ C`, the independent `k`-sets with `T ∩ C = S` biject with `(k−|S|)`-subsets of `B_S = {x ∉ C : no y ∈ S adjacent to x}`. Sound because `V ∖ C` is independent (`C` is a cover). The `S.card > k` branch is handled separately with `binomCoeff` negative-index zero. **Correct.** |
| L2 | `cover_indepCount_partition` (17 ← 166) | `i_k(F) = Σ_{S ⊆ C indep} binomCoeff(avail S, k − |S|)` — exactly the cover-fiber partition declared binding in `SEMANTIC-CONTRACT.md`. **Correct.** |
| L3 | `cover_delta_partition` (18 ← 167) | subtracting two instances of L2; `(k:ℤ) − S.card` is integer throughout. **Correct.** |
| L4 | `cover_sum_bound` (19 ← 168) | if `f S ≤ 0` on non-independent `S ⊆ C` and `f S ≤ term(S)` on independent `S`, then `Σ_{S ⊆ C} f S ≤ delta F k`. **Correct.** |
| L5 | `cover_cross_edges_le` (20 ← 172) | `Σ_{a ∈ C} crossdeg(a) ≤ |E(F)|` via the injection `(a,x) ↦ s(a,x)`; injectivity uses `a ∈ C`, `x ∉ C`, which excludes the swapped case. **Correct.** |
| L6 | `cover_singleton_available` (21 ← 174) | **the singleton identity** `avail({a}) + crossdeg(a) = |X| − |C|`. With `hC : C.card = 5`, `hn : |X| = n+5` this gives `avail({a}) = n − crossdeg(a)` and `crossdeg(a) ≤ n` in ℕ, closing D3's truncation obligation. **Correct.** This is the declaration carrying the repaired byte. |
| L7 | `cover_available_empty` (22 ← 178) | `avail(∅) = |X| − |C| = n`. **Correct.** |
| L8 | `powerset_five_sum` (23) | for `|C| = 5`, `Σ_{S ⊆ C} b(|S|) = b0 + 5b1 + 10b2 + 10b3 + 5b4 + b5`. Row `1,5,10,10,5,1` recomputed. **Correct.** |
| L9 | `cover_rank_bound_five` (24) | L4 + L8. `hb : ∀ t, 0 < t → b t ≤ 0` suffices for the non-independent branch because `∅` is always independent, so every non-independent `S` has `|S| ≥ 1`. **Correct.** |
| L10 | `avail_le` (26) | `avail(S) ≤ |X| − |C| = n` for every `S`. Supplies the `m ≤ n` side condition of the `f2..f5` floors. **Correct.** |
| L11 | `exists_card_five_cover` (27) — **the padding lemma** | from `C0.card ≤ 5` and `5 ≤ |X|`, `Finset.exists_superset_card_eq` yields `C ⊇ C0` with `C.card = 5`; a superset of a cover is a cover. This is the step the registry called "unstated": here **stated and proved**, not assumed. The hypothesis really is `τ(F) ≤ 5`, not a card-5 surrogate. **Correct.** |
| L12 | `sum_powersetCard_one_eq` (29) | `Σ_{S ∈ C.powersetCard 1} g S = Σ_{a ∈ C} g {a}`. **Correct.** |
| L13 | `cover_rank_bound_five_singletons` (30) | refines the `|S| = 1` layer of L9 from a uniform floor to the **exact** singleton terms `fSingleton n k (crossdeg a)`, via L6; layers `|S| ∈ {2,3,4,5}` keep numeral floors `f2..f5`, layer `|S| = 0` keeps the exact `b0` bound via L7. `hmiss` is discharged because `|S| ∈ {0,1}` are always independent. **Correct.** |
| L14 | `joint_cert_finset` (31) — **the LP-dual aggregation** | from a per-vertex certificate `a − b·d ≤ fSingleton n k d` (`d ≤ n`), `b ≥ 0`, and `Σ_{x∈C} crossdeg(x) ≤ N`: `5a − b·N ≤ Σ_{x∈C} fSingleton n k (crossdeg x)`. **Correct.** |
| L15 | `crossdeg_le` (32) | `crossdeg(a) ≤ |X| − |C|`. **Correct.** |
| L16 | `budget_bound` (33) — **THE SOLE POINT WHERE ACYCLICITY ENTERS** | `Σ_{a∈C} crossdeg(a) ≤ |X| − 1`. Chain: L5 gives `Σ crossdeg ≤ |E|`; frozen ENTRY 58 `forest_card_edges_add_components` gives `|E| + #components = |V|` **using `F.IsAcyclic`**; frozen ENTRY 59 gives `#components > 0`; `omega` closes. `|X| − 1` is ℕ subtraction, guarded by `hpos : 0 < Fintype.card X`. **Correct, and this is the only place any acyclicity content is consumed.** |
| L17 | `cell_bound` (34) | assembles L13 + L14 + L16 with `N = n+4` (`= |X| − 1`), and closes with the linear identity `htotal : b0 + (5a − b·(n+4)) + 10f2 + 10f3 + 5f4 + f5 = total`. **Correct.** |
| L18 | `cell_9/11/13/15/17` (35–39) | each instantiates L11 then L17 at its own `(n, k, a, b, b0, f2..f5, total)`. Every hypothesis discharged by `decide`/`interval_cases`/`norm_num` over a finite range. All numerals recomputed by me — see below. **Correct.** |

### Statement (b) — the chain

| # | step | audit |
|---|---|---|
| L19 | `binomDelta_pascal`…`binomDelta_central` (40–46 ← frozen 136–142) | Pascal step; monotone increase for `2k ≤ m`; decrease for `m < 2k`; and `C(2j,j+1) − C(2j,j) = −Cat(j)` (the central identity, from `succ_mul_catalan_eq_centralBinom`). **Correct.** |
| L20 | `binomDelta_floor` (47 ← frozen 143) — **the floor** | `−Cat(j) ≤ C(m,j+1) − C(m,j)` for **all** `m, j`: the function of `m` is antitone up to `2j` and monotone after, so its minimum is the central value `−Cat(j)`. **Correct**, and I verified the minimum is attained exactly at `m = 2j`. |
| L21 | `binom_shift_floor` (48 ← frozen 177) | `−(if t ≤ k then Cat(k−t) else 0) ≤ binomCoeff m (k−t+1) − binomCoeff m (k−t)`. `Cat(k−t)` is ℕ-truncated but **guarded by `if t ≤ k`**. The `t > k` branch splits exactly two ways: `t = k+1` (`binomCoeff m 0 − binomCoeff m (−1) = 1 − 0 ≥ 0`) and `t > k+1` (both indices negative, `0 − 0`). Exhaustive. **Correct.** |
| L22 | `cover_catalan_bound_five` (49) | L9 with `b(0) = C(n,k+1) − C(n,k)` and `b(t) = −(if t ≤ k then Cat(k−t) else 0)` for `t > 0`. `hb` holds since `catalan ≥ 0`; `hterm` is exact at `|S| = 0` (via L7) and is L21 otherwise. Summing by L8 with row `1,5,10,10,5,1` yields exactly the stated conclusion. **No acyclicity anywhere in this chain — the bound holds for an arbitrary graph with a card-5 cover.** **Correct.** |
| L23 | `catalan_recurrence_int` (50 ← frozen 147) | `(n+2)·Cat(n+1) = (4n+2)·Cat(n)`. **Correct.** |
| L24 | `catalan_gap5_identity` (51) | the six-term card-5 analogue of frozen ENTRY 148's five-term card-4 identity. Carried as a **supporting lemma, not a conjunct**. Identity recomputed — see below. |
| L25 | terminal theorem (52) | `⟨cell_9, cell_11, cell_13, cell_15, cell_17, cover_catalan_bound_five⟩`, one universe-polymorphic six-conjunct `theorem`; every component a `lemma`. Proof term re-abstracts binders only. **Correct.** |

### ℕ-subtraction and cast audit (complete)

Every ℕ subtraction and every truncating cast in the development, and its guard:

1. `fSingleton`'s `n − d` — guarded by `d ≤ n` at all three call sites (D3).
2. `coeff`'s `k.toNat` — guarded by `if 0 ≤ k`.
3. `binomCoeff`'s `k.toNat` — guarded by `if 0 ≤ k`.
4. `budget_bound`'s `Fintype.card X − 1` — guarded by `hpos`.
5. `Fintype.card X − C.card` (L6, L7, L10, L15) — reduced to `n` by `hn` + `hC`.
6. `catalan (k − t)` (L21, L22, terminal) — guarded by `if t ≤ k`.
7. `(k : ℤ) − S.card`, `(k : ℤ) − j` — integer throughout; `binomCoeff` zero-extends below 0.
8. `n.choose (k+1)`, `n.choose k` in the terminal statement — `Nat.choose`, zero above `n`; cast to ℤ after.

**No truncation is ever reachable.** Verified.

### Non-dependencies (nothing marked NOT a dependency is one)

Grep over `Main.lean`: **zero** occurrences of matching/König/`IsMatching`/`firstDescent`/`ν`. **Zero** occurrences of `sorry`, `admit`, `native_decide`, or a bespoke `axiom`. `x(F) < r` appears as a hypothesis nowhere. `hfloor` appears nowhere (statement (b) is the unconditional form). `cover_five_sparse_vertex'` (primed) does not exist; the unprimed `cover_five_sparse_vertex` is registered as entry 25. `catalan_gap5_pos`/`catalan_gap_five_pos` is **not registered** — its only occurrence is the comment recording its deliberate exclusion.

Registered but **not consumed** by the terminal theorem: `cover_five_sparse_vertex` (25), `joint_cert` (28, the `Fin 5` reference form), `binomDelta_mono` (44), `catalan_gap5_identity` (51). All four are compiled and axiom-clean; carrying them cannot weaken anything. The informal proof discloses 51 and 28 explicitly; 25 and 44 are carried from the chartered DAG without a "not used" marker (recorded as an observation, not a defect).

---

## Reproduced Mathematical Evidence

All recomputation was done with instruments I wrote from scratch under
`scratchpad/c6-s7-informal-LA5-repair-1/`, Python standard library only, exact
integer arithmetic throughout, no floats, no prior evaluator imported, no
network, no installs. Explicit import lists at the top of each file.

| instrument | purpose |
|---|---|
| `parse_entries.py` | independent VERITYOS-entry tag parser |
| `recheck_cells.py` → `recheck_cells.json` | cells, certificates, admissible profiles, floors, Γ identity |
| `forest_census.py` → `forest_census.json` | exhaustive small-forest census |
| `census_essentiality.py` → `census_essentiality.json` | is the cover hypothesis load-bearing per cell |
| `graph_witness.py` → `graph_witness.json` | the 13-vertex τ=5 general-graph counterexamples |
| `critic_validate.py` | brute-force validation of the census instrument |
| `child_bytefidelity.txt`, `final_checks.txt` | byte-fidelity and consolidated checks |

### 1. The five cell totals and both LP-dual certificates (exhaustive, not sampled)

Parameters read directly out of the child's `Main.lean` (`apply cell_bound …`);
identical to the parent's.

| cell | order | n | k | (a,b) | b0 | (f2,f3,f4,f5) | total |
|---|---|---|---|---|---|---|---|
| `cell_9` | 9 | 4 | 1 | (3,1) | 2 | (0,0,0,0) | **9** |
| `cell_11` | 11 | 6 | 2 | (6,2) | 5 | (−1,0,0,0) | **5** |
| `cell_13` | 13 | 8 | 3 | (15,5) | 14 | (−1,−1,0,0) | **9** |
| `cell_15` | 15 | 10 | 4 | **(42,14)** | 42 | (−2,−1,−1,0) | **21** |
| `cell_17` | 17 | 12 | 5 | **(42,14)** | 132 | (−5,−2,−1,−1) | **42** |

* `order = n + 5` at all five cells. ✔
* `htotal` recomputed: `b0 + (5a − b(n+4)) + 10f2 + 10f3 + 5f4 + f5` = **9, 5, 9, 21, 42** — matches the registered totals exactly. ✔
* `hcert` (`a − b·d ≤ fSingleton n k d`) verified for **every** `d ∈ [0,n]` at every cell; minimum slack 0 (tight at `d ∈ {0..4}, {2,3}, {2,3}, {2,3}, {3,4}` respectively). ✔
* `hb0` holds at every cell and is **exactly tight**: `b0 = C(n,k+1) − C(n,k)` = 2, 5, 14, 42, 132. ✔
* `hf2..hf5` verified against `min_{m ≤ n} (binomCoeff m (k−j+1) − binomCoeff m (k−j))` at every cell; each is tight or conservative, and all are `≤ 0`. ✔
* **Both LP-dual certificates** `f(d) ≥ 42 − 14d` (cells 15 and 17), and the three smaller ones, evaluated against the **exhaustive** joint minimum of `Σ_{i=1}^{5} fSingleton(n,k,d_i)` over the full admissible cross-degree-profile domain `{d ∈ [0,n]^5 : Σd ≤ n+4}` — **no pruning, no sampling**: profile counts **1007, 2723, 5908, 11348, 20069**; true joint minima **7, 10, 15, 14, −14**; the LP-dual aggregate `5a − b(n+4)` equals the true minimum at **every** cell (sound **and** tight). Argmins `(0,0,0,4,4)`, `(2,2,2,2,2)`, `(2,2,2,3,3)`, `(2,3,3,3,3)`, `(3,3,3,3,4)`. ✔

These figures agree, independently, with `EVIDENCE/card5_evidence_report.json`.

### 2. The floors

* `binomDelta_floor`: `−Cat(j) ≤ C(m,j+1) − C(m,j)` checked for all `m ≤ 200`, `j ≤ 60` — **zero violations**; equality attained at `m = 2j` for every `j ∈ [1,60]`, confirming the floor is exactly the central value. ✔
* `binom_shift_floor`: checked for all `m ≤ 60`, `k ≤ 40`, `t ≤ 12` — **zero violations**, including both `t > k` branches. ✔

### 3. The six-term Γ(5,k) identity

`catalan_gap5_identity` verified as an exact integer identity for **every `t ∈ [0,60]`** (covering `k ≤ 60` and beyond):

> `(t+2)(t+3)(t+4)(t+5)(t+6)(t+7)·(Cat(t+6) − 5Cat(t+4) − 10Cat(t+3) − 10Cat(t+2) − 5Cat(t+1) − Cat t)
> = (−70560 − 125376t + 125130t² + 266145t³ + 137475t⁴ + 28071t⁵ + 1995t⁶)·Cat t`

**Zero violations.** I independently recovered the indexing convention: with
`Γ(5,k) := Cat(k+1) − 5Cat(k−1) − 10Cat(k−2) − 10Cat(k−3) − 5Cat(k−4) − Cat(k−5)`
and `t = k − 5`, the identity's bracket is exactly `Γ(5,k)`. Under that
convention `Γ(5,5) = −14 < 0` and `Γ(5,6) = 18 > 0`, and `Γ(5,k) > 0` for every
`k ∈ [6, 300]` — so the excluded claim "`Γ(5,k) > 0` for `k ≥ 6`" is **true and
its threshold is sharp**, and the run's own report of `Γ(5,5) = −14` is correct.
As a cross-check of the same machinery I also verified the frozen ENTRY 148
card-4 five-term analogue for `t ∈ [0,60]` — zero violations. ✔

### 4. The true minima and the τ ≤ 5 populations — my own small-forest census

I enumerated **every isomorphism class of forest** on 9, 11, 13, 15, 17 vertices
from scratch: rooted trees as canonical nested tuples; free trees by the
centroid characterisation (unique-centroid rooting with all branches
`≤ ⌊(n−1)/2⌋`, plus the bicentroidal even case); forests as multisets of free
trees; independence polynomial by rooted in/out DP; `τ = ν` by the rooted
matching DP (König, forests are bipartite, per `SEMANTIC-CONTRACT.md`).

| order | k | total forest classes | **τ ≤ 5 population** | **min Δ_k over τ ≤ 5** | proved bound | slack |
|---|---|---|---|---|---|---|
| 9 | 1 | 153 | **153** | **19** | 9 | 10 |
| 11 | 2 | 710 | **710** | **39** | 5 | 34 |
| 13 | 3 | **3658** | **3073** | **56** | 9 | 47 |
| 15 | 4 | 20514 | **10648** | **56** | 21 | 35 |
| 17 | 5 | 122963 | **29915** | **43** | 42 | **1** |

* The τ ≤ 5 populations **153 / 710 / 3,073 / 10,648 / 29,915** reproduce the record exactly. ✔
* The true minima **19 / 39 / 56 / 56 / 43** reproduce the record exactly. ✔
* The total class counts reproduce A005195(9,11,13,15,17) = 153, 710, **3,658**, 20,514, 122,963 — confirming the corrected population figure: **3,073 is the τ ≤ 5 population at order 13; 3,658 is the total.** ✔
* Every cell's bound holds on its τ ≤ 5 population; only order 17 is essentially sharp (slack 1) — "far from sharp at four of five cells" is correct. ✔
* At orders 9 and 11 the τ ≤ 5 population **equals** the total class count, so **the cover hypothesis is vacuous there** — an independent confirmation of the mandated disclosure. ✔
* My free-tree counts reproduce A000055 for `n = 1..17` (1,1,1,2,3,6,11,23,47,106,235,551,1301,3159,7741,19320,48629) and my rooted-tree counts reproduce A000081 for `n ≤ 8` — neither sequence was used in the generation, so this is a genuine external cross-check of the enumerator.

**Load-bearing test of the cover hypothesis** (min Δ_k over *all* forest classes, no τ filter):

| order | k | min Δ_k over all forests | bound | cover hypothesis load-bearing? |
|---|---|---|---|---|
| 9 | 1 | 19 | 9 | no (and vacuous) |
| 11 | 2 | 39 | 5 | no (and vacuous) |
| 13 | 3 | 45 | 9 | no (non-vacuous but not needed) |
| 15 | 4 | **−33** | 21 | **yes** |
| 17 | 5 | **−363** | 42 | **yes** |

This reproduces the disclosure's precise wording — cover-**essential**, in the
sense of excluding real counterexamples, **only at 15 and 17**. ✔

### 5. The 13-vertex τ = 5 GRAPH counterexample excluded by acyclicity

I searched 13-vertex graphs with a distinguished cardinality-5 vertex cover
(`C = {0..4}`, `B = {5..12}` independent, each `B`-vertex carrying a signature
of the cover vertices not adjacent to it), exhaustively over all
`C(33,8) = 13,884,156` signature multisets of weight ≤ 3 with `C` independent,
plus an unrestricted local search. **Every reported witness was re-verified by
direct enumeration of all 2^13 vertex subsets and by exact computation of
`τ` over all vertex subsets** — no structure theory in the verification step.

| Δ₃ | τ | edges | I₃ → I₄ | `9 ≤ Δ₃`? |
|---|---|---|---|---|
| **−8** | **5** | 26 | 89 → 81 | **FAILS** |
| **−9** | **5** | 25 | 91 → 82 | **FAILS** |
| **−10** | **5** | 23 | 97 → 87 | **FAILS** |

Explicit edge list of the **Δ₃ = −8 witness of record** (vertices 0–12, cover
`{0,1,2,3,4}`):

```
0-5 0-6 0-9 0-10 0-11   1-5 1-6 1-8 1-10 1-12   2-5 2-6 2-7 2-9 2-12
3-5 3-6 3-7 3-8 3-11    4-5 4-6 4-7 4-8 4-9 4-10
```
`I = [1, 13, 52, 89, 81, 57, 28, 8, 1, 0, …]`, so `Δ₃ = I₄ − I₃ = −8`, and
`τ = 5` exactly (no cover of size ≤ 4 exists).

The minimum found over the exhaustive family and the unrestricted search is
**−10**, so **−8 is indeed a witness value, not a cell minimum**, and
**τ = 5 general graphs at −9 and −10 do exist** — both exactly as the record
states. All three violate `cell_13`'s `9 ≤ Δ₃`, so **acyclicity is genuinely
load-bearing at `cell_13`**, and `budget_bound` is the only place it could be
doing that work. ✔

### 6. Byte-for-byte transcription fidelity against `sources/g1/`

31 registered entries transcribe a frozen G1 entry. I mapped them by
declaration name (the frozen file has **no duplicate declaration names**, so the
mapping is unambiguous): run 1,2,3,4 ← frozen 1,2,3,14; 6–10 ← 82,83,84,86,87;
11–15 ← 17,23,25,58,59; 16–20 ← 165,166,167,168,172; 21 ← 174; 22 ← 178;
40–47 ← 136–143; 48 ← 177; 50 ← 147. This is exactly the mapping
`INFORMAL-PROOF.md` §4 and the adjudication's DAG assert.

* **All 187 frozen tag digests recompute** over the frozen bodies. ✔
* **All 52 child registrar tag digests recompute** over the child's bodies. ✔
* **Token-level (whitespace-insensitive) comparison of all 31 transcribed entries against the frozen source: ZERO mismatches.** The transcription is mathematically faithful, declaration for declaration. ✔
* Byte-level: 5 entries are byte-identical as-is; the other 26 differ **only** in the two disclosed, semantically inert scaffolding classes — (i) fully-qualified names made namespace-relative and `{X : Type u} [Fintype X] [DecidableEq X]` / `{V : Type u}` hoisted into a shared `namespace … open … variable …` block with the per-entry `end` lines dropped, (ii) `noncomputable` split onto its own line and some binder lists re-wrapped. Both classes were ruled inert by both Cycle 6 critiques (C-U3-T F4, C-U3-F item 2). ✔
* **The repaired byte.** Frozen line 3761 is `  simp only [mem_singleton,forall_eq] ` **with a trailing 0x20**. The child's `Main.lean` line **398** is `  simp only [mem_singleton,forall_eq] ` — **byte-identical to frozen line 3761**. Confirmed by me on raw bytes. ✔
* ENTRY 174 spans frozen lines **3743–3765**; ENTRY 178 spans **3844–3861** — exactly as `INFORMAL-PROOF.md` §7 now states. ✔

### 7. Axioms, receipts, fences

* `EVIDENCE/axioms-all-52-declarations.txt`: **52 declarations**, every one within `[propext, Classical.choice, Quot.sound]`; `FirstWide.binomCoeff` and `fSingleton` report no axioms at all. Parsed and checked by me — zero violations. ✔
* `RECEIPTS/kernel-verification.json`: `verdict.verified = true`, code `verified`. `RECEIPTS/theorem-contract.json`: `valid_for_formalization`, `passed = true`, zero errors, zero warnings; all 10 `source_materials` digests recomputed by me and matching. ✔
* Grep for `sorry|admit|native_decide|^axiom ` over `Main.lean`: **zero hits**. ✔
* `EVIDENCE/card5_evidence_report.json` self-digest recomputes; no wall-clock, PID, date or host field in it or in `verify_frozen_entry_tags_output.txt`. ✔

---

## Independent Critic Pass

A separate pass, run against my own unchanged ledger before closing.

**C1 — Is the parent defect I found real, and is the child's account of it true?**
On the parent run I found, and record here because the child's §5 asserts it:
the mandated repair (iii)(iv) — restore the trailing-space byte of frozen line
3761 — had **not** been applied, while `INFORMAL-PROOF.md` §5 and
`FORMALIZER-REPORT.md` both asserted in bold that it had. Decisive evidence:
the parent's `Main.lean` line 391 lacked the byte on raw bytes; the parent's
registrar digest for entry 21 was `e0386a67…`, which recomputes over the
space-less body, whereas the body **with** the space digests to
`f72c64b6…`. I computed `f72c64b6…` as a prediction on the parent, before the
redirect. **The child's registered entry-21 digest is exactly
`f72c64b6534ede23e1ec198087f52887b121e91f3e84ad0ccf0b53bd642010b9`** — an
independent confirmation that the child restored precisely the one byte and
nothing else. I further verified: the parent's `Main.lean` contains **no**
trailing-whitespace line anywhere; the child's contains **exactly one**, at line
398. Every statement the child's §5 makes about the parent is true.

**C2 — Did the repair touch the mathematics?** Diffing parent against child
entry by entry: exactly **two** entries changed — entry 20 (a trailing *comment*
rewritten) and entry 21 (the single space). Entry 52's body is **identical**;
`expected_statement_sha256` is unchanged at `cee46ec8…`; the cell parameters are
unchanged; the axiom footprint is unchanged. **The repair is textual and
byte-level only; no proof term and no statement moved.** ✔

**C3 — Could my census be systematically wrong?** Validated against brute force:
for all 200 rooted tree classes of size ≤ 8, my matching-number DP equals a
direct vertex-cover search over all subsets, and my independence-polynomial DP
equals direct subset enumeration; and on 400 random two-component forests,
`τ` is additive and the polynomial is the convolution. Zero mismatches. The
class counts independently reproduce A000055 and A005195. ✔

**C4 — Could the Γ indexing be chosen to make a false claim look true?** No: the
identity itself is verified in the exact form the Lean lemma states, in `t`,
independent of any naming; the indexing question only affects the *excluded*
`catalan_gap5_pos`, and under the only indexing consistent with the run's own
reported `Γ(5,5) = −14` the excluded claim is true with a sharp threshold. ✔

**C5 — Are the numeric checks exhaustive or sampled?** For statement (a) they
are **exhaustive over the entire finite domain the hypotheses admit**: `hcert`
over all `d ∈ [0,n]`, `hf_j` over all `m ∈ [0,n]`, and the joint bound over all
1,007–20,069 admissible profiles. Statement (b)'s supporting floors are checked
on wide grids and, more importantly, their *proofs* are structural (monotone /
antitone to the central binomial), which I audited directly. ✔

**C6 — Is the counterexample evidence sound?** The structural objective is used
only to steer the search; every reported witness is re-verified by direct 2^13
enumeration and exact τ computation, and `struct_matches_direct_enumeration` is
true for all three. Existence — which is all the record claims — is
established by explicit witness. ✔

**C7 — Remaining imprecisions in `INFORMAL-PROOF.md` (escalated, not
fail-closed).**

1. **§3, "Every other lemma is stated for an arbitrary `SimpleGraph X`."**
   Strictly false: `forest_card_edges_add_components` (14),
   `cover_five_sparse_vertex` (25), `cell_bound` (34) and `cell_9..cell_17`
   (35–39) each carry `hF : F.IsAcyclic`. The intended and obviously correct
   reading — acyclicity is *consumed* at one place, `budget_bound`, and every
   lemma **below** it in the chain is graph-general — is the governing text's
   own phrasing (adjudication and synthesis both say "`budget_bound` (the sole
   point where acyclicity enters)"), the same sentence names ENTRY 58 as part of
   the chain, and §2 of the same document displays `cell_9` **with**
   `(hF : F.IsAcyclic)` one page earlier, so no reader is misled. Classified
   *imprecise but true under a charitable reading*; it does not weaken or
   overstate the claim. Recommend tightening to "every lemma below
   `budget_bound` in the chain".
2. **§5, "all 30 of the frozen tag digests this run's provenance cites."** The
   run cites **31** frozen entries; `EVIDENCE/verify_frozen_entry_tags.py`
   covers 30, omitting frozen ENTRY 147 (`catalan_recurrence_int`, run entry
   50). I closed the gap myself: all 187 frozen tags recompute, and run entry 50
   is token-identical to frozen ENTRY 147. An off-by-one in an evidence-coverage
   count with no substantive consequence.
3. **Generator import lists.** Both `generate_card5_evidence.py` ("itertools,
   math, json, hashlib") and `verify_frozen_entry_tags.py` ("hashlib, re")
   declare an explicit import list per condition (iv), but each also imports
   `pathlib` without listing it. Standard-library-only is satisfied; the list is
   merely incomplete.
4. **Attribution granularity.** Condition (i) names the Cycle 5 critics as
   "(C-U4-T, C-U4-F of Cycle 5)"; §6 credits "**Critic-derived in Cycle 5**…"
   with the substance (the `f(d) ≥ 42 − 14d` certificate and the five-cell
   reach) but does not print the two seat identifiers. The synthesis's own
   governing text is likewise unnamed ("critic-derived in Cycle 5"). Substance
   satisfied; seat identifiers recommended.
5. **Unused registered lemmas.** `cover_five_sparse_vertex` (25) and
   `binomDelta_mono` (44) are registered, compiled and axiom-clean but not
   consumed by the terminal theorem, and are not marked as such (unlike entries
   28 and 51, which are). Cannot weaken anything.

None of items 1–5 is a false claim about the mathematics, about a mandated
repair, or about the scope of the award, and none would change the award's grade
or its fences.

---

## Scope and Fence Check

Every fence of the synthesis dispatch and of the formalizer brief §2, checked
against the terminal declaration, `INFORMAL-PROOF.md`, and the contract's
`informal_statement`:

| fence | on the face of the award? | verified |
|---|---|---|
| Statement (a) is **FIXED-CELL** — one `(r,k,order)` triple each, not uniform in `d`, in the order, or in `r` | §7 bullet 1 + contract | ✔ each `cell_n` fixes one numeral order and one literal rank |
| Statement (b) is **parameterized in `(n,k)`** | §7 bullet 2 + contract | ✔ `∀ n k : ℕ` |
| `x(F) < r` is **never** a hypothesis anywhere | §3, §7 + contract | ✔ grep: absent |
| Alias line targets `E993-R25-CARD5-JOINT-BUDGET-CELLS` (grade change, `proved_informal → formally_verified`), **also naming** `E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY` (OPEN) and `E993-GRAPH-VERTEX-COVER-DELTA-PARTITION` | §2 "Alias, in full" + §7 + **contract `informal_statement` (completed in repair 1)** | ✔ all three keys present in the contract text |
| Statement (b) takes the new key `E993-R25-CARD5-COVER-CATALAN-BOUND` | §2, §7 + contract | ✔ |
| `cell_9`'s positivity content is already frozen ENTRY 175, more generally — **novelty is FOUR cells, not five** | §7 + contract | ✔ I read frozen ENTRY 175: `forest_delta_one_pos : [Finite X] → F.IsAcyclic → 6 ≤ Nat.card X → 0 < delta F 1` — unconditional, no cover, no fixed order. The disclosure is accurate. |
| Cover hypothesis **VACUOUS at orders 9 and 11**, cover-essential only at 15 and 17 | §7 + contract | ✔ independently reproduced by my census (τ ≤ 5 population = total at 9 and 11; load-bearing only at 15 and 17) |
| `catalan_gap5_pos` is an instance of the formally verified `E993-R25-CATALAN-GAP-MONOTONE-RATIO` at τ = 5 and is **NOT new / not registered** | §4, §7 + contract | ✔ not registered; only a comment records the exclusion |
| **Never** `c(d) = min(d,5)` in Lean; **never** a tier statement | §7 + contract | ✔ absent |
| Does **NOT** discharge `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST` — each cell proves **one** rank `k = r−1`; **no Lean object in this run discharges the lower ranks** | §7 + contract | ✔ each `cell_n` has a single literal `k`; nothing in the run quantifies over `k < r` |
| **Far from sharp** at four of five cells; true minima **19/39/56/56/43** | §7 + contract | ✔ reproduced exactly by my census |
| Population at order 13 is **3,073** (τ ≤ 5), **not** 3,658 (total class count) | §7 + contract | ✔ reproduced exactly (3,073 and 3,658) |
| The gate's `Δ₃ = −8` is a **witness**, not a cell minimum; τ = 5 graphs at −9 and −10 exist | §7 | ✔ all three exhibited and verified; searched minimum is −10 |
| Frozen line spans ENTRY 174 = 3743–3765, ENTRY 178 = 3844–3861 (repair 1(4)) | §4, §7 + contract | ✔ recomputed |
| No `cover_five_sparse_vertex'` (repair 1 / (vi)) | — | ✔ does not exist; unprimed form is entry 25 |
| Declaration counts stated exactly | report | ✔ 52 registered = 5 definitions + 46 lemmas + 1 terminal theorem; 52 axiom lines |
| `unnecessarySimpa` attributed to inherited ENTRY 166 | report | ✔ the warning is at `Main.lean` line 287, inside registered entry 17 = frozen ENTRY 166 |
| **ONE** terminal declaration bound | contract `lean_binding` | ✔ one `theorem`; all six components are `lemma`s |
| Byte-for-byte transcription of every frozen entry, tag digests recomputing | §5 | ✔ see Reproduced Evidence §6 — **the repair (iv) byte is now present and byte-identical to frozen line 3761** |
| No `sorry`/`admit`/`native_decide`; axioms within the three standard ones; report's axiom sentence reads "within the three standard axioms" | §8 + report + `EVIDENCE/axioms-all-52-declarations.txt` | ✔ |
| Six contract-text repairs (i)–(vi) present; 0 proof-term repairs | §5, §7, contract | ✔ all six present and now **true**; the child changed one comment and one whitespace byte, nothing else |
| No `formally_verified` claim by this run | §8, report status | ✔ status `compiled-candidate`; the run explicitly disclaims the grade |

**The claim asserts nothing fenced.** The terminal statement is exactly the five
fixed cells plus the parameterized card-5 cover bound, and nothing else.

---

## Verdict

**passed**

The informal proof of the child run
`runs/lean-2026-09-22-c6-card5-cells-and-cover-catalan-repair-1`
(`INFORMAL-PROOF.md`, SHA-256 `396a5e18…`) is an adequate proof of the intended
claim — the contract's `informal_statement`, claim hash
`3e3e30aaf67f2a6664c447c1148ad32ff0d42516dd58d3d3e0cbbf43b4a98952`, recomputed
by me and matching the controller's value.

Every definition matches the compiled source and the frozen G1 source; every
inference step is sound; every ℕ-subtraction and truncating cast is guarded;
every equality used is an identity that I recomputed; every numeral in the
award — the five totals 9/5/9/21/42, both LP-dual certificates over the full
admissible cross-degree-profile domain, the floors, the six-term Γ(5,k)
identity, the true minima 19/39/56/56/43 and the τ ≤ 5 populations
153/710/3,073/10,648/29,915 — reproduces exactly under an instrument I wrote
from scratch; the 13-vertex τ = 5 general-graph witnesses at Δ₃ = −8, −9 and
−10 all exist and all break `cell_13`, confirming acyclicity is load-bearing
where the proof says it is; the terminal declaration's hypotheses match the
claim one for one; nothing marked NOT a dependency is a dependency; every fence
and every mandatory disclosure is on the award's face; and the transcription of
all 31 frozen G1 entries is token-identical to `sources/g1/`, with the
mandated repair-(iv) byte — the trailing space of frozen line 3761 — **now
present and byte-identical**, which the parent run claimed but did not deliver.

The defect that failed the parent is fully and honestly discharged: the child
restores exactly that one byte (registrar digest `f72c64b6…`, the value I
predicted independently on the parent before the redirect), retracts rather than
repeats the false restoration and digest claims, removes the `/tmp` citation,
completes the alias line in the contract, and states the frozen line spans — and
the terminal statement, every proof term, every cell parameter and the axiom
footprint are unchanged.

Five imprecisions remain and are escalated rather than treated as defects
(§"Independent Critic Pass" C7): the over-broad sentence in §3 about acyclicity
appearing in "every other lemma"; the 30-versus-31 frozen-tag coverage count in
§5, which I closed myself; `pathlib` omitted from two generators' declared
import lists; the Cycle 5 critic seats not named by identifier in §6; and two
registered-but-unused lemmas not marked as such. None is a false claim about the
mathematics, a mandated repair, or the scope of the award, and none would change
the award's grade or any fence.

Scope of this attestation: the informal mathematics only. It is not a
formalization-fidelity review, not a kernel receipt, and not a `close`.
