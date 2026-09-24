---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la2-formalizer-opus-20260925
critic_id: c1-la2-fable-informal-20260925
attestation_id: c1-la2-informal-pass-20260925
claim_sha256: ed12b3ed168ff08173d86c26fbae8253a4aec01ccc5b2bd4be634b906273f7cd
---

# Informal Proof Integrity Audit

**VerityOS boot.** Operating within VerityOS. Loaded `verity.md`,
`identity/startup-protocol.md` and `skills/proof-integrity-audit/skill.md`; then, inside
the run's read boundary, `control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA2.md`,
`control/C1-STAGE7-FORMALIZER-BRIEF-LA2.md`, `control/c1-stage7-capsules/C1-LA2-PACKET-MANIFEST.json`,
`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `cycles/cycle-1/stage6/SYNTHESIS.md`
(`## Lean awards`, `## Exact established results`), `cycles/cycle-1/stage5/adjudicators/U/ADJUDICATION.md`
(`## Lean readiness`), `sources/c1-stage7-sources/U3-Extension.lean`,
`sources/c1-stage7-sources/C-U1-T-CriticAdvances.lean`,
`sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean`, the run
`runs/lean-2026-09-25-c1-la2-extension-counting-core/` (`THEOREM-CONTRACT.yaml`,
`INFORMAL-PROOF.md`, `CAPSULE-VERIFICATION.json`, `FORMALIZER-REPORT.md`,
`EVIDENCE/THEOREM-CONTRACT.md`, `EVIDENCE/axioms*.txt`, `LeanProject/LeanProof/Main.lean`
and all 19 `Snippets/*.lean.fragment`), and Mathlib sources under the pinned shared project
for the meaning of each cited lemma. Subsystems: `skills/`, `identity/`, `experiments/`.
Nothing outside the read boundary was opened; `sources/external/lean-source/` was never
touched; no `find /`, no network, no install, no `lake clean`/`lake update`/`elan`, no
background job, no child agent, and no run artifact was edited.

