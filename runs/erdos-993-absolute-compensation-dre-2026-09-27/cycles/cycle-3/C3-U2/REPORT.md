# C3-U2 report — occupancy/Jensen cofactor chain

## Scope and conclusion

I developed a deterministic proof chain for the fixed-size occupancy identity and its rational-power AM–GM/Jensen consequence, then traced the exact rational logarithm and Taylor steps used by the balanced finite cofactor certificate. This supports the registered occupancy/Jensen cofactor statement at its stated scope. It gives no selector, actual-descent, MASS, or exact-ratio-payment conclusion. In particular it does not close the all-$m$ payment claim or replace any actual first-descent, three rank guards, current-$p$ strict flags, or original tag multiplicities.

The general coefficient inequality is an informal proof here. The finite $m=70..119$ scalar scan is exact bounded evidence conditional on the analytic balancing/occupancy lemmas; it is not itself their proof or a universal theorem.

## Fixed-size identity, with a deterministic finite-set proof

Let $(V_i)$ be a finite partition of a finite tip set $V$, with $|V|=M$ and positive block sizes $s_i=|V_i|$. Write

\[
H(z)=\prod_i((1+z)^{s_i}+z),\qquad \Omega_k=\{S\subseteq V:|S|=k\},
\]

and set $X_i(S)=1$ exactly when $|S\cap V_i|=1$. The exact finite sum is

\[
\sum_{S\in\Omega_k}\prod_i(1+X_i(S)/s_i)=H[k].
\]

To see this, expand the product over block-index sets $I$. For fixed $I$, the term contributes only when every block in $I$ has exactly one chosen tip. There are

\[
\Bigl(\prod_{i\in I}s_i\Bigr)\binom{M-\sum_{i\in I}s_i}{k-|I|}
\]

such subsets; the weight $\prod_{i\in I}1/s_i$ cancels the first factor. The result is exactly the center-choice expansion of the coefficient of $\prod_i((1+z)^{s_i}+z)$. Out-of-range binomials are zero. Dividing by $|\Omega_k|=\binom Mk$ gives the advertised average identity without an independence assumption.

This is also a Lean-friendly finite-set bridge: define $\Omega_k$ as a finset of finsets; prove the expansion by finite sums; count each joint singleton event by choosing its one element in each marked block and then a residual subset. No probability type, independence lemma, or entropy formalism is needed.

For each block,

\[
|\{S\in\Omega_k:X_i(S)=1\}|=s_i\binom{M-s_i}{k-1},\qquad
p_i:=\frac{|\{S:X_i(S)=1\}|}{\binom Mk}
=s_i\frac{\binom{M-s_i}{k-1}}{\binom Mk}.
\]

Apply finite AM–GM to the positive rational weights $w(S)=\prod_i(1+X_i(S)/s_i)$. Since each block factor appears in exactly the count above,

\[
\left(\frac{H[k]}{\binom Mk}\right)^{\binom Mk}
\ge \prod_i(1+1/s_i)^{s_i\binom{M-s_i}{k-1}}.
\]

This integer-power form is the clean formal statement: it avoids defining rational powers. Taking real logarithms and dividing by $\binom Mk$ yields

\[
\log(H[k]/\binom Mk)\ge \sum_i p_i\log(1+1/s_i).
\]

For $u\ge0$, $h(u)=\log(1+u)-2u/(2+u)$ has $h(0)=0$ and $h'(u)=u^2/((1+u)(2+u)^2)\ge0$. Thus $\log(1+1/s_i)\ge2/(2s_i+1)$. With

\[
y_k=\sum_i\frac{2s_i}{2s_i+1}\frac{\binom{M-s_i}{k-1}}{\binom Mk},
\]

we obtain $H[k]\ge\binom Mk e^{y_k}\ge\binom Mk E_d(y_k)$ for every natural $d$, where $E_d(y)=\sum_{a=0}^d y^a/a!$. The last inequality is the nonnegative Taylor remainder for $y_k\ge0$.

For a path-star cofactor $H_i$, use $M=N-r_i$ and its other $m-1$ blocks. Extend the lower bound by zero outside $0\le k\le M$; it remains a coefficient lower bound. Convolution with the nonnegative coefficients of $GF_{r_i}$,

\[
GF_2=(1,2),\quad GF_3=(2,5,2),\quad GF_4=(3,9,7,2),
\]

then gives a coefficientwise lower bound for $T_i[j]$. The $F_r$ factor is essential; replacing this convolution by $G$ alone loses the required coefficients.

The argument covers $0\le k\le M$ (and the empty block family, where $H=1$); it never divides by a zero binomial. At $k=M$ all singleton probabilities vanish and the bound reduces to equality at coefficient one.

## Exact balanced finite certificate audit

