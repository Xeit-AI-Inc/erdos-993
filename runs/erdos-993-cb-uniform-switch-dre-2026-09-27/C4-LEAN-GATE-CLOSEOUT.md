# Cycle 4 Stage 7 — Lean Gate Closeout (r31) — DECISIVE EVENT (a)

Controller: Claude Opus 5.5, 2026-09-29 (03:04 EDT by the clock). Canonical run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`.
Every seat Claude Opus 5.5, chartered high (session effort `high`, read from the host); runtime-reported `claude-opus-5-5`. Governed
lean-proof-workflow; Lean `v4.32.2`, Mathlib `905b9581…`; axioms exactly `propext`, `Classical.choice`, `Quot.sound`; independent informal
audit and statement-fidelity review; fail-closed `close`. The synthesis funded ONE award (controller ruling R31-N-30).

| Award | Run | Terminal | Entries | `Main.lean` | Informal audit | Fidelity | Close |
|---|---|---|---|---|---|---|---|
| C4-LA1 — the Tier 1 family theorem | `runs/lean-2026-09-29-c4-la1-cb8-top-rank-eligible-and-weighted-hall` | `E993Transport.cb8_topRank_eligible_and_weightedHall` | 758 (627 carried: 622 byte-identical + 5 origin terminals `theorem`→`lemma`, reversible; 131 new) | `c1ef9d63…699b` | passed `1471a31c…` | match `c8f3ca18…` (80 passed, 0 failed, 0 warnings) | **formally_verified** (`dff86aa2…`) |

## The theorem

```lean
theorem cb8_topRank_eligible_and_weightedHall (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2) :
    (cbGraph m).IsTree ∧
    C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
    3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1 ∧
    ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f
```

For every `m ≥ 107` with `m ≡ 2 (mod 3)`: `CB(8,m)` is a tree; the actual first descent `x` satisfies `x + 2 ≤ p*` and the low window
holds, so `p* = (16m+4)/3` is eligible; and the literal active-tag weighted two-for-one network at `p*`, with the favorable-leaf selector
DERIVED on the tree, carries a saturating flow — equivalently (HALL) at `p*`. SOLUTION-CONTRACT §2 verbatim; statement SHA-256
`c17cc9cf…4952` equal across the contract, §2, the synthesis and the brief. **Tier 1 is formally verified at full scope: decisive event (a).**

## Fences and excluded conclusions (on the face)

One rank `p*` per tree; `d = 8`; the class `m ≥ 107`, `m ≡ 2 (mod 3)` only. No (HALL) at any other rank, at `m < 107`, at
`m ≡ 0, 1 (mod 3)`, for `d ≠ 8`, for heterogeneous CB patterns or arbitrary trees. Full (HALL), the primary aggregate, TREE, FOREST,
TRANSFER and Erdős #993 stay OPEN; no status transfers. No LP optimality or θ* law; no Newton or Darroch input. `S(T_m, p*) ≤ 0` on
these rows follows by composing with r30's FLOW ⇒ SIGN award; it is not on this award's face and transfers no status.

## Provenance of the proof

The Cycle 4 gate froze conjunct 4 as 20 Lean leaf statements N1–N8 plus `cb8GSec` (controller-staff drafter; gate ruling 23). Nine
Sonnet 5 routes and eighteen Opus 5.5 critics closed them in scratch; two adjudicator merges covered all twenty; the synthesis funded the
terminal; the formalizer integrated them on 627 receipt-bound carries from C1-LA1..3, C2-LA1..3, C3-LA1 and r30 C1-LA2. Proof texts per
node (attribution on the award's face): N1 critics C-T1-F / C-T1-U (T1 companion); N2 critic C-U1-F (U1 companion); N3 seat T2 (bound
by C-T2-F / C-T2-U); N4/N5 critics C-T3-U / C-T3-F (T3 `zero_classes`); N6 seat U2; N7 critics C-U2-F / C-U2-T (U2 companion); N8
seat U3. Isolated second reads R31-SR-C4-1..6: all concordant (confirmed / confirmed_with_repairs; no rejection).

## Reviewer notes (non-blocking)

- Informal audit: `FORMALIZER-REPORT.md` records the capsule manifest file digest as `2a70da3a…`; the actual value is `768128a3…` (as in
  `CAPSULE-VERIFICATION.json`) — a transcription error, corrected by this record; `INFORMAL-PROOF.md` labels C2-LA1 fragments by base-entry
  numbers 579/580 (the C2-LA1 entries are 0546/0547); it cites R31-SR-C4-1..5 (R31-SR-C4-6 also exists); N5's γ = 0 wording (per
  R31-SR-C4-3); the ℕ-subtraction table omits carried `cb8R1`'s exact `8m−7` and `k−i`.
- Fidelity: 442 `set_option` lines, all inside byte-identical carried fragments; the new text has none. Registration alias risk handled
  by R31-N-31 (re-grade the existing Tier 1 key).

## Process this cycle

Three host interruptions (R31-N-24/25/28); build-cache controller fact (R31-N-26); controller erratum R31-E-i; tool revision R31-N-29;
Sonnet 5.5 not available (R31-N-27). The formalizer ran the full integration without a relay (R31-E-h honoured).
