---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la1-formalizer-opus-20260924
critic_id: c1-la1-fable-informal-20260924
attestation_id: c1-la1-informal-pass-20260924
claim_sha256: 6475aebe1cd21bcb8ace66326950059f8ea5f570f5376e8c37af0192b9748d84
---

# Informal Proof Integrity Audit

**VerityOS boot acknowledgment.** Operating within VerityOS. Read for this seat, and nothing
outside the brief §1 read boundary: `verity.md`; `identity/startup-protocol.md`;
`skills/proof-integrity-audit/skill.md`. Subsystems loaded: `identity/`, `skills/`
(proof-integrity-audit only), `experiments/` (this run root, the sealed capsule
`control/c1-stage7-capsules/C1-LA1-PACKET-MANIFEST.json` and its members, the controller's
formalizer brief, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, and the frozen C5-LA1 award under
`sources/r24/c5-la1/`). No memory, decisions, logs, knowledge, operations, writing or conversation
records were read or written; no inbox item was created; no durable VerityOS record was touched.
No network, no installs, no Lean build, no `find`/`grep` rooted above these paths. I am not the
producer: no contract, Lean source, informal proof or receipt was edited. The only files written
are `scratchpad/c1-s7-informal-LA1/INFORMAL-AUDIT.md` (this file) and the scratch
`audit_eval.py`, `audit_run.py`, `audit_sharp.py`, `audit_summary.json` beside it.

**Model disclosure.** Chartered seat: Claude Opus 5, chartered effort high. This seat cannot
self-inspect its runtime model or effort; the model and effort are stated on dispatch-record
authority, per the brief §0. Child delegation was forbidden and none occurred: every computation,
read and judgment below is this seat's own.

## Intended Claim

The intended claim is exactly `THEOREM-CONTRACT.yaml` → `theorem.informal_statement`
(contract `c1-la1-top-rank-residual-sign-v1`, `theorem-contract/v1`):

> For every finite simple graph `G` on a finite vertex type with decidable equality and decidable
> adjacency: if `G` is a tree, `2 ≤ α(G)`, `x(G) + 2 ≤ α(G) − 1`, and every leaf of `G` belongs to
> every maximum independent set of `G`, then the literal top-rank residual aggregate satisfies
> `S(G, α(G)−1) ≤ 0`. … The statement is NON-STRICT and is confined to rank `α−1` on the eligible
> residual class.

I recomputed the digest myself: `" ".join(s.split())` of the `informal_statement`, SHA-256 =
`6475aebe1cd21bcb8ace66326950059f8ea5f570f5376e8c37af0192b9748d84` — **equals the brief's value.**

Artifact digests, recomputed by me and all matching the brief's expected values:

| Artifact | SHA-256 | Expected |
|---|---|---|
| `THEOREM-CONTRACT.yaml` | `c73eb8dc970327036f2ea034f1d1b84de0b62075b389f147037c83ce12fc2c6d` | match |
| `INFORMAL-PROOF.md` | `dd3c42eaff9c4bab57e7399d56dcd0dd950daa83e0c00e784e52542a0ef3dba9` | match |
| `LeanProject/LeanProof/Main.lean` | `aff08ce72f9a5f1a93c9b8cb34c0f26ceeddc105cc5a94a4a132d5b6f6367dbc` | match |
| frozen C5-LA1 `sources/r24/c5-la1/.../Main.lean` | `0933211d8f02acd867e91547d4a2b09d13fcc3ea178e192e385acc33b696b63b` | match |
| capsule inner seal (recomputed from the manifest minus `seal_sha256`) | `da278eb66e273bedeaaa4684767138afebb39ef4b5198a0c05d9b985f5c64b2b` | match |

I re-verified the capsule gate independently: the seal recomputes, and **all 42 members** match on
byte count and digest (0 mismatches). All **60** `source_materials` entries of the contract
(9 files + 51 registrar fragments) verify against their recorded digests (0 mismatches).

**The terminal declaration.** `lean_binding.expected_statement` occurs *literally* (byte-for-byte,
including the two-space continuation indents) in `LeanProject/LeanProof/Main.lean` (entry 148),
in `cycles/cycle-1/stage6/SYNTHESIS.md` `## Lean awards`, in `INFORMAL-PROOF.md` §0 and in the
formalizer brief §2. Its recomputed SHA-256 is
`7ab65fbf07bda813ce859c89a52e79802fee3c10f2ee2662d64deff9483576a6`, equal to
`expected_statement_sha256`. **All four hypotheses are verbatim, none dropped, weakened, reordered
or added**; the declaration is the single `theorem` in the file (148 entries: 36 definitions,
111 lemmas, 1 theorem), fully qualified `R26LA1.topRankResidualSign`, section variables
`{V : Type*} [Fintype V] [DecidableEq V]` exactly as C5-LA1, with `crossingIndex` and `aggregate`
resolved through `open C5LA1`.

## Claim Ledger

Every node of `INFORMAL-PROOF.md`, in the brief §3 R3 DAG order. "Lean" is the shipped
declaration's *actual* hypothesis list, read from `Main.lean`; "verdict" is mine after
independent recomputation. Symbols as in the informal proof: `L`, `ℓ = |L|`, `λ`, `α`,
`M = i_α(G)`, `C`, `D`, `a`, `S = aggregate G (α−1)`, `(★) = hResidual`.

### Definition layer

