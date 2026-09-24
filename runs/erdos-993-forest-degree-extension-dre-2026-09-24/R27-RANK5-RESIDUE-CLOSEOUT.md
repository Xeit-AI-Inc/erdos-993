# r27 record — rank-5 residue closeout (2026-09-24)

Controller: Claude Fable 5.1. Text of record as confirmed by the isolated second read SR-REC (verdict RE-2 confirmed_with_repairs), registered verbatim below; the eight scope notes are applied to the run-local registry by `control/register_c1_close.py` (notes 1–7 on registered claims; note 8 on the frozen artifact's phrasing — a note owed, not applied, since sealed members are never edited). At the close of Stage 7, (R5) = `E993-R27-RANK5-CEILING-20` carries the grade of award C1-LA4 (see `control/C1-STAGE7-AGENTS.json`); the record text below was confirmed while (R5) was `proved_informal` and the grade word on the scope notes follows the registry entry.

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

