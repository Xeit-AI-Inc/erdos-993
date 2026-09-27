# Cycle 6 Lean Gate Closeout — r30 (controller record, 2026-09-27; the TERMINAL Stage 7)

Controller: Claude Fable 5.1. One award group funded by the admitted Cycle 6 synthesis (Stage 6 seal `18e7c6ae…`) as a BOUNDED terminal
attempt, run through the governed `lean-proof-workflow` in its own single-source project (Lean v4.32.2 / Mathlib `905b958…`; shared
packages bound read-only; the definitions of record — C4-LA1's `Main.lean` `66db6c73…` (kernel receipt `dd9c21f7…`), carrying C1-LA1's
`86b59c6c…` (receipt `9e733491…`) and C1-LA2's `7c279f4b…` (receipt `dc1371a0…`), restricted to its GRAPH-GENERIC entries 1–21, 25–37,
45–75, and the first-interior entry 14 `C5LA1.crossingIndex` (`378868ab…`) — carried BYTE-IDENTICALLY through the registrar as 66
fragments; C5-LA1 `e24ba9dd…` (receipt `6fe8cea0…`) a pattern source only, nothing carried from it); formalizer, independent informal
proof-integrity auditor and independent statement-fidelity reviewer three distinct Claude Opus 5.5 high seats (every seat's runtime
reported `claude-opus-5-5[1m]`); the controller gated the candidate (kernel receipt verified; `expected_statement` verbatim in the
source; canonical fidelity input by the workflow's projection), assigned reviewers, registered the audits and ran `close`. The bounded
attempt CLOSED: no node blocked, zero repair rounds. Date labels: the run id, producer/reviewer ids and briefs carry the label
`2026-09-28` written by controller error (erratum R30-E-w); the clock date of every step is 2026-09-27, as the receipts record.

| Award | Run | Terminal declaration | Carry | Main.lean | Contract | Kernel | Informal audit | Fidelity | Close |
|---|---|---|---|---|---|---|---|---|---|
| C6-LA2 (the spider `S(1,2,3^k)`: tree face, eligibility and (HALL) at rank `k+3`, `k ≥ 5`) | `runs/lean-2026-09-28-c6-la2-spider-tree-weighted-hall-rank-k-plus-3` | `E993Transport.spiderOneTwoThrees_treeWeightedHall_kPlus3` | C4-LA1 entries 1–21, 25–37 (→ registered 1–34), first-interior 14 (→ 35), C4-LA1 45–75 (→ 54–84); 107 new entries (36–53 definitions, 85–172 lemmas, 173 the theorem) | `df5e2870…` | `dc2fc2a0…` | `ce9dbc19…` (receipt id `54df0347…`; 11 checks) | `0a5f27d1…` passed (receipt `825f2801…`) | `b9683ede…` match (31 checks, 0 failed) | `formally_verified` (`VERIFICATION-REPORT.md` `c79a3792…`) |

Axioms on every declaration: within `[propext, Classical.choice, Quot.sound]`; exactly the three on the terminal theorem; no `sorryAx`,
`admit`, `native_decide`, `decide`-over-enumeration or `axiom` in any new text (173 entries: 35 carried definitions + 18 new, 31 carried
lemmas + 88 new, one terminal theorem); the proof is uniform in `k` and `p` (the `k = 0` base cases of two counting inductions are single
closed `rfl` instances — judged by both reviewers as not enumerations of a universal step). The terminal statement is
character-identical to the synthesis's `## Lean awards` C6-LA2 text, the formalizer brief §2, the contract and `Main.lean` (fidelity
reviewer).

## Statement of record (what the certificate proves)