| # | Object | Lean text checked | Verdict |
|---|---|---|---|
| D1 | `supportSet G = univ.filter (0 < λ ·)` | `Finset.univ.filter fun s => 0 < C5LA1.leafDegree G s` | matches §1 exactly |
| D2 | `interior G = univ \ (L ∪ C)` | `Finset.univ \ (C5LA1.leafSet G ∪ supportSet G)` | matches |
| D3 | `interiorIndep` | `(interior G).powerset.filter (IsIndepSet ·)` | matches; **filter of `Finset.powerset`, not `induce`** |
| D4 | `aVal = a` | `(interiorIndep G).sup Finset.card` | matches; always defined (∅ ∈ interiorIndep) |
| D5 | `C₁`, `C₂` | `univ.filter (λ · = 1)`, `(λ · = 2)` | matches |
| D6 | `w G B` | `((B ∩ leafSet G).card : ℤ) − ∑ s ∈ B, (leafDegree G s : ℤ)` | matches, **in `ℤ`**, and is *definitionally* (RI)'s summand — the shipped `sign_bound` closes that step by `rfl` |
| D7 | `USet G J` | `(C1 G).filter fun s => ∀ d ∈ J, ¬ G.Adj s d` | matches |
| D8 | `maxIndepInterior` | `(interiorIndep G).filter (·.card = aVal G)` | matches |
| D9 | `topShell` | `C5LA1.indepSetsAvoiding G ∅ (G.indepNum − 1)` | matches; **the contract carrier** |
| D10 | `slack G B = h(B)` | `(ℓ : ℤ) − (|B∩L| : ℤ) − ∑ s ∈ B, (λ s : ℤ)` | matches, in `ℤ` |
| D11 | `famI/famII/famIII`, `N2` | filters of `topShell` on `(B ∩ interior G).card = aVal G` and `B ∩ supportSet G = ∅ / ≠ ∅ / ¬(…= aVal)` | matches §1 and §3 exactly; a genuine three-block partition |
| D12 | `famIIMap (s,J)` | `insert s (J ∪ (L \ L.filter (support · = s)))` | matches |
| D13 | `shellD` | `(interiorIndep G).filter fun J => J.card + 1 = aVal G` | matches; **`a − 1` is never written in `ℕ`** |
| D14 | `famIIIIndex`, `famIIIMap ⟨J,A⟩` | `(shellD G).sigma (fun J => indepPowerset G (USet G J))`; `A ∪ J ∪ (L \ L.filter (support · ∈ A))` | matches |

`λ`, `L`, `support`, `indepSetsAvoiding`, `indepSetCount`, `forwardDifferenceDel`, `crossingIndex`,
`aggregate`, `H`, `R` are used **by name** from C5-LA1; I confirmed no C5-LA1 definition is
re-stated or re-proved anywhere in the shipped file. **`SimpleGraph.induce` occurs nowhere** (0
occurrences of the token `induce`), as the informal proof's carrier-discipline paragraph (R4)
claims. `I_k(T[D])` is realised as `interiorIndep`/`maxIndepInterior`/`shellD` and `I(T[U(J')])` as
`indepPowerset G (USet G J)` — both filters of `Finset.powerset`, as stated.

### Structure

| # | Node | Informal hypotheses | Lean hypotheses | Verdict |
|---|---|---|---|---|
| S1 | L-12 `c_eq_support_image` | none | — | **verified** — `C = support '' L` recomputed on all 987 tree classes of orders 1–12, 0 failures |
| S2 | L-8 `leaf_support_disjoint` | `hyp-tree`, `hyp-alpha` (connectivity) | `hTree`, `hAlpha` | **verified** — `L ∩ C = ∅` holds on every tree with `α ≥ 2` (985 classes, 0 failures); **sharp**: on `K₂ ⊔ K₂` (α = 2, not connected) `L ∩ C = {0,1,2,3} ≠ ∅` |
| S3 | L-10 `leaf_degree_sum_eq_card` | none | none | **verified** — `Σ_s λ(s) = ℓ`, 0 failures on all 987 classes |
| S4 | L-6 `leaf_card_ge_two` | `hyp-tree`, `hyp-alpha` | `hTree`, `hAlpha` | **verified** — 0 failures; **sharp**: `K₂` is a tree with `ℓ = 2` but `α = 1`, and `K₁` has `ℓ = 0` |
| S5 | L-10 `k2_le_ell_div_two` | none | none | **verified** — `j·\|C_j\| ≤ ℓ` for every `j` and every tree (all `j`, all classes, 0 failures); hence `2k₂ ≤ ℓ` |
| S6 | L-11 `eligible_imp_alpha_ge_three` | `hyp-eligible` alone | `hEligible` alone | **verified** — pure `ℕ` arithmetic on the truncated subtraction: `α ≤ 2 ⟹ α−1 ≤ 1 < x+2`. 0 failures |
| S7 | X-5 `maxIndep_no_support` | `(★)` alone | `hResidual` alone (no `hTree`, no `hAlpha`) | **verified** — Lean signature confirms `(★)`-only; recomputed on every residual tree, 0 failures |
| **S8** | **GATE L-9 `alpha_eq_ell_add_a`** | `hyp-tree`, `hyp-alpha`; **`(★)`-free** | **`hTree`, `hAlpha` only** | **verified, and the `(★)`-freeness is literal in the Lean signature.** `α = ℓ + a` recomputed on **all 985 tree classes with `α ≥ 2` of orders 1–12, residual or not, 0 failures.** Both directions of the informal argument check out: `≥` uses `L` independent + no `D–L` edge + `L ∩ D = ∅`; `≤` uses `V = L ⊎ C ⊎ D`, the injection `S∩C ⊆ (L∖S).image support` (a leaf over `s ∈ S` cannot lie in `S`), `Finset.card_sdiff_add_card_inter`, and `\|S∩D\| ≤ a`. **Sharp in both hypotheses**: `K₂` (tree, `α = 1`) gives `ℓ + a = 2 ≠ 1 = α`; `K₂ ⊔ K₂` (`α = 2`, disconnected) gives `ℓ + a = 4 ≠ 2 = α`. The contract's `node-alpha-eq-ell-add-a` has **no incoming edge from `hyp-residual`**. |
| S9 | L-9 + `(★)` `max_indep_eq_leaf_union_D` | gate, `(★)` | `hTree`,`hAlpha`,`hResidual` | **verified** — every maximum `S` satisfies `L ⊆ S`, `S ∩ C = ∅`, `\|S∩D\| = a`, `S = L ∪ (S∩D)`; 0 failures on all residual trees |
| S10 | L-9 + `(★)` `M_eq_card_maxIndep_D` | gate, `(★)` | same | **verified** — `M = i_α(G) = \|maxIndepInterior G\|` on the contract carrier, 0 failures |
| S11 | L-1 `forced_neighbour` | `hyp-tree`, `hyp-alpha`, `(★)` | `hTree`,`hAlpha`,`hResidual` | **verified** — no independent `B` with `\|B∩D\| = a` contains a `λ = 1` support; 0 failures on residual trees. The witness `T = {s} ∪ J ∪ (L∖{v})` is independent and has size `1 + a + (ℓ−1) = ℓ + a = α` **by the gate**, so `(★)` is contradicted. **Sharp**: **all 117** non-residual tree classes with `α ≥ 2` of orders 3–10 violate it (117 of 117), first at order 4 |

