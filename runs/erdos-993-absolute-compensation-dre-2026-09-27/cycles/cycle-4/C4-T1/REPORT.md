# C4-T1 search report

## Scope and input integrity

Reviewed the sealed C4 common inputs and my empty additional-source packet. All 174 files listed in `manifests/C4-COMMON-DISPATCH.json` matched their manifest SHA-256 values; `packets/C4-T1.json` lists no additional sources. Targeted registry lookup found the OPEN keys `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-INDIVIDUAL-DELETION-LR` and `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR`, and the distinct REFUTED all-rank shifted comparison. The all-rank witness is outside the guarded band.

## Structural route: shifted comparison implies actual strict selection

Write `rho_k=C[k]/C[k-1]`. The accepted product log-concavity gives nonincreasing `rho_k`; the accepted actual-first-descent reduction gives `Delta_x C<0`, hence `rho_(x+1)<1`. For an eligible actual `p`, `p>=x+2`; therefore `rho_p<=rho_(x+1)<1`. If a deletion polynomial `A_v` satisfies the guarded comparison at `k=p`, then

    A_v[p+1] C[p-1] <= A_v[p] C[p]
    A_v[p+1] <= A_v[p] rho_p < A_v[p]    (when A_v[p]>0).

The ordinary path-star deletion factors have positive coefficients throughout this lower-half range, so this yields `Delta_p A_v<0`. It preserves the actual first strict descent and uses the strict current-p selector; no no-recovery assumption on `P` is used. Thus the individual OPEN comparison would select every original leaf deletion at eligible `p` (endpoint plus every tip type), and its weighted sum with original multiplicities would imply the weaker deck comparison there. It does not itself prove either all-profile comparison. The weighted comparison alone only forces some tip branch to be selected under its stated positive-support bridge; it does not select the endpoint or all tips.

## Exact diagnostics and obstruction to a termwise shortcut

`shifted_lr_replay.py` independently builds coefficients by integer polynomial multiplication, checks the complete guarded rank band, derives `x` as the first strict negative forward difference of `P`, evaluates actual eligibility and selectors, and independently recomputes one literal graph and deleted-tip polynomial by tree dynamic programming. Replay:

    PYTHONDONTWRITEBYTECODE=1 python3 shifted_lr_replay.py > shifted_lr_evidence.json

For profiles `(a2,a3,a4)=(0,22,0),(0,0,39),(0,12,10),(1,1,30),(100,1,1),(38,0,1)`, the full guarded individual comparison had no failures. The first four have actual eligible ranks respectively `{34}`, `{78,79}`, `{39}`, `{63}`; exact current-p computation selects endpoint and every original tip copy at those ranks. The last two have no eligible lower-half rank. This is bounded evidence only.

A tempting proof split writes `A_v=M_v+E`, where `E=zL^N` and `M_v` is the nonnegative non-binomial summand. Although every tested `M_v` passed the shifted comparison, `E` does not: for `(a2,a3,a4)=(0,22,0)`, `m=22,N=66,n=91,alpha=68,x=32`, at guarded `k=27` (with `2k=54<=68`),

    E[27]=1654284096099796392
    E[28]=2450791253481179840
    C[27]=116461439672085416832
    C[26]=78823085262292775712
    E[27]C[27]-E[28]C[26]
      = -518620474811633289768751398606375936.

So proving the whole shifted comparison by proving it separately for the common binomial perturbation is impossible. This is not a counterexample to the full deletion comparison or to selection: the actual eligible rank is `p=34`, where the endpoint and all 66 tip copies are selected. It instead identifies the lower-rank cancellation between `M_v` and `E` as part of the unresolved proof obligation.

The existing literal all-rank witness was also independently cross-checked from its edge list using tree dynamic programming: parent and original tip deletion matched the formula polynomials exactly. At `n=122,N=80,alpha=82,x=41,k=77`, `2k=154>82`, and the shifted margin is `-49239834336`; hence it remains only an all-rank refutation, not a guarded failure.

## Assessment

The individual shifted comparison remains a plausible, useful census-free selector route, but I have no universal proof or guarded counterexample. Its weighted-deck analogue is a genuinely weaker obligation, although summing individual inequalities is only one-way and cannot establish the weighted theorem from an unknown subset of individual comparisons. A direct convolution closure argument still needs to handle the added `zL^N` term without the false termwise domination just exhibited. No claim here changes the registered OPEN or REFUTED scopes, the selected payment status, or the primary formal stop. The finite computations are not universal proofs; no Lean build was run.

Own evidence: `cycles/cycle-4/C4-T1/shifted_lr_replay.py` and `cycles/cycle-4/C4-T1/shifted_lr_evidence.json`.
