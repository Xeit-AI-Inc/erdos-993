# First-interior aggregate: terminal report

**The exact first-interior ordinary favorable-leaf aggregate is formally verified.** The experiment ended after two complete cycles out of a maximum of six because its frozen primary was resolved. The final independent Astra-high analysis accepts decisive closure with no primary blocker. Erdős #993, tree/forest unimodality, the all-rank ordinary aggregate and governed beta aggregation remain open.

## Exact result

For every finite ordinary connected acyclic simple graph T, let p=alpha(T)-2 as an integer. If the first strict negative independence-coefficient difference x(T) satisfies x(T)+2<=p, then

`S(T,p) = sum_{v original leaf, Delta_p(T-v)<0} [Delta_(p-1)(T-{v,s_v}) - Delta_(p-1)(T-N_T[s_v])] <= 0`.

Counts use integer zero extension. Supports and closed neighborhoods are original; leaves sharing a support retain distinct tags. The strict selector stays at the original p. No residual hypothesis or alpha>=7 premise is added. Empty sums are zero. The proved declaration is `E993Interior.firstInteriorAggregate`, under exactly `G.IsTree` and the original rank-window hypothesis.

## Why the proof works

For a bipartite graph H and marked vertex set W, write q_j for the number of independent j-sets meeting W. Every tagged (k+1)-set has at least k tag-preserving deletions. An independent k-set has at most 2(a-k) available extensions if independent-set size is at most a: its addable vertices form a bipartite graph, and each color class can be adjoined to that set. Double counting yields `k*q_(k+1)<=2(a-k)*q_k`.

For an original leaf v, set H=T-{v,s_v}. Tagging H-sets by the original closed neighborhood of s_v gives precisely the difference between the H and R counts. Any H-independent set can be extended by v, so a=alpha(T)-1 is a valid bound. At p=alpha(T)-2, k=alpha(T)-3, alpha>=7 makes the tagged layers nonincreasing; hence every original-leaf term is nonpositive, and so is their selected sum.

Eligibility itself implies alpha>=7. Exact tree pair/triple counts exclude alpha=4,5 and alpha=6 at all orders. The order-seven and order-eight cases use complements of maximum independent sets as one-/two-vertex covers. These are universal finite-set arguments, not census substitutes. The proof carries the r25/r26 count definitions into one source and supplies explicit count/delta equalities; no unproved r27 transport is assumed.

## Verification and evidence

The frozen v2 theorem contract, independent informal audit, canonical source registration, project build, single-file Lean check, axiom policy, source-immutability check, independent statement-fidelity audit, and canonical workflow close passed. Final status is `formally_verified`, with no workflow failures. The final Astra-high reviewer independently checked the proof, 31 pinned inputs, seven receipt hashes and all 53 synthesis occurrence mappings; its decision is `accept_primary_decisive_close`.

Lean is `leanprover/lean4:v4.32.2`, Mathlib is `905b95818eb32af7874a58b427f50c1711a5e96c`, and the only reported axioms are `Classical.choice`, `Quot.sound`, `propext`. No sorry/admit/native_decide or extra mathematical assumption is admitted. There are 45 registered source units in the package; they constitute one primary contract, not 45 new theorem awards. Shared dependencies were bound read-only; no package cache is copied into the delivery.

- [Exact contract](runs/lean-2026-09-24-c2-primary-v2/THEOREM-CONTRACT.yaml)
- [Formal source](runs/lean-2026-09-24-c2-primary-v2/LeanProject/LeanProof/Main.lean)
- [Canonical verification report](runs/lean-2026-09-24-c2-primary-v2/VERIFICATION-REPORT.md)
- [Independent fidelity report](runs/lean-2026-09-24-c2-primary-v2/REVIEW-SUBMISSIONS/fidelity/REPORT.md)
- [Final Astra-high analysis](FINAL-ANALYSIS.md)

## What the cycles contributed

