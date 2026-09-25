# C1-CU-F1 independent U critique of C1-F1

**Worker C1-CU-F1; cycle 1; U orientation; novelty_claimed: false.** I reviewed only the frozen C1-F1 return and listed evidence, the common historical source set allowed by `packets/C1-T1.json`, and the operational/semantic contracts. Source-byte hashes of all seven frozen C1-F1 files match `packets/C1-CU-F1.json`; its evaluator copy matches `sources/standing-controls/ordinary_tree.py`. I ran only copied scripts from my own scratch directory. No Lean build or remote edit was made.

## Dispositions

**C1-F1-001 — proposed_retained.** The counterexample to the *all-rank pointwise* assertion is exact. At the ordinary tree (T_{22}), order 91, α=68, (x=32), rank (p=34=x+2), the marked leaf has selector difference −24528898691191536776 and summand (+212336130412243110). All 66 other original leaves are favorable, each contributing −7560098737536570631; the complete sum is −498754180547001418536. Thus a positive individual summand occurs at an eligible broader rank, but (34\ne\alpha-2=66), and the complete sum is negative. The analogous T60 rank-90 row also replays. This is *not novel*: the exact T22 and T60 pointwise phenomena are recorded in `sources/public/experiments/r24-direct-favorable-leaf-aggregate.md` and the T22 standing control in `sources/standing-controls/t22-order91.json`. The registered pointwise and support-fibre fences in `control/REJECTED-MECHANISMS.json` concern broader ranks; their failure does not transfer to the frozen first-interior target.

**C1-F1-002 — proposed_unresolved.** The C1-F1 experiments support exactly a limited negative finding, not the universal sign. The target-rank T22 row has (p=66), α=68, (x=32), so (x+2=34\le66). Its 67 original leaves are favorable; the marked summand is −2079 and 66 arm summands are −2208, totaling −147807. The T60 row has order 243, α=182, (x=87), (p=180), (x+2=89\le180); its 181 original leaves are favorable; one summand is −15930 and 180 are −16287, totaling −2947590. These are exact instance results, confirmed by independent coefficient formulas below. No eligible positive complete sum or all-tree proof is present in this return, so the primary claim remains open under `SOLUTION-CONTRACT.md`. In particular the verified r26 theorem has rank α−1 and a residual hypothesis (`sources/public/experiments/r26-top-rank-residual-sign.md`); it cannot close this unrestricted rank α−2 face.

The source report says the order-2-through-8 Prüfer sweep contained **275,392** labeled trees. Its own `evidence.json` and `summary.py` give per-order counts (1,3,16,125,1296,16807,262144), whose sum is **280,392** by Cayley's (n^{n-2}) formula. This is a 5,000-row reporting error, not an omitted search stratum: the copied script loops all sequences in `all_labeled_trees(n,n)` for each (2\le n\le8). Its zero eligible rows replay. Independently, `unlabeled_sweep.py` generates every isomorphism class by adding a leaf to every representative; deleting a leaf from any tree proves this recursion complete. Center-rooted canonical codes give class counts (1,1,2,3,6,11,23), and direct subset counts give zero eligible classes at each order. Thus the eligibility finding is corroborated, but this range contains no target-sign test cases and cannot establish a universal statement.

## New exact restricted-family lemma: C1-CU-F1-001

For every integer (m\ge1), let (T_m) be the tree specified by `sources/standing-controls/ordinary_tree.py`: one root, a root–support–marked-leaf path, and (m) root-adjacent centers with three leaves each. It has order (4m+3), α=(3m+2), and at the target rank (p=\alpha-2=3m) **all (3m+1) original leaves are favorable**. Put (q=3m). The marked summand is (q-\binom q2), and every arm-leaf summand is −(q-3+\binom q2). Hence

\[
S(T_m,3m)=-q^2+4q-(q+1)\binom q2<0.
\]

This statement does not assert that every (m) is eligible; it gives a restricted-family target-rank sign whenever the contract's (x(T_m)+2\le3m) guard holds. It does not establish the unrestricted target. The strict inequality follows since (q\ge3) and (\binom q2\ge q), giving (S\le-2q^2+3q<0).

Here is the full coefficient derivation, with (z) the independence-polynomial variable, (A=(1+z)^3+z=1+4z+3z^2+z^3), and (B=(1+z)^2+z=1+3z+z^2). Root inclusion/exclusion gives
\[
I(T_m)=(1+2z)A^m+z(1+z)^{3m+1}.
\]
The first term has degree (3m+1), the second degree (3m+2), so α is as claimed. Deleting the marked leaf gives ((1+z)A^m+z(1+z)^{3m}); its difference at (p=3m) is (1-6m=1-2q<0). Deleting one arm leaf gives ((1+2z)BA^{m-1}+z(1+z)^{3m}); its difference at (p=3m) is −(3m+1)<0. These are the original-leaf selector differences, retaining each of the three leaves per arm as a distinct tag.

For the marked leaf, (I(H_v)-I(R_v)=z(1+z)^{3m}), so the required (\Delta_{p-1}(H_v)-\Delta_{p-1}(R_v)) is (\binom q{q-1}-\binom q{q-2}=q-\binom q2). For an arm leaf, the two remaining sibling leaves become isolated in (H_v), while deleting the original closed neighborhood of its support removes the root and all three arm leaves. Thus
\[
I(H_v)-I(R_v)=(2z+5z^2+2z^3)A^{m-1}+z(1+z)^{3m}.
\]
At degrees (p=q) and (p-1=q-1), this has coefficients (q+2) and (6(m-1)+5+\binom q2), respectively; their difference is −(q-3+\binom q2). The calculations use zero coefficients outside polynomial support, including the contract's terminal zero extension for (x). `independent_formula.py` implements exactly these formulas with integer arithmetic; its four rows agree with the copied forest-DP replay.

## Evidence, scope, and replay

From the run root, `cd scratchpad/C1-CU-F1 && python3 summary.py > replay_summary.json` replays the C1-F1 script after copying it and the byte-identical source evaluator to this directory. `python3 independent_formula.py > formula_results.json` checks four T-family rows without the source evaluator. `python3 unlabeled_sweep.py > unlabeled_results.json` checks the small range through an independent construction and direct subset counts. `comparison.json` records equality of α, (x), selector cardinality and complete sums for the four rows, as well as the corrected labeled total.

The family formula gives no general tree theorem, and the small sweep is finite. The all-rank pointwise counterexample has rank below α−2. The two exact target instances have negative complete sums. None of these supplies the contract's decisive positive **complete** eligible aggregate or a closed universal proof. The old universal log-concavity, Hall, and support-fibre fences identified in `packets/C1-COMMON-NEUTRAL.md` remain barriers to those specific mechanisms; they were not assumptions in this audit. All owned processes have exited; no background jobs remain.
