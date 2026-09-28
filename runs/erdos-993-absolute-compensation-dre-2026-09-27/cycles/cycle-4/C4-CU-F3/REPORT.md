# C4-CU-F3 independent critique

## Scope and input integrity

I checked the 174 entries in `manifests/C4-COMMON-DISPATCH.json`; every actual byte hash matched. All four packet-listed C4-F3 members also matched their packet hashes. I reviewed the required protocol, contract, status clarification, neutral handoff and allocation, the targeted five identity entries, the predecessor structural reductions and main-mark margin, the neutral finite-block and selector materials, and only my assigned C4-F3 case. The producer audit was copied to this scratch directory before execution; replay command: `PYTHONDONTWRITEBYTECODE=1 python3 producer_audit_finite_blocks.py`.

## General finite-block Jensen claim

Retain `C4-F3-GENERAL-FINITE-BLOCK-JENSEN` at its abstract coefficient scope. For a uniform `k`-subset of disjoint blocks of sizes `r_i`, the count vector has mass `prod_i binom(r_i,t_i)/binom(M,k)` on `sum t_i=k`. With `w_i(t)=f_i(t)/binom(r_i,t)>=1`, direct expansion gives `H[k]/binom(M,k)=E prod_i w_i(K_i)`. Jensen for the exponential gives a lower bound `exp(E sum_i log w_i(K_i))`; only marginal hypergeometric probabilities are needed, not independence. The scalar step is correctly directed: for `w>=1`, `g(w)=log(w)-2(w-1)/(w+1)` has `g(1)=0` and `g'(w)=(w-1)^2/(w(w+1)^2)>=0`. Thus `E log w_i >= E[2(w_i-1)/(w_i+1)]`, producing the stated `y_k`. Since `y_k>=0`, every finite Taylor sum `E_d(y_k)` is at most `exp(y_k)`.

All divisions use positive quantities on `0<=k<=M`: `binom(M,k)>0`, `binom(r_i,t)>0` for `0<=t<=r_i`, and `f_i(t)+binom(r_i,t)>0`. Out-of-range binomial terms are zero-extended. Empty family is the separate `M=k=0` case and yields `H[0]=1,y=0`. Size-one blocks and `k=0,M` are valid. I replayed the producer's 17 exact-rational examples after copying its script; these are checks, not the universal proof. The path-star specialization uses the monomial coefficients of `GF_2,GF_3,GF_4`: `(1,2)`, `(2,5,2)`, `(3,9,7,2)`. For example `F_3=1+L=2+z`, so `GF_3=(1+2z)(2+z)=2+5z+2z^2`; the vector `(2,5,2)` is not a coefficient vector in powers of `L`.

Retain `E993-PATH-STAR-ARITY-2-4-OCCUPANCY-JENSEN-COFACTOR` at the same limited scope: for `B_r=L^r+z`, the weight ratio is `1+1/r` exactly at block count one and is `1` elsewhere. Its zero-extended coefficient floor may be convolved with nonnegative `GF_r` coefficients. This does not authorize an in-range probability division outside `0<=k<=M` or any selector/payment inference.

## Graph-component bridge

Retain-narrow `C4-F3-GRAPH-COMPONENT-COEFFICIENT-BRIDGE`. If a graph factor has independence number `r`, subsets of a fixed maximum independent set give `I(G)[t]>=binom(r,t)`. If a vertex lies outside that set, its singleton is an additional degree-one independent set, giving `I(G)[1]>=r+1` and hence coefficientwise `I(G)>=L^r+z`; all other degrees already have the subset lower bound. This is a valid coefficient floor for `r>=1`; at `r=0` the outside-vertex premise cannot hold.

The graph step ends at coefficient domination. A larger-graph application still must prove disjoint-component factorization separately for the parent and every marked deletion, and must establish the marked factor/deletion identity and degree correspondence. It does not transfer the actual least strict zero-extended parent descent `x` (including terminal differences and flats), any of `x+2<=p`, `3p<2(N+2)+1`, `2p<=N+2`, or the strict current-`p` flags `e_0=1[Delta_p A_0<0]`, `e_i=1[Delta_p A_i<0]`. Nor can it replace original private-tip multiplicities `r_i`. The proposed bridge is acceptable only with those obligations left explicit.

## Guarded shifted comparisons

Both `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-INDIVIDUAL-DELETION-LR` and `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR` remain open. I independently built the polynomials in monomial `z` basis from `L=1+z`, `G=1+2z`, `B_r=L^r+z`, and the displayed `A_i` formula. The audit checks the exact signed margin

`A[k] C[k] - A[k+1] C[k-1]`,

so nonnegative means exactly the claimed direction. It checks every guarded rank `1<=k<=floor((N+2)/2)` for all arity-count profiles with `1<=m<=8` (1,614 profile/rank rows), endpoint deletion, represented tip deletion, and `W=sum_i r_i A_i`. The smallest margins in this finite sweep are positive: endpoint `19`, tip `9`, weighted deck `18`; representative `(2,3)` profile interior/boundary margins are in `shifted_lr_independent_audit.json`. This is bounded evidence only; it proves neither candidate universally and supplies no guarded counterexample. The known `n=122`, `(38,0,1)`, `k=77` failure is outside this guard (`2k>N+2`) and cannot refute either candidate.

The proposed route from either comparison to strict selection has a valid conditional sign chain, but it does not prove the comparison. At an actual eligible lower-half `p`, preserve the actual first strict descent `x`; the source argument that the parent binomial summand is rising at `x` gives `Delta_x C<0`. Positive-interval log-concavity of `C` then makes `C[p]/C[p-1] <= C[x+1]/C[x] < 1`, since `p>=x+2`. Applying the proposed inequality at `k=p` and dividing by the positive `C[p-1]` gives `A_v[p+1] <= A_v[p] C[p]/C[p-1]`; with `A_v[p]>0`, this is strict. A negative multiplier would reverse an inequality, but no negative factor occurs in this step. For the weighted deck the same argument makes `W[p+1]<W[p]`; because `W=sum_i r_i A_i` uses positive original `r_i`, at least one represented branch has `Delta_p A_i<0`. That is not selection of every tip or of the endpoint. Any payment composition must still apply a branchwise bound at the exact actual eligible row and preserve all original multiplicities and rank guards.

Replay: `PYTHONDONTWRITEBYTECODE=1 python3 shifted_lr_independent_audit.py`.

## Evidence grade and limits

The finite-block Jensen theorem above has an informal universal argument and bounded exact replay, not a Lean award from this critique. The two shifted comparisons have only bounded support here. I make no new universal selector, MASS, exact-ratio payment, or arbitrary-tree claim. The exact-ratio selected payment remains at its existing computer-assisted/nonformal grade; no governed formal stop is established.
