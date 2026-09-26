# Independent wide-arity and identity audit

**Disposition.** Both restricted infinite-family arguments pass the audit as informal mathematical proofs: every path-plus-private-star profile with arities in `{2,3,4}` and `m>=2000`, and every such profile with arities in `{2,...,12}` and `m>=100000000`, has strictly negative complete original favorable-leaf sum at every eligible strict lower-region rank. The earlier `m>=100000`, arities `{2,3,4}` statement is subsumed. This is preparatory evidence only: no formal/kernel award, canonical write, finite-prefix coverage, or arbitrary-tree theorem is claimed. The all-`m` heterogeneous arities `{2,3,4}` claim remains an open identity even though the homogeneous arity-3 all-`m` family has a separate registered key.

All 15 source files named by `control/C6-PREP-WIDE-ARITY-IDENTITY-AUDIT.json` matched their SHA-256 pins. I used no other local source. The only external source is [Gurvits, Theorem 1.1](https://arxiv.org/pdf/0804.1181), which states that convolution of nonnegative finite-order ULC(`d`) and ULC(`e`) sequences is ULC(`d+e`). Its definition permits degree less than order, and the cited theorem applies with zero extension. An order-`d` ULC sequence has `a_(j-1)a_(j+1) <= j(d-j)/[(j+1)(d-j+1)] a_j^2 <= j/(j+1) a_j^2`; thus its central ordinary LC margin is at least `a_j^2/(j+1)`.

## Graph and selector

Write `N=sum_i r_i`, `L=1+z`, `B_r=L^r+z`, `Q=prod_i B_(r_i)`, `H_i=prod_(h!=i) B_(r_h)`, and `F_r=(L^(r-1)-1)/z`. Root exclusion/inclusion gives

`P=(1+2z)Q+zL^(N+1)`, `A0=LQ+zL^N`, `A_i=(1+2z)B_(r_i-1)H_i+zL^N`.

The graph has `n=N+m+3`, `alpha=N+2`, and exactly `N+1` original leaf tags: endpoint 2 and all private tips. For endpoint 2, the marked difference is `q_2=zL^N`. For each tip on branch `i`, direct deletion of that tip and its support, compared with the original closed-neighborhood deletion, gives `q_v=z[(1+2z)F_(r_i)H_i+L^N]`. Consequently the complete tagged polynomial is `sum_v q_v=zR`, where

`R=(N+1)L^N+(1+2z)sum_i r_i F_(r_i)H_i=sum_i r_i Z_i`, with `Z_i=(1+2z)F_(r_i)H_i+((N+1)/N)L^N`.

The rational `(N+1)/N` accounts for endpoint 2 once; it does not merge tip tags. Independent forest-DP versus formula checks covered `(2)`, `(4)`, `(12)`, `(2,3)`, `(4,6)`, and `(2,12)`, comparing every original tip's deletion and marked polynomial. Literal subset enumeration additionally checked `(2)` and `(2,3)`. Three modest profiles had eligible ranks and all original leaves selected, with complete `S` respectively `-9141`, `-2224`, `-40909`; these are checks, not the large-`m` proof.

The first-descent lower bound can be verified directly here, without importing the R27 forest bound. Every `B_r` satisfies the factor derivative lower inequality `F' >= (dF-zF')/2`; the same is true of `1+2z`. Hence `M=(1+2z)Q`, of degree `N+1`, has `M_(j+1)/M_j >= (N+1-j)/[2(j+1)]>1` for every integer `j<=N/4` when `N>4`. The other summand `zL^(N+1)` is also strictly increasing on that range. Thus `P_(j+1)>P_j` there and `x>N/4`. The strict rank guard `3p<2(N+2)+1` implies `p<=floor((2N+4)/3)`, and eligibility gives `x<=p-2`. All crossing, deletion-propagation, and marked-propagation ranks therefore lie in the stated central interval `N/4<=j<=2N/3+3`.

## Factor curvature, finite certificate, and mixed minors

For `r>=2`, `B_r` is ULC of order `d=binom(r,2)+1`. At rank 1 the normalized condition reduces to `(3r+1)d >= (r+1)^2`, valid because `d>=r`. At rank 2, where the altered coefficient `a_1=r+1` matters, it reduces exactly to `2d>=r(r-1)+2`. From rank 3 onward, the normalized consecutive ratio is `(r-j)/(d-j)`, decreasing since `d>=r`. `B_1=1+2z` has order 1. Independent exact integer arithmetic rebuilt all 121 polynomials `F_rB_s` for `2<=r,s<=12`, checked every normalized ULC inequality and the minimum valid integer order, and matched every coefficient and order in the pinned certificate. The largest order is 962 for `(r,s)=(12,2)`. This permits grouping one other branch with a marked `F_r`; `m>=2000` or `m>=100000000` supplies such a branch. No ULC claim about `F_r` alone for `r>=6` is used.

The exact adjacent derivative quotient for `F_r` is `(j+1)/(j+2)`; for `B_r` it is `(r+1)/r` at 0, `r/(r+1)` at 1, and 1 thereafter. Thus each ungrouped factor obeys `(dF-zF')/3 <=F'<=2(dF-zF')`, and products inherit this. All main degrees are in `[N-1,N+1]`; the smallest common factor degree is `N-3` for arity 4 and `N-11` for arity 12. The central forward neighbor bound 8 and backward bound 8 hold even under 4 and 12 successive left shifts respectively. For arity 12 the limiting backward expression is `3(2N/3+3)/(N/3-13)<8` at `N>=2*10^8`; all shifted indices remain positive. Binomial perturbation neighbor bounds 4, and the marked `t<=2` bound, are valid.

For the mixed main terms against `P`, the common factors are `Q` for `A0` and `(1+2z)H_i` for `A_i,Z_i`; all are finite-order ULC. The small coefficient ratios are decreasing: `L/(1+2z)` for `A0`; `B_(r-1)/B_r` for deletion, with ratios `1,r/(r+1),(r-j)/r` for `j>=2`; and `F_r/B_r` for marked, with ratios `r-1,binom(r-1,2)/(r+1),(r-j)(r-j-1)/[r(j+1)]` for `j>=2`. All zero extensions preserve order. The `0,1` coefficient minors are 1 for deletion and `(r-1)(r+4)/2>=3` for marked. The convolution minor expansion is oriented so its `0,1` term is the small minor times `H_j^2-H_(j-1)H_(j+1)`, at least `H_j^2/(j+1)`. All remaining brackets are nonnegative by LC. The pure perturbation minor is likewise nonnegative by ordinary binomial LC; only `a_(j+1)d_j+b_(j+1)V_j` needs an adverse envelope.

For arity 4, the existing envelopes give `a_(j+1)<=100H_j`, `V_j<=6569H_j`, `d_j<=5b_j`, `b_(j+1)<=4b_j`, hence deletion constant `26776`. The marked constant is `53252/3<26776` after its minor 3 is used. The LC constant is 128. For arity 12, coefficientwise `B_(r-1)<=L^11+z`, `B_r<=L^12+z`, `F_r<=F_12` yield deletion constant `C=76*9^11+352=2384960530636`; marked constant `(92*9^11+44)/3<C`, and LC constant 128 is smaller. Every main coefficient is at least its common `H_i` coefficient; `Q>=H_i` covers endpoint deletion.

## Perturbation and cutoffs

For a maximum arity `D`, choose `h` other branches' extra `z` terms in `H_i`. Coefficientwise `H_i>=binom(m-1,h) z^h L^(N-D(h+1))`. For `s=0,1`, dividing its rank-`j` coefficient by `binom(N,j-s)` gives exactly

`f_s(j)=(j-s)_(h-s)(N-j+s)_((D-1)h+D+s)/(N)_(D(h+1))`.

Its consecutive-ratio cross difference is `D(h+1)j-(h-s)N+[(D-1)h+D+s](1-s)-(h-s)s`, positive for `j>=N/4` at both cutoffs, so its minimum is at `J=floor(2N/3+3)`. Every falling-factorial entry is positive there. For `D=4,h=29,m>=2000`, the common lower bound is `A^28 B^92`, with `A=2/3-29/(2m)` and `B=1/3-95/(2m)`. For `D=12,h=17,m>=10^8`, it is `A^16 B^200`, with `A=2/3-17/(2m)` and `B=1/3-202/(2m)`. The deliberate extra `B` factor covers `s=0` since `A>B`. With `binom(m-1,h)>=(m-h)^h/h!`, both perturbations have ratio at most `epsilon=h!/[(m-h)^h A^(h-1)B^((D-1)h+D+1)]`. Independent exact endpoint checks at `N=2m` and `N=Dm`, for both shifts, confirm the lower bound and decrease.

The sufficient inequalities are `80328*m*epsilon<1` for arity 4 and `9m*C*epsilon<1` for arity 12. At their cutoffs, the exact fractions in `INDEPENDENT_EVIDENCE.json` are respectively approximately `0.00003299964639786117` and `0.013328111998270626`; each was independently reconstructed and matched the pinned arithmetic. For larger `m`, `m/(m-h)^h` decreases while `A,B` increase, so the inequalities persist for all arity profiles. Central LC of each `A0,A_i,Z_i` and its positive mixed minor with `P` force each deletion and each `Z_i` to descend after `x`. Therefore all original leaves satisfy the strict selector, and

`S(T,p)=sum_i r_i[(Z_i)_(p-1)-(Z_i)_(p-2)]<0`.

## Identity mapping

The pinned canonical snapshot has 428 claims, 96 marked REFUTED. A comparison of every claim key, statement, and scope found no registered heterogeneous path-plus-private-star aggregate. `E993-ORDINARY-TM-LOWER-REGION-AGGREGATE` is the homogeneous arity-3, all-`m` subfamily and is not the heterogeneous identity. `E993-R25-SINGLE-HUB-HALL-EQUIVALENCE` concerns a Hall condition, not this aggregate. The universal `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` and all-rank `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` remain strictly broader; the registered local-mechanism refutations do not refute this complete sum.

Suggested exact new keys, with status decisions reserved to the controller:

1. `E993-ORDINARY-PATH-STAR-ARITY-2-4-ALL-M-LOWER-REGION-AGGREGATE`: for every `m>=1`, every profile `r_i in{2,3,4}`, and every `p` with `x+2<=p`, `3p<2alpha+1`, the complete original strict-selector sum is `<=0`. **OPEN** outside the proved large-branch range; this contains the existing homogeneous `T_m` claim but is not the same claim.
2. `E993-ORDINARY-PATH-STAR-ARITY-2-4-M2000-LOWER-REGION-AGGREGATE`: same graph, selector, and rank, with `m>=2000`. The present informal argument proves the stronger `<0`. This supersedes the earlier unregistered proposed `M100000` restricted key; no separate `M100000` registration is needed.
3. `E993-ORDINARY-PATH-STAR-ARITY-2-12-M100000000-LOWER-REGION-AGGREGATE`: same graph, selector, and rank, with all `r_i in{2,...,12}`, `m>=100000000`; the present informal argument gives `<0`. It properly extends the range of arities, while the arity-4 cutoff covers far smaller `m`, so neither restricted key duplicates the other.

The full all-`m` arity-4 prefix, the arity-12 prefix below `10^8`, and arbitrary trees remain outside these proofs.
