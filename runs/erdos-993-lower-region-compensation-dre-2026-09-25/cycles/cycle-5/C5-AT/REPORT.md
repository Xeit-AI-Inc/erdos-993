# C5-AT neutral origin adjudication

All 72 case-file and 237 common-file SHA-256 pins match. The six route claim IDs are the complete covered set. I assessed their twelve critics against the exact statements and the pinned analytic sources, including the three controller scope appendices. This is a proposed worker adjudication, not a controller award. The registered all-ordinary-tree lower-region aggregate remains open: none of these six routes proves its selected-family budget or gives an eligible tree with positive complete sum.

## T1: exact all-parameter result for the uniform claw family

**Disposition: retained, proposed computer-assisted verification at the exact family scope.** The F critic retained it. The U critic narrowed its status solely because its local Python shim could not execute; that is a replay limitation, not a mathematical defect. I ran the pinned replay with `/Library/Frameworks/Python.framework/Versions/3.11/bin/python3` in this scratch directory. Its `RESULTS.json` is byte-identical to the pinned route result. I also checked the rational analytic cutoffs and short-factor inequalities in `ANALYTIC-CHECK.json`. The proof below is included because synthesis cannot reopen this route. The dependency on the forest descent bound is checked against the common-pinned `inputs/C4-r27-linear-bound-intake/Main.lean`, line 1458, its theorem contract and verification receipts: for a finite acyclic graph, `Delta_k<0` implies `n<=4k`, without an extra hypothesis. The finite base for the family is exact integer computation, not a Lean certificate.

Let `T_m`, `m>=1`, consist of path `a-b-r` and `m` centers adjacent to `r`, each center with three private leaves. Set `L=1+z`, `B=L^3+z=1+4z+3z^2+z^3`. The tree has `n=4m+3` and `alpha=3m+2`. Conditioning on whether `r` is present, and doing the analogous original-leaf deletions, gives

```
P=I(T_m)=(1+2z)B^m+zL^(3m+1),
A0=I(T_m-a)=LB^m+zL^(3m),
A*=I(T_m-c)=(1+2z)(1+3z+z^2)B^(m-1)+zL^(3m),
```

where `c` is any private tip. There are exactly two original-leaf orbits: `a` and the `3m` private tips. With `q_v=I(T_m-{v,s_v})-I(T_m-N[s_v])`, direct deletion gives

```
q_a=zL^(3m),
q_c=z(2+z)(1+2z)B^(m-1)+zL^(3m),
Q=q_a+3m q_c=zR,
R=3m(2+5z+2z^2)B^(m-1)+(3m+1)L^(3m).
```

For example, deleting `a,b` leaves `B^m+zL^(3m)`, whereas deleting `N[b]` leaves `B^m`. For a private tip, deleting it and its center leaves `L^2[(1+2z)B^(m-1)+zL^(3m-2)]`, whereas deleting that center's closed neighborhood leaves `(1+2z)B^(m-1)`. These are the original support/neighborhood operations; every private tip is a distinct summand. If both leaf orbits are favorable, the *complete* selected sum is `S=Delta_(p-1)(Q)=R_(p-1)-R_(p-2)`.

Here is the analytic tail, valid for **every** `m>=1000` and integer `m<=j<=2m+2`. For `Z=A0,A*,R`, write `Z=a+b` with respective main and perturbation parts

```
a: LB^m ; (1+2z)(1+3z+z^2)B^(m-1) ; 3m(2+5z+2z^2)B^(m-1),
b: zL^(3m) ; zL^(3m) ; (3m+1)L^(3m).
```

Gurvits, *A short, based on the mixed volume, proof of Liggett's theorem on the convolution of ultra-logconcave sequences*, Theorem 1.1, [arXiv:0804.1181](https://arxiv.org/pdf/0804.1181), states that convolution of nonnegative ULC(`d1`) and ULC(`d2`) sequences is ULC(`d1+d2`). The actual factor hypotheses hold: `B` is ULC **of order 4**, with normalized entries `(1,1,1/2,1/4)` through its degree 3; it is not used as ULC(3). `L` and `1+2z` are ULC(1), and `1+3z+z^2`, `2+5z+2z^2` are ULC(2). Every factor has positive interval support. Thus each main `a`, and each `H` below, is ULC of the sum of those finite orders. At a positive interior rank, its normalized-binomial inequality yields `a_j^2-a_(j-1)a_(j+1)>=a_j^2/(j+1)`; the same holds for `H`. These applications match the cited theorem's finite-order hypothesis.

