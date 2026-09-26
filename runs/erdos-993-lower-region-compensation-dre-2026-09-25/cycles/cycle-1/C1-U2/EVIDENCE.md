# Evidence for C1-U2-1

The derivation is in REPORT.md. The coefficient identities used there are:

- `h=alpha(H_v)=a-1`, `k=p-1`, so `2(h-k)=2(a-p)`.
- `2(h-k)-k = 2(a-p)-(p-1)=2a+1-3p=c`.
- For an independent marked `k`-set `A`, the addable vertices in either bipartition class, together with `A`, form an independent set. Since `alpha(H_v)=a-1`, each class has at most `(a-1)-(p-1)=a-p` vertices. Hence `d_v(A)=2(a-p)-e_v(A)>=0`.
- The incidence count has value `sum_A e_v(A)=2(a-p)q_v(k)-D_v`; an extension with exactly one marked vertex is counted `k` times, while an extension with at least two marked vertices is counted `k+1` times. Therefore it is also `k q_v(k+1)+C_v`.
- `Delta_(p-1)(H_v)-Delta_(p-1)(H_v-W_v)=q_v(k+1)-q_v(k)`.

The primary contract supplies `x(T)+2<=p` and `3p<2a+1`. The latter makes `c` a positive integer; `p>=2` makes `k>=1`. The selector is used only as the exact fixed index set over which the identity is summed. All repeated-support original leaf tags are separate terms and incidences.
