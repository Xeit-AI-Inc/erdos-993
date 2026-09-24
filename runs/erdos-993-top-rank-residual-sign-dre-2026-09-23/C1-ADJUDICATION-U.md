# Orientation Adjudication

Stage 5 adjudicator of orientation **U** (formal / structural), Cycle 1 of r26
(`erdos-993-math-dre-20260923-r26-top-rank-residual-sign`). Portfolio: the returns of seats `U1`,
`U2`, `U3` and their six cross-orientation critiques (`C-U1-T`, `C-U1-F`, `C-U2-T`, `C-U2-F`,
`C-U3-T`, `C-U3-F`).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading EXACTLY the two
authorized files and nothing else in the VerityOS tree:
`/Users/ashtonsperry/VerityOS/verity.md` (root constitution) and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (identity subsystem). The startup
protocol's own task-type map (`memory/`, `knowledge/`, `modules/`, `skills/`, `logs/`,
`decisions/`, `conversations/`, `operations/`, `inbox/`) was NOT followed; the controller has
booted for the run. Subsystems loaded: constitution + startup protocol only, plus this run root's
`experiments/` workspace under the capsule grant.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); the
seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

---

## Identity and seal audit

**Capsule seal reported: `fec178ffb7fc078f17eda32cf089827c7a05d59b366e862a02e5f6bd6fdcc87c`.**
Recomputed by my own code as SHA-256 over the canonical JSON of
`control/c1-adjudicator-capsules/U-PACKET-MANIFEST.json` with `seal_sha256` removed
(`sort_keys=True`, `separators=(",", ":")`, UTF-8, no trailing newline): **MATCH**. All **24**
capsule members verified by byte length and SHA-256: **24/24 match, zero mismatches**, including
the three returns and the six critiques of my orientation.

Inner seals of the three packet manifests in my capsule, each recomputed by the same canonical
rule:

| manifest | files | declared seal | result |
|---|---|---|---|
| `control/C1-STAGE2-PACKET-MANIFEST.json` | 96 | `c97e121561a7b63cef93312f22f60cfa2097b916f264bfb8ebff52cb68ee9de3` | **MATCH** (the value all three returns cite) |
| `control/C1-STAGE3-PACKET-MANIFEST.json` | 32 | `86571d275c1b158757f81106d929450b052d819891899b2d6991e7e93df68a40` | **MATCH** |
| `control/C1-STAGE4-PACKET-MANIFEST.json` | 57 | `7169114907fdb1f2ab3845ba07183ffa808114d588add7ccc05d15eadf92ab2c` | **MATCH** |

`control/C1-STAGE3-ADMISSION.json` admits 9/9 returns with `source_seal` equal to the Stage 2 seal
and zero findings; `control/C1-STAGE4-ADMISSION.json` admits 18/18 critiques with zero findings.
Both admissions are consistent with the returns and critiques as sealed.

**Digests of the compiled corpus, recomputed by me after copy-out.** Every Lean file in each of the
three seats' scratch projects matches the digest its return tabulates:

| seat | file | SHA-256 |
|---|---|---|
| U1 | `LeanProject/LeanProof/C5LA1.lean` | `0933211d8f02acd867e91547d4a2b09d13fcc3ea178e192e385acc33b696b63b` |
| U1 | `LeanProject/LeanProof/Main.lean` | `c8f29ef012bef4f7c3aa11f8d88eb15ac162babf58a6a3be901387dad609eb84` |
| U1 | `LeanProject/LeanProof.lean` | `2bd5c1ec454781ae1382319929c687a23faec5dbbecd96372ef6da9e5fdc2f3a` |
| U2 | `LeanProject/LeanProof/Main.lean` | `c382707596674822e0b78135414cdd3320e0bc56f9f558fee78e438794b1043b` |
| U2 | `LeanProject/LeanProof/AxiomsCheck.lean` | `07e441455fdef6d6c581f7a9dc21dd4d3c29ae21bdb0adeb61865bb69ff51d4d` |
| U3 | `LeanProject/LeanProof/Main.lean` | `fb54fa05563238ba77167cefd1d30fd85baa0135a36d24518284e2380b6fa332` |
| U3 | `LeanProject/LeanProof.lean` | `f4dfdef8320a735eab53d24f4b47d3b60bcb474ffd2c84c77f24ae2fc75fcf31` |

`LeanProof/C5LA1.lean` is **byte-identical in all three projects** to the frozen (RI) award source
`sources/r24/c5-la1/LeanProject/LeanProof/Main.lean`
(`0933211d8f02acd867e91547d4a2b09d13fcc3ea178e192e385acc33b696b63b`); `lakefile.toml`,
`lake-manifest.json` and `lean-toolchain` are byte-identical to the frozen seeds in all three. No
source under `sources/` was mutated.

All six critic-derived Lean fragments match the digests their critiques declare:
`CriticU1T.lean` `9a632414…f12bcb0f75`; `CriticF.lean` (C-U1-F) `d7e367ca…d4c566316a320fd9f`;
`CriticT.lean` (C-U2-T) `5fafeb14…a605a9c7428043600e`; `CritF.lean` (C-U2-F)
`4ce9a7a5…6bede86c0db73712edfb4`; `CriticU3T.lean` `1dba1d5b…d0a928125a24074a993`; `CriticF.lean`
(C-U3-F) `1963b75b…68664723e2e582b52a`.

**Binding.** In my own copy-out I created `.lake/` and made `.lake/packages` a manual **symlink** to
`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages` — no
package copied, no `lake update`, no `lake clean`. The shared Mathlib Git HEAD is
`905b95818eb32af7874a58b427f50c1711a5e96c`, equal to `mathlib_rev` in
`sources/mathlib-binding/PIN.json` and to the `rev` in the copied `lakefile.toml`. This is the
deviation controller erratum **R26-E-a** accepts for scratch projects; I re-rule it **accepted**
for U1, U2, U3 and for all six critics on identical facts.

**Read-boundary disclosures (mine).** (1) Non-recursive `ls` inside the granted seat and critic
scratch directories only; no listing rooted at `scratchpad/`, `cycles/`, the VerityOS root or `/`;
no `find`/`rg`/`ls -R` anywhere. (2) `grep` only against single files already inside my own replay
copies. (3) I read the shared Mathlib project's `mathlib` Git HEAD for the pin audit. (4) I did
**not** read `control/CLAIM-IDENTITY.run-local.json` — it is not a capsule member — so the three
seats' lexical alias checks remain **unverified at Stage 5**; see the Established-results section.
(5) I compiled one adjudicator probe of my own (`R26AdjU.maxIndep_leafDegree_eq_zero`, below); it is
**STATED**, not registered, and needs an isolated second read. No other return, critique,
adjudication, prior synthesis, other experiment root, the research packet's own directory, or
external source was read. No network, no installs.

---

## Route-by-route decisions

### `U1` — `C1-U-01 RC-LEAN-ARCHITECTURE-AND-CONTRACT`

**Decision: `compiled`, retained and materially narrowed.** The deliverable (draft theorem
contract, dependency DAG, Lean skeleton, sorry ledger) was produced in full; four new lemmas are
genuinely sorry-free; nothing about (RC) is upgraded and the return says so. What the route was
chartered to get right — the architecture — is where it is wrong in two load-bearing places.

*Replayed by me, copy-out-first.* `lake build` → `Build completed successfully (8658 jobs)`, exactly
five `declaration uses 'sorry'` at `Main.lean:111, 126, 144, 153, 174`. My own `#print axioms` over
all nine declarations plus the imported (RI):