Each displayed factor `F` of degree `d` satisfies the coefficientwise inequalities `(2/3)(dF-zF')<=F'<=2(dF-zF')`. Product differentiation gives `(2/3)(D-r)/(r+1)<=a_(r+1)/a_r<=2(D-r)/(r+1)` for a product of degree `D`. On the stated interval, the adjacent main ratios in either direction are at most 4 and those of the binomial perturbations at most 3. The perturbation's own LC margin is nonnegative, so expansion gives `Z_j^2-Z_(j-1)Z_(j+1)>=a_j^2/(j+1)-24a_jb_j`.

All three main parts dominate `c_a B^(m-1)` coefficientwise, with `c_a=1,1,6m`; the perturbation is `c_b z^s L^(3m)` with `s=1,1,0` and `c_b/c_a<=1`. Keep the `h=8` summand in `(L^3+z)^(m-1)`. Its quotient against `binom(3m,j-s)` is

```
binom(m-1,8) * (j-s)_(8-s) * (3m-j+s)_(19+s) / (3m)_27.
```

Here `j-s` lies in the central range, every one of the 27 numerator factors is at least `m-20>=49m/50`, every denominator factor is at most `3m`, and `binom(m-1,8)>=(124m/125)^8/8!`. Hence `b_j/a_j<=epsilon=K/m^8` for `K=8!(125/124)^8(150/49)^27`. The exact comparison `24*2003*K/1000^8<1`, and decrease of `(2m+3)/m^8`, make the LC margin strictly positive for all `m>=1000` and all central `j`.

For the mixed minors, write `P=V+d`, `Z=A+b`, with `A=cH`, `V=gH`. The three `(H,c,g)` triples are

```
(B^m, 1+z, 1+2z),
((1+2z)B^(m-1), 1+3z+z^2, B),
(B^(m-1), 3m(2+5z+2z^2), (1+2z)B).
```

For every `r<s`, the small coefficient determinant `c_r g_s-c_s g_r` is nonnegative; its `(0,1)` value is respectively `1,1,21m`. The convolution determinant expands exactly as the sum of these coefficients times `H_(j-r)H_(j+1-s)-H_(j-s)H_(j+1-r)`, each nonnegative by LC and interval support. Its leading term gives main lower bounds `H_j^2/(j+1)`, `H_j^2/(j+1)`, `21mH_j^2/(j+1)`. The pure perturbation minor is nonnegative by binomial LC (`d=(1+z)b` for the deletions; the R case is the sum of two adjacent binomial LC margins). Discarding favorable cross terms, the only adverse terms are `A_(j+1)d_j+b_(j+1)V_j`. Neighbor bounds give respectively `47 epsilon H_j^2`, `431 epsilon H_j^2`, `14688m epsilon H_j^2`. For A0 and A*, the coarse tuples `(A_(j+1)/H_j,V_j/H_j,d_j/b_j,b_(j+1)/b_j)` are `(5,9,4,3)` and `(11,129,4,3)`; for R, with `b0=L^(3m)`, the corresponding tuple using `b0_j` in the last two denominators is `(63m,1161,12,12m)`. The exact cutoff comparisons `47*2003*K/1000^8<1`, `431*2003*K/1000^8<1`, and `(14688/21)*2003*K/1000^8<1` (largest about `0.7925402`) prove `Z_jP_(j+1)-Z_(j+1)P_j>0` for all three Z on the complete central interval for `m>=1000`. `ANALYTIC-CHECK.json` records the exact rational comparisons, derivative checks, and coefficient minors.

For `m=3..999`, the exact replay constructs `B^m` independently via `B(B^m)'=mB'B^m` and `L` powers via binomial coefficients. It checks every central `j=m..2m+2`: `1,507,464` strict LC margins and `1,507,464` strict mixed minors, with no failure; respective minima are `1210` and `1243`, both at `(m,Z,j)=(3,A*,8)`. It checks all `276,938` eligible `(m,p)` rows for `m=1..999`, both strict leaf-orbit selectors and the full sum, with no failure. It finds `x(T_1)=2`, `x(T_2)=4`, so these two families have no eligible `p`. This is a finite exact-integer base, with explicit lower/upper boundary and no extrapolation.