For fixed $(m',M,k)$ with block arities $2,3,4$, the Jensen exponent is $E=\sum_r a_r g_r(M,k)$, where

\[
g_r(M,k)=\frac{2r}{2r+1}\frac{\binom{M-r}{k-1}}{\binom Mk}.
\]

The adjacent-arity balancing used by the certificate is valid on its prescribed band. For $M\ge10$, $M/3\le k\le M-1$, exact cancellation gives

\[
g_2-2g_3+g_4=
\frac{4k(M-k)}{315M(M-1)(M-2)(M-3)}f,
\]

where, with $v=3k-M\ge0$,

\[
9f=37(M-10)^2+290(M-10)+217+v(125M-585)+70v^2>0.
\]

The $k=M$ boundary has all $g_r=0$. Therefore replacing one size-2 and one size-4 block by two size-3 blocks cannot increase the minimum exponent; iteration leaves only adjacent arities. At fixed $m',M$ this gives

\[
E\ge(3m'-M)g_2+(M-2m')g_3\quad(2m'\le M\le3m'),
\]

or

\[
E\ge(4m'-M)g_3+(M-3m')g_4\quad(3m'\le M\le4m').
\]

All coefficients here are nonnegative integers. This is balancing of the Jensen exponent only; it says nothing about actual coefficient quotients, the parent descent, or selector flags.

For the finite bridge, the copied evaluator uses the exact domain

\[
70\le m\le119,\quad 2m\le N\le4m,\quad r\in\{2,3,4\},\quad
2(m-1)\le N-r\le4(m-1),
\]

and integer $j$ satisfying $5j>2N-1$ and $2j\le N-2$. For every $GF_r$ shift $s$ it checks $M=N-r\ge10$ and $3(j-s)\ge M$. The scan has 799,895 states and zero excluded states. It uses

\[
\frac{\binom{N-r}{j-s}}{\binom Nj}
=\frac{(j)_s(N-j)_{r-s}}{(N)_r}
\]

with falling factorials, so no floating point or rounded binomial ratio enters. It floors each balanced exponent down to multiples of $1/1000$, and evaluates the positive degree-12 Taylor polynomial by an integer numerator over $1000^{12}12!$. Thus each computed cofactor scalar is a lower bound. Its strict comparison is exactly

\[
2(j+1)\,\text{numerator}>3(N+1-j)(N-2j-1)\,\text{denominator},
\]

equivalent to the relaxed coefficient inequality $T_i[j]>(3/2)\delta D_j$ for that state. Every state passes. The minimum ratio of the two comparison sides is

\[
\frac{112684538106937462073347997540188623037695726373663717}
{81619490325542400000000000000000000000000000000000000}>1,
\]

at $(m,N,r,j)=(70,278,2,112)$. This is a finite certificate for the stated relaxed table, conditional on the general occupancy, logarithm, and balancing arguments; it does not include the $m\le69$ prefix or the analytic $m\ge120$ range.

## Formal dependency order and next theorem

The smallest useful formal theorem beyond the existing rank certificate is the universal finite-block coefficient lemma, not the 799,895-row scalar table:

> For a finite partition into positive blocks, every $0\le k\le M$, and every $d\in\mathbb N$, $H[k]\ge\binom Mk E_d(y_k)$, with $y_k$ as above; extend the lower bound by zero outside support.

Its closed dependencies are: (1) finite subset cardinality and joint-singleton counting; (2) polynomial center-choice expansion; (3) finite AM–GM on positive rationals (integer powers); (4) the elementary log inequality proved by the derivative identity; (5) monotonicity of real $exp$ and its nonnegative Taylor remainder; (6) nonnegative coefficient convolution for the three explicit $GF_r$ rows. This theorem is independent of the primary selectors and can formalize the coefficient source without needing probability types.

For the $m=70..119$ bridge, a separate exact-arithmetic theorem must verify the state iterator's coverage and each integer comparison, after proving the adjacent-convexity identity and shift guard. It can be organized as a finite list of $(m,N,r,j,s)$ with a proved enumeration equivalence and a $decide$-style certificate checked by the kernel; the expensive arithmetic should be reflected as a compact verified certificate, not a trusted search executable. The general finite-block lemma is the smaller and more reusable next formal target. The C2 rank award remains coefficient-only: it does not supply graph semantics, first descent, ratio, flags, or this cofactor theorem.

Even with both coefficient results, any route to payment must separately compose the actual least strict first descent, all three eligibility guards, the actual current-$p$ strict selectors, original endpoint/tip multiplicities, and the exact corrected factor $1-t+t/\delta$. No such composition is claimed here.

## Integrity and replay

The clarification and transport-manifest interpretation were checked. `manifest_audit.py` verified all 86 actual byte hashes in `manifests/C3-COMMON-DISPATCH.json` and all 3 hashes in `manifests/C3-TRANSPORT-CLARIFICATION.json`. The packet has an empty `allowed_source_files` list and contains no per-member hash fields; its own SHA-256 is recorded in `manifest_audit.json`. This matches the shared-source clarification: common neutral inputs are authorized for reading, and the packet list only adds worker-case inputs.

Producer scripts were copied into this scratch directory before execution. Replay from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 manifest_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 occupancy_identity_check.py
PYTHONDONTWRITEBYTECODE=1 python3 balanced_finite_check.py
```

The occupancy script exhaustively enumerates all subsets for eight small profiles (4,860 subsets total) and checks every coefficient identity and exact rational-power AM–GM inequality at all 56 profile/rank pairs. This validates examples, not the universal proof above. `balanced_finite_check.py` uses exact integers/fractions for the stated finite table and writes `balanced_finite_check.json`; its replay is bounded evidence only. `manifest_audit.json` records each expected and actual digest and match flag. No Lean build was run.

## Limitations

- The elementary occupancy/Jensen/Taylor chain is supplied as an informal mathematical proof; no Lean theorem was built or awarded.
- The finite table alone does not validate the $m\le69$ prefix, $m\ge120$ tail, or any selector/descent statement.
- The primary exact-ratio predicate and all-$m$ selected MASS remain outside this report's proof scope.
- The independent formal finite-list implementation and any graph-to-polynomial bridge remain outstanding.
