# Unawarded successor direction: heterogeneous star branches

This is a proposed next-cycle avenue, not a proved extension of the T_m candidate. Put B_r=(1+z)^r+z. Every B_r for r>=1 is Poisson-ULC: only the first two ordinary binomial inequalities change when adding z, and direct arithmetic verifies them. Finite-order binomial-normalized ULC is a different property. Thus products of these branch polynomials inherit a usable Poisson-ULC curvature bound.

Consider the path0-1-2 with m branches at0 of positive arities r_i, total N=sum r_i. P=(1+2z)prod_i B_(r_i)+z(1+z)^(N+1). The arm deletion is (1+z)prod_i B_(r_i)+z(1+z)^N. Deletion of a leaf on branch i is (1+2z)B_(r_i-1)prod_(h!=i)B_(r_h)+z(1+z)^N. Original supports and all N+1 leaf tags must still be accounted for; check exceptional arity/root cases directly.

With all original leaves selected, the marked polynomial divided by z is
 R=(N+1)(1+z)^N+(1+2z)sum_i r_i F_(r_i)prod_(h!=i)B_(r_h),
 F_r=((1+z)^(r-1)-1)/z.
For r_i>=2, distribute the perturbation over branch terms:
 R=sum_i r_i Z_i,
 Z_i=(1+2z)F_(r_i)prod_(h!=i)B_(r_h)+((N+1)/N)(1+z)^N.
If each Z_i has the needed central decrease, their positive weighted sum does, without asserting log-concavity of R as a mixture.

Check before use: for bounded r=2,3,4, F_r is Poisson-ULC by direct finite coefficient checks, and F_r/B_r coefficient ratios decrease; B_(r-1)/B_r coefficient ratios also decrease. The 0,1 minors are (r-1)(r+4)/2 for F_r versus B_r, and1 for B_(r-1) versus B_r (the latter needs care at r=1). A common Poisson-ULC convolution factor then yields a quantitative positive mixed minor exactly as in the T_m candidate.

Do not extend the F_r ULC assertion to arbitrary r: already F_7=(6,15,20,15,6,1) fails Poisson ULC at rank1 because225<240. Ordinary LC may survive, but it is not the required curvature margin.

For bounded arities, e.g.2<=r_i<=4, the h chosen-branch terms give a coefficientwise lower bound prod B_(r_i)>=binom(m,h)z^h(1+z)^(N-4h), when N>=4h. This suggests explicit perturbation bounds uniform in heterogeneous profiles for sufficiently many branches. It does not settle the finite profiles below a cutoff, nor show a practical cutoff, and it must preserve the exact original-leaf selector. A worthwhile C5 result would be one proved new family or effective large-branch theorem plus explicit finite debt; mere claims that sums of LC polynomials are LC are invalid.