```
R26LA1.mem_supportSet_iff             [propext, Classical.choice, Quot.sound]
R26LA1.support_mem_supportSet         [propext, Classical.choice, Quot.sound]
R26LA1.sum_leafDegree_eq_card_leafSet [propext, Classical.choice, Quot.sound]
R26LA1.alpha_ge_three_of_eligible     [propext, Classical.choice, Quot.sound]
R26LA1.forcedNeighbour                [propext, sorryAx, Classical.choice, Quot.sound]
R26LA1.budgetIdentity                 [propext, sorryAx, Classical.choice, Quot.sound]
R26LA1.deletionInjection              [propext, sorryAx, Classical.choice, Quot.sound]
R26LA1.signBound                      [propext, sorryAx, Classical.choice, Quot.sound]
R26LA1.topRankResidualSign            [propext, sorryAx, Classical.choice, Quot.sound]
C5LA1.topRankResidualIdentity         [propext, Classical.choice, Quot.sound]
```

The return's build report, sorry count, axiom lines and all six project digests are **backed**. I
replayed `check_dag_acyclic.py` copy-out-first and reproduced its output byte-for-byte
(`CONTRACT_SHA256: b421a838…2c1c3b3e`, `NODE_COUNT: 33`, `EDGE_COUNT: 28`, `ACYCLIC: True`,
`RESULT: PASS`), and I reproduced `expected_statement_sha256`
(`c417a68a549b78ff4a8a46e6da3b8523578e0c8b386aed77a87d944bdf6806d2`) as the raw UTF-8 SHA-256 of
the string with no trailing newline.

**Ruling U1-R1 (`signBound`) — both critics sustained; this is the route's central defect.** I
elaborated the declaration myself. As compiled it is

```
C5LA1.aggregate G (G.indepNum - 1)
  ≤ -(↑(C5LA1.leafSet G).card * (↑(C5LA1.leafSet G).card - 2)) * ↑(C5LA1.indepSetCount G ∅ G.indepNum)
```

— the `−(ℓ−4)N_2` term of `C1-ALLOCATION.md` item 1(f) is **absent**, while the SORRY LEDGER row,
the DAG node `node-sign-bound` and the doc-comment all certify the allocation's bound. The ledger
row, the node text and the doc-comment are **struck**; the compiled statement is what the evidence
supports.

*Resolving the one substantive difference between the paired critics.* `C-U1-T` says the missing
lemma the compiled form needs at `ℓ ≤ 3` is `N_2 = 0 on the eligible residual class`; `C-U1-F` says
it is `W_III ≥ N_2` at `ℓ = 3`. **`C-U1-F` is exactly right and `C-U1-T` is sufficient but not
necessary**: from the identity `−S = ℓ(ℓ−2)M + (ℓ−4)N_2 + W_III`, the compiled node at `ℓ = 3` is
equivalent to `W_III ≥ N_2`, which `N_2 = 0` implies. Both agree on the `ℓ = 2` reading and I
confirm it: at `ℓ = 2` the compiled right-hand side is identically `0`, so the node **is** (RC)
there, and the `ℓ = 2` fibre of the eligible residual class is non-empty — my own instrument gives
`P_11` (`α = 6`, `x = 3`, `S = −18`) and `P_13` (`α = 7`, `x = 4`, `S = −28`), both eligible and
residual. A DAG that derives its conclusion from a node equal to the conclusion on a non-empty
fibre is not an architecture; naming that is `C-U1-F`'s strongest contribution.

**Ruling U1-R2 (the DAG does not reach its conclusion) — sustained.** Three of the seven
`SOLUTION-CONTRACT.md` §1 Tier-3 lemmas are absent from the draft: `ℓ ≥ 2` at `α ≥ 2`; `ℓ = 2` with
a `λ = 2` support forces `P_3`; leaf/support disjointness at `α ≥ 2`. The first is precisely what
the terminal edge consumes. Both critics compiled the bridge independently and I rebuilt both:
`CriticU1T.sign_of_signBound` and `R26CriticF.aggregate_nonpos_of_signBound` have (I elaborated
them) **identical statements** — `2 ≤ (leafSet G).card` plus the compiled `signBound` conclusion
gives `aggregate G (α−1) ≤ 0`, with `hEligible` and `alpha_ge_three_of_eligible` **not used**. The
DAG edge `node-alpha-ge-three → node-sign-bound` and the ledger sentence that
`alpha_ge_three_of_eligible` feeds the `ℓ = 2` finish are therefore **struck**; the node the
assembly actually consumes does not exist in the draft.

**Ruling U1-R3 (`expected_statement`) — sustained, and decisive on controller authority.** The
value is verbatim `SOLUTION-CONTRACT.md` §2 with a reproducible digest, but it writes
`crossingIndex`/`aggregate` unqualified while the shipped declaration writes `C5LA1.crossingIndex`
/`C5LA1.aggregate` (I verified both texts). The Stage 5 controller facts record states that "the
contract's `expected_statement` must be the exact text of the shipped declaration (fully qualified
C5LA1 names if the declaration uses them)". The literal "`expected_statement` … the exact statement
of §2" is **narrowed**: true of the contract text, false of the declaration it binds. The related
`lean_binding.source_relpath` deviation from the C5-LA1 template and `def-top-rank`'s
`lean_name: "Nat.sub"` are **struck** as schema defects.

**Ruling U1-R4 (read boundary) — `C-U1-T` sustained; `C-U1-F` is silent only because the script was
outside its grant.** The return asserts "No other VerityOS path was read this session — there is no
`## Read-boundary disclosure` item" while citing `_assert_run_root` by name with source line ranges
(`~116-141`, `1014-1026`) that the sanctioned command's single-line error output does not emit —
`C-U3-T` established that negative by **executing** the command. The literal is **struck**. The
read is the class the controller expressly accepted for U2 under R26-E-a; it is benign (no
mathematical input can come from a lake-binding script) and the deviation itself was disclosed in
full. Disposition: the Stage 3 disclosure entry for `U1` ("Not a read-boundary item") should be
amended by the controller. **No re-run, no mathematical effect.**

**Ruling U1-R5 (minor strikes).** "**Two** further DAG nodes … with NO Lean declaration
(`node-alpha-eq-ell-plus-a`, `node-family-classification`, `node-fibre-bound`)" — **three** are
named; struck. "Grades (`SOLUTION-CONTRACT.md` §4 scale)" followed by `compiled`/`missing_bridge` —
neither is a §4 grade; the labels come from the worker common brief, and the attribution of the
typed verdict vocabulary to `C1-ALLOCATION.md` is a miscitation; struck, substance unaffected.
"`R26LA1.mem_supportSet_iff`" is compiled but carried by no DAG node — inventory mismatch,
sustained. "`ps aux | grep -i "lean\|lake"` shows no matching process" — such a pipeline matches its
own `grep`; the evidence offered does not establish the literal; narrowed, not a finding of a
detached job.

**Not struck.** No declaration's hypotheses encode its conclusion (I checked all nine). No
definition drifts from the C5-LA1 originals. The ℕ-subtraction audit in the step-by-step section is
correct. `forcedNeighbour`'s use of `J.card = aVal G` as a hypothesis weakens the lemma rather than
presupposing `a = α(G[D])`; not circular. The tooling disclosure is exemplary in candour.

### `U2` — `C1-U-02 RC-LEAN-COUNTING-CORE`

**Decision: `compiled`, retained; the theorems stand unchanged, the description of what was
compiled is narrowed.** This is the strongest return in my portfolio.

*Replayed by me, copy-out-first.* `lake build` → `Build completed successfully (8658 jobs)`, exit 0,
zero `error:` lines, **zero** hits for `sorry|admit|native_decide|axiom` in `Main.lean`. My own
`#print axioms` over all seven declarations (`deletionInjectionBound`, `fibreInequality`,
`isIndepSet_union_of_no_cross_adj`, `familyOneInjection`, `budgetWeightBound`,
`leafDegree_sum_eq_inter_support`, `budgetInequality`) returns
`[propext, Classical.choice, Quot.sound]` for every one. The SORRY LEDGER is correctly empty. The
replay generator reproduces `report_sha256 = 1ec3e739ef4ea28452b1a99757db103541f5e3e12c6c25118335deb87da7a4fe`.

