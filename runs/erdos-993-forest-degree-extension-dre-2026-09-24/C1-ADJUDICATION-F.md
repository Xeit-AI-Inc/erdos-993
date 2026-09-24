# Orientation Adjudication

Stage 5 adjudicator of orientation **F (falsify)**, Cycle 1 of r27 (audit and formalize the finite forest
degree/extension inequality). Portfolio: the returns of seats `F1`, `F2`, `F3` and their six
cross-orientation critiques (`C-F1-T`, `C-F1-U`, `C-F2-T`, `C-F2-U`, `C-F3-T`, `C-F3-U`).

**VerityOS boot acknowledgment.** Operating within VerityOS. Booted by reading EXACTLY the two files the
dispatch authorizes — `/Users/ashtonsperry/VerityOS/verity.md` (root constitution) and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (identity subsystem, startup sequence) — and no
other VerityOS file. The startup protocol's own task-type map into `memory/`, `knowledge/`, `decisions/`,
`operations/`, `logs/`, `conversations/`, `modules/` and `skills/` was **not** followed (the controller
booted for the run). Subsystems loaded: `experiments/` only, at this run root. No read-boundary disclosure
arises from the boot.

**Model disclosure.**
chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

---

## Identity and seal audit

**Capsule seal (required report).** `control/c1-adjudicator-capsules/F-PACKET-MANIFEST.json`: recomputed
SHA-256 over the canonical JSON minus `seal_sha256` (`sort_keys=True`, `separators=(",", ":")`, UTF-8, no
trailing newline) =

```
2a4ae30dec4028c8e249269338231332aff67135d4297e788cfa910e7a6f4c59
```

— identical to the declared inner seal. **MATCH.** `file_count` 24 equals the actual member count; all
**24/24** members verified by SHA-256 **and** byte length against the manifest: zero mismatches
(`scratchpad/c1-adj-F/verify.py`).

**Enclosing manifests, recomputed canonically by my own script.**

| Manifest | Recomputed | Declared | Result | Members |
|---|---|---|---|---|
| `control/C1-STAGE2-PACKET-MANIFEST.json` | `64d142ed1a3beb3dec7eaaa941d5c862c0bd3381ee678f6aa27c5c43850828e7` | same | **MATCH** | 110/110 |
| `control/C1-STAGE3-PACKET-MANIFEST.json` | `8e78cf1f781381b34db629d8e596e36891df1d2346b54b5b805a18e0a1c0164d` | same | **MATCH** | 33/33 |
| `control/C1-STAGE4-PACKET-MANIFEST.json` | `d93b97002be20151…` | same | **MATCH** | 57/57 |

The Stage 2 seal `64d142ed…` is the value every one of my nine portfolio documents quotes, and it is the
value recorded as `source_seal` in `control/C1-STAGE3-ADMISSION.json`. The Stage 4 **dispatch** manifest
seal `dc9daaa2…` quoted by all six critics is a different object from the Stage 4 **packet** manifest and is
not a member of my capsule; I did not open it, and nothing here rests on it.

**Admission records.** Stage 3 admitted 9/9 with exactly one visible exception, and it is in my orientation:
`MISSING_IMPORT_LIST` against **F3** (its generator's modules are named in prose at the instrument section,
not under a literal heading; controller ruled "visible, not silent"). `C-F3-U` independently raised the same
point as a hygiene note — concordant with the controller record, and correctly not a verdict driver. Stage 4
admitted 18/18, `finding_count: 0`; in my orientation `C-F1-T` is `retained` and the other five are
`retained_narrowed`. Stage 3 read-boundary disclosures record an item for **F2** (its two drafting-slip
findings; controller: "not a read-boundary item; erratum recorded") and **none** for F1 or F3 — consistent
with both returns' claims. Stage 4 disclosures record an authorized item for `C-F2-U` (three exact-path
reads and four greps inside the pinned Mathlib package directory, for API meaning) and record `C-F1-T`,
`C-F1-U`, `C-F3-T`, `C-F3-U` as declaring none.

**Controller facts record** (`control/C1-STAGE5-CONTROLLER-FACTS-F.json`), weighed as one more replay and
not as authority. Errata R27-E-a (r26 residue in the sealed worker brief), R27-E-b (the "tight cases"
mislabel in `SEMANTIC-CONTRACT.md` §4) and R27-E-c (the refuted-mechanism key name) are all corroborated
within my portfolio: F2 caught R27-E-a unprompted and pre-erratum, and I confirm `C-F2-T`'s verification of
it; R27-E-b is not merely corroborated but **upgraded to a theorem** by my portfolio (see Established
results, item 3) — the §4 line has no instances at all on forests at `k ≥ 1` with `i_k > 0`. R27-E-c does not
reach this orientation. The record's Gate-ruling-10 fact (an r27 census replay is this run's figure at its
attained horizon) governs every census figure I sustain below.

**Registry literal.** `control/CLAIM-IDENTITY.run-local.json` is **not** a member of my capsule and was not
read. F1's per-key status readings and F3's ten-key re-queries are therefore attested by their critics
(`C-F3-T` and `C-F3-U` each re-queried the registry by exact `claim_key` from their own grants and report no
misquotation) but are not re-read by me. **No lexical or mathematical alias check can be run from my
grant**; the synthesis owes one before any `E993-R27-…` key below is registered.

**My own reads.** The two boot files; the 24 capsule members; under the authorized run-root `sources/`:
`external/STATIC-SCAN.json`, `external/repository-tree.json`, `external/paper/section8-extracted.txt`, the
nine frozen `.lean` files, and `r25/c4-T4-census/{search_report_n18,n19,n20,n21,closure_certificate}.json`;
and one exact-path read of `Mathlib/Algebra/Polynomial/Coeff.lean` inside the pinned shared Mathlib package
directory for API meaning (the same grant `C-F2-U` used and the controller ruled within grant). No `find`,
no `rg`, no `ls -R`, no glob `cat`, no listing rooted above my grant; every path was exact. I read no other
orientation's portfolio, no other adjudication, no prior synthesis, no other experiment root, and no
external source beyond the frozen `sources/`. No network, no installs, no Lean build.

---

## Route-by-route decisions

### F1 — `C1-F-01 DEGREE-EXTENSION-FALSIFICATION-CENSUS`

**Decision: retained, narrowed in emphasis, and superseded upward by its own critics.** The route did what
it was chartered to do — exhaustive census to order 14 (15,206 isomorphism classes), 45 adversarial
instances to order 120, 41 non-forest graphs — and found zero counterexamples to (DL)/(EX)/(LB)/(XR). Both
critics replayed its eight scripts copy-out-first and reproduced **every** payload digest bit-for-bit, and
both built wholly disjoint instruments that agree with it on every number. Its two disclosed bugs (the
convolution-for-addition DP error; the recursion-depth restructuring) were caught by its own cross-checks
before any reported number was produced, and both critics corroborate the fix. The route's certification
literals are backed, with the exceptions listed under Rejected and narrowed mechanisms.

The route's **route verdict** `bounded_evidence` was correct for what the seat shipped. It is no longer the
state of the orientation: the two null results F1 graded `bounded_computation` are theorems, and the proof
that makes them theorems also proves (DL) itself.

Paired-critic disagreements, resolved claim by claim:

| Claim | `C-F1-T` | `C-F1-U` | My ruling |
|---|---|---|---|
| "acyclicity is load-bearing" as F1 states it | not addressed | narrowed: plain (DL) does **not** separate forests from unicyclic graphs — every cycle `C_n` has all degrees 2, so `D_k = 2k·i_k` at **every** `k`; the fence F1 certifies is `\|E\| ≤ n`, weaker than acyclicity | **`C-F1-U` sustained.** Verified independently: the statement equivalent to acyclicity is the **root-corrected** form, which at `k = 1` reads `\|E\| ≤ n − c`. This is the strongest correction to F1's return. |
| smallest non-forest failure | `K₄`, agreeing with F1 | narrowed: `K₄` is **order**-minimal only; the **edge**-minimal witness is `K₄ − e` (diamond), `n = 4`, `\|E\| = 5`, `i = [1,4,1]`, `D_1 = 10 > 8` | **`C-F1-U` sustained.** I verified the diamond's values directly. F1's own `\|E\| > n` characterization predicts it; the witness list, not the characterization, was incomplete. Read "order-smallest among the 41 graphs tested"; the edge-minimal witness of record is `K₄ − e`. |
| grade literal "**proved**" | "the seat's own `proved` grades hold up" (content) | STRUCK as written: "proved" is not in `SOLUTION-CONTRACT.md` §4's vocabulary | **Both sustained, on different objects.** The content is correct (I re-derived both arguments); the literal is replaced by `proved_informal`. No content falls. |
| the tight-case null | Finding 1: it is a theorem | finding 2: it is a theorem, forced, slack ≥ 2 | **Concordant; sustained** (see Established results). |
| unicyclic horizon | exhaustive to order 12, **46,745** graphs, 0 failures | exhaustive to order 12, **46,745** graphs, plus 31,892 disconnected one-cycle graphs to order 11 and all graphs with `\|E\| ≤ n` to order 7 (232,308 total), 0 failures | **Concordant and mutually corroborating** — two independent instruments returning the same population size 46,745. Still `bounded_computation`; no theorem. |
| census horizon | order 15 count 20,514 confirmed analytically (Otter + Euler); no census run | full checked census at orders 15 and 16 (20,514 and 49,905 classes), 0 violations | **Both sustained.** Order 15's *count* has two instruments; order 16's *count* is corroborated across routes (see Cross-route reconciliation); the *property* layer at 15–16 is single-instrument and must be cited as such, exactly as `C-F1-U` itself asks in its obligation 5. |

