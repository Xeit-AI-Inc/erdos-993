# C3-T1 search report

## Scope and result

The assigned target remains the complete lower-region ordinary favorable-leaf aggregate. I obtain (i) an exact cover-number lower bound forced by a first descent, and (ii) a new sufficient structural subclass for later order shells. These results do not settle the target for arbitrary eligible trees.

## 1. Exact cover-number budget for an early descent

Let `T` be a tree on `n` vertices, let `C` be any vertex cover of size `c`, and put `N=n-c`. For each independent `X subset C`, let `b_X` be the number of vertices outside `C` having no neighbor in `X`. The vertices outside `C` form an independent set, so the independence polynomial has the exact decomposition

`I_T(z) = sum_(X independent subset C) z^|X| (1+z)^b_X`.

For integer `s` and `b>=0`, define `d_s(b)=binom(b,s+1)-binom(b,s)`, with binomial coefficients zero outside `0..b`. For `N>=0`, define the exact finite minimum `m_N(s)=min_{0<=b<=N} d_s(b)`. If `r>=0`, coefficient subtraction gives

`Delta_r(T) >= L(n,c,r) := d_r(N) + sum_(a=1)^min(c,r+1) binom(c,a) m_N(r-a)`.

Indeed, the empty `X` contributes `d_r(N)`; each size-`a` nonempty `X` contributes `d_(r-a)(b_X) >= m_N(r-a)`, and there are at most `binom(c,a)` such sets. This is an exact integer bound requiring only a finite minimum over `N+1` values; it makes no log-concavity assumption and does not use an imported Catalan estimate.

Consequently, if `L(n,c,r)>0` for every `0<=r<=p-2`, then `Delta_r(T)>0` at every rank that could witness `x(T)+2<=p`. Such a tree is ineligible. Equivalently, any eligible tree and any chosen cover of size `c` must have `L(n,c,r)<0` for at least one `r<=p-2`. The strict inequality follows because eligibility supplies a rank with integer `Delta_r<0` and `Delta_r>=L`.

For the later shell `n=2p+2+d`, this gives the explicit necessary condition

`there exists r in [0,p-2] with L(2p+2+d,c,r)<0`.

It is a quantitative cover/early-descent restriction for each `d`; by itself it gives no marked residual sign. In particular, this report does not assert that it forces `c>=d+3` or any other simple closed-form cover threshold.

## 2. First-mark sufficient subclass for `d>=1`

Fix an original leaf `v`, its original support `s`, `H=T-{v,s}`, and `W=N_T(s)\\{v}`. Put `k=p-1`. For any ordering `w_1,...,w_t` of `W`, set

`J_i = H - (N_H[w_i] union {w_1,...,w_(i-1)})`.

The first-mark partition is exact: for every `j>=1`, the independent `j`-sets of `H` meeting `W` partition by their first included mark, so `q_j=sum_i i_(j-1)(J_i)`, where `q_j=i_j(H)-i_j(H-W)`. Thus

`q_(k+1)-q_k = sum_i (i_k(J_i)-i_(k-1)(J_i))`.

For any graph `J` on at most `2k-1` vertices, incidence counting gives `k i_k(J) <= (|V(J)|-k+1)i_(k-1)(J) <= k i_(k-1)(J)`; hence each summand is nonpositive.

Here `|V(H)|=2k+2+d`. Therefore the following is a sufficient, checkable structural condition for the leaf term to be nonpositive: there is an ordering of `W` such that every first-mark deletion union `N_H[w_i] union {w_1,...,w_(i-1)}` has size at least `d+3`. This forces `|V(J_i)|<=2k-1` for every `i`, and proves `q_(k+1)<=q_k`. If this condition holds for every original leaf in the fixed favorable set `F(T,p)`, summing gives `S(T,p)<=0`; tags sharing a support are still separate leaf terms.

This condition is nonvacuous as a structural criterion, but it is not implied here by early descent, the strict lower-region alpha guard, or favorability. It is an independently checkable sufficient subclass, not a reduction of the full target.

## 3. Exact unresolved shell boundary

For `n=2p+3` (`d=1`), `H` has order `2k+3`. Every first-mark deletion removes at least two vertices, leaving `J_i` of order at most `2k+1`; the elementary incidence argument above only guarantees the desired sign through order `2k-1`. It leaves orders `2k` and `2k+1` unresolved (in particular it does not prove a sign at `2k+1`). For general `d`, the deletion-size subclass above excludes all residuals above `2k-1`; residuals of orders `2k` and larger need additional exact sign information or compensation. The cover budget in section 1 does not supply this missing marked-residual information.

I did not use a literature theorem or computation. No census or universal conclusion is claimed.

## Limitations

- The complete target for arbitrary eligible `T,p` remains open in this route.
- The first-mark size condition is sufficient only when it can be verified for every selected original leaf; no implication from the target's guards has been proved.
- The finite cover bound is a necessary condition, not a closed-form bound on `c`; evaluating it for broad parameter ranges remains future work.
- No result here addresses residual orders `2k` or `2k+1` generally, and no pointwise sign is inferred from a positive/negative single local term.
- Status is proposed-worker-only.
