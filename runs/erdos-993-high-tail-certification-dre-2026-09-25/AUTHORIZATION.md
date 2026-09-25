# Authorization — r29: certify the uniform high-tail mechanism and its non-residual top-rank consequence

Run root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25`
Run id (canonical, used in every seal and every governed Lean `init`):
`erdos-993-math-dre-20260925-r29-high-tail-certification`
Controller: Claude Fable 5.1 (xhigh), the DRE controller of r24 Cycles 5–6, r25, the r25 addendum, r26, r27 and r28.
Authorized by: Ashton, 2026-09-25 — "I have a new prompt from Codex for you to work on. Please confirm that Opus 5.5
med and high will work where the Opus 5 did. Otherwise, do 6 cycles max with our DRE + Lean flow." The prompt (written
by Codex, GPT-6) is carried verbatim in `control/R29-CHARTER-PROMPT.md`; it is the charter's statement of the
targets, and this file and the two contracts narrow it into the run's binding text.

## Objective

A separately governed successor to Codex's completed first-interior aggregate experiment
(`erdos-993-first-interior-aggregate-dre-2026-09-24`, award `E993Interior.firstInteriorAggregate`, formally verified
2026-09-25). That award certified ONE statement — the exact ordinary favorable-leaf aggregate at `p = α(T) − 2` — but its
proof contains a rank-uniform mechanism (the tagged-shadow double count on a bipartite graph) that signs every
original-leaf term in the whole high-tail region `3p ≥ 2α + 1`. Three auxiliary keys were registered OPEN as separate
certificate scopes and never awarded. This run certifies the mechanism at its exact scope and derives its stated
consequence, as four governed Lean awards, each with its own frozen contract, independent informal audit, kernel/axiom
receipt and independent statement-fidelity review:

1. `E993-BIPARTITE-TAGGED-SHADOW-BOUND` — for a finite bipartite simple graph `H`, any vertex subset `W`, `a = α(H)`,
   `1 ≤ k ≤ a`: `k·q_{k+1} ≤ 2(a − k)·q_k` in ℤ, `q_j` the independent `j`-sets of `H` meeting `W`.
2. `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` — for a finite bipartite simple graph `G`, an original degree-one vertex `v`
   with support `s`, and every integer `p ≥ 1` with `3p ≥ 2α(G) + 1`:
   `Δ_{p−1}(G − {v, s}) − Δ_{p−1}(G − N_G[s]) ≤ 0`. No residual, favorable-selector or connectivity hypothesis; `p = 1`
   handled explicitly (the existing internal helper needs `p ≥ 2`); zero counts and out-of-support ranks included.
   Corollary on the same face: the favorable-leaf aggregate `S(G, p) ≤ 0` in that region, original selector and tags.
3. `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` — for finite ordinary trees with integer `p = α(T) − 2`:
   `x(T) + 2 ≤ p ⇒ α(T) ≥ 7`. Extract the existing proof before attempting new mathematics.
4. The NON-RESIDUAL eligible top-rank corollary (new key, run-local `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE`) — for
   every finite ordinary tree `T` with `p = α(T) − 1`: if `x(T) + 2 ≤ p` then `Σ_{v ∈ F_p(T)} [Δ_{p−1}(H_v) − Δ_{p−1}(R_v)] ≤ 0`.
   Audit the low-`α` exclusions; show eligibility places this rank inside the proved high-tail region. Its own exact
   identity and contract; r26's residual award and the first-interior award are never retroactively widened.

This is principally proof extraction, endpoint work and governed verification. No route runs a broad search for a proof
already contained in the existing package. Success is a reusable, precisely certified high-tail boundary and the stated
top-rank consequence — not a proof of the all-rank aggregate, TREE, FOREST, no-recovery or Erdős #993.

## Scope and coordination

- Out of scope (fenced): the complementary lower region `3p < 2α(T) + 1` (Astra's proposed parallel experiment on
  complete selected-sum compensation) — no seat opens a competing compensation attack; the r27 root correction `M_k`
  (the fresh review showed it does not control marked rank growth); Hall/SDR slot dominance (refuted by r28); the census
  values `M(6) = 22` and K1-addition closure through `x ≤ 6` (census-dependent grades; never promoted into a Lean theorem
  or introduced into a structural proof); every no-recovery statement; `E993-BETA-AGG` (governed RTree) and any
  ordinary-to-governed transport; TREE, FOREST, TRANSFER, Erdős #993.
- Starting reference (the charter's, checked live at Stage 1): public `main` `713f0df`, master registry 407 identities.
  The registry, ledger, notepad, roadmap and completed-run records were re-read before this root was built; newer work is
  preserved (the master is never assumed to match an earlier snapshot; the publication count is read at publication time).
- Codex's completed first-interior root and the completed follow-ups root are READ-ONLY sources, frozen under
  `sources/` with digests; nothing is written to them.

## Topology and model policy

Per cycle: 4 routes (T1, T2, F1, U1 — an extraction run, not a search), 8 cross-orientation critics (two per route), 3
isolated adjudicators (one per orientation), 1 neutral synthesis, governed Stage 7 when the synthesis names award groups
(up to four, one per target), isolated second reads before any STATED item is registered. Routes Claude Sonnet 5 xhigh;
critics Claude Opus 5.5 medium; adjudicators, synthesis, Stage 7 formalizers, informal auditors, fidelity reviewers and
second readers Claude Opus 5.5 high. Model of record: Ashton (2026-09-25) — "We'll continue to use 5.5 for our Opus work
from now on"; the controller's transport probe of 2026-09-25 (Agent alias `opus`) reported `claude-opus-5-5[1m]` with file
access working, so the seats charter exactly as the Opus 5 seats did in r26–r28. Every seat states the chartered model
AND the model id its runtime reports (two-part disclosure; r28 lesson).

## Cycles and stop rule

Up to six cycles. Decisive events: (a) all four targets `formally_verified` at their contract statements — the run
ENDS; (b) an in-scope counterexample to a target (exact finite counts, two independent instruments, an isolated second
read) — that target closes REFUTED with its record and the run continues for the others. The run also ENDS when every
target is either formally verified, refuted, or closed fail-closed with an exact blocked obligation after the bounded
repair budget. Controller checkpoint after Cycle 3; final analysis at the close (`control/CONTROLLER-REVIEW-R29.md`).

## Standing rules (r25–r28 lessons; all binding)

- Run autonomously; report at gates; no permission asks mid-run.
- Sealed members are never edited after their seal; agents/dispatch records are sealed after their stage; corrections
  are records and scope notes.
- No network and no package installs in any seat; Python standard library only; exact integers.
- Lean: never `lake clean`, `lake update` or `elan`; **never invoke `lake` or `lean` outside a pinned project directory**
  (incident R28-I-1); the shared Mathlib packages tree is write-protected; a scratch Lean project binds the shared
  packages by MANUAL SYMLINK (`.lake/packages` → the shared packages directory); the governed `bind-shared-packages` tool
  is for `runs/` roots only. Toolchain of record `leanprover/lean4:v4.32.2`, Mathlib
  `905b95818eb32af7874a58b427f50c1711a5e96c`; the elan default is now that pin and no other toolchain is installed.
- Kill by literal PID only; never a pattern kill; never a full process listing.
- Seat dispatch wrappers carry only the pointer to the sealed dispatch file.
- Interrupted agents are resumed by `SendMessage`, never re-spawned; a review round 2 resumes the same reviewer.
- Residue check: every cloned control file is grepped for the predecessors' award ids, namespaces, headline tokens, route
  counts, source paths and date literals before its seal (`r29_tool.py residue-check`); the report is a Stage 2 member.
- Contract Lean targets are test-compiled against a small instance before the Stage 2 seal where a scratch build is
  cheap (r28 inbox rule 3); the controller's pre-run instrument (`control/controller-prerun/`) is a prior, never evidence.
- Publication count read from the master registry at publication time; a capsule that freezes sibling award runs declares
  their lifecycle drift expected at seal time.
- Frozen sources under `sources/` are read-only copies with digests in `control/SOURCE-DIGESTS.json`; the originals (the
  first-interior root, the r25/r26/r27/r28 roots, the follow-ups root, the master ledger, the public repository) are not
  written to during the run.

## Publication at the close

As r24–r28: additive and scoped registration in the master registry/ledger and the public repository mirror (formal awards
as such; the three auxiliary keys upgraded only by their own certificates; the new top-rank key registered with its
certificate; scope notes on `E993-R26-TOP-RANK-RESIDUAL-SIGN`, `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` and
`E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` with statuses unchanged), reconciling the latest registry, ledger, research
notes and public repository while preserving concurrent updates and historical evidence. Under the standing r25
authorization for scoped terminal-close publication; reported at the gate.
