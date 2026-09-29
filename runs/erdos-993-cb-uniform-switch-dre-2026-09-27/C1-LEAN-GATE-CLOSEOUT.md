# Cycle 1 Stage 7 — Lean Gate Closeout (r31)

Controller: Claude Opus 5.5, 2026-09-28. Canonical run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`. All seats Claude Opus 5.5,
chartered effort high (the platform applies the session effort); runtime-reported model id `claude-opus-5-5` on every seat. Governed
lean-proof-workflow: pinned toolchain `leanprover/lean4:v4.32.2`, Mathlib `905b9581…`, shared packages write-protected; axioms exactly
`propext`, `Classical.choice`, `Quot.sound`; independent informal audit and statement-fidelity review per award; fail-closed `close`.

| Award | Run | Terminal | Nodes | `Main.lean` | Informal audit | Fidelity | Close |
|---|---|---|---|---|---|---|---|
| C1-LA1 (L-S)_top template arithmetic | `runs/lean-2026-09-28-c1-la1-cb8-sector-template-feasible` | `E993Transport.cb8_topRank_sectorTemplate_feasible` | 33, 0 blocked | `f0578ed7…b78e` | passed `26eb1499…` | match `7cc8777d…` | **formally_verified** (`3373994c…`) |
| C1-LA3 two-binomial descent (BD) | `runs/lean-2026-09-28-c1-la3-two-binomial-descent` | `E993Transport.cb8_block_descent_topRank` | 21, 0 blocked | `c0605e12…3f011` | passed `4284d552…` | match `2e36bd12…` | **formally_verified** (`1e51a38e…`) |
| C1-LA2 CB(8,m) definition layer | `runs/lean-2026-09-28-c1-la2-cb8-definition-layer` | `E993Transport.cb8_topRank_of_descent_and_flow` | 78 (24 carried), 0 blocked | `a906ec17…5f3f` | passed `b447045a…` | match `8ab17f3f…` | **formally_verified** (`e88ff7af…`) |

## What each award establishes (and does not)

- **C1-LA1.** For every `m ≥ 107`, `m ≡ 2 (mod 3)`: the closed-form allocation of record (72 intercepts byte-checked against
  `adj_alloc_out.json` `7d635805…`) is nonnegative and satisfies Out over EVERY assignment with leg total `K = p*−1`, In over every
  assignment with total `K−1`, Switch, and the Residual `θ ≤ 1 − ρ_1(m)` (degree-9 positive-coefficient certificate after
  `m = 107 + 3p`). Template level only: not a flow on the literal network, not (HALL), not eligibility. Tier 2 progress (the formal
  template content of (L-S)_top). Registers the R-1 key at `formally_verified` (template scope) through the awards route; SR-1 supplies
  the face text.
- **C1-LA3.** For every class `m` and `5 ≤ j ≤ m`, `(1+X)^{8j}(1+2X)^{8(m−j)+1}` strictly descends at index `p*−2−j`, with (G) and (E1i)
  compiled as companion lemmas (no grade asserted for companions). No Newton, no Darroch. A NODE of the parent descent, not the
  descent. Partial Tier 2 progress.
- **C1-LA2.** The CB(8,m) layer under the frozen labelling (tree; `α = 9m+1`; leaf count `8m+1`; witnesses; neighbourhoods;
  favorable-leaves reduction; low window), and the reduction of the SOLUTION-CONTRACT §2 terminal to conjuncts 2 and 4, which enter
  ONLY as hypotheses. Infrastructure; never cited as Tier 1, (HALL), eligibility, favorability or descent. Recorded in the ledger
  (R31-C1-LA2) without a claim key (the synthesis proposed none).

## Disclosures (full texts in `control/C1-STAGE7-AGENTS.json` and each run's reports)

Formalizers: names-only listings of sibling runs and elan toolchains; first probe compiles / verifier discovery through the elan `lake`
shim; reads of registrar/validator scripts for their rules; one harness-refused non-required draft write (LA2). Reviewers: one grep of
the pinned Mathlib (LA1 auditor); synthesis read beyond the named sections (LA3 fidelity). None touches a verified artifact.

## Standing notes for Cycle 2

- The LA2 terminal's own content is the tree fact and the low window; conjuncts 2 and 4 are open formal obligations
  (C2-U-01/C2-U-02/C2-U-03 of the portfolio).
- The S_5 certificate (degree 50) is the remaining informal input of (ELIG-top)(a); formalizing it with C1-LA3's (BD) and the block
  identity lifts eligibility from `computer_assisted` (R31-N-8).
