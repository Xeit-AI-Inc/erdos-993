# C2-CT-F3 constructive critique of C2-F3

**Verdict:** retain C2-F3-001, C2-F3-002, and C2-F3-003 as proposed informal mathematical results. No repair is needed in the stated proof. The primary contract's governed status remains OPEN because this critique ran no Lean or fidelity gate. The three dispositions below concern only the frozen ordinary-tree statement and its cited auxiliaries.

Sources reviewed: `cycles/cycle-2/C2-F3/REPORT.md`, `RETURN.json`, `path1001_exact.py`, and `path1001_exact.json`, the two root contracts, `packets/C2-REVIEW-PROTOCOL-v2.md`, and the common historical authority in `packets/C2-T1-v2.json` where cited. I executed a copy of the source path script inside my assigned scratch; its JSON output matches the pinned source JSON byte for byte (`cmp` exit 0). No source script was executed in place.

## C2-F3-001 — proposed_retained

Let `q_j` count independent `j`-subsets of finite bipartite `H` meeting any fixed `W subseteq V(H)`. For `1<=k<=alpha(H)`, count incidences `(A,B)` where `A subset B`, `|A|=k`, `|B|=k+1`, and both sets are independent and meet `W`. Each tagged `B` has at least `k` tagged deletions: deleting a member outside `W` preserves its tag, and at most one member of `B` can be the unique `W` member. For each tagged `A`, every possible added vertex lies outside its closed neighborhood. If `K=H-N_H[A]`, any independent set of `K` extends `A`, so `alpha(K)<=alpha(H)-k`. A bipartition of `K` gives a color class of size at least `|V(K)|/2`; therefore `|V(K)|<=2(alpha(H)-k)`. Counting the same incidences proves `k q_(k+1)<=2(alpha(H)-k)q_k` using integers only. At `k=alpha(H)`, the left side is zero and the bound is exact. Above `alpha(H)`, both counts are zero; the displayed inequality remains `0<=0`, even if its coefficient is negative. Empty `W`, disconnected `H`, and nonnegative zero ranks cause no exception.

For any original degree-one leaf `v` of a bipartite `G`, with support `s`, every independent set of `H=G-{v,s}` extends by `v` in `G`; hence `alpha(H)+1<=alpha(G)`. Replacing `alpha(H)` by `alpha(G)-1` weakens the nonnegative right side when `k<=alpha(H)`. This proves the claimed leaf refinement. The source's phrase “bipartite suffices” applies to the shadow bound; the extension inequality itself requires only the leaf relation.

## C2-F3-002 — proposed_retained

Eligibility at integer `p=a-2` gives `x+2<=a-2`, hence `a>=4` and `x<=a-4`. For `a=4`, this forces `x<=0`, but `Delta_0=n-1>0` since `n>=5`. For `a=5`, it forces `x<=1`, but `n>=6`, `i_1=n`, and `i_2=binom(n-1,2)` give `Delta_1=binom(n-1,2)-n>=4`; also `Delta_0>0`.

For `a=6`, it forces `x<=2`. The source triple count is correct: a triple contains each tree edge in `n-2` choices; two edges can share a triple precisely when adjacent, counted by `sum_u binom(deg(u),2)`; three tree edges cannot lie on three vertices. Thus

`Delta_2=((n-1)(n-2)(n-9))/6 + sum_u binom(deg(u),2)`.

Here `n>=7`. For `n>=9`, both terms are nonnegative. If `n=7`, the complement of an independent six-set is a one-vertex cover of a connected tree, forcing `K_(1,6)`, with `Delta_2=-10+15=5`. If `n=8`, the complement is a two-vertex cover `{u,w}` of all seven edges. Each edge contributes at least once to `deg(u)+deg(w)`, so this sum is at least seven. Convexity of `d(d-1)/2` on nonnegative integers gives `binom(deg(u),2)+binom(deg(w),2)>=binom(3,2)+binom(4,2)=9`; the remaining degree terms are nonnegative. Hence `Delta_2>=-7+9=2`. We have `Delta_0,Delta_1,Delta_2>=0` in all `a=6` cases, contrary to `x<=2`. This independently proves `a>=7`; it uses neither the r27 order bound nor an unproved unimodality premise.

