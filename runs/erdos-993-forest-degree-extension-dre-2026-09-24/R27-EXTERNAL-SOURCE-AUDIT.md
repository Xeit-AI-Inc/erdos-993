# r27 record — external-source audit (2026-09-24)

Controller: Claude Fable 5.1. Text of record as confirmed by the isolated second read SR-REC (verdict RE-3 confirmed_with_repairs). It is documentary provenance about a frozen source text (`sources/external/`) and evidence of NO theorem (Gate rulings 2 and 3). The external Lean audit copy carries no LICENSE: it was read for audit and proof structure only, never copied into any project or published; every Lean declaration of this run is authored in-run. Packet record corrections (a)–(e) are acknowledged by the controller here: (a) `control/C1-ALLOCATION.md` item 5(b)'s (8.8) pointer — the double count is (8.1), (EX) is the unnumbered display in Proposition 8.2's proof, (8.8) is that proposition's conclusion; `SEMANTIC-CONTRACT.md` §3 needs no correction; (b) `sources/external/STATIC-SCAN.json` has undeclared scope in file set and token set — F2's shipped scan report (declared token list, nine files) is the scan of record; (c) SEMANTIC-CONTRACT §4's '(DL) tight cases' label has no instances (R27-E-b, now `E993-R27-FOREST-DEGREE-LEMMA-EQUALITY-CLASSIFICATION`); (d) SOLUTION-CONTRACT §3.8's key spelling (R27-E-c); (e) `control/C1-ALLOCATION.md` item 1 printed the (D-REC)/(E-REC) final forms verbatim to T1 — provenance travels on `E993-R27-TWO-POTENTIAL-EDGE-SPLIT-RECURRENCES-ROOTED`. Sealed members are not edited.

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