**Model disclosure.** Independent informal proof-integrity reviewer seat, Claude Opus 5,
chartered effort **high**. This seat cannot self-inspect its runtime model identifier or
effort setting; both are stated on dispatch-record authority (the brief's header), not on
self-observation. Child delegation was forbidden and was not used.

**Recomputed `claim_sha256`.** `" ".join(s.split())` over
`THEOREM-CONTRACT.yaml` → `theorem.informal_statement` (1,466 characters; the collapse is a
no-op, the stored text already has single spaces) gives
`ed12b3ed168ff08173d86c26fbae8253a4aec01ccc5b2bd4be634b906273f7cd`, **equal** to the value
the brief states. Contract file digest `eb4dcdf58415ea2ee82868e18a54fc747e14b45a6969a05c5497a2ef36fb7c0c`
and `INFORMAL-PROOF.md` digest `a55e5b869795f0d39dd83f2c5761cfa623f49a60b9e801fe460755b4471293b1`
also reproduce the brief's declared values, as does `LeanProject/LeanProof/Main.lean`
(`24e8764fbf99bca80a12a3e5f96449e1a5ae0517846ea8808ead5d399f327b19`). The award capsule's
seal recomputes to `3cfd2f642953ba0e00ce26d1aad89dcd6f473837542014d1f640b3e05a40e4d2` (SHA-256
of the compact key-sorted JSON of the manifest minus `seal_sha256`, no trailing newline) and
all 46 members match on bytes and digest.

---

## Intended Claim

The claim is exactly the contract's `theorem.informal_statement`: two graph-general
statements about an arbitrary finite simple graph `G` on a finite vertex type `X`, with
`n = Fintype.card X`, `i_k(G) = Erdos993G1.indepCount G k`, `I_k(G) = G.indepSetFinset k`
and `e(J) = Erdos993G1.e G J = |V ∖ N[J]|`:

1. **The double count** (registered as the `lemma` `Erdos993G1.double_count`, the award's
   first face): `((k : ℤ) + 1) * Erdos993G1.indepCount G (k + 1) = ∑ J ∈ G.indepSetFinset k, (Erdos993G1.e G J : ℤ)`,
   for every `k : ℕ`.
2. **The extension lower bound** (registered as the terminal `theorem`
   `Erdos993G1.e_ge_sub`, the declaration the contract binds):
   `(Erdos993G1.e G J : ℤ) ≥ (Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ)`
   for every `k : ℕ` and every `J` with `hJ : G.IsNIndepSet k J`.

Hypotheses are exactly `[Fintype X]`, `[DecidableEq X]`, `[DecidableRel G.Adj]` and, for (2),
`hJ`. No acyclicity hypothesis, no `(★)` hypothesis, no `hyp-alpha`.

Both faces reproduce the synthesis `## Lean awards`, Decision 2, `C1-LA2` text and the
formalizer brief §2 text **character for character**, except for the one keyword change the
brief itself mandates (`theorem double_count` → `lemma double_count`; `lemma` and `theorem`
are synonyms in Lean 4 and elaborate identically). `Erdos993G1.e_ge_sub` is registered as
the unique terminal `theorem`; it is the only `theorem`-kind entry among the 19.

**Statement-of-record cross-check.** The two faces state exactly the same two facts, with the
same hypotheses, as `## Exact established results` rows 5 and 6 of the synthesis (which write
them namespace-abbreviated), and as the U adjudicator's `## Lean readiness` award
group **U-A** ("Hypotheses: `[Fintype X] [DecidableEq X] [DecidableRel G.Adj]` and, for the
second, `hJ : G.IsNIndepSet k J`; no acyclicity, no `(★)`, no `hyp-alpha`"). Three
independent renderings of the statement agree.

---

## Claim Ledger

Every definition, lemma and inference step of `INFORMAL-PROOF.md`, with where each
hypothesis enters and the evidence that closes it. `U3` = `sources/c1-stage7-sources/U3-Extension.lean`
(SHA-256 `116b4f313eedfe4210173226c2f5ef877a6e1ee07061888f4106e908ba6b08a6`);
`r25` = `sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean`
(SHA-256 `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0`).

### Definition layer

| # | `lean_name` | Source and transport | Hypotheses consumed | Verdict |
|---|---|---|---|---|
| D1 | `Erdos993G1.indepCount` | r25 entry 1, **byte-identical** (entry digest `5484fc21…4ccb` reproduces the r25 original) | none (`Nat.card` on a subtype) | verified |
| D2 | `Erdos993G1.coeff` | r25 entry 2, **byte-identical** (`21190043…1a639`) | none | verified |
| D3 | `Erdos993G1.delta` | r25 entry 3, **byte-identical** (`bdb46014…6b9ee`) | none | verified |
| D4 | `Erdos993G1.closedNbhdFinset` | U3 L20–23, body byte-identical | `[DecidableEq X]` (`∪`, `biUnion`), `[DecidableRel G.Adj]` (`neighborFinset`) | verified |
| D5 | `Erdos993G1.extensionFinset` | U3 L25–28, body byte-identical | `[Fintype X]` (`univ`), `[DecidableEq X]` (`\`) | verified |
| D6 | `Erdos993G1.e` | U3 L30–31, body byte-identical | as D5 | verified |
| D7 | `Erdos993G1.indepDegreeSum` | U3 L33–35, body byte-identical | `[Fintype X] [DecidableEq X] [DecidableRel G.Adj]` | verified; **not a dependency** |
| D8 | `Erdos993G1.firstDescent` | authored in-run (`sInf`), recorded as a re-derivation | `[Finite X]` | verified; **not a dependency** |

Byte-identity of D1–D3 (and of L1 below) was recomputed by me from the `-- VERITYOS ENTRY n
BEGIN/END` blocks of both files: name, entry digest and body all coincide. Every one of the
19 registered fragments hashes to the digest printed in its entry marker, to the digest the
contract's `source_materials` records, and to the digest the `INFORMAL-PROOF.md` §8 carry
table records; each fragment's bytes equal the corresponding block in `Main.lean`. All 29
`source_materials` digests reproduce from the files on disk, and the `SOURCES/` working
copies are byte-identical to their capsule originals.

**"Not a dependency" verified literally.** `indepDegreeSum` and `firstDescent` occur in
`Main.lean` only inside their own entries; `coeff` occurs only in `delta`, and `delta` only in
`firstDescent`. Neither award face, and no lemma on either face's path, mentions any of the
four. This matches the contract's definition-layer note and its dependency graph, which I
also checked is closed (every declared dependency is an edge; 22 nodes, 32 edges, acyclic)
and correctly omits `indepSetFinset`/`indepCount` from the terminal conclusion's cone —
`e_ge_sub`'s statement does not mention them.

### Lemma layer and inference steps

| # | Step (`INFORMAL-PROOF.md` numbering) | Declaration | Transport | Evidence | Verdict |
|---|---|---|---|---|---|
| L1 | bridge `indepCount F k = ((F.indepSetFinset k).card : ℤ)` | `Erdos993G1.indepCount_eq_card_indepSetFinset` | r25 entry 4, **byte-identical** (`4463e7ee…7aac`); admitted under R1's "further entries only if a carried body depends on them" — `double_count` does depend on it | `Nat.card_eq_fintype_card`, `Fintype.card_subtype`, `indepSetFinset` unfold; `indepSetFinset n = univ.filter (IsNIndepSet n)` confirmed in Mathlib `Clique.lean:1054` | verified |
| L2 | **(1)** `v ∈ ext(J) ↔ v ∉ J ∧ ∀ u ∈ J, ¬ G.Adj v u` | `mem_extensionFinset_iff` | U3 L43–54, byte-identical | complement of `J ∪ ⋃_{u∈J} N(u)`; `mem_neighborFinset : w ∈ G.neighborFinset v ↔ G.Adj v w`, so `v ∈ N(u) ↔ G.Adj u v`, converted by `G.adj_comm`. Recomputed independently, set for set, for every subset of every graph in my grid | verified |
| L3 | **(2)** `J ∈ I_k`, `v ∈ ext(J)` ⟹ `insert v J ∈ I_{k+1}` | `isNIndepSet_insert_of_mem_extensionFinset` | U3 L56–73, byte-identical | `Set.Pairwise.insert_of_notMem` (Mathlib `Pairwise/Basic.lean:165`) needs `∀ b ∈ s, r a b ∧ r b a`; the proof supplies `¬G.Adj v b` and `¬G.Adj b v` via `hadj.symm`. Cardinality by `card_insert_of_notMem` + `hJ.card_eq`. `IsNIndepSet` is the two-field structure `⟨isIndepSet, card_eq⟩` (Mathlib `Clique.lean:903`) | verified |
| L4 | **(3)** `J' ∈ I_{k+1}`, `u ∈ J'` ⟹ `J'.erase u ∈ I_k` and `u ∈ ext(J'.erase u)` | `isNIndepSet_erase_and_mem_extensionFinset` | U3 L75–96, byte-identical | independence by `Set.Pairwise.mono`; cardinality by `Finset.card_erase_of_mem` + `hJ'.card_eq` + `omega` (see the ℕ-subtraction finding below); extension by `notMem_erase` and pairwise non-adjacency of distinct members of `J'` | verified |
| L5 | **(4)** `\|Σ_{J∈I_k} ext(J)\| = \|Σ_{J'∈I_{k+1}} J'\|` | `sigma_card_double_count` | U3 L104–131, identical up to `theorem → lemma` | `Finset.card_bij'` (Mathlib `Card.lean:373`) with `(J,v) ↦ (insert v J, v)` and `(J',u) ↦ (J'.erase u, u)`; the four obligations are in Mathlib's own argument order (forward well-definedness, backward well-definedness, left inverse by `erase_insert`, right inverse by `insert_erase`). I rebuilt both sigma-sets and checked the maps are mutually inverse bijections **pair by pair** for every labelled graph on `n ≤ 5` and every `k` | verified |
| L6 | **(5)** `Σ_{J'∈I_{k+1}} \|J'\| = (k+1)·\|I_{k+1}\|` | `sum_card_indepSetFinset_succ` | U3 L133–139, identical up to `theorem → lemma` | `sum_congr` with `card_eq`, then `Finset.sum_const`, `smul_eq_mul`, `Nat.mul_comm` | verified |
| L7 | **(6)** `Σ_{J∈I_k} e(J) = (k+1)·\|I_{k+1}\|` in ℕ | `sum_e_eq_succ_mul_card` | U3 L141–151, identical up to `theorem → lemma` | `Finset.card_sigma` (Mathlib `BigOperators/Group/Finset/Sigma.lean:134`) on both sides of L5; `e G J = (ext J).card` by `rfl` | verified |
| L8 | **(7)** `((k:ℤ)+1)·i_{k+1} = Σ_{J∈I_k} (e(J):ℤ)` — **award face 1** | `double_count` | statement re-stated in-run from the synthesis (explicit `G`); proof body = U3 L157–165, **byte-identical** | L1 + cast of L7 into ℤ + `Nat.cast_sum` | verified |
| L9 | **(8)** `\|N[J]\| ≤ \|J\| + Σ_{v∈J} deg(v)` | `card_closedNbhdFinset_le` | U3 L173–185, identical up to `theorem → lemma` | `Finset.card_union_le` (`Card.lean:572`), `Finset.card_biUnion_le` (`BigOperators/Group/Finset/Basic.lean:970`), `SimpleGraph.card_neighborFinset_eq_degree` (`Finite.lean:203`, an `rfl`) | verified |
| L10 | **(9)** `e(J) + \|J\| + Σ_{v∈J} deg(v) ≥ n` in ℕ, subtraction-free | `e_add_card_add_degreeSum_ge` | U3 L187–197, identical up to `theorem → lemma` | `Finset.card_sdiff_add_card_eq_card` (`Card.lean:588`, the **additive** split `#(t\s) + #s = #t`, deliberately used in place of `card_sdiff`) with `N[J] ⊆ univ`, giving the exact `e(J) + \|N[J]\| = n`; then `omega` with L9 | verified |
| L11 | **(10)** `e(J) ≥ n − k − Σ_{v∈J} deg(v)` in ℤ — **award face 2, terminal** | `e_ge_sub` | statement re-stated in-run from the synthesis (explicit `G`); proof body = U3 L203–208, **byte-identical** | `hJ.card_eq` rewrites `\|J\|` to `k` in L10; `exact_mod_cast` then `push_cast` then `linarith` | verified |

### Hypothesis ledger

| Hypothesis | Enters | Used how | Verdict |
|---|---|---|---|
| `[Fintype X]` | everywhere (`Finset.univ` in `extensionFinset`, `Fintype.card X`, `indepSetFinset`, `neighborFinset`) | instance binder, never a hypothesis on `G` | verified |
| `[DecidableEq X]` | everywhere (`∪`, `\`, `insert`, `erase`, `biUnion`) | instance binder | verified |
| `[DecidableRel G.Adj]` | everywhere (`neighborFinset`, `degree`, `indepSetFinset`) | instance binder | verified |
| `hJ : G.IsNIndepSet k J` | **once**, in `e_ge_sub` | **only** through `hJ.card_eq : J.card = k` (`rw [hJ.card_eq] at hnat`); the `isIndepSet` field is never projected | verified |
| `G.IsAcyclic` | **nowhere** | no binder on either face or on any of the 17 supporting declarations | verified |

The terminal declaration's binders are `{X : Type u} [Fintype X] [DecidableEq X]
(G : SimpleGraph X) [DecidableRel G.Adj] (k : ℕ) {J : Finset X} (hJ : G.IsNIndepSet k J)` —
**one for one** with the contract's four quantifiers (`X`, `G`, `k`, `J`) and four hypotheses
(`hyp-fintype`, `hyp-decidable-eq`, `hyp-decidable-adj`, `hyp-indep-k-set`). Nothing extra,
nothing missing. The contract's `lean_binding.expected_statement` equals the namespace-relative
source text from `theorem` up to but excluding ` :=` **exactly** (I extracted it from the
registered fragment and compared byte for byte), and its recorded SHA-256
`cd7190f59b1ba5ef1e99c70604a7f1fb9247d125def309294bec703b13e2139e` recomputes.

Both faces are stated **with instance binders**, universe-polymorphic in `u`, not at one
fixed `Fintype` instance — `C-U3-F`'s caveat, which the synthesis calls load-bearing.

### ℕ-subtraction and cast audit (my own, not the producer's)

Every cast in the development is `Nat.cast : ℕ → ℤ`, an order-embedding ring hom; no
coercion truncates, and `Nat.cast_le` transports L10's ℕ inequality to ℤ in both directions.
`indepCount` is ℤ-valued by definition, so no cast is introduced on the left of the double
count. `(k : ℤ)` and `(Fintype.card X : ℤ)` are nonnegative and no step depends on their
sign, so the `2 − (G.degree v : ℤ)` clamping hazard the synthesis flags for the (DL) route
cannot arise here. The award-face subtraction is ordinary ring subtraction in ℤ.

On `(∑ v ∈ J, G.degree v : ℤ)`: whichever way it elaborates (cast-of-sum or sum-of-casts),
the two readings are equal by `Nat.cast_sum`, so the face text is unambiguous — the
producer's §6.3 conclusion is correct.

**Exactly one ℕ-subtraction exists in the development**, and the record denies that any
does. See the Independent Critic Pass, finding **F1**.

---

## Reproduced Mathematical Evidence

I wrote my own exact-integer evaluator under `scratchpad/c1-s7-informal-LA2/` from scratch
(`evaluator.py`, plus `claim_hash.py`, `entry_check.py`, `carry_check.py`). Standard library
only, explicit import lists, every quantity a Python `int`, no floating point, no wall-clock
field, and **no prior evaluator imported**. The model mirrors the Lean definitions literally:
`N[J] = J ∪ ⋃_{u∈J} N(u)`, `ext(J) = V ∖ N[J]`, `e(J) = |ext(J)|`,
`I_k = {J : |J| = k, J independent}`.

**Grid (my choice).** Every labelled simple graph on `n = 0,1,2,3,4,5` (1,100 graphs) with
the bijection of L5 checked pair by pair; every labelled simple graph on `n = 6`
(32,768 graphs); deterministic stride samples on `n = 7` (2,055 graphs, stride 1,021) and
`n = 8` (2,685 graphs, stride 100,003). Every `k` from `0` to `n+1` in each case, so the
degenerate ranks (`I_k` empty, `k > α(G)`, `k+1 > n`) are inside the grid, as is `k = 0`
(`I_0 = {∅}`, `e(∅) = n`, `1·i_1 = n`).

**Totals: 38,608 graphs, 23,034,439 exact-integer checks, 0 failures.**

Verified on that grid: L2 (membership characterisation, recomputed from first principles and
compared set-for-set); the exact split `e(J) + |N[J]| = n`; L9; L10; L11; L5's bijection
(forward and backward well-definedness, both inverse laws, and equality of the two sigma-set
multisets, pair by pair); L6; L7/L8 as the single integer identity
`Σ_{J∈I_k} e(J) = (k+1)·i_{k+1}`.

**Hypothesis sharpness, as the record states it.** `INFORMAL-PROOF.md` §3 discloses that the
proof of `e_ge_sub` uses only `J.card = k`, so the independence half of `hJ` is not
load-bearing. I confirmed both halves of that disclosure:

- **Independence is not needed.** L11's inequality holds for **every** subset `J` at
  `k := |J|`, independent or not, on the whole grid (0 failures). This is corroborated
  externally: critic `C-U1-T`'s `critic_extensionCount_ge` in
  `sources/c1-stage7-sources/C-U1-T-CriticAdvances.lean` states precisely the arbitrary-`J`
  form, "no independence and no acyclicity needed" — an independent re-derivation that
  agrees with the disclosure. The award face nevertheless keeps `hJ`, because that is the
  statement of record; keeping a sound, unneeded hypothesis weakens the statement and
  registers nothing stronger.
- **`card_eq` *is* load-bearing.** Smallest witness: `n = 1`, the empty graph, `J = {0}` so
  `|J| = 1`, taken against `k = 0`. Then `e(J) = 0` but `n − k − Σ deg = 1 − 0 − 0 = 1`, so
  `0 ≥ 1` is **false**. Decoupling `|J|` from `k` breaks the bound; `hJ.card_eq` is exactly
  what prevents it.
- **Independence *is* load-bearing for the double count.** Smallest witness: `n = 2`,
  `G = K₂`, `k = 1`. Over independent 1-sets the identity reads `0 = 0`; replacing `I_k` by
  all 1-subsets gives `Σ e(J) = 0` against `(k+1)·#{all 2-subsets} = 2`. The restriction to
  `I_k` is not decorative.

**Tightness and non-triviality.**

- The bound is **attained**: `n = 3` with the single edge `{0,1}` and `2` isolated,
  `J = {0}`: `e(J) = |V ∖ {0,1}| = 1` and `n − k − Σ deg = 3 − 1 − 1 = 1`. Equality, so the
  bound is not slack by construction.
- It is **strict** elsewhere: `n = 3`, the star `1–0–2`, `J = {1,2}` (independent, `k = 2`):
  `e(J) = |V ∖ {0,1,2}| = 0` against `3 − 2 − 2 = −1`.
- The right-hand side is **genuinely negative** on part of the grid — at `n = 2`, `G = K₂`,
  `J = {0,1}` it is `2 − 2 − 2 = −2` — so the ℤ face and any ℕ-truncated rendering are
  **different statements** there (`max(0, −2) = 0 ≠ −2`), not notational variants. Stating
  the face in ℤ is therefore a fidelity requirement, not a cosmetic one: the ℕ rendering
  would register a different (in fact strictly stronger) claim than the synthesis awards.
  Keeping L10 subtraction-free in ℕ and moving to ℤ only at L11 is exactly
  `SEMANTIC-CONTRACT.md` §4's convention ("stated subtraction-free or in ℤ"), and the
  producer follows it.

**Graph-generality, recomputed.** The grid contains graphs with cycles at every order
(`K₄`, `C₄`, all triangle-containing graphs on `n ≤ 6`). Both faces hold on all of them. The
first triangle-containing graph in the enumeration satisfies every claim at every `k`; `C₄`
(not a forest) and `P₄` (a forest) both satisfy the double count at every `k`
(`C₄`: `i_k = 1,4,2,0,0` with `Σe = 4,4,0,0,0 = (k+1)i_{k+1}`). Nothing in the development
needs acyclicity, which is the positive form of the "no `IsAcyclic` binder" fence.

**The identity the producer declined.** `INFORMAL-PROOF.md` §1.5 records that the optional
`C-T3-U` identity `e(J) = n − k − Σ deg + exc(J)` (STATED) was **not** compiled. I checked it
anyway, to confirm the decline is a scope choice and not the concealment of an error: with
`exc(J) := Σ_u max(codeg(u,J) − 1, 0)` as `## Exact established results` row 7 defines it,
the identity holds on 13,225 independent-set instances across all graphs on `n ≤ 5` with
0 mismatches, and `exc(J)` agrees there with `|J| + Σ deg − |N[J]| ≥ 0`. The decline is
clean.

**Axiom and forbidden-token scan** (mathematics only; the kernel is not my key).
`Main.lean` contains no `sorry`, `admit`, `native_decide`, `axiom` declaration, or `decide`.
`EVIDENCE/axioms.txt` records `[propext, Classical.choice, Quot.sound]` for
`Erdos993G1.e_ge_sub`; `EVIDENCE/axioms-all-declarations.txt` records the same three for all
19 declarations, including `double_count`. Exactly the three permitted axioms.

---

## Independent Critic Pass

I ran a separate adversarial pass over the ledger above before closing, attacking each
"verified" rather than confirming it. Six items survived scrutiny as **non-defects** (N1–N6);
one is recorded as a **defect in the record** (F1) that does not touch the mathematics.

### F1 (defect in the record, not in the proof) — a false universal in the ℕ/ℤ cast audit

`INFORMAL-PROOF.md` §6, item 1 asserts, in bold:

> **No natural-number subtraction is ever performed.**

and `THEOREM-CONTRACT.yaml` → `conclusion.statement` (rendered identically in
`EVIDENCE/THEOREM-CONTRACT.md:45`) asserts:

> Stated in `ℤ`; no natural-number subtraction occurs at any point of the development.

**Both are false as written.** One ℕ-subtraction occurs, at
`LeanProject/LeanProof/Main.lean:183`, inside registered entry 12
(`isNIndepSet_erase_and_mem_extensionFinset`, carried byte-identically from U3 L75–96):

```lean
have hcard : (J'.erase u).card = k := by
  have heq := Finset.card_erase_of_mem hu   -- #(s.erase a) = #s - 1  in ℕ
  rw [hJ'.card_eq] at heq                   -- #(J'.erase u) = (k + 1) - 1
  omega
```

`Finset.card_erase_of_mem` is `#(s.erase a) = #s - 1` in ℕ (Mathlib `Data/Finset/Card.lean:152`)
— truncated subtraction.

**Why it does not defeat the claim.** The subtraction is instantiated at `#J' = k + 1`, so
the operand is `(k + 1) - 1` with `k + 1 ≥ 1`: the truncation branch is unreachable and the
value is exactly `k`. `omega` is a decision procedure for linear ℕ/ℤ arithmetic that models
truncated subtraction faithfully — it does not assume `a - b + b = a` — so the step is sound
whether or not truncation could bite. I also verified the step's content exhaustively: for
every labelled graph on `n ≤ 5`, every `k`, every `J' ∈ I_{k+1}` and every `u ∈ J'`,
`J'.erase u ∈ I_k` and `u ∈ ext(J'.erase u)` (this is claim-ledger item L4, 0 failures).
No inference in the proof of either face depends on the §6.1 sentence.

**Why it is still a defect in the record.** The sentence lives inside the ℕ/ℤ cast audit that
condition R5 mandates, whose whole purpose is to certify this very property, and the same
overstatement travels on the award's face through the contract's `conclusion.statement` —
the registered scope text. The convention it cites,
`SEMANTIC-CONTRACT.md` §4, says only that the *statements* are "stated subtraction-free or in
ℤ"; it does not license a claim about every point of the development. The accurate claim,
which is what the evidence supports, is: *no ℕ-subtraction occurs in any statement, and the
only ℕ-subtraction in the development, `Finset.card_erase_of_mem` at `Main.lean:183`, is
truncation-free at `#J' = k + 1` and is discharged by `omega`.*

**Disposition.** Recorded as a **mandatory pre-registration correction** to
`INFORMAL-PROOF.md` §6 item 1 and to `THEOREM-CONTRACT.yaml` `conclusion.statement`. It is a
statement-accuracy finding, not a defective proof step; I do not repair it myself and I do not
soften it. The claim of record — `theorem.informal_statement`, the text I hashed — makes no
ℕ-subtraction assertion at all and is unaffected.

### Non-defects, recorded so they are not re-litigated

**N1. "Acyclicity enters exactly zero times" vs. brief condition R5.** R5 says "acyclicity
enters exactly once, through (DL)". For `C1-LA2` there is no (DL) node, and the **same
brief's §2** — the governing text, quoting the synthesis — mandates **no `IsAcyclic` binder**.
Satisfying R5's phrasing literally would contradict §2. `INFORMAL-PROOF.md` §3 resolves the
conflict in favour of §2 and discloses the resolution explicitly. Correct; R5's phrasing is a
run-wide template reused across the LA1/LA2/LA3 briefs.

**N2. `theorem → lemma` on five carried bodies and on face 1.** The brief mandates `lemma`
for `double_count` and a single terminal `theorem`; the registrar orders
`definition < lemma < theorem` and matches the Lean keyword against the registered kind. I
confirmed mechanically that entries 13, 14, 15, 17, 18 differ from their U3 originals **only**
by this keyword, and that entries 10, 11, 12 are byte-identical (U3 already wrote them as
`lemma`). `INFORMAL-PROOF.md` §9.1 records the change as a declaration-level re-derivation
rather than claiming a byte-identical carry. Honest and correct.

**N3. Faces 1 and 2 re-stated with explicit binders.** U3 stated both through section
`variable`s with `G` implicit; the statements of record have `G` explicit. The faces are
written out so the source text is exactly the synthesis's, and the **proof bodies** are
byte-identical to U3 L157–165 and L203–208 — which I verified line for line. §8 rows 16 and
19 and §9.3 record this accurately.

**N4. `firstDescent` authored in-run as `sInf` rather than `Nat.find`.**
`SEMANTIC-CONTRACT.md` §1 names the `Nat.find` form. U3's form is `Nat.find` applied to the
existence lemma `exists_delta_neg`, which would force a `lemma` entry before a `definition`
entry — the registrar forbids that ordering. The producer writes `sInf {k | Δ_k < 0}` and
discloses (§2) that on ℕ this **is** `Nat.find` applied to a nonemptiness proof by
`Nat.sInf_def`, with `sInf ∅ = 0` in the empty case, which never arises for a finite graph
(`Δ_α = −i_α < 0`) and about which the award proves nothing. I checked Mathlib at the pin:
`Nat.sInf_def (h : s.Nonempty) : sInf s = Nat.find h` and `Nat.sInf_empty : sInf ∅ = 0`
(`Order/Lattice/Nat.lean:37,65`). The disclosure is exact. `firstDescent` is a dependency of
nothing and nothing is claimed about it, so it is inert to both faces.

**N5. §6.3's characterisation of `(∑ v ∈ J, G.degree v : ℤ)`.** The producer calls it "the
cast of the ℕ-valued sum" and says `push_cast` rewrites it to the sum of casts; elaboration
at expected type ℤ arguably produces the sum-of-casts directly. The two readings are equal by
`Nat.cast_sum` — which the producer states — so the operative conclusion ("the face text is
unambiguous") is correct. Prose looseness at worst; no mathematical content is affected.

**N6. Kernel binding covers one face.** The kernel receipt names `Erdos993G1.e_ge_sub`; the
award has two faces. `EVIDENCE/axioms-all-declarations.txt` covers all 19 declarations
including `double_count`, and the whole file builds as one source. `INFORMAL-PROOF.md` makes
**no** verification claim at all ("It is not an independent proof-integrity audit and it
makes no verification claim") and `FORMALIZER-REPORT.md` §8 and §10 state that nothing is
graded `formally_verified`. Nothing is over-claimed. Flagged for the controller only as a
coverage note for the fidelity gate, not as a defect here.

### Attacks that found nothing

- Re-derived the double count from scratch at `k = 0` (`I_0 = {∅}`, `e(∅) = n` because
  `N[∅] = ∅`, and `1·i_1 = n`) and at `k > α(G)` (both sides `0`): correct in both
  degenerate regimes.
- Checked the dependency graph for a missing edge: every `dependencies` list in the contract
  appears as an edge; the graph is acyclic; the conclusion's cone contains exactly
  `def-extension-count`, `def-fintype-card`, `def-degree` and the four hypotheses, which is
  right for `e_ge_sub` (`indepSetFinset` and `indepCount` are genuinely absent from its
  statement).
- Checked every Mathlib lemma the informal proof names against its source at the pin
  (`card_bij'`, `card_sigma`, `card_sdiff_add_card_eq_card`, `card_union_le`,
  `card_biUnion_le`, `card_neighborFinset_eq_degree`, `erase_insert`, `insert_erase`,
  `card_erase_of_mem`, `Pairwise.insert_of_notMem`, `isIndepSet_iff`, `IsNIndepSet`,
  `indepSetFinset`, `mem_indepSetFinset_iff`, `Nat.sInf_def`). Every hypothesis and
  conclusion matches the use. No citation mismatch.
- Looked for a hypothesis smuggled in through a `variable` line rather than a binder: the
  two faces carry their binders explicitly and consume no section `variable`; the supporting
  lemmas' `variable` lines are exactly the three instance binders plus `{G : SimpleGraph X}`.
- Looked for an `(★)` binder anywhere: `(★)` occurs in the corpus only as the synthesis's
  **label** for the double count (`## Exact established results` row 5) and inside the fence
  "no `(★)` hypothesis". No declaration takes such a hypothesis.

---

## Scope and Fence Check

Every excluded conclusion of the synthesis dispatch and of formalizer brief §2 is reproduced
on the award's face, and I confirmed the claim asserts none of them.

| Fence | Where honoured | Verdict |
|---|---|---|
| Graph-general; **not** forest statements | `INFORMAL-PROOF.md` §1.1; contract `informal_statement` and `conclusion`; docstrings on entries 16 and 19 | honoured — and positively verified: both faces hold on cyclic graphs throughout my grid |
| Transfers **no** status to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, the all-rank aggregate, `E993-BETA-AGG`, Erdős #993 | §1.1; contract `conclusion` | honoured (`SOLUTION-CONTRACT.md` §3.1) |
| **Not** evidence for (DL) or (EX) beyond "the bridge is built" | §1.2; contract `informal_statement` | honoured — no (DL) node exists in the development; `indepDegreeSum` is defined and used by nothing |
| Nothing asymptotic, no `N₀`, no unimodality, no Tier 1 of r25 | §1.3 | honoured (`SOLUTION-CONTRACT.md` §3.2) |
| No pointwise degree statement registered | §1.4 | honoured (`SOLUTION-CONTRACT.md` §3.3) |
| No external Lean text, ever (Gate ruling 3) | §7; `FORMALIZER-REPORT.md` §4 | honoured — every registered body traces to r25 entries 1–4, to U3 L20–208, or to in-run authorship; the three renames (`indepFinsets`/`mem_indepFinsets`/`degOn`) have no application because synthesis carry-list row 8 (U2) is not carried, and none of the external carrier's vocabulary occurs |
| No `IsAcyclic`, no `(★)`, no `hyp-alpha`, no `α(G)` side condition | §3; contract `hyp-indep-k-set`; both faces | honoured on the face and in every supporting declaration |
| The optional `C-T3-U` identity is STATED and owes its own second read | §1.5; `FORMALIZER-REPORT.md` §6 | honoured — declined, not compiled, not registered |
| Attribution travels on every face | §7; contract `informal_statement`; docstrings on entries 16 and 19; `FORMALIZER-REPORT.md` §10 | honoured |

**Attribution, checked against its sources.** The face carries: FLNYZ 2026,
arXiv:2609.20961v1, §8 (Lemma 8.1 / (8.1) and the displayed step of Proposition 8.2) for the
mathematics, with the double count noted as classical ("the extension method"); seat **U3**
for the compiled derivation; critic **`C-U1-T`** for the independent re-derivation; the **U
adjudicator** for the replay; the r25 award `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` for
the G1 definitions of record. I verified each: the U adjudication's `## Lean readiness` award
group U-A says "replayed by me and by three critics"; `C-U1-T-CriticAdvances.lean` does
contain `critic_double_count`, `critic_extensionCount_ge` and `critic_extensionCount_ge_int`
at the same content on U1's `extensionCount` text; synthesis `## Exact established results`
rows 5 and 6 attribute exactly this way.

**Carry attribution.** Formalizer-brief R2's clause "rows 10–16 are critic-attributed, rows
17–19 adjudicator-attributed" indexes the **synthesis carry list** (its condition (iii)), not
this run's carry table. This award carries only synthesis carry-list row 5 (the frozen r25
source) and row 9 (U3), so it carries **no** critic-attributed and **no**
adjudicator-attributed body; `C-U1-T` (row 10) is cited as the re-derivation and is not
carried. `INFORMAL-PROOF.md` §8 states exactly this, and I confirmed it declaration by
declaration. The rule is satisfied vacuously and correctly labelled.

**Nothing graded.** `INFORMAL-PROOF.md` contains no occurrence of `formally_verified` and
disclaims any verification claim; `FORMALIZER-REPORT.md` §10 leaves reviewer assignment,
this audit, the fidelity review, `close` and registration to the controller. No gate was
pre-empted.

---

## Verdict

**passed.**

`INFORMAL-PROOF.md` is a correct, statement-level proof of exactly the claim recorded at
`THEOREM-CONTRACT.yaml` → `theorem.informal_statement` (`claim_sha256`
`ed12b3ed168ff08173d86c26fbae8253a4aec01ccc5b2bd4be634b906273f7cd`, recomputed and matching).
Every definition matches the Lean source literally; the three G1 definitions of record and
the r25 bridge lemma are byte-identical to r25 entries 1–4 with their entry digests
reproduced; every carried body's claimed origin and line range in U3 checks out to the byte;
the terminal declaration's hypotheses match the claim one for one with no acyclicity binder;
nothing marked "not a dependency" is a dependency; the claim asserts nothing fenced; the
attribution the synthesis requires travels on the face; and 23,034,439 exact-integer checks
over 38,608 labelled graphs, including pair-by-pair verification of the bijection, found
zero failures. **No proof step is defective.**

One defect is recorded against the **record**, not against the proof, and must be corrected
before registration:

> **F1.** `INFORMAL-PROOF.md` §6 item 1 ("**No natural-number subtraction is ever
> performed.**") and `THEOREM-CONTRACT.yaml` `conclusion.statement` ("no natural-number
> subtraction occurs at any point of the development") are **false as written**. One
> ℕ-subtraction occurs, at `LeanProject/LeanProof/Main.lean:183`, through Mathlib's
> `Finset.card_erase_of_mem` (`#(s.erase a) = #s - 1`) inside registered entry 12. It is
> truncation-free — the operand is `(k + 1) - 1` with `k + 1 ≥ 1` — and it is discharged by
> `omega`, which models ℕ truncated subtraction faithfully, so no conclusion is affected and
> the operative convention of `SEMANTIC-CONTRACT.md` §4 (statements subtraction-free or in ℤ)
> is fully met. The correction is to the coverage sentence only; the mathematics, the Lean
> source and the claim of record need no change, and I have made no repair.

Non-defects N1–N6 above are recorded so a later reviewer need not re-litigate them; N6 (the
kernel binding names only the terminal declaration, while the award has two faces) is passed
to the controller as a coverage note for the statement-fidelity gate, which is not this
seat's key.
