# Cycle 2 Allocation — r31 (a parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank)

Controller: Claude Opus 5.5, 2026-09-28. Topology 9/18/3/1 (`AUTHORIZATION.md` §3). Routes are chartered Claude Sonnet 5, **high** effort.
Binding with `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C2-STAGE1-GATE.md` and `control/C2-WORKER-COMMON-BRIEF.md`. Source of
the portfolio: the admitted Cycle 1 synthesis `## Next-cycle portfolio` (all nine routes), updated by the Cycle 1 close
(`cycles/cycle-1/CYCLE-CLOSE.md`: three formal awards, six second reads, the controller's rulings).

**Where the target stands entering Cycle 2** (class `m ≥ 107`, `m ≡ 2 (mod 3)`, `p* = (16m+4)/3`; details in the Cycle 1 close):
- **(L-S)_top at template level: `formally_verified`** (award C1-LA1; key R-1). The composition to (HALL) on the literal network:
  `proved_informal` (SR-3; key R-2). Together with favorability and the criterion key, (H) holds at `proved_informal` modulo
  Darroch/Newton through the favorability key only.
- **(ELIG-top)(a) and (E): `computer_assisted`** (SR-4; controller ruling R31-N-8): the only non-formal, non-uniform input is the fixed
  degree-50 `S_5` certificate (blocks `j ≤ 5` pooled with the tail; with `m = 3t+2`, all 51 coefficients of the numerator are
  positive after the shift `t = 35 + u`, i.e. from `m = 107`, as recorded by SR-4, with a Sturm count). The block-descent node for `j ≥ 5` is `formally_verified` (award C1-LA3).
- **Tier 1** is assembled informally (SR-5 rules its grade; at most `computer_assisted`, modulo Darroch/Newton through favorability).
  Nothing at Tier 1 is `formally_verified`; the decisive event (a) needs the SOLUTION-CONTRACT §2 terminal formally verified.
- **Formal infrastructure:** the CB(8,m) layer and the reduction of the terminal to conjuncts 2 (descent) and 4 (saturating flow)
  (award C1-LA2, formally verified; its conjuncts 2 and 4 enter only as hypotheses).

So the run's remaining work is FORMAL: conjunct 2 (via the parent descent), conjunct 4 (via the composition), and the one remaining
Darroch/Newton dependency (favorability). Cycle 2 is weighted accordingly.

## Routes (route ID — mechanism fingerprint token; each return must contain both verbatim)

| Seat | Route ID | Mechanism token | Orientation |
|---|---|---|---|
| T1 | `C2-T-01` | `FAVORABILITY-ARM-LEAF-INTEGER-ROUTE` | T (prove) |
| T2 | `C2-T-02` | `FAVORABILITY-PRIVATE-LEAF-INTEGER-ROUTE` | T (prove) |
| T3 | `C2-T-03` | `MARK-CLONE-CRITERION-FLOW-EXPLICIT-AT-TOP-RANK` | T (prove) |
| F1 | `C2-F-01` | `ASSEMBLED-CHAIN-LITERAL-NETWORK-ADVERSARY` | F (falsify) |
| F2 | `C2-F-02` | `ELIG-AND-CERTIFICATE-RANGE-ADVERSARY` | F (falsify) |
| F3 | `C2-F-03` | `CRITERION-LOAD-AND-TYPE-PATH-ADVERSARY` | F (falsify) |
| U1 | `C2-U-01` | `FORMAL-ELIG-TOP-PARENT-DESCENT` | U (formal / structural) |
| U2 | `C2-U-02` | `FORMAL-CB-SECTOR-COMPOSITION-INSTANTIATION` | U (formal / structural) |
| U3 | `C2-U-03` | `FORMAL-CB-INDEPENDENCE-POLYNOMIAL-CLOSED-FORMS` | U (formal / structural) |

The synthesis's T1 (`TIER1-ASSEMBLED-INFORMAL-PROOF-ON-ONE-FACE`) is discharged by SR-5's assembly read; its test at fresh rows moves
to F1. Its T2 (favorability) is split by leaf class into T1 and T2 so that each gets a full route; T3 carries the synthesis's T3 with
SR-3's naming repair (the homogeneous mark-clone criterion key, never "E1-R").

### T1 — `C2-T-01 FAVORABILITY-ARM-LEAF-INTEGER-ROUTE`

Load-bearing obligation: prove `Δ_{p*}(T − v) < 0` (the arm leaf `v` is favorable at `p*`) for every class `m` WITHOUT Darroch and WITHOUT
Newton. Start from the closed form `I(CB(8,m) − v) = (1+x)G^m + x(1+2x)^{8m}` (r30's favorability key, `sources/r30/`; re-derive it) and its
block decomposition `Σ_j C(m,j) V_j + R`, `V_j = x^j(1+x)^{8j+1}(1+2x)^{8(m−j)}`, `R = x(1+2x)^{8m}`, and prove the needed coefficient
inequality at `p*` block by block with the two-binomial descent tool (G) — formally verified as a companion lemma of award C1-LA3
(`E993Transport.twoBinom_coeff_strictAnti_of_gap`; statement in the frozen award) — plus an EXPLICIT treatment of the finitely many blocks
where (G)'s gap condition fails (identify them exactly, as SR-4 did for the parent: which `j` ascend?), pooling them with descending
blocks through a certificate whose range is universal in `m` (a shifted positive-coefficient polynomial, stated and replayed exactly,
graded `computer_assisted` if it is a fixed certificate). Test at `m = 110, 113` first (exact). Deliver the proof with every gap
identity, every ℕ-subtraction, and the exact list of fixed certificates; state whether it is Darroch/Newton-free end to end.

### T2 — `C2-T-02 FAVORABILITY-PRIVATE-LEAF-INTEGER-ROUTE`

Load-bearing obligation: the same for every private leaf `c_ij`: `Δ_{p*}(T − c_ij) < 0` for every class `m`, Darroch/Newton-free.
`8m ≡ 1 (mod 3)` on the class, so the favorability key's part (ii) applies (verify); its proof uses blocks `E0_j`, `E1_j` and the PAIRED
block `(1+x)(1+2x)^{8m−1}(1+3x+x²)` (verify the identity). Replace every Newton/Darroch use by (G) plus exact finite certificates; the
paired block's quadratic factor `1+3x+x²` is not of the two-binomial form — give a direct integer argument for it (e.g. a three-term
recurrence for `(1+x)^a(1+2x)^b(1+3x+x²)` or a convolution bound), stated and proved. Transfer to every private leaf by the symmetry of
`CB(8,m)` (write it). Test at `m = 110, 113` first.

### T3 — `C2-T-03 MARK-CLONE-CRITERION-FLOW-EXPLICIT-AT-TOP-RANK`

Load-bearing obligation: state the mark-clone criterion key's deletion flow at `p*` on `CB(8,m)` as an explicit, quantified lemma a Lean
award can consume: the arc values (as functions of the source's choke states), the `ρ_q` loads on every target class, condition (i) from
Lemma A (SR-2; companion (E1i) of C1-LA3) and condition (ii) (which holds identically, SR-3 — prove it on the face), and the exact
statement "every non-sector source is saturated and every target's E1 load is at most `ρ_1·γ` on `u_i`-switch images and within capacity
elsewhere". Cite the homogeneous criterion key `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` with scope
note CD-2; never the heterogeneous key's label. Then write the statement as a Lean `def`/`theorem` skeleton over award C1-LA2's `cbGraph`
(the declarations it would need, with types), so U2 can take it as a named hypothesis. Test the explicit flow at `m = 110` exactly on the
literal network (loads per target class, both sides).

### F1 — `C2-F-01 ASSEMBLED-CHAIN-LITERAL-NETWORK-ADVERSARY`

Load-bearing obligation: attack the assembled Tier 1 chain at the FRESH rows `m = 116, 119` and one larger row (`m = 137`), with
`m = 110` (SR-3's row) as a control. Fidelity first: (WID) from independent sides, derived `F_{p*}` (every leaf favorable?), `x` through
`α`. Then load the formally verified C1-LA1 allocation (the table of record, frozen) plus the criterion flow's loads, and compute the exact
load on every target class, including the shared-capacity `u_i`-switch images and the scaling step; report the maximum load ratio and
where it occurs. Search structured source families (all choke-state classes, mixed sector/non-sector, extremal `γ`) for a deficient cut.
Deliver: confirmation at the fresh rows, or a verified cut / a template failure with the exact failing constraint.

### F2 — `C2-F-02 ELIG-AND-CERTIFICATE-RANGE-ADVERSARY`

Load-bearing obligation: attack (ELIG-top)(a)'s composition (SR-4): the side conditions `1 ≤ l_j ≤ a_j + b_j` for every `j ≤ m`; the
shift range of the degree-50 `S_5` certificate (with `m = 3t+2`, positivity from `t = 35`; `S_5` is negative at `t = 28..32` — locate the
exact sign change and explain it); the pooling (why `j ≤ 4` fails and
`j ≤ 5` works — the exact deficit); the tail sign. Re-derive the `S_5` certificate by a THIRD method (direct symbolic expansion of the pooled
coefficient difference as an exact polynomial in `m`, not interpolation), confirm its coefficients and give the smallest positive shift that
works. Also stress T1/T2's favorability route at its sharp points: which blocks ascend at `p*` for `T − v` and `T − c`, and by how much.

### F3 — `C2-F-03 CRITERION-LOAD-AND-TYPE-PATH-ADVERSARY`

Load-bearing obligation: attack the criterion flow on the literal network at fresh rows (`m = 113, 116`): the `ρ_q·w` loads on targets with
two or more chokes; condition (ii)'s type-path inequalities at `p*` (SR-3 says it holds identically — try to break that claim exactly);
Lemma A's edge cases `q = 1` and `q = m`; and the interaction with the sector at `u_i`-switch images (the ONE doubly-fed class): is
`(ρ_1 + θ)γ ≤ γ` the true binding constraint, or is there another doubly-fed class SR-3 missed? Deliver bounded confirmation or an exact
failure.

### U1 — `C2-U-01 FORMAL-ELIG-TOP-PARENT-DESCENT` (**first priority of the run**)

Load-bearing obligation: formalize (ELIG-top)(a) as an integer theorem about the closed-form polynomial, in scratch, sorry-free:
`i_{p*−1} < i_{p*−2}` where `i_k` is the coefficient of the closed form `I(CB(8,m); x) = (1+2x)G^m + x(1+x)(1+2x)^{8m}`,
`G = (1+x)^8 + x(1+2x)^8` (verify against the contract), for every class `m`. Nodes: (1) the block identity (the decomposition of
`i_{p*−1} − i_{p*−2}` into blocks `P_j` at `l_j` and the tail — a `Polynomial ℤ`/`Finset.sum` identity with the binomial weights `C(m,j)`);
(2) the degree-50 `S_5` certificate as a polynomial positivity statement in `u` after `m = 3t+2`, `t = 35 + u` (SR-4's parametrization) — prove it with `norm_num`/`ring`/
`positivity` over an explicit polynomial (no `native_decide`, no `decide` over an enumeration standing in for a universal step); (3) C1-LA3's
(BD) for `j ≥ 6` (its frozen `Main.lean` under `sources/c1-results/`; carry byte-identically); (4) the composition. Name the link to
`cbGraph` (the coefficients of `I(cbGraph m)`) as the remaining node — U3 owns it. If (2) is too large for one scratch file, split the
polynomial and say how; report compile times.

### U2 — `C2-U-02 FORMAL-CB-SECTOR-COMPOSITION-INSTANTIATION`

Load-bearing obligation: formalize the composition (SR-3's repaired statement) over award C1-LA2's `cbGraph m` in scratch, sorry-free,
with the criterion flow (T3's explicit statement; take it as a named hypothesis) and C1-LA1's per-state inequalities as inputs, concluding
terminal conjunct 4 (`∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves …) p* f`) under favorability as a hypothesis. Nodes: Lemma 0 (the
literal network's arcs at `p*` on `cbGraph`), choke-state extraction, Out, In at `K−1` as the capacity bound, the `8−γ` switch preimages,
the doubly-fed `u_i`-switch images with Residual, the target case split, and the rational-to-integral step (the formally verified companion
lemma on `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`; carry byte-identically from its r30 award). Carry C1-LA2's layer
and C1-LA1's definitions byte-identically from `sources/c1-results/`. Deliver the conditional conjunct-4 theorem or the exact blocked node.

### U3 — `C2-U-03 FORMAL-CB-INDEPENDENCE-POLYNOMIAL-CLOSED-FORMS`

Load-bearing obligation: prove in Lean, over C1-LA2's `cbGraph m`, that the number of independent sets of size `k` equals the `k`-th
coefficient of the closed form of record (and the same for `cbGraph m − v` and `cbGraph m − c_ij`, as far as reached), linking
`C5LA1.crossingIndex (cbGraph m)` (entry 0035) to the closed-form coefficients — the formal link conjunct 2 needs from U1's integer theorem.
Strategy: a tree/forest independence-polynomial recursion (deletion of a leaf and its support), or a product formula over the chokes'
branches; state which. Infrastructure (the closed forms are `proved_informal` nodes), not Tier 2 progress. Deliver compiled scratch or the
exact blocked node.

## Shared rules

1. Every route cites the Stage 2 seal, verifies the sources it uses against their digest files, and writes the gate lines of
   `control/C2-STAGE1-GATE.md`.
2. Every network instrument asserts (WID) from independent sides and derives `F_{p*}` before reporting anything about a network.
3. Darroch/Newton only on real-rooted inputs; say so at every use; a route whose object is to remove them must not use them.
4. Explicit `M_0` and remainders for every asymptotic step; finite ranges by exact certificates, named and graded.
5. Template failure ≠ cut; a cut must be eligible, exact, and independently checked.
6. New claims are `E993-R31-` candidates, PREDICATES of their statements, alias-checked lexically and mathematically against the
   run-local registry AND the frozen concurrent master (494).
