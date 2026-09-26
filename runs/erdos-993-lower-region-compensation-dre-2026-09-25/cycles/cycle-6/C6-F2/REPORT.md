# C6-F2 search: heterogeneous cutoff 2000

## Scope and result

The assigned route is an independent attack on the proposed path-plus-star family with branch arities in `{2,3,4}` and `m >= 2000`. I found no decisive counterexample or defect in the new scalar cutoff argument. I independently checked that scalar argument exactly and checked how its rank interval would propagate through the selector, conditional on the inherited coefficient and mixed-minor estimates. This is not a proof of the heterogeneous theorem: several substantial structural estimates below remain unverified by this route.

All 237 files pinned in `packets/C6-COMMON.json` matched their listed SHA-256 values. The case packet lists no route-specific worker files. I used the F2 allocation and its named candidate/arithmetic/source-map paths, plus the pinned forest descent theorem source. The preparation audit is treated only as a source report, not as a substitute for the calculations below.

## Independent scalar check

Write `h=29`, and for a fixed omitted branch `i`, expand 29 selected `z` terms in the `m-1` factors of `H_i`. Since each omitted arity is at most 4 and the omitted branch itself has arity at most 4,

`H_i >= coefficientwise binom(m-1,29) z^29 (1+z)^(N-120)`.

For `s=0,1`, the quotient of the displayed binomial coefficient by `binom(N,j-s)` is exactly

`(j-s)_(29-s) (N-j+s)_(91+s) / (N)_120`.

Its consecutive quotient is

`[(j-s+1)/(j-28)] [(N-j-91)/(N-j+s)]`.

After cross multiplication, denominator minus numerator is

`120j-(29-s)N+(91+s)(1-s)-(29-s)s`.

This is increasing in `j`; at `j=N/4`, it equals `N+91` for `s=0` and `2N-28` for `s=1`, both positive for the present domain. Thus the quotient decreases throughout the candidate interval `N/4 <= j <= 2N/3+3`.

At its terminal integer `J=floor(2N/3+3)`, the smallest first falling-factorial factor is at least `2N/3-26`; the smallest second factor is at least `N/3-93`. Since `N>=2m`, these are at least `N A(m)` and `N B(m)`, where

`A(m)=2/3-29/(2m)`, `B(m)=1/3-95/(2m)`.

The `s=0` quotient has at least the product `A^29 B^91`; the `s=1` quotient has at least `A^28 B^92`. Since `A>B>0` for `m>=2000`, both are at least `A^28 B^92`. Also `binom(m-1,29) >= (m-29)^29/29!`. Using `(N)_120 <= N^120` gives the common perturbation ratio

`epsilon(m)=29!/((m-29)^29 A(m)^28 B(m)^92)`.

The candidate's sufficient scalar condition is `80328*m*epsilon(m)<1`. At `m=2000`, exact rational arithmetic gives approximately `0.00003299964639786117`, strictly below 1. For every `m>=2000`, `m/(m-29)^29` decreases, while `A` and `B` increase, so this scalar bound decreases. `f2_scalar_audit.py` checks the algebraic cross-product identity over 70,314 exact integer instances and the endpoint equality at 42 instances, then computes the cutoff as a `Fraction`. These sampled checks supplement the affine-in-`j` argument; they do not carry the infinite-range proof.

This verifies the sharper scalar replacement, including its monotonicity. It does not verify that the earlier proof's constants are valid under every coefficient shift or that the claimed mixed-minor estimates follow.

## Selector and complete-sum bridge, conditional on structural estimates

For this family the candidate graph has `n=N+m+3` and `alpha=N+2`. If `3p<2alpha+1`, integrality gives `p <= floor((2N+4)/3)`. Eligibility gives `x<=p-2`. The pinned forest descent bound `n<=4x` gives `x >= ceil((N+m+3)/4)>N/4`. Hence the crossing rank `x`, selector rank `p`, and marked-sum rank `p-2` all lie in the candidate central interval `[N/4, 2N/3+3]`.

If the candidate's positive mixed minors have the orientation `A_j P_(j+1)-A_(j+1)P_j>0`, then at `j=x`, `P_(x+1)<P_x` forces `A_(x+1)<A_x`. Strict central log-concavity of each deletion polynomial then propagates strict descent to rank `p`, which would put the endpoint and every private leaf in the original fixed selector. Applying the same conditional mixed-minor and curvature argument to each marked sequence `Z_i` gives `Z_i_(p-1)<Z_i_(p-2)`. With `t=(N+1)/N`, the exact tagged identity `sum_v q_v = z sum_i r_i Z_i` means the full selected aggregate would then be negative, since all leaves are selected and each weight `r_i` is positive. This argument uses the complete tag sum; a favorable individual tag would not suffice.

## Remaining proof obligations / gaps

I did not independently rederive and certify all of the following, so the conditional bridge above is not a theorem proof:

- The literal path-plus-stars independence polynomials for `P`, both deletion types, and every support deletion; in particular the tagged identity and the rational distribution of the endpoint tag across the `Z_i`.
- The finite-order ULC convolution application to each factored main sequence, with its factor orders, and the ordinary curvature consequence.
- The coefficientwise lower bounds, positive-support/index checks, adjacent-ratio bounds under all shifts, and the inherited adverse mixed-product envelopes `26776` and `53252` across the first and last central ranks.
- The Cauchy-Binet mixed-minor orientation and positivity for every arity/profile and all zero-extended coefficient indices, including the perturbation minors.
- The final implication from all those strict margins to descent of every selected deletion and the exact fixed-selector identity in full detail.

The route therefore leaves the proposed `m>=2000` family claim OPEN. The audited scalar step is consistent, and no mathematical defect is identified in that step. This review does not cover profiles with `m<2000`, any arity outside `{2,3,4}`, or the arbitrary-tree primary claim. I did not run Lean or a profile census, and neither was needed for the exact scalar computation.
