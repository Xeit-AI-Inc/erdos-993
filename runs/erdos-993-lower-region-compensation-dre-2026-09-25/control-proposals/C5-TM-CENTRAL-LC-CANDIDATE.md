# Root candidate: effective central log-concavity for the three T_m auxiliaries

Unawarded Astra derivation, awaiting an independent Sol audit and DRE scrutiny. No selector/minor or aggregate theorem is claimed. This corrects the earlier overly broad dismissal of ULC: B fails binomial-normalized ULC of order3, but satisfies Poisson-normalized ULC.

Let L=1+z, B=L^3+z. The three Z=a+b are
A0: a=L B^m, b=z L^(3m);
Astar: a=(1+2z)(1+3z+z^2)B^(m-1), b=z L^(3m);
R: a=3m(2+5z+2z^2)B^(m-1), b=(3m+1)L^(3m).
Proposed result: for all integer m>=3 and all m<=j<=2m+2, Z_j^2>Z_(j-1)Z_(j+1). Finite m3..999 requires the accompanying exact check; the following proof covers m>=1000. These ranks are interior to each Z's support. This is a restricted coefficient lemma, not full-support LC.

## Curvature and ratio bounds

Use Poisson ULC: j a_j^2 >= (j+1)a_(j-1)a_(j+1), equivalent to LC of j!a_j. Each factor L, B, 1+2z, 1+3z+z^2, and 2+5z+2z^2 satisfies it by direct coefficient check, has interval support, and positive total mass. Normalizing gives probability sequences; independent convolution is ULC by Theorem4.1(b) and its proof in Saumard-Wellner (2014), https://pmc.ncbi.nlm.nih.gov/articles/PMC4847755/ (original closure credited there to Walkup/Liggett). Hence each a is ULC and
 a_j^2-a_(j-1)a_(j+1) >= a_j^2/(j+1).
The b sequences are shifted binomials, hence ordinarily LC.

For every individual factor F of degree d, direct coefficient checks give (2/3)(dF-zF') <= F' <= 2(dF-zF') coefficientwise. Product differentiation preserves these inequalities with the product degree D. Thus
 (2/3)(D-r)/(r+1) <= a_(r+1)/a_r <= 2(D-r)/(r+1).
The degrees D of a lie between 3m-1 and 3m+1. For m>=1000 and m<=j<=2m+2, a_(j-1)/a_j<=4 and a_(j+1)/a_j<=4. For b=c z^s L^(3m), s=0 or1, both neighbor ratios are <=3 in this interval. Therefore the two negative mixed products in LC(a+b) have sum <=24 a_j b_j. Discarding the nonnegative pure b curvature and positive 2a_jb_j leaves
 Z_j^2-Z_(j-1)Z_(j+1) >= a_j^2/(j+1)-24a_jb_j.

## Uniform elementary perturbation bound

All three a have a coefficientwise lower bound c_a B^(m-1), with c_a=1,1,6m respectively, and b=c_b z^s L^(3m) with c_b/c_a<=1. The h=8 term in B^(m-1)=(L^3+z)^(m-1) gives
 a_j >= c_a binom(m-1,8) binom(3m-27,j-8).
Put N=3m and t=j-s. The ratio of the latter binomial to binom(N,t) is
 (t)_(8-s) (N-t)_(19+s) / (N)_27,
where parentheses denote falling factorials. Every numerator factor is >=m-20>=49m/50 and every denominator factor <=3m; all are positive. Also binom(m-1,8)>=(m-8)^8/8!>=(124m/125)^8/8!. Therefore
 b_j/a_j <= K/m^8,
 K=8! (125/124)^8 (150/49)^27.
An exact rational check gives 24*2003*K < 1000^8 (ratio approximately0.02720). The function (2m+3)/m^8 decreases for positive m, so for all m>=1000,
 24(2m+3) K/m^8 <1.
As j+1<=2m+3, the displayed LC lower bound is strictly positive. This completes the proposed large-m portion.

## What remains

The finite check is a separate exact computational base, not a universal theorem by census. The imported ULC theorem and every coefficient/index inequality need independent scrutiny. Even if this candidate survives, it supplies no crossing-rank minor Z_x P_(x+1)-Z_(x+1)P_x>=0, so neither both selectors nor the aggregate follows. Under the existing r27 descent-order theorem x>=m+1 and eligibility p<=2m+1, the necessary LC propagation ranks lie in this central interval. The new precise bottleneck would be three crossing-rank comparisons, or a direct alternative.
