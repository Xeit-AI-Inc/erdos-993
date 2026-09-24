# Cycle 1 Stage 7 — Lean Gate Closeout (r26)

Controller: Claude Fable 5.1, 2026-09-24. Three award groups funded by the admitted synthesis (`cycles/cycle-1/stage6/SYNTHESIS.md`, `## Lean awards`); all three closed `formally_verified` through the governed `lean-proof-workflow` (init with the canonical run id; shared Mathlib bound by symlink; frozen theorem contract; independent informal proof-integrity audit; kernel and axiom verification with axioms exactly `propext`, `Classical.choice`, `Quot.sound`; independent statement-fidelity review bound to the contract, declaration and kernel receipt; fail-closed close). Toolchain `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`. Formalizers, auditors and reviewers: Claude Opus 5 high (nine distinct seats; no seat reviewed its own work).

| Award | Run | Terminal declaration | Status | Kernel |
|---|---|---|---|---|
| `C1-LA1` | `runs/lean-2026-09-24-c1-la1-top-rank-residual-sign/` | `R26LA1.topRankResidualSign` | status: formally_verified | verified |
| `C1-LA2` | `runs/lean-2026-09-24-c1-la2-deletion-injection-fibre/` | `R26LA2.fibreInequalitySharp` | status: formally_verified | verified |
| `C1-LA3` | `runs/lean-2026-09-24-c1-la3-tree-structural-core/` | `R26LA3.leafDegree_two_indepNum_eq_two` | status: formally_verified | verified |

## Digests

| Award | THEOREM-CONTRACT.yaml | Main.lean | kernel receipt | informal-audit receipt | fidelity receipt | VERIFICATION-REPORT.md |
|---|---|---|---|---|---|---|
| `C1-LA1` | `c73eb8dc970327036f2ea034f1d1b84de0b62075b389f147037c83ce12fc2c6d` | `aff08ce72f9a5f1a93c9b8cb34c0f26ceeddc105cc5a94a4a132d5b6f6367dbc` | `9cd6822535b3b928aff306e80df5d05f1f164a3bc5e2180ce1aed5afa6b8899b` | `f3c19381d02eba73bd2fc908b922a02bff69301db44e5d4ae0c65ee2b361d910` | `052fd81b79302f0d3f594ef1a3d479cef7aa0e586f344035e395a177b5457b48` | `16d2420bf9f5a77a5205ec32fb1e5a0d6a6b26e77ec54af9f66f9a14bc00400a` |
| `C1-LA2` | `76080c7df5f789150dc0eb66f48dfa9603cafd2df56f570f68216d9c08d61f7c` | `6e5650ff79eae0da423754bea2b1e1a6dad6782a6e7f774d390c9e8cab488114` | `bee3b26083f8d6a68b5f0c6337ddc145e618a1f4dc5a56e6c75924113a5fd4cf` | `c94f4e61c0b291ebb20778306280d6f1d02b45618714fb55e76b36c5dd4e2bd2` | `2fa7bbe5503cd56a59b1ce3bb0da447c867f1f09c490f320159015ade31ec3f4` | `e55d3e58509b30a85afd98ec27c50520369c4751ede6119b1ae7e65cb79b02db` |
| `C1-LA3` | `3205cad3795799a18b8d8903f333965021560cf8f53977dad85fafa73fe7947c` | `28c765ec8846d0fc561e3098bc1b992f856dad7817daa58abab7700ebfb2b054` | `0b16767c3402ef622dc7d40dc3b08cfb25b2f28dd7fe47b64b9c508ed3661e52` | `a153d8062b1a9de20c40358ee84ec1648742fe500534b7833d1b85c5aa455e14` | `8bdf3c4716022480ec1b69b919fb12339cd540c0e46afc841af372f68c92e8a1` | `891cdb7112f0418eb8ad81de54cf17f59d933455caf6f3dd03bb1b26bdb43c69` |

## What each award states

