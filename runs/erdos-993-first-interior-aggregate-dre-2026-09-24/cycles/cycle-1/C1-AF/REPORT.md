# C1-AF neutral adjudication: F-origin portfolio

Cycle 1, orientation N, `status_authority=proposed_worker_only`. All 11 distinct incoming claim IDs in `packets/C1-AF.json` are disposed below. The frozen primary claim remains **OPEN**: this portfolio has neither a proof for every eligible ordinary tree nor an eligible tree with positive *complete* aggregate. No Lean award is proposed. `novelty_claimed: false` for the inherited pointwise phenomenon; the restricted family formulas and deletion identity are proposed informal results only.

## Definitions and scope

Use exactly `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`. For a finite ordinary tree (T), (i_k(T)) counts independent (k)-sets and is zero outside (0\le k\le\alpha(T)). Write (\Delta_k=i_{k+1}-i_k), and (x(T)=\min\{k\ge0:\Delta_k(T)<0\}), including the terminal zero extension. The target integer rank is (p=\alpha(T)-2), under (x(T)+2\le p). Original degree-one vertices are tagged leaves, each with its **original** support (s_v). Set (H_v=T-\{v,s_v\}), (R_v=T-N_T[s_v]), (F_p=\{v:\Delta_p(T-v)<0\}), and (g_v=\Delta_{p-1}(H_v)-\Delta_{p-1}(R_v)). The complete sum is (S(T,p)=\sum_{v\in F_p}g_v), counting distinct leaves at a common support separately. A positive (g_v) need not make (S) positive. Residual means every original leaf belongs to **every** maximum independent set.

My own `audit.py` verifies SHA-256 of all 116 pinned C1-AF source files, independently enumerates all independent subsets of each of the three order-10 graph presentations discussed below, and checks the family coefficient formulas at (m=1,2,3,5,22,60,100). Its deterministic result is `audit.json`. Those parameter checks corroborate arithmetic; the quantified family proof is the coefficient argument below. Both files are in this seat's scratch directory. Run from the run root: `python3 scratchpad/C1-AF/audit.py > scratchpad/C1-AF/audit.json`. I did not execute any pinned source script in place.

## Exact restricted family and off-target pointwise fence