**Ruling U2-R1 (the budget: `≤ 1` versus `= 1`) — `C-U2-T`'s F1 sustained; the strongest finding
against any U seat, and `C-U2-F` misses it.** `SEMANTIC-CONTRACT.md` §4 states the budget as an
**identity** with the slack `h`; U2 ships only `Σ(λ−1) + (a − |B∩D|) ≤ 1`, the `h ≥ 0` shadow.
Family (I) is exactly the `h = 1` case — the case where U2's inequality is slack — so the route's
own lemma (c) counts an object that its lemma (d) cannot recognize, and the three-family
classification cannot be read off the `≤ 1` form. The seat met its charter (item 8(d) asks only for
`≤ 1`); the gap is between the charter and the contract, and the return does not put it in the
successor's inheritance. `C-U2-T` closed it: I rebuilt `R26CritT.budgetIdentity` and confirm it is
sorry-free with the permitted axioms and derives the **exact** `= 1` identity from `hpartition` and
`hBcard` **alone** — no independence, no `ℓ = |L(G)|`, no tree, no `(★)`; independence enters only
through `slack_nonneg`, which is U2's own `budgetWeightBound`. This localization is correct and is
the single most useful structural fact produced in my orientation.

**Ruling U2-R2 (`hL1` is inert) — both critics sustained, both compiled the proof.** The Lean linter
flags `hL1` at `Main.lean:126:5` (reproduced in my build); the return files it as a harmless style
note. Both critics compiled the same conclusion without it (`R26CritT.familyOneInjection'`,
`R26CritF.familyOneInjectionNoL1`) and I rebuilt both sorry-free. The grade sentence calling (c)
`conditional` on four premises including `hL1`, and `## Remaining obligation` item 1 instructing a
successor to discharge `hL1` **for this lemma**, are **struck**. What `ℓ ≥ 1` is really needed for
is one level up: making `a + (ℓ−1)` the untruncated `α − 1`.

**Ruling U2-R3 (hypothesis attribution for (c)) — the paired critics appear to contradict each
other and do not; both are sustained on their own object.** `C-U2-T` (F3) rules `hDL` definitional
and `hNoEdge` hypothesis-free; `C-U2-F` (F3) exhibits explicit counterexamples to (c) with `hDL`
dropped (`V = {0,1}`, `E = ∅`, `D = {0}`, `L = {0,1}`, `a = 1`) and with `hNoEdge` dropped (the path
`1–0–2`, `D = {0}`, `L = {1,2}`, `a = 1`). These are different claims. **As hypotheses of the
general lemma, with `D` and `L` free Finsets, both are necessary — `C-U2-F` is right. At the
intended instantiation `D := D(G) = V ∖ (L ∪ C)`, `L := L(G)`, both hold by unfolding the
definitions alone — `C-U2-T` is right**: `D ∩ L = ∅` is definitional, and if `d ∈ D` were adjacent
to a leaf `v` then `d` is `v`'s unique neighbour, so `λ(d) ≥ 1` and `d ∈ C`, contradiction; neither
step uses `hyp-tree`, `hyp-alpha` or `(★)`. I therefore **sustain `C-U2-T`'s narrowing of the
return's hypothesis map** (it inflates T3/U3's discharge burden and, more seriously, tells F3's
load-bearing map that `(★)` carries `hNoEdge`, which it does not) **and simultaneously sustain
`C-U2-F`'s necessity witnesses**. `SEMANTIC-CONTRACT.md` §3's listing of "no interior vertex is
adjacent to a leaf" among the `(★)`-consequences is, on this evidence, an over-attribution in the
contract itself, and I record it as such: it is a consequence of the definitions of `L`, `C`, `D`.
`hLindep` genuinely needs `hyp-tree` + `hyp-alpha` (it fails on `K_2 ⊔ K_1`); `hBcard` genuinely
needs `(★)`.

**Ruling U2-R4 (item 8(c) is not delivered as chartered) — both critics sustained.** Item 8(c) asks
for the injection "with `ℓ · M ≤ |image|`"; U2 proves `ℓ · |JS| ≤ i_{a+(ℓ−1)}(G)`, the total count,
and exports neither the image nor the injectivity it proves internally. The route-verdict sentence
"matching `C1-ALLOCATION.md` item 8 (a)–(d) **exactly** in content" is **struck for (c)**; read
"(a), (b), (d) as chartered; (c) in its cardinality-consequence form only". The return's own
`## Remaining obligation` item 3 concedes this, and the verdict sentence contradicts it. `C-U2-T`
closed the first half (`R26CritT.famOneImageCard`: `|image| = |L| · |famOneSource G D a|`, rebuilt
by me, sorry-free); `|JS| = M` remains structural and open.

**Ruling U2-R5 (minor strikes).** "`### Digests of every Lean file in the scratch project`" —
**struck for "every"**: `LeanProof/AxiomsCheck.lean` (328 bytes,
`07e441455fdef6d6c581f7a9dc21dd4d3c29ae21bdb0adeb61865bb69ff51d4d`) is omitted; I verified the file
exists and contains only `#print axioms`/`#check` lines. "none in `Main.lean` beyond one harmless
`push_cast` note and one `hL1` note" — **struck**: my build emits **four** `Main.lean` warnings
(two `unusedSectionVars` at lines 30 and 107, the `push_cast` note, the `hL1` note). "Evidentiary
strength equal to what a `formally_verified` award would certify" — **narrowed** to
kernel-equivalent, not award-equivalent: the governed award adds the fidelity review that certifies
the statement is the intended one, and it is exactly that layer where U2-R2 and U2-R4 surface.
Fence 7 attribution (occupancy bound = Andriantiana–Razanajatovo Misanantenaina–Wagner 2020,
re-proved in-run, not imported) is **absent from the claims' faces** — both critics raise it; I
sustain it as an attribution-hygiene defect that must be repaired before any registration.

### `U3` — `C1-U-03 RC-LEAN-TREE-STRUCTURE`

**Decision: `compiled`, retained and narrowed on prose only.** Twelve sorry-free declarations
covering allocation item 9 (a)–(f); every strike below is prose around correct Lean.

*Replayed by me, copy-out-first.* `lake build` → `Build completed successfully (8658 jobs)`, and the
**twelve `#print axioms` lines came back character-for-character as the return prints them**,
including `closed_reachable`'s narrower `[propext, Quot.sound]`. Zero hits for
`sorry|admit|native_decide|axiom`.

**Ruling U3-R1 ("full `IsTree`") — both critics sustained.** `SimpleGraph.IsTree` extends
`Connected` = `Preconnected` + `Nonempty`; `connected_induce_compl_pair` delivers only
`Preconnected`, and for `K_2` the complement of the two degree-one vertices is empty. The prose
corollary is **struck**; `C-U3-F` compiled the corrected form (`R26CritU3F.isTree_induce_compl_pair`,
rebuilt by me, sorry-free). The Mathlib anchor `SimpleGraph.IsAcyclic.induce` itself is real.

**Ruling U3-R2 ("maximally general") — both critics sustained.** `interior_leafDegree_eq_zero`
binds `_hd : ¬ IsGraphLeaf G d` and never uses it. Both critics compiled the sharp form
(`R26CritU3T.leafDegree_eq_zero_of_not_mem_supportSet`,
`R26CritU3F.interior_leafDegree_eq_zero'`); I rebuilt both. The successor instruction that Stage 7
"should NOT weaken any of these lemmas' hypotheses" is **struck for (c)** and weakened for (a)
(`hAlpha` is consumed there only to produce `Nontrivial V`).

**Ruling U3-R3 (counts) — both critics sustained.** "All six required lemmas … plus **four**
auxiliary lemmas" is **struck**: the file carries **twelve** declarations — seven for the six items
(item (d) is two theorems) and **five** auxiliaries. "two further sorry-free structural lemmas …
and **one** general-purpose helper" then lists **three** helper names — internally inconsistent,
struck. "several use only a strict subset" of the permitted axioms is **struck**: exactly one does
(`closed_reachable`), as my replay confirms.

