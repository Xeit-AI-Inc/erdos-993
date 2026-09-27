# Cycle 4 Lean Gate Closeout — r30 (controller record, 2026-09-27)

Controller: Claude Fable 5.1. One award group funded by the admitted Cycle 4 synthesis (Stage 6 seal `b6970ca9…`) as a BOUNDED
attempt, run through the governed `lean-proof-workflow` in its own single-source project (Lean v4.32.2 / Mathlib `905b958…`; shared
packages bound read-only; the definitions of record — C1-LA1's `Main.lean` `86b59c6c…` (kernel receipt `9e733491…`) and C1-LA2's
`Main.lean` `7c279f4b…` (kernel receipt `dc1371a0…`) — carried BYTE-IDENTICALLY through the registrar as 31 fragments); formalizer,
independent informal proof-integrity auditor and independent statement-fidelity reviewer three distinct Claude Opus 5.5 high seats
(every seat's runtime reported `claude-opus-5-5[1m]`); the controller gated the candidate (kernel receipt verified;
`expected_statement` verbatim in the source; canonical fidelity input by the workflow's projection), assigned reviewers,
registered the audits and ran `close`. The bounded attempt CLOSED: no node blocked, zero repair rounds.

| Award | Run | Terminal declaration | Carry | Main.lean | Contract | Kernel | Informal audit | Fidelity | Close |
|---|---|---|---|---|---|---|---|---|---|
| C4-LA1 (`G_k` deletion-arc saturating flow at every rank `p ≥ k+3`, every leaf tag set) | `runs/lean-2026-09-27-c4-la1-gk-deletion-saturating-flow-every-rank` | `E993Transport.gk_deletionSaturatingFlow_of_rank_ge` | C1-LA1 entries 1–22, 23–28, 36; C1-LA2 entries 29, 33 (31 fragments) | `66db6c73…` | `4b71b7ca…` | verified (`dd9c21f7…`) | passed (`ab5de3b6…`; receipt `8c4b064e…`) | match, 28/0/0 (`cb1e50a4…`) | `formally_verified` (`37083e4c…`) |

Axioms on every declaration: exactly `[propext, Classical.choice, Quot.sound]` (113 entries: 44 definitions = 22 carried + 22 new
incl. `gkEdge`, `gkGraph` and the decidable instance; 68 lemmas = 9 carried + 59 new; one terminal theorem); the instance
`gkGraph_decAdj` depends on `[propext, Quot.sound]` only; no `sorry`, `admit`, `native_decide`, `decide` or `axiom` in any new text; the
proof is uniform in `k`. The terminal statement is character-identical to the synthesis's `## Lean awards` C4-LA1 text and the
formalizer brief §2.

## Statement of record (what the certificate proves)

Let `gkGraph k` be the tree `G_k` on `Fin (3k+5)` (root `0`; leaf `1`; support `2` with leaves `3, 4`; arms `0–(5+3i)–(6+3i)–(7+3i)`
for `i < k`). For every `k`, every `p` with `k + 3 ≤ p` and every `F ⊆ C5LA1.leafSet (gkGraph k)`: there is an ℕ-valued
`IsSaturatingFlow (gkGraph k) F p f` supported on single-deletion arcs only (`0 < f B A → ∃ q ∈ B, A = B.erase q`). Hypotheses:
`k + 3 ≤ p` and `F ⊆ leafSet` — NO `IsTree`, eligibility, `crossingIndex`, `indepNum`. The Lean binder quantifies over every natural
`k`, including `k = 0` (trivially true: `G_0` is a well-formed 5-vertex tree with no sources at any allowed rank); the informal
statement's "`k ≥ 1`" wording is contained in it (fidelity note (vi)). Companions on the face, `proved_informal` only (R29-N-12):
`gk_weightedHall_of_rank_ge` (`WeightedHall (gkGraph k) F p`) and `gk_aggregate_nonpos_of_rank_ge` (`C5LA1.aggregate (gkGraph k) p ≤ 0`),
plus every helper of the DAG N0–N6.

Key: `E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET` — registers VERIFIED
`formally_verified` at the Cycle 4 close (after the second-reads packet seal `86826258…`, ruling 37). Composed with the registered
eligibility key (`proved_informal`) it gives (HALL) on the infinite eligible family `{(G_k, p) : k ≥ 3, p ≥ k+3 eligible}` with
deletion arcs alone — the (HALL) scope note; the composition's grade is the eligibility key's, `proved_informal` (isolated second read
SR-C4-1 confirmed CT-1, R2′ and the composition).

## Rulings and records

1. **Receipt bindings (brief §1).** Both origin awards' `Main.lean` digests are bound by their kernel receipts; the formalizer, the
   auditor and the fidelity reviewer each re-verified both bindings and both `formally_verified` reports.
2. **Carried entry 22 (disclosed deviation).** C1-LA1 entry 22 was not on the brief's carry list; carried entries 26 and 28 use its
   private helpers, so it was carried byte-identically. ACCEPTED. The auditor notes (N-3) that the terminal theorem formally depends
   on the trivial private helper `support_unique` inside entry 22; the high-tail lemma itself (with its `indepNum` hypothesis) is not a
   dependency.
3. **Instance as `@[reducible, instance] def`.** The registrar accepts only `def` entries; instance plumbing, not a statement change;
   the fidelity reviewer confirms a genuine decidable instance without classical choice. ACCEPTED.
4. **Terminal theorem by the N6 call.** The registrar admits no entry after the theorem and both companions need the flow, so the
   theorem's proof calls the identically stated lemma `gk_exists_deletionSupported_saturatingFlow`; both reviewers confirm the two
   statements are identical (a registrar-order artefact, not a gap). ACCEPTED.
5. **N4 by block-fixing; N5 by the symmetric chain decomposition.** The formalizer held the tag's own block fixed inside the block
   list instead of type equivalences (a proof choice; the synthesis's alternative clause was worded for N5 — auditor note N-1; same
   slice), and built N5's injection by iterating the two-chain split block by block. Both reviewers judged neither mathematical.
6. **ℕ audit.** No subtraction in the statement; every one in the proof is guarded (auditor note N-2: the proof's "only in
   `chainDownUp`" list is incomplete but every omitted form is guarded).
7. **Reviewer-brief slips (none affecting the artifact).** The auditor's brief cited "every tag set for `k ≤ 3`"; the auditor checked
   every tag set for `k ≤ 4` (745 cases). The fidelity input's first write by the reviewer escaped non-ASCII characters; it was
   rewritten in the original format and re-hashed to the controller's `94643657…` before the audit was re-run (identical result).
8. **Process.** The formalizer read the brief before recomputing the capsule seal (matched right after), read parts of the
   registrar, validator and template (tooling), and read one harness-saved output back; no network, installs, `lake update`/`clean`,
   background processes or `/tmp` writes. Reviewer ids carry the assigning controller's token (`fable`) as in Cycles 1–3; the seats
   are Opus 5.5 (independent by seat).
9. **Attribution of record.** The network, the active-tag weight and (HALL): Codex GPT-6 (the lower-region run); definition entries
   1–13: the first-interior run (Codex) with the r26/r24/r25 layers; the transport definitions and (WID): r30 C1-LA1; FLOW⇒SIGN: r30
   C1-LA2; the `G_k` family and its eligibility key: r30 Cycles 2–3; Theorem CT-1: critic `C-F2-T` (r30 Cycle 4, Claude Opus 5.5); the
   rank extension R2′: the r30 Cycle 4 F adjudicator (Claude Opus 5.5); the bounded `G_k` Hall record: F2 (Claude Sonnet 5), `C-F2-U`,
   the controller replay CF-REPLAY-c4c, the synthesis instrument; formalizer `c4-la1-formalizer-opus-20260927` (Claude Opus 5.5).
10. **Not awarded this cycle** (synthesis `### No award attempted`): CD-1 (no definition layer of record for claw layers — Cycle 5
    U1's target); E1-R + CD-2 (no encoding); the five-row (HALL) certificate (finite; never qualifies); B7 in Lean (companion only);
    the (NM) package ((N-iso) open); GK-SIGN in Lean (the literal `G_k` with `IsTree` — reuse `gkGraph`); R3; (HALL) at full scope.