### F2 — `C1-F-02 EXTERNAL-LEAN-SLICE-AUDIT`

**Decision: retained in substance, heavily narrowed in bookkeeping; the audit record is rewritten below and
is therefore STATED at Stage 5.** Every load-bearing conclusion survives two independent re-derivations and
my own: statement fidelity of `sum_degOn_le` to (DL) and `prefix_ratio` to (EX) at `S = univ`, the
`[DecidableRel G.Adj]` bridge requirement, the ℕ-truncation caveat, the double count and the `e(J)` bound,
the absence of `sorry`/`admit`/`axiom`/`native_decide`/`unsafe`, the five `decide` hits and their exclusion
from both targets, the absence of any excluded **project** module from either closure, the toolchain/pin
divergence, and the LICENSE absence in the frozen copy **and** in the upstream tree. I re-verified all of
these directly from the frozen artifacts, by exact path, with my own scanner. Its route verdict
`bounded_evidence` and its uniform grade **record** are correct for its object, and its unprompted,
pre-erratum catch of both worker-brief drafting slips (R27-E-a) is credited.

What fails is a band of certification literals in the audit's own bookkeeping. Paired-critic resolutions:

| Claim | `C-F2-T` | `C-F2-U` | My ruling |
|---|---|---|---|
| "three of the 9 frozen files import a module not in the slice" | **struck** — four do; `Basic.lean:47` is `import Mathlib`, recorded in F2's own shipped `file_imports` but filtered out of the field its prose quotes | **struck**, same finding, independently | **Concordant; sustained on my own evidence.** My import walk returns `Basic.lean -> ['Mathlib']`. "Three" is struck; "a genuinely self-contained finite slice" is narrowed to "reaches no excluded **project** module". The slice therefore offers **no** signal about a minimal Mathlib import footprint — the fact the successor needs, and the one F2 omitted. |
| citation-closure sizes | 110 / 119 (comment-stripped, dotted projections resolved) | 124 / 133 (comment-stripped) | **Neither is registrable, and F2's 132/140 least of all.** Three instruments give three answers; a fourth (mine) gives yet another declaration grammar. The counts are demonstrably instrument artifacts. **Strike every closure size from the record**; carry the structural finding only (`{Basic, Components, DegreeLemma, Extensions, Recursion}`, plus `Ends`; no excluded project module; no `decide`-bearing declaration cited). `C-F2-U`'s further strike of the label "**proof-term** closure" is sustained: nothing was built and `#print axioms` was never run, so no proof-term statement is backed — and Gate ruling 3 makes it permanently unavailable for this source. |
| declaration census "191" | **struck** — 192; `structure JoinAt` is invisible to F2's `theorem/lemma/def` grammar | not addressed | **`C-F2-T` sustained on the structural point, its number not registrable.** My own parse reproduces the *exact* difference — the only top-level declaration visible to the full grammar but not to `theorem/lemma/def` is `structure JoinAt` in `DegreeLemma.lean` — while returning different absolute totals again. Register the structural fact, never a count. |
| the `decide` exclusion | upheld and **re-argued** without a citation graph: `Ends.lean` imports `DegreeLemma`, so no `Ends` declaration can be a dependency of `sum_degOn_le`; and `prefix_ratio` (`Ends.lean:43`) precedes `isBipartiteOn_of_isAcyclic` (`:124`) in the same file, so declaration order excludes it. `card_le_two_mul_alpha` carries no attribute, so no tactic reaches it unless cited | upheld on the citation graph | **`C-F2-T`'s argument sustained and adopted.** I verified every line number and the import direction directly; the order argument is airtight and does not depend on any instrument. This is the correct warrant for the record. |
| Mathlib API drift | **A2, critic-derived:** `Polynomial.finset_sum_coeff` is a **deprecated alias** under the run's pin, used at `DegreeLemma.lean:123, 141, 181` inside `vpoly_coeff` — on the (DL) path | A10: `card_nbij'`, `coloringTwo`, `le_tsub_add` confirmed present; rest untested | **Concordant where they overlap; `C-F2-T`'s drift finding sustained on my own reading.** `Mathlib/Algebra/Polynomial/Coeff.lean:93` reads `@[deprecated (since := "2026-04-08")] alias finset_sum_coeff := finsetSum_coeff`; the current name is `Polynomial.finsetSum_coeff`, and the three uses are exactly where `C-F2-T` places them. **This is the single most operationally valuable finding in my orientation for Stage 7**, and it lands squarely on the module `C1-U-02` must rebuild. F2's deferral of this check, and its "~3-year-newer Mathlib" cost basis, are struck (three Lean minor releases; the check took one pass of one instrument, no build). |
| the ℕ/ℤ link at `i_k = 0` | A7: the strict step `n·i_k < 3k·i_k` fails at `i_k = 0`; holds with `≤` | A4: same finding, same repair | **Concordant; sustained.** No substantive claim falls, but the chain as certified fails at exactly the degenerate index the contract flags, in a paragraph whose whole subject is degenerate-regime bookkeeping. |
| the transport obligation | leaves F2's "needs the same case split" standing | **A5, critic-derived:** a three-step, case-split-free ℕ transport via `le_tsub_add` | **`C-F2-U` sustained on the arithmetic, and narrowed further by me.** The chain `n·i_k ≤ ((n−3k)+3k)·i_k = (n−3k)i_k + 3k·i_k ≤ (k+1)i_{k+1} + 3k·i_k` is correct. But its practical value is smaller than stated: the run's own (EX) is stated subtraction-free/in ℤ at `SOLUTION-CONTRACT.md` §2, and Gate ruling 3 forbids carrying the external text at all, so **no transport of `prefix_ratio` is needed by any route of this run**. Carry A5 as a proof pattern, not as an obligation. |
| the `(8.8)` pointer | **A5, critic-derived:** `SEMANTIC-CONTRACT.md` §3 and `C1-ALLOCATION.md` item 5(b) point (EX) at (8.8), but (8.8) is Proposition 8.2's *conclusion*; (EX) is the unnumbered ratio display inside its proof; the double count is **(8.1)** | not addressed | **Sustained on my own reading of the frozen §8 text.** (8.1) is the double-counting identity; (8.3) is the expectation form `𝔼Σ d_F(v) ≤ 2k`, stated only for `0 ≤ k ≤ α(F)`; (8.8) is `i_0 ≤ i_1 ≤ ⋯ ≤ i_{⌈n/4⌉}`, whose Lean analogue is `icoeff_le_icoeff_succ`/`monotoneOn_icoeff_prefix` (`Ends.lean:65, 77`), **not** `prefix_ratio`. A packet record correction is owed. |
| "term by term … agree exactly" for (8.4)–(8.5) vs the one-child join | not addressed | **A7: struck** — different-shaped objects (multi-child products vs a single-edge join), warranted only by the source's own comment, which Gate ruling 2 bars as evidence; supplies the `m = 1` verification and leaves the general iteration open | **`C-F2-U` sustained; this is the strongest correction to F2.** A fidelity audit that certifies an equivalence on the audited source's own comment has certified nothing. The `m = 1` specialization is critic-derived and correct; the multi-child iteration is open and belongs to T1/U2. |
| "acyclicity consumed exactly once per component" | not addressed | A8: also at every child attachment | **`C-F2-U` sustained** as a narrowing; the hypothesis-tracing conclusion stands, the counting literal does not. |
| "definitionally the same cardinality" (`icoeff` vs `indepCount`) | struck | struck (self-cancelling with F2's own next clause) | **Concordant; sustained.** Read "equal in value, by a transport lemma the slice does not contain". |
| `STATIC-SCAN.json`'s `lean_files: 19` | **narrowed** — 19 is *correct* for the repository; the defect is undeclared **scope** | endorses F2's "needs correcting or a scoped note" | **`C-F2-T` sustained.** I read the artifact (`{"static_scan_only": true, "not_built": true, "lean_files": 19, "tokens_excluding_comments": []}`) and counted 19 distinct `.lean` blobs in `repository-tree.json`. F2's "genuine record correction to the file count" is **struck**; the record is unscoped, not wrong. The **token** correction stands under the controller's own characterization in `C1-ALLOCATION.md` item 5(c), and is false for `decide` for any file set containing the frozen nine. |
| "earlier arXiv revision" as the cause of the 6.1/6.2 vs 8.1/8.2 drift | not addressed | **A6: struck** — the frozen copy is v1, the first revision | **`C-F2-U` sustained.** Record the drift (I confirmed: zero occurrences of "Lemma 6.1"/"Proposition 6.2" in the frozen §8; one each of "Lemma 8.1"/"Proposition 8.2"); strike the causal story. Cite the paper's current numbering. |
| quotation hygiene | — | A11: F2 quotes a *proof* line (`Ends.lean:60`) where the grant licenses "at most a declaration's statement line" | **Sustained as de minimis, and extended.** `C-F2-T` reproduces the same tactic block in its own text — neither critic could see the other. Nothing was copied into any project and Gate ruling 3's substance is intact, but **three** documents of my portfolio now carry the quotation. This adjudication restates the point by line reference only and **does not propagate it**; the synthesis should do the same. |

### F3 — `C1-F-03 RANK5-RESIDUE-AND-K1-ADDITION-RECONSTRUCTION`

**Decision: retained; its composition is sound and, at this orientation's evidence, its condition is now
discharged. Narrowed on four certification literals, one novelty framing, one citation, one coverage gap;
one hygiene charge brought by both critics is NOT sustained.** Both critics re-derived the reduction
identity `Δ_j(G ⊔ K₁) = i_{j+1}(G) − i_{j−1}(G)` from the disjoint-union generating function and confirmed
NR1-sufficiency; both re-queried the registry key by key and report no misquotation; both replayed the
seat's generator copy-out-first and regenerated `census_report_n21.json` and `census_report_n22.json`
byte-identically; and both independently confirm the new order-22 figures 13,184,156 / 21,539,987.

| Claim | `C-F3-T` | `C-F3-U` | My ruling |
|---|---|---|---|
| §3 "what the closure at rank `x` needs: **exactly** this one inequality" | F-1: sufficient, not necessary; gives the second route via `Δ_x(G⊔K₁) = i_{x+1} − i_{x−1}` | finding 1: same, with an **exact witness** `K₁₅ ∨ \overline{K₆}`, `i = (1,21,15,20,15,6,1)`, `x = 1`, `Δ_2 = +5 > 0`, yet `x(G ⊔ K₁) = 2` | **Concordant; sustained, with `C-F3-U`'s witness verified by me** (independent sets of that join are subsets of the co-clique or single clique vertices, giving exactly that sequence). Strike "exactly … needs"; read "suffices". `C-F3-U`'s further point is confirmed on my own reading of the frozen artifact: the conflation is **inherited** — `search_report_n21.json`'s own `claim_checked` string says "*equivalently* NR1". A scope note is owed on the r25 artifact's phrasing, not on F3. The witness is a non-forest and is correctly labelled a wording fence, not a counterexample. |
| the composition's real premise | F-2: §6 replays census **counts**; §7 leans on census **content**, unreplayed. Discharges it himself for orders ≤ 19 (1,291,315 classes), leaving **order 20** residual on the frozen r25 census | finding 3 (citation slippage) + obligation 1: re-runs the **property** census — `x(G)`, `x(G⊔K₁)`, the reduction identity, (DL), (EX), (LB), (R5), the double count, the `e(J)` bound — on **every** class of order ≤ **20** (3,269,193), zero violations | **Both sustained; `C-F3-U`'s horizon supersedes `C-F3-T`'s residual.** This is the central reconciliation of the F3 route and neither critic could make it: the census dependency of the `x ≤ 5` closure is re-verified in-run **to order 19 by two independent r27 instruments** and **to order 20 by one**, and both reproduce the frozen r25 first-descent histograms digit for digit at orders 10, 16, 18, 19 and 20. `C-F3-T`'s "order 20 residual" is discharged by `C-F3-U`. F3's §7 bracket must re-point from its own §6 to `sources/r25/c4-T4-census/search_report_n21.json` **and** to the two critic replays. |
| the composition's **grade** | F-8: matches the contract | finding 6: F3's lattice step is wrong — it assigns `proved_informal`, strictly **above** its own named weakest input (`bounded_computation`) — though it lands on the contract's own label; repair by citing `SEMANTIC-CONTRACT.md` §2 and **Gate ruling 6**, which F3 read but never cites | **`C-F3-U` sustained.** Strike the derivation, keep the label. The grade of record is `proved_informal`-with-census (the contract's own term, because an exhaustive check over a *provably covering* finite population is a complete case analysis), it carries the census on its face, it is **never** `formally_verified`, and no formal grade on (LB) or (R5) may promote it — Gate ruling 6 and fence §3.4. |
| "**Key finding**: (R5) is literally (LB) at `k = 5`" | "the return's headline observation is correct" | finding 2: correct but **dispatch-derived** — `SEMANTIC-CONTRACT.md` §2 derives (R5) from (LB) in the same line, and `C1-ALLOCATION.md` item 6(e) states the composition verbatim | **`C-F3-U` sustained on attribution; `C-F3-T` sustained on the mathematics.** I confirmed the packet text. Downgrade "Key finding"/"identifies" to "restates and correctly executes the packet's own derivation chain". The arithmetic `4·5 = 20` and the composition are right; the novelty is not F3's. |
| "all thirteen files" under `c4-T4-census/` | struck: 19 | struck: 19 | **Concordant; sustained on my own count** — `control/SOURCE-DIGESTS.json` lists **19** entries under that path. |
| "All **34** checked files matched" | struck: the table enumerates 29 by its own arithmetic | struck: 29 rows, but the true set under those paths is 35; "neither total is 34" | **Both right about different objects; reconciled.** `SOURCE-DIGESTS.json` holds 14 + 19 + 2 = **35** files under the three paths F3 names; F3's table enumerates 29 rows because it under-lists the census directory by six. Strike "34"; the correct literals are "35 files under the three paths; the shipped table lists 29 rows". The underlying verification is sound — `C-F3-U` re-verified 36 digests with zero mismatches. |
| four shipped digests unreproducible | **struck, new finding:** `census_report_n{17,18,19,20}.json` are **not** regenerable from the shipped `forestcensus.py` — they were written by the pre-efficiency-fix version; divergence is confined to the vestigial `rooted_tree_counts_1_to_max` field, every substantive field identical | verified digests on disk; replayed only `n21`/`n22` | **`C-F3-T` sustained.** F3 disclosed the efficiency fix but not that it orphaned four of its own digests. Those four digests are struck as *evidence*; their substantive contents stand (both critics reproduce the counts independently). `n21` and `n22` regenerate byte-identically under **both** critics and stand in full. The field name `rooted_tree_counts_1_to_max` is a mislabel in the post-fix reports (11 entries at `max_n = 22`) — concordant between the critics, sustained, cosmetic. |
| "**every** canonical tree … checked with a union-find" | not addressed | certification 3: **struck** — the generator checks `free[n][:5]`/`forests[n][:5]` for `n ≤ 10`; the shipped JSON's own `self_test` field says "**75 sampled**", which F3's own next sentence concedes | **`C-F3-U` sustained.** Strike "every"; the backed literal is "75 sampled objects across orders 1–10". The substance is covered elsewhere: `C-F3-U`'s instrument B materializes and structurally checks every class to order 20, and my own instrument certifies acyclicity by union-find on **every** labelled forest it enumerates. |
| `ps aux \| grep forestcensus` | F-9: a full process listing; offered for a controller disclosure ruling | certification 4: "a process-discipline breach to record" | **NOT SUSTAINED as a breach.** Both critics agreed with each other and both applied the wrong rule. `control/C1-STAGE4-READ-BOUNDARY-DISCLOSURES.json` records the controller's ruling: the worker brief that bound F3 forbids only a self-matching `pgrep -f`, while the PID-only/no-listing rule binds critics and wrappers; "seats F3 and U3 used `ps aux \| grep` … **compliant with their rule, not charged**", and both texts are aligned in the Cycle 2 briefs. Neither critic could have seen that record. F3's **kill** was independently correct in any case: `kill -15` on the literal PID 96655 with a `ps -p` exit confirmation, no pattern kill. Recorded as a rule-text inconsistency, **not** as a finding against the seat. |
| order 0 / the empty forest | not addressed | finding 7: the frozen census population is orders **1–21**; the closure needs the empty forest handled outside it | **`C-F3-U` sustained on the gap, narrowed by me on the discharge.** `search_report_n21.json`'s `forests_checked_by_order` does start at "1". But `sources/r25/c4-T4-census/closure_certificate.json` closes rank **0** explicitly (`total_forests_with_this_x: 1`, `order_bound: 0`, `all_satisfy_y_le_x_plus_1: true`) — the empty forest is certified there, not left uncovered. The registered statement must nevertheless **say where order 0 is covered**; F3's draft does not. |
| the `x ≤ 6` price | F-6: orders ≤ 24 = 146,271,593 classes, 17.5× the r25 census | finding 5: the "resource cliff" is instrument-specific — counting is milliseconds by Otter/Euler; the real cost is evaluating ~146 million classes | **Concordant on the number (both give 146,271,593), `C-F3-U` correct on the diagnosis.** Re-price F3's successor debt: the bottleneck is per-class evaluation, not enumeration. |
| order-22 novelty | instrument 1 confirms the count | finding 4: F3's generator **hard-codes** A000055 to `n = 25` and A000081 to `n = 20` and asserts against them, so at orders 15–22 the free-tree layer is checked against a constant in the script; the genuinely constructed new number is the forest multiset assembly | **`C-F3-U` sustained; the figure survives.** Both critics derive the free-tree counts independently (Otter's recurrence; constructive enumeration) and agree. Narrow the framing, keep the number. |

---

## Cross-route reconciliation

Six findings that no single seat or critic in my portfolio could reach, because each was isolated from the
others. These are the substantive product of this adjudication.

**1. The condition on F3's composition is discharged inside my own orientation.** `C-F3-T` and `C-F3-U` both
grade the `x ≤ 5` closure **conditional on (LB)**, which F3 explicitly does not prove and expects from
T1/T2/T3. But `C-F1-T`'s injection proves (DL) outright, and (EX) → (LB) → (R5) follows by elementary steps
I verify below. **At this orientation's evidence the `x ≤ 5` K1-addition closure is unconditional**, at grade
`proved_informal`-with-census, with no input from the T or U orientations. F3's own "Remaining obligation"
item 1 anticipated exactly this event and named the trigger as Cycle 1's synthesis; the trigger fired one
stage earlier and inside orientation F.

**2. `C-F1-U`'s (SH) and (EXS) are no longer conditional.** `C-F1-U` graded them "`conditional` on the
root-corrected (DL) for `k ≥ 2`". `C-F1-T` proves precisely that statement, unconditionally, for every `k`
and every root choice. Since the root-corrected inequality holds for **every** choice of one root per
component, maximizing component by component gives `M_k = Σ_{components} max_v a_v(k)` and hence (SH)
directly. The two critics converged on the same strengthened object from opposite directions — `C-F1-T` with
a proof and a weaker correction term, `C-F1-U` with the sharp correction term and a computational
verification — and neither knew it.

**3. `C-F3-T`'s F-4 sharpening has its census input independently replayed.** `C-F3-T` derives `Δ_5 < 0 ⇒
n ≤ 18`, sharp (9,532 witnessing order-18 classes), resting on the frozen r25 cumulative histograms at
orders 19–21 showing the `x = 5` stratum constant. `C-F3-U`'s instrument B reproduces exactly those
histograms to order 20 from an in-run instrument. I verified the frozen artifacts directly: the `x = 5`
count is **107,443 at `n18`, `n19`, `n20` and `n21` alike**, so no forest of order 19, 20 or 21 has `x = 5`.
F-4's census input is therefore replayed in-run, not merely cited. F-4 remains bounded computation +
conditional on (LB) for the `n ≥ 21` tail, is STATED and needs an isolated second read, and — as `C-F3-T`
says — changes nothing downstream, since `n ≤ 20` already sits inside the census horizon.

**4. The order-16 census population is corroborated across routes.** `C-F1-U` reports cumulative 85,625
forest classes to order 16 with a full property census. `C-F3-U`'s independent order-16 first-descent
histogram sums to 85,624 — the same population minus the empty forest, which carries `x = 0` and is excluded
from an `x ≥ 1` histogram. `C-F1-T` confirms order 15's 20,514 analytically, and 15,206 + 20,514 + 49,905 =
85,625 closes the arithmetic. Two routes, three instruments, one population.

**5. Three independent instruments give three different declaration/closure counts for the external slice**
(F2: 191 declarations, 132/140 closures; `C-F2-T`: 192, 110/119; `C-F2-U`: 124/133; mine: a fourth grammar
again). This settles the question the critics could only argue: **no count is registrable**, and the record
must carry the structural facts only. The critics agree exactly where it matters — the excluded analytic
modules are unreachable and no `decide`-bearing declaration is cited from either target — and `C-F2-T`'s
import-order argument establishes that without any count at all.

**6. The de minimis over-quotation is portfolio-wide, not seat-specific.** `C-F2-U` charges F2 with quoting
a proof tactic line beyond the "declaration statement line" licence. `C-F2-T` quotes the same block. Neither
could see the other. Gate ruling 3's substance is untouched — nothing entered any Lean project, nothing was
published — but the correct instruction to the synthesis is to stop propagating it, not to charge one seat.

**Two facts about the portfolio as a whole.** (i) **My orientation built no Lean.** F1 read nothing under
`sources/` at all; F2 audited external Lean and explicitly built nothing, ran no `elan`, replayed no
`#print axioms`; F3 touched no Lean; no critic compiled anything. Orientation F therefore contributes
**zero compiled fragments** to Lean readiness — that is entirely the U orientation's product. (ii) **The
`scratchpad/c1-<seat>-replay/` directories of F1, F2 and F3 remain unaudited by design**: the critic replay
grant names `scratchpad/c1-<seat>/`, and the Stage 4 disclosures record this as a known rule-text
inconsistency, aligned for Cycle 2. Every critic regenerated from the primary directory instead, which
supersedes the seats' self-reported byte-identity claims. Those claims are neither backed nor struck; they
are simply not the evidence of record.

