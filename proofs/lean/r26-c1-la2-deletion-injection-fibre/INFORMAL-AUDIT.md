---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la2-formalizer-opus-20260924
critic_id: c1-la2-fable-informal-20260924
attestation_id: c1-la2-informal-pass-20260924
claim_sha256: 58b357ecea00d87f2d564588044db9f3b1ce0625bd32810d7be3ad395336cf29
---

# Informal Proof Integrity Audit

**VerityOS boot acknowledgment.** I am operating within **VerityOS**. Boot performed per
`CLAUDE.md` → `verity.md` → `identity/startup-protocol.md`, then
`skills/proof-integrity-audit/skill.md` as the governing authority for this seat. Subsystems
loaded: `identity/` (startup protocol), `skills/` (`proof-integrity-audit`), `experiments/`
(this run root only, within the §1 read boundary). No memory, decision, log, knowledge,
project, operations or inbox record was read or written; no durable VerityOS state was
changed. Scale mode: **Single Problem** (`skills/proof-integrity-audit`, "Scale Modes"), with
the run's own ledger written here rather than as a separate `LEDGER.csv`, because the
controller's brief §3 fixes this file as the sole output.

**Model disclosure.** Chartered seat: **Claude Opus 5, effort high**, independent
informal proof-integrity reviewer for `C1-LA2`. **This seat cannot self-inspect its runtime
model or effort**; the chartered values are stated on dispatch-record authority
(`control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA2.md` header, and
`RECEIPTS/reviewer-assignment.json` `informal_reviewer.reviewer_id`
`c1-la2-fable-informal-20260924`, kind
`independent-mathematical-proof-integrity-reviewer`). Child delegation forbidden — **none was
performed**; every command below was run by this seat. I am not the producer: I edited no
contract, no Lean source, no informal proof and no receipt; my only writes are this file and
`evaluator.py`, `evaluator2.py`, `sweep-n5.txt`, `random-sweep.txt` beside it.

---

## Intended Claim

The intended claim is exactly `THEOREM-CONTRACT.yaml` `theorem.informal_statement`
(contract SHA-256 `76080c7df5f789150dc0eb66f48dfa9603cafd2df56f570f68216d9c08d61f7c`,
recomputed and matched). Whitespace-collapsed with `" ".join(s.split())` its SHA-256 is

```text
58b357ecea00d87f2d564588044db9f3b1ce0625bd32810d7be3ad395336cf29
```

recomputed by this seat and **equal** to the digest the brief §3 requires.

In my own words, the claim is: for every finite vertex type `V` with decidable equality, every
simple graph `G` on `V` with decidable adjacency, every `U : Finset V` and every `ℓ : ℕ`, with
`I(U) := indepPowerset G U` the finset of independent subsets of `U`,

* **(a)** `2 * Σ_{A ∈ I(U)} |A| ≤ |U| * |I(U)|` in `ℕ`; and
* **(b)** `((ℓ : ℤ) − |U|) * |I(U)| ≤ Σ_{A ∈ I(U)} ((ℓ : ℤ) − 2*|A|)` in `ℤ`,

with (b) the terminal declaration, **no hypothesis beyond finiteness** (no tree, no
connectivity, no `hyp-alpha`, no `hyp-eligible`, no `(★)`, and in particular **no `|U| ≤ ℓ`**),
(a) carried as the in-run RE-PROOF of the ARMW-2020 occupancy bound, and nothing asserted about
`S`, trees, families, `W_III` or (RC).

Gate artifacts I recomputed before auditing the mathematics:

| Item | Recomputed | Declared | Verdict |
|---|---|---|---|
| `THEOREM-CONTRACT.yaml` SHA-256 | `76080c7d…61f7c` | `76080c7d…61f7c` | match |
| `INFORMAL-PROOF.md` SHA-256 | `8de0f32f…8c0f` | `8de0f32f…8c0f` | match |
| `LeanProject/LeanProof/Main.lean` SHA-256 | `6e5650ff…8114` | `6e5650ff…8114` | match |
| Capsule inner seal (SHA-256 of compact key-sorted JSON minus `seal_sha256`, no trailing newline) | `75ebcffb…eb78` | `75ebcffb…eb78` | match |
| Capsule members | 28/28 byte counts and digests | `file_count: 28` | match |
| `U2-Main.lean` / `C-U2-F-CritF.lean` | `c3827075…1b043b` / `4ce9a7a5…2edfb4` | same | match |
| Frozen C5-LA1 `Main.lean` | `0933211d…6b63b` | `0933211d…6b63b` | match |
| Contract `expected_statement` SHA-256 | `4c23d404…f05e46` | `4c23d404…f05e46` | match |
| Contract `source_materials` | 10/10 | 10 | match |

---

## Claim Ledger

Granularity: one row per definition, lemma, inference step, hypothesis entry, cast and
equality. **V** = verified with reproduced evidence; **O** = observation, no defect.

### L0 — Definitions and ambient data

