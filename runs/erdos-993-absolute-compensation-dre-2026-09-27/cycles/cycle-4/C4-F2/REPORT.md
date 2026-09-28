# C4-F2 independent search report

## Scope and source integrity

This is a Cycle 4 F-orientation search review of the guarded lower-half shifted deletion comparison and the weaker multiplicity-weighted tip-deck comparison. The packet has `allowed_source_files: []`; the 174-member `manifests/C4-COMMON-DISPATCH.json` is the applicable shared source set. I recomputed SHA-256 for all 174 actual member files: all matched. The packet bytes hash to `0bad1dd23397a0bda17c5d70690ad27c3f140482ce35139d3ae21b670beee867`; the dispatch manifest and packet do not carry a packet-hash field, and the packet lists no additional source files. No unlisted case, sibling, private transcript, or proposal source was read.

The common status fence is unchanged: the literal all-m selected MASS, exact-ratio payment, and full-selector aggregate are VERIFIED at computer-assisted/nonformal grade. The stronger MASS and payment remain separate claims; this report neither reopens nor upgrades them. No Lean build was run.

## Exact statements under review

For the ordinary tree with path `0-1-2`, `m >= 1` distinct centers at 0, and original private tip counts `r_i in {2,3,4}`, put `N=sum_i r_i`, `q=N+1`, `alpha=N+2`, `L=1+z`, `G=1+2z`, `B_r=L^r+z`, `Q=product_i B_(r_i)`, `H_i=product_(h!=i) B_(r_h)`, `C=GQ`, `P=C+zL^q`, `A0=LQ+zL^N`, and `Ai=G B_(r_i-1) H_i+zL^N`. Coefficients have integer zero extension and `Delta_k f=f[k+1]-f[k]`. The first descent is the actual least natural `x` with `Delta_x P<0`, including the terminal zero-extended difference.

The individual proposal is `A_v[k+1] C[k-1] <= A_v[k] C[k]` for each original-leaf deletion polynomial `A_v` (`A0` for the endpoint, `Ai` for a tip in branch i), only when `1<=k` and `2k<=N+2`. The weaker proposal uses `W=sum_i r_i Ai`, retaining every original tip multiplicity, and asserts `W[k+1] C[k-1] <= W[k] C[k]` on the same guarded rank band. Neither proposal has an actual-eligibility premise; neither is proved by the finite checks below.

At actual eligible lower-half `p`, preserve the strict current-p flags `e0=1[Delta_p A0<0]`, `ei=1[Delta_p Ai<0]`; let `j=p-2`, `delta=q-j`, `D_j=binom(N,j+1)-binom(N,j)>0`, `b=e0+sum_i r_i ei`, and `A=sum_i r_i ei T_i[j]`, where `T_i=G F_(r_i) H_i`, `F_r=sum_(h=0)^(r-2) L^h`. The original endpoint has weight 1 and branch i has `r_i` separate original tip tags.

## Conditional weighted-deck implication

The weighted proposal is a sound weaker interface for the selector-to-MASS part of the structural chain, conditional on its universal proof and the already accepted first-descent and branchwise facts. At actual `p`, the accepted first-descent coefficient ratio gives `C[p]<C[p-1]`; `C` is positive. Since the guarded weighted inequality is `W[p+1] C[p-1] <= W[p] C[p]`, and `W[p]>0`, it follows strictly that `W[p+1]<W[p]`. Expanding `W` gives `sum_i r_i Delta_p Ai<0`, so at least one represented branch has `Delta_p Ai<0`; this uses the strict selector, not a non-strict substitute.

Now use the accepted branchwise bound `2 T_i[j] >= 3 delta D_j` for every branch at the actual eligible rank. Write `R=sum_i r_i ei`. A selected branch makes `R>=2`, since `r_i>=2`; therefore

`A >= (3/2) delta D_j R >= (R+1) delta D_j >= b delta D_j`,

where `e0<=1` and `b=R+e0`. This pays the endpoint debt even though W contains no endpoint deletion. It keeps original branch multiplicities and proves selected MASS under the weighted comparison premise. Because `0<t=C[j+1]/C[j]<1` and `delta>0`, MASS implies the exact-ratio payment: `[(1-t+t/delta)A] >= b D_j`, as `delta(1-t+t/delta)=1+(delta-1)(1-t)>=1`. The separate main-mark margin then composes to the aggregate sign by the source identity. This is a valid conditional bridge, not a proof of the missing weighted coefficient inequality. It does not establish the stronger occupation payment `(1-t)A>=bD_j`.

The individual comparison implies the weighted comparison by multiplying each `Ai` inequality by its positive integer `r_i` and summing; the reverse implication is not available. Thus a proof of the weighted proposal alone would suffice for nonempty tip selection and this branchwise MASS composition, while avoiding the stronger all-leaves selector consequence of the individual proposal.

