# C5-PREP-TM-UNIFORM-CANDIDATE-AUDIT

**Independent reviewer disposition: the two root candidates give a valid computer-assisted proof of the ordinary `T_m` family, not the all-tree lower-region aggregate.** The algebraic large-`m` argument is sound after making the imported ULC theorem's finite-order hypotheses explicit. The independent exact replay passed the finite base. The finite base is an exact Python calculation, not a Lean kernel proof. No controller claim or registry is changed here.

## Inputs, scope, and graph identities

I checked all ten SHA-256 pins in `control/C5-PREP-TM-UNIFORM-CANDIDATE-AUDIT.json` before reading the sources; each matched. I read only the listed local sources. The permitted public primary source used for convolution is Leonid Gurvits, [*A short, based on the mixed volume, proof of Liggett's theorem on the convolution of ultra-logconcave sequences*](https://arxiv.org/pdf/0804.1181), Theorem 1.1, which gives a proof of the original Liggett theorem. The original article is T. M. Liggett, [*Ultra Logconcave Sequences and Negative Dependence*](https://doi.org/10.1006/jcta.1997.2790), JCTA 79 (1997), 315–325.

Write `L=1+z` and `B=L^3+z=1+4z+3z²+z³`. The ordinary tree `T_m` has path `a-b-r`, and `m` disjoint centers attached to `r`, each with three private leaves. Its order is `4m+3`; taking all private leaves together with `a,r` gives `alpha=3m+2`, and no independent set can be larger by examining each arm and the path. Root splitting gives

```
P=I(T_m)=(1+2z)B^m+zL^(3m+1),
A0=I(T_m-a)=L B^m+zL^(3m),
Astar=I(T_m-c)=(1+2z)(1+3z+z²)B^(m-1)+zL^(3m),
q_a=zL^(3m),
q_c=z(2+z)(1+2z)B^(m-1)+zL^(3m),
Q=q_a+3m q_c=zR,
R=3m(2+5z+2z²)B^(m-1)+(3m+1)L^(3m).
```

Here `c` is any one of the `3m` private leaves. For `q_v`, the definition is `I(T_m-{v,s_v})-I(T_m-N[s_v])`, so its coefficient difference at `p-1` is the contract summand. These graph formulas were also tested against literal induced-subgraph independent-set counts at `m=1,2,3`, checking every original leaf as a separate tag. The direct checks are in `REPLAY.py` and `RESULTS.json`.

## Imported theorem and its exact hypotheses

Gurvits Theorem 1.1 says convolution of a nonnegative ULC(`l`) sequence and a nonnegative ULC(`d`) sequence is ULC(`l+d`), with ULC(`d`) meaning `a_j/binom(d,j)` is log-concave on its interval support; the paper gives the proof. The root text instead cites the Poisson ULC closure form in Saumard–Wellner. The finite-order version suffices with explicit factor orders:

| Factor | Admissible ULC order | Normalized coefficients / check |
|---|---:|---|
| `L=1+z` | 1 | degree one |
| `1+2z` | 1 | degree one |
| `B=1+4z+3z²+z³` | 4 | `(1,1,1/2,1/4)`, both LC inequalities, second equality |
| `1+3z+z²` | 2 | `(1,3/2,1)`, `9/4>1` |
| `2+5z+2z²` | 2 | `(2,5/2,2)`, `25/4>4` |

All coefficients and supports are positive and consecutive. Thus every factored main `a` or `H` used below is ULC of a finite order by repeated convolution. Finite-order ULC implies Poisson ULC because the binomial-normalized adjacent factor `(j+1)(d-j+1)/(j(d-j))` exceeds `(j+1)/j`. Consequently, for each interior `j`, `a_(j-1)a_(j+1) <= j a_j²/(j+1)` and the ordinary LC margin is at least `a_j²/(j+1)`. In particular the fact that `B` fails ULC(3) is irrelevant: its ULC(4) check is exact. The theorem is applied only to finite positive sequences with interval support, within its hypotheses.

The other imported result is the pinned, registered `E993-R27-FOREST-DESCENT-LINEAR-BOUND`: a strict descent at `x` in a finite forest of order `n` implies `n<=4x`. `T_m` is an ordinary finite tree, so `4m+3<=4x`, hence `x>=m+1`. This is an awarded dependency in the allowed claim snapshot, not a new proof here. Eligibility and `alpha=3m+2` give `p<=2m+1` and `x<=p-2<=2m-1`. For `m=1,2`, direct coefficients give `x=2,4`, respectively, so no eligible `p` exists.

## Large-`m` LC audit

For each factor `F` of degree `d` used in `a`, direct coefficient comparison gives `(2/3)(dF-zF')<=F'<=2(dF-zF')`. For a product `a` of degree `D`, summing the differentiated factors preserves this inequality. At rank `r` it yields

```
(2/3)(D-r)/(r+1) <= a_(r+1)/a_r <= 2(D-r)/(r+1).
```

The three main degrees are `3m+1,3m,3m-1`, respectively. At `m>=1000`, `m<=j<=2m+2`, both `a_(j-1)/a_j` and `a_(j+1)/a_j` are at most 4. Each perturbation `b` is a positive multiple of `L^(3m)` or `zL^(3m)`; each neighbor ratio is at most 3. Its pure LC margin is nonnegative. Expanding the LC margin of `Z=a+b`, discarding positive terms, and bounding the two negative cross products gives

```
Z_j²-Z_(j-1)Z_(j+1) >= a_j²/(j+1)-24 a_j b_j.
```

The bound is intentionally looser than the available `22 a_j b_j`; it is valid.

Every main `a` is coefficientwise at least `c_a B^(m-1)` with `c_a=1,1,6m`; the corresponding perturbation constants satisfy `c_b/c_a<=1`. Taking the `h=8` term in `(L³+z)^(m-1)` yields

```
a_j >= c_a binom(m-1,8) binom(3m-27,j-8).
```

Put `N=3m,t=j-s`, where `s=0` or 1 is the perturbation shift. The exact binomial quotient is

```
binom(N-27,j-8)/binom(N,t)
  = (t)_(8-s) (N-t)_(19+s)/(N)_27.
```

The numerator has exactly 27 factors. At `m>=1000,m<=j<=2m+2`, all numerator factors are at least `m-20>=49m/50`; all denominator factors are at most `3m`. Further, `binom(m-1,8)>=(m-8)^8/8!>=(124m/125)^8/8!`. Hence `b_j/a_j<=epsilon=K/m^8`, `K=8!(125/124)^8(150/49)^27`. At the worst `m=1000`, the exact ratio `24*2003*K/1000^8` is approximately `0.02719500675<1`. Since `(2m+3)/m^8` decreases, every central LC margin is strictly positive for all `m>=1000`. The coefficient degree and falling-factorial index 27 are correct.

## Large-`m` mixed-minor audit

For `A=cH`, `V=gH`, use the exact expansion

```
A_j V_(j+1)-A_(j+1)V_j
 = sum_(r<s) (c_r g_s-c_s g_r)
       [H_(j-r)H_(j+1-s)-H_(j-s)H_(j+1-r)].
```

The orientation is correct: `r=0,s=1` contributes `(c0*g1-c1*g0)(H_j²-H_(j-1)H_(j+1))`. Every bracket is nonnegative from LC and interval support of `H`; every coefficient minor is nonnegative for the three listed `(c,g)` pairs (including zero extension). The `r=0,s=1` coefficients are `1,1,21m` for `A0,Astar,R`. Thus the main minor is at least that coefficient times `H_j²/(j+1)`.

For `P=V+d` and `Z=A+b`, the pure perturbation minor is nonnegative. In the deletion cases it is the LC margin of `b` because `d=(1+z)b`. In the `R` case it is `(3m+1)` times `[u_j²-u_(j-1)u_(j+1)]+[u_j u_(j-1)-u_(j+1)u_(j-2)]` for `u=L^(3m)`; both brackets are nonnegative from binomial LC, including zero extension. The only discarded adverse terms are `A_(j+1)d_j+b_(j+1)V_j`.

For the three `H`, degrees range from `3m-3` to `3m`. The derivative ratio gives `H_(j+1)/H_j<=4`. Iterating backward gives `H_(j-r)/H_j<=4^r`, `1<=r<=4`, because `(3/2)(2m+2)/(m-4)<4` at `m>=1000`. Binomial neighbor ratios are at most 3. These yield the following exact coarse factors:

| Pair | `A_(j+1)/H_j` | `V_j/H_j` | `d_j/b_j` or `d_j/u_j` | `b_(j+1)/b_j` or `b_(j+1)/u_j` | adverse total |
|---|---:|---:|---:|---:|---:|
| `A0` | 5 | 9 | 4 | 3 | `47 epsilon H_j²` |
| `Astar` | 11 | 129 | 4 | 3 | `431 epsilon H_j²` |
| `R` | `63m` | 1161 | 12 | `12m` | `14688m epsilon H_j²` |

Here `129=1+4*4+3*4²+4³`, `1161=1+6*4+11*4²+7*4³+2*4⁴`, and `14688=63*12+1161*12`. The exact cutoff ratios `C*2003*K/1000^8`, with `C=47,431,14688/21`, are approximately `0.05325688822`, `0.4883769962`, `0.7925401967`, all strictly below 1. Thus each complete mixed minor `Z_j P_(j+1)-Z_(j+1)P_j` is positive for the central ranks when `m>=1000`.

## Propagation and evidence grade

At an eligible `p`, `m+1<=x<=p-2<=2m-1`. The mixed minor at `j=x` gives `Z_(x+1)/Z_x < P_(x+1)/P_x <1` for `Z=A0,Astar,R`; all coefficients are positive there. Strict LC for `Z` at ranks from `x+1` through `p` makes consecutive ratios nonincreasing. Thus `Delta_p(A0)<0`, `Delta_p(Astar)<0`, and `R_(p-1)<R_(p-2)`. The LC range `m..2m+2` covers every required index, including the endpoint `p<=2m+1`. The favorable set is therefore all `3m+1` original leaves, counted separately, and the complete selected sum is `S=R_(p-1)-R_(p-2)<0`. Empty eligibility for `m=1,2` completes the family, provided the finite check `m=3..999` passes.

The finite check is independently implemented in `REPLAY.py` with the coefficient recurrence obtained from `B (B^m)'=mB' B^m`; it does not call either producer script or use repeated polynomial convolution. It checks all central LC and mixed minors at every integer `m=3..999` and every `j=m..2m+2`, plus every eligible selector and complete-sum sign for `m=1..999`. It completed **1,507,464 strict LC checks and 1,507,464 strict mixed-minor checks, zero failures**. The respective minimum margins were `1210` and `1243`, both at `(m,Z,j)=(3,Astar,8)`. The complete LC margin SHA-256 is `3fc21b23eab91c474e378400308dd61f7d4b6b45f835fdad74058ef189396e30`; the mixed-margin SHA-256 is `90d72df905aa43a087ca9826c8aebc9377f8cfbddf00b83cc4b6e854937f6353`. They exactly match the two pinned producer JSONs, although the B-power calculation is independent. There were **276,938 eligible rows** for `m=1..999`, with zero orbit-selector or aggregate-sign failures. At `m=3,p=7` the independent values are `Delta_p(A0)=-141`, `Delta_p(Astar)=-110`, and complete `S=-1167`. Small graph counts use literal independent-subset enumeration at `m=1,2,3`, all tags checked. `RESULTS.json` holds these exact results. The finite-base agreement remains arithmetic evidence outside a proof kernel.

**Exact scope:** this is an independent-reviewer verified, computer-assisted family proof for `E993-ORDINARY-TM-LOWER-REGION-AGGREGATE`. It establishes neither `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` for arbitrary trees nor a universal Erdős unimodality claim. The finite base is unformalized Python, and I make no Lean-kernel or controller-award claim.
