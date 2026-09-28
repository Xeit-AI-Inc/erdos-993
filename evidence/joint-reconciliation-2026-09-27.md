# Joint terminal reconciliation — 27 September 2026

This is a documentation and registrar reconciliation, authorized by Ashton after both six-cycle runs completed. It is not a new experiment or a new formal award.

## Evidence read

- [r30 terminal Cycle 6 close](../runs/erdos-993-weighted-transport-dre-2026-09-26/C6-CYCLE-CLOSE.md), [synthesis](../runs/erdos-993-weighted-transport-dre-2026-09-26/C6-SYNTHESIS.md) and [controller review](../runs/erdos-993-weighted-transport-dre-2026-09-26/CONTROLLER-REVIEW-R30.md), with the current master registry. Terminal manifest digest: `7156daeb97eeb9b81c6b28838bb52cbace3f420093f8ce9127300f51ddeea844`.
- [Heterogeneous terminal report](../runs/erdos-993-heterogeneous-closure-dre-2026-09-26/REPORT.md), [final analysis](../runs/erdos-993-heterogeneous-closure-dre-2026-09-26/FINAL-ANALYSIS.md) and [final reconciliation](../runs/erdos-993-heterogeneous-closure-dre-2026-09-26/FINAL-RECONCILIATION.md).
- Public base revision `e3ffa3e43635ca7d28dc80bfb7e69d5608688056` (r30), following `9e412c1213b1dc7ef68d6909bf2900ef2465d421` (heterogeneous closure).

## Corrections and scope

Both runs are terminal. Code's 34 new identities were already merged; the registry has 491 identities (309 VERIFIED, 98 REFUTED, 26 CONDITIONAL, 58 OPEN). Coordination fields still pointed to r29, r30 Cycle 4 and a sealed older notepad. Current coordination now points to the master working notepad, preserves the final r30 publication metadata and marks both runs complete.

The former G(8^82,7^2)/448 gap is closed. The heterogeneous tree is certified at all 56 eligible ranks. Five homogeneous CB trees have all-eligible-rank certificates; ten more have one-rank certificates. Only 15 of 223 recorded switch-necessary CB rows are certified, leaving 208. The public r30 article and headline summaries have been corrected accordingly. The spider Lean award covers rank k+3 for k>=5; the all-eligible-rank extension remains informal.

The proposed theta formula is a fitted candidate for a particular local certificate template on the residue-2 CB(8,m) class. It is not a proved optimum or necessary budget for every possible flow. Full-sector surplus does not establish whole-network Hall with competing capacities. The successor needs both uniform sector allocation and parent-descent eligibility; it concerns one specified rank per tree.

Code's reported deletion-Hall census through order 23 covers the formerly proposed p=8 orders 19..22 discovery census. Formal order-band statements retain their previous scopes. T_22/34 has order 91; its subscript does not give its order.

## One claim-object metadata correction

`E993-TREE-REAL-ROOTED` remains REFUTED with the same statement and scope. Its `smallest_witness_order` changes from 26 to 4; its certificate and history record the direct witness already documented by r30's [isolated second read](../runs/erdos-993-weighted-transport-dre-2026-09-26/SECOND-READ-SR-C6-4.md).

For the claw K1,3, the independence polynomial is 1+4z+3z^2+z^3. Its derivative is 3(z+1)^2+1>0 on the real line. It has exactly one real zero and therefore two nonreal zeros. The only nonempty trees of orders 1, 2 and 3 have polynomials 1+z, 1+2z and 1+3z+z^2, respectively; all are real-rooted. The empty forest has polynomial 1, and every forest of order at most 3 is a product of these component polynomials. Thus order 4 is minimal. Order 26 remains the older non-log-concavity witness scope and is not altered there.

No claim identities, statuses, theorem statements or proof grades are added or promoted. All 490 other claim objects remain unchanged. Broad legacy aliases noted by r30 are retained; the current canonical obligations projection passes the claim linter without findings or warnings.

## Verification and preservation

The canonical and public registries and the three current ledger copies are synchronized. The current obligations CSV retains all 491 rows and unchanged statuses. JSON parsing, unique identities, exact status/scope projection and the governed claim-status linter are checked. Newly introduced relative links and the publication diff are checked. No fresh Lean build or new formal verification is claimed.

The pre-update hash index contained 312 entries, six stale after r30's publication: the registry, both public ledgers, README, STATUS and the obligations CSV. The index is refreshed against the current bytes and expanded to include r30's published records/packages and this reconciliation's public files. It is a byte-integrity index, not an upgrade of evidence grade.

Original terminal roots, Lean packages and published run records remain unchanged. Canonical pre-update files and a publication receipt are retained outside the terminal experiment roots. Current documentation supersedes stale activity/count summaries; historical entries remain dated evidence.

## Proposed next work

[Code's successor prompt](../docs/prompts/code-cb-uniform-switch-2026-09-27.md) targets uniform weighted Hall on CB(8,m), m>=107, m congruent to 2 modulo 3, at p*=(16m+4)/3. Astra/Codex proposes the complementary exact-ratio absolute selected-payment problem on arity-2,3,4 path-stars. Neither successor is launched by this update. See the [joint assessment](../docs/assessment-2026-09-25.md) and [twelve-area working notepad](../docs/research-notepad-2026-09-25.md).
