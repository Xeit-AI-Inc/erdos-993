# C5-CF-T1 independent critique (orientation F)

## Disposition

**Claim `C5-T1.TM-LOWER-REGION-AGGREGATE`: retained.** The route claim is a theorem for its explicitly defined family `T_m`, not a claim about arbitrary ordinary trees. I found no decisive defect in the graph formulas, strict-selector propagation, tagged global sum, finite arithmetic, or stated large-`m` inequalities. The result remains computer-assisted and depends on the admitted R27 forest descent bound; it makes no claim about the registered all-tree aggregate.

## Scope and graph/count audit

For `T_m`, the edge `a-b-r` is the path and each of the `m` centers is adjacent to `r` and has three private leaves. The order is `4m+3`. Splitting independent sets according to whether `r` is selected gives

```text
P = (1+2z) B^m + z(1+z)^(3m+1),   B=(1+z)^3+z=1+4z+3z^2+z^3.
```

Deleting endpoint `a` gives `A0=(1+z)B^m+z(1+z)^(3m)`. Deleting a private leaf gives `A*=(1+2z)(1+3z+z^2)B^(m-1)+z(1+z)^(3m)`. For support deletions, the endpoint tag contributes `q_a=z(1+z)^(3m)`. A private-leaf tag deletes that leaf and its center; subtracting the closed-support-neighborhood deletion leaves `q_c=z(2+z)(1+2z)B^(m-1)+z(1+z)^(3m)`. The `3m` private leaves remain distinct tags, so

```text
Q = q_a + 3m q_c = zR,
R = 3m(2+5z+2z^2)B^(m-1) + (3m+1)(1+z)^(3m).
```

For this graph there are exactly two original-leaf orbits, represented by `a` and a private leaf `c`. The fixed strict selector therefore selects all leaves exactly when both `Delta_p(A0)<0` and `Delta_p(A*)<0`. When all are selected, linearity over the distinct tags gives

```text
S = Delta_(p-1)(Q) = R_(p-1)-R_(p-2) = Delta_(p-2)(R).
```

This checks the support and closed-neighborhood deletions and the full, tagged sum; it does not replace the global sum with one leaf or one support fiber.

## Proof-bridge audit

The route uses the finite-order convolution theorem of Gurvits, Theorem 1.1, with nonnegative finite sequences ULC of stated finite orders. Its factors have positive interval support and orders `B:4`, `1+z:1`, `1+2z:1`, `1+3z+z^2:2`, and `2+5z+2z^2:2`. In particular `B` is used at order 4, not order 3. The resulting main products are ULC of their sum order. The displayed ULC margin bound

```text
A_j^2 - A_(j-1)A_(j+1) >= A_j^2/(j+1)
```

follows from the normalized binomial ratio at each positive interior coefficient. The route then controls the two negative perturbation cross terms; the perturbation's own LC margin is nonnegative. The supplied factorwise derivative comparison yields the stated adjacent-ratio bounds for the main products. The h=8 term of `B^(m-1)` gives `b_j/a_j <= K/m^8`; the stated strict cutoff `24*2003*K/1000^8<1` proves the LC margin for every central `j` when `m>=1000`.

For the mixed minors, the Cauchy-Binet brackets have the LC orientation `H_j^2-H_(j-1)H_(j+1)>=0`. The listed coefficient minors are nonnegative, with leading minors `1`, `1`, and `21m`. The perturbation minors are nonnegative by binomial LC. The only adverse cross terms are the ones bounded in the case report. Its displayed ratio bounds give adverse totals `47 epsilon`, `431 epsilon`, and `14688m epsilon` times `H_j^2`; against the main terms, the largest exact cutoff ratio is the `R` value, below 1. These bounds cover the complete central interval `m<=j<=2m+2` for `m>=1000`.

The selector rank window is valid with the admitted forest strict-descent restriction `n<=4x`: here `4m+3<=4x`, hence `x>=m+1`. The integer form of `3p<6m+5` gives `p<=2m+1`, and eligibility gives `x<=p-2<=2m-1`. Thus the crossing `j=x` and every propagation rank are in the claimed central window. Since `Delta_x(P)<0`, a positive mixed minor gives `Z_(x+1)/Z_x < P_(x+1)/P_x < 1` for each `Z=A0,A*,R`. Strict LC makes each following coefficient ratio nonincreasing. This proves both orbit selectors at rank `p` and the negative `R` difference at rank `p-2`. For `m=1,2`, the replay gives `x=2,4`; then the strict alpha guard leaves no eligible `p`.

## Exact replay and disposition basis

I copied the pinned case replay to this worker scratch root and executed that copy. The independent integer replay reproduced 1,507,464 strict LC margins and 1,507,464 strict mixed minors for `m=3..999`, `j=m..2m+2`, with zero failures; the minima are 1210 and 1243, both at `(m,Z,j)=(3,Astar,8)`. It also checked 276,938 eligible rows for `m=1..999` with no selector or full-sum failures and reproduced the four exact rational large-`m` cutoff ratios. The executable copy and its output are the evidence files listed in `RETURN.json`.

The exact graph identities and large-`m` inequalities are proved algebraically in the route report; the finite interval is exact integer arithmetic, not a Lean/kernel certificate. The accepted conclusion is only the all-eligible-ranks result for the stated `T_m` family. The R27 bound is an imported admitted dependency, not re-proved by this route. No universal-tree or general lower-region conclusion follows.

## Limitations

- The claim concerns only `T_m` and its original leaves under the fixed selector; it does not settle the arbitrary-tree registered primary.
- The finite base is Python integer computation, not kernel checked.
- The selector bridge depends on the admitted R27 forest strict-descent bound `n<=4x`.
- The cited Gurvits convolution theorem is an imported theorem; the audited application uses the finite-order ULC hypotheses and factor orders stated above.
