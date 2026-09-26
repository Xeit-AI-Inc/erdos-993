# C1-T5: rooted transfer state for the lower-region aggregate

## Result

I obtained an exact support-fibre reduction of the selected aggregate in terms of rooted branch independence polynomials. This gives a compositional state that preserves all coefficient data needed for the first-descent and favorable-leaf tests. I did not obtain an inequality controlling the sum of the selected fibre contributions, so the registered lower-region assertion remains open on this evidence.

## Transfer derivation

For an original support vertex `s`, let `L_s` be its original leaf neighbors and `m_s=|L_s|`. For each neighbor `w` of `s` that is not an original leaf, root the component of `T-s` containing `w` at `w`, with independence polynomial `J_{s,w}` and root-deleted polynomial `E_{s,w}`. Put

`P_s=(1+z)^(m_s-1) product_w J_{s,w}` and `Q_s=product_w E_{s,w}`,

where both products run over non-leaf neighbors of `s`. For every `v in L_s`, the `m_s-1` other pendant neighbors contribute `(1+z)^(m_s-1)` to `I(T-{v,s})`, and deleting all remaining neighbors of `s` leaves the factors `E_{s,w}`. Therefore

`I(T-{v,s})=P_s`, `I(T-N_T[s])=Q_s`, and `I(T-v)=P_s+zQ_s`.

It follows that all leaves with support `s` have the same selector value and the same summand. With `k=p-1`, the complete sum is exactly

`S(T,p)=sum_{s: Delta_p(P_s+zQ_s)<0} m_s Delta_k(P_s-Q_s)`.

This derivation retains the original leaf multiplicity; it does not replace a support fibre by one leaf. Full formulas and the rooted recurrence are recorded in [rooted-transfer.md](evidence/rooted-transfer.md).

## Inductive state and remaining closure

For a rooted tree `(U,r)`, the pair `J(U,r)=I_U` and `E(U,r)=I_{U-r}` composes over child subtrees by `E=product_i J_i` and `J=product_i J_i+z product_i E_i`. Retaining full coefficient vectors for the two messages in both directions along every edge yields all `P_s,Q_s` above. The whole-tree polynomial then determines `a=alpha(T)` and `x` by checking zero-extended differences through rank `a`; the strict eligibility guards are applied only after this computation. The support messages determine every strict `Delta_p(T-v)<0` test and every `Delta_(p-1)` contribution.

This is more informative than the scalar tuple `(a,x,p,S)`, but it is still only an exact transfer algorithm. The missing inductive invariant is a proved compensation bound

`sum_{s: Delta_p(P_s+zQ_s)<0} m_s Delta_(p-1)(P_s-Q_s) <= 0`

whenever `x(T)+2<=p` and `3p<2a+1`. The selector depends on rank `p` of `P_s+zQ_s`, while the signed summand depends on rank `p-1` of `P_s-Q_s`; the rooted product recurrence supplies no sign relation between them. The common controls include positive selected local terms despite negative complete sums, so pointwise nonpositivity cannot serve as the missing invariant. A valid induction must prove compensation across support fibres while also preserving the global guards. I found no such argument and no eligible positive complete sum.

## Claim disposition

The exact support-fibre identity is proposed as a verified algebraic reduction. The primary assertion remains proposed open: neither a proof nor a refutation was established. No literature result or computation is used to promote a status.

## Limitations

- The transfer state computes the target but does not prove the aggregate sign.
- No new finite census, counterexample, or independently replayed graph calculation was performed.
- The common handoff's control examples are used only to rule out a pointwise-sign induction invariant; they do not decide the complete aggregate.
