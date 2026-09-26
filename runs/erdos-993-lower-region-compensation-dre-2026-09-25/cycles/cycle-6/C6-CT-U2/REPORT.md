# C6-CT-U2 bounded census critique (orientation T)

## Disposition

**C6-U2-CENSUS-M1-40 — retained.** The exact bounded statement in the source return is supported by its coefficient enumeration, and I independently replayed that enumeration from a copy in this seat's scratch directory. This disposition concerns only the finite tree family and boundary stated below. It is not evidence for the arbitrary-tree target or for any larger prefix.

## Audited scope and guards

The family is the ordinary tree formed from path `0-1-2` by attaching `m` distinct branch centers to `0`, each with `r_i` private leaves, where the unordered multiset has `r_i in {2,3,4}` and `1 <= m <= 40`. The profile count is `sum_{m=1}^{40} binom(m+2,2)=12,340`.

Writing `L=1+z`, `B_r=L^r+z`, `Q=prod_i B_{r_i}`, and `N=sum_i r_i`, the submitted recurrence

- `P=(1+2z)Q+zL^(N+1)`,
- `A_0=LQ+zL^N` for deletion of endpoint leaf 2, and
- `A_r=(1+2z)B_(r-1)H_r+zL^N` for deletion of one private leaf on an arity-r branch,

matches a split on whether vertex 0 is chosen. For an endpoint leaf, `i(H_v)-i(R_v)=zL^N`; for a private leaf on an arity-r branch it is `zZ_r`, where `Z_r=(1+2z)F_rH_r+L^N` and `F_r=(L^(r-1)-1)/z`. For `H_v-R_v=zZ`, the contracted summand is `[zZ]_p-[zZ]_(p-1)=Z_(p-1)-Z_(p-2)`, exactly as coded. The selector remains the strict condition `Delta_p(A)<0` for each original leaf deletion polynomial.

The first descent scans coefficient ranks through `deg(P)`, including the terminal zero-extended rank. The strict guard `3p<2alpha+1` is equivalent for integer `p` to `p<=floor(2alpha/3)`, so the code's interval `x+2 <= p <= (2alpha)//3` checks exactly the eligible ranks. Arity multiplicity is `r * count(r in profile)`, retaining one summand for each original private leaf, including equal-support leaves; the endpoint tag is counted separately.

## Replay and checks

All common pins (237/237) and the four case pins matched their packet hashes. I read the protocol, common read-first files, C6 critic brief, C6 source map and allocation, and the source-map-listed `inputs/ordinary_tree_checked.py` graph evaluator. The source map's other candidate routes are not premises for this bounded census.

I copied `census.py` and the pinned graph evaluator into `replay/`, changed only the replay copy's root and output locations, and ran it with `/Library/Frameworks/Python.framework/Versions/3.11/bin/python3`. The replay agrees with the submitted evidence: 12,340 profiles; 191,016 eligible profile/rank pairs; 19,131,028 selected original-leaf tags; and 191,016 strictly negative full sums, with no zero or positive row. Endpoint selection occurs in all eligible rows. It reproduces 5,253,954 listed central-margin checks with zero failures, including none at the first descent.

The six specified actual-tree checks comprise 164 polynomial comparisons: the tree polynomial, endpoint-deletion polynomial, private-leaf deletions, and `H_v-R_v` against `zZ_r`. All matched. These are useful fidelity checks, not exhaustive graph enumeration; profile coverage relies on the recurrences. The replay result and the replayed source copies are included under `replay/`.

## Limitations

The result is a bounded computation for this one path-and-branches family through `m=40`. It does not cover all `m<2000`, establish an infinite heterogeneous-family theorem, or resolve the primary arbitrary ordinary-tree aggregate. The six graph checks are samples. Central log-concavity checks cover only the named polynomials and rank interval and do not prove mixed-minor or uniform analytic claims. No theorem import or primary-target proof is claimed.
