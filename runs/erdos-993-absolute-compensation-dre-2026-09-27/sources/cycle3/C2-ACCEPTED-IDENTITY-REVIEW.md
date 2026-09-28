# Independent C2 identity and proof review

## Verdict and evidence boundary

**Proposed, nonauthoritative review.** The frozen C2 evidence and predecessor selector clauses compose to prove full original-leaf selection at every actual eligible lower-half rank for every arity-2,3,4 path-star, at a **source-dependent computer-assisted/informal, nonformal** grade. The repaired C2 local coefficient theorem then gives **unconditional selected MASS for $m\ge238$** at that same grade. The argument does not use the accepted aggregate sign. It does not cover MASS or exact-ratio payment for $m<238$, so both registered all-$m$ predicates remain **OPEN**. No Lean or graph-generic award follows.

I compared all 494 normalized registry statements, their 699 literal aliases and 206 alias patterns. The seven proposed keys in `CANDIDATES.json` have no direct normalized key/statement/alias collision; the substantive overlaps and restrictions are listed below. This is an identity recommendation, not a registry edit.

### Integrity and replay

SHA-256 verification against the frozen manifests passed for all 55 common-dispatch members, 6 C2-T2 members, 8 C2-CF-T2 members, and 6 each of C2-SYNTHESIS, C2-AT, and C2-AU. The common manifest pins the contract, registered identity, and both predecessor sources. I inspected only the cited selector-census scripts and frozen predecessor sources beyond the assigned synthesis/adjudication material. C2-CF-T2's sealed independent replay JSON is parsed-equal to C2-T2's scan JSON, whose own hashes also match.

I copied the two root independent literal scripts byte-identically into this directory and ran them here with `PYTHONDONTWRITEBYTECODE=1`. Their output JSON files are byte-identical to the root control-proposal JSON files. Local replay files are `normalization-literal-replay.py/.json` and `truncation-literal-replay.py/.json`; they write only here. The first is a literal 155-vertex tree DP; the second is literal tree DP on 863 and 868 vertices. These establish exact finite counterexamples, not global minimality.

## Exact common predicate and source composition

Let $m\ge1$, $r_i\in\{2,3,4\}$, $N=\sum_i r_i$, $q=N+1$, $\alpha=N+2$, $L=1+z$, $G=1+2z$, $B_r=L^r+z$, $F_r=\sum_{h=0}^{r-2}L^h$, $Q=\prod_iB_{r_i}$, $H_i=\prod_{h\ne i}B_{r_h}$, $C=GQ$, $T_i=GF_{r_i}H_i$, and $P=C+zL^q$. All coefficients are integer zero-extended, $\Delta_k f=f[k+1]-f[k]$, and $x$ is the **least natural** strict descent of $P$, including its terminal difference. For a natural $p$ assume all three guards $x+2\le p$, $3p<2\alpha+1$, $2p\le\alpha$. Put $j=p-2$, $\delta=q-j$, $D_j=\binom N{j+1}-\binom Nj>0$. The current-$p$ strict flags are $e_0=1[\Delta_p(LQ+zL^N)<0]$, $e_i=1[\Delta_p(GB_{r_i-1}H_i+zL^N)<0]$, $b=e_0+\sum_i r_ie_i$, and $A=\sum_i r_ie_iT_i[j]$. There is one endpoint tag and $r_i$ distinct original private-tip tags per branch. Empty selection is included.

The C2-T2 script enumerates every nonnegative count triple at $1\le m\le80$: 91,880 profiles and 133,194 actual eligible lower-half profile/rank rows. It computes the exact first descent, all three guards, deletion polynomials, strict signs, and all represented arity flags. Its summary says `endpoint_on_full_selection_rows = eligible_lower_half_rows = 133194` and zero endpoint-only rows. Equality of these counts, with every row classified, proves all flags on **within this complete finite grid**. Branches of the same arity have identical cofactors, so represented class flags cover individual tips. This is a finite computer-assisted result, not an all-$m$ analytic selector proof.

The frozen registered `E993-PATH-STAR-ARITY-2-4-M42-265-LOWER-HALF-EXACT-BASE` states every original leaf has strict deletion descent whenever $42\le m\le265$ and $x+2\le p\le\lfloor(N+2)/2\rfloor$. It therefore supplies the selector clause for the present smaller rank domain. Its two corrected exact finite implementations are the evidence; the failed B1-omitting replay is excluded. The registered `E993-PATH-STAR-ARITY-2-4-M266-ANALYTIC-ELIGIBLE-TAIL` supplies the same strict clause for $m\ge266$ under all present guards. Its proof gets deletion descent from mixed minors at $x$ and propagates with deletion log-concavity. This selector part precedes the source's aggregate-sign conclusion and does not use that conclusion as a premise. Thus the intervals $[1,80]$, $[42,265]$, and $[266,\infty)$ cover every $m\ge1$. There is no upper-rank transfer: $2p\le\alpha$ remains mandatory.

