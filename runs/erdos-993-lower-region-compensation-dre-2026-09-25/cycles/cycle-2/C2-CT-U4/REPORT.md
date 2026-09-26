# C2-CT-U4 critique of C2-U4 (orientation T)

## Disposition

**E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE — retained_narrowed.** The route correctly gives (i) a fixed-selector weighted-layer identity for each eligible instance and (ii) an exact weighted deletion-flow/min-cut characterization for that instance. It does not prove the universal cut inequalities or the primary aggregate. Proposed status remains `proposed_open`.

The exact retained statement is: for an ordinary tree `T`, an eligible `p`, and the one fixed set `F(T,p)` of original leaves satisfying `Delta_p(T-v)<0`, define `w_F(B)` as the number of selected leaf tags `v in B` for which `(B\{v})` meets `W_v=N_T(s_v)\{v}`. Then

`S(T,p) = sum_{B in I_(p+1)(T)} w_F(B) - sum_{A in I_p(T)} w_F(A)`.

On the finite bipartite graph with upper vertices `I_(p+1)(T)`, lower vertices `I_p(T)`, and edges `A subset B`, upper supply `w_F(B)` and lower capacity `w_F(A),` there is an integral flow saturating all upper supply if and only if every `X subset I_(p+1)(T)` satisfies `sum_X w_F <= sum_{N_-(X)} w_F`. Such a flow implies `S<=0`. This is an instancewise certificate criterion, not a proof that its cuts always hold.

## Independent audit

For an original leaf `v` with support `s_v`, `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\{v}`, and `R_v=T-N_T[s_v]=H_v-W_v`. Thus `q_v(j)=i_j(H_v)-i_j(R_v)` counts exactly the independent `j`-sets in `H_v` meeting `W_v`. For every one of those sets `A`, `A union {v}` is independent in `T` because `s_v` is absent. Conversely, a set `B` counted by the stated weight for tag `v` contains `v`, and deleting `v` gives such an `A`. The map is a bijection separately for every original leaf tag. Summing over tags therefore retains multiplicity even when several leaves have the same support, and yields `sum_F q_v(j)=sum_{I_(j+1)(T)}w_F` without changing `F` between ranks.

The local summand is `Delta_(p-1)(H_v)-Delta_(p-1)(R_v)=q_v(p)-q_v(p-1)`. Summing and applying the preceding bijection at `j=p` and `j=p-1` proves the displayed formula with the signs and ranks as written. No selector at another rank is substituted. These identities are algebraic and do not use the eligibility guards, so they hold in particular under the registered strict guards `x(T)+2<=p` and `3p<2alpha(T)+1`; they do not establish either guard or any selector values for a concrete tree. `p-1` is an ordinary rank under eligibility (`p>=2`). The route offers no instance to check `x` through terminal zero extension, `a`, `p`, or the strict favorable tests against.

For the flow statement, let `u(B)=w_F(B)` and `c(A)=w_F(A)`, both nonnegative integers. Give source-to-upper arcs capacity `u`, deletion arcs capacity `M=sum_B u(B)+sum_A c(A)+1`, and lower-to-sink arcs capacity `c`. A cut crossing a deletion arc costs at least `M`, more than the total source supply, so cannot prevent saturation. A finite cut with upper source-side set `X` must also put every lower neighbor `N_-(X)` source-side; its least capacity for this `X` is `sum_(B notin X)u(B)+sum_(A in N_-(X))c(A)`. This is at least total supply exactly when `u(X)<=c(N_-(X))`. Max-flow/min-cut proves the equivalence, and integral capacities give an integral flow. If all upper supplies are zero, the zero flow applies. Taking `X` to be the entire upper layer gives `sum_upper w_F<=sum_lower w_F`, exactly `S<=0`; hence a saturating flow is a sound certificate. Proper-cut validity is a stronger demand of this particular flow certificate and is not necessary for the scalar primary assertion by itself.

## Scope, controls, and usefulness

The route preserves the primary's original-tree supports and neighborhoods, strict fixed favorable selector, and separate tag for every original leaf. Its network vertices and edges are realizable for every finite ordinary tree because they are the actual independent-set layers and one-element deletions. But it computes no network or cut values for a tree, gives no concrete saturating flow, and establishes none of the universal cut inequalities. No generation boundary, arithmetic census, or full-sum counterexample is offered or needed for this symbolic reduction.

This construction permits units to move between tags and supports, so it does not assert the known-failing within-tag Hall condition. It also does not challenge the order91/order243 controls: the route reports neither a tagwise matching claim nor any computed flow result on those trees. There is no positive local term or support-fibre claim to confuse with a counterexample, and no use of tree log-concavity, edge-addition monotonicity, or another refuted premise. The permitted global-weight coordinates are correctly specialized. The reduction is useful as a finite-instance certificate test, but without a way to prove its cuts uniformly or a replayed instance where it yields a certificate, it makes no progress on the universal sign beyond the exact restatement of the missing rank inequality through the all-upper-layer cut.

## Limitations

- No proof is supplied that all weighted deletion cuts hold for every eligible ordinary tree, and no eligible cut failure is supplied.
- A failed proper cut would only rule out this flow certificate for that instance; it would not refute `S<=0`.
- There is no tree instance to replay, and no source computation was run. No finite-generation or empirical conclusion is claimed.
- The review retains only the identities and conditional finite-instance criterion above. The primary universal aggregate remains open and receives no authoritative verdict here.
