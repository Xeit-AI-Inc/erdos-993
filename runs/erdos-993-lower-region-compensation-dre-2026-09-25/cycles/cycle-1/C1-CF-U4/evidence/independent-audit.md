# Independent audit evidence for C1-U4-1

## Disposition

**retained.** The exact per-leaf coefficient identities and the limited audit of the Chudnovsky–Seymour theorem are correct. This is a partial reformulation and route-specific obstruction only; it proves or refutes neither registered identity. Any reading of the report as saying that every possible generating-function proof must establish one particular inequality is narrowed to the displayed direct coefficient-comparison route.

## Algebra and domains

Fix one original leaf tag `v`, its original support `s=s_v`, and define `H=T-{v,s}`, `R=T-N_T[s]`, `W=N_T(s)\\{v}`. Then `R=H-W` as an induced deletion. Independent sets of `T-v` split disjointly according to whether they omit or contain `s`; in the latter case all vertices in `W` are excluded. Therefore

`I(T-v,z)=I(H,z)+z I(R,z)`.

With `h_j=i_j(H)`, `r_j=i_j(R)`, and `q_j=h_j-r_j`, zero extension at every integer rank gives

`i_j(T-v)=h_j+r_{j-1}=q_j+r_j+r_{j-1}`.

Consequently

`Delta_p(T-v)=q_(p+1)-q_p+r_(p+1)-r_(p-1)`,

and the summand belonging to this same tag is

`Delta_(p-1)(H)-Delta_(p-1)(R)=q_p-q_(p-1)`.

These equations have the stated rank shifts and signs. Equivalently, their coefficient operators are `[z^p](z^-1-1)I(T-v,z)` and `[z^p](1-z)(I(H,z)-I(R,z))`, respectively. The selector is a strict negative test on the first quantity; it is not a sign test on the second. Summing the second identity over the unchanged set `F(T,p)` recovers `S(T,p)=sum_(v in F)(q_v(p)-q_v(p-1))`, with one summand per original leaf tag. Coincident supports do not identify or remove tags.

No tree-specific existence, positivity, or global comparison follows from these identities. They are valid for each leaf in every finite ordinary tree, with integer zero extension. Under the contract's hypotheses `x(T)>=0` and `p>=x(T)+2`, hence `p>=2` and rank `p-1` is valid. The lower-region inequality makes `2a+1-3p` positive, but this sign alone does not bound the selected sum of coefficient differences. The report correctly leaves the selector-aware global comparison open. It also does not turn the optional `D+C` identity into a proof of its missing budget.

## Spectral hypothesis check

The cited primary source is Chudnovsky and Seymour, “The Roots of the Independence Polynomial of a Clawfree Graph,” JCTB 97 (2007), 350–357, https://web.math.princeton.edu/~pds/papers/roots/roots.pdf. The manuscript's Theorem 1.1 states that the independence polynomial of a claw-free graph has only real roots. Its introduction explicitly gives the claw `K_{1,3}` and polynomial `1+4z+3z^2+z^3` as a non-real-rooted example. Thus the theorem's hypothesis is absent from the universal ordinary-tree target: an ordinary tree may contain an induced claw, and its relevant deletion forests need not be claw-free. The theorem, as stated, concerns real-rootedness of individual graph independence polynomials. The worker supplies no application that bounds the two different finite-difference functionals under the target's leaf-dependent strict selector. Even where claw-freeness applies, that missing comparison is not a consequence shown in this submission. The source audit is therefore valid at this limited scope; it cannot establish that no other theorem or proof route could help.

## Standing controls and usefulness

The admitted handoff gives the lower-region `K_(1,12)` control with `(a,x,p)=(12,6,8)`, 12 selected tags, and `S=-1980`. It also gives eligible `T_22` and `T_60` controls with complete aggregates `-498754180547001418536` and `-1058142362147652597702654588268394677176033202323316960380`, respectively, despite listed positive marked terms. These controls are consistent with the identities above and confirm that an argument from a positive local/marked term alone cannot decide the full sum. They do not test or prove a new aggregate bound: this route proposes none. No source replay was needed because the claim is symbolic and imports no computational witness. The controls' supplied values are treated as common admitted data, not independently replayed arithmetic.

## Exact scope and limitations

This audit retains only the claimed local decomposition and the conclusion that the cited claw-free real-rootedness theorem does not itself establish the universal selected aggregate. It does not audit or award a status to the optional tagged-incidence auxiliary, prove the lower-region theorem, produce a counterexample, cover the high-tail region, or infer a residual/RTree transfer. No exhaustive computation was made. The primary literature reference was checked directly; no broader literature survey was made.