Finally, the formally verified forest order bound gives `4m+3<=4x(T_m)`, hence `x>=m+1`. The strict alpha guard is `3p<6m+5`, hence `p<=2m+1`, and `x+2<=p` implies `x<=2m-1`. Thus for any eligible `m>=3`, `x` and all needed propagation ranks are in the central interval. At `j=x`, `Delta_x(P)<0` and each positive mixed minor give `Z_(x+1)/Z_x<P_(x+1)/P_x<1` for `Z=A0,A*,R`. Strict LC makes subsequent positive coefficient ratios nonincreasing. It follows that `Delta_p(A0)<0`, `Delta_p(A*)<0`, and `R_(p-1)-R_(p-2)<0`. Both original-leaf orbits are strictly selected; with their exact multiplicities, `S(T_m,p)<0`. There is no assumption of LC or no-recovery for `P`.

This proves the stated family theorem with a computer-assisted finite base and an externally established convolution theorem. It gives no theorem for heterogeneous branches or arbitrary ordinary trees.

## T2: bounded heterogeneous star census

**Disposition: retained at finite computational scope.** The graph has path `0-1-2` and `m` center branches of arities `r_i in {2,3,4}` attached at `0`, with `1<=m<=10` and a nondecreasing arity profile. Write `N=sum r_i`, `B_r=L^r+z`. Then `I_T=(1+2z)prod_i B_(r_i)+zL^(N+1)`; deleting endpoint `2` gives `L prod_i B_(r_i)+zL^N`, and deleting a private tip in branch `i` gives `(1+2z)B_(r_i-1)prod_(h!=i)B_(r_h)+zL^N`. The exact DP enumerates all `sum_(m=1)^10 binom(m+2,2)=285` unordered profiles, all complete independence vectors, terminal-zero-extended first descents, each eligible `p`, every original leaf's strict selector delta and deletion summand. There are `913` eligible rows, all with every original leaf selected and strict `S<0`; maximum `S=-275` at profile `(3,4)`, `a=9,x=4,p=6`. I regenerated `PROFILE-CENSUS.json` in scratch; its SHA-256 is byte-identical to the pinned source. Both critics retained this finite result, and the F critic additionally recalculated all 285 vectors and 24,786 leaf records by branch factors. No central-curvature/mixed-minor inequality or effective unbounded debt estimate was proved for heterogeneous factors, so there is no infinite-family conclusion.

## T3: matching-only slack obstruction, with corrections

**Disposition: retained_narrowed.** In the ordinary tree with edges `sv,sw,sz,zy1,zy2`, leaf `v` has support `s`; `H_v=T-{v,s}` is isolated `w` plus the star `zy1,zy2`, and `W_v={w,z}`. For `k=1`, marked `A={w}`, `h=3`, `nu(H_v)=1`, all `z,y1,y2` are addable. Thus `e(A)=3` and `2(h-k)-e(A)=1<2(h-k-nu(H_v))=2`. This is a realizable counterexample to that **intermediate per-set matching-only lower bound**. For an arbitrary fixed matching `M`, partition its edges by 2,1,0 endpoints in the addable set `J_A`, counted as `m2,m1,m0`, and let `u` count unmatched addable vertices. Then exactly `e=2m2+m1+u` and `2(h-k)-e=2(h-k-nu(H))+2m0+m1-u`. Both critics correctly identified two errors in the source evidence: for `M={zy1}`, `(m2,m1,m0,u)=(1,0,0,1)`, not `(0,0,1,3)`; and the lower-region guard holds (`3p=6<9=2a+1`) at `p=2`. The graph's independence vector is `(1,6,10,6,1)`, `x=2`, so `x+2<=p` fails. Even its complete selected sum `S=8` is ineligible. No across-tag bound for the adverse unmatched term plus `C` is proved.

## T4: pendant-path selector state, with singleton boundary

