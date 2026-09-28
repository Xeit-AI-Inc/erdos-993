# C4-CF-U3 critique

## Scope and source integrity

I reviewed the sealed protocol, solution contract, status clarification, neutral handoff, Cycle 4 allocation, the three registered identities, and the packet case `C4-U3`. All 174 common-manifest members and all four packet members matched their listed SHA-256 hashes. The packet-listed `shifted_audit.py` was copied to this scratch directory before replay; with `PYTHONDONTWRITEBYTECODE=1`, its output matched the reported counts and 22-branch row. No sibling or private proposal was consulted.

The individual and weighted guarded shifted-C inequalities remain distinct OPEN auxiliary claims. Neither a positive bounded scan nor the conditional selector bridge proves either universal inequality, selected MASS, the exact-ratio payment, or the primary aggregate. I do not reopen the already registered computer-assisted literal full-selection result.

## Conditional weighted-LR selector bridge

Let `W=sum_i r_i A_i` with the original distinct-tip multiplicities. At an eligible `p`, assume

`W[p+1] C[p-1] <= W[p] C[p]`,

and the accepted facts `Delta_x C<0` at the actual first strict descent `x` of `P`, and log-concavity/positive interval support of `C`. Eligibility gives `p>=x+2`. The adjacent ratios of `C` are nonincreasing, so

`0 < C[p]/C[p-1] <= C[x+1]/C[x] < 1`.

Also `W[p]>0`: each `A_i` contains `z L^N`, and the guarded `p` is in its positive coefficient interval. Divide the assumed comparison by the positive number `W[p]C[p-1]`; the direction is preserved and gives

`W[p+1]/W[p] <= C[p]/C[p-1] < 1`.

Thus `Delta_p W<0`. Since `Delta_p W=sum_i r_i Delta_p A_i` and every `r_i>0`, at least one current-`p` branch selector is strict. This conclusion preserves multiplicities and does not require an endpoint selector. Multiplying or dividing by these positive coefficients preserves order; this argument never multiplies an inequality by a negative factor. The individual guarded comparison, if assumed at the same rank, gives the same ratio argument for each `A_i` separately, hence every tip-branch selector is strict (a stronger conditional consequence, not a proof of that premise).

No sign or ratio step in this bridge fails. Its essential unproved input remains the universal weighted comparison itself. The bridge does not transfer an aggregate bound into that premise.

## Independent exact checks and limits

`independent_check.py` uses integer coefficient arrays in the monomial `z` basis (`L=[1,1]`, `G=[1,2]`, `B_r=(1+z)^r+z`), with zero extension in coefficient access. A separate include/exclude tree dynamic program reproduces `P`, every represented private-tip deletion, and the endpoint deletion for profiles `[2]`, `[3]`, `[4]`, `[2,3,4]`, and `[3]*22`. This independently checks the polynomial/tree specialization used in the targeted actual-row calculation.

The script checks both guarded margins at lower boundary, interior, and upper guarded ranks for five small profiles and targeted ranks in 50 deterministic random profiles (up to 45 branches); no negative margin occurred. These are finite checks only. On the `[3]*22` actual row it finds `x=32`, `p=34`, `N=66`, `alpha=68`, `Delta_x P=-940335682600092973`, `Delta_x C=-2430733093207932707`, `Delta_p W=-1487457400844219699268`, and 22 strict branch selectors. The weighted LR cross-product margin `W[p]C[p]-W[p+1]C[p-1]` is `232296700581653155847056681562532686593824`; this one true row is not a proof of the LR hypothesis.

As an adversarial scope check, the known profile `(a2,a3,a4)=(38,0,1)` at `k=77` gives the individual cross-product margin `A[k]C[k]-A[k+1]C[k-1]=-49239834336`, but `2k=154>N+2=82`. It refutes only the unguarded all-rank shortcut and is outside both Cycle 4 guards. It must not be presented as a guarded counterexample.

Replay from the eventual admitted directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 producer_shifted_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_check.py
```

The first command reproduces the copied producer's bounded evidence; the second reproduces `independent_evidence.json`. Neither script establishes a universal result.

## Proposed dispositions

- `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-INDIVIDUAL-DELETION-LR`: proposed open. No guarded counterexample or all-profile proof was found; the unguarded witness is outside the rank guard.
- `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR`: proposed open. The same limitation applies; the conditional selector bridge does not settle the weighted premise.
- `C4-U3-WEIGHTED-SHIFTED-LR-IMPLIES-STRICT-TIP-SELECTION`: proposed retained at the stated conditional eligible-rank scope. The proof above checks the cross-multiplication direction and strictness. It asserts no payment or aggregate conclusion.

No Lean verification or authoritative status change is asserted.
