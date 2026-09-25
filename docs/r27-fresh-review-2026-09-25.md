# Fresh review of r27: relevance to the interior aggregate

25 September 2026. One fresh GPT-6 Sol high reviewer inspected the four r27 source packages, contracts, informal audits, fidelity records and verification receipts against 67 pinned source files. The controller replayed the diagnostic witness and checked the proposed equality correction. This was a review, with **no Lean rebuild and no new formal award**.

The four package faces match their source and reported verification records. The distinction between the fixed-root internal Lean lemma, the informal every-rooting/optimized-root claim, the conditional implication package and the unconditional descent bounds is preserved.

The optimized root correction is useful information, but does not supply the missing interior proof. For a leaf deletion with residual forest `H`, root set `W` and marked count `q_k=i_k(H)-i_k(H-W)`,

\[
q_k\le\sum_{w\in W}c_w(k)\le M_k(H),\qquad
D_k+2M_k\le2k i_k.
\]

Here the middle expression counts root incidences with multiplicity; `q_k` counts each root-meeting set once. Neither inequality controls the increase of the marked counts at the next rank. The extension inequality also points in the wrong direction for that purpose: it lower-bounds a total next coefficient.

An exact six-vertex example makes the gap concrete. Take edges `01,12,23,14,45` and original leaf `v=0`, with support `s=1`. Then `H=2K2` and `W={2,4}`. The optimized root inequality is tight at ranks 1 and 2, yet `q_1=2` and `q_2=3`. Restricting the root inequality to marked sets is actually false. The example has `alpha=3`, `x=2`; it is **outside aggregate eligibility** and does not refute the verified first-interior theorem or the eligible all-rank target.

The next useful obligation is a selector-preserving upper bound or a compensating deficit budget across original leaf/support tags, particularly below the existing high-tail guard. The root correction can be an input to such an argument; it cannot replace it. Code's completed r28 also rules out universal Hall/SDR slot dominance as a repair. Its restricted branch-tree theorem remains available at its exact scope.

The review caught an endpoint error in an informal equality sentence, and the controller found an unexpanded certificate template. Both are corrected in the living records with unchanged mathematical statuses; see [ERRATUM.md](../runs/erdos-993-followups-2026-09-25/ERRATUM.md). The detailed [review](../runs/erdos-993-followups-2026-09-25/review/REVIEW.md), [findings](../runs/erdos-993-followups-2026-09-25/review/FINDINGS.json), [endpoint check](../runs/erdos-993-followups-2026-09-25/review/EQUALITY-CORRECTION-CHECK.md), and admitted diagnostic script retain their exact bytes.
