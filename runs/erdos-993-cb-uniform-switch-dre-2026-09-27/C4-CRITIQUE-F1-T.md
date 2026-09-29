# Critique

Critic `C-F1-T` (orientation T, prove), Cycle 4 Stage 4, r31. Assigned return: seat F1, route `C4-F-01`, mechanism
`FROZEN-STATEMENT-AND-DEFINITION-FIDELITY-SIGNOFF`, orientation F. Date 2026-09-29.

**Boot.** I am operating within VerityOS. This was a restricted boot. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch. I read no other VerityOS file outside the run root.
Dispatch `control/dispatch/c4-stage4/DISPATCH-C-F1-T.md`: `shasum -a 256` =
`b3dbe45c13ca50f3ab5c43d9919dbe445eeb325a24055bff86e59cd3e58d1cd4`, which matches the given value. I wrote no conversation log,
because the dispatch's single-deliverable rule supersedes the repository's logging instruction for this seat.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Capsule seal (reported):** `control/c4-critic-capsules/F1-PACKET-MANIFEST.json`. I recomputed the SHA-256 of the canonical JSON
  (sort_keys, `(",", ":")`, `seal_sha256` removed, no trailing newline) as
  `647ec046ad46f139cb6e4d083914348ec7cf12c5157872e637d0a7850cd2778f`, which matches the dispatch. All 16 members match on SHA-256
  and byte count.
- **Stage 4 dispatch seal:** `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023`, recomputed, matches.
- **Stage 3 seal:** `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e`, recomputed, matches. It lists
  `DISPATCH-F1.md` at `d03f9aaf…a84a` and so backs the return's dispatch literal.
- **Stage 2 seal:** `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`, recomputed, matches.
- **Return:** `cycles/cycle-4/stage3/returns/F1/RETURN.md` is `8ed53ba1…1fcd` (28,248 bytes). It equals the capsule entry and the
  admission record entry.
- **Return inventory:** all six `scratchpad/c4-F1/` artifacts recompute to the digests the return lists.
- **Registry keys the return touches** (`sources/authority/CLAIM-IDENTITY.json`; `keys_check.py`):

  | Key | Status | Grade |
  |---|---|---|
  | criterion key | VERIFIED | `proved_informal` |
  | `…ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` | VERIFIED | `formally_verified` |
  | `…TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` | VERIFIED | `formally_verified` |
  | `…WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-…` | VERIFIED | `formally_verified` |
  | `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | OPEN | — |
  | `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | OPEN | — |
  | `E993-TREE-REAL-ROOTED` | REFUTED | — |

  Every key is present, and every status and grade agrees with how the return uses it. There is no `E993-R31-` key in the frozen
  registry. The return proposes none, so the alias check is vacuous. Its lexical check of the reserved name is replayed below.
- **Admission defect for F1 (`FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`).** The return uses the token three times:
  - line 269 cites the governed award C3-LA1 at its exact scope, which is allowed;
  - line 272 is a negation ("No `formally_verified` label is applied to any scratch…");
  - line 283 is a negation ("never labels its work `formally_verified`").

  **Adjudicated: no label on the seat's own scratch, so nothing is struck.**

## Independent re-derivation

I built my own instruments from SEMANTIC-CONTRACT §1–§2 and the Lean text of the base. F1's scripts were never used as the sole
evidence. All instruments use the standard library and exact integers; artifacts are under `scratchpad/c4-crit-F1-T/`.

**1. Two independent transcriptions of the carried definitions (`defs_fidelity.py`).**

- **Side L** is literal to the Lean entries of `sources/c4-base/LeanProject/LeanProof/Main.lean`:
  - entries 1–3 and 18 (selector);
  - entries 5–6 and 15 (support, leafSet, `tagWitnesses`);
  - entry 16 (`activeWeight` with `B.erase v`);
  - entry 19 (`transportRel` as a pair predicate);
  - entries 9–11 and 22 (counts and `crossingIndex` by subset enumeration);
  - entry 12 (`aggregate`);
  - entries 20–21.
