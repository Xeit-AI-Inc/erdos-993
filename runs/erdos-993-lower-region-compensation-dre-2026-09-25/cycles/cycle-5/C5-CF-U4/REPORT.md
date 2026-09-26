# C5-CF-U4 critique (orientation F)

## Scope and source integrity

Audited the sole case-listed route, C5-U4, against the common solution contract and protocol. All 237 hashes listed by C5-COMMON.json and all three case hashes in C5-CF-U4.json matched. The only required source claim is C5-U4-LEMMA-1; this review covers exactly that ID.

## Disposition: C5-U4-LEMMA-1 — retained

The leaf deletion partition is valid for an original leaf v and its unique support s: an independent set containing v contains no s, and removing v leaves an arbitrary independent set of T-{v,s}. Thus I_T=I_(T-v)+z I_(T-{v,s}). With integer zero extension, its coefficient form holds at every integer rank. Subtracting adjacent coefficients gives

`Delta_j(T)=Delta_j(T-v)+Delta_(j-1)(T-{v,s})`.

At the first strict descent x, the left side is negative. The two integer terms on the right therefore cannot both be nonnegative, proving the route’s per-leaf alternative. This argument applies independently to each original leaf, including leaves with a shared support.

The K_(1,3) arithmetic is correct: its independence vector is (1,4,3,1), its first strict descent is x=1, and deleting a leaf gives (1,3,1), whose zero-extended Delta_3 is 0. Since p=3 gives 3p=9, while 2alpha+1=7, the example fails the strict lower-region guard. It refutes only the stated unguarded implication, not a selector transfer in the assigned region.

No proof step here supplies a relation from Delta_x(T)<0 to Delta_p(T-v)<0 when p>=x+2. The claim correctly stops at the rank-local alternative and makes no assertion resolving the favorable-leaf aggregate. The cited literature note is not needed for this disposition; I did not use it as a premise.

## Limits

This review verifies the exact identity, its sign consequence, and the displayed finite example. It establishes no eligible cross-rank selector transfer, eligible counterexample, complete favorable set, or global aggregate sign. No source replay was needed.
