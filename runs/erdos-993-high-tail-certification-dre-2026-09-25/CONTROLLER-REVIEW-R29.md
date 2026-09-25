# Controller Review — r29 (certify the uniform high-tail mechanism and its non-residual top-rank consequence)

Controller: Claude Fable 5.1, 2026-09-25. Final analysis at the close (`AUTHORIZATION.md` "Cycles and stop rule").

## 1. Outcome against the charter

The Codex prompt asked for four certifications and a fifth thing: a reusable, precisely certified high-tail boundary.
All four targets closed `formally_verified` in ONE cycle with zero repair rounds — stop-gate (a) — and the boundary is now precise in both directions (below). The run delivered the charter in full; the one thing it registers below the requested grade is the aggregate corollary (HTA), at `proved_informal`, because the governed receipt binds a single declaration (ruling R29-N-12) — a tooling limit, not a mathematical one, with the standalone award ready for a successor.

The four targets, as delivered:

1. **(TSB)** `E993-BIPARTITE-TAGGED-SHADOW-BOUND` — `formally_verified` (C1-LA1): the registry statement at `1 ≤ k ≤ α`,
   in ℤ, on every finite bipartite graph with any tag set (disconnected graphs, isolates, `W = ∅`, `k = α` inside).
2. **(HTP)** `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` — `formally_verified` (C1-LA2) at every integer `p ≥ 1`, with the
   `p = 1` endpoint handled explicitly (and found to need no bipartiteness); the aggregate corollary (HTA) on the same
   face, registered at `proved_informal` because the governed receipt binds one declaration (ruling R29-N-12).
3. **(ELIG)** `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` — `formally_verified` (C1-LA3): Codex's proof extracted, carried
   byte-identically, certified under its own contract.
4. **(TRN)** `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` — `formally_verified` (C1-LA4): the low-`α` exclusions audited (eligibility forces
   `α ≥ 4`; eligible trees have `α ≥ 5`), the rank shown to lie inside the region, r26 not widened.

The boundary itself is now precise in both directions: the mechanism signs every leaf term for `3p ≥ 2α + 1`, and for every
`α ≥ 2` a tree of order `2α` has a positive leaf term at `p = ⌊2α/3⌋` (two explicit families, both closed forms proved by
an isolated second read). So the largest rank at which a leaf term can be positive on a tree is exactly `⌊2α/3⌋`, and
the open remainder of the all-rank aggregate is exactly `x + 2 ≤ p ≤ ⌊2α/3⌋` — the region Codex/Astra's compensation
experiment owns.

## 2. What the run did NOT do (fences held)

No step into the lower region; no census value, root correction or Hall/SDR step in any proof; the first-interior award
and r26's residual award unchanged (scope notes only); no strict inequality anywhere; nothing about `E993-BETA-AGG`,
no-recovery, NR1, FOREST, TREE, TRANSFER or Erdős #993. The three refuted pointwise keys stay refuted; their witnesses
fail the guard — a theorem given (HTP), not a data check.

## 3. Process assessment

- **Extraction seating worked.** 4/8/3/1 closed the mathematics in one cycle: every §2 statement was sorry-free in scratch by
  Stage 3 (U1), replayed by the controller and two critics, and rebuilt as four single-file award sources by critics
  before Stage 5. Stage 7 was packaging: zero repair rounds.
- **Critics carried the advances** (r25 seating finding confirmed again): the `p = 1` endpoint's bipartite-freedom (three
  critics), `α ≥ 5` on the domain (two critics), the guard's sharpness family for every `α` (two critics, two families),
  the tightness of `2(a − k)`, `α(H_v) = α − 1`, and the all-`k` form. Every one went through an isolated second read
  before registration; nine items, zero rejections, five with wording repairs adopted verbatim.
- **Controller errors (five errata, two incidents), all on record and none mathematical:** a class-count sum (976 vs
  987); a phantom registry prefix (`E993-R24-*`); the star fixed point's `p = 1` value; "byte-identical" for a
  token-identical carry; the endpoint narrative's bipartiteness; editing a Stage 2 member (restored byte-exact within
  minutes); listing a living file as a second-read capsule member (drift declared expected).
- **Seat deviations:** three formalizers redirected registrar output to `/tmp` once each (deleted at once); F1 placed its
  artifacts under `c1-F1-replay/` instead of `c1-F1/`; the harness auto-backgrounded two of F1's long jobs; several seats
  ran non-recursive listings one level above their grant. None affected evidence; all recorded in the disclosures.
- **Tooling gaps for the inbox:** the theorem contract has no companion-statement field (so a kernel-checked companion
  cannot be certified on the same receipt); `run_workflow.py init` has no run-id option; the contract validator refuses
  out-of-root source paths and extra keys; the capsule builder does not refuse living files; the registrar prints to
  stdout and invites `/tmp` redirects.

## 4. Recommendations

1. **(HTA) standalone award** (a successor, or a Cycle 2 of this run if Ashton prefers): same carry as C1-LA2, body ready,
   one governed run — it converts the high-tail region closure of the all-rank aggregate from `proved_informal` to formal.
2. **Register the r24 C4-LA1 fact** (every leaf of a tree with `α ≥ 2` is favorable at `p = α − 1`) under a claim
   identity; it is a published Lean award without one, and (TRN) is a full-leaf sum because of it.
3. **The lower region is the only mathematics left on the aggregate** — Codex/Astra's compensation experiment. r29's
   contribution to it is the exact boundary (both directions) and the fact that any argument there must be a compensation
   argument, since the pointwise sign fails at `⌊2α/3⌋` on an explicit tree for every `α`.
4. **Tooling** (inbox): companion-statement contract field; `init --run-id`; capsule builder refusing living files;
   registrar output discipline.

## 5. Open decisions for Ashton

- Publish (standing r25 authorization covers the scoped terminal-close publication; done at the close and reported).
- Whether to fund (HTA)'s standalone award now or leave it to the successor list.