- **Side C** follows the contract's words, by a different method:
  - independence polynomials of `T − D` come from a leaf-to-root tree DP;
  - `w_F(B) = #{v ∈ F∩B : B ∩ (N(s_v)∖{v}) ≠ ∅}`;
  - (D) ∪ (S) images are generated from `B`;
  - `x` is the least `k` with `i_{k+1} < i_k`;
  - `F_p` is the set of leaves with `Δ_p(T−v) = i_{p+1}(T−v) − i_p(T−v) < 0`.
- **Instances.** 108 random trees (`n = 3..11`, seed `20260929`, 347 (tree, p) rows) and the literal layouts CB(1,1), CB(2,1), CB(2,2),
  CB(3,1), CB(3,2), CB(4,1), CB(2,3) and CB(8,1), at every `1 ≤ p < α`. CB(8,1) uses exactly `cbEdge`'s labels.
- **Assertions, all passing:**
  - `x_L = x_C`.
  - `F_L = F_C`.
  - `w_L = w_C` on every set of both layers.
  - The relation matches as arc sets: every generated contract arc satisfies the Lean predicate. The converse was checked on all
    `|I_{p+1}|·|I_p|` pairs up to 4·10⁶ pairs, and on 20,000 random pairs above that.
  - **(WID) from independent sides, before any flow:** supply − capacity = `S_C` = `S_L` on every row. Supply and capacity are
    Lean-side layer sums; `S_C` is the aggregate evaluated with DP counts; `S_L` is entry 12 with enumeration counts.
  - **(HALL), both directions:** the Hall-sum form (brute force over every `X` of positive-weight sources) agrees with an integral
    saturating max-flow (Dinic; rows exactly `w` on `I_{p+1}`, columns ≤ `w` on `I_p`, arcs on (D) ∪ (S)). They agree on every row
    where brute force was feasible, 285 random-tree rows plus the small CB rows. Max-flow alone was used elsewhere.
  - Consistency with FLOW ⇒ SIGN: every row with (HALL) true has `S ≤ 0`. At CB(8,1), `p = 6 = x` (not eligible), `S = 560 > 0`
    and (HALL) fails, as it must.
- **Result:** `ALL_ASSERTIONS_PASSED`. The six carried definitions, `crossingIndex` and the selector denote SEMANTIC-CONTRACT §1's
  objects on every instance tested. This is bounded evidence for the reading; the reading itself is the clause-by-clause derivation
  below.

**2. Clause-by-clause reading (by hand, against the base text; lines 1–420 of the base `Main.lean` read in full).**

- **Weight (entry 16).** It filters `F ∩ B` on `¬Disjoint (B.erase v) (tagWitnesses G v)`, with
  `tagWitnesses G v = (N(support G v)).erase v`. Because `v ∉ W_v` (it is erased), `B.erase v` meets `W_v` if and only if `B` does.
  So the filter is exactly `B ∩ (N(s_v)∖{v}) ≠ ∅`.
- **Relation (entry 19).** `(∃ q ∈ B, A = B.erase q) ∨ (∃ u, u ∉ B ∧ |N(u) ∩ B| = 2 ∧ A = insert u (B \ N(u)))`. This is (D) ∪ (S)
  word for word.
- **Flow (entry 20).**
  - support `0 < f B A →` layer membership ∧ `transportRel`;
  - rows **=** `activeWeight` on every `B ∈ I_{p+1}`;
  - columns **≤** `activeWeight` on every `A ∈ I_p`;
  - ℕ-valued, so integral.

  The direction is supply at `p+1` and capacity at `p`, which is consistent with (WID).
- **(HALL) (entry 21).** For every `X ⊆ I_{p+1}`, `Σ_X w ≤ Σ` over `I_p` filtered by `∃ B ∈ X, transportRel B A`, which is `N(X)`.
- **Selector (entries 1–3, 18).** It uses `i_k(T−v)` as independent `k`-subsets of `univ.erase v`, and the difference is taken at
  index `p`: `i_{p+1}(T−v) − i_p(T−v) < 0`. The selector is derived, with the original supports.
