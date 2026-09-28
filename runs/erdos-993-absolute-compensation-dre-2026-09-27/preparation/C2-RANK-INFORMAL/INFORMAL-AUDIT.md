# Independent informal audit: absolute coefficient rank bound

## Result and scope

**PASS as an informal mathematical proof of the exact coefficient theorem below.** No gap or false local certificate was found. This is a mathematical assessment, not a Lean verification, workflow receipt, or judgment on the separate payment conjecture.

Let `rs` be any finite list of natural numbers, each in `{2,3,4}`, including the empty list. Put `N = sum rs`, `L=1+X`, `G=1+2X`, `B_r=L^r+X`, `q=N+1`, and

`P=G * product_(r in rs) B_r + X*L^q` in `Q[X]`.

For every natural `k`, write `a_k=coeff(P,k)` with the usual zero extension beyond the degree. The audited conclusion is

`a_(k+1)<a_k  =>  2N<=5k`.

There is no least-descent hypothesis and no extra positivity or log-concavity hypothesis. The ordered list may have repeated arities. The coefficient theorem is the entire scope of this audit.

## Independent proof

For a natural **weight** `d` and a polynomial `f` over `Q`, define

`D_d(f)=(3+2X)f' - 2d f`.

Direct differentiation, without a degree assumption, gives the weighted product identity

`D_(d+e)(fg)=g D_d(f)+f D_e(g)`.

The local factors and exact certificates are:

| factor `f` | assigned weight `d` | `f` | `D_d(f)` |
|---|---:|---|---|
| `G` | 1 | `1+2X` | `4` |
| `B_2` | 2 | `1+3X+X^2` | `5` |
| `B_3` | 3 | `1+4X+3X^2+X^3` | `6+2X+3X^2` |
| `B_4` | 4 | `1+5X+6X^2+4X^3+X^4` | `7+6X+12X^2+4X^3` |

Every displayed factor and certificate has nonnegative rational coefficients. The product identity therefore proves coefficientwise `D_q(C)>=0` for `C=G*product B_r`: the assigned weights sum to `1+sum rs=q`. This also works when `rs=[]`, since then `C=G` and `q=1`.

The other summand has the **same assigned weight** `q`. In detail, `D_0(X)=3+2X` and `D_1(L)=1`. Since `q>=1`, repeated use of the product identity yields `D_q(L^q)=qL^(q-1)`, hence

`D_q(XL^q)=(3+2X)L^q+qX L^(q-1)`.

This polynomial has nonnegative coefficients. Additivity now gives `D_q(P)>=0` coefficientwise. The use of weight `q` is deliberate: `C` has actual degree `q`, while `XL^q` and `P` have actual degree `q+1=N+2`. The operator's subscript is an assigned weight, not a requirement that it equal polynomial degree. In fact the highest coefficient of `D_q(P)` is `2`, as the formula predicts.

For any natural `k`, coefficient extraction in `Q[X]` gives, with `a_i=0` beyond the support,

`coeff(D_q(P),k)=3(k+1)a_(k+1)+2k a_k-2q a_k = 3(k+1)a_(k+1)-2(q-k)a_k >= 0`.

The expression `q-k` here is an integer or rational difference after casting; it must **not** be truncated natural subtraction. All `a_i` are nonnegative because `G`, each `B_r`, and `XL^q` have nonnegative coefficients and sums/products preserve this property.

Suppose for contradiction that `a_(k+1)<a_k` and `2N>5k`. The natural-number inequality gives `2N-5k-1>=0`, and

`2(q-k)-3(k+1)=2N-5k-1>=0`.

The strict drop and `a_(k+1)>=0` imply `a_k>0`. Thus

`3(k+1)a_(k+1) < 3(k+1)a_k <= 2(q-k)a_k`,

contradicting the extracted certificate. Therefore `2N<=5k`. The last weak inequality only needs `a_k>=0`; the displayed strict version explicitly verifies the positive-coefficient implication used in the contradiction. No caller-supplied positivity assumption is hidden.

## Boundary and indexing checks

- For `rs=[]`, `N=0`, `q=1`, and `P=1+3X+X^2`. Its strict drops are at `k=1,2`; both meet the conclusion. The general contradiction is vacuous when `2N=0`.
- For any profile with `m=len(rs)`, `a_0=1` and `a_1=N+m+3>=3`, so `k=0` is never a strict drop.
- `P` has degree `N+2=q+1` and leading coefficient `1`. It has positive coefficients in every degree from `0` through `N+2`: the product `C` is positive through degree `q`, and `XL^q` is positive through degree `q+1`. Thus the terminal strict drop occurs at `k=N+2`, where `a_(k+1)=0`; its bound is automatic and is also covered by the proof. At every larger `k`, both coefficients vanish, so no strict drop occurs. The coefficient identity above remains valid at and beyond the terminal index.
- The boundary `5k=2N-1` gives equal multipliers in the coefficient inequality, hence still forbids a strict drop. Equivalently, `5k>2N-1` is `5k>=2N` for integers. No parity or rounding exception remains.

## Source comparison and limitations

I read the specified C2 intake draft, C3 formal lead, C2 synthesis rank passage, solution contract, and frozen Lean workflow document as evidence. The C3 direct-parent formula and rank conclusion survive this audit. Its warning that the differential weight of `P` differs from its degree is essential. The earlier route that first certifies `C` and then checks a separate binomial rise is unnecessary for this theorem; the direct parent certificate proves the needed inequality. I found no mathematical error in the scoped rank argument. I make no assessment here of graph interpretation, selectors, MASS, payment, novelty, or any formalization status.

The proof is universal and symbolic. The finite computation below is a separate falsification check, not a substitute for it. No Lean source, build, controller state, source document, reviewer assignment, or authoritative receipt was created or changed.

## Exact independent falsification sweep

The auditable script is [rank_falsification.py](rank_falsification.py); its captured stdout is [FALSIFICATION-OUTPUT.txt](FALSIFICATION-OUTPUT.txt). Replay from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 rank_falsification.py 30
```

It enumerates every count triple `(n_2,n_3,n_4)` with `n_2+n_3+n_4<=30`, representing every ordered arity list of that size because the factors commute. It builds the polynomials by exact integer convolution, independently reconstructs the product from the center-choice/binomial sum, checks all four local certificates and the weighted product identity at each prefix, checks the direct-parent certificate, and tests every natural rank from `0` through `N+5`, including the terminal and three zero-extended ranks. Above that range both coefficients are zero. All arithmetic is integer exact; there are no floats, random samples, or external packages.

Captured output:

```text
PASS: exact integer exhaustive count-profile sweep
max_factors=30 profiles=5456 checked_k=401016 strict_drops=201378 empty_profiles=1 max_N=120
Checks: local certificates; product identity; direct binomial expansion; parent certificate; zero extension; every strict descent and band rank.
```

The sweep establishes absence of a counterexample only for profiles of at most 30 factors (`N<=120` within that domain). The universal assertion rests on the algebraic proof above.