| # | Claim | Where it enters | Evidence | Verdict |
|---|---|---|---|---|
| L0.1 | `I(U) := U.powerset.filter (fun A => G.IsIndepSet (A : Set V))` | `INFORMAL-PROOF.md` §1; `Main.lean` ENTRY 1 | Shipped text is **byte-identical** to U2's `indepPowerset` (`DRAFTS/carry-indepPowerset.declaration.txt`, 248 B, verbatim substring of `U2-Main.lean`). | V |
| L0.2 | `A ∈ I(U)` unfolds to `A ⊆ U ∧ G.IsIndepSet (A : Set V)` | §1; used in §3 Steps 1, 3 | `Finset.mem_filter` + `Finset.mem_powerset`; exactly the `simp only [... indepPowerset, Finset.mem_filter, Finset.mem_powerset]` rewrites the Lean body performs. | V |
| L0.3 | `I(U)` is never empty (`∅ ∈ I(U)`) | §1; §4 "Sharpness and scope" (LHS strictly negative when `ℓ < ‖U‖`) | Recomputed: `|I(U)| ≥ 1` in every one of the 33,867 exhaustive instances and 4,000 random instances. | V |
| L0.4 | Independence is a pairwise condition, hence downward closed | §3 Step 1 well-definedness | Mathlib v4.32.2 `Mathlib/Combinatorics/SimpleGraph/Clique.lean:843`: `abbrev IsIndepSet (s : Set α) : Prop := s.Pairwise (fun v w ↦ ¬G.Adj v w)` — an `abbrev`, so `Set.Pairwise.mono` applies definitionally; `Mathlib/Data/Set/Pairwise/Basic.lean:77` `Pairwise.mono (h : t ⊆ s) (hs : s.Pairwise r) : t.Pairwise r`. | V |
| L0.5 | Ambient hypotheses are exactly `[Fintype V] [DecidableEq V]`, `G : SimpleGraph V`, `[DecidableRel G.Adj]`, `U : Finset V`, `ℓ : ℕ` | §"Hypotheses"; contract `hypotheses: []` | Read off `Main.lean` lines 105–111; `hypotheses` is the empty list in the contract; no other binder exists. | V |
| L0.6 | `[Fintype V]` is not actually used by either result | — | Lean's `unusedSectionVars` linter reports it for `deletionInjectionBound` (`EVIDENCE/axioms.txt`). The declaration therefore proves **less** than it could, never more; the contract's "finiteness is the only ambient assumption" stays honest. | O |

### L1 — §2, `C5LA1.sum_card_filter_comm` (frozen C5-LA1 ENTRY 23)

| # | Claim | Evidence | Verdict |
|---|---|---|---|
| L1.1 | Statement: `Σ_{a ∈ s} #{b ∈ t : r a b} = Σ_{b ∈ t} #{a ∈ s : r a b}` | Recomputed on 300 random `(s,t,r)` with `|s|,|t| ≤ 6`: no failure. | V |
| L1.2 | Proof: `Finset.card_filter` then `Finset.sum_comm` | `Finset.card_filter` (`Mathlib/Algebra/BigOperators/Group/Finset/Piecewise.lean:277`) turns each filtered card into `∑ a ∈ s, if p a then 1 else 0`; `Finset.sum_comm` is the `to_additive` image of `Finset.prod_comm` (`.../Group/Finset/Sigma.lean:121`). Both steps are identities, not inequalities. | V |
| L1.3 | Carried byte-identically at the declaration level from the frozen C5-LA1 source | `DRAFTS/carry-C5LA1-sum_card_filter_comm.declaration.txt` (323 B) is a **verbatim byte substring** of `sources/r24/c5-la1/LeanProject/LeanProof/Main.lean` (`0933211d…`), and appears verbatim in the shipped `Main.lean`. This is the project's **only** C5-LA1 entry. | V |
| L1.4 | Wrapper re-derivation (formalizer finding C-1): frozen ENTRY 23 wrapper `open SimpleGraph C4LA1` shipped as `open SimpleGraph` | Diffed the two entry blocks: the **only** difference in the whole block is the six bytes `" C4LA1"` (frozen fragment 425 B vs shipped fragment 419 B — exactly 6). The lemma's binders are `{α β : Type*}` and its proof names `Finset.card_filter` / `Finset.sum_comm` **fully qualified**, so no name in the body resolves through `open`. Statement and proof are unchanged; `C4LA1` does not exist in this single-source project. Per brief R2 the wrapper is not a body. | V (no defect) |

### L2 — §3, `R26LA2.deletionInjectionBound`: `2 Σ_{A∈I(U)} |A| ≤ |U|·|I(U)|`

