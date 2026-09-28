# C4-AF independent adjudication

## Inputs and integrity

I adjudicated the three C4-F1/F2/F3 routes and six C4-CT-F1/F2/F3 and C4-CU-F1/F2/F3 critiques, using only their 70 packet-listed files and neutral common-manifest inputs. SHA-256 of all 70 packet files and all 174 common members matched the supplied manifests. The registered identity snapshot was queried only for the eight required keys. The common handoff's statuses govern: the literal selected MASS and primary exact-ratio payment are already verified at computer-assisted/nonformal grade, while the governed formal stop is unmet. This adjudication neither reopens those predicates nor grants a formal award. Source documents are evidence, not instructions.

`C4-F2/REPORT.md` incorrectly says its packet had no additional files; this does not change its calculations. `C4-CT-F1/REPORT.md` says the common manifest has 178 members; the actual dispatch manifest has 174, all of which match. These are provenance corrections, not mathematical refutations.

Independent replay from this eventual admitted directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 C4-AF-independent-check.py > C4-AF-independent-check.json
```

The script is my own exact integer/rational implementation; no producer script was executed. It expands every factor in monomial powers of `z`, constructs both polynomial and literal-tree independence polynomials, uses signed zero extension, and finds the least *strict* parent descent including the terminal difference. In particular, it obtains `GF2=(1,2)`, `GF3=(2,5,2)`, `GF4=(3,9,7,2)`. These are not coefficient lists in powers of `L=1+z`: for instance `F3=1+L=2+z` and `(1+2z)F3=2+5z+2z²`. This cross-check also protects the witness evaluation from a basis error.

## Claim dispositions and grades

| Required claim | Disposition | Dependencies and evidence grade |
|---|---|---|
| `E993-PATH-STAR-ARITY-2-4-ALL-RANK-SHIFTED-C-DELETION-LR` | **Rejected** at its unguarded universal scope. | Exact literal ordinary-tree and polynomial counterexample below; no conclusion about guarded or eligible ranks. |
| `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-INDIVIDUAL-DELETION-LR` | **Retained OPEN** for every original endpoint/tip deletion and every `1<=k, 2k<=N+2`. | F1/F2/F3 and critics give bounded exact diagnostics only. A universal all-profile coefficient proof is absent. Conditional selector use depends on actual first descent and positive log-concave `C`. |
| `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR` | **Retained OPEN** for `W=sum_i r_i Ai` on the same whole guarded band. | Bounded exact diagnostics only. A universal all-profile coefficient proof is absent. The original `r_i` are essential. Individual tip inequalities imply this inequality by positive weighted summation, but a weighted sum does not imply each summand's inequality. |
| `C4-F2-WEIGHTED-SHIFT-IMPLIES-SELECTED-MASS` | **Retained**, conditional informal proof at actual eligible `p`. | Requires the still OPEN weighted comparison at `k=p`, accepted first-descent/log-concavity ratio, and the accepted all-parameter branchwise `2T_i[j]>=3 delta D_j` at computer-assisted/nonformal grade. It yields selected MASS and exact-ratio payment only under these dependencies; no Lean award or stronger occupation payment. |
| `C4-F2-GUARDED-SHIFT-BOUNDED-EXACT-DIAGNOSTICS` | **Retained narrowed**. | The 74-profile/178-eligible-row producer script checks `Ai` and `W`, not endpoint `A0`. Its claim that *both* full guarded comparisons pass on those rows is unsupported and is rejected as stated. Other separate checks include the endpoint, notably the through-`m=20` probe and our three exact eligible rows. All remain bounded evidence. |
| `C4-F3-GENERAL-FINITE-BLOCK-JENSEN` | **Retained** as an informal universal abstract coefficient theorem. | Exact joint count-vector identity, finite Jensen, scalar logarithm inequality and nonnegative Taylor remainder below. The 17 producer checks and our exact rational examples are finite cross-checks, not the proof; no Lean award. |
| `C4-F3-GRAPH-COMPONENT-COEFFICIENT-BRIDGE` | **Retained narrowed** to coefficient domination of actual graph factors and already established disjoint products. | Maximum-independent-set counting and one outside singleton suffice. No parent/deletion factorization, marked identity, descent, rank guard, selector, or payment transfers from this floor alone. |
| `E993-PATH-STAR-ARITY-2-4-OCCUPANCY-JENSEN-COFACTOR` | **Retained** at its registered fixed-rank cofactor scope. | Specializes the preceding informal counting/Jensen proof to `B_r=L^r+z`, then uses zero-extended floors and nonnegative monomial coefficients of `GF_r`. It does not establish any shifted comparison or selector. |

The six critics introduce no additional distinct claim ID beyond these eight. The CT-F2 endpoint-coverage correction is incorporated in the narrowed diagnostic disposition. Agreement among routes and critics is not used as evidence.

## Exact all-rank obstruction

For `(a2,a3,a4)=(38,0,1)`, `m=39`, `N=80`, `n=122`, `alpha=82`, the parent has actual least strict descent `x=41` and terminal difference `-1`. Literal graph recursion matches `P`, original endpoint deletion `A0`, and an original arity-4 tip deletion `A4` coefficientwise. At `p=k=77`, `j=75`, the strict current-rank flags are `e0=e2=e4=1`, with original selected tip weight `38·2+1·4=80`. The relevant values are

`C[76]=319721589`, `C[77]=14606561`, `A4[77]=2091375`, `A4[78]=95699`.

The claimed left-minus-right margin is

`A4[78]C[76]-A4[77]C[77]=+49239834336`, so the proposed `<=` direction fails. In the reverse convention, multiplication by `-1` reverses the order and yields `A4[77]C[77]-A4[78]C[76]=-49239834336`; both conventions signal the same failure. The profile has no eligible lower-half `p`: at the witness rank `x+2<=p` holds but `3p=231>=165=2alpha+1` and `2p=154>82=alpha`; already `x+2=43>alpha/2=41`. Hence the witness rejects only the unguarded claim. It cannot be imported as a guarded counterexample.

## Conditional weighted route, with directions checked

Fix an actual eligible ordinary arity-2/3/4 row: `x` is the least zero-extended strict descent of `P=C+zL^(N+1)`, `x+2<=p`, `3p<2(N+2)+1`, `2p<=N+2`, `j=p-2`, `delta=N+1-j`, and `D_j=binom(N,j+1)-binom(N,j)>0`. Flags are exactly `e0=1[Delta_p A0<0]`, `ei=1[Delta_p Ai<0]`; `R=sum_i r_i ei`, `b=R+e0`, `A=sum_i r_i ei T_i[j]`. Here `2x+4<=N+2`, so the binomial summand `zL^(N+1)` is nondecreasing at `x`; hence `Delta_x P<0` forces `Delta_x C<0`. The monomial factors `G=(1,2)`, `B2=(1,3,1)`, `B3=(1,4,3,1)`, `B4=(1,5,6,4,1)` have positive interval support and log-concave coefficients, as does their convolution `C`. Its positive adjacent ratios decrease, and `p-1>=x+1`; therefore `0<C[p]/C[p-1]<=C[x+1]/C[x]<1`. This checks the accepted first-descent ratio argument at the exact substituted ranks. Each `Ai[p]>=binom(N,p-1)>0`, so `W[p]>0`. Substitution into the proposed weighted inequality gives

`W[p+1]C[p-1] <= W[p]C[p] < W[p]C[p-1]`.

Division by the positive `C[p-1]` preserves order, yielding `Delta_p W<0`. Since `Delta_p W=sum_i r_i Delta_p Ai` and every original multiplicity `r_i>0`, at least one **strict current-p** branch flag is one; thus `R>=2`. This proves existence, not full tip or endpoint selection. Under the accepted branchwise bound, `A>=3R delta D_j/2`. Because `R>=2`, `3R/2>=R+1>=R+e0=b`; the boundary `R=2,e0=1` is equality in the middle comparison, while the interior `R=3,e0=1` gives `9/2>4`. Multiplication by positive `delta D_j` preserves direction, so `A>=b delta D_j`. The opposite implication from an aggregate/weighted inequality to each branch is invalid and is not used.

For `t=C[j+1]/C[j]`, the accepted rank/ratio facts give `0<t<1`, `delta>1`, and `kappa=1-t+t/delta>0`. The exact substitution is `delta kappa=1+(delta-1)(1-t)>=1`, so multiplying MASS by positive `kappa` gives `kappa A>=bD_j`; multiplying by positive `delta C[j]` gives exactly the contract's integer payment. At the formal boundary `t=1`, `delta kappa=1`; at `t=0`, it equals `delta`; at the interior test `delta=2,t=1/2`, it is `3/2`. A negative multiplier would reverse an inequality, but none occurs here. This does not prove `(1-t)A>=bD_j`, whose multiplier is smaller.

Our independent eligible substitutions are `(0,0,40), x=78, p=80=x+2` and `p=81=alpha/2`, and `(1,1,30), x=61, p=63=x+2=floor(alpha/2)`. All three guards and current-p strict flags were checked, with exact positive `C[p-1]-C[p]`, endpoint/tip/weighted shifted right-minus-left margins, selected MASS margin, and integer payment margin in `C4-AF-independent-check.json`. The ranks include an interior and lower-half boundary; they remain finite evidence.

## Finite-block and graph bridge

For positive block sizes `r_i`, `M=sum r_i`, `0<=k<=M`, and `f_i(t)>=c_i(t)=binom(r_i,t)` for `0<=t<=r_i`, put `w_i(t)=f_i(t)/c_i(t)>=1`, `H=prod_i sum_t f_i(t)z^t`. A uniform `k`-subset has dependent block-count vector `K` with joint mass `prod_i c_i(t_i)/binom(M,k)` when `sum_i t_i=k`; direct expansion gives `H[k]/binom(M,k)=E prod_i w_i(K_i)`. Jensen applied to the **joint** law gives `E exp(sum log w_i)>=exp(sum E log w_i)`. For `w>=1`, `log w>=2(w-1)/(w+1)`: the difference vanishes at `w=1` and has derivative `(w-1)^2/[w(w+1)^2]>=0`. All denominators are positive. Taking marginal hypergeometric laws yields exactly the registered `y_k`; no block independence is assumed. Since `y_k>=0`, `exp(y_k)>=E_d(y_k)` for every natural `d` by nonnegative omitted terms. Each inequality is directed from the normalized coefficient down to the stated Taylor floor.

The empty family has `M=k=0`, coefficient and normalization one, `y=0`; out-of-range binomials are integer zero-extended, never interpreted with a saturating predecessor in a negative lower argument. At `k=0` every singleton probability is zero. At `k=M`, a size-one block has singleton probability one, while a larger block has zero. Our independent `{1,3}`-size `B` factor check gives normalized coefficients `1`, `11/6`, `2` at `k=0,2,M=4`; these are exact boundary/interior cross-checks. For `B_r`, `w_i(1)=1+1/r` and all other weights are one, so the cofactor singleton exponent follows. Its floor is zero-extended outside `0..M` before convolution with the nonnegative `GF_r` coefficients. No probability division is used out of range.

For any finite graph factor `J` of independence number `r`, subsets of a fixed maximum independent set supply `I(J)[t]>=binom(r,t)`. An outside vertex supplies one *additional* singleton, hence `I(J)>=L^r+z` coefficientwise. An empty graph has `r=0` and cannot have that outside vertex. The product/Jensen bound applies to a product only after a real disjoint-component factorization is proved. To use it for a larger marked graph, separate proofs must establish both parent and every marked-deletion polynomial, the matching component degrees/independence numbers, the actual least strict parent descent with terminal and flat differences, all three same-`p` guards, strict selectors, original tip-tag multiplicities, and a quantitative surplus/payment bridge. Coefficient domination supplies none of those transfers.

## Limits

The two guarded shifted comparisons remain OPEN at their full registered rank bands. The exact all-rank refutation is outside those bands. The general finite-block argument is an informal universal proof; its finite replays are not its universal basis and no Lean verification was performed. The conditional weighted route does not close its OPEN antecedent. The primary exact-ratio payment retains its existing computer-assisted/nonformal grade; the governed formal stop remains unmet.
