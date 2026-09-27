# r30 charter prompt (Codex, verbatim; relayed by Ashton 2026-09-26)

Ashton: "I have a fresh experiment for you. Please read the prompt and perform our usual DRE + Lean flow." Then: "I should mention that you have full permission."

---

Run a fresh DRE + Lean experiment on correctly weighted mixed-boundary transport for the remaining ordinary-tree favorable-leaf aggregate in Erdős #993.

Use the DRE structure and model assignments Ashton supplies. This is a new successor experiment; do not reopen r29 or the completed six-cycle lower-region run.

First refresh your evidence
---------------------------

Read the newest canonical registry and ledger, rather than relying on your r29 snapshot:

- /Users/ashtonsperry/VerityOS/experiments/erdos-993-master-ledger-2026-09-04/CLAIM-IDENTITY.json
- /Users/ashtonsperry/VerityOS/experiments/erdos-993-master-ledger-2026-09-04/LEDGER.md

Read these files under:
  /Users/ashtonsperry/VerityOS/experiments/erdos-993-lower-region-compensation-dre-2026-09-25/

- REPORT.md
- FINAL-ANALYSIS.md
- FINAL-RECONCILIATION.md
- RESEARCH-NOTEPAD.md
- cycles/cycle-6/C6-SYNTHESIS/REPORT.md
- cycles/cycle-6/C6-AT/REPORT.md
- cycles/cycle-6/C6-AF/REPORT.md
- cycles/cycle-6/C6-AU/REPORT.md
- preparation/C6-FINAL-IDENTITY-REVIEW/REPORT.md

Follow their references to the original C6-T5, C6-F5 and C6-U5 evidence and correction appendices.

Public repository:
  https://github.com/Xeit-AI-Inc/erdos-993

The verified publication at this handoff is commit:
  0411905ff601d07f2e79b03a07c31d708dc04efd

It contains 434 registered identities. Check for subsequent changes before freezing inputs. Preserve all existing results, evidence grades, refutations and historical snapshots.

Why this experiment matters
---------------------------

R29 settled the high-tail mechanism. The lower-region experiment formally settled the stated order bands through n <= 2p+2 and established restricted family results. The arbitrary-tree lower-region aggregate remains OPEN.

Individual selected leaf terms can be positive. A successful general argument must exploit compensation across distinct original leaf tags. Weighted transport using deletion and two-for-one switches is a concrete sufficient mechanism for that compensation, but its universal feasibility remains OPEN.

Two Cycle 6 network arguments used incorrect weights. Both errors survived opposing critique before later correction. Therefore relation and weight fidelity are mathematical prerequisites for this experiment.

Exact underlying aggregate
--------------------------

Let T be a finite ordinary tree. Define
  Delta_j(T) = i_{j+1}(T) - i_j(T)
using integer zero extension. Let x(T) be the first strict descent, including the terminal difference, and a = alpha(T).

Consider natural p satisfying:
  x(T)+2 <= p,
  3p < 2a+1.

Fix the original selector:
  F = {v an original leaf of T : Delta_p(T-v) < 0}.

For each v in F, use its original support s_v and put:
  H_v = T - {v,s_v},
  W_v = N_T(s_v) \ {v},
  R_v = T - N_T[s_v],
  q_v(j) = i_j(H_v) - i_j(R_v).

The complete target is:
  S(T,p) = sum_{v in F} [q_v(p)-q_v(p-1)] <= 0.

Keep F fixed throughout the comparison. Leaves sharing a support remain separate tags. Do not replace original neighborhoods by recomputed neighborhoods.

Exact candidate transport
-------------------------

For every independent set B of T define the ACTIVE-TAG weight:
  w_F(B) =
    #{v in F intersect B :
      (B \ {v}) intersect W_v is nonempty}.

Source vertices are independent (p+1)-sets, with supply w_F(B).
Target vertices are independent p-sets, with capacity w_F(A).

Allow an edge B -> A exactly when either:

