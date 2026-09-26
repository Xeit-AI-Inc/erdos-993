# C5-AU neutral adjudication of the six U routes

This is a proposed worker adjudication, not an authoritative award. I checked all 66 C5-AU case pins and 237 C5-COMMON pins by SHA-256. I read the common `read_first` controls, six U routes, both cross-orientation critics of each route, and the permitted controller appendices. The ten covered source claim IDs below are exactly the union of the six route `RETURN.json` claims. Critics are evidence, not votes. All conclusions use the registered ordinary-tree definition, original leaf tags and supports, fixed strict selector, and integer zero extension.

Write `a=alpha(T)`, `x=x(T)`, `k=p-1`, `F=F(T,p)`. For each original leaf `v`, let `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\{v}`, `R_v=H_v-W_v=T-N_T[s_v]`, and `q_v(j)=i_j(H_v)-i_j(R_v)`. The target is `S=sum_(v in F)(q_v(k+1)-q_v(k))<=0`, under `x+2<=p` and `3p<2a+1`. The latter implies `p<=a`; hence `1<=k<=a-1`, and the contract's `alpha(H_v)=a-1` applies. Each selected original leaf remains a separate summand even when supports coincide. Neither a positive local term nor a finite negative census decides the universal target.

## U1: coefficient transfer and the corrected finite `T_m` check

**`C5-U1.coefficient-window`: retained_narrowed.** For finite coefficient sequences with zero extension, write `G(z)=sum_r c_r z^r` to avoid the source's collision of the names of `G`'s coefficients and `g`. If `f=Gg+e`, subtraction of adjacent convolution coefficients gives

`Delta_p f = sum_r c_r Delta_(p-r) g + Delta_p e`.

If the weighted sum `M=sum_r c_r Delta_(p-r)g` is negative and `|Delta_p e|<-M`, then `Delta_p f<0`. This is an exact conditional test. Central-only log-concavity or knowledge of a first descent does not supply signs at every shifted rank in the window, and no no-recovery or crossing-minor bridge was proved. It yields no infinite `T_m` or general-tree conclusion.

**`C5-U1.Tm-bounded`: retained_narrowed.** Let `T_m` be path `0-1-2` with `m` three-tip claw centers adjacent to `0`; its original leaves are `3m` tips and endpoint `2`. Set `A=(1+z)^3+z`, `B=(1+z)^3`, `C=(1+z)^2+z`. Direct root conditioning gives

`I(T_m)=(1+2z)A^m+z(1+z)B^m`;

`I(T_m-v_tip)=(1+2z)A^(m-1)C+z(1+z)^3 B^(m-1)`;

`I(T_m-2)=(1+z)A^m+zB^m`.

The source used `z(1+z)^2B^(m-1)` in the tip-deletion formula. In the root-selected case vertex `2` and the two remaining tips are isolated, so the exponent is **3**. The source `EVIDENCE.json` has wrong selector magnitudes. The critic's file named `CORRECTED-EVIDENCE.json` retains a wrong *formula label* in its metadata, but its script and numerical rows use the corrected exponent; its separate `AUDIT-EVIDENCE.json` states the correct formula explicitly. `C5-CF-U1`'s graph verification checked selector signs and sums but did not compare all selector magnitudes, as its controller replay-scope appendix clarifies.

For the full summands, the correct polynomials are `H_tip=(1+z)^2((1+2z)A^(m-1)+z(1+z)B^(m-1))`, `R_tip=(1+2z)A^(m-1)`, `H_2=A^m+zB^m`, and `R_2=A^m`. The scratch `replay_u1.py` independently recomputes, with exact integers, `a=deg I(T_m)=3m+2`, `x` through the terminal zero-extended descent, every rank satisfying both guards, both original leaf-orbit selector differences, and `S` with multiplicities `3m` and `1`. It checks its results row by row against the critic's corrected audit rows. For `m=1,2` there is no eligible rank; for `m=3,...,40` there are 427 eligible `(m,p)` rows. Of 854 orbit/rank selector values, 417 change under the corrected polynomial, none changes strict sign, and all 427 corrected full sums are strictly negative. The exact rows are in this adjudication's `EVIDENCE.json`; rerun with the prescribed Python executable from the workspace root. This is a bounded result for precisely `m<=40`, not the all-`m` analytic candidate or arbitrary trees.

## U2: uniform coefficient bound

