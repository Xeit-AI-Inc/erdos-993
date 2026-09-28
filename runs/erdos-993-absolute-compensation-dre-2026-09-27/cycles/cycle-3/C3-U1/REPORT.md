# C3-U1 independent search report

## Claim and scope

The registered candidate `E993-PATH-STAR-ARITY-2-4-PROFILE-SENSITIVE-STRICT-DESCENT-RANK` is the all-profile assertion that every integer-zero-extended strict descent (k) of the actual parent
\[
P(z)=(1+2z)\prod_i((1+z)^{r_i}+z)+z(1+z)^{N+1},\qquad r_i\in\{2,3,4\},
\]
satisfies
\[
54k\ge24N-4a_2-3a_3-5,
\]
where (a_r=\#\{i:r_i=r\}), (N=2a_2+3a_3+4a_4). The “(-5)” constant is forced by the equivalent strict integer inequality (9k+1-4N+(2/3)a_2+(1/2)a_3>0). The candidate concerns every strict descent, hence includes the actual least strict descent (x) and the terminal zero-extended descent. It does not itself assert a selector, selected-mass or payment conclusion.

## Independent exact check (bounded)

`profile_rank_audit.py` independently builds the factors by integer convolution, forms (P), zero-extends it, scans all count triples with (1\le m=a_2+a_3+a_4\le45), and checks every negative forward difference. Replay from this directory with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 profile_rank_audit.py 45
```

Output: 17,295 profiles, 938,431 strict-descent rows, no violation; the minimum slack (54k-(24N-4a_2-3a_3-5)) is 44, at ((a_2,a_3,a_4)=(0,1,0)), (N=3,k=2), where Δ_kP=-2. This is finite evidence only; it does not establish the registered universal candidate.

## Differential-operator route and obstruction

There is a useful exact reduction, but a tempting sign-cone strengthening fails. Write (L=1+z), (G=1+2z), (B_r=L^r+z), (Q=\prod_iB_{r_i}), (H_i=\prod_{h\ne i}B_{r_h}). Direct product differentiation gives
\[
(1+z)C'-(N+1)C=Q+G\sum_i(1-(r_i-1)z)H_i,\qquad C=GQ.
\]
Also ((1+z)(zL^{N+1})'-(N+2)zL^{N+1}=L^{N+1}). Therefore, for (E=(1+z)P'-(N+2)P),
\[
E=L^{N+1}-2zQ+G\sum_i(1-(r_i-1)z)H_i,
\]
and exactly
\[
[z^k]E=(k+1)P[k+1]-(N+2-k)P[k].
\]
At a rank below the claimed lower bound, (k<(N+1)/2); hence ([z^k]E\ge0) would force (P[k+1]>P[k]). But nonnegativity of this differential coefficient is not a valid proof route in general: for ((a_2,a_3,a_4)=(0,0,2)), (N=8,k=3), the target rank inequality is violated at that (k) (its slack is (-25)), while ([z^3]E=-54) and the actual Δ_3P is (298-178=120>0). Thus failure of this sufficient cone test is not a counterexample to the candidate.

`differential_cone_audit.py` replays this stronger-test audit for all forbidden-rank positions through (m=25); it finds negative cone coefficients, including the exact two-arity-4 obstruction above. Replay:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 differential_cone_audit.py 25
```

This route yields an exact operator identity but no universal weighted lower bound on its coefficients. A genuine proof still needs a sharper coefficient argument that allows negative values of ([z^k]E) when Δ_kP remains nonnegative. I found neither such a bound nor a counterexample to the registered candidate. The count-relaxed (h_{\max}) form follows by maximizing (h=(2/3)a_2+(1/2)a_3) subject to fixed (m,N): with (d=4m-N=2a_2+a_3), maximize by using arity 3 first when (d\le m), and then the minimum feasible (a_2=d-m) when (d\ge m), giving respectively (2m-N/2) and (m-N/6). This is only an algebraic relaxation of the candidate, not additional evidence for its universal truth.

The standing MASS/payment singleton and spread obstructions do not bear on this parent-only rank predicate; neither selector nor payment appears in the claim. No source experiment was executed. The packet lists no allowed source files or required covered claim IDs. The 86 actual member byte hashes in `manifests/C3-COMMON-DISPATCH.json` all match; the packet has empty source/hash lists.

## Disposition

The profile-sensitive rank candidate remains open at this worker evidence grade. The bounded check supports it only for (m\le45). The differential identity is established algebraically, while its nonnegative-coefficient strengthening is explicitly refuted. No universal proof, counterexample, Lean result or status authority is claimed.
