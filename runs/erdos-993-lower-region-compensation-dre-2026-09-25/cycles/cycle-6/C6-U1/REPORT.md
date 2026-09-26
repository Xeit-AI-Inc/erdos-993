# C6-U1 — Lean contract and dependency decomposition for the retained T_m theorem

## Result and scope

This route provides a proposed Lean theorem contract and declaration-level dependency graph for the already retained homogeneous-family result, with the Python finite base and current kernel gaps made explicit. It proves no new theorem and performs no Lean run.

The exact target is `E993-ORDINARY-TM-LOWER-REGION-AGGREGATE`: for each `m ≥ 1`, let `T_m` be the ordinary tree with path `a-b-r` and `m` claw branches attached at `r`, each branch having three private leaves. For every natural `p` with `x(T_m)+2 ≤ p` and `3p < 2α(T_m)+1`, the complete fixed-selector sum over original favorable leaves satisfies `S(T_m,p) ≤ 0`. Both leaf orbits must be shown favorable before replacing the selected sum by the all-leaf polynomial `R`; separate leaves sharing a support remain separate summands. This is the restricted T_m theorem, not the arbitrary ordinary-tree claim and not a Lean award.

The current registration calls the T_m family result VERIFIED at grade `computer_assisted_proof_adjudicated_no_formal_award`. Its finite base is exact Python arithmetic, not kernel-checked. The common handoff and current identity record retain that scope and expressly state that there is no family Lean certificate.

## Proposed declaration graph

A clean formal development can be split into the following declarations/packages. These are proposed names and dependencies, not declarations already present in a Lean project.

1. **`tmGraph m`, `tmGraph_isTree`, `tmGraph_order`, `tmGraph_alpha`** — Build the finite graph on three path vertices plus `m` disjoint four-vertex arm blocks (one center and three private leaves). Prove simplicity, connectedness/acyclicity, order `4m+3`, and independence number `3m+2`. Identify the original leaf set as the terminal path leaf plus all `3m` private leaves, with their original supports and two deletion orbits.
2. **`tmCounts` / `tmPolynomialIdentities`** — Prove the finite independent-set counts equal the coefficients of
   `P=(1+2z)B^m+zL^(3m+1)`,
   `A0=LB^m+zL^(3m)`,
   `Astar=(1+2z)(1+3z+z^2)B^(m-1)+zL^(3m)`, and
   `Q=zR`, where `L=1+z`, `B=L^3+z`, and `R=3m(2+5z+2z^2)B^(m-1)+(3m+1)L^(3m)`.
   In particular prove that `Q` is the sum of all `3m+1` original-leaf tagged differences, with multiplier `3m` on the private-leaf orbit. This is the key graph-to-polynomial fidelity theorem.
3. **`tmDescentLowerBound`** — Establish `x(T_m) ≥ m+1` for `m≥2`. The C6 direct-first-descent lead derives `Δ_j(P)>0` for `0≤j≤m` directly from `P=(1+2z)B^m+zL^(3m+1)`, so the T_m proof need not depend on R27 for this step. Separately verify `m=1` has no eligible `p`. (An alternative is to import the exact pinned R27 theorem and prove its graph/index bridge; this is unnecessary if the direct lead is formalized.)
4. **`finiteOrderULC`, `ulcFactors`, `ulcConvolution`, `lcMargin`** — Define finite-order ULC with nonnegative coefficients and consecutive interval support. Prove the factor checks for `L`, `1+2z`, `B` at order 4, `1+3z+z²`, and `2+5z+2z²` at order 2; then prove the exact finite-order convolution closure needed by each factored main term. Derive the quantitative ordinary LC margin `a_j²-a_(j-1)a_(j+1) ≥ a_j²/(j+1)` and the factorwise derivative/neighbor-ratio lemmas.
5. **`mixedMinorConvolution`, `mixedMinorBounds`** — Prove the antisymmetrized coefficient double-sum identity directly from polynomial coefficient multiplication; show its LC bracket is nonnegative with correct zero extension and rank boundaries. Instantiate the three coefficient pairs for `A0`, `Astar`, and `R`, then formalize perturbation bounds and the strict rational cutoff inequalities for `m≥1000`.
6. **`centralMarginsFiniteBase`** — Prove a recurrence/table specification equals coefficients of the three auxiliary polynomials and kernel-check all central LC and mixed-minor inequalities for `3≤m≤999`, `m≤j≤2m+2`. The exact proposed input census contains 1,507,464 strict LC checks and 1,507,464 strict mixed-minor checks, zero failures. A proof of the recurrence and the bounded arithmetic is required; Python output or matching digests cannot discharge this declaration.
7. **`smallMNoEligibleRank`** — For `m=1,2`, use `α=5,8` and exact `x=2,4`; the lower-region guards are inconsistent, so these cases have empty selector.
8. **`tmSelectorPropagation`** — From the strict descent at `x`, the central mixed minors, positive denominators and strict central LC margins, prove both deletion-orbit differences are strictly negative at every eligible `p`; prove the `R` difference has the required strict sign at `p-2`. Check `x≤p-2` and `p≤2m+1`, and retain endpoint ranks through `2m+2`.
9. **`tmAggregate_nonpos`** — Combine the graph/count identities and propagation: all original leaves are favorable, the full tagged sum is `S=R_(p-1)-R_(p-2)<0`. State the exact natural-rank guards in the contract so `p-1` and `p-2` are meaningful and agree with the literal selector/deletion definitions.

