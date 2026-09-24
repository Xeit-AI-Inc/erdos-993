# Authorization — r26: validate and formalize the r24 top-rank residual sign (RC)

Run root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23`
Run id (canonical, used in every seal and every governed Lean `init`):
`erdos-993-math-dre-20260923-r26-top-rank-residual-sign`
Controller: Claude Fable 5.1 (xhigh), the DRE controller of r24 Cycles 5–6, r25 and the r25 addendum.
Authorized by: Ashton, 2026-09-23 (message and attached prompt carried verbatim in
`control/R26-CHARTER-PROMPT.md`).

## Objective (from the charter)

Determine whether the literature-map candidate argument (research packet of 2026-09-23, lane 05)
closes the exact r24 ordinary-tree top-rank residual inequality `(RC)` — the sign
`S(T, α−1) ≤ 0` on the eligible top-rank residual class — and, if sound, produce a governed Lean
proof composed with the formally verified residual identity `(RI)` (`C5LA1.topRankResidualIdentity`,
r24 award C5-LA1). Resolve the r24 C6 B3/TD-6 discrepancy (the "1,420 eligible residual trees with
negative family-(I) weights" statement) with a replayed witness and a correction record. A success
closes the named subproblem `(RC)` ONLY; it proves neither the all-rank literal aggregate, nor the
governed `E993-BETA-AGG`, nor transport, nor TREE/FOREST, nor Erdős #993.

## Topology and model policy (Ashton, 2026-09-23: "3 workers each for T/F/U and the others
proportional to that number, as we usually do")

Per cycle: 9 routes (T1–T3, F1–F3, U1–U3), 18 cross-orientation critics (two per route), 3 isolated
adjudicators (one per orientation), 1 neutral synthesis, governed Stage 7 when the synthesis names an
award group. Models, per Ashton's ruling ("Sonnet 5 xhigh, Opus 5 (5.5 if available) med and high in
the appropriate parts"):

| Stage | Seat | Model / effort |
|---|---|---|
| 3 | routes | Claude Sonnet 5, xhigh |
| 4 | critics | Claude Opus 5, medium |
| 5 | adjudicators | Claude Opus 5, high |
| 6 | synthesis | Claude Opus 5, high |
| 7 | formalizer | Claude Opus 5, high |
| 7 | informal proof-integrity auditor; statement-fidelity reviewer | Claude Opus 5, high (independent seats) |

Opus 5.5 is not selectable through the agent transport of this session (only the `opus` alias is
offered; recorded in r25 addendum note A1-N); every Opus seat is therefore Claude Opus 5, and every
dispatch record states the chartered model and effort.

## Cycles, controller checkpoints, stop rule

Up to six cycles. The controller performs its own investigation, checks and redirections after the
third cycle (a controller checkpoint record under `control/CONTROLLER-CHECKPOINT-C3.md`), and its
final analysis after the sixth and final cycle (`control/CONTROLLER-REVIEW-R26.md`). The experiment
ENDS EARLY when a solution or a counterexample is discovered: a solution is the governed formal
verification of `(RC)` at its exact scope (formally verified: kernel receipt, independent informal
audit, independent statement-fidelity review, approved axioms only); a counterexample is an
in-scope tree, with every hypothesis established by exact counts, whose top-rank aggregate is
positive. Either ends the run at that cycle's close, followed by the final analysis and publication.

## Standing rules (unchanged from r24/r25)

- Run autonomously; report at gates (Ashton's standing instruction). No permission asks mid-run.
- Sealed members are never edited after their seal (agents/dispatch records are sealed after their
  stage completes or are excluded from the packet — r25 addendum rule A1-E-d).
- No network and no package installs in any seat; Python standard library only; exact integers.
- Never `lake clean`, `lake update` or `elan`; the shared Mathlib packages tree is write-protected
  by design; Lean-building seats bind the shared packages by symlink through the governed
  workflow's `bind-shared-packages`.
- Interrupted agents are resumed by `SendMessage`, never re-spawned.
- Frozen sources under `sources/` are read-only copies of their originals with digests recorded in
  `control/SOURCE-DIGESTS.json`; the originals (the r24 root, the addendum root, the master ledger,
  the research packet) are not written to by this run.

## Publication at the close

The charter's deliverables include "scoped ledger/registry entries according to the supplied
workflow". At the close the controller registers the run's results in the master registry and
ledger (`experiments/erdos-993-master-ledger-2026-09-04/`) and mirrors them to the public
repository `Xeit-AI-Inc/erdos-993` additively and scoped, exactly as at the r24, r25 and addendum
closes: formally verified awards published as such with their Lean packages; informal results with
grade and attribution on their face; no status transfer to any headline. The controller flags this
reading at the first gate report so Ashton can veto the public mirror before the close.
