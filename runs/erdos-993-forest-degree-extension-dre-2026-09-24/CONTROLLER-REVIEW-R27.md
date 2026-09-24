# Controller review — r27 (finite forest degree/extension inequality), 2026-09-24

Claude Fable 5.1, DRE controller. Written at the Cycle 1 close, after the four awards closed and the
four second reads returned; before publication.

## 1. Verdict

The charter's mathematics is done, and done formally, in one cycle. The Fang–Lu–Nevo–Yao–Zheng finite
forest degree lemma (DL) and extension inequality (EX) are kernel-verified on the program's G1 carrier
with an in-run proof (C1-LA1); the three consequences (LB) `n ≤ 4k`, (R5) `n ≥ 21 ⇒ Δ_5 ≥ 0`, (XR)
`x < r ⇒ n ≤ 4r − 4` are kernel-verified unconditionally (C1-LA4); the graph-general counting core
(C1-LA2) and the implication chain (C1-LA3) are separate awards. The rank-5 residue of r25 (orders 22–25)
is closed out by (R5) alone — the branch-vertex condition turned out to be inert — and the K1-addition
closure extends to `x ≤ 5` at the census's grade. Stop-gate (a) is met; Gate ruling 9 ends the run.

Nothing transfers: every registration is an order bound or a counting statement with sign `Δ_k ≥ 0` on
its contrapositive, and `E993-R25-UNR-FOREST-WIDE`, the no-size-cap claim, NR1, FOREST, TREE, TRANSFER,
the aggregates and Erdős #993 are untouched.

## 2. What was learned that the packet did not already say

- **The degree lemma has a strictly stronger root-corrected form with an exact correction term.** For
  every rooting, `D_k + 2·Σ_i a_{r_i}(k) ≤ 2k·i_k`, and with `M_k = Σ_C max_v a_v(k)` the form
  `D_k + 2·M_k ≤ 2k·i_k` is attained. Critic C-F1-T's injection proof of this form — not the paper's
  polynomial induction — is what the kernel checked. The injection needs `p(p(u)) ≠ u`, a third use of
  acyclicity that no route or adjudicator had named; the isolated second read SR-RC found it and the
  formalizer had, independently, already supplied it (`par_par_ne`).
- **(DL) is never tight at `k ≥ 1` with `i_k > 0`**; the `k = 1` slack is exactly `2c`. The packet's
  "(DL) tight cases" label was an erratum and is now a theorem.
- **(DL) is false on bipartite graphs** (K_{2,3}) and fails iff `|E| > n` at `k = 1`; every cycle meets it
  with equality at every `k`; the root-corrected `k = 1` form characterizes forests.
- **(LB)'s `4k` is exact only at `k = 1, 2`.** The true descent maxima are `4, 8, 11, 15, 18`, now from an
  in-run census to order 20 — order 20 had never been enumerated by any r27 seat until SR-EXX did it. The
  sharp rank-5 ceiling is 18, not 20, at census grade only.
- **The two-potential recurrences do not need acyclicity**; acyclicity enters later, twice (bridges;
  nonnegativity). And the forest step of (DL) is a two-line convolution, not a debt.
- **The external Lean slice was never needed.** With no LICENSE in the audit copy, Gate ruling 3 kept it
  read-only; every declaration was authored in-run, and the run's own proof (injection) differs from the
  external slice's (polynomial induction) anyway.

## 3. Seating, in one paragraph

The proof of record came from a Stage 4 critic (C-F1-T, Opus 5 medium) attacking F1's falsification
census, not from a T route; the second derivation came from two critics correcting T1. The decisive
review finding (the hidden `p(p(u)) ≠ u` step) came from an isolated second reader, not from either
adjudicator. Sonnet routes delivered the census machinery, the compiled counting core and the
architecture; Opus critics carried the mathematics forward; Opus formalizers closed four awards in one
pass each (LA3's repair was a record defect, not a proof defect). This matches the r25/r26 seating
finding: the cross-orientation critics and the isolated second reads are where the mathematics moves.

## 4. Process: what worked and what I got wrong

Worked: running the four second reads concurrently with Stage 7 (SR-RC's finding reached the LA1
formalizer mid-dispatch as a controller fact); dispatching LA4 against LA1's kernel receipt before LA1's
reviews closed (the contingency was discharged in time, saving a full review cycle); resuming LA3's
reviewers for round 2 rather than re-spawning; the single-source registrar discipline (every carry
byte-identical or a recorded keyword-only re-derivation).

Got wrong, recorded as errata R27-E-a…g: r26 residue in the sealed worker brief (E-a) and in the cloned
reviews script (E-d, caught before any reviewer read it); two contract mislabels (E-b, E-c); the SR-EXX
brief's grade gloss ("closed under (LB)" is not "unconditional" while (LB) is informal — E-e; moot now
that (LB) is formal, but the reader was right at the time); brief numbering (E-f); the SR-JOIN brief's
instance-count attribution (E-g). One structural gap: the U adjudicator's carry table omitted a
load-bearing bridge declaration and the synthesis mis-recorded acyclicity as a hypothesis of the join
recurrences — both caught by SR-JOIN, both now on the faces. The LA3 formalizer's in-place rebuild for
the repair round (registrar is append-only; `begin-repair` needs a blocked closeout) is a tooling gap
worth closing in the workflow skill: a repair round on a non-blocked run should have a governed path.

## 5. Publication and decisions for Ashton

Publication follows the r24/r25/r26 pattern (master ledger + registry additive; public repo mirror with
the four Lean packages, the experiment note, the verification evidence and the run root). The r25
standing authorization covers scoped terminal-close publication; I prepare and execute it at this close
and report it, as before. Open decisions: the p = α − 2 interior-rank experiment (the r26 review's
successor); whether to pursue the Hall/SDR route (C-T2-U Step C) or the `x ≤ 6` census; whether to seek a
license determination for the external slice (not needed by anything registered).
