# C4-CF-U6 critique (orientation F)

Packet verification: all three case-source hashes and all 179 listed common-source hashes matched. I opened only the common read-first files, the additional critic brief, and the three case-listed U6 files; hashing the remaining listed common members did not use their contents as premises.

## Reviewed claim

The sole required covered claim is `C4-U6-first-shell-bridge`. Its disposition is **retained_narrowed**. The contract-level count identity and the limitation of an exact first-shell argument are sound. I narrow the claim because the underlying frozen Lean interface, informal proof, and preflight cited by U6 are not among the three case-listed worker files; those source-specific assertions cannot be independently checked within this review boundary.

## Independent check

For an original leaf `v` with support `s`, put `H=T-{v,s}`, `W=N_T(s)\\{v}`, and `R=T-N_T[s]`. From the contract definitions, `R=H-W`: the vertices removed from `H` to obtain `R` are exactly the other neighbors of `s`. Thus independent `j`-sets of `H` split disjointly into those meeting `W` and those avoiding `W`; the latter are exactly the independent `j`-sets of `R`. If `q_j` counts the former, then `i_j(H)-i_j(R)=q_j`. With `k=p-1`, the summand is

`Delta_k(H)-Delta_k(R) = (i_(k+1)(H)-i_k(H))-(i_(k+1)(R)-i_k(R)) = q_(k+1)-q_k`.

This is an identity for each original leaf, so summing over the contract's fixed favorable set counts each selected leaf separately, including leaves that share a support. It proves no sign for the sum. In particular, it supplies no global compensation inequality.

The order arithmetic is also straightforward conditionally: in the asserted first-shell case `|V(T)|=2p+2`, deleting the two distinct vertices `v,s` leaves `2p` vertices, which equals `2(p-1)+2`. This explains the stated exact-order dependency if the cited sharp lemma has that hypothesis. An exact-order result alone does not establish the contract's arbitrary-order target. I did not independently verify the lemma or the claimed informal proof because their source files are outside this case's read boundary.

## Scope, standing controls, and usefulness

The reviewed return leaves the primary lower-region aggregate open and makes no proof or refutation claim, consistent with the solution contract. The count identity is useful as a definition-level bridge for later arguments, but it is not a sign estimate. The first-shell scope described by U6 is narrower than the primary target; no scale-up follows from the stated order match alone. I found no contradiction in the algebra or in the proposed open status.

## Limitations

- I read the pinned U6 evidence, report, and return, plus the required common read-first controls and critic brief. I did not open the underlying frozen `BASE.lean`, theorem contract, informal audit, or preflight sources cited inside U6's evidence, because they are not case-listed worker files.
- No Lean build or external literature check was performed.
- This critique establishes only the contract-level identity and the conditional order comparison; it does not independently audit the first-shell shadow proof or resolve the primary aggregate.