### Counting

| # | Node | Verdict |
|---|---|---|
| C0 | **(RI) carried** `C5LA1.topRankResidualIdentity` | **verified and correctly quoted.** The frozen entry 31 states `aggregate G (α−1) = (ℓ·i_α(G) : ℤ) − ∑_{B ∈ indepSetsAvoiding G ∅ (α−1)} ((\|B∩L\| : ℤ) − ∑_{s∈B} (λ s : ℤ))` — exactly `S = ℓM − W` with `W = ∑ w(B)`. I recomputed `S = ℓM − W` on **all 312 eligible residual trees of orders 7–12, 0 failures**, and confirmed it **fails on every one of the 117 non-residual tree classes with `α ≥ 2` of orders 3–10** (first at order 4, `P₄`), so the identity is not vacuous and `(★)` is doing real work |
| C1 | L-2 `h_nonneg` | **verified** — `0 ≤ h(B)` for **every** independent `B` of **every** tree to order 12 (independence is the only input; the leaves in `B` and the leaves forced out by supports in `B` are disjoint subsets of `L`). Lean signature takes independence alone |
| C2 | L-2 `budget_identity` **= 1** | **verified as an exact `ℤ` identity** on every member of every top shell of every tree with `α ≥ 2` (orders 1–12), 0 failures. The expansion is correct: `Σ_{B∩C}(λ−1) = Σ_{s∈B}λ(s) − \|B∩C\|` (λ vanishes off `C`), so the left side collapses to `a + ℓ − \|B\| = a + ℓ − (α−1) = 1` using `V = L ⊎ C ⊎ D` (needs S2) and the **gate** |
| C3 | L5′ `budget_shapes` | **verified** — all three terms are `≥ 0` (`λ ≥ 1` on `C`; `\|B∩D\| ≤ a`; `h ≥ 0`), and exactly one equals 1, on every shell member of every tree with `α ≥ 2`, 0 failures. Shape 3 is stated in `ℤ` as `(\|B∩D\| : ℤ) + 1 = (a : ℤ)`; I confirmed the Lean disjunction has exactly that third branch. **The `a−1` shell at `a = 0` is genuinely empty by construction** (`shellD` is `J.card + 1 = aVal G`), never by `ℕ`-truncation |
| C4 | L5″ `family_support_pruned` | **verified** — under `(★)` every shell member with `\|B∩D\| = a` has `B∩C = ∅` or `B∩C = {s}` with `λ(s) = 2`; 0 failures on residual trees, and the **fourth arithmetic shape is empty** on every residual tree. **Sharp**: **all 117** non-residual tree classes with `α ≥ 2` of orders 3–10 violate it, first at order 4 (a `λ = 1` support survives in the shell) |
| C5 | L-3 `family_I_weight`, `famI_eq_image`, `famI_card`, `W_I` | **verified** — `w(B) = ℓ−1` on `famI`; `famI` is *exactly* the image of `maxIndepInterior ×ˢ L` under `(J,v) ↦ J ∪ (L.erase v)` and that map is injective there (checked set-equality and injectivity, not just cardinality); `\|famI\| = ℓ·\|maxIndepInterior\| = ℓM`; `W_I = ℓ(ℓ−1)M`. 0 failures. The `famI_eq_image`/`famI_card` nodes hold at **`hTree`+`hAlpha` alone** (checked on all 985 trees with `α ≥ 2`), exactly as the Lean declares; `(★)` enters only at the `\|maxIndepInterior\| = M` step (S10), which is where the informal proof puts it |
| C6 | L-3 `family_II_weight`, `W_II` | **verified** — `Σ_{s∈B}λ = 2`, `Σ(λ−1) = 1`, `h = 0`, `\|B∩L\| = ℓ−2`, `w(B) = (ℓ−2) − 2 = ℓ−4`, `W_II = (ℓ−4)N₂`. 0 failures |
| C7 | L-4 `famIIIMap_spec` / `famIII_subset_image` / `famIII_eq_image` / `famIIIMap_injOn` | **verified** — `famIII` is *exactly* `famIIIMap '' famIIIIndex`, the map is injective on the index, the **outer index is the `a−1` shell** `shellD` (never the maximum shell), and each image has weight `ℓ − 2\|A\|`. Checked as set-equality plus injectivity on all 985 trees with `α ≥ 2`, 0 failures |
| C8 | L-5 `deletionInjectionBound` (ARMW 2020, re-proved in-run) | **verified** — `2 Σ_{A ∈ I(U)}\|A\| ≤ \|U\|·\|I(U)\|` on **31,880 (graph, `U`) instances**: every tree class of orders 3–9 against **every** subset `U` of its vertex set. 0 violations. The Lean declaration takes no graph hypothesis at all |
| C9 | L-5 `fibre_nonneg`, `famIII_sum_nonneg` (`W_III ≥ 0`) | **verified** — `(ℓ−\|U(J)\|)·\|I(U(J))\| ≤ Σ_{A}(ℓ−2\|A\|)` (algebraically equivalent to C8), `\|U(J)\| ≤ \|C₁\| ≤ ℓ` (the `j = 1` case of S5), every fibre sum `≥ 0`, and `W_III = Σ_J Σ_A (ℓ−2\|A\|) ≥ 0`. 0 failures |
| C10 | L-10 `N2_le_k2_mul_M` | **verified** — every `B ∈ famII` equals `famIIMap (s, B∩D)` with `s ∈ C₂` and `B∩D ∈ maxIndepInterior` (I checked the reconstruction identity pointwise, including `B∩L = L ∖ leaves(s)` via the equal-cardinality `ℓ−2` argument), hence `N₂ ≤ k₂M`. 0 failures |
| — | `W_split` | **verified** — the three families partition `topShell` and `W = W_I + W_II + W_III`, 0 failures (Lean declares it hypothesis-free) |
| — | `node-sign-bound` | **verified** — `S = ℓM − W ≤ ℓM − ℓ(ℓ−1)M − (ℓ−4)N₂ = −ℓ(ℓ−2)M − (ℓ−4)N₂` in `ℤ`. Recomputed on all 312 eligible residual trees, 0 failures. The shipped proof is literally this: `hRI` rewritten by `W_split`, `famI_sum`, `famII_sum`, then `nlinarith` with `famIII_sum_nonneg` |

