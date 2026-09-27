# Cycle 3 Neutral Synthesis

Run `erdos-993-math-dre-20260926-r30-weighted-transport` (Erdős #993; correctly weighted mixed-boundary transport for the
remaining ordinary-tree favorable-leaf aggregate). Cycle 3, Stage 6, neutral synthesis seat. Date 2026-09-26.

**Boot.** I am operating within VerityOS. For the boot I read exactly the constitution `verity.md` and the identity subsystem's
`startup-protocol.md`, and loaded no other VerityOS subsystem (memory, decisions, logs, conversations, operations, modules, skills).
The boot was completed before any synthesis text was written; the order deviation is disclosed below.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

Grades are those of `SOLUTION-CONTRACT.md` §4. "STATED" means first stated at a review stage (a critique, an adjudication or
this synthesis): it needs an isolated second read before registration. "Compiled" means kernel-checked in scratch, with no
grade until a governed award closes (ruling 23). Nothing below is decided by majority vote or by consulting a lower tier.

## Identity and seal audit

**Dispatch and capsule.**

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Dispatch `control/dispatch/c3-stage6/DISPATCH-SYNTHESIS.md` (hashed before it was read) | `c318ccea6526f671ab0c7d663dc53c8583f43a7841b6a6a9c6dc5165f85326f9` | same | match |
| **Capsule inner seal** `control/C3-STAGE6-DISPATCH-MANIFEST.json` (canonical JSON without `seal_sha256`: sort_keys, `(",", ":")`, no trailing newline) | `d1c4b43e0b0a039613de160ee807af938fff87a625d3eb1aa452c753702463d1` | same | **match** |
| The 12 capsule members (bytes and SHA-256 each) | manifest | recomputed | 12/12 match |
| `control/PATH-CHECK-c3-stage6-dispatch.json` | — | read | 11 files scanned, 0 findings |
| Stage 5 packet manifest inner seal `control/C3-STAGE5-PACKET-MANIFEST.json` | `ac35166ca9a9f0b4de7e86aa7aeeada8dd133c51728e46c1520cf8028c4648ec` | same | match; its 41 members hash-match (hash only for non-capsule members; disclosure 3) |
| `control/SOURCE-DIGESTS.json` (981 entries) | per entry | recomputed over `sources/` | 981/981 match, 0 missing |
| The three Stage 7 carry directories under `sources/` (not in the root digest record by design, lesson R29-I-1) | their own `SOURCE-DIGESTS.json` | recomputed | `c1-stage7-sources` 11/11, `c2-stage7-sources` 6/6, `c3-stage7-sources` 10/10 match |
| Carry file `sources/c3-stage7-sources/U1-Main.lean` | `f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180` | same | match (the U adjudicator's rebuild input) |

**The three adjudications (capsule members; digests above).** All three report the same Stage 2 / 3 / 4 packet seals
(`5df4c603…52752416`, 1,051 files; `64c6c84a…5b294797`, 35 files; `25f6f51a…d495`, 53 files), their own capsule seals
(T `da60346e…5edd`, F `cf249ea3…cb8`, U `ce435045…ce58`), 6/6 Stage 3 and 12/12 Stage 4 admissions with 0 findings, and runtime
`claude-opus-5-5[1m]` (chartered opus/high). Every route reports `claude-sonnet-5` and every critic `claude-opus-5-5[1m]`
(CF6-4, CF6-P3). Each adjudication records the headline as unresolved, status `still_open`, material progress yes and no
orientation plateau.
The controller's Stage 6 facts (CF6-A1, CF6-A2) agree with the three faces on every flag and count I checked.

**Protocol residues (recorded; none is load-bearing).**
1. `C3-SYNTHESIS-PROTOCOL.md` duty 4 proposes "`C3-LA1` (WID)". (WID) has been `formally_verified` since Cycle 1 (C1-LA1).
   The label is template residue; `C3-LA1` is reassigned below to the one contract-ready group.
2. The protocol's continuation clause says a positive continuation flag means "Cycle 3 runs". I read it as Cycle 4.
3. The protocol says the stop gate is armed "since the Cycle 1 close (C2 gate ruling 20)"; `SOLUTION-CONTRACT.md` §5 says
   "from the Cycle 2 close". Under either reading it is armed now.
4. **Registrar numbering collision (new; proposed erratum, the controller assigns its id).** In the carry file, C1-LA1's
   registrar entries 22–36 and C2-LA1's entries 22–36 share numbers (for example, C1-LA1 entry 36 is `theorem
   activeWeightAggregateIdentity` and C2-LA1 entry 36 is `lemma support_map_aut`). A Stage 7 registrar must key every carried
   fragment by (origin award, entry number, fragment digest), never by number alone.

**My read-boundary disclosures.**
1. The host injected the project `CLAUDE.md` and the user auto-memory index into context at session start. I did not open
   either; nothing below relies on them.
2. **Order.** As the wrapper directed, I hashed and read the dispatch before booting. My first boot command aborted at a
   shell separator (a zsh `=`-expansion error), so `startup-protocol.md` was not displayed then and `verity.md` was
   displayed with a truncated middle. I read the protocol and the capsule next, then completed the boot (both files read in
   full) before writing anything. No conclusion here depends on the order.
3. **Hash-only opens.** Verifying the Stage 5 packet manifest's members opened, for hashing only, files that are not capsule
   members (the Stage 5 dispatches, adjudicator capsule manifests and path checks, admissions, agents record, per-orientation
   controller facts, lint and path checks, the Stage 2 path-literal record, the Stage 4 manifest, the adjudicator protocol,
   `control/r30_tool.py`). No content was displayed.
4. **Searches within the grant.** One recursive walk rooted at `sources/` (file names, for the unlisted-file check); one
   recursive `grep` rooted at `sources/` for the C1-LA1 / C2-LA1 digest strings (it found C1-LA1's full value only). Single-file
   `grep`/`sed`/`awk`/`cat` on `sources/c3-stage7-sources/U1-Main.lean`, `C-U1-T-CritAdv.lean`, `C-U1-T-CritAx.lean`,
   `C-U1-T-CritInst.lean`, `C-U1-F-CriticQuot.lean` and that directory's digest record. Non-recursive `ls` of `sources/` and of the
   three Stage 7 carry directories.
5. **Above the grant.** One non-recursive `ls` of `cycles/cycle-3/` (names only: `stage2`…`stage7`), to confirm the output
   directory.
6. Not read: raw returns, critiques, seat or critic scratch, the controller replay files `control/controller-facts/*`, the
   Stage 3 disclosures addendum, either claim registry (so the registered texts of (INV), (NM), the refuted keys and the
   Cycle 2 reductions (R-i)/(R-ii) were not read by me), any `runs/` or `second-reads/` file, other experiment roots, the network.
7. No installs, no Lean, no background job. Python ran as `python3 -B`, standard library, exact integers, in my scratch only.

## Reconciliation

Each item gives the claims, the ruling and its basis. Adjudicator labels are prefixed by orientation (T-B1, F-E2, …); unprefixed
labels (A1…, B1…, D1…, E-a…) are this synthesis's, defined under `## Exact established results`; the lemma names E1 and
E3–E6 and GK-SIGN keep the adjudicators' names. Replays outrank self-reports; a critic-attributed advance is weighed on
its evidence, not on its seat.

**R1. Where the open part of (HALL) sits at the three `CB(8,·)` rows.**
- T: after D1 (T-B1: non-sector families, deletion arcs, all 177 eligible ranks) and D2 (T-B2: full (HALL) at 174 ranks), the open part is
  (HALL-COND) at the first ranks `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492` for every family meeting both `sec` and the
  positive-weight V sources (`v ∈ B`, `r ∉ B`, `w_F(B) > 0`), composed from D1, the Cycle 2 sector Hall and the repaired (R-ii).
- F: families mixing `sec`, positive-weight V and positive-weight S/O (the Cycle 2 standing-state wording).
- U: "Hall on the choke forest `T′` at `CB(8,86)/460`" (the allocation's wording, carried forward unchanged).
- **Ruling.** U's wording is superseded by D1, which settles every family off the sector, including the choke forest, at
  all 177 ranks (at `computer_assisted`, pending SR-C3-4). Between T and F, T's class is the superset: it also contains the
  families `sec ∪ V⁺` with no positive-weight S/O member. Whether those are settled depends on the Cycle 2 reduction (R-i),
  whose registered text neither T, F nor I read. **I adopt T's formulation as the conservative statement of record.** If
  (R-i) settles the S/O-free subcase, the open part narrows to F's formulation; the SR-C3-4 reader checks this against (R-i).
  Both adjudicators agree that only the first ranks remain open on those rows.

**R2. Switch necessity at eligible rows.**
- U: "no eligible switch-necessary row below `CB(8,86)/460` is known".
- F (F-E2; here E-a): the non-uniform choke tree `G(8^82, 7^2)` (order 1427; 82 chokes with 8 supports, 2 with 7) is deletion-deficient
  on its root-plus-arm sector at the eligible rank `p = 448`, ratio exactly `448/447`; with (S) the switch image weighs
  13.107× the sector supply, so it is not a cut. Two instruments now agree (C-F1-U; the F adjudicator's forest-DP
  `sector.py`), and the controller's replay CF-REPLAY-c3e reproduces `n 1427, α 755, x 446`, window `[448, 503]`, `448/447`.
- **Ruling: F.** U's capsule did not contain F's evidence; this is staleness, not a conflict of evidence. The standing-state
  sentence "switch arcs have never been load-bearing on any computed tree row" is replaced by: *deletion-only Hall fails at
  eligible ranks on `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, `CB(8,108)/577`, `CB(7,144)/673` (sector) and
  `G(8^82, 7^2)/448`; whole-tree saturation that needs switch arcs has been exhibited only at non-eligible ranks (the order-8
  tree at `p = 3`, `CB(4,1)/4`); at no eligible row has saturation with switch arcs been proved where deletion alone fails.*

**R3. Where sector-deficient rows sit (a synthesis-stated narrowing).**
- F states that every sector-deficient row found sits at the boundary `3p = 2M + 4`, where the whole-sector supply to
  deletion image is `p/(p − 1)`.
- From the (NM) double count (T-E2: `K = p − 1` down, `2(M − K + 1)` up, `M = dm` on `CB(d,m)`), the ratio is
  `2(M − p + 2)/(p − 1)`, deficient iff `3p < 2M + 5` (CF6-F5's criterion). My arithmetic (`syn_checks.py`): `460/459`,
  `476/475`, `492/491`, `448/447` at `3p = 2M + 4`, but `CB(8,108)/577` gives `289/288` and `CB(7,144)/673` gives `337/336`, both
  at `3p = 2M + 3`.
- **Ruling.** F's pattern is narrowed to the rows F examined. T's two (O3) first ranks are sector-deletion-deficient at
  `3p = 2M + 3`; they are switch-necessary rows too. STATED (this synthesis); arithmetic only; SR-C3-6.

**R4. Two-instrument standing of D1/D2 (CF6-T4).** T answers it: A2 (C-T1-F) and A-6 (C-T1-U) use one reduction (per-active-tag
cloning with choke-preserving deletions; the `P_q` correspondence) and two different certifying criteria (C-T1-F's explicit
type-path transport; C-T1-U's normalized matching of blocks through the uncarried product theorem). The finite verification is
replicated by two independent codes on one criterion, with identical exact fractions (C-T1-F; T adjudicator). **Ruling.** The
two-instrument rule governs cuts; for this positive record the reduction E1 is a single logical point, so SR-C3-3 (E1) is
load-bearing for D1–D3, whose registration grade is `computer_assisted` with E1 as its weakest input.

**R5. Two-instrument standing of E-a (F-E2; CF6-F4).** As shipped, the deficit was one formula evaluated once (the frozen checker
fixed only `α`, `x` and favorability). The F adjudicator supplied a genuinely independent second instrument (sector counts
from the forest DP of `T − N[r] − N[v]`, structure brute-forced with literal (D) ∪ (S) on 7 small trees, 36 checks). **Ruling:
two instruments, plus the controller's replay.** It is a bounded record, not a cut, and not a proved minimum.

**R6. The two `G_k` sign proofs (CF6-F2).** The F adjudicator checked both line by line: C-F2-U's exact identity
`S(G_k, k+3) = −g(k+1) − 2^k − (k+2)A(k)` with the bound `≤ −(3^k + 2^k + (k+2)(2^k + 3^{k−1}))`, and C-F2-T's weaker
`≤ −2 − 2^{k+1}` (Newton/Darroch). The first implies the second for every `k ≥ 1`: strength, not conflict. My own literal
instrument (brute-force independent sets; `F_p` derived leaf by leaf; `S` from the `H_v`/`R_v` definition; WID from literal
weights) reproduces the identity, both bounds, `F_{k+3} =` all leaves, `α = 2k + 3`, and the controller rows `253/527/−274`,
`1542/2735/−1193`, `8875/14196/−5321` at `k = 3, 4, 5`, and `S = −16, −65` at `k = 1, 2`. **Ruling: GK-SIGN correct at the
statement level; STATED; SR-C3-2.** Prefer C-F2-U's elementary proof (no real-rootedness) for any later formalization.

**R7. (INV)'s quotient clause.** U1 claimed a remaining gap; both U1 critics closed it (`cov = supply ∘ covered` by `rfl`) and
compiled the quotient iff independently (C-U1-F `weightedHall_iff_quotientHall`; C-U1-T
`crit_weightedHall_iff_orbitQuotientHall`); the U adjudicator rebuilt both and proved in Lean that the two statements are the
same proposition (`adj_two_quotient_forms_agree`, axioms clean). **Ruling: no disagreement; contract-ready (C3-LA1), subject to
the binder diff against the registered text (SR-C3-1).** I read both statements from the frozen carry files; they match the
adjudicator's quotation.

**R8. C-F1-T's class-union Hall (F-E3; here E-b).** Qualified by F to full `(τ,q)` classes (the reach set includes weight-0 members);
F's 73-row positive-part check found no difference. **Ruling: stands as a full-class bounded record.** It does not bear on D1,
which covers every non-sector family, invariant or not.

**R9. G3's repair (T2-e).** C-T2-U (`|N[Q]| ≥ 3`) and C-T2-F (`|N[Q]| ≥ 4`) are both valid; T adopts the weaker hypothesis. The
vacuity dispute is resolved for C-T2-F on replay (`R*` empty at every eligible rank on every tested `t_min ≥ 2` row).
**Ruling: accepted as adjudicated.**

**R10. "Deletion arcs alone" statements across orientations.** D2 and D3 (174 + 166 CB instances) and E-c (F-E4: `G_3..G_8`,
`T(4..9,2)`) are finite rows; U's order-8 and `CB(4,1)/4` rows show deletion-only failure below the window. None is universal,
and none revives `E993-R23-LITERAL-DELETE-ONLY-HALL` (active weight, fixed selector, rank-specific scope, sector deficits on
their face). U records a conjecture from C-U2-F: on trees, `S(T,p) ≤ 0` implies a saturating flow at every rank (through
order 15, no counterexample). **Ruling: conjecture grade, a falsification target for F; never evidence.** If true, it would make
(HALL) on trees equivalent to the primary aggregate at eligible ranks, which bears on the controller checkpoint (below).

**R11. P10 and Lemma U.** F upholds C-F2-T's strike: P10 is not among the 443 run-local keys. U cannot verify U1's quotation that
SR-C2-4 ruled Lemma U an alias of P10. **Ruling:** P10 is an unregistered item; Lemma U certifies no registered key; the alias
claim carries no weight until a second read settles it.

**R12. Grade vocabulary.** "bounded_evidence" (T1-e) and "proved" (F1's WLOG lemma) are verdict terms, not §4 grades; read as
`bounded_computation` and `proved_informal` respectively where the evidence supports it (F1's WLOG is in any case subsumed by
C2-LA1).

No disagreement was resolved by consulting a lower tier. Where an adjudicator lacked another orientation's evidence (R1, R2),
the ruling rests on the evidence itself.

## Exact established results

Fidelity basis for every row below (checked by at least one adjudicator's own instrument): literal `w_F` (active tags,
`W_v = N(s_v) ∖ {v}`); (D), or (D) ∪ (S) where stated; `F = F_p(T)` derived at the original rank (all leaves on every row
quoted); `x` through rank `α`; `supply − capacity = S` from independent sides; nonempty eligibility for every row called
eligible. Counts are labelled.

**A. Compiled in scratch (no grade until a governed award; axioms exactly `propext`, `Classical.choice`, `Quot.sound`; rebuilt by
the U adjudicator).**

| # | Declaration(s) | Scope | Attribution |
|---|---|---|---|
| A1 | (INV) quotient clause: `crit_weightedHall_iff_orbitQuotientHall` (C-U1-T), equivalent in Lean to `weightedHall_iff_quotientHall` (C-U1-F) | any finite simple graph, any `p`, `Γ = Aut(G)`, `F = favorableLeaves G p`; orbit-total supplies; orbit arc iff some member pair is joined | C-U1-T, C-U1-F (critic-derived); U1 orbit block; C2-LA1 apparatus |
| A2 | Lemma U `exists_transportRel_iff`: `A` has an in-arc iff `A` is not maximal, or some `u ∈ A` has non-adjacent `y ≠ z` with `N(y) ∩ A = N(z) ∩ A = {u}` | any finite simple graph | U1 |
| A3 | U1 orbit block (`orbitOf`, `mem_orbitOf_self`, `orbitOf_subset_of_mem_invariant`, `invariant_iff_orbitOf_subset`, `covered_orbitUnion`, `supply_orbitOf`) | any finite simple graph, full `Aut(G)` | U1 |
| A4 | (NM) poset half: `down_card`, `up_card`, `rk_of_Rdel`, `shadow_degree_bound` on `Fin N → Option Bool`; ratio form `critic_normalized_matching` | abstract poset only | C-U1-T; C-U1-F |

**B. `proved_informal` (STATED where marked; each STATED item needs its isolated second read).**

| # | Statement | Hypotheses consumed | Grade | Attribution |
|---|---|---|---|---|
| B1 | **E1, mark-clone reduction.** On `CB(d,m)` with `F ⊇` all private leaves, if at rank `p` and every `q ∈ [1, m]` the ratio `ρ_q ≤ 1` and the type-path inequalities hold, then a fractional flow saturates every `r`-free source with target load `ρ_q·w_F(A)`; hence (HALL-COND) for every `X ⊆ I_{p+1} ∖ sec`, deletion arcs only | literal CB tree (`IsTree` checked); finiteness; no eligibility, no invariance | `proved_informal`, STATED | C-T1-F (A1); C-T1-U (TL) concordant; T adjudicator checked by hand |
| B2 | **E4, collapse.** A positive sector deletion deficit requires `Q = {r, v}` with a pendant `P_3` arm (`N(s) = {r, v}`), `β = 1`, `K = 2` | (A4), (H-attach), `M ≥ 1`, `T ≠ K_2, P_3` | `proved_informal`, STATED | C-T2-F (CD-1), C-T2-U (L1), jointly |
| B3 | E3, G1 self-covering reduction (Proposition 2; the `φ` identity; restriction to `R*`), with `P ⊆ F`, (A4), (H-attach) on its face | as stated; `|Q| ≥ 2` | `proved_informal` (narrowed by B2) | T2 |
| B4 | E5, G3 as repaired (`t_min ≥ 2` ⇒ no deletion-deficient sector subfamily at any eligible `p`) — content empty on every tested row | B3, B2, (LB) `E993-R27-FOREST-DESCENT-LINEAR-BOUND` at its registered statement | `proved_informal` (repair C-T2-U form); record only | T2; repair critic-attributed |
| B5 | E6, CD-3: the per-choke good (switch-dead) state poset has no dead end below the top, every `d` | definition of `X''` | `proved_informal`, STATED | C-T2-F |
| B6 | **GK-SIGN.** For every `k ≥ 1`, on `G_k` (root 0; leaf 1 on 0; support 2 on 0 with leaves 3, 4; `k` arms `0–a_i–b_i–c_i`; `n = 3k + 5`), with `P = 1 + 3y + y²`, `g(N) = [y^{N+1}]P^N − [y^{N+2}]P^N`, `A(k) = [y^k]P^k − [y^{k+2}]P^k`: (i) `F_{k+3}(G_k)` is the whole leaf set; (ii) every per-leaf summand is strictly negative; (iii) `S(G_k, k+3) = −g(k+1) − 2^k − (k+2)A(k) ≤ −(3^k + 2^k + (k+2)(2^k + 3^{k−1})) < −2` | the literal graph; deletions on the original carrier; `p = k + 3`; no census value | `proved_informal`, STATED | C-F2-U (exact identity, Lemma M); C-F2-T (independent bound; first proof that 3, 4 ∈ F); F adjudicator verified; F2's recurrence and `H_1`, `R_1` lemmas as components |
| B7 | Verification lemma: a rational saturating flow implies (HALL-COND) for every `X` | finite network | `proved_informal`, STATED (companion; no key) | C-U2-F, C-U2-T |
| B8 | `CB(1,m)`: every (S)-target of a root-plus-arm source has active weight 0, for any tag set | `CB(1,m)` | `proved_informal`, STATED | C-U2-T |
| B9 | `CB(d,1)` whole-sector sums at `p = k + 1`: `2^k·C(d,k)` against `C(d,k−1)(2^{k−1} + k − 1)` | `F_p` = all leaves | `proved_informal`, STATED | C-U2-T |
| B10 | F2 companions: `T(m,k)` block recurrence and assembly; `H_1 = (1+3y+y²)^{k+1}`, `R_1 = (1+y)²(1+2y)^k`; `Δ_{k+2}(R_1) = −2^k`; `Δ_{k+2}(H_1) < 0` | as stated | `proved_informal` (companions; no key) | F2 |
| B11 | T1's choke-forest weight model (`w_F` on `r`-free sources = present private leaves whose choke is present; sector weight 1; R0 weight 0) | CB tree | `proved_informal` (elementary) | T1 |
| B12 | `W(x)` closed form for `CB(d,m)` layer weights with `F` = the leaf set | row use needs `F_p` derived at that row | Tier-3 record, not a key | U2; both U2 critics |

**C. `conditional`.** C1 (CD-2 = L2): the exact heterogeneous sector deletion deficit `max(0, e_{p−1}(q) − e_{p−2}(q))`,
`q_i = t_i + 1`, in the live class with `P ⊆ F`. Condition: normalized matching between consecutive ranks of the product of
claws `C_{q_1} × … × C_{q_M}` (Harper; Hsieh–Kleitman — cited from memory, not a run source; one shared undischarged dependency,
not two proofs). Smallest unproved lemma: for every `X` in layer `k`, `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)`. Corroborated on 27 exact
matching layers (T adjudicator), 81 abstract rows (C-T2-F), 21 tree rows (C-T2-U). C-T2-F / C-T2-U.

**D. `computer_assisted` (restricted scope; separate key if registered; STATED; (HALL) stays OPEN).**

| # | Record | Relation | Attribution |
|---|---|---|---|
| D1 | (HALL-COND) for every `X ⊆ I_{p+1} ∖ sec` at all 177 eligible ranks of `CB(8,86)`, `CB(8,89)`, `CB(8,92)`; worst `ρ` at `q = 1`, first rank: `460421124882845/462938713343604` (0.99456), `1698319298589907/1707291739633300` (0.99474), `4838946572060835/4863675235331932` (0.99492) | (D) only | C-T1-F (A2); T adjudicator's independent code; C-T1-U corroborating (conditional on the product theorem) |
| D2 | **Full (HALL)** at `CB(8,86)`, `p ∈ [461, 516]`; `CB(8,89)`, `p ∈ [477, 534]`; `CB(8,92)`, `p ∈ [493, 552]` — 174 `(T, p)` instances (D1 plus the (NM) sector flow, whose targets are disjoint from D1's) | (D) only | C-T1-F (A3); T adjudicator replicated |
| D3 | Full (HALL) at `CB(8,108)`, `p ∈ [578, 648]`, and `CB(7,144)`, `p ∈ [674, 768]` — 166 instances | (D) only | **T adjudicator-derived** |

**E. `bounded_computation` (records; attained horizons as stated).**
- E-a. `G(8^82, 7^2)/448`: sector deletion-deficient, `448/447`; switch image 13.107× sector supply; `p = 448` the only eligible
  rank with `3p < 2M + 5`; mixed-network saturation there OPEN (C-F1-U; F adjudicator; controller).
- E-b. Weighted Hall for every union of **full** `(τ,q)` classes under (D) ∪ (S) at the three `CB(8,·)` first ranks; the whole
  layer is the tightest union; sector deletion-image/supply `(p − 1)/p`, with (S) ratio 14.32 / 14.79 / 15.25 (C-F1-T;
  F adjudicator's byte-identical replay and 73-row positive-part check).
- E-c. Mixed and deletion-only saturating flows on `G_3..G_8` and `T(4..9,2)` at their eligible ranks; each mixed network has
  exactly one positive-weight target with no in-arc, of weight 2 (C-F2-T, C-F2-U; F adjudicator; controller `k = 3..7`).
- E-d. `T(m,2)`: `α = 2m + 1`; `x ≤ m` and `Δ_m(T(m,2)) < 0` for `m = 3..1500` (sufficient direction only); `Δ_{m+2}(T(m,1)) < 0`
  for `m = 2..1500`; `I(T(m,2))` not real-rooted at the checked `m` (Darroch/Newton route closed) (F2; both critics; F adjudicator).
- E-e. Five CB rows' fidelity data: `n`, `α`, `x`, windows, `F_p` = all leaves, WID, `S < 0` at every eligible rank; F1's three
  first-rank rows (`CB(8,86)/460`: `n 1465, α 775, x 458`, `|F| 689`; `CB(8,89)/476`: `1516, 802, 474`, `713`; `CB(8,92)/492`:
  `1567, 829, 490`, `737`; capacity/supply − 1 = 0.012421…, 0.012240…, 0.012071…; supply digits 330/342/353, `S` digits
  328/340/351) and the `q`-class supply shares (argmax `q = 4`) — three independent instruments (C-F1-T, C-F1-U, F adjudicator;
  the `CB(8,92)/492` `S` also equals the frozen integer on U's instrument).
- E-f. Non-eligible switch records: order-8 tree (edges 0–1, 1–2, 2–3, 2–6, 2–7, 3–4, 3–5) at `p = 3`: 29 / 32 / −3, mixed 29,
  deletion-only 27; `CB(4,1)/4`: 60 / 60 / 0, deletion-only 52, mixed 60 (C-U2-F; U and F adjudicators; controller). (D) ∪ (S)
  sector deficits at `CB(3,1)/3` (12 vs 9), `CB(5,1)/4` (80 vs 60), `CB(6,1)/5` (240 vs 220); `CB(2,2)/4` whole layer 148 > 116
  (`S = +32`); four `t ≥ 2` sector deletion deficits at non-eligible ranks (`CBstar(1,1,2)/2`, `(1,2,2)/3`, `(2,1,2)/3`,
  `(1,1,3)/2`). C-U2-F's 1,292-row census through order 15 stands single-instrument.
- E-g. Eligible `CBstar(2,2,2)/7`: 2194 / 3888 / −1694, deletion-only flow saturates (critic-derived row data; U replayed).
- E-h. Synthesis checks (`syn_checks.py`): R3's six sector ratios; R6's GK-SIGN rows `k = 1..5`.

**F. Conjecture (no grade above `conjecture`).** C-U2-F: on trees, `S(T,p) ≤ 0` implies a saturating flow at every rank `p`.

**Imported results used at their grades.** (WID) C1-LA1 and Hall ⇒ `S ≤ 0` C1-LA2 (`formally_verified`); C2-LA1
(`formally_verified`, existential); (NM), the `CBstar` deficit key, the `G_k` key (`proved_informal`); (LB) (`formally_verified`);
the repaired (R-ii) and the Cycle 2 sector Hall at the three rows (`computer_assisted`).

## Refuted or narrowed mechanisms

**Refuted as claims (never cite as evidence).**
- T1: "the middle `t`-range needs switch arcs or a joint argument" — refuted as a network claim by joint deletion (B1/D1).
- T1: "capacity may be double-claimed across covered strata" — unfounded (covered-strata certificates are target-disjoint).
- T2: the Corollary's general formula off `c = β = 1` (counterexample: formula 96, true deficit 0); G3's algebra as written;
  "fully closed for any `|Q|`, `β`, `K`"; "real margin at the scale that matters"; the G3 end-to-end row at the non-eligible
  `p = 9` (replaced by the eligible `p = 10` row: 404 sector members, supply 3368, deletion deficit 0, WID `74154 − 127390 =
  −53236 = S`); the WID sentence; the dead-end certification (replaced by CD-3).
- U1: the "remaining gap" and "harder capacity-side analogue" in (INV); the nine/six axiom count (ten/seven); the replay
  literal (`AxCheck.lean` not shipped).
- U2: the `CBstar(2,2,2)` "corroboration" and `deletion_only_Hall_holds` (a whole-sector inequality is not (HALL-COND)); the
  paraphrase "`t ≥ 2`: never deletion-deficient at any rank" (false at non-eligible ranks); "smallest" `CB(2,2)/4` (`CB(4,1)/4` is
  smaller) and every "first" literal; hand-typed digit counts; the unshipped `dm ≤ 16` sweep.
- F1: "Cycle 2 established whole-network saturation" at the three rows (it was sector Hall only); the unbacked validation
  literals; "new finding" status of the global totals (the whole-layer margin is the known sign of `S`, since
  `N(I_{p+1}) = I_p` on `CB(d,m)`).
- F2: the non-falsifiable `S` on `G_6`, `G_7`, `T(7,2)`, `T(8,2)` (values survive on independent instruments); "DIRECTLY
  verified" deletion-only saturation (mixed flows only; the fact is true on replay); P10 as a registered key; C1's `T(m,2)`
  "EQUIVALENT" sentence; the digit and ratio slips.

**Narrowed.**
- The standing-state sentence on switch arcs (R2). F's `3p = 2M + 4` pattern (R3).
- T2's "arbitrary tree, arbitrary `Q`" to the heterogeneous CB pattern (B2); G2 to a generic unused LYM; G2b one-directional.
- C-F1-T's class-union result to full classes (R8). C-F1-U's "two instruments" (single as shipped; two now) (R5).
- `regular_bipartite_shadow_bound` to a restatement of Mathlib's `Finset.card_mul_le_card_mul`.
- `W(x)` and U2's Candidate 2 to Tier-3 records.
- F2's `Δ_m(T(m,2)) < 0` from "equivalent" to sufficient.

**Rejected as new keys.** T1's `…-TERNARY-LEG-LATTICE-SHADOW-THRESHOLD` (an alias of (NM)), `…-CHOKE-IN-BLOCK-RANK-WEIGHTED-LYM-THRESHOLD`
(classical LYM), `…-CHOKE-FOREST-SAFE-STRATUM-DELETION-HALL` (superseded by D1); F1's WLOG lemma (subsumed by C2-LA1); Lemma U as a
key of its own (R11).

**Routes closed.** The Darroch/Newton mode–mean route to the `T(m,2)` premises (non-real-rooted). Equitable quotients at `d ≥ 2`
(Cycle 2) and orbit enumeration at the `CB(8,·)` rows (≈ 3·10^37 orbits per layer): the now-sound quotient (A1) supplies no
feasibility there.

**No registered refuted mechanism is revived.** Every deletion-only statement is scoped to named `(T, p)` or families with the
sector deficit on its face (not `E993-R23-LITERAL-DELETE-ONLY-HALL`). E1 is a fractional clone transport with load
`ρ_q·w_F(A) ≤ w_F(A)`: not an injection, not a per-leaf unit map, not an own-support rule, and it never handles the arm tag `v`.
The SR-C3-3 reader checks E1 against the registered texts of `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` and
`E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT` (outside every Cycle 3 capsule). A1 is an equivalence of Hall conditions for the full
`Aut(G)`, not `…-FIXED-GAMMA-HALL`, and it does not treat (LIFT) as feasibility. GK-SIGN is a direct calculation, not an
injection or domination mechanism. No instrument counts `|F ∩ B|` or `1 + #private`, re-selects `F`, or recomputes a
neighbourhood in a deleted graph; the wrong-weight `493/491` does not recur.

## Headline verdicts

**(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: still open.** No proof at full scope and no deficient cut at any eligible
row. It holds, at `computer_assisted` restricted scope, at 174 `(T, p)` instances (D2) and 166 more (D3, adjudicator-derived),
all STATED. **Smallest unproved lemma:** (HALL-COND) at `CB(8,86)/460` (likewise `CB(8,89)/476`, `CB(8,92)/492`), with
`F = F_p` derived, for every `X ⊆ I_{p+1}` meeting both `sec` and the positive-weight V sources (by C2-LA1, it suffices to treat
`Aut`-invariant all-positive-weight such `X`). Beyond it: sector Hall under (D) ∪ (S) at `CB(8,108)/577`, `CB(7,144)/673` and
`G(8^82, 7^2)/448`, and every tree outside the CB pattern. **Scope notes the controller should add** (after their second
reads): R1's open part; R2's replacement sentence with E-a; R3's rows; the conjecture (F) as a conjecture only; D1–D3 by pointer
to their key.

**(WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: `formally_verified` (C1-LA1), unchanged.** Asserted numerically as a
fidelity check on every row above; no contribution.

**Outcome-B lemmas proved this cycle:** E1 (B1; a deletion-transport reduction on the CB family, nearest the (NMP) template), E4 (B2),
G1 (B3), CD-3 (B5), the verification lemma (B7), B8, B9 — all `proved_informal`, STATED except B3. (INV)'s quotient half is
compiled (A1). **Conditional:** CD-2 (C1). **Refuted:** none of the templates; the refuted claims are listed above. No (BUD) or
(REC) statement was attempted. GK-SIGN (B6) is a family sign theorem, not an outcome-B template.

**(CUT) record: none.** Every deficit found is at a non-eligible rank (E-f), or is a deletion-only deficit that the switch image
covers many times over (E-a, E-b). The adversarial horizons attained: full-class `(τ,q)` unions at the three first ranks; the whole
sector at order 1427; full mixed networks on `G_3..G_8`, `T(4..9,2)`, `CBstar(2,2,2)/7`.

**`CB(8, 92)` record (`R30-CB-RECORD`).** Unchanged and extended: `n 1567`, `α 829`, `x 490`, window `[492, 552]`, `F_492` = all 737
leaves (derived leaf by leaf), sector weight one, sector ratio `492/491` (deletion image/supply `491/492`), switch-image ratio
15.25, `S` equal to the frozen integer on three instruments; full (HALL) with deletion arcs at `p ∈ [493, 552]` (D2, STATED);
open only at `p = 492`, on the families of R1.

**Primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`: OPEN, no status transfer.** A governed award of (HALL)
at full scope would imply it by the certificate chain (HALL) → C1-LA2 (`E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`,
`formally_verified`, which uses (WID)), registered then as a scope note with its own certificate. No restricted (HALL) instance
here changes it. **Scope note (after SR-C3-2):** GK-SIGN gives `S(G_k, k+3) < −2` for every `k ≥ 1`; new sign content only for
`k ≥ 4` (`k = 3` has `n = 2p + 2`, the closed band); rank `k + 3` only — `α(G_k) = 2k + 3`, so for `k ≥ 6` the window's top `⌊(4k+6)/3⌋` exceeds `k + 3` and
the window has further ranks that GK-SIGN does not cover; a family fact, not a status change.

**`E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, `E993-BETA-AGG`, TREE, FOREST, TRANSFER: untouched.** No ordinary-tree result here
is a governed-model (RTree) result (`E993-G1-ORDINARY-RTREE-TRANSPORT` OPEN). **Erdős #993: unchanged by construction** — nothing
in this run can change it except through the fenced chain of keys, and no key in that chain changed status.

**Fidelity corrections this cycle made to predecessor records.**
1. Cycle 2 standing state: "switch arcs have NEVER been load-bearing on any computed tree row" — replaced (R2).
2. Stage 1 gate's open question "whether any tree of order 20–1464 is switch-necessary" — answered yes (order 1427; not a proved
   minimum).
3. The registered `CBstar` key's paraphrase "never deletion-deficient at any rank" — false; the key holds at eligible ranks as
   registered (U2 critics; U adjudicator; controller replay part b).
4. F1's statement that Cycle 2 established whole-network saturation at the three rows — struck (sector Hall only).
5. P10 is not a registered key (F2's citation struck).
6. U1's description of the carry — C2-LA1 carries C1-LA1 entries 1–21 plus entry 24 (as its entry 31) only.
7. The Stage 3 read-boundary disclosures record for U2 and F2 (controller addendum filed; the returns are the verbatim record).
8. Erratum R30-E-e (the clone's rewrite of the frozen first-interior path) — already recorded.
9. The registrar numbering collision (identity audit, residue 4) — proposed erratum.

## Lean awards

Only groups whose informal DAG is closed and whose every node is compiled at the exact scope are funded. One group qualifies.

### C3-LA1 — (INV), orbit-quotient clause: FUNDED

- **Key.** `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` (registered `proved_informal`; its quotient clause not kernel-checked
  entering Cycle 3). Grade on close: `formally_verified` **at the scope below**, if SR-C3-1 finds the registered statement no wider
  than it; otherwise the award registers as a SEPARATE key `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR`
  (`formally_verified`), and (INV) stays `proved_informal` with a scope note pointing to it. The expected statement is frozen
  here and is not widened during Stage 7.
- **Exact statement (terminal theorem; the only `theorem` in the award).** In `namespace E993Transport`, with
  `open SimpleGraph`, `open scoped Classical`, `variable {V : Type*} [Fintype V] [DecidableEq V]`:

  ```lean
  theorem weightedHall_iff_autOrbitQuotientHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) :
      WeightedHall G (favorableLeaves G p) p ↔
        ∀ 𝒮 ⊆ (indepFamily G (p + 1)).image (orbitOf G (p + 1)),
          ∑ O ∈ 𝒮, supply G (favorableLeaves G p) O ≤
            ∑ O' ∈ ((indepFamily G p).image (orbitOf G p)).filter
                (fun O' => ∃ O ∈ 𝒮, ∃ B ∈ O, ∃ A ∈ O', transportRel G B A),
              supply G (favorableLeaves G p) O'
  ```

  This is C-U1-T's `crit_weightedHall_iff_orbitQuotientHall` (frozen `sources/c3-stage7-sources/C-U1-T-CritAdv.lean`,
  `8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b`) with the name changed and nothing else; the name change is
  recorded. C-U1-F's named form (`orbits`, `orbitArc`, `QuotientHall`; `63814f60…7935`) is the equivalent alternative and is NOT
  used; freezing the inline form adds exactly one new definition (`orbitOf`) beyond the carried vocabulary.
- **Hypotheses.** Only the typeclass binders shown. No `IsTree`, no eligibility, no `p ≥ 1`. `Γ` = all of `G ≃g G`; tag set
  `favorableLeaves G p` (Aut-invariant unconditionally, C2-LA1 entry 41). `supply` is C2-LA1 entry 25 (orbit totals);
  `orbitOf G j B` is the layer-`j` members that are images of `B` under some automorphism (U1; no `Fintype (G ≃g G)` is needed).
- **DAG (closed; every node compiled sorry-free on the U adjudicator's rebuild).** `WeightedHall` ⇔ Hall on `Aut`-invariant
  families (C2-LA1 entry 76, `weightedHall_iff_invariant`) → invariant ⇔ union of orbits (`invariant_iff_orbitOf_subset`) →
  orbits partition the layer (`crit_orbitOf_eq_of_mem`, `crit_orbits_pairwiseDisjoint`) → supply of an orbit union = sum of orbit
  totals (`crit_supply_eq_sum_orbits`, `crit_sum_biUnion_orbits`) → the covered set of an invariant family is a union of target
  orbits, containing every target orbit joined to a source orbit (`covered_orbitUnion`) → the terminal iff.
- **Carried fragments (byte-identical transport only; origin files C1-LA1 `Main.lean` `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb`
  and C2-LA1 `Main.lean` `a9cf3b81…7fc4`, receipt-bound; the digests below are those printed on the registrar headers of the frozen
  carry file `U1-Main.lean`, which the Stage 7 registrar re-verifies against the award receipts).** The set is C2-LA1's own carry
  pattern (C1-LA1 entries 1–21 and 24) plus C2-LA1 entries 22–30 and 32–76. **Not carried:** C1-LA1 entries 22–23 and 25–36
  (outside the dependency closure; entry 36 is a `theorem`); C2-LA1 entry 31 (duplicate of C1-LA1 entry 24, carried once as C1-LA1
  24); C2-LA1 entry 77 (a `theorem`, not used). If the build shows any excluded entry is needed, it is carried byte-identically
  and a carried `theorem` keyword becomes `lemma`, recorded (the C2-LA1 R7 precedent).

| Origin | Entry | Kind | Declaration | Fragment digest (registrar header) |
|---|---:|---|---|---|
| C1-LA1 | 1 | definition | `C4LA1.vertexDeletionIndepSetCount` | `7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48` |
| C1-LA1 | 2 | definition | `C4LA1.vertexDeletionForwardDifference` | `c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880` |
| C1-LA1 | 3 | definition | `C4LA1.IsFavorableAt` | `25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db` |
| C1-LA1 | 4 | definition | `C4LA1.IsGraphLeaf` | `65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5` |
| C1-LA1 | 5 | definition | `C5LA1.support` | `8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4` |
| C1-LA1 | 6 | definition | `C5LA1.leafSet` | `78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697` |
| C1-LA1 | 7 | definition | `C5LA1.H` | `55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d` |
| C1-LA1 | 8 | definition | `C5LA1.R` | `a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8` |
| C1-LA1 | 9 | definition | `C5LA1.indepSetsAvoiding` | `ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368` |
| C1-LA1 | 10 | definition | `C5LA1.indepSetCount` | `e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71` |
| C1-LA1 | 11 | definition | `C5LA1.forwardDifferenceDel` | `60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f` |
| C1-LA1 | 12 | definition | `C5LA1.aggregate` | `d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b` |
| C1-LA1 | 13 | definition | `E993Interior.taggedFamily` | `cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e` |
| C1-LA1 | 14 | definition | `E993Transport.indepFamily` | `73df20a8511ea67885d45631688cf693e58cebe9cfd5413ee67e782c1030ef9e` |
| C1-LA1 | 15 | definition | `E993Transport.tagWitnesses` | `113d952167528dfc045eb79961e8fbff0326da8f04277799436d6c8962022025` |
| C1-LA1 | 16 | definition | `E993Transport.activeWeight` | `074ed034729850d34722d0b1ceeb96d8362beaebf3b7a409cb3fab28a9850b93` |
| C1-LA1 | 17 | definition | `E993Transport.layerWeight` | `5ca5792309be23276583ac42cef294618e2471c97d3f58e67f0ab7980a3a83c3` |
| C1-LA1 | 18 | definition | `E993Transport.favorableLeaves` | `16b0c7672ed66c4cb53ba24d853764df160d6694f63b231346a2eb71c390ec77` |
| C1-LA1 | 19 | definition | `E993Transport.transportRel` | `b1b9ac6c8de56fa740a37e5bac0fa628f1d817c2e33625ca34dcab33a1100d95` |
| C1-LA1 | 20 | definition | `E993Transport.IsSaturatingFlow` | `a9d81c260914024d38f46ff5b564749d34f640674f9e9116685b4e7c631a48ac` |
| C1-LA1 | 21 | definition | `E993Transport.WeightedHall` | `63534ffbfcc4bb1297228e598da165dcf98732939cd51a5d7fda3e62bc518478` |
| C1-LA1 | 24 | lemma | `E993Transport.isGraphLeaf_of_mem_favorableLeaves` | `8977fb83111a46cace690984e23e2ffd54e2ea5233712bfeeca579f1debf75c8` |
| C2-LA1 | 22 | definition | `E993Transport.famMap` | `0072baac5b2a65b21aede9c79e8891f86bdef34d2980e9a53208382cf7977d91` |
| C2-LA1 | 23 | definition | `E993Transport.covered` | `5a7272b7318c108850de92e0d1b9c9e41d4497c119ede7ea146cea41ba520cf0` |
| C2-LA1 | 24 | definition | `E993Transport.cov` | `79c740a956373838c59f7b828443f589661e3cae84230b416b8a268947eebb9c` |
| C2-LA1 | 25 | definition | `E993Transport.supply` | `e981d867eed11f032fe42f04adfab048d213b00a6d921368dca040478b7cf2d7` |
| C2-LA1 | 26 | definition | `E993Transport.phi` | `402536db4c2a08c851c51a5300b19cb539a8d2ffb7061db2ee7310fcf6298d3c` |
| C2-LA1 | 27 | definition | `E993Transport.domain` | `7dfc3846302a694014b66cb07308bf1a7121d367355fa91b355276402f736e0b` |
| C2-LA1 | 28 | definition | `E993Transport.maxPhi` | `4fa71b0c0c71027117b594d26838d3e3bcf17a7a548afc2bd1c1be10bce21e70` |
| C2-LA1 | 29 | definition | `E993Transport.maximizers` | `0f1ec8e0a4b322f6872b4509b6445569b35ca73c606fc8b2e6ffe7bf73dacc32` |
| C2-LA1 | 30 | definition | `E993Transport.canonMin` | `a891a9957dd56410a6c26c6e0a696f953b6479017a3f79657f19f21a21ca4e9c` |
| C2-LA1 | 32 | lemma | `E993Transport.isIndepSet_map_aut` | `0218c4510d98bfd14545876f948ed1c4fc21dfad121c5968862d6a30f2185208` |
| C2-LA1 | 33 | lemma | `E993Transport.neighborFinset_map_aut` | `55722f0f2fde567d98d11288759dfbf9bcd06edef609d223faf006833b15daae` |
| C2-LA1 | 34 | lemma | `E993Transport.isGraphLeaf_map_aut` | `27fb04f91f99e571864377bc2c9dda81bdaa5982304b077d1fa5934da2f8a9b5` |
| C2-LA1 | 35 | lemma | `E993Transport.support_spec` | `5b8bd4a85c06e95592b5642cffb47b09a65b5d12a5283da9df27ba9968303787` |
| C2-LA1 | 36 | lemma | `E993Transport.support_map_aut` | `671013bdf19cf09c6551b7d227e4d40a8586bddbf37f1b1b3a9eba330caaeda0` |
| C2-LA1 | 37 | lemma | `E993Transport.tagWitnesses_map_aut` | `1671788dfd616725f1dd885f3a60d9b82f9cbac4b03f228f9b1be81b5c9ee5c5` |
| C2-LA1 | 38 | lemma | `E993Transport.mem_leafSet_iff` | `f134eff74e3c1ac28ac53feee79e696c47cd347804ab557f888504b837efb575` |
| C2-LA1 | 39 | lemma | `E993Transport.vertexDeletionIndepSetCount_map_aut` | `788c9f7b87b9cf67befd6279a725c5dba440f3f08103eef13c4fefd91c9c17c4` |
| C2-LA1 | 40 | lemma | `E993Transport.isFavorableAt_map_aut` | `2ac69fe3c20e10e7d1b68ea6b2984d104da1077ecc714c6a9bd334e6c2845129` |
| C2-LA1 | 41 | lemma | `E993Transport.favorableLeaves_map_aut` | `cdaeccdce48aca901d5f318337a2879bd01faee84f0d9f8892d7cf99b9c054fe` |
| C2-LA1 | 42 | lemma | `E993Transport.activeWeight_map_aut` | `ce09d63639fb8cf4c23e5b36e4a10a1b20efd88c596537a5ceffa7b03a0af5d2` |
| C2-LA1 | 43 | lemma | `E993Transport.map_map_symm_self` | `a8bb1a8f2cd10e6228d492555ec52bff4f19f78f44a6344c77adfb733100e392` |
| C2-LA1 | 44 | lemma | `E993Transport.transportRel_map_aut_mp` | `114a3006970f8ece479216d0b7251ba48795e06921a8c1f435b2f19147092105` |
| C2-LA1 | 45 | lemma | `E993Transport.transportRel_map_aut` | `fa934f4b3f3f7c61b6f5348b16858476ce8a55f29de8a6dd4663c844cea3e347` |
| C2-LA1 | 46 | lemma | `E993Transport.covered_union` | `2a287f11cbaebacfa11eb73a38fdebf5fc8e201d749159d1e21a2fc223157a29` |
| C2-LA1 | 47 | lemma | `E993Transport.covered_inter_subset` | `1cdc64296db75dee6bc1b2e6b11cd5dbb851f1e078792c1b1a99c6c2cc0d0108` |
| C2-LA1 | 48 | lemma | `E993Transport.cov_submodular` | `0832bf5e84a0a71d62c9b14760a9e01a4119aebb9eb4a667c35436c31109024e` |
| C2-LA1 | 49 | lemma | `E993Transport.supply_modular` | `316fc29399d51476d63d1ae89ea772caa5d95f2fb1eb5b505286e75bf09fbc6b` |
| C2-LA1 | 50 | lemma | `E993Transport.phi_supermodular` | `4bbae797abbbcd45af619f6767f9553257de2598b46de6b470cb8e8c01f7b76c` |
| C2-LA1 | 51 | lemma | `E993Transport.isMaximizer_union_inter` | `e63eddece8867130af7f1708e9e2988c895141b947eb69ddd51d915147c71fe0` |
| C2-LA1 | 52 | lemma | `E993Transport.domain_nonempty` | `a9dd9ed5792d5ae3b932be2cc8186180b88f0b95e750995c2565ef020079d701` |
| C2-LA1 | 53 | lemma | `E993Transport.maximizers_nonempty` | `f44ad9de98f03483d513c00d326b3e2717c00bdca148d37b14d0e21da76cb318` |
| C2-LA1 | 54 | lemma | `E993Transport.le_maxPhi_of_mem_domain` | `8f60f64d2df148ca649e6f9500964449bf6ae51375614cb79b92f48eb326d125` |
| C2-LA1 | 55 | lemma | `E993Transport.mem_domain_union` | `6b4743c54c4f1229c7e5d5231c5076cf4dc619086e5c53526d39fba00d3f8ebe` |
| C2-LA1 | 56 | lemma | `E993Transport.mem_domain_inter` | `1cdae55fce2180c150692ea2152b5b59658cd2a5feb58772f3fb6c9ec9343e87` |
| C2-LA1 | 57 | lemma | `E993Transport.isMaximizer_inter` | `93df92aa25edf0fb4c6148efd9505453c0ef124391964496b1f80360492b9b2e` |
| C2-LA1 | 58 | lemma | `E993Transport.canonMin_isMaximizer` | `efd3b98b1384ce8d2b27acdc767aabacfdbc736cb84778fa11d2c83e0dc4658e` |
| C2-LA1 | 59 | lemma | `E993Transport.mem_famMap` | `f9edabce19091026268c683d20f0b95a5374edf701f4bebdddffd67610b1004e` |
| C2-LA1 | 60 | lemma | `E993Transport.map_symm_map_self` | `d01f5b58b1b23ffb974e68cdbc871463e1276f0f12fd30fa694162d4e3a815a2` |
| C2-LA1 | 61 | lemma | `E993Transport.mem_indepFamily_map` | `467dec36b330ddd9329e656c2be6301d32027aac2d30731f1a067d815b391fb4` |
| C2-LA1 | 62 | lemma | `E993Transport.covered_famMap` | `189219f33af782ab5e0c9ce56ed6387a624ad323970ea7be8e49b4a40168254d` |
| C2-LA1 | 63 | lemma | `E993Transport.activeWeight_map_of_invariant` | `a4fdf241666c9df0acb82b097af5ce586d46fc09c0222a44b2170442bc2a145b` |
| C2-LA1 | 64 | lemma | `E993Transport.supply_famMap` | `1bd48c950fb804787bf4ff1b82d4e96a9bb7c30f80600ea7871d32ef45ccdeac` |
| C2-LA1 | 65 | lemma | `E993Transport.cov_famMap` | `cb28176c0cdb978ad49b451de6c83b190c57410fcbc2665f9dae0f295050c050` |
| C2-LA1 | 66 | lemma | `E993Transport.phi_famMap` | `c5b2c970d9d369075598d3afc159a5b2454eed8af1a5c7e498611af9ddb50ad0` |
| C2-LA1 | 67 | lemma | `E993Transport.famMap_mem_domain` | `31e42b7a9fd7531d477f1c305555a17e955aee02cae60282fc253392398e6814` |
| C2-LA1 | 68 | lemma | `E993Transport.famMap_mem_maximizers` | `eb961c1fe4915a605eff6aebbf850a1785a299badd5e4943814c2f8b1bcf6713` |
| C2-LA1 | 69 | lemma | `E993Transport.card_famMap` | `93cc12d32d0f4744a8d94b51571dc49390757d9904622a4752b5e49413834924` |
| C2-LA1 | 70 | lemma | `E993Transport.canonMin_famMap` | `2c437cddc3939ce82b57c8ff27ffde4ac5c6fc4085e3277bb3356f241c3b9a7c` |
| C2-LA1 | 71 | lemma | `E993Transport.covered_mono` | `6cba1002be4bf6d8cbd88235913b07327073e892fc08810c854d2ced9e34466c` |
| C2-LA1 | 72 | lemma | `E993Transport.canonMin_pos` | `41f34ed6b32394c459ada7d40f8c50fb55551cfa95981ef1ba85caa47cfd4b85` |
| C2-LA1 | 73 | lemma | `E993Transport.filter_eq_covered` | `9a29a3b33379ccee186cfd3084c87ea0147cb391455551483c51609f16a0559d` |
| C2-LA1 | 74 | lemma | `E993Transport.weightedHall_iff_phi_nonpos` | `18f181b429595f281f5e0b731b9de33eeafc9e0230a4b98803813022197a46b8` |
| C2-LA1 | 75 | lemma | `E993Transport.favorableLeaves_leaf` | `10999e3f271bc7f7b8ca9d2314e97aa35d38d817ed8471db243c65b50b3414f0` |
| C2-LA1 | 76 | lemma | `E993Transport.weightedHall_iff_invariant` | `147e76e0f226408a91e6921fb267a77fc01971b8044fed784600db33e4dc226a` |

- **New declarations (in-run; transported from the frozen `sources/c3-stage7-sources/` files with their origin digests; each a
  `lemma` except the definition and the terminal theorem; every keyword change from `theorem` to `lemma` is recorded).**
  - From U1 (`U1-Main.lean`, `f3b21020…b180`): `orbitOf` (definition), `mem_orbitOf_self`, `orbitOf_subset_of_mem_invariant`,
    `invariant_iff_orbitOf_subset`, `covered_orbitUnion`.
  - From C-U1-T (`C-U1-T-CritAdv.lean`, `8de15f02…b59b`): `crit_map_map_aut`, `crit_orbitOf_eq_of_mem`, `crit_orbitOf_subset`,
    `crit_orbits_pairwiseDisjoint`, `crit_biUnion_orbits`, `crit_supply_eq_sum_orbits`, `crit_sum_biUnion_orbits`, and the terminal
    theorem (renamed as above).
  - Optional and excluded by default: `supply_orbitOf`, `crit_supply_orbit_eq_card_mul` (product-form companions, outside the
    DAG). Not carried: `exists_transportRel_iff`, `regular_bipartite_shadow_bound`, C-U1-T's and C-U1-F's (NM) files.
- **Fences.**
  1. **Pre-registration gate SR-C3-1:** an isolated second read diffs the frozen statement against the registered (INV) text:
     `Γ` (all of `Aut(G)` vs an arbitrary subgroup); tag set (`F_p` vs any invariant degree-one set; weights); graph vs tree
     scope; orbit totals; orbit-arc definition; the invariant-family clause. The outcome decides the key as stated above.
  2. One terminal `theorem`; companions `lemma` (R29-N-12); they register `proved_informal` only.
  3. Registrar entries keyed by (origin award, entry number, fragment digest) (identity audit, residue 4).
  4. U1's unused `hXsub` binders are kept byte-identical (preferred) or their removal is recorded as a statement change.
  5. `open scoped Classical` supplies the decidability instance of the statement's `Finset.filter`; the fidelity review confirms
     it does not change the set denoted.
  6. Axioms exactly `propext`, `Classical.choice`, `Quot.sound`; no `sorry`, `admit`, `native_decide`, `axiom`; no `decide` over an
     enumeration. Pinned shared Mathlib by manual symlink of `.lake/packages`; `cd` into the pinned project before any
     `lake`/`lean`; never `lake update` or `lake clean`; kill by literal PID only.
- **Excluded conclusions (on the award's face).** No quotient feasibility; not (HALL) at any scope; not (LIFT) and not its
  feasibility; nothing for a proper subgroup of `Aut(G)`, another tag set or another weight; no flow is constructed or implied; no
  tree, eligibility or aggregate-sign content; nothing about the size or enumerability of orbit spaces (≈ 3·10^37 per layer at the
  `CB(8,·)` rows); C2-LA1's terminal content is not re-certified.
- **Repairs the adjudications require on the face.** U1's "remaining gap" wording struck; the axiom count is ten / seven; the carry
  wording as corrected (fidelity correction 6).
- **Attribution.** Definitions of record: C1-LA1 (entries 1–13: the r24/r25/r26 definition layers `C4LA1`/`C5LA1` and
  `E993Interior.taggedFamily`, carried from the first-interior award (Codex); entries 14–21: the `E993Transport` layer authored in
  r30 Cycle 1); C2-LA1 (supermodularity / `canonMin` apparatus;
  the invariant-family statement critic-derived by C-U1-T in Cycle 2); U1 (Claude Sonnet 5) for the orbit block; C-U1-T (Claude
  Opus 5.5) for the partition, class-union identity and terminal theorem; C-U1-F (Claude Opus 5.5) for the independent equivalent
  formalization; the U adjudicator for the kernel equivalence check; Codex (GPT-6) for the transport mechanism, the lower-region
  run and (LIFT)'s orbit-quotient conventions; r29 for the high tail that closes the complementary region (not used by this proof).

### Groups not funded (`no award attempted`)

| Group | Why | Smallest unproved or unformalized node | Next |
|---|---|---|---|
| GK-SIGN (B6) | STATED (second read owed); no Lean fragment exists; the whole seven-node DAG is unformalized. The bounded-attempt clause needs proved mathematics; I read that as second-read-confirmed, so it is not funded now | `n1`: a component-product lemma for `C5LA1.indepSetCount` over a disjoint union, and the explicit `G_k` on `Fin (3k+5)` | Cycle 4 U1 after SR-C3-2; draft statement as in the F adjudication (`favorableLeaves G p = C5LA1.leafSet G` and the closed form of `C5LA1.aggregate G (k+3)` over `P = 1 + 3X + X²`), frozen by the Cycle 4 synthesis |
| (NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` | The registered text is outside every Cycle 3 capsule, so no expected statement can be frozen; open nodes remain | (N1) the induced-matching encoding bijection (independent `k`-sets ↔ rank-`k` states of `Fin N → Option Bool`, deletion ↔ `Rdel`); then (N2) the sector correspondence with weight one; (N3) binder diff | Cycle 4 U1 |
| Lemma U (A2) | Compiled with no open node, but it formalizes no registered key (R11) | — | Hold as Lean text of record; SR-C3-7 settles the P10 alias; a key and award only if it is not an alias |
| E1 / D1–D3 | D1–D3 are bounded (a kernel check of ~10^6–10^7 big-integer inequalities by enumeration is outside the contract); E1's abstract form is formalizable but has no Lean text and is STATED | E1 abstract: type-path transport on `B_{n_1} × Λ^{n_2}` ⇒ saturating clone flow, plus the CB clone correspondence | After SR-C3-3 and the Cycle 4 uniform criterion (T2) |
| C1 (CD-2 / L2) | `conditional` (undischarged import) | `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)` on claw products | Cycle 4 T2 |

## Progress and stop-gate ruling

**Stop gate: ARMED; ruled on explicitly.**
- **Decisive event (a):** none. (HALL) is not `formally_verified` at §2's statement, and no uniform compensation theorem was
  proved. C3-LA1 is an equivalence of Hall conditions and cannot end the run.
- **Decisive event (b):** none. No (CUT) candidate exists at any eligible row; nothing needs a two-instrument confirmation or a
  cut second read.
- **(HALL):** still open, with the smallest unproved lemma stated under the headline verdicts.

**Material progress: yes.** On (HALL): at the three switch-necessary rows the open part shrank from "(CF-HALL), (O1), (O2) at
every eligible rank" to the first-rank coupled families (R1), with full (HALL) established at 174 of 177 ranks and at 166 ranks of
two further rows (D2, D3; `computer_assisted`, STATED). New lemmas at `proved_informal`: E1, E4, GK-SIGN, the verification lemma, B8,
B9, CD-3 (all STATED) and G1. New kernel-checked content: (INV)'s quotient clause (two formalizations, shown equal), Lemma U, (NM)'s
poset half. New adversarial findings: the first switch-necessary eligible tree outside the CB family (order 1427); whole-tree
switch necessity below the window (order 8); sector-deficient rows at `3p = 2M + 3` as well as `2M + 4`. Candid note (all three
adjudicators): the load-bearing mathematics this cycle is mostly critic-attributed; routes F1 and U2 did not execute their
central obligations.

**Plateau: no.** §5's plateau needs no material progress, no new `proved_informal` lemma and no new adversarial finding; all
three are present.

**Assessment for the controller checkpoint (ruling 28; not a stop-gate event).** Three cycles have produced formal
infrastructure ((WID), Hall ⇒ `S ≤ 0`, the invariant-family and — at this Stage 7 — quotient reductions) and instance-level
(HALL) evidence, but no parameter-uniform restricted-scope (HALL) theorem on any infinite family. The conjecture of R10, if true,
says (HALL) on trees is no easier than the primary aggregate at eligible ranks; the value of the mechanism would then lie in the
flow structure it exposes, not in a reduction of difficulty. The Cycle 4 portfolio below therefore weights the two
parameter-uniform targets (T2 on the CB pattern; F2 on `G_k`) and the one family formalization (U1). If Cycle 4 again yields only
instance-level (HALL) evidence, that is the pattern a plateau ruling at its close should weigh.

## Next-cycle portfolio

Six routes, two per orientation. Every route derives `F_p` at the rank, computes `x` through `α`, asserts `supply − capacity = S`
from independent sides, reports full row data for every eligible row, cites STATED items as STATED, and says on its face why any
deletion-only statement is not `E993-R23-LITERAL-DELETE-ONLY-HALL`. Routes that build on E1, GK-SIGN or E-a do so at their
second-read status.

1. **T1 `C4-T-01 CB-FIRST-RANK-COUPLED-ALLOCATION`.** Object: (HALL-COND) at `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492` for
   every family meeting `sec` and V⁺ (R1). Method: start from the E1 flow's residual `(1 − ρ_1)·w_F(A)` on `q = 1` targets (which
   include every sector switch image); shift an `ε`-share of switch-live sector sources onto their `u_i`-switch targets to unload
   the sector targets whose up-neighbourhoods are dominated by switch-dead members; rebalance V sources through their equal-weight
   `v`-free exits `B − v`; verify by exact branch-type generating-function summation, validated first by literal max-flow on small
   CB rows at sector-deficient ranks with `S ≤ 0`. Then the (O3) first ranks 577 and 673. Could close: full (HALL) at all 177
   eligible ranks of the three rows (`computer_assisted`, separate key) — the first eligible whole tree proved to saturate with
   switch arcs load-bearing.
2. **T2 `C4-T-02 CB-PATTERN-UNIFORM-CLONE-TRANSPORT`.** Object: the E1 criterion (`ρ_q ≤ 1` and the type-path inequalities)
   proved analytically for every `CB(d,m)` and every eligible `p`, via log-concavity and the mode of the rank sequence of
   `(1+y)^{qd−1}(1+2y)^{d(m−q)+1}`; extended to the heterogeneous CB pattern (covering `G(8^82, 7^2)` off the sector); C1's import
   discharged by a self-contained normalized-matching proof for claw products. Could close: a `proved_informal`
   parameter-uniform restricted-scope (HALL) theorem — every eligible rank with `3(p − 1) ≥ 2M + 2` of every CB-pattern tree — as a
   separate key and a Cycle 5 Lean target; C1 promoted from `conditional`.
3. **F1 `C4-F-01 POSITIVE-PART FEATURE-REFINED CLASS-UNION CUT SEARCH`.** Object: a (CUT) or its exclusion over
   `Aut`-invariant all-positive-weight families (C2-LA1; A1 makes a class-union test faithful) at the five sector-deficient CB
   first ranks and `G(8^82, 7^2)/448`: C-F1-T's reach-set lemma refined to positive-weight members and to feature counts (choke-out
   branches with no / exactly one support; choke-in branches with ≥ 1 / ≥ 2 absent leaves), class-aggregated max-flow; plus sector
   Hall under (D) ∪ (S) for every `X ⊆ sec` at `G(8^82, 7^2)/448`. Could close: a (CUT) candidate (decisive only after two
   instruments and an isolated second read), or the strongest adversarial record at six rows.
4. **F2 `C4-F-02 G_k UNIFORM HALL-OR-CUT AND THE SATURATION CONJECTURE`.** Object: (a) on `G_k` at `p = k + 3` (`k ≥ 3`), an
   explicit parameter-uniform saturating flow (deletion arcs saturate every computed row; the layers factor through `P^k`) or a
   cut in some `X ⊊ I_{p+1}`; (b) a closed-form adversarial test of the conjecture "on trees, `S ≤ 0` ⇒ saturation" (a
   counterexample at a non-eligible rank refutes only the conjecture; at an eligible rank it is a (CUT) candidate); (c) if time
   remains, the `T(m,2)` premises for `m ≥ M_0` by a local-limit bound at `λ₊`. Could close: the first parameter-uniform
   restricted-scope (HALL) theorem on an infinite eligible family (separate key), or a cut, or the conjecture's refutation.
5. **U1 `C4-U-01 LEAN-GK-SIGN-AND-NM-ENCODING`.** Seeds from C1-LA1 and C2-LA1 byte-identically (and C3-LA1's text if it closes;
   if it does not close, completing it is this route's first obligation). Object: GK-SIGN's DAG on the frozen definitions — the
   component-product lemma for `indepSetCount`, the explicit `G_k`, Lemma M, the aggregate identity — following C-F2-U's proof;
   then (NM)'s (N1) and (N2); the ℚ-flow verification lemma (B7) as a compiled companion. Could close: GK-SIGN and (NM)
   contract-ready for the Cycle 4 Stage 7.
6. **U2 `C4-U-02 SWITCH-SHARE-ALLOCATION-LEMMA`.** Object: an (SW) lemma — an exact rational switch-share allocation rule,
   verified by exact summation against literal max-flow on brute-forceable laboratories (the order-8 tree, `CB(4,1)/4`, the
   non-eligible `CB(d,1)` sectors, the eligible `CBstar(2,2,2)/7`), with eligibility and derived `F_p` as named hypotheses
   (B8/B9 show rescue fails without them); then its lift to the `CB(8,·)` coupled families, converging with T1 as the certificate
   primal. Could close: an (SW) outcome-B lemma at `proved_informal` on a named family, or a sharp statement of where per-class
   allocation fails, handed to F1.

## Registrations

The run-local registry stays frozen until the Cycle 3 second-reads packet seals (ruling 26). Every item below is registered at
the close, in this order, and only after the named isolated second read confirms it. Corrections come first.

**Second reads the controller should fund (isolated; one reader each unless batched as marked).**
- SR-C3-1 — (INV) binder diff for C3-LA1 (pre-registration gate).
- SR-C3-2 — GK-SIGN (both proofs; the exact identity).
- SR-C3-3 — E1 mark-clone reduction, including its distinction from the two refuted keys named above.
- SR-C3-4 — D1–D3 with an independent implementation of the E1 criterion; R1's composition and the (R-i) check.
- SR-C3-5 — E4 (CD-1 = L1) with G1.
- SR-C3-6 — E-a (order 1427), R2's replacement sentence, R3's rows (this synthesis's arithmetic).
- SR-C3-7 (batch) — B5, B7, B8, B9; the `CBstar` paraphrase correction; the P10 / Lemma U alias.

**Corrections (record entries, no §4 grade; first stated where marked).**
1. Cycle 2 standing-state switch-arc sentence → R2's replacement (STATED by the U and F adjudicators and this synthesis; SR-C3-6).
2. `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` scope note: holds at eligible ranks as registered; deficits exist at
   non-eligible ranks (four rows, E-f); the "any rank" paraphrase is false (C-U2-F, C-U2-T; U adjudicator; controller;
   SR-C3-7).
3. F1's "Cycle 2 whole-network saturation" and F2's P10-as-registered: struck (critics; adjudicators; no second read needed for a
   strike of a claim never registered).
4. C2-LA1 carry description (U adjudicator; confirmed here from the frozen carry file).
5. Proposed erratum: registrar numbering collision (this synthesis; controller assigns the id).

**Status updates.**
6. `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` → `formally_verified` at C3-LA1's scope if C3-LA1's `VERIFICATION-REPORT.json`
   says so and SR-C3-1 finds the registered text no wider; otherwise the separate key of C3-LA1 at `formally_verified` and a scope
   note on (INV). Attribution as on C3-LA1's face.

**New keys.**
7. `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE` — `proved_informal` — statement B6 at its exact scope (one family,
   one rank, every `k ≥ 1`). C-F2-U (exact identity), C-F2-T (bound; favorability of 3, 4), F2 (recurrence, `H_1`/`R_1`
   lemmas), F adjudicator (verification). SR-C3-2.
8. `E993-R30-CB-MARK-CLONE-TYPE-PATH-DELETION-TRANSPORT` — `proved_informal` — statement B1. C-T1-F, C-T1-U; T adjudicator. SR-C3-3.
9. `E993-R30-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-AWAY-FROM-FIRST-RANK` — `computer_assisted`, restricted scope — D1, D2, D3 at their
   exact `(T, p)` lists; weakest input key 8. C-T1-F (D1, D2), T adjudicator (D3, adjudicator-derived). SR-C3-4. (HALL) stays OPEN.
10. `E993-R30-POSITIVE-SECTOR-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM` — `proved_informal` — statement B2 with G1 (B3) as its
    reduction. C-T2-F, C-T2-U jointly; T2 (G1). SR-C3-5.

**Scope notes.**
11. (HALL): R1's open part (T adjudicator; this synthesis; SR-C3-4); E-a and R2 (C-F1-U; F adjudicator; controller; SR-C3-6); R3's
    rows (this synthesis; SR-C3-6); pointer to key 9; the conjecture of R10 at `conjecture` grade (C-U2-F), never evidence;
    (HALL-COND) at `X = I_{p+1}` on `G_k`, `k ≥ 3`, a necessary condition only (composition of (WID), the `G_k` key and key 7;
    `proved_informal` after SR-C3-2).
12. The `G_k` key: the aggregate sign (key 7) extends it; not an alias.
13. The primary aggregate: the GK-SIGN family note as worded under the headline verdicts (after SR-C3-2); no status change.
14. (NM): T1's Lemma 2.1 is (NM) on the leg poset (no new key); the poset half is compiled in scratch (no grade).
15. `R30-CB-RECORD` (Tier 3; `bounded_computation` unless marked): E-b, E-c, E-e, E-f, E-g; `W(x)` (B12); B8 and B9
    (`proved_informal` after SR-C3-7).

**Not registered.** C1 (CD-2 / L2) — `conditional`, import undischarged; B4 (G3 repaired; empty); B5, B7 (records; B7 is a
companion for any future certificate award); B10, B11 (companions); Lemma U (pending the alias ruling); `regular_bipartite_shadow_bound`;
T1's three proposed keys; F1's WLOG lemma; F2's `T(m,2)` C1.

## Continuation ruling

```text
headline_resolved: no
material_progress: yes
plateau: no
continue: yes
```

No decisive event occurred, and the plateau test fails, so the stop gate does not end the run. Cycle 3's Stage 7 runs one award
(C3-LA1). Cycle 4 is recommended with the portfolio above, subject to the controller checkpoint (ruling 28), which files the
mid-run review before Cycle 4 is dispatched; the checkpoint should weigh the assessment in the stop-gate section. Were the
checkpoint to end the run, a successor would inherit (HALL) OPEN with R1's smallest unproved lemma, the four formal awards
(C1-LA1, C1-LA2, C2-LA1, and C3-LA1 if it closes), keys 7–10 at their second-read grades, and the six-row adversarial frontier.

## Artifact inventory

All synthesis scratch is under `scratchpad/c3-S/` of the run root. Standard library only; `python3 -B`; exact integers and
`fractions`; no `__pycache__`; no background job was started, so none was running at the final write. Nothing was written under
`sources/` or anywhere else except this file.

| File | SHA-256 | Purpose |
|---|---|---|
| `syn_checks.py` | `c7f92689e69429441140b1b087daf18b5c8ad2967f0cc7d5da2d9d8bda9b4871` | GK-SIGN literal check `k = 1..5` (F_p derived, S from H_v/R_v, WID from literal weights); R3 sector ratios; D1 ρ decimals |
| `syn_checks_out.json` | `301a4d8c96b3b5a9d702be2007088477ddf6bd5197f5ed6eab47715363ee74c6` | output of `syn_checks.py` |
| `carry_table.py` | `7b150360523b7e855ddcf5c079464f242fcf4a0e68f208e001c802b33d561c06` | builds the C3-LA1 carried-fragment table from the registrar headers of the frozen carry file |
| `carry_table.md` | `bf79e8a7a435984cb6430b483d962ff689fa7770b33822ef68189f845567a978` | output of `carry_table.py` (inserted above) |
| `entries.txt` | `d8310cfbee087dda090068ce38619d1c2efa719204696fcf3fe9328bb7c9cec4` | all 91 registrar headers of the carry file (line, entry, kind, name, digest) |
| `SYNTHESIS.draft.md` | `08924e1fcbc8f8c26b2834f81bc18d06ed53b7f8f6785adbd155f66d2d8b83f1` | this synthesis before the table and inventory were inserted |

Replay (from `scratchpad/c3-S/`, foreground, under a minute): `python3 -B syn_checks.py` (writes `syn_checks_out.json`);
`python3 -B carry_table.py` (reads the frozen carry file; writes `carry_table.md`). `SYNTHESIS.draft.md` is this file before the
table and inventory were inserted.

Deliverable: `cycles/cycle-3/stage6/SYNTHESIS.md` (this file).
