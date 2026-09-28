# C4-CU-F2 independent critique

## Scope and source integrity

I reviewed the two registered lower-half shifted-comparison claims and the two packet claims. SHA-256 checks matched all 174 members of `manifests/C4-COMMON-DISPATCH.json` and all 12 entries in the dispatched packet’s `allowed_source_files`. The case `REPORT.md` says the packet had an empty `allowed_source_files`; that is contradicted by the packet. I used the actual packet list and did not inspect unlisted cases, sibling scratch, proposals, or private transcripts.

The five packet producer scripts were copied into this scratch before execution and rerun with `PYTHONDONTWRITEBYTECODE=1`; commands and output summaries are recorded in the checked-in copies and JSON. Separately, `independent_replay.py` uses a literal tree independence-polynomial recursion and direct polynomial products. It independently matches factored parent and deletion polynomials on profiles `(0,0,40)` and `(1,1,30)` and on the retained unguarded control `(38,0,1)`. No Lean build or source edit was made.

## Dispositions

**Individual shifted comparison — retain OPEN.** The target is exactly `A_v[k+1] C[k-1] <= A_v[k] C[k]` for every original-leaf deletion (including endpoint `A0`) and every `1<=k`, `2k<=N+2`, for all nonempty profiles with original arities in `{2,3,4}`. The packet diagnostics and my separate exact checks show no guarded failure, but they do not prove the universal statement. The individual claim implies the tip-deck claim by multiplying each tip inequality by the positive `r_i` and summing; it is stronger because it also controls each tip separately and the endpoint.

**Weighted tip-deck comparison — retain OPEN.** With `W=sum_i r_i A_i` and the original branch multiplicities, the same guarded inequality remains unproved. The exact checks are useful controls only. The known `(38,0,1)`, `n=122`, `x=41`, `k=77` failure has signed margin `A[77]C[77]-A[78]C[76]=-49,239,834,336`; it is a literal-tree failure of the unguarded relation but has `2k=154>N+2=82` and `3k=231>=2alpha+1=165`. It is neither a guarded failure nor an actual-eligible row.

The copied bounded weighted audit reports 74 selected profiles and 178 actual-eligible lower-half rows with no failure. I reran it; its generated record agrees. This is bounded evidence, not independent validation of every producer implementation detail or a universal theorem. My own exact replay checks guarded ranks `k=1`, `floor((N+2)/4)`, and `floor((N+2)/2)` for both examples, including interior and boundary values; all endpoint, individual-tip, and weighted signed margins are nonnegative. At actual eligible ranks, the independent literal-tree recursion checks `p=80,81` for `(0,0,40)` (with `x=78`) and `p=63` for `(1,1,30)` (with `x=61`), including all three eligibility guards, strict flags, and the literal deletion/factored-polynomial identity. These examples do not establish the universal guarded claims.

**Weighted comparison conditionally implies tip selection, selected MASS, and payment — retain as an informal conditional proof.** Let `p` be an actual eligible lower-half rank, `j=p-2`, `delta=q-j`, and `D_j=binom(N,j+1)-binom(N,j)`. Keep the actual least strict descent `x` of `P`, including its terminal zero-extended difference, and the strict current-`p` selectors. Actual eligibility gives `p>=x+2` and `2p<=alpha=N+2`, hence the registered shift guard at `k=p`; it also gives `1<=p`.

The accepted first-descent ratio lemma and log-concavity of positive `C` give `0<C[p]<C[p-1]` because `p-1>=x+1`. Also `W[p]>0` in this domain. Substituting these values into the proposed weighted inequality gives

`W[p+1] C[p-1] <= W[p] C[p] < W[p] C[p-1]`,

so division by the positive `C[p-1]` preserves the inequalities and yields `W[p+1]<W[p]`. Since `W=sum_i r_i A_i` and every `r_i>0`, `Delta_p W=sum_i r_i Delta_p A_i<0` forces at least one strict tip selector `e_i=1`.

Put `R=sum_i r_i e_i`; then `R>=2`, and the endpoint selector contributes at most one tag, so `b=R+e0<=R+1<=3R/2`. The accepted branchwise bound `2T_i[j]>=3 delta D_j` gives `A=sum_i r_i e_i T_i[j]>=3R delta D_j/2>=b delta D_j`, preserving the original multiplicities. Here `delta>0` and `D_j>0`: the rank guard implies `j<N/2`, so the binomial sequence is strictly increasing from `j` to `j+1`.

For the exact-ratio payment, `t=C[j+1]/C[j]` satisfies `0<t<1` by positivity, log-concavity and `j>=x`. Its multiplier is positive, and

`delta(1-t+t/delta)=delta(1-t)+t=1+(delta-1)(1-t)>=1`.

Thus `A>=b delta D_j` implies `(1-t+t/delta)A>=bD_j`. All multipliers/divisors used here are positive, so order is preserved; no inequality is multiplied by a negative factor. (If one were, its direction would reverse.) This proves only the conditional local composition; it does not prove the weighted inequality or formally award any dependency.

## Limits and evidence paths

The exact selector predicate, all-`m` selected MASS/payment, and aggregate retain their existing computer-assisted/nonformal grades. This review neither reopens them nor supplies the census-free or governed-formal proof obligations.

Independent replay: `cycles/cycle-4/C4-CU-F2/independent_replay.py` and `cycles/cycle-4/C4-CU-F2/independent_replay.json`. Copied producer replays and bounded evidence: `cycles/cycle-4/C4-CU-F2/FUTURE-selector-LR-probe-shifted.py`, `FUTURE-selector-LR-controls-shifted.py`, `FUTURE-shifted-ratio-literal-witness.py`, `weighted_guarded_audit.py`, `literal_weighted_boundary_audit.py`, and their same-basename JSON files.