- **`x` (entry 22).** `Nat.find` of `i_{k+1} − i_k < 0` in ℤ, with counts given by `Finset.card`, so zero above `α`.

**F1's reading of all six definitions is confirmed, including its one non-syntactic step (the `B.erase v` versus `B` equivalence).**

**3. The base F1 read versus the base the statements elaborate on (`byte_identity.py` (a)).** F1 read the definitions from C1-LA2's
`Main.lean`, but the frozen N-statements import `sources/c4-base/…/Main.lean`. Entries 1–22 of the two files are byte-identical
(22 of 22). F1 did not establish this, so I close it here.

**4. Fixed points and class-row fidelity (`class_rows.py`).** Tree DP on the literal `cbEdge` labels, before anything is reported:

| Row | n | α | x | p* | p* − x |
|---|---|---|---|---|---|
| CB(8,107) | 1822 | 964 | 570 | 572 | 2 |
| CB(8,158) | 2689 | 1423 | 842 | 844 | 2 |
| CB(8,161) | 2740 | 1450 | 857 | 860 | 3 |
| CB(8,164) | 2791 | 1477 | 873 | 876 | 3 |

- The CB(8,107) row reproduces SEMANTIC-CONTRACT §5.
- Row 161 has `x < p* − 2`, as ruling 27 states.
- At all four rows: `x + 2 ≤ p*`, `3p* < 2α + 1`, and `i_{p*−1} < i_{p*−2}`.
- **Favorability at the index of record,** `Δ_{p*}(T−v) = i_{p*+1}(T−v) − i_{p*}(T−v) < 0`, holds on `v` and on four sampled private
  leaves per row.

These are census facts only. They are never proof and carry no grade.

**5. Statement plumbing (`byte_identity.py` (b)–(d); own parser, not `gen_statements.py`).**

- N2's conclusion, through `:= by`, is byte-identical (920 bytes) to Cycle 3 U2's `E1FlowConstruction.lean` lines 272–287, as the
  docstring claims.
- Each of N7's seven hypotheses equals, after dedent, the conclusion of its N2–N6 source (7 of 7).
- N8's `hbundle` equals N7's conclusion.
- The reserved name `cb8_topRank_eligible_and_weightedHall` occurs 0 times across the frozen `.lean` and `.md` and all five base
  modules.

## Attacks and findings

**A1. F1's open read gap was self-inflicted, and it is now closed for every in-grant quotation (critic-derived advance).**

- F1 went out of grant (two `cycles/` listings) to find `cycles/cycle-3/stage6/SYNTHESIS.md` and
  `…/stage5/adjudicators/U/ADJUDICATION.md`. It then left the N2, N3-definition, N7 and N8 quotations unverified.
- Both files are sealed Stage 2 members inside its grant: `sources/c3-results/cycles/cycle-3/stage6/SYNTHESIS.md` (`ca5d99c6…`) and
  `…/stage5/adjudicators/U/ADJUDICATION.md` (`11a6a850…`). The registry `sources/c3-results/SOURCE-DIGESTS.json` records their
  origins as exactly the `cycles/` paths the companion cites.
- `quote_check.py` parses every "`path` line(s) … :" citation in `control/C4-FROZEN-STATEMENTS.md` (38 in all) and compares each
  blockquote with the sealed copy after checking its digest:
  - SYNTHESIS: 13 citations, all EXACT;
  - U ADJUDICATION: lines 337–338 and 342 EXACT, line 341 excerpt found verbatim;
  - SR-C3-2: all EXACT, including lines 80–82, which F1 did not list; the five line-209 excerpts found verbatim;
  - SR-C3-3: all EXACT.
- Total: **31 of 31 in-grant quotations match (25 exact, 6 verbatim excerpts); 0 paraphrase drift.**
- The remaining 7 citations are to `control/CHECKPOINT-ANALYSIS-C3.md` (lines 186 ×3, 187, 192, 193, 218–221). That file is outside
  this critic's grant. F1 had it and says it read it in full, but files its N7/N8 citations under "accepted on the drafter's
  transcription". Neither F1 nor I have verified these 7 word for word. They are carried to the remaining obligation.

