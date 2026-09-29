# C6-CT-F3 independent critique

## Scope and integrity

I reviewed all five required claims: the all-profile ULC exact-ratio tip surplus; its proposed `m >= 100` tail; the guarded individual deletion comparison; the original-multiplicity weighted tip-deck comparison; and the endpoint bridge. The 275 common-dispatch members and all six packet-listed source members match their SHA-256 manifest entries. The packet itself has no embedded expected digest. My independent replays are `cycles/cycle-6/C6-CT-F3/independent_exact_checks.py` and the two copied scripts listed below; their JSON outputs are beside them. No source or producer directory was changed, and no Lean build was run.

The tail argument is valid as an **informal universal proof restricted to `m >= 100`**, conditional on the formally verified finite-block coefficient Jensen theorem and the established order-`h` ULC and coefficient-ratio/main-product LR lemmas. The exact finite checks are corroboration only. They do not prove the missing `m=1..99` base or any all-`m` claim. No primary selected-payment or MASS result is proved anew.

## Tail audit

Write `L=1+z`, `G=1+2z`, `B_r=L^r+z`, `Q=prod B_(r_i)`, `C=GQ`, `E=zL^N`, and `U_i=G B_(r_i-1)H_i`. The target is, for every represented `i` and every integer `1<=k`, `2k<=N+2`,

`(h+1) U_i[k] C[k] + (k+1)(h-k+1) M_k(E) > 0`,

where `M_k(E)=E[k]C[k]-E[k+1]C[k-1]` and `h=1+2a_2+4a_3+7a_4`. It contains no first-descent or selector premise.

For low ranks `4k<=N+1`, expand `Q=sum_S z^s L^(N-R)`, with `s=|S|` and `R<=4s`. Cross-multiplying the normalized adjacent coefficient comparison by the positive binomial coefficients gives sign `s(N+1)-kR >= 0`. A term appearing at rank `k` adds nonnegatively. A term disappearing after `k-1` would force `N-R=k-1-s`, hence `N<=4k-4`, contrary to `N>=4k-1`. Thus `Q[k]/binom(N,k)` is nondecreasing on this band and one rank earlier when needed. Expanding `C=Q+2zQ` gives

`M_k(E)=c_(k-1)Q[k]-c_k Q[k-1] + 2(c_(k-1)Q[k-1]-c_k Q[k-2])`, `c_j=binom(N,j)`.

The first bracket follows from that normalized comparison; the second follows one rank earlier plus binomial log-concavity. At `k=1`, its zero-extended `Q[-1]` term is directly nonnegative. Since `U_i[k]C[k]>0`, the target is strictly positive.

In the complementary band, `N>=200` and `4k>N+1`. Each unmarked size-`r` block contributes

`g_r=(2r/(2r+1))*binom(N-r,k-1)/binom(N,k)`

to the Jensen exponent: for `B_r`, its only excess over the binomial floor is `1` at block count `1`, and the formal theorem's marginal gives this exact term. Direct cancellation yields `g_3/g_2=(15/14)(N-k-1)/(N-2)` and `g_4/g_3=(28/27)(N-k-2)/(N-3)`. Their being at most one is respectively equivalent to `N+13<=15k` and `N+25<=28k`, both following from `4k>N+1`, `N>=200`. Also `g_4(k+1)/g_4(k)=(k+1)(N-k-3)/(k(N-k))<=1` when `4k>=N-3`. Hence the least guarded value is at `K=floor((N+2)/2)`. For `N=2s`, `g_4(N,K)>=1/20` reduces, after clearing positive denominators, to `4s^2(s-22)+13s+240>=0`; for `N=2s+1` it reduces to `4s^2-40s-71>=0`. Both hold for `s>=100`.

The factors of `U_i` have positive block sizes `1`, `r_i-1`, and the `m-1` unmarked `r_l`, summing to `N`; this explicitly includes the size-one marked block. Each is `B_a=L^a+z` and lies coefficientwise above `binom(a,t)`. Applying the full actual-subset Jensen theorem at rank `k` gives `U_i[k]>=binom(N,k) exp(y)`, with `y>=sum_unmarked g_r >=(m-1)/20`. No independence of block counts or rank shift is used. For `a=99/20`, exact arithmetic gives `E_8(a)=2162945642595007/16384000000000>102` and `E_7(a)=88220922596671/716800000000>20`. With `t=(m-100)/20>=0`, positive Taylor coefficients give `exp(a+t)>=E_8(a+t)>=E_8(a)+tE_7(a)>102+20t=m+2`. Thus `U_i[k]>binom(N,k)(m+2)`.

For denominator clearing, the monomial-`z` coefficient lists of `(3+2z)F'-2dF` for `G,B_2,B_3,B_4` are `(4)`, `(5)`, `(6,2,3)`, `(7,6,12,4)`, all nonnegative. The product rule yields `C[k]/C[k-1]>=2(N+2-k)/(3k)>0`. Here `e=E[k]=binom(N,k-1)>0`, `b=E[k+1]/E[k]=(N+1-k)/k>0`, and the guard gives

