---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: a1-la1-formalizer-sonnet-20260922
critic_id: a1-la1-fable-informal-20260922
attestation_id: a1-la1-informal-pass-20260922
claim_sha256: c47c41d30cd6aafd1fec15c613433e1535428e9485a970c4f01a626df201ee2f
---

# Informal Proof Integrity Audit

**VerityOS boot.** I am operating within VerityOS. For this dispatch I read exactly the
three files the brief's §0 authorises and no others:
`/Users/ashtonsperry/VerityOS/verity.md`,
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and
`/Users/ashtonsperry/VerityOS/skills/proof-integrity-audit/skill.md` (subsystems:
constitution, `identity/`, `skills/proof-integrity-audit`). Per the dispatch's narrow
grant I did **not** follow the startup protocol's map into `memory/`, `knowledge/`,
`conversations/`, `logs/`, `decisions/`, `operations/` or `projects/`; this audit operates
strictly inside the Stage 7 informal-auditor brief's §1 read boundary.

**Model disclosure (dispatch-record authority).** Chartered model/effort: Claude Opus 5,
effort high. This seat **cannot self-inspect its own runtime model or effort parameter**;
the disclosure is made on dispatch-record (chartering) authority only, as the brief
instructs. Child delegation: none used, none attempted (forbidden by the brief). I am the
independent informal proof-integrity reviewer `a1-la1-fable-informal-20260922`, not the
artifact producer; I edited no contract, no Lean source, no informal proof and no receipt.
All writes went to `scratchpad/a1-s7-informal-LA1/` only.

**Scale mode** (`skills/proof-integrity-audit` §Scale Modes): *Paper or Appendix* — one
ledger row per definition, hypothesis, lemma, imported fragment, arithmetic fact and
nontrivial inferential step of `INFORMAL-PROOF.md`, with dependencies tracked and a
separate critic pass run over the unchanged ledger before close.

**Gate checks, recomputed by this reviewer before any mathematics.**

| Object | Expected | Recomputed | |
|---|---|---|---|
| `THEOREM-CONTRACT.yaml` | `a18425e1c9a53e74…d152d79ad` | `a18425e1c9a53e7442e68013985c53ef7a693f999033e5cfe6cba99d152d79ad` | match |
| `INFORMAL-PROOF.md` | `27fe04549fb7d74c…34298290` | `27fe04549fb7d74c3805e66bbc63bbf73c2e760cdc46ce2aa3b24d3334298290` | match |
| `LeanProject/LeanProof/Main.lean` | `00891d6a0e33039f…fdd05ef110` | `00891d6a0e33039f26555609b5a4ab25a6e95186e9851c1804caf7fdd05ef110` | match |
| capsule seal (`A1-LA1-PACKET-MANIFEST.json`) | `b44053d0db431732…6572a84c` | `b44053d0db431732304844ac00e2ec007fdab949d09757d31b98a9416572a84c` | match |
| `claim_sha256` (`" ".join(informal_statement.split())`) | `c47c41d3…f201ee2f` | `c47c41d30cd6aafd1fec15c613433e1535428e9485a970c4f01a626df201ee2f` | match |

The seal was recomputed independently as SHA-256 of the compact key-sorted JSON of the
manifest minus `seal_sha256` (keys `file_count, files, run_id, schema_version, stage`),
and all twelve `source_materials` digests in the contract were re-verified against
`SOURCE/`, and `SOURCE/*.lean` against
`sources/r25-terminal/a1-stage7-sources/*.lean`: all identical. The
`informal_statement` is already whitespace-canonical (collapsing is a no-op).

---

## Intended Claim

The intended claim is exactly the contract's `theorem.informal_statement`
(digest `c47c41d3…f201ee2f`):

> For every finite simple graph `F` on a finite vertex type `X`, if `F` is acyclic (a
> forest, connected or not) and `Nat.card X` is at least 12, then
> `Δ₃(F) = i₄(F) − i₃(F) > 0`, where `i_k(F)` is the exact count of independent
> `k`-subsets of `F` (`Erdos993G1.indepCount`), `coeff` is the integer zero-extension of
> `indepCount` to negative indices, and `delta` is the first difference
> `coeff(k+1) − coeff(k)`. This proves the **first conjunct only** of the registered claim
> `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`, whose second conjunct (sharpness at order
> 11, `P₁₁` the unique minimiser, `Δ₃ = −14`) is explicitly **excluded** from this
> contract and stays `proved_informal`.

This is the statement of record in the sealed capsule's
`cycles/cycle-A1/stage6/SYNTHESIS.md` `## Lean awards`, entry **U-A1-1**, read directly:
same binders, same two hypotheses, same conclusion, same scope restriction to the
`n ≥ 12` half. The terminal declaration in `Main.lean` (lines 1858–1862) is
character-for-character the contract's `expected_statement`, in the content namespace
`Erdos993G1.ForestDelta3` (repair R6); no `Erdos993G1.U1.` name survives anywhere in the
registered source.

I audit `INFORMAL-PROOF.md` as the proof of exactly that claim, and nothing wider.

---

## Claim Ledger

Verdict taxonomy per `skills/proof-integrity-audit` §Verdict Discipline. "verified" =
verified with reproduced evidence (my own computation or my own byte-diff), never by prose
agreement. Dependencies are given by ledger id.

### A. Definitions (frozen G1, byte-identity required)