---

## Established results

Graded per `SOLUTION-CONTRACT.md` §4. **Every item below that originates with a critic is critic-attributed
and is STATED at a review stage; none may be registered before an isolated second read.** My own
verification is an adjudicator replay and does **not** substitute for that second read.

**1. (DL) — the forest degree lemma — has a complete, correct, elementary proof in this orientation.**
Grade `proved_informal`; **critic-derived, attributed to `C-F1-T`** (r27 Cycle 1); the mathematics of (DL)
attributed to Fang–Lu–Nevo–Yao–Zheng 2026 §8 per fence §3.7.

Statement proved, stronger than (DL) — the **root-corrected degree lemma (RC)**: for every finite forest
`G`, every `k ∈ ℕ`, and **every** choice of one root `r_i` per component,

```
D_k(G) + 2 · Σ_i a_{r_i}(k)  ≤  2k · i_k(G),        a_v(k) := #{J ∈ I_k(G) : v ∈ J}
```

whence (DL) `D_k ≤ 2k·i_k` since `a_v ≥ 0`. Its dependency DAG, closed, node by node:
(i) `Σ_v a_v(k) = k·i_k` (incidence count);
(ii) `D_k = Σ_v deg(v)·a_v(k) = Σ_{uv ∈ E}(a_u + a_v)`;
(iii) rooting each component, the edges are in bijection with the non-root vertices, so
`D_k = Σ_{v non-root}(a_v + a_{p(v)})` — **first use of acyclicity**;
(iv) `N(v) = {p(v)} ∪ children(v)` — **second use of acyclicity**;
(v) the injection `Φ : S → T`, `S = {(v,J) : v non-root, J ∈ I_k, p(v) ∈ J}`,
`T = {(u,K) : u non-root, K ∈ I_k, u ∈ K}`, with the type-A/type-B split and the invariant that a type-A
image has `p(p(u)) ∉ K` while a type-B image has `p(p(u)) ∈ K` — which forces the preimage and gives
injectivity;
(vi) `|S| ≤ |T|`, i.e. `Σ_{non-root} a_{p(v)} ≤ Σ_{non-root} a_v`, and substitution into (iii).

