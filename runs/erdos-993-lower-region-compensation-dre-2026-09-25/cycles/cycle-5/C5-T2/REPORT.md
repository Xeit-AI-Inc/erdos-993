# C5-T2 search: heterogeneous star branches

## Exact setup

For a nondecreasing profile `(r_1,...,r_m)` with `r_i in {2,3,4}`, form the ordinary tree with path `0-1-2`; for each `i`, add a center `c_i` adjacent to `0` and `r_i` tip leaves adjacent only to `c_i`. The original leaves are the path endpoint `2` and every tip leaf, each retained as a separate tag. Put `N=sum_i r_i`.

The branch independence polynomial is `B_r(z)=(1+z)^r+z`. Direct conditioning on whether vertex `0` is used gives

`I_T(z)=(1+2z) product_i B_{r_i}(z) + z(1+z)^(N+1)`.

This identity is a useful heterogeneous reduction, but does not establish the target sign. For example, the leaf-deletion polynomials are `(1+z) product_i B_{r_i}+z(1+z)^N` for endpoint `2`, and `(1+2z)B_{r_i-1} product_{h!=i}B_{r_h}+z(1+z)^N` for a tip on branch `i`. They preserve the actual original support and give a small exact route to checking selectors and terms.

## Exact bounded computation

`PROFILE-CENSUS.py` uses integer polynomial tree dynamic programming, not floating point or a library log-concavity test. For each graph it computes the full independence vector; locates `x` by scanning zero-extended `Delta_j` through `j=alpha+1`; tests every integer `p` satisfying `x+2<=p` and `3p<2alpha+1`; tests the strict deletion selector separately for every original leaf; and computes each selected summand from the two original-tree deletion sets `{v,s_v}` and `N[s_v]`. `PROFILE-CENSUS.json` records the graph profile, full independence vector, `alpha`, `x`, every eligible row, all original-leaf selector deltas, every selected `(leaf,support,term)` triple, and the complete sum.

The generation boundary is all nondecreasing profiles of lengths `1` through `10` over `{2,3,4}`. This is exactly `sum_{m=1}^{10} binom(m+2,2)=285` profiles. Of these, 273 have at least one eligible rank, giving 913 profile-rank rows. Across those rows, all original leaves (including endpoint `2`, with separate tags for tips sharing a support) were selected: no empty or proper selector occurred. The complete sums were strictly negative in all 913 rows; the largest was `-275` at profile `(3,4)`, `alpha=9`, `x=4`, `p=6`; the smallest was `-3351112008120` at profile `(4,...,4)` of length 10, `alpha=42`, `x=20`, `p=24`. Eligible ranks ranged from 6 to 28. These are exact bounded observations only.

Replay from this directory with `python3 PROFILE-CENSUS.py`. The script deterministically regenerates `PROFILE-CENSUS.json`; it uses no random seed. It enumerates arity-count profiles (equivalently all nondecreasing profiles), not labeled branch permutations, which is complete for this family because permuting branches gives isomorphic trees and the code checks each leaf tag within each profile.

## Mathematical status and gap

The structural factorization and deletion formulas above are exact. The computation supports the primary inequality for the stated finite profile/rank boundary and independently confirms that the selector is all-leaf on those rows. It does not prove either fact for unbounded `m`, and no sufficiently-many-branches cutoff or finite-debt estimate has been established. In particular, I did not prove the required heterogeneous central log-concavity/mixed-minor bounds for the distributed marked polynomial; Poisson-ULC of individual factors or a positive sum of log-concave sequences would not by itself supply that missing step. No primary-literature theorem was imported. The lower-region aggregate therefore remains unresolved by this route.
