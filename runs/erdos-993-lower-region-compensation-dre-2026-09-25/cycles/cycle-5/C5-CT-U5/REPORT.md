# C5-CT-U5 critique: support-star sector

## Disposition

**C5-U5.support-star-sector — retained.** The claimed nonpositivity is correct for every ordinary star \(K_{1,d}\), \(d\ge 12\), at every rank satisfying the primary guards. The proof is elementary and applies to the exact original strict selector. See `EVIDENCE.json` for the independent derivation.

## Independent audit

Write \(h=d-1\), \(k=p-1\). The star has \(\alpha=d\), and its first negative independence difference is \(x=\lfloor(d+1)/2\rfloor\), including the initial exceptional count \(i_1=d+1\) and zero extension at the terminal rank. Thus eligibility gives \(k\ge\lfloor(d+1)/2\rfloor+1\).

For any original leaf \(v\), \(T-v\cong K_{1,d-1}\). The strict upper guard implies \(p<d-1\), and the lower guard puts \(p\) strictly past the first negative difference of this smaller star, whose first negative index is \(\lfloor d/2\rfloor\). Consequently \(\Delta_p(T-v)<0\) for every leaf: the fixed selector is exactly the full set of \(d\) original leaves, not an assumed arbitrary subset.

For each such leaf, \(H_v\) is edgeless on \(h\) vertices, \(W_v=V(H_v)\), and \(R_v=\varnothing\). At positive ranks \(j\), \(q_v(j)=\binom hj\). Directly from the definition of the summand,

\[
\Delta_k(H_v)-\Delta_k(R_v)=q_v(k+1)-q_v(k).
\]

The lower guard ensures \(2k+2\ge d\), so whenever the binomial ratio is in range,
\[
\frac{q_v(k+1)}{q_v(k)}=\frac{h-k}{k+1}\le 1.
\]
Zero-extended ranks also give a nonpositive difference. Each selected summand is therefore nonpositive, and summing all original leaves proves \(S(T,p)\le0\). The upper guard and \(d\ge12\) in fact keep the eligible ranks inside the displayed binomial range, but the zero-extension check is harmless.

## Source correction and scope

The source report states \(kS=\sum_v(q_v(k+1)-q_v(k))\). That factor is incorrect: the defining formula gives \(S=\sum_v(q_v(k+1)-q_v(k))\). The handoff identity is instead \(kS=E-C-kQ\); in this star sector, \(E=kU+C\), so it yields \(kS=k(U-Q)\), consistently with \(S=U-Q\). This is a report algebra typo, not a defect in the exact restricted claim, which follows directly from the defining summands.

The result remains limited to stars with at least twelve leaves; it gives no inequality for sectors where \(H_v\) has edges and does not settle the ordinary-tree primary aggregate.
