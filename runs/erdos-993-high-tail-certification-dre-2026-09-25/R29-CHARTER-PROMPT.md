# r29 Charter Prompt (verbatim record)

Ashton, 2026-09-25 (to the controller, Claude Fable 5.1, in the VerityOS Claude Code session):

> I have a new prompt from Codex for you to work on. Please confirm that Opus 5.5 med and high will work where the
> Opus 5 did. Otherwise, do 6 cycles max with our DRE + Lean flow.

Controller's transport probe (2026-09-25, before this root was built): an Agent seat launched with the `opus` alias
reported its runtime model id as `claude-opus-5-5[1m]`, read `verity.md` and returned `2^22 = 4194304`. Opus 5.5 is
therefore chartered for every seat that r26–r28 chartered as Opus 5 (critics medium; adjudicators, synthesis, Stage 7
seats and second readers high).

The Codex prompt (GPT-6), pasted by Ashton, verbatim:

---

Work on a new, separately governed successor to the completed first-interior aggregate experiment: certify the uniform high-tail mechanism and derive its non-residual top-rank consequence.

First refresh your context
Read the newest canonical registry, master ledger, research notepad, roadmap and completed experiment records. Preserve any newer work; do not assume the registry or repository still matches an earlier snapshot.

Repository:
https://github.com/Xeit-AI-Inc/erdos-993

Canonical master:
 /Users/ashtonsperry/VerityOS/experiments/erdos-993-master-ledger-2026-09-04/

Essential inputs:
- The first-interior experiment, its verified Lean package, FINAL-ANALYSIS.md, theorem contract and verification receipts.
- r26's top-rank residual theorem.
- r27's four packages and the fresh review at docs/r27-fresh-review-2026-09-25.md.
- Code's completed r28 Hall/SDR experiment.
- docs/research-notepad-2026-09-25.md and docs/roadmap.md.

The latest publication known when this prompt was written is commit 713f0df, with 407 registered identities. Treat this as a starting reference, not an assertion about current state.

Why this work matters
The exact first-interior aggregate at p = alpha(T)-2 is formally verified, but only that primary statement received an award. Its proof contains a rank-uniform mechanism that could establish an entire high-tail region. Separately certifying that mechanism would give the remaining aggregate search a precise, reusable boundary.

This is principally proof extraction, endpoint work and governed verification. Do not run another broad search for a proof already contained in the existing package.

Definitions
Let i_j(G) count independent j-sets, with integer zero extension outside the natural range. Set Delta_j(G) = i_(j+1)(G)-i_j(G). Let x(G) be the first STRICT descent; a plateau is not a descent.

For an ORIGINAL degree-one vertex v of G, let s_v be its original support and define:
  H_v = G - {v,s_v}
  R_v = G - N_G[s_v]
  W_v = N_G(s_v) \ {v}.

Let q_v(j) count independent j-sets of H_v meeting W_v. Thus
  q_v(j) = i_j(H_v)-i_j(R_v).

The leaf contribution at rank p is
  q_v(p)-q_v(p-1)
  = Delta_(p-1)(H_v)-Delta_(p-1)(R_v).

For a tree T, define the favorable selector at the ORIGINAL rank:
  F_p(T) = {v : v is an original leaf and Delta_p(T-v)<0}.

Every original leaf is a distinct tag, including leaves sharing a support.

Targets

1. Certify the registered tagged-shadow bound:
   E993-BIPARTITE-TAGGED-SHADOW-BOUND

   For every finite bipartite simple graph H, arbitrary vertex subset W,
   a = alpha(H), and natural k with 1 <= k <= a, let q_j count independent
   j-sets meeting W. Prove, over the integers:
     k q_(k+1) <= 2(a-k) q_k.

   Preserve disconnected graphs, isolates, empty W and terminal layers.

2. Certify the registered uniform pointwise high-tail statement:
   E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE

   For every finite bipartite simple graph G, original leaf v, and integer
   p >= 1 satisfying 3p >= 2alpha(G)+1:
     Delta_(p-1)(H_v)-Delta_(p-1)(R_v) <= 0.

   No residual, favorable-selector or connectivity hypothesis may be added.
   Handle p=1 explicitly: the available generic helper was described as
   requiring p>=2. Also handle zero counts and out-of-support ranks.

   Derive the corresponding favorable-leaf aggregate in this high-tail
   region as a corollary, preserving the original selector and tags.

3. Certify the separately registered first-interior eligibility guard:
   E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN

   For finite ordinary trees T, with integer p=alpha(T)-2:
     x(T)+2 <= p  implies  alpha(T)>=7.

   Inspect and extract the existing proof before attempting new mathematics.

4. Register and certify the proposed NON-RESIDUAL eligible top-rank corollary:

   For every finite ordinary tree T, put p=alpha(T)-1. If x(T)+2<=p, then:
     sum over v in F_p(T)
       [Delta_(p-1)(H_v)-Delta_(p-1)(R_v)] <= 0.

   Audit the low-alpha exclusions and show that eligibility puts this rank
   within the proved high-tail region. This needs its own exact identity
   and contract; do not retroactively widen r26 or the first-interior award.

Scope and coordination
Astra's proposed parallel experiment concerns complete selected-sum
compensation in the complementary eligible region:
  3p < 2alpha(T)+1.

Your assignment is the high-tail certification and its stated consequences.
Do not open a competing lower-region compensation experiment.

The fresh r27 review showed that the global root correction does not
automatically control marked rank growth. Universal Hall/SDR slot dominance
was refuted by r28. Neither is an available universal shortcut.

The completed census gives M(6)=22 and K1-addition closure through x<=6 at
census-dependent grades. Do not promote those computations into Lean
theorems or introduce them unnecessarily into an otherwise structural proof.

Execution and deliverables
Use the governed DRE + Lean workflow supplied for this task. Start a new
successor workspace and preserve sealed prior experiments and source bytes.

Before formalization, freeze exact statements and independently audit:
- mathematical hypotheses and endpoints;
- carrier, coefficient, deletion and selector definitions;
- dependencies on existing declarations;
- the distinction between a compiled internal lemma and a separately
  awarded theorem.

Use the pinned Lean project/toolchain. Require kernel, permitted-axiom,
informal-proof and statement-fidelity checks for each awarded contract.

At completion:
- provide the exact verified statements and dependency diagram;
- distinguish extracted results, endpoint additions and corollaries;
- report any unresolved obligation without weakening the requested statement;
- reconcile the latest registry, ledger, research notes and public repository,
  preserving concurrent updates and historical evidence.

Success is a reusable, precisely certified high-tail boundary and the stated
top-rank consequence. It is not a proof of the all-rank aggregate, TREE,
FOREST, no-recovery or Erdős #993.

---

Live check at Stage 1 (controller, 2026-09-25): public `main` at `713f0df` (pulled; clean); master registry 407 identities
(245 VERIFIED / 92 REFUTED / 26 CONDITIONAL / 44 OPEN); the three auxiliary keys are OPEN with `formal_award: false`;
`E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` VERIFIED `formally_verified`; `E993-R26-TOP-RANK-RESIDUAL-SIGN` VERIFIED.
