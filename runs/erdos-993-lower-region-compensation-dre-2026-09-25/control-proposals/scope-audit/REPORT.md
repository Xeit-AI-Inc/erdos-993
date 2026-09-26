# Stage 1 neutral scope audit

## Transport and evidence boundary

All 14 `members` of `manifests/STAGE1-PREPARATION.json` matched their SHA-256 values before this audit. All seven separately imported members of `control/STANDING-SOURCE-PINS.json` also matched. `TRANSPORT.json` records the read. I inspected the 407 entries of `inputs/MASTER-REGISTRY.initial.json` by key, statement, scope and alias fields, then checked the relevant full entries against `inputs/MASTER-LEDGER.initial.md`, `inputs/FIRST-INTERIOR-FINAL-ANALYSIS.md`, `inputs/R27-FRESH-REVIEW.md`, `inputs/R28-EXPERIMENT.md`, `inputs/standing-controls/summary.json`, `inputs/standing-controls/t22-order91.json`, `inputs/standing-controls/t60-order243.json`, and the two control inputs. This is an intake/scope audit, with no target verdict or status award.

## Primary identity and rank boundary

**Propose a new key:** `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`. For every finite ordinary tree `T`, let `i_j(T)` be the integer zero-extended independent-set count, `Delta_j(T)=i_(j+1)(T)-i_j(T)`, `x(T)` its first strictly negative difference, and `a=alpha(T)`. For each *original* leaf `v`, let `s_v` be its support in `T`; all deletions and closed neighborhoods refer to `T`. For every natural `p` with `x(T)+2<=p` and `3p<2a+1`, define `F(T,p)={v original leaf: Delta_p(T-v)<0}` and

`S(T,p)=sum_(v in F(T,p)) [Delta_(p-1)(T-{v,s_v})-Delta_(p-1)(T-N_T[s_v])]`.

The proposed statement is `S(T,p)<=0`; the empty favorable set sums to zero. Each leaf is a distinct summand even when supports coincide. There is no residual assumption and no governed `RTree` model on this face. Natural subtraction at `p-1` is safe: `x(T)>=0`, so eligibility gives `p>=2` (indeed on an ordinary tree the first strict descent cannot occur at zero). The strict lower inequality excludes the high-tail equality boundary; do not replace it by `<=` or use a rounded ratio without proof.

