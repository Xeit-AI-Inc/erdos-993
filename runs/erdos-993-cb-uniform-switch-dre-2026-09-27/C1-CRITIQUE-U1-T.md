# Critique

Critic `C-U1-T`, r31 Cycle 1 Stage 4. This is a cross-orientation critic of orientation T (prove), assigned to seat `U1`, route `C1-U-01`, mechanism token `LEAN-CB-DEFINITION-LAYER`, orientation U.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and I read no other VerityOS file. The dispatch was verified before use: `control/dispatch/c1-stage4/DISPATCH-C-U1-T.md` has SHA-256 `b09cc34f67340fbe39a56723f465b144985849032f0d571934830d75c19f473e`, which matches.

**Read-boundary disclosures.**
- The harness injected two things into this session's context before it started: the project `CLAUDE.md` and the user's auto-memory index (`MEMORY.md`). I did not fetch either one, and I did not use either one.
- `control/C1-WORKER-COMMON-BRIEF.md` is outside my capsule. I read it because the common brief says it binds critics and "a Stage 2 member you may read".
- The brief's §4 says to compare carried entries byte-for-byte against `sources/r30/lean/*/…/Snippets/`. For that I ran two non-recursive `ls` listings and one `grep` over snippet names, all inside `sources/r30/lean/` and `sources/first-interior/`, which are within my grant.
- I ran one Python read of `sources/authority/CLAIM-IDENTITY.json` (within the grant) to check the status of the cited keys.
- I ran no search rooted above my grant. I did not read any sibling return, critique or adjudication. I used no network, installed no packages, and ran no process listing.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Capsule seal.** `control/c1-critic-capsules/U1-PACKET-MANIFEST.json` has inner seal `4a9b8d7bc5e561f77349573822d2c097a16dfbd261e9d2ffe287dda3cd0d05e4`. I recomputed it over the canonical JSON (the manifest minus `seal_sha256`, `sort_keys`, separators `(",", ":")`, no trailing newline), and it **matches**. All 14 members match their listed sizes and SHA-256 digests.
- **Stage 4 dispatch seal.** `control/C1-STAGE4-DISPATCH-MANIFEST.json` has `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b`. Recomputed, it matches.
- **Stage 3 seal.** `control/C1-STAGE3-PACKET-MANIFEST.json` has `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37`. Recomputed, it matches.
- **Stage 2 seal.** `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`. Recomputed, it matches.
- **Return.** `cycles/cycle-1/stage3/returns/U1/RETURN.md` has SHA-256 `bed1e714…b585b8`, which matches the capsule.
- **Digests listed in the return**, recomputed on the files in `scratchpad/c1-U1/`:

  | Item | Digest | Result |
  |---|---|---|
  | `Main.lean` (837 lines) | `c6d2279cd3f5e254e950dc860b30b90943e17047ef89af7907a6bedc596ef5e7` | match |
  | `cb_indepnum_check.py` | `b68699d2…d0eb0d4d9` | match |
  | `lakefile.toml` | `45d0ca58…` | match |
  | `lake-manifest.json` | `52a4d73c…` | match |
  | `lean-toolchain` | `2bdc48ad…` (`leanprover/lean4:v4.32.2`) | match |
  | Six carried-entry digests | `65acd314…`, `8e1e1a68…`, `78ec6551…`, `113d9521…`, `16687f86…`, `772a13c0…` | Each equals the SHA-256 of the corresponding C6-LA2 `Snippets/` fragment, and the `ENTRY N BEGIN` hash in the C6-LA2 `Main.lean`. **They are not all the digests of the text U1 shipped** (see A1). |

- **Mathlib pin.** The Mathlib checkout reached through the symlink is at revision `905b95818eb32af7874a58b427f50c1711a5e96c`, which equals `sources/mathlib-binding/PIN.json`.
- **Route identity.** The route ID, orientation and mechanism token appear verbatim in the return and match `control/C1-ALLOCATION.md`.
- **Model disclosure.** The return's two-part disclosure is present: chartered sonnet/high; runtime `claude-sonnet-5`.
- **Gate lines.** The return's three gate lines are present.

## Independent re-derivation

All of the work below uses my own instruments, in `scratchpad/c1-crit-U1-T/` only. Every artifact was copied out before anything was run.

