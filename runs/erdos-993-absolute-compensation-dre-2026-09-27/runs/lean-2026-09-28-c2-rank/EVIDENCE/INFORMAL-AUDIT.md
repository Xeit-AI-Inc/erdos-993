---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: C2-RANK-FORMALIZER
critic_id: C2-RANK-INFORMAL
attestation_id: C2-RANK-INFORMAL-v1
claim_sha256: e0688020e82761c69dc9cd2b817edaac860913fbd96481e666f243c0790e4188
---

# Informal Proof Integrity Audit

## Intended Claim

This audit binds to [THEOREM-CONTRACT.yaml](../../runs/lean-2026-09-28-c2-rank/THEOREM-CONTRACT.yaml), contract `e993-any-strict-descent-rank-v1`, and its [intended-statement source](../../runs/lean-2026-09-28-c2-rank/SOURCE/INTENDED-STATEMENT.txt). The exact informal statement in the contract is:

> For every finite list rs of natural numbers whose entries are each 2, 3 or 4, let N be the sum of rs and define P(X)=(1+2X)*product_{r in rs}((1+X)^r+X)+X*(1+X)^(N+1) in rational polynomials. For every natural k, if the coefficient of X^(k+1) in P is strictly less than the coefficient of X^k in P, then 2*N<=5*k. Coefficients have their standard zero extension and the empty list is permitted.

Thus `rs` is any finite, ordered list, possibly empty and with repetitions. The only hypotheses are that each entry lies in `{2,3,4}` and that the coefficient at `k+1` is strictly below the coefficient at `k`. The conclusion is the natural-number inequality `2 * rs.sum ≤ 5 * k`. In the contract's expected Lean statement, `e993RankParent rs` denotes exactly the displayed rational polynomial; the named declaration is `e993_rank_any_strict_descent`. No first-descent minimality, positive-rank restriction, log-concavity, or graph assumption is part of this claim.

I independently parsed the contract's `informal_statement`, normalized whitespace by joining its whitespace-separated words with single spaces, and computed SHA-256 `e0688020e82761c69dc9cd2b817edaac860913fbd96481e666f243c0790e4188`. This equals the required `claim_sha256`. The source statement equals the contract statement byte-for-byte apart from its final newline. The two source files' SHA-256 values agree with the contract: `9b6cea422642d69cce006d2f71553bff96e32d69186a336f6b2d1967a3a2daf9` for the intended statement and `d5aae5b6ed0d687fe762517f74911f9513f6c95839d0bccbf2b1b65b90c0dd11` for the [rank proof lead](../../runs/lean-2026-09-28-c2-rank/SOURCE/RANK-PROOF-LEAD.md). The unnormalized SHA-256 of the contract's `lean_binding.expected_statement` is also its recorded `d04776272178640e26f7a28a630330b1a17eb3dd95b86cd0faf670fbb5def75f`.

## Reproduced Mathematical Evidence

Set `L=1+X`, `G=1+2X`, `B_r=L^r+X`, `N=sum rs`, `q=N+1`, `C=G∏_{r∈rs}B_r`, and `H=XL^q`, so `P=C+H`. All calculations take place in `ℚ[X]`. A polynomial is coefficientwise nonnegative when every rational coefficient, including its zero extension, is nonnegative. The factors `G`, `B_r`, `L`, and `X` are coefficientwise nonnegative, hence so are their products and sums; in particular every coefficient `a_j=[X^j]P` is nonnegative.

For any nonnegative integer *assigned weight* `d`, define `D_d(f)=(3+2X)f'−2df`. The ordinary product rule gives the exact identity

`D_{d+e}(fg)=gD_d(f)+fD_e(g)`.

Direct expansion gives every local certificate needed for the allowed arities:

| Factor `f` | Weight `d` | Expanded `f` | `D_d(f)` |
| --- | ---: | --- | --- |
| `G` | 1 | `1+2X` | `4` |
| `B_2` | 2 | `1+3X+X²` | `5` |
| `B_3` | 3 | `1+4X+3X²+X³` | `6+2X+3X²` |
| `B_4` | 4 | `1+5X+6X²+4X³+X⁴` | `7+6X+12X²+4X³` |