This is a **proper region restriction**, not a duplicate, of OPEN `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (all eligible ordinary ranks). It is not VERIFIED `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`: that fixes `p=a-2`, and eligibility on that slice forces `a>=7`, hence `3p=3a-6>=2a+1`, outside the strict lower region. It is not VERIFIED `E993-R26-TOP-RANK-RESIDUAL-SIGN`, whose rank is `a-1` and whose residual premise is extra. It is not OPEN governed `E993-BETA-AGG`; transferring ordinary coefficients, selector and tags into `RTree` requires a separate exact bridge. The three OPEN first-interior auxiliaries (`E993-BIPARTITE-TAGGED-SHADOW-BOUND`, `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`, `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN`) do not alias this selected global lower-region assertion. The registry has no existing `3p<2alpha+1` selected aggregate key or alias.

The region is nonempty: for the star `K_(1,12)`, `a=12`, `x=6` (the first fall is `i_7-i_6=792-924`), and `p=8` satisfies `x+2=p` and `24<25`. Every one of its 12 original leaves is favorable because its deletion is `K_(1,11)` with `Delta_8=55-165=-110`. Here each summand is `C(11,8)-C(11,7)=165-330=-165`, so `S=-1980`. This finite check demonstrates an eligible lower-region row, not a universal sign proof.

## Candidate exact incidence identity: checked, unawarded

**Propose a distinct auxiliary key:** `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY`. For a finite bipartite graph `H`, arbitrary marked set `W`, integer `h>=alpha(H)`, and `1<=k<=h`, let `q_j` count independent `j`-sets meeting `W`. For each marked independent `k`-set `A`, let `e(A)` count *actual* vertices `z` of `H` such that `A+z` remains independent; put `D=sum_A[2(h-k)-e(A)]`. Let `C` count independent `(k+1)`-sets meeting `W` in at least two vertices, **once per set**. Then

`k*q_(k+1)+C=2(h-k)*q_k-D`, with `D>=0`, `C>=0`.

This is an exact decomposition, unlike the OPEN registered `E993-BIPARTITE-TAGGED-SHADOW-BOUND`, which is only the inequality obtained by dropping `D+C` at `h=alpha(H)`. It must not be installed as a second alias for that inequality. The equality also differs from unmarked `E993-R27-INDEP-EXTENSION-DOUBLE-COUNT` and root-corrected `E993-R27-FOREST-ROOT-CORRECTED-DEGREE-LEMMA`: the fixed marked family and the two-root correction are essential data. Register only if the controller wants this exact stronger identity as its own contract; otherwise keep it as unawarded handoff algebra.

Independent check: the addable set `B(A)` induces a bipartite graph. Each color class of `B(A)` can be adjoined to `A`, so each has size at most `h-k` and `e(A)<=2(h-k)`. Counting extensions `(A,z)` in the other direction, an independent `(k+1)`-set meeting `W` has `k` deletions that stay marked when it has exactly one marked vertex, and `k+1` such deletions when it has at least two. Therefore `sum_A e(A)=k*q_(k+1)+C`; substitution proves the displayed identity. In particular, `C` is the **number of multiply marked sets**, not `sum_B(|B∩W|-1)`, and `e(A)` must not count non-addable vertices.

For an original leaf `v` of a tree, set `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\{v}` and `R_v=H_v-W_v=T-N_T[s_v]`. The equality `alpha(H_v)=a-1` holds: adjoining `v` to an independent set of `H_v` gives the upper bound, and every maximum independent set of `T` contains `v` or `s_v` (otherwise add `v`), so deleting that one vertex gives the lower bound. Each component of `H_v` has exactly one `W_v` root by connectedness and acyclicity. `q_v(j)=i_j(H_v)-i_j(R_v)` and the target summand is `q_v(p)-q_v(p-1)`. With `h=a-1`, `k=p-1`, and the **same fixed favorable set** on both sides, summing gives

`k*S(T,p)=(2a+1-3p)*sum_(v in F) q_v(k)-sum_(v in F)(D_v+C_v)`.

On the lower region the coefficient is strictly positive. The needed conclusion is the genuinely new global budget `sum_F(D_v+C_v)>=(2a+1-3p)*sum_F q_v(k)`. Neither the exact identity nor the nonnegativity of `D_v,C_v` implies this budget. A proof must use eligibility, original-tree coupling and/or the strict selector; an exact positive complete eligible `S` would refute the proposed primary. Pointwise budget or support-fibre budget is a stronger claim and is not an admissible substitute.

## Imported obstruction and common neutral handoff

Preserve these exact fences from the 407-entry registry. `E993-BETA-TARGET` is REFUTED on its governed pointwise scope; `E993-BETA-AGG-SUPPORT` is REFUTED by an order-91 support with positive local margin. The imported ordinary `T_22` of **order 91** has `(a,x,p)=(68,32,34)`, marked term `+212336130412243110`, and complete `S=-498754180547001418536`; ordinary `T_60` of **order 243** has `(a,x,p)=(182,87,90)`, marked term `+2935177632783649903488454322226807645411570590073000`, and complete `S=-1058142362147652597702654588268394677176033202323316960380` (`inputs/standing-controls/t22-order91.json`, `t60-order243.json`). Both satisfy the lower-region guard and show why local positivity and a negative complete sum can coexist; neither is a primary counterexample. These are different from r28's **order-22** `T22`, which refutes `E993-R28-TREE-LEAF-SLOT-DOMINANCE` at `(k,t)=(12,18)`. The surviving branch-tree-degree-≤2 theorem has only that class scope. `inputs/R27-FRESH-REVIEW.md` gives a six-vertex tree where an optimized unmarked root inequality is tight while `q_2-q_1=+1`, and marks that row *ineligible*. Therefore the root correction cannot simply be restricted to marked sets. The `M(6)=22` result and `x<=6` isolate-closure record in `inputs/CENSUS24-RESULTS.md` are census-dependent bounded inputs, not a general lower-region certificate.

`inputs/standing-controls/ordinary_tree.py` has a test-helper trap: its `first_strict_descent` iterates `range(len(poly)-1)`, omitting the terminal rank `alpha` where the zero-extended difference is `-i_alpha`. Thus a coefficient row with no earlier fall returns `None` even though the mathematical first strict descent exists. Do not use that function uncorrected for eligibility or witness claims; scan through `rank=len(poly)-1` using zero extension. The standing controls' supplied exact `T_22`/`T_60` rows have earlier descents, so this trap does not change those quoted values.

Every route should receive the same neutral definitions above; the verified high-tail condition `3p>=2a+1`; the exact algebra as a candidate lemma; the star nonvacuity row; the positive-local/negative-global control; and the imported refutation fences. A returned argument should identify the claimed theorem/counterexample with exact hypotheses, original-tree vertex and rank data, selector values, full `S`, and independently checkable arithmetic or a complete proof. No vote across routes or critics chooses status.

## Wide route directions for controller consideration

These are 18 **different** mathematical attacks, six per orientation, not claims of success or dispatch decisions.

| Seat | Direction and decisive test |
| --- | --- |
| T1 | Global incidence switching between selected leaf tags and addable vertices; produce an explicit injection or weighted inequality that proves the total deficit budget. |
| T2 | Rooted-forest component factorization of `H_v`, tracking the root-meeting generating function and cross-component `C_v`; prove a uniform coupled estimate. |
| T3 | Original support decomposition with cross-support cancellation; retain duplicate leaf tags and identify the interaction that defeats per-support positivity. |
| T4 | Minimal eligible counterexample induction under pendant branch pruning or graft reversal, with `x` and the strict selector rechecked after each operation. |
| T5 | Matching/vertex-cover structure at ranks below `2a/3`; derive a rank-sensitive addability surplus stronger than bipartite `2(h-k)` only for realizable selected cuts. |
| T6 | Independent-set polynomial recurrences with a potential designed to be monotone under tree composition while encoding the complete selected sum. |
| F1 | Exact exhaustive search at the first eligible lower-region orders, enumerating unlabelled trees and recomputing `x`, every original-leaf selector and full `S`. |
| F2 | Parametric spiders, brooms and unequal arms; derive symbolic coefficient formulas and locate a positive complete lower-region row if one exists. |
| F3 | Multi-hub star/branch-tree constructions based on positive local `T_22` phenomena; vary hub and arm parameters to overturn compensation. |
| F4 | Asymmetric support grafting to make one positive favorable fibre dominate while suppressing negative selected fibres; verify selector changes exactly. |
| F5 | Construct rooted forests with weak `D+C` budget, attach `s,v` by the converse construction, and test whether eligibility and favorability survive. |
| F6 | Convolution or long-path padding to move a fixed positive local term into an eligible lower rank while controlling the complete selected set. |
| U1 | Characterize sharpness and equality of the bipartite tagged incidence bound on rooted forests; identify structural slack terms beyond `D+C`. |
| U2 | Derive exact generating functions for selected leaf terms in two-parameter tree families, separating threshold artifacts from stable sign patterns. |
| U3 | Formulate a finite profile/linear-program dual for the global budget, then test whether all feasible abstract profiles are realizable by trees. |
| U4 | Use random independent sets or occupancy correlations to compare addable deficits across neighboring supports; state a provable global estimate with the selector. |
| U5 | Classify how `x(T)` and the favorable set change under elementary tree operations; seek a preserved invariant or obstruction to induction. |
| U6 | Seek an exact reduction of a smallest positive `S` witness to bounded branch complexity, or demonstrate why no such compression preserves rank and selector. |

Cross-orientation critics should independently attack each route's weakest hypothesis. They must recompute `(a,x,p)` and the strict `Delta_p(T-v)<0` filter; check integer zero extension, the `p-1` shift, original closed neighborhoods, and repeated leaves on one support; distinguish local, fibre and full sums; and verify any constructed graph is a connected acyclic ordinary tree. For counting proofs, check that `C` counts each set once, `D>=0` uses an honest bipartite `h>=alpha(H)`, inequality directions are not reversed, and the proposed budget actually follows. For computation, require exact integer independent-set vectors and an independently replayable tree encoding, then distinguish bounded census from a universal proof. Explicitly test every use of the r27 marked restriction and r28 Hall/SDR claims against their imported failures. Any Lean target should follow only after an exact independently reviewed informal statement and proof/counterexample contract.
