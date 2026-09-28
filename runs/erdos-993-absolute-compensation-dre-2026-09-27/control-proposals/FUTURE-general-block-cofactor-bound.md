# Unreviewed controller generalization for the midpoint

For finite blocks of sizes r_i>=1, take polynomials F_i of degree<=r_i with f_i(t)>=choose(r_i,t) for0<=t<=r_i. Set M=sum r_i, H=product F_i. A uniform k-subset of the disjoint union,0<=k<=M, has block counts K_i. Define w_i(t)=f_i(t)/choose(r_i,t)>=1. Ordinary coefficient convolution gives the exact identity
H[k]/choose(M,k)=E product_i w_i(K_i).
The distribution of (K_i) is multivariate hypergeometric, not independent. Expansion by count vectors gives its weights product_i choose(r_i,t_i)/choose(M,k) when sum t_i=k.

Finite Jensen and log w>=2(w-1)/(w+1) for w>=1 give
H[k]>=choose(M,k) exp(y)>=choose(M,k) E_d(y),
y=sum_i sum_(t=0)^r_i [choose(r_i,t) choose(M-r_i,k-t)/choose(M,k)] * 2(f_i(t)-choose(r_i,t))/(f_i(t)+choose(r_i,t)).
Every binomial with a negative lower index is INTEGER-zero-extended. Denominators for0<=t<=r_i are positive. For F_i=L^(r_i)+z this reduces exactly to the accepted singleton occupancy exponent. This is a proposed general coefficient lemma, not a proof about selectors, actual parent descent, or the arbitrary-tree aggregate. It needs independent identity/proof review before any registration or dispatch.

Useful graph specialization (also unreviewed here): if a graph H_i has independence number r_i, fix one maximum independent set. Its subsets show I(H_i)[t]>=choose(r_i,t). If it has any vertex outside that maximum set, an additional singleton gives I(H_i)>=L^(r_i)+z coefficientwise. Thus the existing star cofactor lower bound may transfer to more general component factors with the same independence numbers, provided the application separately proves its rank band and marked-factor/deletion identities. The latter are real missing hypotheses and must not be assumed from coefficient domination. The generic Jensen identity alone does not produce a useful surplus estimate or solve993.

Potential value: formalize a reusable finite-convolution/weighted-subset bridge, then seek structural lower bounds on component surplus. Avoid treating the exact identity alone as new payment progress.
