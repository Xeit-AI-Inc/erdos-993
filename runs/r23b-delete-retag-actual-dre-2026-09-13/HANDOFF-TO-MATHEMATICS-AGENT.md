# Handoff to the mathematics agent — r23 actual-tree Delete/Retag DRE (terminal)

**Status: STAGED DRAFT, route C6-U1, Cycle 6.** Per SOLUTION-CONTRACT §5/§9
and `control/CYCLE6-ALLOCATION.md` §C6-U1. Staged in this route's evidence
tree; the controller installs at the run root (as the §9 handoff
deliverable) only at the C6 gate, after adjudication. This document
asserts no theorem truth beyond what is cited to a sealed source; per
SOLUTION-CONTRACT §10 (verbatim, reproduced in full at §6 below):
**computation is evidence, never proof; no bounded zero is evidence of
anything; nothing here is `formally_verified`.**

Division of work (SOLUTION-CONTRACT §1, unchanged): this run owns
construction, semantic correspondence, and trustworthy verification of the
literal Delete/Retag relation on actual trees. **Proving O14
(`E993-BETA-AGG`) itself is out of scope for every r23 seat** (standing
duty 13) and remains the mathematics agent's lane. This document hands
over what this run established, at exact scopes, so that work can begin
without re-deriving it.

## 1. Established graph-derived identities, at exact scopes

