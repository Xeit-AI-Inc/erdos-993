# Second Read

Isolated second read `SR-REC`, Cycle 1, r27 (`erdos-993-math-dre-20260924-r27-forest-degree-extension`).
Protocol `control/C1-SECOND-READ-PROTOCOL.md`; brief `control/C1-SECOND-READ-BRIEF-SR-REC.md`; capsule
`control/c1-second-read/SR-REC-PACKET-MANIFEST.json`. Objects: `RE-1` the K1-addition closure at `x ≤ 5`,
`RE-2` the rank-5 residue closeout record, `RE-3` the external-source audit record, `RE-4` the registry
comparison table and alias-check result.

**VerityOS boot acknowledgment.** Operating within VerityOS. Booted by reading **exactly** the two files the
protocol authorizes — `/Users/ashtonsperry/VerityOS/verity.md` (root constitution) and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (identity subsystem, startup sequence) — and no
other file under the VerityOS root outside this experiment. Subsystem loaded: `experiments/`, this run root
only. No `memory/`, `knowledge/`, `decisions/`, `operations/`, `logs/`, `conversations/`, `modules/`,
`skills/`, `inbox/` or `writing/` file was read, and the startup protocol's task-type map into those
subsystems was not followed (the dispatch narrows the boot). No read-boundary disclosure arises on that axis.

chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

---

## Identity and seal audit

**Capsule seal (required report).** `control/c1-second-read/SR-REC-PACKET-MANIFEST.json`, inner seal
recomputed by my own script over the canonical JSON of the manifest minus `seal_sha256` (`sort_keys=True`,
`separators=(",",":")`, UTF-8, no trailing newline):

```
e89e7953a86ca049f1afe549bb1f9095012ca5272255811a5a9b4e6586f9213b
```

— identical to the declared value. **MATCH.** `file_count: 51` equals the member count; **51/51** members
verify byte length **and** SHA-256 on disk; **zero** mismatches, **zero** missing. `run_id`
`erdos-993-math-dre-20260924-r27-forest-degree-extension`; `stage` `cycle-1-second-read-SR-REC`;
`schema_version` `verityos.math-dre.packet-manifest.v1`.

**Registry identity.** `control/CLAIM-IDENTITY.run-local.json` reads
`47697cba1e11d5898000d66c4d3d4502278af59e380ef0e952da3197d13e7fa2` — identical to the manifest row and to
the digest the synthesis reports for `sources/authority/CLAIM-IDENTITY.json`. Counted by my own script:
**370 claims** (214 VERIFIED / 89 REFUTED / 41 OPEN / 26 CONDITIONAL), **452** `aliases` entries, **132**
`alias_patterns`, 370 distinct `claim_key` values. Every figure the synthesis prints for the registry is
reproduced exactly.

**Path check.** `control/c1-second-read/PATH-CHECK-SR-REC.json` (capsule member): 47 files scanned,
`files_with_findings: 0`, `finding_count: 0`, `findings: []`, no denied root touched.

**Read boundary.** VerityOS: exactly `verity.md` and `identity/startup-protocol.md`. Run root: capsule
members only, each by exact path, plus the dispatch wrapper
`control/dispatch/c1-second-read/DISPATCH-SR-REC.md`, which is not itself a manifest member and carries only
the pointer to the capsule, the protocol and the brief. I did **not** open `sources/external/lean-source/` (Gate ruling 3,
protocol duty 4) and I did **not** execute the capsule's F2 scratch scripts, because
`static_scan.py`/`dep_closure.py`/`import_graph.py` read that directory (`scanned_dir:
sources/external/lean-source` in the shipped report) and executing them would be an indirect read of it; I
read their **shipped reports**, which are capsule members. I opened no non-member file: no r25 census
artifact (`search_report_n21.json`, `closure_certificate.json`, `nr1_*`), no `sources/external/STATIC-SCAN.json`,
no `repository-tree.json`, no `control/C1-ALLOCATION.md`, no `control/C1-WORKER-COMMON-BRIEF.md`, no U-orientation
return, critique or adjudication, no other experiment root. No `find`, no `grep`/`rg` rooted above a capsule
member, no recursive listing, no network, no install, no Lean build, no `lake`, no `elan`. Every command ran
in the **foreground**; no background job was started at any point, so there was no PID to kill and no kill of
any kind was issued. No wall-clock, PID or host value enters this file or any file I wrote. No sealed member
was edited.

**My own instrument.** `scratchpad/c1-sr-SR-REC/` — `seal_verify.py`, `alias_check.py`, `sr_verify.py`.
Python standard library only (`itertools`, `json`, `hashlib`, `re`, `sys`, `math.comb`), exact integers, no
floats, no RNG. Built from `SEMANTIC-CONTRACT.md` §1 alone. I executed no seat, critic, adjudicator or
synthesis script.

---

## Statements read

| id | Object | As proposed |
|---|---|---|
| `RE-1` | `E993-R27-KADDITION-CLOSURE-X-LE-5` | `x(G ⊔ K₁) ≤ x(G) + 1` for every finite forest with `x(G) ≤ 5`; grade `proved_informal`-with-census; evidence line rewritten by the F adjudicator (`cycles/cycle-1/stage5/adjudicators/F/ADJUDICATION.md`, Established result 5) from F3's draft (`cycles/cycle-1/stage3/returns/F3/RETURN.md` §7) |
| `RE-2` | Rank-5 residue closeout record | The residue of `E993-R25-RANK5-CEILING-SHARPENED-TO-25` (orders 22–25, ≥ 3 branch vertices) is EMPTY under (R5), at `proved_informal`; plus the eight r25/artifact scope notes under the synthesis `## Headline verdicts` |
| `RE-3` | External-source audit record | Statement fidelity of the four external declarations named in `SOLUTION-CONTRACT.md` §1 Tier 3; the dependency-graph claim; the static-scan claim; the toolchain difference; the license status; plus the five packet record corrections |
| `RE-4` | Registry comparison table and alias-check result | The nine-row exact-key table and "zero exact alias matches, zero `alias_patterns` matches" across 370 claims |

Candidate wording is the synthesis's (`cycles/cycle-1/stage6/SYNTHESIS.md` `## Registrations` table B,
`## Headline verdicts`, `## Identity and seal audit`, Established results 24/25/26). It is the **candidate**,
never the authority; every statement below is re-derived from `SEMANTIC-CONTRACT.md` §1 and the capsule.

---

## Independent re-derivation

### Fixed points, before any table (`SEMANTIC-CONTRACT.md` §4)

Reproduced by `sr_verify.py` from the definitions, not asserted: empty forest `i = [1]`, `Δ_0 = −1`, `x = 0`;
`K₁` `i = [1,1]`, `Δ_0 = 0` (not a descent), `Δ_1 = −1`, `x = 1`; `K₂` `i = [1,2]`, `D_1 = 2`; `P₅`
`i = [1,5,6,1]`, `D = [0,8,18,4]`; `K_{1,5}` `i = [1,6,10,10,5,1]`; `i_k(P_n) = C(n−k+1,k)` verified by
enumeration for `n ≤ 9`; `K_{1,m}` with `i_1 = m+1`, `i_k = C(m,k)` for `k ≥ 2`, verified for `m ≤ 7`. All
exact.

### `RE-1` — the K1-addition closure at `x ≤ 5`

