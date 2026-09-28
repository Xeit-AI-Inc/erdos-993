# C3-CU-F3 — independent composition critique

## Dispositions

The implication chain in `C3-F3-COMPOSITION` is correct **conditionally**. Its boundary algebra, selector dependency, and exact-ratio step have no gap that I found. This review does not establish the pending prefix scan, m=70..119 scalar certificate, or m>=120 coefficient argument; consequently it supplies no all-m MASS or payment proof and no counterexample. The two registered predicates remain open at this evidence grade.

The partition is exhaustive: direct rows for 1<=m<=69, the relaxed branch coefficient route for 70<=m<=119, and the local branch route for m>=120. At m>=70, the accepted full-selection composition covers the same actual lower-half rows: census 1..80, lower-half base 42..265, and analytic tail 266 onward. The latter selector clauses precede their source's aggregate-sign result, so aggregate sign is not a premise. The scope still requires the actual least strict parent descent, all three eligibility guards, strict selectors at current p, and original endpoint/tip multiplicities.

For m>=70, N>=2m>=140. For each r in {2,3,4}, N>=10r-12. The accepted first-descent rank bound 2N<=5x and j=p-2>=x give 5j>2N-1. For 0<=s<=r-1,

`3(j-s) > 3(2N-1)/5 - 3(r-1) >= N-r`,

where the last inequality is equivalent to N>=10r-12. Also j<=M=N-r follows from 2j<=N-2 and N>=2r-2. These establish the stated Jensen-range shift bridge; they do not validate the finite scalar values or local coefficient estimate.

If full selection holds, b=N+1 and A=sum_i r_i T_i[j]. A branchwise bound `2 T_i[j]>=3 delta D_j` gives `A>=(3/2)N delta D_j >= (N+1)delta D_j=b delta D_j`, since N>=2. More generally, full selection is stronger than needed for this step: if at least one branch is selected, w=sum_i r_i e_i>=2, and `A>=(3/2)w delta D_j >= (w+1)delta D_j >= b delta D_j`, since b=w+e0<=w+1. With no branch selected, the empty selection pays trivially if e0=0; endpoint-only selection remains the sole obstruction. This is an implication only, conditional on the branchwise bound.

For the MASS-to-payment implication, write t=C[j+1]/C[j] and kappa=1-t+t/delta. The contract's actual first descent and guards give 0<t<1, C[j]>0, D_j>0 and delta>1. Thus

`kappa - 1/delta = (1-t)(1-1/delta)>0`.

Since b,D_j>=0, `A>=b delta D_j` implies `kappa A>=bD_j`, exactly the contract's cross-multiplied payment after multiplication by delta*C[j]. This does not reverse the implication: exact-ratio payment need not imply MASS.

## Scope and outstanding evidence

The producer arithmetic script, copied to `cycles/cycle-3/C3-CU-F3/producer_composition_check.py` before execution, passes. It checks selected algebra and representative junctions/guards; it is not a universal proof or independent replay of the producer instruments. I did not execute the prefix, scalar, or local producer scripts. The current registry and neutral handoff identify the all-m MASS and exact-ratio payment as OPEN; the accepted selector composition and m>=238 MASS do not close either all-m identity. The m172 empty-plus-singleton truncation refutation concerns a different, shortened cofactor and is not a counterexample to this full-cofactor composition.

Byte checks: all 86 common-dispatch entries, all 3 entries in each of `C3-TRANSPORT-CLARIFICATION.json` and `C3-CRITIQUE-TRANSPORT.json`, and all 7 entries in the C3-F3 packet manifest matched SHA-256. Both transport clarification manifests match their sealed clarification and runner bytes. I read the v3/v4 CLI runners and stage queues at those matched bytes; the CLI prompt includes the shared-source clarification, and the v4 runner adds the critique-source reconciliation for critique stages. No Lean build or formal award was performed.

## Reproduction

From this scratch directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 producer_composition_check.py
```

The script reports `composition implications and interval/guard checks passed`. Its finite assertions are bounded checks only; the general implications above are proved algebraically in this report.
