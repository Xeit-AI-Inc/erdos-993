# C2-CF-U3: F critique of C2-U3

**Disposition:** `C2-U3-PRIMARY-PROOF-COMPLETENESS` is `proposed_retained` as a complete *informal* proof candidate at the exact primary scope. I tried to falsify its small-alpha exclusion, tagged incidence inequality, rank boundary, zero extension, and original-leaf sum. I found no mathematical gap. This critique does not award the primary registry claim or replace the governed formal gate. The only incoming claim ID appears once in this report and once in the return's claim array.

## Source boundary and exact target

I used `packets/C2-CF-U3.json`, `packets/C2-REVIEW-PROTOCOL-v2.md`, `WORKER-PROTOCOL.md`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, and the four C2-U3 files pinned in the case. Their SHA-256 hashes matched the case. For historical scope checks I used only common files listed in `packets/C2-T1-v2.json`: `cycles/cycle-1/C1-SYNTHESIS/REPORT.md`, `control/C2-SCOPE-AUDIT.md`, `control/C2-CAPSULE-AND-COUNTEREXAMPLE-GATE.md`, `proposals/cycle2/controller/BOUNDARY-NOTE.md`, and the two standing T22/T60 control JSON files. I did not inspect any current sibling or controller mathematical note. The large replay below is a copy of the assigned origin script placed in my own scratch and changed to a new parameter; I did not execute the origin evidence in place.

The contract has finite connected acyclic simple `T`, `a=alpha(T)`, integer `p=a-2`, `x=min{j>=0: Delta_j(T)<0}`, and eligibility `x+2<=p`. For each original degree-one leaf `v`, its original support is `s`, `H=T-{v,s}`, `R=T-N_T[s]`, and the favorable selector is **strictly** `Delta_p(T-v)<0`. The complete sum counts each selected original leaf separately, including shared-support multiplicity. No residual condition occurs.

## Falsification of the eligibility step

Eligibility gives `x+4<=a`, so `a>=4` and `p>=2` before any natural-number subtraction. Put `n=|V(T)|`; since a tree with `a>=4` has an edge, `n>=a+1`. Its first differences are `Delta_0=n-1>0` and `Delta_1=binom(n-1,2)-n`. For `a=4`, eligibility forces `x=0`, impossible. For `a=5`, it forces `x<=1`, while `n>=6` gives `Delta_1>=4>0`. For `a=6`, it forces `x<=2`; `n>=7` and `Delta_1>0`.

I independently checked the remaining `Delta_2` identity. Inclusion-exclusion over edge events among 3-subsets gives

`i_3=binom(n,3)-(n-1)(n-2)+sum_u binom(deg(u),2)`, hence

`Delta_2=(n-1)(n-2)(n-9)/6+sum_u binom(deg(u),2)`.

Two distinct edges of a tree can occur in a 3-subset only if incident; no three distinct tree edges occur in one. At `n>=9` this is nonnegative. At `n=7`, `a=6` gives a one-vertex cover of all six edges, so connectedness makes `T=K_(1,6)` and `Delta_2=-10+15=5`. At `n=8`, a maximum independent 6-set leaves a two-vertex cover `{u,w}`; every one of seven edges is incident to it, so `deg(u)+deg(w)>=7`. Convexity of `binom(d,2)` on nonnegative integers gives `binom(deg(u),2)+binom(deg(w),2)>=binom(3,2)+binom(4,2)=9`, so `Delta_2>=-7+9=2`. The possible double-count of edge `uw` only increases the degree sum. Thus there is no strict descent at an eligibility-permitted index for `a<=6`; `a>=7` follows without a cited order-bound transport.

## Falsification of the tagged incidence and endpoints

Fix one original leaf `v` and set `W=N_T(s)\{v}` as vertices of `H`. The original closed-neighborhood deletion satisfies `R=H-W` exactly. Let `q_j` count independent `j`-subsets of `H` that meet `W`, with zero extension. Then `q_j=i_j(H)-i_j(R)` and the exact signed summand is `g_v=q_p-q_(p-1)`; no index shift occurs.

Write `h=alpha(H)`. Appending the deleted leaf `v` to every independent set of `H` shows `h<=a-1`. For integers `1<=k<=h`, count inclusions `A subset B` of independent sets of `H`, both meeting `W`, with `|A|=k`, `|B|=k+1`. For fixed `A`, each extension vertex belongs to `K=H-N_H[A]`. The induced graph `K` is bipartite; its two color classes show `|V(K)|<=2alpha(K)`, and each independent set of `K` joins `A`, so `alpha(K)<=h-k`. Thus there are at most `2(h-k)` extensions. For fixed `B`, at most one of its `k+1` deletions can lose the property of meeting `W`: this can happen only if `B` has exactly one `W` vertex. Thus at least `k` deletions remain. Counting the same incidences yields `k q_(k+1)<=2(h-k)q_k` over integers, including `k=h`.

