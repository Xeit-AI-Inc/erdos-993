# C6-T3 search report — arities 2–12, large branch count

## Result

I independently checked the large-branch arity-2–12 candidate as an informal proof for this restricted path-plus-private-stars family. The argument gives the strict inequality `S(T,p)<0` for every eligible rank when there are `m >= 100,000,000` branches and every branch arity is in `{2,...,12}`. This is a worker-only proposed result. It does not settle the arbitrary-tree contract.

The one-branch absorption step is needed: the marked factor `F_r` is not a finite-order ULC factor for all `r<=12`, but `F_r B_s` is. My exact replay verifies all 121 factor pairs and the revised cutoff scalar. I also checked the graph identities and selector-transfer chain algebraically below. [EVIDENCE.json](EVIDENCE.json) and [independent_replay.py](independent_replay.py) contain the bounded exact arithmetic and its reproduction command.

## Family and graph formulas

Take a path `0-1-2`; at 0 attach `m` distinct centers, and at each center `i` attach `r_i` private leaves, with `2<=r_i<=12`. Write

`N = sum_i r_i`, `L=1+z`, `B_r=L^r+z`, `F_r=(L^(r-1)-1)/z`, `Q=prod_i B_(r_i)`, and `H_i=prod_(h!=i) B_(r_h)`.

The graph has `n=N+m+3`, independence number `alpha=N+2`, and its original leaves are exactly endpoint 2 and the `N` private tips. The maximum independent set excluding 0 has size `N+1`; including 0 permits all private tips and endpoint 2, giving `N+2`.

Splitting independent sets on whether they contain 0 gives the tree polynomial and deletion polynomials:

`P=(1+2z)Q+zL^(N+1)`,

`A_0=LQ+zL^N` for deletion of endpoint 2, and

`A_i=(1+2z)B_(r_i-1)H_i+zL^N` for deletion of any tip on branch `i`.

For a tip `v` on branch `i`, direct deletion of its original support (the center) and comparison with deletion of the center's original closed neighborhood gives

`q_v(z)=I(T-{v,s_v})-I(T-N[s_v])=z Z_i(z)`,

`Z_i=(1+2z)F_(r_i)H_i + ((N+1)/N)L^N`.

For endpoint 2 the corresponding difference is `q_2=zL^N`. Thus every original leaf remains a separate tag, and

`sum_v q_v=zR`, `R=sum_i r_i Z_i`.

If all leaves are selected, their full aggregate is therefore

`S(T,p)=sum_i r_i ( (Z_i)_(p-1) - (Z_i)_(p-2) )`.

These identities are direct root-split and deletion calculations; they do not merge tips that share a support.

## Curvature and finite-factor check

For a nonnegative sequence `a` of degree at most `d`, ULC of order `d` means `(a_j/C(d,j))` is log-concave. The cited convolution theorem says that convolution of ULC orders `d,e` has order `d+e`; the definition allows order above degree. Every factor used here has positive consecutive support, so the theorem's positive-sequence/approximation bridge applies. An order-`d` ULC sequence has ordinary LC margin

`a_j^2-a_(j-1)a_(j+1) >= a_j^2/(j+1)`.

For `B_r`, `2<=r<=12`, order `d=C(r,2)+1` works. The normalized inequalities reduce at rank 1 to `(r+1)^2>=2d`, at rank 2 to `2d>=r(r-1)+2`, and from rank 3 onward to the binomial-row comparison with `d>=r`. `B_1=L+z=1+2z` has order 1. `L` and `1+2z` also have order 1.

A marked main factor uses `F_r B_s` for one other branch `s`. The exact replay constructs each product and checks every normalized ULC inequality at the least order found by integer arithmetic. All 121 pairs `2<=r,s<=12` pass; the maximum computed order is 962 for `(r,s)=(12,2)`. The computed rows matched the pinned coefficient/order table. The replay also checks the factor derivative coefficient bounds and the decreasing coefficient ratios and positive initial mixed minors used below. No ULC claim about `F_r` alone is needed.