1. **Lean rebuild.**
   - Setup: I copied `LeanProject/{lakefile.toml, lake-manifest.json, lean-toolchain}` and `LeanProof/Main.lean` byte-for-byte (digest unchanged). I bound Mathlib by a manual symlink of `.lake/packages`, ran `cd` into the project, then ran `lake env lean LeanProof/Main.lean`.
   - Result: exit 0, no output (`lean_rebuild.txt`).
   - Forbidden-construct scan: I searched for `sorry`, `admit`, `native_decide`, `decide`, `axiom`, `unsafe`, `implemented_by`, `extern` and `set_option`. The only hit is the substring "extern" inside the word "external" in a comment (line 826). There is no enumeration over `m`. Every theorem is proved uniformly in `m` using `omega`, case splits on labels, and `Finset` cardinality arithmetic.
2. **Axiom audit (critic replay).** I appended `#print axioms` to a disposable copy of the file, which I then deleted (`axioms.txt`):

   | Declaration | Axioms |
   |---|---|
   | `cbGraph_isTree` | `[propext, Classical.choice, Quot.sound]` |
   | `cbGraph_indepNum_eq` | same |
   | `mem_leafSet_cbGraph_iff` | same |
   | `mem_cb_tagWitnesses_v_iff` | same |
   | `mem_cb_tagWitnesses_leaf_iff` | same |
   | `cb_lowWindow` | same |
   | `cbGraph_indepNum_le` | same |
   | `cbGraph_indepNum_ge` | same |
   | `cbGraph_decAdj` | `[propext, Quot.sound]` (no choice, so it is computable) |

   No `sorryAx` appears anywhere.
3. **Fidelity of the Lean object to the tree of record.**
   - Because `cbGraph_decAdj` is computable, I used `#eval` on the actual decidable adjacency to list the edges of `cbGraph m` for `m = 1, 2`, and to count them for `m = 3` (`eval_edges.txt`).
   - My independent instrument `crit_cb_fidelity.py` (imports `hashlib, json, re, sys`) builds `CB(8,m)` from `SEMANTIC-CONTRACT.md` §2 by vertex **names** (`r, s, v, u_i, b_ij, c_ij`), not by labels. It maps the names through U1's proposed labelling and compares the result with the Lean `#eval` lists.
   - Result: the edge sets are **identical at `m = 1` and `m = 2`**, and the `m = 3` count is 53 = 17·3 + 2. So the Lean `cbEdge`/`cbGraph` (through the instance a terminal would actually use) is the contract tree under the stated labelling.
   - The labelling is a bijection onto `[0, 17m + 3)` at every sampled `m`.
4. **α by different algorithms** from the seat's rooted tree DP. Sampled `m ∈ {1,2,3,4,5,10,95,107,110,113,200,1001}`:
   - (a) König: `n − ν`, with ν computed by greedy leaf matching, which is exact on trees.
   - (b) Exhaustive branching maximum-independent-set search at `m = 1, 2`: gives 10 and 19.
   - (c) The degree of the contract closed form `I(CB(8,m)) = (1+2x)G^m + x(1+x)(1+2x)^{8m}`. For `m ≤ 10` this closed form equals a direct tree count of `I` coefficient by coefficient, with degree `9m + 1`.
   - A symbolic check needing no sampling: `deg G = 9`, `deg (1+2x)G^m = 9m + 1`, and `deg x(1+x)(1+2x)^{8m} = 8m + 2 ≤ 9m + 1` for `m ≥ 1`, with all coefficients positive. So `α = 9m + 1` for every `m ≥ 1`. This is consistent with the Lean theorem, not a substitute for it.
   - Every sampled row gives `n = 17m + 3`, `17m + 2` edges, `α = 9m + 1`, and `leafSet = {v} ∪ C` with `8m + 1` leaves. Every row gives `W_v = {r}` and `W_{c_ij} = {u_i}`, computed from the definition `N(s_τ) ∖ {τ}`.
   - The class rows have the low window `3p* < 2α + 1`.
   - Fixed points reproduced (`SEMANTIC-CONTRACT.md` §5): `CB(8,107)` has `n = 1822` and `α = 964`; `CB(8,95)` has `n = 1618` and `α = 856`; `p*(107) = 572` and `p*(95) = 508`; `CB(8,110)` has `n = 1873` and `CB(8,113)` has `n = 1924`.
   - Result digest: `13e2448a45961b2898c29ce35f926a0f243887ead1436af274cbc103d5ced598`.
   - This route is not a network instrument, so the (WID)/`F_{p*}` fidelity duty does not apply. No selector, weight, relation or `x` is computed or claimed by U1 or by me.
