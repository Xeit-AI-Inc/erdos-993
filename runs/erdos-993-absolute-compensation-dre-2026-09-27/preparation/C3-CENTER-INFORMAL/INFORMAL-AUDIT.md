---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: C3-CENTER-FORMALIZER
critic_id: C3-CENTER-INFORMAL
attestation_id: e993-c3-center-informal-2026-09-28
claim_sha256: 471e9e3cf9f862ed406485af9cc81550065cddb55059740aca77046862120913
---

# Informal Proof Integrity Audit

## Intended Claim

For every index type with decidable equality, every finite set s of indices, every function r from the index type to the natural numbers, and every natural k, define H(X) as the product over i in s of ((1+X)^(r(i))+X) in polynomials with natural coefficients. Then the coefficient of X^k in H is the sum over all subsets t of s of the following natural number: if the cardinality of t is at most k, take binomial(sum of r(i) over i in s minus t, k minus the cardinality of t); otherwise take zero. Binomial coefficients vanish when the lower argument exceeds the upper argument. The empty index set, zero exponents, repeated exponent values at distinct indices, and all natural k are included. No degree bound by the sum of the exponents is assumed.

This paragraph is the contract's exact `theorem.informal_statement`. I independently computed SHA-256 of its UTF-8 text after `' '.join(statement.split())`; the result is `471e9e3cf9f862ed406485af9cc81550065cddb55059740aca77046862120913`.

## Reproduced Mathematical Evidence

The seven manifest members were read as bytes and independently SHA-256 checked against `C3-CENTER-INFORMAL-INPUTS.json`; all matched:

| Input relative to run directory | SHA-256 |
| --- | --- |
| `THEOREM-CONTRACT.yaml` | `6dffda6906c5394bdfaf16987700f9de7fbca424c086adc5831524494cf1c967` |
| `RECEIPTS/theorem-contract.json` | `80f423e30c67042430dba696af8a9d28742bf71c0baa94a7c6a3a8fd548533f8` |
| `RECEIPTS/reviewer-assignment.json` | `700b8c42fddcd5f9dce248b5132041cdafdc334a03ffeba4ea141e44c64133f1` |
| `SOURCE/INTENDED-STATEMENT.txt` | `aade4d13946ec0a3846c9f49471f63e19e6c6cc16fa195b6f52d559016babcf2` |
| `SOURCE/CENTER-PROOF-LEAD.md` | `8068290d523739e6a59c5a9fa6972bde426e1443f5b4c5222a55691d215c92a9` |
| `SOURCE/C3-CENTER-EXPANSION-BOUNDARY-CHECK.py` | `9b495e3a63a777ef493af037aec8cb73ab13d587fb42f88528397ee6cf641d03` |
| `SOURCE/C3-CENTER-EXPANSION-BOUNDARY-CHECK.json` | `c7e6cbd04b6ec7aa77f84f5479c92e003c3ea65fdac8af88e56d7bec55cca3db` |

The theorem-contract receipt records contract validation and explicitly says `proof_claim: false` and `formulation_truth_unverified`. The reviewer-assignment receipt names `C3-CENTER-INFORMAL` as the independent informal reviewer. Neither receipt supplies the proof below.

Let `A_i=(1+X)^(r(i))` and `B_i=X` in `Polynomial Nat`. Distributivity of a finite product over additions gives one summand for each assignment of either `A_i` or `B_i` to every *index* `i∈s`. The indices assigned `B_i` form a unique subset `t⊆s`, and conversely each subset specifies exactly that assignment. This is a bijection even when distinct indices have equal exponents. Equivalently, the complementary `A_i` indices are exactly `s\t`; the complement operation is an involution on the powerset of `s`. Thus, with each assignment counted once,

`H(X) = ∑_{t⊆s} (∏_{i∈t} X)(∏_{i∈s\t}(1+X)^(r(i))) = ∑_{t⊆s} X^(card t)(1+X)^(∑_{i∈s\t}r(i)).`

The first product is `X^(card t)` by the finite product power law; the second is `(1+X)^R` for `R=∑_{i∈s\t}r(i)` by the exponent addition law. Both laws include empty products and exponent zero in a commutative semiring. Since polynomial coefficient extraction at fixed `k` preserves finite sums, it remains to compute each summand's coefficient.

