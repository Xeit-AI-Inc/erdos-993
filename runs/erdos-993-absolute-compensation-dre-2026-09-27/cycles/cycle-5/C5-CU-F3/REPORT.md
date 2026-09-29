# C5-CU-F3 critique report

## Integrity and scope

I read the shared protocol and governance inputs, the Cycle 5 allocation and neutral handoff, the assigned packet, the structural reductions and main-mark margin proof, and the common C4 Jensen contract, statement, and informal proof audit. I checked SHA-256 for all 237 members of `manifests/C5-COMMON-DISPATCH.json` and all three additional packet sources: no missing files or digest mismatches. Replay the check with `PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-5/C5-CU-F3/evidence/input_integrity_check.py`; its receipt is `cycles/cycle-5/C5-CU-F3/evidence/input_integrity.json`.

The packet requires coverage of `C5-F3-COEFFICIENT-FLOOR-DOES-NOT-IMPLY-SHIFTED-MINOR`. The source worker's `RETURN.json` says no required covered IDs and omits `covered_claim_ids`; that conflicts with the packet. This is a return-schema/provenance defect, not a mathematical defect. This critic return includes the required ID.

## Disposition: retain the exact generic obstruction

Take one block with size \(r=M=2\), and coefficients \(f(0),f(1),f(2)=(1,2,100)\). In powers of \(z\),
\[
H=(1,2,100),\qquad C=(1,2,1),
\]
where \(C=(1+z)^2\). The floor checks are respectively \(1\ge1\), \(2\ge2\), and \(100\ge1\). Thus the exact hypotheses of the finite-block coefficient/Jensen theorem hold; in particular \(k\le M\) at each rank. Its normalized coefficient identity is the actual uniform labeled-subset average. Directly, for \(k=0,1,2\), the actual block count is respectively \(0,1,2\), and the theorem's exponent values are \(y=(0,0,198/101)\).

At \(k=1\), both guards hold: \(1\le k\) and \(2k=2\le M+2=4\). The shifted minor is
\[
H[1]C[1]-H[2]C[0]=2\cdot2-100\cdot1=-96.
\]
The normalizing factor \(C[0]C[1]=2\) is positive, so division preserves the sign:
\[
\frac{H[1]}{C[0]}-\frac{H[2]}{C[1]}=-48<0.
\]
Therefore the generic theorem's coefficient floor/Jensen conclusion alone does not imply the shifted-minor sign. No factor with negative sign is used in this division. Exact replay is available in `cycles/cycle-5/C5-CU-F3/evidence/independent_coefficient_floor_audit.py`; the copied producer script also replays the claimed values.

The zero-extended guarded boundary minors are positive: at \(k=0\) the expression is \(H[0]C[0]=1\), and at \(k=2\), \(H[2]C[2]-H[3]C[1]=100\) because \(H[3]=0\). Thus the exact failure is at the interior guarded rank, not a support-endpoint artifact.

This is a valid counterexample to the generic implication. It is not a path-star polynomial, marked deletion, first-descent or selector instance. It does not refute the registered guarded individual/weighted path-star comparisons, exact-ratio payment, selected MASS, or primary aggregate.

## Application boundary

For an actual path-star, the proof would need to use its extra structure, including the common denominator \(C=GQ\), the marked factor \(GB_{r_i-1}H_i\), and the shared additive term \(E=zL^N\) in \(A_i\). The exact identity \(M_k(A_i)=M_k(U_i)+M_k(E)\) makes clear why a generic floor on unmarked block coefficients supplies no compensation for a negative \(E\)-minor. The endpoint \(A_0\) also needs its own argument. Any bridge to payment must retain the actual least strict descent \(x\), all eligibility guards, current-\(p\) strict selectors, and original branch multiplicities \(r_i\). This critique establishes none of those graph-specific comparisons.

The source report's narrow mathematical conclusion is retained at bounded exact-arithmetic grade. The all-parameter generic implication is refuted by the displayed instance; the path-star targets remain governed by their separate existing scopes and evidence. No Lean build or broad census was performed.

## Replay

From the admitted worker directory:

- `PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-5/C5-CU-F3/evidence/producer_coefficient_floor_obstruction.py`
- `PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-5/C5-CU-F3/evidence/independent_coefficient_floor_audit.py`

Both print the exact exponent values and shifted minor; the independent script also checks the actual subset-average identity and the positive normalization.