**I verified this proof line by line and found it correct**, including well-definedness in both branches
(in type A, `v ∉ J` because `v ~ p(v) ∈ J`; the only new adjacency risk is at `v`, whose neighbours are
`p(v)`, deleted, and its children, none in `J` by the case hypothesis) and the edge cases `k = 0`, `k > α`,
the empty forest, disconnected forests, and every choice of roots. I then **machine-checked it with my own
instrument** (`scratchpad/c1-adj-F/adj_verify.py`, standard library only, foreground): every **labelled**
forest on `n ≤ 7` vertices — that is every acyclic edge subset of `K_n`, **40,233** forests, counts
`1,1,2,7,38,291,2932,36961` — at every `k`, under **every** choice of one root per component, checking (RC),
(SH), (DL), strictness, the double count, the per-set `e(J)` bound, (EX), (EXS), (LB), (XR), the two `D_k`
identities, the edge↔non-root bijection, **and the injection `Φ` pair by pair for well-definedness and
collisions**: **0 failures**. `C-F1-T`'s own `t_injection.py` reports the same over 356,703 mapped source
pairs to order 10.

The statement `Σ_{J ∈ I_k}(2k − Σ_{v∈J} deg(v) − 2Σ_i 1{r_i ∈ J}) ≥ 0` that `C1-ALLOCATION.md` item 1 asks
T1 to reach by coefficient extraction from `D_T` is obtained here directly, per coefficient, in three lines
and with no polynomial machinery. Reading the frozen §8 text, **it is verbatim the paper's own displayed
step immediately preceding (8.8)**, and (8.2) is the `D_T` whose nonnegativity encodes it — yet `C-F1-T`
states, and its read list corroborates, that it read neither the paper nor any external Lean text. An in-run
derivation that lands on the source's own strengthened intermediate by a disjoint mechanism is the strongest
fidelity evidence this run has produced, and it is Gate-ruling-2 clean: the external text is not the warrant.

