# C5-CU-T1 critique

## Claim disposition

**Required claim:** `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR` — **proposed_open**. Its exact claim is that for every nonempty profile with original branch multiplicities (r_i\in\{2,3,4\}), (W=\sum_i r_i A_i) satisfies
\[
W[k+1]C[k-1]\le W[k]C[k]\qquad(1\le k,\ 2k\le N+2),
\]
with integer zero extension. Equivalently, the signed target margin
\[
M_k(W,C):=W[k]C[k]-W[k+1]C[k-1]
\]
is nonnegative. This is a coefficient-only guarded claim: the guard is exactly (1\le k\) and (2k\le N+2). It does not assume actual descent or selector eligibility. I found neither a universal proof nor a guarded counterexample.

## Recurrence audit and proof gap

Write (U=\sum_i r_i G B_{r_i-1}H_i), (E=zL^N), so (W=U+NE). For a newly appended arity (r\in\{2,3,4\}), multiplication gives
\[
C'=B_rC,\quad U'=B_rU+rB_{r-1}C,\quad E'=L^rE,\quad N'=N+r,
\]
and hence exactly
\[
W'=B_rW+rB_{r-1}C+(rL^r-Nz)E.
\]
For the last identity, substitute (W=U+NE): the residual after (B_rW+rB_{r-1}C) is \(((N+r)L^r-N(L^r+z))E=(rL^r-Nz)E\). These are valid repairs/identities, not an induction proof of the target.

The component multipliers (B_r,L^r) have nonnegative coefficients, but the correction is signed. Its (z)-coefficient is (r^2-N), which is negative when (N>r^2). Thus one cannot discard it or infer its contribution to (M_k) is nonnegative. A positive scalar multiplier preserves an inequality; a negative scalar multiplier reverses it. Here the correction is a polynomial, so coefficientwise sign and its effect on a shifted minor must be checked rather than inferred from the positive component recurrences. More directly, the target involves a difference of products, and coefficientwise positivity of a polynomial alone does not order those products.

The guard endpoint is (g(N)=\lfloor(N+2)/2\rfloor). Appending (r=2) adds one new guarded rank; (r=3) adds one rank for even (N) and two for odd (N); (r=4) adds two. Old guarded minors therefore leave these new strips uncontrolled. The recurrence audit supplies no strip estimate and no invariant cone. The common (E)-only obstruction makes a presumed positive correction especially unsafe: for ((a_2,a_3,a_4)=(0,22,0)), (N=66), (k=27) (inside the guard, whose endpoint is 34), direct exact arithmetic gives
\[
M_{27}(E,C)=-518620474811633289768751398606375936,
\]
while (M_{27}(W,C)=51309658488638313875592489085548619091328>0\). This refutes a shortcut that requires the (E)-minor itself to be nonnegative, not the weighted claim.

The proposed sufficient ULC-surplus condition in the source report has the correct direction if its premise is available: from (M_k(U,C)\ge L_k) and (L_k+N M_k(E,C)\ge0), addition yields (M_k(W,C)\ge0). Any clearing of its denominator ((k+1)(h-k+1)) preserves order because both factors are positive on the stated guard ((h=1+2a_2+4a_3+7a_4>N\), and (k\le(N+2)/2)). The source report does not establish the required surplus inequality universally, so this remains a conditional repair only.

## Independent exact checks

I copied and replayed the producer's recurrence script in this scratch directory with `PYTHONDONTWRITEBYTECODE=1`; its five profiles, 19 branch additions, and 32 guarded rows reproduce exactly. I also wrote a separate direct-product implementation that forms every (B_{r_i}), each original-multiplicity deletion term, and (W) independently. It checked all profiles with one through five branches (55 profiles), the producer's two mixed profiles, the one-branch arity edge profiles, and ((0,12,10)): 61 profiles and 430 guarded ranks total. Every sampled signed target margin was nonnegative. Boundary (k=1), midpoint, and upper guarded rank are retained in the JSON evidence. This is finite evidence only, not a universal theorem.

Replay commands from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 producer_recurrence_audit_copy.py > producer_recurrence_audit_replay.json
PYTHONDONTWRITEBYTECODE=1 python3 independent_weighted_lr_check.py > independent_weighted_lr_evidence.json
```

The common dispatch manifest has 237 members; I independently recomputed all member SHA-256 digests with no mismatch. All four packet source hashes also matched. The independent scripts and replay outputs are retained below this report.

## Scope and limitations

The registered comparison keeps (r_i) as the original tip multiplicities. It has no actual first-descent hypothesis; I make no selector/payment inference from it. Any later selected-payment use must separately preserve (x=\min\{k:\Delta_kP<0\}) (including terminal zero-extended coefficients), (x+2\le p), (3p<2\alpha+1), (2p\le\alpha), and the current-(p) strict selectors (e_i=1[\Delta_pA_i<0]), (e_0=1[\Delta_pA_0<0]). Neither the known computer-assisted aggregate nor the finite checks above prove this claim universally. No Lean build or source edit was made.
