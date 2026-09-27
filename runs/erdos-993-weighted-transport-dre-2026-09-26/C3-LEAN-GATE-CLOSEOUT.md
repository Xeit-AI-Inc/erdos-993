# Cycle 3 Lean Gate Closeout — r30 (controller record, 2026-09-27)

Controller: Claude Fable 5.1. One award group funded by the admitted Cycle 3 synthesis (Stage 6 seal `114b4ab4…`), run through
the governed `lean-proof-workflow` in its own single-source project (Lean v4.32.2 / Mathlib `905b958…`; shared packages bound
read-only; the definitions of record — C1-LA1's `Main.lean` `86b59c6c…` (kernel receipt `9e733491…`) and C2-LA1's `Main.lean`
`a9cf3b81…` (kernel receipt `2313f959…`) — carried BYTE-IDENTICALLY through the registrar as 76 fragments); formalizer,
independent informal proof-integrity auditor and independent statement-fidelity reviewer three distinct Claude Opus 5.5 high seats
(every seat's runtime reported `claude-opus-5-5[1m]`); the controller gated the candidate (kernel receipt verified;
`expected_statement` verbatim in the source; canonical fidelity input by the workflow's projection), assigned reviewers,
registered the audits and ran `close`.

| Award | Run | Terminal declaration | Carry | Main.lean | Contract | Kernel | Informal audit | Fidelity | Close |
|---|---|---|---|---|---|---|---|---|---|
| C3-LA1 (weighted Hall ⇔ full-Aut orbit-quotient Hall at the fixed selector) | `runs/lean-2026-09-27-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall` | `E993Transport.weightedHall_iff_autOrbitQuotientHall` | C1-LA1 entries 1–21 + lemma 24; C2-LA1's supermodularity / canonMin apparatus and `weightedHall_iff_invariant` (76 fragments) | `22e3f81c…` | `6dd62fb3…` | verified (`9c7d8434…`) | passed (`ffc27197…`; receipt `23a37b29…`) | match, 32/0/0 (`0fddd522…`) | `formally_verified` (`ffa04977…`) |

Axioms on every declaration: exactly `[propext, Classical.choice, Quot.sound]` (89 entries: 31 definitions = 30 carried + `orbitOf`;
57 lemmas = 46 carried + U1's four + C-U1-T's seven; one terminal theorem); no `sorry`, `admit`, `native_decide`, `decide` or
`axiom` in any new text. The terminal statement is character-identical to C-U1-T's `crit_weightedHall_iff_orbitQuotientHall`
(frozen `sources/c3-stage7-sources/C-U1-T-CritAdv.lean` `8de15f02…`, lines 77–139) with the name changed and nothing else, and to
the synthesis's `## Lean awards` C3-LA1 text and the formalizer brief §2. Repair rounds: 0.

## Statement of record (what the certificate proves)

For every finite type `V` with decidable equality, every simple graph `G` on `V` with decidable adjacency and every `p : ℕ`, with
`F = favorableLeaves G p` (the fixed selector) and `Γ = G ≃g G` (all of `Aut(G)`): `WeightedHall G F p` holds iff for every set
`𝒮` of source orbits (orbits of `Aut(G)` on `indepFamily G (p+1)`), the sum of the orbit totals of `𝒮` is at most the sum of the
orbit totals of the target orbits joined to `𝒮` — an orbit arc `O → O'` existing iff some `B ∈ O`, `A ∈ O'` satisfy
`transportRel G B A`. Hypotheses: finiteness and decidability only — no tree, no eligibility, no `p ≥ 1`. It is an EQUIVALENCE OF
HALL CONDITIONS: no quotient's feasibility, no flow, no cut, nothing about orbit-space sizes, nothing for a proper subgroup of
`Aut(G)`, another tag set or another weight; (HALL) at any scope is not asserted; (LIFT) and its feasibility are not asserted;
C2-LA1's terminal content is not re-certified. Companions on the face, `proved_informal` only (R29-N-12): U1's four orbit lemmas
(`orbitOf_mem_iff`, `invariant_iff_orbitOf_subset`, `crit_orbitOf_eq_of_mem`, `covered_orbitUnion`), C-U1-T's partition and
class-union lemmas, and the (a)⇔(b) invariant-family clause carried from C2-LA1's face.

Key: `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` — registers VERIFIED `formally_verified` at the
Cycle 3 close (after the second-reads packet seal `68d0f899…`, ruling 26). SR-C3-1 ruled the registered (INV) key
`E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` WIDER than this statement (any finite group Γ or subgroup preserving F; any
degree-one tag set; arbitrary weights; clause (b); parts (i)/(iii); the flow form), so (INV) is NOT upgraded: it receives a scope
note and four distinction rows (vs (INV), the equitable-partition lift, (LIFT), C2-LA1). The certified statement is (INV)'s
(ii)(a)⇔(c) clause at `Γ = Aut(G)`, `F = F_p(G)`.

## Rulings and records

1. **Receipt bindings (brief §1).** Both origin awards' `Main.lean` digests are bound by their kernel receipts; the formalizer,
   the auditor and the fidelity reviewer each re-verified both bindings and both `formally_verified` reports.
2. **Registration order (disclosed deviation).** The registrar refuses a definition after a lemma; the formalizer used C2-LA1's
   layout with `orbitOf` after the last carried definition. ACCEPTED as the C2-LA1 R7 precedent: no fragment bytes changed
   (`CAPSULE-VERIFICATION.json` 76/76; the fidelity reviewer compared all 76, not a sample).
3. **The two formalizations.** C-U1-T's inline form (carried) and C-U1-F's named form state the same proposition; the U
   adjudicator's `adj_two_quotient_forms_agree` is a kernel-checked iff, not `rfl` (SR-C3-1: `Iff.rfl` passed the elaborator and
   timed out in the kernel). Nothing from C-U1-F's files is part of the certified artifact.