For every `k ≥ 5`, with `G = spiderOneTwoThrees k` the spider `S(1,2,3^k)` on `Fin (3k+4)` (root `0`; pendant leaf `1`; pendant path
`0–2–3`; `k` pendant paths `0–a_i–b_i–c_i`, `a_i = 4+3i`, `b_i = 5+3i`, `c_i = 6+3i` — exactly the registered spider key's family, the
fidelity reviewer having checked the edge set is the `3k+3` edges of record with none extra or missing): `G` is a tree (Mathlib's
`IsTree`); `C5LA1.crossingIndex G + 2 ≤ k + 3`; `3(k+3) < 2·indepNum G + 1`; and there is a saturating flow
`IsSaturatingFlow G (favorableLeaves G (k+3)) (k+3) f` — i.e. the rank `k+3` is ELIGIBLE and (HALL) holds there at the favorable-leaf
selector. Hypothesis consumed: `hk : 5 ≤ k`, used ONLY for the low window (`α = 2k+2`, so `3(k+3) < 4k+5 ⇔ k > 4`); the statement is
FALSE, not vacuous, for `k ≤ 4` (the face and the contract say so). The flow is deletion-supported (companion lemma 164
`spiderOneTwoThrees_exists_deletionSupported_saturatingFlow`, no grade of its own), but the STATEMENT asserts only a saturating flow
over the network's arcs, as the frozen text has it. `crossingIndex` is the contract's `x`: the least `k` with `i_{k+1} < i_k`, the
difference computed in ℤ with counts above `α` zero (the fidelity reviewer's load-bearing check). FLOW (`spiderOneTwoThrees_deletionFlow`,
entry 165) is proved at EVERY `p ≥ k+2` for EVERY `F ⊆ leafSet` — the registered spider key's flow clause in Lean — and the terminal
instantiates it at `p = k+3` with the DERIVED selector; N3a `crossingIndex ≤ k+1` (entry 172) is the Newton-free root split.

Key: `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-TREE-WEIGHTED-HALL-AT-RANK-K-PLUS-3-FOR-K-AT-LEAST-5` — registers VERIFIED
`formally_verified` at the Cycle 6 close (after the second-reads packet seal) through the awards route; alias pre-screen clear against
the run-local 460 and the 457 master. A SEPARATE key from the registered `proved_informal` spider key
`E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2` (its informal input), which keeps its
every-rank-from-`k+2` scope at `proved_informal` and is superseded ONLY at `p = k+3` (scope notes on both keys and on (HALL)). The
second infinite tree family with a `formally_verified` (HALL) statement of record (after `G_k`), and the first whose flow proof is the
graph-generic chain machinery applied to a new family with no `gk`-specific carry. SR-C6-8 (the alternative proofs as scope notes)
is NOT dispatched: its condition (the award failing) did not occur; the kernel check supersedes them for this rank (synthesis S-4).

## Rulings and records

1. **Receipt bindings.** All four origin awards' `Main.lean` digests are bound by their kernel receipts; the formalizer, the auditor and
   the fidelity reviewer each re-verified the bindings and the `formally_verified` reports; all 66 carried fragments byte-identical
   against the C4-LA1 TEXT OF RECORD and its `Snippets/` (repair E-6 applied: the U adjudicator's containment check had used the Cycle 5
   U1 scratch); nothing from C4-LA1's `gk`-specific entries 22–24, 38–44, 76–113 and nothing from C5-LA1 appears outside comments.
2. **`FORMALIZER-REPORT.md` filed by the controller (incident R30-I-4).** The harness refused the formalizer seat's write of the report
   ("subagents should return findings as text"); the seat did not work around the block and returned the report's content in its final
   message; the controller filed that text verbatim in the run root under a filing note (sha256 `84025ff4…`) and disclosed the filing to
   both reviewers, who judged the content as the formalizer's report. RULE: a governed seat whose harness refuses a required write returns
   the content verbatim and says so; the controller files it under a filing note and never edits it.
3. **Five graph-generic helper lemmas authored new (disclosed).** `support_eq_of_isGraphLeaf_of_adj`, `mem_tagWitnesses_iff_of_adj`,
   `not_disjoint_erase_tagWitnesses_iff_exists_mem`, `inter_insert_insert_singleton_eq_pair` (C4-LA1 entry 102's statement re-proved
   under a new name, not carried) and `spiderGraph_adj_iff_val`. ACCEPTED (lemmas, not definitions of record; the re-derivation is stated
   in the report and the informal proof; both reviewers confirm no definition of record is re-typed).