**A2. Two stale or false claims about gate rulings (strike).** F1 read `control/C4-STAGE1-GATE.md` but reports two drafter open
questions as unresolved, although the gate ruled on both:

- **(a) Open question 2.** F1 says C3-LA1's content "is not yet in the U3-derived base per open question 2 — a documented gap". This
  is false.
  - Rulings 24(2) and 25 put C3-LA1 in the base.
  - `c3la1_check.py` confirms it: all 33 entries of `sources/c4-base/…/C3LA1.lean` are byte-identical (number, header, body) to the
    award's `Main.lean`, and the award's other 20 entries are byte-identical to entry bodies of the base `Main.lean`. That covers all
    53 of 53, including the terminal (entry 53).
  - F1's phrase "the base copy at `…/C3LA1.lean`'s parent (the 20 non-`Main.lean` entries…)" also inverts the split: 33 entries sit in
    `C3LA1.lean` and 20 in `Main.lean`.
- **(b) Remaining obligation 3.** F1 says open question 4 is "unresolved by the gate … the gate should rule on it". Ruling 24(4)
  already ruled: N2 keeps U2's text byte-exact, and `m − q` and `p* − q` are safe through the frozen companion `cbOpenChokeCount_le`,
  which every proof of N2 cites.
- Neither error touches a mathematical conclusion. Both are struck from the record as stated.

**A3. The R-11 scan is weaker than reported, and one count is wrong. The conclusion stands (narrowed and strengthened).**

- **Membership only.** F1's scan checks only that a literal belongs to a 2,875-digest set, not that it is the digest of the file
  its line names. On a line containing `scratchpad/c4-gate-statements/` or "Copied bytes SHA-256", it skips unmatched literals by
  marker.
- **Wrong count.** F1 reports "36 literals total; 11 … MATCH …; 23 …", which accounts for only 34. The replayed output shows 34
  literals in the companion (11 matched, 23 unmatched) plus 2 in the gate (both matched). The matched figure is **13**, not 11.
- **My stronger check** (`literal_binding.py`, `partial_digests.py`):
  - Every registered literal is carried by a registered path whose basename is named on its line, except parser noise on multi-name
    lines, checked by hand. The gate's two literals recompute live: `0fc723d7…` for `C4-FROZEN-STATEMENTS.lean` and `Statements.lean`,
    and `6aa6dfe5…` for the `.md`.
  - Three of F1's 23 "never registered" literals are in fact recomputable from sealed sources, and they MATCH:
    - `c8f56fa8…` is the E1 copied bytes before the rekey: lines 21–229, one blank line, line 326 of `sources/c3-scratch-lean/c3-U2/…/E1FlowConstruction.lean`;
    - `13aca55c…` is the same bytes after the whole-word rekey `cb8G → cb8E1G` (2 occurrences), and they are contained verbatim in
      the base file;
    - `d1fc50df…` is ChokeState Part B, lines 2673–2734 of `sources/c2-stage7-sources/U2/…/Main.lean`, contained verbatim in the
      base file.
  - The other 20 are the drafter's own scratch files under `scratchpad/c4-gate-statements/`, outside every critic's grant. They are
    unverifiable here, and none bears on a frozen member.
  - `8a4ab1c6…`, the drafter's `LeanProof.lean`, legitimately differs from the base root `61099148…`, because ruling 25 added
    `C3LA1` to the imports.
- **Result: 16 of 16 checkable literals bound correctly; 0 defects.**

**A4. Item 8 (the row-`≥` / row-`=` reconciliation) conflates two steps. The mathematics is right once separated
(critic-derived advance: informal proofs).**

F1 presents its source-class case split as what reconciles N7's rows-`≥` bundle with `IsSaturatingFlow`'s rows-`=`. The split does
not do that. It proves N7's row clause, and N8 does the reconciliation.

