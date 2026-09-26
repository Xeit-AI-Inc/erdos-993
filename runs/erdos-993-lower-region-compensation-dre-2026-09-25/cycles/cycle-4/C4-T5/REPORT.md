# C4-T5 search report: exact two-orbit T_m family

## Scope and result

I studied the ordinary tree family with path (a-b-r), and with (m\ge1) disjoint three-leaf stars whose centers are adjacent to (r). The order is (4m+3); its original leaves are the single arm leaf (a) and the (3m) claw leaves. This is a concrete infinite family relevant to the T5 coefficient lens. The result below is an exact bounded computation for (1\le m\le80), not an all-(m) theorem or a census of ordinary trees.

Let (L=1+z), (B=1+4z+3z^2+z^3), and use independence-polynomial coefficients with zero extension. Root splitting gives

\[
 P_m=I(T_m)=(1+2z)B^m+zL^{3m+1}.
\]

The two deletion polynomials that determine the fixed selector are

\[
 D_{a,m}=I(T_m-a)=(1+z)B^m+zL^{3m},
\]
\[
 D_{c,m}=I(T_m-v)=(1+2z)(1+3z+z^2)B^{m-1}+zL^{3m},
\]
where (v) is any claw leaf. Thus at rank (p), the arm orbit is selected exactly when \([z^{p+1}]D_{a,m}-[z^p]D_{a,m}<0\), and the claw orbit exactly when the analogous difference for (D_{c,m}) is negative. These are separate selector tests; neither is inferred from a marked polynomial.

For the corresponding (H_v=T_m-\{v,s_v\}) and (R_v=T_m-N[s_v]), direct splitting yields

\[
 q_{a,m}=I(H_a)-I(R_a)=zL^{3m},
\]
\[
 q_{c,m}=I(H_v)-I(R_v)=z(2+z)(1+2z)B^{m-1}+zL^{3m}.
\]
For example, in the second identity, (R_v) has polynomial ((1+2z)B^{m-1}), while (H_v) has polynomial ((1+2z)L^2B^{m-1}+zL^{3m}). Their difference is the displayed (q_{c,m}). Therefore for (k=p-1) the complete selected sum on this family is

\[
 S_m(p)=\mathbf1_{\Delta_p(D_{a,m})<0}\,\Delta_k(q_{a,m})
 +3m\mathbf1_{\Delta_p(D_{c,m})<0}\,\Delta_k(q_{c,m}).
\]
This counts all (3m) claw leaves separately, even though they share supports.

There is also an exact coefficient identity for the all-leaf marked polynomial
\[
 Q_m=(3m+1)zL^{3m}+3m z(2+z)(1+2z)B^{m-1}:
\]
\[
 Q_m=P_m'-2B^m-L^{3m+1}-4m(1+2z)B^{m-1}.
\]
It follows by differentiating the displayed (P_m) and using (B'=4+3z(2+z)). It is an identity only. (Q_m) is the selected marked polynomial at (p) only when both strict selector differences above are negative. Moreover, the positive arm contribution (zL^{3m}) remains present in each claw mark, so the identity does not itself absorb the positive arm into claw contributions. No coefficient inequality establishing that absorption uniformly in (m,p) was obtained.

## Exact bounded replay

[replay.py](replay.py) builds coefficients by integer polynomial addition and convolution, computes the terminal-zero-extended first descent (x(T_m)), then enumerates every integer (p) satisfying both (x+2\le p\le\alpha(T_m)) and (3p<2\alpha(T_m)+1). It evaluates both strict orbit selectors independently and sums the selected Δ terms using the fixed original leaf orbits. Run with `python3 replay.py`; it writes [evidence.json](evidence.json), including every generated eligible row and the exact selector differences and summands.

The boundary is exactly (m=1,\ldots,80), not an unbounded generation claim. There are 1,749 eligible ((m,p)) rows, across 78 nonempty (m)-values (from (m=3) through 80). All 1,749 rows have both selector flags true, and every complete selected sum is negative; there are no zero or positive sums. For an explicit check, (m=3) has (\alpha=11), (x=5), and its sole eligible rank is (p=7); the two selector differences are −141 and −56, the arm and single-claw summands are −42 and −125, and the full sum is −1167. The first two family members have no eligible lower-region rank. Exact coefficients and all rows are preserved in evidence.json for replay.

## Status and gaps

This supplies a bounded exact family result and verifies both orbit selectors throughout that finite range. It neither proves the selectors for all (m), nor the sign of (S_m(p)) for all eligible (m,p), nor the ordinary-tree aggregate beyond this family. In particular, the derivative identity, total-mass decay of the arm polynomial, and finite negative sums provide no uniform tail-coefficient bound. The primary lower-region aggregate therefore remains open on this route. No imported theorem or external citation is used.
