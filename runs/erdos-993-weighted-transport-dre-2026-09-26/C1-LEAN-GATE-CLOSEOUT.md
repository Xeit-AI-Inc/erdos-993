# Cycle 1 Lean Gate Closeout — r30 (controller record, 2026-09-26)

Controller: Claude Fable 5.1. Two award groups funded by the admitted synthesis (Stage 6 seal `7bcc4b87…`), each run
through the governed `lean-proof-workflow` in its own single-source project (Lean v4.32.2 / Mathlib `905b958…`; shared packages
bound read-only; the definitions of record — first-interior entries 1–6, 8–13, 18 and the whole of 42 — carried BYTE-IDENTICALLY
through the registrar; the eight `E993Transport` definitions authored in-run from U2's compiled text); formalizer, independent
informal proof-integrity auditor and independent statement-fidelity reviewer three distinct Claude Opus 5.5 high seats per award
(every seat's runtime reported `claude-opus-5-5[1m]`); the controller gated each candidate (kernel receipt verified;
`expected_statement` verbatim in the source; canonical fidelity input by the workflow's projection), assigned reviewers, registered
the audits and ran `close`.

| Award | Run | Terminal declaration | Carry (first-interior entries) | Main.lean | Contract | Kernel | Informal audit | Fidelity | Close |
|---|---|---|---|---|---|---|---|---|---|
| C1-LA1 (WID) | `runs/lean-2026-09-26-c1-la1-active-tag-weight-identity` | `E993Transport.activeWeightAggregateIdentity` | 1–6, 8–13, 18, 42 | `86b59c6c…` | `539bee23…` | verified | passed (`e0da9566…`) | match (`a1098d8d…`) | **formally_verified** (VR `d1db0c76…`) |
| C1-LA2 (Hall ⇒ S ≤ 0) | `runs/lean-2026-09-26-c1-la2-weighted-hall-implies-nonpositive-aggregate` | `E993Transport.aggregate_nonpos_of_weightedHall` | 1–6, 8–13, 18, 42 | `7c279f4b…` | `c9c16b09…` | verified | passed (`c9c8c979…`) | match (`dc3444d6…`) | **formally_verified** (VR `fefa7eb7…`) |

Axioms on every declaration of both awards: exactly `[propext, Classical.choice, Quot.sound]` (per-declaration lists in each run's
`EVIDENCE/axioms-all-declarations.txt`; `C4LA1.IsGraphLeaf` depends on none); no `sorry`, `admit`, `native_decide`, `decide` or
`axiom` in any new text. Every terminal statement is byte-identical to the synthesis's `## Lean awards` text. Repair rounds: 0.

## Rulings and records

1. **Definition text divergence between the awards (R30-N-8).** The eight `E993Transport` definitions differ byte-wise between
   C1-LA1 (`open Classical in` on `favorableLeaves`/`WeightedHall` plus U2's docstrings, repair 3) and C1-LA2 (U2's original
   `open scoped Classical` wrapper without docstrings); the declaration bodies are identical and C1-LA1's `DRAFTS/defs-pp-all.log`
   records identical elaborated terms. Each award is a separate certificate whose fidelity reviewer confirmed the MEANING against
   the synthesis's frozen text (both `match`). The registry statements are meaning-level; a later award composing the two must
   carry one text and prove the equivalence on its face.
2. **The converse of C1-LA2 is false as a statement (SR-NET, SR-2; controller replay).** `P_3 ⊔ K_{6,3,3,3}` at `p = 4` has
   `S = −2` yet `WeightedHall` fails (supply 46, capacity 48, max-flow 36; the 20 sources `{v, w} ∪ 3-subsets of the 6-part`
   carry weight 40 against 30). The LA2 informal auditor's E1 ("no separating instance found in 212,142 instances; suggest
   'not asserted'") is superseded by this replayed witness; on trees and eligible rows no separating instance is known.
3. **Registrar numbering.** New declarations are run entries 14–21 and 23–36 (LA1) / 23–35 (LA2), not "46+" (the brief's number
   referred to the first-interior numbering; a fresh registrar starts at 1); the registrar forced the new definitions before the
   carried lemma 42.
4. **Seat process deviations (recorded; nothing depends on them):** both formalizers wrote an `EVIDENCE/fidelity-audit-input.json`
   despite step 8 (superseded by the controller's canonical regeneration, kept under `EVIDENCE/superseded-fidelity-input-1/`);
   the kernel verifier rewrote `EVIDENCE/axioms.txt` with its own probe (documented behaviour; LA1 kept its pre-registered copy as
   `axioms-preregistered.txt`); one LA1 read-only contract re-check ran without `PYTHONDONTWRITEBYTECODE`; both informal auditors
   are Opus 5.5 like the producers (independent by seat, not by model family — the standing schedule).
5. **Second reads (concurrent with Stage 7):** SR-NET (SR-1..4 all `confirmed_with_repairs`), SR-INV (SR-5, SR-6
   `confirmed_with_repairs`), SR-SECTOR (SR-7 `confirmed`; SR-8..10 `confirmed_with_repairs`), SR-BUDGET (SR-18 `confirmed`;
   SR-16, 17, 19, 20 `confirmed_with_repairs`), SR-REACH (pending at this writing; recorded in the cycle close). Zero rejections
   so far; repairs adopted verbatim in the registration texts (`control/register_c1_close.py`).

## Stop gate

**No decisive event.** (HALL) is neither formally verified nor refuted; the two awards certify the prerequisite identity and the
network interface (Hall condition ⇒ nonpositive aggregate), not the mechanism. The stop gate is not armed in Cycle 1
(unarmed-early rule); the synthesis ruled `continue: yes`; Cycle 2 follows with the six-route portfolio of the synthesis.