**`C5-U2.STAR-PRODUCT-COEFFICIENT-BOUND`: retained.** Let `m>=1`, `r_i in {2,3,4}`, `N=sum_i r_i`, `L=1+z`, and `Q=product_i(L^(r_i)+z)`. For every integer `h>=0` with `4h<=N`, choosing the extra `z` in each `h`-subset `S` gives the nonnegative term `z^h L^(N-sum_(i in S)r_i)`. Its exponent is at least `N-4h`, so coefficientwise

`Q >= binom(m,h) z^h L^(N-4h)`.

The subset count is valid because `N<=4m` implies `h<=m`. At `h=1`, for `N>=12` and `1<=j<=floor(2N/3)`, `Q_j>=m binom(N-4,j-1)>0`. With `b=j-1`,

`binom(N+1,b)/binom(N-4,b)=product_(s=1)^5 (N-4+s)/(N-j-3+s)<=24^5`:

each numerator is at most `2N`, and each denominator at least `N-j-2>=N/3-2>=N/12`. Thus `[z^j](zL^(N+1))/Q_j<=24^5/m`. This is a product-coefficient theorem on its stated domain. It gives no coefficient-difference or curvature sign, no mixed minor, and no graph/deletion/selector bridge. A putative degree-`N+2` candidate can have lower-region ranks as high as `floor((2N+4)/3)`, beyond the estimate's `floor(2N/3)` endpoint.

## U3: tagged incidence and Hall orientation

**`C5-U3-ALT-CUT`: retained as an exact structural lemma, with a narrow application scope.** For each *fixed selected leaf*, form the incidence graph from marked independent `k`-sets `A` in `H_v` to marked independent `(k+1)`-sets `J`, with inclusion edges. A left degree is actual addability `e(A)`. A singly marked upper set has `k` marked-preserving deletions; a multiply marked one has `k+1`. Consequently `E_v=sum_A e(A)=kU_v+C_v`, where `U_v=q_v(k+1)` and `C_v` counts each multiply marked upper set once. This remains per original leaf tag. In an arbitrary finite bipartite graph with a maximum matching, alternate from a set `S` of unmatched **left** vertices by nonmatching left-to-right edges and matching right-to-left edges. The reached sets `X,Y` satisfy `N(X)=Y`; every reached right vertex is matched and its partner is exactly in `X\S`. Therefore `|X|-|N(X)|=|S|`. This diagnoses inability to saturate the left side. The desired primary transport would pay upper-set demand, so the displayed left-start Hall defect requires a separate orientation and weighted-capacity bridge before it could serve that purpose.

**`C5-U3-PRIMARY-GAP`: retained_narrowed to a proof audit.** Sum over the fixed `F`; put `Q=sum q_v(k)`, `U=sum q_v(k+1)`, `C=sum C_v`, and `D=sum_A(2(a-1-k)-e(A))`. The two color classes of addable vertices each have size at most `a-1-k`, so `D>=0`. The exact identities yield `S=U-Q` and

`kS=E-C-kQ=(2a+1-3p)Q-D-C`.

The strict lower-region coefficient is positive. This route's unweighted Hall lemma proves no required lower bound `D+C>=(2a+1-3p)Q`, and it builds no map from first descent or the leaf selector to weighted cuts. That is a gap in this route, not a claim that no future method can prove the bound. The route also said T22 graph data were unavailable; the permitted common inputs include the `t_family(22)` recipe and pinned T22 controls. No T22 instance or compensation was actually checked. This access correction does not supply the missing weighted estimate.

## U4: rank-local selector interface

**`C5-U4-LEMMA-1`: retained.** Partition independent sets according to whether an original leaf `v` is included: `I_T=I_(T-v)+zI_(T-{v,s_v})`. Taking adjacent coefficients under zero extension gives `Delta_j(T)=Delta_j(T-v)+Delta_(j-1)(T-{v,s_v})` for every integer `j`. At `j=x(T)`, a negative sum forces at least one term negative, independently for each original leaf. It gives no sign at `p>=x+2`. The source's `K_(1,3)` example has vector `(1,4,3,1)`, `x=1`, and after leaf deletion `(1,3,1)` with `Delta_3=0`; its proposed `p=3` fails `3p<2a+1` (`9<7` is false). It refutes only the unguarded later-rank implication. The cited specialized literature is not used as a premise here.

## U5 and U6: star sector, shell signs, and universal status

**`C5-U5.support-star-sector`: retained, with proof corrections.** The source's sentence `kS=sum_v(q_v(k+1)-q_v(k))` has an extra `k`; the definition gives `S=sum_v(q_v(k+1)-q_v(k))`. Its weaker displayed rank inequality also does not by itself establish the binomial ratio sign. The corrected proof is below, and its exact star-sector conclusion survives. This is the complete cut for the realized all-marked edgeless sector; it does not extend to a mixed marked/unmarked forest.

