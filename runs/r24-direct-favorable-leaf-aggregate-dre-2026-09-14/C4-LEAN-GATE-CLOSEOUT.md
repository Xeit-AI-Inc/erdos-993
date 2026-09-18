# Cycle 4 Lean Gate Closeout

Date: 2026-09-15

## Terminal Award State

Stage 7 is complete. One of the three awarded auxiliary theorem groups is
formally verified at its exact contracted scope. Two groups are closed
fail-closed with independently confirmed source-authority blocks. No arithmetic
fragment or weakened theorem was substituted for either blocked award.

### C4-LA1: top-rank selector collapse

Status: `formally_verified`

- Run: `runs/lean-2026-09-15-c4-top-rank-selector-collapse`.
- Declaration: `C4LA1.topRankSelectorCollapse`.
- Exact scope: for every finite simple graph carrying the contracted tree,
  independence-number, and unique-neighbor leaf hypotheses, the leaf is
  strictly favorable at `G.indepNum - 1`.
- Theorem-contract SHA-256:
  `9faa81ad73f1dec562b84a8c9a3173ff2b1565ff4b3f80c350d6f297d3358090`.
- Lean source SHA-256:
  `e2bc48690fe44b769687461ac8bfad867b6710cca93c6de81bd1ac7ad05d253a`.
- Kernel receipt SHA-256:
  `760881ace78c6f74ae1c2f1252bbc9c3f4887c4c5360cd92ea445d5c9310644c`.
- Fidelity projections: contract
  `e76aba81b6680d44289db33434c7ab01aec35740d87e9c263589e638b17d55a8`,
  binding
  `026498570b08b8fdd9c5661ece66191c435743cf74d9b4b6c08e9093081a6a9b`.
- Fidelity receipt SHA-256:
  `9f5b6985e797d5a2046d4c72683b0cff6b4da96f2ea4395d19baeecf679c8f2f`.
- Canonical verification report SHA-256:
  `f4aea6a1e6086198bf1a45378289527744f040aaec7abf0927803c1f94fb0a20`.
- Lean pin: `leanprover/lean4:v4.32.2`.
- Mathlib revision:
  `905b95818eb32af7874a58b427f50c1711a5e96c`.
- Reported and permitted axioms: `Classical.choice`, `Quot.sound`, and
  `propext`.

The proof body does not use the retained `G.IsTree` hypothesis, so it proves a
stronger implication internally. The exported declaration nevertheless has
the exact contracted finite-tree statement. The independent fidelity reviewer
confirmed that this creates no scope weakening, domain narrowing, or headline
overclaim.

The first workflow close was rejected because the formalization receipt used a
short run ID and the first fidelity projection paraphrased canonical contract
fields. The supported `rebind-run-id` operation repaired the receipt without
changing Lean source. A second close exposed full-binder domain labels omitted
from the projection. Those labels were restored exactly, a fresh independent
review was obtained on the final projection hashes, and the final canonical
close passed. The rejected close reports remain preserved in the run history;
no theorem statement or proof source changed during these repairs.

### C4-LA2: exact `T_m` sign bundle

Status: `blocked`

- Run: `runs/lean-2026-09-15-c4-tm-sign-bundle`.
- Formalizer report SHA-256:
  `e22a44c3f88f74a9072cd86fde8df8e774321f9a198f8186f8ce262c5ee5b682`.
- Independent block review SHA-256:
  `18c5d7d199f3a6ddd29f6e093248e61ffc2747f6a1bde530a0df14ca3e373247`.

The sealed capsule lacks the formal bridge from the literal `T_m` graph to its
independent-set coefficients, deletion polynomials, tagged original-leaf
orbits, selectors, and complete aggregate. The independent reviewer confirmed
that compiling only the polynomial arithmetic would not establish the awarded
tree theorem. No Lean theorem was registered.

### C4-LA3: PSC-terminal classification and singleton-core sign

Status: `blocked`

- Run: `runs/lean-2026-09-15-c4-psc-terminal`.
- Formalizer report SHA-256:
  `a876be8064a6126688f303af5fe38d63160573c89a0eaedb827076e0ed740784`.
- Independent block review SHA-256:
  `52f1785a9637e10bd36cb2a4d118c3ef175aa0cfb75f78ca59fe82e70cdf1f62`.

The sealed capsule lacks the complete frozen guarded PSC relation, the exact
original-leaf tagged-summand and complete-aggregate definition, the frozen
first-descent convention, and a canonical literal-tree representation. The
independent reviewer confirmed that defining those objects through the desired
classification would be circular. No Lean candidate was created.

## Non-Conclusions

Stage 7 does not prove the complete top-rank aggregate, the top-rank residual
inequality, the full literal interior-window aggregate, semantic transport,
the governed `E993-BETA-AGG` claim, TREE, FOREST, TRANSFER, or Erdős #993.
The two blocked award groups are not formally verified.

## Stage Verdict

The Stage 7 gate is terminal and fail-closed: `1 formally_verified`,
`2 blocked`, `0 silently weakened`.

## Final Source Rebind

The original Stage 7 capsule was bound to a superseded Stage 6 synthesis.
After the sequential Stage 5 recovery and final neutral synthesis, an
independent rebind review checked all three awards against:

- final synthesis SHA-256
  `45267f3c2d2490fe1fa5fcbb39c3de4bacbbe03435a2cb9ef163c170375efcf1`;
- final Stage 6 dispatch seal
  `49321df94c06aba376f445e93adc51e6546505c24461666499d824b8f97380a8`;
- rebind packet seal
  `fcef4583011426596d4f29847beeefbb37aec267c35195fd5102421b0056084d`;
- independent rebind review SHA-256
  `74fa9c0e29b2ce99f489c2705ac46955f06b7da9aeaef71a36461d5f74a7a7db`.

The rebind passed. C4-LA1 exactly covers the final top-rank award and retains
its existing kernel and fidelity receipts. The final C4-LA2 award is narrower
than the earlier exact-`T_m` bundle, but remains blocked by the same missing
literal graph-to-coefficient, deletion, leaf-orbit, selector, and aggregate
bridge. C4-LA3 remains blocked by the same missing frozen PSC and aggregate
semantic authorities.

A fresh diagnostic build and theorem/axiom print also passed on the unchanged
C4-LA1 source; see `FINAL-KERNEL-RECHECK.json`. The governed receipts, rather
than that diagnostic, remain authoritative.

Final Stage 7 state remains: `1 formally_verified`, `2 blocked`,
`0 silently weakened`.