### Finish

| # | Node | Verdict |
|---|---|---|
| F0 | L-7 `ell_two_lambda_two_imp_alpha_two` | **verified** — a tree with `ℓ = 2` carrying a `λ = 2` support is `P₃` and has `α = 2`; 0 failures on all tree classes to order 12. The Lean signature is `(hTree) (hLeafCard : ℓ = 2) {s} (hDeg2 : λ s = 2)` — **it does not take `hAlpha`**, exactly as `INFORMAL-PROOF.md` §0 and §4 claim |
| F0′ | `C2_card_eq_zero_of_alpha_three` | **verified** — signature is `(hTree) (hAlpha3 : 3 ≤ α) (hell : ℓ = 2)`, i.e. it takes `3 ≤ α` and **not** `hEligible`, making the "`hyp-eligible` is consumed only through `α ≥ 3`" claim literal in the Lean text. 0 failures |
| F1 | `finish_ell_ge_four` | **verified** — `ℓ(ℓ−2) ≥ 0`, `ℓ−4 ≥ 0`, `M, N₂ ≥ 0`, so both terms of the bound are `≤ 0` |
| F2 | `finish_ell_three` | **verified** — `2k₂ ≤ 3 ⟹ k₂ ≤ 1 ⟹ N₂ ≤ k₂M ≤ M`; bound reads `−3M + N₂ ≤ −2M ≤ 0`. `N₂ ≤ M` appears only as a local `have` *inside* this branch, derived from `k₂ ≤ 1` — never as a registered claim |
| F3 | `finish_ell_two` | **verified** — `C₂ = ∅` via F0′, so `k₂ = 0`, `N₂ ≤ k₂M = 0`, and the bound reads `−2·0·M − (−2)·0 = 0` |
| F4 | `ℓ ≤ 1` impossible | **verified** — by S4; and directly: **0** eligible residual trees with `ℓ ≤ 1` exist to order 12 |
| T | terminal `topRankResidualSign` | **verified** — the shipped proof splits `ℓ < 4` / `ℓ ≥ 4` with `2 ≤ ℓ` from `leaf_card_ge_two`, then `ℓ = 2` / `ℓ = 3`, and consumes `hEligible` in exactly two places: `eligible_imp_alpha_ge_three G hEligible` (the `ℓ = 2` branch) and the pass-through `sign_bound … hEligible …` |

### `hyp-eligible` audit (the sharpest claim on the face)

`INFORMAL-PROOF.md` §0 asserts that `hEligible` is consumed **only** through `α ≥ 3`, its only
other occurrence being an inert argument of (RI) "whose own proof does not use it". I checked this
three ways and it is **literally true**:

1. In the shipped source, `hEligible` occurs in exactly three declarations:
   `eligible_imp_alpha_ge_three` (which takes it alone and yields `3 ≤ α`), `sign_bound`, and the
   terminal theorem. `sign_bound` uses it at exactly one site: `C5LA1.topRankResidualIdentity G
   hTree hAlpha hEligible hResidual`.
2. In the **frozen** C5-LA1 entry 31, the token `hEligible` occurs **0 times in the proof body**
   (`hTree` 1, `hAlpha` 3, `hResidual` 2). The argument is genuinely inert.