**Disposition: retained_narrowed as an exact evaluation recurrence.** For rooted finite `G,r`, let `A=I(G-r)`, `B=zI(G-N[r])`, and let `P_0=1`, `P_1=1+z`, `P_m=P_(m-1)+zP_(m-2)`. Attaching an `m`-vertex path at `r` gives `I(G_m)=A P_m+B P_(m-1)` by the absent/present root partition. For every surviving old original leaf `v!=r`, apply it to `G=T-v` rooted at `r` and take the strict coefficient difference at rank `p`; equal-support tags remain separate. The new endpoint's deletion leaves `T_(m-1)`; a root of old degree one ceases to be a leaf. The controller appendix identifies a small completeness boundary: if the parent tree is the singleton `K1`, its degree-zero root becomes an additional leaf after attachment. Include that root test when claiming a *complete* post-attachment leaf inventory. For parent order at least two, the listed interface is complete. The source example `K1,7`, adding a leaf at its center, changes an old leaf's `Delta_3(T-v)` from `-5` to `0`; it is outside primary eligibility (`x=4`, `p=3`). The recurrence neither preserves eligibility nor bounds full `S`.

## T5: matching up-map and its disjoint primary rank window

**Disposition: retained_narrowed as a standalone rank lemma.** Let `J_h` be `h` disjoint edges, `V_r` the real space on independent `r`-sets, `U_r` the unsigned add-one-vertex map, `D_(r+1)=U_r^*`, and `R_r` the endpoint-swap operator. Counting diagonal and off-diagonal transitions gives `D_(r+1)U_r-U_(r-1)D_r=(2h-3r)I-R_r` (take `D_0=0`). Each swap component is an `r`-cube, so `||R_r||<=r`, whence `||U_rf||^2-||D_rf||^2>=(2h-4r)||f||^2`. Thus `U_r` is injective for `0<=r<h/2`, and so are a tag-preserving direct sum of qualifying blocks and its marked-column restriction. Both critics retained this algebra. The controller rank appendix supplies a stronger relevance limit that they did not incorporate: if an actual `H_v=T-{v,s_v}` is exactly `J_h` with no isolates, then `|T|=2h+2`; the admitted forest bound gives `2h+2<=4x(T)`, and primary eligibility gives `r=p-1>=x+1>h/2`. Hence **no eligible primary tag with pure-matching `H_v` lies in this lemma's injective range**. It proves no capacity after tag blocks are merged and no `D+C` budget. The lemma is valid but has no direct eligible-tree application under its own graph hypothesis.

## T6: six-cover third-shell witness

**Disposition: retained_narrowed to failure of a universal cover threshold.** Form the 24-vertex tree with root `0`, six center neighbors, five with three private leaves and one with two. The six centers are a vertex cover, and each branch forces at least one cover vertex, so `tau=6`. Its polynomial is `B_3^5 B_2+zL^17`, with exact coefficients `(1,24,253,1566,6400,18419,38970,62650,78593,78515,63348,41582,22199,9548,3240,836,154,18,1)`. Thus `alpha=18`, `x=8` (`Delta_8=-78`), `p=10=x+2`, `3p=30<37=2alpha+1`, and `n=2p+4`. All 17 original tips satisfy the strict selector: each of the 15 tips on a three-tip branch has `Delta_10(T-v)=-12357` and summand `-7537`; each of the two on the two-tip branch has `Delta_10(T-v)=-13234` and summand `-4875`. Therefore the complete tagged sum is `15(-7537)+2(-4875)=-122805`. The two critics replayed the pinned evaluator, and one independently checked the branch-factor polynomial. This disproves `tau>=7` as a **universal property** of eligible trees in this slice, and invalidates any proof that silently omits low-cover cases on that premise. It does not disprove a conditional theorem *restricted* to `tau>=7`, and its negative `S` is consistent with the primary claim. The cover-state identity `I_G=sum_(A subset C independent) z^|A| L^|I\N(A)|` for vertex cover `C` and independent complement `I` is exact, but supplies no sign estimate.

## Remaining primary obligation

For the fixed selector `F(T,p)` and `k=p-1`, the optional marked incidence identity rewrites the target as `k S=(2a+1-3p)Q-sum_F(D_v+C_v)`, where `Q=sum_F q_v(k)`. The strict lower-region coefficient is positive. T1 proves compensation for its particular two-orbit family; T2 checks a finite heterogeneous box; T3 exposes an adverse unmatched-addable term; T4 and T5 are local interfaces; T6 removes a cover-threshold shortcut. None establishes `sum_F(D_v+C_v)>=(2a+1-3p)Q` for arbitrary eligible ordinary trees or supplies a positive eligible complete sum. The all-tree assertion therefore remains proposed open. The T1 all-m result depends on the cited finite-order ULC theorem and formally verified R27 order bound, and its large but finite base remains computer-assisted.