**The NR1 reduction, re-derived.** For any graph `G` and the disjoint union with an isolated vertex, every
independent set of `G ⊔ K₁` either omits or contains that vertex, so `i_k(G ⊔ K₁) = i_k(G) + i_{k−1}(G)`
with the integer zero extension (`i_{−1} := 0`). Hence in `ℤ`, for every natural `j`,

```
Δ_j(G ⊔ K₁) = i_{j+1}(G ⊔ K₁) − i_j(G ⊔ K₁)
            = [i_{j+1}(G) + i_j(G)] − [i_j(G) + i_{j−1}(G)]
            = i_{j+1}(G) − i_{j−1}(G)  =  Δ_j(G) + Δ_{j−1}(G).
```

Acyclicity is used **nowhere**; finiteness only. There is **no `ℕ`-subtraction**: the identity is in `ℤ` and
`i_{j−1}` at `j = 0` is the zero extension, not a truncated difference. I verified both equalities
coefficient by coefficient on **every labelled forest on `0 ≤ n ≤ 7` vertices** — every acyclic edge subset
of `K_n`, counts `1,1,2,7,38,291,2932,36961`, **40,233** objects — at every `j` in `0..n+2`: **0 failures**.

**The case split, and its completeness.** `x(G) ≤ 5` splits as `x(G) ≤ 4` and `x(G) = 5`, with no third case.

- `x(G) ≤ 4` — the registered `E993-R25-KADDITION-CLOSURE-X-LE-4`. Read at the exact key in
  `control/CLAIM-IDENTITY.run-local.json`: **VERIFIED**, statement `x(G + K1) <= x(G)+1 for every finite
  forest G with x(G) <= 4 (no order bound in the hypothesis)`, certificate `proved_informal`, with "the
  order-<= 21 in-run forest census (8,355,831 classes)" named as the remaining input **on its own face**.
  Because the hypothesis carries no order bound, this half needs no order argument and no small-order
  supplement.
- `x(G) = 5` — then `Δ_5(G) < 0`, so (R5) (`n ≥ 21 ⇒ Δ_5 ≥ 0`, equivalently `Δ_5 < 0 ⇒ n ≤ 20`) gives
  `n ≤ 20`. The order-≤21 census population (orders 1–21) contains every such `G`, and the census checked the
  **target itself** — not merely a `Δ_k` sign — with zero violations.

**Order-0 coverage, discharged in one line and without the certificate.** `i_1(G) = n` for every finite graph
and `i_0 = 1`, so `Δ_0(G) = n − 1 < 0` **iff** `n = 0`: `x(G) = 0` holds for the empty forest and for nothing
else. Then `∅ ⊔ K₁ = K₁`, whose first strict descent is `1 = 0 + 1`, so the closure holds at rank 0 outright.
My instrument confirms `x(G) = 0 ⟺ n = 0` on all 40,233 labelled forests (0 failures) and reproduces the two
fixed points. This makes the order-0 coverage **complete and census-independent**; it does not need
`closure_certificate.json`, which is not a member of my capsule and which I did not open.

**The closure checked directly, as far as exhaustion reaches.** `x(G ⊔ K₁) ≤ x(G) + 1` verified on every one
of the 40,233 labelled forests to order 7: **0 failures**. Observed `max x(G)` per order: `0,1,1,2,2,3,3,4`
for `n = 0..7` — the ranks reachable inside my horizon, so ranks 0–4 are exercised directly and rank 5 is
beyond exhaustion and rests on the composition above.

**(R5) at the one arithmetic point.** (LB) `Δ_k < 0 ⇒ n ≤ 4k` at `k = 5` gives `n ≤ 20`; contraposing,
`n ≥ 21 ⇒ Δ_5 ≥ 0`. `4·5 = 20`, checked. (LB) is not my object; I checked it on all 40,233 labelled forests
(0 violations at every `k`, including `k = 0`, where `Δ_0 < 0 ⟺ n = 0 ≤ 0`).

**Isomorphism invariance.** `x(G)` and `x(G ⊔ K₁)` are isomorphism invariants (they are functions of the
`i_k` sequence), so a census over isomorphism classes discharges the universal statement over labelled
forests. That hypothesis is used by the composition and is sound.

**Grade.** `SOLUTION-CONTRACT.md` §4: a composition's grade is its weakest input's. The inputs are (R5)
(`proved_informal` at the close of Stage 6), the registered `x ≤ 4` closure (`proved_informal`, itself
census-bearing), and the order-≤21 census (bounded computation, **complete** on a provably covering finite
population). `SEMANTIC-CONTRACT.md` §2 fixes the resulting label in terms: "the closure stays
`proved_informal`-with-census, never `formally_verified`", and fence §3.4 with Gate ruling 6 forbid any
promotion by the eventual formal grade of (LB)/(R5). The synthesis's grade is contract-conformant, and the
census must be named on the face. Confirmed.

**Fences.** §3.1 — no status transfer to `E993-R25-UNR-FOREST-WIDE` (read at the exact key: **OPEN**),
`E993-G1WIDE-NO-SIZE-CAP` (**OPEN**), NR1, FOREST, TREE, TRANSFER or Erdős #993; the closure is not an order
bound and carries no no-recovery wording. §3.2 — nothing asymptotic. §3.3 — no pointwise degree statement.
§3.4 — the grade is the census's, named on the face. §3.5 — nothing sealed is edited. §3.6 — no external Lean
text. §3.7 — attribution travels. §3.8 — see the repair below.

**Key as predicate.** `E993-R27-KADDITION-CLOSURE-X-LE-5` asserts exactly "K1-addition closure, `x ≤ 5`". The
statement satisfies it and the key asserts no more: no order bound, no rank beyond 5, no formal grade, no
claim about `x(F₁ ⊔ F₂)` for general `F₂`. Confirmed.

### `RE-2` — the rank-5 residue closeout

**Dependency by dependency, and the census does not appear.** The object of record is
`E993-R25-RANK5-CEILING-SHARPENED-TO-25`, read at the exact key: **VERIFIED**, statement `For every finite
forest F: Delta_5(F) < 0 implies |V(F)| <= 25`, and its `scope` field carries, verbatim, "Residue for x = 5
on orders 22-25: forests with at least THREE branch vertices". So the residue stratum is exactly
`{finite forests F : 22 ≤ |V(F)| ≤ 25, at least three vertices of degree ≥ 3, Δ_5(F) < 0}`.

```
(DL)  proved_informal (r27 Cycle 1)
  +   the double count and the e(J) bound  (formally_verified, no acyclicity)
  ⇒   (EX)   ⇒   (LB)   ⇒   (R5):  n ≥ 21 ⇒ Δ_5(G) ≥ 0
for n ∈ {22, 23, 24, 25}:  n ≥ 21, hence Δ_5 ≥ 0, hence ¬(Δ_5 < 0)
  ⇒   the residue stratum is EMPTY, whatever the branch-vertex count.
```

`22, 23, 24, 25 ≥ 21` checked. **No census, no branch-vertex analysis, and no r25 rank-5 input appears
anywhere in this chain** — the emptiness follows from an order band alone, so the branch-vertex condition is
inert. That is the whole of the argument and it is correct. Consequently the closeout's grade is **exactly
(R5)'s**, `proved_informal`; it is **not** census-bound (unlike `RE-1`), **not** unconditional, and **not**
formal.

