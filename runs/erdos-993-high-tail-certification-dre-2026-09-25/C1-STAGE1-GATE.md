# Cycle 1 Stage 1 Gate — r29 (controller record, 2026-09-25)

Controller: Claude Fable 5.1. Rulings are numbered and binding on every seat of Cycle 1.

## Current-state check

- Master registry 407 identities (245 V / 92 R / 26 C / 44 O) after Codex's follow-ups publication (order-24 census and
  the fresh r27 review); public `main` `713f0df`, working tree clean. The charter's reference state matches the live
  state; nothing newer was found.
- The three auxiliary keys are OPEN with `formal_award: false` and the certificate "OPEN proposal only" (Codex C2 scope
  audit); `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` VERIFIED `formally_verified`; `E993-R26-TOP-RANK-RESIDUAL-SIGN`
  VERIFIED; `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` OPEN; `E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT`,
  `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` REFUTED (distinct statements; the C2 scope audit's distinctions are carried).
- No registered key states (TRN) or (HTA); the nearest are r26's residual top-rank award (a sub-case by hypotheses) and
  the OPEN all-rank key (a super-statement by ranks). The universal-claim counterexample gate (controller, Stage 1):
  the claim-identity file, the exact-witness registry (the `E993-BETA-TARGET` refutation witnesses) and the pre-run
  instrument were searched for a counterexample to (TSB), (HTP), (HTA), (ELIG), (TRN): none found; every registered
  refutation of a pointwise sign lives in the unrestricted window (`3p < 2α + 1` or the governed model), consistent with
  the guarded statements. Recorded in `control/CONTROLLER-NOTES.json` (R29-N-2).
- The controller's pre-run instrument finds no failure on bipartite graphs to order 6 (every `W`, every `k`) or trees to
  order 12 (`control/controller-prerun/`); positive terms at `3p = 2α` exist from order 5 (a prior about the boundary).

## Rulings

1. **Targets frozen.** (TSB), (HTP), (HTA), (ELIG), (TRN) and the boundary record as in `SOLUTION-CONTRACT.md` §1;
   Lean statements §2. Run-local new keys `E993-R29-…` OPEN at Stage 2 (ledger rows `R29-*`); the three auxiliary keys
   keep their master identities and change status only by their own awards.
2. **Compiled-internal is not awarded.** Entries 41–44 of the first-interior source are context. A seat cites them by entry
   number and fragment digest; no seat presents them as certificates (fence §3.8). Byte-identical carry through the
   registrar is the ONLY way their text enters an award project.
3. **Existing awards are inputs.** `E993Interior.firstInteriorAggregate` and `R26LA1.topRankResidualSign` are never
   re-proved, re-registered or edited; their relations to (TRN)/(HTA)/(ELIG) are scope notes at the close.
4. **The lower region is fenced.** No seat proposes, tests or attacks a mechanism for `3p < 2α + 1`. A boundary witness at
   `3p = 2α` is a record about the guard's precision (Tier 2), not a step into the fenced region, and not a refutation
   of anything in scope.
5. **Toolchain pinned.** Lean 4.32.2 / Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`; never `elan`, `lake update`,
   `lake clean`; `cd` into the pinned project before ANY `lake`/`lean` invocation (incident R28-I-1; the elan default is
   now the pin, so a stray invocation downloads nothing — the rule stands regardless); scratch projects bind by manual
   symlink.
6. **Definitions of record.** Entries 1–18 of the first-interior source byte-identically (`C4LA1.*`, `C5LA1.*`,
   `Erdos993G1.indepCount/coeff/delta`, `E993Interior.taggedFamily`); `q_j` is `(taggedFamily H univ W j).card`; the
   selector is `C4LA1.IsFavorableAt` at the ORIGINAL rank; leaves are `C4LA1.IsGraphLeaf` (degree exactly one in `G`).
7. **Census and priors.** The controller's pre-run replay is a prior; every seat census is `bounded_computation`; the
   follow-ups census values never enter a proof (fence §3.5).
8. **Seal discipline, path hygiene, PID-only kills, wrapper rule, residue check, two-part model disclosure** —
   `AUTHORIZATION.md`.
9. **Early stop.** Stop gate §5: (a) all four targets formally verified ends the run; (b) a confirmed refutation closes
   that target.
10. **Fenced roots.** No seat reads the live first-interior root, the follow-ups root, the r25–r28 roots, the master-ledger
    directory or the public repository working tree — their relevant files are frozen copies under `sources/` with
    digests. Astra's lower-region experiment (if it exists) is not read.