This establishes the literal all-$m$ lower-half full-selection predicate, and in particular excludes endpoint-only rows, **through a census-dependent composition**. The accepted selected aggregate also logically excludes endpoint-only rows, since such a row has $S=D_j>0$, but that aggregate is not a dependency here. The C2 reports' “endpoint-only exclusion open” must now mean the missing **independent census-free proof**, not unknown truth of the literal predicate. Selection may be used in the proposed tail MASS proof without a sign/MASS/payment circularity.

The C2-T2 threshold itself is exact algebra: $A_0-A_i=z^3F_{r_i}H_i$. If $u=\Delta_pA_0$ and $d_i=\Delta_{p-3}(F_{r_i}H_i)$, then $e_0=1$ exactly when $u<0$, and $e_i=1$ exactly when $d_i>u$. Equality leaves the branch off. The sealed $(a_2,a_3,a_4)=(0,12,10),p=39$ control has both represented $d_i<0$ yet both $d_i>u$, so nonnegative cofactor slope is not a necessary selector condition. This identity is a proof tool within the full-selection review, not another proposed canonical key.

## Universal C2 mathematics and corrections

**Occupation and Jensen — informal proof.** For disjoint positive-size blocks $V_l$ of sizes $s_l$, total $M$, and uniform $k$-subset $S$, let $X_l=1[|S\cap V_l|=1]$, $H=\prod_l(L^{s_l}+z)$. Expanding over marked block sets gives, for $0\le k\le M$,

\[
\frac{H[k]}{\binom Mk}=\mathbb E\prod_l(1+X_l/s_l),\qquad
\Pr(X_l=1)=s_l\frac{\binom{M-s_l}{k-1}}{\binom Mk}.
\]

The joint event for a marked set $I$ has count $\prod_{l\in I}s_l\binom{M-\sum_{l\in I}s_l}{k-|I|}$; no independence is assumed. Finite Jensen yields the product of rational powers $\prod_l(1+1/s_l)^{\Pr(X_l=1)}$. With $y_k=\sum_l[2s_l/(2s_l+1)]\binom{M-s_l}{k-1}/\binom Mk$, the elementary log bound and $e^y\ge E_d(y)=\sum_{a=0}^d y^a/a!$ give $H[k]\ge\binom Mk E_d(y_k)$ for every finite $d$. The additive floor follows directly from the product expansion, and $\binom Mk E_4(y_k/256)^{256}$ is also valid. Set the lower bound to zero outside $0\ldots M$; do not divide by zero or assert the power inequality there. For $H_i$, convolution with the actual nonnegative $GF_2=(1,2)$, $GF_3=(2,5,2)$, $GF_4=(3,9,7,2)$ transfers the bound to $T_i[j]$. An earlier F3 display omitted the $F_r$ weights; this is the required correction. These coefficient bounds have no selector premise or automatic payment conclusion.

**First descent and corrected ratio — informal proof.** Each $f\in\{G,B_2,B_3,B_4\}$ satisfies $3(k+1)f[k+1]\ge2(\deg f-k)f[k]$; summing the product derivative identity gives $3(j+1)C[j+1]\ge2(N+1-j)C[j]$. Hence $\Delta_jC\ge0$ for $5j\le2N-1$. The shifted binomial summand of $P$ rises there, so $5x>2N-1$, without parent log-concavity or no-recovery. At an eligible row $j\ge x$, and $2j\le N-2$. Put $\beta_x=\binom qx-\binom q{x-1}>0$, $v=\beta_x/C[x]$, $t=C[j+1]/C[j]$. The descent at $x$ and ordinary log-concavity of $C$ give $0<t\le C[x+1]/C[x]<1-v$. Thus

\[
\kappa=1-t+t/\delta>v+(1-v)/\delta.
\]

The C2-T3/C2-CU-T3 bound $\kappa>v+1/\delta$ is false: it replaced $t/\delta$ with $1/\delta$. A repaired conditional scalar test with any valid $\ell_i[j]\le T_i[j]$ is $b=0$, or $\bigl(v+(1-v)/\delta\bigr)\sum_i r_ie_i\ell_i[j]\ge bD_j$. Its premise has no all-parameter proof. The normalization witness below refutes only the overstated factor.

**Local 238 theorem — informal proof.** For $m\ge238$, every represented $i$, and every natural $j$ satisfying $5j>2N-1$, $2j\le N-2$, set $M=N-r_i$. The correct singleton probability for another block of size $s$ is

\[
p_s=s(j/M)\prod_{a=0}^{s-2}\frac{M-j-a}{M-1-a}.
\]