**It edits nothing sealed.** The closeout is a record and a note on a face; the r25 claim's own statement,
its VERIFIED status and its certificate are untouched (fence §3.5). A `proved_informal` consequence may not
be written onto a VERIFIED face without its grade; the registration text below carries the grade in the note
itself.

**The eight scope notes, each tested for "note, not status change".** Notes 1, 2, 3, 6 and 7 are pure scope
notes: each says the r25 claim is unchanged at its own statement and grade and records only a downstream
consequence or a superseded input role. Note 8 is a note on a **frozen artifact's phrasing**, not on a
registered claim, and is phrased as owed rather than applied. Note 4 is a scope note. Note 5 is a scope note
**except** for one embedded clause — see Findings. Independently checked arithmetic carried by the notes:
`(k+1)² − 4k = (k−1)² ≥ 0`, zero **iff** `k = 1` (verified for `k = 0..12`); `k² + k + 3 − 4k = k² − 3k + 3 > 0`
for every `k` (discriminant `9 − 12 = −3`; verified for `k = 0..40`); `(LB)` gives 16 at `k = 4` against the
registered 19, and 20 at `k = 5` against the registered 25 and 29. The registered maxima `4, 8, 11, 15` at
`k = 1..4` are on the `(k+1)²` award's own `scope` field, as note 5 says.

### `RE-3` — the external-source audit record

**What I could check, and what I could not.** Protocol duty 4 and Gate ruling 3 forbid me the external Lean
slice. I therefore **could not** independently verify any statement-fidelity claim about `sum_degOn_le`,
`prefix_ratio`, `sum_numExtensions` or `numExtensions_ge`, nor their line numbers, hypotheses, `S = univ`
specialization, the `[DecidableRel G.Adj]` bridge, the ℕ-truncation caveat on `prefix_ratio`, the external
toolchain/pin values, the `LICENSE` absence, or the Lean docstrings' "Lemma 6.1"/"Proposition 6.2". Those
rest on F2, its two critics and the F adjudicator, and the record must say so. I say so here and in the
record text.

**Paper side, verified by me from the frozen §8** (`sources/external/paper/section8-extracted.txt`, a capsule
member) by exact reading and by literal count:

- **(8.1)** is the double-counting identity `(k+1) i_{k+1}(F) = Σ_{J ∈ I(F), |J| = k} e(J)`. Confirmed.
- **(8.2)** is the polynomial `D_T` of Lemma 8.1; **(8.4)/(8.5)** are the two recurrences; **(8.6)/(8.7)** are
  intermediate displays of the proof. Confirmed.
- **(8.3)** is the *normalized expectation* form `𝔼 Σ_{v∈J} d_F(v) ≤ 2k`, stated **only for `0 ≤ k ≤ α(F)`**.
  The run's (DL) is the raw-sum form `D_k ≤ 2k·i_k` for **every** `k : ℕ`. The two agree exactly where `i_k > 0`
  (multiply by `i_k`), and for `k > α(F)` the run's form is trivially true (`i_k = D_k = 0`) while the paper's
  is undefined. The run's statement is therefore a faithful and strictly better-scoped rendering of (8.3), and
  `SEMANTIC-CONTRACT.md` §2's pointer "Lemma 8.1 consequence (8.3)" is accurate.
- **(EX)** carries **no equation number**: it is the unnumbered ratio display inside Proposition 8.2's proof.
  **(8.8)** is Proposition 8.2's first conclusion `i_0 ≤ i_1 ≤ ⋯ ≤ i_{⌈n/4⌉}`; **(8.9)** is its second
  (bipartite tail). Confirmed.
- The frozen §8 contains **"Lemma 8.1"** and **"Proposition 8.2"** and **no occurrence** of "Lemma 6.1" or
  "Proposition 6.2". Confirmed by literal count.
- The last display of Lemma 8.1's proof is
  `Σ_{J ∈ I(F), |J| = k} (2k − Σ_{v∈J} d_F(v) − 2 Σ_i 1{r_i ∈ J}) ≥ 0` — the root-corrected form, over one
  root per component. It sits at the **end of Lemma 8.1's proof**, not "immediately preceding (8.8)"; the
  synthesis's phrase under `## Lean awards` Decision 1 reason 5 is imprecise on locus (it is not in any
  registration text, so it is a note, not a repair to a face).

**Dependency-graph claim, verified from the capsule's own shipped artifact** (`scratchpad/c1-F2-replay/import_graph_report.json`,
a capsule member; read, not executed): `DegreeLemma`'s transitive import closure is exactly
`{Basic, Components, DegreeLemma, Extensions, Recursion}`; `Ends`'s is that set plus `Ends`; both
`excluded_modules_in_*_closure` fields are empty; `file_imports` records `ErdosProblem993/Basic.lean →
["Mathlib"]`. The report's own `files_with_out_of_slice_imports` field lists **three** files and omits
`Basic.lean`, while the same report's `file_imports` field shows `Basic.lean` importing a module not in the
slice — so the critics' correction ("four, not three"; "reaches no excluded **project** module"; "no
minimal-import signal") is confirmed **from F2's own artifact**, independently of any external file. Confirmed.

**Static-scan claim, verified from `scratchpad/c1-F2-replay/static_scan_report.json`** (capsule member;
read, not executed): `total_files_scanned: 9`, tokens scanned `sorry, admit, axiom, native_decide, unsafe,
decide`, `total_hits: 5`, every hit on `decide`, located at `ErdosProblem993/Ends.lean` line 126 and line 127
(three occurrences on that line) and `ErdosProblem993/Recursion.lean` line 301. **No occurrence of `sorry`,
`admit`, `axiom`, `native_decide` or `unsafe` in any of the nine files.** Confirmed.

