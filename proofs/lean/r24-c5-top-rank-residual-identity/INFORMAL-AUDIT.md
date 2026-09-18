---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c5-la1-formalizer-sonnet-20260917
critic_id: c5-la1-fable-informal-20260917
attestation_id: c5-la1-informal-pass-20260917
claim_sha256: 153184120a637a5c114a4457c2e913dc16ec98fc250ac0c9b320aaff0726dc55
---

# Informal Proof Integrity Audit

Operating within VerityOS. Booted per the mandatory-boot rule in `CLAUDE.md` and
section 0 of `control/C5-STAGE7-INFORMAL-AUDITOR-BRIEF.md` by reading
`verity.md` (root constitution) and `identity/startup-protocol.md` (startup
sequence), then loading `skills/proof-integrity-audit/skill.md` as the governing
authority for this seat. This is bounded experiment work under `experiments/`;
no other VerityOS subsystem was required or loaded. Scale mode: **single
problem** (one theorem, one ledger row per definition/lemma/inference step).
Write boundary honored: this seat wrote only inside
`scratchpad/c5-s7-informal/` and edited no contract, Lean source, informal
proof, or receipt.

**Model disclosure.** Chartered model/effort for this seat: Claude Opus 5,
effort high. The Agent transport exposes no effort parameter to this seat and
the seat cannot self-inspect its runtime model or effort; this disclosure is
made on dispatch-record authority per the brief, not on direct introspection.
Child delegation was forbidden and none was used. No transport refusal or
content-safety false positive occurred during this audit.

## Intended Claim

The intended claim is exactly `theorem.informal_statement` of
`runs/lean-2026-09-17-c5-top-rank-residual-identity/THEOREM-CONTRACT.yaml`
(file SHA-256 recomputed on disk:
`750bc81b5af8c18c6c9766c5a419411e57213829d359843ac70493ec4ad12b00`, matches the
brief). Verbatim:

> For every finite simple graph G on a finite vertex type with decidable
> equality and decidable adjacency, if G is a tree, 2 <= G.indepNum, x(G)+2 <=
> G.indepNum-1, and every leaf of G belongs to every maximum independent set of
> G, then with p = G.indepNum-1, L the leaf set, ell = |L|, M = i_alpha(G), and
> lambda(s) the number of leaf neighbours of s (zero off supports), the equality
> S(G,p) = ell*M - sum_{B in I_p(G)} (|B intersect L| - sum_{s in B} lambda(s))
> holds. This composes the verified F7 selector collapse (which discharges the
> favorable-filter-equals-leaf-set step) with the (RI) double-counting identity;
> it asserts no (RC) content, no inequality, and no sign claim.

`claim_sha256` recomputed independently as SHA-256 of that string with
whitespace collapsed to single spaces (`" ".join(s.split())`, 678 bytes; the
collapse is a no-op on this string):
`153184120a637a5c114a4457c2e913dc16ec98fc250ac0c9b320aaff0726dc55`. **Confirmed
equal** to the value required by the brief and recorded in this audit's front
matter.

The proof under audit is that run's `INFORMAL-PROOF.md`, file SHA-256
recomputed on disk `dd0e4e774d75bfc567b47ebad48631148327b96da3a8ed4995072461b65df9a9`
(matches the brief). The terminal Lean declaration whose mathematics this
statement is read against is `C5LA1.topRankResidualIdentity` in
`LeanProject/LeanProof/Main.lean`
(`0933211d8f02acd867e91547d4a2b09d13fcc3ea178e192e385acc33b696b63b`, matches);
this seat audits the mathematics, not the kernel.

Provenance gate reproduced: the sealed award capsule
`control/c5-stage7-capsules/C5-LA1-PACKET-MANIFEST.json` recomputes to seal
`bf8fc6c041176f7a11c1d502cb45161e84b4878c87cb93a0efb47707b14df52e` under the
declared algorithm (SHA-256 of compact key-sorted JSON with `seal_sha256`
removed, no trailing newline), and all 9 member byte counts and digests verify
on disk. The award statement of record
(`cycles/cycle-5/stage6/SYNTHESIS.md` `## Lean awards`), the U adjudication
`## Lean readiness`, the U3 return, and the C-U3-T and C-U3-F critiques were
read inside the brief's read boundary; nothing outside the boundary was opened.

