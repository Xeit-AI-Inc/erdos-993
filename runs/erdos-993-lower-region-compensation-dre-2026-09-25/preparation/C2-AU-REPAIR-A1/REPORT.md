# C2-AU-REPAIR-A1: proposed U-origin adjudication correction

**Authority and integrity.** This is a fresh, proposed worker addendum under the pinned adjudication policy, not an award or a replacement of any sealed file. All 83 paths listed in `control/C2-AU-REPAIR-A1.json` matched their specified SHA-256 hashes before substantive reading. I used only listed sources and this scratch directory. No Lean run, external theorem, census, registry change, or source edit is claimed. The self-contained correction below is intended for neutral synthesis without reopening routes or critics.

## 1. Exact set deletion and partition

Let `T` be an ordinary eligible first-shell tree, so `|T|=2p+2`, `x(T)+2<=p`, and `3p<2alpha(T)+1`. Fix **one original leaf tag** `v`, its original support `s`, and put `k=p-1`, `H=T-{v,s}`, `W=N_T(s)\{v}`, `R=T-N_T[s]=H-W`. Then `|H|=2k+2`. Each component of `H` has exactly one mark in `W`: different neighbors of `s` cannot be joined after deleting `s` in a tree, and every remaining component contains one such neighbor. In particular every isolate of `H` is marked.

Eligibility gives `p>=3`: `Delta_0(T)=|T|-1>0`, so `x(T)>=1`. An edgeless `H` would make `T` the star centered at `s`, with polynomial `(1+z)^(2p+1)+z` and first strict descent `p+1` for `p>=3`, contrary to `x+2<=p`. Thus choose a nonisolated component root `w_1` first; if an isolate exists, choose one as `w_2`; order the other marks arbitrarily.

For each index define **exactly**

`J_i = H - (N_H[w_i] union {w_1,...,w_(i-1)})`.

Only the *current* mark has its closed neighborhood removed. Earlier marks are deleted as vertices, while their neighbors remain unless they also lie in the current closed neighborhood. Every independent `j`-set of `H` meeting `W` has a unique earliest mark `w_i`; after deleting it, the rest is exactly an independent `(j-1)`-set of `J_i`. Consequently, with `q_j=i_j(H)-i_j(R)`, for `j>=1`,

`q_j = sum_i i_(j-1)(J_i)`, and

`g_v := Delta_k(H)-Delta_k(R) = q_(k+1)-q_k = sum_i b_i`, where `b_i=i_k(J_i)-i_(k-1)(J_i)`.

Zero extension handles absent layers. This identity is per original leaf tag; equal supports do not merge tags. The set `F(T,p)={v original leaf: Delta_p(T-v)<0}` stays fixed when these identities are summed.

## 2. Correct residual orders and positive-part estimate

The components of different marks are disjoint. For `i=1`, exactly `1+deg_H(w_1)` vertices are removed, so `|J_1|=2k+1-deg_H(w_1)`. It equals `2k` precisely when `deg_H(w_1)=1`, and is at most `2k-1` otherwise.

For `i=2`, a nonisolated `w_2` removes itself and at least one neighbor, in addition to earlier mark `w_1`, giving `|J_2|<=2k-1`. If `w_2` is isolated, however, `N_H[w_2]={w_2}` and the deletion is **exactly** `{w_1,w_2}`. Then `|J_2|=2k`, including the neighbors of `w_1` in `J_2`. For every `i>=3`, at least the current mark and two earlier distinct marks are removed, so `|J_i|<=2k-1`. These are the only possible order-`2k` residuals under this ordering.

For any graph `J` of order `N`, deletion/extension incidences yield `k i_k(J) <= (N-k+1)i_(k-1)(J)` when the lower layer exists; out-of-range cases follow directly from zero extension. Hence `b_i<=0` for `|J_i|<=2k-1`, while for `|J_i|=2k`, `[b_i]_+<=i_(k-1)(J_i)/k`. Define `L_root=i_(k-1)(J_1)` if `deg_H(w_1)=1`, else zero, and `L_iso=i_(k-1)(J_2)` if an isolate was chosen second, else zero. The valid **per-tag** bound is

`sum_i [b_i]_+ <= (L_root+L_iso)/k`.

This is an allowance, not an assertion that either boundary term is positive. The first-root-only positive-part bound in the original C2-AU section 3 has no valid proof from residual order; whether it might hold for another reason under exact shell eligibility is not decided here.

## 3. Selected global compensation and shell status

For every selected tag `v`, let `B_v` contain index 1 only if `deg_H(w_1)=1`, and index 2 only if an isolate is ordered second. For `i` outside `B_v`, put `d_(v,i)=i_(k-1)(J_(v,i))-i_k(J_(v,i))>=0`. The exact partition and bound give

