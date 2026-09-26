# C6-F3 search report

## Scope and disposition

This route attacks the registered arity-12 path-plus-private-star family only: the tree has path `0-1-2`, `m >= 100000000` centers adjacent to `0`, and center `i` has `r_i` private leaves with `2 <= r_i <= 12`. The selector is the exact strict original-leaf selector, with all original leaf tags retained. I found no counterexample or decisive defect in the assigned factor-curvature and leaf-polynomial bridges. The proposed restricted family claim remains `proposed_open`: this review does not establish the complete infinite-family theorem or promote its informal proof to an award.

The packet hashes matched for all 237 common pinned sources. The case packet lists no additional worker files. The standalone replay in `REPLAY.py` reproduces the exact factor and cutoff arithmetic summarized in `EVIDENCE.json`.

## Grouped finite-ULC factors

Write `L=1+z`, `B_r=L^r+z`, and `F_r=(L^(r-1)-1)/z`. `F_r` alone is not a valid closure input for every assigned arity; the proposed grouping is `F_(r_i) B_(r_h)` with `h != i`. There is such a second branch since `m >= 10^8`.

I independently rebuilt the coefficients and least valid finite-ULC order for all 121 products `F_r B_s`, `2 <= r,s <= 12`, and checked every normalized inequality exactly. They all pass. The largest recorded order is 962 at `(r,s)=(12,2)`, although that polynomial has degree 12. This is permitted: Gurvits defines ULC of order `d` for a sequence of degree at most `d` and proves convolution closure with the orders added (Definition (2), Theorem 1.1, and Remark 1.2, [arXiv:0804.1181](https://arxiv.org/abs/0804.1181)). Every factor here has positive coefficients throughout its support, so the theorem's positive-sequence formulation applies directly. The remaining `B_r` factors have order `binom(r,2)+1`; `B_1=1+2z` has order 1. Thus the grouped product has the finite ULC curvature claimed by the candidate, without assuming `F_r` alone is ULC.

For an order-`d` ULC sequence `a`, its normalized inequality gives `a_(j-1) a_(j+1) <= j/(j+1) * a_j^2`, hence ordinary LC margin at least `a_j^2/(j+1)` at interior ranks. This justifies the candidate's use of grouped finite ULC as a source of central ordinary curvature; order need not equal degree.

## Mixed minors and selector transfer

The small factor ratios in the candidate are consistent with direct coefficient calculation. For the endpoint deletion, `L/(1+2z)` has ratios `1, 1/2`. For a tip deletion, `B_(r-1)/B_r` has ratios `1`, `r/(r+1)`, then `(r-j)/r` for `j >= 2`. For the marked tip factor, `F_r/B_r` has ratios `r-1`, `binom(r-1,2)/(r+1)`, then `(r-j)(r-j-1)/(r(j+1))` for `j >= 2`, with zero extension. Each is nonincreasing for `2 <= r <= 12`. The initial cross-minors are `1` for deletion and `(r-1)(r+4)/2 >= 3` for the marked factor. These support the proposed common-factor mixed-minor expansions when their common convolution factor is LC.

For rank control, the unperturbed polynomial is `M=(1+2z) Q`, `Q=prod_i B_(r_i)`, of degree `N+1`, where `N=sum_i r_i`. The coefficient derivative inequalities for `B_r` and `1+2z` imply `(j+1) M_(j+1) >= (N+1-j) M_j/2`. Thus `M` is strictly increasing for `j <= N/4`; the perturbation `z L^(N+1)` is also increasing there. Consequently the first strict descent of `P=M+zL^(N+1)` satisfies `x > N/4`. The strict alpha guard gives `p <= floor((2N+4)/3)`. Subject to the candidate's central LC and positive mixed-minor bounds, a positive `A_j P_(j+1)-A_(j+1)P_j` at `j=x` transfers `Delta_x(P)<0` to `Delta_x(A)<0`; LC of `A` then keeps all later differences negative. This is the needed strict-selector implication for each deletion polynomial, not a pointwise sign shortcut.

## Polynomial-to-leaf fidelity

The formulas preserve the original graph and every tag. Root exclusion/inclusion gives

`P=(1+2z) Q + z L^(N+1)`,

`A_0=LQ+zL^N` for deletion of endpoint leaf 2, and

`A_i=(1+2z) B_(r_i-1) H_i+zL^N`, where `H_i=prod_(h!=i) B_(r_h)`, for deletion of any tip in branch `i`.

The original support of endpoint 2 is vertex 1; its marked difference polynomial is `zL^N`. A branch tip has its original center as support. Deleting that tip and center gives `(1+2z)L^(r_i-1)H_i+zL^N`; deleting the center's original closed neighborhood gives `(1+2z)H_i`. Their difference is

`q_i=z[(1+2z)F_(r_i)H_i+L^N]`.

There are `r_i` distinct tip tags with this polynomial, plus the endpoint tag. Therefore the full marked polynomial is `sum_v q_v=zR`, where

`R=(N+1)L^N+(1+2z)sum_i r_i F_(r_i)H_i=sum_i r_i Z_i`,

`Z_i=(1+2z)F_(r_i)H_i+((N+1)/N)L^N`.

For each favorable original leaf the summand is `Delta_(p-1)(q_v)=Delta_(p-2)(Z_i)` for a tip, and the analogous endpoint contribution. If all deletion sequences are strictly descending at eligible `p`, the selector is the complete set of `N+1` original tags, and the candidate's reduction of the full sum to `sum_i r_i Delta_(p-2)(Z_i)` is exact. It neither drops the endpoint nor collapses same-center tips.

## Exact arithmetic and limits of this review

`REPLAY.py` checks all 121 grouped products and least finite-ULC orders by exact integer inequalities, including the degree-12/order-962 case. It also reconstructs the cutoff values `D=12`, `h=17`, `m=100000000`, `C=2384960530636` and exact `9mC epsilon < 1` (decimal `0.013328111998270626`). This confirms the pinned finite factor table and cutoff scalar, not the full asymptotic proof.

I did not independently certify every coefficientwise envelope and every shifted-index bound in the candidate's global mixed-minor perturbation estimate, nor write a formal proof of the convolution-minor expansion from scratch. Those steps, together with the infinite monotonicity argument for the cutoff ratio and all-profile perturbation control, remain the main proof obligations for an independent full-family resolution. I found no specific false inequality in those uncompleted checks. The limited review is not evidence that an unreviewed step is absent or defective. No arbitrary-tree conclusion, finite-prefix coverage, or controller status award follows.
