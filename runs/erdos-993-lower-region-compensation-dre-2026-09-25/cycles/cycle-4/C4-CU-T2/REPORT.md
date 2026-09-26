# C4-CU-T2 independent critique

## Disposition

**C4-T2-NEIGHBORHOOD-REDUCTION — retained.** The proposed claim is an exact identity under the contract's definitions, with the stated consequence restricted to eligible instances with `|V(T)| <= 2p`. It does not resolve the primary aggregate in the remaining `|V(T)| > 2p` range.

## Independent audit

I reconstructed the counting identity directly from the contract definitions. For a selected original leaf tag `v`, `H_v=T-{v,s_v}` has `n-2` vertices, and `R_v=H_v-W_v`. Thus `i_j(H_v)-i_j(R_v)` counts exactly the independent `j`-sets meeting `W_v`. Taking the same fixed `F(T,p)` throughout gives `S=U-Q`, where `Q` and `U` count the marked sets at ranks `k` and `k+1` across tags.

For a marked independent `k`-set `A` in `H_v`, its actual addable vertices are precisely `V(H_v) \\ (A union N_Hv(A))`. Since `A` is independent, the two removed sets are disjoint; the addable count is `(n-2)-k-|N_Hv(A)|`. Summed over the tagged marked sets, this yields `E=((n-2)-k)Q-M`.

Count the same addability incidences by their upper set `B=A union {u}`. If `B` meets `W_v` once, exactly the `k` deletions other than its unique marked vertex preserve a mark. If it meets `W_v` at least twice, all `k+1` deletions preserve a mark. Therefore `E=kU+C`, where each upper set counted multiply marked contributes once to `C` for that tag. This remains correct for distinct leaf tags sharing a support: their tagged counts are summed separately. Substitution and `k=p-1` give

`kS = E-C-kQ = (n-2p)Q-M-C`.

Here `k>=1` by `x(T)+2<=p`, and `Q,M,C` are nonnegative counts. Consequently `n<=2p` implies `S<=0`. The equality itself uses no further property of the strict favorable selector; it is valid for the fixed selector in the claim and more generally for any fixed collection of original leaf tags.

## Scope, controls, and usefulness

The claim does not assert the missing compensation when `n>2p`; it only isolates that obligation as `M+C >= (n-2p)Q`. Nonnegativity alone does not prove this when the right side is positive. The derivation also does not imply either the flat or current-rank budget, and supplies no counterexample to them. It is an exact reduction and a valid order subcase, not a resolution of the full lower-region target.

The common contract and intake controls preserve this distinction: the OPEN aggregate and the separately scoped occupancy mechanisms remain separate. Nothing in this algebra conflicts with the recorded fences on per-leaf injectivity or same-current-rank weighted domination, because neither mechanism is used or claimed here. No tree example or computational census is involved, so no realizability claim is needed beyond the contract's assumed finite ordinary tree.

The source claim's algebra, scope, and proposed verification grade are supported. Independent evidence is summarized in `EVIDENCE.json`. No external theorem or computation was used.

## Limitations

- This audit does not establish the compensation inequality in cases `n>2p`.
- It does not prove or refute the proposed flat/current-rank budgets or the universal primary aggregate.
- No computational replay, exhaustive generation, or formal verification was performed.
