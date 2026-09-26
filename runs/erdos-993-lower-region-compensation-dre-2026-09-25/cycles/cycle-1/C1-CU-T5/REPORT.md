# C1-CU-T5 critique of C1-T5 (opposing orientation U)

## Dispositions

- **C1-T5-1 — retained.** The rooted support-fibre formula is an exact coefficient identity for finite ordinary trees, with each original leaf counted separately. The proof conditions on inclusion of the support and uses disjoint rooted branches. It also works without the global eligibility guards. See [the evidence audit](evidence/critique.md).
- **E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE — retained_narrowed.** Retain only the route-limited statement that C1-T5 established neither a proof nor an eligible counterexample. The report correctly leaves the target unresolved on its evidence; it does not itself establish a broader mathematical or controller status.

## Mathematical review

The recurrence and fibre formula are valid, including stars and the two-vertex tree. The `m_s` factor is necessary because multiple original leaves with a common support are distinct summands. The selector remains the strict `Delta_p(T-v)<0` test, and the summand rank remains `p-1`.

The formula does not provide the missing cross-fibre compensation bound. The pinned T22 and T60 standing rows pass the eligibility arithmetic and the support-fibre sum checks; both contain a positive selected term alongside a negative complete aggregate. This rules out a proof by pointwise nonpositivity, but it does not weaken or decide the full aggregate assertion.

The controls were checked from recorded rows only. No source script was run, no tree encoding was independently reconstructed, and no new finite search or literature result is claimed. Exact derivations and replay arithmetic are in `evidence/critique.md`.

## Limitations

- No proof or eligible refutation of the primary aggregate is established here.
- Control coefficient vectors and graph encodings were not independently recomputed.
- The transfer state is an exact accounting identity; the global sign remains an open proof obligation on the reviewed evidence.