**Reachability warrant, audited per hit.** The adopted warrant is the import-direction/declaration-order
argument, which does not depend on an instrument. It covers the `Ends.lean` hits: `Ends` imports
`DegreeLemma` (confirmed from the import report), so no `Ends` declaration can be a dependency of
`sum_degOn_le`; and the `Ends` hits are at lines 126–127, after `prefix_ratio` at line 43 (that line number
carried on the record's authority), so declaration order excludes them from `prefix_ratio` too. It does
**not** cover `Recursion.lean:301`: `Recursion` is **inside** both targets' import closures, so import
direction and same-file order say nothing there. That hit's exclusion rests on the citation finding —
`dep_closure_report.json` records the two `decide`-bearing declarations (`card_le_two_mul_alpha`,
`isBipartiteOn_of_isAcyclic`) and lists both target closures' `decide_declarations_in_*_closure` as empty —
together with the adjudicator's "carries no attribute, so no tactic reaches it unless cited". This is a
membership fact, not a count, and it is registrable; the blanket phrase "by declaration order" is not.

**Toolchain.** The **run** side I verified from a capsule member: `control/C1-STAGE1-GATE.md` Ruling 4 pins
Lean 4.32.2 / Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`, and states the external project's 4.29.1 is
never installed and `elan` never runs. The **external** side (`v4.29.1`, Mathlib `5e932f97…`) I could not
check. The difference itself is therefore confirmed on the run side and carried on F2/critic/adjudicator
authority on the external side.

**Counts.** The brief requires the record text to contain no count of any kind. The synthesis's Established
result 26 as drafted carries at least two ("**five** `decide` hits", "used **three** times inside
`vpoly_coeff`"). Repaired below by replacing every cardinality with an exact location list, which is
instrument-independent and strictly more informative.

**The five packet record corrections.**

1. *The (8.8) pointer.* As to `SEMANTIC-CONTRACT.md` §3 — **not sustained**. §3 reads "§8 (Lemma 8.1 with the
   polynomials `D_T`, `E_T` and the recurrences (8.4)–(8.5); Proposition 8.2 with (8.8))", which is an
   accurate description of §8's contents: (8.8) **is** Proposition 8.2's conclusion. §3 does not assign (8.8)
   to (EX), and §2's own characterization of (EX) — "their Proposition 8.2's displayed step" — is exactly
   right. The positive facts (the double count is (8.1); (EX) is unnumbered) I verified and they are worth
   recording, but no correction is owed on `SEMANTIC-CONTRACT.md`. As to `control/C1-ALLOCATION.md` item
   5(b) — **not a capsule member; not checkable by me**; carried on the F adjudicator's authority.
2. *`sources/external/STATIC-SCAN.json`'s undeclared scope.* Not a capsule member; **not checkable by me**.
   Carried on the F adjudicator's authority. Corroborating, from inside the capsule: F2's own scan report
   declares its scope explicitly (`scanned_dir`, `total_files_scanned: 9`, an explicit token list), which is
   exactly the declaration the packet artifact is said to lack.
3. *`SEMANTIC-CONTRACT.md` §4's "tight cases" label.* **Sustained, and independently verified.** §4 offers
   "edgeless forests: `D_k = 0`; single edges" as "(DL) tight cases". My instrument: for edgeless forests on
   `n = 1..6` at `k = 1`, `D_1 = 0` against `2k·i_k = 2n > 0` — not tight; for `K₂` at `k = 1`, `D_1 = 2`
   against `4` — not tight. Over all 40,233 labelled forests to order 7 there are **no** tight cases at any
   `k ≥ 1` with `i_k > 0`, and the `k = 1` slack is exactly `2c` (`2k·i_k − D_k = 2n − 2|E| = 2c`, since
   `|E| = n − c` on a forest), verified with 0 exceptions. The §4 **values** are right; the label is empty.
4. *`SOLUTION-CONTRACT.md` §3.8's malformed refuted key.* **Sustained, and independently verified at the
   registry.** `E993-R25-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` is **absent** from the 370 claims;
   `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` is present and **REFUTED**. The fence holds under either
   spelling because the premise is used nowhere.
5. *`control/C1-ALLOCATION.md` item 1.* Not a capsule member; **not checkable by me**.

### `RE-4` — registry comparison table and alias check

**Alias check, replayed with my own script** (`alias_check.py`) against
`control/CLAIM-IDENTITY.run-local.json` (370 claims, 452 aliases, 132 alias_patterns), for all ten distinct
`E993-R27-*` names that occur anywhere in the capsule:

| test | result |
|---|---|
| exact `claim_key` collision with any candidate | **none** |
| any existing `claim_key` containing `R27` (namespace-wide, name-independent) | **none** |
| candidate name equal (case-insensitive) to any of the 452 `aliases` entries | **none** |
| any of the 132 `alias_patterns` matching any candidate name as a regex | **none** |
| the same two tests against plain-language renderings of the four SR-REC objects | **none** |

**Zero matches, confirmed.** The namespace-wide test is stronger than a per-name sweep: since no registered
`claim_key` contains `R27` at all, no key in the `E993-R27-*` namespace can collide, however many candidates
are coined. Statement-field sweeps for "degree lemma", "extension inequality", "double count", "incident
degree", a linear `4k` order bound, a rank-5 ceiling of 20, and a `4r−4` / `2r−4` restriction return **no**
registered statement asserting any of them; the handful of lexical near-hits (`E993-GRAPH-SR2-EXACT-AVERAGE-IDENTITIES`,
`E993-GRAPH-CLIQUE-PARTITION-NORMALIZED-COMPARISON`, `E993-LC-SPANNING-FOREST-NORMALIZED-COMPARISON`,
`E993-C3-FOREST-WIDE-CROSSING-EDGE-DELTA-NONINCREASE`, `E993-R25-THIN-TREE-TAU-12-BAND-NO-IN-WINDOW-FAILURE-NO-RECOVERY`)
I read at the exact key and none states (DL), (EX), (LB), (R5), (XR), the double count, the `e(J)` bound or
the K1-addition closure at any rank.

**Comparison table, re-read at the exact keys.** Every row of the synthesis's nine-row table verifies:

| Key | Status (my read) | Statement (my read) | Arithmetic (my check) |
|---|---|---|---|
| `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` | VERIFIED | `Δ_k < 0 ⇒ n ≤ (k+1)²`, `k ≥ 1` | `(k+1)² − 4k = (k−1)² ≥ 0`, zero iff `k = 1` |
| `E993-R25-FOREST-ORDER-BOUND-SHARPENED` | VERIFIED | `Δ_k < 0 ⇒ n ≤ k²+k+3`, `k ≥ 2` | `k²−3k+3 > 0` for every `k` |
| `E993-R25-SECOND-ORDER-TWO-SIDED-CEILING` | VERIFIED | `Δ_4 < 0 ⇒ n ≤ 19`; `Δ_5 < 0 ⇒ n ≤ 29` | (LB) gives 16 and 20 |
| `E993-R25-RANK5-CEILING-SHARPENED-TO-25` | VERIFIED | `Δ_5 < 0 ⇒ n ≤ 25` | (R5) gives 20; residue empty |
| `E993-R25-KADDITION-CLOSURE-X-LE-4` | VERIFIED | `x(G ⊔ K₁) ≤ x(G)+1` for `x(G) ≤ 4`, no order bound | — |
| `E993-R25-UNR-FOREST-WIDE` | **OPEN** | `\|V\| ≥ 2r+2`, `x(F) < r` ⇒ `Δ_r(F) ≤ 0` | untouched |
| `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` | REFUTED | paths `P_n` | key confirmed **without** an `R25-` segment |
| `E993-G1WIDE-NO-SIZE-CAP` | OPEN | (G1wide tuple guards) | untouched |
| `E993-FOREST-FIRST-DESCENT-DISJOINT-UNION-UPPER-ADDITIVITY` | REFUTED | `x(F₁ ⊔ F₂) ≤ x(F₁) + x(F₂)` | certificate re-derived, below |

I re-derived that last claim's stored certificate from the definitions: `K_{1,3}` has `i = [1,4,3,1]`, `P₄`
has `i = [1,4,3]`, the disjoint-union convolution gives `i = [1,8,22,25,13,3]` and
`Δ = [7,14,3,−12,−10,−3]`, so `x(K_{1,3}) = x(P₄) = 1` and `x` of the union is `3 > 2`. The refutation is
sound at its own statement.

---

## Findings and repairs

**F-1 (`RE-1`, repair). The order-0 discharge should not depend on an artifact.** The F adjudicator's
evidence line (iv) routes rank 0 through `sources/r25/c4-T4-census/closure_certificate.json`. Two facts make
that unnecessary: the registered `x ≤ 4` closure carries **no order bound in its hypothesis**, so rank 0 is
already inside its statement; and rank 0 is discharged outright in one line (`Δ_0 = n − 1 < 0 ⟺ n = 0`; then
`∅ ⊔ K₁ = K₁`, `x = 1 = 0+1`), which I verified. Repair: state the one-line derivation on the face and cite
the certificate as corroboration, not as warrant. This also removes the face's only dependency on a file no
reader of this capsule can open.

**F-2 (`RE-1`, repair). F3's order-22 replay is not an input and must not be listed as one.** F3's instrument
certifies isomorphism-class **counts** and acyclicity/connectivity and explicitly "does **not** itself
recompute `i_k`/`Δ_k`/the K1-addition sign" (F3 §6). The synthesis's evidence line correctly does not cite
it; the brief's parenthetical "(… / F3's order-22 replay)" would be a defect if it reached a face. Repair:
name the census **content** replays (`C-F3-T` at orders ≤ 19, `C-F3-U` at orders ≤ 20) as the in-run
corroboration and keep the order-22 figure off the evidence line entirely.

**F-3 (`RE-1`, repair). The face must state its relation to a REFUTED registered claim.** `(K1)` is
literally the `F₂ = K₁` instance of `E993-R25`-lineage's REFUTED
`E993-FOREST-FIRST-DESCENT-DISJOINT-UNION-UPPER-ADDITIVITY`. F3 §4, `C-F3-U` finding 9 and the F
adjudication all assert that the `K₁` instance is "carved out by the registry's own **scope field**". It is
not: that claim's stored `scope` reads, in full, "Upper first-descent additivity only; neither a lower-bound
claim nor forest nonunimodality" — there is no `K₁` carve-out in it. The correct warrant is logical and
stronger: a universal statement refuted by one witness pair (here `K_{1,3}`, `P₄`, neither of them `K₁`) says
nothing about any sub-family, and registering a proper sub-family does not regress the general claim, so
fence §3.8 is intact. Repair: strike the "carved out by the registry's scope field" literal wherever it
appears and put the logical relation on the face.

**F-4 (`RE-2`, repair). Scope note 5 embeds a STATED item.** The note as drafted ends "…its scope note's true
maxima 4, 8, 11, 15 are reconfirmed, **with `M(1..3)` now unconditional**." The unconditional sharpening of
`M(1..3)` is adjudicator-derived and is itself listed in the synthesis's own `## Registrations` table B as
STATED and awaiting an isolated second read (a different read from this one). Writing it onto a sealed
claim's face is registration ahead of that read, contrary to `SOLUTION-CONTRACT.md` §4. Repair: strike the
clause from scope note 5 and restore it only after the descent-maxima second read closes.

**F-5 (`RE-2`, repair). Scope notes 2, 3 and 4 are incomplete against the faces they annotate.** Each of
those three r25 claims carries, on its own stored `scope`, a *narrative* about the `x = 5` residue that (R5)
now empties, and the drafted note does not mention it:
`E993-R25-RANK5-TWO-BRANCH-EXACTNESS-ORDERS-22-29` — "Consequence: the x = 5 residue of the K1-addition
target is exactly the forests of order 22-25 with at least three branch vertices";
`E993-R25-SECOND-ORDER-TWO-SIDED-CEILING` — "narrows x = 5 to orders 22-29";
`E993-R25-KADDITION-CLOSURE-X-LE-4` — "Smallest open rank x = 5, residue orders 22-29 (about 1.9e10
classes)". All three residue narratives are emptied by (R5) at `proved_informal`. Repair: add the sentence to
each of the three notes (the corrected texts are given below). Without it the three faces continue to assert
live residues that r27 has shown empty.

