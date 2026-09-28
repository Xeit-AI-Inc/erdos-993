# C4-CU-T3 — independent critique

## Reviewed claim and source integrity

I reviewed the sole required claim, `C4-T3-COUNT-VECTOR-COFACTOR-BRIDGE`, against the exact finite-block statement in `E993-FINITE-BLOCK-COEFFICIENT-JENSEN-DOMINATION` and the separate formal scope of `E993-FINITE-BLOCK-CENTER-SUBSET-COEFFICIENT-EXPANSION`. The latter proves a polynomial coefficient identity only; it does not prove the probability/Jensen argument. The packet’s two case-file hashes match. All 174 common-dispatch member byte hashes match their manifest entries.

## Disposition: retained at stated scope

For positive block sizes (s_i), put (M=\sum_i s_i), (F_i(z)=\sum_t f_i(t)z^t), and (w_i(t)=f_i(t)/\binom{s_i}{t}\ge1). For each count vector (t) with \(\sum_i t_i=k\), exactly \(\prod_i\binom{s_i}{t_i}\) of the \(\binom M k\) labeled (k)-subsets have those block counts. Expanding the product coefficient therefore gives, exactly,

\[
\frac{[z^k]\prod_i F_i(z)}{\binom M k}
=\sum_{\sum t_i=k}\frac{\prod_i\binom{s_i}{t_i}}{\binom M k}\prod_iw_i(t_i)
=\mathbb E\prod_iw_i(K_i).
\]

The weights sum to one by Vandermonde (equivalently, the count vectors partition all (k)-subsets); the block counts are dependent, and the argument does not assume independence. Each marginal is hypergeometric, with probability \(\binom{s_i}{t}\binom{M-s_i}{k-t}/\binom M k\), using zero for out-of-range binomials.

For the inequality direction, define \(h(w)=\log w-2(w-1)/(w+1)\). On \(w\ge1\),
\[
h(1)=0,\qquad h'(w)=\frac{(w-1)^2}{w(w+1)^2}\ge0,
\]
so \(\log w\ge2(w-1)/(w+1)\). All denominators are positive because \(w_i\ge1\); summing preserves the inequality and monotonicity of exp preserves its direction. Convexity of exp gives \(\mathbb E e^X\ge e^{\mathbb E X}\), yielding the claimed exponent (y_k\). Every summand of (y_k) is nonnegative. Thus for every natural (d), the nonnegative Taylor remainder gives \(e^{y_k}\ge E_d(y_k)\). This also verifies the worker report’s directions after substitution.

When \(f_i(t)=\binom{s_i}{t}+\mathbf1_{t=1}\), only (t=1) has surplus. Substitution into (y_k) gives exactly
\[
\frac{2s_i}{2s_i+1}\frac{\binom{M-s_i}{k-1}}{\binom M k}.
\]
The zero-extended convention handles both boundaries (k=0,M). The empty family is a separate case (M=k=0): the empty product/coefficient and its bound are 1, with (y=0).

The stated transfer through (G F_r) is valid as a coefficient-floor transfer because its factors have nonnegative monomial coefficients. I independently expanded in the (z)-monomial basis: (G F_2=(1,2)), (G F_3=(2,5,2)), and (G F_4=(3,9,7,2)). This finite-block result supplies no parent-rank, marked-deletion, original-tag, or strict-selector identity; those graph bridges remain separate obligations as the source report says.

## Independent exact replay

`bridge_audit.py` uses integer coefficients and `Fraction` throughout. It checks the count-vector expectation against direct convolution for every (k) in examples with sizes ((1)), ((2,3)), and ((1,2,2)), including (k=0), interior ranks, and (k=M); checks the rational (y_k\ge0) and Taylor floors through degree 5; and checks the three (G F_r) coefficient vectors. It also checks the empty-family boundary. Replay from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 bridge_audit.py
```

These finite checks are corroboration only; the general count-vector proof and derivative argument above are universal. No Lean build was run. The accepted claim is an informal universal finite-block/Jensen result, not a formal award or a selected-payment theorem.
