# Critique

**Critic:** `C-U3-T`, Cycle 2, Stage 4, r31 (Erdős #993, CB(8,m) uniform switch). Cross-orientation critic of orientation T (prove), assigned to the return of seat `U3` (route `C2-U-03 FORMAL-CB-INDEPENDENCE-POLYNOMIAL-CLOSED-FORMS`, orientation U).
**Date:** 2026-09-28 (~02:15 EDT by the clock).

**Boot.** I'm operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I read no other VerityOS file. Everything else I read is under this run root, inside the capsule grant (the protocol, common brief, own attack-brief section, contracts, allocation, Stage 1 gate, the Stage 2/3/4 manifests, the Stage 3 disclosures record, the return), the frozen `sources/` tree, the return's inventoried scratch (`scratchpad/c2-U3/`, `scratchpad/c2-U3-replay/replay-U3.sh`), and Mathlib sources (read for API meaning only).

**Read-boundary disclosures (this critic).**
1. The harness put the project `CLAUDE.md`, the user memory index (`MEMORY.md`) and the user's email into my context automatically. I did not fetch them with a tool call. I didn't use them, and I didn't act on the conversation-logging instruction, because the controller owns logging for this run.
2. A `grep` was run inside the Mathlib package directory (`~/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/mathlib/Mathlib/...`) for API names. This was for API meaning only and stayed inside the pinned package.
3. `ls` (names only) of the return's scratch directories and of `cycles/cycle-2/stage4/critics/U3/` (to create my output directory). That listing showed a sibling directory named `F`. I did not open it or anything under it.
4. I did not run the return's `replay-U3.sh` as shipped, because it writes into `scratchpad/c2-U3-replay/`, which is outside my scratch. I ran the same copy-out-first build under my own scratch instead.
5. My first shell call printed a zsh `=====` separator error (`(eval):1: ===== not found`). It had no effect on any read or write.
6. **Process listing (a disclosure).** Just before closing, I ran a user-scoped `ps`, filtered by grep for `lake`, `lean` and my Python script, to confirm that I had no job still running. The output also showed the command lines of processes I don't own: a sibling critic's Lean runs under `scratchpad/c2-crit-U1-F/` and another seat's `CriticS5.lean` run, and a Lean check under another experiment root (`erdos-993-absolute-compensation-dre-2026-09-27`). I only saw the command lines. I read no files from those processes, used nothing from them, and did not signal or kill them. None of them is mine.

## Identity and seal audit

Every value below was recomputed by me with SHA-256 over compact key-sorted JSON (manifest minus `seal_sha256`, `separators=(",",":")`, no trailing newline) or over raw bytes.

| Object | Expected | Recomputed | Result |
|---|---|---|---|
| Dispatch `DISPATCH-C-U3-T.md` (file bytes) | `225377cf…2c51727c27` | `225377cf16f6594bb16fac79970c0747e67b914c8d1e0a8a5443eb2d51727c27` | MATCH |
| **Capsule seal** `U3-PACKET-MANIFEST.json` | `f55f23f2bca05fb28f301b9b367cfedd7a486c5b2670267f17857ec208b7225b` | same | **MATCH** |
| Capsule members (14 files: bytes + sha256) | per manifest | all 14 | ALL MATCH |
| Stage 2 seal | `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4` | same | MATCH (2799 files, as the return says) |
| Stage 3 seal | `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5` | same | MATCH |
| Stage 4 dispatch seal | `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb` | same | MATCH |
| Return `RETURN.md` | `288810f6…d0b3d2ceeb`, both in the capsule and in the Stage 3 manifest | `288810f6a13b3bbb7142089dd44ff0f90bd5c5e95ec53a85d44029d2e1d5b0f3` | MATCH (unchanged since the Stage 3 seal) |
| `U3.lean` (return's digest) | `bacc48086c1306548f9757f63b041a0ed2ca8151629509ccd7e0e4cb9f25e9e0` | same | MATCH |
| Carried `Main.lean` (C1-LA2) | `a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f` | same; the scratch copy is byte-identical (`cmp`) to `sources/c1-results/runs/lean-2026-09-28-c1-la2-cb8-definition-layer/LeanProject/LeanProof/Main.lean` | MATCH (84219 bytes, 1701 lines) |
| All 230 files of the C1-LA2 run against `sources/c1-results/SOURCE-DIGESTS.json` | — | 230/230 | ALL MATCH |
| 78 `Snippets/*.lean.fragment` (my copy against the source) | — | byte-identical | MATCH |
| `sources/mathlib-binding/PIN.json` | `af78b3d8e94a358eb69719280ba3bf79c7bf400d468c6143e07313dbfcbd3ba0` | same, and equal to its `sources/SOURCE-DIGESTS.json` row | MATCH |
| Mathlib rev of the shared project | `905b95818eb32af7874a58b427f50c1711a5e96c` | `git rev-parse HEAD` of the bound package = same; toolchain `leanprover/lean4:v4.32.2` | MATCH |
| CF-C2-G file `control/C2-STAGE3-CONTROLLER-FACT-G.json` | `7582bb5e…c408f3` | not hashed (not a capsule member); the same digest string appears in the sealed Stage 3 disclosures record | carried, not independently hashed |

The return's entry-number claims are exact against the carried file:
- entry 1 is `vertexDeletionIndepSetCount`
- entries 7 and 8 are `H` and `R`
- entry 10 is `indepSetCount`
- entry 22 is `crossingIndex`
- entry 31 is `support_eq_of_isGraphLeaf_of_adj`
- entry 35 is `cbGraph_adj_iff`
- entries 39, 42, 67 and 68 are `cbGraph_adj_s_v`, `cbGraph_adj_support_leaf`, `cb_isGraphLeaf_v` and `cb_isGraphLeaf_leaf`

The five new declaration names occur nowhere in `Main.lean`, so there is no Lean-name collision.

## Independent re-derivation

**Instrument 1: independent counts, no closed form used.** `scratchpad/c2-crit-U3-T/py/cb_counts.py` uses the standard library and exact integers only.
- It builds CB(8,m) from the frozen labelling (0 = r, 1 = s, 2 = v, `u_i = 3+17i`, `b_ij = u_i+1+2j`, `c_ij = u_i+2+2j`) and asserts `|E| = n − 1`.
- It counts `i_k(G − D)` by a rooted forest DP over the literal graph, for `D ∈ {∅, {v}, {v,s}, {c_ij}, {c_ij, b_ij}}`.
- It compares each count vector with the contract closed forms, and with my own derived closed forms for the two H-residuals: `I(CB − {v,s}) = G^m + x(1+2x)^{8m}` and `I(CB − {c,b}) = (1+2x)G'G^{m−1} + x(1+x)(1+2x)^{8m−1}` with `G' = (1+2x)^7 + x(1+x)^7`.
- It checks the return's Theorem 3 and Theorem 4 recursions coefficientwise for every `k ≤ α+1`.
- It computes `x` as the first strict descent through rank `α`, so the terminal difference `Δ_α = −i_α` counts.

| m | n | α | x | p* | all checks (7) |
|---|---|---|---|---|---|
| 0, 1, 2, 3, 4, 5, 7 | 3, 20, …, 122 | — | — | — | True |
| 95 (fixed point) | 1618 | 856 | 506 | 508 | True |
| 107 (control; fixed point) | 1822 | 964 | 570 | 572 | True |
| 110 (control) | 1873 | 991 | 586 | 588 | True |
| 113 (control) | 1924 | 1018 | 602 | 604 | True |
| 116 (fresh) | 1975 | 1045 | 618 | 620 | True |
| 119 (fresh) | 2026 | 1072 | 634 | 636 | True |

- The contract fixed points `CB(8,95)`: `n = 1618, α = 856, x = 506` and `CB(8,107)`: `n = 1822, α = 964, x = 570` are reproduced.
- The contract's `G = (1+2x)^8 + x(1+x)^8` (the non-swapped `G` of CF-C2-G) is the one that matches the DP. The swapped form does not.

Census discipline: these rows are bounded evidence. They discover and test; they prove nothing universal.

**Instrument 2: Lean rebuild, copy-out-first.**
- In `scratchpad/c2-crit-U3-T/LeanProject/` I copied the carried C1-LA2 project from `sources/` (not from the seat's scratch) and `U3.lean` from the seat's scratch.
- I bound Mathlib by manual symlink of `.lake/packages`, and ran every call after `cd` into the project.
- There was no `lake update` or `lake clean`.
- `lake build LeanProof.U3` gave `Build completed successfully (8656 jobs)`, with the one reported linter warning (unused `[DecidableEq V]` on `leaf_neighborFinset_eq`).
- `#print axioms` on all five U3 theorems gives `[propext, Classical.choice, Quot.sound]`, with no `sorryAx`.
- `grep` finds no `sorry`, `admit`, `native_decide` or `axiom` in `U3.lean`.

I read every statement against the carried definitions:
- **Theorem 1** (`indepSetCount_succ_split`) is the exact vertex-split identity `i_{k+1}(G−D) = i_{k+1}(G−D−x) + i_k(G−D−N[x])` for any `x ∉ D`. The closed neighbourhood is `insert x (D ∪ N(x))`. Both sides count sets of the stated size exactly (`powersetCard`). There is no off-by-one: the identity is stated at `k+1`, and the `k = 0` case (`i_0 = 1`) is outside its scope and trivial.
- **Theorem 2**'s identification of `insert x (∅ ∪ N(x))` with the carried `H G x = {x, support G x}` is correct at any leaf.
- **Labelling.** I kernel-checked it by `decide` at `m = 1`: `s–v` = `1–2` and `b_00–c_00` = `4–5` are edges, `5–6` is not, and `b_07–c_07` = `18–19` is an edge. So `v = cbVertex m 2` and `c_ij = u_i + 2 + 2j = 3+17i+2+2j`, matching entry 23's frozen labelling and SEMANTIC-CONTRACT §2.

## Attacks and findings

**A1. Statement fidelity: holds.** Theorem 1 splits the named vertex `x` (any vertex, `x ∉ D`) and counts independent sets of size exactly `k+1` and `k`. Theorems 3 and 4 split at `v` (support `s = 1`) and at `c_ij` (support `b_ij = 3+17i+1+2j`), under the hypotheses `i < m` and `j < 8` that the carried leaf facts need. There is no ℕ-subtraction and no hypothesis that encodes the conclusion. Instrument 1 confirms both recursions at every `k` on 13 rows. **No defect.**

**A2. The gate line `ELIG_formal: advanced` overstates what the return itself delivers. Narrowed.**
- The return's five theorems are the standard vertex-split and leaf recursions.
- The return names the node that actually carries the closed form: the root split plus the `m`-ary disjoint-branch product. It did not attempt that node.
- The leaf corollaries (Theorems 2–4) are not on the path to `I(CB(8,m))`. That path deletes the root, not a leaf. Of the five theorems, only Node 0 (Theorem 1) is used in the critic's completed chain (A8).
- On its own, the return moves nothing toward conjunct 2 beyond a generic lemma. The U3 allocation itself calls this infrastructure: "the closed forms are `proved_informal` nodes, not Tier 2 progress."

**A3. Remaining obligation, item 3: imprecise attribution of `G_c`.**
- The residual term in Theorem 4 is `indepSetCount (cbGraph m) (H c_ij) k`, the counts of `I(CB − {c_ij, b_ij})`.
- Its damaged branch has polynomial `G' = (1+2x)^7 + x(1+x)^7`, not `G_c`.
- `G_c = (1+2x)^7(1+x) + x(1+x)^7` is the damaged branch of `I(CB − c_ij)` itself (where `b_ij` survives as a leaf of `u_i`).
- Identity check: `G − G_c = x·G'`. Both forms are confirmed by Instrument 1 on all 13 rows.
- This does not affect any compiled statement, but a successor should not transcribe `G_c` into the H-residual.

**A4. Certification literal "198 lines after the file's own import line": wrong by one.** `U3.lean` has 198 lines in total, of which 197 follow the import. Struck (see the audit below). It does not affect anything downstream.

**A5. CF-C2-G (which `G` the return used): clean.**
- `U3.lean` encodes no polynomial at all. Its only `(1+…)` text is a docstring, which quotes `I(CB − v) = (1+x)G^m + x(1+2x)^{8m}` correctly.
- The return's prose writes the contract `G = (1+2x)^8 + x(1+x)^8` (non-swapped).
- The critic's Lean (A8) encodes the non-swapped `G`, and Instrument 1 matches it.

**A6. Fidelity items (active-tag weight, (D) ∪ (S), `F_{p*}`, WID).** Not applicable: the return builds no network instrument and makes no network claim. `x` is computed through `α` in my instrument, as stated. Nothing downstream needs striking.

**A7. Observation from bounded data, not proof.** At all six class and control rows (95, 107, 110, 113, 116, 119), `x = p* − 2` exactly. So conjunct 2 (`x + 2 ≤ p*`) holds with zero slack, and (ELIG-top)(a) is exactly the inequality it needs. A formal proof has no room to spare: it must establish `i_{p*−1} < i_{p*−2}` itself, not a weaker neighbour.

**A8. Critic-derived advance (attributed to critic C-U3-T, Claude Opus 5.5): the blocked node closed in scratch, and the closed forms made Lean identities.** Mathlib (rev `905b958`) has no independence polynomial and no disjoint-union or product formula for independent sets; I searched `Combinatorics/SimpleGraph`. So I proved the lemma directly. All of the following compile sorry-free on the carried C1-LA2 layer plus U3's `U3.lean`, and `#print axioms` gives `[propext, Classical.choice, Quot.sound]` on each; 25 declarations were audited, see `audit-axioms.log`.

*Generic layer* (`LeanProof/CriticU3T.lean`, 346 lines, sha256 `b2f134b8…`):
- **Binary convolution.** `critU3T_indepSetCount_disjoint_split`: if the survivors of `G − D` split into disjoint `P`, `Q` with no `P`–`Q` edge, then `i_k(G−D) = Σ_{a+b=k} i_a(G−(D∪Q))·i_b(G−(D∪P))`. The proof is a fiberwise count plus a `card_nbij'` bijection `A ↦ (A∩P, A∩Q)`.
- `critU3T_indepPoly G D : Polynomial ℕ` with `critU3T_coeff_indepPoly : coeff k = C5LA1.indepSetCount G D k` (exact; zero above `|V|`).
- `critU3T_indepPoly_disjoint_mul`: the binary product.
- **`critU3T_indepPoly_eq_prod`: the `m`-ary branch product** (Finset induction; pairwise-disjoint parts, no cross edges).
- `critU3T_indepPoly_vertex_split`: **U3's Node 0 in polynomial form.** This is where the return's Theorem 1 becomes load-bearing.
- `critU3T_forwardDifference_eq_coeff`.
- `critU3T_cb_minus_root_prod`: `I(CB(8,m) − r) = ∏_{i ≤ m} I(branch_i)`.

*CB layer* (`LeanProof/CriticU3T2.lean`, 408 lines, sha256 `74a1c05c…`):
- Small parts: `critU3T_indepPoly_single` (`1+X`) and `critU3T_indepPoly_edge` (`1+2X`).
- Pendant `{s,v}`: `1+2X`.
- **Gadget** `critU3T_cb_gadget`: `(1+2X)^8 + X(1+X)^8`, the contract's `G` at `d = 8`.
- The `8m` support–leaf edges: `(1+2X)^{8m}`.
- `CB − N[r]`: `(1+X)(1+2X)^{8m}`.
- `CB − {r,s,v}`: `G^m`.
- **`critU3T_cb_indepPoly_closedForm`**: `I(cbGraph m) = (1+2X)·G^m + X·(1+X)(1+2X)^{8m}`, for every `m`.
- **`critU3T_cb_indepSetCount_eq_coeff`**: `C5LA1.indepSetCount (cbGraph m) ∅ k` = the `k`-th coefficient of that closed form.
- **`critU3T_cb_minus_v_closedForm`** and **`critU3T_cb_vertexDeletion_v_eq_coeff`**: `C4LA1.vertexDeletionIndepSetCount (cbGraph m) (cbVertex m 2) k` = coefficient `k` of `(1+X)G^m + X(1+2X)^{8m}`. This is the arm-leaf polynomial that favorability at `v` reads.
- `critU3T_cb_crossingIndex_le_of_coeff`, and **`critU3T_cb_conjunct2_of_coeff`**. For `m ≥ 107`, the coefficient inequality `coeff_{p*−1} < coeff_{p*−2}` of the closed form implies `C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16m+4)/3`, which is conjunct 2 of the carried terminal `cb8_topRank_of_descent_and_flow`, verbatim.

Disclosure on this scratch:
- Five declarations carry `set_option maxHeartbeats 4000000 in`, because of `omega` case splits over `cbEdge`. This is an elaboration budget, not a trust change.
- No `sorry`, `native_decide`, `decide` or new `axiom` is used in these theorems.

Grade: compiled scratch, **no grade** (SOLUTION-CONTRACT §4). Every closed form here is the r30 closed-form node, formalized. It is a mathematical alias of that `proved_informal` node, not a new identity, and it is not Tier 2 progress.

What this does: it discharges the U3 allocation's obligation for `I(CB)` and `I(CB − v)`, and it wires conjunct 2 to a pure integer coefficient inequality, which is exactly the form U1's theorem is to supply. It does **not** prove (ELIG-top)(a).

## Mechanism-equivalence and fence check

- **One rank, class only.** The polynomial identities hold for every `m` because they are graph identities of CB(8,m) (the U3 allocation asks for exactly that). No eligibility or (HALL) statement is made outside the class; the conjunct-2 bridge is stated under `107 ≤ m`. Nothing is claimed at other ranks, at `d ≠ 8`, or for arbitrary trees.
- **Darroch/Newton.** Neither the return nor the critic uses them. The non-real-rooted `I`, `G` and `G^m` appear only as exact integer polynomials; no mode or log-concavity claim is made.
- **Refuted mechanisms.** None is revived. Branch multiplicativity of independence polynomials over a disconnected graph is an exact identity, not the refuted forest real-rootedness and not a compression lemma.
- **No status transfer.** No aggregate key, (HALL), TREE, FOREST or #993 status is touched. Census rows (A7) are bounded evidence only.
- **Claim identity.** The return touches no registry key and proposes no `E993-R31-` candidate; I confirm this. If the synthesis wants to register the critic's closed-form theorems, they alias (mathematically) the r30 closed-form node (the T1 closed forms of r30 Cycle 6, SEMANTIC-CONTRACT §2). They should be recorded as a formalization of that node, not as a new key. A lexical alias check of such a key against the run-local registry and master-494 would still be needed; I made no registration text.
- **Gate ruling 12 (carries).** `Main.lean` and the 78 snippets are byte-identical to the frozen C1-LA2 run, and all 230 files of that run verify against `sources/c1-results/SOURCE-DIGESTS.json`. Neither the seat's scratch nor mine re-types a carried definition.
- **Gate ruling 13 (no re-proving the closed).** Neither file re-proves a C1-LA award; both only consume its entries.

## Certification audit

| Literal in the return | Evidence shipped | Ruling |
|---|---|---|
| "sorry-free", "no `native_decide`, no new `axiom`" | rebuild + `#print axioms` (mine) + grep | **backed** |
| `#print axioms` = `[propext, Classical.choice, Quot.sound]` on all five | reproduced | **backed** |
| "Build completed successfully (8656 jobs)" | reproduced exactly | **backed** |
| U3.lean sha256 `bacc4808…` | reproduced | **backed** |
| Main.lean sha256 `a906ec17…`, 84219 bytes, 1701 lines; "byte-identical to the carried award" | reproduced | **backed** |
| Stage 2 seal MATCH; 2799 files | reproduced | **backed** |
| "C1-LA2 award, all 83 files … ALL OK" | 230/230 of the whole C1-LA2 run verified by me (a superset) | **backed** |
| PIN.json sha256; Mathlib rev | reproduced | **backed** |
| Entry numbers 1/7/8/10/22/31/35/39/42/67/68 | read in carried file | **backed** |
| "198 lines after the file's own import line" | the file has 198 lines in total, 197 after the import | **STRUCK**; correct literal: "198 lines including the import" |
| `ELIG_formal: advanced` (for the return's own work) | the return proves only the generic split; the load-bearing node was not attempted | **narrowed** (A2); the critique's gate line below rests on the critic-derived scratch |
| Remaining-obligation item 3 "matching `G_c`" for the H-residual | the residual's damaged branch is `G'`, not `G_c` | **corrected** (A3) |
| "likely comparable in size to Node 0 … or larger" (estimate) | the critic's generic product is ~170 lines | an estimate, not a certification; no ruling |
| Replay "already executed once … digests matched" | a self-report; I did not run the seat's script (disclosure 4), but my equivalent copy-out build reproduced the same outcome | **backed by replay** |
| Disclosures (out-of-grant `skills/optimization-loop/skill.md` read; transient `/tmp` file) | self-report; `/tmp` is outside my grant and was not inspected | recorded, not verifiable by this critic; no evidence depends on either |

`## Remaining obligation` of the return: items 1–2 are **discharged in critic scratch** (A8). Item 3 is discharged for `v`, is open for `c_ij`, and carries the A3 correction. Item 4 is **discharged in critic scratch** as a bridge; the coefficient inequality itself stays open. Item 5 is strategic, and no ruling is needed. As written, the section was exact about what the return did not do, apart from A3.

## Verdict

The return's mathematics is correct, kernel-checked and faithful to the carried definitions and the frozen labelling. It is narrowed for two reasons: its own contribution is the generic vertex/leaf recursion, with the load-bearing multiplicativity node left unattempted (A2); and one certification literal is struck (A4) and one remaining-obligation remark corrected (A3). The critic-derived scratch (A8) closes the U3 allocation's node for `I(CB(8,m))` and `I(CB(8,m) − v)`. It uses the return's Node 0 as a component, and it reduces terminal conjunct 2 to the pure coefficient inequality (ELIG-top)(a). All of it is compiled scratch with no grade, pending a governed award and an isolated second read.

verdict: retained_narrowed
headline_resolved: no

ELIG_formal: advanced
HALL_formal: not_advanced
FAV_darroch_free: not_advanced
cut_candidate: none

(`ELIG_formal: advanced` rests on the critic-derived compiled scratch of A8: the closed form as a Lean identity, plus the conjunct-2 bridge. Judged on the return's own theorems alone, the line would be `not_advanced`. Eligibility itself, meaning (ELIG-top)(a) for every class `m`, remains unproved.)

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

Background jobs: none were started. Every `lake` or `lean` call and every Python run ran in the foreground to completion, so there is no PID to kill.

## Remaining obligation

What a successor inherits, exactly:
1. **(ELIG-top)(a) as an integer statement.** For every `m ≥ 107` with `m ≡ 2 (mod 3)`, prove `coeff_{p*−1} < coeff_{p*−2}` of `(1+2X)·((1+2X)^8 + X(1+X)^8)^m + X·(1+X)(1+2X)^{8m}` in `Polynomial ℕ`, with `p* = (16m+4)/3`. This is U1's theorem. Once it holds, `critU3T_cb_conjunct2_of_coeff` gives conjunct 2 of `cb8_topRank_of_descent_and_flow` with no further graph work. The bounded record shows zero slack (A7).
2. **`I(CB(8,m) − c_ij)`** (contract: `(1+2x)G_cG^{m−1} + x(1+x)^2(1+2x)^{8m−1}`). This is not yet a Lean identity. The route is the same machinery: a root split, the product with one damaged gadget `G_c` (a split at `u_i`, with `b_ij` surviving as an isolated leaf when `u_i` is out), and the pairs minus one plus the leaf `b_ij`. By A3, the damaged branch of the H-residual is `G'`, not `G_c`.
3. **Promotion.** The critic scratch (`CriticU3T.lean`, `CriticU3T2.lean`), with U3's `indepSetCount_succ_split`, is an award candidate: "CB(8,m) closed-form coefficient identities and the conjunct-2 bridge." It needs the governed lean-proof workflow, a frozen `expected_statement`, a fidelity review of `critU3T_cbPart` and of the `Polynomial ℕ` encoding, and an isolated second read before any grade. The award must record the five `maxHeartbeats 4000000` budgets.
4. **Favorability at `v`.** `critU3T_cb_vertexDeletion_v_eq_coeff` turns `Δ_{p*}(T − v) < 0` into a coefficient inequality on `(1+X)G^m + X(1+2X)^{8m}`. The inequality itself, whether Darroch/Newton-free or not, is untouched. That is T1's object.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-U3-T/`.

| Path | sha256 | Role |
|---|---|---|
| `py/cb_counts.py` | `56cb50f4090198e585d1fb9c7c8427842541f1180ed0e7dd220c814c3a39cce3` | Instrument 1 (stdlib, exact ints; forest DP on the literal labelled graph) |
| `py/rows.txt` | `b7090e88890afa68e34b79e0b05bc273cef8940f7cfb1a26e8e22462afb079bf` | Output for rows 95, 107, 110, 113, 116, 119 |
| `LeanProject/LeanProof/Main.lean` | `a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f` | Carried C1-LA2 (copied from `sources/`, unedited) |
| `LeanProject/LeanProof/U3.lean` | `bacc48086c1306548f9757f63b041a0ed2ca8151629509ccd7e0e4cb9f25e9e0` | The seat's file (copy-out) |
| `LeanProject/LeanProof/CriticU3T.lean` | `b2f134b894d52bb83918132a6ba1d4bb74d471a870defd12ec4e6de1ec5d7aae` | Critic scratch: generic convolution / `m`-ary product / root branch product |
| `LeanProject/LeanProof/CriticU3T2.lean` | `74a1c05c71bc2606e99ec280ff57ec51464a0118da875210940b206f79498f3c` | Critic scratch: CB closed forms `I(CB)`, `I(CB − v)`, conjunct-2 bridge |
| `LeanProject/LeanProof/AuditU3.lean` | `2d48cee486afb40bb2e5eb9ef01b4ae88c466a33db4e8aedd9ed5fd8573ddadd` | Axioms of U3's five theorems + labelling `decide` checks |
| `LeanProject/LeanProof/AuditCritic.lean` | `d5e88de1aa641d1d7655ce9053b39694da8beb0d439b74438b9ed14354e81d80` | Axioms (generic layer) |
| `LeanProject/LeanProof/AuditCritic2.lean` | `a39b3298d9761c7147a7214b77470ad4b2e9c46aee0fc40d0c2bada5148d001a` | Axioms (CB layer) |
| `audit-axioms.log` | `b5a983fc37616b1789acefe7ab475ca95a8bc67e8bfb71dd14451c8b69ce59a3` | 25 × `[propext, Classical.choice, Quot.sound]`, no errors |
| `LeanProject/{lakefile.toml, lake-manifest.json, lean-toolchain}` | as in `sources/` (verified) | Pins; `.lake/packages` is a symlink to the shared Mathlib project |

Replay: `cd .../scratchpad/c2-crit-U3-T/LeanProject && lake build` (8660 jobs, success), then `lake env lean LeanProof/AuditU3.lean`, `LeanProof/AuditCritic.lean` and `LeanProof/AuditCritic2.lean`. For the counts, run `python3 py/cb_counts.py 95 107 110 113 116 119`.
