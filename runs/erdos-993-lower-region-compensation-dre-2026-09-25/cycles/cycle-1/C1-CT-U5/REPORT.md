# C1-CT-U5 critique of C1-U5

## Disposition

`C1-U5-1` is **retained** on the scope stated by its source claim: the selected sum is strictly negative for every eligible ordinary star, and the support-core polynomial / rooted branch recurrences are exact for every ordinary tree of order at least three. This is a subfamily theorem and an exact evaluation representation. It does not resolve the primary lower-region aggregate on general ordinary trees.

## Audit

The star coefficient sequence has `i_1=m+1` and `i_j=binom(m,j)` for `j>=2`. Its first strict descent is `m/2` for even `m>=6` and `(m+1)/2` for odd `m>=7`. The eligibility inequalities then force `p>m/2`; the small stars have no eligible rank. For eligible stars `p>=5`, so every `T-v` has `Delta_p=binom(m-1,p+1)-binom(m-1,p)<0` and all leaf tags are selected. The local term is `binom(m-1,p)-binom(m-1,p-1)<0`, hence the full sum is strictly negative. The exact `K_{1,12}` values in the route also check arithmetically.

The core formula and two-state recursion follow by splitting independent sets according to selected core roots. Deleting one leaf tag at support `s` changes only the factor `(1+z)^{m_s}`, so both selector value and local summand are common across the `m_s` tags; multiplication by `m_s` is necessary and is correctly retained. The formula for `T-N[s]` correctly uses the branch state after deleting each neighbor root, leaving its own pendant leaves available.

The route correctly disclaims a general sign comparison. Exact coefficient evaluation does not imply that favorable selector values control the sum of rank-`p-1` local differences. The standing `T_22` and `T_60` lower-region controls have positive individual terms alongside negative full sums, confirming that no termwise-negativity transport can be inferred. No counterexample, literature bridge, bounded census, or status award is offered.

Details of the algebraic and domain audit are in [critique-audit.md](evidence/critique-audit.md). Source hashes in the packet matched. No source evidence was edited or replayed.

## Limitations

- The disposition retains only the route's star theorem and exact identities; it does not infer the primary aggregate for nonsingleton cores.
- No independent full polynomial replay was run for the supplied `T_22` or `T_60` rows; their control values are used as supplied in the common handoff.
- No exhaustive generation, external literature search, or counterexample search was performed.
