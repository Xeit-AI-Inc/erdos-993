# C5-CT-U1 critique (orientation T)

## Scope and source integrity

This review covers exactly `C5-U1.coefficient-window` and `C5-U1.Tm-bounded`. The four assigned C5-U1 source files and all 237 common packet-listed files match their pinned SHA-256 values. The source replay was copied to this scratch directory before execution; it was not run from the sealed source location.

## `C5-U1.coefficient-window` — retained

For finite integer coefficient sequences, coefficient convolution gives

`[z^(p+1)](Gg)-[z^p](Gg) = sum_r g_r ([z^(p-r+1)]g-[z^(p-r)]g)`,

so `Delta_p(f)=sum_r g_r Delta_(p-r)(g)+Delta_p(e)` when `f=Gg+e`. If the weighted window sum is `M<0` and `|Delta_p(e)|<-M`, then `M+Delta_p(e)<0`. These are exact identities and a valid conditional sign test, including zero extension at boundary ranks. They do not show that central-only log-concavity or first descent makes the shifted window negative. The no-recovery/direct-window bridge remains absent, and the claim correctly makes no tree-wide inference.

## `C5-U1.Tm-bounded` — retained_narrowed

The route’s stated family is the ordinary tree with path `0-1-2` and `m` claw centers adjacent to `0`, each with three tips. The root-conditioned decomposition gives `I(T_m)=(1+2z)A^m+z(1+z)B^m`, where `A=1+4z+3z^2+z^3` and `B=(1+z)^3`. For a deleted tip, when `0` is selected the endpoint `2` remains isolated. Thus the correct selector polynomial is

`I(T_m-v_tip)=(1+2z)A^(m-1)C+z(1+z)^3 B^(m-1)`, `C=1+3z+z^2`.

The source instead uses `z(1+z)^2 B^(m-1)`, omitting the endpoint factor. This makes 417 of the 854 eligible orbit/rank selector-difference values numerically wrong. However, an independent exact replay with the corrected polynomial found zero strict-sign changes, so the favorable tip ranks are unchanged. The endpoint deletion formula is correct. The other two polynomials used for the summands are also correct: `I(T_m-{v_tip,s_v})=(1+z)^2((1+2z)A^(m-1)+z(1+z)B^(m-1))`, and `I(T_m-N[s_v])=(1+2z)A^(m-1)`; for endpoint `2`, the formulas are `A^m+zB^m` and `A^m`.

The corrected replay checks zero-extended first descent through the terminal rank, both eligibility guards, all 427 eligible `(m,p)` rows (`m=3,...,40`), both original leaf orbits, and multiplicity `3m` for the distinct tip leaves sharing a support. Each corrected strict selector and per-leaf summand is in the audit evidence. All 427 corrected full sums are negative. Thus the finite conclusion survives, but the route’s selector magnitudes and evidence should not be retained as written. This remains bounded computation for this exact family through `m=40`; it gives no result for larger `m` or arbitrary ordinary trees and does not prove the proposed infinite-family analytic certificate.

## Dispositions

- `C5-U1.coefficient-window`: retained as the exact polynomial identity and conditional perturbation test, with no implied log-concavity or no-recovery bridge.
- `C5-U1.Tm-bounded`: retained_narrowed to the same finite family/range using the corrected tip-deletion polynomial; the strict selector set and all full sums were independently recomputed.

No theorem from outside literature, global lower-region proof, general-tree refutation, or authoritative status is established here.
