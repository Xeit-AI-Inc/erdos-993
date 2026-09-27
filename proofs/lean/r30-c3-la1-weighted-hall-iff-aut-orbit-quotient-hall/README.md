# r30-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall

Declaration `E993Transport.weightedHall_iff_autOrbitQuotientHall`, exported byte-for-byte from the sealed internal run `erdos-993-weighted-transport-dre-2026-09-26` (`runs/lean-2026-09-27-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall`; r30 — see
[`experiments/r30-weighted-transport.md`](../../../experiments/r30-weighted-transport.md)). Award `C3-LA1`; registry effect `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR (new; VERIFIED formally_verified)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem weightedHall_iff_autOrbitQuotientHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) :
    WeightedHall G (favorableLeaves G p) p ↔
      ∀ 𝒮 ⊆ (indepFamily G (p + 1)).image (orbitOf G (p + 1)),
        ∑ O ∈ 𝒮, supply G (favorableLeaves G p) O ≤
          ∑ O' ∈ ((indepFamily G p).image (orbitOf G p)).filter
              (fun O' => ∃ O ∈ 𝒮, ∃ B ∈ O, ∃ A ∈ O', transportRel G B A),
            supply G (favorableLeaves G p) O'
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and attribution are part of it):

> C3-LA1 terminal theorem of record, E993Transport.weightedHall_iff_autOrbitQuotientHall (C-U1-T's crit_weightedHall_iff_orbitQuotientHall, frozen sources/c3-stage7-sources/C-U1-T-CritAdv.lean 8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b, with the name changed and nothing else). SCOPE: for every finite vertex type V ([Fintype V], [DecidableEq V]), every simple graph G on V with [DecidableRel G.Adj], and every p : ℕ, with Γ = all of G ≃g G and the tag set favorableLeaves G p, weighted Hall for the fixed selector (WeightedHall G (favorableLeaves G p) p: every X ⊆ I_{p+1} supplies at most the active-tag weight of its (D) ∪ (S) targets in I_p) holds iff Hall holds on the Aut(G)-orbit quotient with orbit-total supplies and capacities, an orbit arc O → O' existing iff some member pair B ∈ O, A ∈ O' satisfies transportRel G B A. No IsTree, no eligibility, no p ≥ 1. KEY: E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL (registered proved_informal) upgrades to formally_verified at this statement's scope only if the isolated second read SR-C3-1 finds the registered text no wider; otherwise the award registers as E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR with a scope note on (INV). The controller decides; this contract asserts no grade. EXCLUDED CONCLUSIONS: no quotient feasibility; not (HALL) at any scope; not (LIFT) and not its feasibility; nothing for a proper subgroup of Aut(G), another tag set or another weight; no flow is constructed or implied; no tree, eligibility or aggregate-sign content; nothing about the size or enumerability of orbit spaces; C2-LA1's terminal content is not re-certified. Companions on the face are lemmas registering proved_informal only (R29-N-12). ATTRIBUTION: definitions of record — C1-LA1 (entries 1–13: the r24/r25/r26 definition layers C4LA1/C5LA1 and E993Interior.taggedFamily, carried from the first-interior award (Codex); entries 14–21: the E993Transport layer authored in r30 Cycle 1) and C2-LA1 (the supermodularity / canonMin apparatus; the invariant-family statement critic-derived by C-U1-T in Cycle 2); r30 Cycle 3: U1 (Claude Sonnet 5) for the orbit block; C-U1-T (Claude Opus 5.5) for the partition, the class-union identity and the terminal theorem; C-U1-F (Claude Opus 5.5) for the independent equivalent formalization; the U adjudicator for the kernel equivalence check adj_two_quotient_forms_agree; Codex (GPT-6) for the transport mechanism, the lower-region run and (LIFT)'s orbit-quotient conventions; r29 for the high tail that closes the complementary region (not used by this proof). REPAIRS ON THE FACE: U1's 'remaining gap' wording struck; the axiom count is ten / seven; the carry description as corrected (C2-LA1 carries C1-LA1 entries 1–21 plus 24 only). Canonical run id erdos-993-math-dre-20260926-r30-weighted-transport; workflow run lean-2026-09-27-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall; producer c3-la1-formalizer-opus-20260927.

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in `source/`; the package cache is not shipped —
bind a local Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice, Quot.sound]`; no
`sorry`/`admit`/`native_decide`. Governed workflow: frozen theorem contract, independent informal proof-integrity audit, kernel/axiom receipt,
independent statement-fidelity attestation (verdict `passed`), canonical close (`formally_verified`). Digests in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration — a statement about the
active-tag transport network on finite simple graphs or on the named tree family; nothing about (HALL) at full scope, the lower-region
aggregate beyond the named family, `E993-BETA-AGG`, no-recovery, NR1, FOREST, TREE, TRANSFER, or Erdős #993.