4. **"Exactly" (brief §2.1).** The equality "covered set of an invariant family = union of the joined target orbits" is never a
   lemma; each direction of the terminal proof uses one inclusion (⇒ trivial; ⇐ from `covered_orbitUnion` +
   `invariant_iff_orbitOf_subset` at rank `p`), both with nonnegative weights (auditor; SR-C3-1 kernel-checked the equality
   separately in scratch). `orbitOf` needs no `Fintype (G ≃g G)`. No ℕ subtraction in the statement or proof (the only one in
   `Main.lean` is `p − 1` inside the carried, unreferenced `C5LA1.aggregate`).
5. **Non-vacuity.** `P_3 ⊔ K_{6,3,3,3}` at `p = 4`: `WeightedHall` fails on both sides (`|Aut| = 1,866,240`; one 20-source orbit
   supplies 40 against 30); holds at `p = 5, 6`. Auditor's evaluator: 66 named graphs (incl. all 12 double brooms of order 11 at
   `p = 6`), every graph on `n ≤ 6` (603), 150 random on `n = 7, 8` (645): 0 disagreements between the two sides; fidelity
   reviewer's brute force: 447 graphs, 67 failures, 0 disagreements.
6. **Reviewer-brief slips (fidelity notes; not artifact defects).** `famMap` is proof-only, not in the statement;
   `covered_orbitUnion` is U1's lemma, not C-U1-T's; the generated `EVIDENCE/THEOREM-CONTRACT.md` view omits `lean_name`s (the
   YAML governs). The auditor's brief left "double broom" undefined; the auditor covered every shape.
7. **Formalizer disclosures.** Read the registrar, contract validator and Main.lean template (tooling outside its listed
   boundary); two scratch files outside the run root deleted; one no-effect heredoc slip; a count in `INFORMAL-PROOF.md`
   corrected after kernel verification with the contract re-validated (neither file is receipt-bound — the receipt binds only
   `Main.lean`). Both reviewers judged none mathematical.
8. **Reviewer disclosures.** Both reviewers saw directory names and synthesis rows outside their read lists (transcribed in
   `control/C3-STAGE7-AGENTS.json`); both state none entered the verdict. The auditor read `INFORMAL-PROOF.md` from a
   harness-saved verbatim copy (the harness's write). Reviewer ids carry the assigning controller's token (`fable`) as in
   Cycles 1–2; the seats are Opus 5.5 (independent by seat).
9. **Attribution of record.** Definitions of record: C1-LA1 (entries 1–13 from the first-interior award, Codex; 14–21 the
   `E993Transport` layer, r30 Cycle 1) and C2-LA1 (the supermodularity / canonMin apparatus; the invariant-family statement
   critic-derived by C-U1-T in Cycle 2). r30 Cycle 3: U1 (Claude Sonnet 5) for the orbit block; C-U1-T (Claude Opus 5.5) for the
   partition, the class-union identity and the terminal theorem; C-U1-F (Claude Opus 5.5) for the independent equivalent
   formalization; the U adjudicator (Claude Opus 5.5) for the kernel equivalence check; Codex (GPT-6) for the transport
   mechanism, the lower-region run and (LIFT)'s orbit-quotient conventions; r29 for the high tail (not used by this proof).
10. **Not awarded this cycle** (synthesis `## Groups not funded`): (HALL) at any scope; (INV)'s parts (i)/(iii), arbitrary Γ/F
    and the flow form; (NM)'s poset half (compiled in scratch, no grade); Lemma U (= P10 by negation, SR-C3-7; `compiled`, no
    key); GK-SIGN; the E1 criterion; the D1–D3 rows; the equitable lift — each with its smallest unproved Lean node named in the
    synthesis; Cycle 4's U1 inherits GK-SIGN and the (NM) encoding.