**F-6 (`RE-3`, repair). Every count must leave the record text.** Replace the cardinalities with exact
location lists: the `decide` occurrences at `Ends.lean` line 126 and line 127 and at `Recursion.lean` line
301; the deprecated-alias uses at `DegreeLemma.lean` lines 123, 141 and 181 inside `vpoly_coeff`. Locations
are instrument-independent; cardinalities are exactly what four instruments disagreed about.

**F-7 (`RE-3`, repair). The `decide` exclusion warrant is not uniform.** "None reachable from either target
by declaration order" is true of the `Ends.lean` occurrences and false as a warrant for the
`Recursion.lean:301` occurrence, whose module is inside both targets' closures. Repair: give the warrant per
location — import direction and same-file declaration order for the `Ends.lean` occurrences; absence from
both targets' citation closures, and the absence of any attribute that would let a tactic reach it
uncited, for the `Recursion.lean` occurrence.

**F-8 (`RE-3`, repair). Packet correction 1 is over-broad.** `SEMANTIC-CONTRACT.md` §3's parenthetical is
accurate; no correction is owed there. Narrow the correction to `control/C1-ALLOCATION.md` item 5(b) (which I
could not read) and restate it positively as the three verified facts: the double count is (8.1), (EX) carries
no equation number, and (8.8)/(8.9) are Proposition 8.2's two conclusions.

**F-9 (`RE-3`, disclosure that must travel). The record's core is unverifiable inside this capsule.** Nothing
about the four external declarations, the external toolchain values, the `LICENSE` absence or the Lean
docstring numbering was checkable by me under Gate ruling 3. That is not a defect in the record — it is the
consequence of a ruling the run chose — but the record must say on its face which of its findings are
second-read-confirmed and which are single-orientation. Repair: the disclosure sentence is included in the
registration text below.

**F-10 (`RE-4`, repair). One unbacked literal.** The synthesis says the alias check was run "against the
**eleven** candidate key names"; the capsule contains ten distinct `E993-R27-*` names, one of which
(`E993-R27-KADDITION-CLOSURE-X-LE-6`) is a next-cycle target rather than a Cycle 1 candidate. Repair: drop
the count and state the namespace-wide result, which is name-independent and strictly stronger — no
registered `claim_key` contains `R27`, so no candidate in that namespace can collide.

**Nothing found wrong in the mathematics of any of the four objects.** Every derivation I re-did closed, and
every numeric claim I could reach reproduced exactly. All ten repairs are to faces, warrants, grades'
provenance, and counts.

---

## Registration text

Register verbatim. Attribution, grade and fences are on every face.

### `RE-1` — register