At the target `k=p-1=a-3>=4`. If `k>h`, zero extension makes `q_k=q_(k+1)=0`. Otherwise `2(h-k)<=2((a-1)-(a-3))=4<=k`, so `q_p<=q_(p-1)` and `g_v<=0`. This argument does not inspect whether `v` is favorable. It therefore applies to **each** original leaf, and summing over the strict favorable subset retains one summand per leaf and yields the complete `S(T,p)<=0`, including the empty sum. It does not invoke residuality, Hall, or a recovery/unimodality premise.

I also checked the origin's optional high-tail endpoints. In a bipartite graph with a degree-one vertex, `p>=2` and `3p>=2a+1` imply `k=p-1>=1` and `k>=2(h-k)`; if `k>h`, both relevant `q` ranks vanish. At `p=1`, the guard forces `a=1`, so `H` has independence number zero and is empty; `q_0=q_1=0`. The primary use has `p>=5` and does not depend on this boundary case. For `p>alpha(G)`, `p-1>alpha(H)` by `alpha(H)<=alpha(G)-1`, so both tagged counts vanish. These checks prevent an unproved application of the incidence lemma at `k=0`.

## Inherited obstruction and numerical scope

The order-91 `T22` control has `(a,p)=(68,34)` and positive selected marked term `212336130412243110`; the order-243 `T60` control has `(182,90)` and positive selected marked term `2935177632783649903488454322226807645411570590073000`. They are below the high-tail guard (`3p<2a+1`) and below their respective target ranks `a-2=66,180`. Their off-target complete sums are negative in the pinned controls, and Cycle 1 synthesis gives negative target sums `-147807` and `-2947590`. These facts rule out a rank-unqualified pointwise extension but do not falsify this proof. The common boundary note's positive marked terms for `a=5,6` fail eligibility, and its complete sums are separate from the local terms. The verified r26 result is top-rank and residual, whereas this argument is first-interior and unrestricted. The governed RTree beta/support-fibre refutations and literal Hall failures have different hypotheses or mechanisms; no ordinary-to-RTree transfer is used. These are precise fences, not corroboration of the universal sign.

For an independent larger replay, I copied `cycles/cycle-2/C2-U3/fresh_large_target.py` into `scratchpad/C2-CF-U3/fresh_replay.py`, changed only `m=300` to `m=61` and its descriptive docstring, then ran `python3 scratchpad/C2-CF-U3/fresh_replay.py > scratchpad/C2-CF-U3/fresh_replay.json`. Its explicit `T_m` graph has 247 vertices, exceeding the standing 243-vertex control. The script compares all seven closed-form polynomials with a graph-based induced-forest dynamic program and checks the strict selector, original leaves, tagged differences, and complete sum. The result is `a=185`, `p=183`, `x=89`, 184 favorable original leaf tags, selectors `-365/-184`, marked term `-16470`, each of 183 star terms `-16833`, and complete `S=-3096909`. The arithmetic also checks directly: with `n=183`, `g_0=n-binom(n,2)=-16470`, `g_star=3-n-binom(n,2)=-16833`, and `g_0+n*g_star=-3096909`. The program scans differences through `a`, including the terminal zero-extended rank. This finite family replay corroborates the formulas only; the proof above supplies the universal step.

I separately copied the assigned origin script byte-for-byte to `scratchpad/C2-CF-U3/origin_300_replay.py` and ran it there to `origin_300_replay.json`. Both the copied script and regenerated JSON compare byte-for-byte with the two case-pinned C2-U3 files (`cmp` exit code 0). Thus its reported order-1203 row, including `x=434` and `S=-365305950`, is reproducible. This is a reproduction of the origin method, not an independent algorithm or universal evidence.

## Status and limitations

I propose retaining the single incoming claim as a complete informal proof candidate. Formal fidelity/kernel review and neutral adjudication are still required by `SOLUTION-CONTRACT.md` before any primary success or registry status change. No Lean build was run. The fresh replay changes one family parameter and uses the origin's arithmetic routines, though it cross-checks closed forms against a graph DP; it is bounded evidence. No background job was started, and no job remains running.