**Definitional reading used throughout (fixed before any verdict).** From
`sources/r23/SEMANTIC-CONTRACT.md` lines 30-48 and, for `S(T,p)` and
`lambda(s)`, line 49 and `control/C5-F1-STATEMENT-CAPSULE.md`:
`i_k(G)` = number of independent vertex `k`-subsets, zero outside supported
nonnegative ranks; `Delta_k(G) = i_{k+1}(G) - i_k(G)`; `x(T)` = least `k >= 0`
with `Delta_k(T) < 0`; leaf = degree one, `s_v` its unique support;
`H_v = T - {v, s_v}`; `R_v = T - N_T[s_v]`; `a_v = Delta_p(T-v)`;
`b_v = Delta_{p-1}(H_v)`; `B_v = Delta_{p-1}(R_v)`;
`F = {original leaves v : a_v < 0}`; `S(T,p) = sum_{v in F} (b_v - B_v)`;
`lambda(s)` = number of leaf neighbours of `s`, extended by zero off supports.

## Claim Ledger

One row per definition, lemma, and inference step, at statement-level
granularity. Verdict taxonomy per `skills/proof-integrity-audit/skill.md`.
Evidence method: independent executable recomputation (see next section) plus a
literal source-text check against the r23 semantic contract and the F1 capsule.

### A. Definitional rows (literal check against r23 lines 30-48)

| # | Claim | Source line | Proof / Lean realization | Verdict |
|---|---|---|---|---|
| D1 | leaf = degree one; `s_v` is its unique support | r23 L37 | `IsGraphLeaf G v := ∃! u, G.Adj v u`; `support` = the unique neighbour by classical choice, unconstrained off leaves | verified — literal match (`∃!` is degree exactly one) |
| D2 | `i_k(G)` = # independent `k`-subsets, zero outside supported ranks | r23 L31-32 | `indepSetCount G D k` = card of independent `k`-subsets of the original type avoiding `D`; empty for `k > n` | verified |
| D3 | deleted-graph coefficients counted over the ORIGINAL vertex type (F7 convention) | not literal in r23 L30-48; declared in the proof's "Exact definitions" and inherited from F7 | `indepSetsAvoiding G D k = ((univ \ D).powersetCard k).filter IsIndepSet` | verified — and proved *equivalent* to literally forming the induced subgraph `G - D`: 5,148,344 `(G, D, k)` triples over all graphs `n ≤ 6`, all `|D| ≤ 2`, all `k`; **0 mismatches**. No divergence from r23. |
| D4 | `Delta_k(G-D) = i_{k+1}(G-D) - i_k(G-D)` | r23 L33 | `forwardDifferenceDel` | verified — literal match |
| D5 | `x(T)` = least `k >= 0` with `Delta_k(T) < 0` | r23 L34 | `crossingIndex` via `Nat.find`, with the total-existence witness `Delta_alpha(G) = -i_alpha(G) < 0` | verified — literal match; existence witness reproduced (`i_alpha(G) ≥ 1` since a maximum independent set exists) |
| D6 | `H_v = T - {v, s_v}` | r23 L41 | `H G v = {v, support G v}` as a deletion set | verified — literal match |
| D7 | `R_v = T - N_T[s_v]` | r23 L42 | `R G v = insert (support G v) (neighborFinset (support G v))` | verified — literal match (closed neighbourhood) |
| D8 | `a_v = Delta_p(T-v)`; favorability is strict `a_v < 0` | r23 L45, L48; `SOLUTION-CONTRACT.md` §Exact conventions | `IsFavorableAt G v p := vertexDeletionForwardDifference G v p < 0` | verified — literal match |
| D9 | `b_v = Delta_{p-1}(H_v)`, `B_v = Delta_{p-1}(R_v)` | r23 L46-47 | `forwardDifferenceDel G (H G v) (p-1)` and `… (R G v) (p-1)` | verified — literal match. Boundary: Nat truncation of `p-1` is harmless because `hyp-alpha` forces `alpha ≥ 2`, hence `p ≥ 1`. Reproduced: `p ≥ 1` in every instance of the census. |
| D10 | `F = {original leaves v : a_v < 0}`, `S(T,p) = sum_{v in F} (b_v - B_v)`; leaves stay separate tags even when sharing a support; empty favorable set has aggregate zero | r23 L48-49, L27-28 | `aggregate` sums over `(leafSet G).filter (IsFavorableAt · p)`, one summand per leaf | verified — per-leaf summands, not per-support; empty sum is `0` (reproduced on leafless graphs: `C_4`, `C_5`, two disjoint triangles, all give `S = 0 = RHS`) |
| D11 | `lambda(s)` = number of leaf neighbours of `s`, zero off supports | F1 capsule, quoted `(RI)` block | `leafDegree G s = ((leafSet G).filter (G.Adj · s)).card` | verified — literal match; extension by zero is automatic. Cross-check reproduced: `sum_s lambda(s) = |L|` on all 33,866 graphs `n ≤ 6` |
| D12 | `L`, `ell = |L|`, `M = i_alpha(G)`, `I_p(G)` = independent `p`-subsets of `G` | F1 capsule; r23 L31 | `leafSet`, `.card`, `indepSetCount G ∅ G.indepNum`, `indepSetsAvoiding G ∅ p` | verified — `M` is simultaneously `i_alpha(G)` and the count of maximum independent sets, since every independent `alpha`-set is maximum |

