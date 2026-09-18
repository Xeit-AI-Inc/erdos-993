# Solution Contract: Direct Favorable-Leaf Aggregate Cancellation

Frozen: 2026-09-14 America/New_York

Run: `erdos-993-math-dre-20260914-r24-direct-favorable-leaf-aggregate`

## Objective

For the exact finite-tree definitions frozen below, either prove

```text
S(T,p) = sum_{v original leaf of T, a_v(T,p)<0}
           (b_v(T,p)-Bgen_{s_v}(T,p-1)) <= 0
```

for every eligible `p >= x(T)+2`, or produce an exact positive complete
aggregate satisfying every guard. The literal ordinary-tree statement and the
canonical governed-RTree claim `E993-BETA-AGG` are distinct scopes. Status may
move between them only through an explicit, verified transport theorem.

The preferred proof target is an exact graph-structural cancellation,
rooted-branch recurrence, or total-capacity theorem that permits positive
individual and support contributions. Rewriting `S<=0` as `|P|<=|N|` is only
a representation.

## Source authority

```text
e812fdba017e895877ce571c399a44a7131a1c4d616038c800aba4b6043b21eb  sources/authority/LEDGER.md
b57e79908202edd19cfb165b9f9da00d6f3767dc729126cfce5c9747556c1a94  sources/authority/CLAIM-IDENTITY.json
d004e814e6c6c279a50b3df26d76318d5ff44e5c25f90e446f85f70d15487960  sources/r23/SEMANTIC-CONTRACT.md
e166c0fbc0325c58b02955e00570b4d63d0898183a5727686285f93d4e456821  sources/r23/SYNTHESIS.md
d166a2e3ee5f50225813a97adef10882950d2d43fddf61d382b436c4e2eaba89  sources/r23/FINAL-MANIFEST.json
201a663f8d611a892c0471302dd355ea80b1b17b21cfc5c0e7a6a92d61d5abb4  sources/r23/evaluator/ordinary_tree.py
2198f01fa5de1c192da190ac242f5af8a914b0b03bd5e6df979590d20c6a18ed  sources/r23/evaluator/t22-order91.json
871a3656ce328c800606a97bee60c2bc33b25c1381e0e716c54ff124372f23a2  sources/r23/evaluator/t60-order243.json
```

Public continuity commit: `3061f2894997f3d14b28b615697bca9444f5ea9d`.

At freeze, the registry has 80 claims. `E993-BETA-AGG` is OPEN.
`E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT`, and
`E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` are REFUTED and may not be
reopened or renamed. `E993-R19-FIXED-GAMMA-HALL` remains OPEN at its distinct
governed-RTree scope.

## Transitive predecessor ledgers

```text
7b871bdd5d171679510aa7219d17ce7b0f5461a36e47779a2d82cb55f8f606eb  sources/predecessor-ledgers/six-cycle.csv
4bfc4181f0fea547ec74c7296c26db17b1a191d852c85ca5b746255bed592ac8  sources/predecessor-ledgers/aug26-code.csv
1a7f5dac1224aca8429871528caacb325b41a24bf3c9cf3d7934a0d26ff98b07  sources/predecessor-ledgers/aug26-math.csv
0e0cc55101b2737dbd6d6b983d3683162c1137ed82bfd8faae461ecf7d7fbcba  sources/predecessor-ledgers/r17-beta.csv
88a3fd72c3e5c03a1a2ad1bb5c0144133ebd1a859a1c5c41598da76e4fd93e00  sources/predecessor-ledgers/r18-hg2.csv
81315c9570a5b5a3c885606df4dd054c57b5037a31145aa740cfdb7f116ff100  sources/predecessor-ledgers/r19-beta-agg.csv
01a812a4c16983248c1b0ad4a949a807d906be2dc2a698024bfd280e1bfbe53c  sources/predecessor-ledgers/r21-o14.csv
f063116b2406f80ecb6e18f802c6b77c62ef6d7fb68f76299785c49d54f30508  sources/predecessor-ledgers/r22-o14-cont.csv
fe527845d5e4ee54a685ff466effc29e987f6deefaca80f008fc6738766c80b2  sources/predecessor-ledgers/r23.csv
```

## Exact conventions

- Terms, coefficient indexing, `a_v`, `b_v`, `Bgen_s`, and support maps are
  those in `sources/r23/SEMANTIC-CONTRACT.md`.
- Coefficients are integer-valued and zero-extended outside their natural
  ranges.
- `x(T)` is the first strict descent index.
- Only original leaves of `T` enter the favorable set.
- Favorability is strict: `a_v(T,p)<0`.
- The empty favorable set has aggregate zero and is reported separately.
- T22 at `p=34` must reproduce 67 favorable original leaves and
  `S=-498754180547001418536`.
- T60 must reproduce the exact r23 eligible row and complete negative sum.
- A positive local summand, positive support fibre, or deficient proper Hall
  cut is not a counterexample to the headline.

## DRE topology and model policy

- Stage 0: controller authority freeze and solution contract.
- Stage 1: cartography, universal counterexample gate, source and fidelity map.
- Stage 2: 36 genuinely distinct routes, T1-T12, F1-F12, U1-U12.
- Stage 3: 36 isolated Sol xhigh search workers.
- Stage 4: two isolated cross-orientation Terra xhigh critics per return, 72
  critics total.
- Stage 5: three portfolio adjudicators, one per origin orientation, using Sol
  xhigh. Portfolio-level adjudication is not multiplied by route count.
- Stage 6: one neutral Sol xhigh synthesis admitting sealed adjudications only.
- Stage 7: one selected candidate package when justified, with a Sol xhigh
  formalizer and independent Terra xhigh informal and fidelity reviewers.

The attached charter requested Astra for downstream roles. A live preflight
returned HTTP 400 because `gpt-5.6-astra` is unsupported in this Codex account.
Ashton then authorized the agents used in prior runs; this contract uses the
established Sol/Terra pairing and preserves the requested xhigh effort.

## Cycle ceiling and stopping

Up to nine complete cycles are authorized. Stop-gate criteria may be recorded
immediately but are unarmed through the close of Cycle 3. A verified proof, an
authenticated positive complete aggregate, or a central structural theorem
closing the named obstruction is decisive. After Cycle 3, an evidence-backed
plateau requires the skill's comparison window and serendipity review. A
promising worker return never ends a cycle before criticism, adjudication,
synthesis, and any justified Lean gate.

## Verification and write boundary

Every computational result requires deterministic replay, exact integers, and
hashes. Computation is not proof. Any Lean award requires a frozen theorem
contract, independent informal audit, no `sorry`/`admit`/`native_decide`, actual
kernel and axiom verification, hostile statement-fidelity review, and canonical
close. An arithmetic theorem over supplied numerals does not certify the graph
correspondence.

All writes stay below this run root. Prior experiments, master records,
manuscripts, notebooks, data, public repositories, services, and canonical
skills are read-only.
