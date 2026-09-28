# C4-T2 search report: weighted tip-deck shifted comparison

## Scope and review boundary

I reviewed the registered claim `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR`, its distinction from the stronger individual-deletion claim and the already refuted unguarded all-rank claim, and the exact unguarded witness. I used the common dispatch inputs and the required predecessor structural reductions and main-mark margin proof. The packet has no additional source files or required covered claim IDs. All 174 common-manifest members were present and their bytes matched their listed SHA-256 values. The packet itself contains no per-file hash field.

## Exact target and disposition

Let (m\ge1), (r_i\in\{2,3,4\}), (N=\sum_i r_i), (L=1+z), (G=1+2z), (B_r=L^r+z), (H_i=\prod_{h\ne i}B_{r_h}), and

\[
C=G\prod_iB_{r_i},\qquad A_i=G B_{r_i-1}H_i+zL^N,\qquad W=\sum_i r_iA_i.
\]

The factor (r_i) in (W) counts the original private-tip tags, without recomputing supports after deletion. The registered universal claim is that integer-zero-extended coefficients satisfy

\[
W[k+1]C[k-1]\le W[k]C[k]\quad\text{for every natural }k\text{ with }1\le k\text{ and }2k\le N+2.
\]

**Disposition: open.** This is a coherent, strictly weaker target than requiring the same comparison separately for every (A_i), but I found neither a universal proof nor a guarded counterexample. The retained order-122 individual-deletion counterexample has (N=80,k=77), hence (2k>N+2); it does not refute this weighted claim or its guarded band.

The handoff records literal all-(m) selected MASS, exact-ratio payment, and actual full selection as verified at computer-assisted/nonformal grade. This search neither reopens those predicates nor upgrades the weighted mechanism: no census-free proof or governed formal award follows from these checks.

## Conditional selector consequence

Assume the weighted comparison holds at every guarded (k) for a profile. Let (P=C+zL^{N+1}), and let (x) be the actual least natural index with \(\Delta_xP<0\), including the terminal coefficient and treating zero difference as non-descent. Suppose (p) is an actual eligible rank with

\[
x+2\le p,\qquad 3p<2(N+2)+1,\qquad 2p\le N+2.
\]

The binomial parent term is rising at (x), so \(\Delta_xC<0\). Since (C) has positive interval support and is log-concave, its adjacent coefficient ratios decrease and
\[
0<\frac{C[p]}{C[p-1]}\le\frac{C[x+1]}{C[x]}<1.
\]
The weighted comparison at (k=p), with positive coefficients, gives
\[
\frac{W[p+1]}{W[p]}\le\frac{C[p]}{C[p-1]}<1,
\]
so \(\Delta_pW<0\). But \(\Delta_pW=\sum_i r_i\Delta_pA_i\) with every original multiplicity (r_i>0). Therefore at least one branch has \(\Delta_pA_i<0\), exactly the current-(p) strict selector (e_i=1[\Delta_pA_i<0]\). The endpoint selector (e_0=1[\Delta_pA_0<0]\) is not needed for this implication. Combined with the reviewed branchwise (3/2) payment, one selected branch suffices for local MASS; that in turn is a sufficient route to the exact-ratio payment. This is a conditional proof route, not evidence that the weighted coefficient comparison holds universally.

## Independent exact diagnostics

`weighted_deck_check.py` uses exact integer convolution and checks every guarded (k) in eight fixed profiles: the three one-branch profiles, a small mixed profile, the negative-cofactor-slope control ((0,12,10)), the known unguarded-obstruction profile ((38,0,1)), a rare-small-arity profile ((1,1,30)), and a large mixed profile ((120,80,60)). No checked guarded margin was negative. The largest profile has (m=260,N=720), and the check is only a finite diagnostic, not a census or proof.

For ((38,0,1)), the script also constructs the literal 122-vertex ordinary tree. A tree dynamic program independently matches (P=C+zL^{N+1}), and the sum of its 80 literal private-tip deletion polynomials matches (W=\sum_i r_iA_i). The guarded range ends at (k=41). At the unguarded (k=77) obstruction rank the weighted signed margin is positive (206294799744024), showing that the individual failure is not inherited by this weighted sum at that row.

Replay from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 weighted_deck_check.py
```

The captured deterministic output is `weighted_deck_evidence.json`.

## Limitations

- No all-profile coefficient-cone, injection, recurrence closure, or covariance proof was found.
- The weighted ratio comparison is not established by pairwise individual-deletion comparisons in the literature or source materials; sums require their own argument.
- The conditional selector consequence uses the actual first strict descent, the full stated eligibility guards, strict current-(p) selection, original multiplicities, and the established (C) log-concavity/branchwise payment facts. It does not use or certify a census-free proof of the candidate inequality.
- All finite output is bounded evidence. No Lean build or formal award was attempted.

Artifacts: `cycles/cycle-4/C4-T2/weighted_deck_check.py` and `cycles/cycle-4/C4-T2/weighted_deck_evidence.json`.