| # | Step | Hypotheses entering | Evidence | Verdict |
|---|---|---|---|---|
| L2.1 | Step 1, well-definedness: `A ↦ A.erase u` maps `{A ∈ I(U) : u ∈ A}` into `{A ∈ I(U) : u ∉ A}` | `A ⊆ U` (L0.2), `IsIndepSet A` (L0.2), downward closure (L0.4), `Finset.notMem_erase` (`Data/Finset/Erase.lean:60`), `Finset.mem_of_mem_erase` (`:65`) | Recomputed by exhaustive enumeration: 84,073 `(G,U,u)` triples over **all** graphs on `n ≤ 5`, all `U ⊆ V`, all `u ∈ U` — every image lands in the codomain. | V |
| L2.2 | Step 1, injectivity: `A = insert u (A.erase u)` | `u ∈ A`; `Finset.insert_erase (h : a ∈ s) : insert a (s.erase a) = s` (`Data/Finset/Basic.lean:142`) | Same 84,073 triples: image multiset has no collision in any instance. | V |
| L2.3 | Step 1 conclusion `#{A : u ∈ A} ≤ #{A : u ∉ A}` | L2.1 + L2.2 via `Finset.card_le_card_of_injOn` (`Data/Finset/Card.lean:422`, signature `(f) (hf : Set.MapsTo f s t) (f_inj : (s : Set α).InjOn f)` — exactly the two obligations discharged) | recomputed, no failure | V |
| L2.4 | Step 2, exact partition `#{A : u ∈ A} + #{A : ¬u ∈ A} = #I(U)` | `Finset.card_filter_add_card_filter_not` (`Data/Finset/Card.lean:643`, statement recomputed by hand from the file: `#(s.filter p) + #(s.filter fun a ↦ ¬ p a) = #s`) | recomputed on all 84,073 triples: equality exact | V |
| L2.5 | Step 2 conclusion `2·#{A : u ∈ A} ≤ #I(U)` for **every** `u ∈ U` | L2.3 + L2.4, closed by `omega` over `ℕ` | recomputed, holds in all 84,073 triples | V |
| L2.6 | ℕ-subtraction audit for §3: "None occurs" | Read the whole body: only `+`, `*`, one exact equation, one `≤`, `omega`. No `-` appears in the statement or the proof of ENTRY 3. `Finset.card_erase_of_mem` (which would introduce `ℕ`-subtraction) is **not** used — it appears only in U2's `familyOneInjection`, which is **not** carried. | V |
| L2.7 | Step 3, double count `Σ_{u∈U} #{A ∈ I(U) : u ∈ A} = Σ_{A∈I(U)} #{u ∈ U : u ∈ A}` | L1.1 with `s := U`, `t := I(U)`, `r u A := u ∈ A` | recomputed: both sides equal on every `(G,U)` instance | V |
| L2.8 | Step 3, `U.filter (· ∈ A) = A` for `A ∈ I(U)` | `A ⊆ U` (L0.2); `Finset.ext` elementwise | recomputed: `Σ_{A} #{u ∈ U : u ∈ A} = Σ_A |A|` on every instance | V |
| L2.9 | Step 4, `2 Σ_A |A| = Σ_{u∈U} 2·#{A ∋ u} ≤ Σ_{u∈U} #I(U) = |U|·#I(U)` | L2.5 summed by `Finset.sum_le_sum`; `Finset.mul_sum`; `Finset.sum_const` + `smul_eq_mul` + `mul_comm` | The composite inequality recomputed directly: **33,867** exhaustive `(G,U)` instances (all graphs `n ≤ 5`) and 4,000 random instances up to `n = 12` at six densities — **zero** violations. | V |
| L2.10 | `U = ∅` is not a hidden edge case | `I(∅) = {∅}`, so `0 ≤ 0`; the outer sum over `u ∈ U` is empty | recomputed (`n = 0` and `r = 0` rows of the sweep) | V |
| L2.11 | Step 1 is stated "Fix `u ∈ U`" but `u ∈ U` is never used in Steps 1–2 (the Lean body binds it as `_hu`) | — | The step is true for arbitrary `u : V`; the informal proof's stronger-than-needed hypothesis is harmless and the summation in Step 4 does need `u ∈ U`. | O |
| L2.12 | The bound is **attained**, so `|U|` is not a lossy constant | Equality in 13,225 of 33,867 exhaustive instances; every edgeless graph with `U = V` gives equality (`n = 4`: `2·32 = 64 = 4·16`), and in 2,526 of 4,000 random instances the constant cannot be lowered to `|U| − 1`. | V |
| L2.13 | Equivalent reading "average size of an independent subset of `U` is at most `|U|/2`" | recomputed with exact rationals: `n = 3` edgeless gives `3/2 = |U|/2` (tight), `n = 3` with one edge gives `7/6 < 3/2`. This is exactly ARMW-2020's `avi(H) ≤ |V(H)|/2` for `H := G[U]`, since `I(U)` is precisely the independent-set family of the induced subgraph on `U`. | V |

### L3 — §4, `R26LA2.fibreInequalitySharp` (terminal)

