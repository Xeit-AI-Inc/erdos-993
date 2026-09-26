# Controller candidate: heterogeneous arities2..4 with at least100000 branches

Unawarded preparation for independent audit and Cycle6. This is an effective restricted infinite-family statement, not a claim about the finite prefix or arbitrary trees. No Lean certificate exists.

## Exact proposed theorem and graph bridge

Take path0-1-2, and at vertex0 attach m distinct centers, each with r_i private leaves, where r_i in{2,3,4} and m>=100000. Let N=sum r_i, so2m<=N<=4m. For every p with x(T)+2<=p and3p<2alpha(T)+1, the complete original strict favorable-leaf aggregate is strictly negative.

The original leaves are endpoint2 and all N private leaves, with separate tags. Put L=1+z, B_r=L^r+z, Q=prod_i B_(r_i), and H_i=prod_(h!=i) B_(r_h). Root exclusion permits at most N+1 vertices; root inclusion permits N+2, attained by0,2 and all private leaves. Thus alpha=N+2 and n=N+m+3. Root splitting gives

P=(1+2z)Q+zL^(N+1), A0=LQ+zL^N,
A_i=(1+2z)B_(r_i-1)H_i+zL^N.

A0 is endpoint deletion, A_i is deletion of any private leaf at center i. Define F_r=(L^(r-1)-1)/z. Direct support deletion gives full all-leaf marked polynomial zR with

R=(N+1)L^N+(1+2z)sum_i r_i F_(r_i)H_i.

Put t=(N+1)/N and Z_i=(1+2z)F_(r_i)H_i+tL^N; then R=sum_i r_i Z_i. We will prove central LC and crossing minors for A0, every A_i and every Z_i separately. No LC-of-mixtures assertion for R is needed.

## Curvature, degree and neighbor bounds

Use the same cited finite-order ULC convolution theorem as the audited T_m argument (Gurvits arXiv0804.1181 Theorem1.1, Liggett). B1=(1,2) is ULC1, B2=(1,3,1) ULC2, B3=(1,4,3,1) ULC4, B4=(1,5,6,4,1) ULC7. For B4 the normalized list is(1,5/7,2/7,4/35,1/35); its three inequalities are direct, with equality in the middle. F2=1 is a positive constant, F3=2+z is ULC1, F4=3+3z+z^2 is ULC3 (normalized3,1,1/3). L and1+2z are ULC1. All supports are positive intervals; constant factors only scale. Therefore every main factored sequence and common convolution factor below is Poisson-ULC, giving a_j^2-a_(j-1)a_(j+1)>=a_j^2/(j+1).

For every nonconstant small factor F just listed, direct coefficient comparison gives