- **(i) N7 clauses (1)–(3) from N7's own hypotheses.** Here `g = cb8E1Arc + cb8GSec` and `F = favorableLeaves (cbGraph m) p*`.
  - **Clause (1).** `0 ≤ g` by hE1(1) and hSec(1).
  - **Clause (2).** If `¬transportRel B A`, then `cb8E1Arc B A = 0`, because by hE1(2) a nonzero value forces `A = B.erase x` with
    `x ∈ B`, which is the (D) disjunct. Also `cb8GSec B A = 0` by hSec(2).
  - **Clause (3), rows, for `B ∈ I_{p*+1}`:**
    - If `r ∉ B`: the row is at least the E1 row, which equals `w_F(B)` by hE1(3), since `cb8GSec ≥ 0`.
    - If `r ∈ B`: `B` is independent and every `u_i ~ r` (C1-LA2 adjacency), so no `u_i ∈ B`. By hW, `w_leafSet(B) = [v ∈ B]`, and
      `F = leafSet` by C2-LA3.
    - If `r, v ∈ B`: `w = 1 ≤` the `g_sec` row by hOut, and the E1 part is nonnegative.
    - If `r ∈ B, v ∉ B`: `w = 0` and the row is at least 0.

  The case split is exhaustive. It uses no Newton or Darroch and no class arithmetic beyond C2-LA3, and it carries no ℕ subtraction.
  Only clause (4), the columns, carries the substance. That is U2's open work and is not attempted here.
- **(ii) N8 in its Hall form.** For `X ⊆ I_{p*+1}`:
  - `Σ_X w ≤ Σ_{B∈X} Σ_{A∈I_{p*}} g(B,A)`, by rows ≥ w;
  - `= Σ_{A∈I_{p*}} Σ_{B∈X} g(B,A)`;
  - `≤ Σ_{A∈N(X)} Σ_{B∈I_{p*+1}} g(B,A)`, because `g ≥ 0` and `g(B,A) > 0` implies `transportRel B A`, so `A ∈ N(X)`;
  - `≤ Σ_{A∈N(X)} w(A)`, by columns ≤ w.

  That is `WeightedHall`. r30's `exists_saturatingFlow_of_weightedHall` (entries 30–31, `formally_verified` at its scope) then
  supplies the integral flow with rows exactly `w`. That is where row-`≥` becomes row-`=`.
- The bundle ⇒ `WeightedHall` step needs no source-class case split, so F1's remaining obligation 2(b) ("a reviewer should confirm
  that composition does not silently assume it") is answered: it does not. My max-flow instrument confirms Hall ⇔ saturating flow on
  every small instance tested. That is bounded, and it is not the proof; the proof is the formal r30 carry.
- **Grade:** N7 clauses (1)–(3) and N8 are `proved_informal` as stated here: stated at Stage 4, never registered, and in need of an
  isolated second read. The same holds for the one-line lemma behind F1's remaining obligation 2(a):
  `activeWeight G F B = ((F ∩ B).filter fun v => ¬Disjoint B (tagWitnesses G v)).card`, since `v ∉ tagWitnesses G v` (it is
  erased), so erasing `v` from `B` does not change disjointness from it. It is not compiled: this seat builds no Lean.

**A5. C3-LA1 closure: confirmed, with one overclaim narrowed.**

- **Confirmed from the award's own records (`c3la1_check.py`):**
  - `Main.lean` is `1388fa52…` and equals the receipt's `source_sha256_before` and `_after`;
  - the receipt verdict is `verified`, and all 11 checks show `passed`;
  - `allowed_axioms` is {propext, Classical.choice, Quot.sound};
  - `EVIDENCE/axioms.txt` recomputes to the receipt's `axioms_log_sha256` `50bec36e…` and reads
    `[propext, Classical.choice, Quot.sound]`;
  - `VERIFICATION-REPORT.md` is `b3f358ab…`;
  - the 53 entries sit byte-identically in the base (A2).
- **Narrowed.** F1's "matches … from a second, independent rebuild (the base project)" cites the controller's
  `sources/c4-base/axioms-base.log`. F1 ran no build, so this is a cited controller log, not an independent rebuild by the seat.
  The phrase is struck and replaced by "the controller's base axiom log records the same three axioms".