Each certificate and each factor is coefficientwise nonnegative. Repeated application of the product identity therefore shows `D_q(C)≥0` coefficientwise, since the weights sum to `1+sum rs=q`. For the empty list, this says `C=G`, `q=1`, and `D_q(C)=4`; no nonempty-list assumption is used.

The second summand has the **same assigned weight** `q`: `D_0(X)=3+2X` and `D_1(L)=1`. Applying the product identity to `L^q` gives `D_q(L^q)=qL^{q−1}` because `q≥1`. Consequently

`D_q(H)=D_q(XL^q)=(3+2X)L^q+qXL^{q−1}≥0`

coefficientwise. Additivity yields `D_q(P)=D_q(C)+D_q(H)≥0`. Weight `q` is an algebraic parameter; it need not equal degree. Indeed `deg C=q` and `deg P=q+1=N+2`, because `H` supplies the top term with coefficient 1.

For every natural `k`, including indices at and beyond the degree, differentiation and zero-extended coefficient extraction give

`0 ≤ [X^k]D_q(P) = 3(k+1)a_{k+1} + 2k a_k − 2q a_k = 3(k+1)a_{k+1} − 2(q−k)a_k`.

Here `q−k` is evaluated in `ℤ` or `ℚ` after casting, **not** as truncated natural subtraction. Suppose `a_{k+1}<a_k` but `2N>5k`. Since `N,k` are integers, `2N−5k−1≥0`, and hence

`2(q−k)−3(k+1)=2N−5k−1≥0`.

Also `a_k>0`, since `a_{k+1}≥0` and the drop is strict. Multiplication by `3(k+1)>0` and then by the nonnegative `a_k` gives

`3(k+1)a_{k+1} < 3(k+1)a_k ≤ 2(q−k)a_k`,

contradicting the coefficient inequality. Therefore every strict drop satisfies `2N≤5k`, exactly as claimed.

The boundary is included: at `5k=2N−1` the two multipliers are equal, so a strict drop is impossible. With `rs=[]`, `P=1+3X+X²`, and the proof remains valid. At the terminal index `k=N+2`, `a_{k+1}=0` under standard zero extension and the proof still applies; for larger `k` both coefficients vanish. These checks do not add hypotheses.

I read the [original independent audit](../C2-RANK-INFORMAL/INFORMAL-AUDIT.md), its [exact falsification script](../C2-RANK-INFORMAL/rank_falsification.py), and its [captured output](../C2-RANK-INFORMAL/FALSIFICATION-OUTPUT.txt). I reran the unmodified script with `PYTHONDONTWRITEBYTECODE=1 python3 rank_falsification.py 30`. It again reported `PASS`, with `5456` count profiles, `401016` checked ranks, `201378` strict drops, one empty profile, and maximum `N=120`. Its integer-convolution checks cover all count triples with at most 30 factors, local certificates, the product identity, the parent certificate, and zero extension. Commutativity makes each count triple representative of every ordering of those arities. This finite sweep is corroboration; the universal proof is the algebra above.

## Independent Critic Pass

I checked the four local derivatives directly, the weighted Leibniz identity, closure of coefficientwise nonnegativity under sums and products, the `XL^q` certificate, and the coefficient indexing at `k=0`, the last nonzero coefficient, and beyond the degree. The inequality conversion uses only integrality of `N` and `k`; it does not silently strengthen the contract with a least-descent or positivity premise. The positivity needed in the contradiction follows from the polynomial itself. The rank proof lead's direct-parent certificate is valid, and the original audit's argument is mathematically equivalent to the governed statement.

This is a **coefficient-only informal mathematical audit**. It does not establish a graph interpretation, MASS, a payment result, or a primary theorem. It does not certify a Lean build, kernel checking, or any future formalizer output. The contract's formulation and formal verification stages remain separate.

## Verdict

**Passed.** The exact contract statement hash agrees with the required attestation hash; the source hashes and expected Lean statement hash agree with the contract; the complete symbolic proof establishes the stated inequality for every allowed list and every strict descent without stronger assumptions. The original audit and reproduced finite falsification output are consistent with that proof.