The external convolution input is Gurvits, *A short, based on the mixed volume, proof of Liggett’s theorem on the convolution of ultra-logconcave sequences*, Definition (2), Theorem 1.1, and Remark 1.2 ([arXiv:0804.1181](https://arxiv.org/abs/0804.1181)). It explicitly permits normalization order at least the sequence degree and gives convolution closure. This is an informal theorem import, not a Lean certificate.

## Uniform coefficient and minor estimates

Set `D=12` and `h=17`. For each omitted branch `i`, selecting the extra `z` term from any 17 of the other `m-1` factors gives the coefficientwise lower bound

`H_i >= C(m-1,17) z^17 L^(N-216)`.

For `s=0,1`, its rank-`j` coefficient divided by `C(N,j-s)` is exactly

`(j-s)_(17-s) (N-j+s)_(199+s) / (N)_216`.

The consecutive-ratio cross difference is

`216j-(17-s)N +(199+s)(1-s)-(17-s)s`,

which is increasing in `j` and positive for `j>=N/4` at the cutoff (and thereafter). Thus the quotient decreases on the central interval, with minimum at `J=floor(2N/3+3)`. Since `2m<=N<=12m`, each first falling-factor entry is at least `NA`, each second entry at least `NB`, where

`A=2/3-17/(2m)`, `B=1/3-202/(2m)`.

Together with `C(m-1,17)>=(m-17)^17/17!`, this bounds both ratios `C(N,j)/H_i,j` and `C(N,j-1)/H_i,j` by

`epsilon = 17! / ((m-17)^17 A^16 B^200)`.

The factor/main coefficient in each deletion or marked sequence is coefficientwise at least `H_i` (and `Q>=H_i` for endpoint deletion). The perturbation is at most `2L^N`, so its central coefficient ratio is at most `2epsilon`.

The factor derivative inequalities give neighbor ratios at most 8 for the main and common factors throughout `N/4<=j<=2N/3+3`, including the 12 needed left shifts; the binomial perturbations have adjacent ratios at most 4 (and the marked perturbation, including its multiplier `(N+1)/N<2`, is bounded by 8). The indices and denominators remain positive since `N>=2*10^8`.

For the mixed minor with `P`, write a leaf-deletion or marked sequence as `cH+b` and `P` as `gH+d`, with `H=Q` for endpoint deletion and `H=(1+2z)H_i` for a tip or `Z_i`. The ratios `c_j/g_j` are nonincreasing. Their initial minors are 1 for deletions and `(r-1)(r+4)/2>=3` for marked factors. Convolution expansion and the ULC margin of `H` give a main mixed minor at least `H_j^2/(j+1)` for deletions and `3H_j^2/(j+1)` for marked factors. Pure perturbation minors are nonnegative by binomial log-concavity.

For deletion envelopes, `c<=L^11+z`, `g<=L^12+z` yield

`a_(j+1)<=8(9^11+8)H_j`, `V_j<=(9^12+8)H_j`, `d_j<=5b_j`, and `b_(j+1)<=4b_j`.

The two potentially adverse products are therefore bounded by `C epsilon H_j^2`, where `C=76*9^11+352=2,384,960,530,636`. For marked factors, `c<=F_12` gives constant `(92*9^11+44)/3<C` after dividing by the initial minor 3. The central LC adverse terms are bounded by `128(j+1)epsilon` times the main curvature. Since `j+1<=2N/3+4<=9m`, all these LC and mixed margins are strictly positive if `9m C epsilon<1`.

At `m=100,000,000`, exact rational replay gives `A=399999949/600000000`, `B=99999697/300000000`, and `9m C epsilon = 0.013328111998270626... < 1`. For larger `m`, `m/(m-17)^17` decreases while `A,B` increase. This proves the scalar inequality uniformly for every later `m` and profile; it is not a finite profile census.

## First descent, selector, and full sum

The forest descent theorem `forest_descent_linear_bound` in the pinned R27 Lean source has hypotheses: finite vertex type, acyclicity, and `Delta_k<0`; it concludes `n<=4k`. The graph above is a finite tree, so at its first descent `x`, `n<=4x`. Since `n=N+m+3>N`, this gives `x>N/4`.

Here `alpha=N+2`; the strict alpha guard implies `p<=floor((2N+4)/3)`. Eligibility gives `x<=p-2`. Thus the crossing index and all ranks through `p` and `p-2` lie in the central interval where the LC and mixed-minor estimates apply.

At `j=x`, `P_(x+1)<P_x`. Positivity of each mixed minor with `P` forces the same strict descent at `x` for `A_0`, every `A_i`, and every `Z_i`. Their own central log-concavity carries that descent to `p` for deletions and to `p-2` for every `Z_i`. Hence every original leaf, including the endpoint and every separately tagged tip, belongs to the fixed favorable set. Consequently

`S(T,p)=sum_i r_i ( (Z_i)_(p-1)-(Z_i)_(p-2) ) < 0`.

This uses the complete selected set and full sum. It does not assume that `P` has no later recovery or that the sum `R` is log-concave.

## Scope and limitations

This proof is restricted to the displayed path-plus-private-star family, arities 2–12, and `m>=100,000,000`. The prefix below that cutoff, arbitrary ordinary trees, and any bridge to a governed-tree interpretation are outside scope. The convolution and forest-descent results are imported at their stated hypotheses. The result is an informal mathematical proof with exact finite arithmetic, not a kernel-checked theorem; the route has no authority to change claim status.
