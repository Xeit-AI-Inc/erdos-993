# C4-CF-T4 independent critique

**Stage:** critique. **Orientation:** F. **Authority:** proposed worker only.

I audited both claims in the sealed C4-T4 route under the exact ordinary-tree lower-region scope, including the fixed strict favorable-leaf selector and separate tags for every selected original leaf. All three case-file hashes and all 179 common-source hashes matched their packet pins. The sealed route files were copied verbatim into the worker evidence directory before reading.

## Dispositions

- **C4-T4-RELATIVE-CHAIN-IDENTITY — retained.** For each selected leaf `v`, independent sets of `H_v` meeting `W_v` are precisely the relative faces outside `Ind(R_v)`, since `R_v=H_v-W_v`. Hence `dim K_j=sum_v(i_j(H_v)-i_j(R_v))`. Expanding `Delta_(p-1)(H_v)-Delta_(p-1)(R_v)` gives `q_v(p)-q_v(p-1)`. Summing over the unchanged selector gives the stated identity. It also handles empty `F` and leaves sharing supports, since the direct sum is tagged by leaf.
- **C4-T4-CROSS-TAG-INJECTIVITY-BRIDGE — retained_narrowed.** The specified deletion-and-tag rule is a well-defined rational linear map `K_p -> K_(p-1)` and, if injective, would imply the aggregate inequality. The universal injectivity assertion is unsupported: no full-rank argument, matching certificate, or counterexample is provided. Noninjectivity alone would not refute the aggregate. The map’s rank property remains open; this audit does not claim it is false.

The identity is useful as an exact reformulation. The tag-changing operator is a plausible sufficient mechanism, but its unproved rank condition leaves the lower-region aggregate unresolved. No finite replay or literature theorem application was needed. Details and source copies are in `evidence/independent-check.md` and `evidence/source-copies/`.