Each cycle completed nine isolated searches (three T, three F, three U, GPT-6 Luna high), eighteen cross-orientation critiques, three origin adjudications and one neutral synthesis (GPT-6 Sol high). Sol-high formal producers and distinct informal/fidelity reviewers completed the formal phase. C1 supplied exact identities, the corrected restricted T_m family formula and bounded examples but left the primary unresolved. C2 supplied the universal tagged argument and low-alpha exclusion. Cycles 3–6 were not started after decisive resolution. The earlier requested pause was honored at the critique-stage boundary and explicitly resumed by the user.

All 53 synthesis occurrences remain in [the terminal occurrence table](TERMINAL-CLAIM-OCCURRENCES.csv), preserving 27 C1 and 26 C2 statements, scopes and original proposed statuses. Seven occurrences are linked to the one primary certificate. Repeated family formulations, finite fixtures, alternate conditional routes and corrected source mistakes do not become additional universal awards.

## Registry and remaining work

Only `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` changes OPEN -> VERIFIED at `formally_verified`; all other 394 claim objects remain unchanged. The terminal registry has 395 identities: 236 VERIFIED, 89 REFUTED, 26 CONDITIONAL and 44 OPEN. These mixed evidence grades are not a formal-theorem count. The three separately registered auxiliary keys retain OPEN certificate status despite supported mathematics and compiled internal lemmas; this primary-only contract does not silently widen their awards.

The internal mechanism works in the high-tail range p>=2 and 3p>=2alpha+1. The strongest next steps are (1) separately certify its reusable auxiliary/high-tail forms and the proposed non-residual top-rank consequence, (2) attack selected aggregate compensation in the eligible lower region, and (3) prove precisely the representation/implication links required by a chosen broader objective. The final analysis records an exact proposed incidence-deficit budget for the second task. It is an unawarded analytical direction, not a proved lower-region bound or a new experiment.

The ordinary all-rank aggregate is a self-contained ordinary-tree target. An ordinary-to-governed-model bridge is needed only for downstream transfer to governed E993-BETA-AGG, not for proving the ordinary claim. The current result provides no percentage measure of proximity to a solution of Erdős #993. No novelty claim is made.

## Record corrections and reproducibility

The complete source corrections and their scope are preserved in the adjudications and final Astra analysis. In particular C1's false star term 3-6m-C(3m,2) is replaced in the accepted family result by 3-3m-C(3m,2); mismatched graph/rank/count labels remain explicitly narrowed. A small positive complete finite example is ineligible and is not a target counterexample. None of these finite checks replaces the universal proof.

The v1 Lean intake was superseded before formalization to repair metadata identifier/source-role grammar; the mathematical theorem and candidate proof were unchanged. The sole new definition's `noncomputable def` spelling was changed to an enclosing `noncomputable section` without changing its body. The original canonical registration helpers were used; no registration adapter was adopted. The independent audit corrected “edge cover” to “vertex cover.” The fidelity reviewer corrected a 20/21 pin-count typo before admission and freshly checked all 21 pins, without changing its attestation. The inherited aggregate docstring says “top-rank residual,” but the generic Lean body has neither restriction; verified source bytes are preserved. The sealed controller frontier note's conflation of ordinary closure and governed transport is corrected explicitly in [the final interpretation note](control/FINAL-INTERPRETATION-CORRECTION.md).

Historical C1/C2 OPEN verdicts and obligation tables remain immutable. Current status is in [TERMINAL-LEDGER.csv](TERMINAL-LEDGER.csv) and [ledgers/TERMINAL-OBLIGATIONS.csv](ledgers/TERMINAL-OBLIGATIONS.csv). Manifests bind admitted evidence; unadmitted scratch work and package caches are excluded from the public archive. Paths to original scratch locations in historical producer records have provenance value; admitted copies and canonical proof evidence are the authority. Further experiments require new authorization.
