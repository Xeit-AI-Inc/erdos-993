# C2-CU-T2 critique: interior eligibility guard

**Proposed disposition:** retain `C2-T2-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` at its exact scope. I found no missing hypothesis or arithmetic failure. This is an auxiliary guard; it does not establish the tagged-shadow inequality or the primary aggregate.

## Source and meaning audit

The assigned `cycles/cycle-2/C2-T2/{REPORT.md,RETURN.json,checks.py,checks.out.json}` and the r27 `source/LeanProof/Main.lean` and `VERIFICATION-REPORT.md` matched their hashes in `packets/C2-CU-T2.json` and the historical common-source list `packets/C2-T1-v2.json`. The r27 package is `proposals/cycle2/latest-code/packages/r27-c1-la4-descent-order-bounds/`. Its source declares `indepCount G k` as the integer cast of the cardinality of independent `k`-sets (line 14), `coeff` with zero extension at negative integer indices (line 24), and `delta G k = coeff G (k+1)-coeff G k` (line 34). The exact arbitrary-rank lemma (lines 1458–1460) is

`[Finite X], G.IsAcyclic, delta G (k:ℤ)<0 ⟹ Nat.card X≤4*k`.

The package verification report says `formally_verified`; I did not perform a Lean build. A finite ordinary tree has a finite carrier, is acyclic, and its `Delta_x<0` is exactly that integer `delta` premise. The argument applies the arbitrary-rank lemma directly at the natural `x`, so it does not rely on a Nat-subtraction reading of the separate r27 restriction theorem. `firstDescent` in the same source is `Nat.find` of a strict negative difference (lines 345–346); the origin needs only the contract's defining fact `Delta_x<0`, not a shifted rank or a no-recovery hypothesis.

## Independent proof audit

Write `a=alpha(T)`, `n=|V(T)|`, `p=a-2` in integers. Eligibility gives `x+2≤a-2`, hence `x+4≤a`. In particular `a≥4`, so the connected tree has an edge. A maximum independent set cannot contain both endpoints; thus `n≥a+1`. The imported r27 lemma gives `n≤4x`. If `a≤6`, these imply

`a+1≤n≤4x≤4(a-4)`, hence `17≤3a` and therefore `a=6`.

Then `x≤2`, while `n≥7` and `n≤4x` force `x≥2`. Thus `x=2` and `n∈{7,8}`, with `Delta_2<0` required. There are no larger graphs in this contradictory low-alpha case: `n≤4x≤8` is a mathematical bound, not an inference from a finite sweep.

For an `n`-vertex tree set `S=Σ_u C(deg(u),2)`. The `n-1` edges remove exactly that many pairs, giving `i_2=C(n-1,2)`. For triples, there are `(n-1)(n-2)` edge/triple incidences. Every triple containing two edges is a length-two path (no triangle), counted twice, and exactly `S` such triples exist. Hence `i_3=C(n,3)-(n-1)(n-2)+S`, and exact integer subtraction gives

`Delta_2=((n-1)(n-2)(n-9))/6+S`.

At `n=7`, the complement of a six-vertex independent set is a one-vertex cover. Its vertex meets all six edges, so `S≥C(6,2)=15` and `Delta_2≥-10+15=5`. At `n=8`, that complement is a two-vertex cover `{u,w}`. Every edge meets it, so `t=deg(u)+deg(w)≥7` (an edge `uw`, if present, only increases this sum). With nonnegative integer degrees `d,e`, `C(d,2)+C(e,2)≥t(t-2)/4≥35/4`, so integrality gives `S≥9` and `Delta_2≥-7+9=2`. Both contradict `Delta_2<0`. The origin's displayed lower bounds are correct; the exact order-eight minimum among `alpha=6` trees is three, stronger than needed.

This also checks the potential ambiguity of `alpha=6` versus `alpha≥6`: the inequality first forces equality under the assumed `a≤6`. No residuality, leaf selector, or favorable-leaf hypothesis is being smuggled into this guard. The conclusion is precisely `alpha≥7`, at ordinary connected trees and first strict descent.

## Independent finite and larger check

I wrote `scratchpad/C2-CU-T2/audit.py` from scratch. Prüfer-code enumeration covered all `7^5=16,807` labeled order-seven trees and `8^6=262,144` labeled order-eight trees. It detected covers of size at most `n-6`, computed `Delta_2` both from the degree formula and by direct pair/triple enumeration for every such tree, and asserted strict positivity. Order seven has seven such labeled trees and minimum five. Order eight has 6,784 with a cover of size at most two and minimum three. Exactly eight of those are stars with `alpha=7`; the remaining 6,776 are the origin's `alpha=6` cases. This reproduces the origin's figures without running its script. The finite run corroborates the proof; it does not replace it.

A fresh larger eligible target is the 13-vertex double star with centers `0--1`, leaves `2..5` at center 0 and leaves `6..12` at center 1. Direct independent-subset enumeration gives coefficients `[1,13,66,192,369,498,483,337,166,55,11,1,0,0]`, `alpha=11`, `x=5`, `p=9`, and `x+2=7≤9`. Every one of its 11 original leaves has `Delta_9(T-v)=-9<0` and summand `-35`; the complete tagged sum is `-385`. This is a fresh sanity/falsification target for the larger eligible setting, not a proof of the aggregate or high-tail pointwise mechanism. Its full edges, selectors, and summands are in `audit.out.json`.

The inherited `sources/standing-controls/t22-order91.json` and `t60-order243.json` report positive marked local margins at ranks 34 and 90, respectively, while their `alpha` values are 68 and 182. Thus their recorded ranks are **not** the first-interior ranks 66 and 180. Their marked local margins cannot refute this low-alpha eligibility guard or the proposed high-tail statement. Their reported complete sums at the recorded ranks are negative. The controller's `(alpha,p)=(5,3),(6,4)` boundary examples cited in `control/C2-SCOPE-AUDIT.md` fail the eligibility guard and are not target counterexamples. None of these fences supplies a counterexample to the exact claim reviewed here.

Replay from the run root:

```sh
python3 scratchpad/C2-CU-T2/audit.py > scratchpad/C2-CU-T2/audit.out.json
```

This command completed with all assertions passing. No Lean build, remote/master write, background job, or subagent was used; no owned job remains.
