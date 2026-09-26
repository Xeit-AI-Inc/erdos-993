# C5-CU-T5 critique of C5-T5

## Reviewed claim

`C5-T5-MATCHING-UP-RANK` is **retained** at its stated scope. The unsigned inclusion-rank assertion for a disjoint union of edges has a complete elementary proof. The tag-preserving direct-sum and marked-column consequences follow from that injectivity. This does not establish the registered lower-region aggregate, nor an unsigned capacity statement after tags are merged.

## Algebra audit

Let `J_h` be the disjoint union of `h` edges and `Omega_r` its independent `r`-sets. In `D_(r+1) U_r`, the diagonal entry at `A` is the number of vertices addable to `A`, namely `2(h-r)`. In `U_(r-1) D_r`, the diagonal entry is `r`, one return for each vertex of `A`.

For distinct `A,B` in `Omega_r`, an off-diagonal entry can be nonzero only when the sets differ by replacing one vertex `y` by one vertex `z`. If `y,z` lie in different edges, both are addable in the relevant intermediate state, and the two products each contribute one, so they cancel in the difference. If `y,z` are the two endpoints of the same edge, `z` is not addable to `A`: only the down-then-up product contributes, leaving `-1`. These are exactly the endpoint-swap edges. Therefore

`D_(r+1) U_r - U_(r-1) D_r = (2h-3r) I - R_r`.

For `r=0`, the down/up term and `R_0` are zero, and the identity gives `D_1 U_0=2h I` as required. For general `r`, fixing the `r` occupied edges gives a component of the swap graph isomorphic to an `r`-cube; hence `R_r` is symmetric and `r`-regular. The elementary spectral bound `||R_r|| <= r` gives

`||U_r f||^2 - ||D_r f||^2 >= (2h-4r)||f||^2`.

When integer `r` satisfies `0 <= r < h/2`, the coefficient is strictly positive. Thus `U_r f` cannot vanish for nonzero `f`, proving injectivity. Since there are `binom(h,r) 2^r` independent `r`-sets, this is the claimed rank.

For finitely many distinct tags, an injective block-diagonal direct sum remains injective when every block satisfies its own rank condition. Restricting an injective linear map to the span of a subset of its basis columns also preserves injectivity. If those columns meet a fixed marked vertex set, every image superset still meets that set. This validates the report's marked-column statement, interpreting `W_v` as a subset of vertices of `H_v`.

## Exact bounded replay

`REPLAY.py` independently constructs the incidence matrices and swap adjacency matrices for `J_h`, `1 <= h <= 5`, and `0 <= r < h`. It checks the commutator entrywise and computes exact rational matrix ranks. All 15 `(h,r)` identities passed; all 9 cases with `r < h/2` had rank `binom(h,r)2^r`. These finite checks corroborate the algebra and do not extend its scope.

## Scope, controls, and usefulness

The report correctly makes no claim that any selected `H_v=T-{v,s_v}` is a matching, or that `p-1 < h_v/2` follows from the primary eligibility conditions. The strict original-leaf selector, terminal first descent, same-support tags, and complete aggregate are not used by this auxiliary statement, so there is no selector or primary arithmetic to validate here. Its explicit limitations are material: preserving tags gives separate block ranks, not a matching/capacity theorem after tag blocks are identified; it also does not compare single-marked and multiply-marked extensions or prove the needed global `D+C` budget. The C5 handoff's T22 warning concerns failure of an unsigned blockwise injection on that different instance and does not contradict this restricted matching-graph lemma.

**Disposition:** retained. The claim is proved within its stated matching-graph and rank window, but its connection to the primary tree problem remains an open bridge.