All items below are quoted or restated from adjudicated, registered rows.
None is `formally_verified`; the Lean-tier items are sorry-free at the
pinned toolchain (Lean 4.32.2 / Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`)
where so stated, which is a strictly narrower claim than "proved" in the
informal sense used elsewhere.

- **THEOREM TYPE-2-DIRECT** (`R23B-C5-T1-01`, RETAINED): `g_v =
  Δ_{p−2}(K_v)` at `deg(s_v) = 2`, **cut-free and unconditional**. This is
  the sharpest direct structural description on record of `g_v` at the
  degree-2 support case.
- **The path family, closed at governed scope** (`R23B-C5-T1-02`,
  RETAINED with a prose correction to `Δ_k ≤ 0`): `S(P_n,p) ≤ 0` on every
  path `P_n`, every `n ≥ 4`, every governed `p`, by peeling alone —
  critic-verified to `m = 3000`. This is one of the three T-lane
  disjuncts that satisfied the C5 stop-test's structure clause
  (`C5-GATE-RECORD.md` §1).
- **The star characterization** (`R23B-C5-T1-03`, RETAINED_NARROWED — a
  corroboration sentence was struck as a null control): for `K_{1,m}`,
  `|C_r(v)| = C(m−1,r)` (`r ≥ 1`); the sign condition `g_v ≤ 0 ⟺ p ≥
  ⌈m/2⌉` is exact arithmetic; `S(K_{1,m},p) ≤ 0` at governed scope.
- **The branch-leaf closed form** (`R23B-C5-T1-04`, RETAINED, upgraded
  from coverage-untested), under the mandatory convention `Δ_{−1} = 1`.
- **The C4/C5 identity family** (T5 Findings 1–7, `C4-GATE-RECORD.md` §2,
  carried unchanged): the reformulation `def(G) = Σ(g_v + μ_v) − export`
  and the accompanying μ-mass identity — currently the sharpest structural
  description of the surviving question (per-row demand `|P| ≤ |N|`).
- **LEMMA F3-1, sharp** (`C4-GATE-RECORD.md` §2, RETAINED): `hot ⟹ E ≥ p`,
  with `E = p` **attained on the CB(8,92) witness** — i.e. the bound is not
  merely valid but tight at the decisive witness. (F3's own Finding 3,
  asserting an additional size-formula, was REJECTED as a false
  certification — four critics concurring — and is not part of this
  lemma.)
- **The corrected CB-arm hotness (ratio) criterion** (`R23B-C5-F2-01`,
  retained at **route-distinctness tier**, not full causal independence):
  `g_arm > 0 ⟺ 2(jk − p + 2) > p − 1`. This corrects a controller charter
  typo (`2(jk−p+1) > p−1`, FALSE at the witness — controller-owned defect,
  caught by C5-F2, credited) that must not be propagated into any
  downstream statement of the criterion.
- **CB(8,92) arm hotness, structurally explained** (`R23B-C5-T1-06`,
  RETAINED): `K_arm` = 736 disjoint edges, `x(K_arm) = 491`, `p − 2 = 490`
  — exactly one rank below the peel's first strict descent. This is the
  structural reason the arm is hot, not merely a numeric coincidence, and
  is the content behind what this document calls the **hot-arm design
  law** (§3 below).
- **The sharpness relation, forward direction only** (`R23B-C5-T1-05`,
  RETAINED_NARROWED; the reverse direction is REJECTED, OPEN at governed
  scope, on an exhibited counterexample): `hot ⟹ p − 2 < x(K_v)`. Do not
  read the converse as established.
- **Six relation-family transport lemmas, sorry-free at the pin**
  (`R23B-C5-T2-01`): 297 constants, `sorryAx = 0`, extra axioms 0, all
  [GATE-INSTALL, terminal C6 state per ADJ-T/U1-T: the terminal merged project is 300 constants (C6-T1 grand-merge, R23B-C6-T1-01/02) and 370 in the T3 terminal consolidation (R23B-C6-T3-01), sorryAx confined to the two known-open fixture lemmas; the 297 above is the C5 state of record.]
  graph-general — reproduced byte-identically by two independent critic
  instruments, mutant control fires on exactly the named declarations.
  **These transport the aggregate-quantity family only** (`i_k`, `Δ`,
  `x`, leaf, `Favorable`, `S`) — see §2's compensation inequality and §4's
  named debt for what this does NOT cover.

## 2. The weakest remaining compensation inequality

The per-row demand is, and remains, the sharpest sufficient condition on
record for the run's target:

    |P| <= |N|      (the O14 row itself, via BRIDGE-2)

where, per SEMANTIC-CONTRACT §3–4 (BRIDGE-1/BRIDGE-2, controller-verified
numerically, Stage-0: 280 instances, orders 8–12):

    |C_r(v)| = i_r(H_v) - i_r(T - N[s_v])                    (BRIDGE-1)
    |P| - |N| = sum_{v in F} (b_v - B_{s_v}) = S(T,p)         (BRIDGE-2)

so `|P| <= |N| <=> S(T,p) <= 0` **exactly** (this equivalence is arithmetic,
not conditional — it is the definition of the aggregate, not a mechanism
claim). All-cut Hall on `(P, N, Delete ∪ Retag)` is **sufficient but not
necessary** for `|P| <= |N|` (a matching argument, not an iff); a deficient
Hall cut refutes only the mechanism that produced it, never the row's
`S(T,p) <= 0` demand directly. **Both values — the cut deficiency (or its
absence) and the sign of `S(T,p)` — must be reported on the same row,
always** (SOLUTION-CONTRACT §4, binding on every face this run produced).

No sharper sufficient condition than `|P| <= |N|` survived this run's six
cycles. Every strengthening attempted (all-cut Hall on the literal
relation, Delete-only universal Hall, tag-closed-cut Hall/W4) was refuted
by an exact witness (§3 below) rather than proved. **`|P| <= |N|` IS the
O14 row**, unweakened and unstrengthened, and is exactly what the
mathematics agent inherits as the concrete reformulation of O14 on the
actual-tree domain — not a new target, the same target restated exactly.

## 3. Structural obstructions

- **The branch-point reduction** (`R23B-C5-T1-07`, RETAINED as "the
  conversion's exact reach"): peels with a branch point reduce to the open
  weak-unimodality question itself. This is a **reduction, not a
  resolution** — it shows the peeling technique that closes the path
  family (§1) cannot be extended past a branch point without already
  assuming what is to be proved. Any future attack via peeling must
  either avoid branch points or supply new content at them.
- **The refuted cut lattice** (`R23B-C4-T6-01`, RETAINED_NARROWED — the
  Lean content is sound, the surrounding prose was stale and is corrected
  here): the mechanism lattice of record (LAT-1…4, cut-class exactness,
  TFAE structure, `rfl`-identity to `THM_R23_C_hall_discharged`) is
  Lean-complete and **hypothesis-only** end to end. Specifically, **all
  three cut-based strengthenings of the per-row demand are refuted and
  closed** (standing duty 23, the A2.2-class dead-branch fence, extended
  at the C4 gate): all-cut Hall (order-91 witness T22), Delete-only
  universal Hall (refuted a fortiori from the same witness family), and
  tag-closed-cut Hall / W4 (order-1567 witness CB(8,92)). `LAT-3`
  (`tagClosedHall_implies_perRow_demand`, `tagClosedHall_implies_S_nonpos`)
  now sits in HYPOTHESIS-ONLY status alongside the all-cut node — every
  node of this lattice is an implication whose hypothesis is refuted, not
  a false theorem, and **no seat may hand this lattice onward as a live
  mechanism** (standing duty 23). Both witnesses, fully inspectable with
  all six mandatory row controls, are on record:

  | | order-91 (T22) | order-1567 (CB(8,92)) |
  |---|---|---|
  | cut | NO-BRANCH-CENTER, excess 14226520737620288370 | tag-closed singleton `G={v}`, deficiency `C(736,491)·2^491 − C(736,490)·2^490 > 0` (347 digits) |
  | S on the same row | `−498754180547001418536` at p=34 | `−748810430710227858618987…557120` (351 digits) |
  | favorable leaves | 67 | 737 (736 pendant + 1 arm) |
  | reproductions | Stage-0 + controller-verified | **five** independent digit-exact reproductions (controller registrar; F1's two-route instrument; CRIT-F1-T from-scratch; CRIT-F1-U edge-list rebuild; CRIT-T5-F/U prose-only) |

  Both rows: mechanism kill, **never** a target counterexample; O14
  untouched on both.
- **The hot-arm design law** (`R23B-C5-T1-06`, content restated from §1):
  a hub/choke construction with a single "arm" leaf and many uniform
  "choke" pendant leaves produces exactly one hot tag (the arm) by
  design — `K_arm` = 736 disjoint edges puts `x(K_arm)` one rank above
  `p−2` exactly. This is the structural mechanism behind every hot-arm
  witness this run built (CB(8,92) and its family) and is offered as a
  **design law for constructing further witnesses or counterexamples**,
  not merely a description of one instance.

## 4. Named debt (the specific unresolved correspondence debt, verbatim per SOLUTION-CONTRACT §9)

Final status distinguishes **construction proved / construction
contradicted / specific unresolved correspondence debt** (verbatim phrase;
see the repair record in `C6-TERMINAL-CLOSE-INPUT-LIST-REPAIRED.md`,
Repair 3, for why this must not be softened to a bare "open"). The debt,
named exactly:

**The relation-family transport lemma has no proof, as of the C5 close**
(`C5-GATE-RECORD.md` §1, §4): the aggregate-quantity family (`i_k`, `Δ`,
`x`, leaf, `Favorable`, `S`) transports (§1's six lemmas, sorry-free), but
**`P`, `N`, `Delete`, `Retag`, `C_r(v)` have no abstract-side referent** —
`Graph.induce`-based `P`/`N` transport, `induce_ofSimpleGraph`, and the
activity-filter transport (the sub-family `{A : A ∩ W_v ≠ ∅}` under the
realization equivalence, which `R23B-C5-F2-05` identifies as **new content
no current lemma touches**) are all undischarged. "Named residual closed"
is explicitly **NOT registrable** (`R23B-C5-T2-02`). The exact remainder
list is R-1…R-5 (synthesis ruling, `C5-GATE-RECORD.md` §1): ADJ-T's three
(P/N via `induce`; `induce` as object; the second ledger clause) plus
ADJ-F's sharpening (the activity filter is new content; P/N/Delete/Retag
lack an abstract-side referent). **C6-T2 is charged with stating the
earliest precise unproved sub-lemma exactly** (`control/CYCLE6-ALLOCATION.md`
§C6-T2); this route has not read C6-T2's evidence (sibling-isolation, see
`TERMINAL-DELIVERABLES.md`) and hands over the C5 state of record rather
than the C6 outcome, which the controller must fold in at the gate.

**TREE / FOREST / TRANSFER / COUNTEREXAMPLE remain OPEN** in the sense of
the ceiling-honesty block (§6). No target-tier event occurred at any
point in this run's six cycles: every positive-`S` search returned zero
(bounded, evidence of nothing), and every mechanism kill left O14
untouched on the same row.

## 5. The RTree horn — stated as ASHTON'S DECISION, both horns' consequences

This is a foundational scope question this run has surfaced repeatedly
(`SEMANTIC-CONTRACT.md` A1.1; `C4-GATE-RECORD.md` §4: "the RTree horn is
Ashton's decision at close"; `C5-GATE-RECORD.md` §4: carried forward
unresolved) and has **not** decided, because no r23 seat is chartered to
decide it — it determines what counts as *the* theorem this program is
about, which is a scope decision, not a derivation.

**The premise.** The literal Delete/Retag relation's authoritative source
text (r19 `c7-T1` §2) is stated on **governed RTrees**, a model object.
This run's every "actual tree" result — including both refutations above —
instead uses the relation on **ordinary finite trees**. The move from the
RTree-scoped original to the ordinary-tree restatement used throughout
this run is, per A1.1, **an r23 CONVENTION, not a proved transfer**:
`RTree.semanticAdequacyTarget` is stated, unproved, and source-annotated
**unattempted**. Per-instance adequacy is decide-dischargeable (r8
precedent); the **universal** statement — that the ordinary-tree
restatement is adequate for *every* tree, not just checked instances — is
the actual gap, and A1.1 binds every "actual tree" sentence this run has
produced with this premise until one of the two horns below is taken.

**Horn A — prove the universal transfer
(`RTree.semanticAdequacyTarget`).** Consequence if successful: every
r23 actual-tree result (both refutations, the identity family in §1, the
compensation inequality in §2) becomes a **genuine instance** of the
original governed-RTree-scoped claims (`E993-R19-FIXED-GAMMA-HALL`,
`E993-R19-R2-HALL-UNIVERSAL`), closing OB-R23-CORRESPOND's foundational
gap completely and letting this run's refutations and identities speak
directly to the r19-scoped program without qualification. Cost: this is
an unattempted formalization of unknown difficulty — the per-instance
case is tractable (`decide`-dischargeable) but the universal statement is
exactly the kind of gap this run's OB-R23-CORRESPOND obligation was
chartered to recover, not close by convention.

**Horn B — accept the r23 ordinary-tree statements as the definitions of
record.** Consequence: this run's object becomes self-standing,
decoupled from the r19 governed-RTree model. Every result in §1–§3 stands
as fully established **for the ordinary-tree object as defined in
`SEMANTIC-CONTRACT.md` §2–3**, with no residual formalization debt on
this axis. Cost, stated plainly: this does **not** resolve
`E993-R19-FIXED-GAMMA-HALL` or `E993-R19-R2-HALL-UNIVERSAL` on their own
governed-RTree terms — those rows stay exactly **OPEN**, indefinitely,
unless a separate future effort attacks them directly or later proves the
transfer anyway. It also settles, by fiat rather than proof, how the
mathematics agent should read O14 (`E993-BETA-AGG`): the r23 ordinary-tree
`S(T,p)` becomes *the* intended object for O14's purposes, not a
convention-based stand-in awaiting justification.

**This run recommends neither horn.** Both are live, both have exact and
stated costs, and the choice governs how every result in this document is
read by anything downstream. **Ashton's decision is the correct place for
it to be made**, not a route, critic, adjudicator, or synthesis seat's.

## 6. Ceiling honesty (verbatim, SOLUTION-CONTRACT §10, carried into this handoff per the RETURN-format convention)

TREE / FOREST / TRANSFER / COUNTEREXAMPLE open; candidate invariants are
mechanisms — mechanism kills are never target counterexamples; computation
is evidence, never proof; no bounded zero is evidence of anything; nothing
is ever `formally_verified`.
