# Cross-orientation critique — C1-CT-U4

## Disposition

**C1-U4-1: retained_narrowed.** The decomposition and coefficient identities are correct. The cited Chudnovsky–Seymour theorem is correctly stated and cannot be applied uniformly to the target's arbitrary trees. Narrow the route's “additional selector-aware global inequality” language to the displayed coefficient-comparison route: the selector sign alone does not determine the aggregate-term sign, so this particular coefficient argument needs a bridge that sums the selected terms. The evidence does not show that every generating-function proof must take that form.

This is a partial reformulation and a correctly identified hypothesis gap, not a proof or counterexample for the lower-region aggregate or for the separately registered tagged-incidence identity. Proposed status remains `proposed_open`.

## Identity and domain audit

Fix an original leaf tag `v`, let `s=s_v`, `H=T-{v,s}`, `R=T-N_T[s]`, and `W=N_T(s)\\{v}`. Deleting `v` leaves `s` adjacent to exactly `W` in `H`. Independent sets of `T-v` that omit `s` contribute `I(H,z)`; those containing `s` contribute `zI(R,z)`. Thus `I(T-v,z)=I(H,z)+zI(R,z)`.

With `q_j=i_j(H)-i_j(R)` and `r_j=i_j(R)`, the coefficient at rank `j` of `I(T-v,z)` is `i_j(H)+r_{j-1}=q_j+r_j+r_{j-1}`. Subtracting ranks `p+1` and `p` gives

`Delta_p(T-v)=q_(p+1)-q_p+r_(p+1)-r_(p-1)`.

Subtracting `Delta_(p-1)(R)` from `Delta_(p-1)(H)` gives the selected summand `q_p-q_(p-1)`. Equivalently these are the coefficients at `z^p` of `(z^-1-1)I(T-v,z)` and `(1-z)(I(H,z)-I(R,z))`, respectively. The rank shifts and signs are correct. The selector is strictly negative as required; the identity itself is valid with the contract's integer zero extension. For eligible `p`, `p>=2`, so all displayed ranks are in the stated ordinary domain, with out-of-range coefficients still handled by zero extension.

The source's conclusion about mismatch follows: knowing only that the first displayed coefficient is negative for each selected leaf does not give the sign of the second displayed coefficient or their sum. No inequality coupling them, no treatment of the fixed favorable mask beyond retaining it in the sum, and no sign proof is supplied. Repeated-support leaves remain separate tags in the target; the identities are per tag and do not collapse them, but the report supplies no further support-fibre or global summation argument. The strict lower-region guard `3p<2a+1` does not enter these local identities and supplies no missing sign bridge by itself.

The route's optional use of the supplied tagged-incidence identity is appropriately limited: the displayed specialization leaves the global `D+C` budget unproved, and nonnegativity of those terms alone cannot establish the required lower bound. It should remain an open obligation, not be treated as a consequence of the coefficient decomposition.

## Literature and controls

The linked primary paper states Theorem 1.1 as: claw-free graphs have independence polynomials with all roots real. Its introduction explicitly gives the claw `K_{1,3}` and polynomial `1+4z+3z^2+z^3` as a counterexample outside that class. Arbitrary trees in the target can contain an induced claw; so can deletion forests `H` and `R` in general. Therefore the theorem has no blanket application here. Its conclusion concerns individual polynomials and does not itself compare the two selected coefficient functionals. Even on claw-free inputs the cited theorem alone would not establish the missing selector-aware sum inequality. The primary theorem and hypotheses were checked against [the paper](https://web.math.princeton.edu/~pds/papers/roots/roots.pdf), Theorem 1.1 and introduction.

The admitted standing controls include `T_22` and `T_60` with positive marked leaf terms but negative complete selected sums. They confirm the protocol's fence: local positivity cannot refute the global aggregate. They do not bear against this claim's algebraic identities, and they are not claimed as a proof of the aggregate. I inspected their supplied exact rows but did not replay the graph enumeration. The lower-region star control `K_(1,12)` is likewise only a finite check. No new graph was constructed; realizability is only the immediate per-leaf decomposition for any actual tree, and no abstract coefficient pattern is asserted to come from a tree.

## Evidence grade and limitations

This review establishes the exact per-leaf algebra by direct coefficient extraction and checks the imported theorem's stated hypothesis against the primary paper. It does not independently reproduce the supplied finite control computations. It does not prove or refute the selected global sum, establish a tree-wide bridge, give an eligible witness, or settle the auxiliary identity. The source's operator bookkeeping is useful for preventing rank/sign confusion, but provides no status evidence for the primary target.

## Source integrity

All SHA-256 values listed in the two assigned packets matched the corresponding source bytes before review. No sealed source file was modified and no source replay was run.
