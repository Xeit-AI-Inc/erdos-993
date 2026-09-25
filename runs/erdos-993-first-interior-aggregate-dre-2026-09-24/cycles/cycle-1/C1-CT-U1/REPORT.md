# C1-CT-U1 constructive T critique of C1-U1

`novelty_claimed: false`. I reviewed exactly the two claims in `cycles/cycle-1/C1-U1/RETURN.json` against its report, script, and replay, the governing contracts, and the permitted common historical authority. All five C1-U1 source-file SHA-256 values match `packets/C1-CT-U1.json`. This critique proposes dispositions only; it does not confer registry status.

## C1-U1-SUPPORT-FIBRE-POLYNOMIAL-IDENTITY: proposed_retained

The argument is complete for the stated polynomial identities. Fix an original leaf `v` at support `s`, and write `lambda_s` for the number of original leaf neighbors of `s`. Every component of `T-s` is rooted at one neighbor of `s`. The `lambda_s` leaf components are singletons; the other components are precisely `C_{s,u}`. Deleting `v,s` therefore leaves `lambda_s-1` isolated leaf vertices and all `C_{s,u}`, so

`I(H_v;z)=(1+z)^(lambda_s-1) product_u I(C_{s,u};z)=H_s(z)`.

Deleting the **original** closed neighborhood of `s` removes all its leaf neighbors and each root `u`, leaving the disjoint `C_{s,u}-u`; hence `I(R_v;z)=product_u I(C_{s,u}-u;z)=R_s(z)`. The empty-product convention handles a support with no non-leaf neighbor, including the two-vertex tree. Partition independent sets of `T-v` by whether they contain `s`. The classes have polynomials `H_s` and `zR_s`, respectively. Thus `I(T-v;z)=H_s+zR_s`. With coefficients zero extended at every integer index,

`Delta_p(T-v)=[z^(p+1)]H_s-[z^p]H_s+[z^p]R_s-[z^(p-1)]R_s`,

and the target summand is `([z^p]-[z^(p-1)])(H_s-R_s)`. All original leaves at `s` have equal selector and summand, so grouping multiplies their common selected term by `lambda_s`; it does not discard leaf tags. These arguments require no residual condition and work for any integer `p`. For the one-vertex tree there are no supports or original leaves and the grouped sum is empty. This is an elementary identity, not a sign theorem or novelty award.

I copied the two pinned C1-U1 Python files into this seat's scratch and ran `cd scratchpad/C1-CT-U1 && python3 check_path.py > replay.json`. Parsing `replay.json` and the pinned `cycles/cycle-1/C1-U1/exact-replays.json` yields exact JSON equality, including all original-leaf records. As a separate arithmetic check, run `cd scratchpad/C1-CT-U1 && python3 independent_check.py`; this uses closed formulas without the pinned forest DP. For paths, `i_k(P_n)=binom(n-k+1,k)` gives `P_100: (alpha,x,p)=(50,28,48)`, `Delta_p(P_99)=-269450`, and each of two tagged summands `Delta_47(P_98)-Delta_47(P_97)=-2329460`, so `S=-4658920`. For the hub with `m=30` supports and two leaves each, `I(T)=B^m+z(1+z)^(2m)` with `B=1+3z+z^2`; this gives `(alpha,x,p)=(61,30,59)`. The same formulas for the leaf deletion and branch products give selector `-60` and summand `-1738` at each of 60 tagged leaves, hence `S=-104280`. Both satisfy `x+2<=p`. The closed-form script records the exact computations.

## C1-U1-PRIMARY-INTERIOR-AGGREGATE-STATUS: proposed_unresolved

The exact primary statement remains OPEN on this evidence. The identity gives a correct reformulation as a selected, `lambda_s`-weighted sum of slopes of `Q_s=H_s-R_s`, but it supplies no inequality comparing selectors to that global sum. The two tested trees have negative complete sums; that observation cannot settle the universal quantifier. A constructive next step would need a tree-wide relation that allows positive selected local slopes while controlling their total, or an eligible tree with a positive **complete** sum. Neither is in the assigned return. Do not promote the support-fibre expression to a supportwise sign rule: the historical registry has pointwise/support-fibre beta and other local-sign obstructions at their own scopes, and this report has not established a fixed-interior-rank substitute.

The source boundary is consistent. `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md` fix the integer rank `p=alpha-2`, original leaves, strict selector and complete tagged sum. `control/SCOPE-AUDIT.md` and `packets/C1-COMMON-NEUTRAL.md` say the parent aggregate is open and that the r26 verified result applies only to top rank `alpha-1` **with** the residual hypothesis. The pinned C1-U1 report makes no status transfer from that theorem, nor any claim that two examples prove a general sign. The r24 public experiment reports no positive complete eligible aggregate in its bounded searches; the present negative examples are compatible with it. No Lean gate was assigned or run here.

## Limits and process

This critique checks the partition proof and the two exact examples; it does not search any order interval or prove/refute the primary inequality. The copied replay reuses C1-U1's evaluator, while `independent_check.py` separately verifies these particular examples by binomial and product formulas. Neither computation is a universal certificate. All jobs started by this seat completed synchronously; no owned background job remains.