**2. (SH) and (EXS), critic-derived, attributed jointly** — the correction term, the `k = 1` exactness, the
acyclicity equivalence and (EXS) to `C-F1-U`; the proof that discharges them to `C-F1-T`. With
`M_k := Σ_{components T} max_{v ∈ T} a_v(k)`:

```
(SH)   D_k + 2·M_k ≤ 2k·i_k                      grade proved_informal (was conditional; discharged)
(EXS)  (k+1)·i_{k+1} ≥ (n − 3k)·i_k + 2·M_k       grade proved_informal, modulo the double count (below)
```

(SH) follows from (RC) because (RC) holds at every root choice and the choices are independent across
components. At `k = 1`, `a_v(1) = 1` for every vertex, so `M_1 = c` and (SH) reads `|E| ≤ n − c` — an
**identity** on forests and, on an arbitrary finite graph, **equivalent to acyclicity**. Verified with 0
violations by my instrument on all 40,233 labelled forests and on 25 structured instances to order 120
(paths, stars to `K_{1,119}`, spiders, caterpillars, combs, complete binary trees, edgeless, `30K₂`, mixed
unions, five LCG-random forests), and by `C-F1-U` to order 16 and on 47 families to order 200.

**`C-F1-U`'s honest limit is sustained: (EXS) does not improve (LB).** `Δ_k < 0` still yields only `n ≤ 4k`;
the sharpened form adds only the side condition `i_k > 2M_k` at `n = 4k`. No order bound of record is
strengthened.

**3. Strictness — F1's null result is a theorem, and erratum R27-E-b is upgraded.** For every finite forest,
every `k ≥ 1` with `i_k > 0`: `2k·i_k − D_k ≥ 2·M_k ≥ 2`, with **exact** slack `2c` at `k = 1`. Hence
**(DL) is never tight on a finite forest except at the two degeneracies `k = 0` and `i_k = 0`**, and the
same holds for (EX). F1's order-≤14 and order-≤120 nulls were not artifacts of a horizon. The bound 2 is
sharp (any tree at `k = 1`). `SEMANTIC-CONTRACT.md` §4's "(DL) tight cases (e.g. edgeless forests …; single
edges)" therefore has **no instances at all** on forests at `k ≥ 1` with `i_k > 0` — the fixed-point *values*
are right, the label is empty. Both critics reached this; my instrument confirms slack ≥ 2 everywhere and
`= 2c` at `k = 1` with 0 exceptions. Grade `proved_informal`, critic-attributed (both).

**4. (EX), (LB), (R5), (XR) at this orientation's evidence.** From (DL) plus two universal facts:
`e(J) ≥ n − k − Σ_{v∈J} deg(v)` for **any** finite graph (union bound `N[J] ⊆ J ∪ ⋃_{v∈J} N(v)`; proved by
F1, re-derived by both critics, regraded `proved_informal`, verified per set by my instrument on every
labelled forest to order 7) and the double count `(k+1)·i_{k+1} = Σ_{J ∈ I_k} e(J)`, we get

```
(k+1)·i_{k+1} = Σ_J e(J) ≥ (n−k)·i_k − D_k ≥ (n−3k)·i_k        → (EX)
Δ_k < 0 ⇒ i_k > 0 and (k+1)i_k > (k+1)i_{k+1} ≥ (n−3k)i_k ⇒ n ≤ 4k    → (LB)
(LB) at k = 5                                                   → (R5)
(LB) at k = x(G) ≤ r−1, with r ≥ 1 forced by x < r              → (XR), n ≤ 4r−4
```

`k = 0` is consistent throughout (`Δ_0 < 0 ⟺ n = 0`, and `n ≤ 0` holds). Grade `proved_informal`.

**The one node my orientation asserts but does not write out is the double count.** `C-F1-T` invokes it;
F1, `C-F1-U`, `C-F3-T`, `C-F3-U` and my own instrument verify it exhaustively (0 mismatches on every
labelled forest to order 7, on every isomorphism class to order 14/16/20 across three routes, brute-forced
set by set to order 9/10, and on 25 large instances); nobody in orientation F proves it at statement-level
granularity. It is a two-line bijection between pairs `(J, v)` with `J ∈ I_k`, `v ∉ N[J]` and pairs
`(K, u)` with `K ∈ I_{k+1}`, `u ∈ K`, it needs no acyclicity, and it is the chartered object of `C1-T-03`
and `C1-U-03`. **Naming it is the exact remaining obligation of this orientation for (EX).** I record that
I checked its correctness; that is a verification note, not a new claim, and the run's record should carry
T3's or U3's written proof.

**5. The `x ≤ 5` K1-addition closure** — `SOLUTION-CONTRACT.md` Tier 3 `E993-R27-KADDITION-CLOSURE-X-LE-5`.
Statement: `x(G ⊔ K₁) ≤ x(G) + 1` for every finite forest `G` with `x(G) ≤ 5`.

