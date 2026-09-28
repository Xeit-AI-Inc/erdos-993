# C3-CT-F2 critique: bounded prefix claim

## Disposition

I retain `C3-F2-SMALL-PREFIX-PRIMARY-AND-MASS-BOUNDED` as exact bounded evidence on its stated scope, not as an all-parameter proof. The registry keeps the all-m exact-ratio payment OPEN and the stronger selected MASS claim OPEN. This prefix scan does not change either status.

I independently enumerated all count triples `(c2,c3,c4)` with `1 <= c2+c3+c4 <= 69`. The evaluator in `independent/critic_scan.py` builds the contract polynomials by exact integer convolution, obtains each branch cofactor by decrementing that arity count, computes the least strict parent descent through the terminal degree, and scans every natural `p` satisfying all three guards. It computes current-`p` strict flags, counts each selected tip with multiplicity `r_i`, and evaluates both signed margins without division. Coefficients use zero extension. Assertions check `delta>0` and `D_j>0` on every scanned row.

Replay:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 independent/critic_scan.py > independent/critic_scan_result.json
```

The independent run reports 59,639 profiles and 68,129 eligible rows; no negative primary or MASS margins; and zero rows with endpoint-only or partial selection. Thus every tag selector is true in this finite scope, a useful bounded consequence but not the structural selector theorem for all `m`.

The minimum exact primary target margin is

`2,348,398,634,845,436,222,199,118,708,110,999,411,248,850`.

It occurs at `(c2,c3,c4)=(0,22,0)`: `m=22`, `N=66`, tree order `n=3+m+N=91`, `alpha=68`, `q=67`, first strict descent `x=32`, `p=34`, `j=32`, `delta=35`. The guards are `x+2=p=34`, `3p=102<137=2alpha+1`, and `2p=68=alpha`. The endpoint and all 22 arity-3 branches are selected, so `b=67`; `A=6,562,597,338,849,618,725,736`, `D_j=212,336,130,412,243,110`, `C[j]=297,795,845,939,942,115,337`, and `C[j+1]=295,365,112,846,734,182,630`. The minimum MASS margin is `6,064,669,113,032,908,632,786`, at the same row. These match the source worker's exact extrema.

## Instrument and source checks

I reviewed the assigned worker's evaluator and the shared prefix protocol/controller instrument as evidence, then copied each runnable producer script into this scratch directory before executing it. The worker evaluator uses cached products of `B_r` factors and direct `T_i` polynomials; the controller script uses cofactor division and `GF_r` convolutions. Both report the same profile and eligible-row counts, and the controller output reproduces its recorded row-stream SHA-256 `c701b754e26e24e0ceed3af48565db90ba79db3707bf0cd99526f8c388de94f5`. The independent direct-convolution evaluator agrees with their counts and the worker's extrema. No claim depends on the controller stream digest as a proof of coverage.

The assigned four-file packet payloads match their packet SHA-256 declarations. The common-dispatch hashes checked for the contract, handoff, status clarification, allocation, registry snapshot, and shared prefix protocol/check script/check data also match. Both transport manifests match the clarification/reconciliation documents and their v3/v4 runner bytes. The shared-source clarification authorizes these neutral common inputs; the critique-source reconciliation additionally requires the instrument review performed here. The worker report's earlier statement that no producer sources were allowed describes its source-access limitation at that time; it is not a defect in the bounded computation, and this review closes the missing independent instrument comparison.

## Limits and repair

There is no mathematical counterexample on the assigned finite domain. No repair to the bounded claim is needed. The exact witness/scope format is complete for the extremal row, including strict flags, multiplicities and signed margins. This computation does not establish the unbounded selector result or either universal payment predicate, and it is not formal verification. The prior all-m refutations of unrelated singleton-truncation shortcuts are outside the mechanism used here: this scan evaluates the full profile polynomials and original tags, so extending the prefix is neither needed nor claimed.
