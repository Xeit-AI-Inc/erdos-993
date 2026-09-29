# Cycle 2 Stage 7 — Lean Gate Closeout (r31)

Controller: Claude Opus 5.5, 2026-09-28 (05:25 EDT by the clock). Canonical run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`.
Every seat Claude Opus 5.5, chartered high (platform-applied effort); runtime-reported `claude-opus-5-5`. Governed lean-proof-workflow;
Lean `v4.32.2`, Mathlib `905b9581…`; axioms exactly `propext`, `Classical.choice`, `Quot.sound`; independent informal audit and
statement-fidelity review per award; fail-closed `close`.

| Award | Run | Terminal | Declarations | `Main.lean` | Informal audit | Fidelity | Close |
|---|---|---|---|---|---|---|---|
| C2-LA1 eligibility on the literal tree | `runs/lean-2026-09-28-c2-la1-cb8-parent-descent-and-eligibility-on-the-tree` | `E993Transport.cb8_topRank_parentDescent_and_conjuncts_1_2_3` | 549 (99 carried, 2 keyword-rekeyed) | `986b5257…0c9d` | passed `44053c8e…` | match `8176199c…` | **formally_verified** (`97fbe032…`) |
| C2-LA2 closed-form favorability, both leaf classes | `runs/lean-2026-09-28-c2-la2-cb8-leaf-deletion-closed-forms-descent` | `E993Transport.cb8_leafDeletion_closedForms_descent_topRank` | 28 (17 carried) | `e75c66b2…faae` | passed `b99f029b…` | match `4b729b40…` | **formally_verified** (`5b197901…`) |
| C2-LA3 graph-level favorability | `runs/lean-2026-09-28-c2-la3-cb8-favorable-leaves-eq-leaf-set` | `E993Transport.cb8_favorableLeaves_eq_leafSet_topRank` | 90 (77 carried, 1 rekeyed) | `7dab4388…2b8a` | passed `83601bcc…` | match `9ef799e6…` | **formally_verified** (`e20e4715…`) |

## What is now formal on the class (`m ≥ 107`, `m ≡ 2 (mod 3)`, `p* = (16m+4)/3`)

- **(E)**, conjuncts 1–3 of the SOLUTION-CONTRACT §2 terminal, on the literal `cbGraph m`: tree; parent descent at index `p*−2`;
  `crossingIndex + 2 ≤ p*`; low window (C2-LA1; the degree-50 `S_5` certificate kernel-checked by `positivity` after a denominator-free
  factorial normalization of 254 binomials).
- **Every leaf favorable at `p*`**, `favorableLeaves (cbGraph m) p* = leafSet (cbGraph m)`, Darroch/Newton-free (C2-LA3 over C2-LA2).
- With Cycle 1: (L-S)_top at template level (C1-LA1), the CB layer and the reduction of the terminal to conjuncts 2 and 4 (C1-LA2), and
  the block-descent node (C1-LA3). **Conjunct 4 (the saturating flow on `cbGraph m` at `p*`) is the one formal obligation left**; its
  informal proof stands (the composition key, the explicit criterion flow, the sector-arc table).

## Controller rulings and errata this stage

R31-N-15 (origin terminals carried with the single keyword edit `theorem` → `lemma`, reversibility checked), R31-N-16 (dependency-closed
carry subsets are valid), R31-E-e (reviewer-brief carry text post-processed), R31-E-f (a second-read brief header mismatch). The C2-LA1
formalizer's report write was refused by the harness; the controller filed it verbatim with one disclosed path-literal edit.

## Disclosures

Formalizers: names-only listings of `runs/`; reads of skill-script internals for rules; harness caches outside the run root (unopened
or paged); one Mathlib grep. Reviewers: listings of frozen source directories; hashing (not reading) of contract sources; three extra
frozen-source reads for attribution checks (C2-LA1 fidelity). None touches a verified artifact.
