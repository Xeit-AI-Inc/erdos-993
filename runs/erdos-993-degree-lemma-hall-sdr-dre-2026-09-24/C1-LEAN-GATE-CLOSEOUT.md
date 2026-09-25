# Cycle 1 Stage 7 — Lean gate closeout (r28, 2026-09-25)

Controller: Claude Fable 5.1. The synthesis funded four award groups for the surviving mathematics after the Tier 1
target (HS) was refuted; C1-LA1 ((HS) itself) was `no award attempted` (false). Governed lean-proof-workflow (Lean
4.32.2 / Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`; axioms exactly `propext`, `Classical.choice`,
`Quot.sound`; no `sorry`/`admit`/`native_decide`/`axiom`/`decide`). Every declaration authored in-run or carried
byte-identically through the registrar from the r25 award source (`736eb9df…`, entries 1 and 4), the r27 C1-LA1
source (`b49ea82a…`, entry 7) and this run's frozen carry files / closed sibling awards; the two false U2
declarations (`slot_leaf_sdr_exists`, `tree_leaf_slot_dominance`) were never carried. Two independent reviewers per
award (informal proof-integrity auditor; statement-fidelity reviewer), assignments immutable, canonical fidelity
inputs by the controller's projection. Transport fact: every Stage 7 seat's runtime reported `claude-opus-5-5[1m]`
(the charter named Opus 5, "5.5 if available"); recorded, not a defect.

## Digests

| Award | Terminal declaration | Main.lean | kernel receipt | VERIFICATION-REPORT | informal audit | fidelity receipt |
|---|---|---|---|---|---|---|
| C1-LA2 | `Erdos993G1.dominance_implies_degree_lemma` | `64545ccd0b20ffe2…` | `4098942a546ef2a5…` | `4b79853868d78137…` | `bfcad7b1f78bed0e…` | `25cfdda7bfce9556…` |
| C1-LA3 | `Erdos993G1.forest_degree_lemma_of_tree_degree_lemma` | `ede8142b23676d86…` | `c29ee10ebbb56bb0…` | `cbcf87e8291befcf…` | `6c6ef7d95bf1b05f…` | `cd9de21ab32bd451…` |
| C1-LA4 | `Erdos993G1.pendant_path_leaf_dominance` | `f979e1d7a8b3df66…` | `6293734d9c8453aa…` | `50dad967c641aaa1…` | `ef25321a002c3992…` | `b5dbd1a65c421025…` |
| C1-LA5 | `Erdos993G1.forest_degree_lemma_on_pathlike_branch_trees` | `91f529100aa4e3bc…` | `7e1f80184e6b5df4…` | `4c216c044673d73a…` | `695727fb87430855…` | `7b7069e4851885a2…` |

Full digests in `control/C1-STAGE7-AGENTS.json` and each run's `VERIFICATION-REPORT.md`.

## What each award states

- **C1-LA2** (`runs/lean-2026-09-25-c1-la2-layer-cake-reduction`, 33 declarations): the layer-cake reduction (LC)
  `dominance_implies_degree_lemma` — byte-identical to `SOLUTION-CONTRACT.md` §2, `hT` unused, the hypothesis
  consumed only at `t ≥ 1` (erratum R28-E-a on the face) — with the graph-general `t ≥ 1` form as its scope
  declaration and the r27 leaf/branch reformulation formalized in full as companions (the weight identity on any
  finite graph; the exact leaf/branch identity with the `2Σ_{deg 0}` term; for trees with `n ≥ 2` the identity, the
  biconditional and the slot count in ℤ; the tree `t = 0` lemma) — a formal upgrade recorded as a scope note on
  `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`. Not a proof of (DL): the hypothesis fails at `(T22, 11)` and
  `(T22, 12)`.
- **C1-LA3** (`…-c1-la3-forest-composition-and-hall`, 51 declarations): the corrected forest composition (FC)
  `forest_degree_lemma_of_tree_degree_lemma` — the tree degree lemma at EVERY `a ≤ k` (erratum R28-E-c) on carriers in
  the same universe ⇒ (DL) on the forest; acyclicity consumed only in `induce_supp_isTree` — and the SDR/threshold
  equivalence `sdr_iff_threshold_pos_of_tree` (`t ≥ 1` on trees) with the graph-general `sdr_iff_threshold` (all `t`)
  as scope declarations; the two-piece convolutions with `hsep` and `hdisj` both necessary; `bridge`. Never composed
  with r27's `forest_degree_lemma` (not carried).
- **C1-LA4** (`…-c1-la4-pendant-path-leaf-dominance`, 12 declarations): the pendant-path leaf dominance lemma
  `pendant_path_leaf_dominance`, graph-general — for a pendant path `u_0 … u_{m+1} = ℓ` and every `k`, `occ (u i) k ≤
  occ ℓ k`; route the two-step shift extended to a vertex permutation carrying independent sets containing `u_i`
  injectively to those containing the leaf. Bounded attempt; closed in one pass.
- **C1-LA5** (`…-c1-la5-btp-second-proof-on-class`, 31 declarations): Theorem BTP as the `lemma`
  `leaf_slot_dominance_on_pathlike_branch_trees` — for `hT : G.IsTree` and `hB : BranchTreeMaxDegreeLeTwo G` (no branch
  vertex has three or more branch-tree neighbours; entry 22 proves the predicate equivalent to the synthesis's
  `(G.induce {v}ᶜ).Reachable` wording) the own-leaves injection is an SDR and the threshold form holds at every `t` —
  and the terminal `forest_degree_lemma_on_pathlike_branch_trees`: its composition with the carried C1-LA2 reduction,
  `D_k ≤ 2k·i_k` on that class. A byte-different SECOND FORMAL PROOF of the degree lemma on the path-like-branch-tree
  class only (a scope note on `E993-R27-FOREST-DEGREE-LEMMA`, never a (DL) key); sharp — `T22` is outside the class.
  Acyclicity enters only in `exists_pendant_chain`, `hB` only in `exists_own_leaves`; carried C1-LA4 entries 7–11
  and C1-LA2 entries 7–12 byte-identically, the two terminal lemmas with the recorded keyword change. Bounded
  attempt; closed in one pass.

## Recorded deviations and reviewer notes (none affects a statement)

- Common: registrar ordering (definitions before lemmas: r25 entry 4 registered after the definition layer in every
  award; r27 entry 7 before it in LA2); keyword-only `theorem → lemma` on carried critic/sibling declarations with
  byte-reversal scripts shipped (accepted as recorded re-derivations); `EVIDENCE/axioms.txt` written before
  verification and rewritten by the verifier per its own contract (LA2, LA5 — same axiom set; LA3, LA4 identical
  bytes); the directory-name `--run-id` with the canonical run id recorded (the r27 practice).
- LA2: the Hall attribution (listed by the common rule) is not applicable and absent — recorded as such;
  `CAPSULE-VERIFICATION.json` marks `C-U1-F-Audit.lean` "carried" while no declaration of it is present (the faces
  are right); the cast audit lists the ℕ-subtraction sites incompletely (all guarded by `3 ≤ deg v`).
- LA3: the contract's description says "entry 12" where the registrar placed `indepCount_eq_card_indepSetFinset` at
  entry 14 (a successor-record correction); the contract's statement text omits the common attribution list (present
  in the informal proof — carried on the registration face); the SDR lemma's axiom line rests on the verified build
  and `axioms-all-declarations.txt` (the receipt probes the terminal only).
- LA4: binder order `(k) (i)` (equivalent to the adjudicator's `∀ (i) (k)`; recorded); one scratch write to
  `/tmp/.x`, deleted (path hygiene; quotation record filed for its report); `hinj` is not needed for the conclusion
  (the route uses it; no record claims necessity); a "§6" cross-reference should read §10; a concurrent reviewer's
  notes were glimpsed (one sentence) by the auditor while tracing the `/tmp` token.
- LA5: the producer's first write of `FORMALIZER-REPORT.md` was refused by the harness's file tool (a 12-byte stub);
  the resumed seat rewrote it through the normal tool (8ea85707…) with the four pinned digests unchanged; the
  synthesis's gloss 'connectivity gives the pendant paths, acyclicity the disjointness' is corrected by the proof
  (acyclicity gives the pendant paths; the degree pattern gives disjointness); the tree hypothesis is necessary (the
  bowtie satisfies the class predicate and breaks both faces at `k = 1`); entry 23's docstring mentions `a, b ≥ 1` not
  assumed; the contract calls r27's `forest_degree_lemma` 'an input' though it is not a dependency; 15 drifted
  capsule members = sibling lifecycle files (declared).
- Controller-side: brief §5 cross-reference numbering offset (R28-E-g, cosmetic); the reviewer-brief generator's
  read-boundary wording inherited from r27 and corrected before any reviewer read it.

## Reviewer seats

Per award: informal auditor `c1-laN-fable-informal-20260925`, fidelity reviewer `c1-laN-fable-fidelity-20260925`
(chartered Opus 5 high; runtimes reported Opus 5.5); agent ids in `control/C1-STAGE7-AGENTS.json`.

## Ruling

Stop gate §5(b) was met before Stage 7 (the refutation of (HS): two instruments, three adjudicator replays, the isolated
second read SR-HS-REF). Stage 7 closes the surviving mathematics formally: (LC) with the r27 reformulation upgrade,
the corrected (FC) with the SDR/threshold equivalence, the pendant-path leaf dominance lemma, and Theorem BTP composed into a second formal proof of (DL) on the path-like-branch-tree class. The
run ENDS at the Cycle 1 close (Gate ruling 9; the synthesis's continuation ruling). Every registration carries its
grade and attribution on its face; no status transfers across fence §3.1; (DL)'s r27 award remains the proof of record.