3. The contract's dependency graph has `hyp-eligible →` only
   `{node-eligible-imp-alpha-ge-three, node-top-rank-residual-identity, conclusion}`, and
   **the forbidden edge `node-eligible-imp-alpha-ge-three → node-sign-bound` is absent.**

### `ℕ`-subtraction and cast audit

I enumerated **every** `ℕ`-level subtraction in the shipped source and checked each against
`INFORMAL-PROOF.md` §5.

| Expression | Occurrences | Discharge, verified |
|---|---|---|
| `G.indepNum - 1` | 29 | `hAlpha : 2 ≤ α` gives `(α−1)+1 = α`; used only as the rank of `topShell`/`aggregate` |
| `p - 1` | 11 | inside the **frozen** C5-LA1 entries (`aggregate`, entry 31), already verified in r24; `hp1 : p−1+1 = p` is discharged there by `omega` |
| `a - 1` | 2 | inside the **frozen** C4LA1 entry 18 (`topRankSelectorCollapse`), a local `ℕ` variable; not a run-authored subtraction |
| `(leafSet G).card - 2` | 1 | `Finset.card_sdiff` with `F ⊆ L`, `\|F\| = 2`; the `ℤ` form comes from `famII_card_inter_leaf`, which is proved as `\|B∩L\| + 2 = ℓ` **in `ℕ` with no subtraction** |
| `(leafSet G).card - A.card` | 3 | `Finset.card_sdiff` with `leaves(A) ⊆ L`; converted to `ℤ` at one explicit site with `A.card ≤ ℓ` in hand |
| `aVal G - 1` | **0** | the `a−1` shell is `J.card + 1 = aVal G`; **never formed** |
| `G.indepNum - (leafSet G).card` (`α − ℓ`) | **0** | the gate is the *equation* `α = ℓ + a`; **never formed** |
| `λ(s) − 1`, `ℓ − 2`, `ℓ − 4`, `a − \|B∩D\|`, `ℓ − \|B∩L\| − Σλ` | — | **all of these occur only inside `ℤ` expressions with explicit casts**; I grepped for `) - 1`, `) - 2`, `) - 4` outside a `ℤ` context and found **none** |

Every inequality that can cross zero (the budget terms, the weights, the fibre sums, the sign
bound) is stated in `ℤ`. **No truncating subtraction is load-bearing anywhere.**

### Carry and registrar audit (brief §2.3)

- **All 31 `VERITYOS ENTRY` bodies** of the frozen C5-LA1 source are registered in the run under
  the same names, at registrar indices `1–14` and `37–53` — **relative order preserved**.
  **30 of 31 bodies are byte-identical**; the single exception is entry 31,
  `C5LA1.topRankResidualIdentity`, where `theorem` → `lemma` on the declaration line and every
  other byte is identical (2759 → 2757 bytes;
  `4cd69d70…` → `834e7be0…`). This is **the one recorded one-token keyword diff the brief allows**,
  and `CAPSULE-VERIFICATION.json` `r1_byte_diff` records exactly these digests. I also re-verified
  that each frozen entry's *declared* digest equals the SHA-256 of its own body.
- **The 20 seat/critic declarations** named in the carry table are byte-identical to their origins
  (6 exactly; 14 up to the same single `theorem` → `lemma` token — matching the declared
  `r2_carry_keyword_normalisation` count of 14). Origin file digests for `U2-Main.lean`,
  `U3-Main.lean`, `C-U3-T-CriticU3T.lean`, `C-U2-T-CriticT.lean`, `C-U2-F-CritF.lean` all match
  the table in `INFORMAL-PROOF.md` §6.
- **U1 is not carried.** `U1-Main.lean.NOT-CARRIED` contains exactly **5 `sorry` tactics**. No U1
  *lemma or theorem* body appears in the shipped source. Two U1 *definition* bodies
  (`supportSet`, `interior`) coincide textually — these are one-line definitions with no proof
  content, arrived at by the run's own choice of the filter spelling, and no `sorry`-bearing proof
  is imported. The `R26CritU3T.supportSet` *image* spelling is correctly **not** carried;
  `c_eq_support_image` (L-12) connects the two spellings, exactly as §6 says.
- **Axioms.** `EVIDENCE/axioms-all-declarations.txt` has 148 lines
  (`7eeebe12…`, matching the report) and `EVIDENCE/axioms.txt` (`9d1a2827…`) carries
  `'R26LA1.topRankResidualSign' depends on axioms: [propext, Classical.choice, Quot.sound]`.
  Every declaration lies inside the permitted set. No `sorry`, `admit`, `native_decide` or
  `axiom` command occurs in the shipped source, and the token `decide` occurs **0** times, so no
  `decide` over an enumeration stands in for a universal step.

## Reproduced Mathematical Evidence

All numbers below are from **my own** exact-integer code, written from scratch under
`scratchpad/c1-s7-informal-LA1/` (`audit_eval.py`, `audit_run.py`, `audit_sharp.py`). Import list:
`sys`, `json`, `itertools`, `functools` — standard library only. No prior evaluator, generator,
census file, scan output or report was imported or read. No wall-clock, PID or host field is
written in any hashed output. Free trees are generated by leaf-addition closure with a
centre-rooted AHU canonical form; every graph object (`IsGraphLeaf`, `leafSet`, `support`,
`leafDegree`, `indepSetsAvoiding`, `indepSetCount`, `forwardDifferenceDel`,
`vertexDeletionIndepSetCount`, `IsFavorableAt`, `H`, `R`, `aggregate`, `crossingIndex`,
`indepNum`, and the whole `R26LA1` definition layer) is re-implemented directly from the Lean
definitions of record.