**A6. The other frozen-text audits hold under my reading.**

- The ℕ subtraction guards F1 lists are as stated:
  - `8q − 1` is guarded on the face;
  - `m − q` and `p* − q` are covered by the frozen companion, per ruling 24(4);
  - N5's `8 − γ` is in ℚ;
  - N7's companion `(16m+1)/3 − 1` is safe, since `K ≥ 571`.
- The N1 counts are consistent with the contract's `a = 8q − 1`, `b = 8(m−q)+1`:
  - `w ≤ 8q`;
  - `ℓ + 8q ≤ 8m + 1`;
  - Boolean up-covers `+ w = 8q`;
  - ternary `+ 2ℓ' + 16q = 16m + 2`, which is `2(b − ℓ')` rearranged.
- **Minor points.**
  - F1's acyclicity script proves only a triviality, since both (D) and (S) lower `|B|` by exactly 1. It reports nothing about the
    "connectivity" in its name. It is not load-bearing.
  - F1's "SEMANTIC-CONTRACT §1 … states five objects" does not match its own audit of seven.

## Mechanism-equivalence and fence check

- **Fence 1:** there is no rank other than `p*`, no class other than `m ≥ 107`, `m ≡ 2 (mod 3)`, and no status transfer to an
  aggregate. Both OPEN keys stay OPEN, in the return and here. My small-instance rows (CB(d,m) at many `p`) are definitional tests of
  generic objects. They make no claim about any rank or tree.
- **Fence 2:** fidelity is asserted before any flow. In my instrument, (WID) is asserted from independent sides on every row before
  (HALL) is evaluated. The selector is derived, and `x` runs through `α`.
- **Fence 3:** no Newton or Darroch appears anywhere, in the return or here.
- **Fence 4:** no template is treated as the network.
- **Fence 5:** no asymptotics.
- **Fence 6:** no refuted mechanism is revived. `E993-TREE-REAL-ROOTED` stays REFUTED.
- **Fence 7:** census values (A4, row table) are not used as proof.
- **The return's mechanism** (a definitional and textual fidelity signoff) is not any refuted mechanism, and N8 is not an alias of
  the reserved terminal. Its hypothesis is a property of one named function. I confirmed the name count is 0 and the byte identity of
  N8's hypothesis with N7's conclusion.

## Certification audit

| Literal / claim in the return | Backing | Ruling |
|---|---|---|
| dispatch `d03f9aaf…` MATCH | Stage 3 manifest entry | stands |
| Stage 2 seal `226555ee…` | recomputed (mine and replay) | stands |
| SR-C3-2 `44a37189…`, SR-C3-3 `ee382bd5…` | registry and recompute | stands |
| SR-C3-2/SR-C3-3 quotes "exact match" | `quote_check.py` | stands, and extended to 31 of 31 in-grant quotes |
| C1-LA2 `Main.lean` `a906ec17…` | replay | stands (the base is identical on entries 1–22, A3 above) |
| C3-LA1 `1388fa52…`, report `b3f358ab…`, 11/11 passed, axioms | receipt, evidence, recompute | stands |
| "C3-LA1 … not yet in the U3-derived base per open question 2"; "the 20 non-`Main.lean` entries" | contradicted by ruling 25 and `c3la1_check.py` | **struck** |
| "from a second, independent rebuild" | controller log only | **struck**, narrowed as in A5 |
| "open question 4 … unresolved by the gate" | contradicted by ruling 24(4) | **struck** |
| "36 literals total; 11 … MATCH" | replay: 13 matched | **struck**; corrected to 13 matched, 23 unmatched, of which 3 recompute-match |
| `R11_TOTAL_DEFECTS: 0` | replay and stronger path-bound check | stands (16 of 16 checkable) |
| reserved name 0 occurrences | replay and my count over 7 files | stands |
| "2,875 registered digests"; "30 universes, 1,921 arcs" | replay byte-identical | stands |
| six artifact digests; replay outputs byte-identical | recomputed; my own copy-out replay byte-identical | stands |
| `formally_verified` tokens (admission defect) | citation or negation only | stands, nothing struck |
| "no ℕ subtraction … silently unguarded" | my reading (A6) | stands |