1. A is obtained by deleting one vertex from B; or
2. choose u outside B with exactly two neighbors in B, remove those two
   neighbors, and insert u:
     A = (B \ N_T(u)) union {u},
     |N_T(u) intersect B| = 2.

Verify rank and independence directly. Relation edges have no additional bottleneck capacity.

The candidate weighted Hall assertion is:
  For every source subfamily X,
  sum_{B in X} w_F(B)
    <= sum_{A in N(X)} w_F(A).

This implies an integral source-saturating flow and hence S(T,p) <= 0. It is a sufficient mechanism, potentially stronger than the scalar aggregate. Failure of this relation does NOT by itself refute the aggregate or Erdős #993.

Every computational instrument must independently verify:
  total source supply - total target capacity = literal S(T,p).

Counting merely |F intersect B| is wrong.

Concrete structural starting point
----------------------------------

Use the corrected CB(8,92) example as a stress test.

Construct path r-s-v. Attach 92 choke vertices u_i to r. Attach eight support vertices b_ij to each u_i, and one private leaf c_ij to each b_ij.

The recorded graph has:
  n=1567, alpha=829, x=490, p=492.
All 737 original leaves are favorable, and the complete aggregate is negative.

In the sector containing both r and v, all choke vertices are absent. The remaining choices lie in 736 disjoint support-leaf pairs.

Every member of this sector has active-tag weight ONE:
the arm leaf v is active, while all private leaf tags are inactive.

The residual upper and lower layers have ranks 491 and 490:
  |R_j| = 2^j binom(736,j),
  |R_491| / |R_490| = 492/491.

This is a genuine deletion-only shortfall. The earlier ratio 493/491 came from an incorrect weight.

Investigate whether two-for-one switches recover the deficit. In particular, removing r and a selected support and inserting its choke can activate private-leaf tags. Derive the exact conditions and capacities; do not assume such switches always exist or are sufficient.

The hard requirement is an estimate for ARBITRARY source subfamilies, with image overlap and competition for target capacities controlled. Whole-layer totals or one symmetric sector alone do not establish global Hall.

Research directions
-------------------

Assign genuinely different approaches within the supplied DRE structure:

- Weighted shadows, normalized matching and product-poset expansion.
- Deficit inequalities using matching deficiency and neighborhood structure.
- Compression, uncrossing, invariant cuts and exact orbit reduction.
- Adversarial source families with few usable switches or heavily overlapping images.
- Rooted recurrences retaining the original selector and active-tag information.
- Alternative direct compensation inequalities if Hall is stronger than necessary.

The newly registered finite-group weighted orbit-flow lifting theorem may be used at its exact informal grade: invariant integer weights, orbit-total supplies/capacities and exact quotient adjacency. It lifts a feasible quotient flow; it does not prove quotient feasibility.

The existing identity
  kS = (2a+1-3p)Q-D-C,  k=p-1,
provides a parallel route. Nonnegativity of D and C alone does not supply the required positive budget.

Required outcomes and boundaries
-------------------------------

Aim for one of:

A. A uniform weighted Hall or compensation theorem.
B. A parameter-uniform structural lemma that closes a clearly identified
   part of the missing argument.
C. An exact deficient cut satisfying every graph, rank, selector, weight
   and relation condition, independently verified as a refutation of this
   specific transport mechanism.

Use bounded computation to discover and challenge structure. Require nonempty eligibility. Avoid replacing the proof task with a huge census or repeated checks of already settled T_m controls.

After a candidate survives independent mathematical review, use the governed Lean workflow for the decisive statement at its exact scope. Keep imported informal results, finite certificates and formal awards distinguishable.

At close, report the exact statements established or refuted, remaining universal gaps, fidelity corrections, and whether the result materially advances the complete aggregate. Update the canonical registry, ledger, current research notes and public repository through the established governance process.

Do not promote a mechanism refutation into an aggregate counterexample, a finite flow into a universal theorem, or an ordinary-tree result into a governed-model result without the required bridge.
