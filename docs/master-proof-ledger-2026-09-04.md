# Erdős #993 — Master Proof Ledger

**Date: 2026-09-04. Prepared by Claude (Fable 5) within the internal research OS at Ashton's
direction.** Supersedes the 2026-09-01 gap map as the program's orientation
document; where this ledger and any sealed record differ, the sealed record
governs. This is the jumping-off point for the next phase, to begin once the
DRE control improvements (post-TRS2-erratum) are in force.


**Updated 2026-09-06, second update — THE (β) REFUTATION (r17) and the r18 close.**
**DECISIVE EVENT: (β) IS REFUTED.** The r17-β run (Codex) produced the
exact order-243 counterexample `R17-BETA-CE-ORDER243-STAR60` (star-60
tree: root `y`, arm `y–s–v`, sixty 3-leaf stars; `x(T)=87`, `p=90`,
`K_A=3`, `a_v(90)<0`, `b_v(90) − Bgen_s(89) = +2.935…×10^51 > 0`), with
dual independent reviews and neutral adjudication (terminal refutation
at exact reproducible-counterexample scope; Lean headline WITHHELD
pending the frozen formalization target `RTree.BetaCounterexample T60
v 90`). **Independently verified by this controller** (independent tree
rebuild + DP; every exact integer matched;
`the r18 controller verification receipt (internal archive)`).
Consequence: the chartered composition (α) ∧ (β) ⟹ (A) (C16) can no
longer deliver THEOREM (A); C16 stands as a true implication with a
refuted antecedent leg. The path to (A) requires a repaired (β′) at a
scope respecting the witness, or a new route. Registered monotone-safe
in `CLAIM-IDENTITY.json` (`E993-BETA-TARGET` REFUTED,
smallest_witness_order 243). **KERNEL-VERIFIED AND AWARDED `governed`
(2026-09-07):** `Order243.T60_not_BetaTarget : ¬ RTree.BetaTarget` at the
pin, axioms exactly the approved three, statement hash equal to the
frozen contract, independent hostile fidelity review PASS-WITH-NOTES.
Scope: (β) over the governed `RTree` model; the D9 semantic-adequacy
bridge to ordinary finite trees remains open and the caveat rides on
every ordinary-tree phrasing. **r18 (five cycles, honest stop at the C5
close, this controller):** `HG2` on `G2 ∧ |U| ≥ 2p−2` is OPEN and
unmoved in either direction (27,466+ instances, zero decisive events);
banked: `HG2Faithful` (RG — the governed HG2 antecedent transcribed
structure-carrying, definitionally equal by `rfl`, with a
kernel-checked interchangeability theorem), the Exchange Lemma
(tree-level VERIFIED + abstract-sequence RG), the quadratic floor, the
every-`e` deepening obstruction with `D(p,0) = Cat(p−1)` PROVED, the
exact non-universality of the (★L)-sufficiency mechanism (firing
criterion `2H ≥ (p+2)·D + 2`), the `H/D` landscape to order 17,603
(record 3.0406…), and the vocabulary-insufficiency theorems for
`sign(a_s(p))`. Both engines' registry fail-closed pins caught each
other's writes as drift; nothing unverified was consumed.

