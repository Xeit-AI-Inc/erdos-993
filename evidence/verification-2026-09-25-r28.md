# Verification record: r28 release, 2026-09-25

The source experiment is `erdos-993-degree-lemma-hall-sdr-dre-2026-09-24` (r28: the Hall/SDR route to a second proof
of the forest degree lemma). Terminal manifest `54e71f419a69d815989bc8b26f4dadd5cf7fd4f536470d3b1ba0b3984e3607e2`. Every stage was sealed by a canonical-JSON SHA-256
manifest and the controller's integrity sweep at the close recomputed every manifest with zero unexpected mismatches.
4 governed Lean package(s) closed `formally_verified`: `r28-c1-la2-layer-cake-reduction` (`Erdos993G1.dominance_implies_degree_lemma` — E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA (with the r27 reformulation formal upgrade)); `r28-c1-la3-forest-composition-and-hall` (`Erdos993G1.forest_degree_lemma_of_tree_degree_lemma` — E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES (with E993-R28-SDR-THRESHOLD-EQUIVALENCE)); `r28-c1-la4-pendant-path-leaf-dominance` (`Erdos993G1.pendant_path_leaf_dominance` — E993-R28-PENDANT-PATH-LEAF-DOMINANCE); `r28-c1-la5-btp-second-proof-on-class` (`Erdos993G1.forest_degree_lemma_on_pathlike_branch_trees` — E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2 (Theorem BTP composed into a second proof of (DL) on the class; a scope note on E993-R27-FOREST-DEGREE-LEMMA)).

| Award | Terminal declaration | Registry effect | Main source SHA-256 | Fidelity receipt |
|---|---|---|---|---|
| `C1-LA2` | `Erdos993G1.dominance_implies_degree_lemma` | `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA (with the r27 reformulation formal upgrade)` | `64545ccd0b20ffe2da540fc4ae9d365825d43b73929201a1dab915925f109efc` | `25cfdda7bfce9556…` |
| `C1-LA3` | `Erdos993G1.forest_degree_lemma_of_tree_degree_lemma` | `E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES (with E993-R28-SDR-THRESHOLD-EQUIVALENCE)` | `ede8142b23676d868564ca45c718d16154f1e2a93db14d206ca8b4cb6ef8668a` | `cd9de21ab32bd451…` |
| `C1-LA4` | `Erdos993G1.pendant_path_leaf_dominance` | `E993-R28-PENDANT-PATH-LEAF-DOMINANCE` | `f979e1d7a8b3df6605765969d7c2c73762c736f073f8806f494da1d8b7c8bae0` | `b5dbd1a65c421025…` |
| `C1-LA5` | `Erdos993G1.forest_degree_lemma_on_pathlike_branch_trees` | `E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2 (Theorem BTP composed into a second proof of (DL) on the class; a scope note on E993-R27-FOREST-DEGREE-LEMMA)` | `91f529100aa4e3bc4687d03705dc46e8a43323f0cefeaf707d48c7f606374ee7` | `7b7069e4851885a2…` |

Every package pins Lean `v4.32.2` and Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`; the only reported
transitive axioms are `propext`, `Classical.choice`, `Quot.sound`; no admitted declaration or native decision axiom.
Every Main file is byte-identical to the sealed internal run. Verification reports: C1-LA2 `4b79853868d78137…`; C1-LA3 `cbcf87e8291befcf…`; C1-LA4 `50dad967c641aaa1…`; C1-LA5 `4c216c044673d73a…`.

**The result of record is a refutation, not a package.** The leaf/slot dominance condition `(HS)` — a sufficient
condition for the degree lemma proposed by an r27 critic — fails on the order-22 tree `T22` (a root with three hubs,
each carrying two pendant paths of three edges): at `k = 12` the root lies in 18 of the 19 independent 12-sets and
every leaf in 17, so one branch slot at threshold 18 has no leaf. Two critics found it independently; all three
adjudicators and the controller reproduced it; the isolated second read confirmed it by three methods, proved the
infinite family, and enumerated all 5,623,756 trees of order 22 (unique failure; none at order ≤ 21). The degree
lemma `(DL)` holds on `T22` and is untouched (its r27 award remains the proof of record).

**What the packages prove (where closed).** The layer-cake reduction `(HS at t ≥ 1) ⇒ (DL)` on any finite graph, with
the r27 leaf/branch reformulation formalized; the forest composition at its corrected hypothesis (the tree bound at
every `a ≤ k`) and the SDR/threshold equivalence; the pendant-path leaf dominance lemma; and, if closed, Theorem
BTP — `(HS)` on trees whose branch tree has maximum degree ≤ 2 — composed with the reduction into a second,
matching-type proof of `(DL)` on that class only. None of this is a no-recovery statement; nothing transfers to the
forest-wide no-recovery claim, NR1, FOREST, TREE, TRANSFER or Erdős #993.

**Second reads.** Three isolated Opus reads (SR-HS-REF, SR-PP, SR-BTP) before registration: 12 statements, all
confirmed (16 repairs, 0 rejections); their reports are mirrored under
`runs/erdos-993-degree-lemma-hall-sdr-dre-2026-09-24/`.

**Registry.** The master registry moves to 405 identities (243 VERIFIED, 92 REFUTED, 26 CONDITIONAL, 44 OPEN); all
prior objects preserved with statuses unchanged; scope notes on five prior keys. Registry pin after publication
`5add5564a6d0f956d542a67b8a4b68bc9b2aac1bd8106314ee834d4ffe456602`; ledger `6b88bbb3a5362aa44ee5fddd002eaa34382a5f906b87cb81255e43ab3498a5fc`. Statuses are registry grades at their explicit evidence, not a count of theorems; no
claim bears on Erdős #993.
