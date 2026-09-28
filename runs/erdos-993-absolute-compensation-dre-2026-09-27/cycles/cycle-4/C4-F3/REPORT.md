# C4-F3 independent audit

## Scope and inputs

Reviewed the exact general finite-block weighted-subset/Jensen argument, its path-star cofactor specialization, and the two registered guarded shifted-\(C\) deletion comparisons named in the Cycle 4 allocation. The current-p payment identity remains `VERIFIED` at source-dependent computer-assisted plus informal-universal-composition, non-Lean grade; this audit does not reopen it or promote its grade. The lower-half individual and weighted-tip-deck shifted comparisons remain separate `OPEN` mechanisms.

All 174 bytes named by `manifests/C4-COMMON-DISPATCH.json` were SHA-256 checked against that manifest; there were zero mismatches. `packets/C4-F3.json` contains no source hashes, no additional allowed files, and no required coverage IDs. I read the required predecessor reductions and margin proof, relevant neutral Cycle 4 subset/selector sources, and the targeted registered identity entries only. No sibling case, private transcript, or live experiment was read.

## General finite-block theorem: proof and boundary audit

Let positive block sizes be `r_i`, with `M=sum r_i`, and let `f_i(t)>=choose(r_i,t)` for `0<=t<=r_i`. Set `w_i(t)=f_i(t)/choose(r_i,t)>=1`. For a uniform `k`-subset of the disjoint union, its block-count vector is multivariate hypergeometric, and direct count-vector enumeration gives

`H[k]/choose(M,k) = E product_i w_i(K_i)`, where `H=product_i sum_t f_i(t) z^t`.

Finite Jensen gives `E product_i w_i(K_i) >= exp(E sum_i log w_i(K_i))`. For `w>=1`, `log w >= 2(w-1)/(w+1)`. Taking each block-count marginal (no independence assumption) yields the stated exponent

`y_k = sum_i sum_t choose(r_i,t) choose(M-r_i,k-t)/choose(M,k) * 2(f_i(t)-choose(r_i,t))/(f_i(t)+choose(r_i,t))`.

Each denominator is positive on `0<=t<=r_i`; zero-extended binomials make out-of-range terms vanish. Since `y_k>=0`, `exp(y_k)>=E_d(y_k)` for every finite Taylor degree `d`. This proves the general coefficient/Jensen inequality on exactly `0<=k<=M`.

Boundary checks: for an empty block family, `M=k=0`, both normalized sides are `1` and `y=0`. For size-one blocks, all denominators remain positive. At `k=0`, the singleton-surplus exponent is zero. At `k=M`, singleton events for size-one blocks have probability one; for larger pure `B_r=(1+z)^r+z` blocks, the singleton event has probability zero, as required. The denominator is `choose(M,k)>0` throughout the stated range. Exact rational replay checked 17 combinations including those boundaries and interior ranks; see `audit_finite_blocks.py` and `audit_finite_blocks.json`.

The already registered occupancy/Jensen cofactor claim is consistent with this proof: for `B_r`, `w(t)=1+1/r` only at `t=1` and is one otherwise, giving its singleton-event form. Its zero-extended coefficient floor can be convolved with the nonnegative `G F_r` coefficients to lower-bound `T_i[j]`; at out-of-range cofactor ranks the floor is zero. This does not justify dividing by a zero coefficient or applying the in-range probability formula outside `0<=k<=M`.

## Graph specialization and exact repair

For a finite graph with independence number `r`, fix a maximum independent set `S`. Its subsets give `I(G)[t]>=choose(r,t)` at every degree. If there is a vertex outside `S`, its singleton adds one to degree one, so `I(G)[t]>=(1+z)^r+z` coefficientwise. This is valid even at `r=1`; for `r=0`, the outside-vertex condition cannot hold. The generic Jensen theorem therefore applies to any finite list of such graph independence polynomials as abstract coefficient-dominating factors.

The useful graph conclusion stops at coefficient domination (and the resulting fixed-rank cofactor lower bound, if the cofactor is already a product over disjoint components). It does not establish that a target graph's independence polynomial factors this way after a marked deletion, that its marked deletion is the source's `A_v`, that its actual parent has the same `x`, or that a chosen current-rank strict selector is preserved. The exact repair is to require and prove separately: (i) the factorization into genuinely disjoint component independence polynomials for both parent and each marked deletion, (ii) the degree/independence-number correspondence for each factor and the marked factor after deletion, (iii) the parent coefficient identity used to define the *actual least strict zero-extended descent* `x` including terminal differences and flats, and (iv) every rank guard and strict selector at the same current `p`. Coefficient floors alone discharge none of (ii)-(iv). No mass, payment, or arbitrary-graph aggregate is claimed here.

## Shifted comparisons and target-specific fences

No guarded counterexample was found or established in this audit, so both registered comparisons remain open at precisely their stated coefficient scope:

- Individual: for every nonempty ordinary path-star profile, each original-leaf deletion `A_v` and each natural `k` with `1<=k` and `2k<=N+2`, test `A_v[k+1] C[k-1] <= A_v[k] C[k]` with integer zero extension.
- Weighted deck: with original tip multiplicities `W=sum_i r_i A_i`, on the same guarded `k` band test `W[k+1] C[k-1] <= W[k] C[k]`.

The retained `n=122`, `(a2,a3,a4)=(38,0,1)`, `r=4`, `k=77` obstruction has `2k=154>N+2=82`, so it refutes only the unguarded all-rank claim and is not a guarded counterexample. It must remain an overgeneralization control. Even if a guarded comparison were proved, its route to actual selection still needs the accepted positive/log-concave `C` ratio and the actual first strict descent: `Delta_x P<0` implies `Delta_x C<0` only on the stated source argument, and the current `p` must retain `x+2<=p`, `3p<2(N+2)+1`, and `2p<=N+2`. For the weighted route, a strict descent of `W` at that same `p` gives at least one strictly selected branch, not selection of every tip or the endpoint; original branch multiplicities `r_i` remain in `W` and in the resulting local-MASS sum.

Nothing in the weighted-subset identity supplies those shifted comparisons. Likewise, no unconditioned block mean was substituted for a coefficient-conditioned probability. The exact current-p selectors remain `e0=1[Delta_p A0<0]` and `ei=1[Delta_p Ai<0]`; replacing strict signs with weak signs would change the mechanism.

## Evidence and limits

The 17-case script is finite exact arithmetic, not proof of the universal theorem; the proof above is the universal argument for the abstract finite-block claim. The center-subset coefficient expansion has a separate governed formal award, but it proves only that coefficient identity. This report proposes no Lean award and no universal selector, shifted-LR, MASS, payment, or arbitrary-tree result. The primary exact-ratio payment remains VERIFIED at its existing computer-assisted/nonformal grade; formal decisive-stop criteria remain unmet.

Replay from this directory:

`PYTHONDONTWRITEBYTECODE=1 python3 audit_finite_blocks.py`

Artifacts: `cycles/cycle-4/C4-F3/audit_finite_blocks.py`, `cycles/cycle-4/C4-F3/audit_finite_blocks.json`, `cycles/cycle-4/C4-F3/REPORT.md`.
