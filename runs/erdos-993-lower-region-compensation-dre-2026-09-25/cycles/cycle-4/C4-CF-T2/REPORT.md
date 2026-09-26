# C4-T2 independent critique (orientation F)

## Disposition

**Retained** — `C4-T2-NEIGHBORHOOD-REDUCTION` is correct as stated. The claim establishes an exact algebraic identity and the consequence `S<=0` when `|V(T)|<=2p`; it does not establish the full lower-region aggregate when `|V(T)|>2p`.

## Audit

For a fixed selected leaf tag, `H_v` has `n-2` vertices. For a marked independent `k`-set `A`, its addable vertices are precisely the vertices outside `A union N_H(A)`, hence `e(A)=(n-2)-k-|N_H(A)|`. Summing yields `E=((n-2)-k)Q-M`.

Count incidences between marked `k`-sets and their one-vertex independent extensions. A tagged upper set meeting `W_v` once contributes `k` incidences preserving the mark; one meeting `W_v` at least twice contributes `k+1`. Since `C` counts each multiply marked upper set once per tag, `E=kU+C`. Further, `q_v(j)=i_j(H_v)-i_j(R_v)` gives `S=U-Q`. Combining and using `k=p-1` gives

`kS=E-C-kQ=(n-2-2k)Q-M-C=(n-2p)Q-M-C`.

These counts use one fixed favorable set `F(T,p)` throughout. Tags remain separate even when leaves share their original support. Eligibility ensures `k>=1`; all quantities `Q,M,C` are nonnegative. Thus `n<=2p` implies `kS<=0`, hence `S<=0`.

The consequence has eligible instances: for `K_{1,20}`, `alpha=20`, `x=10`, and `p=12` satisfies `x+2<=p` and `3p=36<41`. Each of its 20 leaves is favorable since `Delta_12(K_{1,19})=binom(19,13)-binom(19,12)<0`; also `n=21<=2p=24`. This checks nonvacuity and illustrates that same-support tags are included.

## Scope and remaining gap

For `n>2p`, the formula requires the additional inequality `M+C >= (n-2p)Q`, which is not proved by nonnegativity alone. No positive full aggregate or counterexample follows from a failure of a proposed budget. The route correctly leaves the universal target and the larger-order compensation obligation open. No selector-value gap is present in the claimed result: the proof uses the source's fixed `F`, while the star instance verifies its strict leaf selector directly.

## Source and limitations

The two case-listed source hashes and all common listed source hashes matched their packets. The exact independent derivation and the nonvacuity arithmetic are recorded in [EVIDENCE.md](EVIDENCE.md). This was a symbolic audit plus a hand-checked star instance, not a census or formal verification. No external literature was used.