(1/3)(dF-zF') <= F' <=2(dF-zF'), d=degree F.

(The sharper2/3 lower constant from T_m does NOT work for F3=2+z.) Products preserve these inequalities. All main terms and common H factors below have degree between N-3 and N+1. Throughout the integer central interval N/4<=j<=2N/3+3, and at m>=100000, both adjacent main/H ratios are <=8. Indeed right ratio <=2(D-j)/(j+1)<8; left ratio <=3j/(D-j+1)<=3(2N/3+3)/(N/3-5)<=8 for N>=74. Successive left shifts up to4 obey the same cap. Binomial L^N or zL^N neighbor ratios are <=4 in this interval. All denominators and needed indices are positive.

## Uniform perturbation coefficient bound

For each omitted branch i, expanding eight additional-z choices gives

H_i >=coeff binom(m-1,8) z^8 L^(N-36),

because r_i<=4 and each of eight removed arities is <=4. Also Q>=coeff H_i. Set b0=L^N. For s0 or1 and central j, the binomial quotient in this lower bound is

binom(N-36,j-8)/binom(N,j-s)
 = (j-s)_(8-s)(N-j+s)_(28+s)/(N)_36.

Every factor in the first numerator product is >=N/5 and every factor in the second is >=N/4 when N>=384 and j lies in the stated interval. The denominator factors are <=N. Thus the quotient is >=1/(5^8*4^28) for either s. Moreover binom(m-1,8)>=(m/2)^8/8! for m>=16. Consequently

(b0)_j/(H_i)_j <= epsilon,
(z b0)_j/(H_i)_j <= epsilon,
epsilon=K/m^8, K=256*8!*640^8=290536219160925437952000000000.

The same inequalities hold with any coefficientwise larger common H. Main terms of A0,A_i,Z_i are coefficientwise >=H_i. Their perturbations are zb0,zb0,tb0 respectively, with1<t<=2. Thus b_j/a_j<=2epsilon for all cases. The LC adverse cross terms are <=64a_jb_j (two products bounded by8*4), so all these central LC margins are positive if128(j+1)epsilon<1.

## Mixed minors against P

Write Z=a+b=cH+b and P=V+d=gH+d, with d=z(1+z)b0. Use the same convolution minor identity as the T_m proof. The following small coefficient ratios c_r/g_r are nonincreasing, so all coefficient minors are nonnegative:

* A0: H=Q,c=L,g=1+2z, 0,1 minor1.
* A_i: H=(1+2z)H_i,c=B_(r_i-1),g=B_(r_i), 0,1 minor1.
* Z_i: H=(1+2z)H_i,c=F_(r_i),g=B_(r_i), 0,1 minor3,7,12 for r_i2,3,4 respectively.

The main mixed minor is therefore at least H_j^2/(j+1) in deletion cases and3H_j^2/(j+1) in marked cases. Pure perturbation minors are nonnegative by binomial LC: deletion b=zb0 has d=(1+z)b; marked b=tb0 gives t times the same two nonnegative binomial products used in the T_m proof. Bound only the two adverse mixed products a_(j+1)d_j+b_(j+1)V_j.

In deletion cases, coefficient envelopes c<=(1,4,3,1),g<=(1,5,6,4,1) with H-left ratios<=8 and H-right ratio<=8 give

a_(j+1)<=100H_j,
V_j<=6569H_j (1+5*8+6*8^2+4*8^3+8^4),
d_j<=5b_j, b_(j+1)<=4b_j.

Thus adverse products <=26776epsilon H_j^2. These envelopes also cover A0.

In marked Z_i cases c<=(3,3,1), so a_(j+1)<=35H_j; V_j<=6569H_j as before; d_j<=20(b0)_j, b_(j+1)<=8(b0)_j because t<=2. Thus adverse products <=53252epsilon H_j^2. Dividing by the main coefficient3, the needed constant53252/3 is smaller than26776.

All LC and mixed inequalities follow from26776(j+1)epsilon<1. Since j+1<=2N/3+4<=3m for m>=12, it suffices that80328*K/m^7<1. At m100000 this exact rational is0.23338193412758818...<1, and it decreases with m. The cutoff is intentionally conservative; no large finite-profile census is asserted.

## Original-selector and complete-sum conclusion

The already formal forest order bound gives n<=4x, hence x> N/4. The strict lower guard gives p<=floor((2N+4)/3), and eligibility x<=p-2 places x and all needed subsequent ranks inside the central interval. At j=x, P_(x+1)<P_x and the positive mixed minors imply A0,A_i,Z_i all strictly decrease. Their own central LC propagates strict decrease through deletion rank p and marked rank p-2. Hence every original leaf is strictly favorable, and

S(T,p)=R_(p-1)-R_(p-2)=sum_i r_i[(Z_i)_(p-1)-(Z_i)_(p-2)]<0.

No monotonicity of P after x, no LC of the sum R, and no transfer to arbitrary trees is used. Remaining debt: independent audit of every graph formula, small-factor hypothesis, coefficient/index bound, cutoff and selector propagation; no finite-prefix m<100000 statement or Lean award follows from this proposal.
