# C2-CF-T2 F critique of C2-T2

**Proposed disposition:** retain `C2-T2-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` at its exact stated auxiliary scope. I tried to falsify the carrier transport, the order reduction, and the two cover bounds. Each step survives. This is a critique disposition, not a registry award or a proof of the favorable-leaf aggregate.

## Authority and exact face

The incoming source is `cycles/cycle-2/C2-T2/{REPORT.md,RETURN.json,checks.py,checks.out.json}`, pinned by `packets/C2-CF-T2.json`; their SHA-256 values match that packet. The common historical source is admitted via `packets/C2-T1-v2.json`. In particular, `proposals/cycle2/latest-code/packages/r27-c1-la4-descent-order-bounds/source/LeanProof/Main.lean` entry 69 states

```
lemma forest_descent_linear_bound {X : Type u} [Finite X] (G : SimpleGraph X) (hG : G.IsAcyclic)
    (k : ℕ) (hneg : Erdos993G1.delta G (k : ℤ) < 0) : Nat.card X ≤ 4 * k
```

There is no hidden `DlHyp`, connectivity, lower-rank, or `k>0` premise. Entries 1–3 define `indepCount` as the cardinality of independent `k`-finsets, `coeff` as its integer-indexed zero extension, and `delta G k = coeff G (k+1)-coeff G k`. For a finite tree at natural `x`, this is exactly the semantic-contract `Delta_x`. The `firstDescent` definition at entry 21 is `Nat.find` on a strict negative `delta` predicate, with `firstDescent_spec` at entry 63. The source digest is `dcecb681d019a29c625dcea1a2385de920fffa6b8f185e79372f31ae547c1936`, matching the pinned case and the canonical r27 kernel receipt. The pinned `VERIFICATION-REPORT.md` records `formally_verified` with passed kernel and fidelity reviews; this critic ran no Lean build. Entry 69 can be applied directly at `k=x` without invoking the natural-subtraction `(XR)` face.

## Attempted falsification and proof audit

Write `a=alpha(T)`, `n=|V(T)|`, and the **integer** `p=a-2`. Eligibility `x+2<=p` gives `x+4<=a`. Thus `a>=4`. A connected tree with this independence number has an edge, so a maximum independent set omits a vertex and `n>=a+1`. If `a<=6`, r27 at the actual negative rank `x` gives `n<=4x<=4(a-4)`. Therefore `a+1<=4a-16`, or `17<=3a`, forcing `a=6`. Now `x<=2`, while `7<=n<=4x` forces `x=2` and `n` to be exactly 7 or 8. This is a **universal structural bound in the contradiction case**: a larger tree with `a<=6` cannot be eligible, so there is no larger in-scope low-alpha graph to hunt for. The order bound alone does not exclude eligible trees with `a>=7`.

For an `n`-vertex tree, `i_2=binom(n,2)-(n-1)=binom(n-1,2)`. Counting incidences of edges with triples gives `(n-1)(n-2)`. A triple can contain two edges only as a length-two path, counted once in `S=Σ_z binom(deg z,2)`; it cannot contain three edges because the graph is acyclic. Inclusion-exclusion therefore yields `i_3=binom(n,3)-(n-1)(n-2)+S` and the exact integer identity `6 Delta_2=(n-1)(n-2)(n-9)+6S`.

At `n=7`, the complement of an independent six-set is one vertex and covers all six edges. Its degree is six, hence `S>=15` and `Delta_2>=-10+15=5`. At `n=8`, the two-vertex complement `{u,w}` covers all seven edges. Every edge contributes to `deg u+deg w` at least once, even if `uw` is itself an edge, so `t=deg u+deg w>=7`. The inequality `d²+e²>=t²/2` gives `binom(d,2)+binom(e,2)>=(t²-2t)/4>=35/4`; since the left side is integral, it is at least 9. Thus `S>=9` and `Delta_2>=-7+9=2`. Both contradict the required strict `Delta_x=Delta_2<0`. The cover argument uses a **maximum** independent six-set, not merely a maximal one; its complement really is a vertex cover.

I copied the incoming `checks.py` to my scratch as `replay_checks.py` and executed the copy, obtaining `replay_checks.out.json` byte-for-byte equal to the incoming output. That enumerates all `7^5=16,807` labeled order-7 trees and `8^6=262,144` labeled order-8 trees, with zero eligible trees of `alpha<=6`; the minimum observed `Delta_2` among `alpha=6` trees is 5 and 3, respectively. These finite results corroborate, but do not replace, the universal argument. My separate `critic_checks.py` reproduces the algebraic cover floors 5 and 2 and tests a fresh larger tree `K_{1,11}` of order 12, with center 0 and edges `{(0,j):1<=j<=11}`. Here `alpha=11`, `x=6`, `p=9`, so `x+2=8<=9`. Each original leaf is favorable because `Delta_9(T-v)=-9`; each local summand is `binom(10,9)-binom(10,8)=-35`, and the **complete** eleven-tag sum is `-385`. At tagged rank `k=8`, `q_8=45`, `q_9=10`, and the proposed shadow inequality reads `80<=180`. This is an in-scope consistency check of the broader proposed mechanism, not a proof of it or of the primary aggregate.

Inherited fences remain intact. `T_22` has `(alpha,p)=(68,34)` and `T_60` has `(182,90)` in the standing controls, so neither challenges this `alpha>=7` guard; their positive local margins are below the separate high-tail rank guard (`102<137` and `270<365`) and say nothing about a positive complete eligible sum. The proposed `m=3,4` boundary instances have `alpha=5,6` but fail eligibility, as recorded in `control/C2-CAPSULE-AND-COUNTEREXAMPLE-GATE.md` and `control/C2-SCOPE-AUDIT.md`. Neither the r26 residual top-rank result nor any residuality assumption enters this proof. The tagged-shadow count inequality, high-tail pointwise sign, and primary complete aggregate still need separate proofs or counterexamples.

## Replay and limits

From the run root, execute `python3 scratchpad/C2-CF-T2/replay_checks.py > scratchpad/C2-CF-T2/replay_checks.out.json` and `python3 scratchpad/C2-CF-T2/critic_checks.py > scratchpad/C2-CF-T2/critic_checks.out.json`. Both completed with assertions passing. The copied enumerator checks only orders 7 and 8. The fresh star checks one larger eligible tree. No background job remains; no Lean build, remote action, master edit, or sibling return was used.