**Ruling U3-R4 (citation) — `C-U3-T` sustained.** Lemma (f) cites `SOLUTION-CONTRACT.md` §3.5 for
the `α ≥ 3` use of `hyp-eligible`; §3.5 is the Tier-2 correction-record fence. The authority is
fence **§3.2** plus `C1-STAGE1-GATE.md` Ruling 5. Struck as a pointer error; substance correct.

**Ruling U3-R5 (read boundary) — the paired critics disagree and `C-U3-T` prevails.** `C-U3-T` (F1)
strikes the return's "No other VerityOS file was read this session", having **executed** the
sanctioned command and shown its entire output is one line that names neither `_assert_run_root`
nor the `runs/` parent constraint, both of which the return asserts. `C-U3-F` finds "no undisclosed
boundary crossing detectable from the return's own text". The protocol directs me to weigh replays
over self-reports: `C-U3-T` ran the test, `C-U3-F` did not. **The literal is struck.** Disposition
identical to U1-R4: the read is the R26-E-a class the controller has already accepted for U2,
benign, no mathematical effect, and the Stage 3 disclosure record should be amended to carry U3.

**Ruling U3-R6 (`connected_induce_compl_pair` is off-framework) — `C-U3-F` sustained, and this is
routing-relevant.** `SEMANTIC-CONTRACT.md` §1 fixes that vertices are never relabelled, deleted or
quotiented — every deletion is a deletion SET on the original type, and the whole C5-LA1 counting
layer (`indepSetsAvoiding G D k`) is built that way. `G.induce ↥Sᶜ` is a different vertex type.
Nothing in the (RC) DAG can consume that lemma without a transport lemma between induced-subgraph
independence counts and `indepSetsAvoiding`, which nobody in this cycle has built. Carry it as a
spare part, not as a DAG step, and do not let a successor bill it as progress toward a
"tree minus its leaves" induction.

