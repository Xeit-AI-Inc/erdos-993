# Post-critique explicit arity12 estimates for independent adjudication

Root-origin clarification after both opposing critiques. CF retained the proof; CU corrected the per-tip identity and explicitly did not complete every envelope audit. An unperformed audit is not a refutation. The final adjudicator must independently decide whether the following derivations and all original dependencies close the exact family scope. No award is made here.

## Graph fidelity and target index

The individual private-tip marked polynomial is q_v=z[(1+2z)F_r H_i+L^N], and the endpoint has q_2=zL^N. Only their complete distinct-tag sum equals z sum_i r_i Z_i, where Z_i=(1+2z)F_r H_i+tL^N, t=(N+1)/N<2. Do not equate an individual q_v to zZ_i. The final sign needs Delta_(p-2)Z_i<0, obtained by propagation from x through every intervening index; deletion selectors need Delta_p A_i<0.

## Uniform adjacent ratios and small-factor envelopes

For every main/common product used, degree D lies between N-11 and N+1, and coefficient derivative bounds yield (1/3)(D-t)/(t+1)<=a_(t+1)/a_t<=2(D-t)/(t+1). For integer indices needed in left shifts, t>=N/4-12 and t<=2N/3+4. With N>=2*10^8, the forward bound is at most8 (already follows from (1.5N+26)/(.25N-11)<=8 when N>=228); the reverse bound is at most8 since 3t/(D-t+1)<=(2N+12)/(N/3-14)<=8 for N>=186. These liberal bounds cover all needed shifts; every index remains within positive support. Binomial and shifted-binomial neighbor bounds4 are even looser at these central ranks. The exact constants are not delicate at this cutoff.

Let H be Q for endpoint deletion and (1+2z)H_i for a private-tip deletion or marked polynomial. For a factor c of degree<=12 with nonnegative coefficients, the ratio cap implies (cH)_j<=c(8)H_j and (cH)_(j+1)<=8c(8)H_j. For all r<=12, B_(r-1)<=coefficientwise L^11+z and B_r<=L^12+z. Therefore
- deletion a_(j+1)<=8(9^11+8)H_j;
- V_j<=(9^12+8)H_j.
With b=zL^N and d=zL^(N+1), d_j=b_j+b_(j-1)<=5b_j and b_(j+1)<=4b_j. Since b_j/H_j<=epsilon, the adverse products a_(j+1)d_j+b_(j+1)V_j are at most
[40(9^11+8)+4(9^12+8)]epsilon H_j^2=(76*9^11+352)epsilon H_j^2.
Endpoint linear factors satisfy the same envelopes.

For a marked Z_i, normalize to b0=L^N and actual b=t*b0. Since F_r<=F12=(L^11-1)/z, 8F12(8)=9^11-1, so a_(j+1)<=(9^11-1)H_j. Also d_j=(b0)_(j-1)+(b0)_(j-2)<=20(b0)_j and b_(j+1)<=8(b0)_j. Thus the adverse sum is at most
[20(9^11-1)+8(9^12+8)]epsilon H_j^2=(92*9^11+44)epsilon H_j^2.
The initial factor minor is at least3, so division by3 gives a smaller controlling constant than C=76*9^11+352. The factor t is already included in8; do not multiply it again or silently set it to1.

The pure perturbation mixed minor is nonnegative. For deletions d_j/b_j=(N+1)/(N-j+2), increasing in j. For marked terms d_j/b_j=(N+1)j/[t(N-j+2)(N-j+1)], likewise increasing on the central interval. LC of each main product follows from the grouped finite ULC factors (121 exact F_r B_s certificates plus remaining factors); LC of each common H uses only unmarked factors. Ordinary LC margin a_j^2/(j+1) and main mixed minor at least H_j^2/(j+1) (or3 times this) follow from the stated ULC/Cauchy-Binet arguments. Main and perturbation neighbor caps8 and4 bound the two adverse LC terms by64a_jb_j<=128epsilon a_j^2, since b_j<=2epsilon a_j.

## Falling-factorial domination and cutoff

Choosing17 extra-z terms among the m-1 remaining branch factors yields H_i>=binom(m-1,17)z^17 L^(N-216), because the omitted arity plus selected arities is at most12*18. For s=0,1 the ratio against binom(N,j-s) is f_s=(j-s)_(17-s)(N-j+s)_(199+s)/(N)_216. The consecutive-ratio cross difference is216j-(17-s)N+(199+s)(1-s)-(17-s)s, at least37N+199 for s0 and38N-16 for s1 when j>=N/4. Thus f_s decreases to J=floor(2N/3+3).
At J the smallest first-factor entry is J-16>=2N/3-14 and the smallest second-factor entry is N-J-198>=N/3-201. The weaker bounds AN and BN with A=2/3-17/(2m), B=1/3-202/(2m) hold because N>=2m. A>B>0, (N)_216<=N^216 and binom(m-1,17)>=(m-17)^17/17! give both binomial-to-H_i ratios at most epsilon=17!/[(m-17)^17 A^16 B^200]. Every relevant H dominates H_i, and every main a also dominates H_i.
Finally j+1<=2N/3+4<=8m+4<=9m. The existing exact replay verifies9mCepsilon<1 at m=10^8. This scalar decreases thereafter because m/(m-17)^17 decreases and A,B increase. No profile census is substituted for this uniform argument.

## First descent and selector

The existing formal forest bound is a valid source for x>N/4. It can alternatively be removed: every B_r and1+2z satisfies f'>=(1/2)(degree(f)f-zf'), so M=(1+2z)Q of degree N+1 increases strictly at j<=N/4,N>4, and zL^(N+1) does also. Thus x>N/4. Eligibility gives x<=p-2 and p<=floor((2N+4)/3). Positive mixed minors transfer strict descent at x to each deletion and Z_i; their own LC propagates it to the required p and p-2. With every original leaf selected, the exact pooled identity gives S<0. The finite prefix and arbitrary-tree target are still outside this restricted theorem.