### B. Hypothesis rows

| # | Claim | Verdict |
|---|---|---|
| H1 | `hyp-tree` (`G.IsTree`) is present in the claim and is used exactly once, as an input to F7 in Step 1 | verified (see also C1 and the critic pass, item CP-1) |
| H2 | `hyp-alpha` (`2 ≤ G.indepNum`) is present and load-bearing: it supplies F7's own binder and gives `p ≥ 1`, without which `p-1` truncates and Step 4 is unstated | verified |
| H3 | `hyp-eligible` (`x(G)+2 ≤ G.indepNum-1`) is present and, as the proof states plainly, **is not used** anywhere in the derivation; it is carried because the awarded statement of record requires it | verified — the proof's own disclosure is accurate. Reproduced: the identity holds on residual instances that *fail* `hyp-eligible` (`K_{1,2}`, `K_{1,3}`, `K_{1,4}`, `K_{1,5}`) exactly as on those that satisfy it (`K_{1,6}`, `K_{1,7}`, `K_{1,8}`). Retaining an unused hypothesis weakens but never falsifies the claim. |
| H4 | `hyp-residual` (every leaf in every maximum independent set) is present and is genuinely necessary | verified — independently reproduced: **271 of 271** non-residual trees (`n ≤ 11`, `alpha ≥ 2`) and **6,182 of 6,182** non-residual non-tree labeled graphs (`n ≤ 6`) **fail** the identity; zero accidental holds. This is the first-class defect the hypothesis exists to prevent, and it is correctly carried. |

### C. Inference rows