`M_k(E)/(e C[k]) = 1-b C[k-1]/C[k] >= 1-3(N+1-k)/(2(N+2-k)) > -1/2`.

Also `h>=N+1`, so `h-k+1>0`; `lambda=(h+1)/((k+1)(h-k+1))>2/(N+4)>0`, and `b>=N/(N+2)`. Since `N<=4m`,

`lambda U_i[k]/e > 2N(m+2)/((N+4)(N+2)) >= 1/2`,

where the last inequality clears the positive denominator and reduces to `4Nm-N^2+2N-8>=2N-8>0`. Therefore `lambda U_i[k]C[k]+M_k(E)>0`; multiplying by the positive `(k+1)(h-k+1)` gives exactly the claimed strict surplus. This proves neither MASS nor the stronger occupation-payment inequality.

## Endpoint, comparisons, and scope fences

In monomial `z` coefficients, direct expansion verifies `L B_r-G B_(r-1)=z^2(L^(r-1)-1)` for each `r=2,3,4`, with right-side arrays respectively `(0,0,0,1)`, `(0,0,0,2,1)`, `(0,0,0,3,3,1)`. Thus `U_0-U_i=z^2(L^(r_i-1)-1)H_i>=0`; replacing `U_i[k]` by `U_0[k]` preserves strict surplus because the multiplying factor `(h+1)C[k]` is positive. This alone does not prove endpoint LR. Separately, the local ratios `L/G=(1,1/2,0)` and `B_(r-1)/B_r` equal `(1,2/3,0)`, `(1,3/4,1/3,0)`, `(1,4/5,1/2,1/4,0)`. Each is nonincreasing; common convolution by the positive interval log-concave cofactors preserves the cross-minor order, including zero endpoints. Combining this main-product LR with order-`h` ULC of `C` gives the curvature term at least `lambda U_0[k]C[k]`; adding `M_k(E)` proves the endpoint shifted comparison on the same guard, for `m>=100`.

Likewise, each tip main-product LR plus order-`h` ULC converts the tip surplus to `A_i[k+1]C[k-1]<=A_i[k]C[k]`. Summing these inequalities with the original positive multiplicities `r_i` against the same `C` proves the weighted-tip comparison on the tail. Endpoint selection does not follow from the weighted statement. For an actual eligible `p`, set `q=N+1`, `alpha=N+2`, `j=p-2`, and `delta=q-j`; retain `x=min{k:Delta_k P<0}` as the least strict descent using zero extension, including the terminal difference (plateaus do not count), and all three guards `x+2<=p`, `3p<2alpha+1`, `2p<=alpha`. No parent log-concavity or no-recovery assumption is used. The strict flags are evaluated at this same `p`: `e_0=1[Delta_p A_0<0]`, `e_i=1[Delta_p A_i<0]`, with `b=e_0+sum_i r_i e_i`; the selected mass is `A=sum_i r_i e_i T_i[j]` and `D_j=binom(N,j+1)-binom(N,j)`. The exact primary target remains `(delta*C[j]-(delta-1)*C[j+1])*A >= b*delta*D_j*C[j]`, which this tail review does not prove at all profiles. No selector is moved to another rank and no original tip multiplicity is collapsed. The tail covers the comparison rank when `m>=100`; the missing prefix prevents an all-profile selector/payment conclusion.

The monomial bases were checked explicitly: `B_1=(1,2)`, `B_2=(1,3,1)`, `B_3=(1,4,3,1)`, `B_4=(1,5,6,4,1)` in powers of `z`. These are not coefficient lists in powers of `L`.

C5 controls remain scoped: the `N=91,k=27` negative `E`-only minor has positive full tip `777419068009671422357461955841645743808`; the `(a_2,a_3,a_4)=(38,0,1)`, `N=80,k=77` negative is outside `2k<=N+2`; and homogeneous `r=4,m=3,k=7` has activity coefficient `-66` but full tip `2076267` and weighted tip `24915204`. None is a guarded full-target counterexample. The independent exact checks also replayed 26,601 complementary rows for `200<=N<=500`, finding the minimum `g_4=480053/8820675` at `(200,101)`; this is finite corroboration, not proof.

## Replay

Run from the admitted destination:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-CT-F3/independent_exact_checks.py
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-CT-F3/tail_constants_replay.py
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-CT-F3/f3_boundary_audit.py
```

The two producer scripts were copied into this scratch directory before execution. Their exact finite results are stored as `tail_constants_replay.json` and `f3_boundary_audit.json`; they are not universal certificates.

## Dispositions

The `m>=100` exact-ratio tail and its conditional endpoint bridge are retained as informal proofs. The registered all-`m` surplus, individual comparison, and weighted comparison are retained only in narrowed form: the tail is supported, while `m=1..99` remains unresolved in this review. Nothing here changes canonical status or evidence grade, awards Lean verification, settles the selected primary payment/MASS, or implies arbitrary-tree Erdős 993.