- **Gate ruling 29:** the return makes no numeric claim at a class row, so there is nothing to reject.
- **The return's own `## Remaining obligation`:**
  - item 1 is now discharged except for the 7 checkpoint quotations;
  - item 2(a) and item 2(b) are answered informally (A4);
  - item 3 is struck (A2(b));
  - items 4 and 5 stand.

## Verdict

verdict: retained_narrowed
headline_resolved: no

The return's substance stands under independent re-derivation:
- the six carried definitions, `crossingIndex` and the selector read exactly as SEMANTIC-CONTRACT §1;
- N1–N8 quote their sources faithfully (31 of 31 in-grant quotations);
- C3-LA1 is closed and wholly present in the base;
- the reserved name occurs 0 times;
- there are 0 digest-literal defects.

It is narrowed by striking:
- two stale claims about gate rulings 24(2)/25 and 24(4);
- one miscount;
- one "independent rebuild" overclaim.

These strikes do not reach any mathematical conclusion. The headline is unresolved: no formal Tier 1 and no cut. N7 clauses (1)–(3)
and N8 (A4) are, in my judgment, mathematically complete at `proved_informal` given their hypotheses and the formal r30 carry. That
still needs an isolated second read. The substantive open node is N7 clause (4) together with N2–N5.

COND4_formal: unchanged
E1_formal: unchanged
TERMINAL_integration: not attempted
cut_candidate: none
FROZEN_NODES_CLOSED: none

## Remaining obligation

1. **The 7 checkpoint quotations.** Word-for-word verification of the quotations the companion takes from
   `control/CHECKPOINT-ANALYSIS-C3.md` (line 186 for N1 ×3, 187 for N2, 192 and 218–221 for N7, 193 for N8), against that sealed file.
   A seat or the controller with that file in grant can run `scratchpad/c4-crit-F1-T/quote_check.py` after adding a path mapping for
   it. It reports these rows as `OUT_OF_GRANT_OR_UNREGISTERED`.
2. **An isolated second read** of the A4 informal proofs: N7 clauses (1)–(3) from N7's hypotheses; N8 through bundle ⇒ `WeightedHall`
   ⇒ r30 entries 30–31; and the `activeWeight` erase lemma. Only after that can they be cited as more than stated.
3. **N7 clause (4)** (columns ≤ `w` on every target class) remains the substantive open composition step. It is U2's, and neither F1
   nor this critique attempts it.