| # | Step | Claim | Verdict |
|---|---|---|---|
| C1 | Step 1 | F7 (`C4LA1.topRankSelectorCollapse`, hypotheses `G.IsTree`, `2 ≤ G.indepNum`, `v` a leaf) gives `a_v < 0` for every leaf at `p = alpha-1`, hence `F = L` | verified. F7's own contract reads "for every finite literal ordinary tree `T` with `alpha(T) ≥ 2`, every leaf `v` is strictly favorable at `p = alpha(T)-1`", i.e. `i_alpha(T-v) < i_{alpha-1}(T-v)` — exactly `Delta_p(T-v) < 0`. The citation is faithful and carries `alpha ≥ 2` (the hypothesis C-U3-F flagged U3 for dropping). F7's kernel receipt reads `verified`, axioms exactly `{propext, Classical.choice, Quot.sound}`. Reproduced independently: `F = L` in 163/163 residual trees and 33,861/33,861 graphs `n ≤ 6` with `alpha ≥ 2`, zero failures. |
| C2 | Step 2 | Leaf-deletion bijection: max independent sets of `G` ↔ `I_p(H_v)`, hence `i_p(H_v) = M` | verified. The three obligations (well-definedness, injectivity, surjectivity) are each discharged in the text, and each uses only `hyp-residual`, leafness, and `p + 1 = alpha`. Reproduced: holds in 163/163 residual trees and 26,239/26,239 residual non-tree graphs; fails on non-residual instances, as it must. |
| C3 | Step 3 | Residual vanishing `i_p(R_v) = 0` | verified. The contradiction is complete: `A ∪ {s_v}` is independent of size `alpha`, so by `hyp-residual` it contains `v`, but `v ∈ N[s_v]` is deleted from `R_v` and `v ≠ s_v` (simple, loopless). Reproduced: 163/163 and 26,239/26,239, zero failures. |
| C4 | Step 4 | Per-leaf summand `b_v - B_v = M - i_{p-1}(H_v) + i_{p-1}(R_v)` = `g_v` of capsule formula (1) | verified — pure arithmetic from D4, C2, C3. Independently recomputed per leaf on every census instance; zero failures. Matches the capsule's `(1)` verbatim. |
| C5 | Step 5 | First double count `sum_{v in L} i_{p-1}(H_v) = sum_{B in I_p(G)} |B ∩ L|` | verified. Both maps are exhibited, both well-definedness checks are given, and the text states they are mutually inverse with the two identities `(B - v) ∪ {v} = B` and `(C ∪ {v}) - v = C`. Claimed hypothesis-free; **reproduced as hypothesis-free**: holds on all 434 census trees and all 32,421 non-tree graphs `n ≤ 6` with `alpha ≥ 2`, including every non-residual one. Zero failures. |
| C6 | Step 6 | Second double count `sum_{v in L} i_{p-1}(R_v) = sum_{B in I_p(G)} sum_{s in B} lambda(s)` | verified. Both maps are exhibited: `(v,C) ↦ C ∪ {s_v}` and, for `s ∈ B` with `v` a leaf neighbour of `s`, `(B,s,v) ↦ (v, B - s)`, with the `N[s]`-avoidance of `B - s` justified from independence of `B`. Mutual inverseness follows because a leaf's neighbour is unique, so `s = s_v` (see critic pass CP-2). Claimed hypothesis-free; **reproduced as hypothesis-free**: 434/434 trees and 32,421/32,421 non-tree graphs, zero failures. |
| C7 | Step 7 | Summation: `S(G,p) = ell*M - sum_B (|B ∩ L| - sum_{s in B} lambda(s))` | verified — substitution of C4 into `S = sum_{v in L}(b_v - B_v)` (legitimate by C1's `F = L`), then C5 and C6, then `Int` distribution over finite sums. The final regrouping `- X + Y = -(X - Y)` is exact over `Int`. Reproduced end to end on every census instance. |
| C8 | Composition | The conclusion reached is *identical* to the intended claim, with all four hypotheses and no additional hypothesis | verified — the derived equality, the contract `conclusion` node, the awarded statement in the Stage 6 synthesis, the U adjudication's stable statement, and the terminal Lean type are the same statement under the definitional dictionary above. |

No ledger row closed as: false by counterexample, unsupported gap, citation
mismatch, hallucination risk, needs author decision, disputed, or blocked.
Two rows carry recorded imprecisions that do not change their verdicts
(CP-1, CP-2 below).

## Reproduced Mathematical Evidence

All evidence below is from an evaluator this seat wrote from scratch under
`scratchpad/c5-s7-informal/` (`evaluator.py`, `supplement.py`; Python standard
library only). **No prior evaluator was imported, opened, or consulted** — not
the frozen r23 evaluator, not C-U3-T's `ri_check.py`, not C-U3-F's
`ri_attack2.py`/`ordinary_tree.py`. Independent-set enumeration is brute force
over all `2^n` vertex subsets with no shortcuts; trees are generated by
leaf-addition with AHU canonical-form dedup; non-tree graphs are enumerated
exhaustively over all labeled edge sets. Raw outputs: `results-n11.json`,
`supplement.json`.

**1. Residual trees — the identity reproduces.**
Non-isomorphic trees, `2 ≤ n ≤ 11`, with `alpha ≥ 2`: 434 checked (one tree,
`K_2`, skipped for `alpha = 1`).

| Class | Count | `S(G,p) = RHS` |
|---|---|---|
| satisfying `hyp-residual` | 163 | **163 / 163 hold** |
| satisfying all four hypotheses | 145 | **145 / 145 hold** |
| all four, with some support carrying `lambda(s) ≥ 2` | 134 | **134 / 134 hold** |
| failing `hyp-residual` | 271 | **0 hold, 271 fail** |

Per-step tallies on the 163 residual trees: Steps 1-6 each hold 163/163, zero
failures.

**2. A support carrying several leaves (`lambda(s) ≥ 2` matters).**
`K_{1,6}` (7 vertices, centre `0`): `alpha = 6`, `p = 5`, `x(G) = 3`, so
`x+2 = 5 ≤ 5` — **all four hypotheses hold**, `hyp-eligible` included.
`L = {1,…,6}`, `ell = 6`, `M = 1`, `lambda(0) = 6` and `lambda(s) = 0`
elsewhere. Computed `S = -24` and `RHS = -24`; equality holds. The largest
such instance in the census is `K_{1,10}` (`n = 11`, `alpha = 10`, `x = 5`,
`x+2 = 7 ≤ 9`), `lambda(0) = 10`, `S = RHS = -80`. A mixed instance with two
distinct multi-leaf supports also holds: edges
`{01,02,03,04,15,16}`, `alpha = 5`, `x = 2`, `lambda(0) = 3`, `lambda(1) = 2`,
`S = RHS = -16`. These confirm the r23 rule that leaves sharing a support
remain separate summand tags: the aggregate is per leaf, not per support, and
the identity is exact under that reading.

**3. `K_{1,2}` at `p = 1`, fully expanded.**
`alpha = 2`, `p = 1`, coefficient vector `i = (1, 3, 1, 0)`, so
`Delta_0 = +2`, `Delta_1 = -2`, giving `x(G) = 1` and
`x+2 = 3 > 1 = alpha - 1`: **`hyp-eligible` is FALSE at `K_{1,2}`**, while
`hyp-tree`, `hyp-alpha`, and `hyp-residual` all hold. `L = {0,2}`, `ell = 2`,
`M = 1`, `lambda(1) = 2`.
Per leaf (`v = 0` and `v = 2`, both with `s_v = 1`): `a_v = -2 < 0` (favorable);
`i_1(H_v) = 1 = M`, `i_0(H_v) = 1`, so `b_v = 0`; `i_1(R_v) = 0`,
`i_0(R_v) = 1`, so `B_v = -1`; `b_v - B_v = +1`, matching Step 4's
`M - i_0(H_v) + i_0(R_v) = 1 - 1 + 1 = 1`. Hence `S = +2`.
Right side: `I_1(G) = {{0},{1},{2}}` contributes `1-0`, `0-2`, `1-0`, summing to
`0`, so `RHS = 2·1 - 0 = 2`. **The identity holds at `K_{1,2}`: `S = RHS = 2`.**
This reproduces C-U3-F's finding exactly and confirms why `hyp-eligible` is
mandatory in the *statement* although unused in the *proof*: `K_{1,2}` is a
top-rank residual row with `S = +2 > 0`, so the capsule's unqualified `(RC)`
equivalence is false, and only eligibility excludes this row. The theorem under
audit asserts none of that — it asserts the equality, which `K_{1,2}` satisfies.
Corroborating general fact recomputed here: at `p = 1`,
`sum_{B in I_1(G)}(|B ∩ L| - sum_{s in B} lambda(s)) = ell - sum_s lambda(s) = 0`,
so the identity degenerates to `S = ell·M`. Verified on all 6,222 graphs
`n ≤ 6` with `alpha = 2`; zero deviations.

**4. Non-residual trees — the identity fails, as required.**
All 271 non-residual census trees fail; zero accidental holds. Worked
counterexample, `P_4` (`0-1-2-3`): `alpha = 2`, `p = 1`, `L = {0,3}`,
`ell = 2`, `M = 3` (max independent sets `{0,2}`, `{0,3}`, `{1,3}`), so
`RHS = ell·M = 6`, while `S = +2`. Step 1 still holds (both leaves are
favorable), but Steps 2, 3, and 4 all fail: `i_1(H_0) = 1 ≠ 3 = M` and
`i_1(R_0) = 1 ≠ 0`. The failure is localized exactly where the informal proof
places its dependence on `hyp-residual`, which is the strongest available
confirmation that the proof's hypothesis accounting is honest.

**5. Non-tree graphs satisfying the hypotheses minus `IsTree` — reported, not
used to change the statement.**
All labeled simple graphs `2 ≤ n ≤ 6` that are not trees and have `alpha ≥ 2`:
32,421 instances.

| Class | Count | Result |
|---|---|---|
| satisfying `hyp-residual` | 26,239 | **identity holds 26,239 / 26,239**; Steps 1-6 each hold 26,239 / 26,239 |
| of those, also satisfying `hyp-eligible` | 91 | all hold |
| failing `hyp-residual` | 6,182 | **identity fails 6,182 / 6,182** |

Targeted larger non-tree residual instances also hold: triangle + 1 pendant
(`n = 4`, `S = RHS = 2`); triangle + 4 pendants at one vertex (`n = 7`,
`lambda = 4`, `S = RHS = -20`); `C_4` + 3 pendants at one vertex (`n = 7`, all
four hypotheses hold, `S = RHS = -12`); `C_5` + 3 pendants (`n = 8`,
`S = RHS = -21`); triangle with 3 pendants at each of two vertices (`n = 9`,
all four hypotheses hold, `ell = 6`, `S = RHS = -30`). Leafless graphs
(`C_4`, `C_5`, two disjoint triangles, two isolated vertices) satisfy
`hyp-residual` vacuously and give `S = 0 = RHS`.

**Report (no statement change proposed or made):** within this census,
`hyp-tree` is not needed for the conclusion — `hyp-alpha` together with
`hyp-residual` suffices, because (i) Steps 2-7 never invoke acyclicity or
connectivity, and (ii) the only tree-dependent step, Step 1, is discharged for
arbitrary graphs in this range: every leaf of every graph `n ≤ 6` with
`alpha ≥ 2` is favorable at `p = alpha - 1` (33,861 / 33,861, zero failures).
This is consistent with the awarded statement, which the synthesis explicitly
requires to retain `hyp-tree` because removability is *unproved*; a finite
census does not prove removability, and this seat proposes no change. It is
recorded as evidence for the controller only. Nothing here weakens the claim:
a theorem with a redundant hypothesis remains true.

**6. Convention checks.**
Deletion convention: counting over the original vertex type while avoiding `D`
agrees with literally forming the induced subgraph `G - D` on 5,148,344
`(G, D, k)` triples (all graphs `n ≤ 6`, all `|D| ≤ 2`, all `k`), zero
mismatches. `sum_s lambda(s) = |L|` on all 33,866 graphs `n ≤ 6`. `x(G)`
computed by first strict descent, matching `SOLUTION-CONTRACT.md` §Exact
conventions ("`x(T)` is the first strict descent index") and r23 L34.

**Aggregate reproduction count.** Zero identity failures in 163 residual trees,
145 all-four-hypothesis trees, 26,239 residual non-tree graphs, and 10 targeted
or edge-case instances (`n` up to 11); 271 + 6,182 required failures on
non-residual instances,
all present. No instance contradicted any step of the proof under its stated
hypotheses.

## Independent Critic Pass

A separate adversarial pass was run over the ledger above, against the
unchanged claim, before closing any row. Six lines of attack were pursued.

**CP-1 — Internal inconsistency in the proof's own hypothesis accounting
(recorded imprecision; ledger row H1/C1 unchanged).** `INFORMAL-PROOF.md`
§"Quantifiers and hypotheses" says "`hyp-tree` and `hyp-eligible` are retained
in the declaration even though the proof below does not use them for the
counting argument … per the synthesis's explicit F7 precedent (`_hTree`
retained unused there)", and `FORMALIZER-REPORT.md` states more flatly that
"`hTree` is likewise unused by the counting argument, retained per F7
precedent". This sits awkwardly beside Step 1, which applies F7 *with*
`hyp-tree` and says so explicitly ("using only `hyp-tree`, `hyp-alpha`, and
that `v` is a leaf"). The terminal Lean proof likewise passes `hTree` into
`C4LA1.topRankSelectorCollapse`, and the contract's own
`formulation_status.evidence` calls all four hypotheses load-bearing.
Adjudication: this is an **imprecision in a side remark**, not a defect in the
derivation. The remark is literally true under the narrow reading it states
("for the counting argument", i.e. Steps 2-7); Step 1, which is where
`hyp-tree` enters, is stated correctly and completely. Nothing in the
derivation of the claim from the four hypotheses depends on resolving the
remark, and no step is left unsupported by it. Recorded, not softened: had the
proof actually failed to supply `F = L`, this would be a failing defect.
The controller may wish to have the side remark tightened editorially.

**CP-2 — Step 6's inverse map is asserted slightly faster than Step 5's
(recorded imprecision; ledger row C6 unchanged).** Step 5 names its two maps
mutually inverse and exhibits both identities. Step 6 exhibits both maps and
their well-definedness but closes with "a `Finset.sum_comm`-style reindexing of
the same doubly-indexed finite sum" rather than writing the two inverse
identities out. The suppressed step is that for a leaf `v` adjacent to `s`, the
uniqueness of a leaf's neighbour forces `s = s_v`, after which
`(C ∪ {s_v}) - s_v = C` (as `s_v ∉ C ⊆ V - N[s_v]`) and `(B - s) ∪ {s} = B`
(as `s ∈ B`) are immediate. The critic pass reconstructed both identities in
full and found them correct, and the recomputation verified the resulting
equality of sums on 32,855 instances with zero failures — including every
non-residual and non-tree instance, confirming the claimed
hypothesis-freeness. Verdict: verified with reproduced evidence; the elision is
routine, not a gap.

**CP-3 — Attempt to falsify the identity by breaking a hypothesis one at a
time.** Dropping `hyp-residual` breaks the identity on 100% of instances tested
(271 trees, 6,182 non-tree graphs). Dropping `hyp-alpha` is not a live attack
within the statement's own reading, since `alpha ≥ 2` is what makes `p - 1`
well-behaved. Dropping `hyp-eligible` never breaks the identity (attempted on all 18
residual census trees that fail it, including `K_{1,2}`, `K_{1,3}`, `K_{1,4}`,
`K_{1,5}`) — the proof says it is unused, and the attack confirms the
proof's own disclosure rather than contradicting it. Dropping `hyp-tree` never
broke the identity in this census either; that is reported above as evidence,
and is not treated as a defect, because a retained hypothesis cannot falsify an
implication.

**CP-4 — Attempt to find a hidden sign or inequality smuggled into the
equality.** The conclusion computes `S` to `+2` on `K_{1,2}` and to negative
values on the star family; the claim survives both signs unchanged, which is
precisely what an equality (as opposed to a nonpositivity claim) must do. No
step of the proof assumes or concludes `S ≤ 0`, and no step uses a sign of any
`b_v - B_v` (Step 4 is an identity, not a bound).

**CP-5 — Attempt to find a boundary case the proof does not cover.**
Leafless graphs (`ell = 0`, empty favorable set) — covered, both sides are `0`,
matching r23's "the empty favorable set has aggregate zero". Rank boundary
`p - 1 = 0` — reached at `alpha = 2` (e.g. `K_{1,2}`), handled correctly;
`i_{-1}` is never reached, matching C-U3-F's boundary note. `alpha = 1` (e.g.
`K_2`) is excluded by `hyp-alpha` and was excluded from the census.
Multi-leaf supports, disconnected graphs, and graphs with a leaf adjacent to a
leaf were all exercised.