| id | Claim (`INFORMAL-PROOF.md` §1) | Evidence | Verdict |
|---|---|---|---|
| D1 | `indepCount F k = (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)` is byte-identical to the frozen G1 source | Extracted both declarations and diffed: 3 lines, **0 differences**, against `sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean` (digest recomputed `aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`, the digest `SEMANTIC-CONTRACT.md` cites) | verified |
| D2 | `coeff F k = if 0 ≤ k then indepCount F k.toNat else 0` byte-identical | same method, 0 differences | verified |
| D3 | `delta F k = coeff F (k+1) − coeff F k` byte-identical | same method, 0 differences | verified |
| D4 | `closedNeighborhood`, `deleteVerts` (= `F.induce Sᶜ`), `ambientA` (= `deleteVerts T (closedNeighborhood T v)`) byte-identical (ENTRIES 6, 7, 8) | same method, 0 differences each | verified |
| D5 | `i_0 = 1` for every finite graph including the empty graph; `Δ_k = i_{k+1} − i_k`; `coeff` zero at negative indices | Reproduced from D1–D3 directly; `delta_zero_exact`'s `h0` proves `Nat.card {S // IsNIndepSet 0 S} = 1` via a `Unique` instance on `S = ∅`. My enumerator reproduces `i_0 = 1` at every order 0–14 including order 0 | verified |
| D6 | `Δ₃ > 0` is a positivity statement, opposite in sign to a no-recovery statement; `x(F)` never used | `x(F)`, `ν`, `τ`, `d` do not occur in the registered source at all; in `INFORMAL-PROOF.md` each occurs exactly once and only inside an explicit exclusion (scripted scan) | verified |

`SimpleGraph.IsNIndepSet k S` is Mathlib's own predicate (an independent set of card `k`);
`Nat.card` of the subtype counts each independent `k`-subset once. D1 is therefore the
exact count the claim names. No cast or truncation enters D1–D3: `coeff`'s `k.toNat` is
guarded by `0 ≤ k` and the negative branch returns `0`, so the zero-extension is total and
well-defined.

### B. Imported fragments (provenance and byte-identity)

| id | Claim | Evidence | Verdict |
|---|---|---|---|
| I1 | The pendant identity `Erdos993G1.CritUC503F.pendant_delta` is byte-identical to critic C-U3-F's `Crit.lean` (`d8aae69d…b95a85e`) | Digest of `SOURCE/C-U3-F-Crit.lean` recomputed = `d8aae69d35b0539097275bd940490a5a5c88e1b2f075a4e4320049842b95a85e`, matching the contract and the synthesis. Diff of the registered ENTRY 5 fragment against it: differences are **only** the disclosed R3 header comment (4 lines), the stripped `import` line, three stripped file-scope `universe u` declarations and two blank lines. **No statement or proof text differs.** | verified |
| I2 | `Erdos993G1.ForestDelta2.forest_delta_two_lower` is byte-identical to award C6-LA1's own source | Extracted the statement+proof text from `SOURCE/C6-LA1-Main.lean` lines 569–601 (33 lines) and from the registered ENTRY 4: **0 diff lines**; my own digest of both sides is `5d8ab1f8da227ca0b0d66fc0331de624f2cd4d2deafef3dd92457b69fef9cb1a` — which **reproduces the adjudication's cited prefix `5d8ab1f8…` exactly**, independently of the formalizer's own differently-conventioned `6eceab5d…` | verified |
| I3 | `forest_delta_two_pos_ge_nine` is present-but-unused (repair R4) | Same extraction, lines 639–643 (5 lines), **0 diff lines**, my digest `798c6ef97db7a53b47302d511053aa461b5c4952f01ac1408a3f61ac2f7da2ca` = the adjudication's cited `798c6ef9…`. My own dependency-closure computation (below, R2/E4) places it **outside** the closure | verified |
| I4 | R5: `L123Chain.lean` differs from `CriticUC604FChain.lean` in exactly one import line | Digest of `SOURCE/CriticUC604FChain.lean` recomputed = `f436e4ae3a15e12ffb091e7665828e991d400f843c7b076dca15c5585ee24494`. Diff of the registered ENTRY 2 against it: the only differences are the disclosed 9-line R3 header comment, the removed `import LeanProof.Main` line and one trailing blank line. **Exactly one import line plus a header comment — confirmed**, as the brief requires. No statement or proof text differs | verified |
| I5 | ENTRY 100 (`indepCount_edgeless`) and ENTRY 150 (`forest_leaf_of_edge`) are verbatim frozen-source transcriptions, renamespaced only | Both are present in ENTRY 3 under `Erdos993G1.U1Transcribed` with the frozen per-entry hashes cited; ENTRY 150's proof works per connected component (`F.connectedComponentMk a`, `hF.isTree_connectedComponent c`), which is what makes the disconnected case genuine | verified |
| I6 | C-U3-T's `CriticUC503.pendant_delta_identity` is corroboration, **not** the compiled dependency | `C-U3-T-CriticPendant.lean` is shipped in `SOURCE/` (digest `c9a230bc…4f18baf3`, matching) but **no declaration of that name occurs anywhere in the registered `Main.lean`** | verified |

### C. Mathematical steps of §3, node by node

