# C3-F1 Stage 3 Return

## Packet, Route, And Verdict

Allocation `c3-f1` was used only for logical route
`C3-F1-TM-COUPLED-CLOSURE`.  Deleting the manifest's top-level
`seal_sha256`, recursively sorting keys, and serializing compact JSON with no
trailing newline gives
`e4104d01ac1ee080e36481d67c7a6784a2eb18295a5dca545a4e20ccfdfcb36d`.
All 54 allowed reads matched both their sealed byte counts and SHA-256 values
before semantic use.  No unlisted source, memory, sibling scratchpad, live
registry, web source, or external mathematical material was read.

Terminal route verdict: `partial`.

The construction-level polynomial reduction is proved below.  The requested
all-parameter selector and coupled-sign conclusion is not proved: it reduces
to an explicit three-part coefficient-ratio package for which this packet
contains extensive exact evidence but no universal argument.  No exact
selector or aggregate counterexample was found.

## Governed Construction And Definitions

For `m>=1`, `T_m` has root `y`, one path `y-s-v_0`, and `m` centers
`c_1,...,c_m` adjacent to `y`, each `c_i` carrying three leaves.  Put

```text
A = 1+4X+3X^2+X^3 = (1+X)^3+X,
B = (1+X)^3,
C = 1+3X+X^2 = (1+X)^2+X,
E = X(1+2X)(2+X) = X(2+5X+2X^2).
```

For a zero-extended polynomial `P`, write
`Delta_r P=[X^(r+1)]P-[X^r]P`.  Let `M_0=I(T_m-v_0)`, let
`M_*=I(T_m-u)` for any star leaf `u`, and let `x(T_m)` be the least `r`
with `Delta_r I(T_m)<0`.

The maximum independent set has size `alpha(T_m)=3m+2`: if `y` is absent,
the marked edge contributes at most one and the stars contribute at most
`3m`; if `y` is present, `s` and every `c_i` are absent and `y`, `v_0`, and
all `3m` star leaves form an independent set.  Both deletion polynomials have
degree `3m+1=alpha(T_m)-1`; hence every `p>=alpha(T_m)` has `a_0=a_*=0`
and an empty favorable selector.  Ranks above `alpha(T_m)` are closed
trivially as well.

## Construction-Level Polynomial Derivation

Split independent sets according to whether `y` is absent or present.
When `y` is absent, the marked component is an edge with polynomial
`1+2X`, and each star is `K_(1,3)` with polynomial `A`.  When `y` is
present, its contribution is `X`, the marked leaf contributes `1+X`, and
the `3m` star leaves contribute `B^m`.  Hence, for every `m>=1`,

```text
I_m = I(T_m) = (1+2X)A^m + X(1+X)B^m.                 (1)
```

After deleting `v_0`, the root-absent marked component is the isolated
vertex `s`, while the root-present branch has no marked-leaf factor.  Thus

```text
M_0 = (1+X)A^m + XB^m.                                (2)
```

After deleting one star leaf `u`, its root-absent branch is `K_(1,2)` with
polynomial `C`; in the root-present branch there remain `3m-1` star leaves
and `v_0`, hence again `XB^m`.  Therefore

```text
M_* = (1+2X)CA^(m-1) + XB^m.                          (3)
```

For the marked support, `I(T_m-{v_0,s})-I(T_m-N[s])=XB^m`: the difference
selects the root-containing independent sets.  For a star support `c`,
deleting `{u,c}` leaves its other two leaves isolated, whereas deleting
`N[c]` removes those leaves and the root.  Direct subtraction gives

```text
I(T_m-{u,c})-I(T_m-N[c])
  = (1+2X)((1+X)^2-1)A^(m-1) + X(1+X)^3B^(m-1)
  = EA^(m-1) + XB^m.                                  (4)
```

Consequently

```text
a_0 = Delta_p M_0,
a_* = Delta_p M_*,
g_0 = Delta_(p-1)(XB^m),
g_* = Delta_(p-1)(EA^(m-1)+XB^m),
S_F = 1[a_0<0]g_0 + 3m*1[a_*<0]g_* .                 (5)
```

