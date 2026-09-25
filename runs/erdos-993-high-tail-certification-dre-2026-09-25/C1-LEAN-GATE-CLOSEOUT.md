# Cycle 1 Lean Gate Closeout — r29 (controller record, 2026-09-25)

Controller: Claude Fable 5.1. Four award groups funded by the admitted synthesis (Stage 6 seal `8338f465…`), each run
through the governed `lean-proof-workflow` in its own single-source project (Lean v4.32.2 / Mathlib `905b958…`; shared
packages bound read-only; every definition of record a byte-identical registrar carry of the first-interior award source
`8d864da2…`); formalizer, independent informal proof-integrity auditor and independent statement-fidelity reviewer three
distinct Claude Opus 5.5 high seats per award (every seat's runtime reported `claude-opus-5-5[1m]`); the controller
gated each candidate (kernel receipt verified; `expected_statement` verbatim in the source; canonical fidelity input by
the workflow's projection), assigned reviewers, registered the audits and ran `close`.

| Award | Run | Terminal declaration | Carry (original entries) | Main.lean | Contract | Kernel | Informal audit | Fidelity | Close |
|---|---|---|---|---|---|---|---|---|---|
| C1-LA1 (TSB) | `runs/lean-2026-09-25-c1-la1-tagged-shadow-bound` | `E993HighTail.bipartiteTaggedShadowBound` | 18, 41 | `efafb79b…` | `32aa0f3b…` | verified | passed (`44152af5…`) | match (`1a414f28…`) | **formally_verified** (VR `b21597ab…`) |
| C1-LA2 (HTP + HTA companion) | `runs/lean-2026-09-25-c1-la2-leaf-high-tail-pointwise` | `E993HighTail.bipartiteLeafHighTailPointwise` | 1–14, 18, 41, 42 | `d968eb56…` | `7ef3f53a…` | verified | passed (`80cc6d13…`) | match (`73d954f6…`) | **formally_verified** (VR `47910b50…`) |
| C1-LA3 (ELIG) | `runs/lean-2026-09-25-c1-la3-interior-eligibility-guard` | `E993HighTail.interiorEligibilityAlphaGeSeven` | 1–17, 19–40, 43 | `8d500fd7…` | `99379e6d…` | verified | passed (`56ad123d…`) | match (`ea22ed06…`) | **formally_verified** (VR `2f5cee60…`) |
| C1-LA4 (TRN) | `runs/lean-2026-09-25-c1-la4-top-rank-nonresidual-aggregate` | `E993HighTail.topRankNonResidualAggregate` | 1–14, 18, 41, 42, 44 | `0c803739…` | `beb1d60b…` | verified | passed (`5d46cbf6…`) | match (`ff29bb30…`) | **formally_verified** (VR `f7504a69…`) |

Axioms on every award: exactly `[propext, Classical.choice, Quot.sound]` (per-declaration lists in each run's
`EVIDENCE/axioms-all-declarations.txt`); no `sorry`, `admit`, `native_decide`, `decide` or `axiom` in any new text. Every
terminal statement is byte-identical to `SOLUTION-CONTRACT.md` §2 and the synthesis's `## Lean awards`. Repair rounds: 0.

## Rulings and records

1. **(HTA) companion certificate (R29-N-12).** The synthesis allowed `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` to be
   registered `formally_verified` on C1-LA2's receipt iff (i) the contract carries the companion's exact text and digest,
   (ii) the fidelity review matches it, (iii) the receipt's `#print axioms` covers it. (ii) holds (the reviewer matched
   the companion `lemma bipartiteHighTailAggregateAllRanks` byte-identically to §2); (i) holds only by workaround (the
   contract validator rejects extra keys; the text travels inside `informal_statement` and as digest-bound `SOURCE/`
   files); (iii) is NOT literally met — the kernel receipt binds the terminal theorem only, and the companion's axiom
   line lives in `EVIDENCE/axioms-all-declarations.txt`, unbound. Fail-closed: (HTA) registers VERIFIED at
   `proved_informal` ("kernel-checked companion inside C1-LA2, not a separate certificate"); its standalone award — same
   carry, body ready — passes to a successor. The stop gate is unaffected.
2. **Byte- vs token-identity (R29-E-e).** The first-interior source's entries 15–17 are token-identical, not
   byte-identical, to the r25 award (whitespace only). The r29 awards carry the FIRST-INTERIOR bytes; registration and
   publication texts say so.
3. **`hk : 1 ≤ k` in C1-LA1** is statement scope (entry 41's body does not use it; recorded on every face); `hka` is
   what `Nat.cast_sub` needs. The all-`k` form is a scope note after SR-3, not a change to the registry statement.
4. **Seat process deviations (recorded, nothing depends on them):** transient registrar-output files under `/tmp`
   written and deleted by the LA2, LA3 and LA4 formalizers (the registrar prints to stdout; the seats redirected once);
   the kernel verifier rewrites `EVIDENCE/axioms.txt` with its own probe (documented behaviour; identical axiom line;
   never edited after the receipt); `run_workflow.py init` has no run-id option, so the workflow files carry the
   directory name and the canonical run id lives in the contract, `CAPSULE-VERIFICATION.json` and the report; the
   contract validator accepts only two `source_materials` roles and refuses out-of-root paths (frozen sources were
   copied byte-identically into `SOURCE/`).
5. **Second reads (concurrent with Stage 7):** SR-MECH (SR-1..4 confirmed, SR-9 confirmed_with_repairs), SR-TRN (SR-5
   confirmed, SR-6/7 confirmed_with_repairs), SR-BOUNDARY (SR-8a/8c confirmed, SR-8b confirmed_with_repairs) — nine
   items, zero rejections; repairs adopted in the registration texts (`control/register_c1_close.py`).

## Stop gate

**Stop-gate event (a) MET at the Cycle 1 Stage 7 close: all four targets are `formally_verified` at their SOLUTION-CONTRACT §2 statements (C1-LA1, C1-LA2, C1-LA3, C1-LA4; zero repair rounds; every reviewer pair passed/match). The run ENDS after ONE cycle (`AUTHORIZATION.md` "Cycles and stop rule"); the Cycle 2 portfolio is moot. (HTA) registers at `proved_informal` by ruling R29-N-12 — it is not one of the four targets and does not bear on the gate.**