**Instrument trusted only after the fixed points.**

| Object | `α` | `x` | `ℓ` | `S(G,α−1)` | residual | eligible | record | agrees |
|---|---|---|---|---|---|---|---|---|
| `P₃` | 2 | 1 | 2 | **+2** | true | **false** | `+2`, ineligible | ✓ |
| `P₅` | 3 | 2 | 2 | **0** | true | **false** | `0`, ineligible | ✓ |
| `P₇` | 4 | 2 | 2 | **−4** | true | **false** | `−4`, ineligible | ✓ |
| `P₁₁` | 6 | 3 | 2 | **−18** | true | **true** | `−18`, first eligible path | ✓ |
| `T₁` | 5 | 2 | 4 | **−14** | true | true | `−14` | ✓ |
| `T₂` | 8 | 4 | 7 | **−47** | true | true | `−47` | ✓ |

`T₁` and `T₂` were **not** imported from any frozen generator (that file is outside my read
boundary). I searched my own enumeration for the recorded invariants. At `(ℓ = 4, α = 5, S = −14)`
there is **exactly one** eligible residual isomorphism class to order 12: the order-7 tree
`0–{1,2,3,4}`, `1–5`, `5–6` (leaves `{2,3,4,6}`, supports `0` with `λ = 3` and `5` with `λ = 1`,
interior `{1}`), with `x = 2`, `M = 1`, `N₂ = 0`, `W_III = 6` — and the exact identity closes:
`−S = 4·2·1 + 0·0 + 6 = 14`. At `(ℓ = 7, α = 8, S = −47)` the smallest is the order-10 tree with
`x = 4`, `M = 1`, `N₂ = 0`, `W_III = 12`: `−S = 7·5·1 + 3·0 + 12 = 47`. Both match `m = 1, 2` of the
recorded `T_m` law `−9m²−6m+1`.

**Free-tree class counts.** `{1:1, 2:1, 3:1, 4:2, 5:3, 6:6, 7:11, 8:23, 9:47, 10:106, 11:235,
12:551}` — reproduced exactly.

**Census.** Residual trees of orders 2–12: **330**. Eligible residual trees of orders 7–12:
**4, 5, 17, 39, 80, 167 = 312**, zero at orders ≤ 6. Exact agreement with the figure of record,
reached by my own generator and my own predicates. (Counting the one-vertex tree, which is
vacuously residual and not eligible, gives 331 for orders 1–12; this is the only bookkeeping
difference and it touches nothing.)

**The battery, on every one of the 312 eligible residual trees — 0 failures:**

- the gate `α = ℓ + a`;
- `(RI)` `S = ℓM − W` **recomputed from the literal `H_v`/`R_v` deletion sets and the literal
  favorability filter**, not from any algebraic shortcut;
- the budget identity `Σ_{B∩C}(λ−1) + (a − |B∩D|) + h(B) = 1` **as an exact `ℤ` identity on every
  shell member** (1,000s of members);
- `L5′` exhaustiveness (exactly one of three nonnegative terms equals 1) and `L5″` pruning
  (**the fourth arithmetic shape is empty**, 0 unclassified shell members);
- `|famI| = ℓM`, family-(I) `A_C = ∅`, `w ≡ ℓ−1`, `W_I = ℓ(ℓ−1)M`;
- family-(II) singleton with `λ = 2`, `w ≡ ℓ−4`, `W_II = (ℓ−4)N₂`, `N₂ ≤ k₂M`, `k₂ ≤ ⌊ℓ/2⌋`,
  `|C₁| ≤ ℓ`;
- the family-(III) bijection **at the `a−1` shell**, its injectivity, image weight `ℓ−2|A|`,
  the deletion injection, the sharp fibre inequality, `W_III ≥ 0`;
- **the exact identity `−S = ℓ(ℓ−2)M + (ℓ−4)N₂ + W_III`**;
- the bound `S ≤ −ℓ(ℓ−2)M − (ℓ−4)N₂` in `ℤ`;
- **the conclusion `S ≤ 0`.** Maximum `S` on the eligible residual class to order 12 is `−12`.

**The flat law.** On the 36 eligible residual trees with `D = ∅` to order 12,
`M = 1`, `W_III = 0` and `S = −ℓ(ℓ−2) − k₂(ℓ−4)` exactly, 0 failures — the fixed-subclass law
attributed to r24 route A1, which the award correctly does **not** state.

**Sharpness probes (the record says these hypotheses are load-bearing; I exhibited the failures):**

| Claim | Outside its hypotheses | Result |
|---|---|---|
| gate `α = ℓ + a` | `K₂` (tree, `α = 1 < 2`) | `ℓ+a = 2 ≠ 1`. **FAILS** — `hyp-alpha` is load-bearing |
| gate `α = ℓ + a` | `K₂ ⊔ K₂` (`α = 2`, disconnected) | `ℓ+a = 4 ≠ 2`. **FAILS** — connectivity is load-bearing |
| `L ∩ C = ∅` | `K₂ ⊔ K₂` | `L ∩ C` = all four vertices. **FAILS** |
| forced neighbour (L-1) | non-residual trees, orders 3–10 | **all 117 of 117 violate it**, first at order 4 |
| `L5″` pruning | non-residual trees, orders 3–10 | **all 117 of 117 violate it**, first at order 4 |
| `(RI)` | non-residual trees, orders 3–10 | **all 117 of 117 violate it**, first at order 4 (`P₄`: `α = 2`, `ℓ = 2`, `M = 3`, `W = 0`, so `ℓM − W = +6` against the literal `S = +2`) |
| **`N₂ ≤ M`** | the eligible residual class itself | **FALSE, first at order 9** — **21 classes** to order 12. Explicit first witness: the order-9 tree `0–{1,2,3,4}`, `1–{5,6}`, `2–{7,8}` with `ℓ = 6`, `α = 6`, `k₂ = 3`, `M = 1`, **`N₂ = 3 > 1 = M`**, `S = −30`. The proof's `N₂ ≤ k₂M` holds there (`3 ≤ 3·1`); `N₂ ≤ M` would be a false lemma |
| deletion injection | every tree of orders 3–9 × **every** vertex subset `U` | **31,880 instances, 0 violations** — the bound really is hypothesis-free |

