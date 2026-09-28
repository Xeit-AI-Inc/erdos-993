---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: C4-JENSEN-FORMALIZER
critic_id: C4-JENSEN-INFORMAL
attestation_id: e993-c4-jensen-informal-2026-09-28
claim_sha256: f31f24451a815efa5d51d6c21199dd41610e692c5a5767d5607ad5a6ca021a6a
---

# Informal Proof Integrity Audit

## Intended Claim

For every finite index type I, including the empty type, positive natural block sizes r_i, and real coefficients f_i(t) satisfying f_i(t) >= binomial(r_i,t) for every natural t <= r_i, put M=sum_i r_i, F_i(X)=sum_(t=0..r_i) f_i(t) X^t, and H=product_i F_i. For every natural k <= M let S be uniform among the actual k-element subsets of the labeled disjoint union V=Sigma_(i:I) Fin(r_i), and K_i its number of elements in block i. Put c=binomial(M,k), w_i(t)=f_i(t)/binomial(r_i,t), and y=sum_i sum_(t=0..r_i) p_i(t) * 2(f_i(t)-binomial(r_i,t))/(f_i(t)+binomial(r_i,t)), where p_i(t)=binomial(r_i,t)*binomial(M-r_i,k-t)/c if t<=k, and zero otherwise. Then, for every natural d, H[k]/c equals the actual uniform-subset average of product_i w_i(K_i), H[k] >= c*exp(y), and c*exp(y) >= c*sum_(a=0..d) y^a/a!. Binomial coefficients above their upper support are zero; the guard t<=k precedes natural subtraction. All three conclusions are required. Empty I, k=0, k=M, repeated sizes, blocks of size one, and d=0 are included. No independence of the conditioned block counts is assumed. No graph, deletion, first-descent, selector, or payment conclusion is asserted.

The statement above is the exact `theorem.informal_statement` in `THEOREM-CONTRACT.yaml`; SHA-256 of its UTF-8 text after `' '.join(statement.split())` is the frontmatter value. It matches `SOURCE/INTENDED-STATEMENT.txt` after removal of its final newline. The contract's expected Lean statement likewise matches `SOURCE/EXPECTED-STATEMENT.txt` after final-newline removal, and its raw statement SHA-256 is `c044c8911cc997346d0295442122d98ae5a222aa0a50a6800214f62d51a3f396`.

## Reproduced Mathematical Evidence

I read the theorem contract in YAML and Markdown, both receipts, all seven listed SOURCE files, and the input manifest. Fresh SHA-256 computations matched **all 11** manifest members byte for byte. The theorem-contract receipt says structural validity only (`proof_claim: false`); the reviewer-assignment receipt identifies C4-JENSEN-FORMALIZER as producer and C4-JENSEN-INFORMAL as independent mathematical reviewer. The proof below uses the specified definitions, not any source assertion of truth.

Write `B_i = { (i,v) : v in Fin(r_i) }`, `c_i(t) = binomial(r_i,t)`, and `Omega_k = {S subseteq V : |S|=k}`. These are actual labeled sets: the tags `i` keep blocks distinct even when their sizes coincide. The disjoint union has `|V|=M`, so `|Omega_k|=binomial(M,k)=c>0` for `0<=k<=M`. Every `S in Omega_k` has a block fiber `S_i={v:(i,v) in S}` and count `K_i=|S_i|<=r_i`; the disjoint union gives `sum_i K_i=k`. Conversely, any family of subsets `S_i subseteq Fin(r_i)` with `sum_i |S_i|=k` reconstructs exactly one `S` by attaching the tags. These maps are inverse, including for empty `I`. Thus, for any vector `t` with `0<=t_i<=r_i` and `sum_i t_i=k`, the **actual** fiber `{S in Omega_k: K_i(S)=t_i for all i}` has cardinality `prod_i c_i(t_i)`. Summing fibers gives `sum_{sum t_i=k} prod_i c_i(t_i)=c`. In particular, the joint count law is derived from the uniform labeled subsets, never postulated.

The factors in `e993BlockProduct` are precisely the truncated polynomials `F_i(X)=sum_{t=0}^{r_i} f_i(t) X^t`. Finite distributivity and the monomial coefficient rule give

`H[k] = sum_{0<=t_i<=r_i, sum_i t_i=k} prod_i f_i(t_i)`.

For every supported `t`, `c_i(t)>0`, and the floor hypothesis gives `w_i(t)=f_i(t)/c_i(t)>=1`. Substituting `f_i(t)=c_i(t)w_i(t)` into this expansion and using the established fiber cardinalities yields

`H[k] = sum_{S in Omega_k} prod_i w_i(K_i(S))`.

Division by `c=|Omega_k|` is valid and gives exactly `e993SubsetAverage`, whose denominator is the cardinality of the **actual** `powersetCard k`. This proves the first conjunct, including the empty product and empty tuple conventions.

