# Cycle 2 Lean Gate Closeout — r30 (controller record, 2026-09-26)

Controller: Claude Fable 5.1. One award group funded by the admitted Cycle 2 synthesis (Stage 6 seal `76c6aa52…`), run through
the governed `lean-proof-workflow` in its own single-source project (Lean v4.32.2 / Mathlib `905b958…`; shared packages bound
read-only; the definitions of record — C1-LA1's `Main.lean` `86b59c6c…`, itself bound by C1-LA1's kernel receipt `9e733491…` —
carried BYTE-IDENTICALLY through the registrar as C1-LA1 fragments 1–21 and lemma 24); formalizer, independent informal
proof-integrity auditor and independent statement-fidelity reviewer three distinct Claude Opus 5.5 high seats (every seat's runtime
reported `claude-opus-5-5[1m]`); the controller gated the candidate (kernel receipt verified; `expected_statement` verbatim in the
source; canonical fidelity input by the workflow's projection), assigned reviewers, registered the audits and ran `close`.

| Award | Run | Terminal declaration | Carry | Main.lean | Contract | Kernel | Informal audit | Fidelity | Close |
|---|---|---|---|---|---|---|---|---|---|
| C2-LA1 (invariant positive deficient family) | `runs/lean-2026-09-26-c2-la1-aut-invariant-positive-deficient-family` | `E993Transport.exists_aut_invariant_deficient_of_not_weightedHall` | C1-LA1 entries 1–21 (definitions), 24 (`isGraphLeaf_of_mem_favorableLeaves`) | `a9cf3b81…` | `f0f50c2a…` | verified (`2313f959…`) | passed (`4739c9c7…`; receipt `a907ed9c…`) | match, 35/0/0 (`29d130fe…`) | `formally_verified` (`efd7c11a…`) |

Axioms on every declaration: exactly `[propext, Classical.choice, Quot.sound]` (77 entries: 30 definitions = 21 carried + 9 new;
carried lemma 24; 45 new lemmas; one terminal theorem); no `sorry`, `admit`, `native_decide`, `decide` or `axiom` in any new
text. The terminal statement is byte-identical to the synthesis's `## Lean awards` C2-LA1 text and to the formalizer brief §2.
Repair rounds: 0.

## Statement of record (what the certificate proves)

For every finite type `V` with decidable equality, every simple graph `G` on `V` with decidable adjacency and every `p : ℕ`, with
`F = favorableLeaves G p`: if `WeightedHall G F p` fails, then there EXISTS a family `X ⊆ indepFamily G (p+1)` such that
`famMap G γ X = X` for every automorphism `γ : G ≃g G` (`famMap` = the image of each member set under `γ`), every `B ∈ X` has
`0 < activeWeight G F B`, and `Σ_{A ∈ N(X)} activeWeight G F A < Σ_{B ∈ X} activeWeight G F B` where `N(X)` is the
`transportRel`-neighbourhood in `indepFamily G p`. Hypotheses: finiteness and decidability only — no tree, no eligibility, no
`p ≥ 1`. The certified statement is EXISTENTIAL: that the proof's witness is `X_min` (the meet of all maximizers of
`φ = supply − covered capacity`) is proof content and companion-lemma content (`canonMin_isMaximizer`, `canonMin_famMap`,
`canonMin_pos`), with no certificate of its own (fidelity reviewer's note). Companions on the face, `proved_informal` only
(R29-N-12): `weightedHall_iff_invariant`, `weightedHall_iff_phi_nonpos`, the three `*_map_aut` lemmas, `phi_supermodular`,
`filter_eq_covered`.

Key: `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY` — registers VERIFIED `formally_verified` at the
Cycle 2 close (after the second-reads packet seal, ruling 18). It is the invariant-family half of (INV)
`E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`; (INV)'s quotient clause stays `proved_informal` with no Lean text.

## Rulings and records

1. **Receipt binding (synthesis repair 1).** The controller bound the carried definitions to C1-LA1's kernel receipt in the
   brief (`RECEIPTS/kernel-verification.json` `9e733491…`, `source_sha256_before/after` = `86b59c6c…`); the formalizer, the
   auditor and the fidelity reviewer each re-verified it.
2. **Binder-text fidelity (repair 2).** The Cycle 1 U adjudication's draft wrote the invariance clause as
   `X.image (fun B => B.map γ.toEmbedding) = X`; the award's `famMap G γ X = X` is the same set (`Finset.map_eq_image`,
   `RelIso.coe_toEmbedding`), confirmed by the fidelity reviewer who read the draft.
3. **Witness (repair 3).** Positivity is proved for `X_min`; no `X_max` statement exists in the source. The informal proof's
   explanatory sentence "`X_max` would fail it" and S12's "never the positive witness" hold only when a tag-free source exists
   (`K_{1,5}` at `p = 2`: Hall fails and `X_max = X_min` is all-positive — auditor finding O1); nothing in the claim or proof
   depends on it, and S12's registration text carries the qualifier.
4. **Synthesis wording slip.** The synthesis's `## Headline verdicts` (INV) row calls "Hall ⇔ Hall on invariant families"
   `formally_verified`; its `## Lean awards` section registers that iff as a companion at `proved_informal`. The award follows
   `## Lean awards`; the scope note on (INV) says so.
5. **Carried-text deviations (disclosed; not body changes).** Carried lemma 24 registered at index 31 (the registrar orders
   definitions before lemmas); nine carried declarations `theorem`→`lemma` (rule R7); five line-break-only edits between
   `noncomputable` and `def`; `famMap`, `maxPhi`, `canonMin` and the `(⇐)` proof of `weightedHall_iff_invariant` re-derived from
   the frozen carry files rather than copied (36 of the 55 new entries are byte-identical to `sources/c2-stage7-sources/`).
   Both reviewers judged none of these mathematical.
6. **Process.** The canonical fidelity input was regenerated by the controller (`d93ad412…`; the formalizer wrote none, per step
   8); a first regeneration call raced the reviewer assignment and failed harmlessly. The fidelity reviewer ran the audit twice
   (a note-count correction; verdict, hashes and attestation unchanged; the first receipt `4cac8c89…` was overwritten by the
   tool). The auditor's E1: the contract's own attribution text is partial (it omits Codex GPT-6, C-U1-F and the model names);
   the full attribution of `INFORMAL-PROOF.md` §7 is carried into the key's certificate text at registration. Reviewer ids
   carry the assigning controller's token (`fable`) as in Cycle 1; the seats are Opus 5.5 (independent by seat).
7. **Attribution of record.** Codex GPT-6 (the transport mechanism, active-tag weight and relation, the lower-region run,
   (LIFT)); r30 Cycle 1 ((INV) as registered; C1-LA1 for the definitions); the first-interior run (Codex; entries 1–18);
   r26/r24/r25 (definition layers); r30 Cycle 2 U1 (Claude Sonnet 5; equivariance and the supermodular maximizer lattice);
   C-U1-T and C-U1-F (Claude Opus 5.5; the closing theorem, derived independently — C-U1-T's text carried, C-U1-F's the
   fallback); the U adjudicator (replay; the `X_min` ruling).
8. **Not awarded this cycle** (synthesis `## Groups not funded`): (HALL) at any scope; (INV)'s quotient clause; (NM); the
   equitable lift; the second-eigenvalue theorem; the `CBstar` theorem; Corollary G — each with its smallest unproved Lean node
   named in the synthesis; U1 of Cycle 3 inherits (INV)-quotient, (NM) and Lemma U.