## C2-F3-003 — proposed_retained as informal primary proof candidate

For each original leaf tag `v`, put `H=T-{v,s_v}`, `W=N_T(s_v)\{v}`, and `R=T-N_T[s_v]=H-W`. The sets counted by `q_j=i_j(H)-i_j(R)` are exactly the independent `j`-sets of `H` meeting `W`, including when several original leaves have the same support. Direct subtraction gives the *original* term `Delta_(p-1)(H)-Delta_(p-1)(R)=q_p-q_(p-1)`. The favorable test remains `Delta_p(T-v)<0`, with no selector shift.

By C2-F3-002, an eligible tree has `a>=7`, so `p=a-2>=5` and `k=p-1=a-3>=4`. The exact coefficient comparison is

`2(a-1-k)=4 <= a-3=k` if and only if `a>=7`.

Equivalently, `3p>=2a+1`. For `k<=alpha(H)`, C2-F3-001 and nonnegativity of `q_k` imply `k q_p<=2(a-1-k)q_k<=k q_k`, hence `q_p<=q_k`. If `k>alpha(H)`, `q_k=q_p=0`. This includes the endpoint `k=alpha(H)`, where `q_p=0`. Thus **every** original leaf has nonpositive term, independently of whether it is favorable. Summing only over the exact favorable original leaf tags proves `S(T,p)<=0` in informal mathematics; repeated-support leaves remain separate summands. This is not a proof of the broader all-rank aggregate, a residual-only statement, or a governed Lean award.

The source's separate `p=1` base case is correct for its broader high-tail pointwise auxiliary: `3p>=2a+1` then forces `a<=1`; an existing leaf makes `a=1`, so `H` is edgeless with no vertices of positive independence rank and the tagged term is zero. The primary rank has `p>=5` and never uses that case.

## Exact falsification audits and fences

The copied `P_1001` script replays the source result exactly: `(n,a,p,x)=(1001,501,499,277)`, both original endpoint tags favorable, each term `-2593614875`, and complete sum `-5187229750`. Its checks cover `k=1..500`, the high-tail range `334..500`, first strict descent, and the terminal rank. This is corroboration, not a universal proof.

I also built a **fresh** 253-vertex tree: the path `0--1--...--250` plus edges `(1,251)` and `(1,252)`. It has exactly four original leaves `0,250,251,252`, with three sharing support `1`. The script `broom253_exact.py` uses exact integer forest polynomial recursion on the induced graphs for every tag; the bounded replay is `python3 scratchpad/C2-CT-F3/broom253_exact.py > scratchpad/C2-CT-F3/broom253_exact.json`. Its result gives `(n,a,p,x)=(253,128,126,71)`, `Delta_70>0`, `Delta_71<0`, terminal `Delta_128=-1`, and eligibility `71+2<=126`. Every original leaf is favorable. Tags `0,251,252` each have selector `-7876` and term `-10342499`; tag `250` has selector `-325750` and term `-9706627`. The complete, multiplicity-preserving sum is `3(-10342499)-9706627=-40734124`. The script checks the tagged-shadow inequality at every `k=1..127` separately for each tag and confirms `term=q_p-q_(p-1)`. This new target stresses the repeated-support case absent from the source path test, exceeds 243 vertices, and found no falsification.

The pinned order-91 `T22` witness has `(a,p)=(68,34)`, so `3p=102<137=2a+1`, and its marked rank is not `a-2=66`. The order-243 `T60` witness has `(a,p)=(182,90)`, so `270<365`, and its marked rank is not `a-2=180`. Their positive marked terms remain valid obstructions to their broader parent scopes, but neither satisfies this proof's rank guard. The historical KL non-log-concavity fixtures are immaterial because no log-concavity enters. The known cycle-1 non-residual examples are also immaterial because this proof assumes no residuality. The r26 residual top-rank result is not imported. These scope distinctions match `control/C2-SCOPE-AUDIT.md` and the root solution contract. No conclusion about the broader all-rank aggregate or governed RTree beta target follows.

No proof repair was needed. Exact finite coverage here is two explicitly constructed trees (the copied `P_1001` and fresh 253-vertex tree), not an exhaustive search. No Lean build or remote/master edit was performed. No owned background jobs were started; none remain running.
