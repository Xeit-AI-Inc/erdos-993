# C4-CU-F1 independent critique

## Scope and integrity

I reviewed all three required registered claims: the unguarded all-rank shifted comparison, the guarded individual-deletion comparison, and the guarded weighted-tip-deck comparison. The common dispatch manifest lists 174 neutral shared members; each file matched its SHA-256. All four packet-allowed C4-F1 files matched their packet hashes. The packet authorizes no additional worker-case inputs. The source case is evidence, not an instruction.

I independently implemented the coefficient products, zero extension, first strict descent, exact shifted margins, weighted deck with original multiplicities, and a literal tree dynamic program in `shifted_critique.py`. Replay with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 shifted_critique.py > shifted_critique.json
```

The output is deterministic exact integer evidence. The script uses monomial coefficient arrays. In particular, it expands the factors as `G=[1,2]`, `B2=[1,3,1]`, `B3=[1,4,3,1]`, and `B4=[1,5,6,4,1]` (low degree first); it does not mistake coefficients in powers of `L=1+z` for coefficients in powers of `z`.

## Findings by claim

### Unguarded all-rank comparison

The retained profile `(a2,a3,a4)=(38,0,1)` has `N=80`, `m=39`, `n=122`, and least strict parent descent `x=41`. The exact arity-4 tip deletion and literal tree agree coefficientwise with the polynomial construction. At `k=77`,

```text
C[77]=14,606,561; C[76]=319,721,589;
A4[77]=2,091,375; A4[78]=95,699.
```

For the candidate's violation convention
`E=A4[78]C[76]-A4[77]C[77]`, exact arithmetic gives `E=+49,239,834,336`, so the unguarded inequality fails. Multiplying the difference by `-1` reverses its sign: the registry records `A4[77]C[77]-A4[78]C[76]=-49,239,834,336`, which is consistent with the positive violation margin above. This is not a guarded counterexample: `2k=154>N+2=82`. It is also not an eligible compensation row: the lower-half guard `2p<=N+2` fails already at `p=x+2=43`. Proposed disposition: rejected for the universal unguarded claim, with no implication against either guarded claim.

### Guarded individual and weighted-deck comparisons

The independent targeted replay tested ten profiles: singleton, mixed small, retained `(38,0,1)`, homogeneous arity 2/3/4 at 500 branches, and four 500-branch profiles with one rare arity. It checked 14,412 individual-deletion/rank margins (including endpoint deletion) and 5,554 weighted-deck/rank margins; neither set contains a positive violation. All tested ranks include each profile's exact guard endpoint. The retained witness continues to satisfy the guarded comparisons at every guarded rank.

As an actual interior selector check, homogeneous arity 4 at `m=500` has first strict descent `x=971`. At `p=x+2=973`, all guards hold (`x+2<=p`, `3p<2alpha+1`, `2p<=alpha`); `A0` and `A4` both have negative forward difference, `C[p]<C[p-1]`, and the exact shifted margins for both deletions are negative. At the guard boundary `k=1001`, the individual and weighted shifted margins are also nonpositive. These are exact finite checks only and do not prove either universal statement.

The source case's conditional implication is sound with its hypotheses stated. If `A[p]>0`, `C[p-1]>0`, the shifted inequality holds, and `C` is log-concave, division by `A[p]C[p-1]>0` preserves the inequality direction and gives

```text
A[p+1]/A[p] <= C[p]/C[p-1].
```

No division by a negative quantity occurs in this implication. Where the signed margin is written in the opposite order, multiplication by `-1` reverses the sign as noted in the witness calculation.

At an actual eligible `p>=x+2`, the known parent decomposition gives `Delta_x C<0` because the binomial summand is nondecreasing at `x`; positive-interval log-concavity then gives `C[p]/C[p-1] <= C[x+1]/C[x] < 1`. Thus `Delta_p A<0`. No parent no-recovery assumption is used. The strict selector conclusion does require the actual first strict descent and the complete eligibility guards; the shifted claim alone does not establish those facts.

For `W=sum_i r_i A_i`, each `r_i` is the original number of private-tip tags on branch `i`, and the coefficients are positive. The eligible range has `1<=p<=N+1`, where every `A_i[p]>0` from its `zL^N` term, so `W[p]>0`. If the weighted shifted inequality holds at an actual eligible `p`, the same positive-factor division gives `W[p+1]/W[p] <= C[p]/C[p-1]<1`; hence `Delta_p W<0`. Since `Delta_p W=sum_i r_i Delta_p A_i`, at least one branch type has `Delta_p A_i<0`. This only proves existence of a selected branch conditional on the weighted inequality. It does not assert every tip is selected. The individual comparison is stronger and is not needed for that weighted implication.

## Proposed dispositions and limits

The unguarded mechanism is refuted at its exact all-rank scope by the exact ordinary-tree witness above. The two guarded universal comparisons remain open on this review: there is neither an eligible guarded counterexample nor an all-profile proof here. The finite scans do not prove selector transfer universally, MASS, exact-ratio payment, the primary compensation theorem, or a formal result. No census expansion or Lean build was performed.