**Updated 2026-09-06 (r15 + r16 + order-22 census deltas).** Three records
reconciled by the controller under separate authority (both runs correctly
quarantined ledger drift and filed proposals): **r15** (Codex, nine
cycles, authority ceiling) — (β) neither proved nor refuted; the exact
normalization `b_v(p) − Bgen_s(p−1) = g_p − g_{p−1}` governed in Lean
(a guarded coefficient-descent framing); support-degree 1 closed by
equality, degree 2 closed through `p ≤ 6`; C13 proved informally; six
governed auxiliaries. **r16** — the IDENTIFICATION CONSTRUCTOR exists at
general scope (RG, seven-leg register, not-a-shim under a written
five-head criterion) and the INTEGRATION lands: the r14 `G1wide`
conclusion now rests on premise set exactly {Premise K, K-SCOPE}.
**The order-22 census** (Ashton's write authority): the authenticated
frontier extends to orders 14–22, byte-identical replay, ZERO decisive
events — (α)/(β)/AmbientTargetDeg2 witnesses now have order ≥ 23.
**Updated 2026-09-05 (r12 + r13 + r14 deltas).** r14 (six cycles, upgraded
model schedule, closed 2026-09-05) did not prove `AmbientTargetDeg2` but
closed its entire `|U| ≤ 2p−3` band premise-free at RG (seven-leg
elaboration register) and adopted the `G2wide` surface, pinning the open
obligation to exactly `G2 ∧ |U| ≥ 2p−2`; the forest corollaries are gated
with premise-labelled floors. The r14 closing record's proposals D1–D4
were reconciled here on 2026-09-05; in doing so a controller documentary
defect was found and cured: the O12/O13 table rows announced at the r12
reconciliation had silently failed to land (unasserted edit) — they are
added now, directly at their r14-refined standings.
**Updated 2026-09-05 (r12 + r13 deltas).** r13 (Codex, six cycles, hard
ceiling stop, closed 2026-09-05) refined O1 into named first-failure
sub-obstructions with a retained exact support layer; no endpoint, headline,
or fence status changed, and no Lean gate triggered. r13's LEDGER-DELTAS
proposals were reconciled into this document by the controller on 2026-09-05
under separate authority (the run itself correctly fail-closed on ledger
drift: it consumed digest `e2c8851b…`, later observed `f0fbb28e…`, and
quarantined rather than reconciling).
**Updated 2026-09-05 (r12 deltas).** The r12 Δ-comparison run (six cycles,
closed 2026-09-04) refined S4's operable content, delivered P1 at
`governed` (closing O6), and added four governed packages; deltas are
edited in place below and cross-referenced to the run's closing record.

Grade vocabulary, ascending: `computation` < `proved_informal` < `RG` <
`governed` < `formally_verified` (never awarded). `PROPOSED` marks statements
this ledger derives or imports that no run has yet gated — they are work
items, not results.

---

## 1. The Conjecture

**Erdős #993 (Alavi–Malde–Schwenk–Erdős, 1987).** For a finite graph `G`, let
`i_k(G)` be the number of independent sets of size `k`, `α(G)` the
independence number, and

```text
I(G;x) = i_0 + i_1·x + i_2·x² + … + i_α·x^α        (i_0 = 1)
```

the independence polynomial. A sequence is **weakly unimodal** if it never
strictly falls and then strictly rises:

```text
∃ m:  i_0 ≤ i_1 ≤ … ≤ i_m ≥ i_{m+1} ≥ … ≥ i_α.
```

**Conjecture (TREE):** every finite tree has a weakly unimodal independence
sequence.
**Conjecture (FOREST):** every finite forest does. FOREST is the full #993
statement; TREE is its connected case. FOREST does not follow from TREE by
multiplication: `I(F;x) = ∏ I(T_j;x)` over components, and products of
unimodal sequences need not be unimodal. The bridge is **TRANSFER**.

External anchors:

- AMSE 1987: for general graphs the sequence is unconstrained (any pattern
  realizable). The conjecture is genuinely about acyclicity.
- Real-rootedness and log-concavity both fail for trees: Kadrawi–Levit
  (arXiv:2305.01784) exhibit unimodal but non-log-concave trees from order 26
  (real-rooted ⟹ log-concave, so both routes die at once). All trees through
  order 25 are log-concave (their exhaustive computation).
- Public verification: all trees through order **29** are unimodal (external
  computation, cited not reproduced; claimed through 32 by a private
  campaign, unverified by us). Our own receipts: trees through **21**
  (authenticated frontier 14–20 + order-21 center-code certificates),
  forests through **18**.

**Consequently: a minimal TREE counterexample has order ≥ 30 (external tier)
/ ≥ 23 (our receipts, order-22 census 2026-09-06); a minimal FOREST counterexample contains a component
of order ≥ 26.** Bounded computation is evidence, never proof.

---

## 2. Notation of Record

All frozen in the sealed r8 `THEOREM-INTERFACE` and the r10/r11 governed Lean
modules; this section is the reading key.

| Object | Definition | Where formal |
|---|---|---|
| `Δ_r(T)` | `i_{r+1}(T) − i_r(T)` in `ℤ` | r11 `RTree.Delta` (governed) |
| first recovery `(p,q)` | `Δ_p < 0`, no intervening positive difference, `Δ_q > 0`, `0 < p < q` | r8 interface |
| `HminTree` | minimum-order first-recovery (= non-unimodal) tree, the object under attack | r8 interface |
| `a_r(v)` | `Δ_r(T − v)` — the leaf profile | r11 `RTree.a` (governed) |
| `x(T)` | crossing index: `min { r : Δ_r(T) < 0 }` | r11 `RTree.crossingIndex` (governed) |
| `support(v)` | the unique neighbor of leaf `v` | r11 (governed) |
| p-favorable support `s` | `∃` leaf `v`, `support(v) = s`, `a_p(v) < 0` (q-side symmetric with `> 0`) | r11 `PFavorableAt` (governed) |
| tokens `x_v, y_v` | `x_v = max(−a_p(v), 0)`, `y_v = max(a_q(v), 0)` per leaf | r8 interface |
| `X, Y, Q, R` | `X = Σx_v`, `Y = Σy_v`, diagonal `Q = Σ x_v·y_v`, off-diagonal `R = Σ_{u≠v} x_u·y_v`; identity `XY = Q + R` | r8 interface |
| `D_p(T), D_q(T)` | aggregate endpoint margins of the Hall frame (`D_p = p(p+1)·C_p(m_p)` for any saturated matching) | r8 interface |
| `TRS2` | `a = 0 ∨ (PositiveIntervalSupport a ∧ Toeplitz2 a)`; on tree sequences ⟺ adjacent log-concavity | r8 `trs2_iff_adjacentLogConcave` (governed) |
| `Bgen_s`, `b_v` | Δ-type quantities of the derived forests `T∖N[s]` and `T−{v, w_v}` | r11 (governed) |

Key elementary facts, governed: `Q > 0 ⟺ ∃ v: a_p(v) < 0 < a_q(v)` (a common
crossing leaf); every tree sequence has positive interval support.

---

## 3. The Master Proof Path

### 3a. TREE — the minimum-counterexample route (main line)

```text
Assume TREE fails.
     |
[S1] Choose HminTree T with first-recovery ranks p < q.            DONE (governed reduction)
     |   Order ≥ 30 (external) / ≥ 22 (receipts); Δ4<0<Δ5 branch
     |   confined to orders 30..32; (q,p)=(5,3) branch excluded
     |   informally via i_4 > i_3 (order ≥ 12, unreified).
     |
[S2] Analyze every original leaf v via T−v and T−{v,w_v};          DONE (governed identity layer:
     track a_r(v); localization to a plateau-safe internal          leaf-deletion, aggregate, residual,
     bottom with positive residual witness.                         extension-profile, 24 r11 identities)
     |
[S3] Prove strict endpoint signs D_p(T) > 0 and D_q(T) < 0.        OPEN  — OB-G1, OB-G2 (WS2)
     |   Hall frame finished up to ONE strict unit; the unit
     |   must come from first-recovery history (all static
     |   sources excluded at exact scope).
     |
[S4] Force one common leaf v with a_p(v) < 0 < a_q(v), i.e.       OPEN  — OB-PAIR-G4 → OB-G3 (WS1)
     Q > 0.  Current best structure under the contrary case         THE DECISIVE GAP
     Q = 0: the r9 corridor theorem + r11 reduction below.
     |
[S5] From that leaf, construct a smaller first-recovery tree.      CLOSED conditional (OB-K4,
     |                                                              proved_informal; formalization debt)
[S6] Contradict minimality.  ⟹  TREE.                              follows from S3–S5
```

Terminal dependency chain (unchanged since r8, statuses updated):

```text
OB-G1 + OB-G2 + OB-PAIR-G4  →  OB-G3  →  OB-K4  →  OB-TREE
     OPEN      OPEN    OPEN      OPEN     COND      OPEN
```

### 3b. Inside S4 — what the corridor program has reduced it to

Under `Q = 0` (no common leaf — the case to contradict), with the endpoint
guards and support-fibre constancy:

- **r9 corridor theorem** (governed, conditional): there exist *distinct*
  closest p-/q-favorable supports joined by a unique positive-length path
  with endpoint sign restrictions and internal nonfavorability, and the
  p-favorable and q-favorable leaf sets are **disjoint**. Any attack must
  contradict this disjointness.
- **The chartered transport lemma** ("force a common crossing leaf, a
  doubly-strict typed path edge, or a smaller counterexample") carries an
  adjudicated disjunct-level negative as originally phrased: two of its
  three defining phrases were never operationalized in the sealed corpus,
  and the third is cut against by exhaustive spread ≤ 1 through order 20.
  It survives only in ingredient form.
- **r11 ingredient reductions** (governed, kernel-checked Iffs): the two
  in-reach ingredient conjectures

  ```text
  (A)  for p ≥ x(T)+1: s p-favorable  ⟹  a_p(s) < 0
  (B)  for every leaf v:  x(T−v) ≥ x(T) − 1
  ```

  are each equivalent to a bound comparing `T`'s Δ-sequence against a
  derived forest's:

  ```text
  (A)  ⟺  Δ_p(T) < Bgen_s(p−1)          (forest T ∖ N[s])
  (B)  ⟺  ∀ r, r+1 < x(T) → b_v(r) ≤ Δ_r(T)   (forest T − {v, w_v})
  ```

**The single named missing tool: a comparison theorem between a tree's
Δ-sequence and that of a derived forest (`T∖N[s]`; `T−{v,w_v}`) at ranks
positioned by the parent's crossing index.** Prove it and both ingredients
follow by already-governed reductions.

**r12 refinement (2026-09-05).** The tool is now exact and split: prove
**(α)** the `k_A = 1` slack inequality and **(β)** the `k_A ≥ 2` condition
inequality, and **THEOREM (A) follows in full** by the governed r12
composition (`adj_TheoremA_of_alpha_beta`) — every favorable support is
leaf-witnessed by definition. (α) at `deg(s) = 2` — the stratum carrying
≥ 99.3% of all exceptional mass through order 21 — is further reduced, at
`governed`, to ONE open statement (`AmbientTargetDeg2`) about the single
derived forest `T∖N[v]`, reachable by fence-legal means under the run's
completed Q1–Q6 boundary rulings. Adjudicated negatives at exact scope:
branch-decomposition is fence-blocked at `deg(s) ≥ 3`; the P1
convolution-side route cannot be universal; the corrected sufficient
condition is permanently leaky (not a reduction). Refute (A) or (B) by witness (order
≥ 19; both hold on all Kadrawi–Levit trees through order 32) and the
corridor program reshapes. Neither ingredient, even proved, closes S4 by
itself — they are the operable content the transport argument would consume.

### 3c. FOREST — the transfer axis (reshaped by the 2026-09-03 erratum)

The classical route is **dead**: "all trees log-concave ⟹ products
log-concave ⟹ forests unimodal" fails at its first premise (order 26).
Universal tree TRS2 is refuted and retired; see
`docs/erratum-2026-09-03-universal-tree-trs2.md` (public repo).

What stands, governed: `TRS2` convolution closure; `transfer_to_forest`
(all components TRS2 ⟹ forest TRS2) — correct use is per-forest with the
premise verified per component. Bounded corollary: every forest whose
components all have ≤ 25 vertices is unimodal.

**PROPOSED sharpening (work item P1, cheap and high-value):** the classical
Keilson–Gerber lemma — the convolution of a log-concave sequence with a
unimodal sequence is unimodal — once verified against source and formalized,
yields immediately:

```text
any forest with at most ONE non-log-concave component is unimodal,
provided that component is unimodal.
```

With the bounded facts above, a minimal FOREST counterexample then either
contains a non-unimodal tree (order ≥ 30 — a TREE counterexample), or has
all components unimodal with **at least two non-log-concave components,
each of order ≥ 26, hence forest order ≥ 52**. And conditionally on TREE,
FOREST reduces exactly to:

```text
TRANSFER (reshaped): the product of two or more unimodal,
non-log-concave tree sequences (with any log-concave mass folded in)
is unimodal.
```

The open invariant question is now precisely: **a convolution-stable class
strictly between log-concavity and unimodality containing all tree
sequences.** Constraints on any candidate: it must HOLD on the
Kadrawi–Levit family T(3,k,k) / T(3,k,k+1) (mandatory fixtures, orders
26–34+); the r10 measurements bound the search (candidates weaker than
TRS2 are unfalsifiable below order 26 — test AT the fixtures, not below;
every measured stronger-than-TRS2 candidate failed on 34–98% of trees);
the B_T subtraction obstruction bars convolution-only induction through
the blocked-root recurrence state for any such invariant.

### 3d. COUNTEREXAMPLE branch

Always live, always the cheapest decisive event. Current honest search
frontiers in §6. Any literal witness (tree order ≥ 30, or forest per §3c)
reshapes everything; every falsifier harness must include
literature-guided targeted instances *beyond* the exhaustive horizon
(the TRS2 lesson).

---

## 4. Claim Ledger

Statuses as of 2026-09-04. "governed" = Lean kernel at the pinned toolchain
+ independent rebuilds + fidelity review, per the source run's rubric.

### Settled positive (permanent assets)

| # | Claim | Grade | Source |
|---|---|---|---|
| C1 | Reduction of TREE to the HminTree/(p,q) scheme; `0 < p < q`; localization with positive residual witness | governed (aux) + proved_informal | r8 |
| C2 | Leaf-deletion / aggregate / residual / extension-profile identity layer; two-leaf deletion symmetry; 24 r11 corridor-interface identities incl. the generalized vertex-deletion identity | governed | r8, r11 |
| C3 | Hall frame: `Σ_S λ_T(S) = Σ_v i_k(T−v)`; `D_p = p(p+1)·C_p(m_p)` giving `D_p ≥ 0` (mirror q-side) | governed (aux) | r8 |
| C4 | r9 corridor theorem: under G1/G2 + fibre constancy + Q=0, distinct closest favorable supports, unique path, endpoint signs, internal nonfavorability; support-set disjointness under Q=0 | governed, conditional | r9 (Codex) |
| C5 | `TRS2 ⟺ adjacent log-concavity` (positive interval support); TRS2 convolution closure; SCP closure | governed | r8 |
| C6 | Extension-profile recurrences vs independent ground-truth model; tree-sequence `NNSeq` admission; coefficient correspondence | governed | r10 |
| C7 | `transfer_to_forest`: all components TRS2 ⟹ forest TRS2 | governed, conditional | r10 |
| C8 | r11 ingredient reductions: (A) ⟺ `Bgen` bound; (B) ⟺ `b` bound (kernel Iffs); BridgePredicate statable | governed | r11 |
| C9 | Rank-4 log-concavity for large trees: `i_4² > i_3·i_5` for every tree of order ≥ 27 | governed | gap-bridge |
| C10 | Audited band: any tree with `Δ_4 < 0 < Δ_5` has order 13–32, with μ-thresholds `N_2..N_8 = 17,20,23,26,28,31,34` | proved_informal (audited) | proof-gap run |
| C11 | Double brooms D(1,m), D(2,m) unimodal; assorted r7 exclusions (first-recovery rank one, endpoint-sign, four-class, …) | governed | r7 |
| C12 | Decoder core; encoder–decoder fidelity (narrowed); marker transport (narrowed) | governed (narrowed scope) | r9-Claude |
| C13 | `i_4 > i_3` for trees of order ≥ 12 (excludes the (q,p)=(5,3) branch) | **proved_informal (r15, 2026-09-06)** — upgraded from unreified-internal; Lean formalization still open (O4) | proof-gap run; r15 |
| C18 | The identification constructor (general scope, not-a-shim under the five-head criterion) + the integration: the r14 `G1wide` conclusion on premise set exactly {Premise K, K-SCOPE} | RG (7-leg/5-seat register) | r16 |
| C19 | The (β) normalization `b_v(p) − Bgen_s(p−1) = g_p − g_{p−1}` + inequality equivalence; the component-extension bound `Δ_c(T) ≤ 0 ⟹ 1 ≤ c ∧ m ≤ 3c−2`; the support-degree-2 gap reduction | governed (auxiliary scope) | r15 |
| C14 | `P1_NNSeq`: Toeplitz2 ∗ unimodal = unimodal (NNSeq scope; interval-support hypothesis unused) — attribution: Keilson–Gerber (1971), primary text unconfirmed | governed | r12 |
| C15 | The corrected combined identity `a_s(p) = a_v(p) + (b_v(p) − Bgen_s(p−1))` and its witnessed-leaf conditional corollary | governed | r12 |
| C16 | The composition slate: (α) ∧ (β) ⟹ THEOREM (A) in full | governed (implication only) | r12; **antecedent leg (β) REFUTED by the r17 order-243 witness (2026-09-06)** — the implication stands, the chartered path through it is dead |
| C17 | (α) at `deg(s)=2` ⟺-reduced to `AmbientTargetDeg2`; BR-FACT-1 root stratum | governed | r12 |

### Settled negative (fences — do not reopen without a new guard/representation)

| # | Refuted mechanism | Certificate |
|---|---|---|
| F1 | Universal tree log-concavity / universal tree TRS2 as TRANSFER | order-26 K–L witnesses (erratum 2026-09-03; replayable) |
| F2 | Real-rootedness of tree independence polynomials | implied by F1 |
| F3 | Unguarded deficient-block ⟹ smaller carrier | P₃ certificate |
| F4 | Invariance-only selectors | C₂-swap certificate |
| F5 | Compressed decoder states / `pi_UD` factorization | exact collisions lose endpoint data |
| F6 | Uncompensated `LCM_run` cross-term mechanism | center-rooted K₁,₃ certificate |
| F7 | Deriving `Q > 0` from `R < XY` in any disguise | equivalent to the conclusion (rejected explicitly, r8 C12) |
| F8 | Scalar marginals for same-leaf overlap | r8 |
| F9 | Saturation / surplus / unmatched cardinality ⟹ strict endpoint units | r9 exact-scope certificates (8-mechanism fence) |
| F10 | Convolution-only induction through the blocked-root state | B_T difference-of-products obstruction (Verity) |
| F11 | The transport lemma as originally chartered (3 disjuncts) | r11 adjudicated disjunct-level negative |
| F12 | Closure candidates weaker than TRS2 tested below order 26; ~12 stronger designs | r10 HC-9 pincer (now understood: first LC failures at 26) |

### Open obligations (the actual work)

| # | Obligation | Status | Blocked by / next test |
|---|---|---|---|
| O1 | **OB-G1/OB-G2** — strict endpoint signs `D_p > 0`, `D_q < 0` | OPEN (WS2) — **r13-refined (2026-09-05)** | The strict unit must come from first-recovery history; all static witnesses fenced (F9), and r13 rejected static history *carriage* as not substantive history use. First failures, named: the **p-chain** is open first at **substantive history-definedness** (a genuinely history-responsive operation must be defined before totality; strictness may not come from PB-X, endpoint strictness, cardinality, surplus, saturation, or matching existence); the **q-chain** is open first at **proof-independent selected-`m₀` occurrence identity and exact typed binding** (Q1 gates Q2 coverage/commutation, which gates Q3 cross-rank comparison). Retained exact support layer (run-local E1; scopes bind): minimal p-Hall-deficient family structure; exchange-cut carrier; zero-cost deletion bijection with `Δ_p = 0` endpoint; leaf-tagged Γ normal form with fixed-`A` zero; repaired per-leaf phase lemma; conditional augmentation schema (interface uninstantiated). New mechanism-scope refutation: the unguarded one-move charge (labelled K₁,₃, q = 2). Successor entry conditions: r13 `SUCCESSOR-HANDOFF.md` |
| O2 | **OB-PAIR-G4 → OB-G3** — the common leaf, `Q > 0` | OPEN, decisive (WS1) | contradict Q=0 support-disjointness via the corridor; operable content = O3 |
| O3 | **The Δ-comparison targets, refined by r12:** (α) the `k_A=1` slack inequality; (β) the `k_A≥2` condition inequality; at `deg(s)=2`, (α) ⟺ `AmbientTargetDeg2` | OPEN — the program's sharpest objects | prove ⟹ (A) IN FULL by C16; refute by witness at order ≥ 22 (≤ 21 exhausted) ⟹ decisive event; the `deg(s)=2` stratum is fence-legal under the r12 Q1–Q6 rulings; **r14 (D2):** the deg-2 open content is exactly the O12 row; the unimodality sign route refuted by exhibition at bounded scope; whether some underived composition bounds `D ≤ H−1` on `G2 ∧ |U| ≥ 2p−2` remains OPEN — an absence of derivation, not an impossibility; **r15 (2026-09-06):** (β) normalized to a guarded coefficient-descent theorem (C19); support-degree 1 CLOSED by equality, degree 2 closed through `p ≤ 6` (`p ≥ 7` and degree ≥ 3 open); named next routes: the full-root-subset rank-transfer theorem and the common-field correlation theorem (r15 FINAL-RECONCILIATION) ; **r17 (2026-09-06): (β) REFUTED** at universal scope and at the degree-2/`p ≥ 7` stratum by the exact order-243 witness (controller-verified); the O3 open content is now (α) ALONE — the `k_A=1` slack inequality, whose `deg(s)=2` content is exactly O12 — plus the strategic question of a repaired (β′) respecting the witness |
| O4 | **OB-K4 descent, formalized** | proved_informal | order-eight base + leaf-restoration sublemmas never reified (with C13) |
| O5 | **TRANSFER, reshaped** — the invariant class between LC and unimodality | OPEN | candidates must pass K–L fixtures; F10, F12 bind |
| O6 | ~~P1 import~~ — CLOSED at `governed` (r12); **corollary gating DONE (r14, D3):** FOR-COR-II the dichotomy of record; premise-free items at RG at abstract scope; Premise-K items premise-on-face; floors 26/27/52 premise-labelled ("52" only for the all-components-unimodal disjunct) | CLOSED | documentary: Radcliffe named via the K–L primary text (r14 C1); the [26] primary reference and the Keilson–Gerber primary text remain unretrieved |
| O7 | Semantic-adequacy residual — the bridge correspondence as a Lean lemma (r11 E3) | OPEN (two-thirds done) | state and prove, or record exact obstruction |
| O8 | C7-BRIDGE measurement registration | registered for successor | capability rows exist |
| O9 | Close the `Δ_4<0<Δ_5` band 30..32 | OPEN — **receipts not yet sourced (r13, 2026-09-05)** | r13 searched its authorized corpus and found NO qualifying order-30/31/32 receipts: public verification reaches 29; the through-32 claim is private and unverified. Requires explicit source authorization — declared-provenance reproduction receipts per order, or an independently authorized structural enumeration; self-reports and bounded zeros do not qualify |
| O10 | M2 / REP-G4 completion (representation-transport residues) | proved_informal, residues named | full-scope decoder chain if PAIR-G4 goes inductive |
| O11 | Lean debt, residual | small | interval-bound conversion; fresh-root treehood; `∂_y` receipt |
| O12 | **`AmbientTargetDeg2`** — the r12 C6 residue, **r14-refined (2026-09-05)** | OPEN — strictly narrowed | Reduction of record completed at RG (r14 C3); successor surface `ambientTargetDeg2_of_G1wide_G2wide` ADOPTED (r14 C4 Q2); **the entire band `2 ≤ p ∧ |U| ≤ 2p−3 ⟹ D ≤ 0` closed premise-free at RG** (`residual_nonpos_of_card_le_band`; seven elaborations, four parties); S1/S4/S5 discharged inside the surface; the G1 side closes only under Premise K + K-SCOPE + the identification premise. **The open obligation is exactly `HG2` on `G2 ∧ |U| ≥ 2p−2`**, signature `AMB-CTREX-D2`, blocking facts BF-1..3 (r14 FC-R14-10); new premise-free constraint: any deg-2 counterexample has `n ≥ 2x(T)+3` (a proof-obligation narrowing, never a search restriction). Gating items: order-22 census provenance and the identification constructor — **both EXECUTED (2026-09-06):** the census extends the frontier to order 22 (witnesses ≥ 23); the constructor EXISTS (C18) and the G1 side is upgraded to premise-carrying-BY-CONSTRUCTION — the open obligation is unchanged and exactly `HG2` on `G2 ∧ |U| ≥ 2p−2` ; **r18 (2026-09-06, five cycles, honest stop):** `HG2` unmoved in either direction; `HG2Faithful` RG (rfl-definitional transcription + kernel-checked interchangeability); (★L)-sufficiency proved NON-universal (exact firing criterion `2H ≥ (p+2)·D+2`, edgeless-U star-hub scope); `H/D` landscape mapped to order 17,603 (record 3.0406…, no approach to 1 found; the orders-303/1263 anchors corrected into the closed S4 stratum); `sign(a_s(p))` proved not a function of `(|U|, crossIdx(U))` + leg hypotheses (legs-only and legs+`combined<0`, order ≥ 23 witnesses); successor entry: r18 FINAL-RECONCILIATION §6 — re-draw the path to (A) first |
| O13 | `EXCEPTIONAL-SHAPE-1` sufficiency; `C7BBgenBound` RESERVED (r12 Q6: identity substrate legal, inequality core not) | OPEN | r12 residue register; **r14 (D4):** sufficiency-side and instrument outputs gated at proved_informal/computation — NEC-1 necessary-at-exhaustive-scope, killed as an equivalence; no sufficient structural condition from measured data; the `x(U)=p−1` observation documented at exact scope, explanation refused (F1/F2-adjacent) |

---

## 5. Proof Strategies — the honest inventory

| Strategy | Verdict | Note |
|---|---|---|
| Real-rootedness | **dead** (F2) | — |
| Log-concavity / TRS2 transfer | **dead** (F1) | conditional theorem + bounded corollaries survive |
| Minimum-counterexample / first-recovery (S1–S6) | **main line** | all difficulty concentrated in S3 (one strict unit) + S4 (Q>0) |
| Corridor transport (r9→r11) | **active**, reduced to O3 | the sharpest formulation of S4 |
| Invariant-class transfer (reshaped) | **active**, reframed | K–L fixtures mandatory; external campaign (Ω-ULC) works the same reframing — prior art, citation only |
| Forest structure route (§3c) | **new, cheap opening** | P1 ⟹ ≥2 big non-LC components; attacks FOREST semi-independently of S4 |
| Exhaustive/targeted computation | supporting | decisive only via witness; horizons in §6; falsifiers must probe beyond-horizon fixtures |
| Special-class results (brooms, spiders, caterpillars, …) | supporting | ours + literature; no route to universality by class union |

**Priority for the next phase** (once the DRE controls are in force):
**O12 first** (`AmbientTargetDeg2` — one statement, fence-legal, carrying
≥99.3% of the exceptional mass; (α) at `deg(s)=2` follows by a governed
reduction, then (A) needs only (β) and the `deg(s)≥3` slice of (α)),
**O1 second** (the strict unit; Codex's r13 charter), the §3c corollary
gating as a short task (O6's unlock), O9 as a cheap branch closure, O5 as
the long game under fixture discipline.

---

## 6. Bounded Frontiers (evidence, never proof)

| Fact | Horizon | Provenance |
|---|---|---|
| All trees unimodal | ≤ 29 | external publication (cited; receipts not imported) |
| All trees unimodal | ≤ 21 | ours: authenticated 14–20 frontier (823,065 order-20 classes; frozen byte contract, digest `ba891179…`) + order-21 center-code certificates (2,144,505 trees, independently regenerated) |
| Zero FR / Split / Cross / Obstruction / B4 / negative-total-minor hits | ≤ 20 (239.7M pair instances) | ours, sealed census |
| All forests unimodal | ≤ 18 (310,782 disconnected types) | ours |
| All trees log-concave | ≤ 25 | Kadrawi–Levit (external); first failures at 26, replayable in our evidence dir |
| r12 targets (α), (β) hold | ALL trees ≤ 21 exhaustive (2.14M at 21) + 1,908 adversarial + K–L fixtures 26–34 | ours, r12 sealed |
| `AmbientTargetDeg2` holds | ≤ 21 exhaustive (r12) + r14 targeted to order 46 incl. the first measured G2 cells (orders 22–29) | ours, r14 sealed |
| r11 ingredients (A), (B) hold | all trees ≤ 18 exhaustive; K–L family through 32 targeted | ours — artifact of record: public repo `evidence/kl-order26-trs2-witness/witness-report.json` (commit 21797c0; r11_theorem_A/B_violations empty on T(3,4,4)…T(3,5,6)+controls), independently reproduced by r12 C1-H fixtures (n=26–34) and the r12 C1 adjudicator |
| Ingredient-level identity battery | ~1.6M–6.4M instances per object | ours, capability-certified harnesses |

---

## 7. Formal Asset Inventory

46 published Lean packages (`proofs/lean/`, public repo, all `governed` at
the pin Lean 4.32.2 / pinned Mathlib, axioms within
`[propext, Classical.choice, Quot.sound]`, sorry-free):

- **r7 family (12):** double brooms, endpoint sign, first-recovery rank one,
  two-leaf four-class, boundary factorization, rooted attachment/signature,
  finite coupling, component selector, containment stub, contextual
  attachment.
- **r8 family (7):** TRS2 (+ equivalence), SCP convolution, extension-profile
  specialization, extension-set bridge, positive-rank boundary, rbag decoder
  obstruction, two-leaf deletion.
- **r9 family (6):** quotient decoder, fidelity (narrowed), M3 (narrowed),
  fresh-root sectors, rooted-star cross-term, E3 double count.
- **r10 chain (4):** recurrences → NNSeq admission → coefficient
  correspondence → `transfer_to_forest` (conditional; erratum note attached).
- **r11 chain (4):** corridor interface → extended identities → bridge
  predicate (defined, not proved) → ingredient reductions (the two Iffs).
- **r12 chain (4):** P1 convolution lemma → corrected reduction identities
  → the (α)∧(β)⟹(A) composition slate → the deg(s)=2 reduction to
  `AmbientTargetDeg2`.
- **r14 chain (3):** the ambient band slate (the band theorem + the adopted
  `G2wide` surface, 13 declarations) → the reduction/perimeter module →
  the forest-corollary dichotomy chain.
- **r15 (1):** the (β) descent auxiliaries (six governed declarations).
- **r16 chain (2):** the identification constructor → the integration
  ({Premise K, K-SCOPE} premise set).
- **Corridor theorem** (r9 Codex run) + 19 auxiliaries; **gap-bridge**
  (`i_4² > i_3·i_5`, order ≥ 27); marked-extension-charge; rooted-residual
  profile.

Toolchain pin and cache-manifest discipline: see any package README.
Public mirror: `github.com/Xeit-AI-Inc/erdos-993` (through commit
`21797c0`, which includes the TRS2 erratum and the K–L witness evidence).

---

## 8. Process Preconditions for the Next Phase

Binding lessons from the TRS2 forensic record (Codex audit,
`../erdos-993-literature-route-audit-2026-09-03/`), to be enacted as DRE
controls before the next run consumes this ledger:

1. Canonical claim identity with alias sets; **monotone refutation
   precedence** (REFUTED never regresses to OPEN without a written semantic
   distinction).
2. Transitive rejected-mechanism import (this ledger's §4 fence table is the
   seed); capsule coverage audits against it.
3. Universal-claim counterexample gate before any proof search (project
   ledger + witness registry + literature).
4. Fail-closed on out-of-corpus evidence gaps; the controller Study
   Interlude MUST perform out-of-corpus reconciliation when any party
   declares one needed.
5. Census/falsifier horizons checked against smallest-known-witness orders;
   K–L fixtures mandatory in every invariant harness.
6. Ceiling honesty unchanged: nothing graded `formally_verified`; bounded
   zeros are evidence of nothing; conditional faces undetachable.

**Enacted 2026-09-05.** Items 1, 2, and 5 are now mechanical: this
program's claim identities live in `CLAIM-IDENTITY.json` beside this file
(seeded from the forensic audit's corrected status ledger and the §4 fence
table), and every run's obligation and terminal ledgers are checked against
it with `the claim-status lint (internal tooling)`
before dispatch and at closeout (controller playbook v0.4, "Claim-ledger
controls"). Items 3, 4, and 6 are mandatory controller steps in the same
playbook section. A refuted claim reopened without a written distinction now
blocks the run rather than costing it six cycles.

---

## 9. Sources & Authority

Sealed runs (READ-ONLY): 2026-08-25 six-cycle; 08-26 continuation; 08-28
tree-no-recovery; 08-29 proof-gap completion; r8 extension-profile-same-leaf
(08-31, `OBLIGATIONS.csv` 67 rows); r9 PAIR-G4 (Codex, 16 cycles,
`FINAL-RECONCILIATION.md`); r9 quotient-decoder; order-20 census (09-02);
r10 TRS2 B_T-closure (09-02, + erratum 09-03); r11 corridor transport
(09-03); r17-β beta-remainder (Codex, 09-06, decisive event + SUCCESSOR-HANDOFF); r18 HG2 (09-06, five cycles, honest stop, TERMINAL-SEAL be5cb06f…). Status docs: `THREE-ENGINE-STATUS-2026-09-02.md` (as corrected);
the 09-01 gap map (superseded by this ledger); the public repo's
`STATUS.md`, `docs/erratum-2026-09-03-universal-tree-trs2.md`,
`docs/roadmap.md`. The TRS2 forensic audit governs §8.

*Headline targets TREE, FOREST, TRANSFER, COUNTEREXAMPLE: ALL OPEN.
Nothing in this ledger moves them; its purpose is to make the distance
exact.*