## Independent Critic Pass

I re-ran the ledger adversarially against my own conclusions before closing.

1. **"Did the recomputation only test the residual class, where the theorem is easy?"** No. Every
   node the shipped Lean declares **without** `hResidual` — the gate, `budget_identity`,
   `budget_shapes`, `W_split`, `famI_eq_image`, `famI_card`, `famIII_eq_image`,
   `famIIIMap_injOn`, `famIII_sum_nonneg` — was re-tested at **exactly its declared hypotheses** on
   **all 985 tree classes with `α ≥ 2` of orders 1–12, residual or not: 0 violations.** Had any of
   these silently needed `(★)`, this pass would have found it.
2. **"Is the audit circular — does it assume (RI)?"** No. `aggregate` is computed from the literal
   `H_v = {v, s_v}` and `R_v = N[s_v]` deletion sets and the literal `IsFavorableAt` filter, with
   no appeal to the identity; `(RI)` is then *checked* as an equation, and shown to **fail** off the
   residual class.
3. **"Is `w` really (RI)'s summand, or a look-alike?"** It is definitional: the shipped
   `sign_bound` bridges the two by `rfl`, and I compared the two expressions character by
   character.
4. **"Does the `ℓ = 3` branch smuggle in the fenced `N₂ ≤ M`?"** It derives it locally from
   `k₂ ≤ 1` and `N₂ ≤ k₂M` inside `finish_ell_three`. It is not a registered declaration, and the
   unconditional form is **false** (my order-9 witness). The fence is respected.
5. **"Could `budget_shapes` have a fourth branch that the proof forgets?"** The identity `= 1` with
   three nonnegative `ℤ` terms admits exactly three shapes a priori; the fourth *family* shape
   (`shape 1` with `A_C ≠ ∅`) is the one `L5″` kills, and I confirmed it is empty on every residual
   tree while non-empty off the residual class. The informal proof states this split explicitly
   rather than eliding it — this is the repaired `L5′ + L5″`, not the refuted `L5`.
6. **"Is the `a−1` shell empty by `ℕ`-truncation at `a = 0`?"** No. `shellD` is `J.card + 1 = aVal
   G`; `aVal G - 1` is never formed; shape 3 is the `ℤ` statement `(|B∩D| : ℤ) + 1 = (a : ℤ)`. I
   verified `shellD = ∅` whenever `a = 0`.
7. **"Does any node depend on something the contract marks as NOT a dependency?"** The three
   negative claims are: the gate is `(★)`-free (Lean signature: `hTree`, `hAlpha` only — confirmed,
   and the contract has no `hyp-residual → node-alpha-eq-ell-add-a` edge); `node-sign-bound` has no
   edge from `node-eligible-imp-alpha-ge-three` (confirmed absent); L-7 does not take `hyp-alpha`
   (confirmed in the signature). The contract's dependency graph is **closed** (every declared
   dependency appears as an edge and every edge is declared — 0 discrepancies either way),
   **acyclic**, with 80 nodes and 200 distinct edges and no dangling endpoints.
8. **"Two declarations carry unused binders."** `max_indep_eq_leaf_union_D` declares
   `hTree`/`hAlpha` and `famII_card_inter_leaf` declares `hResidual` without referencing them.
   Extra hypotheses only *weaken* a lemma, so this cannot create unsoundness, and neither lemma is
   a place where the informal proof claims a hypothesis "enters" that it then fails to use.
9. **"Any arithmetic slip in the finish prose?"** `INFORMAL-PROOF.md` §4 writes the `ℓ = 2` bound
   as "`S ≤ 2·0 = 0`", silently dropping the (identically zero) `−ℓ(ℓ−2)M` term. The value is
   right and the Lean branch is right; the prose is terse, not wrong.

## Scope and Fence Check

**Nothing fenced is asserted.** I checked the shipped terminal declaration, the contract's scope
text and `INFORMAL-PROOF.md` §8 against the excluded-conclusion list of the synthesis dispatch and
the formalizer brief §2:

