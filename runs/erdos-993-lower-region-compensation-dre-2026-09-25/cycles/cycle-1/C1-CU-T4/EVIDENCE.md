# C1-CU-T4 evidence: audit of C1-T4-1

## Scope and source integrity

I checked the three case-listed C1-T4 source files against the SHA-256 pins in `packets/C1-CU-T4.json`, and the sixteen common files against `packets/C1-COMMON.json`; every listed digest matched. The audited mathematical input is the common contract/handoff, protocol, execution policy and critic brief, together with the case's evidence, report, and return. No source code replay or independent finite census was needed for this identity-level claim.

## Identity checks

Fix an original leaf `v`, let `G=T-v`, `s=s_v`, `H=T-{v,s}`, `W=N_T(s)\\{v}`, and `R=H-W`. Partition independent sets of `G` according as they omit or contain `s`. Sets omitting `s` are counted by `H`; sets containing `s` correspond to sets in `R` after deleting `s`. Thus, with zero extension,

`i_j(G)=i_j(H)+i_(j-1)(R)`.

For any finite graph `G`, double-count pairs `(J,u)` where `J` is an independent `p`-set and `u` is addable to `J`. Each independent `(p+1)`-set contributes exactly `p+1` pairs. If `i_p(G)>0`, uniform `J` therefore satisfies

`E[e_G(J)]=(p+1)i_(p+1)(G)/i_p(G)`.

Since the denominator is positive, `Delta_p(G)<0` is equivalent to this expectation being less than `p+1`. In the favorable case positivity is automatic: if `i_p(G)=0`, then `i_(p+1)(G)=0` as well, so `Delta_p(G)=0`, contradicting favorability. The route states the needed denominator condition and its equivalence correctly.

The desired summand is

`Delta_(p-1)(H)-Delta_(p-1)(R)=q_p-q_(p-1)`,

where `q_j=i_j(H)-i_j(R)` counts independent `j`-sets meeting `W`. For marked independent `k`-sets `A`, summing their actual addable-vertex counts in `H` counts each marked `(k+1)`-set once per marked-preserving deletion. A singly marked extension contributes `k` and a multiply marked extension contributes `k+1`; hence the sum is `k q_(k+1)+C`, with multiply marked extensions counted once in `C`. This is a valid incidence identity. It describes a marked rank slice of `H`, not the uniform rank-`p` measure on `G` from the selector.

The supplied specialization `kS=(2a+1-3p)sum_F q_v(k)-sum_F(D_v+C_v)` is algebraically consistent with the contract's summand and `k=p-1`. In the strict lower region the coefficient `2a+1-3p` is positive. Thus `D_v,C_v>=0` by themselves do not establish the required aggregate lower bound on their sum. The favorable selector's unconditioned expectation bound supplies no stated coupling, conditional expectation comparison, or cross-leaf summation inequality that would establish it.

## Disposition and limits

The exact reformulation is retained. It has no hidden status implication for the primary aggregate. The neutral handoff's `K_(1,12)`, order-91 `T_22`, and order-243 `T_60` controls demonstrate respectively a negative selected sum and local positive terms coexisting with negative full sums; these are controls, not a bridge or a refutation. I did not independently replay their integer computations because the source claim does not depend on them.

No theorem, counterexample, or complete proof of the global lower-region assertion is supplied by this route. In particular, the deficit budget remains the precise unresolved step.
