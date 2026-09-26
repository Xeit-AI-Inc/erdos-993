# C5-AF neutral origin adjudication

All 89 case pins and 237 common pins match SHA-256. This adjudication covers all seven claim IDs from the six F routes and reconciles their twelve cross-orientation critiques. Every status below is a proposal to the controller. The complete ordinary-tree lower-region favorable-leaf aggregate remains open: the strongest positive conclusion here is for the one uniform family `T_m`, and the remaining work is bounded or an obstruction to a subsidiary shortcut.

## F1: complete `T_m` family proof, computer-assisted

**Disposition: retained, with exact family and evidence grade.** Both critics retained only `m<=999` because they had not rederived the analytic tail and one had not inspected the forest-order source. The case's controller appendices point to common-pinned analytic candidates and the actual R27 intake; I inspected those and checked the essential inequalities independently. I found no failed all-`m` step. The finite base remains exact Python arithmetic outside a proof kernel. This is a computer-assisted all-`m` *family* proof, not a theorem for all ordinary trees and not a Lean certificate. The critics' finite replay is valid but their truncation is an audit limitation rather than a mathematical counterexample.

Define `T_m`, `m>=1`, by the path `a-b-r` and `m` centers attached to `r`, each with three private leaves. It has `n=4m+3`, `alpha=3m+2`, and exactly `3m+1` original leaves in two orbits: `a`, and the `3m` private leaves. With `L=1+z`, `B=L^3+z=1+4z+3z²+z³`, independent-set polynomials of the tree and two representative leaf deletions are

```
P=(1+2z)B^m+zL^(3m+1),
A0=I(T_m-a)=LB^m+zL^(3m),
Astar=I(T_m-c)=(1+2z)(1+3z+z²)B^(m-1)+zL^(3m).
```

For `q_v=I(T_m-{v,s_v})-I(T_m-N[s_v])`, splitting at the original supports gives `q_a=zL^(3m)` and `q_c=z(2+5z+2z²)B^(m-1)+zL^(3m)`. Hence the sum over *all distinct original leaf tags* is `zR`, where

```
R=3m(2+5z+2z²)B^(m-1)+(3m+1)L^(3m).
```

If both strict selector orbits are favorable, the exact complete aggregate is `S(T_m,p)=R_(p-1)-R_(p-2)`; the `3m` private tags are already included.

Here is the all-parameter certificate. For `Z=A0,Astar,R`, the six inequalities `Z_j²>Z_(j-1)Z_(j+1)` and `Z_j P_(j+1)>Z_(j+1)P_j` hold at every integer `m>=3`, `m<=j<=2m+2`. At `3<=m<=999`, the pinned recurrence check independently replayed by both critics establishes all `1,507,464` strict margins of each type, with minimum LC margin `1210` and mixed margin `1243` at `(m,Z,j)=(3,Astar,8)` and zero failures. For a reproducible finite base, set `f_0=1`, `f_j=0` outside `0..3m`, and solve `B(B^m)'=mB'B^m` by

```
j f_j = 4(m-j+1)f_(j-1) + (6m-3j+6)f_(j-2) + (3m-j+3)f_(j-3).
```

Use these exact integers to form the displayed `P,A0,Astar,R` and test each central `j`; the ordered LC-margin stream has SHA-256 `3fc21b23eab91c474e378400308dd61f7d4b6b45f835fdad74058ef189396e30` and the ordered mixed-margin stream `90d72df905aa43a087ca9826c8aebc9377f8cfbddf00b83cc4b6e854937f6353`. A separate exact row replay checked `276,938` eligible pairs through `m=999`, both orbit selectors, and full `S`, with zero failures. For `m=1,2`, direct coefficients give `x=2,4` and no eligible rank.

