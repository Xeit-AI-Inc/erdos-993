# C1-CF-T1 cross-orientation critique

## Disposition

**C1-T1-1: retained.** The claim is a correct exact theorem on the stated star subfamily. It does not prove or narrow the universal registered lower-region assertion beyond that subfamily.

## Pin and scope audit

The two case-listed C1-T1 files match their packet SHA-256 pins. All common packet files checked against their pins also match, including the root-level `SOLUTION-CONTRACT.md`, `NEUTRAL-HANDOFF.md`, `WORKER-PROTOCOL.md`, and `EXECUTION-POLICY.md`. The route's exact claim and its sole report evidence are the only route outputs audited.

The source claim is exactly conditional on `T=K_{1,m}`, `m>=4`, and the registered eligibility guards; it neither asserts the global target nor claims to prove the tagged-incidence identity. The symbolic argument covers all eligible `p` values, including the zero-extended endpoint `p=m-1`; for some small `m` the two eligibility guards admit no `p`, which is harmless for this conditional statement.

## Proof audit and endpoint checks

For `K_{1,m}`, the independence polynomial is `(1+z)^m+z`, so `i_0=1`, `i_1=m+1`, and `i_j=binom(m,j)` for `j>=2`. Thus `Delta_0=m>0`, `Delta_1=binom(m,2)-(m+1)>0` for `m>=4`, and from rank 2 onward the binomial difference first becomes negative at `x=ceil(m/2)` (with the odd middle difference equal to zero). This agrees with the terminal zero extension and the stated first strict descent.

Eligibility then gives `p>=ceil(m/2)+2`; the strict lower-region guard gives `p<m`, hence `2<=p<=m-1`. For each original leaf, `T-v=K_{1,m-1}` and

`Delta_p(T-v)=binom(m-1,p+1)-binom(m-1,p)<0`,

including `p=m-1`, where the first binomial is zero. Therefore every one of the `m` distinct leaf tags is selected. Deleting the original leaf and its support leaves `m-1` isolated vertices; deleting the original closed support neighborhood leaves the empty graph. At `k=p-1>=ceil(m/2)+1`, their difference of `Delta_k` values is

`binom(m-1,k+1)-binom(m-1,k)=binom(m-1,p)-binom(m-1,p-1)<0`.

Multiplying by the `m` distinct selected leaves yields the claimed exact formula. The proof uses original supports/neighborhoods as required and has no missing rank or favorable-selector step.

## Scope and standing-control checks

The proof is family-specific: its polynomial formula and common center support supply no argument for trees with multiple support fibers. That is a limitation already stated by C1-T1, not a defect in C1-T1-1. The shared T22 and T60 controls have positive marked/local terms but negative complete sums; they warn against promoting a positive fibre to a counterexample. C1-T1 makes no such promotion and relies on no local-to-global transport. The five named non-log-concave fixtures and bounded controls likewise neither contradict nor extend this star calculation.

No new computation or imported theorem is needed. Evidence grade: exact symbolic proof, limited to stars. The arbitrary-tree primary target and the optional incidence-deficit identity/global budget remain unresolved.