4. **`spiderTagDown` in `Option`-unwrapped form (disclosed).** Returns `B` when `chainDownVertex = none`; the case never occurs on active
   sources at `p ≥ k+2` (totality by carried entry 65). ACCEPTED (both reviewers).
5. **(F6) for `τ = 1` by the cardinality argument, not C4-LA1's box-top lemma.** As the synthesis and C-U1-T prescribed (entry 107 is
   `gk`-specific and fails for the spider at `p = k+2`). ACCEPTED; the auditor's own port of the chain machinery FROM THE C4-LA1 STATEMENTS
   passes every property for every tag, `p ∈ [k+2, 2k+1]`, `k ≤ 6`.
6. **Count bridge by definition plus carried entry 46.** No new bridge lemma; `forwardDifferenceDel` ℤ-valued; `Nat.find_le`. ACCEPTED
   (the brief's expectation; the auditor confirms).
7. **Auditor observations (non-blocking).** `INFORMAL-PROOF.md` §8 says "entry 14" in first-interior numbering while §1/§7 use C4-LA1
   numbering; the §0 list of ℕ subtractions omits `(n−4)%3` and `u−1` (both guarded). Recorded; no defect.
8. **Process.** Formalizer: names-only listings of `runs/` and the C4-LA1 run root; one `grep` of C4-LA1's `EVIDENCE/build.log` (outside
   the grant); tooling source read for API; the first-interior `FORMALIZATION-STATE.json` not read (not a capsule member); no network,
   installs, `lake update`/`clean`, background jobs. Auditor: names-only listings of `sources/c6-stage7-sources/` and
   `control/controller-facts/`; one read-only `grep` rooted one level above the Mathlib package; one malformed shell redirect into a non-durable temp path (described, not quoted) that
   failed without writing anything. Fidelity reviewer: names-only listings of `runs/` and `scratchpad/`; the audit script and schema read for
   the output format; `completed_at` on the runtime clock `2026-09-27T20:59:40Z` against the record label `2026-09-28` (R30-E-w). No
   deviation affected a verdict. Reviewer ids carry the assigning controller's token (`fable`) as in Cycles 1–5; the seats are Opus 5.5
   (independent by seat). The generic review-brief generator was not used for the brief text (R30-N-81).
9. **Attribution of record.** Mechanism, active-tag weight, relation, the (HALL) key and the lower-region run: Codex GPT-6
   (Astra/Sol/Luna); the sharp boundary `3p < 2α+1`: r29; definition entries 1–18 incl. `crossingIndex`: the first-interior run (Codex)
   with the r26/r24/r25 layers; the network definitions: r30 C1-LA1; the graph-generic chain machinery and the per-tag composition
   (entry 75): r30 C4-LA1; the spider family theorem: r30 Cycle 5 (critic `C-F2-U`, Claude Opus 5.5; F2, Claude Sonnet 5; the Cycle 5 F
   adjudicator; the SR-C5-2 reader); r30 Cycle 6: U1 (Claude Sonnet 5) the spider definition and tree layer; `C-U1-F` (Claude Opus 5.5)
   `α = 2k+2`, the low window, the composition face, the root split; `C-U1-T` (Claude Opus 5.5) the chain carry, the block assignment, the
   root split, the `α` lower bound; the U adjudicator (Claude Opus 5.5) the leaf/witness classification and the carry verification; the
   tree-layer pattern: r30 C5-LA1; formalizer `c6-la2-formalizer-opus-20260928` (Claude Opus 5.5).
10. **Not awarded this cycle** (synthesis `### C6-LA1` and `### Groups recorded no award attempted`): (WID) — `formally_verified` since
    Cycle 1, nothing to attempt; the favorability lemma (Darroch and Newton not under `sources/`; not a (HALL) scope); the ten CB rows
    (finite certificates never qualify); the CB exactness lemma with L1/A1/A3 (needs a `CB(d,m)` definition layer; STATED at the time);
    AT (elementary, signs nothing; the F adjudicator advised against a terminal slot); uniform switch-arc (HALL) on `𝒞_8` (`(L-S)_top` has
    no informal proof); (HALL) at full scope (no proof).
