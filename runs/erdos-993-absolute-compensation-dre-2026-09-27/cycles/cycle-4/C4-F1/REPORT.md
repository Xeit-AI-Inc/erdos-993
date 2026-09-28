# C4-F1 adversarial review

## Scope and source integrity

This is a Cycle 4 search-stage F1 review of the registered guarded individual and weighted-tip-deck shifted comparisons. The packet has no additional allowed source files. I read the common-neutral protocol, contract, handoff, allocation, predecessor structural and margin notes, the targeted registry rows, and the common shifted-ratio witness/research materials. All 174 members listed in `manifests/C4-COMMON-DISPATCH.json` matched their listed SHA-256 bytes. The packet itself has SHA-256 `f3e3e659673ac5ebff4dcbbf6a3e7dfac41e15b5c4a8ade575bc999c848ad650`; it lists no extra source-file hashes.

No producer script was executed. `shifted_audit.py` is an independent implementation written in this scratch directory. Replay from the eventual admitted directory with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 shifted_audit.py > shifted_audit.json
```

## Exact mechanism checked

For each tested profile, the script forms exact integer coefficients for `C=G product_i B_(r_i)`, each `Ai=G B_(r_i-1) H_i+z L^N`, and `W=sum_i r_i Ai`. The multiplicities in `W` are retained by multiplying each distinct branch-arity deletion polynomial by its original branch count and arity. For every `1<=k<=floor((N+2)/2)`, it checks the registered orientation

```text
Ai[k+1] C[k-1] - Ai[k] C[k] <= 0
W[k+1] C[k-1] - W[k] C[k] <= 0.
```

This tests the full registered guard, not just ranks encountered at an actual descent. It does not presume that passing these checks proves either universal statement.

Profiles checked were the three one-branch arities, `(1,1,1)`, the retained unguarded-control profile `(38,0,1)`, homogeneous 500-branch arity 2/3/4 profiles, and four 500-branch profiles with one rare arity 2/3/4 branch amid the other arity. Across these 12 profiles, 14,422 individual-deletion rank/profile comparisons (including the endpoint deletion at every guarded rank) and 5,559 weighted-deck comparisons had zero positive violations. The profiles include both guard-edge ranks `k=floor((N+2)/2)` and the high-count controls; this is targeted finite evidence, not a census or proof.

## Literal graph check and known obstruction boundary

For `(a2,a3,a4)=(38,0,1)`, `N=80`, `m=39`, `n=122`, `x=41`, an independent tree dynamic program on the literal path-star graph matches `P`, the endpoint-deletion `A0`, and the arity-4 tip-deletion `A4` coefficient-for-coefficient with the polynomial formulas. At the retained unguarded witness rank `k=77`, the coefficients are `C[77]=14,606,561`, `C[76]=319,721,589`, `A4[77]=2,091,375`, and `A4[78]=95,699`. With the target-side signed gap `A4[78] C[76]-A4[77] C[77]`, this is `+49,239,834,336`, so the unguarded inequality fails. It is outside the guard since `2k=154>N+2=82`; therefore it is not a guarded counterexample and says nothing against eligible selected compensation.

The literal computation also finds the actual least strict parent descent at `x=41`; the terminal difference is `-1`, consistent with counting the terminal strict descent. The control profile has no `p>=x+2` in the lower-half guard (`x+2=43`, while `p<=41`), so it cannot serve as an actual eligible witness.

## Conditional consequence and limitations

The two candidate comparisons remain distinct and open at the exact registered scopes. If the individual comparison holds at actual eligible `p`, positivity of `Ai[p]` and log-concavity of `C` give

```text
Ai[p+1]/Ai[p] <= C[p]/C[p-1] <= C[x+1]/C[x] < 1
```

using `p>=x+2` and the actual first strict descent. Thus each relevant deletion is selected; this does not require a parent no-recovery assumption. If the weighted comparison holds, the same ratio argument gives `Delta_p W<0`; since `W=sum_i r_i Ai` with positive original multiplicities, at least one branch deletion has `Delta_p Ai<0`, which is the useful route toward the branchwise local-MASS composition. Neither conditional implication proves its antecedent. The scans do not establish universal guarded truth, exact selector transfer for every profile, selected MASS/payment, or a census-free proof. The primary and formal-stop status are outside this search-stage report and unchanged by it.
