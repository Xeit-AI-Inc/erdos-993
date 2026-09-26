# Exact fixed-alpha kernel and same-support compression

## Claim and scope

For every fixed independence number `a`, the ordinary-tree search domain is finite and admits an exact finite profile representation that preserves the original `x`, eligibility, fixed selector, and complete tagged sum. More precisely, every tree with `alpha(T)=a` has at most `2a` vertices. For every original support `s`, all original leaves adjacent to `s` have the same selector value and the same summand. Consequently they may be represented by one support profile with an explicit multiplicity, with no loss of distinct leaf tags. This is a parameterwise finite reduction only; it is not a finite kernel uniform in `a`, and it does not prove the registered inequality.

## Proof of the order bound

Every tree is bipartite. If its two color classes are `A,B`, each class is an independent set, so `|A|<=alpha(T)=a` and `|B|<=a`. Therefore `|V(T)|=|A|+|B|<=2a`. Up to isomorphism there are finitely many ordinary trees on at most `2a` vertices. Thus for a fixed `a` (and fixed eligible `p`) exhaustive enumeration is a sound finite decision procedure if each candidate is checked using the original definitions. The procedure cannot be promoted to the universal statement because `a` is unbounded.

## Same-support profile proof

Fix an original support vertex `s` and two original leaves `v,w` adjacent to `s`. The permutation exchanging `v` and `w` and fixing every other vertex is an automorphism of `T`. Hence `T-v` and `T-w` are isomorphic, so `Delta_p(T-v)=Delta_p(T-w)`. The strict predicate defining `F(T,p)` therefore selects either every original leaf at `s` or none of them.

The same automorphism maps `T-{v,s}` to `T-{w,s}`. Also `T-N_T[s]` is independent of which leaf at `s` is named. Thus the summand

`tau_s = Delta_(p-1)(T-{v,s}) - Delta_(p-1)(T-N_T[s])`

is common to every leaf at `s`. If `m_s` is the number of original leaves at `s`, their complete contribution is exactly `m_s*tau_s` when `Delta_p(T-v)<0`, and zero otherwise. This multiplication preserves all distinct tags; it does not replace them by a single summand of weight one.

An exact local record can therefore store `m_s`, the value of `Delta_p(T-v)` (or its sign plus exact value), and the coefficient differences needed for `tau_s`. To retain the full primary guards, the record is accompanied by the original tree independence polynomial through rank `a+1` (including zero extension), from which `x(T)` is computed through rank `a`, and by the original `a,p`. Since there are finitely many trees of order at most `2a`, only finitely many such records occur for fixed `a`.

## Boundary and missing bridge

This reduction narrows any counterexample search at a specified `a` to a finite list, while preserving strict descent, the strict lower-region guard, the original selector, and every same-support leaf tag. It supplies no useful bound on `a`, no finite catalog across all `a`, and no sign control on the sum of the support-profile contributions. A positive support profile can be offset by other selected supports, so this is not a refutation criterion. The primary target remains unresolved by this result.