```
key:        E993-R27-KADDITION-CLOSURE-X-LE-5
statement:  For every finite forest G with x(G) <= 5:  x(G disjoint-union K1) <= x(G) + 1.
            (x = the first STRICT descent of SEMANTIC-CONTRACT.md section 1; Delta_k = 0 is not a descent.)
grade:      proved_informal-with-census  (SEMANTIC-CONTRACT.md section 2's own term).
            NEVER formally_verified: Gate ruling 6 and fence 3.4. No formal grade on (DL), (LB) or (R5)
            promotes this claim.
evidence (on the face):
  (i)   Reduction identity, in Z, no N-subtraction, no acyclicity:
        i_k(G + K1) = i_k(G) + i_{k-1}(G)  (integer zero extension), hence
        Delta_j(G + K1) = i_{j+1}(G) - i_{j-1}(G) = Delta_j(G) + Delta_{j-1}(G) for every natural j.
  (ii)  Rank 5: (R5) = E993-R27-RANK5-CEILING-20 (proved_informal) gives Delta_5 < 0 => n <= 20, so every
        forest with x(G) = 5 has order at most 20 and lies inside the r25 order-<=21 census population.
  (iii) The census input, named: the r25 order-<=21 in-run forest census (bounded computation, complete on
        a provably covering finite population) checked the K1-addition TARGET itself, not a Delta_k sign,
        with zero violations; x and x(. + K1) are isomorphism invariants, so a class census discharges the
        labelled statement. Re-verified in-run at orders <= 19 (C-F3-T) and at orders <= 20 (C-F3-U), two
        independent r27 instruments, zero violations, first-descent histograms reproduced digit for digit.
  (iv)  Ranks 0-4: the registered E993-R25-KADDITION-CLOSURE-X-LE-4 (VERIFIED, proved_informal), whose
        hypothesis carries no order bound. Rank 0 is additionally discharged outright and without any
        artifact: i_1 = n and i_0 = 1, so Delta_0 = n - 1 < 0 iff n = 0; the empty forest is the only forest
        with x = 0, and the empty forest + K1 = K1, whose first strict descent is 1 = 0 + 1.
        (sources/r25/c4-T4-census/closure_certificate.json's rank-0 entry is corroboration, not warrant.)
attribution: F3 (reconstruction and composition) + C-F3-T + C-F3-U (census-content replays); F adjudicator
            (evidence line); r25 seats/critics for the K1-addition lineage; FRESH-LEAD lane 11 for the
            conditional deduction behind (LB)/(R5); Fang-Lu-Nevo-Yao-Zheng 2026 section 8 for the
            mathematics of (DL) beneath (R5). Isolated second read SR-REC.
relation to a REFUTED claim (must travel): this statement is the F2 = K1 instance of the REFUTED
            E993-FOREST-FIRST-DESCENT-DISJOINT-UNION-UPPER-ADDITIVITY. Registering it does not regress that
            refutation: the general claim is refuted by the witness pair (K_{1,3}, P_4), neither of which is
            K1, and a refuted universal says nothing about a proper sub-family. Fence 3.8 is intact.
fences:     3.1 no status transfer to E993-R25-UNR-FOREST-WIDE (OPEN), E993-G1WIDE-NO-SIZE-CAP (OPEN), NR1,
            FOREST, TREE, TRANSFER, E993-BETA-AGG or Erdos #993; this is not an order bound and not a
            no-recovery statement. 3.2 nothing asymptotic. 3.3 no pointwise degree statement. 3.4 the grade
            is the census's and the census is named above. 3.5 no sealed record is edited. 3.6 no external
            Lean text. 3.7 attribution above.
excluded:   no closure at any rank above 5; no order bound in the hypothesis; the r25 order-22 class-count
            replay is NOT an input to this claim and must not appear on its face.
```

Canonical form: **one** statement, the rank-indexed closure above. The two presentations of its rank-5 half
(the frozen r25 census at orders ≤ 21; the in-run replays at orders ≤ 19 and ≤ 20) are **one** input in two
attestations, registered as clause (iii) of a single face — not as two claims — because they certify the same
finite population by different instruments.

### `RE-2` — register

```
record:     Rank-5 residue closeout (SOLUTION-CONTRACT.md section 1, Tier 3 record row). No E993-R27-* key
            is coined; if the controller coins one it must be alias-checked before use.
statement:  Under (R5) = E993-R27-RANK5-CEILING-20 (n >= 21 => Delta_5 >= 0), every finite forest of order
            22, 23, 24 or 25 has Delta_5 >= 0. Therefore the residue stated on the face of
            E993-R25-RANK5-CEILING-SHARPENED-TO-25 -- forests of order 22-25 with at least three branch
            vertices and Delta_5 < 0 -- is EMPTY. The branch-vertex condition is inert: the emptiness follows
            from the order band alone.
grade:      proved_informal -- exactly (R5)'s grade, and nothing stronger. NOT unconditional, NOT formal,
            and NOT census-dependent: the derivation uses (DL) -> (EX) -> (LB) -> (R5) and no census, no
            branch-vertex analysis and no r25 rank-5 input.
attribution: T3 and F3 (statements); T adjudicator and F adjudicator (narrowed forms at Stage 5);
            Fang-Lu-Nevo-Yao-Zheng 2026 section 8 for the mathematics of (DL). Isolated second read SR-REC.
fences:     3.1 (R5) is an ORDER BOUND whose contrapositive has sign Delta_5 >= 0; neither it nor this
            record is a no-recovery statement, and neither transfers status to E993-R25-UNR-FOREST-WIDE
            (OPEN), NR1, FOREST, TREE, TRANSFER or Erdos #993. 3.5 the sealed r25 claim is NOT edited: its
            statement, its VERIFIED status and its certificate are unchanged; this is a note on its face.
            A proved_informal consequence is never written onto a VERIFIED face without its grade, and the
            grade is carried in the note text itself.
excluded:   the companion Delta_5 < 0 => n <= 18 (C-F3-T, census-dependent, STATED) is a separate item and
            must NOT enter this record or any award statement.
```

Scope notes, as corrected. Notes 1, 6 and 7 stand as drafted; notes 2, 3, 4 and 5 are replaced by the texts
below; note 8 stands as drafted and is a note on a frozen **artifact's phrasing**, not on a registered claim.

```
1. E993-R25-RANK5-CEILING-SHARPENED-TO-25
   "r27 Cycle 1: under (R5) (E993-R27-RANK5-CEILING-20, proved_informal) the stated residue for x = 5 on
   orders 22-25 with >= 3 branch vertices is EMPTY. The claim's own statement and VERIFIED grade are
   unchanged; the residue note is a downstream consequence at proved_informal and does not promote to this
   face."

2. E993-R25-RANK5-TWO-BRANCH-EXACTNESS-ORDERS-22-29
   "r27 Cycle 1: stands as a standalone theorem at its own statement and VERIFIED grade. Its role as an
   INPUT to the K1-addition closure is superseded by the (R5) route, which needs no branch-vertex analysis;
   and the consequence stated on this face -- 'the x = 5 residue of the K1-addition target is exactly the
   forests of order 22-25 with at least three branch vertices' -- is EMPTY under (R5), at proved_informal.
   Neither the theorem nor its grade moves."

3. E993-R25-SECOND-ORDER-TWO-SIDED-CEILING
   "r27 Cycle 1: (LB) gives Delta_4 < 0 => n <= 16 and Delta_5 < 0 => n <= 20 at proved_informal, strictly
   stronger at both ranks. This claim is unchanged; no grade moves. The narrative clause on this face,
   'narrows x = 5 to orders 22-29', is superseded: under (R5) that band is empty, at proved_informal. The
   Delta_4 < 0 => n <= 19 clause remains the load-bearing half of the registered x <= 4 closure."

4. E993-R25-KADDITION-CLOSURE-X-LE-4
   "r27 Cycle 1: extended to x <= 5 by E993-R27-KADDITION-CLOSURE-X-LE-5 at proved_informal-with-census; the
   census input is named on the new claim's face, and no formal grade from (LB)/(R5) promotes either claim.
   The clause on this face, 'Smallest open rank x = 5, residue orders 22-29', is closed: under (R5) every
   forest with x = 5 has order <= 20, at proved_informal. Rank 0 of this claim's own statement is discharged
   directly -- Delta_0 = n - 1 < 0 iff n = 0, and the empty forest + K1 = K1 with x = 1 -- so it needs no
   census artifact; closure_certificate.json's rank-0 entry is corroboration."

5. E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP
   "r27 Cycle 1: 4k <= (k+1)^2 with equality only at k = 1, so (LB) is at least as strong at every k and
   strictly stronger for k != 1, and covers k = 0 which this award's scope excludes. Both stay registered;
   this award's formal grade is untouched and its scope note's true maxima 4, 8, 11, 15 are reconfirmed."
   [The clause "with M(1..3) now unconditional" is REMOVED: that sharpening is adjudicator-derived, is
   STATED in the synthesis's own Registrations table B, and may not be written onto a sealed face before its
   own isolated second read closes.]

6. E993-R25-FOREST-ORDER-BOUND-SHARPENED   -- as drafted.
7. E993-R25-HUNTER-SPANNING-TREE-INEQUALITY -- as drafted.
8. sources/r25/c4-T4-census/search_report_n21.json -- as drafted (a note on the artifact's phrasing, owed,
   not applied; no sealed member is edited).
```

