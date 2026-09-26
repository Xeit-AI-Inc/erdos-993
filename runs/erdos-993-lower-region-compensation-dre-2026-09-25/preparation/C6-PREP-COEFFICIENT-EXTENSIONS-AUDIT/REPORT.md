# C6 preparatory coefficient-extensions audit

**Disposition.** Both proposed extensions survive this independent audit at their stated scopes. The `T_m` cutoff-400 argument is an improved proof route for the already registered all-`m` family claim. The heterogeneous path-plus-star argument proves a genuinely new restricted infinite family: arities in `{2,3,4}`, `m >= 100000`, and every eligible strict lower-region rank. Neither result resolves the arbitrary-tree primary claim. The `T_m` finite base is exact, replayable Python evidence, not a Lean certificate. This is an independent preparatory assessment, not a status award.

All 23 files listed in `control/C6-PREP-COEFFICIENT-EXTENSIONS-AUDIT.json` matched their SHA-256 pins before review. `RESULTS.json` records every pin and the independent replay checks. I read no unlisted local source. The sole external source was the primary [Gurvits proof of Liggett's convolution theorem](https://arxiv.org/pdf/0804.1181), Theorem 1.1. It defines ULC(`d`) for a nonnegative sequence of degree at most `d` through log-concavity of `a_j/binom(d,j)` and states ULC(`l`) convolved with ULC(`d`) is ULC(`l+d`). Trailing zero extension is admissible for the factors whose order exceeds their degree. Positivity on their actual interval supports and the theorem's nonnegativity hypothesis are satisfied. If `a` is ULC(`d`), then

`a_(j-1)a_(j+1) <= [j(d-j)/((j+1)(d-j+1))] a_j^2 <= [j/(j+1)]a_j^2`.

Thus every factored main coefficient sequence used below has ordinary LC margin at least `a_j^2/(j+1)`. This is the precise imported fact; the proof does not assume that sums of the main and perturbation sequences, or mixtures of marked branches, inherit ULC.

## The `T_m` cutoff-400 proof

Set `N=3m`, `L=1+z`, `B=L^3+z`, and use the pinned graph polynomials

`P=(1+2z)B^m+zL^(N+1)`, `A0=LB^m+zL^N`,
`Astar=(1+2z)(1+3z+z^2)B^(m-1)+zL^N`,
`R=3m(2+5z+2z^2)B^(m-1)+(3m+1)L^N`.

The separate literal graph check in `REPLAY.py` covers all original leaf tags for `m=1,2,3` via heterogeneous profiles `(3)`, `(3,3)`, `(3,3,3)`, and agrees with these polynomials. The original leaves are endpoint 2 and the `3m` private tips. The graph has `n=4m+3`, `alpha=3m+2`; the endpoint and tip deletion polynomials are `A0,Astar`, and the sum of all tagged `q_v` is `zR`.

For `h=17`, the selected term of `B^(m-1)` is `binom(m-1,17) z^17 L^(N-54)`. For `s=0,1` and `m <= j <= 2m+2`, the quotient against `binom(N,j-s)` is exactly

`f_s(j)=(j-s)_(17-s)(N-j+s)_(37+s)/(N)_54`.

Every falling-factorial index and factor is positive for `m>=400`, including at both endpoints. The consecutive ratio is

`f_s(j+1)/f_s(j)=[(j-s+1)/(j-16)] [(N-j-37)/(N-j+s)]`.

It is at most 1 exactly when `(17-s)(N-j+s) <= (37+s)(j-s+1)`. At `j=m` this holds for both `s`: for `s=0`, `34m<=37m+37`; for `s=1`, `32m+16<=38m`. The left side decreases and right side increases with `j`, so the minimum is at `j=2m+2`. There each of the first `17-s` factors is at least `2m-14`, each of the second `37+s` factors is at least `m-38`. For `s=0`, one surplus first factor can be bounded by `m-39`; for `s=1` there are already 38 second factors. Consequently both cases have the common lower product `(2m-14)^16(m-39)^38`. With `binom(m-1,17)>=(m-17)^17/17!` and `(N)_54<=(3m)^54`, the perturbation-to-main coefficient ratio is bounded by

`E(m)=17!(3m)^54/[(m-17)^17(2m-14)^16(m-39)^38]`.

This applies to the three LC main/perturbation splits and every common `H` in the mixed minors, because each main coefficient has the stated coefficientwise `B^(m-1)` lower bound with perturbation scalar ratio at most one. Factor differentiation gives the neighbor ratios used by the pinned proof. In particular, the largest backward `H` ratio at the upper central endpoint is at most `(3/2)(2m+2)/(m-4)<=4` for `m>=19`; forward main ratios are at most 4 and binomial perturbation ratios at most 3 for `m>=5`. All shifted indices through four steps stay inside positive support at `m>=400`. Hence the pinned adverse constants `24,47,431,14688/21` remain valid. The mixed-minor main term uses the nonnegative Cauchy-Binet convolution expansion with `0,1` coefficient minors `1,1,21m`; the pure perturbation minors are nonnegative by binomial LC. No sign assumption on the full cross terms is needed.

At `m=400`, independent exact rational calculation gives the four values `C(2m+3)E(m)` approximately `0.00484584`, `0.00948977`, `0.08702320`, and `0.14122161`, all strictly below 1. The exact numerators and denominator appear in `REPLAY-RESULTS.json`. Writing `E(m)=K(m)/m^17`, each normalized denominator factor `1-17/m`, `2-14/m`, `1-39/m` increases for `m>=400`; hence `K(m)` decreases. Also `(2m+3)/m^17` decreases. The cutoff therefore covers every integer `m>=400` and every central rank, including `j=m` and `j=2m+2`.

For the remaining `m=3..399`, my independent implementation obtains powers by iterative multiplication by `B`, rather than the pinned recurrence or producer import. It checks **242,964 positive central LC margins and 242,964 positive mixed minors**. Their SHA-256 streams are respectively `f9091121f369d93d9e7abb54d614b61a780bda3f8e265459211eacdc76376a47` and `174a521a64a40f1ed0485b863748ac32db7bbb4a35664e6bbfc607a83dc454a7`, exactly matching the pinned cutoff probe. The minima are `1210` and `1243`, both at `(m,Z,j)=(3,Astar,8)`. The replay separately checks all `44,105` eligible `(m,p)` rows for `m<=399`: both deletion orbits are favorable and the complete marked sum is negative. Direct `m=1,2` coefficients give first descents `2,4`, leaving no eligible `p`.

The selector bridge is unchanged and sound. The pinned R27 forest order theorem gives `4m+3<=4x`, so an eligible `m>=3` has `m+1<=x<=p-2<=2m-1` from `p<=2m+1`. At `j=x`, the positive mixed minor and `P_(x+1)<P_x` force the strict descent of each `A0,Astar,R`. Their strict central LC propagates that descent through deletion rank `p` and marked rank `p-2`. Therefore every original leaf is selected, with its own tag, and `S(T_m,p)=R_(p-1)-R_(p-2)<0`.

## Heterogeneous arities 2–4, `m>=100000`

Let the branch arities be `r_i` and `N=sum_i r_i`. Literal mask enumeration for `(2)`, `(3)`, `(4)`, `(3,3)`, `(3,3,3)`, `(2,4)`, and `(2,3,4)` independently checked every original leaf, deletion polynomial, individual marked difference, and full tagged sum. The graph has `n=N+m+3`; excluding root 0 permits at most `N+1` independent vertices, while including 0, endpoint 2, and every private leaf attains `alpha=N+2`. Endpoint 2 and the `N` private leaves are exactly the original leaves.

Root splitting gives `Q=prod_i B_(r_i)`, `H_i=prod_(h!=i)B_(r_h)`, `B_r=L^r+z`, and

`P=(1+2z)Q+zL^(N+1)`, `A0=LQ+zL^N`,
`A_i=(1+2z)B_(r_i-1)H_i+zL^N`.

For a private leaf on branch `i`, direct support deletion gives `q_v=z[(1+2z)F_(r_i)H_i+L^N]`, where `F_r=(L^(r-1)-1)/z`; the endpoint has `q_2=zL^N`. Thus with `t=(N+1)/N` and `Z_i=(1+2z)F_(r_i)H_i+tL^N`, the complete tagged polynomial is exactly `sum_v q_v=zR`, `R=sum_i r_i Z_i`. The rational term `t` accounts for the one endpoint tag: `sum_i r_i t=N+1`. It neither merges private leaves nor changes the fixed selector.

The small factors meet the finite-order ULC hypotheses: `B1` order 1, `B2` order 2, `B3` order 4, `B4` order 7, `F2` constant, `F3` order 1, `F4` order 3, and `L,1+2z` order 1. In particular `B4/binom(7,j)=(1,5/7,2/7,4/35,1/35)` has adjacent LC margins `(11/49,0,6/1225)`; `F4/binom(3,j)=(3,1,1/3)` has margin zero. Direct coefficient checks give `(1/3)(dF-zF')<=F'<=2(dF-zF')` for every nonconstant factor; `F3=2+z` is the factor that prevents the stronger `2/3` lower bound. Product differentiation preserves these inequalities. For a product of degree `D`,

`(1/3)(D-j)/(j+1) <= a_(j+1)/a_j <=2(D-j)/(j+1)`.

All main and common `H` degrees lie in `[N-3,N+1]`. On integer `N/4<=j<=2N/3+3`, with `N>=200000`, a forward ratio is below 8. A backward ratio is at most `3j/(D-j+1)<=3(2N/3+3)/(N/3-5)<=8`; the same cap applies to successive backward shifts through four steps. The perturbations `L^N,zL^N` have adjacent ratios at most 4. All coefficient positions used here and their neighbors are strictly inside positive support.

Choose eight `z` terms in any `H_i`. Since each omitted arity is at most 4, the other `L` exponent is at least `N-36`, so coefficientwise

`H_i >= binom(m-1,8) z^8 L^(N-36)`.

For `s=0,1`, the exact coefficient quotient against `binom(N,j-s)` is `(j-s)_(8-s)(N-j+s)_(28+s)/(N)_36`. Its first factors are at least `N/5`: the smallest is `j-7>=N/4-7`. Its second factors are at least `N/4`: the smallest is `N-j-27>=N/3-30`. These hold already at `N>=384`; the `s=1` factor split `(7,29)` is stronger than the uniform `(8,28)` product bound. Since `binom(m-1,8)>=(m/2)^8/8!`, for either shift and for any coefficientwise larger common `H`,

`(L^N)_j/H_j, (zL^N)_j/H_j <= epsilon=K/m^8`, `K=256*8!*640^8`.

Every LC main term is coefficientwise at least its common `H`; each perturbation is at most twice `L^N` or its shift. The two adverse LC cross products are bounded by `2(8*4)a_jb_j=64a_jb_j`. ULC curvature then makes the full LC margin positive whenever `128(j+1)epsilon<1`.

For mixed minors against `P`, take `(H,c,g)=(Q,L,1+2z)` for `A0`, and `((1+2z)H_i,B_(r_i-1),B_(r_i))` or `((1+2z)H_i,F_(r_i),B_(r_i))` for `A_i,Z_i`. Direct small-factor coefficient minors `c_r g_s-c_s g_r` are nonnegative for all `r<s` with zero extension; the `0,1` minors are respectively `1`, `1`, and `3,7,12` for marked arities `2,3,4`. The Cauchy-Binet convolution expansion is correctly oriented: its `0,1` term is that minor times `H_j^2-H_(j-1)H_(j+1)`. Every other bracket is nonnegative from LC and interval support. Thus the main mixed minor is at least `H_j^2/(j+1)` for deletion and `3H_j^2/(j+1)` for marked polynomials. The pure perturbation minor is binomial LC in the deletion cases and a positive sum of two binomial LC consequences in the marked cases.

Only `a_(j+1)d_j+b_(j+1)V_j` needs an adverse bound. For deletion, `a_(j+1)<=100H_j`, `V_j<=6569H_j`, `d_j<=5b_j`, `b_(j+1)<=4b_j`, totaling `26776 epsilon H_j^2`. For marked polynomials, the respective caps `35,6569,20,8` total `53252 epsilon H_j^2`; after division by the main-minor factor 3, this is smaller than `26776 epsilon H_j^2`. These inequalities cover the first and last central ranks, with the left shifts of at most four checked above. Accordingly all needed LC and mixed margins are positive if `26776(j+1)epsilon<1`.

Since `N<=4m`, `j+1<=2N/3+4<=3m` for `m>=12`. The uniform sufficient ratio is `80328K/m^7`; at `m=100000` it is exactly `347766182016712704/1490116119384765625 <1`, and it decreases thereafter. This is an analytic proof for every distribution of arities, rather than a census of profiles.

Finally, R27 gives `n<=4x`, hence `x>N/4`; the strict guard gives `p<=floor((2N+4)/3)`, and eligibility gives `x<=p-2`. These place the crossing rank `x` and every required propagation rank inside the proved central interval. The positive mixed minors at `x` transfer `P_(x+1)<P_x` to strict descent of each `A0,A_i,Z_i`; central strict LC propagates to `Delta_p(A0),Delta_p(A_i)<0` and `Z_i_(p-1)<Z_i_(p-2)`. Every original leaf is therefore favorable, and `S(T,p)=sum_i r_i[Z_i_(p-1)-Z_i_(p-2)]<0`.

## Scope and residual obligations

No counterexample or mathematical gap was found within either restricted claim. This report does **not** prove any profile with heterogeneous `m<100000`, any arity outside `2..4`, or the arbitrary-tree lower-region aggregate. The heterogeneous statement deserves a separate proposed identity such as `E993-ORDINARY-PATH-STAR-ARITY-2-4-M100000-LOWER-REGION-AGGREGATE`, with the exact graph, `m>=100000`, strict selector, and strict negative conclusion above. The `T_m` cutoff is evidence for the already registered `E993-ORDINARY-TM-LOWER-REGION-AGGREGATE`, not a second claim. Any kernel-level formal award would still require formalizing the imported convolution theorem and, for `T_m`, the finite enumeration or a replacement algebraic base. The controller retains all status decisions.
