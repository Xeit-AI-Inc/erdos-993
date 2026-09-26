# C4-CT-U5 independent critique

## Disposition

**C4-U5-SUPPORT-POLYNOMIAL-REDUCTION — retained.** The exact support-indexed identity and fixed-rank computation claim are valid for finite ordinary trees and each fixed integer p >= 2. This retains only the algebraic reduction and exact computation sufficiency; it gives no sign for the lower-region aggregate.

## Independent audit

Fix an original leaf v with support u. For every other neighbor w of u, let C_w be the component on the w-side of uw. In T-v, independent sets that omit u contribute the unrestricted branch product `prod I(C_w)`. Independent sets that include u contribute `z prod I(C_w-w)`. This proves P_{u,v}=I(T-v) and the strict selector is exactly `[z^(p+1)]P-[z^p]P < 0`.

In T-{u,v}, all remaining branches are unrestricted. In T-N_T[u], each remaining branch root w is deleted. Subtraction proves Q_{u,v}=I(T-{u,v})-I(T-N_T[u]); its coefficient difference `[z^p]Q-[z^(p-1)]Q` is exactly the selected summand in the contract.

Every v in L(u) has a singleton branch at the same support u. Omitting this branch from the products gives identical P and Q for all those v. Their selector and summand therefore agree, but the original leaves remain distinct terms: the factor m_u counts them all. The two-vertex tree has two such support records, one per original leaf; the one-vertex tree has no degree-one leaves and an empty sum. No support or neighborhood is recomputed after deletion.

For a rooted subtree, root exclusion permits every child state, while root inclusion forces every child root out. Hence `E_r=prod_c(E_c+O_c)` and `O_r=z prod_c E_c`. Applying these recurrences to directed-edge branches supplies the branch polynomials used above. For fixed p, degrees 0 through p+1 supply the selector and summand coefficients. The eligibility condition x(T)+2<=p is equivalent to the existence of a negative Delta_j among 0<=j<=p-2 and therefore needs coefficients only through p-1. The alpha coordinate supplies the remaining strict guard 3p<2alpha(T)+1. Missing coefficients implement integer zero extension, including when requested ranks exceed the polynomial degree.

## Scope boundary

The reduction preserves all original-leaf tags and computes the full selected sum, but does not bound it. The recurrence is a polynomial-vector computation whose size depends on p; it is not a constant-size transfer state uniform in p or tree order. No monotonicity, compensation, or global budget for selected support records was shown. I found no defect in the route's stated exact reduction, and no evidence here resolving the primary inequality.

Evidence and derivation details are in [EVIDENCE.json](EVIDENCE.json). The sealed source pins were verified before inspection; no source file was executed or modified.