For `m>=1000`, the analytic portion covers every central rank. The factors `L`, `1+2z`, `B`, `1+3z+z²`, and `2+5z+2z²` are respectively finite-order ULC of orders `1,1,4,2,2`; the normalized coefficients of `B` at order 4 are `(1,1,1/2,1/4)`. All have positive interval support. [Gurvits, Theorem 1.1](https://arxiv.org/pdf/0804.1181) proves convolution of ULC(`l`) and ULC(`d`) nonnegative sequences is ULC(`l+d`), including these degrees. Thus each factored main term `a` or `H` has LC margin at rank `j` at least `a_j²/(j+1)` or `H_j²/(j+1)`. No ULC(3) assertion for `B` is used.

For each displayed factor `F` of degree `d`, coefficientwise `(2/3)(dF-zF')<=F'<=2(dF-zF')`. By the product rule, a product of degree `D` obeys `(2/3)(D-r)/(r+1)<=a_(r+1)/a_r<=2(D-r)/(r+1)`. At `m>=1000`, `m<=j<=2m+2`, the needed main neighbor ratios are at most 4 and binomial perturbation neighbor ratios at most 3. Write each `Z=a+b`, where `b` is a multiple of `L^(3m)` or `zL^(3m)`; its own LC margin is nonnegative. Expansion then gives `Z_j²-Z_(j-1)Z_(j+1)>=a_j²/(j+1)-24a_jb_j`.

Every main `a` dominates `c_a B^(m-1)` coefficientwise, with `c_a=1,1,6m`, while the perturbation constant satisfies `c_b/c_a<=1`. The `h=8` term in `B^(m-1)=(L³+z)^(m-1)` gives `a_j>=c_a binom(m-1,8)binom(3m-27,j-8)`. Put `t=j-s`, with perturbation shift `s=0` or 1. The exact quotient to its binomial coefficient is `(t)_(8-s)(3m-t)_(19+s)/(3m)_27`. All 27 numerator factors are at least `m-20>=49m/50`, and each denominator factor is at most `3m`. Also `binom(m-1,8)>=(124m/125)^8/8!`. Thus `b_j/a_j<=epsilon=K/m^8`, `K=8!(125/124)^8(150/49)^27`. Since `24(2003)K/1000^8<1` and `(2m+3)/m^8` decreases, all three central LC margins are positive. `AUDIT.py` checks factor normalization, derivative inequalities, and this exact rational cutoff.

For a mixed minor, if the coefficient minors of `c,g` are nonnegative and `H` is LC, Cauchy–Binet gives

```
(cH)_j(gH)_(j+1)-(cH)_(j+1)(gH)_j
 = sum_(r<s) (c_r g_s-c_s g_r)
   [H_(j-r)H_(j+1-s)-H_(j-s)H_(j+1-r)] >= (c0 g1-c1 g0)H_j²/(j+1).
```

The three `(H,c,g)` are `(B^m, L, 1+2z)`, `((1+2z)B^(m-1),1+3z+z²,B)`, and `(B^(m-1),3m(2+5z+2z²),(1+2z)B)`. All coefficient minors are nonnegative, including zero-extended endpoints; the respective `r=0,s=1` factors are `1,1,21m`. Write `Z=cH+b`, `P=gH+d`, with `d=zL^(3m+1)` for the two deletion cases and `d=zL^(3m+1)` for `R` as well. The pure perturbation minor is nonnegative: for deletions it is binomial LC of `b=zL^(3m)`; for `R` it is the sum of two binomial LC brackets with `b=(3m+1)L^(3m)`. Discarding positive cross terms, the adverse totals are at most `47epsilon H_j²`, `431epsilon H_j²`, and `14688m epsilon H_j²`. These follow from `H_(j+1)/H_j<=4`, `H_(j-r)/H_j<=4^r` for `r<=4`, and binomial ratios at most 3; the explicit component bounds are `(a_(j+1)/H_j,V_j/H_j,d_j/b_j,b_(j+1)/b_j)=(5,9,4,3),(11,129,4,3),(63m,1161,12,12m)` with the last pair normalized to `L^(3m)`. `AUDIT.py` checks the small-polynomial minors and exact endpoint cutoffs `47(2003)K/1000^8<1`, `431(2003)K/1000^8<1`, and `(14688/21)(2003)K/1000^8<1`; monotonicity extends them to every `m>=1000`. Hence the three complete mixed minors are positive.

The second imported dependency is exact: the common-pinned Lean intake states `Erdos993G1.forest_descent_linear_bound` for any finite acyclic graph with `Delta_k<0`, concluding `n<=4k`, with no `DlHyp` binder; its pinned verification report says formally verified. Applying it to `T_m` at the first strict descent gives `4m+3<=4x`, so `x>=m+1`. Eligibility gives `p<=2m+1` and `x<=p-2<=2m-1`. Thus `j=x` and all propagation ranks lie in the proved central window. At `j=x`, `P_(x+1)<P_x` and the positive mixed minors imply `Z_(x+1)/Z_x<P_(x+1)/P_x<1` for `Z=A0,Astar,R`. Strict LC propagates descent through `p` for both leaf deletions and through `p-2` for `R`. Both original leaf orbits are strictly favorable, so every `3m+1` tag is selected and `S=R_(p-1)-R_(p-2)<0` at every eligible `p`. This uses neither LC of `P` nor an unproved no-recovery premise.

The family theorem depends on Gurvits's finite-order convolution theorem, the pinned R27 forest bound, and the unformalized finite exact replay. It does not give the missing universal lower-region global budget or a conclusion for heterogeneous trees. There is no failed runtime or unfinished critic derivation that mathematically refutes the all-`m` argument.

## F2: heterogeneous bounded audit

**Disposition: retained.** Both critics confirm the finite scope; no disagreement remains. The ordinary tree has path `0-1-2`, with branch centers at 0 bearing a nondecreasing multiset of 1–5 pendant arities from `{2,3,4}`. There are exactly 55 profiles (`sum_(m=1)^5 binom(m+2,2)`). The whole polynomial is `z(1+z)prod_i(1+z)^(r_i)+(1+2z)prod_i((1+z)^(r_i)+z)`, independently matching the exact deletion recurrence. Across 62 eligible profile/rank rows, every original leaf is strictly favorable, all 928 selected summands are negative (maximum `-14`), and all full sums are negative (maximum `-275`); the 55 whole-tree polynomials have no LC failure. As an exact example, profile `(2,3,4)` has `i=(1,15,91,299,601,798,737,480,218,66,12,1)`, `a=11,x=5,p=7`, ten selector values `-151,-133,-133,-119,-119,-119,-110,-110,-110,-110`, ten terms `-42,-93,-93,-130,-130,-130,-150,-150,-150,-150`, and `S=-1218`. These facts establish no mixed-minor theorem, proper-selector behavior, or general heterogeneous budget.

## F3: asymmetric fixture and bounded selector probes

**Disposition: retained.** Both critics directly enumerated the fixture and retained the finite probes. The 13-vertex ordinary tree has edges `01,12,03,34,35,06,67,68,09,9-10,9-11,9-12`. Its independent-set vector is `(1,13,66,173,258,231,131,47,10,1)`, so `a=9,x=4,p=6` obeys `x+2=p` and `18<19`. All original leaves `2,4,5,7,8,10,11,12` are selected, with strict deletion deltas `-46,-38,-38,-38,-38,-31,-31,-31`; their terms are `-14,-35,-35,-35,-35,-51,-51,-51`, so `S=-307`. At `k=5`, direct actual-addability and multiply-marked counts give `(Q,U,E,C,D)=(578,271,1514,159,1954)`, `E=5U+C`, and `D+C-(2a+1-3p)Q=1535=-5S`. The source also replayed 5,000 `Random(993)` Prüfer samples of orders 10–17 (98 eligible nonempty-selector rows, none proper) and all 342 specified nonconstant ordered `{2,3,4}` profiles with 3–5 arms (536 eligible rows, none proper). The first probe is a sample; neither proves a selector rule or charging bound.

## F4: proper-selector search

**Disposition: retained.** Both critics replayed the generation and exact selector test. A `KL_T(k1,k2,k3)` has root 0, three support vertices adjacent to 0, and support `i` has `k_i` disjoint paths of length two (`support-middle-leaf`). The sorted triples `1<=k1<=k2<=k3<=20` give 1,540 generated trees and no eligible ranks. Centered path spiders have one central root and 3–5 disjoint arms with sorted lengths 1–8; these give 1,242 trees and 166 eligible rows. Five named KL fixtures `(3,4,4),(3,4,5),(3,5,5),(3,5,6),(3,6,6)`, each grafted with a path of length 1–5 at every nonleaf, give 425 constructions and 142 eligible rows. None of the 308 eligible rows has a proper strict selector. The eligible `(7,7,7)` centered spider has polynomial `(1,22,210,1141,3891,8661,12684,12028,7086,2401,409,30,1)`, `a=12,x=6,p=8`, all original leaves `7,14,21` selected with `Delta_8(T-v)=-2483` each, terms `-915` each, and `S=-2745`. This finite failure to find a proper selector is no universal all-leaf theorem.

## F5: T22 tagwise obstruction and actual unsigned network

**Disposition: retained_narrowed to the specified tagwise obstruction, with the critics' source-access limitation corrected.** The route and both critics correctly conclude that one positive tag defeats any proposed rule requiring every selected tag's local term to be nonpositive; a negative full sum does not give a Hall cut or kernel. Their claim that the graph and network data are unavailable is false for this adjudication. Common-pinned `instruments/orbit-flow-twoforone/PROTOCOL.md` and `run.py`, and the literal p6 switch-flow protocol/implementation, specify upper independent `(p+1)`-sets of supply `w_F(B)` and lower independent `p`-sets of capacity `w_F(A)`. Here `w_F(A)` counts the fixed original favorable leaf tags `v` for which `v` lies in `A` and `A` meets the original witness set `N_T(s_v)\{v}`. Edges are ordinary deletion, or insertion of an absent vertex having exactly two neighbors in the upper set while removing those two. The T22 quotient implementation includes root, support, and claw-center switch orbits. The frozen T22 `(m,p)=(22,34)` quotient has 1,686 upper states, 1,743 lower states, 8,907 transport arcs, supply `6533318342644086823410`, capacity `7032072523191088241946`, and a saturating flow with cut deficit zero. The quotient flow still has a symmetry-lifting debt; it is bounded evidence and no universal weighted Hall theorem.

The ordinary T22 graph itself is completely encoded: vertices `0..90`, path edges `(0,1),(1,2)`, and for `i=0..21`, center `c_i=3+4i` joined to 0 and to tips `c_i+1,c_i+2,c_i+3`. These are 90 edges and form a tree. The pinned controller replay gives the full tree and deletion vectors. Independently deriving the polynomial formulas above at `m=22`, `AUDIT.py` verifies its entire independence polynomial has degree `a=68` and first strict descent `x=32`. At `p=34`, `x+2=p`, `102=3p<137=2a+1`, and both leaf-deletion orbit deltas are strictly negative: path leaf `-24528898691191536776`, every arm tip `-22537233346124540898`. Thus all 67 original leaves, including each of the 66 arm tips, are selected. The path tag has `g=212336130412243110>0`; each arm tag has `g=-7560098737536570631`; the *complete* selected sum is `212336130412243110+66(-7560098737536570631)=-498754180547001418536`. The positive tag refutes pointwise nonpositivity for this eligible tree. Its negative full sum supports no primary refutation, and a single positive tag does not furnish a deficient cut in the actual cross-tag network. No lifted orbit flow or universal network proof is asserted here.

## F6: cover shortcut and finite six-arm census

**Both dispositions: retained.** The two critics independently confirm the exact witness and finite boundary. For the `tau>=7` shortcut, take root 0 joined to six centers with respective pendant counts `(2,3,3,3,3,3)`. This 24-vertex tree has polynomial `(1,24,253,1566,6400,18419,38970,62650,78593,78515,63348,41582,22199,9548,3240,836,154,18,1)`, `a=18,x=8,p=10`, and strict guards `x+2=p`, `30<37`. All 17 original leaves are favorable: deletion deltas `-13234` for the two 2-arm tips and `-12357` for the other fifteen. Their terms are respectively `-4875` twice and `-7537` fifteen times, so `S=-122805`. The six centers cover every edge and one pendant edge per center is a matching of six disjoint edges, proving `tau=6`. This **refutes only** the proposed universal `tau>=7` eligibility shortcut, not pointwise sign or the primary aggregate. The known witness is not novel.

For the second claim, sorted nonnegative six-tuples with `sum d_i=2p-3` at `p=10,11,12,13` yield respectively `163,235,331,454` exact profiles of the stated root-plus-six-centers family. Only `(2,3,3,3,3,3)` at `p=10` is eligible; its every selected term is negative, maximum `-4875`. This is a bounded census only, not a census of all trees or all `tau<=6` cases. The general third-shell pointwise sign remains open.

## Coverage and remaining problem

The seven claim IDs in `RETURN.json` are exactly the union in the six route returns and twelve critic returns. No critic introduced an additional claim ID. F1 is the one all-parameter family consequence; F2–F4 and the F6 census are finite, F5 is a concrete pointwise obstruction with negative complete sum, and F6's `tau` result refutes a shortcut. None supplies the selected across-tag budget for every ordinary tree under `x+2<=p` and strict `3p<2a+1`. In the marked identity notation `k=p-1`, `Q=sum_F q_v(k)`, `E` actual addability, and `C` multiply marked upper sets once per tag, the open universal need is `E-C<=kQ`, equivalently `S<=0`; a positive tag or a failed finite search does not decide it.
