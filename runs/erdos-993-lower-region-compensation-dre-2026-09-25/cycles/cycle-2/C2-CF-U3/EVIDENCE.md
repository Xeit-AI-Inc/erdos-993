# Critique evidence

The per-leaf identities and order bounds in this review are derived in `REPORT.md` from the definitions in the pinned solution contract and the C2-U3 case. They use original supports and neighborhoods and keep the favorable selector fixed when summed. The exact arithmetic hinge is `k*i_k(J) <= (N-k+1)*i_(k-1)(J)`, with `k=p-1`; only terms from graphs `J` of order `2k` can have positive difference, bounded by `i_(k-1)(J)/k`.

No source code was replayed and no computation is claimed. Source packet and common-source hashes were checked before reading; all listed hashes matched. The source's proposed shell assertion remains open because the selected-tag compensation inequality is an additional unproved premise.
