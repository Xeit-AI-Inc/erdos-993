# Verification record: r30 release, 2026-09-27

The source experiment is `erdos-993-weighted-transport-dre-2026-09-26` (r30: the correctly weighted mixed-boundary transport network for
the remaining ordinary-tree favorable-leaf aggregate; chartered from a Codex prompt). Terminal manifest `7156daeb97eeb9b81c6b28838bb52cbace3f420093f8ce9127300f51ddeea844`. Every stage was
sealed by a canonical-JSON SHA-256 manifest and the controller's integrity sweep at the close recomputed every manifest with zero
unexpected drifts. 7 governed Lean packages closed `formally_verified`: `r30-c1-la1-active-tag-weight-identity` (`E993Transport.activeWeightAggregateIdentity` — E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY (new; VERIFIED formally_verified)); `r30-c1-la2-weighted-hall-implies-nonpositive-aggregate` (`E993Transport.aggregate_nonpos_of_weightedHall` — E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (new; VERIFIED formally_verified)); `r30-c2-la1-invariant-positive-deficient-family` (`E993Transport.exists_aut_invariant_deficient_of_not_weightedHall` — E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY (new; VERIFIED formally_verified)); `r30-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall` (`E993Transport.weightedHall_iff_autOrbitQuotientHall` — E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR (new; VERIFIED formally_verified)); `r30-c4-la1-gk-deletion-saturating-flow-every-rank` (`E993Transport.gk_deletionSaturatingFlow_of_rank_ge` — E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET (new; VERIFIED formally_verified)); `r30-c5-la1-gk-weighted-hall-every-eligible-rank` (`E993Transport.gk_lowerRegionWeightedHall_everyEligibleRank` — E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK (new; VERIFIED formally_verified)); `r30-c6-la2-spider-tree-weighted-hall-rank-k-plus-3` (`E993Transport.spiderOneTwoThrees_treeWeightedHall_kPlus3` — E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-TREE-WEIGHTED-HALL-AT-RANK-K-PLUS-3-FOR-K-AT-LEAST-5 (new; VERIFIED formally_verified)).

| Award | Terminal declaration | Registry effect | Main source SHA-256 | Fidelity receipt |
|---|---|---|---|---|
| `C1-LA1` | `E993Transport.activeWeightAggregateIdentity` | `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY (new; VERIFIED formally_verified)` | `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` | `a1098d8d8030fb5a…` |
| `C1-LA2` | `E993Transport.aggregate_nonpos_of_weightedHall` | `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (new; VERIFIED formally_verified)` | `7c279f4b25a07d022ace7154af11c01259057885a55bfabd5e5a07e0c32349f8` | `dc3444d639b48ff5…` |
| `C2-LA1` | `E993Transport.exists_aut_invariant_deficient_of_not_weightedHall` | `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY (new; VERIFIED formally_verified)` | `a9cf3b815832b6fa25e43e07e628db4ce01a7a496b084cac0cd3768e877c7fc4` | `29d130fe53e9a77c…` |
| `C3-LA1` | `E993Transport.weightedHall_iff_autOrbitQuotientHall` | `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR (new; VERIFIED formally_verified)` | `22e3f81c487697912e3e94741eeb27e580324fd1bf3e06f52afaebc667e04a45` | `0fddd522d5b444e7…` |
| `C4-LA1` | `E993Transport.gk_deletionSaturatingFlow_of_rank_ge` | `E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET (new; VERIFIED formally_verified)` | `66db6c73ad8f0dbe58dfdf31bf6a5d0b50e3f33459ca08f89ba372cc9ca979bf` | `cb1e50a486acebab…` |
| `C5-LA1` | `E993Transport.gk_lowerRegionWeightedHall_everyEligibleRank` | `E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK (new; VERIFIED formally_verified)` | `e24ba9dd470a4ac99509216695cbe24bbf35689108359841cd0b664af42071bb` | `c274b6f65b43ee86…` |
| `C6-LA2` | `E993Transport.spiderOneTwoThrees_treeWeightedHall_kPlus3` | `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-TREE-WEIGHTED-HALL-AT-RANK-K-PLUS-3-FOR-K-AT-LEAST-5 (new; VERIFIED formally_verified)` | `df5e287022083ad3b61c2efa3ce53953da22896145fb90046f871a082a4c60fc` | `b9683ede6b910654…` |