For every natural `R`, the binomial theorem in `Polynomial Nat` gives `(1+X)^R=∑_{j=0}^R choose(R,j)X^j`; equivalently its coefficient at any natural `j` is `choose(R,j)`, with `choose(R,j)=0` when `j>R`. Multiplication by `X^d` shifts all exponents by `d`. Consequently, for all natural `d,k`,

`[X^k] X^d(1+X)^R = if d≤k then choose(R,k-d) else 0.`

Indeed, when `d≤k` the sole possible source exponent is `j=k-d`; when `d>k`, no natural source exponent exists. Apply this with `d=card t` and `R=∑_{i∈s\t}r(i)`, then sum over `t⊆s`. This is exactly the contract's conclusion, including its explicit guard and its zero extension when `k-card t>R`. No degree premise is used.

I inspected the supplied boundary evaluator and its recorded output. It convolves the factors, enumerates subset masks, uses the cardinality guard, and reports 1,365 exponent profiles and 18,660 coefficient checks with no failures. I also independently computed selected coefficients from the per-factor rule `[X^j]((1+X)^r+X)=choose(r,j)+1_{j=1}` and compared with a separate subset sum:

| Exponents on distinct indices | `k` | Product coefficient | Subset sum |
| --- | ---: | ---: | ---: |
| `()` | 0, 3 | 1, 0 | 1, 0 |
| `(0)` | 0, 1, 2 | 1, 1, 0 | 1, 1, 0 |
| `(0,0)` | 2 | 1 | 1 |
| `(0,2)` | 1, 3 | 4, 1 | 4, 1 |
| `(2,2)` | 2, 5 | 11, 0 | 11, 0 |
| `(1,0,1)` | 2, 4 | 8, 0 | 8, 0 |
| `(3,0,3)` | 3 | 48 | 48 |

These finite checks corroborate edge behavior; the distributive and binomial argument, not the computation, establishes the universal identity.

## Independent Critic Pass

- **Powerset/complement:** Each index has exactly two labeled choices. `t` is the set of indices choosing `X`, and `s\t` is precisely its complement within `s`. The bijection survives an infinite ambient index type because `s` is finite. Equal exponent values do not identify distinct choices; coincident resulting monomials are correctly added with multiplicity.
- **Natural coefficients and zero exponents:** All steps use only finite distributivity, addition, multiplication, and powers in the commutative semiring `Polynomial Nat`; subtraction of polynomial coefficients is absent. If `r(i)=0`, that factor is `1+X`, and the proof still applies. For `s=∅`, both sides are 1 at `k=0` and 0 at every positive `k`.
- **Guard against truncated subtraction:** If `card t>k`, the shifted term has zero coefficient, whereas natural subtraction would return `k-card t=0`. Omitting the guard is genuinely wrong: with one index, `r=0`, and `k=0`, the forbidden singleton term would spuriously add `choose(0,0)=1` to the correct value 1.
- **Upper binomial support:** If `k-card t>R`, `choose(R,k-card t)=0`, including `R=0`. Thus no separate upper-bound condition or restriction on `k` is needed.
- **Degree premise:** A degree bound by `∑_{i∈s}r(i)` is false. With two zero exponents, `H=(1+X)^2` has a nonzero coefficient at `k=2` although that sum is 0. The proof does not invoke such a bound. The harmless bound `deg H≤∑_{i∈s}(r(i)+1)` explains why the supplied evaluator's finite range covers its sampled profiles, but is not a theorem hypothesis.
- **Counterexample search and scope:** The empty, all-zero, mixed-zero, repeated-exponent, and above-support cases checked above yielded no counterexample. The algebraic proof rules out a missing positivity, nonemptiness, distinctness, or `k`-range hypothesis. This audit concerns only the stated polynomial coefficient equality; it makes no claim about weighted expectations, Jensen inequalities, graphs, selectors, payments, or Lean kernel verification.

## Verdict

**Passed.** The exact universally quantified center-subset coefficient identity is mathematically valid under the contract's stated assumptions. The proof covers all natural exponents and `k`, including zero and empty cases; the explicit cardinality guard is essential. This is an independent informal proof-integrity verdict, not a formalization or fidelity verdict.