- **C1-LA1 — the r24 top-rank residual sign (RC).** `∀ G : SimpleGraph V` (finite, decidable), `G.IsTree → 2 ≤ G.indepNum → C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1 → (every leaf lies in every maximum independent set) → C5LA1.aggregate G (G.indepNum - 1) ≤ 0`. Composed with the r24 award `C5LA1.topRankResidualIdentity` (RI), whose 31 registrar entries are carried byte-identically (entry 31 with the recorded one-token `theorem→lemma` keyword; definition layer registered between entries 14 and 15 by the registrar's kind-ordering rule — relative order, names and digests preserved). 148 declarations. The proof: definition layer; leaf/support structure; the `(★)`-free gate `α = ℓ + a`; the maximum-set bijection; forced neighbour; `h ≥ 0`; the exact budget identity `(a−|A_D|) + Σ(λ−1) + h = 1`; four arithmetic shapes pruned to three families; `W_I = ℓ(ℓ−1)M`; `W_II = (ℓ−4)N₂`; the family-(III) bijection over the `a−1` shell; the deletion injection and fibre bound; `N₂ ≤ k₂M`, `k₂ ≤ ⌊ℓ/2⌋`; `S ≤ −ℓ(ℓ−2)M − (ℓ−4)N₂` in `ℤ`; finishes `ℓ ≥ 4`, `ℓ = 3`, `ℓ = 2` (`C₂ = ∅` under eligibility; `hEligible` consumed only through `3 ≤ α`); `ℓ ≤ 1` impossible. Excluded conclusions on the face: the strict form, `S = 0 ⟺ P₅`, other ranks, the non-residual class, forests, `RTree`, the all-rank aggregate, `E993-BETA-AGG`, transport, TREE/FOREST/Erdős #993.
- **C1-LA2 — deletion injection and sharp fibre inequality.** For every finite graph and every `U : Finset V`, `2·Σ_{A∈I(U)} |A| ≤ |U|·|I(U)|` and `((ℓ:ℤ) − |U|)·|I(U)| ≤ Σ_{A∈I(U)} ((ℓ:ℤ) − 2|A|)`; no hypotheses. Andriantiana–Razanajatovo Misanantenaina–Wagner (2020) re-proved in-run, never imported.
- **C1-LA3 — the tree-structural core.** 30 declarations; terminal the `P₃` lemma `G.IsTree → |L| = 2 → λ(s) = 2 → G.indepNum = 2`; with `2 ≤ α → 2 ≤ ℓ`, no adjacent leaves at `2 ≤ α`, `λ ≡ 0` off supports, `Σλ = ℓ`, `j·|C_j| ≤ ℓ`, `k₂ ≤ ⌊ℓ/2⌋`, `card_C2_eq_zero_of_eligible`, `eligible → 3 ≤ α`. No declaration consumes `(★)`.

## Recorded deviations and reviewer notes (none affects a statement)

- LA1: `r1_byte_diff` (entry 31 keyword) and 14 carried seat/critic bodies with the same one-token normalisation; registration-order deviation; one controlled reset of the run's pre-receipt state (the `.lake/packages` symlink unlinked with `rm`; the shared tree verified intact by the formalizer and re-verified by the controller: 11 packages, `Mathlib.olean` present, 13 GB). Fidelity notes: attribution list fuller on `INFORMAL-PROOF.md` than on the contract; `EVIDENCE/axioms.txt` carries the transitive terminal line and `EVIDENCE/axioms-all-declarations.txt` the per-declaration list (147/148; `C4LA1.IsGraphLeaf` absent). Informal-audit notes: `INFORMAL-PROOF.md` §7 omits T2/T3 among the r26 seats credited by the synthesis (carried to the registration and publication text); the formalizer report's '147 exactly three axioms' is 146 + `closed_reachable` on two + `IsGraphLeaf` on none.
- LA2: `open SimpleGraph C4LA1` wrapper dropped `C4LA1` (absent namespace hard-errors); `deletionInjectionBound` keyword `theorem→lemma`; `fibreInequalitySharp` re-derived with `R26LA2`-qualified names; the brief's R1 parenthetical was wrong (the body uses `C5LA1.sum_card_filter_comm`, carried as the one C5-LA1 entry).
- LA3: the `P₃` derivation registered as `…_eq_two_core` with the award-named terminal theorem applied last (one added name); `--run-id` = run-root directory name (established practice); contract domain node cosmetic (`variable: s` with `lean_type: v : V`).

## Reviewer seats

Formalizers `c1-la{1,2,3}-formalizer-opus-20260924`; informal auditors `c1-la{1,2,3}-fable-informal-20260924` (attestations `…-informal-pass-20260924`); fidelity reviewers `c1-la{1,2,3}-fable-fidelity-20260924`. Agents record: `control/C1-STAGE7-AGENTS.json`.

## Ruling

Stage 7 is complete: every funded award group is formally verified at its intended scope; no bounded repair was needed; no award was weakened. `C1-LA1` is the decisive event of `SOLUTION-CONTRACT.md` §5(a) and `AUTHORIZATION.md`: **the run ends at the Cycle 1 close.**