| # | Step | Evidence | Verdict |
|---|---|---|---|
| L3.1 | Step 1, cast of L2.9 into `ℤ`: `2 Σ_A (|A| : ℤ) ≤ (|U| : ℤ)·(#I(U) : ℤ)` | `Nat.cast` is monotone and injective on `ℕ`; `exact_mod_cast` + `push_cast` only move casts across `*` and `∑`. No subtraction, no truncation, no information lost. | V |
| L3.2 | Step 2 identity `Σ_A ((ℓ:ℤ) − 2|A|) = (ℓ:ℤ)·#I(U) − 2 Σ_A (|A|:ℤ)` | Named lemma is `Finset.sum_sub_distrib`, the `to_additive` image of `Finset.prod_div_distrib` (`Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:659`): `∏ x ∈ s, f x / g x = (∏ x ∈ s, f x) / ∏ x ∈ s, g x`. Plus `Finset.sum_const`, `Finset.mul_sum`, `push_cast`, `ring`. **Recomputed as an exact integer equality in all 304,803 exhaustive `(G,U,ℓ)` instances** — it is an identity, never an inequality. | V |
| L3.3 | Step 3: after substitution the goal is `ℓ·c − |U|·c ≤ ℓ·c − 2S`, i.e. `2S ≤ |U|·c`, which is Step 1 | Verified by hand: `ℓ` cancels **identically** on both sides. The step is a ring-normalization plus one linear inequality; it does **not** use `c ≥ 0`, `ℓ ≥ 0`, or `|U| ≤ ℓ`. Independently confirmed: the inequality also holds at `ℓ ∈ {−7, −1}` in my `ℤ`-valued evaluator, exactly as `ℓ`-cancellation predicts. | V |
| L3.4 | Terminal statement holds for **every** `ℓ : ℕ`, including `ℓ < |U|` | **304,803** exhaustive `(G,U,ℓ)` instances (all graphs `n ≤ 5`, all `U`, `ℓ ∈ 0..8`) plus 4,000 random instances to `n = 12` with `ℓ ∈ {−7,−1,0,1,2,3,5,8,13,40}` — **zero** violations. | V |
| L3.5 | Failure of the weaker form outside its hypothesis (the brief's "exhibit the failure" obligation) | U2's `fibreInequality` asserts `0 ≤ Σ_A ((ℓ:ℤ) − 2|A|)` **under `|U| ≤ ℓ`**. Dropping that hypothesis makes it **false**: smallest witness `n = 1`, `G` edgeless, `U = {0}`, `ℓ = 0`: `I(U) = {∅, {0}}`, `Σ = 0 + (−2) = −2 < 0`. The sharp form at the same point reads `(0 − 1)·2 = −2 ≤ −2` — **true, with equality**. In total **71,995** of the 304,803 instances have `Σ < 0` while the sharp form holds. Worked `P₃` instance (`U = V`, `I(U) = {∅,{0},{1},{2},{0,2}}`, `#I = 5`, `Σ|A| = 5`): `ℓ=0` LHS `−15` ≤ RHS `−10` (weak form `0 ≤ −10` **false**); `ℓ=1` `−10 ≤ −5` (weak form false); `ℓ=2` `−5 ≤ 0`; `ℓ=3` `0 ≤ 5`; `ℓ=5` `10 ≤ 15`. | V |
| L3.6 | ℕ-subtraction audit for §4: statement and proof live in `ℤ`; every `−` is `ℤ`-subtraction, never truncated | Read the declaration: the only `ℕ` objects are `ℓ`, `U.card`, `A.card`, `(indepPowerset G U).card`, each cast **individually** with `Nat.cast` **before** any subtraction. `((ℓ : ℤ) - (U.card : ℤ))` and `((ℓ : ℤ) - 2 * (A.card : ℤ))` are both `ℤ`-subtractions; there is no `(ℓ - U.card : ℕ)` anywhere. | V |
| L3.7 | `|I(U)| ≥ 1`, so the claimed strict negativity of the LHS when `ℓ < |U|` is correct | L0.3 | V |

### L4 — Fidelity of the informal text to the Lean declarations (definitions checked literally)

| # | Claim | Evidence | Verdict |
|---|---|---|---|
| L4.1 | Terminal declaration name and kind | `Main.lean` ENTRY 4 is `theorem fibreInequalitySharp` in `namespace R26LA2`; contract `declaration_name: R26LA2.fibreInequalitySharp`, `expected_declaration_kind: theorem`. Exactly one terminal `theorem` in the project; `deletionInjectionBound` is a `lemma`, as the synthesis §2 directs. | V |
| L4.2 | Terminal declaration's binders match the claim one-for-one | `(G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) (ℓ : ℕ)` under `{V : Type*} [Fintype V] [DecidableEq V]`. Contract `quantifiers` lists V, G, adjacency decision, U, ℓ; `hypotheses: []`. Nothing else. | V |
| L4.3 | `expected_statement` is the shipped declaration text | Whitespace-normalized, the two agree character for character; its SHA-256 recomputed as `4c23d404…f05e46`, equal to the declared value. | V |
| L4.4 | Shipped statement is the synthesis §2 statement | Synthesis writes `((ℓ : ℤ) - U.card) * (indepPowerset G U).card ≤ ∑ A ∈ indepPowerset G U, ((ℓ : ℤ) - 2 * A.card)`; the shipped text writes the three `Nat.cast` coercions explicitly in the positions where the elaborator inserts them (forced into `ℤ` by `(ℓ : ℤ)`). Same proposition; nothing weakened, narrowed or strengthened. | V |
| L4.5 | `deletionInjectionBound` carried byte-identically at the body level from U2 | `DRAFTS/carry-deletionInjectionBound.declaration.txt` (2,788 B) is a verbatim byte substring of `U2-Main.lean`, and applying the **single** substitution `theorem → lemma` on the declaration line yields exactly the shipped text. I verified this programmatically as an exact string identity, so **no other byte differs**. | V |
| L4.6 | `fibreInequalitySharp` re-derived from `C-U2-F` (formalizer finding C-3) | `DRAFTS/carry-fibreInequalitySharp.declaration.txt` (1,166 B) is a verbatim byte substring of `C-U2-F-CritF.lean`; deleting **every** occurrence of the literal `R26LA1.` and changing nothing else yields exactly the shipped text (verified as an exact string identity). The four occurrences re-resolve to `R26LA2.indepPowerset` / `R26LA2.deletionInjectionBound`, which are the objects this award's statement must be about. R2's re-derivation clause applies and the reason is recorded in `FORMALIZER-REPORT.md` C-3. | V |
| L4.7 | No `R26LA1.`, `R26CritF.` or `C4LA1` name survives in the shipped source | grep over `Main.lean`: zero hits for `R26LA1`, `R26CritF`, `C4LA1`. | V |
| L4.8 | Exactly one C5-LA1 entry is carried, and it is a genuine dependency | grep: the only C5-LA1 names in the project are the ENTRY 2 declaration and its single use at `Main.lean:78`, `rw [C5LA1.sum_card_filter_comm U I (fun u A => u ∈ A)]` inside the carried body of `deletionInjectionBound`. Confirmed against U2's own return ("used through `C5LA1.sum_card_filter_comm` — the general Fubini-for-filters lemma … reused here rather than reproved", `U2/RETURN.md:171`). **The formalizer brief §3 R1's parenthetical ("these two declarations do not [depend on C5-LA1]") is factually wrong; the operative clause governs and the controller's own correction to my brief says the same.** The frozen entry's own digest `8a2d0fce…` (425 B) matches `sources/r24/c5-la1/RECEIPTS/formalization.json` entry 23. | V |
| L4.9 | No definition of record beyond ENTRY 23 is a dependency | grep: no `leafSet`, `leafDegree`, `support`, `supportSet`, `indepSetsAvoiding`, `aggregate`, `crossingIndex`, `IsTree`, `Connected`, `W_III` anywhere in the source. The contract's dependency graph lists exactly `def-indep-powerset`, `def-sum-card-filter-comm`, `def-deletion-injection-bound` and the five domain nodes; nothing marked NOT a dependency is one. | V |
| L4.10 | Forbidden constructs | grep over `Main.lean`: no `sorry`, `admit`, `native_decide`, `axiom`, or `decide`. Single-source project, `import Mathlib` only (root `LeanProof.lean` is `import LeanProof.Main`). | V |
| L4.11 | Axioms | `EVIDENCE/axioms-per-declaration.txt` and `EVIDENCE/axioms.txt` both report `[propext, Classical.choice, Quot.sound]` for all four declarations — exactly the three permitted, no `sorryAx`. The `INFORMAL-PROOF.md` axiom-policy paragraph matches. | V |

### L5 — Provenance and attribution (the synthesis's requirement that it travel on the face)

| # | Claim on the award's face | Independent check inside the capsule | Verdict |
|---|---|---|---|
| L5.1 | ARMW-2020 occupancy bound, **re-proved in-run, never imported** | `SOLUTION-CONTRACT.md` fence 7 (lines 58–61) requires exactly this attribution and states the bound is re-proved in-run, not imported. `C-U2-F` F6 and `C-U2-T` F8 both record the missing literal as the defect. The line is now present in `INFORMAL-PROOF.md` §"Attribution on the face of this claim" **and** in the contract's `informal_statement`. The mathematical identification is apt: `I(U)` is the independent-set family of `G[U]`, and (a) is `avi(G[U]) ≤ \|U\|/2` cleared of denominators (L2.13). | V |
| L5.2 | Compiled form route-attributed to **U2** | `U2/RETURN.md` §(a) `R26LA1.deletionInjectionBound` (line 144 ff.) and §(b) `R26LA1.fibreInequality` (line 176 ff.) | V |
| L5.3 | Sharp form critic-attributed to **`C-U2-F`** | `U2/F/CRITIQUE.md` finding **F7 item 1**, `R26CritF.fibreInequalitySharp`, "for every `ℓ : ℕ`, with no hypothesis at all", with `fibreInequalityOfSharp` re-deriving U2's (b) | V |
| L5.4 | Informal derivations **T3 (v)** and **`C-F1-T` (D)** | T3 (v) is named identically by the synthesis's `## Lean awards` entry. `C-F1-T` is **outside** this capsule's read boundary; I did not open it and record the attribution as carried on the synthesis's authority, which is the statement of record for this dispatch. | V (scoped) |
| L5.5 | Statement identity with `C-U1-F`'s `deletionInjection_proved` verified by `rfl` | Recorded by the synthesis; `C-U1-F` is outside the carry list, so I neither re-checked nor relied on it. The award does not depend on it. | O (scoped) |
| L5.6 | `INFORMAL-PROOF.md` states "`C-U2-F` (finding F6) and `C-U2-T` both record that the missing attribution line was the only defect standing between this material and registration" | Accurate **for (a)/(b)**: `C-U2-F` F6 is an "attribution-hygiene defect, not a fence crossing"; `C-U2-T` F8 is "Narrowing, not a strike". `C-U2-T`'s other findings (the inert `hL1`, over-stated `hDL`/`hNoEdge` attributions) concern U2's item (c) `familyOneInjection`, which is **not** in this award. The sentence is correctly scoped. | V |

---

## Reproduced Mathematical Evidence

Everything numeric below was recomputed by this seat with evaluators **I wrote from scratch**
under `scratchpad/c1-s7-informal-LA2/`; no prior evaluator, census or fixture was imported, and
no result from the record was taken on trust. Standard library only; explicit import lists:
`evaluator.py` imports `itertools.combinations`, `itertools.product`, `fractions.Fraction`,
`sys`; `evaluator2.py` imports `random`, `itertools.combinations`. All arithmetic is exact
integer (and exact `Fraction` for the average-size reading). **No wall-clock field is written
by either script**; `evaluator2.py` seeds `random.Random(993)` for reproducibility. No network,
no installs, no Lean build; every run was foreground and exited before the next step.

**Model.** A graph on `{0,…,n−1}` is the set of its edges; `I(U)` is enumerated directly from
the definition (`A ⊆ U` and pairwise non-adjacent), independently of the Lean text.

**Sweep 1 — exhaustive (`evaluator.py 5` → `sweep-n5.txt`).** All labelled graphs on `n ≤ 5`
vertices (1 + 1 + 2 + 8 + 64 + 1024 = 1,100 edge sets over `n = 0..5`), all `U ⊆ V`, all
`ℓ ∈ {0,…,8}`:

```text
instances of (a) checked: 33867
instances of (b) checked: 304803
(u,U,G) injection+partition step checks: 84073
NO counterexample to (a) or (b); sec.4 Step-2 identity exact in every instance.
equality cases of (a): 13225
equality cases of (b): 119025
instances where U2 weak form 0 <= sum(ell-2|A|) FAILS (ell < |U| regime): 71995
  smallest such: (n=1, E=[], U=[0], ell=0, sum=-2, sharp LHS=-2, sharp RHS=-2)
  edgeless n=0..6, U=V: 2*sum|A| = |U|*|I(U)| EQUALITY in every case
  avg |A| over I(U), n=3, E=[]:      3/2  <= |U|/2 = 3/2  (tight)
  avg |A| over I(U), n=3, E=[(0,1)]: 7/6  <= 3/2
  avg |A| over I(U), n=4, E=[]:      2    <= 2           (tight)
  avg |A| over I(U), n=4, E=[(0,1)]: 5/3  <= 2
```

Per instance the script independently re-checks, not merely the headline bounds, but each
inference step of §3: well-definedness and injectivity of `A ↦ A.erase u` (L2.1, L2.2), the
exact partition (L2.4), `2·#{A ∋ u} ≤ #I(U)` (L2.5), the double count in both of its equalities
(L2.7, L2.8), and the §4 Step-2 identity as an **exact** integer equation (L3.2).

**Sweep 2 — randomized, larger (`evaluator2.py` → `random-sweep.txt`).** 4,000 instances,
`n ∈ 1..12`, edge densities `{0, 0.1, 0.3, 0.5, 0.8, 1.0}`, random `U`, with
`ℓ ∈ {−7,−1,0,1,2,3,5,8,13,40}` (negative values included deliberately, since `ℓ` cancels in
Step 3 and the bound should therefore survive them):

```text
random instances (n <= 12, all densities): 4000
violations of (a), (b), or their equivalence: 0
instances attaining equality in (a) [bound tight]: 1993
instances where the constant |U| cannot be lowered to |U|-1: 2526
Fubini-for-filters (C5LA1 ENTRY 23) random check: True
K3, U=V:  |I|=4,  sum|A|=3,  2*sum=6   <= |U|*|I| = 12
E4 edgeless, U=V: |I|=16, sum|A|=32, 2*sum=64 == 4*16 = 64   EQUALITY
```

**Sharpness, positively exhibited.** Equality in (a) holds precisely when
`2 Σ|A| = |U|·|I(U)|`; the edgeless graph on `U` realizes it for every `n`
(`Σ|A| = n·2^{n−1}`, `|I(U)| = 2^n`). So `|U|` is the smallest constant of this shape and the
inequality is attained, not merely valid.

**Hypothesis-failure exhibit (brief §2.2).** The record says the sharp form needs **no**
`|U| ≤ ℓ`. I confirmed the converse direction that makes this meaningful: the **weaker** U2
form `0 ≤ Σ_A ((ℓ:ℤ) − 2|A|)`, if its hypothesis `|U| ≤ ℓ` is dropped, is **false** — smallest
counterexample `n = 1`, edgeless, `U = {0}`, `ℓ = 0`, value `−2`; 71,995 such instances in
Sweep 1. At every one of them the sharp form holds. That is the exact sense in which `|U| ≤ ℓ`
is a specialization rather than a need.

**One honest qualification of "sharpening", recomputed.** Because `ℓ` cancels identically in
Step 3, the sharp form is, for each fixed `(G,U)`, **equivalent to (a) for every single `ℓ`**.
The sharpening is therefore *pointwise in `ℓ`*: at a fixed `ℓ < |U|` U2's form says nothing
while the sharp form still gives `(ℓ−|U|)·|I(U)|`. As **universally quantified** statements the
two are inter-derivable — U2's form instantiated at `ℓ := |U|` (permitted, since `hU` holds with
equality) yields (a) at once. I verified this equivalence on every instance with `n ≤ 4`:
`(0 ≤ Σ_A(|U| − 2|A|)) ⟺ (2Σ|A| ≤ |U|·|I(U)|)`, true in all cases. `INFORMAL-PROOF.md` does
**not** overstate this: it says only that `|U| ≤ ℓ` "is a specialization and not a need", which
is exactly right, and the award statement makes no strength claim at all. Recorded as an
observation, not a defect.