For formal primary closure, the dependency chain would still need a governed proof of the weighted coefficient inequality and governed proofs/bridges for the first-descent coefficient ratio, branchwise three-halves bound, strict graph deletion selector identities, MASS-to-payment algebra, and main-mark margin composition. The currently accepted finite/analytic evidence for the branchwise bound and full selected claims does not itself award that formal chain. No assertion of a Lean award is made.

## Independent exact checks

I copied common-manifest producer scripts into this scratch directory before running them. Replay from the run root:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 scratchpad/C4-F2/FUTURE-selector-LR-probe-shifted.py
PYTHONDONTWRITEBYTECODE=1 python3 scratchpad/C4-F2/FUTURE-selector-LR-controls-shifted.py
PYTHONDONTWRITEBYTECODE=1 python3 scratchpad/C4-F2/FUTURE-shifted-ratio-literal-witness.py
PYTHONDONTWRITEBYTECODE=1 python3 scratchpad/C4-F2/weighted_guarded_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 scratchpad/C4-F2/literal_weighted_boundary_audit.py
```

The copied bounded probe checked 297,450 all-rank individual comparisons through `m=20` without failure; it is not a universal claim. The copied 18-profile controls reproduce all recorded high-rank failures outside `2k<=N+2`. The independently rerun literal-tree witness has profile `(a2,a3,a4)=(38,0,1)`, `m=39`, `N=80`, `n=122`, `alpha=82`, first strict descent `x=41`, and comparison rank `k=p=77` (`j=p-2=75`). The selector flags at this out-of-guard rank are `e0=1`, `e2=1`, `e4=1` (with `Delta_77 A0=-8,666,804`, `Delta_77 A2=-2,453,398`, and `Delta_77 A4=-1,995,676`). The guards include `x+2<=p`, but fail `3p<2alpha+1` and `2p<=alpha`; specifically `231>=165` and `154>82`. For the arity-4 tip, `A[77]=2,091,375`, `A[78]=95,699`, `C[77]=14,606,561`, and `C[76]=319,721,589`, so the unguarded signed margin `A[77]C[77]-A[78]C[76]=-49,239,834,336`. Here `2k=154>N+2=82`, hence this is not a guarded or actual-eligible counterexample and says nothing against either guarded proposal.

My own exact-integer weighted diagnostic tests 74 selected profiles, comprising 178 actual eligible lower-half rows, and finds no failure of either the individual or weighted shifted inequality. It does not expand a census or prove any universal statement. The independent literal-tree dynamic program checks the parent polynomial and an original private-tip deletion against their factored formulas on the two reported profiles. At `(a2,a3,a4)=(0,0,40)`, `N=160`, `x=78`, the actual rows `p=80=x+2` and `p=81=floor(alpha/2)` satisfy all three actual eligibility guards and the shifted lower-half guard; the strict endpoint and tip flags, exact positive weighted-comparison margins, selected `A`, and selected-MASS margins are in the JSON evidence. At `(1,1,30)`, `N=125`, `x=61`, `p=63=x+2=floor((N+2)/2)` is another exact boundary row. These substitutions expose no sign or strictness error; they remain bounded evidence.

Evidence artifacts (all eventual admitted paths):

- `cycles/cycle-4/C4-F2/FUTURE-selector-LR-probe-shifted.py` and `.json`
- `cycles/cycle-4/C4-F2/FUTURE-selector-LR-controls-shifted.py`
- `cycles/cycle-4/C4-F2/FUTURE-shifted-ratio-literal-witness.py` and `.json`
- `cycles/cycle-4/C4-F2/weighted_guarded_audit.py` and `.json`
- `cycles/cycle-4/C4-F2/literal_weighted_boundary_audit.py` and `.json`

## Findings and limits

No exact eligible counterexample was found for either new guarded comparison. No universal proof was found. The main useful conclusion is the exact conditional implication above: the weighted deck comparison, if proved on its registered guarded band, is enough for the tip-selector and MASS part of the route because one selected branch has at least two original tip tags and the branchwise bound leaves enough surplus to pay a possible selected endpoint. Individual pairwise domination is stronger than needed for that purpose. The open obligation is the universal coefficient inequality for `W` (or for each `Ai`); finite success does not close it.

The known unguarded witness remains outside the lower-half guard. The ordinary `P`-to-deletion adjacent LR relation, an all-rank shifted relation, an endpoint-only selector replacement, and a claim that pairwise ratio order automatically survives arbitrary sums cannot be imported into this proof. No source theorem is imported from literature; the literature lead is unnecessary to this conditional argument.