**Ruling U3-R7 (`hTree`'s entry point in (b)) — `C-U3-F` sustained.** The return says "`hTree` gives
`{v, w}` is closed under adjacency"; in the compiled proof the closure is built from the two
`IsGraphLeaf` uniqueness witnesses alone, and `hTree` enters only through
`hTree.connected.preconnected`. The theorem is unaffected; the load-bearing map the synthesis
inherits is corrected here.

**Ruling U3-R8 (the delivery gap) — both critics sustained and both closed it.** `L ∩ C = ∅` (the
`SEMANTIC-CONTRACT.md` §3 fact) and `k₂ ≤ ⌊ℓ/2⌋` (§4) are compiled nowhere in the return although
(d) part 2 is one line from the latter. `C-U3-T` and `C-U3-F` each closed both, independently and
with the same content (`disjoint_leafSet_supportSet` / `leafSet_disjoint_supports`;
`two_mul_card_C2_le_card_leafSet` / `two_mul_card_C2_le`), plus the generalization
`j · |C_j| ≤ ℓ` for every `j`. I rebuilt all of them sorry-free. The duplication is a cost of the
two-critic design, not a defect; one derivation is carried forward, not two.

**Grade label.** "kernel-verified scratch theorem" is not a rung of `SOLUTION-CONTRACT.md` §4; both
critics say so and I agree. The §4 grade for U3's twelve declarations, and for every sorry-free
fragment in my portfolio, is **`proved_informal`** — machine-checked in an ungoverned scratch
project, below `formally_verified` by `C1-STAGE1-GATE.md` Ruling 7. The return's own sentence
"nothing here should be cited as `formally_verified`" governs.

---

## Cross-route reconciliation

**CR-1. The compiled corpus of orientation U is `(★)`-free, and that is the whole Lean-readiness
story.** I grepped every sorry-free declaration in the three seats and the six critic fragments:
`hResidual` occurs in U1's `Main.lean` at lines 113, 129, 156, 177 and nowhere else — i.e. in
exactly the four `sorry`-bearing declarations (`forcedNeighbour`, `budgetIdentity`, `signBound`,
`topRankResidualSign`). **No sorry-free declaration anywhere in orientation U consumes the residual
hypothesis `(★)`.** `C5LA1.aggregate` occurs in the sorry-free corpus only inside the two critic
bridge lemmas, and there only as a hypothesis-carrying implication. U2's `Main.lean` does not even
mention `indepNum`. Orientation U has therefore compiled the `(★)`-free periphery of (RC)
thoroughly and has compiled none of its `(★)`-consuming spine.

**CR-2. The `ℓ = 2` half of U1's `signBound` gap is closed by U3's critic; the `ℓ = 3` half is
not.** `C-U1-T` and `C-U1-F` both identify that the compiled `signBound` is unsupported at `ℓ ≤ 3`.
`C-U3-T`'s `card_C2_eq_zero_of_eligible` (rebuilt by me, sorry-free) proves that for a tree with
`hEligible` and `ℓ = 2`, `k₂ = 0`; since `N_2` counts pairs whose second coordinate has `λ(s) = 2`,
`k₂ = 0 ⟹ N_2 = 0`, and the allocation's bound then reads `S ≤ 0` — so at `ℓ = 2` the compiled node
and the allocation's bound coincide and neither is circular. **Nobody in Cycle 1 made this
connection**; it lives across two different portfolio slots. At `ℓ = 3` the gap survives intact: the
compiled node needs `W_III ≥ N_2`, and `k₂ > 0` does occur at `ℓ = 3` (2 of the 12 members of the
census below).

**CR-3. U1's `deletionInjection` sorry is discharged twice over.** `C-U1-F` compiled
`R26CriticF.deletionInjection_proved`; I verified in Lean that
`example : @R26LA1.deletionInjection = @R26CriticF.deletionInjection_proved := rfl` elaborates, so
the statements are identical. U2's `deletionInjectionBound` is the same mathematics on U2's own
`indepPowerset` shape. **U1's skeleton stands at four open sorries, not five**, and the two shapes
should be shown equal before either is cited.

**CR-4. U1's definitions of `C(G)`, `D(G)`, `a` are the only Lean definitions of those objects in
the cycle, and they live in a file with five sorries.** U2 works with free `D`, `L`, `a`
parameters; U3 and its critics work with `leafSet`/`leafDegree`/`support` and define `supportSet`
ad hoc (three incompatible spellings across the corpus: `R26LA1.supportSet` as a filter,
`R26CritT.suppSet`, `R26CritU3T.supportSet` as an image). `C(G)`'s two contract descriptions were
proved equal independently by both U1 critics
(`CriticU1T.supportSet_eq_image_support`, `R26CriticF.supportSet_eq_image`). **A successor must fix
one definition of `supportSet`, `interior` and `aVal` in a sorry-free module before any of the
conditional counting lemmas can be instantiated**; today the instantiation site does not exist in
Lean.

**CR-5. U2's conditional premises are discharge-ready from U3's compiled corpus, except one.** At
the intended instantiation: `hDL` and `hNoEdge` are definitional (U2-R3); `hLindep` follows from
U3's `tree_two_le_indepNum_no_adjacent_leaves`; `hL1` from U3's
`tree_two_le_indepNum_two_le_leafSet`; `hpartition` needs `L ∩ C = ∅` (both U3 critics compiled
it) plus a Lean `interior`; **`hBcard` needs `α = ℓ + a`, which nothing in orientation U states in
Lean at all.** That single node is the gate.

**CR-6. My own replay of the mathematics** (independent instrument, standard library, exact
integers, aggregate computed through the deletion sets `H_v`/`R_v` and the favorable filter, never
through (RI); free trees as **isomorphism classes** by centroid-rooted AHU canonical form).
Isomorphism-class counts 1,1,1,2,3,6,11,23,47,106,235,551,1301 for orders 1–13 reproduce the
expected sequence. Fixed points: `P_3` (`α=2`, `x=1`, `S=+2`, residual, **ineligible**), `P_5`
(`α=3`, `x=2`, `S=0`, **ineligible**), `P_7` (`α=4`, `x=2`, `S=−4`, **ineligible** — I confirm
controller erratum **R26-E-b** independently; no U seat used `P_7`), `P_11` (`S=−18`, eligible),
`P_13` (`S=−28`, eligible). Eligible residual **isomorphism classes** by order 7–12: 4, 5, 17, 39,
80, 167 = **312**, the figure of record, reproduced exactly; 365 at order 13, **677** over orders
7–13. On all 677:

| check | failures |
|---|---|
| `−S = ℓ(ℓ−2)M + (ℓ−4)N_2 + W_III` | **0** |
| `S ≤ 0` (RC) | **0** |
| U1's **compiled** `signBound` (`S ≤ −ℓ(ℓ−2)M`) | **0** (slack `0` attained 23 times) |
| allocation item 1(f) bound (`S ≤ −ℓ(ℓ−2)M − (ℓ−4)N_2`) | **0** |
| forced-neighbour (`U(J) = ∅` for every maximum independent `J ⊆ D`) | **0** |
| `M = #{J ⊆ D independent, |J| = a}` | **0** |
| flat law `S = −ℓ(ℓ−2) − k₂(ℓ−4)` on the 54 flat members | **0** |

`ℓ`-profile (members / with `N_2 > 0` / with `k₂ > 0`): 2: 2/0/0 · 3: 12/0/2 · 4: 59/10/33 ·
5: 120/35/85 · 6: 161/59/117 · 7: 145/52/105 · 8: 104/49/73 · 9: 49/17/28 · 10: 19/8/9 · 11: 5/1/1 ·
12: 1/0/0. This reproduces `C-U1-T`'s figures exactly. **This is bounded evidence at stated orders
and proves nothing universal** (`SOLUTION-CONTRACT.md` §3.3).

**CR-7. A record clarification I owe the synthesis.** `SEMANTIC-CONTRACT.md` §4 defines
`U(J) := {s ∈ C_1 : N(s) ∩ J = ∅}` "for independent `J ⊆ D`" without fixing `|J|`, and
`C1-ALLOCATION.md` item 1(d) writes `W_III = Σ_J Σ_{A ∈ I(U(J))}(ℓ − 2|A|)` with the same silence.
Read with `|J| = a` the identity of CR-6 **fails on 628 of 677 members**; read with `|J| = a − 1`
(the family-(III) shell, and empty at `a = 0`) it holds with **0 failures**. The forced-neighbour
lemma is exactly why: `U(J) = ∅` whenever `|J| = a`. The outer index of `W_III` is the `a − 1`
shell, and a Lean statement of `node-fibre-bound` that used the maximum shell would be vacuous.
This is a **STATED** clarification of the run's own contract, first made here; it needs an isolated
second read before it is relied on as a record.

---

## Established results

Graded on `SOLUTION-CONTRACT.md` §4. Nothing below is `formally_verified` — `C1-STAGE1-GATE.md`
Ruling 7 governs; every item is a kernel-checked fragment in an ungoverned scratch project, rebuilt
by me copy-out-first with a manual symlink bind, `lake build` in the foreground, and `#print axioms`
re-run by me showing `[propext, Classical.choice, Quot.sound]` and no `sorryAx`.

**E-1 (route-attributed, U2). Deletion injection / occupancy bound, unconditional.**

```lean
def indepPowerset (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) : Finset (Finset V) :=
  U.powerset.filter fun A => G.IsIndepSet (A : Set V)

theorem R26LA1.deletionInjectionBound (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) :
    2 * ∑ A ∈ indepPowerset G U, A.card ≤ U.card * (indepPowerset G U).card
```

Consumes none of `hyp-tree`, `hyp-alpha`, `hyp-eligible`, `(★)`. Grade **`proved_informal`**
(machine-checked). Attribution that must travel on its face: Andriantiana–Razanajatovo
Misanantenaina–Wagner (2020), **re-proved in-run** by the `A ↦ A.erase u` injection, never imported
(`SOLUTION-CONTRACT.md` fence 7). Independently re-derived by `C-U1-F` on U1's shape
(`deletionInjection_proved`, statement identity verified by me via `rfl`) and exhaustively checked
by three critics and by me.

**E-2 (critic-attributed, `C-U2-F`; U2's form as corollary). Fibre inequality, sharp and
unconditional.**

```lean
theorem R26CritF.fibreInequalitySharp (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) (ℓ : ℕ) :
    ((ℓ : ℤ) - U.card) * (indepPowerset G U).card ≤ ∑ A ∈ indepPowerset G U, ((ℓ : ℤ) - 2 * A.card)
```

No hypothesis at all — not even `|U| ≤ ℓ`. U2's `fibreInequality` (`(0:ℤ) ≤ Σ …` under
`hU : U.card ≤ ℓ`) is a two-line corollary, so `hU` is a specialization, not a need. This is
`C1-ALLOCATION.md` item 1(e)'s **quantitative** bound `W_III(J) ≥ (ℓ − |U(J)|)|I(U(J))|`, where U2
gives only the sign. Grade **`proved_informal`**, critic-attributed.

**E-3 (critic-attributed, `C-U2-T`). The exact budget identity in ℤ.**

```lean
theorem R26CritT.budgetIdentity (G : SimpleGraph V) [DecidableRel G.Adj] (B D : Finset V) (a ℓ : ℕ)
    (hpartition : B.card = (B ∩ leafSet G).card + (B ∩ suppSet G).card + (B ∩ D).card)
    (hBcard : B.card + 1 = a + ℓ) :
    ∑ s ∈ B ∩ suppSet G, ((leafDegree G s : ℤ) - 1) + ((a : ℤ) - (B ∩ D).card) + slack G B ℓ = 1
```

with `slack G B ℓ := (ℓ : ℤ) − |B ∩ L| − Σ_{s ∈ B ∩ C} λ(s)` — the contract's `h`. **`conditional`**
on `hpartition` and `hBcard`, and on nothing else: no independence, no graph hypothesis. With
`R26CritT.slack_nonneg` (which is exactly U2's `budgetWeightBound`, the only place independence
enters) this is `SEMANTIC-CONTRACT.md` §4's budget verbatim, and it is the input the three-family
classification needs and U2's `≤ 1` form cannot supply.

**E-4 (route-attributed, U2, with critic-attributed extensions). Family (I).**
`R26LA1.familyOneInjection` — `L.card * |{J ⊆ D : indep, |J| = a}| ≤ |indepSetsAvoiding G ∅
(a + (L.card − 1))|` — **`conditional`** on `hDL`, `hLindep`, `hNoEdge` (three premises, **not**
four; `hL1` is inert). Extended, critic-attributed: `R26CritT.famOneInjOn`, `famOneImageCard`
(`|image| = |L| · |famOneSource G D a|`, the exact count), `famOneImageSubset`; and `C-U2-F`'s
`familyOneWeightPointwise` / `familyOneWeightSum` (`Σ weight over the index product =
ℓ(ℓ−1)|JS|`, i.e. `W_I = ℓ(ℓ−1)M` once `|JS| = M`), conditional on `Disjoint D L`, `λ ≡ 0 on D` and
`λ ≡ 0 on L` — the last two now compiled by both U3 critics.

**E-5 (route-attributed, U3, with critic-attributed extensions). Tree-structural core,
unconditional or `hTree`/`hAlpha`-conditional, twelve declarations.** `ℓ ≥ 2` at `α ≥ 2`; no two
leaves adjacent; `leafDegree = 0` off supports (the sharp form is critic-attributed); `Σ_s λ(s) = ℓ`
and `|C_1| ≤ ℓ`; the `P_3` lemma (`ℓ = 2` with a `λ = 2` support forces `α = 2`); `α ≥ 3` from
`hyp-eligible` alone. Extended, critic-attributed and compiled twice independently: `L ∩ C = ∅`;
`λ(v) = 0` for leaves; `j · |C_j| ≤ ℓ` for every `j`, hence `k₂ ≤ ⌊ℓ/2⌋`; and — the one composition
nobody assembled — `C-U3-T`'s

```lean
theorem R26CritU3T.card_C2_eq_zero_of_eligible (G : SimpleGraph V) [DecidableRel G.Adj] :
    G.IsTree → crossingIndex G + 2 ≤ G.indepNum - 1 → (leafSet G).card = 2 →
      (univ.filter fun s => leafDegree G s = 2).card = 0
```

which is the `ℓ = 2` step of the candidate finish (`C1-ALLOCATION.md` item 1(f)). Grade
**`proved_informal`** throughout.

**E-6 (critic-attributed, `C-U1-T` and `C-U1-F`, independently and with identical statements). The
`ℓ ≥ 2` bridge.** `2 ≤ (leafSet G).card` together with the compiled `signBound` conclusion gives
`aggregate G (α−1) ≤ 0`; `hEligible` is not consumed. This is a true implication and is **not**
evidence for (RC): its antecedent is an open node.

**E-7 (adjudicator-derived, STATED, needs an isolated second read before registration).** The first
`(★)`-consuming step is a twelve-line lemma. I compiled, sorry-free, axioms
`[propext, Classical.choice, Quot.sound]`:

```lean
theorem R26AdjU.maxIndep_leafDegree_eq_zero (G : SimpleGraph V) [DecidableRel G.Adj]
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v →
      ∀ S : Finset V, G.IsIndepSet (S : Set V) → S.card = G.indepNum → v ∈ S)
    (S : Finset V) (hS : G.IsIndepSet (S : Set V)) (hcard : S.card = G.indepNum)
    {s : V} (hs : s ∈ S) : C5LA1.leafDegree G s = 0
```

— a maximum independent set contains no support, from `(★)` alone: **no `hyp-tree`, no
`hyp-alpha`, no `hyp-eligible`**. With U3's critic-compiled `L ∩ C = ∅` and U2's
`isIndepSet_union_of_no_cross_adj` this reduces `α = ℓ + a` to a short composition. I state it to
size the gate correctly for Cycle 2, not to claim it as portfolio evidence.

**Not established, and explicitly not certified by me.** (RC) at the `SOLUTION-CONTRACT.md` §2
statement; `R26LA1.signBound` in any form; the forced-neighbour lemma; the three-family
classification; `W_II = (ℓ−4)N_2`; `W_III` as the `(a−1)`-shell sum; `N_2 ≤ M` and the `ℓ = 3`
finish; `|JS| = M`; `α = ℓ + a`. Unverifiable at Stage 5: the three seats' lexical alias checks
against `control/CLAIM-IDENTITY.run-local.json` — that file is not a capsule member, three critics
flagged it, and I could not read it either. I route it to the controller and the synthesis.

**Fences (`SOLUTION-CONTRACT.md` §3), checked clause by clause across all nine artifacts.** No
status transfer to `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN), `E993-BETA-AGG` (OPEN), the
common-leaf condition, TREE, FOREST, TRANSFER or Erdős #993; no ordinary-to-RTree transport
attempted. `hyp-eligible` is kept verbatim in every statement of record, and the two routes that use
it only through `α ≥ 3` say so. No census is offered as universal evidence; my own is declared
bounded. No counterexample is proposed. The r24 "1,420 realized" statement is never quoted and no
sealed r24 file is edited or mutated. No refuted mechanism is reopened — `crossingIndex` appears in
the corpus only in the two `α ≥ 3` lemmas. The occupancy bound is re-proved in-run, not imported;
its **attribution literal is missing** and must be attached before registration. **No fence is
crossed by any U artifact.**

**Tier 2 (item 7 of the protocol) is orientation F's object.** Nothing in my portfolio bears on the
`E993-R26-C6-B3-FAMILY-I-REALIZATION-CORRECTION` record, and I rule on nothing about it.

---

## Rejected and narrowed mechanisms

1. **`R26LA1.signBound` as the allocation's bound — rejected.** The compiled statement omits
   `−(ℓ−4)N_2`. It is *weaker* than item 1(f) for `ℓ ≥ 5` (free, but contentless), coincides at
   `ℓ = 4`, and is *strictly stronger* for `ℓ ≤ 3`, where the cited derivation cannot reach it. It
   must not be inherited as item 1(f). Either restate it as item 1(f) in ℤ with `N_2` first added to
   the contract's `definitions:`, or keep the `N_2`-free form with the hypothesis `4 ≤ ℓ` and carry
   `ℓ = 3` and `ℓ = 2` as separate named nodes.
2. **The DAG's terminal edge as drawn — rejected.** `node-alpha-ge-three → node-sign-bound` is not
   consumed by the assembly; `2 ≤ ℓ` is, and that node does not exist in the draft. Remove the edge,
   add `ℓ ≥ 2`, `ℓ = 2`-with-`λ = 2`-forces-`P_3`, and leaf/support disjointness.
3. **`expected_statement` as a Stage 7 textual commitment — rejected** until it is fully qualified
   to match the shipped declaration and its digest recomputed.
4. **`hL1` as a premise of `familyOneInjection` — rejected** (inert; two independent compiled
   proofs without it). The real arithmetic obligation, `a + (ℓ−1) = α − 1` rather than `a`, lives at
   the call site and must be stated there.
5. **`(★)` as the carrier of `hNoEdge` — rejected.** "No interior vertex is adjacent to a leaf"
   follows from the definitions of `L`, `C`, `D` alone. `SEMANTIC-CONTRACT.md` §3 over-attributes
   it, and U2's hypothesis map inherits the over-attribution. `(★)` carries `hBcard` (`α = ℓ + a`)
   and nothing else in U2's lemma set.
6. **The budget `≤ 1` form as an input to the family classification — rejected.** It is satisfied by
   `0` and by `1` alike and cannot recognize family (I). The `= 1` identity (E-3) supersedes it.
7. **`connected_induce_compl_pair` as a DAG step — rejected** (off-framework; `G.induce` changes the
   vertex type, which `SEMANTIC-CONTRACT.md` §1 forbids for this run's counting layer). Retained as
   a spare part only.
8. **"full `IsTree` on the two-leaf-deleted subgraph" — rejected** (needs `Nonempty`; false for
   `K_2`). The corrected form is compiled and critic-attributed.
9. **"maximally general within this run's scope" — rejected** for U3's lemma (c); the sharp form is
   compiled twice.
10. **Narrowed, not rejected.** "Evidentiary strength equal to a `formally_verified` award" →
    kernel-equivalent only. "Item 8 (a)–(d) exactly in content" → true for (a), (b), (d); false for
    (c). "Digests of every Lean file" → omits `AxiomsCheck.lean`. Warning counts, declaration counts
    ("four auxiliaries" → five; "two DAG nodes" → three), the "several use only a strict subset"
    literal, the §4-grade-scale mislabel, the §3.5-for-§3.2 citation, and the
    `ps aux | grep`/background-job literal — all struck or corrected as recorded above. **Every one
    of these is a certification or prose defect; not one invalidates a compiled declaration.**
11. **Two read-boundary negatives struck** (U1, U3): "no other VerityOS file was read". Both reads
    are the R26-E-a class already accepted for U2, benign and disclosed in substance; the Stage 3
    disclosure record should be amended. No re-run, no mathematical effect, no seat penalty beyond
    the strike.

---

## Lean readiness

The cycle's central ruling for my orientation, against `SOLUTION-CONTRACT.md` §2's exact statement.

**(a) A complete informal proof of (RC) at statement-level granularity with a closed dependency
DAG: NO.** My portfolio contains no informal proof of (RC) at all — that is orientation T's object
and by design no U seat attempted it. The only DAG in my portfolio (U1's) is open at five nodes,
does not reach its own conclusion (Rejected-mechanism 2), and mislabels one of its nodes
(Rejected-mechanism 1). I certify nothing about (RC)'s informal status on U evidence.

**(b) Compiled fragments covering named DAG nodes sorry-free: YES, substantially — but only on the
`(★)`-free periphery.** Rebuilt by me: 4 (U1) + 7 (U2) + 12 (U3) seat declarations and 32 critic
declarations, every one sorry-free with exactly the permitted axioms, all three builds
`Build completed successfully (8658 jobs)`. Coverage by DAG node:
`node-deletion-injection` **covered** (twice); `node-fibre-bound`'s inequality **covered and
sharpened**, but its *instantiation* at `U(J)` is not; family (I)'s injection and exact image count
**covered** conditionally; the budget **covered** as an exact identity conditionally; the
tree-structural Tier-3 lemmas **covered** except `ℓ = 2`-with-`λ = 2`-forces-`P_3` at the eligible
class, which `C-U3-T` also covered. `node-alpha-eq-ell-plus-a`, `node-forced-neighbour`,
`node-family-classification`, `node-sign-bound` and the conclusion: **not covered**.

**(c) Named open nodes.** `node-alpha-eq-ell-plus-a` (no Lean statement anywhere in orientation U);
`node-forced-neighbour` (typed, `sorry`); `node-family-classification` (never typed);
`W_II = (ℓ−4)N_2` and `W_III` as the `(a−1)`-shell sum (never typed, and `N_2`, `U(J)`, `C_1`,
`W_I/W_II/W_III` are undefined in the draft contract); `node-sign-bound` (typed, `sorry`, and typed
*wrongly*); `N_2 ≤ M` / the `ℓ = 3` finish; `|JS| = M`; and the single Lean definition site for
`supportSet`/`interior`/`aVal` that all the conditional lemmas need.

**Award groups in orientation U and their readiness.**

| group | content | ready for a Stage 7 contract? |
|---|---|---|
| **U-A Deletion injection** | `R26LA1.deletionInjectionBound` (E-1) | **YES** — exact statement above, unconditional, sorry-free, permitted axioms, non-vacuous, re-derived by three critics and by me. Fences: carry the AMW-2020 attribution as an in-run re-proof; no status transfer; this is a Tier-3 lemma with material reuse, never (RC). |
| **U-B Fibre inequality (sharp)** | `R26CritF.fibreInequalitySharp` + U2's corollary (E-2) | **YES**, critic-attributed to `C-U2-F`. Same fences. Its *use* (instantiation at `U(J)`) is not ready. |
| **U-C Tree-structural core** | U3's twelve + the critics' `L ∩ C = ∅`, `λ ≡ 0` on `L`, `j·|C_j| ≤ ℓ`, `k₂ ≤ ⌊ℓ/2⌋`, `ℓ = 2`-eligible `⟹ k₂ = 0` (E-5) | **YES with two repairs**: state lemma (c) in the sharp form; drop the `IsTree` corollary of `connected_induce_compl_pair`. One derivation of each fact only — and **T3's overlapping route must be reconciled with it first**, which I cannot do from inside my capsule. |
| **U-D Budget** | `budgetWeightBound` (unconditional) + `R26CritT.budgetIdentity`/`slack_nonneg`/`budgetExact` (E-3) | **YES as a conditional group** at the exact statement above, with `hpartition` and `hBcard` as explicit surviving premises named on its face. **NOT ready as an unconditional statement**: `hBcard` needs `α = ℓ + a`. |
| **U-E Family (I)** | `familyOneInjection` (3 premises) + `famOneInjOn`/`famOneImageCard`/`famOneImageSubset` + `familyOneWeightPointwise`/`familyOneWeightSum` (E-4) | **Conditional only.** Not ready as item 8(c)/1(d) until `|JS| = M` and the identification of the image with the family-(I) *subset* are proved. |
| **U-F (RC) itself / `signBound`** | U1's skeleton | **NO.** Four open sorries, a wrongly stated node, a DAG that does not reach its conclusion, and an `expected_statement` that does not match its declaration. |

**Nothing in my orientation qualifies as an award for (RC).** A fixed-band or bounded result never
qualifies and none is offered; no group is a repackaging of the verified (RI) — (RI) is an equality
and appears in the corpus only as a byte-identical imported module.

**The smallest open Lean node in orientation U** is `node-alpha-eq-ell-plus-a`, stated in Lean as:
under `hyp-tree`, `hyp-alpha` and `(★)`, every maximum independent `S` satisfies
`S = leafSet G ∪ (S ∩ interior G)` with `(S ∩ interior G).card = G.indepNum − (leafSet G).card`,
and conversely `leafSet G ∪ J` is maximum independent for every independent `J ⊆ interior G` of that
size — hence `α = ℓ + a` and `M = |{J ⊆ interior G : independent, |J| = a}|`. **No declaration
anywhere in orientation U states it**; U1 declined to type it, and it gates `forcedNeighbour`,
`hBcard`, `|JS| = M` and therefore every conditional lemma in U-D and U-E. My adjudicator probe
(E-7, STATED) shows its first `(★)` step is twelve lines, so this is a one-cycle node, not a
research problem.

---

## Progress and plateau assessment

material_progress: yes

orientation_plateau: no

Orientation U entered Cycle 1 with **zero** compiled Lean coverage of (RC) beyond the frozen (RI)
module and leaves it with 23 seat declarations and 32 critic declarations, every one rebuilt by me
sorry-free with the three permitted axioms: the occupancy bound re-proved in-run (fence 7's
requirement discharged in Lean), the fibre inequality in a sharper hypothesis-free form than the
charter asked for, the family-(I) injection with its exact image count and weight sum, the
`SEMANTIC-CONTRACT.md` §4 budget as an **exact identity** localized to two cardinality premises, and
the tree-structural Tier-3 layer including `L ∩ C = ∅`, `k₂ ≤ ⌊ℓ/2⌋` and the `ℓ = 2` closure. Two
architecture defects that would have propagated into a Stage 7 contract were caught and corrected
before they could (`signBound`'s statement, the DAG's missing terminal node), and U1's sorry count
was reduced from five to four by a critic-compiled proof whose statement identity I verified in the
kernel. That is material progress on the **formalization**, which `SOLUTION-CONTRACT.md` §5 names
as one of the three tracks on which a plateau is judged.

**Stop gate.** No decisive event at my orientation: (RC) is not formally verified at the §2
statement (`C1-STAGE1-GATE.md` Ruling 7 forbids a seat award, and none of the five open nodes is
closed), and no in-scope counterexample exists — my own census found `S ≤ 0` on all 677 eligible
residual isomorphism classes of orders 7–13 with zero violations, which is bounded evidence and not
a proof. §5(c) is not met either at my orientation, because §5(c) requires a complete informal proof
with a closed DAG and my portfolio contains no informal proof of (RC) at all; whether the run's
evidence as a whole meets §5(c) turns on orientation T's portfolio, which I have not read and on
which I rule nothing. A plateau requires evidence of no material progress; the opposite is on the
record.

---

## Headline assessment

headline_resolved: no

status: still_open

(RC) — `E993-R26-TOP-RANK-RESIDUAL-SIGN`, "for every finite ordinary tree `G` with `2 ≤ α(G)`,
`x(G) + 2 ≤ α(G) − 1` and every leaf in every maximum independent set, `S(G, α(G)−1) ≤ 0`" — is
**still open at my orientation's evidence grade**. `proved` would require a complete informal proof
I have verified; orientation U produced none and was not chartered to. `refuted` would require an
in-scope counterexample per fence §3.4; none exists and my own exhaustive census of the eligible
residual class to order 13 found no positive `S`. The grade of (RC) after my portfolio is exactly
what `C1-STAGE1-GATE.md` recorded at Stage 1 — OPEN on the non-flat class — and no fragment in my
orientation moves it. `headline_resolved` is `no` by construction: the run's headline is (RC)
formally verified through the governed workflow, which is Stage 7's alone.

The two registered claims named by every U artifact remain untouched in both directions:
`E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` **OPEN**, `E993-BETA-AGG` **OPEN**. No status transfer
in any direction; no run-local key is registered by this adjudication.

---

## Next-route allocation

The exact remaining obligation for orientation U, in one sentence: **define `supportSet`,
`interior` and `aVal` once in a sorry-free Lean module, compile `α = ℓ + a` with the maximum-set
bijection, and on that base turn U2's and its critics' conditional counting lemmas into the exact
family decomposition `−S = ℓ(ℓ−2)M + (ℓ−4)N_2 + W_III`** — after which (RC) is a pure inequality
over three compiled quantities. Three routes for Cycle 2 (the cycle keeps three per orientation):

**`C2-U-01 RC-LEAN-RESIDUAL-BIJECTION-AND-FORCED-NEIGHBOUR`.** Fix the definition site
(`supportSet` as the filter *and* the image, with the two proved equal — both U1 critics supply the
proof; `interior`; `aVal`), then compile sorry-free: `α = ℓ + a`; the bijection of maximum
independent sets of `G` with maximum independent `J ⊆ D`, hence `M = |{J ⊆ D : indep, |J| = a}|`;
and the forced-neighbour lemma (under `(★)`, every maximum independent `J ⊆ D` meets `N(s)` for
every `s ∈ C_1` — the informal proof is one paragraph: otherwise `J ∪ {s} ∪ (L ∖ {v_s})` is a
maximum independent set missing the leaf `v_s`). **Could close in one cycle**, and closing it makes
U-D and U-E unconditional at the intended instantiation and discharges `hpartition`/`hBcard`
outright. Inputs already compiled: E-5, E-7 (STATED), U2's `isIndepSet_union_of_no_cross_adj`.

**`C2-U-02 RC-LEAN-FAMILY-CLASSIFICATION-AND-SUMS`.** From `R26CritT.budgetExact`, compile the
**exhaustive** three-family classification of `B ∈ I_{α−1}(G)` — including the declaration that the
`a − 1` shell is empty at `a = 0` (`SEMANTIC-CONTRACT.md` §5) and a proof that no fourth case
occurs — then define `N_2`, `C_1`, `U(J)` and `W_I/W_II/W_III` in Lean (with `W_III` indexed by the
`a − 1` shell, per CR-7) and compile `W_I = ℓ(ℓ−1)M` (composing `C-U2-F`'s weight sum with
`|JS| = M` from route 1) and `W_II = (ℓ−4)N_2`. **Could close in one cycle** the Lean-level exact
identity `−S = ℓ(ℓ−2)M + (ℓ−4)N_2 + W_III`, which is the whole content of (RC) modulo the finish.

**`C2-U-03 RC-LEAN-CONTRACT-REPAIR-AND-FINISH-SPLIT`.** Rebuild `THEOREM-CONTRACT.draft.yaml`
against the shipped declaration: fully qualify `expected_statement` and recompute its digest; add
`N_2`, `U(J)`, `C_1`, `W_I/W_II/W_III` to `definitions:`; add the three missing Tier-3 nodes and
remove the edge `node-alpha-ge-three → node-sign-bound`; restate `node-sign-bound` as item 1(f)'s
bound with the `ℓ ≥ 4 / 3 / 2` finish as three separate named nodes; carry `C-U3-T`'s
`card_C2_eq_zero_of_eligible` as the compiled `ℓ = 2` finish; and compile `N_2 ≤ M` for the `ℓ = 3`
finish. **Could close in one cycle** the contract defect that would otherwise fail a Stage 7
fidelity review, and the `ℓ ≤ 3` gap that is the last unexamined corner of the candidate argument.

Two items I could not settle from inside my capsule and route onward: (i) the three seats' lexical
alias checks against `control/CLAIM-IDENTITY.run-local.json`, flagged by three critics and
unverifiable by any of us — the controller or the synthesis must confirm them before any run-local
key is proposed; (ii) the reconciliation of U-C with T3's independently derived tree-structural
list, which both U3 critics and the U3 return itself flag, and which must be done before Stage 7 so
the award group carries one derivation of each fact rather than two.

---

## Artifact inventory

All my work is under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23/scratchpad/c1-adj-U/`
(absolute). Nothing was written anywhere else except this adjudication. No `/tmp`, no session
scratchpad, no write under `sources/`, `cycles/cycle-1/stage3/`, `cycles/cycle-1/stage4/`, or any
seat's or critic's own scratch. No wall-clock, PID or host field enters any output.

| artifact | what it is |
|---|---|
| `verify_seal.py` | capsule seal recomputation + all 24 member digests |
| `adj_instrument.py` | my own instrument: the `SEMANTIC-CONTRACT.md` predicates re-implemented from the contract (leaf = exactly one neighbour; `crossingIndex` = first STRICT descent; `aggregate` through `H_v`/`R_v` and the favorable filter, **never** through (RI)); independence polynomials by forest DP in exact integers; free trees as isomorphism classes by centroid-rooted AHU canonical form |
| `replay/U1/LeanProject`, `replay/U2/LeanProject`, `replay/U3/LeanProject` | copy-out-first rebuilds of the three seats' projects; `.lake/packages` a manual symlink to the shared pinned Mathlib; nothing copied, no `lake update`, no `lake clean` |
| `replay/U1/LeanProject/AdjAxU1.lean`, `replay/U2/LeanProject/AdjAxU2.lean` | my own `#print axioms` / `#check` drivers |
| `replay/{U1,U2,U3}/LeanProject/LeanProof/Critic*.lean` | the six critic fragments, copied out unedited (digests in the seal audit) and re-elaborated by me |
| `replay/U1/LeanProject/LeanProof/AdjCheck.lean`, `replay/U2/…/AdjCheck2.lean`, `replay/U3/…/AdjCheck3.lean` | statement-identity checks, including `example : @R26LA1.deletionInjection = @R26CriticF.deletionInjection_proved := rfl` |
| `replay/U3/LeanProject/LeanProof/AdjProbe.lean` | the adjudicator probe E-7 (**STATED**; needs an isolated second read) |
| `replay/U1-contract/` | U1's `THEOREM-CONTRACT.draft.yaml` and `check_dag_acyclic.py`, copied out unedited and replayed byte-for-byte |

**IMPORT LIST** (every generator of mine; standard library only, exact integers, no network, no
third-party package, no install): `adj_instrument.py` — `sys`, `itertools.combinations`;
`verify_seal.py` — `hashlib`, `json`, `os`; the inline census driver — `sys`, `collections`, plus
`adj_instrument`; the contract audit — `hashlib` plus `yaml`, which is **not** standard library:
PyYAML was already present in the environment (the U1 return uses it too), nothing was installed,
and I used it only to parse the seat's own YAML file, never to compute or check a mathematical
claim. Disclosed rather than let pass. The
Lean modules import `LeanProof.Main` (hence `LeanProof.C5LA1`, hence `Mathlib`) and nothing else.

**Replay commands** (copy-out-first; every target inside the run root):

```
RR=/Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23
ADJ=$RR/scratchpad/c1-adj-U
python3 $ADJ/verify_seal.py
for S in U1 U2 U3; do (cd $ADJ/replay/$S/LeanProject && lake build); done      # foreground
(cd $ADJ/replay/U1/LeanProject && lake env lean AdjAxU1.lean)
(cd $ADJ/replay/U2/LeanProject && lake env lean AdjAxU2.lean)
(cd $ADJ/replay/U3/LeanProject && lake env lean LeanProof/AdjProbe.lean)
(cd $ADJ/replay/U1-contract && python3 check_dag_acyclic.py)
```

**Background jobs: none.** No job was ever started in the background. Every `lake build`, every
`lake env lean` and every Python run executed in the foreground and completed before this file was
written; nothing was detached and nothing was polled or killed by pattern. There is nothing to kill
at this write.

This adjudication was reread before close.