**Mathlib lemma meanings, checked at file and line** against the pinned shared project
`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project` (Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`), read-only:
`SimpleGraph.IsIndepSet` (`Clique.lean:843`, an `abbrev` for `Set.Pairwise (¬ Adj)`),
`Set.Pairwise.mono` (`Data/Set/Pairwise/Basic.lean:77`),
`Finset.card_le_card_of_injOn` (`Data/Finset/Card.lean:422`),
`Finset.card_filter_add_card_filter_not` (`Data/Finset/Card.lean:643`),
`Finset.insert_erase` (`Data/Finset/Basic.lean:142`),
`Finset.notMem_erase` / `Finset.mem_of_mem_erase` (`Data/Finset/Erase.lean:60,65`),
`Finset.card_filter` (`Algebra/BigOperators/Group/Finset/Piecewise.lean:277`),
`Finset.sum_comm` (`to_additive` of `prod_comm`, `.../Sigma.lean:121`),
`Finset.sum_sub_distrib` (`to_additive` of `prod_div_distrib`, `.../Defs.lean:659`).
Every lemma the informal proof names exists at v4.32.2 and says what the proof uses it to say.

---

## Independent Critic Pass

Run after the ledger was complete, against the unchanged claim, deliberately hunting for a
defect rather than confirming the producer. Each attack and its outcome:

1. **"`ℓ` cancels, so the theorem is vacuous or mis-stated."** Rejected. Cancellation makes the
   claim *equivalent to (a) for each `ℓ`*, not empty: the asserted proposition
   `(ℓ−|U|)·|I(U)| ≤ Σ(ℓ−2|A|)` is a true, non-trivial inequality with a negative LHS whenever
   `ℓ < |U|`, and it is the quantitative form a successor instantiates. Recomputed at 304,803
   points including `ℓ < |U|` and (as a stress test) `ℓ < 0`.
2. **"The `ℕ → ℤ` cast in §4 Step 1 hides a truncation."** Rejected. The cast is applied to
   `2 * Σ|A|` and to `|U| * |I(U)|`, both `ℕ`-valued with **no subtraction inside**; `push_cast`
   then distributes `Nat.cast` over `*` and `∑`, which are homomorphic. The first subtraction in
   the whole development appears only **after** both operands are already in `ℤ` (L3.6).
3. **"§3 Step 2's `omega` closes a truncated-subtraction goal."** Rejected. The two facts fed to
   `omega` are an exact `ℕ` equation (`card_filter_add_card_filter_not`) and a `≤`; the goal
   `2a ≤ a + b` given `a + b = c`, `a ≤ b` involves no `-`. Recomputed on 84,073 triples.
4. **"The erase injection needs `G` loopless / symmetric / a tree."** Rejected. The only graph
   fact used is that `IsIndepSet` is a `Set.Pairwise` predicate, hence monotone under `⊆`
   (L0.4). My enumeration covers **all** graphs on `n ≤ 5` — complete graphs, edgeless graphs,
   disconnected graphs, graphs with isolated vertices — with zero failures.
5. **"Well-definedness silently assumes `u ∈ A` or `u ∈ U`."** Rejected. `u ∈ A` is the domain
   filter, and `u ∈ U` is bound but unused (L2.11); dropping it only strengthens the step.
6. **"`I(U)` might be empty, breaking the sharpness paragraph's claim that the LHS is
   negative."** Rejected: `∅ ∈ I(U)` always, so `|I(U)| ≥ 1` (L0.3), verified on every instance.
7. **"The C5-LA1 wrapper edit changed the lemma."** Rejected. Byte-diff of the two entry blocks
   shows the **only** difference is the six bytes `" C4LA1"` in an `open` line; the declaration
   is byte-identical and names nothing that `open` could affect (L1.4). I checked specifically
   that `Finset.card_filter` and `Finset.sum_comm` are written fully qualified, so no
   resolution could shift.
8. **"`theorem → lemma` or the `R26LA1.` strip smuggled in another change."** Rejected. I
   reconstructed the shipped text from each carry-authority file by applying **only** the
   declared substitution and tested exact string identity — both matched, so no other byte
   differs (L4.5, L4.6).
9. **"The award asserts something fenced."** Rejected. `S`, trees, connectivity, families
   (I)/(II)/(III), `W_III`, (RC), `U(J')`, `E993-BETA-AGG`, the transport, the common-leaf
   condition, TREE, FOREST, TRANSFER and Erdős #993 appear in `INFORMAL-PROOF.md` and the
   contract **only inside explicit exclusion sentences**, and nowhere at all in the Lean
   source. An exclusion is not an assertion. The `U(J')` instantiation is named and assigned to
   C1-LA1, as the synthesis requires.
10. **"The attribution is decorative rather than apt."** Rejected. Fence 7 names the occupancy
    bound `avi(H) ≤ |V(H)|/2`; (a) is that statement for `H := G[U]` cleared of denominators,
    which I recomputed as an exact-rational average (L2.13). And it is genuinely re-proved: the
    project imports only `Mathlib`, and no Mathlib statement of the occupancy bound is invoked
    — the whole proof is the erase injection plus Fubini.
11. **"The single-sourced-within-F caveat conceals a hole."** Rejected. §4 is three lines of
    integer algebra over §3, and §3 is a standard double count. I re-derived §4 Steps 1–3 by
    hand independently of both the Lean text and the F-orientation prose, and recomputed every
    equality in it as an exact integer identity. The one place where a careless reading could
    overstate — "sharpening" — I checked and stated precisely above; the informal proof does not
    make the overstatement.
12. **"A C5-LA1 definition of record leaked in."** Rejected. Exactly one C5-LA1 name exists in
    the project (L4.8/L4.9); the frozen entry digest matches the frozen award's own receipt.
13. **"The brief's R1 parenthetical is right and the formalizer invented a dependency."**
    Rejected. `Main.lean:78` uses `C5LA1.sum_card_filter_comm` inside the byte-identical carried
    body; removing it would break the carry. The parenthetical is simply wrong, the formalizer
    recorded it as finding C-5, and the controller's own correction to this seat's brief agrees.
14. **"Some receipt contradicts the report."** One apparent conflict examined and cleared:
    `FORMALIZER-REPORT.md` states `RECEIPTS/reviewer-assignment.json` does not exist, yet it
    does. It is dated `2026-09-24T05:05:50Z`, is signed with `controller_authority:
    skills/lean-proof-workflow/skill.md`, and names this seat — i.e. the controller wrote it
    **after** the formalizer sealed its report, exactly as the report's "Remaining gates" item 1
    says the controller would. No contradiction, and no producer overreach.

The critic pass produced **no disputed claim** and no reopened ledger row.

---

## Scope and Fence Check

| Fence / condition | Source | Finding |
|---|---|---|
| Excluded conclusions: nothing about `S`, trees, connectivity, families (I)/(II)/(III), `W_III`, (RC) | synthesis `## Lean awards` C1-LA2; formalizer brief §2 | **Respected.** Absent from the Lean source entirely; present in the prose only as explicit exclusions. |
| Use at `U := U(J')` belongs to C1-LA1 | same | **Respected.** Named in `INFORMAL-PROOF.md` §"Excluded conclusions" and in the contract's conclusion text solely to assign it elsewhere; no instantiation appears in the source. |
| No status transfer (all-rank aggregate, `E993-BETA-AGG`, ordinary-to-RTree transport, common-leaf condition, TREE, FOREST, TRANSFER, Erdős #993) | `INFORMAL-PROOF.md`; `SOLUTION-CONTRACT.md` | **Respected.** Explicitly disclaimed on the face; nothing in the source touches them. |
| Hypotheses: none beyond finiteness — no tree, no connectivity, no `hyp-alpha`, no `hyp-eligible`, no `(★)`, **no `|U| ≤ ℓ`** | brief §2 | **Respected.** `hypotheses: []`; verified against the declaration binders and by the `ℓ < |U|` sweep. |
| Two `R26LA2` declarations, `deletionInjectionBound` as `lemma`, `fibreInequalitySharp` the one terminal `theorem`, the latter the bound declaration | brief §2 | **Met.** Plus the definition `indepPowerset` and the one required C5-LA1 entry; exactly one terminal `theorem`, registered last. |
| R1 — single-source project importing only `Mathlib`; C5-LA1 entries only if depended on | brief §3 | **Met**, with the brief's own parenthetical corrected (L4.8). |
| R2 — byte-identical carry, origin and full digest cited, re-derivations recorded with reasons | brief §3 | **Met.** Three carries byte-identical at the declaration/body level; the two permitted deviations are exactly characterized (L1.4, L4.5, L4.6) and their reasons recorded as findings C-1/C-2/C-3. |
| R3 — contract id, declaration name, `expected_statement`, definitions, no hypotheses, three permitted axioms, `EVIDENCE/axioms.txt` before kernel verification, statement-level `INFORMAL-PROOF.md` with the ARMW line and attributions on its face | brief §3 | **Met.** Every element recomputed above; `INFORMAL-PROOF.md` has one section per shipped declaration, in compile order. |
| R4 — no `sorry` / `admit` / `native_decide` / `axiom` | brief §3 | **Met.** Lexical scan clean; axiom report is exactly the three permitted. |
| Attribution travels on the face | synthesis; `SOLUTION-CONTRACT.md` fence 7 | **Met.** ARMW-2020 (re-proved in-run, never imported), U2 route attribution, `C-U2-F` critic attribution, T3 (v) and `C-F1-T` (D) informal derivations — all present in `INFORMAL-PROOF.md` and, in substance, in the contract's `informal_statement`. |
| Claim asserts nothing beyond what is proved | this audit | **Met.** The claim is, if anything, *weaker* than what the proof gives: `[Fintype V]` is unused (L0.6) and `u ∈ U` is unused in §3 Steps 1–2 (L2.11). |

**Observations carried forward (no defect, for the controller's record).**

* O-1. `[Fintype V]` is inert in both results; the award is true a fortiori. Removing it would
  generalize the statement, so leaving it costs nothing and preserves the byte-identical carry.
* O-2. The "sharpening" is pointwise in `ℓ`; as `∀ℓ`-statements the sharp form, U2's (b) and (a)
  are inter-derivable (recomputed). `INFORMAL-PROOF.md` states this correctly and does not
  overclaim.
* O-3. `C-F1-T` (D) and `C-U1-F`'s `rfl` statement-identity check lie outside this capsule's
  read boundary; both are carried on the synthesis's authority and neither is a dependency of
  the shipped mathematics.
* O-4. `FORMALIZER-REPORT.md` §3's column header "Carried declaration bytes … as carried" is
  mildly ambiguous: the `DRAFTS/carry-*.declaration.txt` files hold the **origin** bytes (U2's
  `theorem` keyword; `C-U2-F`'s `R26LA1.` qualifiers), which is the right choice for auditability
  and is what makes the exact-substitution check in L4.5/L4.6 possible. Wording only.
* O-5. `EVIDENCE/axioms.txt` carries two Lean linter warnings ahead of the axiom line (unused
  `[Fintype V]`; one no-op `push_cast`). Both are inert and both were preserved rather than
  edited, which is correct under the byte-identical-carry rule.

---

## Verdict

**passed**

The informal proof in `INFORMAL-PROOF.md` (`8de0f32f2364b8224f1b53b851e70af6a7bb27a660a45c1fd9657a863bbf8c0f`)
is a correct, complete, statement-level proof of exactly the claim in
`THEOREM-CONTRACT.yaml` `theorem.informal_statement`
(claim digest `58b357ecea00d87f2d564588044db9f3b1ce0625bd32810d7be3ad395336cf29`, recomputed).
Every definition, lemma, inference step, hypothesis entry, cast and equality in it was ledgered
and independently verified; every numeric and inequality claim was recomputed from scratch on a
grid of my own choosing (33,867 exhaustive instances of (a), 304,803 of (b), 84,073 step-level
injection/partition checks, plus 4,000 randomized instances to `n = 12`), with **zero**
counterexamples; the sharpness of the bound was exhibited positively (equality on every edgeless
`U`) and the removability of `|U| ≤ ℓ` was exhibited by the failure of the weaker U2 form at
71,995 points where the sharp form still holds. The definitions were checked literally against
the Lean source; the single C5-LA1 entry (`C5LA1.sum_card_filter_comm`, ENTRY 23) is
byte-identical at the declaration level to the frozen award source
`sources/r24/c5-la1/LeanProject/LeanProof/Main.lean` (`0933211d…`), and the two permitted carry
deviations are exactly and completely characterized. The terminal declaration's hypotheses
match the claim one-for-one, nothing marked NOT a dependency is a dependency, the claim asserts
nothing fenced, and the required attribution travels on the award's face.

**No defective step was found.** The findings above are observations (O-1 … O-5), none of which
narrows, weakens or contradicts the claim.

This attestation covers the **informal mathematics only**. It is not a kernel claim, not a
statement-fidelity review, and not a registration or publication decision; the fidelity review,
closeout and registration gates remain open and belong to other seats. Nothing here may be read
as a claim that `C1-LA2` is `formally_verified`.

Attestation id: `c1-la2-informal-pass-20260924`.
Reviewer id: `c1-la2-fable-informal-20260924`
(kind `independent-mathematical-proof-integrity-reviewer`).
Artifact producer id: `c1-la2-formalizer-opus-20260924`.