Dependency shape: (1)+(2) supply semantic fidelity; (3)+(eligible guards) supply the central-rank range; (4)+(5)+(6) supply the central margins; (7) closes the two empty small cases; (8)+(9) produce the exact family theorem. The large-`m` analytic branch of (4)–(5) is independent of the finite-base checker (6), and both are required for an all-`m` kernel theorem.

## Exact finite base and certification boundary

The independently audited base is `m=3..999`, with every integer rank `j=m..2m+2`, for all three auxiliary sequences `A0`, `Astar`, and `R`. The count is `3 * Σ_(m=3)^999 (m+3) = 1,507,464` margins of each kind. The least observed margins were 1210 (LC) and 1243 (mixed), each at `(m,Astar,j)=(3,Astar,8)`. The coefficient recurrence is derived from `B(B^m)'=mB'B^m`; independent replay reported exact agreement with the producer margin digests. This is strong exact arithmetic evidence, but the code, outputs, and hashes remain outside the Lean kernel.

The finite base need not separately certify all 276,938 eligible rows if the central margins, graph identities, direct descent lower bound and propagation are proved. `m=1,2` can be discharged from `x=2,4` and `α=5,8` without a row census. A kernel checker can use proved natural-number coefficient recurrences and chunked bounded arithmetic; exact division in a quotient recurrence must be proved or avoided. Feasibility of checking the full base in the intended verifier has not been measured here.

## Exact blockers to a family kernel certificate

1. No theorem contract/source binds the retained informal family proof to the literal graph definitions and selector. The C5 frozen definitions are reusable specifications, but the T_m graph, count identities, and index equivalences still need proofs.
2. The quantitative finite-order ULC convolution step has no pinned Lean declaration in the reviewed readiness evidence. It must be proved in Lean (including hypotheses and interval support) or replaced by an equally strong formal argument; citing Gurvits/Liggett or assuming the lemma leaves a non-kernel premise.
3. The 3–999 base is not a kernel certificate. A proved recurrence-to-polynomial bridge and checker/certificate acceptable to the kernel are missing. The existing Python replay does not resolve this.
4. The coefficient-level antisymmetrized mixed-minor proof, zero-extension boundaries, derivative/ratio inequalities, falling-factorial lower bound, perturbation bounds, and four exact strict rational cutoff comparisons are informal candidate arguments, not bound Lean declarations.
5. The final selector/index/rank propagation and tagged graph-to-polynomial identity have not been formalized for this family. In particular the endpoint ranges and every original leaf tag must be preserved.
6. After proof code exists, the full contract, import/dependency binding, pinned build, axiom probe, kernel receipt, and independent semantic-fidelity audit remain required. No such family receipt exists.

The two main feasibility gates identified by the readiness audit are (2) and (3), but they are not the only remaining declarations. These are formalization gaps, not mathematical counterexamples. I reviewed the relevant pinned source map, T_m candidates, current claim identity, frozen C5 readiness materials, and R27 source/receipt. Thus the gaps above are obligations not yet discharged in the reviewed artifacts; I do not claim that equivalent lemmas are unavailable everywhere.

## Scope and limitations

This route supplies a formalization plan and a blocker inventory only. It does not independently rerun or reconstruct the 999-case computation, compile Lean, verify an imported theorem in a fresh binding, or prove the T_m family theorem. The arbitrary-tree lower-region aggregate remains outside this route's scope. All source hashes in the common packet manifest matched; the case packet lists no additional worker source files.
