# Controller Review — r26 (validate and formalize the r24 top-rank residual sign), final analysis

Reviewer: Claude Fable 5.1 (xhigh), the run's DRE controller. Date: 2026-09-24. Scope: the whole run (one
cycle; terminal by the decisive event). Status: final; sealed by `R26-TERMINAL-MANIFEST.json`. Every figure is
taken from sealed records named in `cycles/cycle-1/CYCLE-CLOSE.md`. Ashton chartered a controller
checkpoint after the third cycle and a final analysis after the sixth; the run ended after Cycle 1 on the
early-stop rule, so this review is both.

## 1. Verdict

**The candidate argument is sound, and `(RC)` is now a theorem of the program at `formally_verified`.** The
run did exactly what the charter asked: it treated the literature-map candidate as an argument to attack,
re-derived it twice by different mechanisms (case analysis; generating function), attacked every step with
eighteen critics and three adjudicators, found and repaired two genuine defects in the seats' write-ups
(neither in the candidate itself), and produced a governed Lean proof composed with the r24 identity (RI) —
kernel receipt, independent informal audit, independent fidelity review, close. Two further awards (the
deletion-injection/fibre bound; the tree-structural core) and one informal theorem (the strict form,
`S ≤ −2`) came with it. The r24 record's "1,420 realized negative family-(I) weights" statement was
traced, replayed on six independent instruments, and corrected: it was a predicate substitution (a structural
precondition reported as a realized event), originating in an r24 critic's sentence and propagated by an
adjudicator's count whose instrument did not survive. **No status moves to the all-rank aggregate,
`E993-BETA-AGG`, TREE, FOREST or Erdős #993.** `(RC)` is one sub-case — the top rank on the residual class —
of an aggregate that remains open at every other rank and on the non-residual class.

## 2. What was learned that the packet did not already say

1. **`hyp-eligible` is consumed only through `α ≥ 3`** (to exclude `P₃`); the packet said `P₃` is excluded by
   the eligibility guard, and the proof shows precisely how little of the guard is used. On the eligible class
   `α ≥ 5` in fact (SR-STRICT), so the strict form is `S ≤ −2` everywhere and `S ≤ −4` at `ℓ = 2`.
2. **`N₂ ≤ M` is false** on the eligible class from order 9 (a flat tree with three multiplicity-2 supports);
   the packet's step 4 needed `N₂ ≤ k₂M` with `k₂ ≤ ⌊ℓ/2⌋`, which is what the proof uses. The allocation
   parenthesis that suggested `N₂ ≤ M` at `ℓ = 3` was right only because `k₂ ≤ 1` there. Registered REFUTED.
3. **The budget's arithmetic admits a fourth shape** (one `λ = 2` support plus extra `λ = 1` supports) that
   only the forced-neighbour lemma removes — so the classification consumes `(★)`, contrary to T1's "no new
   hypothesis" wording. Both T1 critics found it; the repaired `L5′ + L5″` is what was formalized.
4. **The sign-flipping r24 saw is real, but it belongs to family (III)** — thousands of negative individual
   weights (2,039 to order 17), with every fibre sum nonnegative and the deletion-injection slack tight at 0.
   The r24 record attributed it to family (I), where the weight is the constant `ℓ − 1`.
5. **Census figures reconciled at last:** 16,424 (all four hypotheses, the ledger figure) = 290 flat + 16,134
   non-flat (TD-6's figure); 16,442 (drop eligibility) = 16,424 + 18, with the 18 ineligible residual trees
   given as an exact order multiset. `(RI)` holds on every residual tree and forest tested and fails on every
   non-residual one: it tracks `(★)`, not connectivity.
6. **A matching characterization:** `(★) ⟺ every leaf is missed by some maximum matching` (critic `C-F1-T`,
   via König for trees; zero disagreements on 5,445 trees). Stated, not registered; a successor may want it.

## 3. Seating, in one paragraph

Routes on Sonnet 5 (xhigh), critics on Opus 5 (medium), adjudication/synthesis/Stage 7 on Opus 5 (high).
The mathematics that closed `(RC)` was seat-derived (T1's from-scratch chain; T2's independent derivation);
the two defects were critic-found and critic-repaired; four of the six Lean fragments carried into the
award were critic-compiled; the strict form's proof is critic-derived. Medium-effort Opus critics produced
material, convergent findings (two independent repairs of T2's `a = 1` gap; two independent discoveries of
F1's vacuous fibre check; `α ≥ 4` found twice) — consistent with the r25 seating record that grade-moving
corrections come from the critic tier, and with the addendum's structural reading that this tracks whether
a route leaves an open step of the kind the charter targets. Nothing here separates model from effort.

## 4. Process: what worked and what I got wrong

- Worked: a single cycle-parameterized toolkit (no clone residue); sealed per-seat capsules; nine parallel
  routes then eighteen parallel critics with no transport interruption; the three governed awards closed
  with zero bounded repairs; the second reads (three, isolated) each repaired something real before
  registration (two TD-6 disjuncts; `S ≤ −4` at `ℓ = 2`; the order multiset; the r24 T adjudicator's
  witness count "to order 12" not 13).
- Controller errors, all recorded, none affecting mathematics: R26-E-a (a `bind-shared-packages` command
  that cannot work on scratch roots — three seats worked around it correctly and disclosed it); R26-E-b
  (`P₇` labelled eligible in my brief; caught by four seats); R26-E-c (the contract's Tier 1′ row weaker
  than what was proved); a date literal one day ahead in the attack briefs (re-sealed before dispatch,
  R26-N-7); the Stage 3 manifest missing from critic capsules; the LA2 brief's wrong parenthetical about the
  carried body's dependencies (the formalizer applied the brief's operative clause correctly); the LA1 brief's
  request for one `#print axioms` line per declaration in `axioms.txt`, which the receipt-bound file does not
  carry (the per-declaration list lives in a companion file, 147/148, the absentee a `Prop`-valued
  definition). Incident R26-I-1: a critic used a pattern `pkill`; no lost result; PID-only rule for
  successors.
- Rules to carry forward: seat dispatch WRAPPERS must not extend a sealed dispatch file (R26-N-13); critics
  verify an earlier stage's seal by recomputing from the manifest's own listed digests, never by hashing
  members outside their capsule; kill by literal PID only; a scratch Lean project binds by manual symlink
  (the governed tool is for `runs/` roots); a controller's fixed-point table is checked by the controller's
  own instrument before it is sealed.

## 5. Publication and decisions for Ashton

Publication at the close is as pre-declared (`AUTHORIZATION.md`): master registry 363 → 370 and ledger
r26 section; public repository with three Lean packages (`proofs/lean/r26-c1-la1-top-rank-residual-sign`,
`r26-c1-la2-deletion-injection-fibre`, `r26-c1-la3-tree-structural-core`), the experiment page, the
verification record and the mirrored run records. Nothing blocking. Open for a successor: (a) the interior
ranks of the aggregate (never searched; the only region with positive mechanism values); (b) the
non-residual class at the top rank (needs an identity other than (RI)); (c) the ordinary-to-RTree
transport for `E993-BETA-AGG`; (d) whether to formalize the strict form and the `S = 0 ⟺ P₅`
characterization (both `proved_informal`, both small); (e) the matching characterization of `(★)`.
