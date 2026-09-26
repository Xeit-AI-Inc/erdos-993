# C3-LA1-PRODUCER-CONTINUATION-A1 — complete compiled proposal

**Controller proposal only.** The exact frozen two-conjunct terminal is present in `Candidate.lean` and the controller file bridge compiled that complete file with exit code **0** in request `c3q020`. This is a draft compilation result, not a registration, governed kernel or axiom award, or independent fidelity verdict.

## Proven in the candidate

The candidate preserves the previous producer's compiled `Candidate.lean` as an exact byte prefix, including the finite-graph definitions and original favorable-leaf selector. This pass adds 15 lemmas and one terminal theorem in `new-fragments/210` through `225`. The resulting file has SHA-256 `d44cbc23035cbba1233c5df3df80758fee7e4a12127bbb3e57dc64d03756fc18`, matching the bridge's compiled source hash. The terminal header matches the frozen contract byte for byte: SHA-256 `4546fe679579b0f8cafc43d01be9c42a35cafd162ebf4a84ab55773aa7a10286`. The second conjunct retains its strict `3 * p < 2 * T.indepNum + 1` guard; the pointwise conjunct has no alpha or favorable-leaf premise.

The new mathematical chain is as follows.

1. `tagged_split_mark` partitions marked independent sets by membership of a chosen mark through an explicit `erase` and `insert` bijection. `induced_count_bridge` identifies ordinary independent subsets of a finset with independent sets of its induced graph. These bridges let `ordinary_bound_firstWide` apply the inherited two-edge first-wide theorem at its exact order.
2. `ordinary_bound_below_odd` derives the ordinary shadow bound for at most `2k+1` vertices from the inherited marked incidence inequality by taking every vertex as marked. `tagged_bound_below_odd_of_adj` handles an odd-size marked family when a chosen mark has a retained neighbor. `tagged_bound_below_odd_no_cover` handles arbitrary marks under the stronger condition that the induced graph has no one-vertex cover: if the chosen mark is isolated, deleting it preserves that cover obstruction, and the exact even residual uses the inherited first-wide theorem.
3. `tagged_bound_firstWide_no_two_cover` proves the needed first-wide marked shadow bound at `|U|=2k+2`. Deleting a nonisolated mark leaves an odd-size graph with no one-vertex cover. Its present-mark residual has at most `2k` vertices; at equality, `no_one_cover_residual_at_equality` proves that a one-vertex residual cover would extend to a forbidden two-vertex cover of `U`.
4. `leaf_nonisolated_mark` uses tree connectivity. If every retained mark were isolated, the original closed neighborhood `R` of the leaf's support would be closed under adjacency. A walk from the support would then put every vertex in `R`, contradicting the inherited retained-edge result. The inherited no-two-cover and retained-order lemmas feed the generic first-wide result into `leaf_marked_shadow_of_shell`.
5. `firstShellPointwiseAndAggregate` applies the inherited exact H/R count identity and aggregate reduction. The complete original-leaf filter and separate summands are preserved. The strict alpha guard is retained in the aggregate statement even though this pointwise route does not consume it.

## Evidence and limits

All **298** files listed in the exact worker brief matched their SHA-256 values; see `SOURCE-HASH-VERIFICATION.json`. `RESULTS.json` records each compile request and the final compiler exit code. The complete candidate contains one occurrence of the terminal declaration and no `sorry`, `admit`, `native_decide`, `unsafe`, or `axiom` token. `PROPOSED-REGISTRATION.json` lists 225 declarations in order, with hashes for the 16 new fragments and their direct dependencies. No source outside this scratch directory was edited.

The controller still needs to inspect the proposal, perform independent registration and assembly, run its governed kernel and axiom checks, and conduct a fresh statement-fidelity review. This worker claims none of those awards.
