# C1-CU-T1 critique of C1-T1-1

## Disposition

**C1-T1-1 — retained** (`proposed_verified`), at exactly its stated star-subfamily scope. This is a correct, nonvacuous symbolic result for all admissible stars. It does not establish the registered aggregate on arbitrary finite ordinary trees, and it does not establish the optional tagged-incidence identity or the global deficit budget.

## Claim and proof audit

For `T=K_{1,m}`, the independent-set polynomial is `(1+z)^m+z`, since an independent set is either a subset of the `m` leaves or the singleton center. The independence number is `a=m`. At ranks `j>=2`, `i_j(T)=binom(m,j)`. Also `Delta_0=m` and `Delta_1=binom(m,2)-(m+1)>0` for `m>=4`. For the remaining ranks, `Delta_j=binom(m,j+1)-binom(m,j)`; its first negative value is at `j=ceil(m/2)` (with a zero middle value when `m` is odd). Therefore `x(T)=ceil(m/2)`. The terminal zero-extension rank is not the first descent.

The eligibility conditions imply `p>=ceil(m/2)+2` and, since `p` is integral, `3p<=2m`, hence `p<=floor(2m/3)<m`. Thus `2<=p<=m-1`. In `T-v=K_{1,m-1}`, the rank `p` difference is `binom(m-1,p+1)-binom(m-1,p)`, which is strictly negative under this lower bound on `p`, including the zero-extended endpoint. All `m` distinct original leaf tags are consequently selected.

For each selected leaf, its original support is the center. `T-{v,s_v}` is the independent graph on `m-1` vertices, and `T-N_T[s_v]` is empty. Setting `k=p-1`, the difference of their rank-`k` adjacent differences is

`binom(m-1,k+1)-binom(m-1,k) = binom(m-1,p)-binom(m-1,p-1) < 0`.

Here `k>=ceil(m/2)+1`, so the strict binomial sign follows; the empty graph contributes zero at this rank. There are exactly `m` leaf tags, even though they share one support, so summing gives exactly the claimed formula with no lost multiplicity.

The result is useful rather than vacuous: `m=12,p=8` satisfies both guards and gives `S=12*(binom(11,8)-binom(11,7))=-1980`. The claim correctly covers all admissible cases for its stated `m>=4` domain.

## Scope, novelty, and gaps

This is an exact elementary specialization of the target to stars, proved by direct binomial arithmetic. It is not a new proof of the all-tree target. All stars have one support shared by their leaves, so the argument supplies no mechanism for compensation across distinct supports in a general tree. No supplied or imported theorem is needed, and no computation is needed for the proof. The primary global assertion and the auxiliary incidence identity remain open from this evidence.

## Pin verification

Both sealed route files and every file hash listed in `C1-COMMON.json` matched their packet hashes. The checked digest list is recorded in `evidence/pin-verification.txt`; no source file was modified or rewritten.
