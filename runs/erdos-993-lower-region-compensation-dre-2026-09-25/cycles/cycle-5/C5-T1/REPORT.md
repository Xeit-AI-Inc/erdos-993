# C5-T1 search: uniform T_m family

## Result and scope

I independently audited the proposed central-coefficient argument for the family T_m and replayed its finite base with a separate exact-integer program. All 237 source hashes listed in the common packet matched before source review. Subject to the common handoff's admitted forest descent bound n <= 4x, this proves the ordinary favorable-leaf aggregate strictly negative for every eligible rank of every T_m, m >= 1. The finite component is computer-assisted, not kernel checked. This is only the specified family result; it does not prove or refute the all-tree lower-region aggregate.

Let L=1+z and B=L^3+z=1+4z+3z^2+z^3. The tree has a path a-b-r and m branches at r, each branch consisting of a center and three private leaves. Its order is 4m+3 and its independence number is 3m+2: if r is absent, each branch contributes at most three leaves and the path contributes at most two; if r is present, its three neighbors are excluded and the same bound is attained by r, a, and all private leaves. The two original leaf orbits are endpoint a and the 3m private leaves.

Splitting on r, and then on the corresponding deleted support, gives these independence polynomials:

```text
P = I(T_m) = (1+2z) B^m + z L^(3m+1)
A0 = I(T_m-a) = L B^m + z L^(3m)
A* = I(T_m-c) = (1+2z)(1+3z+z^2) B^(m-1) + z L^(3m)
```

Here c is any private leaf. For each original leaf v, put q_v=I(T_m-{v,s_v})-I(T_m-N[s_v]). Direct support deletion gives

```text
q_a = z L^(3m)
q_c = z(2+z)(1+2z) B^(m-1) + z L^(3m)
Q = q_a + 3m q_c = z R
R = 3m(2+5z+2z^2) B^(m-1) + (3m+1)L^(3m)
```

The factor 3m counts the private leaves as distinct tags. If all original leaves are favorable, the complete selected sum is Δ_(p-2)(R)=R_(p-1)-R_(p-2).

## Central strict log-concavity

Write each Z=A0,A*,R as a+b, where the main parts are respectively

```text
a = L B^m
a = (1+2z)(1+3z+z^2) B^(m-1)
a = 3m(2+5z+2z^2) B^(m-1)
```

and the perturbations are zL^(3m), zL^(3m), (3m+1)L^(3m).

The finite-order convolution theorem used here is Gurvits, “A Short Proof, Based on Mixed Volumes, of Liggett's Theorem on the Convolution of Ultra-Logconcave Sequences,” EJC 16(1) (2009), Theorem 1.1 ([journal page](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v16i1n5), [arXiv:0804.1181](https://arxiv.org/abs/0804.1181)). Its hypotheses are nonnegative finite sequences ULC of finite orders d1,d2; it states their convolution is ULC of order d1+d2. Each factor below has positive interval support. B is ULC of order 4, since its order-4 normalized coefficients are (1,1,1/2,1/4); L and 1+2z are ULC(1); 1+3z+z^2 and 2+5z+2z^2 are ULC(2), with normalized coefficients (1,3/2,1) and (2,5/2,2). Thus each factored main part is ULC of the sum order. This avoids the false assertion that B is ULC(3).

For a positive interior coefficient of a ULC(d) sequence,

```text
a_j^2 / (a_(j-1) a_(j+1)) >= binom(d,j)^2 / (binom(d,j-1) binom(d,j+1))
                         = (j+1)(d-j+1)/(j(d-j)) >= (j+1)/j.
```

Therefore a_j^2-a_(j-1)a_(j+1) >= a_j^2/(j+1). For each factor F of a main part, coefficient comparison verifies

```text
(2/3)(dF-zF') <= F' <= 2(dF-zF'), where d=degree(F).
```

Multiplying by the other nonnegative factors and summing yields, for a product of degree D,

```text
(2/3)(D-r)/(r+1) <= a_(r+1)/a_r <= 2(D-r)/(r+1).
```

For m>=1000 and m<=j<=2m+2, both adjacent main-part coefficient ratios are at most 4; adjacent ratios for L^(3m) or zL^(3m) are at most 3. Expanding the LC margin of a+b and bounding the two negative cross terms gives

```text
Z_j^2-Z_(j-1)Z_(j+1) >= a_j^2/(j+1) - 24 a_j b_j.
```

Coefficientwise a>=c_a B^(m-1), with c_a=1,1,6m in the three cases, while the perturbation scalar c_b<=c_a. The h=8 summand of B^(m-1)=(L^3+z)^(m-1) gives, for s=0 or 1 according as the perturbation is unshifted or shifted,

```text
b_j/a_j <= K/m^8
K = 8! (125/124)^8 (150/49)^27.
```