The producer's displayed $M-j-1-a$ is an incorrect equality: at $M=10,j=4,s=2$, it gives $4/9$ in place of $8/15$; it is a smaller lower-bound factor. The repaired rank estimates give $j/M>39/100$, every product factor $>48/100$, $p_s>17/100$, and $\binom Mj/\binom Nj>(49/100)^4>1/18$. Jensen gives $H_i[j]/\binom Mj>\exp(17(m-1)/450)$. The exact degree-20 Taylor floor at $m=238$ exceeds $(162/5)238$; $\exp(17(m-1)/450)/m$ increases thereafter. Since $N\le4m$, $T_i[j]\ge H_i[j]>(9/20)N\binom Nj$. Direct binomial algebra on the same rank band gives $\delta D_j/\binom Nj=(N+1-j)(N-2j-1)/(j+1)<3(N-3)/10$. Therefore **each** $T_i[j]>3\delta D_j/2$, independently of selection. The sealed synthesis rational check records a degree-20/threshold ratio greater than 1; this finite constant check supports the displayed universal inequalities, not a finite sampling inference.

The first-descent theorem puts every actual eligible row into this rank band. By full selection, $e_0=e_i=1$, $w=\sum_i r_ie_i=N\ge2$, and $A>(3/2)w\delta D_j\ge(w+1)\delta D_j=b\delta D_j$. This gives unconditional $m\ge238$ MASS; $0<t<1$ then gives the exact-ratio payment there because $\kappa\ge1/\delta$. Even without full selection, the local theorem proves MASS if at least one branch is selected, or equality for empty selection; only endpoint-only selection is unpaid. The inherited selector clause closes precisely that case in the actual tail. The existing $m\ge266$ MASS key independently corroborates and must remain separate as a historical restricted identity.

## Exact refutations and grades

| Proposed literal refutation | Smallest **known** retained witness | Exact result and boundary |
|---|---|---|
| $\kappa>v+1/\delta$ | all arity 3, $m=38,n=155,N=114,x=55,p=57,j=55,\delta=60,b=115$ | $\kappa=10046229104518113012063545094727/580516383375585058660432089220920 < 5025084124803012972339453667081/290258191687792529330216044610460=v+1/\delta$. The corrected bound holds and full payment margin is positive. |
| Empty-plus-singleton truncation $U_i$ pays the exact-ratio selected debt on every eligible row | all arity 4, $m=172,n=863,N=688,x=334,p=336,j=334,\delta=355,b=689$ | The exact truncated integer payment margin is negative, while full-$T_i$ payment and MASS margins are positive. The earlier $m=173,n=868$ replay also fails, but is not the retained smallest known witness. |

Both witnesses satisfy the actual first descent, all three guards, strict current-rank deletion signs, all original tip multiplicities, and literal tree DP. “Smallest known” refers to the supplied verified cases; there was no global minimality search or claim. Neither is a primary or all-$m$ MASS counterexample. The exact hundreds-digit truncation margins and graph edges are retained in the local replay JSON rather than rounded here.

## Canonical identity recommendation

`CANDIDATES.json` proposes exactly seven keys: occupancy/Jensen with corrected convolution; first-descent/corrected ratio; branchwise local 238; all-$m$ lower-half full selection; $m\ge238$ selected MASS; and the two precise auxiliary refutations. The selection and tail keys are source-dependent nonformal VERIFIED proposals; the local and algebraic keys are informal proof proposals; the refutations have exact literal finite certificates. Do not add separate keys for the additive, scaled, arbitrary-degree, or conditional-MASS variants, a finite $m\le80$ selector key, or a literal “endpoint-only OPEN” key. They are components, restrictions, or proof obligations of the seven canonical statements.

Registry overlap: `E993-PATH-STAR-SELECTED-BRACKET-IDENTITY` supplies polynomials only; `E993-PATH-STAR-ARITY-2-4-M41-EXACT-SLICE`, `...M42-265-LOWER-HALF-EXACT-BASE`, and `...M266-ANALYTIC-ELIGIBLE-TAIL` supply restricted selectors; the pure-arity-2 selector clause is still narrower. `E993-PATH-STAR-ARITY-2-4-M266-SELECTED-LOWER-MASS` is a proper restriction of proposed tail 238, while `E993-PATH-STAR-ARITY-2-4-SELECTED-LOWER-MARK-MASS-COMPENSATION` remains OPEN for all $m$. The formally verified relative main-mark margin does not pay absolute debt. The all-family selected aggregate is weaker than payment and is not used in either new composition. The exact-ratio primary key remains OPEN. Existing normalized spread-quotient refutation is a different predicate from both new refutations. No existing alias or alias pattern identifies an equivalent one of the seven at its full scope.

The remaining mathematical route is exact payment or MASS for every actual eligible profile/rank with $m\le237$, or an alternative universal proof. An independent census-free selector argument remains useful for a proof with fewer computational dependencies, even though the literal selector predicate is already proved at the stated nonformal grade.