| Excluded conclusion | Asserted anywhere on the award's face? |
|---|---|
| the strict form `S < 0` | **No.** The conclusion is `≤ 0`. (My own census finds `S < 0` on every one of the 312, but the award does not say so, and must not be read as saying so) |
| `S = 0 ⟺ P₅` | **No** |
| any rank other than `α−1` | **No.** The single theorem is at `G.indepNum - 1` |
| the non-residual class | **No.** `hResidual` is a hypothesis of the terminal declaration |
| forests / `RTree` | **No.** 0 occurrences of `forest`, `Forest`, `IsForest`, `RTree` in the shipped source |
| a restatement of (RI) | **No.** (RI) appears only as the *carried, mandated* C5-LA1 entry 31 and as a `have` inside `sign_bound`; the award's conclusion is the sign, not the identity |
| any fixed-band, bounded or censused result | **No.** No census, no order bound, no flat law, no `T_m` law, no adversarial family appears in the source, the contract or the informal proof's argument |
| **`N₂ ≤ M`** | **No.** Explicitly disclaimed in §3 and §8 with the reason ("false from order 9" — which I independently confirmed); the registered lemma is `N₂ ≤ k₂·M` with `k₂ ≤ ⌊ℓ/2⌋` |
| the all-rank aggregate | **No.** `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, `E993-BETA-AGG`, the transport, the common-leaf condition, TREE, FOREST, TRANSFER and Erdős #993 are named only in §8's *disclaimer*, never as conclusions |

**§3.2.** `P₃` and `P₅` are excluded by `hyp-eligible`, not by `(★)`. I confirmed this directly:
both are **residual** (`(★)` holds) and both are **ineligible** (`x+2 ≤ α−1` fails: `1+2 ≤ 1` and
`2+2 ≤ 2`). `P₇` likewise: residual, ineligible, `S = −4`.
**§3.3.** No census carries weight anywhere in the proof. **§3.4.** No counterexample is proposed.
**§3.5.** No sealed r24 file is edited — the frozen source's digest is unchanged and all 42 capsule
members verify. **§3.6.** No refuted mechanism is reopened: `crossingIndex` appears only as the
definition of `x`, never as a maximizer claim, and the refuted B3 realization statement appears
nowhere.

**§3.7 attribution — carried, with two recorded completeness observations.**
`INFORMAL-PROOF.md` §7 carries: packet **lane 05** (architecture and the forced-neighbour
*statement*); **r24 critic `C-T1-U`** (family expansion B3); **r24 route A1** (the flat law);
**Andriantiana–Razanajatovo Misanantenaina–Wagner (2020)** for the occupancy bound, with the
required "**re-proved in-run and never imported**" qualifier (which I verified: the bound is a
registered in-run declaration, nothing is imported); and per-node r26 credit to seats **T1, U2,
U3** and to **all eight** required critics `C-T1-F`, `C-T1-U`, `C-U2-T`, `C-U2-F`, `C-U3-T`,
`C-U3-F`, `C-U1-T`, `C-U1-F`.

Two observations, recorded for the controller (I am not the producer and have repaired nothing):

- **(O-1)** The fence names r26 seats **T1/T2/T3**/U2/U3. `INFORMAL-PROOF.md` §7 names T1, U2 and
  U3 but **not T2 and not T3**, although the Stage 6 synthesis credits T3 with L-6 (i), L-8 (ii),
  L-10 (iii), L-5 (v) and L-9 (vi), and T2 §2.3 with an independent derivation of the gate — all
  nodes of this DAG. `C-T1-U` appears on the face only in its **r24** role, not its r26 one.
- **(O-2)** The **contract's** scope text carries only the ARMW line; the remaining fence-7
  attributions travel on `INFORMAL-PROOF.md` alone.

Neither observation is an assertion of a fenced conclusion and neither touches a mathematical
step; both are attribution-completeness items for the controller to direct, not proof defects.

## Verdict

**passed.**

Every node of `INFORMAL-PROOF.md` is correct at the hypotheses it names, in the DAG order the brief
requires. The claim digest recomputes to
`6475aebe1cd21bcb8ace66326950059f8ea5f570f5376e8c37af0192b9748d84` as expected; the terminal
declaration is character-for-character the statement of record with all four hypotheses verbatim;
the definition layer matches the Lean source literally and stays on the contract carrier with no
`SimpleGraph.induce`; the carried C5-LA1 entries reproduce 30 of 31 entry digests byte-for-byte with
exactly the one recorded one-token keyword diff on entry 31 that the brief allows; every
`ℕ`-subtraction is either discharged by an exact `card_sdiff`/`+1` reformulation or never formed at
all, and every inequality crossing zero is stated in `ℤ`; `hyp-eligible` is provably consumed only
through `α ≥ 3` plus one inert argument of (RI) whose own proof never mentions it; the gate is
`(★)`-free in the Lean signature and in the contract graph; the repaired `L5′ + L5″` is carried,
never the refuted `L5`; and nothing fenced is asserted — in particular the award is non-strict,
confined to rank `α−1`, and never states `N₂ ≤ M`, which I confirmed to be false from order 9.

Independently recomputed with my own standard-library exact-integer code: the free-tree class
counts to order 12; all four path fixed points and both `T_m` fixed points; the 312 eligible
residual trees of orders 7–12 (4/5/17/39/80/167) with the entire structural battery — the gate,
(RI), the exact `= 1` budget, `L5′` exhaustiveness and `L5″` pruning, `|famI| = ℓM`, the family
weights, `N₂ ≤ k₂M`, `k₂ ≤ ⌊ℓ/2⌋`, the family-(III) bijection at the `a−1` shell, the deletion
injection, `W_III ≥ 0`, the exact identity `−S = ℓ(ℓ−2)M + (ℓ−4)N₂ + W_III`, the bound, and the
conclusion `S ≤ 0` — at **zero failures**; the `(★)`-free nodes re-tested at exactly their declared
hypotheses on all 985 tree classes with `α ≥ 2` at **zero failures**; and the sharpness of
`hyp-tree`, `hyp-alpha` and `(★)` exhibited by explicit failures outside them.

No defective step was found. Two fence-7 attribution-completeness observations (O-1, O-2) are
recorded above for the controller; they are not proof defects and do not qualify the pass on the
mathematics.
