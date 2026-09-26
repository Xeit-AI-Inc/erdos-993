# Independent evidence — C4-CF-T6

## Source integrity and scope

The case packet identifies exactly the sealed C4-T6 `EVIDENCE.json`, `REPORT.md`, and `RETURN.json`. All three SHA-256 values match the case packet. All 179 common-packet listed source hashes and those three case hashes were checked; no mismatch occurred. The common `read_first` files, `WORKER-PROTOCOL.md`, `control/C4-CRITIC-BRIEF.md`, and only the three case-listed worker files were read. No replay program is supplied or needed: the claim is an algebraic recurrence, audited directly below. No sealed source was modified.

## Independent derivation of the rooted messages

For a rooted component `(C,u)`, partition independent sets according to whether they contain `u`. If they omit `u`, their generating polynomial is `A_u=I(C-u;z)`. If they contain `u`, removing `u` and its neighbors leaves `C-N[u]`, giving `z B_u`, where `B_u=I(C-N[u];z)`. Thus `I(C;z)=A_u+zB_u`. For child-rooted components `(C_c,c)` of `C-u`, the pieces are disjoint. The polynomial after omitting `u` is the product of `I(C_c;z)=A_c+zB_c`; after including `u`, each child root is forbidden and the residual is the product of `I(C_c-c;z)=A_c`. Therefore

`A_u=product_c(A_c+zB_c)`, `B_u=product_c A_c`.

For a tagged original leaf `v` with support `s`, delete `s` and denote the component on each neighbor branch `u` by `C_u`; write `J_u=I(C_u;z)` and `A_u=I(C_u-u;z)`. In `T-v`, `s` remains and all branches other than the `v` branch remain. If `s` is omitted, the contribution is `product_(u != v) J_u`; if `s` is included, every such branch root is forbidden and the contribution is `z product_(u != v) A_u`. This establishes the claimed formula for `I(T-v;z)`. This product ranges over all other branches, including singleton branches belonging to other original leaves at `s`.

Deleting both `v` and `s` leaves exactly those other branches, hence `I(T-{v,s};z)=product_(u != v)J_u`. Deleting `N[s]` removes `s` and every neighbor branch root; each non-leaf neighbor branch leaves `C_u-u`, and each leaf-neighbor branch leaves the empty graph with polynomial 1. Hence `I(T-N[s];z)=product_(u not a leaf-neighbor of s) A_u`.

These are polynomial identities, so coefficient extraction uses the stipulated integer zero extension without an additional rank condition. For `k=p-1`, each local summand is exactly `d_k(product_(u != v)J_u)-d_k(product_(u not a leaf-neighbor of s)A_u)`, where `d_k(f)=[z^(k+1)]f-[z^k]f`. The selector remains external: a leaf tag is included iff `d_p(I(T-v))<0`. Multiple leaves sharing `s` are still tested and summed separately. The recurrence itself does not determine `x(T)`, establish eligibility, or imply a sign; those inputs must be checked on each tree when applying it.

## Claim-by-claim audit

- `C4-T6-ROOTED-MESSAGE-REDUCTION`: the decomposition is valid for every finite rooted tree and the leaf formulas preserve branch multiplicity and tagged leaves. Empty products correctly give 1, including when `s` has only leaf neighbors. This is a useful exact evaluator, but not a coefficient comparison or a global bound.
- `C4-T6-PRIMARY-GLOBAL-BOUND`: the submitted route explicitly stops at an evaluator and gives neither a proof of `S<=0` nor an eligible positive full-sum tree. Its proposed-open characterization is supported. No local term or support-fiber inference is being made.

No concrete tree, numerical selector, finite census, or imported theorem is asserted by the source route. Thus there is no route-specific arithmetic or realizability certificate to replay. This audit independently verifies the symbolic identities and checks their fit to the contract's original-tree conventions; it does not settle the aggregate inequality.
