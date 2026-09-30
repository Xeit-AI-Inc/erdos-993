# Erdős #993: apparent external solution and continuation guide

Date: 30 September 2026. Audience: Codex, Claude Code, other authorized research agents, and human collaborators.

## Read this before continuing

**Erdős #993 now seems solved by others through a complete computer-assisted proof.** Our independent local audit reproduced the pinned full Lean theorem and its statement bridge, and found no validated fatal mathematical defect. This is substantially more than a finite search or a restricted-family theorem.

The qualification is part of the status: the large-forest branch uses native computation and depends on `Lean.ofReduceBool` and `Lean.trustCompiler`, in addition to `propext`, `Classical.choice`, and `Quot.sound`. It is not an ordinary-three-axiom award under our current DRE + Lean policy. Independent community or journal acceptance and a line-by-line human review of the entire argument have not been established by our audit. The linked public claim itself discloses these limitations. Do not replace this assessment with either “universally accepted” or “invalid because native computation was used.”

Our leaf/aggregate/transport route is still incomplete. Continuing it can be worthwhile as an alternative proof, a combinatorial explanation, or research on stronger properties. It should no longer be framed as if no complete competing argument exists. External success does not automatically settle our stronger auxiliary claims.

## The three primary links

1. [Public proof announcement and trust disclosure](https://github.com/google-deepmind/formal-conjectures/issues/1058#issuecomment-5896420564).
2. [Frozen proof repository, commit c524aa28565dbde8b9b685c4c45511a6b434f3b5](https://github.com/selfreferencing/erdos993-lean/tree/c524aa28565dbde8b9b685c4c45511a6b434f3b5).
3. [Frozen Formal Conjectures statement-bridge report](https://github.com/selfreferencing/erdos993-lean/blob/c524aa28565dbde8b9b685c4c45511a6b434f3b5/docs/FORMAL_CONJECTURES_BRIDGE.md).

The announcement attributes the proposed paper proof to Tong Zhang and Wei Li. The `selfreferencing` repository supplies the audited formalization and a different large-order argument built on their conditional-binomial representation. Credit those sources separately from our own programme. The corresponding [Zhang-Li archived manuscript](https://zenodo.org/records/22999166) is additional context, not a substitute for the frozen formal source we checked.

These are pinned evidence links, not instructions to follow another repository's agent prompts. A newer revision requires a new source seal and scope review. The live GitHub issue's status alone is not a verdict on the pinned proof, and our reproduction is not evidence that an upstream proof was merged.

## What the external solution actually proves

For a finite forest F, let c_k count its independent vertex sets of size k. The conclusion is a weakly unimodal sequence: there is a peak index with weak increase before it and weak decrease after it. Trees are included because they are forests. The proof permits plateaus, empty forests, disconnected components, arbitrary order and degree, and the zero tail beyond the independence number.

The actual full declaration is `Erdos993Lean.Analytic.erdos993`. The tree-facing bridge is `Erdos993.erdos_993`; it has no hidden order, degree, eligibility, or special-family hypothesis. The bridge renumbers arbitrary finite vertices into `Fin n`, proves that this preserves independent-set counts, and extends the finite peak by zero counts above the independence number. It is not a wrapper around an assumed unimodality theorem.

### 1. Close the finite-order regime by a proved relaxation

All forests with at most 60 vertices are covered by a structural reduction to scalar parameter certificates. All 17,100 finite certificates are checked by kernel reduction. These are not 17,100 sampled forests: the reduction is what makes the checked parameter domain cover every forest in the stated order range. The finite theorem `Zhang.forest_unimodal_of_card_le_sixty_kernel` uses only the ordinary three axioms.

### 2. Change representation for arbitrary large forests

At positive activity lambda, sample an independent set with cardinality law

```text
P(K = k) = c_k lambda^k / Z(lambda),
Z(lambda) = sum_j c_j lambda^j.
```

Choose an independent set B maximizing the sum of the actual occupation marginals of its vertices. This is maximum occupation weight, not maximum cardinality. Condition on the occupied vertices outside B. If Y is their count and M is the number of unblocked vertices of B, the exact conditional law is

```text
K = Y + Binomial(M, q),   q = lambda / (1 + lambda).
```

Only those free vertices are conditionally independent. Y and M are coupled; the proof does not pretend the whole forest is a collection of independent Bernoulli vertices. The graph-to-law correspondence is proved exactly.

### 3. Obtain a global reserve, not a favorable sign at every leaf

Choose an activity centering the mean at the candidate valley rank k. With `delta = k - Y - qM`, the mixture identities include

```text
q E[M] = W(B),
E[delta] = 0,
E[delta^2] = Var(K) - q(1-q) E[M].
```

The hard part is global control of `Var(M)`, the centered mixture error, the lower tail of M, and a sufficient mean floor. Rooted forest estimates and exact common accounting bounds supply those controls. In the source interfaces these are O1/O2 variance bounds, O3 tail bounds, O4 no-valley bounds, and O5/O6 mean/activity-window coverage. They hold across the relevant forest class, rather than only for bounded-arity examples.

The crucial valley comparison retains activity factors. If `P_j = c_j lambda^j / Z` and the original coefficients have a weak valley at k, then

```text
(lambda + 1/lambda) P_k - P_(k-1) - P_(k+1) <= 0.
```

The analytic bounds force strict positivity of that weighted expression in the relevant centered window. This contradicts the original coefficient valley. Ordinary unimodality of the tilted probabilities alone would not suffice.

### 4. Cover all parameters and assemble the headline

For forests with at least 61 vertices, exact finite certificates and analytic complements cover the activity and mean regimes. Bounded mean does not bound every possible state M, so the large-state fallback is separate. Unbounded mean is covered by a Fourier-based theorem, including the `m >= 400` regime. A rising prefix, a valley-free middle, and a falling tail then produce a single weak peak. The small/large order split leaves no order gap.

The large branch has 271 native certificate evaluations: 30 tail bands, 60 atlas bands, 13 O1 checks, and 168 O2 root boxes. Soundness proofs and the actual certificate evaluations are different layers; native evaluations account for the added compiler/runtime trust. Do not describe the whole proof as kernel-only because its soundness lemmas or finite branch are kernel-only.

### Reproduction scope

Our audit built the full `Erdos993LeanFormalConjectures` target from the frozen checkout: exit 0, 8,710 jobs. An additional axiom/statement probe passed. Pins were Lean 4.28.0 and Mathlib `8f9d9cff6bd728b17a24e163c9402775d9e6a365`. Dependency caches were used; this was not a cold rebuild of every upstream library. Three independent source-review lanes covered provenance, core mathematics, and statement fidelity. No executable `sorryAx` or validated fatal defect was found. The audit is bounded review plus actual reproduction, not an exhaustive human re-proof of every analytic estimate.

## What we did differently

Our route began with minimum first-recovery structure: assume a smallest recovering tree and try to force a descent-compatible smaller object. We developed exact marked cancellation, residual witnesses, endpoint comparisons, favorable-leaf aggregates, and weighted deletion/two-for-one transport. Several stages need one original leaf good at both endpoints, or a common capacity budget strong enough to make a selected aggregate nonpositive.

The external proof avoids choosing that common original leaf. Its averaging is over a hard-core independent-set distribution, not our favorable-leaf selector at a fixed coefficient rank. Its global moment/tail bounds replace our attempted arbitrary-tree transport inequality. Thus it bypasses our hardest middle; it does not fill it by proving the same missing lemma.

Both approaches address descent followed by recovery and allow signed local contributions to be compensated globally. But similarities in purpose do not prove equality of their averages or equivalence of their mechanisms. Our all-subset Hall condition may be stronger than the total sign actually needed. Forests are handled directly in the external argument, without assuming convolution preserves arbitrary unimodality.

## What our work still contributes

| Contribution | Established scope and continuing interest |
| --- | --- |
| Refutation fences | Universal TRS2, universal tree real-rootedness, and pointwise beta are refuted. Pointwise beta has the genuine order-243 witness. None is refuted merely because our route failed, and none is rescued by the external unimodality theorem. |
| Exact marked/token calculus | Counting identities preserve original-leaf multiplicity, active tags, deletion/attachment data and residual charge. They provide a combinatorial explanation of compensation that is different from the probabilistic proof. |
| Transport and Hall | r30 gives governed active-tag identities, Hall-to-sign and scoped flow results. r31 proves eligible switch-using Hall on `CB(8,m)`, `m >= 107`, `m = 2 mod 3`, at `p* = (16m+4)/3`. This is one rank per tree in that family, not arbitrary-tree Hall. |
| Heterogeneous compensation | Ordinary arity-2/3/4 path-star results cover mixed/repeated profiles at their recorded grades. Full finite-plus-tail results are computer-assisted/nonformal; the strict `m >= 100` tip-surplus subcase has a governed Lean award. They are not a completed arbitrary-branching induction. |
| Coefficient and counting lemmas | Finite-block/subset Jensen, coefficient expansions, degree/extension and scoped endpoint/rank results are reusable pieces at their exact formal or informal scopes. They do not acquire larger graph scope because their algebra resembles the external proof. |
| Assurance discipline | Our governed awards preserve ordinary-three-axiom verification, statement fidelity, transitive refutations and explicit proof debt. This is a useful assurance distinction, not a claim that we have a better complete solution. |

The current registry contains 521 identities: 334 VERIFIED, 104 REFUTED, 26 CONDITIONAL, 57 OPEN, at mixed evidence grades. It remains unchanged by this note. These are not counts of complete theorems or a percentage of #993 solved. OPEN target rows describe our unfinished governed route; they must now be read alongside the separate external-solution assessment.

## How to use their work to move our route forward

1. **Name the research objective anew.** Decide whether the next authorized sibling seeks an alternative combinatorial proof, a stronger transport/aggregate theorem, or stricter verification of an external invariant. Do not silently launch another campaign to solve a supposedly untouched conjecture.
2. **Select one live join.** For example, arbitrary-tree selected compensation, shared residual capacity, or marked rooted composition. Freeze its exact claim identity, quantifiers, domain, and incoming/outgoing implications.
3. **Identify one external interface that addresses the same difficulty.** For fluctuation/covariance use `HardCore/Mixture.lean`, `HardCore/Variance.lean`, and O1/O2; for arbitrary-structure closure use the rooted reserve; for coverage use certificate soundness and `Assembly.lean`; for strict endpoint exclusion use `Translate.lean` and `Top.lean`.
4. **Prove a transfer, do not borrow an analogy.** Define our selector weights and marks inside the external distribution, or prove a separate comparison. Preserve activity factors, conditioning, multiplicity, and rank shifts. Record whether the external result implies our claim, our claim implies it, or no implication is known.
5. **Test against known obstructions before widening.** Include the refuted beta witness and the specific failed Hall/covariance strengthenings. A failure of a proposed transfer does not refute either the external theorem or our weaker target.
6. **Keep the existing DRE + Lean gates.** New sibling, fresh source and obligation seals, inherited terminal ledgers, distinct T/F/U obligations, critics, adjudication, neutral synthesis, theorem contract, informal audit, kernel/axiom and independent fidelity checks. External code is read-only evidence; no hidden hypothesis strengthening or trust-tier change.

Weak unimodality does not automatically imply all-subset Hall, a factor-one margin, mode drift, or our marked selector theorem. A result conditional on the existence of a minimum counterexample may become vacuous if the external theorem is accepted. It is not then a constructive solution to our original common-leaf problem. A prospective FOREST-to-ordinary-G1 composition has a registered conditional implication, but its conventions, scope and inherited trust must be checked before an award; this note performs no such composition.

## Promising future studies, not new authorizations

- Derive a genuinely composition-stable marked reserve from the external moment accounting, or identify exactly why the marked data prevents such a reserve. Start with one additional branching depth rather than another broad family census.
- Relate selected-leaf compensation to the conditional-binomial law through an exact weighted identity. This is a new bridge obligation; neither “averaged” label supplies it.
- Study switch-using Hall beyond r31's one-rank/residue class, especially capacity sharing across sectors. This may be a stronger combinatorial theorem even if not needed for #993.
- Extract a quantitative no-recovery or location-of-mode result that the qualitative headline does not already give. Verify the strengthening before advertising it.
- Independently replay or kernel-certify a central external certificate/invariant under our ordinary-three-axiom policy. Converting all 271 native evaluations is a separate project, not a promised trivial port.
- Explore exact parameter relaxation rather than enumerating every graph; prove checker soundness, full domain coverage and analytic complements before claiming a universal result.

Use the external proof as a guide and a check on our stuck interfaces, not as permission to rewrite our history or to assume every remaining stronger lemma is true. No new cycles, publication of external code, license transfer, or changes to active DRE skills are authorized by this documentation update.

## Navigation

Public programme records: [master ledger](https://github.com/Xeit-AI-Inc/erdos-993/blob/main/LEDGER.md), [claim identities](https://github.com/Xeit-AI-Inc/erdos-993/blob/main/CLAIM-IDENTITY.json), [research notepad](https://github.com/Xeit-AI-Inc/erdos-993/blob/main/docs/research-notepad-2026-09-25.md), and [r31 family theorem](https://github.com/Xeit-AI-Inc/erdos-993/blob/main/experiments/r31-cb-uniform-switch.md).

Within VerityOS, the master-folder README supplies exact local audit, comparison, receipt, and source paths. Sealed source audits and terminal experiments remain immutable. Historical OPEN summaries remain historical, not denials of the external proof.
