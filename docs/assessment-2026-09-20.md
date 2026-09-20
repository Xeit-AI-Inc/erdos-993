# Assessment after the three-cycle G1 experiment

**Assessment date: 2026-09-20. This is a research judgment, not a proof or a forecast.** The completed G1 experiment, r23b construction/verification run, and r24 direct-aggregate run provide substantial partial results and clearer obstructions. They do not establish that the project is close to a full solution. TREE, FOREST, TRANSFER, unrestricted ordinary G1, and aggregated beta-prime remain open in the current record.

## What has materially improved

The G1 experiment now supplies actual graph theorems with completed formal verification. With `i_k(F)` the independent-set count, `Delta_k=i_(k+1)-i_k`, and `x(F)` the first strict descent, Cycle 3 proves

```text
F a finite forest, r >= 1, |V(F)| = 2r+4, x(F) < r  =>  Delta_r(F) <= 0.
```

Its ordinary G1 specialization closes residual order `|U|=2p`, retaining every original guard and `p=x(T)+1`. Earlier cycles formally closed the ordinary `p<=5` case and first wide band `|U|=2p-2`. These are infinite-family results with unbounded rank or ambient order, not extrapolations from finite enumeration. The matching/cover dichotomy and exact cover-fiber partition are reusable mathematical structure. The [experiment report](../runs/g1-large-residual-dre-2026-09-13/REPORT.md) and [verification record](../evidence/verification-2026-09-20-g1.md) state the contracts and proof boundaries.

The intervening second band `|U|=2p-1` remains an informal result with named mathematical dependencies. Together with the retained path-forest result, the mixed-grade exclusions imply that a possible ordinary G1 counterexample must satisfy

```text
p >= 6, |U| >= 2p+1, maximum degree of U >= 3,
and a strict recovery of the residual independence sequence.
```

This is a necessary region, not a formal theorem combining all those conditions, a sufficient construction recipe, or evidence that a counterexample exists.

The sibling runs eliminate a costly distraction. Literal all-cut Hall and tag-closed-cut Hall are false while complete favorable-leaf aggregates can remain negative. Their counterexamples disprove those sufficient mechanisms, not the aggregate or unimodality. The r24 identity and selector-collapse theorems provide exact control at the top rank; the remaining sign for general non-flat residual trees is still open. Its special-family and stratum results keep their recorded informal or critic-attributed grades. See [r23b](../experiments/r23b-delete-retag-construction-verification.md) and [r24](../experiments/r24-direct-favorable-leaf-aggregate.md).

## How close is a solution?

The evidence supports “a stronger partial-theorem program with identified global gaps.” It does not support a completion percentage, a timetable, or a claim that only routine formalization remains. At least one uniform structural argument is still missing, and the complete implication chain contains additional unclosed mathematical and representation obligations.

The parameter `d=|V(F)|-2r` shows the limitation of the new progress. The recent theorems control particular small values of `d`; the remaining ordinary G1 region permits unbounded `d`. Closing the next fixed band would be useful, but any finite number of bands still leaves an unbounded region. The decisive advance would be an argument that works uniformly in this excess, or one that uses the ambient G1 guards to exclude the remaining configurations.

There is also no established shortcut from a G1 subcase to the full problem. The G1wide residual-sign claim studied here is distinct from the old master-ledger `OB-G1` strict-endpoint obligation. The degree-two condition, first-descent rank, negative Gamma guard, and ordinary/governed representation each matter. Aggregated beta-prime has a different rank window, `p>=x(T)+2`; results at that rank cannot simply be inserted at G1 rank `p=x(T)+1`.

