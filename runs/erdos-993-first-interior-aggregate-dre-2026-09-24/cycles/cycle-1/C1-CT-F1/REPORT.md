# C1-CT-F1 constructive critique of C1-F1

## Dispositions

**C1-F1-001 — proposed retained, only at its stated all-rank shortcut scope.** The order-91 graph and rank 34 give a genuine positive favorable summand, `212336130412243110`, with a negative complete aggregate, `-498754180547001418536`. Here `alpha=68`, `x=32`, and `p=34=x+2`, while the frozen target rank is `alpha-2=66`. Thus the row refutes the proposed pointwise sign over all ranks satisfying `x+2<=p`; it does not refute the target-rank pointwise sign or the primary complete-sum inequality. The order-243 rank-90 row independently shows the same phenomenon but is not needed for the first refutation. The result agrees with the admitted historical account in `sources/public/experiments/r24-direct-favorable-leaf-aggregate.md` and with the scope warning in `control/SCOPE-AUDIT.md`.

**C1-F1-002 — proposed retained narrowed.** The primary target remains unresolved by this return. Both checked target rows are eligible and have negative complete sums, and the stated bounded sweep has zero eligible rows. The prose in `cycles/cycle-1/C1-F1/REPORT.md` says **275,392** labeled trees through orders 2–8, whereas the seven counts in `cycles/cycle-1/C1-F1/evidence.json` sum to **280,392**. Both copied-code replay and a separate exhaustive Prüfer implementation confirm 280,392. This corrects the sweep size without changing its zero-eligible conclusion. The exact checked scope is every labeled Prüfer sequence for each order 2, 3, 4, 5, 6, 7, and 8, plus two `T_m` target rows and two off-target interior rows. It supplies no universal sign proof or eligible positive complete sum. The r26 result cited by the worker is at `alpha-1` and assumes residuality (`sources/public/experiments/r26-top-rank-residual-sign.md`), so it does not close this target.

## Replay and independent verification

The seven origin files listed in `packets/C1-CT-F1.json` match their pinned SHA-256 digests. `cycles/cycle-1/C1-F1/ordinary_tree_copy.py` is byte-identical to the permitted `sources/standing-controls/ordinary_tree.py`. I copied the origin's `ordinary_tree_copy.py` and `summary.py` into this seat's scratch directory before running `python3 scratchpad/C1-CT-F1/summary.py > scratchpad/C1-CT-F1/copied-code-replay.json`. Parsed replay JSON equals the origin `cycles/cycle-1/C1-F1/evidence.json` exactly. This is a copied-code replay, not independent mathematical evidence.

For independence, `independent_check.py` uses a closed-form independence polynomial for `T_m`, distinct from the imported forest DP. Its order-91 rows give `(alpha,x)=(68,32)`. At target rank 66 the marked and each ordinary arm leaf have strict selector differences `-131` and `-67`; the respective summands are `-2079` and `-2208`. There are 1+66 distinct original-leaf tags, giving `-2079+66(-2208)=-147807`. At rank 34 the selector differences are `-24528898691191536776` and `-22537233346124540898`; the summands are `212336130412243110` and `-7560098737536570631`, giving the reported negative aggregate. The order-243 rows give `(alpha,x)=(182,87)`: at target rank 180 selector differences `-359,-181`, summands `-15930,-16287`, and complete sum `-2947590`; at rank 90 selector differences are again both strictly negative and the summands and complete sum match the origin evidence digit for digit. In each row the marked leaf plus `3m` arm leaves exhaust the graph's original leaves. No support quotienting occurs.

The same independent script runs every one of the `n^(n-2)` Prüfer words for each `2<=n<=8`, builds its own adjacency bitsets, enumerates every vertex subset with an independent-set recurrence, and tests the contract's `x+2<=alpha-2` using integer coefficients through the terminal `Delta_alpha<0`. Per-order processed counts are `1,3,16,125,1296,16807,262144`, total `280392`; eligible counts are zero at every order. The Prüfer bijection proves this is a complete **labeled** enumeration in the stated range, not a universal tree result. The exact machine output is `independent_results.json`.

## Constructive family repair: C1-CT-F1-001

There is a stronger exact family statement: for every integer `m>=2`, the `T_m` tree is eligible at the frozen target rank `p=alpha(T_m)-2=3m`, all `3m+1` original leaves are favorable, and its complete sum is strictly negative. This statement is about this one infinite family, not all trees.

To prove it, use the explicit graph in `sources/standing-controls/ordinary_tree.py`: vertices are a root `r`, one marked path `r-a-b`, and `m` disjoint arms `r-c_j` with three leaves at each `c_j`. It is connected with `4m+3` vertices and `4m+2` edges, hence a tree. Put `A(z)=1+4z+3z^2+z^3` and `B(z)=1+3z+z^2`. Splitting independent sets by whether `r` is selected gives

`I(T_m;z)=(1+2z)A(z)^m+z(1+z)^(3m+1)`.

The second term has positive leading coefficient at degree `3m+2`, so `alpha=3m+2`. To verify eligibility, let `a_j` be the coefficient of `z^(3m-j)` in `A^m`. Then `a_1=3m`, `a_2=4m+9*C(m,2)`, and `a_3=m+12m(m-1)+27*C(m,3)`. Direct coefficient subtraction at rank `3m-2` gives

`Delta_(3m-2)(T_m) = m(-18m^2+15m+13)/2 + C(3m+1,3)-C(3m+1,4) < 0` for `m>=2`.

The first term is negative for `m>=2`; the binomial difference is nonpositive because `3m+1>=7`. Consequently `x<=3m-2` and `x+2<=p`.

For the marked leaf `b`, deletion gives `I(T_m-b)=(1+z)A^m+z(1+z)^(3m)`, and `I(H_b)-I(R_b)=z(1+z)^(3m)`. Thus `Delta_p(T_m-b)=1-6m<0` and its summand is `g_b=3m-C(3m,2)<0`. For any arm leaf `u`, deletion gives `I(T_m-u)=(1+2z)B A^(m-1)+z(1+z)^(3m)`, and the original-support deletions give `I(H_u)-I(R_u)=(2z+5z^2+2z^3)A^(m-1)+z(1+z)^(3m)`. Thus `Delta_p(T_m-u)=-3m-1<0` and `g_u=3-3m-C(3m,2)<0`. All `3m` arm leaves are distinct favorable tags, so

`S(T_m,3m)=[3m-C(3m,2)]+3m[3-3m-C(3m,2)]<0` for every `m>=2`.

This proof uses exact generating functions and binomial identities; the numeric script checks instances but is not the justification of the quantified claim. It repairs the two-instance observation into a family result. It does not transfer to arbitrary trees, and the inherited refutations of universal pointwise and support-fibre signs in `control/REJECTED-MECHANISMS.json` remain intact. Hall and raw edge-addition fences concern other mechanisms and are not premises of this calculation.

## Limits and commands

Run from the run root:

`python3 scratchpad/C1-CT-F1/summary.py > scratchpad/C1-CT-F1/copied-code-replay.json`

`python3 scratchpad/C1-CT-F1/independent_check.py > scratchpad/C1-CT-F1/independent_results.json`

The two examples and bounded sweep do not prove the universal target. The new family lemma covers only `T_m` with `m>=2`. No Lean build or remote edit was performed. Both owned replay processes exited successfully; no background jobs remain.
