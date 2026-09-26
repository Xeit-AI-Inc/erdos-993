# Exact same-tree reformulation of CT_x and a false shortcut

Controller research, not independently reviewed or awarded. For a fixed eligible T,p and F, put w(B)=#{v in F: v in B and B meets W_v} on independent p-sets. The bijection (v,A) -> (v,B=A union {v}) identifies the tagged rank k=p-1 distribution with the w-weighted p-layer of T. The support s_v is already blocked by v, so e_Hv(A)=e_T(B), exactly. Therefore Q=sum_B w(B) and E=sum_B w(B)e_T(B). CT_x compares this w-weighted mean at rank p with the UNWEIGHTED mean at rank x.

Write mu_j=(j+1)i_(j+1)/i_j and expectation under the uniform p-layer. For Q>0, E/Q=mu_p+Cov_p(w,e)/E_p[w]. Thus a two-part route must pay the positive tilt cost: Cov_p(w,e)/E_p[w] <= mu_x-mu_p. Neither mean monotonicity nor a sign of covariance is automatic. This is an exact decomposition, not a proved bound.

The attractive shortcut E/Q<=mu_p is FALSE on a known eligible order14 p6 tree. Its explicit graph, F and counts are in RANDOM-EVIDENCE.json row0 (p6-validation), source independently literal-checked earlier. Here x4,a9,p6,|F|6,Q715,E1905,S=-378. The weighted mean is 381/143, the unweighted current mean is 553/218, and the earlier mean is 1805/369. The covariance cross-multiplication E*i_p-(p+1)*i_(p+1)*Q is19895>0. The complete aggregate and CT_x remain negative/true.

All2230 diagnostic rows have a POSITIVE same-rank weighted bias, while all their unweighted mu_p<=mu_x comparisons and full CT_x tests pass. These are bounded observations only; do not promote a universal unweighted-ratio claim (tree independence polynomials are not generally log-concave). C4 probabilistic/search workers should attack the quantitative tilt budget rather than assume negative correlation.