Finally, tree unimodality would not by itself prove forest unimodality by multiplying component polynomials: arbitrary unimodal sequences are not closed under convolution. The historical TRS2 route demanded universal tree log-concavity, which is false. Independent literature gives trees with log-concavity failure increasingly far from the last coefficient; this rules out silently restoring log-concavity as a universal premise. See [Galvin, *Trees with non log-concave independent set sequences*](https://arxiv.org/abs/2502.10654). Known partial-shape results for tree sequences likewise illustrate the distinction between controlling large parts of a sequence and proving its full unimodality; see [Basit–Galvin](https://arxiv.org/abs/2006.12562).

## Three priorities for maximal impact

### 1. Turn the matching/cover proof into a uniform residual theorem

This is the strongest positive direction supplied by the new experiment. Keep actual independent-set counts, not an arbitrary sequence model. Use the matching strata and exact vertex-cover fibers to seek an inequality parameterized by `d`, or a structurally justified reduction of the remaining G1 residuals to controlled cases.

The next band `|F|=2r+5` is a useful diagnostic: determine why the six-edge comparison fails and whether the strict-crossing hypothesis rescues the actual forest theorem. The comparator failure does not refute the crossing theorem. But set the research objective beyond one more band: identify a bound, induction, or decomposition whose complexity is controlled uniformly as `d` grows. A successful output would either exclude all remaining ordinary G1 recovery configurations or isolate a genuinely smaller structural obstruction with a proved reduction.

A null census is insufficient. A proposed proof must survive exact first-descent checks, disconnected forests, small ranks, neighborhood overlap, and the known failures of edge-addition monotonicity. An actual recovering forest would be decisive negative evidence for the forest conjecture; a G1 counterexample additionally needs a tree wrapper satisfying all ambient guards.

### 2. Prove global favorable-leaf cancellation, or find a positive complete eligible row

The live aggregate is

```text
S(T,p) = sum over favorable original leaves v of
         [Delta_(p-1)(T-{v,s_v}) - Delta_(p-1)(T-N[s_v])] <= 0,
where x(T)+2 <= p < alpha(T).
```

The target is the complete sum. A positive summand, a deficient proper Hall cut, and two separately favorable averages do not settle it. Pursue the exact signed expansion rather than another all-cut expansion property.

The most concrete proof entry is r24's top-rank residual identity: on its stated class,

```text
S(T,alpha-1) = |L|*i_alpha(T)
  - sum over B in I_(alpha-1)(T) of [|B intersect L| - sum_(s in B) lambda(s)].
```

The missing work is a lower bound on that weighted sum for the general non-flat residual class. Analyze how the three-family expansion compensates its terms whose signs change. The flat class and the entire `T_m` family are controls, not a substitute for this universal inequality. In parallel with that proof attempt, the r24 terminal evaluation identifies the lower interior rank window as underexplored; a focused full-row search there has greater information value than another near-top null census. See [the r24 controller evaluation](../runs/r24-direct-favorable-leaf-aggregate-dre-2026-09-14/TERMINAL-EVALUATION.md).

A success would close a named global sign obligation or give a reproducible counterexample to it. Keep ordinary-tree aggregate, governed `E993-BETA-AGG`, and Erdős #993 as distinct conclusions until their connecting implications are proved.

### 3. Close the exact implication chain to TREE and FOREST

Build one reviewable conditional Lean statement whose conclusion is the original ordinary graph problem and whose hypotheses list every remaining mathematical obligation. Trace the existing reductions into that statement, with no new axioms and no hidden equivalence assumptions. This is not a proposal to formalize dozens of additional easy identities; it is a way to expose the actual minimal set of load-bearing gaps.

Two boundaries require special attention. First, prove the needed ordinary-tree/governed-RTree semantic correspondence for the actual deletion, neighborhood, counting, and rank operations. Second, supply a valid forest argument: direct minimal-recovery descent on actual forests, or a graph-realizable composition invariant that contains all tree independence sequences and is demonstrably stable under disjoint union. A class defined by the desired conclusion is circular; a class requiring universal log-concavity is already excluded.

This work may show that a proposed route needs further endpoint or same-leaf alignment statements. That would be valuable information, not failure. Until the connecting theorem is explicit, it is unjustified to count “one remaining lemma” as “one lemma from solving #993.” If the uniform forest argument in priority 1 succeeds directly, it may bypass much of this older representation and transfer architecture.

## Allocation rule

Give most mathematical effort to priorities 1 and 2. Use priority 3 to keep their implications honest and to decide which prospective theorem deserves the next expensive formalization gate. Prefer a proved uniform inequality, a strict reduction of the remaining class, or an exact counterexample to more independent auxiliary identities and larger undirected censuses. All future research cycles require fresh authorization; this assessment starts none.