### `RE-3` — register

```
record:     External-source audit record (SOLUTION-CONTRACT.md section 1, Tier 3 record row).
grade:      record. It is documentary provenance about a frozen source text. It is evidence of NO theorem:
            neither the FLNYZ paper nor the external Lean slice may be cited as evidence of any statement of
            this run (Gate rulings 2 and 3).
second-read disclosure (must travel on the face): the isolated second read SR-REC could NOT independently
            verify any claim about the external Lean text, because protocol duty 4 and Gate ruling 3 forbid
            the reader sources/external/lean-source/. Second-read-CONFIRMED below: the paper-side facts, the
            dependency-graph facts, the static-scan facts and the run-side toolchain pin -- all verified
            from the frozen paper text, from F2's own shipped scan and import reports, and from
            control/C1-STAGE1-GATE.md. Carried on F2 / C-F2-T / C-F2-U / F-adjudicator authority and NOT
            second-read-confirmed: everything about the external declarations themselves, their line
            numbers, hypotheses and specializations; the external toolchain and Mathlib values; the LICENSE
            absence; the Lean docstrings' section numbering; and the Mathlib deprecation finding.
content, carried on seat/critic/adjudicator authority (statement fidelity):
  - sum_degOn_le is (DL) at S = univ in the raw-sum form, with acyclicity on the ambient graph and a degree
    bridge requiring [DecidableRel G.Adj];
  - prefix_ratio is (EX)'s prefix form with N-truncated subtraction: equivalent in content, not a literal
    instance of the run's subtraction-free/Z statement below n = 3k;
  - sum_numExtensions is the double count and needs no acyclicity;
  - numExtensions_ge is the subtraction-free e(J) lower bound.
content, second-read-CONFIRMED from the frozen paper (sources/external/paper/section8-extracted.txt):
  - (8.1) is the double-counting identity (k+1) i_{k+1}(F) = sum over independent k-sets of e(J);
  - (8.2) is the polynomial D_T of Lemma 8.1; (8.4) and (8.5) are its two recurrences;
  - (8.3) is the NORMALIZED expectation form E sum_{v in J} d_F(v) <= 2k, stated only for 0 <= k <= alpha(F).
    The run's (DL) is the raw-sum form for every natural k: the two agree wherever i_k > 0, and the run's
    form additionally covers k > alpha(F), where the paper's normalization is undefined. SEMANTIC-CONTRACT
    section 2's pointer "Lemma 8.1 consequence (8.3)" is accurate;
  - (EX) carries NO equation number: it is the unnumbered ratio display inside Proposition 8.2's proof.
    (8.8) and (8.9) are that proposition's two conclusions;
  - the frozen section 8 names "Lemma 8.1" and "Proposition 8.2" and contains no occurrence of "Lemma 6.1"
    or "Proposition 6.2"; published attribution cites the paper's numbering;
  - the last display of Lemma 8.1's proof is the root-corrected form over one root per component.
dependency graph, second-read-CONFIRMED from F2's shipped import report:
  - the transitive import closure of the degree-lemma module is {Basic, Components, DegreeLemma, Extensions,
    Recursion}; of the ends module, that set plus Ends; no excluded project module is reachable from either
    target;
  - Basic.lean, which is inside both closures, imports all of Mathlib, so the slice yields NO minimal-import
    signal; the slice is not "self-contained" and does not reach only project modules.
static scan, second-read-CONFIRMED from F2's shipped scan report (nine frozen files, an explicitly declared
    token list):
  - NO occurrence of sorry, admit, axiom, native_decide or unsafe in any frozen file;
  - decide occurs at Ends.lean line 126 and Ends.lean line 127, and at Recursion.lean line 301;
  - exclusion warrant, per location: the Ends.lean occurrences cannot be reached from either target, because
    Ends imports DegreeLemma (so no Ends declaration is a dependency of the degree-lemma target) and the
    occurrences follow the ends target in the same file by declaration order; the Recursion.lean occurrence
    lies in a module inside both closures, so declaration order does not exclude it -- its exclusion rests on
    its declaration being absent from both targets' citation closures and carrying no attribute by which a
    tactic could reach it uncited.
toolchain: the run is pinned to Lean 4.32.2 / Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c
    (control/C1-STAGE1-GATE.md, Ruling 4), the external project's toolchain is never installed and elan
    never runs. The external project's own (different) Lean and Mathlib pins are carried on F2/critic/
    adjudicator authority.
license:   no LICENSE or COPYING in the frozen audit copy or in the upstream tree (carried on F2/critic/
    adjudicator authority; not second-read-checkable). Gate ruling 3 therefore stands unchanged: the
    external text is read for audit and proof structure only, is never copied into any project, quoted at
    length, or published, and every Lean declaration of this run is authored in-run.
Mathlib API drift (carried, critic-derived, operationally decisive for Stage 7): Polynomial.finset_sum_coeff
    is a deprecated alias under the run's pin; the current name is Polynomial.finsetSum_coeff. Its uses lie
    at DegreeLemma.lean lines 123, 141 and 181, inside vpoly_coeff, on the (DL) path.
NO COUNT IS REGISTRABLE. Every declaration census, citation-closure size and "proof-term closure" figure is
    struck: four instruments returned four answers, and Gate ruling 3 makes a true proof-term closure
    permanently unavailable for this source. Token occurrences are recorded as LOCATIONS, never as
    cardinalities. This record text contains no count.
packet record corrections owed by the controller:
  (a) control/C1-ALLOCATION.md item 5(b)'s (8.8) pointer -- carried on the F adjudicator's authority; not
      checkable by the isolated reader, whose capsule does not contain that file. NO correction is owed on
      SEMANTIC-CONTRACT.md section 3: its parenthetical "Proposition 8.2 with (8.8)" is accurate, since
      (8.8) is that proposition's conclusion, and section 2 already characterizes (EX) correctly as
      "their Proposition 8.2's displayed step". Record instead the three positive facts verified above.
  (b) sources/external/STATIC-SCAN.json's undeclared scope in both dimensions (file set and token set) --
      carried on the F adjudicator's authority; not checkable by the isolated reader.
  (c) SEMANTIC-CONTRACT.md section 4's "(DL) tight cases" label -- SUSTAINED and independently verified:
      the listed values are right and the label has no instances at all on a finite forest at any k >= 1
      with i_k > 0. (DL) is tight only at k = 0 and where i_k = 0; at k = 1 the slack is exactly twice the
      number of components.
  (d) SOLUTION-CONTRACT.md section 3.8's refuted-key spelling -- SUSTAINED and independently verified at the
      registry: E993-R25-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER does not exist;
      E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER exists and is REFUTED. The fence holds either way, since
      that premise is used nowhere.
  (e) control/C1-ALLOCATION.md item 1 -- carried on the F adjudicator's authority; not checkable by the
      isolated reader.
attribution: F2 (the audit); C-F2-T and C-F2-U (the corrections and the drift finding); F adjudicator (the
      restatement); isolated second read SR-REC (the paper-side, dependency-graph, static-scan and run-side
      toolchain confirmations, and the scope of what remains unconfirmed).
```