Fix a block `i`. The complement `V\B_i` has exactly `M-r_i` labels. If `t>k`, no `S in Omega_k` has `K_i=t`, so the probability is zero. If `t<=k`, choosing `t` members of `B_i` and `k-t` of its complement is a bijection onto `{S in Omega_k:K_i=t}`. Its cardinality is `c_i(t) binomial(M-r_i,k-t)`, with the latter binomial zero when `k-t>M-r_i`. Hence the one-block marginal is exactly the displayed guarded `p_i(t)` for every `0<=t<=r_i`. This uses neither nor implies independence among the `K_i`.

Put `Z(S)=sum_i log(w_i(K_i(S)))`. All logs exist because every observed weight is at least one. The exponential addition law gives `exp(Z(S))=prod_i w_i(K_i(S))`. Convexity of the exponential on the finite **joint** uniform law yields

`H[k]/c = E_{S in Omega_k} exp(Z(S)) >= exp(E_{S in Omega_k} Z(S))`.

For `u>=1`, define `g(u)=log u-2(u-1)/(u+1)`. Direct differentiation on `u>0` gives `g'(u)=1/u-4/(u+1)^2=(u-1)^2/[u(u+1)^2]>=0`; the denominator is strictly positive and `g(1)=0`. Therefore `log u>=2(u-1)/(u+1)`. Setting `u=f_i(t)/c_i(t)` gives exactly `2(f_i(t)-c_i(t))/(f_i(t)+c_i(t))`, since `c_i(t)>0`. Finite linearity of expectation and the proved one-block marginal now give `E Z >= y`. The exponential is increasing, so `H[k]/c >= exp(y)`; multiplication by `c>0` proves `H[k]>=c exp(y)`.

Every `p_i(t)>=0`; every displayed rational surplus is nonnegative because `f_i(t)>=c_i(t)>0`. Thus `y>=0`. For any natural `d`, the exponential power series at nonnegative `y` has nonnegative terms `y^a/a!`, including all omitted terms. Consequently `sum_{a=0}^d y^a/a! <= exp(y)`. Multiplication by the same positive `c` proves the third conjunct **for every** `d`, including zero. This argument also covers `y=0` exactly.

## Independent Critic Pass

- I checked the complete proof lead against the exact definitions and expected signature. The argument needs no assumption beyond finite `I`, positive `r_i`, the supported coefficient floors, and `k<=M`. Values `f_i(t)` for `t>r_i` are arbitrary and unused by the explicit truncation. In particular, a term above one block's support must not enter a coefficient at a rank that is still at most `M`.
- Empty `I` forces `M=k=0`: `V` is empty, `Omega_0` contains one empty subset, `H[0]=c=1`, `y=0`, and every Taylor floor is one. At general nonempty `k=0`, the only subset is empty, but `f_i(0)` can exceed one; then `H[0]=prod_i f_i(0)` and `y=sum_i 2(f_i(0)-1)/(f_i(0)+1)` can be positive. At `k=M`, every block count is `r_i`, and its marginal is one there. Blocks of size one and repeated sizes cause no exceptional division or counting rule.
- The guard before natural subtraction is essential. For one block of size one, `f(0)=2`, `f(1)=4`, and `k=0`, the correct exponent is `2/3` and `H[0]/c=2`. If `k-t` were first interpreted as truncated natural subtraction at `t=1`, a spurious `6/5` would enter the exponent, giving `28/15`; then `exp(28/15)>=1+28/15>2`, a genuine failure of that **incorrect unguarded variant**. The contracted guarded claim avoids it.
- I inspected `BOUNDARY-CHECK.py`: it enumerates actual labeled combinations, computes a separate polynomial convolution, and compares the exact rational average and guarded marginal exponent. Its checks at `d=0,1,2,4` compare rational Taylor floors with the average; they do not numerically establish the transcendental `exp` inequality or cover arbitrary `d`. I independently enumerated subsets by bit masks and recomputed coefficients, actual fibers, marginals, and floors at `d=0,1,2,4,8` for all **31 rows across nine cases** in `BOUNDARY-CHECK.json`; every stored rational value agreed. Notable rows include empty `I`; one size-one block with `f=(2,4), k=0`, yielding normalized coefficient `2` and `y=2/3`; the same block at full rank; and repeated sizes `(2,2), k=2`, yielding `8/3` and `14/15`. These calculations are finite diagnostics; the preceding counting and analytic arguments supply universality.
- I tried the boundary and variant failures above as counterexample probes. None contradicts the exact theorem. The joint Jensen step does not factor the conditioned block counts; the marginal calculation is used only after linearity of expectation. The rational log comparison is valid for arbitrarily large real coefficients above the binomial floors, and the Taylor comparison uses the proved sign of `y`.

## Verdict

**Passed as an informal mathematical proof-integrity audit of all three exact conjuncts.** The actual-subset coefficient identity, displayed guarded hypergeometric Jensen exponent, and every nonnegative Taylor truncation follow under the stated hypotheses. This is an informal verdict only: I ran no Lean build and make no claim of kernel verification or formalization fidelity. Graph, rank, selector, deletion, and payment conclusions are outside this theorem.
