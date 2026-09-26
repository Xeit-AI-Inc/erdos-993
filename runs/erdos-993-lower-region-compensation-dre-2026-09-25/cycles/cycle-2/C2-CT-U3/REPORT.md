# Cycle 2 cross-orientation critique — C2-CT-U3 (orientation T)

## Scope and source integrity

I verified every SHA-256 pin in `packets/C2-COMMON.json` and `packets/C2-CT-U3.json`; all listed common and case files matched. The audit uses the case-listed C2-U3 evidence, report, and return, the common contract/protocol/handoff and listed controls, plus the expressly permitted `control/C2-CRITIC-BRIEF.md`. No computation was claimed or needed for this proof audit, so no sealed source code was replayed. No finite-generation claim is made.

The two required source claim IDs are covered below. The exact route claim IDs remain the review claim IDs. All statuses are proposals only.

## Claim: `C2-U3-ORDERED-SHELL-BOUND`

**Disposition: retained_narrowed.** The ordered first-mark partition and the shadow estimate are sound, and the stated upper bound on positive excess remains valid. The report's boundary list, however, incorrectly treats the second isolated mark as a possible order-`2k` term.

For a shell leaf, `|H|=2k+2`. Each component of `H` has exactly one mark, namely its unique neighbor of the original support; singleton components are marked isolates. For an ordered list of distinct marks, a marked independent `j`-set has a unique first mark `w_i`. Its remaining vertices form an independent `(j-1)`-set avoiding `N_H[w_i]` and every earlier mark. Thus, with the route's definition

`J_i = H - (N_H[w_i] union {w_1,...,w_(i-1)})`,

`q_j = sum_i i_(j-1)(J_i)` at every integer rank with zero extension. Subtracting consecutive ranks gives the exact summand `q_(k+1)-q_k = sum_i (i_k(J_i)-i_(k-1)(J_i))`. This preserves each original leaf tag; equal supports do not identify tags.

For a graph `J` of order `N`, double counting extensions of independent `(k-1)`-sets gives `k i_k(J) <= (N-k+1)i_(k-1)(J)` when the lower layer is in range. If `N<k-1`, both layers vanish; if `N=k-1`, the upper layer vanishes. Therefore `i_k-i_(k-1)<=0` for `N<=2k-1`. For `N=2k`, rearrangement gives `i_k-i_(k-1)<=i_(k-1)/k`, hence the positive part is bounded by that amount.

The first nonisolated root `w_1` has degree at least one in `H`. `J_1` has order `2k` exactly when that degree is one; otherwise it has order at most `2k-1`. For every `i>=2`, the deleted union contains the distinct earlier mark `w_1`, the current mark `w_i`, and, if `w_i` is nonisolated, a neighbor of `w_i` in its own component. If `w_i` is isolated, `N_H[w_1]` already contains `w_1` and at least one neighbor, and the isolated `w_i` is an additional vertex. Thus every `J_i` with `i>=2` has order at most `2k-1`.

This corrects the route's claimed second boundary case. In particular, its displayed `J_2=H-{w_1,w_2}` omits `N_H(w_1)` and is not the `J_2` defined by the partition; if `w_2` is isolated, the actual `J_2` also deletes the nonempty neighbor set of `w_1`. Consequently `L_iso` is not a genuine order-`2k` boundary count. Keeping it as an additional nonnegative allowance does not invalidate the route's loose positive-excess upper bound, but it should not be described as an actual possible boundary term.

A corrected and weaker sufficient compensation condition, using the route's first-root count `L_root(v)=i_(k-1)(J_(v,1))` when `deg_H(w_1)=1` and zero otherwise, is

`k * sum_(v in F) sum_(i>=2) (i_(k-1)(J_(v,i))-i_k(J_(v,i))) >= sum_(v in F) L_root(v)`.

Every summand on the left is nonnegative by the order bound. The only possibly positive term for a tag is the first-root term, at most `L_root(v)/k`; the displayed condition therefore implies the complete selected sum is nonpositive. The route's Comp condition is also sufficient but unnecessarily excludes the second-isolate term from its slack and adds the nonnegative `L_iso` to its required budget.

If `H` is edgeless, connectedness makes `T` a star centered at `s`. At this shell its polynomial is `(1+z)^(2p+1)+z`. Since eligibility implies `p>=3`, the perturbation affects only ranks 0 and 1; for `j>=2` the adjacent differences are those of the binomial row of order `2p+1`. The first negative difference is at `j=p+1`, so `x(T)=p+1`, and `x+2<=p` fails. Thus an eligible shell leaf has nonempty `H`, as needed to choose a nonisolated first mark.

**Narrowed exact statement:** For every eligible shell leaf tag with nonempty `H_v`, the ordered decomposition is exact; the only possible order-`2k` term is `i=1` with `deg_H(w_1)=1`. The sum of positive parts is at most `L_root/k`. This is a valid per-tag bound. It supplies no selector-conditioned lower bound on the aggregate slack.

## Claim: `E993-LOWER-REGION-FIRST-ORDER-SHELL`

**Disposition: retained.** The source correctly states the exact registered shell target with its original-tree hypotheses: ordinary `T`, `x(T)+2<=p`, strict `3p<2alpha(T)+1`, `|T|=2p+2`, and the fixed strict selector `Delta_p(T-v)<0`. Supports, neighborhoods, and distinct same-support leaf tags remain those of the original tree. The shell claim is still OPEN at worker level.

The ordered-root argument is only a conditional reduction. Neither it nor the corrected sufficient compensation condition proves a global budget from the `x`, alpha, and favorable-selector guards. The source has no complete-sum positive witness, so the local-boundary discussion does not refute the shell claim. It correctly makes no universal award. The strict lower-region guard gives positive coefficient `2a+1-3p`; its sign alone gives no conclusion. The two standing positive-local controls also warn against promoting pointwise or support-fiber signs to a full-sum result.

The source does not purport to prove the unrestricted lower-region aggregate or claim an exhaustive census. Its explicit limitation that the full shell sum remains unresolved is accurate. The finite p=6 instrument and other listed finite controls are not evidence for the route's universal shell claim and were not treated as such.

## Final review dispositions

- `C2-U3-ORDERED-SHELL-BOUND`: `retained_narrowed`; correct exact partition and positive-excess estimate, with the second-isolate boundary removed and a sharper first-root-only bound stated above.
- `E993-LOWER-REGION-FIRST-ORDER-SHELL`: `retained`; exact shell claim remains open, with selector-conditioned global compensation unresolved.

## Limitations

- This critique is an informal proof audit, not a formal proof or status award.
- No tree census was run; no finite generation boundary or exhaustive count is claimed.
- No complete-sum proof or counterexample was found.
- The corrected global compensation inequality is only sufficient and remains unproved under the shell eligibility and selector guards.