Indeed the binomial quotient is (j-s)_(8-s) (3m-j+s)_(19+s)/(3m)_27; all 27 numerator factors are at least 49m/50, all denominator factors are at most 3m, and binom(m-1,8)>=(124m/125)^8/8!. Exact rational arithmetic gives 24*2003*K/1000^8<1. Since (2m+3)/m^8 decreases, the displayed LC margin is strictly positive throughout the central interval for every m>=1000.

For 3<=m<=999, [REPLAY.py](REPLAY.py) independently constructs B^m from B(B^m)'=mB'B^m, uses binomial coefficients for powers of L, and checks every integer central LC margin. It checked 1,507,464 margins with no failures; the minimum was 1210 at (m,Z,j)=(3,A*,8). The exact finite boundary and replay summary are in [RESULTS.json](RESULTS.json). No extrapolation from that range is used.

## Central mixed minors

Let P=V+d and Z=A+b, with A=cH and V=gH. For r<s, Cauchy-Binet gives

```text
A_j V_(j+1)-A_(j+1) V_j
 = sum_(r<s) (c_r g_s-c_s g_r)
   [H_(j-r)H_(j+1-s)-H_(j-s)H_(j+1-r)].
```

All brackets are nonnegative when H is LC with interval support. The pairs (H,c,g) and their positive (r,s)=(0,1) coefficient minors are

```text
(B^m, 1+z, 1+2z): 1
((1+2z)B^(m-1), 1+3z+z^2, B): 1
(B^(m-1), 3m(2+5z+2z^2), (1+2z)B): 21m
```

For each pair all other coefficient minors are nonnegative by direct inspection of the displayed short coefficient vectors. The main mixed minor is therefore at least H_j^2/(j+1), H_j^2/(j+1), and 21m H_j^2/(j+1), respectively, using the same ULC margin for H.

The pure perturbation minor b_j d_(j+1)-b_(j+1)d_j is nonnegative: for the two deletion polynomials this is the LC margin of b, since d=(1+z)b; for R, it is a positive multiple of the sum of the two adjacent binomial LC margins of L^(3m). The only adverse cross terms needed are A_(j+1)d_j+b_(j+1)V_j. The ratio bounds above and binomial neighbor ratios at most 3 give these upper bounds relative to H_j^2, where ε=K/m^8:

| Polynomial | Main lower term | Adverse upper bound |
|---|---:|---:|
| A0 | H_j^2/(j+1) | 47 ε H_j^2 |
| A* | H_j^2/(j+1) | 431 ε H_j^2 |
| R | 21m H_j^2/(j+1) | 14688m ε H_j^2 |

For example, the coefficient bounds (A_(j+1)/H_j, V_j/H_j, d_j/b_j, b_(j+1)/b_j) are (5,9,4,3) for A0, (11,129,4,3) for A*, and (63m,1161,12,12m) for R. The exact cutoff ratios C*2003K/1000^8, with C=47,431,14688/21, are respectively less than 1 (the largest, for R, is 0.792541...). Monotonicity of (2m+3)/m^8 gives strict positivity for all larger m. In the finite range, REPLAY.py checks all 1,507,464 mixed minors Z_jP_(j+1)-Z_(j+1)P_j; there are no failures and the minimum is 1243 at (3,A*,8).

## Selector and full-sum bridge

The common C5 handoff supplies the admitted forest descent bound: for a finite forest of order n, its first strict descent x satisfies n<=4x. Applied to this tree, 4m+3<=4x, so x>=m+1. The strict alpha guard is 3p<2(3m+2)+1=6m+5, hence p<=2m+1; eligibility also gives x<=p-2<=2m-1. Thus x is a central mixed-minor rank. For m=1,2, direct polynomial coefficients give x=2,4, respectively, and no eligible p exists.

At j=x, Δ_x(P)<0 and the strict mixed minor imply

```text
Z_(x+1)/Z_x < P_(x+1)/P_x < 1
```

for all three Z=A0,A*,R. Strict central LC makes each successive coefficient ratio nonincreasing: for A0,A*, it propagates the negative ratio from x through rank p; for R, it propagates it through rank p-2. All needed LC ranks lie in m<=j<=2m+2. Therefore Δ_p(T_m-a)<0 and Δ_p(T_m-c)<0, so every original leaf is selected, and

```text
S(T_m,p) = Δ_(p-2)(R) < 0.
```

The replay additionally checked every eligible row for 1<=m<=999: 276,938 rows, zero selector or full-sum failures. For m>=1000, the preceding analytic inequalities and admitted descent bound establish the result.

## Limitations

- This is a result for the exact T_m family and its original leaves; it gives no universal conclusion for arbitrary ordinary trees.
- The finite base is independently replayed exact Python arithmetic, not a Lean/kernel certificate. Its scope is exactly m=3,...,999 and j=m,...,2m+2.
- The all-m selector bridge uses the forest descent bound supplied as admitted context by the C5 common handoff. This route does not reprove that separate theorem.
- The optional bipartite tagged-incidence identity and its missing global budget are not needed or resolved here.