`S(T,p) <= (1/k) sum_(v in F)(L_root(v)+L_iso(v)) - sum_(v in F) sum_(i outside B_v) d_(v,i)`.

Therefore the following **additional, unproved sufficient premise** implies the complete selected sum is nonpositive:

`k sum_(v in F) sum_(i outside B_v) d_(v,i) >= sum_(v in F)(L_root(v)+L_iso(v))`.  (Comp)

This is the route's original two-boundary compensation condition, with its exact definition restored. It keeps all selected original leaf tags and never replaces the strict selector by a rank-varying one. No listed argument derives Comp from `x(T)+2<=p`, the strict lower-region guard, or `Delta_p(T-v)<0`. The registered first-order-shell assertion remains **proposed open**: neither a complete-sum proof nor a positive eligible complete-sum witness follows. The C2-AU `Comp-root` premise may still be sufficient if proved by a different argument, but its stated proof relies on the false later-residual order bound. Neither `Comp-root` nor the first-root-only numerical estimate is asserted false by this correction.

## 4. Independent fixture replay and what it proves

The listed fixture is the path `0-1-2-3-4-5` with two pendant leaves `6+2i,7+2i` at each center `i=0,...,5`. At `p=8`, independent deletion-recurrence computation and separate literal subset enumeration agree on

`I_T=[1,18,136,574,1519,2672,3216,2672,1519,574,136,18,1]`, `alpha=12`, `x=6` (including terminal difference `-1`). Thus `x+2=8<=p`, `3p=24<25=2alpha+1`, and `|T|=18=2p+2`. For leaf `v=6`, support `s=0`, `H` has 16 vertices and ordered marks `(1,7)`. The independently computed residuals are:

| residual | deleted vertices | order | `i_6` | `i_7` | `b=i_7-i_6` |
| --- | --- | ---: | ---: | ---: | ---: |
| `J_1` | `{1,2,8,9}` | 12 | 152 | 58 | -94 |
| `J_2` | `{1,7}` | 14 | 479 | 250 | -229 |

The selected tag 6 has `Delta_8(T-6)=-452<0`, and `g_6=-323=-94-229`. All twelve original leaves are selected and their complete sum is `-4256`. Full edges, coefficient vectors, selector rows, and replay methods are in `EVIDENCE.json` and `fixture_replay.json`; `replay_fixture.py` is a standalone deterministic replay. This single eligible tree **refutes** C2-AU's asserted universal classification `|J_i|<=2k-1` for every `i>=2`: here `k=7`, `|J_2|=14>13`. It does **not** refute the first-root-only positive-part inequality, `Comp-root`, or the shell aggregate, since both displayed `b_i` are negative and the full sum is negative.

## 5. Precise disposition changes and unaffected carry

The original C2-U3 `C2-U3-ORDERED-SHELL-BOUND` statement, including its second-isolate boundary and `(L_root+L_iso)/k` estimate, should be **retained at its exact route scope** as an informal counting argument. The `retained_narrowed` disposition in C2-CT-U3 that removes the second-isolate boundary is overturned; its set calculation substituted deletion of the earlier mark's neighborhood. C2-CF-U3 retained the two-boundary classification and the missing-global-bridge warning; its classification is vindicated, although its proof text should rely on the literal definition of `J_2`. C2-AU section 3 and its `RETURN.json` ordered-shell statement, section 4's `Comp-root` derivation, evidence note 2, and the carry sentence saying only one boundary is possible must be read with this correction. The original bytes remain sealed.

The `E993-LOWER-REGION-FIRST-ORDER-SHELL` disposition stays **retained as proposed open**; its displayed sufficient premise changes from the unsupported `Comp-root` derivation to valid two-boundary Comp above. The other seven C2-AU claim dispositions are unaffected: `E993-MARKED-ISOLATE-ORDER-BAND`, `E993-ORDINARY-LEAF-ORDER-BAND`, `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, `U5-pendant-extension-tagged-sum-change`, `C2-U6.shell-state-framework`, `C2-U6.shell-vertex-cover-bound`, and `C2-U6.primary-shell-open`. In particular the ordinary-leaf order band at `|T|<=2p+1` remains valid: with `|H|<=2k+1`, deleting the two distinct marks `w_1,w_i` already gives `|J_i|<=2k-1` for every later index, even if `w_i` is isolated. The separate generic marked-isolate proof is independent too. Thus the existing **order-band Lean nomination** is unaffected; this seat makes no Lean proposal or build.

**Limitations.** This is an informal exact combinatorial audit and one exact fixture replay. It proves the stated residual-order classification and bound, and isolates the missing global budget. It does not establish or refute the universal first-shell or primary lower-region inequality, nor does it prove the adjudicator's sharper numerical claims false. No exhaustive search is claimed.