5. **Replay of the seat's generator.** I copied `cb_indepnum_check.py` out and ran it with `python3 -B`. It gives `all_checks_pass: true` and result digest `b1e4a7b2136b53dad7f5e5c2f25ffc3e70dd4f8a23cb56f3e3a9f19a33aad633`, which **matches** the return.
   - Note that this instrument re-implements the labelling in Python. It does not evaluate the Lean object, so it checks the labelling scheme and α, not `cbEdge` itself. Item 3 closes that gap.

## Attacks and findings

- **A1: the "byte-identical carry" literal is false for three of the six entries.**
  - Tool: `carry_check.py`; output digest `70815ec12b421d4a15743aade15a6a95034c2f42a8ba2881997b3c48e54b29a1`.
  - C6-LA2 entries 4, 5 and 6 appear in `Main.lean` byte-for-byte.
  - Entries 15, 123 and 124 do **not**. The shipped text drops 6, 2 and 1 `--` line comments respectively. Those dropped lines include r30's provenance and attribution lines ("Author: r30 U2 (Claude Sonnet 5)", "authored in-run by the C6-LA2 formalizer (Claude Opus 5.5)").
  - What does hold: the non-comment declaration text of each entry appears verbatim, so the elaborated terms are the same as in the source of record.
  - Consequences:
    - The digests the return cites are the fragments' digests, not digests of what was shipped.
    - "CARRIED BYTE-IDENTICAL" (file comments) and "copied byte-identically" (the return) must be narrowed to *declaration-identical with line comments stripped* for 15, 123 and 124.
    - A Stage 7 carry must restore the fragments byte-for-byte. `SOLUTION-CONTRACT` §2 requires carrying "byte-identically, never re-typed", and fence 9 requires that attribution travels.
  - This is not a mathematical defect.
- **A2: the axiom-audit literal is not backed by the shipped evidence.**
  - The seat's only shipped axiom log, `scratchpad/c1-U1/leanout_axioms.txt`, contains five `Unknown constant` errors, because the names were unqualified. It contains no axioms output.
  - The return's sentence "all six depend on exactly `[propext, Classical.choice, Quot.sound]`" is therefore a self-report, and as a self-report it is struck.
  - My replay (Re-derivation §2) independently **confirms the same content**. The literal stands on the critic replay, not on the seat's artifact.
- **A3: undisclosed full process listing.**
  - The return's Disclosures section says "`ps aux` was checked once at the end". The worker brief, item 7, says "never a full process listing".
  - The seat did not mark this as a disclosure, and `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` (row U1) lists only the injection of the memory index.
  - Nothing in the return depends on what that listing showed. The seat started no background job, so no PID was needed.
  - I record it as a process-hygiene incident the controller should transcribe. It does not change the verdict.
- **A4: Remaining-obligation item 5 and derivation step 4 overstate a pitfall.**
  - The claims are that a "naive per-choke cell bound would overcount by exactly 1 (9m+2)" and that the edge-partition trick is "invalid here since the `u_i` are pairwise non-adjacent".
  - Neither holds in general. On a tree, a partition into edges and singletons built from a *maximum matching* gives exactly `n − ν = 9m + 1`. One such partition is `{r,u_0}`, `{s,v}`, the `8m` pairs `{b_ij,c_ij}`, and singletons `u_1…u_{m−1}`. The bound overshoots by 1 only for a non-maximum matching, such as `{r}` taken as a singleton cell.
  - This part of the text is not load-bearing, because the Lean proof uses a valid star-case split. Strike "exactly", and strike the generality of the caution.
