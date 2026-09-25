# Controller review — r28 (the Hall/SDR route to the forest degree lemma), 2026-09-25

Claude Fable 5.1, DRE controller. Written at the Cycle 1 close, before publication.

## 1. Verdict

The charter's question is answered, negatively and completely. The leaf/slot dominance condition (HS) — the
Hall/SDR sufficient condition an r27 critic proposed for a second, structural proof of the degree lemma — is false,
with a minimal counterexample of order 22 that two isolated critics found independently, every adjudicator and the
controller reproduced, and an isolated second read confirmed by three methods while enumerating every tree of order
22. Stop-gate (b) fired in Cycle 1. The degree lemma (DL) is untouched: it holds on the counterexample, as it must,
since (HS) ⇒ (DL) is now kernel-checked. What the run found on the way is the exact boundary of the condition: it
holds on every tree whose branch tree is a path (Theorem BTP), and fails as soon as a branch vertex touches three
other branch vertices — sharp for every branch-degree bound. All four Stage 7 groups closed `formally_verified` in one pass each: the reduction (HS) ⇒ (DL) with the r27
reformulation formalized, the corrected forest composition with the SDR/threshold equivalence, the pendant-path
lemma, and Theorem BTP composed into a second formal proof of the degree lemma on the path-like class.

Nothing transfers: no statement here is a no-recovery statement; `E993-R25-UNR-FOREST-WIDE`, NR1, FOREST, TREE,
TRANSFER, the aggregate at any rank and Erdős #993 are untouched.

## 2. What was learned that the charter did not already say

- **The condition fails for a structural reason, not a numerical accident.** On `T22` the root's occupancy `c_root(k)`
  is the strict maximum over all 22 vertices at both failing `k`; no leaf can serve its slot under any pairwise
  comparison. So every matching-type strengthening of (DL) that compares vertices pairwise is dead on this tree;
  a surviving strengthening must relax the comparison itself.
- **The pendant-path lemma is true and general.** A leaf dominates every vertex of its own pendant path on any finite
  graph — six independent proofs, one mechanism (cut the path, induced-subgraph monotonicity). Three routes had
  named this as the missing step and none proved it; four critics proved it within hours.
- **Theorem BTP and the surplus identity** locate (HS) exactly: the own-leaves assignment works iff no branch vertex
  has three branch-tree neighbours (`|own(v)| − (deg v − 2) = 2 − b(v)`), which is the whole truth of (HS).
- **Two contract defects were caught by critics, not by the controller**: the forest-composition hypothesis must
  hold at every `a ≤ k` (`K_4 ⊔ K_4` at `k = 2`), and the graph-general reduction needs `t ≥ 1` (`K_4 − e` at
  `k = 2`). Both are errata on the sealed contract and both are correct in the Stage 7 statements.
- **The r27 (PW) witness was mislabelled**: the order-5 example compares two leaves; the branch-vs-leaf pointwise
  form first fails at order 9.

## 3. Seating, in one paragraph

The refutation came from the two critics of the falsification-census route, independently, by growing F1's tight
instances — the brief had pointed every F critic at exactly that attack. The lemma every T route left open fell to
four T-seat critics and two F-seat critics. The U routes and their critics produced every compiled fragment Stage 7
carried, including two contract corrections. Sonnet routes delivered census machinery, compiled cores and a very
useful map of what was false locally; Opus critics carried the mathematics; the isolated second reads did the run's
most decisive computation (the order-22 enumeration). Same pattern as r25–r27.

## 4. Process: what worked and what I got wrong

Worked: the residue check before the first seal (caught one true residue; critics still caught a second inside a
Python f-string, now added to the token list); running all three second reads concurrently with Stages 5–7, so the
synthesis inherited only confirmed items; dispatching the refutation's second read the moment two critics agreed;
pointing adjudicators at the counterexample as a replay, not evidence — all three reproduced it on their own
instruments; resuming interrupted seats instead of re-spawning them.

Got wrong or should improve: two contract statements were defective (R28-E-a, R28-E-c) — the Lean targets should
be test-compiled against a small non-tree before sealing; the (PW) witness was inherited uncritically from r27
(R28-E-b); two template residues survived the residue check (R28-E-d, R28-E-f); the controller facts record said
"one instrument at order 21" when two had it. The incident R28-I-1 (an adjudicator's `lake env lean` outside the
project pulling a toolchain through `elan`) shows the rule "never `elan`" is not enough — the rule must be "never
invoke `lake`/`lean` outside the pinned project directory", now in every Stage 7 brief and proposed for the skill.

## 5. Publication and decisions for Ashton

Publication follows the r24–r27 pattern under the standing scoped authorization; executed at this close and
reported. Decisions: (a) remove the stray Lean v4.34.1 toolchain or leave it (inert); (b) whether the surviving
question — a matching-type strengthening of (DL) on all trees — deserves a run of its own (my view: not now; the
evidence says any such strengthening must abandon pairwise comparison, and the natural next object is the prefix
forms `P_1`/`P_2`, which merit a census first); (c) the second-read backlog listed in the cycle close is successor
inheritance, not r28 debt.