**`C5-U6-MARKED-SHELL-REDUCTION`: rejected as stated; corrected identity carried separately.** Fix an order on `W_v` and define `G_w=H_v-(W_{<w} union N_(H_v)[w])`. Each marked independent `j`-set has a unique earliest mark, yielding `q_j=sum_w i_(j-1)(G_w)`. Hence the correct difference is **`q_j-q_(j-1)=+sum_w Delta_(j-2)(G_w)`**. The target summand is `+sum_w Delta_(p-2)(G_w)`. Also `I(T-v)=I(H_v)+zI(R_v)`, so the strict selector is

`Delta_p(T-v)=+sum_w Delta_(p-1)(G_w)+i_(p+1)(R_v)-i_(p-1)(R_v)<0`.

Both source shell-sum signs were negative, contradicting direct subtraction. For a minimal check, take `H=K_1`, `W=V(H)`, `R` empty and `j=2`: `q_2-q_1=-1`, while the sole `Delta_0(G_w)=-1`. The correct plus sign gives equality. The rank gates remain distinct: the target samples `Delta_(p-2)`, selector samples `Delta_(p-1)` plus a two-rank residual. At `p=6`, these are ranks 4 and 5 plus `i_7(R)-i_5(R)`. The corrected identity is a decomposition, not a sign theorem.

**`C5-U6-STAR-LOWER-REGION`: retained.** For `T=K_(1,m)`, `m>=4`, `a=m`, and `i(T)=(1,m+1,binom(m,2),...,binom(m,m))` with zero extension. `Delta_0=m>0`, `Delta_1=binom(m,2)-(m+1)>0`, and for `j>=2` the binomial ratio gives first strict descent `x=ceil(m/2)`; the terminal difference `Delta_m=-1` is included. The exact two guards are equivalent to

`ceil(3p/2)<=m<=2p-4`.

This integer window is nonempty precisely for `p>=8`; no star at `p=6,7` is eligible. For every pair in it, `T-v=K_(1,m-1)` for each original leaf, and `Delta_p(T-v)=binom(m-1,p+1)-binom(m-1,p)<0`. In fact the window gives `p>=8`, `p<m-1`, and `m<=2p-4`, so these are ordinary decreasing binomial-tail differences. Thus **all `m` original leaves are selected**. For each one, `H_v=(m-1)K_1`, `R_v` is empty, and the summand is `binom(m-1,p)-binom(m-1,p-1)<0` because `m<=2p-4<2p`. The complete tagged sum is

`S(K_(1,m),p)=m[binom(m-1,p)-binom(m-1,p-1)]<0`.

This proves U5's stated `d>=12` sector, since the first eligible star has `m=12,p=8`; the U6 statement gives its exact window. It is independent of U6's wrong shell signs. The optional boundary count for each tag is `Q=binom(m-1,k)`, `E=(m-1-k)Q`, `C=U=binom(m-1,k+1)`, so `E=kU+C` by the binomial identity. The source U5 factor typo must not be propagated.

**`C5-U6-PRIMARY-STATUS`: retained as this route's open conclusion.** The star proof is restricted; the corrected first-mark identity gives no across-tag inequality. Neither the six routes nor their critics furnish an arbitrary-tree proof or a complete eligible positive-sum counterexample. The registered primary therefore remains OPEN on this adjudication's evidence, subject to controller decision. No formal proof, universal selector propagation, general marked-shell sign, all-`m` `T_m` proof, or general heterogeneous extension follows here.

## Evidence and limits for synthesis

The ten covered dispositions are: U1 window retained_narrowed; U1 finite `T_m` retained_narrowed; U2 retained; U3 incidence retained; U3 route-gap retained_narrowed; U4 retained; U5 retained with corrected proof; U6 marked-shell rejected as stated; U6 star retained; U6 primary-open statement retained. The corrected shell identity is a separate derived claim. `EVIDENCE.json` and `replay_u1.py` are self-contained finite evidence; the algebraic proofs and exact scopes above are self-contained for the remaining claims. The primary's missing bridge is a bound for the **complete fixed selected sum**, e.g. `D+C>=(2a+1-3p)Q`, using first descent and each actual strict leaf selector. A generic Hall cut, local star result, coefficient lower bound, or corrected shell decomposition does not supply it. No authoritative registry status is changed.
