# C5-CU-F1 independent critique

## Scope and integrity

I read the sealed protocol, contract, status clarification, neutral handoff, allocation, this worker's packet, and the registered identity entries for the three required claims. I did not inspect sibling cases or private proposals. SHA-256 checks matched all 237 common-dispatch members and all 6 packet-listed source files. I copied the two producer scripts into `own-evidence/` before execution. The copied producer scripts replay with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 own-evidence/manifest_check.py
PYTHONDONTWRITEBYTECODE=1 python3 own-evidence/F1_adversarial.py
```

An independent exact-integer implementation is in `own-evidence/independent_audit.py`; replay it with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 own-evidence/independent_audit.py
```

It uses ordinary monomial coefficient arrays for the polynomials, zero-extends all coefficient lookups, recomputes first strict descent through the terminal coefficient, and retains original tip multiplicities. Its output is `own-evidence/independent_audit.json`.

## Required claims

### `C5-F1-MIXED-MINOR-SHORTCUT-CONTROLS`

The three claimed controls independently reproduce.

- For counts `(0,22,0)`, `N=66`, `n=91`, `alpha=68`, the first strict descent is `x=32`. At `p=34`, all three actual-p guards hold (`x+2=34`, `3p=102<137`, `2p=68<=68`), and strict selectors are `(e0,e3)=(1,1)`. The original multiplicities are one endpoint tag and 66 tip tags. At guarded rank `k=27`, the isolated E minor is `-518620474811633289768751398606375936`, while the full endpoint and tip margins are respectively `745097444696166793706461153834912453824` and `777419068009671422357461955841645743808`.
- For three arity-4 branches, `N=12`, `n=18`, `k=7` is in the shifted-comparison guard. The activity coefficient of degree 3 is `-66`; the sum of all activity layers and the direct full single-tip margin are both `2076267`. This is a basis-coefficient failure only; it is not a failure of the value at activity one.
- For counts `(38,0,1)`, `N=80`, `n=122`, first strict descent `x=41`, the full tip minor at `k=77` is `-49239834336`, but `2k=154>82=N+2`. It is outside the registered guard.

I found an ancillary bug in the producer's reported *weighted* activity-control number, which is not part of the required claim statement. Its helper `margin` retains `C` from the preceding all-arity-3 control instead of using the all-arity-4 `C`; it also forms `U_i+12E`, whereas the weighted original-tip deck for three identical arity-4 branches is `12(U_i+E)`. The correct weighted margin at the all-arity-4 control is `24915204`, still positive. This invalidates the producer's printed weighted-margin value, not the single-tip activity control or any registered target.

### `C5-F1-WEIGHTED-GUARDED-SHIFTED-BOUNDED-CHECK`

An independent exact scan reproduced 1,770 nonempty count profiles with `m<=20` and 41,205 guarded ranks. It found no negative weighted margin; the minimum is 38 at counts `(1,0,0)`, `N=2`, `k=1`. For each arity class the implementation multiplies its deletion polynomial by `r * count`, preserving the original tag multiplicity. The scan is finite evidence only, has no actual-descent or selector premise, and does not establish the universal guarded comparison.

### `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS`

The exact-ratio condition remains open. Its reduction is directionally valid: the main-product likelihood-ratio inequality and the order-`h` ULC curvature bound give

```text
M_k(U_i) >= ((h+1)/((k+1)(h-k+1))) U_i[k] C[k].
```

Here `h-N=1+a3+3a4>=1`, and on `1<=k`, `2k<=N+2`, both `k+1` and `h-k+1` are positive. Thus multiplying the lower bound by the positive denominator preserves its direction. Adding the exact E minor gives precisely the registered sufficient condition. It is sufficient for the full individual tip comparison, not necessary, and it says nothing by itself about endpoint `A0`. The same-C inequalities sum with positive original weights `r_i`; no arbitrary different-denominator LR closure is used.

The proposed crude replacement has the correct direction but is too weak. Since `C[k]/C[k-1] >= 2(N+2-k)/(3k)>0`, taking reciprocals reverses the inequality; multiplying by positive `E[k]` preserves the resulting lower bound on the E minor. After clearing positive factors, the proposed crude margin is

```text
2(N+2-k)(h+1)U_i[k] - E[k](N-k-1)(k+1)(h-k+1).
```

At counts `(0,0,4)`, `N=16`, `h=29`, represented arity `r=4`, `k=8`, this crude margin is `-87840`, while the exact-ratio surplus margin is `45380234160`. This refutes the crude sufficient condition at that point, not the exact-ratio condition or the full tip minor. Independent exact checks also give positive exact margins at the guarded endpoint `N=2,k=1`, at interior `N=66,k=17`, and at its upper guarded rank `N=66,k=34`. These samples do not prove the universal surplus.

## Evidence limits

The E-only, activity-layer, and out-of-guard examples are mechanism controls, not full-target counterexamples. The weighted scan and exact-surplus evaluations are bounded computations. The ULC/convolution step remains source-dependent and informal at the stated evidence grade; this critique makes no Lean claim. The accepted selected payment remains computer-assisted at its existing exact scope, separate from these shifted-comparison arguments.
