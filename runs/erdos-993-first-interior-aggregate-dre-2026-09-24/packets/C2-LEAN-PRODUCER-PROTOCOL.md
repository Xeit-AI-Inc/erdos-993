# C2 primary Lean producer protocol
This is the formalization phase after the independent informal audit passed and the v2 theorem contract validated. These permissions replace the DRE search/critique ban on Lean builds only for assigned formalization producers. All verdicts remain draft until canonical registration, kernel verification and independent fidelity review.

Local B: /Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-first-interior-aggregate-dre-2026-09-24
Canonical REMOTE run: /Users/ashtonsperry/VerityOS/experiments/erdos-993-first-interior-aggregate-dre-2026-09-24/runs/lean-2026-09-24-c2-primary-v2
Local mirror: B/runs/lean-2026-09-24-c2-primary-v2
Remote project: <run>/LeanProject
Remote common immutable source: <run>/STAGING/BASE.lean (also local mirror).

Read v2 THEOREM-CONTRACT.yaml, SOURCE/CANDIDATE-PROOF.md, EVIDENCE/INFORMAL-AUDIT.md, receipts/informal-audit and theorem-contract (uppercase RECEIPTS paths), STAGING/BASE.lean and STAGING/BASE-ENTRY-MAP.json. Read governance/skills/lean-formalization/skill.md and lean-proof-workflow/skill.md. Canonical shared Mathlib may be searched read-only at /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/mathlib (revision 905b95818eb32af7874a58b427f50c1711a5e96c).

Only write your assigned remote STAGING/{core,guard,leaf} and your assigned local scratchpad/C2-LEAN-{CORE,GUARD,LEAF}. No writes to other producer directories, common base, generated Main.lean, contract, receipts, shared package/project, master ledger or public repo. Controller owns integration, immutable source registration and canonical receipts. Do not create subagents. Send interface problems to controller promptly. Do not silently weaken an interface or final target.

Connectivity: SSH mini-away, control socket /Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/g1.sock. Local helper /Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/g1-dre-preparation/remote.py accepts Python stdin. Its default R is an OLD experiment: always explicitly define your current run path, NEVER write its default R. Use argument-array subprocess calls, not interpolated shell commands.

Pinned binaries: /Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin/{lake,lean}. Set PATH to this directory plus existing PATH when launching. A draft check may concatenate unchanged BASE.lean with your own fragment into <run>/STAGING/ROLE/Check.lean, then run [lake, 'env', lean, absolute_Check_path] with cwd <run>/LeanProject. Preserve final source and real output logs. Do not run lake clean, lake update, install/download dependencies, copy packages, or write shared packages. The project has an approved read-only shared symlink and verified exact pin. No sorry, admit, native_decide or unapproved axioms in submitted proof; do not assume an unproved helper via an axiom. Temporary incomplete proof attempts must never be labeled successful.

Shared definition: E993Interior.taggedFamily G U W k is the finite family of independent k-subsets of U meeting W, encoded as (U.powersetCard k).filter (independent and not Disjoint A W). It is already in the common BASE. Use existing C4LA1/C5LA1 definitions unchanged. Avoid new top-level definitions; if truly needed put them in a separately identified definitions fragment for controller registration before all lemmas. Helper lemmas should use a role-specific subnamespace to avoid collisions. Primary public interface names below live in E993Interior.

## Core interface
Prove a universal finite bipartite tagged-family count bound:
```
theorem taggedShadowBound {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite)
    (U W : Finset V) (a k : ℕ)
    (hcap : ∀ A : Finset V, A ⊆ U → G.IsIndepSet (A : Set V) → A.card ≤ a)
    (hk : 1 ≤ k) :
    k * (taggedFamily G U W (k + 1)).card ≤
      2 * (a - k) * (taggedFamily G U W k).card
```
Nat subtraction is intended for this intermediate bound; if k exceeds the independent-set capacity, the layers vanish. Final claim still uses signed integer coefficients. A direct 2-coloring partitions all available vertices, including isolates; IsBipartiteWith alone need not give a partition covering isolates.

## Guard interface
```
theorem eligibleAlphaGeSeven {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) :
    7 ≤ G.indepNum
```
Use the audited standalone proof, existing base pair/triple counts, and explicit C5/G1 coefficient equality. No imported r27 order bound is needed. In particular no alpha>=7 premise or finite enumeration replaces the universal proof. The one-/two-vertex complements are VERTEX covers.

## Leaf interface
Prove high-tail aggregation CONDITIONAL ONLY on the exact universal shadow interface, so this module can compile independently of core:
```
theorem highTailAggregateFromShadow {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (hShadow : ∀ (U W : Finset V) (a k : ℕ),
      (∀ A : Finset V, A ⊆ U → G.IsIndepSet (A : Set V) → A.card ≤ a) →
      1 ≤ k → k * (taggedFamily G U W (k + 1)).card ≤
        2 * (a - k) * (taggedFamily G U W k).card)
    (p : ℕ) (hp : 2 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.aggregate G p ≤ 0
```
This intermediate theorem may assume hShadow; the final contract theorem MUST discharge it using the core proof and tree bipartiteness. Prove exact tagged-layer difference and independent-cap bound by inserting the original leaf. Keep every original leaf, original support/neighborhood, strict selector and multiplicity. The primary only needs p>=5; p=1 is not claimed by this intermediate interface.

## Deliverables
Return a role fragment (namespace wrappers included; no import/Base duplication), optionally complete helper fragments, a successfully compiled Check.lean and real check log, and REPORT.md with exact proven declarations, interfaces, remaining gaps, commands and job status. Mirror the final fragment/report/log locally in your assigned scratchpad when feasible. Do not claim hashes, timestamps or formal status: controller computes and verifies them. No candidate proof is a registry award until the full governed gate passes.
