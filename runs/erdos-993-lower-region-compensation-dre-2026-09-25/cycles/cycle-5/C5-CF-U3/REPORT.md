# C5-CF-U3 critique — independent audit of C5-U3

## Scope and source control

This is the F-orientation critique of the single sealed C5-U3 search case. I audited both source claims, `C5-U3-ALT-CUT` and `C5-U3-PRIMARY-GAP`, and no additional claim IDs are introduced. The case packet lists the route's `EVIDENCE.json`, `REPORT.md`, and `RETURN.json`; all three hashes match. All 237 common packet pins also match. I read the common read-first files and the specifically permitted C5 critic brief. No other worker or unlisted source was used. There was no replay to run: the route supplies a finite-graph proof, not code or a computational certificate.

## Claim `C5-U3-ALT-CUT` — retained

Fix an eligible `(T,p)` and its one fixed selector `F(T,p)`. For each selected original leaf `v`, the contract has `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\\{v}`, `k=p-1`, and `h=a-1`. Eligibility gives `p>=2`, hence `k>=1`; also `3p<2a+1` implies `p<=a` for integer `a`, so `k<=h`. The identities in the claim need only the finite set system, but these checks verify the stated contract ranks are in range.

Let `L_v` be the marked independent `k`-sets of `H_v`, and let `R_v` be its independent `(k+1)`-sets meeting `W_v`. An edge is an inclusion `A subset J`. Each neighbor of a left vertex `A` is obtained by adding an actually addable vertex of `H_v`; because `A` already meets `W_v`, every such extension still meets `W_v`. Thus its degree is exactly `e(A)`. A right vertex `J` with one mark has exactly `k` neighbors: deleting its unique marked element is the sole deletion that leaves the left side. With two or more marks all `k+1` deletions retain a mark. Summing right degrees therefore gives `E_v=kU_v+C_v`, with each multiply marked upper set counted once. This is per original leaf tag; equal supports do not identify or merge the separate incidence graphs. The equality also agrees with the stated definition of `C_v` inside `H_v`.

The maximum-matching argument is valid with the standard alternating convention. Starting from a set `S` of unmatched left vertices, traverse unmatched edges left-to-right and matched edges right-to-left. If the closure reaches a free right vertex there is an augmenting path. Otherwise all reached right vertices are matched, and their partners are exactly the reached left vertices outside `S`: every such left vertex is reached through its matching edge, and every reached right vertex's partner is reached. Every neighbor of a reached left vertex is reached (its matching neighbor, if any, is its predecessor; all other edges are traversed). Hence `N(X)=Y`, the matching pairs `Y` bijectively with `X\\S`, and `|X|-|N(X)|=|S|`. This is an abstract finite bipartite graph lemma and does not require a tree hypothesis.

No scope correction is needed for this exact identity. It is a valid structural cut identity for each incidence graph separately. It does not itself say that a cut has any particular weight or that the cuts across different `v` interact favorably.

## Claim `C5-U3-PRIMARY-GAP` — retained_narrowed

The exact algebraic rewrite used by the route is correct, conditional on the contract's bipartite addability bound. Namely, each color class of the addable vertices of a marked independent `k`-set can be adjoined to that set, so each class has at most `h-k` vertices and `e(A)<=2(h-k)`. Thus `D_v=sum_A(2(h-k)-e(A))>=0`. Put `Q=sum_{v in F}q_v(k)`, `U=sum_{v in F}q_v(k+1)`, `E=sum_{v in F}E_v`, `C=sum C_v`, and `D=sum D_v`, always over the same original-leaf selector. The identities give

`kS = k(U-Q) = E-C-kQ = (2(h-k)-k)Q-D-C = (2a+1-3p)Q-D-C`.

Here `h=a-1` and `k=p-1`; the coefficient simplifies to `2a+1-3p`, which is strictly positive by the lower-region guard. The route correctly observes that `D,C>=0` alone do not yield the needed lower bound on `D+C`; nonnegativity is in the wrong direction for proving this positive-threshold inequality. The per-leaf selector premise `Delta_p(T-v)<0` and the first-descent gap `p>=x(T)+2` are not used by the matching lemma or by this algebra, beyond fixing which leaves are summed and assuring rank eligibility. The route does not derive a map from either coefficient condition to an across-tag weighted cut bound.

The original wording could be read as a global assertion that no such weighted bound or first-descent link exists. That would exceed the evidence. I retain it only as the narrower proof audit: this route's stated alternating-path decomposition establishes no such bound or link, so this route leaves the primary unresolved. It does not refute the primary, and does not prove that another argument or a stronger use of the tree/selector structure cannot supply the missing inequality.

## Standing controls, realizability, and usefulness

The construction is realizable for any selected leaf in an eligible ordinary tree: deleting the original leaf and its support gives a finite forest `H_v`, the original neighboring vertices form `W_v`, and the finite incidence graph is then defined directly from independent sets. No special tree property is needed for the degree count. The proof preserves original leaf tags and does not make a support-fibre substitution. No imported theorem, numerical witness, census, T22-specific statement, or status from a vote is present to audit. The route's open conclusion is consistent with the primary contract and does not conflict with a standing counterexample fence; it makes no claim about the refuted signed operator, covariance identities, or any other auxiliary statement.

The cut identity is useful as an audit framework: any proposed compensation argument can identify unmatched tags and must either exhibit augmenting paths to available resources or account for the weighted deficit across the resulting cut. But this framework alone is unweighted. There are no named resources, weights, tree transformation, or first-descent invariant in the route that would prove a lower bound of `(2a+1-3p)Q`. Accordingly the evidence supports the exact structural lemma and an explicit open proof obligation only.

## Limitations

- No external or computational replay was applicable; the claims are checked by direct proof inspection and algebra.
- No concrete ordinary-tree instance, weighted cut, or positive-tag compensation certificate is given, so no instance-specific behavior is established.
- The unresolved weighted budget and first-descent/selector bridge remain precisely the missing steps; the primary stays open on this evidence.
