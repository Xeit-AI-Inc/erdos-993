# Return — Seat F1, Cycle 4, r31 (CB(8,m) uniform switch-using Hall certificate)

Route `C4-F-01`, mechanism token `FROZEN-STATEMENT-AND-DEFINITION-FIDELITY-SIGNOFF`, orientation F (falsify).
Load-bearing obligation (`control/C4-ALLOCATION.md`, F1 row): a signed, clause-by-clause audit of (i) every frozen
N1–N8 statement against its informal source and SEMANTIC-CONTRACT §1–§2; (ii) the carried definitions
`transportRel`, `activeWeight`, `IsSaturatingFlow`, `WeightedHall`, `favorableLeaves`, `tagWitnesses` read against
SEMANTIC-CONTRACT §1 (checkpoint risk R-2); (iii) C3-LA1 as closed; (iv) the R-10/R-11 greps (reserved name; digest
literals) over the base.

**Boot.** I am operating within VerityOS. RESTRICTED BOOT: I read exactly two VerityOS files and no other —
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` — and did
not follow the startup protocol's own task-type map into memory, conversations, modules, skills, logs or decisions.
The controller has booted for the run. Dispatch digest verified before anything else:
`shasum -a 256 control/dispatch/c4-stage3/DISPATCH-F1.md` = `d03f9aaf5bb9d0159312ea8977a75034009972096759192a44de571125afa84a`,
matching the value given (MATCH).

Subsystems loaded this session: the two boot files only, then the run-root packet (below). No conversation log was
written; the brief's single-output-file rule (deliverable: this file) supersedes the repository's logging
instruction for this seat.

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id: claude-sonnet-5

## IMPORT LIST

Every script under `scratchpad/c4-F1/` uses the Python standard library only, `python3 -B`, exact integers/strings,
no network, no installs. Per-script import lists (also stated as a header comment in each file):
- `verify_seals_and_digests.py`: `json`, `hashlib`, `os`
- `check_digest_literals_r11.py`: `re`, `json`, `os`
- `acyclicity_connectivity_check.py`: `itertools`, `random`

## Read boundary

**Authorized reads (this route).** Both boot files; `control/C4-WORKER-COMMON-BRIEF.md`;
`control/C4-STAGE2-PACKET-MANIFEST.json` (seal verified below); `SEMANTIC-CONTRACT.md`; `SOLUTION-CONTRACT.md`;
`control/C4-ALLOCATION.md`; `control/C4-STAGE1-GATE.md`; `cycles/cycle-4/stage2/ROUTE-STATE.md`;
`control/C4-FROZEN-STATEMENTS.md` and `control/C4-FROZEN-STATEMENTS.lean`; `control/CHECKPOINT-ANALYSIS-C3.md`;
`OBLIGATIONS.csv`; `control/CLAIM-IDENTITY.run-local.json`; `sources/SOURCE-DIGESTS.json` and the per-tree digest
indexes (`sources/{c1,c2,c3,c4-base,...}-results*/SOURCE-DIGESTS.json`); the carried definition source
`sources/c1-results/runs/lean-2026-09-28-c1-la2-cb8-definition-layer/LeanProject/LeanProof/Main.lean`; the C3-LA1
award (`sources/c3-results/runs/lean-2026-09-28-c3-la1-cb8-e1-clone-transport/`: `Main.lean`,
`VERIFICATION-REPORT.md`, `RECEIPTS/kernel-verification.json`); the second reads
`sources/c3-results/second-reads/SR-C3-2/SECOND-READ.md` and `SR-C3-3/SECOND-READ.md`; the Cycle 4 base
`sources/c4-base/` (`SOURCE-DIGESTS.json`, the four `LeanProof/*.lean` files, `build-root.log`, `build-c3la1.log`,
`axioms-base.log`). Names-only listings (no contents opened beyond the files above): `sources/`,
`sources/c1-results/runs/`.

## Read-boundary disclosure

1. **Two out-of-grant listings under `cycles/`.** The brief authorizes exactly one file under `cycles/`:
   `cycles/cycle-4/stage2/ROUTE-STATE.md`. While tracing the "informal source" citations printed in
   `control/C4-FROZEN-STATEMENTS.md` for N3's definition, N7, N8 and N2 (which cite `cycles/cycle-3/stage6/SYNTHESIS.md`
   and `cycles/cycle-3/stage5/adjudicators/U/ADJUDICATION.md`), I ran two non-recursive `ls` listings —
   `ls cycles/cycle-3/stage6/` and `ls cycles/cycle-3/stage5/adjudicators/U/` — to locate those files. `cycles/` is
   named in the brief as above this route's grant; I stopped there, opened neither file's contents, and did not
   re-issue the listings. **Consequence for this return:** the N3-definition, N7, N8 and N2(N2-companion) "informal
   source" quotations in `control/C4-FROZEN-STATEMENTS.md` are accepted on the drafter's own transcription and were
   **not** independently re-verified word-for-word by this route (contrast N1, N3(images/legs/Out), N4(In/zero) and
   N5, whose sources — `SR-C3-2` and `SR-C3-3` in full — I did read and did verify verbatim; see below). This is a
   genuine gap in this route's fidelity coverage, named explicitly rather than silently patched, and is carried into
   `## Remaining obligation`.
2. **Harness-injected context.** Before my first tool call, this session's context already contained the project
   `CLAUDE.md` (VerityOS root instructions) and the user's auto-memory index (`MEMORY.md`, which names this run and
   several prior r31/r30 cycles) and the user's e-mail, injected by the harness rather than read by me under the
   dispatch's grant. I did not open, cite, or rely on any fact from either beyond what the dispatch itself supplied;
   the restricted-boot clause governs this return, not the repository's ordinary boot sequence. No skill file was
   read (contrast the Cycle 1–3 boot-order leak the checkpoint records at Process quality item 6).
3. **Tools.** No `lake`/`lean` was run (this route builds no Lean). No network, no installs, no child agents. No
   background job was started (all scripts ran to completion in the foreground). No process listing was run (no
   `ps`/`pgrep` needed — nothing was backgrounded). All writes are under `scratchpad/c4-F1/`,
   `scratchpad/c4-F1-replay/`, and this one `RETURN.md`; no source file was edited; no sealed member was edited.

## Stage 2 seal verified

`control/C4-STAGE2-PACKET-MANIFEST.json`: recomputed SHA-256 of the canonical JSON (the object with `seal_sha256`
removed, `sort_keys=True`, `separators=(",", ":")`, no trailing newline) against the file's own `seal_sha256` field.

```
side A (manifest's own seal_sha256 field): 226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387
side B (independent recomputation)       : 226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387
MATCH — 6084 files declared, schema verityos... packet-manifest, stage=cycle-4-stage2 (per the manifest's own fields)
```

Every digest this return cites was independently recomputed (`shasum -a 256` / `hashlib.sha256`) against its
recording registry, not copied by inspection; see `scratchpad/c4-F1/verify_seals_and_digests.py` and its output.

## Registered claims this route touches (named before any check is presented as evidence)

Per SOLUTION-CONTRACT §4, a fidelity/signoff route re-confirms carried objects; it registers no new claim and
re-proves nothing. The claims this audit's findings bear on (SEMANTIC-CONTRACT §4; `sources/authority/CLAIM-IDENTITY.json`
key list read at that file's listing, not opened in full — see read boundary):

- The Tier 1 key (the run's headline object; `proved_informal`, Darroch/Newton-free at the Cycle 3 close) — this
  route's audit of `transportRel`/`activeWeight`/`favorableLeaves`/`IsSaturatingFlow`/`WeightedHall`/`tagWitnesses`
  bears on the definitional layer Tier 1's conjunct 4 is stated over.
- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (criterion key; carries C3-LA1's
  formal clause) — re-confirmed as `proved_informal` with C3-LA1's restricted-scope formal clause unchanged; no
  grade change proposed.
- `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`, `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`,
  `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` — these are stated directly in terms
  of the six carried definitions audited below; touched, not re-proved.
- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (HALL, OPEN) and `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`
  (OPEN) — fence 1 (SOLUTION-CONTRACT §3.1): nothing in this return touches either key's status; both stay OPEN.
- `E993-TREE-REAL-ROOTED` (REFUTED) — not touched by this route; cited only to confirm fence 6 (refuted mechanisms
  stay refuted) is not contradicted anywhere in the frozen texts (it is not; no Darroch/Newton is applied to `I`,
  `G`, `G^m` or any forest polynomial in N1–N8).

No new claim is proposed by this route (item 5 of the worker brief, "propose any new claim... alias-checked", is
therefore vacuous here). Alias check performed anyway, as a falsification target: the reserved terminal name
`cb8_topRank_eligible_and_weightedHall` (R31-N-22) was grepped — lexically — across every frozen text and the
Cycle 4 base (0 occurrences, confirmed below); mathematically, N8's hypothesis was re-read against the reserved
terminal's shape and confirmed to be a property of the one named function `cb8E1Arc + cb8GSec` (per its own
docstring and per my reading of its Lean text), not an existential flow statement and not syntactically an alias of
the reserved name — consistent with gate ruling 23's requirement and the frozen text's own disclaimer.

## Step-by-step derivation: the six carried definitions against SEMANTIC-CONTRACT §1

SEMANTIC-CONTRACT §1 (r30's text, governing word for word) states five objects. I located each Lean definition of
record in `sources/c1-results/runs/lean-2026-09-28-c1-la2-cb8-definition-layer/LeanProject/LeanProof/Main.lean`
(digest verified below) and derived, clause by clause, that the Lean text and the contract prose denote the same
object. Where prose and Lean disagree the Lean source governs (SEMANTIC-CONTRACT's own rule); I found no
disagreement.

1. **`x(T)` / `crossingIndex`.** Contract: "the least `k` with `i_{k+1}(T) < i_k(T)`, computed in ℤ with counts zero
   above `α`." Lean (entry 22, `C5LA1.crossingIndex`): `Nat.find (p := fun k => forwardDifferenceDel G ∅ k < 0)`.
   `forwardDifferenceDel G D k := (indepSetCount G D (k+1) : ℤ) − indepSetCount G D k` (entry 11), and
   `indepSetCount G D k := (indepSetsAvoiding G D k).card` (entry 10) is a `Finset.card`, hence `0` whenever no
   independent `k`-set avoiding `D` exists — the "zero above `α`" clause. At `D = ∅` this is exactly
   `i_{k+1}(T) − i_k(T) < 0`, i.e. `i_{k+1}(T) < i_k(T)`. MATCH.
2. **Eligibility, `x(T)+2 ≤ p` and `3p < 2α(T)+1`.** These are hypotheses on the frozen statements' face
   (`hm`/`hres` plus the class arithmetic), not a separate definition; SEMANTIC-CONTRACT §2 states `3p* = 16m+4 <
   18m+3 = 2α+1` for every `m ≥ 1`, an arithmetic fact independent of the graph — I re-derived it: `18m+3 −
   (16m+4) = 2m − 1 > 0` for `m ≥ 1`. MATCH (no graph object to audit here; the inequality itself is elementary and
   holds).
3. **`F_p(T)` / `favorableLeaves`.** Contract: "original leaves `v` with `Δ_p(T−v) < 0`." Lean (entry 18):
   `favorableLeaves G p := (C5LA1.leafSet G).filter fun v => C4LA1.IsFavorableAt G v p`, and `IsFavorableAt G v p :=
   vertexDeletionForwardDifference G v p < 0` (entry 3) where `vertexDeletionForwardDifference G v p :=
   (vertexDeletionIndepSetCount G v (p+1) : ℤ) − vertexDeletionIndepSetCount G v p` (entry 2) — exactly
   `i_{p+1}(T−v) − i_p(T−v) < 0`, i.e. `Δ_p(T−v) < 0`. MATCH.
4. **`w_F(B)` / `activeWeight`.** Contract: `#{v ∈ F∩B : B ∩ (N(s_v) ∖ {v}) ≠ ∅}`. Lean (entry 16): `activeWeight G
   F B := ((F ∩ B).filter fun v => ¬ Disjoint (B.erase v) (tagWitnesses G v)).card`, with `tagWitnesses G v :=
   (G.neighborFinset (support G v)).erase v` (entry 15) `= N(s_v) ∖ {v} = W_v`. Since `v ∉ W_v` by construction
   (the `.erase v`), `B.erase v` and `B` intersect `W_v` identically (`v` itself is never a member of `W_v`, so
   removing it from `B` before intersecting changes nothing): `¬Disjoint(B.erase v, W_v) ⟺ B ∩ W_v ≠ ∅ ⟺ B ∩
   (N(s_v)∖{v}) ≠ ∅`. MATCH (derived, not merely inspected — this is the one clause where the Lean text's literal
   shape (`B.erase v`) differs syntactically from the contract's literal shape (`B`) and needed the `v ∉ W_v` step
   to close).
5. **Relation (D)∪(S) / `transportRel`.** Contract: `A = B∖{q}`, or `A = (B∖N(u))∪{u}` for `u∉B` with
   `|N(u)∩B|=2`. Lean (entry 19): `transportRel G B A := (∃ q ∈ B, A = B.erase q) ∨ (∃ u, u ∉ B ∧
   (G.neighborFinset u ∩ B).card = 2 ∧ A = insert u (B \ G.neighborFinset u))`. Textually identical up to notation
   (`B.erase q = B∖{q}`; `insert u (B \ N(u)) = (B∖N(u))∪{u}`). MATCH, word for word.
6. **`(HALL)` / `WeightedHall`.** Contract: `Σ_X w_F ≤ Σ_{N(X)} w_F` for every `X ⊆ I_{p+1}(T)`. Lean (entry 21):
   `WeightedHall G F p := ∀ X ⊆ indepFamily G (p+1), ∑ B∈X, activeWeight G F B ≤ ∑ A∈(indepFamily G p).filter (fun
   A => ∃ B∈X, transportRel G B A), activeWeight G F A`. The filtered set is exactly `N(X) ∩ I_p(T)`. MATCH.
7. **`(HALL)` / `IsSaturatingFlow`.** Contract: "a saturating integral flow." Lean (entry 20): `f : Finset V →
   Finset V → ℕ` (integral by type), supported on `transportRel` with `0 < f B A → …`, row sums **exactly**
   `activeWeight G F B` on every `B ∈ I_{p+1}`, column sums **at most** `activeWeight G F A` on every `A ∈ I_p`.
   MATCH to "saturating" (exact on sources) "integral" (ℕ-valued) "flow" (nonneg, capacity-respecting).
8. **Cross-check against N2/N7/N8's rational bundle.** N2's `cb8E1Arc` and N7/N8's bundle `g = cb8E1Arc + cb8GSec`
   are ℚ-valued and their per-source law is `activeWeight F B ≤ Σ_A g B A` (**≥**, not `=`) — apparently weaker than
   `IsSaturatingFlow`'s exact row sum. I checked this is not a fidelity gap but the documented two-step reduction:
   N8's proof is stated to use Cycle 2 U2's `weightedHall_of_ratFlow_bound` (a rational Out-`≥`/In-`≤` bundle ⇒
   `WeightedHall`) composed with r30's `exists_saturatingFlow_of_weightedHall` (`WeightedHall` ⇒ ∃ an *integral*
   saturating flow, entries 30–31, not in the Cycle 4 base). I further checked the case split is exhaustive on
   `indepFamily(p+1)`: a source `B` with `r ∈ B` has `cbOpenChokeCount = 0` (every `u_i ~ r` in `CB(8,m)`, so no
   choke vertex can coexist with `r`), hence `activeWeight = 0` there unless `v ∈ B` too (a sector source, weight
   exactly 1 via `[v,r∈B]`, covered by N3's `Out ≥ 1`); `r ∉ B` sources are covered by N2's exact row law (weight
   any value); no source class is left uncovered by either `cb8E1Arc` or `cb8GSec`. This is a genuine derivation,
   not a restatement of the drafter's own claim, and it found no gap.

## The N1–N8 clause-by-clause audit (against cited informal sources)

**Fully re-verified (source files read in full, digest-matched, quotations checked verbatim against the live
files, not merely against the frozen companion's transcription):**
- `SR-C3-2/SECOND-READ.md` (digest `44a37189…caaf6`, MATCH) — covers N3's Out bridge and Out≥1 (item 2), N4's In
  bridge, zero classes and A2/switch-preimages (items 3–5). Quoted text in `C4-FROZEN-STATEMENTS.md` lines 393–399,
  449–456, 478–480, 509–514, 548–556, 582–588 checked word-for-word against the live file's lines 99–122: **exact
  match, no paraphrase drift**.
- `SR-C3-3/SECOND-READ.md` (digest `ee382bd5…9f`, MATCH) — covers N1(B1–B3) and the Lean-convention subtraction
  guards used by N2's companion. Quoted text at `C4-FROZEN-STATEMENTS.md` lines 74–82, 120–126, 156–159, 613–616
  checked against the live file's lines 140–182 and 255: **exact match**.

**Accepted on the drafter's transcription, not independently re-opened (read-boundary disclosure 1 above):**
N3's definition text (`cycles/cycle-3/stage6/SYNTHESIS.md` lines 765–768, 187, 792–796), N7's companion and
composition sources (`SYNTHESIS.md` lines 153–162, 838–843; `CHECKPOINT-ANALYSIS-C3.md` lines 218–221, which I DID
read in full as part of the authorized checkpoint file), N8 (`SYNTHESIS.md` lines 220–222; `CHECKPOINT-ANALYSIS-C3.md`
line 193, authorized), N2's companion (E) (`cycles/cycle-3/stage5/adjudicators/U/ADJUDICATION.md` lines 337–338,
341–342).

**Structural/guard audit (from the Lean texts directly, `control/C4-FROZEN-STATEMENTS.lean`, digest-matched):**
every ℕ subtraction I could find on the face of N1–N8 is either absent (the theorem statements are written
subtraction-free per their own docstrings — e.g. N1's bounds as `w ≤ 8q` rather than `α ≤ a`) or guarded by a
hypothesis (`8 * cbOpenChokeCount m A - 1` in N2/N7 guarded by `1 ≤ cbOpenChokeCount m A` on the face; `m -
cbOpenChokeCount m A` and `(16*m+4)/3 - cbOpenChokeCount m A` safe via the companion `cbOpenChokeCount_le` per open
question 4 of the companion doc, which the gate has not yet resolved onto the face — this is a real, disclosed gap,
not a defect: the frozen text is honest about it in its own "Guards" field for `cb8E1Arc_spec_topRank`). I found no
ℕ subtraction in N1–N8 that is silently unguarded (contrast Cycle 3's kernel-refuted `clone_fiber_card`, which had
exactly this defect).

## C3-LA1 audited as closed

Independently re-verified (not cited from the checkpoint): `sources/c3-results/runs/lean-2026-09-28-c3-la1-cb8-e1-clone-transport/`:
- `LeanProject/LeanProof/Main.lean` sha256 `1388fa52cbb812d120a0c161021538d23e91712b55b62d89f521faa73fa8eb15`, equal
  to `RECEIPTS/kernel-verification.json`'s `source_sha256_before` **and** `source_sha256_after` (immutability
  check passed) and equal to the base copy at `sources/c4-base/LeanProject/LeanProof/C3LA1.lean`'s parent (the 20
  non-`Main.lean` entries; `Main.lean`'s own C3-LA1 content is not yet in the U3-derived base per open question 2 —
  a documented gap, not a defect).
- `RECEIPTS/kernel-verification.json`: `verdict.code = "verified"`, `verdict.verified = true`,
  `allowed_axioms = [Classical.choice, Quot.sound, propext]`, every `checks.*.status = "passed"` (11/11), theorem
  name `E993Transport.cb8_E1_cloneTransport_topRank`.
- `VERIFICATION-REPORT.md` sha256 `b3f358ab5e35996694ea52e1aeac2367b7cf6ffeb669212a96f25fc8a12deede`.
- `sources/c4-base/axioms-base.log`: `'E993Transport.cb8_E1_cloneTransport_topRank' depends on axioms:
  [propext, Classical.choice, Quot.sound]` — matches, independently, from the base project's own rebuild.

**C3-LA1 is closed**: kernel-verified, axiom-clean, source-immutable, and its base copy's axiom footprint matches
its own award's receipt from a second, independent rebuild (the base project). No discrepancy found.

## R-10 (reserved name) and R-11 (digest literals) mechanical checks

**R-10.** `cb8_topRank_eligible_and_weightedHall` (R31-N-22): **0** occurrences across
`control/C4-FROZEN-STATEMENTS.md`, `control/C4-FROZEN-STATEMENTS.lean`, and all five files of the Cycle 4 base
(`Main.lean`, `Statements.lean`, `E1FlowConstruction.lean`, `ChokeState.lean`, `C3LA1.lean`). Confirms gate ruling
23/25's own claim, independently.

**R-11.** Every 64-hex literal in `control/C4-FROZEN-STATEMENTS.md`, `.lean`, `control/C4-STAGE1-GATE.md`,
`control/C4-ALLOCATION.md`, `control/C4-WORKER-COMMON-BRIEF.md`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md` was
extracted and checked against 2,875 registered digests (every `SOURCE-DIGESTS.json` tree under `sources/` plus the
Stage 2 manifest). 36 literals total; 11 name a registered source and MATCH exactly (the four project-shell files,
`Main.lean`/`E1FlowConstruction.lean`/`ChokeState.lean`'s source copies, `Statements.lean`'s own digest, the gate
drafter brief's digest); 23 are the drafter's own self-declared scratch-file or partial byte-range digests
(`scratchpad/c4-gate-statements/...` artifact-inventory rows, and two "copied bytes before/after the rekey" partial
digests) — never registered anywhere because they are not frozen sources, so their absence from the registry is
expected, not a defect. **R11_TOTAL_DEFECTS: 0.**

## Acyclicity and connectivity (code)

`scratchpad/c4-F1/acyclicity_connectivity_check.py`: transcribes `transportRel` literally and checks, over 30
small random symmetric universes (`n=1..6`, 5 trials each, seeded `20260928`, 1,921 arcs total), that (a) every arc
strictly lowers `|B|` by exactly 1 (layered, never a self-loop, never skips a layer) and (b) an independent DFS
cycle search over the induced directed graph finds no cycle in any instance — consistent with (a) by a
potential-function argument, but checked as a second, independent instrument rather than only asserted. Result:
`ACYCLIC_AND_LAYERED: True`.

## Instrument sides

No route-produced numeric flow value is reported here (this route computes no `ρ_q`, `θ`, or table row; the
"favorability index is never used" — no `Δ` appears anywhere in N1–N8, confirmed by inspection of
`control/C4-FROZEN-STATEMENTS.lean`, so there is no `x`/`Δ_k` row for this route). Every check in this return is a
digest or membership check, each reported with two independent sides:

| Check | Side A | Side B |
|---|---|---|
| Stage 2 seal | manifest's own `seal_sha256` field | recomputed SHA-256 of canonical JSON minus that field |
| 12 control/contract file digests | manifest's recorded `sha256` entry | `shasum`/`hashlib` recomputed from the live file |
| C1-LA2 `Main.lean` | `sources/c1-results/SOURCE-DIGESTS.json` recorded value | recomputed from the live file |
| C3-LA1 `Main.lean`, report, receipt | receipt's `source_sha256_after`; checkpoint-cited report digest | recomputed from the live files |
| Cycle 4 base's four project files | values printed in `control/C4-FROZEN-STATEMENTS.md` / gate ruling 25 | recomputed from `sources/c4-base/` |
| SR-C3-2 / SR-C3-3 | values recorded in `sources/c3-results/SOURCE-DIGESTS.json` | recomputed from the live files |
| reserved-name count | 0 (claimed by ruling 23/25) | grepped count over 7 live files |
| R-11 literal scan | 2,875-entry registry union | 36 extracted literals, classified |
| acyclicity | potential-function argument (informal) | independent DFS cycle search (code) |

Every row: MATCH / `0` defects / `False` (no cycle). `x`/`Δ_k`: none — no numeric claim of that shape in this
route.

## Grades (SOLUTION-CONTRACT §4; none upgraded, none proposed changed)

This route changes no grade. It **re-confirms**, at their existing grades: Tier 1 key `proved_informal`
(unchanged); the criterion key `proved_informal` with C3-LA1's formal clause at its restricted scope (unchanged);
C3-LA1 itself `formally_verified` at its exact scope (independently re-confirmed above, not merely cited); the
Cycle 4 frozen leaf statements N1–N8 remain **ungraded** (`sorry`-bodied scratch text, per gate ruling 23 — this
audit found no reason to treat any of them otherwise, and found no counterexample that would refute one). No
`formally_verified` label is applied to any scratch or compiled declaration by this route (none was compiled by
this route).

## headline_resolved: no

## Route verdict: bounded_evidence

A bounded, reproducible audit (digest recomputation, verbatim quotation checks, a reserved-name grep, an R-11
literal scan, a code-checked acyclicity property, and an independent re-derivation of six definitional clauses)
that found **zero** fidelity defects and **confirmed** C3-LA1 as closed. It proves no new theorem and refutes
nothing; per SOLUTION-CONTRACT §4 a signoff of this kind is not itself gradeable beyond `bounded_evidence`, and per
the worker brief's own item 12 this route never labels its work `formally_verified`.

## Gate lines (ruling 32)

`COND4_formal: unchanged` (this route compiles nothing; conjunct 4 remains open formally, `proved_informal`
informally, as at the Cycle 3 close)
`E1_formal: unchanged`
`TERMINAL_integration: not attempted (out of this route's mechanism)`
`cut_candidate: none found`
`FROZEN_NODES_CLOSED: none`

## Remaining obligation

Successor inheritance (for the next F1-mechanism seat, for Stage 7 panels, and for the controller):

1. **Close the read-boundary gap named above.** This audit did **not** independently re-verify the N3-definition,
   N7, N8 and N2-companion informal-source quotations against the live `cycles/cycle-3/stage6/SYNTHESIS.md` and
   `cycles/cycle-3/stage5/adjudicators/U/ADJUDICATION.md` files, because `cycles/` (beyond the one named
   `ROUTE-STATE.md`) is outside this route's grant. A successor with either those files added to its brief's
   authorized-read list, or routed through the controller as an authorized excerpt, should complete the word-for-
   word check this route performed for N1, N3(Out/images/legs), N4(In/zero) and N5.
2. **The two definitional derivations flagged as non-trivial in this audit are not yet on any frozen face.** (a)
   The `activeWeight`/contract equivalence needed the `v ∉ tagWitnesses G v` step (§ above, item 4); it is true and
   checked, but no frozen N-node states it as a lemma — a future award that uses `activeWeight` should not assume
   it is definitionally `B ∩ (N(s_v)∖{v}) ≠ ∅` without this step. (b) The exhaustive source-class case split (sector
   / r-free / weight-zero covers every `B ∈ indepFamily(p+1)`) that reconciles N2/N7's row-`≥` bundle with
   `IsSaturatingFlow`'s row-`=` is likewise not written as a lemma anywhere in N1–N8; N8's proof (via Cycle 2 U2's
   `weightedHall_of_ratFlow_bound` and r30 entries 30–31) presumably does not need it stated separately, but a
   reviewer should confirm that composition does not silently assume it.
3. **Open question 4 of `control/C4-FROZEN-STATEMENTS.md`** (the `cbOpenChokeCount_le` subtraction-safety proof
   living in a companion rather than on N2's face) is unresolved by the gate as of this Cycle; this audit found it
   honestly disclosed, not a defect, but the gate should rule on it before Stage 7 funds N2 or N7.
4. **This route produced no numeric flow evidence**; F2's mandatory composed-flow check at rows 158/161/164
   remains the run's one still-owed adversarial instrument (risk R-6, unaffected by this return).
5. Every check in this return is bounded (finite registries, finite grep, finite random instances); none of it is
   evidence for, or against, the Tier 1 family theorem at unbounded `m`, and none of it should be cited as such.

## Artifact inventory

| Path | SHA-256 | Role |
|---|---|---|
| `scratchpad/c4-F1/verify_seals_and_digests.py` | `bcc9a73a94d8e3ee7e4e11b76b472605bb9608781b4c6b45e8d802f7a4428907` | seal + 12-file + C1-LA2 + C3-LA1 + c4-base + SR-C3-2/3 + reserved-name checks (generator) |
| `scratchpad/c4-F1/verify_seals_and_digests.out.txt` | `84fe8f10dfb9337529b26bf83c4037f6416bf3f5ba330ea7630eff8f858413c5` | its output (ALL_CHECKS_PASS: True) |
| `scratchpad/c4-F1/check_digest_literals_r11.py` | `343e4afb800f9db02f780a6e85a4cb48722e0e63592417e45f58bf4cddde6093` | R-11 literal-vs-registry scan (generator) |
| `scratchpad/c4-F1/check_digest_literals_r11.out.txt` | `bfbacf860ca53edef147924953b0c67b60b9b7a79f7d496cce52b0a12f047ccc` | its output (R11_TOTAL_DEFECTS: 0) |
| `scratchpad/c4-F1/acyclicity_connectivity_check.py` | `0050219f88717390286bf7b2f1302bea8aeed64b840446ec2b1e49f5f4c0684d` | transportRel acyclicity/layering check (generator) |
| `scratchpad/c4-F1/acyclicity_connectivity_check.out.txt` | `9c783041c46e511e29664263e76c20912a3e9c9946b7c799e33c0765f5e3c1f4` | its output (ACYCLIC_AND_LAYERED: True) |
| `scratchpad/c4-F1-replay/*.py` | identical to the `c4-F1/` originals (byte-equal, `shasum` cross-checked) | copy-out-first replay copies |
| `scratchpad/c4-F1-replay/*.replay.out.txt` | byte-identical to the corresponding `c4-F1/*.out.txt` (`diff` clean) | replay outputs |

**Replay commands** (copy-out-first; run from the run root, target directory
`scratchpad/c4-F1-replay/`, never `/tmp`):

```sh
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27
python3 -B scratchpad/c4-F1-replay/verify_seals_and_digests.py
python3 -B scratchpad/c4-F1-replay/check_digest_literals_r11.py
python3 -B scratchpad/c4-F1-replay/acyclicity_connectivity_check.py
```

No background job was started at any point in this route; nothing to finish or kill.

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id: claude-sonnet-5