This discharges the predecessor's graph-realization gap for the displayed
polynomials.  It does not discharge their signs.

## Exact Coupled Face

Let `delta=3m-2p+3`.  The inherited adjacent-binomial calculation gives

```text
g_0 = delta/(p-1) * binom(3m,p-2).
```

With

```text
L_(m,j)=X^j E B^(m-1-j),
D_(m,j)(p)=Delta_(p-1)L_(m,j),
A^(m-1)=sum_j binom(m-1,j)X^jB^(m-1-j),
```

one has `g_*=g_0+sum_j binom(m-1,j)D_(m,j)(p)`.  Therefore, whenever both
leaf types are favorable, the requested expression is exactly

```text
(3m+1)g_0 + 3m sum_j binom(m-1,j)D_(m,j)(p)
  = Delta_(p-1)K_m,                                   (6)

K_m=(3m+1)XB^m+3mEA^(m-1).
```

This is a genuinely coupled expression.  No termwise slice sign and no
separated sign for the residual in the operator identity is used.

## Ratio-Control Reduction

Write `i_r=[X^r]I_m`, `q_r=[X^r]K_m`,
`d^0_r=[X^r]M_0`, and `d^*_r=[X^r]M_*`.  The following package is sufficient
at every nonterminal eligible rank:

```text
(R-I)  i_(r+1) < i_r                    for x(T_m)<=r<alpha(T_m),
(R-0)  d^0_(r+1)i_r <= d^0_r i_(r+1)   for x(T_m)<=r<alpha(T_m),
(R-*)  d^*_(r+1)i_r <= d^*_r i_(r+1)   for x(T_m)<=r<alpha(T_m),
(R-K)  q_r i_(r-1) <= q_(r-1)i_r       for x(T_m)+1<=r<=alpha(T_m).
```

Indeed, all in-support coefficients are positive.  From `(R-I)` and `(R-0)`
at `r=p`,

```text
d^0_(p+1)i_p <= d^0_p i_(p+1) < d^0_p i_p,
```

so `a_0=d^0_(p+1)-d^0_p<0`; `(R-*)` gives `a_*<0` identically.  At and above
the top rank both relevant deletion coefficients vanish, so the selector is
empty.  From `(R-I)` at `r=p-1` and `(R-K)` at `r=p`,

```text
q_p i_(p-1) <= q_(p-1)i_p < q_(p-1)i_(p-1),
```

hence `Delta_(p-1)K_m=q_p-q_(p-1)<0`.  Thus this package would classify every
`delta>=3` selector and prove the positive-chamber coupled inequality, while
also recovering the inherited chambers.

The packet does not contain a proof of `(R-I)`, `(R-0)`, `(R-*)`, or `(R-K)`
for all `m`.  Treating the observed log-concavity or determinant signs as a
theorem would merely move the missing universal inequality into a new name.

## Fresh Prefrozen Falsification

Before measurement, `evidence/FRESH-FALSIFICATION-TARGET.json` froze
`513<=m<=2048`, every eligible rank, all coefficient ranks for the listed
log-concavity tests, and the post-crossing `K_m/I_m` determinant test.  The
exact-integer program `evidence/coupled_closure_falsifier.py` then checked
`3,060,224` eligible ranks, of which `108,032` have `delta>=1` (maximum
observed `delta=226`).  It found:

```text
both selectors: 3,058,688
empty top selectors: 1,536
marked-only or star-only selectors: 0
positive aggregate or positive coupled expression: 0
later positive Delta I_m: 0
log-concavity failures in I_m, M_0, M_*, K_m: 0
post-crossing positive K_m/I_m determinant: 0
```

The result SHA-256 is
`3a071cdea57514337f893f86fd80c3e69d62f67187e92096dce0a62895883dc3`.
It extends the inherited symbolic diagnostics but remains bounded evidence.

## Adversarial Checks And Fences

1. `m=1`, zero-extended endpoints, parity of `delta`, and
   `p>=alpha(T_m)=3m+2` are included.  Every such selector is empty.
