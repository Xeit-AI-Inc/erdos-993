# C5-CT-U4 critique (orientation T)

## Reviewed claim

**C5-U4-LEMMA-1 — retained.** The statement is correct as a rank-local identity and sign alternative for every finite ordinary tree and every original leaf, including when several leaves share a support.

Partitioning independent sets by whether they contain the leaf (v) gives
(I_T(z)=I_{T-v}(z)+zI_{T-{v,s}}(z)). With zero extension, the coefficient of rank (j) in the second term is (i_{j-1}(T-{v,s})). Taking the adjacent coefficient difference proves
[
Delta_j(T)=Delta_j(T-v)+Delta_{j-1}(T-{v,s})
]
for every integer (j). At (j=x(T)), the left side is strictly negative, so at least one of the two integer summands is strictly negative. This is a per-leaf statement; it does not merge leaves with a common support.

The K₁,₃ calculation is correct: (i(T)=(1,4,3,1)), hence the zero-extended differences at ranks 0 through 3 are ((3,-1,-2,-1)) and (x=1). Deleting a leaf gives (K_{1,2}) with vector ((1,3,1)), so (Delta_3=0). For (p=3), (x+2le p) holds, but the strict lower-region condition fails: (3p=9
ot<7=2alpha+1). Thus it only rules out the unguarded implication and does not refute the assigned eligible selector or aggregate.

## Scope and proof-gap audit

The proof establishes no relation between the rank-(x) alternative and (Delta_p(T-v)) for (pge x+2). In particular, it neither proves nor refutes a transfer under both primary eligibility guards, supplies no eligible proper-selector example, and gives no sign information for the complete selected sum. No graph-domain or zero-extension defect was found in the deletion identity.

The cited Bencs propositions are expressly not used as premises for this claim in the route report, so they provide no bridge to the general-tree selector. I did not independently audit that bibliographic description; it is immaterial to the retained algebraic claim.

## Evidence and limitations

Independent algebra and example arithmetic are recorded in [EVIDENCE.json](cycles/cycle-5/C5-CT-U4/EVIDENCE.json). No executable replay was supplied or needed for this symbolic claim, and no source files were modified. The result remains a narrow lemma; the primary aggregate stays unresolved by this route.

Limitations: no cross-rank selector transfer in the eligible region; no eligible counterexample or proof of the aggregate; no literature theorem was used or independently verified.

