# C4-U2 search report

## Scope and checks

Reviewed the sealed Cycle 4 contract, protocol, grade clarification, handoff, U2 allocation and packet. The packet has no additional case sources. All 174 members of `manifests/C4-COMMON-DISPATCH.json` exist and match their listed SHA-256 digests; the packet's additional-source list is empty. Claim identity lookup was limited to the path-star payment, center-subset/Jensen and relevant truncation/selector claims.

The existing exact finite center-subset coefficient identity is formally verified for every finite family, including empty families and zero-sized blocks. The broader finite-block Jensen/coefficient-domination theorem is universal informal evidence. Neither asserts a graph selector or payment consequence. I treated the existing all-m selected MASS and exact-ratio payment as computer-assisted universal compositions at their registered grade, not as Lean awards and not as targets to reopen.

## Exact layer test and repair at the standing truncation obstruction

I copied the common-manifest producer `sources/cycle2/truncation_literal_check.py` into this scratch directory before execution. With `PYTHONDONTWRITEBYTECODE=1`, its independent literal-tree DP/direct-factor replay reproduces the retained homogeneous arity-4 profile:

- `m=173`, `N=692`, order `868`, `alpha=694`;
- actual first strict descent `x=336` (terminal-inclusive zero-extended differences); `p=338`, so `x+2=p`, `3p=1014<1389=2alpha+1`, and `2p=676<=694=alpha`;
- `j=336`, `delta=357`; all original leaf tags are strictly selected at current `p`, including endpoint and each of the `N=692` private-tip tags, hence `b=693` with original multiplicities;
- `C[j]>C[j+1]>0` and `D_j>0` in the replayed exact coefficients.

The depth-one center-choice floor has exact selected-payment ratio about `0.94925404898 < 1` and a negative exact signed integer margin (`truncation_literal_check_independent.json`). The full `T_i[j]` payment margin is positive. This reproduces only the known auxiliary truncation failure; it is not a counterexample to full MASS or full payment.

For this homogeneous profile the exact, nonnegative center-subset layer expansion is

`T_i[j] = sum_{a=0}^{m-1} binom(m-1,a) * sum_{s=0}^3 g_s binom(4(m-1-a), j-a-s)`, with `g=(3,9,7,2)`.

Here `a` is the number of other centers whose extra `z` term is chosen. The depth-one floor retains `a=0,1`. Exact integer accumulation shows that adding the `a=2` layer makes the contracted payment margin positive on this row (ratio about `5.83899`); thus depth two is an exact local repair for the known obstruction. The independent script `depth_remainder_audit.py` reconstructs all layer contributions, asserts equality with the full cofactor coefficient and the copied literal replay, and records signed margins in `depth_remainder_audit.json`.

A possible parameter-scaled proof object is exposed by each fixed `s` layer term

`R_(a,s)=g_s binom(m-1,a) binom(4(m-1-a), j-a-s)`.

Where both terms are defined, its exact adjacent ratio is

`R_(a+1,s)/R_(a,s) = (m-1-a)/(a+1) * k*(n-k)*(n-k-1)*(n-k-2)/(n*(n-1)*(n-2)*(n-3))`,

with `k=j-a-s` and `n=4(m-1-a)`. Bounding a moving window of these layers could yield a depth growing with `m`; the present work proves no uniform window, tail estimate, lower bound for arbitrary profiles, or selector/payment theorem. Depth two at one profile does not establish scalability. A proof must still carry the actual first descent, all rank guards, strict current-`p` selectors, original tag multiplicities, and signed zero extension.

## Claims and grade

The two worker claims in `RETURN.json` are bounded exact evidence only: (i) depth one fails at the named actual eligible profile for its surrogate, while the full registered payment remains positive; and (ii) including layer `a=2` repairs this surrogate at that same profile. No universal proof, bounded census inference, or formal verification of these payment claims is asserted. The formal center-subset expansion remains its separate coefficient-only claim. No source edits, Lean build, installation, or background process were used.

## Replay

From this directory, run:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 truncation_literal_check_independent.py
PYTHONDONTWRITEBYTECODE=1 python3 depth_remainder_audit.py
```

Both scripts use exact integer arithmetic and write their JSON evidence beside themselves.
