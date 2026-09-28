# C4-CT-F2 critique

## Scope and integrity

I reviewed all four required claims in packet `C4-CT-F2.json`, using the Cycle 4 neutral handoff, protocol, contract, current registered identities, common-manifest inputs, and the packet's C4-F2 case only. SHA-256 matched for all 174 common-manifest members and all 12 packet-authorized source members. The manifest includes the current-cycle neutral proof and instrument sources; no sibling case, other scratch, proposal directory, private transcript, or live experiment was opened. Producer scripts were copied into this scratch before execution. No Lean build or source edit was made.

All calculations below use coefficients expanded in monomial powers of `z`. In particular `B_2=[1,3,1]`, `B_3=[1,4,3,1]`, and `B_4=[1,5,6,4,1]`; these are not coefficient lists in powers of `L=1+z`.

## Required claim dispositions

### Individual lower-half shifted comparison

**Proposed disposition: open.** The registered universal claim is for every original leaf deletion, including the endpoint `A0`, every nonempty profile with arities in `{2,3,4}`, and every `1<=k`, `2k<=N+2`. The copied all-rank probe checks endpoint and tip types through `m=20` (297,450 comparisons) without failure. The larger targeted actual-eligible checks give useful tip evidence, but do not prove the universal guarded claim. No guarded counterexample was found.

The retained `(a2,a3,a4)=(38,0,1)` obstruction has `N=80`, `n=122`, `alpha=82`, `x=41`, `p=k=77`, and `j=p-2=75`. For the arity-4 tip, the strict flags at this out-of-scope rank are `e0=e2=e4=1`, with `Delta_77 A0=-8,666,804`, `Delta_77 A2=-2,453,398`, and `Delta_77 A4=-1,995,676`. Its relevant coefficients are `A4[77]=2,091,375`, `A4[78]=95,699`, `C[77]=14,606,561`, and `C[76]=319,721,589`; the signed target margin `A4[77]C[77]-A4[78]C[76]` is `-49,239,834,336`. It is outside the guarded claim because `2p=154>N+2=82`; actual eligibility also fails `3p<2alpha+1` (`231>=165`) and `2p<=alpha` (`154>82`). It refutes only the unguarded extension.

### Weighted tip-deck lower-half shifted comparison

**Proposed disposition: open.** With `W=sum_i r_i Ai` and every original tip multiplicity retained, the proposed universal scope remains all profiles and all `1<=k`, `2k<=N+2`. The copied exact diagnostic reports no failure on 74 selected profiles and 178 actual-eligible lower-half rows. Those are bounded checks, not a universal result; no guarded counterexample was found.

### Weighted comparison conditionally implies selected MASS

**Proposed disposition: informal proof, conditional on the registered weighted inequality and the reviewed source lemmas.** At an actual eligible `p`, take the actual least strict descent `x` of `P`, with zero-extended terminal differences, and retain `x+2<=p`, `3p<2alpha+1`, and `2p<=alpha`. Then `j=p-2`, `1<=p`, `2p<=N+2`, and the registered first-descent ratio fact gives `0<C[p]/C[p-1]<1`. All factors here are positive: `C` has positive coefficients throughout its support and `p` is in that support.

If the weighted inequality holds at `k=p`, then

`C[p-1] W[p+1] <= C[p] W[p]`.

Since `W[p]>0` (the common binomial term in each `Ai` is positive in this range), division by the positive `C[p-1]` gives `W[p+1] < W[p]`. Expanding `W` gives `sum_i r_i Delta_p Ai<0`; with positive integer `r_i`, at least one **strict current-p** tip selector `ei=1[Delta_p Ai<0]` is on. This preserves the registered selector rather than weakening it to a non-strict sign.

Let `R=sum_i r_i ei`. A selected branch gives `R>=2`, since every original `r_i>=2`. By the reviewed branchwise bound `2 T_i[j]>=3 delta D_j`, summing with the original weights gives `A>=3R delta D_j/2 >= (R+1)delta D_j >= b delta D_j`, since `b=R+e0` and `e0<=1`. The middle inequality is exactly `R/2>=1`, so it is valid at the endpoint `R=2` as well. Here `delta=q-j>0` and `D_j>0` on the eligible domain.

For `t=C[j+1]/C[j]`, the source facts give `0<t<1`. Multiplying selected MASS by the positive factor `1-t+t/delta` yields the exact-ratio payment because

`delta(1-t+t/delta)=1+(delta-1)(1-t)>=1`.

No negative multiplier is used; if a comparison were multiplied by a negative quantity its direction would reverse. This argument proves neither the weighted coefficient inequality nor the stronger occupation payment `(1-t)A>=bD_j`, and its supporting first-descent, branchwise, and marked-margin statements retain their existing evidence grades. It supplies no Lean award.

### Bounded diagnostic claim

**Proposed disposition: retained, narrowed.** The 74-profile/178-row script tests each distinct tip-deletion polynomial `Ai` and the weighted deck `W`, but its loop does **not** test endpoint deletion `A0`. Thus the F2 report's phrase “both guarded shifted comparisons” overstates endpoint coverage for that 74-profile run. Endpoint `A0` does appear in the separate all-rank probe through `m=20`; my independent replay also checked it at three actual eligible boundary/interior rows. The supported scope is therefore: 74-profile/178-row exact evidence for tip `Ai` and `W`; separate 297,450-comparison bounded evidence including `A0` through `m=20`; and separate exact endpoint boundary checks below. None proves a universal statement.

## Independent arithmetic and replay

I wrote `independent_audit.py` independently. It expands `B_r` and `F_r` directly in `z`, constructs `P,C,A0,Ai,W`, and computes the least strict descent with zero extension. A literal rooted-tree dynamic program independently matches `P`, deletion of original leaf 2 to `A0`, and deletion of a private tip to its `Ai`. It checks the three actual guards and strict selector flags, the exact weighted margin `C[p]W[p]-C[p-1]W[p+1]`, original tip multiplicities, the branchwise `3/2` margins, selected MASS, and the exact-ratio payment.

The exact rows are homogeneous arity 4 with 40 branches at `p=80=x+2` and `p=81=floor(alpha/2)`, plus profile `(a2,a3,a4)=(1,1,30)` at `p=63=x+2=floor(alpha/2)`. All guards hold, all literal polynomial checks match, and all displayed weighted, endpoint, tip, MASS, and ratio-payment margins are nonnegative; full integers and selector flags are in `independent_audit.json`. These are boundary/interior substitutions, not a theorem.

Replay commands from the run root:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-4/C4-CT-F2/independent_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-4/C4-CT-F2/producer_probe.py
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-4/C4-CT-F2/producer_controls.py
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-4/C4-CT-F2/producer_witness.py
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-4/C4-CT-F2/producer_guarded.py
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-4/C4-CT-F2/producer_boundary.py
```

## Limits

No universal proof or guarded eligible counterexample was found. The all-rank witness lies outside the stated rank band. The conditional weighted-to-MASS implication is valid at the stated informal grade, but its antecedent is open. The endpoint omission narrows one bounded diagnostic only; it changes neither registered universal claim. Existing selected MASS, exact-ratio payment, and aggregate statuses remain at the common computer-assisted/nonformal grade.
