# C3-F2 Heterogeneous Compensation Return

Route: `C3-F2-HETEROGENEOUS-COMPENSATION`  
Claim: `E993-BETA-AGG`  
Terminal route verdict: `partial`

## Exact Scope And Fences

This return concerns only the frozen family `H(c_1,c_2,c_3,c_4)` of one
root, one marked length-two arm, and `c_k` additional root branches with a
support carrying `k` leaves, for arbitrary nonnegative integer counts.  It
does not reopen `E993-BETA-TARGET` (REFUTED) or
`E993-BETA-AGG-SUPPORT` (REFUTED).  In particular, a positive individual or
per-support margin is not a positive favorable-leaf aggregate.

For an exact partition that avoids the earlier orbit terminology error, put

```text
n_1 = c_1 + 1, and n_k = c_k for k = 2,3,4.
```

Thus all arity-one branches, including the marked arm, are one true type.
Equivalently, one may label these `n_1` branches separately; all formulae
below give the same value for each labelled arity-one leaf.

## Root-Conditioned Formulas

Let `z` be the polynomial variable and define

```text
J_k(z) = (1+z)^k
E_k(z) = J_k(z) + z
L       = sum_{j=1}^4 j n_j
A(z)    = product_{j=1}^4 E_j(z)^n_j
A_-k(z) = product_{j=1}^4 E_j(z)^(n_j - 1_{j=k}).
```

For any arity `k` with `n_k > 0`, root conditioning gives these exact
independence polynomials:

```text
I_H(z)       = A(z) + z(1+z)^L
I_(T-v)(z)   = E_(k-1)(z) A_-k(z)
               + z J_(k-1)(z) (1+z)^(L-k)
I_(T-{v,s})(z)
              = J_(k-1)(z) [A_-k(z) + z(1+z)^(L-k)]
I_(T-N[s])(z)= A_-k(z).
```

Here `v` is any original leaf below a type-`k` support `s`.  Consequently,
with the governed zero-extended difference convention,

```text
a_k(p) = Delta_p(I_(T-v))
b_k(p) = Delta_(p-1)(I_(T-{v,s}))
B_k(p) = Delta_(p-1)(A_-k)
g_k(p) = b_k(p) - B_k(p).
```

The target aggregate on this family is therefore the exact coefficient
inequality

```text
S_F(H,p) = sum_{k=1}^4 k n_k 1[a_k(p)<0] g_k(p) <= 0.
```

This is a true support-multiplicity reduction: there are no hidden orbit
weights, and it is uniform in all four nonnegative counts.  It is not yet a
proof of the displayed inequality.

## Derivation And Dependency Audit

1. If the root is excluded, a type-`k` branch contributes `E_k`: either its
   support is absent and its `k` leaves are arbitrary, or the support is
   present and all its leaves are absent.  Their product is `A`.
2. If the root is included, every support is absent and all `L` original
   leaves are arbitrary, giving `z(1+z)^L`.
3. Deleting an original leaf changes the chosen branch from type `k` to
   type `k-1`; separating root-excluded and root-included cases gives
   `I_(T-v)` above.
4. Deleting the leaf and its support makes the remaining `k-1` leaves
   isolated, yielding the factor `J_(k-1)` in `I_(T-{v,s})`.
5. Deleting the closed support neighborhood also deletes the root, so the
   remaining branches are disjoint and contribute `A_-k`.
6. Applying the defined coefficient differences produces `a_k`, `b_k`,
   `B_k`, and `g_k`; each type has exactly `k n_k` original leaves.  Summing
   only the types selected by `a_k(p)<0` gives `S_F`.

Dependency DAG:

```text
D0: frozen H construction and governed zero-extension
 -> D1: branch factors J_k and E_k
 -> D2: root-conditioned I_H
 -> D3: three deletion-polynomial identities
 -> D4: coefficient profiles a_k, b_k, B_k, g_k
 -> D5: exact labelled aggregate sum S_F
 -> D6: required cross-type selector inequality S_F <= 0.
```

`D0` through `D5` are derived above.  `D6` is not discharged: it requires a
new inequality coupling the indicators `1[a_k(p)<0]` with the four signed
`g_k(p)` values.  Substituting the target inequality as an assumption, using
a full-cut equivalent, or claiming that every summand is nonpositive would
not be a derivation of `D6`.

No theorem candidate is submitted for Lean: the route has not proved `D6`.
If a later route closes `D6`, its declaration must quantify over
`n_1,n_2,n_3,n_4 : Nat`, a selected `k : Fin 4`, the governed `H` graph
constructor, all zero-extended coefficient differences, and the exact
selector-weighted aggregate shown above.  This return makes no Lean or
formal-verification claim.

## Adversarial Checks

The frozen fresh target in `evidence/fresh-target.json` was recorded before
measurement.  `evidence/heterogeneous_ray_probe.py` then used the displayed
formulas and exact integer coefficients on four rays, each with `1 <= m <=
128`:

```text
(c_1,c_2,c_3,c_4) = (0,0,m,0), (3,0,m,0),
                      (0,4,m,3), (5,5,m,5).
```

It evaluated all 512 configurations and 91,907 eligible ranks.  There were
zero records with `S_F > 0`.  The closest nonempty aggregate was `-14` at
`H(0,0,1,0)`, `p=4`.  A second execution was byte-identical; the result hash
is `e83b6fe5e799fa198879f57674649cf452a1567a80f0386d1e11ee25e64d9589`.

As a formula sanity check, the same calculation exactly reproduces the
already governed `T_22` anchor at counts `(0,0,22,0)` and `p=34`:

```text
x(T)=32, K_A=2, a_1=-24528898691191536776,
g_1=212336130412243110, favorable leaves=67,
S_F=-498754180547001418536.
```

This also gives an exact mechanism obstruction.  The proposed termwise
mechanism

```text
for every H, eligible p, and arity k: a_k(p)<0 implies g_k(p)<=0
```

is false at that precise `T_22` tuple: `a_1<0` but `g_1>0`.  This is only a
refutation of the termwise-per-arity mechanism.  Its full aggregate remains
negative, so it is not a counterexample to `E993-BETA-AGG`.

## Limitations And Ceiling

The root-conditioned formulas reduce the arbitrary-count family to four
coefficient profiles, but no uniform cross-type compensation inequality has
been proved.  The 512-ray computation is bounded evidence, not a universal
theorem, and it supplies no `S_F>0` tuple.  Therefore this route neither
proves nor refutes `E993-BETA-AGG`, changes no claim identity or ledger, and
makes no formal-verification claim.

Terminal route verdict: `partial`.