- **A5: hypotheses and where they enter.**
  - `cbGraph_isTree` has no hypothesis on `m`, and is correct at `m = 0` (the path `r–s–v`).
  - `hm : 0 < m` is needed in `cbGraph_indepNum_le` and `cbGraph_indepNum_eq`: at `m = 0`, `α = 2 ≠ 9·0 + 1`, so the hypothesis is genuinely required. It is also needed in `cb_leaf_cases`, where `r` needs `u_0` as a second neighbour.
  - `mem_cb_tagWitnesses_v_iff` carries an **unused** `hm`. This is harmless, but the statement is weaker than it needs to be.
  - The residue hypothesis `m ≡ 2 (mod 3)` enters none of U1's lemmas, which is correct. `cb_lowWindow` needs only `m ≥ 1`, because `3·⌊(16m+4)/3⌋ ≤ 16m+4 < 18m+3`.
  - The ℕ-subtractions in the labelling (`(n−3)/17`, `(n−3)%17 − 1`, `−2`) all occur under guards `n ≥ 3` and `q ≠ 0` or `q` odd/even, and `omega` discharges them. I found no truncation hazard.
- **A6: the terminal cannot be stated from the shipped file alone.**
  - `Main.lean` does not carry `favorableLeaves` (entry 18), `IsSaturatingFlow` (entry 20), their dependencies (entries 1–3, 7–14, 16, 17, 19), or `C5LA1.crossingIndex` (C6-LA2 entry 35, which is byte-identical to first-interior entry 14).
  - The return is honest about this. Whether the layer would clash with those entries was untested, and my advance (below) tests it.
- **A7: grade wording.**
  - The return says `α(CB(d,m)) = m(d+1)+1` is "cited at its `proved_informal`-modulo-Darroch/Newton grade". α is a structural fact. The Darroch/Newton qualifier belongs to the favorability and threshold keys, not to α or the closed forms.
  - I confirmed in the frozen registry that the three cited CB keys are `VERIFIED` / `proved_informal`. No registered key states α(CB) or the CB tree layer (a lexical search on CB with ALPHA, INDEP, TREE or CLOSED found none). So "no new claim / no alias" stands.
- **No refuted mechanism is revived.** No Newton or Darroch argument is used anywhere. I found no hypothesis that encodes its own conclusion.

**Critic-derived advance** (attributed to `C-U1-T`; compiled scratch, no grade):
- **What was built.** `scratchpad/c1-crit-U1-T/LeanProject/LeanProof/CriticAdvance.lean` (SHA-256 `c94ef3bd983fbd939d1591a4c1b66204d40071bfdd35bdcaf1ce82468175d1dc`, produced by `assemble.py`). It concatenates:
  - C6-LA2 entries 1–21, 35, 123 and 124, carried **byte-for-byte** from `Snippets/`, each preceded by its digest;
  - U1's NEW section, verbatim;
  - two new results.
- **Result.** It compiles with exit 0, and `#print axioms` gives `[propext, Classical.choice, Quot.sound]` for both new results (`critic_advance_build.txt`).
- **(i) `cb_leafSet_card`.** For `m ≥ 1`, `(C5LA1.leafSet (cbGraph m)).card = 8*m+1`. This is the tag count `8m + 1` that `SEMANTIC-CONTRACT` §2 uses for `F_{p*}`, which U1 left as prose.
- **(ii) `cb8_topRank_of_descent_and_flow`.** This is the `SOLUTION-CONTRACT` §2 terminal, stated **verbatim** over the carried definitions, with the carried decidability instance resolving through `cbGraph_decAdj`. It is proved from exactly two hypotheses: the descent conjunct and the flow conjunct.
- **What this shows.**
  - U1's layer is compatible with the carried network and eligibility definitions: there are no name clashes, and instance resolution works.
  - The layer discharges the terminal's conjuncts 1 and 3 for every `m ≥ 1`.
  - The remaining formal gap is **exactly** conjunct 2 (`crossingIndex + 2 ≤ p*`) and conjunct 4 (the flow at the derived selector).

## Mechanism-equivalence and fence check

- **Fence 1 (one rank; the class only).** U1 claims structural facts for every `m ≥ 1` (for `IsTree`, every `m`). These are not rank claims and not (HALL) claims, so no fence is crossed. The facts are stated at `d = 8` only.
- **Fence 2 (fidelity).** Original supports and distinct tags are preserved: `tagWitnesses` is the carried definition, and the witness sets are derived, not assumed.
- **Fences 3 through 7.** Nothing is transferred to an aggregate. Census values are not used as proof: the Python sweep is labelled a sanity instrument. The `θ*` law and the r30 bounded record are not used.
- **Fence 8 (sealed roots).** Not touched.
- **Fence 9 (attribution).** This is where A1 matters: the r30 attribution comments were stripped from three carried entries.
- **Mechanism.** The labelling proposal and the child–parent bijection `IsTree` technique are transcriptions of the r30 C5-LA1 and C6-LA2 method, credited on the file. The α upper-bound partition with a star-case split is new to this seat. It is sound, with the caveat in A4.