Every package pins Lean `v4.32.2` and Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`; the only reported transitive axioms are
`propext`, `Classical.choice`, `Quot.sound`; no admitted declaration, no native decision axiom, no `decide` over an enumeration for a
universal step. Every Main file is byte-identical to the sealed internal run; every definition of record is a byte-identical registrar
carry keyed by (origin award, entry, digest): the first-interior award source (`8d864da2…`) through C1-LA1/C1-LA2, and each later award
carries its predecessors' text with its kernel receipt bound. Verification reports: C1-LA1 `d1db0c7601f619e5…`; C1-LA2 `fefa7eb755b7a624…`; C2-LA1 `18b4d3d2363065aa…`; C3-LA1 `c624136066f47549…`; C4-LA1 `9ac4cee529f93049…`; C5-LA1 `f9ad374c8872a066…`; C6-LA2 `c79a3792e7680b21…`.

**What the packages prove.** (1) The active-tag weight identity: on every finite simple graph, network supply minus capacity equals
the favorable-leaf aggregate `S(G,p)`. (2) A saturating flow (weighted Hall) implies `S(G,p) ≤ 0`. (3) If weighted Hall fails, an
automorphism-invariant all-positive deficient family exists. (4) Weighted Hall is equivalent to Hall on the full automorphism-orbit
quotient at the fixed selector. (5) On `G_k` a deletion-supported saturating flow exists at every rank `p ≥ k+3` for every leaf tag set.
(6) `G_k` is a tree and (HALL) holds at every eligible rank of every `G_k`. (7) The spider `S(1,2,3^k)` is a tree, its rank `k+3` is eligible, and (HALL) holds there for every `k ≥ 5`. None of this is (HALL) at full scope;
nothing transfers to the primary aggregate beyond the named families, to `E993-BETA-AGG`, no-recovery, NR1, FOREST, TREE, TRANSFER or
Erdős #993; the mechanism key `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` stays OPEN.

**Second reads.** 37 isolated Opus 5.5 reads before registration of every statement first made at a review stage, 0 rejected:
30 in Cycles 1–5 and 7 in Cycle 6 (the favorability lemma; the ten first-eligible-rank CB rows read by two seats; the Darroch hygiene re-read of every Darroch/Newton-dependent key, which confirmed all of them; the CB exactness lemma; the shift lemma and the stratum criterion; the arm-tag identity); the readers renamed nine keys to exact predicates over the run, added two missing hypotheses, found a tree-scope predecessor of one identity in the master, and struck two seat-graded proofs; their reports are mirrored under `runs/erdos-993-weighted-transport-dre-2026-09-26/`.

**Registry and ledger.** Master `CLAIM-IDENTITY.json` SHA-256 `ef7d7e7a827ffbfd09a6a9367fc5118bc1278b5880794da8cde2a0f1d711b5f1` (491 identities: CONDITIONAL 26, OPEN 58, REFUTED 98, VERIFIED 309); `LEDGER.md` SHA-256 `52a64732eebd101d7cb773ecb2891480696399d1a684869a121ee0d83c1ddcb9`;
`evidence/obligations.csv` regenerated from the registry. The r30 additions carry the `E993-R30-` prefix; the master keys touched carry
scope notes only; no earlier claim object was changed or removed.

**Quoted non-durable paths.** Fifteen of the mirrored seat records (two informal audits, ten critiques, three second reads) quote, inside
their own read-boundary disclosures, non-durable paths of the controller's harness (tool-result spill files, a sandbox temp directory, a
dummy path in a negative test). Each is the seat's required disclosure of what it touched; no content, digest or verdict depends on the
path. The records are receipt- or capsule-bound and are mirrored byte-for-byte; the run's path-literal quotation records
(`runs/erdos-993-weighted-transport-dre-2026-09-26/` is the mirror; the records themselves are `control/C*-*PATH-LITERAL-QUOTATION-RECORD.json`
in the sealed run) list every such quotation.