| id | Step | Check | Verdict |
|---|---|---|---|
| S1 | **N1** `Δ_0(F) = |V(F)| − 1` for any finite simple graph, no forest hypothesis | `delta_zero_exact`: `i_0 = 1` (Unique instance, `S = ∅`), `i_1 = Nat.card X` (ENTRY 20). Subtraction is in **ℤ** (`(Nat.card X : ℤ) − 1`), so the value is `−1` at order 0 — no ℕ-truncation. Reproduced: my enumerator gives `Δ_0 = n − 1` at every order 0–14 | verified |
| S2 | **Edgeless** `Δ_k(F) = C(n,k+1) − C(n,k)` for every `k` | `edgeless_delta_eq` = ENTRY 100 + `delta_nat`, both casts `binomCoeff_nat`. Reproduced against my enumerator for the empty-edge forest at every order 0–14 and `k = 1,2,3` | verified |
| S3 | **Leaf** every acyclic `F` with an edge has a leaf `l` with unique neighbour `u`; `F − l` and `F − N[l]` are again acyclic | ENTRY 150 (per component) plus ENTRY 38 `deleteVerts_isAcyclic` (`h.induce _`), invoked at **all six** call sites (two per induction), never assumed. Verified by direct reading of lines 1619–1622, 1695–1698, 1757–1760 | verified |
| S4 | **N4** `|V(F−l)| = n − 1` and `|V(F−N[l])| = n − 2` at a leaf | `closedNeighborhood_leaf_eq` proves `N[l] = {l,u}` from `hlu : F.Adj l u` and `hl : ∀ v, F.Adj l v → v = u`; `l ≠ u` from `hlu.ne`, so `Set.ncard_pair` gives 2. The ℕ-subtractions `n − 1`, `n − 2` are discharged by `omega` **from an equation** (`Nat.card X = n + 2`), so at every call site they evaluate to `n+1` and `n` with no truncation | verified |
| S5 | **Pendant identity** `Δ_{j+1}(F) = Δ_{j+1}(F−v) + Δ_j(F−N[v])` for **any** vertex `v` | Mathematically re-derived: `pendant_identity` splits `{T : IsNIndepSet k T}` by `v ∈ T`; the `v ∉ T` part transports to `F − {v}` by `indepCount_deleteVerts` (carrier transport, `deleteVerts_adj` is `Iff.rfl` since `deleteVerts` is an induced subgraph, so independence is preserved in both directions); the `v ∈ T` part biject `T ↦ T.erase v` onto independent `(k−1)`-sets avoiding `N[v]` — correct, because independence of `T ∋ v` forbids any neighbour of `v` in `T`, and conversely inserting `v` into a set avoiding `N[v]` stays independent. `hk : 1 ≤ k` is required and supplied: it is what makes `card (insert v U) = (k−1)+1 = k`. **`pendant_delta` is stated at `j+1`/`j`, so no ℕ-subtraction appears at all**; it is obtained by subtracting `pendant_identity` at `k = j+2` and `k = j+1`, both with `1 ≤ k`. Invoked at `j = 0, 1, 2` for ranks 1, 2, 3 | verified |
| S6 | **C6-LA1 import** `6·Δ_2(F) ≥ n³ − 12n² + 35n − 30` for every forest of order `n ≥ 5` | Byte-identity I2. The proof's own documented ℕ/ℤ caution is present and load-bearing: `hsub : ((Nat.card X − 2 : ℕ) : ℤ) = (Nat.card X : ℤ) − 2 := by omega`, valid under `hn : 5 ≤ Nat.card X`. **Reproduced independently:** the inequality holds on every one of the 8 599 + … enumerated forest classes of order 5–14 | verified |
| S7 | **N7** `forest_delta_one_lower : L1(n) ≤ Δ_1(F)` by strong induction over every forest | Base `n ∈ {0,1}`: `no_edge_of_card_le_one` forces edgelessness, S2 applies, `L1(0) = 0 = Δ_1`, `L1(1) = edgeless(1,1) = −1 = Δ_1`. Step `n = m+2`: edgeless branch closes by `min_le_left`; else S3 gives a leaf, S5 at `j=0` gives `Δ_1(F) = Δ_1(F−l) + Δ_0(F−N[l])`, S1 closes the `Δ_0` term **exactly** as `(m:ℤ) − 1`, and the strong IH at order `m+1 < n` bounds `Δ_1(F−l)` — matching `L1(m+2) ≤ L1(m+1) + (m−1)` by `min_le_right`. The IH is applied to the **subtype carrier** `{w : X // w ∉ {l}} : Type u`, which is in the same universe as `X`, so the ∀-statement applies | verified |
| S8 | **N8** `forest_delta_two_lower_general : L2(n) ≤ Δ_2(F)` | `n ≥ 5`: S6 + `B_six` directly, **no recursion** (`L2(n) = B(n)` by `if_pos`). `n < 5`: the same case split at `j = 1`, closing the `Δ_1` term with S7 and matching `L2(n+2) ≤ L2(n+1) + L1(n)` by `min_le_right`. Bases 0, 1 edgeless | verified |
| S9 | **N9** `forest_delta_three_lower : L3(n) ≤ Δ_3(F)` — the headline lower bound | Bases `n ∈ {0,1}` via S2 at `k = 3` (`L3(0) = 0 = Δ_3`, `L3(1) = edgeless(1,3) = 0 = Δ_3`). Step: same case split at `j = 2`, `Δ_2` term closed by S8, matching `L3(n+2) ≤ L3(n+1) + L2(n)` by `min_le_right`. **No base case over graphs, no enumeration, no isomorphism-completeness object appears in S7–S9** — confirmed by reading every tactic of all three proofs. **Reproduced independently:** `L3(n) ≤ min Δ₃` over *every* forest isomorphism class at orders 0–14 | verified |
| S10 | **Chain** `edgeless`, `L1`, `L2`, `B`, `L3` as recursive ℤ functions | Transcribed into my own evaluator from the Lean equations (lines 987–1014) and re-checked for equation-by-equation agreement including the pattern-variable offsets (`L1(m+2)`'s additive term is `(m:ℤ)−1`, i.e. `|V(F−N[l])| − 1`, not `m+1`). All arithmetic is **ℤ**, so no truncation anywhere in the chain | verified |
| S11 | **N11** `L3_pos_of_ge_twelve : ∀ n ≥ 12, 0 < L3(n)`, general in `n` | Induction from `L3_twelve_pos`. Step needs both `min` branches positive: `edgeless(n+2,3) > 0` for `n+2 ≥ 8` via `scaledChooseFour` and the identity `24·edgeless(n,3) = n(n−1)(n−2)(n−7)` (I re-derived: `24C(n,4) − 24C(n,3) = n(n−1)(n−2)[(n−3) − 4]`), and `L2(k) = B(k) > 0` for `k ≥ 9` via `B_six` (`6B(m) = (m−9)(m²−3m+8) + 42`). Both hypotheses are **sharp**: `edgeless(7,3) = 0`, `B(8) = −1` | verified |
| S12 | **N12** the headline, by `linarith` from S9 and S11 | `forest_delta_three_lower (Nat.card X) F hF rfl` gives `L3(Nat.card X) ≤ Δ_3(F)`; `L3_pos_of_ge_twelve (Nat.card X) hn` gives `0 < L3(Nat.card X)`. Transitive. Hypotheses used: exactly `hF : F.IsAcyclic` and `hn : 12 ≤ Nat.card X` | verified |

### D. Hypothesis inventory (where each enters)

`F.IsAcyclic` enters at exactly three kinds of site: ENTRY 150 (leaf existence, per
component), ENTRY 38 (acyclicity of `F−l` and `F−N[l]`, re-derived at all six call sites),
and the C6-LA1 import S6. `12 ≤ Nat.card X` enters at exactly one site, S11, through S12.
`[Finite X]` is the instance burden only. **`SimpleGraph.IsTree` is never a hypothesis of
any registered declaration** (scripted check: no `(h… : …IsTree` binder exists; the only
occurrence is `hF.isTree_connectedComponent`, a *consequence* of acyclicity applied per
component, which is precisely what carries the disconnected case). Nothing marked NOT a
dependency is a dependency (E4 below).

---

## Reproduced Mathematical Evidence

All numbers below are my own, from evaluators I wrote from scratch under
`scratchpad/a1-s7-informal-LA1/` (`chain_eval.py`, `diff_fragments.py`,
`fence_check.py`, `fence_check2.py`; Python standard library only — `itertools`, `math`,
`difflib`, `hashlib`, `pathlib`, `re`, `sys`; exact integers throughout; no wall-clock,
PID or host field; **no prior evaluator imported**). Outputs: `chain_eval.out`,
`fence_check2.out`.

### E1. The `ℓ₃`/`L1`/`L2`/`L3` table (full table computed for `n ≤ 60`)

`ℓ₃(n) = edgeless(n,3) = C(n,4) − C(n,3)`.

| n | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | **12** | 13 | 14 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `ℓ₃(n)` | 0 | 0 | 0 | −1 | −3 | −5 | −5 | 0 | 14 | 42 | 90 | 165 | **275** | 429 | 637 |
| `L1(n)` | 0 | −1 | −2 | −2 | −1 | 1 | 4 | 8 | 13 | 19 | 26 | 34 | **43** | 53 | 64 |
| `L2(n)` | 0 | 0 | −1 | −2 | −4 | −5 | −6 | −5 | −1 | 7 | 20 | 39 | **65** | 99 | 142 |
| `L3(n)` | 0 | 0 | 0 | −1 | −3 | −5 | −9 | −14 | −20 | −25 | −26 | **−19** | **1** | 40 | 105 |

Selected larger values (the table runs to `n = 60` in `chain_eval.out`):

| n | 20 | 30 | 40 | 50 | 60 |
|---|---|---|---|---|---|
| `ℓ₃(n)` | 3 705 | 23 345 | 81 510 | 210 700 | 453 415 |
| `L1(n)` | 151 | 376 | 701 | 1 126 | 1 651 |
| `L2(n)` | 645 | 2 870 | 7 695 | 16 120 | 29 145 |
| `L3(n)` | 1 559 | 14 269 | 57 604 | 161 064 | 364 149 |

### E2. Every numeric claim in the proof and the report

| Claim | Where | Result |
|---|---|---|
| `L2_table : L2 5..10 = −5, −6, −5, −1, 7, 20` | chain (not in closure) | **holds** |
| `L3_table : L3 8..14 = −20, −25, −26, −19, 1, 40, 105` | chain (not in closure) | **holds** |
| `L3_twelve_pos : 0 < L3 12` | chain, **in closure** | **holds**, `L3(12) = 1` |
| `L3_thirteen_fourteen_pos` | chain (not in closure) | **holds**, 40 and 105 |
| §3 step 10: "`L3 = …, −19 (11), +1 (12), +40 (13), +105 (14)`" | `INFORMAL-PROOF.md` / chain docstring | **holds** |
| `B_six : 6·B(n) = n³ − 12n² + 35n − 30` | S10 | **identity**, verified `0 ≤ n ≤ 400` |
| `scaledChooseFour : 24·C(n,4) = n(n−1)(n−2)(n−3)` | S11 | **identity**, verified `0 ≤ n ≤ 400` |
| `24·edgeless(n,3) = n(n−1)(n−2)(n−7)` | S11 | **identity**, verified `0 ≤ n ≤ 400` |
| `edgeless_three_pos_of_ge_eight` | S11 | `> 0` for `8 ≤ n ≤ 400` |
| `B_pos_of_ge_nine` | S11 | `> 0` for `9 ≤ m ≤ 400` |
| `L2(m) = B(m)` for every `m ≥ 5` | S8 | **holds**, `5 ≤ m ≤ 400` |
| `L3_pos_of_ge_twelve` (**general in `n`**) | S11 | `L3(n) > 0` for **every `12 ≤ n ≤ 3 000`**; and for every such `n` **both** `min` branches are independently positive, which is exactly the inductive step's content |
| §3 step 11's "positivity general in `n`, not merely at the numerals" | §3 | **corroborated**: the general claim is verified far beyond the four `decide`d numerals |

**Failure of each bound outside its stated hypotheses (the record says these are sharp):**

- `edgeless(n,3) ≤ 0` for every `n ≤ 7` (`ℓ₃(3..7) = −1, −3, −5, −5, 0`) — the `n ≥ 8`
  hypothesis of `edgeless_three_pos_of_ge_eight` is **sharp**.
- `B(8) = −1 ≤ 0` while `B(9) = 7` — the `m ≥ 9` hypothesis of `B_pos_of_ge_nine` is
  **sharp**.
- `L3(n) ≤ 0` for every `n ≤ 11`, with `L3(11) = −19` — the order-12 threshold is
  **sharp for the chain**, so the theorem's hypothesis cannot be weakened by this route.

### E3. Independent enumeration of forests (out-of-closure sanity check only)

I generated all free trees on 1–14 vertices by leaf augmentation with AHU canonical forms,
formed every forest as a multiset of trees, and computed the exact independence polynomial
of each by rooted-tree DP. **My class counts reproduce OEIS A000055 and A005195 exactly**
(trees 1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159; forests 1, 1, 2, 3, 6, 10,
20, 37, 76, 153, 329, **710**, **1601**, 3658, 8599), which independently validates the
enumerator — and the 710 at order 11 is the same population the U adjudicator's census
reports.

| order | #forests | min Δ₁ | `L1` | min Δ₂ | `L2` | min Δ₃ | `L3` |
|---|---|---|---|---|---|---|---|
| 5 | 10 | 1 | 1 | −5 | −5 | −5 | −5 |
| 6 | 20 | 4 | 4 | −6 | −6 | −8 | −9 |
| 7 | 37 | 8 | 8 | −5 | −5 | −12 | −14 |
| 8 | 76 | 13 | 13 | −1 | −1 | −16 | −20 |
| 9 | 153 | 19 | 19 | 7 | 7 | −20 | −25 |
| 10 | 329 | 26 | 26 | 20 | 20 | −21 | −26 |
| 11 | 710 | 34 | 34 | 39 | 39 | **−14** | −19 |
| **12** | **1601** | 43 | 43 | 65 | 65 | **6** | **1** |
| 13 | 3658 | 53 | 53 | 99 | 99 | 45 | 40 |
| 14 | 8599 | 64 | 64 | 142 | 142 | 110 | 105 |

Findings:

1. **`L1(n) ≤ min Δ₁`, `L2(n) ≤ min Δ₂`, `L3(n) ≤ min Δ₃` hold on every forest
   isomorphism class at every order 0–14** — S7, S8 and S9 are true on the enumerated
   ground truth. `L1` and `L2` are *exactly tight* over this range; `L3` is a strict
   lower bound from order 6 on (slack 1 at order 6, 5 at order 12).
2. **The awarded claim is true on every enumerated forest of order 12, 13 and 14**
   (`min Δ₃ = 6, 45, 110`), including all disconnected classes.
3. **The threshold 12 is not vacuous and not misplaced**: at order 11 the minimum is
   `−14`, so the claim genuinely fails one order lower.
4. **`B(n) = min Δ₂` exactly for `5 ≤ n ≤ 14`**, confirming the chain docstring's claim
   that `B` is the ENTRY-176 uniform `Δ₂` bound and is attained, and confirming the
   C6-LA1 import S6 on the ground truth.
5. `min Δ₃ = −14` at order 11, agreeing with the *excluded* sharpness clause's registered
   value. **This is out-of-closure corroboration only. It is not part of this award, it
   does not move the excluded conjunct, and nothing in this audit may be read as
   formalizing or registering it** — it is recorded solely to show the threshold is the
   right one.

### E4. The R2 closure fact, confirmed independently

I rebuilt the dependency closure of the terminal theorem myself, over the registered
source with comments stripped, following every reference (bare or fully qualified):
**63 of the file's 83 declarations** are in the closure.

| Declaration | In closure? | Required |
|---|---|---|
| `ErdosR25.CriticUC604FChain.L3_twelve_pos` | **IN** | yes — the single kernel-evaluated numeral fact |
| `L2_table` | **NOT** | must be out |
| `L3_table` | **NOT** | must be out |
| `L3_thirteen_fourteen_pos` | **NOT** | must be out |
| `Erdos993G1.ForestDelta2.forest_delta_two_lower` | **IN** | yes — the load-bearing C6-LA1 import (R4) |
| `Erdos993G1.ForestDelta2.forest_delta_two_pos_ge_nine` | **NOT** | present-but-unused (R4) |
| `Erdos993G1.CritUC503F.pendant_delta`, `pendant_identity` | **IN** | yes |
| `Erdos993G1.ThirdWide.cover_*` (the order-12 cover/enumeration machinery), `forest_delta_two_ten_pos` (the order-10 base), `catalan_*` | **NOT** | — |

This matches the U adjudicator's kernel-computed closure (synthesis `## Lean awards`) on
every named item. My computation is a syntactic over-approximation, which makes the four
**negative** results strictly stronger than a kernel computation would need to be.

Scans of the registered source with Lean comments stripped:

- **no `native_decide`** in proof text (1 occurrence in the whole file, inside a comment);
- **no `sorry`, no `admit`** in proof text (2 `sorry` occurrences, both inside comments
  describing what critic C-U3-F *closed*);
- **exactly four `decide` call sites**, all inside `ErdosR25.CriticUC604FChain`, on
  `L2_table`, `L3_table`, `L3_twelve_pos`, `L3_thirteen_fourteen_pos` — all ranging over
  `ℤ` arithmetic with **no graph type in scope**; only `L3_twelve_pos` is in the closure;
- **no closure member contains a `Finset` filter over the vertex type**: the 13
  `(univ : Finset _).filter` expressions in the file all sit in the frozen transcribed
  `Erdos993G1.ThirdWide.cover_*` family, which is entirely outside the closure.

### E5. Axioms

`EVIDENCE/axioms.txt` holds exactly `propext`, `Classical.choice`, `Quot.sound`, one per
line. `EVIDENCE/axioms-full-sweep-raw-probe.log` and `AxiomCheck.lean` cover all fourteen
named declarations the run registers, each `[propext, Classical.choice, Quot.sound]`.
`RECEIPTS/kernel-verification.json` records `verdict.verified = true`,
`axiom_policy: passed`, `axiom_probe: passed`, and `source_sha256_before =
source_sha256_after = 00891d6a…` (the file I audited). See O-6 for the one receipt
bookkeeping consequence of the disclosed restructuring.

---

## Independent Critic Pass

Run over the unchanged ledger before close, adversarially, looking for the failure modes
this skill names.

**C1 — ℕ-subtraction and cast truncation, every site.** Enumerated every `−` on a ℕ-valued
term reachable from the terminal theorem. Four sites: `pendant_identity`'s `k − 1`
(guarded by `1 ≤ k`, and `pendant_delta` eliminates it entirely by the `j+1`/`j`
formulation); `card_deleteVerts_singleton`'s `n − 1` and `card_ambientA_leaf`'s `n − 2`
(both discharged at each call site by `omega` from the *equation* `Nat.card X = n + 2`, so
they evaluate to `n+1` and `n`); and `Fintype.card V − 2` inside the C6-LA1 import, where
the imported proof carries its own explicit `hsub` conversion to ℤ under `5 ≤ Nat.card X`
— the very caution the adjudication flagged. **Every subtraction in the chain (`L1`, `L2`,
`L3`, `B`, `edgeless`, `delta_zero_exact`) is in ℤ.** No truncation anywhere. No defect.

**C2 — is every "identity" an identity?** I recomputed `B_six`, `scaledChooseFour`, the
derived `24·edgeless(n,3) = n(n−1)(n−2)(n−7)`, `delta_nat`, `coeff_nat` and
`delta_zero_exact` rather than trusting the prose; all hold as exact-integer identities
over `0 ≤ n ≤ 400`, and `delta_zero_exact` was checked against my enumerator at every
order 0–14. No defect.

**C3 — does the induction really cover disconnected forests and the edgeless case?** Yes,
and this was the step most worth attacking. The hypothesis is `IsAcyclic`, never `IsTree`;
the leaf lemma is proved inside the connected component of a known edge, so a forest with
many components (and isolated vertices) is handled; the `Nat.card F.edgeSet = 0` branch
handles the edgeless forest at every order via the binomial formula, not by a base case.
My enumeration includes every disconnected class (e.g. all 1 601 order-12 classes) and
found no violation of S7, S8 or S9. No defect.

**C4 — does the strong induction actually descend?** The IH is applied at orders `m+1`
and `m` from order `m+2`, both strictly smaller, with `Nat.card` equations proved rather
than assumed. The recursion carriers are subtypes of `X`, hence in the same universe `u`
as the ∀-statement's binder, so the IH is applicable — a real hazard that is correctly
avoided. No defect.

**C5 — could a hidden base case or enumeration be smuggled in?** The candidates would be
`forest_delta_two_ten_pos` (an order-10 specific result), the `cover_*` cover-number
machinery (the route that *would* have enumerated at order 12) and the three `decide`d
tables. **All are outside the closure** (E4). The only closure `decide` is on
`0 < L3 12`, an evaluation of a recursive ℤ function at one numeral. No defect.

**C6 — is `L3` a valid lower bound, or does the chain over-claim?** I did not take this on
trust: `L3(n) ≤ min Δ₃` over every forest class at orders 0–14, with strict slack from
order 6, so the bound is conservative and never over-tight. No defect.

**C7 — does the terminal theorem's statement match the claim one-for-one?** Binders,
instance burden, both hypotheses, conclusion and namespace all match the contract's
`expected_statement` and the synthesis's `U-A1-1` kernel-printed type character for
character (only the namespace differs from the seat's compiled name, which is exactly
repair R6). No defect.

**C8 — my own evaluator.** Cross-validated three ways: class counts against OEIS A000055
and A005195; `L1`/`L2` against enumerated ground truth (exactly tight, so any off-by-one
in my recursion transcription would have shown); and my C6-LA1 extraction digests
reproducing the adjudication's independently cited `5d8ab1f8…`/`798c6ef9…` prefixes. I
found no error in my own instruments.

**C9 — what I could not check.** I did not run Lean and was not asked to (the brief:
"you audit the mathematics, not the kernel"). Kernel verification is the separate receipt
already recorded (`verified: true`), and the fidelity audit is a separate outstanding
gate. My verdict is on the mathematics of `INFORMAL-PROOF.md` and its match to the
contract, nothing more.

---

## Scope and Fence Check

### Fences (formalizer brief §2, synthesis `## Lean awards` "Every excluded conclusion")

| Fence | Finding |
|---|---|
| **FIXED-RANK `k = 3`, uniform in the order, no horizon; never a band result; never a `d`-translation; `d`, `ν`, `τ`, `x(F) < r` enter nowhere; `Δ₃ > 0` is a POSITIVITY statement; no tier, band, G1 tuple or headline moves** | **HELD.** `d`, `ν`, `τ` and `x(F) < r` do not occur anywhere in the registered source; in `INFORMAL-PROOF.md` each occurs exactly once, inside §6.3's explicit "enter nowhere" exclusion. `Δ₃ > 0` is named a positivity statement in §1, §6.3 and the contract's `def-delta`. No tier, band or headline is claimed anywhere |
| **Repair R2 — the ONLY enumeration wording the face may carry, verbatim** | **HELD, verbatim.** I extracted the mandated 727-character passage from `control/A1-STAGE7-FORMALIZER-BRIEF-LA1.md` and the passage carried in `INFORMAL-PROOF.md` §6.2, normalised whitespace, and hashed both: **both `225981cbbc6dd18d17e09ea8a3fca6277b9f27bd94727fe5ccb759bcfc5a6c66`.** Identical. The same passage is verbatim the synthesis's own text |
| **Never "no `decide`" (false)** | **HELD.** §6.2 states `**Never "no `decide`"** — that is false` and names all four `decide` calls, three of them non-load-bearing. The false form is never asserted |
| **Confirm the closure fact yourself** | **CONFIRMED independently** — E4 above. `L3_twelve_pos` in; `L2_table`, `L3_table`, `L3_thirteen_fourteen_pos` out, and §6.2/§9 register them explicitly as corroborating non-dependencies, exactly as the fence permits |
| **Never described as sharpening `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`; never "the run's first unconditional forest theorem"; does not move `E993-C13-I4-GT-I3`; independent of `E993-PAIR-RANK3-FOREST-MIN`** | **HELD.** All four appear in `INFORMAL-PROOF.md` §6.4–§6.5 only under an explicit "never"/"does not move", with the correct reasons (C6-LA1 holds rank 2; a grade does not transfer across claim keys) |
| **The order-11 add-on and the adjudicator's 710-forest census are NOT part of the award** | **HELD** (§6.6). My own order-11 computation in E3 is recorded as out-of-closure corroboration only and is explicitly not part of the award |
| **No `sorry`, `admit`, `native_decide`; axioms within the three standard ones; never change the intended theorem to obtain compilation** | **HELD** — E4, E5. The theorem proved is the theorem contracted (C7) |

### Scope (repair R1, condition (ii))

**HELD.** Both faces state the `n ≥ 12` half only and name the sharpness half as excluded
and `proved_informal`: `INFORMAL-PROOF.md` §2 ("Scope (repair R1)") and §6.1, and the
contract's `informal_statement`. The registry effect is stated as `proved_informal →
formally_verified` **on the `n ≥ 12` half only**, with the sharpness clause unaffected —
matching the synthesis's REG-6 exactly. Nothing is asserted for trees, for order 11, or
for any conjunction the run proves only half of.

### Attribution faces (repair R3, condition (i))

**HELD.** All four attributions travel on `INFORMAL-PROOF.md` §4 in the mandated form:
pendant identity **critic-derived, r25 Cycle 5 critic C-U3-F** with the `d8aae69d…`
digest and the `pendant_identity_draft`/`sorry` it closed; **C-U3-T named as
corroboration, not the compiled dependency** (and indeed absent from the build — I6);
the arithmetic chain **critic-derived, r25 Cycle 6 critic C-U4-F**; `forest_delta_two_lower`
**award C6-LA1, critic-attributed jointly to C-U4-T and C-U4-F**; and this cycle's seat
U1's own work enumerated exactly as the synthesis lists it (three strong inductions, the
`Δ₀` identity, leaf cardinality bookkeeping, `scaledChooseFour`,
`edgeless_three_pos_of_ge_eight`, `B_pos_of_ge_nine`, `L3_pos_of_ge_twelve`, assembly).
The run-id/cycle header comments are present on both critic-derived fragments
(`PendantIdentity.lean` → Cycle 5, `L123Chain.lean` → Cycle 6), disclosed as the one
permitted edit, and my byte-diffs confirm they are the **only** added text. R4, R5, R6, R7
and R8 are each discharged as recorded (I2–I4, C7, and the `lemma` keyword on
`forest_delta_three_lower`).

### Rulings on the formalizer's four disclosures

| # | Disclosure | Ruling |
|---|---|---|
| 1 | **Single-file consolidation with import-line stripping** (five fragment files merged into one `Main.lean`; each fragment's `import LeanProof.X` line removed; and, once, a triplicated file-scope `universe u` removed from `PendantIdentity.lean`) | **No mathematical content change.** Import lines and file-scope `universe u` declarations are compilation scaffolding, not proof-bearing text; `universe u` is already declared at the head of the consolidated file (line 42) and every `variable {X : Type u}` binder that uses it is untouched, so every declaration elaborates at the same universe. My byte-diffs of all four imported fragments against their capsule originals show **no statement or proof text differs** |
| 2 | **`-- VERITYOS ENTRY` neutralized to `FROZEN-SOURCE ENTRY` in comments** (registrar reserved-marker collision; ten lines in `Transcribed.lean`, one in `ForestDelta2Award.lean`) | **No mathematical content change.** Every occurrence is inside a Lean comment; stripping all comments from the registered source and re-checking the proof text confirms the code is byte-unaffected, and the untouched originals remain in `SOURCE/` and the capsule for comparison |
| 3 | **`theorem` → `lemma` for `forest_delta_three_lower`** (so the registrar binds it as the LEMMA entry repair R8 calls for) | **No mathematical content change.** In Lean 4 / Mathlib `lemma` is a macro alias for `theorem` with identical elaboration and identical resulting constant; the statement and proof text are unchanged, and the declaration is this route's **own new work**, never imported text. The declaration's type and its place in the closure are unaffected |
| 4 | **`EVIDENCE/axioms.txt` restructured** into one-axiom-per-line after the kernel receipt was written, with the verifier's original raw log preserved as `EVIDENCE/axioms-terminal-raw-probe.log` | **No mathematical content change.** The axiom set is the same three standard axioms before and after, and I verified the preservation claim directly: SHA-256 of `axioms-terminal-raw-probe.log` is `97c7fd110222abe36282aea5c2dc1c20cdbaa248be4559116d3aa96ca857c301`, **exactly the `axioms_log_sha256` recorded in `RECEIPTS/kernel-verification.json`** — the original content survives byte-for-byte. See O-6 for the one bookkeeping consequence |

**None of the four changes mathematical content.**

### Observations (recorded precisely; none is a mathematical defect, none alters the verdict)

- **O-1 (§3 step 11 wording).** §3 step 11 calls the induction's base "the kernel-checked
  base `L3(12) = 1` (`ErdosR25.CriticUC604FChain.L3_twelve_pos`, `decide`)". The named
  lemma states only `0 < L3 12`. The *equality* `L3(12) = 1` is true (I verified it), but
  in this project it is carried only by `L3_table`, which §6.2 and §9 correctly place
  **outside** the closure. The induction needs only positivity, so no step is affected,
  and the award's R2 face (§6.2) and the closure confirmation (§9) both state the lemma
  correctly. **Recommend** rewording §3 step 11 to "the kernel-checked base `0 < L3 12`"
  so no reader infers that the excluded `L3_table` is load-bearing.
- **O-2 (§9 sweep sentence, breadth).** §9 asserts "No `Finset`- or `SimpleGraph`-typed
  object is enumerated **anywhere in the registered project** (swept for
  `Finset.univ.filter`/`decide`/`native_decide`…)". The mandated R2 face-wording is
  narrower and closure-scoped ("in any declaration of the closure"), and **the
  closure-scoped claim is verified true** (E4). The project-scoped widening rests on a
  grep for the literal string `Finset.univ.filter`, which indeed has 0 hits, while the
  file contains 13 `(univ : Finset _).filter` expressions in the frozen transcribed
  `Erdos993G1.ThirdWide.cover_*` family — all outside the closure and none ever
  kernel-evaluated. **Recommend** confining §9's sentence to the closure, as the mandated
  wording does.
- **O-3 (self-referential disclaimers).** `INFORMAL-PROOF.md` §4 says the struck sentence
  "both are attributed on the face of `PendantIdentity.lean`" *"does not appear anywhere
  in this run's artifacts"*, and `FORMALIZER-REPORT.md` says *no "34 checks" literal
  appears anywhere in this run's artifacts* — each sentence containing the very literal it
  declares absent (and the struck sentence also appears, quoted, in the report's R3
  bullet). The propositions are **disclaimed, never asserted**, so no fence is violated
  and R3/R7 are substantively met. **Recommend** rewording to "is not asserted anywhere".
- **O-4 (cross-reference).** `FORMALIZER-REPORT.md`'s R7 bullet cites `INFORMAL-PROOF.md`
  §7 for the 34→39 correction; it is in **§8** (§7 is the R8 election). Off-by-one.
- **O-5 (condition (iv) — controller-facing, open).** Brief §3 condition (iv) requires
  that every numeric claim in the report ship with a digested exact-integer generator
  **under `EVIDENCE/`**: the `ℓ₃`/`L1`/`L2`/`L3` table for `n ≤ 60` and `L3(n) > 0` for
  `12 ≤ n ≤ 60`. The formalizer **declined and substituted the Lean kernel**, disclosed in
  `FORMALIZER-REPORT.md`; `EVIDENCE/` contains no such generator. The substitution
  argument (that `L3_pos_of_ge_twelve` is general in `n` and hence stronger than a bounded
  table) is sound as *mathematics*, but the condition is a capsule-contents requirement,
  not a mathematical one, and three of the four table facts it would have covered
  (`L2_table`, `L3_table`, `L3_thirteen_fourteen_pos`) are **not** in the kernel closure,
  so the kernel does not in fact subsume the whole of (iv). **This is an open
  condition-compliance item for the controller, not a defect in the mathematics.** I have
  independently supplied everything (iv) asks for — the full `n ≤ 60` table and `L3(n) > 0`
  verified to `n = 3 000` — in `scratchpad/a1-s7-informal-LA1/chain_eval.py` /
  `chain_eval.out`; as an auditor I must not write into `EVIDENCE/`, so the controller
  should decide whether to require the producer to ship one.
- **O-6 (receipt bookkeeping, consequence of disclosure 4).**
  `RECEIPTS/kernel-verification.json` records `artifacts/axioms_log =
  …/EVIDENCE/axioms.txt` together with `axioms_log_sha256 = 97c7fd11…`. That digest is now
  the digest of `EVIDENCE/axioms-terminal-raw-probe.log`; the file at the recorded **path**
  now hashes to `06fb652716a530e5e57372e7f99a8887e08576a854aad2f17fb0a457cc08de7c`. The
  content is preserved and verifiable, and the axiom verdict is unaffected, but the
  receipt's path→digest binding is no longer self-consistent. Disclosed by the producer;
  flagged here so the fidelity reviewer is not surprised by it.

---

## Verdict

**passed**

Every definition, hypothesis, imported fragment, arithmetic fact and inferential step of
`INFORMAL-PROOF.md` is verified with reproduced evidence, at statement-level granularity:
the three frozen G1 definitions are byte-identical to `sources/g1/`; the pendant identity
is mathematically correct at every vertex (not merely at a leaf) and its transport onto the
original carrier is sound, with the `j+1`/`j` formulation eliminating ℕ-subtraction
entirely; the C6-LA1 import and the arithmetic chain are byte-identical to their capsule
originals (the chain differing in exactly the one import line plus the disclosed header
comment, as the brief states); the three strong inductions are valid over every forest
including the edgeless and disconnected cases, with no base case over graphs and no
enumerated input; `L3(n) > 0` is established generally in `n` from a single ℤ-arithmetic
numeral fact; and the assembly yields exactly the contracted statement under exactly the
contracted hypotheses. My own exact-integer evaluator reproduces every numeric claim and
exhibits the sharpness of each stated hypothesis, and my own enumeration of all 1 601
order-12, 3 658 order-13 and 8 599 order-14 forest isomorphism classes confirms both that
the bound `L3(n) ≤ Δ₃` holds and that the awarded claim is true on the ground truth, while
order 11 (`min Δ₃ = −14`) shows the threshold is not misplaced. The fixed-rank fences, the
R2 enumeration wording (verbatim, digest-identical), the R2 closure fact (independently
recomputed), the scope exclusion of the sharpness half, and the R3 attribution faces all
hold. **None of the four disclosed changes alters mathematical content.**

No defective step was found. The observations O-1 through O-6 are wording, cross-reference
and capsule-contents items — O-5 (condition (iv)) and O-6 (receipt path→digest binding)
are the two that warrant a controller ruling — and none of them touches the mathematics of
the claim.

This audit is an informal proof-integrity verdict only. It does not assert
`formally_verified` registry status, does not run or replace the independent
formalization-fidelity audit or the kernel gate, does not move any other claim key, and
does not touch the excluded sharpness conjunct, which remains `proved_informal`.

*Reviewer `a1-la1-fable-informal-20260922`; attestation `a1-la1-informal-pass-20260922`;
producer `a1-la1-formalizer-sonnet-20260922`. Chartered model/effort Claude Opus 5, high,
on dispatch-record authority (this seat cannot self-inspect its runtime model or effort).*