**CP-6 — Attempt to find a mismatch between the intended claim and what is
derived.** The proof's §"Exact awarded theorem" reproduces the awarded
statement; the derived equality in Step 7 is syntactically the conclusion of
the intended claim under the D1-D12 dictionary; the contract's `conclusion`
node, the Stage 6 synthesis's "Exact statement", the U adjudication's "Stable
statement", and the terminal Lean type all agree. No scope creep from "literal
ordinary-tree scope" was found: the proof narrows to no named tree family and
introduces no fifth hypothesis.

Prover verdict and critic verdict agree on every ledger row, with independent
evidence (source-literal check plus executable recomputation) behind each.
Two imprecisions are recorded (CP-1, CP-2); neither is an unsupported gap,
neither changes a verdict, and neither was resolved by repairing the proof —
this seat repaired nothing.

## Scope and Fence Check

Checked against the fences in the Stage 6 synthesis `## Lean awards`, the U
adjudication `## Lean readiness`, the F1 capsule's binding notes, and the
proof's own §"Status and scope".

| Fence | Finding |
|---|---|
| No `(RC)` in any form | **Clean.** The only occurrences of "(RC)" in the claim, the contract, or the proof are explicit disclaimers of it ("asserts no (RC) content"; "does not assert, weaken to, or accompany with `(RC)` in any form"; and the controller note that omitting `hyp-eligible` would risk misreading the statement as licensing the FALSE unqualified `(RC)` equivalence). No `(RC)` node appears in the dependency graph. `Main.lean` contains no `(RC)` content at all. |
| No unqualified `(RC)` equivalence inherited | **Clean.** The proof names the equivalence as false and refuted at `K_{1,2}`; this seat independently reproduced that `K_{1,2}` is a positive top-rank residual row (`S = +2`), so the equivalence is indeed false and is correctly *not* asserted. |
| No inequality, no sign, no nonpositivity claim about `S` | **Clean.** The conclusion is an equality in `Int`. No comparison operator is applied to `S` anywhere in the claim, the contract conclusion, the proof, or the Lean statement. The only strict inequalities in the proof are `a_v < 0` (F7's favorability, a definitional filter condition) and `i_p(R_v) = 0` derived by contradiction — neither is a claim about `S`. |
| No reduced lower guard, no universal qualifying deletion | **Clean.** Neither appears; the proof does not mention `D_d`, `Elig_d`, `T_d`, or the reducer. |
| No `Γ`/Hall reformulation | **Clean.** No occurrence. |
| No literal-to-governed transport | **Clean.** No `RTree`, no governed scope, no transport claim. The proof's scope line states literal ordinary-tree scope only. |
| No `E993-BETA-AGG` (or `E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT`, `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`) | **Clean.** The only occurrences are in the proof's scope paragraph, which records them as REFUTED and neither reopened nor renamed. No REFUTED claim is regressed to OPEN and none is renamed. |
| No Erdős #993 | **Clean.** The claim does not mention it; the proof mentions it only to disclaim it. |
| All four hypotheses present in the claim | **Confirmed.** The `informal_statement` carries, in order: "if G is a tree" (`hyp-tree`), "2 <= G.indepNum" (`hyp-alpha`), "x(G)+2 <= G.indepNum-1" (`hyp-eligible`), "every leaf of G belongs to every maximum independent set of G" (`hyp-residual`). All four also appear as binders in the terminal Lean declaration and as `hypotheses` entries with edges into the conclusion node in the contract's dependency graph. |
| No `sorry` / `admit` / `native_decide` | None present in `Main.lean` (independently grepped). Kernel status is another seat's gate; noted only, not certified here. |
| Statement stability | The claim matches the Stage 6 synthesis's "Exact statement" and the U adjudication's "Stable statement" word for word in content, and the `(RI)` equality matches the F1 capsule's quoted `(RI)` block verbatim in structure and sign. |

Two scope observations, offered as evidence and not as changes: (a) `hyp-eligible`
is not used by the derivation, which the proof discloses and this audit
confirms; (b) `hyp-tree` was not needed for the conclusion anywhere in this
seat's census, which does not establish removability and does not affect the
truth of the claim as stated.

## Verdict

passed

Every claim in the ledger — twelve definitional rows checked literally against
`sources/r23/SEMANTIC-CONTRACT.md` lines 30-48 (plus line 49 and the F1 capsule
for `S(T,p)` and `lambda(s)`), four hypothesis rows, and eight inference rows
covering the bijection `I_alpha(G) ≅ I_p(H_v)`, the vanishing `i_p(R_v) = 0`,
the per-leaf summand identity, the two double counts, the summation, the F7
discharge of `F = L`, and the role of each of the four hypotheses — closed as
verified with reproduced evidence from an evaluator written independently for
this audit. No unsupported gap, no citation mismatch, no false step, and no
fence violation was found. `claim_sha256` was recomputed and matches. Two
imprecisions are recorded in the critic pass (CP-1, the proof's side remark
about `hyp-tree` sitting awkwardly beside its own Step 1; CP-2, Step 6's
inverse map left implicit); neither is a defect in the derivation, neither was
repaired by this seat, and neither is used to soften anything — each is reported
so the controller may decide whether to have the prose tightened.