## Certification audit

| Literal on the return | Status |
|---|---|
| "compiles sorry-free" | **Backed** by the critic rebuild (exit 0, scan clean). |
| "`#print axioms` … `[propext, Classical.choice, Quot.sound]` (all six)" | The seat's shipped log is only errors, so **struck as a self-report**. **Restored on the critic replay** (`axioms.txt`). |
| "CARRIED BYTE-IDENTICAL" and "copied byte-identically", with the six entry digests | **Backed for 4, 5 and 6. Struck for 15, 123 and 124**. Narrowed to "declaration-identical, line comments stripped". The cited digests belong to the Snippets, not to the shipped text. |
| Seed-project files byte-copied | **Backed** (all three digests match). |
| "`α = 9m+1` both directions", "for every `m ≥ 1`" | **Backed**: uniform Lean proofs, no enumeration. |
| "`IsTree` for every `m : ℕ`" | **Backed**. |
| Python "independent instrument", result digest `b1e4a7b2…` | The digest is **backed** by the replay. "Independent" is **narrowed**: the instrument is independent of the Lean proof but not of the labelling. It does not evaluate `cbEdge`. |
| "naive cell bound … overcount by exactly 1" | **Struck** (A4). |
| "No background jobs … `ps aux` checked once" | The part about background jobs is backed. The process listing is an undisclosed breach of the brief (A3). |
| Gate lines `not_advanced`, `not_advanced`, `none` | Correct. |
| `headline_resolved: no` | Correct. |

Grades: U1's artifacts are compiled scratch and have **no grade** (`SOLUTION-CONTRACT` §4). The return does not claim `formally_verified`, which is correct.

## Verdict

verdict: retained_narrowed
headline_resolved: no

`LS_top: not_advanced`
`ELIG_top: not_advanced`
`cut_candidate: none`

**What is retained.** U1's CB(8,m) definition layer is retained as compiled scratch. It consists of:
- `cbEdge`, `cbGraph`, and the computable `cbGraph_decAdj`;
- `IsTree` for every `m`;
- `α = 9m + 1` in both directions for `m ≥ 1`, proved uniformly;
- the leaf classification `{v} ∪ C`;
- the witness sets `W_v = {r}` and `W_{c_ij} = {u_i}`;
- `cb_lowWindow`.

It is faithful to the contract tree: the Lean `#eval` output matches my name-built CB(8,m), and α and the leaves match under three independent algorithms.

**What is narrowed.**
- The byte-identical-carry literal for entries 15, 123 and 124 (A1).
- The axiom literal, which now rests on the critic replay (A2).
- The "independent" Python label.
- The struck remark in A4.
- The process-listing disclosure is recorded (A3).

**Mathematical grade.** In my reading the layer's mathematics is complete. Stated in prose: as informal mathematics the structural facts are `proved_informal`. They are the same facts as the contract's inherited CB record, so this is not a new registrable claim, and the Lean artifact has no grade until a governed award closes.

**Critic advance.** `C-U1-T` compiled, as scratch with no grade, `|leafSet(CB(8,m))| = 8m+1` and the verbatim terminal reduced to its descent and flow conjuncts. The layer is carried alongside C6-LA2 entries 1–21, 35, 123 and 124, carried byte-for-byte.

## Remaining obligation

A successor, and the Stage 7 synthesis, inherit the following:

1. **Re-carry the stripped entries.** Entries 15, 123 and 124 must be re-carried **byte-for-byte**, including their provenance and attribution comments, before any award uses this layer. `CriticAdvance.lean` shows the correct form.
2. **Rerun the axiom audit on the award's own face.** It must use fully qualified names, and the log must be shipped.
3. **Freeze the labelling.** The labelling `0=r, 1=s, 2=v, u_i = 3+17i, b_ij = u_i+1+2j, c_ij = u_i+2+2j` is still a proposal until the synthesis freezes it.
4. **Two formal obligations remain for the terminal**, beyond conjuncts 1 and 3, which this layer and my reduction lemma supply:
   - (a) `C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16m+4)/3`. This is (ELIG-top)(a) plus the step from parent descent to first descent: T3/U3.
   - (b) `∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) p*) p* f`. This in turn needs:
     - `favorableLeaves (cbGraph m) p* = leafSet`: the favorability key, `proved_informal` modulo Darroch/Newton on products of linear factors, and not formalized;
     - E1(i) at every `q`;
     - (L-S)_top;
     - U2's composition reduction.
5. **Controller action.** Transcribe the undisclosed `ps aux` (A3) into the Stage 3 read-boundary record.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-U1-T/`. Python is standard library only and was run with `python3 -B`. Lean was run only after `cd LeanProject`, with `.lake/packages` symlinked to the pinned shared project. There was no `lake update` or `lake clean`.

| Artifact | SHA-256 | Notes |
|---|---|---|
| `LeanProject/LeanProof/Main.lean` | `c6d2279c…5ef5e7` | Copy of U1's file. |
| `LeanProject/{lakefile.toml, lake-manifest.json, lean-toolchain}` | — | Copied byte-for-byte from U1. |
| `lean_rebuild.txt` | `28d3b9e880a77975493dc7e359144c0295a4f694cfe0af4f928c22307bc5c320` | Rebuild exit 0. |
| `axioms.txt` | `e95f741179bfe75260a385ed03da7c459e59fc428080db9a88128a83b03d24b6` | Axiom replay. |
| `eval_edges.txt` | `73c671e78bb237cdc389f3154f9573bb564654a7be2af99823072fc2b88e5051` | Lean `#eval` edge lists; made from a disposable copy, since deleted. |
| `carry_check.py` | `080a9d781dc9f70ad89389da3273bfb6983daa6ab224498fe166185a26ea7d74` | Carry byte comparison. |
| `carry_check.out.txt` | `32bcb7b0266da8b68b0de67e8dbc70c3e30f114edcf59da50e8aca7b9aec8455` | Result digest `70815ec12b421d4a15743aade15a6a95034c2f42a8ba2881997b3c48e54b29a1`. |
| `crit_cb_fidelity.py` | `7a230c84ecb62dfdc0cc80a5d31ee6b818d28aa1eb5a98b4153d77aed3048425` | Independent fidelity instrument. |
| `crit_cb_fidelity.out.json` | `04900bc07696c50c4dc916a2454ebfacc2d77af89ca7bba00eb069795722978b` | Result digest `13e2448a45961b2898c29ce35f926a0f243887ead1436af274cbc103d5ced598`. |
| `assemble.py` | `c2d41bd883b679e589babc42ee9526a5c4354bf3e38a72c5dc0070a8ad688f51` | Builds `CriticAdvance.lean`. |
| `critic_lemmas.lean.part` | `5a4402a1653df03b1bcf84aa7abf13e85413711969b087a3175178776f42de93` | The two new results. |
| `LeanProject/LeanProof/CriticAdvance.lean` | `c94ef3bd983fbd939d1591a4c1b66204d40071bfdd35bdcaf1ce82468175d1dc` | Critic advance file. |
| `critic_advance_build.txt` | `205f6c4005e4322849cb71f45ce7d2a25a32fd372a20ba83127f0766172a2f0c` | Build exit 0, axioms output. |
| `cb_indepnum_check.py` | `b68699d201947dbc85e2f22d11f1c04dd634b8ccceff689ffafc260d0eb0d4d9` | Copied out from U1. |
| `u1_replay.out` | `f7e6579da9e65a03af3b08b74cdc25119a69e0f2b5a2687fc10f51f1a8cb054c` | Replay; `all_checks_pass: true`, digest `b1e4a7b2136b53dad7f5e5c2f25ffc3e70dd4f8a23cb56f3e3a9f19a33aad633` matches. |

The copied project files have these digests, matching U1's: `lakefile.toml` `45d0ca58145784d5f29322ff21a1335e350c38e72afe8d5396d9c9910b94ff49`, `lake-manifest.json` `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`, `lean-toolchain` `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273`.

Background jobs: none were started, so there was nothing to kill.