### `RE-4` — register

```
record:     Registry comparison table and alias-check result (r27 Cycle 1).
alias check, replayed independently by the isolated second read against control/CLAIM-IDENTITY.run-local.json
            (sha256 47697cba1e11d5898000d66c4d3d4502278af59e380ef0e952da3197d13e7fa2; 370 claims, 214
            VERIFIED / 89 REFUTED / 41 OPEN / 26 CONDITIONAL; 452 aliases entries; 132 alias_patterns):
            ZERO exact claim_key collisions, ZERO exact alias matches and ZERO alias_pattern matches, both
            for every E993-R27-* candidate name occurring anywhere in the capsule and for plain-language
            renderings of every statement proposed for registration this cycle. The result is
            name-independent and therefore stronger than a per-name sweep: NO registered claim_key contains
            "R27" at all, so no key in the E993-R27-* namespace can collide, however many are coined. No
            registered statement field asserts a degree lemma, an extension inequality, a double-counting
            identity, an incident-degree bound, a linear 4k order bound, a rank-5 ceiling of 20, or a 4r-4
            descent restriction. Every E993-R27-* candidate is a genuinely new identity.
            [The synthesis's literal "eleven candidate key names" is unbacked by the capsule, which holds ten
            distinct E993-R27-* names, one of them a next-cycle target. Drop the count; the namespace-wide
            result above replaces it.]
comparison (each row read at the exact key, each arithmetic comparison checked):
  E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP  VERIFIED, Delta_k < 0 => n <= (k+1)^2 for k >= 1.
      (k+1)^2 - 4k = (k-1)^2 >= 0, zero iff k = 1: (LB) at least as strong at every k, strictly stronger for
      k != 1, and additionally covers k = 0, which this award's scope excludes.
  E993-R25-FOREST-ORDER-BOUND-SHARPENED      VERIFIED, Delta_k < 0 => n <= k^2+k+3 for k >= 2.
      k^2+k+3 - 4k = k^2-3k+3 > 0 for every k (discriminant -3): (LB) strictly dominates at every k >= 2.
  E993-R25-SECOND-ORDER-TWO-SIDED-CEILING    VERIFIED, Delta_4 < 0 => n <= 19 and Delta_5 < 0 => n <= 29.
      (LB) gives 16 and 20: strictly stronger at both ranks.
  E993-R25-RANK5-CEILING-SHARPENED-TO-25     VERIFIED, Delta_5 < 0 => n <= 25. (R5) gives 20; the residue
      stated on this claim's own scope field is empty (see the rank-5 residue closeout record).
  E993-R25-KADDITION-CLOSURE-X-LE-4          VERIFIED, x <= 4, no order bound in the hypothesis; extended to
      x <= 5 by E993-R27-KADDITION-CLOSURE-X-LE-5.
  E993-R25-UNR-FOREST-WIDE                   OPEN. Untouched; no truth value asserted; no status transferred.
  E993-G1WIDE-NO-SIZE-CAP                    OPEN. Untouched.
  E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER  REFUTED. The key carries NO R25- segment (erratum R27-E-c
      sustained). Premise nowhere.
  E993-FOREST-FIRST-DESCENT-DISJOINT-UNION-UPPER-ADDITIVITY  REFUTED, at its own statement; its stored
      certificate re-derived independently (K_{1,3} and P_4, both with x = 1, union with x = 3). Its stored
      scope field contains NO K1 carve-out; the K1 instance is untouched by the refutation for the logical
      reason that a universal refuted by one witness pair says nothing about a proper sub-family.
grade:      record. Every one of the compared claims STAYS REGISTERED at its own statement; this is a
            comparison, never a supersession, and the formal grade of the (k+1)^2 award is untouched.
attribution: Stage 6 synthesis (the table); isolated second read SR-REC (independent replay of the alias
            check and of every exact-key read and arithmetic comparison above).
```

---

## Verdicts

verdict[RE-1]: confirmed_with_repairs
verdict[RE-2]: confirmed_with_repairs
verdict[RE-3]: confirmed_with_repairs
verdict[RE-4]: confirmed_with_repairs

---

## Artifact inventory

**Deliverable — the only file written outside my scratch:** `second-reads/SR-REC/SECOND-READ.md` (this file).

**Scratch — all under `scratchpad/c1-sr-SR-REC/`; nothing written anywhere else**, nothing under `sources/`,
`control/`, `cycles/`, any seat's, critic's, adjudicator's or synthesis scratch, or any system temporary
directory.

| File | What it is |
|---|---|
| `seal_verify.py` | capsule seal recomputation and 51-member digest/byte verification |
| `alias_check.py` | independent registry alias check: exact keys, namespace-wide, 452 aliases, 132 alias_patterns, plain-language renderings, statement-field sweeps |
| `sr_verify.py` | independent instrument: `SEMANTIC-CONTRACT.md` §4 fixed points; all 40,233 labelled forests on `0 ≤ n ≤ 7`; the reduction identity in both forms at every `j`; `x(G ⊔ K₁) ≤ x(G)+1`; `x = 0 ⟺ n = 0`; (DL), the double count, the per-set `e(J)` bound, (EX), (LB) and the `(k+1)²` award; strictness and the `k = 1` slack `= 2c`; the "tight cases" label test; the arithmetic fences; the rank-0 discharge |
| `sr_report.json` | the instrument's report body (no wall-clock, PID or host field), sha256 of the canonical body `195fa2c818d37280184013050e1ebbbd6ce89f85c3c3e08fa5d20fdfe75398c6` |

**IMPORT LIST** (every script of this second read; Python standard library only): `itertools`, `json`,
`hashlib`, `re`, `sys`, `math.comb`. No network, no `pip`/`brew`/`npm`/`elan`, no third-party package, no
Lean build, no `lake` invocation, no floats, no RNG.

**Background jobs.** **None was started at any point.** Every command ran in the foreground and returned
synchronously, so there was no PID to kill; no kill of any kind, and no process listing of any kind, was
issued. No background job is running at this final write.

**Read boundary, restated.** VerityOS: exactly `verity.md` and `identity/startup-protocol.md`. Run root:
capsule members only, by exact path — the two contracts; the protocol, brief, manifest, path-check record,
Stage 1 Gate and the run-local registry (plus the non-member dispatch wrapper, which carries only the
pointer); the F2, F3 and T3 returns; the four F2/F3 critiques; the F and T
adjudications; the Stage 6 synthesis; the frozen §8 paper text; and F2's three shipped scratch reports
(`import_graph_report.json`, `static_scan_report.json`, `dep_closure_report.json`), read and never executed.
`sources/external/lean-source/` was **not** read, directly or through any script (Gate ruling 3, protocol
duty 4). No `find`, no `grep`/`rg` rooted above a capsule member, no recursive listing, no glob `cat`. No
network, no install, no build. No sealed member was edited.

Reread before close.

chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.
