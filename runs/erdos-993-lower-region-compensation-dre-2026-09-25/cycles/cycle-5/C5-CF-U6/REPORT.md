# C5-CF-U6 independent critique (orientation F)

## Scope and source integrity

I audited all three claims in the assigned C5-U6 return against the admitted solution contract and the exact case files. The packet-listed hashes matched for all three case files and all 237 listed common files. I also read the common read-first controls, WORKER-PROTOCOL.md, and the additional C5 critic brief. No source replay was needed; the decisive checks below are direct symbolic checks.

## Claim dispositions

### C5-U6-MARKED-SHELL-REDUCTION — rejected

The first-mark bijection itself is valid: assign each independent set meeting W to its unique earliest w, remove w, and forbid earlier marks and N_H(w). With the stated definition of G_w, this gives

`q_j = sum_w i_(j-1)(G_w)`.

Consequently, using `Delta_r=i_(r+1)-i_r`, subtraction gives

`q_j-q_(j-1) = sum_w Delta_(j-2)(G_w)`,

with a **plus** sign. Likewise the exact leaf-deletion identity is `I(T-v;z)=I(H;z)+zI(R;z)`, so

`Delta_p(T-v) = (q_(p+1)-q_p) + i_(p+1)(R)-i_(p-1)(R)`
`= sum_w Delta_(p-1)(G_w) + i_(p+1)(R)-i_(p-1)(R)`.

Both signs in the source claim (and its report/evidence) are reversed. The target summand remains exactly `q_p-q_(p-1)`, but its claimed negative marked-shell expression is false. This rejects the stated reduction only; it does not refute the primary aggregate. The corrected identities are recorded in EVIDENCE.json.

### C5-U6-STAR-LOWER-REGION — retained

For a star `K_(1,m)`, the stated independence counts are correct: `i_0=1`, `i_1=m+1`, and `i_j=binom(m,j)` for `2<=j<=m`, followed by zero extension. For `m>=4`, `Delta_0=m>0` and `Delta_1=binom(m,2)-(m+1)>0`; thereafter the first negative binomial difference occurs at `j=ceil(m/2)`, including the terminal `Delta_m=-1`. Thus `x=ceil(m/2)`.

The gates reduce exactly to `ceil(3p/2)<=m<=2p-4`: the lower bound is equivalent to the strict integer inequality `3p<2m+1`, and the upper bound to `x+2<=p`. This interval is nonempty iff `p>=8`. In it, `m>=ceil(3p/2)` ensures the binomial coefficients used at ranks `p,p+1` exist, and `m<=2p-4<2p+2` makes `Delta_p(K_(1,m-1))<0`, so every original leaf is selected. Each distinct tagged summand is `binom(m-1,p)-binom(m-1,p-1)<0`, since `m<=2p-4<2p`; the full sum is the stated negative multiple. This is a valid proof on the star subfamily only.

### C5-U6-PRIMARY-STATUS — retained

The route correctly leaves the registered general-tree lower-region aggregate unresolved. The valid star subfamily result does not prove the all-tree claim, and the rejected marked-shell formula cannot supply a general reduction as stated. No eligible full-sum counterexample or proof for arbitrary ordinary trees is present in this case.

## Limitations

This critique checks only the assigned route and allowed common controls. The sign correction is an algebraic audit, not a replacement proof of the primary. The star result is restricted to `K_(1,m)` and says nothing about other trees. No imported theorem or computation was needed.
