# Solution Contract — r31 (a parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank)

Binding on every seat. Symbols: `SEMANTIC-CONTRACT.md`. Charter: `control/R31-CHARTER-PROMPT.md` (verbatim).

## 1. Targets and tiers

- **Tier 1 — the family theorem (the run's headline object; key on registration named in the `E993-R31-` namespace).** For every
  integer `m ≥ 107` with `m ≡ 2 (mod 3)`, with `T = CB(8, m)` and `p* = (16m + 4)/3`: (E) `p*` is ELIGIBLE with the actual
  first-descent definition (`x(T) + 2 ≤ p*`, `3p* < 2α(T) + 1`); and (H) with `F = F_{p*}(T)` (the original strict selector,
  derived — not assumed) the literal active-tag weighted deletion/two-for-one network satisfies (HALL) at `p*`. ONE rank per tree;
  never promoted to every eligible rank. If a rigorously justified larger cutoff `m ≥ M_0` is necessary, the narrowed theorem is
  stated at `m ≥ M_0` and the omitted range `107 ≤ m < M_0` is accounted for separately (finite exact certificates at
  `computer_assisted`, each row named, or left open and named).
- **Tier 2 — the two principal missing lemmas.** (L-S)_top (SEMANTIC-CONTRACT §2): a uniform residual-capacity sector allocation
  with closed forms for `pb`, `pc`, `σ` and `θ(m)`, every state constraint verified (nonnegativity, source outflow, in-sector
  capacity, switch-target capacity after the E1 flow, `θ(m) ≤ 1 − ρ_1(m)`). The fitted `θ*_8(m) = 288/(200m² + 82m + 5)` is only a
  candidate optimum of the recorded template: feasibility is to be PROVED; its optimality or necessity is never assumed.
  Proposed formulas are tested at the FRESH rows `m = 110` and `m = 113` with exact arithmetic and an independent verifier of the
  literal network (or of a PROVED quotient) BEFORE any universal proof is attempted. (ELIG-top)(a): `i_{p*−1} < i_{p*−2}` for every
  `m` in the class — in particular beyond the bounded record ending at `m = 2395` — by a block-mixture argument that applies
  Darroch/Newton ONLY to factors satisfying their hypotheses and controls the mixture explicitly.
- **Tier 3 — carried inputs, with their exact dependencies.** Favorability of every leaf at `p*` and E1's condition (i) at `p*`
  are registered keys (`proved_informal` modulo Darroch/Newton on products of linear factors); they are CITED with that grade and
  dependency, never re-proved as a contribution and never confused with a bounded verification.
- **Outcome C — a verified obstruction.** A deficient cut `(T, p*, X)` in the actual network at an ELIGIBLE row of the class, with
  exact supply and neighbourhood capacity, surviving an independent check (two instruments and an isolated second read): (HALL)
  fails there and the Tier 1 theorem is false at that `m`. Failure of ONE local-flow template (the LP infeasible, the affine
  separation too weak, a closed form wrong) is NOT a cut: it is a template failure and is reported as such. Non-eligible converse
  counterexamples do not refute this target.

## 2. Lean targets (drafts; the synthesis freezes each award's `expected_statement` at Stage 7)

The governed `lean-proof-workflow` with the pinned toolchain (Lean v4.32.2, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`,
the shared project bound read-only). Definitions of record are CARRIED byte-identically from r30's awards through their
`Snippets/` (the C1-LA1/C1-LA2 network layer and the graph-generic chain machinery through C4-LA1's entries 1–21, 25–37, 45–75;
first-interior entry 14 `C5LA1.crossingIndex`) — never re-typed. The CB definition layer is NEW and is built only as far as the
exact theorem needs (the charter: "Build the CB definition layer only as needed to carry the exact theorem").

```lean
namespace E993Transport
/-- CB(8,m) on Fin (17*m+3): labels fixed by the U seats and frozen by the synthesis (r, s, v, chokes, supports, leaves). -/
-- def cbEdge (m : ℕ) : Fin (17*m+3) → Fin (17*m+3) → Prop := …        -- NEW
-- def cbGraph (m : ℕ) : SimpleGraph (Fin (17*m+3)) := SimpleGraph.fromRel (cbEdge m)
-- @[reducible, instance] def cbGraph_decAdj (m : ℕ) : DecidableRel (cbGraph m).Adj := …

/-- Tier 1, the target shape (terminal theorem of a full award). -/
theorem cb8_topRank_eligible_and_weightedHall (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2) :
    (cbGraph m).IsTree ∧
    C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
    3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1 ∧
    ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f
end E993Transport
```

Intermediate awards the synthesis may fund, each a separate certificate at its exact scope: the CB tree/`α`/leaf-classification
layer; the parent descent (ELIG-top)(a) as an integer statement about `I(CB(8,m))` (a pure coefficient theorem — a natural first
formal target, cf. Codex's formally verified binomial-block and relative-margin mechanisms); E1's condition (i) at `p*`
(coefficients of `r_q` — Darroch-free exact forms preferred); the sector-certificate composition lemma (a per-state allocation
satisfying Out/In/Switch/Residual gives (HALL-COND)) over the carried network definitions; and, last, the terminal. "Do not
substitute already known identities for the missing uniform result": an award that proves only a registered identity again is
not funded as progress on (L-S)_top or (ELIG-top)(a).

## 3. Fences

1. **One rank per tree; the class only.** Nothing is claimed at ranks other than `p*`, at `m ≡ 0, 1 (mod 3)`, at `m < 107`, for
   `d ≠ 8`, for heterogeneous CB patterns, or for arbitrary trees. Full (HALL), the arbitrary-tree aggregate, the primary aggregate
   `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, governed beta, TREE, FOREST, TRANSFER and Erdős #993 stay OPEN; a family
   theorem implies `S(T_m, p*) ≤ 0` on its own rows only (FLOW ⇒ SIGN) and transfers no status to any aggregate key.
2. **Fidelity.** The weight, relation, selector and first descent are r30's of record (SEMANTIC-CONTRACT §1); original supports and
   distinct leaf tags are preserved; every instrument asserts `supply − capacity = S(T, p*)` from independent sides BEFORE
   interpreting any computation; the selector is DERIVED; `x` is computed through rank `α`.
3. **Darroch/Newton hygiene.** Applied only to real-rooted inputs (products of linear factors: the blocks of `I`, the `r_q`).
   Applying either to `I(CB)`, `G`, `G^m` or any forest polynomial strikes the argument (the struck r30 uniform proof).
4. **Template vs network.** A per-state allocation is valid for the literal network only through a PROVED reduction (the r30
   structural argument that the certificate's Out/In/switch-load functions are exactly the literal network's restricted to the
   sector — to be written on the face — or an equivalent proved quotient); the affine separation is SUFFICIENT, not necessary;
   the `θ*` law is a conjecture; LP optimality is never a hypothesis of feasibility.
5. **Asymptotics carry explicit error bounds.** "For sufficiently large `m`" is never a proof: every asymptotic step states an
   explicit, checkable `M_0` and an explicit remainder bound; the finite range below `M_0` is handled by named exact certificates
   or left open and named.
6. **Refuted mechanisms stay refuted** (r30 SOLUTION-CONTRACT §3.2's list, plus: the all-families compression lemma; CHAR at
   `m = 1`; the `m`-independent per-choke certificate; forest real-rootedness). A route proposing a mechanism says why it is not
   one of them.
7. **Census discipline.** Exact sweeps discover and test; they never prove a universal statement; the bounded record of
   (ELIG-top)(a) to `m = 2395` is `bounded_computation`.
8. **Sealed roots are never edited** (the r30 root, the heterogeneous-closure root, the master directory, the public repository —
   frozen copies under `sources/`); corrections are records.
9. **Attribution travels on every face**: the mechanism, weight, relation and (HALL): Codex GPT-6's lower-region run; the network,
   awards, criterion, threshold, favorability, closed forms and certificate method: r30 (named seats, as registered); the
   heterogeneous coefficient mechanisms: Codex's heterogeneous-closure run; everything new: the r31 seat of origin.

## 4. Evidence grades

`formally_verified` > `proved_informal` > `conditional` > `computer_assisted` / `bounded_computation` > `conjecture`;
`REFUTED` never regresses; a statement first made at a review stage is STATED and needs an isolated second read before
registration; a composition's grade is its weakest input's (Tier 1 with a finite-range certificate is `computer_assisted`; with
the carried keys it is at most `proved_informal` modulo Darroch/Newton until those are discharged or formalized); a compiled
scratch declaration has no grade until its governed award closes; a companion lemma on an award's face carries no certificate of
its own; a deficient cut is a refutation only after two instruments and a second read agree. Labels kept separate throughout:
finite certificate, informal dependency, conditional result, governed award.

## 5. Stop gate (recorded now; ARMED from the Cycle 2 close per the unarmed-early rule; decisive events halt at any cycle)

- **Decisive event (a):** Tier 1 `formally_verified` at its full scope (`m ≥ 107`, `m ≡ 2 (mod 3)`) — the run ENDS at that cycle's
  Stage 7 close (terminal close follows). Tier 1 at `proved_informal` (confirmed by an isolated second read) is NOT decisive: the
  run continues toward the formal award unless the ceiling intervenes.
- **Decisive event (b):** a confirmed eligible deficient cut in the class (outcome C) — the Tier 1 theorem is false at that row;
  the run continues only if the synthesis names a narrowed, registered alternative (e.g. a residue sub-class or a cutoff) with a
  closed plan; otherwise it ENDS at the next controller checkpoint.
- **Plateau (evaluated from the Cycle 2 close):** a cycle with no material progress on Tier 1/2, no new `proved_informal` lemma and
  no new adversarial finding; two consecutive plateau cycles end the run after the serendipity review.
- **Ceiling:** six cycles. **Checkpoints:** an independent Claude Fable 5.1 (high) analysis at the close of Cycle 3 (an input to the
  Cycle 4 gate; `control/CHECKPOINT-ANALYSIS-C3.md`) and of Cycle 6 (an input to the terminal review;
  `control/CHECKPOINT-ANALYSIS-C6.md`). Each reads the sealed record only, grades the run against this contract, and recommends —
  it does not register, seal or rule; the controller's gate rulings cite it.
