# C4-U6 — first-shell bridge audit and scale-up

## Scope and inputs

This search seat was allocated the U6 lens: audit the frozen first-shell formal bridge, then assess its scale-up. The case packet contains no case-specific source files or required claim IDs. I read the common first-shell contract, informal audit, frozen `BASE.lean`, its preflight receipt, and the two pinned proof-route notes. The common packet's 179 listed source hashes matched. No live producer output was consulted and no Lean build was run.

## Canonical-definition bridge

For an original leaf `v`, let `s` be its unique original neighbor. In the frozen interface, `support T v` is choice-defined off leaves, but `support_spec` recovers `T.Adj v (support T v)` and uniqueness under the leaf hypothesis. Thus on a leaf the finite deletion sets are exactly

- `H = {v,s}`;
- `R = {s} ∪ neighborFinset(s) = N_T[s]`;
- `H ⊆ R`, with `|H|=2`;
- `R \ H = N_T(s) \ {v}`.

`indepSetsAvoiding` counts independent subsets of the original vertex type avoiding a deletion set, so it is the induced-deletion coefficient without a vertex-type coercion. `forwardDifferenceDel` embeds both natural counts into `Int` before subtraction. `vertexDeletionForwardDifference` uses `erase v`, and so is the exact strict selector `Delta_p(T-v)<0`; `leafSet` then filters original degree-one vertices. `aggregate` sums over that filtered set, retaining distinct leaves even when supports coincide. `crossingIndex` uses `Nat.find` on the strict negative difference of the ordinary independence counts; its finite existence witness is at the independence number, agreeing with the first strict descent of the zero-extended sequence.

The most reusable exact bridge is `leaf_count_split`: the independent `j`-sets avoiding `H` partition into those meeting `R \ H` and those avoiding `R`. If `q_j` denotes the first part's cardinality, then

`i_j(T-H) - i_j(T-R) = q_j`,

and consequently the target summand at `k=p-1` is exactly `q_(k+1)-q_k` in integers. This is an interface identity, not a sign result. The frozen helpers `tagged_count_split` and `tagged_marks_sdiff` make the partition's domains explicit and preserve the marks outside the deleted set.

## What the first-shell argument establishes, and its boundary

The frozen informal audit supplies a mathematical proof for the registered first-shell scope: `|V(T)|=2p+2`, `p>=3`, and `x(T)+2<=p`. Its cover-three fiber argument establishes `tau(T)>=4` from positivity of every earlier difference through `p-2`. Deleting a leaf and its support leaves a graph on `2p=2(p-1)+2` vertices with cover number at least three and a nonisolated mark. The audited marked-shadow argument decomposes by a nonisolated mark; its sharp first-wide input is used at this exact order, then the identity above gives a nonpositive term for each original leaf. Summing over the fixed favorable selector gives the shell aggregate. The informal audit says the strict alpha guard is not used by that proof.

That argument is not a proof for the primary target as admitted in C4. The target does not impose `|V(T)|=2p+2`. For a general eligible tree the retained graph has `|V(T)|-2` vertices, while the audited first-wide step is calibrated to `2(p-1)+2=2p` vertices. The strict alpha condition constrains independence number, not this exact order, and the early-descent cover argument alone does not repair the order mismatch. A global compensation inequality across selected leaf tags, or a new marked-shadow theorem with the larger retained-order excess controlled by the strict descent, remains necessary. I found no such bridge in the authorized U6 materials. This is a precise scale-up gap, not evidence that the primary assertion fails.

## Formal integration status and limitations

The frozen base has useful definitions and supporting lemmas, including the exact leaf count split and the sharp first-wide graph lemma. The contract pins the expected terminal statement and requires informal audit, kernel verification, and fidelity audit. The preflight receipt records a successful prior build with linter warnings; it is not a kernel/fidelity receipt and does not certify the terminal declaration as an award. The informal audit itself expressly leaves compilation of the new assembly, its imports/axioms, and statement fidelity to separate gates. I did not inspect any live producer files, run Lean, or treat the preflight as proof of the proposed terminal. No source here resolves the order mismatch for the general primary target.

Proposed result: retain the definition-level bridge and the first-shell mathematical scope as useful interfaces; leave the unrestricted lower-region aggregate open. No verdict is self-awarded.