2. The inherited `(m,p)=(31,47)` record has a positive `j=0` slice while the
   coupled aggregate is negative.  Thus termwise slice negativity remains
   `REFUTED` at that exact mechanism scope.
3. The inherited `(m,p)=(6,12)` record has
   `i_11+Delta_11 R_6=-27384<0` while the aggregate is negative.  Thus the
   separated operator guard remains `REFUTED` at that exact mechanism scope.
4. The order-91 and order-243 anchors have positive individual margins but
   negative global favorable-leaf aggregates.  They refute neither this
   `T_m` family closure nor `E993-BETA-AGG`.
5. No mechanism obstruction found here is represented as a target
   refutation.  No new refutation is claimed.

## Dependency DAG And Lean-Ready Faces

The dependency DAG is complete for the candidate closure:

```text
D0  governed graph definition of T_m                         [input]
D1  (1)-(4), construction-level polynomial faces            [proved here from D0]
D2  (5)-(6), selector and coupled-coefficient semantics      [proved from D1]
D3  inherited binomial slice identity and delta sign law     [admitted sealed predecessor]
D4  (R-I), strict post-crossing tail for I_m                 [OPEN]
D5  (R-0) and (R-*), deletion/tree ratio inequalities        [OPEN]
D6  (R-K), coupled K_m/tree ratio inequality                 [OPEN]
D7  selector classification for delta>=3                     [D2,D4,D5; blocked by D4,D5]
D8  coupled inequality for delta>=1                          [D2,D4,D6; blocked by D4,D6]
D9  all-m T_m favorable-leaf aggregate closure               [D3,D7,D8; OPEN]
```

No node depends on `E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT`, a full-cut
equivalent, termwise slice negativity, or the separated operator guard.

Lean-ready declaration face for the proved construction candidate (names of
the graph constructors must be bound by a later theorem contract):

```lean
theorem tm_graph_polynomial_faces (m : Nat) (hm : 1 <= m) :
    ipoly (Tm m) = (1 + 2 * X) * A ^ m + X * (1 + X) * B ^ m /\
    ipoly ((Tm m).delete (markedLeaf m)) =
      (1 + X) * A ^ m + X * B ^ m /\
    ipoly ((Tm m).delete (starLeaf m)) =
      (1 + 2 * X) * C * A ^ (m - 1) + X * B ^ m /\
    starMarginPoly m = E * A ^ (m - 1) + X * B ^ m := by
  ...
```

Lean-ready declaration face for the elementary implication isolated above:

```lean
theorem tm_rank_closure_of_ratio_control
    (iPrev iCur iNext d0Cur d0Next dsCur dsNext qPrev qCur : Rat)
    (hiPrev : 0 < iPrev) (hiCur : 0 < iCur)
    (hd0 : 0 < d0Cur) (hds : 0 < dsCur) (hqPrev : 0 < qPrev)
    (hTail0 : iCur < iPrev) (hTail1 : iNext < iCur)
    (hD0 : d0Next * iCur <= d0Cur * iNext)
    (hDs : dsNext * iCur <= dsCur * iNext)
    (hK : qCur * iPrev <= qPrev * iCur) :
    d0Next < d0Cur /\ dsNext < dsCur /\ qCur < qPrev := by
  ...
```

These are informal candidates only.  No Lean source was produced or built,
and no formal verification is claimed.

## Claim Identity And Ceiling

`E993-BETA-TARGET` remains `REFUTED` at pointwise scope.
`E993-BETA-AGG-SUPPORT` remains `REFUTED` at per-support scope.
`E993-BETA-AGG` remains `OPEN`.  The present route proves neither an arbitrary
RTree aggregate theorem nor Erdos #993.

Ceiling: graph-level formulas (1)-(5) are proved informally for every `m>=1`,
and the ratio package is proved sufficient for the requested closure.  The
universal ratio package itself is open.  The `m<=2048` evidence is exact and
replayable but computational.  Therefore the all-parameter selector
classification, coupled inequality, and `T_m` family theorem are not awarded.