Evidence line, as it must be stated (F3's own draft must be rewritten to this):
(i) (LB) at `k = 5`, i.e. (R5): `x(G) = 5 ⇒ n ≤ 20` — now established at this orientation, no longer
conditional, and needing no rank-specific machinery;
(ii) the r25 order-≤21 census's **target check** — `sources/r25/c4-T4-census/search_report_n21.json`, whose
`claim_checked` field I read directly: "for every finite forest G, x(G u K1) <= x(G) + 1", with
`total_forests_checked: 8,355,831`, `violation_count: 0`, `engine_mismatch_count: 0`;
(iii) the in-run re-verification of that content by **two** independent r27 instruments — `C-F3-T` on all
1,291,315 classes of order ≤ 19 and `C-F3-U` on all 3,269,193 classes of order ≤ 20, both with zero
violations and both reproducing the frozen first-descent histograms digit for digit;
(iv) ranks 0–4 by the registered `E993-R25-KADDITION-CLOSURE-X-LE-4`, with rank 0 (the empty forest, absent
from the search-report population, which starts at order 1) certified separately by
`closure_certificate.json`'s rank-0 entry.

**Grade: `proved_informal`-with-census** (`SEMANTIC-CONTRACT.md` §2's own term), carrying the census on its
face, **never `formally_verified`** — Gate ruling 6 and fence §3.4. The formal grade of (LB)/(R5) does not
promote it. It is strictly cheaper in dependencies than the historical r25 route: it needs no branch-vertex
analysis, no second- or third-order Bonferroni certificate, and no rank-5 ceiling chain.

**6. The rank-5 residue closeout.** Under (R5), no finite forest of order 22–25 has `Δ_5 < 0`, so the
residue of `E993-R25-RANK5-CEILING-SHARPENED-TO-25` — orders 22–25 with at least three branch vertices — is
**EMPTY**. The r25 rank-5 lineage `36 → 33 → 29 → 25` and
`E993-R25-RANK5-TWO-BRANCH-EXACTNESS-ORDERS-22-29` remain valid standalone theorems at their own statements
and are neither weakened nor regraded; only their **role as inputs to this one downstream closure** is
superseded. The r25 `(k+1)²` formal award is untouched. Companion, critic-derived (`C-F3-T` F-4), STATED and
unregistered: given (LB), `Δ_5 < 0 ⇒ n ≤ 18`, sharp, attained by 9,532 order-18 classes — census-dependent,
hence never `formally_verified`, and needed by nothing downstream.

**7. Census figures of record for this orientation**, all `bounded_computation` at their attained horizons
(Gate ruling 10): forest isomorphism classes 15,206 to order 14 (F1, `C-F1-T`, `C-F1-U`); 20,514 at order 15
and 49,905 at order 16, cumulative 85,625 (`C-F1-U`, corroborated across routes); 8,355,831 to order 21,
matching the frozen r25 figure exactly (F3, `C-F3-T`, `C-F3-U`); **13,184,156 at order 22, cumulative
21,539,987** — new in this run, now behind **three** instruments (F3 constructive; `C-F3-T` and `C-F3-U`
arithmetic) and citable as an isomorphism-class count. Counts only past order 22: 34,402,932 (23) and
90,328,674 (24), cumulative 146,271,593 — the price of the `x ≤ 6` census route, with per-class evaluation,
not enumeration, as the bottleneck.

**8. The non-forest boundary, restated correctly.** For every finite graph `D_1 = 2|E|` and `i_1 = n`, so
(DL) at `k = 1` reads `|E| ≤ n`; the failures begin at cyclomatic excess ≥ 2, with `K₄ − e` the
**edge-minimal** witness (`n = 4`, `|E| = 5`, `D_1 = 10 > 8`) and `K₄`, `K_{2,3}` the order-minimal ones.
But plain (DL) does **not** separate forests from non-forests: every cycle `C_n` satisfies it with equality
at every `k`, and every unicyclic graph tested satisfies it. **The statement equivalent to acyclicity is the
root-corrected form at `k = 1`: `D_1 + 2c ≤ 2·i_1 ⟺ |E| ≤ n − c ⟺ `G` is a forest`.** That is the fence of
record; F1's `|E| > n` boundary is the `k = 1` fence of *plain* (DL), which is a weaker object.
`bounded_computation` for the "excess-1 never fails at any `k`" half (46,745 connected unicyclic graphs to
order 12 under two independent instruments; 31,892 disconnected one-cycle graphs to order 11; all 232,308
graphs with `|E| ≤ n` to order 7), `proved_informal` for the `k = 1` half.

**9. The external-source audit record, as restated here** (Tier 3 record; **STATED at Stage 5** because I
have changed F2's draft, and therefore requiring an isolated second read before registration). Sustained
content: `sum_degOn_le` (`DegreeLemma.lean:701`) is exactly (DL) at `S = univ` in the raw-sum form, with
`hG : G.IsAcyclic` on the ambient graph and the `degOn_univ` bridge requiring `[DecidableRel G.Adj]`;
`prefix_ratio` (`Ends.lean:43`) is (EX)'s prefix form with ℕ-truncated subtraction, equivalent in content,
not a literal instance below `n = 3k`; `sum_numExtensions` (`Extensions.lean:67`) is the double count and
needs no acyclicity; `numExtensions_ge` (`Extensions.lean:116`) is the subtraction-free `e(J)` bound and its
independence hypothesis is inert by the source's own annotation; the import closure of both targets is
`{Basic, Components, DegreeLemma, Extensions, Recursion}` (+`Ends`) with **no excluded project module**
reachable, while `Basic.lean:47` imports **all of Mathlib**, so the slice gives no minimal-import signal;
zero hits for `sorry`/`admit`/`axiom`/`native_decide`/`unsafe` and **five** for `decide`
(`Recursion.lean:301`; `Ends.lean:126, 127×3`), three of them the term-level `Decidable.decide` and two the
tactic on closed `Fin 2` propositions, **none** reachable from either target by declaration order alone;
Lean `v4.29.1` / Mathlib `5e932f97…` against the run's `v4.32.2` / `905b95818e…`; **no LICENSE or COPYING
anywhere** in the frozen copy or in the upstream tree, so Gate ruling 3 stands unchanged; the Lean comments'
"Lemma 6.1"/"Proposition 6.2" vs the paper's "Lemma 8.1"/"Proposition 8.2"; and — critic-derived, the
operationally decisive item — **`Polynomial.finset_sum_coeff` is deprecated under the run's pin**
(`Mathlib/Algebra/Polynomial/Coeff.lean:93`, current name `Polynomial.finsetSum_coeff`), used three times
inside `vpoly_coeff`, on the (DL) path. Struck from F2's draft: the "three files" count, "self-contained
slice", every closure and declaration count, "proof-term closure", "definitionally", "term by term … agree
exactly", "consumed exactly once per component", the "earlier arXiv revision" story, the "~3-year" version
gap, the `i_k = 0` strict-inequality link, and the "file count is a record correction" framing (19 is
correct for the repository; the defect is undeclared scope). Owed as packet record corrections: the (8.8)
pointer in `SEMANTIC-CONTRACT.md` §3 and `C1-ALLOCATION.md` item 5(b) — the double count is (8.1), (EX) is
the unnumbered ratio display inside Proposition 8.2's proof, and (8.8) is its conclusion — and
`STATIC-SCAN.json`'s undeclared scope in both dimensions. **No sealed member is edited by this
adjudication** (fence §3.5).

---

## Rejected and narrowed mechanisms

- **Rejected: (DL) as a statement that certifies acyclicity.** Every cycle satisfies (DL) with equality at
  every `k`; every unicyclic graph tested satisfies it. (DL) alone separates nothing at excess 1. Only the
  root-corrected form does, and exactly at `k = 1`.
- **Rejected: any registrable count from the external slice** — declaration census, citation-closure size,
  "proof-term" closure. Four instruments, four answers; and Gate ruling 3 makes a true proof-term closure
  permanently unavailable for this source, so it must never be promised.
- **Rejected: the hygiene charge against F3's `ps aux | grep`.** F3 complied with the brief that bound it;
  the controller has recorded the rule-text inconsistency and not charged it. Both critics applied a rule
  that did not govern the seat.
- **Rejected: "exactly this one inequality" as a necessity claim** for the K1-addition closure at rank `x`.
  `Δ_{x+1}(G) ≤ 0` suffices; it is not necessary, with `C-F3-U`'s exact witness. The conflation is inherited
  from the frozen r25 artifact's own "equivalently NR1" phrasing, which owes a scope note.
- **Rejected: F2's "genuinely self-contained finite slice"** and the count "three"; **four** frozen files
  reach outside the slice, and `Basic.lean` — inside both target closures — imports all of Mathlib.
- **Rejected: an ℕ-transport obligation for (EX).** The run states (EX) subtraction-free or in ℤ and may not
  carry external Lean text at all, so no transport of `prefix_ratio` is needed by any route.
- **Narrowed: the order-22 figure's novelty** (the free-tree layer is asserted against constants inside F3's
  generator) — the number stands on three instruments; the framing does not.
- **Narrowed: F3's four orphaned digests** (`census_report_n{17,18,19,20}.json`), struck as evidence though
  their substantive contents reproduce; `n21`/`n22` stand in full under two critic replays.
- **Narrowed: "every canonical tree … checked"** → 75 sampled objects across orders 1–10.
- **Narrowed: the four/six certification literals** "34 checked files" (35 under the three paths; 29 rows
  shipped), "all thirteen census files" (19), "smallest failures `K₄`/`K_{2,3}`" (order-smallest;
  edge-minimal is `K₄ − e`), the grade literal "proved" (`proved_informal`), the "132-declaration port size"
  handed to U2, and F3's "Key finding" framing (dispatch-derived).

**Fences held.** Nothing in this adjudication transfers status to `E993-R25-UNR-FOREST-WIDE` (confirmed OPEN
by both F3 critics from the registry), the all-rank aggregate, `E993-BETA-AGG`, `E993-G1WIDE-NO-SIZE-CAP`,
NR1, TRANSFER, TREE, FOREST or Erdős #993. (LB), (R5) and (XR) are order bounds whose contrapositives carry
sign `Δ_k ≥ 0`; none is a no-recovery statement and no no-recovery wording appears anywhere above. No `N₀`,
no CLT, no asymptotics, no unimodality claim. (DL), (RC), (SH) and their consequences are **averages over
`I_k`**; no pointwise degree statement is made or implied (fence §3.3). No composition using the order-≤21
census carries a formal grade (fence §3.4, Gate ruling 6). No sealed r25/r26 record is edited; corrections
are records and scope notes (fence §3.5). No external Lean text was copied, transcribed or published, and
none is quoted here beyond line references (fence §3.6, Gate ruling 3).
`E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` (REFUTED; registry key per erratum R27-E-c) is a premise
nowhere; `E993-FOREST-FIRST-DESCENT-DISJOINT-UNION-UPPER-ADDITIVITY` stays REFUTED with the `K₁` instance
carved out by the registry's own scope field.

---

## Lean readiness

**This orientation shipped no Lean.** No seat and no critic of orientation F built a project, bound the
shared Mathlib, ran `lake build`, or produced a `#print axioms` output. Criterion (b) — compiled fragments
covering named DAG nodes sorry-free — is therefore **empty for every target in my portfolio**, and nothing
below should be read as competing with the U orientation's evidence, which I cannot see.

| Target (`SOLUTION-CONTRACT.md` §2, exact statement) | (a) complete informal proof, closed DAG | (b) compiled sorry-free | (c) named open nodes |
|---|---|---|---|
| **(DL)** `forest_degree_lemma` | **YES** — `C-F1-T`'s injection, verified here; six DAG nodes, all closed; `k = 0`, `k > α`, empty and disconnected forests all covered | none | none informal. Lean-side: rooting a finite acyclic graph with a parent map; the edge↔non-root bijection; `N(v) = {p(v)} ∪ children(v)`; one `Finset.card_le_card_of_injOn` over `Σ_{v non-root} I_k`; the ℕ→ℤ cast |
| **(EX)** `forest_extension_inequality` | **YES except one node** — the chain is complete and verified; the **double count** is asserted, not written, in this orientation | none | the double count `(k+1)i_{k+1} = Σ_{J∈I_k} e(J)` (chartered to `C1-T-03`/`C1-U-03`) |
| **(LB)** `forest_descent_linear_bound` | **YES given (EX)** — `Δ_k < 0 ⇒ i_k > 0`, then division by `i_k` in ℤ; `k = 0` checked | none | the **carrier bridge**: §2 states (DL)/(EX) on `[Fintype X] [DecidableEq X]` and (LB)/(R5)/(XR) on `[Finite X]` with `Nat.card`, so composing them needs `Fintype.ofFinite` transport. Nobody in my portfolio addressed it |
| **(R5)** `forest_rank5_ceiling_20` | **YES given (LB)** — it is (LB) at `k = 5`, with no rank-specific machinery | none | the carrier bridge; plus the cast `delta G ((5:ℕ):ℤ) = delta G (5:ℤ)` |
| **(XR)** `forest_descent_restriction` | **NO** — the derivation is one line from (LB), but the statement quantifies over `firstDescent`, which no seat of mine defines | none | `firstDescent` (`Nat.find`) and its existence proof — chartered to `C1-U-01`; the `4r − 4` ℕ-truncation audit (`r ≥ 1` is forced by `x < r`; verified computationally at `r = 1`) |

**Award groups contract-ready in orientation F.** Exactly one target is contract-ready on the informal side
at its exact §2 statement with its exact hypotheses and fences: **(DL) `forest_degree_lemma`**, hypotheses
`(hG : G.IsAcyclic) (k : ℕ)` on `[Fintype X] [DecidableEq X] [DecidableRel G.Adj]`, conclusion
`(indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k`, fences: average over `I_k`, no pointwise
claim, no status transfer, FLNYZ attribution on its face. A **strictly stronger companion**, not a §2
target and not required by any of them, is also contract-ready informally: the root-corrected lemma (RC),
and with it (SH) and the strictness theorem. **(EX)** is one named elementary node from ready. **(LB)** and
**(R5)** are ready given (EX) plus the carrier bridge. **(XR)** is not ready.

**The smallest unproved lemma in my orientation is the double count**, `(k+1)·i_{k+1}(G) = Σ_{J ∈ I_k(G)} e(J)`
— universal over finite graphs, no acyclicity, a single `Finset.card_nbij'`-shaped bijection, machine-verified
exhaustively here and by three other instruments, written out by nobody in orientation F.

**Two Lean-side items my orientation contributes to Stage 7 that the U seats cannot have derived from their
own evidence.** (1) `Polynomial.finset_sum_coeff` is **deprecated** under the run's pin; U2 writes
`Polynomial.finsetSum_coeff`. Also `path_unique` is `SimpleGraph.IsAcyclic.path_unique`, and
`Finset.card_nbij'` and `le_tsub_add` exist as expected. (2) The injection route **avoids the two-potential
polynomial induction entirely**: if it formalizes, the run's long pole (`C1-U-02`) collapses to
`Finset` bookkeeping plus the rooting API, and the deprecated-alias problem on `vpoly_coeff` disappears with
the polynomial layer. That is the single highest-value structural message this orientation sends to Stage 7.

A fixed-band or bounded result never qualifies as contract-ready and none is offered as such: the `x ≤ 5`
closure, the `Δ_5 < 0 ⇒ n ≤ 18` companion and every census figure carry the census on their faces and are
explicitly excluded from the §2 award groups.

---

## Progress and plateau assessment

`material_progress: yes`

`orientation_plateau: no`

Orientation F was chartered to falsify. It found no counterexample — and then proved that none of the kind
it searched for can exist, and proved the theorem it was attacking. Concretely, this cycle moved the
orientation from "no counterexample inside a horizon" to: a complete elementary proof of (DL) in a strictly
stronger root-corrected form, with strictness and the acyclicity equivalence as corollaries; (EX), (LB),
(R5) and (XR) following at `proved_informal` modulo one elementary named node; the `x ≤ 5` K1-addition
closure converted from conditional to unconditional at this orientation's evidence, at a strictly smaller
dependency footprint than the historical r25 route; the rank-5 residue closed out; the census property layer
re-verified in-run to order 20 by two independent instruments and the population extended to order 22 under
three; and an external-audit record rewritten with one operationally decisive Lean finding (a deprecated
Mathlib alias on the (DL) path) that shortens Stage 7.

**The stop gate does not fire and its conditions bear on this orientation only partially.** Decisive event
(a) requires (DL) and (EX) **formally verified** at §2 with (LB) and (R5) checked formally and the residue
closed dependency by dependency; my orientation supplies the informal mathematics and the residue closeout
but **zero** formal verification, so (a) is not met and cannot be met at Stage 5. Decisive event (b) — an
in-scope counterexample — is refuted rather than met: three exhaustive instruments over all forest
isomorphism classes to order 20, one over every labelled forest to order 7 under every root choice, plus
adversarial families to order 200, found none, and the strictness theorem explains why none exists.
**Condition (c) is exactly the state of this orientation: the mathematics is proved informally with a DAG
that closes on one named elementary lemma, and Stage 7 is blocked on bounded, named Lean obligations —
CONTINUE.** A plateau requires evidence of no material progress; the opposite holds.

---

## Headline assessment

`headline_resolved: no`

`status: proved`

The headline — (DL) and (EX) **formally verified** at `SOLUTION-CONTRACT.md` §2 with (LB) and (R5) checked
formally — is a governed formal award, which does not exist at Stage 5 and which no route or critic of this
orientation could produce: orientation F compiled nothing.

`status: proved` records that at this orientation's evidence grade (DL) and (EX) have a complete informal
proof that I have verified line by line and machine-checked with my own instrument. Stated precisely, and in
prose rather than through the flag: **(DL) is proved outright**, in the stronger root-corrected form, by
`C-F1-T`'s injection — critic-derived, therefore critic-attributed, STATED at a review stage, and requiring
an isolated second read plus a registry alias check before registration, neither of which is available from
my grant. **(EX) is proved from (DL) modulo exactly one elementary, universally true, exhaustively
machine-verified node — the double count — which no document in orientation F writes out.** (LB), (R5) and
(XR) follow from (EX) by steps I have checked, (XR) subject to `firstDescent` being defined. The formal
award is Stage 7's, and nothing here anticipates it: no grade above `proved_informal` is assigned to any
mathematical statement in this adjudication, and no composition touching the order-≤21 census is graded
above `proved_informal`-with-census.

---

## Next-route allocation

The exact remaining obligation of orientation F: **write out the double count at statement-level granularity
and obtain an isolated second read of the injection proof.** Those two acts close orientation F's informal
DAG for (DL)+(EX) and make the run's proof of record registrable. Everything else below is elective.

Cycle 2 keeps three routes per orientation.

**F-route 1 — `INJECTION-SECOND-READ-AND-REGISTRATION-PACKET`.** An isolated second read of (RC), (SH) and
the strictness theorem at their exact statements, against a reader who has not seen `C-F1-T` or `C-F1-U`;
plus the registry alias check (lexical and mathematical) that neither critic nor I could run, for candidate
keys of the shape `E993-R27-FOREST-DEGREE-LEMMA`, `…-ROOT-CORRECTED`, `…-STRICT`; plus the two-line double
count written out so the (EX) DAG closes inside this orientation. **What it closes in one cycle:** converts
the run's proof of record from STATED to registrable and hands Stage 7 a closed informal DAG for (DL) and
(EX) — the single highest-value cycle available to orientation F.

**F-route 2 — `EXCESS-ONE-BOUNDARY`.** `C-F1-T` names the exact obstruction: delete the cycle-closing edge
`xy` and root at `x`; the injection survives everywhere except at `y`, whose neighbour set gains `x`, and
closing it needs `a_y ≤ a_x`, unavailable in general. Either prove (DL) for excess-1 graphs by repairing the
injection at that one vertex, or find a failure at larger order. **What it closes in one cycle:** turns the
strongest bounded null in the portfolio (46,745 + 31,892 + 232,308 instances across two instruments) into a
theorem or a refutation, and settles the registrable form of the fence record — which must be restated as
the root-corrected `k = 1` equivalence with `K₄ − e` as edge-minimal witness, not as F1's `|E| > n` boundary.

**F-route 3 — `K1-ADDITION-AT-RANK-SIX`.** (LB) at `k = 6` gives `n ≤ 24` with no rank-specific machinery,
but no property census reaches order 24: the in-run property layer stands at 20, the frozen census at 21,
and counts at 22. The route is priced — 146,271,593 classes cumulative to order 24, with per-class
evaluation, not enumeration, as the bottleneck (both F3 critics concur). Either push the property census
from 20 toward 24 with a faster evaluator, or find a rank-6 argument that avoids a full census, as the
Cycle 4 record's pre-Hunter machinery did for rank 4. **What it closes in one cycle:** either
`E993-R27-KADDITION-CLOSURE-X-LE-6` at `proved_informal`-with-census, or a priced, evidenced statement that
the census route is closed and the rank-6 argument is the only way.

**Record obligations carried to the synthesis** (not routes): the external-audit record and the rank-5
residue/K1-composition record as restated in Established results are **STATED at Stage 5** and each needs an
isolated second read before registration; the packet record corrections owed are the (8.8) display pointer
(`SEMANTIC-CONTRACT.md` §3, `C1-ALLOCATION.md` item 5(b)) and `STATIC-SCAN.json`'s undeclared scope in both
dimensions; F3's six drafted scope notes are accurate and correctly conditional and should be applied with a
seventh added on the r25 census artifacts' "equivalently NR1" phrasing and with Gate ruling 6 cited wherever
a note touches the closure's grade; and the `Ends.lean:60` quotation should not be propagated.

---

## Artifact inventory

Deliverable: this file,
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-forest-degree-extension-dre-2026-09-24/cycles/cycle-1/stage5/adjudicators/F/ADJUDICATION.md`.

Scratch, all under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-forest-degree-extension-dre-2026-09-24/scratchpad/c1-adj-F/`;
nothing written anywhere else, nothing under `sources/`, `control/`, any seat's or critic's scratch, or
`/tmp`.

| File | SHA-256 | What |
|---|---|---|
| `verify.py` | see report | capsule seal recomputation and 24-member digest/byte verification |
| `adj_verify.py` | see report | independent verification instrument (see below) |
| `adj_verify_report_n6.json` | payload `a3533547d7eaea55c8ba311554ffc868946e72df9bcf89cc69eaf5d9f39ec2ee` | order ≤ 6 run |
| `adj_verify_report_n7.json` | payload `d8a9729859e50430a36676fa63f9e4f58578c52f4cfad745bed2cee86b0a8483` | order ≤ 7 run, 22.6 s foreground |

**IMPORT LIST (every script of this adjudication; Python standard library only):** `itertools`, `json`,
`hashlib`, `sys`. No network, no `pip`/`brew`/`npm`/`elan`, no third-party package, no Lean build, no
`lake` invocation of any kind. Exact integers throughout; no floating point. No hashed payload contains a
wall-clock, PID or host field.

**What `adj_verify.py` establishes.** Every **labelled** forest on `n ≤ 7` vertices — every acyclic edge
subset of `K_n`, so every isomorphism class in every labelling, **40,233** objects with counts
`1,1,2,7,38,291,2932,36961` (independently matching the labelled-forest sequence `C-F3-T` cross-checked by
orbit counting) — each certified acyclic by an independent union-find plus the `|E| = n − c` check, at every
`k`, under **every** choice of one root per component: (DL), (RC), (SH), strictness with exact `2c` slack at
`k = 1`, the double count, the per-set `e(J)` bound, (EX), (EXS), (LB), (XR), both `D_k` identities, the
edge↔non-root bijection, and the injection `Φ` mapped pair by pair with image-legality and collision checks.
**0 failures.** A second, disjoint polynomial-time instrument (rooted independence-polynomial DP, with
`a_v(k) = i_{k−1}(G − N[v])` and `Σ_J e(J) = Σ_v i_k(G − N[v])`) was cross-validated against brute force on
every one of those forests and then run on 25 structured instances to order 120 — paths to `P_100`, stars to
`K_{1,119}`, spiders, caterpillars, combs, complete binary trees, edgeless order-60, `30K₂`, mixed unions,
and five LCG-random forests to order 120 — including non-vacuous (R5) checks: **0 failures**. All
`SEMANTIC-CONTRACT.md` §4 fixed points reproduced before any table: empty forest `i = [1]`, `Δ_0 = −1`;
`K₁` `i = [1,1]`; `K₂` `i = [1,2]`, `D_1 = 2`; `P₅` `i = [1,5,6,1]`, `D = [0,8,18,4]`; `K_{1,5}`
`i = [1,6,10,10,5,1]`; edgeless `D_k = 0`.

**Replay** (foreground, deterministic, standard library only):

```sh
RR=/Users/ashtonsperry/VerityOS/experiments/erdos-993-forest-degree-extension-dre-2026-09-24
cd "$RR/scratchpad/c1-adj-F"
python3 verify.py                 # capsule seal 2a4ae30d…, 24/24 members
python3 adj_verify.py 6 6         # ~2 s
python3 adj_verify.py 7 7         # ~23 s
```

**Background jobs.** I started **none**: every command of this adjudication ran in the foreground to
completion, so there was no PID to kill. No pattern kill and no full process listing was issued at any
point. Within my portfolio, the only background job recorded is F3's abandoned order-23 attempt, killed by
the literal PID 96655 with a `ps -p` exit confirmation; `C-F3-U`'s single long run was foregrounded with its
PID (10973) recorded and its exit confirmed on that literal PID; no other seat or critic backgrounded
anything.

**Disclosures.** (a) One exact-path read of `Mathlib/Algebra/Polynomial/Coeff.lean` inside the pinned shared
Mathlib package directory, for API meaning only — the grant the protocol gives and the controller ruled
within grant for `C-F2-U`; nothing was built and nothing copied out. (b) Reads under the authorized run-root
`sources/`: the nine frozen external `.lean` files, `STATIC-SCAN.json`, `repository-tree.json`,
`paper/section8-extracted.txt`, and five frozen r25 census artifacts — all by exact path, all inside the
grant. (c) The registry (`control/CLAIM-IDENTITY.run-local.json`) is not a capsule member, so no alias check
could be run; the synthesis owes one. (d) I did not open `scratchpad/c1-F1-replay/`, `c1-F2-replay/` or
`c1-F3-replay/`; the seats' byte-identity claims about those directories are superseded by the critics'
copy-out-first regenerations. (e) No search was rooted above my grant: no `find`, no `rg`, no `grep` outside
`sources/external/` and my own scratch, no recursive listing, no glob `cat`. (f) This adjudication was
reread in full before the final write.
