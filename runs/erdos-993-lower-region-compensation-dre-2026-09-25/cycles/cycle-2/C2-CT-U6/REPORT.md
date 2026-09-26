# C2-CT-U6 critique of C2-U6

## Review scope

This critique covers exactly the three claims in the sealed C2-U6 return. The route proposes a fixed-rank state description for the first-order shell `|T|=2p+2`, derives a necessary vertex-cover bound there, and reports that this description does not settle the shell inequality. It does not claim a census, a uniform kernel, a sign theorem, or a counterexample.

## Claim dispositions

### `C2-U6.shell-state-framework` — retained

For a fixed `p`, the shell fixes `n=2p+2`. The include/exclude recurrence is correct with the route’s definitions: `B_Q=z product_i A_(Q_i)` for sets containing the root, and `A_Q=product_i(A_(Q_i)+B_(Q_i))` for sets omitting it. Independence polynomials of the induced forest after a deletion factor over its components. Thus full exact polynomials for `T`, each `T-v`, `T-{v,s_v}`, and `T-N[s_v]`, together with the original leaf tag and support list, determine all quantities named in the claim. In particular, scanning the full `I_T` coefficient vector through degree `alpha(T)` and using the zero coefficient at `alpha(T)+1` checks the terminal difference `Delta_a=-i_a`; the coefficients of `I_(T-v)` determine the strict selector at `p`; and the two deletion polynomials give that tag’s summand at `p-1`. Repeated supports remain repeated tags when the sum is taken.

The finite-state assertion is only for each fixed `p`: there are finitely many trees of fixed order, and the stated integer polynomial/tag data have finite ranges. This does not establish a useful compression, a bound uniform in `p`, or `S<=0`. Nor does it provide a concrete generator, enumeration, or replay result. The route appropriately states those limitations. I read “suffices” as exact evaluation from the complete listed data; it is not evidence that a reduced branch signature alone preserves the deletion profiles.

### `C2-U6.shell-vertex-cover-bound` — retained

Write `n=2p+2`, `a=alpha(T)`, and `tau=n-a`. Since `a` is integral, `3p<2a+1` is equivalent to `a>=ceil(3p/2)=floor((3p+1)/2)`. Therefore

`tau <= 2p+2-floor((3p+1)/2) = floor(p/2)+2`.

The equality holds for even and odd `p` (put `p=2q` or `p=2q+1`). This is a necessary bound only; it imposes no fixed upper bound as `p` grows and does not entail shell feasibility or the target sign. The route gives it that limited scope.

### `C2-U6.primary-shell-open` — retained

The exact statement is that this route has not resolved the complete selected-sum inequality on the eligible first-order shell: `|T|=2p+2`, `x(T)+2<=p`, and `3p<2alpha(T)+1`, with `x` computed from zero-extended counts and the selector, supports, and neighborhoods taken in the original tree. The state representation preserves this full target but supplies neither a sign bound nor a realizable positive full sum. “Open” is a proposed report of the route’s result, not a claim that the inequality is mathematically false or an authoritative registry action. No weakened rank condition or pointwise condition is substituted.

## Coverage and limitations

All three source claim IDs are covered once. No route computation required replay: the route reports no execution or finite census. The recurrence and shell-bound arithmetic were independently checked above. This critique verifies the stated logical sufficiency and limitations; it does not establish that the primary or shell inequality holds, and it does not claim an exhaustive generation boundary or any new mathematical result.