Let (T_m) have root (r), marked path (r-a-b), and (m\ge1) disjoint arms (r-c_j), each (c_j) adjacent to three distinct leaves. Thus it has (4m+3) vertices and (3m+1) original leaves. Put (q=3m), (A=1+z), (Q=A^3+z=1+4z+3z^2+z^3), and (Q'=A^2+z=1+3z+z^2). Conditioning independent sets on (r) gives

\[
 I(T_m;z)=(1+2z)Q^m+zA^{q+1}.
\]

Its highest nonzero degree is (q+2), with coefficient 1, so (\alpha=q+2) and the target rank is (p=q). For the marked leaf (b), and for any one arm leaf (u), root conditioning and the original-support deletions give

\[
\begin{aligned}
 I(T_m-b)&=AQ^m+zA^q,& I(H_b)-I(R_b)&=zA^q,\\
 I(T_m-u)&=(1+2z)Q'Q^{m-1}+zA^q,&
 I(H_u)-I(R_u)&=(2z+5z^2+2z^3)Q^{m-1}+zA^q.
\end{aligned}
\]

For completeness, deleting the marked leaf and its support leaves the root and its arms, so (I(H_b)=Q^m+zA^q), while deleting the support's original closed neighborhood leaves the (m) separate arms, so (I(R_b)=Q^m). For an arm leaf, the two sibling leaves become isolated after deleting that leaf and its center: (I(H_u)=A^2(1+2z)Q^{m-1}+zA^q). Deleting the center's original closed neighborhood removes the root and all three leaves of that arm: (I(R_u)=(1+2z)Q^{m-1}). Since ((A^2-1)(1+2z)=2z+5z^2+2z^3), these give the displayed differences. This explains why the two remaining sibling leaves contribute without collapsing the three original tags.

Taking coefficient differences at the *original* rank (q) yields selector differences (1-6m<0) for (b) and (-q-1<0) for every arm leaf. All (q+1) distinct original leaves are favorable. Taking differences at (q-1) in the right-hand polynomials yields

\[
 g_b=q-\binom q2=-\tfrac92m(m-1),\qquad
 g_u=3-q-\binom q2=3-6m-\tfrac92m(m-1).
\]

The arm expression follows directly because the displayed (H_u-R_u) polynomial has coefficients (q+2) at degree (q) and (6(m-1)+5+\binom q2) at degree (q-1). Hence, with the (q) arm-leaf tags retained,

\[
 S(T_m,q)=g_b+qg_u=-q^2+4q-(q+1)\binom q2<0\quad(m\ge1).
\]

This proves `C1-CU-F1-001` for every (m\ge1), but applying it to the frozen target requires eligibility. For (m\ge2), the top deficits of (Q^m) are (a_1=3m), (a_2=4m+9\binom m2), (a_3=m+12m(m-1)+27\binom m3). Substitution in the displayed polynomial gives

\[
\begin{aligned}
 \Delta_{q-2}(T_m)
 &=a_1+a_2-2a_3+\binom{q+1}{3}-\binom{q+1}{4}\\
 &=5m-\tfrac{39}{2}m(m-1)-54\binom m3
   +\binom{q+1}{3}-\binom{q+1}{4}<0.
\end{aligned}
\]

Indeed (5m-39m(m-1)/2<0) for (m\ge2), and the remaining terms are nonpositive since (q+1\ge7). Therefore (x(T_m)\le q-2) and (x+2\le p=q). This proves the additional eligibility in `C1-CT-F1-001` and `C1-CT-F2-FAMILY-SIGN` for all (m\ge2). At (m=1), (\alpha=5,p=3,x=2), so that member is ineligible even though its target-rank selector and sign formulas hold. The three critic family claims are compatible presentations of **one restricted family lemma**, not three independent all-tree results. The derivations are in `cycles/cycle-1/C1-CT-F1/REPORT.md`, `cycles/cycle-1/C1-CT-F2/REPORT.md`, and `cycles/cycle-1/C1-CU-F1/REPORT.md`; `audit.json` confirms representative rows, including (T_{22}) at ((\alpha,x,p,S)=(68,32,66,-147807)), (T_{60}) at ((182,87,180,-2947590)), and (T_{100}) at ((302,145,300,-13588650)).

`C1-F1-001` is a distinct **off-target** counterexample to an all-eligible-ranks *pointwise* shortcut. On (T_{22}), (x=32), (\alpha=68), and rank (34=x+2) satisfies the broader rank guard but differs from the frozen rank (\alpha-2=66). At rank 34, the marked leaf has (\Delta_{34}(T-b)=-24528898691191536776<0) and (g_b=+212336130412243110). Each of the other 66 leaf tags is favorable with (g_u=-7560098737536570631), so the **complete** sum is (-498754180547001418536). The exact row appears in `cycles/cycle-1/C1-F1/evidence.json`; an independent coefficient replay appears in `cycles/cycle-1/C1-CT-F1/independent_results.json`. This phenomenon was already recorded at broader ranks in `sources/public/experiments/r24-direct-favorable-leaf-aggregate.md`. It refutes neither a pointwise sign restricted to (p=\alpha-2) nor the primary complete-sum inequality.

## Corrected non-residual witness

The graph certified by `cycles/cycle-1/C1-F2/nonresidual-example.json` and `nonresidual-verification.json` has vertices (0,\ldots,9) and edges

`{0-3, 1-6, 1-9, 2-6, 3-5, 3-7, 3-8, 4-6, 6-7}`.

It is connected with nine edges, hence a tree. Independent-subset enumeration gives (I=(1,10,36,62,61,37,13,2)), (\alpha=7), (x=3), and (p=5), so (x+2=p). The following table gives every original leaf; columns are leaf, support, (\Delta_5(T-v)), (\Delta_4(H_v)), (\Delta_4(R_v)), and (g_v):

| (v) | (s_v) | selector | H | R | (g_v) |
|---:|---:|---:|---:|---:|---:|
| 0 | 3 | -9 | -15 | 0 | -15 |
| 2 | 6 | -10 | -14 | -1 | -13 |
| 4 | 6 | -10 | -14 | -1 | -13 |
| 5 | 3 | -9 | -15 | 0 | -15 |
| 8 | 3 | -9 | -15 | 0 | -15 |
| 9 | 1 | -14 | -10 | -9 | -1 |

All six pass the strict selector, and their complete sum is (-72). The two maximum independent sets are exactly ({0,1,2,4,5,7,8}) and ({0,2,4,5,7,8,9}). The first omits original leaf 9, so this eligible tree is non-residual. My `audit.json` reproduces the entire table and both maximum sets by subset enumeration, consistent with `cycles/cycle-1/C1-CT-F2/independent-audit.json` and `cycles/cycle-1/C1-CU-F2/replay-results.json`.

**Origin report correction.** The edge list printed in `cycles/cycle-1/C1-F2/REPORT.md` is instead `{0-8,1-2,2-5,3-7,3-8,4-8,5-8,6-8,7-9}`, copied from the first random-search example. It has polynomial ((1,10,36,62,58,32,9,1)), leaves ({0,1,4,6,9}), five favorable summands ((-16,-7,-16,-16,-7)), complete sum (-62), and unique maximum set ({0,1,3,4,5,6,9}). It **is residual** and cannot certify the origin prose's assertion. The F2 scope claim is retained only using the pinned JSON graph and corrected facts above. The U and T critiques both found this discrepancy; `audit.json` independently confirms it.

`C1-F3-03` supplies the same obstruction up to relabeling. Its edges are `{0-1,1-3,1-4,1-8,2-4,2-5,2-7,2-9,6-9}`. Under the vertex map from the corrected F2 graph (3\mapsto1,0\mapsto0,5\mapsto3,8\mapsto8,7\mapsto4,6\mapsto2,2\mapsto5,4\mapsto7,1\mapsto9,9\mapsto6), the two edge sets coincide. In F3 labels the leaves are (0,3,5,6,7,8), all favorable, with terms ((-15,-15,-13,-1,-13,-15)) and (S=-72); a maximum set ({0,3,4,5,7,8,9}) omits leaf 6. `cycles/cycle-1/C1-F3/nonresidual_target.json` and `cycles/cycle-1/C1-CT-F3/audit.json` record these values; my audit independently confirms them. These are two labels of one structural witness. The admitted r26 contract, `sources/public/proofs/lean/r26-c1-la1-top-rank-residual-sign/THEOREM-CONTRACT.md`, has both residuality and rank (\alpha-1); it cannot be applied directly to this unrestricted (\alpha-2) case. The witness's negative sum is **not** a primary counterexample.

## Bounded computations and their corrections

| Incoming claims | Exact supported scope | Observed result and limit |
|---|---|---|
| `C1-F1-002` | Every labeled Prüfer tree of orders 2 through 8; (T_{22},T_{60}) at target rank | Per-order counts (1,3,16,125,1296,16807,262144) sum to **280392**, not 275392 as `cycles/cycle-1/C1-F1/REPORT.md` says. No small tree is eligible. The two eligible family sums are (-147807,-2947590); they do not decide all trees. The count and zero eligibility were independently checked in `cycles/cycle-1/C1-CT-F1/independent_results.json` and `cycles/cycle-1/C1-CU-F1/unlabeled_results.json`. |
| `C1-F2-NEGATIVE-BOUNDED-SEARCH` | Seed 99320260924: 120 Prüfer words at each order 8 through 45, 4560 samples; family (m=1..60); exhaustive Prüfer orders 2 through 7 | 3840 sampled trees eligible; no positive complete sum or positive selected term. The family has 59 eligible members ((m=2..60)), all with negative sum; (T_{60}) has (-2947590) at (p=180). Orders 2 through 7 have no eligible tree. The source exhaustive script's row labeled (n=1) actually constructs (K_2); (K_1) is separately ineligible since (\alpha=1,p=-1). `family-sweep.json` has 100 rows, while the described/replayed scope is 60; only (m\le60) is used for this computational claim. See `cycles/cycle-1/C1-CT-F2/REPORT.md` and `cycles/cycle-1/C1-CU-F2/replay-results.json`. |
| `C1-F3-01` | Explicit (T_{22},T_{60},T_{100}) only | Exact eligible sums (-147807,-2947590,-13588650), with respectively 67, 181, 301 favorable original leaves. Full edge/leaf records and a separate recurrence are in `cycles/cycle-1/C1-F3/C1-F3-fresh-examples.json` and `C1-F3-independent-checks.json`; `cycles/cycle-1/C1-CT-F3/audit.json` checked the structured records. The first two are the same family instances already above; (T_{100}) is a fresh larger instance, not all-tree evidence. |
| `C1-F3-02` | Seed 9932401, exactly 300 generated Prüfer words at each of orders 16, 20, 24, 30, 40 | Of 1500 generated trees, 1466 are eligible; no positive complete sum; maximum sum (-210) and maximum selected summand (0). The script uses a seeded pseudorandom generator. State a reproducible deterministic sample, not a certified ideal-independent-uniform experiment or an exhaustive census. See `cycles/cycle-1/C1-F3/C1-F3-random-summary.json` and `cycles/cycle-1/C1-CU-F3/random-replay-summary.json`. |

The negative searches are finite. The exhaustive small ranges contain **zero eligible** target trees and thus no direct sign tests. The symmetric family sign is a separate quantified result, proved above, but its graph class is narrow. The inherited broader-rank positive pointwise and support-fibre examples, plus log-concavity and Hall mechanism failures documented in `packets/C1-COMMON-NEUTRAL.md` and `control/REJECTED-MECHANISMS.json`, cannot be promoted into positive complete sums at this target rank. None of those mechanisms is assumed in the retained family proof or graph certificates.

## Exact deletion identity and remaining gap

`C1-CT-F3-01` is retained as an exact identity for any finite simple graph with an original degree-one (v). Partition independent sets of (T-v) by whether they contain its support (s_v): those omitting (s_v) are independent sets of (H_v), while those containing it are (\{s_v\}) plus an independent set of (R_v). Thus (I(T-v)=I(H_v)+zI(R_v)). Zero-extended coefficient differences at any integer (p) give

\[
 \Delta_p(T-v)=\Delta_p(H_v)+\Delta_{p-1}(R_v),\qquad
 g_v=\Delta_{p-1}(H_v)-\Delta_{p-1}(R_v)
     =i_{p+1}(H_v)-i_{p-1}(H_v)-\Delta_p(T-v).
\]

The final equality telescopes (\Delta_{p-1}(H_v)+\Delta_p(H_v)). Summing over **leaf tags** yields an exact aggregate representation. On a favorable leaf, (-\Delta_p(T-v)>0); the identity supplies no sign bound on the remaining two-step (H_v) difference or their collective sum. A closed all-tree bound or a positive complete eligible certificate remains the next decisive question. This identity is not a proof of the primary claim.

## Disposition index

| Claim ID | Proposed disposition | Exact reading |
|---|---|---|
| `C1-F1-001` | retained | Broader-rank pointwise shortcut is false, at (T_{22},p=34); no target counterexample. |
| `C1-F1-002` | unresolved | The primary all-tree sign remains open; correct small labeled total is 280392. |
| `C1-F2-RESIDUAL-SCOPE-GAP` | retained_narrowed | Use the pinned JSON edge list, not the erroneous origin-report graph; single non-residual eligible tree, (S=-72). |
| `C1-F2-NEGATIVE-BOUNDED-SEARCH` | retained_narrowed | Only the stated finite sample, (m\le60) family sweep, and genuine order-2-through-7 census; (K_1) checked directly. |
| `C1-F3-01` | retained | Three exact eligible family rows only. |
| `C1-F3-02` | retained_narrowed | Exact seeded pseudorandom sequence only. |
| `C1-F3-03` | retained | One eligible non-residual tree, isomorphic to corrected F2 witness; negative sum. |
| `C1-CT-F1-001` | retained | Symbolic restricted-family eligibility, selector and negative sum for (m\ge2). |
| `C1-CT-F2-FAMILY-SIGN` | retained | Same symbolic restricted-family result for (m\ge2). |
| `C1-CU-F1-001` | retained | Family selector/sign formula for (m\ge1); (m=1) is ineligible for the primary target. |
| `C1-CT-F3-01` | retained | Exact deletion identity, no sign conclusion. |

All statuses above are worker proposals, not canonical awards. No universal conclusion, exact positive complete eligible sum, or Lean build was supplied. The scripts I owned have exited; there are no background jobs or pending writes.