4. **Record correction.** The controller should read the return's statements on C3-LA1's base presence and on open question 4 as
   struck (A2).

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-F1-T/`.
Python standard library only, run with `python3 -B`.

| Path | SHA-256 | Role |
|---|---|---|
| `quote_check.py` | `37676768c7a46c422476c34f3d4be64dbd19eeb835e1090b08507925989886f9` | quotation verifier (A1) |
| `quote_check.out.txt` | `deaa7235522614d04fa59c3f356e91ac1d6b99218cfa58ae46ec0239e1c75e38` | 25 exact, 6 excerpt, 7 out of grant |
| `literal_binding.py` | `71fb916d4c7a0ec25389632c0f950963062853ed0557f9b884c2147551b499bf` | path-bound literal check (A3) |
| `literal_binding.out.txt` | `0f58a9977fba605c7cba3b8a08a9035d68ecdd7dac972e3638f6dee9f61ae27c` | its output |
| `partial_digests.py` | `120efbab6f3d5a8e9284363de716db3d0414c3c256eaa1e0c5a53f0192fbe605` | copied-bytes digests recomputed (A3) |
| `partial_digests.out.txt` | `ff10262620c3584270a4f8766b92513dcc2d8b87850494706bb69f59bef61ae5` | 3 of 3 match |
| `defs_fidelity.py` | `d1221b5aabb3c098047ac9452e87a8b8678c86c1ac9c97bac10e62cace902b88` | two transcriptions, (WID), (HALL) ⇔ flow |
| `defs_fidelity.out.txt` | `47222ba0863dc17325b2036b2ad3d3dbabac98013896b718c4a219061d09f3b7` | `ALL_ASSERTIONS_PASSED` |
| `class_rows.py` | `7ec6529aaa3e7207ae44bcbb8540139e1fdcceecc90b02c635bcbc23f538d5f7` | fixed points and class rows (DP) |
| `class_rows.out.txt` | `eb8f792c51ece831b4402c79916aee93bf8bcdcefe10e22e14cc714c4997af94` | rows 107/158/161/164 |
| `byte_identity.py` | `a4be269690ecf9831d433bc07ee9deb67c1127325d9d4126373159214d3478f7` | entries 1–22, N2 text, N7/N8 plumbing, reserved name |
| `byte_identity.out.txt` | `80fb23f0df7532ed3159912f76877b0ecf28994a7e251d950081db8eb2ec832e` | all True; count 0 |
| `c3la1_check.py` | `d20493bf14397d88b73335ec120f36027c9f7537b6595b20e5164b756baba395` | C3-LA1 receipt, evidence, base placement |
| `c3la1_check.out.txt` | `ec9470ea1f94020c5468cf1c44e95c04d6537c770f7aba1ee5f1876ea3cdea65` | 33 + 20 of 53 |
| `keys_check.py` | `9b60303d545aacc38bdeaa70399c716eb1876905b2f9777930ee8b6946f6e1aa` | registry key lookup |
| `keys_check.out.txt` | `5b59147c6b8ec6a06f6db9c31e822fa46c9a90a8121a5e0f84bcc2b822a2b26c` | 7 of 7 present |
| `replay/*.py` | byte-identical to `scratchpad/c4-F1/` (`bcc9a73a…`, `343e4afb…`, `0050219f…`) | copy-out-first replay copies |
| `replay/*.critic-replay.out.txt` | `84fe8f10…`, `bfbacf86…`, `9c783041…` | byte-identical to F1's outputs |

**Read boundary and process disclosures.**

1. **Harness-injected context.** The harness put the project `CLAUDE.md`, the user auto-memory index and the user's e-mail into
   context before my first tool call. I did not open, cite or use them.
2. **Reads.** I read only the capsule members, plus the files the protocol names as readable:
   - `control/C4-FROZEN-STATEMENTS.lean` and `.md`;
   - `sources/c4-base/`;
   - under `sources/`: C1-LA2 `Main.lean` entries; `c3-scratch-lean/c3-U2/…/E1FlowConstruction.lean`; `c2-stage7-sources/U2/…/Main.lean`;
     the C3-LA1 award directory; `c3-results` SYNTHESIS, U ADJUDICATION, SR-C3-2 and SR-C3-3; `authority/CLAIM-IDENTITY.json`;
     the `SOURCE-DIGESTS.json` registries;
   - F1's inventoried scratch.

   Every `grep` was non-recursive, on named files inside the grant. The `ls` listings were of `sources/`, `sources/c3-results/`,
   `sources/authority/`, the C3-LA1 award directory and its `EVIDENCE/`, and `scratchpad/c4-F1/` and `scratchpad/c4-F1-replay/`.
   The `find` ran only on my own scratch directory.
3. **One boundary-touching replay.** The authorized copy-out-first replay of F1's `verify_seals_and_digests.py` hashed the bytes of
   four files outside my read list: `control/CHECKPOINT-ANALYSIS-C3.md`, `cycles/cycle-4/stage2/ROUTE-STATE.md`, `OBLIGATIONS.csv` and
   `control/CLAIM-IDENTITY.run-local.json`. It printed only their digests; no content was displayed or used. It also hashed
   `control/C4-WORKER-COMMON-BRIEF.md`, which is readable under the common brief.
4. **Not read.** The Stage 3 read-boundary disclosures record is not in my capsule and was not read.
5. **Tools.** No `lake`/`lean`, no network, no installs, no child agents. No background job was started, so there was nothing to
   kill. All writes are under `scratchpad/c4-crit-F1-T/` and this file.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
