# Cycle 5 Lean Gate Closeout — r30 (controller record, 2026-09-27)

Controller: Claude Fable 5.1. One award group funded by the admitted Cycle 5 synthesis (Stage 6 seal `57a7a367…`) as a BOUNDED
attempt, run through the governed `lean-proof-workflow` in its own single-source project (Lean v4.32.2 / Mathlib `905b958…`; shared
packages bound read-only; the definitions of record — C4-LA1's `Main.lean` `66db6c73…` (kernel receipt `dd9c21f7…`), carrying C1-LA1's
`86b59c6c…` (receipt `9e733491…`) and C1-LA2's `7c279f4b…` (receipt `dc1371a0…`), and the first-interior entry 14 `C5LA1.crossingIndex`
(`378868ab…`) — carried BYTE-IDENTICALLY through the registrar as 113 fragments); formalizer, independent informal proof-integrity
auditor and independent statement-fidelity reviewer three distinct Claude Opus 5.5 high seats (every seat's runtime reported
`claude-opus-5-5[1m]`); the controller gated the candidate (kernel receipt verified; `expected_statement` verbatim in the source;
canonical fidelity input by the workflow's projection), assigned reviewers, registered the audits and ran `close`. The bounded
attempt CLOSED: no node blocked, zero repair rounds.

| Award | Run | Terminal declaration | Carry | Main.lean | Contract | Kernel | Informal audit | Fidelity | Close |
|---|---|---|---|---|---|---|---|---|---|
| C5-LA1 ((HALL) at every eligible rank of `G_k`, with the tree face) | `runs/lean-2026-09-27-c5-la1-gk-weighted-hall-every-eligible-rank` | `E993Transport.gk_lowerRegionWeightedHall_everyEligibleRank` | C4-LA1 entries 1–112 (→ registered 1–44, 53–120); first-interior entry 14 (→ 45) | `e24ba9dd…` | `3acc3c90…` | verified (`6fe8cea0…`, receipt id `71526dad…`) | passed (`3e8627b1…`; receipt `b41422e7…`) | match, 36/36 (`c274b6f6…`) | `formally_verified` (`VERIFICATION-REPORT.md` `f9ad374c…`) |

Axioms on every declaration: within `[propext, Classical.choice, Quot.sound]`; exactly the three on the terminal theorem; no
`sorryAx`, `admit`, `native_decide`, `decide`-over-enumeration or `axiom` in any new text (183 entries: 45 carried definitions + 7 new,
68 carried lemmas + 62 new, one terminal theorem); the proof is uniform in `k`. The terminal statement is character-identical to the
synthesis's `## Lean awards` C5-LA1 text, the formalizer brief §2, the contract and `Main.lean` (fidelity reviewer).

## Statement of record (what the certificate proves)

For every `k`: `gkGraph k` is a tree (Mathlib's `IsTree`), and for every `p` with `C5LA1.crossingIndex (gkGraph k) + 2 ≤ p` and
`3p < 2·indepNum (gkGraph k) + 1` there is a saturating flow `IsSaturatingFlow (gkGraph k) (favorableLeaves (gkGraph k) p) p f` — i.e.
(HALL) holds at every ELIGIBLE rank of every `G_k` at the favorable-leaf selector. Hypotheses consumed: `crossingIndex + 2 ≤ p` only;
the second eligibility hypothesis `hLow` is carried to match SOLUTION-CONTRACT §2's signature and is UNUSED (on the face). The flow is
the one carried lemma entry 110 provides (C4-LA1's deletion-supported flow), but the STATEMENT asserts only a saturating flow over the
network's arcs (the support conjunct is omitted, as the frozen text has it) — deletion support is certified by the C4-LA1 award, not by
this key (fidelity reviewer's registration caution). `crossingIndex` is the contract's `x`: the first negative integer forward difference
of the independence counts, zero-extended, including the terminal difference at rank `α`. The eligible set is nonempty iff `k ≥ 3`
(`α = 2k+3`, `x = k+1` — face content, informal). Companion on the face: `gk_forwardDifference_nonneg` (`j ≤ k → 0 ≤ Δ_j(G_k)`) IS the
monotonicity lemma GK-MONO in Lean — its key `E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE` registers
`proved_informal` per R29-N-12 (a companion carries no certificate of its own), with a scope note that its Lean form is kernel-checked
inside this award.

Key: `E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK` — registers VERIFIED `formally_verified` at the Cycle 5 close (after the
second-reads packet seal, ruling 43) through the awards route; SR-C5-3 confirmed the informal composition and cleared the award's input.
A SEPARATE key from C4-LA1's flow key (its input). Not a second family for gate ruling 39 (the `G_k` scope was already of record at
`p ≥ k+3`; this award closes the gap below `k+3` by proving no eligible rank lies there).

## Rulings and records

1. **Receipt bindings.** All three origin awards' `Main.lean` digests are bound by their kernel receipts; the formalizer, the auditor
   and the fidelity reviewer each re-verified the bindings and the `formally_verified` reports; all 113 carried fragments byte-identical
   (fidelity reviewer: 113/113; auditor: byte-for-byte; the auditor also compared the 15 first-interior fragments sharing names — an
   authorized-adjacent read it disclosed).
2. **N4a by a fibre count (disclosed deviation).** The count bridge `i_{j+1} = u_{j+1} + u_j`, `i_0 = u_0` with `u_m = gkHalfCount k m`
   guarded by its summation ranges (`range (m+1)`, `range m`) is proved by a vertex-cover fibre count over the middles `{2} ∪ {b_i}`, not by
   reusing C4-LA1's block layer. ACCEPTED (the node's statement is unchanged; the auditor verified the literal ℕ semantics against a tree
   DP and SR-C5-3's guarded form for `k ≤ 40`, all `m`). SR-C5-3's finding that the synthesis's DISPLAYED bridge is wrong in literal ℕ
   was relayed to the formalizer mid-run as a controller fact; the guarded form was chosen independently and is equivalent.
3. **N4b by a re-paired chain with an integer closing step (disclosed deviation).** `u_j ≤ u_{j+2}` for `j + 2 ≤ k + 1` follows C-U1-F's
   binomial-row chain with rows paired differently and closes with `C(2N, s+1) + C(N, s) ≤ C(2N, s+3)` for `s + 3 ≤ N` (two identities,
   Pascal induction) instead of the `(3/2)^{M/2}` step; the chain reaches the guard's equality case at `j = k − 1`. ACCEPTED (auditor:
   identities checked by hand and exactly for `N ≤ 160`; within the U adjudicator's allowance; Newton's route and `Polynomial` unused).
4. **N3 by the carried lemma 110.** The reduction calls `gk_exists_deletionSupported_saturatingFlow` (C4-LA1's entry 110), never C4-LA1's
   terminal theorem 113 (not carried); both reviewers confirm. ACCEPTED (ruling 40).
5. **`hLow` unused; support conjunct omitted.** As frozen by the synthesis; the face says so; the fidelity reviewer confirms the omission
   is not a weakening relative to the statement of record and records the registration caution above. ACCEPTED.
6. **Auditor observations O-1..O-4 (non-blocking).** Chiefly: `INFORMAL-PROOF.md` does not say that the `Nat.find` witness (some `j` with
   `Δ_j < 0`) is supplied inside the definition of record of `crossingIndex` itself. Recorded; no defect in the certificate.
7. **Process.** The formalizer read the brief before the seal recompute (matched), read `SEMANTIC-CONTRACT.md` headings only, did not read
   U1's return or CF-REPLAY-c4c (authorized, not needed), listed names of folders outside its grant (none opened), read parts of the
   registrar/validator tooling; no network, installs, `lake update`/`clean`, background processes or `/tmp` writes. The reviewers'
   slight over-reads (fidelity: first-interior receipt fields and fragments 1–6, 8–13, 18; the whole `## Exact established results`
   section; auditor: the 15 name-sharing fragments) are disclosed and did not affect the verdicts. Reviewer ids carry the assigning
   controller's token (`fable`) as in Cycles 1–4; the seats are Opus 5.5 (independent by seat). The controller's generic review-brief
   generator was not used for the brief text (R30-N-81).
8. **Attribution of record.** The network, the active-tag weight and (HALL): Codex GPT-6 (the lower-region run); definition entries 1–18
   incl. `crossingIndex`: the first-interior run (Codex) with the r26/r24/r25 layers; the transport definitions and (WID): r30 C1-LA1;
   FLOW⇒SIGN: r30 C1-LA2; the `G_k` flow: r30 C4-LA1 (Theorem CT-1 by critic `C-F2-T`; R2′ by the Cycle 4 F adjudicator); `gkGraph_isTree`:
   U1 (Claude Sonnet 5); GK-MONO: critics `C-U1-T` and `C-U1-F` (Claude Opus 5.5; two independent proofs, `C-U1-F`'s the proof of
   record); the Lean reduction: `C-U1-F`; the composition and DAG: the Cycle 5 U adjudicator (Claude Opus 5.5); formalizer
   `c5-la1-formalizer-opus-20260927` (Claude Opus 5.5).
9. **Not awarded this cycle** (synthesis `### C5-LA2` and `### Other candidates`): the spider family theorem in Lean (no definition
   layer; N5 the smallest missing lemma — Cycle 6 U1's target); CD-1 in Lean; the `G(8^82,7^2)` keys (finite certificates); the E1
   threshold and `d ≤ 6` lemmas (Darroch not under `sources/`); `α(CB(d,m))` (a companion needing a CB definition layer).
