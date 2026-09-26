# C2-CF-U6 critique of C2-U6

## Scope and result

This is an independent F-orientation review of the three claims in the sealed C2-U6 case. The reviewed scope is the first-order shell of the primary target, with original-tree leaf tags, supports, neighborhoods, and the strict selector. The exact-state and vertex-cover claims are retained. The open-status claim is retained as a correct description of the route's result, not as a verdict on the primary assertion. Nothing here proves or refutes the primary inequality.

## Claim reviews

### `C2-U6.shell-state-framework` — retained

The proposed state is sufficient for exact evaluation at each fixed `p`. For a rooted branch with root `r`, splitting independent sets according to whether they contain `r` gives `B_Q=z∏A_{Q_i}`, `A_Q=∏(A_{Q_i}+B_{Q_i})`, and `I_Q=A_Q+B_Q`. Equivalently, deleting any vertex set from a tree leaves a forest, and its independence polynomial is the product of the polynomials of the remaining components. Full directed branch messages can compute these component polynomials; retaining the per-original-leaf `P_v=I(T-v)`, `H_v=I(T-{v,s_v})`, and `R_v=I(T-N_T[s_v])` also states the needed profiles explicitly.

From the full coefficient vector of `I_T`, with zero extension, one obtains `a=deg I_T` and scans `Delta_j=i_{j+1}-i_j` through `j=a`. The terminal value is `Delta_a=-i_a<0` (there is at least one maximum independent set), so omitting ranks above `p` could indeed give an incorrect first descent. For each original leaf tag, `P_v` gives the strict bit `Delta_p(T-v)<0`; `H_v,R_v` give that tag's summand at rank `p-1`. Keeping a list indexed by leaves, rather than deduplicating supports, preserves multiplicity when several leaves share one support. Thus the stated state loses none of `a,x`, the selector, or the complete sum for a fixed input tree and rank.

This is a sufficiency specification, not a useful uniform kernel: the number and size of possible states grow with `p`, and no congruence, canonical reduction, generation, or compression is supplied. The finiteness argument for fixed `p` follows already from `|T|=2p+2` (finitely many trees of that order); bounded integer coefficients and at most `2p+2` leaf tags are consistent with it. It gives no exhaustive census because no generator, generation count, or replay is presented.

### `C2-U6.shell-vertex-cover-bound` — retained

Write `n=2p+2` and `a=alpha(T)`. Since `p` and `a` are integers,

`3p<2a+1` iff `3p<=2a`, hence `a>=ceil(3p/2)=floor((3p+1)/2)`.

As `tau(T)=n-a`, for `p=2m` this gives `tau<=4m+2-3m=m+2`; for `p=2m+1` it gives `tau<=4m+4-(3m+2)=m+2`. Both are `floor(p/2)+2`. This is only a necessary structural bound. It does not bound `p`, establish eligibility, determine favorable leaves, or imply a sign for `S`.

### `C2-U6.primary-shell-open` — retained

The route supplies neither a universal shell sign argument nor a realizable eligible shell tree with positive complete sum. Its exact-state construction and vertex-cover bound do not fill that gap. The conclusion that this route leaves the shell assertion unresolved is accurate; this review makes no status award on the registered primary claim.

## Scope and control checks

The shell here is exactly `|T|=2p+2`, together with `x(T)+2<=p` and `3p<2alpha(T)+1` for the primary claim. The vertex-cover bound uses only the last guard and shell order, as stated. The state framework works for the given finite shell tree and must retain all original leaf tags and original deletion sets; it does not change the selector to a local or residual selector.

The supplied generic marked-isolate/order-band candidate concerns `|T|<=2p+1` for its leaf-term corollary, so it does not settle this first shell. The supplied order-252 shell is one finite control only; it does not prove or refute the universal shell assertion. No pointwise sign, support-fiber sign, or selector-independent inference is made here. No source replay was needed or performed: C2-U6 presents no executable computation or finite census claim to reproduce.

## Limitations

This critique verifies algebraic scope and exact-evaluation sufficiency only. It supplies no smaller finite kernel, effective shell census, global cancellation inequality, proof of `S<=0`, or positive full-sum witness. Accordingly, the primary assertion remains open on the evidence reviewed.
